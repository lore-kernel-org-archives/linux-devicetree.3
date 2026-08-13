Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E75473C65
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 12:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786624856; cv=none; b=lQbUIDOUcrbUF4q/RtFanGcgVU+qRnQdbc7K2yWrQQr+G5L8aOIexQNPh4Ya/CiL/GzCsmaXiXfaGr5IHddTWa6Q2+JPi94K8fuq/OwNdvLYytNsVUgXVjoUNqVxbXRD+xLf+SWQ4Bt99DaAs5YF1/b6ko+SesNOUvDhdQ5LZUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786624856; c=relaxed/simple;
	bh=CSwMVYDVlvkUCpgKFitZPvydHYntWpbbsGwJ1jwaghw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mmNJoE8puB9rIL2/LRsxPqjMoZMN4joKRr2CWaEPv7qltj+8JfrOpmYXdD/WhA2I6OjAsIWy4KsF0ifm34YqLCVi4RC1SDJPKlp6fciyPKyleuIfDCR+4J5Ya9ZpPFNWiLY0Hy78JeaViTeuwbB+o+LHhaGcYB9pqOBAp045dq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nodWz2A4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nodWz2A4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2981F000E9;
	Thu, 13 Aug 2026 12:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786624854;
	bh=Pbc9z8iogskPfMq63tZjBDAzsX8IgFJTxekOm6FDbBA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nodWz2A4L8MwxG7hScsW/eTr1GIbsEM2EmTiYu0T8Erwt5GXvR/KyssLM+EnXBcNf
	 6UKPfMz0aCU0gn7sCMf4bHG8OKFrVufwtIjngLXY8eugZn7IOsin7yJGRTOIHPG7O1
	 gARHPZvR6rhmM4ea5kUFqO8im0AqCYkYixGR2a0nnHK8hTkw5YaTT7F4FYF/GCrpfZ
	 JSJ+OAlXaW3m5HUXu/pImo/CFTbxwj+5dH6A11knygv1q4Yx92cCfitHTg+3yVGSPt
	 +PNzDI2lC0YXkph1+S9pE/opfau1ISLXevRG/2OW/onk1HriKOulJKcCgAHQ1hLqAz
	 57SX4TIwyBChw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] iio: accel: icm42370: Add FIFO buffer
 functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kanak Shilledar" <kanak.shilledar@axis.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260813-b4-inv_icm42370p-v2-3-11aedfdf76d3@axis.com>
References: <20260813-b4-inv_icm42370p-v2-0-11aedfdf76d3@axis.com>
 <20260813-b4-inv_icm42370p-v2-3-11aedfdf76d3@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 12:40:53 +0000
Message-Id: <20260813124054.7C2981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Missing `available_scan_masks` causes IIO buffer data corruption w=
hen channels are disabled.
- [High] Incorrect endianness parsing and scaling of the hardware `FIFO_COU=
NT` register.
- [High] Enabling only the TEMP channel causes the IIO buffer to hang indef=
initely.
- [High] Hardware registers are accessed without acquiring PM runtime in sy=
sfs and IIO core callbacks.
- [Medium] Mixing `goto` error handling with `guard(mutex)` causes device l=
ock to be held during sleeps.
- [Medium] The internal FIFO state tracker `data->fifo.on` leaks when hardw=
are configuration fails.
- [Medium] The sensor hardware is left powered on indefinitely if configura=
tion steps fail during buffer state transitions.
- [Medium] The FIFO watermark interrupt is permanently disabled if updating=
 the watermark register fails.
--

--- Patch [3]: [PATCH v2 3/3] iio: accel: icm42370: Add FIFO buffer functio=
nality ---
commit 04755a7b27e94b2f885caf4cb6fed3815002934a
Author: Kanak Shilledar <kanak.shilledar@axis.com>
Subject: iio: accel: icm42370: Add FIFO buffer functionality

