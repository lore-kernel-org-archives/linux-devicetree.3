Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7A13D0935
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 11:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780055341; cv=none; b=QfMiQ6k3y8597CBIphBKKx4TqP3kT6+w1wvkktRxBSJC0CiKLP5zlesYiW/xacxjyif0cm96J5cERGJwMEd3wdjIDc0tY/1Utju28cRBkuienJyOeXuUooA/2no9OIo9ZVCqt/gpySlV2DHZHv5kOOxU+4RuI9+rSq+zTL+hz9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780055341; c=relaxed/simple;
	bh=fBqbjHRBCyIL3UfovEF7gVbOk5i52uNcifbmpp1shzE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HEulSDqJVBt8eqkDk+UjnTGil+EQLfIgECD7/Kr00r6EZ2kmmq0V+UG2HUj/Y79nKbI7QBQOJ1dK6onKL6ufsCwa0vVK5UpYnDF4pdAeGByjwrUbuzdHX3Wo8DG1KZSU9XxvG2MoKMET7feHfcvK5UXaVcSBN14R3JEMuVGAu14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TmawZuCm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TmawZuCm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC4D1F00893;
	Fri, 29 May 2026 11:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780055339;
	bh=76FNoRZv+HWvq02dn1SJNW8wye7L/65s6GlGIvjd8RY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TmawZuCmXUgz/5krphfMyiLIz43kqM43l1tscwBWUkOVIB6emhZnrdUibOrhpqzmd
	 UAodyQD8aRoYNYyFH4k0m4ScknHRnkZbHrtjPtFZOcZBiAOtyYQ/wsLzqnfPUf5rXN
	 s2tF1kl16DqFqsmlmHxrpoZxskZdt+hSCKsI6n+F1yleyYmunwQxf2Fu0aOqDh0554
	 hkVF9MC53zrK/yJYSOhHetl99+WYQ6FwRCJ5RQMDQ8mZrpKs16bvm7aJYXipD5k6pM
	 +lsdP09Tx2WZAKZPBNMB/RJ7WJWW1HeuL9dxas5ckNPOTHWVO+EnqDH8HzZLz1ZMaj
	 vBFfZG8wNc+gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 3/6] iio: adc: ad4691: add triggered buffer support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529-ad4692-multichannel-sar-adc-driver-v14-3-e93c2747dc1f@analog.com>
References: <20260529-ad4692-multichannel-sar-adc-driver-v14-3-e93c2747dc1f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 11:48:58 +0000
Message-Id: <20260529114859.0CC4D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The `iio_for_each_active_channel()` loop does not skip the timesta=
mp channel, leading to array out-of-bounds accesses and invalid hardware co=
nfigurations.
- [High] `sampling_frequency_store` accepts any arbitrary positive frequenc=
y without checking against the ADC's maximum supported rate.
- [High] `ad4691_transfer()` passes a stack-allocated buffer directly to `s=
pi_write()`, which is illegal and will cause crashes with `CONFIG_VMAP_STAC=
K`.
- [High] The driver points individual `spi_transfer` `tx_buf` and `rx_buf` =
pointers to tightly packed 2-byte elements within the `st->scan_tx` and `st=
->vals` arrays, violating the DMA API.
- [Medium] Trigger reference count is leaked if subsequent initializations =
in `ad4691_setup_triggered_buffer` fail.
--

commit 4e95345888521996a31c6b2feb0dd8f47d67b29c
Author: Radu Sabau <radu.sabau@analog.com>
Date:   Fri May 29 10:15:02 2026 +0000

iio: adc: ad4691: add triggered buffer support

This commit adds triggered buffer support using the IIO triggered buffer
framework. It implements a CNV burst mode driven by a PWM and a manual mode
where each transfer simultaneously reads the previous result and starts the
next conversion.

