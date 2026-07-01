Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFCF18C02E
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 00:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782867377; cv=none; b=BYLlKt51LsWGg4xGNKpOFiz9RLqw0twK9eVWSGt7V8VbVpuE7l1s39I1IyqgQ3walhcHoHaNPqldIhK5PJLdARsKCWksmbw+1mP09Xok/ZLuR7J1x0RE8faITpBmM4i3RuQbDZS2q/Cx0Bz2zJ0W1wu8YBK/qJfZlgMzlhL/S5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782867377; c=relaxed/simple;
	bh=EnddDlqu6Ygn6I/PxhncETcxAO4SYuCZ70lGaX0VVps=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g9cyaO9tjzuqrwRlfNsk98mdrFsXyWt4YV1KdbCWrsVieAgRzGuwsJQwl8x4zWTkP5R2RvpGwRK3yISkKqjpHdA533HEdBGPCSqxhJMNC3w3siJPzq2Vrx91HxWuLyOi5fWM56SiOda3/xwPvysrSbrVSQoWQDivSDiVFH16GQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JIelweuf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JIelweuf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662951F000E9;
	Wed,  1 Jul 2026 00:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782867375;
	bh=XqosKA9YVAlok8pGfMGE23uct/bkrZ80NV/xUnx9H9A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JIelweufdJFVQ8lWcYzwjsK9TTyuP9VppQhIBQ9kMrVEN8rawtqDgk+U25KoYNoPz
	 YGM85YSVoucTwmH7GBM+vQRBtzirA8kzQ3vDXFRIgEzL9OFcpI1ffnlnv0YP8K/PyC
	 7tjsygWAikvNS/aikw8rTKr+VZFEiUsWi9MlHrKK+tiiLuw5rVmHbGTeBAgUQB5hIV
	 rv2ayyXZ2y7v0/3zvx6oszdOfg2237pbudg+mTTahNmfPJDrvfq74+G6ogxlez2cpu
	 5ySta2rt387Lndn5qY7O43oMCUHwy9NJfP5V5BVQRXXQ+ZO4vsyU4gPV1adn3Og7zE
	 P+GcsNK8B69qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/3] pwm: dwc: add of/platform support
Reply-To: sashiko-reviews@lists.linux.dev
To: dongxuyang@eswincomputing.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260701004334.515-1-dongxuyang@eswincomputing.com>
References: <20260701004139.347-1-dongxuyang@eswincomputing.com>
 <20260701004334.515-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 00:56:12 +0000
Message-Id: <20260701005613.662951F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing CONFIG_PM dependency leads to unclocked MMIO accesses and =
kernel panics.
- [High] Bypassing the PM framework during system suspend causes bus faults=
 on devices attached to a PM domain.
- [High] Reading MMIO registers while the device is in reset causes a bus s=
tall and kernel panic.
- [Medium] Data race on the shared `dwc->clk_rate` variable.
--

commit f417f1c0148d8abb6dc7081bbc13d8a85dcc173e
Author: Xuyang Dong <dongxuyang@eswincomputing.com>

pwm: dwc: add of/platform support

This patch adds platform and OF device tree support for the DesignWare PWM
controller. It introduces runtime PM support, manages clock enabling and
disabling based on PWM channel usage, and implements polarity control by
swapping load count registers.

> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -249,6 +249,16 @@ config PWM_DWC
[ ... ]
> +config PWM_DWC_OF
> +	tristate "DesignWare PWM Controller (OF bus)"
> +	depends on HAS_IOMEM && (OF || COMPILE_TEST)

[Severity: High]
Should this include a dependency on PM?

If the kernel is compiled without CONFIG_PM, Kconfig allows building
PWM_DWC_OF. During probe(), if no PWMs are enabled, the driver explicitly
disables dwc->clk and dwc->bus_clk and relies on PM runtime to re-enable
them. Because CONFIG_PM is disabled, pm_runtime_resume_and_get() evaluates =
to
a stub that returns 1 (success) without calling the runtime resume callback.
This leads to unclocked register accesses and kernel panics.

