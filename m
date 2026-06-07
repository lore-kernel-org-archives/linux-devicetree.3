Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02AF1448E0
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 15:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780846333; cv=none; b=NWLr7rylHyC15x5zzcCfxgxlG7RRm9y9+W0QnIjJc7IgBbUZ07xz7XO79TamD/k1cfMD4w1QvS7QvyT26FrrIrox4xVDbfWGbmbJXr83XQe7C/2zrv0f5UMn5ogGXaSJgrwMbQfhhcADrFiUb4Dg152AnUYKjKxXkYLebZbQ44g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780846333; c=relaxed/simple;
	bh=GtRUtqalw2RIhHqoNy9+w16uROoxo5uDg9ozgsT0G9E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vFBCsV9B1fw3U271b43ROGc9e4MRjkksfI4OM4s5GbfKsWfuoNBAQTVD5LvsUEVYwVqDUKqErc1zVxmRFe+SI6yejMm5plK6iPfh6ppCwBvbnBAfxJAkVBd020LbE+rcl6e0r+1LeGQPFY9afvAa2e526iQ2Y9r+xCUHe2xtIxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGXs6T1p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGXs6T1p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020661F00893;
	Sun,  7 Jun 2026 15:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780846332;
	bh=wqZxQXOCPSIOPHzk709clzHAK4U3Bmh3wtBSSC8N/v4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AGXs6T1pI4lSjddbJ2bN6DXI+Qzr79stBkv9FDB8E4tzv3y07Dope1xfQvVk4XKvt
	 CA0+h73wnzBk//tJUWs9rXmKyyF3U87euKP5wrkN14MgG/D6mLl9jZFrHy2z9Q3yD3
	 Cr5rDU8+R/Lj7iuvBVCfAh+fZ9SKkqmeLwcHTE/ReWTnS6mSwHSIscKQ6a6GP4nEB8
	 82wboS6kRyeydo4wht4UglIVkm/cNwONKGMkhKUjmzaFfEvejNsKs7q2zzTFOpOtoU
	 Y9ivwg6oJc8JRSl5aJ0H8sMqYrKxmK861UyF62ZtjSKLAZAD9CRleaTSQGHKGpMss0
	 9UrE8LukqGHHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 6/6] leds: is31fl32xx: Move pwm frequency setting to
 init_regs()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260607152002.446617-7-jerrysteve1101@gmail.com>
References: <20260607152002.446617-7-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 15:32:11 +0000
Message-Id: <20260607153212.020661F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Registering LED class devices before hardware initialization compl=
etes exposes the LEDs prematurely, causing asynchronous initialization (lik=
e default triggers) and userspace accesses to race with and be wiped out by=
 the subsequent hardware reset.
- [High] Incorrect use of `max()` instead of `min()` in `is31fl3293_reset` =
leads to requested current limits being inverted and incorrectly truncated,=
 potentially causing hardware damage to LEDs with lower maximum current rat=
ings.
--

commit b76116518cb056910437127676df1546ae03f030
Author: Jun Yan <jerrysteve1101@gmail.com>

leds: is31fl32xx: Move pwm frequency setting to init_regs()

This commit moves the PWM frequency setting logic from is31fl32xx_parse_dt()
to is31fl32xx_init_regs() to prevent the frequency configuration from being
overwritten by the register reset operation. It separates device tree parsi=
ng
from hardware initialization.

> commit a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
> swapped the order of is31fl32xx_parse_dt() and is31fl32xx_init_regs().

[Severity: High]
This isn't a bug introduced by this patch, but registering LED class devices
before hardware initialization completes exposes the LEDs prematurely.

In is31fl32xx_probe(), is31fl32xx_parse_dt() is called, which internally
executes devm_led_classdev_register_ext() for each LED:

drivers/leds/leds-is31fl32xx.c:is31fl32xx_probe() {
	...
	ret =3D is31fl32xx_parse_dt(dev, priv);
	if (ret)
		return ret;

	ret =3D is31fl32xx_init_regs(priv);
	...
}

This registers the LEDs to the subsystem, potentially immediately triggering
led_set_brightness_nopm() via default state settings (e.g., "default-on").
This schedules an asynchronous work item to configure the LED over I2C.

However, is31fl32xx_probe() then immediately calls is31fl32xx_init_regs(),
which performs a full hardware reset (is31fl32xx_reset_regs()).

If the hardware reset races with or occurs after the default state triggers,
will the initial LED states be wiped out?  Must the hardware be fully
initialized and reset before registering the LED devices?

> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32x=
x.c
> index 0c811aebcbcfe..4039b6336bcd4 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but there is an incorrect use of max()
instead of min() in is31fl3293_reset():

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

This bounds the user-specified current limit against the hardware maximum of
20,000 =C2=B5A (IS31FL3293_MAX_MICROAMP) using max(), forcing the current to
always be at least the max chip rating.

If an LED is only rated for 5mA, does this force it to 20mA, which could
physically damage it?

Furthermore, if a user requests a value larger than 20mA (e.g., 30,000 =C2=
=B5A),
max() allows it.  The subsequent calculation exceeds 255. Because
is31fl32xx_write() takes a u8 argument, this value is truncated, resulting =
in
unexpectedly lower current.

Should the code use min() to properly enforce the hardware's maximum rating?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607152002.4466=
17-1-jerrysteve1101@gmail.com?part=3D6
