Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D862239E16B
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790429673; cv=none; b=D/4tLcHw7j5erXydQC3CPG4EJB1r6WT4h9E+Qc9+YpEd6JWc680mFjPo4Au9NozZldbdXQjLSR2624Y5YteKU3vfcjggQJovYHOz9lT1OmmAbFqvho/vNbI2NCm8WwQyxTRko971IAEa/x+Y4D+7fx8J8rPJu/dmex6tnOsNb+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790429673; c=relaxed/simple;
	bh=zFt1sEoX5hVwZZNmIodjQvZ4TQcrbjblB4/WaKBmQko=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p/FKeQZJT8wDZQv84lm7vwx4M/Dn1n94KwYvv8jKPDzpuB2ZqyVpBnvN/qGLll6xMF9BKC/hwqFRfHOxZZC3N+Ch3O97CuYViGbUsPD5fJMBAgTV0kgNpCRea9bH/HvTeTr9Z8O2xdqk89ntTmsJl6v81o3jjHwqC4pHHcgoDTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Prjl/6tN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Prjl/6tN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4681B1F000FF;
	Sat, 26 Sep 2026 13:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790429671;
	bh=rKejATy1sxaha8fQ+z2aZ3E9Ac9vbajEcEF7HuUHlTs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Prjl/6tNvZxE94edd6ltS/oeArIUx0Fneck+WpaC1H+/7nJ9CAoQ88IWzKnPa62m4
	 csBYNaV8fx/OrOusA7m8yguMZQEi+Ho3vu+HTk03yV+DVN7sFfK6bQdwb8tMhpv8CB
	 n8zg7p7N7slLojMarxH/pqRocu5NkOB+Tykrc7W0c2CMQCNSRBdUFG0UDs9s6ObEZO
	 cba1FswWYHyJVVG7J6U2iu3zQlAMBb84oeqdm0wpD67tI+lukYKiCJI6RXdCrIVjsy
	 yZnTmBb3FxOLN5I9HFEz99E0WpXMu+6vyBEPKrEzXJ4wh/OiNvmOUImuOt1FRp343h
	 c0fKy4IjJ2EWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/17] media: apple: avd: add h264 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260926-avd-v2-7-ecebe6a3648e@icloud.com>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
 <20260926-avd-v2-7-ecebe6a3648e@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 13:34:30 +0000
Message-Id: <20260926133431.4681B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] media: apple: avd: memory exhaustion and OOB write via HOLD_CA=
PTURE_BUF
- [Critical] media: apple: avd: heap buffer overflows due to flawed slice r=
eallocation
- [High] media: apple: avd: integer underflow in slice payload size calcula=
tion
- [High] media: apple: avd: OOB read in `decode->dpb` via unvalidated user =
index
--

commit 10d5fd4b6c8cc892d38453f03a1a8fcb406d63ac
Author: Sofus Forstreuter <sofus.c@icloud.com>

media: apple: avd: add h264 support

The fluster score is 77/135 for JVT-AVC_V1 and 42/69 for JVT-FR-EXT.

While there are no unexpected test cases. FM1_FT_E, SP1_BT_A and
sp2_bt_b still have some unsupported features that are not rejected,
which causes the hardware to fault.

