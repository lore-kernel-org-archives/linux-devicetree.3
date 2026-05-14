Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2866A2DF15C
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778751310; cv=none; b=DbRYWp/yMM/yAMrlz67Hzes6vDVlFzFbPzKYKlKFWPNe9eciMDWnSfexEVTVqmIUmaOMczyRyFaR5KxWQCGMDyMdDKJu3YZX5N6qseuX5CiE64oeL7A5WxUcnwXOCz0Me3ZwD8aRtPnB+PzzumqfQWjJZqSAaLxlS0yeQ1lDE+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778751310; c=relaxed/simple;
	bh=JM1AMVbkfoa0kmMUo43oYOfKYIRtB4u9P390GLGKceg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KXEL/unBs9K4cQmPtPiz9yzYdFUtdnbcf2nOYCKDgRgwqXGuSwCHR/fijX7jWALeOEmyan5FhwrsXEb0vOGpJ5kHM+0TtBxqzFXqczwMTJbnjAlLfUBloDJe7GNm+YQxl1zVqszmWVAUJEwvefAQLUTDcWBy/6vP8vz2+auhJIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/J8kVUn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/J8kVUn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5E0C2BCB7;
	Thu, 14 May 2026 09:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778751309;
	bh=JM1AMVbkfoa0kmMUo43oYOfKYIRtB4u9P390GLGKceg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=B/J8kVUnNrlBdhMWitVa8bUgeraGIP4kHLmtmVW7kNS5NNPMZQ8pxaA4RPMirfWsv
	 3EMXlwLt+y6Aj1J7UqA3/tXA/284OJKD+e3B4Nl1mO+FwyBzpQf/8Crg4LzZu+TTPx
	 hrx7GGfqpCtEYkbevlFkWPSbffEwjdyJ30n+Awu33XW5yX9gNCfDOYE3ovuHKtPIfI
	 r6I/NPDEICvG21t5QNMt0NuM1q7ENBlkJDylX9KTxv5ZF6aA5iwvOVl5cwuGRsrgai
	 Bq3Pb54HO69yC9PSOa521jOL6iK/Og8mHsW/gOv7YyyJ6em93Om8GYI3uZPybti0WL
	 kqyHYRlWDBDXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V6 10/11] iio: imu: inv_icm42607: Add Gyroscope to
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260512221634.256747-11-macroalpha82@gmail.com>
References: <20260512221634.256747-11-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 09:35:08 +0000
Message-Id: <20260514093509.2D5E0C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Uninitialized variable 'size' and inverted logic in FIFO parsing l=
oop condition.
- [High] Self-deadlock due to double acquisition of `st->lock` in hardware =
FIFO flush.
- [High] Race condition in device initialization leads to NULL pointer dere=
ference in IRQ handler.
- [Medium] Gyroscope remains indefinitely powered on in software state afte=
r a raw read.
- [Medium] The gyroscope IIO device does not implement the `read_avail` API.
--

commit 90abb258df502e4c4bb56ac17141c1096a23395d
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Gyroscope to icm42607

