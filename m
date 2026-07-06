Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0E43E4C64
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783323220; cv=none; b=VNkG+E4PBlLlhfpSDK1gZZTOOcCpRDxsawJ9jjlVTHM0t+h+RwBAVRF/kjlJMRctUScxwltzm7dAZBrNdH0udPum6WrnBJ6Z+31ZG87XzwIv71Nig64naKR9Sbn1jddCe15POw0zic+U+HMmWJZXukOSqxK3I88XvEXVacgeEWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783323220; c=relaxed/simple;
	bh=UllkwhW08FVEx6AFizWLh8reoF8pS7tifXCb/Lu0lHs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zl9qb0Yf2Yyja6OmXp8oPK3BZ5+ph0zRBDw9U44HBs6DnyNmg9COxEOvDztsyOrBNRUqMMD1dIFOJJRRIPNev3UwnKZi8zxxQqIW2Hd/Lszie74PUn75jh92vSFJ6f8udbTF48/ONz/gtRXcmdzBPvVL54bylX+n8d9SnrPxhog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVto6fRD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVto6fRD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2F31F000E9;
	Mon,  6 Jul 2026 07:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783323208;
	bh=V+3ccEx9ufLneWS5pdvR7n+MBr44kGk6VmL6adjlZsw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bVto6fRDeJKURU2xzAYHkEbcb4gPQZrshmBqgMXt7Yp/8zLdLI1525ru+mIvgQliP
	 SrS0QU8jJVqOb68hgpwWnNpLk3qy5MaFyAh4f2KlXACakvuzND0IzIduwFkQdPVwJi
	 gqdKp3znGZm4oG/k+I394xyECEyBvdl/m+DdCucJjQwJ0mf3xAygXryEb0Aur81wGO
	 Me5/bIIMytlw+1k3Q+APQYqGzi1wNh24KJyupjDR81GxBntoujMLaBkDD4rDXAK5DX
	 HMT1mK3oXaQ8hDVg2a4M9LJKlJNVSX0eOEoyC1v6I9gdhtyiuc2aIFXHsRN1epJH2W
	 R83X1Nok8+IXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2
 encoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 07:33:28 +0000
Message-Id: <20260706073328.9A2F31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [Critical] The destination DMA buffer limits configured for the hardware =
do not account for the prepended JPEG header offset, allowing an out-of-bou=
nds write.
- [Critical] Hardware is not stopped when active jobs are aborted or queues=
 are stopped, leading to ongoing DMA into freed V4L2 buffers.
- [Critical] Context structure `ectx` is freed in the release handler witho=
ut synchronizing with the threaded IRQ handler.
- [High] Missing platform driver `.remove` hook causes a video device and V=
4L2 M2M context leak, leading to Use-After-Free on unbind.
- [High] The V4L2 device release callback attempts to call `kfree()` on a `=
devm_kzalloc` managed pointer.
- [High] Hardware registers for write engine blocks per row/column are swap=
ped.
- [High] Hardware release in `stop_streaming` is executed outside of `dev_m=
utex`, creating a race condition with concurrent V4L2 contexts acquiring th=
e hardware.
- [High] The driver requires contiguous DMA memory but improperly uses `vb2=
_dma_sg_memops` and ignores multi-entry scatterlists.
- [High] `jpeg_stop` is issued to the hardware after notifying the m2m fram=
ework of job completion, corrupting the subsequent job.
- [High] Bidirectional DMA sync is performed on a buffer that was mapped as=
 `DMA_FROM_DEVICE`.
- [High] If `start_streaming` fails to acquire the hardware, queued buffers=
 are leaked instead of being returned to the vb2 core.
--

commit 1e9c8c45335bfb3f6ed96f07a4bd3645221761b5
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder

Add a Qualcomm JPEG encoder driver implemented on top of the
V4L2 mem2mem framework.

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c b/drivers/m=
edia/platform/qcom/jpeg/qcom_jenc_dev.c
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c

[ ... ]

