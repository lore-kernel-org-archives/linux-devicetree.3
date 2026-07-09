Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA154028D6
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589267; cv=none; b=TePaPoAUdSXkn6SexVsktUqQUFVg02yBF0hAFHUOxxORmrXjm+PsTtR+z4SioprBncjL6K12bJc4zAfC3FVlMIFSUXjRBzo0zhHituyuElKUy9UYwqSGFfnyfjdt9g9vm2kvjYUFUBTW+RYbmdJ/hruoGV0RWPoMSkHj+IK7dSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589267; c=relaxed/simple;
	bh=2kgwc9ZnRZLmNNFL0HwzkVn8eMCbTjucjVgN2Wfjp6U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tQ2/AV4Xgi+6cOYdB7UL4mPxfYlvN9e5BwU2+c8mmH7HV684q0h8iTItKxSoUQ6JIpeXqTqNiyriWygOpaXTsd9Vhk1AgQPPV/V2DP4V4AfjGEG859ZFRcpaaMdbRAaV19EaJb8ev0gcjEaIo7Zf2FC2ayz9V4xmuA5VNafDapU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7oeH6Rt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7oeH6Rt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89091F000E9;
	Thu,  9 Jul 2026 09:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783589259;
	bh=rZeFNPDrH3zAjcZhmDrymUHsHtzCKc6MHpyUJHcoGvQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O7oeH6RtydUv4mOEM+RnSKkHThGS1StldMvalZUQGOn5IkNj3x+UShKyT4w4QHbTg
	 71TYyqAryBVOf9KUIJ16pozXlMn2qCxNNq3AOgAbG6v3XCWuHNtHaCxrDecMglY4+d
	 IwfWbil2gpWiJcvI9ejRpL2kG0iGP3D+wUUgQSYfbdovIP7tRNVYxDu8gfyE3sGM9D
	 U39wYxBTwU2B15nSXA6UiWhD7AqZciKLIr+nuotfdSI1GQJi2hHNqB+ZadT0FPkj15
	 aJ9r1LJ+LmEImZU1hdN2kMcZ3Ziabj0txP2EnZLALhiIUjl3rv5JUre2ujsM5Xi8MW
	 NqQbF5fMTif1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] iio: adc: Add AD7768 IIO Driver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709-ad7768-driver-v1-4-44e1194fd96a@analog.com>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-4-44e1194fd96a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 09:27:38 +0000
Message-Id: <20260709092738.D89091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] The AD7768_REG_CH_STANDBY register is programmed with an incorrect=
 contiguous bitmask for the AD7768-4 variant, preventing unused hardware ch=
annels from entering standby.
- [High] Missing or delayed validation for the `adi,data-lines-number` DT p=
roperty allows a division by zero kernel panic.
- [High] Unvalidated master clock (`mclk`) frequency can result in a divisi=
on by zero crash.
- [High] Missing sign-extension when reading the 24-bit CALIBBIAS (offset) =
and 8-bit PHASE calibration registers causes data corruption.
- [High] The SPI read function reuses the same buffer for concurrent `tx_bu=
f` and `rx_buf` across multiple transfers in the same message, violating th=
e DMA API and the device's SPI protocol.
- [High] Missing error rollback in `ad7768_update_scan_mode` leaves the IIO=
 backend hardware in a partially enabled state on failure.
- [High] Hardware configuration is modified without claiming direct mode, a=
llowing state corruption if modified while the IIO buffer is active.
- [Medium] The device will not automatically enter suspend after probe beca=
use the autosuspend timer is never started, resulting in a permanent power =
leak if unused.
- [Medium] Hardware reset sequence asserts and immediately deasserts the re=
set pin without any delay, potentially violating the minimum reset pulse wi=
dth.
--

--- Patch [4]: [PATCH 4/6] iio: adc: Add AD7768 IIO Driver support ---
commit 73c0da3f81ae06a5de50f6a53d4da30b75b35a25
Author: Janani Sunil <janani.sunil@analog.com>

iio: adc: Add AD7768 IIO Driver support
   =20
Add support for AD7768 4/8 channel,simultaneous sampling Sigma-Delta
ADC, supporting configurable power modes, decimation filters and data
output lines

