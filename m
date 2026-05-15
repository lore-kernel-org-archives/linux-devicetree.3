Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7462A3E51D2
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843593; cv=none; b=RB5tnpm+RCLqzkZydV6y3eEubuQmDbaU+KHLx9jqM3UNYJoASs4ikJNllC2L/UXChHw+qTp3yO5ndiJ9QwaUIg9RefUexflVNSuqmkES42pP0j5Uq9OhYgjscD2v8Y24u4KNrk6j/FABNILeHP6/JS94nMsXG5rqxLOoJUTJKz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843593; c=relaxed/simple;
	bh=TNWETvHptAvYJibFOxGuZixD9UV5vbK8i80uIIVPams=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XzZvO+lFrDEvfAjGwYXVGh9rKFLuawvNXhny4wKrfaRej8qqKOxLo6OXbpCfyamnjm6++fCvjwgWYQCDck3rSTzAQLzr9q/SfqDO0YDbXxs+Y5P5vX3zVy4KecTI/JkuxuWNKus0GAuMtf5kIDFy+DuF9gQIAE6XlOQDEutNpOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NXgxVxoH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXgxVxoH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01250C2BCB0;
	Fri, 15 May 2026 11:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778843593;
	bh=TNWETvHptAvYJibFOxGuZixD9UV5vbK8i80uIIVPams=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=NXgxVxoHQXBZ46Dr7MrEpvk8l9e4vQeuZjSCp+H7k4xSySrd6OY/mWNKV1qFapm4Z
	 uUisRexHllNjZg1neufxQ9Q8HmKxrRLdYk3P7mt1vLqLEy0UyZnVxNImOg3k32X5Mb
	 oGtp7JtIPNRZ54ah2ypXr0bPK93tPDwkKS88P1dVqs4jhgrZ9TM6HJmr6qebT1JnIB
	 6ZKlppS1Z+SOgQynsr+683eZNKsrwrmplxTCIZBcYyR6ycZPSPJf4u5tNKwi1Zazla
	 zNZxgwy7B87q0CnLlFzVVEjVxOG9ow6Pp3rzJlAFqOZaFSpKNZB8HYmZG7CuLwsJCg
	 hjw0P8Pu8VtvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/11] leds: rgb: add support for Samsung S2M series
 PMIC RGB LED device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260515-s2mu005-pmic-v6-8-1979106992d4@disroot.org>
References: <20260515-s2mu005-pmic-v6-8-1979106992d4@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:13:12 +0000
Message-Id: <20260515111313.01250C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Uninitialized boolean variables `ramp_up_en` and `ramp_dn_en` are =
evaluated in conditional branches.
- [High] Global state mutation and data race via shared static array `s2mu0=
05_rgb_subled_info`.
- [High] Setting a solid brightness fails to clear active hardware pattern =
timings.
- [High] Hardware pattern rejection due to missing duration clamping in LUT=
 lookup.
- [Medium] Redundant read-modify-write on a volatile register risks re-asse=
rting the hardware reset.
- [Medium] Missing OF match table registration prevents native Device Tree =
matching.
- [Low] Unnecessary Kconfig dependency on `REGMAP_IRQ`.
--

commit 237949aa30a43c1f609e23856f2a4d7fae701c00
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

leds: rgb: add support for Samsung S2M series PMIC RGB LED device

Add support for the RGB LEDs found in certain Samsung S2M series PMICs.
The device has three LED channels, controlled as a single device. These
LEDs are typically used as status indicators in mobile phones.

> diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
> index 28ef4c487367c..cf57d85e574ec 100644
> --- a/drivers/leds/rgb/Kconfig
> +++ b/drivers/leds/rgb/Kconfig
> @@ -75,6 +75,17 @@ config LEDS_QCOM_LPG
> =20
>  	  If compiled as a module, the module will be named leds-qcom-lpg.
> =20
> +config LEDS_S2M_RGB
> +	tristate "Samsung S2M series PMICs RGB LED support"
> +	depends on LEDS_CLASS
> +	depends on MFD_SEC_CORE
> +	select REGMAP_IRQ

Is it necessary to select REGMAP_IRQ here? The driver appears to only
perform basic regmap I/O and does not seem to utilize any IRQ-related
regmap functionality.

> +	help
> +	  This option enables support for the S2MU005 RGB LEDs. These devices

[ ... ]

> diff --git a/drivers/leds/rgb/leds-s2m-rgb.c b/drivers/leds/rgb/leds-s2m-=
rgb.c
> new file mode 100644
> index 0000000000000..e7295d0b150da
> --- /dev/null
> +++ b/drivers/leds/rgb/leds-s2m-rgb.c
> @@ -0,0 +1,416 @@

[ ... ]

