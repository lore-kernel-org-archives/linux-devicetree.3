Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DB933A70F
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 04:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780117044; cv=none; b=uPXf0he16Gu3qGxP/h5dqw86PCH60yBPNfcmKEZOVCkF1tZyeyC1tHGSYbdeeuo0OuxcMt3gbPqkfoEE7VwXy8A0HO9ghAKjKnifi/5hNUvhyx7nHd00kIfrjSyxiJp41BY+AUczbt+4krYtrEqZOQWb/Wa0vTfBNFFRuXxMyrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780117044; c=relaxed/simple;
	bh=gOSGTajOv0HWjC6KZNF9+HU/YYsNxuqp8QXIPiP/wo4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dslm1iOSIjWbaEYodkhETNQ83ErN0NOJBOulAatB2/G5eYYrgWxPnOKXo56aYUBjQM+Ch97Ga6r5bYJYrYA+xzjvB92DRWmoF2uwhx30dH2pzCmEX2maXEHRBSvPawOOh3cpST5Yu/Ri8CgBa43w1WC7ddVEI29b41jo3i9+KZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bnBQAR55; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bnBQAR55"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E20B1F00893;
	Sat, 30 May 2026 04:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780117042;
	bh=8errXZS6RyY1c6+fnshf2MC6MfjBMsZoabH0fxVi9NI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bnBQAR55GDJ4MZVfDt3kWYV+DY/ONqCdJTVtnSsDsjwx+Tx5YsAF6YFqn7AmIIyBG
	 E4GxcBSFG07e08q1Dn0t6YCkMRZUMXqjlSWQANECzl28c4CR4OtPKiIOBSHnpnMtAL
	 BBPGbB00VklLa9Q8onA672CNcGcUJS9R9Z1MevalVxoRBV3QR/DNM/MZXw8oPuarvt
	 DUt83dBxVnhli7krS1isQ71AJY/q/uQPIRH24Rc2EVHgCHgf7NIrxKk12lQ0/mscVF
	 R6BALT+aPtMK471fJNpNT218brLqASZHEkYNP5QkrrNBovPTajmvfC6bBPx/SAOqTV
	 L3kOWfRHtYxcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V9 10/11] iio: imu: inv_icm42607: Add Gyroscope to
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260530031739.109063-11-macroalpha82@gmail.com>
References: <20260530031739.109063-11-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 04:57:22 +0000
Message-Id: <20260530045722.7E20B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [Critical] Deadlock in `inv_icm42607_gyro_parse_fifo` due to recursive mu=
tex acquisition.
- [High] Unconditional dereference of uninitialized `st->indio_gyro` in `in=
v_icm42607_buffer_hwfifo_flush` causes kernel panic during probe.
- [Medium] Gyroscope sensor is left powered on indefinitely after a raw rea=
d if the accelerometer buffer is active.

Pre-existing issues:
- [Critical] System suspend and resume callbacks cause a recursive deadlock.
- [High] Double unlock of `st->lock` in the `inv_icm42607_irq_handler` erro=
r path.
- [High] Data race and unprotected state access during `inv_icm42607_buffer=
_hwfifo_flush` exposes software FIFO state to concurrent mutation.
- [High] Unaligned memory access inside `inv_icm42607_fifo_is_data_valid` c=
auses potential panics on architectures requiring strict alignment.
--

commit 337cdabfeb961b7efc61cd16db6efc362ac8652d
Author: Chris Morgan <macromorgan@hotmail.com>

    iio: imu: inv_icm42607: Add Gyroscope to icm42607
   =20
    Add gyroscope functions to the icm42607 driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c b/drivers=
