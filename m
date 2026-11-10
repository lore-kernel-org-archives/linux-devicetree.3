Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332448;
	b=BXNmUzty+yXGCz/wwOhZeK6/nxfuE9D1h15e1/+HgM7QUR7zQQpi71w7+OxH7aeomRcf
	 WSyawZ1qjnWpFqHDt/Gng7bnpTz9J4SEPNdTma5B/HmU03gJj46LlqsnvEWkpa6sjMQaV
	 fPSermb83ItsRB9N2CVkJ+qY4Qa2HZzvdxqgJdY1TJf9BXSiFF0XWQ+bSQwoUrqT49J8d
	 zAhukAG185qeB548lwq4uA5ClPvkjlSq/vLDu+VE88al14ApR88wEqM+VfQ9j+bvJfORI
	 eBAsj8o2A6GxJHIsHqFgObiNsYk/uDCfBq4IPiYCNlfHIAyAhjz0hwPV6GaKUlHYRqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332448;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bO9YiiNijf3vTfzBOlUySIILNp/CP2ogYSpOinbDbic=;
	b=2lnZwWJj8SCVUXDPMRz40WwPYaElBoPwobXiaf3nAK2wLSXNigZBogdOxgo/bVPLjQdh
	 EF5IsAZtbb5MulV7uuJmXsz0SIPR9mARQ8zp6YiLnXTLaJYJVzVcLxW6FZZJkk11CLNrz
	 uAYxvAq3SMqMrHniRYZE1LFejUTY+Vr+kdgcdBFa2I2kfAtam7o/1Pk5cCQ6Lg3RXE8/E
	 EX0lMZdrtgf1IH38msV/oSENQV9oMW90tHsv+DNl2bmIQQuY1gIXVAMqziTTZMWhdAmAR
	 uZDTh1BuarruCKdE3HdZhli8ipYqf2RBA26vjKw22DYIS7LaB2lc1gYB+8jHuwPjiJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XDF1ujhD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45849606A326
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 17:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XDF1ujhD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00491F0089F;
	Tue, 10 Nov 2026 17:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794332447;
	bh=bO9YiiNijf3vTfzBOlUySIILNp/CP2ogYSpOinbDbic=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XDF1ujhDkNPT160nVEMsoGH6e9cMNmGpVQMr92XDAp7qX9OHUFaboX2ORfx3Ew5oL
	 6TvMm6pNkLsVg2j9Pk97zf3cwu3jwWZjJI1Zw/iYPghAigxiMv6Sfi+yt02Hletgzm
	 CktsJv5hkec3TcOFDekZ7uhyIKxMZ+JxE+Qk1WWClsD7cR4etVNM7E19n2BUSm5bGe
	 ID80Wavwb6JeIH0jnPaNxdHW8kIsQMt+r0a2PqnTm2RnV2b+Y3XedOOIwrWVdbS2LR
	 bkFxb+WW1PjITEhaYAPSPfHq1eUkKn/a8Qmz22L5bbqVEWYbQ+RmHvMdgiqUoKOzsj
	 EPJlrg4JZRfSg==
Message-ID: <sashiko-outbox-207498@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/8] media: qcom: jpeg: Add Qualcomm JPEG V4L2
 encoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261110163909.78085-5-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
 <20261110163909.78085-5-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 17:40:47 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 10 potential
issues to consider:
- [High] media: qcom: jpeg: unverified contiguous DMA length in
  jpeg_store_fe/we_next()
- [High] media: qcom: jpeg: use-after-free of m2m_ctx in
  jpeg_finish_work()
- [Medium] media: qcom: jpeg: unadjusted WE_BSIZE_0 limit in
  jpeg_setup_we_size()
- [Medium] media: qcom: jpeg: unhandled IRQs unmasked in jpeg_init()
  risk lost IRQ
- [Medium] media: qcom: jpeg: non-exclusive IRQ handling in
  qcom_jenc_v420_irq_bot()
- [Medium] media: qcom: jpeg: disjoint vdev->lock and vq->lock leave
  ioctls unserialized
- [Medium] media: qcom: jpeg: missing job_abort in
  qcom_jpeg_v4l2_m2m_ops blocks streamoff
