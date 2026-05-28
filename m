Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59AD3EBF37
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 12:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779972923; cv=none; b=F/qKyvSuaXEM0tbCmkT+1o5uavcq27CqH35UEGNsUZ8pLcVyJWUkVPnFNRIw7EhTkcvVmvDgoQSoQ8cGWlESAEPXpODxfZicUeLNpx3fsM8pJbVDZRWn3BXh/xOTUJc2I3CoVidj9k0MW4paVW9vnvCDigyEBPXh1yohrBIwE9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779972923; c=relaxed/simple;
	bh=f/CUg013T1EP0sWmSQDXL8N0/FozcRSk7zEjdCog5uE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HDQkHKX1KeQV+/yT20W0Xi/RztLxkQRCYR8bkhtfU1bKT3+3dEox/LuVz2wQhQQxMlvgMPoUNzvGC1Nv+/qijhQSQ3pE4J5w8lZoQ5hZ6r4Xxu0Jo8By/tkAbT3PgOFKl/PUc71s6MytpFLxepw3SL4vwks4HBX6xD9pjg+QFkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwhnEXCD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwhnEXCD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335221F000E9;
	Thu, 28 May 2026 12:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779972921;
	bh=uOBcBfqvPIX2yIU9XbE6+p8WvPIoCD5tVUkOWVMHxRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hwhnEXCDHg+wksHkqowv7ruHYyb+7yeWKjGo8vpfQVrfTsQJooZQ5LRzZxkg6Yk1V
	 A1LLgFH1IDP/cedD1uIikY4AtBVIKquAwQZTGL9cV/uxCutaVXZnTEHMtr4Hcvt+9q
	 RF7X/gpPMFqNKqSj81RwBCfRL4AwUIGoqAtvMW4BXxdBIVFSRZ7j6tnlD3dkdzu91S
	 4+0g8s9pg5cZvuX3KZsWkmo4ZksSFkHPdRxTFiMh0NQFiRRqgMFzwqor5M5ynNuvuU
	 jDrtKRoH813UOOGsJcSYi2ix2apsBcG9EJfr4BJXP3pLu+ZZu7Cn/Dh/0ZL0nv8Yc4
	 BmZmu5oWlA/0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/5] thermal: samsung: Add Exynos ACPM TMU driver
 GS101
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260528-acpm-tmu-v6-2-b4d7ce57594b@linaro.org>
References: <20260528-acpm-tmu-v6-2-b4d7ce57594b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 12:55:20 +0000
Message-Id: <20260528125521.335221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Thermal zone thresholds are never initialized because sensors are =
enabled too late during probe.
- [High] Missed thermal interrupts due to clearing the interrupt pending fl=
ag after updating the thermal zone.
- [High] A failure during system suspend permanently disables thermal mitig=
ation.
- [Medium] Mixing goto-based error handling with guard() cleanup in the sam=
e function.
- [Medium] Failure to roll back partially enabled sensors if acpm_tmu_contr=
ol(true) fails.
- [Medium] Race condition in acpm_tmu_get_temp() reading sensor->enabled ou=
tside of sensor->lock.
- [Medium] Asynchronous runtime PM suspend queued by acpm_tmu_set_trips can=
 be cancelled by devm_pm_runtime_disable during driver removal.
--

commit 90afa895cf46b40d05a7597e89b586da2a473318
Author: Tudor Ambarus <tudor.ambarus@linaro.org>

thermal: samsung: Add Exynos ACPM TMU driver GS101

Add driver for the Thermal Management Unit (TMU) managed via the Alive
Clock and Power Manager (ACPM), found on Samsung Exynos SoCs such as
Google GS101 (and Exynos850, autov920, etc.).

> diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung=
/acpm-tmu.c
> new file mode 100644
> index 0000000000000..b56869c9fc3b1
> --- /dev/null
> +++ b/drivers/thermal/samsung/acpm-tmu.c
[ ... ]
> +static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on)
> +{
[ ... ]
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
> +		if (ret) {
> +			if (!err)
> +				err =3D ret;
> +
> +			/* On enable, stop on first error. On disable, keep going */
> +			if (on)
> +				break;

[Severity: Medium]
If an error occurs when `on` is true, the loop breaks immediately. Does this
leave the previously enabled sensors active in the ACPM firmware?

If this happens during probe, will the lack of hardware state rollback
result in unhandled spurious interrupts?

> +		}
> +	}
> +
> +	pm_runtime_put_sync(dev);
> +	return err;
> +}
> +
> +static int acpm_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +	struct acpm_tmu_sensor *sensor =3D thermal_zone_device_priv(tz);
> +	struct acpm_tmu_priv *priv =3D sensor->priv;
> +	struct acpm_handle *handle =3D priv->handle;
> +	const struct acpm_tmu_ops *ops =3D &handle->ops->tmu;
> +	struct device *dev =3D priv->dev;
> +	int acpm_temp =3D 0, ret;
> +
> +	if (!sensor->enabled)

