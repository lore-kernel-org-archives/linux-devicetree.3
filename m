Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FCA409611
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 13:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198131; cv=none; b=WB6bg0Hds/QhgdHTcx69tSoNw875qu3Jjuot+hsB1uXC2fFmPrih6qI6Kj42T2cPphglY+a37E/Ht4GVd4uu3lO5Lwl7C1P/e0cGvqxqHMRTYu/AyphUyRS0rHC+zcqbuRXY2IaAtDfDI3yFSfjePq4y26zhS5nO2gx4I/LzPkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198131; c=relaxed/simple;
	bh=HtdRs3Uqg+p6PqisYQ0w/4qm9PjmYomA6LmeIU9zvq8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AP3k9fLxRC4YZj5FC05LvnQOd3/P/mV4vOiLxXngt9kOoBU8QunaXIBqlQzqSUvGLjAmXZUV1Ufx6FESrK9qapCcGMNno38D9wCErOsNRmYoPyUZ/RR9vYcmt0eLM83vBf8OTUH8kUPisKTy3uKX4fxHeO7E1euHdLHyv4qidFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPD+Eqie; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPD+Eqie"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330B2C2BCB3;
	Tue, 19 May 2026 13:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779198131;
	bh=HtdRs3Uqg+p6PqisYQ0w/4qm9PjmYomA6LmeIU9zvq8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=IPD+EqieRAeFMMmRtaGhNwZNctVv+/4+K8kQGDsllV5cKFO4F3CtldFAQ6jPWTuYI
	 ICY/Oy0CzrPVe8Tyjza9LEar+5yFJZMfgUU/YY6IxJlURwr+YNZHeI7hhd6V2XYI9g
	 5fbY8e4+rgH1onnkqdfTmuJ3vmI3pDIUsYIBlaWa79EAk2bwL2ZItLITZrAuqRqbPe
	 MqDQGzBIi2Dvemyi5la5i25gHkoixSBecnOpwRLo79eX/fbtK7Kg3NZ6qiDDucrfj6
	 +E8rICfkt0dSDkdPlASjvhYMXH1+boYX5i0s/p9DveNjMowck94BuHZtNWEzp5oP17
	 5dD4oQ5ZYnJyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 3/6] iio: adc: ad4691: add triggered buffer support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519-ad4692-multichannel-sar-adc-driver-v12-3-5b335162aa51@analog.com>
References: <20260519-ad4692-multichannel-sar-adc-driver-v12-3-5b335162aa51@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 13:42:10 +0000
Message-Id: <20260519134211.330B2C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Reference leak of IIO trigger on probe error or deferral
- [High] Array out-of-bounds writes due to unskipped soft timestamp channel
- [High] Integer overflow in `sampling_frequency_store` leading to Division=
 by Zero kernel panic
- [Medium] Unchecked `spi_sync` return value in trigger handler pushes stal=
e data
--

commit eeeb18b7f3745a473a0f530dd91677719c56522a
Author: Radu Sabau <radu.sabau@analog.com>

iio: adc: ad4691: add triggered buffer support

This commit adds buffered capture support using the IIO triggered buffer
framework. It supports both CNV Burst Mode and Manual Mode, sharing the same
trigger handler to push a complete scan to the buffer.

> diff --git a/drivers/iio/adc/ad4691.c b/drivers/iio/adc/ad4691.c
> index 2d58df8621422..ed60ed5b488c2 100644
> --- a/drivers/iio/adc/ad4691.c
> +++ b/drivers/iio/adc/ad4691.c

[ ... ]

> @@ -548,13 +619,397 @@ static int ad4691_reg_access(struct iio_dev *indio=
_dev, unsigned int reg,
>  	return regmap_write(st->regmap, reg, writeval);
>  }
> =20
> +static int ad4691_set_pwm_freq(struct ad4691_state *st, unsigned int fre=
q)
> +{
> +	if (!freq)
> +		return -EINVAL;
> +
> +	st->cnv_period_ns =3D DIV_ROUND_UP(NSEC_PER_SEC, freq);

Could this cause an integer overflow on 32-bit architectures?=20

A very large value for freq combined with NSEC_PER_SEC could wrap around in=
=20
the DIV_ROUND_UP macro addition, resulting in a numerator that evaluates to=
=20
zero.

If st->cnv_period_ns becomes zero, would the division in=20
sampling_frequency_show() later trigger a division by zero?

> +	return 0;
> +}

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

Does this loop explicitly need to skip the software timestamp channel?

Since iio_for_each_active_channel() iterates over all set bits in the scan
mask, including the timestamp channel if enabled by userspace, could k reach
17?

If k reaches 17, it appears this would write past the end of the 17-element
scan_tx array here:

> +		/*
> +		 * Channel-select command occupies the first (high) byte of the
> +		 * 16-bit DIN frame; the second byte is a don't-care zero pad.
> +		 * put_unaligned_be16() writes [cmd, 0x00] in memory so the
> +		 * SPI controller sends the command byte first on the wire.
> +		 */
> +		put_unaligned_be16((u16)(AD4691_ADC_CHAN(i) << 8), &st->scan_tx[k]);

[ ... ]

> +static int ad4691_cnv_burst_buffer_preenable(struct iio_dev *indio_dev)
> +{
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +	unsigned int acc_mask, std_seq_config;
> +	unsigned int k, i;
> +	int ret;
> +
> +	memset(st->scan_xfers, 0, sizeof(st->scan_xfers));
> +	memset(st->scan_tx, 0, sizeof(st->scan_tx));
> +
> +	spi_message_init(&st->scan_msg);
> +
> +	/*
> +	 * Each AVG_IN read needs two transfers: a 2-byte address write phase
> +	 * followed by a 2-byte data read phase. CS toggles between channels
> +	 * (cs_change=3D1 on the read phase of all but the last channel).
> +	 */
> +	k =3D 0;
> +	iio_for_each_active_channel(indio_dev, i) {
> +		put_unaligned_be16(0x8000 | AD4691_AVG_IN(i), &st->scan_tx[k]);
> +		st->scan_xfers[2 * k].tx_buf =3D &st->scan_tx[k];
> +		st->scan_xfers[2 * k].len =3D sizeof(*st->scan_tx);
> +		spi_message_add_tail(&st->scan_xfers[2 * k], &st->scan_msg);
> +		st->scan_xfers[2 * k + 1].rx_buf =3D &st->vals[k];
> +		st->scan_xfers[2 * k + 1].len =3D sizeof(*st->scan_tx);
> +		st->scan_xfers[2 * k + 1].cs_change =3D 1;
> +		spi_message_add_tail(&st->scan_xfers[2 * k + 1], &st->scan_msg);
> +		k++;
> +	}
> +
> +	/*
> +	 * Append a 4-byte state-reset transfer [addr_hi, addr_lo,
> +	 * STATE_RESET_ALL, OSC_EN=3D1]. CS is asserted throughout, so
> +	 * ADDR_DESCENDING writes byte[3]=3D1 to OSC_EN_REG (0x180) as a
> +	 * deliberate side-write, keeping the oscillator enabled.
> +	 * STATE_RESET_ALL starts the next burst; the hardware does not
> +	 * accumulate new conversions until after a STATE_RESET pulse, so
> +	 * no in-progress data is lost.  No cs_change here =E2=80=94 CS must
> +	 * deassert normally at end of message to frame the next command.
> +	 */
> +	put_unaligned_be16(AD4691_STATE_RESET_REG, st->scan_tx_reset);
> +	st->scan_tx_reset[2] =3D AD4691_STATE_RESET_ALL;
> +	st->scan_tx_reset[3] =3D 1;
> +	st->scan_xfers[2 * k].tx_buf =3D st->scan_tx_reset;

Similarly to the manual mode preenable function, does this loop need to skip
the software timestamp channel?

If the timestamp channel is included, k would reach 17, and 2 * k would be =
34,
which appears to write out of bounds of the 34-element scan_xfers array.

> +	st->scan_xfers[2 * k].len =3D sizeof(st->scan_tx_reset);

[ ... ]

> +static void ad4691_read_scan(struct iio_dev *indio_dev, s64 ts)
> +{
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +
> +	guard(mutex)(&st->lock);
> +
> +	spi_sync(st->spi, &st->scan_msg);

Is it safe to ignore the return value of spi_sync() here?=20

If the SPI transfer fails due to a bus error or timeout, could this silently
push uninitialized or stale data from st->vals to userspace?

> +
> +	/*
> +	 * rx_buf pointers in scan_xfers point directly into scan.vals, so no
> +	 * copy is needed. The scan_msg already includes a STATE_RESET at the
> +	 * end (appended in preenable), so no explicit reset is needed here.
> +	 */
> +	iio_push_to_buffers_with_ts(indio_dev, st->vals, sizeof(st->vals), ts);
> +}

[ ... ]

> +static int ad4691_setup_triggered_buffer(struct iio_dev *indio_dev,
> +					 struct ad4691_state *st)
> +{

[ ... ]

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

If ad4691_setup_triggered_buffer() returns an error here (or in the
subsequent setup steps below) and probe aborts, will the reference count
acquired by iio_trigger_get() be leaked?

Since iio_device_register() would not be reached, the devres cleanup won't
invoke iio_device_unregister_trigger_consumer() to call iio_trigger_put().

> +
> +	st->irq =3D irq;
> +
> +	ret =3D ad4691_gpio_setup(st, i);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-ad4692-mul=
tichannel-sar-adc-driver-v12-0-5b335162aa51@analog.com?part=3D3
