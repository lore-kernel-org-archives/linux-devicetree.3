Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672190;
	b=nu1mjbJk6+ClrJATr1IOnOze76mAO4TCF25VzhKCMVQYyfOSGMDs2oru3nkw3xjqoiRU
	 SiJF9RmogHEXgWqMGlPp26I47hfSe35V2reLm7gjg6VydDlrJn6ygsQ3TNt7aH8lIURIq
	 6FEXH3J3TLx6BGDWMmDlwnnXo42uo3IbeEQgUSRnqQ25MCzuNG3U1OoxejL6mL6vuzS33
	 5j3Bb4+TQtKy0Owtq1PS7PmbcIccv3uh3eEmkHcOihoheQYT3QGV9yjZxNM2PUbJj0ktB
	 pqcMdStndR200s0YD0EJz45WN8nbpbAaSOgVyHGk/NjCEp22hAr6HVzZOviJNZrI4LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672190;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AzjKX15YSQcz7sNh+3JB1AJk4OdnwaT05TceP4yCGbk=;
	b=SOJinSIwB/jkLd5DicSYMZ79rHg5dDXybyjQeOgKwbhtfGSIlTUGkAC2YcVYIIRolCcO
	 tGmFrZP32821JXSPZtIHuBVJIs9GVOu4N7dDoHlGiS3yVnG6aA88ScYxoeUvz272GA0Oz
	 Ku7F5dqYL+4ppvlyBApDLIfF+l8uuvT1FAWsjvQpTaJanbS6Er0mzAU+RjQ8olIilFZ4z
	 5VaKt1hSfogndLyWq51DwhHJSOtYPJYOIVF9k3uWQtMuz57AFK8HtJGIyBHCTnFwqZ9Nw
	 WOhgvyZZI2oSuu/JLsPHvvrc+rxWySHJni+0k3vGynnJQ41U74kM7lyniWyHxsVZUkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I8UOCmUE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3BE606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 12:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I8UOCmUE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EBD1F000C1;
	Thu, 22 Oct 2026 12:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792672190;
	bh=AzjKX15YSQcz7sNh+3JB1AJk4OdnwaT05TceP4yCGbk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I8UOCmUExJi+fZ6X75QuPqQa2xS9hDdCxkpJK0KEHnisyt2gEXNWZCbAm8Jpbbdj3
	 hphSesWPUt8462RAe0uKs1Ia3ls0et0Ooh9xUlvL2p/wirP7OlZn3ATZQOzk9Xo1NC
	 iVJO4rfqvy3/0kTQwckn4Y029ECteVtW88sk/LH+9cCAcZMrEgGWSYa83ugeNQ3WiH
	 7NizTE/04l7F0I44gRRtKAXIvX8aR/PolaBtSo8W7fsPeX8ALUOBVu+CPNBKc0n3ni
	 KIFWvDVeOeqmjxgAe4YCVZnPbuUVxr8Fb0/MYLNFGi8kjL1NdTXRsaEl9sTpogy8XX
	 MMO0t8P9cSqLA==
Message-ID: <sashiko-outbox-181439@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
 <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 12:29:49 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] media: rockchip: jpegd: race and premature flag clear in rkjpegd_s=
top_at_change()
- [High] media: rockchip: rkjpegd: race between rkjpegd_watchdog() and rkjp=
egd_vdpu720_irq()
- [High] media: rockchip: rkjpegd: missing vdev_lock in rkjpegd_suspend() c=
auses UAF
--

commit 4527476128adffa812e326dce79f8f8daf9729ec
Author: Sascha Hauer <s.hauer@pengutronix.de>

media: rockchip: Add JPEG decoder driver

This commit adds a V4L2 mem2mem stateful JPEG decoder driver for the
Rockchip VDPU720 hardware block, supporting NV12 and GREY capture formats,
dynamic resolution changes, and hardware watchdog recovery.

> diff --git a/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c b/drivers/=
media/platform/rockchip/rkjpegd/rkjpegd.c
> new file mode 100644
> index 0000000000000..b33141c33ec38
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c

[ ... ]

> +/*
> + * Take up the format the decoder stopped at, from the capture queue bei=
ng
> + * restarted or V4L2_DEC_CMD_START.  No job runs while it is stopped.
> + */
> +static void rkjpegd_resume_at_change(struct rkjpegd_ctx *ctx)
> +{
> +	struct vb2_v4l2_buffer *src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	struct rkjpegd_src_buf *src_buf =3D vb2_to_rkjpegd_src_buf(&src->vb2_bu=
f);
> +
> +	rkjpegd_fill_hdr_fmt(&ctx->dst_fmt, &ctx->crop, &src_buf->header);
> +	src_buf->fmt_change =3D false;
> +	WRITE_ONCE(ctx->stopped_at_change, false);
> +}

