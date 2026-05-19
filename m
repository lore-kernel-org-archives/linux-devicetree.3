Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AABA61FCE
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779155404; cv=none; b=F+tKw+FnYuvbDeriP8aZs+C3msn0tnvNuoQu6zt0MA29GWLKCJZCai2YcQZMnGXKxk5EeSby//eGIeWkWiKQfekHvJdjYuayt/fbRLSFRXR4zG2J1gWM2U+S+idCMysyf9tpAkaHtmO5BWVjf4VlK7XaLX2jbiFi4/wx+GQcVfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779155404; c=relaxed/simple;
	bh=pwFylXLZcRaRpgMkNw1AAPM/wMOE7G7/4zAvHIJwbkQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cku43Fypip1bZu7tcsXj5Tw0ahalwj+10RpfGPcmZan86t3xX1wUHGpkEQxj79RMydZGG8Y/JGPuc1kyyGlWGr9k+b8R/Uuc2KXXGNnAdVSTWJmzAU+XTY0unWm7g7eYFVnWvthHFlp8eWRT8gPVikOaBeS1Bf5xciYg3yhd1Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiwmsX5V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiwmsX5V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 866FDC2BCB7;
	Tue, 19 May 2026 01:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779155404;
	bh=pwFylXLZcRaRpgMkNw1AAPM/wMOE7G7/4zAvHIJwbkQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=JiwmsX5V99JQlVJUzsUAcirH59unA2vbzJ0RU7NCwYR8lqgLnDoRG1IbU9kG7OEe4
	 UQyBnUY3tySFAq0iZf1tzDb4zKJcXbRyqgQYBVntl83h7diNr8vYOJVvHjM8suLQov
	 32Jlp4wB8BQCmUmF6IENKos5KU1e0eJv6Nt1jMz+2TrgNXgzrgc8/irMEd/gGgaSfx
	 9RB8Elncs1Gyl4YVfcgH9SxuvRRkOUoRqi8J5/7IWjEo/m79HD3AemFgrOX+6NhIHL
	 X+2LeDzJEo8CQlCACbS3D4rek2CZXJN9Xhb4s5C+5QV0OKIlBzW1sWUx6sntMTLrLl
	 gEnB8ctS6ImSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] leds: ltc3220: Add Support for LTC3220 18
 channel LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Edelweise Escala" <edelweise.escala@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519-ltc3220-driver-v8-2-e1771c1733f7@analog.com>
References: <20260519-ltc3220-driver-v8-2-e1771c1733f7@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 01:50:02 +0000
Message-Id: <20260519015003.866FDC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The driver abuses the `brightness` attribute to multiplex hardware=
 modes, violating standard LED UAPI.
- [High] The `blink_mode` value is not shifted before being written via `re=
gmap_update_bits()`, causing blink timing to fail.
- [High] `ltc3220_blink_set()` fails to enable blink mode on the target LED=
's control register.
- [High] `ltc3220_pattern_clear()` incorrectly halts the global gradation t=
imer and fails to reset the individual LED mode.
- [High] Duplicate `reg` values in the device tree cause double-registratio=
n and list corruption.
- [High] Missing `select REGMAP_I2C` in Kconfig leads to silent build failu=
res.
- [Medium] Missing `led_classdev_suspend()` and `led_classdev_resume()` cal=
ls during power management.
--

commit 0ef3ccbe351040b28172d9e382676a039d0118d4
Author: Edelweise Escala <edelweise.escala@analog.com>

leds: ltc3220: Add Support for LTC3220 18 channel LED Driver
   =20
Add driver for the LTC3220 18-channel LED driver with I2C interface,
individual brightness control, and hardware-assisted blink/gradation featur=
es.

> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 597d7a79c988b..f00cdc11c9782 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -1001,6 +1001,18 @@ config LEDS_ST1202
>  	  Say Y to enable support for LEDs connected to LED1202
>  	  LED driver chips accessed via the I2C bus.
> =20
> +config LEDS_LTC3220
> +	tristate "LED Driver for Analog Devices Inc. LTC3220"
> +	depends on I2C && LEDS_CLASS

Should this configuration select REGMAP_I2C? If the driver is built with
CONFIG_I2C enabled but no other module selects CONFIG_REGMAP_I2C, will the
compilation fail with an undefined reference to __devm_regmap_init_i2c?

