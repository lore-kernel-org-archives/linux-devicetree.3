Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493715;
	b=g/RD0cmCFnS7nB8mnNUTzWDuD3oVIobdeqUFey7ZDMVMNlBX2X0C2/J+d4WQ4NpvRDJl
	 g3x0wep5zuaJspFjbdSjVjGMRCPsOkdnP3Hkqkd7VfoWiVlSjLufEOUMDv/uJCStMzS3M
	 PAX3aMc7/G5JDbvWVFoKADQTgxCo8uQtHRe3byjTUHbyDXKvt9Ckv95BLbf+XE0Tt58Tq
	 Pznr7fy0nTN2FJyRFnXZhKKNfatHknLmzAM+ocYjLrwnu86Wvd8FJg+sdaoTKUlGPImSe
	 aEXRY1Oo7wtjgLsBI85o74Aa2pztLoRaluoUrG+CRq76A1+Jmv/dOjg58nEc7rQBuwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493715;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZYcPqYxBjzleHYNnLgYXNXDd1At8eciq0G9swdUekqg=;
	b=4/ar/E7poCWlKYgG12l8pluEh/PMdbHTlodb2n3usOZ8sADT+F3jklZ9Vw9Xe3BEhHJj
	 ADDOdJEtXgOQSA9pjLYAhXT/y3yiVmM9gef/X2cYLCCd8QUQ0S2T01C0dWAsx5nBlK3YF
	 u8lxSz+dOOx4vO677ODVAGMy58vzeFtQLTD8bcAoarFAuXtkES1N3/U61VJw0/ygBk6qr
	 rhirsKmPK1hrvmSBFIRp7lmrMtfDomrIQUiWIUOh02TruqnvImnNg58YRP2QKvHTzXvvW
	 cqQlk7Hj7nKo5O5/ZFnyGXp0O/+pyoPK5To+JdlwyzZQ2UDG2jWf5wzU76+4NlnuIAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AbfySAnp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B7C606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AbfySAnp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FBBD1F000C4;
	Tue, 20 Oct 2026 10:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792493714;
	bh=ZYcPqYxBjzleHYNnLgYXNXDd1At8eciq0G9swdUekqg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AbfySAnp1S8gEEqnHwPtbHyyObYPV2zNvqYWAGKSC+ckPDMY4xyKJdWUZWggyutU0
	 pjMAX3UPCslVbev2K3MKl5q10xwrByzlGgqJl4w4eWj0VPBI90x2yt99YvQhm7CE/D
	 /RpSdPqSSHMf1A+ANc93fUE+vokwx5/v6GI237/TJCY702j6HtaxJdwLu1/QEjaegj
	 r1CfXiJJmuuFcAn5aTua5Uny6oWy8j0iihDkLbh8IK1YLjxRjON3dg7+VFVOk4Xs8f
	 rGiWtGJrPl+VzqQW8ckQM0QaoCu7nFXhlCujeQx7UTWqPaW0+Y33p8XfvffXgcvTsv
	 bwS+qaOi3OOhw==
Message-ID: <sashiko-outbox-178863@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/17] media: apple: avd: add h264 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261020-avd-v3-7-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
 <20261020-avd-v3-7-85cbaa2125d8@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 10:55:13 +0000
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
- [Critical] media: apple: avd: out-of-bounds DPB read in stream_slice()
- [Critical] media: apple: avd: segment buffer overread in avd_h264_realloc=
_slices()
- [Critical] media: apple: avd: out-of-bounds slice write in avd_h264_run()
- [High] media: apple: avd: dangling pointers left by avd_h264_stop()
- [High] media: apple: avd: missing SPS dimension and bit-depth checks
- [High] media: apple: avd: zero return on allocation failure in avd_h264_s=
tart()
- [Medium] media: apple: avd: DPB valid vs active mismatch in stream_refs()
- [Medium] media: apple: avd: header_bit_size overflow and silent return in=
 stream_slice()
--

commit 8571614aac70711a51d24aa4b4915d545c41cf5b
Author: Sofus Forstreuter <sofus.c@icloud.com>

