Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E0936AF6
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779006773; cv=none; b=CSoHvtPt/WtygbyLFY9bKLP1902F0U/o5ufYZDA5jO8K8TGdVzepTg+6qoK+ZBTKIeSlkUOEUYKACRgzJAQObAyo9pvI/rY68vfsfUlJ/fKGb1mhntVxFXEfm0nKVl8ZdSA+E37RGpTyxyxJ7fF4B8tOn7bc58sEmYqRYqBaaGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779006773; c=relaxed/simple;
	bh=oBZprTIBg0NpvbnYq1Ifk1rrRit+UWVE41YhL/8Q0BU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VSwlL+Q9SH7Dc6vWfZfc1Q67bQO3e5uON0JH/TgvyrQoN+gwMQosS0Jb1AI3JnYp1kp7T/VQDRwhZyRKWwcb054keeCmIKwZvlyy6IYg19R+PIc7KwZB2B/aazK2mxOpiYVV/eF5QpuwuSDEBy7UhkatmbjKKVykDVcW0HpsN4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D69v/5Te; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D69v/5Te"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81F6C2BCB0;
	Sun, 17 May 2026 08:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779006773;
	bh=oBZprTIBg0NpvbnYq1Ifk1rrRit+UWVE41YhL/8Q0BU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=D69v/5TeBskk+cGJajr6z4qXnd0Bc93+tCUdu4tVtJcw5hujDqqo2KvfU7U28Kqin
	 kwHAPfP59neAn8ELhFatBQD69nseOFBmZl8jIUzbkUyKkYdUwwWswNT8/qB5E0hvOs
	 kQ7JN93vAhuqoNLaNlvqps2HAx26MHrXL4Go6qh8i2M0lJp+qez9lVIL80g1l4uV6a
	 gkcX9rJvoIBgM3WChuohMfjg/wTyAeyEDyJ3MXvBIdKGuu7kSRbrDSsRvh/JdimRpi
	 BaadjIpWHn1tt7Ca2oY5RKosfO978ili13Zh7kia3S1iseppOtrELKoOylyg/RnOWI
	 9CfdAU/BYUr2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/6] mfd: lm3533: Convert to use OF bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260517074306.30937-3-clamor95@gmail.com>
References: <20260517074306.30937-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 08:32:52 +0000
Message-Id: <20260517083252.E81F6C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] Pre-existing Use-After-Free race in ALS IRQ teardown.
- [High] Unconditional MFD cell registration creates phantom devices.
- [High] Devres cleanup inversion causes I2C accesses on a powered-down dev=
ice.
- [High] LED child devices fail to probe unconditionally due to incorrect `=
pdev->id` boundary checks.
- [High] Silent loss of interrupts due to bypassing `-EPROBE_DEFER` on opti=
onal IRQs.
- [Medium] Implicit integer truncation of `ti,pwm-config-mask` circumvents =
bounds validation.
--

commit e97028edbaad36911b58da2763bddbf8e9cb91e9
Author: Svyatoslav Ryhel <clamor95@gmail.com>

    mfd: lm3533: Convert to use OF bindings
   =20
    Since there are no users of this driver via platform data, remove the
    platform data support and switch to using Device Tree bindings.
    Additionally, optimize functions used only by platform data.

> diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-al=
s.c
> --- a/drivers/iio/light/lm3533-als.c
> +++ b/drivers/iio/light/lm3533-als.c
[ ... ]
> @@ -838,12 +786,6 @@ static int lm3533_als_probe(struct platform_device *=
pdev)
[ ... ]
>  	als =3D iio_priv(indio_dev);
>  	als->lm3533 =3D lm3533;
>  	als->pdev =3D pdev;
> -	als->irq =3D lm3533->irq;
> +	als->irq =3D platform_get_irq_optional(pdev, 0);
>  	atomic_set(&als->zone, 0);
>  	mutex_init(&als->thresh_mutex);
> =20
>  	platform_set_drvdata(pdev, indio_dev);
> =20
> -	if (als->irq) {
> +	if (als->irq > 0) {

Could this silently lose interrupts if the controller is not yet ready?

If the underlying interrupt controller is not ready,
platform_get_irq_optional() returns -EPROBE_DEFER.

Checking for als->irq > 0 skips the IRQ setup for all negative error codes,
ignoring the deferral and continuing without interrupts.

[ ... ]
> @@ -903,13 +863,18 @@ static void lm3533_als_remove(struct platform_devic=
e *pdev)
>  {
>  	struct iio_dev *indio_dev =3D platform_get_drvdata(pdev);
>  	struct lm3533_als *als =3D iio_priv(indio_dev);
> =20
>  	lm3533_als_set_int_mode(indio_dev, false);
>  	iio_device_unregister(indio_dev);
>  	lm3533_als_disable(als);
> -	if (als->irq)
> -		free_irq(als->irq, indio_dev);
>  }

This may be a pre-existing issue, but does this create a use-after-free race
during teardown?

By calling iio_device_unregister() before the threaded IRQ is freed via
devres, the IIO event interface is destroyed and ev_int is freed.

If the threaded IRQ handler lm3533_als_isr() executes concurrently or is
already scheduled, could it call iio_push_event(), which reads the stale
ev_int pointer?

> diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> --- a/drivers/leds/leds-lm3533.c
> +++ b/drivers/leds/leds-lm3533.c
[ ... ]
> @@ -657,30 +660,30 @@ static int lm3533_led_probe(struct platform_device =
*pdev)
>  	if (!lm3533)
>  		return -EINVAL;
> =20
> -	pdata =3D dev_get_platdata(&pdev->dev);
> -	if (!pdata) {
> -		dev_err(&pdev->dev, "no platform data\n");
> -		return -EINVAL;
> -	}
> -
> -	if (pdev->id < 0 || pdev->id >=3D LM3533_LVCTRLBANK_COUNT) {
> -		dev_err(&pdev->dev, "illegal LED id %d\n", pdev->id);
> -		return -EINVAL;
> -	}
> +	if (pdev->id < LM3533_LVCTRLBANK_MIN || pdev->id > LM3533_LVCTRLBANK_MA=
X)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "illegal LED id %d\n", pdev->id);

Will this boundary check cause the LED devices to fail probing?

In lm3533-core.c, the MFD cells for ti,lm3533-leds are defined with ids
0, 1, 2, and 3. The MFD core assigns these directly to pdev->id.

Since LM3533_LVCTRLBANK_MIN is 2, pdev->id 0 and 1 will fail this check and
return -EINVAL.

For pdev->id 2 and 3, they pass the check but are then assigned
led->id =3D pdev->id - LM3533_LVCTRLBANK_MIN, which maps them incorrectly to
internal control banks 0 and 1 instead of 2 and 3.

[ ... ]
> @@ -694,15 +697,23 @@ static int lm3533_led_probe(struct platform_device =
*pdev)
[ ... ]
> +	led->pwm =3D 0;
> +	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->pwm);
> +
> +	ret =3D lm3533_led_setup(led);

Could this result in an implicit integer truncation that circumvents bounds
validation?

The property is read into the 32-bit integer led->pwm (and similarly bl->pwm
in lm3533_bl.c) and then passed to lm3533_ctrlbank_set_pwm() which expects a
u8 value.

If an invalid, out-of-bounds value is present in the Device Tree (like 256),
it would be silently truncated to 0, completely bypassing the safety check
if (val > LM3533_PWM_MAX) inside lm3533_ctrlbank_set_pwm().

> diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
> --- a/drivers/mfd/lm3533-core.c
> +++ b/drivers/mfd/lm3533-core.c
[ ... ]
> @@ -376,136 +326,45 @@ static struct attribute_group lm3533_attribute_gro=
up =3D {
[ ... ]
> +	ret =3D devm_mfd_add_devices(dev, 0, lm3533_child_devices,
> +				   ARRAY_SIZE(lm3533_child_devices),
> +				   NULL, 0, NULL);

Does this unconditionally register phantom devices?

By using devm_mfd_add_devices() for all 7 child cells, the MFD core
instantiates platform devices regardless of whether corresponding nodes exi=
st
in the Device Tree.

Since the child drivers do not verify fwnode_device_is_available() during
probe, could this expose nonexistent hardware to user-space and result in
sending I2C commands to unconnected pins?

[ ... ]
> @@ -517,8 +376,6 @@ static void lm3533_device_exit(struct lm3533 *lm3533)
>  	dev_dbg(lm3533->dev, "%s\n", __func__);
> =20
>  	sysfs_remove_group(&lm3533->dev->kobj, &lm3533_attribute_group);
> -
> -	mfd_remove_devices(lm3533->dev);
>  	lm3533_disable(lm3533);
>  }

Could this lead to I2C accesses on a powered-down device?

With the conversion to devm_mfd_add_devices(), the child devices are now
unregistered by devres after lm3533_device_exit() returns. However,
lm3533_device_exit() still calls lm3533_disable() to physically power down
the chip.

When devres subsequently unbinds the child devices, their remove callbacks
will attempt to shut down their components over I2C on the disabled chip,
which could result in timeouts or transfer errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517074306.3093=
7-1-clamor95@gmail.com?part=3D2
