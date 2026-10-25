Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792919012;
	b=MDUHuklWtjgGtgvk4bJc1XXFmj5pcep/wJzqO/O31459hc/XjnsPn8VFDWzrCtZL1Ns0
	 QWqZaJyHsMPOChv+09A8hFu6tqeJUlD4C41D5wEsBWhBBIH4SotRakQk7B0ncNfnflFQO
	 P6jm/494YofsD5XV9cDYn+BhLHzsUtq19sU8FqDaORY1qvArL+2bLoFtLRgJSLe+JHyhl
	 DwTDpcIHa9ibr8dGdtQM6zA6d9bH0wXIkpmLT/OImqJvJeO0vbhHAZKxoKYZtc6hHwDhR
	 KMLISOlEybGpOKusuod2e/51PhO9HhkQdXpvZm4VA9PLB+cT5UkTmqHWlPgax/3xa9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792919012;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+NilHK3oMugeEXT7HBDL+cSg2hLN62/X+Khq5RcBrX0=;
	b=KU94Wj0UGIpcPtkoGWUcN5+WpZ0Y7j148Uw09mcpYj0h42uWN/tqAj8wmQwo7KFmvna/
	 n+PFi/p15wdi/rhGde0PXHwxfQAH9BOatZjPfyCqKHOlNqBQEkJ4pEarNS4FY6VyeeHoN
	 QylGvu9HjtBCNRjvD61DaQ1GQ0z2hEH4v8EOrAQT6796ljw5Qond2Xq4bWQsTCEfUnj4g
	 9y713G/wo7W4klWLfQDb467aDwrjaIYdnz69XFDmw4g6uFtLdKfs59W+2JdHFvKBMd/TT
	 1sB1CcsiyQCPM8EvX+gWSJDxjyd0byL0hJFnuSaWewrEdGRkio+T7kzp0qObfEyPmow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0eTlElL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA17606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0eTlElL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E155C1F01825;
	Sun, 25 Oct 2026 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792919012;
	bh=+NilHK3oMugeEXT7HBDL+cSg2hLN62/X+Khq5RcBrX0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P0eTlElLPf+gSRES5x9Xm0CjafmR2YFIo42mPcmS5CjZks/kTrTl0pIG4jRrQqfB7
	 MxIiHrDk2j2+Rs265rJzkQmolbhsJmYht3ucPD54QBY1DzQlnrUdJyC4i4MPuNrf4N
	 5//2ISx6sW+QH9j5UHFoqu4WBAK1/0iU7uhlEHdukK9+/2POZxRURUokniFX00UCbL
	 J8MQyufW7X20wDNpP25s628DAiiQ6k8QwrbNsYNap2r910Tbr3Mw+FVdTHbMdB/rz7
	 WnFnB9nf3S/LjyfkaFuojIxG3kMMuMDnkIz9KpKoCXCUCdq7658CLrSMStMqMZzRVI
	 eqNOWaTvG7UCA==
Message-ID: <sashiko-outbox-184150@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] pwm: Add a driver for the Ingenic X1600 PWM
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Louvignes" <olivier@mgcrea.io>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261025084643.93167-3-olivier@mgcrea.io>
References: <20261025084643.93167-1-olivier@mgcrea.io>
 <20261025084643.93167-3-olivier@mgcrea.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 09:03:31 +0000
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
- [Medium] pwm: ingenic-x1600: fix disabled state in x1600_pwm_round_wavefo=
rm_fromhw()
- [Medium] pwm: ingenic-x1600: missing zero clock rate check in tohw and wr=
ite callbacks
--

commit 74e98d5b2d04354ee35668eb97dc06066a966e45
Author: Olivier Louvignes <olivier@mgcrea.io>

pwm: Add a driver for the Ingenic X1600 PWM controller

This commit adds a PWM driver for the 8-channel PWM controller found on the
Ingenic X1600 SoC, implementing the PWM waveform callbacks.

