Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792796395;
	b=MglzFFWlgrM5l5zjYPOKzKDkcoehLUp58TBOLNKe84Ej3tN9/qKNVqtOTjINiLnBCr4s
	 fLD/LCVGrqmyHuYgYOpnTLKmLgwADu/4XSzdOiXPiDlPTsjwKOQ+is5UW7+qBI/12tr88
	 miIQEUSHxA+IN+GrBDOLnxuDySaQqNGI9cEWDq+yNjuM78f5/4OJyt7rc/0qb2mJ0wFTX
	 FuWNgeCt2BmUME3HBhKvl4bTQ4br10TEJpi+lnxLaF6Cg+pQ0s1YEA+9n6W/b/tFjUkZu
	 cYa2oIA/3K2ygzwg9zqL6QpP4dJR6VELRm48WMCiNzuQK59l1BtPtXqTxjQDebjA80g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792796395;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7LngX3BsQ1ssKmRG3DIOdt7fPc9Ddu6x/uUu6aO/i5I=;
	b=kcDYWnkf9OqPg9Pqg9LN/pu9o1T04v7dG4uln7xUwwNWmMxP+VhN2vuN6U7S3hRQ7f1z
	 BsTREV0he92XDYrupDbbgi+b/7qXRxso7+C8eJwJwDYprXolVNOnwIJKD8So9/PqlPrP9
	 JMzVTWuVAfQrsZNweFed3BPgmCm3ifNzQ+hupEZDqzqWfJ6bmvapBixSCNFsLhwnO6JHz
	 5MQvvHWkHiKz064qSetIFeBAMVXtoVrA6cYZDOvojW6q5BJRkk+hwboZsZLuWQq0J31CK
	 2BdsLDcg7PIj8SLK5zOzWcNUAUeiRpwnrmu6LmFq1H3GN1RCW6GYVZGmIHjf003Mm+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MWXYQNGd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785AE606A31F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 22:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MWXYQNGd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F171F01825;
	Fri, 23 Oct 2026 22:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792796395;
	bh=7LngX3BsQ1ssKmRG3DIOdt7fPc9Ddu6x/uUu6aO/i5I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MWXYQNGdDz7DUKSLuVEErQA65C95+U2VCSvlVaPyK5tx2kFTGabKh0WugvRt4kaiJ
	 8fZJU6/k4Ru0n54w9OWL46mgBgnQHYscUIJoxQdiL0bT6hYK6YjzKutUVroZoUmXFe
	 PO+hneobeWuNPbRI16EZOBkV+BUFmPbfQtQ1Cf5mbRr3L1qpvVc6+OgQv54NtrU8En
	 asW3dGaC7g2PcS/0n8s3UF/c0plmqEaCpOYbi0X3U97aqwIiuyawmCx202OlHNr3xS
	 PJgKkki1pEYb1UCUTnTAA4WNGE56jG9pbE34HZW3VK1+dyi+14WFrkEEf7+EyrmV1s
	 KO+3twq50KuPA==
Message-ID: <sashiko-outbox-183346@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 15/16] iio: adc: ad4134: Support high-speed data
 capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <129d38f50d44c804d657d067a9c77691ec4b9d74.1792792325.git.marcelo.schmitt@analog.com>
References: <cover.1792792325.git.marcelo.schmitt@analog.com>
 <129d38f50d44c804d657d067a9c77691ec4b9d74.1792792325.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 22:59:54 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] iio: adc: ad4134: premature -EDOM in ad4134_update_conversion_rate=
() offset loop
- [Medium] iio: adc: ad4134: st->odr_pwm left enabled on error, buffer disa=
ble, and unbind
--

commit 7220c3687cb1811a6679e1fe3b919243558ed540
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Support high-speed data capture

This commit adds SPI offload support to the ad4134 ADC driver to allow
high-speed data capture up to 1.496 MSPS using a PWM-driven ODR signal and
DMA-backed IIO buffers.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index 4efb63c45aa29..bc6407ae25e06 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c

[ ... ]

