Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82184402451
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782737170; cv=none; b=uCLNNzylC2eZfZ+gJN1nBC0tcu5qufQekKzafYzQTeMOThyamipQBtyGK4ozzH03vYJ5bKCWWOqjCIkqGTkXcRdwp82W8P/oYPS79gRduDHIhIQD2hTRJlU6ELcO1E08mquLt+kh3SfS/73MzyEpgzyaFo+8WiidvDiO2Nf1MOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782737170; c=relaxed/simple;
	bh=m96PPdQRt9WgCweyLIW/RHL4JQWWfJOnSKuXnnAdenU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kdOFLeTaXCndcbPQ0Gd2B9CxBDQvGiNX/h6AQyedOwmlz1r5nHjzUa7o2T5oyHiCehxUG1nxqmvURHWGyeTacwiBwPATGeBOqKCkhIPYfUB0vAIJvbkHIccu+/fnJ9szGGGM1gji41YGSYlXU18DVyPIVneI39j9rRf5FwdMa9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9e6tL5S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9e6tL5S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70B11F00A3A;
	Mon, 29 Jun 2026 12:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782737168;
	bh=syHBg/+DbrFBit8bl7OO2Vg/7D5djEfY1OpNF5j1aI0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O9e6tL5SNja6hrTB6ZAEHDJAFBPPXrTUBQu3lhLF9VXo5TJ0gkaUr6HNxCID26OGv
	 BNuqGPiakEZncKVzY9h6GGZa734ErfAtXrGJsa7DFV26DhoGTuo2yLQnGC+iEVt1Up
	 b53umw0izUdj+vCrNydSUvoqEOWiWtAEDFtl2MDAKkvrUIiyednZQm6r+a23t167fL
	 cE7ll7zGwZ1QFMmGXUMHl/hBWRb5VYyTFUtl39q+INQ1s9AM003tQAxvPelIJR9vfv
	 IfB07xYED4hFeu42PrzmoV0HgBqR1GMkgxENu2gs8q9PXYPs6tdmqYoQ3pl3hYYz9h
	 vnIs7ODTYzRig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] media: qcom: jpeg: Add Qualcomm JPEG V4L2
 encoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260629121750.3469292-5-atanas.filipov@oss.qualcomm.com>
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-5-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 12:46:07 +0000
Message-Id: <20260629124607.E70B11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [Critical] The top-half IRQ handler performs an unprotected MMIO read on =
a power-managed device without checking pm_runtime_get_if_active().
- [Critical] The device remove callback unbinds the driver without synchron=
izing with active M2M jobs, ioctls, or file releases, causing hardware acce=
sses to unmapped memory.
- [High] The driver fails to call v4l2_device_unregister() in the remove pa=
th, permanently leaking the device and m2m context.
- [High] Bidirectional DMA synchronization on capture buffers mapped as DMA=
_FROM_DEVICE violates the DMA API.
- [High] The driver enables vb2_dma_sg_memops but only programs the first S=
G segment's address into the hardware, causing linear DMA overruns on fragm=
ented buffers.
- [High] The driver returns active DMA buffers to userspace on STREAMOFF or=
 job abort without halting the hardware, risking memory corruption.
- [High] Missing synchronization between the threaded IRQ handler, workqueu=
e cancellation, and file release causes Use-After-Free during context teard=
own.
- [High] The threaded IRQ handler signals job completion before stopping th=
e hardware, creating a race where a newly started job is abruptly stopped m=
id-flight.
- [Medium] The driver fails to reinitialize the hardware when resuming an a=
ctive encoding session from system suspend.
- [Medium] The hardware write limit is set to the full buffer size, but the=
 start address is advanced by the header size, allowing the hardware to wri=
te past the end of the allocated DMA buffer.
- [Low] The driver calls non-existent macros and APIs (kzalloc_obj, v4l2_m2=
m_suspend, v4l2_m2m_resume), which will cause compilation to fail.
--

commit 86e68a88243e817a1f879ac5131b1a179ec73c9b
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder

This commit introduces a Qualcomm JPEG encoder driver based on the V4L2
mem2mem framework. It handles format negotiation, queue management, hardware
initialization, interrupt-driven encoding, and power management integration
for the SM8250 platform.

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c b/drivers/m=
edia/platform/qcom/jpeg/qcom_jenc_dev.c
> index c3573853f24ad..0000000000000
> --- a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
> @@ -152,6 +152,15 @@ static int qcom_jpeg_pm_resume(struct device *dev)
>  {
>  	struct qcom_jenc_dev *jenc =3D dev_get_drvdata(dev);
>  	int rc;
> =20
>  	rc =3D qcom_jpeg_icc_on(jenc);
>  	if (rc)
>  		return rc;
> =20
>  	rc =3D qcom_jpeg_clk_on(jenc);

[Severity: Medium]
Does the hardware need to be reinitialized after power loss? During suspend,
the hardware is forcefully powered down and loses internal register state.
This resume path restores clocks but skips the jpeg_init hardware reset
sequence, which might leave the hardware in an uninitialized state for
subsequent encode jobs.

>  	if (rc) {
>  		qcom_jpeg_icc_off(jenc);
>  		return rc;
>  	}
> =20
>  	return 0;
>  }
> =20
>  static int qcom_jpeg_suspend(struct device *dev)
>  {
>  	struct qcom_jenc_dev *jenc =3D dev_get_drvdata(dev);
>  	int rc;
> =20
>  	v4l2_m2m_suspend(jenc->m2m_dev);

[Severity: Low]
Is this calling an out-of-tree macro? The v4l2_m2m_suspend and
v4l2_m2m_resume APIs do not appear to exist in the standard Linux kernel and
will cause compilation to fail.

> =20
>  	rc =3D pm_runtime_force_suspend(dev);
>  	if (rc)
>  		v4l2_m2m_resume(jenc->m2m_dev);
> =20
>  	return rc;
>  }

[ ... ]

>  static int qcom_jpeg_probe(struct platform_device *pdev)
>  {
>  	const struct qcom_dev_resources *res;
>  	struct qcom_jenc_dev *jenc;
>  	int rc;
> =20
>  	jenc =3D kzalloc_obj(*jenc, GFP_KERNEL);

[Severity: Low]
Does kzalloc_obj exist in the upstream kernel? It appears to be an undefined
macro which will cause compilation to fail.

>  	if (!jenc)
>  		return -ENOMEM;

[ ... ]

>  static void qcom_jpeg_remove(struct platform_device *pdev)
>  {
>  	struct qcom_jenc_dev *jenc =3D platform_get_drvdata(pdev);
> =20
>  	/* v4l2_device_unregister() is called from the release callback. */
>  	qcom_jpeg_v4l2_unregister(jenc);
> =20
>  	dev_dbg(jenc->dev, "Qualcomm JPEG encoder deregistered\n");
>  }

[Severity: Critical]
Does this remove function properly synchronize with active hardware? If an
encode job is running or a file descriptor remains open when the module is
unloaded, devres will automatically unmap the hardware registers. When the
file is later closed, fop_jpeg_file_release will call jpeg_deinit and attem=
pt
to write to the unmapped registers, leading to a kernel panic. Should this
explicitly stop M2M jobs and wait for open file descriptors to close?

[Severity: High]
Is it safe to omit v4l2_device_unregister from the remove path? The comment
notes it is called from the release callback jenc_v4l2_dev_release, but the
v4l2_device reference count starts at 1 and is only decremented by
v4l2_device_unregister. If it is never called here, the refcount will never
reach zero, permanently leaking the device and m2m context.

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c b/drivers/m=
edia/platform/qcom/jpeg/qcom_jenc_ops.c
> index a34c87fc59ecd..0000000000000
> --- a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
> @@ -578,21 +578,22 @@ static irqreturn_t op_jpeg_irq_bot(int irq, void *d=
ata)
>  	irq_status =3D READ_ONCE(jenc->pending_irq_status);
> =20
>  	irq_mask =3D jenc->res->hw_mask[JMSK_IRQ_STATUS_SESSION_DONE];
>  	if (jpeg_bits_get(irq_mask, irq_status)) {
>  		struct jenc_context *ctx;
> =20
>  		spin_lock_irqsave(&jenc->hw_lock, flags);
>  		ctx =3D jenc->actx;
>  		jenc->actx =3D NULL;
>  		spin_unlock_irqrestore(&jenc->hw_lock, flags);

[Severity: High]
Can this race with fop_jpeg_file_release and cause a use-after-free?
The handler reads jenc->actx and drops the lock. If fop_jpeg_file_release
runs concurrently immediately after the lock is dropped, it will see
jenc->actx is NULL, bypass cancellation, and free the context memory. The I=
RQ
handler would then access the freed ctx in enc_hw_irq_cb.

> =20
>  		if (ctx && ctx->bufq[JENC_DST_QUEUE].buff_id >=3D 0) {
>  			struct qcom_jenc_queue *dq =3D &ctx->bufq[JENC_DST_QUEUE];
>  			struct qcom_jpeg_buff *frame =3D &dq->buff[dq->buff_id];
>  			size_t out_size =3D jpeg_io_read(jenc, offs->enc_out_size);
> =20
>  			dev_dbg(jenc->dev, "complete idx:%d addr=3D%pad size=3D%zu\n",
>  				dq->buff_id, &frame->plns[0].dma, out_size);
> =20
>  			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_DONE,
>  					    out_size + ctx->hdr_cache.size);
>  		}
> =20
>  		jpeg_stop(jenc);
>  	}

