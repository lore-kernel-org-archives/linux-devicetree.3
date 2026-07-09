Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4704C3ED3C3
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585658; cv=none; b=rrdzr+vKXwHWMPrV0Gck68h1r7EpXrfUHW+CzjEgD5zjMxg3jGJs7bbWYX8cpf+p+9GegYvjojohkCU7gcO5UsDqsNMEApYYDjSUr6iqbOs6Q16tgIP04GNWZ21pYKyAbdh5EqZPq4QxSHuPskIedYvDy6kCvUWDNj3ftIP4hWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585658; c=relaxed/simple;
	bh=rdUphOns8pzZ6V6lopSJXVDknYSyvOgVXj5GhvuTi5g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fD7izgWwOOGyzqQ8LIdzyJ2q0rC81VMYOXN2sQOVMrgwarc9UM1gADvoOxrvQEUF3LJcJk2CjlcBXJOUVEo/EqaP6LGqzJsFeEazRuK7PTD/rdp9lcz8R20G+i5mRAGLZnSitZ82mzjlFrD5B7SgzuQBvnw7XhWbZMAAEq2Fr4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVK0xTtE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVK0xTtE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94CEE1F000E9;
	Thu,  9 Jul 2026 08:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783585656;
	bh=rfR398/8LE/NlxrKs/16owN/yquT6t+qqoScpSVscGM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TVK0xTtEJ/QyP/lFgLnSAl+EyBGlFo1lNuIsa3g5tI6gwoq1qqJBAeMYA0KKa+5fU
	 5APa00XdiLQF2JIlF20S7Ur60GP5GoNXoxXJEMDJqbNl0dR6I6K0n6M0Dg8f3M7uoe
	 9A8GmtlYZZ6sqErubSDCSEicIr2Rt98HhXBRRkqELCd1KeUwxkGaxftjSO2IcjJ6m+
	 CWEPlXAyL0+SWPDucrXSePSJB87tD+n3OC8sK7RlRbuTw5YJRtDC78VrpK+g5Dm9pC
	 JR9LGlAS9A7s1AIbeMsfq9QJf1frVC1PrCRwu7j0ZycUEHv+IYCmrDC1/JtErZybbi
	 DeySwNhK5DyMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/3] pwm: dwc: add of/platform support
Reply-To: sashiko-reviews@lists.linux.dev
To: dongxuyang@eswincomputing.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709081502.2227-1-dongxuyang@eswincomputing.com>
References: <20260709081337.2022-1-dongxuyang@eswincomputing.com>
 <20260709081502.2227-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 08:27:36 +0000
Message-Id: <20260709082736.94CEE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Uninitialized hardware state restoration on first runtime PM resum=
e overwrites bootloader configuration.
- [Medium] Artificial hardware limitation halves the maximum supported PWM =
period in 0N100PWM mode.
- [Medium] State readback mismatch due to checking a static capability flag=
 instead of the active hardware control register.
--

--- Patch [3]: [PATCH v11 3/3] pwm: dwc: add of/platform support ---
commit 4abdad6b7c62c018fdea8856de6e8750e046163d
Author: Xuyang Dong <dongxuyang@eswincomputing.com>

pwm: dwc: add of/platform support

The dwc pwm controller can be used in non-PCI systems, so allow
either platform or OF based probing.

> diff --git a/drivers/pwm/pwm-dwc-core.c b/drivers/pwm/pwm-dwc-core.c
> index 6dabec93a3c64..677f33e3e7450 100644
> --- a/drivers/pwm/pwm-dwc-core.c
> +++ b/drivers/pwm/pwm-dwc-core.c

[ ... ]

