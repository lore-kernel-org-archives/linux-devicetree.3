Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A5429C328
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 13:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790429705; cv=none; b=NwtmXVsPHo16iXlr74LjjVckZKE/dkbtYQNRQbmd2xUIjMno6SWjLunhaX8DN+QSoTme5NIKxUIAZ01Ai6C+FN5aeMaNb25uDDJUHzLkGYYRKsiz7WuwZuXdbH6Ctg1e26VFzVBzzMTwDuQ+zp9aIirfH52EJzRpjb/IA5o7OrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790429705; c=relaxed/simple;
	bh=8vd1pxldxzr03lKCCsvLBOqkxZmOXptO7ONlwoXAbOU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EJ45v19FLczmhXvexxskPo03+Zeebu6wXQZTyFuw8oKjQEOYWB/ph3sfHGIPPduXMDkZBSuPWwXfDVRtuUm+1D5Q3LBE0LL8AEEGcdXbvIaUC+tgpreQqUad77q+FYBr2PbIe+B+lrizi8UMCOs8KpwoWrTQPvLSX337/5Cn4wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTlhE1/L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTlhE1/L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276A71F000FF;
	Sat, 26 Sep 2026 13:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790429703;
	bh=bV8dcn/Z1/YCMr8hL5DUjDzwci6TfCx86aFKQ2F5FzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LTlhE1/Lt816OPn/WsLVMethbOd5ohSAswYbqMlq9oRkIOCgmQ2Dhwiw89tYDam0L
	 bR/Rw3XA3IAluOAw9KlDFhQVqI9ycHEm+P4vkHRVD6ZZgyuiPcHu99uezsKySYZpzs
	 I8zJGzUFnVS3EleYeDxOdwQQUifx2tZao3d2HyoUMj2En2pjo6y0PiX8wQInK1rYtx
	 4qx3O0w9PTbMNkk+YFBpbOHUXbnC4RvSJgJl4xv8wt89QrsGaE6unoYm2pkAXB1ihi
	 bYQH/9Y1qDCoGy+NB5Be6x+vbMYs4tqntJDIHxnrzJi/cHE7M+0FsY3CQC/qHD3vMV
	 VGvRlGpO2jvGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/17] media: apple: avd: add hevc support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260926-avd-v2-9-ecebe6a3648e@icloud.com>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
 <20260926-avd-v2-9-ecebe6a3648e@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 13:35:02 +0000
Message-Id: <20260926133503.276A71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [Critical] avd: heap buffer overflow due to missing array bounds validati=
on on pps->column_width_minus1
- [High] avd: kernel panic and buffer overflow via unbounded sps->log2_diff=
 shift
- [High] avd: kernel stack out-of-bounds read via unbounded pos variable in=
 stream_slices
- [High] avd: double out-of-bounds array read in stream_slice_mv via sl->co=
llocated_ref_idx
- [High] avd: heap out-of-bounds read via off-by-one check on slice_segment=
_addr
- [High] avd: arbitrary physical DMA read via integer underflow in slice si=
ze offset validation
- [High] avd: use-after-free and out-of-bounds read due to lockless derefer=
ence of V4L2 dynamic array pointers
- [High] avd: integer overflow in entry point offset validation allows heap=
 out-of-bounds read
- [Medium] avd: hardware register corruption due to overlapping bitmasks fo=
r HEVC_TR_INTRA and HEVC_TR_INTER
--

commit a7dbbf6a1924ee26ecce4f5c5b73414f86b42959
Author: Sofus Forstreuter <sofus.c@icloud.com>

    media: apple: avd: add hevc support
   =20
    The fluster score is 143/147 for JCT-VC-HEVC_V1.
   =20
    RPS_E_qualcomm_5, WPP_D_ericsson_MAIN_2 and WPP_D_ericsson_MAIN10_2 are
    failing, but should be supported.

> diff --git a/drivers/media/platform/apple/avd/avd-hevc.c b/drivers/media/=
platform/apple/avd/avd-hevc.c
> new file mode 100644
> index 0000000000000..d90c7770006b7
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-hevc.c
> @@ -0,0 +1,1340 @@

[ ... ]

> +#define HEVC_TR_INTRA(v)	FIELD_PREP(GENMASK(4, 1), v)
> +#define HEVC_TR_INTER(v)	FIELD_PREP(GENMASK(7, 4), v)

