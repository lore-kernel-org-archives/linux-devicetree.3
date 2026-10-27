Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109976;
	b=QkVMpm2nWhingBAI7ueg3w+d6d5DwgRW0C4I2tYj2H75AG2CCYL0AioonKNUUaDimFjW
	 PIy9Q4AsTewTfCCuw9+Y6FAnpYyyaFHNoN6vAiB3mPWIhYjQYlZDc3uPWU76ETAiELMPb
	 afpQvIItggJAXwhKT8SexzRAo0hx9N039Bb4caL0pavfqNh9i20bRGtjEUbITwXa0dJjN
	 lNdl5NF9ZgAKBgKV8aQfIj+8584ryJwhmtYJb1Np+LH5xzAnx/dE54duOaS6dbP/8GGiA
	 Mr0AsLNU9XPK+fm+9qoPdje/YMmw5wMQ6tO9alTuxBTeij4WksWaDy305OlzxSguF7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109976;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZlQozj6iXl3747x9fGCiWvrUCugnY4R92Ds0x19iEwg=;
	b=Bs5i8Ic2J/HU4FbWDmPFSE9q6Qa8FKqCyKBJTLyd8BZHBsSR+Ckx0zzpC3B681Le3vsV
	 +9Bfh+4gF1i3caXrGZWEQznyVmtuEpMgY8lx1Wco4b1S5PDwROiNJ65tyyV++z0A5QnSX
	 EwJgFENM86MHqRbI8sg6qXc6g/KtG2WLr8NJfvvqoxgiDj9q/tRjjkmm9iRdvyHyKpwMd
	 EChJVz6Co3lHeSfVGSMpnFx02o/5WZNvG8zeDrWv2uKcJyA0dkMKidyydCoQCoFadbrLz
	 0U/9oUMfkTfHP9xQ2hzCwoHHea9ISItSsB/Ijt7t1MuFlFAyWeHR/dZNpqgne3kk1vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="S35/rTB+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBA5606A32E
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 14:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S35/rTB+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF341F01828;
	Tue, 27 Oct 2026 14:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793109976;
	bh=ZlQozj6iXl3747x9fGCiWvrUCugnY4R92Ds0x19iEwg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S35/rTB+8f1nG9b4GoKtjZVIWBEOpSdbTGS+0JKTG+2dnIUgE3qDEaKXliSfgfnMH
	 VJp1Av7iCFCuwT7pnLbVJv8jXyq97bHbG4gHbcUF6ye9nkqNVkisibHHqqJnj51DyE
	 Br4hwC5VFK+zDsD98qeg6GYT/fsBvqALS/YAgYg0vObTDRNcgZmmtZhbUoY5i8bZR1
	 NChnzmQHl0/wyu12lvGMqoGSxOX6ZurJoNO8t+Lqn1olohR3cVW3mlLS3CC7tI7Teh
	 scRQd4vAqhrThoA/7oMRnvgR4NnqwpLc6cKWeXwQEwOtk8ZSnOFXT8AxGG+FGRoN2Q
	 oTyxxXTi0CWAw==
Message-ID: <sashiko-outbox-186694@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: adc: add ltc2387 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolae-Daniel Deaconescu" <Nicolae-daniel.Deaconescu@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027134409.76824-3-Nicolae-daniel.Deaconescu@analog.com>
References: <20261027134409.76824-1-Nicolae-daniel.Deaconescu@analog.com>
 <20261027134409.76824-3-Nicolae-daniel.Deaconescu@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 14:06:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] iio: adc: ltc2387: invalid scan_type and missing scan_masks on x4 =
parts
- [Medium] iio: adc: ltc2387: regulator enable leak in ltc2387_probe() on e=
rror
- [Medium] iio: adc: ltc2387: unsynchronized PWM updates in ltc2387_write_r=
aw()
- [Medium] iio: adc: ltc2387: wrong clk_gate duty and period clamp math
- [Low] iio: adc: ltc2387: unused LTC2387_T_CNVH macro and test_pattern fie=
ld
--

commit 1dc8bcd329957722e234d172e41e35994a926ade
Author: Sergiu Cuciurean <sergiu.cuciurean@analog.com>

iio: adc: add ltc2387 driver

This commit adds an IIO ADC driver for the Linear Technology LTC2387-16/18
and Analog Devices ADAQ23875/23876/23878 SAR ADCs using two PWM channels and
the IIO backend framework.