> @@ -462,6 +516,94 @@ static const struct regmap_config ad4134_regmap_conf=
ig =3D {
>  	.max_register =3D AD4134_CH_VREG(AD4134_NUM_CHANNELS - 1),
>  };
> =20
> +static int ad4134_update_conversion_rate(struct ad4134_state *st,
> +					 unsigned int freq_Hz)
> +{
> +	struct spi_offload_trigger_config config =3D st->offload_trigger_config;
> +	struct pwm_waveform odr_wf =3D { };
> +	u64 max_odr_high_time_ns;
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
> +	target_ns =3D odr_high_time_ns;
> +	count =3D 100;
> +	do {
> +		odr_wf.duty_length_ns =3D target_ns;
> +		ret =3D pwm_round_waveform_might_sleep(st->odr_pwm, &odr_wf);
> +		if (ret < 0)
> +			return ret;
> +		target_ns +=3D 10; /* Increment by PWM duty cycle period */
> +	} while (--count && odr_wf.duty_length_ns < odr_high_time_ns);
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
> +	max_odr_high_time_ns =3D max_t(u64, odr_high_time_ns, odr_wf.duty_lengt=
h_ns);
> +	if (config.periodic.offset_ns < max_odr_high_time_ns + AD4134_DCLK_RISI=
NG_OFFSET_NS)
> +		return -EDOM;

[Severity: High]
Can this loop in ad4134_update_conversion_rate() exit early and cause the
subsequent check to fail with -EDOM?

After the ODR PWM rounding loop finishes, odr_wf.duty_length_ns is guarante=
ed
to be at least odr_high_time_ns (for example, 125 ns at a 48 MHz sys_clk_hz
rounded up to 130 ns or 140 ns depending on the PWM clock period), so
max_odr_high_time_ns is equal to odr_wf.duty_length_ns.

However, the SPI offload trigger validation loop initializes offload_offset=
_ns
to odr_high_time_ns + AD4134_DCLK_RISING_OFFSET_NS and stops as soon as
config.periodic.offset_ns reaches odr_high_time_ns +
AD4134_DCLK_RISING_OFFSET_NS.

When odr_wf.duty_length_ns was rounded above odr_high_time_ns and
spi_offload_trigger_validate() rounds config.periodic.offset_ns to a value =
in
[odr_high_time_ns + AD4134_DCLK_RISING_OFFSET_NS, max_odr_high_time_ns +
AD4134_DCLK_RISING_OFFSET_NS), the loop terminates on the first iteration a=
nd
the check against max_odr_high_time_ns + AD4134_DCLK_RISING_OFFSET_NS
immediately returns -EDOM, failing both ad4134_probe() ->
ad4134_offload_setup() and ad4134_write_raw().

Should max_odr_high_time_ns be computed before the loop and used for both t=
he
initial offload_offset_ns and the loop termination condition (and should
config.periodic.frequency_hz be re-initialized on each iteration in case
spi_offload_trigger_validate() modifies it in place)?

> +
> +	/* Check the PWM periods remain the same */
> +	offload_period_ns =3D DIV_ROUND_UP_ULL(HZ_PER_GHZ, config.periodic.freq=
uency_hz);
> +	if (odr_wf.period_length_ns !=3D offload_period_ns)
> +		return -EDOM;
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

> @@ -603,6 +783,166 @@ static const struct iio_info ad4134_info =3D {

[ ... ]

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

[Severity: Medium]
Does this leave st->odr_pwm enabled when the buffer is disabled, if probe
fails after ad4134_update_conversion_rate(), or when the driver is unbound?

In ad4134_probe() -> ad4134_offload_setup() -> ad4134_update_conversion_rat=
e(),
pwm_set_waveform_might_sleep(st->odr_pwm, &odr_wf, false) is called with a
non-zero duty cycle and period, which immediately enables the PWM output in
hardware. It is also saved to st->odr_wf, which is never read anywhere else
in the driver.

Because devm_pwm_get() only releases the PWM handle on teardown without
disabling the hardware output, and neither a devm_add_action_or_reset()
callback nor ad4134_offload_buffer_predisable() disables st->odr_pwm, the P=
WM
continues toggling the AD4134 ODR pin while the IIO buffer is idle, if a
subsequent step in ad4134_offload_setup() or ad4134_probe() fails, or after
driver unbind when the ADC regulators and clocks have been disabled.

Should st->odr_pwm be disabled via a devm action (or only enabled between
ad4134_offload_buffer_postenable() and ad4134_offload_buffer_predisable()
using the saved st->odr_wf)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792792325.gi=
t.marcelo.schmitt@analog.com?part=3D15
