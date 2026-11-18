Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006815;
	b=03/mUaC+Zaef97r+Q7A3S4y73NA0xEp45xyZHA65nBclw9UaRT47PmYMn9zjkL17OhPO
	 gmh6Tu3z5f7gwj6HKzT6f78EKhxEEyQEtG1//p88ieJpU3ir6Zsvn7zUyX8UewwxJYbz4
	 nbu/tQhDSNiyR5zgD4W0E8j1+4en8RN2fIQUM2RP63YZkOqdCVv7dJ1GKd5LkGiProJhs
	 N9mwkC71hwjwdtmE8CFFdruL+ktOsBw439jERvDPbJ1PkSSJVdOL4JtWeZ8ceZ8XiIv6a
	 QUp50kYOxz563JTCEVmLOpfrXwV33pWG7EBVa3BTEXW+itpSz7Hl9OJSgI9pgR2F5iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006815;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=c2Md27mzgQqGKS58/qb5jNxA9sx6AvnV0Ln+eepzMlY=;
	b=fxHJl/+e4OSo/Lbpg//eJ+hy76OMkaQBRxx8pOI+DQXPGQG7tB5q/AbPrrRZxt8K+jhZ
	 1dOrkYjOiy6KLwMJ9hTPXUlN70NaI7AY6xbcF9CIBuaHtx6GDkk3qp5Q1YffmPk0uvxvO
	 aJ+DzO/eotXoIdgQrPY5ESoHa6gOLOy/AUfpZXyXL/ZeUqNo1sRoeZE8QufJ0dK6DUcS7
	 Bgz0rilBmKhBjaZ0sSa/L3+1RYi+wUqblEkSiEsRU6NiTVAIZeQ7rLGES6hDhp9q03DFB
	 3GSmGwd18PszMsdp+txVED4qKI+IOxwLjHdtgAtZQ/Dbu1F1TmkNb6diLWkhJMIqahA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C2chBP3y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C420F606A333
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C2chBP3y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2473F1F000CE;
	Wed, 18 Nov 2026 13:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795006815;
	bh=c2Md27mzgQqGKS58/qb5jNxA9sx6AvnV0Ln+eepzMlY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C2chBP3yc9vpy9WjdO1SYbz9p3/IBok3UPSqwYKBGlS2ddmOvDUB+whVYUQfYG1Z2
	 wROkiIzAFTX8XpA+SUe1BFIedl2DS/t+2yANdxY5uXZx83EuZiObrYnaaMmE/aF74r
	 IhyY75YV83/QWiXTftbr71qtB6xzrJgpJll6wPqQLqMvmQFpimKeq74/6LxsBEHEvX
	 l/2EjK0ntF7dlSECaSVgwrv9uSKrpaXHiJ+NP3tg1dxxU1tdciPRGURnrylQ1tID2+
	 2McdY6E/RzvGEpQySriIkSQ5+weieLUU3IU/hTwysa8AeiRcFxYYzIE33jGg6Eq131
	 1poIbTj2HawTA==
Message-ID: <sashiko-outbox-220959@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] pwm: add Axiado AX3000 PWM driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-axiado-ax3000-pwm-v7-2-bbd21a8cf861@axiado.com>
References: <20261118-axiado-ax3000-pwm-v7-0-bbd21a8cf861@axiado.com>
 <20261118-axiado-ax3000-pwm-v7-2-bbd21a8cf861@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 13:00:14 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] pwm: axiado: report AXIADO_PWM_PERIOD_MIN for constant-low
  waveform
- [Low] pwm: axiado: missing clock rate upper bound check in
  axiado_pwm_probe()
- [Low] pwm: axiado: enabled state with zero period misreported as
  disabled
--

commit 7728e28931a7e60a27c5a0287f72bca3566ff745
Author: Petar Stepanovic <pstepanovic@axiado.com>

pwm: add Axiado AX3000 PWM driver

This commit adds a PWM driver for the single-channel PWM controller on
Axiado AX3000 and AX3005 SoCs using the waveform callbacks.

