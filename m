Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1A03AD514
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847834; cv=none; b=nYPoidSR44lY7ESvUwaHZrqnIyXNw41x75IY4OX0gw/avUPNz8fsD6cWlSiEPATC0KHz1AUFIH6ij53/rL6XpTW62UuR0z38BD/srtPbh1cbmUbF6p784vtj9oa7FDHYbpEkHzjTKEv1broBG1AVNwsMQ4k7ik2vC/rtWcEWnHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847834; c=relaxed/simple;
	bh=6S3KhOEQdCjjWuGaGfAgksBZiiGj9QecW5tJIJYSZLk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QAcKzDYznfDW3ykjpSwqSdZ2Wc1eypQcYroyZgTVZzRdDDgsXfFPq38YEKkgxwgVawDEfNtK7nQWpuk5H7yQ0pwBk7tB+B10TQawlGoyeIfIl+NNIR00ld4CmS5uvko8qFDyFQs673+RB+VTWrGLJrsv2X27pkP1xmLPhyppBag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMAxpQR7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMAxpQR7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF65C2BCB0;
	Fri, 15 May 2026 12:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778847834;
	bh=6S3KhOEQdCjjWuGaGfAgksBZiiGj9QecW5tJIJYSZLk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=LMAxpQR7eHAOvMR9GG06p208sssVtZs+rCpp+encT6Os06EvSlspi6AE89h7gFw24
	 aaFQM01pbZsj9fBXNDQ063GPRQB6EcNoQxT6c3HvL5x03b311WQpUeuaFK7cN/vtK/
	 x9YIdKDyTNyy2UQxEgm6othfql5YgMATKAhl9kz8WTygTL11mwDuE9bPLWxsF8s4mm
	 2U3FRECBJQ3tU47x8amjn4Gl30V4ApPtjxfUfjHP4AyKXqAZn87K0XDEnqz+AxJ0tX
	 TQtgEIzBKh5Ptif8UVmvyNrWAI2WiMwxLKMvCYn3X4tu96DY+0NuJtVCVA8aZ9MbXv
	 S9TVj5pj9LD5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] qcom: media: jpeg: Add Qualcomm JPEG V4L2 encoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-qcom-jpeg-v4l2-v1-2-f38c2e1b3555@oss.qualcomm.com>
References: <20260515-qcom-jpeg-v4l2-v1-2-f38c2e1b3555@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 12:23:53 +0000
Message-Id: <20260515122354.0BF65C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 15 potential issue=
(s) to consider:
- [Critical] Unclocked Hardware Access in VIDIOC_QBUF
- [Critical] DMA Memory Corruption due to Scatter-Gather mismatch
- [High] Out-of-Bounds DMA Hardware Write
- [High] Race Condition in Job Completion (`jpeg_stop` kills next job)
- [High] Unclocked Hardware Access in start_streaming Error Path
- [High] V4L2 Device Registration Race Condition (NULL Dereference)
- [High] Use-After-Free on Driver Unbind
- [High] kfifo Use-After-Free on Unbind
- [High] DMA Memory Corruption on V4L2_ENC_CMD_STOP
- [High] DMA Direction Violation
- [High] Spurious IRQ Crash Risk
- [Medium] Per-Context State Initialization Bug
- [Medium] Threaded IRQ Handler does not loop
- [Medium] Kconfig Dependency Propagation Violation
- [Low] PM Callbacks Dead Code
--

commit 4ae9b8d353b9d9d7104c0c0120d42653b3e58a64
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Date:   Fri May 15 11:47:00 2026 +0000

    qcom: media: jpeg: Add Qualcomm JPEG V4L2 encoder
   =20
    Implementation of a V4L2 JPEG encoder device driver supporting
    Qualcomm SC7180, SM8250, SM7280, and SM8550 chipsets.

> diff --git a/drivers/media/platform/qcom/jpeg/Kconfig b/drivers/media/pla=
tform/qcom/jpeg/Kconfig
> new file mode 100644
> index 0000000000000..51846aeafaf37
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_QCOM_JENC
> +	tristate "Qualcomm V4L2 JPEG Encoder driver"
> +	depends on V4L_MEM2MEM_DRIVERS
> +	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	select VIDEO_V4L2_SUBDEV_API

