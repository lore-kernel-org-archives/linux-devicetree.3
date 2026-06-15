Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB413939B1
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501888; cv=none; b=Qk3+tdIEcebxciIx0KcHGzocnxSPH9H40leZ8rcE5RPaTEQbw8F+wtzdaHFrTwecyLQkPHD5/Kr74TIzSnAOoCVCxN0CRaZFoOYAwlhsj0Xycs5qJ/XC9jjXPI2a8sL30AkleCwXpRM17heu+2N0ssFACjsaPYjCsFHDTvJUgKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501888; c=relaxed/simple;
	bh=N0WXiA6SWlvtL/7hF8vPldG7snGqnrIi4kE1v+TwFbY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XyenAewY78599D+OzCuSLykJ3c9BP/MuwPvRvWm3ukr2Y46N+3fBdpvzIn4lfanlbKM5ThnLyT3lnzBHkFyJnghsaL58YL1tI0m8aslM9vbdPIQhMffgaXrvBBHA4YXCjHWEXOQlL99bJYMO84IdA3SBwt3DVy0RdwmGibEkf4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JacswRQO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JacswRQO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B02E1F000E9;
	Mon, 15 Jun 2026 05:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781501884;
	bh=dudDeFIuibwcIVMSiW+oUl0A1wCVH2r4/BA15iroOfI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JacswRQOTsJD2TC6vKMV/Wb46i2H5J+bfrSxR0peM735f7733oYI+Vi2VYjIpIf2n
	 6f+NgSJBebStXm7Bemr4NeW4hE85gHwLbxreQ8ManP90hpAVDWP86Nx+TZRuFOr+yR
	 mHY6Cbg3z2M9C5/e71FTTxAPQdjBBL/Yg/vPmjV2axWhu0uuagXbRvFc2poNZao6d3
	 CZpyOy2basGR2X0TLfpn22uTrooM8mO/Nf5VM88PcdULvljKKN3GxdTxOKzyA00DRk
	 vvQIRFuuOi3zqVtq8JBk+VTgw2AmbRT7nw/Gq66k17069iw/pOZNZ4q7l6uBBFPurV
	 2pcefsrfsqlMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/2] leds: ltc3220: Add Support for LTC3220 18
 channel LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Edelweise Escala" <edelweise.escala@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615-ltc3220-driver-v10-2-916562c88598@analog.com>
References: <20260615-ltc3220-driver-v10-2-916562c88598@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 05:38:03 +0000
Message-Id: <20260615053804.0B02E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Duplicate LED `reg` values bypass the validation check, leading to=
 a doubly-linked list corruption in the LED core.
- [Medium] Missing LED class suspend/resume calls in system PM callbacks.
- [Medium] The `pattern_set` callback silently ignores the `repeat` paramet=
er, breaking continuous patterns.
- [Low] Setting blink mode on a deactivated LED causes an unnecessary I2C r=
ead and hardware glitch.
--

commit ff936b952a6a427e0232229537a10438e4f34a11
Author: Edelweise Escala <edelweise.escala@analog.com>
Subject: leds: ltc3220: Add Support for LTC3220 18 channel LED Driver

Add driver for the LTC3220 18-channel LED driver with I2C interface,
individual brightness control, and hardware-assisted blink/gradation featur=
es.

