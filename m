Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B813911C6
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 20:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781295789; cv=none; b=XaZb3+iXn+D4Z+nl2ZckTcoeVmg4cghpa2XvhQmJtOEvwgf8VgYqHrKOREigqQ1vdDndwWu2jaIAPtR58cm8Kn3yFuYTKBhNVI6l3D5bJBYE7ogTp2Yc9xAbrzpIT+KjmuO7xXtgOqq//JfTwVo+0uZa3vHfyLu1cWpVYcNBIF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781295789; c=relaxed/simple;
	bh=dBLwQI/S/Mnzu6a5krFIbnbAVsC87u9RNj1yRAcOjaI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pMEcIDBm/354ZTxYQuY3kKfdkwfqLeSy484Wnk28Z5E03NdVS1mseIqjk85YXk8GwPNPQ2CAc7Cdhk/113Le8GAc48fO15dvY3l3+vBRRv2/h6aDeBRTAQVnxNc0W84dDSb9hOOoGVllBRclZm8mIcFv0aMUnZvHEGDQT2W1DAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMxIYq0L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMxIYq0L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8D11F000E9;
	Fri, 12 Jun 2026 20:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781295787;
	bh=hhRG6oG7diCasmFBYL3B2pvjY4eq7pLDLE5urq73rxg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VMxIYq0LdnpVPDZKB2WxDf1TFC4QfznKt4018+G/C9lSP7O001dtXl3xBkS26TK80
	 mg2qYAou+q8iIJHlLnKHYi5YxxETm4XlOJLBN1GAg7dKUA2S7GFPDRLwwM/tJ4D8aL
	 0mGbZZMLi4t+b65ESKE66i4mUp93u7xd7dEr/WfGQ+uoL+xhb9gKzvgedGGlT0cCMJ
	 YUIj0Jy2qovVaonaAccikKAxQhnAga0Dpiyx38PoJnwJL7sY0Qc+qfVz4nDE3ZlITw
	 AIJnmUcs4omvCpUqFtUcPE5nEX2ZQcrAM3I5enI1Ac3ujVVohCaFnbCRUYiHnLcSHS
	 +/wyCNioGuNkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/4] media: qcom: jpeg: Add Qualcomm JPEG V4L2
 encoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260612194417.1737009-5-atanas.filipov@oss.qualcomm.com>
References: <20260612194417.1737009-5-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 20:23:06 +0000
Message-Id: <20260612202306.DD8D11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 14 potential issue=
(s) to consider:
- [High] The hardware is programmed with a single DMA base address per plan=
e, silently assuming the mapping is always contiguous, but the driver utili=
zes `VIDEOBUF2_DMA_SG`.
- [High] Active DMA buffers are unconditionally returned to userspace durin=
g stop or abort operations without halting the hardware, causing use-after-=
free and DMA memory corruption.
- [High] The IRQ handler accesses hardware registers without verifying the =
device's power state, triggering a fatal bus error upon receiving a spuriou=
s interrupt during runtime suspend.
- [High] Synchronizing capture buffers with `DMA_BIDIRECTIONAL` when they a=
re mapped as `DMA_FROM_DEVICE` violates the DMA API rules.
- [High] The hardware DMA buffer size is programmed improperly, enabling wr=
ites past the allocation boundary.
- [High] The main device structure is allocated using devm_kzalloc but its =
lifetime is decoupled from the video_device file descriptors, resulting in =
a Use-After-Free upon device unbind.
- [High] Multiple self-deadlocks and mismatched lock ordering issues relate=
d to `dev_mutex` in V4L2 callbacks.
- [High] A race condition between the IRQ bottom half and a worker thread c=
an erroneously halt a newly started hardware job.
- [High] Unconditional `schedule_work` during file release after cancellati=
on barriers leads to a use-after-free of `ectx`.
- [Medium] The driver reports an overly large payload size for the encoded =
JPEG, leaking uninitialized buffer contents.
- [Medium] `V4L2_ENC_CMD_STOP` incorrectly flushes all pending buffers imme=
diately instead of draining them.
- [Medium] Hardware teardown hangs due to incorrect `reinit_completion` ord=
ering in `jpeg_deinit()`.
- [Medium] Failure to allocate the V4L2 control in `fop_jpeg_file_open` byp=
asses handler cleanup, leaking bucket memory.
- [Low] Unconditional assignment of `dev_pm_ops` structure without wrapper =
macros produces dead code when `CONFIG_PM` is disabled.
--

