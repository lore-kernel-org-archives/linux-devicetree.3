Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF2730D3EB
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 16:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231150; cv=none; b=Xm+vBz5OSSMwmxMR8/mTv5+NEqaWf+ui+2i0k9O/9NjW/zW/95cKvwPqUvd2PFMqZOZy6UHSTDMvovWEdOGRZ9ejC9O6hF0xcbbTL5Q/+Aa9x35NHIyEiTRTMpPjav2ytePvAQOwOMIfRhFQ63FDWlwBNsaa6rB5iqAQ5oxWxiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231150; c=relaxed/simple;
	bh=Hsu4qLI4zIcFXCDEdHzOx4NbtJmVMBisdLyPIMqO0c0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A9uHLLeZ3HIEk2y7q4HMRa1IAep/ralBcLGJ1E99y67FL1/lsV9mOQZnZ3otQyQT2tt+sKBH/jbVQ1mQkHSpX/3HAdLsDk9xZ0Y1d83oZYcDJFCZI9VPPE/pEWQE0+348PalLJEjA0e51aidzVM6BCuduB2oSvWrf6vQxvAJQ0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1dG7vPk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1dG7vPk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C84A1F00A3A;
	Tue, 23 Jun 2026 16:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782231149;
	bh=no+RguJW26bbaIjkZhONOyifiEo2XcqSn//pw1DWviE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q1dG7vPkAjtrBwxxZBRlgUJg4VCXKTgamqqXgV6vbo8XjYRDXeoEQkEsF62Zsnidn
	 Xwl/H/ObaB2Eleublq2cxMBVZM6g+q524hjx4aKZgEx1145ZbsKjuZeLvBDFxP2Gz5
	 EGe44H+AKo5mdeAqQV8HffmoOrL76TFvUP58acI62u98oZrMYQBDdDIu7b7BpUx5rp
	 L4j0f8bxryNqkJaESEd/znoNGX5JVmy4mk1KLKDFyj0NVTgSh8CwQvCQFA/ekrr1RI
	 0TTMTheOR58E+Fm0DU09ie5RlYd2wJqaH1ZkGo9Q/cDKGP4CeXGdK2RARL6ebL4NuI
	 WlgaJGFI2ZHTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] iio: health: add MAX86150 ECG and PPG biosensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Shofiqul Islam" <shofiqtest@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260623155556.13701-3-shofiqtest@gmail.com>
References: <20260623140113.12574-1-shofiqtest@gmail.com>
 <20260623155556.13701-1-shofiqtest@gmail.com>
 <20260623155556.13701-3-shofiqtest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 16:12:28 +0000
Message-Id: <20260623161229.0C84A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] A stack-allocated buffer is passed to regmap_noinc_read(), which v=
iolates DMA mapping rules and can cause memory corruption if the I2C host c=
ontroller uses DMA.
- [High] Redundant manual invocation of iio_trigger_put via a devm action c=
auses a double put and a use-after-free when the IIO device is released.
- [Medium] The driver exposes unimplemented scale attributes to userspace, =
which unconditionally return an error.
- [Medium] The FIFO drain loop assigns incorrect, heavily clustered timesta=
mps to buffered samples, destroying time-domain information.
- [Medium] The driver incorrectly uses devm_regulator_get_enable for option=
al supplies, erroneously assuming it gracefully handles missing regulators.
- [Medium] Uninitialized padding bytes in data->buf leak previous sensor re=
adings to userspace when fewer than 3 channels are enabled.
- [Medium] Missing FIFO flush when enabling the triggered buffer leaves sta=
le data to be processed immediately.
- [Medium] The driver calls iio_trigger_get() on its own trigger during pro=
be, permanently elevating its own module reference count and preventing mod=
ule unload.
--

commit 28ae0a6a433f8b0e50a4557f62c8f075a8c69870
Author: Md Shofiqul Islam <shofiqtest@gmail.com>

iio: health: add MAX86150 ECG and PPG biosensor driver

This commit adds a driver for the MAX86150 combined ECG and PPG biosensor.
It exposes three IIO channels and supports the IIO triggered buffer path for
continuous data capture.

> diff --git a/drivers/iio/health/max86150.c b/drivers/iio/health/max86150.c
> new file mode 100755
> index 0000000000000..70c51ccb4672b
> --- /dev/null
> +++ b/drivers/iio/health/max86150.c

[ ... ]

