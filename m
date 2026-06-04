Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382652EEE71
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 22:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780610540; cv=none; b=nCKKQJ+HirsV97cvPJIDHn73HY+HbDYVKioNM+dg5t4Rk0Jdctv+jfS6ZdL3oRSbfkNd0zBssIddt31FC6KKGSJrmRjfSRG+sVQt3XxNFS43bl0Ps9R7jYI9ufFkvD3/juZ+UuS4zcbUF8edrG2jjAOZENisckxO7whV10rIZ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780610540; c=relaxed/simple;
	bh=y1fxe+0Bl4Rj5ezFaiu8G7Un6aMAMjHarOdnXK5SAb4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sMax3BJ95heYNJUSap5pi7aQi63OLWnKlbNUbaVVp0jXLSzqHZiBQcDl0tRQwp7vBMhKqjNu6KEZ/V+DP9wQUKyT9E1SN3Gi/NHRkPdaaH6HsvZOHfHPM0pLLArxCvLfUgAzputhKzD8PI1qZjOe53Dk56+2PJzxDkOlW+k9jp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEjo5t13; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEjo5t13"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 956A01F00898;
	Thu,  4 Jun 2026 22:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780610537;
	bh=Rbj/cB3WaO3y7xihcyiDcCHKVx1y6kB5WnzFx9LigDk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VEjo5t13CYMT/6a/KBlVoFB3vXVHL5T1niyBG8SQrGcI5lDhVsLdoCWvh72jY2uHF
	 NZRjJBq0Ssy3rEQCBmKbySy1N71ejQRZG588K5yIZUhiTSZJAJVUvDqhTlb5dPLLZu
	 N8YSkpM++VjYIo7klXKVaY92/RPvCkx93I2/H/FPMcQDDP3QRZZ3Y6j/r5droC+xMB
	 HrqcwVIWGzAVRq66e+fOXCqYc4faFoEukF7hqOpwtIDLVcNgo/kCXuETOTsBV1fLnD
	 Ct8qihrinfDSp4C2qmHBacl02hk4M7lEXuK67VQ/y1YGneBIzaArzOJyan98HvGTsF
	 kDDMfOKnTduEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V10 8/9] iio: imu: inv_icm42607: Add Gyroscope to
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260604201832.60656-9-macroalpha82@gmail.com>
References: <20260604201832.60656-9-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 22:02:16 +0000
Message-Id: <20260604220217.956A01F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Gyroscope is permanently left powered on in the driver's cached st=
ate after a single raw read, causing a cross-sensor power leak.
- [Medium] Concurrent lockless access to shared configuration fields in sys=
fs handlers.
- [Low] Buffer-specific structures, channels, and callbacks are defined but=
 completely unreachable (dead code) because the device does not instantiate=
 an IIO buffer.
- [Low] Variable `ret` may trigger a `-Wmaybe-uninitialized` compiler warni=
ng in `inv_icm42607_gyro_update_scan_mode()`.
--

commit f6b9c2f7324591ed8e8a04df80fed00466b4a298
Author: Chris Morgan <macromorgan@hotmail.com>
Date:   Thu Jun 4 20:18:30 2026 +0000

    iio: imu: inv_icm42607: Add Gyroscope to icm42607
   =20
    Add gyroscope functions to the icm42607 driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_gyro.c
> new file mode 100644
> index 0000000000000..0f2703342122b
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c
[ ... ]
> +/* enable gyroscope sensor */
> +static int inv_icm42607_gyro_update_scan_mode(struct iio_dev *indio_dev,
> +					      const unsigned long *scan_mask)
> +{
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);
> +	struct inv_icm42607_sensor_conf conf =3D INV_ICM42607_SENSOR_CONF_INIT;
> +	unsigned int sleep_gyro =3D 0;
> +	unsigned int sleep_temp =3D 0;
> +	int ret;
> +
> +	mutex_lock(&st->lock);
> +
> +	if (*scan_mask & INV_ICM42607_SCAN_MASK_TEMP) {
> +		/* enable temp sensor */
> +		ret =3D inv_icm42607_set_temp_conf(st, true, &sleep_temp);
> +		if (ret)
> +			goto out_unlock;
> +	}
> +
> +	if (*scan_mask & INV_ICM42607_SCAN_MASK_GYRO_3AXIS) {
> +		/* enable gyro sensor */
> +		conf.mode =3D INV_ICM42607_SENSOR_MODE_LOW_NOISE;
> +		ret =3D inv_icm42607_set_gyro_conf(st, &conf, &sleep_gyro);
> +		if (ret)
> +			goto out_unlock;
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&st->lock);
> +	/* sleep maximum required time */
> +	msleep(max(sleep_gyro, sleep_temp));
> +	return ret;

[Severity: Low]
Can ret be returned uninitialized here?

If *scan_mask contains neither INV_ICM42607_SCAN_MASK_TEMP nor
INV_ICM42607_SCAN_MASK_GYRO_3AXIS, the code jumps directly to out_unlock
and returns the uninitialized stack value.

Although the IIO subsystem guarantees the mask strictly matches one of the
available_scan_masks (which all contain the 3-axis gyro mask), compilers
and static analyzers evaluate the function locally. This triggers a
-Wmaybe-uninitialized warning that will break builds configured with W=3D1
or -Werror.

