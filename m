Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637865;
	b=okp1aKiV8JIXjVPAaLsEaE72npRJObdgk9mzivTPdgWlYqdhrJh35JecTEYK35qD5TGe
	 RhE3Tr8M0GrS4qEMk6yv8gV+cKn570FDyQ55HU3e/3h5a/KZ8cCL46VZwCmguQubOCEjn
	 /fBdA7XPIzwzaEA8sOAmV3qbHqJNv1059flSIUupMbVUuWba6muJRXOH9/gNg4ZPAXEl/
	 /PLk09wrwQ3fC34CFCvkX3fUoZQWgR42B+UUYad3DD1UBhfxYzADsnu/WOIwPRX5m9dI8
	 /Ua9/4hyFGIBUSWy6tWjIbEMifK7BFeFCc+N961uAudTR7GzQhnnU19DzoBoacqFy9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637865;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=S5KHKv4Gnncu6z08ND/H7jZUjKFyQVkS432fCi77IVY=;
	b=NenL1FzsgB10hpIWXwjex8k/LzsfIxtzSJotS9nqcXcU9KkRxhmo7GvhFHSJN23VB1Oq
	 ksrQ6YsyjrDkrpebod7nzuNJJZW0EILdHWC2AmXudnPELP4XYvl8BesqnCA7aiMzwubAl
	 kZVccL6T61+XDoep+zg6VMgs/KDYGRloPiHU8DFydyAvf3j+aoaxFRhpMhiqDFtLako2q
	 3/tZsObaFSM8N6RKtuE1uGMq/hKscwteFeTCgoPohwNffvxgoWah/HwxO2Qzb+Ie8aWfG
	 jmKegUodhXz3V8P7yRT832psxOSVNLlNvm/mK/XKytyQjyiOKC9HF56jKOOaWGJV5gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EFOHmHIY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6FE606B1D4
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 16:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EFOHmHIY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E5AF1F00A1B;
	Mon,  2 Nov 2026 16:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793637864;
	bh=S5KHKv4Gnncu6z08ND/H7jZUjKFyQVkS432fCi77IVY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EFOHmHIYiW4bLOYXUCX3othd9bbMCVBJkibtLTUBptVBuWhqx46Xnt8vKpk6GBkQD
	 qcTx1PC5OxDqYYGZeVDoDFxO+RcOAjBxfZ2Cxcv7GIq7R4idPLDC6EJD3UcgWpWzZZ
	 RFzA8QF7p6gkNIEJ12uNiYjZeCsSGDWbxBXkcdO9GcxLhisghjU+lfHBfX0yAapJmd
	 y0DFLOOGfAZWR8sP4Dwzv1/IJZSJVBAie9UyphDIFX9geeDgLvm5o5Tq8eFIjZWp+L
	 ANqaOAYK/iZKtWPIC06Y+aqdC+FoPNYMSalhVO0oqj4NwEjv6AGhPHZrTnR/YEiTxS
	 E7VLRgfEin/qA==
Message-ID: <sashiko-outbox-193768@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 6/9] media: qcom: camss: Add CAMSS Offline
 Processing Engine driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261102-camss-isp-ope-v12-6-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
 <20261102-camss-isp-ope-v12-6-702254689feb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 16:44:23 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 18 potential issue=
(s) to consider:
- [High] media: qcom: camss: unvalidated input link and crop bounds in ope_=
gen_stripes()
- [High] media: qcom: camss: hardware state lost across runtime PM and syst=
em sleep
- [High] media: qcom: camss: use-after-free of ope_dev in runtime PM callba=
cks
- [High] media: qcom: camss: missing error and streaming checks in ope_poll=
()
- [High] media: qcom: camss: premature job scheduling in ope_buf_queue()
- [High] media: qcom: camss: reset race in ope_sched_cancel() and ope_unreg=
ister()
- [High] media: qcom: camss: mismatched vdev->lock and vb2_queue->lock in o=
pe_init_vq()
- [High] media: qcom: camss: unbalanced pipeline stop and mdev teardown in =
ope_unregister()
- [Medium] media: qcom: camss: broken OPP clamping and 0 Hz vote in ope_adj=
ust_power()
- [Medium] media: qcom: camss: clock enable/prepare leak when unbinding whi=
le streaming
- [Medium] media: qcom: camss: ope_release() drops mutex before ope_ctx_des=
troy()
- [Medium] media: qcom: camss: device nodes registered before QoS init and =
enable_irq()
- [Medium] media: qcom: camss: ope_job_finish() pops unapplied OPE_QUEUE_PA=
RAMS buffers
- [Medium] media: qcom: camss: unaligned odd output heights in ope_fmt_try()
- [Medium] media: qcom: camss: premature video device exposure in camss_isp=
_pipeline_register()
- [Low] media: qcom: camss: missing VIDEO_V4L2_SUBDEV_API select in OPE Kco=
nfig
- [Low] media: qcom: camss: legacy PM macros in ope_pm_ops cause !CONFIG_PM=
 warnings
- [Low] media: qcom: camss: missing kernel-doc descriptions in pipeline.h
--

commit 64c35bb79d239fffee4a99402812b6499d9606da
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

media: qcom: camss: Add CAMSS Offline Processing Engine driver

This commit adds an image processing driver for the Qualcomm Offline
Processing Engine (OPE), a memory-to-memory ISP block that converts raw
Bayer frames to YUV. It exposes input, display output, and ISP parameter
video nodes along with a declarative media-controller topology builder
and V4L2 ISP parameter parser.

Link: https://github.com/jwrdegoede/libcamera/commits/camss_pipeline_v2.1/
Link: https://github.com/loicpoulain/camss-isp-m2m-test

> diff --git a/drivers/media/platform/qcom/camss/ope/Kconfig b/drivers/medi=
a/platform/qcom/camss/ope/Kconfig
> new file mode 100644
> index 0000000000000..d9f96430f145a
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/ope/Kconfig
> @@ -0,0 +1,17 @@
> +config VIDEO_QCOM_CAMSS_OPE
> +	tristate "Qualcomm Offline Processing Engine (OPE) driver"
> +	depends on V4L_PLATFORM_DRIVERS
> +	depends on MEDIA_CONTROLLER
> +	depends on VIDEO_DEV
> +	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
> +	select V4L2_ISP
> +	select VIDEOBUF2_DMA_CONTIG
> +	select VIDEOBUF2_VMALLOC

