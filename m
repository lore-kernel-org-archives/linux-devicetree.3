Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792960132;
	b=rO8vk3o1H+RtTWHQPdE+v4GEZdeIxun2XaCc/cq35XE+Ro4k+f2Wj2kkPU3do1G/oRVc
	 if41RnPeubm7F+3MEXo79DFIV68CY2bIVcBSX8MnOL4rPxd2HyxowpjYUWxyD2zJoWwFG
	 gRQTgkRFvnOiPYiNLWlcHSjdK0Q0u+oWbf41zwCyOedJLHLTwgGRU+oIxd5md4QajZXfY
	 04zj2hyf4ZpLE7stJi66xRK7x6nV7K/m7k/ZDg0ujxZ8b/5MYsTJFHoZo6tg7Bgmh9q2a
	 IhEkOmX4EGzWUHUVfIA2V3F0BxOrRZDe1j7OJpnXfOjq2JTw+LQ1ZRkQvXQ9UxhSVtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960132;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1Lrsqni8t9+MJLsxWLd26oTSmJGc/sqzR5FakIN5Je4=;
	b=qlFgbXvOXpTAZXVwuTnTfTdPJUS6Wj1En4545lpOt5b3E2zG42K/CEdSUgvW8zHwp8Vb
	 ZBadm1hpjF8N35e/BP6HtjEaJUOpcmhaJW74FMWcFQiiSBju0zF0FHocbFq2vie/7f1EK
	 T0zdw1j8dwYQyeVvmMycFF0CMNpaMEGSLTC8wQxHB5nCQgViVYqrTwZmuCyQS0xIrrXCf
	 xE++dWow3JmO9ZRtyKTes1AuVzbmbZPZLzrk9VAyLEnMWwVMXvSrVNYVx/kwPk5YYLtku
	 IZghiu86tCJ2AKvMnAyhl1LQLGrP4AaixK1A/O6wfXMp4x0NsiV82vC35VEDxKoxMHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FLQK95VV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8305A606A31F
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 20:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FLQK95VV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84421F01829;
	Sun, 25 Oct 2026 20:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792960131;
	bh=1Lrsqni8t9+MJLsxWLd26oTSmJGc/sqzR5FakIN5Je4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FLQK95VVfWXq0ZFR6JWUNczFsfaxblicGD6G0NcWePxBCmDDdPAl56Y8xOwx1BUAK
	 lM72YLkuuSbjJgKzPw0wUKs4sDV4cC4Jsvm/Qh7M8iaw5amECjwu73DTBOucSS42Mc
	 O9ZBWK6XMEu2GlyAA0/hGS9nFOozFY6cqJnCt6GReT2e5a+x7aPyBDc44W5XUO3dam
	 oDA2lgiYXlkSKxBBtsNmBRRHnLUAEHBU5+aeNTpawP1ta2wb7EgJY/BQDvd4nPVFxB
	 TZufvF44oiUJSiQdjkSvZdX+Jx2vU0keVQhFawM1VTbX+mi2kDZbL4zqnYd9+UgxMO
	 G1EhD9ZzkNW/Q==
Message-ID: <sashiko-outbox-184434@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/11] media: amlogic: vdec: add MPEG-1/2 decoding
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261025192507.210058-6-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192507.210058-6-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 20:28:50 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [Critical] media: amlogic: vdec: out-of-bounds UV DMA in mpeg12_canvas_se=
tup() for NV12M
- [Critical] media: amlogic: vdec: unchecked MPEG-2 dimensions in aml_mpeg1=
2_dec_run()
- [High] media: amlogic: vdec: unchecked NULL vb2_plane_vaddr() in mpeg12.c=
 memcpy()
- [High] media: amlogic: vdec: aml_mpeg12_dec_run() uses dst timestamp befo=
re copy
- [High] media: amlogic: vdec: premature job completion in mpeg12_job_done(=
) races
- [High] media: amlogic: vdec: missing IRQ sync in aml_mpeg12_dec_run() and=
 exit
- [High] media: amlogic: vdec: NULL codec_priv in aml_mpeg12_dec_run() on c=
ap restart
- [High] media: amlogic: vdec: multi-instance hw stop and IRQ race in aml_m=
peg12_exit()
- [Medium] media: amlogic: vdec: double v4l2_ctrl_request_complete() on run=
() error
- [Medium] media: amlogic: vdec: unchecked ref0/ref1 failure in aml_mpeg12_=
dec_run()
--