> diff --git a/drivers/pwm/pwm-ingenic-x1600.c b/drivers/pwm/pwm-ingenic-x1=
600.c
> new file mode 100644
> index 0000000000000..83a8d5eec6bff
> --- /dev/null
> +++ b/drivers/pwm/pwm-ingenic-x1600.c
[ ... ]
> +static int x1600_pwm_round_waveform_tohw(struct pwm_chip *chip, struct p=
wm_device *pwm,
> +					 const struct pwm_waveform *wf, void *_wfhw)
> +{
> +	struct x1600_pwm *x =3D pwmchip_get_drvdata(chip);
> +	unsigned long rate =3D clk_get_rate(x->clk);
> +	struct x1600_pwm_wfhw *wfhw =3D _wfhw;
> +	u64 period, high, offset;
> +	unsigned int prescale;
> +	int ret =3D 0;
> +
> +	*wfhw =3D (struct x1600_pwm_wfhw){ };
> +	if (!wf->period_length_ns)
> +		return 0;

[Severity: Medium]
Should x1600_pwm_round_waveform_tohw() check for !rate and return -EINVAL j=
ust
like x1600_pwm_round_waveform_fromhw() does?

When rate is 0 and wf->period_length_ns > 0, x1600_pwm_counts() returns 0,
which clamps period to 2 with high =3D 0 and wfhw->enabled =3D false, retur=
ning 1.
In pwm_set_waveform_might_sleep() -> __pwm_set_waveform() with exact =3D=3D=
 false
and CONFIG_PWM_DEBUG disabled, __pwm_round_waveform_fromhw() is not called,=
 so
x1600_pwm_write_waveform() is invoked with that wfhw and disables the chann=
el
while returning 0 to the caller.

> +
> +	for (prescale =3D 0; prescale < X1600_PWM_MAX_PRESCALE; prescale++)
> +		if (x1600_pwm_counts(wf->period_length_ns, rate, prescale) <=3D
> +		    X1600_PWM_MAX_COUNT)
> +			break;
> +
> +	period =3D min(x1600_pwm_counts(wf->period_length_ns, rate, prescale),
> +		     X1600_PWM_MAX_COUNT);
> +	if (period < 2) {
> +		period =3D 2;
> +		ret =3D 1;
> +	}
> +	high =3D min(x1600_pwm_counts(wf->duty_length_ns, rate, prescale), peri=
od);
> +	offset =3D x1600_pwm_counts(wf->duty_offset_ns, rate, prescale);
> +
> +	wfhw->prescale =3D prescale;
> +	wfhw->wcfg =3D FIELD_PREP(X1600_PWM_WCFG_HIGH, high) |
> +		     FIELD_PREP(X1600_PWM_WCFG_LOW, period - high);
> +	wfhw->enabled =3D high && high < period;
> +	/* Low first only if the requested offset reaches period - duty. */
> +	wfhw->inl =3D !wfhw->enabled || offset < period - high;
> +	wfhw->idl =3D high =3D=3D period;
> +
> +	return ret;
> +}
> +
> +static int x1600_pwm_round_waveform_fromhw(struct pwm_chip *chip, struct=
 pwm_device *pwm,
> +					   const void *_wfhw, struct pwm_waveform *wf)
> +{
> +	struct x1600_pwm *x =3D pwmchip_get_drvdata(chip);
> +	unsigned long rate =3D clk_get_rate(x->clk);
> +	const struct x1600_pwm_wfhw *wfhw =3D _wfhw;
> +	u32 high =3D FIELD_GET(X1600_PWM_WCFG_HIGH, wfhw->wcfg);
> +	u32 low =3D FIELD_GET(X1600_PWM_WCFG_LOW, wfhw->wcfg);
> +
> +	if (!rate)
> +		return -EINVAL;
> +
> +	wf->period_length_ns =3D x1600_pwm_ns(high + low, rate, wfhw->prescale);
> +	wf->duty_length_ns =3D x1600_pwm_ns(high, rate, wfhw->prescale);
> +	wf->duty_offset_ns =3D wfhw->enabled && !wfhw->inl ?
> +			     x1600_pwm_ns(low, rate, wfhw->prescale) : 0;

[Severity: Medium]
Does x1600_pwm_round_waveform_fromhw() misreport the waveform when a channel
is disabled in hardware (wfhw->enabled =3D=3D false)?

In x1600_pwm_read_waveform(), wfhw->enabled is read from X1600_PWM_EN and
wfhw->idl is read from X1600_PWM_IDL:

	wfhw->enabled =3D readl(x->base + X1600_PWM_EN) & BIT(ch);
	wfhw->inl =3D readl(x->base + X1600_PWM_INL) & BIT(ch);
	wfhw->idl =3D readl(x->base + X1600_PWM_IDL) & BIT(ch);
	wfhw->prescale =3D FIELD_GET(X1600_PWM_CCFG_PRESCALE,
				   readl(x->base + X1600_PWM_CCFG(ch)));
	wfhw->wcfg =3D readl(x->base + X1600_PWM_WCFG(ch));

However, wfhw->idl is never used in x1600_pwm_round_waveform_fromhw(), and
wf->duty_length_ns is computed unconditionally from high in wfhw->wcfg even
when wfhw->enabled is false.

If a channel was stopped via X1600_PWM_ENC while X1600_PWM_WCFG(ch) still
holds non-zero high and low counts, hardware holds the static idle level fr=
om
X1600_PWM_IDL rather than toggling. Because x1600_pwm_round_waveform_fromhw=
()
still computes wf->period_length_ns and wf->duty_length_ns from wfhw->wcfg,
pwm_device_request() -> pwm_get_state_hw() -> pwm_wf2state() will populate
pwm->state with enabled =3D true and the stale WCFG period and duty cycle. A
subsequent call to pwm_apply_might_sleep() requesting that same period and
duty cycle will then short-circuit in __pwm_apply() without calling
x1600_pwm_write_waveform() to enable the channel via X1600_PWM_ENS.

> +
> +	return 0;
> +}
[ ... ]
> +static int x1600_pwm_write_waveform(struct pwm_chip *chip, struct pwm_de=
vice *pwm,
> +				    const void *_wfhw)
> +{
> +	struct x1600_pwm *x =3D pwmchip_get_drvdata(chip);
> +	const struct x1600_pwm_wfhw *wfhw =3D _wfhw;
> +	unsigned long rate =3D clk_get_rate(x->clk);
> +	struct x1600_pwm_wfhw cur;
> +	unsigned int ch =3D pwm->hwpwm;
> +	u32 busy;
> +
> +	x1600_pwm_read_waveform(chip, pwm, &cur);
> +
> +	/*
> +	 * Running with the same divider and initial level: load the new word,
> +	 * which the channel takes at the end of its period.
> +	 */
> +	if (cur.enabled && wfhw->enabled && cur.prescale =3D=3D wfhw->prescale =
&&
> +	    cur.inl =3D=3D wfhw->inl) {
> +		writel(wfhw->wcfg, x->base + X1600_PWM_WCFG(ch));
> +		writel(BIT(ch), x->base + X1600_PWM_UPT);
> +		return readl_poll_timeout(x->base + X1600_PWM_BUSY, busy,
> +					  !(busy & BIT(ch)), 10,
> +					  DIV_ROUND_UP_ULL(2ULL * USEC_PER_SEC *
> +							   (X1600_PWM_MAX_COUNT << cur.prescale),
> +							   rate));

[Severity: Medium]
Can DIV_ROUND_UP_ULL() divide by zero here in x1600_pwm_write_waveform() if
clk_get_rate(x->clk) returns 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025084643.9316=
7-1-olivier@mgcrea.io?part=3D2
