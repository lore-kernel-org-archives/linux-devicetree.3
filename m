Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3FE1F78E6
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 21:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780608502; cv=none; b=BLJSqDJLOdav8buGK8ersGL/suQQNit+80zfm0Iho4lurXVKZF+rFuu/y2gtA2vKpoBVp06pjEKudnEcRci/Lpt+EVBovOFcP1wGqjqqwTRJImpS7wgyu0+YzRn4ihf9o8XzxzCtDeVkC78jRhrT/A7IkTZ58lX8ZxJKDDkWyfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780608502; c=relaxed/simple;
	bh=guM8AybZ1+IU9qZayrO9KXkeRUyEWwMinPXSB3XMltk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbR4gl3TNX090mrl1rNCKRtoSJc+mXx9a6bPZVTO1iXUAaqwRPFfuzOaNR1UTTk+eod1N1QxGJQV+DkNgkkdRa3qFZxOwk8prvWSbMD2U1QHUgIN92HFWa6fiJU/UvIpngafk7X2IOCRLybHG7DV6ukWA43FvlnxOroydlpenwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=H62akziy; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="H62akziy"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso580786f8f.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 14:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780608498; x=1781213298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qpl5grPgHkRob0EdUgg6PK1X+hPbOSCgLrqMSmwFqaM=;
        b=H62akziyk0tH1PXeli868djrGne5N9ULm7bvQVMZMlrhhsPGF11jUj53tJ2f+vauhW
         32ZeAyoZqt4UC3JePWxZWy7GiUtiFrms5n6e8bsCSs24aOfuIzZqUmfC2BkLZA1BRnvP
         q2LVKd5+dYH9yhMOasEFmS2SuGM4Cwk7u6ACC/ZET38mpYruQIY2CdUOFA/0c91ezrOP
         8ah6YnQ2Gq01fdAr+Xi2gKdYlBAY7NXzm/R2Z9F7nkxroEutsj5xDDASjpFsVcKYffqd
         aaIAQ9DwF7mBe4Rbdgtd+FOUKl5dTTHj4IK7N/iUt9trbMDLpZmi0/KVsmTxxT+DbOkh
         Cb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780608498; x=1781213298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpl5grPgHkRob0EdUgg6PK1X+hPbOSCgLrqMSmwFqaM=;
        b=nAgrEKbzRg8w4wU3v+DIkkRLTHGbzAygtYdhHDXH9r/lvoNaH1aQIZpgGFn09jyheL
         cEVxLzX9ig9Wx91/hBbBVVf3EreRPTFIsPARzGzcZQjQDSIVO1lDpi6GWC2WnYs9NXGx
         ZymZmMUBVXYTAeN670sEwhnGDP+RFrvQyeqNXtIHu+jHP9KLe2S3rhVACe7TADvcSjWn
         3QdX9XlqxyjVI9krupPHoAux0ppfoROcAIh3mnFfFNg3406Q4R8qtUwHnH+SfLqmuwul
         yzh/6UKn/5BbgFwm2OP9PL4Ge+5ls0ACFcE8VB4pMUGh91MlwUxRAyRoYleen93X8HdD
         4ZCg==
X-Forwarded-Encrypted: i=1; AFNElJ8BODd2PHoE6FEkPNBN2zGufRcjJMrXpW4f2viI06V3sTSKHJmB0F2/T8JQuBo6MFMI/tK57mY5iBRB@vger.kernel.org
X-Gm-Message-State: AOJu0YxFPHUWOjy1gvDVWBWY3nF054HlTrQuUckQuCzuymjgSMxLbpYQ
	BTwdjEyh1bdD9XwZltsjST1yFnPkFkDGexdSemzMp4VD29PRC8o3RZBge7HxTIa+yoo=
X-Gm-Gg: Acq92OHeusmJgR70tp50iPN13/Wwf3ZK57qj01KSu3aSS/MmeGeeL4FqXfuUy7LXCxM
	aCUJMmHZ8EYV5m+KZwS/2wvjg2OnRAgXlyFYM1q80sByMVBBls/X22K+9Qspy8rA5dnXSVniUX0
	9UvmmvrGajVljc0b44kf1m3/kgnZwtJwfKvvYv9BEevDGAa/Xk3EzSXBECWPGmTIVJIU1qKz/F9
	0/gjGexGvqlvZ07padlMjv+1/e4eydbINRIG9Eg6IAyJvwbpq24d6gAZVTymPLV/4I50KV58+yf
	Ahg8yOVXo6wwqm/mxwpxIBdYARvoSe0iA6eZ9OG5DVbgtdIY6bu73wvRsVexk2BKNjQo6t1DJnw
	47BONaUYE1keOq3bXBXe1w/wLlX4DCuX0jfAycJx7PXeA1PwIdp+eKIvNyw/wIwNWQrkV4YJWAS
	01toqqf5DClUkOWht2ON/5qn+4dsc0LkLm50p1DfezqDYftpnqqeUz/oixXnmqBsQMvqmYHubnq
	7siQK2wK2U=
