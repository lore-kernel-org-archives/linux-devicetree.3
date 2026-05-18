Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581D14A3E
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 21:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779138319; cv=none; b=AU3N/JjsrQIvBrTWfrDIAug3Cumn8k7oeDxwc2VYNPrrJZBYQCfuyhXZIQONDS4BjEK5HehjWwAsrIUiDMHLgrfeMuQxSLIwscgPMeAnCFtBm1sV38QAL0OU+9ceFWoH3DW/7qoD8MMZhSAzBU8P7AD6Qs2jX2GArIBnhTXvuFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779138319; c=relaxed/simple;
	bh=R1lPwXy1skJB8lNdTicTI4EOElz6M6/M2wQjyqQZ67s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K2CXlPbGJheKEaQYxUyVxEWtmk7slFN4vofeIq3PI/gby6PEVuEzWVuzYjeN/ZdFjibUeKF9KgFt51SuWe6E/QdoNtH+TE9hEEJXgkaXwq+o9jrlaDW7CoBZWf8J+VO2jXYxF134Ra4DaexzexGd9MuHDzLMyKhwhIOuZbpguF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgSvvMct; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgSvvMct"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C343FC2BCC6;
	Mon, 18 May 2026 21:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779138319;
	bh=R1lPwXy1skJB8lNdTicTI4EOElz6M6/M2wQjyqQZ67s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=OgSvvMctzwoWqSI0kEnR/A25wVY7tS0FTQrjvbvS9hhQ8BGx6xDmEKyeaxZX578Bs
	 23FUNp4Dcqtg2x/phLxUvGKK/sia7TpknR/qMJGQmEo9cmR0F2Cbi4mehZzt4AK/yF
	 UuwGTf1ef4qW9c04xAJC2ub3OIcCTbPh5OMCKLWfQvELg1tpT6k28OS8HO8T3NFzBw
	 XsaEnxgBjOce/t/p5oj8+eT3muiGsjOAW5W7hIGcfPaSd6byMBklKPb71UYRaSG6iU
	 EW4IvwoJgh5LryCkBlEqaXOqw/xugCBA9MW73Ihx4JimbIXEWvOutaKsqBs1tbzwl3
	 B7GaCy68EIxoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V8 09/10] iio: imu: inv_icm42607: Add Gyroscope to
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260518200526.458421-10-macroalpha82@gmail.com>
References: <20260518200526.458421-10-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 21:05:18 +0000
Message-Id: <20260518210518.C343FC2BCC6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Probe race condition leads to NULL pointer dereference on `st->ind=
io_gyro`.
- [High] Data race and TOCTOU vulnerability in `hwfifo_flush` causes data d=
uplication and timestamp corruption.
- [High] Incorrect devres registration order causes Use-After-Free during t=
eardown.
- [Medium] The available sampling frequencies sysfs attribute exposes unini=
tialized memory (zeros).
- [Medium] Software timestamp state becomes permanently inconsistent if har=
dware configuration fails.
- [Medium] Gyroscope is left powered on indefinitely after a single raw rea=
d.
--

commit db77d2b5f802169a721fb840e81fd3f9add01065
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Gyroscope to icm42607

