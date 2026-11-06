Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976127;
	b=c+SMskSe52lsrhK2Hz/zxkhLNr47r79nYt3xXBQL6u61lG/3QCj3PRa5CepGZ0bvfHUi
	 fjEF0+LFz2QaAOnP+JMHHaIz7cAEs/g98taRyuCPuNvOzkmmNEbYdh74YITC4Fk8AZDEK
	 Pn7obvbfcqY5iMqvkJDSVVUUNPRLcDPirwfWZ4vFLx4gJWGVoVizMsBARqKRUWdi91ES6
	 Xss7Yua2is0RyTLACsfhZkcrcArBcraygAv3FdPAq2OnPWEIHhOOTP2TVVveV+tn65hfb
	 XwLZveUeSRfpQn0+DED/q7sOke6+caapY4ZtDTT3rEQ7YSNeym18P7Wcz96hb/pRcxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976127;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=a7IBL0H3ll5WXj6OoVyDZq7sGEl4XwR6f3yad9Dce4A=;
	b=WogAJJxhmSFfdacqR21FxwcypIP+RPaC1zO+m6X6Q05pyu3ZKUQ600FhJDIcm37sReq4
	 hS8jjLUBXpbcOZupjD43veC8yYkGrOieS+mHRhJhEEjbnbhcKyRxGoBqyBYMt9UViHtcD
	 C1AW63AVpj8WAyXfPe45s/bOMSgLFkntnJK08zmzlwRN2eJdBi+rvlNjBU3Vt+pOgmIb5
	 U/1A6aDeIWuUrKTof013o58Y1l4ssGtSuMaKdVVq2jB5W/E5o5HDNu0ipMveF4iOoB/aO
	 e9gM6EuVV0/roas+RuQkHBKW+Svz1P2nW4RZQQNh54FIQfxtYOVfoNwyDLFGKFHTeBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m2okiTmk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD33606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 14:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m2okiTmk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B178F1F0089F;
	Fri,  6 Nov 2026 14:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793976126;
	bh=a7IBL0H3ll5WXj6OoVyDZq7sGEl4XwR6f3yad9Dce4A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m2okiTmkfEk1zazkur3Fg4EajOFWVB34p6VkCL0g2UlpfEoxGs7CO88dRXVr8trlf
	 vgUI5QEIBRXhXWOcW1wqj1L4t2+sFxXRV+VDwuh7AqwplKIa94N5eU0NydKgQjfReB
	 vkq6N8NjHtIJyN4+g7eSfuClWTAt0zDIrc91vKjgFwVO2mSzk5viZZvMuXUpKP41yt
	 Y/6v3rAYTQUktzA8AcVVwpN5vpN/YAbre1AB7IXY2/mXV2+H4K4Jfl6hT/4aSEIukq
	 6TS2TTpzuEKLyP1Pmx+UaGts8aX378zdubGOnkikvEeNrArG93p5FDK+YtP5YOu48J
	 kLxzYePPvPjjg==
Message-ID: <sashiko-outbox-201600@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 6/9] media: qcom: camss: Add CAMSS Offline
 Processing Engine driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261106-camss-isp-ope-v14-6-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
 <20261106-camss-isp-ope-v14-6-49c426cd2715@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 14:42:03 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 11 potential
issues to consider:
- [High] media: qcom: camss: unbalanced and racy pipeline teardown in
  ope_unregister()
- [Medium] media: qcom: camss: race between ope_sched_cancel() and
  ope_remove()
- [Medium] media: qcom: camss: ope_queues_release() aborts active jobs
  on shared ctx
- [Medium] media: qcom: camss: race in ope_job_finish() before removing
  buffers
- [Medium] media: qcom: camss: vertical phase step overflow in
  ope_prog_stripe()
- [Medium] media: qcom: camss: core clock enabled without required cx
  OPP vote
- [Medium] media: qcom: camss: premature devm_pm_runtime_enable() in
  ope_init_power()
- [Medium] media: qcom: camss: premature video device publication in
  ope_probe()
- [Medium] media: qcom: camss: ope: ope_flush_hw() fails unstarted jobs
  on suspend
