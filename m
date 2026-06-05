Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BE13CEBB1
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 08:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780648711; cv=none; b=Ddi5aGCeYjf0eR0NTVQfG8EuTVJDZly+9s9nFZVnmt4ryJVTpBwa6pv6cipBq9vWifSYBCdjOYyYZUyRDBvMxXxDzSjrDR9CI3Q0j7aUFHoB/nUy6a9CwvYJVcpdWgFx5ynxDOoj9B3Z7p3c/dII6GaIjeHoSPbjdC6dotQ++qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780648711; c=relaxed/simple;
	bh=gLcsJIurkjQVapfNm9kBxm9/GrZM/hF8Ss9eH9xH5vE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sVrtXgjBGykagO1gwV0btC0N+3bpzoymkA53+mGU8od4oeI5f/BDLFdMd0P3e+NDvGEULqwyXBpAi0LxFqrEJ+6KTWPNb7Ct6jihZ2ovlb6c65rtNUhknEL28Kff7m+3qp5Q9X8NiWWxlZq6N9QcYzFhvSI+LIE58GXVdR2ua4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGSV+fkB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGSV+fkB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F021F00893;
	Fri,  5 Jun 2026 08:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780648709;
	bh=4n2fJoZkNfcRdKdosXKp6pudTPVtFY+H4loArkIQjbs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jGSV+fkBE5/6jCppW6vkw0Rs+tAAIzUNI0JRLLJeXsQBrGXmt25vGqgcq44cdLvwe
	 r51Ng/pcCBj1xg5ceuhQkVcxEmxI52yIPFRG9W5m8BTWXZmwdLCkJwA+DE8EcvyXaC
	 WlTrkqOHosiiSq1eBZFfx95wmuHGUVq86JIP5M8HyrbQE+DMlPJao1IlxjWIOlEvLc
	 +PpHsVOKYhqU5y60jlwJNxNhlaE3a+KF7vSle54pdJuf9CwzXiSkf2V4FRuBJo6aPy
	 IqfG4us4Gv3XCeMgIDh/nR3VL+o2lGyoWgvv12ez1GPQFoGizyWn32s6WdXcRoc/Tt
	 8qvq3mgzDiHbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] pwm: dwc: add of/platform support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xuyang Dong" <dongxuyang@eswincomputing.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260605082439.1801-1-dongxuyang@eswincomputing.com>
References: <20260605082439.1801-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 08:38:28 +0000
Message-Id: <20260605083829.60F021F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:

New issues:
- [High] Registering the PWM chip before completing runtime PM initializati=
on exposes the hardware to consumers while clocks might be turned off.
- [High] Manual hardware teardown in `.remove()` precedes `pwm_chip` deregi=
stration, leading to potential bus faults.
- [High] TOCTOU race in `remove()` when conditionally acquiring a runtime P=
M reference allows concurrent runtime suspend while accessing registers.
- [High] System resume is incorrectly aborted if expected runtime PM idle o=
perations return `-EAGAIN`.
- [High] Unconditional assertion of the reset control on the probe error pa=
th and during module removal permanently kills active hardware and unbalanc=
es the reset API.
- [High] `remove()` artificially drops runtime PM references that belong to=
 active consumers, causing an underflow.
- [Medium] Integer overflow in timer configuration allows invalid large dut=
y cycle/period values to bypass validation.
- [Medium] Clock references are leaked during module removal if the device =
is held in an active PM state but no PWM channels are enabled.
- [Medium] The driver rounds UP duty cycle and period calculations instead =
of rounding DOWN, violating PWM subsystem rules.
- [Medium] The driver evaluates the static device tree polarity instead of =
the dynamically requested runtime polarity, mapping the duty cycle incorrec=
tly.

Pre-existing issues:
- [High] `dwc_pwm_get_state()` ignores the return value of `pm_runtime_get_=
sync()`, allowing unprotected hardware access.
--

commit 517966ff9e8e50806716056dd4bd3f2f88b832c0
Author: Xuyang Dong <dongxuyang@eswincomputing.com>

pwm: dwc: add of/platform support

The dwc pwm controller can be used in non-PCI systems, so allow
either platform or OF based probing.

