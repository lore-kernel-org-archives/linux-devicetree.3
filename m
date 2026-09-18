Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF9D4E2F1A
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738973; cv=none; b=WwmyTK6fhYY3wVcL3VxvTWxGTUAyNu8SD2TOBlzLa9O+C27kd3Oxrc5MVDjvFi2LsmP30ibTu351ldylNW9AzZw3IyBBGvgTxT7ZtYLtx46s64hjAQlAgKD7JDscfWF5XdsrGNq5AUovCA+w6frnryQHbPt8L/8EI7tnjRmKFRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738973; c=relaxed/simple;
	bh=PfA0+ytaAyN2msT+XNvqi0piPY6NOyYWggn4PlM6TBA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o5VhNLBheU74xsZTO78kaLqSOFuTYBtgJiwEcn6JCGTbiaftUgr6vnzG7wu9SMCjhp0W0P+OHt4zivh0qJYGVXIj/hzb1ZT6Ka6QOMm7OAVDmYPsyadeZqLD2bejvm3E3dXqhB9QBEYdsxc3a7IWQmgdFt6OSNBGxfrY9vgTUfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuOHCybt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QuOHCybt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFAE61F00898;
	Fri, 18 Sep 2026 13:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789738966;
	bh=2F1jq0EoTQ31D6xabyjkv+oJp/ef0zwy5l9FDIy7TLg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QuOHCybtxWG0GxNSF0wpLt0H6aS+O9VpU0TMSlhS6RTgnwITjiVCfqTIIRTUyGyV+
	 oL0kCduY/yKVmkKi6XkFommr59ZtwblrISR3Cygh5ETzySQyQ8PjJH4+iHg+ACmhMO
	 LWkR2m2Dxa7JCcM05EetXOMdva910pTmabzlcwm/vzzaUFpuGmxBXZhC/y2fwATJsO
	 Sb2O116Wk53Ojm3uxizuJ/6obHaMUPJtECKl3i3Tf/THVB6cvv6QmxCUsLVu0xa6AV
	 p0AcUhSw/bj+wHvpr4kuZnnbrE046D1Dgd4wDfGJW8pYogn+p9pMFEGv6JuzfJVpl3
	 WtsdTIfo42/qQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/14] media: apple: avd: add vp9 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260918-avd-v1-12-49977931f455@icloud.com>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
 <20260918-avd-v1-12-49977931f455@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 13:42:45 +0000
Message-Id: <20260918134245.CFAE61F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [Critical] media: avd: vp9: heap buffer overflow via unvalidated tile_row=
s_log2
- [High] media: avd: vp9: integer underflow in set_tiles payload size calcu=
lation
- [High] media: avd: vp9: out-of-bounds read in avd_vp9_done due to wrong s=
izeof
- [High] media: avd: vp9: missing arithmetic carry in 64-bit DMA address ca=
lculation
- [High] media: avd: vp9: submit_num integer overflow causes missing submis=
sions
- [High] media: avd: vp9: DMA buffer overflow due to missing tile_cols_log2=
 limit
- [High] media: avd: vp9: TOCTOU race via lockless v4l2_ctrl_vp9_frame acce=
ss
- [Medium] media: avd: vp9: memory leak on error paths in avd_vp9_alloc_bufs
--

commit 949a9d5ecad27ff345d8f7547131d2a836e7879d
Author: Sofus Forstreuter <sofus.c@icloud.com>

media: apple: avd: add vp9 support

This commit adds hardware video decoding support for VP9 on Apple Silicon
devices via the Apple Video Decoder (AVD). It implements VP9-specific V4L2
controls and formats, along with state management and hardware command
submission.

