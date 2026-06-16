Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B62175A62
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 01:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781574508; cv=none; b=Vg4SMeujyV5PS1sUKXeKhXTsBxk121MfNM4ch3X6gQCCmTvMZXCKDvq3S1kLCXu88wpAKpcpRK5uwtwGVbpV/v4HWK64S9HHrcXEk2A9Sm9Q2hVEmxJBLd8ebmim3qjzsKayM3k83NsvEPt+fNSDo/L+YfTp7PAx4RPWgUhL4Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781574508; c=relaxed/simple;
	bh=VypylcaVDIUD4evWRmH1mLsSmBae2sBOZScLFDIyFFg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D3FjBOROQec3jj5hM9Ag1YDSwB/NIU2pdTNWN7LngrQYntlL+za8rNBioVVlkvjxcR2MveBW10Iw0Ua5W/yOyKuq07+Gd6zUyte/Zt92fN9DFcaqEnickWQAw5klP9EDEK4Xy+16VSNAOP5dhc9nV6Emg4nrlj7d5VjLgbtiaWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2V2juwY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2V2juwY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9402F1F000E9;
	Tue, 16 Jun 2026 01:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781574506;
	bh=d1sjngC6lkVcjYh6VavlJxR9Vb9oVpkzCL0UAtS/55g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k2V2juwYcPhbfrKGHM5//yjZsdgcVgKJLFrufMiD1YChdEM4gdp0pAcUduUqqYlju
	 TEFfhm6iMI4BUtQ+F/lihluv6qfzjLR5oy4f1/2SNGO74auZae+00kDqAvGAaIR8+s
	 GL9DZigmSoRs9T5fw1TmLda0zj2YUheTrTiip7m2rkpDKiZ2cbxIVxczbvp94De1/v
	 SzlJAMIbub7qeLzKKkWu9fp7lOtkl5/0YJZEe305TNO31R0FZHRNeMt4WMZbDcFLfe
	 /JzER1NWaiBqy6gv1aA+hL/NGW2/ECb1MNiO1YTCfYg9VdKIf8c60ZZUlVcw9jUG3S
	 WWFOJVIioyH/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/2] leds: ltc3220: Add Support for LTC3220 18
 channel LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Edelweise Escala" <edelweise.escala@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260616-ltc3220-driver-v11-2-6e51dd97ced6@analog.com>
References: <20260616-ltc3220-driver-v11-2-6e51dd97ced6@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 01:48:26 +0000
Message-Id: <20260616014826.9402F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Typographical error in regmap_config uses an undefined enum value =
`REGCACHE_FLAT_S`, causing a build failure.
- [High] Aggregated mode (QUICK_WRITE) causes the regmap cache to desynchro=
nize, breaking LEDs during regcache_sync().
- [Medium] regcache_sync() in the resume handler is a no-op because the reg=
map cache is never marked dirty.
- [Medium] User-provided brightness values in hardware patterns are incorre=
ctly masked instead of clamped, causing wrap-around behavior.
- [Medium] The driver modifies the cached LED state (`uled_cfg->reg_value`)=
 and hardware registers without driver-level synchronization, allowing conc=
urrent operations to permanently desync the software cache from the hardwar=
e.
--

commit 531f73073c031952f85d8c75169d6129f992543c
Author: Edelweise Escala <edelweise.escala@analog.com>

leds: ltc3220: Add Support for LTC3220 18 channel LED Driver
   =20
Add driver for the LTC3220 18-channel LED driver with I2C interface,
individual brightness control, and hardware-assisted blink/gradation
features.

> diff --git a/drivers/leds/leds-ltc3220.c b/drivers/leds/leds-ltc3220.c
> new file mode 100644
> index 0000000000000..8bb06e50d3c6a
> --- /dev/null
> +++ b/drivers/leds/leds-ltc3220.c
[ ... ]
> +static const struct regmap_config ltc3220_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.max_register =3D LTC3220_GRAD_BLINK_REG,
> +	.cache_type =3D REGCACHE_FLAT_S,

[Severity: High]
Does this cause a build failure?

The correct enum value defined by the kernel is REGCACHE_FLAT, but this uses
an undefined REGCACHE_FLAT_S.

