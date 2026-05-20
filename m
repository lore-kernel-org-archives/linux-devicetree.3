Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FADC1B7910
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282065; cv=none; b=ejccrhpUSylqnG7JuYN1rkcp9m31d4uDint2A1d4XqF/ulYvrATc5p5vgLcBQvyW0MTs4CgC56BJUc6meTnG5xRe58tw9nGMLgbPqW8a7oWLYakPfl49UTLpSxpG0TBGxhxxV9zp9/HTQDvkA79LWIq7g+XMqEJsKnYXXqMaweU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282065; c=relaxed/simple;
	bh=3EeMCFun8mscA2YufHt4ImsEVpGhsNV1zoW2jArE/dg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p3mPwMBEm1v/rRDVW+JYb2N3SeiqTcwOKt27+5CmdfGJ4qiPVUYCGQxg4PTCXtQbKNsVxQc0+DU4UxR9J3rv5RioUWkq0PD5KrtpAlT6j6qRjyJIG8181Lm0olh4NNpeECIDDwA6oLFO0H+lkF0Ux2fPi1uGTyPm85GLHefwo00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVb/HvGE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVb/HvGE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5011F000E9;
	Wed, 20 May 2026 13:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779282063;
	bh=n5hTbE5CikDvq6++tExDjaxZMP1yP34qRqXcG38AENE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GVb/HvGESk6enTh8nR+YNu1me9vDX4mpqbXoSm9n5lS6gRB9l+bQUHRmCpBvqfOd0
	 ba6aXV5EHSjvcz3707NMDAGNGk/0cYmg0TGu1v/N/yW9oeV6+PNLDCNUAWfGpvPvpW
	 zomGyvtzoxKnfHlPPMYlph6X/ALTrJcCeNE912XSVeoX0YIxmy+EGNm358a+6UDvM4
	 Zx7ItO6+cWhYOapMe9mt3ypEYBLA3PywGeqmBaOvWR+JC8hBst+4lB+WB4qRWOHvJa
	 /94HLemMIhwHKWVYmGBC94ZXLDpXS8Bnw5Lm2Wr1SN1wTtakJuLbswjf7li8kPqh0a
	 sN734hQ5lyFPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 16/17] media: ti: j721e-csi2rx: Support runtime
 suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260520120022.539913-17-r-donadkar@ti.com>
References: <20260520120022.539913-17-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 13:01:02 +0000
Message-Id: <20260520130103.6E5011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Incorrect runtime PM teardown in `ti_csi2rx_remove()` leads to DMA=
 channel leaks or a double-free race condition.
- [High] DMA channels are leaked on partial failure in `ti_csi2rx_runtime_r=
esume()`.
- [High] DMA channels are leaked in the `probe()` error path because PM run=
time is not yet active.
- [High] V4L2 queued buffers are permanently leaked if `pm_runtime_resume_a=
nd_get()` fails during `start_streaming`.
- [Medium] Missing `pm_runtime_disable()` in the `ti_csi2rx_probe()` error =
paths.
- [Medium] Device remains active and does not suspend until after the first=
 streaming cycle.

Pre-existing issues:
- [High] Use-After-Free of DMA channels during context cleanup when unbindi=
ng while streaming.
--

commit 53538590f347c3e725dc8547592ab3d045400955
Author: Jai Luthra <jai.luthra@ideasonboard.com>

media: ti: j721e-csi2rx: Support runtime suspend
   =20
Add support for runtime power-management to enable powering off the
shared power domain between Cadence CSI2RX and TI CSI2RX wrapper when
the device(s) are not in use.

> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 3142849f9bb9d..d68b8d6ffeb19 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c

[ ... ]

> @@ -964,14 +965,18 @@ static int ti_csi2rx_start_streaming(struct vb2_que=
ue *vq, unsigned int count)
>  	struct ti_csi2rx_dev *csi =3D ctx->csi;
>  	struct ti_csi2rx_dma *dma =3D &ctx->dma;
>  	unsigned long flags;
> -	int ret =3D 0;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(csi->dev);
> +	if (ret)
> +		return ret;

[Severity: High]
If pm_runtime_resume_and_get() fails here, we return directly. Since
start_streaming is failing, won't this cause any buffers currently queued in
the vb2 core to be permanently leaked because they bypass the cleanup at the
err label?