media: apple: avd: add h264 support

This commit adds stateless V4L2 H.264 decoding support to the Apple Video
Decoder (AVD) driver.

> diff --git a/drivers/media/platform/apple/avd/avd-h264.c b/drivers/media/=
platform/apple/avd/avd-h264.c
> new file mode 100644
> index 0000000000000..c32b805a94058
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-h264.c
> @@ -0,0 +1,862 @@

[ ... ]

> +static void stream_refs(struct avd_ctx *ctx, struct avd_h264_run *run)
> +{
> +	const struct v4l2_ctrl_h264_decode_params *decode =3D run->decode_param=
s;
> +	const struct v4l2_h264_dpb_entry *dpb =3D decode->dpb;
> +	struct avd_h264_ctx *h264_ctx =3D ctx->priv;
> +	struct avd_decoded_buffer *dst, *ref;
> +	dma_addr_t addr;
> +
> +	dst =3D vb2_to_avd_decoded_buf(&run->base.bufs.dst->vb2_buf);
> +
> +	push(0, "");
> +	pusha(h264_ctx->bufs.mv_above_info.addr, "mv_above_info", 7);
> +	pusha(run->addresses.mv_color, "mv_color", 0);
> +
> +	push(0, "");
> +	push(0, "");
> +	push(0, "");
> +	push(0, "");
> +
> +	for (int i =3D 0; i < ARRAY_SIZE(decode->dpb); i++) {
> +		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_VALID))
> +			continue;
> +
> +		ref =3D avd_get_ref_buf(ctx, &dst->base.vb, dpb[i].reference_ts);
> +
> +		addr =3D vb2_dma_contig_plane_dma_addr(&ref->base.vb.vb2_buf, 0) +
> +		       ref->comp.start_offset;
> +
> +		push(AVD_REF_NUM(run->num_valid - 1) | AVD_REF_FLAG_CONST |
> +			     AVD_REF_FLAG_LONG(
> +				     dpb[i].flags &
> +				     V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) |
> +			     AVD_REF_DELTA_POC(run->cur_poc -
> +					       dpb[i].top_field_order_cnt),
> +		     "hdr_d0_ref_hdr");
> +
> +		push_comp(ctx, addr, ctx->comp.offsets);
> +	}
> +}

[Severity: Medium]
In avd_h264_run(), run.num_valid comes from reflist_builder.num_valid, which
counts DPB entries with V4L2_H264_DPB_ENTRY_FLAG_ACTIVE set (and also builds
h264_ctx->reflists.{p,b0,b1}, which are never read).

Here in stream_refs(), the loop iterates over entries with
V4L2_H264_DPB_ENTRY_FLAG_VALID set while encoding AVD_REF_NUM(run->num_vali=
d -
1). If the DPB holds valid but inactive frames (for example, decoded frames
held for display reordering or during a non-IDR I-frame where num_valid is =
0),
won't the number of pushed reference headers mismatch AVD_REF_NUM and
underflow run->num_valid - 1 when run->num_valid is 0?

[ ... ]