> diff --git a/drivers/iio/adc/ad7768.c b/drivers/iio/adc/ad7768.c
> new file mode 100644
> index 0000000000000..f76a7081090ec
> --- /dev/null
> +++ b/drivers/iio/adc/ad7768.c
[ ... ]
> +static int ad7768_regmap_read(void *context, const void *reg_buf,
> +			      size_t reg_size, void *val_buf, size_t val_size)
> +{
[ ... ]
> +	struct spi_transfer t[] =3D {
> +		{
> +			.tx_buf =3D &st->d16,
> +			.len =3D 2,
> +			.cs_change =3D 1,
> +		}, {
> +			.tx_buf =3D &st->d16,
> +			.rx_buf =3D &st->d16,
> +			.len =3D 2,
> +		},
> +	};

[Severity: High]
Does this second transfer violate the DMA API by double-mapping the same
virtual pointer (&st->d16) used in the first transfer?

Also, wouldn't transmitting st->d16 again during the read phase violate
standard SPI protocol by sending the read command on the MOSI line instead
of leaving it 0x00?

Could .tx_buf be left NULL for the second transfer?

[ ... ]
> +static int ad7768_read_calib_value(struct ad7768_state *st,
> +				   unsigned int base_reg, int *val)
> +{
[ ... ]
> +	*val =3D (msb << 16) | (mid << 8) | lsb;
> +
> +	return 0;
> +}

[Severity: High]
Since the CALIBBIAS register stores a 24-bit two's complement offset, does
this assignment correctly handle negative offsets?

It appears the value is ORed together as an unsigned 24-bit value and assig=
ned
without sign extension, which might cause negative offsets to be returned to
userspace as large positive integers.

Should sign_extend32() be used here?

[ ... ]
> +static int ad7768_set_clk_divs(struct ad7768_state *st,
> +			       unsigned int freq, unsigned int ch)
> +{
[ ... ]
> +	chan_per_doutx =3D st->chip_info->num_channels / st->datalines;
> +	if (!chan_per_doutx)
> +		return -EINVAL;
[ ... ]
> +	dclk =3D f_cfg.freq * AD7768_SAMPLE_SIZE * chan_per_doutx;
> +	if (dclk > mclk)
> +		return -EINVAL;
> +
> +	/* Set dclk_div to the nearest power of 2 less than the original value =
*/
> +	dclk_div =3D DIV_ROUND_CLOSEST_ULL(mclk, dclk);

[Severity: High]
Is it possible for the configured mclk to be 0?

If the clock rate returns 0, dclk will also become 0. Would this trigger a
division by zero kernel panic inside the DIV_ROUND_CLOSEST_ULL() macro?

[ ... ]
> +static int ad7768_read_raw(struct iio_dev *indio_dev,
> +			   const struct iio_chan_spec *chan,
> +			   int *val, int *val2, long info)
> +{
[ ... ]
> +	case IIO_CHAN_INFO_PHASE:
[ ... ]
> +		ret =3D regmap_read(st->regmap, base_reg, val);
> +		if (ret)
> +			return ret;
> +
> +		return IIO_VAL_INT;

[Severity: High]
Similar to the CALIBBIAS register, the PHASE register stores an 8-bit two's
complement value. Since regmap_read() zero-extends the 8-bit read, will this
corrupt negative phase values?

[ ... ]
> +static int ad7768_write_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan,
> +			    int val, int val2, long info)
> +{
[ ... ]
> +	switch (info) {
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		return ad7768_set_sampling_freq(indio_dev, val, chan->channel);

[Severity: High]
Is it safe to update the sampling frequency without claiming direct mode?

Since ad7768_set_sampling_freq() invokes ad7768_sync() to reset the ADC's
digital filters and SPI synchronization, could userspace writes to sysfs
attributes corrupt or desynchronize ongoing buffer captures?

Should iio_device_claim_direct_mode() be used here?

[ ... ]
> +static int ad7768_update_scan_mode(struct iio_dev *indio_dev,
> +				   const unsigned long *scan_mask)
> +{
[ ... ]
> +	for (c =3D 0; c < st->chip_info->num_channels; c++) {
> +		if (test_bit(c, scan_mask))
> +			ret =3D iio_backend_chan_enable(st->back, c);
> +		else
> +			ret =3D iio_backend_chan_disable(st->back, c);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

[Severity: High]
If an error occurs midway through this loop, returning ret immediately leav=
es
previously enabled backend channels active.

Does this leak backend resources and leave the hardware streaming
indefinitely, potentially breaking future captures? Would it be better to
rollback the enabled channels on failure?

[ ... ]
> +static int ad7768_parse_config(struct iio_dev *indio_dev,
> +			       struct device *dev)
> +{
[ ... ]
> +	ret =3D regmap_write(st->regmap, AD7768_REG_CH_STANDBY,
> +			   GENMASK(st->chip_info->num_channels - 1, 0));
> +	if (ret < 0)
> +		return ret;
> +
> +	device_for_each_child_node_scoped(dev, child) {
[ ... ]
> +		ret =3D regmap_update_bits(st->regmap, AD7768_REG_CH_STANDBY,
> +					 BIT(channel), 0);

[Severity: High]
For the AD7768-4 variant, which uses physical channels 0, 1, 4, and 5, will
this contiguous mask GENMASK(3, 0) correctly power down the unused channels?
It seems this would write 1s to bits 0-3 and 0s (active) to bits 4 and 5,
potentially leaving the upper hardware channels permanently active.

Additionally, will BIT(channel) correctly clear the bits for the upper
hardware channels? If channel is 2 or 3 (representing the 3rd and 4th
channels), this would attempt to wake up non-existent physical channels whi=
le
leaving bits 4 and 5 active.

[ ... ]
> +	st->datalines =3D 1;
> +	ret =3D device_property_read_u32(&st->spi->dev, "adi,data-lines-number",
> +				       &st->datalines);
> +	if (ret)
> +		return dev_err_probe(&st->spi->dev, ret,
> +				     "Missing \"adi,data-lines-number\" property\n");
> +
> +	ad7768_set_available_sampl_freq(st);
[ ... ]
> +	for (i =3D 0; i < indio_dev->num_channels; i++) {
> +		ret =3D ad7768_set_sampling_freq(indio_dev, st->sampling_freq,
> +					       indio_dev->channels[i].channel);

[Severity: High]
Could st->datalines be 0 if the user provides adi,data-lines-number =3D <0>
in the device tree?

Because validation of this property happens at the end of the function,
calling ad7768_set_sampling_freq() here delegates to ad7768_set_clk_divs(),
which performs st->chip_info->num_channels / st->datalines.

Would this trigger a division by zero kernel panic?

[ ... ]
> +static int ad7768_set_filter_mode(struct iio_dev *indio_dev,
> +				  const struct iio_chan_spec *chan,
> +				  unsigned int mode)
> +{
[ ... ]
> +	ret =3D regmap_update_bits(st->regmap,
> +				 AD7768_REG_CH_MODE(st->chn_mode[chan->address]),
> +				 AD7768_CH_MODE_FILTER_TYPE_MSK,
> +				 AD7768_CH_MODE_FILTER_TYPE_MODE(mode));
> +	if (ret < 0)
> +		return ret;
> +
> +	return ad7768_sync(st);
> +}

[Severity: High]
Similar to ad7768_write_raw(), is it safe to update the filter mode and sync
the hardware without claiming direct mode using
iio_device_claim_direct_mode()?

[ ... ]
> +static int ad7768_reset(struct ad7768_state *st)
> +{
[ ... ]
> +	if (reset_ctrl) {
> +		ret =3D reset_control_assert(reset_ctrl);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D reset_control_deassert(reset_ctrl);

[Severity: Medium]
Is a delay required between asserting and deasserting the reset line?

Executing reset_control_deassert() immediately after reset_control_assert()
might result in an extremely brief reset pulse. Could this fail to reset the
hardware properly on fast platforms?

[ ... ]
> +static int ad7768_probe(struct spi_device *spi)
> +{
[ ... ]
> +	pm_runtime_set_autosuspend_delay(dev, 2000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_active(dev);
> +
> +	ret =3D devm_pm_runtime_enable(dev);

[Severity: Medium]
Does this properly start the autosuspend timer after probe?

Because the usage counter is 0 and no idle check is manually queued, the co=
re
never starts the autosuspend timer, leaving the ADC fully powered on
indefinitely until userspace triggers a pm_runtime_get()/put() cycle.

Should pm_runtime_mark_last_busy() and pm_runtime_put_autosuspend() be call=
ed
before exiting probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-ad7768-dri=
ver-v1-0-44e1194fd96a@analog.com?part=3D4
