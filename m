Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054A03AAF42
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433950; cv=none; b=OgeJnp/bCKLOlDj6511fqVBpTyLFnAOggZFuHQXfNgRgmvkYZ8xvNSLMbTMLiBpr40SyDDFiIhzLZHYf712PvEejvIbj+bt4AfuKupj5ReljhMilKSTFLN8Ck5Q8v39c3cFEgClnntSDqING5eHPlSjkMAr241fSY2c55ebCvLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433950; c=relaxed/simple;
	bh=ixsd5SsG+xB7+7j21LOpjLGNFmFmOi3reYCo+2uoSEk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a+D9nNQ/cL0TUJUIPxTViWSI/i6unkFQ6jWpYi7oLkXqB0ZIjDoGpbapZxgDQzZBwI+09kOju5NzcQnE1vjTd4oLDO0yGLkYT75Qk4Zt7BckJWLZnKDtAqsN6RZzesLv4Egn4VVXr5X2eth3QQkryOw8kPZnt/yO6AIMsTgDoxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nszBkBMC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nszBkBMC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6069C1F000E9;
	Thu, 30 Jul 2026 17:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785433948;
	bh=MVARr/TN+7s03zeGE2Ko9hAysq4Qg9iFByGFSG3Ah/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nszBkBMC+WrLCbzRGxKI78Lc4azR1lttXQejb6Rz5euPNKzPueD0TkZ+dLkYbGMYG
	 nhH/vsSwsZKe60RgdzC9IHR+U/URdOjFh4A8zyxGV3oyxBkG8sPGOgb7o48uzyh2TW
	 N/OX+tkK7rev7ntBnycKxU4MUo9xEWjjlyaq0QVIYQzz9E5nwvHxUTD0x6mU5arwZt
	 ab6SAPhoX8RP1Z+Jp5OOoAqdExzharIiyxznwCDC1LS5CwRDP3mrs1tw+aveKngjbv
	 Qx95FiqcuKBLJKJZeSigJsAbLj0dB12xhQ7OQXrOaHZxuj1sNBPmAXDvQN6RrQTQ3v
	 gDe5nQNTJ+TIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/glanda: Add initial DRM driver for GlandaGPU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Leander Kieweg" <kieweg.leander@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260730173643.256052-3-kieweg.leander@gmail.com>
References: <20260730173643.256052-1-kieweg.leander@gmail.com>
 <20260730173643.256052-3-kieweg.leander@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 17:52:27 +0000
Message-Id: <20260730175228.6069C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Ignored return value of drm_mode_config_init().
- [High] Hardware interrupts are left enabled if drm_dev_register() fails, =
leading to an unhandled interrupt storm.
- [High] Missing resource size validation before I/O memory mapping allows =
out-of-bounds mapping and writes.
- [High] Userspace atomic commits hang when the driver falls back to pollin=
g mode because vblank events are armed but never signaled.
- [Medium] Unused INT_DONE interrupt is unconditionally enabled, risking an=
 interrupt storm.
- [Medium] Native u32 read of little-endian pixel data breaks color convers=
ions on big-endian CPUs.
- [Low] Missing dependencies in Kconfig for DRM_GLANDA.
- [Low] Using platform_get_irq() for an optional IRQ causes log spam.
--

--- Patch [2]: [PATCH v2 2/2] drm/glanda: Add initial DRM driver for Glanda=
GPU ---
commit 47c9d06e7235a576cf0a48e9d5a1011c1d5c7ced
Author: Leander Kieweg <kieweg.leander@gmail.com>
Subject: drm/glanda: Add initial DRM driver for GlandaGPU

Introduce the core DRM/KMS driver for GlandaGPU. This driver supports basic
modesetting, atomic updates via shadow plane helpers, and optional QEMU PCI
probing alongside the platform driver.

> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index f0e72d4b6a470..f5aaf499e34eb 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
[ ... ]
> @@ -56,6 +56,17 @@ config DRM_CIRRUS_QEMU
>  	   - qxl (DRM_QXL, qemu -vga qxl, works best with spice)
>  	   - virtio (DRM_VIRTIO_GPU), qemu -vga virtio)
> =20
> +config DRM_GLANDA
> +	tristate "GlandaGPU DRM driver"
> +	depends on DRM
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_SHMEM_HELPER

[Severity: Low]
Does this config need to depend on MMU and PCI || COMPILE_TEST? The driver
selects DRM_GEM_SHMEM_HELPER which depends on MMU, and it calls PCI devres
functions that lack non-PCI stubs when CONFIG_PCI is disabled.

