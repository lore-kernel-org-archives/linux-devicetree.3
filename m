Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7542535C1A6
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 09:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779011108; cv=none; b=TStBf/ruUn71b554jckuSA32IeMSa5aIGK1hx9uWOUkI4bPXfsnLeP5/e8hyeWaS+532Pz17ubxCMhIRw3jUe6dvRVcp9lLMAayrboTt0yRY/W/mWTDyUBp80Xu8+DKfqkYhEl+PjB8fr0oZvsvwc134bRlxlJloqw8V3DZ1Qro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779011108; c=relaxed/simple;
	bh=n6DNFBD/Ws91LVsJVbMnO4sXel50ZzhFicaMqviswqk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TRo4fO9PmUKzKBdcvF+zqQKg+bJ3Ufp3Q7Rw53hqE0f8CZsijTSgQxPrP6SgjTDLT3I0f7lqiVhFtpBR7R670p1v1Mj6iJEI+yvoG/rjHUxMPbJGaBTIa5+5pXvRuIQinS3/55I4Mzyu5eprHxLdw39vlYQZtpohdGyYjqxXdTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jD816R4M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jD816R4M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFC0C2BCB0;
	Sun, 17 May 2026 09:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779011108;
	bh=n6DNFBD/Ws91LVsJVbMnO4sXel50ZzhFicaMqviswqk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=jD816R4M7fR4Ba592eH9HGiaXPD6/mak9sg/bDwZLU/6FqfGgYa/7ZW95yuKcBAHO
	 Bjo1Io+mz+IoRmwCHIMJ6iilpD7vDfhyp+bw17GvMsuJYgcoAmJcMLLxU3MaRSYQNG
	 4CxBftJHOkssipy54Xqn5vjkp7h0kh1OiS+MSj7PEOIWQwDFskntIoVSK7KhYrRpHb
	 qH6tDhucgBc3AYHx9zcO9OgNHQ7yTz5+JtERa20bmB/Cbg6Mx1pZrg49LPkC3/TicX
	 Schv/ZWW16I0yix7AZG7b2dCzI4HNc7mQ7+QvJO9NbeC6ptyuHIKAcbyKXfaF5vQXI
	 kiA+gC/I3U5OA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 6/6] video: leds: backlight: lm3533: Support getting
 LED sources from DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260517074306.30937-7-clamor95@gmail.com>
References: <20260517074306.30937-7-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 09:45:07 +0000
Message-Id: <20260517094507.BFFC0C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] An off-by-one bounds check skips parsing `led-sources` when exactl=
y the maximum number of items is provided.
- [High] `lm3533_update()` uses static global masks, clobbering the configu=
ration of LEDs belonging to other control banks.
- [High] LVLED4 and LVLED5 configuration is written to the wrong register (=
`LM3533_REG_OUTPUT_CONF1`), corrupting backlight settings.
- [Medium] Assigning the negative error code of `device_property_count_u32`=
 to an unsigned integer circumvents error checks.
- [Medium] Unvalidated device tree array values are used as bit shift amoun=
ts, risking Undefined Behavior.
--

commit a94501f0a6935a4f57e9e0fb89310c12e86759a9
Author: Svyatoslav Ryhel <clamor95@gmail.com>

video: leds: backlight: lm3533: Support getting LED sources from DT

Add Control Bank to HVLED/LVLED muxing support based on the led-sources
defined in the device tree.

> diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> --- a/drivers/leds/leds-lm3533.c
> +++ b/drivers/leds/leds-lm3533.c
[ ... ]
> @@ -639,7 +649,30 @@ static const struct attribute_group *lm3533_led_attr=
ibute_groups[] =3D {
> =20
>  static int lm3533_led_setup(struct lm3533_led *led)
>  {
> -	int ret;
> +	u32 output_cfg_shift =3D 0;
> +	u32 output_cfg_val =3D 0;
> +	int ret, i;
> +
> +	if (led->num_leds) {
> +		for (i =3D 0; i < led->num_leds; i++) {
> +			output_cfg_shift =3D led->leds[i] * 2;

Are the values in led->leds[i] validated against hardware bounds before
being used to calculate the bit shift?=20

If the device tree provides excessively large values, the shift amount could
exceed the integer bit width.

> +			output_cfg_val |=3D led->id << output_cfg_shift;
> +		}
> +
> +		/* LVLED1, LVLED2 and LVLED3 */
> +		ret =3D lm3533_update(led->lm3533, LM3533_REG_OUTPUT_CONF1,
> +				    output_cfg_val << OUTPUT_CONF1_SHIFT,
> +				    OUTPUT_CONF1_MASK);

Since OUTPUT_CONF1_MASK spans all LVLED1-3 bits and control banks are
probed sequentially, will this update clear the routing configurations of
previously probed banks?

> +		if (ret)
> +			return ret;
> +
> +		/* LVLED4 and LVLED5 */
> +		ret =3D lm3533_update(led->lm3533, LM3533_REG_OUTPUT_CONF1,

Is LM3533_REG_OUTPUT_CONF1 the correct register for LVLED4 and LVLED5?

Writing to LM3533_REG_OUTPUT_CONF1 with OUTPUT_CONF2_MASK clears its lower
bits, which might overwrite the hardware mapping for the high-voltage
backlight and LVLED1 settings instead of configuring LVLED4 and LVLED5.

> +				    output_cfg_val >> OUTPUT_CONF2_SHIFT,
> +				    OUTPUT_CONF2_MASK);
> +		if (ret)
> +			return ret;
> +	}
[ ... ]
> @@ -713,6 +746,24 @@ static int lm3533_led_probe(struct platform_device *=
pdev)
>  	led->pwm =3D 0;
>  	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->pwm);
> =20
> +	led->num_leds =3D device_property_count_u32(&pdev->dev, "led-sources");
> +
> +	/*
> +	 * If led-sources property is not set then either this Control Bank uses
> +	 * its default LVLED or is not linked to any LVLED at all.
> +	 */
> +	if (led->num_leds <=3D 0 || led->num_leds > LM3533_MAX_LEDS)

Does assigning the result of device_property_count_u32() directly to the
unsigned led->num_leds cause negative error codes like -EINVAL to wrap into
large positive values?

This causes the led->num_leds <=3D 0 check to fail. Should a signed integer
be used for the return value check before assigning it?

> +		led->num_leds =3D 0;
> +
> +	if (led->num_leds > 0 && led->num_leds < LM3533_MAX_LEDS) {

Does the strict inequality led->num_leds < LM3533_MAX_LEDS prevent the
driver from reading the led-sources array when exactly the maximum allowed
number of items is specified?

> +		ret =3D device_property_read_u32_array(&pdev->dev, "led-sources",
> +						     led->leds, led->num_leds);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to get led-sources\n");
> +			goto err_deregister;
> +		}
> +	}
> +
[ ... ]
> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backligh=
t/lm3533_bl.c
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c
[ ... ]
> @@ -248,7 +255,8 @@ static struct attribute_group lm3533_bl_attribute_gro=
up =3D {
>  static int lm3533_bl_setup(struct lm3533_bl *bl)
>  {
>  	int id =3D lm3533_bl_get_ctrlbank_id(bl);
> -	int ret;
> +	u32 output_cfg_val =3D 0;
> +	int ret, i;
> =20
>  	ret =3D lm3533_update(bl->lm3533, LM3533_REG_CTRLBANK_AB_BCONF,
>  			    bl->linear ? CTRLBANK_AB_BCONF_MODE(id) : 0,
> @@ -256,6 +264,16 @@ static int lm3533_bl_setup(struct lm3533_bl *bl)
>  	if (ret)
>  		return ret;
> =20
> +	if (bl->num_leds) {
> +		for (i =3D 0; i < bl->num_leds; i++)
> +			output_cfg_val |=3D id << bl->led_strings[i];
> +
> +		ret =3D lm3533_update(bl->lm3533, LM3533_REG_OUTPUT_CONF1,
> +				    output_cfg_val, OUTPUT_CONF1_MASK);

Similar to the LED setup, will applying OUTPUT_CONF1_MASK without preserving
existing bit states overwrite the routing of other control banks?

> +		if (ret)
> +			return ret;
> +	}
> +
[ ... ]
> @@ -337,6 +355,25 @@ static int lm3533_bl_probe(struct platform_device *p=
dev)
>  	bl->linear =3D device_property_read_bool(&pdev->dev,
>  					       "ti,linear-mapping-mode");
> =20
> +	bl->num_leds =3D device_property_count_u32(&pdev->dev, "led-sources");
> +
> +	/*
> +	 * If led-sources property is not set then either this Control Bank uses
> +	 * its default HVLED or is not linked to any HVLED at all.
> +	 */
> +	if (bl->num_leds <=3D 0 || bl->num_leds > LM3533_MAX_LED_STRINGS)

As with the LED probe function above, does this unsigned variable wrapper
prevent catching negative error codes from device_property_count_u32()?

> +		bl->num_leds =3D 0;
> +
> +	if (bl->num_leds > 0 && bl->num_leds < LM3533_MAX_LED_STRINGS) {

Does this also skip array parsing if exactly LM3533_MAX_LED_STRINGS items
are provided?

> +		ret =3D device_property_read_u32_array(&pdev->dev, "led-sources",
> +						     bl->led_strings,
> +						     bl->num_leds);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to get led-sources\n");
> +			goto err_sysfs_remove;
> +		}
> +	}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517074306.3093=
7-1-clamor95@gmail.com?part=3D6
