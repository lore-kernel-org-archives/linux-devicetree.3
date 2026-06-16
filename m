Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FEF3822BE
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620213; cv=none; b=aOBgZjwViuaPqieCGmafqO0YH645i/1AFXR8wssn6WGqoh6rZBHdQDbUUeo3HGRIQ6SurPtc9V17ptpkQY2ZrsDVzBt2M6g6XC62avg5+vnl1Hn8idFtoKIylSDI03qyoKn87ZhdXeJJa1H7u6Ahfvtzp4ieOholQsq088q9wPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620213; c=relaxed/simple;
	bh=TkqkOnL5MqYrFqK3slqLzVynCwhSgL7HIov+ds5Uus0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vx35ffASWZtzsjLrMFR1IHCMW3t68TjvJe7eBaxk/j+Yzu0AmX4hkjW1KZk7YD5OxsywpPEAPywnMMcWhbyU/5trb1vxMpOrRX3Y5cVrOPZ1IbbCqpqmDlk1sR1atNnBdUAGvdE0T4+Xl8SbpisseltxEsoZuCzodz2mE7KlwWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gbopf2kp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gbopf2kp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09AEB1F000E9;
	Tue, 16 Jun 2026 14:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781620212;
	bh=YS7JNCJOMbmSenw3Arpiwpuu1Cm68pL85v7dWFznMUY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gbopf2kp8JYrRmIdn4urtLeNp88qO5k/yyT8XR8GWmnhP5Nr4IoFar/yP1XJXi0yM
	 L1LO2tkX30HLCYGWVBhH25ZALcBjnsJcjsRcIg2V4sMGwJW7o1YwrT6rfAHuI0A4/j
	 JpdRYCn4ipDOl3HLzPFKdhemAeFPGgvhqyQx5/mDenEKdkOUPe9dpZQ3naSLC1HnKP
	 Kyz6wpAIw6QhJK8mPyIlvekzSFIByZMqULNNiSVZNPSRSRfHidJxH1QBSog9GcCRbg
	 POznXU3a4xLsbf773QJTLdW3742RIBl8c2hk1nM94jplezk6UqyDGm+AzHw/SfT1fW
	 Wydvsh0yVs91w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar via B4 Relay" <devnull+rva333.protonmail.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260616-mt6323-adc-v3-2-1c27c588185d@protonmail.com>
References: <20260616-mt6323-adc-v3-2-1c27c588185d@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 14:30:11 +0000
Message-Id: <20260616143012.09AEB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The driver incorrectly powers down the AUXADC clock during initial=
ization, preventing the ADC from functioning.
- [High] Unchecked dereference of `dev->parent` when fetching the regmap co=
uld lead to a kernel panic.
- [Medium] The voltage buffer (`VBUF_EN`) is permanently left enabled if an=
 error occurs during channel request or release.
--

commit ec67a1445925e2d4ca9ef40c52f5417793b977c8
Author: Roman Vivchar <rva333@protonmail.com>
Subject: iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC driver

The mt6323 AUXADC is a 15-bit ADC used for system monitoring. This driver
provides support for reading various channels including battery and
charger voltages, battery and chip temperature, current sensing and
accessory detection. Add a driver for the AUXADC found in the MediaTek=20
mt6323 PMIC.

Tested-by: Ben Grisdale <bengris32@protonmail.ch>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

[ ... ]
> diff --git a/drivers/iio/adc/mt6323-auxadc.c b/drivers/iio/adc/mt6323-aux=
adc.c
> new file mode 100644
> index 0000000000000..572466c3f375f
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
If regmap_set_bits() for MT6323_AUXADC_CON22 fails here, does this
leave the AUXADC_CON11_VBUF_EN bit permanently enabled?

It looks like mt6323_auxadc_read_raw() aborts on a request error without
calling mt6323_auxadc_release().

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

Similarly, if mt6323_auxadc_release() fails to clear the channel bit, it
returns early and skips disabling VBUF_EN. Should these error paths ensure
VBUF_EN is disabled before returning?

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
Does setting this bit actually disable the AUXADC clock?

In MediaTek PMICs, CKPDN typically stands for Clock Power Down. If setting
this bit to 1 disables the clock, and it is never cleared, wouldn't the
clock remain powered down indefinitely and cause all subsequent ADC reads
to time out or hang the hardware?

Should this use regmap_clear_bits() instead to enable the clock?

> +	if (ret)
> +		return ret;
[ ... ]
> +static int mt6323_auxadc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct mt6323_auxadc *auxadc;
> +	struct regmap *regmap;
> +	struct iio_dev *iio;
> +	int ret;
> +
> +	regmap =3D dev_get_regmap(dev->parent->parent, NULL);

[Severity: High]
Can dev->parent or dev->parent->parent be NULL here if the device is
instantiated outside of its expected MFD hierarchy?

For example, if instantiated via a misconfigured Device Tree overlay or
direct sysfs binding, dev->parent could be &platform_bus, which has a NULL
parent.

Since dev_get_regmap() invokes devres_find() which unconditionally
dereferences the device pointer, would passing a NULL parent cause a
kernel panic during probe? Should the parent chain be validated before
dereferencing?

> +	if (!regmap)
> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-mt6323-adc=
-v3-0-1c27c588185d@protonmail.com?part=3D2
