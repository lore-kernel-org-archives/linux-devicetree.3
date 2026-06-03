Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C757331F984
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501642; cv=none; b=jOwlMiDgdRhapJTROtzmGXF4f9uybHhyVMymtVh2S99cqI29waS5fxC9LjD+vTHEWnDDpcW80vSVLUEAVWgD7vmAIySKVhgVg/bw/5IVovEa0MS0DGawsVsYcCFEXM720vHMxqHpbHvfU0X92GCtp2fyyJ5CU3PYldpftyYo5kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501642; c=relaxed/simple;
	bh=IrTsfewZzvYypNgkd4eR3CgmP71Aef9VLz6a5KzpxuU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RXy7zPjkaL1xGmYHiuHyIGF4qFv5TuL2JhwoL1nOfBAmL3neY2lGVOTDIWKz0frsZFI4wqCgebygbAbi18m6UtG86vPotounYDkIg8y2iXnJDa/OSkyf9AleY9PF4yCkakf1JJ8qvoo6HMEAjYcbW9PZ2MacuLzsTn25S5272fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5G28YbR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5G28YbR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5C41F00893;
	Wed,  3 Jun 2026 15:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780501636;
	bh=TdoKGKmtWRWQiBG8WnFdA+Sqt61AdDDca1Vi+nAyP3Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F5G28YbRysXIU28COESx1novY7IYlv+/0gysa5B8rS22YFJ+tCOUfnfPNYhLCFCmn
	 wsTTMgZu1fHABT1feqhTAmr3BgeCio0XkxIImXkycvgjF8PUC6Yx2AudsSzzuBXSHW
	 enwOnrpbPaqxu3YhGE797zV5VyRXNfk2hAASL07xXP4/ZUUEew5kTBHasUogK+0Nzt
	 WMeXpjMdrg2N7q9QkqKUe3GtUj/vwsL87tZrqLf6UxUokz2dhIAj+fH953wB9wyzKX
	 0xovh+/dSLn2fSeCsEnlYiuU/ZSbGbDlPtVmXXESaKMvfsZuEIAmDQe5BnuyhN9IwZ
	 crst6RC1MadIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] pwm: rp1: Add RP1 PWM controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <8eef956a5eb473f051bbda89ec4c9991c1b47de2.1780498640.git.andrea.porta@suse.com>
References: <8eef956a5eb473f051bbda89ec4c9991c1b47de2.1780498640.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 15:47:15 +0000
Message-Id: <20260603154716.1B5C41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Missing `pwmchip_remove()` on the `of_syscon_register_regmap()` er=
ror path leaves a dangling PWM chip.
- [High] When disabling a PWM channel, the driver fails to clear the polari=
ty bit, causing the output to erroneously remain HIGH if it was previously =
inverted.
- [High] Registering a devm-managed regmap with the permanent syscon regist=
ry creates a teardown asymmetry.
- [High] Hardware channel control registers (`CHAN_CTRL`) are not restored =
across system suspend/resume.
- [Medium] Non-monotonic period limit checking in `rp1_pwm_round_waveform_t=
ohw()` causes larger requested periods to result in smaller hardware period=
s.
- [Medium] Calculating `period_length_ns` from hardware state suffers from =
a 32-bit integer overflow before casting to u64, resulting in a zero period.
- [Medium] Calculating inverted polarity duty length underflows if the hard=
ware is configured for a 100% duty cycle.
- [Medium] Returning a positive integer (1) from `round_waveform_tohw` inco=
rrectly propagates as an error.
--

commit 90d2019e94496c6949f2d04c2605c6a197b16d6a
Author: Naushir Patuck <naush@raspberrypi.com>

pwm: rp1: Add RP1 PWM controller driver

The Raspberry Pi RP1 southbridge features an embedded PWM controller
with 4 output channels, alongside an RPM interface to read the fan
speed on the Raspberry Pi 5. Add the supporting driver.

> diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> new file mode 100644
> index 0000000000000..052c3ae770569
> --- /dev/null
> +++ b/drivers/pwm/pwm-rp1.c
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
> +
> +	period_ticks =3D mul_u64_u64_div_u64(wf->period_length_ns, clk_rate, NS=
EC_PER_SEC);
> +
> +	/*
> +	 * The period is limited to U32_MAX - 1
> +	 * to allow 100% duty cycle.
> +	 */
> +	if (period_ticks > U32_MAX) {
> +		period_ticks =3D U32_MAX - 1;

[Severity: Medium]
Does this limit check break monotonicity for large periods?

If the requested period translates to U32_MAX, this condition is false and
the period becomes U32_MAX - 1.

If it translates to U32_MAX + 1, it becomes U32_MAX - 1, which is then
subtracted by 1 later, yielding U32_MAX - 2. This makes a larger requested
period result in a smaller actual hardware period.

> +	} else if (!period_ticks) {
> +		period_ticks =3D 2;
> +		ret =3D 1;
> +	}

