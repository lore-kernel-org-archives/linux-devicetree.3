Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA963EF64F
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228008; cv=none; b=CKzmIjIQc4jboGgGNaFmriVRbb+M4+P8RVsfL6O5dkF9BQSRkEdhEhM1mZDazgudUwzO45JkHJ4U66ND0OrBoShK8lV0ROmq9aX2giGGlxUUDhS32TzrHg3c+0XV3O/MITl/QfelTDbX/V5d3flHu9zVvLaMZWOLPCBq3EgVt4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228008; c=relaxed/simple;
	bh=2k4xSAgqor3lLbQ6UF+/oNmtqYq9+xmW5cVzFoOFBsU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rspIyyFrjxOVvL1QZXQZD+8NEn4HwBtJBo7hbzEgLnEAuPIPugmiiyCAlMVT0PYZq3I69gkdUtpmA+XmlZ8EQK06p95Hm7KxPeCxcsJQ576ZYLF+1fXEu9CdJ3ZEB83mFSfzkegzNWGe6UgcIWxvfmU4SVRoT+gR/IZ6gXfP18w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IB8r0nef; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IB8r0nef"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1CA21F000E9;
	Tue, 28 Jul 2026 08:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785228007;
	bh=QUdilSRe5og9eOchSsVt/cwfQdyC2QX97pcFwgUe2zw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IB8r0nefTDJ/KZ0TisbaTLIsJVmUdLwn2iyaO8g2JUbv75j+s3iwhf6oUqgv3gqGA
	 qNI+7d8xa/LY7OytbYqOXnjiM8aPJ4QYkXOgscBPRBkyyu3YzVBmvXaO8VnQVHn9VQ
	 rqp6R7/S3/k6Rb08gRhYzAvIFantirTneTOax6oau66tFxt3yasY2WXpT60pCrbc/C
	 gM/OLlmJFyX6scMRgWL3xsUvoO4GlDA4UberdBRdugZtYE81LPddbptv8uBUt2WZbj
	 FvMW62JRd475UlMryW2QsIQDJUFWJnvKNtCj+BmigtLtTAr7rr81OKWygvOLy27p0N
	 D6ridG5iNapEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] media: qcom: jpeg: Add Qualcomm JPEG V4L2
 encoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260728082548.2511694-3-atanas.filipov@oss.qualcomm.com>
References: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
 <20260728082548.2511694-3-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 08:40:06 +0000
Message-Id: <20260728084006.B1CA21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Active DMA buffers are returned to userspace while hardware is sti=
ll running, leading to memory corruption and IOMMU faults.
- [High] Missing synchronize_irq() during file release causes a Use-After-F=
ree of `jenc_context` in the IRQ thread.
- [High] V4L2 device release callback manually frees devres-managed memory,=
 causing a double-free.
- [High] Dropping dev_mutex during stream shutdown allows racing hardware i=
nitialization and teardown, corrupting system state.
- [High] Asynchronous job completion scheduling after file close cancellati=
on leads to Use-After-Free.
- [High] Hardware write engine buffer size limit calculation permits out-of=
-bounds DMA writes.
- [Medium] DMA API violation: Syncing a DMA_FROM_DEVICE capture buffer as D=
MA_BIDIRECTIONAL.
- [Medium] 32-bit arithmetic overflow in clock frequency calculation causes=
 severely downgraded performance.
- [Medium] Transient errors permanently desynchronize queue sequences, free=
zing the encoder context.
- [Low] Undefined macro `kzalloc_obj` prevents compilation.
--

--- Patch [2]: [PATCH v5 2/3] media: qcom: jpeg: Add Qualcomm JPEG V4L2 enc=
oder ---
commit f8b765e57f128de496c47a3df983a6b13fbd2b0f
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder

