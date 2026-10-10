Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA863803DB
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 08:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620681; cv=none; b=cbuIOMOTThYvJOQ+XDMKuLg3m5P43cXUyCDXVd/apXwoKzehpxB+rpTKhoG6MvpKt1b1qL3FZO/i1pYJwFQ5B3OqYvVM84v+y7nV0U5T8dI47otA69vONLVX8+mS3d+KKWwmx1j2IXj0kzuWflK048ku7pHi6V2r9jxsLXtwIug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620681; c=relaxed/simple;
	bh=0XModeKfBVvi28Q9fnTZMJxMCineqSm6B566gHw7GyE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MRSdaRW23NlCz2HVmMeYAif8hPmKPMVJh/yGjzeLLv/5b6F3+i3gGgYyB3US25sdM6I26cHfluHo1BlUhoFaDDg0fpnsqLnBQQBd4y6mwQLGcqp4VyzLaS9Kthk3izHLVN8t65O95uZrkirON07/TW/KHe9edxWOBgMmVXBer4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzhnUJjf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzhnUJjf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785331F000FF;
	Sat, 10 Oct 2026 08:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791620676;
	bh=7MooVUdspy2soibfx4EDLPiVmdTGOyb04ipSJikj0i8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lzhnUJjfhpF0XjJSEWDJuBVJeimzTbOgeDd5Pcof1MCRDQuCXS3JTCtzuIoOThIu/
	 CIJEkatty0ZZGc3BvyPMDZksSd0sa0oypYImIKKCIfm6n4EL5vX5vWOmIAlcbOqTLA
	 P5wydtOGSuFWg9osqAWhfHALKsKlLhkvkPUz/v8VRu0DNJ5+A7fVPrrFNQhH+KuTpD
	 IHs6j3kFM7zNgKuDuyLpizJxAJAa7avJOI3wPP08SLHRrbF/j4M+Ix8wsZGyD3x2BA
	 3XuYZJZsqTJMdfL++2PB23uITdyIFhobEHrqQWpaeXKdjoNAzoPAl5nkSjEaG0lueS
	 UY86Zl7zxmd+Q==
Message-ID: <sashiko-outbox-166343@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 07/13] media: mediatek: jpeg: fix resolution change
 event handling in decoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <d32a1c2510d7f1f1517fdfba482c65cfa7c18cd7.1791614327.git.kyrie.wu@mediatek.com>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
 <d32a1c2510d7f1f1517fdfba482c65cfa7c18cd7.1791614327.git.kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 08:24:35 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: mtk-jpeg: infinite loop in worker on MTK_JPEG_SOURCE_CHANGE
- [High] media: mtk-jpeg: unprotected queue data mutation in async worker
--

commit 1072cbb260c137f5bbe5c089ef41101b9ac96729
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix resolution change event handling in decoder

This commit refines the handling of resolution change events in the JPEG
decoder worker. It updates the queue data before queuing the source
change event and setting the state to MTK_JPEG_SOURCE_CHANGE. It also
adds an early exit when the context is already in the source change state.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index e152ebae0f219..edd9e2d0ab05f 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

[ ... ]

> @@ -1738,11 +1738,15 @@ static void mtk_jpegdec_worker(struct work_struct=
 *work)
> =20
>  	if (mtk_jpeg_check_resolution_change(ctx,
>  					     &jpeg_src_buf->dec_param)) {
> -		mtk_jpeg_queue_src_chg_event(ctx);
> +		mtk_jpeg_set_queue_data(ctx, &jpeg_src_buf->dec_param);

[Severity: High]
Does calling mtk_jpeg_set_queue_data() here mutate ctx->out_q and ctx->cap_q
without holding jpeg->lock? Since this runs in an asynchronous worker threa=
d,
can concurrent V4L2 ioctls (like VIDIOC_G_FMT) issued from user space race
with these updates?

Updating the resolution before user space acknowledges the change with
STREAMOFF might also violate the driver's documented architectural contract.

>  		ctx->state =3D MTK_JPEG_SOURCE_CHANGE;
> +		mtk_jpeg_queue_src_chg_event(ctx);
>  		goto getbuf_fail;
>  	}
> =20
> +	if (ctx->state =3D=3D MTK_JPEG_SOURCE_CHANGE)
> +		goto getbuf_fail;

[Severity: High]
Could this introduce an infinite loop? If we jump to getbuf_fail here, the =
job
finishes without consuming the pending buffers.

Because mtk_jpeg_multicore_dec_m2m_ops lacks a .job_ready callback:

static const struct v4l2_m2m_ops mtk_jpeg_multicore_dec_m2m_ops =3D {
	.device_run =3D mtk_jpeg_multicore_dec_device_run,
};

the V4L2 M2M core assumes the device is always ready. Will the M2M core
immediately requeue the context, causing the worker to run again, hit this
same check, and loop infinitely consuming 100% CPU?

> +
>  	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
>  	ret =3D pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
>  	if (ret < 0) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791614327.gi=
t.kyrie.wu@mediatek.com?part=3D7
