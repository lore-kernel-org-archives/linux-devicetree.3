Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792960745;
	b=yLyGrpdLvf7dBSWe50oaqmZDCR4JYMwMoSZIlBkmtwkUgBpmC3+AGqOqPdGYdfjTrwjv
	 9EDjPvnpmQyMehj06k4UI7eK69fAJkS3F86AFK5yuxDsiKK/Fvq78vnKyNmofS5B41wFr
	 zXpk2eB/YRnjAf+HLHEQLSbBI1f+KZfrH4Sb1NfebgDE2R1Uzk0QKByinot/5x0AMbVUM
	 cCmoKUKsq05/BaNa6Cra0sMGmAhgushZN57aoBdpbftL2nmZFKVoQIXU0X6cr1RgwXN9R
	 a+EbO+pvn2axMhYaIiAdB1qZ33SUSS2mTpKoFOJ++b4URdCwkMK6OEHnMahskNIUNuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960745;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+0qyjl+629bsDqIX+piET85dOpQeyr8eohL/dmPTmmI=;
	b=SVxeYYqvZn3GTNOT/DaiD/UyA/nnGVGfeDpeqN4bPlZp3/3aHCgr/uFXNbr30km+sQLs
	 TDn5VjTAh/HYu/3nYx4EN6WjL/cwAqwATExHiOrZTVuccuzjeLhKcPvWGZYYEmyEWFO2G
	 vSaw3m3alC6eJ/07KGX1coZIBErVjq2BgMAIqy8Gd9BugNvwpzA0ohAJTMxYynUppq/mo
	 deJAAEkayt4yccekDVuX5vj9jkCagwPNBsfK95rsovaL8YP3UIF4c1EKWoH+EzjdsInNM
	 Ynd1dwNZXdCQb6A3rYe1YNfUNyD4B1jFXR912JDOuzvUJYcsPVppCRib0Tivk30Pq7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LM4vrtQ0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986F0606A321
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LM4vrtQ0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD431F031E1;
	Sun, 25 Oct 2026 20:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792960744;
	bh=+0qyjl+629bsDqIX+piET85dOpQeyr8eohL/dmPTmmI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LM4vrtQ0DUqK9XiQ064QPYC8L7wV2mf9SJes1iLGYaXrQX2BX8fsd+j7CdmJXT8LD
	 wocSyUPXfcXTD7aJ44LLN0xKVVazJm2wj81qIPhZGf0pGhlNRKwg0gpbRMDkAxkZOD
	 JdpCIk+2aWZQdrNPvJ2qMIDKFhbWwTgDwQ3QCavAIFHBb4up6dBTCpfLCR5t4FleZl
	 6DFKd5e232MvlQPxZMG9O5LJ5NDc8W7JB/L3Eyc7edvGtJ8Tpb8LZH2ZpVsnL/f8lB
	 xb8blSmPUFjF6W9jqwYgZx34smOkJXoNC62SwrjJrGtSZj+r10kw73gh5jNGjA+eOZ
	 dB7gCwKJoxXqA==
Message-ID: <sashiko-outbox-184438@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/11] media: amlogic: vdec: add MPEG-4 Part 2 decoding
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261025192507.210058-11-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192507.210058-11-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 20:39:03 +0000
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
- [Critical] media: amlogic: vdec: out-of-bounds DMA setup in mpeg4_canvas_=
setup()
- [Critical] media: amlogic: vdec: unvalidated VOL dimensions in mpeg4_thre=
aded_isr()
- [High] media: amlogic: vdec: premature job completion in mpeg4_job_done()
- [High] media: amlogic: vdec: mpeg4_threaded_isr() races with timeout and =
exit paths
- [High] media: amlogic: vdec: NULL deref and u32 overflow in mpeg4_prepare=
_input()
- [High] media: amlogic: vdec: unchecked mpeg4_ref_spec() in aml_mpeg4_dec_=
run()
- [High] media: amlogic: vdec: NULL codec_priv dereference in aml_mpeg4_dec=
_run()
- [Medium] media: amlogic: vdec: stateful V4L2_PIX_FMT_MPEG4 used with priv=
ate control
--

commit 16518bdbcc7ac5cd882698a45b99c4af42c31b6c
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

media: amlogic: vdec: add MPEG-4 Part 2 decoding

