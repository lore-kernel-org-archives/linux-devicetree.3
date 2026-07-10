Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED7529E11A
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675499; cv=none; b=ibLjqcYBLm0wNECs9rjKMwcP0YXeAHFNjICs0jsfB1zQCBTz5T9fCqsOyu305+EKiRt0X2pskUr18SY/Pv+10vTwaoDz/tcMubXisRH/EeOUyZYzrOdpTn72dc1j/Qf963U0w3Ua7GnONvvK8UCouyYC47C8Chg+hLjNpmTanos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675499; c=relaxed/simple;
	bh=yQiy5ikRqoWyFbvyrf26cS+spm6uOlxKPsrw4GgXruo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MA86qydp1KIxWD+4bctIZdSnIb2T5HEJE+6TgSaAy9LyVtXOx8AVmodHX8veM+wCQAEkZcVWPViQvIxodmLiSIPDAem9r7fDiCFauG2qpABZLbZcHNOQw9Jcs/HQMaa9QU5ipow8km+fK+y76lAjyI8JXsPiW6+BiMvnuMZOHow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9zKPuqQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9zKPuqQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A4E1F000E9;
	Fri, 10 Jul 2026 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783675497;
	bh=1c/kAMbeVAp5pOXJWMosfXkrH+zW0brXJVq4utI0x/M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A9zKPuqQM8pm0wDdtj+5znj/v9Nax/vf4WVK3nhor4Hd+0afDh+n/lpX+g1BcSKK/
	 0k6i3ivwp/cn12QieSS43EouYp0BVOn9UxkMtYd948PyaRGC/IBoR6QCTRW7dEp/Bf
	 r5w4D3cyIa7pYYCIqVRvGQ2QGN5R3rC85oTbYl5mwHnSkIfxfBvR+q/QOI2w1bQyyh
	 Lw5CEFpNDuHh2amSm7LV6bmOYhIUiloZy5s/RuhzGs2petZCol+3OPfvAaP1G8g7sK
	 0zTXemR2t+rFX4bj7S9twIkYK0eSg8nlRTcOpTRIjPxaIxIiMOwl+Y/ubk280SH/wn
	 VfgBaMq3EyxhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/7] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260710-camss-isp-ope-v4-6-51207a0319d8@oss.qualcomm.com>
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
 <20260710-camss-isp-ope-v4-6-51207a0319d8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 09:24:56 +0000
Message-Id: <20260710092457.74A4E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 15 potential issue=
(s) to consider:
- [Critical] Missing locking in V4L2 ioctls allows format state tearing, le=
ading to out-of-bounds DMA access.
- [High] Concurrent job execution during streamoff causes DMA Use-After-Fre=
e.
- [High] Probe always fails with a timeout due to a masked reset interrupt,=
 and unbounded wait hangs the kernel during teardown.
- [High] IRQ handler does not abort after triggering a software reset, lead=
ing to double-completion of buffers and starting hardware mid-reset.
- [High] Hardware configuration is not fully restored after a software rese=
t, leading to corrupted frames.
- [High] Downscaler can produce a 0 output width for the last stripe under =
high downscale ratios, leading to hardware violation.
- [High] Concurrent list_add and list_del on ope->ctx_list causes list corr=
uption due to unlocked access.
- [High] Repeatedly opening and closing the device node causes a kernel mem=
ory leak.
- [High] The main `ope_dev` structure is freed via devres upon device unbin=
d, causing a Use-After-Free if a file descriptor remains open.
- [High] Driver removal does not stop the hardware or disable the IRQ befor=
e canceling the workqueue, leading to a Use-After-Free.
- [Medium] Missing `pm_ptr()` wrapper for `dev_pm_ops` assignment creates d=
ead code when PM is disabled.
- [Medium] Asynchronous Runtime PM put during probe error path causes a pow=
er leak.
- [Medium] Missing phase accumulator programming causes scaling discontinui=
ties (seams).
- [Medium] OPE_ENTITY_DISP does not propagate sink format changes to its so=
urce pad.
- [Medium] Hardware pipeline stalls indefinitely after encountering a proce=
ssing error because the scheduler is not triggered.
--