> +static void stream_slice(struct avd_ctx *ctx, struct avd_h264_run *run)
> +{
> +	const struct v4l2_ctrl_h264_decode_params *decode =3D run->decode_param=
s;
> +	const struct v4l2_ctrl_h264_pps *pps =3D run->pps;
> +	const struct v4l2_ctrl_h264_sps *sps =3D run->sps;
> +	const struct v4l2_ctrl_h264_slice_params *sl =3D run->slice_params;
> +	struct avd_h264_ctx *h264_ctx =3D ctx->priv;
> +	u32 payload_len =3D h264_ctx->active_slice->size;
> +	bool en_mode =3D (pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE) =
=3D=3D
> +		       0;
> +	const u8 *data =3D h264_ctx->active_slice->cpu;
> +	u32 min_off =3D (sl->header_bit_size + (en_mode ? 0 : 7)) / 8;
> +	u32 off =3D 2;
> +	u32 num_ref_idx_active, bytes_read =3D 2;
> +	dma_addr_t coded_in, mv_color_addr;
> +	struct avd_decoded_buffer *dst, *ref;
> +
> +	dst =3D vb2_to_avd_decoded_buf(&run->base.bufs.dst->vb2_buf);
> +
> +	if (off > payload_len || payload_len < min_off)
> +		return;

[Severity: Medium]
Can sl->header_bit_size + 7 overflow a 32-bit unsigned integer when
V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE is set and sl->header_bit_size >=3D
0xfffffff9, wrapping min_off to 0?

Also, if stream_slice() returns early here when off > payload_len or
payload_len < min_off, avd_h264_run() still calls avd_end_segment(ctx, fals=
e)
and avd_submit_job(ctx). Should stream_slice() return an error code so
avd_h264_run() can abort instead of submitting an empty slice segment to the
hardware?

[ ... ]

> +	if (sl->slice_type =3D=3D V4L2_H264_SLICE_TYPE_B) {
> +
> +		/* sl->ref_pic_list1[0].index < ARRAY_SIZE(decode->dpb) */
> +		/* bidirectional reference of previous mv */
> +		ref =3D avd_get_ref_buf(
> +			ctx, &dst->base.vb,
> +			decode->dpb[sl->ref_pic_list1[0].index].reference_ts);
> +
> +		mv_color_addr =3D
> +			vb2_dma_contig_plane_dma_addr(&ref->base.vb.vb2_buf,
> +						      0) +
> +			(ref->base.vb.vb2_buf.planes[0].length -
> +			 mv_color_size(fmt_width(ctx), fmt_height(ctx)));
> +
> +		pusha(mv_color_addr, "slc_a78_sps_tile_addr2_lsb8", 0);
> +	}
> +}

[Severity: Critical]
Can sl->ref_pic_list1[0].index read past the end of decode->dpb[] here?

sl->ref_pic_list1[0].index is an unvalidated u8 from
V4L2_CID_STATELESS_H264_SLICE_PARAMS, while decode->dpb only has
V4L2_H264_NUM_DPB_ENTRIES (16) elements. Neither std_validate_compound() nor
avd_h264_try_ctrl() checks that ref_pic_list1[0].index <
ARRAY_SIZE(decode->dpb), so a slice with slice_type =3D=3D V4L2_H264_SLICE_=
TYPE_B
and index >=3D 16 (such as 0xff) will read out-of-bounds from decode->dpb.

