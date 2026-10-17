Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD2A381EB4
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 02:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792203726; cv=none; b=j9dMrI3p0Y0XviTiyYxvs5slRtSxxz0sFJclBnLFWksEMqUm83p+/B2LgTyjS34wfNBo4V/Qz6MfjS4kkFpdHCWTsxOG7ycPK7hAcOD2uxvSZUTl05sqYmupLcQbiVHTF213+9xSOfrFcdF/oSXRA5ttwOMdH40LCuy+EnVk7qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792203726; c=relaxed/simple;
	bh=nGp+LFpk2feeu7QPWHWuYu5Grr7EKARsL/C/xDTCLBI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nhj5R/zGBarFxjDmaV9Bq32j3CWgLrpkTXtP+r3MH2bdrmptEm5g3jxphAy3gqLZuu1LLPhyAFGLup0u/VKeZPvLHh2h8lwpGiuph/Blv20GzWus9sXc5kGNrn885NWz5PCt4tBf5ncLGMt3FLbipNJHQxjcWcmobDfxSnzQajQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQZNFkcy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQZNFkcy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FA41F000C4;
	Sat, 17 Oct 2026 02:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792203719;
	bh=K+oTlKjG51jmN+0mA/68zXCYGt8pQUmp1g3jcMYOBvc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gQZNFkcyuyDdJ9kr6RDtrfy1wKMkU9zvkqgjxyzGq9iWW5dmYgDEkbXNb6/Rj+guX
	 fJ8GoYfINpGHdK9ej3E+l0B7MuD7UWQ05oSJ0YizInJ4dimnJk9Td9lwaOzJe4AHrB
	 OERC//TpQAzr9X/M+luTyeN4r+ZI7/GYctp4rL4OrRlohIfzPk5cMs7YpMwWLXa095
	 PDhJXf7FjZa8z83S6daZZXTXQ2nmSxDJjgSK/PWzpS8muI2QiYW02ZFMbGv8J7q1an
	 8+ZpshXnvqGEaMqwRKGANyZmxeRjdVLY0lL4+UeU8O/rwtpsofNgbfHYuy1f+d2we/
	 i6U16apmyGLIg==
Message-ID: <sashiko-outbox-175203@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 14/15] iio: adc: ad4134: Support high-speed data
 capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <44d545559aaf7cf2605aa30b5e9c9e5aa4aca879.1792200021.git.marcelo.schmitt@analog.com>
References: <cover.1792200021.git.marcelo.schmitt@analog.com>
 <44d545559aaf7cf2605aa30b5e9c9e5aa4aca879.1792200021.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 02:21:59 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] iio: adc: ad4134: positive return from pwm_round_waveform_might_sl=
eep()
- [High] iio: adc: ad4134: ODR PWM enabled in probe and never disabled
- [Medium] iio: adc: ad4134: period rounding drift in ad4134_update_convers=
ion_rate()
- [Medium] iio: adc: ad4134: trigger offset uses unrounded ODR high time
--

commit 08608ae1b3f8617876d1b47ec67b7654d5a033e9
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Support high-speed data capture

This commit adds SPI transfer offload support to the ad4134 ADC driver,
using a periodic PWM trigger and DMA engine buffer to capture samples at
rates up to 1.496 MSPS.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index 6b05e40f7aeb7..21e8039b34116 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c
[ ... ]
> @@ -461,6 +515,92 @@ static const struct regmap_config ad4134_regmap_conf=
ig =3D {
>  	.max_register =3D AD4134_CH_VREG(AD4134_NUM_CHANNELS - 1),
>  };
> =20
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
> +	if (!in_range(freq_Hz, AD4134_MIN_ODR_FREQ_HZ,
> +		      AD4134_MAX_ODR_FREQ_HZ - AD4134_MIN_ODR_FREQ_HZ + 1))
> +		return -ERANGE;
> +
> +	odr_wf.period_length_ns =3D DIV_ROUND_UP_ULL(NSEC_PER_SEC, freq_Hz);
> +	/*
> +	 * Set the PWM duty cycle to keep ODR high for at least minimum required
> +	 * time. If the rounded PWM's value is less than the minimum required,
> +	 * increase the target value by 10 and attempt to round the waveform
> +	 * again, until the minimum (or try count limit) is reached.
> +	 */
> +	odr_high_time_ns =3D div64_ul(6ULL * NSEC_PER_SEC, st->sys_clk_hz);
> +	target_ns =3D 0;
> +	count =3D 100;
> +	do {
> +		target_ns +=3D 10; /* Increment by PWM duty cycle period */
> +		odr_wf.duty_length_ns =3D target_ns;
> +		ret =3D pwm_round_waveform_might_sleep(st->odr_pwm, &odr_wf);
> +		if (ret)
> +			return ret;
> +	} while (--count && odr_wf.duty_length_ns < odr_high_time_ns);