> diff --git a/drivers/iio/adc/ltc2387.c b/drivers/iio/adc/ltc2387.c
> new file mode 100644
> index 0000000000000..c236b99baa4ab
> --- /dev/null
> +++ b/drivers/iio/adc/ltc2387.c
> @@ -0,0 +1,482 @@

[ ... ]

> +#define LTC2387_VREF		4096
> +#define LTC2387_T_CNVH		8

[ ... ]

> +struct ltc2387_info {
> +	const char *name;
> +	struct iio_chan_spec channels[4];
> +	unsigned int test_pattern[2];
> +	int num_channels;
> +	int resolution;
> +	/* Gain * 1000 when adi,gain-milli is absent; unity for the bare parts.=
 */
> +	u32 default_gain_milli;
> +};
> +
> +#define LTC2387_TEST_PATTERN_16 {					\
> +	[ONE_LANE]  =3D 0b1010000001111111,				\
> +	[TWO_LANES] =3D 0b1100110000111111,				\
> +}
> +
> +#define LTC2387_TEST_PATTERN_18 {					\
> +	[ONE_LANE]  =3D 0b101000000111111100,				\
> +	[TWO_LANES] =3D 0b110011000011111100,				\
> +}

[Severity: Low]
Are LTC2387_T_CNVH and the test_pattern field in struct ltc2387_info (along
with LTC2387_TEST_PATTERN_16 and LTC2387_TEST_PATTERN_18) left over from an
earlier version? They are populated across ltc2387_infos[] in
drivers/iio/adc/ltc2387.c, but never read or referenced anywhere in the
driver.

> +
> +static const struct ltc2387_info ltc2387_infos[] =3D {
> +	[ID_LTC2387_16] =3D {
> +		.name =3D "ltc2387-16",
> +		.default_gain_milli =3D 1000,
> +		.resolution =3D 16,
> +		.test_pattern =3D LTC2387_TEST_PATTERN_16,
> +		.channels =3D { LTC2378_CHAN(16, 16) },
> +		.num_channels =3D 1,
> +	},
> +	[ID_LTC2387_16_X4] =3D {
> +		.name =3D "ltc2387-16-x4",
> +		.default_gain_milli =3D 1000,
> +		.resolution =3D 16,
> +		.test_pattern =3D LTC2387_TEST_PATTERN_16,
> +		.channels =3D {
> +			LTC2378_MULTIPLE_CHAN(0, 64, 16, 0),
> +			LTC2378_MULTIPLE_CHAN(1, 64, 16, 16),
> +			LTC2378_MULTIPLE_CHAN(2, 64, 16, 32),
> +			LTC2378_MULTIPLE_CHAN(3, 64, 16, 48),
> +		},
> +		.num_channels =3D 4,
> +	},
> +	[ID_LTC2387_18] =3D {
> +		.name =3D "ltc2387-18",
> +		.default_gain_milli =3D 1000,
> +		.resolution =3D 18,
> +		.test_pattern =3D LTC2387_TEST_PATTERN_18,
> +		.channels =3D { LTC2378_CHAN(18, 32) },
> +		.num_channels =3D 1,
> +	},
> +	[ID_LTC2387_18_X4] =3D {
> +		.name =3D "ltc2387-18-x4",
> +		.default_gain_milli =3D 1000,
> +		.resolution =3D 18,
> +		.test_pattern =3D LTC2387_TEST_PATTERN_18,
> +		.channels =3D {
> +			LTC2378_MULTIPLE_CHAN(0, 128, 18, 0),
> +			LTC2378_MULTIPLE_CHAN(1, 128, 18, 32),
> +			LTC2378_MULTIPLE_CHAN(2, 128, 18, 64),
> +			LTC2378_MULTIPLE_CHAN(3, 128, 18, 96),
> +		},
> +		.num_channels =3D 4,
> +	},

[Severity: High]
How does buffered capture work for the 4-channel entries (ID_LTC2387_16_X4
and ID_LTC2387_18_X4) in ltc2387_infos[]?

In the IIO buffer core (iio_compute_scan_bytes() ->
iio_storage_bytes_for_si()), each enabled scan_index is treated as a separa=
te
sequential scan element whose storagebits / 8 bytes are summed into the tot=
al
scan size.

With each of the 4 channels specifying storagebits of 64 (or 128) and bit
shifts of 0/16/32/48 (or 0/32/64/96), enabling all 4 channels causes
iio_compute_scan_bytes() to compute 32 bytes (4 x 8) or 64 bytes (4 x 16) p=
er
scan instead of 8 or 16 bytes. Standard IIO userspace consumers step forward
by storagebits / 8 bytes per channel, so they will read each channel from a
different conversion sample and discard three quarters of the data (and
128-bit storage words with shifts up to 96 are not supported by standard IIO
tooling).

Also, since ltc2387_probe() enables only a single backend capture channel
(iio_backend_chan_enable(ltc->back, 0)) that transfers all 4 scan elements
together in hardware DMA mode without per-channel hardware enablement or
software demuxing, shouldn't the channels use per-channel storagebits (16 a=
nd
32 with shift 0) and set indio_dev->available_scan_masks to require all 4
channels to be enabled together?