> diff --git a/drivers/media/platform/apple/avd/avd-h264.c b/drivers/media/=
platform/apple/avd/avd-h264.c
> new file mode 100644
> index 0000000000000..a6acf4b2a0308
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-h264.c
[ ... ]
> +static void stream_slice(struct avd_ctx *ctx, struct avd_h264_run *run)
> +{
[ ... ]
> +	u32 payload_len =3D h264_ctx->active_slice->size;
> +	bool en_mode =3D (pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE) =
=3D=3D
> +		       0;
> +	const u8 *data =3D h264_ctx->active_slice->cpu;
> +	u32 min_off =3D (sl->header_bit_size + (en_mode ? 0 : 7)) / 8;
> +	u32 off =3D 2;

[Severity: High]
Does this code underflow when calculating the payload size?

The variable off is initialized to 2 here, implying the payload must be at
least 2 bytes.

> +	u32 num_ref_idx_active, bytes_read =3D 2;
> +	dma_addr_t coded_in, mv_color_addr;
> +	struct avd_decoded_buffer *dst, *ref;
> +
> +	dst =3D vb2_to_avd_decoded_buf(&run->base.bufs.dst->vb2_buf);
> +
> +	if (payload_len < min_off)
> +		return;

If userspace submits a malformed slice payload with payload_len of 0 or 1, =
and
min_off is 0, this check passes and the early return is bypassed.

[ ... ]
> +	coded_in =3D h264_ctx->active_slice->addr + off;
> +
> +	push(AVD_OP_CODED_DATA |
> +		     AVD_OP_CODED_DATA_BIT_OFF(
> +			     en_mode ? (sl->header_bit_size % 8) : 0) |
> +		     AVD_OP_CODED_IN_HI(coded_in),
> +	     "slc_a7c_cmd_set_coded_slice");
> +	push(AVD_OP_CODED_IN_LO(coded_in), "slc_a84_slice_addr_low");
> +	push(payload_len - off, "slc_a88_slice_hdr_size");

If payload_len was less than off, payload_len - off would underflow yielding
0xFFFFFFFF, which is then pushed to the hardware ring.

Could this cause an arbitrarily large out-of-bounds DMA read by the hardwar=
e?

[ ... ]
> +	if (sl->slice_type =3D=3D V4L2_H264_SLICE_TYPE_B) {
> +
> +		/* sl->ref_pic_list1[0].index < ARRAY_SIZE(decode->dpb) */
> +		/* bidirectional reference of previous mv */
> +		ref =3D avd_get_ref_buf(
> +			ctx, &dst->base.vb,
> +			decode->dpb[sl->ref_pic_list1[0].index].reference_ts);

[Severity: High]
Does this allow out-of-bounds memory reads from the decode->dpb array?

If sl->ref_pic_list1[0].index comes from unvalidated user input, it might
exceed the bounds of the decode->dpb array (size 16).

Could this potentially cause a crash or leak kernel state?

[ ... ]
> +static int avd_h264_realloc_slices(struct avd_ctx *ctx)
> +{
[ ... ]
> +	alloc_slice_num =3D (h264_ctx->alloc_slice_num * 3) / 2;
> +	h264_ctx->slices =3D
> +		kzalloc_objs(*h264_ctx->slices, alloc_slice_num, GFP_KERNEL);

[Severity: Critical]
Is it possible for the array growth calculation to fail to increase capacit=
y?

If h264_ctx->alloc_slice_num is initially 1, (1 * 3) / 2 evaluates to 1,
meaning the capacity never grows.

[ ... ]
> +	job->segments =3D tmp_buf.cpu;
> +	job->num_alloc =3D (alloc_slice_num + 1);
> +	memset(tmp_buf.cpu, 0, tmp_buf.size);
> +	memcpy(job->segments, job->buf.cpu,
> +	       sizeof(*job->segments) * (job->num + 1));

Does this copy operation overflow the buffers?

If job->num is equal to the allocated capacity, job->num + 1 will exceed the
allocated capacity, causing a read past the source buffer and a write past =
the
destination buffer.

[ ... ]
> +static int avd_h264_run(struct avd_ctx *ctx)
> +{
[ ... ]
> +	if (ctx->job.segments &&
> +	    h264_ctx->slice_num >=3D h264_ctx->alloc_slice_num) {
> +		ret =3D avd_h264_realloc_slices(ctx);
> +		if (ret)
> +			goto postamble;
> +	}

[Severity: Critical]
Could this condition inadvertently skip reallocation and cause an out-of-bo=
unds
array access?

If userspace submits a slice with V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF, and
avd_init_job is not called because is_new_frame evaluates to false,
ctx->job.segments remains NULL.

The reallocation logic would then be silently skipped.

> +
> +	h264_ctx->active_slice =3D &h264_ctx->slices[h264_ctx->slice_num];

And then h264_ctx->slices is accessed unconditionally here, which would be
out of bounds if reallocation was bypassed, or if the capacity failed to gr=
ow
in avd_h264_realloc_slices.

[ ... ]
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

Is it possible for abandoned frames to never get their slices freed?

If userspace repeatedly submits slices with the
V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF flag, the cleanup here is bypassed.

Could this lead to memory exhaustion?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-avd-v2-0-e=
cebe6a3648e@icloud.com?part=3D7
