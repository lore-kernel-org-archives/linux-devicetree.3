Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4022723AB81
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 15:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780846370; cv=none; b=kOXFUKOk3U/dsH4nB2ZiFDpFk6c94njfC+aK4IuonFzuJr8lOeb3MJg7qk/Z8ShNxZRAK+SZDpLDamO3AChEYWv/I6sujiOG7d/GcYBDaIw8JMKMQweY1E+tRt+nFOC9zc+WMJcnb2dp8C468TBGY1U9bofWNZdHGn48N9xgpGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780846370; c=relaxed/simple;
	bh=Gpvr4PtN18SCMlok0BmrrrpIqgQFir7DMFK4wQ+WrlI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XUZ0gvPVlRk3RykgOknJhOYbmq8+g/mHwLwYUVA3EXxmmFx8DmZnt1tYecBW0PaQrM0M2wDbQYckO+xJoJwGWkhwmdz1OKqx2ZB8w359PkdyC8lOzJtr9oZM1BEQH9mmqm5mQGemP2Nj4nSCXb6liL6Lp0La3lj/N/9iaFTD1II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V05nSjF0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V05nSjF0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB65B1F00893;
	Sun,  7 Jun 2026 15:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780846368;
	bh=IjLFBFEC88zQd1THFbSqon5nxxh+ISy7KK2bNy2fAjc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V05nSjF0JESX4gWuxzrWCSLP8TXtW8y4QXPO8CCCCa7hpu09Jc/hFUxYHwo46FFEB
	 w1ckKwy5yJu7+dCITv1ZyPjHrI77ni9OVAcsO2Q7AHbVBdDQKsIb71Fn9Njf+2E5C/
	 NMagO5hmhHLi/qDZBCEL4f6Cz0jaK5kBoAb2B9HIix99bC2yrmTKwEIXmwWCskZJXy
	 /tdfVoAlO2s8Fh2uHQ1kNhsGlENh2986FG5j+wzB7Uiyd7osanGnpC4SDW3lGXTmAg
	 EcagI8cgZzlcFtjoFxue5dN+kXiCubT9cDGajkIQmdM+lKZBK72LkYgZuJ2alTInOy
	 eKAmi+uqJIXJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/6] leds: is31fl32xx: Fix missing brightness_steps
 for is31fl3236
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260607152002.446617-6-jerrysteve1101@gmail.com>
References: <20260607152002.446617-6-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 15:32:48 +0000
Message-Id: <20260607153248.AB65B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Missing IS31FL32XX_REG_NONE initialization for output_frequency_se=
tting_reg in is31fl3293_cdef leads to arbitrary register corruption.
- [High] I2C writes are sent to a powered-down hardware device during drive=
r removal.

Pre-existing issues:
- [High] Incorrect bound checking and inverted logic for current limit calc=
ulation ignores DT-specified safety limits and causes register overflow.
- [High] LED class devices are registered and exposed to userspace before t=
he hardware is initialized and taken out of reset.
--

commit 19aea3a466357ecc0f41f0475513b5da802e6488
Author: Jun Yan <jerrysteve1101@gmail.com>

leds: is31fl32xx: Fix missing brightness_steps for is31fl3236

This commit adds the missing brightness_steps value for the is31fl3236
LED driver to fix brightness control issues.

> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32x=
x.c
> index f9d3b9a707ca5..0c811aebcbcfe 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c
> @@ -492,6 +492,7 @@ static const struct is31fl32xx_chipdef is31fl3236_cde=
f =3D {
>  	.pwm_register_base			=3D 0x01,
>  	.led_control_register_base		=3D 0x26,
>  	.enable_bits_per_led_control_register	=3D 1,
> +	.brightness_steps			=3D 256,
>  };
> =20
>  static const struct is31fl32xx_chipdef is31fl3236a_cdef =3D {

While reviewing this file, I also noticed a few other regressions in the sa=
me
driver:

drivers/leds/leds-is31fl32xx.c:is31fl3293_reset() {
...
	for (i =3D 0; i < priv->num_leds; i++) {
		struct is31fl32xx_led_data *led_data =3D &priv->leds[i];
		int current_level_reg =3D IS31FL3293_CL_REG + led_data->channel - 1;
		int microamp =3D max(led_data->max_microamp, IS31FL3293_MAX_MICROAMP);
		int current_level =3D (microamp * 0xff) / IS31FL3293_MAX_MICROAMP;

		ret =3D is31fl32xx_write(priv, current_level_reg, current_level);
...
}

[Severity: High]
This isn't a bug introduced by this patch, but does this calculation handle=
 the
current limit bounds correctly?

It appears that max(led_data->max_microamp, IS31FL3293_MAX_MICROAMP) forces
microamp to be at least 20,000 (the value of IS31FL3293_MAX_MICROAMP). If a
device tree requires a lower safety limit (e.g., 5000), it seems it would be
ignored.

Conversely, if the device tree specifies a value larger than 20,000 (e.g.,
30,000), the calculated current_level evaluates to 382. When passed to
is31fl32xx_write(), which takes a u8 parameter, won't this overflow and
truncate to 126, silently programming a drastically lower current limit?


drivers/leds/leds-is31fl32xx.c:is31fl32xx_probe() {
...
	ret =3D is31fl32xx_parse_dt(dev, priv);
	if (ret)
		return ret;

	ret =3D is31fl32xx_init_regs(priv);
...
}

[Severity: High]
This is a pre-existing issue, but could this ordering lead to a race condit=
ion
with userspace?

is31fl32xx_parse_dt() calls devm_led_classdev_register_ext(), which
immediately publishes the LED devices. The LED subsystem might apply
default-state triggers, or userspace might set the brightness, which sends
PWM writes to the device over I2C.

However, the hardware registers are only initialized and reset in
is31fl32xx_init_regs() afterwards. Won't this reset wipe out any brightness
state configured during or immediately after LED registration? Should the
hardware be fully initialized before device registration?


drivers/leds/leds-is31fl32xx.c:
...
static const struct is31fl32xx_chipdef is31fl3293_cdef =3D {
	.channels				=3D 3,
	.shutdown_reg				=3D IS31FL32XX_REG_NONE,
	.pwm_update_reg				=3D 0x28,
	.pwm_update_value			=3D 0xc5,
	.global_control_reg			=3D IS31FL32XX_REG_NONE,
	.reset_reg				=3D IS31FL32XX_REG_NONE,
	.pwm_register_base			=3D 0x19,
	.led_control_register_base		=3D IS31FL32XX_REG_NONE,
	.brightness_steps			=3D 4096,
	.reset_func				=3D is31fl3293_reset,
	.sw_shutdown_func			=3D is31fl3293_software_shutdown,
};
...

[Severity: High]
Is is31fl3293_cdef missing the initialization for output_frequency_setting_=
reg?

Since this field isn't set to IS31FL32XX_REG_NONE, it is implicitly initial=
ized
to 0x00. During probe, is31fl32xx_init_regs() checks if this field is
!=3D IS31FL32XX_REG_NONE (which is 0xFF). Since 0x00 !=3D 0xFF, if the DT
contains the issi,22khz-pwm property, the driver will erroneously write 0x01
to register 0x00.

For the IS31FL3293, register 0x00 is undefined. Can this silently corrupt t=
he
chip state?


drivers/leds/leds-is31fl32xx.c:is31fl32xx_remove() {
...
static void is31fl32xx_remove(struct i2c_client *client)
{
	struct is31fl32xx_priv *priv =3D i2c_get_clientdata(client);
	int ret;

	ret =3D is31fl32xx_reset_regs(priv);
...
	if (priv->powerdown_gpio)
		gpiod_set_value_cansleep(priv->powerdown_gpio, 1);
}
...

[Severity: High]
Will the device acknowledge I2C writes after being powered down during remo=
val?

In is31fl32xx_remove(), the driver asserts powerdown_gpio to place the chip
into a hardware shutdown mode. After remove() completes, devres automatical=
ly
unregisters the LED class devices that were allocated in is31fl32xx_parse_d=
t().

During unregistration, the LED subsystem turns off the LEDs by calling
is31fl32xx_brightness_set(), which attempts to write to the chip over I2C.
Because the chip is already physically powered down, won't this result in I=
2C
timeouts or EREMOTEIO errors on every driver removal?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607152002.4466=
17-1-jerrysteve1101@gmail.com?part=3D5
