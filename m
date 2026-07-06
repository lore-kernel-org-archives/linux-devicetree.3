Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8218D386435
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 22:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783378734; cv=none; b=XZ9Onz4tyWAEOhhuiWVkqo02pUXohDXsY7Yg4nQrq1luIBXTymEYxj4xvrAoN3Id0KyPxNNmZOLFxMIUoXyCwAe/KJQFdVLYOyWiG5hkb3RZyaxsUSkUqQWA+fwnHVo8tljb7mwoDeSSZ506UyBgf+k4Yj8b+D4MfvecKHAdx30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783378734; c=relaxed/simple;
	bh=HQkXOK3MfJ1HzGZczJyv9uBdCeC7vzC92q8opHdIuBU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dIyeETas8zdkF8TSu4ZTWw68PoYZsaFXGF2+cA5Ms8L/kVYjaT4DFSuAxv5wu8MZsL9hH1sTYkxzJbLFOWVW/i/Z/FzhWsGszDRvsDKyUQVa4Feu6VL65GWj114fAKktmqDJ+bmo1Zx+Pe526ooAQ9dTfhUzBy5IxiYd4uBbI6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oE3iZch+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oE3iZch+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE261F000E9;
	Mon,  6 Jul 2026 22:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783378733;
	bh=ZXY2rJUwS5YYvIfb/Dqu6ZR7HCkRxSDxKJpLB/rk1D8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oE3iZch+TfqhcbnaF8Pzy6MPL19odphTtL3LCywnSVdOQkZLlvRPa75YFkN9y8/Ks
	 Mn8mma/wTHSEDNHeebNrA/hsqSDFD/kujlXFigUVhbuqlxfhFO5ValRC37I+l6E0fz
	 qcrxHTxdvg7PzipmTSP7rT81zfBjc4yv1H2+VHV0eUZEDmkkF+wF4uqQi1CVO7srUP
	 NSs8b5IXjUHwqhr7M7G19B9AmcLGuK3V+UWDk978HZx787NZCW2ODdFvOU0oBI9PC9
	 LcgUoLHrcmRhPAFbM/YHGb8aSp35szcBbKNTr3OfbzxUkB5OvLkpnFz18LOc0YXGr3
	 01fL0NQnqmzBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 v7 2/3] iio: health: add MAX86150 ECG and PPG
 biosensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Shofiqul Islam" <shofiqtest@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260706223930.1807714-3-shofiqtest@gmail.com>
References: <20260706223930.1807714-1-shofiqtest@gmail.com>
 <20260706223930.1807714-3-shofiqtest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 22:58:52 +0000
Message-Id: <20260706225853.2FE261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Unsynchronized threaded IRQ handler causes a data race on `data->f=
ifo_raw` with sysfs raw reads.
- [High] The threaded interrupt handler can dereference a NULL `indio_dev->=
active_scan_mask` during buffer teardown.
- [Medium] Stale `MAX86150_INT_PPG_RDY` interrupt status causes `read_raw` =
to incorrectly read an empty FIFO.
- [Medium] The FIFO available sample calculation evaluates to 0 when the FI=
FO is perfectly full, dropping valid data.
--

--- Patch [2]: [PATCH v7 v7 2/3] iio: health: add MAX86150 ECG and PPG bios=
ensor driver ---
commit fed360c474511b667d4da2e81a88fe147d4dc428
Author: Md Shofiqul Islam <shofiqtest@gmail.com>

iio: health: add MAX86150 ECG and PPG biosensor driver

Add a new IIO driver for the Analog Devices MAX86150 integrated
biosensor, which combines two PPG optical channels (Red/IR LED) and
one ECG biopotential channel in a single I2C device.

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
Can this result in a data race on data->fifo_raw?

When the IIO buffer is disabled, max86150_buffer_predisable() masks the
interrupt in hardware but doesn't synchronize the threaded IRQ handler (e.g=
.,
via disable_irq()).

If a delayed IRQ handler runs concurrently with a sysfs raw read triggered
via max86150_read_raw(), the raw read will successfully claim direct mode
(since the core considers the buffer disabled) and both threads will execute
max86150_read_one_sample() concurrently.

> +	if (ret)
> +		return ret;

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

[Severity: Medium]
Will this incorrectly succeed immediately if there is a stale interrupt fla=
g?

