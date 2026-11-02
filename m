Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641678;
	b=lVyyijkWK9eaEAgMk518BGxuubveq00NQkmJvNOrjQVky3r+/fehJjye81Fw6tBzMCwO
	 z0y+pR9ScAv0+pysVz+UyDgRd5flif7OEOsKbtCACHNtx6hiO5Enqueguta9ap5w0fui8
	 yPZ3OQb9uNuz9r/yQ2IhjGRh1W3C6FKLvsBSeERPcZ7+zwmRhs1Vi0WvNdN2hiPeC6HEi
	 X0aJDyR3mCpCg1t8ANHneqAU1nSAYmWgmbNGGpSnILAUmQa/P0tsohXwVI8dnbQkoai2y
	 nY0YceznWjPur1f2TdWv7WzBNpefAqNK3bSB0SOA9UToepRRqG+85+rQPBsjQXjEARQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641678;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7xSR045hqy5gu2tPXnigzTTBUMzXMCa91hhe/adkdhE=;
	b=4+/AAXtDzQ1KZpGWI2FqsL2O3ntk2XdtCRON816FpTylGUwD3nFkIAW1qyNEb9NQNFSO
	 b7BYN5Jxc7qU5gnhHSHkMqREZqYhekJPXfH/bKrlDmUh62dGrb1kCviIhhY0abuzy03tU
	 SCaZhBn0KAPAonnFsdS8rRVFxD7JwnvtNpuCjH0yMBhO3ftN6re6kXLeW1f/zuo7eVFm4
	 Kdra2Y675tv6VooDxorOHHMCer+6DD6sOi+YFrQNZLiG+7aISuW20OsTl/ruoLYtpuBmv
	 zDR4B6GxR/Y1gvJ/HYM2agm+/q2MZBVKstUIVjwfxVuHk+1WHHqkbDA2coJmQRL73mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ln56bHD4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD4B606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ln56bHD4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F7C31F00A1D;
	Mon,  2 Nov 2026 17:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793641677;
	bh=7xSR045hqy5gu2tPXnigzTTBUMzXMCa91hhe/adkdhE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ln56bHD4cEnsSCcDENkYl3Dzza0sdytSBHsYkeawftFRXSvqjs1yGouMM5KppcvEI
	 mThLKD2OoxrhXt9zOv2O2ISgv3px7w1hgd7wtsTx/m5K8QwyeKGGlZwMYrfvKGYhwZ
	 R5PgJ84g7pnqCnKne+Y8yOcRHfAv3GWnkjpjWtYPC781R7TPb5eXQtnrRtrIrhATaY
	 rbbvUflMw+5FFJbWkuVqrjpBY07HD9bjO6qtMlJ+AXM2Q5gAOFmb4qaD+79NLR6TGJ
	 Z2Nc4wr9mwRJ/VDYII0PmB7OBNBkMbl3FJyw7u4U2dB5rjWL0XILbDMzaIhEF3fGTf
	 YdIwS4AB/fO/A==
Message-ID: <sashiko-outbox-193862@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261102-camss-isp-ope-v12-9-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
 <20261102-camss-isp-ope-v12-9-702254689feb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 17:47:56 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] media: qcom: camss: ope: lock mismatch in ope_init_vq() and ope_re=
lease()
- [High] media: qcom: camss: ope: premature job scheduling in ope_buf_queue=
()
- [High] media: qcom: camss: ope: bypassed input link validation and crop c=
heck in ope_gen_stripes()
- [Medium] media: qcom: camss: ope: unbalanced pipeline stop in camss_isp_p=
ipeline_unregister()
- [Medium] media: qcom: camss: ope: unconditional params dequeue in ope_job=
_finish()
- [Medium] media: qcom: camss: ope: broken 0 Hz and max OPP handling in ope=
_adjust_power()
- [Medium] media: qcom: camss: ope: stale LUT cache and IRQ state across PM=
 in ope_pm_ops
- [Medium] media: qcom: camss: ope: missing streaming and error checks in o=
pe_poll()
- [Medium] media: qcom: camss: ope: late qos_req init and enable_irq() in o=
pe_probe()
- [Low] media: qcom: camss: ope: incomplete kernel-doc comments in pipeline=
.h
--

commit 794b191431104656d0239186c164f42ae91573b3
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

media: qcom: camss: Add CAMSS Offline Processing Engine driver

