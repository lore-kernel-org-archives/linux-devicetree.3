Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E526424D6A
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069227; cv=none; b=pu5KuiYJ5owzAVYJ84uRcRD1bE9ioEfRD3CAMhugebFKiSRGkcDIreEgKaaFN8zGXdkgSS1tjR0wzNMOOATK8joqVaVdsPSwZVZHcNgxrtaqbdTtFZTjHhU01lr1m31JrdtWRKH3f6qiHSmWzBCWy7hRVQJNvbnNEMPUz/LsP3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069227; c=relaxed/simple;
	bh=mzH7hsX4lSUCtCGvR1UfRYJLHQhuqhJOw2KLMTczZEI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fuGpWte3AeyBZBw7hNLWkEh0EhNzH+++y9VxP6xERxi84xmvfK5JS1HHD7syTAwwyV9cHHjkYGF2QE+RyJtQKlt0Iiy0QAL+fDHKTmAUstnpEYSCLOCWIOqZopCNhPadq1p3w0TN47MC2KlW8WoC+ZlAEXmKsTxbMHrQIw522nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcYJS3cC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcYJS3cC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ADAD1F000FF;
	Tue, 22 Sep 2026 09:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069225;
	bh=cVmOUs2CNolqjKbrn92CVnXXlzpivFXtVqZsEpJhXeA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hcYJS3cCuX9k/QUl+X4AOVLCyHpr+SdUOJ9qoeMc/sgweKGuIBlqUj77BLqau5sP3
	 uF2bXjobQ3dK8LsjjgqkQfYLaPMhnCxwiU7+SvR7x9wMOidmB4ou6LAohSORWwWwpc
	 PjzHU6OlRVfZOiwMOAjmITpILg2EwsubQdYtnRrEhE6vGXTf/z+uMs/cCIDb5ux+HI
	 NbfSJnw/cVjZ6Prk+R5Or1ObEd4bd53/pmjmiV2wpoSgsRzue83n7xTsyucfR6IRtC
	 OnfQnMIVxwEwc5cNXL13WVkNZg0zfYw62PWLtSkanMZM4IGvR2rPcu4mEvtpVmCuUY
	 MR88YO0OploIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 04/12] media: mediatek: jpeg: Fix buffer completion
 on multi-core streaming stop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260922091530.241762-5-kyrie.wu@mediatek.com>
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-5-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:27:04 +0000
Message-Id: <20260922092705.6ADAD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: deadlock in mtk_jpeg_enc_stop_streaming() and dec_stop_stre=
aming()
--

commit d57ed3ae2e0683991f6c5bdb99ad62cd27985d0d
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: Fix buffer completion on multi-core streaming stop
   =20
Enhances the Mediatek JPEG driver's stability and reliability by ensuring
that all queued buffers are processed before stopping the streaming in
multi-core environments. It introduces a call to vb2_wait_for_all_buffers().

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
Does this cause a deadlock if unhandled software buffers remain in the queu=
e?

If userspace queues buffers to a single queue and calls STREAMOFF,
vb2_wait_for_all_buffers() will block indefinitely waiting for
q->owned_by_drv_count to reach zero. The loop that removes the buffers and
decrements the counter via v4l2_m2m_buf_done() is placed sequentially after
the wait, ensuring the wait never completes.

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
Could this cause the exact same deadlock on the decoder path?

It looks like mtk_jpeg_dec_stop_streaming() introduces the same behavior,
which could lead to a deadlock when software buffers remain in the queue
(for example, during a standard V4L2 dynamic resolution change).

>  	if (ctx->state =3D=3D MTK_JPEG_SOURCE_CHANGE &&
>  	    V4L2_TYPE_IS_CAPTURE(q->type)) {
>  		struct mtk_jpeg_src_buf *src_buf;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922091530.2417=
62-1-kyrie.wu@mediatek.com?part=3D4
