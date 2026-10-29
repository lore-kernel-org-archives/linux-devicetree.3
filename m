Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793301385;
	b=onhfEHVXBFUWCGBhDszcPDV30+L7UNO3VcpRY9jakSo/DkauLOD7bOdXgCwn3pA9qvT/
	 P1lJWU97eBnlwbq9zfysyflEY0rsCSDlcVZsxCXBZs7G1qvXs/JShB9vGeAcW1X0+AJRT
	 O7hbcfU0z6Yk05ABaxN6H2ugEylX5jdpU9dZIYMiwMUKfpAPs6+e4tOp/V+ehW/XhH4kq
	 WKYSGLsKxoCqGr0LpM+0edLTMZetH3JYFx1nWudBvj1B7rXL/sDZE2rrOXE0XQ7NvbB5X
	 NQ/rYn8P1vGa+KOzmrnK1tmsrefxOuiOewi1qiiRvupG18qitg1ngsEU++tZwdxYMcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793301385;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=F6ZQrOYiiAYl90VN4LrTeNLiKb9WjIilNRl2f2bjbAc=;
	b=KGtVQLQkYPVqkcuAtPbrUKurAayN5aeQnh1qCbhhJ+OtxnvxY1INZk4LQnw/AJROTisJ
	 vCIH5gGRgvmq/PtWRUoHcrZRaT5f4RUCVOhIMnPCGrIVcdpqYginTmFL9W64DIRGGHKuM
	 MbCbOmdCoW2/sbtPEtHosvXQHKJHifxN302ynZO7KC6Iu3S9lAU4MLcYItW0x+9vkGOCU
	 z5lg2eCOc47jbCztU1l/r1cR0QyYULuqbi8PO10C1cNGcHY2FuLtZhPnzBgLi6RBYyIKj
	 +TkQ4i8QtRfzwPzTB/LNCGP9tdfraS9UfoPMczdh8bqeVQWgdBpW1XYr2cOh33Fujlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ELSAONgu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A72606A31E
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 19:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ELSAONgu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4961F01824;
	Thu, 29 Oct 2026 19:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793301384;
	bh=F6ZQrOYiiAYl90VN4LrTeNLiKb9WjIilNRl2f2bjbAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ELSAONguRsptwPEdRFZDIWypHUZlLOOXJD2KwrHrlSGkpJ4+zEOnh0VUZfLGTi3b+
	 guS+ZKdYOuTaXEHKk8P1jthBSybGS7yuEpmWC3yAtSzUQ9z9JW5+6GWz14h0g6qSt3
	 f6ZuLs2bafwN9JcagrnWjKKbVdcBZVXClOHlMIyNVxbEsgOymNNG+8aODwzDgLiRUD
	 hzQgD0G9CcbAZ6Bi9hfGKQYXN8dW7MjOJMNj5jB4Q7WvBjIyaK9YwniqUpUH34ACiR
	 fBhkobjtLk1kTvVNZsrf3LseGvqTbCcKxd2tYJE3QFSOg/Hc60U/jjlZjSfALThqEM
	 t6EFhOO7R8G2g==
Message-ID: <sashiko-outbox-189862@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/7] pwm: rzg2l-gpt: Convert to waveform callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Biju Das" <biju.das.au@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261029-gpt_rzg3e-v9-2-f3a5520388d3@bp.renesas.com>
References: <20261029-gpt_rzg3e-v9-0-f3a5520388d3@bp.renesas.com>
 <20261029-gpt_rzg3e-v9-2-f3a5520388d3@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 19:16:24 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] pwm: rzg2l-gpt: sub-tick period rounds to 0 in rzg2l_gpt_round_wav=
eform_tohw()
- [Medium] pwm: rzg2l-gpt: zeroed duty in rzg2l_gpt_round_waveform_tohw() o=
n small period
- [Medium] pwm: rzg2l-gpt: sibling state mismatch in rzg2l_gpt_round_wavefo=
rm_tohw()
--

commit 584269914af54fde24d28d7d11319bda863cde58
Author: Biju Das <biju.das.jz@bp.renesas.com>

pwm: rzg2l-gpt: Convert to waveform callbacks

This commit migrates the rzg2l-gpt PWM driver from the legacy .get_state and
.apply callbacks to the waveform callback interface using struct
rzg2l_gpt_waveform.

> diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
> index 108fa99f832d9..e9ba0f3bdeb1d 100644
> --- a/drivers/pwm/pwm-rzg2l-gpt.c
> +++ b/drivers/pwm/pwm-rzg2l-gpt.c

[ ... ]

