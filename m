Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DD73AC00
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 20:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778356933; cv=none; b=BEjRtGPOriGLrAo/7tiDOKS5USK/9YBYGDMepn0qs9cvRcaTU2UkdcjSObjkP6Y7kYgnRASu1fEjUsB0m+JWC+V3pvkVe9DnRYekkgEqhIA8pxKbdO0WbQqJdKfcLbXDoxGzNhvU37IbCCHMFc/5Cqdo9xgL3aQDBaoxCagY7do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778356933; c=relaxed/simple;
	bh=inKSmOk/mM9JyEAAJbDCsIgpq4NUGXfvtkfMMvtRGlM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qFsaZoJRpgwBrKCK/IwJd3lmwc8kryTasR0DXK607/GPdnRpRc8XGYgpI+jfxbplIqD92YITMWQW4zVifqSOcrvOgx+Ovoeoe7lnStzJyYdX5e5iLiXv51aVROVeSmOATIFE+npHKlOjpQvNPNaJgQ2/KIFmyWkOlYjLuCtcf0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J992RX71; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J992RX71"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210FFC2BCB2;
	Sat,  9 May 2026 20:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778356933;
	bh=inKSmOk/mM9JyEAAJbDCsIgpq4NUGXfvtkfMMvtRGlM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=J992RX71tSLF24iq1tzva5TAoUgg1Os0D5iH/Lze8SC1W9fhofT+xpr3BCfELdwGQ
	 erwHQU/0D11slmbvGN0X4epZy9/wEs+mToSY/vlY69FqM9dwg5+RIQUOIr4O/JmhdJ
	 +jiS5a7FJNu4MVkm91xXJBJATqo1CE0+03w0Wc4ruvFHDsWCUuj9VJBTpHHPBgpYiF
	 7OukzmK/JVeRb1/xGkuGVcH95nSZWtUhwVLy/r4IoRWAfQ5sQdo154lNAOC+TWDvDY
	 Q+X+mO7bXRXyDqmx/gDuOD5pOc8jHmR/Xi7E+7RWJeUCb2pLWRdjDMRnu2iaZlnUGI
	 aTq78WKBszEWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 10/11] iio: imu: inv_icm42607: Add Gyroscope to
 icm42607
Reply-To: sashiko@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260509191907.24734-11-macroalpha82@gmail.com>
References: <20260509191907.24734-11-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 20:02:12 +0000
Message-Id: <20260509200213.210FFC2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [Critical] Missing PM runtime wake in `inv_icm42607_gyro_hwfifo_flush` tr=
iggers a heap buffer overflow.
- [High] Missing hardware wait, ignored error code, and power state leak in=
 `inv_icm42607_gyro_read_sensor`.
- [High] Software state desynchronization causes unintended hardware shutdo=
wn.
- [High] Out-of-bounds kernel memory read in `inv_icm42607_gyro_parse_fifo`.
- [High] Standalone temperature scanning is completely broken due to parser=
 logic.
- [Medium] Type mismatch and invalid boundary units in `inv_icm42607_gyro_h=
wfifo_flush`.
- [Medium] Uninitialized padding in `inv_icm42607_gyro_odr` array bypasses =
validation and writes reserved hardware state.
- [Medium] Gyroscope timestamp initialized using the accelerometer's ODR.
- [Medium] Premature IIO device registration causes race condition during p=
robe.
--

commit c1f5aefdb4a5a29bea5b6cae45743d275de06e35
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Gyroscope to icm42607

Add gyroscope functions to the icm42607 driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
[ ... ]
> @@ -215,6 +215,49 @@ int inv_icm42607_set_accel_conf(struct inv_icm42607_=
state *st,
>  					  st->conf.temp_en, sleep_ms);
>  }
> =20
> +int inv_icm42607_set_gyro_conf(struct inv_icm42607_state *st,
> +			       struct inv_icm42607_sensor_conf *conf,
> +			       unsigned int *sleep_ms)
> +{
> +	struct inv_icm42607_sensor_conf *oldconf =3D &st->conf.gyro;
> +	unsigned int val;
> +	int ret;
> +
> +	if (conf->mode < 0)
> +		conf->mode =3D oldconf->mode;
[ ... ]
> +	if (conf->filter !=3D oldconf->filter) {
> +		val =3D FIELD_PREP(INV_ICM42607_GYRO_CONFIG1_FILTER_MASK,
> +				 conf->filter);
> +		ret =3D regmap_update_bits(st->map, INV_ICM42607_REG_GYRO_CONFIG1,
> +					 INV_ICM42607_GYRO_CONFIG1_FILTER_MASK, val);
> +		if (ret)
> +			return ret;
> +		oldconf->filter =3D conf->filter;
> +	}
> +
> +	return inv_icm42607_set_pwr_mgmt0(st, conf->mode, st->conf.accel.mode,
> +					  st->conf.temp_en, sleep_ms);
> +}

Does this code need to assign conf->mode to oldconf->mode? By not updating =
the
cached state, is it possible that subsequent operations will save an incorr=
ect
power state during suspend, causing an unintended hardware shutdown on resu=
me?

