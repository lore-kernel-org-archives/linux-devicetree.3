Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FCD35A39F
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754824; cv=none; b=Ddb0GnmMjcz/ZgDI8yCw9M38g3mu/Q+iOBheZspCkgKCpH62dHkugDqcJRccwiL57eOWDkv2FwIstnczchfN/FIk0hOQ3PmkfvGwom9qF/PHLRWr/yZmNp2kbgIVA048VinUFCjmVjUAqxm9gHWEtyG/lSI13zmjA4Ps8I0s4u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754824; c=relaxed/simple;
	bh=ABllz823j54hsZzOBzv6HeTaGsjQO/6M1te+YZBi1lU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cIei7IMeENZk7OaGXXeZhGXTnAC/lpQWMFcJOB7x1i3NJeWkryA3GlaUjhuG68s6pB4bc50GeC8CcTUSlb0vjVClR/NOzeMw9oBMEk94a441QiANMomCD5H4zFoTWx8axWkMLAnOYxX6mWaIibNRU8BXVpj+tTUjRtYjzlJKsuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7W5iINQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7W5iINQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6FB1F000FF;
	Wed, 30 Sep 2026 07:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790754823;
	bh=VTyDewZ7pXzCrhbes5ZNt5zc0Nv5iO9KCRanYr4GdWM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U7W5iINQhVJZA1PLmG4iUer0enfmxnCCkzWEErzFrkzXsroGdjjkvI0GvZnF8lyUC
	 J5lsnmElFhg0Ec7XfiN7s39d7bKwM23aRq6GIY22T9KD/Sa7OzzdYXilzu359T15S4
	 bkV5vMVy00lOlAjslOUEin7jhKXXEfdDKSFUW33/J2r9XjGapKnwnCHxkeh64NX74Z
	 a7T7K7FmiaNH3GYT9lWxSIS7AqqMo49RHL9+7AqxSUCip4ga/JW6Q9qe6VHmjoDC6h
	 WTV6rIcXQ07veX2zKrOwiguMmA5dyg0JtiEi/87jrymkm0GIUOg8VDtnl24yyzCSdK
	 oc5PSa97BKiDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] nvmem: stm32: add TAMP nvmem driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrice Chotard" <patrice.chotard@foss.st.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260930-upstream_nvram_reworked-v2-3-cfda749ee0b7@foss.st.com>
References: <20260930-upstream_nvram_reworked-v2-0-cfda749ee0b7@foss.st.com>
 <20260930-upstream_nvram_reworked-v2-3-cfda749ee0b7@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 07:53:42 +0000
Message-Id: <20260930075343.1B6FB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] nvmem: stm32: mismatch in DT matching can cause out-of-bounds ar=
ray read
- [Medium] nvmem: stm32: endianness mismatch between word and byte NVMEM ac=
cesses
- [Low] nvmem: stm32: incompatible pointer type assignment causes compiler =
warning
- [Low] nvmem: stm32: off-by-one error in max_register configuration
--

commit 5c38f8fb5f67e48c161b92fd1e0bd910ac6adfd9
Author: Simeon Marijon <simeon.marijon@foss.st.com>

nvmem: stm32: add TAMP nvmem driver

This commit adds support for exposing the STM32 TAMP backup registers as
nvmem cells. It includes driver implementations for handling register read,
write, and access permissions for different hardware zones on STM32MP1
and STM32MP2.

> diff --git a/drivers/nvmem/stm32-tamp-nvram.c b/drivers/nvmem/stm32-tamp-=
nvram.c
> new file mode 100644
> index 0000000000000..c10c5ed5d2732
> --- /dev/null
> +++ b/drivers/nvmem/stm32-tamp-nvram.c
[ ... ]
> +static const struct regmap_config stm32mp1_tamp_nvram_regmap_cfg =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.readable_reg =3D stm32_tamp_nvram_readable_bkpreg,
> +	.writeable_reg =3D stm32_tamp_nvram_writeable_bkpreg,
> +	.max_register =3D 0x80,
> +};

[Severity: Low]
Could the max_register be slightly off-by-one here? Since MP15 has 32
registers (128 bytes), the highest valid register offset should be 0x7C.
Setting this to 0x80 theoretically allows regmap to accept accesses one
register beyond the valid range.

> +
> +static const struct regmap_config stm32mp2_tamp_nvram_regmap_cfg =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.readable_reg =3D stm32_tamp_nvram_readable_bkpreg,
> +	.writeable_reg =3D stm32_tamp_nvram_writeable_bkpreg,
> +	.max_register =3D 0x200,
> +};

