Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1ED3CBE69
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817023; cv=none; b=ZgRyscTDHRaeFeQ6BX4dZYvWoxJpugD+bHtzjuKbTd8kgD4eMTo1jXDobIRHXSipOmeZN9Ae/ikQK1NKLxBvCeYeqcPcemUVXV4JT+zGX4a1ids+dr6VIAchKOm7Fpuc7Vg55J0/u2ijGn9VXbNIUvgWgUMeDFhO88gil/lRBmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817023; c=relaxed/simple;
	bh=ov3kb4yH+iOWRxWdyoXEUQ4PtyrHIjXCo3GXcG1ywrU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=khmeMhtzbqc457s1yDE9xhDi2tgEAIPcUuHIvSYXV7PzZhZ1VzxgnAr3/Acz9JRpiDaM3n4dknm8yWtCxYSJFJHoIKVxn9FNaRO30aCozSEF0+9Rek+aUp81dcNngg78nnnLpQLYejYW06+gl7EZF0UekC7LWVokghqmAOUggNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOGYEz/0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOGYEz/0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0471F00A3A;
	Tue, 30 Jun 2026 10:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782817021;
	bh=tckWTZyl+fbwDvg9BriAJ7XwKDaJtFh0rbTkh0zqusg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KOGYEz/0mB83TXbuUzvThjyzDhjWguiB0vce0fFP6Fll0N9xFYLXfwYORSgsWmg+j
	 YTdQpzq1ZR/eDv4weXIKtRCW2ATyXDUxVbkcgi1/HAuwZ4wIpOU3ezPyN+TqxI+4ba
	 ImWH3h798U6p+u5UvyRGIQ53ayK99kyT7Csg/G0VAYPSZZu4HtMpMkuObfljAVABve
	 Y9cMZyszxw0OMikjlmV+KtLtzDVinGuP8txfO3fdvXUJAa7/2ZhYSt50C/yHMF0Qh4
	 zGtIPzCpueAGt/yIub5c+JcQPtGQkK/JCGhrxxC9G7XMsyhu3ysQjmXuyiA8ttAcKU
	 SsbDDSRQWYv8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] bus: simple-pm-bus: Populate child nodes at
 probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herve Codina" <herve.codina@bootlin.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260630102717.413501-3-herve.codina@bootlin.com>
References: <20260630102717.413501-1-herve.codina@bootlin.com>
 <20260630102717.413501-3-herve.codina@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 10:57:01 +0000
Message-Id: <20260630105701.7D0471F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Time-of-Check to Time-of-Use (TOCTOU) race with the mutable driver=
_override sysfs attribute causes state mismatch and resource leaks.
- [High] The driver leaks clock enable counts during removal because pm_run=
time_disable() is called without synchronously suspending the device.
--

commit 8879d2bb547d47c5c484809ff15676d13cfec9a8
Author: Herve Codina <herve.codina@bootlin.com>

bus: simple-pm-bus: Populate child nodes at probe

The simple-pm-bus driver didn't populate child devices during probe when us=
ed
with busses other than a compatible "simple-pm-bus", confusing fw_devlink.
This commit explicitly populates child nodes during probe for those compati=
ble
devices to ensure proper devlink creation and consumer removal ordering.

> diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> index 4b2a793dfbd90..d969bf19a4e95 100644
> --- a/drivers/bus/simple-pm-bus.c
> +++ b/drivers/bus/simple-pm-bus.c

[ ... ]

> @@ -78,7 +80,7 @@ static void simple_pm_bus_remove(struct platform_device=
 *pdev)
>  {
>  	const void *data =3D of_device_get_match_data(&pdev->dev);
> =20
> -	if (device_has_driver_override(&pdev->dev) || data)
> +	if (device_has_driver_override(&pdev->dev))

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to rely on
device_has_driver_override() here during removal?

The driver_override sysfs attribute is mutable. If it is changed by a user
after probe() but before remove(), the control flow in remove() will skip
of_platform_depopulate() and pm_runtime_disable(), causing state mismatches.

If the override is cleared after being set during probe, remove() might
attempt to depopulate children it never populated and disable PM runtime it
never enabled.

Could this rely on the driver's own internal state (like dev_get_drvdata())
instead of checking a mutable sysfs attribute?

>  		return;
> =20
>  	dev_dbg(&pdev->dev, "%s\n", __func__);
> @@ -86,7 +88,8 @@ static void simple_pm_bus_remove(struct platform_device=
 *pdev)
>  	if (pdev->dev.of_node)
>  		of_platform_depopulate(&pdev->dev);
> =20
> -	pm_runtime_disable(&pdev->dev);
> +	if (!data)
> +		pm_runtime_disable(&pdev->dev);

[Severity: High]
This is a pre-existing issue, but does calling pm_runtime_disable() here
without synchronously suspending the device leak clock enable counts?

of_platform_depopulate() removes the children, which may asynchronously drop
the bus's PM usage counter. Calling pm_runtime_disable() immediately
afterward cancels any pending async suspend requests.

If the parent bus remains RPM_ACTIVE when pm_runtime_disable() completes,
devm will free the clock structures without disabling them, permanently
leaking the clock references.

Should the driver synchronously suspend the device before disabling runtime=
 PM?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630102717.4135=
01-1-herve.codina@bootlin.com?part=3D2
