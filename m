Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECEA2C234E
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 14:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780150607; cv=none; b=hrW7dABjc+sduvNKP6RQCcMQPTPndn86RGO9S2DAkOXPReko7a+MJ6OrvZIwntnQai/+Cdthf6fjotJMxr1wWhDHHYfb+A54gGdoGoLJ+gRH4LimLsy/vDwq8slcvE3wg76Ez3Zji6pR6Kz9GhC7JULHJobzmZpuyUu69/GsiOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780150607; c=relaxed/simple;
	bh=HpEjKLBuFCzZS+ZfN4lhKn/HIHVcN8EX20gHKsX5MOo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RPKtxBhkMyOM5AW9DgUMz+gbA47hHWYUn5f9BrpunfTxVoQ55FtGzhm8Yw/xSOM6E4qOKpgcoXNpAcC2eLPso4UPGrCk105XsU76c9YJtWIAspqfU9VEwnCwv5p+BZaRaVMFySTiBTB1nuLRbfsHoi69E9BSsQHsY8HdssAIL8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzDDqwIb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzDDqwIb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51651F00893;
	Sat, 30 May 2026 14:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780150606;
	bh=kH7OCLoOMYWzceW2O39S8fiedEjkp03lI/QDa+KDdu4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dzDDqwIbs+/FC5rpHsHjgbDDloPP3HUKteewKcvDIuGKgn9ZG6UpzuduqrsZokPeL
	 MOSPJgZRmQ6oYeax51//BxIFyUdWVuwAYrCOAy3hpkaUYayNax+Go7GTL0AHc8s8D5
	 X+SZfQh1k5ONXsz3RvTEHmdXxCONtq/8buULHsmBirPGOEEbNUyBwZDyP7xd8vMc8V
	 EZ/aVXROq2SkANUCL08C9iIjIKOkM5aSKLn23jQCn5KnA0dnpxfmG9qT1XmQRta2My
	 RtGvBGMZFdImJ5lswJqE8oru9sV6QClP/GnAvBuusDIsblYnz33rrIkPH6izTMIfkE
	 ptT08Wmijm/6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] thermal: qcom: add PM8901 PMIC temperature-alarm
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <1b3f3853d374d9f65e3043de27f390f7ed97a0e5.1780148149.git.github.com@herrie.org>
References: <1b3f3853d374d9f65e3043de27f390f7ed97a0e5.1780148149.git.github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 14:16:45 +0000
Message-Id: <20260530141645.D51651F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Hardware auto-shutdown override is left enabled if probe fails, pe=
rmanently disabling PMIC thermal protection.
- [Low] The calculation for the initial uninitialized temperature computes =
the lower bound of the stage, contradicting the comment that claims it pick=
s the midpoint.
- [Low] Lockless read of shared state variables in `dev_info` during probe.
--

commit 4441da30420e5466a8731b177283d08a1edfc099
Author: Herman van Hazendonk <github.com@herrie.org>

thermal: qcom: add PM8901 PMIC temperature-alarm driver

This commit adds a thermal-of sensor driver for the temperature-alarm block
inside the Qualcomm PM8901 PMIC. It registers interrupts and decodes stages
into temperatures for board thermal zones.

> diff --git a/drivers/thermal/qcom/qcom-pm8901-tm.c b/drivers/thermal/qcom=
/qcom-pm8901-tm.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/thermal/qcom/qcom-pm8901-tm.c
[ ... ]
> +/*
> + * Decode the (stage, threshold) pair into a single millicelsius value.
> + * Logic matches the legacy pmic8901-tm.c hysteresis selection:
> + *  - on a rising stage transition, use the lower bound of the new stage
> + *    plus +HYSTERESIS so we don't bounce
> + *  - on a falling stage transition, use the upper bound of the new stage
> + *    minus -HYSTERESIS
> + *  - on the first read after probe (initialised =3D=3D false), pick a
> + *    representative point: midpoint of the stage range, or
> + *    PM8901_TEMP_NO_ALARM when stage =3D=3D 0.
> + */
> +static int pm8901_tm_update_temp_locked(struct pm8901_tm_chip *chip)
> +{
[ ... ]
> +	if (!chip->initialised) {
> +		if (new_stage)
> +			chip->temp =3D PM8901_TEMP_THRESH_MIN +
> +				     chip->thresh * PM8901_TEMP_THRESH_STEP +
> +				     (new_stage - 1) * PM8901_TEMP_STAGE_STEP;

[Severity: Low]
This isn't a bug, but the comment above states this block picks the "midpoi=
nt
of the stage range". Does this formula actually compute the exact lower bou=
nd
of the stage instead?

> +		else
> +			chip->temp =3D PM8901_TEMP_NO_ALARM;
> +		chip->initialised =3D true;
[ ... ]
> +static int pm8901_tm_init_hw(struct pm8901_tm_chip *chip)
> +{
[ ... ]
> +	/*
> +	 * Enable software override so PMIC does NOT auto-shut-down on stage 3.
> +	 * Critical-trip orderly_poweroff is delivered by the kernel thermal
> +	 * core via the DT thermal-zone trip with type =3D "critical".
> +	 */
> +	reg =3D (reg & ~(CTRL_OVRD_MASK | CTRL_STATUS_MASK | CTRL_THRESH_MASK))=
 |
> +	      CTRL_OVRD_ST3 | CTRL_OVRD_ST2;
> +	ret =3D pm8901_tm_write_ctrl(chip, reg);
> +	if (ret)
> +		goto out;
[ ... ]
> +static int pm8901_tm_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D pm8901_tm_init_hw(chip);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "hw init failed\n");
> +
> +	chip->tz_dev =3D devm_thermal_of_zone_register(&pdev->dev, 0, chip,
> +						     &pm8901_tm_zone_ops);
> +	if (IS_ERR(chip->tz_dev))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(chip->tz_dev),
> +				     "thermal zone register failed\n");

[Severity: High]
Because pm8901_tm_init_hw() disables the PMIC's hardware auto-shutdown, if a
subsequent initialization step like devm_thermal_of_zone_register() or IRQ
registration fails, probe() exits with an error.

Since there is no devm action or cleanup path to restore the hardware state
on failure, does this leave the system running with no hardware or software
thermal protection?

> +
> +	ret =3D devm_request_threaded_irq(&pdev->dev, irq_alarm, NULL,
> +					pm8901_tm_isr, IRQF_ONESHOT,
> +					"pm8901-tm-alarm", chip);
[ ... ]
> +	platform_set_drvdata(pdev, chip);
> +	thermal_zone_device_update(chip->tz_dev, THERMAL_EVENT_UNSPECIFIED);
> +
> +	dev_info(&pdev->dev,
> +		 "PM8901 thermal alarm: base=3D0x%x stage=3D%u thresh=3D%u temp=3D%d\n=
",
> +		 chip->base, chip->stage, chip->thresh, chip->temp);

[Severity: Low]
Since IRQs and the thermal core polling are fully enabled at this point,
could an interrupt or thermal zone update execute concurrently and modify
chip->stage, chip->thresh, or chip->temp?

Does reading these variables here without holding chip->lock risk printing
torn or inconsistent values?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780148149.gi=
t.github.com@herrie.org?part=3D2