> +
> +static int avd_h264_alloc_bufs(struct avd_ctx *ctx)
> +{
> +	struct avd_dev *dev =3D ctx->dev;
> +	struct avd_h264_ctx *h264_ctx =3D ctx->priv;
> +	int ret, w, bit_depth, mb;
> +
> +	w =3D fmt_width(ctx);
> +	bit_depth =3D (ctx->image_fmt =3D=3D AVD_IMG_FMT_420_10BIT ||
> +		     ctx->image_fmt =3D=3D AVD_IMG_FMT_422_10BIT) ?
> +			    10 :
> +			    8;
> +
> +	mb =3D DIV_ROUND_UP(w, 16);

[ ... ]

> +static int avd_h264_validate_sps(struct avd_ctx *ctx,
> +				 const struct v4l2_ctrl_h264_sps *sps)
> +{
> +	if (sps->chroma_format_idc > 2)
> +		/* Only 4:0:0, 4:2:0 and 4:2:2 are supported */
> +		return -EINVAL;
> +	if (sps->bit_depth_luma_minus8 !=3D sps->bit_depth_chroma_minus8)
> +		/* Luma and chroma bit depth mismatch */
> +		return -EINVAL;
> +	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> +		/* no interlaced support */
> +		return -EINVAL;
> +
> +	return 0;
> +}

[Severity: High]
Should avd_h264_validate_sps() also validate that the SPS macroblock
dimensions fit within ctx->coded_fmt and that sps->bit_depth_luma_minus8 is=
 0
or 2?

avd_h264_alloc_bufs() sizes the internal scratch DMA buffers (above_info,
ip_above, lf_above, lf_above_info, mv_above_info) using fmt_width(ctx) and
ctx->image_fmt, and capture buffers are sized from ctx->decoded_fmt. Howeve=
r,
stream_hdr() programs the hardware with:

	u32 width =3D (sps->pic_width_in_mbs_minus1 + 1) * 16;
	u32 height =3D (sps->pic_height_in_map_units_minus1 + 1) * 16;

and sps->bit_depth_luma_minus8 directly from the SPS control. If userspace
supplies an SPS with dimensions or bit depth larger than the configured
format, won't the hardware DMA-write past the end of the scratch and capture
buffers?

> +
> +static void avd_h264_stop(struct avd_ctx *ctx)
> +{
> +	struct avd_h264_ctx *h264_ctx =3D ctx->priv;
> +	struct avd_dev *dev =3D ctx->dev;
> +	int i;
> +
> +	if (!h264_ctx)
> +		return;
> +
> +	avd_buf_free(dev, &h264_ctx->bufs.above_info);
> +	avd_buf_free(dev, &h264_ctx->bufs.lf_above_info);
> +	avd_buf_free(dev, &h264_ctx->bufs.lf_above);
> +	avd_buf_free(dev, &h264_ctx->bufs.ip_above);
> +	avd_buf_free(dev, &h264_ctx->bufs.mv_above_info);
> +
> +	for (i =3D 0; i < h264_ctx->slice_num; i++)
> +		avd_buf_free(dev, &h264_ctx->slices[i]);
> +
> +	kfree(h264_ctx->slices);
> +	kfree(h264_ctx);
> +}

[Severity: High]
When avd_stop_streaming() calls avd_h264_stop(), ctx->priv and
ctx->job.segments are not cleared to NULL.

If userspace queues a slice with V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF set, st=
ops
streaming via VIDIOC_STREAMOFF, and restarts streaming via VIDIOC_STREAMON:

1. If avd_h264_start() fails early before reassigning ctx->priv, ctx->priv
   remains a dangling pointer to the freed h264_ctx.
2. If avd_h264_start() succeeds and userspace queues a slice with
   first_mb_in_slice !=3D 0, avd_h264_run() sees ctx->job.segments !=3D NUL=
L from
   before streamoff and submits stale segments containing the DMA addresses=
 of
   the freed scratch and slice buffers.

Should avd_h264_stop() clear ctx->priv =3D NULL and ctx->job.segments =3D N=
ULL?

> +
> +static int avd_h264_start(struct avd_ctx *ctx)
> +{
> +	struct avd_h264_ctx *h264_ctx;
> +	struct v4l2_ctrl *ctrl;
> +	int ret;
> +
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl, V4L2_CID_STATELESS_H264_SPS);
> +	if (!ctrl)
> +		return -EINVAL;
> +
> +	ret =3D avd_h264_validate_sps(ctx, ctrl->p_new.p_h264_sps);
> +	if (ret)
> +		return ret;
> +
> +	h264_ctx =3D kzalloc_obj(*h264_ctx, GFP_KERNEL);
> +	if (!h264_ctx)
> +		return -ENOMEM;
> +
> +	ctx->priv =3D h264_ctx;
> +
> +	/* assume one slice per row */
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
> +	avd_h264_stop(ctx);
> +	ctx->priv =3D NULL;
> +	return ret;
> +}

[Severity: High]
If kzalloc_objs() fails when allocating h264_ctx->slices, ret is still 0 fr=
om
avd_h264_validate_sps(). Doesn't jumping to err_free_ctx free h264_ctx, set
ctx->priv =3D NULL, and return 0 to avd_start_streaming(), leading to a NULL
pointer dereference in avd_h264_run()?

Also, since avd_h264_start() runs from avd_start_streaming() outside any
v4l2_ctrl_ops callback, should it inspect ctrl->p_cur.p_h264_sps instead of
ctrl->p_new.p_h264_sps?

[ ... ]

