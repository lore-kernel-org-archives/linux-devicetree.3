Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7B6556BAF
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873789; cv=none; b=m/EBo3cOxasGB6+2p2Wz1raV3e0YnJuB+zCyJAUrQwXPL6cc4y5Kbp+N6Za/EkYlaBUs/u+mKRAcR6V0uu3e8jMlafLQgnVDan+odRliFfZsOsjzEBRfxLAFq1B7YvzerdLcayzCgcPvDZpL2apxF74rXKPLD1FoN4JLTEd/K7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873789; c=relaxed/simple;
	bh=3vRacwPE7IdCoV5nBxDtWUkc0n4+ybI0LUq5a1hJOO4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QeWhgughA3Rq/vHX8SBj9M+r8kJjjumR+tbvOE6gMllI0OLoBh1Fk5I4cWmQZtxOKWluR3MiLtol8j5WPhrPA5dW6WhjFyunsZUV2S/L5XaDVD2PnyBaVaxPZkgVqYdVG2w1ww9tMgGszmmfhDkftIUnJX9aJopfzpfGjfXscUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BH4EVPEg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BH4EVPEg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358D91F00ADB;
	Tue,  8 Sep 2026 13:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788873782;
	bh=AYlPAYdyP+JotBEXyNqmfSx37C/RWZTCtpL+qj5v6iY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BH4EVPEgOVTG/jWC9XrqEa2wLkyIqLSZK71QrZgW9qbRQmcV1wdWIIBFQCuVhGYAH
	 1gv4scfxjUwR3N/W+xggaYbW59XeTBE+4Pr7NoOSq7zldF7qpz+sWpioOD84aE0HqF
	 AJRMJ4WqUD+EqQ9fk1udEF7oUYn9JybDhVHOu+QhiTv3UQF6+uK7t51uM1U0ERzLsM
	 v6eGiJpIvupXb93hV6RVcgmTfhMLSwU45WN9LZFIrh0yjLklNyDSZToHL/zLG+R7Rk
	 fH9P4SpAiVUcqrwII8UTFKWrfNVMCKaIeDxVLYRY37MxrcJtbE06+bFxtd5yX5xX0k
	 vXt7rO95NlQJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/3] pwm: rp1: Add RP1 PWM controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <148a9551ef01e099e98b0487d4d1ce69e81619b4.1788872294.git.andrea.porta@suse.com>
References: <cover.1788872294.git.andrea.porta@suse.com>
 <148a9551ef01e099e98b0487d4d1ce69e81619b4.1788872294.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 13:23:01 +0000
Message-Id: <20260908132302.358D91F00ADB@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Exported function rp1_pwm_read_tachometer accesses devm-allocated =
driver data and hardware registers without synchronization or power managem=
ent, risking Use-After-Free and bus faults.
- [High] Calling DIV_ROUND_UP_ULL with a 64-bit divisor causes compiler war=
nings and link errors on 32-bit platforms.
- [High] Returning a positive value (1) from round_waveform_tohw violates k=
ernel error handling conventions and breaks sysfs writes.
- [Medium] The driver is configured as a tristate module but uses builtin_p=
latform_driver(), preventing module unloading.
- [Medium] Failure to check regmap_read return values can lead to the use o=
f uninitialized stack variables.
- [Medium] Implicit zero-initialization in struct assignment destroys previ=
ously read hardware state.
- [Medium] Channel is enabled before the global update flag is toggled, ris=
king mis-sampling of period and duty registers.
- [Low] Missing #include <linux/bitfield.h> for the FIELD_PREP macro.
--

commit ea42a2b908766bfc4699d8f5c75d07f5d52b24b8
Author: Naushir Patuck <naush@raspberrypi.com>

pwm: rp1: Add RP1 PWM controller driver

The Raspberry Pi RP1 southbridge features an embedded PWM controller with 4
output channels. This patch adds the supporting driver framework.

> diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> new file mode 100644
> index 0000000000000..5e85d4204ef4a
> --- /dev/null
> +++ b/drivers/pwm/pwm-rp1.c
> @@ -0,0 +1,452 @@

[ ... ]