--- Patch [6]: [PATCH v4 6/7] media: qcom: camss: Add CAMSS Offline Process=
ing Engine driver ---
commit 4b6f83336240d059ff0d3b87339ee9f1c8085fee
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

media: qcom: camss: Add CAMSS Offline Processing Engine driver

Add an image processing driver for the Qualcomm Offline Processing Engine
(OPE). OPE is a memory-to-memory ISP block that converts raw Bayer
frames to YUV.

> diff --git a/drivers/media/platform/qcom/camss/camss-ope.c b/drivers/medi=
a/platform/qcom/camss/camss-ope.c
> new file mode 100644
> index 0000000000000..2c0d68cf1a637
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-ope.c

[ ... ]

> +static void ope_gen_stripe_dsc(struct ope_ctx *ctx, struct ope_stripe *s=
tripe,
> +			       unsigned int h_scale, unsigned int v_scale)
> +{

[ ... ]

> +	dsc_y->input_height =3D stripe->src.height;
> +
> +	/* Clip the output so the WE always receives the expected count */
> +	dsc_y->output_width  =3D DS_OUTPUT_PIX(sw, 0, h_scale);

[Severity: High]
Does this downscaler formula truncate to 0 under high downscale ratios?
For large downscale ratios, ope_calc_h_scale() bounds the last stripe's
input width to OPE_STRIPE_MIN_W (16). The integer division in DS_OUTPUT_PIX
with a large h_scale would yield 0, which gets programmed into the Write En=
gine
and triggers an IMG_SZ_VIOL or hardware hang.

[ ... ]

> +static void ope_job_finish(struct ope_ctx *ctx, enum vb2_buffer_state st=
ate)
> +{

[ ... ]

> +	dev_dbg(ctx->ope->dev, "done ctx=3D%p state=3D%u\n", ctx, state);
> +
> +	if (state =3D=3D VB2_BUF_STATE_DONE)
> +		ope_try_schedule(ctx);
> +}

[Severity: Medium]
Will this indefinitely stall the hardware pipeline after a processing error?
If a hardware violation triggers RST_DONE, ope_job_finish() completes the
buffer with VB2_BUF_STATE_ERROR. Since ope_try_schedule() is skipped,
subsequent queued buffers are ignored and the hardware remains idle.

[ ... ]

> +static void ope_prog_stripe(struct ope_ctx *ctx, struct ope_stripe *stri=
pe)
> +{

[ ... ]

> +		ope_write_wr(ope, OPE_BUS_WR_CLIENT_ADDR_IMAGE(i),
> +			     stripe->dst[i].addr);
> +		ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_0(i),
> +			     (stripe->dst[i].height << 16) | stripe->dst[i].width);

[Severity: High]
Is it possible to program the hardware Write Engine with a size of 0 here?
If the downscaler computed an output_width of 0 for the last stripe,
stripe->dst[i].width would be 0, leading to a constraint violation.

[ ... ]

> +		ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_IMAGE_SIZE_CFG(base),
> +			     ((dsc->input_width - 1) << 16) | (dsc->input_height - 1));
> +		ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_MN_H_CFG(base),
> +			     dsc->phase_step_h);
> +		ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_MN_V_CFG(base),
> +			     dsc->phase_step_v);

[Severity: Medium]
Are the initial phase offsets missing here?
The driver programs the phase steps but does not program the initial phase
offsets (OPE_PP_CLC_DOWNSCALE_MN_DS_MN_H_PHASE_CFG and V_PHASE_CFG).
This resets the phase to 0 at the start of every 336-pixel boundary,
which can cause visible scaling discontinuities or seams.

[ ... ]

> +static void ope_sched_cancel(struct ope_ctx *ctx)
> +{

[ ... ]

> +	if (running) {
> +		reinit_completion(&ope->reset_complete);
> +		ope_write(ope, OPE_TOP_RESET_CMD, OPE_TOP_RESET_CMD_SW);
> +		wait_for_completion(&ope->reset_complete);
> +	}
> +}

