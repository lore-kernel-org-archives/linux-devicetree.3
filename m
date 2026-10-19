Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792447067;
	b=c4Ir/rFJDQKNs8XoBRpebfr/exUxZ6HX7DWBbO0kmSSnkYnPwU8S5OlyKWKAZSs+FSgH
	 qhsJGpAiSFyriTDxQDVzN1HelzV3uzKZr5GgSyl6I8tcKsghHNX+WyUoDBVrcmk5TTLmu
	 zAPkMo7qCcxuR5oc6QwmuHk3/Jx+u85NgfZcOGtBYl/Pd6/x2owDDRmdjFvzRURTPH8RN
	 f/+D9LweZTjTmZ/X7PLCaBqZ08sz+aD48T0KBHRCwiNdrzArTeibHW73Qz2fIBw0Ho9ib
	 Rr4O0H/Xq4czmE2wp10sXkt9Y0IE/udD//se9fO2HQhPPK1JAeTx/FQWjVTbCHtWrIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447067;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ebQwFO9t8v0ErC3ctSxyDJiFZHDtRywb9LeJXVIlFwk=;
	b=2Cm/JGBfIzHU9QDeTAT2na0RqgJKQwbHs+pXinOTRqAJ13eRmLDKaxRsd6Rnb7/7hRKs
	 FjHFFJ5f/hDTm3723AFqoVDrucg3sRt+lzNgUdf9rH85217dwRoT5CKGeYw/mJHCtBcu3
	 ElBslfU+9Ornfn74XQcQ0/2yhu7U6pwthIi2OuZ2Xr8WfOXqsZIAKtQy7hJb7WQNBWPYN
	 OKK6ir6IO1fBxGuI593xhO0FMQamckRt7qOEHu1ytii2l3YKcU2P3XZdAdCFDZ17QdeDX
	 E1HgSGApkExPV9ZpFixk3GxUrdWZ/uD2dfZ5R+aQ0SmkckMgIJXRUWu/SDsoXscdxlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c1zrwclJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2362606A319
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 21:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c1zrwclJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072D81F000C4;
	Mon, 19 Oct 2026 21:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792447066;
	bh=ebQwFO9t8v0ErC3ctSxyDJiFZHDtRywb9LeJXVIlFwk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c1zrwclJa++9k1HDbflTwOQgcfMekTyI2ZveBVfTKRtlQsarNBECItrmhvczcsZe7
	 pQLf4dtZDkY9d3RNBVLSE8F/X59a2TI/gaJYrML95XTOMRMt+hnSAzlMU4gXwHDeXP
	 ZIn3u2NXIilvLlpT/6/FofbJh2aJSAFiTVw9Lk9y3d5U8eZsTZQNZ5U0oilWC4pteR
	 pxo0U1Dpb8hIMi2c4gjpYaACJF8LmVO9XUgXOxG+wnB49hrHNo+FJpItLajB7ZjWse
	 Yyti8vgrd9LBcT0mndPVMi/IJoH6vidj6qKqCY1aBYWgua+M3dhaEBBOncYxJNAGSc
	 WC2tiMXIggqQA==
Message-ID: <sashiko-outbox-178283@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/14] drm/solomon: ssd16xx: Add power management
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Devarsh Thakkar" <devarsht@ti.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019213726.4145532-8-devarsht@ti.com>
References: <20261019213726.4145532-1-devarsht@ti.com>
 <20261019213726.4145532-8-devarsht@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 21:57:45 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] drm/solomon: ssd16xx: missing error rollback in ssd16xx_pm_suspend=
()
- [Medium] drm/solomon: ssd16xx: missing state restore in ssd16xx_pm_runtim=
e_resume()
- [Medium] drm/solomon: ssd16xx: premature runtime suspend in ssd16xx_probe=
()
- [Medium] drm/solomon: ssd16xx: incomplete PM error cleanup in ssd16xx_pro=
be()
--

commit 7bb59d973ba345233d1093837dd50809ed285f26
Author: Devarsh Thakkar <devarsht@ti.com>

drm/solomon: ssd16xx: Add power management support

This patch adds runtime PM with a 35-second autosuspend delay and system
suspend/resume support to the SSD16xx e-paper display driver.

> diff --git a/drivers/gpu/drm/solomon/ssd16xx.c b/drivers/gpu/drm/solomon/=
ssd16xx.c
> index ff0e459082dea..99f11b7ec03e9 100644
> --- a/drivers/gpu/drm/solomon/ssd16xx.c
> +++ b/drivers/gpu/drm/solomon/ssd16xx.c

[ ... ]

