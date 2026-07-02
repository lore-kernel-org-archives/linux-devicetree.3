Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404FB3A9625
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978256; cv=none; b=KzGt1EA7UnBkdH3NrxN+ByUVNfj7aMy+hXN8pz/m1E1t+3FMzPwlrEzMAvUTkxcf5hEkikuawRrvD8+nZ10Nm1W4kDjLIcY8SPestcoGTygWak9E4zOK7s/yY3aYWbj7zX0cRxe7XaLv7/4RiuhdU024YByJHKZ7nGX9mqPcAkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978256; c=relaxed/simple;
	bh=VKPE1mIYb2CDkiwBs+cGn5L4WrThEUO0GtEBK6zJcVY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WT7b2QneIQToFWAUXmkePVRnYOlehe9+QRnGZnk6bpbjWnXpxhl0x1FUdffgv0pZg3gE3ng6hkZBFwF9bFFez4vOczUR3wHuJ4yQvizRWelBME2NAJQMAJ9d9EJrelyI+jMGUN8PdGFkiwc+4TJCDFn1jqzzJJRB7HpB8JIEvBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RThVq90y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RThVq90y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482F31F000E9;
	Thu,  2 Jul 2026 07:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782978253;
	bh=YDuUoHGFIrqJKyv7357PwKoUtkePSyOenLv5iInky7I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RThVq90yATPiDHDXz5Pzey2/aND5+NkGE5QWaFNI9Ja3v8Ff7q9MtZr1cbXqKpx0K
	 3ONZw7s0dKBjNgwpJb+ZqMsi4outqwscyblYv/8ZfKqIq7FuE13NMtUvP3shWlXPRg
	 TJw4RkeWq7hL4/1PwGKw5KhUNDIk59XYj7YTOFgSih2ryGuXprYbNd2jCD4nwUz5NP
	 343l2UQ6DPHxigN2dpA2j9W1Ko3RqXD9LXUuPafOkHwGCglDv15syMep7nj194nLCq
	 o+dXIfVpPvd9JMsWRmbgNiRNoNYU3PhaoZbdoQpc4fBiAPn02dl727G4D5oxmU7PRX
	 mYffqtQ3wRHgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 04/12] media: mediatek: jpeg: Fix buffer completion
 on multi-core streaming stop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702072614.10373-5-kyrie.wu@mediatek.com>
References: <20260702072614.10373-1-kyrie.wu@mediatek.com>
 <20260702072614.10373-5-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 07:44:12 +0000
Message-Id: <20260702074413.482F31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Calling `vb2_wait_for_all_buffers()` in `stop_streaming` causes an=
 unrecoverable deadlock.

Pre-existing issues:
- [High] Multi-core worker threads intentionally call `v4l2_m2m_job_finish(=
)` prematurely, breaking V4L2 M2M streamoff synchronization and causing UAF=
/Deadlock.
--

commit adc05e09fb60cf68d6bb34203f2c1f593ffa1ccb
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: Fix buffer completion on multi-core streaming stop

Enhances the Mediatek JPEG driver's stability and reliability by ensuring
that all queued buffers are processed before stopping the streaming in
multi-core environments.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
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
Does this unconditional wait risk causing an unrecoverable deadlock?

If a userspace application queues buffers, starts streaming, and then closes
the device node before the hardware has processed them, mtk_jpeg_release()
will cancel the background worker thread via cancel_work_sync().

After the worker is cancelled, any unprocessed queued buffers will never be
sent to the hardware, and thus will never complete. Since
v4l2_m2m_ctx_release() eventually calls stop_streaming(), wouldn't
vb2_wait_for_all_buffers() block forever waiting for the driver to return
the buffers?

Since the cleanup loop that aborts these buffers is located after this wait,
it appears it will never be reached. Could this cause the process to hang
indefinitely in uninterruptible sleep while holding the driver-wide mutex?

> +
>  	while ((vb =3D mtk_jpeg_buf_remove(ctx, q->type)))
>  		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
>  }

[ ... ]

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
> +

[Severity: High]
Could the same deadlock occur here in the decoder's stop_streaming path?

This isn't a bug introduced by this patch, but does the multi-core worker
thread prematurely finish the V4L2 M2M job?

Looking at mtk_jpegenc_worker() in
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:

mtk_jpegenc_worker() {
    ...
    mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
    v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
    ...
}

And similarly in mtk_jpegdec_worker():

mtk_jpegdec_worker() {
    ...
    mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
    v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
    ...
}

By calling v4l2_m2m_job_finish() immediately after starting the hardware,
long before the asynchronous hardware interrupts arrive, the TRANS_RUNNING
flag is cleared.

Does this deceive the V4L2 framework into believing the hardware is idle
while DMA operations are still ongoing?

Because TRANS_RUNNING is cleared, v4l2_m2m_cancel_job() fails to wait for
ongoing hardware operations during streamoff. Is this underlying breakage
in the streamoff synchronization the root cause of the use-after-free and
DMA corruption that the wait loop here is trying to fix?

>  	if (ctx->state =3D=3D MTK_JPEG_SOURCE_CHANGE &&
>  	    V4L2_TYPE_IS_CAPTURE(q->type)) {
>  		struct mtk_jpeg_src_buf *src_buf;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702072614.1037=
3-1-kyrie.wu@mediatek.com?part=3D4