[Severity: High]
Could this result in an unbounded wait?
wait_for_completion() will hang the process permanently if the hardware
fails to respond or if the interrupt is lost. Should this use a timeout?

> +
> +static void ope_run_work(struct work_struct *work)
> +{

[ ... ]

> +		if (!ope_job_ready(ctx))
> +			return;
> +		ctx_changed =3D (ope->prev_ctx !=3D ctx);
> +		ope->prev_ctx =3D ctx;
> +		ope->curr_ctx =3D ctx;
> +	}
> +
> +	ope_run_job(ctx, ctx_changed);
> +}

[Severity: High]
Can ctx_changed incorrectly evaluate to false after a software reset?
If a hardware error resets the engine, the RST_DONE IRQ calls
ope_job_finish() which clears ope->curr_ctx but leaves ope->prev_ctx
intact. On the next job, this computes ctx_changed as false, preventing
the Image Quality modules from being properly re-enabled, leading
to corrupted frames.

> +
> +static void ope_try_schedule(struct ope_ctx *ctx)
> +{
> +	struct ope_dev *ope =3D ctx->ope;
> +
> +	if (!ope_job_ready(ctx))
> +		return;
> +
> +	scoped_guard(spinlock_irqsave, &ope->sched_lock) {
> +		if (ctx->queued || ope->curr_ctx)
> +			return;
> +		ctx->queued =3D true;
> +	}
> +
> +	schedule_work(&ope->run_work);
> +}

[Severity: High]
Could this reschedule the workqueue asynchronously after a streamoff?
Calling VIDIOC_STREAMOFF on the OPE_QUEUE_DISP_OUT queue leaves
ctx->started true (it is only cleared for FRAME_IN). If a hardware completi=
on
interrupt fires concurrently after the software reset, the IRQ handler calls
ope_try_schedule(), which evaluates ctx->started as true and reschedules
run_work. This can run after cancel_work_sync() has returned, resulting in a
DMA Use-After-Free when it programs the hardware with freed buffer pointers.

[ ... ]

