Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E9A3B6362
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 08:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778745612; cv=none; b=hsNeN+oOuw81PZMqcurPsDzxDYWHKNZg310uU/8o7IWg8pk67f2JKvvtjBvz9OEoQ+mmdtuC2lyUk1ZCCDhGlFL6S7V5aNJhza4mVncbLJ0KzOSsIxG6Gp7xLXlXlp9qqdMVn6GdjbYWcM6Bo+Unv/zDgnTOR/tSP07QiWlNPng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778745612; c=relaxed/simple;
	bh=oKb5hKYMTvD2iGHq3XfSoh1tnPF9CsDDnzbDftl3HW8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P2aZ+ZTLFnFa9+ty15mrFV+/1LMVmB40eda4p39qkHcnJns1vyS3dTsh8tOpDEndK52AP5250vaoYRdpzi3u59kfmvi6VF/trICIYg3B05JfLfDohIEkENrXUP734Z5kTeedbD9qzF5UKQpd0AkPQVB3HAzrFPRq2gABwcHtxzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpyIXD8N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpyIXD8N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3422C2BCB7;
	Thu, 14 May 2026 08:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778745612;
	bh=oKb5hKYMTvD2iGHq3XfSoh1tnPF9CsDDnzbDftl3HW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UpyIXD8NXwrSSIeSsnzilT5Q7ImizjlAM2ia/C6qojXcHFPZwxnOAu7jAaBdlIf9C
	 YjmIuoIZHcqGiCR1iNCVKpbiNNO4TRshs806dSWlv89G+kbS86tjtt5C32riQgwaKu
	 uNQp/dbzR49Xprxyx+gtUpVNjqsRaPDnihF224+yjMT5oCenLT/oG0ZxmH4L/gd8A0
	 ckM0NqnA7xsSW0EzHtlhU84qKxl+bS4pCXQMbUZhmXYvIcOT8rlZLgIAfmMIS/HQ4O
	 xP5LtrcZtnIyLKS2ZldikwkEq/10oW/p6JI9nscNTTQA+AP81IQ15djzYrokNlq0VZ
	 PmEmNpjh/inVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V6 09/11] iio: imu: inv_icm42607: Add Wake on Movement
 to icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260512221634.256747-10-macroalpha82@gmail.com>
References: <20260512221634.256747-10-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 08:00:11 +0000
Message-Id: <20260514080011.B3422C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Race condition in `inv_icm42607_accel_write_event_config` leads to=
 PM runtime reference and state leaks.
- [High] The threaded IRQ handler self-deadlocks on the driver's mutex.
- [High] Devres initialization order causes a Use-After-Free during device =
removal and a potential NULL pointer dereference during probe.
- [High] The Wake-on-Motion thresholds are not configured for the Y and Z a=
xes.
- [Medium] Integer overflow in `inv_icm42607_accel_convert_roc_to_wom` caus=
es misconfiguration for large input values.
- [Medium] Error return in `_inv_icm42607_accel_disable_wom` prevents the a=
ccelerometer from powering off.
- [Low] Pointer type mismatch in `_inv_icm42607_accel_wom_value` causes a c=
ompiler warning.
--

commit cb98aa6ec3bd79c9e6c757530bb7aecf9c26e058
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Wake on Movement to icm42607
   =20
