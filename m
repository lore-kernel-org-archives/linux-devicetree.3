Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D3D4F96B1
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739009; cv=none; b=Iv+ZTnw6JZyZPDt5sqTRaWLgleOKTFqhdKMRJMHZQZGI4in2YINdJ/IURvSKtYIu39diIoMZ6bnISWu1Nv043lIXdbL2Ew3KHWYXpvK7GCzIV4OKwghYMLFUZPtPDLjTNTsjwo2j+EA8gZ4thoV9ojezC1NJKahigpAgD1h6X5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739009; c=relaxed/simple;
	bh=izC1FlZec9CbMXA8u+zUhOJnnxKZfsbuj/Y7bZqPNr0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jfkO4zUqVxVjqLJD6ympjs0D8Rkrucq5KPdtPbgNpsEIsfgn8KexrN07bG8qM5FS+rWLJL9sufKAl0x28PseKFRts/pEfkqPysDO23D5bCUvJHCQSaEDcdvVo+OPMPloVdwqVwlchax06Piu9pOtUFyesoP7nRxyiKJBewcl/3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3trIe4S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3trIe4S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63B31F000FF;
	Fri, 18 Sep 2026 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789739007;
	bh=uqTAe9GKzzIn2P5S00EWKQEuXaRJxIJ8066erIanf8E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f3trIe4SPhoIj63x8yGLSZIPmxXncLcuTXCyF/qksFPFLTKwQmSNOUPeh4jxR/13Z
	 avpI4ZXMhBg0URvcuwAiuMoOUk/1PqDQ1DyUzbNUcwEsvpjfU4zLQAVtFVhilYmJHP
	 eklVNEJyJ+/9IIYixJJGQSUml/8OYbqOrdvbddcpW+Dnoj/eC8T5PL5H42jc/dY7q7
	 raAE5GBIQD0BUrvyftbDf17PFTtL7I8X4UkA3hgD0942gj5/uiEHLLGdnMuaqgX4dh
	 tRJBin9kuixzO7V6KALS0yTZ9WWr2RzpupQ5rqoQFrZLjUqb+2ehatf5iffpEv/33G
	 scCtM3BrqW1AQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/14] media: apple: avd: add av1 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260918-avd-v1-14-49977931f455@icloud.com>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
 <20260918-avd-v1-14-49977931f455@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 13:43:26 +0000
Message-Id: <20260918134326.B63B31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 14 potential issue=
(s) to consider:
- [Critical] media: apple: avd: integer underflow in DMA offsets from unval=
idated AV1 frame dimensions
- [High] media: apple: avd: out-of-bounds read due to unvalidated `tile_col=
s` and `tile_rows`
- [High] media: apple: avd: out-of-bounds read via unvalidated tile group r=
ow/col indices
- [High] media: apple: avd: nested out-of-bounds reads from unvalidated ref=
erence indices
- [High] media: apple: avd: integer truncation in `submit_num` causes hardw=
are hang
- [High] media: apple: avd: ignored return value from `avd_av1_alloc_work_b=
ufs` leads to uninitialized DMA access
- [High] media: apple: avd: division by zero in `calc_upscale` with `upscal=
ed_width` 0
- [High] media: apple: avd: integer overflow in sb_cols DMA size calculation
- [High] media: apple: avd: silent DMA address truncation due to missing 25=
6-byte alignment enforcement
- [High] media: apple: avd: hardware FIFO overflow from blind MMIO executio=
n loops
- [Medium] media: apple: avd: memory leak of `above_info` DMA buffer in `av=
d_av1_stop`
- [Medium] media: apple: avd: missing cleanup in `avd_av1_run` upon job ini=
tialization failure
- [Medium] media: apple: avd: uninitialized DMA address pushed for segmenta=
tion map
- [Medium] media: apple: avd: missing DMA cache synchronization around CPU =
memcpy
--

commit f54648a42a29822e2c57e672c649ebee169ae4fd
Author: Sofus Forstreuter <sofus.c@icloud.com>

    media: apple: avd: add av1 support

    This adds AV1 decoding support for newer Apple SoCs, utilizing
    entropy tables adapted from verisilicon drivers. The implementation
    passes the AV1-TEST-VECTORS test suite with a 238/242 score.

