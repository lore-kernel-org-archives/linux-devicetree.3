Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8968839E6F5
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 14:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778856951; cv=none; b=RozEZK7iD8tLF1ankT2qZaTx+lzlw/AkQUZhXy13aeaWaTzMSQI/cgitCXKJsLramkiFONbOarhOI/6noOLusd6XegXzW19kvPT1a4StEBICc0HtAGZ8uvgS0fsKNoQDPl2CunYHRVfDfwS6doNQgOly2ldI6D909y/Aqx3k35o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778856951; c=relaxed/simple;
	bh=gMn0PcZhWB9Nitk679pMaQC7si2dRCLBt46i9FS3+qA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T17SXrvUvYDrYDse5dMJrCcsZ1chIpWtO9fb0XENOa3sh0gAuQZsp0cx64CNb+FS1aXmkgbH6Rqj2C7PBbRLyihhRBnHHiDTPFm3e2XdKCjHBO/KnHqtysK3kaH1J9DHtFEbtffmgi2rKSWplqm+HZuRjQJ+Cy4qGGazOaC2pSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uvoZPKDD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uvoZPKDD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31784C2BCB0;
	Fri, 15 May 2026 14:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778856951;
	bh=gMn0PcZhWB9Nitk679pMaQC7si2dRCLBt46i9FS3+qA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uvoZPKDDjREK0ALe+bPdv+iSi+bKtBpnbpqahjbBnsGm0bKwZT94mngleF9fm07Vn
	 QM+fHVhpfO5txmshSr2pyxtnE0wlLzuwd5vP4N9kL0YZajuRXk+mzkMzvNBd39mW54
	 ZPQotbtnGBie0pvHikhEIhcCb0AjmYyTqVBseEpGeWLfl4RwvOzd3lC1WYx84f5ag8
	 pMTh6EoHxZiPhOemSOnAwxnHb/vKiSUSLUY2IdnUZfT0So8am8Zy3FTB3Bc3v8Zm+T
	 N8WgIqz5XZC6rH6SYLmoBUS9KOXWG4a3duY4/7gt+z3iZxRQjNOK/xbAJ2ZxetNVN5
	 hZsXtOVuS9nOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/6] iio: adc: ad4691: add triggered buffer support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260515-ad4692-multichannel-sar-adc-driver-v11-3-eab27d852ac2@analog.com>
References: <20260515-ad4692-multichannel-sar-adc-driver-v11-3-eab27d852ac2@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 14:55:50 +0000
Message-Id: <20260515145551.31784C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [Critical] Out-of-bounds array access in manual mode if only the timestam=
p channel is enabled.
- [High] Incorrect buffer size passed to `iio_push_to_buffers_with_ts()` ca=
uses captures to be dropped.
- [High] Unbalanced `disable_irq()` if buffer `postenable` fails permanentl=
y disables the hardware IRQ.
- [High] DMA cacheline sharing violation between `scan_tx_reset` and `vals`=
 buffers.
- [High] Software timestamp bit is incorrectly written to the hardware sequ=
encer register for AD4693.
- [High] Unconditional registration of an internal IIO trigger in manual mo=
de exposes a broken default trigger.
- [High] Missing bounds validation in `sampling_frequency_store` allows use=
rspace to break the PWM configuration.
- [Medium] Stale ADC values are leaked to userspace via buffer padding.
- [Medium] DATA_READY interrupt is registered as a threaded handler, degrad=
ing timestamp accuracy.
--

commit e2702ccefb71a64072ac587c8f0f328a2a198b5a
Author: Radu Sabau <radu.sabau@analog.com>

iio: adc: ad4691: add triggered buffer support

Add buffered capture support using the IIO triggered buffer framework.
It supports CNV Burst Mode via a PWM and DATA_READY IRQ, and a Manual
Mode using SPI N+1 pipelined transfers.

