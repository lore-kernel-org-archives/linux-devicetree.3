Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815883;
	b=jDiVuAtEKlHMZpzQNoIT6j9lMJNzJzgwC2GC+2Afn62Rp2yw/zSHP0DfAW2OB5r3jWRO
	 JEZ5uzHG4Arig8iCMkX/lmlssqgrzB0g4Iu1ckPUODiKc2BdrvDL4pVRVD7WWwTZa3XEb
	 Ynbl5HKp3pYejwqB5anBUZOlwLNc2/SWXA8lt/btCpRubOoEPyOqnd+OF+DzPrLVUD/6D
	 NB9qhq8UDpl43kVE6WFPm7i104RJfD+/PHchcFftqoQR1leZ29BgCZ7cJWQbpSEGMFS+F
	 xtreS6ZL0jB4FTingxAbU24JMG1CH8ZysLsJIcMY2AgSDqM8PkvENMjnId+KvaCP4JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815883;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Dz8MjaSIQ5v4PRRODGwOI1ewy4MAvHy08l+pjxaraCk=;
	b=usXPpaCn7jfNPE9JX6mXvtgwDrKCEvaYR3fqjmLZzNI2A8MWwpJLar4acIiaI58B2OJZ
	 CWQMuOOdpX/lSNF1uWG8SKbrXJB/sWIHYXaumwHxE4FPAxCdgpdTUp632ov4TN4LjZxX7
	 c988xVzu1RTXKt7dwTe0qsTsYr3AdztThqqLWrqyFo4UEY0pSDzlr3Z4firh19FSl4mys
	 ilGUsrZn35FEcAuuajwpUXEynPeUCfJ+cF8L+bcA7/pWCCYf4sTu8Ydae7SBvDlUlmje5
	 W2xIEtu85ZE7X2rPpfvWQK+9QEUX1F2xP6nwUOHImaySB30xCrnSTMMI2OGrF32zFmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YR/ksreE";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09768606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YR/ksreE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C3C1F000C4;
	Mon, 16 Nov 2026 07:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794815882;
	bh=Dz8MjaSIQ5v4PRRODGwOI1ewy4MAvHy08l+pjxaraCk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YR/ksreE7mx3sXGJTnOQYaAfR9rgcpf0TupMiYtbfEe4aeW9RaM82dDD1QJut27bu
	 +phfwAokurWrAZh67D76UoqvWWSINUJZEZNhZlD9hssyTf2HLGRPUDkogYqiGz+rcU
	 KnEsS1SWoau+liNf7X0D5dDCT1Jkzvymbtmr0Wn5RY4ZyeC4UxhyBK5/Au/EcLeOI9
	 c7q6Z5UE7JIC0pTuQ2OhgypUeFvWt4vvhe+33017IV/UcIlsZLXiZUTl1SVhCDCd0X
	 phj6JUt57haLkHPVZndOcIEchGc/w+KteXXxkgHMr/UsP0/FZhA7fel2E73oQWHiEr
	 g+XK+pYtXi8tQ==
Message-ID: <sashiko-outbox-216484@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] iio: proximity: add Imagis ISG5320A SAR sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QWRpbCBIw7xzcmV2IFRlcGU=?= <tadilhusrev@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116074013.355363-3-tadilhusrev@gmail.com>
References: <20261116074013.355363-1-tadilhusrev@gmail.com>
 <20261116074013.355363-3-tadilhusrev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 07:58:01 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [Medium] iio: proximity: isg5320a: unbalanced IRQ wake in
  isg5320a_events_off()
- [Medium] iio: proximity: isg5320a: ignored regmap_write() errors in
  isg5320a_reset()
- [Medium] iio: proximity: isg5320a: undocumented int-gpios and raw GPIO
  polling
- [Medium] iio: proximity: isg5320a: unsynchronized IRQ and sleep in
  isg5320a_shutdown()
- [Medium] iio: proximity: isg5320a: chip left active on IRQ error in
  isg5320a_probe()
- [Low] iio: proximity: isg5320a: positional initializer in
  isg5320a_id[]
--

commit 9f24b9dcaaade133d53e6aef3bc6e657c2c94db0
Author: Adil H=C3=BCsrev Tepe <tadilhusrev@gmail.com>

iio: proximity: add Imagis ISG5320A SAR sensor driver

This commit adds an IIO driver for the Imagis ISG5320A I2C capacitive
SAR/grip proximity sensor, exposing a single proximity channel and
threshold events.

