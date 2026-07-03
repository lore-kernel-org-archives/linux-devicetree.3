Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD4D211A09
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 17:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783099029; cv=none; b=F5I3yxUhaU+ji++TjY/6K9y67i+gVdv1et0uWL8LV42qUnZEvcJIV1SDGEQiOJY2/GId6r5jJvBe/RgiFU5Qu6UCpmaaZ7Fb4gmpN3XYX9wjX1+yk2SmLWojyO3CzRiyZ9ODRRXwpxA3E6sUQ2IVPsVfRNPzbOE3cAJq7VRIOw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783099029; c=relaxed/simple;
	bh=01z8u6wDWszNObiRQjdx4kgjbWTbCDfg2nKcn6+COrw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qGevTarF0uKM3bAQZIHU+UnHx2n1QR1LoW7SLfjY6QN7n5Z5EvAskKv3KmMI7EgX/cBPPwkTvfh4g39OrntJYzTNrhoCSJ+GB4EBdCd11ySZ2CEMB8DhkvHUpbxeUovYaR6VW/Nq8W9hzNnxXI007vkHxbLf3I/yU54Aphz3wes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Femp+H6n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Femp+H6n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D31F51F00A3A;
	Fri,  3 Jul 2026 17:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783099028;
	bh=0RR/ixxgLO7QhOCYt5OlBZvc0+F0fFO2Kt804suVquI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Femp+H6nKa1LO3K3LaSoPAqjrSJ7pv709P02XDp19VQJ2D0pFZ7oHyJLUnVQ93kXu
	 NnC49fxJb1Kl68X8Av2nzS1hNFjARXCv5CIFcaDlim51gnxbMCtrwquyWZvqyFny/D
	 ENURTiEWwb5qv2/sRacr4dsEIkc2tC/59dwVDH/nvorkFuEjdiI9lC+c57G1tEZIb/
	 yzc16COk9A4vAd2BMVToBwtviSagHLRv4hcgtlNzq1EbWMH0htyvVww5g1/yiAbBRT
	 AMJGrPRwk3cIbKcOa01/9uftRqkcN69URQT+bu8CGf117SjO+APh+qjRuOWq2r290W
	 loEOhTVV0Fhcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] pwm: rp1: Add RP1 PWM controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <5171610d8bebdd10eea44bff5236502d765b5918.1783097764.git.andrea.porta@suse.com>
References: <cover.1783097764.git.andrea.porta@suse.com>
 <5171610d8bebdd10eea44bff5236502d765b5918.1783097764.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 17:17:06 +0000
Message-Id: <20260703171707.D31F51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Dangling syscon pointer and Use-After-Free upon device unbind due =
to devres regmap cleanup.
- [High] Non-atomic Read-Modify-Write of shared syscon registers causing da=
ta corruption.
--

commit ed6030e515052cf4e3fde5de4c8c7ffcb06a014a
Author: Naushir Patuck <naush@raspberrypi.com>

pwm: rp1: Add RP1 PWM controller driver

The Raspberry Pi RP1 southbridge features an embedded PWM
controller with 4 output channels, alongside an RPM interface
to read the fan speed on the Raspberry Pi 5.

Add the supporting driver.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

> diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> new file mode 100644
> index 0000000000000..8ef5ec9ed3a07
> --- /dev/null
> +++ b/drivers/pwm/pwm-rp1.c
> @@ -0,0 +1,435 @@
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

[Severity: High]
In rp1_pwm_apply_config(), since this regmap is exposed to other drivers via
syscon (like the RP1 RPM fan driver), could this manual read-modify-write
sequence race with concurrent register updates?

The regmap lock is released between regmap_read() and regmap_write(), which
might allow another syscon client's changes to RP1_PWM_GLB_CTRL to be
overwritten with stale data. Does this need to use regmap_update_bits()
instead?

> +}
[ ... ]
> +static int rp1_pwm_write_waveform(struct pwm_chip *chip,
> +				  struct pwm_device *pwm,
> +				  const void *_wfhw)
> +{
> +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> +	const struct rp1_pwm_waveform *wfhw =3D _wfhw;
> +	u32 value, ctrl;
> +
> +	/* set polarity */
> +	regmap_read(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), &value);
> +	if (!wfhw->inverted_polarity)
> +		value &=3D ~RP1_PWM_CHAN_CTRL_POLARITY;
> +	else
> +		value |=3D RP1_PWM_CHAN_CTRL_POLARITY;
> +	regmap_write(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), value);

[Severity: High]
Does rp1_pwm_write_waveform() present the same non-atomic read-modify-write
race condition here when updating RP1_PWM_CHAN_CTRL?

> +
> +	/* early exit if disabled */
> +	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &ctrl);
> +	if (!wfhw->enabled) {
> +		ctrl &=3D ~RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
> +		goto exit_disable;
> +	}
> +
> +	/* set period and duty cycle */
> +	regmap_write(rp1->regmap,
> +		     RP1_PWM_RANGE(pwm->hwpwm), wfhw->period_ticks);
> +	regmap_write(rp1->regmap,
> +		     RP1_PWM_DUTY(pwm->hwpwm), wfhw->duty_ticks);
> +
> +	/* enable the channel */
> +	ctrl |=3D RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
> +exit_disable:
> +	regmap_write(rp1->regmap, RP1_PWM_GLB_CTRL, ctrl);

[Severity: High]
And similarly here in rp1_pwm_write_waveform() for RP1_PWM_GLB_CTRL?

> +
> +	rp1_pwm_apply_config(chip, pwm);
> +
> +	return 0;
> +}
[ ... ]
> +static int rp1_pwm_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	rp1->regmap =3D devm_regmap_init_mmio(dev, base, &rp1_pwm_regmap_config=
);
> +	if (IS_ERR(rp1->regmap))
> +		return dev_err_probe(dev, PTR_ERR(rp1->regmap), "Cannot initialize reg=
map\n");
[ ... ]
> +	ret =3D of_syscon_register_regmap(np, rp1->regmap);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to register syscon\n");
> +		goto err_remove_chip;
> +	}
> +
> +	return 0;

[Severity: High]
In rp1_pwm_probe(), because rp1->regmap is managed by devres (allocated via
devm_regmap_init_mmio), it will be automatically freed when the device is
unbound. However, of_syscon_register_regmap() registers it globally.

Since there is no mechanism to unregister the regmap from syscon upon device
removal, wouldn't unbinding the parent PCI device leave a dangling pointer
in the global syscon list?

Could this lead to a use-after-free if another driver attempts to use this
syscon client after this device is unbound?

> +
> +err_remove_chip:
> +	pwmchip_remove(chip);
> +err_disable_clk:
> +	clk_disable_unprepare(rp1->clk);
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783097764.gi=
t.andrea.porta@suse.com?part=3D2
