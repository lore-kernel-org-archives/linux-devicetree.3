Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C3A348C65
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782224051; cv=none; b=ba2GAr58V95AGECORH0tRJmAa+tGkM68KGZejPdjzfki5Inzf/U2fOrKgCR+S5134Kc2PtwNpGy59h5yoeblHODKNGwuI+KJJ6RO20ZPT5ot4fDhtbH66Drzw3CPAciapI2403flD0cAhPNoIOXLw/PdWWVwZ+hvbNcIEuH18jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782224051; c=relaxed/simple;
	bh=wtVbK53tJxRGkVfM+p6hAaYu/QyOOGieYrfw8GaA4bw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jj8cHYIu+EmTdDW5v0x60w5Nj+XGgwzj3slCfqjeZiJ5ZpKKchSn8bfFxMuSP231XbJYMQyn9KsZDBSxnhNGcIG4k1UtaiqfkfqCXSpy6Db6XetQ7N6oPxcYxQZnmYd9/OIte6EM8YEZ0fkQp77CeaLraIpjoZTm7u9+yJVI0XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MoDmlFe9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MoDmlFe9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323E81F000E9;
	Tue, 23 Jun 2026 14:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782224049;
	bh=H3T/4sMpZtgJsf8hgfjAJDKq6KfUBZszlWA18EKDI58=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MoDmlFe93RZz/8kiuANaC6o5negFcTU7IAXBMv8nz86KrJwVe1RLSdcbqjO06TIpJ
	 lbF+53uYlExGEe3yI+0fnD+rw1QNYS7bwF8FoafeS19Iiog1WjReFkxA9c139Pbues
	 Okwcu4a+jsCiU9ejaQBE0egfkyYMgcUOCzRt4s7GzOjoYWCyOkDgWFzk8J19/zZwYa
	 JwGRQ8FZK5Rgel75sFKqEeiHiSa5hn12Gxks1UaOVU/jnLyNnJ1UEYASvq9y1KJqav
	 6FsemtdH1RkDJdjs8/HVFgOE9REiK9H6f8+eiap8mbBOaFrTEyXVCOMtu9UW9SkscW
	 yhPYU10/dBYQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] iio: health: add MAX86150 ECG and PPG biosensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Shofiqul Islam" <shofiqtest@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260623140113.12574-2-shofiqtest@gmail.com>
References: <20260623140113.12574-1-shofiqtest@gmail.com>
 <20260623140113.12574-2-shofiqtest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 14:14:08 +0000
Message-Id: <20260623141409.323E81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Buffer overflow during triggered buffer capture.
- [High] Missing IIO direct mode locking allows concurrent sysfs reads to s=
ilently corrupt the hardware FIFO state.
- [High] Calculation of available FIFO samples evaluates to 0 when the FIFO=
 is fully saturated, leading to a permanent capture stall.
- [High] Buffer data packing ignores `active_scan_mask`, leading to data co=
rruption when a subset of channels is enabled.
- [High] Requesting an IRQ with `IRQF_ONESHOT` without a threaded handler c=
auses unconditional probe failure.
- [High] Hardware interrupt unconditionally enabled at boot can permanently=
 stall the edge-triggered line.
- [Medium] UAPI Endianness Mismatch causing data corruption on Big Endian a=
rchitectures.
- [Medium] Device is left running at full power and emitting interrupts whe=
n the driver is unloaded.
- [Medium] Documented DT regulators `vdd-supply` and `leds-supply` are igno=
red, causing initialization failure on unpowered platforms.
- [Medium] Unbalanced `iio_trigger_get()` causes a reference count memory l=
eak.
--

commit 86527e62ebc7afa90aeb829c2bdf9c041cf99dd9
Author: Md Shofiqul Islam <shofiqtest@gmail.com>

iio: health: add MAX86150 ECG and PPG biosensor driver

The MAX86150 integrates PPG and ECG channels in a single I2C device. The
driver exposes three IIO channels and supports hardware-triggered continuous
low-overhead capture.

> diff --git a/drivers/iio/health/max86150.c b/drivers/iio/health/max86150.c
> new file mode 100755
> index 0000000000000..3cde4af6650b7
> --- /dev/null
> +++ b/drivers/iio/health/max86150.c

[ ... ]