[ ... ]

> +static int rkjpegd_decoder_cmd(struct file *file, void *priv,
> +			       struct v4l2_decoder_cmd *cmd)
> +{
> +	struct rkjpegd_ctx *ctx =3D file_to_rkjpegd_ctx(file);
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +	bool stopped;
> +	int ret;
> +
> +	ret =3D v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)))
> +		return 0;
> +
> +	/* Resumes after a format change, and leaves a drain alone. */
> +	if (cmd->cmd =3D=3D V4L2_DEC_CMD_START && READ_ONCE(ctx->stopped_at_cha=
nge)) {
> +		rkjpegd_resume_at_change(ctx);
> +		vb2_clear_last_buffer_dequeued(&ctx->fh.m2m_ctx->cap_q_ctx.q);
> +		v4l2_m2m_try_schedule(ctx->fh.m2m_ctx);
> +		return 0;
> +	}

[ ... ]

> +static void rkjpegd_irq_done(struct rkjpegd_dev *jpegd,
> +			     enum vb2_buffer_state state)
> +{
> +	/* A pending watchdog means a job is running, see rkjpegd_watchdog(). */
> +	if (cancel_delayed_work(&jpegd->watchdog_work))
> +		rkjpegd_job_finish(v4l2_m2m_get_curr_priv(jpegd->m2m_dev),
> +				   state);
> +}

[ ... ]

> +static void vdpu720_soft_reset(struct rkjpegd_dev *jpegd)
> +{
> +	u32 status;
> +
> +	/* Idle blocks want FORCE_SOFTRESET_VALID first, per downstream BSP. */
> +	status =3D rkjpegd_read(jpegd, VDPU720_REG_INT);
> +	if (!(status & VDPU720_DEC_E))
> +		rkjpegd_write(jpegd, VDPU720_FORCE_SOFTRST, VDPU720_REG_SYS);
> +
> +	rkjpegd_write(jpegd, status | VDPU720_SOFT_RST_EN, VDPU720_REG_INT);
> +
> +	if (readl_relaxed_poll_timeout(jpegd->regs + VDPU720_REG_INT, status,
> +				       status & VDPU720_SOFT_RST_RDY, 5, 10000))
> +		dev_warn(jpegd->dev, "soft reset timed out\n");
> +}
> +
> +/**
> + * rkjpegd_vdpu720_reset() - put the block back into a known state
> + * @ctx:	context the block is being reset on behalf of
> + *
> + * Reached from the watchdog, and from rkjpegd_vdpu720_run() for a block=
 the
> + * last job left unparked, see @rkjpegd_dev.needs_reset.  Sleeps, so it =
must
> + * not be called from the interrupt handler.
> + */
> +static void rkjpegd_vdpu720_reset(struct rkjpegd_ctx *ctx)
> +{
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +
> +	vdpu720_soft_reset(jpegd);
> +	rkjpegd_write(jpegd, 0, VDPU720_REG_INT);
> +
> +	jpegd->needs_reset =3D false;
> +}

[ ... ]

