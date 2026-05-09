Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CBB8C1F
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 20:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778356951; cv=none; b=sg5f0RqRaysz1PaP8h85yvvXIPEu53QzAOC/8eWzVFxYT+zTuVwCzA7h+kewX4wYUL0avviWDF8gjBcEQf8pVI33jse9bzBktSaCBS2X4yIvyqX3sevTjngQQPdQL8atxJ6qku2CqMNUG1E5Fy4YSq/qjAlT4Hae2gKlElXYCK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778356951; c=relaxed/simple;
	bh=P7T49CD4Vz36J4oDkJHcI4tZOfGnpGflQ4HC9jkrJwo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cy6VtY//sRUQq9AEyPWz7YTZByoi/sBDBLlv9iefLlef8vNBWVr7HZm6KqvqdOsyeRFZoDc28vvPgVbO5tjjc94YBFd5x+MnZAh6XwRk7Q40r5ct/4ZbLYLCPyCk9aH/RUZmmTckKtPIFxuerCBuOVCEWJ1LY1+awooaXXELmQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/W52AVz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/W52AVz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBD0C2BCB2;
	Sat,  9 May 2026 20:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778356950;
	bh=P7T49CD4Vz36J4oDkJHcI4tZOfGnpGflQ4HC9jkrJwo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=T/W52AVzMiKMmJzTSuqMDIMXebphphc9le3vJKU45t6vOQw65NQT40kRQFV6ScuXu
	 FoY4GLLY6CUWFc506fQjCMzkPFuG/Y1GeOtmmY5P5bIl0/e34Zf+XibqMUMeS2AQCK
	 wYr2CmK+H8KNLLuxckBFv64f2z6EAJFtIQ+vVbTFHm7n/bUkd43pth4EZJdmch5IPE
	 4m5f6aD9buFUhdUqDhJCv/EX0D6yJ/ISisa7brHceF7NJygMI2luTIc2+kusVeDt9i
	 ZUwoSjArD6dMBBt4x7mfyPwDvAh4EYRWOYpE7ERqmcUsR7Y2j96pF9Jh45rylj3Sug
	 aQDZjvwqqKuZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 08/11] iio: imu: inv_icm42607: Add Accelerometer for
 icm42607
Reply-To: sashiko@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260509191907.24734-9-macroalpha82@gmail.com>
References: <20260509191907.24734-9-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 20:02:29 +0000
Message-Id: <20260509200230.7DBD0C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Uninitialized `st->indio_gyro` dereference in `hwfifo_flush`.
- [High] Uninitialized variable and buffer overflow in `inv_icm42607_buffer=
_fifo_read`.
- [High] Out-of-bounds read in `inv_icm42607_accel_parse_fifo` due to missi=
ng boundary check.
- [High] Torn read and data race on `st->timestamp.accel`.
- [Medium] Ignored error code in `inv_icm42607_accel_read_sensor`.
- [Medium] Missing rollback of temperature sensor configuration on error.
- [Medium] Software timestamp state is not rolled back if hardware ODR conf=
iguration fails.
- [Medium] IIO device registration race with wakeup configuration.
- [Medium] Invalid Array Hole / Reserved State Exposure in `inv_icm42607_ac=
cel_odr`.
--

commit c0c9f30a70b1f8b6ae97565d96f6f70b49377e9d
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Accelerometer for icm42607