- [Medium] media: qcom: jpeg: use-after-free on unbind due to
  devm_kzalloc() of jenc
- [Medium] media: qcom: jpeg: broken V4L2_ENC_CMD_START resume and drain
  error handling
- [Low] media: qcom: jpeg: mismatched CAPTURE alignment in
  jpeg_v4l2_set_format()
--

commit 5296b93869b724f0ca5368bbad66d4fa21dc5933
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder

This commit adds a V4L2 mem2mem JPEG encoder driver for Qualcomm SoCs
targeting the SM8250 and SC7280 platforms.

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c b/drivers/m=
edia/platform/qcom/jpeg/qcom_jenc_dev.c
> new file mode 100644
> index 0000000000000..dd2200665a1c3
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
[ ... ]
> +static int qcom_jpeg_probe(struct platform_device *pdev)
> +{
> +	struct qcom_jenc_dev *jenc;
> +	int rc;
> +
> +	jenc =3D devm_kzalloc(&pdev->dev, sizeof(*jenc), GFP_KERNEL);
> +	if (!jenc)
> +		return -ENOMEM;
> +
> +	jenc->dev =3D &pdev->dev;
> +	platform_set_drvdata(pdev, jenc);
> +
> +	rc =3D devm_mutex_init(&pdev->dev, &jenc->dev_mutex);
> +	if (rc)
> +		goto err_free_jenc;
> +	rc =3D devm_mutex_init(&pdev->dev, &jenc->hw_ref_lock);
> +	if (rc)
> +		goto err_free_jenc;

[Severity: Medium]
Can unbinding the device while a /dev/videoX file descriptor is open cause a
use-after-free of jenc when that file descriptor is later closed?

Because jenc and its mutexes are managed by devres, unbinding the platform
driver destroys jenc->dev_mutex and jenc->hw_ref_lock, unmaps jenc->jpeg_ba=
se,
and frees jenc immediately.  When userspace subsequently closes the open fi=
le
descriptor, fop_jpeg_file_release() (and bop_jpeg_vb2_stop_streaming() if t=
he
context was streaming) dereferences ectx->jenc, locks the destroyed mutexes,
and v4l2_release() -> video_put() accesses &jenc->v4l2_dev inside the freed
struct.

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v420.c b/drivers/=
media/platform/qcom/jpeg/qcom_jenc_v420.c
> new file mode 100644
> index 0000000000000..9e1933957d101
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v420.c
[ ... ]
> +static int jpeg_init(struct qcom_jenc_dev *jenc)
> +{
[ ... ]
> +	jpeg_clear_planes_queues(jenc);
> +
> +	jpeg_io_write(jenc, JPEG_V420_REG_INT_CLR, JPEG_V420_IRQ_STATUS_ALL_BIT=
S);
> +	jpeg_io_write(jenc, JPEG_V420_REG_INT_MASK, JPEG_V420_IRQ_STATUS_ALL_BI=
TS);
> +
> +	return 0;
> +}

[Severity: Medium]
Does unmasking JPEG_V420_IRQ_STATUS_ALL_BITS here risk losing the
JPEG_V420_IRQ_STATUS_SESSION_DONE interrupt or overwriting
jenc->pending_irq_status?

JPEG_V420_IRQ_STATUS_ALL_BITS enables RD_BUF_PLNS_DONE_MSK, WR_BUF_PLN0_DON=
E,
RD_BUF_PLNS_REQ_ATTN_MSK, and WR_BUF_PLNS_REQ_ATTN_MSK, even though
qcom_jenc_v420_irq_bot() only handles SESSION_DONE and SESION_ERROR_MSK.  In
qcom_jenc_v420_irq_top():

drivers/media/platform/qcom/jpeg/qcom_jenc_v420.c:qcom_jenc_v420_irq_top() {
	irq_status =3D jpeg_io_read(jenc, JPEG_V420_REG_INT_STATUS);
	jpeg_io_write(jenc, JPEG_V420_REG_INT_CLR, irq_status & JPEG_V420_IRQ_STAT=
US_ALL_BITS);
    ...
	irq_status &=3D ~(JPEG_V420_IRQ_STATUS_RESET_ACK | JPEG_V420_IRQ_STATUS_ST=
OP_ACK);
	if (!irq_status) {
		spin_unlock_irqrestore(&jenc->hw_lock, flags);
		return IRQ_HANDLED;
	}

	WRITE_ONCE(jenc->pending_irq_status, irq_status);
}

If a plane-done interrupt fires at the end of a frame and SESSION_DONE asse=
rts
between reading JPEG_V420_REG_INT_STATUS and writing JPEG_V420_REG_INT_CLR,
only the plane-done bit is cleared while SESSION_DONE stays asserted without
generating a new rising edge, wedging the active m2m job.  Even if two
interrupts are delivered, a second unhandled interrupt can overwrite
jenc->pending_irq_status via WRITE_ONCE() before the threaded handler runs.
Only unmasking the interrupt bits the driver actually handles (and
accumulating pending_irq_status with atomic or spinlock-protected OR-and-sw=
ap)
would avoid this.

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
> +
> +		buff->plns[pln].size =3D vb2_plane_size(vb2, pln);
> +		if (!buff->plns[pln].size)
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}

