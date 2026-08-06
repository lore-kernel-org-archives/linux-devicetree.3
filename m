Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6991730ACEE
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 13:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786021418; cv=none; b=hjPoJ+/A2/2eAHYwSxBXVaCDkFrUkVSYjm+YWuKKz2NVDs4++9agWRpt0rb+k6GKvlzyhAobFbfMqVtnWF6VfxpPlr0YSET/qu8HVEEEsXxu5dIXlgYkGeTM6fZyiuBEaO5JYKRuyrgFnHN9cWe0X4+qig9oAIsmHBD8/55OJgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786021418; c=relaxed/simple;
	bh=fTBFwvbUt0M0j2Dt9xL0yvkvODpkC1QrwtdAdjWpPDk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZW3U5xH/af5tuA7g5QSO/yZyv6XDK6YilZUg+2Hz8zbwCq/xLRx0tmCANh1Q4Ulv5b7LR7kFHLWHyR2sptuX3u5nGU+x2504q5db62o+eiuUyU1+th38MsPk5N+7NCgdsoiTuOfwe23soYjAz1DJdAro/DijKwlz4XRbrmU+QJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmHY8E+3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmHY8E+3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92041F000E9;
	Thu,  6 Aug 2026 13:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786021408;
	bh=Mbj8qCKeIjsYcdoQomqWrQGdME4+wCvAb6SaSW2XuMY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZmHY8E+3+h7RSATNrFix+r/872ytc4/MCy8cB6QKGl5Rwt0g10Cv3Km9jt0LlvAEe
	 1D/kHlFezN0vtudxBccjcOmRT2OvfvPl8wLHc8gHdRYT6+wfJIqCxwpkcnhbR5eVFa
	 BczhjxfBYKHgG4WsUhyx8b0hEIGUO1cRnnhv4Nl7rPLnnFZlCwefD4t0EQQR/64b72
	 uB7/IcCHMsyZ4glHH8FB+n1CqEezDwv8UJgrc7hXhivAnsUMfPIn0bk0bRj71Kpipt
	 5aWKpu8/yREitN81HbiPcE8J0TkcMOeltNF/mhxX6FM0+tUjKFJoM+uEk2ds4TXEY6
	 E9sQNi9r0/qXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] iio: accel: icm42370: Add FIFO buffer functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kanak Shilledar" <kanak.shilledar@axis.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806-b4-inv_icm42370p-v1-3-670837f5842f@axis.com>
References: <20260806-b4-inv_icm42370p-v1-0-670837f5842f@axis.com>
 <20260806-b4-inv_icm42370p-v1-3-670837f5842f@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 13:03:27 +0000
Message-Id: <20260806130327.D92041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 14 potential issue=
(s) to consider:

New issues:
- [Critical] Heap buffer overflow in `inv_icm42370_buffer_fifo_read()` when=
 flushing the hardware FIFO via sysfs.
- [High] The return value of `pm_runtime_get_sync()` is ignored in `inv_icm=
42370_buffer_preenable()`, potentially causing hardware accesses on a suspe=
nded device.
- [High] The FIFO parsing loop reads out-of-bounds data if the hardware rep=
orts a partial packet size.
- [Medium] If `regmap_bulk_write()` fails in `inv_icm42370_buffer_update_wa=
termark()`, the function returns early without restoring the FIFO watermark=
 interrupt.
- [Medium] If hardware writes fail in `inv_icm42370_buffer_predisable()`, t=
he internal reference counter `st->fifo.on` is not decremented, permanently=
 breaking subsequent buffer enablements.
- [Medium] `inv_icm42370_buffer_postdisable` incorrectly erases the user-co=
nfigured watermark by setting `st->fifo.watermark.accel =3D 0`.
- [Medium] Hardware FIFO sysfs callbacks (`hwfifo_set_watermark`, `hwfifo_f=
lush`) access registers without PM runtime protection.
- [Medium] Stale `st->fifo.period` cache corrupts timestamps when ODR is ch=
anged on the fly.
- [Medium] The driver adds IIO buffer support but forgets to include `IIO_C=
HAN_SOFT_TIMESTAMP` in its channel array.
- [Medium] The driver allows the temperature channel to be enabled without =
the accelerometer, but fails to turn on the sensor in this case.