> =20
>  	spin_lock_irqsave(&dma->lock, flags);
>  	if (list_empty(&dma->queue))

[ ... ]

> @@ -1257,7 +1265,9 @@ static void ti_csi2rx_cleanup_notifier(struct ti_cs=
i2rx_dev *csi)
> =20
>  static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
>  {
> -	dma_release_channel(ctx->dma.chan);
> +	if (!pm_runtime_status_suspended(ctx->csi->dev))
> +		dma_release_channel(ctx->dma.chan);
> +
>  	vb2_queue_release(&ctx->vidq);

[Severity: High]
This is a pre-existing issue, but if we call dma_release_channel() before
vb2_queue_release(), could it lead to a use-after-free?

If the device is streaming during unbind, vb2_queue_release() synchronously
cancels the queue, which calls ti_csi2rx_stop_streaming() ->
ti_csi2rx_stop_dma(). That function then calls dmaengine_terminate_sync()
on the already freed channel.

Should vb2_queue_release() happen before releasing the DMA channel?

> =20
>  	video_unregister_device(&ctx->vdev);

[ ... ]

> @@ -1507,6 +1517,38 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx=
 *ctx)
>  	return ret;
>  }
> =20
> +static int ti_csi2rx_runtime_suspend(struct device *dev)
> +{

[ ... ]

> +}
> +
> +static int ti_csi2rx_runtime_resume(struct device *dev)
> +{
> +	struct ti_csi2rx_dev *csi =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	for (unsigned int i =3D 0; i < csi->num_ctx; i++) {
> +		ret =3D ti_csi2rx_init_dma(&csi->ctx[i]);
> +		if (ret)
> +			return ret;

[Severity: High]
If ti_csi2rx_init_dma() fails for i > 0, we return the error immediately.
Does this leak the successfully allocated DMA channels for previous contexts
since we don't clean them up on this failure path?

> +	}
> +
> +	return 0;
> +}

[ ... ]

> @@ -1562,6 +1604,9 @@ static int ti_csi2rx_probe(struct platform_device *=
pdev)
>  			goto err_ctx;
>  	}
> =20
> +	pm_runtime_set_active(csi->dev);

[Severity: High]
If ti_csi2rx_init_ctx() fails for a subsequent context in the loop just
above, the code jumps to err_ctx and cleans up prior contexts with
ti_csi2rx_cleanup_ctx().

However, since pm_runtime_set_active() hasn't been called yet in that failu=
re
path, the device is still in its default RPM_SUSPENDED state. Since
ti_csi2rx_cleanup_ctx() now skips releasing the DMA channel if suspended,
won't this permanently leak the channels during the probe error path?

> +	pm_runtime_enable(csi->dev);

[Severity: Medium]
We set the device as active and enable runtime PM here, but I don't see an
idle transition scheduled (like pm_runtime_idle() or
pm_runtime_put_autosuspend()).

Will the device and its power domain remain powered on indefinitely until
userspace starts and stops a stream for the first time?

[Severity: Medium]
If a subsequent initialization step fails (like
ti_csi2rx_notifier_register() below), the probe function jumps to error
labels and returns. Are we missing a call to pm_runtime_disable() to
disable runtime PM in these error paths?

> +
>  	ret =3D ti_csi2rx_notifier_register(csi);
>  	if (ret)
>  		goto err_ctx;

[ ... ]

> @@ -1592,6 +1637,9 @@ static void ti_csi2rx_remove(struct platform_device=
 *pdev)
>  	struct ti_csi2rx_dev *csi =3D platform_get_drvdata(pdev);
>  	unsigned int i;
> =20
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		pm_runtime_set_suspended(&pdev->dev);
> +

[Severity: High]
Since pm_runtime_disable() hasn't been called yet, runtime PM is still
enabled. Doesn't pm_runtime_set_suspended() return -EAGAIN when runtime PM
is enabled, failing to change the status?

If the status remains RPM_ACTIVE, ti_csi2rx_cleanup_ctx() below will release
the DMA channels. Meanwhile, an asynchronous suspend callback could run
concurrently if a put was triggered right before removal, potentially causi=
ng
a double-free of the DMA channels.

Should pm_runtime_disable() be called before attempting to change the statu=
s?

>  	for (i =3D 0; i < csi->num_ctx; i++)
>  		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520120022.5399=
13-1-r-donadkar@ti.com?part=3D16
