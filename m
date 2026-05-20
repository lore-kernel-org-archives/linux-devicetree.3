Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD923DCD9D
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288130; cv=none; b=uQg0ol7DyIAegflM5qlgd745KQnzH2TYkvha/nl79cFg+mOt3M+lYQd4WJ1h9By3vddKJXXWycc7qOhuT9+tnXPkZS29TzoGeeqhyNhwMD1R13InDaKmBLa7ZhUlrD+1S5V8vGt/aSp6lA0WdFru8qd1Pk1vFkjU4aND+jWYM/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288130; c=relaxed/simple;
	bh=ywsfEThUBBl1PLXiDGTcC9fBwzngafyswX1bo4gt7YQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZFjD4PpoU/nJmBmfbdNzd+NOV1CULazyCWp8CyQjuCHb9XNDRNbqyNIbGATHNu3bUkUd/rAF3x4XnwTG3ROABP8iJnds+gA2Xlv/5Lg5yaYWrRHbHHNo4yMeiigFNbZLH8DUtPzxXr4J61yDxAz74WZP2kJnVQBAfq1fijAPi9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bo1XbK9Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bo1XbK9Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A4A1F000E9;
	Wed, 20 May 2026 14:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779288129;
	bh=bEiuvdkCqUAd7Qx02qZzaOfsPHoUmcqCfnxmfNGEM+I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bo1XbK9ZtECCM3p53e++ZCRSCKKCT0WjIQtC3quGpZhsrUdYeqpt16hz1WzzU1yb+
	 wlSNJeVQWRaNa7I6oStkW0BXWc/fPzqb8iL/YJ1yFcQGsPdqtYT3wFh6lMqT1HjS3F
	 FldBFkLgt++Ns/xCGgD2uGakCO8ZUQNg5x1SVqcCIvZ2u1MzsmNQNKRWI5JjKUA+nz
	 r5OB07lHIFVVrUzm3hZ3LvT8DqmBFC3bKiQqYltMedL1u11645YLLgwXy+Vf19ik30
	 tk9/VFQ/vh8L2IpbYVKpYDwCYPtQddealDF0BCEFw9ybYrgiNfvuZ3vZpAi/JkB7ys
	 RXpP6wjQkYDsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/6] leds: is31fl32xx: Fix missing brightness_steps
 for is31fl3236
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520133343.1423946-6-jerrysteve1101@gmail.com>
References: <20260520133343.1423946-6-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 14:42:08 +0000
Message-Id: <20260520144209.32A4A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect use of max() instead of min() or clamp() for the current=
 limit in is31fl3293_reset() breaks the led-max-microamp property.
- [High] Probe initialization order executes a hardware reset after registe=
ring LEDs, wiping out default-state and triggers.
- [High] The is31fl3293_cdef chip definition fails to initialize output_fre=
quency_setting_reg, risking unintended register writes.
--

commit 9f50d96174e82f3726c13d291274dd1b30aa1744
Author: Jun Yan <jerrysteve1101@gmail.com>

leds: is31fl32xx: Fix missing brightness_steps for is31fl3236
   =20
Add missing brightness_steps for is31fl3236 to fix brightness control.

> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32x=
x.c
> index b5207ad6ae966..5678c2273bbd9 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c
> @@ -491,6 +491,7 @@ static const struct is31fl32xx_chipdef is31fl3236_cde=
f =3D {
>  	.pwm_register_base			=3D 0x01,
>  	.led_control_register_base		=3D 0x26,
>  	.enable_bits_per_led_control_register	=3D 1,
> +	.brightness_steps			=3D 256,
>  };

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a problem with the
probe initialization order in is31fl32xx_probe():

drivers/leds/leds-is31fl32xx.c:is31fl32xx_probe() {
    ...
	ret =3D is31fl32xx_parse_dt(dev, priv);
	if (ret)
		return ret;

	ret =3D is31fl32xx_init_regs(priv);
	if (ret)
		return ret;
    ...
}

Could this order execute a hardware reset after registering the LEDs?

It looks like is31fl32xx_parse_dt() invokes devm_led_classdev_register_ext(=
),
which processes default-state and triggers by writing to PWM registers. If
is31fl32xx_init_regs() is called immediately after, it seems it would wipe =
out
those initial states by issuing a hardware reset command to the chip.

[Severity: High]
This is a pre-existing issue, but looking at the is31fl3293_cdef definition
in the same file:

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

Does this omit the initialization of .output_frequency_setting_reg?

Since it zero-initializes instead of using IS31FL32XX_REG_NONE, if the
issi,22khz-pwm property is present, would the driver incorrectly assume the
register is supported and write 0x01 to register 0x00?

[Severity: High]
This isn't a bug introduced by this patch, but the is31fl3293_reset() funct=
ion
appears to use max() incorrectly:

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

Will this calculation force the current to never be less than
IS31FL3293_MAX_MICROAMP?

It seems like this ignores intentionally lower led-max-microamp limits set =
in
the device tree. Furthermore, if max_microamp exceeds the maximum,
current_level would exceed 0xFF, which would get silently truncated when
passed to is31fl32xx_write(). Should this code use min() or clamp() instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520133343.1423=
946-1-jerrysteve1101@gmail.com?part=3D5
