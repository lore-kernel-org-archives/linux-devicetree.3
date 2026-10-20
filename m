Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502847;
	b=ZXm9b7J+sgoNHTb4l35hsMUhYRrURIFgI9s7NJWEhToCT/MjCngFU8dOoBwVXVGQxQPi
	 Ac3mcTlOk50sMIelG1CRuoafC2Og6dJ63EqgktyeHpW/LhrEm711kP/RONtqx4xhgwYpS
	 T738L6Xpb94pvoXCuL8ciG168kmD8wV1qjG5jInaStb1Zzh+ZwugMx817sYILNyQpJaw+
	 q2FQHnK7OqvHinw82JVeHLvfALHV/Xtz6LPqld8+rycI4p9X14FX9bqwmiY3/50W9blzS
	 ZxyBp3QTXYqcjctso+87WuG7KslvLuWvPYwR1G2OlaS1I53e/ZEXDQ6tqpKUhOk6SBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502847;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LGjRS8SpvlmxU7Nq3gtGjxgK/3JtRaoV4iBA14vIsrA=;
	b=AzJOQKAhQiL0f3DYJS31gs2ZFhzDoAzXXGUqWvn/VhhSQyq0JtoQd9WooqUu11lFLE93
	 5Kr0qohTPucTkTVNPTXS4QTsTNgmdFYpjXXj3NH0ciqSaNv3VkuoB2QeDtEwzo/MlTuDm
	 DtDcdrnaEPITFymCvp15lOQtsI7SE1N90pQOXUdGIbMfBBPuzCuQFdlixmZ5tsBcga1QB
	 NJiIpwyu41Rn/96/uxvGaPtRY+IWlieX27/Os3HDMyCyQrF7N7mPF7NJHkn6ooJt9ULse
	 CMjZpeu3nhluYaT7Hmny2flsgzIcsOLBptGpS69jPHN7VhlhncQz+xOENrO9ZgtJPjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NS7gzSJi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38457606A31D
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NS7gzSJi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D651F000C7;
	Tue, 20 Oct 2026 13:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502846;
	bh=LGjRS8SpvlmxU7Nq3gtGjxgK/3JtRaoV4iBA14vIsrA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NS7gzSJiq28LAlreikAJUoeLrlEdrZSieLywWOws7fBGQtEs4YsHsUBdOWRbuHFiJ
	 pgbTBS5u1C+AU9qFuYSXtenMPQ2PyTNwwGWiyUiOO7lLXAVvFkJEMhD/x4TrFy5aR4
	 VpYjIjPd8O7xd7btWGHnYZhYyB4DV6V7uC1uEegjwn52bR0ECzSn9T88ZisKznxdnJ
	 qyLMu5/LujHAqEjhb+yjXPzR82RaUHwzhvxBUSMKD5F/RY6pK6e92D1vsdPp/6sWpb
	 oJL9EBCzu4VSwoYTaGgSy9senqvxLIfQtn9LiaeyXybOT/6CmGIXwBWu533Gv438pC
	 27OP7UE6e8KLg==
Message-ID: <sashiko-outbox-179022@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/17] arm64: dts: apple: t8103: add avd nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261020-avd-v3-11-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
 <20261020-avd-v3-11-85cbaa2125d8@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 13:27:26 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] media: apple: avd: out-of-bounds memory accesses in HEVC tile =
handling
- [Critical] media: apple: avd: integer overflow and OOB access in HEVC sli=
ce handling
- [Critical] media: apple: avd: out-of-bounds accesses and error return in =
avd-h264.c
- [Critical] media: apple: avd: missing bounds and NULL checks in AV1 and V=
P9 decoders
- [High] media: apple: avd: swapped hdiv and vdiv in fill_comp()
--

commit 6d0e4afb9549b778000654c1e09e6223d962c39e
Author: Sofus Forstreuter <sofus.c@icloud.com>

arm64: dts: apple: t8103: add avd nodes

This patch adds the Apple AVD DART IOMMU and video-codec device tree nodes
for the Apple T8103 SoC, enabling the AVD V4L2 stateless video decoder.

> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/a=
pple/t8103.dtsi
> index 5b68bf0df4e6b..530290e7cb32e 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -984,6 +984,38 @@ pinctrl_aop: pinctrl@24a820000 {
>  				     <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> =20
> +		avd_dart: iommu@269010000 {
> +			compatible =3D "apple,t8103-dart";
> +			reg =3D <0x2 0x69010000 0x0 0x4000>;
> +			interrupt-parent =3D <&aic>;
> +			interrupts =3D <AIC_IRQ 547 IRQ_TYPE_LEVEL_HIGH>;
> +			#iommu-cells =3D <1>;
> +			power-domains =3D <&ps_avd_sys>;
> +		};
> +
> +		video-codec@269070000 {
> +			compatible =3D "apple,t8103-avd";

[Severity: Critical]
Enabling the video-codec@269070000 node exposes the AVD V4L2 M2M stateless
decoder to userspace. Can crafted HEVC controls trigger out-of-bounds memory
accesses and division by zero in drivers/media/platform/apple/avd/avd-hevc.c
through avd_device_run() -> avd_hevc_run()?

First, struct v4l2_ctrl_hevc_pps defines column_width_minus1[20] and
row_height_minus1[22], and std_validate_compound() in
drivers/media/v4l2-core/v4l2-ctrls-core.c does not bound
num_tile_columns_minus1 or num_tile_rows_minus1 when
V4L2_HEVC_PPS_FLAG_TILES_ENABLED is set. However, avd_hevc_validate_pps()
allows up to HEVC_MAX_TILE_COLS (40) and HEVC_MAX_TILE_ROWS (44):

drivers/media/platform/apple/avd/avd-hevc.c:avd_hevc_validate_pps() {
	if (pps->num_tile_columns_minus1 + 1 > HEVC_MAX_TILE_COLS ||
	    pps->num_tile_rows_minus1 + 1 > HEVC_MAX_TILE_ROWS)
		return -EINVAL;
}

When compute_tiles_non_uniform() iterates up to pps->num_tile_columns_minus1
and pps->num_tile_rows_minus1:

drivers/media/platform/apple/avd/avd-hevc.c:compute_tiles_non_uniform() {
	for (i =3D 0; i < pps->num_tile_columns_minus1; i++) {
		column_width[i] =3D MIN(pps->column_width_minus1[i] + 1,
				      pic_in_cts_width);
		sum +=3D column_width[i];
	}
	column_width[i] =3D pic_in_cts_width - sum;

	sum =3D 0;
	for (i =3D 0; i < pps->num_tile_rows_minus1; i++) {
		row_height[i] =3D MIN(pps->row_height_minus1[i] + 1,
				    pic_in_cts_height);
		sum +=3D row_height[i];
	}
	row_height[i] =3D pic_in_cts_height - sum;
}

Doesn't this read past pps->column_width_minus1[20] and
pps->row_height_minus1[22] (and past the end of struct v4l2_ctrl_hevc_pps)?

Second, in compute_tiles_non_uniform() above, each entry is only clamped
individually to pic_in_cts_width or pic_in_cts_height. If sum exceeds
pic_in_cts_width or pic_in_cts_height, won't the u16 assignment to
column_width[i] or row_height[i] underflow to a large positive value, causi=
ng
compute_bd() to produce col_bd and row_bd entries larger than
pic_in_ctbs_width and pic_in_ctbs_height, which then overflows the heap-
allocated ctb_addr_rs_to_ts and tile_ids arrays in compute_rs_to_ts() and
compute_tile_ids()?

drivers/media/platform/apple/avd/avd-hevc.c:compute_tile_ids() {
	for (j =3D 0, tile_idx =3D 0; j <=3D pps->num_tile_rows_minus1; j++)
		for (i =3D 0; i <=3D pps->num_tile_columns_minus1; i++, tile_idx++)
			for (y =3D row_bd[j]; y < row_bd[j + 1]; y++)
				for (x =3D col_bd[i]; x < col_bd[i + 1]; x++)
					tile_ids[ctb_addr_rs_to_ts
							 [y * pic_in_ctbs_width +
							  x]] =3D tile_idx;
}

Third, avd_hevc_validate_sps() does not reject zero
pic_width_in_luma_samples / pic_height_in_luma_samples or out-of-range
log2_min_luma_coding_block_size_minus3 /
log2_diff_max_min_luma_coding_block_size. In avd_hevc_compute_tiles():

drivers/media/platform/apple/avd/avd-hevc.c:avd_hevc_compute_tiles() {
	max_cu_width =3D 1 << (sps->log2_diff_max_min_luma_coding_block_size +
			     log2_min_cb_size);
	pic_in_ctbs_width =3D (width + max_cu_width - 1) / max_cu_width;
	pic_in_ctbs_height =3D (height + max_cu_width - 1) / max_cu_width;
	pic_in_ctbs_size =3D pic_in_ctbs_height * pic_in_ctbs_width;
}

Can this shift out of bounds and divide by zero before avd_hevc_alloc_scrat=
ch()
checks if (!max_cu_width), or result in ZERO_SIZE_PTR dereferences when wid=
th
or height is zero?

[Severity: Critical]
In drivers/media/platform/apple/avd/avd-hevc.c, can avd_hevc_run_preamble()
and stream_slices() also overflow when validating and iterating HEVC slice
segments?

In avd_hevc_run_preamble(), sum is a 32-bit signed int accumulating __u32
num_entry_point_offsets across up to 1800 slices:

drivers/media/platform/apple/avd/avd-hevc.c:avd_hevc_run_preamble() {
	for (i =3D 0; i < run->num_slices; i++)
		sum +=3D (*run->sl)[i].num_entry_point_offsets;

	if (sum && sum !=3D run->num_entry_point_offsets)
		return -EINVAL;
}

Since std_validate_compound() does not bound num_entry_point_offsets, can
crafted values (for example, sl[0].num_entry_point_offsets =3D 2 and
sl[1].num_entry_point_offsets =3D 0xfffffffe) overflow sum to 0 or a small
value matching run->num_entry_point_offsets? That causes avd_init_job() to
allocate only run.num_slices + run.num_entry_point_offsets + 1 segments in
ctx->job.segments while stream_slices() loops sl->num_entry_point_offsets +=
 1
times, reading past (*run->entry_point_offsets) and writing past
ctx->job.segments via push() and avd_end_segment().

Additionally, in stream_slices(), pos is incremented for every segment with
NEW_TILE_ID:

drivers/media/platform/apple/avd/avd-hevc.c:stream_slices() {
			row =3D pos / num_cols;
			col =3D pos % num_cols;
}

and passed to submit_slice_segment():

drivers/media/platform/apple/avd/avd-hevc.c:submit_slice_segment() {
		if (pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED)
			push(AVD_SL_DIM_END_ROW((hflip ? 4 : 0) |
						(vflip ? 8 : 0)) |
				     AVD_SL_DIM_END_COL(col) |
				     AVD_SL_DIM_END_Y(row_bd[row + 1] - 1) |
				     AVD_SL_DIM_END_X(col_bd[col + 1] - 1),
			     "cm3_set_ctb_xy");
}

Without checking that row <=3D pps->num_tile_rows_minus1, won't pos / num_c=
ols
exceed HEVC_MAX_TILE_ROWS and read row_bd[row] and row_bd[row + 1] out of
bounds on the stack?

[Severity: Critical]
In drivers/media/platform/apple/avd/avd-h264.c (enabled on T8103 via
AVD_CAPABILITY_H264), are there also out-of-bounds accesses and an uninitia=
lized
error return reachable from userspace?

1. In stream_slice(), sl->ref_pic_list1[0].index is an unvalidated u8 from
V4L2_CID_STATELESS_H264_SLICE_PARAMS (not checked by std_validate_compound()
in drivers/media/v4l2-core/v4l2-ctrls-core.c):

drivers/media/platform/apple/avd/avd-h264.c:stream_slice() {
		/* sl->ref_pic_list1[0].index < ARRAY_SIZE(decode->dpb) */
		/* bidirectional reference of previous mv */
		ref =3D avd_get_ref_buf(
			ctx, &dst->base.vb,
			decode->dpb[sl->ref_pic_list1[0].index].reference_ts);
}

Doesn't this read past the 16-entry decode->dpb array when index >=3D 16?

2. In avd_h264_realloc_slices(), when h264_ctx->slice_num reaches
h264_ctx->alloc_slice_num, job->num is already alloc_slice_num + 1 (1 header
segment from stream_hdr() plus alloc_slice_num slice segments from
stream_slice()), matching the allocated capacity of job->buf.cpu:

drivers/media/platform/apple/avd/avd-h264.c:avd_h264_realloc_slices() {
	memcpy(job->segments, job->buf.cpu,
	       sizeof(*job->segments) * (job->num + 1));
}

Won't copying job->num + 1 entries read one struct avd_segment past the end=
 of
job->buf.cpu (and if job->buf.size is already large enough earlier in
avd_h264_realloc_slices(), return 0 without updating job->num_alloc)?

3. In avd_h264_run(), avd_h264_realloc_slices() is only called when
ctx->job.segments is non-NULL:

drivers/media/platform/apple/avd/avd-h264.c:avd_h264_run() {
	if (ctx->job.segments &&
	    h264_ctx->slice_num >=3D h264_ctx->alloc_slice_num) {
		ret =3D avd_h264_realloc_slices(ctx);
		if (ret)
			goto postamble;
	}

	h264_ctx->active_slice =3D &h264_ctx->slices[h264_ctx->slice_num];
}

Since avd_h264_done() only resets h264_ctx->slice_num when
V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF is not set, what happens if userspace
submits slices with first_mb_in_slice !=3D 0 and
V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF set? With ctx->job.segments still NULL,
won't h264_ctx->slice_num increment past h264_ctx->alloc_slice_num and write
past the end of h264_ctx->slices?

4. In avd_h264_start(), ret is 0 after avd_h264_validate_sps() succeeds:

drivers/media/platform/apple/avd/avd-h264.c:avd_h264_start() {
	h264_ctx->slices =3D kzalloc_objs(*h264_ctx->slices,
					h264_ctx->alloc_slice_num, GFP_KERNEL);
	if (!h264_ctx->slices)
		goto err_free_ctx;
}

If kzalloc_objs() fails here, doesn't avd_h264_start() free h264_ctx, set
ctx->priv =3D NULL, and return 0 to avd_start_streaming(), causing a NULL
pointer dereference in avd_h264_run()?

[Severity: Critical]
In drivers/media/platform/apple/avd/avd-vp9.c and
drivers/media/platform/apple/avd/avd-av1.c, could several missing bounds and
NULL checks cause crashes or out-of-bounds memory accesses?

1. In avd-vp9.c (enabled on T8103 via AVD_CAPABILITY_VP9), set_tiles() calls
vb2_plane_vaddr() on a VB2_DMABUF-capable queue:

drivers/media/platform/apple/avd/avd-vp9.c:set_tiles() {
	const u8 *data =3D vb2_plane_vaddr(&src->vb2_buf, 0);
...
				tile_size =3D get_unaligned_be32(&data[offset]);
}

and in avd-av1.c, avd_av1_set_prob() also calls vb2_plane_vaddr() without
checking for NULL:

drivers/media/platform/apple/avd/avd-av1.c:avd_av1_set_prob() {
	memcpy(vb2_plane_vaddr(&dst->base.vb.vb2_buf, 0) +
		       AVD_AV1_CDFS_OFFSET(dst->base.vb.vb2_buf.planes[0].length,
					   dst->av1.color_size),
	       av1_ctx->bufs.probs.cpu, sizeof(struct avd_av1_cdfs));
}

Since vb2_dc_vaddr() returns NULL if dma_buf_vmap_unlocked() fails or is not
supported by the exporter, can these dereference NULL?

2. In avd_av1_set_prob() above, neither validate_av1_frame() nor avd-av1.c
validates frame->frame_width_minus_1 + 1 and frame->frame_height_minus_1 + 1
against the CAPTURE buffer dimensions. If update_dec_buf_info() computes
dst->av1.color_size larger than dst->base.vb.vb2_buf.planes[0].length, won't
AVD_AV1_CDFS_OFFSET() underflow and cause memcpy() to write out of bounds
before the buffer?

3. In drivers/media/platform/apple/avd/avd-av1.c:set_tiles(), __u32
tile_group->tile_row and tile_group->tile_col are assigned to signed int
before the bounds check:

drivers/media/platform/apple/avd/avd-av1.c:set_tiles() {
			tile_row =3D tile_group->tile_row;
			tile_col =3D tile_group->tile_col;

			if (tile_col >=3D V4L2_AV1_MAX_TILE_COLS ||
			    tile_row >=3D V4L2_AV1_MAX_TILE_ROWS)
				return -EINVAL;
}

Can values >=3D 0x80000000 become negative, bypass this check, and index
tile_info arrays out of bounds?

4. In drivers/media/platform/apple/avd/avd-av1.c:set_ref_hdr(),
frame->ref_frame_idx[i] (__s8) is not validated by validate_av1_frame():

drivers/media/platform/apple/avd/avd-av1.c:set_ref_hdr() {
			if (frame->reference_frame_ts[frame->ref_frame_idx[i]] =3D=3D
			    frame->reference_frame_ts[frame->ref_frame_idx[j]]) {
}

Can negative or out-of-range ref_frame_idx values index out of bounds of
frame->reference_frame_ts[8]? Similarly, avd_av1_get_ref_buf() checks idx
against V4L2_AV1_TOTAL_REFS_PER_FRAME (8) instead of V4L2_AV1_REFS_PER_FRAME
(7) before indexing frame->ref_frame_idx[7], and avd_av1_set_prob() only
checks primary_ref_frame =3D=3D 7 rather than >=3D V4L2_AV1_REFS_PER_FRAME.

5. In drivers/media/platform/apple/avd/avd-av1.c:avd_av1_run_preamble():

drivers/media/platform/apple/avd/avd-av1.c:avd_av1_run_preamble() {
	if (run->frame->tile_info.tile_cols * run->frame->tile_info.tile_rows >
		ctrl->new_elems)
		return -EINVAL;
}

Should this check ctrl->elems instead of ctrl->new_elems when reading from
ctrl->p_cur.p?

6. In drivers/media/platform/apple/avd/avd-av1.c:calc_upscale():

drivers/media/platform/apple/avd/avd-av1.c:calc_upscale() {
	*step_x =3D ((downscaled_plane_w << SUPERRES_SCALE_BITS) +
		   (upscaled_plane_w / 2)) /
		  upscaled_plane_w;
}

If frame->upscaled_width is 0, won't upscaled_plane_w be 0 and trigger a
division by zero?

7. In drivers/media/platform/apple/avd/avd-av1.c:set_refs(), alpha, beta,
gamma, and delta are declared outside the reference loop:

drivers/media/platform/apple/avd/avd-av1.c:set_refs() {
	s64 alpha =3D 0, beta =3D 0, gamma =3D 0, delta =3D 0;
}

Since avd_av1_dec_get_shear_params() returns early without clearing its out=
put
parameters when mat[2] <=3D 0, won't a subsequent reference frame reuse sta=
le
shear parameters from an earlier iteration?

[Severity: High]
In drivers/media/platform/apple/avd/avd-drv.c, are info->vdiv and info->hdiv
swapped when fill_comp() calculates the UV plane size and metadata?

drivers/media/platform/apple/avd/avd-drv.c:fill_comp() {
	/* uv has 16x16 tiles and 8 bytes of metadata per tile */
	calc_tile_meta(width / info->vdiv, height / info->hdiv,
		       v4l2_format_info_bpp(info, 1), 16, 8, &uv,
		       &uv_meta);
}

In drivers/media/v4l2-core/v4l2-common.c:v4l2_format_info(), the 4:2:2 form=
ats
V4L2_PIX_FMT_APPLE_AX16 and V4L2_PIX_FMT_APPLE_AX23 define .hdiv =3D 2 and
.vdiv =3D 1. Passing width / info->vdiv and height / info->hdiv to
calc_tile_meta(u32 w, u32 h, ...) divides width by 1 and height by 2 instead
of width / info->hdiv and height / info->vdiv, which miscalculates the UV t=
ile
count, UV metadata offset (comp->offsets[2]), and total buffer size
(comp->size) whenever width or height is an odd multiple of 16.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-avd-v3-0-8=
5cbaa2125d8@icloud.com?part=3D11
