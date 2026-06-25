Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88AE32936C
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782395685; cv=none; b=dzG5IzSzAPHWMrREsSum2iarPOAduKJYh2ZOm3dpdu8ovASURClLy+PsUcpb9j0kQ6HdVZIY5Onxos7gTRWMAJGzaB5z8tFk3nGIyyyKe9Hg6Q7Bu3q0Kj9H39/haSeFsOieiWANZhto/91dyRZqDtVWR+gSPN6s/wajNSBW8iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782395685; c=relaxed/simple;
	bh=kU7dHmmpZ3UI+0up60OIsAh9/yaG7DoO5fgWgS405cU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U4mx8tCMROyh9saK7SMlf1j1o4VHLbkDJc4+msiydErV7/l+XW/y5U8Z+QXSrFt+Ranm48NLxTu4vyN4mLOd1EEnoRlzJ3fX3xWhf3OWqtCXt+9YVV9vTJNEVjPdDQ2RICMBCWNx4bumFCGOfgGSHW5sVXpdy/E31xu9ipZ5rkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTiVZ5us; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTiVZ5us"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA451F000E9;
	Thu, 25 Jun 2026 13:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782395683;
	bh=8MOnd04KcbgrDifloNdhPmyvKF3bx5kFmxx8En2HySw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TTiVZ5usPGnO+hOAkA+CpAJAlqEv4RjdUWOjDkgdz4LWlkt4LPjeoioSEedGVwmiI
	 kwcA9N3df1+zVawwK//UiJFKkRsYjA6CKaRnJTxOWZsz42CkNKjdX6IObYSDzBrAUs
	 JaxWWxzMvkWWqJWEvHXJ+qscciTEN60cduGcRSglIIvSQ1b/6N8TCVWZboop/3Wx5n
	 6v2n7IVSawbexXjNa0gmXz1G2q1G1ssVzFfIF/VAvGZEImy6KZve+N5EzRRy9WviR4
	 S4Hmn197E38NamCbJBYftDPpQ2zUg9heSIcotnZcdtKvjNDeUiG0/rzsy8HcvFsxd0
	 /NL8WHALtF5zA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] media: qcom: jpeg: Add Qualcomm JPEG V4L2
 encoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260625133828.3221781-4-atanas.filipov@oss.qualcomm.com>
References: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
 <20260625133828.3221781-4-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 13:54:42 +0000
Message-Id: <20260625135443.2CA451F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [High] Premature buffer return before stopping hardware DMA causes memory=
 corruption.
- [High] Hardware programmed with single scatterlist element despite `VIDEO=
BUF2_DMA_SG` configuration.
- [High] Use-After-Free of `qcom_jenc_dev` due to `devm_kzalloc` allocation.
- [High] Acquiring a sleeping mutex while holding a spinlock in `job_abort`=
 causes deadlock.
- [High] Use-After-Free of encoder context (`ectx`) between the threaded IR=
Q handler and file release.
- [High] Incorrect synchronization order schedules `finish_work` after `can=
cel_work_sync`, causing Use-After-Free.
- [High] Deadlock between the threaded IRQ handler and `stop_streaming` lea=
ds to unclocked hardware access.
- [High] DMA buffer overflow because `VIDIOC_CREATE_BUFS` bypasses header s=
ize padding.
- [Medium] Inverted logic for V4L2_BUF_FLAG_LAST marks the wrong buffers as=
 EOS and drops pending frames.
- [Medium] Race condition caused by `reinit_completion` occurring after a h=
ardware command.
- [Medium] Per-context tracking of DMI tables causes lost hardware updates =
in interleaved streams.
- [Medium] Concurrent read-modify-write on the `int_mask` hardware register=
 causes lost updates.
--

commit 28b8fe8e7d711888f653c3ed94bf36f5bc5799ac
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder

