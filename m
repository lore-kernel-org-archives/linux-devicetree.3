Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793955542;
	b=SLfWV9wYuRC6UF+280Q0jtEZ9qunQG/AYLp++9U6mC/1REAvLACnjMVit/HGsMuOU+O2
	 /XsoPBRziDZRtPGpvfk1f3Y/bv9L75Xy+rp936prkkSQ0Enq8trtzhKjtAEUOdPVW0SBi
	 Jip2t+5lhiWN/6m6Syu5jSz1scZRSY/oM/lzZnA3L+hc+uaXv+5mDc1BxlkmhHV3X8hS4
	 pLzgRBsTWuSctR0dAXFAjSu9PMv8iB7el4PrvNGPaIUgK+h/4DhakL1PZLLz1bb+hbk3R
	 CIQnQ+PD5DkY0MSCmQzNRinP5zQrnseuLWjHAFQMDri9M+hIqLTzhnR86oGIyq2lzkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793955542;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/zM5ypD0ZNehy65rGV5+3Er/ptcezwHYcPneahhLRUc=;
	b=gFj4SDJiJ83umiD6VxA+eJ0l39R9/DyJvmzjUVtuP/Y5Frds6jiBl+m3DxNZWAxd1hqL
	 EDn4VFYeTPIJvqejLEFKxMHhOaZAZgtzlMsyx2mZQH8JpI2YjBhuKGHTGpSkIXPnWRz4b
	 G9St3zFhLd7/L94KhBajLJwVadFp5TglZGRaj8nIDfgUNd+POM4BlMkqeSJ9TItnVp1oa
	 kvsE/aq9jA0GiyujVEtV3zA+Jy1F6yShzwV6RFDjb1qs3UNud2/Ny75X4tT04vw1RD1YC
	 hkeH+IaTGx9rKMIcQ2UeXzorpoib6dOZHjTURahldoBBBc4umt5l7g/EjMo/icV7SHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M2MHa6RD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC2A606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 08:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M2MHa6RD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7B51F0089F;
	Fri,  6 Nov 2026 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793955541;
	bh=/zM5ypD0ZNehy65rGV5+3Er/ptcezwHYcPneahhLRUc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M2MHa6RDCIg4zjKKvHts5VoPCOnSwr8aiwDCqdYcCc/M+Xsl226izLZY505D0V4jS
	 ZNWAZyzReXLXy7B4yRzMZzVMuX5c9IGlx6cezE1BJTy4Yj4rULWSgrRsd3xXTzxYtX
	 fjOfvn3ljib8Va0X/z8A25osavHHD0wfhzdcWdxx4dyYbbwJTKLIHodCgqKUkPmxqR
	 xqs8Zk97Q/Eb01QZocBFIkM832apRdQe2kn6OsHa3Qd2D6amPzL5SR6uodIl+ESPhR
	 VUgxImOkBXKtRTy3i6hQmTYcdTtsTpnb2cZxNKLT4ca56SoUItv4oQqV4vWFoYc7Fj
	 F6KLOkPcqMSNw==
Message-ID: <sashiko-outbox-201096@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/8] media: qcom: jpeg: Add Qualcomm JPEG V4L2
 encoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261106082522.1448390-5-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
 <20261106082522.1448390-5-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 08:59:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 11 potential
issues to consider:
- [High] media: qcom: jpeg: missing hardware reinit in
  qcom_jpeg_pm_system_resume()
- [High] media: qcom: jpeg: use-after-free of m2m_ctx in
  jpeg_finish_work()
- [High] media: qcom: jpeg: stop_streaming() drains both queues and
  releases HW early
- [High] media: qcom: jpeg: unverified contiguous DMA length in
  jpeg_store_fe/we_next()
- [Medium] media: qcom: jpeg: unadjusted WE_BSIZE_0 limit in
  jpeg_setup_we_size()
- [Medium] media: qcom: jpeg: 1-bit MAL_BOUNDARY masks truncate 3-bit
  boundary values
