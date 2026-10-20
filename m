Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504934;
	b=CzjvUgIcPsZcCF0l75VWciOJOAylDr3Wa2cAdTUQvKvofCRxDsVd/Pg1fdFfe4MxRvkV
	 sLE696xxzZwSnoxqeTDbMcEGdp5F+UDYqRhSxTA7c4h4gcUuhHUSe8vE/6uG7ESTWm7OP
	 A6t2EobNv56/9ACb3dTFQZhN/VZv0Dma4Od1wucZWagMTUXuRGxtZ2r/jYXhSXBoj+DFh
	 nkRZO+m96L9MpdqS6JN7ogOkPd6eV2caItEjRp0oBpumqmyYe8xPvX5B/Rr8K5bRA2A6v
	 QDMRf1ZUrTnqq1McLNhahiWCsnughnJnQl7du8Af7m3zu0GS6BerNFqkiO8PgZCWORg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504934;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZGQlM0gMHLS8wCeNHD1FDFCkCU92i6mm87QAjBA8QDc=;
	b=jbqwB/HTU3GNB6HIBIxvTiGRlri5MeN/6I1O3NmrIAwQq/JysNqsEmxD3ArMNwbimekA
	 Et+R3xKM/8Xi2J5MoCOyU+GPLXGGabJT8Ko7CpTc6Zr2XctZvRpI5o9U36pt7UWJFV+yH
	 lGE+rqKIiXtBlbqjM3kV5wtkDr4Kf7ErS5XXFQBE+oY3yiyQfw+45s2Ftgn8RdjHRx9yL
	 qcgttohVflXa2lMWpcgkekuu4lae0wKiau7eksl2kyhcbhDPRprfPhf1TvNEEYl8wDJVN
	 XYEBI0l16sc2GEcYraiVD8eiphkD8+pDnJT/fr5/mbXoB66Ec6WoY5p/BDzsDG24GWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iDotFdZR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE264606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 14:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iDotFdZR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CB1A1F000C4;
	Tue, 20 Oct 2026 14:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792504933;
	bh=ZGQlM0gMHLS8wCeNHD1FDFCkCU92i6mm87QAjBA8QDc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iDotFdZRw/Rzp4blRYjvhNunW6H4o2zvc5gLM88+pcJzyMJKCrydMkfla98Wk0xeX
	 yQfWZp8hNlCC+sIRhEOvcPAkVOlm2UZZnU9MGAThwCTose0eGg9WU60EEcqF+0U2ZD
	 lWyAdtfp96G2yuDJt3gtegotb6AdkBVTata5j4BDc9V1ohwzMPGD1TIKD6es3ixfIb
	 IWCWaz4JlbGYKlDfJBBClV4DzrGzEar1f5+IsrwYHHZG3IuYvDj5pDsBgdryyvaOO3
	 VkfYHbQFv3+KEwVeK6ewpUYS7a9dv2KRhLsBrtNS5oNiW6SluzIJyPHAcrfQleaOmq
	 vG8VgesWfKxQA==
Message-ID: <sashiko-outbox-179077@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 13/17] arm64: dts: apple: t8122: add avd nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261020-avd-v3-13-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
 <20261020-avd-v3-13-85cbaa2125d8@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 14:02:12 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [Critical] media: apple: avd: invalid tile bounds in avd_hevc_validate_pp=
s()
- [Critical] media: apple: avd: out-of-bounds access, NULL deref, and div-b=
y-zero in codecs
- [High] media: apple: avd: return -ENOMEM on slice allocation failure in a=
vd_h264_start()
- [High] media: apple: avd: unchecked ref indices in set_ref_hdr() and stre=
am_slice()
- [High] media: apple: avd: unsynchronized reset in avd_watchdog_func() vs =
IRQ
- [High] media: apple: avd: active ctx->comp mutation in avd_try_capture_fm=
t()
- [Medium] media: apple: avd: wrong plane length field in stream_slice_mv()
- [Low] arm64: dts: apple: t8122: undocumented apple,t8122-dart compatible =
string
--

commit 8b4643c23145b16ec624d5c67d6b796e434e2d89
Author: Sofus Forstreuter <sofus.c@icloud.com>

