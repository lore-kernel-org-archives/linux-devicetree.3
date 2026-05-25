Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E14C349CDD
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715271; cv=none; b=Eewb2Bu69/BEA/tM4qeeaHqJxarQsXjlpx1btZpmGLwO880KQioMzP0y0pIfpsts1Bg6gNR2pYiup6YKtDD/Y5IVIDVXX6TTQ6hS4vIdXs2wDkZimTSNy7+0cVM08bppKaZIFNi0K71izLPae8hNW4dof08/ao72j4gZGtVYEcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715271; c=relaxed/simple;
	bh=1r0R7crfU3GDZCdXOpCw9yY0VigSKBoy6aT48cnbS3E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ff7e2i3C6ZbyeUKdbRFIyTXhCQ8YRaIiHYdIa4oIJL6aIgMkKx8iUPpYqy9xqXw2nhynjq0fDXZ8Crv7xmLYyqO4TBGdVLt4mIrtEs4cBJ/fOm2tZm9pci4gBmlRFcRHxaipxey8NUTLaIXLT2w1P2t596Hd8lMG4bXhxuqzXA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBcz/nZL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBcz/nZL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00BD1F000E9;
	Mon, 25 May 2026 13:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779715270;
	bh=JzXAxMMMf0ID0Zep6DZ2UfudMmKTC4R6XySuiQPQ24Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SBcz/nZLlaajyYLKGgpm786e/5j5KBAMjoNgetPfX4k+ujdyGtsWIXv6R/RhvXRRh
	 q+tT4Vd8dpL8VSENpuNYe+v4dB3IKSuAUK1wAVFSzMs51+nX8h2OdtnTfcy/A1zFm9
	 6JXOUBUui2IF6kTLH4wsA0Xhp3mhP7eTbCHGq3RSLEToCAg0tKpklBwugluIEUb+VT
	 HmmgjHEGWNdxjfcutt8Id/qP5S0wpemlq9eEiumwW2tiD/RHQ10xdZ3lX8rzISVXKJ
	 E/090Ay87jhy6642a8S7kmDUBG3wUpg9bcStkVOUOLuIaNFN5x+7BOKMfdw1jWLXBf
	 oc3YaM+6cEHTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/5] thermal: samsung: Add Exynos ACPM TMU driver
 GS101
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525-acpm-tmu-v5-2-85fde739752e@linaro.org>
References: <20260525-acpm-tmu-v5-2-85fde739752e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 13:21:09 +0000
Message-Id: <20260525132109.E00BD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Initialization order race condition and Use-After-Free in probe fa=
ilure and removal paths.
- [High] Incorrect asynchronous PM put during device removal and system sus=
pend.
- [High] Thermal sensor permanently disabled on threshold update failure.
- [Medium] Unconditional IRQ_HANDLED masks spurious interrupts.
- [Medium] Time-Of-Check to Time-Of-Use race condition in sensor state eval=
uation.
- [Medium] Incomplete cleanup on sensor disable failure.
- [Low] Potential uninitialized stack memory leak.
--

commit ad2d3d6566ebe8d41ffa801ff227d2afbb7dfb15
Author: Tudor Ambarus <tudor.ambarus@linaro.org>

thermal: samsung: Add Exynos ACPM TMU driver GS101

Add driver for the Thermal Management Unit (TMU) managed via the Alive
Clock and Power Manager (ACPM), found on Samsung Exynos SoCs such as
Google GS101 (and Exynos850, autov920, etc.).

> diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung=
/acpm-tmu.c
> new file mode 100644
> index 0000000000000..d4e42b23c0c13
> --- /dev/null
> +++ b/drivers/thermal/samsung/acpm-tmu.c

[ ... ]

> +static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on)
> +{
> +	struct device *dev =3D priv->dev;
> +	int i, ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i =3D 0; i < priv->num_sensors; i++) {
> +		struct acpm_tmu_sensor *sensor =3D &priv->sensors[i];
> +
> +		/* Skip sensors that weren't found in DT */
> +		if (!sensor->tzd)
> +			continue;
> +
> +		mutex_lock(&sensor->lock);
> +		ret =3D acpm_tmu_op_tz_control(sensor, on);
> +		mutex_unlock(&sensor->lock);
> +		if (ret)
> +			break;

[Severity: Medium]
When called with on =3D false during driver removal or system suspend, if
disabling one sensor fails, will this break leave the remaining sensors
active?

> +	}
> +
> +	pm_runtime_put_autosuspend(dev);
> +	return ret;
> +}

[Severity: High]
When acpm_tmu_control() is called during driver removal via
acpm_tmu_remove(), this uses an asynchronous put. Will this pending
asynchronous suspend work be cancelled by pm_runtime_disable() during the
subsequent devres cleanup, leaving the hardware in an active power state?

[ ... ]

> +static int acpm_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +	struct acpm_tmu_sensor *sensor =3D thermal_zone_device_priv(tz);
> +	struct acpm_tmu_priv *priv =3D sensor->priv;
> +	struct acpm_handle *handle =3D priv->handle;
> +	const struct acpm_tmu_ops *ops =3D &handle->ops->tmu;
> +	struct device *dev =3D priv->dev;
> +	int acpm_temp, ret;

[Severity: Low]
Can acpm_temp be used uninitialized here?=20

If ops->read_temp() returns 0 without writing to acpm_temp, will this expose
uninitialized stack memory to user-space?

