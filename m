Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3303373C12
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784025215; cv=none; b=c7GhwqTI69JWzD5tM/CEBSSROwCDJjtpfL4Qab0t2fHPRIm0nzDZGFySlknH9bR3hScXCTgKoZwq5yZb5hhj2Owhia7Qr0vTzbxwrNZp+C9XCSzg9/ruLdPKH4Bf32eHRKQOLNqrt+3WbSfKT2Y5Um8cukH6zwfcIakZlXYr5sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784025215; c=relaxed/simple;
	bh=u7JAVxyXGPBPc0AnBNRiKGWYoyFdGMVdK7lRJbtjP3U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M4aIRDaAdebmaaEcQ0qSAk5lTt7xxI8SBozjPM20OyKdchAZowdA2gwQVKfeTL1GcIWTKJ366VskZ301b+Vpp4q8p5+tyumaPMKDxgV3calhfb3aVG5FFbTbvN8OSfjdYV7BaDLKLkYeobrSg+dkZAHt2zIVr6TvPCshddN3xl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EUC301ar; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUC301ar"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B351F000E9;
	Tue, 14 Jul 2026 10:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784025213;
	bh=BQw2KidrqMiAG/KUfR6bWGxFP1306jZELdm7/5yTiZI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EUC301ar8nIbHjmrNMpIXxEiqb5kz4uJKRlVt5POH2XZFyjZSFz6MfKLskuE+sOfI
	 JVbi9ygHDz/ksTTrp8dtjy7p634h9cUN92yeALaA7XZrwes77YiQo4AQ/Ah2iEvXPa
	 cAxGV1JFyWIeZuvwZ/grR48z22IKLYPo94B4OYcda4rBTfNAZWoXZ+4IfnqlENAj5X
	 NI6F55BRuUXRXj0Mvg5f0pjIQOQLH3j6hwEiqaprNnd3G97XO7IQrbDmRlEoY/H1pI
	 AZWH2xq6F73gF3mpdST1PhG9p0LCEAMqMGpvPaDWEmVVBrRNiYpCddCU+aslQRj+v6
	 jiGp1HG5+vWfA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/3] drm/glanda: Add initial DRM driver for
 GlandaGPU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Leander Kieweg" <kieweg.leander@gmail.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260714101146.200416-3-kieweg.leander@gmail.com>
References: <20260714101146.200416-1-kieweg.leander@gmail.com>
 <20260714101146.200416-3-kieweg.leander@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 10:33:32 +0000
Message-Id: <20260714103332.B8B351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Plane atomic update callback calls sleeping functions, violating D=
RM atomic context rules.
- [High] Manual call to drm_mode_config_cleanup causes a double-free.
- [High] Missing drm_atomic_helper_shutdown() during driver removal.
- [High] Teardown logic creates a race condition causing ioctl threads to w=
rite to unmapped MMIO memory.
- [High] IRQ handler is registered before the CRTC is initialized, creating=
 a window for a NULL pointer dereference.
- [Medium] Direct pointer dereference of `iosys_map` memory bypasses abstra=
ction and breaks on I/O memory.
- [Medium] Mishandling of platform_get_irq return value breaks probe deferr=
al.
--

--- Patch [2]: [RFC PATCH 2/3] drm/glanda: Add initial DRM driver for Gland=
aGPU ---
commit ee638d3912e8ed264bf2c9ee4b6fd9350bc3726b
Author: Leander Kieweg <kieweg.leander@gmail.com>
Subject: drm/glanda: Add initial DRM driver for GlandaGPU

This commit introduces the core DRM/KMS driver for GlandaGPU. This driver
supports basic modesetting, atomic updates, and custom 2D hardware
acceleration IOCTLs.

