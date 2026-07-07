Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC343ACA45
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783421830; cv=none; b=C664A50QghHs/i4cQup+P2/ZqijLwv4be2FzJWd3URX75FzKF6IBWXhYLP/qRo4a4Kt1fS30AIDQDfY0e10TaiPahh3pTn5Z/5ntvQCN8Y93fX/qxNc/mmOki9W9ztkyqTKbngrHyyohJvlwfJ3056QlvYB5uOmbF0BBHYe7FPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783421830; c=relaxed/simple;
	bh=wmOiwD2l/vN3WmRj68hB3aiMRAdyAdq8JK7/ag588Hw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r5xJKIeyyYQNUYiBtstexcSNsiTP6iZ7j/H7/iYC5b+VD3n35qYoueub5fv5qcc+5+CsW/+RWerLk59FqKVyw1dN7tyqBdbjIXJQeJHEwHaSdf2kdRD6mhJ5uJ3Kc6nkR7FJd6vklR9as7j1jBwFuIoIXsI3dKcLnnE9/C+cAyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/cMM7Q+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/cMM7Q+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361871F000E9;
	Tue,  7 Jul 2026 10:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783421828;
	bh=mx5sM42F3J7FC/0ewbHZKc2X1hsTsMBfYWJip0dy9gY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b/cMM7Q+ujnANFxxBeklXEpAP+xcCo0TMo8Egy0UPnCc0m356YSFuisElQ6/1YNDQ
	 OEay29jAG2HfhIc51rDp/XGyq4OmvFcKIP+Irk3910ZRhRU8oJXoFGHlhB2bMmoS9w
	 JOxVHq5pR0FAQj/fygf1El8l/fj0wFuh4uCYrvFHj2Y0njpWfVnuFpovDDlyYjUxLr
	 GvUn9uxbgDna9XUylQSGWAg0EvHVnFbXgPFXjvAnLS3TWy0HTWHT+mBe6M1VQjH8kc
	 pJWNoMK61i+lvO/TmEXL25S1ewMNNIL5i5OHIKVL5Mhw/a+4cNo2x3tB1gAY1DNzor
	 0XwFuogwvUF0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] iio: health: add MAX86150 ECG and PPG biosensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Shofiqul Islam" <shofiqtest@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707104234.1957104-3-shofiqtest@gmail.com>
References: <20260707104234.1957104-3-shofiqtest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 10:57:07 +0000
Message-Id: <20260707105708.361871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] Lack of IRQ synchronization during buffer predisable leads to =
Use-After-Free/NULL-pointer dereference of `active_scan_mask`.
- [High] FIFO rollover and full condition handling causes an IRQ storm and =
deadlocks data capture.
- [High] Stale interrupt status flags are not cleared before polling in dir=
ect read mode, returning garbage data.
- [High] Interrupt handler returns IRQ_HANDLED on I2C read failure, causing=
 a continuous IRQ storm.
- [High] Concurrent access to shared `fifo_raw` buffer causes data corrupti=
on and unsafe DMA memory sharing.
- [Medium] Missing Power-On Reset (POR) delay after enabling regulators cau=
ses I2C communication to fail.
--

--- Patch [2]: [PATCH v8 2/2] iio: health: add MAX86150 ECG and PPG biosens=
or driver ---
commit d1ed22d53669726571ae3dc244a73238d9b89d76
Author: Md Shofiqul Islam <shofiqtest@gmail.com>

iio: health: add MAX86150 ECG and PPG biosensor driver

Add a new IIO driver for the Analog Devices MAX86150 integrated
biosensor. The device has a 32-entry hardware FIFO with a configurable
almost-full interrupt.

> diff --git a/drivers/iio/health/max86150.c b/drivers/iio/health/max86150.c
> new file mode 100644
> index 0000000000000..1e3d28cb41b70
> --- /dev/null
> +++ b/drivers/iio/health/max86150.c

[ ... ]