[Severity: High]
Can jpeg_store_fe_next() and jpeg_store_we_next() cause out-of-bounds DMA w=
hen
a buffer's scatterlist is mapped into multiple segments?

Both functions take only sg_dma_address(sgt->sgl) and program the hardware =
to
DMA the entire plane linearly from that address, without checking that
sg_dma_len(sgt->sgl) covers vb2_plane_size(vb2, pln).  Because the queues u=
se
vb2_dma_sg_memops with VB2_USERPTR and VB2_DMABUF enabled, an unaligned
USERPTR (which falls back to per-entry swiotlb bounce mappings on arm64) or=
 a
multi-segment DMABUF produces sg_dma_len(sgt->sgl) < vb2_plane_size(vb2, pl=
n),
so the hardware reads or writes past the end of the first IOVA segment.
Should the driver use vb2_dma_contig_memops instead, or verify that
sg_dma_len(sgt->sgl) >=3D buff->plns[pln].size?

[ ... ]
> +static int jpeg_apply_we_addr(struct jenc_context *ectx, struct qcom_jen=
c_queue *q,
> +			      struct vb2_buffer *vb)
> +{
[ ... ]
> +	header_size =3D ectx->hdr_cache.layout.size;
> +	if (vb->planes[0].length < header_size)
> +		return -EINVAL;
> +
> +	memcpy(mptr, ectx->hdr_cache.data, header_size);
> +	v4l2_jpeg_hdr_set_size(mptr, &ectx->hdr_cache.layout, q->vf.width, q->v=
f.height);
> +
> +	dma +=3D header_size;
> +
> +	/*
> +	 * Flush CPU writes to the header before handing the buffer to the
> +	 * hardware DMA engine.
> +	 */
> +	jpeg_sync_sg(jenc->dev, frame, DMA_BIDIRECTIONAL, true);
> +
> +	jpeg_io_write(jenc, jpeg_v420_we_pntr[pln], dma);
[ ... ]
> +static void jpeg_setup_we_size(struct jenc_context *ectx, struct qcom_je=
nc_queue *q)
> +{
> +	struct v4l2_pix_format_mplane *dfmt =3D &q->vf;
> +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> +	u8 pln;
> +
> +	for (pln =3D 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
> +		jpeg_rw_bits(jenc, jpeg_v420_we_stride[pln], JPEG_V420_PLN_WR_STRIDE_M=
SK, 0);
> +
> +	jpeg_io_write(jenc, JPEG_V420_REG_WE_BSIZE_0, dfmt->plane_fmt[0].sizeim=
age);
> +
> +	dev_dbg(ectx->dev, "WE size=3D%u\n", dfmt->plane_fmt[0].sizeimage);
> +}

[Severity: Medium]
Should JPEG_V420_REG_WE_BSIZE_0 be reduced by header_size?

jpeg_apply_we_addr() advances the Write Engine base pointer
JPEG_V420_REG_WE_PNTR_0 by header_size bytes into the capture buffer, but
jpeg_setup_we_size() programs JPEG_V420_REG_WE_BSIZE_0 with the full
dfmt->plane_fmt[0].sizeimage.  If an encoded frame exceeds
sizeimage - header_size, the hardware can DMA up to header_size bytes past =
the
end of a sizeimage-sized buffer, and qcom_jenc_v420_irq_bot() will pass
out_size + ctx->hdr_cache.layout.size > vb2_plane_size() to
vb2_set_plane_payload().

[ ... ]
> +irqreturn_t qcom_jenc_v420_irq_bot(int irq, void *data)
> +{
> +	struct qcom_jenc_dev *jenc =3D data;
> +	unsigned long flags;
> +	u32 irq_status;
> +
> +	irq_status =3D READ_ONCE(jenc->pending_irq_status);
> +
> +	if (FIELD_GET(JPEG_V420_IRQ_STATUS_SESSION_DONE, irq_status)) {
> +		struct jenc_context *ctx;
> +
> +		spin_lock_irqsave(&jenc->hw_lock, flags);
> +		ctx =3D jenc->actx;
> +		jenc->actx =3D NULL;
> +		spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +
> +		if (ctx && ctx->bufq[JENC_DST_QUEUE].buff_id >=3D 0) {
> +			struct qcom_jenc_queue *dq =3D &ctx->bufq[JENC_DST_QUEUE];
> +			struct qcom_jpeg_buff *frame =3D &dq->buff[dq->buff_id];
> +			size_t out_size =3D jpeg_rd_bits(jenc, JPEG_V420_REG_ENC_OUT_SIZE,
> +						       JPEG_V420_STATUS_OUT_SIZE_BYTES_MSK);
> +
> +			dev_dbg(jenc->dev, "complete idx:%d addr=3D%pad size=3D%zu\n",
> +				dq->buff_id, &frame->plns[0].dma, out_size);
> +
> +			/*
> +			 * Stop the hardware before enc_hw_irq_cb(): it leads to
> +			 * v4l2_m2m_job_finish(), which can start the next job's device_run().
> +			 */
> +			jpeg_stop(jenc);
> +			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_DONE,
> +					    out_size + ctx->hdr_cache.layout.size);
> +		} else {
> +			jpeg_stop(jenc);
> +		}
> +	}
> +
> +	if (FIELD_GET(JPEG_V420_IRQ_STATUS_SESION_ERROR_MSK, irq_status)) {
> +		struct jenc_context *ctx;
> +
> +		spin_lock_irqsave(&jenc->hw_lock, flags);
> +		ctx =3D jenc->actx;
> +		jenc->actx =3D NULL;
> +		spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +
> +		dev_err(jenc->dev, "encoder hardware failure=3D0x%lx\n",
> +			FIELD_GET(JPEG_V420_IRQ_STATUS_SESION_ERROR_MSK, irq_status));
> +
> +		jpeg_stop(jenc);
> +		if (ctx)
> +			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_ERROR, 0);
> +	}
> +
> +	return IRQ_HANDLED;
> +}