> diff --git a/drivers/iio/adc/ad4691.c b/drivers/iio/adc/ad4691.c
> index ba77e1bfef166..bf27d5f33a49f 100644
> --- a/drivers/iio/adc/ad4691.c
> +++ b/drivers/iio/adc/ad4691.c
[ ... ]
> @@ -212,8 +246,56 @@ struct ad4691_state {
[ ... ]
> +	u8 scan_tx_reset[4] __aligned(IIO_DMA_MINALIGN);
> +	/*
> +	 * Scan buffer: one BE16 slot per active channel, plus timestamp.
> +	 * DMA-aligned because scan_xfers point rx_buf directly into vals[].
> +	 */
> +	IIO_DECLARE_DMA_BUFFER_WITH_TS(__be16, vals, 16);
>  };

The scan_tx_reset buffer is marked __aligned(IIO_DMA_MINALIGN) but is only
4 bytes long. The subsequent field, the anonymous struct created by
IIO_DECLARE_DMA_BUFFER_WITH_TS, lacks this alignment attribute.

Could this place the vals buffer immediately after scan_tx_reset (at offset
8) within the exact same cacheline?

During a SPI transfer, scan_tx_reset is mapped as DMA_TO_DEVICE while vals
is mapped as DMA_FROM_DEVICE. Does this bidirectional cacheline sharing vio=
late
the DMA API and risk memory corruption on architectures with non-coherent
caches?

