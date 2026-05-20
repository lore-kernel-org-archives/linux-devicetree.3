Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CA13ED125
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290458; cv=none; b=eI3a1Vv7fuTJ7105kbCW3kGmZvbQYjS21OwwWWynzBDL6T7Ewe+HnQLLA7D5Spd3mCXuKQDbZbYxhgG5wwiGCCVJBpteOY0SmhK3M8/pkvZCd/KhVpbKtP8DPGStKMtxtZwTtHxakMQ0WYZ1Z15GVCTE5jg6rB333wns2fXFiGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290458; c=relaxed/simple;
	bh=KFL5GTCAvk1c+j5Va3JOJCqqeLKFxgbwNyKarrYsSF4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WV9D480utI/KNjo6pt+Sb2TnnTl6W2qhVlKytTx+r3VV3BRNmQ1+mJqiOIi9Lyc+KDF1rfLe1FnOy06JQWe2D0icEOdGVmEEahb1cFirND8sLbsuY4qkCwgoNZD/iibz2eJMGEFS6Ni6Dd7NTDpVsZXiSo+VU2xPt1+yho8X7Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/UNZfEe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/UNZfEe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215E81F000E9;
	Wed, 20 May 2026 15:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779290457;
	bh=jjyA7T21uEb/7VKspBpd8f2VgAykRtNr2FCWxH3XFBM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l/UNZfEems1rTTWX8O1HsGUiJysqVrYqjluCmyWRbTihklxNS1T6XisJIHN8pczVx
	 r0W8dR7HZMknu707Hcjwgpb+gnynREjznXr6WmA4FRnztuAp4w+4ZH/X7hkTCDzsZM
	 tBFfkJr3JjxXgh1HYUyXVo9DLeHik9AA5yVojwiXFvD58mTg7ctvp3sjqCW+7PPAe2
	 M8tkBZYfVkDhdcB6PNMGiDXSjPQ4owCzGExgJ3pMqUEOKdWlWxC/peBZp8heLnktnK
	 muCIXhBoT+8wBBrNSFFIIqytH2zBKyyM+BlPo+YvBJTRaGKSS5MRytTe8nPGHidD65
	 kfSbxEcu9lyzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/6] leds: is31fl32xx: Move pwm frequency setting to
 init_regs()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260520133343.1423946-7-jerrysteve1101@gmail.com>
References: <20260520133343.1423946-7-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 15:20:56 +0000
Message-Id: <20260520152057.215E81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] LED class devices are registered before hardware initialization co=
mpletes, causing race conditions and state loss.
- [High] Missing initialization of `output_frequency_setting_reg` for IS31F=
L3293 causes erroneous I2C writes to register 0x00.
- [High] The current limit calculation in `is31fl3293_reset()` incorrectly =
uses `max()` instead of `min()`, risking hardware damage.
- [High] Concurrent brightness updates on different channels can cause torn=
 multi-byte PWM writes and visible glitches.
--

commit 7b1ac7769467fbaf4418cb18df93e48ba5bbff75
Author: Jun Yan <jerrysteve1101@gmail.com>

leds: is31fl32xx: Move pwm frequency setting to init_regs()

Commit a18983b95a61 swapped the order of is31fl32xx_parse_dt() and
is31fl32xx_init_regs(). This patch moves the PWM frequency setting logic fr=
om
is31fl32xx_parse_dt() to is31fl32xx_init_regs() to prevent the configuration
from being overwritten by the register reset operation.

> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32x=
x.c
> index 5678c2273bbd9..3e86e414c532b 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c
[ ... ]
> @@ -346,6 +347,14 @@ static int is31fl32xx_init_regs(struct is31fl32xx_pr=
iv *priv)
>  	if (ret)
>  		return ret;
> =20

[Severity: High]
This isn't a bug introduced by this patch, but is the current limit calcula=
tion
in is31fl3293_reset() risking hardware damage?

The function calculates the operating current limit using
max(led_data->max_microamp, IS31FL3293_MAX_MICROAMP). If the device tree
requests a lower limit like 5000 microamps, max() will override it to 20000
microamps, potentially overdriving the LED hardware.

Furthermore, if a limit larger than 20mA is requested, the calculated value
exceeds 255. When passed to the 8-bit is31fl32xx_write(), it will silently
truncate and result in an unpredictable current limit setting.

Should this logic use min() instead to safely enforce the hardware constrai=
nt?

> +	if ((cdef->output_frequency_setting_reg !=3D IS31FL32XX_REG_NONE) &&
> +		priv->pwm_22khz) {

[Severity: High]
This is a pre-existing issue, but does this check work correctly for the
IS31FL3293 chip?

The is31fl3293_cdef structure omits the initialization of
.output_frequency_setting_reg, so it defaults to 0x00. Since
IS31FL32XX_REG_NONE is 0xFF, this condition evaluates to true.

If the device tree contains the "issi,22khz-pwm" property for an IS31FL3293
device, will the driver incorrectly write the 22kHz setting to register 0x0=
0?

> +		ret =3D is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
> +				       		IS31FL32XX_PWM_FREQUENCY_22KHZ);
> +		if (ret)
> +			return ret;
> +	}
> +
[ ... ]
> @@ -420,7 +429,6 @@ static struct is31fl32xx_led_data *is31fl32xx_find_le=
d_data(
>  static int is31fl32xx_parse_dt(struct device *dev,
>  			       struct is31fl32xx_priv *priv)
>  {
> -	const struct is31fl32xx_chipdef *cdef =3D priv->cdef;
>  	int ret =3D 0;

[Severity: High]
This is a pre-existing issue, but does the current driver initialization fl=
ow
expose LEDs to userspace before the hardware is ready?

In is31fl32xx_probe(), is31fl32xx_parse_dt() is called before
is31fl32xx_init_regs(). is31fl32xx_parse_dt() registers the LED devices via
devm_led_classdev_register_ext(), making them available to userspace and the
kernel LED subsystem immediately.

If default triggers or userspace actions configure the PWM registers before
is31fl32xx_init_regs() runs, wouldn't the subsequent hardware reset wipe out
those user configurations?

[ ... ]
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

[Severity: High]
This is a pre-existing issue, but are concurrent brightness updates suscept=
ible
to torn multi-byte PWM writes?

The is31fl32xx_brightness_set() function lacks driver-level locking. For
chips like IS31FL3293 that require two consecutive I2C writes (low byte then
high byte) per channel, could concurrent updates break the atomicity of the
12-bit PWM update?

For example, if Thread A writes the low byte for LED 1, and Thread B
concurrently writes the high byte for LED 2 and triggers the Update registe=
r,
could the chip latch LED 1's new low byte with its old high byte?

Does this sequence require a mutex to serialize the multi-byte PWM write?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520133343.1423=
946-1-jerrysteve1101@gmail.com?part=3D6
