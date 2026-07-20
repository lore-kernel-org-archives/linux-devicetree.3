Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824353A5E94
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541734; cv=none; b=OX7n3MB85zLjQdYMPWNneNsq2jfS+fQ0R+USCX5R+qSpqtVProSAryDsLQ1hK8HrTMRpBCHsFUj6z+5HPiR/ZyW+qugX+X1CvqDelMRE8MXgLWJsHTrE7PV7WufK9fgsDXVGGL56Xgi4z6umThdWYW2+spBh68UM3LjgK+CwmCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541734; c=relaxed/simple;
	bh=+IFSh05M42lIM++y2Y3y3NUEtHucSyQR8BDoCOxuuvg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MK77WEQO32+o4ehmAxuqrxFOf0yRTbJaaw+BhVlLRbAR8Z8tcvlXyozxqu17FCm/AfOZvW+Afq1Hs35MePPBfOCO4LSCfRfwn/acQOJ4gNUWF8u2fr8iivQI2Cd248AG/soLhFnODGgD5bkZmHqtKqnjC0qQ0EG0zz0+e50dlgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEFCbfDw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEFCbfDw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF1D1F000E9;
	Mon, 20 Jul 2026 10:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784541733;
	bh=4g3v/zCHIAnNF+7CiLnMccVa/KP0n77HdKYSkbWNKm4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VEFCbfDwxn94e1oRfbjJ5vlnFz+JbhkI8IvHv1tUdCyY7JjjNsGICfm4mpA8yLf+s
	 +F7ZLEKBmvvfNKVqYypxQNmiZ5SNZthym9LpZOWUJ+usuBkK/FPLJdJaqbIyaVl3CL
	 1d4uiFQC7f5WSC+JpEEkLhmD/xYyrs1W2UzuDvFRGMVi5OC0rXgE6EO1Y5lEzQOItT
	 m7Ayi6n2FGdS44Kt5Wy8sebtnc2T7xr34SvzNLvcqGklfIqhJ8iNZmfecphil+G8AH
	 2gRAirkd7XlvB3+kcSVRBldDxy3Hfb+pEIM3AZ5a29l6t1XXGDxikjcNDwTgR/+R76
	 eLInsv5ySFcIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <a83d65b2d91865eb722337c547c94dce175e6086.1784539788.git.andrea.porta@suse.com>
References: <cover.1784539788.git.andrea.porta@suse.com>
 <a83d65b2d91865eb722337c547c94dce175e6086.1784539788.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 10:02:12 +0000
Message-Id: <20260720100212.BEF1D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing `.remove` callback leads to Use-After-Free in the PWM and =
Syscon cores and leaks clock resources on driver unbind.
- [High] Register context loss on suspend/resume silently breaks PWM output.
- [High] Unclamped hardware duty ticks lead to integer underflow in the PWM=
 core for normal polarity.
--

--- Patch [2]: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver ---
commit 0c98703d857577902e57d25b42a3d46dfbde5795
Author: Naushir Patuck <naush@raspberrypi.com>

pwm: rp1: Add RP1 PWM controller driver

The Raspberry Pi RP1 southbridge features an embedded PWM controller with
4 output channels, alongside an RPM interface to read the fan speed on the
Raspberry Pi 5. Add the supporting driver.

> diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/pwm/pwm-rp1.c

[ ... ]

> +static int rp1_pwm_round_waveform_fromhw(struct pwm_chip *chip,
> +					 struct pwm_device *pwm,
> +					 const void *_wfhw,
> +					 struct pwm_waveform *wf)
> +{
> +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> +	const struct rp1_pwm_waveform *wfhw =3D _wfhw;
> +	u64 clk_rate =3D rp1->clk_rate;
> +	u64 ticks;
> +
> +	*wf =3D (struct pwm_waveform){ };
> +
> +	if (!wfhw->enabled)
> +		return 0;
> +
> +	wf->period_length_ns =3D DIV_ROUND_UP_ULL(((u64)wfhw->period_ticks + 1)=
 * NSEC_PER_SEC,
> +						clk_rate);
> +
> +	if (!wfhw->inverted_polarity) {
> +		wf->duty_length_ns =3D DIV_ROUND_UP_ULL((u64)wfhw->duty_ticks * NSEC_P=
ER_SEC,
> +						      (u32)clk_rate);
> +	} else {

[Severity: High]
Does the normal polarity case need to clamp the duty ticks similar to the
inverted polarity case?

If the bootloader configures a continuous-high state where the raw hardware
duty ticks exceed the period ticks + 1, this path calculates a duty_length_=
ns
that is strictly greater than the period_length_ns.

When the PWM core subsequently reads this initial state, pwm_wf2state()
handles duty > period by treating it as an inverted polarity and calculating
duty_cycle =3D period - duty_length_ns. This subtraction can silently
underflow, causing the core to interpret the hardware state as having a bad=
ly
corrupted duty cycle.

> +		if (wfhw->duty_ticks > (u64)wfhw->period_ticks + 1) {
> +			/* 100% duty cycle case */
> +			ticks =3D 0;
> +		} else {

[ ... ]

> +static int rp1_pwm_write_waveform(struct pwm_chip *chip,
> +				  struct pwm_device *pwm,
> +				  const void *_wfhw)
> +{
> +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> +	const struct rp1_pwm_waveform *wfhw =3D _wfhw;
> +	u32 value, ctrl;
> +
> +	/* set polarity */
> +	regmap_read(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), &value);
> +	if (!wfhw->inverted_polarity)
> +		value &=3D ~RP1_PWM_CHAN_CTRL_POLARITY;
> +	else
> +		value |=3D RP1_PWM_CHAN_CTRL_POLARITY;
> +	regmap_write(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), value);

[Severity: High]
Could the PWM controller lose its hardware configuration after a system
suspend and resume?

During rp1_pwm_request(), the channel control register is initialized with
essential bits like RP1_PWM_CHAN_CTRL_DEFAULT, which includes the
MODE_TE_MS and FIFO_POP_MASK configurations.

If the hardware loses power during suspend, the registers reset. On resume,
when a consumer re-applies its state, this regmap_read() will read the wiped
hardware register. The driver will then update only the polarity bit and
write it back, failing to restore the required operational mode bits that
were initialized during the request phase.

> +
> +	/* early exit if disabled */

[ ... ]

> +static struct platform_driver rp1_pwm_driver =3D {
> +	.probe =3D rp1_pwm_probe,
> +	/*
> +	 * .remove is not needed because this driver cannot be removed/unbound
> +	 * cause it relies on syscon which cannot be removed
> +	 */
> +	.driver =3D {
> +		.name =3D "rp1-pwm",

[Severity: High]
Is it safe to omit the remove callback here?

Even with suppress_bind_attrs set on the driver, if the parent RP1 PCIe
device is removed, reset, or unbound via sysfs, it will forcibly unbind all
child devices.

Without a remove callback to run cleanup, pwmchip_remove() is never called
and the clock is left enabled. Because the backing memory is devm-managed,
the devres subsystem will eventually free the pwm_chip and regmap memory.
This can leave dangling pointers in the core pwm_chips IDR and the global
syscon_list, which could result in a use-after-free.

> +		.of_match_table =3D rp1_pwm_of_match,
> +		.pm =3D pm_ptr(&rp1_pwm_pm_ops),
> +		.suppress_bind_attrs =3D true,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784539788.gi=
t.andrea.porta@suse.com?part=3D2
