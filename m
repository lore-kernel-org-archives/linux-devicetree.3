Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A313B0AE7
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 12:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786624917; cv=none; b=A07bXm7Zm6WXOX1M1ijIjdAbC3pcAW73m/UHHIhGessrD1JeLMAi+kVkqEZAAeF3kg8so/kjPAAbLrelMmtSAlqrIxErCeiC37v112ZidwPqQHAcCyEnLgabS1+QxNwMJmo+tgPr1zuUHsZ+Ek0N4M5u01tcFlSLhTyc89SSv9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786624917; c=relaxed/simple;
	bh=N0/6VgGWV5U3UdoaCKUU2cpc9+/DGGSEmrB8hKqxYew=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q9Fh5QAAcXCOVkD0TYUB7nqoYZXZI61JThPibgjm7JMtPxyYZygWCJBIVY+isF4pnuZLEbwdUZ1Ym9KjcdYJ5H/93qRustaEqAdVT/7Xile+gYCLh5ZqLVh6B4tuV1qiOHmEOGl60rdom2UHRYV4yFHTFzUnJHI2ebYM7IZ9A5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SPcYVMBR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SPcYVMBR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B0B1F000E9;
	Thu, 13 Aug 2026 12:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786624915;
	bh=rAxyfZfHF+sF1098PAzCaIpySqdEKTxQpUAiQpBiyPI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SPcYVMBRZZDi/oAdnKtxt7qS+VNWYDuoX4ZJmi9l81vNYwQpTJajIUJh15qll722J
	 RTljMOexMsbF3VF1WOVl4Qu4yzrRmsgkCHhcCFqg1hEP/PGErXZqXe8YLNKaKdLaa+
	 fvum7SnWSrd1QZ53cv1hZJrDsxZMWkRY1gibka+z4ey3l/nO2DxKncoyOKCRv/HfFi
	 h2d+XZupDnFPGhkLVU3zNhSmxbDWjDcM6h9N9bBXNAJkXu1FAsrMWy0PUJrTkNXnBc
	 e4hYYGRkCNU/63otTbt6nPCUx0uiqNZKrMQhF55o6WaGRBn67RFIeJiBjNEZBURC3K
	 Q9LewBNQKAH/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] iio: accel: Add support for ICM42370P
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kanak Shilledar" <kanak.shilledar@axis.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260813-b4-inv_icm42370p-v2-2-11aedfdf76d3@axis.com>
References: <20260813-b4-inv_icm42370p-v2-0-11aedfdf76d3@axis.com>
 <20260813-b4-inv_icm42370p-v2-2-11aedfdf76d3@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 12:41:54 +0000
Message-Id: <20260813124155.71B0B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [High] Accessing MREG registers mutates a global configuration struct and=
 permanently overwrites the active device configuration without restoring i=
t.
- [High] The required hardware stabilization delay is bypassed, leading to =
premature MREG register access.
- [High] ODR mapping arrays are inverted, misconfiguring sensor sampling fr=
equencies.
- [High] Runtime PM setup exists without implementing dev_pm_ops callbacks.
- [High] Missing iio_device_claim_direct causes concurrency race on calibbi=
as read.
- [Medium] Incorrect negative minimum calculation in calibbias bounds check=
 rejects valid offsets.
- [Medium] Missing `.read_avail` callback breaks `_available` sysfs attribu=
tes.
- [Medium] Unbalanced pm_runtime_use_autosuspend leaks device reference.
- [Medium] MREG error paths fail to restore block selection register.
- [Medium] IRQ handler accesses hardware registers without PM runtime guard.
- [Medium] Endianness missing in IIO_TEMP scan_type definition (Speculative=
).
- [Medium] Lockless reads of `data->conf` fields in sysfs read handlers.
--

