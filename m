Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7133C062A
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 16:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006501; cv=none; b=FTcfiQAOG8cohz/fdhWIuXjDuK06RbipPFN5pvitT08wlpvsAVAanH3aP5BnNzbAjckqxOwXfg0N05jpTJVAt8cTmBdmaiETlps6F8d8oU1jpXiv+5eDkwdhHCLUAyUBuibO4bkHc69wOkqa5H2gu0Mu0XbDGqzK4CKUikUbxR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006501; c=relaxed/simple;
	bh=4uuue0FX4vi59gJlfy8UDeT+I52w0nIXSV+cZTvqIZo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rwtS7gyRYOdbrVXwBvFCM0wD3ulu7QmkvF88ZbDSWbZ7/ObNZ1Aoefz7RtXepNAz/CaUsT/kb7lZJlHn2KYjm5ITsY9A0FIob9RBtP2Hi56KIXYAuIIcHKYfhhIwqVauvfcbr52u3/rphJbd4u51qtVzqMbLb8wv3Q2t04HMPZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALWOFc+w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALWOFc+w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B5D1F000FF;
	Mon, 21 Sep 2026 16:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790006499;
	bh=SEbVWeo/qvjqUg+dnd5ASnvVIXZSTEs56lXB/9e+Trg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ALWOFc+wDQ3aOUWB1F3Y1vbAr8tRYfU9tPQVIUiErttXvJjqaHel/fD+8eiBsuYdU
	 BiwAxksklwEo0Yjc1zH194NgQrJ8TdoqolllDDThdj90abtHZ/UOh7RX6Mut5bFqIb
	 h2PntFfYdMW1hfdajwI5XIu1n8swlzv9aHxCynhY3eR2bjs0zJ5rt0pEWSaQ1fDp1T
	 NoZx0WySvZbqhKK9hlmf++g+ziTSzN5un8B4wvUKK0PK9YlcdAQLrCQrnKbzikCtxD
	 McmgnytlWJYe75K+s9aK2kMNIpP3oqmXB7xxSGZJcrwLCT5H0ywwX2VIceTiTjg67V
	 40bpzJiIkRz9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 6/9] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260921-camss-isp-ope-v8-6-dd1c86a3c8a0@oss.qualcomm.com>
References: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
 <20260921-camss-isp-ope-v8-6-dd1c86a3c8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 16:01:38 +0000
Message-Id: <20260921160139.22B5D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] media: qcom: camss: Unaligned crop and compose rectangles break MI=
PI 10-bit unpacking and UV plane
- [High] media: qcom: camss: Closing file descriptor bypasses vb2 queue rel=
ease permanently leaking buffers
- [High] media: qcom: camss: TOCTOU race in ope_try_schedule() and missing =
state cleanup permanently stalls pipeline
- [Medium] media: qcom: camss: Missing media_entity_cleanup() for video and=
 base entities leaks links array
- [Medium] media: qcom: camss: Missing video_device_pipeline_stop() causes =
media_pipeline memory leak
- [Medium] media: qcom: camss: Asynchronous pm_runtime_put() in ope_stop_st=
reaming() leaks hardware clocks
--

commit e9f7b71037eb9bb411187989ce0d6e02a54a0cc6
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

    media: qcom: camss: Add CAMSS Offline Processing Engine driver

    Add an image processing driver for the Qualcomm Offline Processing Engi=
ne
    (OPE). OPE is a memory-to-memory ISP block that converts raw Bayer
    frames to YUV, performing white balance, demosaic, chroma enhancement,
    color correction and downscaling.

    Link: https://github.com/jwrdegoede/libcamera/commits/camss_pipeline_v2=
.1/
    Link: https://github.com/loicpoulain/camss-isp-m2m-test

> diff --git a/drivers/media/platform/qcom/camss/ope/core.c b/drivers/media=
/platform/qcom/camss/ope/core.c
> index 0000000000000..90fec886bebff 100644
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/ope/core.c

