Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEC0344DB5
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779293037; cv=none; b=u9WEzwxpIs9p5LXkM20qhoqHjZ5G8xlYfRRcwqIHoora5P68LkrzKjV4J1Fiw1mfhiAm/0g22RGZ/5LGRM38aR7rVvZ3VxMyjQbaRxY9b6QOcisS3Lfu7+oGGLWbiXgEpng1uIX9yWJNP6Q/H5Mda5jGKE52/XKfRpYQizWVtOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779293037; c=relaxed/simple;
	bh=n4pLhxe10aAsAHunyY5VXGOUYx5L8re42WC5ZFN4Xz8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pbWhK2saJc5quU4C/NkD1ArFr/FjldSEGXDXGIdtbod3iOn9U9R0Kc7y+Upw3yw7G2D2P2HQiKjccBzmhBrO3Eo+C+2CTzMoMt8hy0KulMlLihj0NLTi/bLQ65r4q4gQ9EY3uQ8PBjipMGr1zQFgC8X00krXapRyGnlV/9w3iOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DhYG29It; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DhYG29It"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F3C1F000E9;
	Wed, 20 May 2026 16:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779293035;
	bh=vC6FBxkJOurXjbtx7Ud+M3mgbkXTGk+vlBfotO7mVG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DhYG29ItXfylxnZlNwMQTvUeLTwlovvfBdNiNpaJKUOkA4T9TD7g9q+7mwqMXv64b
	 QK19NtqiyLyiponZXQgJZKI6cN5FT0u7RuTbOMYKmsNtBIztqtN0SRya6OpcLfWE5I
	 x5rceT+ZuxC/bZ/nmxNn7hEjNJI2hTpWv6TWuqj/hgtz54OhVfENa40EDcKCGW02Vl
	 VsZQrxkUMd49PbvJ3DIj6Yii0XA0e8CWIcgRjHJqlmUg6u3ov0Oel1b0zav0Y+iRUO
	 uIbc7bQhfvv4pItztEPesOKJBnM9DbT0009CqjH7OiRjGWcxnfW+b3HRFamq84DqVr
	 mc6DR33mpbPvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/6] leds: is31fl32xx: Move pwm frequency setting to
 init_regs()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260520135659.1430008-7-jerrysteve1101@gmail.com>
References: <20260520135659.1430008-7-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 16:03:55 +0000
Message-Id: <20260520160355.A8F3C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] LED class devices are registered and exposed to userspace before t=
he hardware is fully initialized, allowing initial states to be overwritten=
 by the subsequent hardware reset.
- [High] The driver tears down the hardware manually in `remove()` while th=
e LED class devices are still accessible to userspace.
- [High] Incorrect logic when calculating maximum current limits for IS31FL=
3293 leads to broken limit enforcement and truncation.
--

commit 4a46eb293f0e15dbc00b614e110870654f6c33ca
Author: Jun Yan <jerrysteve1101@gmail.com>

leds: is31fl32xx: Move pwm frequency setting to init_regs()

This commit moves the PWM frequency setting logic from is31fl32xx_parse_dt()
to is31fl32xx_init_regs(). This separates device tree parsing from hardware
initialization and prevents the configuration from being overwritten.

Fixes: a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")

> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32x=
x.c
> index 2d7ff4c5a08c7..c545a3b7a05a1 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c
[ ... ]
> @@ -420,7 +429,6 @@ static struct is31fl32xx_led_data *is31fl32xx_find_le=
d_data(
>  static int is31fl32xx_parse_dt(struct device *dev,
>  			       struct is31fl32xx_priv *priv)
>  {
> -	const struct is31fl32xx_chipdef *cdef =3D priv->cdef;
>  	int ret =3D 0;
> =20
>  	/* Driving this GPIO line low takes the chip out of shutdown,
> @@ -431,17 +439,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
>  		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
>  				"Failed to get powerdown gpio\n");
> =20
> -	if ((cdef->output_frequency_setting_reg !=3D IS31FL32XX_REG_NONE) &&
> -	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
> -
> -		ret =3D is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
> -				       IS31FL32XX_PWM_FREQUENCY_22KHZ);
> -
> -		if (ret) {
> -			dev_err(dev, "Failed to write output PWM frequency register\n");
> -			return ret;
> -		}
> -	}
> +	priv->pwm_22khz =3D of_property_read_bool(dev_of_node(dev), "issi,22khz=
-pwm");
> =20
>  	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
>  		struct led_init_data init_data =3D {};

[Severity: High]
This isn't a regression introduced by this patch, but since this commit
relates to initialization order, does registering the LEDs here before
hardware is fully initialized cause a regression?

Looking at the driver sequence, is31fl32xx_parse_dt() registers each LED by
calling devm_led_classdev_register_ext(), exposing them to userspace early.
The LED subsystem then evaluates properties like default-state and triggers,
performing asynchronous I2C writes to set initial brightness.

However, is31fl32xx_init_regs() runs afterward and performs a full register
reset via is31fl32xx_reset_regs().

Could this sequence allow boot-time configurations and early userspace
settings to be lost when the hardware is unconditionally reset?

[Severity: High]
This is also a pre-existing regression, but I noticed the driver relies on
devm_led_classdev_register_ext() for unregistration. Does this create a
race condition during device teardown?

The driver manually resets and powers down the hardware in
is31fl32xx_remove(). Because devres cleanup executes after remove()
completes, the LED devices seem to remain fully accessible to userspace
for a short window.

If a brightness change is requested during this window, would I2C writes be
dispatched to an uninitialized or powered-down chip, potentially causing
bus timeouts or stalls?

While reviewing the hardware initialization logic, I noticed another issue
in the maximum current calculations:

[Severity: High]
This is a pre-existing regression, but does the maximum current calculation
in is31fl3293_reset() correctly enforce the limits?

It calculates the limit using max(led_data->max_microamp,
IS31FL3293_MAX_MICROAMP). If the device tree specifies a limit below the
20mA chip maximum (e.g., 10mA), max() overrides it with 20mA, which defeats
the protection. If a value above 20mA is specified, max() retains the larger
value, causing the resulting current_level calculation to exceed 255.

Since is31fl32xx_write() takes a u8 for the value, this current_level would
be silently truncated (e.g., 382 becomes 126), resulting in an incorrectly
low limit.

Should the driver use min() instead of max() to properly enforce the limit,
and perhaps supply a fallback when the property is 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520135659.1430=
008-1-jerrysteve1101@gmail.com?part=3D6
