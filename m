Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B783B0598
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424827; cv=none; b=Sw/h7397BDbpSZCXQCyLu7rB124q6aOcMzcLk9DXloqKt2IuOnZDBfMLlPcXbPu60XiT5hG+DtylvyFxoqiXIKS74whW+sJ2wT10jwZNW3CMCzoBBj25Gq47fBu12LNRXdjo/jBwvUIAs3ylJZgIPjwLNYXyJarlZS1R+W1vJ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424827; c=relaxed/simple;
	bh=w95qZ7h6DDRNlMkjj17MV9Sh4gwqHSZuAjOtbTVEcIA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HvZLRKBHVQ0d8U2rvLGIJzKrJshG8Ev1AuMHbmq9Ozo2bMAP3NnbE+D/crjWyitBpRZblvb0eZEQaT9Qln9Z2ISSVBJglxbzntygfSb4zdGz9eBkky2Nn4G3akns12wiTfW5e6gxCD+F5sNEVwvnJZ0BuJt0IyFY4kDbnirSko8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otI8Kg/C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otI8Kg/C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36251F00A3A;
	Thu, 30 Jul 2026 15:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785424826;
	bh=H1Smc34SlQBMxmgRjLWA6z5wAnLvv0FihAUDn3wm8bM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=otI8Kg/C3ElV7t4OjQADjB7ZR0DUukDjG4x9SFAQfLgvhrLRo2iShLYxlMDhECZkq
	 9Gm0e5gMjE0DeLCfJLGNFLPtP1GvrGDv/PT23RCWyqENJw9SOqRBw8OJAbMwM5eCTG
	 21Gy/cK57eRqZLrWMDKcou6tbvd+mx7W5H8YLjOdLLkPMQqRGwXbqam8aQKtWduRzY
	 y15QhUu71oTmhMKsPLVfPlJxqikri3ldVkb5HI9AD94RuYKYNT8K9t3foqAB4kdjqW
	 B//8X4uR0czu9fTwynZmE6wlYufswDjXnKhi30qduVeRY/APh2uFyfPFJRPUNkYPGd
	 RKjCn3Bfoxv/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] media: qcom: jpeg: Add Qualcomm JPEG V4L2
 encoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730150524.2659577-3-atanas.filipov@oss.qualcomm.com>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-3-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 15:20:25 +0000
Message-Id: <20260730152025.B36251F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [Critical] Job abort and `stop_streaming` return buffers to userspace wit=
hout stopping the hardware, causing DMA into freed or repurposed memory.
- [High] The driver lacks a `.remove` callback and performs an illegal devm=
 `kfree()` in the `v4l2_dev.release` callback, leaking `/dev/videoX` and ca=
using a SLUB crash.
- [High] The driver configures its videobuf2 queues with `vb2_dma_sg_memops=
` but only programs the hardware with the first scatterlist chunk's DMA add=
ress, leading to Out-Of-Bounds memory accesses.
- [High] Race condition between the threaded IRQ handler and `fop_jpeg_file=
_release` leads to a Use-After-Free of `jenc_context`.
- [High] Calling `VIDIOC_CREATE_BUFS` overwrites the JPEG header cache with=
 zeroes without resetting `quality_programmed`, leading to a divide-by-zero=
 panic in `jpeg_upload_dmi_table`.
- [High] Unsynchronized hardware power and clock transitions during concurr=
ent `start_streaming` and `stop_streaming` cause a race condition.
- [High] The context is freed while a work item is actively queued, leading=
 to a Use-After-Free in the workqueue handler.
- [High] `jpeg_stop` is invoked in the threaded IRQ handler after completin=
g the previous job, creating a race that halts the newly started job.
- [High] The hardware write engine limits are not adjusted for the JPEG hea=
der offset, allowing DMA to write past the end of the destination buffer.
- [Medium] Buffers are permanently leaked to the driver if `start_streaming=
` fails to acquire the hardware.
- [Medium] The driver synchronizes the capture buffer with `DMA_BIDIRECTION=
AL` while it was mapped as `DMA_FROM_DEVICE`, violating the DMA API.
- [Medium] The write engine's DMA pointer is programmed with an unaligned a=
ddress, risking AXI/AHB burst access faults.
--