Pre-existing issues:
- [High] `inv_icm42370_set_accel_conf` ignores the requested sensor mode, p=
reventing the device from being turned off when the buffer is disabled.
- [High] The IIO device is registered before PM runtime and IRQ initializat=
ion, exposing the device prematurely and breaking devres teardown ordering.
- [High] The driver suffers from a PM runtime usage counter underflow due t=
o unbalanced puts during probe and removal.
- [Medium] The threaded IRQ handler accesses the hardware interrupt status =
register without verifying if the device is active.
--

--- Patch [3]: [PATCH 3/3] iio: accel: icm42370: Add FIFO buffer functional=
ity ---
commit 2096dc9aae100b3082c95d260e2d65e0fdf275c9
Author: Kanak Shilledar <kanak.shilledar@axis.com>
Date:   Thu Aug 6 12:46:29 2026 +0000

    iio: accel: icm42370: Add FIFO buffer functionality
   =20
    Add support for the hardware FIFO buffer to support high data rate
    capture. This includes necessary IIO buffersetup ops, watermark
    management and FIFO packet decoding. The accelerometer has 2.25kB FIFO
    size. The buffer can be handled via sysfs.

> diff --git a/drivers/iio/accel/inv_icm42370_buffer.c b/drivers/iio/accel/=
inv_icm42370_buffer.c
> index 0000000000000..a39b8aa4dd9bf
> --- /dev/null
> +++ b/drivers/iio/accel/inv_icm42370_buffer.c
[ ... ]
> +void inv_icm42370_buffer_update_fifo_period(struct inv_icm42370_data *st)
> +{
> +	u32 period_accel;
> +
> +	if (st->fifo.en & INV_ICM42370_SENSOR_ACCEL)
> +		period_accel =3D inv_icm42370_odr_to_period(st->conf.odr);
> +	else
> +		period_accel =3D U32_MAX;
> +
> +	st->fifo.period =3D period_accel;
> +}

[Severity: Medium]
When a user changes the ODR sysfs property while the buffer is enabled,
inv_icm42370_accel_write_odr() handles the change but it does not appear to
update st->fifo.period. Could this stale st->fifo.period cache cause the FI=
FO
parser to generate incorrect timestamps?