regmap_read_poll_timeout() performs an immediate read before sleeping. If
MAX86150_INT_PPG_RDY is already set from previous activity, it will falsely
succeed, bypassing the wait for a new sample.

Because the FIFO pointers were just reset to 0, reading from FIFO_DATA at
this point will read an empty FIFO, resulting in corrupted output. Does
INT_STATUS1 need to be cleared before polling?

> +		if (ret)
> +			goto out_shutdown;

[ ... ]

> +static int max86150_buffer_predisable(struct iio_dev *indio_dev)
> +{
> +	struct max86150_data *data =3D iio_priv(indio_dev);
> +
> +	regmap_write(data->regmap, MAX86150_REG_INT_ENABLE1, 0);

[Severity: High]
Does this leave the threaded interrupt handler unsynchronized during teardo=
wn?

Since this only disables the interrupt in hardware without calling
disable_irq(), a delayed threaded interrupt handler can still execute after
the IIO core has disabled the buffer and freed indio_dev->active_scan_mask.

> +	regmap_set_bits(data->regmap, MAX86150_REG_SYS_CTRL,
> +			MAX86150_SYS_CTRL_SHDN);
> +	return 0;
> +}

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
> +
> +	if (!(status & MAX86150_INT_A_FULL))
> +		return IRQ_NONE;
> +
> +	ret =3D regmap_read(data->regmap, MAX86150_REG_OVF_COUNTER, &ovf);
> +	if (ret)
> +		return IRQ_HANDLED;
> +
> +	if (ovf > 0) {
> +		/* FIFO overflowed; timestamps are unreliable - flush and discard */
> +		regmap_write(data->regmap, MAX86150_REG_FIFO_WR_PTR, 0);
> +		regmap_write(data->regmap, MAX86150_REG_OVF_COUNTER, 0);
> +		regmap_write(data->regmap, MAX86150_REG_FIFO_RD_PTR, 0);
> +		return IRQ_HANDLED;
> +	}
> +
> +	ret =3D regmap_read(data->regmap, MAX86150_REG_FIFO_WR_PTR, &wr_ptr);
> +	if (ret)
> +		return IRQ_HANDLED;
> +	ret =3D regmap_read(data->regmap, MAX86150_REG_FIFO_RD_PTR, &rd_ptr);
> +	if (ret)
> +		return IRQ_HANDLED;
> +
> +	n_avail =3D (wr_ptr - rd_ptr) & (MAX86150_FIFO_DEPTH - 1);
> +	if (!n_avail)

[Severity: Medium]
Does this calculation incorrectly evaluate to 0 when the FIFO is perfectly
full?

If exactly 32 samples are written by the hardware before the interrupt
handler runs, the 5-bit wr_ptr wraps around and equals rd_ptr (but
OVF_COUNTER is still 0).

The modulo arithmetic (wr_ptr - rd_ptr) & (MAX86150_FIFO_DEPTH - 1) will
evaluate to 0, causing the driver to unconditionally drop all 32 valid
samples instead of reading them.

> +		return IRQ_HANDLED;
> +
> +	/*
> +	 * Anchor timestamps to the interrupt time: sample (n_avail - 1) is
> +	 * the newest and corresponds to ts; earlier samples are back-calculated
> +	 * by one sample_period_ns per step.
> +	 */
> +	ts =3D ktime_get_ns();
> +
> +	for (i =3D 0; i < n_avail; i++) {
> +		s64 sample_ts =3D ts -
> +			(s64)(n_avail - 1 - i) * data->sample_period_ns;
> +
> +		ret =3D max86150_read_one_sample(data, &ppg_red, &ppg_ir, &ecg);
> +		if (ret)
> +			break;
> +
> +		j =3D 0;
> +		if (test_bit(MAX86150_IDX_PPG_RED, indio_dev->active_scan_mask))

[Severity: High]
Can this dereference a NULL indio_dev->active_scan_mask?

Because max86150_buffer_predisable() doesn't call disable_irq() to
synchronize with the threaded IRQ handler, this handler could execute after
the IIO core has already disabled the buffer and freed
indio_dev->active_scan_mask, leading to a NULL pointer dereference.

> +			data->buf[j++] =3D ppg_red;
> +		if (test_bit(MAX86150_IDX_PPG_IR, indio_dev->active_scan_mask))
> +			data->buf[j++] =3D ppg_ir;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706223930.1807=
714-1-shofiqtest@gmail.com?part=3D2
