Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75EE356755
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 03:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782876973; cv=none; b=pxh8oAdYBW4Gp4Ml8r4tGkvZI0yrBBbS0bN8atzULJgu9r9G5YHc+59JTwiN8VqtR7FL30NJHmU+ZU4/3Jf9YhIRXTZCmWB2F0cn62zmt4Gh5hN54DdzXBAYTsB869adg4CXkO6ycqnHpoqdFbrzevyZNwFubWDVNpbwSXu1Iz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782876973; c=relaxed/simple;
	bh=HwW/1gT/Ot17XMwJRmThhBuXEqR2AetxiAtbfA7souQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jAVmiBQiwQ1EPzOkui0wtArGEOGEUGMVNAbWR4z2z7q9E2XxeFc4HPNaG9Y2IXZXVq66zvH3l51L/4vCzvUaWQug3KpgunVLmQILvjcn3jJEUieGW3+iuFtFRZQjwCef5fIGQHovm/jO79opusaQndjcDqPO55L0oIDcMY8RvEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DznuhNwH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DznuhNwH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D641F00A3A;
	Wed,  1 Jul 2026 03:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782876971;
	bh=nOSkdgCuvyVmYx9TjnvojHUKtxWT1PZfRMPFeU/OZds=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DznuhNwHj4Un3kGH4YwoMuo7JxZyyFaFDnpZcLOke2M1ErFSJ5gFWwRw4VsJs7g7x
	 cJIjZYsEEiqENWuzcMWCCGSqPZ0/e7NiA/fs5IkkGIe05LlQYByh5TWgFPlc4T4Yl5
	 KPeP5Z2sko7SOkfFIRiwAC66968BI1R2VOyOjb3jrcph3NBCFJtHlbZMiGBZRaHTsE
	 NH0wCN81UiOK9C4l6/gLucJx9Dc5HiVxWtlivjg2fBJUjkU8FaRlIbMI+FS/EPSsI7
	 0/OC+y03ZVrcqmGKiSZ4dmlqYPmfs/JK7f4a5psi+UelP6AkyV+oT4DjwjvoU+e5T2
	 OHEAbkLYolckA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/7] pwm: tegra: Avoid hard-coded max clock frequency
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikko Perttunen" <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260701-t264-pwm-v6-3-2718f61f411f@nvidia.com>
References: <20260701-t264-pwm-v6-0-2718f61f411f@nvidia.com>
 <20260701-t264-pwm-v6-3-2718f61f411f@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 03:36:10 +0000
Message-Id: <20260701033611.72D641F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] dev_pm_opp_set_rate(..., ULONG_MAX) causes probe failure when the =
parent clock's maximum rate exceeds the DT OPP table limits.
- [High] Dropping the explicit max_frequency cap permanently locks older So=
Cs (num_channels > 1) to a high clock rate, severely limiting the maximum P=
WM period.

Pre-existing issues:
- [High] Missing pm_runtime_disable() on probe error paths and in driver re=
move.
--

commit 29d7ce61a02c025b3580d289a189425cd7da22aa
Author: Yi-Wei Wang <yiweiw@nvidia.com>

pwm: tegra: Avoid hard-coded max clock frequency

The patch removes the hard-coded maximum frequency for Tegra PWM SoCs.
It updates probe to use dev_pm_opp_set_rate with ULONG_MAX to set the clock
rate based on the parent clock limits from the device tree. It also removes
the now redundant tegra194_pwm_soc configuration.

> diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
> index f8c5495a56a66..3eef299c51f8e 100644
> --- a/drivers/pwm/pwm-tegra.c
> +++ b/drivers/pwm/pwm-tegra.c
> @@ -59,9 +59,6 @@
> =20
>  struct tegra_pwm_soc {
>  	unsigned int num_channels;
> -
> -	/* Maximum IP frequency for given SoCs */
> -	unsigned long max_frequency;
>  };
> =20
>  struct tegra_pwm_chip {
> @@ -303,7 +300,7 @@ static int tegra_pwm_probe(struct platform_device *pd=
ev)
>  		return ret;
> =20
>  	/* Set maximum frequency of the IP */
> -	ret =3D dev_pm_opp_set_rate(&pdev->dev, pc->soc->max_frequency);
> +	ret =3D dev_pm_opp_set_rate(&pdev->dev, ULONG_MAX);

[Severity: High]
If the parent clock's maximum physical rate exceeds the maximum frequency
defined in the device tree OPP table, will dev_pm_opp_set_rate() fail here?

The OPP core translates ULONG_MAX using clk_round_rate() to find the absolu=
te
maximum frequency the parent clock can physically generate. If this is high=
er
than the maximum frequency in the OPP table (for example, on Tegra30),
_find_freq_ceil() might fail to find a valid OPP and return -ERANGE, causing
the probe to fail.

Also, for older SoCs where num_channels > 1, tegra_pwm_config() does not
dynamically scale the clock rate.

drivers/pwm/pwm-tegra.c:tegra_pwm_config() {
    ...
    if (pc->soc->num_channels =3D=3D 1) {
        ...
        err =3D dev_pm_opp_set_rate(pwmchip_parent(chip), required_clk_rate=
);
        ...
    }
   =20
    /* Consider precision in scale_width rate calculation */
    rate =3D mul_u64_u64_div_u64(pc->clk_rate, period_ns,
                               (u64)NSEC_PER_SEC * TEGRA_PWM_DEPTH);
    ...
    if (rate >> pc->soc->scale_width)
        return -EINVAL;
    ...
}

By forcing the clock to its absolute maximum frequency during probe, won't
these older SoCs be permanently locked to a high clock rate?

With a high fixed clock rate, calculating the divider (rate) for large requ=
ested
periods (like 20ms for servos) could exceed the hardware's scale_width limi=
t,
causing legitimate config requests to fail with -EINVAL.

>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "Failed to set max frequency: %d\n", ret);
>  		goto put_pm;
>  	}
> @@ -315,10 +312,15 @@ static int tegra_pwm_probe(struct platform_device *=
pdev)
>  	 * so that PWM period can be calculated more accurately.
>  	 */
>  	pc->clk_rate =3D clk_get_rate(pc->clk);
> +	if (pc->clk_rate < (1 << TEGRA_PWM_DUTY_WIDTH)) {
> +		dev_err(&pdev->dev, "clock maximum frequency out of range\n");
> +		ret =3D -ERANGE;
> +		goto put_pm;

[Severity: High]
This is a pre-existing issue, but does this error path leave the runtime PM
state unbalanced?

The driver calls pm_runtime_enable() earlier in tegra_pwm_probe(), but the =
error
handling at the put_pm label (and similarly the tegra_pwm_remove function) =
only
calls suspend functions without calling pm_runtime_disable():

drivers/pwm/pwm-tegra.c:tegra_pwm_probe() {
    ...
put_pm:
    pm_runtime_put_sync_suspend(&pdev->dev);
    pm_runtime_force_suspend(&pdev->dev);
    return ret;
}

Could this lead to state corruption or kernel warnings upon module reload or
device re-bind since the enable is never balanced?

> +	}
> =20
>  	/* Set minimum limit of PWM period for the IP */
>  	pc->min_period_ns =3D
> -	    (NSEC_PER_SEC / (pc->soc->max_frequency >> TEGRA_PWM_DUTY_WIDTH)) +=
 1;
> +	    (NSEC_PER_SEC / (pc->clk_rate >> TEGRA_PWM_DUTY_WIDTH)) + 1;
> =20
>  	pc->rst =3D devm_reset_control_get_exclusive(&pdev->dev, "pwm");
>  	if (IS_ERR(pc->rst)) {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-t264-pwm-v=
6-0-2718f61f411f@nvidia.com?part=3D3
