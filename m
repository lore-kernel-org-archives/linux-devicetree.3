Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAB63D1CDB
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280646; cv=none; b=uX3wSAxbPWvhn9R0UvodSBqIu2PCvTVoX8fZP9gORlJctzxb2cn4zgixpw81+P51YUIHFIOwO9WWwSzirJsP+C4Eu4lulkpDmjeWBjeUedhaw/cmrZpkJPF6rYzte9xiTUzZSGZcd/hdtyihX0QesguJRxmv0E10yERY6/2Yghw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280646; c=relaxed/simple;
	bh=2uMQsMrP9xf8zPQ0iCGUsOe2/OzwLt+P80mEwEEGwds=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W4AaG9jZvF19cfgQX58l7sMVivZOXhCD7mUnNKz1MLiw+nmuEZisvbFwwUd2uIViGKAQcS7ExM+Dzi0pVdtcQLGQMwWlI/lOyM8/D+b1H7q0fQ8gBJU3Sk/jpjmarMJfC1vID4OwXrIPd+TYv0h6l8M6pL2JbclHcmEsNggEizU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGOeSxbl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGOeSxbl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D5E1F000E9;
	Wed, 20 May 2026 12:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779280645;
	bh=WeVfoYxbtLhS4KOcv+csVi4XaIdoFQo1zaqbDYbbfew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QGOeSxbl6aG1gYVVLUPIb2RrLPiYhb4ubEIv1CLtfT6utyFN+8640G0LYTd2sbK4l
	 B0qRPZ5be5bMGPu3amNeq6S+soypmOJv1YPv31OlNuiOhsW/bvZrGuiibeAzneU2Qz
	 C5SZyncReGDxMIJAsvYYoNvwnqCjpHTpX9VcKLGjBt/vQf1vKONrnmXMMz9fHUI52L
	 QXspdeQuGGyMscB9rcOZkwCnryJZvOoLbGnX/Yonk9FP5rt78BN9eBnf8J1quMdtGo
	 ZkHTdyytS0khPOrng0qRuLd5E5BhhLMKCjlC2d2E8kgCIsmkXqlkqA/tBKqV5tZ03t
	 ODpmF0V+I/P9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 03/17] media: ti: j721e-csi2rx: separate out device
 and context
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520120022.539913-4-r-donadkar@ti.com>
References: <20260520120022.539913-4-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 12:37:24 +0000
Message-Id: <20260520123724.D1D5E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Incorrect teardown order in `ti_csi2rx_cleanup_ctx` releases the D=
MA channel and vb2 queue before unregistering the video device.
- [Low] Comma operator used instead of semicolons for struct field assignme=
nts.

Pre-existing issues:
- [High] Unsafe teardown order in `ti_csi2rx_remove` destroys contexts befo=
re unregistering the async notifier.
- [High] The `video_device` struct is freed via devres before userspace fil=
e descriptors are closed.
--

commit 2c69e8bb02469f4292c85082c0033fc459b17d78
Author: Jai Luthra <jai.luthra@linux.dev>
media: ti: j721e-csi2rx: separate out device and context

This commit separates out the device and DMA context in the TI CSI2RX driver
to support multiplexed stream capture. It creates a new ti_csi2rx_ctx
struct to hold the context-specific data.

> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 710d05a053539..23717a3b6c4cf 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c

[ ... ]

> +static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
> +{
> +	dma_release_channel(ctx->dma.chan);
> +	vb2_queue_release(&ctx->vidq);
> +
> +	video_unregister_device(&ctx->vdev);
> +
> +	mutex_destroy(&ctx->mutex);
> +}

[Severity: High]
Can this cause a use-after-free if the driver is unbound while streaming
is active?

If vb2_queue_release() is called before video_unregister_device(), it
stops the queue, which invokes ti_csi2rx_stop_streaming() and subsequently
ti_csi2rx_stop_dma(). ti_csi2rx_stop_dma() will then attempt to access the
already freed ctx->dma.chan pointer to terminate the DMA.

Should the video device be unregistered first to prevent concurrent ioctls,
followed by releasing the vb2 queue, and finally releasing the DMA channel?

[ ... ]

> +static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
> +{

[ ... ]

> -	pix_fmt->ycbcr_enc =3D V4L2_YCBCR_ENC_601;
> -	pix_fmt->quantization =3D V4L2_QUANTIZATION_LIM_RANGE;
> -	pix_fmt->xfer_func =3D V4L2_XFER_FUNC_SRGB;
> -
> -	ti_csi2rx_fill_fmt(fmt, &csi->v_fmt);
> +	pix_fmt->ycbcr_enc =3D V4L2_YCBCR_ENC_601,
> +	pix_fmt->quantization =3D V4L2_QUANTIZATION_LIM_RANGE,
> +	pix_fmt->xfer_func =3D V4L2_XFER_FUNC_SRGB,
> =20
> -	mdev->dev =3D csi->dev;
> -	mdev->hw_revision =3D 1;
> -	strscpy(mdev->model, "TI-CSI2RX", sizeof(mdev->model));
> +	ti_csi2rx_fill_fmt(fmt, &ctx->v_fmt);

[Severity: Low]
This isn't a bug, but is it intentional to use commas instead of semicolons
for these assignments? It appears to be a typo introduced during the
refactoring.

[ ... ]

>  	vdev->vfl_dir =3D VFL_DIR_RX;
>  	vdev->fops =3D &csi_fops;
>  	vdev->ioctl_ops =3D &csi_ioctl_ops;
>  	vdev->release =3D video_device_release_empty;

[Severity: High]
This isn't a bug introduced by this patch, but could this lead to a
use-after-free if a userspace process holds an open file descriptor when the
device unbinds?

The video_device is embedded inside ti_csi2rx_ctx, which is part of the
ti_csi2rx_dev allocated via devm_kzalloc(). Since devres frees the memory
immediately upon returning from the remove function, any later V4L2 operati=
ons
or file descriptor closures by userspace might access freed memory.

[ ... ]

>  static void ti_csi2rx_remove(struct platform_device *pdev)
>  {
>  	struct ti_csi2rx_dev *csi =3D platform_get_drvdata(pdev);
> +	unsigned int i;
> =20
> -	video_unregister_device(&csi->vdev);
> +	for (i =3D 0; i < TI_CSI2RX_NUM_CTX; i++)
> +		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
> =20
> -	ti_csi2rx_cleanup_vb2q(csi);
> -	ti_csi2rx_cleanup_subdev(csi);
> +	ti_csi2rx_cleanup_notifier(csi);

[Severity: High]
This is a pre-existing issue, but does cleaning up the contexts before
unregistering the async notifier pose a risk?

If the async subdev binding completes concurrently while remove is executin=
g,
the notifier's complete callback (csi_async_notifier_complete) might attempt
to register video devices using the already destroyed contexts.

Should the async notifier be unregistered first to guarantee no async
callbacks fire during teardown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520120022.5399=
13-1-r-donadkar@ti.com?part=3D3
