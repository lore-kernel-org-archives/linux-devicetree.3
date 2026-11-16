Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814156;
	b=lzVzKsnEzjboyClni+tiTF9uWv+ml/0SkdoVD9kfEAjhH0H97HP1Q9OKrPX9kols9xkf
	 Ac9edKRZLuPUqAWLdDFHnAhZoXpcfVHWloLba7nrYZ38otHEZ3jNunm+PhN7yz5VW4Pdu
	 PN9TCrBFf8Mgqq1aLAfVVN7B2qXOOUvW+it5yDOuvpjvdT2UMeEM1IIfFCVSEwvdj8NYO
	 3tdVNJvq2cfKiVlyWxus68nSP5KzfJM5Kj0vFJwjNO3c9RQ2hvOpdYaJj655fwDZovOrW
	 Oywy4orMT2057SvORKANoFd+9jLgY593shKZV2QxbqsxpY/Rb3mGNHoDTNsCFHnN/SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814156;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JHYKWmVYPE5eH/vdxc8HJR5NeAkvCuAFQJr757N0XWw=;
	b=SX7UvCMLnxaiXobdhaxE0VTlr1N32snuj6PbQet+CyRQpZS7P/NQwToz3btTwKyNWwYo
	 lThkmyFw0cXaBC/BSL8E3Gf7xsa/Dj6sdW09Y7iacIRQRr5K1lBmNuEp6WzL7EOP+v+b7
	 6PFYtSrXajRgb0VLuFwXL2uCGc//yhFCP8FmLJH8yoUnOkAP3Po0v0X3QAVa7jjjPPOZv
	 0oqeAPGXEP9cE2xzXhZILcYwBO21gyupm3sG0TBiYljvdNQ2601MmLFMFugcgOz9Xbo4M
	 oRiBKD772+9dzQ9FEDvohNK0145AfagilcnET8Nbd9ZOtsO3yKmgnw5N57i9P+sYLfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LgnBGuku;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C2B606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LgnBGuku
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F951F000C4;
	Mon, 16 Nov 2026 07:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814155;
	bh=JHYKWmVYPE5eH/vdxc8HJR5NeAkvCuAFQJr757N0XWw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LgnBGuku75gZW2WwLvyB5Japiz7UK3nwH6OBuJcPLhNE32aAElP38ZVGgnVVryOls
	 yZhAYnOtLXzUEYgA/l9kmYozwVx6KWoC8F/Ba6NTLhx7f+ctsGEK5Q1kfk2GYpo72x
	 mI+HZFHEjxvFNXK0SX707iFZPAuPUD1RweUYZ+AIrLdVdRSGB8h6enaqEqW7UsiSg7
	 1q8C59UZCl4LlKWMNCWBQzdjBRhTY27Ps5LMO/4CCMgG7FIZe+rSSa/R0vtXr2TI25
	 fzYDwrHTwyiRQ4GVYwFJjHzLiaxpiPQn41KglRZgRwv1qX4EuS0GmhH+j0j9wZw1sO
	 PcnP0SrResmkA==
Message-ID: <sashiko-outbox-216428@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] pwm: qcom: add Shikra PWM controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-pwm_qcom_shikra-v1-2-67ee4553adc5@oss.qualcomm.com>
References: <20261116-pwm_qcom_shikra-v1-0-67ee4553adc5@oss.qualcomm.com>
 <20261116-pwm_qcom_shikra-v1-2-67ee4553adc5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 07:29:14 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [High] pwm: qcom: division by zero in qcom_pwm_config() when cycles >
  rate
- [High] pwm: qcom: broken duty-cycle math and -ERANGE check in
  qcom_pwm_config()
- [High] pwm: qcom: qcom_pwm_apply() runs qcom_pwm_config() when
  !state->enabled
- [Medium] pwm: qcom: unrounded current_period_ns check in
  qcom_pwm_config() fails
