Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3EA47CC96
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778537383; cv=none; b=RKQ8eVOvJAsKgz/dtjFrJhA1M8tF7eHGXMlFUPOGCZTbt3Vx5MhJzRxTS9rlxcsSV7um6bBuzvdIWDZ81qmXBYGP3e4YOUY0vZ8VvEEHwZ7sTdoLazUmtoFYS6FNh+KULZqEjRg7YJLTPJDq0UOywj8OWPQ8LvuCZ/26HfYmZmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778537383; c=relaxed/simple;
	bh=F8868X5hQwCbocEZqVmc2emWPNTTIJuDB6eG0i46waQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jlEu5Pg5cqiNSH1DVY2b5RaHxXabrYbsgMpp00s/UgigHtcwghd7Dg49q5SC0nHGWDwVm7n+7kA4nHfifprl8RESZtbQHT/Z979YgS7pGA8NGpsN0meHsOSd8bRWTUtfN8D+7rCKeWNYCxHUKu+fS6hwuJf+3qDjsyAnT4vtMo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgB5G7cx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgB5G7cx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B824EC2BCF5;
	Mon, 11 May 2026 22:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778537383;
	bh=F8868X5hQwCbocEZqVmc2emWPNTTIJuDB6eG0i46waQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=dgB5G7cxJY0o3JHvNkRVFsFCn0bcij8AzPYTq/Uye9mPYJf6B6mkh+M55YcMTo0Fc
	 mo1XmBH6VzDDBKO24KbTNaGWGo9Uf6mCItObzNZf6JFSNU1vvA+bS9CJLr/NgGpJo9
	 UyvR1MJl/GDHASEwkI+tnSmnylYBsd0j45xy5G8KWCfjwQBdkjbnrA/nWjBTp18QYK
	 jpGvKlipIEgkUUdM6UbkrFQiXS9bhnhqhxoRuQ6IUoRfSNrJBugh8JuMEIp9bueZGK
	 YFS9rGD2uPLi/2CwZpX7TMn3hgtq5KKc+CaDR6yE40ywjkVH6mu+tfaEAdL6YbmG3o
	 RWZf9J+JHrYDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: light: bh1730: Add bh1730 light sensor driver
Reply-To: sashiko@lists.linux.dev
To: "Alexandre Hamamdjian via B4 Relay" <devnull+azkali.limited.gmail.com@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260511-bh1730-v1-2-e0df1f499135@gmail.com>
References: <20260511-bh1730-v1-2-e0df1f499135@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 22:09:42 +0000
Message-Id: <20260511220942.B824EC2BCF5@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Global shared state breaks power management for multiple devices.
- [High] Regulator resource leak and probe deferral mishandling.
- [High] Unsigned integer underflow in lux calculation causes erroneous max=
imum brightness readings.
- [High] Missing mutex protecting concurrent IIO sysfs reads causes race co=
nditions.
- [High] Probe error path leaves the device powered on.
- [High] Unbalanced regulator enable counts in error handling paths.
- [Medium] Incorrect I2C functionality check in probe.
- [Medium] RAW IIO channel violates ABI by returning scaled fractional valu=
es.
- [Medium] Missing integration-time tracking logic as claimed in the commit=
 message.
--

commit 92646ec6b1c5614b002c3fd3629112d1e7719033
Author: CTCaer <ctcaer@gmail.com>

iio: light: bh1730: Add bh1730 light sensor driver

Add a driver for the ROHM BH1730FVC ambient light sensor with runtime gain
tracking and configurable integration time.

>    The driver exposes illuminance via IIO, performs runtime gain and
>    integration-time tracking to keep the ADC in range, and supports

This isn't a bug, but the commit message mentions runtime integration-time
tracking. While runtime gain tracking is implemented in bh1730_adjust_gain(=
),
is there equivalent runtime logic to track or adjust the integration time,
or is it only configured once during bh1730_init_config()?

