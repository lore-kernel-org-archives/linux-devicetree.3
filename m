Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211FF3E7BD8
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 13:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405427; cv=none; b=DfUMIU/f6ADbyyLcz3+EAZ+N+sNLuuj1VJn/wcrD9RiCSWhDhEOFieno8s3WjcvbIVv1h5YHsbjNiDk6A4F9FkEqvxvkMU2p9KTJLRd70n/6w1RBmADYQsk60loitRvKsoakA2TDvWT+91sWWOl7IR30ERFXLepY5cFnGdk44tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405427; c=relaxed/simple;
	bh=g60X7UD46QNdLNND0fYOTWx8NLqvqDmvjErcH+TUKF4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GyJdjXTiJ5yZ3HoUN5EEGLeg1WKvMGVeKEmryRh2rtbmF+fTFz+mPfP+EMWYVsDqaQV2yJKv8j0q9AxILJbqNS3zg0Z8O/78j6RVoHVfYI6yj6x/STiY5CYLeHZ8PPrYYpTB5Mynl86ff/VbMtq5gWGvVZ48ubsbuZOBulbogHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eh/j6lSg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eh/j6lSg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95EE71F00893;
	Tue,  2 Jun 2026 13:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780405425;
	bh=YwFNEKQavTsVNdFLviKPBg+OewRm3O1TWteLRN+SYsg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Eh/j6lSgFJ7E0+zemkC/oG9Qol/00qua7TpSSiV8YoOONPbDsvm9NVu4zU+Y7WzKS
	 U0xsWh35HH8ugI8Q37W1K2NrzBiA54jIYM05xvKNYbG4eS3O5LH05sVCZZPvYWIe+d
	 mumjwXW6ugOAMOkcSOeKqVeTq8OVB0LKHxTf57atr5GNjYHqFPme5BDWVMnkdbeNOM
	 VGwqe/JNxf/bTEfz2Yyt33IsqPYzIv76IlcsKjiDAmzStTFbLTsblx4YMoJobGIfBs
	 u7MVjz7x7tdb2tgvGflF+sl6GrRPoSxLZGwYHnJt2nCOfBfo3qiT4pTQGlddXdFv2X
	 cxnV/lCNEIyBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar via B4 Relay" <devnull+rva333.protonmail.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260602-mt6323-adc-v1-2-68ec737508ee@protonmail.com>
References: <20260602-mt6323-adc-v1-2-68ec737508ee@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 13:03:45 +0000
Message-Id: <20260602130345.95EE71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unchecked pointer dereference of `dev->parent` and `dev->parent->p=
arent` when fetching the PMIC wrapper regmap.
- [High] Channel interference and power leak due to missing teardown of act=
ive channels and voltage buffer.
--

commit 3ea46406f2075e002ef31a93fd209e78c86e9790
Author: Roman Vivchar <rva333@protonmail.com>

iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC driver

The mt6323 AUXADC is a 15-bit ADC used for system monitoring. This driver
provides support for reading various channels including battery and
charger voltages, battery and chip temperature, current sensing and
accessory detection.
   =20
Add a driver for the AUXADC found in the MediaTek mt6323 PMIC.

> diff --git a/drivers/iio/adc/mt6323-auxadc.c b/drivers/iio/adc/mt6323-aux=
adc.c
> new file mode 100644
> index 0000000000000..da6c11a5079c0
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
> +	ret =3D regmap_clear_bits(map, MT6323_AUXADC_CON22, BIT(channel));
> +	if (ret)
> +		return ret;
> +
> +	return regmap_set_bits(map, MT6323_AUXADC_CON22, BIT(channel));
> +}

[Severity: High]
Does this leave previously requested channels active in MT6323_AUXADC_CON22?

Since it only clears and sets the bit for the currently requested channel,
multiple channel bits could accumulate in the register over time. Could this
cause hardware contention or mixed readings when channels are used
sequentially?

[ ... ]
> +static int mt6323_auxadc_read_raw(struct iio_dev *indio_dev,
> +				  const struct iio_chan_spec *chan,
> +				  int *val, int *val2, long mask)
> +{
> +	struct mt6323_auxadc *auxadc =3D iio_priv(indio_dev);
> +	int ret, mult;
> +
> +	switch (mask) {
[ ... ]
> +	case IIO_CHAN_INFO_RAW:
> +		scoped_guard(mutex, &auxadc->lock) {
> +			ret =3D mt6323_auxadc_prepare_channel(auxadc);
> +			if (ret)
> +				return ret;
> +
> +			ret =3D mt6323_auxadc_request(auxadc, chan->channel);
> +			if (ret)
> +				return ret;
> +
> +			/* Hardware limitation: the AUXADC needs a delay to become ready. */
> +			fsleep(300);
> +
> +			ret =3D mt6323_auxadc_read(auxadc, chan, val);
> +			if (ret)
> +				return ret;
> +		}
> +		return IIO_VAL_INT;

[Severity: High]
Does this leak power by leaving AUXADC_CON11_VBUF_EN enabled after the
reading finishes?

It appears the voltage buffer is enabled in mt6323_auxadc_request() but nev=
er
disabled once the conversion completes and exits here. Also, the active
channel is never cleared.

[ ... ]
> +static int mt6323_auxadc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct mt6323_auxadc *auxadc;
> +	struct iio_dev *iio;
> +	struct regmap *regmap;
> +	int ret;
> +
> +	regmap =3D dev_get_regmap(dev->parent->parent, NULL);

[Severity: High]
Is it possible for dev->parent->parent to be NULL here?

If this driver is instantiated directly via a Device Tree node (because of
its of_match_table) rather than as an MFD child, dev->parent would evaluate
to the platform_bus, making dev->parent->parent NULL.

Passing NULL to dev_get_regmap() causes an immediate kernel panic in
devres_find() when it attempts to acquire a spinlock. Should we verify the
parent hierarchy before dereferencing it?

> +	if (!regmap)
> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-mt6323-adc=
-v1-0-68ec737508ee@protonmail.com?part=3D2
