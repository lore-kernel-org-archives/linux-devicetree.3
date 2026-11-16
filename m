Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794120;
	b=iN9ysFU+ouvMqFlmSN9D29SrIZJ8AacbGQOImwflJ5Rn94rAwYHVqfbm22yg5g+grkkZ
	 9vBo1Pq6CetREgJmcbfpzyjbgfboZw46sx90NHeBJBrpced3q+ChgdCliqGMbAbghEEl5
	 f6yiwjOonGhAQF7vn0Toabp9uv1etu5bC/csoZnPfFsbOlII8CIJ3Hhi2k5jWv3AWPHbr
	 xDK5oHzXuThe6FQLzMgToaVpIixJi4I/dBZAvNipkb4vZx/LMnpshhKURGtxnSVYodN5J
	 5ewHTEAw3Vty3lIgeVDVdlmSNvMhGF8el8Jku6ThMyOhhY9APfEDB36470EeVn6abgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794120;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MjXN6lBVWb3Kxsr21yS5xdoDzYuXXgrPuzXhoeJeaMw=;
	b=VLhYBbF2hyVZWvvMwe26qHvLk4LI+4UM11JAKKlfItVSLXAaKx9KZ/T9Wv1W1VtcU28N
	 a37qkS4ILmCC5h3l50DWk7MsetchdjC7peSR9XR2UuyybUIZkLhx9GGYaBGusy68+/B2L
	 AaokUAv87b6kaIQYcRaoSu/7VeyqDPdn6dqiC6KaudvPiuOaNpEcuZ44gQ1wu+ylC55zG
	 +RvRLozc60yg9kRTwd1vygfIc8FTywEcbutoLkWFDNuKSeAZgmxN71Y48y4zsyS4ZJw/6
	 W1xD1XzWUQGvLZNd/rmJo8zR9SkLo6k/GEYa9dVRRSC3ahd8CTQbuNEln7KCJ9avDaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xm6D0es7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6E8606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 01:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xm6D0es7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C448B1F000C4;
	Mon, 16 Nov 2026 01:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794120;
	bh=MjXN6lBVWb3Kxsr21yS5xdoDzYuXXgrPuzXhoeJeaMw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xm6D0es7vNylTRXHSC3ooSI5iYkfJEKA5Axn/oUJX2Y8vFUGZTglSHwDVdTbdlMXS
	 xexGzN6TXAHkwFtQIGalSFd9S3qGrdFRsul5tlvoux+wbI6JM0l9qfN2TofbdsEgbR
	 rFMv93KXmDPYHpsDJcYnev9XRohqkGtDrnhZoCJk24y4iGFQ93M+P6ew1Vkuyg2HNT
	 nG3sQUQZHPP1LP6yKoIX+qQ8/YJ8jN2GtpkESsFpZczr1pHPXhFfdXkiJnsVpuQW/y
	 tjFADk8cY/oR8VBul06HkliI3DN5iTSjGXPaI/U+NLxn5q3is/eh+L8Hlvb4LxLj9q
	 Ko15rg1Orh5fw==
Message-ID: <sashiko-outbox-216020@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 07/13] media: mediatek: jpeg: fix resolution change
 event handling in decoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261116013402.1273016-8-kyrie.wu@mediatek.com>
References: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
 <20261116013402.1273016-8-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 01:55:19 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] media: mtk-jpeg: infinite workqueue loop in
  mtk_jpegdec_worker()
--

commit ad29b1fb39c9c613b94dec7d4d11fb66bb5328c6
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix resolution change event handling in decoder

This commit checks for MTK_JPEG_SOURCE_CHANGE in mtk_jpegdec_worker() and
updates ctx->state before queueing the source change event.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 6e8b83987292c..a34f2d6a5b6e8 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1742,10 +1742,13 @@ static void mtk_jpegdec_worker(struct work_struct=
 *work)
>  	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>  	jpeg_src_buf =3D mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
> =20
> +	if (ctx->state =3D=3D MTK_JPEG_SOURCE_CHANGE)
> +		goto getbuf_fail;
> +
>  	if (mtk_jpeg_check_resolution_change(ctx,
>  					     &jpeg_src_buf->dec_param)) {
> -		mtk_jpeg_queue_src_chg_event(ctx);
>  		ctx->state =3D MTK_JPEG_SOURCE_CHANGE;
> +		mtk_jpeg_queue_src_chg_event(ctx);
>  		goto getbuf_fail;
>  	}

[Severity: High]
Does jumping to getbuf_fail when ctx->state is MTK_JPEG_SOURCE_CHANGE cause
an infinite workqueue loop on a resolution or format change?

Jumping to getbuf_fail leaves src_buf and dst_buf on the M2M ready queues
and calls v4l2_m2m_job_finish().  Unlike mtk_jpeg_dec_m2m_ops,
mtk_jpeg_multicore_dec_m2m_ops has no .job_ready callback to check
ctx->state, so v4l2_m2m_job_finish() -> v4l2_m2m_schedule_next_job() ->
__v4l2_m2m_try_queue() immediately re-queues the context and schedules
mtk_jpeg_multicore_dec_device_run() -> mtk_jpegdec_worker() again, spinning
across the M2M and decoder workqueues until userspace calls
VIDIOC_STREAMOFF.

Wiring .job_ready =3D mtk_jpeg_dec_job_ready in
mtk_jpeg_multicore_dec_m2m_ops would prevent M2M from scheduling new jobs
while ctx->state is MTK_JPEG_SOURCE_CHANGE.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116013402.1273=
016-1-kyrie.wu@mediatek.com?part=3D7
