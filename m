Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E8732B99F
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977718; cv=none; b=bOqJ+muVa06Cw2dcjhAOdUgYHfUTxEHNrtWe5Qr8Lzd1m3uZP9o45Lu2/fJUVKfkCw9ehD04CD8dm2BUb0aplAzHxtYTN0n5wlETkrY35JJLBJ0tpch8JJqE5qAgNVk92YcGrFlG9e7Ywyy0ENe5pwMyAWsMpC1eQwQR8+iJtsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977718; c=relaxed/simple;
	bh=kyAkFC9Ue/am4+Ez/T1qn33ckjj8MrrX3eF+Q1Vjal8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eRSdAV5Xb+f3MYy91jf0yhfqEimvTv+d0luL9+9fwTRIhBFWzg/E30O+1wFcWx5vNSB98/wIaITkWaLt543ssJbOwJU8/gGUBJ5XjhxyHUWY4KBjoMqES01xXxma6Vo7GTCN5cb/YYY8l4cD9bd2A7OU2T/1MjL5o4U999kWRes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQ8c3yBV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQ8c3yBV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE881F000FF;
	Mon, 21 Sep 2026 08:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789977716;
	bh=EhRgRZMABb0St6j/QUD6iM6JM/bV1eifEhcZ2A2Nui0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UQ8c3yBVYwCAxixl5bjurLP3VeuIC9wqxcJbkN59tzE+Y+SdUfzcgSTalY58CWnue
	 /C0hMIBOhghfv4vlrZyLdX4pntyntiVPOa015OdnYoKxa70/8j+mhkrJGC4f7psNhv
	 S3b6aKecPUT+CM0VLAKOBKLrl/OTBSvsVeInzibn855iue8nopxNwiFbiezo87JUck
	 rSz6M6+KC6w0ko6JrzzbKwpPqBi51of/5cNelJbnwCjQk77m70Y9UrTissmEPLU+o7
	 TYf07OzbA3SkwHiJ8LFRQwhPyui/LX0unaTTkRKmbKW7LRmDo1pQmx8JtFWxI+EzZq
	 szw7zzdCepIFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] nvmem: add mt6323 PMIC EFUSE driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921-mt6323-nvmem-v5-2-2f5d308369f0@protonmail.com>
References: <20260921-mt6323-nvmem-v5-0-2f5d308369f0@protonmail.com>
 <20260921-mt6323-nvmem-v5-2-2f5d308369f0@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 08:01:55 +0000
Message-Id: <20260921080156.5BE881F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] nvmem: buffer overflow and unaligned memory access in efuse read l=
oop
- [Medium] nvmem: EFUSE data exposed with host-dependent endianness
- [Medium] nvmem: NULL pointer dereference in probe when parent is missing
- [Medium] nvmem: module autoloading fails without MODULE_ALIAS
--

commit 3543415716c7fda0e6f5e6edb62e4ed761b35afd
Author: Roman Vivchar <rva333@protonmail.com>

nvmem: add mt6323 PMIC EFUSE driver

This commit adds support for the EFUSE controller found in the Mediatek
MT6323 PMIC. The MT6323 EFUSE stores 24 bytes of hardware-related data,
such as thermal sensor calibration values.

diff --git a/drivers/nvmem/mt6323-efuse.c b/drivers/nvmem/mt6323-efuse.c
new file mode 100644
index 0000000000000..de5e30215c22d
--- /dev/null
+++ b/drivers/nvmem/mt6323-efuse.c
[ ... ]
> +static int mt6323_efuse_read(void *context, unsigned int offset, void *v=
al,
> +			     size_t bytes)
> +{
> +	struct regmap *map =3D context;
> +	u16 *buf =3D val;
> +	u32 tmp;
> +	int ret;
> +
> +	/*
> +	 * A manual loop using regmap_read is required because PWRAP is not
> +	 * a continuous MMIO space, but rather a FSM that doesn't implement the
> +	 * necessary read callback for the regmap_read_raw and regmap_read_bulk
> +	 * functions.
> +	 */
> +	for (size_t i =3D 0; i < bytes; i +=3D sizeof(*buf)) {

[Severity: High]
Could this loop overflow the allocated val buffer and cause unaligned memory
accesses?

The NVMEM core API nvmem_device_read() does not enforce that the requested
bytes count is a multiple of word_size. If an in-kernel consumer requests an
odd number of bytes (for example, 1 or 3), the loop will run an extra
iteration and unconditionally write a full 16-bit word. This will overflow
the caller's allocated val buffer by 1 byte.

Additionally, if val is not 16-bit aligned, this causes an unaligned memory
access.

> +		ret =3D regmap_read(map, MT6323_EFUSE_DOUT_BASE + offset + i, &tmp);
> +		if (ret)
> +			return ret;
> +
> +		*buf++ =3D tmp;

[Severity: Medium]
Does this expose the EFUSE data with a host-dependent endianness?

The regmap_read() function returns a CPU-endian 32-bit integer, which is
assigned to tmp. Writing this integer into a 16-bit buffer using native CPU
byte order means that on big-endian architectures, the bytes will be swapped
compared to little-endian architectures, breaking the expected NVMEM byte
stream consistency.

> +	}
> +
> +	return 0;
> +}
> +
> +static int mt6323_efuse_probe(struct platform_device *pdev)
> +{
> +	struct mt6397_chip *mt6323 =3D dev_get_drvdata(pdev->dev.parent);

[Severity: Medium]
Will this cause a NULL pointer dereference if the parent device pointer is
missing?

The driver has an of_match_table. If it is instantiated directly from a root
Device Tree node rather than being instantiated as an MFD child, the parent
device pointer pdev->dev.parent will be NULL. Calling dev_get_drvdata() on a
NULL parent dereferences it immediately without checks, leading to a crash.

[ ... ]
> +static struct platform_driver mt6323_efuse_driver =3D {
> +	.probe =3D mt6323_efuse_probe,
> +	.driver =3D {
> +		.name =3D "mt6323-efuse",
> +		.of_match_table =3D mt6323_efuse_of_match,
> +	},
> +};
> +module_platform_driver(mt6323_efuse_driver);
> +
> +MODULE_DESCRIPTION("MediaTek MT6323 PMIC EFUSE driver");
> +MODULE_LICENSE("GPL");

[Severity: Medium]
Will module autoloading fail without a MODULE_ALIAS declaration here?

On systems where the Device Tree lacks the mediatek,mt6323-efuse node, the
MFD core will still instantiate the child device by name, producing a modal=
ias
of platform:mt6323-efuse. Because the driver lacks a MODULE_ALIAS declarati=
on
for platform:mt6323-efuse, udev cannot match the modalias, and the module
might never be automatically loaded on boot.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-mt6323-nvm=
em-v5-0-2f5d308369f0@protonmail.com?part=3D2
