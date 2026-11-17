Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913694;
	b=CNGVzD68nJIqV1LbmjE8V/CRD93jTJxk+8CK5VlnQ/RJ27Tqic3ZtL9KFlCX/Df/41Ot
	 Y9FJ4hkCj4ymn583WrJ4Pfqcn7Q+MYHvdssxndPmxF19Me0ThyTX1v/QDrROknFCwvRLk
	 silktILaSBbnT5nHbrSoNr6hQer8xRgQI+9dX3uU8Q6UCtCBn/sMIp0H/i7vKrjUY8MFm
	 7zHgP8mbChLzpi3hPLmIsYieNbDy/stEALk9/D0nXkPYL6NYUZMojVJp9hlJ+H8Q9Q8e1
	 NrRjB2dcMCdcq0LiwW5UTyw24RF6iLny11ErTJFva519wl5P3AA7r7VApsf7CL+U5hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913694;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NiOOpbgab+izjLacMKztlHA4/Q+owhhQHRvxGeyWWEg=;
	b=KFC0UAccok+t3ACdvm4MSJsR5hYYf57OkBSmg7pcIlFRN+xKZX9lCHD8M43GtVPkHZ03
	 ogySTGjJO5vRg8mVty45EHERpc9RV7v0rhEYbSdKJFhciR4DUVawl/97vRukfc+b/X1st
	 XBea5YVyEQDElIUedYOesLgw+q5Cyk7yC5/Gv0O58KSAgy2jcV+VMUKp9ntjVPPA9B6qU
	 Ye9hmtlZJsMhwsAX8elwb17M+vmNPLqAf167I0t3B0vRtrRjdhYxEhBWQpBkJEz98CNh8
	 KwuY5wMlUnnMZyDKksM5ZLwsVcep502+hgbPNWvxJ8UoNissNkwmXbyFxOMLvVfEIfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=adh403M4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28354606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=adh403M4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3FC1F000C4;
	Tue, 17 Nov 2026 11:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794913693;
	bh=NiOOpbgab+izjLacMKztlHA4/Q+owhhQHRvxGeyWWEg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=adh403M4SJP+SqpWexjGmDXaqBldbyq6OJtxKgZVaGDJ/99jotEFpuZwYe2NzR+tD
	 hrMpmu+5Eqt4YaO/11xE+GurW331dqsqzzb/aPAHM2KXUy3OZkjo0SgOOaeGF1m60e
	 e1NAflGdIZOZtHlPzvm42h1HMO6YQRtUapT/281KsZN6lMXIxTrRARAeVkMN+7pXIO
	 SLIpM3ol3hZ8xvYINDoOAvlhdFx4U6BvqPSjP9nZWWsryGM6XGJWNcElogv5cnekhC
	 5u7w6u7yF/75LwVolNSUTUDxNBvRJIqVOpIXPBR26Pi/fzM4XYZYe/9ZCM1a+V/XPB
	 J2S3GhUzXTVfA==
Message-ID: <sashiko-outbox-218694@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] iio: proximity: add Imagis ISG5320A SAR sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QWRpbCBIw7xzcmV2IFRlcGU=?= <tadilhusrev@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117104414.1182364-2-tadilhusrev@gmail.com>
References: <20261116074013.355363-1-tadilhusrev@gmail.com>
 <20261117104414.1182364-1-tadilhusrev@gmail.com>
 <20261117104414.1182364-2-tadilhusrev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 11:08:13 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] iio: proximity: isg5320a: inverted INT polarity in
  isg5320a_reset()
- [Medium] iio: proximity: isg5320a: free_irq() runs before
  isg5320a_teardown()
- [Medium] iio: proximity: isg5320a: broken wakeup handling in
  isg5320a_events_on()
- [Low] iio: proximity: isg5320a: unchecked enable_irq_wake() in
  isg5320a_events_on()
--

commit b880374f416c9c620d39544cb088cc6a533d446b
Author: Adil H=C3=BCsrev Tepe <tadilhusrev@gmail.com>

iio: proximity: add Imagis ISG5320A SAR sensor driver

This commit adds an IIO proximity driver for the Imagis ISG5320A I2C
capacitive SAR/grip sensor, exposing a raw proximity channel and
rising/falling threshold events.