> +struct max86150_data {
> +	struct regmap		*regmap;
> +	struct device		*dev;
> +	struct iio_trigger	*trig;
> +	s32  buf[4] __aligned(8);
> +};

[Severity: High]
Does this buffer have enough space for the 64-bit timestamp?

With three 32-bit channels (12 bytes) and a 64-bit timestamp needing 8-byte
alignment, the timestamp would be placed at byte offset 16. However, this
array is exactly 16 bytes.

Calling iio_push_to_buffers_with_timestamp() in max86150_trigger_handler()
could write the timestamp past the end of the array.

[ ... ]

> +static const struct iio_chan_spec max86150_channels[] =3D {
> +	{
> +		/* PPG Red LED - optical intensity, 19-bit unsigned */
> +		.type               =3D IIO_INTENSITY,
> +		.modified           =3D 1,
> +		.channel2           =3D IIO_MOD_LIGHT_RED,
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> +				      BIT(IIO_CHAN_INFO_SCALE),
> +		.scan_index         =3D MAX86150_IDX_PPG_RED,
> +		.scan_type =3D {
> +			.sign        =3D 'u',
> +			.realbits    =3D 19,
> +			.storagebits =3D 32,
> +			.endianness  =3D IIO_LE,
> +		},

[Severity: Medium]
Since max86150_trigger_handler() places native integers directly into the
buffer without cpu_to_le32() conversions, will this advertise incorrect
endianness to userspace on big endian architectures?

[ ... ]

> +static int max86150_read_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int *val, int *val2, long mask)
> +{
> +	struct max86150_data *data =3D iio_priv(indio_dev);
> +	u32 ppg_red, ppg_ir;
> +	s32 ecg;
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		/*
> +		 * Single-shot path: clear the FIFO so we know we are reading
> +		 * a sample that arrived after this call, not stale data.
> +		 */
> +		ret =3D regmap_write(data->regmap, MAX86150_REG_FIFO_WR_PTR, 0);
> +		if (ret)
> +			return ret;
> +		ret =3D regmap_write(data->regmap, MAX86150_REG_OVF_COUNTER, 0);
> +		if (ret)
> +			return ret;
> +		ret =3D regmap_write(data->regmap, MAX86150_REG_FIFO_RD_PTR, 0);

[Severity: High]
Does this path need iio_device_claim_direct_mode() to prevent concurrent
sysfs reads from silently corrupting the hardware FIFO pointers while a
continuous triggered buffer capture is active?

[ ... ]

> +static irqreturn_t max86150_trigger_handler(int irq, void *p)
> +{
> +	struct iio_poll_func	*pf   =3D p;
> +	struct iio_dev		*idev =3D pf->indio_dev;
> +	struct max86150_data	*data =3D iio_priv(idev);
> +	unsigned int status, wr_ptr, rd_ptr, available;
> +	u32 ppg_red, ppg_ir;
> +	s32 ecg;
> +	int ret;
> +
> +	/*
> +	 * Reading INT_STATUS1 clears the interrupt.  Do this before touching
> +	 * the FIFO so the pin is de-asserted while we drain samples.
> +	 */
> +	ret =3D regmap_read(data->regmap, MAX86150_REG_INT_STATUS1, &status);
> +	if (ret)
> +		goto done;
> +
> +	ret =3D regmap_read(data->regmap, MAX86150_REG_FIFO_WR_PTR, &wr_ptr);
> +	if (ret)
> +		goto done;
> +	ret =3D regmap_read(data->regmap, MAX86150_REG_FIFO_RD_PTR, &rd_ptr);
> +	if (ret)
> +		goto done;
> +
> +	/*
> +	 * Number of unread samples.  The FIFO is circular with depth 32, so
> +	 * wrap with (depth - 1) as mask.
> +	 */
> +	available =3D (wr_ptr - rd_ptr) & (MAX86150_FIFO_DEPTH - 1);

[Severity: High]
When the 32-entry FIFO becomes perfectly full and wr_ptr wraps around to
equal rd_ptr, will this evaluate to 0?

If so, the handler might skip the read loop entirely and leave the FIFO ful=
l,
causing the interrupt condition to persist and resulting in an endless
interrupt loop or a permanent capture stall.

> +
> +	while (available--) {
> +		ret =3D max86150_read_one_sample(data, &ppg_red, &ppg_ir, &ecg);
> +		if (ret)
> +			break;
> +
> +		data->buf[MAX86150_IDX_PPG_RED] =3D ppg_red;
> +		data->buf[MAX86150_IDX_PPG_IR]  =3D ppg_ir;
> +		data->buf[MAX86150_IDX_ECG]     =3D ecg;

[Severity: High]
If userspace enables only a subset of the channels (e.g., only ECG), will
this static indexing ignore the active_scan_mask?

IIO expects enabled channels to be tightly packed at the start of the buffe=
r.
If only ECG is enabled, the IIO core calculates the timestamp offset based =
on
a single channel. The static writes here might cause the timestamp to later
overwrite the channel data, corrupting both the measurement and the
timestamp.

[ ... ]

> +static int max86150_chip_init(struct max86150_data *data)
> +{
> +	int ret;
> +
> +	/* Software reset; the bit self-clears within 1 ms */
> +	ret =3D regmap_write(data->regmap, MAX86150_REG_SYS_CTRL,
> +			   MAX86150_SYS_RESET);

[ ... ]

> +	/* Enable FIFO almost-full interrupt only */
> +	return regmap_write(data->regmap, MAX86150_REG_INT_ENABLE1,
> +			    MAX86150_INT_A_FULL);
> +}

[Severity: Medium]
Are there teardown steps needed when the driver is unloaded?

This initialization starts continuous sampling, but no .remove callback or
devm action seems to be registered to write to MAX86150_SYS_SHDN or disable
the interrupts, leaving the device fully active on unload.

[Severity: High]
Could enabling the hardware interrupt here before the IIO buffer is active
cause the edge-triggered interrupt pin to get permanently stuck?

If the sensor asserts the active-low pin early, the hardirq handler will
fire but won't read INT_STATUS1 to clear the line (since the threaded handl=
er
is only active when the buffer is enabled). The interrupt controller might
ignore the stuck low line forever, breaking capture once the buffer is
actually started.

[ ... ]

> +static int max86150_probe(struct i2c_client *client)
> +{
> +	struct iio_dev		*indio_dev;
> +	struct max86150_data	*data;
> +	unsigned int		 part_id;
> +	int ret;
> +
> +	indio_dev =3D devm_iio_device_alloc(&client->dev, sizeof(*data));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	data     =3D iio_priv(indio_dev);
> +	data->dev =3D &client->dev;
> +
> +	data->regmap =3D devm_regmap_init_i2c(client, &max86150_regmap_config);
> +	if (IS_ERR(data->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(data->regmap),
> +				     "Failed to initialise regmap\n");

[Severity: Medium]
Will this fail to probe on unpowered platforms since the documented
devicetree regulators vdd-supply and leds-supply are not requested or
enabled before I2C communication starts?

[ ... ]

> +	if (client->irq > 0) {
> +		data->trig =3D devm_iio_trigger_alloc(&client->dev,
> +						    "%s-dev%d",
> +						    indio_dev->name,
> +						    iio_device_id(indio_dev));
> +		if (!data->trig)
> +			return -ENOMEM;
> +
> +		ret =3D devm_request_irq(&client->dev, client->irq,
> +				       iio_trigger_generic_data_rdy_poll,
> +				       IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +				       "max86150", data->trig);

[Severity: High]
Will the irq core reject this request during probe?

The interrupt core requires a threaded handler when IRQF_ONESHOT is used,
but iio_trigger_generic_data_rdy_poll is passed as the hardirq handler with
no threaded handler provided.

> +		if (ret)
> +			return dev_err_probe(&client->dev, ret,
> +					     "Cannot request IRQ %d\n",
> +					     client->irq);
> +
> +		iio_trigger_set_drvdata(data->trig, indio_dev);
> +
> +		ret =3D devm_iio_trigger_register(&client->dev, data->trig);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret,
> +					     "Cannot register trigger\n");
> +
> +		indio_dev->trig =3D iio_trigger_get(data->trig);
> +	}

[Severity: Medium]
Is there a corresponding iio_trigger_put() needed here? Without it, the
trigger reference count could be leaked when the device is unbound or if a
subsequent probe step fails.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623140113.1257=
4-2-shofiqtest@gmail.com?part=3D1
