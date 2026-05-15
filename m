Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF76E3CF680
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843128; cv=none; b=mkF+45CAtK0KaP1q/jtORVX8x3X6GlFhaE2ID2oGecM01Ektn6WQxNuDmjEn22Qfv4lSdzbSXPzxfOXnNCWx+XgyuzOVtlpKf5WLTa+6+VSP+y5HL08fK3fpqj4xrA48Y2OmQk/1ZvWKOj94lxZrSgsNcaWltkH4L2TZYVDma70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843128; c=relaxed/simple;
	bh=sxzZ231CGMYvQ+K7zC0E9ht+vrhjeRxwvIhg77k36ww=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YadKK9AZQI6F445+FlnmvN6u9n8ez4ICsx3X6Yv1gU/9+sCOtuVdBi6tlfOk8pr6VOo5Z7LNT5N4mey0iSZxjUauoOhHAQyiUU2q6YwMjV4GAl6PBQxEZqL5z7crY8WySSABLJxJn668VQ14qAADcO90MB2s3pOFlz9DPGwp1SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EDn7/TYI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EDn7/TYI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D72C2BCB0;
	Fri, 15 May 2026 11:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778843128;
	bh=sxzZ231CGMYvQ+K7zC0E9ht+vrhjeRxwvIhg77k36ww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=EDn7/TYIAVeTxI2z1OfLGVwWfs5POx+fCE0DHqI31C8SMo+t9s4Bui+q/BkS9OyEo
	 bvGdTR+42cpLNX7bMMuo4oVbAOkM0YiFbRkQFCJjC6sbI9dXpwrPx8h3XgxvU+J84b
	 MwWXUPBvoG/WH3hpsKiCy4SPgWSGGnOXdpOF42/CrZv5/z0/jCXnIG/WWXnpiKp1fa
	 KwGB/0cb0XDKyHfRmVaPzgEAbbX+GQnRiNoNUFQNtPF3jqv4SwYpAnT6m3DZRCIcqd
	 lp19YEX/leAaVOTgHhAqaG2/hjt5gK071KK30GAeR+4tAJIk11dd89TKroUwmMMT8K
	 DEWvSdYsjrphw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/11] leds: flash: add support for Samsung S2M
 series PMIC flash LED device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-s2mu005-pmic-v6-7-1979106992d4@disroot.org>
References: <20260515-s2mu005-pmic-v6-7-1979106992d4@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:05:27 +0000
Message-Id: <20260515110528.45D72C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Self-deadlock in `s2m_fled_flash_external_strobe_set` due to recur=
sive mutex acquisition.
- [Medium] Incorrect implementation of V4L2 `external_strobe_set` callback =
and missing error handling.
- [Low] Invalid function pointer cast in `devm_add_action_or_reset()` cause=
s compilation warnings/errors.
- [Low] Missing cleanup action for PMIC LED channel enable bit on probe fai=
lure.
- [Low] Unnecessary `select REGMAP_IRQ` in Kconfig.
- [Low] Unprotected updates to flash_brightness and flash_timeout state.
--

commit 901a86b5a2ab51ba67c0b914a1f2b70fb3100a1a
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

leds: flash: add support for Samsung S2M series PMIC flash LED device

Add support for flash LEDs found in certain Samsung S2M series PMICs.
The device has two channels for LEDs, typically for the back and front
cameras in mobile devices. Both channels can be independently
controlled, and can be operated in torch or flash modes.

> diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
> index 5e08102a67841..b6542ecc522dd 100644
> --- a/drivers/leds/flash/Kconfig
> +++ b/drivers/leds/flash/Kconfig
> @@ -114,6 +114,18 @@ config LEDS_RT8515
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called leds-rt8515.
> =20
> +config LEDS_S2M_FLASH
> +	tristate "Samsung S2M series PMICs flash/torch LED support"
> +	depends on LEDS_CLASS
> +	depends on MFD_SEC_CORE
> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> +	select REGMAP_IRQ

Is this select REGMAP_IRQ necessary? The driver appears to use basic regmap
read and write APIs without handling hardware interrupts or utilizing the
regmap IRQ framework functionalities.

> +	help
> +	  This option enables support for the flash/torch LEDs found in certain

[ ... ]

