Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C513515F8
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 20:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787602055; cv=none; b=R/myIO4C0/vFbmnBGJb20CK4guOSQu5xVtQ5hYSgPVVdspVknqBsbbwycGtflEdkNKs4/8T7a/W/ADn/xTwBoGyOFNdu7DJp0wGpmmyX3dTGqwBD+ytM9gDl5TaWNepKSR/MlfPlSFJHWQ2W+5zodjr9j/lEspqfXGi6aVvu/Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787602055; c=relaxed/simple;
	bh=kKy+d+WxSxfQI/P90NbsZ8FJ9Qw4zEEWdk41Wuxx8TY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oPE+OvinI/8m/s8QwF0+5vruIF3lNVbj3hyrk3MAzzUDk9y/qu3y1lucrabU8xTM+K+3u61/RlaePeslKjMXvv9DAnqMpA5G0ACnaIaf3QazUoaJWdJOjx5l1UMB/8tyYTkhk2AHUcWGnKzUY1E3n/lWTgZTGyuo/YghUdV2xAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=miWFWb/I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="miWFWb/I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17EC71F000E9;
	Mon, 24 Aug 2026 20:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787602053;
	bh=HXqpBmsy3koJuYdV0MGTeoTO2rJ7Sd8LFgvk4JP2QeI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=miWFWb/IK+t0siMniDVWDUsQBqMzj+4nVK/BCCnSWoJ7qyPTXjh9mbbPfU/liKZQN
	 8lVCAdVqHj3wnc+aSs/hwHGH7WjzNNAeXAkt2/H5vUbKZnyNYpzO/ZDXgUpmsXbl3P
	 yxUvT8SUkwgDpFfZReHdo+cKnJU7eIW02BaMy6MWKQnDkZQER7Xl0QiLcMAjyXgKRR
	 44i7tahpQ0vJuCikY58WfLJnrAmTe0D0BevXQy9gVb8gPn3l4VMA21JOIBXV/Z2HaH
	 ogRBnlFpmr+ni76OSN8az6hJH1y4N1YgDmVxbdcHkVuWHd0DLUP52QScfAqccs5HvS
	 HBt33dZ5hIbUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] drm/glanda: Add initial DRM driver for GlandaGPU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Leander Kieweg" <kieweg.leander@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260824195418.17707-3-kieweg.leander@gmail.com>
References: <20260824195418.17707-1-kieweg.leander@gmail.com>
 <20260824195418.17707-3-kieweg.leander@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 20:07:32 +0000
Message-Id: <20260824200733.17EC71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] `glanda_crtc_enable_vblank()` enables the hardware VSYNC interrupt=
 without checking if an IRQ handler is registered, leading to an interrupt =
storm in polling mode.
- [High] VRAM is mapped using standard I/O instead of Write-Combining, caus=
ing a severe performance regression.
- [Medium] Unconditionally enabling the VSYNC interrupt during initializati=
on bypasses DRM core's state management, causing unnecessary CPU wakes.
- [Low] Unconditional usage of PCI APIs breaks the build when `CONFIG_PCI` =
is disabled under `COMPILE_TEST`.
--

--- Patch [2]: [PATCH v3 2/2] drm/glanda: Add initial DRM driver for Glanda=
GPU ---
commit a32b58ce69a1f7f207f85c416ed56ab0c146bd56
Author: Leander Kieweg <kieweg.leander@gmail.com>

drm/glanda: Add initial DRM driver for GlandaGPU

This commit introduces a new DRM/KMS driver for the GlandaGPU display
controller. It supports basic modesetting and atomic updates via shadow
planes, and allows for both platform and PCI probing.

> diff --git a/drivers/gpu/drm/tiny/glandagpu.c b/drivers/gpu/drm/tiny/glan=
dagpu.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/glandagpu.c

[ ... ]

> +static int glanda_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct glanda_device *gdev =3D to_glanda(crtc->dev);
> +	u32 ier;
> +
> +	ier =3D readl(gdev->mmio_base + REG_IER);
> +	writel(ier | INT_VSYNC, gdev->mmio_base + REG_IER);

[Severity: High]
Could this cause an unhandled interrupt storm in polling mode?

If the driver falls back to polling mode, such as when
platform_get_irq_optional() returns -ENXIO, gdev->irq is set to -1
and no handler is registered. If a userspace application calls
DRM_IOCTL_WAIT_VBLANK, the DRM core will invoke this callback and enable
the hardware vsync interrupt.