This commit adds a new Qualcomm JPEG encoder driver implemented on top of t=
he
V4L2 mem2mem framework. It handles vb2 queue handling, format negotiation,
JPEG header handling, interrupt-driven job completion, and runtime integrat=
ion
for the SM8250 standalone JPEG encode hardware block.

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c b/drivers/m=
edia/platform/qcom/jpeg/qcom_jenc_dev.c
> index 0000000000000..626cd6130d9bc
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
> @@ -0,0 +1,313 @@
[ ... ]
> +static int qcom_jpeg_probe(struct platform_device *pdev)
> +{
> +	const struct qcom_dev_resources *res;
> +	struct qcom_jenc_dev *jenc;
> +	int rc;
> +
> +	jenc =3D devm_kzalloc(&pdev->dev, sizeof(*jenc), GFP_KERNEL);

[Severity: High]
Can this lead to a use-after-free if the platform device is unbound while a
file descriptor remains open?

The jenc structure is allocated with devm_kzalloc here, tying its lifetime
to the platform device. However, fop_jpeg_file_release() dereferences jenc
upon file closure. If the device is unbound, devres will free the structure,
causing memory corruption when the file is later closed. V4L2 device state
should typically be tied to the video_device lifecycle using the release
callback.

> +	if (!jenc)
> +		return -ENOMEM;
[ ... ]
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c b/drivers/m=
edia/platform/qcom/jpeg/qcom_jenc_ops.c
> index 0000000000000..5553ba7571946
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
[ ... ]
> +static void jpeg_stop(struct qcom_jenc_dev *jenc)
> +{
> +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> +
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_HW_START, 0);
> +
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_RD_PLNS_QUEUE, JPEG_SET_U=
32);
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_RD_PLNS_QUEUE, JPEG_CLR_U=
32);
> +
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_WR_PLNS_QUEUE, JPEG_SET_U=
32);
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_WR_PLNS_QUEUE, JPEG_CLR_U=
32);
> +
> +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_STATUS_ALL_BITS, JPEG_SET_U3=
2);
> +	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_STATUS_ALL_BITS, JPEG_SET_U=
32);

[Severity: Medium]
Does a concurrent read-modify-write on the int_mask register drop mask
modifications?

jpeg_rw_bits() performs a non-atomic software read, modify, and write
sequence. jpeg_stop() modifies this register from the threaded IRQ handler
without locks, while jpeg_deinit() and jpeg_init() modify it holding
dev_mutex. This lack of synchronization allows interleaved operations to
silently drop mask updates.

> +}
> +
> +static int jpeg_deinit(struct qcom_jenc_dev *jenc)
> +{
> +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> +	unsigned long rtime;
> +
> +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_STATUS_ALL_BITS, JPEG_SET_U3=
2);
> +	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_STATUS_STOP_ACK, JPEG_SET_U=
32);
> +
> +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_HW_STOP, 1);
> +
> +	reinit_completion(&jenc->stop_complete);

[Severity: Medium]
Does reinitializing the completion after issuing the stop command create a
race condition?

If the hardware processes the stop command quickly and the STOP_ACK
interrupt fires before reinit_completion() executes, the completion will
be cleared. This would cause the subsequent wait_for_completion_timeout()
to block for the full duration and fail.