Add icm42607 accelerometer sensor for icm42607.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/=
iio/imu/inv_icm42607/inv_icm42607_accel.c
> index 0000000000000..f90ba46bd7e48
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
[ ... ]
> +static int inv_icm42607_accel_update_scan_mode(struct iio_dev *indio_dev,
> +					       const unsigned long *scan_mask)
> +{
[ ... ]
> +	if (*scan_mask & INV_ICM42607_SCAN_MASK_TEMP) {
> +		/* enable temp sensor */
> +		ret =3D inv_icm42607_set_temp_conf(st, true, &sleep_temp);
> +		if (ret)
> +			goto out_unlock;
> +		fifo_en |=3D INV_ICM42607_SENSOR_TEMP;
> +	}
> +
> +	if (*scan_mask & INV_ICM42607_SCAN_MASK_ACCEL_3AXIS) {
> +		/* enable accel sensor */
> +		conf.mode =3D accel_st->power_mode;
> +		conf.filter =3D accel_st->filter;
> +		ret =3D inv_icm42607_set_accel_conf(st, &conf, &sleep_accel);
> +		if (ret)
> +			goto out_unlock;

If inv_icm42607_set_accel_conf() fails here, the function jumps to out_unlo=
ck
and returns an error.

Does this leave the temperature sensor actively consuming power indefinitel=
y,
since it is not disabled on the error path?

[ ... ]
> +static int inv_icm42607_accel_read_sensor(struct iio_dev *indio_dev,
> +					  struct iio_chan_spec const *chan,
> +					  s16 *val)
> +{
[ ... ]
> +	*val =3D be16_to_cpup(data);
> +	if (*val =3D=3D INV_ICM42607_DATA_INVALID)
> +		ret =3D -EINVAL;
> +
> +	return 0;
> +}

Should this return ret instead of 0?

If *val =3D=3D INV_ICM42607_DATA_INVALID, ret is set to -EINVAL but then di=
scarded.
This regression would silently leak the invalid data value (-32768) to
user-space.

[ ... ]
> +static const int inv_icm42607_accel_odr[][2] =3D {
> +	[INV_ICM42607_ODR_1_5625HZ_LP] =3D { 1, 562500 },
> +	[INV_ICM42607_ODR_3_125HZ_LP] =3D { 3, 125000 },
> +	[INV_ICM42607_ODR_6_25HZ_LP] =3D { 6, 250000 },
> +	[INV_ICM42607_ODR_12_5HZ] =3D { 12, 500000 },
> +	[INV_ICM42607_ODR_25HZ] =3D { 25, 0 },
> +	[INV_ICM42607_ODR_50HZ] =3D { 50, 0 },
> +	[INV_ICM42607_ODR_100HZ] =3D { 100, 0 },
> +	[INV_ICM42607_ODR_200HZ] =3D { 200, 0 },
> +	[INV_ICM42607_ODR_400HZ] =3D { 400, 0 },
> +	[INV_ICM42607_ODR_800HZ] =3D { 800, 0 },
> +	[INV_ICM42607_ODR_1600HZ] =3D { 1600, 0 }
> +};

Does this array leave indices 0 through 4 zero-initialized?

Since inv_icm42607_accel_read_avail() exposes ARRAY_SIZE elements, this
regression could allow user-space to configure the hardware with a
zeroed/reserved ODR state.

[ ... ]
> +static int inv_icm42607_accel_write_odr(struct iio_dev *indio_dev,
> +					int val, int val2)
> +{
[ ... ]
> +	ret =3D inv_sensors_timestamp_update_odr(ts, inv_icm42607_odr_to_period=
(conf.odr),
> +					       iio_buffer_enabled(indio_dev));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D inv_icm42607_set_accel_conf(st, &conf, NULL);
> +	if (ret)
> +		return ret;

If inv_icm42607_set_accel_conf() fails here, the software timestamping state
has already been updated to the new ODR.

Will this regression break software timestamp tracking for all future sampl=
es
because the hardware continues running at the old ODR?

[ ... ]
> +struct iio_dev *inv_icm42607_accel_init(struct inv_icm42607_state *st)
> +{
[ ... ]
> +	ret =3D devm_iio_device_register(dev, indio_dev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	/* accel events are wakeup capable */
> +	ret =3D devm_device_init_wakeup(&indio_dev->dev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return indio_dev;
> +}

Could registering the IIO device before initializing its wakeup capabilities
cause a race condition?

Once devm_iio_device_register() succeeds, the device is visible to user-spa=
ce,
so udev rules might attempt to access the power/wakeup sysfs attributes bef=
ore
they are configured.

[ ... ]
> +int inv_icm42607_accel_parse_fifo(struct iio_dev *indio_dev)
> +{
[ ... ]
> +	/* parse all fifo packets */
> +	for (i =3D 0, no =3D 0; i < st->fifo.count; i +=3D size, ++no) {
> +		size =3D inv_icm42607_fifo_decode_packet(&st->fifo.data[i],
> +				&accel, &gyro, &temp, &timestamp, &odr);
> +		/* quit if error or FIFO is empty */
> +		if (size <=3D 0)
> +			return size;

Is it possible for this to read past the end of st->fifo.data if a packet
header is near the end of the buffer?

If the remaining bytes are fewer than size, there is no boundary check agai=
nst
st->fifo.count before the data is parsed and copied. Could this leak adjace=
nt
kernel memory?

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c b/drivers=
/iio/imu/inv_icm42607/inv_icm42607_buffer.c
> index d8784ccf26728..eb629b86446b0 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c
[ ... ]
> +int inv_icm42607_buffer_fifo_read(struct inv_icm42607_state *st,
> +				  unsigned int max)
> +{
> +	const void *accel, *gyro, *timestamp;
> +	size_t i, max_count, size;
[ ... ]
> +	/* compute maximum FIFO read size */
> +	if (max =3D=3D 0)
> +		max_count =3D sizeof(st->fifo.data);
> +	else
> +		max_count =3D clamp(max_count,
> +				  (max * inv_icm42607_get_packet_size(st->fifo.en)),
> +				  sizeof(st->fifo.data));

Does this use an uninitialized value for max_count?

The clamp() macro evaluates its first parameter, which hasn't been initiali=
zed
here.

[ ... ]
> +	/* check and clamp FIFO count value */
> +	if (st->fifo.count =3D=3D 0)
> +		return 0;
> +
> +	st->fifo.count =3D max(st->fifo.count, max_count);
> +
> +	/* read all FIFO data in internal buffer */
> +	ret =3D regmap_noinc_read(st->map, INV_ICM42607_REG_FIFO_DATA,
> +				st->fifo.data, st->fifo.count);

Should this use min() instead of max()?

If the hardware returns an erroneously large count, using max() could cause
st->fifo.count to exceed the size of st->fifo.data, leading to a buffer
overflow during regmap_noinc_read().

[ ... ]
> +int inv_icm42607_buffer_fifo_parse(struct inv_icm42607_state *st)
> +{
[ ... ]
> +	/* handle accelerometer timestamp and FIFO data parsing */
> +	if (st->fifo.nb.accel > 0) {
> +		ts =3D &accel_st->ts;
> +		inv_sensors_timestamp_interrupt(ts, st->fifo.watermark.eff_accel,
> +						st->timestamp.accel);

Can st->timestamp.accel be overwritten by a new hardirq while it is being r=
ead
here?

Since st->timestamp.accel is a 64-bit value updated in the hardirq handler
without locks, reading it in the threaded irq handler could cause a torn re=
ad
on 32-bit architectures, or associate the parsed FIFO data with the timesta=
mp
of a newer interrupt.

[ ... ]
> +int inv_icm42607_buffer_hwfifo_flush(struct inv_icm42607_state *st,
> +				     unsigned int count)
> +{
> +	struct inv_icm42607_sensor_state *accel_st =3D iio_priv(st->indio_accel=
);
> +	struct inv_sensors_timestamp *ts;
> +	s64 gyro_ts, accel_ts;
> +	int ret;
> +
> +	gyro_ts =3D iio_get_time_ns(st->indio_gyro);

Will this crash if st->indio_gyro is NULL?

Since gyroscope support is not yet implemented in this patch, st->indio_gyro
remains uninitialized. Calling iio_get_time_ns() evaluates to_iio_dev_opaqu=
e(),
which could compute a negative offset from the NULL pointer and cause a ker=
nel
oops.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509191907.2473=
4-1-macroalpha82@gmail.com?part=3D8
