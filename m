Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3180B3C818D
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 18:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534483; cv=none; b=bQacG3RKNvV9bGaDoZEPzTVGbHrZnaNLzpL0nheL3Byjw8kFlgf4Q1oLxyVHXoM8XZGyUeIFLyonSYcHG9N6a7eKi9hy08h+F9z6KTd42cjRe5sAs49/DKO5Va/qBDANLRxRWeQn8s9tdRyD4pRT+nvOb9NRl78LI88FPqzONM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534483; c=relaxed/simple;
	bh=ZEZ4Pk2I20EPLxK99ybQTgm+CKq52Ik4ZGT5uC/p3TE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=slF0DYolxKlbKVUFs0fXtw5vr3FeSVmPdOwkEz9d5nJYRgWGyBkyezsobs2Or2AtlGPqHU86PTZpnIUg2cKXGmmYUHz1cLgRLBBRu9+2JJ3j8duDsS8+9Pdb5xxnw1nwhuDDXI8m2biZPWOjgon+h2z6St4ZtgbFslAPZZ7V0xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8rv6una; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8rv6una"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980541F000FF;
	Sun, 27 Sep 2026 18:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790534481;
	bh=R6Jexkl5+0KVkXMxC6EZ7Q7deQB86sb915iFIalUtsc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O8rv6una4JlXJ47ZsgEQ1p1xB2dCeEySbxCrE8jH1Im8WS74V0EXmXkvOGKQOUP6I
	 S9Ma45RHgqC1S6HsZvppQOxeiZcBmy/Fp5sDPM6bTzx1zA48ddEq6wZ0EfpIRHfndA
	 h7xGok6JQDoc3L8j20PHo/yxl2jiYBolqF3g8lyObwmirT2f4+ckxkW+mI0GDyo5Vo
	 aiXwfZ+zIwCenanYH5fwZaVwfOyOtQt1ONOnHdBvZijw8d8D0YjmMduQ3cRTXaKcbY
	 cQq+I4AVHtkOXzhAdyMtzREclgWqQ7VTpLaTJEjHkWgnyM1acwCgJH6m9j5XMXeAZB
	 OR5xg7AZ0LWcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/14] drm/solomon: ssd16xx: Add power management
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Devarsh Thakkar" <devarsht@ti.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260927182329.4193961-8-devarsht@ti.com>
References: <20260927182329.4193961-1-devarsht@ti.com>
 <20260927182329.4193961-8-devarsht@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 18:41:21 +0000
Message-Id: <20260927184121.980541F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] drm/pm: System suspend aborts without rolling back DRM state
- [High] drm/pm: Transient runtime suspend failures permanently brick displ=
ay
- [High] drm/pm: Ignoring pm_runtime_force_suspend error underflows disable=
_depth
- [High] drm/atomic: Sleeping functions called from atomic context
- [Medium] drm/pm: Double hardware initialization during system resume
- [Medium] drm/pm: Hardware remains powered indefinitely upon driver removal
- [Medium] drm/pm: Autosuspend timer is never started after probe
--

commit 6dc9572b54afb59f2f6005e0c8a2cc022b179d13
Author: Devarsh Thakkar <devarsht@ti.com>
Subject: drm/solomon: ssd16xx: Add power management support

This commit adds runtime and system suspend/resume power management to the
SSD16xx e-paper display driver. It implements a two-level deep-sleep
strategy to allow light sleep across typical userspace update bursts and
maximum power savings on system suspend.

> diff --git a/drivers/gpu/drm/solomon/ssd16xx.c b/drivers/gpu/drm/solomon/=
ssd16xx.c
> index 93fa064cf5894..6255f434248ae 100644
> --- a/drivers/gpu/drm/solomon/ssd16xx.c
> +++ b/drivers/gpu/drm/solomon/ssd16xx.c

[ ... ]