> diff --git a/drivers/leds/leds-ltc3220.c b/drivers/leds/leds-ltc3220.c
> new file mode 100644
> index 0000000000000..0941acf39118a
> --- /dev/null
> +++ b/drivers/leds/leds-ltc3220.c
[ ... ]
> +static int ltc3220_pattern_clear(struct led_classdev *led_cdev)
> +{
> +	struct ltc3220_uled_cfg *uled_cfg =3D container_of(led_cdev, struct ltc=
3220_uled_cfg,
> +							 led_cdev);
> +	struct ltc3220 *ltc3220 =3D container_of(uled_cfg, struct ltc3220,
> +					       uled_cfg[uled_cfg->led_index]);
> +
> +	return regmap_update_bits(ltc3220->regmap, LTC3220_GRAD_BLINK_REG,
> +				  LTC3220_GRADATION_MASK, 0);
> +}

Since LTC3220_GRAD_BLINK_REG is a shared global register, will clearing the
gradation mask here abruptly break gradation patterns currently executing on
other active LEDs?

Also, should this function reset the target LED's individual mode bits back
to normal mode in LTC3220_ULED_REG to avoid leaving it in a stale state?

[ ... ]
> +static int ltc3220_blink_set(struct led_classdev *led_cdev,
> +			     unsigned long *delay_on,
> +			     unsigned long *delay_off)
> +{
[ ... ]
> +	return regmap_update_bits(ltc3220->regmap, LTC3220_GRAD_BLINK_REG,
> +				  LTC3220_BLINK_MASK, blink_mode);
> +}

Does this properly set the blink timing? Since LTC3220_BLINK_MASK is defined
as GENMASK(4, 3) and the regmap API applies it using bitwise AND, will
blink_mode & 0x18 always evaluate to 0? Should this use
FIELD_PREP(LTC3220_BLINK_MASK, blink_mode) instead?

Additionally, does this successfully enable blink mode on the target LED? It
sets the global blink timings, but doesn't appear to write to the individual
LED's configuration register (LTC3220_ULED_REG). Will the target LED remain
in its previous state instead of actually blinking?

[ ... ]
> +static int ltc3220_suspend(struct device *dev)
> +{
> +	struct ltc3220 *ltc3220 =3D i2c_get_clientdata(to_i2c_client(dev));
> +
> +	return regmap_update_bits(ltc3220->regmap, LTC3220_COMMAND_REG,
> +				  LTC3220_SHUTDOWN_MASK, LTC3220_SHUTDOWN_MASK);
> +}
> +
> +static int ltc3220_resume(struct device *dev)
> +{
> +	struct ltc3220 *ltc3220 =3D i2c_get_clientdata(to_i2c_client(dev));
> +
> +	return regmap_update_bits(ltc3220->regmap, LTC3220_COMMAND_REG,
> +				  LTC3220_SHUTDOWN_MASK, 0);
> +}

Should these callbacks invoke led_classdev_suspend() and
led_classdev_resume()? Without them, could active LED triggers fail to pause
and continue issuing concurrent I2C writes to the device while it is in
shutdown?

[ ... ]
> +static int ltc3220_probe(struct i2c_client *client)
> +{
[ ... ]
> +	device_for_each_child_node_scoped(&client->dev, child) {
[ ... ]
> +		/* LED node reg/index/address goes from 1 to 18 */
> +		led_index =3D source - 1;
> +		led =3D &ltc3220->uled_cfg[led_index];
> +		led->led_index =3D led_index;
> +		led->reg_value =3D 0;
> +		led->led_cdev.brightness_set_blocking =3D ltc3220_set_led_data;
> +		led->led_cdev.brightness_get =3D ltc3220_get_led_data;
> +		led->led_cdev.max_brightness =3D 255;

Does exposing a 0 to 255 scale cause standard userspace actions to
inadvertently switch hardware modes? If a user writes 255 to turn the LED
fully on, will it switch into GPO mode instead of setting maximum brightnes=
s?

Should max_brightness be restricted to 63 to keep standard triggers working,
with hardware mode switching handled internally?

> +		led->led_cdev.blink_set =3D ltc3220_blink_set;
> +		led->led_cdev.pattern_set =3D ltc3220_pattern_set;
> +		led->led_cdev.pattern_clear =3D ltc3220_pattern_clear;
> +
> +		ret =3D devm_led_classdev_register_ext(&client->dev, &led->led_cdev, &=
init_data);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret, "Failed to register LED class=
\n");
> +	}

What happens if the device tree contains multiple child nodes with the same
reg value?

Because the driver uses the source property to index into the pre-allocated
ltc3220->uled_cfg array without checking if the index is already initialize=
d,
could it pass the exact same led_classdev structure to
devm_led_classdev_register_ext() multiple times?

Would this cause the core LED subsystem to call list_add_tail() on an
already-linked node, corrupting the global leds_list?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-ltc3220-dr=
iver-v8-0-e1771c1733f7@analog.com?part=3D2