> +static int avd_h264_realloc_slices(struct avd_ctx *ctx)
> +{
> +	struct avd_h264_ctx *h264_ctx =3D ctx->priv;
> +	struct avd_job *job =3D &ctx->job;
> +	struct avd_buf tmp_buf =3D {};
> +	size_t alloc_slice_num;
> +	void *tmp;
> +	int ret;
> +
> +	tmp =3D h264_ctx->slices;
> +	alloc_slice_num =3D (h264_ctx->alloc_slice_num * 3) / 2 + 1;
> +	h264_ctx->slices =3D
> +		kzalloc_objs(*h264_ctx->slices, alloc_slice_num, GFP_KERNEL);
> +	if (!h264_ctx->slices) {
> +		/* make deallocating a little easier */
> +		h264_ctx->slices =3D tmp;
> +		return -ENOMEM;
> +	}
> +
> +	h264_ctx->alloc_slice_num =3D alloc_slice_num;
> +	memcpy(h264_ctx->slices, tmp,
> +	       sizeof(*h264_ctx->slices) * h264_ctx->slice_num);
> +	kfree(tmp);
> +
> +	/* we could already have the correct size */
> +	if ((alloc_slice_num + 1) * sizeof(*job->segments) < job->buf.size)
> +		return 0;
> +
> +	ret =3D avd_buf_alloc(ctx->dev, &tmp_buf,
> +			   (alloc_slice_num + 1) * sizeof(*job->segments));
> +	if (ret)
> +		return -ENOMEM;
> +
> +	job->segments =3D tmp_buf.cpu;
> +	job->num_alloc =3D (alloc_slice_num + 1);
> +	memset(tmp_buf.cpu, 0, tmp_buf.size);
> +	memcpy(job->segments, job->buf.cpu,
> +	       sizeof(*job->segments) * (job->num + 1));
> +
> +	avd_buf_free(ctx->dev, &job->buf);
> +	memcpy(&job->buf, &tmp_buf, sizeof(tmp_buf));
> +	return 0;
> +}

[Severity: Critical]
Does the memcpy() into job->segments read past the end of job->buf.cpu here?

On the first slice of a frame, avd_init_job() allocates job->buf with
old_alloc_slice_num + 1 segments. stream_hdr() consumes 1 segment and each =
of
the first old_alloc_slice_num slices calls avd_end_segment(), which increme=
nts
job->num to old_alloc_slice_num + 1. When the next slice triggers
avd_h264_realloc_slices(), job->num already equals the total number of
segments allocated in job->buf.cpu, so copying job->num + 1 segments reads =
one
struct avd_segment past the end of job->buf.cpu.

In addition, if avd_buf_alloc() fails and returns -ENOMEM (or if the early
return path is taken without updating job->num_alloc), h264_ctx->alloc_slic=
e_num
has already been updated to the larger alloc_slice_num while job->segments
still points to the smaller buffer. Won't subsequent slices then bypass
avd_h264_realloc_slices() and write past the end of job->segments?

