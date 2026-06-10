Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CB4429824
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 15:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106219; cv=none; b=ja1eBO1ZBPlHPpRaVKMW96x6QZqdzGIRzyPwdm1GdFy1wv9gfZDDMgKwjVKYK8hKn9Xcl22JRLbJdB84YHAGXGR8+A/lZbKUC2UkG628slqO41XkCak4Q6pWsu4IFlDeYB5YMIQjZscH8uaesZgofmGnMMjzuf1g/35wBvleQEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106219; c=relaxed/simple;
	bh=NlPfSK3+b7dqk0LYlUyWz5tLUNehL8pPEG8moAVfECc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mPvGFKS1A4FwC2xskdKl8uPtgLWHwQVRkNjBU8HvoBVamhZ6rSV+rkN/4oO7fYhJTM/TOChjEBB+MQBk3KmMeho/x5yo5EDwb6Fci6XZ3xrDsANuIgkFsopS13BBQmKigogBo9cBj6NGE+O8w1tOQhc4uMcpeSa4/SAX+8UAcQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fsdoZZOf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fsdoZZOf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4C21F00893;
	Wed, 10 Jun 2026 15:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781106216;
	bh=57E2e2D5QPKaxYZKLg2rbK8GRfyeGXYaswh4FB4/Opc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fsdoZZOf5EVz/ptvdQsOEgWUES9vSVmtBKQa+EJjUexMC4eBG0LgF/uhV5MTJNb/v
	 x4EdViK51rSKdwNs78ukRyfbsDt9lNHguHbyxtEJR51UamS9bV+8JkdCo5cB/Om0Dl
	 li6MZW2bdaEBF7hRJCIT01Og0vuwS3I/aw/IObQBv4jvlke108+ZauFPzLfalE/5od
	 TiSCAM4CJqc2UU5pvUw1m9kfqfef0kLqb+d9lr3Rc/NDQAK13DUaxroY7tegXEOF6n
	 vIcF2bPQFwBIs5MHRxoozJn7bJWfX9LXhhcpZQ0oZQB4Tsu2TTQSDYHqAX63g5sJBC
	 kQ8bFyOUaL9/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: adc: Add TI ADS1220 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nguyen Minh Tien" <zizuzacker@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260610151342.44274-3-zizuzacker@gmail.com>
References: <20260610151342.44274-3-zizuzacker@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 15:43:35 +0000
Message-Id: <20260610154336.1F4C21F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [Critical] An integer overflow when calculating scale gain leads to a div=
ide-by-zero kernel panic on 32-bit platforms.
- [High] Inconsistent formatting for IIO_CHAN_INFO_SCALE breaks IIO UAPI co=
ntracts. read_raw returns the true scale multiplier, but write_raw expects =
a gain reciprocal, and read_avail exposes gain reciprocals.
- [High] Using iio_validate_scan_mask_onehot breaks timestamp functionality=
 and allows an out-of-bounds array read in buffer_preenable.
- [High] Missing `.validate_trigger` allows external triggers to read async=
hronously without the RDATA command, causing data corruption.
- [High] The `rx` buffer is not DMA-aligned, violating DMA API requirements=
 and risking memory corruption during SPI transfers.
- [High] Disabling the triggered buffer leaves the ADC in continuous conver=
sion mode, causing DRDY interrupt storms.
- [High] Missing mutex lock protection for the shared `st->tx` and `st->rx`=
 buffers.
- [High] Using IRQF_NO_THREAD for a potentially level-triggered interrupt w=
ithout clearing the interrupt in hardware causes an interrupt storm.
- [Medium] ads1220_write_raw modifies channel configuration without claimin=
g direct mode, causing races with active buffers and single-shot conversion=
s.
- [Medium] IIO_CHAN_INFO_OFFSET returns the positive uncalibrated raw value=
 instead of its negated value, causing the offset error to be doubled in us=
er-space.
- [Medium] Concurrent SPI writes can occur during module removal due to inc=
orrect `devm` cleanup order.
- [Medium] ads1220_debugfs_reg_access communicates with the device without =
resuming it from power-down.
- [Medium] The driver unconditionally fails probe if the AVDD regulator vol=
tage cannot be read, breaking support for dummy regulators.
--

commit 1ae738a6247e14166f63bc753a84967fb3d54773
Author: Nguyen Minh Tien <zizuzacker@gmail.com>

iio: adc: Add TI ADS1220 driver

