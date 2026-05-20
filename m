Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A33E3C5827
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779319803; cv=none; b=hVpuUhYwWJFOntL+C5KF+aNzo1sknAiSR/idLz9fRiBt8sgahH7YHPTh95ukoqvaGViaX+kAfGtQyyibUncIoYaitQ4SDR0bePqVFfK+/uXJmbS37QiFGJi2BQGsCpEplgvaGnbGU2jk6VgePuLmDSXnoI8JyT/DmPANodEazeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779319803; c=relaxed/simple;
	bh=PEBzuiCgmk6b7hfi3LR6j7q6eGTkWKG9HZ8bzf4TnqQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aOfRmTrdUPuG2zNdmwt5PUsW7xUJF0FRMqJzndqRgUaclDBeNdFGujKR4SHoNJ1scIOy0SGTtkPOZqw1ZZmXE/N10BoGHzBTTasKdprcfOTSSLtEbm+62zQvyfpsYrNOF34oYsKp91A8/rWNTmkVQpjHq6ZLXLB2IWrIyayq1W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ij1jkOeu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ij1jkOeu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D05A1F000E9;
	Wed, 20 May 2026 23:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779319801;
	bh=3EfWHs1d7dLs3SA9I2qR29tSPqZylJXA2dRi4aITn9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ij1jkOeuX/f9myEfrEG1vC4bzOidoO3GQP+jSdgPlQp7H8ucwQp/hOVBVuKRUMH1f
	 rT6ZTk1SdE/44BHXzUYDQDWH8EH+PPttlb6JXCb48VPaRSZg/eSnNfm8B6H4dNMmsj
	 XaZnNA84oHMhT1uU/5NK9yF7icaUzu0n9hYiT++7oWdjXB6ZRv9tXnF3XO6I+FjgQt
	 60UI9D+lOHMlQWrzO/GCC3UeY4FM7e8jMg+KpJb+ElhgHrEvp7vQGZ6hQWHagGJ1DI
	 uPLdDd84oSbMzh2r2mSjOqMYhVp7PDLionsGorHj6Ho00+3VW9cKgHsh0v008N0hp0
	 w+iSpNMmu9zig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 11/28] media: rockchip: rga: move hw specific parts
 to a dedicated struct
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521-spu-rga3-v7-11-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-11-3f33e8c7145f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 23:30:01 +0000
Message-Id: <20260520233001.9D05A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect teardown order in `rga_remove` leading to Use-After-Free.
- [High] DMA API violation by calling `dma_sync_single_for_device` on coher=
ent memory.
- [High] Interrupt requested before initialization completes, leading to NU=
LL pointer dereference.
- [High] Integer overflow in crop rectangle bounds checking allows out-of-b=
ounds hardware configuration.
--

commit 63f3895edbf7bdcd51455c0b84ff437cd58591cd
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
Subject: media: rockchip: rga: move hw specific parts to a dedicated struct

In preparation for the RGA3 unit, move RGA2 specific parts from rga.c to
rga-hw.c and create a struct to reference the RGA2 specific functions and
formats.

> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index ec6c17504ca15..40498796507e0 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -437,8 +437,8 @@ static void rga_cmd_set(struct rga_ctx *ctx,
>  		PAGE_SIZE, DMA_BIDIRECTIONAL);
>  }

[Severity: High]
This is a pre-existing issue, but does this code violate the DMA API?

The command buffer is allocated via dma_alloc_attrs() with
DMA_ATTR_WRITE_COMBINE, which returns a consistent/coherent DMA mapping.
However, dma_sync_single_for_device() is only intended for streaming DMA
mappings.

Could using dma_sync_single_for_device() on coherent allocations lead to
kernel warnings or undefined cache behavior?

> -void rga_hw_start(struct rockchip_rga *rga,
> -		  struct rga_vb_buffer *src, struct rga_vb_buffer *dst)
> +static void rga_hw_start(struct rockchip_rga *rga,
> +			 struct rga_vb_buffer *src,  struct rga_vb_buffer *dst)
>  {

[ ... ]

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 8c34f73d69764..f599c992829dd 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c

[ ... ]

> @@ -660,7 +527,7 @@ static int vidioc_s_selection(struct file *file, void=
 *priv,
> =20
>  	if (s->r.left + s->r.width > f->pix.width ||
>  	    s->r.top + s->r.height > f->pix.height ||
> -	    s->r.width < MIN_WIDTH || s->r.height < MIN_HEIGHT) {
> +	    s->r.width < rga->hw->min_width || s->r.height < rga->hw->min_heigh=
t) {

[Severity: High]
This is a pre-existing issue, but can this crop rectangle bounds check be
bypassed by integer overflow?

Because s->r.left is a signed 32-bit integer and s->r.width is an unsigned
32-bit integer, if a user provides left =3D 1 and width =3D 0xFFFFFFFF, the
addition is performed as an unsigned 32-bit operation and wraps around to 0.

The check 0 > f->pix.width would evaluate to false. The subsequent minimum
bounds check (s->r.width < rga->hw->min_width) is an unsigned comparison, so
0xFFFFFFFF < 34 evaluates to false as well.

Could this allow arbitrary out-of-bounds hardware configuration and memory
corruption?

>  		v4l2_dbg(debug, 1, &rga->v4l2_dev, "unsupported crop value.\n");
>  		return -EINVAL;
>  	}

[ ... ]

> @@ -770,6 +637,10 @@ static int rga_probe(struct platform_device *pdev)
>  	if (!rga)
>  		return -ENOMEM;
> =20
> +	rga->hw =3D of_device_get_match_data(&pdev->dev);
> +	if (!rga->hw)
> +		return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match data\n"=
);
> +

[Severity: High]
This is a pre-existing issue, but is the device interrupt requested too ear=
ly
in this function?

Looking at rga_probe(), devm_request_irq() is called before rga->m2m_dev is
allocated and before the device is registered.

If a spurious interrupt or a pending interrupt from a previous driver sessi=
on
fires immediately, rga_isr() executes. It reads ctx =3D rga->curr (which is
NULL), hits WARN_ON(!ctx), and then unconditionally dereferences it via
ctx->fh.m2m_ctx.

Could this result in a kernel panic if the interrupt triggers during probe?

>  	rga->dev =3D &pdev->dev;
>  	spin_lock_init(&rga->ctrl_lock);
>  	mutex_init(&rga->mutex);

[ ... ]

> @@ -883,7 +750,7 @@ static void rga_remove(struct platform_device *pdev)
>  {
>  	struct rockchip_rga *rga =3D platform_get_drvdata(pdev);
> =20
> -	dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
> +	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,

[Severity: High]
This is a pre-existing issue, but does the teardown order in rga_remove()
create a use-after-free window?

Because dma_free_attrs() is called here, and v4l2_m2m_release() shortly
after, but video_unregister_device() happens even later. Could userspace
still issue ioctls to an already open file descriptor, accessing the freed
m2m_dev structure or DMA memory?

Also, without explicitly disabling the device interrupt before freeing these
resources, could an active hardware conversion trigger rga_isr() and access
the freed m2m_dev?

>  		       rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
> =20
>  	v4l2_info(&rga->v4l2_dev, "Removing\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-spu-rga3-v=
7-0-3f33e8c7145f@pengutronix.de?part=3D11
