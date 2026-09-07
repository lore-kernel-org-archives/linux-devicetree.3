Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781EB46D2A4
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 11:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779353; cv=none; b=aqQi5H9oewLimppSeCbt5ZLas0yIlTxekglKnD4mrTtDE2FkvwfVHKy5aE3qsv4CZCnooMle6bmMYeHs+KOR3VHPVKM+MONac+JtMePTKnBibpYBq0KE9oHDkIismujPezqeBrnVguTX3FcZiTSSY9+dT8w+l8cx5FS33qpPEAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779353; c=relaxed/simple;
	bh=YN8NBpCxxSaUqzb5dBYYGrYQJrFrs6V24gaO9hYQEJo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vGM7rhQhCZ62aCdTF8jM8x7/C10EJF/nz70lb5epbnqTbUob7owlFVZOU3+b5zMAVkyiUvfzDoBFnZCtqBmagMF/HKN2F8gIQLaQ+V0xtY7D/qGWF9o+tAPOGrkGdg1ZeezqvBvK+z+nuLSE+JYSqeQJSLwZNWa3PlSoH/cGMlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPwtY3on; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPwtY3on"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2F71F00A3F;
	Mon,  7 Sep 2026 11:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788779351;
	bh=wX1uenCFNnAwmX2h2Jxjg0SwnpkYWp2FCu07YAWqsNw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PPwtY3ondiyqVAdTmmps4GcfYLvvd7ghsz9k/coMWBEwBbS4rpFYVqb787m3jYcyR
	 oOHGROwgIVIXqn7EP8SW48oNv/KmBiW0NHQfGvyw73Ve3mmQ0LotLclRES+RBulWW9
	 pAIcekhaZfN+JnoCFUU0WCKWVkn2G9pbon7vjbII+K58gDEr45rKnWnoKMMFotFxJM
	 g+JDGvbTrbHzHnDnmztvNmResKN1l3/bV6KGe1/iH9qJn4PkBIfb/2KEoBTEg3IlIS
	 Q3Qh9E5wbi6PSpz8w3PGjPsk43y2F1MPmW046j+nByQcumYXRzxerNF4oBISLSflYC
	 RoA1Mhxl8HdHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/8] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260907-camss-isp-ope-v6-6-6b915b9c5131@oss.qualcomm.com>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
 <20260907-camss-isp-ope-v6-6-6b915b9c5131@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 11:09:10 +0000
Message-Id: <20260907110910.DB2F71F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [High] Permanent deadlock of the OPE scheduler when a single queue is sto=
pped while others are active.
- [High] Race condition during streamoff causing the hardware to perform DM=
A into a freed buffer returned to userspace.
- [High] Missing pipeline refcounting for V4L2 subdev nodes leading to Use-=
After-Free.
- [High] Use-After-Free of the main `ope_dev` structure due to devres and f=
ile lifetime mismatch.
- [High] The driver fails to abort active hardware DMA during `remove()`, c=
ausing fatal IOMMU faults.
- [High] NULL pointer dereference in `ope_run_work` because `ope->pipeline`=
 is freed before the workqueue is canceled.
- [High] Use-After-Free of `ope_ctx` if the hardware reset times out.
- [High] Use-After-Free of `ctx` in `ope_irq()` due to continuing execution=
 after signaling reset completion.
- [High] `ope_release()` fails to clear vb2_queue ownership when an owner f=
ile descriptor is closed, causing persistent lockups and resource leaks.
- [Medium] Double invocation of `ope_job_finish` corrupts queue state if `R=
ST_DONE` and `IDLE` interrupts are co-asserted.
- [Medium] Time-Of-Check to Time-Of-Use (TOCTOU) race during video device r=
egistration allows uninitialized drvdata access.
- [Medium] Dangling pointer in Gamma LUT cache allows information leak and =
rendering corruption across sessions.
- [Low] Mixing goto-based error handling and scope-based cleanup helpers (`=
scoped_guard`) in the same function.
--

