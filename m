Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB8542B30D
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784557159; cv=none; b=NjC0ROAMgn0BnDmw1J5t1vUcJ7uTw4k+T3a/BIncRp9jHpyDr8SxLdUlL2JApwjJU761jJJIrW6NlzN+kDMsJL8mmO99ZA8sVF5Pl1ZjzVDgmcUemykNqJNO09zoSW2B0qoIPICwiBEjzx11WUyx1+xeaLO7PAJK2QAenIVUuMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784557159; c=relaxed/simple;
	bh=34GbJfDfHJp0fHILlMLUXSg+UhTQtwjjaBfla+xjAc0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SQTkxzoBKcHL/tO6t4VhOZ7XAKDbx+g+LLGnaRgR2N7p25cMO3hx2qZx5M0xbERzcNhG0RjS6A13wKn6PJqy1H++Ou6LtAw5uAyfeu2/FQRyw8N+WUg6YWAguBpkrfaYeVYFc5msv+S8Nr1W6Yc2jOjPFncF6snZeSIEpcXSSHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ViNwTmx4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ViNwTmx4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B261F000E9;
	Mon, 20 Jul 2026 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784557157;
	bh=vFFZig8VuBZJqqRe0cVYw+sZPl+jadzMi6iTylZG0wk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ViNwTmx4glPkxhFN64j38VGdBxmX7W6fhlFLpFJN8AM358ZT9Pu95ZfuKFfFwIobp
	 48sxXnplls0gMaR3BNQ53qJWN7Ifv4dnAZytBt8OR8R9napmpEuelGpzicvoq2WAb2
	 3u4DsmB2xFh+79Izv42pFFbJ9Hs5j+EW1wgUg+IlTF5Tj9a1hyRTgfjA6VcT0Y9mwP
	 +YQaKZKfngMcNR9sfOPmdjTu266p5VTIeEuHW02WSDZZgKrz1g9hpTGFTJTvMy7V4k
	 fnh6acNjI9HgubY8q5O5H2udYcJxkvnqYCIM0T5VCl+q4ElVXAJOHHWLk6tqP0KrLi
	 swz/36KK3tzzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 04/12] media: mediatek: jpeg: Fix buffer completion
 on multi-core streaming stop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720133432.1042046-5-kyrie.wu@mediatek.com>
References: <20260720133432.1042046-1-kyrie.wu@mediatek.com>
 <20260720133432.1042046-5-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 14:19:16 +0000
Message-Id: <20260720141917.40B261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The newly added calls to `vb2_wait_for_all_buffers(q)` in `mtk_jpe=
g_enc_stop_streaming()` and `mtk_jpeg_dec_stop_streaming()` introduce an un=
killable deadlock (local denial of service) when there are unmatched buffer=
s in the m2m queues.

Pre-existing issues:
- [High] A race condition between the hardware IRQ handler and the job time=
out worker leads to a NULL pointer dereference and kernel panic.
--

--- Patch [4]: [PATCH v16 04/12] media: mediatek: jpeg: Fix buffer completi=
on on multi-core streaming stop ---
commit 613fe46e184bc6ab593928ce530f8144c0d9af31
Author: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: media: mediatek: jpeg: Fix buffer completion on multi-core streami=
ng stop

Enhances the Mediatek JPEG driver's stability and reliability by ensuring
that all queued buffers are processed before stopping the streaming in
multi-core environments. It introduces a call to vb2_wait_for_all_buffers()
in the stop_streaming functions to prevent data loss.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 7856a556ce68e..d0fb68bc884b4 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -850,8 +850,12 @@ static struct vb2_v4l2_buffer *mtk_jpeg_buf_remove(s=
truct mtk_jpeg_ctx *ctx,
>  static void mtk_jpeg_enc_stop_streaming(struct vb2_queue *q)
>  {
>  	struct mtk_jpeg_ctx *ctx =3D vb2_get_drv_priv(q);
> +	struct mtk_jpeg_dev *jpeg =3D ctx->jpeg;
>  	struct vb2_v4l2_buffer *vb;
> =20
> +	if (jpeg->variant->multi_core)
> +		vb2_wait_for_all_buffers(q);

[Severity: High]
Does this introduce a deadlock if userspace queues an unmatched number of
buffers, such as only OUTPUT buffers but no CAPTURE buffers, and then calls
VIDIOC_STREAMOFF?

When VIDIOC_STREAMOFF is called, the V4L2 framework invokes
v4l2_m2m_cancel_job(), which removes the context from the job queue. This
means no hardware worker will ever process the parked buffers.

Because the worker is cancelled, the buffers remain in the queue. Calling
vb2_wait_for_all_buffers() will block uninterruptibly waiting for the
owned_by_drv_count to drop to 0, which is structurally impossible here and
results in a hung task.

> +
>  	while ((vb =3D mtk_jpeg_buf_remove(ctx, q->type)))
>  		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
>  }
> @@ -859,6 +863,7 @@ static void mtk_jpeg_enc_stop_streaming(struct vb2_qu=
eue *q)
>  static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
>  {
>  	struct mtk_jpeg_ctx *ctx =3D vb2_get_drv_priv(q);
> +	struct mtk_jpeg_dev *jpeg =3D ctx->jpeg;
>  	struct vb2_v4l2_buffer *vb;
> =20
>  	/*
> @@ -866,6 +871,9 @@ static void mtk_jpeg_dec_stop_streaming(struct vb2_qu=
eue *q)
>  	 * Before STREAMOFF, we still have to return the old resolution and
>  	 * subsampling. Update capture queue when the stream is off.
>  	 */
> +	if (jpeg->variant->multi_core)
> +		vb2_wait_for_all_buffers(q);

[Severity: High]
Does this share the same hang issue as mtk_jpeg_enc_stop_streaming() above?

Waiting for buffers here after v4l2_m2m_cancel_job() has removed the context
from the job queue could similarly lead to an unkillable task if there are
unmatched buffers.

> +
>  	if (ctx->state =3D=3D MTK_JPEG_SOURCE_CHANGE &&
>  	    V4L2_TYPE_IS_CAPTURE(q->type)) {

[ ... ]

[Severity: High]
This is a pre-existing issue, but can this code encounter a NULL pointer
dereference if a hardware timeout occurs exactly when the hardware IRQ fire=
s?

If the timeout occurs concurrently with the hardware IRQ, mtk_jpeg_enc_irq()
calls cancel_delayed_work().

Since this does not wait for the work to finish if it has already started
executing on another CPU, both mtk_jpeg_enc_done() and
mtk_jpeg_job_timeout_work() can execute concurrently:

CPU1 in mtk_jpeg_job_timeout_work():
    src_buf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
    dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);

CPU2 in mtk_jpeg_enc_done():
    src_buf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
    dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);

Because these removals are not externally coordinated, one thread will
retrieve NULL pointers for the buffers.

This thread then unconditionally dereferences the NULL dst_buf in
vb2_set_plane_payload() or v4l2_m2m_buf_done(), leading to a panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720133432.1042=
046-1-kyrie.wu@mediatek.com?part=3D4
