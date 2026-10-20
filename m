Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508534;
	b=Wv22adYX3SQk9W8E3csKy+SGDa5fzex+ZmPRYR46wN8ySCXy34QTHqde+isEVMDBD5uA
	 5r0IZCBenDdeH0EzWJAuTflvomo6+ef22bZCJJzBEU8ktAXYL2N7qEVS9P8AoaFJrAcql
	 HUDi1ruJJXN+IHWbDdHvoLkrhdsIwEkSYPKNJasRXihxb0j1cByXiu9Uedpr2KxXwu+rJ
	 whM2zMsJYod/fLyxolINnRqWRBcwwglK95TPFvha8LOaa57pLSU7IL9YtQ7nWCjKQaXIc
	 kFP4JkRwfpQ+mdpzayXMiKG9tp2jx+mSSo18ITQmhFAHgY6zEUKubfG8rXIQ2AnBDmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508534;
	h=Received:Message-ID:From:Subject:Reply-To:To:Cc:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CfSUf+YdhWSGHTTDYGQQ+rlk6c4F93xuK+t3aJxWJdE=;
	b=ojx2KDzrukesa4F20VWPuC7P/GbCUPJZDxmgBwmTfPMfi1uto7AXNPrXFSacgGjjWkec
	 FMPAJbM+xI9aMYsNX11yVbfKJSNCRvHa5EEnJFObi0bYM9nKmNkv+An5A0L9+UuMYyN9a
	 ym0dMiga3JTYlKIDQjkCUiNrM0em1Kh5E9FMrnLhK1KB+D5FUJjhk0F17AN5FdQICfqsw
	 oQF6x3W0x5rBkEqlZL2GiVJVrIAS7XeWgk4QqyOAOFNIMzcJ2qJNDrTjiueFnHaznRoXK
	 YZ1kGem1x/ikcWdYh+hb49dsgFe6t92gTEKeVCmOfQlRCVmn6Bs7aKTHF4JZcA1lzpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBF3606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 15:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1170D1F000C5;
	Tue, 20 Oct 2026 15:02:13 +0000 (UTC)
Message-ID: <sashiko-outbox-179210@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 17/17] arm64: dts: apple: t6031: add avd nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261020-avd-v3-17-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
 <20261020-avd-v3-17-85cbaa2125d8@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 15:02:09 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] media: apple: avd: missing bounds checks on HEVC tile and slic=
e controls
- [High] media: apple: avd: out-of-bounds copy in avd_h264_realloc_slices()
- [High] media: apple: avd: missing bounds and dimension validation in AV1 =
and H264
- [Medium] media: apple: avd: swapped hdiv and vdiv in fill_comp()
- [Medium] media: apple: avd: missing v4l2_fh_exit() in avd_open() and NUL =
in avd_boot()
- [Low] arm64: dts: apple: t6031: undocumented apple,t6031-dart compatible =
string
--

commit 710cbe683a71adce1476927b8edd0e1212525500
Author: Sofus Forstreuter <sofus.c@icloud.com>

arm64: dts: apple: t6031: add avd nodes

This commit adds the Apple Video Decoder (AVD) and its associated DART IOMMU
device tree nodes for the Apple t6031 SoC.

