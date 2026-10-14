Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2098712B94
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964442; cv=none; b=m9LtyyTE0MettHqYt6srEbuC6gN/OPTsda6yPdFKcGOYg0W009PpmTh12bX9lxi0MMNXPhwnAOhBN70PDe0b3+6PCHDx1JyKCWQSKSacJdC6NOnWCdc1QMiX0GsXZlU3Bn+FxzGwLRTFDIdBwDpwDvjLyqh+OamkZ1mx+i8D2zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964442; c=relaxed/simple;
	bh=yVKH7rNz+J3cvjQxxrSMMiXJZV3rqzqWv40e7Y31h1Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=iFxmT7J0FaToud2JOijCzS8w2NyxLawzuauDmyu+N8lJZ03icFWwRHmdIEKSmNftsM93HFTHOvLID1jTzjGFp88yDJrpoficZUQsoOlClhe/CJhhvn9kW/ZHDmbu1DlsI8TF0fR60ndWXiWp9WN4UHE0vvWw8pBOMm4SMG70vmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEUBI6ZM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEUBI6ZM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64EA51F000FF;
	Wed, 14 Oct 2026 07:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791964440;
	bh=HOiTKYiucM7r64NYxuNDlmUrtabJvfR4a8JF6hth8Ts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CEUBI6ZMYo+Ygk5hsW2lm8FP+UkLrjSrvVpvnml4gNJUNH5W1WRUc4Dn9F60USwq7
	 kTOcqv8HhIo9UkYmDZX9l+hyKgLX+IJ/RyTGvH4LZg9/y7C+r8I3ajb2nN5EtTN7Cq
	 HlP4eOGoX7Ths3OYC0FgzPsdt0k53ODJuwLCOcMcy5KuCTNN5+abFn0arqnvJdccnY
	 MV7zT/GNk34V1SoZxyKOaWhHiEcOY2chi+bzloTUwOZYquZMnGiVasmbmAD4jHeq0g
	 w0W8un1NTzt+kA3CcBIxbb2j67qvuuMog/jZpji9Wf0bq6nZnloG/qGYz9SYzoL334
	 /YQZRgiZcEHmw==
Message-ID: <sashiko-outbox-170968@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Inochi Amaoto" <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014074516.240247-3-inochiama@gmail.com>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-3-inochiama@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 07:53:59 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] mm: heap buffer overflow in sg2044_efuses_read allocation
- [High] nvmem: sophgo-efuse: heap buffer overflow due to word-to-byte calc=
ulation error
- [High] nvmem: sophgo-efuse: uninitialized mutex triggers kernel panic or =
undefined behavior
- [High] locking: uninitialized mutex efuse->mutex causes crash
- [Low] nvmem: sophgo-efuse: sg2044_efuses_read_strip() returns negative er=
ror code as u32
- [Low] endianness: byte order reversal on big-endian via memcpy
--

commit ff98cc30d6e5cb08398ecc6957a9d51875c1b34b
Author: Inochi Amaoto <inochiama@gmail.com>

nvmem: Add Sophgo SG2044 eFuse driver

This patch adds a new nvmem driver for Sophgo eFuses used on system-on-chips
such as the SG2044. The driver exposes the shadow registers, which are
organized as 32-bit values, as memory-mapped io.