[Severity: Medium]
What happens if both JPEG_V420_IRQ_STATUS_SESSION_DONE and
JPEG_V420_IRQ_STATUS_SESION_ERROR_MSK are set in irq_status?

CPU0 (irq_bot)                    CPU1 (system_wq)
if (SESSION_DONE)
  ctx =3D jenc->actx;
  jenc->actx =3D NULL;
  jpeg_stop(jenc);
  enc_hw_irq_cb(..., DONE)
    schedule_work(&finish_work)
                                  jpeg_finish_work()
                                    v4l2_m2m_job_finish()
                                      mop_jpeg_m2m_job_run()
                                        jenc->actx =3D next_ctx;
                                        jpeg_exec(jenc);
if (SESION_ERROR_MSK)
  ctx =3D jenc->actx;
  jenc->actx =3D NULL;
  jpeg_stop(jenc);  <-- stops newly started job
  enc_hw_irq_cb(ctx, ERROR)

Because the two checks are non-exclusive and run outside jenc->dev_mutex, t=
he
first block completes the failed frame with VB2_BUF_STATE_DONE and schedules
finish_work, allowing the next job to start on another CPU before the second
block pops the new jenc->actx, stops the hardware, and aborts the new job.
Checking SESION_ERROR_MSK first and using else if for SESSION_DONE avoids b=
oth
reporting a failed job as done and clobbering the next job.

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c b/drivers/=
media/platform/qcom/jpeg/qcom_jenc_v4l2.c
> new file mode 100644
> index 0000000000000..380008cfcb442
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
[ ... ]
> +static void jpeg_update_dst_plane(const struct jenc_enc_format *ef, stru=
ct v4l2_format *v4f)
> +{
> +	struct v4l2_pix_format_mplane *f =3D &v4f->fmt.pix_mp;
> +	u32 nbx, nby;
> +	u64 size;
> +
> +	f->pixelformat  =3D ef->fourcc;
> +	f->field	=3D V4L2_FIELD_NONE;
> +	f->colorspace	=3D V4L2_COLORSPACE_SRGB;
> +	f->xfer_func	=3D V4L2_MAP_XFER_FUNC_DEFAULT(f->colorspace);
> +	f->ycbcr_enc	=3D V4L2_MAP_YCBCR_ENC_DEFAULT(f->colorspace);
> +	f->quantization =3D
> +		V4L2_MAP_QUANTIZATION_DEFAULT(f->ycbcr_enc =3D=3D V4L2_YCBCR_ENC_601,
> +					      f->colorspace, f->ycbcr_enc);
> +
> +	f->width  =3D clamp_t(u32, f->width,  QCOM_JPEG_HW_MIN_WIDTH,  QCOM_JPE=
G_HW_MAX_WIDTH);
> +	f->width  =3D ALIGN_DOWN(f->width, QCOM_JPEG_HW_DEF_HSTEP);
> +
> +	f->height =3D clamp_t(u32, f->height, QCOM_JPEG_HW_MIN_HEIGHT, QCOM_JPE=
G_HW_MAX_HEIGHT);
[ ... ]
> +static int jpeg_v4l2_set_format(struct jenc_context *ectx, struct v4l2_f=
ormat *f)
> +{
[ ... ]
> +	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
> +		/* Adjust source size to match capture size */
> +		if (pm->width !=3D sq->vf.width || pm->height !=3D sq->vf.height) {
> +			struct v4l2_format nf =3D {0};
> +
> +			nf.type			  =3D jpeg_src_formats->type;
> +			nf.fmt.pix_mp.pixelformat =3D sq->vf.pixelformat;
> +			nf.fmt.pix_mp.width	  =3D pm->width;
> +			nf.fmt.pix_mp.height	  =3D pm->height;
> +
> +			rc =3D jpeg_v4l2_try_format(ectx, &nf);
> +			if (rc)
> +				return rc;
> +
> +			sq->vf =3D nf.fmt.pix_mp;
> +
> +			/*
> +			 * OUTPUT TRY_FMT may crop the width to the block size; keep the
> +			 * CAPTURE size equal to the negotiated OUTPUT size.
> +			 */
> +			if (pm->width !=3D nf.fmt.pix_mp.width ||
> +			    pm->height !=3D nf.fmt.pix_mp.height) {
> +				pm->width  =3D nf.fmt.pix_mp.width;
> +				pm->height =3D nf.fmt.pix_mp.height;
> +			}
> +		}

[Severity: Low]
Does VIDIOC_S_FMT on the CAPTURE queue leave pm->plane_fmt[0].sizeimage sta=
le
and disagree with VIDIOC_TRY_FMT when the active OUTPUT format is NV12M or
NV21M?

jpeg_update_dst_plane() aligns CAPTURE dimensions to 8x1, whereas
jpeg_update_src_planes() aligns NV12M/NV21M width down to 16 and rounds hei=
ght
up to 2.  When jpeg_v4l2_set_format() is called on CAPTURE with dimensions
like 1928x1089, the initial jpeg_v4l2_try_format(ectx, f) computes sizeimage
for 1928x1089, and then pm->width and pm->height are overwritten with the
OUTPUT-aligned 1920x1090 without recalculating pm->plane_fmt[0].sizeimage
(and VIDIOC_TRY_FMT on CAPTURE returns 1928x1089 instead of 1920x1090).

[ ... ]
> +static void jpeg_v4l2_return_bufs(struct jenc_context *ctx, enum vb2_buf=
fer_state buff_state)
> +{
> +	bool draining =3D ctx->fh.m2m_ctx->is_draining;
> +	struct vb2_v4l2_buffer *vb;
> +
> +	/* Drain CAPTURE queue; signal EOS on last buffer if V4L2_ENC_CMD_STOP.=
 */
> +	while ((vb =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx))) {
> +		if (draining && !v4l2_m2m_last_dst_buf(ctx->fh.m2m_ctx)) {
> +			vb2_set_plane_payload(&vb->vb2_buf, 0, 0);
> +			v4l2_m2m_last_buffer_done(ctx->fh.m2m_ctx, vb);
> +		} else {
> +			v4l2_m2m_buf_done(vb, buff_state);
> +		}
> +	}
> +
> +	while ((vb =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)))
> +		v4l2_m2m_buf_done(vb, buff_state);
> +}
[ ... ]
> +static void bop_jpeg_vb2_stop_streaming(struct vb2_queue *q)
> +{
> +	struct jenc_context *ectx =3D vb2_get_drv_priv(q);
> +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> +	bool do_release;
> +
> +	mutex_lock(&jenc->dev_mutex);
> +
> +	do_release =3D ectx->hw_acquired;
> +	ectx->hw_acquired =3D false;
> +
> +	mutex_unlock(&jenc->dev_mutex);
> +
> +	/*
> +	 * qcom_jenc_v420_release() calls jpeg_deinit() which issues HW_STOP and
> +	 * waits for the STOP_ACK interrupt completion. It runs before any buff=
er
> +	 * is returned below and outside dev_mutex: the threaded IRQ handler ta=
kes
> +	 * dev_mutex, and with IRQF_ONESHOT the STOP_ACK interrupt stays masked
> +	 * until that handler returns.
> +	 */
> +	if (do_release)
> +		qcom_jenc_v420_release(ectx);
[ ... ]
> +static const struct v4l2_m2m_ops qcom_jpeg_v4l2_m2m_ops =3D {
> +	.device_run	=3D mop_jpeg_m2m_job_run,
> +};

[Severity: Medium]
Without a .job_abort callback in qcom_jpeg_v4l2_m2m_ops, can VIDIOC_STREAMO=
FF
or close() ever reach bop_jpeg_vb2_stop_streaming() while a job is running?

Both v4l2_m2m_streamoff() and v4l2_m2m_ctx_release() call
v4l2_m2m_cancel_job() before invoking vb2_streamoff() or vb2_queue_release(=
).
v4l2_m2m_cancel_job() calls m2m_ops->job_abort() if present and then waits
uninterruptibly for TRANS_RUNNING to clear, which only happens when
v4l2_m2m_job_finish() is called.  Because .job_abort is not implemented, the
HW_STOP abort path in bop_jpeg_vb2_stop_streaming() ->
qcom_jenc_v420_release() is unreachable while a job is active, and any stal=
led
encode job (such as on an unhandled attention interrupt) will hang the call=
ing
task indefinitely in v4l2_m2m_cancel_job().

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
> +	}
> +
> +	return v4l2_m2m_ioctl_encoder_cmd(file, priv, ec);
> +}