commit 539f5aa58a2516451024d2007f3188610dee819b
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

media: amlogic: vdec: add MPEG-1/2 decoding

This commit adds stateless MPEG-1 and MPEG-2 slice decoding support for the
Amlogic legacy VDEC core using the mpeg12 multi-instance microcode. It
rebuilds sequence, picture, and quantisation headers from V4L2 stateless
controls in front of slice data and supports field-pair decoding into held
capture buffers.

> diff --git a/drivers/media/platform/amlogic/vdec/mpeg12.c b/drivers/media=
/platform/amlogic/vdec/mpeg12.c
> new file mode 100644
> index 0000000000000..e09ff4d79902f
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/mpeg12.c

[ ... ]

> +static u32 mpeg12_write_headers(u8 *buf,
> +				const struct v4l2_ctrl_mpeg2_sequence *seq,
> +				const struct v4l2_ctrl_mpeg2_picture *pic,
> +				const struct v4l2_ctrl_mpeg2_quantisation *quant,
> +				bool with_seq)
> +{
> +	struct bitw bw =3D { .buf =3D buf };
> +	u32 vbv =3D seq->vbv_buffer_size / 2048;
> +	int i;
> +
> +	if (!vbv)
> +		vbv =3D 112;
> +
> +	if (!with_seq)
> +		goto picture;
> +
> +	put_start(&bw, 0xb3);
> +	put_bits(&bw, 12, seq->horizontal_size & 0xfff);
> +	put_bits(&bw, 12, seq->vertical_size & 0xfff);

[Severity: Critical]
Could this write past the end of the capture buffer if the sequence or outp=
ut
dimensions exceed the negotiated capture format?

When userspace configures a smaller capture buffer via vdec_s_fmt_capture()
while setting a larger output format via vdec_s_fmt_output() ->
set_pic_info(), or passes larger horizontal_size and vertical_size values in
V4L2_CID_STATELESS_MPEG2_SEQUENCE, mpeg12_write_headers() writes
seq->horizontal_size and seq->vertical_size into the staged stream without
checking that they are non-zero or fit within ctx->pic_info and
ctx->pix_fmt[AML_FMT_DST].

Later, mpeg12_threaded_isr() clears MREG_SEQ_REPORT without verifying
MREG_PIC_WIDTH and MREG_PIC_HEIGHT against the capture buffer, and
mpeg12_canvas_setup() configures the destination canvases using
ctx->pic_info.coded_width, ctx->pic_info.coded_height, and
ctx->pic_info.fb_size[0] without checking vb2_plane_size() on the capture
buffer.

[ ... ]

> +/* Stash the first field of a pair: headers and slices, for the next job=
. */
> +static int mpeg12_stash_field(struct aml_vdec_ctx *ctx,
> +			      const struct v4l2_ctrl_mpeg2_sequence *seq,
> +			      const struct v4l2_ctrl_mpeg2_picture *pic,
> +			      const struct v4l2_ctrl_mpeg2_quantisation *quant,
> +			      struct vb2_v4l2_buffer *src)
> +{
> +	struct aml_mpeg12_ctx *m =3D ctx->codec_priv;
> +	u32 payload =3D vb2_get_plane_payload(&src->vb2_buf, 0);
> +	u32 need =3D MPEG12_HDR_MAX + payload;
> +	u32 hdr;
> +
> +	if (need > m->fld_cap) {
> +		kvfree(m->fld_buf);
> +		m->fld_cap =3D 0;
> +		m->fld_buf =3D kvmalloc(need, GFP_KERNEL);
> +		if (!m->fld_buf)
> +			return -ENOMEM;
> +		m->fld_cap =3D need;
> +	}
> +	hdr =3D mpeg12_write_headers(m->fld_buf, seq, pic, quant, true);
> +	memcpy(m->fld_buf + hdr, vb2_plane_vaddr(&src->vb2_buf, 0), payload);

[Severity: High]
What happens if vb2_plane_vaddr() returns NULL here or in
mpeg12_prepare_input()?

In aml_vdec_queue_init(), the output queue enables VB2_DMABUF with
vb2_dma_contig_memops. If userspace queues an imported DMABUF where
dma_buf_vmap_unlocked() fails or the exporter does not implement vmap,
vb2_plane_vaddr() returns NULL.

Passing that return value directly to memcpy() in mpeg12_stash_field() and
mpeg12_prepare_input() without a NULL check (unlike h264_stage_with_headers=
()
in h264.c) will dereference a NULL pointer when payload is non-zero.

[ ... ]

> +/* Returns the canvas spec (y | uv << 8 | uv << 16) for the buffer, or ~=
0. */
> +static u32 mpeg12_canvas_setup(struct aml_vdec_ctx *ctx,
> +			       struct mpeg12_canvas *c, struct vb2_buffer *vb)
> +{
> +	struct aml_vdec_hw *hw =3D vdec_get_hw(ctx->dev);
> +	u32 w =3D ctx->pic_info.coded_width;
> +	u32 h =3D ctx->pic_info.coded_height;
> +	dma_addr_t y, uv;
> +	u8 yi, ci;
> +
> +	y =3D vb2_dma_contig_plane_dma_addr(vb, 0);
> +	if (ctx->pic_info.plane_num > 1)
> +		uv =3D vb2_dma_contig_plane_dma_addr(vb, 1);
> +	else
> +		uv =3D y + ctx->pic_info.fb_size[0];

[Severity: Critical]
Does this DMA into unallocated memory past plane 0 when a two-plane capture
format such as V4L2_PIX_FMT_NV12M or V4L2_PIX_FMT_NV21M is selected?

In drivers/media/platform/amlogic/vdec/aml_vdec.c, set_pic_info() hardcodes
ctx->pic_info.plane_num =3D 1 when the output format is configured, and
vdec_s_fmt_capture() never updates ctx->pic_info.plane_num:

drivers/media/platform/amlogic/vdec/aml_vdec.c:set_pic_info() {
	if (V4L2_TYPE_IS_OUTPUT(type)) {
		...
		ctx->pic_info.fb_size[0] =3D
		    ctx->pic_info.coded_width * ctx->pic_info.coded_height;
		ctx->pic_info.fb_size[1] =3D ctx->pic_info.fb_size[0] / 2;
		ctx->pic_info.plane_num =3D 1;
	}
}

When userspace selects V4L2_PIX_FMT_NV12M or V4L2_PIX_FMT_NV21M on the
capture queue, vb2ops_vdec_queue_setup() allocates two separate planes (pla=
ne
0 of size fb_size[0] for Y, and plane 1 of size fb_size[1] for UV). Because
ctx->pic_info.plane_num is still 1, mpeg12_canvas_setup() always takes the
else branch and sets uv =3D y + ctx->pic_info.fb_size[0], programming the UV
canvas immediately past the end of plane 0's DMA allocation instead of using
plane 1. Should this check vb->num_planes > 1 or
ctx->dec_fmt[AML_FMT_DST].num_planes > 1 instead?

[ ... ]

> +static void mpeg12_job_done(struct aml_vdec_ctx *ctx, enum vb2_buffer_st=
ate st)
> +{
> +	struct aml_vdec_dev *dev =3D ctx->dev;
> +
> +	mpeg12_canvas_free(dev->dec_hw, ctx->codec_priv);
> +	ctx->int_cond =3D 1;
> +	ctx->job_finished =3D true;
> +	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, st);
> +	wake_up(&ctx->queue);
> +}

[Severity: High]
Can calling v4l2_m2m_buf_done_and_job_finish() here in the interrupt thread
race with aml_mpeg12_dec_run() and m2mops_vdec_device_run()?

When mpeg12_threaded_isr() calls mpeg12_job_done(),
v4l2_m2m_buf_done_and_job_finish() clears TRANS_RUNNING, wakes
m2m_ctx->finished, and schedules the next M2M job before wake_up(&ctx->queu=
e)
is called and before aml_mpeg12_dec_run() returns to
m2mops_vdec_device_run():

1. v4l2_m2m_cancel_job() in v4l2_m2m_streamoff() and v4l2_m2m_ctx_release()
   only waits for TRANS_RUNNING to clear. Once mpeg12_job_done() clears
   TRANS_RUNNING, a concurrent VIDIOC_STREAMOFF or close() can run
   aml_mpeg12_exit() (freeing struct aml_mpeg12_ctx) and fops_vcodec_releas=
e()
   (freeing struct aml_vdec_ctx) while aml_mpeg12_dec_run() and
   m2mops_vdec_device_run() are still executing and accessing ctx, src_buf,
   dst_buf, and ctx->ctrl_handler.

2. If another decode job is queued, v4l2_m2m_schedule_next_job() can start =
the
   next job's m2mops_vdec_device_run() on the hardware before the waking
   aml_mpeg12_dec_run() thread reaches ctx->int_cond =3D 0 and
   aml_stop_vdec_hw(hw), halting the VDEC core in the middle of the new job.

3. In m2mops_vdec_device_run(), v4l2_m2m_buf_copy_metadata(src_buf, dst_buf)
   and v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler) run only aft=
er
   ctx->codec_ops->run(ctx) returns, so userspace can dequeue dst_buf before
   its metadata is copied, and src_req can be completed before
   v4l2_ctrl_request_complete() runs.

[ ... ]

> +void aml_mpeg12_exit(void *priv)
> +{
> +	struct aml_vdec_ctx *ctx =3D priv;
> +	struct aml_mpeg12_ctx *m =3D ctx->codec_priv;
> +	struct aml_vdec_hw *hw;
> +
> +	if (!m)
> +		return;
> +	hw =3D vdec_get_hw(ctx->dev);
> +
> +	if (ctx->dos_clk_en)
> +		aml_stop_vdec_hw(hw);

[Severity: High]
Could aml_mpeg12_exit() reset the shared VDEC core while another decoder
instance is actively decoding, or race with h264 IRQ handler registration?

Because m2mops_vdec_device_run() runs on m2m_dev->job_work without holding
dev->dev_mutex and blocks in wait_event_timeout(), a second instance (where
ctx->dos_clk_en was set during an earlier job) can call VIDIOC_STREAMOFF or
close() and invoke aml_mpeg12_exit(). Checking ctx->dos_clk_en without
verifying hw->curr_ctx =3D=3D m will call aml_stop_vdec_hw(hw) and reset the
shared hardware while the first instance is mid-decode.

Similarly, aml_mpeg12_dec_run() sets hw->curr_ctx =3D m and
hw->hw_ops.irq_threaded_func =3D mpeg12_threaded_isr when a job starts, but
aml_h264_init() overwrites dec_hw->hw_ops.irq_handler and
dec_hw->hw_ops.irq_threaded_func during VIDIOC_STREAMON(OUTPUT). If a second
instance starts an H.264 stream while an MPEG-2 job is running on the
hardware, the MPEG-2 interrupt will invoke h264_threaded_isr_func() with
hw->curr_ctx pointing to struct aml_mpeg12_ctx.

> +	mpeg12_canvas_free(hw, m);
> +
> +	if (m->stage_vaddr)
> +		dma_free_coherent(hw->dev, m->stage_size,
> +				  m->stage_vaddr, m->stage_paddr);
> +	dma_free_coherent(hw->dev, MPEG12_WORKSPACE_SIZE,
> +			  m->wks_vaddr, m->wks_paddr);
> +	dma_free_coherent(hw->dev, MPEG12_CCBUF_SIZE,
> +			  m->cc_vaddr, m->cc_paddr);
> +	kvfree(m->fld_buf);
> +
> +	if (hw->curr_ctx =3D=3D m)
> +		hw->curr_ctx =3D NULL;
> +	kfree(m);
> +	ctx->codec_priv =3D NULL;
> +}
> +
> +int aml_mpeg12_dec_run(void *priv)
> +{
> +	struct aml_vdec_ctx *ctx =3D priv;
> +	struct aml_mpeg12_ctx *m =3D ctx->codec_priv;

[Severity: High]
Can m (ctx->codec_priv) be NULL here if userspace restarts the capture queu=
e?

In drivers/media/platform/amlogic/vdec/aml_vdec.c,
vb2ops_vdec_start_streaming() only calls aml_vdec_init_dec_inst(ctx) ->
aml_mpeg12_init(ctx) when starting the output queue, whereas
vb2ops_vdec_stop_streaming() unconditionally calls
aml_vdec_release_instance(ctx) -> aml_mpeg12_exit(ctx) when stopping either
queue.

If userspace calls VIDIOC_STREAMOFF and VIDIOC_STREAMON on the capture queue
while the output queue remains streaming, ctx->codec_priv is freed and set =
to
NULL, and the next aml_mpeg12_dec_run() call will dereference m when checki=
ng
m->fld_pending.

> +	struct aml_vdec_hw *hw =3D vdec_get_hw(ctx->dev);
> +	const struct v4l2_ctrl_mpeg2_sequence *seq;
> +	const struct v4l2_ctrl_mpeg2_picture *pic;
> +	const struct v4l2_ctrl_mpeg2_quantisation *quant;
> +	const struct v4l2_ctrl_mpeg2_picture *rpic;
> +	struct vb2_v4l2_buffer *src, *dst;
> +	u32 rec, ref0 =3D 0xffffffff, ref1 =3D 0xffffffff;
> +	u64 fwd;
> +	bool field, pair;
> +	long ret;
> +
> +	seq =3D mpeg12_ctrl(ctx, V4L2_CID_STATELESS_MPEG2_SEQUENCE);
> +	pic =3D mpeg12_ctrl(ctx, V4L2_CID_STATELESS_MPEG2_PICTURE);
> +	quant =3D mpeg12_ctrl(ctx, V4L2_CID_STATELESS_MPEG2_QUANTISATION);
> +	if (!seq || !pic || !quant)
> +		return -EINVAL;

[Severity: Medium]
When aml_mpeg12_dec_run() returns a negative error code with
ctx->job_finished =3D=3D false (here, on -ENOMEM, or on -ETIMEDOUT), doesn't
m2mops_vdec_device_run() call v4l2_ctrl_request_complete() twice on src_req?

In drivers/media/platform/amlogic/vdec/aml_vdec.c:

drivers/media/platform/amlogic/vdec/aml_vdec.c:m2mops_vdec_device_run() {
	...
	ctx->job_finished =3D false;
	ret =3D ctx->codec_ops->run(ctx);

	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
	if (src_req && ctx->curr_dec_type !=3D CODEC_TYPE_AV1 &&
	    ctx->curr_dec_type !=3D CODEC_TYPE_VP9 &&
	    ctx->curr_dec_type !=3D CODEC_TYPE_HEVC &&
	    ctx->curr_dec_type !=3D CODEC_TYPE_MJPEG)
		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);
	if (ret < 0 && !ctx->job_finished)
		goto err_cancel_job;

	return;

err_cancel_job:
	if (src_req)
		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);
	...
}