> diff --git a/drivers/gpu/drm/tiny/glandagpu.c b/drivers/gpu/drm/tiny/glan=
dagpu.c
> new file mode 100644
> index 0000000000000..8f87ae096a2e3
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/glandagpu.c
> @@ -0,0 +1,769 @@
[ ... ]
> +static void glanda_plane_atomic_update(struct drm_plane *plane,
> +				       struct drm_atomic_commit *state)
> +{
[ ... ]
> +	dma_resv_lock(shmem->base.resv, NULL);
> +	ret =3D drm_gem_shmem_vmap_locked(shmem, &map);
> +	if (ret) {
> +		dma_resv_unlock(shmem->base.resv);
> +		drm_err(&gdev->drm,
> +			"GlandaGPU: failed to vmap GEM shmem object\n");
> +		return;
> +	}
> +
> +	mutex_lock(&gdev->lock);

[Severity: High]
DRM atomic commit callbacks execute in an atomic context and cannot sleep.=
=20
Is it safe to call dma_resv_lock, drm_gem_shmem_vmap_locked, and mutex_lock=
=20
here? These functions can sleep and might trigger a schedule while atomic
oops or deadlocks when this path is reached via non-blocking atomic commits.

> +
> +	ret =3D glanda_wait_idle(gdev);
> +	if (ret) {
> +		drm_err(&gdev->drm, "GlandaGPU: timed out waiting for idle\n");
> +		mutex_unlock(&gdev->lock);
> +		drm_gem_shmem_vunmap_locked(shmem, &map);
> +	dma_resv_unlock(shmem->base.resv);
> +		return;
> +	}
> +
> +	src_pitch =3D fb->pitches[0];
> +	width =3D min_t(u32, fb->width, GLANDA_WIDTH);
> +	height =3D min_t(u32, fb->height, GLANDA_HEIGHT);
> +
> +	u8 __iomem *dst_base =3D gdev->vram_base;
> +	u8 *src_base =3D map.vaddr;
> +	u32 y;
> +
> +	for (y =3D 0; y < height; y++) {
> +		u32 *src =3D (u32 *)(src_base + y * src_pitch);

[Severity: Medium]
Does directly dereferencing map.vaddr break abstraction on architectures=20
that do not support direct memory dereferencing for I/O memory? If the=20
mapped memory is in I/O space (like an imported dma-buf), this might cause=
=20
a panic. Should this use iosys_map helpers like iosys_map_rd instead?

[ ... ]
> +static int glandagpu_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	writel(0, gdev->mmio_base + REG_IER);
> +	writel(0xFFFFFFFF, gdev->mmio_base + REG_ISR);	/* clear flags */
> +
> +	ret =3D platform_get_irq(pdev, 0);
> +	if (ret > 0) {
> +		gdev->irq =3D ret;
> +		ret =3D devm_request_irq(&pdev->dev, gdev->irq, glanda_irq_handler,
> +				       IRQF_SHARED, "glandagpu", gdev);

[Severity: Medium]
What happens if platform_get_irq returns -EPROBE_DEFER or another negative=
=20
error code? The check for ret > 0 seems to treat all negative error codes=20
as a missing IRQ, falling back to polling permanently rather than returning=
=20
the error to the driver core to retry.

[Severity: High]
Since devm_request_irq is called with IRQF_SHARED here, could the IRQ=20
handler fire immediately before the CRTC is initialized later in probe?=20
If the shared interrupt fires early and the INT_VSYNC bit is set,=20
glanda_irq_handler would call drm_crtc_handle_vblank on an uninitialized=20
crtc object, which could lead to a NULL pointer dereference.

[ ... ]
> +err_mode_cleanup:
> +	drm_mode_config_cleanup(&gdev->drm);
> +	return ret;
> +}

[Severity: High]
The mode config is initialized using drm_mode_config_init, which wraps=20
drmm_mode_config_init and automatically registers a devres action for=20
cleanup. Does calling drm_mode_config_cleanup manually here cause a=20
double-free on probe failure?

> +
> +static void glandagpu_remove(struct platform_device *pdev)
> +{
> +	struct glanda_device *gdev =3D platform_get_drvdata(pdev);
> +
> +	/* Disable interrupts first so no new IRQ work can race the teardown
> +	 * below, and wake up anyone still blocked in glanda_wait_idle().
> +	 */
> +	writel(0, gdev->mmio_base + REG_IER);
> +	gdev->cmd_done =3D true;
> +	wake_up_interruptible(&gdev->cmd_wq);

[Severity: High]
By faking a successful completion instead of signaling an abort condition,=
=20
any ioctl threads sleeping in glanda_wait_idle will wake up and proceed=20
to write to mmio_base. Without proper synchronization or a call to=20
drm_dev_enter/exit to ensure threads finish, can these awakened threads=20
end up writing to unmapped MMIO memory as the devres teardown proceeds?

> +
> +	drm_info(&gdev->drm, "GlandaGPU DRM Driver removed\n");
> +	drm_dev_unregister(&gdev->drm);

[Severity: High]
Should this removal sequence include a call to drm_atomic_helper_shutdown=20
to quiesce the display hardware? Without it, hardware pipelines might remai=
n=20
active after the module is unloaded, which could result in memory corruptio=
n=20
or resource leaks.

> +	drm_mode_config_cleanup(&gdev->drm);
> +}

[Severity: High]
Similar to the probe error path, does this manual call to=20
drm_mode_config_cleanup cause a double-free on module unload, given that=20
drm_mode_config_init already registered a devres cleanup handler?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714101146.2004=
16-1-kieweg.leander@gmail.com?part=3D2
