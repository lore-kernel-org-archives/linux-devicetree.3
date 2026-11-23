Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449421;
	b=NB1rafD2quVGYGy1+8AD3IjldOoqDNSKi7WZPzBOwxWUOvWFYIKsbuThd5FjHCUM3w8x
	 guCnrl1s8Snj8dfGU7IsYK4oFoJFb/WHCOZ7Ft88bfCWBYuC0FPsxevnW7wRDrfMtZgyk
	 fA3Z4znBvD7jTPHVOu4bFS3d7JtgYfPDAoYK62S9Qy877ThDsMWs/YKcYL6hP/Z47H68f
	 X5KbIapNekDfl69/xRoKFh0PQQ4oBvuQOAAnRuNM2edrpci+NoP8QA7QbHTZ79twDKjkc
	 Yyk31CfgMc2WQerfj/FMzunE+i+s5OI2AGUx8M6IBY1cJTQMmOtX6VL0kGK0ye4Wiew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449421;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=61fi01KAm9ypNij5A9AEGjV2SnLBgg55Eroty9lOb0w=;
	b=NPqAWuBkU4vkQuuN3+mHS/wEdj6EtkV/YGlMhXVxJWCx+C1e6ZXtIqFjyXAcRJ/XR+Dr
	 qyKkVmKN75NpRnc8x/EVqP/r+HpGQXnX73/ughtyHno0uS48aN4WWetg+lkl+J+pHf9Gc
	 6W9S5sagbA+GovEH4Fc8NxTmIq2qn5DjtFgbsIByJn9QaJqS7ek1p2/h94MTWql/3Okz9
	 rLNk3ENRMVUI/sKdMK9vcRFpz+O4lHfoZHNxDAgCusoCR+KQaiA037NZjdu0V9jdC/xI7
	 CYZJ57sJJY/hVTWElPS+H9mwn5Mv+nShotsNvUZ9cq2Tal3iREMtHiT6md9TJWp05mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cv4C6L75;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AAE606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cv4C6L75
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E14E1F000C6;
	Mon, 23 Nov 2026 15:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449420;
	bh=61fi01KAm9ypNij5A9AEGjV2SnLBgg55Eroty9lOb0w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cv4C6L759xMdzXup5ZFyBXUqQHLCskZfqiRpnZunBkZi4qNTLhlDBlcnq05lGqRda
	 C/EUKeiEBOOBFBryjKgWil+ay7ZwoGRd2/h2HIz4TAOuT9gQVnqAuDP/MFroI6uXoJ
	 Io4j6oB76L4bqVWP07XnwE2B9g9DWdbGTySKi3ToSJobbd9C6sqWFUUeh8uC49E7Ia
	 8TX3j3oMlOX4NLCF0icgt3hGWBovj6GZeeJ1fFNhPmtrHmqAhzDv5yYJinp2UIne8R
	 2khM3DsHSPK3v9ajTpqxp6dzoYlZ3+/mS8iI9fjAHeqIiR0BD6DrcY/484Q7eTrE97
	 h2STYvfJxqwiA==
Message-ID: <sashiko-outbox-229627@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/4] media: rockchip: Add JPEG decoder driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261123-rockchip-jpegdec-v8-2-3316cd31b043@pengutronix.de>
References: <20261123-rockchip-jpegdec-v8-0-3316cd31b043@pengutronix.de>
 <20261123-rockchip-jpegdec-v8-2-3316cd31b043@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:56:59 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] media: rockchip: rkjpegd: race and early flag clear in
  rkjpegd_stop_at_change()
- [High] media: rockchip: rkjpegd: missing vdev_lock and work sync in
  rkjpegd_suspend()
- [High] media: rockchip: rkjpegd: race between rkjpegd_watchdog() and
  rkjpegd_vdpu720_irq()
- [Medium] media: rockchip: rkjpegd: missing EOS event in
  rkjpegd_stop_streaming()
- [Medium] media: rockchip: rkjpegd: stale draining state across stream
  stop
- [Medium] media: rockchip: rkjpegd: rkjpegd_track_fmt() clobbers
  negotiated format
--

commit b2f1b48c77bd5e7b91c91e6a3d7b73159e4ded9c
Author: Sascha Hauer <s.hauer@pengutronix.de>

media: rockchip: Add JPEG decoder driver

