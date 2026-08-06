Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065DB3B7A8
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 13:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786021325; cv=none; b=cqr3hPHm2UjPsDYHFQ8wGvi16/+V9QpOmlOKdfTsjAjeGGANiFtv5y6ekMa+sj9LyT5+A4oHWdk6p+wxlN3Rrwd1y2P+7FLziRmZiJntRa7H1QJ4JO3F8JOv7OPMXZNE9oR6dVVjof86O1BknLP5eJ6jc3lNKRBvHlY452YX+Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786021325; c=relaxed/simple;
	bh=d5r7sX/et9f5RB2t/bhkPIhdzSwfExDQD3rK2K5JzUA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eQZ9iMFIjFD2o9kdLn0ZyjXXbif8k70NjuQwnpcPmior7I5s/QI7tipkUXZRwU5USLKnjxb8k6jG5D3Ek3rY5FZI/csNReHLr0d0V0HDifSgcJmn9D5+OfSMNKhfOnU+9kFXbYpwBBursJie9x+ZKvtM/LdbnLViEPvvgT3oAR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEOffJbu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEOffJbu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581BF1F000E9;
	Thu,  6 Aug 2026 13:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786021323;
	bh=X4FpHItqdoEH3QJT3WJ1sGIjY1wLjmoiMpqCz6f+L/U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CEOffJbuFt57jI+HiPgbCkzqKvF+MqV78rsH3HZMZn/27g+qOy5DrAbVxSdYZdn0I
	 rNkp4RcYtuwpSuA/jb9NNHJwTsIYX85QFJbomeFRLfqnN0yjoKov0jXgk7ZzQ6gOHL
	 aeGoTJRX5zUM52939wPpnk4BJCLp24X9qW0wkuXETedCRZAoIG8JnxK9MVUDhQraxR
	 jgjWwSysNq+ocvHcaUmQRPcu8m/VL7zPULwq4seOOZA7cjAEB1p/hFFOCPfJLoCpDk
	 fR0enMsLabmBnx9yRDf3nvtckbI9fiZzB9/M/kahWtkYREitobU7kKv/I4Wk2Be9YL
	 kCCOKvWBnyUTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] iio: accel: Add support for ICM42370P
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kanak Shilledar" <kanak.shilledar@axis.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806-b4-inv_icm42370p-v1-2-670837f5842f@axis.com>
References: <20260806-b4-inv_icm42370p-v1-0-670837f5842f@axis.com>
 <20260806-b4-inv_icm42370p-v1-2-670837f5842f@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 13:02:02 +0000
Message-Id: <20260806130203.581BF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] The accelerometer offset calibration read and write logic is funda=
mentally broken, containing missing reads, swapped registers, uninitialized=
 memory aliasing, and ignored error codes.
- [High] Unbalanced `pm_runtime_put_sync()` in the device cleanup action ca=
uses a PM runtime usage counter underflow.
- [High] The driver systematically ignores the return value of `pm_runtime_=
get_sync()` before accessing hardware registers.
- [High] The interrupt handler accesses hardware registers without ensuring=
 the device is in an active PM state.
- [High] The `vdd_supply` regulator is enabled but never disabled, and the =
`vddio_supply` is acquired but never enabled, leading to resource leaks and=
 potential unpowered hardware.
- [High] Incorrect scale calculation in `inv_icm42370_accel_scale` results =
in returned IIO values being twice as large as their true physical scale.
- [High] Race condition and teardown order inversion caused by calling `dev=
m_iio_device_register` before IRQ and PM initialization.
- [High] The DMA buffer shares a CPU cacheline with other frequently modifi=
ed fields, risking memory corruption.
- [Medium] Incorrect fixed-point math for negative IIO values breaks calibr=
ation bias limit checks and user input parsing.
- [Low] The I2C device ID array is initialized without C99 named initialize=
rs, violating subsystem guidelines.
- [Low] Compilation failure: `struct inv_icm42370_fifo` is an incomplete ty=
pe.
--

--- Patch [2]: [PATCH 2/3] iio: accel: Add support for ICM42370P ---
commit 428e7955fe02229e2d71685724240ab27a044dd8
Author: Kanak Shilledar <kanak.shilledar@axis.com>
Date:   Thu Aug 6 12:46:28 2026 +0000

    iio: accel: Add support for ICM42370P
   =20
    Add support for the Invensense ICM42370P MEMS MotionTracking 3-axis
    accelerometer with a built-in temperature sensor. Compared to other
    sensors from the same vendor ICM42370 uses a different way of handling
    register banks. Although the device supports I2C, SPI, and I3C,
    implement only I2C support.  Provide basic support for raw sensor
    reads and a sysfs interface for setting the calibration bias. Keep the
    embedded temperature sensor enabled because the device design does not
    allow it to be turned off.

