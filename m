Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ACD34DCCD
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328456; cv=none; b=LVprIfgOJMukzQxS9V6EmN/TEIwOBT8UcAd9B7kWCokK3xnVTLjlpybC/PDL5jtvBmuRcqmaaJQ1ZVM/jXqHTjf+fW+xGh0BXoHalfpBWx2rhqGpTfhamvcM3x6WyIw0DCOKQ1HBtouSE0yHvNr0lb7F7s6QvDMy/Tj3UixS8tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328456; c=relaxed/simple;
	bh=OLTCsgPTKzR8AGZMsWi5/Ca62RYl7Eui1jj7M1UXv98=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kntHul6nOiT/PGN3K/269VL0Zd5x8qHo46O3c+qWkgW6zmwudlUmftnOPHA/ocMUa5l7aC/6h0dTbTdn1i/R9HZ0NL/hgymRqtl6EUmVJdzA4ZkGrZGI21tnCYHVqMYCcsgMgFpAwTxRgYKP7OP02Sstm4SLlbimkJXw5zEAtis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BuJvUt2c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BuJvUt2c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484041F000FF;
	Fri, 25 Sep 2026 09:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790328454;
	bh=ebmrFXauXgKtSKC82Xm0gcU43ZFvUNlh+Y6qk9SfCLo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BuJvUt2cSnLqCvKyqdMU99aDF2Dn/PrW2f8L9Cy0009SkTHcDti9+RxPz1wgwdLFv
	 96xtsia1cYJhGQn5715QKFhBORDeyvsMKmscp+egEGGdSaVNbXp8Xk85XXwTG2TWDd
	 cecLEJpyrvANVt2RaDZaqXxkO99uqGOuLJ86TTW5+2WMXawFHEchrBNwxveFfMog2Z
	 hAqGxjX4lxH7N4lmiUnhdN+WtpUi72kgJm5m1vd7AAhm+p2RpW8py5jSiHxAbYDVWQ
	 6gOLRrfzuERrDVR57NIm/uat3uPcNrsEtjtqmOIjsCpTtePvV6mW4QLGlK2d15OnuD
	 xHaJsh4VhgJdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 6/9] media: qcom: camss: Add CAMSS Offline
 Processing Engine driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260925-camss-isp-ope-v10-6-2622411034cb@oss.qualcomm.com>
References: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
 <20260925-camss-isp-ope-v10-6-2622411034cb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 09:27:33 +0000
Message-Id: <20260925092734.484041F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] media: qcom: camss: UAF of icc_data during concurrent device unbin=
d and ioctl
- [High] media: qcom: camss: UAF of context object in interrupt handler due=
 to missing synchronize_irq()
- [High] media: qcom: camss: race condition in stream start causes permanen=
t pipeline stall
- [High] media: qcom: camss: missing IRQ mask restoration after hardware er=
ror reset
- [Medium] media: qcom: camss: permanent power domain leak if unbound while=
 streaming
- [Medium] media: qcom: camss: data race in hardware reset routines causes =
unpredictable behavior
- [Medium] media: qcom: camss: missing vb2_queue_error() on unbind causes t=
asks to hang indefinitely
- [Low] media: qcom: camss: 64-bit division by 32-bit variable causes linke=
r error on 32-bit archs
- [Low] media: qcom: camss: use of undefined memory allocation macros
--

commit 4b42088ac3a930201d67a61b90b4b581e3241cfe
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: media: qcom: camss: Add CAMSS Offline Processing Engine driver

This commit adds an image processing driver for the Qualcomm Offline
Processing Engine (OPE), which is a memory-to-memory ISP block that converts
raw Bayer frames to YUV. It introduces a driver architecture spanning
multiple source files to handle hardware programming, an MC topology builde=
r,
and V4L2 parameter dispatch. Default configuration values are based on BT.6=
01
standards.

Link: https://github.com/jwrdegoede/libcamera/commits/camss_pipeline_v2.1/
Link: https://github.com/loicpoulain/camss-isp-m2m-test

> diff --git a/drivers/media/platform/qcom/camss/ope/core.c b/drivers/media=
/platform/qcom/camss/ope/core.c
> index 0000000000000..122e6c8deb022
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/ope/core.c
> @@ -0,0 +1,3843 @@
[ ... ]
> +#define DS_Q21(n, d)		((uint32_t)(((uint64_t)(n) << 21) / (d)))
> +#define DS_RESOLUTION(in, out) \
> +	(((out) * 128 <=3D (in)) ? 0x0 : \
> +	 ((out) * 16  <=3D (in)) ? 0x1 : \
> +	 ((out) * 8   <=3D (in)) ? 0x2 : 0x3)
> +#define DS_OUTPUT_PIX(in, phase_init, phase_step) \
> +	((Q21(in) - (phase_init)) / (phase_step))