> +static struct platform_driver qcom_jpeg_platform_driver =3D {
> +	.probe  =3D qcom_jpeg_probe,
> +	.driver =3D {
> +		.name =3D QCOM_JPEG_ENC_NAME,
> +		.of_match_table =3D qcom_jpeg_of_match,
> +		.pm             =3D pm_ptr(&qcom_jpeg_pm_ops),
> +	},
> +};

[Severity: High]
Can this lead to a memory leak and use-after-free on driver unbind?

The platform driver registers the video device via qcom_jpeg_v4l2_register()
in qcom_jpeg_probe(), but lacks a .remove hook to unregister it. When the
device is unbound, devres will automatically free the jenc structure, but
the video node will remain active and could be accessed by userspace.

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c b/drivers/m=
edia/platform/qcom/jpeg/qcom_jenc_ops.c
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c

[ ... ]

> +static int jpeg_apply_we_addr(struct jenc_context *ectx, struct qcom_jen=
c_queue *q,
> +			      struct vb2_buffer *vb)
> +{

[ ... ]

> +	dma +=3D header_size;
> +	qcom_jenc_dqts_emit(&ectx->hdr_cache, mptr);
> +
> +	/*
> +	 * Flush CPU writes to the header before handing the buffer to the
> +	 * hardware DMA engine.
> +	 */
> +	jpeg_sync_sg(jenc->dev, frame, DMA_BIDIRECTIONAL, true);
> +
> +	jpeg_io_write(jenc, jpeg_v420_we_pntr[pln], dma);

[Severity: Critical]
Does this allow the hardware to write past the end of the allocated DMA
mapping?

The DMA start address is advanced by header_size here. However, in
jpeg_setup_we_size() below, the hardware limit is programmed using the full
original buffer capacity (dfmt->plane_fmt[0].sizeimage) instead of the
remaining space.

[ ... ]

> +static int jpeg_setup_we_size(struct jenc_context *ectx, struct qcom_jen=
c_queue *q)
> +{
> +	struct v4l2_pix_format_mplane *dfmt =3D &q->vf;
> +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> +	u8 pln;
> +
> +	for (pln =3D 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
> +		jpeg_rw_bits(jenc, jpeg_v420_we_stride[pln], JPEG_V420_PLN_WR_STRIDE_S=
TRIDE_MSK, 0);
> +
> +	jpeg_io_write(jenc, JPEG_V420_REG_WE_BSIZE_0, dfmt->plane_fmt[0].sizeim=
age);

[ ... ]

> +static int jpeg_setup_we_params(struct jenc_context *ectx, struct qcom_j=
enc_queue *q)
> +{

[ ... ]

> +	dev_dbg(ectx->dev, "WE blk_w=3D%u blk_h=3D%u cols=3D%u rows=3D%u\n",
> +		blk_w, blk_h, mcu_cols, mcu_rows);
> +
> +	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_BLOCKS_0,
> +		     JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_MSK, mcu_rows - 1);
> +	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_BLOCKS_0,
> +		     JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_COL_MSK, mcu_cols - 1);

[Severity: High]
Are the horizontal and vertical block counts swapped here?

It appears BLOCKS_PER_ROW_MSK is being assigned the vertical block count
(mcu_rows), and BLOCKS_PER_COL_MSK is receiving the horizontal block count
(mcu_cols).

[ ... ]

> +static int jpeg_store_fe_next(struct jenc_context *ectx, struct vb2_buff=
er *vb2)
> +{
> +	struct qcom_jenc_queue *q =3D &ectx->bufq[TYPE2QID(vb2->type)];
> +	struct qcom_jpeg_buff *buff =3D &q->buff[vb2->index];
> +	u8 pln;
> +
> +	for (pln =3D 0; pln < q->vf.num_planes; pln++) {
> +		buff->plns[pln].sgt =3D vb2_dma_sg_plane_desc(vb2, pln);
> +		if (!buff->plns[pln].sgt || !buff->plns[pln].sgt->sgl)
> +			return -EINVAL;
> +
> +		buff->plns[pln].dma =3D sg_dma_address(buff->plns[pln].sgt->sgl);
> +		if (!buff->plns[pln].dma)
> +			return -EINVAL;

[Severity: High]
Will this silently cross into unmapped memory for buffers larger than 64KB?

The queue is initialized with vb2_dma_sg_memops, which can generate multiple
scatterlist segments. However, this only extracts the DMA address from the
first segment. Because dma_set_max_seg_size() is not called, large buffers
may map into fragmented IOVA chunks that the linear DMA engine cannot handl=
e.

[ ... ]

> +static irqreturn_t op_jpeg_irq_bot(int irq, void *data)
> +{
> +	struct qcom_jenc_dev *jenc =3D data;

[ ... ]

> +		if (ctx && ctx->bufq[JENC_DST_QUEUE].buff_id >=3D 0) {
> +			struct qcom_jenc_queue *dq =3D &ctx->bufq[JENC_DST_QUEUE];
> +			struct qcom_jpeg_buff *frame =3D &dq->buff[dq->buff_id];
> +			size_t out_size =3D jpeg_rd_bits(jenc, JPEG_V420_REG_ENC_OUT_SIZE,
> +						       JPEG_V420_STATUS_OUT_SIZE_BYTES_MSK);
> +
> +			dev_dbg(jenc->dev, "complete idx:%d addr=3D%pad size=3D%zu\n",
> +				dq->buff_id, &frame->plns[0].dma, out_size);
> +
> +			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_DONE,
> +					    out_size + ctx->hdr_cache.size);
> +		}
> +
> +		jpeg_stop(jenc);

[Severity: High]
Could this jpeg_stop() call break the next queued job?

The enc_hw_irq_cb() callback invokes v4l2_m2m_job_finish(), which can
immediately schedule and start the next job on another CPU. If that happens,
this subsequent jpeg_stop() will reset the hardware while the new job is
actively running.

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c b/drivers/=
media/platform/qcom/jpeg/qcom_jenc_v4l2.c
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c

[ ... ]

> +static int bop_jpeg_vb2_start_streaming(struct vb2_queue *q, unsigned in=
t count)
> +{

[ ... ]

> +	if (!ectx->hw_acquired) {
> +		rc =3D hw->hw_acquire(ectx, q);
> +		if (!rc) {
> +			ectx->hw_acquired =3D true;
> +			hw->hw_get_cap(jenc, &hw_caps);
> +			dev_dbg(ectx->dev, "hw_caps=3D0x%x\n", hw_caps);
> +		}
> +	} else {
> +		rc =3D 0;
> +	}
> +
> +	mutex_unlock(&jenc->dev_mutex);
> +
> +	return rc;
> +}

[Severity: High]
If hardware acquisition fails, are the queued buffers leaked?

The videobuf2 framework requires drivers to return all queued buffers via
vb2_buffer_done(..., VB2_BUF_STATE_QUEUED) when start_streaming() returns
an error, but this error path directly returns the error code without drain=
ing
the m2m queues.

[ ... ]

> +static void bop_jpeg_vb2_stop_streaming(struct vb2_queue *q)
> +{
> +	struct jenc_context *ectx =3D vb2_get_drv_priv(q);
> +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> +	const struct qcom_jpeg_hw_ops *hw =3D jenc->res->hw_ops;
> +	bool do_release;
> +
> +	mutex_lock(&jenc->dev_mutex);
> +
> +	jpeg_v4l2_work_stop(ectx, VB2_BUF_STATE_ERROR);
> +
> +	do_release =3D ectx->hw_acquired;
> +	ectx->hw_acquired =3D false;
> +
> +	mutex_unlock(&jenc->dev_mutex);
> +
> +	/*
> +	 * hw_release() calls jpeg_deinit() which issues HW_STOP and waits for
> +	 * the STOP_ACK interrupt completion.  It must be called outside
> +	 * dev_mutex to avoid a deadlock: the threaded IRQ handler acquires
> +	 * dev_mutex before signalling the completion.
> +	 */
> +	if (do_release)
> +		hw->hw_release(ectx, q);

[Severity: High]
Is there a race condition here exposing hardware teardown to concurrent
contexts?

The dev_mutex is unlocked before calling hw_release(). Concurrently,
another stream could be executing hw_acquire() (which runs under dev_mutex)
and calling jpeg_init(), causing both contexts to write to hardware
registers simultaneously.

[ ... ]

> +static void mop_jpeg_m2m_job_abort(void *priv)
> +{
> +	struct jenc_context *ectx =3D priv;
> +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> +
> +	mutex_lock(&jenc->dev_mutex);
> +
> +	jpeg_v4l2_work_stop(ectx, VB2_BUF_STATE_ERROR);
> +
> +	mutex_unlock(&jenc->dev_mutex);
> +}

[Severity: Critical]
Does this leave the hardware actively performing DMA into freed memory?

Active buffers are returned to userspace via jpeg_v4l2_work_stop(), but the
hardware engine is never halted. If another context keeps the reference
count above zero, the hardware continues its asynchronous transfers into
V4L2 buffers that userspace might have already freed.

[ ... ]

> +static int jpeg_v4l2_init_queue(void *priv, struct vb2_queue *sq, struct=
 vb2_queue *dq)
> +{

[ ... ]

> +	dq->drv_priv		=3D ectx;
> +	dq->dev			=3D ectx->dev;
> +	dq->type		=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	dq->io_modes		=3D VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
> +	dq->buf_struct_size	=3D sizeof(struct v4l2_m2m_buffer);
> +	dq->ops			=3D &qcom_jpeg_v4l2_vb2_ops;
> +	dq->mem_ops		=3D &vb2_dma_sg_memops;
> +	dq->timestamp_flags	=3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	dq->lock		=3D &ectx->ctx_lock;
> +	dq->min_queued_buffers	=3D 1;
> +
> +	rc =3D vb2_queue_init(dq);

[Severity: High]
Will the bidirectional DMA sync used in jpeg_apply_we_addr() trigger a DMA =
API
violation?

The capture queue is initialized without setting dq->bidirectional =3D 1, so
it maps as DMA_FROM_DEVICE. Calling dma_sync_sgtable_for_cpu() or
dma_sync_sgtable_for_device() with DMA_BIDIRECTIONAL on a buffer mapped with
DMA_FROM_DEVICE is invalid and will fail.

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
> +	v4l2_m2m_put(m2m_dev);
> +	v4l2_ctrl_handler_free(&ectx->ctrl_hdl);
> +	v4l2_fh_del(&ectx->fh, file);
> +	v4l2_fh_exit(&ectx->fh);
> +	mutex_destroy(&ectx->quality_mutex);
> +	mutex_destroy(&ectx->ctx_lock);
> +	kfree(ectx);

[Severity: Critical]
Is there a missing synchronize_irq() call before freeing the context?

The actx pointer is cleared under a spinlock, but if the threaded IRQ
handler (op_jpeg_irq_bot) has already fetched jenc->actx, it will proceed to
dereference the ectx pointer after it has been freed by kfree(ectx) here.

[ ... ]

> +static void jenc_v4l2_dev_release(struct v4l2_device *v4l2_dev)
> +{
> +	struct qcom_jenc_dev *jenc =3D container_of(v4l2_dev, struct qcom_jenc_=
dev, v4l2_dev);
> +
> +	v4l2_device_unregister(&jenc->v4l2_dev);
> +	v4l2_m2m_put(jenc->m2m_dev);
> +	kfree(jenc);
> +}

[Severity: High]
Does this cause a double free or memory corruption?

The jenc structure is allocated using devm_kzalloc() in qcom_jpeg_probe(),
but this release callback explicitly calls kfree(jenc). Freeing a
devres-managed pointer with kfree() corrupts the managed allocation list.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706071113.3832=
15-1-atanas.filipov@oss.qualcomm.com?part=3D5