Add support for the hardware FIFO buffer to support high data rate capture.
This includes necessary IIO buffer setup ops, watermark management and FIFO
packet decoding. The accelerometer has 2.25kB FIFO size.

> diff --git a/drivers/iio/accel/inv_icm42370_buffer.c b/drivers/iio/accel/=
inv_icm42370_buffer.c
> new file mode 100644
> index 0000000000000..c6a4d313c92c5
> --- /dev/null
> +++ b/drivers/iio/accel/inv_icm42370_buffer.c
[ ... ]
> +int inv_icm42370_buffer_update_watermark(struct inv_icm42370_data *data)
> +{
[ ... ]
> +	/* changing FIFO watermark requires to turn off watermark interrupt */
> +	ret =3D regmap_update_bits_check(
> +		data->map, INV_ICM42370_REG_INT_SOURCE0,
> +		INV_ICM42370_INT_SOURCE0_FIFO_THS_INT1_EN, 0, &restore);
> +	if (ret)
> +		return ret;
> +
> +	raw_wm =3D INV_ICM42370_FIFO_WATERMARK_VAL(wm_size);
> +	memcpy(data->buffer, &raw_wm, sizeof(raw_wm));
> +	ret =3D regmap_bulk_write(data->map, INV_ICM42370_REG_FIFO_WATERMARK,
> +				data->buffer, sizeof(raw_wm));
> +	if (ret)
> +		return ret;
        ^^^^^^^^^^
[Severity: Medium]
Will this return leave the watermark interrupt permanently disabled? If
regmap_bulk_write() fails, the function exits before the restore block is
reached, which might prevent future watermark interrupts.

> +
> +	/* restore watermark interrupt */
> +	if (restore) {
> +		ret =3D regmap_set_bits(
> +			data->map, INV_ICM42370_REG_INT_SOURCE0,
> +			INV_ICM42370_INT_SOURCE0_FIFO_THS_INT1_EN);
[ ... ]
> +static int inv_icm42370_buffer_postenable(struct iio_dev *indio_dev)
> +{
[ ... ]
> +	/* when FIFO_CONFIG_STREAM bit is set FIFO is enabled, so
> +	 * increase the count
> +	 */
> +	data->fifo.on++;
> +
> +	ret =3D regmap_bulk_read(data->map, INV_ICM42370_REG_FIFO_COUNT, data->=
buffer,
> +			       2);
> +	if (ret)
> +		return ret;
        ^^^^^^^^^^
[Severity: Medium]
Does this error path leak the internal FIFO state tracker? The
data->fifo.on counter is incremented, but subsequent failures exit the
function without rolling it back. This might lead to silent failures when
enabling data capture later.

> +
> +	ret =3D regmap_set_bits(data->map, INV_ICM42370_REG_INT_SOURCE0,
> +			      INV_ICM42370_INT_SOURCE0_FIFO_THS_INT1_EN);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
[ ... ]
> +static int inv_icm42370_buffer_postdisable(struct iio_dev *indio_dev)
> +{
[ ... ]
> +	guard(mutex)(&data->lock);
> +
> +	inv_sensors_timestamp_apply_odr(ts, 0, 0, 0);
> +
> +	ret =3D inv_icm42370_buffer_set_fifo_en(data, data->fifo.en & ~sensor);
> +	if (ret)
> +		goto out_unlock;
> +
> +	*watermark =3D 0;
> +	ret =3D inv_icm42370_buffer_update_watermark(data);
> +	if (ret)
> +		goto out_unlock;
        ^^^^^^^^^^^^^^
[Severity: Medium]
If the watermark update fails, could this leave the sensor hardware powered
on indefinitely? The failure skips the INV_ICM42370_SENSOR_MODE_OFF
configuration below, which might cause a power leak.

> +
> +	conf.mode =3D INV_ICM42370_SENSOR_MODE_OFF;
> +	ret =3D inv_icm42370_set_accel_conf(data, &conf, &sleep_sensor);
> +	if (ret)
> +		goto out_unlock;
> +
> +out_unlock:
> +	/* sleep maximum required time */
> +	sleep =3D max(sleep_sensor, sleep_temp);
> +	if (sleep)
> +		msleep(sleep);
> +
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return ret;
        ^^^^^^^^^^
[Severity: Medium]
Are we holding the mutex during the sleep and autosuspend operations? Since
guard() is used for locking, but error handling relies on goto out_unlock,
the lock is not released at the label but held until the function exits.

> +}
[ ... ]
> +int inv_icm42370_buffer_fifo_read(struct inv_icm42370_data *data,
> +				  unsigned int max)
> +{
[ ... ]
> +	/* Check and limit number of samples if requested. */
> +	fifo_nb =3D le16_to_cpup(raw_fifo_count);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[Severity: High]
Since the FIFO_COUNT is configured to use Big Endian in buffer_init(), is it
correct to parse it using le16_to_cpup() here? This might cause a massive
miscalculation of the count on little-endian systems.

> +	if (fifo_nb =3D=3D 0)
> +		return 0;
> +	if (max > 0 && fifo_nb > max)
> +		fifo_nb =3D max;
> +
> +	/*
> +	 * Read all FIFO data into the internal buffer, clamping the
> +	 * device-reported count to the buffer capacity.
> +	 */
> +	data->fifo.count =3D min(fifo_nb * packet_size, INV_ICM42370_FIFO_SIZE_=
MAX);
                               ^^^^^^^^^^^^^^^^^^^^^
[Severity: High]
Does this inadvertently inflate the read length? If the hardware count is
configured to report bytes instead of samples, multiplying it by packet_size
might result in reading vastly more bytes than the FIFO contains.

> +	ret =3D regmap_noinc_read(data->map, INV_ICM42370_REG_FIFO_DATA,
> +				data->fifo.data, data->fifo.count);
[ ... ]
> +int inv_icm42370_buffer_init(struct inv_icm42370_data *data)
> +{
[ ... ]
> +	/*
> +	 * Default FIFO configuration (bits 6 to 5)
> +	 * - FIFO count in bytes
> +	 * - FIFO count in big endian
> +	 */
> +	val =3D INV_ICM42370_INTF_CONFIG0_FIFO_COUNT_ENDIAN;
> +	ret =3D regmap_update_bits(data->map, INV_ICM42370_REG_INTF_CONFIG0,
> +				 GENMASK(6, 5), val);
[ ... ]
> diff --git a/drivers/iio/accel/inv_icm42370_core.c b/drivers/iio/accel/in=
v_icm42370_core.c
> index 6266362e83f6a..b1713a2f533c8 100644
> --- a/drivers/iio/accel/inv_icm42370_core.c
> +++ b/drivers/iio/accel/inv_icm42370_core.c
[ ... ]
> +/* enable accelerometer sensor and FIFO write */
> +static int inv_icm42370_accel_update_scan_mode(struct iio_dev *indio_dev,
> +					       const unsigned long *scan_mask)
> +{
> +	struct inv_icm42370_data *st =3D iio_priv(indio_dev);
> +	struct inv_icm42370_conf conf =3D INV_ICM42370_SENSOR_CONF_INIT;
> +	unsigned int fifo_en =3D 0;
> +	unsigned int sleep_accel =3D 0;
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
        ^^^^^^^^^^^^^^^^^^^^^^^
[Severity: High]
Is it possible this function gets called when the device is asleep? The IIO
core might invoke update_scan_mode before preenable. Missing a
pm_runtime_resume_and_get() here could lead to hardware accesses on a
suspended device.

> +
> +	if (*scan_mask & INV_ICM42370_SCAN_MASK_ACCEL_3AXIS) {
> +		/* enable accel sensor */
> +		conf.mode =3D st->conf.mode;
> +		conf.filter =3D st->filter;
> +
> +		ret =3D inv_icm42370_set_accel_conf(st, &conf, &sleep_accel);
> +		if (ret)
> +			goto out;
> +
> +		fifo_en |=3D INV_ICM42370_SENSOR_ACCEL;
> +	}
> +
> +	/* update data FIFO write */
> +	ret =3D inv_icm42370_buffer_set_fifo_en(st, fifo_en | st->fifo.en);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[Severity: High]
What happens if userspace requests only the TEMP channel? In that case,
fifo_en evaluates to 0, meaning the sensor isn't powered on and the FIFO
won't fill. This might cause the IIO buffer to hang indefinitely since
watermark interrupts would never be generated.

[Severity: Medium]
Also, if inv_icm42370_buffer_set_fifo_en() fails here, the function returns
without rolling back the sensor to its OFF state. Could this leave the sens=
or
hardware powered on indefinitely and drain power?

> +
> +out:
> +	if (sleep_accel)
> +		msleep(sleep_accel);
> +
> +	return ret;
        ^^^^^^^^^^
[Severity: Medium]
Similar to the postdisable function, does using goto out with guard() cause
the mutex to be held during the msleep() call, stalling concurrent driver
operations?

> +}
[ ... ]
> +static int inv_icm42370_accel_hwfifo_set_watermark(struct iio_dev *indio=
_dev,
> +						   unsigned int val)
> +{
> +	struct inv_icm42370_data *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	st->fifo.watermark.accel =3D val;
> +	ret =3D inv_icm42370_buffer_update_watermark(st);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[Severity: High]
Does this interact with hardware registers without acquiring PM runtime? As=
 a
sysfs callback, this might be executed while the device is in auto-suspend,
causing writes to a sleeping device.

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
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[Severity: High]
Is it possible this flush sequence executes on a suspended device? There
doesn't appear to be a pm_runtime lock here before accessing the hardware
registers.

> +	if (!ret)
> +		ret =3D st->fifo.nb.accel;
> +
> +	mutex_unlock(&st->lock);
> +
> +	return ret;
> +}
[ ... ]
>  struct iio_dev *inv_icm42370_accel_init(struct iio_dev *indio_dev,
>  					struct inv_icm42370_data *data)
>  {
[ ... ]
>  	indio_dev->name =3D "inv_icm42370";
>  	indio_dev->info =3D &inv_icm42370_info;
> -	indio_dev->modes =3D INDIO_DIRECT_MODE;
> +	indio_dev->modes =3D INDIO_DIRECT_MODE | INDIO_ALL_BUFFER_MODES;
>  	indio_dev->channels =3D inv_icm42370_accel_channels;
>  	indio_dev->num_channels =3D ARRAY_SIZE(inv_icm42370_accel_channels);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[Severity: High]
Could the absence of indio_dev->available_scan_masks here cause data
corruption? Without it, if a user enables only a subset of channels, the IIO
core will expect the buffer to be packed densely.

> =20
> +	ret =3D devm_iio_kfifo_buffer_setup(dev, indio_dev,
> +					  &inv_icm42370_buffer_ops);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	return indio_dev;
>  }
> =20
> +int inv_icm42370_accel_parse_fifo(struct iio_dev *indio_dev)
> +{
[ ... ]
> +		if (temp)
> +			buffer.temp =3D (s16)*temp * 64;
> +		else
> +			buffer.temp =3D (s16)INV_ICM42370_DATA_INVALID;
> +
> +		ts_val =3D inv_sensors_timestamp_pop(ts);
> +		iio_push_to_buffers_with_timestamp(indio_dev, &buffer, ts_val);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^
[Severity: High]
Because the driver unconditionally pushes a fixed-layout buffer without man=
ual
repacking, if available_scan_masks is missing, the IIO core will read the
Y-axis bytes as Z-axis data when certain channels are disabled. Is there a
plan to provide the available scan masks?

> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-b4-inv_icm=
42370p-v2-0-11aedfdf76d3@axis.com?part=3D3