commit aab4f4c79719b4532d479995843c0d6e2fac9811
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: media: qcom: camss: Add CAMSS Offline Processing Engine driver

This commit adds an image processing driver for the Qualcomm Offline
Processing Engine (OPE), which converts raw Bayer frames to YUV. The
driver exposes three video nodes per pipeline instance and relies on a
static topology builder for media controller setup.

Link: https://github.com/jwrdegoede/libcamera/commits/camss_pipeline_v2.1/
Link: https://github.com/loicpoulain/camss-isp-m2m-test

> diff --git a/drivers/media/platform/qcom/camss/ope/core.c b/drivers/media=
/platform/qcom/camss/ope/core.c
> --- a/drivers/media/platform/qcom/camss/ope/core.c
> +++ b/drivers/media/platform/qcom/camss/ope/core.c

[ ... ]

> static bool ope_glut_bank_resident(struct ope_dev *ope, u8 bank,
> 				    struct ope_ctx *ctx)
> {
> 	return ope->glut_bank[bank].valid &&
> 	       ope->glut_bank[bank].owner =3D=3D ctx;
> }

[Severity: Medium]
Might this lead to a dangling pointer in the Gamma LUT cache? If a
non-running context is canceled, it skips the hardware reset and the
ope_glut_cache_invalidate() call. The cache owner field continues pointing =
to
the destroyed context. If a new session reuses that memory address, it could
bypass the upload and incorrectly reuse the previous session's LUT.

[ ... ]

> static dma_addr_t ope_buf_dma_addr(struct ope_ctx *ctx, unsigned int queu=
e_idx)
> {
> 	struct vb2_v4l2_buffer *vbuf =3D ope_queue_peek(ctx, queue_idx);
>=20
> 	if (!vbuf)
> 		return 0;
>=20
> 	return vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
> }

[Severity: High]
Might this cause a race condition where the hardware performs DMA into a fr=
eed
buffer? The worker merely peeks at the ready queue to get the DMA address
without taking ownership. Meanwhile, ope_stop_streaming() re-enables the wo=
rk
queue and calls ope_queue_drain(), which can return the buffer to userspace
while the hardware is programmed to use it.

[ ... ]

> static void ope_sched_cancel(struct ope_ctx *ctx)
> {
> 	struct ope_dev *ope =3D ctx->ope;
> 	bool running;
>=20
> 	disable_work_sync(&ope->run_work);
>=20
> 	scoped_guard(spinlock_irqsave, &ope->sched_lock) {
> 		running =3D (ope->curr_ctx =3D=3D ctx);
> 		ctx->queued =3D false;
> 	}
>=20
> 	if (running) {
> 		reinit_completion(&ope->reset_complete);
> 		ope_write(ope, OPE_TOP_RESET_CMD, OPE_TOP_RESET_CMD_SW);
> 		if (!wait_for_completion_timeout(&ope->reset_complete,
> 						 msecs_to_jiffies(OPE_RESET_TIMEOUT_MS)))
> 			dev_err(ope->dev, "reset timeout during cancel\n");

[Severity: High]
Is there a risk of a use-after-free if the hardware reset times out here? T=
he
timeout error is logged, but ope->hw_ctx is not cleared. The caller will
proceed to free the context memory. If the delayed hardware interrupt
eventually fires, the ISR will read the dangling pointer.

> 	}
>=20
> 	enable_work(&ope->run_work);
> }

[Severity: High]
Could this lead to a permanent deadlock of the scheduler? Disabling the
workqueue and triggering the hardware reset interrupts the state machine.
If ope_stop_streaming() is called on a single queue while others are active,
the interrupt will call ope_job_finish(). Because other queues are active,
ope_try_schedule() sees the job as ready, sets ctx->queued =3D true, and ca=
lls
schedule_work(). Since the workqueue is disabled here, the work is silently
dropped, and future try_schedule calls will return immediately.