> diff --git a/drivers/nvmem/sophgo-efuse.c b/drivers/nvmem/sophgo-efuse.c
> new file mode 100644
> index 0000000000000..5f90adaf8e4fc
> --- /dev/null
> +++ b/drivers/nvmem/sophgo-efuse.c
[ ... ]
> +static u32 sg2044_efuses_read_strip(struct sophgo_efuses *efuse,
> +				    unsigned int offset, u32 *strip)
> +{
> +	u32 val =3D FIELD_PREP(SG2044_EFUSE_ADR_ADDR, offset);
> +	int ret;
> +
> +	guard(mutex)(&efuse->mutex);
> +
> +	writel(val, efuse->base + SG2044_EFUSE_ADR);
> +
> +	ret =3D sg2044_efuse_set_mode(efuse, SG2044_EFUSE_MODE_READ);
> +	if (ret < 0)
> +		return ret;

[Severity: Low]
Does this code return a negative error code as a u32?

sg2044_efuse_set_mode() returns an int (such as -ETIMEDOUT), which gets cast
to a large unsigned integer when returned here. Even though the caller
assigns it back to an int ret, returning negative values via an unsigned ty=
pe
is poor practice and obscures the logic.

Should the return type of sg2044_efuses_read_strip() be int instead of u32?

[ ... ]
> +static int sg2044_efuses_read(void *context, unsigned int offset, void *=
val,
> +			      size_t bytes)
> +{
> +	struct sophgo_efuses *efuse =3D context;
> +	unsigned int start, start_offset, end, i;
> +	u32 value;
> +	u8 *buf;
> +	int ret;
> +
> +	start =3D rounddown(offset, SG2044_EFUSE_ALIGN);
> +	end =3D roundup(offset + bytes, SG2044_EFUSE_ALIGN);
> +	start_offset =3D offset - start;
> +
> +	start /=3D SG2044_EFUSE_ALIGN;
> +	end /=3D SG2044_EFUSE_ALIGN;
> +
> +	ret =3D readl_poll_timeout(efuse->base + SG2044_EFUSE_MD, value,
> +				 (value & SG2044_EFUSE_BOOT_DONE),
> +				 1, SG2044_BOOT_TIMEOUT);
> +	if (ret < 0)
> +		return ret;
> +
> +	buf =3D kzalloc(end - start, GFP_KERNEL);

[Severity: Critical]
Does this allocate an undersized buffer?

The variables start and end were divided by SG2044_EFUSE_ALIGN (4), changing
them from byte offsets to 32-bit word indices. The allocation size is exact=
ly
end - start bytes, effectively allocating only 1 byte per 4-byte word inste=
ad
of (end - start) * SG2044_EFUSE_ALIGN.

> +	if (!buf)
> +		return -ENOMEM;
> +
> +	for (i =3D start; i < end; i++) {
> +		ret =3D sg2044_efuses_read_strip(efuse, i, &value);
> +		if (ret)
> +			goto failed;
> +
> +		memcpy(&buf[(i - start) * 4], &value, SG2044_EFUSE_ALIGN);

[Severity: Critical]
Because the buffer allocation size is implicitly treated as words but
allocated as bytes, this loop writes 4 bytes per word iteration into the
undersized buffer, leading to an out-of-bounds heap write.

[Severity: Low]
Additionally, can this cause a byte order reversal on big-endian
architectures?

readl() returns a 32-bit integer in native endianness. The loop then uses
memcpy() to write this native integer's bytes into a byte buffer.

On big-endian systems, this places the most-significant byte at the lowest
address, reversing the intended nvmem byte-stream order.

[ ... ]
> +static int sophgo_efuses_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct sophgo_efuses *efuse;
> +	struct nvmem_config config =3D {
> +		.dev =3D &pdev->dev,
> +		.add_legacy_fixed_of_cells =3D true,
> +		.read_only =3D true,
> +		.reg_read =3D sg2044_efuses_read,
> +		.stride =3D 1,
> +		.word_size =3D 1,
> +		.name =3D "sophgo-efuse",
> +		.id =3D NVMEM_DEVID_AUTO,
> +		.root_only =3D true,
> +	};
> +
> +	efuse =3D devm_kzalloc(dev, sizeof(*efuse), GFP_KERNEL);

[Severity: High]
Is efuse->mutex left uninitialized?

This allocates the efuse structure (zero-initialized), but mutex_init() is
never called on efuse->mutex anywhere in the probe function.

Later, reading from the eFuse calls sg2044_efuses_read_strip() which attemp=
ts
to acquire the lock:

    guard(mutex)(&efuse->mutex);

Locking a zero-initialized mutex will cause a null-pointer dereference crash
on lock contention because the internal wait lists are not initialized.

Should mutex_init(&efuse->mutex) be added after allocation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014074516.2402=
47-1-inochiama@gmail.com?part=3D2
