Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0254302F8
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241105; cv=none; b=ZDidDzgJyteycOPeiesICge1kTpFYLf6Y5bd4GsvAOotPo2mUrpakaeItk5IXouPvigUotnoqMVTGsNig2WTzCZHNqw3u/FL1e+AVT/MmW86k5Jr5urV3Yn2bS3myngQg/A78CT8/k/fUc00fO1noExR01EIl2YXC7l/ZTK8qfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241105; c=relaxed/simple;
	bh=Sh6usUDUgE9Fx8yoNxXcjds8WLANlB3jo0TKtt2haFU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FDtRVrjZgfYSKP1p7F92kGKM7Z2tsm2PcvnPGh4ckCfU9ozBAddPyFXDRslZSUdnQ+W5tCC8mgGBG1DhVYUhRYiNg8qnnDa422/cgMI0cnxPkDEK0vfuZ378u2HFstlU1n3pvvEa2/DrVHmg6JCbcEICTXoTVPSFEbUGJ2k4yFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NNfsk2EE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NNfsk2EE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2BF1F000E9;
	Tue, 28 Jul 2026 12:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785241103;
	bh=qiDT/wj8wxwNWyplMDhb0cFyst0I6CxPLTxpjubJNWo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NNfsk2EENhKBJE9u3Pl5rb01tR+EkpZrRsV/KRs4gY2Jm/NYehskCaUpxYyW7alP+
	 B6zwEk+ol7lVEVaZdv2KCn97JKsEn9W7wbNpR2N9Odq2C/bhEOcpXB6mbqUHFs9YcZ
	 zlER3AuWjBGjaWYJ2uBQs4AZXiXzc9JiT9mjIBCDp5Gi9Jty8Hj0bUvYbaNb98d+VT
	 a65D00f/EuVIcx+ws7YTXWCGEQWDboF2gv+Q+Q/OTxaltp1mKr5X02AH750dJTLEGD
	 sL0cRIaF0phEShBO/Ghg7pDE0Ovx9YugWFclWx/Bz7sRdChSSPWwQElU6C7RChielX
	 HBb0zzGvHoeuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] iio: adc: add support for PAC1711
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-pac1711-v2-2-609bc026093c@microchip.com>
References: <20260728-pac1711-v2-0-609bc026093c@microchip.com>
 <20260728-pac1711-v2-2-609bc026093c@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 12:18:22 +0000
Message-Id: <20260728121822.9E2BF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 15 potential issue=
(s) to consider:
- [High] Passing `__be16` to `i2c_smbus_write_word_data` sends bytes in the=
 wrong order on big-endian architectures.
- [High] The power channel's scale calculation can overflow a 32-bit signed=
 integer for valid shunt resistor values, leading to a negative scale facto=
r.
- [High] Missing initialization of device characteristics on devicetree fal=
lback path causes probe failure or incorrect measurements.
- [High] Concurrent sysfs reads and periodic background refreshes cause dat=
a races and torn reads on 64-bit cached register values.
- [High] Concurrent accesses to `pac1711_retrieve_data` check the refresh t=
imestamp outside of a lock, leading to multiple back-to-back hardware refre=
shes that permanently discard fractional accumulated energy.
- [High] Accumulator overflow persistently returns `-EINVAL` and breaks all=
 instantaneous measurement channels.
- [Medium] Integer division truncation in wait time calculation results in =
no delay for conversion completion at higher sample rates.
- [Medium] Timestamp cache invalidation fails when `jiffies` has not advanc=
ed.
- [Medium] Missing validation of I2C block read length allows parsing unini=
tialized data.
- [Medium] Custom sysfs attributes are used instead of standard IIO channel=
s for Energy and Charge.
- [Medium] The in_energy_raw attribute outputs a fractional value, violatin=
g the IIO ABI which requires _raw attributes to be unscaled integers.
- [Medium] The in_coulomb_counter_scale attribute outputs a scale factor th=
at evaluates to milliCoulombs, despite the custom ABI documenting it as Cou=
lombs.
- [Medium] Inconsistent read-modify-write for the sample frequency configur=
ation writes a read-only mirror register's contents back to the main contro=
l register.
- [Low] Passing an s32 array to device_property_read_u32_array causes an in=
compatible pointer type warning.
- [Low] `info->chip_reg_data.jiffies_tstamp` is modified outside the mutex =
lock, causing a data race.
--