> +
> +static int avd_h264_run(struct avd_ctx *ctx)
> +{
> +	struct avd_h264_ctx *h264_ctx =3D ctx->priv;
> +	struct v4l2_h264_reflist_builder reflist_builder;
> +	struct avd_h264_run run;
> +	struct vb2_v4l2_buffer *src;
> +	void *slice;
> +	int ret;
> +
> +	avd_h264_run_preamble(ctx, &run);
> +
> +	src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	slice =3D vb2_plane_vaddr(&src->vb2_buf, 0);
> +	if (!slice) {
> +		dev_err_ratelimited(ctx->dev->dev, "could not get slice vaddr");
> +		ret =3D -EINVAL;
> +		goto postamble;
> +	}
> +
> +	if (ctx->job.segments &&
> +	    h264_ctx->slice_num >=3D h264_ctx->alloc_slice_num) {
> +		ret =3D avd_h264_realloc_slices(ctx);
> +		if (ret)
> +			goto postamble;
> +	}
> +
> +	h264_ctx->active_slice =3D &h264_ctx->slices[h264_ctx->slice_num];
> +	ret =3D avd_buf_alloc(ctx->dev, h264_ctx->active_slice,
> +			    vb2_get_plane_payload(&src->vb2_buf, 0));
> +	if (ret)
> +		goto postamble;
> +
> +	memcpy(h264_ctx->active_slice->cpu, slice,
> +	       h264_ctx->active_slice->size);
> +	h264_ctx->slice_num++;
> +
> +	/* Build the P/B{0,1} ref lists. */
> +	v4l2_h264_init_reflist_builder(&reflist_builder, run.decode_params,
> +				       run.sps, run.decode_params->dpb);
> +
> +	run.num_valid =3D reflist_builder.num_valid;
> +	run.cur_poc =3D reflist_builder.cur_pic_order_count;
> +
> +	v4l2_h264_build_p_ref_list(&reflist_builder, h264_ctx->reflists.p);
> +	v4l2_h264_build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b0,
> +				    h264_ctx->reflists.b1);
> +
> +
> +	if (is_new_frame(run.slice_params)) {
> +		ret =3D avd_init_job(ctx, AVD_CODEC_H264,
> +				   h264_ctx->alloc_slice_num + 1);
> +		if (ret)
> +			goto postamble;
> +		stream_hdr(ctx, &run);
> +		/* h264 only submits once */
> +		avd_end_segment(ctx, true);
> +	}
> +
> +	if (!ctx->job.segments) {
> +		ret =3D -EINVAL;
> +		goto postamble;
> +	}
> +
> +	stream_slice(ctx, &run);
> +	avd_end_segment(ctx, false);
> +
> +	if (run.base.bufs.src->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF) {
> +		avd_run_postamble(ctx, &run.base);
> +		avd_job_finish(ctx, VB2_BUF_STATE_DONE);
> +		return 0;
> +	}
> +
> +	ret =3D avd_submit_job(ctx);
> +
> +postamble:
> +	avd_run_postamble(ctx, &run.base);
> +	return ret;
> +}
> +
> +static void avd_h264_done(struct avd_ctx *ctx, struct vb2_v4l2_buffer *s=
rc_buf,
> +			  struct vb2_v4l2_buffer *dst_buf,
> +			  enum vb2_buffer_state result)
> +{
> +	struct avd_dev *avd =3D ctx->dev;
> +	struct avd_h264_ctx *h264_ctx =3D ctx->priv;
> +	int i;
> +
> +	if (!(src_buf->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF)) {
> +		for (i =3D 0; i < h264_ctx->slice_num; i++)
> +			avd_buf_free(avd, &h264_ctx->slices[i]);
> +		h264_ctx->slice_num =3D 0;
> +		ctx->job.segments =3D NULL;
> +	}
> +}

[Severity: Critical]
Can h264_ctx->slices[] be written out-of-bounds when
V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF is used?

In avd_h264_run(), the reallocation check:

	if (ctx->job.segments &&
	    h264_ctx->slice_num >=3D h264_ctx->alloc_slice_num)

is gated on ctx->job.segments being non-NULL, and active_slice is allocated
and h264_ctx->slice_num is incremented before checking is_new_frame() or
!ctx->job.segments.

If ctx->job.segments is NULL and userspace queues buffers with
first_mb_in_slice !=3D 0 and V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF set,
avd_h264_run() increments h264_ctx->slice_num and returns -EINVAL at if
(!ctx->job.segments). Because avd_h264_done() only frees slices and resets
h264_ctx->slice_num when !(src_buf->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_=
BUF)
even on VB2_BUF_STATE_ERROR, h264_ctx->slice_num keeps growing while
ctx->job.segments remains NULL, bypassing avd_h264_realloc_slices() and
writing past the end of h264_ctx->slices[].

Similarly, if a new frame (first_mb_in_slice =3D=3D 0) arrives after prior =
slices
were held with V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF, avd_init_job() resets
ctx->job.num to 0 without freeing the previous h264_ctx->slices[] or resett=
ing
h264_ctx->slice_num.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-avd-v3-0-8=
5cbaa2125d8@icloud.com?part=3D7
