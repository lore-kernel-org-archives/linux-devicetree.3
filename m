Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492485;
	b=aNYFirkvq5pIvzFxqwZum50kDgEInT0JgT7QMXVHVgOtUmVRdJ26f7QuLadEWcO4+y8+
	 mRAy/SMN/8UjuDOlfy1oJAwvPURUtb3yV9E4NLfQ+xbxFd8UhgTPLldu1Tx5mgF/zthGv
	 CY4I++hLLOTTT0/zUg3a9zMC0X8ZX9nCQ0jqwgQscUB8VOPrzFEdu1rqsRMRhP4MbweDl
	 CJ2g2qIbJEr+BDXCmKe1vRrDS41ngasooD+EaylaHLhszDSdBfvPzSPHm0+IoT3YOemMb
	 Tjry7vRKaOFHzI183+5s7vrpKHbL/BzeHywiHsZSsW0z/jiMdKQSfKGJpOx0Io0tvjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492485;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZbYu3ingDLHtjXUR3vQ7jTsOWAetsL9Z06Q/S9RIJcU=;
	b=OESCTSswLuSkYZZqxTrCJtfs7UK3gNm6IhxQX1lmIWxhv79hKQRbTFSEIlkILKI7Bc3r
	 qSVhlE8t3/XpdmdgMm0Ypo+Rm6HdcRwz63ynWN6UoEaV1Vh0bFs1ZcmiUKwWN1HqukxsS
	 AmuqWLxDdzkD/XlhiGHN0oUM5NOM7d/f3E/cIiNSw96AZTvHDYyWvAa+Pz3exKcWtHwBA
	 0N0h18JiU0+50SDOFEiRcLT9SB1rHWPuAmUsVi3+pu0XJTZ8FGpfpcSYDuTY0kBEU0VX+
	 lnWWbMFoesuJMyc+mCM+EzyhKscknTcEmGAce5RV2JauzQ66Z+tpqwvN9SC5xR6oCIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ol2t92aP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBEC606A320
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ol2t92aP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191171F000C7;
	Tue, 20 Oct 2026 10:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792492484;
	bh=ZbYu3ingDLHtjXUR3vQ7jTsOWAetsL9Z06Q/S9RIJcU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ol2t92aPHDMA4KMJ9Jh7cH3LB551mqUuLcasOamIkrYsZeEKn//zBWXq7uquP/s3E
	 zHTs2QYJBobi0QvTi+wngw3zuSG+WfP0n5gI+IujfTUfH27uaZDPR6UoZjmIZdXSIe
	 byept3vUwOINAoO/5lvXAeewVrjqzaNJCM094YOzlimA+Kot74WrcRK+2zdRh8JZrk
	 81K+cuUMGdDVWJdsS+ra0+mnwgEbQHpfxgS8EJDY4+pMZBP9UzVTHyKoyinab9PtXE
	 0i/e1iS15maBC2MEfU5dW+zbA58BGpHV4BbgUsatEPBA2EcUiy3Garm5w+xDkkLTvW
	 1unH+A3TYRFpA==
Message-ID: <sashiko-outbox-178843@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/17] media: apple: add avd driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261020-avd-v3-6-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
 <20261020-avd-v3-6-85cbaa2125d8@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 10:34:43 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] media: apple: avd: swapped hdiv and vdiv chroma divisors in fill_c=
omp()
- [High] media: apple: avd: avd_try_capture_fmt() overwrites active ctx->co=
mp state
- [High] media: apple: avd: race between avd_irq_handler() and avd_watchdog=
_func()
- [High] media: apple: avd: use-after-free of m2m_ctx in avd_release()
- [High] media: apple: avd: incorrect teardown ordering in avd_remove()
- [Medium] media: apple: avd: avd_buf_alloc() reallocates buffers when size=
 equals buf->size
- [Medium] media: apple: avd: missing requires_requests in avd_queue_init()
- [Medium] media: apple: avd: unchecked fw size and version string in avd_b=
oot()
- [Medium] media: apple: avd: premature IRQ registration before m2m_dev ini=
t in avd_probe()
- [Low] media: apple: avd: undocumented compatible strings in avd_of_match
- [Low] media: apple: avd: missing v4l2_fh_exit() on error in avd_open()
--