- [Medium] media: qcom: jpeg: disjoint vdev->lock and vq->lock leave
  ioctls unserialized
- [Medium] media: qcom: jpeg: fop_jpeg_file_open() skips
  v4l2_ctrl_handler_free()
- [Medium] media: qcom: jpeg: unhandled IRQs unmasked in jpeg_init()
  risk lost edge IRQ
- [Medium] media: qcom: jpeg: non-exclusive IRQ status handling in
  qcom_jenc_v420_irq_bot()
- [Low] media: qcom: jpeg: 32-bit multiplication overflow in
  jpeg_calc_optimal_clk()
--

commit 0f8ce3b457607190f1f36e252188757adec6db68
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder

This commit adds a V4L2 mem2mem driver for the standalone Qualcomm JPEG
encoder hardware block on SM8250 and SC7280 platforms.

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c b/drivers/m=
edia/platform/qcom/jpeg/qcom_jenc_dev.c
> new file mode 100644
> index 0000000000000..da69c0bb3bbe7
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
[ ... ]
> +static int qcom_jpeg_pm_resume(struct device *dev)
> +{
> +	struct qcom_jenc_dev *jenc =3D dev_get_drvdata(dev);
> +	int rc;
> +
> +	rc =3D qcom_jpeg_clk_on(jenc);
> +	if (rc)
> +		return rc;
> +
> +	return 0;
> +}
> +
> +static int qcom_jpeg_pm_system_suspend(struct device *dev)
> +{
> +	struct qcom_jenc_dev *jenc =3D dev_get_drvdata(dev);
> +	int rc;
> +
> +	v4l2_m2m_suspend(jenc->m2m_dev);
> +
> +	rc =3D pm_runtime_force_suspend(dev);
> +	if (rc)
> +		v4l2_m2m_resume(jenc->m2m_dev);
> +
> +	return rc;
> +}
> +
> +static int qcom_jpeg_pm_system_resume(struct device *dev)
> +{
> +	struct qcom_jenc_dev *jenc =3D dev_get_drvdata(dev);
> +	int rc;
> +
> +	rc =3D pm_runtime_force_resume(dev);
> +	if (rc)
> +		return rc;
> +
> +	v4l2_m2m_resume(jenc->m2m_dev);
> +
> +	return 0;
> +}

[Severity: High]
Does system suspend and resume while streaming is active leave the JPEG
hardware uninitialized and JPEG_V420_REG_INT_MASK cleared?

jpeg_init() is only called when qcom_jenc_v420_acquire() transitions
jenc->ref_count from 0 to 1.  When qcom_jpeg_pm_system_suspend() runs
pm_runtime_force_suspend(), the titan_top power domain can collapse and
reset volatile registers, including JPEG_V420_REG_INT_MASK.  On resume,
pm_runtime_force_resume() only enables clocks in qcom_jpeg_pm_resume()
before v4l2_m2m_resume() restarts queued jobs, so subsequent jobs run with
interrupts masked in hardware and hang VIDIOC_STREAMOFF or close() in
v4l2_m2m_cancel_job().

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v420.c b/drivers/=
media/platform/qcom/jpeg/qcom_jenc_v420.c
> new file mode 100644
> index 0000000000000..cd1501bca71a7
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
Can unmasking JPEG_V420_IRQ_STATUS_ALL_BITS here cause unnecessary
threaded IRQ wakeups or a lost edge interrupt on SESSION_DONE?

JPEG_V420_IRQ_STATUS_ALL_BITS enables RD_BUF_PLNS_DONE_MSK,
WR_BUF_PLN0_DONE, RD_BUF_PLNS_REQ_ATTN_MSK, and WR_BUF_PLNS_REQ_ATTN_MSK,
which neither qcom_jenc_v420_irq_top() nor qcom_jenc_v420_irq_bot()
handles.  When one of those plane bits fires at the end of a frame,
qcom_jenc_v420_irq_top() wakes the IRQ thread for a no-op, and if
SESSION_DONE asserts in JPEG_V420_REG_INT_STATUS between jpeg_io_read()
and jpeg_io_write(..., JPEG_V420_REG_INT_CLR, ...) while the plane bit is
still holding the rising-edge interrupt line high, clearing only the
earlier status bits leaves SESSION_DONE asserted with no new rising edge
to complete the job.

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
Can jpeg_store_fe_next() and jpeg_store_we_next() cause out-of-bounds DMA
when a buffer is mapped as multiple scatterlist segments?