> diff --git a/drivers/iio/proximity/isg5320a.c b/drivers/iio/proximity/isg=
5320a.c
> new file mode 100644
> index 0000000000000..baa8d07ecfd7f
> --- /dev/null
> +++ b/drivers/iio/proximity/isg5320a.c
> @@ -0,0 +1,880 @@
[ ... ]
> +/* Wait for the INT line to reach @level: up to 10 x 5 ms (vendor :262, =
:281). */
> +static int isg5320a_wait_int(struct isg5320a_data *data, int level)
> +{
> +	int cnt, val;
> +
> +	if (!data->int_gpio) {
> +		msleep(50);
> +		return 0;
> +	}
> +
> +	for (cnt =3D 0; cnt < 10; cnt++) {
> +		/* Logical, not raw: honours the GPIO's DT polarity. */
> +		val =3D gpiod_get_value_cansleep(data->int_gpio);
> +		if (val < 0)
> +			return val;
> +		if (val =3D=3D level)
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
> +		return dev_err_probe(dev, ret, "unlock protect failed\n");
> +
> +	ret =3D regmap_write(data->regmap, ISG5320A_REG_SOFTRESET,	/* :273-276 =
*/
> +			   ISG5320A_SOFTRESET_VAL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "soft reset write failed\n");
> +
> +	usleep_range(1000, 1100);				/* :278 */
> +
> +	ret =3D isg5320a_wait_int(data, 0);			/* :280-289 */
> +	if (ret < 0)
> +		return dev_err_probe(dev, -EIO, "INT not asserted after soft reset\n");

[Severity: High]
Are the @level arguments passed to isg5320a_wait_int() inverted for an
active-low interrupt GPIO?

gpiod_get_value_cansleep() returns the logical state (0 when deasserted,
1 when asserted), whereas the callers here still pass the physical line
levels (1 for released/high before reset, 0 for asserted/low after soft
reset).  When int-gpios is described as GPIO_ACTIVE_LOW in Device Tree,
isg5320a_wait_int(data, 0) waits for INT to be deasserted after soft
reset, timing out and failing probe.

Also, dev_err_probe() overwrites ret with -EIO instead of propagating the
error returned by isg5320a_wait_int().

[ ... ]
> +static int isg5320a_events_on(struct isg5320a_data *data)
> +{
[ ... ]
> +	WRITE_ONCE(data->ev_enabled, true);
> +	enable_irq(data->irq);						/* :721 */
> +	/* Cache the decision: device_may_wakeup(dev) may change before events_=
off(). */
> +	data->irq_wake_enabled =3D device_may_wakeup(dev);
> +	if (data->irq_wake_enabled)
> +		enable_irq_wake(data->irq);				/* :722 */

[Severity: Low]
What happens if enable_irq_wake(data->irq) fails here?
data->irq_wake_enabled remains true while desc->wake_depth stays at 0, so
isg5320a_events_off() will later call disable_irq_wake(data->irq) and
trigger an unbalanced IRQ wake disable warning.

[Severity: Medium]
Does arming enable_irq_wake() in isg5320a_events_on() respect changes to
/sys/.../power/wakeup while events are enabled?

If userspace disables wakeup via sysfs after enabling proximity events,
IRQD_WAKEUP_STATE remains set on data->irq and isg5320a_pm_ops has no
system sleep callbacks to stop the sensor, so the interrupt still wakes
the system from suspend.  Conversely, on Device Tree systems with
wakeup-source, i2c_device_probe() registers client->irq via
dev_pm_set_wake_irq() (which also makes the device_init_wakeup() call in
isg5320a_probe() redundant), arming the wake IRQ on every suspend even
when data->ev_enabled is false.

Wakeup arming and sensor sleep/resume state across system suspend should
be handled in system sleep PM callbacks instead of isg5320a_events_on()
and isg5320a_events_off().

[ ... ]
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
> +	if (data->irq_wake_enabled) {
> +		disable_irq_wake(data->irq);				/* :729 */
> +		data->irq_wake_enabled =3D false;
> +	}
> +}
[ ... ]
> +/* vendor isg5320a_remove(), :2030-2033 */
> +static void isg5320a_teardown(void *arg)
> +{
> +	struct isg5320a_data *data =3D arg;
> +	struct device *dev =3D data->dev;
> +
> +	pm_runtime_disable(dev);
> +
> +	if (data->ev_enabled) {
> +		isg5320a_events_off(data);
> +		pm_runtime_put_noidle(dev);
> +	}
> +
> +	if (!pm_runtime_status_suspended(dev))
> +		isg5320a_mode_sleep(data);
> +
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +}
> +
> +static int isg5320a_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D devm_add_action_or_reset(dev, isg5320a_teardown, data);
> +	if (ret)
> +		return ret;
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
> +
> +		if (device_property_read_bool(dev, "wakeup-source"))
> +			device_init_wakeup(dev, true);
> +	}
> +
> +	indio_dev->name =3D "isg5320a";
> +	indio_dev->modes =3D INDIO_DIRECT_MODE;
> +	if (data->irq > 0) {
> +		indio_dev->info =3D &isg5320a_info;
> +		indio_dev->channels =3D isg5320a_channels;
> +		indio_dev->num_channels =3D ARRAY_SIZE(isg5320a_channels);
> +	} else {
> +		indio_dev->info =3D &isg5320a_info_noirq;
> +		indio_dev->channels =3D isg5320a_channels_noirq;
> +		indio_dev->num_channels =3D ARRAY_SIZE(isg5320a_channels_noirq);
> +	}
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

[Severity: Medium]
Doesn't registering isg5320a_teardown() before devm_request_threaded_irq()
and devm_iio_device_register() cause devres to free data->irq before
isg5320a_teardown() runs?

If the driver is unbound while proximity events are enabled, devres
unregisters indio_dev and calls free_irq(data->irq, indio_dev) while
ISG5320A_REG_IRQFUNC and IRQ wake are still active, and
isg5320a_teardown() -> isg5320a_events_off() then calls disable_irq() and
disable_irq_wake() on an IRQ that has already been shut down and
released.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117104414.1182=
364-1-tadilhusrev@gmail.com?part=3D2
