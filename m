Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31F73E0724
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 07:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828569; cv=none; b=EI2hOpiQXp968ZLL8uVKx7gyWUbp1imvDOUGTU9cy/ntOmJE9APZxpjT0n044OFzZMLusvA1hyy7q4nh5PWzlDKUSGRDM6K06w4Rk0DrcjnR7+CfiBqnhS9dyGjnq461tVPwTeJ421WmbYgZhwLLoQwd38k5A8J6V8Q5lFNUZfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828569; c=relaxed/simple;
	bh=pJtA4p1af7PgmD19p97JbUeoF+ipNiAHfH4ZQXWJpv8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qQixVfmZG73MeTrUVgoYGKyXwp7WsMtKA8fnEGLDuk95PZxSHDfVh4+nbJf5uSFbFI5rTKdViLvJ8XWq1I56ehHYnVO0KckUFxjz7vaqrlm1NuGyqad5TQTjTz0OUOXyWwf4dEkuO45VttzOiBuI7Di4Zc/sFSg7EnxLumCawqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q6GiV9Nj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q6GiV9Nj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53869C2BCB0;
	Fri, 15 May 2026 07:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778828568;
	bh=pJtA4p1af7PgmD19p97JbUeoF+ipNiAHfH4ZQXWJpv8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=q6GiV9NjxvTGRhK/RE8VwXNihg6f29hNUq5eVtrCbBDFdTI0XRRdBHtRF9MrV9OWx
	 x+J5qJH0SNgIyXjqdODKJO0rE8TpDmZ6SJDMcGLdfwWHnZDlKRXMlOu2JNeaUcCZq9
	 jLGGLQ4ub2GjXsedVrigMHYgyR+ILNGtSk2gYZjmIOf0LXWO3QR+SDdzjqdTvia4b3
	 51CkM9EBDgJMN47XhQxbwffVZk6HRUVxsSuCWwAA1/T60VBrETQGnIztTONIQjvbt4
	 m/oQ0bh7gHLAjld/MNMjYqceiBlla0GjD6lKhZJbeaWtasfChZzFE8Ti4rcyOQcZHp
	 jDgCShcwxw8HA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 3/3] pwm: Add OpenCores PTC PWM driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hal Feng" <hal.feng@starfivetech.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260515054723.25024-4-hal.feng@starfivetech.com>
References: <20260515054723.25024-4-hal.feng@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 07:02:47 +0000
Message-Id: <20260515070248.53869C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Probe fails unconditionally when CONFIG_PM is disabled.
- [High] Teardown symmetry violation in `ocores_pwm_pm_disable()` leads to =
reset assertion without an active clock.
- [High] Race condition between `pm_runtime_enable()` and `pm_runtime_get_n=
oresume()` allows premature hardware access without a clock.
- [High] Missing context restore on system resume leads to silently broken =
PWM output.
- [High] Runtime PM usage count leak permanently blocks PM suspend if the d=
river is unbound while the PWM is enabled.
- [Medium] Subsystem rule violation: Using asynchronous `pm_runtime_put()` =
before `pm_runtime_disable()` causes race conditions.
- [Medium] Hardware minimum period and duty cycle limitations are not enfor=
ced, allowing invalid configuration.
- [Medium] Unconditional hardware disable in probe() breaks bootloader hand=
over.
- [Low] Masking of true error codes from devm_pwmchip_alloc().
--

commit 2a9909cb21b11044209c8ae47fbb6d140786ac45
Author: Hal Feng <hal.feng@starfivetech.com>
Subject: pwm: Add OpenCores PTC PWM driver

This commit adds a new PWM driver for the OpenCores PTC IP core.