Add an IIO driver for the Texas Instruments ADS1220 24-bit delta-sigma
SPI ADC. The driver supports single-ended and differential voltage
channels described as device-tree child nodes, per-channel programmable
gain (exposed through scale) and data rate, internal and external reference
options, single-shot conversions and a DRDY-interrupt-driven triggered buff=
er.

diff --git a/drivers/iio/adc/ti-ads1220.c b/drivers/iio/adc/ti-ads1220.c
new file mode 100644
index 0000000000000..06bcc88418b4c
--- /dev/null
+++ b/drivers/iio/adc/ti-ads1220.c
[ ... ]
> +struct ads1220_state {
> +	struct spi_device *spi;
> +	struct completion completion;
> +	struct iio_trigger *trig;
> +	struct ads1220_channel_config *channels_cfg;
> +	unsigned int num_channels_cfg;
> +	int vref_uV;
> +	unsigned int vref_source;
> +
> +	/*
> +	 * DMA-safe buffers. tx is used for command/register writes, rx for
> +	 * register and conversion-result reads. scan holds one sample plus a
> +	 * timestamp for the triggered buffer.
> +	 */
> +	u8 tx[2] __aligned(IIO_DMA_MINALIGN);
> +	u8 rx[ADS1220_DATA_BYTES];

[Severity: High]
Does placing the rx array immediately after the 2-byte tx array without
alignment cause it to share the same cacheline? If st->rx is passed to
spi_read(), mapping this unaligned sub-cacheline buffer for DMA might
corrupt adjacent fields on architectures without hardware cache coherence.

> +	struct {
> +		s32 sample;
> +		aligned_s64 timestamp;
> +	} scan;
> +};
[ ... ]
> +static int ads1220_read_raw(struct iio_dev *indio_dev,
> +			    const struct iio_chan_spec *chan,
> +			    int *val, int *val2, long mask)
> +{
> +	struct ads1220_state *st =3D iio_priv(indio_dev);
> +	struct ads1220_channel_config *cfg =3D &st->channels_cfg[chan->address];
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		if (!iio_device_claim_direct(indio_dev))
> +			return -EBUSY;
> +		ret =3D ads1220_single_conversion(st, chan, val, false);
> +		iio_device_release_direct(indio_dev);
> +		return ret;
> +	case IIO_CHAN_INFO_OFFSET:
> +		if (!iio_device_claim_direct(indio_dev))
> +			return -EBUSY;
> +		ret =3D ads1220_single_conversion(st, chan, val, true);

[Severity: Medium]
Should the hardware offset be negated before returning it here?
ads1220_single_conversion() returns the raw measurement of the shorted inpu=
ts.
Since the standard IIO calibration formula applied by user-space is
`value =3D (raw + offset) * scale`, returning a positive offset when the ha=
rdware
reads a positive value will apply the offset in the wrong direction and dou=
ble
the error.

> +		iio_device_release_direct(indio_dev);
> +		return ret;
> +	case IIO_CHAN_INFO_SCALE:
> +		/* scale [mV] =3D vref / (gain * 2^23); gain is a power of two. */
> +		*val =3D st->vref_uV / MILLI;
> +		*val2 =3D (chan->scan_type.realbits - 1) + ilog2(cfg->gain);
> +		return IIO_VAL_FRACTIONAL_LOG2;

[Severity: High]
Are the IIO_CHAN_INFO_SCALE interfaces handling values symmetrically?
ads1220_read_raw() returns the actual physical scale multiplier here, but
ads1220_write_raw() treats the user input as a gain reciprocal, and
ads1220_read_avail() exposes gain reciprocals instead of voltage scales.
If a user reads the scale and writes the exact same value back, could this
evaluate to an invalid gain and return -EINVAL?

> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		*val =3D cfg->datarate;
> +		return IIO_VAL_INT;
> +	default:
> +		return -EINVAL;
> +	}
> +}
[ ... ]
> +static int ads1220_write_raw(struct iio_dev *indio_dev,
> +			     const struct iio_chan_spec *chan,
> +			     int val, int val2, long mask)
> +{
> +	struct ads1220_state *st =3D iio_priv(indio_dev);
> +	struct ads1220_channel_config *cfg =3D &st->channels_cfg[chan->address];
> +	unsigned int gain;
> +	int i;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE:
> +		/* The available scales are the gain reciprocals (e.g. 1/4). */
> +		if (val =3D=3D 0 && val2 =3D=3D 0)
> +			return -EINVAL;
> +
> +		gain =3D MICRO / (val * MICRO + val2);

[Severity: Critical]
Can the expression `(val * MICRO + val2)` overflow on 32-bit platforms if a
user writes a crafted string (e.g., "4294.967296") to the sysfs scale
attribute? If the multiplication wraps to exactly zero, does the subsequent
`gain =3D MICRO / ...` division result in a divide-by-zero kernel panic?

> +		if (!is_power_of_2(gain) || gain > BIT(ADS1220_NUM_GAINS - 1))
> +			return -EINVAL;
> +		if (cfg->single_ended && gain > ADS1220_MAX_SE_GAIN)
> +			return -EINVAL;
> +
> +		cfg->gain =3D gain;
> +		return 0;
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		for (i =3D 0; i < ARRAY_SIZE(ads1220_datarates); i++) {
> +			if (ads1220_datarates[i] =3D=3D val) {
> +				cfg->datarate =3D val;

[Severity: Medium]
Does modifying cfg->gain and cfg->datarate in ads1220_write_raw() require
serialization via iio_device_claim_direct()? Modifying these without the lo=
ck
might race with an active triggered buffer or single-shot conversions,
potentially desynchronizing driver state and hardware or corrupting timeout
calculations.

> +				return 0;
> +			}
> +		}
> +		return -EINVAL;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int ads1220_debugfs_reg_access(struct iio_dev *indio_dev,
> +				      unsigned int reg, unsigned int writeval,
> +				      unsigned int *readval)
> +{
> +	struct ads1220_state *st =3D iio_priv(indio_dev);
> +	u8 val;
> +	int ret;
> +
> +	if (reg > ADS1220_MAX_REG)
> +		return -EINVAL;
> +
> +	if (readval) {
> +		ret =3D ads1220_read_reg(st, reg, &val);

[Severity: Medium]
Does ads1220_debugfs_reg_access() need to call pm_runtime_resume_and_get()
before initiating SPI transfers? If the device is in the autosuspended
POWERDOWN state, these transactions might fail or return garbage data.

> +		if (ret)
> +			return ret;
> +		*readval =3D val;
> +		return 0;
> +	}
> +
> +	return ads1220_write_reg(st, reg, writeval);

[Severity: High]
Are the shared st->tx and st->rx buffers protected from concurrent access
here? Writing to st->tx directly via debugfs or pm_runtime_suspend without
locking could race with an active triggered buffer reading in
ads1220_trigger_handler(), potentially overwriting the tx buffer mid-transf=
er
and sending corrupted SPI commands.

> +}
> +
> +static const struct iio_info ads1220_info =3D {
> +	.read_raw =3D ads1220_read_raw,
> +	.read_avail =3D ads1220_read_avail,
> +	.write_raw =3D ads1220_write_raw,
> +	.debugfs_reg_access =3D ads1220_debugfs_reg_access,
> +};

[Severity: High]
Does this struct need a .validate_trigger callback to prevent arbitrary
external triggers from being attached? Without it, external triggers could
execute asynchronously to the ADC's data-ready signal. The trigger handler
uses spi_read() directly without an RDATA command, which according to the
datasheet could return corrupted data if a register update overlaps.

> +
> +static int ads1220_buffer_preenable(struct iio_dev *indio_dev)
> +{
> +	struct ads1220_state *st =3D iio_priv(indio_dev);
> +	struct device *dev =3D &st->spi->dev;
> +	struct ads1220_channel_config *cfg;
> +	unsigned int index;
> +	int ret;
> +
> +	index =3D find_first_bit(indio_dev->active_scan_mask,
> +			       iio_get_masklength(indio_dev));
> +	cfg =3D &st->channels_cfg[index];

[Severity: High]
What happens if a user enables ONLY the timestamp channel? The active scan
mask would have exactly one bit set at index =3D st->num_channels_cfg. Will
find_first_bit() return this index and cause an out-of-bounds array read
on st->channels_cfg[index]?

> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ads1220_configure(st, cfg->mux, cfg->gain, cfg->datarate,
> +				cfg->single_ended, true);
> +	if (ret)
> +		goto err;
> +
> +	ret =3D ads1220_command(st, ADS1220_CMD_START);
> +	if (ret)
> +		goto err;
> +
> +	return 0;
> +err:
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +	return ret;
> +}
> +
> +static int ads1220_buffer_postdisable(struct iio_dev *indio_dev)
> +{
> +	struct ads1220_state *st =3D iio_priv(indio_dev);
> +	struct device *dev =3D &st->spi->dev;
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);

[Severity: High]
Does the device need to be explicitly stopped or powered down here?
Dropping the PM runtime reference with a 2000ms autosuspend delay leaves
the ADC running in continuous conversion mode. The hardware might keep
asserting the DRDY interrupt, but since the buffer is disabled, the IRQ
handler will only complete the completion without reading data to clear
the interrupt, potentially causing an immediate IRQ storm.

> +
> +	return 0;
> +}
> +
> +static const struct iio_buffer_setup_ops ads1220_buffer_setup_ops =3D {
> +	.preenable =3D ads1220_buffer_preenable,
> +	.postdisable =3D ads1220_buffer_postdisable,
> +	.validate_scan_mask =3D &iio_validate_scan_mask_onehot,
> +};

