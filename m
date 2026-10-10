Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905D62D838E
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 08:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620239; cv=none; b=bdGodSCRbCPmwaNJXsAlhBB+OP2gmnHrDfF48wvHtHL5fU+krV0gRyySidG60f3dmeF8q5ZKF3UDoUZpvtndNnwDWb23HiXhEtBXF057zELxEeST5bBV0d0+aaQq0lwLfneaNCHf+rYAl/9Cv2Y9cYPkbB0Oft8kSOBVeaTjgmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620239; c=relaxed/simple;
	bh=xerM0KHMFZGyXR+984kHaHOmZMSJNq4zX/37wviV9c4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FAWo8r5ku6TFTq0F5iDXXceCuRgD9Ln++Fh2xAI6ABGcIbYWeli33fgPUI1X+YMTMKOYreVNT7nUedCFReVwC0o/UFdR61iZwI2nEqxMkP9PWRWZV8zZY0zIBTZe4q44NLtj1e6LEmwxGkMlHBrkKZakvsndqhI6GVGrjkV9Fqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eTJW54cN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTJW54cN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8ACC1F000FF;
	Sat, 10 Oct 2026 08:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791620238;
	bh=aInmg/RinTC3hhAiRL7VUa6TlLcm0W8LchPdjZEx15g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eTJW54cNIr4hc3sMrsVA/WNaxncLNDZQo3sN+nlkz/jGsCj8se9X7PqsMXvajGNS1
	 fgjEzXkhK7gqUl2ip7x/2/6lxLwJ0m0TsjajNUbBE+7WokHcyZASWfyKJl5PLqCxLM
	 H6M/JirYKoqad81EmH16hJuxXx9Dkcm0KZMCLuX9Ki7LFX5mVgmJS2rEZDZPgW+ANx
	 g4EYaoiFN8DJAYeXf3QbPbb2YB3RCLRW8z5+SLCCCF/LOEmlZN6kcXO5ax+E90eoYr
	 LhSMD7LljzVJlA835SUZnwUOmbK+WvyUAyNBX/It3XMfEpm6AhIeDRQcKhtMoTglkC
	 xx1WOEBgiMSFw==
Message-ID: <sashiko-outbox-166330@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 04/13] media: mediatek: jpeg: Fix buffer completion
 on multi-core streaming stop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <044e2e1c0eece4183921c573179e44978a891f36.1791614327.git.kyrie.wu@mediatek.com>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
 <044e2e1c0eece4183921c573179e44978a891f36.1791614327.git.kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 08:17:17 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: deadlock in stop_streaming due to vb2_wait_for_all_buffers(=
) before draining software queues
--

commit 6489658be7c3e86842a167c26d82109d2bba7681
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: Fix buffer completion on multi-core streaming stop

This commit calls vb2_wait_for_all_buffers() during stop_streaming to
ensure queued buffers are processed before stopping in multi-core
environments.

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
> +

[Severity: High]
Does this blocking wait introduce a deadlock when buffers are only queued
to one side?

In the V4L2 M2M framework, if a userspace application queues a buffer to
only the output or capture queue, the hardware worker is never scheduled
to run. The buffer remains in the driver's software queue.

Because vb2_wait_for_all_buffers() is called unconditionally before the
loop that manually drains the software queue in
mtk_jpeg_enc_stop_streaming(), could it block indefinitely waiting for the
hardware worker to process buffers it cannot reach?

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
> +

[Severity: High]
This appears to have the exact same deadlock potential in
mtk_jpeg_dec_stop_streaming() as in the encoder.

Since vb2_wait_for_all_buffers() blocks until the owned driver count reaches
zero, won't this block indefinitely when streamoff is called if there are
unprocessed buffers trapped in the software queue?

>  	if (ctx->state =3D=3D MTK_JPEG_SOURCE_CHANGE &&
>  	    V4L2_TYPE_IS_CAPTURE(q->type)) {
>  		struct mtk_jpeg_src_buf *src_buf;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791614327.gi=
t.kyrie.wu@mediatek.com?part=3D4