> +static int max86150_read_one_sample(struct max86150_data *data,
> +				    u32 *ppg_red, u32 *ppg_ir, s32 *ecg)
> +{
> +	int ret;
> +
> +	ret =3D regmap_noinc_read(data->regmap, MAX86150_REG_FIFO_DATA,
> +				data->fifo_raw, MAX86150_SAMPLE_BYTES);

[Severity: High]
Are there concurrent access issues with the shared fifo_raw buffer?

The data->fifo_raw buffer appears to be shared between direct mode=20
(max86150_read_raw) and buffer mode (max86150_interrupt_handler). Since=20
there is no private mutex, both contexts might execute=20
max86150_read_one_sample() simultaneously.=20

Could this pass the same fifo_raw pointer to regmap_noinc_read()=20
concurrently, potentially causing overlapping DMA maps or interleaved write=
s=20
to the buffer?

[ ... ]

> +static int max86150_read_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int *val, int *val2, long mask)
> +{
> +	struct max86150_data *data =3D iio_priv(indio_dev);
> +	unsigned int ppg_rdy_status;
> +	u32 ppg_red, ppg_ir;
> +	s32 ecg;
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		if (!iio_device_claim_direct(indio_dev))
> +			return -EBUSY;
> +
> +		ret =3D regmap_clear_bits(data->regmap, MAX86150_REG_SYS_CTRL,
> +					MAX86150_SYS_CTRL_SHDN);
> +		if (ret)
> +			goto out_shutdown;
> +
> +		ret =3D regmap_write(data->regmap, MAX86150_REG_FIFO_WR_PTR, 0);
> +		if (ret)
> +			goto out_shutdown;
> +		ret =3D regmap_write(data->regmap, MAX86150_REG_OVF_COUNTER, 0);
> +		if (ret)
> +			goto out_shutdown;
> +		ret =3D regmap_write(data->regmap, MAX86150_REG_FIFO_RD_PTR, 0);
> +		if (ret)
> +			goto out_shutdown;
> +
> +		/*
> +		 * Poll PPG_RDY rather than sleeping a fixed interval -- the
> +		 * internal oscillator may start slower than nominal, leaving
> +		 * the FIFO empty if we read too early.
> +		 */
> +		ret =3D regmap_read_poll_timeout(data->regmap,
> +					       MAX86150_REG_INT_STATUS1,
> +					       ppg_rdy_status,
> +					       ppg_rdy_status & MAX86150_INT_PPG_RDY,
> +					       1000, 25000);

[Severity: High]
Will this polling loop exit prematurely if there are stale interrupt status=
=20
flags?

If MAX86150_INT_PPG_RDY was set during a previous active period, the=20
INT_STATUS1 register might still hold this bit. Because the driver resets=20
the FIFO pointers to 0 and immediately calls regmap_read_poll_timeout()=20
without doing a dummy read to clear INT_STATUS1, the loop could exit=20
immediately on the first iteration.=20

The driver would then read an empty FIFO and return invalid data.

[ ... ]

> +static int max86150_buffer_predisable(struct iio_dev *indio_dev)
> +{
> +	struct max86150_data *data =3D iio_priv(indio_dev);
> +
> +	regmap_write(data->regmap, MAX86150_REG_INT_ENABLE1, 0);
> +	regmap_set_bits(data->regmap, MAX86150_REG_SYS_CTRL,
> +			MAX86150_SYS_CTRL_SHDN);
> +	return 0;
> +}

[Severity: Critical]
Is it possible for the interrupt handler to execute after this function=20
returns?

When the IIO buffer is disabled, this stops new hardware interrupts via I2C=
,=20
but it doesn't call synchronize_irq(). The IIO core will then proceed to=20
free indio_dev->active_scan_mask and set it to NULL.

If the threaded IRQ handler is currently executing or preempted on another=
=20
CPU, won't it subsequently call test_bit(..., indio_dev->active_scan_mask)=
=20
and dereference the NULL pointer?

[ ... ]

> +static irqreturn_t max86150_interrupt_handler(int irq, void *private)
> +{
> +	struct iio_dev *indio_dev =3D private;
> +	struct max86150_data *data =3D iio_priv(indio_dev);
> +	unsigned int status, wr_ptr, rd_ptr, ovf;
> +	u32 ppg_red, ppg_ir;
> +	s32 ecg;
> +	s64 ts;
> +	int ret, n_avail, i, j;
> +
> +	ret =3D regmap_read(data->regmap, MAX86150_REG_INT_STATUS1, &status);
> +	if (ret)
> +		return IRQ_HANDLED;

[Severity: High]
Does returning IRQ_HANDLED on read failure risk causing an IRQ storm?

If the I2C read fails and the handler returns IRQ_HANDLED, the kernel will=
=20
unmask the interrupt line. Because the interrupt is level-triggered and the=
=20
device still holds the line asserted, it will immediately fire again.=20
Returning IRQ_NONE would allow the kernel's spurious interrupt detector to=
=20
safely disable the line.

[ ... ]

> +	ret =3D regmap_read(data->regmap, MAX86150_REG_FIFO_WR_PTR, &wr_ptr);
> +	if (ret)
> +		return IRQ_HANDLED;
> +	ret =3D regmap_read(data->regmap, MAX86150_REG_FIFO_RD_PTR, &rd_ptr);
> +	if (ret)
> +		return IRQ_HANDLED;
> +
> +	n_avail =3D (wr_ptr - rd_ptr) & (MAX86150_FIFO_DEPTH - 1);
> +	if (!n_avail)
> +		return IRQ_HANDLED;

[Severity: High]
Can n_avail evaluate to 0 when the FIFO is completely full?

If the CPU is delayed and the 32-entry FIFO fills completely, wr_ptr wraps=
=20
and equals rd_ptr. The calculation (wr_ptr - rd_ptr) & 31 evaluates to 0.

Since the device initialization enables MAX86150_FIFO_CONFIG_ROLLOVER_EN,=20
the hardware OVF_COUNTER is never incremented. The handler will see=20
OVF_COUNTER =3D=3D 0 and n_avail =3D=3D 0, and exit with IRQ_HANDLED withou=
t=20
reading any data.=20

Could this cause an IRQ storm as the hardware re-asserts the A_FULL=20
interrupt immediately because the FIFO remains full?

[ ... ]

> +static int max86150_probe(struct i2c_client *client)
> +{
> +	struct iio_dev *indio_dev;
> +	struct max86150_data *data;
> +	unsigned int part_id;
> +	int ret;
> +
> +	indio_dev =3D devm_iio_device_alloc(&client->dev, sizeof(*data));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	data =3D iio_priv(indio_dev);
> +
> +	ret =3D devm_regulator_get_enable(&client->dev, "vdd");
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to get/enable vdd supply\n");
> +
> +	ret =3D devm_regulator_get_enable(&client->dev, "vled");
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to get/enable vled supply\n");
> +
> +	data->regmap =3D devm_regmap_init_i2c(client, &max86150_regmap_config);
> +	if (IS_ERR(data->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(data->regmap),
> +				     "Failed to initialise regmap\n");
> +
> +	ret =3D regmap_read(data->regmap, MAX86150_REG_PART_ID, &part_id);

[Severity: Medium]
Is a Power-On Reset delay needed after enabling the regulators?

The regulators might need time to stabilize, and the device typically=20
requires a startup period before its I2C interface becomes responsive.=20
If regmap_read() happens immediately after enabling the supplies, can this=
=20
lead to an I2C communication failure during probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707104234.1957=
104-1-shofiqtest@gmail.com?part=3D2
