Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468D8145B27
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 13:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790429828; cv=none; b=foDRqI7v2hW0nTaxPnKs1LcqadMQAipn87kYm67R6hEz36etAfRxpiymjPu5WsejprFjKufuSyyiMuqBYb9mZSVJT0zrm81tF8yCc/H9XedhKVFd7DRaXnJnnbTdvtNpElcoK9ctPxgHZLnq8LthQ2yJoXbcSz+MoH2iZ2g27VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790429828; c=relaxed/simple;
	bh=X6wewcaVn1e3purjrHge6tnJndrz1VXrzoUhttjt02g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CyXrvKRMvl7xWz0o23pgycH2HB/ZQ1VBKkZ11HBDfQ0bzrur+E1T6Yo0FIS9D79V4YV9abG6sPqb6JUkuo2mxmpNqvkO+qLGfBja7qPyhwZHr1hwUZRUJhfTmK5LNgoF0kKtHvEk/SZLvE83p1Bw3odLckKUxr04SgD3B/Cmkw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADzT7dL9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADzT7dL9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998CE1F000FF;
	Sat, 26 Sep 2026 13:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790429826;
	bh=Zy8n8V0yiwsYhtINy8LyjICqgY+IIckE08pRG0y1q8g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ADzT7dL96Zr3tiNw0kJ4D7seACd6toPXY4GY4uvd8BISuaObgei/kldGrNeUKq8PO
	 oH8xubcydZPDps7umCqxCxC1RlaG7K8FFRl6mpGKK5/8RQ2oqpA1wClfzKoLU0rk//
	 281G/4jdlIxT4rn1SbTRU2GPRIYBlXoqpGgHA0b1y303BXBTHCzM+pD2QHayHN/DzN
	 Y9Pb3AsElnK0Q3XHBlh+gU9Z33MVkjeIW3UeWT1tINftlq/Ss+xwFzDFSw744ZIO27
	 zs//HZ+Ck10NffQKyUhsKQjeSNfWc80RQf4GjU1lhJoJOez4Z/qafK120Ex4rOMqW7
	 tK4te2yNelvsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/17] media: apple: avd: add av1 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260926-avd-v2-10-ecebe6a3648e@icloud.com>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
 <20260926-avd-v2-10-ecebe6a3648e@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 13:37:06 +0000
Message-Id: <20260926133706.998CE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [Critical] media: avd: av1: Unvalidated frame dimensions lead to integer =
overflows and OOB DMA access
- [High] media: avd: av1: AV1_LF_SHARPNESS bitmask overlaps with loop filte=
r delta macros
- [High] media: avd: av1: Unvalidated ref_frame_idx causes OOB read from re=
ference_frame_ts array
- [High] media: avd: av1: Missing tile_cols/tile_rows validation causes off=
-by-one OOB access and overflows
- [High] media: avd: av1: Hardware accesses physical address 0x0 for unallo=
cated auxiliary buffers
- [High] media: avd: av1: NULL pointer dereference from unchecked vb2_plane=
_vaddr()
- [Medium] media: avd: av1: Fallback logic copies uninitialized CDF memory =
from the destination buffer
- [Medium] media: avd: av1: Incorrect global motion shear calculation rejec=
ts valid negative alpha parameters
- [Low] media: avd: av1: Lockless read of active V4L2 controls risks torn p=
arameters
--

commit 803772d649afcd58e4fdefb6bd3047324fac968b
Author: Sofus Forstreuter <sofus.c@icloud.com>

media: apple: avd: add av1 support

This commit adds AV1 decoding support to the Apple Video Decoder (AVD)
driver. It includes entropy mode helpers, V4L2 format definitions, and
the main decoding flow for AV1 frames.

> diff --git a/drivers/media/platform/apple/avd/avd-av1.c b/drivers/media/p=
latform/apple/avd/avd-av1.c
> new file mode 100644
> index 0000000000000..357dd1d0eca5c
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-av1.c
> @@ -0,0 +1,1432 @@
[ ... ]
> +#define AV1_LF_DELTA_ENABLED(v)	FIELD_PREP(BIT(27), !!(v))
> +#define AV1_LF_DELTA_MULTI(v)	FIELD_PREP(BIT(28), !!(v))
> +#define AV1_LF_DELTA_PRESENT(v)	FIELD_PREP(BIT(31), !!(v))
> +#define AV1_LF_DELTA_RES(v)	FIELD_PREP(GENMASK(30, 29), v)
> +#define AV1_LF_LV3(v)		FIELD_PREP(GENMASK(5, 0), v)
> +#define AV1_LF_LV2(v)		FIELD_PREP(GENMASK(11, 6), v)
> +#define AV1_LF_LV1(v)		FIELD_PREP(GENMASK(17, 12), v)
> +#define AV1_LF_LV0(v)		FIELD_PREP(GENMASK(23, 18), v)
> +
> +#define AV1_LF_SHARPNESS(v)	FIELD_PREP(GENMASK(31, 28), v)