This commit adds a V4L2 M2M stateful JPEG decoder driver for the Rockchip
VDPU720 hardware block found on SoCs such as the RK3568 and RK3588.

> diff --git a/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c b/drivers/=
media/platform/rockchip/rkjpegd/rkjpegd.c
> new file mode 100644
> index 0000000000000..21cc08c0d4672
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c
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
> +
> +	if (status & VDPU720_DEC_ERR) {
> +		u32 mcu_pos  =3D rkjpegd_read(jpegd, VDPU720_REG_DBG_MCU_POS);
> +		u32 err_info =3D rkjpegd_read(jpegd, VDPU720_REG_DBG_ERROR);
> +
> +		dev_warn_ratelimited(jpegd->dev,
> +				     "decode error: MCU pos=3D(%u,%u) flags=3D0x%04x [%s%s%s%s%s%s%s=
%s%s%s] first_idx=3D%u\n",
> +				     (u32)FIELD_GET(VDPU720_DBG_MCU_POS_X, mcu_pos),
> +				     (u32)FIELD_GET(VDPU720_DBG_MCU_POS_Y, mcu_pos),
> +				     (u32)FIELD_GET(VDPU720_DERR_FLAGS, err_info),
> +				     (err_info & VDPU720_DERR_DRI_SEQ)     ? "dri_seq "    : "",
> +				     (err_info & VDPU720_DERR_STREAM_FFFF) ? "ffff "       : "",
> +				     (err_info & VDPU720_DERR_OTHER_MARK)  ? "bad_mark "   : "",
> +				     (err_info & VDPU720_DERR_MCU_CNT_L)   ? "dri_early "  : "",
> +				     (err_info & VDPU720_DERR_MCU_CNT_M)   ? "dri_late "   : "",
> +				     (err_info & VDPU720_DERR_EOI_NO_END)  ? "eoi_early "  : "",
> +				     (err_info & VDPU720_DERR_END_NO_EOI)  ? "no_eoi "     : "",
> +				     (err_info & VDPU720_DERR_OVERFLOW)    ? "overflow "   : "",
> +				     (err_info & VDPU720_DERR_HUFF_EMPTY)  ? "huff_empty " : "",
> +				     (err_info & (VDPU720_DERR_STREAM_R0 |
> +						  VDPU720_DERR_STREAM_R1)) ? "stream_mark " : "",
> +				     (u32)FIELD_GET(VDPU720_DERR_FIRST_IDX, err_info));
> +
> +		rkjpegd_write(jpegd, err_info, VDPU720_REG_DBG_ERROR);
> +	} else if (state =3D=3D VB2_BUF_STATE_ERROR) {
> +		dev_warn_ratelimited(jpegd->dev, "decode error: status 0x%08x\n",
> +				     status);
> +	}
> +
> +	/* A pending watchdog means a job is running, see rkjpegd_watchdog(). */
> +	if (cancel_delayed_work(&jpegd->watchdog_work))
> +		rkjpegd_job_finish(v4l2_m2m_get_curr_priv(jpegd->m2m_dev),
> +				   state);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/*
> + * The block ends a stalled job itself, TIMEOUT_E raises an interrupt af=
ter
> + * 2^24 idle cycles.  This only fires for a block that stopped answering
> + * altogether, whose interrupt will not come now either.
> + */
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
Can rkjpegd_watchdog() and rkjpegd_vdpu720_irq() race when the watchdog
expires around the same time an interrupt fires?

Once the workqueue dequeues watchdog_work, cancel_delayed_work() in
rkjpegd_vdpu720_irq() returns false without waiting for rkjpegd_watchdog(),
and nothing serializes the two paths:

CPU0 (<hardirq>)                  CPU1 (kworker)
rkjpegd_vdpu720_irq()             rkjpegd_watchdog()
  /* job 1 IRQ */                   rkjpegd_vdpu720_reset()
  dev_warn_ratelimited(...)         rkjpegd_job_finish() /* job 1 */
                                      ...
                                      rkjpegd_vdpu720_run() /* job 2 */
                                        rkjpegd_arm_watchdog()
  cancel_delayed_work(...)
    /* cancels job 2's watchdog */
  rkjpegd_job_finish()
    /* completes job 2 during DMA */