> diff --git a/drivers/iio/accel/inv_icm42370.h b/drivers/iio/accel/inv_icm=
42370.h
> index 0000000000000..9866a5e970dcd
> --- /dev/null
> +++ b/drivers/iio/accel/inv_icm42370.h
[ ... ]
> @@ -0,0 +1,365 @@
> +struct inv_icm42370_data {
> +	struct mutex lock;
> +	const char *name;
> +	struct regmap *map;
> +	struct regulator *vdd_supply;
> +	struct regulator *vddio_supply;
> +	struct iio_dev *indio_accel;
> +	struct inv_icm42370_sensor_state *sensor_state;
> +	u8 buffer[2] __aligned(IIO_DMA_MINALIGN);

[Severity: High]
Does aligning the start of the buffer guarantee the end is padded? If the
buffer shares a cacheline with frequently modified fields like timestamp,
could a DMA cache invalidation corrupt concurrent CPU writes to those
adjacent fields?

> +	s16 accel_calibbias[3];
> +	struct inv_icm42370_fifo fifo;

[Severity: Low]
Is struct inv_icm42370_fifo defined anywhere? It seems to be an incomplete
type which might cause compilation failures.

> +	s64 timestamp;
> +	enum inv_icm42370_chip chip;
> +	struct inv_icm42370_conf conf;
> +};
[ ... ]
> diff --git a/drivers/iio/accel/inv_icm42370_core.c b/drivers/iio/accel/in=
v_icm42370_core.c
> index 0000000000000..9f6c302e6f331
> --- /dev/null
> +++ b/drivers/iio/accel/inv_icm42370_core.c
[ ... ]
> @@ -0,0 +1,1251 @@
> +/* IIO format int + nano */
> +static const int inv_icm42370_accel_scale[] =3D {
> +	/* +/- 16G =3D> 2*16*9.80665 / (2**15) m/s-2 */
> +	[2 * INV_ICM42370_ACCEL_FS_16G] =3D 0,
> +	[2 * INV_ICM42370_ACCEL_FS_16G + 1] =3D 9576807,

[Severity: High]
Does this scale calculation double the true physical scale? Since a total 3=
2G
span (+/-16G) fits in a signed 16-bit integer, shouldn't the multiplier be
16 * 9.80665 / 32768 rather than 2 * 16 * 9.80665 / 32768?

[ ... ]
> +static void inv_icm42370_disable_pm(void *_data)
> +{
> +	struct device *dev =3D _data;
> +
> +	pm_runtime_put_sync(dev);

[Severity: High]
Will this unconditionally drop the PM usage counter to -1 during unbind or
probe error? Since inv_icm42370_core_probe() balances the get and put, the
counter should already be 0 when this devm cleanup action runs.

> +	pm_runtime_disable(dev);
> +}
[ ... ]
> +static irqreturn_t inv_icm42370_irq_handler(int irq, void *_data)
> +{
> +	struct inv_icm42370_data *dev_data =3D _data;
> +	unsigned int status;
> +	int ret;
> +
> +	mutex_lock(&dev_data->lock);
> +
> +	ret =3D regmap_read(dev_data->map, INV_ICM42370_REG_INT_STATUS, &status=
);

[Severity: High]
Should this threaded interrupt handler ensure the device is in an active PM
state before accessing hardware registers? If the device is suspended, could
this read fail or cause an I2C bus lockup?

> +	if (ret)
> +		goto out_unlock;
[ ... ]
> +static int inv_icm42370_temp_read(struct inv_icm42370_data *dev_data, s1=
6 *temp)
> +{
> +	struct device *dev =3D regmap_get_device(dev_data->map);
> +	__be16 *raw;
> +	int ret;
> +
> +	pm_runtime_get_sync(dev);

[Severity: High]
What happens if the device is suspended and pm_runtime_get_sync() fails?
Should the return value be checked before proceeding to read the temperatur=
e,
to avoid reading garbage data or locking the bus?

> +	mutex_lock(&dev_data->lock);
> +
> +	raw =3D (__be16 *)&dev_data->buffer[0];
> +	ret =3D regmap_bulk_read(dev_data->map, INV_ICM42370_REG_TEMP_DATA1, ra=
w,
> +			       sizeof(*raw));
[ ... ]
> +static int inv_icm42370_accel_read_offset(struct inv_icm42370_data *dev_=
data,
> +					  struct iio_chan_spec const *chan,
> +					  int *val, int *val2)
> +{
[ ... ]
> +	pm_runtime_get_sync(dev);
> +	mutex_lock(&dev_data->lock);
> +
> +	ret =3D inv_icm42370_mreg_read(dev_data->map, INV_ICM42370_MREG1, reg,
> +				     dev_data->buffer);
> +	memcpy(data, dev_data->buffer, sizeof(data));

[Severity: High]
Is it possible that the second byte of the offset remains uninitialized? Si=
nce
inv_icm42370_mreg_read() only reads one byte into buffer[0], copying into d=
ata
will include uninitialized memory.

[ ... ]
> +static int inv_icm42370_accel_write_offset(struct inv_icm42370_data *dev=
_data,
> +					   struct iio_chan_spec const *chan,
> +					   int val, int val2)
> +{
> +	struct device *dev =3D regmap_get_device(dev_data->map);
> +	s64 val64;
> +	s32 min, max;
> +	unsigned int regval;
> +	s16 offset;
> +	int ret;
> +
> +	if (chan->type !=3D IIO_ACCEL)
> +		return -EINVAL;
> +
> +	/* inv_icm42370_accel_calibbias: min - step - max in micro */
> +	min =3D inv_icm42370_accel_calibbias[0] * 1000000L +
> +	      inv_icm42370_accel_calibbias[1];
> +	max =3D inv_icm42370_accel_calibbias[4] * 1000000L +
> +	      inv_icm42370_accel_calibbias[5];
> +	val64 =3D (s64)val * 1000000LL + (s64)val2;

[Severity: Medium]
Will this fixed-point math yield incorrect results for negative inputs? For
instance, if val is -10 and val2 is 42010, val64 will be -9957990 instead of
-10042010.

> +	if (val64 < min || val64 > max)
> +		return -EINVAL;
[ ... ]
> +	pm_runtime_get_sync(dev);

[Severity: High]
Should this check the return value of pm_runtime_get_sync() before writing
offsets? A failure here could lead to writing to a suspended device.

> +	mutex_lock(&dev_data->lock);
> +
> +	switch (chan->channel2) {
> +	case IIO_MOD_X:
[ ... ]
> +	case IIO_MOD_Y:
> +		/* OFFSET_USER7 register is shared */
> +		ret =3D inv_icm42370_mreg_read(dev_data->map, INV_ICM42370_MREG1,
> +					     INV_ICM42370_REG_OFFSET_USER7,
> +					     (u8 *)&regval);

[Severity: High]
Does this Y-axis logic swap the upper and lower registers (USER6 and USER7)?
Also, could casting the uninitialized unsigned int regval to a u8 pointer
cause uninitialized stack memory to be written back? Lastly, the Z-axis case
below seems to ignore the mreg_read return value completely.

> +		if (ret)
> +			goto out_unlock;
[ ... ]
> +static int inv_icm42370_accel_read_sensor(struct iio_dev *indio_dev,
> +					  struct iio_chan_spec const *chan,
> +					  s16 *val)
> +{
[ ... ]
> +	pm_runtime_get_sync(dev);

[Severity: High]
Should this check the return value of pm_runtime_get_sync() before proceedi=
ng
to read the accelerometer sensor data?

> +	mutex_lock(&data->lock);
> +
> +	/* read accel register data */
> +	value =3D (__be16 *)&data->buffer[0];
[ ... ]
> +int inv_icm42370_core_probe(struct regmap *regmap, int chip, int irq,
> +			    inv_icm42370_bus_setup bus_setup)
> +{
[ ... ]
> +	data->vdd_supply =3D devm_regulator_get(dev, "vdd");
> +	if (IS_ERR(data->vdd_supply))
> +		return PTR_ERR(data->vdd_supply);
> +
> +	data->vddio_supply =3D devm_regulator_get(dev, "vddio");
> +	if (IS_ERR(data->vddio_supply))
> +		return PTR_ERR(data->vddio_supply);
> +
> +	ret =3D regulator_enable(data->vdd_supply);

[Severity: High]
Is data->vddio_supply supposed to be enabled here too? Additionally, is the=
re
a missing devm action or remove callback to disable data->vdd_supply? It lo=
oks
like it will leak across unbinds.

> +	if (ret)
> +		return ret;
> +
> +	ret =3D inv_icm42370_setup(data, bus_setup);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Setup failed\n");
> +
> +	data->indio_accel =3D inv_icm42370_accel_init(indio_dev, data);
> +	if (IS_ERR(data->indio_accel))
> +		return PTR_ERR(data->indio_accel);
> +
> +	ret =3D inv_icm42370_irq_init(data, irq, irq_type, open_drain);

[Severity: High]
Does calling devm_iio_device_register() (inside inv_icm42370_accel_init())
before initializing IRQs and PM runtime introduce a race condition? Userspa=
ce
could access sysfs attributes before the hardware and IRQs are fully ready.

> +	if (ret)
> +		return ret;
[ ... ]
> diff --git a/drivers/iio/accel/inv_icm42370_i2c.c b/drivers/iio/accel/inv=
_icm42370_i2c.c
> index 0000000000000..57e97d66329a1
> --- /dev/null
> +++ b/drivers/iio/accel/inv_icm42370_i2c.c
[ ... ]
> @@ -0,0 +1,103 @@
> +static const struct i2c_device_id inv_icm42370_id[] =3D { { "icm42370",
> +							  INV_CHIP_ICM42370 },
> +							{} };

[Severity: Low]
Should this array of struct i2c_device_id use C99 named initializers?

> +MODULE_DEVICE_TABLE(i2c, inv_icm42370_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-b4-inv_icm=
42370p-v1-0-670837f5842f@axis.com?part=3D2