> +#define RP1_PWM_CHAN_CTRL(chan)			(0x014 + ((chan) * 0x10))
> +#define RP1_PWM_CHAN_CTRL_POLARITY		BIT(3)
> +#define RP1_PWM_CHAN_CTRL_FIFO_POP_MASK		BIT(8)
> +#define RP1_PWM_CHAN_CTRL_MODE			GENMASK(2, 0)
> +enum rp1_pwm_ctrl_mode {
> +	RP1_PWM_CHAN_CTRL_MODE_ZERO,
> +	RP1_PWM_CHAN_CTRL_MODE_TE_MS,
> +	RP1_PWM_CHAN_CTRL_MODE_PC_MS,
> +	RP1_PWM_CHAN_CTRL_MODE_PD_ENC,
> +	RP1_PWM_CHAN_CTRL_MODE_MSB_SER,
> +	RP1_PWM_CHAN_CTRL_MODE_PPM,
> +	RP1_PWM_CHAN_CTRL_MODE_LE_MS,
> +	RP1_PWM_CHAN_CTRL_MODE_LSB_SER,
> +};
> +
> +#define RP1_PWM_CHAN_CTRL_DEFAULT		(RP1_PWM_CHAN_CTRL_FIFO_POP_MASK +  \
> +						FIELD_PREP(RP1_PWM_CHAN_CTRL_MODE, \
> +						RP1_PWM_CHAN_CTRL_MODE_TE_MS))

[Severity: Low]
Does this rely on an implicit inclusion for the FIELD_PREP macro?

It appears linux/bitfield.h is missing, which could lead to build failures =
if
headers are refactored elsewhere in the kernel.

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
Can regmap_read() fail here and leave value uninitialized?=20

If the underlying MMIO read were to fail, the uninitialized stack variable
would be modified and written directly back into the hardware register. This
pattern also occurs in rp1_pwm_write_waveform(), rp1_pwm_read_waveform(),
and rp1_pwm_read_tachometer().

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

[ ... ]

> +	if (period_ticks > U32_MAX) {
> +		period_ticks =3D U32_MAX;
> +	} else if (period_ticks < 2) {
> +		period_ticks =3D 2;
> +		ret =3D 1;
> +	}

[Severity: High]
Does returning a positive value (1) here violate kernel error handling
conventions and break sysfs write semantics?=20

Returning a positive value instead of 0 or a negative error code might cause
VFS write() implementations to treat the result as a partially completed wr=
ite,
forcing userspace into infinite retry loops when a small period is requeste=
d.

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
> +		if (wfhw->duty_ticks > (u64)wfhw->period_ticks + 1) {
> +			/* 100% duty cycle case */
> +			ticks =3D 0;
> +		} else {
> +			ticks =3D (u64)wfhw->period_ticks + 1 - wfhw->duty_ticks;
> +		}
> +		wf->duty_length_ns =3D DIV_ROUND_UP_ULL(ticks * NSEC_PER_SEC, clk_rate=
);
> +		wf->duty_offset_ns =3D DIV_ROUND_UP_ULL((u64)(wfhw->period_ticks + 1 -=
 ticks) *
> +						      NSEC_PER_SEC, clk_rate);
> +	}

[Severity: High]
Can this cause build failures on 32-bit architectures?

DIV_ROUND_UP_ULL delegates to do_div, which expects a 32-bit divisor. Passi=
ng
the uncast 64-bit clk_rate directly for period_length_ns, duty_length_ns, a=
nd
duty_offset_ns might trigger a __bad_size() link error when compiled on 32-=
bit
platforms allowed by COMPILE_TEST.

[ ... ]