[Severity: Low]
Similarly, for MP25 with 128 registers (512 bytes), shouldn't the maximum
valid offset be 0x1FC rather than 0x200?

[ ... ]
> +static int stm32_tamp_nvram_read(void *context, unsigned int offset, voi=
d *buf, size_t bytes)
> +{
[ ... ]
> +		reg_idx =3D i / sizeof(u32);
> +		if (i + sizeof(u32) <=3D total && IS_ALIGNED(i, sizeof(u32))) {
> +			if (!stm32_tamp_nvram_rights(priv, reg_idx, true)) {
> +				dev_dbg(dev, "Backup register %u is not allowed to be read\n",
> +					reg_idx);
> +				temp_u32 =3D 0;
> +			} else {
> +				ret =3D regmap_read(priv->bkpregs_regmap, i, &temp_u32);
> +				if (ret)
> +					return ret;
> +			}
> +			memcpy(buf_u8, &temp_u32, sizeof(u32));

[Severity: Medium]
Will this memcpy cause an endianness mismatch on Big Endian architectures?=
=20

The regmap_read() function gives a natively ordered u32, but directly
copying it into the byte buffer will result in byte-swapped data compared to
the byte-aligned fallback path. Do we need an explicit endian conversion
(like cpu_to_le32s) here instead of a raw memcpy?

> +			buf_u8 +=3D sizeof(u32);
> +			i +=3D sizeof(u32);
> +		} else {
[ ... ]
> +static int stm32_tamp_nvram_write(void *context, unsigned int offset, vo=
id *buf, size_t bytes)
> +{
[ ... ]
> +	i =3D offset;
> +	while (i < total)  {
> +		reg_idx =3D i / sizeof(u32);
> +		if (i + sizeof(u32) <=3D total && IS_ALIGNED(i, sizeof(u32))) {
> +			if (stm32_tamp_nvram_rights(priv, reg_idx, false)) {
> +				memcpy(&temp_u32, buf_u8, sizeof(u32));
> +
> +				ret =3D regmap_write(priv->bkpregs_regmap, i, temp_u32);

[Severity: Medium]
Does this have the same endianness concern for Big Endian CPUs? Reading raw
NVMEM buffer bytes directly into a native CPU integer via memcpy might flip
the byte order before the regmap_write().

[ ... ]
> +static int stm32_tamp_nvram_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct stm32_tamp_nvram_priv *priv;
> +	struct resource *res;
> +	struct device_node *of_node;
> +	const struct of_device_id *of_id;
> +	void __iomem *base_addr;
> +	unsigned int *zones_end;
[ ... ]
> +	priv->idx_bkpreg_zones_end =3D stm32_tamp_nvram_get_backup_zones(priv);
> +	if (IS_ERR(priv->idx_bkpreg_zones_end))
> +		return dev_err_probe(dev, PTR_ERR(priv->idx_bkpreg_zones_end),
> +				     "Can't determine protection zone\n");
> +
> +	zones_end =3D priv->idx_bkpreg_zones_end;

[Severity: Low]
Can this assignment cause a compiler warning for differing signedness?=20

The driver assigns priv->idx_bkpreg_zones_end (an int *) to zones_end
(an unsigned int *) without casting, which might break builds enforcing
-Werror.

[ ... ]
> +	if (of_device_is_compatible(pdev->dev.of_node,
> +				    "st,stm32mp25-tamp-nvram")) {
> +		priv->bkpreg_access =3D stm32_tamp_get_access_rights_mp2x(priv);
> +
> +		if (IS_ERR(priv->bkpreg_access))
> +			return PTR_ERR(priv->bkpreg_access);
> +
> +		dev_dbg(dev, "\n"
> +			"Zone 1-RIF1 %3d - %3d %c%c\n"
[ ... ]
> +			zones_end[BKPREG_PROTECTION_ZONE_3_RIF0] + 1,
> +			zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
> +						true) ? 'R' : '-',

[Severity: Medium]
Is it possible for a misconfigured device tree to trigger an out-of-bounds
array read here?

If a device tree node contains multiple compatible strings (e.g., both MP15
and MP25), of_match_node() determines priv->data based on the first match in
the driver's list (MP15). This allocates only a 3-element array for
idx_bkpreg_zones_end.

However, if this of_device_is_compatible() check for
"st,stm32mp25-tamp-nvram" also evaluates to true, the driver will branch
here and read up to index 6 of the zones_end array, reading past the end of
the 3-element allocation.=20
   =20
Should the control flow rely on the already resolved priv->data->nb_zones
instead of re-evaluating the compatible string?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-upstream_n=
vram_reworked-v2-0-cfda749ee0b7@foss.st.com?part=3D3