> diff --git a/drivers/leds/leds-ltc3220.c b/drivers/leds/leds-ltc3220.c
> new file mode 100644
> index 0000000000000..f95174ae451ba
> --- /dev/null
> +++ b/drivers/leds/leds-ltc3220.c
[ ... ]
> +static int ltc3220_pattern_set(struct led_classdev *led_cdev,
> +			       struct led_pattern *pattern,
> +			       u32 len, int repeat)
> +{

[Severity: Medium]
Does this callback silently ignore the repeat parameter?=20

If the user requests infinite repetition (for example, repeat is -1), the=20
driver returns 0 without programming continuous breathing. Should this retu=
rn=20
-EOPNOTSUPP when repetition is requested, so the LED core can fall back to=
=20
software-driven repetition instead of halting after a single ramp?

> +	struct ltc3220_uled_cfg *uled_cfg =3D container_of(led_cdev, struct ltc=
3220_uled_cfg,
> +							 led_cdev);
[ ... ]
> +static int ltc3220_blink_set(struct led_classdev *led_cdev,
> +			     unsigned long *delay_on,
> +			     unsigned long *delay_off)
> +{
[ ... ]
> +	/* Ensure LED has non-zero brightness before enabling blink mode */
> +	if (uled_cfg->reg_value =3D=3D 0) {
> +		ret =3D regmap_write(ltc3220->regmap, LTC3220_ULED_REG(uled_cfg->led_i=
ndex),
> +				   led_cdev->max_brightness);
> +		if (ret)
> +			return ret;
> +
> +		uled_cfg->reg_value =3D led_cdev->max_brightness;
> +	}
> +
> +	return regmap_update_bits(ltc3220->regmap, LTC3220_ULED_REG(uled_cfg->l=
ed_index),
> +				  LTC3220_LED_MODE_MASK,
> +				  FIELD_PREP(LTC3220_LED_MODE_MASK, LTC3220_BLINK_MODE));
> +}

[Severity: Low]
When ltc3220_blink_set() is called on an LED with zero brightness, does thi=
s=20
sequence cause a visual glitch and an unnecessary I2C read?=20

The first regmap_write() turns the LED on solid in normal mode, and then=20
regmap_update_bits() incurs an I2C read to switch it to blink mode. Could=20
the driver construct the final 8-bit value from the cached brightness and=20
write it directly using a single regmap_write()?

[ ... ]
> +static int ltc3220_suspend(struct device *dev)
> +{
> +	struct ltc3220 *ltc3220 =3D i2c_get_clientdata(to_i2c_client(dev));
> +
> +	return regmap_update_bits(ltc3220->regmap, LTC3220_COMMAND_REG,
> +				  LTC3220_SHUTDOWN_MASK, LTC3220_SHUTDOWN_MASK);
> +}

[Severity: Medium]
Does this suspend callback miss notifying the LED core about the suspension=
?=20

By not iterating over the registered LEDs and calling led_classdev_suspend(=
),=20
the LED core remains unaware the device is suspended and will not pause=20
triggers. Could an active software trigger attempt an I2C transaction while=
=20
the system is suspending, potentially causing bus timeouts?

[ ... ]
> +static int ltc3220_probe(struct i2c_client *client)
> +{
[ ... ]
> +	/* First pass: validate configuration and set up LED structures */
> +	device_for_each_child_node_scoped(&client->dev, child) {
> +		struct ltc3220_uled_cfg *led;
> +		u32 source;
[ ... ]
> +		/* LED node reg/index/address goes from 1 to 18 */
> +		led_index =3D source - 1;
> +		led =3D &ltc3220->uled_cfg[led_index];
> +
> +		if (led->led_cdev.dev)
> +			return dev_err_probe(&client->dev, -EINVAL,
> +					     "Duplicate LED reg %u found", source);

[Severity: High]
Is led_cdev.dev always null during the first pass of ltc3220_probe()?=20

Since ltc3220 is allocated with devm_kzalloc(), led_cdev.dev will be zero. =
It=20
is only assigned during devm_led_classdev_register_ext() in the second pass=
,=20
so this duplicate checking logic appears to be bypassed.

If a device tree contains duplicate reg values, will it silently overwrite=
=20
the same uled_cfg structure during this first pass?

[ ... ]
> +	/* Second pass: register LEDs after validation */
> +	device_for_each_child_node_scoped(&client->dev, child) {
> +		struct led_init_data init_data =3D {};
> +		struct ltc3220_uled_cfg *led;
> +		u32 source;
> +
> +		ret =3D fwnode_property_read_u32(child, "reg", &source);
> +		if (ret)
> +			return ret;
> +
> +		init_data.fwnode =3D child;
> +		init_data.devicename =3D "ltc3220";
> +
> +		led_index =3D source - 1;
> +		led =3D &ltc3220->uled_cfg[led_index];
> +
> +		ret =3D devm_led_classdev_register_ext(&client->dev, &led->led_cdev, &=
init_data);

[Severity: High]
Following from the duplicate check bypass above, if a duplicate reg value i=
s=20
present, will devm_led_classdev_register_ext() call list_add_tail() twice o=
n=20
the exact same node address? This would corrupt the LED core's doubly-linke=
d=20
list and reliably cause a kernel panic upon iteration or removal.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-ltc3220-dr=
iver-v10-0-916562c88598@analog.com?part=3D2
