Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92CC429802
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852274; cv=none; b=NFTOXqfFJRgGYO3FNC6di/nULPQmlFUT89/cacJT3mSdUPSw/fQcpal6dLujarRM+NFm293ThpkPWGKUhs/rwJQF3Ru47SnxVJYlGQhV+YWCoMHNaTrbpZD2ljrLEmDXVvfK0uYlO2+9+23CYPaztCyLqqHLHrHZ7pb55zzpmnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852274; c=relaxed/simple;
	bh=0z1jG6sEWNC/IrzblHbrMzvOqQMID6VmzaanKN2jWc4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VeZv2CCRpfeqyOa5JMOTqcBAy9r1ZoBEAfJTkFMqcS4VnCVJV4MoJ5Bl/qcARXyrGB1EkhNQfno87XHFAonqTejJiTnJzZmHYkDhQ66y5Q+jLT+2X9KPpIgvy5nxdwL6goNZMhQ2gB1cVkbs3mv/Wy5fsDid8dt3ET1PoIkGfg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QS6oPwlV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QS6oPwlV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E235AC2BCB7;
	Fri, 15 May 2026 13:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778852274;
	bh=0z1jG6sEWNC/IrzblHbrMzvOqQMID6VmzaanKN2jWc4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=QS6oPwlVWxBYQHVrxwODhQ5dfqJnLNkJMvN/F8CqD5CPfzcDbBKTVrxTPRRlxOsaN
	 hoU8l6NoWEjGogeM2HOxQr/wB0IIe7853gLb37hf7y2Z7QmCvqTgp9tkG3Ylr2k0WL
	 CUmnDy99cSObmEx1mE3y4d0zQIA14eyX+aKsAYRJpFI6kO9iRG2Vb0MkevM+Lqh0J5
	 1fX3b27UdFQBttFX5tsEIlYfJBHUyQjBYbTQgxmhznAi9Fadz9c++T2zqUnFPuvogW
	 p44vwaV8hdtZ9OmMgLsdYiS5lwf0yDJWURUlImon2j2Bpuh0q3cMMuYtw2yoJ2YiNA
	 mmhDTnwRf0SoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V7 10/11] iio: imu: inv_icm42607: Add Gyroscope to
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515130018.237378-11-macroalpha82@gmail.com>
References: <20260515130018.237378-11-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 13:37:53 +0000
Message-Id: <20260515133753.E235AC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] The bounds check in `inv_icm42607_gyro_parse_fifo()` is invert=
ed, dropping valid packets and causing out-of-bounds memory reads.
- [High] The local variable `gyro_ts` is passed uninitialized to `inv_senso=
rs_timestamp_interrupt()` in `inv_icm42607_buffer_hwfifo_flush()`.
- [High] Missing lock acquisition in `inv_icm42607_gyro_hwfifo_flush()` all=
ows concurrent data races over shared FIFO state.
- [High] Missing PM runtime acquisition in `inv_icm42607_gyro_hwfifo_set_wa=
termark()`.
- [Medium] `inv_icm42607_gyro_read_avail()` exposes uninitialized padding a=
s valid sampling frequencies to user-space.
--

commit 207799d1c88894b8f276d2717bc0960a73f7d744
Author: Chris Morgan <macromorgan@hotmail.com>

    iio: imu: inv_icm42607: Add Gyroscope to icm42607