> diff --git a/drivers/media/platform/apple/avd/avd-av1.c b/drivers/media/p=
latform/apple/avd/avd-av1.c
> new file mode 100644
> index 0000000000000..802341b230e26
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-av1.c
> @@ -0,0 +1,1447 @@
> +// SPDX-License-Identifier: GPL-2.0
[ ... ]
> +struct avd_av1_ctx {
> +	u8 submit_num;

[Severity: High]
Does this regression truncate the result of tile_cols * tile_rows? The
submit_num field is declared as a u8.

[ ... ]
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

[Severity: High]
Is there a risk of a division by zero regression here? If userspace sets
upscaled_width to 0 in the V4L2_CID_STATELESS_AV1_FRAME control,
upscaled_plane_w could evaluate to 0.

[ ... ]
> +	pusha(run->addresses.probs_out, "probs_out", 0);
> +	pusha(av1_ctx->bufs.probs.addr, "probs", 1);
> +	pusha(av1_ctx->bufs.above_info.addr, "col", 0);
> +	pusha(av1_ctx->bufs.seg.addr, "seg", 0);

[Severity: Medium]
Can this push an uninitialized DMA address to the hardware? This regression
can occur because the seg buffer is only allocated if
V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP is set. If the flag isn't set on the
first frame of a context, av1_ctx->bufs.seg.addr will be 0.

[ ... ]
> +static void set_tiles(struct avd_ctx *ctx, struct avd_av1_run *run)
> +{
> +	struct avd_av1_ctx *av1_ctx =3D ctx->priv;
> +	const struct v4l2_ctrl_av1_frame *frame =3D run->frame;
> +	const struct v4l2_ctrl_av1_sequence *seq =3D run->seq;
> +	const struct v4l2_ctrl_av1_tile_group_entry *tile_group;
> +	const struct v4l2_av1_tile_info *tile_info =3D &frame->tile_info;
> +	int row, col, sb_row, sb_col, tile_id;
> +	int sb_shift =3D
> +		seq->flags & V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK ? 5 :
> +									     4;
> +
> +	av1_ctx->submit_num =3D tile_info->tile_cols * tile_info->tile_rows;

[Severity: High]
As mentioned earlier, could this multiplication truncate and result in 0?
If it does, the submission loop later would see 0 - 1, which is -1, and
bypass the execution loop entirely.

> +
> +	for (row =3D 0; row < tile_info->tile_rows; row++) {
> +		for (col =3D 0; col < tile_info->tile_cols; col++) {
> +			ctx->job.num++;
> +			tile_id =3D row * tile_info->tile_cols + col;
> +			tile_group =3D &run->tile_group[tile_id];

[Severity: High]
Could this loop generate a tile_id that reads far out of bounds? If
tile_cols and tile_rows are unvalidated and reach their maximums, it
might exceed the dimensions of run->tile_group which is bounded by
V4L2_AV1_MAX_TILE_COUNT.

> +
> +			push(AVD_OP_CODED_DATA |
> +				     AVD_OP_CODED_DATA_ADDR(
> +					     (run->base.coded_in +
> +					      tile_group->tile_offset) >>
> +					     32),
> +			     "tile_start");
> +			push((u32)((run->base.coded_in +
> +				    tile_group->tile_offset) &
> +				   0xffffffff),
> +			     "tile_addr");
> +			push(tile_group->tile_size, "tile_size");
> +
> +			sb_row =3D
> +				tile_info->mi_row_starts[tile_group->tile_row] >>
> +				sb_shift;
> +			sb_col =3D
> +				tile_info->mi_col_starts[tile_group->tile_col] >>
> +				sb_shift;
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
> +						     [tile_group->tile_row]) |

[Severity: High]
Could this regression cause out-of-bounds reads into mi_row_starts and
height_in_sbs_minus_1? The tile_row and tile_col fields come directly
from the V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY control payload. If
userspace provides large values, it might read past the bounds of these
small fixed-size arrays and push those values to the hardware.

[ ... ]
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
> +		ref =3D avd_get_ref_buf(
> +			ctx, &dst->base.vb,
> +			run->frame->reference_frame_ts
> +				[run->frame->ref_frame_idx
> +					 [run->frame->primary_ref_frame]]);

[Severity: High]
Is it possible for primary_ref_frame or the fetched ref_frame_idx to
exceed the bounds of their respective arrays? If userspace supplies a
primary_ref_frame greater than 7, this could lead to a nested
out-of-bounds read regression when looking up the reference buffer.

> +		memcpy(av1_ctx->bufs.probs.cpu,
> +		       vb2_plane_vaddr(&ref->base.vb.vb2_buf, 0) +
> +			       AVD_AV1_CDFS_OFFSET(
> +				       ref->base.vb.vb2_buf.planes[0].length,
> +				       ref->av1.color_size),
> +		       sizeof(struct avd_av1_cdfs));

[Severity: Medium]
Is a DMA cache synchronization needed before accessing this buffer with the
CPU? The reference buffer is mapped for device access, and copying from it
without a prior sync might yield stale cache data.

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

[Severity: Critical]
Can the av1.color_size calculation lead to an integer underflow regression
when passed to AVD_AV1_CDFS_OFFSET?

If userspace provides huge dimensions, avd_color_size might return an
enormous value. Subtracting it from the plane length could underflow,
leading to a massive positive offset that causes memcpy to overwrite
memory far outside the mapped buffer.

[ ... ]
> +static int avd_av1_run_preamble(struct avd_ctx *ctx, struct avd_av1_run =
*run)
> +{
[ ... ]
> +	dst_len =3D run->base.bufs.dst->vb2_buf.planes[0].length;
> +	tlb_len =3D avd_color_size(run->frame->frame_width_minus_1 + 1,
> +				 run->frame->frame_height_minus_1 + 1);
> +
> +	run->addresses.color =3D
> +		run->base.y_out + AVD_AV1_COLOR_OFFSET(dst_len, tlb_len);
> +
> +	run->addresses.probs_out =3D
> +		run->base.y_out + AVD_AV1_CDFS_OFFSET(dst_len, tlb_len);

[Severity: High]
Does this offset logic require dst_len to be 256-byte aligned? If an
unaligned length is provided, the resulting DMA pointer may become
unaligned. When passed to pusha() later, the unaligned bits might be
silently truncated, causing a regression where hardware writes to a
shifted boundary.

[ ... ]
> +static int avd_av1_alloc_work_bufs(struct avd_ctx *ctx, struct avd_av1_r=
un *run)
> +{
> +	struct avd_dev *avd =3D ctx->dev;
> +	struct avd_av1_ctx *av1_ctx =3D ctx->priv;
> +	const struct v4l2_ctrl_av1_frame *frame =3D run->frame;
> +	const struct v4l2_ctrl_av1_sequence *seq =3D run->seq;
> +	const struct v4l2_av1_tile_info *tile_info =3D &frame->tile_info;
> +	int ret, max_sb_col =3D 0, max_sb_row =3D 0, i, sb_cols1 =3D 0, sb_cols=
2 =3D 0,
> +		 sb;
> +	int sb_shift =3D
> +		seq->flags & V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK ? 1 :
> +									     0;
> +	int w =3D frame->frame_width_minus_1 + 1;
> +	int h =3D frame->frame_height_minus_1 + 1;
> +	int bit_depth =3D seq->bit_depth;
> +
> +	for (i =3D 0; i < tile_info->tile_cols; i++) {
> +		sb =3D tile_info->width_in_sbs_minus_1[i] + 1;
> +		max_sb_col =3D sb > max_sb_col ? sb : max_sb_col;
> +		sb_cols1 +=3D ALIGN((sb << sb_shift) * 44, 128);
> +		/* wrong alignment? */
> +		sb_cols2 +=3D ALIGN((sb << sb_shift) * 12, 128);
> +	}

[Severity: High]
Could this loop read past the end of the width_in_sbs_minus_1 array? This
array has 64 elements, but tile_cols can iterate up to 255 if unvalidated.

Additionally, does the size calculation overflow? The operation
(sb << sb_shift) * 44 uses signed 32-bit arithmetic, which could wrap
around with extremely large values of sb, resulting in a tiny allocation
and an out-of-bounds DMA write regression.

[ ... ]
> +static int avd_av1_run(struct avd_ctx *ctx)
> +{
> +	struct avd_av1_run run;
> +	struct avd_decoded_buffer *dst;
> +	int ret;
> +
> +	ret =3D avd_av1_run_preamble(ctx, &run);
> +	if (ret) {
> +		avd_run_postamble(ctx, &run.base);
> +		return ret;
> +	}
> +
> +	ret =3D avd_init_job(ctx, AVD_CODEC_AV1,
> +			   run.frame->tile_info.tile_cols *
> +					   run.frame->tile_info.tile_rows +
> +				   1);
> +	if (ret)
> +		return ret;

[Severity: Medium]
If avd_init_job() fails, does the context need to be cleaned up?
avd_av1_run_preamble() was successfully called right before this, so
it looks like a regression where avd_run_postamble() is missing to
release the preamble state before returning.

> +
> +	dst =3D vb2_to_avd_decoded_buf(&run.base.bufs.dst->vb2_buf);
> +	update_dec_buf_info(dst, run.seq, run.frame);
> +
> +	avd_av1_set_prob(ctx, &run);
> +	avd_av1_alloc_work_bufs(ctx, &run);
> +
> +	set_header(ctx, &run);

[Severity: High]
What happens if avd_av1_alloc_work_bufs() fails? The function returns an
error code on allocation failure, but it appears to be ignored here. If it
fails, the hardware might be commanded to use unallocated (zeroed) DMA
addresses, causing a regression.

[ ... ]
> +static void avd_av1_stop(struct avd_ctx *ctx)
> +{
> +	struct avd_av1_ctx *av1_ctx =3D ctx->priv;
> +	struct avd_dev *avd =3D ctx->dev;
> +
> +	avd_buf_free(avd, &av1_ctx->bufs.rf_above_info);
> +	avd_buf_free(avd, &av1_ctx->bufs.az_above);
> +	avd_buf_free(avd, &av1_ctx->bufs.ip_above);
> +	avd_buf_free(avd, &av1_ctx->bufs.lf_above);
> +	avd_buf_free(avd, &av1_ctx->bufs.lf_above_info);
> +	avd_buf_free(avd, &av1_ctx->bufs.lf_left);

[Severity: Medium]
Should av1_ctx->bufs.above_info be freed here? It seems this buffer is
allocated in avd_av1_alloc_work_bufs but is missing from this teardown
sequence, resulting in a memory leak regression.

[ ... ]
> +static void avd_av1_submit(struct avd_ctx *ctx)
> +{
> +	struct avd_av1_ctx *av1_ctx =3D ctx->priv;
> +	struct avd_dev *avd =3D ctx->dev;
> +
> +	writel(AVD_OP_EXEC |
> +		       AVD_OP_EXEC_FLAG_START_REV4(avd->variant->revision =3D=3D
> +						   4) |
> +		       AVD_OP_EXEC_FIFO_IDX(ctx->fifo_idx) |
> +		       AVD_OP_EXEC_FIFO_MASK(avd->variant->fifo_slots),
> +	       avd->ctrl + avd->variant->submit_offset);
> +	for (int i =3D 0; i < av1_ctx->submit_num - 1; i++) {
> +		writel(AVD_OP_EXEC | AVD_OP_EXEC_FIFO_IDX(ctx->fifo_idx) |
> +			       AVD_OP_EXEC_FIFO_MASK(avd->variant->fifo_slots),
> +		       avd->ctrl + avd->variant->submit_offset);
> +	}

[Severity: High]
Could this tight loop overrun the hardware FIFO? The MMIO writes are
executed sequentially without polling or checking if the hardware can
accept them, which might cause command drops if submit_num exceeds the
available FIFO depth.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-avd-v1-0-4=
9977931f455@icloud.com?part=3D14