[Severity: High]
In ad4134_update_conversion_rate(), pwm_round_waveform_might_sleep() returns
0 on exact or downward rounding, 1 when a waveform value had to be rounded =
up,
or a negative errno on failure:

drivers/pwm/core.c:
 * Returns: 0 on success, 1 if at least one value had to be rounded up or a
 * negative errno.
 * Context: May sleep.
 */
int pwm_round_waveform_might_sleep(struct pwm_device *pwm, struct pwm_wavef=
orm *wf)

Because target_ns starts at 0 (requesting 10 ns on the first iteration) and
the return value is checked with if (ret) instead of if (ret < 0), won't any
upward rounding cause ad4134_update_conversion_rate() to abort and return +1
to ad4134_offload_setup() -> ad4134_probe() or ad4134_write_raw()?

Also, since target_ns starts at 0 and only increments up to 1000 ns across
100 iterations rather than starting at odr_high_time_ns, this performs
unnecessary rounding calls at the nominal 48 MHz clock (where
odr_high_time_ns is 125 ns) and will always exhaust count and fail with
-EDOM if st->sys_clk_hz < 6 MHz. Should target_ns start at odr_high_time_ns
and check if (ret < 0)?

> +
> +	/* Check the minimum ODR high time is met */
> +	if (odr_wf.duty_length_ns < odr_high_time_ns)
> +		return -EDOM;
> +
> +	if (odr_wf.period_length_ns < 2 * odr_high_time_ns)
> +		return -EDOM;
> +
> +	/*
> +	 * Configure SPI offload PWM trigger.
> +	 * For gated DCLK, the minimum required time between ODR rising edge
> +	 * and DCLK rising edge is the sum of ODR high time and ODR falling
> +	 * edge to DCLK rising edge time. Delay the offload trigger for at least
> +	 * that amount of time so the ADC sample data will be available when the
> +	 * SPI transfer begin.
> +	 *
> +	 * Use the same period as ODR PWM to avoid timing issues.
> +	 * Convert back from period to frequency for the SPI offload API.
> +	 */
> +	offload_period_ns =3D odr_wf.period_length_ns;
> +	config.periodic.frequency_hz =3D DIV_ROUND_UP_ULL(HZ_PER_GHZ, offload_p=
eriod_ns);
> +	offload_offset_ns =3D odr_high_time_ns + AD4134_DCLK_RISING_OFFSET_NS;
> +	count =3D 100;
> +	do {
> +		config.periodic.offset_ns =3D offload_offset_ns;
> +		ret =3D spi_offload_trigger_validate(st->offload_trigger, &config);
> +		if (ret)
> +			return ret;
> +
> +		offload_offset_ns +=3D 10;
> +	} while (--count && config.periodic.offset_ns < odr_high_time_ns +
> +							AD4134_DCLK_RISING_OFFSET_NS);
> +
> +	/* Check the minimum ODR to DCLK delay is met */
> +	if (config.periodic.offset_ns < odr_high_time_ns + AD4134_DCLK_RISING_O=
FFSET_NS)
> +		return -EDOM;

[Severity: Medium]
Here in ad4134_update_conversion_rate(), offload_offset_ns and the loop
termination checks use the theoretical minimum odr_high_time_ns rather than
the actual rounded ODR pulse width odr_wf.duty_length_ns.