Both queues use vb2_dma_sg_memops with VB2_USERPTR and VB2_DMABUF enabled,
which does not guarantee a single contiguous DMA segment (for example, an
unaligned userptr on arm64 where iommu_dma_map_sg() falls back to
iommu_dma_map_sg_swiotlb(), or a multi-segment dmabuf).  Because the
driver programs the hardware with sg_dma_address(sgt->sgl) for the whole
plane without checking that sg_dma_len(sgt->sgl) covers
vb2_plane_size(vb2, pln), the hardware will DMA linearly past the end of
the first segment.  Should the queues use vb2_dma_contig_memops, or verify
that sg_dma_len(sgt->sgl) >=3D vb2_plane_size(vb2, pln)?

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
> +}
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

jpeg_apply_we_addr() advances JPEG_V420_REG_WE_PNTR_0 by header_size into
the destination buffer, but jpeg_setup_we_size() programs
JPEG_V420_REG_WE_BSIZE_0 with the full dfmt->plane_fmt[0].sizeimage.  If a
compressed frame ever reaches sizeimage - header_size, the write engine is
allowed to DMA up to header_size bytes past the end of a sizeimage-sized
buffer, and out_size + header_size in qcom_jenc_v420_irq_bot() will exceed
vb->planes[0].length.

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
[ ... ]
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

The first block pops jenc->actx, completes the failed frame as
VB2_BUF_STATE_DONE, and schedules finish_work, which can start the next
job and set a new jenc->actx on another CPU; the second block then runs,
calls jpeg_stop(jenc) without dev_mutex, and aborts that newly started
job.  Checking JPEG_V420_IRQ_STATUS_SESION_ERROR_MSK first and using else
if for JPEG_V420_IRQ_STATUS_SESSION_DONE would avoid both completing a
failed frame and clobbering the next job.

[ ... ]
> +static unsigned long jpeg_calc_optimal_clk(struct qcom_jenc_dev *jenc,
> +					   u32 width, u32 height, u32 fps)
> +{
> +	unsigned long ref_pixel_rate;
> +	unsigned long optimal_clk;
> +	unsigned long pixel_rate;
> +
> +	if (!width || !height || !fps)
> +		return jenc->max_freq;
> +
> +	ref_pixel_rate =3D JPEG_REF_THROUGHPUT_MPPS * 1000000UL;
> +	pixel_rate =3D (unsigned long)width * height * fps;
> +
> +	optimal_clk =3D DIV_ROUND_UP_ULL(pixel_rate * JPEG_REF_CLK_HZ, ref_pixe=
l_rate);
> +
> +	return min_t(unsigned long, jenc->max_freq, optimal_clk);
> +}

