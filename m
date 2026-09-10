Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B34A4A3864
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050179; cv=none; b=rU8r4IuZZ6Opx7vh33kuVxXt6DJxtguPtd8rt+GnS69HlD79emqjcDUQeZ5yEcu7scP8MVd6WmIHrxo55C/2ngG3uHW+9bRzPb51FoC/Itvz7RW7zXDB8D3aN88zUhZRukebqAVs9/LjVCm907Uzq83OBIgOntLKaCjL4FwiE9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050179; c=relaxed/simple;
	bh=QaAOEzqpwjn2+noKdD4quItX6sUqfaQf4QoITCbUby4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uOMt6YSHYgSAu4KIT2DWJJ5qxWOumJq/BJO1s7kqjAfNPsE/R+a/uXVOx758RqE/g5fRSIjXCP1b6YeCYhcMPTfP4oVGXCkqsbyiog9YwnKIQgCtKte+Pzob7g4O/P8xF3tH2i5LsjB0zE/Z7xFbtBcKTiDgj0xFMhWEei2JAqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XHu2gRFO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHu2gRFO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499AD1F00893;
	Thu, 10 Sep 2026 14:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789050174;
	bh=Nt4k2BXNuAx/uMNjpfENZ2irhLAEBgDlNs7JQeKKDD4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XHu2gRFOdEQ1gQC/9l0MgNjLrFoMqPKAgX9ThE3HPLShC3up/TAsTmbFtz67nZnLm
	 xI6FINOH7nEMayJO50wPJt4iGyU78IezWXKBs7AIokjLRUl6BiQrAwJWeClN/Hj0p0
	 67+/fKmn+FqEr4oIh8JCHLTfqAIj9x7/FXTvV0ZCojEAb90jhFmXdHEy5tVT0gtePr
	 DMhMKjdZorSWRaIW8BmXGgnTRxZQIN+Gcgk2rIIxdbs7E8L8iIK+/00uEL6/fsRTmy
	 aq7G6YvBsVgxJZt5NF42aOsMYlex6Drf3KA3Q74VrDVsn6VVghpuFQFHWB9KNGCcbc
	 W0bT131t5T0Lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] nvmem: stm32: add TAMP nvmem driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrice Chotard" <patrice.chotard@foss.st.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-upstream_nvram_reworked-v1-3-521c16175cef@foss.st.com>
References: <20260910-upstream_nvram_reworked-v1-0-521c16175cef@foss.st.com>
 <20260910-upstream_nvram_reworked-v1-3-521c16175cef@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 14:22:53 +0000
Message-Id: <20260910142254.499AD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Hardware I/O errors and permission denials during unaligned access=
es are silently swallowed.
- [High] Endianness mismatch between aligned block accesses and unaligned b=
yte accesses.
- [High] Non-atomic read-modify-write introduces race conditions and data c=
orruption during byte-sized register updates.
- [Medium] Probe function unconditionally transforms all syscon errors into=
 infinite probe deferrals.
- [Medium] Devres memory leaks for temporary allocation resources during de=
vice probe.
--

commit 3cf1f845a1eac3aa55c1581b866a9ae2309dca59
Author: Simeon Marijon <simeon.marijon@foss.st.com>
Subject: nvmem: stm32: add TAMP nvmem driver

This commit introduces the STM32 TAMP nvmem driver to expose backup
registers as nvmem cells under the nvram node in the device tree.

