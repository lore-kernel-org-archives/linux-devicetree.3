Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496432;
	b=THfQdmwJHH28+mFq384Ql9MzGewpEilzXPHVMZD9gAq4yaZAW2LPS7p66905VyvrVGUi
	 VryaVVj5drT2x/MN74sMh12xmi5A52Zn9/lDxwRvdfxBq1bbA8pE8Zujwlk9+CsJ/FUYm
	 yzbVyU+jR37HrrfooExY6r2pBxv7C3PSGPPcQDdgxoJnywSeIn/T69mHlrtO7DnoFRWWK
	 u8h9KHee5bAUFB9AxMa/Lc61RYO80tjSjpX8lI8psobwn4kmvRLGvO00pczh4XNVCHFDv
	 8T2lqv9usM/AG6Ji25XhJ6jG8/3CKWD+sBKmUtEfjr3RIDF+Fx9wa7Z+VNAZXQqVAfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496432;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TxynAdD6p0I+odTTtrDzfFXaWprv6f6Y40oWNeG36a4=;
	b=BYet8BvA+zdakxoak+8PSsHaLaJCf8XxizUDvM+9677t/uXC4V3Gjj4XO7ZwF+SqRy9x
	 g47qhDVTPtj0VZU9eGaLwyjD3qnLuDVOtLMx0vhbjsD5jA9ObqANigKeeCipAcHJ+952y
	 /tZZv3WwPDNOrBVsq5OS7qYYaW/CkDcW6ZOYpDisvwM9NUl0J1al+6OuqS7pnuwErPexo
	 mZ70u60y/kP+1f81rpfLME2wqO4oC/PC+vznSxH3H/3rUt1TON3UEWPu+6cmkiihl68fz
	 5Pb6i+gDUm6ZC29OGz1Mb3M6FaPz4Rdt7lNC5mPA0VHCFiU0VomTng/eOcrNYdZhnWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EhPOiV3o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61E2606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 11:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EhPOiV3o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CA51F000C4;
	Tue, 20 Oct 2026 11:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792496431;
	bh=TxynAdD6p0I+odTTtrDzfFXaWprv6f6Y40oWNeG36a4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EhPOiV3osHnFb0jvT9aBUOhvn4xvbTVweiqA2v6NmW2J5Ak8/CgXCSQnXdEjS4In1
	 ZeU5wUOSKxB34etUbSckcIj0ciNvjbHoJvMNwsUdQ9iC67hbOoah4j764Al+Y5InLU
	 YZdSgRFvHlKjX3rxv9PbB050caqlPBNwvS0SiAOPZgpxkN4DcbWB8kp87O7lloxvsh
	 WdAHvcn9ihoyrtfQG4asFeAubIH7S+ENF4EyrH3c8hanoMCZM+nyInW7Hs5Or7aDiU
	 DVx6UjqMQmH9d54rLiZnkrolibnES1NJG+p5/dmJEWshRi27NKChpPwwK8ytWZtWab
	 DiiDFr0h6DChA==
Message-ID: <sashiko-outbox-178901@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/17] media: apple: avd: add hevc support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261020-avd-v3-9-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
 <20261020-avd-v3-9-85cbaa2125d8@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 11:40:30 +0000
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
- [Critical] media: apple: avd: OOB read of PPS tile arrays in compute_tile=
s_non_uniform()
- [Critical] media: apple: avd: tile size sum underflow in compute_tiles_no=
n_uniform()
- [Critical] media: apple: avd: entry_point_offsets sum overflow in avd_hev=
c_run_preamble()
- [High] media: apple: avd: wrong plane length field in stream_slice_mv()
- [High] media: apple: avd: OOB stack read of row_bd in submit_slice_segmen=
t()
- [High] media: apple: avd: missing SPS block size and dimension validation
--

commit 9e1098e858acf03c63d37b3cb57614f4681a182e
Author: Sofus Forstreuter <sofus.c@icloud.com>

media: apple: avd: add hevc support

This patch adds stateless V4L2 HEVC decoding support to the Apple Video
Decoder (AVD) driver.