This commit adds a Qualcomm JPEG encoder driver implemented on top of the
V4L2 mem2mem framework. The driver handles vb2 queues, format negotiation,
JPEG header emission, interrupt-driven job completion, and runtime PM for
the standalone JPEG encode hardware block.

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c b/drivers/m=
edia/platform/qcom/jpeg/qcom_jenc_ops.c
> --- a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
[ ... ]
> @@ -534,14 +534,16 @@ static int jpeg_apply_we_addr(struct jenc_context *=
ectx, struct qcom_jenc_queue=20
>  	jpeg_upload_dmi_table(ectx);
>  	mutex_unlock(&ectx->quality_mutex);
> =20
>  	/*
>  	 * Invalidate stale CPU cache lines before writing the JPEG header
>  	 * with the CPU into the destination buffer.
>  	 */
>  	jpeg_sync_sg(jenc->dev, frame, DMA_BIDIRECTIONAL, false);

[Severity: Medium]
The destination buffer is provided by the videobuf2 capture queue, meaning =
it
is mapped as DMA_FROM_DEVICE. Is it valid to sync it here using
DMA_BIDIRECTIONAL? Doing so might violate the DMA API and cause cache
incoherency.

> =20
>  	header_size =3D min_t(size_t, vb->planes[0].length, ectx->hdr_cache.siz=
e);
>  	header_size =3D qcom_jenc_header_emit(&ectx->hdr_cache, mptr,
>  					    (u32)header_size, (u16)q->vf.width,
>  					    (u16)q->vf.height);
> =20
>  	dma +=3D header_size;

[Severity: High]
When the DMA base pointer is advanced by header_size here, does the hardware
limit need to be updated as well? The hardware buffer size is set to the fu=
ll
sizeimage in jpeg_setup_we_size(). If the pointer is offset by header_size
without reducing the writable size, could the hardware write past the physi=
cal
boundary of the buffer?

>  	qcom_jenc_dqts_emit(&ectx->hdr_cache, mptr);
[ ... ]
> @@ -1560,6 +1560,8 @@ static unsigned long jpeg_calc_optimal_clk(struct q=
com_jenc_dev *jenc,
> =20
>  	ref_pixel_rate =3D res->ref_throughput_mpps * 1000000UL;
>  	pixel_rate =3D (unsigned long)width * height * fps;
> =20
>  	optimal_clk =3D DIV_ROUND_UP_ULL(pixel_rate * res->ref_clk_hz, ref_pixe=
l_rate);

[Severity: Medium]
Can this throughput calculation overflow on 32-bit architectures? The
width, height, and fps are multiplied together as a 32-bit unsigned long
before the product is multiplied by res->ref_clk_hz. For large resolutions
and high framerates, should this be cast to a 64-bit type to prevent
wrapping around?

> =20
>  	return min_t(unsigned long, jenc->max_freq, optimal_clk);
>  }
[ ... ]
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c b/drivers/=
media/platform/qcom/jpeg/qcom_jenc_v4l2.c
> --- a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
[ ... ]
> @@ -245,14 +245,13 @@ static void jpeg_v4l2_work_stop(struct jenc_context=
 *ctx, enum vb2_buffer_state=20
> =20
>  	/* Drain CAPTURE queue; signal EOS on last buffer if V4L2_ENC_CMD_STOP.=
 */
>  	while ((vb =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx))) {
>  		if (was_stopping && !v4l2_m2m_last_dst_buf(ctx->fh.m2m_ctx)) {
>  			vb2_set_plane_payload(&vb->vb2_buf, 0, 0);
>  			v4l2_m2m_last_buffer_done(ctx->fh.m2m_ctx, vb);
>  		} else {
>  			v4l2_m2m_buf_done(vb, buff_state);
>  		}
>  	}
> =20
>  	while ((vb =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)))
>  		v4l2_m2m_buf_done(vb, buff_state);

[Severity: High]
When returning active DMA buffers to userspace through VB2_BUF_STATE_ERROR
here, does the hardware stop immediately? If the hardware continues perform=
ing
DMA transfers on these buffers after they are handed back, is there a risk =
of
memory corruption or IOMMU faults?

> =20
>  	/* Always call job_finish to let m2m schedule the next job. */
>  	schedule_work(&ctx->finish_work);

[Severity: High]
Can scheduling this work item cause a use-after-free on the context?
After cancelling finish_work in fop_jpeg_file_release(), calling
v4l2_m2m_ctx_release() cascades into mop_jpeg_m2m_job_abort() and then here
to jpeg_v4l2_work_stop(), which re-schedules the finish_work item. The work
item will remain pending while the release function completes and frees the
context memory.