- [Medium] pwm: qcom: desynchronized software state in qcom_pwm_apply()
  and config
- [Medium] pwm: qcom: partial state mutation before validation in
  qcom_pwm_config()
- [Low] pwm: qcom: unnamed regmap_config collision in
  qcom_pwm_parse_dt()
--

commit 06e62578a3838a59f7adc59ac3054518eb4e4082
Author: Taniya Das <taniya.das@oss.qualcomm.com>

pwm: qcom: add Shikra PWM controller support

This commit adds a PWM controller driver for Qualcomm Shikra SoCs, modeling
up to ten independent PWM frames from DT child nodes with a shared
output-enable register and shared AHB and core clocks.

> diff --git a/drivers/pwm/pwm-qcom.c b/drivers/pwm/pwm-qcom.c
> new file mode 100644
> index 0000000000000..9b15cdcaa5c76
> --- /dev/null
> +++ b/drivers/pwm/pwm-qcom.c

[ ... ]

> +static int qcom_pwm_calc_frequency(struct qcom_pwm_chip *chip,
> +				   u64 period_ns, unsigned long rate, u32 hw_idx)
> +{
> +	struct regmap *frame_regmap =3D chip->frames[hw_idx].regmap;
> +	u64 cycles;
> +	int ret;
> +
> +	/*
> +	 * PWM client can set the period only once if the HW version does
> +	 * not support reset functionality.
> +	 */
> +	if (chip->frames[hw_idx].freq_set && !chip->priv_data->pwm_reset_suppor=
t)
> +		return 0;
> +
> +	/*
> +	 * Number of core-clock cycles in one PWM period. Round down so the
> +	 * implemented period never exceeds the requested one, as the PWM API
> +	 * requires. PWM_CYC_CFG holds (cycles - 1) in its low 16 bits, so
> +	 * cycles is bounded to [2, 65536], i.e. an output frequency from
> +	 * rate / 2 down to rate / 65536.
> +	 */
> +	cycles =3D mul_u64_u64_div_u64(period_ns, rate, NSEC_PER_SEC);
> +	if (cycles < 2 || cycles > 65536) {
> +		dev_dbg(regmap_get_device(frame_regmap),
> +			"period %llu ns out of range for rate %lu Hz\n",
> +			period_ns, rate);
> +		return -ERANGE;
> +	}
> +
> +	ret =3D regmap_update_bits(frame_regmap, PWM_CYC_CFG,
> +				 PWM_FRAME_VAL_MASK, cycles - 1);
> +	if (ret)
> +		return ret;
> +
> +	chip->frames[hw_idx].current_freq =3D div64_ul(rate, cycles);
> +	chip->frames[hw_idx].freq_set =3D true;
> +	chip->frames[hw_idx].current_period_ns =3D period_ns;
> +
> +	return 0;
> +}

[ ... ]