[ ... ]

> static void ope_try_schedule(struct ope_ctx *ctx)
> {
> 	struct ope_dev *ope =3D ctx->ope;
>=20
> 	if (!ope_job_ready(ctx))
> 		return;
>=20
> 	scoped_guard(spinlock_irqsave, &ope->sched_lock) {
> 		if (ctx->queued || ope->curr_ctx)
> 			return;
> 		ctx->queued =3D true;
> 	}
>=20
> 	schedule_work(&ope->run_work);
> }

[Severity: High]
As noted above, if schedule_work() is called while the workqueue is disable=
d,
it is dropped. Because ctx->queued is already set to true, the scheduler
becomes permanently stuck.

[ ... ]

> static irqreturn_t ope_irq(int irq, void *dev_id)
> {
> 	struct ope_dev *ope =3D dev_id;
> 	struct ope_ctx *ctx;
> 	u32 status;
>=20
> 	/*
> 	 * hw_ctx is safe to read here without a lock: ope_run_job() sets it
> 	 * before calling ope_start(), so the hardware cannot raise an IRQ
> 	 * before hw_ctx is visible.  ope_job_finish() clears it in IRQ context
> 	 * here, so the clear is serialised with this read by the IRQ
> 	 * itself.
> 	 */
> 	ctx =3D ope->hw_ctx;

[Severity: High]
If the hardware reset timed out earlier during ope_sched_cancel(), could the
delayed interrupt fire later and dereference a freed context here?

>=20
> 	status =3D ope_read(ope, OPE_TOP_IRQ_STATUS);
> 	ope_write(ope, OPE_TOP_IRQ_CLEAR, status);
> 	ope_write(ope, OPE_TOP_IRQ_CMD, OPE_TOP_IRQ_CMD_CLEAR);
>=20
> 	if (status & OPE_TOP_IRQ_STATUS_RST_DONE) {
> 		dev_dbg(ope->dev, "reset done ctx=3D%p\n", ctx);
> 		ope_glut_cache_invalidate(ope);
> 		if (ctx)
> 			ope_job_finish(ctx, VB2_BUF_STATE_ERROR);
> 		complete(&ope->reset_complete);
> 	}

[Severity: High]
Could the ISR access freed memory by continuing execution after this block?
Signaling reset_complete unblocks the thread in ope_sched_cancel(), which
might immediately destroy and free the context. The ISR then continues to
execute down to the WE and IDLE status checks, dereferencing its local copy
of the freed ctx.

>=20
> 	if (status & OPE_TOP_IRQ_STATUS_VIOL)
> 		dev_warn(ope->dev, "OPE violation: 0x%08x\n",
> 			 ope_read(ope, OPE_TOP_VIOLATION_STATUS));
>=20
> 	if (status & OPE_TOP_IRQ_STATUS_FE)
> 		ope_fe_irq(ope);
>=20
> 	if (status & OPE_TOP_IRQ_STATUS_WE) {
> 		if (ope_we_irq(ope, ctx))
> 			return IRQ_HANDLED;
> 	}
>=20
> 	if ((status & OPE_TOP_IRQ_STATUS_IDLE) && ctx) {
> 		struct ope_stripe *stripe =3D ope_current_stripe(ctx);
>=20
> 		dev_dbg(ope->dev, "stripe %u done ctx=3D%p\n", ctx->current_stripe, ctx=
);
>=20
> 		if (unlikely(!stripe)) {
> 			dev_err(ope->dev, "stripe index %u out of range\n", ctx->current_strip=
e);
> 			ctx->current_stripe =3D 0;
> 			ope_job_finish(ctx, VB2_BUF_STATE_ERROR);
> 		} else if (ope_stripe_is_last(stripe)) {
> 			ctx->current_stripe =3D 0;
> 			ope_job_finish(ctx, VB2_BUF_STATE_DONE);
> 		} else {
> 			ctx->current_stripe++;
> 			ope_start(ope);
> 		}
> 	}

[Severity: Medium]
What happens if both the RST_DONE and IDLE interrupts are co-asserted? Since
ctx is not cleared and the routine doesn't return early after handling the
reset block above, it looks like it will fall through here and call
ope_job_finish() a second time, which might prematurely complete unrelated
buffers and corrupt the queue state.

[ ... ]

> static void ope_stop_streaming(struct vb2_queue *q)
> {
> 	struct ope_ctx *ctx =3D ope_ctx_from_vq(q);
> 	struct video_device *vdev =3D ope_vdev_from_vq(q);
> 	unsigned int idx =3D ope_idx_from_vq(q);
>=20
> 	dev_dbg(ctx->ope->dev, "streaming stop ctx=3D%p queue=3D%u\n", ctx, idx);
>=20
> 	if (idx =3D=3D OPE_QUEUE_FRAME_IN) {
> 		ctx->started =3D false;
> 		ope_adjust_power(ctx->ope);
> 	}
>=20
> 	ope_sched_cancel(ctx);
> 	ope_queue_drain(ctx, idx, VB2_BUF_STATE_ERROR);
> 	pm_runtime_put(ctx->ope->dev);
> 	video_device_pipeline_stop(vdev);
> }

[Severity: High]
As noted with ope_buf_dma_addr(), the context's queues are drained after the
workqueue is re-enabled in ope_sched_cancel(). This allows the hardware
worker to race with the drain and potentially perform DMA into a buffer that
has already been returned to userspace.

[ ... ]

> static struct ope_ctx *ope_ctx_create(struct ope_dev *ope)
> {
> 	struct v4l2_pix_format_mplane pix_in =3D { .pixelformat =3D ope_input_fm=
ts[0].fourcc };

[ ... ]

> 	for (i =3D 0; i < OPE_QUEUE_COUNT; i++) {
> 		INIT_LIST_HEAD(&ctx->queues[i].rdy_queue);
> 		spin_lock_init(&ctx->queues[i].rdy_spinlock);
> 		ret =3D ope_init_vq(ctx, i);
> 		if (ret)
> 			goto err_release_vq;
> 	}
>=20
> 	INIT_LIST_HEAD(&ctx->list);
>=20
> 	scoped_guard(spinlock, &ope->ctx_lock)
> 		list_add(&ctx->list, &ope->ctx_list);

[Severity: Low]
Is it safe to mix goto-based error handling and scope-based cleanup helpers
in the same routine? The kernel cleanup guidelines suggest avoiding this
mixture to prevent LIFO ordering issues or confusing ownership semantics.

[ ... ]

> static int ope_release(struct file *file)
> {
> 	struct v4l2_fh *fh =3D file_to_v4l2_fh(file);
> 	struct ope_ctx *ctx =3D ope_ctx_from_file(file);
> 	struct ope_dev *ope =3D ctx->ope;
>=20
> 	v4l2_fh_del(fh, file);
> 	v4l2_fh_exit(fh);
> 	kfree(fh);
>=20
> 	scoped_guard(mutex, &ope->mutex) {
> 		if (--ope->open_count !=3D 0)
> 			return 0;
> 		ope->shared_ctx =3D NULL;
> 		scoped_guard(spinlock, &ope->ctx_lock)
> 			list_del(&ctx->list);
> 	}
>=20
> 	ope_ctx_destroy(ctx);
>=20
> 	return 0;
> }

[Severity: High]
Could this early return on close trap the vb2_queue ownership? If a file
descriptor that acquired queue ownership is closed, returning without calli=
ng
vb2_queue_release() or clearing its owner leaves the queue locked to a freed
file descriptor pointer. This could lead to a permanent -EBUSY denial of
service for other open descriptors.

[Severity: High]
Also, is it possible for ope_release() to access freed memory here? Since t=
he
ope_dev structure is allocated with devm_kzalloc(), its lifetime is tied to
device binding. If userspace holds the character device open beyond unbind,
ctx->ope might point to freed memory when the file is eventually closed.

[ ... ]

> static void ope_v4l2_cleanup(struct ope_dev *ope)
> {
> 	if (ope->pipeline) {
> 		camss_isp_pipeline_unregister(ope->pipeline);
> 		camss_isp_pipeline_free(ope->pipeline);
> 		ope->pipeline =3D NULL;
> 	}
> 	media_device_unregister(&ope->mdev);
> 	v4l2_device_unregister(&ope->v4l2_dev);
> 	media_device_cleanup(&ope->mdev);
> 	synchronize_irq(ope->irq);
> 	cancel_work_sync(&ope->run_work);
> }

[Severity: High]
Could this sequence result in a NULL pointer dereference? The pipeline is
freed and nulled out before the worker thread is fully canceled. If the
worker thread executes concurrently during unbind, it might try to access t=
he
freed pipeline via camss_isp_pipeline_get_subdev().

[Severity: High]
Additionally, should this cleanup routine issue a hardware reset to abort a=
ny
active DMA? When the driver unbinds, devres tears down DMA and IOMMU
mappings. If the hardware is still running, couldn't it continue executing
DMA into unmapped memory, triggering fatal bus or IOMMU faults?

[ ... ]

> static int ope_probe(struct platform_device *pdev)
> {
> 	struct device *dev =3D &pdev->dev;
> 	struct ope_dev *ope;
> 	int ret, irq;
>=20
> 	ope =3D devm_kzalloc(dev, sizeof(*ope), GFP_KERNEL);

[Severity: High]
As noted in ope_release(), allocating this structure with a devres managed
lifetime ties it to the driver bind rather than the file descriptors. This
leads to a use-after-free when userspace closes the file descriptor after t=
he
driver is unbound.

> diff --git a/drivers/media/platform/qcom/camss/ope/pipeline.c b/drivers/m=
edia/platform/qcom/camss/ope/pipeline.c
> --- a/drivers/media/platform/qcom/camss/ope/pipeline.c
> +++ b/drivers/media/platform/qcom/camss/ope/pipeline.c

[ ... ]

> static int isp_register_vdev(struct camss_isp_pipeline *pipeline,
> 			     struct camss_isp_pipeline_entity *slot,
> 			     const struct camss_isp_entity_desc *desc,
> 			     struct v4l2_device *v4l2_dev)
> {

[ ... ]

> 	ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> 	if (ret)
> 		return ret;
>=20
> 	kref_get(&pipeline->refcount);
>=20
> 	video_set_drvdata(vdev, desc->vdev.drvdata);
>=20
> 	return 0;
> }

[Severity: Medium]
Does registering the device before setting the driver private data introduc=
e a
time-of-check to time-of-use race condition? If userspace immediately issues
an ioctl on the newly visible device node, video_get_drvdata() could return
uninitialized data before it is set here.

[ ... ]

> static int isp_register_subdev(struct camss_isp_pipeline_entity *slot,
> 			       const struct camss_isp_entity_desc *desc,
> 			       struct v4l2_device *v4l2_dev)
> {

[ ... ]

> 	sd->entity.function =3D desc->function ?
> 			      desc->function : MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
> 	/* Create a /dev/v4l-subdevN node so userspace can query pad formats */
> 	sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> 	if (desc->subdev.internal_ops)

[Severity: High]
Does exposing this subdevice to userspace without matching refcounting on t=
he
parent pipeline risk a use-after-free? Unlike the main video nodes, it seems
the subdevice node doesn't hold a reference to pipeline->refcount. If
userspace keeps it open after driver unbind, the main nodes might release t=
he
pipeline memory, leading to a crash on subsequent subdev operations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-camss-isp-=
ope-v6-0-6b915b9c5131@oss.qualcomm.com?part=3D6