> +static const struct iio_chan_spec max86150_channels[] =3D {
> +	{
> +		/* PPG Red LED - optical intensity, 19-bit unsigned */
> +		.type               =3D IIO_INTENSITY,
> +		.modified           =3D 1,
> +		.channel2           =3D IIO_MOD_LIGHT_RED,
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> +				      BIT(IIO_CHAN_INFO_SCALE),

[Severity: Medium]
Will this cause sysfs reads for the scale attribute to always fail?

The driver exposes IIO_CHAN_INFO_SCALE for all channels here, but
max86150_read_raw() unconditionally returns -EINVAL for it. This breaks
the IIO ABI contract and might cause userspace tools to fail when discoveri=
ng
channel properties.

[ ... ]

> +static int max86150_read_one_sample(struct max86150_data *data,
> +				    u32 *ppg_red, u32 *ppg_ir, s32 *ecg)
> +{
> +	u8 buf[MAX86150_SAMPLE_BYTES];  /* 9 bytes */
> +	int ret;
> +
> +	ret =3D regmap_noinc_read(data->regmap, MAX86150_REG_FIFO_DATA,
> +				buf, sizeof(buf));

[Severity: High]
Can this cause memory corruption if the I2C host controller uses DMA?

The buf array is allocated on the stack and passed directly to
regmap_noinc_read(). Since the regmap I2C implementation does not internally
bounce buffers, this passes a stack buffer directly to i2c_transfer(). When
CONFIG_VMAP_STACK is enabled, stack buffers are not physically contiguous a=
nd
are not DMA-safe.

[ ... ]

> +	case IIO_CHAN_INFO_SCALE:
> +		/*
> +		 * TODO: return the hardware scale factor based on the
> +		 * configured PPG ADC range (PPG_ADC_RGE) and ECG PGA gain
> +		 * (ECG_PGA_GAIN).  For PPG, scale is nA/LSB; for ECG, uV/LSB.
> +		 */
> +		return -EINVAL;

[Severity: Medium]
Is it intentional to advertise the scale attribute in the channel spec but
unconditionally reject it here?

This will cause reads of the sysfs attribute to always fail.

[ ... ]

> +static int max86150_set_trigger_state(struct iio_trigger *trig, bool sta=
te)
> +{
> +	struct iio_dev *indio_dev =3D iio_trigger_get_drvdata(trig);
> +	struct max86150_data *data =3D iio_priv(indio_dev);
> +	unsigned int mask =3D state ? MAX86150_INT_A_FULL : 0;
> +
> +	return regmap_write(data->regmap, MAX86150_REG_INT_ENABLE1, mask);

[Severity: Medium]
Does the hardware FIFO need to be flushed before unmasking the interrupt he=
re?

Since the device continuously acquires data into the FIFO starting from
probe(), the FIFO might already be full when userspace enables the triggered
buffer. This would cause the interrupt to assert immediately and drain
extremely stale samples into the new capture session.

[ ... ]

> +		/*
> +		 * Pack only active channels at consecutive positions [0..j-1].
> +		 * iio_push_to_buffers_with_timestamp() uses scan_bytes (which
> +		 * accounts for the active channel count) to place the timestamp,
> +		 * so static indexing would misplace it when fewer than 3
> +		 * channels are enabled.
> +		 */
> +		j =3D 0;
> +		if (test_bit(MAX86150_IDX_PPG_RED, idev->active_scan_mask))
> +			data->buf[j++] =3D ppg_red;
> +		if (test_bit(MAX86150_IDX_PPG_IR, idev->active_scan_mask))
> +			data->buf[j++] =3D ppg_ir;
> +		if (test_bit(MAX86150_IDX_ECG, idev->active_scan_mask))
> +			data->buf[j++] =3D ecg;

[Severity: Medium]
Does this sequentially pack active channels without zeroing the entire buff=
er
first, leaking previous sensor readings?

If the active channel count is reduced, unused array elements in data->buf
retain stale data from previous captures. iio_push_to_buffers_with_timestam=
p()
then copies the entire memory block up to the timestamp offset, exposing the
uninitialized padding bytes to userspace.

> +
> +		iio_push_to_buffers_with_timestamp(idev, data->buf,
> +						   iio_get_time_ns(idev));

[Severity: Medium]
Will this assign the same batch execution time to all historical samples
pulled from the FIFO?

Inside the loop, fetching the current time for every sample means up to 32
samples will receive nearly identical timestamps separated only by I2C read
latencies. This misrepresents the true sample capture period (e.g., 100 Hz).
Should the driver backdate timestamps using the top-half IRQ timestamp
(pf->timestamp) instead?

[ ... ]

> +	/*
> +	 * Enable power supplies before any I2C access.  Both are optional
> +	 * in the device tree (devm_regulator_get_enable returns 0 when the
> +	 * supply is not described), but must be present and stable on real
> +	 * hardware before the first register read.
> +	 */
> +	ret =3D devm_regulator_get_enable(&client->dev, "vdd");

[Severity: Medium]
Will this cause the probe to fail on boards where the regulator is legitima=
tely
missing?

The comment indicates the supply is optional and assumes this API returns 0
when it is not described. However, devm_regulator_get_enable() only returns=
 0
for missing regulators if the system provides a dummy regulator. Otherwise,=
 it
returns -ENODEV, fatally aborting the probe. Should this use
devm_regulator_get_enable_optional() instead?

[ ... ]

> +		ret =3D devm_iio_trigger_register(&client->dev, data->trig);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret,
> +					     "Cannot register trigger\n");
> +
> +		indio_dev->trig =3D iio_trigger_get(data->trig);

[Severity: Medium]
Does this take a circular reference on the driver's own module?

Calling iio_trigger_get() on a trigger owned by this module increments the
module reference count during probe(). The rmmod command will then refuse to
unload the module because the reference count will never drop to 0, permane=
ntly
pinning it in memory.

> +		ret =3D devm_add_action_or_reset(&client->dev,
> +					       max86150_trigger_put,
> +					       data->trig);

[Severity: High]
Can this cause a double-put and a use-after-free when the IIO device is
released?

The IIO core automatically handles releasing the trigger during device
unregistration via iio_device_unregister_trigger_consumer() which implicitly
calls iio_trigger_put(). Because devm actions run subsequently,
max86150_trigger_put() drops the reference a second time, resulting in a
use-after-free of the trigger object.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623155556.1370=
1-1-shofiqtest@gmail.com?part=3D2
