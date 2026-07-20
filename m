Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC153B1EEE
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555973; cv=none; b=R/ZazVmYpfe6VlI3VAQrUchQBmpsAe8j/QAPUQaA+aoMIZ3RUFrAjT/aNzECFQElkdrimFLQMMyXLBfUrgxupl6LpROCJnjRd861QF3ROgoiKG9ENN+JujYg8w8NGzCxRNS3JMaJROV2QlMPJOaK3JFQfv6zzBII/nVAhvIAOg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555973; c=relaxed/simple;
	bh=KwDMRkvVRaFVAsfdH5AKh1fuHgcvOoJ7R8ea5KiVyj8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kD/3c6UWLrEJfb/Jr7bCu5bZYwfZghingZQ3YEnlSI28gbzLBYG+gSCLLwp8TUsutzVyhK/mUZiJbWAx4RE/K3Wa97jT7wH85uDwYLNKdOJq/r3dT233aFT8qiX8KhEks2wn0XUnPzZvn8vqI7aGXnQKYJNl4Ml73S20inV+hMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMu/UfpW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMu/UfpW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8571F000E9;
	Mon, 20 Jul 2026 13:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784555972;
	bh=SLW6StDB7zUlFdexu0vAPjVI0ZuRvIUOC7vTK6rPTlA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CMu/UfpWHRfE08rkoOD0sqkaP9ZfDeKlNF6l1CVEZ12nhheYSdAFPVQkYE5U35Rfr
	 F73FTKVd8/f0iHzqb+3LTyZ362U4qeD/cXZG5CsjQYf1CKilCUEf8w23+xhoMh14QK
	 q7N7N42R7zQpe6mhA4dsqo7jsySrmF103qsqz3cifLi2MyD77Dorxrj+onNehVh1FQ
	 +TU+CAdBmm2CAF8ibIcklMB+Ld+cIN0wkQKqQbMQWMm8SV0f3K+0Ei9PXSXLKDnnaA
	 N4WAwMB/hixIijw2m0F5gWblU3GbriPyAOjQEnm0ZuiNbP+xJnSkQ+Ea3b15Zzxv9F
	 lZX3OLwv4cx4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 03/12] media: mediatek: jpeg: fix buffer structure
 size and layout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720133432.1042046-4-kyrie.wu@mediatek.com>
References: <20260720133432.1042046-1-kyrie.wu@mediatek.com>
 <20260720133432.1042046-4-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 13:59:31 +0000
Message-Id: <20260720135931.CB8571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Closing the device while a multi-core encoding/decoding job is run=
ning leads to Use-After-Free of the context and vb2 buffers in the interrup=
t handler.
- [High] Orphaned vb2 buffers in `dst_done_queue` are leaked on STREAMOFF.
- [High] Failure to cancel `job_timeout_work` in driver remove causes Use-A=
fter-Free.
- [High] Flawed reorder queue iteration in `mtk_jpegenc_put_buf` leads to s=
tranded buffers and application hangs when hardware completes frames out of=
 order.
- [Medium] The custom buffer structure `mtk_jpeg_src_buf` manually replicat=
es the fields of `struct v4l2_m2m_buffer` instead of embedding it, which is=
 an architectural anti-pattern and risks future memory corruption.
--