[Severity: Medium]
Is there a race condition here since `sensor->enabled` is checked before
acquiring `sensor->lock`?

If `acpm_tmu_control(priv, false)` runs concurrently (e.g., via system
suspend), it could set `sensor->enabled =3D false` just before the lock is
acquired here. Could this result in calling `ops->read_temp()` on a disabled
sensor?

> +		return -EAGAIN;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	scoped_guard(mutex, &sensor->lock) {
> +		ret =3D ops->read_temp(handle, priv->mbox_chan_id,
> +				     sensor->group->id, &acpm_temp);
> +	}
[ ... ]
> +static int acpm_tmu_update_thresholds(struct acpm_tmu_sensor *sensor,
> +				      u8 thresholds[2], u8 inten)
> +{
> +	struct acpm_tmu_priv *priv =3D sensor->priv;
> +	struct acpm_handle *handle =3D priv->handle;
> +	const struct acpm_tmu_ops *ops =3D &handle->ops->tmu;
> +	unsigned int mbox_chan_id =3D priv->mbox_chan_id;
> +	u8 acpm_sensor_id =3D sensor->group->id;
> +	bool was_enabled;
> +	int ret, restore_ret;
> +
> +	guard(mutex)(&sensor->lock);

[Severity: Medium]
Is it ok to mix `guard()` with `goto`-based error handling in this function?
According to the cleanup guidelines, functions should either convert all
resources to scope-based cleanup or convert none of them.

> +
> +	was_enabled =3D sensor->enabled;
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
> +		goto err_restore;
[ ... ]
> +static irqreturn_t acpm_tmu_thread_fn(int irq, void *id)
> +{
[ ... ]
> +		handled =3D true;
> +
> +		thermal_zone_device_update(sensor->tzd,
> +					   THERMAL_EVENT_UNSPECIFIED);
> +
> +		scoped_guard(mutex, &sensor->lock) {
> +			ret =3D ops->clear_tz_irq(handle, priv->mbox_chan_id,
> +						sensor->group->id);

[Severity: High]
Could clearing the interrupt after updating the thermal zone cause missed
events?

If the temperature crosses a newly programmed threshold during
`thermal_zone_device_update()`, the hardware could assert a new interrupt.
Calling `clear_tz_irq()` afterwards would clear this new interrupt,
potentially missing critical thermal events.

> +			if (ret)
> +				dev_err(priv->dev, "Sensor %d: failed to clear IRQ (%d)\n",
> +					i, ret);
> +		}
> +	}
[ ... ]
> +static int acpm_tmu_probe(struct platform_device *pdev)
> +{
[ ... ]
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
Are the thermal zones registered before the sensors are fully enabled?

During `devm_thermal_of_zone_register()`, the thermal core attempts to
initialize thresholds, but since `sensor->enabled` is false,
`acpm_tmu_get_temp()` returns `-EAGAIN` and the update aborts.

Since `acpm_tmu_control()` below does not trigger a thermal zone update,
will the initial thresholds remain uninitialized in the hardware?

> +		if (IS_ERR(sensor->tzd)) {
[ ... ]
> +	ret =3D acpm_tmu_control(priv, true);
> +	if (ret) {
> +		ret =3D dev_err_probe(dev, ret, "Failed to enable TMU\n");
> +		goto err_pm_put;
> +	}
[ ... ]
> +static void acpm_tmu_remove(struct platform_device *pdev)
> +{
> +	struct acpm_tmu_priv *priv =3D platform_get_drvdata(pdev);
> +
> +	/* Stop IRQ first to prevent race with thread_fn */
> +	disable_irq(priv->irq);
> +
> +	acpm_tmu_control(priv, false);

[Severity: Medium]
If `acpm_tmu_set_trips()` queues an asynchronous suspend via
`pm_runtime_put_autosuspend()` shortly before driver removal, could the
implicit `pm_runtime_disable()` from `devm_pm_runtime_enable()` cleanup
cancel it?

Would this cause the hardware to remain powered on since the usage count
drops but the actual suspend is never executed? Should this use a
synchronous suspend before removal?

> +}
> +
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
> +
> +	/* APB clock not required for this specific msg */
> +	return ops->suspend(handle, priv->mbox_chan_id);

[Severity: High]
If `ops->suspend()` returns an error, the system suspend is aborted. Since
the PM core won't invoke the resume callback on failure, and there is no
rollback here, will the TMU sensors remain permanently disabled while the
system continues running?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528-acpm-tmu-v=
6-0-b4d7ce57594b@linaro.org?part=3D2