> diff --git a/drivers/gpu/drm/tiny/glandagpu.c b/drivers/gpu/drm/tiny/glan=
dagpu.c
> new file mode 100644
> index 0000000000000..e4dfddaba4e3b
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/glandagpu.c
[ ... ]
> +static void glanda_plane_atomic_update(struct drm_plane *plane,
> +				       struct drm_atomic_commit *state)
> +{
[ ... ]
> +	for (y =3D 0; y < height; y++) {
> +		size_t offset =3D y * GLANDA_WIDTH * sizeof(u32);
> +		u32 __iomem *dst =3D (u32 __iomem *)(gdev->vram_base + offset);
> +
> +		for (x =3D 0; x < width; x++) {
> +			u32 pixel =3D iosys_map_rd(&shadow_state->data[0],
> +						 y * src_pitch + x * sizeof(u32), u32);
> +			u32 packed =3D ((pixel >> 12) & 0x0F00) |
> +				((pixel >> 8) & 0x00F0) |
> +				((pixel >> 4) & 0x000F);
> +
> +			writel_relaxed(packed, &dst[x]);
> +		}
> +	}

[Severity: Medium]
Will this bitwise extraction read the correct color channels on big-endian
architectures? By using iosys_map_rd to read a native u32, the little-endian
DRM_FORMAT_XRGB8888 byte stream will have its bytes inverted on big-endian
CPUs.

[ ... ]
> +static void glanda_crtc_atomic_flush(struct drm_crtc *crtc,
> +				     struct drm_atomic_commit *state)
> +{
> +	struct drm_crtc_state *new_state =3D drm_atomic_get_new_crtc_state(stat=
e, crtc);
> +	struct drm_pending_vblank_event *event;
> +
> +	if (new_state->event) {
> +		event =3D new_state->event;
> +
> +		new_state->event =3D NULL;
> +
> +		spin_lock_irq(&crtc->dev->event_lock);
> +
> +		if (drm_crtc_vblank_get(crtc) =3D=3D 0)
> +			drm_crtc_arm_vblank_event(crtc, event);
> +		else
> +			drm_crtc_send_vblank_event(crtc, event);

[Severity: High]
What happens to armed vblank events when the driver falls back to polling
mode? If there is no hardware interrupt to call drm_crtc_handle_vblank(),
these events might never be signaled, which can cause userspace page flips
to hang. Should the driver set crtc->state->no_vblank =3D true or bypass
drm_crtc_arm_vblank_event in polling mode?

[ ... ]
> +static int glanda_drm_init(struct glanda_device *gdev, int irq)
> +{
[ ... ]
> +	writel(0, gdev->mmio_base + REG_IER);
> +	writel(0xFFFFFFFF, gdev->mmio_base + REG_ISR);	/* clear flags */
> +
> +	/* DRM mode config */
> +	drm_mode_config_init(&gdev->drm);

[Severity: High]
Is it safe to ignore the integer return value of drm_mode_config_init? If
this fails due to memory allocation issues, the DRM mode configuration state
will be partially initialized, potentially leading to NULL pointer
dereferences later when the DRM core accesses it.

[ ... ]
> +	if (irq > 0) {
> +		gdev->irq =3D irq;
> +		ret =3D devm_request_irq(gdev->drm.dev, gdev->irq, glanda_irq_handler,
> +				       IRQF_SHARED, "glandagpu", gdev);
> +		if (ret) {
> +			drm_err(&gdev->drm, "Failed to request IRQ %d\n",
> +				gdev->irq);
> +			return ret;
> +		}
> +
> +		writel(INT_DONE, gdev->mmio_base + REG_IER);

[Severity: Medium]
Could enabling INT_DONE cause an interrupt storm? If the hardware asserts
INT_DONE when the 2D engine is idle, and the driver never submits commands
to it, the IRQ handler might get caught in a loop continuously clearing it.

> +		drm_info(&gdev->drm, "IRQ %d requested and enabled\n", gdev->irq);
> +	} else {
> +		drm_warn(&gdev->drm, "No IRQ found, falling back to polling\n");
> +	}
> +
> +	ret =3D drm_dev_register(&gdev->drm, 0);
> +	if (ret)
> +		return ret;

[Severity: High]
Does this error path leave hardware interrupts enabled? If
drm_dev_register fails, the function returns without clearing REG_IER.
Since devres frees the IRQ handler, this might leave the hardware asserting
an interrupt with no kernel handler available to acknowledge it.

[ ... ]
> +static int glandagpu_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENODEV;
> +
> +	gdev->vram_phys =3D res->start;
> +	gdev->vram_base =3D devm_ioremap(&pdev->dev, res->start, GLANDA_VRAM_SI=
ZE);
> +	gdev->mmio_base =3D devm_ioremap(&pdev->dev, res->start + GLANDA_MMIO_O=
FFSET,
> +				       GLANDA_MMIO_SIZE);

[Severity: High]
Should there be a check on the underlying resource length before mapping?
Blindly mapping GLANDA_VRAM_SIZE without verifying resource_size(res) could
cause out-of-bounds mappings if the hardware resource is undersized. Later,
the shadow plane write loop in glanda_plane_atomic_update() could overrun
the boundaries and corrupt physical memory.

> +	if (!gdev->vram_base || !gdev->mmio_base) {
> +		drm_err(&gdev->drm, "failed to ioremap\n");
> +		return -ENOMEM;
> +	}
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq =3D=3D -ENXIO)
> +		irq =3D -1;	/* no IRQ resource, fall back to polling */

[Severity: Low]
Since the driver gracefully supports polling mode, could this use
platform_get_irq_optional instead? Using platform_get_irq logs a
false-positive error when the IRQ is not found.

[ ... ]
> +static int glandagpu_pci_probe(struct pci_dev *pdev, const struct pci_de=
vice_id *id)
> +{
[ ... ]
> +	gdev->mmio_base =3D pcim_iomap_table(pdev)[0];
> +	gdev->vram_base =3D pcim_iomap_table(pdev)[1];
> +	gdev->vram_phys =3D pci_resource_start(pdev, 1);

[Severity: High]
Does this PCI probe path also need to validate the size of the mapped BARs
against the expected GLANDA_VRAM_SIZE and GLANDA_MMIO_SIZE to prevent
similar out-of-bounds writes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730173643.2560=
52-1-kieweg.leander@gmail.com?part=3D2