--- Patch [2]: [PATCH v2 2/2] iio: adc: add support for PAC1711 ---
commit 3e5ab329ae21d2e946511636289fcfb6dbf555cd
Author: Ariana Lazar <ariana.lazar@microchip.com>
Subject: iio: adc: add support for PAC1711

This is the iio driver for Microchip PAC1711, PAC1721, PAC1811 and
PAC1821 single-channel power monitors with accumulator.

> diff --git a/drivers/iio/adc/pac1711.c b/drivers/iio/adc/pac1711.c
> new file mode 100644
> index 0000000000000..ee6adee31524e
> --- /dev/null
> +++ b/drivers/iio/adc/pac1711.c
[ ... ]
> +static int pac1711_reg_snapshot(struct pac1711_chip_info *info, bool do_=
refresh,
> +				u8 refresh_cmd, u32 wait_time)
> +{
[ ... ]
> +	/* Read the data registers */
> +	ret =3D i2c_smbus_read_i2c_block_data(client, PAC1711_ACC_COUNT_REG_ADD=
R,
> +					    PAC1711_MEAS_REG_SNAPSHOT_LEN,
> +					    (u8 *)info->chip_reg_data.meas_regs);
> +	if (ret < 0) {

[Severity: Medium]
Could this parse uninitialized memory if the I2C block read returns fewer
bytes than expected?

i2c_smbus_read_i2c_block_data() returns the number of bytes read on success.
Should it check if ret equals the requested length instead of just checking
for negative error codes?

> +		dev_err(dev, "%s - cannot read regs from 0x%02X\n",
> +			__func__, PAC1711_ACC_COUNT_REG_ADDR);
> +		return ret;
> +	}
[ ... ]
> +		if (check_add_overflow(info->chip_reg_data.acc_val, inc,
> +				       &info->chip_reg_data.acc_val)) {
> +			if (inc < 0)
> +				info->chip_reg_data.acc_val =3D S64_MIN;
> +			else
> +				info->chip_reg_data.acc_val =3D S64_MAX;
> +
> +			dev_err(dev, "Accumulator Overflow detected!\n");
> +			return -EINVAL;
> +		}

[Severity: High]
Does returning -EINVAL here permanently break all instantaneous measurement
channels once the accumulator overflows?

Because it aborts early, subsequent reads will see a positive increment,
trigger overflow again, and return -EINVAL, permanently disabling VBUS,
VSENSE, and VPOWER updates.

[ ... ]
> +static int pac1711_retrieve_data(struct pac1711_chip_info *info, u32 wai=
t_time)
> +{
> +	int ret =3D 0;
> +
> +	/*
> +	 * Check if the minimal elapsed time has passed and if so,
> +	 * read again the chip, otherwise use the cached info.
> +	 */
> +	if (time_after(jiffies, info->chip_reg_data.jiffies_tstamp +
> +			msecs_to_jiffies(PAC1711_MIN_POLLING_TIME_MS))) {

[Severity: High]
Can concurrent sysfs reads trigger multiple back-to-back hardware refreshes
here?

Since the time_after check and the jiffies_tstamp read occur without any
locking, two threads might both enter the refresh path, causing the second
thread to discard the fractional accumulated energy before it can accumulat=
e.

[Severity: Medium]
If the system jiffies has not incremented since the timestamp was recorded,
will this time_after() check evaluate to false?

If the cache invalidation is triggered (e.g. by modifying the jiffies_tstamp
when changing sample rates), it might be ignored here, causing the driver
to return stale data.

> +		ret =3D pac1711_reg_snapshot(info, true, PAC1711_REFRESH_REG_ADDR,
> +					   wait_time);
[ ... ]
> +static ssize_t pac1711_in_power_acc_raw_show(struct device *dev, struct =
device_attribute *attr,
> +					     char *buf)
> +{
> +	struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
> +	struct pac1711_chip_info *info =3D iio_priv(indio_dev);
> +	s64 curr_energy, int_part;
> +	int ret, rem;
> +
> +	ret =3D pac1711_retrieve_data(info, PAC1711_MIN_UPDATE_WAIT_TIME_US);
> +	if (ret)
> +		return ret;
> +
> +	/* Expresses the 64 bit energy value as a 64 bit integer and a 32 bit n=
ano value */
> +	curr_energy =3D info->chip_reg_data.acc_val;

[Severity: High]
Can this result in torn reads on 32-bit architectures?=20

The 64-bit acc_val variable is read here without holding info->lock, while
a background worker might be updating it concurrently.

> +	int_part =3D div_s64_rem(curr_energy, 1000000000, &rem);
> +
> +	if (rem < 0)
> +		return sysfs_emit(buf, "-%lld.%09u\n", abs(int_part), -rem);
> +	else
> +		return sysfs_emit(buf, "%lld.%09u\n", int_part, abs(rem));
> +}

[Severity: Medium]
Is it correct to output a formatted fractional string for a _raw attribute?

The IIO ABI specifies that _raw attributes should expose unscaled integers
from the hardware, so standard userspace parsers might fail to parse this.

[ ... ]
> +static ssize_t pac1711_in_coulomb_counter_scale_show(struct device *dev,
> +						     struct device_attribute *attr, char *buf)
> +{
[ ... ]
> +	/*
> +	 * Increasing precision
> +	 * (100mV * 1000000 * 1000000000) / 2^(12 or 16))
> +	 */
> +	tmp_u64 =3D div_u64(ref, info->shunt);
> +	rem =3D do_div(tmp_u64, 1000000000UL);
> +
> +	return sysfs_emit(buf, "%lld.%09u\n", tmp_u64, rem);
> +}

[Severity: Medium]
Does this scale factor evaluate to milliCoulombs rather than Coulombs?

The custom ABI documentation specifies the output unit is Coulombs, but the
calculated scale factor appears to represent milliCoulombs (mA * s), meaning
the userspace charge measurement would be off by a factor of 1000.

> +static IIO_DEVICE_ATTR(in_energy_raw, 0444,
> +		       pac1711_in_power_acc_raw_show, NULL, 0);

[Severity: Medium]
Should this use the standard IIO_ENERGY and IIO_CHARGE channel types instead
of custom sysfs attributes?

Using custom attributes prevents generic IIO userspace tools (like libiio)
from properly discovering, scaling, or buffering the energy and charge
measurements.

[ ... ]
> +static int pac1711_read_raw(struct iio_dev *indio_dev, struct iio_chan_s=
pec const *chan,
> +			    int *val, int *val2, long mask)
> +{
[ ... ]
> +	case IIO_CHAN_INFO_RAW:
> +		switch (chan->type) {
> +		case IIO_VOLTAGE:
> +			*val =3D info->chip_reg_data.vbus;
> +			return IIO_VAL_INT;
> +		case IIO_CURRENT:
> +			*val =3D info->chip_reg_data.vsense;
> +			return IIO_VAL_INT;
> +		case IIO_POWER:
> +			*val =3D (u32)info->chip_reg_data.vpower;
> +			*val2 =3D (u32)(info->chip_reg_data.vpower >> 32);

[Severity: High]
Can this result in torn reads on 32-bit architectures?=20

The 64-bit vpower variable is read here in two halves without holding
info->lock, while a background worker might be updating it concurrently.

> +			return IIO_VAL_INT_64;
[ ... ]
> +		case PAC1711_VPOWER_REG_ADDR:
> +			/*
> +			 * Power - uW - it will use the combined scale
> +			 * for current and voltage
> +			 * current(mA) * voltage(mV) =3D power (uW)
> +			 */
> +			switch (info->chip_variant) {
> +			case PAC1711_PRODUCT_ID_1711:
> +			case PAC1711_PRODUCT_ID_1811:
> +				tmp =3D PAC1711_PRODUCT_VOLTAGE_PV_FSR;
> +				break;
> +			case PAC1711_PRODUCT_ID_1721:
> +			case PAC1711_PRODUCT_ID_1821:
> +				tmp =3D PAC1721_PRODUCT_VOLTAGE_PV_FSR;
> +				break;
> +			default:
> +				return -EINVAL;
> +			}
> +
> +			do_div(tmp, info->shunt);
> +			*val =3D (int)tmp;

[Severity: High]
Will this overflow a 32-bit signed integer when using a standard 1 mOhm
(1000 uOhm) shunt resistor?

Dividing 4,200,000,000,000 by 1000 results in 4.2 billion, which exceeds
INT_MAX and wraps around to a negative number when cast to int, leading to
incorrect power scale readings in userspace.

[ ... ]
> +static int pac1711_write_raw(struct iio_dev *indio_dev, struct iio_chan_=
spec const *chan,
> +			     int val, int val2, long mask)
> +{
[ ... ]
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		scoped_guard(mutex, &info->lock) {
> +			old_samp_rate =3D pac1711_samp_rate_map_tbl[info->sample_rate_idx];
> +			new_idx =3D pac1711_get_samp_rate_idx(val);
> +			if (new_idx < 0)
> +				return new_idx;
> +
> +			ret =3D i2c_smbus_read_i2c_block_data(client, PAC1711_CTRL_ACT_REG_AD=
DR,
> +							    sizeof(tmp_u16), (u8 *)&tmp_be16);

[Severity: Medium]
Does this read-modify-write sequence read from the active status mirror
register (0x17) but write back to the main control register (0x01)?

This might inadvertently write back transient active status bits into the
configuration. In initialization, the driver correctly reads from 0x01.

> +			if (ret < 0) {
> +				dev_err(&client->dev, "cannot read regs from 0x%02X\n",
> +					PAC1711_CTRL_ACT_REG_ADDR);
> +				return ret;
> +			}
> +
> +			tmp_u16 =3D be16_to_cpu(tmp_be16);
> +			tmp_u16 &=3D ~PAC1711_CTRL_SAMPLE_MODE_MASK;
> +			tmp_u16 |=3D FIELD_PREP(PAC1711_CTRL_SAMPLE_MODE_MASK, new_idx);
> +			tmp_be16 =3D cpu_to_be16(tmp_u16);
> +
> +			ret =3D i2c_smbus_write_word_data(client, PAC1711_CTRL_REG_ADDR, tmp_=
be16);

[Severity: High]
Can this corrupt the device's control register on big-endian architectures?

i2c_smbus_write_word_data() expects a CPU-endian u16 and handles the byte
order for the SMBus transaction internally. Passing a __be16 will silently
reverse the byte order on the I2C wire on big-endian platforms.

> +			if (ret < 0) {
> +				dev_err(&client->dev, "Failed to configure sampling mode\n");
> +				return ret;
> +			}
> +
> +			info->sample_rate_idx =3D new_idx;
> +			info->chip_reg_data.ctrl_act_reg =3D tmp_u16;
> +		}
> +
> +		/* Force register snapshot and timestamp update with a refresh. */
> +		info->chip_reg_data.jiffies_tstamp -=3D msecs_to_jiffies(PAC1711_MIN_P=
OLLING_TIME_MS);

[Severity: Low]
Is it safe to modify info->chip_reg_data.jiffies_tstamp outside the mutex
lock? The periodic worker thread could be accessing it concurrently, creati=
ng
a data race.

> +		ret =3D pac1711_retrieve_data(info, (1024 / old_samp_rate) * 1000);

[Severity: Medium]
When the sample rate is 4096 or 8192 SPS, does this integer division evalua=
te
to zero before the multiplication?

This evaluates to 0 delay, potentially causing the driver to bypass the
required hardware conversion delay. Should the multiplication happen before
the division?

[ ... ]
> +static int pac1711_chip_identify(struct iio_dev *indio_dev, struct pac17=
11_chip_info *info)
> +{
> +	struct i2c_client *client =3D info->client;
> +	struct device *dev =3D &client->dev;
> +	u8 chip_rev_info[3];
> +	int ret;
> +
> +	ret =3D i2c_smbus_read_i2c_block_data(client, PAC1711_PID_REG_ADDR,
> +					    sizeof(chip_rev_info), chip_rev_info);
> +	if (ret < 0) {

[Severity: Medium]
Could this parse uninitialized memory if the I2C block read returns fewer
bytes than expected?

i2c_smbus_read_i2c_block_data() returns the number of bytes read on success.
Should it check if ret equals the requested length instead of just checking
for negative error codes?

[ ... ]
> +static int pac1711_init_vbus_vsense_ranges(struct pac1711_chip_info *inf=
o, bool is_vbus)
> +{
> +	struct i2c_client *client =3D info->client;
> +	struct device *dev =3D &client->dev;
> +	const char *prop_name;
> +	s32 vals[2];
> +	int ret;
> +
> +	if (is_vbus)
> +		prop_name =3D "microchip,vbus-input-range-microvolt";
> +	else
> +		prop_name =3D "microchip,vsense-input-range-microvolt";
> +
> +	ret =3D device_property_read_u32_array(dev, prop_name, vals, 2);

[Severity: Low]
Does passing an s32 array to device_property_read_u32_array() cause an
incompatible pointer type warning? This might break builds compiling with
-Werror.

[ ... ]
> +static int pac1711_chip_configure(struct pac1711_chip_info *info)
> +{
[ ... ]
> +	/* Configure the accumulation mode */
> +	tmp_u16 &=3D ~PAC1711_CTRL_ACC_MODE_MASK;
> +	tmp_u16 |=3D FIELD_PREP(PAC1711_CTRL_ACC_MODE_MASK, info->accumulation_=
mode);
> +
> +	tmp_be16 =3D cpu_to_be16(tmp_u16);
> +	ret =3D i2c_smbus_write_word_data(client, PAC1711_CTRL_REG_ADDR, tmp_be=
16);

[Severity: High]
Can this corrupt the device's control register on big-endian architectures?

i2c_smbus_write_word_data() expects a CPU-endian u16 and handles the byte
order for the SMBus transaction internally. Passing a __be16 will silently
reverse the byte order on the I2C wire on big-endian platforms.

[ ... ]
> +	/*
> +	 * Get the current (in the chip) sampling speed and compute the
> +	 * required timeout based on its value the timeout is 1/sampling_speed
> +	 * wait the maximum amount of time to be on the safe side - the
> +	 * maximum wait time is for 8sps
> +	 */
> +	wait_time =3D (1024 / pac1711_samp_rate_map_tbl[info->sample_rate_idx])=
 * 1000;
> +	fsleep(wait_time);

[Severity: Medium]
When the sample rate is 4096 or 8192 SPS, does this integer division evalua=
te
to zero before the multiplication?

This evaluates to 0 delay, potentially causing the driver to bypass the
required hardware conversion delay. Should the multiplication happen before
the division?

[ ... ]
> +static int pac1711_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D pac1711_chip_identify(indio_dev, info);
> +	if (ret) {
> +		/*
> +		 * If it fails to identify the hardware based on internal
> +		 * registers, use compatible from devicetree.
> +		 */
> +		chip =3D i2c_get_match_data(client);
> +		if (!chip)
> +			return -EINVAL;
> +
> +		info->chip_variant =3D chip->prod_id;
> +		indio_dev->name =3D chip->name;
> +	}

[Severity: High]
Does this fallback path leave info->voltage_range_idx and
info->is_pac18x1_family uninitialized?

If I2C identification fails, it appears these remain 0 and false, defaulting
to PAC1711 behavior and silently corrupting sensor data for other chip
variants like PAC1721 or PAC1821.

> +	/* Always start with accumulation channels enabled. */
> +	info->enable_acc =3D true;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-pac1711-v2=
-0-609bc026093c@microchip.com?part=3D2