> [ ... ]

> @@ -845,6 +845,15 @@ static void ope_gen_stripe_yuv_dst(struct ope_ctx *c=
tx, struct ope_stripe *stripe,
>  		x_init =3D prev->dst[OPE_WR_CLIENT_DISP_C].x_init +
>  			 prev->dst[OPE_WR_CLIENT_DISP_C].width;
>  	else
>  		x_init =3D compose->left * 2 / fo->fmt->c_hsub;
> =20
>  	stripe->dst[OPE_WR_CLIENT_DISP_C].addr   =3D base;
>  	stripe->dst[OPE_WR_CLIENT_DISP_C].x_init =3D x_init;

[Severity: High]
Does an unaligned compose->left swap the U and V components during memory=20
writes?

When userspace sets an unaligned compose rectangle via the V4L2 selection A=
PI,=20
an unaligned compose->left for sub-sampled formats (like NV12 with c_hsub=
=3D2)=20
results in an odd x_init for the C plane. This could cause the hardware to=
=20
start writing at an odd byte offset, swapping the interleaved U and V chrom=
a=20
components.

> [ ... ]

> @@ -882,5 +882,12 @@ static void ope_gen_stripes(struct ope_ctx *ctx, dma=
_addr_t src, dma_addr_t dst)
>  	compose =3D v4l2_subdev_state_get_compose(sd_state, OPE_PROC_PAD_SOURCE=
);
> =20
>  	/* Advance source pointer to the crop origin */
>  	src +=3D crop->top * fi->bytesperline + crop->left * fi->fmt->depth / 8;
>  	width =3D crop->width;
>  	num_stripes =3D DIV_ROUND_UP(crop->width, OPE_STRIPE_MAX_W);

[Severity: High]
Does this misalign the DMA address when crop->left is not a multiple of 4 f=
or
10-bit formats?

Userspace can trigger this by setting an unaligned crop rectangle using the
V4L2 selection API. For 10-bit MIPI packed formats, an unaligned crop->left
results in a byte offset that breaks the 5-byte/4-pixel grouping required b=
y=20
the hardware unpacker, shifting all subsequent bits.=20

Additionally, an odd crop->top or crop->left flips the Bayer phase (e.g.,=20
RGGB becomes GBRG), but the driver blindly applies=20
stripe->src.pattern =3D src_hw->pattern.

> [ ... ]

> @@ -1630,5 +1630,12 @@ static void ope_run_work(struct work_struct *work)
>  		ctx =3D ope->curr_ctx;
>  		if (!ctx || !ctx->queued || ope->hw_running)
>  			return;
>  		if (!ope_job_ready(ctx))
>  			return;
>  		/* The registers still hold the configuration of @hw_ctx */

[Severity: High]
Does returning early here without clearing the scheduler state variables
(ctx->queued and ope->curr_ctx) permanently stall the pipeline?

> [ ... ]

> @@ -1643,6 +1643,11 @@ static void ope_try_schedule(struct ope_ctx *ctx)
>  {
>  	struct ope_dev *ope =3D ctx->ope;
> =20
>  	if (!ope_job_ready(ctx))
>  		return;
> =20
>  	/* Claim the job slot. */
> 	scoped_guard(spinlock_irqsave, &ope->sched_lock) {
> 		if (ctx->queued || ope->curr_ctx)
> 			return;

[Severity: High]
Is it possible for a TOCTOU race here to permanently stall the pipeline,
preventing any future STREAMON or QBUF operations?

If a hardware interrupt finishes a job on CPU A concurrently with a userspa=
ce
STREAMOFF ioctl on CPU B, the ope_job_ready check happens outside the lock.
CPU A might evaluate it as true, race with CPU B processing a STREAMOFF=20
(which drains the queue and clears ctx->queued), and then proceed to claim =
the=20
job slot.=20

Later, when ope_run_work executes, ope_job_ready evaluates to false,
taking the early return mentioned above without clearing ctx->queued and
ope->curr_ctx.

> [ ... ]

> @@ -2046,5 +2046,9 @@ static void ope_stop_streaming(struct vb2_queue *q)
> =20
>  	pm_runtime_put(ctx->ope->dev);
> =20
>  	if (ope_hw_available(ctx->ope))
>  		video_device_pipeline_stop(vdev);
>  }

[Severity: Medium]
Does this asynchronous pm_runtime_put leak hardware clocks?

If the device is unbound while streaming, the driver core's devm teardown
path will call pm_runtime_disable shortly after remove returns. Because
pm_runtime_disable cancels any pending asynchronous idle or suspend work,
the actual runtime suspend callback is never invoked, leaving hardware
clocks and power domains permanently powered.

[Severity: Medium]
Also, does skipping video_device_pipeline_stop cause a permanent memory
leak of the media_pipeline object?

If the driver is unbound, v4l2_device_unregister clears the V4L2 device
pointer, causing ope_hw_available to return false. When userspace later
closes the open file descriptor, the pipeline stop is skipped. The
stop function only manages software reference counts and memory, so it
is safe and necessary to call even after hardware removal.

> [ ... ]

> @@ -2580,4 +2580,8 @@ static void ope_sd_adjust_crop_rect(struct v4l2_rec=
t *crop, const struct v4l2_re
>  {
>  	v4l2_rect_set_min_size(crop, &ope_sd_min_rect);
>  	v4l2_rect_map_inside(crop, bounds);
>  }

[Severity: High]
Does this fail to enforce the required pixel alignments for the crop rectan=
gle?

While v4l2_rect_map_inside is used to validate rectangles, it only clamps
coordinates and does not enforce pixel alignment. The selection rectangles
likely need to be aligned via v4l_bound_align_image to prevent the DMA
and chroma offset corruptions mentioned earlier.

> [ ... ]

> @@ -3225,5 +3225,9 @@ static int ope_release(struct file *file)
>  	scoped_guard(mutex, &ope->mutex) {
>  		if (--ope->open_count !=3D 0)
>  			return 0;
>  		ope->shared_ctx =3D NULL;

[Severity: High]
Does this early return bypass the vb2 queue release and permanently leak
buffers?

If one process allocates buffers and keeps the queue owned, then closes
its file descriptor while a second process keeps the device open, this
early return skips ope_ctx_destroy where vb2_queue_release is called.

The buffers allocated by the first process remain leaked until the last
fd is closed, and any other open file descriptor is locked out because
the queue owner points to a freed v4l2_fh.

> [ ... ]

> diff --git a/drivers/media/platform/qcom/camss/ope/pipeline.c b/drivers/m=
edia/platform/qcom/camss/ope/pipeline.c
> index 0000000000000..bbb076717ef77 100644
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/ope/pipeline.c

> [ ... ]

> @@ -148,5 +148,8 @@ void camss_isp_pipeline_free(struct camss_isp_pipelin=
e *pipeline)
>  		struct camss_isp_pipeline_entity *slot =3D &pipeline->entities[i];
> =20
>  		if (slot->obj_type =3D=3D MEDIA_ENTITY_TYPE_V4L2_SUBDEV)
>  			v4l2_subdev_cleanup(&slot->subdev);
> =20
>  		kfree(slot->pads);

[Severity: Medium]
Does this fail to clean up the video and base entities, leaking their
dynamically allocated links arrays?

When unloading the module or failing probe after links are created,
media_entity_cleanup is never called for MEDIA_ENTITY_TYPE_VIDEO_DEVICE
or MEDIA_ENTITY_TYPE_BASE entities. Since media_create_pad_link dynamically
allocates the links array on the entity during registration, this guarantees
a memory leak of the links array every time the driver is unbound.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-camss-isp-=
ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com?part=3D6