For CODEC_TYPE_MPEG2, the first v4l2_ctrl_request_complete() runs before the
ret < 0 && !ctx->job_finished check, and jumping to err_cancel_job calls
v4l2_ctrl_request_complete() a second time, triggering
WARN_ON(!hdl->request_is_queued) in v4l2-ctrls-request.c.

[ ... ]

> +	if (field && !pair &&
> +	    (src->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF)) {
> +		if (mpeg12_stash_field(ctx, seq, pic, quant, src) < 0)
> +			return -ENOMEM;
> +		dev_dbg(hw->dev, "mpeg12 stash field %u type %u\n",
> +			pic->picture_structure,
> +			 pic->picture_coding_type);
> +		/* the capture buffer stays held for the second field */
> +		ctx->int_cond =3D 1;
> +		ctx->job_finished =3D true;
> +		v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev_dec,
> +						 ctx->m2m_ctx,
> +						 VB2_BUF_STATE_DONE);
> +		return 0;
> +	}

[ ... ]

> +	rpic =3D pic;
> +	if (pair && m->fld_pic.picture_coding_type !=3D
> +		    V4L2_MPEG2_PIC_CODING_TYPE_I)
> +		rpic =3D &m->fld_pic;
> +	fwd =3D rpic->forward_ref_ts;
> +	if (fwd =3D=3D dst->vb2_buf.timestamp && m->anchor_valid)
> +		fwd =3D m->anchor_ts;
> +	if (rpic->picture_coding_type =3D=3D V4L2_MPEG2_PIC_CODING_TYPE_P) {
> +		ref1 =3D mpeg12_ref_spec(ctx, &m->canvas[2], fwd);
> +		ref0 =3D ref1;
> +	} else if (rpic->picture_coding_type =3D=3D V4L2_MPEG2_PIC_CODING_TYPE_=
B) {
> +		ref0 =3D mpeg12_ref_spec(ctx, &m->canvas[1], fwd);
> +		ref1 =3D mpeg12_ref_spec(ctx, &m->canvas[2],
> +				       rpic->backward_ref_ts);
> +	}
> +	if (rpic->picture_coding_type !=3D V4L2_MPEG2_PIC_CODING_TYPE_B) {
> +		m->anchor_ts =3D dst->vb2_buf.timestamp;
> +		m->anchor_valid =3D true;
> +	}