[ ... ]

> +static int ltc2387_set_sampling_freq(struct ltc2387_dev *ltc, int freq)
> +{
> +	unsigned long long ref_clk_period_ns;
> +	struct pwm_waveform clk_gate_wf =3D { }, cnv_wf =3D { };
> +	unsigned long long period_cycles;
> +	int ret, clk_en_time;
> +	u32 rem;
> +
> +	if (freq <=3D 0 || freq > ltc->ref_clk_rate)
> +		return -EINVAL;
> +
> +	ref_clk_period_ns =3D DIV_ROUND_UP(NSEC_PER_SEC, ltc->ref_clk_rate);

[ ... ]

> +	/* Gate the active period of the clock (see page 10-13 for both LTC's) =
*/
> +	if (ltc->lane_mode =3D=3D TWO_LANES)
> +		clk_en_time =3D DIV_ROUND_UP_ULL(ltc->device_info->resolution, 4);
> +	else
> +		clk_en_time =3D DIV_ROUND_UP_ULL(ltc->device_info->resolution, 2);
> +
> +	clk_gate_wf.duty_length_ns =3D ref_clk_period_ns * clk_en_time;
> +	clk_gate_wf.duty_offset_ns =3D LTC2387_T_FIRSTCLK_NS;
> +
> +	if (cnv_wf.period_length_ns < clk_gate_wf.duty_length_ns)
> +		cnv_wf.period_length_ns =3D clk_gate_wf.duty_length_ns + ref_clk_perio=
d_ns;

[Severity: Medium]
Can the rounding and period clamp in ltc2387_set_sampling_freq() produce the
wrong number of gated clock cycles or a 100% duty cycle clock?

First, ref_clk_period_ns rounds a single reference clock cycle up to integer
nanoseconds via DIV_ROUND_UP(NSEC_PER_SEC, ltc->ref_clk_rate), and
clk_gate_wf.duty_length_ns multiplies that pre-rounded value by clk_en_time
(up to 9 cycles). When the PWM driver converts nanoseconds back to clock
cycles via floor(ns * R / NSEC_PER_SEC), the accumulated upward rounding
error across clk_en_time cycles can add an extra clock cycle. For example, =
on
an 18-bit part in ONE_LANE mode (clk_en_time =3D 9) at ref_clk_rate =3D 160=
 MHz
(6.25 ns period), ref_clk_period_ns is 7 ns and duty_length_ns becomes 63 n=
s,
which rounds to floor(63 * 160e6 / 1e9) =3D 10 cycles instead of 9. Similar=
ly,
on a 16-bit part in ONE_LANE mode (clk_en_time =3D 8) at ref_clk_rate =3D 1=
20 MHz
and freq =3D 15 MHz, cnv_wf.period_length_ns is 67 ns (8 cycles) while
duty_length_ns is 72 ns, unexpectedly triggering the period clamp to 81 ns
(9 cycles, 13.33 MHz).

Second, the clamp condition checks if cnv_wf.period_length_ns <
clk_gate_wf.duty_length_ns, whereas the body sets cnv_wf.period_length_ns to
clk_gate_wf.duty_length_ns + ref_clk_period_ns. If cnv_wf.period_length_ns =
=3D=3D
clk_gate_wf.duty_length_ns (for example, at ref_clk_rate =3D 100 MHz on an
18-bit part in ONE_LANE mode when requesting 12 MHz, where both are 90 ns),
the clamp is skipped, leaving clk_gate_wf with a 100% duty cycle and a
shorter period at 12 MHz (90 ns) than at 15 MHz (clamped to 100 ns).

> +
> +	clk_gate_wf.period_length_ns =3D cnv_wf.period_length_ns;
> +
> +	if (clk_gate_wf.duty_offset_ns >=3D clk_gate_wf.period_length_ns)
> +		div64_u64_rem(clk_gate_wf.duty_offset_ns,
> +			      clk_gate_wf.period_length_ns,
> +			      &clk_gate_wf.duty_offset_ns);
> +
> +	ret =3D pwm_set_waveform_might_sleep(ltc->cnv, &cnv_wf, false);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D pwm_set_waveform_might_sleep(ltc->clk_gate, &clk_gate_wf, false=
);
> +	if (ret < 0)
> +		return ret;
> +
> +	period_cycles =3D mul_u64_u32_div(cnv_wf.period_length_ns,
> +					ltc->ref_clk_rate, NSEC_PER_SEC);
> +	if (!period_cycles)
> +		return -EINVAL;
> +
> +	ltc->sampling_freq =3D DIV_ROUND_CLOSEST_ULL(ltc->ref_clk_rate,
> +						   period_cycles);
> +
> +	return 0;
> +}