Add gyroscope functions to the icm42607 driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c b/drivers=
/iio/imu/inv_icm42607/inv_icm42607_buffer.c
> index 0e723a7dd5623..355cd38601b9c 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c
[ ... ]
> @@ -506,12 +519,14 @@ int inv_icm42607_buffer_fifo_parse(struct inv_icm42=
607_state *st)
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
> =20
>  	ret =3D inv_icm42607_buffer_fifo_read(st, count);
>  	if (ret)
> @@ -520,6 +535,14 @@ int inv_icm42607_buffer_hwfifo_flush(struct inv_icm4=
2607_state *st,
>  	if (st->fifo.nb.total =3D=3D 0)
>  		return 0;
> =20
> +	if (st->fifo.nb.gyro > 0) {
> +		ts =3D &gyro_st->ts;
> +		inv_sensors_timestamp_interrupt(ts, st->fifo.nb.gyro, gyro_ts);
> +		ret =3D inv_icm42607_gyro_parse_fifo(st->indio_gyro);
> +		if (ret)
> +			return ret;
> +	}

Since inv_icm42607_buffer_fifo_read() drops st->lock before returning, could
this result in a data race?

Concurrent calls from sysfs could overwrite the shared st->fifo.data and
state between the lock release and the subsequent lock acquisition inside
inv_icm42607_gyro_parse_fifo(), potentially causing duplicated data and
corrupted timestamp state.

[ ... ]
> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 4bbcbbe8905f4..a6b668e82c1a7 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
[ ... ]
> @@ -440,6 +483,11 @@ int inv_icm42607_core_probe(struct regmap *regmap, c=
onst struct inv_icm42607_hw
>  	if (IS_ERR(st->indio_accel))
>  		return PTR_ERR(st->indio_accel);
> =20
> +	/* Initialize IIO device for Gyro */
> +	st->indio_gyro =3D inv_icm42607_gyro_init(st);
> +	if (IS_ERR(st->indio_gyro))
> +		return PTR_ERR(st->indio_gyro);

If a user or udev interacts with the accelerometer sysfs interface (like
triggering hwfifo_flush) immediately after it is registered but before
st->indio_gyro is initialized, will this cause a NULL pointer dereference
when inv_icm42607_buffer_hwfifo_flush() unconditionally accesses
st->indio_gyro?

Additionally, does allocating the IIO devices after inv_icm42607_buffer_ini=
t()
introduce a use-after-free risk during teardown?

Since devres uses LIFO ordering, the IIO devices will be freed before the
hardware interrupt handler is removed. If an interrupt fires during removal,
the handler might access the freed st->indio_gyro and st->indio_accel.

[ ... ]
> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_gyro.c
> new file mode 100644
> index 0000000000000..16c505ce70ae8
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c
[ ... ]
> +static int inv_icm42607_gyro_read_sensor(struct iio_dev *indio_dev,
> +					 struct iio_chan_spec const *chan,
> +					 s16 *val)
> +{
[ ... ]
> +	/* enable gyro sensor */
> +	conf.mode =3D gyro_st->power_mode;
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

Does this leave the gyroscope powered on indefinitely after a raw read?

It doesn't appear to be turned off again before returning, meaning the driv=
er
will maintain the ON state even after resuming from runtime PM.

[ ... ]
> +static const int inv_icm42607_gyro_odr[][2] =3D {
> +	[INV_ICM42607_ODR_12_5HZ] =3D { 12, 500000 },
> +	[INV_ICM42607_ODR_25HZ] =3D { 25, 0 },
> +	[INV_ICM42607_ODR_50HZ] =3D { 50, 0 },
> +	[INV_ICM42607_ODR_100HZ] =3D { 100, 0 },
> +	[INV_ICM42607_ODR_200HZ] =3D { 200, 0 },
> +	[INV_ICM42607_ODR_400HZ] =3D { 400, 0 },
> +	[INV_ICM42607_ODR_800HZ] =3D { 800, 0 },
> +	[INV_ICM42607_ODR_1600HZ] =3D { 1600, 0 },
> +};

Could this initialization expose zeros to userspace?

Since the first index (INV_ICM42607_ODR_12_5HZ) evaluates to a non-zero val=
ue,
the leading elements in this array will be implicitly zero-initialized. When
returned via inv_icm42607_gyro_read_avail(), those zeros might break the IIO
sysfs API contract.

[ ... ]
> +static int inv_icm42607_gyro_write_odr(struct iio_dev *indio_dev,
> +				       int val, int val2)
> +{
[ ... ]
> +	ret =3D inv_sensors_timestamp_update_odr(ts, inv_icm42607_odr_to_period=
(conf.odr),
> +					       iio_buffer_enabled(indio_dev));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D inv_icm42607_set_gyro_conf(st, &conf, NULL);
> +	if (ret)
> +		return ret;

If inv_icm42607_set_gyro_conf() fails here, does the software timestamp sta=
te
become permanently inconsistent?

It seems ts is updated before the I2C/SPI write, and there is no rollback
of the timestamp configuration on failure.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518200526.4584=
21-1-macroalpha82@gmail.com?part=3D9
