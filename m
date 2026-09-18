Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6D0515995
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738844; cv=none; b=f0/tEoRIkDxqmjBgXjA0f+e4gSCYUTbUQvaU51HVX505MgGBYQ6ZcIQ1VMmo67lBgZLM01iEJpaNtLhR8++dfJca8wB0JkfSNhrl+XbxY8MA8kRYpLAlYz+QTnF5ZIeb+iZ9NoGRLmG32hKxFZDP4SvpRPn8CPhWUQEZ0WmUO3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738844; c=relaxed/simple;
	bh=ZDxOCvShpHutjhsL2fBtJ2Fiw1jke132QPGapHMPBvg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SGWFEBsUtySq3eUpCJd3YrT9dub6tcJ4uXQHoT/3FBidjZHunbz0jaM0U8cfjIGwqJttTy+e/zpC+F0PI1xKEo36elNTu18smuucE+iev6LjMLvg4NbvAwTwsGtp6Rohc2mGdExSEN86CMHPOrHAiSX113kJWw4ZEGQBZgb8XSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RgmAmc7I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RgmAmc7I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AD01F0089B;
	Fri, 18 Sep 2026 13:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789738842;
	bh=/TqgFRDwZA2QQ1avUpKUqMWfrysXh1GGmXbdCCdHN2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RgmAmc7IHHbH2j7qFT1oKrgNHrODapz457PZFFlzO5eZ+dBbLgmSEjPsBcVICJXxB
	 NFh75tlP19TfFpTXqytuxFW6wTKQkMU/VbMUjJdRb5rZuX4ztRyFiVBA6rGedcQ/gL
	 S2lx1sq1ydE48t4Um6plxc1VY5eHfBvJoLhJhg18hlVTwqOP2wCA+WmXsnng81efsk
	 JIMQrq4fLDxx18Jp59ESX617qv4Xv8tBpK8GshviDz5JlMhDavP0yBxQvvte+t37vm
	 h5iSIRQulALUt4gK2rhvP+8baHWqT4WHPIMFqRTjsl4gkotjkwH/G+f8q/bjtwGVtE
	 Cqo+OEIJJQNfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/14] media: apple: avd: add h264 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918-avd-v1-11-49977931f455@icloud.com>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
 <20260918-avd-v1-11-49977931f455@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 13:40:41 +0000
Message-Id: <20260918134041.D7AD01F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [Critical] media: avd: UAF and double free of ctx->job.segments
- [Critical] media: avd: heap buffer overflow via slice array bounds bypass
- [High] media: avd: out-of-bounds read of decode->dpb
- [High] media: avd: out-of-bounds read during emulation prevention byte pa=
rsing
- [High] media: avd: NULL pointer dereference when mapping DMABUF
- [High] media: avd: hardware fault due to missing validation of unsupporte=
d bitstream features
- [High] media: avd: out-of-bounds read on prediction weights array
- [Medium] media: avd: memory leak on avd_buf_alloc failure
- [Medium] media: avd: memory leak of ctx->job.segments on hold capture buf=
fer
--

commit e586c8ed1b0833cc07bcac3fd55d2cbf73dddc3d
Author: Sofus Forstreuter <sofus.c@icloud.com>

media: apple: avd: add h264 support

This commit adds hardware video decoding support for H.264 on Apple
Silicon devices via the Apple Video Decoder (AVD).