--- Patch [2]: [PATCH v2 2/3] iio: accel: Add support for ICM42370P ---
commit 4a22a747a5f16a585b80aa50c0ea6c3944149d0e
Author: Kanak Shilledar <kanak.shilledar@axis.com>
Subject: iio: accel: Add support for ICM42370P

This commit adds support for the Invensense ICM42370P MEMS MotionTracking
accelerometer over I2C. It implements raw reads, basic sysfs calibration
interfaces, and mandatory temperature sensor enablement.

> diff --git a/drivers/iio/accel/inv_icm42370.h b/drivers/iio/accel/inv_icm=
42370.h
> index 0000000000000..a4a822f04355f
> --- /dev/null
> +++ b/drivers/iio/accel/inv_icm42370.h
[ ... ]
> +#define INV_ICM42370_TEMP_CHAN(_index) \
> +	{								\
> +		.type =3D IIO_TEMP,					\
> +		.info_mask_separate =3D					\
> +			BIT(IIO_CHAN_INFO_RAW) |			\
> +			BIT(IIO_CHAN_INFO_OFFSET) |			\
> +			BIT(IIO_CHAN_INFO_SCALE),			\
> +		.scan_index =3D _index,					\
> +		.scan_type =3D {						\
> +			.sign =3D 's',					\
> +			.realbits =3D 16,					\
> +			.storagebits =3D 16,				\
> +		},							\
> +	}

[Severity: Medium]
Does this missing endianness definition cause issues on little-endian
architectures? The accelerometer channel specifies IIO_BE, but this
temperature channel omits it. Since the sensor outputs big-endian
data, userspace reading the temperature from the IIO buffer might
decode mangled values.

> diff --git a/drivers/iio/accel/inv_icm42370_core.c b/drivers/iio/accel/in=
v_icm42370_core.c
> index 0000000000000..6266362e83f6a
> --- /dev/null
> +++ b/drivers/iio/accel/inv_icm42370_core.c
[ ... ]
> +int inv_icm42370_mreg_write(struct inv_icm42370_data *data, u8 bank, u8 =
addr, u8 val)
> +{
> +	int ret;
> +	unsigned int sleep;
> +
> +	/* set default conf to ensure mreg access */
> +	ret =3D inv_icm42370_set_accel_conf(data, &inv_icm42370_default_conf, &=
sleep);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D inv_icm42370_mreg_check(data->map);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_write(data->map, INV_ICM42370_REG_BLK_SEL_W, bank);
> +	if (ret)
> +		return -EINVAL;
> +
> +	ret =3D regmap_write(data->map, INV_ICM42370_REG_MADDR_W, addr);
> +	if (ret)
> +		return -EINVAL;
> +
> +	ret =3D regmap_write(data->map, INV_ICM42370_REG_M_W, val);
> +	if (ret)
> +		return -EINVAL;
> +
> +	fsleep(10);
> +	return regmap_write(data->map, INV_ICM42370_REG_BLK_SEL_W, 0x00);
> +}

[Severity: Medium]
If regmap_write fails at INV_ICM42370_REG_MADDR_W or
INV_ICM42370_REG_M_W, the function returns immediately. Does this leave
the hardware bank selection permanently altered since we never write
0x00 to INV_ICM42370_REG_BLK_SEL_W on the error paths? This might cause
subsequent normal data reads to fetch garbage from the wrong bank.

