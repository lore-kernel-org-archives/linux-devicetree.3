Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F3F1FC0EA
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 17:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780420487; cv=none; b=f2Q4/cxVmxlL/b+pzvcHU16woLmiC8VOumuseQNeJ7Dd5qdEdnJRluldI0+0VZj1vEUNcmJsR+dV8ZU9ffXT6Qh7bjyNyzt8aolH8LTEGk4Fsgvvl+IVSSV8+XbpDM9uzyt4YVlNDF7/Y7Wjmdr1K4uAbhN/VydZ4Q323Oux+hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780420487; c=relaxed/simple;
	bh=nMJcULgDmaeAC7uBcRECV7mVzP8V15oFpYniCVGpers=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k2TY3T3bf8pOlbDb5ccB8+pt6xAawVn2R/sgdJOVaZMQhjKhYz4VMgx98SZSLUjf6EWbe6XmYOzjCPIEflo2+4KZwaq8yxCUNkcVU+NFP21hyXXugZJx9sx1OE4/drXg4Ycpo1bEtpopj+Pz1ma4y6RwYFPWtuO+7FCy6gRSN18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=om0e5RKS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="om0e5RKS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD581F00893;
	Tue,  2 Jun 2026 17:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780420484;
	bh=Vst91F7BzWhCaDjmKnnll5IiyCaLT7B6YUTKWt9mpjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=om0e5RKSfBNwZaBNUY6uepoGjEghD1DuIoLk9dultWBzBvU7+KO5hvpGMJTkSO9bY
	 qae00XurwnAo8jx89qGmEZVQ04PC65Zs+LYOaknsAYjUt6H58hkZuIALaFwdyWSJbi
	 x7IuDjFwyIOlhSUbYzCFg+wMEXnAEvSvjijDjmxQdCNyXC/RRRZa/Yki6+3kveR0j3
	 GV/nlaVmYvrIHsUtRhti4yFg20hXIST1mjGpEC9lSSPOgx6BcopBXwLHfr9lo2Tf+K
	 Pyzqwh/+QulJ96Lf0oB2JMLisErtk3+tFZtgb6QrH72F2z7jB5SObUZM5HrzNGOm/M
	 0IlA8LaMQ0igw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/5] thermal: samsung: Add Exynos ACPM TMU driver
 GS101
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260602-acpm-tmu-v7-2-8047dd54b0e9@linaro.org>
References: <20260602-acpm-tmu-v7-2-8047dd54b0e9@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 17:14:43 +0000
Message-Id: <20260602171444.2AD581F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing Error Rollback in `acpm_tmu_suspend` leaves thermal sensor=
s permanently disabled if system suspend fails.
- [High] Clock and power leak during probe error path and system sleep due =
to autosuspend preventing synchronous runtime suspend.
- [Medium] Kconfig dependency allows COMPILE_TEST without EXYNOS_ACPM_PROTO=
COL, leading to a linker error.
--

commit 72d6aa9ba0b741ec961e0a99b3827f24785a2e52
Author: Tudor Ambarus <tudor.ambarus@linaro.org>

thermal: samsung: Add Exynos ACPM TMU driver GS101

Add driver for the Thermal Management Unit (TMU) managed via the Alive
Clock and Power Manager (ACPM), found on Samsung Exynos SoCs such as
Google GS101 (and Exynos850, autov920, etc.).

> diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kc=
onfig
> index f4eff5a41a84c..383ae3f56cbb2 100644
> --- a/drivers/thermal/samsung/Kconfig
> +++ b/drivers/thermal/samsung/Kconfig
[ ... ]
> @@ -9,3 +9,22 @@ config EXYNOS_THERMAL
>  	  the TMU, reports temperature and handles cooling action if defined.
>  	  This driver uses the Exynos core thermal APIs and TMU configuration
>  	  data from the supported SoCs.
> +
> +config EXYNOS_ACPM_THERMAL
> +	tristate "Exynos ACPM thermal management unit driver"
> +	depends on THERMAL_OF
> +	depends on HAS_IOMEM
> +	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOC=
OL)

[Severity: Medium]
Does this dependency rule permit compilation when the underlying protocol
is not built, leading to a linker error?

The Kconfig option explicitly allows compilation when COMPILE_TEST is
enabled and EXYNOS_ACPM_PROTOCOL is disabled. However, the driver
unconditionally calls devm_acpm_get_by_phandle() in acpm_tmu_probe().

Since include/linux/firmware/samsung/exynos-acpm-protocol.h does not
provide empty inline stub implementations for these APIs when the
protocol is disabled, building the driver in this configuration might
result in an unresolved symbol error at link time.

> diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung=
/acpm-tmu.c
> new file mode 100644
> index 0000000000000..2de34b03b9eab
> --- /dev/null
> +++ b/drivers/thermal/samsung/acpm-tmu.c
[ ... ]
> +err_rollback:
> +	acpm_tmu_control_rollback(priv, i - 1);
> +err_pm_put:
> +	pm_runtime_put_sync(dev);
> +	return ret;
> +}

[Severity: High]
Will this leak the clock and power during the probe error path?

The driver enables runtime PM autosuspend with a 100ms delay. On error paths
in acpm_tmu_probe(), pm_runtime_put_sync() is called. Because autosuspend
is active, this drops the usage count but only schedules an asynchronous
suspend, leaving the device active.

When the probe function returns the error, devres cleanup automatically
invokes pm_runtime_disable(), which cancels the pending autosuspend timer.
The device gets permanently stuck in an active state, the runtime suspend
callback is never invoked, and the clock is leaked.

[ ... ]
> +static int acpm_tmu_suspend(struct device *dev)
> +{
> +	struct acpm_tmu_priv *priv =3D dev_get_drvdata(dev);
> +	struct acpm_handle *handle =3D priv->handle;
> +	const struct acpm_tmu_ops *ops =3D &handle->ops->tmu;
> +	int ret;
> +
> +	ret =3D acpm_tmu_control(priv, false);
> +	if (ret)
> +		return ret;

[Severity: High]
Should this roll back the partially disabled thermal sensors on failure?

If acpm_tmu_control() fails, the driver immediately returns the error.
Because acpm_tmu_control() is designed to continue processing even if an
individual sensor fails to disable, a failure return implies that some
sensors may have been successfully disabled while others failed.

Returning an error aborts the system suspend transition, meaning the PM
core assumes the device is still active and will not invoke the resume
callback. The successfully disabled sensors are thus left disabled
indefinitely, which silently breaks thermal mitigation on an active system.

Should we call acpm_tmu_control(priv, true) on failure, similar to the
existing rollback logic for ops->suspend()?

[Severity: High]
Additionally, will this leak the clock during system sleep due to autosuspe=
nd?

acpm_tmu_control() calls pm_runtime_put_sync(), which schedules an
autosuspend. During the subsequent suspend_late phase, the PM core calls
pm_runtime_disable(), cancelling the timer. The device remains active, and
its clock remains enabled throughout the entire system sleep duration.

It looks like acpm_tmu_remove() mitigates this by calling
pm_runtime_dont_use_autosuspend() before dropping the reference. Could a
similar fix be applied here and in the probe error paths?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-acpm-tmu-v=
7-0-8047dd54b0e9@linaro.org?part=3D2