> diff --git a/drivers/pwm/pwm-dwc-core.c b/drivers/pwm/pwm-dwc-core.c
> index 6dabec93a3c64..a6de05e273216 100644
> --- a/drivers/pwm/pwm-dwc-core.c
> +++ b/drivers/pwm/pwm-dwc-core.c
[ ... ]
> @@ -44,21 +45,52 @@ static int __dwc_pwm_configure_timer(struct dwc_pwm *=
dwc,
[ ... ]
> +	if (dwc->features & DWC_TIM_CTRL_0N100PWM_EN) {
> +		/*
> +		 * Calculate width of low and high period in terms of input
> +		 * clock periods and check are the result within HW limits
> +		 * between 0 and 2^32 periods.
> +		 */
> +		tmp =3D state->duty_cycle * dwc->clk_rate;

[Severity: Medium]
Could this multiplication overflow the 64-bit boundary before the hardware
limit check if a consumer requests an extremely large period? Both duty_cyc=
le
and period are u64 nanoseconds, while clk_rate is an unsigned long. A
wrapped-around small value would evade the hardware limit check entirely.
Should this use mul_u64_u64_div_u64() to scale the values safely?

> +		tmp =3D DIV_ROUND_UP_ULL(tmp, NSEC_PER_SEC);

[Severity: Medium]
Does this violate the PWM subsystem rules by rounding up instead of down?
The PWM core framework strictly requires that the .apply callback rounds do=
wn
the requested period and duty cycle to the nearest achievable hardware valu=
e.

> +		if (tmp >=3D (1ULL << 32))
> +			return -ERANGE;
> +
> +		if (pwm->args.polarity =3D=3D PWM_POLARITY_INVERSED)
> +			high =3D tmp;
> +		else
> +			low =3D tmp;

[Severity: Medium]
Should this evaluate the dynamically requested state->polarity instead of t=
he
static device tree polarity in pwm->args.polarity? Since dwc_pwm_apply()
enforces PWM_POLARITY_INVERSED, if the device tree was configured with
PWM_POLARITY_NORMAL, this will program the hardware with the inverted duty
cycle relative to what the consumer actually requested.

[ ... ]
> @@ -121,11 +157,17 @@ static int dwc_pwm_get_state(struct pwm_chip *chip,=
 struct pwm_device *pwm,
>  			     struct pwm_state *state)
>  {
>  	struct dwc_pwm *dwc =3D to_dwc_pwm(chip);
> +	unsigned long clk_rate;
>  	u64 duty, period;
>  	u32 ctrl, ld, ld2;
> =20
>  	pm_runtime_get_sync(pwmchip_parent(chip));

[Severity: High]
This isn't a bug introduced by this patch, but the return value of
pm_runtime_get_sync() is ignored here. If the function fails (for example,
returning -EACCES when PM runtime is disabled during driver removal, or bef=
ore
it is enabled in probe), the hardware might not be powered on and clocks co=
uld
remain gated. The function will then proceed to read the DWC_TIM_CTRL and
DWC_TIM_LD_CNT registers, which can cause a synchronous external abort when
accessing unclocked hardware. Can we add a check for the return value here?

> diff --git a/drivers/pwm/pwm-dwc-of.c b/drivers/pwm/pwm-dwc-of.c
> new file mode 100644
> index 0000000000000..d8b1606e51af4
> --- /dev/null
> +++ b/drivers/pwm/pwm-dwc-of.c
[ ... ]
> +static int dwc_pwm_plat_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D devm_pwmchip_add(dev, chip);
> +	if (ret) {
> +		dev_err(dev, "failed to add pwm chip\n");
> +		goto reset_assert;
> +	}
> +
> +	data->chips[0] =3D chip;
> +	dev_set_drvdata(dev, data);
> +
> +	/*
> +	 * If any PWM channel is enabled, mark device active and hold runtime PM
> +	 * references for each enabled channel. Otherwise, gate the clocks.
> +	 */
> +	if (pwm_en) {
> +		pm_runtime_set_active(dev);
> +		for (i =3D 0; i < chip->npwm; i++) {
> +			if (ctrl[i])
> +				pm_runtime_get_noresume(dev);
> +		}
> +	} else {
> +		clk_disable_unprepare(dwc->clk);
> +		clk_disable_unprepare(dwc->bus_clk);
> +	}
> +
> +	pm_runtime_enable(dev);

[Severity: High]
Does registering the PWM chip before enabling PM expose the hardware to
consumers prematurely? devm_pwmchip_add() is called before pm_runtime_enabl=
e().
If a consumer accesses the PWM during this window, the core driver's
pm_runtime_get_sync() call would fail with -EACCES, but still proceed to ac=
cess
registers. At the same time, probe might gate the clocks if pwm_en is false,
leading to a bus fault.

> +
> +	return 0;
> +
> +reset_assert:
> +	reset_control_assert(dwc->rst);

[Severity: High]
Does this unconditionally assert the reset control on the error path? The
commit message mentions resetting only when no PWM channel is enabled. If
pwm_en was true, this forcibly kills actively running hardware. If pwm_en w=
as
false, probe used reset_control_reset() (which is a pulse), so asserting it
here leaves the line permanently asserted in an unbalanced state.

> +disable_clk:
> +	clk_disable_unprepare(dwc->clk);
> +disable_busclk:
> +	clk_disable_unprepare(dwc->bus_clk);
> +
> +	return ret;
> +}
> +
> +static void dwc_pwm_plat_remove(struct platform_device *pdev)
> +{
[ ... ]
> +	/*
> +	 * Resume the device if it is runtime suspended to allow
> +	 * safe register access.
> +	 */
> +	pm_flags =3D pm_runtime_status_suspended(&pdev->dev);
> +	if (pm_flags)
> +		pm_runtime_get_sync(&pdev->dev);

[Severity: High]
Is there a race condition when conditionally acquiring this PM reference? If
pm_runtime_status_suspended() returns false, the code proceeds to read
registers without taking a reference. An auto-suspend timer or a concurrent
consumer could suspend the device immediately after this check, turning off=
 the
clocks and causing the subsequent DWC_TIM_CTRL reads to trigger a bus fault.
Should pm_runtime_get_sync() be called unconditionally?

> +
> +	for (idx =3D 0; idx < chip->npwm; idx++) {
> +		if (dwc_pwm_readl(dwc, DWC_TIM_CTRL(idx)) & DWC_TIM_CTRL_EN) {
> +			pwm_en =3D true;
> +			pm_runtime_put_noidle(&pdev->dev);
> +		}
> +	}

[Severity: High]
Does dropping the PM reference here underflow the usage count for active
consumers? If a consumer has taken over the PWM channel, it logically owns =
that
reference via dwc_pwm_apply(). Because devres unregisters the PWM chip after
remove() finishes, the PWM core will eventually call
dwc_pwm_apply(..., enabled=3Dfalse), which calls pm_runtime_put_sync(). Dro=
pping
it here artificially might lead to a usage count underflow.

> +
> +	/*
> +	 * Re-suspend the device if it was runtime suspended prior to
> +	 * the register access.
> +	 */
> +	if (pm_flags)
> +		pm_runtime_put_sync(&pdev->dev);
> +
> +	if (pwm_en) {
> +		clk_disable_unprepare(dwc->clk);
> +		clk_disable_unprepare(dwc->bus_clk);
> +	}

[Severity: Medium]
Will this leak clock references if the device is active but no PWM channels=
 are
enabled? If pwm_en is false but the device's PM runtime state is RPM_ACTIVE
(due to an open sysfs handle or a pending auto-suspend), skipping this block
leaves the clocks on. The subsequent pm_runtime_disable() does not turn off
clocks, permanently leaking them.

> +
> +	pm_runtime_disable(&pdev->dev);
> +	reset_control_assert(dwc->rst);
> +}

[Severity: High]
Does manually tearing down the hardware here lead to bus faults during devr=
es
cleanup? Since the driver registers the chip using devm_pwmchip_add(), devr=
es
will unregister the PWM chip after dwc_pwm_plat_remove() returns. During th=
at
window, the device is fully accessible to consumers, but clocks are off and
reset is asserted. Additionally, unconditionally asserting the reset here
ignores the earlier logic to keep active hardware running if pwm_en was tru=
e.

[ ... ]
> +static int dwc_pwm_resume(struct device *dev)
> +{
[ ... ]
> +	for (idx =3D 0; idx < chip->npwm; idx++) {
> +		dwc_pwm_writel(dwc, dwc->ctx[idx].cnt, DWC_TIM_LD_CNT(idx));
> +		dwc_pwm_writel(dwc, dwc->ctx[idx].cnt2, DWC_TIM_LD_CNT2(idx));
> +		dwc_pwm_writel(dwc, dwc->ctx[idx].ctrl, DWC_TIM_CTRL(idx));
> +	}
> +
> +	if (pm_flags) {
> +		/* Balance the refcount taken by pm_runtime_get_sync
> +		 * if it was used
> +		 */
> +		ret =3D pm_runtime_put_sync(dev);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

[Severity: High]
Should a legitimate -EAGAIN from pm_runtime_put_sync() abort the system res=
ume?
According to PM subsystem rules, pm_runtime_put_sync() can return -EAGAIN if
another thread holds a usage reference. Returning this expected error code =
from
a system resume callback will unexpectedly abort the entire system resume
process for the device.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605082242.1541=
-1-dongxuyang@eswincomputing.com?part=3D2