--- Patch [3]: [PATCH v16 03/12] media: mediatek: jpeg: fix buffer structur=
e size and layout ---
commit 4b1c7af5910f25b2a11680a53e22df54bd4fcacd
Author: Kyrie Wu <kyrie.wu@mediatek.com>

    media: mediatek: jpeg: fix buffer structure size and layout
   =20
    Updates the buf_struct_size in the JPEG driver to use the correct
    structure mtk_jpeg_src_buf instead of v4l2_m2m_buffer, ensuring
    proper handling of source buffers. The previous buffer size led to
    mismatches and potential issues during video buffer handling.
   =20
    Moves frame_num in the mtk_jpeg_src_buf structure to align with
    other members appropriately. The first field of the driver-specific
    buffer structure must be the subsystem-specificstruct
    (vb2_v4l2_buffer in the case of V4L2).
   =20
    Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
    Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
    Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 34135706a4ac3..7856a556ce68e 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1092,7 +1092,7 @@ static int mtk_jpeg_queue_init(void *priv, struct v=
b2_queue *src_vq,
>  	dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>  	dst_vq->io_modes =3D VB2_DMABUF | VB2_MMAP;
>  	dst_vq->drv_priv =3D ctx;
> -	dst_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> +	dst_vq->buf_struct_size =3D sizeof(struct mtk_jpeg_src_buf);
>  	dst_vq->ops =3D jpeg->variant->qops;
>  	dst_vq->mem_ops =3D &vb2_dma_contig_memops;
>  	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 6be5cf30dea1b..148fd41759b75 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -85,10 +85,10 @@ struct mtk_jpeg_variant {
>  };
> =20
>  struct mtk_jpeg_src_buf {
> -	u32 frame_num;
>  	struct vb2_v4l2_buffer b;
>  	struct list_head list;
>  	u32 bs_size;
> +	u32 frame_num;
>  	struct mtk_jpeg_dec_param dec_param;
> =20
>  	struct mtk_jpeg_ctx *curr_ctx;
>  };

[Severity: Medium]
This isn't a bug introduced by this patch, but is it safe to manually
replicate the fields of struct v4l2_m2m_buffer here instead of embedding it
directly?

Since v4l2_m2m_buf_queue casts mtk_jpeg_src_buf to v4l2_m2m_buffer, if
upstream modifies struct v4l2_m2m_buffer (for example, by adding a new
field), this implicit structural casting could cause v4l2_m2m_buf_queue to
access invalid memory and lead to silent kernel heap corruption.

There are also a few pre-existing regressions in this driver that I noticed
while reviewing the code.

[Severity: High]
This is a pre-existing issue, but does closing the device while a multi-core
encoding or decoding job is running lead to a use-after-free?

In drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:mtk_jpegenc_worker(=
):

	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base);
	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);

The worker prematurely calls v4l2_m2m_job_finish() and clears the job runni=
ng
state while the hardware is still running. If the user closes the device fd,
mtk_jpeg_release() will not wait for hardware completion and will immediate=
ly
free the context and queues.

When the hardware interrupt fires later:

drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:mtk_jpegenc_hw_irq_h=
andler():

	ctx =3D jpeg->hw_param.curr_ctx;
	src_buf =3D jpeg->hw_param.src_buffer;

The interrupt handler dereferences the context and buffers which may have
already been freed. Could this cause memory corruption?


[Severity: High]
This is a pre-existing issue, but can orphaned vb2 buffers leak when
streaming is stopped?

Looking at mtk_jpeg_enc_stop_streaming() in mtk_jpeg_core.c:

	while ((vb =3D mtk_jpeg_buf_remove(ctx, q->type)))
		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);

The function retrieves buffers from the active v4l2_m2m queues but appears =
to
fail to flush the ctx->dst_done_queue. If hardware operations complete out =
of
order, buffers wait in ctx->dst_done_queue. Does stopping the stream abandon
these pending buffers and cause a leak?


[Severity: High]
This is a pre-existing issue, but does the driver teardown logic fail to
cancel the delayed timeout work?

In drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:mtk_jpeg_remove():

static void mtk_jpeg_remove(struct platform_device *pdev)
{
	struct mtk_jpeg_dev *jpeg =3D platform_get_drvdata(pdev);

	pm_runtime_disable(&pdev->dev);
        ...

The driver initializes a delayed work task (jpeg->job_timeout_work) to hand=
le
hardware timeouts, but mtk_jpeg_remove() does not appear to call
cancel_delayed_work_sync(). If the driver is unbound while a job is timing
out, could the delayed work fire after the device structures are freed and
cause a use-after-free?


[Severity: High]
This is a pre-existing issue, but does the queue iteration logic in
mtk_jpegenc_put_buf() fail to restart its scan, leaving buffers stranded?

In drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:mtk_jpegenc_put_b=
uf():

	while (!list_empty(&ctx->dst_done_queue) &&
	       (pos !=3D &ctx->dst_done_queue)) {
		list_for_each_prev_safe(pos, temp_entry, &ctx->dst_done_queue) {
                    ...
                }
        }

When frames complete out of order (e.g., 8, 9, 7), the outer while loop che=
cks
pos !=3D &ctx->dst_done_queue. However, list_for_each_prev_safe() always
terminates with pos pointing to the list head. Since there is no break insi=
de
the outer loop, the outer condition evaluates to false immediately after one
pass, failing to restart the scan.

Could this leave frames indefinitely stranded in the queue, causing the
application to hang? This same pattern also appears in the decoder side in
mtk_jpegdec_put_buf() in mtk_jpeg_dec_hw.c.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720133432.1042=
046-1-kyrie.wu@mediatek.com?part=3D3