> +}
> +
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
> +
> +	if (chan->type !=3D IIO_ANGL_VEL)
> +		return -EINVAL;
> +
> +	switch (chan->channel2) {
> +	case IIO_MOD_X:
> +		reg =3D INV_ICM42607_REG_GYRO_DATA_X1;
> +		break;
> +	case IIO_MOD_Y:
> +		reg =3D INV_ICM42607_REG_GYRO_DATA_Y1;
> +		break;
> +	case IIO_MOD_Z:
> +		reg =3D INV_ICM42607_REG_GYRO_DATA_Z1;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
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

[Severity: High]
Does this leave the gyroscope permanently powered on in the driver's cached
state?

When the raw read finishes, inv_icm42607_set_gyro_conf() isn't called again
to revert the state to OFF.

When PM auto-suspend triggers after the delay, it appears
inv_icm42607_runtime_suspend() will erroneously save this active state
into st->suspended.gyro before powering off the device.

Later, if a read is performed on another sensor like the accelerometer,
inv_icm42607_runtime_resume() restores st->suspended.gyro to the
hardware. Consequently, the gyroscope is incorrectly powered back on and
will remain powered on during all future PM active periods, draining power
unnecessarily.

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
[ ... ]
> +static int inv_icm42607_gyro_read_scale(struct iio_dev *indio_dev,
> +					int *val, int *val2)
> +{
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);
> +	unsigned int idx;
> +
> +	idx =3D st->conf.gyro.fs;

[Severity: Medium]
Is it safe to read st->conf.gyro.fs without holding st->lock here?

Concurrent sysfs writes via inv_icm42607_gyro_write_scale() lock st->lock
and modify this exact field. Reading it locklessly creates a data race
that is undefined behavior in C and could be flagged by KCSAN.

> +
> +	*val =3D inv_icm42607_gyro_scale_nano[idx][0];
> +	*val2 =3D inv_icm42607_gyro_scale_nano[idx][1];
> +	return IIO_VAL_INT_PLUS_NANO;
> +}
[ ... ]
> +static int inv_icm42607_gyro_read_odr(struct inv_icm42607_state *st,
> +				      int *val, int *val2)
> +{
> +	unsigned int odr;
> +	unsigned int i;
> +
> +	odr =3D st->conf.gyro.odr;

[Severity: Medium]
Similarly, is it safe to read st->conf.gyro.odr here without holding
st->lock?

> +
> +	for (i =3D 5; i < ARRAY_SIZE(inv_icm42607_gyro_odr); ++i) {
> +		if (i =3D=3D odr)
> +			break;
> +	}
[ ... ]
> +struct iio_dev *inv_icm42607_gyro_init(struct inv_icm42607_state *st)
> +{
> +	struct device *dev =3D regmap_get_device(st->map);
> +	const char *name;
> +	struct inv_icm42607_sensor_state *gyro_st;
> +	struct inv_sensors_timestamp_chip ts_chip;
> +	struct iio_dev *indio_dev;
> +	int ret;
> +
> +	name =3D devm_kasprintf(dev, GFP_KERNEL, "%s-gyro", st->hw->name);
> +	if (!name)
> +		return ERR_PTR(-ENOMEM);
> +
> +	indio_dev =3D devm_iio_device_alloc(dev, sizeof(*gyro_st));
> +	if (!indio_dev)
> +		return ERR_PTR(-ENOMEM);
> +	gyro_st =3D iio_priv(indio_dev);
> +
> +	gyro_st->power_mode =3D INV_ICM42607_SENSOR_MODE_LOW_NOISE;
> +
> +	/*
> +	 * clock period is 32kHz (31250ns)
> +	 * jitter is +/- 2% (20 per mille)
> +	 */
> +	ts_chip.clock_period =3D 31250;
> +	ts_chip.jitter =3D 20;
> +	ts_chip.init_period =3D inv_icm42607_odr_to_period(st->conf.gyro.odr);
> +	inv_sensors_timestamp_init(&gyro_st->ts, &ts_chip);
> +
> +	iio_device_set_drvdata(indio_dev, st);
> +	indio_dev->name =3D name;
> +	indio_dev->info =3D &inv_icm42607_gyro_info;
> +	indio_dev->modes =3D INDIO_DIRECT_MODE;
> +	indio_dev->channels =3D inv_icm42607_gyro_channels;
> +	indio_dev->num_channels =3D ARRAY_SIZE(inv_icm42607_gyro_channels);
> +	indio_dev->available_scan_masks =3D inv_icm42607_gyro_scan_masks;

[Severity: Low]
Since the device is initialized exclusively in INDIO_DIRECT_MODE and lacks
any calls to allocate or attach a triggered buffer (e.g., via
devm_iio_triggered_buffer_setup), are the scan masks and buffer callbacks
dead code?

Without a buffer setup, inv_icm42607_gyro_scan_masks, the
INV_ICM42607_GYRO_SCAN_TIMESTAMP channel, the software tracking logic,
and the update_scan_mode callback will never be executed.

> +
> +	ret =3D devm_iio_device_register(dev, indio_dev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return indio_dev;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604201832.6065=
6-1-macroalpha82@gmail.com?part=3D8
