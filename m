Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207BD347FC0
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 09:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072032; cv=none; b=dOLM4BnZZoGDW23iZkopVMbEwG4JXAUNj17yhCp6X3AczqYeGLC6ocQkgA8UnZOHdEsufAlJnm5B3qDJ+lWYk6HnqUbE7I/E68LpjPWBLrYaLGv2v3iLdZHg+T38Ooj/dSAwOpU3KmZGWOfcdbi1d38KlZbZiQQFO0bj+1HxGr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072032; c=relaxed/simple;
	bh=GdAsnlno0xFUKgP77MkMnQvHS5+nq1OSiIT4nW17TFQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cv7XMkFKrYm/ti8Sg03U2Ezwybd1czaLvEBoOG7uyho+Tmsa6yYJYcGEC+935ckY6Pt4H+u32hIc3oyzKhok3fORYOCqmeG2xZQqwQyTFrbWOr9aCHR2VeVPY6nBvo6y8tcw9aelyZRY2ozbHifqVz9RxIX4PouOHItC/IUguho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HO+z35O3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HO+z35O3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723361F000E9;
	Fri,  3 Jul 2026 09:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783072030;
	bh=EcDI40RnaLPjVdZILqSo1hzafIk+vCzhfJv4acagHU0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HO+z35O3akG1VHvdFNX2tDVoj2qMXMZT2YijrH8XhA7EmIwRlQRROaZJUWLeaAROJ
	 2zXSX8qDU4O7++g01SjiVCtkWOaKzdkmx/E/orbPyTTzszUqx8edqlKZj6qOWWlRjV
	 T+i3fb+TjPYXvutNMP9+Eb0i63rDr1HHpzGr52iiyPoaeoQPzzw/5dnYdr4xlDnZ4Q
	 yxbZ7TTrzwa/Gf9Q2jFw3TBDHpdyOf9VCDFXW0PhTNjlJpsi8JS6IFNJtAhvsGioz3
	 qrEX0KgoE7f0Bc91lMiMZPcs5oUsj0qPW+2Ge3sRNlog6AVNym3tqgBYCSsn1AlPqD
	 Mts3tDDdU9VhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/3] pwm: dwc: add of/platform support
Reply-To: sashiko-reviews@lists.linux.dev
To: dongxuyang@eswincomputing.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260703093430.699-1-dongxuyang@eswincomputing.com>
References: <20260703093308.482-1-dongxuyang@eswincomputing.com>
 <20260703093430.699-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 09:47:09 +0000
Message-Id: <20260703094710.723361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Hardware reset is asserted after gating clocks, which can cause bu=
s hangs.
- [High] Race condition between runtime PM check and disable causes a perma=
nent clock leak.

Pre-existing issues:
- [High] Unmasking the timer interrupt without an IRQ handler can cause a s=
evere interrupt storm.
--

commit a50609ba96938c02fbc94f54318c95561f661758
Author: Xuyang Dong <dongxuyang@eswincomputing.com>
Subject: pwm: dwc: add of/platform support

The dwc pwm controller can be used in non-PCI systems, so allow either=20
platform or OF based probing. Implements polarity control by exploiting=20
the timer's dual load registers.

> diff --git a/drivers/pwm/pwm-dwc-core.c b/drivers/pwm/pwm-dwc-core.c
> index 6dabec93a3c64..49f0657d4ad44 100644
> --- a/drivers/pwm/pwm-dwc-core.c
> +++ b/drivers/pwm/pwm-dwc-core.c

[ ... ]

> @@ -85,6 +138,9 @@ static int __dwc_pwm_configure_timer(struct dwc_pwm *d=
wc,
>  	 * periods are set by Load Count registers.
>  	 */
>  	ctrl =3D DWC_TIM_CTRL_MODE_USER | DWC_TIM_CTRL_PWM;
> +	if (dwc->features & DWC_TIM_CTRL_0N100PWM_EN)
> +		ctrl |=3D DWC_TIM_CTRL_0N100PWM_EN;
> +
>  	dwc_pwm_writel(dwc, ctrl, DWC_TIM_CTRL(pwm->hwpwm));

[Severity: High]
This isn't a bug introduced by this patch, but does writing this control
register unmask the timer interrupt?

The ctrl value is constructed without DWC_TIM_CTRL_INT_MASK set. If this
hardware is on an OF platform where interrupts are commonly shared, could
this unmasked timer flood the system with interrupts since there is no
IRQ handler?

> diff --git a/drivers/pwm/pwm-dwc-of.c b/drivers/pwm/pwm-dwc-of.c
> new file mode 100644
> index 0000000000000..7bbbf98d7697a
> --- /dev/null
> +++ b/drivers/pwm/pwm-dwc-of.c

[ ... ]

> +static void dwc_pwm_plat_remove(struct platform_device *pdev)
> +{
> +	struct dwc_pwm_drvdata *data =3D platform_get_drvdata(pdev);
> +	struct pwm_chip *chip =3D data->chips[0];
> +	struct dwc_pwm *dwc =3D to_dwc_pwm(chip);
> +	unsigned int idx;
> +	int ret;
> +
> +	pwmchip_remove(chip);
> +
> +	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret < 0) {
> +		dev_warn(&pdev->dev, "failed to resume device: %d\n", ret);
> +	} else {
> +		for (idx =3D 0; idx < chip->npwm; idx++) {
> +			if (dwc_pwm_readl(dwc, DWC_TIM_CTRL(idx)) &
> +					  DWC_TIM_CTRL_EN)
> +				pm_runtime_put_noidle(&pdev->dev);
> +		}
> +		pm_runtime_put_sync(&pdev->dev);
> +	}
> +
> +	if (!pm_runtime_status_suspended(&pdev->dev)) {
> +		clk_disable_unprepare(dwc->clk);
> +		clk_disable_unprepare(dwc->bus_clk);
> +	}
> +	pm_runtime_disable(&pdev->dev);

[Severity: High]
Could this ordering cause a permanent clock leak if a concurrent runtime
PM resume occurs?

If userspace triggers a resume (e.g. via sysfs) between the
pm_runtime_status_suspended() check and pm_runtime_disable(), the
dwc_pwm_runtime_resume() callback will re-enable the clocks.

Once pm_runtime_disable() runs, the PM state is frozen, but the driver will
have lost track of the re-enabled clocks. Should pm_runtime_disable() be
called before manually rolling back the clock state?

> +
> +	if (dwc->rst) {
> +		ret =3D reset_control_assert(dwc->rst);

[Severity: High]
Does asserting the reset while the IP block's clocks are disabled cause
a bus lockup?

In dwc_pwm_plat_remove(), the clocks are guaranteed to be off here
(either implicitly by allowing the device to suspend, or explicitly via the
clk_disable_unprepare() calls just above).

On AMBA/APB buses, asserting a reset on an unclocked IP block often prevents
the reset signal from propagating, leading to a system hang when the reset
controller attempts to complete the transaction.

> +		if (ret)
> +			dev_warn(&pdev->dev, "failed to assert reset: %d\n",
> +				 ret);
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703093308.482-=
1-dongxuyang@eswincomputing.com?part=3D3