[ ... ]

> +static int ltc2387_write_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int val, int val2, long info)
> +{
> +	struct ltc2387_dev *ltc =3D iio_priv(indio_dev);
> +
> +	switch (info) {
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		return ltc2387_set_sampling_freq(ltc, val);
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}

[Severity: Medium]
What prevents concurrent or mid-capture updates to the PWM channels in
ltc2387_write_raw() -> ltc2387_set_sampling_freq()?

Because iio_write_channel_info() does not hold an IIO device lock and
ltc2387_write_raw() neither claims direct mode (e.g., via
iio_device_claim_direct()) nor acquires a driver mutex:

1. Userspace can write to sampling_frequency while buffered capture is
   active, reprogramming ltc->cnv and ltc->clk_gate non-atomically mid-stre=
am.
2. Concurrent writes across separate file descriptors can interleave the two
   sleeping pwm_set_waveform_might_sleep() calls and the update to
   ltc->sampling_freq.
3. If pwm_set_waveform_might_sleep(ltc->cnv, ...) succeeds and
   pwm_set_waveform_might_sleep(ltc->clk_gate, ...) fails, ltc->cnv is left
   running at the new period while ltc->clk_gate and ltc->sampling_freq
   remain at the old settings.

[ ... ]

> +static int ltc2387_probe(struct platform_device *pdev)
> +{
> +	struct iio_dev			*indio_dev;
> +	struct ltc2387_dev		*ltc;
> +	int				ret;
> +
> +	indio_dev =3D devm_iio_device_alloc(&pdev->dev, sizeof(*ltc));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	ltc =3D iio_priv(indio_dev);
> +
> +	ltc->vref =3D devm_regulator_get_optional(&pdev->dev, "vref");
> +	if (!IS_ERR(ltc->vref)) {
> +		ret =3D regulator_enable(ltc->vref);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Can't enable vref regulator\n");
> +			return ret;
> +		}
> +		ret =3D regulator_get_voltage(ltc->vref);
> +		if (ret < 0)
> +			return ret;
> +
> +		ltc->vref_mv =3D ret / 1000;
> +		ret =3D devm_add_action_or_reset(&pdev->dev,
> +					       ltc2387_regulator_disable,
> +					       ltc->vref);
> +		if (ret)
> +			return ret;

[Severity: Medium]
Does ltc2387_probe() leak the regulator enable count on ltc->vref if
regulator_get_voltage() fails?

In ltc2387_probe(), regulator_enable(ltc->vref) is called before
regulator_get_voltage(ltc->vref), while the devm_add_action_or_reset()
registration for ltc2387_regulator_disable() happens after
regulator_get_voltage(). If regulator_get_voltage() returns a negative erro=
r,
ltc2387_probe() returns early without disabling ltc->vref (or should this u=
se
devm_regulator_get_enable_read_voltage()?).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027134409.7682=
4-1-Nicolae-daniel.Deaconescu@analog.com?part=3D2