> @@ -1425,11 +1435,16 @@ static void ssd16xx_plane_atomic_update(struct dr=
m_plane *plane,
>  	struct drm_rect rect;
>  	int ret;
> =20
> -	drm_dbg(&device->drm, "plane_atomic_update: fb=3D%p, initialized=3D%d\n=
",
> -		fb, device->initialized);
> +	drm_dbg(&device->drm, "plane_atomic_update: fb=3D%p\n", fb);
> +
> +	if (!fb)
> +		return;
> =20
> -	if (!fb || !device->initialized)
> +	ret =3D pm_runtime_resume_and_get(device->drm.dev);
> +	if (ret < 0) {

[Severity: High]
Does this call pm_runtime_resume_and_get() from an atomic context?

According to DRM subsystem guidelines, plane atomic update callbacks
execute in an atomic context where sleeping is forbidden. Since
pm_runtime_resume_and_get() can sleep (and the underlying hardware
reset uses usleep_range()), could this lead to kernel warnings or
deadlocks?

> +		drm_err(&device->drm, "plane_atomic_update: failed to resume: %d\n", r=
et);
>  		return;
> +	}
> =20
>  	if (!drm_atomic_helper_damage_merged(old_state, new_state, &rect)) {
>  		rect.x1 =3D 0;

[ ... ]

> @@ -1620,6 +1661,13 @@ static void ssd16xx_crtc_atomic_flush(struct drm_c=
rtc *crtc,
>  	if (!drm_dev_enter(&device->drm, &idx))
>  		return;
> =20
> +	ret =3D pm_runtime_resume_and_get(device->drm.dev);
> +	if (ret < 0) {

[Severity: High]
Similar to the plane atomic update, does this call
pm_runtime_resume_and_get() from the atomic flush path?=20

CRTC atomic callbacks also run in an atomic context where sleeping is
forbidden, so this sleeping call might trigger kernel warnings or deadlocks.

> +		drm_err(&device->drm, "atomic_flush: failed to resume: %d\n", ret);
> +		drm_dev_exit(idx);
> +		return;
> +	}
> +
>  	drm_dbg(&device->drm, "atomic_flush: reinit, orientation=3D%u=C2=B0\n",
>  		device->orientation);
> =20

[ ... ]

> @@ -2017,9 +2075,26 @@ static int ssd16xx_probe(struct spi_device *spi)
> =20
>  	drm_mode_config_reset(drm);
> =20
> +	/*
> +	 * Mark the device active before enabling runtime PM. The SPI device
> +	 * persists across module reload cycles; pm_runtime_enable() alone
> +	 * does not clear a stale dev->power.runtime_error left by a previous
> +	 * failed hw_init, which would cause pm_runtime_resume_and_get() to
> +	 * return -EINVAL on every subsequent call.
> +	 */
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_set_autosuspend_delay(dev, SSD16XX_PM_AUTOSUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(dev);
> +

[Severity: Medium]
Is the autosuspend timer started after probe?

The device is marked as RPM_ACTIVE via pm_runtime_set_active(), but
it doesn't appear pm_runtime_put_autosuspend() or pm_request_idle() is
called. Could this cause the device to linger in the active state until
userspace attaches and performs an update?

>  	ret =3D drm_dev_register(drm, 0);
> -	if (ret)
> +	if (ret) {
> +		pm_runtime_disable(dev);
>  		return ret;
> +	}
> +
> +	/* Default to runtime sleep mode (RAM retained if supported) */
> +	device->deep_sleep_mode =3D device->controller_cfg->deep_sleep_mode_lev=
el1;
> =20
>  	drm_dbg(drm, "SSD16xx e-paper display initialized (%dx%d, %d=C2=B0 rota=
tion)\n",
>  		device->width, device->height, device->orientation);

[ ... ]

> @@ -2035,6 +2110,8 @@ static void ssd16xx_remove(struct spi_device *spi)
> =20
>  	drm_dev_unplug(&device->drm);
>  	drm_atomic_helper_shutdown(&device->drm);
> +	pm_runtime_dont_use_autosuspend(&spi->dev);
> +	pm_runtime_disable(&spi->dev);
>  }

[Severity: Medium]
If the driver is unloaded while the device is runtime active, and
clear_on_disable is disabled, does this leave the hardware powered on
indefinitely?

Calling pm_runtime_disable() cancels the pending autosuspend timer.
Since a synchronous suspend isn't forced before removal here, could the
display controller remain physically powered and active after the module
is unloaded?

> =20
>  static void ssd16xx_shutdown(struct spi_device *spi)

[ ... ]

> +	if (pm_runtime_status_suspended(dev)) {
> +		int err =3D 0;
> +
> +		if (device->controller_cfg->deep_sleep_mode_level1 !=3D
> +		    device->controller_cfg->deep_sleep_mode_level2) {
> +			dev_dbg(dev, "system suspend: upgrading level1->level2 via HWRESET\n"=
);
> +			ssd16xx_hw_reset(device);
> +			ssd16xx_wait_for_device(device, &err);
> +			ssd16xx_send_cmd(device, SSD16XX_CMD_DEEP_SLEEP_MODE, &err);
> +			ssd16xx_send_data(device,
> +					  device->controller_cfg->deep_sleep_mode_level2,
> +					  &err);
> +		} else {
> +			dev_dbg(dev, "system suspend: already at deepest sleep mode\n");
> +		}
> +		device->initialized =3D false;
> +		device->pm_force_suspended =3D false;  /* Skip force_resume on resume =
*/
> +		return err;
> +	}

[Severity: High]
If an error (like a SPI timeout) occurs when sending the deep sleep
command, does returning the error here abort the suspend without rolling
back the DRM state?

The DRM suspend state was allocated earlier by
drm_mode_config_helper_suspend(drm). If we return err, is that state
permanently leaked, leaving the display frozen since the resume
callback will be skipped?

> +
> +	/* Force runtime-suspended state for clean resume. */
> +	pm_runtime_force_suspend(dev);
> +	device->pm_force_suspended =3D true;  /* Resume must call force_resume =
*/
> +
> +	return 0;
> +}

[Severity: High]
Should the return value of pm_runtime_force_suspend() be checked here?

If it fails, the PM core re-enables runtime PM before returning. If we
ignore the error and proceed to call pm_runtime_force_resume() on wake,
could the unconditional enable drop disable_depth below zero and trigger
kernel warnings?

> +
> +static int ssd16xx_pm_resume(struct device *dev)
> +{
> +	struct ssd16xx_device *device =3D dev_get_drvdata(dev);
> +	struct drm_device *drm =3D &device->drm;
> +
> +	dev_dbg(dev, "system resume: restoring state\n");
> +
> +	/*
> +	 * Only call force_resume if we actually called force_suspend during
> +	 * system suspend. The MODE_1->MODE_2 upgrade path skips force_suspend
> +	 * since the device is already RPM_SUSPENDED.
> +	 */
> +	if (device->pm_force_suspended) {
> +		pm_runtime_force_resume(dev);
> +		device->pm_force_suspended =3D false;
> +	}
> +
> +	/* Restore Mode 1 (RAM retained) for subsequent runtime PM cycles. */
> +	device->deep_sleep_mode =3D device->controller_cfg->deep_sleep_mode_lev=
el1;
> +
> +	/* Hardware must be re-initialized after waking from system sleep */
> +	device->initialized =3D false;
> +

[Severity: Medium]
Does setting device->initialized to false here overwrite the state just
initialized by the pm_runtime_force_resume() callback?

Overwriting this might cause the subsequent atomic enable to incorrectly
fire a redundant hardware reset, introducing unnecessary sleep delays in
the performance-critical system resume path.

> +	return drm_mode_config_helper_resume(drm);
> +}
> +
> +static int ssd16xx_pm_runtime_suspend(struct device *dev)
> +{
> +	struct ssd16xx_device *device =3D dev_get_drvdata(dev);
> +	int err =3D 0;
> +
> +	dev_dbg(dev, "runtime suspend: entering deep sleep mode 0x%02x\n",
> +		device->deep_sleep_mode);
> +
> +	ssd16xx_send_cmd(device, SSD16XX_CMD_DEEP_SLEEP_MODE, &err);
> +	ssd16xx_send_data(device, device->deep_sleep_mode, &err);
> +	device->initialized =3D false;
> +
> +	return err;
> +}

[Severity: High]
If a transient SPI timeout or hardware error occurs, does returning the
error code here propagate the failure to the PM core?

This could transition the device to an unrecoverable RPM_ERROR state,
causing all future atomic updates to instantly fail and essentially
bricking the display until the module is reloaded.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927182329.4193=
961-1-devarsht@ti.com?part=3D7
