Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CCB44F566
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 19:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501842; cv=none; b=RfosLwPoNIw9O91N/0Q7DdW/qkptQVY1CdmhSV8SmJj5LEXF/sJXVsBLbu3p+9odnomvL9cMdmbixTUE3kX5aerFjc8w93LcXfy9cqyKDm/xkohUpzDKwuGwSqyASItVp/ARNQieI8yo8fu8ZpICaKSLYYTtVL3jIcDCtk6oY+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501842; c=relaxed/simple;
	bh=bAhNK36CxfZvTkpOYKwzixdJsBgaemS0UcHctdLdZZk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vzf2GYmqh7pcNxoHYCsY50SdqS9r5DreaVeQLHwGk0QvMIVPE2KB5LIm4zkNrD3Hj06Z1llJD7nCWigVBX2Lv511G9gxZgpgJAUBuIdvvmLGigwjoX5hZ6YR3JwJcl9ASQ/K/TpALgVuApjCYb41m+SvOTflrExaitz2tsgrHIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RADk6tWx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RADk6tWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2050C1F00898;
	Tue, 15 Sep 2026 19:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789501840;
	bh=HJoAufq/j2bf0UXwY7AUQDQF7Rl/papHOGlWTVzSG28=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RADk6tWxN+DcTeVbavfkPP1FTb0KXr2LXIMuQNrebqIFu4TmdOHcX2CgFVVo0a8TE
	 yASZ2JyFujAWu4ZW810SxkG+xR5vTsM8OmknYPLvoB1VP5Sr5lHKzh3OEzO0YVh+mU
	 Gn3D+NwtTp9rhqHvxjfZtqCWpc0FUFsDRrP3D2B6/V998srgvwiIj0RfQyimDdWqAN
	 bvsJU29IS94h78rO7wG4bOBlaC4y1E7IFG9fIFNf4/bnFBARpoPWeGeJBOApMwuJ2g
	 ESnSSejCT3n1M/vlmWCIWneScQTluJmFuBHPnldFJDEDRhvy0Gu1EvCu1E0UgoLG5q
	 aNh7+cA35f4Ww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 14/15] iio: adc: ad4134: Support high-speed data
 capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <0bf6ca5c7ac264b90429efb2009574db0d0e3315.1789494473.git.marcelo.schmitt@analog.com>
References: <cover.1789494473.git.marcelo.schmitt@analog.com>
 <0bf6ca5c7ac264b90429efb2009574db0d0e3315.1789494473.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 19:50:39 +0000
Message-Id: <20260915195040.2050C1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] iio: adc: ad4134: division by zero panic in probe if optional cloc=
ks are missing
- [High] iio: adc: ad4134: incorrect SPI transfer length drops channels in =
single-lane mode
- [High] iio: adc: ad4134: data corruption in ad4134_trigger_handler() due =
to missed increment
- [High] iio: adc: ad4134: triggered buffer samples dropped due to undersiz=
ed buffer
- [Medium] iio: adc: ad4134: loop failure with valid slow clocks in ad4134_=
update_conversion_rate()
- [Medium] iio: adc: ad4134: PWM hardware resource leak on driver unbind
- [Medium] iio: adc: ad4134: LIFO teardown order violation in ad4134_offloa=
d_buffer_predisable()
- [Low] iio: adc: ad4134: off-by-one bounds check in in_range() validation
- [Low] iio: adc: ad4134: data race on odr_hz in ad4134_read_raw()
--

commit a29ef6f09380617b32619e37a1eab7692d45d1b3
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Support high-speed data capture