> +static irqreturn_t ope_irq(int irq, void *dev_id)
> +{

[ ... ]

> +	if (status & OPE_TOP_IRQ_STATUS_WE)
> +		ope_we_irq(ope, ctx);
> +
> +	if ((status & OPE_TOP_IRQ_STATUS_IDLE) && ctx) {
> +		struct ope_stripe *stripe =3D ope_current_stripe(ctx);

[Severity: High]
Should this return early if a hardware reset was triggered?
If ope_we_irq() detects a constraint violation, it issues a full hardware
reset (OPE_TOP_RESET_CMD_SW). However, execution continues here to evaluate
the IDLE status. If IDLE is set, it calls ope_job_finish(), dequeues the
buffer, and calls ope_try_schedule() which issues a new GO_CMD while the
hardware is mid-reset, potentially causing a bus hang.

[ ... ]

> +static void ope_adjust_power(struct ope_dev *ope)
> +{
> +	unsigned int loadavg =3D 0, loadpeak =3D 0, loadconfig =3D 0;
> +	unsigned long pixclk =3D 0;
> +	struct dev_pm_opp *opp;
> +	struct ope_ctx *ctx;
> +	int ret;
> +
> +	list_for_each_entry(ctx, &ope->ctx_list, list) {
> +		unsigned int fps;

[Severity: High]
Is it safe to iterate ope->ctx_list without acquiring ope->mutex?
Concurrent additions and deletions to ctx_list via ope_open() and
ope_release() can cause list corruption and kernel crashes.

[ ... ]

> +static void ope_stop_streaming(struct vb2_queue *q)
> +{

[ ... ]

> +	dev_dbg(ctx->ope->dev, "streaming stop ctx=3D%p queue=3D%u\n", ctx, idx=
);
> +
> +	if (idx =3D=3D OPE_QUEUE_FRAME_IN) {
> +		ctx->started =3D false;
> +		ope_adjust_power(ctx->ope);
> +	}
> +
> +	ope_sched_cancel(ctx);

[Severity: High]
Does this safely stop the pipeline for the DISP_OUT queue?
It only clears ctx->started if the FRAME_IN queue is stopped. Calling
streamoff on DISP_OUT ignores this state update. As noted earlier, this can
lead to DMA Use-After-Free if a concurrent IRQ reschedules the workqueue.

[ ... ]

> +static int ope_init_vq(struct ope_ctx *ctx, unsigned int idx)
> +{
> +	struct ope_dev *ope =3D ctx->ope;
> +	struct ope_vq_priv *qpriv;
> +	struct vb2_queue *q =3D &ctx->queues[idx].vq;
> +
> +	qpriv =3D devm_kzalloc(ope->dev, sizeof(*qpriv), GFP_KERNEL);

[Severity: High]
Does this cause a memory leak on every open/close cycle?
Using devm_kzalloc() ties the lifetime of qpriv to the device binding rather
than the file descriptor. Repeatedly opening and closing the device node wi=
ll
exhaust kernel memory since the context is destroyed in ope_release() but
the devm allocations are not freed.

[ ... ]

> +static int ope_s_fmt_vid_out(struct file *file, void *priv, struct v4l2_=
format *f)
> +{

[ ... ]

> +	fmt =3D ope_fmt_try(ctx->ope, false, &f->fmt.pix_mp);
> +	ctx->fmt_in.fmt		    =3D fmt;
> +	ctx->fmt_in.width	    =3D f->fmt.pix_mp.width;
> +	ctx->fmt_in.height	    =3D f->fmt.pix_mp.height;
> +	ctx->fmt_in.bytesperline    =3D f->fmt.pix_mp.plane_fmt[0].bytesperline;
> +	ctx->fmt_in.sizeimage	    =3D f->fmt.pix_mp.plane_fmt[0].sizeimage;

[Severity: Critical]
Is this missing synchronization?
This modifies multi-component state locklessly. Concurrent S_FMT ioctls can
cause format state tearing, combining a small sizeimage with large geometri=
cal
dimensions. This would cause the hardware to DMA past the allocated buffer
bounds. The video device nodes appear to be registered without vdev.lock.

[ ... ]

> +static int ope_disp_set_fmt(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state,
> +			    struct v4l2_subdev_format *fmt)
> +{

[ ... ]

> +	v4l_bound_align_image(&fmt->format.width,  OPE_MIN_W, OPE_MAX_W, 0,
> +			      &fmt->format.height, OPE_MIN_H, OPE_MAX_H, 0, 0);
> +	fmt->format.field      =3D V4L2_FIELD_NONE;
> +	fmt->format.colorspace =3D V4L2_COLORSPACE_SRGB;
> +
> +	pad_fmt  =3D v4l2_subdev_state_get_format(state, fmt->pad);
> +	*pad_fmt =3D fmt->format;
> +	return 0;
> +}

[Severity: Medium]
Should this propagate sink format changes to the source pad?
If fmt->pad is a sink pad, it updates the sink pad format but does not
automatically propagate those changes (like mbus_code or resolution) to the
corresponding source pad, which breaks the V4L2 subdev API contract.

[ ... ]

> +static int ope_release(struct file *file)
> +{

[ ... ]

> +	kfree(fh);
> +
> +	scoped_guard(mutex, &ope->mutex) {
> +		if (--ope->open_count !=3D 0)
> +			return 0;
> +		ope->shared_ctx =3D NULL;
> +	}
> +
> +	ope_ctx_destroy(ctx);
> +
> +	return 0;
> +}

[Severity: High]
Does dropping the mutex here lead to list corruption?
ope_ctx_destroy() is called completely unlocked and executes
list_del(&ctx->list). A concurrent thread calling ope_open() will acquire
ope->mutex and execute list_add(), causing list corruption.

Also, if the device has been unbound, ope_dev might already be freed via
devres, making the access to ope->mutex a Use-After-Free.

[ ... ]

> +static const struct camss_isp_entity_desc ope_entity_descs[] =3D {
> +	[OPE_ENTITY_FRAME_IN] =3D {
> +		.name      =3D "ope_input",
> +		.obj_type  =3D MEDIA_ENTITY_TYPE_VIDEO_DEVICE,
> +		.function  =3D MEDIA_ENT_F_IO_V4L,
> +		.vdev.caps =3D V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
> +		.vdev.drvdata =3D (void *)(uintptr_t)OPE_QUEUE_FRAME_IN,
> +		.vdev.fops =3D &ope_fops,
> +		.vdev.ioctl_ops =3D &ope_video_ioctl_ops,

[Severity: Critical]
Is .vdev.lock missing here?
Registering the video device without initializing vdev.lock causes video_io=
ctl2
to execute without serialization. This leads to the format state tearing is=
sue
in S_FMT mentioned earlier.

[ ... ]

> +static void ope_v4l2_cleanup(struct ope_dev *ope)
> +{
> +	if (ope->pipeline) {
> +		camss_isp_pipeline_unregister(ope->pipeline);
> +		camss_isp_pipeline_free(ope->pipeline);
> +		ope->pipeline =3D NULL;
> +	}
> +	media_device_unregister(&ope->mdev);
> +	v4l2_device_unregister(&ope->v4l2_dev);
> +	media_device_cleanup(&ope->mdev);
> +	cancel_work_sync(&ope->run_work);
> +}

[Severity: High]
Could this cause a Use-After-Free during unbind?
The hardware and interrupts are not stopped before canceling the workqueue.
Since the IRQ is managed by devres, it is still active here. An interrupt
firing immediately after cancel_work_sync() can reschedule ope->run_work.
Once the unbind finishes and devres frees ope_dev, the newly scheduled work
will access freed memory.

> +
> +static int ope_soft_reset(struct ope_dev *ope)
> +{

[ ... ]

> +	reinit_completion(&ope->reset_complete);
> +	ope_write(ope, OPE_TOP_RESET_CMD, OPE_TOP_RESET_CMD_SW);
> +
> +	if (!wait_for_completion_timeout(&ope->reset_complete,
> +					 msecs_to_jiffies(OPE_RESET_TIMEOUT_MS))) {
> +		dev_err(ope->dev, "Reset timeout\n");
> +		pm_runtime_put(ope->dev);
> +		return -ETIMEDOUT;
> +	}

[Severity: High]
Will this unconditionally time out during probe?
The hardware interrupts (OPE_TOP_IRQ_MASK) are not enabled until
__ope_irq_init() is called during streamon. Because the reset interrupt is
masked at probe time, this wait_for_completion_timeout() can never succeed.

[Severity: Medium]
Does using the asynchronous pm_runtime_put() here cause a power leak?
If probe fails, devres automatically calls pm_runtime_disable(), which canc=
els
the pending asynchronous suspend work leaving the device powered on permane=
ntly.
This should use pm_runtime_put_sync().

[ ... ]

> +static int ope_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct ope_dev *ope;
> +	int ret, irq;
> +
> +	ope =3D devm_kzalloc(dev, sizeof(*ope), GFP_KERNEL);

[Severity: High]
Does allocating ope_dev via devm_kzalloc() cause a Use-After-Free?
If the device is unbound via sysfs while userspace holds an open file descr=
iptor,
devres will free ope_dev. Subsequent ioctls or the final close() will access
the freed memory (e.g., locking ope->mutex in ope_release). The core state
structure's lifetime should be tied to the V4L2 device's internal refcount.

[ ... ]

> +static struct platform_driver ope_driver =3D {
> +	.probe  =3D ope_probe,
> +	.remove =3D ope_remove,
> +	.driver =3D {
> +		.name           =3D OPE_NAME,
> +		.of_match_table =3D ope_dt_ids,
> +		.pm             =3D &ope_pm_ops,
> +	},
> +};

[Severity: Medium]
Is this missing the pm_ptr() wrapper macro?
Assigning &ope_pm_ops directly causes compiler warnings and creates dead co=
de
linked into the kernel when CONFIG_PM is disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-camss-isp-=
ope-v4-0-51207a0319d8@oss.qualcomm.com?part=3D6
