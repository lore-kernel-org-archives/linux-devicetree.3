Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6B823EA84
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 08:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782203464; cv=none; b=K6/yIgPoRQArMC2O186il3gXHrLZvOvRH6VSykFvlvd0chuU8IWohqv2iJvW/40Mftgw4/fRmKEeBVHP6/gCxg/DosIVv7RJyPKaF39WuURD5ci6PGOFsKxViOsrEFitZLGeUwckM8OzzJIp0Mme5559IMH5aLKxyKRGWCrgeGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782203464; c=relaxed/simple;
	bh=B27+5YH7y8Wo2dGDuWtJUiMgB0vdacOuIxfUihNoIvg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SCAQp6zrp3RUhkBbAsZCUKx9wNzJm2dhJ3hGq48w73xv9cA41Gfh1jmYrEBOZtW2TjKoz5KXN2qWmbAIzfrh5po3L9LRs3KC5EDw3sYIAas41Jh0Ny5SflvY0074gruJKvYzsr+nRn7PTt78ur4vg962v1+y/szGMK51Urjk3K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NEH6eE+4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NEH6eE+4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82E961F000E9;
	Tue, 23 Jun 2026 08:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782203462;
	bh=10BxejafoX3XKHHfqNBIgYwieT4vaHhxkTrRrSrJ05c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NEH6eE+45mfIPQWlQzEPQpvyqc8Mhi6pOaZa5zOOTAvNWD1Qp7xEQmxXB2dcqmPiW
	 PWkylmtqKdvxX1ZkZ3MjL42SLw+fW/fGOcwfumX9p4gy7IfaXPFi/enLXfexiroLO8
	 XIuObASYrTq90KBgPXRv/YPFEc9HZfDDRqlpTd2Cs/qUCb5dYU6yyTOwY1KLWnjGS5
	 6QWoOiXiMHmxgm/a9NUCbJFQfshSuNc8KeJVsXuL8iSwGk1rkCjehlW8tiCZUzAI6T
	 AfUFAInrJU44kBMKV7ySUYYezHebmoTGUGvxnsVnqW/Bfwe8oLGm30eJlWF9YZnNj9
	 uispr43JO+4IQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar via B4 Relay" <devnull+rva333.protonmail.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260623-mt6323-adc-v4-2-299680ad3194@protonmail.com>
References: <20260623-mt6323-adc-v4-0-299680ad3194@protonmail.com>
 <20260623-mt6323-adc-v4-2-299680ad3194@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 08:31:02 +0000
Message-Id: <20260623083102.82E961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] NULL pointer dereference when accessing `dev->parent->parent` if t=
he device is instantiated directly via Device Tree.
- [High] The driver powers down the AUXADC clock during initialization by s=
etting an active-high power-down bit.
- [High] Logic error: Polling a channel data register (`ADC19`) for a busy =
state using an inverted mask (`GENMASK(15, 1)`).
- [High] The driver disables the 1.8V Reference Voltage by setting an activ=
e-low Enable Bar (`_ENB`) bit.
- [Medium] Hardware resource leak: voltage buffer left permanently enabled =
if register operations fail during channel request or release.
--

commit 14abb8cfa2d6b144f1f3f039d3bbc230861286d0
Author: Roman Vivchar <rva333@protonmail.com>
Date:   Tue Jun 23 08:16:14 2026 +0000

    iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC driver
   =20
    The mt6323 AUXADC is a 15-bit ADC used for system monitoring. This driv=
er
    provides support for reading various channels including battery and
    charger voltages, battery and chip temperature, current sensing and
    accessory detection.
   =20
    Add a driver for the AUXADC found in the MediaTek mt6323 PMIC.
   =20
    Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2n=
d Generation)
    Signed-off-by: Roman Vivchar <rva333@protonmail.com>
    Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

> diff --git a/drivers/iio/adc/mt6323-auxadc.c b/drivers/iio/adc/mt6323-aux=
adc.c
> new file mode 100644
> index 0000000000000..c450fb6f09cb5
> --- /dev/null
> +++ b/drivers/iio/adc/mt6323-auxadc.c

[ ... ]

> +static int mt6323_auxadc_prepare_channel(struct mt6323_auxadc *auxadc)
> +{
> +	struct regmap *map =3D auxadc->regmap;
> +	u32 val;
> +	int ret;
> +
> +	ret =3D regmap_read(map, MT6323_AUXADC_CON19, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* The ADC is idle. */
> +	if (!(val & AUXADC_CON19_DECI_GDLY_MASK))
> +		return 0;
> +
> +	ret =3D regmap_read_poll_timeout(map, MT6323_AUXADC_ADC19,
> +				       val, !(val & AUXADC_ADC19_BUSY_MASK),
> +				       10, 500);

[Severity: High]
The polling here checks the data payload register MT6323_AUXADC_ADC19 inste=
ad
of a status register. Is this a typo? Waiting for both the READY bit and
payload bits to become zero on a data register might immediately succeed
with a garbage state or result in a timeout failure.

> +	if (ret)
> +		return ret;
> +
> +	return regmap_clear_bits(map, MT6323_AUXADC_CON19,
> +				 AUXADC_CON19_DECI_GDLY_MASK);
> +}
> +
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
If this second register write fails, the function returns an error without
rolling back the AUXADC_CON11_VBUF_EN bit set just above. The caller
in mt6323_auxadc_read_raw() then bypasses mt6323_auxadc_release() on error.
Will this leave the voltage buffer permanently enabled, causing a silent
resource and power leak?

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

[Severity: Medium]
Similarly here, if clearing the CON22 register fails, the function exits
early and skips clearing the AUXADC_CON11_VBUF_EN bit. Should the voltage
buffer be cleared even if the channel bits fail to clear?

> +
> +	return regmap_clear_bits(map, MT6323_AUXADC_CON11, AUXADC_CON11_VBUF_EN=
);
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
In MediaTek PMICs, CKPDN usually stands for Clock Power Down. Does setting
this active-high bit power down the AUXADC clock instead of enabling it?

> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(map, MT6323_AUXADC_CON10,
> +				 AUXADC_TRIM_CH2_MASK | AUXADC_TRIM_CH4_MASK |
> +				 AUXADC_TRIM_CH5_MASK | AUXADC_TRIM_CH6_MASK,
> +				 FIELD_PREP(AUXADC_TRIM_CH2_MASK, 1) |
> +				 FIELD_PREP(AUXADC_TRIM_CH4_MASK, 1) |
> +				 FIELD_PREP(AUXADC_TRIM_CH5_MASK, 1) |
> +				 FIELD_PREP(AUXADC_TRIM_CH6_MASK, 1));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_set_bits(map, MT6323_AUXADC_CON27,
> +			      AUXADC_CON27_VREF18_ENB_MD |
> +			      AUXADC_CON27_MD_STATUS);

[Severity: High]
The ENB suffix typically designates an active-low Enable Bar bit.
By using regmap_set_bits() to set AUXADC_CON27_VREF18_ENB_MD to 1, does this
explicitly power down the 1.8V reference voltage needed by the ADC?

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
The driver exports an of_match_table, which means it could be instantiated
directly by the Device Tree core instead of as an MFD sub-device. In that
scenario, could dev->parent or dev->parent->parent be NULL?

If so, passing a NULL pointer to dev_get_regmap() will cause a kernel crash.

> +	if (!regmap)
> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
> +
> +	iio =3D devm_iio_device_alloc(dev, sizeof(*auxadc));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623-mt6323-adc=
-v4-0-299680ad3194@protonmail.com?part=3D2
