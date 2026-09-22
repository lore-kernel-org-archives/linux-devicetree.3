Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD4C4570F8
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069365; cv=none; b=UlrPwfL/bhgjCFXClNGHEMooEB3z0IrMYY/ZE+PJ0fQUAY6TFox5taX4FyeTq49DjekuLhJfxCp5Vle4eVoafyTEFLyGl3NBxmXWKcR1QFll3AHxkBvx2Qxaq8a1aXyVy0uL6R3uRhs7JPpJZZQQOrr+ZTUa9+xGaMKW7jZZJXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069365; c=relaxed/simple;
	bh=ua84qvkAX86i8H3U3KJLoT/EVb4Qy2RH9ma32YV19BI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZBL8DjrSRcQ0FXVYhSKVEumYMLvKKlvhOrQu5nKsSxJD5PWan9xV1Vr8pEuW4CyLnzaQts2CW0wyCoNrMFwrcIYTOhsdoGY++haHHyc/OQo/00TYsBWLhNfrlX+5t7W5KW35XzkwSOUh2D+La0Vmx9HTxIQQl4LDYmDqKhUWTyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IzkNQrJP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IzkNQrJP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011931F000FF;
	Tue, 22 Sep 2026 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069364;
	bh=3pO1OALnXakKnuZABIAWFKcCQL1RXZGIyXtLJc4Z86I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IzkNQrJPHSQv3vUR5q1LhPpoVRiG+VJIyWFyhnn0y7tkwQq9MH7bwkg6p6tSB/aGh
	 FNvp/F4rMPu+kg0JtFQU15BLuxAbQFGkFOwrDF7EqVbwHua0eX9+Gu8QpG18bCweas
	 JomM7uknwXlyYVKF/zL8r+auD3QwRGEKA25pkh4/uj9hI35kAZJgxbu8+sb71drME1
	 Xe4Kkm9JejHA5iZabhbf0ctz3HF7N9VS5m4VLEA12zEAUOKjFGxZx+uKWYEVb2X2UL
	 bRImp3WZk3To61To3Dx9FnzAr6ZNNPWQuxNP5FAKmzM1IXoo8+2TKhxxl9xPMkqIQL
	 TTpdEMkhM9caw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 07/12] media: mediatek: jpeg: fix resolution change
 event handling in decoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260922091530.241762-8-kyrie.wu@mediatek.com>
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-8-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:29:23 +0000
Message-Id: <20260922092924.011931F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: mediatek: jpeg: data race in mtk_jpegdec_worker() on format=
 queues
--

commit 35ce87a0072442a39f5ea440c3ef1d674406f548
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix resolution change event handling in decoder

This commit refines the handling of resolution change events within the
JPEG decoder worker. It reorganizes operations to set up queue data before
signaling a source change and adds an early exit condition if the context is
already in the source change state.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index e152ebae0f219..edd9e2d0ab05f 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1738,11 +1738,15 @@ static void mtk_jpegdec_worker(struct work_struct=
 *work)
> =20
>  	if (mtk_jpeg_check_resolution_change(ctx,
>  					     &jpeg_src_buf->dec_param)) {
> -		mtk_jpeg_queue_src_chg_event(ctx);
> +		mtk_jpeg_set_queue_data(ctx, &jpeg_src_buf->dec_param);

[Severity: High]
Does this introduce a data race with concurrent V4L2 ioctl handlers?

The lockless worker thread mtk_jpegdec_worker() appears to be updating the
V4L2 context format queues (ctx->cap_q and ctx->out_q) asynchronously throu=
gh
mtk_jpeg_set_queue_data() without holding the video device lock.

Concurrent ioctls such as VIDIOC_G_FMT read these queue structures under
the video device lock. For example, in mtk_jpeg_g_fmt_vid_mplane():

    pix_mp->pixelformat =3D q_data->fmt->fourcc;
    pix_mp->num_planes =3D q_data->fmt->colplanes;

Could a local userspace application streaming a JPEG that changes
resolution trigger this race while concurrently invoking format-querying
ioctls, potentially exposing inconsistent format fields (like width, height,
and bytesperline) to userspace?

>  		ctx->state =3D MTK_JPEG_SOURCE_CHANGE;
> +		mtk_jpeg_queue_src_chg_event(ctx);
>  		goto getbuf_fail;
>  	}
> =20
> +	if (ctx->state =3D=3D MTK_JPEG_SOURCE_CHANGE)
> +		goto getbuf_fail;
> +
>  	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
>  	ret =3D pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
>  	if (ret < 0) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922091530.2417=
62-1-kyrie.wu@mediatek.com?part=3D7