> +static int qcom_pwm_config(struct qcom_pwm_chip *chip,
> +			   u32 hw_idx, u64 duty_ns, u64 period_ns, int polarity)
> +{

[ ... ]

> +	if (chip->frames[hw_idx].freq_set &&
> +	    chip->frames[hw_idx].current_period_ns !=3D period_ns) {
> +		if (chip->priv_data->pwm_reset_support) {
> +			ret =3D regmap_update_bits(frame_regmap, PWM_RESET,
> +						 PWM_FRAME_RESET_BIT,
> +						 PWM_FRAME_RESET_BIT);
> +			if (ret)
> +				goto out;
> +		} else {
> +			ret =3D -EINVAL;
> +			goto out;
> +		}
> +	}

[Severity: Medium]
Does comparing against the unrounded current_period_ns cause re-applying the
state returned by qcom_pwm_get_state() to fail with -EINVAL on
qcom,shikra-pwm?

qcom_pwm_calc_frequency() rounds cycles down and stores the caller's
unrounded period_ns in current_period_ns, whereas qcom_pwm_get_state()
returns the hardware period rounded up from cycles.  Because shikra_pwm_data
leaves pwm_reset_support false, re-applying the state read back from
qcom_pwm_get_state() (for example in pwm_apply_debug() or a consumer
read-modify-write update) sees period_ns !=3D current_period_ns and returns
-EINVAL even though both periods map to the same cycle count.

> +
> +	ret =3D qcom_pwm_calc_frequency(chip, current_period, rate, hw_idx);
> +	if (ret)
> +		goto out;
> +
> +	if (chip->frames[hw_idx].polarity !=3D polarity) {
> +		ret =3D regmap_update_bits(frame_regmap, PWM_CTL0,
> +					 PWM_FRAME_POLARITY_BIT, polarity);
> +		if (ret)
> +			goto out;
> +
> +		chip->frames[hw_idx].polarity =3D polarity;
> +	}
> +
> +	ctl1 =3D DIV_ROUND_CLOSEST(rate, chip->frames[hw_idx].current_freq);

[Severity: High]
Can this divide by zero when cycles > rate?

When the core clock is divided below 65536 Hz (down to 37.5 kHz on Shikra)
and a valid period longer than one second is requested (rate < cycles <=3D
65536), div64_ul(rate, cycles) in qcom_pwm_calc_frequency() truncates
current_freq to 0, and DIV_ROUND_CLOSEST(rate, current_freq) divides by zer=
o.
Even when cycles <=3D rate, round-tripping through an integer current_freq
loses cycle-count precision compared to using cycles directly.

> +	duty_percent =3D mul_u64_add_u64_div_u64(duty_ns, 100, current_period /=
 2, current_period);
> +	ctl1 =3D mul_u64_add_u64_div_u64(ctl1, duty_percent, 50, 100);
> +
> +	ret =3D regmap_read(frame_regmap, PWM_CYC_CFG, &cyc_cfg);
> +	if (ret)
> +		goto out;
> +
> +	if ((ctl1 > cyc_cfg || ctl1 =3D=3D 0) && duty_ns !=3D 0) {
> +		dev_err(regmap_get_device(frame_regmap),
> +			"duty cycle out of valid range\n");
> +		ret =3D -ERANGE;
> +		goto out;
> +	}

[Severity: High]
Does this calculation reject valid 100% and < 0.5% duty cycles with -ERANGE
and quantize PWM_CTL1 to integer percentages?

PWM_CYC_CFG stores cycles - 1, so when duty_ns =3D=3D period_ns (or >=3D 99=
.5% of
period_ns), duty_percent rounds to 100 and ctl1 becomes cycles (cyc_cfg + 1=
),
tripping ctl1 > cyc_cfg.  When 0 < duty_ns < 0.5% of period_ns, duty_percent
rounds to 0 and ctl1 =3D=3D 0 with duty_ns !=3D 0 also returns -ERANGE inst=
ead of
programming the cycle count or rounding down to 0.  Quantizing through a
rounded 0..100 percentage also discards the 16-bit counter resolution of
PWM_CTL1 and rounds duty_cycle up, contrary to the PWM framework contract a=
nd
the comment in qcom_pwm_get_state().

[Severity: Medium]
If the ctl1 range check above fails, does qcom_pwm_config() leave hardware
registers and per-frame state partially updated?

qcom_pwm_calc_frequency() has already written PWM_CYC_CFG and set
freq_set =3D true and current_period_ns, and the polarity block has already
updated PWM_CTL0 and frame->polarity, while __pwm_apply() leaves pwm->state
unchanged on error.  On qcom,shikra-pwm (!pwm_reset_support), an initial
apply that fails the ctl1 check leaves freq_set true for the failed period,
causing subsequent apply calls with any other period to fail with -EINVAL.

[ ... ]

> +static int qcom_pwm_apply(struct pwm_chip *pwm_chip, struct pwm_device *=
pwm,
> +			  const struct pwm_state *state)
> +{
> +	struct qcom_pwm_chip *chip =3D to_qcom_pwm_chip(pwm_chip);
> +	struct pwm_state curr_state;
> +	u32 hw_idx =3D pwm->hwpwm;
> +	int ret;
> +
> +	pwm_get_state(pwm, &curr_state);
> +
> +	if (state->period &&
> +	    (state->period !=3D curr_state.period ||
> +	     state->duty_cycle !=3D curr_state.duty_cycle ||
> +	     state->polarity !=3D curr_state.polarity)) {
> +		ret =3D qcom_pwm_config(chip, hw_idx, state->duty_cycle,
> +				      state->period, state->polarity);
> +		if (ret) {
> +			dev_err(pwmchip_parent(pwm_chip),
> +				"failed to update PWM configuration\n");
> +			return ret;
> +		}
> +	}

[Severity: High]
Should qcom_pwm_apply() skip qcom_pwm_config() when !state->enabled?

When disabling an active PWM, running qcom_pwm_config() first can fail (for
example with -EINVAL if state->period changed on Shikra, or -ERANGE) and
return before qcom_pwm_disable() is reached, leaving the output active and
its ahb and core clocks enabled.  When a channel is exported via sysfs while
disabled, qcom_pwm_get_state() initializes pwm->state.period from the reset
default PWM_CYC_CFG =3D=3D 0 (1 clock cycle), so writing duty_cycle or pola=
rity
before period calls qcom_pwm_config() with a 1-cycle period and fails with
-ERANGE, while writing period while disabled sets freq_set =3D true and loc=
ks
the period before the channel is ever enabled.

> +
> +	if (state->enabled !=3D curr_state.enabled) {
> +		if (state->enabled)
> +			return qcom_pwm_enable(chip, pwm);
> +
> +		ret =3D qcom_pwm_disable(chip, pwm);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Can comparing against curr_state (pwm->state) and frame->polarity skip
necessary hardware updates or disable clocks twice?

When a channel is first requested, pwm_device_request() populates pwm->state
from qcom_pwm_get_state() while frame->freq_set remains false; if a consumer
then enables the channel with those same period, duty_cycle, and polarity
values, qcom_pwm_apply() sees no change from curr_state, skips
qcom_pwm_config(), and enables an unconfigured frame.  Similarly,
frame->polarity is initialized to 0 rather than read from PWM_CTL0, so
qcom_pwm_config() will not clear PWM_FRAME_POLARITY_BIT if it was set prior
to probe and PWM_POLARITY_NORMAL is requested.

[ ... ]

> +static const struct regmap_config pwm_regmap_config =3D {
> +	.reg_bits   =3D 32,
> +	.reg_stride =3D 4,
> +	.val_bits   =3D 32,
> +	.fast_io    =3D true,
> +};
> +
> +static int qcom_pwm_parse_dt(struct platform_device *pdev,
> +			     struct pwm_chip *pwm_chip,
> +			     struct qcom_pwm_chip *chip)
> +{
> +	struct device *dev =3D pwmchip_parent(pwm_chip);
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct device_node *frame_node;
> +	void __iomem *base;
> +	unsigned long frame_ids =3D 0;
> +	int ret;
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	chip->regmap =3D devm_regmap_init_mmio(dev, base, &pwm_regmap_config);

[ ... ]

> +		chip->frames[n].regmap =3D
> +			devm_regmap_init_mmio(dev, base, &pwm_regmap_config);

[Severity: Low]
Does registering chip->regmap and every chip->frames[n].regmap on the same
device with an unnamed pwm_regmap_config collide in regmap debugfs?

Because pwm_regmap_config.name is NULL, regmap_debugfs_init() uses
dev_name(dev) for all of them under /sys/kernel/debug/regmap/, causing every
per-frame regmap to fail debugfs directory creation with -EEXIST during
probe.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pwm_qcom_s=
hikra-v1-0-67ee4553adc5@oss.qualcomm.com?part=3D2