If pwm_round_waveform_might_sleep() rounds odr_wf.duty_length_ns up above
odr_high_time_ns (for example, to 140 ns or 150 ns when odr_high_time_ns is
125 ns), the ODR falling edge occurs at odr_wf.duty_length_ns. Validating
config.periodic.offset_ns against odr_high_time_ns +
AD4134_DCLK_RISING_OFFSET_NS (133 ns) allows the SPI offload trigger to fire
less than 8 ns after (or simultaneously with) the actual ODR falling edge.

Should offload_offset_ns and the post-validation checks use
odr_wf.duty_length_ns + AD4134_DCLK_RISING_OFFSET_NS instead?

> +
> +	/* Check the PWM periods remain the same */
> +	offload_period_ns =3D DIV_ROUND_UP_ULL(HZ_PER_GHZ, config.periodic.freq=
uency_hz);
> +	if (odr_wf.period_length_ns !=3D offload_period_ns)
> +		return -EDOM;

[Severity: Medium]
Can this period equality check in ad4134_update_conversion_rate() reject va=
lid
sampling frequencies in the [10, 1496000] Hz range with -EDOM?

In spi_offload_trigger_pwm_validate(), config.periodic.frequency_hz is
converted back to a period via DIV_ROUND_UP_ULL(NSEC_PER_SEC,
periodic->frequency_hz), rounded down by the PWM hardware, and written back=
 to
periodic->frequency_hz:

drivers/spi/spi-offload-trigger-pwm.c:spi_offload_trigger_pwm_validate() {
	wf.period_length_ns =3D DIV_ROUND_UP_ULL(NSEC_PER_SEC, periodic->frequency=
_hz);
	...
	ret =3D pwm_round_waveform_might_sleep(st->pwm, &wf);
	if (ret < 0)
		return ret;

	periodic->frequency_hz =3D DIV_ROUND_UP_ULL(NSEC_PER_SEC, wf.period_length=
_ns);
	periodic->offset_ns =3D wf.duty_offset_ns;
}

When odr_wf.period_length_ns is converted to an integer frequency_hz via
DIV_ROUND_UP_ULL(HZ_PER_GHZ, offload_period_ns), any period where
ceil(10^9 / ceil(10^9 / P)) !=3D P (such as almost all frequencies below
31.6 kHz, e.g., 60 Hz or 19200 Hz) produces a smaller wf.period_length_ns in
spi_offload_trigger_pwm_validate().

In addition, because config.periodic.frequency_hz is set outside the do-whi=
le
loop and modified in-place by spi_offload_trigger_validate(), each loop
iteration feeds the rounded-up frequency_hz back into
spi_offload_trigger_validate(), causing the trigger period to shrink further
across iterations and fail the odr_wf.period_length_ns !=3D offload_period_=
ns
check.

> +
> +	ret =3D pwm_set_waveform_might_sleep(st->odr_pwm, &odr_wf, false);
> +	if (ret)
> +		return ret;
> +
> +	st->offload_trigger_config =3D config;
> +	st->odr_wf =3D odr_wf;
> +	st->odr_hz =3D DIV_ROUND_UP_ULL(NSEC_PER_SEC, odr_wf.period_length_ns);
> +
> +	return 0;
> +}
[ ... ]
> @@ -602,6 +783,166 @@ static const struct iio_info ad4134_info =3D {
>  	.debugfs_reg_access =3D ad4134_debugfs_reg_access,
>  };
[ ... ]
> +static int ad4134_offload_buffer_postenable(struct iio_dev *indio_dev)
> +{
> +	struct ad4134_state *st =3D iio_priv(indio_dev);
> +	int ret, access_ret;
> +
> +	ret =3D ad4134_claim_sample_access(st);
> +	if (ret)
> +		return ret;
> +
> +	ad4134_prepare_offload_msg(indio_dev);
> +	st->msg.offload =3D st->offload;
> +	ret =3D spi_optimize_message(st->spi, &st->msg);
> +	if (ret)
> +		goto out_offload_release;
> +
> +	ret =3D spi_offload_trigger_enable(st->offload, st->offload_trigger,
> +					 &st->offload_trigger_config);
> +	if (ret)
> +		goto out_unoptimize;
> +
> +	return 0;
> +
> +out_unoptimize:
> +	spi_unoptimize_message(&st->msg);
> +
> +out_offload_release:
> +	access_ret =3D ad4134_release_sample_access(st);
> +	if (access_ret)
> +		dev_err(&st->spi->dev, "reg input select error: %d\n", access_ret);
> +
> +	return ret;
> +}
> +
> +static int ad4134_offload_buffer_predisable(struct iio_dev *indio_dev)
> +{
> +	struct ad4134_state *st =3D iio_priv(indio_dev);
> +
> +	spi_offload_trigger_disable(st->offload, st->offload_trigger);
> +	spi_unoptimize_message(&st->msg);
> +
> +	return ad4134_release_sample_access(st);
> +}
> +
> +static const struct iio_buffer_setup_ops ad4134_offload_buffer_setup_ops=
 =3D {
> +	.postenable =3D &ad4134_offload_buffer_postenable,
> +	.predisable =3D &ad4134_offload_buffer_predisable,
> +};
> +
> +static int ad4134_pwm_get(struct ad4134_state *st)
> +{
> +	struct device *dev =3D &st->spi->dev;
> +
> +	st->odr_pwm =3D devm_pwm_get(dev, NULL);
> +	if (IS_ERR(st->odr_pwm))
> +		return dev_err_probe(dev, PTR_ERR(st->odr_pwm),
> +				     "failed to get ODR PWM\n");
> +
> +	return 0;
> +}