> +};
[ ... ]
> +static int ltc3220_set_led_data(struct led_classdev *led_cdev,
> +				enum led_brightness brightness)
> +{
> +	struct ltc3220_uled_cfg *uled_cfg =3D container_of(led_cdev, struct ltc=
3220_uled_cfg,
> +							 led_cdev);
> +	struct ltc3220 *ltc3220 =3D container_of(uled_cfg - uled_cfg->led_index=
, struct ltc3220,
> +					       uled_cfg[0]);
> +	int ret;
> +
> +	ret =3D regmap_write(ltc3220->regmap, LTC3220_ULED_REG(uled_cfg->led_in=
dex),
> +			   brightness);

[Severity: High]
When configured in aggregated mode, the hardware's QUICK_WRITE feature is
enabled, and a single write to LED 0 implicitly updates LEDs 1-17 in
hardware.

However, the driver doesn't update the regmap cache for registers 0x02
through 0x12, leaving them at 0.

When regcache_sync() runs during resume, will it write out the cached 0s and
inadvertently turn off LEDs 1-17?

Should the driver manually sync the cache for these implicitly updated
registers?

> +	if (ret)
> +		return ret;
> +
> +	uled_cfg->reg_value =3D brightness;

[Severity: Medium]
Since the LED core does not strictly serialize asynchronous triggers against
all callback paths, is this unprotected assignment susceptible to a race
condition?

A concurrent call to ltc3220_set_led_data() or ltc3220_blink_set() could
cause the software reg_value to become permanently desynchronized from the
hardware register state.

Does this need a per-device or per-LED mutex to protect read-modify-write
operations?

> +
> +	/*
> +	 * When aggregated LED mode is enabled, writing to LED 1 updates all
> +	 * LEDs simultaneously via quick-write mode. Update cached values for
[ ... ]
> +static int ltc3220_pattern_set(struct led_classdev *led_cdev,
> +			       struct led_pattern *pattern,
> +			       u32 len, int repeat)
> +{
[ ... ]
> +	if (repeat !=3D 1)
> +		return -EOPNOTSUPP;
> +
> +	start_brightness =3D pattern[0].brightness & LTC3220_LED_CURRENT_MASK;
> +	end_brightness =3D pattern[1].brightness & LTC3220_LED_CURRENT_MASK;

[Severity: Medium]
Will this bitwise masking cause wrap-around behavior if a user provides a
brightness value greater than 63 via the sysfs hw_pattern interface?

For instance, a value of 64 would wrap to 0, unexpectedly turning the LED
off.

Would it be safer to use min_t() to clamp the input instead of a
bitwise mask?

> +
> +	is_increasing =3D end_brightness > start_brightness;
[ ... ]
> +static int ltc3220_blink_set(struct led_classdev *led_cdev,
> +			     unsigned long *delay_on,
> +			     unsigned long *delay_off)
> +{
[ ... ]
> +	ret =3D regmap_update_bits(ltc3220->regmap, LTC3220_GRAD_BLINK_REG,
> +				 LTC3220_BLINK_MASK, FIELD_PREP(LTC3220_BLINK_MASK, blink_mode));
> +	if (ret)
> +		return ret;
> +
> +	/* Ensure LED has non-zero brightness before enabling blink mode */
> +	if (uled_cfg->reg_value =3D=3D 0)
> +		uled_cfg->reg_value =3D led_cdev->max_brightness;

[Severity: Medium]
Could this rely on a stale reg_value if concurrent operations are
modifying the state without synchronization, as noted in
ltc3220_set_led_data() above?

> +
> +	return regmap_write(ltc3220->regmap, LTC3220_ULED_REG(uled_cfg->led_ind=
ex),
> +			    FIELD_PREP(LTC3220_LED_MODE_MASK, LTC3220_BLINK_MODE) |
> +			    uled_cfg->reg_value);
> +}
[ ... ]
> +static int ltc3220_suspend(struct device *dev)
> +{
> +	struct ltc3220 *ltc3220 =3D i2c_get_clientdata(to_i2c_client(dev));
> +
> +	for (int i =3D 0; i < LTC3220_NUM_LEDS; i++) {
> +		if (ltc3220->uled_cfg[i].registered)
> +			led_classdev_suspend(&ltc3220->uled_cfg[i].led_cdev);
> +	}
> +
> +	return regmap_update_bits(ltc3220->regmap, LTC3220_COMMAND_REG,
> +				 LTC3220_SHUTDOWN_MASK, LTC3220_SHUTDOWN_MASK);
> +}

[Severity: Medium]
Should regcache_mark_dirty(ltc3220->regmap) be called here or in resume?

Without marking the cache dirty, the regcache_sync() in ltc3220_resume()
will silently return without restoring any registers, resulting in the
permanent loss of the blink and gradation states upon resume.

> +
> +static int ltc3220_resume(struct device *dev)
> +{
> +	struct ltc3220 *ltc3220 =3D i2c_get_clientdata(to_i2c_client(dev));
> +	int ret;
> +
> +	ret =3D regmap_update_bits(ltc3220->regmap, LTC3220_COMMAND_REG,
> +				 LTC3220_SHUTDOWN_MASK, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regcache_sync(ltc3220->regmap);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-ltc3220-dr=
iver-v11-0-6e51dd97ced6@analog.com?part=3D2
