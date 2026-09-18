Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB9A4F93CF
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738611; cv=none; b=fUoW8B2nNP8TFygK5sTYceNaMxVpToWvuKX3gfwFnD3Jpd7GHwp2jBcSbd1AuImavXQy+DO3IK8S6Jr41XZ8xQoPGG/6m6Z0ZbfDKjbMFDGXaCQyHiRT1vTcOby6W44GUeiJp4Zl05dYcr6joBiPrVPx8xBiarA+zKIieH0GKPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738611; c=relaxed/simple;
	bh=O39GIVkPnK2Y3Q94zakU1NpZ28oZvYggAZ8l1J9JbTU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tV96N4RfNiBmFkxmsQBWfAXrVcMSOTZwKSRVFRu/P8H96Up4fOysSkpxzb26MRLy7gMD3Zk4DBAhxAAkEGHNMq6vLyOkzhCedQJTE8o+4DvFqrWbIDyi9ACKusJ/+3+p9vta2j6DtRGaaa/9zIzJqnqwn8QG0EQM7YrhN8CCvWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nPYDFxaV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nPYDFxaV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2051F000FF;
	Fri, 18 Sep 2026 13:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789738609;
	bh=7HQi6UhZRGba9tCDNxwHqFNbqd33M2zrY0hdCCRx4ow=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nPYDFxaVnaw9O7GPLP7QxgmrxXquZWQjkMTehAPH9pc3r0f7XcSaYCOOyC075U0g4
	 mXARJN3wvawVG+gLSBzwRBFSfxEdTbbCz9tOEBqmJSNDn/oYI3jdxKVmcNrBSK/clo
	 o38FyzMWNIaMVSxnXYqRd0W2UA99mJnblS4ucus2Fj44jEiVGevHWCZbhYf5Yd75Fz
	 NqAFYYqwfZBoW6e+VsGxQIRs/V+WrfRgsPiDOD2oiVmSQn/x9fkO/3AssEsVTvWf8z
	 iS8vbtbtzXZojrnI7uCjYiX1H2LawxHD0SGfHOYADt4rYyI7/e1H/BgTy+b4Ie4a0w
	 kF2/TxTDGq//Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/14] media: apple: add avd driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918-avd-v1-10-49977931f455@icloud.com>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
 <20260918-avd-v1-10-49977931f455@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 13:36:48 +0000
Message-Id: <20260918133649.6E2051F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [Critical] media: apple: avd: UAF in IRQ handler during device removal
- [Critical] media: apple: avd: IRQ storm when context is NULL
- [High] media: apple: avd: avd_buf_alloc unconditionally frees valid buffe=
rs
- [High] media: apple: avd: incomplete hardware submission on full queue
- [High] media: apple: avd: breaking DMA API by detaching default IOMMU dom=
ain
- [High] media: apple: avd: TOCTOU race between watchdog and IRQ handler
- [High] media: apple: avd: UAF of firmware during watchdog reset after unb=
ind
- [High] media: apple: avd: UAF due to devres allocation of V4L2 device obj=
ect
- [High] media: apple: avd: swapped dimension divisors for UV plane in 4:2:=
2 formats
- [Medium] media: apple: avd: memory leak of job segments on error or conte=
xt release
- [Medium] media: apple: avd: firmware and IOMMU domain leaks in probe erro=
r paths
- [Medium] media: apple: avd: race condition between s_ctrl and try_fmt
- [Low] media: apple: avd: missing pm_ptr wrapper for avd_pm_ops
--

commit 5989fef6d831f0e50e4be107c2e9853fa7046a46
Author: Sofus Forstreuter <sofus.c@icloud.com>

media: apple: add avd driver
   =20
Add the AVD (Apple Video Decoder) driver with V4L2 M2M stateless
support based largely on rockchips implementation.

> diff --git a/drivers/media/platform/apple/avd/avd-drv.c b/drivers/media/p=
latform/apple/avd/avd-drv.c
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-drv.c
> @@ -0,0 +1,817 @@

[ ... ]