[ ... ]
> +int inv_icm42370_mreg_read(struct inv_icm42370_data *data, u8 bank, u8 a=
ddr, u8 *val)
> +{
> +	int ret;
> +	unsigned int sleep, read_val;
> +
> +	/* set default conf to ensure mreg access */
> +	ret =3D inv_icm42370_set_accel_conf(data, &inv_icm42370_default_conf, &=
sleep);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D inv_icm42370_mreg_check(data->map);

[Severity: High]
Is it intentional to pass the global inv_icm42370_default_conf struct
directly to inv_icm42370_set_accel_conf()?

Looking at inv_icm42370_set_accel_conf(), it mutates the passed
configuration:

oldconf->fs =3D conf->fs;
oldconf->odr =3D conf->odr;

This will permanently overwrite the active device configuration in
data->conf and mutate the shared global struct.

[Severity: High]
Additionally, inv_icm42370_set_accel_conf() populates the sleep
variable with the required hardware stabilization time, but the code
proceeds directly to inv_icm42370_mreg_check() without actually
sleeping. Can this cause hardware communication failures due to
bypassing the startup delay?

[ ... ]
> +static irqreturn_t inv_icm42370_irq_handler(int irq, void *_data)
> +{
> +	struct inv_icm42370_data *data =3D _data;
> +	unsigned int status;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	ret =3D regmap_read(data->map, INV_ICM42370_REG_INT_STATUS, &status);

[Severity: Medium]
Should this interrupt handler use pm_runtime_get_if_active() before
accessing the hardware? If a spurious interrupt fires while the device
is in a runtime-suspended state, attempting to read
INV_ICM42370_REG_INT_STATUS without waking the hardware could lead to
I2C bus transfer errors.

[ ... ]
> +static int inv_icm42370_accel_write_offset(struct inv_icm42370_data *dat=
a,
> +					   struct iio_chan_spec const *chan,
> +					   int val, int val2)
> +{
> +	struct device *dev =3D regmap_get_device(data->map);
> +	s64 val64;
> +	s32 min, max;
> +	u8 regval;
> +	s16 offset;
> +	int ret;
> +
> +	if (chan->type !=3D IIO_ACCEL)
> +		return -EINVAL;
> +
> +	/* inv_icm42370_accel_calibbias: min - step - max in micro */
> +	min =3D inv_icm42370_accel_calibbias[0] * (long)MEGA +
> +	      inv_icm42370_accel_calibbias[1];
> +	max =3D inv_icm42370_accel_calibbias[4] * (long)MEGA +
> +	      inv_icm42370_accel_calibbias[5];

[Severity: Medium]
Is the calculation for the negative minimum boundary correct here?
Because inv_icm42370_accel_calibbias[0] is negative (-10), adding the
fractional part (42010) instead of subtracting it raises the minimum
floor (e.g., -9957990 instead of -10042010). Will this reject valid
extreme negative calibration offsets?

[ ... ]
> +static int inv_icm42370_accel_read_scale(struct iio_dev *indio_dev, int =
*val,
> +					 int *val2)
> +{
> +	struct inv_icm42370_data *data =3D iio_priv(indio_dev);
> +	unsigned int idx;
> +
> +	idx =3D data->conf.fs;

[Severity: Medium]
Should data->lock be held when reading data->conf.fs here and
data->conf.odr in inv_icm42370_accel_read_odr()? Concurrently writing
to the scale or sampling frequency sysfs nodes might result in stale
reads or data races.

[ ... ]
> +static int inv_icm42370_accel_write_odr(struct iio_dev *indio_dev, int v=
al,
> +					int val2)
> +{
> +	struct inv_icm42370_data *data =3D iio_priv(indio_dev);
> +	struct inv_sensors_timestamp *ts =3D &data->ts;
> +	struct device *dev =3D regmap_get_device(data->map);
> +	unsigned int idx;
> +	struct inv_icm42370_conf conf =3D INV_ICM42370_SENSOR_CONF_INIT;
> +	int ret;
> +
> +	for (idx =3D 0; idx < ARRAY_SIZE(inv_icm42370_accel_odr); idx +=3D 2) {
> +		if (val =3D=3D inv_icm42370_accel_odr[idx] &&
> +		    val2 =3D=3D inv_icm42370_accel_odr[idx + 1])
> +			break;
> +	}
> +	if (idx >=3D ARRAY_SIZE(inv_icm42370_accel_odr))
> +		return -EINVAL;
> +
> +	conf.odr =3D inv_icm42370_accel_odr_conv[idx / 2];

[Severity: High]
Can this map the wrong frequency to the sensor? The
inv_icm42370_accel_odr array defines frequencies in ascending order,
but inv_icm42370_accel_odr_conv maps the hardware enums in descending
order. Requesting 1.5625 Hz uses index 0, which appears to configure
the hardware to 1.6 kHz.

[ ... ]
> +static int inv_icm42370_accel_read_raw(struct iio_dev *indio_dev,
> +				       struct iio_chan_spec const *chan,
> +				       int *val, int *val2, long mask)
> +{
> +	struct inv_icm42370_data *data =3D iio_priv(indio_dev);
> +	s16 value;
> +	int ret;
> +
> +	switch (chan->type) {
> +	case IIO_ACCEL:
> +		break;
> +
> +	case IIO_TEMP:
> +		return inv_icm42370_temp_read_raw(indio_dev, chan, val, val2, mask);
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		if (!iio_device_claim_direct(indio_dev))
> +			return -EBUSY;
> +
> +		ret =3D inv_icm42370_accel_read_sensor(indio_dev, chan, &value);
> +		iio_device_release_direct(indio_dev);
> +		if (ret)
> +			return ret;
> +
> +		*val =3D value;
> +		return IIO_VAL_INT;
> +
> +	case IIO_CHAN_INFO_SCALE:
> +		return inv_icm42370_accel_read_scale(indio_dev, val, val2);
> +
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		return inv_icm42370_accel_read_odr(data, val, val2);
> +
> +	case IIO_CHAN_INFO_CALIBBIAS:
> +		return inv_icm42370_accel_read_offset(data, chan, val, val2);

[Severity: High]
Should iio_device_claim_direct() be called before reading the
calibration bias? The MREG reads underneath
inv_icm42370_accel_read_offset() silently alter the hardware's scale
and ODR settings. If this happens while the IIO buffer is actively
streaming, it could disrupt the active sampling state.

[ ... ]
> +static const struct iio_info inv_icm42370_info =3D {
> +	.read_raw =3D inv_icm42370_accel_read_raw,
> +	.write_raw =3D inv_icm42370_accel_write_raw,
> +};

[Severity: Medium]
Does this missing .read_avail callback break the _available sysfs
attributes? The channel definitions set
info_mask_shared_by_type_available and
info_mask_shared_by_all_available, which causes the IIO core to expose
those sysfs entries. Without a callback, reads will unconditionally
return -EINVAL.

[ ... ]
> +	/* setup runtime power management */
> +	ret =3D devm_pm_runtime_set_active_enabled(dev);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_set_autosuspend_delay(dev, INV_ICM42370_SUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	ret =3D devm_iio_device_register(dev, indio_dev);

[Severity: Medium]
Is there a missing cleanup action for pm_runtime_use_autosuspend(dev)?
If the driver is unbound or the probe fails after this point, the
device will remain marked for autosuspend indefinitely, leaving an
unbalanced usage counter.

> diff --git a/drivers/iio/accel/inv_icm42370_i2c.c b/drivers/iio/accel/inv=
_icm42370_i2c.c
> index 0000000000000..c4533671051c4
> --- /dev/null
> +++ b/drivers/iio/accel/inv_icm42370_i2c.c
[ ... ]
> +static struct i2c_driver inv_icm42370_driver =3D {
> +	.driver =3D {
> +		.name =3D "inv-icm42370-i2c",
> +		.of_match_table =3D inv_icm42370_of_matches,
> +	},
> +	.probe =3D inv_icm42370_probe,
> +	.id_table =3D inv_icm42370_id,
> +};

[Severity: High]
The core probe enables runtime PM and autosuspend, but this I2C driver
structure lacks a .pm operations pointer. Without assigning dev_pm_ops
and implementing runtime_suspend, does the hardware ever actually
power down when idle?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-b4-inv_icm=
42370p-v2-0-11aedfdf76d3@axis.com?part=3D2
