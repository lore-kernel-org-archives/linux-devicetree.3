Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0033B274B37
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 16:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781540751; cv=none; b=mzjseuNOTMzXVGbXxYZlnzkUL890b34c/MDuyx9H5gJRCDkUVQeGaLDSwWGAPxQZwo3iZUR+Mlis7YSpV1nSOiJgF9+mPhTlbVJLu0RbljQ9qqVouVBybl8kTm4Aolvt++4K4s8m/CH3aexPRqTZrc6euFAzsVRyfNNzaBxxcL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781540751; c=relaxed/simple;
	bh=5MW0tQ6sbY/j/NumIwl5AOcUcwCiie67fqku0kR9O1I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lMJUWc0gTV+wh9ZU5jjTGhAPjiVS8bSqqMn2OexaHwFrK1z5VxER8+vajmzOnehRxm/kbBpLRPDckWtquJ07LQSurEituoN3ucBRzIMq/BUc6u41V8zDOt06w314i/XvVIjIRx33QRtmKS15R72M0CuWcnqRZEp6cX9H2bEUh5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJse/P3P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJse/P3P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D701F000E9;
	Mon, 15 Jun 2026 16:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781540749;
	bh=w6ho+293O4JRw+bi1/jQeUTqiUF0n/f2PQqCVRp5NCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YJse/P3PYi3qeDlvmxi6Rs+nsN3dMW1JXoKO8aDsAthPCRIbfjrCmP5n8FJk1Fewd
	 S3jM9wteEemPhGON3KRTEeWV7FfULhfmjrGf/4+X1z3Cbg7iPyiKBYj1Us4nPs7Jbc
	 lesxJyp6utgCxoSfbtosDA+fQ/jcSTS5G8e95xj+DrqUuE5C4qj9oEjK+AkmIzv3gZ
	 IjnqXcYSl4toT4LsJemFOVaIGuDv3/1MOg5d5Po04sU/a36ECSh+DRTeAd7+hvARUF
	 BEXz4GfF+yLB/dW6NSLyXRMiNumMbVq1f7sp8sLCg2NHdXeMzStLuaPHhGD/JfVLb3
	 G0EvU9vVia/CA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 3/3] pwm: Add OpenCores PTC PWM driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hal Feng" <hal.feng@starfivetech.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615155759.129210-4-hal.feng@starfivetech.com>
References: <20260615155759.129210-4-hal.feng@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 16:25:49 +0000
Message-Id: <20260615162549.53D701F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware state corruption and PM runtime leak in `ocores_pwm_apply=
` on invalid parameter request.
--

commit b3a12f20d0a4ac7f1d2dc7a3d103fe2acf522975
Author: Hal Feng <hal.feng@starfivetech.com>
Subject: pwm: Add OpenCores PTC PWM driver

This commit adds a PWM driver for the OpenCores PTC IP core.

> diff --git a/drivers/pwm/pwm-ocores.c b/drivers/pwm/pwm-ocores.c
> new file mode 100644
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
> +	if (state->enabled) {
> +		if (!was_enabled) {
> +			ret =3D pm_runtime_resume_and_get(pwmchip_parent(chip));
> +			if (ret < 0)
> +				return ret;
> +		}
> +	} else {
> +		if (was_enabled) {
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
> +	if (period_data > U32_MAX)
> +		period_data =3D U32_MAX;
> +
> +	duty_data =3D mul_u64_u32_div(state->duty_cycle, ddata->clk_rate, NSEC_=
PER_SEC);
> +	if (duty_data > U32_MAX)
> +		duty_data =3D U32_MAX;
> +
> +	if (!period_data || !duty_data) {
> +		if (!was_enabled)
> +			pm_runtime_put(pwmchip_parent(chip));
> +		return -EINVAL;

[Severity: High]
Does stopping and resetting the hardware before validating the requested
parameters cause state corruption if the validation fails?

If period_data or duty_data evaluate to 0, the function returns -EINVAL.
Since the hardware was already stopped and reset, the framework's software
state will show the PWM as enabled, but the physical hardware will remain
disabled.

Additionally, if was_enabled is true, does this error path leak the PM
runtime reference?

Since OCPWM_CTRL_EN was prematurely cleared, ocores_pwm_pm_disable() will
later see the enable bit as 0 and skip its pm_runtime_put_noidle() call:

ocores_pwm_pm_disable() {
    ...
	if (!pm_runtime_status_suspended(dev)) {
		if (readl(ddata->base + OCPWM_CTRL) & OCPWM_CTRL_EN)
			pm_runtime_put_noidle(dev);
    ...
}

> +	}
> +
> +	writel(period_data, ddata->base + OCPWM_LRC);
> +	writel(duty_data, ddata->base + OCPWM_HRC);
> +	writel(OCPWM_CTRL_OE | OCPWM_CTRL_EN, ddata->base + OCPWM_CTRL);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615155759.1292=
10-1-hal.feng@starfivetech.com?part=3D3