> diff --git a/drivers/nvmem/stm32-tamp-nvram.c b/drivers/nvmem/stm32-tamp-=
nvram.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/nvmem/stm32-tamp-nvram.c
[ ... ]
> +static bool *stm32_tamp_get_compartment_owner_mp2x(struct stm32_tamp_nvr=
am_priv *priv)
> +{
[ ... ]
> +	compartment_owner =3D devm_kcalloc(dev,
> +					 NB_COMPARTMENT_STM32MP2,
> +					 sizeof(*compartment_owner),
> +					 GFP_KERNEL);
> +
> +	if (!compartment_owner)
> +		return ERR_PTR(-ENOMEM);

[Severity: Medium]
Does this code leak the compartment_owner array? This devm-allocated array
is returned to configure access rights during stm32_tamp_nvram_probe(), but=
=20
it appears to remain in memory permanently without being freed after use.

[ ... ]
> +static int stm32_tamp_nvram_write_byte(struct stm32_tamp_nvram_priv *pri=
v, u32 offset, u8 byte)
> +{
[ ... ]
> +	if (!stm32_tamp_nvram_rights(priv, reg_idx, false))
> +		return -EIO;
> +
> +	if (regmap_read(priv->bkpregs_regmap, offset_aligned, &read_value))
> +		return -EIO;
> +
> +	to_be_writen_value =3D read_value & ~(0xFFUL << byte_in_word * 8);
> +	to_be_writen_value |=3D  (u32)byte << (byte_in_word * 8);
> +
> +	return regmap_write(priv->bkpregs_regmap, offset_aligned, to_be_writen_=
value);
> +}

[Severity: High]
Can this race with other concurrent byte writes to the same 32-bit register=
?=20
The regmap lock is dropped between regmap_read() and regmap_write(), which
could cause overlapping unaligned byte updates to clobber each other. Should
this use regmap_update_bits() instead to ensure atomicity?

[ ... ]
> +static int stm32_tamp_nvram_read(void *context, unsigned int offset, voi=
d *buf, size_t bytes)
> +{
[ ... ]
> +	while (i < total)  {
> +		reg_idx =3D i / sizeof(u32);
> +		if (i + sizeof(u32) <=3D total && IS_ALIGNED(i, sizeof(u32))) {
> +			if (!stm32_tamp_nvram_rights(priv, reg_idx, true)) {
> +				dev_dbg(dev, "Backup register %u is not allowed to be read\n",
> +					reg_idx);
> +				temp_u32 =3D 0;
> +			} else if (regmap_read(priv->bkpregs_regmap, i, &temp_u32)) {
> +				return -EIO;
> +			}
> +			memcpy(buf_u8, &temp_u32, sizeof(u32));

[Severity: High]
Does this memcpy() introduce an endianness mismatch on Big Endian systems?
The aligned path copies the host-native integer directly into the stream,
while the unaligned byte path below processes bytes in Little Endian order
via bit shifts.

> +			buf_u8 +=3D sizeof(u32);
> +			i +=3D sizeof(u32);
> +		} else {
> +			ret =3D stm32_tamp_nvram_read_byte(priv, i, &byte);
> +			if (ret) {
> +				dev_dbg(dev, "Backup register %u is not allowed to be read\n",
> +					reg_idx);
> +				byte =3D 0;
> +			}

[Severity: High]
Is it intentional to swallow hardware I/O errors here? If
stm32_tamp_nvram_read_byte() fails (e.g., returns -EIO), the error is
intercepted and masked as a valid read of 0x00, which might hide hardware
faults from the caller.

> +			*buf_u8 =3D byte;
> +			i++;
> +			buf_u8++;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int stm32_tamp_nvram_write(void *context, unsigned int offset, vo=
id *buf, size_t bytes)
> +{
[ ... ]
> +	while (i < total)  {
> +		reg_idx =3D i / sizeof(u32);
> +		if (i + sizeof(u32) <=3D total && IS_ALIGNED(i, sizeof(u32))) {
> +			if (stm32_tamp_nvram_rights(priv, reg_idx, false)) {
> +				memcpy(&temp_u32, buf_u8, sizeof(u32));

[Severity: High]
Similar to the read path, does this memcpy() reverse the intended byte
order on Big Endian architectures when compared to the unaligned branch?

> +				if (regmap_write(priv->bkpregs_regmap, i, temp_u32))
> +					return -EIO;
> +			} else {
> +				dev_dbg(dev, "Backup register %u is not allowed to be written",
> +					reg_idx);
> +			}
> +			buf_u8 +=3D sizeof(u32);
> +			i +=3D sizeof(u32);
> +		} else {
> +			ret =3D stm32_tamp_nvram_write_byte(priv, i, *buf_u8);
> +			if (ret)
> +				dev_dbg(dev, "Backup register %u is not allowed to be written",
> +					reg_idx);

[Severity: High]
Does this drop hardware I/O errors? If the unaligned write fails, the error
is ignored rather than propagated to the caller, which might give the false
impression that the write was successful.

> +			i++;
> +			buf_u8++;
> +		}
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static int *stm32_tamp_nvram_get_backup_zones(struct stm32_tamp_nvram_pr=
iv *priv)
> +{
[ ... ]
> +	/* Get the n-1 frontiers of zone within the tamp configuration register=
s */
> +	for (zone_idx =3D 0; zone_idx < nb_zones - 1; zone_idx++) {
> +		const struct reg_field reg_field =3D priv->data->config_reg_fields[zon=
e_idx];
> +		struct regmap_field *field =3D devm_regmap_field_alloc(dev,
> +								     tamp_regmap,
> +								     reg_field);

[Severity: Medium]
Does this code leak the regmap_field allocations? These fields are allocated
in a loop to extract register offsets during initialization, but they do not
appear to be freed (e.g., via devm_regmap_field_free) after use.

[ ... ]
> +static int stm32_tamp_nvram_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	priv->config_regmap =3D syscon_node_to_regmap(dev->parent->of_node);
> +	if (IS_ERR(priv->config_regmap)) {
> +		dev_dbg(dev, "Deferring till parent probed\n");
> +		return -EPROBE_DEFER;
> +	}

[Severity: Medium]
Does this unconditionally transform all syscon errors into infinite probe
deferrals? If syscon_node_to_regmap() fails with a fatal error such as
-EINVAL, returning -EPROBE_DEFER masks the true error code and could cause
boot delays or hangs. Should this use dev_err_probe() and return the
specific error code instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-upstream_n=
vram_reworked-v1-0-521c16175cef@foss.st.com?part=3D3
