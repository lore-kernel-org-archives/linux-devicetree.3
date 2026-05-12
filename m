Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C718625F7A5
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778548328; cv=none; b=SWREM2138h2FLXIE+yQT2SGvOfV3G+ZxI+/f3vsZ46Qkpx5rIEFF58F73fhfeyD00CYYPUtSEsEmVONBU0FJA/UMmw/Zd99Ziyxa8R9rAmYaNoxEPiS3628rbn5fRmfWfNELr+E9cKpjS7A7106O+dqk3nAheFdMwDsmTDCkxws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778548328; c=relaxed/simple;
	bh=M7Ch6uVgbesLp6xGNdVEJSycki9fRn6OnyI+5Mv05fk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=krbQJGBDgwxmIwy4ZE8Ysy0O6TEdJx63ohWBbSo1eVx5gx/qXCUM9IBiapZ3obl0fQh/No+pHTsz1lVpQGQvGuP0UGNB98ONgFf3lfo79QqgUyMLuyi4HnX8vz17/OA01eWjPMB2LhKsTzcbr4OY6QoydtMsj2yqkyCpqVy+QrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dsc5i+aX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dsc5i+aX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFBDC2BCB0;
	Tue, 12 May 2026 01:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778548328;
	bh=M7Ch6uVgbesLp6xGNdVEJSycki9fRn6OnyI+5Mv05fk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Dsc5i+aXoHtjg7v49XEqPOKCZYIliTcHf1WtFpALFjpCrAzFP7Vkjg2BTaRmRfjkb
	 rWFbvdrU/zBEl5XqOMh9vOBWuvgl10CuRHjLpeVT4did4fVbPp7ZNl8TogGEGVEbmp
	 t3tJhfdn/Ay0gOm7z+3abgxVkpSmAeTbT5Z7vFAeRN/s7m5zWTs5znLq0k5w5qoo/m
	 v5taXtbLUyvs1oh9ece9CHgLrEaN7ePhROzsUSSWUaYtlhJcFhBnKpJGpHQDjWiTrG
	 kjZ3erfnURlIr/AWyV04Ny0Ph2+p28aTc3xVfO++eCP6UG83aiiRhxfXUojpwrPef1
	 KlADEgM8fuqxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/verisilicon: add support for Nuvoton MA35D1
 DCUltra Lite display controller
Reply-To: sashiko@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260511075142.54752-3-a0987203069@gmail.com>
References: <20260511075142.54752-3-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 01:12:07 +0000
Message-Id: <20260512011208.2FFBDC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The primary plane is never logically disabled in hardware for the =
DCUltra Lite variant, leading to a Use-After-Free condition.
- [High] The primary plane is enabled before its DMA address and size are c=
onfigured, causing a hardware race condition.
- [High] The DCUltra Lite IRQ handler fails to acknowledge interrupts and u=
nconditionally returns IRQ_HANDLED, which can cause an interrupt storm.
- [High] Pre-existing NULL pointer dereference in early IRQ handling due to=
 incorrect initialization order.
--

commit 522901c8020d5fe12ddd26c3af8e4d282c2fd2fd
Author: Joey Lu <a0987203069@gmail.com>
Subject: drm/verisilicon: add support for Nuvoton MA35D1 DCUltra Lite displ=
ay controller

This commit adds support for the Nuvoton MA35D1 DCUltra Lite display
controller to the verisilicon DRM driver. It introduces a vs_dc_info
platform data structure to handle architectural differences between the
DC8000 and DCUltra Lite variants.

> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c b/drivers/gpu/drm/verisi=
licon/vs_dc.c
> index dad9967bc10b8..82a6a26f6d817 100644
> --- a/drivers/gpu/drm/verisilicon/vs_dc.c
> +++ b/drivers/gpu/drm/verisilicon/vs_dc.c

[ ... ]

> @@ -33,6 +57,13 @@ static irqreturn_t vs_dc_irq_handler(int irq, void *pr=
ivate)
>  	struct vs_dc *dc =3D private;
>  	u32 irqs;
> =20
> +	if (dc->info->family =3D=3D VS_DC_FAMILY_DCULTRA_LITE) {
> +		regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &irqs);
> +		if (irqs & BIT(0))
> +			vs_drm_handle_irq(dc, VSDC_TOP_IRQ_VSYNC(0));
> +		return IRQ_HANDLED;
> +	}

Does this missing ACK cause an interrupt storm?

The DCUltra Lite code path reads the interrupt status but does not appear to
write back to clear the pending hardware interrupt.

Additionally, unconditionally returning IRQ_HANDLED might prevent the spuri=
ous
interrupt detector from disabling a faulty IRQ line.

This isn't a bug introduced by this patch, but could this lead to a NULL
pointer dereference during boot?

In vs_dc_probe(), the IRQ handler is requested before initialization:

	ret =3D devm_request_irq(dev, irq, vs_dc_irq_handler, 0,
			       dev_name(dev), dc);
	...
	ret =3D vs_drm_initialize(dc, pdev);

If a leftover hardware interrupt fires immediately, vs_dc_irq_handler() cal=
ls
vs_drm_handle_irq(), which accesses dc->drm_dev->crtcs[i].

Since dc->drm_dev is allocated inside vs_drm_initialize(), it appears
an early interrupt would dereference a NULL pointer.

> diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu=
/drm/verisilicon/vs_primary_plane.c
> index 1f2be41ae496c..197d5d683e224 100644
> --- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> +++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c

[ ... ]

> @@ -88,8 +91,9 @@ static void vs_primary_plane_atomic_disable(struct drm_=
plane *plane,
>  	unsigned int output =3D vcrtc->id;
>  	struct vs_dc *dc =3D vcrtc->dc;
> =20
> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
> -			VSDC_FB_CONFIG_EX_FB_EN);
> +	if (dc->info->has_config_ex)
> +		regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
> +				VSDC_FB_CONFIG_EX_FB_EN);
> =20
>  	vs_primary_plane_commit(dc, output);
>  }

If has_config_ex is false for DCUltra Lite, how is the primary plane disabl=
ed
in hardware here?

Since the disable sequence is skipped, will the display controller continue
fetching from the framebuffer memory after it is freed by the DRM core?
This could lead to a use-after-free by the DMA engine.

[ ... ]

> @@ -126,6 +130,11 @@ static void vs_primary_plane_atomic_update(struct dr=
m_plane *plane,
>  			   VSDC_FB_CONFIG_UV_SWIZZLE_EN,
>  			   vs_state->format.uv_swizzle);
> =20
> +	/* DCUltra Lite requires explicit enable/reset bits in FB_CONFIG */
> +	if (!dc->info->has_config_ex)
> +		regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
> +				VSDC_FB_CONFIG_ENABLE | VSDC_FB_CONFIG_RESET);
> +
>  	dma_addr =3D vs_fb_get_dma_addr(fb, &state->src);
> =20
>  	regmap_write(dc->regs, VSDC_FB_ADDRESS(output),
> @@ -133,16 +142,18 @@ static void vs_primary_plane_atomic_update(struct d=
rm_plane *plane,
>  	regmap_write(dc->regs, VSDC_FB_STRIDE(output),
>  		     fb->pitches[0]);

Could enabling the plane before configuring its DMA address and size cause
the hardware to fetch from uninitialized or stale memory?

Since DCUltra Lite does not use a shadow register commit mechanism, it seems
the address and stride should be programmed before setting the
VSDC_FB_CONFIG_ENABLE bit to prevent out-of-bounds memory accesses.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511075142.5475=
2-1-a0987203069@gmail.com?part=3D2