> +void fill_comp(struct avd_comp *comp, enum avd_image_fmt image_fmt, u32 =
width,
> +	       u32 height)
> +{
> +	u32 y_meta, y, uv_meta, uv;
> +	int bit_depth, vdiv, hdiv =3D 2;

[ ... ]

> +	/* y has 32x32 tiles and 32 bytes of metadata per tile */
> +	calc_tile_meta(width, height, bit_depth, 32, 32, &y, &y_meta);
> +	/* uv has 16x16 tiles and 8 bytes of metadata per tile */
> +	calc_tile_meta(width / vdiv, height / hdiv, bit_depth * 2, 16, 8, &uv,
> +		       &uv_meta);

[Severity: High]
Does this calculate the UV dimensions correctly for 4:2:2 formats? In
fill_comp(), vdiv is set to 1 and hdiv is set to 2 for these formats. Apply=
ing
vdiv to width and hdiv to height gives full-width and half-height, but 4:2:2
formats should typically be half-width and full-height.

[ ... ]

> +int avd_buf_alloc(struct avd_dev *avd, struct avd_buf *buf, size_t size)
> +{
> +	if (!buf->cpu && size < buf->size)
> +		return 0;
> +	else if (buf->cpu)
> +		avd_buf_free(avd, buf);

[Severity: High]
Could this unconditionally free valid buffers? The condition checks if the
buffer is unallocated (!buf->cpu) instead of allocated. If the buffer is
already allocated, it falls through to the else branch and is freed, which
prevents buffer reuse.

[ ... ]

> +int avd_init_job(struct avd_ctx *ctx, enum avd_codec codec, size_t segme=
nts)
> +{
> +	int ret =3D 0;
> +	struct avd_job *job =3D &ctx->job;
> +
> +	job->codec =3D codec;
> +	job->num =3D 0;
> +	job->segments =3D kzalloc_objs(*job->segments, segments, GFP_KERNEL);

[Severity: Medium]
Is it possible for these job segments to leak? They are allocated here in
avd_init_job(), but if a job fails before submission or if the file
descriptor is closed mid-job, there doesn't seem to be a corresponding
cleanup for job->segments in avd_release().

[ ... ]

> +int avd_submit_job(struct avd_ctx *ctx)
> +{

[ ... ]

> +	for (; idx <=3D sub->num; idx++) {
> +		seg =3D &sub->segments[idx];
> +		for (i =3D 0; i < seg->num; i++)
> +			writel(seg->instructions[i], reg);
> +		if (avd_wait_submission_queue(ctx, vp))
> +			break;
> +		writel(AVD_OP_EXEC | exec_mask |
> +			       AVD_OP_EXEC_FLAG_END(idx =3D=3D sub->num),
> +		       reg);
> +	}

[Severity: High]
Does this leave the hardware in a hanging state if the submission queue
becomes full? Breaking here skips writing the AVD_OP_EXEC_FLAG_END marker,
but the function still frees the segments and returns success, which might
leave the hardware waiting indefinitely.

[ ... ]

> +static int avd_reset(struct avd_dev *avd)
> +{

[ ... ]

> +	if (avd->empty_domain) {
> +		iommu_attach_device(avd->empty_domain, avd->dev);
> +		iommu_detach_device(avd->empty_domain, avd->dev);
> +	}

[Severity: High]
Does manually detaching the IOMMU domain here break the DMA API? Calling
iommu_detach_device() strips the device of the default domain assigned by
the DMA API, and it doesn't appear to be restored. This could lead to IOMMU
faults later.

[ ... ]

> +static irqreturn_t avd_irq_handler(int irq, void *data)
> +{
> +	struct avd_dev *avd =3D data;
> +	struct avd_ctx *ctx =3D v4l2_m2m_get_curr_priv(avd->m2m_dev);

[Severity: Critical]
Could this result in a use-after-free during device removal? The
avd_remove() function frees the M2M structures via avd_v4l2_cleanup(), but
the IRQ line isn't disabled and the devres-managed IRQ handler remains
active until the remove function returns.

[Severity: High]
Is this susceptible to a race condition with the watchdog? The context is
fetched locklessly. If the watchdog resets the hardware and completes a
timed-out job, the M2M framework could schedule a new job. A delayed
interrupt from the old job might then cause this handler to fetch the new
context and improperly finish the new job.

> +	enum vb2_buffer_state state;
> +	u32 status;
> +
> +	if (!ctx)
> +		return IRQ_HANDLED;

[Severity: Critical]
Does returning here cause an interrupt storm? The hardware interrupt status
isn't cleared via AVD_REG_MBOX_IRQ_CLR before returning IRQ_HANDLED, which
would leave the level-triggered interrupt asserted.

[ ... ]

> +static int avd_release(struct file *filp)
> +{
> +	struct avd_ctx *ctx =3D file_to_ctx(filp);
> +
> +	v4l2_fh_del(&ctx->fh, filp);
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> +	v4l2_fh_exit(&ctx->fh);
> +	avd_buf_free(ctx->dev, &ctx->inst);

[Severity: High]
Can this access freed memory if the file descriptor is closed after device
unbind? The avd device object is allocated with devres (devm_kzalloc) and
will be freed immediately upon unbind, but avd_release() could be called
later if userspace holds the descriptor open.

[ ... ]

> +static int avd_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	ret =3D dma_set_mask_and_coherent(avd->dev,
> +					DMA_BIT_MASK((avd->variant->quirks &
> +						     AVD_QUIRK_LSR) ? 38 : 64));
> +	if (ret) {
> +		dev_err(avd->dev, "Failed to set DMA mask");
> +		return ret;
> +	}

[Severity: Medium]
Could this error path leak the requested firmware and allocated IOMMU
domain? It appears to return directly without calling release_firmware() or
iommu_domain_free().

[ ... ]

> +static void avd_remove(struct platform_device *pdev)
> +{
> +	struct avd_dev *avd =3D platform_get_drvdata(pdev);
> +
> +	release_firmware(avd->fw);
> +
> +	avd_v4l2_cleanup(avd);

[Severity: High]
Can this lead to a use-after-free of the firmware if a job is hanging during
unbind? Since pending jobs aren't canceled and the watchdog work isn't
flushed, a timeout after this function returns could trigger avd_reset(),
which then calls avd_boot() and copies from the already freed
avd->fw->data.

[ ... ]

> +static struct platform_driver avd_driver =3D {
> +	.probe =3D avd_probe,
> +	.remove =3D avd_remove,
> +	.driver =3D {
> +		.name =3D "avd",
> +		.of_match_table =3D avd_of_match,
> +		.pm =3D &avd_pm_ops,
> +	},
> +};

[Severity: Low]
Is it intended to leave the pm field assigned unconditionally? Wrapping this
with pm_ptr() would allow the compiler to eliminate the dead code when power
management is disabled.

> diff --git a/drivers/media/platform/apple/avd/avd-v4l2.c b/drivers/media/=
platform/apple/avd/avd-v4l2.c
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-v4l2.c
> @@ -0,0 +1,752 @@

[ ... ]

> +static int avd_s_ctrl(struct v4l2_ctrl *ctrl)
> +{

[ ... ]

> +	image_fmt =3D desc->ops->get_image_fmt(ctx, ctrl);
> +	if (avd_image_fmt_changed(ctx, image_fmt)) {
> +		vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> +				     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +		if (vb2_is_busy(vq))
> +			return -EBUSY;
> +
> +		ctx->image_fmt =3D image_fmt;
> +		avd_reset_decoded_fmt(ctx);
> +	}

[Severity: Medium]
Is there a race condition here between control setting and format ioctls?
The VIDIOC_S_CTRL ioctl runs under the control lock but without the video
device lock. Writing to ctx->image_fmt locklessly might cause concurrently
running format ioctls like try_fmt to see torn state and calculate corrupted
buffer sizes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-avd-v1-0-4=
9977931f455@icloud.com?part=3D10
