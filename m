Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E493563E1
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781786042; cv=none; b=BQ+nhb4yo7ysZdtU66BT7zNZXtLsDjSsM+r/bK+xAJqur75uBJsYjXxTXqqYhdIVICAY0JYiReCJEFVlLi83ucUM2ETvFMwqYIFaHurBpGGVdkEBJ4pje/wHxeEweL0lvI8IDF5Z1OS54hyResig4TUHhDsk6C6VG2JjEfK+F6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781786042; c=relaxed/simple;
	bh=8581XW72DMfTntG5Ndgcy3vymVDmTkzJ851l+ET+xNM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WCPx53A3YYh5xp6S7V+XTFhsqpRlkQc3kwSVIX+WW8aj/ReUUm+9IxGkl/ZJ1s6pK7yUxfICcmg7Xx+E1CJz9LqlwDJ8lmhEWWXIY9+Ip/wviOU1t9ts0fw/bxSbhVM7mXOn8TNm178YPPogfGberDFjrcVuk8WU0PRQmT3VcMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjuPV5P2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjuPV5P2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728F81F000E9;
	Thu, 18 Jun 2026 12:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781786040;
	bh=IDcA9bBtQg+Q9f98o4Vovmm0FaZMESGWUAz5vcZ8fHM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JjuPV5P2w+RqBh00LFYtl64VMdY66KeRfSSkxcMyiAohOBOkjvy+X3NBgC2uroQP+
	 HN3Znz0N4b/tQbGuLhyFGp654k1SzKYa+I+hxQDBHJYszf8Zn1UL2zxU9myayZZsdY
	 4pd1tIn8Mi9VBop342Y6kOQe3lfihjjG8wYw7XnBF4RpN9TvWrMG+ZnIpulLmhgRDs
	 BdDPoIRrNrfMGbeLNi/yijqKpNikfkhLc9IqDLgPK7l1ltH5yul4Dqs+8FKmGYwp7n
	 3/1AbCzwjX/KQLxvaVrgjNw7W8BlOtfdFXYr2jpvMUuWxDaV4v9cgdMrENgVqPJbJZ
	 wulvww/8B9Vqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] pwm: add Axiado AX3000 PWM driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618-axiado-ax3000-pwm-v1-2-c9797a909414@axiado.com>
References: <20260618-axiado-ax3000-pwm-v1-0-c9797a909414@axiado.com>
 <20260618-axiado-ax3000-pwm-v1-2-c9797a909414@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 12:33:59 +0000
Message-Id: <20260618123400.728F81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unclocked MMIO write leading to bus error on driver unbind or prob=
e failure.
- [High] PWM hardware fails to re-enable when transitioning from a 0% duty =
cycle back to a positive duty cycle.
--

commit a497ac78be310d772f657a548c4a134269cc8d5a
Author: Petar Stepanovic <pstepanovic@axiado.com>

pwm: add Axiado AX3000 PWM driver
   =20
The Axiado AX3000 and AX3005 SoCs include PWM controllers that can be
used to generate configurable PWM output signals.
   =20
Add a PWM driver with support for configuring period, duty cycle, and
enable state through the Linux PWM framework.

> diff --git a/drivers/pwm/pwm-axiado.c b/drivers/pwm/pwm-axiado.c
> new file mode 100644
> index 0000000000000..db197886c5c46
> --- /dev/null
> +++ b/drivers/pwm/pwm-axiado.c

[ ... ]

> +static int axiado_pwm_apply(struct pwm_chip *chip, struct pwm_device *pw=
m,
> +			    const struct pwm_state *state)
> +{
> +	struct axiado_pwm_chip *axpwm =3D pwmchip_get_drvdata(chip);
> +	int ret;
> +
> +	if (state->polarity !=3D PWM_POLARITY_NORMAL)
> +		return -EINVAL;
> +
> +	if (!state->enabled || !state->duty_cycle) {
> +		if (pwm->state.enabled)
> +			writel(AX_PWM_CTRL_DISABLE, axpwm->base + AX_PWM_CNTRL_REG);
> +
> +		return 0;
> +	}
> +
> +	ret =3D axiado_pwm_config(chip, pwm, state->duty_cycle, state->period);
> +	if (ret)
> +		return ret;
> +
> +	if (!pwm->state.enabled)
> +		writel(AX_PWM_CTRL_ENABLE, axpwm->base + AX_PWM_CNTRL_REG);

[Severity: High]
Will this logic fail to re-enable the hardware if transitioning from a 0%
duty cycle back to a positive duty cycle?

When the user requests a 0% duty cycle, the hardware is turned off by
writing AX_PWM_CTRL_DISABLE, but the PWM framework maintains
pwm->state.enabled =3D true.

If a positive duty cycle is then requested, the driver relies on checking
!pwm->state.enabled to re-enable the hardware. Since the cached state is
still true from the 0% duty cycle request, the check evaluates to false
and the AX_PWM_CTRL_ENABLE write is skipped, leaving the physical hardware
disabled.

[ ... ]

> +static void axiado_pwm_disable(void *data)
> +{
> +	struct axiado_pwm_chip *axpwm =3D data;
> +
> +	writel(AX_PWM_CTRL_DISABLE, axpwm->base + AX_PWM_CNTRL_REG);
> +}
> +
> +static int axiado_pwm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct axiado_pwm_chip *axpwm;
> +	struct pwm_chip *chip;
> +	int ret;
> +
> +	chip =3D devm_pwmchip_alloc(dev, AX_PWM_NUM, sizeof(*axpwm));
> +	if (IS_ERR(chip))
> +		return PTR_ERR(chip);
> +
> +	axpwm =3D pwmchip_get_drvdata(chip);
> +
> +	axpwm->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(axpwm->base))
> +		return dev_err_probe(dev, PTR_ERR(axpwm->base),
> +				     "failed to map registers\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, axiado_pwm_disable, axpwm);
> +	if (ret)
> +		return ret;
> +
> +
> +	axpwm->clk =3D devm_clk_get_enabled(dev, "pwm");

[Severity: High]
Can this cause an unclocked MMIO write during driver unbind or probe failur=
e?

The devres cleanup action axiado_pwm_disable() is registered via
devm_add_action_or_reset() before the hardware clock is acquired and
enabled via devm_clk_get_enabled().

Because devres executes actions in LIFO order, on driver unbind the
clock will be disabled before axiado_pwm_disable() is called. Similarly,
if devm_clk_get_enabled() fails, axiado_pwm_disable() will execute while
the clock is off.

Since axiado_pwm_disable() writes to the AX_PWM_CNTRL_REG MMIO register,
accessing it without the clock active could cause a bus error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-axiado-ax3=
000-pwm-v1-0-c9797a909414@axiado.com?part=3D2