> diff --git a/drivers/media/platform/apple/avd/avd-h264.c b/drivers/media/=
platform/apple/avd/avd-h264.c
> new file mode 100644
> index 0000000000000..6262b2f633004
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-h264.c
[ ... ]
> +static void stream_weights(struct avd_ctx *ctx, struct avd_h264_run *run)
> +{
[ ... ]
> +	for (int y =3D 0; y < 2; y++) {
> +		if (y =3D=3D 1 && sl->slice_type !=3D V4L2_H264_SLICE_TYPE_B)
> +			break;
> +
> +		factors =3D weights->weight_factors[y];
> +		int to =3D y =3D=3D 0 ? sl->num_ref_idx_l0_active_minus1 :
> +				  sl->num_ref_idx_l1_active_minus1;
> +		for (int i =3D 0; i < to + 1; i++) {
> +			/*
> +			 * AVD only expects offsets/weights if they are not
> +			 * the default ones, otherwise we get artifacts
> +			 */
> +			if (factors.luma_weight[i] !=3D luma_denom ||

[Severity: High]
Does this loop read past the 32-element prediction weight arrays if a user
provides an active index greater than 31? The loop bound depends on the
unbounded 8-bit user value num_ref_idx_l0_active_minus1 or
num_ref_idx_l1_active_minus1.

> +			    factors.luma_offset[i] !=3D 0) {
[ ... ]
> +static void stream_slice(struct avd_ctx *ctx, struct avd_h264_run *run)
> +{
[ ... ]
> +	/* include emulation byte in offset to slice header */
> +	while (bytes_read < min_off) {
> +		if (data[off - 2] !=3D 0x00 || data[off - 1] !=3D 0x00 ||
> +		    data[off] !=3D 0x03)
> +			bytes_read++;
> +		off++;
> +	}

[Severity: High]
Is it possible for off to advance past the end of the mapped slice payload?
If a malformed bitstream repeats 0x00 0x00 0x03 sequences, could this loop
exceed payload_len and cause an integer underflow when calculating
payload_len - off below?

> +
> +	coded_in =3D h264_ctx->active_slice->addr + off;
> +
> +	push(AVD_OP_CODED_DATA |
[ ... ]
> +	if (sl->slice_type =3D=3D V4L2_H264_SLICE_TYPE_B) {
> +		/* bidirectional reference of previous mv */
> +		ref =3D avd_get_ref_buf(
> +			ctx, &dst->base.vb,
> +			decode->dpb[sl->ref_pic_list1[0].index].reference_ts);

[Severity: High]
Can the user-controlled sl->ref_pic_list1[0].index exceed the bounds of the
16-element decode->dpb array? It appears this index is used directly without
validation, which could lead to an out-of-bounds read.

> +
> +		mv_color_addr =3D
[ ... ]
> +static int avd_h264_alloc_bufs(struct avd_ctx *ctx)
> +{
[ ... ]
> +	ret =3D avd_buf_alloc(dev, &h264_ctx->bufs.above_info, mb * 20);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D avd_buf_alloc(dev, &h264_ctx->bufs.ip_above, bit_depth * 4 * mb=
);
> +	if (ret)
> +		return ret;

[Severity: Medium]
If a later allocation fails in this sequence, what happens to the previously
allocated DMA buffers? For example, if the ip_above allocation fails, the
function returns the error directly without freeing bufs.above_info,
potentially leaking memory.

> +
> +	ret =3D avd_buf_alloc(dev, &h264_ctx->bufs.lf_above,
[ ... ]
> +static int avd_h264_validate_sps(struct avd_ctx *ctx,
> +				 const struct v4l2_ctrl_h264_sps *sps)
> +{
> +	if (sps->chroma_format_idc > 2)
> +		/* Only 4:0:0, 4:2:0 and 4:2:2 are supported */
> +		return -EINVAL;

[Severity: High]
Does this validation routine properly reject unsupported bitstream features
(such as arbitrary slice order or redundant pictures)? The commit message
mentions that some test case features are not rejected and cause the hardwa=
re
to fault. Is it possible for unprivileged userspace to trigger this fault?

> +	if (sps->bit_depth_luma_minus8 !=3D sps->bit_depth_chroma_minus8)
[ ... ]
> +static int avd_h264_start(struct avd_ctx *ctx)
> +{
[ ... ]
> +	h264_ctx->alloc_slice_num =3D
> +		ctrl->p_new.p_h264_sps->pic_height_in_map_units_minus1 + 1;
> +	h264_ctx->slices =3D kzalloc_objs(*h264_ctx->slices,
> +					h264_ctx->alloc_slice_num, GFP_KERNEL);
> +	if (!h264_ctx->slices)
> +		goto err_free_ctx;
> +
> +	ret =3D avd_h264_alloc_bufs(ctx);
> +	if (ret)
> +		goto err_free_ctx;
> +
> +	return 0;
> +
> +err_free_ctx:
> +	kfree(h264_ctx);
> +	ctx->priv =3D NULL;
> +	return ret;

[Severity: Medium]
If avd_h264_alloc_bufs() fails, does this error path leak memory? It looks
like h264_ctx->slices is never freed before returning here.

> +}
[ ... ]
> +static int avd_h264_run(struct avd_ctx *ctx)
> +{
[ ... ]
> +	if (ctx->job.segments &&
> +	    h264_ctx->slice_num >=3D h264_ctx->alloc_slice_num) {
> +		ret =3D avd_h264_realloc_slices(ctx);
> +		if (ret)
> +			goto err_free_jobs;
> +	}

[Severity: Critical]
If a user queues slices without first_mb_in_slice =3D=3D 0, avd_init_job is
bypassed and ctx->job.segments remains NULL. Wouldn't this bypass the bounds
check entirely? This might allow h264_ctx->slice_num to keep growing and wr=
ite
out of bounds on the heap when it accesses the active slice below.

> +
> +	src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	h264_ctx->active_slice =3D &h264_ctx->slices[h264_ctx->slice_num];
> +	ret =3D avd_buf_alloc(ctx->dev, h264_ctx->active_slice,
> +			    vb2_get_plane_payload(&src->vb2_buf, 0));
> +	if (ret)
> +		goto err_free_jobs;
> +	memcpy(h264_ctx->active_slice->cpu, vb2_plane_vaddr(&src->vb2_buf, 0),
> +	       h264_ctx->active_slice->size);

[Severity: High]
Can vb2_plane_vaddr() return NULL here if the provided buffer cannot be map=
ped
(e.g., an unmappable DMABUF)? Passing a NULL pointer directly to memcpy cou=
ld
lead to a kernel panic.

> +	h264_ctx->slice_num++;
[ ... ]
> +	if (is_new_frame(run.slice_params)) {
> +		ret =3D avd_init_job(ctx, AVD_CODEC_H264,
> +				   h264_ctx->alloc_slice_num + 1);

[Severity: Medium]
If a previous operation left a populated ctx->job.segments without submitti=
ng
it, does avd_init_job() unconditionally overwrite ctx->job.segments and leak
the old array?

> +		if (ret)
> +			return ret;
> +		stream_hdr(ctx, &run);
> +	}
[ ... ]
> +	if (run.base.bufs.src->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF) {
> +		avd_job_finish(ctx, VB2_BUF_STATE_DONE);
> +		return 0;
> +	}

[Severity: Medium]
When V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF is set, we bypass avd_submit_job()
which usually frees ctx->job.segments. Could this cause a memory leak of the
segments array if a new frame is processed subsequently?

> +
> +	return avd_submit_job(ctx);
> +
> +err_free_jobs:
> +	kfree(ctx->job.segments);
> +	return ret;

[Severity: Critical]
Is it possible to encounter a Use-After-Free here? We call kfree on
ctx->job.segments, but we don't set the pointer to NULL. If a subsequent m2m
operation bypasses avd_init_job(), could it read from or double-free this
dangling pointer via avd_h264_realloc_slices()?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-avd-v1-0-4=
9977931f455@icloud.com?part=3D11
