Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F58B47D935
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780494052; cv=none; b=qXQkAaVWImwxIcgptwIFmtWrATywyJIjQ9C12tonQReibskVo4UG6dUHAE/HqC5EK2z2XcYCFT7IFsITjv+KEyBdB/u/M6HZnIlrDnvbVLEnfdYMzFMNffBd4Yu4c5VhvxLswlULLVlQw4pQv+0EcnV06Wu3oDjkb5mo+1xabxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780494052; c=relaxed/simple;
	bh=KTa8kDHqB5HgTJGX1pwYZfCwMabSYmVK4dpE49l85Gc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RQbxIvxm9OEXlJVh1yPr7Xv14DaZlN4LjcqrY2PayRCshInDVXmGqRVLjlAbxgSUWA78Ij0GvQoPuzM/bTaM5hWHBaVrnTkATMCy0D8RSSImg2xAmCcjZueidCTauPsfBmLmvDhamIYbWL0UWKDBUrvtRv2kGBdgwAQLgMESZcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkJjpFdq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkJjpFdq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC0E1F00893;
	Wed,  3 Jun 2026 13:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780494050;
	bh=3DhuUEuZ4VnWCcYwudKsfoQ2SRMQRLlKbftSR8e22kY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LkJjpFdqEFcntAv04XK6mZaoLc+hEj2rZSC9Z47pJ9eh+En2jLEZn3vDc20jsKx16
	 QE/0gq5F4X0cWjDt9ak6D9064zCSGApqbX5yN8aQGib28dRQhUHroFLa8HdyptlWAO
	 opRGiQ0SH9yTf1ADrKoQ+irBLGfox5LQ5cPJEqfaxaJ0LWxYSjct67tTW/gT076buW
	 BozSueCEzVkgww08npp2ymk/hbHooiPtRNYYYsA8rXk6dsBrNI5GAg0mDmeGHeVWhm
	 5gsjKg4HMdddkkac9GEebUIiB4XJCTzAZATaeG5/TUzevo9tXn1eSblvHNX+3Tjlom
	 zdSzF+mv9r6gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/5] thermal: samsung: Add Exynos ACPM TMU driver
 GS101
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>
References: <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 13:40:50 +0000
Message-Id: <20260603134050.8EC0E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Potential IRQ storm and permanent interrupt shutdown during system=
 suspend due to missing `disable_irq()`.
- [Medium] Device clock leak during module removal or probe error due to co=
ncurrent sysfs access thwarting synchronous PM suspend.
--

commit b26c120c7a5d402216fea8bcbd596b1277417d90
Author: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: thermal: samsung: Add Exynos ACPM TMU driver GS101

This adds a new Thermal Management Unit (TMU) driver for Samsung Exynos SoC=
s=20
like the GS101, which uses the Alive Clock and Power Manager (ACPM). The=20
driver handles direct memory-mapped access for interrupts but delegates=20
functional tasks to ACPM firmware via IPC.

> diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung=
/acpm-tmu.c
> new file mode 100644
> index 0000000000000..f9802080acd7c
> --- /dev/null
> +++ b/drivers/thermal/samsung/acpm-tmu.c

[ ... ]

> +static void acpm_tmu_remove(struct platform_device *pdev)
> +{
> +	struct acpm_tmu_priv *priv =3D platform_get_drvdata(pdev);
> +
> +	/* Stop IRQ first to prevent race with thread_fn */
> +	disable_irq(priv->irq);
> +
> +	/*
> +	 * Disable autosuspend to force the subsequent pm_runtime_put_sync()
> +	 * inside acpm_tmu_control() to synchronously suspend the device
> +	 * immediately, preventing clock leaks when the driver is removed.
> +	 */
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +	acpm_tmu_control(priv, false, false);
> +}

[Severity: Medium]
Since devm_thermal_of_zone_register() is called after devm_pm_runtime_enabl=
e()
in acpm_tmu_probe(), the thermal zones are still active here and devres wil=
l=20
unregister them only after acpm_tmu_remove() returns.

If userspace is concurrently reading sysfs via acpm_tmu_get_temp(), it will=
=20
hold a PM runtime reference. Will the synchronous pm_runtime_put_sync() ins=
ide=20
acpm_tmu_control() fail to actually suspend the device because the usage co=
unt
is greater than zero?

When the concurrent read finishes, it will call pm_runtime_put_autosuspend(=
).=20
Because autosuspend was disabled above, this queues an asynchronous suspend=
.=20
Would devres then continue cleanup and call pm_runtime_disable(), cancellin=
g=20
this pending asynchronous PM work and leaving the device permanently active?

[ ... ]

> +static int acpm_tmu_suspend(struct device *dev)
> +{
> +	struct acpm_tmu_priv *priv =3D dev_get_drvdata(dev);
> +	struct acpm_handle *handle =3D priv->handle;
> +	const struct acpm_tmu_ops *ops =3D &handle->ops->tmu;
> +	int ret, restore_ret;
> +
> +	ret =3D acpm_tmu_control(priv, false, false);
> +	if (ret)
> +		goto err_restore_sensors;
> +
> +	/* APB clock not required for this specific msg */
> +	ret =3D ops->suspend(handle, priv->mbox_chan_id);
> +	if (ret)
> +		goto err_restore_sensors;
> +
> +	ret =3D pm_runtime_force_suspend(dev);
> +	if (ret)
> +		goto err_resume_acpm;
> +
> +	return 0;

[Severity: High]
Unlike acpm_tmu_remove(), this suspend sequence does not call disable_irq().

If a thermal interrupt fires just before or during system suspend, it will=
=20
wake the IRQ thread. When acpm_tmu_thread_fn() runs, it calls=20
pm_runtime_resume_and_get(), which will fail with -EACCES because runtime P=
M=20
is disabled by pm_runtime_force_suspend() here.

Since the thread will return IRQ_NONE without clearing the hardware interru=
pt,
could this lead to an IRQ storm when the IRQ core unmasks the line? If the=
=20
spurious interrupt detector permanently disables the interrupt line, this m=
ight
break thermal monitoring entirely upon system resume.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-acpm-tmu-v=
8-0-0f1810a356e6@linaro.org?part=3D2