In addition, if rkjpegd_vdpu720_irq() runs while vdpu720_soft_reset() is
polling VDPU720_REG_INT, the interrupt handler writes 0 to VDPU720_REG_INT
(clearing VDPU720_SOFT_RST_EN) and sets jpegd->needs_reset =3D true, after
which rkjpegd_vdpu720_reset() times out and overwrites
jpegd->needs_reset =3D false.

> +
> +/**
> + * rkjpegd_track_fmt() - find where the capture format changes
> + * @ctx:	context the coded buffer belongs to
> + * @src_buf:	coded buffer being queued
> + *
> + * The first frame queued while the capture queue is stopped sets the ca=
pture
> + * format and reports it.  A refused one has no format, but an applicati=
on
> + * waits for the event either way, so it gets it for the format as it st=
ands.
> + * A later frame that decodes to another format is marked, and the decod=
er
> + * stops in front of it, see rkjpegd_stop_at_change().
> + */
> +static void rkjpegd_track_fmt(struct rkjpegd_ctx *ctx,
> +			      struct rkjpegd_src_buf *src_buf)
> +{
> +	const struct v4l2_jpeg_header *hdr =3D &src_buf->header;
> +	struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
> +	u32 pixelformat;
> +
> +	src_buf->fmt_change =3D false;
> +
> +	if (!vb2_is_streaming(v4l2_m2m_get_dst_vq(m2m_ctx)) &&
> +	    !v4l2_m2m_num_src_bufs_ready(m2m_ctx)) {
> +		if (!src_buf->parse_error) {
> +			rkjpegd_set_hdr_fmt(ctx, hdr);
> +			rkjpegd_reset_queued(ctx);
> +		}
> +		v4l2_event_queue_fh(&ctx->fh, &rkjpegd_src_change_event);
> +		return;
> +	}

[Severity: Medium]
Does this branch reset ctx->dst_fmt and ctx->convert even when
ctx->hdr_known is already true and the format has not changed?

If userspace negotiates V4L2_PIX_FMT_NV12 for a 4:2:2 stream (setting
ctx->convert =3D true and allocating NV12 capture buffers) and later stops
and restarts streaming when no output buffers are ready, queuing the next
4:2:2 output buffer enters this branch.  rkjpegd_set_hdr_fmt() then resets
ctx->convert =3D false and overwrites ctx->dst_fmt back to V4L2_PIX_FMT_NV1=
6,
causing rkjpegd_buf_prepare() to reject the already-allocated NV12 capture
buffers with -EINVAL and queuing a spurious V4L2_EVENT_SOURCE_CHANGE.

[ ... ]

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

[Severity: High]
Can rkjpegd_stop_at_change() race with rkjpegd_decoder_cmd() when
rkjpegd_device_run() runs from m2m_dev->job_work without jpegd->vdev_lock?

When a previous frame finishes in rkjpegd_vdpu720_irq(),
v4l2_m2m_buf_done_and_job_finish() schedules m2m_dev->job_work, which
invokes rkjpegd_device_run() -> rkjpegd_stop_at_change() without holding
jpegd->vdev_lock.  As soon as stopped_at_change and
V4L2_EVENT_SOURCE_CHANGE are published, userspace can issue
V4L2_DEC_CMD_START on another CPU before rkjpegd_stop_at_change() finishes:

CPU0 (kworker)                    CPU1 (ioctl)
rkjpegd_stop_at_change()
  stopped_at_change =3D true
  v4l2_event_queue_fh(...)
                                  rkjpegd_decoder_cmd(V4L2_DEC_CMD_START)
                                    rkjpegd_resume_at_change()
                                      src_buf->fmt_change =3D false
                                      stopped_at_change =3D false
                                    v4l2_m2m_try_schedule()
                                      /* skipped: TRANS_RUNNING set */
  v4l2_m2m_dst_buf_remove()
  rkjpegd_last_buffer_done()      <-- completes dst as V4L2_BUF_FLAG_LAST
                                      after resume
  v4l2_m2m_job_finish()

Separately, calling vb2_clear_last_buffer_dequeued() in
rkjpegd_decoder_cmd() (or in rkjpegd_stop_streaming() on the output queue)
before userspace has dequeued that V4L2_BUF_FLAG_LAST buffer from done_list
clears last_buffer_dequeued while it is still false; when userspace later
dequeues the V4L2_BUF_FLAG_LAST buffer, vb2_dqbuf() sets
last_buffer_dequeued =3D true and fails all subsequent capture dequeues with
-EPIPE.

[ ... ]

> +	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
> +		/* A seek aborts a format change, decoding goes on as before. */
> +		if (ctx->stopped_at_change) {
> +			WRITE_ONCE(ctx->stopped_at_change, false);
> +			vb2_clear_last_buffer_dequeued(&ctx->fh.m2m_ctx->cap_q_ctx.q);
> +		}
> +		rkjpegd_reset_queued(ctx);
> +	} else if (ctx->stopped_at_change) {
> +		/*
> +		 * Part of the format change, which does not abort a drain:
> +		 * dev-decoder.rst has the drain go on once it is handled.
> +		 */
> +		rkjpegd_resume_at_change(ctx);
> +		return;
> +	}