> diff --git a/drivers/pwm/pwm-axiado.c b/drivers/pwm/pwm-axiado.c
> new file mode 100644
> index 0000000000000..08ae3d8ed4bb1
> --- /dev/null
> +++ b/drivers/pwm/pwm-axiado.c
[ ... ]
> +static int
> +axiado_pwm_round_waveform_tohw(struct pwm_chip *chip,
> +			       struct pwm_device *pwm,
> +			       const struct pwm_waveform *wf,
> +			       void *_wfhw)
> +{
[ ... ]
> +	if (!duty) {
> +		/*
> +		 * A zero high time makes the hardware emit a constant high
> +		 * output, so use the constant low period encoding for a 0%
> +		 * duty cycle. The high time must stay non-zero because it
> +		 * takes precedence over that encoding. The requested period
> +		 * is lost, .round_waveform_fromhw() reports a single clock
> +		 * cycle instead.
> +		 */
> +		*wfhw =3D (struct axiado_pwm_waveform) {
> +			.period =3D AXIADO_PWM_PERIOD_CONST_LOW,
> +			.duty =3D AXIADO_PWM_DUTY_MIN,
> +			.enabled =3D true,
> +		};
> +
> +		/* That single cycle is longer than a sub-cycle request. */
> +		return period ? 0 : 1;
> +	}
> +
> +	if (period < AXIADO_PWM_PERIOD_MIN) {
> +		period =3D AXIADO_PWM_PERIOD_MIN;
> +		ret =3D 1;

[Severity: Medium]
Should the constant-low encoding use AXIADO_PWM_PERIOD_MIN (2 clock cycles)
instead of 1 clock cycle as its minimum and reported period?

When duty is 0, axiado_pwm_round_waveform_tohw() accepts a 1-cycle period
with return value 0 and axiado_pwm_round_waveform_fromhw() reports
AXIADO_PWM_PERIOD_CONST_LOW as period =3D 1, whereas any non-zero duty cycle
requires period >=3D AXIADO_PWM_PERIOD_MIN (2) and rounds a 1-cycle period =
up
with return value 1.

When CONFIG_PWM_PROVIDE_GPIO is enabled, pwm_gpio_set() probes the minimum
period with period_length_ns =3D 1 and duty_length_ns =3D 0, which rounds t=
o 1
clock cycle.  Driving the GPIO high then sets duty_length_ns =3D
period_length_ns (1 clock cycle) and calls pwm_set_waveform_might_sleep()
with exact =3D true, which rounds the period up to 2 clock cycles and fails
with -EDOM:

drivers/pwm/core.c:pwm_gpio_set() {
	struct pwm_waveform wf =3D {
		.period_length_ns =3D 1,
	};
    ...
	ret =3D pwm_round_waveform_might_sleep(pwm, &wf);
	if (ret < 0)
		return ret;

	if (value)
		wf.duty_length_ns =3D wf.period_length_ns;
	else
		wf.duty_length_ns =3D 0;

	return pwm_set_waveform_might_sleep(pwm, &wf, true);
}

Reporting AXIADO_PWM_PERIOD_MIN for AXIADO_PWM_PERIOD_CONST_LOW in
axiado_pwm_round_waveform_fromhw() and returning period <
AXIADO_PWM_PERIOD_MIN ? 1 : 0 when !duty in
axiado_pwm_round_waveform_tohw() keeps the minimum period consistent across
all duty cycles.

[ ... ]
> +static int
> +axiado_pwm_round_waveform_fromhw(struct pwm_chip *chip,
> +				 struct pwm_device *pwm,
> +				 const void *_wfhw,
> +				 struct pwm_waveform *wf)
> +{
[ ... ]
> +	/*
> +	 * The constant low encoding doesn't hold a period. Report the
> +	 * shortest one, the output is low for all of it either way.
> +	 */
> +	if (!duty) {
> +		if (period =3D=3D AXIADO_PWM_PERIOD_CONST_LOW)
> +			period =3D AXIADO_PWM_PERIOD_MAX;
> +
> +		duty =3D period;
> +	} else if (period =3D=3D AXIADO_PWM_PERIOD_CONST_LOW) {
> +		period =3D 1;
> +		duty =3D 0;
> +	} else if (duty > period) {
> +		duty =3D period;
> +	}
> +
> +	*wf =3D (struct pwm_waveform) {
> +		.period_length_ns =3D
> +			mul_u64_u64_div_u64_roundup(period, NSEC_PER_SEC,
> +						    axpwm->rate),
> +		.duty_length_ns =3D
> +			mul_u64_u64_div_u64_roundup(duty, NSEC_PER_SEC,
> +						    axpwm->rate),
> +		.duty_offset_ns =3D 0,
> +	};

[Severity: Low]
Can axiado_pwm_round_waveform_fromhw() report a disabled waveform when the
hardware is enabled with AXIADO_PWM_PERIOD_REG =3D=3D 0?

If pre-kernel firmware leaves the controller enabled with period =3D=3D 0 (=
for
instance with duty =3D=3D 0, where a zero high time still drives the output
constant high), period and duty both remain 0 and wf->period_length_ns is
computed as 0.  Because period_length_ns =3D=3D 0 encodes a disabled wavefo=
rm,
pwm_get_state_hw() records pwm->state.enabled =3D false, and a subsequent
pwm_apply_might_sleep() call to disable the channel returns early in
__pwm_apply() without clearing AXIADO_PWM_CTRL_ENABLE.

[ ... ]
> +static int axiado_pwm_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	axpwm->rate =3D clk_get_rate(clk);
> +	if (!axpwm->rate)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Failed to get clock rate\n");

[Severity: Low]
Should axiado_pwm_probe() also reject axpwm->rate > NSEC_PER_SEC?

If clk_get_rate() exceeds NSEC_PER_SEC, a single clock cycle is shorter
than 1 ns, breaking nanosecond-to-cycle rounding idempotency and sub-cycle
detection in axiado_pwm_round_waveform_tohw(), and allowing
mul_u64_u64_div_u64() to overflow a 64-bit quotient for large
wf->period_length_ns values.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-axiado-ax3=
000-pwm-v7-0-bbd21a8cf861@axiado.com?part=3D2