[Severity: High]
Does signalling completion before stopping the hardware introduce a race
condition? The enc_hw_irq_cb callback signals v4l2_m2m_job_finish, which
can instantly trigger the V4L2 framework to run the next queued job on
another CPU. If the new job starts the hardware, this subsequent jpeg_stop
call could erroneously halt the newly started job mid-flight.

[ ... ]

> @@ -641,12 +641,13 @@ static int jpeg_apply_we_addr(struct jenc_context *=
ectx, struct qcom_jenc_queue *q,
>  	mutex_unlock(&ectx->quality_mutex);
> =20
>  	/*
>  	 * Invalidate stale CPU cache lines before writing the JPEG header
>  	 * with the CPU into the destination buffer.
>  	 */
>  	jpeg_sync_sg(jenc->dev, frame, DMA_BIDIRECTIONAL, false);

[Severity: High]
Does using DMA_BIDIRECTIONAL here violate the DMA API? The destination
capture queue is typically mapped as DMA_FROM_DEVICE. Supplying a direction
to sync helpers that does not match the original mapping direction leads to
incorrect cache maintenance operations and potential silent memory corrupti=
on
on non-coherent architectures.

> =20
>  	header_size =3D min_t(size_t, vb->planes[0].length, ectx->hdr_cache.siz=
e);
>  	header_size =3D qcom_jenc_header_emit(&ectx->hdr_cache, mptr,
>  					    (u32)header_size, (u16)q->vf.width,
>  					    (u16)q->vf.height);
> =20
>  	dma +=3D header_size;
>  	qcom_jenc_dqts_emit(&ectx->hdr_cache, mptr);
> =20
>  	/*
>  	 * Flush CPU writes to the header before handing the buffer to the
>  	 * hardware DMA engine.
>  	 */
>  	jpeg_sync_sg(jenc->dev, frame, DMA_BIDIRECTIONAL, true);
> =20
>  	jpeg_io_write(jenc, offs->we.pntr[pln], dma);

[Severity: Medium]
Could advancing the DMA base address by header_size allow the hardware to
write past the end of the allocated DMA buffer? The hardware write limit
is set to the full buffer size (see jpeg_setup_we_size below). By shifting
the start address forward without reducing the maximum hardware output size
by the same amount, the allowed write window extends past the end of the
mapping.

[ ... ]

> @@ -693,12 +693,13 @@ static int jpeg_store_we_next(struct jenc_context *=
ectx, struct vb2_buffer *vb2)
>  {
>  	struct qcom_jenc_queue *q =3D &ectx->bufq[TYPE2QID(vb2->type)];
>  	struct qcom_jpeg_buff *frame =3D &q->buff[vb2->index];
>  	struct sg_table *sgt;
>  	dma_addr_t dma;
> =20
>  	sgt =3D vb2_dma_sg_plane_desc(vb2, 0);
>  	if (!sgt || !sgt->sgl)
>  		return -EINVAL;
> =20
>  	dma =3D sg_dma_address(sgt->sgl);

[Severity: High]
Will the hardware correctly handle fragmented memory here? The queue is
configured with vb2_dma_sg_memops, allowing buffers to be physically
fragmented across multiple scatterlist entries. However, the driver only
extracts sg_dma_address for the first element. If the buffer is fragmented,
the hardware will linearly overrun the end of the first segment and corrupt
adjacent physical memory.

>  	if (!dma)
>  		return -EINVAL;

[ ... ]

> @@ -711,9 +711,10 @@ static int jpeg_setup_we_size(struct jenc_context *e=
ctx, struct qcom_jenc_queue
>  {
>  	struct qcom_jenc_dev *jenc =3D ectx->jenc;
>  	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
>  	struct v4l2_pix_format_mplane *dfmt =3D &q->vf;
>  	u8 pln;
> =20
>  	for (pln =3D 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
>  		jpeg_rw_bits(jenc, offs->we.stride[pln], JMSK_PLNS_WR_STRIDE, 0);
> =20
>  	jpeg_io_write(jenc, offs->we.bsize[0], dfmt->plane_fmt[0].sizeimage);

(Related to the DMA bounds observation above: the hardware maximum bound is
set to the full sizeimage without taking the header offset into account).

[ ... ]

> @@ -1016,13 +1016,14 @@ static irqreturn_t op_jpeg_irq_top(int irq, void =
*data)
>  {
>  	struct qcom_jenc_dev *jenc =3D data;
>  	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
>  	unsigned long flags;
>  	u32 irq_status;
>  	u32 irq_mask;
> =20
>  	spin_lock_irqsave(&jenc->hw_lock, flags);
> =20
>  	irq_status =3D jpeg_io_read(jenc, offs->int_status);

[Severity: Critical]
Is it possible for this interrupt handler to run while the device is
suspended? This accesses the int_status hardware register without using
pm_runtime_get_if_active to verify that the power domain and clocks are
enabled. If a spurious or delayed interrupt fires while suspended, this
access will cause a fatal bus hang.

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c b/drivers/=
media/platform/qcom/jpeg/qcom_jenc_v4l2.c
> index 20f698f77acfe..0000000000000
> --- a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
> @@ -835,13 +835,14 @@ static const struct vb2_ops qcom_jpeg_v4l2_vb2_ops =
=3D {
>  	.stop_streaming		=3D bop_jpeg_vb2_stop_streaming,
>  };
> =20
>  static void mop_jpeg_m2m_job_abort(void *priv)
>  {
>  	struct jenc_context *ectx =3D priv;
>  	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> =20
>  	mutex_lock(&jenc->dev_mutex);
> =20
>  	jpeg_v4l2_work_stop(ectx, VB2_BUF_STATE_ERROR);
> =20
>  	mutex_unlock(&jenc->dev_mutex);
>  }

[Severity: High]
Does this abort sequence correctly stop the executing hardware? The
jpeg_v4l2_work_stop function systematically unqueues all buffers and returns
them to userspace, but the driver never sends a stop command to the hardwar=
e.
The executing hardware context could continue running asynchronously and DMA
encoded data into buffers that have already been returned to userspace.

[ ... ]

> @@ -996,10 +996,11 @@ static int jpeg_v4l2_init_queue(void *priv, struct =
vb2_queue *sq, struct vb2_queue
> =20
>  	sq->drv_priv		=3D ectx;
>  	sq->dev			=3D ectx->dev;
>  	sq->type		=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>  	sq->io_modes		=3D VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>  	sq->buf_struct_size	=3D sizeof(struct v4l2_m2m_buffer);
>  	sq->ops			=3D &qcom_jpeg_v4l2_vb2_ops;
>  	sq->mem_ops		=3D &vb2_dma_sg_memops;

(Related to the DMA fragmentation observation earlier: the queue is explici=
tly
configured here to allow scattered memory allocations).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629121750.3469=
292-1-atanas.filipov@oss.qualcomm.com?part=3D4