This commit adds support for high-speed data capture to the AD4134 driver
using SPI transfer offloading. It adds PWM triggering for the ADC ODR pin
and DMA support for higher sample rates.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index cc6bc325f6ee6..94d979c61501a 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c
[ ... ]
> @@ -178,6 +225,14 @@ struct ad4134_state {
[ ... ]
>  	/*
>  	 * DMA (thus cache coherency maintenance) requires the transfer buffers
>  	 * to live in their own cache lines.
>  	 */
>  	union {
>  		u8 reg[AD4134_SPI_MAX_XFER_LEN];
>  		u32 scan[ARRAY_SIZE(ad4134_chan_set)];

[Severity: High]
Will this array be large enough to hold the timestamp channel?
The size is calculated as 5 elements (20 bytes). However, the timestamp
channel requires 8 bytes, which would make the total required buffer size
24 bytes when all channels and the timestamp are active.

>  	} rx_buf __aligned(IIO_DMA_MINALIGN);
>  	u8 tx_buf[AD4134_SPI_MAX_XFER_LEN];
>  };
[ ... ]
> @@ -464,6 +519,91 @@ static const struct regmap_config ad4134_regmap_conf=
ig =3D {
> +static int ad4134_update_conversion_rate(struct ad4134_state *st,
> +					 unsigned int freq_Hz)
> +{
> +	struct spi_offload_trigger_config config =3D st->offload_trigger_config;
> +	struct pwm_waveform odr_wf =3D { };
> +	u64 offload_period_ns;
> +	u64 offload_offset_ns;
> +	u64 odr_high_time_ns;
> +	unsigned int count;
> +	u64 target_ns;
> +	int ret;
> +
> +	if (!in_range(freq_Hz, AD4134_MIN_ODR_FREQ_HZ, AD4134_MAX_ODR_FREQ_HZ))
> +		return -ERANGE;

[Severity: Low]
Does this accurately validate the frequency upper bound? The in_range()
macro takes the length of the range as its third parameter. By passing the
absolute maximum frequency (1496000), it seems to allow frequencies up to
1496010 Hz rather than capping strictly at 1496000 Hz.

> +
> +	odr_wf.period_length_ns =3D DIV_ROUND_UP_ULL(NSEC_PER_SEC, freq_Hz);
> +	/*
> +	 * Set the PWM duty cycle to keep ODR high for at least minimum required
> +	 * time. If the rounded PWM's value is less than the minimum required,
> +	 * increase the target value by 10 and attempt to round the waveform
> +	 * again, until the minimum (or try count limit) is reached.
> +	 */
> +	odr_high_time_ns =3D div64_ul(6ULL * NSEC_PER_SEC, st->sys_clk_hz);

[Severity: High]
Could this cause a division by zero panic? If the optional xtal and clkin
clocks are missing in the device tree, ad4134_clock_select() can fall back
to clk_get_rate(NULL) =3D=3D 0, resulting in st->sys_clk_hz being 0.

> +	target_ns =3D 0;
> +	count =3D 100;
> +	do {
> +		target_ns +=3D 10; /* Increment by PWM duty cycle period */
> +		odr_wf.duty_length_ns =3D target_ns;
> +		ret =3D pwm_round_waveform_might_sleep(st->odr_pwm, &odr_wf);
> +		if (ret)
> +			return ret;
> +	} while (count-- && odr_wf.duty_length_ns < odr_high_time_ns);

[Severity: Medium]
Will this loop artificially fail for valid slow-clock hardware
configurations? If sys_clk_hz is low (e.g. 2 MHz), odr_high_time_ns will
exceed 1000 ns. Since this loop starts target_ns at 0 and increments by 10
for a maximum of 100 iterations, it can never reach a duty cycle above
1000 ns.

[ ... ]
> +	ret =3D pwm_set_waveform_might_sleep(st->odr_pwm, &odr_wf, false);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Does this leak the PWM hardware resource on driver unbind?
The PWM waveform is started here, but it doesn't look like there is a
cleanup callback registered (e.g. via devm_add_action_or_reset()) to stop
the waveform when the module is removed or if a later probe step fails.

> +
> +	st->offload_trigger_config =3D config;
> +	st->odr_wf =3D odr_wf;
> +	st->odr_hz =3D DIV_ROUND_UP_ULL(NSEC_PER_SEC, odr_wf.period_length_ns);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t ad4134_trigger_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf =3D p;
> +	struct iio_dev *indio_dev =3D pf->indio_dev;
> +	struct ad4134_state *st =3D iio_priv(indio_dev);
> +	unsigned int i =3D 0;
> +	int ret;
> +
> +	gpiod_set_value_cansleep(st->odr_gpio, 1);
> +	fsleep(1);
> +	gpiod_set_value_cansleep(st->odr_gpio, 0);
> +
> +	for (unsigned int ch =3D 0; ch < AD4134_NUM_CHANNELS; ch++) {
> +		ret =3D spi_write_then_read(st->spi, NULL, 0, &st->rx_buf.scan[ch],
> +					  BITS_TO_BYTES(AD4134_CHAN_PRECISION_BITS));
> +		if (ret)
> +			goto err_out;
> +
> +		if (test_bit(ch, indio_dev->active_scan_mask) && ch !=3D i)
> +			memcpy(&st->rx_buf.scan[i++], &st->rx_buf.scan[ch],
> +			       sizeof(st->rx_buf.scan[ch]));

[Severity: High]
Can this logic cause channels to overwrite each other? If the test_bit()
check is true and ch =3D=3D i, the memcpy is avoided but i is never increme=
nted.
The next active channel will then overwrite the previous one at index i.

> +	}
> +
> +	iio_push_to_buffers_with_ts(indio_dev, &st->rx_buf.scan,
> +				    sizeof(st->rx_buf.scan), pf->timestamp);

[Severity: High]
Will samples be dropped when all channels and the timestamp are active?
sizeof(st->rx_buf.scan) is 20 bytes, but when 4 channels (16 bytes) and the
timestamp (8 bytes) are active, the IIO core expects 24 bytes and may reject
the sample with -ENOSPC.

> +
> +err_out:
> +	iio_trigger_notify_done(indio_dev->trig);
> +	return IRQ_HANDLED;
> +}
[ ... ]
> @@ -549,6 +689,44 @@ static int ad4134_read_raw(struct iio_dev *indio_dev,
[ ... ]
>  		*val2 =3D AD4134_CHAN_PRECISION_BITS - 1;
> =20
>  		return IIO_VAL_FRACTIONAL_LOG2;
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		*val =3D st->odr_hz;
> +		return IIO_VAL_INT;

[Severity: Low]
Is it safe to read st->odr_hz here without claiming direct mode or holding
st->lock? It appears ad4134_update_conversion_rate() modifies it
concurrently under the lock, which could result in a data race or a
torn read.

> +	default:
> +		return -EINVAL;
> +	}
> +}
[ ... ]
> @@ -600,6 +778,176 @@ static const struct iio_info ad4134_info =3D {
[ ... ]
> +static void ad4134_prepare_offload_msg(struct iio_dev *indio_dev)
> +{
> +	struct ad4134_state *st =3D iio_priv(indio_dev);
> +	unsigned int base_len =3D roundup_pow_of_two(BITS_TO_BYTES(AD4134_CHAN_=
PRECISION_BITS));
> +	unsigned int bpw =3D AD4134_CHAN_PRECISION_BITS;
> +
> +	st->xfers.cs_off =3D 1;
> +	st->xfers.bits_per_word =3D bpw;
> +	st->xfers.len =3D base_len * st->spi->num_rx_lanes;

[Severity: High]
Could this drop channels when operating in single-lane mode?
If num_rx_lanes is 1, the transfer length computes to 4 bytes instead of the
required 16 bytes. However, ad4134_scan_masks forces all 4 channels to be
read per sample, which might leave the rest of the IIO buffer unpopulated.

> +	if (st->spi->num_rx_lanes > 1)
> +		st->xfers.multi_lane_mode =3D SPI_MULTI_LANE_MODE_STRIPE;
> +
> +	st->xfers.offload_flags =3D SPI_OFFLOAD_XFER_RX_STREAM;
> +
> +	spi_message_init_with_transfers(&st->msg, &st->xfers, 1);
> +}
[ ... ]
> +static int ad4134_offload_buffer_predisable(struct iio_dev *indio_dev)
> +{
> +	struct ad4134_state *st =3D iio_priv(indio_dev);
> +	int ret =3D 0;
> +
> +	spi_offload_trigger_disable(st->offload, st->offload_trigger);
> +
> +	if (st->spi_mode =3D=3D AD4134_SPI_MODE_4_WIRE)
> +		ret =3D ad4134_set_register_access(st);
> +
> +	spi_unoptimize_message(&st->msg);
> +
> +	return ret;
> +}

[Severity: Medium]
Is this violating LIFO teardown order?
In ad4134_offload_buffer_postenable(), spi_optimize_message() is called
before changing access modes, but here ad4134_set_register_access() (which
alters the SPI mode) is called before spi_unoptimize_message(). Altering the
mode while a message is actively optimized might cause undefined behavior in
the SPI controller.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789494473.gi=
t.marcelo.schmitt@analog.com?part=3D14