> diff --git a/drivers/iio/adc/ad4691.c b/drivers/iio/adc/ad4691.c
> index e1febf80f21d3..175c801297867 100644
> --- a/drivers/iio/adc/ad4691.c
> +++ b/drivers/iio/adc/ad4691.c
[ ... ]
> +static int ad4691_transfer(struct ad4691_state *st, u16 cmd)
> +{
> +	u8 buf[2];
> +
> +	put_unaligned_be16(cmd, buf);
> +
> +	return spi_write(st->spi, buf, sizeof(buf));
> +}

[Severity: High]
Is it safe to pass a stack-allocated buffer to spi_write() here?

The SPI subsystem maps this buffer for DMA. On architectures with virtually
mapped stacks (CONFIG_VMAP_STACK enabled), dma_map_single() cannot operate
on stack addresses, which could trigger a kernel panic when enabling or
disabling the buffer.

[ ... ]
> +static int ad4691_manual_buffer_preenable(struct iio_dev *indio_dev)
> +{
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +	unsigned int k, i;
> +	int ret;
> +
> +	memset(st->scan_xfers, 0, sizeof(st->scan_xfers));
> +	memset(st->scan_tx, 0, sizeof(st->scan_tx));
> +
> +	spi_message_init(&st->scan_msg);
> +
> +	k =3D 0;
> +	iio_for_each_active_channel(indio_dev, i) {
> +		/*
> +		 * Channel-select command occupies the first (high) byte of the
> +		 * 16-bit DIN frame; the second byte is a don't-care zero pad.
> +		 * put_unaligned_be16() writes [cmd, 0x00] in memory so the
> +		 * SPI controller sends the command byte first on the wire.
> +		 */
> +		put_unaligned_be16((u16)(AD4691_ADC_CHAN(i) << 8), &st->scan_tx[k]);
> +		st->scan_xfers[k].tx_buf =3D &st->scan_tx[k];
> +		/*
> +		 * The pipeline means xfer[0] receives the residual from the
> +		 * previous sequence, not a valid sample. Discard it (rx_buf=3DNULL)
> +		 * to avoid aliasing vals[0] across two concurrent DMA mappings.
> +		 * xfer[1] (or the NOOP when only one channel is active) writes
> +		 * the real ch[0] result to vals[0]. Subsequent transfers write
> +		 * into vals[k-1] so each result lands at the next dense slot.
> +		 */
> +		st->scan_xfers[k].rx_buf =3D (k =3D=3D 0) ? NULL : &st->vals[k - 1];

[Severity: High]
Since scan_tx and vals arrays have elements that are 2 bytes in size,
does pointing individual spi_transfer buffers to them violate the DMA API?

Because each transfer is mapped individually by the SPI core, multiple
DMA mappings will share the same CPU cacheline. On non-cache-coherent
architectures, could cache invalidations during dma_unmap_single() for
one transfer overwrite and corrupt adjacent data written by the DMA
controller?

> +		st->scan_xfers[k].len =3D sizeof(*st->scan_tx);
> +		st->scan_xfers[k].cs_change =3D 1;
> +		st->scan_xfers[k].cs_change_delay.value =3D AD4691_CNV_HIGH_TIME_NS;
> +		st->scan_xfers[k].cs_change_delay.unit =3D SPI_DELAY_UNIT_NSECS;
> +		spi_message_add_tail(&st->scan_xfers[k], &st->scan_msg);
> +		k++;
> +	}
> +
> +	/* Final NOOP transfer retrieves the last channel's result. */
> +	st->scan_xfers[k].tx_buf =3D &st->scan_tx[k]; /* scan_tx[k] =3D=3D 0 =
=3D=3D NOOP */

[Severity: High]
Does iio_for_each_active_channel() skip the timestamp channel?

If the timestamp channel is enabled, it seems the loop counter k will reach
17 (16 physical channels + 1 timestamp). When it evaluates to 17, the final
NOOP transfer writes to st->scan_tx[17] and st->scan_xfers[17], exceeding t=
he
scan_tx array size of 17.

Similarly, in ad4691_cnv_burst_buffer_preenable(), k could reach 17, causing
st->scan_xfers[2 * k] to access scan_xfers[34], exceeding the scan_xfers
array size of 34, potentially causing out-of-bounds memory accesses.

[ ... ]
> +static ssize_t sampling_frequency_store(struct device *dev,
> +					struct device_attribute *attr,
> +					const char *buf, size_t len)
> +{
> +	struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +	unsigned int freq;
> +	int ret;
> +
> +	ret =3D kstrtouint(buf, 10, &freq);
> +	if (ret)
> +		return ret;
> +
> +	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> +	if (IIO_DEV_ACQUIRE_FAILED(claim))
> +		return -EBUSY;
> +
> +	ret =3D ad4691_set_pwm_freq(st, freq);

[Severity: High]
Does this code validate the requested frequency against the maximum support=
ed
rate (st->info->max_rate)?

If a user requests an extremely high frequency, could it drive the hardware
out of spec and cause the GP pin to assert interrupts at an unmanageable
rate, potentially locking up the CPU?

[ ... ]
> +static int ad4691_setup_triggered_buffer(struct iio_dev *indio_dev,
> +					 struct ad4691_state *st)
> +{
> +	struct device *dev =3D regmap_get_device(st->regmap);
> +	struct iio_trigger *trig;
> +	unsigned int i;
> +	int irq, ret;
> +
> +	indio_dev->channels =3D st->info->sw_info->channels;
> +	indio_dev->num_channels =3D st->info->sw_info->num_channels;
> +	indio_dev->info =3D st->manual_mode ? &ad4691_manual_info : &ad4691_cnv=
_burst_info;
> +
> +	/*
> +	 * Manual mode relies on an external trigger (e.g. iio-trig-hrtimer);
> +	 * no internal trigger is needed or registered.
> +	 */
> +	if (st->manual_mode)
> +		return devm_iio_triggered_buffer_setup(dev, indio_dev,
> +						       iio_pollfunc_store_time,
> +						       ad4691_trigger_handler,
> +						       &ad4691_manual_buffer_setup_ops);
> +
> +	/*
> +	 * CNV burst mode: allocate an internal trigger driven by the
> +	 * DATA_READY IRQ on the GP pin.
> +	 */
> +	trig =3D devm_iio_trigger_alloc(dev, "%s-dev%d", indio_dev->name,
> +				      iio_device_id(indio_dev));
> +	if (!trig)
> +		return -ENOMEM;
> +
> +	trig->ops =3D &ad4691_trigger_ops;
> +	iio_trigger_set_drvdata(trig, st);
> +
> +	ret =3D devm_iio_trigger_register(dev, trig);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "IIO trigger register failed\n");
> +
> +	indio_dev->trig =3D iio_trigger_get(trig);
> +
> +	/*
> +	 * The GP pin named in interrupt-names asserts at end-of-conversion.
> +	 * The IRQ handler fires the IIO trigger so the trigger handler can
> +	 * read and push the sample to the buffer. The IRQ is kept disabled
> +	 * until the buffer is enabled.
> +	 */
> +	irq =3D -ENXIO;
> +	for (i =3D 0; i < ARRAY_SIZE(ad4691_gp_names); i++) {
> +		irq =3D fwnode_irq_get_byname(dev_fwnode(dev),
> +					    ad4691_gp_names[i]);
> +		if (irq > 0 || irq =3D=3D -EPROBE_DEFER)
> +			break;
> +	}
> +	if (irq < 0)
> +		return dev_err_probe(dev, irq, "failed to get GP interrupt\n");

[Severity: Medium]
If fwnode_irq_get_byname() fails here, or if ad4691_gpio_setup() fails
later, is the trigger reference obtained via iio_trigger_get(trig) ever
released?

Because INDIO_BUFFER_TRIGGERED is not added to indio_dev->modes until
devm_iio_triggered_buffer_setup_ext() succeeds, the IIO core's devres clean=
up
might not drop this reference if we return early, potentially leaking the
trigger structure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-ad4692-mul=
tichannel-sar-adc-driver-v14-0-e93c2747dc1f@analog.com?part=3D3