[Severity: Low]
Can pixel_rate * JPEG_REF_CLK_HZ overflow on 32-bit builds (such as
COMPILE_TEST) before DIV_ROUND_UP_ULL() widens the product to 64 bits?
Both pixel_rate and JPEG_REF_CLK_HZ have type unsigned long, so casting
one operand to u64 (or using mul_u32_u32()) is needed to avoid 32-bit
truncation.

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h b/=
drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
> new file mode 100644
> index 0000000000000..4fc5eb980c5f7
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
[ ... ]
> +#define JPEG_V420_FE_CFG_SIXTEEN_MCU_EN		BIT(21)
> +#define JPEG_V420_FE_CFG_MCUS_PER_BLOCK		BIT(22)
> +#define JPEG_V420_FE_CFG_MAL_BOUNDARY		BIT(24)
> +#define JPEG_V420_FE_CFG_MAL_EN			BIT(27)
> +#define	JPEG_V420_FE_CFG_PLNS_EN_MSK		GENMASK(18, 16)
[ ... ]
> +/* WE_CFG fields */
> +#define JPEG_V420_WE_CFG_MEMORY_FORMAT_MSK	GENMASK(9, 8)
> +#define JPEG_V420_WE_CFG_CBCR_ORDER		BIT(12)
> +#define JPEG_V420_WE_CFG_PLN0_EN		BIT(16)
> +#define JPEG_V420_WE_CFG_MAL_BOUNDARY		BIT(24)
> +#define JPEG_V420_WE_CFG_MAL_EN			BIT(27)
> +#define JPEG_V420_WE_CFG_POP_BUFF_ON_EOS	BIT(28)

[Severity: Medium]
Should JPEG_V420_FE_CFG_MAL_BOUNDARY and JPEG_V420_WE_CFG_MAL_BOUNDARY be
GENMASK(26, 24) instead of BIT(24)?

enum jpeg_mal_bounds defines 3-bit values 0x0..0x7, and for valid widths
(256..8192) jpeg_get_mal_boundary() returns 0x3..0x7.  Passing BIT(24) to
jpeg_rw_bits() masks out bits [2:1] of the boundary value, programming the
MAL boundary as 32B or 64B instead of 256B..4KB.

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c b/drivers/=
media/platform/qcom/jpeg/qcom_jenc_v4l2.c
> new file mode 100644
> index 0000000000000..b068a9d2322ed
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
[ ... ]
> +static void jpeg_v4l2_return_bufs(struct jenc_context *ctx, enum vb2_buf=
fer_state buff_state)
> +{
> +	bool draining =3D ctx->fh.m2m_ctx->is_draining;
> +	struct vb2_v4l2_buffer *vb;
> +
> +	/* Drain CAPTURE queue; signal EOS on last buffer if V4L2_ENC_CMD_STOP.=
 */\n
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
> +
> +	mutex_lock(&jenc->dev_mutex);
> +	jpeg_v4l2_return_bufs(ectx, VB2_BUF_STATE_ERROR);
> +	v4l2_m2m_update_stop_streaming_state(ectx->fh.m2m_ctx, q);
> +	mutex_unlock(&jenc->dev_mutex);
> +}

[Severity: High]
Doesn't calling VIDIOC_STREAMOFF on one queue in
bop_jpeg_vb2_stop_streaming() fail all buffers on the other queue and
power down the hardware while the other queue is still streaming?

vb2_ops.stop_streaming() is called for a single vb2_queue q, but
jpeg_v4l2_return_bufs() removes and completes buffers from both CAPTURE
and OUTPUT (and if OUTPUT stops while draining with multiple CAPTURE
buffers queued, jpeg_v4l2_return_bufs() fails all but the last CAPTURE
buffer with VB2_BUF_STATE_ERROR and consumes is_draining before
v4l2_m2m_update_stop_streaming_state() runs).  Likewise,
jpeg_v4l2_work_stop() calls jpeg_v4l2_return_bufs() on a single job error,
draining every queued buffer in both queues instead of just the active
job's buffers.

In addition, ectx->hw_acquired is a single boolean cleared on the first
queue's stop_streaming(), so stopping one queue releases the hardware
reference and disables the IRQ while the sibling queue remains streaming.

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

[Severity: Medium]
Does setting sq->lock and dq->lock to &ectx->ctx_lock while
jenc->vdev->lock is &jenc->dev_mutex leave format and encoder command
ioctls unserialized against queue ioctls?

In v4l2_ioctl_get_lock(), queue ioctls (INFO_FL_QUEUE: REQBUFS,
CREATE_BUFS, PREPARE_BUF, QBUF, STREAMON, STREAMOFF) lock
m2m_ctx->q_lock (&ectx->ctx_lock), whereas VIDIOC_S_FMT, VIDIOC_G_FMT, and
VIDIOC_ENCODER_CMD lock vdev->lock (&jenc->dev_mutex) and never take
ectx->ctx_lock:

CPU0                                  CPU1
v4l2_ioctl (VIDIOC_S_FMT)             v4l2_ioctl (VIDIOC_REQBUFS)
  mutex_lock(&jenc->dev_mutex)          mutex_lock(&ectx->ctx_lock)
  jpeg_v4l2_set_format()                bop_jpeg_vb2_queue_setup()
    jpeg_v4l2_queues_busy(ectx)           reads q->vf
    updates sq->vf, dq->vf                qcom_jenc_v420_queue_setup()
    qcom_jenc_v420_src_fmt_update()         jpeg_header_init(&ectx->hdr_cac=
he)
      jpeg_header_init(&ectx->hdr_cache)      <-- data race on vf / hdr_cac=
he

Similarly, iop_jpeg_encoder_command() calls v4l2_m2m_ioctl_encoder_cmd()
under jenc->dev_mutex while VIDIOC_QBUF and VIDIOC_STREAMOFF mutate the
same m2m_ctx draining state and rdy_queue under ectx->ctx_lock.

[ ... ]
> +static int fop_jpeg_file_open(struct file *file)
> +{
[ ... ]
> +	v4l2_ctrl_handler_init(&ectx->ctrl_hdl, 1);
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
> +	}
> +
> +	ectx->fh.ctrl_handler =3D &ectx->ctrl_hdl;
> +
> +	rc =3D v4l2_ctrl_handler_setup(&ectx->ctrl_hdl);
> +	if (rc)
> +		goto err_ctrl_handler_free;
[ ... ]
> +	return 0;
> +
> +err_ctrl_handler_free:
> +	v4l2_ctrl_handler_free(&ectx->ctrl_hdl);
> +err_fh_exit:
> +	v4l2_fh_del(&ectx->fh, file);
> +	v4l2_fh_exit(&ectx->fh);

[Severity: Medium]
Does the ectx->ctrl_hdl.error path leak ectx->ctrl_hdl.buckets by jumping
to err_fh_exit instead of err_ctrl_handler_free after
v4l2_ctrl_handler_init()?

> +err_unlock_free:
> +	mutex_destroy(&ectx->quality_mutex);
> +	mutex_destroy(&ectx->ctx_lock);
> +	kfree(ectx);
> +
> +	return rc;
> +}
> +
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

v4l2_m2m_ctx_release() only waits for TRANS_RUNNING to clear before
freeing m2m_ctx.  Once _v4l2_m2m_job_finish() clears TRANS_RUNNING and
wakes m2m_ctx->finished (or if a prior STREAMOFF already cleared
TRANS_RUNNING while finish_work was still pending), v4l2_m2m_ctx_release()
frees m2m_ctx before cancel_work_sync(&ectx->finish_work) is reached:

CPU0 (close)                          CPU1 (kworker)
fop_jpeg_file_release()               jpeg_finish_work()
  v4l2_m2m_ctx_release(m2m_ctx)         v4l2_m2m_job_finish(..., m2m_ctx)
    v4l2_m2m_cancel_job()                 _v4l2_m2m_job_finish()
      wait_event(m2m_ctx->finished)         clears TRANS_RUNNING
                                            wake_up(&m2m_ctx->finished)
    kfree(m2m_ctx)                        v4l2_m2m_schedule_next_job(..., m=
2m_ctx)
  ...                                       <-- use-after-free of m2m_ctx
  cancel_work_sync(&ectx->finish_work)

Since v4l2_m2m_job_finish() already defers the next job via
schedule_work(&m2m_dev->job_work), calling v4l2_m2m_job_finish() directly
in jpeg_v4l2_work_done() and jpeg_v4l2_work_stop() would avoid needing
finish_work altogether.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106082522.1448=
390-1-atanas.filipov@oss.qualcomm.com?part=3D4
