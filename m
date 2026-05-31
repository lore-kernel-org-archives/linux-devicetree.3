Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFC922F01
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 04:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780202505; cv=none; b=rBUTcZeulaGa1tIgxD/pg618EvlvScoLXqErOswiAFIomH7/VBvN49Q8KuPtrg2ju5jVWxwz+JVI1PVMm7/iw3/BA3MnG/4a+M2KiF1iVCsxGEHb1LHqWZn4LRDl/fUFaTF6PhCoWZY20pyiJbO7VbNYNekNrwqEAFeSGUIMh7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780202505; c=relaxed/simple;
	bh=nlLDekrxSgNjV7EEd+PebRANl7Wpv/+ApNWf+wDWybI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jzh856ZFNWJBBZWTQwPdvRO3XrLdBe7cPnOe5kZsj3Xv4QOq5JGbr1ijEmIIJQ+ZaGwoe5+5RmXWEFYs4Dl8JRw/z+do1ubkqDJXCCiKIzquet8ie2Kkz2EAH14eggkMa+yHlQBRD8InKGS0WzWEzLQ32deu5sKJElCCAkK7rlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDyJIQj2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDyJIQj2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484541F00893;
	Sun, 31 May 2026 04:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780202504;
	bh=UDffy19DYoZFNQib1P26f8NgKOb6P13CQ0u52mK41TY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GDyJIQj2Fu95TaFUBBsCzOvQjvkkUBVf0SSEG/kTLwpORMWoAGRw6oAiAlHdfrDNN
	 asYqg9ytX73onV62jRmKLOsw0Lhvk8CA7wl2OvMjbn+sW0dFXS9UIZ0f7D8jTonSSQ
	 5NwRx5Pl0mvTmS4waRoyhiFKWQUTC5aLDnofKxVedLJcYp84kZmtxpThIscTfxiO4Q
	 XJ1KLUVg8xIZQHdwV+uGvcPLRwDTmKObiZNEaDsrnr3BBKExcv392w3KvE9YmG4HMB
	 gh8TIBBPYWb/f2iaHwxEhmliiVnDGN2wsVoIcxZgGjuC1YAW77e3LwNSR8QyaX3WP2
	 +AZ0u9bxELuCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] thermal: qcom: add PM8901 PMIC temperature-alarm
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <aebf87a1be4512aa6158faf45001ee04caa397fc.1780197411.git.github.com@herrie.org>
References: <aebf87a1be4512aa6158faf45001ee04caa397fc.1780197411.git.github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 04:41:43 +0000
Message-Id: <20260531044144.484541F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The driver disables the PMIC's hardware thermal auto-shutdown duri=
ng probe but does not implement a `.shutdown` callback to restore it, leavi=
ng the device physically unprotected across warm reboots.
- [High] The driver overrides the PMIC's hardware thermal shutdown but fail=
s to configure the thermal interrupts as system wakeup sources or restore t=
he hardware shutdown during suspend, leaving the device unprotected while s=
uspended.
--

commit ea0822f7dd85ca701edd835f63cf382da86b80eb
Author: Herman van Hazendonk <github.com@herrie.org>

thermal: qcom: add PM8901 PMIC temperature-alarm driver

Add a thermal-of sensor driver for the temperature-alarm block inside
the Qualcomm PM8901 PMIC. It exposes an over-temperature alarm at SSBI
offset 0x23/0x24 with three escalating stages.

> diff --git a/drivers/thermal/qcom/qcom-pm8901-tm.c b/drivers/thermal/qcom=
/qcom-pm8901-tm.c
> new file mode 100644
> index 0000000000000..b159e9917c2c9
> --- /dev/null
> +++ b/drivers/thermal/qcom/qcom-pm8901-tm.c

[ ... ]

> +	chip->tz_dev =3D devm_thermal_of_zone_register(&pdev->dev, 0, chip,
> +						     &pm8901_tm_zone_ops);
> +	if (IS_ERR(chip->tz_dev))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(chip->tz_dev),
> +				     "thermal zone register failed\n");
> +
> +	ret =3D devm_request_threaded_irq(&pdev->dev, irq_alarm, NULL,
> +					pm8901_tm_isr, IRQF_ONESHOT,
> +					"pm8901-tm-alarm", chip);

[Severity: High]
Since the PMIC's hardware thermal shutdown is overridden by the software
driver during probe, should these thermal interrupts be configured as system
wakeup sources?

During system suspend, non-wakeup interrupts are disabled and the software
thermal core sleeps. Without wakeup enabled, could the device overheat while
suspended without the hardware or OS acting on it to prevent damage?

[ ... ]

> +static const struct of_device_id pm8901_tm_match_table[] =3D {
> +	{ .compatible =3D "qcom,pm8901-temp-alarm" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, pm8901_tm_match_table);
> +
> +static struct platform_driver pm8901_tm_driver =3D {
> +	.driver =3D {
> +		.name		=3D "pm8901-temp-alarm",
> +		.of_match_table	=3D pm8901_tm_match_table,
> +	},
> +	.probe	=3D pm8901_tm_probe,
> +};

[Severity: High]
Is a .shutdown callback needed in pm8901_tm_driver to restore the PMIC's
hardware thermal auto-shutdown?

While pm8901_tm_enable_sw_override() registers a devm action to restore it
on unbind, devm actions are not executed during the system shutdown or rebo=
ot
path in device_shutdown().

Could this leave the device in software-override mode across a warm reboot,
where it would be physically unprotected if it overheats during the bootloa=
der
phase before the OS boots?

Additionally, does this driver need suspend and resume PM callbacks in
dev_pm_ops to temporarily re-enable the hardware shutdown while the software
thermal core is asleep?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780197411.gi=
t.github.com@herrie.org?part=3D3