Add gyroscope functions to the icm42607 driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index a69cd0a61050e..c8545dd68cdb0 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
[ ... ]
> @@ -435,6 +478,7 @@ static irqreturn_t inv_icm42607_irq_timestamp(int irq=
, void *_data)
>  {
>  	struct inv_icm42607_state *st =3D _data;
> =20
> +	st->timestamp.gyro =3D iio_get_time_ns(st->indio_gyro);
>  	st->timestamp.accel =3D iio_get_time_ns(st->indio_accel);

Could this result in a NULL pointer dereference?

In inv_icm42607_core_probe(), the interrupt is initialized and the accelero=
meter
device is registered and exposed to userspace before st->indio_gyro is
allocated:

	st->indio_accel =3D inv_icm42607_accel_init(st);
	if (IS_ERR(st->indio_accel))
		...
	st->indio_gyro =3D inv_icm42607_gyro_init(st);

If userspace enables the accelerometer immediately, the interrupt could fire
while st->indio_gyro is still NULL, causing iio_get_time_ns() to dereferenc=
e it.

[ ... ]
> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_gyro.c
> new file mode 100644
> index 0000000000000..529929a5349f9
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c
[ ... ]
> +static int inv_icm42607_gyro_read_sensor(struct inv_icm42607_state *st,
> +					 struct iio_chan_spec const *chan,
> +					 s16 *val)
> +{
[ ... ]
> +	/* enable gyro sensor */
> +	conf.mode =3D INV_ICM42607_SENSOR_MODE_LOW_NOISE;
> +	ret =3D inv_icm42607_set_gyro_conf(st, &conf, NULL);
> +	if (ret)
> +		return ret;
> +
> +	/* read gyro register data */
> +	data =3D &st->buffer[0];
> +	ret =3D regmap_bulk_read(st->map, reg, data, sizeof(*data));
> +	if (ret)
> +		return ret;
> +
> +	*val =3D be16_to_cpup(data);
> +	if (*val =3D=3D INV_ICM42607_DATA_INVALID)
> +		return -EINVAL;
> +
> +	return 0;
> +}

Should the gyroscope be powered down before returning?

The device is explicitly powered up to INV_ICM42607_SENSOR_MODE_LOW_NOISE,
but it is never restored to INV_ICM42607_SENSOR_MODE_OFF. While
pm_runtime_put_autosuspend() is used, if the accelerometer is running
concurrently, the device usage count won't reach zero and the gyroscope
will remain powered on indefinitely.

[ ... ]
> +static int inv_icm42607_gyro_hwfifo_flush(struct iio_dev *indio_dev,
> +					  unsigned int count)
> +{
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);
> +	int ret;
> +
> +	if (count =3D=3D 0)
> +		return 0;
> +
> +	/* Make sure we don't try to count more than the buffer can hold. */
> +	count =3D min(count, sizeof(st->fifo.data));
> +
> +	guard(mutex)(&st->lock);
> +
> +	ret =3D inv_icm42607_buffer_hwfifo_flush(st, count);

Can this lead to a self-deadlock?

The st->lock mutex is acquired here using guard(mutex)(&st->lock),
but inv_icm42607_buffer_hwfifo_flush() subsequently calls
inv_icm42607_buffer_fifo_read(), which unconditionally attempts to
acquire the exact same st->lock.

[ ... ]
> +static const struct iio_info inv_icm42607_gyro_info =3D {
> +	.read_raw =3D inv_icm42607_gyro_read_raw,
> +	.write_raw =3D inv_icm42607_gyro_write_raw,
> +	.write_raw_get_fmt =3D inv_icm42607_gyro_write_raw_get_fmt,
> +	.update_scan_mode =3D inv_icm42607_gyro_update_scan_mode,
> +	.hwfifo_set_watermark =3D inv_icm42607_gyro_hwfifo_set_watermark,
> +	.hwfifo_flush_to_buffer =3D inv_icm42607_gyro_hwfifo_flush,
> +};

Is the .read_avail callback intentionally missing?

Without it, the driver does not expose supported sampling frequencies
and scale factors to userspace.

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
> +	/* parse all fifo packets */
> +	for (i =3D 0, no =3D 0; i < st->fifo.count && i + size > st->fifo.count;
> +	     i +=3D size, ++no) {
> +		size =3D inv_icm42607_fifo_decode_packet(&st->fifo.data[i],

Will this evaluate the loop condition with an uninitialized size variable?

The variable size is declared but uninitialized, so the expression
i + size > st->fifo.count will use an indeterminate value on the first
iteration.

Additionally, should this check verify that the packet fits within
the buffer (e.g. <=3D) rather than exceeding it (>)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512221634.2567=
47-1-macroalpha82@gmail.com?part=3D10