commit 1ef0c6ce9870449657c8ef931f50d481ec34b483
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder

Add a Qualcomm JPEG encoder driver implemented on top of the
V4L2 mem2mem framework. The driver handles vb2 queue, formats, header,
interrupts, and runtime PM/ICC for SM8250, QCM6490, and SM8550.

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c b/drivers/m=
edia/platform/qcom/jpeg/qcom_jenc_dev.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c

[ ... ]

> +static int qcom_jpeg_probe(struct platform_device *pdev)
> +{
> +	const struct qcom_dev_resources *res;
> +	struct qcom_jenc_dev *jenc;
> +	int rc;
> +
> +	jenc =3D devm_kzalloc(&pdev->dev, sizeof(*jenc), GFP_KERNEL);

[Severity: High]
Does allocating this structure with devm_kzalloc() decouple its lifetime
from the video_device file descriptors? Later in qcom_jpeg_v4l2_register(),
jenc->dev_mutex is used as the vdev->lock. When the device unbinds, devres
frees jenc, but userspace may still hold open file descriptors that keep
the video_device alive, leading to a use-after-free when ioctls try to take
the freed lock.

[ ... ]

> +static struct platform_driver qcom_jpeg_platform_driver =3D {
> +	.probe  =3D qcom_jpeg_probe,
> +	.remove =3D qcom_jpeg_remove,
> +	.driver =3D {
> +		.name =3D QCOM_JPEG_ENC_NAME,
> +		.of_match_table =3D qcom_jpeg_of_match,
> +		.pm             =3D &qcom_jpeg_pm_ops,

[Severity: Low]
Could this unconditional assignment produce dead code when CONFIG_PM is
disabled? Using the pm_ptr() wrapper macro here is usually recommended to
allow the compiler to remove unused power management structures.

> +	},
> +};
> +
> +module_platform_driver(qcom_jpeg_platform_driver);
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c b/drivers/m=
edia/platform/qcom/jpeg/qcom_jenc_ops.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c

[ ... ]

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
Is there a race condition here if the hardware stops extremely quickly?
The completion is re-initialized after the STOP command has been written,
so if the interrupt fires before reinit_completion(), the completion state
might be incorrectly cleared, causing a timeout.

> +	rtime =3D wait_for_completion_timeout(&jenc->stop_complete,

[ ... ]

> +static int jpeg_store_fe_next(struct jenc_context *ectx, struct vb2_buff=
er *vb2)
> +{
> +	struct qcom_jenc_queue *q =3D &ectx->bufq[TYPE2QID(vb2->type)];
> +	struct qcom_jpeg_buff *buff =3D &q->buff[vb2->index];
> +	u8 pln =3D 0;
> +
> +	buff->plns[pln].sgt =3D vb2_dma_sg_plane_desc(vb2, pln);
> +	if (!buff->plns[pln].sgt)
> +		return -EINVAL;
> +
> +	if (!buff->plns[pln].sgt->sgl)
> +		return -EINVAL;
> +
> +	buff->plns[pln].dma =3D sg_dma_address(buff->plns[pln].sgt->sgl);

[Severity: High]
Does this safely handle fragmented scatterlists? Since the queues are
configured to use vb2_dma_sg_memops, userspace might provide DMABUF or
USERPTR buffers mapped into multiple non-contiguous IOVA segments. Just
extracting the first segment's IOVA without checking contiguousness
(sg_nents =3D=3D 1) might cause the hardware to write past the first segmen=
t into
unmapped memory.

> +	if (!buff->plns[pln].dma)
> +		return -EINVAL;

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

[Severity: High]
Does this violate the DMA API rules? The capture buffers are typically
mapped as DMA_FROM_DEVICE. Syncing them with DMA_BIDIRECTIONAL when the
mapped direction differs can trigger debug warnings or coherency issues.

> +
> +	dma +=3D qcom_jenc_header_emit(&ectx->hdr_cache, mptr,
> +				     min_t(size_t, vb->planes[0].length, ectx->hdr_cache.size),
> +				     q->vf.width, q->vf.height);

[Severity: High]
Can this advancement cause a DMA buffer overflow? The hardware limit (bsize)
is configured to the full sizeimage in jpeg_setup_we_size(). If the base
address is shifted forward by the header size here, the hardware will attem=
pt
to write sizeimage bytes starting from this shifted address, running past t=
he
end of the allocated buffer.

> +	qcom_jenc_dqts_emit(&ectx->hdr_cache, mptr);

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
> +		struct jenc_context *ctx =3D jenc->actx;

[Severity: High]
Is there a possibility that jenc->actx points to a freed context here?
Active buffers are forcefully removed and the context can be freed during
an abort (see jpeg_v4l2_work_stop and fop_jpeg_file_release) without halting
the hardware. When the interrupt eventually fires, this dereference could
result in a use-after-free.

> +		struct qcom_jenc_queue *dq;
> +		size_t out_size;
> +
> +		spin_lock_irqsave(&jenc->hw_lock, flags);
> +		jenc->actx =3D NULL;
> +		spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +
> +		if (!ctx)
> +			return IRQ_HANDLED;
> +
> +		dq =3D &ctx->bufq[JENC_DST_QUEUE];
> +		if (dq->buff_id >=3D 0) {
> +			struct qcom_jpeg_buff *frame;
> +			unsigned long flags;
> +
> +			spin_lock_irqsave(&jenc->hw_lock, flags);
> +			frame =3D &dq->buff[dq->buff_id];
> +			out_size =3D jpeg_io_read(jenc, offs->enc_out_size);
> +			spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +
> +			dev_dbg(jenc->dev, "complete idx:%d addr=3D0x%llx size=3D%zu\n",
> +				dq->buff_id, frame->plns[0].dma, out_size);
> +
> +			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_DONE,
> +					    out_size + JPEG_HEADER_MAX);

[Severity: Medium]
Does adding the fixed JPEG_HEADER_MAX (1024) to out_size accurately reflect
the payload? The actual header emitted via qcom_jenc_header_emit() is
usually smaller. Reporting an inflated size can leak residual uninitialized
memory contents to userspace.

> +			jpeg_stop(jenc);

[Severity: High]
Could this jpeg_stop() call inadvertently stop a completely new job?
The callback jenc->enc_hw_irq_cb() schedules work that can queue and start
the next job asynchronously. Because this jpeg_stop() is called after the
callback, it could end up cancelling the newly submitted hardware operation
instead of the current one.

> +		}
> +	}
> +
> +	irq_mask =3D jenc->res->hw_mask[JMSK_IRQ_STATUS_SESSION_ERROR];

[ ... ]

> +static irqreturn_t op_jpeg_irq_top(int irq, void *data)
> +{
> +	struct qcom_jenc_dev *jenc =3D data;
> +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> +	u32 irq_status;
> +	u32 irq_mask;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&jenc->hw_lock, flags);
> +
> +	irq_status =3D jpeg_io_read(jenc, offs->int_status);

[Severity: High]
Is it safe to unconditionally access hardware registers in the interrupt
handler? If a spurious interrupt arrives while the device is in runtime
suspend, its interconnects or clocks might be off, which could trigger a
synchronous external abort. A check using pm_runtime_get_if_active() is
usually required here before reading.

> +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_STATUS_ALL_BITS, irq_status);

