Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC8C3F44CA
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778861521; cv=none; b=U6yPCPBA1MMXqsKrxYIwMWa+AmAYltzGVtppRYCmwL8EJ4PnCGh+cykD3oOE032IibJeiE/oNxqalaCxZZVPpkI9v+T0jElA98u4qjCYGOmcLtSP08Yl/jvkWeyOxD9Mi9IDN0rODWcTiEz3QOweWCbHwUrZ7WSvWthV8caSJyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778861521; c=relaxed/simple;
	bh=vYFdlplBJW2lgU2iCF2//pRD4EjgThjXjTmcN2cH9/A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iT81FDEDZvXyxxPxpfm0Bzr8a1VzlM+CNbPUn3hB77V42MDfqBsQ+KUxNTcHkbFRXHpkZc/x6IQe9uO7xlc1IdxgA9GSUlXSnkwAhQbxYcdFscvupwiYlOGmCCXOpSG6WLehw7q0dxmXlbuanqQP5ibM1iwLeSX2T0BoiEn08Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AhM57Zto; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AhM57Zto"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58C6C2BCB0;
	Fri, 15 May 2026 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778861521;
	bh=vYFdlplBJW2lgU2iCF2//pRD4EjgThjXjTmcN2cH9/A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=AhM57Ztoe1uVgx9yF0RtTHy9vYFoZVpvDV1Znq8B6yvwGDfEMlq0RKBJIAy4ZvUUL
	 PZ56syreQWraL80gQy/pfboXTX88tfq36lHGu9LIqYPQY6Y2qYdvaN4PImbem1dXv0
	 tfw+HHwl2r2KAG6qXpWKBcZ/3Sav/NsCQyuHQCqxaJBe1rqziUj54tPGy67OY8UYzC
	 13urivdcF2vsuMf8jpuWoqLWMIBFN8sqlR+dcR9bt72P0zt5VmUynfExfCkUzJOjZm
	 wxf9FPMes6fIH/xDV9E77FAnuis74/0K29hhRB2BhTSFjgwoAZaeORzv6Cv4l8/2pa
	 QEJyv14WXJV9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 14/28] media: rockchip: rga: move cmdbuf to rga_ctx
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-spu-rga3-v6-14-e547152eb9c9@pengutronix.de>
References: <20260515-spu-rga3-v6-14-e547152eb9c9@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 16:12:00 +0000
Message-Id: <20260515161200.D58C6C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Moving `dma_free_attrs()` to `rga_release()` exacerbates a Use=
-After-Free vulnerability.
- [High] Pre-existing Runtime PM race condition in the `rga_probe` error pa=
th.
- [High] Pre-existing Use-After-Free in `rga_open` due to ignored return va=
lue from `rga_setup_ctrls`.
- [High] Pre-existing Race Condition in `rga_remove` leading to Use-After-F=
ree on the mem2mem device.
--

commit 4ef6c9ed68ddeb3165ce5597644374f3db2140ac
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: move cmdbuf to rga_ctx

This commit moves the command buffer to the rga_ctx struct to prepare for
reusing an already prepared command buffer. No sync point is added, as one
command buffer is only used for one conversion at a time.

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c

[ ... ]

> @@ -230,15 +240,13 @@ static int rga_open(struct file *file)
>  			    ctx->out.fmt->fourcc, def_width, def_height);
> =20
>  	if (mutex_lock_interruptible(&rga->mutex)) {
> -		kfree(ctx);
> -		return -ERESTARTSYS;
> +		ret =3D -ERESTARTSYS;
> +		goto rel_cmdbuf;
>  	}
>  	ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(rga->m2m_dev, ctx, &queue_init);
>  	if (IS_ERR(ctx->fh.m2m_ctx)) {
>  		ret =3D PTR_ERR(ctx->fh.m2m_ctx);
> -		mutex_unlock(&rga->mutex);
> -		kfree(ctx);
> -		return ret;
> +		goto unlock_mutex;
>  	}
>  	v4l2_fh_init(&ctx->fh, video_devdata(file));
>  	v4l2_fh_add(&ctx->fh, file);

This isn't a bug introduced by this patch, but while reviewing this area I
noticed that rga_open() calls rga_setup_ctrls() just after this block:

	rga_setup_ctrls(ctx);

	/* Write the default values to the ctx struct */
	v4l2_ctrl_handler_setup(&ctx->ctrl_handler);

Is it safe to ignore the return value of rga_setup_ctrls() here?

If the control setup fails, rga_setup_ctrls() frees the control handler and
destroys its mutex internally. Because the failure is ignored, the code
proceeds to call v4l2_ctrl_handler_setup() on the destroyed handler, which
could trigger a use-after-free on the mutex and internal control structures.

[ ... ]

> @@ -266,6 +283,10 @@ static int rga_release(struct file *file)
>  	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>  	v4l2_fh_del(&ctx->fh, file);
>  	v4l2_fh_exit(&ctx->fh);
> +
> +	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, ctx->cmdbuf_virt,
> +		       ctx->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
> +
>  	kfree(ctx);
> =20
>  	mutex_unlock(&rga->mutex);

Could this trigger a use-after-free when the file descriptor is kept open
after the device unbinds?

The rga structure is allocated using devm_kzalloc() during probe, which
means it is automatically freed by devres when the device is unbound via
sysfs or module removal. If userspace keeps the V4L2 file descriptor open
after the device is removed, rga_release() will be called on close.

When that happens, dma_free_attrs() dereferences the already freed rga
pointer to access rga->dev and rga->hw. Calling the DMA API with a detached
or destroyed device structure might also trigger IOMMU faults or kernel
panics.

[ ... ]

> @@ -720,19 +741,10 @@ static int rga_probe(struct platform_device *pdev)
> =20
>  	pm_runtime_put(rga->dev);
> =20
> -	/* Create CMD buffer */
> -	rga->cmdbuf_virt =3D dma_alloc_attrs(rga->dev, rga->hw->cmdbuf_size,
> -					   &rga->cmdbuf_phy, GFP_KERNEL,
> -					   DMA_ATTR_WRITE_COMBINE);
> -	if (!rga->cmdbuf_virt) {
> -		ret =3D -ENOMEM;
> -		goto rel_m2m;
> -	}
> -
>  	ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
>  		v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
> -		goto free_dma;
> +		goto rel_m2m;
>  	}

This isn't a bug introduced by this patch, but could this error path leave
the hardware in an active power state indefinitely?

If video_register_device() fails, the code jumps to rel_m2m, which falls
through to the err_put_clk label:

err_put_clk:
	pm_runtime_disable(rga->dev);

Because an asynchronous pm_runtime_put(rga->dev) is called just before
registration, the pending async suspend work would be abruptly canceled by
the internal barrier in pm_runtime_disable(). Should this use
pm_runtime_put_sync() instead before entering the error path?

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

This isn't a bug introduced by this patch, but does calling
v4l2_m2m_release() here before video_unregister_device() create a race
condition?

If v4l2_m2m_release(rga->m2m_dev) runs first, it leaves a window where the
video node is still active and accessible to userspace, but the backing
mem2mem device has already been freed.

If a user space program calls an ioctl during this window, could the file
operations access the freed rga->m2m_dev and cause a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-spu-rga3-v=
6-0-e547152eb9c9@pengutronix.de?part=3D14
