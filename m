Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B358239184E
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716089; cv=none; b=IsWg6JdAP+pnPdrIfABWwYR7XsI9Yi2QEbh8GCJnVDX70klMwBGxqh22jBdcXESGttWUFVzHcaKHGXeUnJ0Kdqk2A+DyDPH76uU9DVms+djEx7bqoXKUpW0kqstUlQwBhdDqiKGTofbc626k8WR6UthWvPdQz1djWpwhNHCIspA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716089; c=relaxed/simple;
	bh=oDDoObjXLCvudHLREnkod0valqBCa0FhSe7IdSCGa/A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sbRmOLFLI1/zjmbh6rQUwAmqXkmwz2HOo5yjy26KFeosblkhnIWGQVy5MFevBjoS5xAmHUoPe6EFsGrpBMPHMqkyD0YVGYYt58/IPRGlI04FDogz2kezWwNYucpb66VeuzcrgMyb98kARzOYELUmiQNVUZyjavFN1q20LaH5tNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WrQ7UFoP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WrQ7UFoP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5AC1F000E9;
	Mon, 29 Jun 2026 06:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782716088;
	bh=K9AUK/p7MP0QpuUmVVEx6ClKibcffjnGVKGk42hpr3g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WrQ7UFoPcwXOZAYmmhdHqa34JDiIIfxvRDctNLaKhGmhoGLpQNouphP/orkDr14CI
	 t+eDjQdIpHkeZkAaoRHZGvOyzbE9K+K0uHTEiSXAVYwjAcy8NWJPsYd/cBvryh3QkE
	 mvIRkBYlq+DHe9Jb1+1p2PCMl45paQ8QAQBPXDp0tMIacCOOoXuxR9ePa5tAC+wZva
	 9pNbuSZsd334SbtwEbXwIT0f2ir1ps2DwZ9L8Ve5NiERkSe1shS5b3VeXAwCteG0op
	 2vZsUQ2FpaOX9YeQl8y6A8jyVziofmbg8YDsiJ0pOzKox2RQAmPNWkco7P1oKL1fx+
	 mNRpKr9Pz4r5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 3/3] pwm: Add OpenCores PTC PWM driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hal Feng" <hal.feng@starfivetech.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260629063601.63917-4-hal.feng@starfivetech.com>
References: <20260629063601.63917-1-hal.feng@starfivetech.com>
 <20260629063601.63917-4-hal.feng@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 06:54:47 +0000
Message-Id: <20260629065448.0D5AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Disabling the PWM in the `.free` callback causes state desynchroni=
zation, leading to an unclocked register access and system crash or unbalan=
ced PM references on subsequent usage.
- [High] The driver's reported inversed polarity contradicts its disabled s=
tate behavior, turning the output ON when consumers try to disable it.
- [High] The driver rejects valid 0% duty cycle requests with `-EINVAL`.
- [High] Incorrect teardown ordering in `ocores_pwm_pm_disable` asserts the=
 reset line while the IP clock is disabled.
--

commit fbbb508bc7b51076bfb0020eecff0171850a1774
Author: Hal Feng <hal.feng@starfivetech.com>
Subject: pwm: Add OpenCores PTC PWM driver

This patch adds a PWM driver for the OpenCores PTC IP core. It supports
basic PWM functionality and is intended for StarFive SoCs.