> +static int rp1_pwm_write_waveform(struct pwm_chip *chip,
> +				  struct pwm_device *pwm,
> +				  const void *_wfhw)
> +{
> +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> +	const struct rp1_pwm_waveform *wfhw =3D _wfhw;
> +	u32 value, ctrl;

[ ... ]

> +	/* set period and duty cycle */
> +	regmap_write(rp1->regmap,
> +		     RP1_PWM_RANGE(pwm->hwpwm), wfhw->period_ticks);
> +	regmap_write(rp1->regmap,
> +		     RP1_PWM_DUTY(pwm->hwpwm), wfhw->duty_ticks);
> +
> +	/* enable the channel */
> +	ctrl |=3D RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
> +	regmap_write(rp1->regmap, RP1_PWM_GLB_CTRL, ctrl);
> +
> +	rp1_pwm_apply_config(chip, pwm);

[Severity: Medium]
Does enabling the channel before toggling the global update flag expose the
hardware to a mis-sampling window?

Asserting CHANNEL_ENABLE and writing it to hardware before SET_UPDATE is
applied via rp1_pwm_apply_config() violates hardware synchronization rules,
potentially causing the PWM clock domain to act on mis-sampled settings.

[ ... ]

> +static int rp1_pwm_read_waveform(struct pwm_chip *chip,
> +				 struct pwm_device *pwm,
> +				 void *_wfhw)
> +{
> +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> +	struct rp1_pwm_waveform *wfhw =3D _wfhw;
> +	u32 value;
> +
> +	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &value);
> +	wfhw->enabled =3D !!(value & RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm=
));
> +
> +	regmap_read(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), &value);
> +	wfhw->inverted_polarity =3D !!(value & RP1_PWM_CHAN_CTRL_POLARITY);
> +
> +	if (wfhw->enabled) {
> +		regmap_read(rp1->regmap, RP1_PWM_RANGE(pwm->hwpwm), &wfhw->period_tick=
s);
> +		regmap_read(rp1->regmap, RP1_PWM_DUTY(pwm->hwpwm), &wfhw->duty_ticks);
> +	} else {
> +		*wfhw =3D (typeof(*wfhw)) {
> +			.period_ticks =3D 0,
> +			.duty_ticks =3D 0,
> +		};
> +	}

[Severity: Medium]
Does this struct assignment implicitly clear the inverted_polarity and enab=
led
fields?

These fields were populated by regmap_read() calls earlier in the function,
and zeroing them out via implicit zero-initialization here seems to discard
the synchronized hardware state when reading a disabled channel.

[ ... ]

> +int rp1_pwm_read_tachometer(struct device *dev)
> +{
> +	struct pwm_chip *chip;
> +	struct rp1_pwm *rp1;
> +	u32 tach_val;
> +
> +	if (!dev)
> +		return -EINVAL;
> +
> +	chip =3D dev_get_drvdata(dev);
> +	if (!chip)
> +		return -ENODEV;
> +
> +	rp1 =3D pwmchip_get_drvdata(chip);
> +	if (!rp1)
> +		return -ENODEV;
> +
> +	regmap_read(rp1->regmap, RP1_PWM_PHASE(2), &tach_val);
> +
> +	return (int)tach_val;
> +}
> +EXPORT_SYMBOL_NS_GPL(rp1_pwm_read_tachometer, "RP1_PWM_FAN");

[Severity: High]
Can calling this exported function concurrently with module unbind result i=
n a
use-after-free?

Retrieving driver data here without synchronization might allow a consumer
driver to race with pwmchip_remove() and the subsequent freeing of the chip
and rp1 structures.

Additionally, since the device clock is disabled during rp1_pwm_suspend(),
would invoking this MMIO read during system suspend trigger a synchronous
external abort?

[ ... ]

> +static struct platform_driver rp1_pwm_driver =3D {
> +	.probe =3D rp1_pwm_probe,
> +	.remove =3D rp1_pwm_remove,
> +	.driver =3D {
> +		.name =3D "rp1-pwm",
> +		.of_match_table =3D rp1_pwm_of_match,
> +		.pm =3D pm_ptr(&rp1_pwm_pm_ops),
> +		.suppress_bind_attrs =3D true,
> +	},
> +};
> +builtin_platform_driver(rp1_pwm_driver);

[Severity: Medium]
Is there a reason builtin_platform_driver() is used instead of
module_platform_driver() for a driver configured as a tristate module?

Using builtin_platform_driver() suppresses the generation of a module_exit
function, which permanently blocks unloading the module despite the driver
exporting an rp1_pwm_remove() function.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788872294.gi=
t.andrea.porta@suse.com?part=3D2