arm64: dts: apple: t8122: add avd nodes

This commit adds the DART IOMMU and video-codec device tree nodes for the
Apple Video Decoder on the t8122 SoC.

> diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/a=
pple/t8122.dtsi
> index 1ee61c5b3409f..25e47755e0951 100644
> --- a/arch/arm64/boot/dts/apple/t8122.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8122.dtsi
> @@ -186,6 +186,38 @@ soc {
>  		/* Required to get >32-bit DMA via DARTs */
>  		dma-ranges =3D <0 0 0 0 0xffffffff 0xffffc000>;
> =20
> +		avd_dart: iommu@289010000 {
> +			compatible =3D "apple,t8122-dart", "apple,t8110-dart";

[Severity: Low]
Does Documentation/devicetree/bindings/iommu/apple,dart.yaml need to be
updated to include "apple,t8122-dart"?

Currently the schema only documents:

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

Because "apple,t8110-dart" selects apple,dart.yaml and "apple,t8122-dart"
is not listed there, running make dtbs_check will fail schema validation
on t8122 device trees.

> +			reg =3D <0x2 0x89010000 0x0 0x4000>;
> +			interrupt-parent =3D <&aic>;
> +			interrupts =3D <AIC_IRQ 686 IRQ_TYPE_LEVEL_HIGH>;
> +			#iommu-cells =3D <1>;
> +			power-domains =3D <&ps_avd_sys>;
> +		};
> +
> +		video-codec@289070000 {
> +			compatible =3D "apple,t8122-avd";

[Severity: Critical]
Enabling video-codec@289070000 with "apple,t8122-avd" exposes the AVD
driver (avd_t8122_variant) to userspace. Looking at the HEVC support in
drivers/media/platform/apple/avd/avd-hevc.c added earlier in the series,
can avd_hevc_validate_pps() and compute_tiles_non_uniform() read and write
out of bounds when userspace submits V4L2_CID_STATELESS_HEVC_PPS and
V4L2_CID_STATELESS_HEVC_SPS controls?

In struct v4l2_ctrl_hevc_pps, column_width_minus1 has 20 elements and
row_height_minus1 has 22 elements, but avd_hevc_validate_pps() checks
against HEVC_MAX_TILE_COLS (40) and HEVC_MAX_TILE_ROWS (44):

	if (pps->num_tile_columns_minus1 + 1 > HEVC_MAX_TILE_COLS ||
	    pps->num_tile_rows_minus1 + 1 > HEVC_MAX_TILE_ROWS)
		return -EINVAL;

When V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING is not set,
avd_hevc_run() -> avd_hevc_compute_tiles() -> compute_tiles_non_uniform()
loops i up to pps->num_tile_columns_minus1 - 1 and
pps->num_tile_rows_minus1 - 1:

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

Can this read pps->column_width_minus1[i] and pps->row_height_minus1[i]
out of bounds? Also, because each entry is only clamped individually to
pic_in_cts_width or pic_in_cts_height, if sum exceeds pic_in_cts_width or
pic_in_cts_height, column_width[i] and row_height[i] underflow u16, which
then causes compute_bd() and compute_tile_ids() to index
ctb_addr_rs_to_ts[] and tile_ids[] out of bounds:

	for (j =3D 0, tile_idx =3D 0; j <=3D pps->num_tile_rows_minus1; j++)
		for (i =3D 0; i <=3D pps->num_tile_columns_minus1; i++, tile_idx++)
			for (y =3D row_bd[j]; y < row_bd[j + 1]; y++)
				for (x =3D col_bd[i]; x < col_bd[i + 1]; x++)
					tile_ids[ctb_addr_rs_to_ts
							 [y * pic_in_ctbs_width +
							  x]] =3D tile_idx;

Furthermore, in avd_hevc_compute_tiles() (which runs in avd_hevc_run()
before avd_hevc_alloc_scratch()):

	max_cu_width =3D 1 << (sps->log2_diff_max_min_luma_coding_block_size +
			     log2_min_cb_size);
	pic_in_ctbs_width =3D (width + max_cu_width - 1) / max_cu_width;
	pic_in_ctbs_height =3D (height + max_cu_width - 1) / max_cu_width;

If the unvalidated SPS coding block size fields shift out to 0, or if
sps->pic_width_in_luma_samples / pic_height_in_luma_samples is 0, can this
divide by zero in avd_hevc_compute_tiles() or compute_rs_to_ts()?

[Severity: Critical]
Also in the AV1, VP9, and H.264 paths enabled by "apple,t8122-avd", are
there several missing validations on userspace control and buffer parameter=
s?

1. In drivers/media/platform/apple/avd/avd-av1.c, frame->frame_width_minus_1
and frame->frame_height_minus_1 are not checked against
ctx->decoded_fmt.fmt.pix_mp.width and height. In avd_av1_set_prob():

	memcpy(vb2_plane_vaddr(&dst->base.vb.vb2_buf, 0) +
		       AVD_AV1_CDFS_OFFSET(dst->base.vb.vb2_buf.planes[0].length,
					   dst->av1.color_size),
	       av1_ctx->bufs.probs.cpu, sizeof(struct avd_av1_cdfs));

If dst->av1.color_size (derived from frame_width_minus_1 + 1 and
frame_height_minus_1 + 1) exceeds planes[0].length, can
AVD_AV1_CDFS_OFFSET and AVD_AV1_COLOR_OFFSET underflow, causing memcpy()
and hardware DMA to write out of bounds? Similarly, in avd-h264.c,
avd_h264_validate_sps() does not check SPS dimensions against
ctx->coded_fmt or ctx->decoded_fmt, while avd_h264_alloc_bufs() allocates
scratch buffers using fmt_width(ctx) and stream_hdr() programs hardware
with the SPS dimensions.

2. In avd_av1_set_prob() (drivers/media/platform/apple/avd/avd-av1.c) and
set_tiles() (drivers/media/platform/apple/avd/avd-vp9.c):

	struct vb2_v4l2_buffer *src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
	const u8 *data =3D vb2_plane_vaddr(&src->vb2_buf, 0);

Since avd_queue_init() enables VB2_DMABUF, can vb2_plane_vaddr() return
NULL and trigger a NULL pointer dereference when accessed without a check?

3. In avd_av1_run_preamble() (drivers/media/platform/apple/avd/avd-av1.c):

	if (run->frame->tile_info.tile_cols * run->frame->tile_info.tile_rows >
		ctrl->new_elems)
		return -EINVAL;

Since this validates ctrl->p_cur.p during a run, should this check
ctrl->elems instead of ctrl->new_elems?

4. In set_tiles() (drivers/media/platform/apple/avd/avd-av1.c):

			tile_row =3D tile_group->tile_row;
			tile_col =3D tile_group->tile_col;

			if (tile_col >=3D V4L2_AV1_MAX_TILE_COLS ||
			    tile_row >=3D V4L2_AV1_MAX_TILE_ROWS)
				return -EINVAL;

Because tile_row and tile_col are signed int while tile_group->tile_row
and tile_group->tile_col are __u32, can values >=3D 0x80000000 become
negative, bypass the upper-bound check, and index tile_info arrays out of
bounds?

5. In calc_upscale() (drivers/media/platform/apple/avd/avd-av1.c):

	upscaled_plane_w =3D AV1_DIV_ROUND_UP_POW2(upscaled_width, sub_x);
	*step_x =3D ((downscaled_plane_w << SUPERRES_SCALE_BITS) +
		   (upscaled_plane_w / 2)) /
		  upscaled_plane_w;

And in set_refs() in the same file, can frame->upscaled_width =3D=3D 0 or
frame_width_minus_1 / frame_height_minus_1 =3D=3D U32_MAX cause a division =
by
zero?

[Severity: High]
In drivers/media/platform/apple/avd/avd-h264.c, what happens if the slice
array allocation fails in avd_h264_start()?

	ret =3D avd_h264_validate_sps(ctx, ctrl->p_new.p_h264_sps);
	if (ret)
		return ret;

	h264_ctx =3D kzalloc_obj(*h264_ctx, GFP_KERNEL);
	if (!h264_ctx)
		return -ENOMEM;

	ctx->priv =3D h264_ctx;

	/* assume one slice per row */
	h264_ctx->alloc_slice_num =3D
		ctrl->p_new.p_h264_sps->pic_height_in_map_units_minus1 + 1;
	h264_ctx->slices =3D kzalloc_objs(*h264_ctx->slices,
					h264_ctx->alloc_slice_num, GFP_KERNEL);
	if (!h264_ctx->slices)
		goto err_free_ctx;
...
err_free_ctx:
	avd_h264_stop(ctx);
	ctx->priv =3D NULL;
	return ret;

When kzalloc_objs() returns NULL, ret is still 0 from
avd_h264_validate_sps(). Jumping to err_free_ctx frees h264_ctx, sets
ctx->priv =3D NULL, and returns 0 to avd_start_streaming(), which then
allows avd_h264_run() and avd_h264_done() to dereference a NULL h264_ctx.
Should ret be set to -ENOMEM before goto err_free_ctx?

[Severity: High]
In drivers/media/platform/apple/avd/avd-av1.c and avd-h264.c, can
userspace trigger out-of-bounds reads via unchecked reference indices?

In set_ref_hdr() (drivers/media/platform/apple/avd/avd-av1.c):

	for (i =3D 0; i < 6; i++) {
		for (j =3D i + 1; j < 7; j++) {
			if (frame->reference_frame_ts[frame->ref_frame_idx[i]] =3D=3D
			    frame->reference_frame_ts[frame->ref_frame_idx[j]]) {

Here frame->ref_frame_idx[] is an array of signed __s8 values from
userspace used directly to index the 8-element frame->reference_frame_ts[]
array without bounds checking. Also, in avd_av1_get_ref_buf():

	if (idx < 0 || idx >=3D V4L2_AV1_TOTAL_REFS_PER_FRAME ||
	    frame->ref_frame_idx[idx] >=3D ARRAY_SIZE(frame->reference_frame_ts))

Should idx be checked against V4L2_AV1_REFS_PER_FRAME (7, the size of
frame->ref_frame_idx[]) instead of V4L2_AV1_TOTAL_REFS_PER_FRAME (8), and
should frame->ref_frame_idx[idx] also be checked for < 0?

Similarly, in stream_slice() (drivers/media/platform/apple/avd/avd-h264.c):

		/* sl->ref_pic_list1[0].index < ARRAY_SIZE(decode->dpb) */
		/* bidirectional reference of previous mv */
		ref =3D avd_get_ref_buf(
			ctx, &dst->base.vb,
			decode->dpb[sl->ref_pic_list1[0].index].reference_ts);

Can sl->ref_pic_list1[0].index (an unvalidated __u8 from userspace) index
past the 16-element decode->dpb[] array when sl->slice_type is
V4L2_H264_SLICE_TYPE_B?

[Severity: High]
In drivers/media/platform/apple/avd/avd-v4l2.c, does calling VIDIOC_TRY_FMT
on the capture queue corrupt the active ctx->comp state?

avd_try_capture_fmt() calls avd_fill_decoded_pixfmt(ctx, pix_mp):

	if (is_interchange(pix_mp->pixelformat))
		pix_mp->plane_fmt[0].sizeimage =3D 0;
	ctx->comp.start_offset =3D pix_mp->plane_fmt[0].sizeimage;

	fill_comp(&ctx->comp, ctx->image_fmt, pix_mp->width, pix_mp->height);

Because avd_fill_decoded_pixfmt() writes directly to ctx->comp, a
VIDIOC_TRY_FMT ioctl will overwrite ctx->comp.start_offset,
ctx->comp.offsets, and ctx->comp.size, which avd_run_preamble() then uses
to compute DMA addresses for active capture buffers:

	run->comp_out =3D run->y_out + ctx->comp.start_offset;
	ctx->decomp =3D !is_interchange(ctx->decoded_fmt.fmt.pix_mp.pixelformat);

	dst =3D vb2_to_avd_decoded_buf(&run->bufs.dst->vb2_buf);
	memcpy(&dst->comp, &ctx->comp, sizeof(ctx->comp));

[Severity: Medium]
In stream_slice_mv() (drivers/media/platform/apple/avd/avd-hevc.c):

	if (ref_valid) {
		dma_addr_t mv_color_addr =3D
			vb2_dma_contig_plane_dma_addr(&ref->base.vb.vb2_buf,
						      0) +
			(ref->base.vb.planes[0].length -
			 mv_color_size(fmt_width(ctx), fmt_height(ctx)));
		pusha(mv_color_addr, "mv_colo", 0);
	}

When userspace queues a VB2_MEMORY_DMABUF capture buffer with plane length
0, ref->base.vb.planes[0].length remains 0 while the actual buffer size is
stored in ref->base.vb.vb2_buf.planes[0].length (which is what
avd_hevc_run_preamble() uses when computing run->addresses.mv_color).
Doesn't using ref->base.vb.planes[0].length here underflow the 32-bit
subtraction and produce an invalid DMA address?

> +			reg =3D <0x2 0x89070000 0x0 0x4000>,
> +			      <0x2 0x89080000 0x0 0x10000>,
> +			      <0x2 0x89090000 0x0 0x14000>,
> +			      <0x2 0x890a4000 0x0 0x4000>,
> +			      <0x2 0x89100000 0x0 0x10000>;
> +			reg-names =3D "piodma", "code", "sram", "mbox", "ctrl";
> +			interrupt-parent =3D <&aic>;
> +			interrupts =3D <AIC_IRQ 679 IRQ_TYPE_LEVEL_HIGH>,
> +				     <AIC_IRQ 680 IRQ_TYPE_LEVEL_HIGH>,
> +				     <AIC_IRQ 681 IRQ_TYPE_LEVEL_HIGH>,
> +				     <AIC_IRQ 682 IRQ_TYPE_LEVEL_HIGH>,
> +				     <AIC_IRQ 683 IRQ_TYPE_LEVEL_HIGH>,
> +				     <AIC_IRQ 684 IRQ_TYPE_LEVEL_HIGH>,
> +				     <AIC_IRQ 685 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "mbox0", "mbox1", "mbox2", "mbox3",
> +					  "flag0", "flag1", "piodma";
> +			iommus =3D <&avd_dart 0>, <&avd_dart 1>;
> +			power-domains =3D <&ps_avd_sys>;
> +			resets =3D <&ps_avd_sys>;
> +		};

[Severity: High]
With resets =3D <&ps_avd_sys> and the mbox0 interrupt wired up here, can
avd_watchdog_func() race with the threaded handler avd_irq_handler() in
drivers/media/platform/apple/avd/avd-drv.c?

In avd_watchdog_func():

	writel(0, avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
	ret =3D avd_reset(avd);
	if (ret)
		dev_err(avd->dev, "failed to reset: %d", ret);

	avd_job_finish(ctx, VB2_BUF_STATE_ERROR);

And in avd_irq_handler():

	status =3D readl(avd->mbox + AVD_REG_MBOX0_RETRIEVE);
	writel(AVD_MBOX0_NOT_EMPTY, avd->mbox + AVD_REG_MBOX_IRQ_CLR);
...
	/* if the watchdog_work has run the work has already been submitted */
	if (cancel_delayed_work(&ctx->watchdog_work))
		avd_job_finish(ctx, state);

If the mbox0 IRQ fires just as ctx->watchdog_work expires,
avd_watchdog_func() only clears AVD_REG_MBOX_IRQ_ENABLE in MMIO without
calling disable_irq() or synchronize_irq(). Can avd_irq_handler() execute
concurrently on another CPU and read/write avd->mbox while avd_reset() ->
reset_control_reset(avd->rstc) -> apple_pmgr_reset_assert() asserts
APPLE_PMGR_DEV_DISABLE and APPLE_PMGR_RESET on ps_avd_sys? Also, if
avd_watchdog_func() finishes the job and starts the next M2M job before
avd_irq_handler() reaches cancel_delayed_work(&ctx->watchdog_work), can
avd_irq_handler() cancel the new job's watchdog timer and call
avd_job_finish() a second time?

[ ... ]

>
> --=20
> 2.51.2
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-avd-v3-0-8=
5cbaa2125d8@icloud.com?part=3D13