This commit adds MPEG-4 Part 2 Simple and Advanced Simple profile decoding
support on the Amlogic legacy VDEC core using the M45M microcode. It
exposes V4L2_PIX_FMT_MPEG4 on a request-based queue and passes reference
timestamps via the driver-private V4L2_CID_AML_MPEG4_REFS control.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c b/dr=
ivers/media/platform/amlogic/vdec/aml_vdec_platform.c
> index 36ae12e6cdd82..f8e2d0bef3fe4 100644
> --- a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
[ ... ]
> @@ -68,6 +69,17 @@ static struct aml_video_fmt aml_s4_video_formats[] =3D=
 {
>  		.stepwise =3D {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
>  			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
>  	},
> +	{
> +		.name =3D "MPEG-4",
> +		.fourcc =3D V4L2_PIX_FMT_MPEG4,
> +		.type =3D AML_FMT_DEC,
> +		.align =3D 64,
> +		.is_10_bit_support =3D 0,
> +		.codec_type =3D CODEC_TYPE_MPEG4,
> +		.num_planes =3D 1,
> +		.stepwise =3D {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
> +			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
> +	},

[Severity: Medium]
When a standard V4L2 application enumerates formats via VIDIOC_ENUM_FMT and
sees V4L2_PIX_FMT_MPEG4 in aml_s4_video_formats[], will it treat the device=
 as
a standard stateful decoder and omit the driver-private V4L2_CID_AML_MPEG4_=
REFS
control, causing all P-VOPs and B-VOPs to run with MP4_REF0 and MP4_REF1 set
to 0xffffffff?

Also, V4L2_CID_AML_MPEG4_REFS in drivers/media/platform/amlogic/vdec/mpeg4.h
uses an unreserved offset (V4L2_CID_USER_BASE + 0x1f00) in a driver-internal
header rather than a reserved base in include/uapi/linux/v4l2-controls.h.
Should this wait for a dedicated stateless pixel format and reserved control
IDs in the UAPI headers?

> diff --git a/drivers/media/platform/amlogic/vdec/mpeg4.c b/drivers/media/=
platform/amlogic/vdec/mpeg4.c
> new file mode 100644
> index 0000000000000..9cc97fa462091
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/mpeg4.c
[ ... ]
> +/* Returns the canvas spec (y | uv << 8 | uv << 16) for the buffer, or ~=
0. */
> +static u32 mpeg4_canvas_setup(struct aml_vdec_ctx *ctx,
> +			      struct mpeg4_canvas *c, struct vb2_buffer *vb)
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
Can mpeg4_canvas_setup() program the hardware to DMA out of bounds when a
2-plane capture format (V4L2_PIX_FMT_NV12M or V4L2_PIX_FMT_NV21M) is select=
ed,
or when the CAPTURE queue dimensions are smaller than the OUTPUT queue
dimensions?

In drivers/media/platform/amlogic/vdec/aml_vdec.c, set_pic_info() is only
called for the OUTPUT queue and hardcodes plane_num to 1:

drivers/media/platform/amlogic/vdec/aml_vdec.c:set_pic_info() {
	if (V4L2_TYPE_IS_OUTPUT(type)) {
		ctx->pic_info.output_pix_fmt =3D pix_mp->pixelformat;
		ctx->pic_info.coded_width =3D ALIGN(pix_mp->width, 64);
		ctx->pic_info.coded_height =3D ALIGN(pix_mp->height, 64);
		ctx->pic_info.fb_size[0] =3D
		    ctx->pic_info.coded_width * ctx->pic_info.coded_height;
		ctx->pic_info.fb_size[1] =3D ctx->pic_info.fb_size[0] / 2;
		ctx->pic_info.plane_num =3D 1;
	}
}

Because vdec_s_fmt_capture() never updates ctx->pic_info,
ctx->pic_info.plane_num > 1 is always false. When userspace configures NV12M
or NV21M (which mpeg4_restore_hw() explicitly checks for),
vb2ops_vdec_queue_setup() allocates plane 0 for luma only (w * h bytes), but
mpeg4_canvas_setup() sets uv =3D y + ctx->pic_info.fb_size[0] instead of re=
ading
plane 1, causing the VDEC hardware to DMA w * h / 2 bytes of chroma past the
end of plane 0.

Similarly, if VIDIOC_S_FMT on the CAPTURE queue configures smaller dimensio=
ns
than the OUTPUT queue, mpeg4_canvas_setup() still uses
ctx->pic_info.coded_width and ctx->pic_info.coded_height from the OUTPUT
format. Should mpeg4_canvas_setup() check vb->num_planes > 1 and use
ctx->pix_fmt[AML_FMT_DST] for the capture buffer dimensions and stride?

[ ... ]
> +static int mpeg4_prepare_input(struct aml_vdec_ctx *ctx,
> +			       struct vb2_v4l2_buffer *src)
> +{
> +	struct aml_vdec_hw *hw =3D vdec_get_hw(ctx->dev);
> +	struct aml_mpeg4_ctx *m =3D ctx->codec_priv;
> +	struct vb2_buffer *vb =3D &src->vb2_buf;
> +	u32 len =3D vb2_get_plane_payload(vb, 0);
> +	u32 need =3D len + MPEG4_TAIL + VLD_PADDING_SIZE + 64;
> +	u8 *p;
> +
> +	if (need > m->stage_size) {
> +		if (m->stage_vaddr)
> +			dma_free_coherent(hw->dev, m->stage_size,
> +					  m->stage_vaddr, m->stage_paddr);
> +		m->stage_size =3D PAGE_ALIGN(need + SZ_64K);
> +		m->stage_vaddr =3D dma_alloc_coherent(hw->dev, m->stage_size,
> +						    &m->stage_paddr, GFP_KERNEL);
> +		if (!m->stage_vaddr) {
> +			m->stage_size =3D 0;
> +			return -ENOMEM;
> +		}
> +	}
> +
> +	p =3D m->stage_vaddr;
> +	memcpy(p, vb2_plane_vaddr(vb, 0), len);
> +	/* The microcode only ends the VOP on the next start code. */
> +	p[len] =3D 0;
> +	p[len + 1] =3D 0;
> +	p[len + 2] =3D 1;
> +	p[len + 3] =3D 0xb6;
> +	memset(p + len + MPEG4_TAIL, 0, VLD_PADDING_SIZE);
[ ... ]
> +	regmap_write(hw->map[DOS_BUS], VIFF_BIT_CNT, len * 8);
> +
> +	return 0;
> +}

[Severity: High]
What happens in mpeg4_prepare_input() if userspace queues a V4L2_MEMORY_DMA=
BUF
buffer on the OUTPUT queue (which enables VB2_DMABUF in aml_vdec_queue_init=
())
and vb2_plane_vaddr(vb, 0) returns NULL because the exporter does not suppo=
rt
vmap or mapping fails? Passing the unchecked return value of
vb2_plane_vaddr(vb, 0) directly to memcpy() will dereference a NULL pointer,
unlike h264_stage_with_headers(), h265_feed(), and aml_vp9_feed() which che=
ck
for NULL first.

Also, can the 32-bit u32 calculations for need, PAGE_ALIGN(need + SZ_64K), =
and
len * 8 in VIFF_BIT_CNT overflow if a large plane payload is passed?

> +static void mpeg4_job_done(struct aml_vdec_ctx *ctx, enum vb2_buffer_sta=
te st)
> +{
> +	struct aml_vdec_dev *dev =3D ctx->dev;
> +
> +	mpeg4_canvas_free(dev->dec_hw, ctx->codec_priv);
> +	ctx->int_cond =3D 1;
> +	ctx->job_finished =3D true;
> +	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, st);
> +	wake_up(&ctx->queue);
> +}

[Severity: High]
Does calling v4l2_m2m_buf_done_and_job_finish() inside mpeg4_job_done() from
mpeg4_threaded_isr() finish the M2M job prematurely while aml_mpeg4_dec_run=
()
and m2mops_vdec_device_run() are still executing?

In drivers/media/platform/amlogic/vdec/aml_vdec.c, m2mops_vdec_device_run()
runs metadata copy and request completion after ctx->codec_ops->run(ctx)
returns:

drivers/media/platform/amlogic/vdec/aml_vdec.c:m2mops_vdec_device_run() {
	ctx->job_finished =3D false;
	ret =3D ctx->codec_ops->run(ctx);

	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
	if (src_req && ctx->curr_dec_type !=3D CODEC_TYPE_AV1 &&
	    ctx->curr_dec_type !=3D CODEC_TYPE_VP9 &&
	    ctx->curr_dec_type !=3D CODEC_TYPE_HEVC &&
	    ctx->curr_dec_type !=3D CODEC_TYPE_MJPEG)
		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);
	...
err_cancel_job:
	if (src_req && ctx->curr_dec_type !=3D CODEC_TYPE_AV1 &&
	    ctx->curr_dec_type !=3D CODEC_TYPE_VP9 &&
	    ctx->curr_dec_type !=3D CODEC_TYPE_HEVC &&
	    ctx->curr_dec_type !=3D CODEC_TYPE_MJPEG)
		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);

	if (!ctx->job_finished)
		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec,
						 ctx->m2m_ctx,
						 VB2_BUF_STATE_ERROR);
}