[Severity: High]
Isn't dst->vb2_buf.timestamp still 0 here because
v4l2_m2m_buf_copy_metadata(src_buf, dst_buf) is only called in
m2mops_vdec_device_run() after ctx->codec_ops->run(ctx) returns?

On any frame-coded picture or non-paired field, dst->vb2_buf.timestamp has =
not
yet been copied from src->vb2_buf.timestamp:

1. For frame-coded I/P pictures, m->anchor_ts =3D dst->vb2_buf.timestamp al=
ways
   records 0 instead of the picture's timestamp. When a later I/P field pair
   predicts from its first field, fwd is replaced with 0 rather than the
   previous anchor frame's timestamp.

2. On any non-paired P or B picture whose forward_ref_ts is legitimately 0,
   fwd =3D=3D dst->vb2_buf.timestamp evaluates to true (0 =3D=3D 0) and ove=
rwrites
   fwd with m->anchor_ts.

3. In the first-field stash path above, v4l2_m2m_buf_done_and_job_finish()
   sets dst_buf->is_held =3D true and runs __v4l2_m2m_try_queue() before
   v4l2_m2m_buf_copy_metadata() sets dst->vb2_buf.copied_timestamp =3D 1 and
   dst->vb2_buf.timestamp, bypassing __v4l2_m2m_try_queue()'s held-buffer
   timestamp mismatch check if the next output buffer is already queued.