[Severity: Low]
Are we performing a 64-bit division by a 32-bit variable here? The driver
calculates scaling phases using the standard / operator with a 64-bit
dividend and a 32-bit variable divisor. This is unsupported on 32-bit
architectures without div_u64(), and leads to an undefined reference to
__udivdi3 during compilation.

[ ... ]
> +static void ope_job_finish(struct ope_ctx *ctx, enum vb2_buffer_state st=
ate)
> +{
[ ... ]
> +	scoped_guard(spinlock_irqsave, &ope->sched_lock) {
> +		ope->hw_running =3D false;
> +		ope->curr_ctx =3D NULL;
> +		ctx->queued =3D false;
> +
> +		/* A failed job leaves the configuration in an unknown state */
> +		if (state !=3D VB2_BUF_STATE_DONE)
> +			ope->hw_ctx =3D NULL;
> +	}
> +
> +	dev_dbg(ctx->ope->dev, "done ctx=3D%p state=3D%u\n", ctx, state);
> +
> +	ope_try_schedule(ctx);
> +}

[Severity: High]
Is it possible to access the ctx object after it has been freed? The interr=
upt
handler clears hw_running inside the lock, then accesses ctx outside the
lock. If the file descriptor is closed concurrently, ope_sched_cancel()
could skip synchronize_irq() because hw_running is false, freeing ctx
before this debug print runs.

[ ... ]
> +static void ope_sched_cancel(struct ope_ctx *ctx)
> +{
> +	struct ope_dev *ope =3D ctx->ope;
> +	bool running;
> +
> +	disable_work_sync(&ope->run_work);
> +
> +	scoped_guard(spinlock_irqsave, &ope->sched_lock)
> +		running =3D (ope->hw_running && ope->hw_ctx =3D=3D ctx);
> +
> +	if (running && ope_hw_reset_sync(ope)) {

[Severity: Medium]
Could this execute an IRQ-based hardware reset that races with
ope_hw_reset_poll()? If ope_unregister() is called concurrently with file
closure, it calls ope_hw_reset_poll() without holding locks that exclude
ope_sched_cancel(). Both routines would concurrently write to the reset
and IRQ mask registers.

[Severity: High]
What happens if the IRQ handler just cleared hw_running but hasn't yet
finished accessing ctx? By checking hw_running, this conditionally skips
synchronize_irq(), allowing ctx to be freed while the IRQ handler still
uses it.

> +		dev_err(ope->dev, "reset timeout during cancel\n");
> +		synchronize_irq(ope->irq);
> +		ope_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +	}
> +
> +	scoped_guard(spinlock_irqsave, &ope->sched_lock) {
> +		ctx->queued =3D false;

[Severity: High]
Might this clear ctx->queued after a window where QBUF can re-set it, causi=
ng
a permanent pipeline stall? If a shared file streams while another closes,
this clears ctx->queued after disable_work_sync(). If QBUF sets ctx->queued
to true and fails schedule_work() in that window, later resumes will see
ctx->queued as already true and drop the work item permanently.

> +		if (ope->curr_ctx =3D=3D ctx)
> +			ope->curr_ctx =3D NULL;
> +		if (ope->hw_ctx =3D=3D ctx) {
> +			ope->hw_ctx =3D NULL;
> +			ope->hw_running =3D false;
> +		}
> +	}
> +}
[ ... ]
> +static void ope_try_schedule(struct ope_ctx *ctx)
> +{
> +	struct ope_dev *ope =3D ctx->ope;
> +
> +	if (!ope_job_ready(ctx))
> +		return;
> +
> +	/* Claim the job slot. */
> +	scoped_guard(spinlock_irqsave, &ope->sched_lock) {
> +		if (ctx->queued || ope->curr_ctx)
> +			return;
> +		ctx->queued =3D true;
> +		ope->curr_ctx =3D ctx;
> +	}
> +
> +	schedule_work(&ope->run_work);
> +}

[Severity: High]
Would setting ctx->queued to true before calling schedule_work() cause
problems if the workqueue is disabled? If schedule_work() fails because
disable_work_sync() was called (e.g., during ope_sched_cancel), ctx->queued
will be stuck as true.

