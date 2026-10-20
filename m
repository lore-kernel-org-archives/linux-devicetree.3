Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500649;
	b=idH9Mlvi9VD9qLf6516HJwFQU0GAvXbsF+rtQnbXGJ0RNE5YGv5lp7NcsPkKmJs+j6lc
	 ZcLxuL4Zc0ZyHWSs/bxkWAoMDqkzYdt9nwXSHgY8dpfOfMmz1/Or3fIjq/Ll3jWNLe2pj
	 k1hRdKYS1n4E/TYV9L+fAAFCzZH0I7LigI9QNQV3WluEO8z73FOLq2VLEfAI5NHjmMQzK
	 6aLOzRsm8wJ/5pJcZIs/jTcFjydKnDAqM/lmBCyO3aVkyVeoMV8Z+xP0ZFBrL9hczdqkQ
	 diayj4AL8QRSlYQVnaOOhGFIWGqa9RdxoKZC/s5959if8No1ZpQuqfTskP9eBoYT4IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500649;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Agmfzpd3YfpFarKEcggJLP0euxFoSLSZqdyN/O7DpIM=;
	b=j68s42lE5bgALsOGa2rv18LtbaKT61oo3MwBTOCuantjv2NnsxJUDbCOctpwtkoj+nY8
	 0OpiJRCVthK/bn43mBloNJ7vpMK8IxK1YPBSWlSE1NX9wL8ptRIM2I9ZDgkfjjXDe/w4A
	 sWNhPNHLqxXTmyTPyxY21ePkKmgyBIv5robdid0mcE8Sn63bcL659WTxcmM676idwlm/n
	 Rs9MlyLivNy6s9zM2P73yM5bp7Qua4z4CmzoDXq2Ovct2SLB+V/Vp2WjMhz+CCTq0lJnq
	 XlOeMiwz+sj8Q9yqgs0/cz02Zdm/R2+cFaNnY+SGTsyz6p6fQK/f7d8wx/YLpHJz59w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X0DwkItp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B2A606A31A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X0DwkItp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C781F000C4;
	Tue, 20 Oct 2026 12:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792500648;
	bh=Agmfzpd3YfpFarKEcggJLP0euxFoSLSZqdyN/O7DpIM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X0DwkItpuI+z8r4HXrQGEPezuIWRGeApqZtKY/cTXUmXUi+zpauSTMfjj590KcKGK
	 vO4JmuenXTuSV+WXFYgGOqXozih5oRCWWeq2UCl96uZS4qAv47sB7QfjCblQTYP521
	 oiaPjSKIlxKcv8xI7PJX2/rke2UVuMMkL5ZL8TVztZQPWdRtI2nIrMEL4dXyzJ5PI1
	 AtAQD3OL4GoFZOPohOHjcuYk0rSBf3Ru8XTon+8R41InEvXDXd0n1ZbYg0eYF3ioSb
	 krr1WfUjja+KtVbDZJPq4yWqz+zTVYlPELII9VrnYWPZddkXep3+LFXOBFeKoCdAkq
	 tkO/9NH5bwdhQ==
Message-ID: <sashiko-outbox-178970@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/17] media: apple: avd: add av1 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261020-avd-v3-10-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
 <20261020-avd-v3-10-85cbaa2125d8@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 12:50:47 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [Critical] media: apple: avd: out-of-bounds memcpy in avd_av1_set_prob()
- [High] media: apple: avd: out-of-bounds read via ref_frame_idx in set_ref=
_hdr()
- [High] media: apple: avd: division by zero in calc_upscale() and set_refs=
()
- [High] media: apple: avd: signedness bug on tile_row/tile_col in set_tile=
s()
- [High] media: apple: avd: wrong ctrl->new_elems check in avd_av1_run_prea=
mble()
- [High] media: apple: avd: unallocated or zeroed seg buf in avd_av1_alloc_=
work_bufs()
- [High] media: apple: avd: 32-bit size overflows in avd_av1_alloc_work_buf=
s()
- [High] media: apple: avd: unchecked vb2_plane_vaddr() in avd_av1_set_prob=
()
- [Medium] media: apple: avd: stale shear params across loop in set_refs()
- [Medium] media: apple: avd: shift out of bounds in avd_av1_get_dist()
--

commit 95a7361b2c67e717bce66aec970bc8cee08fcb4a
Author: Sofus Forstreuter <sofus.c@icloud.com>

media: apple: avd: add av1 support