> @@ -39,26 +41,76 @@ static int __dwc_pwm_configure_timer(struct dwc_pwm *=
dwc,
>  				     struct pwm_device *pwm,
>  				     const struct pwm_state *state)
>  {

[ ... ]

> +	if (dwc->features & DWC_TIM_CTRL_0N100PWM_EN) {
> +		/*
> +		 * Calculate the total period in clock cycles first, then the
> +		 * duty cycle. Derive the complementary half as the remainder to
> +		 * avoid compounding two independent floor-truncation errors:
> +		 * floor(duty) + floor(period - duty) can be one cycle short of
> +		 * floor(period). The PWM core requires the maximal achievable
> +		 * period not exceeding the requested value.
> +		 */
> +		period_cyc =3D mul_u64_u64_div_u64(state->period, dwc->clk_rate,
> +						 NSEC_PER_SEC);
> +		if (!period_cyc || period_cyc >=3D (1ULL << 32))
> +			return -ERANGE;

[Severity: Medium]
Does this artificial boundary correctly reflect the hardware capabilities?

It appears the hardware supports up to roughly 33 bits for the total period
since the low and high counts have independent 32-bit registers, meaning a
total period up to 0x1FFFFFFFE cycles could be valid.

By restricting period_cyc to < 2^32 here, does this arbitrarily halve the
maximum supported PWM period when 0N100PWM mode is used?

> +
> +		tmp =3D mul_u64_u64_div_u64(state->duty_cycle, dwc->clk_rate,
> +					  NSEC_PER_SEC);

[ ... ]

> @@ -121,10 +186,23 @@ static int dwc_pwm_get_state(struct pwm_chip *chip,=
 struct pwm_device *pwm,
>  			     struct pwm_state *state)
>  {

[ ... ]

>  	if (ctrl & DWC_TIM_CTRL_PWM) {
> -		duty =3D (ld + 1) * dwc->clk_ns;
> -		period =3D (ld2 + 1)  * dwc->clk_ns;
> -		period +=3D duty;
> +		if (dwc->features & DWC_TIM_CTRL_0N100PWM_EN) {

[Severity: Medium]
Should this check evaluate the active hardware control register instead of =
the
static capability flag?

If a bootloader enabled the PWM using the older legacy formula on a newer
controller, this will evaluate the static capability (dwc->features) rather
than whether DWC_TIM_CTRL_0N100PWM_EN is actually set in the ctrl register.

Could this lead to off-by-1 or off-by-2 cycle errors in the readback state =
if
the hardware is currently running with the legacy configuration?

> +			/*
> +			 * NORMAL: duty_cycle was written to DWC_TIM_LD_CNT2.
> +			 * INVERSED: duty_cycle was written to DWC_TIM_LD_CNT.
> +			 */

[ ... ]

> diff --git a/drivers/pwm/pwm-dwc-of.c b/drivers/pwm/pwm-dwc-of.c
> new file mode 100644
> index 0000000000000..f25551d41208e
> --- /dev/null
> +++ b/drivers/pwm/pwm-dwc-of.c

[ ... ]

> +static int dwc_pwm_plat_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	/*
> +	 * If any PWM channel is enabled, mark device active and hold runtime PM
> +	 * references for each enabled channel. Otherwise, gate the clocks.
> +	 *
> +	 * When CONFIG_PM is disabled, pm_runtime callbacks are stubs that never
> +	 * re-enable clocks, so keep clocks on unconditionally in that case.
> +	 */
> +	if (pwm_en) {
> +		pm_runtime_set_active(dev);
> +		for (i =3D 0; i < chip->npwm; i++) {
> +			if (ctrl[i])
> +				pm_runtime_get_noresume(dev);
> +		}
> +	} else if (IS_ENABLED(CONFIG_PM)) {
> +		clk_disable_unprepare(dwc->clk);
> +		clk_disable_unprepare(dwc->bus_clk);
> +	}
> +
> +	pm_runtime_enable(dev);

[ ... ]

> +static int dwc_pwm_runtime_resume(struct device *dev)
> +{
> +	struct dwc_pwm_drvdata *data =3D dev_get_drvdata(dev);
> +	struct pwm_chip *chip =3D data->chips[0];
> +	struct dwc_pwm *dwc =3D to_dwc_pwm(chip);
> +	unsigned int idx;
> +	int ret;

[ ... ]

> +	for (idx =3D 0; idx < chip->npwm; idx++) {
> +		dwc_pwm_writel(dwc, dwc->ctx[idx].cnt, DWC_TIM_LD_CNT(idx));
> +		dwc_pwm_writel(dwc, dwc->ctx[idx].cnt2, DWC_TIM_LD_CNT2(idx));
> +		dwc_pwm_writel(dwc, dwc->ctx[idx].ctrl, DWC_TIM_CTRL(idx));
> +	}

[Severity: High]
Can this sequence overwrite the hardware registers with uninitialized zeroes
on the first runtime PM resume?

If the driver is probed when no PWM channels are currently enabled, the dev=
ice
is left in RPM_SUSPENDED with clocks gated, and the initial hardware state =
is
never saved into dwc->ctx.

Later, when the PWM core calls get_state(), it triggers
dwc_pwm_runtime_resume(), which blindly restores the zero-initialized
dwc->ctx array to the hardware.

Does this inadvertently destroy pre-existing bootloader configurations and
clear the interrupt mask (DWC_TIM_CTRL_INT_MASK), potentially unmasking tim=
er
interrupts on shared IRQ lines and causing an interrupt storm?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709081337.2022=
-1-dongxuyang@eswincomputing.com?part=3D3