> @@ -2011,9 +2059,26 @@ static int ssd16xx_probe(struct spi_device *spi)
> =20
>  	drm_mode_config_reset(drm);
> =20
> +	/*
> +	 * Mark the device active before enabling runtime PM.  The SPI device
> +	 * persists across module reload cycles; pm_runtime_enable() alone
> +	 * does not clear a stale dev->power.runtime_error from a previous
> +	 * module load, which would cause pm_runtime_resume_and_get() to
> +	 * return -EINVAL on every subsequent call.
> +	 */
> +	/* Use level1 (RAM retained) for runtime PM idle. */
> +	device->deep_sleep_mode =3D device->controller_cfg->deep_sleep_mode_lev=
el1;
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_set_autosuspend_delay(dev, SSD16XX_PM_AUTOSUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(dev);

[Severity: Medium]
Does calling pm_runtime_set_autosuspend_delay() after pm_runtime_enable()
here cause an immediate synchronous runtime suspend during ssd16xx_probe()?

At the point pm_runtime_set_autosuspend_delay() runs, the device is enabled
with usage_count =3D=3D 0, dev->power.use_autosuspend is still false, and
dev->power.last_busy has not been marked. Inside the runtime PM core:

  pm_runtime_set_autosuspend_delay()
    -> update_autosuspend()
      -> rpm_idle(dev, RPM_AUTO)
        -> rpm_suspend(dev, RPM_AUTO)
          -> pm_runtime_autosuspend_expiration()

Because use_autosuspend is false (and last_busy is 0),
pm_runtime_autosuspend_expiration() returns 0, so rpm_suspend() invokes
ssd16xx_pm_runtime_suspend() synchronously and puts the panel into deep
sleep right after ssd16xx_hw_reset(), only for drm_client_setup() to
immediately wake and hardware-reset the panel a second time.

Should pm_runtime_set_autosuspend_delay(), pm_runtime_use_autosuspend(), and
pm_runtime_mark_last_busy() be called before pm_runtime_enable()?

> +
>  	ret =3D drm_dev_register(drm, 0);
> -	if (ret)
> +	if (ret) {
> +		pm_runtime_disable(dev);
>  		return ret;
> +	}

[Severity: Medium]
If drm_dev_register() fails in ssd16xx_probe(), is pm_runtime_disable(dev)
alone sufficient to clean up the runtime PM state?

Because pm_runtime_reinit() on unbind does not clear
dev->power.use_autosuspend or run the runtime_suspend callback, only calling
pm_runtime_disable(dev) leaves use_autosuspend enabled on the persistent
spi_device and leaves the panel powered if it is still active. Should this
error path call pm_runtime_dont_use_autosuspend(dev) and
pm_runtime_force_suspend(dev) to match ssd16xx_remove() and
ssd16xx_shutdown()?

> =20
>  	drm_dbg(drm, "SSD16xx e-paper display initialized (%dx%d, %d=C2=B0 rota=
tion)\n",
>  		device->width, device->height, device->orientation);
> @@ -2029,6 +2094,12 @@ static void ssd16xx_remove(struct spi_device *spi)
> =20
>  	drm_dev_unplug(&device->drm);
>  	drm_atomic_helper_shutdown(&device->drm);
> +	pm_runtime_dont_use_autosuspend(&spi->dev);
> +	/*
> +	 * Put the panel to sleep regardless of clear_on_disable, which can make
> +	 * atomic_disable skip touching the hardware.
> +	 */
> +	pm_runtime_force_suspend(&spi->dev);
>  }
> =20
>  static void ssd16xx_shutdown(struct spi_device *spi)
> @@ -2036,8 +2107,139 @@ static void ssd16xx_shutdown(struct spi_device *s=
pi)
>  	struct ssd16xx_device *device =3D spi_get_drvdata(spi);
> =20
>  	drm_atomic_helper_shutdown(&device->drm);
> +	pm_runtime_dont_use_autosuspend(&spi->dev);
> +	pm_runtime_force_suspend(&spi->dev);
>  }
> =20
> +static int ssd16xx_pm_suspend(struct device *dev)
> +{
> +	struct ssd16xx_device *device =3D dev_get_drvdata(dev);
> +	struct drm_device *drm =3D &device->drm;
> +	int ret;
> +
> +	/* Use level2 deep sleep for system suspend; SSD1683 loses RAM but save=
s more power. */
> +	device->deep_sleep_mode =3D device->controller_cfg->deep_sleep_mode_lev=
el2;
> +	dev_dbg(dev, "system suspend: entering deep sleep mode 0x%02x\n",
> +		device->deep_sleep_mode);
> +
> +	ret =3D drm_mode_config_helper_suspend(drm);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * If the autosuspend timer already fired the device is RPM_SUSPENDED
> +	 * at level1.  pm_runtime_force_suspend() would skip its callback, so
> +	 * level2 would never reach the hardware.
> +	 *
> +	 * SPI is unresponsive in deep sleep; HWRESET is the only exit.
> +	 * After the reset, level2 can be sent directly without a full hw_init.
> +	 *
> +	 * Skip this for controllers where level1 =3D=3D level2 (e.g. SSD1677 w=
hich
> +	 * has only one deep sleep mode): the device is already in the deepest
> +	 * available state and no upgrade is needed.
> +	 */
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
> +
> +	/* Force runtime-suspended state for clean resume. */
> +	ret =3D pm_runtime_force_suspend(dev);
> +	if (ret) {
> +		drm_mode_config_helper_resume(drm);
> +		return ret;
> +	}
> +	device->pm_force_suspended =3D true;  /* Resume must call force_resume =
*/
> +
> +	return 0;
> +}

