Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBB038333A
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 14:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781273593; cv=none; b=HNc/belALzCY1kQA0chm2pI60kIgCYcAAfxK7wQZCH/RJzRpysfhVZRYGELyjNC8EOpufTSFK+U4vNhj1aUFqw05OV9tHFrutSN8a5GmROAVvZ/x1cdEenszF/kv+770VX436U/YbnVZS4WdYDiBPrrl8so1OLKtIGBSwCzJ600=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781273593; c=relaxed/simple;
	bh=CxuJhw7EpggyQaKBxOKRypF47bOZVsjWQ90Ru8jW4vg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f4hAB73re1uo//zDOGdADCehOX7aP06I7xjYzxWHsBT1kFvAzGJs2ku6/dQCq8XYCrogqLEd0LMgKSXte/aCyDVVjA1njH9dXVIohspkFOJACYZ/RvjxnTJszGCTGKUol+h66J0XTs5Ig4gDqLgdpx0jjqy9VJIHVJ+/VYkJhb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IodnVFTi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IodnVFTi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D070C1F000E9;
	Fri, 12 Jun 2026 14:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781273590;
	bh=hn6fvjkhhynosDGVHarPsSf0fz9vDi/6t01EtwOzs6c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IodnVFTiPQ+1DY2PXAmZ+N6Rby1UQlGCOsMcLxssTdn5dw+YSjcoNAv7cnJz6UApE
	 v68uYWCITGN2qkxZop4oW/oFxS3+EMll4VGTgt/2qtAk9VsKqdPBPIuxDL+yqzv5c1
	 0c/uDPSskfE7V7/JsIcRiRFapT0EZF4xEOjLLBIB2LMoBI5AM1qtCX5JfOU0npzofp
	 pqyS4JCw4wqcbw61npG1zJeJp0WlcAHQ42sCNNu3Y1D/87G1uDVBchab3Vqyy1OK0R
	 2vTNbfCmkK6dIZRq1uBkvyQKEJdcVU3/MlCnvDHAs3KjAZ7vH0qx+1NuB2MhLVSgX8
	 oS31/TqoR7w6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] pwm: rp1: Add RP1 PWM controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <f8dd46a553351adaf9d29fbba9f98e803b672fe7.1780670224.git.andrea.porta@suse.com>
References: <f8dd46a553351adaf9d29fbba9f98e803b672fe7.1780670224.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 14:13:09 +0000
Message-Id: <20260612141309.D070C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Registering a devm-managed regmap with the syscon subsystem leads =
to a Use-After-Free.
- [High] The `wfhw->inverted_polarity` field is left uninitialized when dis=
abling the PWM channel, leading to random inactive pin states.
- [Medium] Underflow in duty cycle calculation when hardware DUTY register =
exceeds RANGE + 1.
- [Medium] Non-atomic read-modify-write sequences on shared global register=
s race with syscon consumers.
- [Medium] Hardware configuration registers are not restored during system =
resume.
- [Low] 64-bit modulo and division operations cause link errors on 32-bit p=
latforms.
--

commit b70ebe40d042bfe1fa3353e46fc0881fdfa5686f
Author: Naushir Patuck <naush@raspberrypi.com>

pwm: rp1: Add RP1 PWM controller driver

The Raspberry Pi RP1 southbridge features an embedded PWM
controller with 4 output channels, alongside an RPM interface
to read the fan speed on the Raspberry Pi 5.

> diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> new file mode 100644
> index 0000000000000..6382a81a5ea0f
> --- /dev/null
> +++ b/drivers/pwm/pwm-rp1.c

[ ... ]

> +static void rp1_pwm_apply_config(struct pwm_chip *chip, struct pwm_devic=
e *pwm)
> +{
> +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> +	u32 value;
> +
> +	/* update the changed registers on the next strobe to avoid glitches */
> +	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &value);
> +	value |=3D RP1_PWM_GLB_CTRL_SET_UPDATE;
> +	regmap_write(rp1->regmap, RP1_PWM_GLB_CTRL, value);
> +}

[Severity: Medium]
Will this read-modify-write sequence race with syscon consumers?

Since this driver exposes its regmap via syscon to allow other drivers to
access it concurrently, a separate regmap_read() and regmap_write()
releases the internal lock in between.

If a syscon consumer modifies RP1_PWM_GLB_CTRL simultaneously, will its
changes be silently overwritten? Should this use regmap_update_bits()
instead?

[ ... ]