> diff --git a/drivers/media/platform/apple/avd/avd-vp9.c b/drivers/media/p=
latform/apple/avd/avd-vp9.c
> new file mode 100644
> index 0000000000000..76599a1a39811
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-vp9.c
> @@ -0,0 +1,1072 @@
[ ... ]
> +struct avd_vp9_ctx {
> +	struct v4l2_vp9_frame_symbol_counts cnts;
> +	struct v4l2_vp9_frame_context probability_tables;
> +	struct v4l2_vp9_frame_context frame_context[4];
> +	struct avd_vp9_bufs {
[ ... ]
> +		struct avd_buf probs;
> +	} bufs;
> +	struct avd_vp9_frame_info cur;
> +	struct avd_vp9_frame_info last;
> +	u8 submit_num;

[Severity: High]
Since submit_num in struct avd_vp9_ctx is an 8-bit integer, will it overflow
if a frame contains up to 4096 tiles (e.g. 64 rows * 64 columns)?

> +};
[ ... ]
> +static void set_tiles(struct avd_ctx *ctx, struct avd_vp9_run *run)
> +{
> +	const struct v4l2_ctrl_vp9_frame *frame =3D run->decode_params;
> +	struct avd_vp9_ctx *vp9_ctx =3D ctx->priv;
> +	struct vb2_v4l2_buffer *src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	const u8 *data =3D vb2_plane_vaddr(&src->vb2_buf, 0);
> +
> +	u32 offset =3D
> +		frame->uncompressed_header_size + frame->compressed_header_size;
> +	u32 size =3D vb2_get_plane_payload(&src->vb2_buf, 0) - offset;

[Severity: High]
If offset is larger than the actual buffer payload, could size underflow
and become a very large 32-bit integer?

This would bypass the bounds check below:

	if (tile_size > size - 4)
		return;

and allow out-of-bounds kernel memory reads when reading the tile size.

> +	u32 num_tile_rows =3D 1 << frame->tile_rows_log2;
> +	u32 num_tile_cols =3D 1 << frame->tile_cols_log2;
> +	u32 tile_size;
[ ... ]
> +			if (row =3D=3D num_tile_rows - 1 &&
> +			    col =3D=3D num_tile_cols - 1) {
> +				tile_size =3D size;
> +			} else {
> +				tile_size =3D get_unaligned_be32(&data[offset]);
> +				/* i have crashed my computer because of this */
> +				if (tile_size > size - 4)
> +					return;
> +				offset +=3D 4;
> +				size -=3D 4;
> +			}
> +			push(AVD_OP_CODED_DATA |
> +				     AVD_OP_CODED_DATA_ADDR(
> +					     run->base.coded_in >> 32),
> +			     "cm3_cmd_set_slice_data");
> +			push((u32)((run->base.coded_in + offset) & 0xffffffff),
> +			     "til_ab4_tile_addr_low");

[Severity: High]
Does this DMA address calculation drop the arithmetic carry?=20

The upper 32 bits use run->base.coded_in >> 32, but the lower 32 bits are
(run->base.coded_in + offset) & 0xffffffff.

If adding offset causes the lower 32 bits to wrap, the hardware will receive
an incorrect 64-bit address for DMA reads.

> +			push(tile_size, "til_ab8_tile_size");
[ ... ]
> +static int avd_vp9_alloc_bufs(struct avd_ctx *ctx)
> +{
> +	struct avd_dev *avd =3D ctx->dev;
> +	struct avd_vp9_ctx *vp9_ctx =3D ctx->priv;
> +	int ret, w, h, bit_depth;
> +
> +	w =3D fmt_width(ctx);
> +	h =3D fmt_height(ctx);
> +	bit_depth =3D (ctx->image_fmt =3D=3D AVD_IMG_FMT_420_10BIT ||
> +		     ctx->image_fmt =3D=3D AVD_IMG_FMT_422_10BIT) ?
> +			    10 :
> +			    8;
> +
> +	ret =3D avd_buf_alloc(avd, &vp9_ctx->bufs.probs,
> +			    sizeof(struct avd_vp9_probs));
> +	if (ret)
> +		return ret;

[Severity: Medium]
If any allocation fails here and returns early, doesn't this leak the alrea=
dy
allocated DMA buffers?

The error path in avd_vp9_start() only frees vp9_ctx without calling
avd_buf_free() on the successful allocations.

[ ... ]
> +	ret =3D avd_buf_alloc(avd, &vp9_ctx->bufs.ip_above,
> +			    DIV_ROUND_UP(w, 16) * 4 * bit_depth +
> +				    (VP9_MAX_TILE_COLS - 1) * 128);

[Severity: High]
Since ip_above is sized based on VP9_MAX_TILE_COLS (which is hardcoded to 1=
6),
what happens if userspace requests a frame with up to 64 tile columns?=20

Without bounds checking on tile_cols_log2 in validate_dec_params(), the
hardware could overwrite past the end of this DMA buffer.

> +	if (ret)
> +		return ret;
[ ... ]
> +static int validate_dec_params(struct avd_ctx *ctx,
> +			       const struct v4l2_ctrl_vp9_frame *dec_params)
> +{
> +	unsigned int aligned_width, aligned_height;
> +
> +	if (dec_params->bit_depth > 10)
> +		/* not implemented */
> +		return -EINVAL;
> +
> +	if (dec_params->profile =3D=3D 1 || dec_params->profile > 2)
> +		return -EINVAL;
> +
> +	if (dec_params->frame_height_minus_1 + 1 < 64 ||
> +	    dec_params->frame_width_minus_1 + 1 < 64)
> +		return -EINVAL;

[Severity: High]
Should there be a check here to ensure dec_params->tile_cols_log2 <=3D 4 to
prevent the hardware from exceeding the statically sized buffers based on
VP9_MAX_TILE_COLS?

[ ... ]
> +static int avd_vp9_run_preamble(struct avd_ctx *ctx, struct avd_vp9_run =
*run)
> +{
> +	struct v4l2_ctrl *ctrl;
> +	const struct v4l2_ctrl_vp9_frame *dec_params;
> +	struct avd_vp9_ctx *vp9_ctx =3D ctx->priv;
> +	unsigned int fctx_idx;
> +	int ret;
> +
> +	avd_run_preamble(ctx, &run->base);
> +
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			      V4L2_CID_STATELESS_VP9_COMPRESSED_HDR);
> +	if (WARN_ON(!ctrl))
> +		return -EINVAL;
> +	run->prob_updates =3D ctrl->p_cur.p;
> +
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl, V4L2_CID_STATELESS_VP9_FRAME);
> +	if (WARN_ON(!ctrl))
> +		return -EINVAL;
> +	dec_params =3D ctrl->p_cur.p;
> +
> +	ret =3D validate_dec_params(ctx, dec_params);
> +	if (ret)
> +		return ret;
> +
> +	run->decode_params =3D dec_params;

[Severity: High]
Is it safe to read ctrl->p_cur.p locklessly without v4l2_ctrl_lock()?=20

A concurrent VIDIOC_S_EXT_CTRLS ioctl could potentially modify dec_params
fields (like tile_cols_log2) after they pass validate_dec_params(), resulti=
ng
in a Time-of-Check to Time-of-Use race condition.

> +
> +	vp9_ctx->cur.tx_mode =3D run->prob_updates->tx_mode;
[ ... ]
> +static int avd_vp9_run(struct avd_ctx *ctx)
> +{
> +	struct avd_vp9_run run;
> +	struct avd_vp9_ctx *vp9_ctx;
> +	struct avd_decoded_buffer *dst;
> +	int ret;
> +
> +	ret =3D avd_vp9_run_preamble(ctx, &run);
> +	if (ret) {
> +		avd_run_postamble(ctx, &run.base);
> +		return ret;
> +	}
> +
> +	ret =3D avd_init_job(
> +		ctx, AVD_CODEC_VP9,
> +		(1 << run.decode_params->tile_rows_log2) *
> +				(1 << run.decode_params->tile_cols_log2) +
> +			1);

[Severity: Critical]
Can this multiplication overflow a signed 32-bit integer?=20

Because tile_rows_log2 and tile_cols_log2 are an unvalidated u8, setting th=
em
to large values (e.g. 255) could cause the multiplication to wrap around to=
 0,
leaving avd_init_job() to allocate a drastically undersized buffer.

Then, during the loop in set_tiles():

	for (int row =3D 0; row < num_tile_rows; row++)
		for (int col =3D 0; col < num_tile_cols; col++) {
			ctx->job.num++;

The iteration count would far exceed the allocation, and push() would write
out-of-bounds on the heap.

> +	if (ret)
> +		return ret;
[ ... ]
> +static void avd_vp9_done(struct avd_ctx *ctx, struct vb2_v4l2_buffer *sr=
c_buf,
> +			 struct vb2_v4l2_buffer *dst_buf,
> +			 enum vb2_buffer_state result)
> +{
[ ... ]
> +			cnts =3D vp9_ctx->bufs.counts.cpu;
> +
> +			for (i =3D 0; i < ARRAY_SIZE(cnts->tx16p); ++i)
> +				memcpy(tx16p[i], cnts->tx16p[i],
> +				       sizeof(tx16p[0]));

[Severity: High]
Does this read out of bounds?=20

tx16p is u32[2][4], so sizeof(tx16p[0]) is 16 bytes. But the source array
cnts->tx16p[i] in struct avd_vp9_frame_symbol_counts is sized u32[3] (12
bytes), meaning this will over-read the source buffer.

> +
> +			for (i =3D 0; i < 2; i++) {
[ ... ]
> +static void avd_vp9_submit(struct avd_ctx *ctx)
> +{
> +	struct avd_vp9_ctx *vp9_ctx =3D ctx->priv;
> +	struct avd_dev *avd =3D ctx->dev;
> +	u32 submit_mask =3D ctx->dev->variant->revision =3D=3D 3 ?
> +				  AVD_OP_EXEC_REV3_VP9_MASK :
> +				  0;
> +
> +	writel(AVD_OP_EXEC | submit_mask |
> +		       AVD_OP_EXEC_FLAG_START_REV4(avd->variant->revision =3D=3D
> +						   4) |
> +		       AVD_OP_EXEC_FLAG_START_REV3(avd->variant->revision =3D=3D
> +						   3) |
> +		       AVD_OP_EXEC_FIFO_IDX(ctx->fifo_idx) |
> +		       AVD_OP_EXEC_FIFO_MASK(avd->variant->fifo_slots),
> +	       avd->ctrl + avd->variant->submit_offset);
> +	for (int i =3D 0; i < vp9_ctx->submit_num - 1; i++)

[Severity: High]
If submit_num wrapped to 0 due to an overflow from a large number of tiles,
would 0 - 1 promote to a signed -1 (int), causing the i < -1 loop to never
execute and dropping the necessary hardware submissions?

> +		writel(AVD_OP_EXEC | submit_mask |
> +			       AVD_OP_EXEC_FIFO_IDX(ctx->fifo_idx) |
> +			       AVD_OP_EXEC_FIFO_MASK(avd->variant->fifo_slots),
> +		       avd->ctrl + avd->variant->submit_offset);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-avd-v1-0-4=
9977931f455@icloud.com?part=3D12
