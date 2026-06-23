Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9854344DB1
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782199689; cv=none; b=eKiULEztCF+KmXe6LaJOtsStezMWulSuQREYfBBxxWplO0NII+3iL8UVTPzZLltL/Zg+UBh7kU0pozKjaym2P3QN+XFvhbRj3BIiC8ejX6ziMGCXENzu3OpLWCseKw5z+CIpqpt6P2YAK57CO+at8tXUJ5ugUg/hLqZ6HqYspj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782199689; c=relaxed/simple;
	bh=TNqA2DQU7S8XnMLXQHXt6iXo7oM+/VtXC273d/vppzM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jOIGJg9osS4NXwEGsVASSJHdJZLX46a7a9rFslK8Arbn7DsUqVzUbv49BVH4Ah7fxYWxjS2Rn9MMfJENpoEX2z7mY5m6hDn8/151tIy7kHvHN7rluWexW4E2XH7cadxql6YPdixVG1k4eK+DGWsVHBcQ954VaxRFk2Tc0lvdOZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+Nixpnm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+Nixpnm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B551F000E9;
	Tue, 23 Jun 2026 07:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782199687;
	bh=mx4+6thBjdEP3O4l4yY8WrqmD3cf154kPTcBj5KLMTI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j+Nixpnm1j/v6KmfVI0dWCgUZh4sNEAULvOuy1t2J2syGxNb6zvgIbSVvXqpTtQAh
	 xBzs2lOjW/cOp4vxU3ZR9nKX5JgOnDkgVZrdWA+efcQ1kbkWI57z/rycdAABtwwHkY
	 cpDqg+O2Wkzey5zniUQ6WloYnBjjf1w7n6Ze+pGnkNTfhHFxD3Tkrb5ysXyZNfoXPp
	 mstppatoiUQ/C9s3rjUA9Y0edCYJurHxLYSFOmso8k0juk3CFqA3kexVi4FSj1A0FR
	 6ajPT+/vl5gmI1/Y48ohoeN0+ZGa9WC1syzCG0m/PJrJlJ7s/c6Wjgeq1P2ibviSdt
	 udHsWDYKEc6ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/3] pwm: dwc: add of/platform support
Reply-To: sashiko-reviews@lists.linux.dev
To: dongxuyang@eswincomputing.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260623071516.2251-1-dongxuyang@eswincomputing.com>
References: <20260623071329.2034-1-dongxuyang@eswincomputing.com>
 <20260623071516.2251-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 07:28:06 +0000
Message-Id: <20260623072807.16B551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Incorrect PWM polarity mapping and violation of the atomic PWM API=
 by using pwm->args instead of state for 0N100PWM-capable hardware.
- [High] System suspend unconditionally fails if any PWM channel is enabled=
, breaking system-wide sleep transitions.
- [High] PM runtime usage counter leak in dwc_pwm_resume when system resume=
 fails.
- [High] The function dwc_pwm_get_state() divides by the clock rate without=
 verifying if it is zero, leading to a kernel panic.
- [High] The driver ignores the return value of pm_runtime_get_sync() in dw=
c_pwm_plat_remove(), leading to potential bus faults.
- [Medium] The error handling path in dwc_pwm_plat_probe() double-disables =
the device clocks if no PWM channels are initially enabled.

Pre-existing issues:
- [High] Unchecked pm_runtime_get_sync failure and leaked reference in dwc_=
pwm_apply.
--

commit 061974fbba26ee19760c596a4145184402b90275
Author: Xuyang Dong <dongxuyang@eswincomputing.com>

pwm: dwc: add of/platform support

The dwc pwm controller can be used in non-PCI systems, so allow
either platform or OF based probing.

The controller is reset only when no PWM channel is enabled.
Otherwise, clocks are enabled and the runtime PM state is updated
to reflect the active hardware configuration.

