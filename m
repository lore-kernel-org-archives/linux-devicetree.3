Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0F52F7EF5
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 23:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779234438; cv=none; b=llaS9GLlQUcdZJsmfMWOJ0i5x6kWx0mXs2oCMk2YtuQkPl77Q5GsMDQmkx3UY/1QFOtfySSnyspxgalAmFTEVaiMcPgjZ2OMMtk6nOpgPE8E/CtBLGjtcEOh8c3J9Sc+LQti0dU+0uXaV1aBvlaC//FPNCsGluKR34qQ7CaPMPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779234438; c=relaxed/simple;
	bh=FinhY/rORv6tWym9lGOQIoAdbz0gvsKmZG/RGXpp05s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Eclk9gJfTkofbr27DpBNIWGaPMqSZnv9VebVRyunD/MOznsqrwUvDCcBc3Yr9iBP2Xh3bUitj6DZ8mQGNSjUxRlXOFFbeY4JaVXtt883CPXhsJr9K4Ow9NzkcVRLBXLHo8Z9ezF6grVrX9XIXN6EMi3ZZNPjrSRJ+Sb+o0RbT1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSsVhLKg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSsVhLKg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165581F000E9;
	Tue, 19 May 2026 23:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779234437;
	bh=9uQ+oEp5doyOD4SCp82fAGi2AD9ukumF4sZ0qgTtv6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OSsVhLKgevg6dWHreTza1qGJFZzziK/7ej5gi0QtKJJYSBTY2EkwrE5zIgY1QjkFP
	 aGmHD+4sf/qxBgHt5AAisyOshAuhS5sghuDqXPr/FRTohO+zER2Q/bGd+LHknbqUs7
	 H1FaOfAHpMdAPhcQdGmqemsaqKTk8wfR+KhRf70A+N6Bj3CzalQtvrQZiZxOwfh7rx
	 HsUB4YSiHQuh9WEo+N6lJsxVFP58A5/6myeJKw5xD3KhNt3VBaApaseIHgyp6/sNTh
	 1dfV/1xWEkFQTwYjSgYgCG5W790LQsfDBt808zxmy6jaoSqPTSgzFkoDiFo1OPgte+
	 ixPWKgvwZcTGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] thermal/drivers: airoha: Add support for AN7583
 Thermal Sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519222433.29684-6-ansuelsmth@gmail.com>
References: <20260519222433.29684-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 23:47:16 +0000
Message-Id: <20260519234717.165581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect error check variable in `an7583_thermal_probe` bypasses =
failure detection, leading to a potential kernel panic.
- [High] Swapped arguments in `airoha_set_thermal_mux()` calls corrupt hard=
ware multiplexer configuration.
- [High] Unhandled division by zero vulnerability in `an7583_thermal_get_te=
mp` during temperature calculation.
--

commit 1f81ce385fe12681e718cd3a620514ac2170aa8d
Author: Christian Marangi <ansuelsmth@gmail.com>

thermal/drivers: airoha: Add support for AN7583 Thermal Sensor

This commit adds support for the Airoha AN7583 Thermal driver. It drops
support for the PTP_THERMAL subsystem for this chip, reading temperature
directly from the BGA sensor instead. The set_thermal_mux function is
also extended to handle sensor multiplexing.

> diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_th=
ermal.c
> index a062922cb116c..c190b696d3a8c 100644
> --- a/drivers/thermal/airoha_thermal.c
> +++ b/drivers/thermal/airoha_thermal.c
[ ... ]
> @@ -516,6 +593,71 @@ static int en7581_thermal_post_probe(struct platform=
_device *pdev)
[ ... ]
> +static int an7583_thermal_get_temp(struct thermal_zone_device *tz, int *=
temp)
> +{
> +	struct airoha_thermal_priv *priv =3D thermal_zone_device_priv(tz);
> +	int sensor_idx;
> +	int delta_diode, delta_gain;
> +	int coeff, slope, offset;
> +
> +	int diode_zero, diode_d0, diode_d1;
> +
> +	/* Always read sensor AN7583_BGP_TEMP_SENSOR */
> +	sensor_idx =3D AN7583_BGP_TEMP_SENSOR;
> +
> +	coeff =3D an7583_thermal_coeff[sensor_idx];
> +	slope =3D an7583_thermal_slope[sensor_idx];
> +	offset =3D an7583_thermal_offset[sensor_idx];
> +
> +	airoha_set_thermal_mux(priv, sensor_idx, AN7583_ZERO_TADC);

[Severity: High]
Are the arguments for airoha_set_thermal_mux in the correct order?

The function signature was extended earlier in the patch to:
airoha_set_thermal_mux(struct airoha_thermal_priv *priv, int tdac_idx,
                       int sensor_idx)

Passing sensor_idx as the second argument and the TADC constant as the
third argument appears to swap the tdac_idx and sensor_idx values, which
could misconfigure the hardware multiplexer.

> +	diode_zero =3D airoha_get_thermal_ADC(priv);
> +	airoha_set_thermal_mux(priv, sensor_idx, AN7583_D0_TADC);
> +	diode_d0 =3D airoha_get_thermal_ADC(priv);
> +	airoha_set_thermal_mux(priv, sensor_idx, AN7583_D1_TADC);
> +	diode_d1 =3D airoha_get_thermal_ADC(priv);
> +
> +	delta_diode =3D diode_d1 - diode_d0;
> +	delta_gain =3D (delta_diode * coeff) / 100 + (diode_zero - diode_d1);
> +	*temp =3D (slope * delta_diode * 10) / delta_gain - offset * 10;

[Severity: High]
Is there a chance delta_gain could evaluate to zero if the underlying
hardware returns identical readings for diode_zero, diode_d0, and
diode_d1?

If the hardware is unresponsive or uninitialized, these values could
all be zero, causing delta_gain to evaluate to zero. This division
by zero would cause a kernel panic when reading the temperature.

> +	*temp *=3D 100;
> +
> +	return 0;
> +}
[ ... ]
> +static int an7583_thermal_probe(struct platform_device *pdev,
> +				struct airoha_thermal_priv *priv)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	int i;
> +
> +	priv->chip_scu =3D device_node_to_regmap(dev->of_node);
> +	if (IS_ERR(priv->map))
> +		return PTR_ERR(priv->map);

[Severity: High]
Does this error check evaluate the correct variable? The result of
device_node_to_regmap is assigned to priv->chip_scu, but the error
check tests priv->map.

Since priv is zero-allocated during probe, IS_ERR on the uninitialized
priv->map will return false. This allows a potentially invalid
priv->chip_scu pointer to bypass the error check and be used later in
devm_regmap_field_alloc, causing a panic.

> +
> +	for (i =3D 0; i < AIROHA_THERMAL_FIELD_MAX; i++) {
> +		struct regmap_field *field;
> +
> +		field =3D devm_regmap_field_alloc(dev, priv->chip_scu,
> +						an7583_chip_scu_fields[i]);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519222433.2968=
4-1-ansuelsmth@gmail.com?part=3D5
