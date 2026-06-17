Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7E3390CBA
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690666; cv=none; b=nesP7tdh25KmmS8cBpIsTxvZNmxP/oxm0EqRbeuK0QDaW5Of8/57vGrppGfxE8PTjyBkhPgNMl81ki6I+XiWntdxB4k1A6LdT5Yrzwdi/gd9NMuJlOZcoljwDSNzwF1X9anfNvHE4iwdWCNJ3epQEtQxm1LyAzFGXuJQJccR+QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690666; c=relaxed/simple;
	bh=hzuNteumz/UEmj+g4ceZSEks0UT6iNuWLhK5fA52RpI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l7WSI16DKJhEDhcKhGchx7I96tUcjY0h9BWSjRmcDwF5Yom+QhveE3zPPzKZzH4RtnT9m+1ipKRkcJmZjczrV7bqhoc/CMYWbBM6A2mPtT3pn2yRA5+UiM3B4VWo4jmo3OfAN6nNOKWXftBCtjUdinmYSB80/wsAVgqHe/0SnK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IC62qXH+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IC62qXH+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E722C1F000E9;
	Wed, 17 Jun 2026 10:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781690665;
	bh=fN6e+s1oFNveiOA6IJIv+wlcTcO2k9Bzokp8rAUzFCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IC62qXH+oMpraIQXxhSKAPIl1PAwjjoF84Xxoi9dPsN9nvCSvi2qQ+hHmPp0P899o
	 CgcY+Uow87UUxzYnkScA2gF8XQqZ8NxSBi8PVTh0cqGGERpxh2bntIYarnNHhNGTYx
	 WvV0U5L4wIHDpl6lS/6CTLjx6XaAweF5y9k8gQkvbiDmxDPTpt1PECyCuheFf9Q6Py
	 SUk0gondg1c6n4TbSC+puL2EdXGTVNh1TR6sh+mHM55k1eXaoifyyy0U0h6yLkZK+F
	 Qe0c+InEPoyUQ90pw/lDVhNmCSMTuF86L/8En15fRz0peBhSIEIYl1JI3Q/OU5vHEn
	 O824wWrUpj8gQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] nvmem: add mt6323 PMIC EFUSE driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar via B4 Relay" <devnull+rva333.protonmail.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260617-mt6323-nvmem-v2-2-4f30e36aa0f4@protonmail.com>
References: <20260617-mt6323-nvmem-v2-0-4f30e36aa0f4@protonmail.com>
 <20260617-mt6323-nvmem-v2-2-4f30e36aa0f4@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 10:04:24 +0000
Message-Id: <20260617100424.E722C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unchecked traversal of device parent pointers causes a NULL pointe=
r dereference.
- [High] Buffer overflow in the NVMEM read callback for unaligned read requ=
ests.
--

commit 6d793839a1a7e502029cf9f7b58d011fec9486e7
Author: Roman Vivchar <rva333@protonmail.com>

nvmem: add mt6323 PMIC EFUSE driver

This commit adds support for the EFUSE controller found in the Mediatek
MT6323 PMIC. The MT6323 EFUSE stores 24 bytes of hardware-related data,
such as thermal sensor calibration values.

> diff --git a/drivers/nvmem/mt6323-efuse.c b/drivers/nvmem/mt6323-efuse.c
> new file mode 100644
> index 0000000000000..7a0ce4c7f5658
> --- /dev/null
> +++ b/drivers/nvmem/mt6323-efuse.c

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
> +		ret =3D regmap_read(map, MT6323_EFUSE_DOUT_BASE + offset + i, &tmp);
> +		if (ret)
> +			return ret;
> +
> +		*buf++ =3D tmp;

[Severity: High]
What happens if an internal client requests to read an odd number of bytes?

Since this loop unconditionally writes a 16-bit word on each iteration, an =
odd
bytes length would cause the loop to execute an extra time and write past t=
he
end of the destination buffer. Because nvmem_device_read() does not enforce
word_size alignment on internal requests, this could corrupt adjacent memory
if the caller allocated a buffer matching the exact requested size.

Could the driver explicitly reject unaligned lengths or safely handle parti=
al
word writes?

> +	}
> +
> +	return 0;
> +}
> +
> +static int mt6323_efuse_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct nvmem_config config =3D {
> +		.name =3D "mt6323-efuse",
> +		.stride =3D 2,
> +		.word_size =3D 2,
> +		.size =3D MT6323_EFUSE_SIZE,
> +		.reg_read =3D mt6323_efuse_read,
> +	};
> +	struct nvmem_device *nvmem;
> +	struct regmap *regmap;
> +
> +	/* efuse -> mfd -> pwrap */
> +	regmap =3D dev_get_regmap(dev->parent->parent, NULL);

[Severity: High]
Could this lead to a NULL pointer dereference if the device tree hierarchy
is malformed?

If the device is instantiated at the top level or independently of the
expected MFD and PMIC wrapper structure, dev->parent could map to the
platform bus, making dev->parent->parent NULL. Passing a NULL pointer to
dev_get_regmap() will cause a kernel panic when it attempts to lock the
devres lock.

Would it be safer to verify that dev->parent and dev->parent->parent are
non-NULL before passing the grandparent pointer?

> +	if (!regmap)
> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-mt6323-nvm=
em-v2-0-4f30e36aa0f4@protonmail.com?part=3D2