[ ... ]
> +static int ad4691_manual_buffer_preenable(struct iio_dev *indio_dev)
> +{
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +	unsigned int k, i;
> +	int ret;
[ ... ]
> +	k =3D 0;
> +	iio_for_each_active_channel(indio_dev, i) {
> +		if (i >=3D indio_dev->num_channels - 1)
> +			break; /* skip soft timestamp */
[ ... ]
> +		k++;
> +	}
> +
> +	/* Final NOOP transfer retrieves the last channel's result. */
> +	st->scan_xfers[k].tx_buf =3D &st->scan_tx[k]; /* scan_tx[k] =3D=3D 0 =
=3D=3D NOOP */
> +	st->scan_xfers[k].rx_buf =3D &st->vals[k - 1];

If only the software timestamp channel is enabled, the loop above breaks
immediately and k remains 0. Since k is unsigned, does k - 1 underflow
to UINT_MAX?

Could this result in a pointer massively out-of-bounds, causing a kernel pa=
nic
or memory corruption when spi_sync executes a DMA write to this address?

[ ... ]
> +static int ad4691_cnv_burst_buffer_preenable(struct iio_dev *indio_dev)
> +{
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +	unsigned int acc_mask, std_seq_config;
> +	unsigned int k, i;
> +	int ret;
[ ... ]
> +	std_seq_config =3D bitmap_read(indio_dev->active_scan_mask, 0,
> +				     iio_get_masklength(indio_dev)) & GENMASK(15, 0);
> +	ret =3D regmap_write(st->regmap, AD4691_STD_SEQ_CONFIG, std_seq_config);

For the AD4693 chip, the software timestamp channel is located at index 8. =
If
the user enables the timestamp, will bit 8 be included in the mask and writ=
ten
to the hardware sequencer?

Since the timestamp is a software-only construct, does passing its bit to t=
he
hardware sequencer misconfigure the ADC and cause it to sample an extra
non-existent channel?

[ ... ]
> +static int ad4691_cnv_burst_buffer_postenable(struct iio_dev *indio_dev)
> +{
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
[ ... ]
> +	ret =3D ad4691_sampling_enable(st, true);
> +	if (ret)
> +		return ret;
> +
> +	enable_irq(st->irq);
> +	return 0;
> +}
> +
> +static int ad4691_cnv_burst_buffer_predisable(struct iio_dev *indio_dev)
> +{
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +
> +	disable_irq(st->irq);
> +	return ad4691_sampling_enable(st, false);
> +}

If ad4691_sampling_enable() fails in postenable, the function returns an
error before calling enable_irq().

When the IIO core unwinds the failure, it will call predisable(), which
unconditionally calls disable_irq(). Since the IRQ was never enabled, does
this increase the IRQ disable depth to 2?

Could this leave the IRQ permanently masked and halt all future data captur=
es,
as subsequent successful buffer enables will only decrement the depth to 1?

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
> +	if (ret)
> +		return ret;
> +
> +	return len;
> +}

Does this function need bounds validation for the user-provided frequency?

If userspace writes a frequency that exceeds st->info->max_rate (500 kHz),
the computed period in ad4691_set_pwm_freq() could be smaller than the
hardcoded 380 ns duty cycle.

Since this store function will silently return success, will the subsequent
buffer enable permanently fail when pwm_apply_might_sleep() rejects the
invalid PWM state?

[ ... ]
> +static void ad4691_trigger_reenable(struct iio_trigger *trig)
> +{
> +	struct ad4691_state *st =3D iio_trigger_get_drvdata(trig);
> +
> +	enable_irq(st->irq);
> +}
[ ... ]
> +static int ad4691_read_scan(struct iio_dev *indio_dev, s64 ts)
> +{
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	ret =3D spi_sync(st->spi, &st->scan_msg);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * rx_buf pointers in scan_xfers point directly into scan.vals, so no
> +	 * copy is needed. The scan_msg already includes a STATE_RESET at the
> +	 * end (appended in preenable), so no explicit reset is needed here.
> +	 */
> +	iio_push_to_buffers_with_ts(indio_dev, st->vals, sizeof(st->vals), ts);
> +	return 0;
> +}

The size passed here is sizeof(st->vals), which evaluates only to the size =
of
the array (32 bytes) and does not include the 8-byte timestamp.

If all channels and the timestamp are active, indio_dev->scan_bytes is 40.
Since the IIO core strictly checks if data_total_len < scan_bytes, will this
cause iio_push_to_buffers_with_ts() to return -ENOSPC and drop the valid
capture?

Additionally, the st->vals array does not appear to be cleared between buff=
er
captures. If a user reduces the number of active channels, could the IIO co=
re
push uninitialized padding (containing stale ADC values from previous captu=
res)
to userspace?

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
> +	if (st->manual_mode)
> +		return devm_iio_triggered_buffer_setup(dev, indio_dev,
> +						       &iio_pollfunc_store_time,
> +						       &ad4691_trigger_handler,
> +						       &ad4691_manual_buffer_setup_ops);

The internal trigger is unconditionally allocated, registered, and set as
indio_dev->trig before checking for manual mode.

Since st->irq remains 0 in manual mode, does exposing this trigger to users=
pace
allow a broken configuration where the trigger never fires?

If userspace polls this broken trigger and it is subsequently disabled, the=
 IIO
core will invoke the .reenable callback which executes enable_irq(st->irq).
Can calling enable_irq(0) cause system instability or kernel warnings?

[ ... ]
> +	/*
> +	 * IRQ is kept disabled until the buffer is enabled to prevent
> +	 * spurious DATA_READY events before the SPI message is set up.
> +	 */
> +	ret =3D devm_request_threaded_irq(dev, irq, NULL,
> +					&ad4691_irq,
> +					IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +					indio_dev->name, indio_dev);
> +	if (ret)
> +		return ret;

This registers the DATA_READY interrupt with a NULL primary handler, causing
ad4691_irq to run as a threaded function.

Since ad4691_irq() just calls disable_irq_nosync() and iio_trigger_poll()
(which are both hardirq safe), should this handler run in hardirq context
instead? Running it in process context might delay the software timestamp
capture by the length of a thread scheduling latency, introducing unnecessa=
ry
jitter.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-ad4692-mul=
tichannel-sar-adc-driver-v11-0-eab27d852ac2@analog.com?part=3D3
