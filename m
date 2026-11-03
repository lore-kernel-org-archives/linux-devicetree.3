Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738504;
	b=qpixFj1pO4TcsV++qpxpqP8ZPq1w/WqcfVjKvxbsRsUTqRtfR16hPTC1nvvQglHhXQWr
	 rWCBi5oDed9rp6SDypWbSyOKpLOloflJIPRSOUmy6kkOsUyOSbppIF0TYPOBKQD9jZYvE
	 5AUKmskoFlaUcM9LJqgxq60dhg7r1JtHjW4yLq/FPcdV928gsTDsqviywwWnMw+fsCxtA
	 C+v89lLEvN2SaCzxGBUgVT8CzJOCd41RuF3YrFsL7QuaokXUZzX6B9xt9FnAra9v262s9
	 gsGc5aswpmdBUGnLJVzq91s8yilcLKfWhwb+GnNmmZOSTPh2L7kESxvk3HkbCcQNWcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738504;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hUb8TXp5VFK7PqljZAAC+ZlSH0XI3+ZPe6Oj9ESp/A0=;
	b=BBnYUbJAwxBIev/e+ztK1DTh9C/A7nKMZo6DL1xd233Myif+kpeHK7BwZW6r8chgqk7v
	 IldOOdZOdsl6jDxcKw887cJ66Y+lhk21p4s6zOvSymZqm4I5047OhPqLUXd1qIIHF24/M
	 lGyw59/J2nwyN77Jy+FfG4bNBBMvwqnOY2lLKkzME22cOHLozJf66sPL/ZDwJRWPRaX66
	 xKg0QAoWm6rC8mMtSrfVZ2B5giUFuUDnnxF4ba1I4mUO0l8D5PPEnSMBQ2POtV9Jzijna
	 U7sXl5rTMy9TLlQwt50//jQ+SLmBiQDKtk38wbIdQwVFX2nOgv0C+WjZphvt4vVBi/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N3Wn3qm1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A51606A33B
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N3Wn3qm1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974B21F00A18;
	Tue,  3 Nov 2026 20:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793738502;
	bh=hUb8TXp5VFK7PqljZAAC+ZlSH0XI3+ZPe6Oj9ESp/A0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N3Wn3qm1kNX2ctdI/A5k5JbWRxtudlPTRq1v2x0zBfOnrki2c5vSw5wsJx/M1it4o
	 9lUOa4fUWUPh/HtBkszEG9i4AVW0bBoSoKYWTBedwLYhtwEtVN/KoJEgePwtMRG8rk
	 1e7iFsG8KDO5pHhK76aJeVbJv0c3S1lTteJxDRas3NajQgKr9cXGMPLs5ZLrklgXps
	 HZOXfWWqN6iH33U4hTOOKW+aCainMqWFcL2cEcE5Jv5TTQDTJIZKaoRcv+kp8MtPd4
	 u/8tcQdZW/VJ7naikSKlzZqHlF3rUCv75k5ip0JFd+Q0q9DNN6vOSAFCFImlOLDs67
	 ryULmSjxRbOog==
Message-ID: <sashiko-outbox-196002@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 6/9] media: qcom: camss: Add CAMSS Offline
 Processing Engine driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261103-camss-isp-ope-v13-6-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
 <20261103-camss-isp-ope-v13-6-c2cbf15a39b1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 20:41:42 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 17 potential issue=
(s) to consider:
- [High] media: qcom: camss: UAF on qos_req and late enable_irq() in ope_pr=
obe()
- [High] media: qcom: camss: lost edge IRQ race in ope_runtime_resume() and=
 ope_irq()
- [High] media: qcom: camss: premature runtime PM enable in ope_init_power()
- [High] media: qcom: camss: split locks and missing pipeline check in ope_=
s_fmt*()
- [High] media: qcom: camss: NULL sd->v4l2_dev dereference in ope_state_is_=
busy()
- [High] media: qcom: camss: ope: race between reset and __ope_irq() restar=
ts DMA
- [High] media: qcom: camss: race with in-flight IRQ in ope_flush_hw()
- [High] media: qcom: camss: unbalanced pipeline stop and mdev teardown in =
ope_unregister()
- [Medium] media: qcom: camss: unreleased 0 Hz OPP and premature BW drop on=
 stream stop
- [Medium] media: qcom: camss: bogus HW reset on params stop and curr_ctx c=
lear in cancel
- [Medium] media: qcom: camss: broken custom vb2 wrappers in ope_poll() and=
 ope_dqbuf()
- [Medium] media: qcom: camss: V4L2 UAPI compliance bugs in format and parm=
 callbacks
- [Medium] media: qcom: camss: signed shift overflow in DS_RESOLUTION() mac=
ro
- [Medium] media: qcom: camss: unaligned C-plane DMA and stride overflow fo=
r NV24/NV42
- [Medium] media: qcom: camss: missing ope_hw_available() check in ope_open=
()
- [Medium] media: qcom: camss: IRQ masks cleared by ope_hw_reset_poll() in =
probe
- [Medium] media: qcom: camss: ope: race between ope_start_streaming() and =
subdev ioctls
--

commit a215a26601075df33b2e70af9cdd3376479f78c1
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

media: qcom: camss: Add CAMSS Offline Processing Engine driver

This commit adds a V4L2 memory-to-memory ISP driver for the Qualcomm
Offline Processing Engine (OPE), supporting raw Bayer to YUV conversion,
white balance, demosaic, color correction, gamma LUT, chroma enhancement,
and downscaling via stripe-based processing. It also introduces a
declarative media-controller topology builder and V4L2 ISP parameter buffer
validation helpers.

Link: https://github.com/jwrdegoede/libcamera/commits/camss_pipeline_v2.1/
Link: https://github.com/loicpoulain/camss-isp-m2m-test

> diff --git a/drivers/media/platform/qcom/camss/ope/core.c b/drivers/media=
/platform/qcom/camss/ope/core.c
> new file mode 100644
> index 0000000000000..e111fd1b2b1a2
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/ope/core.c

[ ... ]