> +static irqreturn_t rkjpegd_vdpu720_irq(int irq, void *dev_id)
> +{
> +	struct rkjpegd_dev *jpegd =3D dev_id;
> +	enum vb2_buffer_state state;
> +	u32 status;
> +
> +	status =3D rkjpegd_read(jpegd, VDPU720_REG_INT);
> +
> +	/* First phase of the IRQ clear, see VDPU720_IRQ_CLR_KEEP. */
> +	rkjpegd_write(jpegd, status & VDPU720_IRQ_CLR_KEEP, VDPU720_REG_INT);
> +
> +	if (!(status & VDPU720_IRQ_RAW))
> +		return IRQ_NONE;
> +
> +	rkjpegd_write(jpegd, 0, VDPU720_REG_INT);
> +
> +	state =3D (status & VDPU720_ERR_MASK) ?
> +		VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
> +
> +	/*
> +	 * A block that did not park itself wedges on the next frame, and a
> +	 * clean frame can leave it unparked too, as SOFT_RST_RDY shows.  The
> +	 * reset sleeps, so leave it to rkjpegd_vdpu720_run().  The next job
> +	 * is only started after job_spinlock has released this one, which
> +	 * orders the store.
> +	 */
> +	if (state =3D=3D VB2_BUF_STATE_ERROR || !(status & VDPU720_SOFT_RST_RDY=
))
> +		jpegd->needs_reset =3D true;

[ ... ]

> +	rkjpegd_irq_done(jpegd, state);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void rkjpegd_watchdog(struct work_struct *work)
> +{
> +	struct rkjpegd_dev *jpegd =3D container_of(to_delayed_work(work),
> +						 struct rkjpegd_dev,
> +						 watchdog_work);
> +	/* Only armed while a job runs, so there is always a context. */
> +	struct rkjpegd_ctx *ctx =3D v4l2_m2m_get_curr_priv(jpegd->m2m_dev);
> +
> +	dev_err(jpegd->dev, "frame processing timed out\n");
> +
> +	rkjpegd_vdpu720_reset(ctx);
> +	rkjpegd_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +}

[Severity: High]
What prevents rkjpegd_watchdog() and rkjpegd_vdpu720_irq() in
drivers/media/platform/rockchip/rkjpegd/rkjpegd.c from racing if the
hardware raises an interrupt right as jpegd->watchdog_work expires?

Once the workqueue dequeues jpegd->watchdog_work to execute
rkjpegd_watchdog(), WORK_STRUCT_PENDING_BIT is cleared, so
cancel_delayed_work(&jpegd->watchdog_work) in rkjpegd_irq_done() no longer
serializes the two paths, and neither path holds a shared lock or disables
the IRQ.

First, in rkjpegd_watchdog() -> rkjpegd_vdpu720_reset() ->
vdpu720_soft_reset(), the driver writes status | VDPU720_SOFT_RST_EN to
VDPU720_REG_INT (without setting VDPU720_IRQ_DIS) and sleeps in
readl_relaxed_poll_timeout() waiting for VDPU720_SOFT_RST_RDY. If
rkjpegd_vdpu720_irq() runs concurrently, it writes 0 to VDPU720_REG_INT
(clearing VDPU720_SOFT_RST_EN and VDPU720_SOFT_RST_RDY) and sets
jpegd->needs_reset =3D true, after which vdpu720_soft_reset() times out and
rkjpegd_vdpu720_reset() unconditionally overwrites
jpegd->needs_reset =3D false.

Second, if rkjpegd_vdpu720_irq() is entered on another CPU for the
timed-out job (for example, while formatting the dev_warn_ratelimited()
diagnostics) while rkjpegd_watchdog() completes rkjpegd_vdpu720_reset()
and rkjpegd_job_finish(), the next queued job can start in
rkjpegd_vdpu720_run() and re-arm jpegd->watchdog_work via
rkjpegd_arm_watchdog(). When the first job's in-flight
rkjpegd_vdpu720_irq() then reaches rkjpegd_irq_done():

	if (cancel_delayed_work(&jpegd->watchdog_work))
		rkjpegd_job_finish(v4l2_m2m_get_curr_priv(jpegd->m2m_dev),
				   state);

it will cancel the new job's watchdog and call rkjpegd_job_finish() on the
newly started job while hardware DMA is still active on its buffers.

[ ... ]

> +/*
> + * Stop in front of a frame that decodes to another format: report it, a=
nd
> + * hand back a capture buffer as LAST to mark where the old format ends.=
  The
> + * event goes first, GStreamer looks for one before it dequeues a buffer.
> + */
> +static void rkjpegd_stop_at_change(struct rkjpegd_ctx *ctx,
> +				   struct vb2_v4l2_buffer *dst)
> +{
> +	struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
> +
> +	/* Set before the event, so that a query after it sees the change. */
> +	WRITE_ONCE(ctx->stopped_at_change, true);
> +	v4l2_event_queue_fh(&ctx->fh, &rkjpegd_src_change_event);
> +
> +	v4l2_m2m_dst_buf_remove(m2m_ctx);
> +	rkjpegd_last_buffer_done(ctx, dst);
> +	v4l2_m2m_job_finish(ctx->dev->m2m_dev, m2m_ctx);
> +}

[ ... ]

> +static void rkjpegd_stop_streaming(struct vb2_queue *vq)
> +{

[ ... ]

> +	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
> +		/* A seek aborts a format change, decoding goes on as before. */
> +		if (ctx->stopped_at_change) {
> +			WRITE_ONCE(ctx->stopped_at_change, false);
> +			vb2_clear_last_buffer_dequeued(&ctx->fh.m2m_ctx->cap_q_ctx.q);
> +		}
> +		rkjpegd_reset_queued(ctx);
> +	} else if (ctx->stopped_at_change) {

[Severity: High]
Can rkjpegd_stop_at_change() race with rkjpegd_decoder_cmd(), and can
vb2_clear_last_buffer_dequeued() be called before the V4L2_BUF_FLAG_LAST
buffer is actually dequeued in
drivers/media/platform/rockchip/rkjpegd/rkjpegd.c?

When a frame finishes decoding in rkjpegd_vdpu720_irq(),
v4l2_m2m_buf_done_and_job_finish() calls v4l2_m2m_schedule_next_job(),
which queues the next job (since rkjpegd_job_ready() only checks
!READ_ONCE(ctx->stopped_at_change)) and schedules m2m_dev->job_work:

  v4l2_m2m_device_run_work()
    v4l2_m2m_try_run()
      rkjpegd_device_run()
        rkjpegd_stop_at_change()

Because v4l2_m2m_device_run_work() runs without holding jpegd->vdev_lock,
and rkjpegd_stop_at_change() publishes:

	WRITE_ONCE(ctx->stopped_at_change, true);
	v4l2_event_queue_fh(&ctx->fh, &rkjpegd_src_change_event);

before removing and completing the capture buffer and finishing the m2m
job, a concurrent VIDIOC_DECODER_CMD(V4L2_DEC_CMD_START) ioctl in
rkjpegd_decoder_cmd() can observe READ_ONCE(ctx->stopped_at_change) =3D=3D =
true
while rkjpegd_stop_at_change() is still executing. rkjpegd_decoder_cmd()
will call rkjpegd_resume_at_change(ctx), clear last_buffer_dequeued, and
call v4l2_m2m_try_schedule() (which cannot schedule the job because
m2m_ctx->job_flags still has TRANS_QUEUED | TRANS_RUNNING set), after
which rkjpegd_stop_at_change() removes a capture buffer and completes it
with V4L2_BUF_FLAG_LAST and 0 payload after decoding has already resumed.

Additionally, even without multi-CPU preemption in
rkjpegd_stop_at_change(), vb2_dqbuf() sets q->last_buffer_dequeued =3D true
only when the buffer carrying V4L2_BUF_FLAG_LAST is dequeued from
done_list by VIDIOC_DQBUF on the capture queue, not when vb2_buffer_done()
is called in rkjpegd_last_buffer_done(). If userspace responds to
V4L2_EVENT_SOURCE_CHANGE by issuing VIDIOC_DECODER_CMD(V4L2_DEC_CMD_START)
in rkjpegd_decoder_cmd() or VIDIOC_STREAMOFF on the output queue in
rkjpegd_stop_streaming() before dequeuing the V4L2_BUF_FLAG_LAST buffer
from done_list, vb2_clear_last_buffer_dequeued() runs while
q->last_buffer_dequeued is still false. When that V4L2_BUF_FLAG_LAST
buffer is subsequently dequeued, vb2_dqbuf() sets
q->last_buffer_dequeued =3D true after stopped_at_change has already been
cleared, causing all later VIDIOC_DQBUF calls on the capture queue to fail
with -EPIPE.

[ ... ]

> +static int rkjpegd_release(struct file *filp)
> +{
> +	struct rkjpegd_ctx *ctx =3D file_to_rkjpegd_ctx(filp);
> +
> +	v4l2_fh_del(&ctx->fh, filp);
> +
> +	/* rkjpegd_remove() may be waiting on this context, under the lock. */
> +	scoped_guard(mutex, &ctx->dev->vdev_lock)
> +		v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	rkjpegd_vdpu720_exit(ctx);
> +	v4l2_fh_exit(&ctx->fh);
> +	kfree(ctx);
> +
> +	return 0;
> +}

[ ... ]

> +static void rkjpegd_vdev_unregister(struct rkjpegd_dev *jpegd)
> +{
> +	/* The release callback frees m2m_dev, which is still needed below. */
> +	get_device(&jpegd->vdev.dev);
> +
> +	scoped_guard(mutex, &jpegd->vdev_lock) {
> +		video_unregister_device(&jpegd->vdev);
> +
> +		/*
> +		 * Let the running job finish and start no new one.  The lock
> +		 * keeps rkjpegd_release() from freeing the context this waits
> +		 * on.
> +		 */
> +		v4l2_m2m_suspend(jpegd->m2m_dev);
> +	}

[ ... ]

> +/* pm_runtime_force_suspend() ignores the usage count, let the job finis=
h. */
> +static int rkjpegd_suspend(struct device *dev)
> +{
> +	struct rkjpegd_dev *jpegd =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	v4l2_m2m_suspend(jpegd->m2m_dev);
> +
> +	ret =3D pm_runtime_force_suspend(dev);
> +	if (ret)
> +		v4l2_m2m_resume(jpegd->m2m_dev);
> +
> +	return ret;
> +}

[Severity: High]
Should rkjpegd_suspend() in
drivers/media/platform/rockchip/rkjpegd/rkjpegd.c also hold
jpegd->vdev_lock around v4l2_m2m_suspend(), just like
rkjpegd_vdev_unregister() does?

Inside v4l2_m2m_suspend(), curr_ctx =3D m2m_dev->curr_ctx is read under
m2m_dev->job_spinlock, the spinlock is dropped, and the caller sleeps in:

	wait_event(curr_ctx->finished, !(curr_ctx->job_flags & TRANS_RUNNING));

If the last reference to the video file was dropped via deferred fput()
(for instance from a PF_KTHREAD worker, softirq, or do_exit() after
exit_task_work()), delayed_fput_work runs on system_wq (which is not
WQ_FREEZABLE) and calls:

  __fput()
    v4l2_release()
      rkjpegd_release()
        v4l2_m2m_ctx_release(ctx->fh.m2m_ctx)

Without jpegd->vdev_lock held in rkjpegd_suspend(), rkjpegd_release() can
acquire jpegd->vdev_lock, wait for the job in v4l2_m2m_cancel_job(), and
kfree() m2m_ctx while v4l2_m2m_suspend() is still accessing curr_ctx.

[ ... ]

=E5=AE=8C=E7=BE=8E =E2=80=94 wait, let me remove that non-English word at t=
he end! Let me rewrite the output cleanly.commit 4527476128adffa812e326dce7=
9f8f8daf9729ec
Author: Sascha Hauer <s.hauer@pengutronix.de>

media: rockchip: Add JPEG decoder driver

This commit adds a V4L2 mem2mem stateful JPEG decoder driver for the
Rockchip VDPU720 hardware block, supporting NV12 and GREY capture formats,
dynamic resolution changes, and hardware watchdog recovery.

> diff --git a/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c b/drivers/=
media/platform/rockchip/rkjpegd/rkjpegd.c
> new file mode 100644
> index 0000000000000..b33141c33ec38
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c

[ ... ]

> +/*
> + * Take up the format the decoder stopped at, from the capture queue bei=
ng
> + * restarted or V4L2_DEC_CMD_START.  No job runs while it is stopped.
> + */
> +static void rkjpegd_resume_at_change(struct rkjpegd_ctx *ctx)
> +{
> +	struct vb2_v4l2_buffer *src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	struct rkjpegd_src_buf *src_buf =3D vb2_to_rkjpegd_src_buf(&src->vb2_bu=
f);
> +
> +	rkjpegd_fill_hdr_fmt(&ctx->dst_fmt, &ctx->crop, &src_buf->header);
> +	src_buf->fmt_change =3D false;
> +	WRITE_ONCE(ctx->stopped_at_change, false);
> +}

[ ... ]

> +static int rkjpegd_decoder_cmd(struct file *file, void *priv,
> +			       struct v4l2_decoder_cmd *cmd)
> +{
> +	struct rkjpegd_ctx *ctx =3D file_to_rkjpegd_ctx(file);
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +	bool stopped;
> +	int ret;
> +
> +	ret =3D v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)))
> +		return 0;
> +
> +	/* Resumes after a format change, and leaves a drain alone. */
> +	if (cmd->cmd =3D=3D V4L2_DEC_CMD_START && READ_ONCE(ctx->stopped_at_cha=
nge)) {
> +		rkjpegd_resume_at_change(ctx);
> +		vb2_clear_last_buffer_dequeued(&ctx->fh.m2m_ctx->cap_q_ctx.q);
> +		v4l2_m2m_try_schedule(ctx->fh.m2m_ctx);
> +		return 0;
> +	}

[ ... ]

> +static void rkjpegd_irq_done(struct rkjpegd_dev *jpegd,
> +			     enum vb2_buffer_state state)
> +{
> +	/* A pending watchdog means a job is running, see rkjpegd_watchdog(). */
> +	if (cancel_delayed_work(&jpegd->watchdog_work))
> +		rkjpegd_job_finish(v4l2_m2m_get_curr_priv(jpegd->m2m_dev),
> +				   state);
> +}

[ ... ]

> +static void vdpu720_soft_reset(struct rkjpegd_dev *jpegd)
> +{
> +	u32 status;
> +
> +	/* Idle blocks want FORCE_SOFTRESET_VALID first, per downstream BSP. */
> +	status =3D rkjpegd_read(jpegd, VDPU720_REG_INT);
> +	if (!(status & VDPU720_DEC_E))
> +		rkjpegd_write(jpegd, VDPU720_FORCE_SOFTRST, VDPU720_REG_SYS);
> +
> +	rkjpegd_write(jpegd, status | VDPU720_SOFT_RST_EN, VDPU720_REG_INT);
> +
> +	if (readl_relaxed_poll_timeout(jpegd->regs + VDPU720_REG_INT, status,
> +				       status & VDPU720_SOFT_RST_RDY, 5, 10000))
> +		dev_warn(jpegd->dev, "soft reset timed out\n");
> +}
> +
> +/**
> + * rkjpegd_vdpu720_reset() - put the block back into a known state
> + * @ctx:	context the block is being reset on behalf of
> + *
> + * Reached from the watchdog, and from rkjpegd_vdpu720_run() for a block=
 the
> + * last job left unparked, see @rkjpegd_dev.needs_reset.  Sleeps, so it =
must
> + * not be called from the interrupt handler.
> + */
> +static void rkjpegd_vdpu720_reset(struct rkjpegd_ctx *ctx)
> +{
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +
> +	vdpu720_soft_reset(jpegd);
> +	rkjpegd_write(jpegd, 0, VDPU720_REG_INT);
> +
> +	jpegd->needs_reset =3D false;
> +}

[ ... ]

> +static irqreturn_t rkjpegd_vdpu720_irq(int irq, void *dev_id)
> +{
> +	struct rkjpegd_dev *jpegd =3D dev_id;
> +	enum vb2_buffer_state state;
> +	u32 status;
> +
> +	status =3D rkjpegd_read(jpegd, VDPU720_REG_INT);
> +
> +	/* First phase of the IRQ clear, see VDPU720_IRQ_CLR_KEEP. */
> +	rkjpegd_write(jpegd, status & VDPU720_IRQ_CLR_KEEP, VDPU720_REG_INT);
> +
> +	if (!(status & VDPU720_IRQ_RAW))
> +		return IRQ_NONE;
> +
> +	rkjpegd_write(jpegd, 0, VDPU720_REG_INT);
> +
> +	state =3D (status & VDPU720_ERR_MASK) ?
> +		VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
> +
> +	/*
> +	 * A block that did not park itself wedges on the next frame, and a
> +	 * clean frame can leave it unparked too, as SOFT_RST_RDY shows.  The
> +	 * reset sleeps, so leave it to rkjpegd_vdpu720_run().  The next job
> +	 * is only started after job_spinlock has released this one, which
> +	 * orders the store.
> +	 */
> +	if (state =3D=3D VB2_BUF_STATE_ERROR || !(status & VDPU720_SOFT_RST_RDY=
))
> +		jpegd->needs_reset =3D true;

[ ... ]

> +	rkjpegd_irq_done(jpegd, state);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void rkjpegd_watchdog(struct work_struct *work)
> +{
> +	struct rkjpegd_dev *jpegd =3D container_of(to_delayed_work(work),
> +						 struct rkjpegd_dev,
> +						 watchdog_work);
> +	/* Only armed while a job runs, so there is always a context. */
> +	struct rkjpegd_ctx *ctx =3D v4l2_m2m_get_curr_priv(jpegd->m2m_dev);
> +
> +	dev_err(jpegd->dev, "frame processing timed out\n");
> +
> +	rkjpegd_vdpu720_reset(ctx);
> +	rkjpegd_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +}

[Severity: High]
What prevents rkjpegd_watchdog() and rkjpegd_vdpu720_irq() in
drivers/media/platform/rockchip/rkjpegd/rkjpegd.c from racing if the
hardware raises an interrupt right as jpegd->watchdog_work expires?

Once the workqueue dequeues jpegd->watchdog_work to execute
rkjpegd_watchdog(), WORK_STRUCT_PENDING_BIT is cleared, so
cancel_delayed_work(&jpegd->watchdog_work) in rkjpegd_irq_done() no longer
serializes the two paths, and neither path holds a shared lock or disables
the IRQ.

First, in rkjpegd_watchdog() -> rkjpegd_vdpu720_reset() ->
vdpu720_soft_reset(), the driver writes status | VDPU720_SOFT_RST_EN to
VDPU720_REG_INT (without setting VDPU720_IRQ_DIS) and sleeps in
readl_relaxed_poll_timeout() waiting for VDPU720_SOFT_RST_RDY. If
rkjpegd_vdpu720_irq() runs concurrently, it writes 0 to VDPU720_REG_INT
(clearing VDPU720_SOFT_RST_EN and VDPU720_SOFT_RST_RDY) and sets
jpegd->needs_reset =3D true, after which vdpu720_soft_reset() times out and
rkjpegd_vdpu720_reset() unconditionally overwrites
jpegd->needs_reset =3D false.

Second, if rkjpegd_vdpu720_irq() is entered on another CPU for the
timed-out job (for example, while formatting the dev_warn_ratelimited()
diagnostics) while rkjpegd_watchdog() completes rkjpegd_vdpu720_reset()
and rkjpegd_job_finish(), the next queued job can start in
rkjpegd_vdpu720_run() and re-arm jpegd->watchdog_work via
rkjpegd_arm_watchdog(). When the first job's in-flight
rkjpegd_vdpu720_irq() then reaches rkjpegd_irq_done():

	if (cancel_delayed_work(&jpegd->watchdog_work))
		rkjpegd_job_finish(v4l2_m2m_get_curr_priv(jpegd->m2m_dev),
				   state);

it will cancel the new job's watchdog and call rkjpegd_job_finish() on the
newly started job while hardware DMA is still active on its buffers.

[ ... ]

> +/*
> + * Stop in front of a frame that decodes to another format: report it, a=
nd
> + * hand back a capture buffer as LAST to mark where the old format ends.=
  The
> + * event goes first, GStreamer looks for one before it dequeues a buffer.
> + */
> +static void rkjpegd_stop_at_change(struct rkjpegd_ctx *ctx,
> +				   struct vb2_v4l2_buffer *dst)
> +{
> +	struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
> +
> +	/* Set before the event, so that a query after it sees the change. */
> +	WRITE_ONCE(ctx->stopped_at_change, true);
> +	v4l2_event_queue_fh(&ctx->fh, &rkjpegd_src_change_event);
> +
> +	v4l2_m2m_dst_buf_remove(m2m_ctx);
> +	rkjpegd_last_buffer_done(ctx, dst);
> +	v4l2_m2m_job_finish(ctx->dev->m2m_dev, m2m_ctx);
> +}

[ ... ]

> +static void rkjpegd_stop_streaming(struct vb2_queue *vq)
> +{

[ ... ]

> +	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
> +		/* A seek aborts a format change, decoding goes on as before. */
> +		if (ctx->stopped_at_change) {
> +			WRITE_ONCE(ctx->stopped_at_change, false);
> +			vb2_clear_last_buffer_dequeued(&ctx->fh.m2m_ctx->cap_q_ctx.q);
> +		}
> +		rkjpegd_reset_queued(ctx);
> +	} else if (ctx->stopped_at_change) {

[Severity: High]
Can rkjpegd_stop_at_change() race with rkjpegd_decoder_cmd(), and can
vb2_clear_last_buffer_dequeued() be called before the V4L2_BUF_FLAG_LAST
buffer is actually dequeued in
drivers/media/platform/rockchip/rkjpegd/rkjpegd.c?

When a frame finishes decoding in rkjpegd_vdpu720_irq(),
v4l2_m2m_buf_done_and_job_finish() calls v4l2_m2m_schedule_next_job(),
which queues the next job (since rkjpegd_job_ready() only checks
!READ_ONCE(ctx->stopped_at_change)) and schedules m2m_dev->job_work:

  v4l2_m2m_device_run_work()
    v4l2_m2m_try_run()
      rkjpegd_device_run()
        rkjpegd_stop_at_change()

Because v4l2_m2m_device_run_work() runs without holding jpegd->vdev_lock,
and rkjpegd_stop_at_change() publishes:

	WRITE_ONCE(ctx->stopped_at_change, true);
	v4l2_event_queue_fh(&ctx->fh, &rkjpegd_src_change_event);

before removing and completing the capture buffer and finishing the m2m
job, a concurrent VIDIOC_DECODER_CMD(V4L2_DEC_CMD_START) ioctl in
rkjpegd_decoder_cmd() can observe READ_ONCE(ctx->stopped_at_change) =3D=3D =
true
while rkjpegd_stop_at_change() is still executing. rkjpegd_decoder_cmd()
will call rkjpegd_resume_at_change(ctx), clear last_buffer_dequeued, and
call v4l2_m2m_try_schedule() (which cannot schedule the job because
m2m_ctx->job_flags still has TRANS_QUEUED | TRANS_RUNNING set), after
which rkjpegd_stop_at_change() removes a capture buffer and completes it
with V4L2_BUF_FLAG_LAST and 0 payload after decoding has already resumed.

Additionally, even without multi-CPU preemption in
rkjpegd_stop_at_change(), vb2_dqbuf() sets q->last_buffer_dequeued =3D true
only when the buffer carrying V4L2_BUF_FLAG_LAST is dequeued from
done_list by VIDIOC_DQBUF on the capture queue, not when vb2_buffer_done()
is called in rkjpegd_last_buffer_done(). If userspace responds to
V4L2_EVENT_SOURCE_CHANGE by issuing VIDIOC_DECODER_CMD(V4L2_DEC_CMD_START)
in rkjpegd_decoder_cmd() or VIDIOC_STREAMOFF on the output queue in
rkjpegd_stop_streaming() before dequeuing the V4L2_BUF_FLAG_LAST buffer
from done_list, vb2_clear_last_buffer_dequeued() runs while
q->last_buffer_dequeued is still false. When that V4L2_BUF_FLAG_LAST
buffer is subsequently dequeued, vb2_dqbuf() sets
q->last_buffer_dequeued =3D true after stopped_at_change has already been
cleared, causing all later VIDIOC_DQBUF calls on the capture queue to fail
with -EPIPE.

[ ... ]

> +static int rkjpegd_release(struct file *filp)
> +{
> +	struct rkjpegd_ctx *ctx =3D file_to_rkjpegd_ctx(filp);
> +
> +	v4l2_fh_del(&ctx->fh, filp);
> +
> +	/* rkjpegd_remove() may be waiting on this context, under the lock. */
> +	scoped_guard(mutex, &ctx->dev->vdev_lock)
> +		v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	rkjpegd_vdpu720_exit(ctx);
> +	v4l2_fh_exit(&ctx->fh);
> +	kfree(ctx);
> +
> +	return 0;
> +}

[ ... ]

> +static void rkjpegd_vdev_unregister(struct rkjpegd_dev *jpegd)
> +{
> +	/* The release callback frees m2m_dev, which is still needed below. */
> +	get_device(&jpegd->vdev.dev);
> +
> +	scoped_guard(mutex, &jpegd->vdev_lock) {
> +		video_unregister_device(&jpegd->vdev);
> +
> +		/*
> +		 * Let the running job finish and start no new one.  The lock
> +		 * keeps rkjpegd_release() from freeing the context this waits
> +		 * on.
> +		 */
> +		v4l2_m2m_suspend(jpegd->m2m_dev);
> +	}

[ ... ]

> +/* pm_runtime_force_suspend() ignores the usage count, let the job finis=
h. */
> +static int rkjpegd_suspend(struct device *dev)
> +{
> +	struct rkjpegd_dev *jpegd =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	v4l2_m2m_suspend(jpegd->m2m_dev);
> +
> +	ret =3D pm_runtime_force_suspend(dev);
> +	if (ret)
> +		v4l2_m2m_resume(jpegd->m2m_dev);
> +
> +	return ret;
> +}

[Severity: High]
Should rkjpegd_suspend() in
drivers/media/platform/rockchip/rkjpegd/rkjpegd.c also hold
jpegd->vdev_lock around v4l2_m2m_suspend(), just like
rkjpegd_vdev_unregister() does?

Inside v4l2_m2m_suspend(), curr_ctx =3D m2m_dev->curr_ctx is read under
m2m_dev->job_spinlock, the spinlock is dropped, and the caller sleeps in:

	wait_event(curr_ctx->finished, !(curr_ctx->job_flags & TRANS_RUNNING));

If the last reference to the video file was dropped via deferred fput()
(for instance from a PF_KTHREAD worker, softirq, or do_exit() after
exit_task_work()), delayed_fput_work runs on system_wq (which is not
WQ_FREEZABLE) and calls:

  __fput()
    v4l2_release()
      rkjpegd_release()
        v4l2_m2m_ctx_release(ctx->fh.m2m_ctx)

Without jpegd->vdev_lock held in rkjpegd_suspend(), rkjpegd_release() can
acquire jpegd->vdev_lock, wait for the job in v4l2_m2m_cancel_job(), and
kfree() m2m_ctx while v4l2_m2m_suspend() is still accessing curr_ctx.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-rockchip-j=
pegdec-v7-0-3fd7dd55f408@pengutronix.de?part=3D2