This commit adds the V4L2 media controller driver for the Qualcomm Camera
Subsystem Offline Processing Engine (ope), including the core m2m driver, a
declarative media-controller pipeline builder, and extensible isp parameter
buffer handling.

Link: https://github.com/jwrdegoede/libcamera/commits/camss_pipeline_v2.1/
Link: https://github.com/loicpoulain/camss-isp-m2m-test

> diff --git a/drivers/media/platform/qcom/camss/ope/core.c b/drivers/media=
/platform/qcom/camss/ope/core.c
> new file mode 100644
> index 0000000000000..1f9905c3adc9f
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/ope/core.c

[ ... ]

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
Can the fetch engine read past the end of the input buffer in
ope_gen_stripes() in drivers/media/platform/qcom/camss/ope/core.c when the
subdev crop rectangle on ope_proc exceeds ctx->fmt_in?

In ope_entity_descs[] in drivers/media/platform/qcom/camss/ope/core.c,
ope_input_entity_ops (.link_validate =3D ope_input_link_validate) is attach=
ed
to the source video node rather than the sink subdev:

	[OPE_ENTITY_FRAME_IN] =3D {
		...
		.vdev.entity_ops =3D &ope_input_entity_ops,
		.pads =3D (const struct camss_isp_pad_desc[]) {
			{ MEDIA_PAD_FL_SOURCE, OPE_ENTITY_PROC, OPE_PROC_PAD_SINK_IN, 0 },
			{ }
		},
	},
	...
	[OPE_ENTITY_PROC] =3D {
		.name       =3D "ope_proc",
		.obj_type   =3D MEDIA_ENTITY_TYPE_V4L2_SUBDEV,
		.function   =3D MEDIA_ENT_F_PROC_VIDEO_ISP,
		.subdev.ops =3D &ope_proc_ops,
		.subdev.internal_ops =3D &ope_proc_internal_ops,

Because __media_pipeline_start() only invokes entity->ops->link_validate(li=
nk)
when iterating over sink pads (link->sink =3D=3D pad), and ope_input only h=
as a
source pad while ope_proc leaves .subdev.entity_ops unset,
ope_input_link_validate() is never called.

In addition, ope_state_is_busy() in
drivers/media/platform/qcom/camss/ope/core.c only checks ctx->started (which
tracks the input queue), and ope_s_fmt_vid_out() / ope_s_fmt_vid_cap() only
check vb2_is_busy() on their own queue:

static bool ope_state_is_busy(struct v4l2_subdev *sd, struct v4l2_subdev_st=
ate *state)
{
	...
	scoped_guard(spinlock, &ope->ctx_lock)
		list_for_each_entry(ctx, &ope->ctx_list, list)
			busy |=3D ctx->started;

	return busy;
}

If userspace starts streaming on ope_params or ope_disp_output first (which
increments pipe->start_count while ctx->started remains false), subdev and
video node formats and selections can still be changed afterwards, and later
video_device_pipeline_alloc_start() calls skip link validation because
pipe->start_count is already non-zero.

Since ope_gen_stripes() checks compose against fo->width and fo->height but
does not check crop->left + crop->width <=3D fi->width or
crop->top + crop->height <=3D fi->height before computing src and the stripe
dimensions, shouldn't ope_gen_stripes() also bounds-check crop against fi,
and shouldn't link validation and busy checks cover the whole pipeline?

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

[ ... ]

> +	if (ope_apply_params(ctx))
> +		dev_warn_ratelimited(ope->dev, "Invalid parameters\n");

[Severity: Medium]
What happens if a parameter buffer is queued on ope_params while a job is
already running on the hardware?

At job start, ope_run_job() -> ope_apply_params() in
drivers/media/platform/qcom/camss/ope/core.c calls ope_queue_peek() on the
params queue without removing the buffer or recording whether the running j=
ob
consumed one. Because the params queue is optional, ope_job_ready() allows a
job to start when no parameter buffer is queued.

If userspace queues a parameter buffer while that frame is in flight,
ope_buf_queue() appends it to rdy_queue, and when the current job finishes,
ope_job_finish() unconditionally calls ope_queue_remove() on the params que=
ue
and completes that newly arrived buffer via vb2_buffer_done() without
ope_apply_params() ever having parsed or applied it.

Also, when a parameter buffer is present at job start and ope_apply_params()
returns a validation error in ope_run_job(), the error is only logged and
ope_job_finish() still completes the invalid parameter buffer as done rather
than in an error state. Should ope_apply_params() dequeue or track the
consumed parameter buffer at job start and complete invalid parameter buffe=
rs
with an error state?

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

[ ... ]

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

[Severity: Medium]
Does ope_adjust_power() in drivers/media/platform/qcom/camss/ope/core.c ever
drop the performance state vote when all contexts stop streaming, or clamp
the rate when pixclk exceeds the maximum operating performance point?

When the last context stops streaming in ope_stop_streaming(), ctx->started
is set to false and ope_adjust_power() computes pixclk =3D 0. Calling
dev_pm_opp_find_freq_ceil(ope->dev, &pixclk) with pixclk =3D=3D 0 rounds pi=
xclk
up to the lowest frequency in the table (19.2 MHz) instead of keeping 0, so
dev_pm_opp_set_rate(ope->dev, 0) is never called and the required-opps vote
on the cx power domain stays active while idle.

Conversely, when pixclk exceeds the highest entry in the table,
dev_pm_opp_find_freq_ceil() returns an error pointer without updating pixcl=
k,
and ope_adjust_power() passes the un-clamped pixclk to
dev_pm_opp_set_rate(ope->dev, pixclk), which then fails instead of clamping
to the maximum frequency via dev_pm_opp_find_freq_floor().

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
Can a job be scheduled in ope_buf_queue() before ope_start_streaming() has
completed on the capture queue?

In ope_job_ready() in drivers/media/platform/qcom/camss/ope/core.c, readine=
ss
only checks ctx->started (which is set when the input queue starts streamin=
g)
and whether both rdy_queue lists are non-empty:

static bool ope_job_ready(void *priv)
{
	struct ope_ctx *ctx =3D priv;

	guard(spinlock_irqsave)(&ctx->queues_lock);

	return ctx->started &&
	       !list_empty(&ctx->queues[OPE_QUEUE_FRAME_IN].rdy_queue) &&
	       !list_empty(&ctx->queues[OPE_QUEUE_DISP_OUT].rdy_queue);
}

When userspace starts streaming on ope_input first (setting
ctx->started =3D true) and then queues buffers on ope_disp_output and starts
streaming on ope_disp_output, vb2_start_streaming() passes all queued captu=
re
buffers to ope_buf_queue() before invoking ope_start_streaming(). Because
ctx->started is already true, ope_buf_queue() -> ope_try_schedule() schedul=
es
ope->run_work before ope_start_streaming() on ope_disp_output has run
video_device_pipeline_alloc_start() or pm_runtime_resume_and_get().

If video_device_pipeline_alloc_start() or pm_runtime_resume_and_get() then
fails in ope_start_streaming(), the err_drain path returns the capture
buffers to videobuf2 without calling ope_sched_cancel(ctx) while
ope_run_work may already be running a job with those buffers. Should
ope_job_ready() require both the input and capture queues to have completed
ope_start_streaming()?

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

[ ... ]

> +static int ope_dqbuf(struct file *file, void *priv, struct v4l2_buffer *=
buf)
> +{
> +	struct ope_ctx *ctx =3D ope_ctx_from_file(file);
> +	struct vb2_queue *vq =3D ope_vq_from_file(file, ctx);
> +
> +	return vq ? vb2_dqbuf(vq, buf, file->f_flags & O_NONBLOCK) : -EINVAL;
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

[Severity: High]
Does setting q->lock =3D &ctx->vbq_lock in ope_init_vq() in
drivers/media/platform/qcom/camss/ope/core.c conflict with setting
vdev->lock =3D &pipeline->vdev_lock in isp_register_vdev() in
drivers/media/platform/qcom/camss/ope/pipeline.c?

In isp_register_vdev(), vdev->lock is set to &pipeline->vdev_lock while
vdev->queue is left NULL:

	vdev->fops        =3D desc->vdev.fops;
	vdev->lock        =3D &pipeline->vdev_lock;

When userspace issues an ioctl through video_ioctl2() -> __video_do_ioctl(),
v4l2_ioctl_get_lock() locks &pipeline->vdev_lock, and none of the buffer
ioctl wrappers (such as ope_dqbuf(), ope_qbuf(), ope_reqbufs(), or
ope_streamoff()) acquire ctx->vbq_lock.

When a blocking ope_dqbuf() -> vb2_dqbuf() -> __vb2_wait_for_done_vb() waits
for a buffer while q->done_list is empty, __vb2_wait_for_done_vb() calls
mutex_unlock(q->lock) on &ctx->vbq_lock (which is not held by the calling
thread), sleeps in wait_event_interruptible() while still holding
&pipeline->vdev_lock (preventing any other video node in the pipeline from
queueing buffers or stopping streaming), and then locks &ctx->vbq_lock on
wakeup, leaving &ctx->vbq_lock held after __video_do_ioctl() unlocks
&pipeline->vdev_lock.

Similarly, ope_release() acquires &ctx->vbq_lock around ope_queues_release()
instead of &pipeline->vdev_lock, so vb2_queue_release() is not serialized
against concurrent ioctls on other open file descriptors sharing the contex=
t.
Should q->lock and ope_release() use &pipeline->vdev_lock (or should each
queue/video node lock be aligned with q->lock)?

[ ... ]

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
> +	if (!list_empty(&vq->done_list)) {
> +		if (V4L2_TYPE_IS_OUTPUT(vq->type))
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

[Severity: Medium]
Can a caller blocked in ope_poll() in
drivers/media/platform/qcom/camss/ope/core.c hang indefinitely on streamoff
or device unbind?

Unlike vb2_poll(), ope_poll() only checks !list_empty(&vq->done_list) and
v4l2_event_pending(fh), and never checks !vb2_is_streaming(vq), vq->error, =
or
vq->waiting_for_buffers. When ope_unregister() calls vb2_queue_error() on
unbind:

	scoped_guard(spinlock, &ope->ctx_lock) {
		list_for_each_entry(ctx, &ope->ctx_list, list) {
			for (unsigned int i =3D 0; i < OPE_QUEUE_COUNT; i++)
				vb2_queue_error(&ctx->queues[i].vq);
		}
	}

or when streaming is stopped while done_list is empty, vq->done_wq is woken
up, but ope_poll() returns 0 instead of an error mask. Could ope_poll()
delegate to vb2_poll(vq, file, wait) instead?

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

[Severity: Medium]
In ope_probe() in drivers/media/platform/qcom/camss/ope/core.c, can userspa=
ce
open the video device nodes and start streaming after ope_v4l2_register(ope)
returns, before cpu_latency_qos_add_request() and enable_irq() have run?

If a process opens the newly registered video nodes and starts streaming in
that window, ope_start_streaming() -> ope_adjust_power() will call
cpu_latency_qos_update_request(&ope->qos_req, latency) before ope->qos_req
has been added, and any hardware job started in that window will not receive
interrupts because ope->irq is still disabled. Should
cpu_latency_qos_add_request() and enable_irq() happen before exposing the
device nodes in ope_v4l2_register()?

[ ... ]

> +static int ope_runtime_suspend(struct device *dev)
> +{
> +	struct ope_dev *ope =3D dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(ope->nclks, ope->clks);
> +
> +	return 0;
> +}
> +
> +static int ope_runtime_resume(struct device *dev)
> +{
> +	struct ope_dev *ope =3D dev_get_drvdata(dev);
> +
> +	return clk_bulk_prepare_enable(ope->nclks, ope->clks);
> +}
> +
> +static const struct of_device_id ope_dt_ids[] =3D {
> +	{ .compatible =3D "qcom,qcm2290-camss-ope" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, ope_dt_ids);
> +
> +static const struct dev_pm_ops ope_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(ope_runtime_suspend, ope_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resu=
me)
> +};

[Severity: Medium]
Does the driver preserve gamma table residency and interrupt mask state
across runtime suspend/resume and system sleep in
drivers/media/platform/qcom/camss/ope/core.c?

When streaming stops cleanly with no job in flight, ope_stop_streaming()
releases the runtime power management reference without resetting the
hardware, allowing ope_runtime_suspend() to disable clocks and power down t=
he
camss power domain without calling ope_glut_cache_invalidate(ope). When
streaming is restarted on the same context, ope_prog_gamma() sees the cached
bank as still valid:

	if (!dirty && ope_glut_bank_resident(ope, ope->glut_cur_bank, ctx)) {
		/* Already active in the read bank: only (re)enable the module. */
		bank =3D ope->glut_cur_bank;
	} else if (!dirty && ope_glut_bank_resident(ope, !ope->glut_cur_bank, ctx)=
) {
		/* Resident in the other bank: flip to it, no upload. */
		bank =3D !ope->glut_cur_bank;
	} else {
		/* Dirty, or miss in both banks: upload into the LRU bank. */
		bank =3D !ope->glut_mru_bank;
		ope_glut_upload(ctx, bank);
	}

and skips re-uploading the gamma table into hardware memory that lost power.

Also, ope_pm_ops uses pm_runtime_force_suspend() and
pm_runtime_force_resume() for system sleep. If the system suspends while
streaming is active, pm_runtime_force_suspend() turns off clocks without
pausing job scheduling or invalidating ope->hw_ctx and ope->glut_bank, and
pm_runtime_force_resume() does not re-run __ope_irq_init(ope) to restore the
interrupt masks.

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
> +			case MEDIA_ENTITY_TYPE_V4L2_SUBDEV:
> +				v4l2_device_unregister_subdev(&slot->subdev);
> +				break;

[Severity: Medium]
In camss_isp_pipeline_unregister() in
drivers/media/platform/qcom/camss/ope/pipeline.c, can calling
video_device_pipeline_stop(&slot->vdev) based on
video_device_pipeline(&slot->vdev) cause unbalanced pipeline stop calls on
unbind?

When any video device in the connected media graph starts the pipeline via
video_device_pipeline_alloc_start(), __media_pipeline_start() populates
pad->pipe on all connected pads in the graph, so
video_device_pipeline(&slot->vdev) becomes non-null on all three video nodes
even if only one or two of them started streaming. Iterating over all video
devices and calling video_device_pipeline_stop() whenever
video_device_pipeline(&slot->vdev) is non-null can therefore call
video_device_pipeline_stop() on nodes that never started the pipeline, and
unregistering in reverse index order also unregisters the subdevs at indices
3 and 2 before stopping the pipeline on the video devices at indices 1 and =
0.

> diff --git a/drivers/media/platform/qcom/camss/ope/pipeline.h b/drivers/m=
edia/platform/qcom/camss/ope/pipeline.h
> new file mode 100644
> index 0000000000000..f7d50734ed61f
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/ope/pipeline.h

[ ... ]

> +/**
> + * struct camss_isp_entity_desc - descriptor for one entity in the pipel=
ine
> + *
> + * @name:      Human-readable entity name (also used as video device name
> + *             suffix when @obj_type is MEDIA_ENTITY_TYPE_VIDEO_DEVICE).
> + *             Mandatory and must be non-empty.
> + * @obj_type:  MEDIA_ENTITY_TYPE_VIDEO_DEVICE, MEDIA_ENTITY_TYPE_V4L2_SU=
BDEV,
> + *             or MEDIA_ENTITY_TYPE_BASE.
> + * @function:  MEDIA_ENT_F_* function identifier.
> + * @pads:      Sentinel-terminated (flags =3D=3D 0) array of pad descrip=
tors.
> + *
> + * Fields used only for MEDIA_ENTITY_TYPE_VIDEO_DEVICE:
> + * @vdev.caps: V4L2_CAP_* device capabilities.
> + *             The video device direction (VFL_DIR_RX/TX/M2M) is derived
> + *             automatically from @caps by the builder.
> + * @vdev.drvdata: Opaque pointer set via video_set_drvdata() after regis=
tration.
> + * @vdev.fops:      File operations (mandatory).
> + * @vdev.ioctl_ops: ioctl operations (may be NULL).
> + *
> + * Fields used only for MEDIA_ENTITY_TYPE_V4L2_SUBDEV:
> + * @subdev.ops: Subdev operations (mandatory).
> + * @subdev.internal_ops: Internal subdev operations (may be NULL).
> + */
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
This isn't a bug, but running scripts/kernel-doc on
drivers/media/platform/qcom/camss/ope/pipeline.h warns about missing member
descriptions for @vdev, @vdev.entity_ops, @subdev, and @subdev.entity_ops in
struct camss_isp_entity_desc, as well as the missing @num_entities parameter
description on camss_isp_pipeline_alloc(). Could those kernel-doc entries be
added?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-camss-isp-=
ope-v12-0-702254689feb@oss.qualcomm.com?part=3D9