> +static int s2mu005_rgb_apply_params(struct s2m_rgb *rgb)
> +{
> +	struct regmap *regmap =3D rgb->regmap;
> +	unsigned int ramp_val =3D 0;
> +	unsigned int stay_val =3D 0;
> +	int ret;
> +
> +	ramp_val |=3D FIELD_PREP(S2MU005_RGB_CH_RAMP_UP, rgb->ramp_up);
> +	ramp_val |=3D FIELD_PREP(S2MU005_RGB_CH_RAMP_DN, rgb->ramp_dn);
> +
> +	stay_val |=3D FIELD_PREP(S2MU005_RGB_CH_STAY_HI, rgb->stay_hi);
> +	stay_val |=3D FIELD_PREP(S2MU005_RGB_CH_STAY_LO, rgb->stay_lo);
> +
> +	ret =3D regmap_write(regmap, S2MU005_REG_RGB_EN, S2MU005_RGB_RESET);
> +	if (ret) {

[ ... ]

> +		ret =3D regmap_write(regmap, S2MU005_REG_RGB_CH_STAY(i), stay_val);
> +		if (ret) {
> +			dev_err(rgb->dev, "failed to set stay timings\n");
> +			return ret;
> +		}
> +	}
> +
> +	ret =3D regmap_update_bits(regmap, S2MU005_REG_RGB_EN, S2MU005_RGB_SLOP=
E,
> +				 S2MU005_RGB_SLOPE_SMOOTH);

Could this read-modify-write re-assert the hardware reset?

If the register defaults to volatile, the read part of regmap_update_bits()
might fetch the reset bit as 1 if the hardware doesn't auto-clear it
immediately. Since the previous regmap_write() wiped the register's previous
state, would a single regmap_write() be safer here to apply the slope
configuration?

> +	if (ret) {
> +		dev_err(rgb->dev, "failed to set ramp slope\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static int s2m_rgb_lut_get_closest_duration(const u32 *lut, const size_t=
 len, const u32 duration)
> +{
> +	u32 closest_distance =3D abs(duration - lut[0]);
> +	int closest_index =3D 0;
> +	int lo =3D 0;
> +	int hi =3D len - 1;
> +
> +	/* Bounds checking */
> +	if (duration < lut[0] || duration > lut[len - 1])
> +		return -EINVAL;

Should this clamp the out-of-bounds duration to the closest hardware index
(0 or len - 1) instead of rejecting it?

In s2m_rgb_pattern_set(), the stay_hi duration is calculated by subtracting
the ramp timings from the total time_hi. If the remaining duration falls
below lut_stay_hi[0] (100ms), the lookup function returns -EINVAL and the
pattern application fails entirely.

> +
> +	while (lo <=3D hi) {

[ ... ]

> +static int s2m_rgb_pattern_set(struct led_classdev *cdev, struct led_pat=
tern *pattern, u32 len,
> +			       int repeat)
> +{
> +	struct s2m_rgb *rgb =3D to_s2m_rgb(to_s2m_mc(cdev));
> +	const u32 *lut_ramp_up, *lut_ramp_dn, *lut_stay_hi, *lut_stay_lo;
> +	size_t lut_ramp_up_len, lut_ramp_dn_len, lut_stay_hi_len, lut_stay_lo_l=
en;
> +	int brightness_peak =3D 0;
> +	u32 time_hi =3D 0, time_lo =3D 0;
> +	bool ramp_up_en, ramp_dn_en;
> +	int ret;

[ ... ]

> +	for (int i =3D 0; i < len; i++) {
> +		int brightness =3D pattern[i].brightness;
> +		u32 delta_t =3D pattern[i].delta_t;
> +
> +		if (brightness) {
> +			/*
> +			 * The pattern shold define only one non-zero
> +			 * brightness in the HIGH state. The device doesn't
> +			 * have any provisions to handle multiple peak
> +			 * brightness levels.
> +			 */
> +			if (brightness_peak && brightness_peak !=3D brightness)
> +				return -EINVAL;
> +
> +			brightness_peak =3D brightness;
> +			time_hi +=3D delta_t;
> +			ramp_dn_en =3D !!delta_t;
> +		} else {
> +			time_lo +=3D delta_t;
> +			ramp_up_en =3D !!delta_t;
> +		}
> +	}
> +
> +	/* LUTs are specific to device variant. */
> +	lut_ramp_up =3D s2mu005_rgb_lut_ramp;
> +	lut_ramp_up_len =3D ARRAY_SIZE(s2mu005_rgb_lut_ramp);
> +	lut_ramp_dn =3D s2mu005_rgb_lut_ramp;
> +	lut_ramp_dn_len =3D ARRAY_SIZE(s2mu005_rgb_lut_ramp);
> +	lut_stay_hi =3D s2mu005_rgb_lut_stay_hi;
> +	lut_stay_hi_len =3D ARRAY_SIZE(s2mu005_rgb_lut_stay_hi);
> +	lut_stay_lo =3D s2mu005_rgb_lut_stay_lo;
> +	lut_stay_lo_len =3D ARRAY_SIZE(s2mu005_rgb_lut_stay_lo);
> +
> +	mutex_lock(&rgb->lock);
> +
> +	/*
> +	 * The timings ramp_up, stay_hi, and ramp_dn of the HIGH state are
> +	 * roughly equal. Firstly, calculate and set timings for ramp_up and
> +	 * ramp_dn (making sure they're exactly equal).
> +	 */
> +	rgb->ramp_up =3D 0;
> +	rgb->ramp_dn =3D 0;
> +
> +	if (ramp_up_en) {

Can ramp_up_en or ramp_dn_en be read uninitialized here?

If a user provides a pattern consisting only of non-zero brightness values,
ramp_up_en is never assigned. Conversely, a pattern of all zero brightness
leaves ramp_dn_en uninitialized, which could result in arbitrary timing
values.

> +		ret =3D s2m_rgb_lut_get_closest_duration(lut_ramp_up, lut_ramp_up_len,=
 time_hi / 3);

[ ... ]

> +static int s2m_rgb_brightness_set(struct led_classdev *cdev, enum led_br=
ightness value)
> +{
> +	struct s2m_rgb *rgb =3D to_s2m_rgb(to_s2m_mc(cdev));
> +	int ret =3D 0;
> +
> +	if (!value)
> +		return s2m_rgb_pattern_clear(cdev);
> +
> +	mutex_lock(&rgb->lock);
> +
> +	led_mc_calc_color_components(&rgb->mc, value);
> +	/* Apply params with variant-specific implementation. */
> +	ret =3D s2mu005_rgb_apply_params(rgb);

Does this need to clear the internal pattern timing variables (rgb->ramp_up,
rgb->ramp_dn, etc.) before calling s2mu005_rgb_apply_params()?

If a hardware pattern was previously running, it looks like setting a solid
brightness will re-apply the old pattern's timings with the new peak
brightness, causing the LED to continue blinking instead of emitting a
constant light.

> +
> +	mutex_unlock(&rgb->lock);
> +
> +	return ret;
> +}
> +
> +static struct mc_subled s2mu005_rgb_subled_info[] =3D {
> +	{ .channel =3D 0, .color_index =3D LED_COLOR_ID_BLUE },
> +	{ .channel =3D 1, .color_index =3D LED_COLOR_ID_GREEN },
> +	{ .channel =3D 2, .color_index =3D LED_COLOR_ID_RED },
> +};
> +
> +static int s2m_rgb_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct sec_pmic_dev *pmic_drvdata =3D dev_get_drvdata(dev->parent);
> +	struct s2m_rgb *rgb;
> +	struct led_init_data init_data =3D {};
> +	int ret;
> +
> +	rgb =3D devm_kzalloc(dev, sizeof(*rgb), GFP_KERNEL);
> +	if (!rgb)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, rgb);
> +	rgb->dev =3D dev;
> +	rgb->regmap =3D pmic_drvdata->regmap_pmic;
> +
> +	/* Configure variant-specific details. */
> +	rgb->mc.subled_info =3D s2mu005_rgb_subled_info;

Could this lead to a data race if there are multiple device instances?

The multicolor LED core function led_mc_calc_color_components() mutates
the .brightness fields of the subled_info array elements. Since this assigns
a pointer to a static global array, multiple devices might concurrently mod=
ify
the shared array.

Would it be better to dynamically allocate a per-device copy using
devm_kmemdup()?

> +	rgb->mc.num_colors =3D ARRAY_SIZE(s2mu005_rgb_subled_info);

[ ... ]

> +static const struct of_device_id s2m_rgb_of_match_table[] =3D {
> +	{ .compatible =3D "samsung,s2mu005-rgb", .data =3D (void *)S2MU005 },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, s2m_rgb_of_match_table);
> +
> +static struct platform_driver s2m_rgb_driver =3D {
> +	.driver =3D {
> +		.name =3D "s2m-rgb",
> +	},
> +	.probe =3D s2m_rgb_probe,
> +	.id_table =3D s2m_rgb_id_table,
> +};

Is the .of_match_table field missing here?

Without assigning s2m_rgb_of_match_table to the driver struct, native Device
Tree matching might fail and prevent the of_node from being correctly
associated with the platform device.

> +module_platform_driver(s2m_rgb_driver);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-s2mu005-pm=
ic-v6-0-1979106992d4@disroot.org?part=3D8