> diff --git a/drivers/media/platform/apple/avd/avd-hevc.c b/drivers/media/=
platform/apple/avd/avd-hevc.c
> new file mode 100644
> index 0000000000000..36ae24c640a10
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-hevc.c

[ ... ]

> +#define HEVC_SCL_DIMS	0x127ffff
> +
> +/* this is for level 7.1 */
> +#define HEVC_MAX_TILE_COLS	40
> +#define HEVC_MAX_TILE_ROWS	44

[ ... ]

> +static void stream_slice_mv(struct avd_ctx *ctx, struct avd_hevc_run *ru=
n,
> +			    const struct v4l2_ctrl_hevc_slice_params *sl,
> +			    bool is_first)
> +{

[ ... ]

> +	if (ref_valid) {
> +		dma_addr_t mv_color_addr =3D
> +			vb2_dma_contig_plane_dma_addr(&ref->base.vb.vb2_buf,
> +						      0) +
> +			(ref->base.vb.planes[0].length -
> +			 mv_color_size(fmt_width(ctx), fmt_height(ctx)));
> +		pusha(mv_color_addr, "mv_colo", 0);
> +	}
> +}

[Severity: High]
Should stream_slice_mv() use ref->base.vb.vb2_buf.planes[0].length instead
of ref->base.vb.planes[0].length here?

In avd_hevc_run_preamble(), the destination buffer's mv_color address is
computed from vb2_buf.planes[0].length:

	dst_len =3D run->base.bufs.dst->vb2_buf.planes[0].length;
	mv_color_len =3D mv_color_size(fmt_width(ctx), fmt_height(ctx));
	run->addresses.mv_color =3D run->base.y_out + (dst_len - mv_color_len);

When capture buffers are queued using VB2_MEMORY_DMABUF with
v4l2_plane.length set to 0, __prepare_dmabuf() in videobuf2-core.c sets
vb2_buf.planes[0].length =3D dbuf->size, while leaving
vb2_v4l2_buffer.planes[0].length as 0.

When decoding a P or B slice with
V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_TEMPORAL_MVP_ENABLED and a non-intra
collocated reference frame, subtracting mv_color_size() from
ref->base.vb.planes[0].length (0) underflows the 32-bit unsigned value and
programs the hardware with an out-of-bounds DMA address.

Also, in set_slice(), coded_in and size are computed from sl->bit_size,
sl->data_byte_offset, and entry_point_offsets without bounds checking
against the source buffer plane size.