[Severity: Low]
Should VIDEO_QCOM_CAMSS_OPE also select VIDEO_V4L2_SUBDEV_API?

In drivers/media/platform/qcom/camss/ope/core.c, ope_proc_set_fmt(),
ope_proc_pad_ops, ope_disp_set_fmt(), and ope_disp_pad_ops reference
v4l2_subdev_get_fmt(), which is only declared in include/media/v4l2-subdev.h
when CONFIG_VIDEO_V4L2_SUBDEV_API is enabled.

In addition, isp_register_subdev() in
drivers/media/platform/qcom/camss/ope/pipeline.c sets
V4L2_SUBDEV_FL_HAS_DEVNODE and camss_isp_pipeline_register() calls
v4l2_device_register_subdev_nodes(), which turns into a no-op stub when
CONFIG_VIDEO_V4L2_SUBDEV_API is disabled.

> diff --git a/drivers/media/platform/qcom/camss/ope/core.c b/drivers/media=
/platform/qcom/camss/ope/core.c
> new file mode 100644
> index 0000000000000..1f9905c3adc9f
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/ope/core.c

[ ... ]

> +static int ope_gen_stripes(struct ope_ctx *ctx, dma_addr_t src, dma_addr=
_t dst)
> +{
> +	const struct ope_fmt_state *fi =3D &ctx->fmt_in;
> +	const struct ope_hw_fmt *src_hw =3D ope_find_hw_fmt(fi->fmt->fourcc);
> +	unsigned int h_scale, v_scale, num_stripes, x_out, x_out_c;
> +	const struct ope_fmt_state *fo =3D &ctx->fmt_out;
> +	const struct v4l2_rect *compose, *crop;
> +	unsigned int c_hsub =3D fo->fmt->c_hsub;
> +	unsigned int widths[OPE_MAX_STRIPE];
> +	struct v4l2_subdev_state *sd_state;
> +	struct v4l2_subdev *proc_sd;
> +	int ret =3D 0;
> +	u32 height;
> +
> +	proc_sd =3D camss_isp_pipeline_get_subdev(ctx->ope->pipeline, OPE_ENTIT=
Y_PROC);
> +	sd_state =3D v4l2_subdev_lock_and_get_active_state(proc_sd);
> +	crop =3D v4l2_subdev_state_get_crop(sd_state, OPE_PROC_PAD_SINK_IN);
> +	compose =3D v4l2_subdev_state_get_compose(sd_state, OPE_PROC_PAD_SOURCE=
);
> +
> +	if (compose->left + compose->width > fo->width ||
> +	    compose->top + compose->height > fo->height) {
> +		ret =3D -ERANGE;
> +		goto out;
> +	}
> +
> +	/* Advance source pointer to the crop origin */
> +	src +=3D crop->top * fi->bytesperline + crop->left * fi->fmt->depth / 8;

[Severity: High]
Can this advance src and program the Fetch Engine to read past the end of t=
he
input buffer?

ope_gen_stripes() checks that compose fits within fo->width and fo->height,
but it does not check that crop->left + crop->width <=3D fi->width and
crop->top + crop->height <=3D fi->height.

Furthermore, in ope_entity_descs[], OPE_ENTITY_PROC omits .subdev.entity_op=
s:

	[OPE_ENTITY_PROC] =3D {
		.name       =3D "ope_proc",
		.obj_type   =3D MEDIA_ENTITY_TYPE_V4L2_SUBDEV,
		.function   =3D MEDIA_ENT_F_PROC_VIDEO_ISP,
		.subdev.ops =3D &ope_proc_ops,
		.subdev.internal_ops =3D &ope_proc_internal_ops,

Because __media_pipeline_start() invokes link_validate on the sink entity of
each link, leaving sd->entity.ops NULL on ope_proc means
v4l2_subdev_link_validate() is never called on links sinking into ope_proc,
and ope_input_link_validate() is never executed. (Note also that
OPE_ENTITY_PARAMS sinks into ope_proc pad OPE_PROC_PAD_SINK_PAR without
an entity_ops->link_validate callback, and the ope_proc to ope_disp link
omits MEDIA_LNK_FL_IMMUTABLE.)

Even if ope_input_link_validate() were called when the first video node
starts the pipeline, ope_state_is_busy() only checks ctx->started (which is
only set when OPE_QUEUE_FRAME_IN starts streaming), and ope_s_fmt_vid_out()
and ope_s_fmt_vid_cap() only check vb2_is_busy() on their own queue. If
userspace starts streaming on ope_disp_output or ope_params first, the
pipeline start_count becomes 1, allowing subdev or input formats to be
changed afterwards without re-running link validation when ope_input starts.

[ ... ]

> +static void ope_prog_gamma(struct ope_ctx *ctx, bool force)
> +{
> +	struct camss_params_gamma *gamma =3D &ctx->config.gamma;
> +	bool enable =3D !(gamma->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABL=
E);
> +	bool dirty =3D gamma->header.flags & CAMSS_ISP_PARAMS_FL_BLOCK_DIRTY;
> +	struct ope_dev *ope =3D ctx->ope;
> +	u8 bank;
> +
> +	if (!force && !dirty)
> +		return;
> +
> +	gamma->header.flags &=3D ~CAMSS_ISP_PARAMS_FL_BLOCK_DIRTY;
> +
> +	if (!enable) {
> +		ope_write_pp(ope, OPE_PP_GLUT_MODULE_CFG, 0);
> +		return;
> +	}
> +
> +	if (!dirty && ope_glut_bank_resident(ope, ope->glut_cur_bank, ctx)) {
> +		/* Already active in the read bank: only (re)enable the module. */
> +		bank =3D ope->glut_cur_bank;
> +	} else if (!dirty && ope_glut_bank_resident(ope, !ope->glut_cur_bank, c=
tx)) {
> +		/* Resident in the other bank: flip to it, no upload. */
> +		bank =3D !ope->glut_cur_bank;
> +	} else {
> +		/* Dirty, or miss in both banks: upload into the LRU bank. */
> +		bank =3D !ope->glut_mru_bank;
> +		ope_glut_upload(ctx, bank);
> +	}

[Severity: High]
When the device goes through runtime PM suspend or system sleep, isn't the
hardware Gamma LUT SRAM state lost while ope->glut_bank[].valid stays true?

When all queues stop streaming in ope_stop_streaming(), pm_runtime_put()
allows the device to suspend and collapse the camss power domain, wiping the
hardware GLUT banks. Because ope_runtime_suspend() does not call
ope_glut_cache_invalidate(ope) or clear ope->hw_ctx, restarting streaming on
the same context without queuing a new gamma parameter block will see
!dirty && ope_glut_bank_resident() in ope_prog_gamma() and enable the GLUT
module without re-uploading the LUT to hardware.

Similarly, ope_pm_ops wires system sleep to pm_runtime_force_suspend() and
pm_runtime_force_resume(). If system suspend occurs while streaming is
active, pm_runtime_force_suspend() disables ope->clks without pausing the
scheduler, cancelling ope->run_work, or waiting for an active job to finish.
On resume, pm_runtime_force_resume() only re-enables clocks without calling
__ope_irq_init(ope), clearing ope->hw_ctx, or invalidating the GLUT cache,
leaving OPE_TOP_IRQ_MASK and IQ module registers unprogrammed.

[ ... ]

> +static int ope_apply_params(struct ope_ctx *ctx)
> +{
> +	struct vb2_v4l2_buffer *vbuf;
> +
> +	vbuf =3D ope_queue_peek(ctx, OPE_QUEUE_PARAMS);
> +	if (!vbuf)
> +		return 0;
> +
> +	return camss_isp_params_apply(ctx->ope->dev, &vbuf->vb2_buf,
> +				      ctx->params_buf,
> +				      ope_params_type_info,
> +				      ope_params_handlers,
> +				      ARRAY_SIZE(ope_params_handlers),
> +				      ctx);
> +}

[ ... ]

> +/* -------- Job scheduling -------- */
> +static bool ope_job_ready(void *priv)
> +{
> +	struct ope_ctx *ctx =3D priv;
> +
> +	guard(spinlock_irqsave)(&ctx->queues_lock);
> +
> +	return ctx->started &&
> +	       !list_empty(&ctx->queues[OPE_QUEUE_FRAME_IN].rdy_queue) &&
> +	       !list_empty(&ctx->queues[OPE_QUEUE_DISP_OUT].rdy_queue);
> +}
> +
> +static void ope_job_finish(struct ope_ctx *ctx, enum vb2_buffer_state st=
ate)
> +{
> +	struct vb2_v4l2_buffer *src, *dst, *params;
> +	struct ope_dev *ope =3D ctx->ope;
> +
> +	src    =3D ope_queue_remove(ctx, OPE_QUEUE_FRAME_IN);
> +	dst    =3D ope_queue_remove(ctx, OPE_QUEUE_DISP_OUT);
> +	params =3D ope_queue_remove(ctx, OPE_QUEUE_PARAMS);
> +
> +	if (dst) {
> +		dst->sequence =3D ctx->fmt_in.sequence++;
> +		if (src)
> +			dst->vb2_buf.timestamp =3D src->vb2_buf.timestamp;
> +	}
> +
> +	if (dst)
> +		vb2_buffer_done(&dst->vb2_buf, state);
> +	if (src)
> +		vb2_buffer_done(&src->vb2_buf, state);
> +	if (params)
> +		vb2_buffer_done(&params->vb2_buf, state);

[Severity: Medium]
Can ope_job_finish() pop and complete a parameters buffer from
OPE_QUEUE_PARAMS that was never applied to the job?

In ope_run_job(), ope_apply_params() peeks at OPE_QUEUE_PARAMS when the job
starts. If OPE_QUEUE_PARAMS was empty when ope_run_job() began (for example,
because userspace queued the input and capture buffers before the params
buffer, or queued parameters for the next frame while the current frame's
stripes are in flight), ope_buf_queue() places the newly queued params buff=
er
onto rdy_queue. When the current job finishes, ope_job_finish()
unconditionally calls ope_queue_remove(ctx, OPE_QUEUE_PARAMS) and marks that
unapplied params buffer done.

In addition, if ope_apply_params(ctx) fails validation in ope_run_job(),
ope_run_job() logs a warning and leaves the invalid buffer in
OPE_QUEUE_PARAMS, so ope_job_finish() completes it with VB2_BUF_STATE_DONE
instead of VB2_BUF_STATE_ERROR.

[ ... ]

> +static void ope_sched_cancel(struct ope_ctx *ctx)
> +{
> +	struct ope_dev *ope =3D ctx->ope;
> +	bool running;
> +
> +	scoped_guard(spinlock_irqsave, &ope->sched_lock)
> +		ope->sched_paused++;
> +
> +	cancel_work_sync(&ope->run_work);
> +
> +	scoped_guard(spinlock_irqsave, &ope->sched_lock) {
> +		running =3D (ope->hw_running && ope->hw_ctx =3D=3D ctx);
> +		ctx->queued =3D false;
> +	}
> +
> +	/* If the hardware is running the context, reset it */
> +	if (running) {
> +		if (ope_hw_reset_sync(ope)) {
> +			dev_err(ope->dev, "reset timeout during cancel\n");
> +			ope_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +		}
> +	}
> +
> +	/* Drain any handler that loaded ctx before hw_running was cleared */
> +	synchronize_irq(ope->irq);
> +
> +	/* Mark the context as no longer queued/running */
> +	scoped_guard(spinlock_irqsave, &ope->sched_lock) {
> +		if (ope->curr_ctx) {
> +			ope->curr_ctx->queued =3D false;
> +			ope->curr_ctx =3D NULL;
> +		}

[Severity: High]
As reported by Sashiko on v10 [1], can ope_sched_cancel() race with
__ope_irq() or ope_remove() -> ope_unregister() and call ope_job_finish()
twice on the same context?

First, in ope_sched_cancel(), if ope_hw_reset_sync(ope) times out right as
the reset-done interrupt fires in __ope_irq(), ope_job_finish(ctx,
VB2_BUF_STATE_ERROR) is called before synchronize_irq(ope->irq) and before
ope->hw_running is cleared, so both __ope_irq() and ope_sched_cancel() call
ope_job_finish() and pop buffers from rdy_queue twice.

Second, if ope_remove() runs concurrently with VIDIOC_STREAMOFF or close()
in ope_sched_cancel(), ope_remove() calls disable_irq(ope->irq) before
ope_unregister(ope). That prevents ope_hw_reset_sync() from receiving the
OPE_TOP_IRQ_STATUS_RST_DONE interrupt, forcing a timeout and calling
ope_job_finish(ctx, VB2_BUF_STATE_ERROR). Meanwhile, ope_unregister() reads
ctx =3D ope->curr_ctx, runs ope_hw_reset_poll(ope), and also calls
ope_job_finish(ctx, VB2_BUF_STATE_ERROR) without holding ope->mutex or
ctx->vbq_lock. If ope_sched_cancel() was called from ope_release() ->
ope_ctx_destroy(ctx) (which already dropped ope->mutex and removed ctx from
ope->ctx_list), ope_ctx_destroy() can free ctx while ope_unregister() is
still using it.

[ ... ]

> +static void ope_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct ope_ctx *ctx =3D ope_ctx_from_vq(vb->vb2_queue);
> +	unsigned int idx =3D ope_idx_from_vq(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +	struct camss_isp_buf *buf =3D container_of(vbuf, struct camss_isp_buf, =
vb);
> +
> +	scoped_guard(spinlock_irqsave, &ctx->queues_lock)
> +		list_add_tail(&buf->list, &ctx->queues[idx].rdy_queue);
> +
> +	ope_try_schedule(ctx);
> +}
> +
> +/* -------- Power scaling -------- */
> +
> +static inline unsigned long ope_pixclk(const struct ope_fmt_state *fs, u=
nsigned int fps)
> +{
> +	return (unsigned long)fs->width * fs->height * fps;
> +}

[Severity: Medium]
Can ope_adjust_power() fail to release the OPP vote when stopping streaming,
or fail with -ERANGE when pixclk exceeds the maximum OPP?

> +
> +static inline unsigned int ope_load_avg(const struct ope_fmt_state *fs, =
unsigned int fps)
> +{
> +	return mult_frac(ope_pixclk(fs, fps), fs->fmt->depth, 1000) / 8;
> +}
> +
> +static inline unsigned int ope_load_peak(const struct ope_fmt_state *fs,=
 unsigned int fps)
> +{
> +	return ope_load_avg(fs, fps) * 2;
> +}
> +
> +static inline unsigned int ope_load_config(const struct ope_fmt_state *f=
s, unsigned int fps)
> +{
> +	unsigned int stripe_count =3D fs->width / OPE_STRIPE_MAX_W + 1;
> +
> +	/* In worst case we have ~50 32-bit registers to write */
> +	return mult_frac(stripe_count * 50 * 4, fps, 1000);
> +}
> +
> +static void ope_adjust_power(struct ope_dev *ope)
> +{
> +	unsigned int loadavg =3D 0, loadpeak =3D 0, loadconfig =3D 0;
> +	s32 latency =3D PM_QOS_DEFAULT_VALUE;
> +	unsigned long pixclk =3D 0;
> +	struct dev_pm_opp *opp;
> +	struct ope_ctx *ctx;
> +	int ret;
> +
> +	guard(mutex)(&ope->mutex);
> +
> +	if (unlikely(!ope_hw_available(ope)))
> +		return;
> +
> +	/* ope mutex is held, which is what ctx_list is mutated under: no ctx_l=
ock */
> +	list_for_each_entry(ctx, &ope->ctx_list, list) {
> +		unsigned int fps;
> +
> +		if (!ctx->started)
> +			continue;
> +
> +		fps =3D ctx->framerate ? ctx->framerate : DEFAULT_FRAMERATE;
> +
> +		pixclk     +=3D ope_pixclk(&ctx->fmt_in, fps);
> +		loadavg    +=3D ope_load_avg(&ctx->fmt_in,  fps);
> +		loadavg    +=3D ope_load_avg(&ctx->fmt_out, fps);
> +		loadpeak   +=3D ope_load_peak(&ctx->fmt_in,  fps);
> +		loadpeak   +=3D ope_load_peak(&ctx->fmt_out, fps);
> +		loadconfig +=3D ope_load_config(&ctx->fmt_in, fps);
> +		latency =3D 100;
> +	}
> +
> +	/* 30% margin for overhead */
> +	pixclk =3D mult_frac(pixclk, 13, 10);
> +
> +	dev_dbg(ope->dev, "adjust power: clk=3D%luHz avg=3D%uKBps peak=3D%uKBps=
 cfg=3D%uKBps lat=3D%dus\n",
> +		pixclk, loadavg, loadpeak, loadconfig, latency);
> +
> +	opp =3D dev_pm_opp_find_freq_ceil(ope->dev, &pixclk);
> +	if (IS_ERR(opp))
> +		dev_warn(ope->dev, "Requested pixel clock %luHz exceeds hardware limit=
\n", pixclk);
> +	else
> +		dev_pm_opp_put(opp);
> +
> +	ret =3D dev_pm_opp_set_rate(ope->dev, pixclk);
> +	if (ret)
> +		dev_warn(ope->dev, "Failed to set OPP rate: %d\n", ret);

When all contexts stop streaming, pixclk is 0. Calling
dev_pm_opp_find_freq_ceil(ope->dev, &pixclk) with pixclk =3D=3D 0 overwrites
pixclk with the lowest OPP frequency in the table, so
dev_pm_opp_set_rate(ope->dev, pixclk) never receives 0 and never drops the
required-OPP vote on the cx power domain.

Conversely, when pixclk exceeds the highest OPP in the table,
dev_pm_opp_find_freq_ceil() returns ERR_PTR(-ERANGE) without clamping pixcl=
k,
so dev_pm_opp_set_rate(ope->dev, pixclk) is called with the out-of-range
frequency and fails with -ERANGE instead of clamping to the maximum OPP via
dev_pm_opp_find_freq_floor().

Also, on 32-bit COMPILE_TEST builds, ope_pixclk() multiplies width (up to
5376), height (up to 8192), and fps (up to 1000) in a 32-bit unsigned long,
which overflows 32 bits.

> +
> +	ret =3D icc_set_bw(ope->icc_data, loadavg, loadpeak);
> +	if (ret)
> +		dev_warn(ope->dev, "Failed to set data path BW: %d\n", ret);
> +
> +	ret =3D icc_set_bw(ope->icc_config, loadconfig, loadconfig * 5);
> +	if (ret)
> +		dev_warn(ope->dev, "Failed to set config path BW: %d\n", ret);
> +
> +	cpu_latency_qos_update_request(&ope->qos_req, latency);
> +}
> +
> +static int ope_start_streaming(struct vb2_queue *q, unsigned int count)
> +{
> +	struct ope_ctx *ctx =3D ope_ctx_from_vq(q);
> +	struct video_device *vdev =3D ope_vdev_from_vq(q);
> +	unsigned int idx =3D ope_idx_from_vq(q);
> +	int ret;
> +
> +	dev_dbg(ctx->ope->dev, "streaming start ctx=3D%p queue=3D%u\n", ctx, id=
x);
> +
> +	if (!ope_hw_available(ctx->ope)) {
> +		ret =3D -ENODEV;
> +		goto err_drain;
> +	}
> +
> +	ret =3D video_device_pipeline_alloc_start(vdev);
> +	if (ret)
> +		goto err_drain;
> +
> +	ret =3D pm_runtime_resume_and_get(ctx->ope->dev);
> +	if (ret) {
> +		dev_err(ctx->ope->dev, "resume failed (%d)\n", ret);
> +		goto err_pipeline_stop;
> +	}
> +
> +	if (idx =3D=3D OPE_QUEUE_FRAME_IN) {
> +		ctx->fmt_in.sequence =3D 0;
> +		ctx->started =3D true;
> +		ope_adjust_power(ctx->ope);
> +		__ope_irq_init(ctx->ope);
> +	}
> +
> +	ope_try_schedule(ctx);
> +
> +	return 0;
> +
> +err_pipeline_stop:
> +	video_device_pipeline_stop(vdev);
> +err_drain:
> +	ope_queue_drain(ctx, idx, VB2_BUF_STATE_QUEUED);
> +	return ret;
> +}

[Severity: High]
Can ope_buf_queue() schedule and start a hardware job before
ope_start_streaming() has run on OPE_QUEUE_DISP_OUT?

ctx->started only tracks whether OPE_QUEUE_FRAME_IN has started, and
ope_job_ready() only checks ctx->started along with non-empty FRAME_IN and
DISP_OUT rdy_queue lists.

During VIDIOC_STREAMON on OPE_QUEUE_DISP_OUT (when OPE_QUEUE_FRAME_IN is
already streaming), vb2_start_streaming() invokes ope_buf_queue() for all
pre-queued capture buffers before calling ope_start_streaming().
ope_buf_queue() adds the capture buffers to rdy_queue and calls
ope_try_schedule(ctx), which can schedule ope->run_work and start DMA before
ope_start_streaming() calls video_device_pipeline_alloc_start(vdev) or
pm_runtime_resume_and_get(). If either call fails in ope_start_streaming(),
err_drain calls ope_queue_drain(ctx, idx, VB2_BUF_STATE_QUEUED) without
calling ope_sched_cancel(ctx), returning the capture buffer to VB2 while
hardware DMA may already be running on it.

> +
> +static void ope_stop_streaming(struct vb2_queue *q)
> +{
> +	struct ope_ctx *ctx =3D ope_ctx_from_vq(q);
> +	struct video_device *vdev =3D ope_vdev_from_vq(q);
> +	unsigned int idx =3D ope_idx_from_vq(q);
> +
> +	dev_dbg(ctx->ope->dev, "streaming stop ctx=3D%p queue=3D%u\n", ctx, idx=
);
> +
> +	if (idx =3D=3D OPE_QUEUE_FRAME_IN) {
> +		ctx->started =3D false;
> +		ope_adjust_power(ctx->ope);
> +	}
> +
> +	/* Drain with the scheduler held off, so no job can pick up a buffer */
> +	ope_sched_cancel(ctx);
> +	ope_queue_drain(ctx, idx, VB2_BUF_STATE_ERROR);
> +	ope_sched_resume(ctx->ope);
> +
> +	/* May run after unbind, once devres has called pm_runtime_disable(),
> +	 * but nothing is left powered as devres drops the OPP, the power domai=
ns
> +	 * and the clocks regardless.
> +	 */
> +	pm_runtime_put(ctx->ope->dev);

[Severity: Medium]
As reported by Sashiko on v10 [1], does unbinding the device while streaming
leak the clock enable and prepare counts on ope->clks?

In ope_init_power(), the clocks are acquired via devm_clk_bulk_get_all().
When the device is unbound while streaming is active, devres runs
pm_runtime_disable() (without calling ope_runtime_suspend() because the
runtime PM usage count is still positive) and devm_clk_bulk_release() only
calls clk_bulk_put() without calling clk_bulk_disable_unprepare(). When
ope_stop_streaming() later runs on close() and calls pm_runtime_put(),
runtime PM is already disabled, so ope_runtime_suspend() never disables or
unprepares ope->clks.

[ ... ]

> +static int ope_init_vq(struct ope_ctx *ctx, unsigned int idx)
> +{
> +	struct ope_dev *ope =3D ctx->ope;
> +	struct ope_vq_priv *qpriv;
> +	struct vb2_queue *q =3D &ctx->queues[idx].vq;
> +	int ret;
> +
> +	qpriv =3D kzalloc_obj(*qpriv);
> +	if (!qpriv)
> +		return -ENOMEM;
> +
> +	qpriv->ctx =3D ctx;
> +	qpriv->queue_idx =3D idx;
> +	qpriv->vdev =3D camss_isp_pipeline_get_vdev(ope->pipeline, ope_queue_to=
_entity[idx]);
> +	q->drv_priv =3D qpriv;
> +	q->ops =3D &ope_vb2_ops;
> +	q->lock =3D &ctx->vbq_lock;

[Severity: High]
Does setting q->lock =3D &ctx->vbq_lock while vdev->lock is
&pipeline->vdev_lock cause an unbalanced mutex unlock and deadlock in
blocking VIDIOC_DQBUF?

In isp_register_vdev(), vdev->lock is set to &pipeline->vdev_lock while
vdev->queue is left NULL. Because vdev->queue is NULL, v4l2_ioctl_get_lock()
locks &pipeline->vdev_lock for all ioctls, and none of the vb2 ioctl wrappe=
rs
(such as ope_dqbuf(), ope_qbuf(), ope_reqbufs(), or ope_streamoff()) ever
acquires ctx->vbq_lock.

When a blocking VIDIOC_DQBUF enters ope_dqbuf() -> vb2_dqbuf() ->
__vb2_wait_for_done_vb(), videobuf2 calls mutex_unlock(q->lock) on
&ctx->vbq_lock (which is not held), sleeps in wait_event_interruptible()
while still holding &pipeline->vdev_lock (preventing any other thread from
calling VIDIOC_QBUF or VIDIOC_STREAMOFF on any video node in the pipeline),
and then calls mutex_lock(&ctx->vbq_lock) on wakeup without ever unlocking
it.

In addition, ope_release() holds ctx->vbq_lock around ope_queues_release()
while concurrent ioctls on other file descriptors only hold
pipeline->vdev_lock, and ope_mmap() calls vb2_mmap() without holding either
lock.

[ ... ]

> +static const struct ope_fmt *ope_fmt_try(struct ope_dev *ope, bool is_ou=
tput,
> +					 struct v4l2_pix_format_mplane *pix)
> +{
> +	const struct ope_fmt *fmts =3D is_output ? ope_output_fmts : ope_input_=
fmts;
> +	unsigned int n =3D is_output ? ARRAY_SIZE(ope_output_fmts) : ARRAY_SIZE=
(ope_input_fmts);
> +	unsigned int max_w =3D OPE_MAX_W, max_h =3D OPE_MAX_H;
> +	const struct ope_fmt *fmt;
> +	unsigned int bytesperline;
> +	unsigned int align;
> +
> +	fmt =3D ope_find_fmt(fmts, n, pix->pixelformat);
> +	if (!fmt) {
> +		fmt =3D &fmts[0];
> +		pix->pixelformat =3D fmt->fourcc;
> +	}
> +
> +	v4l_bound_align_image(&pix->width,  OPE_MIN_W, max_w, fmt->align,
> +			      &pix->height, OPE_MIN_H, max_h, 0, 0);

[Severity: Medium]
Can allowing odd heights in ope_fmt_try() violate the Write Engine's 16-byte
C-plane base address alignment or vertical chroma subsampling?

v4l_bound_align_image() is called with halign =3D 0, permitting odd
pix->height values. For NV24 and NV42 (c_hsub =3D 1), ope_fmt_try() aligns
bytesperline to 8 * fmt->c_hsub =3D 8. When bytesperline is an odd multiple=
 of
8 (such as 24) and pix->height is odd, bpl * img_h in
ope_gen_stripe_yuv_dst() is only 8-byte aligned, violating the 16-byte
alignment requirement on OPE_BUS_WR_CLIENT_ADDR_IMAGE(OPE_WR_CLIENT_DISP_C).
Odd heights also leave a fractional chroma line for 4:2:0 formats (NV12/NV21
where c_vsub =3D 2) and Bayer input formats.

[ ... ]

> +static void ope_ctx_destroy(struct ope_ctx *ctx)
> +{
> +	ctx->started =3D false;
> +
> +	ope_sched_cancel(ctx);
> +
> +	for (unsigned int i =3D 0; i < OPE_QUEUE_COUNT; i++)
> +		ope_deinit_vq(ctx, i);
> +
> +	ope_sched_resume(ctx->ope);
> +
> +	/* Do not leave the LUT cache pointing at a context about to be freed */
> +	ope_glut_cache_invalidate(ctx->ope);
> +
> +	kvfree(ctx->params_buf);
> +	mutex_destroy(&ctx->vbq_lock);
> +	kvfree(ctx);
> +}

[ ... ]

> +static int ope_release(struct file *file)
> +{
> +	struct v4l2_fh *fh =3D file_to_v4l2_fh(file);
> +	struct ope_ctx *ctx =3D ope_ctx_from_file(file);
> +	struct ope_dev *ope =3D ctx->ope;
> +
> +	scoped_guard(mutex, &ctx->vbq_lock)
> +		ope_queues_release(ctx, fh);
> +
> +	v4l2_fh_del(fh, file);
> +	v4l2_fh_exit(fh);
> +	kfree(fh);
> +
> +	scoped_guard(mutex, &ope->mutex) {
> +		if (--ope->open_count !=3D 0)
> +			return 0;
> +		ope->shared_ctx =3D NULL;
> +		scoped_guard(spinlock, &ope->ctx_lock)
> +			list_del(&ctx->list);
> +	}
> +
> +	ope_ctx_destroy(ctx);
> +
> +	return 0;
> +}

[Severity: Medium]
Can releasing ope->mutex before ope_ctx_destroy(ctx) race with a concurrent
ope_open()?

When --ope->open_count reaches 0 in ope_release(), ope->shared_ctx is set to
NULL and ope->mutex is unlocked before ope_ctx_destroy(ctx) runs. A
concurrent ope_open() can immediately acquire ope->mutex, allocate a new
ope->shared_ctx, and schedule a job on it while the old context is still in
ope_ctx_destroy().

In ope_ctx_destroy(), ope_sched_cancel() unconditionally clears
ope->curr_ctx (without checking ope->curr_ctx =3D=3D ctx), and then calls
ope_glut_cache_invalidate(ctx->ope) after ope_sched_resume(ctx->ope) without
holding ope->mutex, clobbering the new context's scheduled job and LUT cache
state.

> +
> +static __poll_t ope_poll(struct file *file, poll_table *wait)
> +{
> +	unsigned int idx =3D ope_queue_idx_from_file(file);
> +	struct ope_ctx *ctx =3D ope_ctx_from_file(file);
> +	struct v4l2_fh *fh =3D file_to_v4l2_fh(file);
> +	struct vb2_queue *vq;
> +	unsigned long flags;
> +	__poll_t rc =3D 0;
> +
> +	if (idx >=3D OPE_QUEUE_COUNT)
> +		return EPOLLERR;
> +
> +	vq =3D &ctx->queues[idx].vq;
> +
> +	poll_wait(file, &vq->done_wq, wait);
> +	poll_wait(file, &fh->wait, wait);
> +
> +	spin_lock_irqsave(&vq->done_lock, flags);
> +	if (!list_empty(&vq->done_list)) {\n> +		if (V4L2_TYPE_IS_OUTPUT(vq->ty=
pe))
> +			rc |=3D EPOLLOUT | EPOLLWRNORM;
> +		else
> +			rc |=3D EPOLLIN | EPOLLRDNORM;
> +	}
> +	spin_unlock_irqrestore(&vq->done_lock, flags);
> +
> +	if (v4l2_event_pending(fh))
> +		rc |=3D EPOLLPRI;
> +
> +	return rc;
> +}

[Severity: High]
Why doesn't ope_poll() use vb2_poll() or check for queue errors and
non-streaming state?

ope_poll() reaches into private fields of struct vb2_queue (done_wq,
done_lock, done_list) and only sets readiness bits when done_list is
non-empty or an event is pending. Because it never checks
!vb2_is_streaming(vq) || vq->error, any caller blocked in poll(), select(),
or epoll_wait() when VIDIOC_STREAMOFF is called or when ope_unregister()
calls vb2_queue_error() on unbind will wake up, see ope_poll() return 0, and
sleep forever instead of receiving EPOLLERR.

[ ... ]

> +static void ope_v4l2_dev_release(struct v4l2_device *v4l2_dev)
> +{
> +	struct ope_dev *ope =3D container_of(v4l2_dev, struct ope_dev, v4l2_dev=
);
> +	struct device *dev =3D ope->dev;
> +
> +	/* Reached once the V4L2 core has released every video and subdev node =
*/
> +	camss_isp_pipeline_free(ope->pipeline);
> +	media_device_cleanup(&ope->mdev);
> +	mutex_destroy(&ope->mutex);
> +	mutex_destroy(&ope->reset_mutex);
> +	kfree(ope);
> +
> +	put_device(dev);
> +}

[ ... ]

> +static void ope_unregister(struct ope_dev *ope)
> +{
> +	struct ope_ctx *ctx;
> +
> +	scoped_guard(spinlock_irqsave, &ope->sched_lock)
> +		ope->sched_paused++;
> +
> +	cancel_work_sync(&ope->run_work);
> +
> +	scoped_guard(spinlock_irqsave, &ope->sched_lock)
> +		ctx =3D ope->curr_ctx;
> +
> +	if (ctx) {
> +		if (ope_hw_reset_poll(ope))
> +			dev_err(ope->dev, "reset timeout on unbind\n");
> +		ope_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +	}
> +
> +	if (ope->pipeline)
> +		camss_isp_pipeline_unregister(ope->pipeline);
> +
> +	media_device_unregister(&ope->mdev);
> +
> +	scoped_guard(mutex, &ope->mutex) {
> +		cpu_latency_qos_remove_request(&ope->qos_req);
> +		v4l2_device_unregister(&ope->v4l2_dev);
> +	}
> +
> +	/*
> +	 * Wake up any still-open file handle blocked in DQBUF/QBUF so it does
> +	 * not hang forever now that the hardware is gone.
> +	 */
> +	scoped_guard(spinlock, &ope->ctx_lock) {
> +		list_for_each_entry(ctx, &ope->ctx_list, list) {
> +			for (unsigned int i =3D 0; i < OPE_QUEUE_COUNT; i++)
> +				vb2_queue_error(&ctx->queues[i].vq);
> +		}
> +	}
> +
> +	/*
> +	 * Drops the reference this driver holds. @ope may be freed here, or
> +	 * later by the V4L2 core if userspace still has a node open.
> +	 * media_device_cleanup() is deferred to ope_v4l2_dev_release().
> +	 */
> +	v4l2_device_put(&ope->v4l2_dev);
> +}

[Severity: High]
Can ope_v4l2_dev_release() free struct ope_dev while runtime PM is still
enabled on ope->dev, leading to a use-after-free in ope_runtime_suspend() or
ope_runtime_resume()?

Runtime PM is enabled with devm_pm_runtime_enable(dev) in ope_init_power(),
so it is not disabled until devres runs after ope_remove() (or a failed
ope_probe()) returns. When no file descriptors are open during ope_remove()
-> ope_unregister(), v4l2_device_put(&ope->v4l2_dev) immediately calls
ope_v4l2_dev_release() -> kfree(ope) while runtime PM is still enabled and
dev_get_drvdata(dev) still points to the freed ope struct (the same can
happen if ope_v4l2_register() fails during ope_probe()). Any asynchronous
pm_runtime_put() work item (from ope_irq() or ope_stop_streaming()) or sysfs
runtime PM transition running before devres_release_all() will dereference
freed memory in ope_runtime_suspend() or ope_runtime_resume().

[ ... ]

> +static int ope_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	/* ope ownership is transferred to ope_v4l2_register(), even on failure=
 */
> +	ret =3D ope_v4l2_register(ope);
> +	if (ret) {
> +		platform_set_drvdata(pdev, NULL);
> +		return dev_err_probe(dev, ret, "V4L2 registration failed\n");
> +	}
> +
> +	cpu_latency_qos_add_request(&ope->qos_req, PM_QOS_DEFAULT_VALUE);
> +
> +	/* Everything @ope_irq() touches is in place, let interrupts in */
> +	enable_irq(ope->irq);
> +
> +	return 0;

[Severity: Medium]
What happens if userspace opens a video node and starts streaming right aft=
er
ope_v4l2_register(ope) returns, before cpu_latency_qos_add_request() and
enable_irq(ope->irq) run?

ope_v4l2_register() immediately publishes the V4L2 video, subdev, and media
device nodes to userspace. If a process opens a node and calls
VIDIOC_STREAMON in this window, ope_start_streaming() -> ope_adjust_power()
calls cpu_latency_qos_update_request(&ope->qos_req, latency) before
ope->qos_req has been initialized, and jobs or resets can be started while
ope->irq is still disabled.

[ ... ]

> +static const struct dev_pm_ops ope_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(ope_runtime_suspend, ope_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resu=
me)
> +};
> +
> +static struct platform_driver ope_driver =3D {
> +	.probe  =3D ope_probe,
> +	.remove =3D ope_remove,
> +	.driver =3D {
> +		.name           =3D OPE_NAME,
> +		.of_match_table =3D ope_dt_ids,
> +		.pm             =3D pm_ptr(&ope_pm_ops),
> +	},
> +};

[Severity: Low]
Should ope_pm_ops use RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() instead of
SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS()?

When CONFIG_PM is disabled (for example under COMPILE_TEST),
SET_RUNTIME_PM_OPS() compiles out while ope_runtime_suspend() and
ope_runtime_resume() are not marked __maybe_unused, causing unused-function
compiler warnings. Pairing RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() with
pm_ptr(&ope_pm_ops) allows the compiler to drop them cleanly without
warnings.

> diff --git a/drivers/media/platform/qcom/camss/ope/pipeline.c b/drivers/m=
edia/platform/qcom/camss/ope/pipeline.c
> new file mode 100644
> index 0000000000000..a888d5027fc78
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/ope/pipeline.c

[ ... ]

> +void camss_isp_pipeline_unregister(struct camss_isp_pipeline *pipeline)
> +{
> +	int i;
> +
> +	/* Unregister entities in reverse order. */
> +	for (i =3D (int)pipeline->num_entities - 1; i >=3D 0; i--) {
> +		struct camss_isp_pipeline_entity *slot =3D &pipeline->entities[i];
> +
> +		if (slot->registered) {
> +			switch (slot->obj_type) {
> +			case MEDIA_ENTITY_TYPE_VIDEO_DEVICE:
> +				if (video_device_pipeline(&slot->vdev))
> +					video_device_pipeline_stop(&slot->vdev);
> +				video_unregister_device(&slot->vdev);
> +				break;

[Severity: High]
Can calling video_device_pipeline_stop(&slot->vdev) on every video device in
camss_isp_pipeline_unregister() underflow pipe->start_count or race with
ope_stop_streaming()?

Because all three video devices (ope_input, ope_params, ope_disp_output) sh=
are
the same connected media graph, starting streaming on even one queue sets
pad->pipe on all entities in the graph. Consequently,
video_device_pipeline(&slot->vdev) returns non-NULL for all three video
devices even if only one queue called video_device_pipeline_alloc_start().
Iterating over all video devices and calling video_device_pipeline_stop()
decrements pipe->start_count for queues that never started the pipeline, and
when ope_stop_streaming() later runs on close(), it calls
video_device_pipeline_stop() again.

Furthermore, in ope_unregister(), media_device_unregister(&ope->mdev) is
called before v4l2_device_unregister(&ope->v4l2_dev) and while open file
descriptors can still call ope_stop_streaming(). media_device_unregister()
clears pad->graph_obj.mdev to NULL, so a concurrent or subsequent call to
video_device_pipeline_stop() or video_device_pipeline_alloc_start() will
dereference a NULL mdev pointer when locking &mdev->graph_mutex.

[ ... ]

> +int camss_isp_pipeline_register(struct camss_isp_pipeline *pipeline,
> +				struct v4l2_device *v4l2_dev,
> +				const struct camss_isp_entity_desc *descs,
> +				unsigned int num_entities)
> +{
> +	unsigned int i, pi;
> +	int ret;
> +
> +	if (WARN_ON(num_entities !=3D pipeline->num_entities))
> +		return -EINVAL;
> +
> +	if (WARN_ON(!v4l2_dev || !v4l2_dev->mdev))
> +		return -EINVAL;
> +
> +	ret =3D isp_pipeline_validate(v4l2_dev->dev, descs, num_entities);
> +	if (ret)
> +		return ret;
> +
> +	pipeline->v4l2_dev =3D v4l2_dev;
> +
> +	/* Register each entity */
> +	for (i =3D 0; i < num_entities; i++) {
> +		const struct camss_isp_entity_desc *desc =3D &descs[i];
> +		struct camss_isp_pipeline_entity *slot =3D &pipeline->entities[i];
> +
> +		slot->obj_type =3D desc->obj_type;
> +
> +		ret =3D isp_alloc_pads(slot, desc);
> +		if (ret)
> +			goto err_unregister;
> +
> +		switch (desc->obj_type) {
> +		case MEDIA_ENTITY_TYPE_VIDEO_DEVICE:
> +			ret =3D isp_register_vdev(pipeline, slot, desc, v4l2_dev);
> +			break;

[Severity: Medium]
As reported by Sashiko on v4 [2], can userspace open the first registered
video device before the remaining entities and links in pipeline->entities[]
are initialized?

When i =3D=3D 0 (OPE_ENTITY_FRAME_IN), isp_register_vdev() calls
video_register_device(), immediately exposing /dev/videoN to userspace while
pipeline->entities[OPE_ENTITY_DISP_OUT] still has slot->obj_type =3D=3D 0 a=
nd
before the subdevs and media links are created. If userspace opens that node
before the loop reaches OPE_ENTITY_DISP_OUT, ope_open() -> ope_ctx_create()
-> ope_init_vq() calls camss_isp_pipeline_get_vdev(ope->pipeline,
OPE_ENTITY_DISP_OUT), which hits WARN_ON(pipeline->entities[idx].obj_type !=
=3D
MEDIA_ENTITY_TYPE_VIDEO_DEVICE) and sets qpriv->vdev =3D NULL.

> diff --git a/drivers/media/platform/qcom/camss/ope/pipeline.h b/drivers/m=
edia/platform/qcom/camss/ope/pipeline.h
> new file mode 100644
> index 0000000000000..f7d50734ed61f
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/ope/pipeline.h
> @@ -0,0 +1,239 @@

[ ... ]

> +struct camss_isp_entity_desc {
> +	const char				*name;
> +	u32					obj_type;
> +	u32					function;
> +	const struct camss_isp_pad_desc		*pads;
> +
> +	union {
> +		/* MEDIA_ENTITY_TYPE_VIDEO_DEVICE */
> +		struct {
> +			u32					caps;
> +			void					*drvdata;
> +			const struct v4l2_file_operations	*fops;
> +			const struct v4l2_ioctl_ops		*ioctl_ops;
> +			const struct media_entity_operations	*entity_ops;
> +		} vdev;
> +		/* MEDIA_ENTITY_TYPE_V4L2_SUBDEV */
> +		struct {
> +			const struct v4l2_subdev_ops		*ops;
> +			const struct v4l2_subdev_internal_ops	*internal_ops;
> +			const struct media_entity_operations	*entity_ops;
> +		} subdev;
> +	};
> +};

[ ... ]

> +/**
> + * camss_isp_pipeline_alloc() - allocate a pipeline for @num_entities en=
tities
> + *
> + * Returns a pointer to the new pipeline or ERR_PTR on failure.
> + * Free with camss_isp_pipeline_free().
> + */
> +struct camss_isp_pipeline *camss_isp_pipeline_alloc(unsigned int num_ent=
ities);

[Severity: Low]
This isn't a bug, but the kernel-doc comments in pipeline.h are missing
descriptions for @vdev.entity_ops and @subdev.entity_ops in struct
camss_isp_entity_desc and @num_entities in camss_isp_pipeline_alloc(), which
triggers W=3D1 kernel-doc warnings.

[1] https://lore.kernel.org/r/20260925-camss-isp-ope-v10-6-2622411034cb@oss=
.qualcomm.com
[2] https://lore.kernel.org/r/20260710-camss-isp-ope-v4-1-51207a0319d8@oss.=
qualcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-camss-isp-=
ope-v12-0-702254689feb@oss.qualcomm.com?part=3D6