>  }
[ ... ]
> @@ -465,6 +465,9 @@ static void bop_jpeg_vb2_stop_streaming(struct vb2_qu=
eue *q)
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
By dropping dev_mutex before calling hw_release() (which issues hardware
teardown like jpeg_deinit, disable_irq, and pm_runtime_put_sync), can this
race with another thread executing STREAMON? If op_jpeg_acquire() runs
concurrently, it could try to power on and initialize the hardware while
this thread is actively shutting it down.

>  }
[ ... ]
> @@ -641,10 +641,12 @@ static void mop_jpeg_m2m_job_run(void *priv)
>  	if (hw->hw_prepare(jenc))
>  		goto err_stop;
> =20
>  	sq =3D hw->get_queue(ectx, TYPE2QID(src_vb->vb2_buf.type));
>  	src_vb->sequence =3D sq->sequence++;
>  	if (hw->process_exec(jenc, ectx, &src_vb->vb2_buf))
>  		goto err_stop;
> =20
>  	dq =3D hw->get_queue(ectx, TYPE2QID(dst_vb->vb2_buf.type));
>  	dst_vb->sequence =3D dq->sequence++;

[Severity: Medium]
If hw->process_exec() fails for the source buffer and jumps to err_stop, wi=
ll
the queue sequences become permanently misaligned? The source queue sequence
is incremented before the destination queue sequence. Subsequent encode jobs
might stall silently because the check for matching sequences will fail.

>  	if (hw->process_exec(jenc, ectx, &dst_vb->vb2_buf))
>  		goto err_stop;
[ ... ]
> @@ -1034,6 +1034,7 @@ static int fop_jpeg_file_open(struct file *file)
>  	struct jenc_context *ectx;
>  	int rc;
> =20
>  	ectx =3D kzalloc_obj(*ectx, GFP_KERNEL);

[Severity: Low]
Does the kzalloc_obj macro exist in the kernel? It looks like this might
cause a build failure and should perhaps use kzalloc().

>  	if (!ectx)
>  		return -ENOMEM;
[ ... ]
> @@ -996,6 +996,9 @@ static int fop_jpeg_file_release(struct file *file)
>  	spin_lock_irqsave(&jenc->hw_lock, flags);
>  	if (jenc->actx =3D=3D ectx)
>  		jenc->actx =3D NULL;
>  	spin_unlock_irqrestore(&jenc->hw_lock, flags);
> =20
>  	cancel_work_sync(&ectx->stop_work);
>  	cancel_work_sync(&ectx->finish_work);
> =20
>  	v4l2_m2m_ctx_release(ectx->fh.m2m_ctx);
>  	v4l2_m2m_put(m2m_dev);
>  	v4l2_ctrl_handler_free(&ectx->ctrl_hdl);
>  	v4l2_fh_del(&ectx->fh, file);
>  	v4l2_fh_exit(&ectx->fh);
>  	mutex_destroy(&ectx->quality_mutex);
>  	mutex_destroy(&ectx->ctx_lock);
>  	kfree(ectx);

[Severity: High]
Could this lead to a use-after-free if another file descriptor is still ope=
n?
When the context is freed here, the driver does not invoke synchronize_irq(=
).
The threaded IRQ handler in op_jpeg_irq_bot() might have already cached the
actx pointer before it was cleared under the spinlock. Should
synchronize_irq() be called before freeing the context?

> =20
>  	return 0;
>  }
[ ... ]
> @@ -1115,6 +1115,8 @@ static void jenc_v4l2_dev_release(struct v4l2_devic=
e *v4l2_dev)
>  {
>  	struct qcom_jenc_dev *jenc =3D container_of(v4l2_dev, struct qcom_jenc_=
dev, v4l2_dev);
> =20
>  	v4l2_device_unregister(&jenc->v4l2_dev);
>  	v4l2_m2m_put(jenc->m2m_dev);
>  	kfree(jenc);

[Severity: High]
Is it intentional to manually kfree() jenc here? Because it was originally
allocated with devm_kzalloc() in qcom_jpeg_probe(), freeing it manually will
cause a double-free during the devres teardown sequence.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728082548.2511=
694-1-atanas.filipov@oss.qualcomm.com?part=3D2