[Severity: High]
What happens in ssd16xx_pm_suspend() if an error occurs during the
pm_runtime_status_suspended(dev) upgrade path, or if
drm_mode_config_helper_suspend() or pm_runtime_force_suspend() fails?

In the pm_runtime_status_suspended(dev) branch, if ssd16xx_wait_for_device()
times out or ssd16xx_send_cmd()/ssd16xx_send_data() fails,
ssd16xx_pm_suspend() returns err directly without calling
drm_mode_config_helper_resume(drm). Because the suspend callback returns an
error, the PM core aborts system suspend and will not call
ssd16xx_pm_resume(), which leaves the DRM modeset pipeline and in-kernel
clients suspended, leaks drm->mode_config.suspend_state, and leaves the
panel awake after ssd16xx_hw_reset() while runtime PM status remains
RPM_SUSPENDED.

In addition, device->deep_sleep_mode is overwritten with
deep_sleep_mode_level2 at the start of ssd16xx_pm_suspend() and is never
restored to deep_sleep_mode_level1 on any of the three failure paths
(drm_mode_config_helper_suspend() failure, the level1->level2 upgrade
failure, or pm_runtime_force_suspend() failure). Wouldn't that cause all
subsequent runtime PM idle suspends to enter level-2 sleep (0x03) and lose
display RAM?

[ ... ]

> +static int ssd16xx_pm_runtime_resume(struct device *dev)
> +{
> +	struct ssd16xx_device *device =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	dev_dbg(dev, "runtime resume: initialized=3D%d%s\n",
> +		device->initialized,
> +		!device->initialized ? " (running hw_init)" : "");
> +
> +	/*
> +	 * pm_runtime_suspend clears initialized after sending the deep sleep
> +	 * command.  If a new app opens before the suspend fires (the put was
> +	 * cancelled), initialized is still true and hw_init is unnecessary.
> +	 */
> +	if (!device->initialized) {
> +		ret =3D ssd16xx_hw_init(device);
> +		if (ret)
> +			return ret;
> +
> +		device->initialized =3D true;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
When ssd16xx_pm_runtime_resume() runs ssd16xx_hw_init() while the CRTC is
already enabled, does it leave the border waveform register and refresh
state out of sync with the driver state?

ssd16xx_hw_init() issues both ssd16xx_hw_reset() and SSD16XX_CMD_SW_RESET,
which resets SSD16XX_CMD_BORDER_WAVEFORM_CONTROL (0x3C) to its power-on
default without reprogramming it. In ssd16xx_fb_dirty(), register 0x3C is
only written when border_refresh_on_every_update, init_refresh_pending, or
border_waveform_pending is set:

	if (device->border_refresh_on_every_update || device->init_refresh_pending=
 ||
	    device->border_waveform_pending) {
		u8 idx =3D device->border_waveform_update_idx;
		u8 border =3D device->controller_cfg->border_waveform_table[idx];
		...
		ssd16xx_send_cmd(device, SSD16XX_CMD_BORDER_WAVEFORM_CONTROL, &err);
		ssd16xx_send_data(device, border, &err);
		device->border_waveform_pending =3D false;
	}

When waking from runtime suspend in ssd16xx_plane_atomic_update(),
ssd16xx_crtc_atomic_enable() does not run, so if
border_refresh_on_every_update is false and the pending flags were already
consumed before autosuspend, register 0x3C is never restored to
border_waveform_update_idx.

Also, on controllers where deep_sleep_mode_level1 is 0x03 (such as SSD1677),
controller RAM is lost during runtime suspend. Without re-arming
init_refresh_pending (or forcing a full refresh), wouldn't the next update
in SSD16XX_REFRESH_PARTIAL mode compare the new BW RAM against lost RED RAM?
Finally, the commit message mentions that level-1 sleep allows fast resume
via SPI wakeup, whereas ssd16xx_pm_runtime_resume() always calls
ssd16xx_hw_init() which performs a full GPIO hardware reset.

[ ... ]

>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019213726.4145=
532-1-devarsht@ti.com?part=3D7