> +
> +static void set_slice(struct avd_ctx *ctx, struct avd_hevc_run *run,
> +		      const struct v4l2_ctrl_hevc_slice_params *sl, u32 size,
> +		      u32 offset, u32 flags)
> +{
> +	dma_addr_t coded_in =3D
> +		run->base.coded_in + offset + sl->data_byte_offset;
> +	push(AVD_OP_CODED_DATA | flags | AVD_OP_CODED_IN_HI(coded_in),
> +	     "cm3_cmd_set_coded_slice");
> +	push(AVD_OP_CODED_IN_LO(coded_in), "slc_bd8_slice_addr");
> +	push(size, "slc_bdc_slice_size");
> +}
> +
> +static int submit_slice_segment(struct avd_ctx *ctx, struct avd_hevc_run=
 *run,
> +				const struct v4l2_ctrl_hevc_slice_params *sl,
> +				int row, int col, u32 col_bd[23],
> +				u32 row_bd[23], u32 pic_in_cts_width,
> +				u32 pic_in_cts_height, bool first_slice,
> +				bool hflip, bool vflip, u32 coded_flags,
> +				u32 last_tile_block)
> +{

[ ... ]

> +	} else {
> +		tile_boundary =3D AVD_OP_SL_LOC_Y(row_bd[row]) |
> +				AVD_OP_SL_LOC_X(col_bd[col]);
> +	}
> +
> +	if (coded_flags & NEW_TILE_ID) {
> +		push(AVD_OP_SL_DIM_START |
> +			     (coded_flags & NEW_SLICE ? tile_block :
> +							tile_boundary),
> +		     "cm3_cmd_set_ctb_xy");
> +
> +		/* tile boundary end */
> +		if (pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED)
> +			push(AVD_SL_DIM_END_ROW((hflip ? 4 : 0) |
> +						(vflip ? 8 : 0)) |
> +				     AVD_SL_DIM_END_COL(col) |
> +				     AVD_SL_DIM_END_Y(row_bd[row + 1] - 1) |
> +				     AVD_SL_DIM_END_X(col_bd[col + 1] - 1),
> +			     "cm3_set_ctb_xy");

[Severity: High]
Can submit_slice_segment() read past the end of row_bd[] on the stack?

In stream_slices(), pos is incremented for every segment where
(slice_flag & NEW_TILE_ID) is set, and row is computed as:

	row =3D pos / num_cols;
	col =3D pos % num_cols;

Across up to 1800 slices and 1760 entry point offsets, pos can reach up to
3560 while num_cols (pps->num_tile_columns_minus1 + 1) can be 1. Because
row is not checked against pps->num_tile_rows_minus1 or HEVC_MAX_TILE_ROWS,
submit_slice_segment() can index row_bd[row] and row_bd[row + 1] past the
end of run.tile_info.row_bd[HEVC_MAX_TILE_ROWS + 1].

Note also that submit_slice_segment() declares u32 col_bd[23] and
u32 row_bd[23], which do not match HEVC_MAX_TILE_COLS + 1 and
HEVC_MAX_TILE_ROWS + 1.

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
> +
> +	sum =3D 0;
> +	for (i =3D 0; i < pps->num_tile_rows_minus1; i++) {
> +		row_height[i] =3D MIN(pps->row_height_minus1[i] + 1,
> +				    pic_in_cts_height);
> +		sum +=3D row_height[i];
> +	}
> +	row_height[i] =3D pic_in_cts_height - sum;
> +}

[Severity: Critical]
Can compute_tiles_non_uniform() read out of bounds from
pps->column_width_minus1[] and pps->row_height_minus1[]?

In include/uapi/linux/v4l2-controls.h, struct v4l2_ctrl_hevc_pps defines:

	__u8 column_width_minus1[20];
	__u8 row_height_minus1[22];

However, HEVC_MAX_TILE_COLS is 40 and HEVC_MAX_TILE_ROWS is 44, so
avd_hevc_validate_pps() allows pps->num_tile_columns_minus1 up to 39 and
pps->num_tile_rows_minus1 up to 43. When V4L2_HEVC_PPS_FLAG_TILES_ENABLED
is set without V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING, these loops read
pps->column_width_minus1[i] up to index 38 and pps->row_height_minus1[i]
up to index 42, reading past both arrays and the end of struct
v4l2_ctrl_hevc_pps.

[Severity: Critical]
In addition, what happens in compute_tiles_non_uniform() if the cumulative
sum of column widths or row heights exceeds pic_in_cts_width or
pic_in_cts_height?

Clamping each individual column or row with MIN() does not prevent sum from
exceeding pic_in_cts_width or pic_in_cts_height across multiple columns or
rows. When sum > pic_in_cts_width (or sum > pic_in_cts_height), the final
assignment:

	column_width[i] =3D pic_in_cts_width - sum;
	...
	row_height[i] =3D pic_in_cts_height - sum;

underflows in u16 to a large value (up to 65535). compute_bd() then
computes col_bd and row_bd boundaries exceeding pic_in_ctbs_width and
pic_in_ctbs_height, causing compute_tile_ids() to read
ctb_addr_rs_to_ts[y * pic_in_ctbs_width + x] and write tile_ids[...] out of
bounds on the heap:

