Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169023CE096
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175039; cv=none; b=UBFnXpVQ6u41xpjApEcUnRCAZJI7c5e5icfIQVC7aSGFUssKMQumb7EKok+Qjvl1eh9ORvaA2nS9I0LHooG2OtF1I+2Cdlu+jM61yBrfIDkKTUfFMWxORHF07Mv3D4FvocpRu/OH5fU2EaR81+axNCCX+YSe+v5cCo1bkxliDrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175039; c=relaxed/simple;
	bh=lH3pEk5DRZeC6AMrW6GWVPEEfnndqWFxCI/5TdrqQSk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZEAUhOK9gVxiWNelGwcGj2dNZbLIjb5wSE3o+wVEKAwVtW3BqIMTZpnT2ZTzuBQAlt2J29LFBv6UmZKjVqBqtvCUH6OQOCg6/usBu3bK3d12H47b+UVsMJXMPIOz5eTbqm01tUCcitnvMWyiQPQYJjmu3qjeUW6Ol0KlTDiWZCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFBxivyz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFBxivyz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E718C2BCB3;
	Tue, 19 May 2026 07:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779175039;
	bh=lH3pEk5DRZeC6AMrW6GWVPEEfnndqWFxCI/5TdrqQSk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=dFBxivyzLqv464p9yFJiSeh2MAsZW9s3dyL5NFENUFV4OyUUGZF81epZ2fdNXXX1v
	 JBkvb62Vbba+QteBaaYQoydYs1JbZJGzAe+YIfWiRiEpb49MfAbFQgrGOzA6apXio7
	 NDOGCJsMHwO9mc8mT00lAKtM4ub1PFovKh0S8EchiGvhfXShiery3iiTFr9iuZsiu3
	 kbmzsAxuq7arGxp54sUm4cUW7KHt74JiRF0z4QLGZEKAxv5jvG1rw9V2px3nadpFCA
	 9TiRIYGybVMNztoeqqkpw3IjuR56c7rFcUJj3EwlY4K+xnEU4nu83+kneXaDqErkva
	 b4iJM4cXJpNqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] drm/verisilicon: add Nuvoton MA35D1 DCU Lite
 display controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519055114.1886525-5-a0987203069@gmail.com>
References: <20260519055114.1886525-5-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 07:17:17 +0000
Message-Id: <20260519071718.2E718C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] Pre-existing early IRQ request race condition leads to a NULL =
pointer dereference crash during probe.
- [High] The bridge_enable callback fails to set the PANEL_CONFIG.RUNNING b=
it, contradicting the commit message and preventing panel output.
- [High] Framebuffer enablement is incorrectly tied to the CRTC lifecycle r=
ather than the Plane lifecycle, risking IOMMU faults or memory corruption.
- [High] The DCU Lite interrupt handler reads the status register but fails=
 to acknowledge (clear) the interrupts, risking an interrupt storm.
- [High] Pre-existing heap buffer overflow in `vs_dc_probe()` due to unchec=
ked `display_count` from hardware.
--

commit 234a098981976180e2d53f562af404422d7cd953
Author: Joey Lu <a0987203069@gmail.com>

drm/verisilicon: add Nuvoton MA35D1 DCU Lite display controller support

This commit adds support for the Verisilicon DCU Lite display controller
found on the Nuvoton MA35D1 SoC. It implements a new vs_dc_funcs vtable
with dedicated hardware operations to account for differences from the
existing DC8200 controller.

> 2. No PANEL_START register: panel output starts when
>    PANEL_CONFIG.RUNNING is set; no multi-display sync start register
>    is used.

The commit message explicitly documents that panel output starts when
PANEL_CONFIG.RUNNING is set.

[ ... ]

> diff --git a/drivers/gpu/drm/verisilicon/vs_dcu_lite.c b/drivers/gpu/drm/=
verisilicon/vs_dcu_lite.c
> new file mode 100644
> index 0000000000000..11ef57d5ebaa4
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_dcu_lite.c
> @@ -0,0 +1,78 @@