- [Low] media: qcom: camss: wrong errno in ope_g_parm() and ope_s_parm()
  on capture
- [Low] media: qcom: camss: missing kernel-doc for vdev and subdev in
  pipeline.h
--

commit 754daff99307e8b7e1677889efa986d5ec3c5ea3
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

media: qcom: camss: Add CAMSS Offline Processing Engine driver

This commit adds a V4L2 memory-to-memory ISP driver for the Qualcomm Offline
Processing Engine (OPE), along with a declarative media-controller pipeline
builder and an ISP parameter buffer parser.

Link: https://github.com/jwrdegoede/libcamera/commits/camss_pipeline_v2.1/
Link: https://github.com/loicpoulain/camss-isp-m2m-test

> diff --git a/drivers/media/platform/qcom/camss/ope/core.c b/drivers/media=
/platform/qcom/camss/ope/core.c
> new file mode 100644
> index 0000000000000..11dca901e0f65
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/ope/core.c
[ ... ]
> +/* Downscaler fixed-point helpers */
> +#define Q21(v)			(((uint64_t)(v)) << 21)
> +#define DS_Q21(n, d)		((uint32_t)div_u64((uint64_t)(n) << 21, (d)))
> +#define DS_RESOLUTION(in, out) \
> +	(((out) * 128 <=3D (in)) ? 0x0U : \
> +	 ((out) * 16  <=3D (in)) ? 0x1U : \
> +	 ((out) * 8   <=3D (in)) ? 0x2U : 0x3U)
[ ... ]
> +static void ope_prog_stripe(struct ope_ctx *ctx, struct ope_stripe *stri=
pe)
> +{
[ ... ]
> +	/* Downscalers */
> +	for (int i =3D 0; i < OPE_DS_MAX; i++) {
> +		struct ope_dsc_config *dsc =3D &stripe->dsc[i];
> +		u32 base =3D ope_ds_base[i];
> +		u32 cfg =3D 0;
> +
> +		if (dsc->input_width !=3D dsc->output_width) {
> +			dsc->phase_step_h |=3D
> +				DS_RESOLUTION(dsc->input_width,
> +					      dsc->output_width) << 30;
> +			cfg |=3D OPE_PP_DOWNSCALE_MN_DS_CFG_H_SCALE_EN;
> +		}
> +		if (dsc->input_height !=3D dsc->output_height) {
> +			dsc->phase_step_v |=3D
> +				DS_RESOLUTION(dsc->input_height,
> +					      dsc->output_height) << 30;
> +			cfg |=3D OPE_PP_DOWNSCALE_MN_DS_CFG_V_SCALE_EN;
> +		}
> +
> +		ope_write_pp(ope, OPE_PP_DOWNSCALE_MN_DS_CFG(base), cfg);
> +		ope_write_pp(ope, OPE_PP_DOWNSCALE_MN_DS_IMAGE_SIZE_CFG(base),
> +			     ((dsc->input_width - 1) << 16) | (dsc->input_height - 1));
> +		ope_write_pp(ope, OPE_PP_DOWNSCALE_MN_DS_MN_H_CFG(base),
> +			     dsc->phase_step_h);
> +		ope_write_pp(ope, OPE_PP_DOWNSCALE_MN_DS_MN_V_CFG(base),
> +			     dsc->phase_step_v);

[Severity: Medium]
Can dsc->phase_step_v overflow the 30-bit phase step field in
OPE_PP_DOWNSCALE_MN_DS_MN_V_CFG at the maximum vertical downscaling ratio?

The driver allows a sink crop height of OPE_MAX_H (8192) and a source compo=
se
height of OPE_MIN_H (16).  At that 512x ratio, DS_Q21(8192, 16) evaluates to
512 << 21 (0x40000000, or BIT(30)).  ORing DS_RESOLUTION(8192, 16) << 30
(0x0U) into dsc->phase_step_v leaves bit 30 set and bits [29:0] zero, so
OPE_PP_DOWNSCALE_MN_DS_MN_V_CFG is programmed with a resolution selector of=
 1
instead of 0 and a phase step of 0.

[ ... ]

> +static void ope_job_finish(struct ope_ctx *ctx, enum vb2_buffer_state st=
ate)
> +{
> +	struct vb2_v4l2_buffer *src, *dst;
> +	struct ope_dev *ope =3D ctx->ope;
> +
> +	scoped_guard(spinlock_irqsave, &ope->sched_lock) {
> +		if (ope->curr_ctx !=3D ctx)
> +			return;
> +
> +		ope->curr_ctx =3D NULL;
> +		ope->hw_running =3D false;
> +		ctx->queued =3D false;
> +
> +		/* A failed job leaves the configuration in an unknown state */
> +		if (state !=3D VB2_BUF_STATE_DONE)
> +			ope->hw_ctx =3D NULL;
> +	}
> +
> +	src =3D ope_queue_remove(ctx, OPE_QUEUE_FRAME_IN);
> +	dst =3D ope_queue_remove(ctx, OPE_QUEUE_DISP_OUT);

[Severity: Medium]
Can releasing ope->sched_lock before removing src and dst from rdy_queue let
a concurrent ope_try_schedule() schedule a new job against the buffers being
completed?

ope_run_job() only peeks the buffers at the head of rdy_queue via
ope_buf_dma_addr(), leaving them queued until ope_job_finish() removes them:

CPU0                              CPU1
ope_job_finish()
  lock(&ope->sched_lock)
  ope->curr_ctx =3D NULL
  ctx->queued =3D false
  unlock(&ope->sched_lock)
                                  ope_buf_queue()
                                    ope_try_schedule()
                                      ope_job_ready() -> true
                                      lock(&ope->sched_lock)
                                      ctx->queued =3D true
                                      ope->curr_ctx =3D ctx
                                      schedule_work(&ope->run_work)
                                  ope_run_work()
                                    ope_run_job()
                                      ope_buf_dma_addr() <-- peeks finished=
 buf
  ope_queue_remove(FRAME_IN)
  ope_queue_remove(DISP_OUT)
  vb2_buffer_done()

Removing src and dst from rdy_queue before clearing ope->curr_ctx and
ctx->queued under ope->sched_lock would close this window.

[ ... ]

> +static void ope_flush_hw(struct ope_dev *ope)
> +{
> +	struct ope_ctx *ctx;
> +
> +	guard(mutex)(&ope->mutex);
> +
> +	/* Drain a handler that may still be reading registers */
> +	synchronize_irq(ope->irq);
> +
> +	scoped_guard(spinlock_irqsave, &ope->sched_lock)
> +		ctx =3D ope->curr_ctx;
> +
> +	if (!ctx)
> +		return;
> +
> +	if (ope_hw_reset_poll(ope))
> +		dev_err(ope->dev, "reset timeout while flushing\n");
> +
> +	scoped_guard(spinlock_irqsave, &ope->sched_lock)
> +		ope->hw_ctx =3D NULL;
> +
> +	ope_glut_cache_invalidate(ope);
> +
> +	ope_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +}

[Severity: Medium]
Does ope_flush_hw() fail unstarted jobs with VB2_BUF_STATE_ERROR during
runtime or system suspend?

ope_runtime_suspend() first calls ope_sched_pause(), which runs
cancel_work_sync(&ope->run_work).  If run_work was pending after
ope_try_schedule() set ope->curr_ctx =3D ctx and ctx->queued =3D true,
cancel_work_sync() cancels it before ope_run_job() starts hardware execution
(ope->hw_running is still false).  Because ope_flush_hw() only checks
ope->curr_ctx, it resets the idle hardware and calls ope_job_finish(ctx,
VB2_BUF_STATE_ERROR), dequeuing and failing the unstarted buffers instead of
clearing ctx->queued and ope->curr_ctx so ope_sched_resume() can reschedule
them on resume.

> +
> +static void ope_sched_cancel(struct ope_ctx *ctx)
> +{
> +	struct ope_dev *ope =3D ctx->ope;
> +	bool running;
> +
> +	ope_sched_pause(ope);
> +
> +	scoped_guard(spinlock_irqsave, &ope->sched_lock) {
> +		running =3D (ope->hw_running && ope->hw_ctx =3D=3D ctx);
> +		ctx->queued =3D false;
> +		if (running)
> +			ope->hw_running =3D false;
> +	}
> +
> +	/* Drain any handler that loaded ctx before hw_running was cleared */
> +	synchronize_irq(ope->irq);
> +
> +	/* If the hardware is running the context, reset it */
> +	if (running) {
> +		if (ope_hw_reset_sync(ope))
> +			dev_err(ope->dev, "reset timeout during cancel\n");
> +
> +		ope_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +	}

[Severity: Medium]
What prevents ope_sched_cancel() from racing with ope_remove() ->
ope_unregister() and accessing unclocked MMIO registers or timing out on
reset_complete?

CPU0                              CPU1
ope_stop_streaming()
  ope_sched_cancel()
    lock(&ope->sched_lock)
    running =3D true
    ope->hw_running =3D false
    unlock(&ope->sched_lock)
                                  ope_remove()
                                    disable_irq(ope->irq)
                                    ope_unregister()
                                      ope_sched_pause(ope)
                                      ope_flush_hw(ope)
                                      pm_runtime_force_suspend(ope->dev)
                                        clk_bulk_disable_unprepare()
    ope_hw_reset_sync(ope)
      ope_write(..., OPE_TOP_RESET_CMD, ...) <-- clocks disabled / IRQ off

Because ope_remove() disables ope->irq and ope_unregister() forces runtime
suspend without serializing against ctx->vbq_lock or an in-flight
ope_sched_cancel(), ope_hw_reset_sync() can write to unclocked registers or
wait for a reset-done interrupt that can no longer fire.

[ ... ]

> +static void ope_adjust_power(struct ope_dev *ope)
> +{
[ ... ]
> +	ret =3D dev_pm_opp_set_rate(ope->dev, pixclk);
> +	if (ret)
> +		dev_warn(ope->dev, "Failed to set OPP rate: %d\n", ret);
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
[ ... ]
> +	ret =3D pm_runtime_resume_and_get(ctx->ope->dev);
> +	if (ret) {
> +		dev_err(ctx->ope->dev, "resume failed (%d)\n", ret);
> +		goto err_pipeline_stop;
> +	}
> +
> +	/* From here on a job is allowed to consume this queue's buffers */
> +	scoped_guard(spinlock_irqsave, &ctx->queues_lock)
> +		ctx->queues[idx].streaming =3D true;
> +
> +	if (idx =3D=3D OPE_QUEUE_FRAME_IN) {
> +		ctx->fmt_in.sequence =3D 0;
> +		ope_adjust_power(ctx->ope);
> +	} else if (idx =3D=3D OPE_QUEUE_DISP_OUT) {
> +		ctx->fmt_out.sequence =3D 0;
> +	}
[ ... ]
> +static void ope_stop_streaming(struct vb2_queue *q)
> +{
[ ... ]
> +	if (idx =3D=3D OPE_QUEUE_FRAME_IN)
> +		ope_adjust_power(ctx->ope);
> +
> +	pm_runtime_put(ctx->ope->dev);

[Severity: Medium]
Does calling ope_adjust_power() after pm_runtime_resume_and_get() and before
pm_runtime_put() leave the core clock enabled without its required cx OPP
vote?

On QCM2290, gcc_camss_ope_clk_src uses clk_rcg2_shared_ops.  When
OPE_QUEUE_FRAME_IN stops streaming in ope_stop_streaming(),
ope_adjust_power() calls dev_pm_opp_set_rate(ope->dev, 0), which drops the
required-opps vote on the cx power domain without lowering the clock rate
while the device is still runtime-active and GCC_CAMSS_OPE_CLK is still
enabled.  Similarly, in ope_start_streaming(), pm_runtime_resume_and_get()
runs ope_runtime_resume(), which enables the clocks at the cached frequency
from the previous session and writes MMIO registers in __ope_irq_init()
before ope_adjust_power() votes for the OPP and icc_config bandwidth (or ev=
en
before OPE_QUEUE_FRAME_IN starts streaming if OPE_QUEUE_DISP_OUT starts
first).

[ ... ]

> +static int ope_g_parm(struct file *file, void *priv, struct v4l2_streamp=
arm *sp)
> +{
> +	struct ope_ctx *ctx =3D ope_ctx_from_file(file);
> +
> +	if (!V4L2_TYPE_IS_OUTPUT(sp->type))
> +		return -EINVAL;
> +
> +	sp->parm.output.capability =3D V4L2_CAP_TIMEPERFRAME;
> +	sp->parm.output.timeperframe =3D ctx->fmt_in.timeperframe;
> +
> +	return 0;
> +}
> +
> +static int ope_s_parm(struct file *file, void *priv, struct v4l2_streamp=
arm *sp)
> +{
> +	struct ope_ctx *ctx =3D ope_ctx_from_file(file);
> +	struct v4l2_fract *tpf =3D &sp->parm.output.timeperframe;
> +
> +	if (!V4L2_TYPE_IS_OUTPUT(sp->type))
> +		return -EINVAL;

[Severity: Low]
Should ope_g_parm() and ope_s_parm() return -ENOTTY instead of -EINVAL when
called on the capture video node?

Both ope_input and ope_disp_output share ope_video_ioctl_ops, so the V4L2
core enables VIDIOC_G_PARM and VIDIOC_S_PARM on ope_disp_output as well.
When userspace calls either ioctl on ope_disp_output with
V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, returning -EINVAL instead of -ENOTTY
violates the V4L2 specification and fails v4l2-compliance.

[ ... ]

> +static void ope_queues_release(struct ope_ctx *ctx, struct v4l2_fh *fh)
> +{
> +	bool owned =3D false;
> +
> +	for (unsigned int i =3D 0; i < OPE_QUEUE_COUNT; i++)
> +		owned |=3D (ctx->queues[i].vq.owner =3D=3D fh);
> +
> +	if (!owned)
> +		return;
> +
> +	ope_sched_cancel(ctx);
> +
> +	for (unsigned int i =3D 0; i < OPE_QUEUE_COUNT; i++) {
> +		struct vb2_queue *vq =3D &ctx->queues[i].vq;
> +
> +		if (vq->owner !=3D fh)
> +			continue;
> +
> +		vb2_queue_release(vq);
> +		vq->owner =3D NULL;
> +	}
> +
> +	ope_sched_resume(ctx->ope);
> +}

[Severity: Medium]
Does closing the ope_params file descriptor while a frame is being processed
abort the active job on ope_input and ope_disp_output?

All three video nodes share ope->shared_ctx, and userspace opens each node =
as
a separate file handle.  In ope_stop_streaming(), stopping OPE_QUEUE_PARAMS
intentionally avoids calling ope_sched_cancel(ctx) because parameters are
consumed by the CPU before a job starts.  However, if the file handle owning
OPE_QUEUE_PARAMS (or a non-streaming queue) is closed, ope_queues_release()
unconditionally calls ope_sched_cancel(ctx), resetting the hardware and
failing the in-flight input and capture buffers with VB2_BUF_STATE_ERROR.
Since vb2_queue_release(vq) already invokes ope_stop_streaming(vq) when a
queue is streaming, the outer ope_sched_cancel() and ope_sched_resume() cal=
ls
here appear unnecessary.

[ ... ]

> +static int ope_v4l2_register(struct ope_dev *ope)
> +{
[ ... ]
> +	ret =3D camss_isp_pipeline_register(ope->pipeline, &ope->v4l2_dev, ope_=
entity_descs,
> +					  ARRAY_SIZE(ope_entity_descs));
> +	if (ret)
> +		goto err_v4l2;
> +
> +	/* Expose the graph to userspace only once every entity and link exists=
 */
> +	ret =3D media_device_register(&ope->mdev);
> +	if (ret)
> +		goto err_pipeline;
> +
> +	ope->pipeline->drv_priv =3D ope;
> +	return 0;
> +
> +err_pipeline:
> +	camss_isp_pipeline_unregister(ope->pipeline);
> +err_v4l2:
> +	/* Rely on the v4l2_device release callback to free @ope */
> +	v4l2_device_unregister(&ope->v4l2_dev);
> +	v4l2_device_put(&ope->v4l2_dev);
> +	return ret;
> +}
> +
> +static void ope_unregister(struct ope_dev *ope)
> +{
> +	struct ope_ctx *ctx;
> +	int ret;
> +
> +	ope_sched_pause(ope);
> +	ope_flush_hw(ope);
> +
> +	ret =3D pm_runtime_force_suspend(ope->dev);
> +	if (ret)
> +		pm_runtime_disable(ope->dev);
> +
> +	if (ope->pipeline)
> +		camss_isp_pipeline_unregister(ope->pipeline);
> +
> +	scoped_guard(mutex, &ope->mutex) {
> +		cpu_latency_qos_update_request(&ope->qos_req, PM_QOS_DEFAULT_VALUE);
> +		v4l2_device_unregister(&ope->v4l2_dev);
> +	}
> +
> +	/* Invalidate the MC graph only once the hardware is marked gone */
> +	media_device_unregister(&ope->mdev);

[Severity: High]
Can tearing down the media pipeline in camss_isp_pipeline_unregister() and
ope_unregister() corrupt pipe->start_count or dereference a NULL
pad->graph_obj.mdev?

In ope_start_streaming(), each streaming video node calls
video_device_pipeline_alloc_start(vdev), which sets pad->pipe on every pad =
in
the connected graph and increments pipe->start_count once per streaming
queue.  During teardown:

drivers/media/platform/qcom/camss/ope/pipeline.c:camss_isp_pipeline_unregis=
ter() {
    ...
	for (i =3D (int)pipeline->num_entities - 1; i >=3D 0; i--) {
		struct camss_isp_pipeline_entity *slot =3D &pipeline->entities[i];

		if (slot->registered) {
			switch (slot->obj_type) {
			case MEDIA_ENTITY_TYPE_VIDEO_DEVICE:
				if (video_device_pipeline(&slot->vdev))
					video_device_pipeline_stop(&slot->vdev);
				video_unregister_device(&slot->vdev);
				break;
			case MEDIA_ENTITY_TYPE_V4L2_SUBDEV:
				v4l2_device_unregister_subdev(&slot->subdev);
				break;
    ...
}

Because pad->pipe is set across the entire graph whenever at least one queue
is streaming, video_device_pipeline(&slot->vdev) is non-NULL on all three
video devices even if only one or two queues started streaming.  At i =3D 4
(ope_disp_output), video_device_pipeline_stop() is called even if only
ope_input (i =3D 0) was streaming; conversely, if two or more queues are
streaming (pipe->start_count >=3D 2), stopping ope_disp_output at i =3D 4 l=
eaves
pipe active while the subdevs at i =3D 3 and i =3D 2 are unregistered with =
their
pads still linked in pipe->pads.

In addition, neither camss_isp_pipeline_unregister() nor ope_stop_streaming=
()
serializes its video_device_pipeline() check and video_device_pipeline_stop=
()
call under ctx->vbq_lock, and media_device_unregister(&ope->mdev) clears
pad->graph_obj.mdev to NULL on all remaining pads while concurrent
ope_start_streaming() or ope_stop_streaming() calls can still enter
media_pipeline_alloc_start() or media_pipeline_stop() and dereference
mdev =3D pad->graph_obj.mdev at mutex_lock(&mdev->graph_mutex).

[ ... ]

> +static int ope_init_power(struct ope_dev *ope)
> +{
[ ... ]
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
[ ... ]
> +static int ope_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D ope_init_power(ope);
> +	if (ret) {
> +		ret =3D dev_err_probe(dev, ret, "Power init failed\n");
> +		goto err_free;
> +	}
> +
> +	ret =3D ope_init_mmio(ope);
> +	if (ret) {
> +		ret =3D dev_err_probe(dev, ret, "MMIO init failed\n");
> +		goto err_free;
> +	}

[Severity: Medium]
Can enabling runtime PM in ope_init_power() cause a NULL pointer dereference
in ope_runtime_resume() or ope_runtime_suspend()?

ope_init_power() calls devm_pm_runtime_enable(dev) before ope_init_mmio()
maps ope->base, ope->base_rd, ope->base_wr, and ope->base_pp, so a runtime
resume triggered via sysfs before ope_init_mmio() completes will dereference
NULL MMIO pointers in ope_runtime_resume() -> __ope_irq_init().  In additio=
n,
if ope_probe() fails after ope_init_power(), the error path clears platform
drvdata to NULL and frees ope before devres disables runtime PM, so a runti=
me
PM callback running during probe unwind will dereference
dev_get_drvdata(dev) =3D=3D NULL.

> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		ret =3D dev_err_probe(dev, irq, "Unable to get IRQ\n");
> +		goto err_free;
> +	}
> +
> +	ope->irq =3D irq;
> +
> +	/* Requested before the first resume, so that ope->irq is always valid =
*/
> +	ret =3D devm_request_irq(dev, ope->irq, ope_irq, IRQF_NO_AUTOEN,
> +			       "camss-ope", ope);
> +	if (ret < 0) {
> +		ret =3D dev_err_probe(dev, ret, "Requesting IRQ failed\n");
> +		goto err_free;
> +	}
> +
> +	ret =3D ope_soft_reset(ope);
> +	if (ret)
> +		goto err_free;
> +
> +	cpu_latency_qos_add_request(&ope->qos_req, PM_QOS_DEFAULT_VALUE);
> +
> +	/* ope ownership is transferred to ope_v4l2_register(), even on failure=
 */
> +	ret =3D ope_v4l2_register(ope);
> +	if (ret) {
> +		platform_set_drvdata(pdev, NULL);
> +		return dev_err_probe(dev, ret, "V4L2 registration failed\n");
> +	}
> +
> +	/* Everything @ope_irq() touches is in place, let interrupts in */
> +	enable_irq(ope->irq);

[Severity: Medium]
Can userspace open and use /dev/videoN before subdevs, media links, and
ope->irq are ready?

In camss_isp_pipeline_register(), video_register_device() publishes
ope_input (index 0) and ope_params (index 1) to userspace before the subdevs
ope_proc (index 2) and ope_disp (index 3) are initialized and before pad
links are created.  Furthermore, ope_probe() only calls enable_irq(ope->irq)
after ope_v4l2_register() returns, so an early opener that starts or cancels
streaming before enable_irq() runs will time out waiting for hardware
interrupts, and if a later step in ope_v4l2_register() fails after ope_open=
()
creates ope->shared_ctx, ope->shared_ctx is not cleaned up on the error pat=
h.

> diff --git a/drivers/media/platform/qcom/camss/ope/pipeline.h b/drivers/m=
edia/platform/qcom/camss/ope/pipeline.h
> new file mode 100644
> index 0000000000000..62e4116012ad0
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/ope/pipeline.h
[ ... ]
> + * Fields used only for MEDIA_ENTITY_TYPE_VIDEO_DEVICE:
> + * @vdev.caps: V4L2_CAP_* device capabilities.
> + *             The video device direction (VFL_DIR_RX/TX/M2M) is derived
> + *             automatically from @caps by the builder.
> + * @vdev.drvdata: Opaque pointer set via video_set_drvdata() after regis=
tration.
> + * @vdev.fops:      File operations (mandatory).
> + * @vdev.ioctl_ops: ioctl operations (may be NULL).
> + * @vdev.entity_ops: Media entity operations (may be NULL).
> + *
> + * Fields used only for MEDIA_ENTITY_TYPE_V4L2_SUBDEV:
> + * @subdev.ops: Subdev operations (mandatory).
> + * @subdev.internal_ops: Internal subdev operations (may be NULL).
> + * @subdev.entity_ops: Media entity operations (may be NULL).
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

[Severity: Low]
The kernel-doc comment for struct camss_isp_entity_desc describes the nested
@vdev.* and @subdev.* fields, but omits @vdev: and @subdev: entries for the
named inner structs themselves, which causes scripts/kernel-doc to warn abo=
ut
undescribed struct members 'vdev' and 'subdev'.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-camss-isp-=
ope-v14-0-49c426cd2715@oss.qualcomm.com?part=3D6