[ ... ]
> @@ -575,6 +619,11 @@ int inv_icm42607_core_probe(struct regmap *regmap, c=
onst struct inv_icm42607_hw
>  	pm_runtime_set_autosuspend_delay(dev, INV_ICM42607_SUSPEND_DELAY_MS);
>  	pm_runtime_use_autosuspend(dev);
> =20
> +	/* Initialize IIO device for Gyro */
> +	st->indio_gyro =3D inv_icm42607_gyro_init(st);
> +	if (IS_ERR(st->indio_gyro))
> +		return PTR_ERR(st->indio_gyro);
> +
>  	/* Initialize IIO device for Accel */
>  	st->indio_accel =3D inv_icm42607_accel_init(st);

Since inv_icm42607_irq_init() is called later in inv_icm42607_core_probe(),
could this expose the IIO device to userspace before the interrupt handler =
is
ready, allowing a race condition if the buffer is enabled immediately?

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_gyro.c
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
> +		ret =3D -EINVAL;
> +
> +	return 0;
> +}

Are there a few potential issues in this function?

First, by passing NULL for sleep_ms to inv_icm42607_set_gyro_conf(), does
this bypass the required sleep for the hardware to settle, resulting in a r=
ead
of stale registers?

Second, when the data is invalid and ret is set to -EINVAL, the function
unconditionally returns 0. Will this expose the invalid value to userspace
instead of returning the error?

Finally, does the function need to restore the sensor power mode to an off
state before returning? As written, does it leave the gyroscope permanently
powered on after a single sysfs read?

[ ... ]
> +static const int inv_icm42607_gyro_odr[][2] =3D {
> +	[INV_ICM42607_ODR_12_5HZ] =3D { 12, 500000 },
> +	[INV_ICM42607_ODR_25HZ] =3D { 25, 0 },
[ ... ]
> +static int inv_icm42607_gyro_write_odr(struct iio_dev *indio_dev,
> +				       int val, int val2)
> +{
[ ... ]
> +	for (idx =3D 0; idx < ARRAY_SIZE(inv_icm42607_gyro_odr); ++idx) {
> +		if (val =3D=3D inv_icm42607_gyro_odr[idx][0] &&
> +		    val2 =3D=3D inv_icm42607_gyro_odr[idx][1])
> +			break;
> +	}
> +	if (idx >=3D ARRAY_SIZE(inv_icm42607_gyro_odr))
> +		return -EINVAL;
> +
> +	conf.odr =3D idx;

Since the inv_icm42607_gyro_odr array uses designated initializers starting=
 at
index 5 (INV_ICM42607_ODR_1600HZ), are indices 0-4 implicitly initialized to
{0, 0}? If userspace writes a frequency of 0, will this bypass validation
and write a reserved value of 0 into the hardware register?

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

Should this function call PM_RUNTIME_ACQUIRE_AUTOSUSPEND() before accessing
device registers via inv_icm42607_buffer_hwfifo_flush()? If called while
suspended, could it read 0xFFFF from the hardware, which might lead to a
buffer overflow downstream when max() is used with this value?

Additionally, does the min() check mix unsigned int and size_t, which might
cause a compiler warning? Also, since count is a number of samples, does
checking it against the byte capacity of the buffer (sizeof) permit request=
ing
far more samples than the buffer can hold?

[ ... ]
> +struct iio_dev *inv_icm42607_gyro_init(struct inv_icm42607_state *st)
> +{
[ ... ]
> +	/*
> +	 * clock period is 32kHz (31250ns)
> +	 * jitter is +/- 2% (20 per mille)
> +	 */
> +	ts_chip.clock_period =3D 31250;
> +	ts_chip.jitter =3D 20;
> +	ts_chip.init_period =3D inv_icm42607_odr_to_period(st->conf.accel.odr);
> +	inv_sensors_timestamp_init(&gyro_st->ts, &ts_chip);

Should this use st->conf.gyro.odr instead of st->conf.accel.odr? If the
default output data rates differ, could this cause the software IIO timesta=
mps
for the gyroscope to start out skewed?

[ ... ]
> +int inv_icm42607_gyro_parse_fifo(struct iio_dev *indio_dev)
> +{
[ ... ]
> +	/* parse all fifo packets */
> +	for (i =3D 0, no =3D 0; i < st->fifo.count; i +=3D size, ++no) {
> +		size =3D inv_icm42607_fifo_decode_packet(&st->fifo.data[i],
> +				&accel, &gyro, &temp, &timestamp, &odr);
> +		/* quit if error or FIFO is empty */
> +		if (size <=3D 0)
> +			return size;
> +
> +		/* skip packet if no gyro data or data is invalid */
> +		if (gyro =3D=3D NULL || !inv_icm42607_fifo_is_data_valid(gyro))
> +			continue;
> +
> +		/* update odr */
> +		if (odr & INV_ICM42607_SENSOR_GYRO)
> +			inv_sensors_timestamp_apply_odr(ts, st->fifo.period,
> +							st->fifo.nb.total, no);
> +
> +		memcpy(&buffer.gyro, gyro, sizeof(buffer.gyro));

Does the loop need a bounds check to ensure i + size <=3D st->fifo.count?
Without it, if a partial packet is present, could this copy out-of-bounds
kernel memory into the IIO buffer?

Also, if only the temperature channel is enabled, will gyro always be NULL?
Since this loop continues when gyro is NULL, will temperature packets be
silently discarded, leaving userspace readers without data?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509191907.2473=
4-1-macroalpha82@gmail.com?part=3D10