> +	rtime =3D wait_for_completion_timeout(&jenc->stop_complete,
> +					    msecs_to_jiffies(JPEG_STOP_TIMEOUT_MS));
> +	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_STATUS_ALL_BITS, JPEG_CLR_U=
32);
> +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_STATUS_ALL_BITS, JPEG_SET_U3=
2);
> +
> +	if (!rtime) {
> +		dev_err(jenc->dev, "encoder HW stop timeout\n");
> +		return -ETIME;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static int jpeg_apply_we_addr(struct jenc_context *ectx, struct qcom_jen=
c_queue *q,
> +			      struct vb2_buffer *vb)
> +{
> +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> +	struct qcom_jpeg_buff *frame =3D &q->buff[vb->index];
> +	void *mptr =3D vb2_plane_vaddr(vb, 0);
> +	dma_addr_t dma =3D frame->plns[0].dma;
> +	unsigned long flags;
> +	size_t header_size;
> +	int rc;
> +	u8 pln =3D 0;
> +
> +	if (WARN_ON_ONCE(!dma))
> +		return -EPERM;
> +
> +	if (WARN_ON_ONCE(!mptr))
> +		return -EPERM;
> +
> +	rc =3D jpeg_ensure_header_cache(ectx);
> +	if (rc)
> +		return rc;
> +
> +	/*
> +	 * Under quality_mutex: force a DQT refresh if the header was just
> +	 * (re)created (quality_programmed =3D=3D 0) or if quality changed since
> +	 * the last frame.  Both the cache update and the HW DMI upload are
> +	 * done here so that hdr_cache and the hardware are always in sync
> +	 * before jpeg_exec() fires.
> +	 */
> +	mutex_lock(&ectx->quality_mutex);
> +	if (!ectx->hdr_cache.size || ectx->quality_programmed !=3D ectx->qualit=
y_requested) {

[Severity: Medium]
Does optimizing the DMI table upload based on context-local tracking cause
issues for interleaved streams?

The mem2mem hardware is globally shared and soft-reset before each job. If
two contexts have different quality settings, checking only the local
quality_programmed will result in skipping the hardware upload. This causes
the frame to be encoded using the wrong or reset DMI tables.

> +		jpeg_update_dqt_cache(ectx);
> +		jpeg_upload_dmi_table(ectx);
> +	}
> +	mutex_unlock(&ectx->quality_mutex);
> +
> +	/*
> +	 * Invalidate stale CPU cache lines before writing the JPEG header
> +	 * with the CPU into the destination buffer.
> +	 */
> +	jpeg_sync_sg(jenc->dev, frame, DMA_BIDIRECTIONAL, false);
> +
> +	header_size =3D min_t(size_t, vb->planes[0].length, ectx->hdr_cache.siz=
e);
> +	header_size =3D qcom_jenc_header_emit(&ectx->hdr_cache, mptr,
> +					    (u32)header_size, (u16)q->vf.width,
> +					    (u16)q->vf.height);
> +
> +	dma +=3D header_size;

[Severity: High]
Will this cause an out-of-bounds DMA write?

When userspace specifies explicit buffer properties via VIDIOC_CREATE_BUFS,
an early return in bop_jpeg_vb2_queue_setup() skips the logic that adds
JPEG_HEADER_MAX to the allocated buffer size. During encoding, this base
pointer is shifted forward by the header size, causing the hardware to write
past the end of the allocated physical memory.

> +	qcom_jenc_dqts_emit(&ectx->hdr_cache, mptr);
[ ... ]
> +static int jpeg_store_we_next(struct jenc_context *ectx, struct vb2_buff=
er *vb2)
> +{
> +	struct qcom_jenc_queue *q =3D &ectx->bufq[TYPE2QID(vb2->type)];
> +	struct qcom_jpeg_buff *frame =3D &q->buff[vb2->index];
> +	struct sg_table *sgt;
> +	dma_addr_t dma;
> +
> +	sgt =3D vb2_dma_sg_plane_desc(vb2, 0);
> +	if (!sgt || !sgt->sgl)
> +		return -EINVAL;
> +
> +	dma =3D sg_dma_address(sgt->sgl);

[Severity: High]
Can this cause IOMMU faults or memory corruption?

The queue is configured with vb2_dma_sg_memops, allowing non-contiguous
physical buffers. However, only the first segment's base address is extract=
ed
via sg_dma_address() here. If the IOMMU splits a large frame into multiple
segments, the hardware is programmed with a single pointer and will linearly
overrun the first mapped IOVA segment into unrelated memory.

> +	if (!dma)
> +		return -EINVAL;
> +
> +	if (!vb2_plane_vaddr(vb2, 0))
> +		return -EINVAL;
> +
> +	frame->plns[0].sgt =3D sgt;
> +	frame->plns[0].dma =3D dma;
> +	frame->plns[0].size =3D vb2_plane_size(vb2, 0);
> +
> +	return 0;
> +}
[ ... ]
> +static irqreturn_t op_jpeg_irq_bot(int irq, void *data)
> +{
> +	struct qcom_jenc_dev *jenc =3D data;
> +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> +	u32 irq_status;
> +	u32 irq_mask;
> +	unsigned long flags;
> +
> +	irq_status =3D READ_ONCE(jenc->pending_irq_status);
> +
> +	irq_mask =3D jenc->res->hw_mask[JMSK_IRQ_STATUS_SESSION_DONE];
> +	if (jpeg_bits_get(irq_mask, irq_status)) {
> +		struct jenc_context *ctx;
> +
> +		spin_lock_irqsave(&jenc->hw_lock, flags);
> +		ctx =3D jenc->actx;
> +		jenc->actx =3D NULL;
> +		spin_unlock_irqrestore(&jenc->hw_lock, flags);

[Severity: High]
Is it possible for the context to be freed while the threaded IRQ handler
is still processing it?

Here the global jenc->actx pointer is cleared under a spinlock, but the
context is processed locally after dropping the lock. Concurrently, if the
file is closed, fop_jpeg_file_release() sees jenc->actx is already NULL and
proceeds to completely destroy and kfree() the context. This leads to a
use-after-free when the IRQ handler completes its callback below.

> +
> +		if (ctx && ctx->bufq[JENC_DST_QUEUE].buff_id >=3D 0) {
> +			struct qcom_jenc_queue *dq =3D &ctx->bufq[JENC_DST_QUEUE];
> +			struct qcom_jpeg_buff *frame =3D &dq->buff[dq->buff_id];
> +			size_t out_size =3D jpeg_io_read(jenc, offs->enc_out_size);
> +
> +			dev_dbg(jenc->dev, "complete idx:%d addr=3D0x%llx size=3D%zu\n",
> +				dq->buff_id, frame->plns[0].dma, out_size);
> +
> +			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_DONE,
> +					    out_size + ctx->hdr_cache.size);
> +		}
> +
> +		jpeg_stop(jenc);

[Severity: High]
Can this cause an ABBA deadlock?

When an encode finishes, the threaded IRQ handler executes but waits to
acquire dev_mutex in the callback. Concurrently, userspace closing the stre=
am
triggers bop_jpeg_vb2_stop_streaming(), which acquires dev_mutex and issues=
 a
stop command. The stop sequence waits for an interrupt, but the IRQ handler
is threaded with IRQF_ONESHOT, meaning the hardware IRQ line remains masked.
This leads to a timeout, after which the hardware clocks are disabled. The
IRQ handler then eventually resumes and writes to unclocked hardware
registers in jpeg_stop().

> +	}
[ ... ]
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c b/drivers/=
media/platform/qcom/jpeg/qcom_jenc_v4l2.c
> index 0000000000000..7c0af616fda8e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
[ ... ]
> +static void jpeg_v4l2_work_stop(struct jenc_context *ctx, enum vb2_buffe=
r_state buff_state)
> +{
> +	bool was_stopping =3D ctx->is_stopping;
> +	struct vb2_v4l2_buffer *vb;
> +
> +	ctx->is_stopping =3D false;
> +
> +	/*
> +	 * Drain the CAPTURE queue.  If a V4L2_ENC_CMD_STOP was in progress
> +	 * (was_stopping), signal EOS on the last CAPTURE buffer by calling
> +	 * v4l2_m2m_last_buffer_done() with a zero-length payload instead of
> +	 * returning it as an error.  All remaining buffers are returned with
> +	 * buff_state (DONE or ERROR depending on the call site).
> +	 *
> +	 * v4l2_m2m_last_dst_buf() returns true when the queue will be empty
> +	 * after the current remove, i.e. this is the last buffer.
> +	 */
> +	while ((vb =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx))) {
> +		if (was_stopping && !v4l2_m2m_last_dst_buf(ctx->fh.m2m_ctx)) {

[Severity: Medium]
Is the condition for checking the last destination buffer inverted?

Negating v4l2_m2m_last_dst_buf() causes every buffer except the last one
to be marked as EOS with a zero-length payload. The final buffer gets
standard processing. This drops pending frames and violates V4L2 API
compliance for V4L2_ENC_CMD_STOP.

> +			vb2_set_plane_payload(&vb->vb2_buf, 0, 0);
> +			v4l2_m2m_last_buffer_done(ctx->fh.m2m_ctx, vb);
> +		} else {
> +			v4l2_m2m_buf_done(vb, buff_state);
> +		}
> +	}
[ ... ]
> +static void bop_jpeg_vb2_stop_streaming(struct vb2_queue *q)
> +{
> +	struct jenc_context *ectx =3D vb2_get_drv_priv(q);
> +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> +	const struct qcom_jpeg_hw_ops *hw =3D jenc->res->hw_ops;
> +
> +	mutex_lock(&jenc->dev_mutex);
> +
> +	jpeg_v4l2_work_stop(ectx, VB2_BUF_STATE_ERROR);
> +
> +	if (ectx->hw_acquired) {
> +		hw->hw_release(ectx, q);

[Severity: High]
Does this code return buffers to userspace before the hardware DMA has been
explicitly stopped?

jpeg_v4l2_work_stop() drains the capture and output queues and returns all
buffers to userspace. However, the hardware encoder isn't explicitly stopped
until hw_release() is called afterward. This allows userspace to free or
reuse the memory while the DMA engine is still executing, leading to memory
corruption.

> +		ectx->hw_acquired =3D false;
> +	}
> +
> +	mutex_unlock(&jenc->dev_mutex);
> +}
[ ... ]
> +static void mop_jpeg_m2m_job_abort(void *priv)
> +{
> +	struct jenc_context *ectx =3D priv;
> +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> +
> +	mutex_lock(&jenc->dev_mutex);

[Severity: High]
Does this cause a deadlock by acquiring a sleeping mutex in an atomic
context?

The mem2mem framework invokes the job_abort callback while holding the
job_spinlock, an atomic context. Acquiring dev_mutex here violates the
invariant of not sleeping inside a spinlock-protected section.

> +
> +	jpeg_v4l2_work_stop(ectx, VB2_BUF_STATE_ERROR);
> +
> +	mutex_unlock(&jenc->dev_mutex);
> +}
[ ... ]
> +static int bop_jpeg_vb2_queue_setup(struct vb2_queue *vq, unsigned int *=
nbuffers,
> +				    unsigned int *plns_per_buff, unsigned int sizes[],
> +				    struct device *alloc_devs[])
> +{
> +	struct jenc_context *ectx =3D vb2_get_drv_priv(vq);
> +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> +	const struct qcom_jpeg_hw_ops *hw =3D jenc->res->hw_ops;
> +	struct qcom_jenc_queue *q;
> +	int pln;
> +
> +	q =3D hw->get_queue(ectx, TYPE2QID(vq->type));
> +	if (!q || !q->vf.num_planes)
> +		return -EINVAL;
> +
> +	if (*plns_per_buff) {
> +		if (*plns_per_buff !=3D q->vf.num_planes)
> +			return -EINVAL;
> +
> +		for (pln =3D 0; pln < q->vf.num_planes; ++pln) {
> +			if (sizes[pln] < q->vf.plane_fmt[pln].sizeimage)
> +				return -EINVAL;
> +		}
> +
> +		return 0;
> +	}
> +
> +	*plns_per_buff =3D q->vf.num_planes;
> +	for (pln =3D 0; pln < q->vf.num_planes; ++pln) {
> +		sizes[pln] =3D q->vf.plane_fmt[pln].sizeimage;
> +		dev_dbg(ectx->dev, "queue=3D%d size[%d]=3D%d\n", TYPE2QID(vq->type),
> +			pln, sizes[pln]);
> +	}
> +
> +	/*
> +	 * Reserve space for the JPEG header that the CPU writes into the
> +	 * CAPTURE buffer before the hardware DMA engine appends the bitstream.
> +	 * sizeimage covers the worst-case compressed bitstream; JPEG_HEADER_MAX
> +	 * is a separate, additional reservation for the header region.
> +	 */
> +	if (V4L2_TYPE_IS_CAPTURE(vq->type))
> +		sizes[0] +=3D JPEG_HEADER_MAX;
> +
> +	return hw->queue_setup(ectx, TYPE2QID(vq->type));
> +}
[ ... ]
> +static int fop_jpeg_file_release(struct file *file)
> +{
> +	struct jenc_context *ectx =3D jpeg_file2ctx(file);
> +	struct v4l2_m2m_dev *m2m_dev =3D ectx->fh.m2m_ctx->m2m_dev;
> +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> +	unsigned long flags;
> +
> +	/*
> +	 * Ensure the threaded IRQ handler cannot dereference this context
> +	 * after it is freed.  Clear jenc->actx under hw_lock before
> +	 * cancelling work and releasing the m2m context.
> +	 */
> +	spin_lock_irqsave(&jenc->hw_lock, flags);
> +	if (jenc->actx =3D=3D ectx)
> +		jenc->actx =3D NULL;
> +	spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +
> +	cancel_work_sync(&ectx->stop_work);
> +	cancel_work_sync(&ectx->finish_work);
> +
> +	v4l2_m2m_ctx_release(ectx->fh.m2m_ctx);

[Severity: High]
Does cancelling the work before calling v4l2_m2m_ctx_release() lead to a
use-after-free?

Releasing the m2m context cascades into stop_streaming and
jpeg_v4l2_work_stop(), which reschedules finish_work. Because the
cancellation barrier was already passed, the work is pushed to the system
queue and will execute after the context is freed via kfree() below.

> +	v4l2_m2m_put(m2m_dev);
> +	v4l2_ctrl_handler_free(&ectx->ctrl_hdl);
> +	v4l2_fh_del(&ectx->fh, file);
> +	v4l2_fh_exit(&ectx->fh);
> +	kfree(ectx);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625133828.3221=
781-1-atanas.filipov@oss.qualcomm.com?part=3D3