> diff --git a/drivers/pwm/pwm-dwc-core.c b/drivers/pwm/pwm-dwc-core.c
> index 6dabec93a3c64..b9a9d6ae0b45b 100644
> --- a/drivers/pwm/pwm-dwc-core.c
> +++ b/drivers/pwm/pwm-dwc-core.c
> @@ -44,21 +46,55 @@ static int __dwc_pwm_configure_timer(struct dwc_pwm *=
dwc,

[ ... ]

> +	if (dwc->features & DWC_TIM_CTRL_0N100PWM_EN) {
> +		/*
> +		 * Calculate width of low and high period in terms of input
> +		 * clock periods and check are the result within HW limits
> +		 * between 0 and 2^32 periods.
> +		 * Use mul_u64_u64_div_u64() to avoid overflowing the 64-bit
> +		 * intermediate result and to round down to the nearest
> +		 * achievable hardware value, as required by the PWM core.
> +		 */
> +		tmp =3D mul_u64_u64_div_u64(state->duty_cycle, dwc->clk_rate,
> +					  NSEC_PER_SEC);
> +		if (tmp >=3D (1ULL << 32))
> +			return -ERANGE;
> +
> +		if (pwm->args.polarity =3D=3D PWM_POLARITY_INVERSED)
> +			high =3D tmp;
> +		else
> +			low =3D tmp;

[Severity: High]
Is it correct to evaluate the static default pwm->args.polarity here
instead of state->polarity?

If the args polarity is INVERSED, this logic maps the duty_cycle to the
HIGH period. This causes the signal to be active-high, directly violating
the requested INVERSED state from the PWM core.

[ ... ]

> @@ -121,10 +161,19 @@ static int dwc_pwm_get_state(struct pwm_chip *chip,=
 struct pwm_device *pwm,
>  			     struct pwm_state *state)
>  {
>  	struct dwc_pwm *dwc =3D to_dwc_pwm(chip);
> +	unsigned long clk_rate;
>  	u64 duty, period;
>  	u32 ctrl, ld, ld2;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(pwmchip_parent(chip));
> +	if (ret)
> +		return ret;

[Severity: High]
This is a pre-existing issue, but while looking at the runtime PM handling
here, I noticed that dwc_pwm_apply() (not modified by this patch) calls
pm_runtime_get_sync(pwmchip_parent(chip)) without checking its return value.

If resuming the parent device fails, dwc_pwm_apply() proceeds to call
__dwc_pwm_configure_timer(), which attempts to access hardware registers
while clocks might be disabled, potentially leading to a synchronous extern=
al
abort. It also permanently leaks the PM usage reference on failure. Should
dwc_pwm_apply() also be updated to check for failure?

> -	pm_runtime_get_sync(pwmchip_parent(chip));
> +	if (dwc->clk)
> +		dwc->clk_rate =3D clk_get_rate(dwc->clk);
> +
> +	clk_rate =3D dwc->clk_rate;

[ ... ]

>  	if (ctrl & DWC_TIM_CTRL_PWM) {
> -		duty =3D (ld + 1) * dwc->clk_ns;
> -		period =3D (ld2 + 1)  * dwc->clk_ns;
> -		period +=3D duty;
> +		if (dwc->features & DWC_TIM_CTRL_0N100PWM_EN) {
> +			if (pwm->args.polarity =3D=3D PWM_POLARITY_INVERSED)
> +				duty =3D ld2;

[Severity: High]
Similar to the issue above in __dwc_pwm_configure_timer(), should this
check state->polarity instead of pwm->args.polarity to correctly report
the active duty cycle?

> +			else
> +				duty =3D ld;
> +			period =3D (u64)ld + ld2;
> +		} else {
> +			duty =3D ld + 1;
> +			period =3D ld2 + 1;
> +			period +=3D duty;
> +		}
>  	} else {
> -		duty =3D (ld + 1) * dwc->clk_ns;
> +		duty =3D ld + 1;
>  		period =3D duty * 2;
>  	}
> =20
>  	state->polarity =3D PWM_POLARITY_INVERSED;
> -	state->period =3D period;
> -	state->duty_cycle =3D duty;
> +	state->period =3D mul_u64_u64_div_u64(period, NSEC_PER_SEC, clk_rate);
> +	state->duty_cycle =3D mul_u64_u64_div_u64(duty, NSEC_PER_SEC, clk_rate);

[Severity: High]
Could clk_rate be zero here if the device tree provides an uninitialized or
dummy clock?

dwc->clk_rate is initialized using clk_get_rate() during probe without
verifying if it is non-zero. If it is 0, these divisions will cause a kernel
panic when the PWM core calls get_state() during pwmchip_add().

> diff --git a/drivers/pwm/pwm-dwc-of.c b/drivers/pwm/pwm-dwc-of.c
> new file mode 100644
> index 0000000000000..34713cb7299e6
> --- /dev/null
> +++ b/drivers/pwm/pwm-dwc-of.c

[ ... ]

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
> +
> +	ret =3D pwmchip_add(chip);
> +	if (ret) {
> +		dev_err(dev, "failed to add pwm chip\n");
> +		goto pm_disable;
> +	}
> +
> +	return 0;
> +
> +pm_disable:
> +	pm_runtime_disable(dev);
> +	if (pwm_en) {
> +		for (i =3D 0; i < chip->npwm; i++) {
> +			if (ctrl[i])
> +				pm_runtime_put_noidle(dev);
> +		}
> +	}
> +disable_clk:
> +	clk_disable_unprepare(dwc->clk);
> +disable_busclk:
> +	clk_disable_unprepare(dwc->bus_clk);

[Severity: Medium]
If pwmchip_add() fails when pwm_en is false, will this error path
double-disable the clocks?

During probe, if no PWM channels are enabled, dwc->clk and dwc->bus_clk
are explicitly disabled in the else branch above. If pwmchip_add() then
fails, the execution jumps to pm_disable and falls through to disable_clk
and disable_busclk, executing clk_disable_unprepare() on both clocks a
second time. This causes a clock reference count underflow.

[ ... ]

> +static void dwc_pwm_plat_remove(struct platform_device *pdev)
> +{
> +	struct dwc_pwm_drvdata *data =3D platform_get_drvdata(pdev);
> +	struct pwm_chip *chip =3D data->chips[0];
> +	struct dwc_pwm *dwc =3D to_dwc_pwm(chip);
> +	unsigned int idx;
> +	int ret;
> +
> +	pm_runtime_get_sync(&pdev->dev);

[Severity: High]
Does pm_runtime_get_sync() need its return value checked here?

If the PM framework fails to resume the device during removal (e.g., due to=
 a
power domain failure), the device's clocks or power will remain off.

> +	pwmchip_remove(chip);
> +
> +	for (idx =3D 0; idx < chip->npwm; idx++) {
> +		if (dwc_pwm_readl(dwc, DWC_TIM_CTRL(idx)) & DWC_TIM_CTRL_EN)

[Severity: High]
This isn't a bug introduced in this exact line, but as a continuation of the
previous concern: if pm_runtime_get_sync() failed, this dwc_pwm_readl()
will access unclocked memory-mapped I/O, which triggers a bus fault.

[ ... ]

> +static int dwc_pwm_suspend(struct device *dev)
> +{
> +	struct dwc_pwm_drvdata *data =3D dev_get_drvdata(dev);
> +	struct pwm_chip *chip =3D data->chips[0];
> +	struct dwc_pwm *dwc =3D to_dwc_pwm(chip);
> +	unsigned int idx;
> +	int ret;
> +
> +	if (pm_runtime_status_suspended(dev)) {
> +		ret =3D dwc_pwm_runtime_resume(dev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	for (idx =3D 0; idx < chip->npwm; idx++) {
> +		if (chip->pwms[idx].state.enabled)
> +			return -EBUSY;

[Severity: High]
Does returning -EBUSY when a PWM channel is enabled unintentionally break
system-wide sleep transitions?

If a userspace sysfs client or a consumer device leaves a PWM running, this
aborts the entire system suspend sequence.

[ ... ]

> +static int dwc_pwm_resume(struct device *dev)
> +{
> +	struct dwc_pwm_drvdata *data =3D dev_get_drvdata(dev);
> +	struct pwm_chip *chip =3D data->chips[0];
> +	struct dwc_pwm *dwc =3D to_dwc_pwm(chip);
> +	unsigned int idx;
> +	bool pm_flags;
> +	int ret;
> +
> +	/* Check if device was runtime suspended before system resume */
> +	pm_flags =3D pm_runtime_status_suspended(dev);
> +	if (pm_flags) {
> +		/*
> +		 * Use PM framework to resume device
> +		 * (calls dwc_pwm_runtime_resume)
> +		 */
> +		ret =3D pm_runtime_get_sync(dev);
> +		if (ret < 0)
> +			return ret;

[Severity: High]
Can this leak the PM usage counter on failure?

pm_runtime_get_sync() increments the PM usage counter even if it returns an
error. If this call fails, propagating the error early leaves the device's
usage counter incremented, preventing it from ever entering runtime suspend
again. Should pm_runtime_put_noidle() be called before returning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623071329.2034=
-1-dongxuyang@eswincomputing.com?part=3D3