> diff --git a/drivers/leds/flash/leds-s2m-flash.c b/drivers/leds/flash/led=
s-s2m-flash.c
> new file mode 100644
> index 0000000000000..40cc5f8b8adc9
> --- /dev/null
> +++ b/drivers/leds/flash/leds-s2m-flash.c

[ ... ]

> +static int s2m_fled_flash_brightness_set(struct led_classdev_flash *fled=
, u32 brightness)
> +{
> +	struct s2m_led *led =3D to_s2m_led(fled);
> +	struct led_flash_setting *setting =3D &fled->brightness;
> +
> +	led->flash_brightness =3D (brightness - setting->min) / setting->step;

Should this update be protected by led->lock? The s2mu005_fled_flash_strobe=
_set()
function reads led->flash_brightness while holding led->lock. Concurrent
sysfs updates might be missed during an active strobe operation.

> +
> +	return 0;
> +}
> +
> +static int s2m_fled_flash_timeout_set(struct led_classdev_flash *fled, u=
32 timeout)
> +{
> +	struct s2m_led *led =3D to_s2m_led(fled);
> +	struct led_flash_setting *setting =3D &fled->timeout;
> +
> +	led->flash_timeout =3D (timeout - setting->min) / setting->step;

Similarly, should led->flash_timeout be protected by led->lock here?

> +
> +	return 0;
> +}
> +
> +#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
> +static int s2m_fled_flash_external_strobe_set(struct v4l2_flash *v4l2_fl=
ash, bool enable)
> +{
> +	struct s2m_led *led =3D to_s2m_led(v4l2_flash->fled_cdev);
> +
> +	mutex_lock(&led->lock);
> +
> +	led->fled.ops->strobe_set(&led->fled, enable);

Can this lead to a deadlock?

The external_strobe_set() wrapper acquires led->lock and then invokes
strobe_set() (which maps to s2mu005_fled_flash_strobe_set). However,
s2mu005_fled_flash_strobe_set() unconditionally attempts to acquire the
same led->lock.

Also, the V4L2 external_strobe_set callback is typically intended to
configure the hardware to listen to an external trigger pin. Does calling
the software strobe_set callback incorrectly turn on the flash via software
registers instead?

Lastly, the return value of strobe_set() is ignored here. Should underlying
regmap errors be propagated back to the V4L2 subsystem?

> +
> +	mutex_unlock(&led->lock);
> +
> +	return 0;
> +}

[ ... ]

> +static int s2mu005_fled_init(struct s2m_led *led, struct device *dev, st=
ruct regmap *regmap,
> +			     unsigned int nr_channels)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	/* Enable the LED channels. */
> +	ret =3D regmap_set_bits(regmap, S2MU005_REG_FLED_CTRL1, S2MU005_FLED_CH=
_EN);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable LED channels\n");

Is a cleanup action needed to clear S2MU005_FLED_CH_EN if the probe fails
later, or when the driver is unbound? Without it, the PMIC flash hardware
block might remain powered on.

> +
> +	ret =3D regmap_read(regmap, S2MU005_REG_ID, &val);

[ ... ]

> +static int s2mu005_fled_init_channel(struct s2m_led *led, struct device =
*dev,
> +				     struct fwnode_handle *fwnp)
> +{

[ ... ]

> +	led->v4l2_flash =3D v4l2_flash_init(dev, fwnp, &led->fled, &s2m_fled_v4=
l2_flash_ops,
> +					  &v4l2_cfg);
> +	if (IS_ERR(led->v4l2_flash))
> +		return dev_err_probe(dev, PTR_ERR(led->v4l2_flash),
> +				     "failed to create V4L2 flash device\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, (void *)s2m_fled_v4l2_flash_relea=
se, led->v4l2_flash);

Is this (void *) cast necessary? The __devm_add_action_or_reset() API expec=
ts
a function pointer parameter of type void (*)(void *). The
s2m_fled_v4l2_flash_release function natively matches this signature. Casti=
ng
a function pointer to a generic data pointer might cause compilation errors
like -Werror=3Dincompatible-pointer-types on modern compilers.

> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add cleanup action\n");
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-s2mu005-pm=
ic-v6-0-1979106992d4@disroot.org?part=3D7
