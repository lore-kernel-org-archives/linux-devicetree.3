Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC91485CD2
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 17:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786038101; cv=none; b=fsMlV8CkHefcUjATi6uZY//LeU4Z6wcFolKTam7GQq501id6MhczIcZJ2BmojjTebU12AOqoXBtqomX7ju6vRol6sITNFufGjy3HgriV9BkSrhuFbYd7EoVUla42OX2QUDdTLNL1+g4HJjMq60585pc07gMxiwNTdGw8Q3r6y6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786038101; c=relaxed/simple;
	bh=+JOlyvlosGnr2+Mde1wbFM8B2GHaT87lGLTpnPFOjbA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MBW5sZ+nX+nmjv6Ub7Vf+VrfXFqfh0dzstU7U3Et4fIpZlqxg7Xm+Fk9Dz4+k32tL6pPBDiXWkjW5bTISrlwpWAPrgMjOYwhafWD84dNhWt23vC/DcZeRwGWOUShj2r5smA8Gm7ie1wvHgxuZIjXJbNKPuK3BMA/UQGjFBaYdWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TWit1V+b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TWit1V+b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006971F00A3A;
	Thu,  6 Aug 2026 17:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786038097;
	bh=s3RswFQrUR05cnJHO1BjzALxgHtciCAtUlOx1+pLfDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TWit1V+buqfxMMd8COf0OmFj+cRiPfWQUZMv4h0Q1rDUFsp2Lw8mm7A4b96qSsKAP
	 yARjSKjXYpxcMpDfQAhlBcTfQ6+keJWyrG4b3nP3HapNyDMOeCjAUz8Hcj1gN1fZrA
	 x9HTsbNmSJ5e2x4Q5CE4a/Qg77fjbVkOdIy7MlKscxJwnSNOzY1TuGZ4bfPOvn39nJ
	 6AU/Ljq73h2BT+vysi0t2oi34GZ9z3CoguKK8Vgxe/IAvjzfIYYRQMS9jEjjc+tceJ
	 nqiXfNGicuTN4i0c0mX0tkcNKtZ7sH+Xls7Hio6t1Q2A/aEH2h+gjW0pNGYF7sD4bj
	 eU3lobZF0JsuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 14/21] drm/bridge: synopsys: dw-dp: Add Runtime PM
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-14-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-14-0d508505f383@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 17:41:36 +0000
Message-Id: <20260806174137.006971F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Devm action unmasks the IRQ during driver unload due to skipped ru=
ntime suspend, creating a Use-After-Free window.
- [Medium] Asynchronous pm_runtime_put_autosuspend() in teardown paths race=
s with pm_runtime_disable(), leaving the device powered on.
- [Medium] The return value of dw_dp_runtime_resume() is ignored in dw_dp_p=
robe() when runtime PM is disabled.
--

--- Patch [14]: [PATCH v11 14/21] drm/bridge: synopsys: dw-dp: Add Runtime =
PM support ---
commit af390b7b3091a44b56036dc11fc278ff1a6d55a3
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: drm/bridge: synopsys: dw-dp: Add Runtime PM support

This commit adds runtime power management stubs to the Synopsys DesignWare
DisplayPort bridge driver. It splits the probe function to allow platform
drivers to assign it early so that runtime events can be properly routed.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 3af5b1f643c10..31f944e143ea5 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -1931,6 +1963,9 @@ static int dw_dp_bridge_attach(struct drm_bridge *b=
ridge,
> =20
>  	drm_dp_aux_unregister(&dp->aux);
> =20
> +err_runtime_pm_put:
> +	pm_runtime_put_autosuspend(dp->dev);
> +
>  	return ret;
>  }
> =20
> @@ -1941,6 +1976,9 @@ static void dw_dp_bridge_detach(struct drm_bridge *=
bridge)
>  	disable_irq(dp->irq);
>  	cancel_work_sync(&dp->hpd_work);
>  	drm_dp_aux_unregister(&dp->aux);
> +
> +	if (!dp->usbc_mode)
> +		pm_runtime_put_autosuspend(dp->dev);
>  }