> +	regmap_write(hw->map[DOS_BUS], MREG_REF0, ref0);
> +	regmap_write(hw->map[DOS_BUS], MREG_REF1, ref1);

[Severity: Medium]
Should ref0 and ref1 be checked before writing MREG_REF0 and MREG_REF1?

mpeg12_ref_spec() returns 0xffffffff (~0u) both when vb2_find_buffer() cann=
ot
find the reference timestamp (for example on open-GOP B-frames after a seek)
and when meson_canvas_alloc() fails inside mpeg12_canvas_setup(). Unlike re=
c,
which is checked for ~0u, ref0 and ref1 are written directly to MREG_REF0 a=
nd
MREG_REF1 as 0xffffffff without failing on canvas allocation errors or fall=
ing
back to a valid canvas such as rec when a reference buffer is absent.

[ ... ]

> +	/* Uninterruptible: see the note in vp9.c. */
> +	ret =3D wait_event_timeout(ctx->queue, ctx->int_cond,
> +				 msecs_to_jiffies(MPEG12_TIMEOUT_MS));
> +	ctx->int_cond =3D 0;
> +	if (!ret) {
> +		dev_err(hw->dev,
> +			"mpeg12 timeout: out %x info %x pc %x lvl %x rp %x wp %x bitcnt %x er=
r %x\n",
> +			read_dos_reg(hw, MREG_BUFFEROUT),
> +			read_dos_reg(hw, MREG_PIC_INFO),
> +			read_dos_reg(hw, MPC_E),
> +			read_dos_reg(hw, VLD_MEM_VIFIFO_LEVEL),
> +			read_dos_reg(hw, VLD_MEM_VIFIFO_RP),
> +			read_dos_reg(hw, VLD_MEM_VIFIFO_WP),
> +			read_dos_reg(hw, VIFF_BIT_CNT),
> +			read_dos_reg(hw, MREG_ERROR_COUNT));
> +		aml_stop_vdec_hw(hw);
> +		mpeg12_canvas_free(hw, m);
> +		return -ETIMEDOUT;
> +	}