Since there is no IRQ handler to clear the REG_ISR register, the hardware
will keep the interrupt line asserted, which might disable a shared
interrupt line and affect other devices.

> +
> +	return 0;
> +}

[ ... ]

> +static int glanda_drm_init(struct glanda_device *gdev, int irq)
> +{

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
> +		writel(INT_VSYNC, gdev->mmio_base + REG_IER);

[Severity: Medium]
Is it necessary to unconditionally enable the hardware vsync interrupt here?

The DRM core initializes software vblank state as disabled. Because it is
already considered disabled, the core won't call the disable_vblank()
callback. This means the hardware will fire vsync interrupts continuously
from the moment the driver loads, even when the display is idle.

> +	} else {
> +		drm_warn(&gdev->drm, "No IRQ found, falling back to polling\n");
> +	}

[ ... ]

> +static int glandagpu_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	if (resource_size(res) < GLANDA_MMIO_OFFSET + GLANDA_MMIO_SIZE) {
> +		dev_err(&pdev->dev, "MMIO region too small: %llu bytes, need at least =
%u\n",
> +			(unsigned long long)resource_size(res),
> +			GLANDA_MMIO_OFFSET + GLANDA_MMIO_SIZE);
> +		return -EINVAL;
> +	}
> +
> +	gdev->vram_phys =3D res->start;
> +	gdev->vram_base =3D devm_ioremap(&pdev->dev, res->start, GLANDA_VRAM_SI=
ZE);

[Severity: High]
Will this cause severe CPU stalling during atomic frame updates?

The devm_ioremap() function creates a strongly uncacheable memory mapping.
Since glanda_plane_atomic_update() writes hundreds of thousands of pixels
individually using writel_relaxed(), each write will traverse the bus
separately.

Should this memory be mapped using write-combining (e.g., devm_ioremap_wc())
so the CPU can burst writes efficiently?

> +	gdev->mmio_base =3D devm_ioremap(&pdev->dev, res->start + GLANDA_MMIO_O=
FFSET,
> +								   GLANDA_MMIO_SIZE);

[ ... ]

> +static struct platform_driver glandagpu_driver =3D {
> +	.driver =3D {
> +		.name =3D "glandagpu",
> +		.of_match_table =3D glanda_of_match,
> +	},
> +	.probe =3D glandagpu_probe,
> +	.remove =3D glandagpu_remove,
> +};
> +
> +/* PCI probe path for the QEMU test device, real hardware uses platform_=
driver */
> +static int glandagpu_pci_probe(struct pci_dev *pdev, const struct pci_de=
vice_id *id)
> +{

[Severity: Low]
Does this code break the build when the kernel is configured with
CONFIG_DRM_GLANDA=3Dy, CONFIG_COMPILE_TEST=3Dy, and CONFIG_PCI=3Dn?

The Kconfig explicitly allows building without PCI for test coverage, but
functions like pcim_iomap_regions() and pcim_iomap_table() do not have
fallback stubs in the headers when PCI is disabled.

Should the PCI-specific driver code be guarded by #ifdef CONFIG_PCI?

> +	struct glanda_device *gdev;
> +	int ret;
> +
> +	ret =3D pcim_enable_device(pdev);
> +	if (ret)
> +		return ret;
> +	pci_set_master(pdev);
> +
> +	if (pci_resource_len(pdev, 0) < GLANDA_MMIO_SIZE ||
> +		pci_resource_len(pdev, 1) < GLANDA_VRAM_SIZE) {
> +		dev_err(&pdev->dev, "BAR too small: BAR0=3D%llu (need %u), BAR1=3D%llu=
 (need %u)\n",
> +			(unsigned long long)pci_resource_len(pdev, 0), GLANDA_MMIO_SIZE,
> +			(unsigned long long)pci_resource_len(pdev, 1), GLANDA_VRAM_SIZE);
> +		return -EINVAL;
> +	}
> +
> +	ret =3D pcim_iomap_regions(pdev, BIT(0) | BIT(1), "glandagpu");

[Severity: High]
Similar to the platform probe, does this create a strongly uncacheable
mapping for VRAM?

pcim_iomap_regions() defaults to standard I/O mappings. This will likely
cause the same performance degradation during frame updates.

> +	if (ret)
> +		return ret;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824195418.1770=
7-1-kieweg.leander@gmail.com?part=3D2