> diff --git a/drivers/pwm/pwm-dwc-core.c b/drivers/pwm/pwm-dwc-core.c
> --- a/drivers/pwm/pwm-dwc-core.c
> +++ b/drivers/pwm/pwm-dwc-core.c
> @@ -44,21 +46,73 @@ static int __dwc_pwm_configure_timer(struct dwc_pwm *=
dwc,
[ ... ]
> -	high =3D tmp - 1;
> +	if (dwc->clk)
> +		dwc->clk_rate =3D clk_get_rate(dwc->clk);

[Severity: Medium]
Can this write to dwc->clk_rate cause a data race?

The PWM framework serializes operations on a per-channel basis, but not
across the entire controller. If multiple threads concurrently request state
changes (apply) or state reads (get_state) on different PWM channels of the
same controller, they might simultaneously write to this shared variable.

> @@ -121,10 +183,23 @@ static int dwc_pwm_get_state(struct pwm_chip *chip,=
 struct pwm_device *pwm,
[ ... ]
> +	if (dwc->clk)
> +		dwc->clk_rate =3D clk_get_rate(dwc->clk);

[Severity: Medium]
Does this introduce a similar data race on dwc->clk_rate as the one mention=
ed
above in __dwc_pwm_configure_timer()?

> diff --git a/drivers/pwm/pwm-dwc-of.c b/drivers/pwm/pwm-dwc-of.c
> --- /dev/null
> +++ b/drivers/pwm/pwm-dwc-of.c
> @@ -0,0 +1,356 @@
[ ... ]
> +static int dwc_pwm_plat_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D clk_prepare_enable(dwc->clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable timer clock\n");
> +		goto disable_busclk;
> +	}
> +
> +	/*
> +	 * Check all channels to see if any channel is enabled.
> +	 * Read the control register of each channel and extract the enable bit
> +	 */
> +	for (i =3D 0; i < chip->npwm; i++) {
> +		ctrl[i] =3D dwc_pwm_readl(dwc, DWC_TIM_CTRL(i)) & DWC_TIM_CTRL_EN;
> +		if (ctrl[i])
> +			pwm_en =3D true;
> +	}
> +
> +	/*
> +	 * Only issue a reset pulse when all channels are disabled, so a PWM
> +	 * channel already running (e.g. configured by firmware before Linux
> +	 * took over) is left undisturbed.
> +	 */
> +	if (!pwm_en) {
> +		ret =3D reset_control_reset(dwc->rst);

[Severity: High]
Could this read from DWC_TIM_CTRL(i) cause a bus stall and kernel panic if =
the
device is currently in reset?

Module removal explicitly asserts the reset line in dwc_pwm_plat_remove(),
leaving the device in reset. On a subsequent probe (e.g., reloading the
module), this loop attempts to read from the MMIO space before the reset is
deasserted.

[ ... ]
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

[Severity: High]
If CONFIG_PM is disabled in the kernel, does gating these clocks here cause
subsequent unclocked register accesses?

Since pm_runtime_resume_and_get() becomes a stub that returns 1 without
re-enabling clocks, subsequent operations like apply() or get_state() would
perform unclocked MMIO accesses leading to panics.

[ ... ]
> +static void dwc_pwm_plat_remove(struct platform_device *pdev)
> +{
[ ... ]
> +	if (!pm_runtime_status_suspended(&pdev->dev)) {
> +		clk_disable_unprepare(dwc->clk);
> +		clk_disable_unprepare(dwc->bus_clk);
> +	}

[Severity: High]
If CONFIG_PM is disabled, pm_runtime_status_suspended() will always return
false. Does this cause a double-disable of the clocks if they were already
gated in probe?

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
> +		dwc->ctx[idx].cnt =3D dwc_pwm_readl(dwc, DWC_TIM_LD_CNT(idx));

[Severity: High]
Does calling the local dwc_pwm_runtime_resume() directly bypass the PM
framework?

If the device is attached to a generic power domain (genpd) and is
runtime-suspended, the PM domain itself might be powered off. Bypassing
pm_runtime_resume_and_get() means the PM domain is never powered back on,
and the subsequent dwc_pwm_readl() calls will access unpowered hardware
causing a bus fault.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701004139.347-=
1-dongxuyang@eswincomputing.com?part=3D3