[ ... ]

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c b/drivers/=
media/platform/qcom/jpeg/qcom_jenc_v4l2.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c

[ ... ]

> +static void jpeg_v4l2_work_stop(struct jenc_context *ctx, enum vb2_buffe=
r_state buff_state)
> +{
> +	struct vb2_v4l2_buffer *vb;
> +
> +	while ((vb =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx))) {
> +		if (!v4l2_m2m_last_dst_buf(ctx->fh.m2m_ctx)) {
> +			if (ctx->is_stopping) {
> +				ctx->is_stopping =3D false;
> +				vb2_set_plane_payload(&vb->vb2_buf, 0, 0);
> +			}
> +			v4l2_m2m_last_buffer_done(ctx->fh.m2m_ctx, vb);
> +		} else {
> +			v4l2_m2m_buf_done(vb, buff_state);
> +		}
> +	}
> +
> +	while ((vb =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)))
> +		v4l2_m2m_buf_done(vb, buff_state);

[Severity: High]
Does draining these buffers while the hardware is potentially still active
lead to issues? During an abort or streamoff, active buffers are immediately
returned to userspace via v4l2_m2m_buf_done(), but the driver never issues a
STOP command to halt the hardware DMA. This can cause the hardware to write
to buffers that userspace considers free.

> +
> +	schedule_work(&ctx->finish_work);
> +}