This commit adds gyroscope functions to the inv_icm42607 driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c b/drivers=
/iio/imu/inv_icm42607/inv_icm42607_buffer.c
> index 4371f428cc3f8..771120fa8ebf8 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c
[ ... ]
> @@ -499,9 +512,10 @@ int inv_icm42607_buffer_fifo_parse(struct inv_icm426=
07_state *st)
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
[ ... ]
> @@ -513,6 +527,14 @@ int inv_icm42607_buffer_hwfifo_flush(struct inv_icm4=
2607_state *st,
>  	if (st->fifo.nb.total =3D=3D 0)
>  		return 0;
> =20
> +	if (st->fifo.nb.gyro > 0) {
> +		ts =3D &gyro_st->ts;
> +		inv_sensors_timestamp_interrupt(ts, st->fifo.nb.gyro, gyro_ts);

Is it possible that gyro_ts is used uninitialized here? It appears to be
declared on the stack but never assigned a value, which would feed kernel
stack memory into the timestamp state machine.

> +		ret =3D inv_icm42607_gyro_parse_fifo(st->indio_gyro);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	if (st->fifo.nb.accel > 0) {
>  		ts =3D &accel_st->ts;
>  		inv_sensors_timestamp_interrupt(ts, st->fifo.nb.accel, accel_ts);
> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_gyro.c
> new file mode 100644
> index 0000000000000..5a5fd13ba64ec
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c
[ ... ]
> +static int inv_icm42607_gyro_read_avail(struct iio_dev *indio_dev,
> +					struct iio_chan_spec const *chan,
> +					const int **vals,
> +					int *type, int *length, long mask)
> +{
> +	if (chan->type !=3D IIO_ANGL_VEL)
> +		return -EINVAL;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE:
> +		*vals =3D (const int *)inv_icm42607_gyro_scale_nano;
> +		*type =3D IIO_VAL_INT_PLUS_NANO;
> +		*length =3D ARRAY_SIZE(inv_icm42607_gyro_scale_nano) * 2;
> +		return IIO_AVAIL_LIST;
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		*vals =3D (const int *)inv_icm42607_gyro_odr;
> +		*type =3D IIO_VAL_INT_PLUS_MICRO;
> +		*length =3D ARRAY_SIZE(inv_icm42607_gyro_odr) * 2;

Could this expose uninitialized padding to user-space?

Because inv_icm42607_gyro_odr is initialized with designated initializers
starting at index 5, the first 5 entries are implicitly zero-initialized.
Returning the entire array length might expose these 0.000000 values as val=
id
sampling frequencies in the sampling_frequency_available sysfs attribute.

> +		return IIO_AVAIL_LIST;
> +	default:
> +		return -EINVAL;
> +	}
> +}
[ ... ]
> +static int inv_icm42607_gyro_hwfifo_set_watermark(struct iio_dev *indio_=
dev,
> +						  unsigned int val)
> +{
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);
> +
> +	guard(mutex)(&st->lock);
> +
> +	st->fifo.watermark.gyro =3D val;
> +	return inv_icm42607_buffer_update_watermark(st);

Is a PM runtime reference required here before updating the watermark?

inv_icm42607_buffer_update_watermark() modifies hardware registers, but this
function doesn't acquire a PM runtime reference. This might result in writi=
ng
to the device while it is suspended.

> +}
> +
> +static int inv_icm42607_gyro_hwfifo_flush(struct iio_dev *indio_dev,
> +					  unsigned int count)
> +{
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);
> +	struct device *dev =3D regmap_get_device(st->map);
> +	int ret;
> +
> +	if (count =3D=3D 0)
> +		return 0;
> +
> +	/* Make sure we don't try to count more than the buffer can hold. */
> +	count =3D min(count, sizeof(st->fifo.data));
> +
> +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
> +	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
> +		return -ENXIO;
> +
> +	ret =3D inv_icm42607_buffer_hwfifo_flush(st, count);

Does this need to acquire st->lock before calling
inv_icm42607_buffer_hwfifo_flush()?

Because inv_icm42607_buffer_hwfifo_flush() calls inv_icm42607_gyro_parse_fi=
fo()
without holding the lock, an interrupt could fire concurrently and overwrite
st->fifo.data and st->fifo.count while they are being parsed locklessly.

> +	if (ret)
> +		return ret;
> +
> +	return st->fifo.nb.gyro;
> +}
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
> +	for (i =3D 0, no =3D 0; i < st->fifo.count; i +=3D size, ++no) {
> +		size =3D inv_icm42607_fifo_decode_packet(&st->fifo.data[i],
> +				&accel, &gyro, &temp, &timestamp, &odr);
> +		/* quit if error or FIFO is empty */
> +		if (size <=3D 0)
> +			return size;
> +
> +		/* If the packet size could cause us to overflow, return. */
> +		if (i + size <=3D st->fifo.count)

Is this bounds check inverted?

It appears this condition evaluates to true when the packet fits safely wit=
hin
the buffer, causing it to abort on valid data. Conversely, if a packet size
exceeds the buffer, the condition evaluates to false and allows the subsequ=
ent
memcpy() to read out of bounds.

> +			return -EIO;
> +
> +		/* skip packet if no gyro data or data is invalid */
> +		if (gyro =3D=3D NULL || !inv_icm42607_fifo_is_data_valid(gyro))
> +			continue;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515130018.2373=
78-1-macroalpha82@gmail.com?part=3D10
