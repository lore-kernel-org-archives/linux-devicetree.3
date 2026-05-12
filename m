Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFF641B352
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778565787; cv=none; b=fixRyv5VuEv60Gt9pHTuMOPNPbHc9R2MV0A+lXLnIJYREUr3tFY4cjCnhJtaezYeet7xSvSfOT5WFC9QiE+UqAAQ0c7r41hhKu12s0uDg8RQL88gf82/i4RnRgzndqzCIZnMCB9xOMqpI6/WK4sTOU9M4gffkaXkfBWkptvyrxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778565787; c=relaxed/simple;
	bh=I4bjN3/BFVfn78a5wSy2CzuMquH6PKypn5LgxF5sJYI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dTDnB061Wi4Rfn4vDlNP27swVKcvoYrG8NyxygtAZDV0TJZL8LVQRF+S35ygHK9A9cRq2skLMU9e0rz83hdcZYP2l1bzednMV/rioMWh+Oxo7QaszegYtXdhLP34Dq/XOvT+aMgKB41cTKyuTmI+bJKrsEVPD5iU7Zmtzw8ontg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFbr5U8u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFbr5U8u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB6DC2BCB0;
	Tue, 12 May 2026 06:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778565783;
	bh=I4bjN3/BFVfn78a5wSy2CzuMquH6PKypn5LgxF5sJYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=DFbr5U8uEAoJCNGsUvYRwVt4/xt1T2QZfpv76TPRQg4QFu7Avs2rZ7/M9pVWvmYVx
	 IvwiNvbKYkJQwtxnq9Sl3XNKNBi+norZLHcx05H0w889/Jhtr7twjgAg+yyCjqwAFz
	 JGCvDzkc03NFjq1a3UYcuSTR+lCaND+LRox3+pW19swUEa/3grDWZtBK4X4//0tCfA
	 jy5wAKLRn8V8J5QwRBRfEihkuBTlIkvvcezdmj+QmVxbPpeUtaIa11wCg2xoLXFT12
	 Ls4T38G6jvBCSxw47B39Zm4iball5uagD+DtWYwkFklgV2WpjT0hCj5igQFSznNku8
	 uQyUxrlIHx89w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/6] iio: adc: ad4691: add triggered buffer support
Reply-To: sashiko@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511-ad4692-multichannel-sar-adc-driver-v10-3-e1fbb1744e38@analog.com>
References: <20260511-ad4692-multichannel-sar-adc-driver-v10-3-e1fbb1744e38@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 06:03:02 +0000
Message-Id: <20260512060302.DCB6DC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [Critical] Heap buffer overflow in SPI transfer array when the IIO timest=
amp channel is enabled.
- [High] Permanent IRQ masking deadlock due to top-half/bottom-half trigger=
 re-entrancy race.
- [High] Manual Mode is non-functional because external triggers are strict=
ly rejected.
- [High] Data corruption on Little-Endian architectures due to missing IIO_=
BE endianness.
- [High] Overlapping DMA mappings of the same memory address in Manual Mode=
 SPI message.
- [High] Asynchronous `STATE_RESET_ALL` command destroys accumulated sample=
s.
- [High] Incorrect SPI chip select state left asserted due to `cs_change =
=3D 1` on final transfer.
- [Medium] Memory leak of IIO trigger object on probe error paths.
- [Medium] Timestamp jitter and incorrect context due to threaded IRQ for I=
IO trigger polling.
- [Medium] Missing CS change delay in Manual Mode violates CNV high time re=
quirements.
--

commit b68e9561666e82fd6a3730608ccc29e5b0af1991
Author: Radu Sabau <radu.sabau@analog.com>

iio: adc: ad4691: add triggered buffer support
   =20
Add buffered capture support using the IIO triggered buffer framework.
CNV Burst Mode uses a PWM to drive CNV and an IRQ for DATA_READY. Manual
Mode ties CNV to CS and requires an external trigger.

> diff --git a/drivers/iio/adc/ad4691.c b/drivers/iio/adc/ad4691.c
> index 5b72216bca80e..b295a26d13093 100644
> --- a/drivers/iio/adc/ad4691.c
> +++ b/drivers/iio/adc/ad4691.c
[ ... ]
> @@ -212,8 +245,56 @@ struct ad4691_state {
[ ... ]
> +	/*
> +	 * Scan buffer: one BE16 slot per active channel, plus timestamp.
> +	 * DMA-aligned because scan_xfers point rx_buf directly into vals[].
> +	 */
> +	IIO_DECLARE_DMA_BUFFER_WITH_TS(__be16, vals, 16);
>  };