> diff --git a/drivers/iio/light/bh1730.c b/drivers/iio/light/bh1730.c
> new file mode 100644
> index 0000000000000..c93290ff5661f
> --- /dev/null
> +++ b/drivers/iio/light/bh1730.c
> @@ -0,0 +1,686 @@
[ ... ]
> +static int bh1730_get_lux(struct bh1730_data *bh1730)
> +{
[ ... ]
> +	/* Calibrate based on optical window */
> +	for (i =3D 0; i < bh1730->cal.opt_win_coeff_count; i++) {
> +		opt_win_coeff =3D &bh1730->cal.opt_win_coeff[i];
> +		if (1000 * ir / visible < opt_win_coeff->rc) {
> +			lux =3D ((u64)opt_win_coeff->cv * visible) -
> +				   (opt_win_coeff->ci * ir);
> +			break;
> +		}
> +	}
> +
> +	/* Calculate lux */
> +	lux *=3D BH1730_DEFAULT_ITIME_MS;
> +	lux /=3D bh1730_gain_multiplier(bh1730) * bh1730->itime_us;
> +	lux =3D (lux * bh1730->cal.mul) / 1000;
> +
> +	if (lux > BH1730_MAX_MEASURED_LUX)
> +		lux =3D BH1730_MAX_MEASURED_LUX;
> +
> +	return (int)lux;
> +}

Can the subtraction underflow if the infrared component (ci * ir) is greater
than the visible component (cv * visible)? Since lux is an unsigned 64-bit
integer, this could result in a massive positive number.

The subsequent clamping logic would then set lux to
BH1730_MAX_MEASURED_LUX (100,000). Would this cause the sensor to report
maximum brightness instead of 0 lux in environments where IR light dominate=
s?