[ ... ]
> +int inv_icm42370_buffer_update_watermark(struct inv_icm42370_data *st)
> +{
> +	size_t packet_size, wm_size;
> +	unsigned int wm_accel, watermark;
> +	bool restore;
> +	__le16 raw_wm;
> +	int ret;
> +
> +	packet_size =3D inv_icm42370_get_packet_size(st->fifo.en);
> +
> +	/* compute sensors latency, depending on sensor watermark and odr */
> +	wm_accel =3D
> +		inv_icm42370_wm_truncate(st->fifo.watermark.accel, packet_size);
> +
> +	/* 0 value for watermark means that the sensor is turned off */
> +	if (wm_accel =3D=3D 0)
> +		return 0;
> +
> +	watermark =3D wm_accel;
> +	st->fifo.watermark.eff_accel =3D wm_accel;
> +
> +	/* compute watermark value in bytes */
> +	wm_size =3D watermark * packet_size;
> +
> +	/* changing FIFO watermark requires to turn off watermark interrupt */
> +	ret =3D regmap_update_bits_check(
> +		st->map, INV_ICM42370_REG_INT_SOURCE0,
> +		INV_ICM42370_INT_SOURCE0_FIFO_THS_INT1_EN, 0, &restore);
> +	if (ret)
> +		return ret;
> +
> +	raw_wm =3D INV_ICM42370_FIFO_WATERMARK_VAL(wm_size);
> +	memcpy(st->buffer, &raw_wm, sizeof(raw_wm));
> +	ret =3D regmap_bulk_write(st->map, INV_ICM42370_REG_FIFO_WATERMARK,
> +				st->buffer, sizeof(raw_wm));
> +	if (ret)
> +		return ret;

[Severity: Medium]
If this regmap_bulk_write() fails, we return early and bypass the restorati=
on
of the watermark interrupt. Does this permanently disable the watermark
interrupt on a transient I2C/SPI bus error, breaking future data capture?

> +
> +	/* restore watermark interrupt */
> +	if (restore) {
> +		ret =3D regmap_set_bits(
> +			st->map, INV_ICM42370_REG_INT_SOURCE0,
> +			INV_ICM42370_INT_SOURCE0_FIFO_THS_INT1_EN);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int inv_icm42370_buffer_preenable(struct iio_dev *indio_dev)
> +{
> +	struct inv_icm42370_data *st =3D iio_priv(indio_dev);
> +	struct device *dev =3D regmap_get_device(st->map);
> +	struct inv_icm42370_sensor_state *sensor_st =3D st->sensor_state;
> +	struct inv_sensors_timestamp *ts =3D &sensor_st->ts;
> +
> +	pm_runtime_get_sync(dev);

[Severity: High]
Is it intentional to ignore the return value of pm_runtime_get_sync() here?
A failure to wake the device might lead to bus timeouts or crashes when
postenable attempts to write to hardware registers. It also leaves the PM
usage counter incremented on failure, causing a reference leak. Could we use
pm_runtime_resume_and_get() instead and propagate the error?

> +
> +	guard(mutex)
> +		(&st->lock);
> +	inv_sensors_timestamp_reset(ts);
> +
> +	return 0;
> +}
[ ... ]
> +static int inv_icm42370_buffer_predisable(struct iio_dev *indio_dev)
> +{
> +	struct inv_icm42370_data *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	guard(mutex)
> +		(&st->lock);
> +
> +	if (st->fifo.on > 1) {
> +		st->fifo.on--;
> +		return 0;
> +	}
> +
> +	/* set FIFO in bypass mode */
> +	ret =3D regmap_write(st->map, INV_ICM42370_REG_FIFO_CONFIG1,
> +			   INV_ICM42370_FIFO_CONFIG_BYPASS);
> +	if (ret)
> +		return ret;
> +
> +	/* flush FIFO data */
> +	ret =3D regmap_write(st->map, INV_ICM42370_REG_SIGNAL_PATH_RESET,
> +			   INV_ICM42370_SIGNAL_PATH_RESET_FIFO_FLUSH);
> +	if (ret)
> +		return ret;
> +
> +	/* disable FIFO threshold interrupt */
> +	ret =3D regmap_clear_bits(st->map, INV_ICM42370_REG_INT_SOURCE0,
> +				INV_ICM42370_INT_SOURCE0_FIFO_THS_INT1_EN);
> +	if (ret)
> +		return ret;

[Severity: Medium]
If any hardware writes fail in inv_icm42370_buffer_predisable(), we return
early and never decrement st->fifo.on. Does this permanently break subseque=
nt
buffer enablements, as postenable will see st->fifo.on > 0 and skip hardware
initialization?

> +
> +	st->fifo.on--;
> +
> +	return 0;
> +}
> +
> +static int inv_icm42370_buffer_postdisable(struct iio_dev *indio_dev)
> +{
> +	struct inv_icm42370_data *st =3D iio_priv(indio_dev);
> +	struct inv_icm42370_sensor_state *sensor_st =3D st->sensor_state;
> +	struct inv_sensors_timestamp *ts =3D &sensor_st->ts;
> +	struct device *dev =3D regmap_get_device(st->map);
> +	unsigned int sensor;
> +	unsigned int *watermark;
> +	struct inv_icm42370_conf conf =3D INV_ICM42370_SENSOR_CONF_INIT;
> +	unsigned int sleep_temp =3D 0;
> +	unsigned int sleep_sensor =3D 0;
> +	unsigned int sleep;
> +	int ret;
> +
> +	if (indio_dev =3D=3D st->indio_accel) {
> +		sensor =3D INV_ICM42370_SENSOR_ACCEL;
> +		watermark =3D &st->fifo.watermark.accel;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&st->lock);
> +
> +	inv_sensors_timestamp_apply_odr(ts, 0, 0, 0);
> +
> +	ret =3D inv_icm42370_buffer_set_fifo_en(st, st->fifo.en & ~sensor);
> +	if (ret)
> +		goto out_unlock;
> +
> +	*watermark =3D 0;
> +	ret =3D inv_icm42370_buffer_update_watermark(st);

[Severity: Medium]
By setting *watermark =3D 0 here, does the driver incorrectly erase the use=
r's
sysfs-configured watermark? When the buffer is later re-enabled, it seems t=
he
watermark would remain 0.

> +	if (ret)
> +		goto out_unlock;
[ ... ]
> +int inv_icm42370_buffer_fifo_read(struct inv_icm42370_data *st,
> +				  unsigned int max)
> +{
> +	size_t max_count;
> +	__be16 *raw_fifo_count;
> +	ssize_t i, size;
> +	const void *accel, *timestamp;
> +	const s8 *temp;
> +	unsigned int odr;
> +	int ret;
> +
> +	/* reset all samples counters */
> +	st->fifo.count =3D 0;
> +	st->fifo.nb.accel =3D 0;
> +	st->fifo.nb.total =3D 0;
> +
> +	/* compute maximum FIFO read size */
> +	if (max =3D=3D 0)
> +		max_count =3D sizeof(st->fifo.data);
> +	else
> +		max_count =3D max * inv_icm42370_get_packet_size(st->fifo.en);

[Severity: Critical]
When max is greater than 0, does this else branch fail to clamp max_count
against sizeof(st->fifo.data)? If userspace triggers a hardware FIFO flush
with a large count, max_count could be computed to a value greater than the
fixed size of st->fifo.data (2080 bytes), allowing up to the hardware FIFO =
size
(2304 bytes) to be read blindly into the heap array.

> +
> +	/* read FIFO count value */
> +	raw_fifo_count =3D (__be16 *)st->buffer;
> +	ret =3D regmap_bulk_read(st->map, INV_ICM42370_REG_FIFO_COUNT,
> +			       raw_fifo_count, sizeof(*raw_fifo_count));
> +	if (ret)
> +		return ret;
> +	st->fifo.count =3D be16_to_cpup(raw_fifo_count);
> +
> +	/* check and clamp FIFO count value */
> +	if (st->fifo.count =3D=3D 0)
> +		return 0;
> +	if (st->fifo.count > max_count)
> +		st->fifo.count =3D max_count;
> +
> +	/* read all FIFO data in internal buffer */
> +	ret =3D inv_icm42370_fifo_read_data(st, st->fifo.count);
> +	if (ret)
> +		return ret;
> +
> +	/* compute number of samples for each sensor */
> +	for (i =3D 0; i < st->fifo.count; i +=3D size) {

[Severity: High]
Does this loop read out-of-bounds data if the hardware reports a partial
packet size? Because it relies on i < st->fifo.count instead of ensuring
i + packet_size <=3D st->fifo.count, inv_icm42370_fifo_decode_packet might
read past the valid bytes returned by the hardware.

> +		size =3D inv_icm42370_fifo_decode_packet(
> +			&st->fifo.data[i], &accel, &temp, &timestamp, &odr);
> +		if (size <=3D 0)
> +			break;
> +		if (accel !=3D NULL && inv_icm42370_fifo_is_data_valid(accel))
> +			st->fifo.nb.accel++;
> +		st->fifo.nb.total++;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> diff --git a/drivers/iio/accel/inv_icm42370_core.c b/drivers/iio/accel/in=
v_icm42370_core.c
> index 9f6c302e6f331..7107fc7a682dd 100644
> --- a/drivers/iio/accel/inv_icm42370_core.c
> +++ b/drivers/iio/accel/inv_icm42370_core.c
[ ... ]
> @@ -424,6 +452,7 @@ static irqreturn_t inv_icm42370_irq_timestamp(int irq=
, void *_data)
>  static irqreturn_t inv_icm42370_irq_handler(int irq, void *_data)
>  {
>  	struct inv_icm42370_data *dev_data =3D _data;
> +	struct device *dev =3D regmap_get_device(dev_data->map);
>  	unsigned int status;
>  	int ret;
> =20
> @@ -433,6 +462,21 @@ static irqreturn_t inv_icm42370_irq_handler(int irq,=
 void *_data)
>  	if (ret)
>  		goto out_unlock;

[Severity: Medium]
This is a pre-existing issue, but should the IRQ handler use
pm_runtime_get_if_active() before accessing the interrupt status register?
If the interrupt fires spuriously or races with autosuspend, it could
attempt to access a powered-down device.

> =20
> +	if (status & INV_ICM42370_INT_STATUS_FIFO_FULL)
> +		dev_warn_ratelimited(dev, "FIFO full data lost!\n");
> +
> +	if (status & (INV_ICM42370_INT_STATUS_FIFO_THS |
> +		      INV_ICM42370_INT_STATUS_FIFO_FULL)) {
> +		ret =3D inv_icm42370_buffer_fifo_read(dev_data, 0);
> +		if (ret) {
> +			dev_err_ratelimited(dev, "FIFO read error %d\n", ret);
> +			goto out_unlock;
> +		}
> +		ret =3D inv_icm42370_buffer_fifo_parse(dev_data);
> +		if (ret)
> +			dev_err_ratelimited(dev, "FIFO parsing error %d\n", ret);
> +	}
> +
>  out_unlock:
>  	mutex_unlock(&dev_data->lock);
>  	return IRQ_HANDLED;
[ ... ]
> +/* enable accelerometer sensor and FIFO write */
> +static int inv_icm42370_accel_update_scan_mode(struct iio_dev *indio_dev,
> +					       const unsigned long *scan_mask)
> +{
> +	struct inv_icm42370_data *st =3D iio_priv(indio_dev);
> +	struct inv_icm42370_sensor_state *accel_st =3D st->sensor_state;
> +	struct inv_icm42370_conf conf =3D INV_ICM42370_SENSOR_CONF_INIT;
> +	unsigned int fifo_en =3D 0;
> +	unsigned int sleep_temp =3D 0;
> +	unsigned int sleep_accel =3D 0;
> +	unsigned int sleep;
> +	int ret;
> +
> +	mutex_lock(&st->lock);
> +
> +	if (*scan_mask & INV_ICM42370_SCAN_MASK_ACCEL_3AXIS) {

[Severity: Medium]
Is there a missing check for the temperature channel? Userspace might enable
only the temperature channel in the scan mask, but this check only looks for
the accelerometer. In that case, the buffer would start but the sensor would
remain off.

> +		/* enable accel sensor */
> +		conf.mode =3D st->conf.mode;
> +		conf.filter =3D accel_st->filter;
> +		ret =3D inv_icm42370_set_accel_conf(st, &conf, &sleep_accel);

[Severity: High]
This is a pre-existing issue, but inv_icm42370_set_accel_conf() appears to
ignore the requested sensor mode. It receives the new mode via conf->mode b=
ut
never assigns it to dev_data->conf.mode, and passes the unmodified old mode
to inv_icm42370_set_pwr_mgmt0(). When called here (or in postdisable), does
this prevent the sensor from actually changing power state?

> +		if (ret)
> +			goto out_unlock;
> +		fifo_en |=3D INV_ICM42370_SENSOR_ACCEL;
> +	}
> +
> +	/* update data FIFO write */
> +	ret =3D inv_icm42370_buffer_set_fifo_en(st, fifo_en | st->fifo.en);
[ ... ]
> +static int inv_icm42370_accel_hwfifo_set_watermark(struct iio_dev *indio=
_dev,
> +						   unsigned int val)
> +{
> +	struct inv_icm42370_data *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	mutex_lock(&st->lock);
> +
> +	st->fifo.watermark.accel =3D val;
> +	ret =3D inv_icm42370_buffer_update_watermark(st);

[Severity: Medium]
Does inv_icm42370_buffer_update_watermark() access hardware registers witho=
ut
ensuring the device is active? If userspace writes to this sysfs attribute
while the buffer is disabled and the device is powered off, this might lead
to a bus timeout. Should pm_runtime_resume_and_get() be used here?

> +
> +	mutex_unlock(&st->lock);
> +
> +	return ret;
> +}
> +
> +static int inv_icm42370_accel_hwfifo_flush(struct iio_dev *indio_dev,
> +					   unsigned int count)
> +{
> +	struct inv_icm42370_data *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	if (count =3D=3D 0)
> +		return 0;
> +
> +	mutex_lock(&st->lock);
> +
> +	ret =3D inv_icm42370_buffer_hwfifo_flush(st, count);

[Severity: Medium]
Similarly, does inv_icm42370_buffer_hwfifo_flush() access hardware registers
without PM runtime protection?

> +	if (!ret)
> +		ret =3D st->fifo.nb.accel;
> +
> +	mutex_unlock(&st->lock);
> +
> +	return ret;
> +}
[ ... ]
> @@ -1143,10 +1286,15 @@ struct iio_dev *inv_icm42370_accel_init(struct ii=
o_dev *indio_dev,
> =20
>  	indio_dev->name =3D "inv_icm42370";
>  	indio_dev->info =3D &inv_icm42370_info;
> -	indio_dev->modes =3D INDIO_DIRECT_MODE;
> +	indio_dev->modes =3D INDIO_DIRECT_MODE | INDIO_ALL_BUFFER_MODES;
>  	indio_dev->channels =3D inv_icm42370_accel_channels;
>  	indio_dev->num_channels =3D ARRAY_SIZE(inv_icm42370_accel_channels);

[Severity: Medium]
With buffer modes added, should IIO_CHAN_SOFT_TIMESTAMP be included in
the inv_icm42370_accel_channels array? Without it, userspace cannot enable
the timestamp channel in the scan mask.

> =20
> +	ret =3D devm_iio_kfifo_buffer_setup(dev, indio_dev,
> +					  &inv_icm42370_buffer_ops);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	ret =3D devm_iio_device_register(dev, indio_dev);
>  	if (ret)
>  		return ERR_PTR(ret);
[ ... ]
> @@ -1222,6 +1417,14 @@ int inv_icm42370_core_probe(struct regmap *regmap,=
 int chip, int irq,
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Setup failed\n");
> =20
> +	ret =3D inv_icm42370_timestamp_setup(data);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D inv_icm42370_buffer_init(data);
> +	if (ret)
> +		return ret;
> +
>  	data->indio_accel =3D inv_icm42370_accel_init(indio_dev, data);
>  	if (IS_ERR(data->indio_accel))
>  		return PTR_ERR(data->indio_accel);

[Severity: High]
This isn't a bug introduced by this patch, but registering the IIO device
before PM runtime and IRQ initialization exposes the device prematurely.
Furthermore, because devres unwinds in LIFO order, PM runtime is disabled
before the IIO device is unregistered. Does this force the buffer teardown
(postdisable) to run with PM runtime already disabled during driver removal?

Also, as a pre-existing issue, the devres action inv_icm42370_disable_pm
registered at the end of probe calls pm_runtime_put_sync(). Since the probe
function balances the counter to 0 with a pm_runtime_put() before returning,
does this second put on driver removal underflow the PM usage counter below
zero?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-b4-inv_icm=
42370p-v1-0-670837f5842f@axis.com?part=3D3