Does the IIO core know these values are big-endian?

Because the IIO_BE endianness flag is not set in the channel specification's
scan_type, the IIO core will default to native endianness. On little-endian
architectures, will this result in corrupted ADC values being passed to
userspace?

[ ... ]
> +static int ad4691_manual_buffer_preenable(struct iio_dev *indio_dev)
> +{
[ ... ]
> +	iio_for_each_active_channel(indio_dev, i) {

If the soft timestamp channel is enabled, it is included in the
active_scan_mask. Will this loop execute 17 times when all 16 hardware
channels and the timestamp are active?

If k reaches 16, appending the final NOOP transfer below writes to
st->scan_xfers[17] and st->scan_tx[17]. For CNV burst mode, appending the
final state-reset transfer writes to st->scan_xfers[34].

Does this overflow the strictly bounded arrays scan_tx[17] and scan_xfers[3=
4],
corrupting adjacent memory on the heap?

[ ... ]
> +		if (first) {
> +			st->scan_xfers[k].rx_buf =3D &st->vals[0];
> +			first =3D false;
> +		} else {
> +			st->scan_xfers[k].rx_buf =3D &st->vals[k - 1];
> +		}

When k=3D1, does xfer[1].rx_buf point to the exact same memory address
as xfer[0].rx_buf (&st->vals[0])?

Mapping the same physical memory region multiple times for DMA_FROM_DEVICE =
in a
single transaction violates the DMA API. On systems using swiotlb or
non-coherent caches, could the unmapping of xfer[0] race with and overwrite
the valid sample received in xfer[1]?

> +		st->scan_xfers[k].len =3D sizeof(st->scan_tx[k]);
> +		st->scan_xfers[k].cs_change =3D 1;

Does this CS toggle meet the ADC's minimum CNV high time requirements?

The AD4691 requires a minimum CNV high time of 430ns, but no CS inactive de=
lay
is specified here. Will this rely entirely on the SPI controller's default
deassertion time, potentially violating hardware timing and corrupting
conversions?

[ ... ]
> +static int ad4691_cnv_burst_buffer_preenable(struct iio_dev *indio_dev)
> +{
[ ... ]
> +	/*
> +	 * Append a 4-byte state-reset transfer [addr_hi, addr_lo,
> +	 * STATE_RESET_ALL, OSC_EN=3D1]. CS is asserted throughout, so
> +	 * ADDR_DESCENDING writes byte[3]=3D1 to OSC_EN_REG (0x180) as a
> +	 * deliberate side-write, keeping the oscillator enabled.
> +	 */
> +	put_unaligned_be16(AD4691_STATE_RESET_REG, st->scan_tx_reset);
> +	st->scan_tx_reset[2] =3D AD4691_STATE_RESET_ALL;

The commit message notes that conversions are stopped during the SPI read, =
but
does the PWM continue to pulse and run conversions during the readout windo=
w?

If conversions for the next burst begin accumulating in the hardware
immediately, does this final STATE_RESET_ALL command wipe out the new
conversions that occurred during the readout window, causing dropped sample=
s?

> +	st->scan_tx_reset[3] =3D 1;
> +	st->scan_xfers[2 * k].tx_buf =3D st->scan_tx_reset;
> +	st->scan_xfers[2 * k].len =3D sizeof(st->scan_tx_reset);
> +	st->scan_xfers[2 * k].cs_change =3D 1;
> +	spi_message_add_tail(&st->scan_xfers[2 * k], &st->scan_msg);

Setting cs_change =3D 1 on the final transfer of a SPI message causes the c=
hip
select to remain asserted indefinitely after the transaction completes.

Will this leave the SPI bus locked and break subsequent communications since
the ADC requires CS to transition high to frame the next command?

[ ... ]
> +static irqreturn_t ad4691_irq(int irq, void *private)
> +{
> +	struct iio_dev *indio_dev =3D private;
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +
> +	/*
> +	 * Disable before polling so the IRQ cannot be re-enabled by the
> +	 * trigger handler before we disable it here. Keep the DATA_READY IRQ
> +	 * disabled until the trigger handler has finished reading the scan,
> +	 * to prevent a new assertion mid-transfer. The PWM continues running
> +	 * uninterrupted; the IRQ is re-enabled in ad4691_trigger_handler once
> +	 * spi_sync completes.
> +	 *
> +	 * IRQF_ONESHOT already masks the hardware line during this threaded
> +	 * handler, so disable_irq_nosync here ensures the IRQ stays disabled
> +	 * even after IRQF_ONESHOT unmasks on return.
> +	 */
> +	disable_irq_nosync(st->irq);
> +	iio_trigger_poll(indio_dev->trig);

Can this manual IRQ masking cause a deadlock?

If an interrupt fires immediately after ad4691_trigger_handler() calls
enable_irq() but before it calls iio_trigger_notify_done(), ad4691_irq()
could execute again, disable the IRQ, and call iio_trigger_poll().

Because the IIO core's use_count is still > 0, the event would be dropped.
Since the trigger handler won't execute again, enable_irq() is never called,
leaving the interrupt permanently masked.

Could this be avoided by using the iio_trigger_ops->reenable callback inste=
ad?

[ ... ]
>  static const struct iio_info ad4691_info =3D {
>  	.read_raw =3D &ad4691_read_raw,
>  	.write_raw =3D &ad4691_write_raw,
>  	.read_avail =3D &ad4691_read_avail,
>  	.debugfs_reg_access =3D &ad4691_reg_access,
> +	.validate_trigger =3D iio_validate_own_trigger,

The commit message states that Manual Mode relies on an external trigger
like iio-trig-hrtimer. However, doesn't iio_validate_own_trigger strictly
ensure the device can only bind to its internally allocated trigger?

Since Manual Mode does not configure any IRQ to fire this internal trigger,
will users be completely blocked from driving the buffer in Manual Mode?

[ ... ]
> +static int ad4691_setup_triggered_buffer(struct iio_dev *indio_dev,
> +					 struct ad4691_state *st)
> +{
[ ... ]
> +	indio_dev->trig =3D iio_trigger_get(trig);
> +
> +	if (st->manual_mode)
> +		return devm_iio_triggered_buffer_setup(dev, indio_dev,
> +						       &iio_pollfunc_store_time,
> +						       &ad4691_trigger_handler,
> +						       &ad4691_manual_buffer_setup_ops);
> +
> +	/*
> +	 * The GP pin named in interrupt-names asserts at end-of-conversion.
> +	 * The IRQ handler stops conversions and fires the IIO trigger so
> +	 * the trigger handler can read and push the sample to the buffer.
> +	 * The IRQ is kept disabled until the buffer is enabled.
> +	 */
> +	irq =3D -ENXIO;
> +	for (i =3D 0; i < ARRAY_SIZE(ad4691_gp_names); i++) {
> +		irq =3D fwnode_irq_get_byname(dev_fwnode(dev),
> +					    ad4691_gp_names[i]);

If this function fails (e.g., fwnode_irq_get_byname returns -EPROBE_DEFER),
does it leak the trigger object?

Because INDIO_BUFFER_TRIGGERED is not yet set in indio_dev->modes, the IIO
core's iio_dev_release() will skip calling
iio_device_unregister_trigger_consumer(), meaning the reference acquired by
iio_trigger_get() above is never dropped.

[ ... ]
> +	/*
> +	 * IRQ is kept disabled until the buffer is enabled to prevent
> +	 * spurious DATA_READY events before the SPI message is set up.
> +	 */
> +	ret =3D devm_request_threaded_irq(dev, irq, NULL,
> +					&ad4691_irq,
> +					IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +					indio_dev->name, indio_dev);

Does capturing the hardware timestamp in a threaded IRQ inject unpredictable
scheduling latency?

The driver requests the DATA_READY interrupt with a NULL hardirq handler,
forcing ad4691_irq to run in a kernel thread. This calls iio_trigger_poll(),
which executes iio_pollfunc_store_time to capture the timestamp. This viola=
tes
the IIO core expectation that iio_trigger_poll runs in hardirq context, add=
ing
jitter to the timestamp.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-ad4692-mul=
tichannel-sar-adc-driver-v10-0-e1fbb1744e38@analog.com?part=3D3