> diff --git a/drivers/pwm/pwm-ocores.c b/drivers/pwm/pwm-ocores.c
> new file mode 100644
> index 0000000000000..e01494a336335
> --- /dev/null
> +++ b/drivers/pwm/pwm-ocores.c
[ ... ]
> +static int ocores_pwm_apply(struct pwm_chip *chip,
> +			    struct pwm_device *pwm,
> +			    const struct pwm_state *state)
> +{
> +	struct ocores_pwm_device *ddata =3D pwmchip_get_drvdata(chip);
> +	bool was_enabled =3D pwm_is_enabled(pwm);
> +	u64 period_data, duty_data;
> +	int ret;
> +
> +	if (state->polarity !=3D PWM_POLARITY_INVERSED)
> +		return -EINVAL;
> +
> +	if (!state->enabled) {
> +		if (was_enabled) {
> +			writel(0, ddata->base + OCPWM_CTRL);

[Severity: High]
Does this drive the output to the active state when the PWM is disabled?

ocores_pwm_get_state() hardcodes the polarity to PWM_POLARITY_INVERSED. Und=
er
inverted polarity, the active state is LOW and the inactive state is HIGH. =
The
PWM framework requires that when a PWM is disabled, it must emit its inacti=
ve
state.

However, writing 0 to OCPWM_CTRL immediately sets the output to LOW (the
active state). This means disabling the PWM results in a 100% duty cycle
instead of 0%.

> +			pm_runtime_put(pwmchip_parent(chip));
> +		}
> +		return 0;
> +	}
> +
> +	period_data =3D mul_u64_u32_div(state->period, ddata->clk_rate, NSEC_PE=
R_SEC);
> +	if (period_data > U32_MAX)
> +		period_data =3D U32_MAX;
> +
> +	duty_data =3D mul_u64_u32_div(state->duty_cycle, ddata->clk_rate, NSEC_=
PER_SEC);
> +	if (duty_data > U32_MAX)
> +		duty_data =3D U32_MAX;
> +
> +	if (!period_data || !duty_data)
> +		return -EINVAL;

[Severity: High]
Does this code reject a valid 0% duty cycle request?

A 0% duty cycle is a fully valid configuration in the PWM subsystem, often =
used
by consumers like pwm-backlight to dim the output to zero without fully
disabling the PWM. Returning -EINVAL when duty_data evaluates to 0 breaks
these consumers.

> +
> +	if (!was_enabled) {
> +		ret =3D pm_runtime_resume_and_get(pwmchip_parent(chip));
> +		if (ret < 0)
> +			return ret;
> +	}

[Severity: High]
Can this logic write to hardware registers while the clock is disabled?

If a consumer frees the PWM, ocores_pwm_free() disables the hardware and
drops the PM runtime reference. However, the PWM framework does not update
the cached pwm->state.enabled when a PWM is freed.

If the PWM is subsequently requested again and ocores_pwm_apply() is called,
was_enabled (which comes from pwm_is_enabled(pwm)) will still evaluate to
true. If the new consumer sets state->enabled to true, it will skip
pm_runtime_resume_and_get() and proceed to write directly to the PWM
registers with the IP clock disabled, resulting in a synchronous external
abort or crash. Alternatively, if the new consumer sets enabled to false,
it will call pm_runtime_put(), leading to a usecount underflow.

> +
> +	writel(0, ddata->base + OCPWM_CTRL);
> +	writel(OCPWM_CTRL_RST, ddata->base + OCPWM_CTRL);
> +
[ ... ]
> +static void ocores_pwm_pm_disable(void *data)
> +{
> +	struct device *dev =3D data;
> +	struct ocores_pwm_device *ddata =3D dev_get_drvdata(dev);
> +
> +	pm_runtime_disable(dev);
> +
> +	if (!pm_runtime_status_suspended(dev)) {
> +		/* Balance probe's pm_runtime_get_noresume() for bootloader-enabled PW=
M. */
> +		if (readl(ddata->base + OCPWM_CTRL) & OCPWM_CTRL_EN)
> +			pm_runtime_put_noidle(dev);
> +
> +		ocores_pwm_runtime_suspend(dev);
> +	}
> +
> +	reset_control_assert(ddata->rst);

[Severity: High]
Does this ordering assert the reset signal while the IP clock is disabled?

The code calls ocores_pwm_runtime_suspend() (which disables the clock) befo=
re
calling reset_control_assert(). Asserting a reset line while the correspond=
ing
IP clock is disabled can cause bus hangs on APB buses or fail to propagate =
the
reset correctly into the hardware block.

The error path in ocores_pwm_probe() demonstrates the correct teardown
ordering by asserting the reset before suspending the runtime PM.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629063601.6391=
7-1-hal.feng@starfivetech.com?part=3D3