This commit adds AV1 video decoding support to the Apple Video Decoder
(AVD) driver, including entropy probability tables, hardware command
submission, and V4L2 stateless control registration.

> diff --git a/drivers/media/platform/apple/avd/avd-av1.c b/drivers/media/p=
latform/apple/avd/avd-av1.c
> new file mode 100644
> index 0000000000000..7a96fd53a5241
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-av1.c

[ ... ]

> +static void
> +avd_av1_dec_get_shear_params(const u32 *params, s64 *alpha,
> +			     s64 *beta, s64 *gamma, s64 *delta)
> +{
> +	const int *mat =3D params;
> +	short shift;
> +	short y;
> +	long long gv, dv;
> +
> +	if (mat[2] <=3D 0)
> +		return;
> +
> +	*alpha =3D clamp_val(mat[2] - (1 << WARPEDMODEL_PREC_BITS), S16_MIN, S1=
6_MAX);
> +	*beta =3D clamp_val(mat[3], S16_MIN, S16_MAX);
> +
> +	y =3D avd_av1_dec_resolve_divisor_32(abs(mat[2]), &shift) * (mat[2] < 0=
 ? -1 : 1);
> +
> +	gv =3D ((long long)mat[4] * (1 << WARPEDMODEL_PREC_BITS)) * y;
> +
> +	*gamma =3D clamp_val((int)AV1_DIV_ROUND_UP_POW2_SIGNED(gv, shift), S16_=
MIN, S16_MAX);
> +
> +	dv =3D ((long long)mat[3] * mat[4]) * y;
> +	*delta =3D clamp_val(mat[5] -
> +		(int)AV1_DIV_ROUND_UP_POW2_SIGNED(dv, shift) - (1 << WARPEDMODEL_PREC_=
BITS),
> +		S16_MIN, S16_MAX);
> +
> +	*alpha =3D AV1_DIV_ROUND_UP_POW2_SIGNED(*alpha, WARP_PARAM_REDUCE_BITS)
> +		 * (1 << WARP_PARAM_REDUCE_BITS);
> +	*beta =3D AV1_DIV_ROUND_UP_POW2_SIGNED(*beta, WARP_PARAM_REDUCE_BITS)
> +		* (1 << WARP_PARAM_REDUCE_BITS);
> +	*gamma =3D AV1_DIV_ROUND_UP_POW2_SIGNED(*gamma, WARP_PARAM_REDUCE_BITS)
> +		 * (1 << WARP_PARAM_REDUCE_BITS);
> +	*delta =3D AV1_DIV_ROUND_UP_POW2_SIGNED(*delta, WARP_PARAM_REDUCE_BITS)
> +		* (1 << WARP_PARAM_REDUCE_BITS);
> +}
> +
> +static struct avd_decoded_buffer*
> +avd_av1_get_ref_buf(struct avd_ctx *ctx, struct avd_av1_run *run, int id=
x)
> +{
> +	const struct v4l2_ctrl_av1_frame *frame =3D run->frame;
> +	struct avd_decoded_buffer *dst;
> +	u64 ts;
> +
> +	dst =3D vb2_to_avd_decoded_buf(&run->base.bufs.dst->vb2_buf);
> +
> +	if (idx < 0 || idx >=3D V4L2_AV1_TOTAL_REFS_PER_FRAME ||
> +	    frame->ref_frame_idx[idx] >=3D ARRAY_SIZE(frame->reference_frame_ts=
))
> +		ts =3D -1;
> +	else
> +		ts =3D frame->reference_frame_ts[frame->ref_frame_idx[idx]];

[Severity: High]
In avd_av1_get_ref_buf(), frame->ref_frame_idx is declared as
__s8 ref_frame_idx[V4L2_AV1_REFS_PER_FRAME] (7 signed elements), whereas
V4L2_AV1_TOTAL_REFS_PER_FRAME is 8.

If idx =3D=3D 7, or if frame->ref_frame_idx[idx] is negative (since __s8 is
signed and not cast to unsigned before comparing with ARRAY_SIZE()), will
this read out of bounds on frame->ref_frame_idx[] or
frame->reference_frame_ts[]?

> +
> +	return avd_get_ref_buf(ctx, &dst->base.vb, ts);
> +}
> +
> +static void set_refs(struct avd_ctx *ctx, struct avd_av1_run *run)
> +{
> +	struct avd_av1_ctx *av1_ctx =3D ctx->priv;
> +	const struct v4l2_ctrl_av1_frame *frame =3D run->frame;
> +	const struct v4l2_av1_global_motion *gm =3D &frame->global_motion;
> +	int i, ref_idx;
> +	struct avd_decoded_buffer *ref;
> +	bool intrabc =3D !!(frame->flags & V4L2_AV1_FRAME_FLAG_ALLOW_INTRABC);
> +	int height, width, x_scale, y_scale;
> +	s64 alpha =3D 0, beta =3D 0, gamma =3D 0, delta =3D 0;
> +	dma_addr_t addr;
> +
> +	height =3D frame->frame_height_minus_1 + 1;
> +	width =3D frame->frame_width_minus_1 + 1;
> +
> +	push(0, "ref_cnst0");
> +	pusha(av1_ctx->bufs.mv_above_info.addr, "mv_above_info", 0);
> +
> +	for (i =3D 0; i < 4; i++)
> +		push(0, "ref_cnst1");
> +
> +	for (i =3D 0; i < (intrabc ? 1 : V4L2_AV1_REFS_PER_FRAME); i++) {
> +		ref_idx =3D i + V4L2_AV1_REF_LAST_FRAME;
> +		ref =3D avd_av1_get_ref_buf(ctx, run, intrabc ? -1 : i);
> +		addr =3D vb2_dma_contig_plane_dma_addr(&ref->base.vb.vb2_buf, 0) +
> +		       ref->comp.start_offset;
> +
> +		if (!intrabc) {
> +			int shift =3D
> +				(gm->flags[ref_idx] &
> +				 V4L2_AV1_GLOBAL_MOTION_FLAG_IS_TRANSLATION) ?
> +					(WARPEDMODEL_PREC_BITS -
> +					 2) - (frame->flags & V4L2_AV1_FRAME_FLAG_ALLOW_HIGH_PRECISION_MV ?
> +						       1 :
> +						       0) :
> +					10;
> +			push(AV1_GM_TYPE(gm->type[ref_idx]) |
> +				     AV1_GM_PARAM0(gm->params[ref_idx][0] >>
> +						   shift) |
> +				     AV1_GM_PARAM1(gm->params[ref_idx][1] >>
> +						   shift),
> +			     "ref_gm_mv");
> +			push(AV1_GM_VALID(!(V4L2_AV1_GLOBAL_MOTION_IS_INVALID(
> +						    ref_idx) &
> +					    gm->invalid)) |
> +				     AV1_GM_PARAM0(AV1_DIV_ROUND_UP_POW2_SIGNED(
> +					     gm->params[ref_idx][2], 1)) |
> +				     AV1_GM_PARAM1(AV1_DIV_ROUND_UP_POW2_SIGNED(
> +					     gm->params[ref_idx][3], 1)),
> +			     "ref_gm_param");
> +			push(AV1_GM_PARAM1(gm->params[ref_idx][5] >> 1) |
> +				     AV1_GM_PARAM0(gm->params[ref_idx][4] >> 1),
> +			     "ref_gm_unk2");
> +			avd_av1_dec_get_shear_params(&gm->params[ref_idx][0],
> +						     &alpha, &beta, &gamma,
> +						     &delta);
> +			push(AV1_GM_PARAM_SHEAR0(beta) |
> +				     AV1_GM_PARAM_SHEAR1(alpha),
> +			     "ref_gm_beta_alpha");
> +
> +			push(AV1_GM_PARAM_SHEAR0(delta) |
> +				     AV1_GM_PARAM_SHEAR1(gamma),
> +			     "ref_gm_delta_gamma");

[Severity: Medium]
In set_refs(), alpha, beta, gamma, and delta are initialized to 0 once
outside the reference frame loop, and avd_av1_dec_get_shear_params()
returns early without modifying them when mat[2] <=3D 0.

If an earlier reference frame has gm->params[ref_idx][2] > 0 and a
subsequent reference frame has gm->params[ref_idx][2] <=3D 0, won't the
subsequent iteration push stale alpha, beta, gamma, and delta values from
the earlier reference frame?

> +		}
> +		push(AVD_REF_FLAG_CONST |
> +			     AV1_REF_ORDER_HINT(
> +				     intrabc ? 0 : frame->order_hints[ref_idx]),
> +		     "ref_flag");
> +		push(AVD_HDR_HEIGHT(ref->av1.height) |
> +			     AVD_HDR_WIDTH(ref->av1.width),
> +		     "ref_height_width");
> +
> +		x_scale =3D ((ref->av1.upscaled_width << AV1_REF_SCALE_SHIFT) +
> +			   (width / 2)) /
> +			  width;
> +		y_scale =3D (((ref->av1.height + 1) << AV1_REF_SCALE_SHIFT) +
> +			   (height / 2)) /
> +			  height;
> +		push(AV1_REF_SCALE_X(x_scale) | AV1_REF_SCALE_Y(y_scale),
> +		     "ref_scale");
> +
> +		push_comp(ctx, addr, ref->comp.offsets);
> +	}
> +}
> +
> +static int avd_av1_get_dist(struct avd_av1_run *run, int a, int b)
> +{
> +	const struct v4l2_ctrl_av1_sequence *seq =3D run->seq;
> +	int bits =3D seq->order_hint_bits - 1;
> +	int diff, m;
> +
> +	if (!seq->order_hint_bits)
> +		return 0;
> +
> +	diff =3D a - b;
> +	m =3D 1 << bits;
> +	diff =3D (diff & (m - 1)) - (diff & m);
> +
> +	return diff;
> +}