/iio/imu/inv_icm42607/inv_icm42607_buffer.c
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c
[ ... ]
> @@ -507,12 +520,14 @@ int inv_icm42607_buffer_hwfifo_flush(struct inv_icm=
42607_state *st,
>  int inv_icm42607_buffer_hwfifo_flush(struct inv_icm42607_state *st,
>  				     unsigned int count)
>  {
> +	struct inv_icm42607_sensor_state *gyro_st =3D iio_priv(st->indio_gyro);
>  	struct inv_icm42607_sensor_state *accel_st =3D iio_priv(st->indio_accel=
);
>  	struct inv_sensors_timestamp *ts;
> -	s64 accel_ts;
> +	s64 gyro_ts, accel_ts;
>  	int ret;
> =20
>  	accel_ts =3D iio_get_time_ns(st->indio_accel);
> +	gyro_ts =3D iio_get_time_ns(st->indio_gyro);

[Severity: High]
Does this unconditionally dereference an uninitialized pointer during probe?

If a fast userspace process writes to the hwfifo_flush attribute of the
accelerometer device after it is registered but before st->indio_gyro is
initialized in inv_icm42607_core_probe(), inv_icm42607_buffer_hwfifo_flush()
will be triggered. This would cause a kernel panic when calling
iio_priv(st->indio_gyro) and iio_get_time_ns(st->indio_gyro) with a NULL
pointer.

> =20
>  	ret =3D inv_icm42607_buffer_fifo_read(st, count);
>  	if (ret)
> @@ -521,6 +536,14 @@ int inv_icm42607_buffer_hwfifo_flush(struct inv_icm4=
2607_state *st,
>  	if (st->fifo.nb.total =3D=3D 0)
>  		return 0;
> =20
> +	if (st->fifo.nb.gyro > 0) {

[Severity: High]
This is a pre-existing issue, but does this function expose the software
FIFO state to concurrent mutation?

inv_icm42607_buffer_fifo_read() acquires and drops st->lock internally while
populating st->fifo. After it returns, inv_icm42607_buffer_hwfifo_flush()
accesses st->fifo.nb.gyro and st->fifo.nb.accel without any lock held.

If a concurrent IRQ or concurrent flush occurs in the unguarded window
between the return of fifo_read and the re-acquisition of the lock in
inv_icm42607_gyro_parse_fifo(), the global st->fifo.data and counters could
be overwritten, causing the parser to process corrupted or out-of-bounds
data.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
[ ... ]
> @@ -539,6 +587,7 @@ static int inv_icm42607_suspend(struct device *dev)
> =20
>  	guard(mutex)(&st->lock);
> =20
> +	st->suspended.gyro =3D st->conf.gyro.mode;
>  	st->suspended.accel =3D st->conf.accel.mode;
>  	st->suspended.temp =3D st->conf.temp_en;
>  	if (pm_runtime_suspended(dev))

[Severity: Critical]
This is a pre-existing issue, but does this cause a recursive locking
deadlock during system suspend?

inv_icm42607_suspend() acquires the driver lock via guard(mutex)(&st->lock).
It then explicitly calls pm_runtime_force_suspend(), which is routed by the
PM core to the driver's runtime suspend callback,
inv_icm42607_runtime_suspend().

The runtime suspend callback attempts to acquire the exact same lock using
guard(mutex)(&st->lock). Since kernel mutexes are not recursive, this will
cause an immediate deadlock. The exact same recursive deadlock occurs
between inv_icm42607_resume() and pm_runtime_force_resume().

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_gyro.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c
[ ... ]
> +static int inv_icm42607_gyro_read_sensor(struct iio_dev *indio_dev,
> +					 struct iio_chan_spec const *chan,
> +					 s16 *val)
> +{
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);
> +	struct inv_icm42607_sensor_state *gyro_st =3D iio_priv(indio_dev);
> +	struct device *dev =3D regmap_get_device(st->map);
> +	struct inv_icm42607_sensor_conf conf =3D INV_ICM42607_SENSOR_CONF_INIT;
> +	unsigned int reg;
> +	__be16 *data;
> +	int ret;
[ ... ]
> +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
> +	ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	/* enable gyro sensor */
> +	conf.mode =3D gyro_st->power_mode;
> +	ret =3D inv_icm42607_set_gyro_conf(st, &conf, NULL);

[Severity: Medium]
Is the gyroscope sensor left powered on indefinitely after a raw read if
the accelerometer buffer is active?

The gyroscope is explicitly powered on here via inv_icm42607_set_gyro_conf(=
),
and the function relies on the PM autosuspend callback to power it back off
when dropping the runtime PM reference. However, if the accelerometer buffer
is concurrently active, the overall runtime PM usage count remains greater
than 0. As a result, the device will not autosuspend, and the gyroscope
sensor is never turned back off, wasting power indefinitely until the
accelerometer buffer is disabled.

[ ... ]
> +int inv_icm42607_gyro_parse_fifo(struct iio_dev *indio_dev)
> +{
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);
> +	struct inv_icm42607_sensor_state *gyro_st =3D iio_priv(indio_dev);
> +	struct inv_sensors_timestamp *ts =3D &gyro_st->ts;
> +	ssize_t i, size;
> +	unsigned int no;
> +	const void *accel, *gyro, *timestamp;
> +	const s8 *temp;
> +	unsigned int odr;
> +	s64 ts_val;
> +	struct inv_icm42607_gyro_buffer buffer =3D { };
> +
> +	guard(mutex)(&st->lock);

[Severity: Critical]
Could this result in a recursive mutex deadlock?

When a hardware FIFO interrupt fires, inv_icm42607_irq_handler() acquires
the driver lock via mutex_lock(&st->lock). It then calls
inv_icm42607_buffer_fifo_parse(), which delegates to this newly added
inv_icm42607_gyro_parse_fifo() function.

Because this function explicitly attempts to acquire the exact same lock
using guard(mutex)(&st->lock), and kernel mutexes are not recursive, this
will cause an immediate self-deadlock in the threaded IRQ handler, hanging
the device.

> +
> +	/* parse all fifo packets */
> +	for (i =3D 0, no =3D 0; i < st->fifo.count; i +=3D size, ++no) {
> +		size =3D inv_icm42607_fifo_decode_packet(&st->fifo.data[i],
> +				&accel, &gyro, &temp, &timestamp, &odr);
> +		/* quit if error or FIFO is empty */
> +		if (size <=3D 0)
> +			return size;
> +
> +		/* If the packet size could cause us to overflow, return. */
> +		if (i + size > st->fifo.count)
> +			return -EIO;
> +
> +		/* skip packet if no gyro data or data is invalid */
> +		if (gyro =3D=3D NULL || !inv_icm42607_fifo_is_data_valid(gyro))

[Severity: High]
This is a pre-existing issue, but does this cause an unaligned memory
access panic on architectures requiring strict alignment?

inv_icm42607_fifo_decode_packet() assigns an unaligned pointer
(&pack1->data, located at offset 1 of inv_icm42607_fifo_1sensor_packet) to
the gyro variable.

When inv_icm42607_fifo_is_data_valid() takes this pointer, it casts it to
struct inv_icm42607_fifo_sensor_data * and directly dereferences it using
be16_to_cpu(s->x). Since struct inv_icm42607_fifo_sensor_data is not marked
__packed, the compiler assumes the pointer is 16-bit aligned.

Emitting a 16-bit read instruction against an odd memory address will cause
a hardware alignment fault on architectures that do not support unaligned
accesses.

> +			continue;


[Severity: High]
This is a pre-existing issue, but is there a double unlock of st->lock in
the error path of inv_icm42607_irq_handler()?

If the FIFO_THS interrupt fires, the driver explicitly unlocks st->lock
before calling inv_icm42607_buffer_fifo_read():

drivers/iio/imu/inv_icm42607/inv_icm42607_core.c:inv_icm42607_irq_handler()
	mutex_unlock(&st->lock);
	ret =3D inv_icm42607_buffer_fifo_read(st, 0);
	if (ret) {
		dev_err(dev, "FIFO read error %d\n", ret);
		goto out_unlock;
	}

If the read returns an error, it jumps to out_unlock, which unconditionally
executes mutex_unlock(&st->lock). Since the lock was already released and
never re-acquired, this unlocks an already unlocked mutex.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530031739.1090=
63-1-macroalpha82@gmail.com?part=3D10