Because mpeg4_job_done() calls v4l2_m2m_buf_done_and_job_finish() in the IRQ
thread before waking ctx->queue, several problems arise:

1. Unlike AV1, VP9, HEVC, and MJPEG, CODEC_TYPE_MPEG4 does not call
   v4l2_ctrl_request_complete() before v4l2_m2m_buf_done_and_job_finish() a=
nd
   is not excluded in m2mops_vdec_device_run(). When an MPEG-4 request carr=
ies
   no controls (such as an I-VOP), src_buf is the only object in src_req, so
   v4l2_m2m_buf_done_and_job_finish() completes src_req and drops its
   reference. When aml_mpeg4_dec_run() returns, v4l2_ctrl_request_complete()
   attempts to bind to an already-completed (or freed) src_req, triggering a
   WARN_ON in media_request_object_bind() or a use-after-free. Conversely, =
if
   aml_mpeg4_dec_run() fails with -ENOMEM or -ETIMEDOUT before setting
   ctx->job_finished, m2mops_vdec_device_run() calls
   v4l2_ctrl_request_complete() twice on src_req (once after run() and agai=
n at
   err_cancel_job).

2. dst_buf is marked done and placed on done_list before
   v4l2_m2m_buf_copy_metadata(src_buf, dst_buf) runs, so userspace VIDIOC_D=