> diff --git a/drivers/iio/proximity/isg5320a.c b/drivers/iio/proximity/isg=
5320a.c
> new file mode 100644
> index 0000000000000..53326703535e5
> --- /dev/null
> +++ b/drivers/iio/proximity/isg5320a.c

[ ... ]

> +/* Wait for the INT line to reach @level: up to 10 x 5 ms (vendor :262, =
:281). */
> +static int isg5320a_wait_int(struct isg5320a_data *data, int level)
> +{
> +	int cnt;
> +
> +	if (!data->int_gpio) {
> +		msleep(50);
> +		return 0;
> +	}
> +
> +	for (cnt =3D 0; cnt < 10; cnt++) {
> +		if (gpiod_get_raw_value_cansleep(data->int_gpio) =3D=3D level)
> +			return cnt;
> +		usleep_range(5000, 5100);
> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +
> +/* vendor isg5320a_reset(), :247-292, plus a CHIPID read the vendor neve=
r does */
> +static int isg5320a_reset(struct isg5320a_data *data)
> +{

[ ... ]

> +	if (isg5320a_wait_int(data, 1) < 0)			/* :262-266 */
> +		dev_warn(dev, "INT did not go high before reset\n");
> +
> +	ret =3D regmap_write(data->regmap, ISG5320A_REG_PROTECT,	/* :268-271 */
> +			   ISG5320A_PROTECT_UNLOCK);
> +	if (ret)
> +		dev_warn(dev, "unlock protect failed: %d\n", ret);
> +
> +	ret =3D regmap_write(data->regmap, ISG5320A_REG_SOFTRESET,	/* :273-276 =
*/
> +			   ISG5320A_SOFTRESET_VAL);
> +	if (ret)
> +		dev_warn(dev, "soft reset write failed: %d\n", ret);
> +
> +	usleep_range(1000, 1100);				/* :278 */
> +
> +	ret =3D isg5320a_wait_int(data, 0);			/* :280-289 */
> +	if (ret < 0)
> +		return dev_err_probe(dev, -EIO, "INT not asserted after soft reset\n");
> +	dev_dbg(dev, "reset done, wait cnt %d\n", ret);
> +
> +	return 0;
> +}

[Severity: Medium]
Should isg5320a_reset() return an error if writing ISG5320A_REG_PROTECT or
ISG5320A_REG_SOFTRESET fails?

When data->int_gpio is NULL (or if the interrupt line was already low
before reset), isg5320a_wait_int(data, 0) returns 0, so isg5320a_reset()
succeeds and isg5320a_probe() continues initializing an unreset device.

[ ... ]

> +	WRITE_ONCE(data->ev_enabled, true);
> +	enable_irq(data->irq);						/* :721 */
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(data->irq);				/* :722 */
> +
> +	dev_dbg(dev, "events on, initial state %s\n", data->close ? "close" : "=
far");
> +
> +	return 0;
> +}
> +
> +static void isg5320a_events_off(struct isg5320a_data *data)
> +{
> +	struct device *dev =3D data->dev;
> +	int ret =3D 0;
> +
> +	scoped_guard(mutex, &data->lock)
> +		ret =3D regmap_write(data->regmap, ISG5320A_REG_IRQFUNC,	/* :726 */
> +				   ISG5320A_IRQFUNC_DISABLE);
> +	if (ret)
> +		dev_warn(dev, "IRQFUNC disable failed: %d\n", ret);
> +
> +	WRITE_ONCE(data->ev_enabled, false);
> +	disable_irq(data->irq);						/* :728 */
> +	if (device_may_wakeup(dev))
> +		disable_irq_wake(data->irq);				/* :729 */
> +}

[Severity: Medium]
Can toggling /sys/devices/.../power/wakeup while threshold events are
enabled cause an unbalanced IRQ wake in isg5320a_events_off()?

isg5320a_events_on() and isg5320a_events_off() both check
device_may_wakeup(dev) dynamically.  If userspace enables power/wakeup
after events are turned on, isg5320a_events_off() calls
disable_irq_wake(data->irq) without a matching enable_irq_wake(),
triggering the "Unbalanced IRQ %d wake disable" warning in
irq_set_irq_wake().  Conversely, disabling power/wakeup while events are
active skips disable_irq_wake() and leaks the wake reference even after
unbind.

Note that when wakeup-source is present in Devicetree, i2c_device_probe()
already calls device_init_wakeup() and dev_pm_set_wake_irq() for the
client IRQ, so manual device_init_wakeup() in isg5320a_probe() and manual
enable_irq_wake()/disable_irq_wake() calls here also duplicate the I2C
core wakeup handling.

[ ... ]

> +	/*
> +	 * Optional: lets the reset sequence watch the INT level as the vendor
> +	 * does. It is requested before the IRQ (same order as vendor :1873 vs
> +	 * :1931), since on Samsung pinctrl the IRQ request switches the pin
> +	 * back to its EINT function.
> +	 */
> +	data->int_gpio =3D devm_gpiod_get_optional(dev, "int", GPIOD_IN);
> +	if (IS_ERR(data->int_gpio))
> +		return dev_err_probe(dev, PTR_ERR(data->int_gpio), "int gpio\n");
> +	if (!data->int_gpio)
> +		dev_info(dev, "no int-gpios, reset uses fixed delays\n");

[Severity: Medium]
Why does isg5320a_probe() request an "int" GPIO that is not in the
Devicetree binding?

Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml only
defines interrupts and forbids additional properties, and
i2c_device_probe() has already mapped that pin as client->irq before
isg5320a_probe() runs, which causes GPIO/irqchip conflicts on many
platforms.  In addition, isg5320a_wait_int() uses
gpiod_get_raw_value_cansleep(data->int_gpio), which ignores both GPIO
active-low polarity and negative error returns.

> +
> +	ret =3D isg5320a_reset(data);				/* :1915 */
> +	if (ret)
> +		return ret;
> +
> +	msleep(300);			/* vendor runs init_work 300 ms later, :1981 */
> +
> +	ret =3D isg5320a_initialize(data);			/* :1620 */
> +	if (ret)
> +		return dev_err_probe(dev, ret, "init failed\n");
> +
> +	ret =3D isg5320a_mode_normal(data);			/* :1621 */
> +	if (ret)
> +		return dev_err_probe(dev, ret, "start failed\n");
> +
> +	if (data->irq > 0) {
> +		irqflags =3D irq_get_trigger_type(data->irq);
> +		if (!irqflags)
> +			irqflags =3D IRQF_TRIGGER_FALLING;	/* :1932 */
> +
> +		ret =3D devm_request_threaded_irq(dev, data->irq, NULL,
> +						isg5320a_irq_thread,
> +						irqflags | IRQF_ONESHOT |
> +						IRQF_NO_AUTOEN,
> +						"isg5320a", indio_dev);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "irq request failed\n");

[Severity: Medium]
Does an error from devm_request_threaded_irq() leave the sensor running in
normal mode?

isg5320a_mode_normal() has already started the oscillator, watchdog, and
scanning, but the isg5320a_teardown() devres action that puts the chip
back to sleep is not registered until after the IRQ request succeeds.

[ ... ]

> +/* vendor isg5320a_shutdown(), :2071-2080 */
> +static void isg5320a_shutdown(struct i2c_client *client)
> +{
> +	struct isg5320a_data *data =3D iio_priv(i2c_get_clientdata(client));
> +
> +	guard(mutex)(&data->ev_lock);
> +
> +	if (data->ev_enabled)
> +		regmap_write(data->regmap, ISG5320A_REG_IRQFUNC,
> +			     ISG5320A_IRQFUNC_DISABLE);
> +	isg5320a_mode_sleep(data);
> +}

[Severity: Medium]
Can isg5320a_irq_thread() race with isg5320a_shutdown()?

Because the driver provides a custom .shutdown callback,
i2c_device_shutdown() does not disable client->irq automatically.  Unlike
isg5320a_teardown(), which calls isg5320a_events_off() and checks
!pm_runtime_status_suspended(dev), isg5320a_shutdown() writes
ISG5320A_REG_IRQFUNC without holding data->lock, leaves data->irq enabled
while putting the chip to sleep, and runs isg5320a_mode_sleep() even when
the device is already runtime-suspended.

[ ... ]

> +static const struct i2c_device_id isg5320a_id[] =3D {
> +	{ "isg5320a" },
> +	{ }
> +};

[Severity: Low]
This isn't a bug, but I2C convention is to use a named initializer
({ .name =3D "isg5320a" }) for new struct i2c_device_id entries.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116074013.3553=
63-1-tadilhusrev@gmail.com?part=3D2