[Severity: Medium]
In avd_av1_get_dist(), seq->order_hint_bits is an unvalidated __u8 from
V4L2_CID_STATELESS_AV1_SEQUENCE (neither validate_av1_sequence() in
v4l2-ctrls-core.c nor avd_av1_validate_sequence() bounds it).

If userspace sets seq->order_hint_bits > 8 (for instance >=3D 32), can
1 << bits trigger a shift-out-of-bounds on the 32-bit signed int and
overflow AV1_HDR_ORDER_HINT_BITS() in set_header()?

[ ... ]

> +static void set_ref_hdr(struct avd_ctx *ctx, struct avd_av1_run *run)
> +{
> +	const struct v4l2_ctrl_av1_frame *frame =3D run->frame;
> +	u8 ref_slots[7] =3D { 1, 2, 3, 4, 5, 6, 7 };
> +	int sign_bias =3D 0;
> +	int ref_slot =3D 0;
> +	int i, j;
> +
> +	/* point to the first index where the frames equal */
> +	for (i =3D 0; i < 6; i++) {
> +		for (j =3D i + 1; j < 7; j++) {
> +			if (frame->reference_frame_ts[frame->ref_frame_idx[i]] =3D=3D
> +			    frame->reference_frame_ts[frame->ref_frame_idx[j]]) {
> +				ref_slots[j] =3D ref_slots[i];
> +				break;
> +			}
> +		}
> +	}

[Severity: High]
In set_ref_hdr() (called unconditionally from avd_av1_run() ->
set_header()), frame->ref_frame_idx[i] and frame->ref_frame_idx[j] are
signed __s8 values from userspace (-128..127) that are not validated by
validate_av1_frame() or the driver, and may also be -1 on intra frames.

Does indexing frame->reference_frame_ts[] (8 elements) directly with
frame->ref_frame_idx[i] and frame->ref_frame_idx[j] without bounds
checking read out of bounds?

> +
> +	for (i =3D 0; i < 7; i++) {
> +		sign_bias |=3D AV1_SIGN_BIAS(
> +			avd_av1_get_dist(
> +				run,
> +				frame->order_hints[i + V4L2_AV1_REF_LAST_FRAME],
> +				frame->order_hint) > 0,
> +			6 - i);
> +
> +		ref_slot |=3D AV1_REF_SLOT(ref_slots[i], 6 - i);
> +	}
> +
> +	push(ref_slot | sign_bias |
> +		     AV1_FLAGS_REFERENCE_SELECT(
> +			     frame->flags &
> +			     V4L2_AV1_FRAME_FLAG_REFERENCE_SELECT) |
> +		     AV1_FLAGS_INTERPOLATION_FILTER(
> +			     frame->interpolation_filter),
> +	     "reference_select");
> +}
> +
> +/* 7.16. Upscaling process */
> +static void calc_upscale(int frame_width, int upscaled_width, int sub_x,
> +			 int *step_x, int *initial_subpel_x)
> +{
> +	int downscaled_plane_w, upscaled_plane_w, err;
> +
> +	downscaled_plane_w =3D AV1_DIV_ROUND_UP_POW2(frame_width, sub_x);
> +	upscaled_plane_w =3D AV1_DIV_ROUND_UP_POW2(upscaled_width, sub_x);
> +	*step_x =3D ((downscaled_plane_w << SUPERRES_SCALE_BITS) +
> +		   (upscaled_plane_w / 2)) /
> +		  upscaled_plane_w;
> +	err =3D (upscaled_plane_w * *step_x) -
> +	      (downscaled_plane_w << SUPERRES_SCALE_BITS);
> +	*initial_subpel_x =3D (-((upscaled_plane_w - downscaled_plane_w)
> +			       << (SUPERRES_SCALE_BITS - 1)) +
> +			     upscaled_plane_w / 2) /
> +				    upscaled_plane_w +
> +			    (1 << (SUPERRES_EXTRA_BITS - 1)) - err / 2;
> +	*initial_subpel_x &=3D SUPERRES_SCALE_MASK;
> +}

