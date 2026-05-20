Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9FC2DC357
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286946; cv=none; b=EkgNmCgRt1i1u7fpC8EtQ1aIld5fYqtDmc9lOsF/wKrscXrJfn1H1jveWWI6e0YeSruBUOAet+nDMy/+AlhVuAfHU6f7c7DawS0DcX5u9paLvknmCJRkHy7r7YItolGxj54M0bLgv2L17+A05nDS4UfM+dwJzYsCj7GhJjDtBdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286946; c=relaxed/simple;
	bh=QoXnxKVcwUihjxDvpZNOk95caiYtdwjfmdLfP5nXNjc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CulPIFijNC2JZCCyGCroZj5IvKarVCAHSdlhS93pGR6yymGXjjQELEx4LBO1xyfV9Emtj3EmdnA0CYbG8vKhOFe/Gm6sWAOybKeQKlEmDyxhIeX6bRffZAt7eYVEJWXty17YVV7cMxkxpxEjzR8JqjZGeXhvdQpv1mZv54fcyow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VDuzNIbv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VDuzNIbv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8681F000E9;
	Wed, 20 May 2026 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779286945;
	bh=Da5qYyI6CKpPFSL8BaW6/6q4oMneDRq/u5oxcQIipyk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VDuzNIbvFjlguxNKUqOJfx0JGYJm4Di+5Y/lrJIGoweGp0im998CgA4522LQEQral
	 NKPZ4hMOHprYuIrZnkEq3TUVDY1V95EjgU7+sdP+aWqYURI6vwRacwQLxQ6BW4kOO8
	 WizGcSGzLlDyqBdY78xVUozuK2hmfGZ1gmnVuMdRF+vMc58aoxpFO4pB2/vbuw+y0T
	 1NSrjSu5QinPJ9DrxkcNT/Mlnbo9o+U6kwKCCNMF2YHgwTP2j3++0LL200ks9u7vjY
	 Npoc0ztc4jD0Yq/5sNBpUL3olI4099dG9ESP41IcSxCbTiENMxmHI4KHxeY1VjJq/p
	 T1Qz5nYC2l+5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/6] leds: is31fl32xx: Add powerdown pin for hardware
 shutdown mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260520133343.1423946-5-jerrysteve1101@gmail.com>
References: <20260520133343.1423946-5-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 14:22:24 +0000
Message-Id: <20260520142224.6A8681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Improper teardown ordering causes I2C writes to fail during LED un=
registration.
- [Medium] Hardware is left powered on indefinitely if probe() fails.
- [Medium] Using a non-sleeping GPIO API triggers a kernel warning if the G=
PIO is on a sleepable controller.

Pre-existing issues:
- [High] Premature user-space and trigger exposure creates a race condition=
 that overwrites LED state.
--

commit 50d65262dc7ba9a3a04390c06e026bf8715319ba
Author: Jun Yan <jerrysteve1101@gmail.com>

leds: is31fl32xx: Add powerdown pin for hardware shutdown mode

This patch adds support for the SDB shutdown pin on the IS31FL32XX
series. It takes the chip out of shutdown mode by driving the pin low
during probe, and asserts the pin during remove to put the chip back
into shutdown mode.

> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32x=
x.c
> index fe07acbb103a8..b5207ad6ae966 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c
[ ... ]
> @@ -421,6 +423,14 @@ static int is31fl32xx_parse_dt(struct device *dev,
>  	const struct is31fl32xx_chipdef *cdef =3D priv->cdef;
>  	int ret =3D 0;
> =20
> +	/* Driving this GPIO line low takes the chip out of shutdown,
> + 	 * as it is flagged as GPIO_ACTIVE_LOW in provider (such as the device=
 tree).
> + 	 */
> +	priv->powerdown_gpio =3D devm_gpiod_get_optional(dev, "powerdown", GPIO=
D_OUT_LOW);

[Severity: Medium]
If the probe process fails after this point, does the hardware stay powered
on indefinitely?

devres will release the GPIO descriptor but won't revert the physical output
state, leaving the chip permanently active.

[Severity: High]
This isn't a bug introduced by this patch, but does this function premature=
ly
expose the LEDs to userspace?

is31fl32xx_parse_dt() registers the LEDs using
devm_led_classdev_register_ext(), making them instantly visible to userspace
and applying default triggers. This happens before the driver calls
is31fl32xx_init_regs() later in probe(), which performs an I2C reset of
all registers.

Consequently, any brightness set by a default trigger or a fast userspace
process in the intervening window will be completely overwritten and lost.

> +	if (IS_ERR(priv->powerdown_gpio))
> +		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
> +				"Failed to get powerdown gpio\n");
> +
>  	if ((cdef->output_frequency_setting_reg !=3D IS31FL32XX_REG_NONE) &&
[ ... ]
> @@ -609,6 +619,9 @@ static void is31fl32xx_remove(struct i2c_client *clie=
nt)
>  	if (ret)
>  		dev_err(&client->dev, "Failed to reset registers on removal (%pe)\n",
>  			ERR_PTR(ret));
> +
> +	if (priv->powerdown_gpio)
> +		gpiod_set_value(priv->powerdown_gpio, 1);

[Severity: High]
Does this premature powerdown cause I2C writes to fail during LED
unregistration?

The driver registers LEDs using devm_led_classdev_register_ext(), meaning
devres handles unregistration after the driver's remove() hook completes.
During unregistration, the LED subsystem turns off the LEDs by calling the
driver's brightness callback, which performs I2C writes.

If the chip is powered down here, those writes will fail and cause kernel l=
og
spam. Could the power-down action be managed via devm_add_action_or_reset()
after device registration to ensure it executes after the LEDs are cleanly
unregistered?

[Severity: Medium]
Since this remove function runs in a sleepable context, could this trigger a
gpiolib warning?

If the powerdown GPIO is connected to a sleepable controller (like an I2C
or SPI GPIO expander), calling the non-sleeping gpiod_set_value() will
trigger a warning within the gpiolib core. Should this use
gpiod_set_value_cansleep() instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520133343.1423=
946-1-jerrysteve1101@gmail.com?part=3D4
