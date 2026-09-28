Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8443C4D8D9D
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604309; cv=none; b=RIR10duoKQqnJuKw8VjQBMa8PLwJNEnFNpXmfNnBQnYdQ1SZ8qXskxjoeR4n46reQ3qfbYkgSNJ7fsrE7FxJBp/1RP2QjZ7weANQPuZLyJJrMx+Q+ya8OxPOlo/csHzK4Zd1VsK/14a3dpMPlKI7SqloVgG0Fk9+kVUfccrRw9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604309; c=relaxed/simple;
	bh=TxJb4QCw7IS/BYlI3gxdtk81WHmfoQFC8oVo3EWSEH8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qFnLelMrNyooXp+tUVlj14IO66vAchsu9odSto6F/oPY4H50jxUhB1Fe5Kg77ONx2YQl4d6+pw4kgof9xWpf+ikeAQ53PzGkHD0u0kyqGH8GqJaiTxB0WFIhCb237P6VtkXjDM4X2xhFtCaBsQKWJTco3UU4vHDxexuBtWfcvaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9n4cGAT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9n4cGAT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8C71F000FF;
	Mon, 28 Sep 2026 14:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790604300;
	bh=0SBb+TOveaOuUCCVtJhMHlJe9hoHQV1wcwb9KSVxYoA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X9n4cGATB3Vfdfdbkv3p01rznmXlTd3bX+JhY+wI2uaVm1+5dJwI4dLHZOi1TdFsm
	 7xN9/ExXlazt842GtdfyQ3Svev14LW6ZKH9wZymxgwtmeGU2+2Qip1HohaJlUUjX83
	 lpLgjRtcR3tX6fyJyldwjarSFdXfl4wPRieBOsSDDYKEITiaIjWZh6+tCdFag79ooU
	 1wmxHTiK/rMubCN3tgJ8ewgG2hZWzz1l7tsb84xmb7dm6007QNP5qt4pGQO+4SrXPe
	 rDl3KnoxXXLBFtUzut8t09PMRRdXljYwJB10VdeaDnPrhTFIAe98G7eXyoZLakNiDh
	 P9y+z1/dPchVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/3] pwm: rp1: Add RP1 PWM controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <74cceb2b8bde69132960887364a443c4e6fecfaa.1790603500.git.andrea.porta@suse.com>
References: <cover.1790603500.git.andrea.porta@suse.com>
 <74cceb2b8bde69132960887364a443c4e6fecfaa.1790603500.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 14:04:59 +0000
Message-Id: <20260928140500.8C8C71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] pwm: rp1: uninitialized variable base used in probe error check
- [Medium] pwm: rp1: missing hardware duty cycle cap in normal polarity
--

commit e4b281ff49d6f4c4ce04ab56fa923f8ea44e3ba3
Author: Naushir Patuck <naush@raspberrypi.com>

pwm: rp1: Add RP1 PWM controller driver
   =20
The Raspberry Pi RP1 southbridge features an embedded PWM
controller with 4 output channels, alongside an RPM interface
to read the fan speed on the Raspberry Pi 5.
   =20
Add the supporting driver.

> diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> new file mode 100644
> index 0000000000000..60b02d7c85ee8
> --- /dev/null
> +++ b/drivers/pwm/pwm-rp1.c
[ ... ]
> @@ -184,15 +184,15 @@ static int rp1_pwm_round_waveform_fromhw(struct pwm=
_chip *chip,
>  					 struct pwm_device *pwm,
>  					 const void *_wfhw,
>  					 struct pwm_waveform *wf)
>  {
[ ... ]
> +	if (!wfhw->inverted_polarity) {
> +		wf->duty_length_ns =3D DIV_ROUND_UP_ULL((u64)wfhw->duty_ticks * NSEC_P=
ER_SEC,
> +						      (u32)clk_rate);
> +	} else {
> +		if (wfhw->duty_ticks > (u64)wfhw->period_ticks + 1) {
> +			/* 100% duty cycle case */
> +			ticks =3D 0;
> +		} else {
> +			ticks =3D (u64)wfhw->period_ticks + 1 - wfhw->duty_ticks;
> +		}

[Severity: Medium]
Could wfhw->duty_ticks exceed wfhw->period_ticks (e.g., if pre-configured by
a bootloader for a 100% duty cycle)?

If so, since rp1_pwm_round_waveform_fromhw() doesn't cap wfhw->duty_ticks
for normal polarity, could this result in duty_length_ns > period_length_ns,
violating the PWM API contract and creating an invalid initial waveform sta=
te?

[ ... ]
> @@ -295,12 +295,12 @@ static int rp1_pwm_probe(struct platform_device *pd=
ev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	unsigned long clk_rate;
>  	struct pwm_chip *chip;
>  	void __iomem	*base;
>  	struct rp1_pwm *rp1;
>  	int ret;
> =20
>  	chip =3D devm_pwmchip_alloc(dev, RP1_PWM_NUM_PWMS, sizeof(*rp1));
>  	if (IS_ERR(chip))
>  		return PTR_ERR(chip);
> =20
>  	rp1 =3D pwmchip_get_drvdata(chip);
> =20
>  	rp1->base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);

[Severity: High]
Does this code check the uninitialized local variable base instead of
rp1->base?=20

If devm_platform_ioremap_resource() fails, could this check allow the probe
to proceed with an error pointer in rp1->base, potentially leading to a ker=
nel
panic when dereferenced later?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790603500.gi=
t.andrea.porta@suse.com?part=3D2