This isn't a bug, but selecting VIDEO_V4L2_SUBDEV_API without inheriting its
dependencies (like MEDIA_CONTROLLER) can cause Kconfig warnings and build
failures. Could the dependency be added here?

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c b/drivers/m=
edia/platform/qcom/jpeg/qcom_jenc_dev.c
> new file mode 100644
> index 0000000000000..4ef6bf9fd48de
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
[ ... ]
> +static void qcom_jpeg_remove(struct platform_device *pdev)
> +{
> +	struct qcom_jenc_dev *jenc =3D platform_get_drvdata(pdev);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	qcom_jpeg_v4l2_unregister(jenc);
> +
> +	v4l2_device_unregister(&jenc->v4l2_dev);
> +
> +	kfifo_free(&jenc->kfifo_inst);

If an interrupt fires after this point but before devres cleans up the
threaded IRQ handler, can op_jpeg_irq_top push items to this freed kfifo?

Also, since the jenc structure is allocated with devm_kzalloc during probe,
it will be freed when this remove function completes. If userspace still
holds the video device file descriptor open, will v4l2_m2m_ctx_release in
fop_jpeg_file_release access the m2m_dev inside the freed jenc memory later?

[ ... ]
> +static struct platform_driver qcom_jpeg_platform_driver =3D {
> +	.probe  =3D qcom_jpeg_probe,
> +	.remove =3D qcom_jpeg_remove,
> +	.driver =3D {
> +		.name =3D QCOM_JPEG_ENC_NAME,
> +		.of_match_table =3D qcom_jpeg_of_match,
> +		.pm             =3D &qcom_jpeg_pm_ops,

This isn't a bug, but should this use the pm_ptr() wrapper to allow the
compiler to optimize out the dev_pm_ops structure when PM features are
disabled?

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c b/drivers/m=
edia/platform/qcom/jpeg/qcom_jenc_ops.c
> new file mode 100644
> index 0000000000000..92e3c09df3d14
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
[ ... ]
> +static int jpeg_store_we_next(struct jenc_context *ectx, struct vb2_buff=
er *vb2)
> +{
> +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> +	struct qcom_jenc_queue *q =3D &ectx->bufq[TYPE2QID(vb2->type)];
> +	struct qcom_jpeg_buff *frame =3D &q->buff[vb2->index];
> +	struct qc_jfif *mptr;
> +	struct sg_table *sgt;
> +	dma_addr_t dma;
> +
> +	sgt =3D vb2_dma_sg_plane_desc(vb2, 0);
> +	if (WARN_ON_ONCE(!sgt || !sgt->sgl))
> +		return -EINVAL;
> +
> +	dma =3D sg_dma_address(sgt->sgl);

Since the driver configures the queues with vb2_dma_sg_memops, userspace can
pass physical memory mapped via scatterlists. Does extracting only the first
scatterlist segment's DMA address cause the hardware to overrun the first
segment if the buffer spans multiple non-contiguous pages?

> +	if (WARN_ON_ONCE(!dma))
> +		return -EINVAL;
> +
> +	mptr =3D vb2_plane_vaddr(vb2, 0);
> +	if (WARN_ON_ONCE(!mptr))
> +		return -EINVAL;
> +
> +	mutex_lock(&ectx->quality_mutex);
> +	if (ectx->quality_programmed !=3D ectx->quality_requested)
> +		jpeg_apply_dmi_table(ectx);

This function is called from bop_jpeg_vb2_buf_prepare during VIDIOC_QBUF.
Because VIDIOC_QBUF can be called by userspace before VIDIOC_STREAMON, the
device's PM runtime might be suspended. Will writing directly to the MMIO
registers in jpeg_apply_dmi_table cause a synchronous external abort when t=
he
hardware is unclocked?

> +	mutex_unlock(&ectx->quality_mutex);
> +
> +	dma +=3D qcom_jenc_header_emit(&ectx->hdr_cache, (void *)mptr,
> +				     min_t(size_t, vb2->planes[0].length, ectx->hdr_cache.size),
> +				     q->vf.width, q->vf.height);

By advancing the destination DMA address by the header size, does this allow
the hardware to write past the end of the allocated DMA buffer, since the
length limit programmed into the hardware is still the full sizeimage?

> +	qcom_jenc_dqts_emit(&ectx->hdr_cache, (void *)mptr);
> +
> +	frame->plns[0].sgt	=3D sgt;
> +	frame->plns[0].dma	=3D dma;
> +	frame->plns[0].size	=3D vb2_plane_size(vb2, 0);
> +
> +	jpeg_dev_access(jenc->dev, frame, DMA_TO_DEVICE);

Since this is the destination capture buffer that is written by the hardware
and read by the CPU, should this use DMA_FROM_DEVICE to maintain cache
coherency?

[ ... ]
> +static irqreturn_t op_jpeg_irq_bot(int irq, void *data)
> +{
> +	struct qcom_jenc_dev *jenc =3D data;
> +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> +	u32 irq_status;
> +	u32 irq_mask;
> +	unsigned long flags;
> +	int rc;
> +
> +	rc =3D kfifo_out_spinlocked(&jenc->kfifo_inst, &irq_status, sizeof(irq_=
status),
> +				  &jenc->kfifo_lock);

If multiple interrupts push events to the queue, will this only process the
first one and leave the rest stalled until another interrupt arrives? Should
this process the kfifo in a while loop?

> +	if (rc !=3D sizeof(irq_status)) {
> +		dev_err(jenc->dev, "IRQ status: FIFO empty\n");
> +		return IRQ_HANDLED;
> +	}
> +
> +	irq_mask =3D jenc->res->hw_mask[JMSK_IRQ_STATUS_SESSION_DONE];
> +	if (jpeg_bits_get(irq_mask, irq_status)) {
> +		struct jenc_context *ctx =3D jenc->actx;
> +		struct qcom_jenc_queue *dq =3D &ctx->bufq[JENC_DST_QUEUE];
> +		size_t out_size;
> +
> +		spin_lock_irqsave(&jenc->hw_lock, flags);
> +		jenc->actx =3D NULL;
> +		spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +
> +		if (ctx && dq->buff_id >=3D 0) {
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
> +			jpeg_cpu_access(jenc->dev, frame, DMA_FROM_DEVICE);
> +			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_DONE,
> +					    out_size + JPEG_HEADER_MAX);
> +			jpeg_stop(jenc);

The callback enc_hw_irq_cb calls v4l2_m2m_job_finish, which can immediately
unblock the M2M framework to schedule the next job and start the hardware.
Does calling jpeg_stop right after this halt the hardware and kill the newly
scheduled job?

[ ... ]
> +static irqreturn_t op_jpeg_irq_top(int irq, void *data)
> +{
> +	struct qcom_jenc_dev *jenc =3D data;
> +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> +	u32 irq_status;
> +	u32 irq_mask;
> +	unsigned long flags;
> +	int rc;
> +
> +	spin_lock_irqsave(&jenc->hw_lock, flags);
> +
> +	irq_status =3D jpeg_io_read(jenc, offs->int_status);

If a spurious interrupt arrives while the device is in a runtime-suspended
state (powered off), will reading this register unconditionally cause a bus
fault? Should it check if the device is active first?

[ ... ]
> +static int op_jpeg_acquire(struct jenc_context *ectx, struct vb2_queue *=
q)
> +{
> +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> +	struct qcom_jenc_queue *sq, *dq;
> +	int rc;
> +
> +	if (atomic_inc_return(&jenc->ref_count) =3D=3D 1) {
> +		rc =3D pm_runtime_resume_and_get(jenc->dev);
> +		if (rc < 0) {
> +			dev_err(jenc->dev, "PM runtime get failed\n");
> +			atomic_dec(&jenc->ref_count);
> +			return rc;
> +		}
> +
> +		rc =3D jpeg_init(jenc);
> +		if (rc) {
> +			dev_err(jenc->dev, "hardware init failed\n");
> +			atomic_dec(&jenc->ref_count);
> +			pm_runtime_put(jenc->dev);
> +			return rc;
> +		}
> +
> +		sq =3D &ectx->bufq[JENC_SRC_QUEUE];
> +		sq->sequence =3D 0;
> +		sq->buff_id   =3D -1;
> +		dq =3D &ectx->bufq[JENC_DST_QUEUE];
> +		dq->sequence =3D 0;
> +		dq->buff_id   =3D -1;
> +	}

Is it intentional to only initialize the context state for the first contex=
t?
If a second M2M context starts streaming while ref_count > 1, does its
sequence and buff_id remain uninitialized?

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c b/drivers/=
media/platform/qcom/jpeg/qcom_jenc_v4l2.c
> new file mode 100644
> index 0000000000000..8f5e4bd8a36e6
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
[ ... ]
> +static int bop_jpeg_vb2_start_streaming(struct vb2_queue *q, unsigned in=
t count)
> +{
> +	struct jenc_context *ectx =3D vb2_get_drv_priv(q);
> +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> +	const struct qcom_jpeg_hw_ops *hw =3D jenc->res->hw_ops;
> +	struct qcom_jenc_queue *sq =3D jpeg_get_bufq(ectx, JENC_SRC_QUEUE);
> +	struct qcom_jenc_queue *dq =3D jpeg_get_bufq(ectx, JENC_DST_QUEUE);
> +	u32 hw_caps;
> +	u8 pln;
> +	int rc;
> +
[ ... ]
> +	mutex_lock(&jenc->dev_mutex);
> +
> +	ectx->quality_requested =3D QCOM_JPEG_QUALITY_MAX;
> +
> +	rc =3D hw->hw_acquire(ectx, q);
> +
> +	hw->hw_get_cap(jenc, &hw_caps);

If hw_acquire fails to resume the device and returns an error, will
hw_get_cap attempting to read from the unclocked hardware cause a
synchronous external abort?

[ ... ]
> +static int iop_jpeg_encoder_command(struct file *file, void *priv, struc=
t v4l2_encoder_cmd *ec)
> +{
> +	struct jenc_context *ectx =3D jpeg_file2ctx(file);
> +	struct vb2_queue *vq;
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
> +		mutex_lock(&ectx->stop_lock);
> +		ectx->is_stopping =3D true;
> +		mutex_unlock(&ectx->stop_lock);
> +		jpeg_v4l2_work_stop(ectx->jenc, ectx, VB2_BUF_STATE_ERROR);
> +
> +		return 0;
> +	}

While jpeg_v4l2_work_stop cleans up buffers, it doesn't appear to halt the
hardware DMA engine. Could the hardware continue writing to the destination
buffer after it has been returned to userspace and potentially reallocated,
causing memory corruption?

[ ... ]
> +int qcom_jpeg_v4l2_register(struct qcom_jenc_dev *jenc)
> +{
> +	int rc;
> +
> +	mutex_lock(&jenc->dev_mutex);
> +
> +	jenc->enc_hw_irq_cb =3D jpeg_v4l2_process_cb;
> +
> +	jenc->m2m_dev =3D v4l2_m2m_init(&qcom_jpeg_v4l2_m2m_ops);
[ ... ]
> +	rc =3D video_register_device(jenc->vdev, VFL_TYPE_VIDEO, -1);
> +	if (rc) {
> +		dev_err(jenc->dev, "failed to register video device\n");
> +		goto err_video_device_release;
> +	}
> +
> +	video_set_drvdata(jenc->vdev, jenc);

By calling video_register_device before video_set_drvdata, the video node
becomes visible to userspace immediately. If an application calls open() in
this narrow window, will video_drvdata(file) return NULL and cause a crash
in fop_jpeg_file_open?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-qcom-jpeg-=
v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com?part=3D2