> --- /dev/null
> +++ b/drivers/pwm/pwm-ocores.c
[ ... ]
> +static int ocores_pwm_apply(struct pwm_chip *chip,
> +			    struct pwm_device *pwm,
> +			    const struct pwm_state *state)
> +{
[ ... ]
> +	if (state->enabled) {
> +		if (!pwm_is_enabled(pwm)) {
> +			ret =3D pm_runtime_resume_and_get(pwmchip_parent(chip));
> +			if (ret < 0)
> +				return ret;
> +		}

Does this leak the runtime PM usage count if the driver is unbound while the
PWM is enabled?

If the driver is unbound via sysfs while the PWM is actively running, the P=
WM
core marks the chip non-operational but does not disable the running PWM
hardware. The devres teardown action ocores_pwm_pm_disable() will run and
forcefully turn off the hardware, but it doesn't decrement the elevated PM
usage counter.

Since the struct device object persists across bind/unbind cycles, could th=
is
leaked usage count permanently prevent the device from entering runtime sus=
pend
on subsequent binds?

> +	} else {
> +		if (pwm_is_enabled(pwm)) {
> +			writel(0, ddata->base + OCPWM_CTRL);
> +			pm_runtime_put(pwmchip_parent(chip));
> +		}
> +		return 0;
> +	}
> +
> +	writel(0, ddata->base + OCPWM_CTRL);
> +	writel(OCPWM_CTRL_RST, ddata->base + OCPWM_CTRL);
> +
> +	period_data =3D mul_u64_u32_div(state->period, ddata->clk_rate, NSEC_PE=
R_SEC);

The header comment notes the hardware minimum period and duty cycle is 1 cl=
ock
cycle. If the requested state->period is smaller than one clock cycle, woul=
dn't
mul_u64_u32_div() silently truncate the result to 0?

Writing 0 to the OCPWM_LRC and OCPWM_HRC registers violates this hardware
constraint and might cause undefined IP behavior. Should the driver validate
that period_data >=3D 1 and return -EINVAL if the request cannot be satisfi=
ed?

> +	if (period_data > U32_MAX)
> +		period_data =3D U32_MAX;
[ ... ]
> +static int ocores_pwm_runtime_resume(struct device *dev)
> +{
> +	struct ocores_pwm_device *ddata =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(ddata->clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable clock\n");
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops ocores_pwm_pm_ops =3D {
> +	RUNTIME_PM_OPS(ocores_pwm_runtime_suspend,
> +		       ocores_pwm_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +			    pm_runtime_force_resume)
> +};

Will this silently break PWM output upon resuming from system sleep?

During system suspend, if the device's power domain is powered off, the
hardware register contents are typically lost.

The ocores_pwm_runtime_resume() callback only re-enables the clock; it does=
n't
save and restore the PWM configuration registers. If a PWM was actively
outputting a signal before system suspend, will it fail to output the corre=
ct
signal after the system wakes up?

> +static void ocores_pwm_pm_disable(void *data)
> +{
> +	struct device *dev =3D data;
> +	struct ocores_pwm_device *ddata =3D dev_get_drvdata(dev);
> +
> +	pm_runtime_disable(dev);
> +
> +	if (!pm_runtime_status_suspended(dev))
> +		ocores_pwm_runtime_suspend(dev);
> +
> +	reset_control_assert(ddata->rst);
> +}

Could asserting the reset while the clock is turned off cause issues?

In ocores_pwm_probe(), the hardware initialization order is strictly clock
enable followed by reset deassertion. The explicit probe error path also
respects this by reversing the order, asserting reset before disabling the
clock.

However, ocores_pwm_pm_disable() calls ocores_pwm_runtime_suspend()
(which turns off the clock) before calling reset_control_assert(). If the IP
requires an active clock to propagate the reset signal, asserting the reset
while the clock is turned off might fail or hang the bus.

> +static int ocores_pwm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct ocores_pwm_device *ddata;
> +	struct pwm_chip *chip;
> +	int ret;
> +
> +	chip =3D devm_pwmchip_alloc(dev, 1, sizeof(*ddata));
> +	if (IS_ERR(chip))
> +		return -ENOMEM;

Should this return PTR_ERR(chip) instead of hardcoding -ENOMEM?

devm_pwmchip_alloc() returns an ERR_PTR that can propagate various error co=
des,
and returning -ENOMEM masks the true failure reason.

> +	chip->ops =3D &ocores_pwm_ops;
> +	ddata =3D pwmchip_get_drvdata(chip);
[ ... ]
> +	ret =3D reset_control_deassert(ddata->rst);
> +	if (ret)
> +		goto err_clk_disable;
> +
> +	ret =3D pm_runtime_set_active(dev);
> +	if (ret)
> +		goto err_reset_assert;

Does this fail probe unconditionally when CONFIG_PM is disabled?

When CONFIG_PM is disabled, the dummy implementation of
pm_runtime_set_active() returns 1. The if (ret) check evaluates to true
when ret =3D 1, causing the probe function to jump to the error path.

Should this check if (ret < 0) to distinguish PM framework errors from
successful status returns?

> +	pm_runtime_enable(dev);
> +
> +	ret =3D devm_add_action_or_reset(dev, ocores_pwm_pm_disable, dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add pm disable action\n");
> +
> +	pm_runtime_get_noresume(dev);
> +
> +	writel(0, ddata->base + OCPWM_CTRL);

Are there a couple of issues with this sequence?

First, pm_runtime_enable() is called while the runtime PM usage counter is =
0.
This opens a window where the PM core can asynchronously suspend the device.
The driver then calls pm_runtime_get_noresume(), which increments the usage
counter but does not resume the device if it was already suspended.

If the device was suspended during this window, the subsequent writel()
would access hardware registers while the clock is turned off.
Should pm_runtime_get_noresume() be called before pm_runtime_enable()?

Second, does this unconditional writel(0, ...) break bootloader handover?
If the bootloader previously configured and enabled the PWM, this write will
instantly power it down. Could this cause hardware state disruption until
the consumer driver re-enables it?

> +	pm_runtime_put(dev);
> +
> +	ret =3D devm_pwmchip_add(dev, chip);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Could not register PWM chip\n");

Is it safe to use the asynchronous pm_runtime_put() here?

If devm_pwmchip_add() fails, the devres teardown action ocores_pwm_pm_disab=
le()
runs immediately and invokes pm_runtime_disable(). This forcefully cancels
the pending asynchronous suspend work from pm_runtime_put(), leaving the de=
vice
in an undefined PM state.

The Power Management subsystem guidelines dictate that pm_runtime_put_sync()
must be used instead of pm_runtime_put() when pm_runtime_disable() might fo=
llow
immediately.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515054723.2502=
4-1-hal.feng@starfivetech.com?part=3D3