[Severity: High]
set_header() calls calc_upscale() unconditionally with
frame->upscaled_width, which is not validated by v4l2-ctrls-core.c or
this driver.

If userspace leaves frame->upscaled_width as 0 (or passes 0xffffffff
when sub_x =3D=3D 1), upscaled_plane_w evaluates to 0. Similarly, in
set_refs(), if frame->frame_width_minus_1 or frame->frame_height_minus_1
is 0xffffffff, width or height wraps to 0. Can this trigger a division
by zero in calc_upscale() and set_refs()?

> +
> +static void set_header(struct avd_ctx *ctx, struct avd_av1_run *run)
> +{

[ ... ]

> +	pusha(run->addresses.probs_out, "probs_out", 0);
> +	pusha(av1_ctx->bufs.probs.addr, "probs", 1);
> +	pusha(av1_ctx->bufs.above_info.addr, "col", 0);
> +	pusha(av1_ctx->bufs.seg.addr, "seg", 0);
> +	/* make it obvious if its used */
> +	pusha(0xb0b0b0b0, "", 1);
> +	pusha(run->addresses.color, "w_color", 0);

[ ... ]

> +	pusha(av1_ctx->bufs.ip_above.addr, "ip_above", 0);
> +	pusha(av1_ctx->bufs.lf_above.addr, "lf_above", 2);
> +	pusha(av1_ctx->bufs.lf_above_info.addr, "lf_above_info", 3);
> +	pusha(av1_ctx->bufs.lf_left.addr, "lf_left", 0);
> +	pusha(av1_ctx->bufs.lf_left_info.addr, "lf_left_info", 1);
> +	/* make it obvious if its used */
> +	pusha(0xa0a0a0a0, "", 0);

[ ... ]

> +}
> +
> +static int set_tiles(struct avd_ctx *ctx, struct avd_av1_run *run)
> +{
> +	const struct v4l2_ctrl_av1_frame *frame =3D run->frame;
> +	const struct v4l2_ctrl_av1_sequence *seq =3D run->seq;
> +	const struct v4l2_ctrl_av1_tile_group_entry *tile_group;
> +	const struct v4l2_av1_tile_info *tile_info =3D &frame->tile_info;
> +	dma_addr_t coded_in;
> +	int row, col, sb_row, sb_col, tile_id, tile_row, tile_col;
> +	int sb_shift =3D
> +		seq->flags & V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK ? 5 :
> +									     4;
> +
> +	for (row =3D 0; row < tile_info->tile_rows; row++) {
> +		for (col =3D 0; col < tile_info->tile_cols; col++) {
> +			tile_id =3D row * tile_info->tile_cols + col;
> +			tile_group =3D &run->tile_group[tile_id];
> +			coded_in =3D run->base.coded_in +
> +					      tile_group->tile_offset;
> +			tile_row =3D tile_group->tile_row;
> +			tile_col =3D tile_group->tile_col;
> +
> +			if (tile_col >=3D V4L2_AV1_MAX_TILE_COLS ||
> +			    tile_row >=3D V4L2_AV1_MAX_TILE_ROWS)
> +				return -EINVAL;
> +
> +			push(AVD_OP_CODED_DATA | AVD_OP_CODED_IN_HI(coded_in),
> +			     "tile_start");
> +			push(AVD_OP_CODED_IN_LO(coded_in), "tile_addr");
> +			push(tile_group->tile_size, "tile_size");
> +
> +			sb_row =3D
> +				tile_info->mi_row_starts[tile_row] >> sb_shift;
> +			sb_col =3D
> +				tile_info->mi_col_starts[tile_col] >> sb_shift;

[Severity: High]
In set_tiles(), tile_group->tile_row and tile_group->tile_col are __u32
fields assigned to signed int variables tile_row and tile_col, which are
only checked for >=3D V4L2_AV1_MAX_TILE_COLS / V4L2_AV1_MAX_TILE_ROWS.

If userspace passes a value >=3D 0x80000000U for tile_row or tile_col, won't
tile_row or tile_col become negative, bypass the upper-bound check, and
index tile_info->mi_row_starts[], mi_col_starts[], height_in_sbs_minus_1[],
and width_in_sbs_minus_1[] at negative offsets? Should tile_offset and
tile_size also be validated against the source buffer size?

> +			push(AVD_OP_SL_DIM_START |
> +				     AVD_OP_SL_DIM_START_Y(sb_row) |
> +				     AVD_OP_SL_DIM_START_X(sb_col),
> +			     "tile_op_start");
> +
> +			push(AVD_SL_DIM_END_ROW(
> +				     !(frame->flags &
> +				       V4L2_AV1_FRAME_FLAG_DISABLE_FRAME_END_UPDATE_CDF) &&
> +						     tile_id =3D=3D
> +							     tile_info->context_update_tile_id ?
> +					     8 :
> +					     0) |
> +				     AVD_SL_DIM_END_COL(col) |
> +				     AVD_SL_DIM_END_Y(
> +					     sb_row +
> +					     tile_info->height_in_sbs_minus_1
> +						     [tile_row]) |
> +				     AVD_SL_DIM_END_X(
> +					     sb_col +
> +					     tile_info->width_in_sbs_minus_1
> +						     [tile_col]),
> +			     "tile_op_end");
> +#ifdef DEBUG_INST
> +			pr_info("\n");
> +#endif
> +			avd_end_segment(ctx, true);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void avd_av1_set_prob(struct avd_ctx *ctx, struct avd_av1_run *ru=
n)
> +{
> +	struct avd_av1_ctx *av1_ctx =3D ctx->priv;
> +	bool error_resilient_mode =3D !!(
> +		run->frame->flags & V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE);
> +	bool frame_is_intra =3D
> +		((run->frame->frame_type =3D=3D V4L2_AV1_KEY_FRAME) ||
> +		 (run->frame->frame_type =3D=3D V4L2_AV1_INTRA_ONLY_FRAME));
> +	struct avd_decoded_buffer *dst, *ref;
> +
> +	dst =3D vb2_to_avd_decoded_buf(&run->base.bufs.dst->vb2_buf);
> +
> +	if (error_resilient_mode || frame_is_intra ||
> +	    run->frame->primary_ref_frame =3D=3D 7) {
> +		avd_av1_default_coeff_probs(run->frame->quantization.base_q_idx,
> +					    av1_ctx->bufs.probs.cpu);
> +		avd_av1_set_default_cdfs(av1_ctx->bufs.probs.cpu);
> +	} else {
> +		ref =3D avd_av1_get_ref_buf(ctx, run,
> +					  run->frame->primary_ref_frame);
> +		memcpy(av1_ctx->bufs.probs.cpu,
> +		       vb2_plane_vaddr(&ref->base.vb.vb2_buf, 0) +
> +			       AVD_AV1_CDFS_OFFSET(
> +				       ref->base.vb.vb2_buf.planes[0].length,
> +				       ref->av1.color_size),
> +		       sizeof(struct avd_av1_cdfs));
> +	}
> +
> +	/*
> +	 * AVD writes nothing when DISABLE_FRAME_END_UPDATE_CDF is
> +	 * enabled
> +	 */
> +	memcpy(vb2_plane_vaddr(&dst->base.vb.vb2_buf, 0) +
> +		       AVD_AV1_CDFS_OFFSET(dst->base.vb.vb2_buf.planes[0].length,
> +					   dst->av1.color_size),
> +	       av1_ctx->bufs.probs.cpu, sizeof(struct avd_av1_cdfs));
> +}

[Severity: High]
In avd_av1_set_prob(), vb2_plane_vaddr() is called on ref->base.vb.vb2_buf
and dst->base.vb.vb2_buf without checking for NULL before adding
AVD_AV1_CDFS_OFFSET() and passing the pointer to memcpy().

Since the capture queue supports VB2_DMABUF, vb2_dc_vaddr() can return
NULL if dma_buf_vmap_unlocked() fails or is unsupported by the exporter.
Additionally, should run->frame->primary_ref_frame =3D=3D 7 check
>=3D V4L2_AV1_REFS_PER_FRAME instead?

> +
> +static int avd_color_size(int h, int w)
> +{
> +	/*
> +	 * in reality its dependent on quality
> +	 * 64 with lower quality
> +	 */
> +	return ALIGN(w, 128) * ALIGN(h, 128) / 16;
> +}
> +
> +static void update_dec_buf_info(struct avd_decoded_buffer *buf,
> +				const struct v4l2_ctrl_av1_sequence *seq,
> +				const struct v4l2_ctrl_av1_frame *frame)
> +{
> +	int i;
> +
> +	buf->av1.width =3D frame->frame_width_minus_1;
> +	buf->av1.height =3D frame->frame_height_minus_1;
> +	buf->av1.upscaled_width =3D frame->upscaled_width;
> +	buf->av1.bit_depth =3D seq->bit_depth;
> +	buf->av1.frame_type =3D frame->frame_type;
> +	buf->av1.intrabc =3D frame->flags & V4L2_AV1_FRAME_FLAG_ALLOW_INTRABC;
> +
> +	buf->av1.color_size =3D avd_color_size(frame->frame_width_minus_1 + 1,
> +					     frame->frame_height_minus_1 + 1);
> +
> +	for (i =3D 0; i < V4L2_AV1_TOTAL_REFS_PER_FRAME; i++)
> +		buf->av1.order_hints[i] =3D frame->order_hints[i];
> +
> +	for (i =3D 0; i < V4L2_AV1_REFS_PER_FRAME; i++)
> +		buf->av1.ref_frame_idx[i] =3D frame->ref_frame_idx[i];
> +}
> +
> +static int avd_av1_run_preamble(struct avd_ctx *ctx, struct avd_av1_run =
*run)
> +{
> +	struct v4l2_ctrl *ctrl;
> +	int dst_len, tlb_len;
> +
> +	avd_run_preamble(ctx, &run->base);
> +
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl, V4L2_CID_STATELESS_AV1_SEQUENCE=
);
> +	if (WARN_ON(!ctrl))
> +		return -EINVAL;
> +	run->seq =3D ctrl->p_cur.p;
> +
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl, V4L2_CID_STATELESS_AV1_FRAME);
> +	if (WARN_ON(!ctrl))
> +		return -EINVAL;
> +	run->frame =3D ctrl->p_cur.p;
> +
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			      V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY);
> +	if (WARN_ON(!ctrl))
> +		return -EINVAL;
> +	run->tile_group =3D ctrl->p_cur.p;
> +
> +	if (run->frame->tile_info.tile_cols * run->frame->tile_info.tile_rows >
> +		ctrl->new_elems)
> +		return -EINVAL;

[Severity: High]
In avd_av1_run_preamble(), run->tile_group is read from ctrl->p_cur.p,
whose element count is stored in ctrl->elems rather than ctrl->new_elems.

If userspace updates ctrl->new_elems via VIDIOC_TRY_EXT_CTRLS or on
another request while ctrl->p_cur.p has fewer elements in ctrl->elems,
can set_tiles() read past the end of run->tile_group?

> +
> +	dst_len =3D run->base.bufs.dst->vb2_buf.planes[0].length;
> +	tlb_len =3D avd_color_size(run->frame->frame_width_minus_1 + 1,
> +				 run->frame->frame_height_minus_1 + 1);
> +
> +	run->addresses.color =3D
> +		run->base.y_out + AVD_AV1_COLOR_OFFSET(dst_len, tlb_len);
> +
> +	run->addresses.probs_out =3D
> +		run->base.y_out + AVD_AV1_CDFS_OFFSET(dst_len, tlb_len);
> +	return 0;
> +}