[ ... ]
> +static bool ope_we_irq(struct ope_dev *ope, struct ope_ctx *ctx)
> +{
[ ... ]
> +	if (reset) {
> +		ope_write(ctx->ope, OPE_TOP_RESET_CMD, OPE_TOP_RESET_CMD_SW);
> +		return true;
> +	}

[Severity: High]
Does this software reset clear the hardware block state, including IRQ mask=
s,
without restoring them?

[ ... ]
> +static irqreturn_t ope_irq(int irq, void *dev_id)
> +{
[ ... ]
> +	if (status & OPE_TOP_IRQ_STATUS_RST_DONE) {
> +		dev_dbg(ope->dev, "reset done ctx=3D%p\n", ctx);
> +		ope_glut_cache_invalidate(ope);
> +		if (ctx)
> +			ope_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +
> +		complete(&ope->reset_complete);
> +
> +		return IRQ_HANDLED;
> +	}

[Severity: High]
Will the pipeline stall permanently after the first hardware error? The
RST_DONE handler cleans up the bad job and queues the next one, but
__ope_irq_init() is never called to restore the engine masks that were
cleared by the software reset. The next job will run without generating
any interrupts.

[ ... ]
> +static void ope_adjust_power(struct ope_dev *ope)
> +{
[ ... ]
> +	ret =3D icc_set_bw(ope->icc_data, loadavg, loadpeak);

[Severity: High]
Can this access the devm-allocated icc_data pointer after it has been freed
by devres? A userspace application continuously calling an ioctl like
VIDIOC_S_PARM while the device is unbound passes the ope_hw_available()
check, gets preempted, devres frees icc_data, and the ioctl resumes to use
the freed pointer.

[ ... ]
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
> +	ope_sched_resume(ctx);
> +
> +	pm_runtime_put(ctx->ope->dev);

[Severity: Medium]
Is it safe to attempt to drop the PM reference here if pm_runtime_disable()
was already called by devres on unbind? If the device is unbound while
streaming, cleanup calls pm_runtime_disable(). Later, when the file
descriptor is closed, pm_runtime_put() is called here. Because PM runtime
is disabled, the counter is decremented but the device is never suspended,
leaving it permanently powered on.

[ ... ]
> +static struct ope_ctx *ope_ctx_create(struct ope_dev *ope)
> +{
> +	struct v4l2_pix_format_mplane pix_in =3D { .pixelformat =3D ope_input_f=
mts[0].fourcc };
> +	struct v4l2_pix_format_mplane pix_out =3D { .pixelformat =3D ope_output=
_fmts[0].fourcc };
> +	struct ope_ctx *ctx;
> +	unsigned int i;
> +	int ret;
> +
> +	lockdep_assert_held(&ope->mutex);
> +
> +	ctx =3D kvzalloc_obj(*ctx);

[Severity: Low]
Is kvzalloc_obj defined in the kernel tree? This will cause a compilation
failure since the macro is not part of the Linux kernel API.

[ ... ]
> +static void ope_unregister(struct ope_dev *ope)
> +{
> +	struct ope_ctx *ctx;
> +
> +	disable_work_sync(&ope->run_work);
> +
> +	scoped_guard(spinlock_irqsave, &ope->sched_lock)
> +		ctx =3D ope->curr_ctx;
> +
> +	if (ctx) {
> +		if (ope_hw_reset_poll(ope))
> +			dev_err(ope->dev, "reset timeout on unbind\n");

[Severity: Medium]
Is it safe to execute hardware reset polling locklessly with respect to the
V4L2 device locks? This can race with ope_sched_cancel() executing
ope_hw_reset_sync(), causing unpredictable behavior.

> +		ope_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +	}

[Severity: Medium]
Should this unbind function signal queue error states to wake up blocked
applications? If device unbind happens while a userspace application is
blocked waiting for frames, finishing the active job without calling
vb2_queue_error() leaves sleepers on the video queues hanging indefinitely.

[ ... ]
> +static int ope_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct ope_dev *ope;
> +	int ret, irq;
> +
> +	/* OPE lifetime is refcounted through the embedded v4l2_device */
> +	ope =3D kzalloc_obj(*ope);

[Severity: Low]
Is kzalloc_obj an available macro? This will cause a compilation failure.

[ ... ]
> +static void ope_remove(struct platform_device *pdev)
> +{
> +	struct ope_dev *ope =3D platform_get_drvdata(pdev);
> +
> +	disable_irq(ope->irq);
> +	ope_unregister(ope);
> +}

[Severity: High]
Could device removal finish and trigger devres cleanup without synchronizing
with active ioctls? This will free icc_data while concurrent requests may
still be accessing it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-camss-isp-=
ope-v10-0-2622411034cb@oss.qualcomm.com?part=3D6