[Severity: High]
Is iio_validate_scan_mask_onehot the correct validator for this device?
This validator requires exactly one bit in the mask to be set. Since the
IIO core includes the timestamp channel in the active_scan_mask, enabling
one data channel plus the timestamp results in 2 bits being set, which
will cause the validator to reject valid configurations.

[ ... ]
> +static int ads1220_probe(struct spi_device *spi)
> +{
> +	struct device *dev =3D &spi->dev;
> +	struct iio_dev *indio_dev;
> +	struct ads1220_state *st;
> +	int avdd_uV;
> +	int ret;
[ ... ]
> +	ret =3D devm_regulator_get_enable(dev, "dvdd");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable dvdd\n");
> +
> +	avdd_uV =3D devm_regulator_get_enable_read_voltage(dev, "avdd");
> +	if (avdd_uV < 0)
> +		return dev_err_probe(dev, avdd_uV, "Failed to get avdd\n");

[Severity: Medium]
Should the driver fail probe unconditionally here? If the devicetree does
not explicitly model the AVDD supply, the core passes a dummy regulator.
Reading the voltage from a dummy regulator returns -EINVAL, which might
prevent the driver from probing entirely on such systems, even when
ti,vref-avdd is not specified.

[ ... ]
> +	if (spi->irq > 0) {
> +		ret =3D devm_request_irq(dev, spi->irq, ads1220_irq_handler,
> +				       IRQF_NO_THREAD, "ads1220", indio_dev);

[Severity: High]
Can using IRQF_NO_THREAD without clearing the physical DRDY line cause an
interrupt storm? The hardirq handler immediately returns IRQ_HANDLED
without issuing an SPI transaction to read the data. If the interrupt is
configured as level-triggered, the interrupt controller might repeatedly
re-fire the interrupt upon return. Does this need IRQF_ONESHOT with a
threaded handler, or an explicit enforcement of IRQF_TRIGGER_FALLING?

> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to request irq\n");
> +
> +		st->trig =3D devm_iio_trigger_alloc(dev, "%s-dev%d",
> +						  indio_dev->name,
> +						  iio_device_id(indio_dev));
> +		if (!st->trig)
> +			return -ENOMEM;
> +
> +		st->trig->ops =3D &ads1220_trigger_ops;
> +		iio_trigger_set_drvdata(st->trig, indio_dev);
> +
> +		ret =3D devm_iio_trigger_register(dev, st->trig);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to register trigger\n");
> +	}
> +
> +	ret =3D ads1220_init(st);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize device\n");
> +
> +	pm_runtime_set_autosuspend_delay(dev, ADS1220_SUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_active(dev);
> +
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable pm runtime\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, ads1220_powerdown, st);

[Severity: Medium]
Will registering ads1220_powerdown after pm_runtime_enable cause a teardown
ordering issue? Since devm executes cleanups in reverse order, powerdown
would execute before PM runtime is disabled. Could the PM autosuspend
workqueue trigger ads1220_runtime_suspend at the same moment powerdown
is executing, causing a data race on the unprotected st->tx buffer?

> +	if (ret)
> +		return ret;
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}
> +
> +static int ads1220_runtime_suspend(struct device *dev)
> +{
> +	struct iio_dev *indio_dev =3D dev_get_drvdata(dev);
> +	struct ads1220_state *st =3D iio_priv(indio_dev);
> +
> +	return ads1220_command(st, ADS1220_CMD_POWERDOWN);
> +}

[Severity: High]
Does ads1220_runtime_suspend() overwrite the shared st->tx buffer without
locking? This asynchronous PM runtime suspend could execute concurrently
with an active triggered buffer reading or other SPI transactions, corrupti=
ng
the sent SPI commands.

> +
> +static int ads1220_runtime_resume(struct device *dev)
> +{

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610151342.4427=
4-1-zizuzacker@gmail.com?part=3D2