> +static void compute_tile_ids(struct avd_hevc_run *run, u32 pic_in_ctbs_w=
idth,
> +			     u32 *col_bd, u32 *row_bd, u32 *ctb_addr_rs_to_ts,
> +			     u32 *tile_ids)
> +{
> +	const struct v4l2_ctrl_hevc_pps *pps =3D run->pps;
> +	int j, i, y, x;
> +	u32 tile_idx;
> +
> +	for (j =3D 0, tile_idx =3D 0; j <=3D pps->num_tile_rows_minus1; j++)
> +		for (i =3D 0; i <=3D pps->num_tile_columns_minus1; i++, tile_idx++)
> +			for (y =3D row_bd[j]; y < row_bd[j + 1]; y++)
> +				for (x =3D col_bd[i]; x < col_bd[i + 1]; x++)
> +					tile_ids[ctb_addr_rs_to_ts
> +							 [y * pic_in_ctbs_width +
> +							  x]] =3D tile_idx;
> +}

[ ... ]

> +static int avd_hevc_validate_sps(struct avd_ctx *ctx,
> +				 const struct v4l2_ctrl_hevc_sps *sps)
> +{
> +	if (sps->pic_width_in_luma_samples > ctx->coded_fmt.fmt.pix_mp.width ||
> +	    sps->pic_height_in_luma_samples > ctx->coded_fmt.fmt.pix_mp.height)
> +		return -EINVAL;
> +
> +	if (sps->bit_depth_chroma_minus8 !=3D sps->bit_depth_luma_minus8)
> +		return -EINVAL;
> +
> +	if (sps->bit_depth_luma_minus8 > 2)
> +		/* not implemented */
> +		return -EINVAL;
> +
> +	return 0;
> +}

[Severity: High]
Does avd_hevc_validate_sps() also need to validate that picture dimensions
are non-zero and bound log2_min_luma_coding_block_size_minus3 and
log2_diff_max_min_luma_coding_block_size?

In avd_hevc_run(), avd_hevc_compute_tiles() runs before
avd_hevc_alloc_scratch() (where the !max_cu_width check is located) and
executes:

	log2_min_cb_size =3D sps->log2_min_luma_coding_block_size_minus3 + 3;

	max_cu_width =3D 1 << (sps->log2_diff_max_min_luma_coding_block_size +
			     log2_min_cb_size);
	pic_in_ctbs_width =3D (width + max_cu_width - 1) / max_cu_width;
	pic_in_ctbs_height =3D (height + max_cu_width - 1) / max_cu_width;
	pic_in_ctbs_size =3D pic_in_ctbs_height * pic_in_ctbs_width;

If the shift exponent is >=3D 31, 1 << ... triggers signed 32-bit shift
undefined behavior; if it is >=3D 32 (or wraps to 0), dividing by max_cu_wi=
dth
divides by zero, and if it is 31, max_cu_width is 0x80000000, making
pic_in_ctbs_width =3D 0 and causing division by zero in compute_rs_to_ts() =
or
submit_slice_segment(), as well as 32-bit overflow in
((max_col * max_cu_width) / 4) * bit_depth in avd_hevc_alloc_scratch().

Similarly, if width or height is 0 (for example, if streaming starts before
setting V4L2_CID_STATELESS_HEVC_SPS), pic_in_ctbs_size is 0 and
kzalloc_objs() returns ZERO_SIZE_PTR, which is then dereferenced. Also,
because avd_hevc_validate_sps() is only called from avd_hevc_try_ctrl(),
decreasing the coded format dimensions via VIDIOC_S_FMT after setting the
SPS control leaves stale SPS dimensions larger than the format.

> +
> +static int avd_hevc_validate_pps(struct avd_ctx *ctx,
> +				 const struct v4l2_ctrl_hevc_pps *pps)
> +{
> +	if (pps->num_tile_columns_minus1 + 1 > HEVC_MAX_TILE_COLS ||
> +	    pps->num_tile_rows_minus1 + 1 > HEVC_MAX_TILE_ROWS)
> +		return -EINVAL;
> +
> +	return 0;
> +}

[ ... ]