> diff --git a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi b/arch/arm64/boot/=
dts/apple/t6031-dieX.dtsi
> index 2e9d3d2e6dea4..4959190e13a3c 100644
> --- a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
> @@ -98,6 +98,38 @@ DIE_NODE(pinctrl_ap): pinctrl@2b3000000 {
>  		#interrupt-cells =3D <2>;
>  	};
> =20
> +	DIE_NODE(avd_dart): iommu@2cd010000 {
> +		compatible =3D "apple,t6031-dart", "apple,t8110-dart";

[Severity: Low]
Does the compatible string "apple,t6031-dart" need to be documented in
Documentation/devicetree/bindings/iommu/apple,dart.yaml?

Currently, the schema only permits:

  compatible:
    oneOf:
      - enum:
          - apple,t8103-dart
          - apple,t8103-usb4-dart
          - apple,t8110-dart
          - apple,t6000-dart
      - items:
          - const: apple,t6020-dart
          - const: apple,t8110-dart

Without an entry for "apple,t6031-dart", running dtbs_check on device trees
including t6031-dieX.dtsi will report a schema validation failure on
iommu@2cd010000.

> +		reg =3D <0x2 0xcd010000 0x0 0x4000>;
> +		interrupt-parent =3D <&aic>;
> +		interrupts =3D <AIC_IRQ DIE_NO 1192 IRQ_TYPE_LEVEL_HIGH>;
> +		#iommu-cells =3D <1>;
> +		power-domains =3D <&DIE_NODE(ps_avd_sys)>;
> +	};
> +
> +	video-codec@2cd070000 {
> +		compatible =3D "apple,t6031-avd", "apple,t8122-avd";

[Severity: Medium]
Instantiating video-codec@2cd070000 binds the AVD driver introduced earlier
in this series (drivers/media/platform/apple/avd/). Looking at the driver
implementation that this node enables on t6031, are horizontal and vertical
subsampling divisors swapped in fill_comp()?

In drivers/media/platform/apple/avd/avd-drv.c:fill_comp():

	/* uv has 16x16 tiles and 8 bytes of metadata per tile */
	calc_tile_meta(width / info->vdiv, height / info->hdiv,
		       v4l2_format_info_bpp(info, 1), 16, 8, &uv,
		       &uv_meta);

When avd_open() or format/control ioctls (avd_s_output_fmt(),
avd_try_capture_fmt(), avd_s_capture_fmt(), avd_s_ctrl()) call
avd_fill_decoded_pixfmt() -> fill_comp() with a 4:2:2 format
(AVD_IMG_FMT_ANY, AVD_IMG_FMT_422_8BIT, or AVD_IMG_FMT_422_10BIT),
v4l2_format_info() returns hdiv =3D 2 and vdiv =3D 1.

Passing width / info->vdiv and height / info->hdiv divides the width by 1 a=
nd
the height by 2 instead of width / info->hdiv and height / info->vdiv. For
resolutions where DIV_ROUND_UP(width / 2, 16) * DIV_ROUND_UP(height, 16)
differs from DIV_ROUND_UP(width, 16) * DIV_ROUND_UP(height / 2, 16) (such as
720x1280), could this under-allocate uv, comp->size, and
pix_mp->plane_fmt[0].sizeimage, causing the hardware to DMA past the end of
the capture buffer when push_comp() programs comp->offsets?

[Severity: High]
Also in the H.264 decoder path enabled by this node, can
avd_h264_realloc_slices() read out of bounds from job->buf.cpu or leave
alloc_slice_num out of sync with job->segments?

In drivers/media/platform/apple/avd/avd-h264.c:avd_h264_run():

	if (ctx->job.segments &&
	    h264_ctx->slice_num >=3D h264_ctx->alloc_slice_num) {
		ret =3D avd_h264_realloc_slices(ctx);
		if (ret)
			goto postamble;
	}

On the first slice of a frame, avd_h264_run() calls avd_init_job() with
num_segments =3D h264_ctx->alloc_slice_num + 1, and calls avd_end_segment()
twice (for stream_hdr() and stream_slice()). Each subsequent slice incremen=
ts
h264_ctx->slice_num and calls avd_end_segment() once, incrementing job->num.

When h264_ctx->slice_num reaches h264_ctx->alloc_slice_num, job->num is
already equal to the old alloc_slice_num + 1 (which equals job->num_alloc, =
the
full size of job->buf). In avd_h264_realloc_slices():

	h264_ctx->alloc_slice_num =3D alloc_slice_num;
	memcpy(h264_ctx->slices, tmp,
	       sizeof(*h264_ctx->slices) * h264_ctx->slice_num);
	kfree(tmp);

	/* we could already have the correct size */
	if ((alloc_slice_num + 1) * sizeof(*job->segments) < job->buf.size)
		return 0;

	ret =3D avd_buf_alloc(ctx->dev, &tmp_buf,
			   (alloc_slice_num + 1) * sizeof(*job->segments));
	if (ret)
		return -ENOMEM;

	job->segments =3D tmp_buf.cpu;
	job->num_alloc =3D (alloc_slice_num + 1);
	memset(tmp_buf.cpu, 0, tmp_buf.size);
	memcpy(job->segments, job->buf.cpu,
	       sizeof(*job->segments) * (job->num + 1));

Since job->buf only holds job->num elements at this point, doesn't copying
(job->num + 1) elements read one struct avd_segment past the end of
job->buf.cpu?

Furthermore, because h264_ctx->alloc_slice_num is updated before checking
job->buf.size and before avd_buf_alloc(), if the early return is taken
(without updating job->num_alloc) or if avd_buf_alloc() fails with -ENOMEM,
won't subsequent slices in the same frame see slice_num < alloc_slice_num,
skip reallocation, and write out of bounds into job->segments?

[Severity: Critical]
In drivers/media/platform/apple/avd/avd-hevc.c, can crafted V4L2 HEVC
stateless controls trigger out-of-bounds accesses and integer overflows dur=
ing
avd_hevc_run()?

1. In avd_hevc_validate_pps() and compute_tiles_non_uniform():

static int avd_hevc_validate_pps(struct avd_ctx *ctx,
				 const struct v4l2_ctrl_hevc_pps *pps)
{
	if (pps->num_tile_columns_minus1 + 1 > HEVC_MAX_TILE_COLS ||
	    pps->num_tile_rows_minus1 + 1 > HEVC_MAX_TILE_ROWS)
		return -EINVAL;

	for (i =3D 0; i < pps->num_tile_columns_minus1; i++) {
		column_width[i] =3D MIN(pps->column_width_minus1[i] + 1,
				      pic_in_cts_width);
		sum +=3D column_width[i];
	}
	column_width[i] =3D pic_in_cts_width - sum;

HEVC_MAX_TILE_COLS is 40 and HEVC_MAX_TILE_ROWS is 44, whereas struct
v4l2_ctrl_hevc_pps defines column_width_minus1[20] and row_height_minus1[22=
].
Won't compute_tiles_non_uniform() read past the end of column_width_minus1[]
and row_height_minus1[] when num_tile_columns_minus1 > 20 or
num_tile_rows_minus1 > 22?

In addition, if sum exceeds pic_in_cts_width (or pic_in_cts_height for rows=
),
pic_in_cts_width - sum underflows u16 column_width[i], causing compute_bd()=
 to
produce col_bd[] / row_bd[] values larger than the picture CTB dimensions a=
nd
causing compute_tile_ids() to read ctb_addr_rs_to_ts[] and write tile_ids[]
out of bounds:

	for (j =3D 0, tile_idx =3D 0; j <=3D pps->num_tile_rows_minus1; j++)
		for (i =3D 0; i <=3D pps->num_tile_columns_minus1; i++, tile_idx++)
			for (y =3D row_bd[j]; y < row_bd[j + 1]; y++)
				for (x =3D col_bd[i]; x < col_bd[i + 1]; x++)
					tile_ids[ctb_addr_rs_to_ts
							 [y * pic_in_ctbs_width +
							  x]] =3D tile_idx;

2. In stream_slices() -> submit_slice_segment():

		if (pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED)
			push(AVD_SL_DIM_END_ROW((hflip ? 4 : 0) |
						(vflip ? 8 : 0)) |
				     AVD_SL_DIM_END_COL(col) |
				     AVD_SL_DIM_END_Y(row_bd[row + 1] - 1) |
				     AVD_SL_DIM_END_X(col_bd[col + 1] - 1),
			     "cm3_set_ctb_xy");

stream_slices() increments pos for each segment with NEW_TILE_ID and comput=
es
row =3D pos / num_cols without checking that row <=3D pps->num_tile_rows_mi=
nus1.
Can this read row_bd[row + 1] (and row_bd[row]) out of bounds?

3. In avd_hevc_validate_sps() and avd_hevc_compute_tiles(), are zero
pic_width_in_luma_samples / pic_height_in_luma_samples or large coding block
shift exponents (>=3D 31) rejected before computing max_cu_width =3D 1 << (=
...)
and dividing by max_cu_width?

4. In avd_hevc_run_preamble():

	for (i =3D 0; i < run->num_slices; i++)
		sum +=3D (*run->sl)[i].num_entry_point_offsets;

	if (sum && sum !=3D run->num_entry_point_offsets)
		return -EINVAL;

Since sum is a signed int and num_entry_point_offsets is u32, can sum overf=
low
and wrap to 0 (or a small value matching run->num_entry_point_offsets),
causing avd_init_job() to under-allocate ctx->job.segments and leading to
out-of-bounds accesses on run->entry_point_offsets in stream_slices() and
job->segments in avd_end_segment()?

[Severity: High]
In drivers/media/platform/apple/avd/avd-av1.c and avd-h264.c, could missing
validation on stateless AV1 and H.264 controls lead to out-of-bounds access=
es
or divide-by-zero errors?

1. In drivers/media/platform/apple/avd/avd-av1.c:avd_av1_set_prob():

	memcpy(vb2_plane_vaddr(&dst->base.vb.vb2_buf, 0) +
		       AVD_AV1_CDFS_OFFSET(dst->base.vb.vb2_buf.planes[0].length,
					   dst->av1.color_size),
	       av1_ctx->bufs.probs.cpu, sizeof(struct avd_av1_cdfs));

Neither avd_av1_try_ctrl() nor avd_av1_run_preamble() checks that
frame->frame_width_minus_1 + 1 and frame->frame_height_minus_1 + 1 fit with=
in
ctx->decoded_fmt.fmt.pix_mp.width and height. If userspace passes larger fr=
ame
dimensions, dst->av1.color_size can exceed planes[0].length, underflowing
AVD_AV1_CDFS_OFFSET() and writing sizeof(struct avd_av1_cdfs) bytes before
vb2_plane_vaddr(). Also, if frame_width_minus_1 or frame_height_minus_1 is
U32_MAX, width or height wraps to 0 in set_refs(), causing a division by ze=
ro.

2. In drivers/media/platform/apple/avd/avd-av1.c:set_ref_hdr():

	for (i =3D 0; i < 6; i++) {
		for (j =3D i + 1; j < 7; j++) {
			if (frame->reference_frame_ts[frame->ref_frame_idx[i]] =3D=3D
			    frame->reference_frame_ts[frame->ref_frame_idx[j]]) {

frame->ref_frame_idx[] contains __s8 values from userspace. Unlike
avd_av1_get_ref_buf(), set_ref_hdr() indexes the 8-element
frame->reference_frame_ts[] array without checking that ref_frame_idx[i] and
ref_frame_idx[j] are within 0..7.

3. In drivers/media/platform/apple/avd/avd-av1.c:calc_upscale():

	downscaled_plane_w =3D AV1_DIV_ROUND_UP_POW2(frame_width, sub_x);
	upscaled_plane_w =3D AV1_DIV_ROUND_UP_POW2(upscaled_width, sub_x);
	*step_x =3D ((downscaled_plane_w << SUPERRES_SCALE_BITS) +
		   (upscaled_plane_w / 2)) /
		  upscaled_plane_w;

calc_upscale() is called from set_header() without checking that
frame->upscaled_width is non-zero, which can divide by zero when
upscaled_plane_w is 0.

4. In drivers/media/platform/apple/avd/avd-av1.c:avd_av1_run_preamble():

	run->tile_group =3D ctrl->p_cur.p;

	if (run->frame->tile_info.tile_cols * run->frame->tile_info.tile_rows >
		ctrl->new_elems)
		return -EINVAL;

Since run->tile_group reads from ctrl->p_cur.p, should this check ctrl->ele=
ms
rather than ctrl->new_elems?

5. In drivers/media/platform/apple/avd/avd-h264.c:stream_slice():

		/* sl->ref_pic_list1[0].index < ARRAY_SIZE(decode->dpb) */
		/* bidirectional reference of previous mv */
		ref =3D avd_get_ref_buf(
			ctx, &dst->base.vb,
			decode->dpb[sl->ref_pic_list1[0].index].reference_ts);

sl->ref_pic_list1[0].index is an unvalidated u8 from userspace (v4l2-ctrls
only validates num_ref_idx_l1_active_minus1, not the index fields in
ref_pic_list1[]), so can this read past the 16-element decode->dpb[] array?
Similarly, should avd_h264_validate_sps() validate the SPS macroblock
dimensions against ctx->coded_fmt or ctx->decoded_fmt?

[Severity: Medium]
Finally, in drivers/media/platform/apple/avd/avd-drv.c, are there two small
issues in avd_boot() and avd_open()?

In avd_boot():

	memcpy_fromio(version, avd->sram, sizeof(version));
	dev_info_once(avd->dev, "fw version: %s\n", version);

version is a 64-byte stack array filled from avd->sram without ensuring NUL
termination; if SRAM does not contain a NUL byte in the first 64 bytes,
formatting with %s will read past the stack buffer. Should version be
explicitly NUL-terminated or printed with %.*s?

And in avd_open():

	v4l2_fh_init(&ctx->fh, video_devdata(filp));

	ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(avd->m2m_dev, ctx, avd_queue_init);
	if (IS_ERR(ctx->fh.m2m_ctx)) {
		ret =3D PTR_ERR(ctx->fh.m2m_ctx);
		goto err_free_ctx;
	}

	ret =3D avd_init_ctrls(ctx);
	if (ret)
		goto err_cleanup_m2m_ctx;

	v4l2_fh_add(&ctx->fh, filp);

	return 0;

err_cleanup_m2m_ctx:
	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);

err_free_ctx:
	avd_buf_free(avd, &ctx->pipe_state);
	avd_buf_free(avd, &ctx->inst);
	kfree(ctx);

If v4l2_m2m_ctx_init() or avd_init_ctrls() fails after v4l2_fh_init(), shou=
ld
err_free_ctx call v4l2_fh_exit(&ctx->fh) before freeing ctx?

> +		reg =3D <0x2 0xcd070000 0x0 0x4000>,
> +		      <0x2 0xcd080000 0x0 0x10000>,
> +		      <0x2 0xcd090000 0x0 0x14000>,
> +		      <0x2 0xcd0a4000 0x0 0x4000>,
> +		      <0x2 0xcd100000 0x0 0x10000>;
> +		reg-names =3D "piodma", "code", "sram", "mbox", "ctrl";
> +		interrupt-parent =3D <&aic>;
> +		interrupts =3D <AIC_IRQ DIE_NO 1185 IRQ_TYPE_LEVEL_HIGH>,
> +			     <AIC_IRQ DIE_NO 1186 IRQ_TYPE_LEVEL_HIGH>,
> +			     <AIC_IRQ DIE_NO 1187 IRQ_TYPE_LEVEL_HIGH>,
> +			     <AIC_IRQ DIE_NO 1188 IRQ_TYPE_LEVEL_HIGH>,
> +			     <AIC_IRQ DIE_NO 1189 IRQ_TYPE_LEVEL_HIGH>,
> +			     <AIC_IRQ DIE_NO 1190 IRQ_TYPE_LEVEL_HIGH>,
> +			     <AIC_IRQ DIE_NO 1191 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names =3D "mbox0", "mbox1", "mbox2", "mbox3",
> +				  "flag0", "flag1", "piodma";
> +		iommus =3D <&DIE_NODE(avd_dart) 0>, <&DIE_NODE(avd_dart) 1>;
> +		power-domains =3D <&DIE_NODE(ps_avd_sys)>;
> +		resets =3D <&DIE_NODE(ps_avd_sys)>;
> +	};
> +
>  	DIE_NODE(pmgr_gfx): power-management@408e80000 {
>  		compatible =3D "apple,t6031-pmgr", "apple,t8103-pmgr", "syscon", "simp=
le-mfd";
>  		#address-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-avd-v3-0-8=
5cbaa2125d8@icloud.com?part=3D17