[Severity: Critical]
In avd_av1_adjust_decoded_fmt(), the capture buffer size is computed from
ctx->decoded_fmt.fmt.pix_mp.width and height, but unlike avd-vp9.c and
avd-hevc.c, avd-av1.c never checks that frame->frame_width_minus_1 + 1 and
frame->frame_height_minus_1 + 1 fit within the negotiated capture format
dimensions (and avd_color_size() uses signed 32-bit int arithmetic).

If userspace submits a frame control with dimensions larger than the
negotiated capture format, AVD_AV1_CDFS_OFFSET(dst_len, dst->av1.color_size)
underflows when dst->av1.color_size exceeds planes[0].length. Won't
avd_av1_set_prob() then memcpy() sizeof(struct avd_av1_cdfs) out of bounds
before the start of the capture buffer, and program out-of-bounds DMA
addresses for color and probs_out?

> +
> +static int avd_av1_alloc_work_bufs(struct avd_ctx *ctx, struct avd_av1_r=
un *run)
> +{
> +	struct avd_dev *avd =3D ctx->dev;
> +	struct avd_av1_ctx *av1_ctx =3D ctx->priv;
> +	const struct v4l2_ctrl_av1_frame *frame =3D run->frame;
> +	const struct v4l2_ctrl_av1_sequence *seq =3D run->seq;
> +	const struct v4l2_av1_tile_info *tile_info =3D &frame->tile_info;
> +	u32 ret, max_sb_col =3D 0, max_sb_row =3D 0, i, sb_cols1 =3D 0, sb_cols=
2 =3D 0,
> +		 sb;
> +	u32 w =3D frame->frame_width_minus_1 + 1;
> +	u32 h =3D frame->frame_height_minus_1 + 1;
> +	u8 sb_shift =3D
> +		seq->flags & V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK ? 1 :
> +									     0;
> +	u8 bit_depth =3D seq->bit_depth;
> +
> +	for (i =3D 0; i < tile_info->tile_cols; i++) {
> +		sb =3D tile_info->width_in_sbs_minus_1[i] + 1;
> +		max_sb_col =3D sb > max_sb_col ? sb : max_sb_col;
> +		sb_cols1 +=3D ALIGN((sb << sb_shift) * 44, 128);
> +		/* wrong alignment? */
> +		sb_cols2 +=3D ALIGN((sb << sb_shift) * 12, 128);
> +	}
> +
> +	max_sb_col <<=3D sb_shift;
> +
> +	ret =3D avd_buf_alloc(avd, &av1_ctx->bufs.mv_above_info, max_sb_col * 8=
0);
> +	if (ret)
> +		return ret;
> +
> +	/* first frame this is always much smaller */
> +	ret =3D avd_buf_alloc(avd, &av1_ctx->bufs.above_info, max_sb_col * 400);

[Severity: High]
In avd_av1_alloc_work_bufs(), tile_info->width_in_sbs_minus_1[i] and
tile_info->height_in_sbs_minus_1[i] are unvalidated __u32 values from
userspace, and the buffer size calculations are performed in 32-bit u32
arithmetic.

Can large values in width_in_sbs_minus_1[], height_in_sbs_minus_1[], w, or
h overflow these 32-bit calculations and allocate undersized DMA scratch
buffers for the hardware?

> +	if (ret)
> +		return ret;
> +
> +	ret =3D avd_buf_alloc(avd, &av1_ctx->bufs.lf_above_info, sb_cols1);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D avd_buf_alloc(avd, &av1_ctx->bufs.ip_above,
> +			    max_sb_col * bit_depth * 22);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D avd_buf_alloc(avd, &av1_ctx->bufs.lf_above,
> +			    ALIGN(ALIGN(w, 8) * bit_depth * 2 +
> +					  tile_info->tile_cols * bit_depth * 16,
> +				  128));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D avd_buf_alloc(avd, &av1_ctx->bufs.rf_above_info, sb_cols2);
> +	if (ret)
> +		return ret;
> +
> +	if (frame->segmentation.flags & V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP) {
> +		ret =3D avd_buf_alloc(
> +			avd, &av1_ctx->bufs.seg,
> +			(ALIGN(h, 64 << sb_shift) * ALIGN(w, 64 << sb_shift)) /
> +				128 * 3);
> +		if (ret)
> +			return ret;
> +	}

[Severity: High]
In avd_av1_alloc_work_bufs(), av1_ctx->bufs.seg is only allocated when
V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP is set, while set_header() sets
AV1_FLAGS_SEG_ENABLED() when V4L2_AV1_SEGMENTATION_FLAG_ENABLED is set and
unconditionally pushes av1_ctx->bufs.seg.addr (as well as hardcoded poison
IOVAs 0xb0b0b0b0 and 0xa0a0a0a0).

What happens if a frame has V4L2_AV1_SEGMENTATION_FLAG_ENABLED set without
V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP before av1_ctx->bufs.seg has been
allocated (leaving seg.addr =3D=3D 0), or when resolution increases? Also,
since avd_buf_alloc() frees and reallocates whenever size =3D=3D buf->size,
won't calling avd_buf_alloc() on same-sized UPDATE_MAP frames zero out the
previous segmentation map?

[ ... ]

> +static int avd_av1_validate_sequence(struct avd_ctx *ctx,
> +				     struct v4l2_ctrl_av1_sequence *seq)
> +{
> +	if (seq->flags & V4L2_AV1_SEQUENCE_FLAG_MONO_CHROME)
> +		return -EINVAL; /* 4:0:0 (not supported?) */
> +
> +	if (seq->bit_depth > 10)
> +		/* not implemented */
> +		return -EINVAL;
> +
> +	return 0;
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-avd-v3-0-8=
5cbaa2125d8@icloud.com?part=3D10