> +static int avd_hevc_run_preamble(struct avd_ctx *ctx, struct avd_hevc_ru=
n *run)
> +{

[ ... ]

> +	for (i =3D 0; i < run->num_slices; i++)
> +		sum +=3D (*run->sl)[i].num_entry_point_offsets;
> +
> +	if (sum && sum !=3D run->num_entry_point_offsets)
> +		return -EINVAL;

[Severity: Critical]
Can sum overflow when accumulating (*run->sl)[i].num_entry_point_offsets in
avd_hevc_run_preamble()?

(*run->sl)[i].num_entry_point_offsets is an unvalidated __u32 accumulated
into a 32-bit signed int sum. If two or more slices have
num_entry_point_offsets values whose 32-bit sum wraps to 0 or to
run->num_entry_point_offsets, this check passes while avd_init_job() only
allocates run.num_slices + run.num_entry_point_offsets + 1 segments.

In stream_slices():

	to =3D tiles_enabled ? sl->num_entry_point_offsets + 1 : 1;

	for (i =3D 0; i < to; i++) {
		...
		if (tiles_enabled && to > 1) {
			if (i < sl->num_entry_point_offsets) {
				size =3D (*run->entry_point_offsets)
					       [entry_point_idx++];

When tiles_enabled is true, this loop can then read
(*run->entry_point_offsets)[entry_point_idx++] out of bounds on the heap
and write past the end of ctx->job.segments via push() and
avd_end_segment(). Moreover, if sl->num_entry_point_offsets >=3D 0x7fffffff,
int to =3D sl->num_entry_point_offsets + 1 overflows to <=3D 0, skipping the
inner loop and its sl->slice_segment_addr >=3D pic_in_ctbs_size check for
slice s, so slice s + 1 indexes
tile_info->ctb_addr_rs_to_ts[(*run->sl)[s].slice_segment_addr] out of
bounds.

> +
> +	dst_len =3D run->base.bufs.dst->vb2_buf.planes[0].length;
> +
> +	mv_color_len =3D mv_color_size(fmt_width(ctx), fmt_height(ctx));
> +
> +	run->addresses.mv_color =3D run->base.y_out + (dst_len - mv_color_len);
> +	return 0;
> +}

[ ... ]

> +static int avd_hevc_run(struct avd_ctx *ctx)
> +{
> +	struct avd_hevc_run run =3D {};
> +	struct avd_decoded_buffer *dst;
> +	int ret;
> +
> +	ret =3D avd_hevc_run_preamble(ctx, &run);
> +	if (ret)
> +		goto postamble;
> +
> +	dst =3D vb2_to_avd_decoded_buf(&run.base.bufs.dst->vb2_buf);
> +	update_dec_buf_info(dst, &(*run.sl)[0]);
> +
> +	ret =3D avd_hevc_compute_tiles(ctx, &run);
> +	if (ret)
> +		goto done;
> +
> +	ret =3D avd_hevc_alloc_scratch(ctx, &run);
> +	if (ret)
> +		goto done;
> +
> +	ret =3D avd_init_job(ctx, AVD_CODEC_HEVC,
> +			   run.num_slices + run.num_entry_point_offsets + 1);
> +	if (ret)
> +		goto done;

[ ... ]

> +	return ret;
> +}

[ ... ]

> diff --git a/drivers/media/platform/apple/avd/avd-v4l2.c b/drivers/media/=
platform/apple/avd/avd-v4l2.c
> index 0f83a17f16fae..34db42e008332 100644
> --- a/drivers/media/platform/apple/avd/avd-v4l2.c
> +++ b/drivers/media/platform/apple/avd/avd-v4l2.c

[ ... ]

> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS,
> +		.cfg.flags =3D V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
> +		.cfg.dims =3D { 1760 },
> +		.cfg.max =3D 0xffffffff,
> +		.cfg.step =3D 1,
> +	},

[ ... ]

> diff --git a/drivers/media/platform/apple/avd/avd.h b/drivers/media/platf=
orm/apple/avd/avd.h
> index bd6177ab1eb25..828d25f85902e 100644
> --- a/drivers/media/platform/apple/avd/avd.h
> +++ b/drivers/media/platform/apple/avd/avd.h

[ ... ]

> +struct avd_hevc_decoded_buffer_info {
> +	bool is_intra;
> +};

[ ... ]

>  extern const struct v4l2_ctrl_ops avd_ctrl_ops;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-avd-v3-0-8=
5cbaa2125d8@icloud.com?part=3D9