> +static int rp1_pwm_round_waveform_tohw(struct pwm_chip *chip,
> +				       struct pwm_device *pwm,
> +				       const struct pwm_waveform *wf,
> +				       void *_wfhw)
> +{
> +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> +	u64 period_ticks, duty_ticks, offset_ticks;
> +	struct rp1_pwm_waveform *wfhw =3D _wfhw;
> +	u64 clk_rate =3D rp1->clk_rate;
> +	int ret =3D 0;
> +
> +	if (!wf->period_length_ns) {
> +		wfhw->enabled =3D false;
> +		return 0;
> +	}

[Severity: High]
Does this early return leave wfhw->inverted_polarity uninitialized?

If the PWM core passes uninitialized memory for _wfhw, returning here
without setting inverted_polarity means rp1_pwm_write_waveform() will later
read uninitialized memory to configure the RP1_PWM_CHAN_CTRL_POLARITY bit.

Because the hardware drives the pin to 0 or 1 based on polarity when disabl=
ed,
could this cause the disabled state to unpredictably flip between high and =
low?

[ ... ]

> +	duty_ticks =3D mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NSEC_P=
ER_SEC);
> +	duty_ticks =3D min(duty_ticks, period_ticks);
> +	offset_ticks =3D mul_u64_u64_div_u64(wf->duty_offset_ns, clk_rate, NSEC=
_PER_SEC);
> +	if (offset_ticks >=3D period_ticks)
> +		offset_ticks %=3D period_ticks;

[Severity: Low]
Will this 64-bit modulo operation cause link errors on 32-bit builds?

Since both offset_ticks and period_ticks are u64, using the modulo
operator directly will emit a call to __umoddi3. Since Kconfig allows
COMPILE_TEST, will this break the build on 32-bit architectures?

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
> +						      clk_rate);

[Severity: Low]
Is it safe to pass clk_rate as a u64 divisor to DIV_ROUND_UP_ULL()?

DIV_ROUND_UP_ULL uses do_div() internally which expects a 32-bit divisor.
Will this cause division helpers to be missing during 32-bit builds?

> +	} else {
> +		ticks =3D (u64)wfhw->period_ticks + 1 - wfhw->duty_ticks;

[Severity: Medium]
Can this calculation underflow if the hardware DUTY register exceeds RANGE =
+ 1?

rp1_pwm_read_waveform() fetches period_ticks and duty_ticks directly from
the hardware registers without clamping. If the bootloader configures a
duty cycle greater than the period (to force a continuous 100% output),
would this undergo an unsigned underflow?

Could this result in an astronomically large u64 value for ticks, corrupting
the reported duty_length_ns?

> +		wf->duty_length_ns =3D DIV_ROUND_UP_ULL(ticks * NSEC_PER_SEC, clk_rate=
);
> +		wf->duty_offset_ns =3D wf->period_length_ns - wf->duty_length_ns;
> +	}
> +
> +	return 0;
> +}
> +
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

[Severity: Medium]
Is this another non-atomic read-modify-write susceptible to data races?

Similar to rp1_pwm_apply_config(), will syscon consumer modifications to
RP1_PWM_CHAN_CTRL be lost if they occur between the read and write?

[ ... ]

> +static int rp1_pwm_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	rp1->regmap =3D devm_regmap_init_mmio(dev, base, &rp1_pwm_regmap_config=
);
> +	if (IS_ERR(rp1->regmap))
> +		return dev_err_probe(dev, PTR_ERR(rp1->regmap), "Cannot initialize reg=
map\n");
[ ... ]
> +	ret =3D of_syscon_register_regmap(np, rp1->regmap);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to register syscon\n");
> +		goto err_remove_chip;
> +	}
> +
> +	return 0;
> +
> +err_remove_chip:
> +	pwmchip_remove(chip);
> +err_disable_clk:
> +	clk_disable_unprepare(rp1->clk);
> +
> +	return ret;
> +}
> +
> +static void rp1_pwm_remove(struct platform_device *pdev)
> +{
> +	struct pwm_chip *chip =3D platform_get_drvdata(pdev);
> +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> +
> +	pwmchip_remove(chip);
> +
> +	if (rp1->clk_enabled) {
> +		clk_disable_unprepare(rp1->clk);
> +		rp1->clk_enabled =3D false;
> +	}
> +}

[Severity: High]
Will registering a devm-managed regmap with the syscon subsystem lead to a
use-after-free on device unbind?

The syscon subsystem stores this regmap pointer in a global, permanent list
and provides no API to unregister it. If the RP1 device is unbound, devres
will automatically free the regmap memory.

Would any subsequent syscon lookup by consumers return this freed memory,
triggering a use-after-free?

[ ... ]

> +static int rp1_pwm_resume(struct device *dev)
> +{
> +	struct pwm_chip *chip =3D dev_get_drvdata(dev);
> +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(rp1->clk);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable clock on resume: %pe\n", ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	rp1->clk_enabled =3D true;
> +
> +	return 0;
> +}

[Severity: Medium]
Does the resume handler need to restore the hardware register state?

The PM operations only toggle the clock, but do not save and restore the
PWM configuration registers (such as RP1_PWM_GLB_CTRL, CHAN_CTRL, RANGE,
DUTY), and the regmap lacks a cache configuration to do this automatically.

If the hardware loses its state during S3 suspend, will the controller
wake up in its default reset state (stopped), breaking consumer devices
that expect the PWM signal to be maintained?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780670224.gi=
t.andrea.porta@suse.com?part=3D2
