Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103725;
	b=C5W8+1noefUhLGE0bIlOeqzl7W0Hg2LD2Yqamk5If32sIdTVol1jOZa+vCdJkaSikk7n
	 uv44+kDuYJfdnHbK9FJEwvNEf9oHkSRTvmZsJcRwZADLZ7xS05ER7X4wq5EnrUtnPtXxF
	 8FlqAodtDdQSjtq5ezoy4mXePzKKNLNOrn7lPwFgfRFGnZ3xFFegKbqE0URPyBJqai1Jl
	 cqMHHd+MYkyx7/hJjwQC8jy/3i/FUVjfdgLA8XB0j9HPBnvT2tPCjaVBRjTbLrx92IVTS
	 OGv/sN7JrNYRG8ctJazJrpAAYR0fyYdUsN1XO2UpcjY77yawX7wIUnUT9puHEQq/APA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103725;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YrVGOjRfqKHwP7qoUxkAEPglbYyAY0QRy5UrY4lZPt8=;
	b=2Mh93pdwauEbNux54lO/PSLyHEE9+F52UK0WD82CYZV9WLZT4rh4G3tVOgBv2excSTNG
	 9rrATaoj8fbP3ITakvSNYqcDOjJhOUahpEUXah7Y9z99Og6+Jkqb2MdQQl8hJP/h09tg+
	 zAFzveS6/SSQEEgNs5mp79BkKYZqlnrwCG7/37W1QCHLOLN0FdUkXlsvZSI8SlOGt4SIJ
	 dlBVEAtW+39KIB01s5MrRMjGxzUobW26KxkL13sMU5H4tJrDWAeeEH3IGWqlvxCYetCOW
	 GUTaHiTn7NIsBHLFXVYdUDyBCG94ZmKU2uM3BKNOmcYD943rezhoVoadH8ulXPl2i1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AhYJFjBo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD92606A330
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AhYJFjBo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53681F000C5;
	Thu, 19 Nov 2026 15:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795103725;
	bh=YrVGOjRfqKHwP7qoUxkAEPglbYyAY0QRy5UrY4lZPt8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AhYJFjBoIAmsClTAeaEUVLWFUNGx2ZSnwV1vRnaaSo/cPP8T0aSfAzGC9p133upLd
	 3EyZf6Nuev/mR0rOXtAsBIgChyV998dQql/MLpV5WLjE1lim16I6DLHwJBMdVM6a0v
	 uwFB3fP+Iu1/oS3lxovjeQGQuYaZG8SB+RiWCt1OxZkiR69vDDzFEp5TTLTe7kbYus
	 VkIwhg6va/NrYSXZi7dJua2AYoDTDA7QV4xaO+0OCL5wXfId09V62FQWiUeOSul75L
	 27ojff0FXFcDolaMjrxwTERdWXKbcX88VQDpx7NCTQjM5xMMTrq2VUMQVKxGQExQlf
	 d1qiJrr1vfAjQ==
Message-ID: <sashiko-outbox-223441@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 07/28] media: mali-vpu: implement TRY_FMT and S_FMT
 ioctls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charvi Mehta" <charvi.mehta@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261119153758.1426673-8-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-8-charvi.mehta@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 15:55:24 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] media: mali-vpu: missing CAPTURE busy check in
  mali_vpu_s_fmt() on OUTPUT
- [Medium] media: mali-vpu: CAPTURE colorimetry lost in mali_vpu_s_fmt()
  and try_fmt
- [Medium] media: mali-vpu: incomplete field check in
  mali_vpu_try_format_common()
- [Medium] media: mali-vpu: early return on bad pixfmt in
  mali_vpu_try_format_common()
--

commit 5a51818e198650b05f2b6b84f5fbe1b7fdc55bf4
Author: Charvi Mehta <charvi.mehta@arm.com>

media: mali-vpu: implement TRY_FMT and S_FMT ioctls

This commit implements the VIDIOC_TRY_FMT and VIDIOC_S_FMT ioctls for the
decoder OUTPUT and CAPTURE queues and moves format lookup and buffer sizing
into shared helpers.

> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c b/driv=
ers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
> index b993255b8c817..dd142527a1a0c 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
[ ... ]
> @@ -168,32 +169,119 @@ static int mali_vpu_g_fmt(struct file *filp, void =
*fh, struct v4l2_format *fmt)
>  	return ret;
>  }
> =20
> -static const struct mali_vpu_format_desc *mali_vpu_find_format(struct ma=
li_vpu_session *sess,
> -							       u32 pixfmt, u32 type)
> +static int mali_vpu_try_format_common(struct mali_vpu_session *sess, str=
uct v4l2_format *fmt)
>  {
> -	const struct mali_vpu_format_desc *fmt_list;
> -	u32 num_fmts;
> -	u32 i;
> +	const struct mali_vpu_framesize_caps *fmsz =3D &sess->vpu_dev->variant-=
>frmsz_caps;
> +	struct v4l2_pix_format_mplane *pix_mp =3D &fmt->fmt.pix_mp;
> +	const struct mali_vpu_format_desc *vpu_fmt;
> +	const struct v4l2_format *port_fmt, *port_fmt_dec;
> +	struct vb2_queue *src_q;
> +	u32 w, h;
> +	int ret =3D 0;
> =20
> -	switch (type) {
> -	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		fmt_list =3D sess->port_src.supported_fmts.fmts;
> -		num_fmts =3D sess->port_src.supported_fmts.num_fmts;
> -		break;
> -	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		fmt_list =3D sess->port_dst.supported_fmts.fmts;
> -		num_fmts =3D sess->port_dst.supported_fmts.num_fmts;
> -		break;
> -	default:
> -		return NULL;
> +	vpu_fmt =3D mali_vpu_find_format(sess, pix_mp->pixelformat, fmt->type);
> +	if (!vpu_fmt) {
> +		port_fmt =3D mali_vpu_get_port_fmt(sess, fmt->type);
> +		if (!port_fmt)
> +			return -EINVAL;
> +
> +		*pix_mp =3D port_fmt->fmt.pix_mp;
> +		return 0;
> +	}

[Severity: Medium]
When pix_mp->pixelformat is unrecognized, should mali_vpu_try_format_common=
()
fall back to a supported format descriptor and continue validating the rest
of pix_mp instead of overwriting *pix_mp with port_fmt->fmt.pix_mp and
returning early?

Returning here discards the caller's requested width, height, and OUTPUT
colorimetry and skips v4l2_apply_frmsize_constraints() as well as the
streaming CAPTURE geometry lock.

> +
> +	/* Requested format found, validate other fields */
> +	w =3D pix_mp->width ? pix_mp->width : fmsz->width_default;
> +	h =3D pix_mp->height ? pix_mp->height : fmsz->height_default;
> +
> +	v4l2_apply_frmsize_constraints(&w, &h, &fmsz->stepwise);
> +
> +	/* Decode CAPTURE queue: lock geometry to input if streaming */
> +	if (sess->role =3D=3D MALI_VPU_DECODER && fmt->type =3D=3D V4L2_BUF_TYP=
E_VIDEO_CAPTURE_MPLANE) {
> +		src_q =3D v4l2_m2m_get_src_vq(sess->m2m_ctx);
> +		if (vb2_is_streaming(src_q)) {
> +			port_fmt_dec =3D &sess->port_src.curr_fmt;
> +			w =3D port_fmt_dec->fmt.pix_mp.width;
> +			h =3D port_fmt_dec->fmt.pix_mp.height;
> +		}
> +	}
> +
> +	ret =3D mali_vpu_fill_pixmp_fmt(vpu_fmt, w, h, pix_mp);
> +	if (ret)
> +		return ret;
> +
> +	if (pix_mp->field =3D=3D V4L2_FIELD_ANY)
> +		pix_mp->field =3D V4L2_FIELD_NONE;

[Severity: Medium]
Should pix_mp->field be set unconditionally to V4L2_FIELD_NONE?  Because the
driver only supports progressive frames, checking only for V4L2_FIELD_ANY
leaves any other field value (such as V4L2_FIELD_INTERLACED or an invalid
value from userspace) intact in fmt and port->curr_fmt.

> +
> +	return 0;
> +}
> +
> +static int mali_vpu_try_fmt(struct file *filp, void *fh, struct v4l2_for=
mat *fmt)
> +{
> +	struct mali_vpu_session *sess =3D mali_vpu_get_session(filp);
> +	int ret;
> +
> +	mutex_lock(&sess->vq_lock);
> +
> +	ret =3D mali_vpu_try_format_common(sess, fmt);
> +
> +	mutex_unlock(&sess->vq_lock);
> +	return ret;
> +}
> +
> +static int mali_vpu_s_fmt(struct file *filp, void *fh, struct v4l2_forma=
t *fmt)
> +{
> +	struct mali_vpu_session *sess =3D mali_vpu_get_session(filp);
> +	struct vb2_queue *vq;
> +	struct v4l2_pix_format_mplane *pixmp_src =3D &sess->port_src.curr_fmt.f=
mt.pix_mp;
> +	struct v4l2_pix_format_mplane *pixmp_dst =3D &sess->port_dst.curr_fmt.f=
mt.pix_mp;
> +	int ret =3D 0;
> +
> +	mutex_lock(&sess->vq_lock);
> +
> +	vq =3D v4l2_m2m_get_vq(sess->m2m_ctx, fmt->type);
> +	if (vb2_is_busy(vq)) {
> +		ret =3D -EBUSY;
> +		goto mutex_unlock_return;
> +	}
> +
> +	ret =3D mali_vpu_try_format_common(sess, fmt);
> +	if (ret)
> +		goto mutex_unlock_return;
> +
> +	/* OUTPUT provides initial CAPTURE geometry */
> +	if (V4L2_TYPE_IS_OUTPUT(fmt->type)) {
> +		const struct mali_vpu_format_desc *cap_fmt;
> +		struct v4l2_pix_format_mplane *cap;
> +		struct v4l2_pix_format_mplane *fmt_mp =3D &fmt->fmt.pix_mp;
> +
> +		cap =3D &sess->port_dst.curr_fmt.fmt.pix_mp;
> +		cap_fmt =3D mali_vpu_find_format(sess, cap->pixelformat,
> +					       V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +		if (!cap_fmt) {
> +			ret =3D -EINVAL;
> +			goto mutex_unlock_return;
> +		}
> +
> +		ret =3D mali_vpu_fill_pixmp_fmt(cap_fmt, fmt_mp->width, fmt_mp->height=
, cap);
> +		if (ret)
> +			goto mutex_unlock_return;
> +	}

[Severity: Medium]
Can VIDIOC_S_FMT on the OUTPUT queue overwrite sess->port_dst.curr_fmt while
CAPTURE buffers are already allocated?

Only the queue for fmt->type is checked with vb2_is_busy(vq).  If userspace
allocates CAPTURE buffers and then calls VIDIOC_S_FMT on OUTPUT with a new
resolution, sess->port_dst.curr_fmt.fmt.pix_mp is updated in place without
checking whether the destination queue is busy, which violates the V4L2
stateful decoder specification and causes later VIDIOC_PREPARE_BUF or
VIDIOC_QBUF calls on existing CAPTURE buffers to fail size validation in
mali_vpu_vb2_buffer_prepare().

> +
> +	if (V4L2_TYPE_IS_OUTPUT(fmt->type))
> +		sess->port_src.curr_fmt =3D *fmt;
> +	else
> +		sess->port_dst.curr_fmt =3D *fmt;
> +
> +	/* Keep peer queue colorimetry aligned with input */
> +	if (V4L2_TYPE_IS_OUTPUT(fmt->type)) {
> +		pixmp_dst->colorspace	=3D pixmp_src->colorspace;
> +		pixmp_dst->ycbcr_enc	=3D pixmp_src->ycbcr_enc;
> +		pixmp_dst->quantization =3D pixmp_src->quantization;
> +		pixmp_dst->xfer_func	=3D pixmp_src->xfer_func;
> +	}

[Severity: Medium]
Does calling VIDIOC_TRY_FMT or VIDIOC_S_FMT on the CAPTURE queue lose the
OUTPUT colorimetry?

mali_vpu_try_format_common() does not copy colorspace, ycbcr_enc,
quantization, and xfer_func from sess->port_src.curr_fmt.fmt.pix_mp when
fmt->type is V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE.  As a result,
VIDIOC_TRY_FMT on CAPTURE returns the caller's unaligned colorimetry, and
VIDIOC_S_FMT on CAPTURE overwrites sess->port_dst.curr_fmt with *fmt,
clobbering the colorimetry propagated during VIDIOC_S_FMT on OUTPUT.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119153758.1426=
673-1-charvi.mehta@arm.com?part=3D7