[Severity: High]
Can the timeout path here and aml_mpeg12_exit() race with an in-flight
mpeg12_threaded_isr()?

If the hardware interrupt fires just as wait_event_timeout() expires,
mpeg12_threaded_isr() can run concurrently with the timeout error path beca=
use
VDEC_ASSIST_MBOX1_MASK is not cleared and synchronize_irq(hw->dec_irq) is n=
ot
called before mpeg12_canvas_free(hw, m) and returning -ETIMEDOUT:

1. Both mpeg12_job_done() and the timeout path call mpeg12_canvas_free(hw, =
m)
   concurrently without locking, which can free the same meson canvases twi=
ce
   or pass (u8)-1 to meson_canvas_free().

2. Both mpeg12_job_done() and m2mops_vdec_device_run()'s err_cancel_job path
   can call v4l2_m2m_buf_done_and_job_finish() for the same job.

3. In aml_mpeg12_exit(), VDEC_ASSIST_MBOX1_MASK is not cleared and
   synchronize_irq(hw->dec_irq) is not called before kfree(m), so an in-fli=
ght
   mpeg12_threaded_isr() that read hw->curr_ctx before it was cleared can
   dereference m after it has been freed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025192507.2100=
58-1-christian.koever-draxl@student.uibk.ac.at?part=3D5
