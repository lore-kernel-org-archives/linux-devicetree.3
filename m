Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C183B1EE4
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555551; cv=none; b=fCAX3DTvFyfzBA4dyadMCw5znlomOPe7fzUY6Mqf9PnXk4g8AgOhPPgbjWLq2BaBK4SUbqACtoyhJkbrOUzGg0QHpQaQCoRNdUP1ijs00aMrugptJVGIqaBUyq9ueqLWAS7iiCKEysPJVOHA25gZC6NlE5oNCGn8o+S2ohnbfOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555551; c=relaxed/simple;
	bh=jtSzqE/wa2kGcr/fyqHGRp3dADrPe5kvCoCdn9M8Obw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Labh+k6rx53+aTNmT5lcnM7e/6hSHwn/6XCLS4DkH/vgClDJAKM21RDytcanxz5vaIasf/KEdMllQ4FMxJhPba5C8m1oafYvdzkGgCxZy8QJMe/0onZK9TF2n6glYPm6Y0iw912YR+ha/KETDz+OOaol3AUj+cqtA25zFR5Z2v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDPE7SB8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDPE7SB8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E11C1F000E9;
	Mon, 20 Jul 2026 13:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784555550;
	bh=KTKo5pmij10EmZZxvPp/8hIFcb/RdzC7IC2oMs3tPRc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dDPE7SB85AnuUAL/WxaRLDIPn0CmSdUFazc50Ub1m6vPq0iTaIO201QRu/4uO8vHY
	 A/YZvhpylBc+C2CsTaYLFqOrH0UITqAL5webxUMMAPdW/2Xgew0lOkqQSrOnO+j3OO
	 XXI4UmryuzyMSJNHHGbn2q3xZzPKZzxq2s81OuJfCJENduqonnqVrPGcvo5Vy8Ik0N
	 9/Q/TYgsqZ2Y1TgjGk6clWRwBzmO0mkGOfVgwUSAQ37UMSavnSrsHk2Asg16z788t+
	 FgUReF2ElgLMK2yd9OEvtzZK/0eiWAGGC2bgTUSjufkl2DdQAHj+o3vhsf3P+XB7uq
	 PWA1rQANWRJpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 02/12] media: mediatek: jpeg: fix jpeg buffer
 payload size setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260720133432.1042046-3-kyrie.wu@mediatek.com>
References: <20260720133432.1042046-1-kyrie.wu@mediatek.com>
 <20260720133432.1042046-3-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 13:52:29 +0000
Message-Id: <20260720135230.5E11C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Use of uppercase MIN() macro for variable arguments bypasses kernel=
 type checking.

Pre-existing issues:
- [Critical] Premature `v4l2_m2m_job_finish` in worker threads breaks `stop=
_streaming` synchronization, leading to Use-After-Free of `ctx` and DMA int=
o freed memory.
--

--- Patch [2]: [PATCH v16 02/12] media: mediatek: jpeg: fix jpeg buffer pay=
load size setting ---
commit b1d3acc23e7ae23715523f548df3f13e353a48e9
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix jpeg buffer payload size setting

For multi-core jpegdec, if one core gets resolution change event,
the payload size, representing the size of Y/C data, needs to change.
But others are decoding at the same time and it can not be changed
immediately, which results in the payload size not matching the real
buffer length.
The payload size must be less than the real buffer length to avoid
warning logs.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 41c4cf8dc2626..34135706a4ac3 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

[ ... ]

> @@ -710,12 +711,20 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *=
vb)
> =20
>  	for (i =3D 0; i < q_data->fmt->colplanes; i++) {
>  		plane_fmt =3D q_data->pix_mp.plane_fmt[i];
> +		max_size =3D plane_fmt.sizeimage;
> +
>  		if (ctx->enable_exif &&
> -		    q_data->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> -			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +
> -					      MTK_JPEG_MAX_EXIF_SIZE);
> -		else
> -			vb2_set_plane_payload(vb, i,  plane_fmt.sizeimage);
> +			q_data->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
> +			max_size +=3D MTK_JPEG_MAX_EXIF_SIZE;
> +
> +			vb2_set_plane_payload(vb, i,
> +					      MIN(vb->planes[i].length,
> +						  max_size));

[Severity: Low]
Is it appropriate to use the uppercase MIN() macro here?=20

The MIN() macro in linux/minmax.h is generally intended for obvious constan=
ts
because it skips type checking.

Could this bypass type safety between size_t (max_size) and unsigned int
(length)?=20

Would it be better to use min() with a cast, or min_t(size_t, ...) instead?

> +		} else {
> +			vb2_set_plane_payload(vb, i,
> +					      MIN(plane_fmt.sizeimage,
> +						  vb->planes[i].length));

[Severity: Low]
Does this also have the same type checking concern with the MIN() macro as
mentioned above?

> +		}
>  	}
> =20
>  	return 0;

[Severity: Critical]
While reviewing this patch, I noticed a separate issue in the worker thread=
s.
This isn't a bug introduced by this patch, but it appears that premature job
finishing could lead to a Use-After-Free.

In mtk_jpegdec_worker():

    mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
    v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);

If the worker calls v4l2_m2m_job_finish() and removes buffers from V4L2
context tracking while the hardware is still processing them asynchronously,
could an unprivileged user closing the file descriptor trigger a release?

If mtk_jpeg_release() is called, it frees the context:

    kfree(ctx);

Then when the hardware interrupt fires later in mtk_jpegdec_hw_irq_handler(=
):

    ctx =3D jpeg->hw_param.curr_ctx;
    ...
    pm_runtime_put(ctx->jpeg->dev);

Doesn't this result in the interrupt handler unconditionally accessing the
freed 'ctx' pointer and invoking V4L2 completion on freed buffers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720133432.1042=
046-1-kyrie.wu@mediatek.com?part=3D2