[Severity: High]
How is the lifecycle of st->odr_pwm managed?

During probe, ad4134_offload_setup() calls ad4134_update_conversion_rate(),
which calls pwm_set_waveform_might_sleep(st->odr_pwm, &odr_wf, false) with a
non-zero duty cycle and period. This immediately enables the ODR PWM output
before the AD4134 registers are configured.

Furthermore, st->odr_wf is saved in ad4134_update_conversion_rate() but nev=
er
used, and neither ad4134_offload_buffer_predisable() nor any devm cleanup
action ever disables st->odr_pwm. Because devm_pwm_get() only releases the
PWM reference without stopping hardware output, won't st->odr_pwm remain
running continuously when the buffer is disabled, or after late probe failu=
re
and driver unbind (driving the ODR pin after the ADC's clocks and regulators
have been disabled)?

[ ... ]

> +static int ad4134_offload_setup(struct iio_dev *indio_dev, struct ad4134=
_state *st)
> +{
> +	struct device *dev =3D &st->spi->dev;
> +	int ret;
> +
> +	ret =3D ad4134_pwm_get(st);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ad4134_offload_buffer_setup(indio_dev, st->spi);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Start with a sampling rate slower than 374 kSPS because that is the
> +	 * maximum rate supported with wideband filter (default on power up).
> +	 */
> +	st->odr_hz =3D 250 * HZ_PER_KHZ;
> +	ret =3D ad4134_update_conversion_rate(st, st->odr_hz);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to set sampling freq\n");

[ ... ]

> +}

[ ... ]

> @@ -776,17 +1117,40 @@ static int ad4134_probe(struct spi_device *spi)

[ ... ]

> +	st->offload =3D devm_spi_offload_get(dev, spi, &ad4134_offload_config);
> +	ret =3D PTR_ERR_OR_ZERO(st->offload);
> +	/* Fall back to low speed usage when no SPI offload is available. */
> +	if (ret =3D=3D -ENODEV) {

[ ... ]

> +	} else if (ret) {
> +		return dev_err_probe(dev, ret, "failed to get offload\n");
> +	} else {
> +		if (st->spi_mode =3D=3D AD4134_SPI_MODE_NO_CS)
> +			return dev_err_probe(dev, -EPROTONOSUPPORT,
> +					     "Unsupported min I/O + offload config\n");
> +
> +		indio_dev->info =3D &ad4134_offload_info;
> +		indio_dev->channels =3D ad4134_offload_chan_set;
> +		indio_dev->num_channels =3D ARRAY_SIZE(ad4134_offload_chan_set);
> +		ret =3D ad4134_offload_setup(indio_dev, st);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to setup SPI offload\n");
> +	}

[ ... ]

>  	return devm_iio_device_register(dev, indio_dev);
>  }

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792200021.gi=
t.marcelo.schmitt@analog.com?part=3D14
