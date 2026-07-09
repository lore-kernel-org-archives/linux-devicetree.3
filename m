Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A1540F8DD
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 11:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595168; cv=none; b=d+AFpaKDDJIfW8N3Nu1Fuosd2Kay7Gdn78t7Yt9R2PTRaHpZDAOnBjDgZEt6dz8lQofoxwneshSaPe6N9uo2fNiW9TbTLk9g4afLCubfniCx08G3nG/3EVq2xGavqZ1WlOEd/bSvTVaDZMPD/WJwZqvyET4d84rE5Crg/rB2380=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595168; c=relaxed/simple;
	bh=PrcY2U7YOPf5Fme4Rhxmi+NpJDYyHd1s3IjEHP5E14U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BGL8L0644BfoIY5fl1vR7KHeKq3V3TaMbK5AOHGyJAiGMsjWrwfeNpQyZJ2MpILP/Kq4OePX23njWYCiBsetM5kc+dS3jrxT8aTIviPnHbMUu1Ms628b13fNg23H0SM4zzgv921D9ECpkDPDMXieKZcw3VTrRnBorCS/oH941Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ek8CLpG7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ek8CLpG7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECDB1F000E9;
	Thu,  9 Jul 2026 11:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783595167;
	bh=2LY055mhebXui2WnXXIfjrsygJmhhAXBBoM9PY9l8pw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ek8CLpG7GmMgHq0cbPQxkWkp8STEikxGET9hmLaUdN4Gx7Sc/JtCPGKrQXsmA/poz
	 RpBaKd5xHuA+GjxPziXG7b2B7bYCZ479ab+zWEp2unk0PJY/gzyIFXrtu7i8IDowFJ
	 WIvosCPJ8LQmNJtRGT6z8tP+wxIPD4JfOv4tVp1+zVEPWhiSdV0aArCdq067iZboz5
	 0khXlw0y+1aHGx8OGuBLtYHmtZd0CPgteUYD5rjNuvCgPf8Gd5IBwl4a8M0ZRq6glL
	 cjdZIZLq30KEpzaiNo4+cxBUuc9fKvmASrYnTHXZl8zkIQLfo/2Ze5NolMVr/09hDw
	 VmSkOH9EGepdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709-mt6323-adc-v5-2-d11b8332a735@protonmail.com>
References: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com>
 <20260709-mt6323-adc-v5-2-d11b8332a735@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 11:06:06 +0000
Message-Id: <20260709110606.BECDB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The driver is unreachable dead code because it is not instantiated=
 by the MFD core.
- [High] Hardware clock is incorrectly powered down during initialization.
- [Medium] Hardware resource leak (power) on PMIC error paths.
--

--- Patch [2]: [PATCH v5 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXA=
DC driver ---
commit bd09ecf1750ddd84020e392e718056274b3e15a4
Author: Roman Vivchar <rva333@protonmail.com>

iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC driver

This commit adds a new driver for the AUXADC found in the MediaTek mt6323
PMIC. It provides support for reading various channels including battery
and charger voltages, temperature, and current sensing.

> diff --git a/drivers/iio/adc/mt6323-auxadc.c b/drivers/iio/adc/mt6323-aux=
adc.c
> new file mode 100644
> index 0000000000000..c450fb6f09cb5
> --- /dev/null
> +++ b/drivers/iio/adc/mt6323-auxadc.c
[ ... ]
> +static int mt6323_auxadc_request(struct mt6323_auxadc *auxadc,
> +				 unsigned long channel)
> +{
> +	struct regmap *map =3D auxadc->regmap;
> +	int ret;
> +
> +	ret =3D regmap_set_bits(map, MT6323_AUXADC_CON11, AUXADC_CON11_VBUF_EN);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_set_bits(map, MT6323_AUXADC_CON22, BIT(channel));

[Severity: Medium]
If regmap_set_bits() for MT6323_AUXADC_CON22 fails here, could this leave
AUXADC_CON11_VBUF_EN permanently enabled?

Since mt6323_auxadc_read_raw() immediately returns without calling
mt6323_auxadc_release() when this function fails, it seems this might cause
a hardware power leak on the error path.

> +}
> +
> +static int mt6323_auxadc_release(struct mt6323_auxadc *auxadc,
> +				 unsigned long channel)
> +{
> +	struct regmap *map =3D auxadc->regmap;
> +	int ret;
> +
> +	ret =3D regmap_clear_bits(map, MT6323_AUXADC_CON22, BIT(channel));
> +	if (ret)
> +		return ret;
> +
> +	return regmap_clear_bits(map, MT6323_AUXADC_CON11, AUXADC_CON11_VBUF_EN=
);

[Severity: Medium]
Similarly, if clearing MT6323_AUXADC_CON22 fails, will this skip clearing
AUXADC_CON11_VBUF_EN?

> +}
[ ... ]
> +static int mt6323_auxadc_init(struct mt6323_auxadc *auxadc)
> +{
> +	struct regmap *map =3D auxadc->regmap;
> +	int ret;
> +
> +	ret =3D regmap_set_bits(map, MT6323_STRUP_CON10,
> +			      AUXADC_STRUP_CON10_RSTB_SW |
> +			      AUXADC_STRUP_CON10_RSTB_SEL);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_set_bits(map, MT6323_TOP_CKPDN2, AUXADC_TOP_CKPDN2_CTL_C=
K);

[Severity: High]
Does setting the CKPDN (Clock Power Down) bit disable the clock instead of
enabling it?=20

In MediaTek PMIC hardware, CKPDN registers usually represent Clock Power
Down, meaning writing a 1 powers down the clock. Should this use
regmap_clear_bits() instead?

> +	if (ret)
> +		return ret;
[ ... ]
> +static int mt6323_auxadc_probe(struct platform_device *pdev)
> +{

[Severity: High]
Will this probe function ever be executed?

The MT6323 is an MFD device handled by drivers/mfd/mt6397-core.c, which
instantiates its children strictly from the hardcoded mt6323_devs array
using mfd_add_devices().=20

Since the mt6323-auxadc driver was not added to that array, and the
mediatek,mt6323 PMIC device tree binding does not use simple-mfd, it appears
this driver is structurally unreachable unless the MFD core is also modifie=
d.

> +	struct device *dev =3D &pdev->dev;
> +	struct mt6323_auxadc *auxadc;
> +	struct regmap *regmap;
> +	struct iio_dev *iio;
> +	int ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-mt6323-adc=
-v5-0-d11b8332a735@protonmail.com?part=3D2