[ ... ]

> +static void bop_jpeg_vb2_stop_streaming(struct vb2_queue *q)
> +{
> +	struct jenc_context *ectx =3D vb2_get_drv_priv(q);
> +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> +	const struct qcom_jpeg_hw_ops *hw =3D jenc->res->hw_ops;
> +
> +	mutex_lock(&jenc->dev_mutex);

[Severity: High]
Can this cause a self-deadlock? The V4L2 core invokes the stop_streaming
callback while already holding the lock assigned to jenc->vdev->lock, which
in this driver is set to &jenc->dev_mutex. Attempting to acquire the same
mutex here will hang.

> +
> +	jpeg_v4l2_work_stop(ectx, VB2_BUF_STATE_ERROR);
> +
> +	hw->hw_release(ectx, q);
> +
> +	mutex_unlock(&jenc->dev_mutex);
> +}

[ ... ]

> +static int iop_jpeg_encoder_command(struct file *file, void *priv, struc=
t v4l2_encoder_cmd *ec)
> +{
> +	struct jenc_context *ectx =3D jpeg_file2ctx(file);
> +	struct vb2_queue *vq;
> +	int rc;
> +
> +	if (ec->cmd =3D=3D V4L2_ENC_CMD_STOP) {
> +		vq =3D v4l2_m2m_get_src_vq(ectx->fh.m2m_ctx);
> +		if (!vb2_is_streaming(vq))
> +			return 0;
> +
> +		vq =3D v4l2_m2m_get_dst_vq(ectx->fh.m2m_ctx);
> +		if (!vb2_is_streaming(vq))
> +			return 0;
> +
> +		rc =3D v4l2_m2m_ioctl_encoder_cmd(file, priv, ec);
> +		if (rc)
> +			return rc;
> +
> +		ectx->is_stopping =3D true;
> +		schedule_work(&ectx->stop_work);

[Severity: Medium]
Should the V4L2_ENC_CMD_STOP command allow currently queued source buffers
to finish encoding instead of immediately aborting them? The V4L2 spec stat=
es
that a stop command on an encoder should encode the remaining buffers and s=
et
the LAST flag on the final capture buffer. Scheduling stop_work abruptly dr=
ops
all queued data.

> +
> +		return 0;
> +	}
> +
> +	return v4l2_m2m_ioctl_encoder_cmd(file, priv, ec);
> +}

[ ... ]