[ ... ]

> +static void vs_dcu_lite_bridge_enable(struct vs_dc *dc, unsigned int out=
put)
> +{
> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
> +			VSDC_FB_CONFIG_RESET);
> +}

However, vs_dcu_lite_bridge_enable() sets VSDC_FB_CONFIG_RESET instead,
and never writes to PANEL_CONFIG.RUNNING.

Will this prevent panel output from starting? Also, could asserting a reset
bit during the enable path hold the framebuffer block in a continuous reset
state?

[ ... ]

> +static void vs_dcu_lite_crtc_enable(struct vs_dc *dc, unsigned int outpu=
t)
> +{
> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
> +			VSDC_FB_CONFIG_ENABLE);
> +}
> +
> +static void vs_dcu_lite_crtc_disable(struct vs_dc *dc, unsigned int outp=
ut)
> +{
> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
> +			  VSDC_FB_CONFIG_ENABLE);
> +}

The patch implements crtc_enable and crtc_disable to toggle
VSDC_FB_CONFIG_ENABLE, but leaves plane disable callbacks unimplemented.

If userspace dynamically disables the primary plane while keeping the CRTC
active, will the hardware framebuffer remain enabled?

Could this cause the hardware to continuously scan out from a disabled DRM
framebuffer that the kernel might unpin or free, leading to IOMMU faults?

[ ... ]

> +static u32 vs_dcu_lite_irq_handler(struct vs_dc *dc)
> +{
> +	u32 irqs;
> +
> +	regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &irqs);
> +	return irqs;
> +}

The interrupt handler reads VSDC_DISP_IRQ_STA but does not appear to write
back to clear the pending interrupt bits.

If this status register requires a Write-1-to-Clear (W1C) operation, could
failing to explicitly acknowledge the interrupt cause the IRQ line to remain
asserted, resulting in an interrupt storm?

While reviewing this patch, I noticed a pre-existing issue in vs_dc_probe().
The code reads dc->identity.display_count from hardware registers and
loops up to this value to populate the dc->pix_clk array:

drivers/gpu/drm/verisilicon/vs_dc.c:vs_dc_probe() {
    ...
    if (port_count > dc->identity.display_count) {
        dev_err(dev, "too many downstream ports than HW capability\n");
        ret =3D -EINVAL;
        goto err_rst_assert;
    }

    for (i =3D 0; i < dc->identity.display_count; i++) {
        snprintf(pixclk_name, sizeof(pixclk_name), "pix%u", i);
        dc->pix_clk[i] =3D devm_clk_get(dev, pixclk_name);
    ...
}

While the code validates port_count <=3D VSDC_MAX_OUTPUTS and
port_count <=3D dc->identity.display_count, it doesn't appear to ensure
dc->identity.display_count <=3D VSDC_MAX_OUTPUTS.

Could a malfunctioning hardware device reporting a large display_count
cause an out-of-bounds write of clock pointers on the kernel heap?

There also appears to be a pre-existing race condition in vs_dc_probe()
where the IRQ is requested before the DRM device is initialized:

drivers/gpu/drm/verisilicon/vs_dc.c:vs_dc_probe() {
    ...
    ret =3D devm_request_irq(dev, irq, vs_dc_irq_handler, 0,
                           dev_name(dev), dc);
    ...
    ret =3D vs_drm_initialize(dc, pdev);
    ...
}

If the bootloader leaves the display controller active, could the hardware
immediately fire an interrupt once unmasked?

If this occurs, the interrupt handler vs_dc_irq_handler() would call
vs_drm_handle_irq(), which dereferences dc->drm_dev->crtcs[i]. Because
dc->drm_dev is not allocated and assigned until vs_drm_initialize() runs
later in the probe sequence, would this cause a NULL pointer dereference?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519055114.1886=
525-1-a0987203069@gmail.com?part=3D4