> +
> +	if (!sensor->enabled)
> +		return -EAGAIN;

[ ... ]

> +static int acpm_tmu_update_thresholds(struct acpm_tmu_sensor *sensor,
> +				      u8 thresholds[2], u8 inten)
> +{
> +	struct acpm_tmu_priv *priv =3D sensor->priv;
> +	struct acpm_handle *handle =3D priv->handle;
> +	const struct acpm_tmu_ops *ops =3D &handle->ops->tmu;
> +	unsigned int mbox_chan_id =3D priv->mbox_chan_id;
> +	u8 acpm_sensor_id =3D sensor->group->id;
> +	bool was_enabled =3D sensor->enabled;
> +	int ret;
> +
> +	guard(mutex)(&sensor->lock);

[Severity: Medium]
Could there be a race condition evaluating sensor->enabled before acquiring
the lock?=20

If a concurrent thermal callback modifies the state, might was_enabled cache
a stale value and restore the sensor incorrectly at the end of the function?

> +
> +	if (was_enabled) {
> +		ret =3D acpm_tmu_op_tz_control(sensor, false);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret =3D ops->set_threshold(handle, mbox_chan_id, acpm_sensor_id,
> +				 thresholds, 2);
> +	if (ret)
> +		return ret;

[Severity: High]
If set_threshold() or set_interrupt_enable() fails and returns early here,
will the thermal sensor remain permanently disabled?=20

Should the sensor be restored based on was_enabled even on error paths to
ensure thermal mitigation continues?

> +
> +	ret =3D ops->set_interrupt_enable(handle, mbox_chan_id, acpm_sensor_id,
> +					inten);
> +	if (ret)
> +		return ret;
> +
> +	/* Restore based on cached state. */
> +	if (was_enabled)
> +		ret =3D acpm_tmu_op_tz_control(sensor, true);
> +
> +	return ret;
> +}

[ ... ]

> +static irqreturn_t acpm_tmu_thread_fn(int irq, void *id)
> +{
> +	struct acpm_tmu_priv *priv =3D id;
> +	struct acpm_handle *handle =3D priv->handle;
> +	const struct acpm_tmu_ops *ops =3D &handle->ops->tmu;
> +	struct device *dev =3D priv->dev;
> +	int i, ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to resume: %d\n", ret);
> +		return IRQ_NONE;
> +	}
> +
> +	for (i =3D 0; i < priv->num_sensors; i++) {
> +		struct acpm_tmu_sensor *sensor =3D &priv->sensors[i];
> +		bool pending_irq =3D false;
> +
> +		if (!sensor->tzd)
> +			continue;
> +
> +		ret =3D acpm_tmu_has_pending_irq(sensor, &pending_irq);
> +		if (ret || !pending_irq)
> +			continue;
> +
> +		thermal_zone_device_update(sensor->tzd,
> +					   THERMAL_EVENT_UNSPECIFIED);
> +
> +		scoped_guard(mutex, &sensor->lock) {
> +			ret =3D ops->clear_tz_irq(handle, priv->mbox_chan_id,
> +						sensor->group->id);
> +			if (ret)
> +				dev_err(priv->dev, "Sensor %d: failed to clear IRQ (%d)\n",
> +					i, ret);
> +		}
> +	}
> +
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return IRQ_HANDLED;
> +}

[Severity: Medium]
Will returning IRQ_HANDLED unconditionally defeat the spurious interrupt
detection?=20

If no pending interrupts were found for any sensor, should this return
IRQ_NONE to allow the core IRQ subsystem to detect and handle a potential
IRQ storm?

[ ... ]

> +static int acpm_tmu_probe(struct platform_device *pdev)
> +{
> +	const struct acpm_tmu_driver_data *data =3D &acpm_tmu_gs101;
> +	struct acpm_handle *acpm_handle;
> +	struct device *dev =3D &pdev->dev;
> +	struct acpm_tmu_priv *priv;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	int i, ret;
> +
> +	acpm_handle =3D devm_acpm_get_by_phandle(dev);

[ ... ]

> +	ret =3D devm_request_threaded_irq(dev, priv->irq, NULL,
> +					acpm_tmu_thread_fn, IRQF_ONESHOT,
> +					dev_name(dev), priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request irq\n");
> +
> +	pm_runtime_set_autosuspend_delay(dev, 100);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to resume device\n");
> +
> +	ret =3D acpm_handle->ops->tmu.init(acpm_handle, priv->mbox_chan_id);
> +	if (ret) {
> +		ret =3D dev_err_probe(dev, ret, "Failed to init TMU\n");
> +		goto err_pm_put;
> +	}
> +
> +	for (i =3D 0; i < priv->num_sensors; i++) {
> +		struct acpm_tmu_sensor *sensor =3D &priv->sensors[i];
> +
> +		mutex_init(&sensor->lock);
> +		sensor->group =3D &data->sensor_groups[i];
> +		sensor->priv =3D priv;
> +
> +		sensor->tzd =3D devm_thermal_of_zone_register(dev, i, sensor,
> +							    &acpm_tmu_sensor_ops);

[Severity: High]
Since devres executes cleanups in reverse order of registration, the
thermal zones will be unregistered and freed before the IRQ is disabled.

If an interrupt fires during this window (either on probe failure or driver
removal), will acpm_tmu_thread_fn() access the freed sensor->tzd pointer,
causing a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-acpm-tmu-v=
5-0-85fde739752e@linaro.org?part=3D2