X-Received: by 2002:a05:6000:1241:b0:460:2ee5:67b8 with SMTP id ffacd0b85a97d-46030640671mr861000f8f.36.1780608498311;
        Thu, 04 Jun 2026 14:28:18 -0700 (PDT)
Received: from localhost (cust-east-par-46-193-69-147.cust.wifirst.net. [46.193.69.147])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4602cda3651sm6645312f8f.32.2026.06.04.14.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 14:28:17 -0700 (PDT)
Date: Thu, 4 Jun 2026 23:28:16 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v4 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <aiHn5-gQMbjttrR6@monoceros>
References: <8eef956a5eb473f051bbda89ec4c9991c1b47de2.1780498640.git.andrea.porta@suse.com>
 <20260603154716.1B5C41F00893@smtp.kernel.org>
 <aiGAINsTG8VZLn28@apocalypse>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e2kbaxapkhawq6wa"
Content-Disposition: inline
In-Reply-To: <aiGAINsTG8VZLn28@apocalypse>


--e2kbaxapkhawq6wa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/3] pwm: rp1: Add RP1 PWM controller driver
MIME-Version: 1.0

Hello Andrea,

On Thu, Jun 04, 2026 at 03:39:44PM +0200, Andrea della Porta wrote:
> On 15:47 Wed 03 Jun     , sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 8 potential is=
sue(s) to consider:
> > - [High] Missing `pwmchip_remove()` on the `of_syscon_register_regmap()=
` error path leaves a dangling PWM chip.
> > - [High] When disabling a PWM channel, the driver fails to clear the po=
larity bit, causing the output to erroneously remain HIGH if it was previou=
sly inverted.
> > - [High] Registering a devm-managed regmap with the permanent syscon re=
gistry creates a teardown asymmetry.
> > - [High] Hardware channel control registers (`CHAN_CTRL`) are not resto=
red across system suspend/resume.
> > - [Medium] Non-monotonic period limit checking in `rp1_pwm_round_wavefo=
rm_tohw()` causes larger requested periods to result in smaller hardware pe=
riods.
> > - [Medium] Calculating `period_length_ns` from hardware state suffers f=
rom a 32-bit integer overflow before casting to u64, resulting in a zero pe=
riod.
> > - [Medium] Calculating inverted polarity duty length underflows if the =
hardware is configured for a 100% duty cycle.
> > - [Medium] Returning a positive integer (1) from `round_waveform_tohw` =
incorrectly propagates as an error.
> > --
> >=20
> > commit 90d2019e94496c6949f2d04c2605c6a197b16d6a
> > Author: Naushir Patuck <naush@raspberrypi.com>
> >=20
> > pwm: rp1: Add RP1 PWM controller driver
> >=20
> > The Raspberry Pi RP1 southbridge features an embedded PWM controller
> > with 4 output channels, alongside an RPM interface to read the fan
> > speed on the Raspberry Pi 5. Add the supporting driver.
> >=20
> > > diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> > > new file mode 100644
> > > index 0000000000000..052c3ae770569
> > > --- /dev/null
> > > +++ b/drivers/pwm/pwm-rp1.c
> > [ ... ]
> > > +static int rp1_pwm_round_waveform_tohw(struct pwm_chip *chip,
> > > +				       struct pwm_device *pwm,
> > > +				       const struct pwm_waveform *wf,
> > > +				       void *_wfhw)
> > > +{
> > > +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> > > +	u64 period_ticks, duty_ticks, offset_ticks;
> > > +	struct rp1_pwm_waveform *wfhw =3D _wfhw;
> > > +	u64 clk_rate =3D rp1->clk_rate;
> > > +	int ret =3D 0;
> > > +
> > > +	if (!wf->period_length_ns) {
> > > +		wfhw->enabled =3D false;
> > > +		return 0;
> > > +	}
> > > +
> > > +	period_ticks =3D mul_u64_u64_div_u64(wf->period_length_ns, clk_rate=
, NSEC_PER_SEC);
> > > +
> > > +	/*
> > > +	 * The period is limited to U32_MAX - 1
> > > +	 * to allow 100% duty cycle.
> > > +	 */
> > > +	if (period_ticks > U32_MAX) {
> > > +		period_ticks =3D U32_MAX - 1;
> >=20
> > [Severity: Medium]
> > Does this limit check break monotonicity for large periods?
> >=20
> > If the requested period translates to U32_MAX, this condition is false =
and
> > the period becomes U32_MAX - 1.
> >=20
> > If it translates to U32_MAX + 1, it becomes U32_MAX - 1, which is then
> > subtracted by 1 later, yielding U32_MAX - 2. This makes a larger reques=
ted
> > period result in a smaller actual hardware period.
>=20
> Ack. I will set period_ticks =3D U32_MAX in that if.
>=20
> >=20
> > > +	} else if (!period_ticks) {
> > > +		period_ticks =3D 2;
> > > +		ret =3D 1;
> > > +	}
> >=20
> > [Severity: Medium]
> > Is returning a positive integer here intentional?
> >=20
> > The PWM core subsystem expects round_waveform_tohw callbacks to return =
0 on
> > success or a negative error code on failure. Returning 1 could propagat=
e as
> > an error up to consumer drivers, breaking operation for very small peri=
ods.
>=20
> It should return 1 in case the if any value is rounded, which in this cas=
e=20
> is the period.

Ack. However it's a bit strange that you fixup period_ticks =3D 0 to 2
while 1 is kept as is. Either using 1 is invalid, then it should be
updated to two, too. Or it gives a shorter period than 2, then 0 should
be fixed up to 1 only.

> > > +	duty_ticks =3D mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NS=
EC_PER_SEC);
> > [ ... ]
> > > +static int rp1_pwm_round_waveform_fromhw(struct pwm_chip *chip,
> > > +					 struct pwm_device *pwm,
> > > +					 const void *_wfhw,
> > > +					 struct pwm_waveform *wf)
> > > +{
> > > +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> > > +	const struct rp1_pwm_waveform *wfhw =3D _wfhw;
> > > +	u64 clk_rate =3D rp1->clk_rate;
> > > +	u32 ticks;
> > > +
> > > +	*wf =3D (struct pwm_waveform){ };
> > > +
> > > +	if (!wfhw->enabled)
> > > +		return 0;
> > > +
> > > +	wf->period_length_ns =3D DIV_ROUND_UP_ULL((u64)(wfhw->period_ticks =
+ 1) * NSEC_PER_SEC,
> > > +						clk_rate);
> >=20
> > [Severity: Medium]
> > Could this encounter a 32-bit integer overflow?
> >=20
> > Since wfhw->period_ticks is a 32-bit integer, the addition of 1 happens=
 in
> > 32-bit space before the cast to u64.
> >=20
> > If the hardware register was configured to 0xffffffff by the bootloader=
 for
> > a 100% duty cycle, 0xffffffff + 1 wraps around to 0, producing a period=
 of 0.
> >=20
> > Should the cast be placed before the addition?
>=20
> Ack. 0xffffffff should be deemed as a non valid value though.
>=20
> >=20
> > > +
> > > +	if (!wfhw->inverted_polarity) {
> > > +		wf->duty_length_ns =3D DIV_ROUND_UP_ULL((u64)wfhw->duty_ticks * NS=
EC_PER_SEC,
> > > +						      clk_rate);
> > > +	} else {
> > > +		ticks =3D wfhw->period_ticks + 1 - wfhw->duty_ticks;
> > > +		wf->duty_length_ns =3D DIV_ROUND_UP_ULL((u64)ticks * NSEC_PER_SEC,=
 clk_rate);
> >=20
> > [Severity: Medium]
> > Will this subtraction underflow if the hardware is configured for a 100%
> > duty cycle?
> >=20
> > The driver allows duty_ticks to exceed period_ticks + 1 to achieve a 10=
0%
> > duty cycle.
>=20
> The driver is not allowing this since tohw() has this:=20
>=20
> duty_ticks =3D min(duty_ticks, period_ticks);
>=20
> Anyway, if fromhw() is called first and the bootloader has configured 0xf=
fffffff
> in the period register, should it returns an error? The period should alw=
ays be
> at most U32_MAX-1.

I'm not sure if this triggers a PWM_DEBUG check, but I'd say the right
thing is to let fromhw() report what the actual setting even if tohw()
will never result in that setting.

Thinking again, the tohw() callback could be a bit more clever and also
use period_ticks =3D 0xffffffff, as this fine if duty_ticks is less than
this value and if duty_ticks =3D period_ticks =3D 0xffffffff you can still
configure the hardware using period_ticks =3D 0xfffffffe to achieve the
100% relative dutycycle. (But keeping the current behaviour is fine for
me, too.)

> > > +		wf->duty_offset_ns =3D wf->period_length_ns - wf->duty_length_ns;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int rp1_pwm_write_waveform(struct pwm_chip *chip,
> > > +				  struct pwm_device *pwm,
> > > +				  const void *_wfhw)
> > > +{
> > > +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> > > +	const struct rp1_pwm_waveform *wfhw =3D _wfhw;
> > > +	u32 value, ctrl;
> > > +
> > > +	/* early exit if disabled */
> > > +	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &ctrl);
> > > +	if (!wfhw->enabled) {
> > > +		ctrl &=3D ~RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
> > > +		goto exit_disable;
> > > +	}
> >=20
> > [Severity: High]
> > Does skipping the polarity update here cause the output to erroneously
> > remain HIGH while disabled?
> >=20
> > The early exit skips the read-modify-write block that updates
> > RP1_PWM_CHAN_CTRL_POLARITY.
> >=20
> > The driver notes state that when disabled, the output is driven to 1 if
> > polarity is inversed. If a channel previously configured with inverted
> > polarity is disabled, it seems it will continually output a HIGH signal,
> > violating the PWM framework expectation.
>=20
> I'm not sure whether an inverted polarity pin shoudl stay low when disabl=
ed.
> After all, the inactive state for a reversed pin is high.

Sashiko's concern is correctly stated, if you go from

	polarity =3D inversed, enabled

to

	polarity =3D normal, disabled

the output stays high, which is active for polarity =3D normal.

However the behaviour of a disabled PWM isn't specified, so any
behaviour is fine, the only objective is to save power. And if the
consumer relies on a constant inactive output, it's supposed to not
disable it.

For me both behaviours are fine. Making the hardware emit the inactive
level might prevent a surprise if the consumer isn't aware of the
missing guarantee, but being lazy and so surprise the consumer is also
fine as this might uncover that wrong assumption and allow the consumer
to be fixed.

(And not all PWM implementations allow to configure the output level, so
a guarantee cannot be given. Some go to 0 irrespective of the configured
polarity, some go to High-Z.)

> > [Severity: High]
> > Also, does registering a devm-managed regmap with the permanent syscon
> > registry create a teardown asymmetry?
> >=20
> > The regmap is allocated with devm_regmap_init_mmio(). If the underlying
> > device is hotplug removed, devres will automatically free the regmap me=
mory.
> >=20
> > However, the syscon framework does not provide an unregister function,
> > leaving it with a dangling pointer in its static list that could cause a
> > use-after-free upon subsequent lookups.
>=20
> The device is not hotpluggable and the driver cannot be unloaded/unbounde=
d, so
> there should be no dangling pointer around.

ack.

Best regards
Uwe

--e2kbaxapkhawq6wa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoh7ewACgkQj4D7WH0S
/k6fNwf+N7edcJWSugcWqE0upNf4HZ4E0IT9Rl2WgzOUbeXigZOTdSOz2YbYAXhu
Oz2f83BvVx69KHmFAfxJdksfWyyH6vD5c4tiZObBXx/8W0sYVkaX9BXpm87Kj8Us
HOtvA513rjQ4XU5DneeMZncfWuAMeRsj5EEsaXUF045WFi54UcC2yVUEeMHu4ezl
ho6Ac7qp3Q8CrXJq559KKyCaB5z+Z3Ez6cIshPtgcTYccGSRVB6cNuhOi2AKmAr8
Ksx86Yzz15LouEb2WFb4IrFTekwMnU9QEpIoHgGP2H6MmJnUOw/k9UiqBqtGdM3/
hFD9r1jDDQunkpUB2KnLv5dgb+ZYJw==
=ziwr
-----END PGP SIGNATURE-----

--e2kbaxapkhawq6wa--