> @@ -219,159 +231,214 @@ static u64 rzg2l_gpt_calculate_period_or_duty(str=
uct rzg2l_gpt_chip *rzg2l_gpt,
>  static u32 rzg2l_gpt_calculate_pv_or_dc(u64 period_or_duty_cycle, u8 pre=
scale)
>  {
>  	return min_t(u64, DIV_ROUND_DOWN_ULL(period_or_duty_cycle, 1 << (2 * pr=
escale)),
>  		     U32_MAX);
>  }
> =20
> -/* Caller holds the lock while calling rzg2l_gpt_config() */
> -static int rzg2l_gpt_config(struct pwm_chip *chip, struct pwm_device *pw=
m,
> -			    const struct pwm_state *state)
> +static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
> +					 struct pwm_device *pwm,
> +					 const struct pwm_waveform *wf,
> +					 void *_wfhw)
>  {
>  	struct rzg2l_gpt_chip *rzg2l_gpt =3D to_rzg2l_gpt_chip(chip);
> -	u8 sub_ch =3D rzg2l_gpt_subchannel(pwm->hwpwm);
> +	struct rzg2l_gpt_waveform *wfhw =3D _wfhw;
> +	bool is_small_second_period =3D false;
>  	u8 ch =3D RZG2L_GET_CH(pwm->hwpwm);
>  	u64 period_ticks, duty_ticks;
> -	unsigned long pv, dc;
> -	u8 prescale;
> +
> +	if (wf->period_length_ns =3D=3D 0) {
> +		*wfhw =3D (struct rzg2l_gpt_waveform){
> +			.gtpr =3D 0,
> +			.gtccr =3D 0,
> +			.prescale =3D 0,
> +		};
> +
> +		return 0;
> +	}
> =20
>  	/* Limit period/duty cycle to max value supported by the HW */
> -	period_ticks =3D mul_u64_u64_div_u64(state->period, rzg2l_gpt->rate_khz=
, NSEC_PER_MSEC);
> +	period_ticks =3D mul_u64_u64_div_u64(wf->period_length_ns,
> +					   rzg2l_gpt->rate_khz, NSEC_PER_MSEC);
>  	if (period_ticks > RZG2L_MAX_TICKS)
>  		period_ticks =3D RZG2L_MAX_TICKS;

[Severity: High]
What happens in rzg2l_gpt_round_waveform_tohw() in drivers/pwm/pwm-rzg2l-gp=
t.c
when a caller requests a non-zero wf->period_length_ns that is shorter than
one timer clock cycle (0 < wf->period_length_ns < NSEC_PER_MSEC /
rzg2l_gpt->rate_khz, for example 1..9 ns at a 100 MHz GPT clock)?

In that case, mul_u64_u64_div_u64() truncates period_ticks to 0. When the
sibling subchannel is not running, rzg2l_gpt_round_waveform_tohw() computes
wfhw->prescale =3D 0, wfhw->gtpr =3D 0, and wfhw->gtccr =3D 0, and returns =
0.

Because wfhw->gtpr =3D=3D 0 is also used as the sentinel for a disabled wav=
eform
in rzg2l_gpt_write_waveform():

	/* Disable request: shared registers are never touched. */
	if (!wfhw->gtpr) {
		if (self_enabled)
			rzg2l_gpt_disable(rzg2l_gpt, pwm);

		return 0;
	}

and rzg2l_gpt_round_waveform_fromhw() converts wfhw->gtpr =3D=3D 0 into
wf->period_length_ns =3D 0, doesn't a sub-tick period request end up disabl=
ing
the PWM channel instead of rounding period_ticks up to 1 and returning 1?

For example:
- pwm_gpio_set() passes wf =3D { .period_length_ns =3D 1 } to
  pwm_round_waveform_might_sleep() to query the smallest supported hardware
  period, which rounds to period_length_ns =3D 0 and causes pwm_gpio_set(..=
., 1)
  to set duty_length_ns =3D 0 and disable the output instead of driving the=
 pin
  high.
- __pwm_apply() and __pwm_set_waveform() with a non-zero sub-tick period
  disable the hardware channel via rzg2l_gpt_write_waveform() while recordi=
ng
  pwm->state.enabled =3D true.

> +
> +	guard(mutex)(&rzg2l_gpt->lock);
>  	/*
>  	 * GPT counter is shared by the two IOs of a single channel, so
>  	 * prescale and period can NOT be modified when there are multiple IOs
>  	 * in use with different settings.
>  	 */
> -	if (rzg2l_gpt->channel_request_count[ch] > 1) {
> -		u8 sibling_ch =3D rzg2l_gpt_sibling(pwm->hwpwm);
> -
> -		if (rzg2l_gpt_is_ch_enabled(rzg2l_gpt, sibling_ch)) {
> -			if (period_ticks < rzg2l_gpt->period_ticks[ch])
> -				return -EBUSY;
> -
> -			period_ticks =3D rzg2l_gpt->period_ticks[ch];
> -		}
> +	if (rzg2l_gpt->channel_request_count[ch] > 1 &&
> +	    rzg2l_gpt_is_ch_enabled(rzg2l_gpt, rzg2l_gpt_sibling(pwm->hwpwm), N=
ULL)) {
> +		if (period_ticks < rzg2l_gpt->period_ticks[ch])
> +			is_small_second_period =3D true;
> +
> +		period_ticks =3D rzg2l_gpt->period_ticks[ch];
> +		wfhw->prescale =3D rzg2l_gpt->prescale[ch];
> +	} else {
> +		wfhw->prescale =3D rzg2l_gpt_calculate_prescale(period_ticks);
>  	}

[Severity: Medium]
Can rzg2l_gpt_round_waveform_tohw() and rzg2l_gpt_write_waveform() in
drivers/pwm/pwm-rzg2l-gpt.c disagree on whether the sibling subchannel is
active and what its period and prescaler are?

In rzg2l_gpt_round_waveform_tohw(), the sibling's period and prescaler are
only used if rzg2l_gpt->channel_request_count[ch] > 1, and they are read fr=
om
the software cache rzg2l_gpt->period_ticks[ch] and rzg2l_gpt->prescale[ch].

In contrast, rzg2l_gpt_write_waveform() checks whether the sibling is enabl=
ed
in hardware without checking channel_request_count[ch], and validates again=
st
the hardware registers RZG2L_GTCR(ch) and RZG2L_GTPR(ch):

	sibling_enabled =3D rzg2l_gpt_is_ch_enabled(rzg2l_gpt, sibling_ch, &gtcr);
	...
	if (sibling_enabled) {
		if (FIELD_GET(RZG2L_GTCR_TPCS, gtcr) !=3D wfhw->prescale ||
		    rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTPR(ch)) !=3D wfhw->gtpr)
			return -EBUSY;

If a subchannel is enabled and then freed via rzg2l_gpt_free() (which
decrements channel_request_count[ch] while leaving the hardware channel
running), or if a subchannel was left enabled by the bootloader:
- When only the sibling subchannel is requested (channel_request_count[ch] =
=3D=3D
  1), rzg2l_gpt_round_waveform_tohw() skips the sibling check and computes a
  new period/prescale, which rzg2l_gpt_write_waveform() then rejects with
  -EBUSY.
- If a subchannel was enabled by the bootloader before probe and both
  subchannels are requested (channel_request_count[ch] =3D=3D 2) before
  rzg2l_gpt_write_waveform() has ever populated period_ticks[ch] and
  prescale[ch], rzg2l_gpt_round_waveform_tohw() reads 0 from
  rzg2l_gpt->period_ticks[ch] and sets wfhw->gtpr =3D 0, causing
  rzg2l_gpt_write_waveform() to treat the request as a disable.

Should rzg2l_gpt_round_waveform_tohw() check rzg2l_gpt_is_ch_enabled() and
read the running period and prescaler from the hardware registers in the sa=
me
way as rzg2l_gpt_write_waveform()?

> =20
> -	prescale =3D rzg2l_gpt_calculate_prescale(period_ticks);
> -	pv =3D rzg2l_gpt_calculate_pv_or_dc(period_ticks, prescale);
> +	wfhw->gtpr =3D rzg2l_gpt_calculate_pv_or_dc(period_ticks, wfhw->prescal=
e);
> +	if (is_small_second_period) {
> +		wfhw->gtccr =3D 0;
> +		return 1;
> +	}
> =20
> -	duty_ticks =3D mul_u64_u64_div_u64(state->duty_cycle, rzg2l_gpt->rate_k=
hz, NSEC_PER_MSEC);
> +	duty_ticks =3D mul_u64_u64_div_u64(wf->duty_length_ns, rzg2l_gpt->rate_=
khz, NSEC_PER_MSEC);
>  	if (duty_ticks > period_ticks)
>  		duty_ticks =3D period_ticks;
> -	dc =3D rzg2l_gpt_calculate_pv_or_dc(duty_ticks, prescale);
> +	wfhw->gtccr =3D rzg2l_gpt_calculate_pv_or_dc(duty_ticks, wfhw->prescale=
);
> =20
> -	return 0;
> +	return 0;
> +}

[Severity: Medium]
When is_small_second_period is true in rzg2l_gpt_round_waveform_tohw() in
drivers/pwm/pwm-rzg2l-gpt.c (because the sibling subchannel is enabled and =
the
requested wf->period_length_ns is smaller than the running period), why does
this return early with wfhw->gtccr =3D 0 instead of rounding wf->duty_lengt=
h_ns
against the sibling's period and returning 1 at the end of the function?

When a caller uses pwm_round_waveform_might_sleep() or
pwm_set_waveform_might_sleep() with exact =3D false and wf->duty_length_ns =
> 0,
the period is rounded up to the running sibling's period, so shouldn't
wfhw->gtccr still be computed from wf->duty_length_ns rather than forcing a=
 0%
duty cycle?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-gpt_rzg3e-=
v9-0-f3a5520388d3@bp.renesas.com?part=3D2