[Severity: Medium]
Do these bitmasks overlap? It looks like both GENMASK(4, 1) and GENMASK(7, =
4)=20
include bit 4. When these are ORed together in set_header() like so:

	HEVC_TR_INTER(sps->max_transform_hierarchy_depth_inter) |
	HEVC_TR_INTRA(sps->max_transform_hierarchy_depth_intra) |

could this clobber the overlapping bit and misconfigure the hardware decode=
r?

[ ... ]

> +static void stream_slice_mv(struct avd_ctx *ctx, struct avd_hevc_run *ru=
n,
> +			    const struct v4l2_ctrl_hevc_slice_params *sl,
> +			    bool is_first)
> +{
> +	const struct v4l2_ctrl_hevc_decode_params *decode =3D run->decode;
> +	struct avd_decoded_buffer *dst, *ref;
> +	bool ref_valid;
> +	const u8 *ref_list;
> +	int ref_idx =3D 0;
> +
> +	ref_list =3D sl->slice_type =3D=3D V4L2_HEVC_SLICE_TYPE_P ? sl->ref_idx=
_l0 :
> +		   sl->flags & V4L2_HEVC_SLICE_PARAMS_FLAG_COLLOCATED_FROM_L0 ?
> +							      sl->ref_idx_l0 :
> +							      sl->ref_idx_l1;
> +
> +	if (sl->slice_type =3D=3D V4L2_HEVC_SLICE_TYPE_I) {
> +		push(AVD_OP_SL_REF |
> +			     AVD_OP_SL_REF_SLICE_I(sl->slice_type =3D=3D
> +						   V4L2_HEVC_SLICE_TYPE_I),
> +		     "slc_a8c_cmd_ref_type");
> +		return;
> +	}
> +	/* bidirectional prediction */
> +	if (sl->collocated_ref_idx < V4L2_HEVC_DPB_ENTRIES_NUM_MAX &&
> +	    ref_list[sl->collocated_ref_idx] < V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +		ref_idx =3D ref_list[sl->collocated_ref_idx];
> +
> +	dst =3D vb2_to_avd_decoded_buf(&run->base.bufs.dst->vb2_buf);
> +	ref =3D avd_get_ref_buf(ctx, &dst->base.vb,
> +			      decode->dpb[ref_idx].timestamp);
> +
> +	ref_valid =3D !(sl->flags &
> +		      V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT) &&
> +		    (sl->flags &
> +		     V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_TEMPORAL_MVP_ENABLED) &&
> +		    is_first && !ref->hevc.is_intra;
> +
> +	push(AVD_OP_SL_REF |
> +		     AVD_OP_SL_REF_MAX_MERGE(
> +			     5 - sl->five_minus_max_num_merge_cand) |
> +		     AVD_OP_SL_REF_FLAG_CABAC(
> +			     sl->flags &
> +			     V4L2_HEVC_SLICE_PARAMS_FLAG_CABAC_INIT) |
> +		     AVD_OP_SL_REF_FLAG0(
> +			     (sl->flags &
> +			      V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_TEMPORAL_MVP_ENABLED) &&
> +			     !(sl->flags &
> +			       V4L2_HEVC_SLICE_PARAMS_FLAG_COLLOCATED_FROM_L0)) |
> +		     AVD_OP_SL_REF_FLAG1(
> +			     !(sl->flags &
> +			       V4L2_HEVC_SLICE_PARAMS_FLAG_MVD_L1_ZERO)) |
> +		     AVD_OP_SL_REF_FLAG2(
> +			     (sl->flags &
> +			      V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_TEMPORAL_MVP_ENABLED) ||
> +			     (sl->flags &
> +			      V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT)) |
> +		     AVD_OP_SL_REF_NUM_L0(sl->num_ref_idx_l0_active_minus1) |
> +		     AVD_OP_SL_REF_NUM_L1(sl->num_ref_idx_l1_active_minus1) |
> +		     AVD_OP_SL_REF_SLICE_P(sl->slice_type =3D=3D
> +					   V4L2_HEVC_SLICE_TYPE_P) |
> +		     AVD_OP_SL_REF_SLICE_B(ref_valid),
> +	     "slc_a8c_cmd_ref_type");
> +
> +	if (ref_valid) {
> +		dma_addr_t mv_color_addr =3D
> +			vb2_dma_contig_plane_dma_addr(&ref->base.vb.vb2_buf,
> +						      0) +
> +			(ref->base.vb.planes[0].length -
> +			 mv_color_size(fmt_width(ctx), fmt_height(ctx)));
> +		pusha(mv_color_addr, "slc_bd4_sps_tile_addr2_lsb8",
> +		      decode->dpb[ref_list[sl->collocated_ref_idx]]
> +			      .pic_order_cnt_val);

[Severity: High]
Is it possible to have an out-of-bounds read here?=20

If sl->collocated_ref_idx (which is controlled by userspace) is >=3D 16=20
(V4L2_HEVC_DPB_ENTRIES_NUM_MAX), it seems to bypass the initial bounds check
which updates ref_idx. Later, when pushing the command:

		      decode->dpb[ref_list[sl->collocated_ref_idx]]

could this read ref_list out-of-bounds, yielding a garbage index, and then=
=20
subsequently use that to read out-of-bounds in decode->dpb, programming=20
arbitrary memory values into the hardware?

> +	}
> +}

[ ... ]

> +static int submit_slice_segment(struct avd_ctx *ctx, struct avd_hevc_run=
 *run,
> +				const struct v4l2_ctrl_hevc_slice_params *sl,
> +				int row, int col, u32 col_bd[23],
> +				u32 row_bd[23], u32 pic_in_cts_width,
> +				u32 pic_in_cts_height, bool first_slice,
> +				bool hflip, bool vflip, u32 coded_flags,
> +				u32 last_tile_block)
> +{
> +	const struct v4l2_ctrl_hevc_pps *pps =3D run->pps;
> +	u32 tb_x, tb_y, tile_block, tile_boundary;
> +
> +	if (coded_flags & NEW_SLICE) {
> +		tb_x =3D sl->slice_segment_addr % pic_in_cts_width;
> +		tb_y =3D sl->slice_segment_addr / pic_in_cts_width;
> +
> +		tile_block =3D AVD_OP_SL_LOC_Y(tb_y) | AVD_OP_SL_LOC_X(tb_x);
> +
> +		if (!(sl->flags &
> +		      V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT))
> +			last_tile_block =3D tile_block;
> +
> +		/*
> +		 * tile block start
> +		 * CABAC window
> +		 */
> +		push(AVD_OP_SL_LOC | last_tile_block, "cm3_cmd_set_cabac_xy");
> +
> +		stream_slice_dqtblk(ctx, run, sl);
> +	} else {
> +		tile_boundary =3D AVD_OP_SL_LOC_Y(row_bd[row]) |
> +				AVD_OP_SL_LOC_X(col_bd[col]);

[Severity: High]
Can the 'row' index here exceed the bounds of the 45-element row_bd kernel
stack array?

In stream_slices(), the row index is calculated from an unbounded 'pos'=20
counter which increments for each entry point offset:

			row =3D pos / num_cols;
			col =3D pos % num_cols;

Since there can be up to 1760 entry point offsets, 'row' is not bounded
against 44. Could this result in an out-of-bounds stack read?

> +	}

[ ... ]

> +static void compute_tiles_non_uniform(struct avd_hevc_run *run,
> +				      u16 log2_min_cb_size, u16 width,
> +				      u16 height, u32 pic_in_cts_width,
> +				      u32 pic_in_cts_height, u16 *column_width,
> +				      u16 *row_height)
> +{
> +	const struct v4l2_ctrl_hevc_pps *pps =3D run->pps;
> +	u32 sum =3D 0;
> +	int i;
> +
> +	for (i =3D 0; i < pps->num_tile_columns_minus1; i++) {
> +		column_width[i] =3D MIN(pps->column_width_minus1[i] + 1,
> +				      pic_in_cts_width);
> +		sum +=3D column_width[i];
> +	}
> +	column_width[i] =3D pic_in_cts_width - sum;

[Severity: Critical]
Does this code overflow column_width_minus1[] and also underflow
column_width[i]?

The validation allows pps->num_tile_columns_minus1 up to 39, but the V4L2
payload array column_width_minus1 only has 20 elements. This could cause an
out-of-bounds read of the struct.

Additionally, since sum is not validated, if sum exceeds pic_in_cts_width,=
=20
does pic_in_cts_width - sum underflow into a huge unsigned 16-bit integer?=
=20

This huge dimension seems to propagate into compute_bd() and compute_tile_i=
ds(),=20
potentially causing thousands of out-of-bounds memory writes on the kernel =
heap=20
when indexing ctb_addr_rs_to_ts and tile_ids.

> +
> +	sum =3D 0;

[ ... ]

> +static void stream_slices(struct avd_ctx *ctx, struct avd_hevc_run *run)
> +{
> +	const struct v4l2_ctrl_hevc_sps *sps =3D run->sps;
> +	const struct v4l2_ctrl_hevc_pps *pps =3D run->pps;
> +	const struct v4l2_ctrl_hevc_slice_params *sl;
> +	struct avd_hevc_tile_info *tile_info =3D &run->tile_info;
> +	bool tiles_enabled, first_slice, first_segment;
> +	bool hflip, vflip;
> +	int slice_segment_offset, entry_point_idx =3D 0, pos =3D 0, offset =3D =
0;
> +	int row, col, i, s, to;
> +	int slice_flag, size, new_offset;
> +	int tile_id, last_tile_id;
> +	u16 log2_min_cb_size, width, height;
> +	u32 max_cu_width, pic_in_ctbs_width, pic_in_ctbs_height;
> +	u32 pic_in_ctbs_size, num_cols, last_tile_block =3D 0;
> +	struct sl_ctx last =3D {
> +		.q1_col =3D -1,
> +		.q1_row =3D -1,
> +	};
> +
> +	width =3D sps->pic_width_in_luma_samples;
> +	height =3D sps->pic_height_in_luma_samples;
> +
> +	tiles_enabled =3D !!(pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED);
> +
> +	log2_min_cb_size =3D sps->log2_min_luma_coding_block_size_minus3 + 3;
> +
> +	num_cols =3D pps->num_tile_columns_minus1 + 1;
> +
> +	max_cu_width =3D 1 << (sps->log2_diff_max_min_luma_coding_block_size +
> +			     log2_min_cb_size);
> +	pic_in_ctbs_width =3D (width + max_cu_width - 1) / max_cu_width;
> +	pic_in_ctbs_height =3D (height + max_cu_width - 1) / max_cu_width;
> +	pic_in_ctbs_size =3D pic_in_ctbs_width * pic_in_ctbs_height;
> +
> +	for (s =3D 0; s < run->num_slices; s++) {
> +		sl =3D &(*run->sl)[s];
> +		slice_segment_offset =3D 0;
> +
> +		/* entry_points are not needed for WPP */
> +		to =3D tiles_enabled ? sl->num_entry_point_offsets + 1 : 1;
> +
> +		for (i =3D 0; i < to; i++) {
> +			first_segment =3D i =3D=3D 0;
> +			first_slice =3D s =3D=3D 0;
> +
> +			if (tiles_enabled && to > 1) {
> +				if (i < sl->num_entry_point_offsets) {
> +					size =3D (*run->entry_point_offsets)
> +						       [entry_point_idx++];

[Severity: High]
Is it safe to locklessly dereference the V4L2 dynamic array pointer here?

In avd_hevc_run_preamble(), the pointer to the dynamic array control is cac=
hed
without acquiring the V4L2 state lock:

	run->entry_point_offsets =3D ctrl ? (const u32 **)&ctrl->p_cur.p : NULL;
	...
	run->sl =3D ctrl ?
		(const struct v4l2_ctrl_hevc_slice_params **)&ctrl->p_cur.p
		: NULL;

If a concurrent VIDIOC_S_EXT_CTRLS ioctl reallocates the array to a smaller=
 size
while the decoder is running, *run->entry_point_offsets will point to the n=
ew
smaller array, but the cached bounds will remain large, leading to out-of-b=
ounds=20
heap reads here. Also, dereferencing p_cur.p concurrently while it is being=
 freed=20
could trigger a Use-After-Free.

[Severity: High]
Does this code allow an integer overflow during validation?

In avd_hevc_run_preamble(), the total number of entry points is accumulated
into a signed 32-bit int:

	for (i =3D 0; i < run->num_slices; i++)
		sum +=3D (*run->sl)[i].num_entry_point_offsets;

If userspace provides extremely large num_entry_point_offsets, could this
sum wrap around and exactly match run->num_entry_point_offsets to bypass th=
e=20
validation? If so, entry_point_idx could iterate out-of-bounds and read pas=
t=20
the end of the allocated entry_point_offsets array here.

> +					new_offset =3D size;
> +				} else {
> +					size =3D sl->bit_size / 8 -
> +					       sl->data_byte_offset -
> +					       slice_segment_offset;
> +					new_offset =3D
> +						size + sl->data_byte_offset;
> +				}
> +			} else {
> +				size =3D (sl->bit_size) / 8 -
> +				       sl->data_byte_offset;
> +				new_offset =3D size + sl->data_byte_offset;

[Severity: High]
Can the subtraction here trigger an integer underflow?

Userspace could supply sl->data_byte_offset or entry point offsets such tha=
t=20
they exceed sl->bit_size / 8. This would cause an underflow, resulting in a=
=20
huge integer for 'size'.=20

When set_slice() is called:

	dma_addr_t coded_in =3D
		run->base.coded_in + offset + sl->data_byte_offset;

this uncontrolled size, alongside an unvalidated memory address, is program=
med=20
into the hardware, potentially causing it to perform arbitrary DMA memory r=
eads.

> +			}
> +
> +			if (sl->slice_segment_addr > pic_in_ctbs_size)
> +				return;
> +
> +			tile_id =3D tile_info->tile_ids
> +					  [tile_info->ctb_addr_rs_to_ts
> +						   [sl->slice_segment_addr]];

[Severity: High]
Does this validation allow an off-by-one error?

Because it checks for > rather than >=3D, could sl->slice_segment_addr exac=
tly=20
equal pic_in_ctbs_size, leading to a heap out-of-bounds read of=20
ctb_addr_rs_to_ts? The resulting garbage value might then be used to read=20
tile_ids out-of-bounds.

> +			last_tile_id =3D

[ ... ]

> +static int avd_hevc_compute_tiles(struct avd_ctx *ctx, struct avd_hevc_r=
un *run)
> +{
> +	const struct v4l2_ctrl_hevc_sps *sps =3D run->sps;
> +	const struct v4l2_ctrl_hevc_pps *pps =3D run->pps;
> +	bool tiles_enabled;
> +	struct avd_hevc_tile_info *tile_info =3D &run->tile_info;
> +	u16 log2_min_cb_size, width, height;
> +	u32 max_cu_width, pic_in_ctbs_width, pic_in_ctbs_height,
> +		pic_in_ctbs_size;
> +
> +	width =3D sps->pic_width_in_luma_samples;
> +	height =3D sps->pic_height_in_luma_samples;
> +
> +	log2_min_cb_size =3D sps->log2_min_luma_coding_block_size_minus3 + 3;
> +
> +	max_cu_width =3D 1 << (sps->log2_diff_max_min_luma_coding_block_size +
> +			     log2_min_cb_size);
> +	pic_in_ctbs_width =3D (width + max_cu_width - 1) / max_cu_width;

[Severity: High]
Does this code permit an unbounded bit shift?

Userspace provides sps->log2_diff_max_min_luma_coding_block_size and=20
sps->log2_min_luma_coding_block_size_minus3 without bounds checking. If the=
ir
sum exceeds 31, the shift will result in undefined behavior. This could yie=
ld 0,
triggering a zero division on the very next line.

Alternatively, if it evaluates to a huge value (like 1 << 30), could this=20
overflow the 32-bit math during scratch allocations in avd_hevc_alloc_scrat=
ch()=20
like so:

	ret =3D avd_buf_alloc(avd, &hevc_ctx->bufs.ip_above,
			    ((max_col * max_cu_width) / 4) * bit_depth);

causing it to wrap around to a dangerously small size, leading to hardware
memory corruption?

> +	pic_in_ctbs_height =3D (height + max_cu_width - 1) / max_cu_width;
> +	pic_in_ctbs_size =3D pic_in_ctbs_height * pic_in_ctbs_width;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-avd-v2-0-e=
cebe6a3648e@icloud.com?part=3D9