[Severity: Medium]
Is returning a positive integer here intentional?

The PWM core subsystem expects round_waveform_tohw callbacks to return 0 on
success or a negative error code on failure. Returning 1 could propagate as
an error up to consumer drivers, breaking operation for very small periods.

> +
> +	duty_ticks =3D mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NSEC_P=
ER_SEC);
[ ... ]
> +static int rp1_pwm_round_waveform_fromhw(struct pwm_chip *chip,
> +					 struct pwm_device *pwm,
> +					 const void *_wfhw,
> +					 struct pwm_waveform *wf)
> +{
> +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> +	const struct rp1_pwm_waveform *wfhw =3D _wfhw;
> +	u64 clk_rate =3D rp1->clk_rate;
> +	u32 ticks;
> +
> +	*wf =3D (struct pwm_waveform){ };
> +
> +	if (!wfhw->enabled)
> +		return 0;
> +
> +	wf->period_length_ns =3D DIV_ROUND_UP_ULL((u64)(wfhw->period_ticks + 1)=
 * NSEC_PER_SEC,
> +						clk_rate);

[Severity: Medium]
Could this encounter a 32-bit integer overflow?

Since wfhw->period_ticks is a 32-bit integer, the addition of 1 happens in
32-bit space before the cast to u64.

If the hardware register was configured to 0xffffffff by the bootloader for
a 100% duty cycle, 0xffffffff + 1 wraps around to 0, producing a period of =
0.

Should the cast be placed before the addition?

> +
> +	if (!wfhw->inverted_polarity) {
> +		wf->duty_length_ns =3D DIV_ROUND_UP_ULL((u64)wfhw->duty_ticks * NSEC_P=
ER_SEC,
> +						      clk_rate);
> +	} else {
> +		ticks =3D wfhw->period_ticks + 1 - wfhw->duty_ticks;
> +		wf->duty_length_ns =3D DIV_ROUND_UP_ULL((u64)ticks * NSEC_PER_SEC, clk=
_rate);

[Severity: Medium]
Will this subtraction underflow if the hardware is configured for a 100%
duty cycle?

The driver allows duty_ticks to exceed period_ticks + 1 to achieve a 100%
duty cycle.

If inverted polarity is active and duty_ticks is strictly larger than
period_ticks + 1, this unsigned 32-bit subtraction will wrap around to a
massive integer, corrupting the duty_length_ns.

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
> +	/* early exit if disabled */
> +	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &ctrl);
> +	if (!wfhw->enabled) {
> +		ctrl &=3D ~RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
> +		goto exit_disable;
> +	}

[Severity: High]
Does skipping the polarity update here cause the output to erroneously
remain HIGH while disabled?

The early exit skips the read-modify-write block that updates
RP1_PWM_CHAN_CTRL_POLARITY.

The driver notes state that when disabled, the output is driven to 1 if
polarity is inversed. If a channel previously configured with inverted
polarity is disabled, it seems it will continually output a HIGH signal,
violating the PWM framework expectation.

> +
> +	/* set period and duty cycle */
> +	regmap_write(rp1->regmap,
[ ... ]
> +static int rp1_pwm_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	chip->ops =3D &rp1_pwm_ops;
> +
> +	platform_set_drvdata(pdev, chip);
> +
> +	ret =3D pwmchip_add(chip);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to register PWM chip\n");
> +		goto err_disable_clk;
> +	}
> +
> +	ret =3D of_syscon_register_regmap(np, rp1->regmap);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to register syscon\n");
> +		goto err_disable_clk;
> +	}

[Severity: High]
Is there a missing call to pwmchip_remove() on this error path?

If of_syscon_register_regmap() fails, the function jumps to err_disable_clk
and returns an error.

Since the chip was allocated with devm_pwmchip_alloc(), devres will free
the memory, but the PWM subsystem will retain pointers to the freed chip in
its IDR mapping, potentially leading to a use-after-free.

[Severity: High]
Also, does registering a devm-managed regmap with the permanent syscon
registry create a teardown asymmetry?

The regmap is allocated with devm_regmap_init_mmio(). If the underlying
device is hotplug removed, devres will automatically free the regmap memory.

However, the syscon framework does not provide an unregister function,
leaving it with a dangling pointer in its static list that could cause a
use-after-free upon subsequent lookups.

> +
> +	return 0;
> +
> +err_disable_clk:
> +	clk_disable_unprepare(rp1->clk);
> +
> +	return ret;
> +}
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

[Severity: High]
Should the hardware channel control registers (CHAN_CTRL) be restored across
resume?

When the system suspends, the southbridge may lose power and reset its
registers. During probe, these registers are initialized with required
configuration bits like MODE_TE_MS and FIFO_POP_MASK.

This resume function merely re-enables the clock. Because the regmap is not
configured to cache and restore registers, a subsequent write might update
only the polarity bit, leaving the channel mode at 0 and breaking PWM
output.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780498640.gi=
t.andrea.porta@suse.com?part=3D2