[Severity: High]
Does this bitmask overlap with the loop filter delta macros? It looks like
bits 28 through 31 are shared with AV1_LF_DELTA_MULTI, AV1_LF_DELTA_RES,
and AV1_LF_DELTA_PRESENT, which could cause the hardware to be misconfigured
when both are used in set_header().

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

[Severity: Medium]
Will this improperly reject valid negative alpha parameters? According to t=
he
AV1 specification, the transform calculation should only abort if the alpha
coefficient (mat[2]) is exactly zero to avoid division by zero.

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

[Severity: High]
Can an unvalidated ref_frame_idx from userspace cause an out-of-bounds read
here? The V4L2 framework does not natively bounds-check ref_frame_idx again=
st
V4L2_AV1_TOTAL_REFS_PER_FRAME (8), which might allow a payload to index out=
 of
the reference_frame_ts array.

[ ... ]
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

[Severity: Critical]
Could a maliciously crafted frame with an upscaled_width of 0 result in a
division by zero panic here? There doesn't appear to be a prior non-zero
check on the upscaled dimensions.

[ ... ]
> +static void set_header(struct avd_ctx *ctx, struct avd_av1_run *run)
> +{
[ ... ]
> +	pusha(run->addresses.probs_out, "probs_out", 0);
> +	pusha(av1_ctx->bufs.probs.addr, "probs", 1);
> +	pusha(av1_ctx->bufs.above_info.addr, "col", 0);
> +	pusha(av1_ctx->bufs.seg.addr, "seg", 0);

[Severity: High]
Is it possible for the hardware to access physical address 0x0 here?
The bufs.seg buffer is only allocated in avd_av1_alloc_work_bufs() if
V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP is set. If segmentation is enabled
but UPDATE_MAP is not set, this unconditionally pushes a 0 address to the
hardware, which might cause an IOMMU fault.

[ ... ]
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
> +			if (tile_col > V4L2_AV1_MAX_TILE_COLS ||
> +			    tile_row > V4L2_AV1_MAX_TILE_ROWS)
> +				return -EINVAL;

[Severity: High]
Does this strict greater-than check allow an off-by-one out-of-bounds acces=
s?
If tile_col is exactly V4L2_AV1_MAX_TILE_COLS (64), it bypasses this check =
and
would read exactly at the bounds of the width_in_sbs_minus_1 array below.

[ ... ]
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

[ ... ]
> +static void avd_av1_set_prob(struct avd_ctx *ctx, struct avd_av1_run *ru=
n)
> +{
[ ... ]
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

[Severity: High]
Is it safe to use vb2_plane_vaddr() without checking for a NULL return? If
userspace provides a buffer via V4L2_MEMORY_DMABUF that cannot be mapped in=
to
the kernel virtual address space, this will result in a NULL pointer
dereference.

[Severity: Medium]
If avd_av1_get_ref_buf() cannot find the reference and falls back to return=
ing
the destination buffer (dst), does this copy uninitialized CDF memory from =
the
current uninitialized frame?

[Severity: Critical]
Because avd_color_size() lacks unvalidated dimension protection from
avd_av1_try_ctrl(), could malicious frame dimensions cause an integer overf=
low,
forcing the AVD_AV1_CDFS_OFFSET macro to underflow and generate an arbitrary
DMA offset? This would result in out-of-bounds kernel memory corruption dur=
ing
the memcpy.

[ ... ]
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

[Severity: Low]
Could a lockless read of the active V4L2 control here lead to torn paramete=
rs
if userspace concurrently modifies the control via VIDIOC_S_EXT_CTRLS while=
 the
decoder workqueue is running?

[ ... ]
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

[Severity: High]
Since tile_cols can be up to 256, does this read past the end of the 64-ele=
ment
width_in_sbs_minus_1 array? It seems this could result in out-of-bounds rea=
ds
and drastically undersized work buffer allocations if it overflows.

[ ... ]
> +static int avd_av1_try_ctrl(struct avd_ctx *ctx, struct v4l2_ctrl *ctrl)
> +{
> +	if (ctrl->id =3D=3D V4L2_CID_STATELESS_AV1_SEQUENCE)
> +		return avd_av1_validate_sequence(ctx,
> +						 ctrl->p_new.p_av1_sequence);
> +	/* width should also be > 8 */
> +	return 0;
> +}

[Severity: Critical]
Should we validate the AV1 frame dimensions against the negotiated queue
format here? Unvalidated dimensions lead to the integer overflows in
calc_upscale() and avd_color_size() mentioned earlier, resulting in
OOB DMA accesses.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-avd-v2-0-e=
cebe6a3648e@icloud.com?part=3D10