[Severity: Medium]
Does V4L2_ENC_CMD_START after draining leave the CAPTURE queue stuck return=
ing
-EPIPE on VIDIOC_DQBUF?

When draining finishes and userspace dequeues the V4L2_BUF_FLAG_LAST buffer,
vb2_dqbuf() sets dst_vq->last_buffer_dequeued =3D true.  On V4L2_ENC_CMD_ST=
ART,
v4l2_m2m_ioctl_encoder_cmd() clears m2m_ctx->has_stopped, but nothing calls
vb2_clear_last_buffer_dequeued(dst_vq) or v4l2_m2m_try_schedule().
iop_jpeg_encoder_command() also skips v4l2_m2m_ioctl_try_encoder_cmd(), lea=
ving
ec->flags unvalidated and unzeroed.  In addition, jpeg_v4l2_return_bufs() is
only called on job error (VB2_BUF_STATE_ERROR), yet it drains all queued
buffers instead of only the failed job's pair and calls
v4l2_m2m_last_buffer_done() when draining, which marks the last CAPTURE buf=
fer
VB2_BUF_STATE_DONE instead of VB2_BUF_STATE_ERROR.

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
> +	sq->timestamp_flags	=3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	sq->lock		=3D &ectx->ctx_lock;
> +	sq->min_queued_buffers	=3D 1;
[ ... ]
> +	dq->lock		=3D &ectx->ctx_lock;