[Severity: Medium]
Will this asynchronous pm_runtime_put_autosuspend() race with
pm_runtime_disable() during device removal or probe failure?

In dw_dp_bridge_detach() and the error path of dw_dp_bridge_attach(), the
driver drops its runtime reference using an asynchronous put. However,
during component teardown or probe failure, this is quickly followed by the
devm cleanup phase, which calls pm_runtime_disable() (registered via
devm_pm_runtime_enable() in probe).

According to power management guidelines, pm_runtime_disable() cancels any
pending asynchronous suspend timers. Because the put was asynchronous and t=
he
timer is cancelled before it expires, the device remains in the RPM_ACTIVE
state and is never physically suspended, causing a power leak.

Could a synchronous put (like pm_runtime_put_sync()) be used here instead?

[ ... ]

> @@ -2205,41 +2280,67 @@ struct dw_dp *dw_dp_probe(struct platform_device =
*pdev, const struct dw_dp_plat_
> +	/*
> +	 * Disable IRQ a second time; this ensures the interrupt is only
> +	 * enabled when the bridge is attached AND runtime PM is enabled.
> +	 * Also register a devm action to restore the correct balance during
> +	 * device removal.
> +	 */
> +	disable_irq(dp->irq);
> +
> +	ret =3D devm_add_action_or_reset(dev, dw_dp_enable_irq, dp);
> +	if (ret)
> +		return ret;

[Severity: High]
Does this devm action risk a use-after-free by unmasking the interrupt duri=
ng
driver unload?

The driver uses the interrupt disable depth as a refcount: IRQF_NO_AUTOEN
(depth=3D1) plus the explicit disable_irq() in probe (depth=3D2). It expect=
s two
enable_irq() calls (attach and runtime_resume) to reach depth 0.

If the device fails to runtime suspend during teardown (e.g., due to the
pm_runtime_put_autosuspend() cancellation race described above),
dw_dp_runtime_suspend() is skipped, and its corresponding disable_irq() is
missed. When dw_dp_bridge_detach() calls disable_irq(), the depth only
returns to 1.=20

Later, the devm cleanup action dw_dp_enable_irq() decrements the depth.
Since the depth was 1, it reaches 0 and physically unmasks the interrupt.

If an interrupt fires in the small window between dw_dp_enable_irq() and
free_irq(), dw_dp_irq() queues dp->hpd_work. Since cancel_work_sync() was
already called in dw_dp_bridge_detach(), this requeues the work on a dp
structure that is about to be freed by devres, resulting in a use-after-free
when the workqueue runs.

> +	if (dp->plat_data.autosuspend_delay > 0) {
> +		pm_runtime_use_autosuspend(dev);
> +		pm_runtime_set_autosuspend_delay(dev, dp->plat_data.autosuspend_delay);
> +		ret =3D devm_pm_runtime_enable(dev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!pm_runtime_enabled(dev)) {
> +		dw_dp_runtime_resume(dp);
> +
> +		ret =3D devm_add_action_or_reset(dev, dw_dp_manual_suspend, dp);
> +		if (ret)
> +			return ret;
> +	}

[Severity: Medium]
Should the return value of dw_dp_runtime_resume() be checked here?

When pm_runtime_enabled(dev) is false, dw_dp_runtime_resume() is called
manually to power up the hardware, but its return value is ignored. If it
fails (for example, if clk_prepare_enable() fails), it aborts early and
leaves resources like aux_clk and the interrupt disabled.=20

However, the probe continues and registers the dw_dp_manual_suspend devres
action. During driver teardown, dw_dp_manual_suspend() unconditionally calls
clk_disable_unprepare(dp->aux_clk) and disable_irq(dp->irq). Calling these
on resources that were never enabled triggers subsystem warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-synopsys-d=
w-dp-improvements-v11-0-0d508505f383@collabora.com?part=3D14