[ ... ]
> +static int bh1730_power_ctrl(struct bh1730_data *bh1730, bool enable)
> +{
> +	struct device *dev =3D &bh1730->client->dev;
> +	static bool enabled;
> +	int ret =3D 0;
> +
> +	if (enabled =3D=3D enable)
> +		return ret;

Will this global static variable break power management for multiple device=
s?

If a system contains multiple BH1730 sensors, powering on the first sensor =
sets
enabled =3D true. When the second sensor attempts to power on during probe,
would the enabled =3D=3D enable check evaluate to true and return immediate=
ly
without enabling the regulators for the second device?

> +	if (enable) {
> +		if (!IS_ERR_OR_NULL(bh1730->reg_vdd)) {
> +			ret =3D regulator_enable(bh1730->reg_vdd);
> +			if (ret) {
> +				dev_err(dev, "%s: Failed to enable vdd: %d\n",
> +					__func__, ret);
> +				return ret;
> +			}
> +		}
> +
> +		if (!IS_ERR_OR_NULL(bh1730->reg_vid)) {
> +			ret =3D regulator_enable(bh1730->reg_vid);
> +			if (ret) {
> +				dev_err(dev, "%s: Failed to enable vid: %d\n",
> +					__func__, ret);
> +				return ret;
> +			}
> +		}

If regulator_enable(bh1730->reg_vdd) succeeds but the subsequent
regulator_enable(bh1730->reg_vid) fails, will this return without
disabling the vdd regulator and leave an unbalanced enable count?

[ ... ]
> +static int bh1730_power_off(struct bh1730_data *bh1730)
> +{
> +	int ret =3D bh1730_write(bh1730, BH1730_REG_CONTROL, 0);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return bh1730_power_ctrl(bh1730, false);
> +}

If the initial I2C write fails here, the function returns early without cal=
ling
bh1730_power_ctrl(..., false). Will this permanently leak the regulator
enable references upon an I2C error during device removal or suspend?

[ ... ]
> +static int bh1730_read_raw(struct iio_dev *indio_dev,
> +			   struct iio_chan_spec const *chan,
> +			   int *val, int *val2, long mask)
> +{
> +	struct bh1730_data *bh1730 =3D iio_priv(indio_dev);
> +	int data_reg, ret;
> +
> +	ret =3D bh1730_adjust_gain(bh1730);
> +	if (ret < 0)
> +		return ret;

Is a mutex needed here to protect concurrent IIO sysfs reads?

Without a driver-level lock, if multiple userspace threads read from the IIO
sysfs attributes concurrently, their executions will interleave.

Could concurrent access allow threads to trample the hardware gain state
in bh1730_adjust_gain(), corrupt I2C read sequences, and read invalid
mid-integration data?

> +	switch (mask) {
> +	case IIO_CHAN_INFO_PROCESSED:
> +		ret =3D bh1730_get_lux(bh1730);
> +		if (ret < 0)
> +			return ret;
> +		*val =3D ret;
> +		return IIO_VAL_INT;
> +	case IIO_CHAN_INFO_RAW:
> +		switch (chan->channel2) {
> +		case IIO_MOD_LIGHT_CLEAR:
> +			data_reg =3D BH1730_REG_DATA0LOW;
> +			break;
> +		case IIO_MOD_LIGHT_IR:
> +			data_reg =3D BH1730_REG_DATA1LOW;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		ret =3D bh1730_read_word(bh1730, data_reg);
> +		if (ret < 0)
> +			return ret;
> +		ret =3D ret * 1000 / bh1730_gain_multiplier(bh1730);
> +		*val =3D ret / 1000;
> +		*val2 =3D (ret % 1000) * 1000;
> +		return IIO_VAL_INT_PLUS_MICRO;

Is it permissible to return a scaled fractional value for IIO_CHAN_INFO_RAW=
?=20

The IIO ABI specifies that IIO_CHAN_INFO_RAW must return the exact, unscaled
integer value from the hardware. Should the driver expose the raw ADC count
using IIO_VAL_INT and provide a separate IIO_CHAN_INFO_SCALE attribute so t=
hat
userspace can properly interpret and scale the value?

[ ... ]
> +static int bh1730_parse_dt(struct bh1730_data *bh1730, struct device_nod=
e *dn)
> +{
> +	struct device *dev =3D &bh1730->client->dev;
> +	int ret;
> +	u32 *opt_win_coeff =3D NULL;
> +	u32 *gain_coeff =3D NULL;
> +	int opt_win_coeff_count =3D 0, gain_coeff_count =3D 0, cycle =3D 0, mul=
 =3D 0;
> +
> +	memcpy(&bh1730->cal, &def_lux_data, sizeof(struct lux_cal_data_t));
> +
> +	if (dn) {
> +		/* Get regulators */
> +		bh1730->reg_vdd =3D regulator_get(dev, "als-vdd");
> +		if (IS_ERR_OR_NULL(bh1730->reg_vdd)) {
> +			bh1730->reg_vdd =3D NULL;
> +			dev_warn(dev, "failed to get als-vdd");
> +		}

Are the regulator resources leaked here? regulator_get() is used to acquire
them, but there are no corresponding regulator_put() calls in bh1730_remove=
()
or any of the probe error paths.

Also, does checking the return value with IS_ERR_OR_NULL incorrectly swallow
the -EPROBE_DEFER error code?=20

If a regulator is not yet available, the pointer is set to NULL and the dri=
ver
proceeds instead of properly deferring the probe, which could break power
management. Could devm_regulator_get_optional() be used here instead?

[ ... ]
> +static int bh1730_probe(struct i2c_client *client)
> +{
> +	struct bh1730_data *bh1730;
> +	struct i2c_adapter *adapter =3D to_i2c_adapter(client->dev.parent);
> +	struct iio_dev *indio_dev;
> +	int ret;
> +
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE))
> +		return -EIO;

Is I2C_FUNC_SMBUS_BYTE the correct functionality to check? The driver activ=
ely
uses i2c_smbus_read_word_data() and i2c_smbus_write_byte_data().

Should this verify I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA
instead? Relying on I2C_FUNC_SMBUS_BYTE might cause the driver to bind to an
I2C adapter that does not support the required operations.

> +
> +	indio_dev =3D devm_iio_device_alloc(&client->dev, sizeof(*bh1730));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	bh1730 =3D iio_priv(indio_dev);
> +	bh1730->client =3D client;
> +	i2c_set_clientdata(client, indio_dev);
> +
> +	ret =3D bh1730_parse_dt(bh1730, client->dev.of_node);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D bh1730_power_on(bh1730);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D bh1730_init_config(bh1730);
> +	if (ret < 0)
> +		return ret;

If bh1730_init_config() fails, does this return early and leave the
device powered on?=20

Returning directly here would leak the regulator enable count instead of
jumping to the out_power_off label to properly clean up the state.

> +
> +	indio_dev->dev.parent =3D &client->dev;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-bh1730-v1-=
0-e0df1f499135@gmail.com?part=3D2