[Severity: Medium]
Aren't queue ioctls and format/encoder_cmd ioctls serialized by two differe=
nt
mutexes?

jpeg_v4l2_init_queue() sets sq->lock and dq->lock (and thus m2m_ctx->q_lock)
to &ectx->ctx_lock, whereas qcom_jpeg_v4l2_register() sets jenc->vdev->lock=
 to
&jenc->dev_mutex, and nothing in the driver ever takes ectx->ctx_lock
explicitly.  In v4l2_ioctl_get_lock(), ioctls with INFO_FL_QUEUE (REQBUFS,
CREATE_BUFS, PREPARE_BUF, QBUF, DQBUF, STREAMON, STREAMOFF) lock
m2m_ctx->q_lock (&ectx->ctx_lock), while VIDIOC_S_FMT, VIDIOC_G_FMT, and
VIDIOC_ENCODER_CMD fall back to vdev->lock (&jenc->dev_mutex).  As a result,
jpeg_v4l2_set_format() can mutate sq->vf, dq->vf, and ectx->hdr_cache while
bop_jpeg_vb2_queue_setup() or bop_jpeg_vb2_buf_prepare() is running, and
iop_jpeg_encoder_command() -> v4l2_m2m_ioctl_encoder_cmd() can race with
VIDIOC_QBUF and VIDIOC_STREAMON/OFF on m2m_ctx draining state and rdy_queue.