[Severity: Medium]
Can returning early here without calling
v4l2_m2m_update_stop_streaming_state() leave m2m_ctx->is_draining and
m2m_ctx->next_buf_last stuck at true when both queues are stopped?

If a drain is active when the decoder stops at a format change and
userspace stops the capture queue first, this branch clears
ctx->stopped_at_change and skips v4l2_m2m_update_stop_streaming_state(),
leaving m2m_ctx->is_draining set while the capture queue is not streaming
(the same state can be reached if V4L2_DEC_CMD_STOP is called in
rkjpegd_decoder_cmd() while the capture queue is not streaming).  If
userspace then stops the output queue as well,
v4l2_m2m_update_stop_streaming_state() on the output queue sees
is_draining =3D=3D true with no ready capture buffer and sets
m2m_ctx->next_buf_last =3D true.  When streaming is later restarted, the
first capture buffer queued in rkjpegd_buf_queue() hits
v4l2_m2m_dst_buf_is_last() and terminates the new stream immediately.

> +
> +	v4l2_m2m_update_stop_streaming_state(ctx->fh.m2m_ctx, vq);
> +}

[Severity: Medium]
Should rkjpegd_stop_streaming() queue rkjpegd_eos_event when
v4l2_m2m_update_stop_streaming_state() marks the decoder stopped?

When the output queue stops streaming while a drain is in progress and a
capture buffer is already on rdy_queue,
v4l2_m2m_update_stop_streaming_state() completes that capture buffer with
V4L2_BUF_FLAG_LAST and sets m2m_ctx->has_stopped =3D true, so
rkjpegd_buf_queue() will not run later to queue V4L2_EVENT_EOS.

[ ... ]

> +/* pm_runtime_force_suspend() ignores the usage count, let the job finis=
h. */
> +static int rkjpegd_suspend(struct device *dev)
> +{
> +	struct rkjpegd_dev *jpegd =3D dev_get_drvdata(dev);
> +
> +	v4l2_m2m_suspend(jpegd->m2m_dev);
> +
> +	return pm_runtime_force_suspend(dev);
> +}

[Severity: High]
Does rkjpegd_suspend() need jpegd->vdev_lock around v4l2_m2m_suspend() and
cancel_delayed_work_sync(&jpegd->watchdog_work) before
pm_runtime_force_suspend(), as rkjpegd_vdev_unregister() does?

v4l2_m2m_suspend() reads m2m_dev->curr_ctx under job_spinlock, drops the
spinlock, and waits on curr_ctx->finished.  Without jpegd->vdev_lock, a
concurrent rkjpegd_release() (for example from delayed_fput_work) can free
m2m_ctx while v4l2_m2m_suspend() is about to wait on it:

CPU0                              CPU1
rkjpegd_suspend()                 rkjpegd_release()
  v4l2_m2m_suspend()
    curr_ctx =3D m2m_dev->curr_ctx
                                    mutex_lock(&jpegd->vdev_lock)
                                    v4l2_m2m_ctx_release(m2m_ctx)
                                      kfree(m2m_ctx)
    wait_event(curr_ctx->finished, ...)
                                  <-- use-after-free

Without cancel_delayed_work_sync(&jpegd->watchdog_work), an in-flight
rkjpegd_watchdog() can also touch device registers after
pm_runtime_force_suspend() disables the clocks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-rockchip-j=
pegdec-v8-0-3316cd31b043@pengutronix.de?part=3D2