> +/* Downscaler fixed-point helpers */
> +#define Q21(v)			(((uint64_t)(v)) << 21)
> +#define DS_Q21(n, d)		((uint32_t)div_u64((uint64_t)(n) << 21, (d)))
> +#define DS_RESOLUTION(in, out) \
> +	(((out) * 128 <=3D (in)) ? 0x0 : \
> +	 ((out) * 16  <=3D (in)) ? 0x1 : \
> +	 ((out) * 8   <=3D (in)) ? 0x2 : 0x3)

[ ... ]

> +static void ope_gen_stripe_yuv_dst(struct ope_ctx *ctx, struct ope_strip=
e *stripe,
> +				   dma_addr_t dst, const struct v4l2_rect *compose)
> +{

[ ... ]

> +	/* UV plane (appended to Y plane)*/
> +	c_stride =3D bpl * 2 / fo->fmt->c_hsub;
> +	base =3D dst + bpl * img_h + (compose->top / fo->fmt->c_vsub) * c_strid=
e;

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

[Severity: Medium]
In drivers/media/platform/qcom/camss/ope/core.c, DS_RESOLUTION() evaluates
to signed int literals (0x0, 0x1, 0x2, or 0x3).

When ope_prog_stripe() shifts the result of DS_RESOLUTION() left by 30 bits
for downscale factors greater than 1/16 (such as standard 2:1 chroma
subsampling where DS_RESOLUTION() evaluates to 0x2 or 0x3), does this shift
into the sign bit of a 32-bit signed int and trigger signed integer
overflow undefined behavior?

Would using unsigned constants (0x0U..0x3U) or FIELD_PREP() with GENMASK(31,
30) avoid this?

[ ... ]

> +static void ope_apply_params(struct ope_ctx *ctx)
> +{
> +	struct vb2_v4l2_buffer *vbuf;
> +	int ret;
> +
> +	vbuf =3D ope_queue_remove(ctx, OPE_QUEUE_PARAMS);
> +	if (!vbuf)
> +		return;
> +
> +	ret =3D camss_isp_params_apply(ctx->ope->dev, &vbuf->vb2_buf,
> +				     ctx->params_buf,
> +				     ope_params_type_info,
> +				     ope_params_handlers,
> +				     ARRAY_SIZE(ope_params_handlers),
> +				     ctx);
> +	if (ret)
> +		dev_warn_ratelimited(ctx->ope->dev, "invalid parameters\n");
> +
> +	vb2_buffer_done(&vbuf->vb2_buf, ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STA=
TE_DONE);
> +}

[ ... ]

> +static int ope_hw_reset_poll(struct ope_dev *ope)
> +{
> +	u32 status;
> +	int ret;
> +
> +	guard(mutex)(&ope->reset_mutex);
> +
> +	ope_write(ope, OPE_TOP_IRQ_MASK, OPE_TOP_IRQ_STATUS_RST_DONE);
> +	ope_write(ope, OPE_TOP_RESET_CMD, OPE_TOP_RESET_CMD_SW);
> +
> +	ret =3D read_poll_timeout(ope_read, status,
> +				status & OPE_TOP_IRQ_STATUS_RST_DONE,
> +				OPE_RESET_POLL_US,
> +				OPE_RESET_TIMEOUT_MS * USEC_PER_MSEC, false,
> +				ope, OPE_TOP_IRQ_STATUS);
> +
> +	ope_write(ope, OPE_TOP_IRQ_CLEAR, OPE_TOP_IRQ_STATUS_RST_DONE);
> +	ope_write(ope, OPE_TOP_IRQ_CMD, OPE_TOP_IRQ_CMD_CLEAR);
> +	ope_write(ope, OPE_TOP_IRQ_MASK, 0);
> +
> +	if (ret)
> +		return ret;
> +
> +	ope_glut_cache_invalidate(ope);
> +
> +	return 0;
> +}

[ ... ]

> +static void ope_flush_hw(struct ope_dev *ope)
> +{
> +	struct ope_ctx *ctx;
> +
> +	guard(mutex)(&ope->mutex);
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
> +
> +	/* Drain a handler that may still be reading registers */
> +	synchronize_irq(ope->irq);
> +}

[Severity: High]
As reported by Sashiko on v12 [1], during system suspend,
pm_runtime_force_suspend() disables runtime PM and calls
ope_runtime_suspend() -> ope_flush_hw() without waiting for an in-flight
ope_irq() that already passed pm_runtime_get_if_in_use(ope->dev).

In ope_flush_hw() in drivers/media/platform/qcom/camss/ope/core.c,
synchronize_irq(ope->irq) is only called at the end of the function and is
skipped entirely when ope->curr_ctx is NULL:

  1. If ope->curr_ctx is non-NULL, an in-flight __ope_irq() can run
     concurrently with ope_hw_reset_poll(), either programming stripe
     registers via ope_prog_stripe() during the reset or clearing
     OPE_TOP_IRQ_STATUS_RST_DONE before read_poll_timeout() sees it.

  2. If the in-flight __ope_irq() just completed the last stripe and cleared
     ope->curr_ctx in ope_job_finish(), ope_flush_hw() sees !ctx and
     returns early without calling synchronize_irq(ope->irq), allowing
     ope_runtime_suspend() to call clk_bulk_disable_unprepare() while
     __ope_irq() is still accessing MMIO registers.

Should synchronize_irq(ope->irq) be called at the start of ope_flush_hw()
before checking ope->curr_ctx?

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
> +	}
> +
> +	/* If the hardware is running the context, reset it */
> +	if (running) {
> +		if (ope_hw_reset_sync(ope)) {
> +			dev_err(ope->dev, "reset timeout during cancel\n\");
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
> +
> +		if (ope->hw_ctx =3D=3D ctx) {
> +			ope->hw_ctx =3D NULL;
> +			ope->hw_running =3D false;
> +		}
> +	}
> +}

[Severity: High]
In drivers/media/platform/qcom/camss/ope/core.c, __ope_irq() snapshots ctx
under ope->sched_lock:

	scoped_guard(spinlock, &ope->sched_lock)
		ctx =3D ope->hw_running ? ope->hw_ctx : NULL;

and then releases ope->sched_lock before handling OPE_TOP_IRQ_STATUS_WE
(ope_we_irq() -> ope_prog_stripe()) and OPE_TOP_IRQ_STATUS_IDLE
(ope_start()).

In ope_sched_cancel() (and similarly in ope_flush_hw()), ope->hw_running is
not cleared before issuing the software reset, and synchronize_irq(ope->irq)
is called before the locked block that sets ope->hw_running =3D false.

If __ope_irq() on another CPU has already loaded a non-NULL ctx for a
stripe RUP_DONE or IDLE interrupt just as ope_hw_reset_sync() writes
OPE_TOP_RESET_CMD_SW, can that in-flight __ope_irq() execute
ope_prog_stripe() and ope_start() during or right after the reset,
restarting DMA on buffers that are simultaneously returned to vb2 and
unmapped?

[ ... ]

> +static irqreturn_t ope_irq(int irq, void *dev_id)
> +{
> +	struct ope_dev *ope =3D dev_id;
> +	irqreturn_t ret;
> +
> +	/*
> +	 * Increment the usage counter only to guarantee registers
> +	 * accessibility + ensure that IRQ is expected (job running).
> +	 * A negative return means runtime PM is disabled, i.e. the device is
> +	 * suspending or being unbound, and the registers are not clocked.
> +	 */
> +	if (pm_runtime_get_if_in_use(ope->dev) <=3D 0)
> +		return IRQ_NONE;
> +
> +	ret =3D __ope_irq(ope);
> +
> +	pm_runtime_put(ope->dev);
> +
> +	return ret;
> +}

[ ... ]

> +/* -------- Power scaling -------- */
> +
> +static inline unsigned long ope_pixclk(const struct ope_fmt_state *fs, u=
nsigned int fps)
> +{
> +	return (unsigned long)fs->width * fs->height * fps;
> +}

[ ... ]

> +static void ope_adjust_power(struct ope_dev *ope)
> +{

[ ... ]

> +	opp =3D dev_pm_opp_find_freq_ceil(ope->dev, &pixclk);
> +	if (IS_ERR(opp)) {
> +		unsigned long max_freq =3D ULONG_MAX;
> +
> +		dev_warn(ope->dev, "Requested pixel clock %luHz exceeds hardware limit=
\n", pixclk);
> +
> +		/* Clamp to the highest available OPP */
> +		opp =3D dev_pm_opp_find_freq_floor(ope->dev, &max_freq);
> +		if (!IS_ERR(opp)) {
> +			pixclk =3D max_freq;
> +			dev_pm_opp_put(opp);
> +		}
> +	} else {
> +		dev_pm_opp_put(opp);
> +	}
> +
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
> +	/* From here on a job is allowed to consume this queue's buffers */
> +	scoped_guard(spinlock_irqsave, &ctx->queues_lock)
> +		ctx->queues[idx].streaming =3D true;

[ ... ]

> +static void ope_stop_streaming(struct ope_ctx *ctx_unused_in_sig)
> +{
> +	struct ope_ctx *ctx =3D ope_ctx_from_vq(q);
> +	struct video_device *vdev =3D ope_vdev_from_vq(q);
> +	unsigned int idx =3D ope_idx_from_vq(q);
> +
> +	dev_dbg(ctx->ope->dev, "streaming stop ctx=3D%p queue=3D%u\n", ctx, idx=
);
> +
> +	scoped_guard(spinlock_irqsave, &ctx->queues_lock)
> +		ctx->queues[idx].streaming =3D false;
> +
> +	if (idx =3D=3D OPE_QUEUE_FRAME_IN)
> +		ope_adjust_power(ctx->ope);
> +
> +	/* Drain with the scheduler held off, so no job can pick up a buffer */
> +	ope_sched_cancel(ctx);
> +	ope_queue_drain(ctx, idx, VB2_BUF_STATE_ERROR);
> +	ope_sched_resume(ctx->ope);
> +
> +	pm_runtime_put(ctx->ope->dev);
> +
> +	if (video_device_pipeline(vdev))
> +		video_device_pipeline_stop(vdev);
> +}

[Severity: Medium]
As reported by Sashiko on v12 [2], there are three power scaling issues in
ope_adjust_power(), ope_stop_streaming(), and ope_pixclk() in
drivers/media/platform/qcom/camss/ope/core.c:

  1. When all contexts stop streaming on OPE_QUEUE_FRAME_IN, pixclk is 0,
     but ope_adjust_power() unconditionally calls
     dev_pm_opp_find_freq_ceil(ope->dev, &pixclk). That matches the lowest
     OPP in the table and overwrites pixclk with a non-zero frequency
     before dev_pm_opp_set_rate(ope->dev, pixclk) is called, so
     dev_pm_opp_set_rate(ope->dev, 0) is never called to release the
     required-OPP vote on the cx power domain while idle.

  2. In ope_stop_streaming(), when idx =3D=3D OPE_QUEUE_FRAME_IN,
     ope_adjust_power(ctx->ope) is called before ope_sched_cancel(ctx),
     dropping icc_data and icc_config bandwidth votes to 0 while an
     in-flight job may still be performing DMA and before
     ope_hw_reset_sync() accesses registers to reset the hardware.

  3. In ope_pixclk(), (unsigned long)fs->width * fs->height * fps can reach
     5376 * 8192 * 1000 =3D 44,040,192,000, which overflows a 32-bit unsign=
ed
     long on 32-bit COMPILE_TEST builds.

Could ope_stop_streaming() call ope_adjust_power() after
ope_sched_cancel(), and could ope_adjust_power() skip
dev_pm_opp_find_freq_ceil() when pixclk is 0?

[Severity: Medium]
As reported by Sashiko on v12 [3], there are also three queue and context
state issues across ope_stop_streaming(), ope_apply_params(), and
ope_sched_cancel() in drivers/media/platform/qcom/camss/ope/core.c:

  1. In ope_stop_streaming() (and ope_queues_release()), stopping or
     releasing OPE_QUEUE_PARAMS unconditionally calls ope_sched_cancel(ctx).
     Because parameter buffers are copied by the CPU in ope_apply_params()
     before ope->hw_running is set and are never used by hardware DMA,
     does stopping ope_params unnecessarily reset the hardware and abort
     in-flight video frames with VB2_BUF_STATE_ERROR?

  2. In ope_apply_params(), ope_queue_remove(ctx, OPE_QUEUE_PARAMS)
     dequeues and completes parameter buffers without checking
     ctx->queues[OPE_QUEUE_PARAMS].streaming. If VIDIOC_STREAMON is called
     on ope_params while video streaming is already active,
     vb2_start_streaming() queues pre-queued buffers via ope_buf_queue()
     before calling ope_start_streaming(), allowing a concurrent
     ope_run_job() to complete a parameter buffer before OPE_QUEUE_PARAMS
     is marked streaming.

  3. At the end of ope_sched_cancel(), the cleanup block checks
     if (ope->curr_ctx) instead of if (ope->curr_ctx =3D=3D ctx), clearing
     ope->curr_ctx->queued and ope->curr_ctx even if another context owns
     ope->curr_ctx.

Should ope_apply_params() check ctx->queues[OPE_QUEUE_PARAMS].streaming,
ope_stop_streaming() avoid cancelling in-flight hardware jobs when idx =3D=
=3D
OPE_QUEUE_PARAMS, and ope_sched_cancel() check ope->curr_ctx =3D=3D ctx?

[ ... ]

> +static int ope_init_vq(struct ope_ctx *ctx, unsigned int idx)
> +{

[ ... ]

> +	q->drv_priv =3D qpriv;
> +	q->ops =3D &ope_vb2_ops;
> +	q->lock =3D &ctx->vbq_lock;

[ ... ]

> +	/* Only valid because there is a single device-wide ope_ctx for now */
> +	qpriv->vdev->queue =3D q;
> +
> +	return 0;
> +}

[ ... ]

> +static const struct ope_fmt *ope_fmt_try(struct ope_dev *ope, bool is_ou=
tput,
> +					 struct v4l2_pix_format_mplane *pix)
> +{

[ ... ]

> +	/* Chroma-subsampled output formats need an even height */
> +	halign =3D (is_output && fmt->c_vsub =3D=3D 2) ? 1 : 0;
> +
> +	v4l_bound_align_image(&pix->width,  OPE_MIN_W, max_w, fmt->align,
> +			      &pix->height, OPE_MIN_H, max_h, halign, 0);

[ ... ]

> +	/* The WE requires the C plane base address to be 16-byte aligned.
> +	 * c_base =3D bpl * img_h + (compose_top / c_vsub) * c_stride where
> +	 * c_stride =3D bpl * 2 / c_hsub.  To guarantee alignment for any
> +	 * compose_top, bpl must be a multiple of 16 / c_hsub:
> +	 *   NV12/NV16 (c_hsub=3D2): bpl must be multiple of 8... but c_stride=
=3Dbpl
> +	 *   so we need bpl % 16 =3D=3D 0.
> +	 *   NV24/NV42 (c_hsub=3D1): c_stride=3Dbpl*2, need bpl*2 % 16 =3D=3D 0,
> +	 *   so bpl must be a multiple of 8.
> +	 *   GREY: no C plane, no constraint.
> +	 */
> +	if (is_output && fmt->fourcc !=3D V4L2_PIX_FMT_GREY)
> +		align =3D 8 * fmt->c_hsub;
> +	else
> +		align =3D 1;
> +
> +	bytesperline =3D min(bytesperline, ALIGN_DOWN(OPE_MAX_STRIDE, align));
> +	bytesperline =3D ALIGN(bytesperline, align);

[Severity: Medium]
As reported by Sashiko on v12 [4], in ope_fmt_try() and
ope_gen_stripe_yuv_dst() in drivers/media/platform/qcom/camss/ope/core.c,
for V4L2_PIX_FMT_NV24 and V4L2_PIX_FMT_NV42 (where c_hsub =3D=3D 1 and
c_vsub =3D=3D 1):

  1. ope_fmt_try() sets align =3D 8 * fmt->c_hsub =3D 8 and halign =3D 0,
     allowing bytesperline to be an odd multiple of 8 (such as 24) and
     pix->height to be odd (such as 17). In ope_gen_stripe_yuv_dst(), the
     UV plane base address dst + bpl * img_h + (compose->top / c_vsub) *
     c_stride will then only be 8-byte aligned, violating the Write Engine
     16-byte alignment requirement.

  2. ope_fmt_try() clamps bytesperline to ALIGN_DOWN(OPE_MAX_STRIDE, align)
     (65528), but ope_gen_stripe_yuv_dst() computes c_stride =3D bpl * 2 /
     fo->fmt->c_hsub =3D bpl * 2 for NV24/NV42, overflowing the 16-bit
     OPE_MAX_STRIDE limit whenever bytesperline > 32767.

Should ope_fmt_try() align bytesperline to 16 bytes for all semi-planar YUV
output formats and cap bytesperline so that c_stride =3D bpl * 2 /
fmt->c_hsub does not exceed OPE_MAX_STRIDE?

[ ... ]

> +static int ope_s_fmt_vid_out(struct file *file, void *priv, struct v4l2_=
format *f)
> +{
> +	struct ope_ctx *ctx =3D ope_ctx_from_file(file);
> +	const struct ope_fmt *fmt;
> +
> +	if (vb2_is_busy(&ctx->queues[OPE_QUEUE_FRAME_IN].vq))
> +		return -EBUSY;
> +
> +	fmt =3D ope_fmt_try(ctx->ope, false, &f->fmt.pix_mp);
> +	ctx->fmt_in.fmt		    =3D fmt;
> +	ctx->fmt_in.width	    =3D f->fmt.pix_mp.width;
> +	ctx->fmt_in.height	    =3D f->fmt.pix_mp.height;
> +	ctx->fmt_in.bytesperline    =3D f->fmt.pix_mp.plane_fmt[0].bytesperline;
> +	ctx->fmt_in.sizeimage	    =3D f->fmt.pix_mp.plane_fmt[0].sizeimage;

[ ... ]

> +static int ope_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_=
format *f)
> +{
> +	struct ope_ctx *ctx =3D ope_ctx_from_file(file);
> +	const struct ope_fmt *fmt;
> +
> +	if (vb2_is_busy(&ctx->queues[OPE_QUEUE_DISP_OUT].vq))
> +		return -EBUSY;
> +
> +	fmt =3D ope_fmt_try(ctx->ope, true, &f->fmt.pix_mp);
> +
> +	ctx->fmt_out.fmt	    =3D fmt;
> +	ctx->fmt_out.width	    =3D f->fmt.pix_mp.width;
> +	ctx->fmt_out.height	    =3D f->fmt.pix_mp.height;
> +	ctx->fmt_out.bytesperline   =3D f->fmt.pix_mp.plane_fmt[0].bytesperline;
> +	ctx->fmt_out.sizeimage	    =3D f->fmt.pix_mp.plane_fmt[0].sizeimage;
> +	ctx->fmt_out.colorspace	    =3D f->fmt.pix_mp.colorspace;
> +	ctx->fmt_out.xfer_func	    =3D f->fmt.pix_mp.xfer_func;
> +	ctx->fmt_out.ycbcr_enc	    =3D f->fmt.pix_mp.ycbcr_enc;
> +	ctx->fmt_out.quantization   =3D f->fmt.pix_mp.quantization;
> +
> +	return 0;
> +}
> +
> +static int ope_g_fmt_meta(struct file *file, void *priv, struct v4l2_for=
mat *f)
> +{
> +	f->fmt.meta.dataformat =3D V4L2_META_FMT_QCOM_ISP_PARAMS;
> +	f->fmt.meta.buffersize =3D v4l2_isp_buffer_size(CAMSS_PARAMS_OPE_MAX_PA=
YLOAD);
> +
> +	return 0;
> +}
> +
> +static int ope_enum_fmt_meta_out(struct file *file, void *priv, struct v=
4l2_fmtdesc *f)
> +{
> +	if (f->index > 0)
> +		return -EINVAL;
> +
> +	f->pixelformat =3D V4L2_META_FMT_QCOM_ISP_PARAMS;
> +
> +	return 0;
> +}
> +
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
> +
> +	if (vb2_is_busy(&ctx->queues[OPE_QUEUE_FRAME_IN].vq))
> +		return -EBUSY;

[Severity: High]
As reported by Sashiko on v12 [5], in isp_register_vdev() in
drivers/media/platform/qcom/camss/ope/pipeline.c, vdev->lock is set to
&pipeline->vdev_lock, whereas ope_init_vq() in
drivers/media/platform/qcom/camss/ope/core.c sets q->lock =3D &ctx->vbq_lock
and assigns qpriv->vdev->queue =3D q.

Because v4l2_ioctl_get_lock() uses vdev->queue->lock (&ctx->vbq_lock) for
INFO_FL_QUEUE ioctls (REQBUFS, CREATE_BUFS, PREPARE_BUF, QBUF, STREAMON)
and vdev->lock (&pipeline->vdev_lock) for non-queue ioctls (S_FMT, G_FMT,
S_PARM, G_PARM), ope_s_fmt_vid_out(), ope_s_fmt_vid_cap(), and ope_s_parm()
check vb2_is_busy() and mutate ctx->fmt_in, ctx->fmt_out, and
ctx->framerate without holding ctx->vbq_lock. Can a concurrent S_FMT race
with REQBUFS/QBUF/STREAMON and update ctx->fmt_in or ctx->fmt_out to a
larger frame size after smaller buffers have been allocated and queued,
causing ope_gen_stripes() to program out-of-bounds DMA transfers?

Furthermore, ope_s_fmt_vid_out() and ope_s_fmt_vid_cap() only check
vb2_is_busy() on their own queue rather than checking whether the media
pipeline is already active (e.g. via video_device_pipeline(vdev)). Since
video_device_pipeline_alloc_start() only validates media links when
pipe->start_count =3D=3D 0, if userspace starts streaming on ope_params or
ope_input first and then calls VIDIOC_S_FMT on ope_disp_output before
starting streaming on ope_disp_output, won't that bypass media link
validation?

> +
> +	if (!tpf->denominator)
> +		tpf->denominator =3D 1;
> +	if (!tpf->numerator)
> +		tpf->numerator =3D 1;
> +
> +	ctx->framerate =3D clamp(tpf->denominator / tpf->numerator, 1U, (u32)OP=
E_MAX_FRAMERATE);
> +	tpf->numerator =3D 1;
> +	tpf->denominator =3D ctx->framerate;
> +
> +	ctx->fmt_in.timeperframe =3D *tpf;
> +	sp->parm.output.capability =3D V4L2_CAP_TIMEPERFRAME;
> +
> +	return 0;
> +}
> +
> +static int ope_enum_framesizes(struct file *file, void *priv, struct v4l=
2_frmsizeenum *fsize)
> +{
> +	unsigned int idx =3D ope_queue_idx_from_file(file);
> +	const struct ope_fmt *fmts;
> +	unsigned int n;
> +
> +	if (idx =3D=3D OPE_QUEUE_FRAME_IN) {
> +		fmts =3D ope_input_fmts;
> +		n =3D ARRAY_SIZE(ope_input_fmts);
> +	} else {
> +		fmts =3D ope_output_fmts;
> +		n =3D ARRAY_SIZE(ope_output_fmts);
> +	}
> +
> +	if (fsize->index > 0 || !ope_find_fmt(fmts, n, fsize->pixel_format))
> +		return -EINVAL;
> +
> +	fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> +	fsize->stepwise.min_width =3D OPE_MIN_W;
> +	fsize->stepwise.max_width =3D OPE_MAX_W;
> +	fsize->stepwise.step_width =3D 1;
> +	fsize->stepwise.min_height =3D OPE_MIN_H;
> +	fsize->stepwise.max_height =3D OPE_MAX_H;
> +	fsize->stepwise.step_height =3D 1;
> +
> +	return 0;
> +}

[Severity: Medium]
There are a few V4L2 UAPI compliance issues in these format and streamparm
callbacks in drivers/media/platform/qcom/camss/ope/core.c:

  1. ope_enum_framesizes() reports step_width =3D 1 and step_height =3D 1 f=
or
     all formats, whereas ope_fmt_try() aligns width to 1 << fmt->align (4
     for 10-bit packed Bayer input formats, 2 for NV12/NV21/NV16/NV61
     output formats) and aligns height to 2 when c_vsub =3D=3D 2.

  2. ope_video_ioctl_ops is shared between ope_input and ope_disp_output.
     When VIDIOC_G_PARM or VIDIOC_S_PARM is called on the capture node
     ope_disp_output, ope_g_parm() and ope_s_parm() return -EINVAL instead
     of -ENOTTY (and ope_s_parm() returns -EBUSY when buffers are allocated=
).

  3. isp_register_vdev() sets V4L2_CAP_IO_MC on ope_params, but
     ope_enum_fmt_meta_out() does not reject unsupported non-zero
     f->mbus_code values (other than MEDIA_BUS_FMT_FIXED).

  4. isp_register_subdev() sets V4L2_SUBDEV_FL_HAS_DEVNODE on ope_disp,
     which implements .get_fmt and .set_fmt in ope_disp_pad_ops, but omits
     .enum_mbus_code.

Should these callbacks be updated to match the V4L2 and MC specifications?

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

> +static int ope_create_bufs(struct file *file, void *priv, struct v4l2_cr=
eate_buffers *create)
> +{
> +	struct ope_ctx *ctx =3D ope_ctx_from_file(file);
> +	struct vb2_queue *vq =3D ope_vq_from_file(file, ctx);
> +	int ret;
> +
> +	if (!vq)
> +		return -EINVAL;
> +	if (vb2_queue_is_busy(vq, file))
> +		return -EBUSY;
> +	ret =3D vb2_create_bufs(vq, create);
> +	if (!ret && create->count)
> +		vq->owner =3D file->private_data;
> +
> +	return ret;
> +}

[ ... ]

> +/* True as soon as any of the context's video nodes is streaming */
> +static bool ope_ctx_is_streaming(struct ope_ctx *ctx)
> +{
> +	guard(spinlock_irqsave)(&ctx->queues_lock);
> +
> +	for (unsigned int i =3D 0; i < OPE_QUEUE_COUNT; i++)
> +		if (ctx->queues[i].streaming)
> +			return true;
> +
> +	return false;
> +}
> +
> +static bool ope_state_is_busy(struct v4l2_subdev *sd, struct v4l2_subdev=
_state *state)
> +{
> +	struct ope_dev *ope =3D container_of(sd->v4l2_dev, struct ope_dev, v4l2=
_dev);
> +	struct ope_ctx *ctx;
> +	bool busy =3D false;
> +
> +	if (state !=3D sd->active_state)
> +		return false;
> +
> +	scoped_guard(spinlock, &ope->ctx_lock)
> +		list_for_each_entry(ctx, &ope->ctx_list, list)
> +			busy |=3D ope_ctx_is_streaming(ctx);
> +
> +	return busy;
> +}

[Severity: Medium]
In ope_start_streaming() in drivers/media/platform/qcom/camss/ope/core.c,
video_device_pipeline_alloc_start(vdev) validates the media pipeline links
and sets pipe->start_count =3D 1 before pm_runtime_resume_and_get() runs and
before ctx->queues[idx].streaming is set to true.

Because VIDIOC_SUBDEV_S_FMT and VIDIOC_SUBDEV_S_SELECTION on ope_proc and
ope_disp only lock the subdev active_state and check ope_state_is_busy()
(which only inspects ctx->queues[i].streaming), if a subdev format or
selection ioctl runs during the window between
video_device_pipeline_alloc_start() and setting
ctx->queues[idx].streaming =3D true, won't ope_state_is_busy() return false
and allow modifying the active subdev state after link validation has
already succeeded?

[ ... ]

> +static int ope_input_link_validate(struct media_link *link)
> +{
> +	struct v4l2_subdev *sd =3D media_entity_to_v4l2_subdev(link->sink->enti=
ty);
> +	struct ope_dev *ope =3D container_of(sd->v4l2_dev, struct ope_dev, v4l2=
_dev);
> +	struct ope_ctx *ctx =3D ope->shared_ctx;

[Severity: High]
In drivers/media/platform/qcom/camss/ope/core.c, both ope_state_is_busy()
and ope_input_link_validate() derive ope via:

	struct ope_dev *ope =3D container_of(sd->v4l2_dev, struct ope_dev, v4l2_de=
v);

During driver unbind, ope_unregister() -> camss_isp_pipeline_unregister()
calls v4l2_device_unregister_subdev(&slot->subdev), which sets
sd->v4l2_dev =3D NULL before unregistering the media entity and subdev
devnode (and without holding the subdev active_state lock or waiting for
in-flight subdev_do_ioctl_lock() calls). Moreover,
camss_isp_pipeline_unregister() unregisters OPE_ENTITY_PROC before
OPE_ENTITY_FRAME_IN.

If a concurrent VIDIOC_SUBDEV_S_FMT or VIDIOC_SUBDEV_S_SELECTION on
ope_proc/ope_disp reaches ope_state_is_busy(), or a concurrent
VIDIOC_STREAMON on ope_input reaches ope_input_link_validate() after
sd->v4l2_dev is cleared to NULL, will container_of(sd->v4l2_dev, ...)
compute an invalid pointer and cause a NULL pointer dereference when
accessing ope->ctx_lock or ope->shared_ctx?

[ ... ]

> +static int ope_open(struct file *file)
> +{
> +	struct video_device *vdev =3D video_devdata(file);
> +	struct ope_dev *ope =3D container_of(vdev->v4l2_dev, struct ope_dev, v4=
l2_dev);
> +	struct v4l2_fh *fh;
> +	int ret =3D 0;
> +
> +	fh =3D kzalloc_obj(*fh);
> +	if (!fh)
> +		return -ENOMEM;
> +
> +	if (mutex_lock_interruptible(&ope->mutex)) {
> +		kfree(fh);
> +		return -ERESTARTSYS;
> +	}
> +
> +	v4l2_fh_init(fh, vdev);
> +	v4l2_fh_add(fh, file);
> +
> +	/*
> +	 * For now, only a single shared context is supported,
> +	 * until media multi-context support is available.
> +	 */
> +	if (!ope->shared_ctx) {
> +		struct ope_ctx *ctx =3D ope_ctx_create(ope);

[Severity: Medium]
In ope_open() in drivers/media/platform/qcom/camss/ope/core.c, if a
process passes the video_is_registered(vdev) check in v4l2_open() and
blocks on mutex_lock_interruptible(&ope->mutex) while ope_unregister() runs
on another CPU, ope_unregister() will unregister the video devices and call
v4l2_device_unregister(&ope->v4l2_dev) under ope->mutex.

When ope_open() then acquires ope->mutex, it does not check
ope_hw_available(ope) before calling ope_ctx_create(ope). Can this allocate
a new ope_ctx and attach vb2 queues to already-unregistered video devices?

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
> +	if (!vb2_is_streaming(vq) || vq->error) {
> +		rc |=3D EPOLLERR;
> +	} else if (!list_empty(&vq->done_list)) {
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
As reported by Sashiko on v12 [6], since ope_init_vq() sets
qpriv->vdev->queue =3D q, the custom vb2 wrappers in
drivers/media/platform/qcom/camss/ope/core.c diverge from the standard
vb2_fop_* and vb2_ioctl_* helpers in three places:

  1. ope_poll() directly accesses private vb2_queue fields (vq->done_wq,
     vq->done_lock, vq->done_list, vq->error) without holding the queue
     lock and returns EPOLLERR whenever !vb2_is_streaming(vq), even when
     userspace is only polling for V4L2 events (EPOLLPRI).

  2. ope_dqbuf() omits the vb2_queue_is_busy(vq, file) check, allowing any
     open file descriptor to dequeue buffers from a queue owned by another
     file handle.

  3. ope_create_bufs() checks vb2_queue_is_busy(vq, file) before calling
     vb2_create_bufs(), rejecting create->count =3D=3D 0 queries with -EBUS=
Y.

Could the driver use the standard vb2_fop_poll, vb2_fop_mmap, and
vb2_ioctl_* helpers (or vb2_poll() and consistent ownership checks)?

[ ... ]

> +	[OPE_ENTITY_PROC] =3D {
> +		.name       =3D "ope_proc",
> +		.obj_type   =3D MEDIA_ENTITY_TYPE_V4L2_SUBDEV,
> +		.function   =3D MEDIA_ENT_F_PROC_VIDEO_ISP,
> +		.subdev.ops =3D &ope_proc_ops,
> +		.subdev.internal_ops =3D &ope_proc_internal_ops,
> +		.subdev.entity_ops   =3D &ope_proc_entity_ops,
> +		.pads =3D (const struct camss_isp_pad_desc[]) {
> +			{ MEDIA_PAD_FL_SINK,   OPE_ENTITY_FRAME_IN, 0, 0 },
> +			{ MEDIA_PAD_FL_SINK,   OPE_ENTITY_PARAMS, 0, 0 },
> +			{ MEDIA_PAD_FL_SOURCE, OPE_ENTITY_DISP, OPE_DISP_PAD_SINK,
> +			  MEDIA_LNK_FL_ENABLED },
> +			{ }
> +		},
> +	},

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
> +	media_device_unregister(&ope->mdev);
> +
> +	scoped_guard(mutex, &ope->mutex) {
> +		cpu_latency_qos_remove_request(&ope->qos_req);
> +		v4l2_device_unregister(&ope->v4l2_dev);
> +	}

[Severity: High]
As reported by Sashiko on v12 [7], there are media pipeline lifecycle and
link flag issues in camss_isp_pipeline_unregister() in
drivers/media/platform/qcom/camss/ope/pipeline.c and ope_unregister(),
ope_start_streaming(), ope_stop_streaming(), and ope_entity_descs[] in
drivers/media/platform/qcom/camss/ope/core.c:

  1. When any video device calls video_device_pipeline_alloc_start(),
     pad->pipe is set on all pads in the connected graph, so
     video_device_pipeline(&slot->vdev) is non-NULL for all three video
     devices even if only one queue started streaming. In
     camss_isp_pipeline_unregister(), the reverse loop calls
     video_device_pipeline_stop(&slot->vdev) on every video device where
     video_device_pipeline(&slot->vdev) is non-NULL, which underflows
     pipe->start_count when non-streaming video devices are visited and
     also unregisters the subdevs at indices 3 and 2 before stopping the
     video devices at indices 1 and 0.

  2. In ope_unregister(), camss_isp_pipeline_unregister(ope->pipeline) and
     media_device_unregister(&ope->mdev) (which zeroes pad->graph_obj.mdev
     on all pads) run before v4l2_device_unregister(&ope->v4l2_dev) clears
     ope->v4l2_dev.dev and without serializing against ctx->vbq_lock. Can a
     concurrent ope_start_streaming() or ope_stop_streaming() dereference a
     NULL pad->graph_obj.mdev inside media_pipeline_alloc_start() or
     media_pipeline_stop()?

  3. In ope_entity_descs[], the link from OPE_ENTITY_PROC pad 2 to
     OPE_ENTITY_DISP pad 0 sets link_flags =3D MEDIA_LNK_FL_ENABLED without
     MEDIA_LNK_FL_IMMUTABLE, and no pads set MEDIA_PAD_FL_MUST_CONNECT. If
     userspace disables that link via MEDIA_IOC_SETUP_LINK before
     VIDIOC_STREAMON, won't media_pipeline_start() skip validating the
     ope_proc -> ope_disp -> ope_disp_output path while ope_run_job() still
     unconditionally uses the display write engines?

[ ... ]

> +static int ope_soft_reset(struct ope_dev *ope)
> +{
> +	u32 version;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(ope->dev);
> +	if (ret)
> +		return dev_err_probe(ope->dev, ret, "resume failed\n");
> +
> +	version =3D ope_read(ope, OPE_TOP_HW_VERSION);
> +	ope->hw_version =3D version;
> +	dev_dbg(ope->dev, "HW version %u.%u.%u\n",
> +		OPE_HW_VERSION_GEN(version),
> +		OPE_HW_VERSION_REV(version),
> +		OPE_HW_VERSION_STEP(version));
> +
> +	ope_dump_pipeline(ope);
> +
> +	ret =3D ope_hw_reset_poll(ope);
> +	if (ret)
> +		dev_err(ope->dev, "Reset timeout\n");
> +
> +	pm_runtime_put_sync(ope->dev);
> +
> +	return ret;
> +}

[Severity: Medium]
In ope_soft_reset() in drivers/media/platform/qcom/camss/ope/core.c,
pm_runtime_resume_and_get() invokes ope_runtime_resume(), which initializes
the interrupt masks via __ope_irq_init(ope). Immediately afterward,
ope_soft_reset() calls ope_hw_reset_poll(ope), which resets the hardware and
writes 0 to OPE_TOP_IRQ_MASK without calling __ope_irq_init(ope) again.

If the device does not actually runtime-suspend on pm_runtime_put_sync()
(for instance if runtime PM is kept active via sysfs power/control),
subsequent pm_runtime_resume_and_get() calls in ope_start_streaming() will
not invoke ope_runtime_resume(). Won't all OPE interrupts remain masked in
that case, causing jobs to hang?

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
> +
> +	ret =3D ope_soft_reset(ope);
> +	if (ret)
> +		goto err_free;
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		ret =3D dev_err_probe(dev, irq, "Unable to get IRQ\n");
> +		goto err_free;
> +	}
> +
> +	ope->irq =3D irq;
> +
> +	ret =3D devm_request_irq(dev, ope->irq, ope_irq, IRQF_NO_AUTOEN,
> +			       "camss-ope", ope);
> +	if (ret < 0) {
> +		ret =3D dev_err_probe(dev, ret, "Requesting IRQ failed\n");
> +		goto err_free;
> +	}

[Severity: High]
As reported by Sashiko on v12 [8], in ope_probe() in
drivers/media/platform/qcom/camss/ope/core.c, ope_init_power() calls
devm_pm_runtime_enable(dev) before ope_init_mmio() maps ope->base,
ope->base_rd, ope->base_wr, and ope->base_pp.

If a runtime resume is triggered after devm_pm_runtime_enable(dev) before
ope_init_mmio() finishes, ope_runtime_resume() -> __ope_irq_init(ope) will
dereference NULL MMIO pointers. In addition, if ope_probe() fails at any
step after ope_init_power(), err_free clears drvdata to NULL and frees ope
while runtime PM remains enabled until devres teardown runs after
ope_probe() returns.

Should runtime PM be enabled only after ope_init_mmio() succeeds, and
disabled before freeing ope on probe failure paths?

> +
> +	cpu_latency_qos_add_request(&ope->qos_req, PM_QOS_DEFAULT_VALUE);
> +
> +	/* ope ownership is transferred to ope_v4l2_register(), even on failure=
 */
> +	ret =3D ope_v4l2_register(ope);
> +	if (ret) {
> +		cpu_latency_qos_remove_request(&ope->qos_req);
> +		platform_set_drvdata(pdev, NULL);
> +		return dev_err_probe(dev, ret, "V4L2 registration failed\n");
> +	}
> +
> +	/* Everything @ope_irq() touches is in place, let interrupts in */
> +	enable_irq(ope->irq);

[Severity: High]
As reported by Sashiko on v12 [9], in ope_probe() in
drivers/media/platform/qcom/camss/ope/core.c,
cpu_latency_qos_add_request(&ope->qos_req, PM_QOS_DEFAULT_VALUE) registers
&ope->qos_req before calling ope_v4l2_register(ope).

Every failure path inside ope_v4l2_register() invokes
ope_v4l2_dev_release(&ope->v4l2_dev), which calls kfree(ope). When
ope_v4l2_register(ope) returns an error to ope_probe(), doesn't
cpu_latency_qos_remove_request(&ope->qos_req) access the already-freed ope
structure?

Additionally, enable_irq(ope->irq) is called after ope_v4l2_register(ope)
has already published the video, subdev, and media device nodes to
userspace. Should enable_irq(ope->irq) be called before
ope_v4l2_register(ope), and cpu_latency_qos_remove_request(&ope->qos_req)
be handled before kfree(ope)?

[ ... ]

> +static int ope_runtime_resume(struct device *dev)
> +{
> +	struct ope_dev *ope =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D clk_bulk_prepare_enable(ope->nclks, ope->clks);
> +	if (ret)
> +		return ret;
> +
> +	__ope_irq_init(ope);
> +
> +	/*
> +	 * Let the contexts that are still streaming pick up a new job. The job
> +	 * is started from a work item, which may run before runtime PM reports
> +	 * the device active again, i.e. while ope_irq() still drops interrupts.
> +	 * Programming a job takes long enough for that window to be closed by
> +	 * the time the hardware can raise one.
> +	 */
> +	ope_sched_resume(ope);
> +
> +	return 0;
> +}

[Severity: High]
In ope_runtime_resume() in drivers/media/platform/qcom/camss/ope/core.c,
ope_sched_resume(ope) is called inside the .runtime_resume callback while
dev->power.runtime_status is still RPM_RESUMING (and while
dev->power.disable_depth > 0 during system resume in
pm_runtime_force_resume(), which only re-enables runtime PM after the
callback returns).

If the thread running ope_runtime_resume() is preempted after
ope_sched_resume(ope) schedules ope->run_work, ope_run_work() on another CPU
can program the first stripe and write GO_CMD via ope_start(ope). The
hardware then immediately latches the double-buffered registers and raises
its edge-triggered interrupt (such as RUP_DONE).

If ope_irq() runs before rpm_resume() sets runtime_status to RPM_ACTIVE (or
before pm_runtime_force_resume() calls pm_runtime_enable()),
pm_runtime_get_if_in_use(ope->dev) in ope_irq() returns 0 or -EINVAL, so
ope_irq() returns IRQ_NONE without reading or clearing OPE_TOP_IRQ_STATUS.
Won't leaving OPE_TOP_IRQ_STATUS asserted on an edge-triggered interrupt
line prevent any further rising edges and permanently wedge the pipeline?

[1] https://lore.kernel.org/r/20261102-camss-isp-ope-v12-6-702254689feb@oss=
.qualcomm.com
[2] https://lore.kernel.org/r/20261102-camss-isp-ope-v12-6-702254689feb@oss=
.qualcomm.com
[3] https://lore.kernel.org/r/20261102-camss-isp-ope-v12-6-702254689feb@oss=
.qualcomm.com
[4] https://lore.kernel.org/r/20261102-camss-isp-ope-v12-6-702254689feb@oss=
.qualcomm.com
[5] https://lore.kernel.org/r/20261102-camss-isp-ope-v12-6-702254689feb@oss=
.qualcomm.com
[6] https://lore.kernel.org/r/20261102-camss-isp-ope-v12-6-702254689feb@oss=
.qualcomm.com
[7] https://lore.kernel.org/r/20261102-camss-isp-ope-v12-6-702254689feb@oss=
.qualcomm.com
[8] https://lore.kernel.org/r/20261102-camss-isp-ope-v12-6-702254689feb@oss=
.qualcomm.com
[9] https://lore.kernel.org/r/20261102-camss-isp-ope-v12-6-702254689feb@oss=
.qualcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-camss-isp-=
ope-v13-0-c2cbf15a39b1@oss.qualcomm.com?part=3D6