> +static int jpeg_v4l2_init_queue(void *priv, struct vb2_queue *sq, struct=
 vb2_queue *dq)
> +{
> +	struct jenc_context *ectx =3D priv;
> +	int rc;
> +
> +	sq->drv_priv		=3D ectx;
> +	sq->dev			=3D ectx->dev;
> +	sq->type		=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	sq->io_modes		=3D VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
> +	sq->buf_struct_size	=3D sizeof(struct v4l2_m2m_buffer);
> +	sq->ops			=3D &qcom_jpeg_v4l2_vb2_ops;
> +	sq->mem_ops		=3D &vb2_dma_sg_memops;

[Severity: High]
Is it correct to use sg_memops instead of contig_memops? If the hardware
is programmed with a single DMA base address per plane, it likely expects a
contiguous physical memory range. Using sg_memops allows fragmented
scatterlists which the hardware won't be able to process linearly.

> +	sq->timestamp_flags	=3D V4L2_BUF_FLAG_TIMESTAMP_COPY;

[ ... ]

> +static int fop_jpeg_file_open(struct file *file)
> +{
> +	struct video_device *vdev =3D video_devdata(file);
> +	struct qcom_jenc_dev *jenc =3D video_drvdata(file);
> +	struct jenc_context *ectx;
> +	int rc;
> +
> +	ectx =3D kzalloc_obj(*ectx, GFP_KERNEL);
> +	if (!ectx)
> +		return -ENOMEM;
> +
> +	ectx->dev  =3D jenc->dev;
> +	ectx->jenc =3D jenc;

[ ... ]

> +	ectx->quality_ctl =3D v4l2_ctrl_new_std(&ectx->ctrl_hdl,
> +					      &qcom_jpeg_v4l2_ctrl_ops,
> +					      V4L2_CID_JPEG_COMPRESSION_QUALITY,
> +					      QCOM_JPEG_QUALITY_MIN,
> +					      QCOM_JPEG_QUALITY_MAX,
> +					      QCOM_JPEG_QUALITY_UNT,
> +					      QCOM_JPEG_QUALITY_DEF);
> +	if (ectx->ctrl_hdl.error) {
> +		rc =3D ectx->ctrl_hdl.error;
> +		goto err_fh_exit;

[Severity: Medium]
Will jumping to err_fh_exit leak the V4L2 control handler memory? The
v4l2_ctrl_handler_free() call is placed at the err_ctrl_handler_free label,
which gets skipped entirely if we jump to err_fh_exit.

> +	}
> +
> +	ectx->fh.ctrl_handler =3D &ectx->ctrl_hdl;
> +
> +	rc =3D v4l2_ctrl_handler_setup(&ectx->ctrl_hdl);

[ ... ]

> +static int fop_jpeg_file_release(struct file *file)
> +{
> +	struct jenc_context *ectx =3D jpeg_file2ctx(file);
> +	struct v4l2_m2m_dev *m2m_dev =3D ectx->fh.m2m_ctx->m2m_dev;
> +
> +	cancel_work_sync(&ectx->stop_work);
> +	cancel_work_sync(&ectx->finish_work);
> +
> +	v4l2_m2m_ctx_release(ectx->fh.m2m_ctx);

[Severity: High]
Does v4l2_m2m_ctx_release() re-schedule finish_work after it was just
cancelled? Internally, it aborts jobs which invokes jpeg_v4l2_work_stop().
That function unconditionally calls schedule_work(&ctx->finish_work). Becau=
se
the cancellation barriers were executed first, the work item will run after
ectx is freed below, causing a use-after-free.

> +	v4l2_m2m_put(m2m_dev);
> +	v4l2_ctrl_handler_free(&ectx->ctrl_hdl);
> +	v4l2_fh_del(&ectx->fh, file);
> +	v4l2_fh_exit(&ectx->fh);
> +	kfree(ectx);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612194417.1737=
009-1-atanas.filipov@oss.qualcomm.com?part=3D4