Add support for wake on movement for the icm42607 driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/=
iio/imu/inv_icm42607/inv_icm42607_accel.c
> index 06f2126af22a8..4628bda356370 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
> @@ -209,6 +221,183 @@ static int inv_icm42607_accel_read_sensor(struct ii=
o_dev *indio_dev,
[ ... ]
> +static unsigned int inv_icm42607_accel_convert_roc_to_wom(u64 roc,
> +							  int accel_hz, int accel_uhz)
> +{
> +	/* 1000/256mg per LSB converted in =C2=B5m/s=C2=B2 */
> +	const unsigned int convert =3D (9807U * (MICRO / MILLI)) / 256U;
> +	u64 value;
> +	u64 freq_uhz;
> +
> +	/* return 0 only if roc is 0 */
> +	if (roc =3D=3D 0)
> +		return 0;
> +
> +	freq_uhz =3D (u64)accel_hz * MICRO + (u64)accel_uhz;
> +	value =3D div64_u64(roc * MICRO, freq_uhz * (u64)convert);

Does this calculation overflow for large input values?

The roc value can be up to ~2.14 * 10^15. Multiplying this by MICRO again
could exceed the maximum value of a 64-bit unsigned integer, potentially
resulting in an incorrectly small threshold value wrapping around.

[ ... ]
> +static int inv_icm42607_accel_set_wom_threshold(struct inv_icm42607_stat=
e *st,
> +						u64 value,
> +						int accel_hz, int accel_uhz)
> +{
> +	unsigned int threshold;
> +	int i, ret;
> +
[ ... ]
> +	/* set accel WoM threshold for the 3 axes */
> +	for (i =3D 0; i < 3; i++) {
> +		ret =3D inv_icm42607_mreg_write(st->map, INV_ICM42607_MREG_2,
> +					      INV_ICM42607_REG_ACCEL_WOM_X_THR,
> +					      threshold);

Does this code configure the Y and Z axes?

The register address INV_ICM42607_REG_ACCEL_WOM_X_THR is hardcoded, so it
looks like the X-axis register is overwritten three times while the Y and
Z thresholds are left uninitialized.

> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static int _inv_icm42607_accel_disable_wom(struct iio_dev *indio_dev)
> +{
[ ... ]
> +	scoped_guard(mutex, &st->lock) {
> +		/*
> +		 * Consider that turning off WoM is always working to avoid
> +		 * blocking the chip in on mode and prevent going back to sleep.
> +		 * If there is an error, the chip will anyway go back to sleep
> +		 * and the feature will not work anymore.
> +		 */
> +		st->apex.wom.enable =3D false;
> +		st->apex.on--;
> +		ret =3D inv_icm42607_disable_wom(st);
> +		if (ret)
> +			return ret;

Is this early return intentional?

The comment states that failures should be ignored to avoid blocking the
chip in the on state, but the code immediately returns if
inv_icm42607_disable_wom() fails. This skips the subsequent code that
actually turns off the accelerometer, potentially leaving the chip powered =
on.

> +		/* turn off accel sensor if not used */
> +		if (!st->apex.on && !iio_buffer_enabled(indio_dev)) {
> +			conf.mode =3D INV_ICM42607_SENSOR_MODE_OFF;
> +			ret =3D inv_icm42607_set_accel_conf(st, &conf, &sleep_ms);
> +			if (ret)
> +				return ret;
> +		}
> +	}
[ ... ]
> @@ -467,6 +660,113 @@ static int inv_icm42607_accel_hwfifo_flush(struct i=
io_dev *indio_dev,
[ ... ]
> +static int inv_icm42607_accel_write_event_config(struct iio_dev *indio_d=
ev,
> +						 const struct iio_chan_spec *chan,
> +						 enum iio_event_type type,
> +						 enum iio_event_direction dir,
> +						 bool state)
> +{
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);
> +
> +	/* handle only WoM (roc rising) event */
> +	if (type !=3D IIO_EV_TYPE_ROC || dir !=3D IIO_EV_DIR_RISING)
> +		return -EINVAL;
> +
> +	if (st->apex.wom.enable =3D=3D state)
> +		return 0;

Can multiple concurrent writes from userspace bypass this lockless check?

If two threads write '1', both could pass the check, acquire PM runtime
references, and increment st->apex.on repeatedly within
inv_icm42607_accel_enable_wom(). A subsequent write of '0' would only decre=
ment
the counters once, potentially leaking a runtime PM reference and preventing
suspend.

> +
> +	if (state)
> +		return inv_icm42607_accel_enable_wom(indio_dev);
> +
> +	return inv_icm42607_accel_disable_wom(indio_dev);
> +}
[ ... ]
> +static int _inv_icm42607_accel_wom_value(struct inv_icm42607_state *st,
> +					 int val, int val2)
> +{
> +	u64 value;
> +	unsigned int accel_hz, accel_uhz;
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	ret =3D inv_icm42607_accel_read_odr(st, &accel_hz, &accel_uhz);

This isn't a bug, but accel_hz and accel_uhz are declared as unsigned int
while inv_icm42607_accel_read_odr() expects int * arguments. This causes an
incompatible pointer type warning.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 56ce9a51cb9c9..a69cd0a61050e 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> @@ -347,6 +431,110 @@ static int inv_icm42607_setup(struct inv_icm42607_s=
tate *st,
[ ... ]
> +static irqreturn_t inv_icm42607_irq_handler(int irq, void *_data)
> +{
> +	struct inv_icm42607_state *st =3D _data;
> +	struct device *dev =3D regmap_get_device(st->map);
> +	unsigned int status;
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
[ ... ]
> +	if (status & INV_ICM42607_INT_STATUS_FIFO_THS) {
> +		ret =3D inv_icm42607_buffer_fifo_read(st, 0);

Will this cause a self-deadlock?

The threaded IRQ handler acquires st->lock via guard(mutex) and then calls
inv_icm42607_buffer_fifo_read(), which also attempts to acquire the exact
same non-recursive mutex:

drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c:inv_icm42607_buffer_fifo=
_read() {
...
    guard(mutex)(&st->lock);

> +		if (ret) {
> +			dev_err(dev, "FIFO read error %d\n", ret);
> +			return IRQ_HANDLED;
> +		}
[ ... ]
> @@ -441,6 +634,11 @@ int inv_icm42607_core_probe(struct regmap *regmap, c=
onst struct inv_icm42607_hw
>  	pm_runtime_set_autosuspend_delay(dev, INV_ICM42607_SUSPEND_DELAY_MS);
>  	pm_runtime_use_autosuspend(dev);
> =20
> +	/* Initialize interrupt handling */
> +	ret =3D inv_icm42607_irq_init(st, irq, irq_type, open_drain);
> +	if (ret)
> +		return ret;
> +
>  	/* Initialize IIO device for Accel */
>  	st->indio_accel =3D inv_icm42607_accel_init(st);

Is this interrupt request ordered correctly?

The IRQ is enabled via devm_request_threaded_irq in inv_icm42607_irq_init()
before the IIO device is allocated and its buffers are set up. If an early
interrupt fires, could it dereference a NULL st->indio_accel pointer?

Since devres frees resources in reverse order, could this also cause a
use-after-free if an interrupt fires during device teardown after the IIO
device has been freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512221634.2567=
47-1-macroalpha82@gmail.com?part=3D9
