Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E371C3C4B98
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779320658; cv=none; b=dylpEAdHIILfGBjoa5xWlm0w1XP/QrFd1hG8rjY4kgrmSPxCS61d2OYaZdi9Ymnra4LX8NNZ10yzi3YdXmyMtGfJw3+0z1v94AseuXqPBvDcRlo4v5qqyn6CKXIFwvz1ryulDC8RGcsGyqxT2Hnc1+XDDi8SNYi4PwS8HhhSL9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779320658; c=relaxed/simple;
	bh=GcHaS8RkwGK/Yfc3iy46PXDO/H7Vjb2QQk1a9MUjiKo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QEBXtNs+MLMYmnTb4ZIRPmSFQU+6XMtYSCgyWytt2bBXtMCNKuARff0yjrZYrlyuoGGEs3T+Zw+zIEWVaA4l8bZeB2txNZKt7qX41uCgNxqy7Tnkp80ZnndnOXrLEA6XsyHp+FzbxVIojAnqJXf31d75GM49Bfeyk2W5f/0EGG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+CsRdfS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+CsRdfS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D761F000E9;
	Wed, 20 May 2026 23:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779320654;
	bh=UxvUuarodIjmb5pOlR49OQuqRYHojrRwjPBe4bSljjc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g+CsRdfSR/u9ruhpjJpFiFz8S7VOAgsQugbthXaYjlvdEz9pnk/xLcYUPOG8JYpeB
	 +u3N3bsqc11ne0bgVaFEdE5+fbpB2ofoZldFy+hmdyuCU9VoqmpuqRooe7umUZDnYZ
	 DmISdMDr4ZSn/RfW/k1E3izpaJwyRcUNrDyQumsojjYv0R8JC/YZsHG4+ZH3z5dpWF
	 KJYQG7qOaj+/W9CVfS9AHocH3jafgRSkcPYs5G1a2InB4i2pWFI5QgEenYuBsBW8TP
	 FdgfzLAdXq/zdGDCEsH/GWBiCUsiwahJvW84Y/nnwMJhHiZTzbUVXLcbGb+r/12xS9
	 PZP/pSMojpSew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 14/28] media: rockchip: rga: move cmdbuf to rga_ctx
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-spu-rga3-v7-14-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-14-3f33e8c7145f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 23:44:13 +0000
Message-Id: <20260520234413.E6D761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Unbounded per-file-descriptor DMA memory allocation in `rga_open` =
allows unprivileged users to exhaust system CMA/DMA memory.

Pre-existing issues:
- [Critical] Use-After-Free vulnerability in `rga_release` during driver un=
bind, exacerbated by new DMA cleanup code.
- [Critical] Ignored error return from `rga_setup_ctrls` in `rga_open` lead=
s to the use of a destroyed mutex and a Double-Free.
- [Critical] Race condition in `rga_remove()` releases the V4L2 M2M device =
before unregistering the video node, creating a Use-After-Free window.
--

commit a7b385663b985b57ae0c1fc76e2b2adad26d093e
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: move cmdbuf to rga_ctx
   =20
Move the command buffer to the rga_ctx struct in preparation to reuse
an already prepared command buffer. This allows to split the command
buffer setup in a further commit to setup a template for the command
buffer at streamon and only update the buffer addresses in device_run
and trigger the command stream.

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 77b8c7ab74274..bf6bbcbfc869b 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -219,6 +219,16 @@ static int rga_open(struct file *file)
>  	ctx =3D kzalloc_obj(*ctx);
>  	if (!ctx)
>  		return -ENOMEM;
> +
> +	/* Create CMD buffer */
> +	ctx->cmdbuf_virt =3D dma_alloc_attrs(rga->dev, rga->hw->cmdbuf_size,
> +					   &ctx->cmdbuf_phy, GFP_KERNEL,
> +					   DMA_ATTR_WRITE_COMBINE);

[Severity: High]
Does this allow an unprivileged user to exhaust system CMA/DMA memory?

Since the buffer is now allocated per file descriptor rather than once duri=
ng
device probe, and there seem to be no driver-level limits on how many times
the V4L2 device can be opened, could a user loop open() or use fork() to
unboundedly allocate DMA memory?

> +	if (!ctx->cmdbuf_virt) {
> +		ret =3D -ENOMEM;
> +		goto rel_ctx;
> +	}
> +
>  	ctx->rga =3D rga;
>  	/* Set default formats */
>  	ctx->in =3D def_frame;

[ ... ]

> @@ -252,6 +260,15 @@ static int rga_open(struct file *file)
>  	mutex_unlock(&rga->mutex);
> =20
>  	return 0;

[Severity: Critical]
This is a pre-existing issue, but the return value of rga_setup_ctrls(ctx)
seems to be completely ignored before returning from rga_open().

If control setup fails, rga_setup_ctrls() calls v4l2_ctrl_handler_free(),
which destroys the control handler's mutex and frees its internal structure=
s.

By continuing execution blindly and returning 0, does the subsequent call to
v4l2_ctrl_handler_setup() end up locking a destroyed mutex?

Additionally, since the file descriptor becomes valid, won't rga_release()
eventually call v4l2_ctrl_handler_free() again and cause a double-free?

> +
> +unlock_mutex:
> +	mutex_unlock(&rga->mutex);
> +rel_cmdbuf:
> +	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, ctx->cmdbuf_virt,
> +		       ctx->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
> +rel_ctx:
> +	kfree(ctx);
> +	return ret;
>  }
> =20
>  static int rga_release(struct file *file)
> @@ -266,6 +283,10 @@ static int rga_release(struct file *file)
>  	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>  	v4l2_fh_del(&ctx->fh, file);
>  	v4l2_fh_exit(&ctx->fh);
> +
> +	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, ctx->cmdbuf_virt,
> +		       ctx->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
> +

[Severity: Critical]
This is a pre-existing issue, but because rga is allocated with
devm_kzalloc() in rga_probe(), if a user keeps the file descriptor open
during driver unbind, won't rga be automatically freed by devres?

When the file is later closed, doesn't rga_release() dereference the freed
rga pointer when locking rga->mutex?

Does this new dma_free_attrs() call introduce another use-after-free vector
by dereferencing the already freed rga->dev pointer?

>  	kfree(ctx);
> =20
>  	mutex_unlock(&rga->mutex);

[ ... ]

> @@ -759,9 +768,6 @@ static void rga_remove(struct platform_device *pdev)
>  {
>  	struct rockchip_rga *rga =3D platform_get_drvdata(pdev);
> =20
> -	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
> -		       rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
> -
>  	v4l2_info(&rga->v4l2_dev, "Removing\n");
> =20
>  	v4l2_m2m_release(rga->m2m_dev);

[Severity: Critical]
This is a pre-existing issue, but does this function release the V4L2 memory
to memory context before unregistering the video device?

If v4l2_m2m_release() is called before video_unregister_device(), isn't the
video node still fully accessible to userspace during this window?

If a concurrent ioctl is dispatched, could the V4L2 core route it to the
driver, causing it to dereference the already freed rga->m2m_dev?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-spu-rga3-v=
7-0-3f33e8c7145f@pengutronix.de?part=3D14