[ ... ]
> +static int fop_jpeg_file_release(struct file *file)
> +{
> +	struct jenc_context *ectx =3D jpeg_file2ctx(file);
> +	struct v4l2_m2m_dev *m2m_dev =3D ectx->fh.m2m_ctx->m2m_dev;
> +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> +	unsigned long flags;
> +
> +	/*
> +	 * Waits until a running job of this context completes: its
> +	 * SESSION_DONE interrupt needs jenc->actx, and finish_work must not
> +	 * be cancelled before, as it calls v4l2_m2m_job_finish().
> +	 */
> +	v4l2_m2m_ctx_release(ectx->fh.m2m_ctx);
> +
> +	/*
> +	 * Ensure the threaded IRQ handler cannot dereference this context
> +	 * after it is freed.  Clear jenc->actx under hw_lock before
> +	 * cancelling work.
> +	 */
> +	spin_lock_irqsave(&jenc->hw_lock, flags);
> +	if (jenc->actx =3D=3D ectx)
> +		jenc->actx =3D NULL;
> +	spin_unlock_irqrestore(&jenc->hw_lock, flags);
> +
> +	cancel_work_sync(&ectx->finish_work);

[Severity: High]
Can jpeg_finish_work() dereference ectx->fh.m2m_ctx after
v4l2_m2m_ctx_release() frees it?

CPU0                              CPU1 (system_wq)
fop_jpeg_file_release()           jpeg_finish_work()
  v4l2_m2m_ctx_release(m2m_ctx)     v4l2_m2m_job_finish(..., m2m_ctx)
    v4l2_m2m_cancel_job()             _v4l2_m2m_job_finish()
      wait_event(!(TRANS_RUNNING))      job_flags &=3D ~TRANS_RUNNING;
                                        wake_up(&m2m_ctx->finished);
    kfree(m2m_ctx);
                                      v4l2_m2m_schedule_next_job()
                                        __v4l2_m2m_try_queue(m2m_ctx)
                                          <-- use-after-free
  cancel_work_sync(&finish_work);

v4l2_m2m_cancel_job() only waits for TRANS_RUNNING to be cleared (or returns
immediately if a prior VIDIOC_STREAMOFF already cleared job_flags while
finish_work was still queued on system_wq), so v4l2_m2m_ctx_release() frees
m2m_ctx before cancel_work_sync(&ectx->finish_work) runs.  Calling
flush_work(&ectx->finish_work) (or invoking v4l2_m2m_job_finish() directly
from the threaded IRQ callback instead of deferring to a workqueue) before
v4l2_m2m_ctx_release() would prevent this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110163909.7808=
5-1-atanas.filipov@oss.qualcomm.com?part=3D4