--- Patch [2]: [PATCH v6 2/3] media: qcom: jpeg: Add Qualcomm JPEG V4L2 enc=
oder ---
commit edb4e8b505654235a8ee08242db0afd01b3b3cca
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder

Add a Qualcomm JPEG encoder driver implemented on top of the V4L2 mem2mem=20
framework.

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c b/drivers/m=
edia/platform/qcom/jpeg/qcom_jenc_dev.c
> index e4472a30b412d..0000000000000 100644
> --- a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
> @@ -267,8 +267,7 @@ static const struct of_device_id qcom_jpeg_of_match[]=
 =3D {
>  MODULE_DEVICE_TABLE(of, qcom_jpeg_of_match);
> =20
>  static struct platform_driver qcom_jpeg_platform_driver =3D {
>  	.probe  =3D qcom_jpeg_probe,
>  	.driver =3D {

[Severity: High]
Does this leave the video device registered after module unload?=20
It appears the platform driver lacks a .remove callback, which means
video_unregister_device() might never be called when the module is removed,
leaving a stale device node.

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c b/drivers/m=
edia/platform/qcom/jpeg/qcom_jenc_ops.c
> index b756cf10e5c03..0000000000000 100644
> --- a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
> @@ -348,6 +348,6 @@ static int jpeg_store_fe_next(struct jenc_context *ec=
tx, struct vb2_buffer *vb2)
>  		buff->plns[pln].sgt =3D vb2_dma_sg_plane_desc(vb2, pln);
>  		if (!buff->plns[pln].sgt || !buff->plns[pln].sgt->sgl)
>  			return -EINVAL;
> =20
>  		buff->plns[pln].dma =3D sg_dma_address(buff->plns[pln].sgt->sgl);

[Severity: High]
By using vb2_dma_sg_memops during initialization, we allow fragmented buffe=
rs,
but here we only extract the DMA address of the very first scatterlist chun=
k.
Will the hardware assume a contiguous physical buffer and perform out-of-bo=
unds
DMA past the first fragment?

[ ... ]

> @@ -487,6 +487,6 @@ static void jpeg_upload_dmi_table(struct jenc_context=
 *ectx)
>  	/* DMI Luma upload - values are stored in zigzag order in hdr_cache */
>  	for (i =3D 0; i < ARRAY_SIZE(t81k1_dct_luma_table); i++) {
>  		reg_val =3D div_u64(U16_MAX + 1U, luma_qt[i]);

[Severity: High]
Can this lead to a divide-by-zero panic? If a user triggers VIDIOC_CREATE_B=
UFS
after a frame is encoded, it re-initializes the header cache with zeroes.=20
When the next frame encodes, if quality_programmed matches quality_requeste=
d,=20
the cache update is skipped, and luma_qt[i] would be zero when used as a=20
denominator here.

[ ... ]

> @@ -612,12 +612,12 @@ static int jpeg_apply_we_addr(struct jenc_context *=
ectx, struct qcom_jenc_queue
> =20
>  	header_size =3D min_t(size_t, vb->planes[0].length, ectx->hdr_cache.siz=
e);
>  	header_size =3D qcom_jenc_header_emit(&ectx->hdr_cache, mptr,
>  					    (u32)header_size, (u16)q->vf.width,
>  					    (u16)q->vf.height);
> =20
>  	dma +=3D header_size;

[Severity: Medium]
Since the size of the emitted JPEG header is added directly to the DMA base
address, the resulting pointer might not be cache-line or burst aligned. If
the hardware performs burst writes, could this unaligned address cause AXI =
or
AHB bus faults?

>  	qcom_jenc_dqts_emit(&ectx->hdr_cache, mptr);
> =20
>  	/*
>  	 * Flush CPU writes to the header before handing the buffer to the
>  	 * hardware DMA engine.
>  	 */
>  	jpeg_sync_sg(jenc->dev, frame, DMA_BIDIRECTIONAL, true);

[Severity: Medium]
The queue initializes the capture buffer without the bidirectional flag, so=
 it
is implicitly mapped for DMA_FROM_DEVICE. Synchronizing the buffer explicit=
ly
with DMA_BIDIRECTIONAL here violates the DMA API. Could this trigger kernel
warnings if CONFIG_DMA_API_DEBUG is enabled?

[ ... ]

> @@ -665,6 +665,6 @@ static int jpeg_setup_we_size(struct jenc_context *ec=
tx, struct qcom_jenc_queue
>  	for (pln =3D 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
>  		jpeg_rw_bits(jenc, jpeg_v420_we_stride[pln], JPEG_V420_PLN_WR_STRIDE_S=
TRIDE_MSK, 0);
> =20
>  	jpeg_io_write(jenc, JPEG_V420_REG_WE_BSIZE_0, dfmt->plane_fmt[0].sizeim=
age);

[Severity: High]
Will this allow the hardware to write past the end of the destination buffe=
r?
The DMA pointer was advanced by header_size in jpeg_apply_we_addr(), but th=
e=20
hardware's buffer size limit is programmed with the full original sizeimage=
,=20
potentially extending the write by header_size bytes beyond the allocation.

[ ... ]

> @@ -806,12 +806,12 @@ static irqreturn_t op_jpeg_irq_bot(int irq, void *d=
ata)
> =20
>  		if (ctx && ctx->bufq[JENC_DST_QUEUE].buff_id >=3D 0) {
>  			struct qcom_jenc_queue *dq =3D &ctx->bufq[JENC_DST_QUEUE];
>  			struct qcom_jpeg_buff *frame =3D &dq->buff[dq->buff_id];
>  			size_t out_size =3D jpeg_rd_bits(jenc, JPEG_V420_REG_ENC_OUT_SIZE,
>  						       JPEG_V420_STATUS_OUT_SIZE_BYTES_MSK);
> =20
>  			dev_dbg(jenc->dev, "complete idx:%d addr=3D%pad size=3D%zu\n",
>  				dq->buff_id, &frame->plns[0].dma, out_size);
> =20
>  			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_DONE,
>  					    out_size + ctx->hdr_cache.size);
>  		}

[Severity: High]
Can this result in a use-after-free? The threaded IRQ handler drops the
spinlock right before invoking enc_hw_irq_cb(), so fop_jpeg_file_release()
could run concurrently, acquire the lock, see actx is already NULL, and free
the context while the IRQ handler is still using it.

>  		jpeg_stop(jenc);

[Severity: High]
Does this unconditionally stop the hardware even if the next job has already
started? The enc_hw_irq_cb() schedules a worker that could immediately subm=
it
a new job via jpeg_exec(). If this threaded IRQ handler resumes and blindly
calls jpeg_stop(), it might halt the newly started job mid-flight.

[ ... ]

> @@ -912,6 +912,6 @@ static int op_jpeg_queue_setup(struct jenc_context *e=
ctx, enum qcom_enc_qid id)
>  	if (id =3D=3D JENC_SRC_QUEUE) {
>  		struct qcom_jenc_queue *q =3D &ectx->bufq[id];
> =20
>  		rc =3D qcom_jenc_header_init(&ectx->hdr_cache, q->vf.pixelformat);

[Severity: High]
Is it intentional that VIDIOC_CREATE_BUFS calls queue_setup, which resets=20
the header cache with zeroes, but doesn't reset quality_programmed? This se=
ems
to be what later causes the divide-by-zero panic in the DMI upload.

[ ... ]

> @@ -1556,6 +1556,6 @@ static int op_jpeg_acquire(struct jenc_context *ect=
x, struct vb2_queue *q)
>  		}
> =20
>  		enable_irq(jenc->irq);
> =20
>  		rc =3D jpeg_init(jenc);

[Severity: High]
Is it safe for this hardware enablement to potentially race with teardown?=
=20
If another thread concurrently stops a stream and calls hw_release() withou=
t=20
holding dev_mutex, it could lead to hardware initialization running at the =
same=20
time as teardown, clobbering the state and causing unbalanced IRQ enablemen=
t.

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c b/drivers/=
media/platform/qcom/jpeg/qcom_jenc_v4l2.c
> index 6cb162f8eef90..0000000000000 100644
> --- a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
> @@ -338,12 +338,12 @@ static void jpeg_v4l2_work_stop(struct jenc_context=
 *ctx, enum vb2_buffer_state
>  	while ((vb =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx))) {
>  		if (was_stopping && !v4l2_m2m_last_dst_buf(ctx->fh.m2m_ctx)) {
>  			vb2_set_plane_payload(&vb->vb2_buf, 0, 0);
>  			v4l2_m2m_last_buffer_done(ctx->fh.m2m_ctx, vb);
>  		} else {
>  			v4l2_m2m_buf_done(vb, buff_state);
>  		}
>  	}

[Severity: Critical]
Do we return the buffers to userspace before the underlying hardware has
actually stopped? If v4l2_m2m_buf_done() is called here during a streamoff,=
=20
the buffer might be reused by userspace, but the hardware may still be acti=
vely=20
executing the job and corrupting that repurposed memory.

>  	while ((vb =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)))
>  		v4l2_m2m_buf_done(vb, buff_state);
> =20
>  	/* Always call job_finish to let m2m schedule the next job. */
>  	schedule_work(&ctx->finish_work);

[Severity: High]
Could this lead to a use-after-free in the workqueue? The release function
cancels finish_work and then calls v4l2_m2m_ctx_release(), which eventually
invokes jpeg_v4l2_work_stop(). Re-queuing finish_work right here leaves a=20
pending work item on memory that is about to be freed.

[ ... ]

> @@ -796,6 +796,6 @@ static int bop_jpeg_vb2_start_streaming(struct vb2_qu=
eue *q, unsigned int count)
>  	} else {
>  		rc =3D 0;
>  	}
> =20
>  	mutex_unlock(&jenc->dev_mutex);
> =20
>  	return rc;

[Severity: Medium]
If hw_acquire() fails above, the error is returned immediately. Doesn't this
permanently leak the buffers to the driver since they are not returned to t=
he
vb2 framework using vb2_buffer_done() with VB2_BUF_STATE_QUEUED?

[ ... ]

> @@ -837,12 +837,12 @@ static void bop_jpeg_vb2_stop_streaming(struct vb2_=
queue *q)
> =20
>  	mutex_lock(&jenc->dev_mutex);
> =20
>  	jpeg_v4l2_work_stop(ectx, VB2_BUF_STATE_ERROR);
> =20
>  	do_release =3D ectx->hw_acquired;
>  	ectx->hw_acquired =3D false;
> =20
>  	mutex_unlock(&jenc->dev_mutex);
> =20
>  	/*
>  	 * hw_release() calls jpeg_deinit() which issues HW_STOP and waits for
>  	 * the STOP_ACK interrupt completion.  It must be called outside
>  	 * dev_mutex to avoid a deadlock: the threaded IRQ handler acquires
>  	 * dev_mutex before signalling the completion.
>  	 */
>  	if (do_release)
>  		hw->hw_release(ectx, q);

[Severity: High]
Is it safe to drop dev_mutex before invoking hw_release()? If another thread
concurrently starts a stream and calls hw_acquire() under the lock, it coul=
d=20
run hardware enablement at the same time as teardown, potentially clobberin=
g=20
hardware state and causing unbalanced IRQ enablement.

[ ... ]

> @@ -1105,6 +1105,6 @@ static void jenc_v4l2_dev_release(struct v4l2_devic=
e *v4l2_dev)
>  	struct qcom_jenc_dev *jenc =3D container_of(v4l2_dev, struct qcom_jenc_=
dev, v4l2_dev);
> =20
>  	v4l2_device_unregister(&jenc->v4l2_dev);
>  	v4l2_m2m_put(jenc->m2m_dev);
>  	kfree(jenc);

[Severity: High]
Is it safe to manually kfree(jenc) here when the structure was originally=20
allocated using devm_kzalloc() during probe? It looks like this would trigg=
er
a double-free SLUB violation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730150524.2659=
577-1-atanas.filipov@oss.qualcomm.com?part=3D2
