Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9224F325701
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 19:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780513352; cv=none; b=KMlCgNa8Uip39LbGAwzcRaMKSGNZAXDx9ThReQyutCxxvypp6aKB36j/uF99IcDTuoILmv3qqO3MP3LwhP7KC3YWL4sLe1vT4IvryF/n+4A3YuGyok56c6/JDCJRYv5VNzg/KA2a6GdvanQc3pfP79Vb3PARwTKsCWMAqgIWK4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780513352; c=relaxed/simple;
	bh=SuJih+9ubkD7s9Yba+w09R4EYQfR4DdvdBrb8FEQkhg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z7s2mMmnP8osO4v/CjQ3ParFosKRdtQBWXQ6ubYEgUajut97vdiMMZvCC2ip7sXeK92NvmhNF4B6KnVaA/BL1C5Lvqt/E7o4WiGWSa1BblQJcBQdJxV+ZJx1mAQKtV8xxeYy8x6sX53KwmEfh73cURzPGpr8wduIMDHKAJsfsbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfYLBZ7m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfYLBZ7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7DE11F00893;
	Wed,  3 Jun 2026 19:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780513351;
	bh=+KeY9mD+VqCNOg+HISRGFbBkbSWylkc4obC+Tq8lies=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EfYLBZ7mHt04OGrsQ+MEKivxRhSngHbsjuo/xQ9TyCzUDnh+JWtoQitMigJ0oob6y
	 NtcA0vf0rTA3C8ZPBtjixmBgHMcH3LbAIL4mOKUR3aUPBRHNqM8/aSgLn1jd/P/KGd
	 M1IzVTOl7OWEhHjwiG45fHAcSq8dIrVWAZF77t+Lt2/a5BZojbiAFlAJ5kIlMN25i/
	 gdeiETPBxAwS8xcO6YRSP0W8tzeEc/fYrohXrQfK+4LE1ttc3qdxuvawNwG/bNe3+9
	 g4j68BAKMkiJvf6S9Lk7vheYlFRKjwvx8tMWXqhQEbkiQRMtxyrP+Ih08FpXJ8Clqj
	 axWesnBmHGOEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 04/11] dt-bindings: iio: adc: hx711: add HX710B
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Piyush Patle" <piyushpatle228@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603184859.89693-5-piyushpatle228@gmail.com>
References: <20260603184859.89693-5-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 19:02:30 +0000
Message-Id: <20260603190230.E7DE11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The HX710B driver fails to request and enable the `avdd-supply` an=
d `dvdd-supply` regulators, leaving the chip unpowered.
- [Low] The driver uses a non-existent compiler macro `__counted_by_ptr`, w=
hich will cause a build failure.
--

commit 4a57ad17002849c3ffed8137401cf0ed7fd81778
Author: Piyush Patle <piyushpatle228@gmail.com>

iio: adc: hx711: add support for HX710B

This commit adds support for the AVIA HX710B ADC, sharing the GPIO interface
with the HX711 but using trailing pulses for mode selection. It introduces
variant-specific channel configurations and tracks active channels across
conversions. Additionally, it refactors the gain and scale computations to
use fixed values for the new variant.

> diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
> index 5c326f01c5543..e90780dfd34e5 100644
> --- a/drivers/iio/adc/hx711.c
> +++ b/drivers/iio/adc/hx711.c
> @@ -84,12 +86,16 @@ static int hx711_get_scale_to_gain(const int *gain_sc=
ale, int scale)
>   * @channels: channel specification array
>   * @num_channels: number of entries in @channels
>   * @iio_info: IIO info ops for this variant
> + * @fixed_gain_val: fixed PGA gain (used when @has_fixed_gain is true)
> + * @has_fixed_gain: true if the variant has a fixed ADC gain
>   */
>  struct hx711_chip_info {
>  	const char			*name;
>  	const struct iio_chan_spec	*channels __counted_by_ptr(num_channels);

[Severity: Low]
Will this compile? The __counted_by_ptr macro doesn't appear to be defined
anywhere in the kernel, whereas __counted_by is used for flexible array
members. Could this result in a syntax error during the build?

>  	unsigned int			num_channels;
>  	const struct iio_info		*iio_info;
> +	unsigned int			fixed_gain_val;
> +	bool				has_fixed_gain;
>  };

[ ... ]

> @@ -543,32 +709,43 @@ static int hx711_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(hx711_data->gpiod_dout),
>  				     "failed to get dout-gpiod\n");
> =20
> -	ret =3D devm_regulator_get_enable_read_voltage(dev, "avdd");
> +	if (chip_info->has_fixed_gain)
> +		ret =3D devm_regulator_get_enable_read_voltage(dev, "vref");
> +	else
> +		ret =3D devm_regulator_get_enable_read_voltage(dev, "avdd");
>  	if (ret < 0)
>  		return ret;

[Severity: High]
Does this leave the HX710B unpowered? The device tree bindings require
both avdd-supply and dvdd-supply for the avia,hx710b compatible.

However, when has_fixed_gain is true for the HX710B variant, the driver
only requests the vref supply. If avdd and dvdd are controlled by actual
regulators on the board, will they remain disabled and cause the hardware
to fail?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603184859.8969=
3-1-piyushpatle228@gmail.com?part=3D4