QBUF
   and subsequent mpeg4_ref_spec() -> vb2_find_buffer() lookups can see dst=
_buf
   before its timestamp and copied_timestamp flag are set.

3. v4l2_m2m_buf_done_and_job_finish() finishes the M2M job and wakes
   v4l2_m2m_cancel_job() (or schedules the next M2M job) before
   aml_mpeg4_dec_run() executes ctx->int_cond =3D 0 and aml_stop_vdec_hw(hw=
), and
   before mpeg4_threaded_isr() clears MP4_BUFFEROUT. A concurrent
   VIDIOC_STREAMOFF or close() can free m in aml_mpeg4_exit() and ctx in
   fops_vcodec_release() while aml_mpeg4_dec_run() and
   m2mops_vdec_device_run() are still accessing them, or the next job can s=
tart
   while aml_stop_vdec_hw(hw) is still halting the hardware.

[ ... ]
> +static irqreturn_t mpeg4_threaded_isr(int irq, void *priv)
> +{
> +	struct aml_vdec_dev *dev =3D priv;
> +	struct aml_vdec_hw *hw =3D dev->dec_hw;
> +	struct aml_mpeg4_ctx *m =3D hw->curr_ctx;
> +	struct aml_vdec_ctx *ctx;
> +	u32 reg;
> +
> +	if (!m)
> +		return IRQ_HANDLED;
> +	ctx =3D m->v4l2_ctx;
> +	if (ctx->job_finished)
> +		return IRQ_HANDLED;
> +
> +	/* Picture size report: the buffers are already set up, go on. */
> +	if (read_dos_reg(hw, MP4_PIC_INFO) =3D=3D 1) {
> +		dev_dbg(hw->dev, "mpeg4 size %ux%u\n",
> +			read_dos_reg(hw, MP4_PIC_WH) >> 16,
> +			 read_dos_reg(hw, MP4_PIC_WH) & 0xffff);
> +		regmap_write(hw->map[DOS_BUS], MP4_PIC_INFO, 0);
> +		return IRQ_HANDLED;
> +	}

[Severity: Critical]
When the microcode parses the VOL header on the first frame and reports the
bitstream dimensions via MP4_PIC_INFO =3D=3D 1, what prevents a bitstream w=
ith
dimensions in MP4_PIC_WH larger than the negotiated capture buffer (or larg=
er
than the 1080p workspace limit) from overflowing the capture buffer via DMA?

In mpeg4_threaded_isr(), MP4_PIC_INFO is cleared to resume decoding without
checking MP4_PIC_WH against ctx->pix_fmt[AML_FMT_DST] (unlike
mjpeg_threaded_isr(), which checks w > pf->plane_fmt[0].bytesperline ||
h > pf->height and aborts the job with VB2_BUF_STATE_ERROR), and
mpeg4_save_hw_context() saves that unvalidated MP4_PIC_WH into m->reg_pic_wh
for subsequent frames.

[ ... ]
> +void aml_mpeg4_exit(void *priv)
> +{
> +	struct aml_vdec_ctx *ctx =3D priv;
> +	struct aml_mpeg4_ctx *m =3D ctx->codec_priv;
> +	struct aml_vdec_hw *hw;
> +
> +	if (!m)
> +		return;
> +	hw =3D vdec_get_hw(ctx->dev);
> +
> +	if (ctx->dos_clk_en)
> +		aml_stop_vdec_hw(hw);
> +	mpeg4_canvas_free(hw, m);
> +
> +	if (m->stage_vaddr)
> +		dma_free_coherent(hw->dev, m->stage_size,
> +				  m->stage_vaddr, m->stage_paddr);
> +	dma_free_coherent(hw->dev, MPEG4_WORKSPACE_SIZE,
> +			  m->wks_vaddr, m->wks_paddr);
> +
> +	if (hw->curr_ctx =3D=3D m)
> +		hw->curr_ctx =3D NULL;
> +	kfree(m);
> +	ctx->codec_priv =3D NULL;
> +}
> +
> +int aml_mpeg4_dec_run(void *priv)
> +{
> +	struct aml_vdec_ctx *ctx =3D priv;
> +	struct aml_mpeg4_ctx *m =3D ctx->codec_priv;
> +	struct aml_vdec_hw *hw =3D vdec_get_hw(ctx->dev);
> +	struct v4l2_ctrl *refs_ctrl;
> +	struct vb2_v4l2_buffer *src, *dst;
> +	u32 rec, ref0 =3D 0xffffffff, ref1 =3D 0xffffffff;
> +	u64 fwd =3D 0, bwd =3D 0;
> +	long ret;
> +
> +	src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	if (!src || !dst)
> +		return -EINVAL;
> +
> +	refs_ctrl =3D v4l2_ctrl_find(&ctx->ctrl_handler, V4L2_CID_AML_MPEG4_REF=
S);
> +	if (refs_ctrl) {
> +		fwd =3D refs_ctrl->p_cur.p_s64[0];
> +		bwd =3D refs_ctrl->p_cur.p_s64[1];
> +	}
> +
> +	hw->curr_ctx =3D m;
> +	hw->hw_ops.irq_handler =3D mpeg4_isr;
> +	hw->hw_ops.irq_threaded_func =3D mpeg4_threaded_isr;
> +
> +	if (mpeg4_prepare_input(ctx, src) < 0)
> +		return -ENOMEM;

[Severity: High]
Can ctx->codec_priv (m) be NULL when aml_mpeg4_dec_run() is called?

In drivers/media/platform/amlogic/vdec/aml_vdec.c, vb2ops_vdec_start_stream=
ing()
only calls aml_vdec_init_dec_inst() -> aml_mpeg4_init() when starting the
OUTPUT queue, whereas vb2ops_vdec_stop_streaming() calls
aml_vdec_release_instance() -> aml_mpeg4_exit() when stopping either queue.=
 If
userspace stops and restarts the CAPTURE queue while the OUTPUT queue remai=
ns
streaming, ctx->codec_priv is NULL and mpeg4_prepare_input() and
mpeg4_restore_hw() will dereference a NULL pointer.

> +
> +	mpeg4_restore_hw(ctx);
> +
> +	rec =3D mpeg4_canvas_setup(ctx, &m->canvas[0], &dst->vb2_buf);
> +	if (rec =3D=3D ~0u)
> +		goto fail;
> +
> +	/*
> +	 * REF0 is the older anchor, REF1 the newer one; a P-VOP predicts from
> +	 * REF1, a B-VOP from both.  0 means "none" in the control.
> +	 */
> +	if (fwd && bwd) {
> +		ref0 =3D mpeg4_ref_spec(ctx, &m->canvas[1], fwd);
> +		ref1 =3D mpeg4_ref_spec(ctx, &m->canvas[2], bwd);
> +	} else if (fwd) {
> +		ref1 =3D mpeg4_ref_spec(ctx, &m->canvas[2], fwd);
> +		ref0 =3D ref1;
> +	}
> +	regmap_write(hw->map[DOS_BUS], MP4_REF0, ref0);
> +	regmap_write(hw->map[DOS_BUS], MP4_REF1, ref1);

[Severity: High]
If vb2_find_buffer() does not find the requested timestamp in mpeg4_ref_spe=
c(),
if meson_canvas_alloc() fails while setting up a reference canvas, or if a
P-VOP or B-VOP is submitted with fwd =3D=3D 0, ref0 and ref1 remain 0xfffff=
fff
(~0u). Won't writing 0xffffffff to MP4_REF0 and MP4_REF1 cause the hardware=
 to
fetch motion-compensation reference data from unallocated DMC canvas 0xff
instead of failing the job or falling back to rec?

[ ... ]
> +	ret =3D wait_event_timeout(ctx->queue, ctx->int_cond,
> +				 msecs_to_jiffies(MPEG4_TIMEOUT_MS));
> +	ctx->int_cond =3D 0;
> +	if (!ret) {
> +		dev_err(hw->dev,
> +			"mpeg4 timeout: out %x info %x pc %x lvl %x rp %x wp %x bitcnt %x err=
 %x\n",
> +			read_dos_reg(hw, MP4_BUFFEROUT),
> +			read_dos_reg(hw, MP4_PIC_INFO),
> +			read_dos_reg(hw, MPC_E),
> +			read_dos_reg(hw, VLD_MEM_VIFIFO_LEVEL),
> +			read_dos_reg(hw, VLD_MEM_VIFIFO_RP),
> +			read_dos_reg(hw, VLD_MEM_VIFIFO_WP),
> +			read_dos_reg(hw, VIFF_BIT_CNT),
> +			read_dos_reg(hw, MP4_ERR_COUNT));
> +		aml_stop_vdec_hw(hw);
> +		mpeg4_canvas_free(hw, m);
> +		return -ETIMEDOUT;
> +	}

[Severity: High]
Can the timeout path in aml_mpeg4_dec_run() and the teardown path in
aml_mpeg4_exit() race with mpeg4_threaded_isr()?

If the interrupt fires right as wait_event_timeout() expires, mpeg4_isr() w=
akes
mpeg4_threaded_isr(). Because the timeout path does not mask
VDEC_ASSIST_MBOX1_MASK or call synchronize_irq(hw->dec_irq) before running
mpeg4_canvas_free(hw, m) and returning -ETIMEDOUT, mpeg4_threaded_isr() can=
 run
concurrently on another CPU:

1. Both mpeg4_job_done() and the timeout path call mpeg4_canvas_free(hw, m)
   without locking, reading m->canvas[i].y >=3D 0 and m->canvas[i].uv >=3D =
0 before
   the other sets them to -1 and calling meson_canvas_free() twice on the s=
ame
   canvas indices.

2. Concurrently, mpeg4_job_done() sets ctx->job_finished =3D true and calls
   v4l2_m2m_buf_done_and_job_finish() while m2mops_vdec_device_run() takes =
the
   err_cancel_job path and also calls v4l2_m2m_buf_done_and_job_finish().

3. In aml_mpeg4_exit(), VDEC_ASSIST_MBOX1_MASK is not cleared and
   synchronize_irq(hw->dec_irq) is not called before freeing m->stage_vaddr,
   m->wks_vaddr, and m itself, so an in-flight mpeg4_threaded_isr() that
   already read m =3D hw->curr_ctx can dereference m after kfree(m).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025192507.2100=
58-1-christian.koever-draxl@student.uibk.ac.at?part=3D10