commit c20426398f915c313cff07d12649ddf5f8910ea1
Author: Sofus Forstreuter <sofus.c@icloud.com>

media: apple: add avd driver

This commit adds the Apple Video Decoder (AVD) platform driver with V4L2
M2M stateless decoding infrastructure.

> diff --git a/drivers/media/platform/apple/avd/avd-drv.c b/drivers/media/p=
latform/apple/avd/avd-drv.c
> new file mode 100644
> index 0000000000000..ddbf18cd3329c
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-drv.c
> @@ -0,0 +1,782 @@

[ ... ]

> +static void calc_tile_meta(u32 w, u32 h, u32 bpb, u32 tile_dim,
> +			   u32 meta_hdr_bytes, u32 *tile, u32 *meta)
> +{
> +	u32 tiles_width, tiles_height, meta_tile_w, meta_tile_h, tile_bytes;
> +
> +	tiles_width =3D DIV_ROUND_UP(w, tile_dim);
> +	tiles_height =3D DIV_ROUND_UP(h, tile_dim);
> +	tile_bytes =3D DIV_ROUND_UP(tile_dim * tile_dim * bpb, 8);
> +	*tile =3D ALIGN(tiles_width * tiles_height * tile_bytes, 16);
> +
> +	meta_tile_w =3D roundup_pow_of_two(tiles_width);
> +	meta_tile_h =3D roundup_pow_of_two(tiles_height);
> +
> +	*meta =3D ALIGN(meta_tile_w * meta_tile_h * meta_hdr_bytes, 16);
> +}
> +
> +static inline u8 v4l2_format_info_bpp(const struct v4l2_format_info *inf=
o,
> +				      int plane)
> +{
> +	return 8 * info->bpp[plane] / info->bpp_div[plane];
> +}
> +
> +void fill_comp(struct avd_comp *comp, enum avd_image_fmt fmt, u32 width,
> +	       u32 height)
> +{
> +	u32 y_meta, y, uv_meta, uv, fourcc;
> +	const struct v4l2_format_info *info;
> +
> +	switch (fmt) {
> +	case AVD_IMG_FMT_420_8BIT:
> +		fourcc =3D V4L2_PIX_FMT_APPLE_AX12;
> +		break;
> +	case AVD_IMG_FMT_420_10BIT:
> +		fourcc =3D V4L2_PIX_FMT_APPLE_AX03;
> +		break;
> +	case AVD_IMG_FMT_422_8BIT:
> +		fourcc =3D V4L2_PIX_FMT_APPLE_AX16;
> +		break;
> +	case AVD_IMG_FMT_ANY: /* use the largest one */
> +	case AVD_IMG_FMT_422_10BIT:
> +		fourcc =3D V4L2_PIX_FMT_APPLE_AX23;
> +		break;
> +	}
> +	info =3D v4l2_format_info(fourcc);
> +
> +	/* y has 32x32 tiles and 32 bytes of metadata per tile */
> +	calc_tile_meta(width, height, v4l2_format_info_bpp(info, 0), 32, 32,
> +		       &y, &y_meta);
> +	/* uv has 16x16 tiles and 8 bytes of metadata per tile */
> +	calc_tile_meta(width / info->vdiv, height / info->hdiv,
> +		       v4l2_format_info_bpp(info, 1), 16, 8, &uv,
> +		       &uv_meta);

[Severity: High]
Are info->vdiv and info->hdiv swapped in fill_comp()?

In struct v4l2_format_info, hdiv is the horizontal subsampling factor and
vdiv is the vertical subsampling factor. For 4:2:2 formats such as
V4L2_PIX_FMT_APPLE_AX16 and V4L2_PIX_FMT_APPLE_AX23, info->hdiv is 2 and
info->vdiv is 1. Passing width / info->vdiv and height / info->hdiv to
calc_tile_meta() computes tile and power-of-two metadata dimensions for
(width, height / 2) instead of (width / 2, height), which can under-size uv,
uv_meta, comp->offsets[2], and comp->size for asymmetric 4:2:2 resolutions
and lead to capture DMA buffer under-allocation.

Also, since avd_enum_framesizes() allows min_width =3D 1 and min_height =3D=
 1,
can integer division truncate width or height to 0 before calc_tile_meta()
calls roundup_pow_of_two(0), or should DIV_ROUND_UP() be used here?

> +
> +	/* output like DCP/AGX expect */
> +	comp->offsets[0] =3D y;
> +	comp->offsets[1] =3D 0;
> +	comp->offsets[2] =3D y + y_meta + uv;
> +	comp->offsets[3] =3D y + y_meta;
> +
> +	comp->size =3D y_meta + y + uv_meta + uv;
> +}
> +
> +int avd_buf_alloc(struct avd_dev *avd, struct avd_buf *buf, size_t size)
> +{
> +	if (buf->cpu && size < buf->size)
> +		return 0;
> +	else if (buf->cpu)
> +		avd_buf_free(avd, buf);

[Severity: Medium]
Should the comparison in avd_buf_alloc() be size <=3D buf->size instead of
size < buf->size?

When avd_init_job() calls avd_buf_alloc() on consecutive frames with the
same segment count, size equals buf->size, causing avd_buf_alloc() to free
and reallocate the coherent DMA buffer on every frame.

[ ... ]

> +static int avd_boot(struct avd_dev *avd)
> +{
> +	u32 val;
> +	int ret;
> +	char version[64];
> +
> +	if (avd->variant->revision !=3D 3)
> +		dev_info_once(avd->dev, "booting hw version: %04x",
> +			      readl_relaxed(avd->ctrl));
> +
> +	writel(avd->sram_start, avd->piodma + 0x24);
> +	dev_info_once(avd->dev, "piodma version: %04x base: %08x",
> +		      readl_relaxed(avd->piodma + 0xb4),
> +		      readl_relaxed(avd->piodma + 0x24));
> +
> +	memcpy_toio(avd->code, avd->fw->data, avd->fw->size);
> +
> +	writel_relaxed(AVD_MBOX_ENABLE, avd->mbox + AVD_REG_MBOX1_STATUS);
> +	writel_relaxed(AVD_MBOX_ENABLE, avd->mbox + AVD_REG_MBOX0_STATUS);
> +	writel_relaxed(AVD_MBOX0_NOT_EMPTY,
> +		       avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
> +	writel_relaxed(AVD_RUN_CTRL_UNK_RUN, avd->mbox + AVD_REG_RUN_CTRL);
> +
> +	/* wait for cm3 to boot */
> +	ret =3D readl_poll_timeout(avd->mbox + AVD_REG_FLAG0_SET, val, val =3D=
=3D 1,
> +				 10, 10000);
> +	if (ret)
> +		return ret;
> +
> +	memcpy_fromio(version, avd->sram, sizeof(version));
> +	dev_info_once(avd->dev, "fw version: %s\n", version);
> +
> +	return 0;
> +}

[Severity: Medium]
Can avd_boot() write past the end of the mapped code region or read past the
end of version[]?

memcpy_toio(avd->code, avd->fw->data, avd->fw->size) does not verify that
avd->fw->size fits within the mapped code resource. In addition,
memcpy_fromio(version, avd->sram, sizeof(version)) copies 64 bytes from SRAM
and passes version to dev_info_once() with %s without ensuring NUL
termination.

[ ... ]

> +static void avd_watchdog_func(struct work_struct *work)
> +{
> +	struct avd_dev *avd;
> +	struct avd_ctx *ctx;
> +	int ret;
> +
> +	ctx =3D container_of(to_delayed_work(work), struct avd_ctx,
> +			   watchdog_work);
> +	if (!ctx)
> +		return;
> +
> +	avd =3D ctx->dev;
> +
> +	dev_err(avd->dev, "Frame processing timed out!");
> +
> +	writel(0, avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
> +	ret =3D avd_reset(avd);
> +	if (ret)
> +		dev_err(avd->dev, "failed to reset: %d", ret);
> +
> +	avd_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +}
> +
> +static irqreturn_t avd_irq_handler(int irq, void *data)
> +{
> +	struct avd_dev *avd =3D data;
> +	struct avd_ctx *ctx =3D v4l2_m2m_get_curr_priv(avd->m2m_dev);
> +	enum vb2_buffer_state state;
> +	u32 status;
> +
> +	status =3D readl(avd->mbox + AVD_REG_MBOX0_RETRIEVE);
> +	writel(AVD_MBOX0_NOT_EMPTY, avd->mbox + AVD_REG_MBOX_IRQ_CLR);
> +
> +	if (status & 0x10000) { /* dbg */
> +		dev_warn(avd->dev, "no handler for IRQ: %3d",
> +			 status & ~0x10000);
> +		writel_relaxed(0, avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
> +		return IRQ_HANDLED;
> +	}
> +
> +	if (!ctx)
> +		return IRQ_HANDLED;
> +
> +	if (status & 0x1000) {
> +		state =3D VB2_BUF_STATE_DONE;
> +	} else {
> +		dev_err(avd->dev, "error: fw says: %x", status);
> +		/* let watchdog handle */
> +		goto done;
> +	}
> +
> +	/* if the watchdog_work has run the work has already been submitted */
> +	if (cancel_delayed_work(&ctx->watchdog_work))
> +		avd_job_finish(ctx, state);
> +
> +done:
> +	return IRQ_HANDLED;
> +}

[Severity: High]
Can avd_irq_handler() and avd_watchdog_func() race when an interrupt arrives
near the watchdog timeout?

Because avd_irq_handler() is a threaded IRQ handler without synchronization
against avd_watchdog_func():

1. avd_irq_handler() fetches ctx =3D v4l2_m2m_get_curr_priv(avd->m2m_dev) a=
nd
   reads status =3D 0x1000.
2. Before avd_irq_handler() reaches cancel_delayed_work(&ctx->watchdog_work=
),
   avd_watchdog_func() can run to completion on another CPU, reset the
   hardware via avd_reset(), and call avd_job_finish(ctx, VB2_BUF_STATE_ERR=
OR).

If another job is queued on ctx, avd_job_finish() schedules the next job and
avd_submit_job() re-arms ctx->watchdog_work; when avd_irq_handler() resumes,
cancel_delayed_work(&ctx->watchdog_work) cancels the new job's watchdog and
prematurely completes the second job while hardware DMA is still active.
Alternatively, if the file descriptor is closing in avd_release(), ctx can =
be
freed after avd_watchdog_func() finishes, causing avd_irq_handler() to
dereference freed ctx at cancel_delayed_work(&ctx->watchdog_work).

[ ... ]

> +static int avd_queue_init(void *priv, struct vb2_queue *src_vq,
> +			  struct vb2_queue *dst_vq)
> +{
> +	struct avd_ctx *ctx =3D priv;
> +	int ret;
> +
> +	src_vq->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> +	src_vq->drv_priv =3D ctx;
> +	src_vq->ops =3D &avd_queue_ops;
> +	src_vq->mem_ops =3D &vb2_dma_contig_memops;
> +
> +	src_vq->dma_attrs =3D 0;
> +	src_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> +	src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	src_vq->lock =3D &ctx->dev->vdev_lock;
> +	src_vq->dev =3D ctx->dev->v4l2_dev.dev;
> +	src_vq->supports_requests =3D true;
> +
> +	ret =3D vb2_queue_init(src_vq);

[Severity: Medium]
Should avd_queue_init() also set src_vq->requires_requests =3D true before
calling vb2_queue_init(src_vq)?

Without requires_requests =3D true, userspace can queue OUTPUT buffers via
VIDIOC_QBUF without V4L2_BUF_FLAG_REQUEST_FD, locking the queue into
non-request mode and causing avd_run_preamble() to run with src_req =3D=3D =
NULL
and unconfigured per-frame stateless controls.

[ ... ]

> +static int avd_open(struct file *filp)
> +{
> +	struct avd_dev *avd =3D video_drvdata(filp);
> +	struct avd_ctx *ctx;
> +	int ret;
> +
> +	ctx =3D kzalloc_obj(*ctx, GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->dev =3D avd;
> +
> +	ret =3D avd_buf_alloc(avd, &ctx->inst, AVD_FIFO_SIZE);
> +	if (ret)
> +		goto err_free_ctx;
> +
> +	ret =3D avd_buf_alloc(avd, &ctx->pipe_state, 512);
> +	if (ret)
> +		goto err_free_ctx;
> +
> +	INIT_DELAYED_WORK(&ctx->watchdog_work, avd_watchdog_func);
> +
> +	avd_reset_coded_fmt(ctx);
> +	avd_reset_decoded_fmt(ctx);
> +
> +	v4l2_fh_init(&ctx->fh, video_devdata(filp));
> +
> +	ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(avd->m2m_dev, ctx, avd_queue_init=
);
> +	if (IS_ERR(ctx->fh.m2m_ctx)) {
> +		ret =3D PTR_ERR(ctx->fh.m2m_ctx);
> +		goto err_free_ctx;
> +	}
> +
> +	ret =3D avd_init_ctrls(ctx);
> +	if (ret)
> +		goto err_cleanup_m2m_ctx;
> +
> +	v4l2_fh_add(&ctx->fh, filp);
> +
> +	return 0;
> +
> +err_cleanup_m2m_ctx:
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +
> +err_free_ctx:
> +	avd_buf_free(avd, &ctx->pipe_state);
> +	avd_buf_free(avd, &ctx->inst);
> +	kfree(ctx);
> +	return ret;
> +}

[Severity: Low]
If v4l2_m2m_ctx_init() or avd_init_ctrls() fails in avd_open(), should the
error path call v4l2_fh_exit(&ctx->fh) to pair with v4l2_fh_init(&ctx->fh,
...)?

> +
> +static int avd_release(struct file *filp)
> +{
> +	struct avd_ctx *ctx =3D file_to_ctx(filp);
> +
> +
> +	v4l2_fh_del(&ctx->fh, filp);
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	cancel_delayed_work_sync(&ctx->watchdog_work);

[Severity: High]
Can avd_watchdog_func() access freed ctx->fh.m2m_ctx during avd_release()?

When a job times out while avd_release() is running:

1. avd_release() calls v4l2_m2m_ctx_release(ctx->fh.m2m_ctx) ->
   v4l2_m2m_cancel_job(), which waits for TRANS_RUNNING to be cleared on
   m2m_ctx->finished.
2. avd_watchdog_func() calls avd_job_finish() -> avd_job_finish_no_pm() ->
   v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
   result).
3. Inside v4l2_m2m_buf_done_and_job_finish(), _v4l2_m2m_job_finish() clears
   TRANS_RUNNING and wakes m2m_ctx->finished before calling
   v4l2_m2m_schedule_next_job(m2m_dev, m2m_ctx).
4. v4l2_m2m_ctx_release() can then return from v4l2_m2m_cancel_job() and
   kfree(m2m_ctx) before avd_release() reaches
   cancel_delayed_work_sync(&ctx->watchdog_work), while avd_watchdog_func()
   is still dereferencing m2m_ctx in v4l2_m2m_schedule_next_job().

[ ... ]

> +/* can also be derived from a version register */
> +static const struct of_device_id avd_of_match[] =3D {
> +	{ .compatible =3D "apple,t8103-avd", .data =3D &avd_t8103_variant },
> +	{ .compatible =3D "apple,t6000-avd", .data =3D &avd_t6000_variant },
> +	{ .compatible =3D "apple,t8112-avd", .data =3D &avd_t8112_variant },
> +	{ .compatible =3D "apple,t6020-avd", .data =3D &avd_t6020_variant },
> +	{ .compatible =3D "apple,t8122-avd", .data =3D &avd_t8122_variant },
> +	{ .compatible =3D "apple,t8132-avd", .data =3D &avd_t8132_variant },
> +	{ .compatible =3D "apple,t8140-avd", .data =3D &avd_t8140_variant },
> +	{},
> +};

[Severity: Low]
Are "apple,t8132-avd" and "apple,t8140-avd" documented in
Documentation/devicetree/bindings/media/apple,avd.yaml?

The binding schema only lists apple,t6000-avd, apple,t6020-avd,
apple,t6030-avd, apple,t6031-avd, apple,t8103-avd, apple,t8112-avd, and
apple,t8122-avd.

[ ... ]

> +	irq =3D platform_get_irq_byname(pdev, "mbox0");
> +	if (irq < 0)
> +		return irq;
> +	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL, avd_irq_handle=
r,
> +					IRQF_ONESHOT, dev_name(&pdev->dev),
> +					avd);
> +	if (ret) {
> +		dev_err(avd->dev, "Could not request IRQ 0");
> +		return ret;
> +	}

[Severity: Medium]
Can an interrupt fire before avd->m2m_dev is initialized in avd_v4l2_init()?

In avd_probe(), devm_request_threaded_irq() registers avd_irq_handler()
before request_firmware(), pm_runtime_enable(), and avd_v4l2_init() (which
initializes avd->m2m_dev via v4l2_m2m_init()). Because avd_irq_handler()
unconditionally calls v4l2_m2m_get_curr_priv(avd->m2m_dev), which
immediately dereferences &m2m_dev->job_spinlock, a pending or spurious
interrupt during probe (or after v4l2_m2m_release() on teardown) will
dereference a NULL or freed avd->m2m_dev pointer.

[ ... ]

> +static void avd_remove(struct platform_device *pdev)
> +{
> +	struct avd_dev *avd =3D platform_get_drvdata(pdev);
> +
> +	avd_v4l2_cleanup(avd);
> +
> +	iommu_domain_free(avd->empty_domain);
> +
> +	release_firmware(avd->fw);
> +
> +	pm_runtime_disable(avd->dev);
> +	pm_runtime_dont_use_autosuspend(avd->dev);
> +}

[Severity: High]
Does the teardown ordering in avd_remove() allow use-after-free of avd->fw =
or
leave the hardware running on unbind?

In avd_remove():

1. release_firmware(avd->fw) is called before pm_runtime_disable(avd->dev),
   so a runtime resume occurring before runtime PM is disabled can invoke
   avd_runtime_resume() -> avd_boot() and dereference freed avd->fw.
2. Calling pm_runtime_disable(avd->dev) before
   pm_runtime_dont_use_autosuspend(avd->dev) increments disable_depth before
   update_autosuspend() runs, causing rpm_idle() to fail with -EACCES if the
   device is still in its autosuspend window and skipping
   avd_runtime_suspend() -> avd_shutdown().
3. avd_v4l2_cleanup(avd) frees avd->m2m_dev while the devm-managed IRQ and
   CM3 processor may still be active.

> diff --git a/drivers/media/platform/apple/avd/avd-v4l2.c b/drivers/media/=
platform/apple/avd/avd-v4l2.c
> new file mode 100644
> index 0000000000000..838f6e348a49f
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-v4l2.c
> @@ -0,0 +1,783 @@

[ ... ]

> +static void avd_fill_decoded_pixfmt(struct avd_ctx *ctx,
> +				    struct v4l2_pix_format_mplane *pix_mp)
> +{
> +	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, pix_mp->width,
> +			    pix_mp->height);
> +
> +	if (is_interchange(pix_mp->pixelformat))
> +		pix_mp->plane_fmt[0].sizeimage =3D 0;
> +	ctx->comp.start_offset =3D pix_mp->plane_fmt[0].sizeimage;
> +
> +	fill_comp(&ctx->comp, ctx->image_fmt, pix_mp->width, pix_mp->height);
> +	pix_mp->plane_fmt[0].sizeimage +=3D ctx->comp.size;
> +
> +	if (ctx->coded_fmt_desc->ops->adjust_decoded_fmt)
> +		ctx->coded_fmt_desc->ops->adjust_decoded_fmt(ctx, pix_mp);
> +
> +	pix_mp->plane_fmt[0].sizeimage =3D ALIGN(pix_mp->plane_fmt[0].sizeimage,
> +					       AVD_ALIGN);
> +}

[ ... ]

> +static int avd_try_capture_fmt(struct file *file, void *priv,
> +			       struct v4l2_format *f)
> +{
> +	struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> +	struct avd_ctx *ctx =3D file_to_ctx(file);
> +	const struct avd_coded_fmt_desc *coded_desc;
> +
> +	/*
> +	 * The codec context should point to a coded format desc, if the format
> +	 * on the coded end has not been set yet, it should point to the
> +	 * default value.
> +	 */
> +	coded_desc =3D ctx->coded_fmt_desc;
> +	if (WARN_ON(!coded_desc)) {
> +		dev_err(ctx->dev->dev, "no coded desc!");
> +		return -EINVAL;
> +	}
> +
> +	if (!avd_is_valid_fmt(ctx, pix_mp->pixelformat, ctx->image_fmt))
> +		pix_mp->pixelformat =3D
> +			avd_enum_decoded_fmt(ctx, 0, ctx->image_fmt);
> +
> +	/* Always apply the frmsize constraint of the coded end. */
> +	pix_mp->width =3D max(pix_mp->width, ctx->coded_fmt.fmt.pix_mp.width);
> +	pix_mp->height =3D max(pix_mp->height, ctx->coded_fmt.fmt.pix_mp.height=
);
> +	v4l2_apply_frmsize_constraints(&pix_mp->width, &pix_mp->height,
> +				       &coded_desc->frmsize);
> +
> +	avd_fill_decoded_pixfmt(ctx, pix_mp);
> +	pix_mp->field =3D V4L2_FIELD_NONE;
> +
> +	return 0;
> +}

[Severity: High]
Does calling VIDIOC_TRY_FMT on the capture queue via avd_try_capture_fmt()
corrupt the active ctx->comp state?

avd_try_capture_fmt() calls avd_fill_decoded_pixfmt(ctx, pix_mp), which
unconditionally overwrites ctx->comp.start_offset, ctx->comp.offsets, and
ctx->comp.size. If userspace invokes VIDIOC_TRY_FMT with a different
pixelformat (such as an interchange format where start_offset is 0) or
different dimensions after setting the format or while streaming,
avd_run_preamble() will use the overwritten ctx->comp to compute
run->comp_out and dst->comp, corrupting the capture buffer or writing past
its end.

[ ... ]

> +void avd_run_preamble(struct avd_ctx *ctx, struct avd_run *run)
> +{
> +	struct media_request *src_req;
> +	struct avd_decoded_buffer *dst;
> +
> +	memset(run, 0, sizeof(*run));
> +
> +	run->bufs.src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	run->bufs.dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +
> +	run->coded_in =3D
> +		vb2_dma_contig_plane_dma_addr(&run->bufs.src->vb2_buf, 0);
> +	run->y_out =3D vb2_dma_contig_plane_dma_addr(&run->bufs.dst->vb2_buf, 0=
);
> +	run->uv_out =3D run->y_out +
> +		      ctx->decoded_fmt.fmt.pix_mp.plane_fmt[0].bytesperline *
> +			      ctx->decoded_fmt.fmt.pix_mp.height;
> +
> +	run->comp_out =3D run->y_out + ctx->comp.start_offset;
> +	ctx->decomp =3D !is_interchange(ctx->decoded_fmt.fmt.pix_mp.pixelformat=
);
> +
> +	dst =3D vb2_to_avd_decoded_buf(&run->bufs.dst->vb2_buf);
> +	memcpy(&dst->comp, &ctx->comp, sizeof(ctx->comp));

[ ... ]

>=20
> --=20
> 2.51.0
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-avd-v3-0-8=
5cbaa2125d8@icloud.com?part=3D6
