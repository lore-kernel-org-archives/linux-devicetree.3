Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792959632;
	b=1YHmZvjqsw17tqly0tvj7x9ncIkTEzHTQFOB/7BEr9QL48obHtRd9hGs1g6KtNPnXAgS
	 OMNFXOJKGnTVrxTIjg7LL2lYXra0WFIucJHNNh/GKy3wHNOr3eTBGPJ7lPefHHz0DhzA8
	 QdmQ4OA8J2BetSULiB5ApZAwdlLGxxicRMhxqzjZR9B1QRDtW3OUxtnOn/BAbcEFFDYcs
	 kWalioKgopfFAlYOa5rasrn/Vn/fIf0rpFxP3hbrQ3fcjLcsvI1ohicvH4VkC1Xmvo3FB
	 tPY9STFne+rpu0sAxgzU/xjh5k61zJHeCcDqb0nfcflRHR3CLPFf5eJwk5mpo2YXV9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792959632;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=a6ID5KbPS/BRNEZ6zLJ+woYlbHCfaSSspsSq71F42t4=;
	b=afXVA6xq10nyNnI8L9FpY4m8EkyyAuIjAkp2jZsJevLwytcCoQd5rQLQvE+/ycVJ+4O8
	 qwMLAcKozSYi5mkS7OJTlnhl3EBI23Pq4Lg1KNb+S8+KDWt+VJJg/owzVb63ZIQyGVDT4
	 22WchLyGMGX5Wn5S9j8F4fn4vf/XdsNs1aZ5VxPcnuAxRT1jxC3H9k3dLjokys4J26tp+
	 ukvY5PzrNZT6mK9TjHR0CCH9Q/wLOM/Rvl5elSr2Ji20+78D7GxhIihp0L16Ra654087W
	 guEXiAVX2MoP1AJrM02F3RreMQwiI8PdTdGB0MJpbdt3YZRewX8L97+c5BEqTQoibxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=St8WrRpa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F90E606A321
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 20:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=St8WrRpa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F10F1F01829;
	Sun, 25 Oct 2026 20:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792959631;
	bh=a6ID5KbPS/BRNEZ6zLJ+woYlbHCfaSSspsSq71F42t4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=St8WrRpa2N/NV5xxOqbiSI4dvDAK32/XsUiNqS1L7uQBhhkY911yn9ACzcjj5Tmgw
	 f536r5oS1u07snK5eHGQGU92hENkFb33jaBVoVC7FikV2Ykbva+xIl3CLUDE7B1seQ
	 3XQmKf1bjXPEwKeMsSA/qzzTWLtLqMaC868cNFzH9uOLBnc9JZzaO0Ym7/UrFa5mUP
	 ApAyUkB9IanO0IRSM1uYi2fNJHFdy720Gn/6QJ4H4eKv9IJTwfQbzNAiI+LUBmFzUJ
	 dHB8qkdPUS8Tbi1Sx/yjibxJ9qwSIKVsddRURdQ2LNyxwfPNpZ0B/lPKuXrNXzFV7F
	 oMX0m5NTO2opQ==
Message-ID: <sashiko-outbox-184422@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/11] media: amlogic: vdec: add MJPEG decoding
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261025192507.210058-7-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192507.210058-7-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 20:20:31 +0000
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
- [Critical] media: amlogic: vdec: premature M2M job completion in mjpeg_jo=
b_done()
- [Critical] media: amlogic: vdec: unsynchronized teardown and HW stop in a=
ml_mjpeg_exit()
- [High] media: amlogic: vdec: timeout race with IRQ thread in aml_mjpeg_de=
c_run()
- [High] media: amlogic: vdec: NULL dereference on vb2_plane_vaddr() in mjp=
eg.c
- [Medium] media: amlogic: vdec: missing V4L2_PIX_FMT_MJPEG in aml_s4_video=
_formats
- [Medium] media: amlogic: vdec: unrestricted CAPTURE formats for MJPEG neg=
otiation
--

commit 03dd48f8ca05ff47abd88fc4288b36619393b97e
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

media: amlogic: vdec: add MJPEG decoding

This commit adds Motion-JPEG decoding support on the Amlogic legacy VDEC
core, including format registration, firmware table entry, and the MJPEG
codec implementation.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c b/dr=
ivers/media/platform/amlogic/vdec/aml_vdec_platform.c
> index 83efadcb8aeff..d54b09b6bbc02 100644
> --- a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
> @@ -7,6 +7,7 @@
>  #include "aml_vdec_hw.h"
>  #include "h264.h"
>  #include "mpeg12.h"
> +#include "mjpeg.h"
> =20
>  static struct aml_video_fmt aml_s4_video_formats[] =3D {
>  	{
> @@ -31,6 +32,17 @@ static struct aml_video_fmt aml_s4_video_formats[] =3D=
 {
>  		.stepwise =3D {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
>  			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
>  	},
> +	{
> +		.name =3D "JPEG",
> +		.fourcc =3D V4L2_PIX_FMT_JPEG,
> +		.type =3D AML_FMT_DEC,
> +		.align =3D 64,
> +		.is_10_bit_support =3D 0,
> +		.codec_type =3D CODEC_TYPE_MJPEG,
> +		.num_planes =3D 1,
> +		.stepwise =3D {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
> +			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
> +	},

[Severity: Medium]
The commit description states that this patch decodes V4L2_PIX_FMT_MJPEG
frames, and mjpeg.c describes Motion-JPEG decoding, but aml_s4_video_formats
only registers V4L2_PIX_FMT_JPEG.

Because aml_vdec_get_video_fmt() in drivers/media/platform/amlogic/vdec/aml=
_vdec.c
matches strictly on fmt->fourcc =3D=3D format:

    for (k =3D 0; k < dev->pvdec_data->num_fmts; k++) {
        fmt =3D &dev->pvdec_data->dec_fmt[k];
        if (fmt->fourcc =3D=3D format)
            return fmt;
    }

clients requesting V4L2_PIX_FMT_MJPEG via VIDIOC_ENUM_FMT,
VIDIOC_ENUM_FRAMESIZES, or VIDIOC_S_FMT will not find the format, and
vdec_s_fmt_output() will fall back to the default H.264 format.

Also, the commit message mentions that the planar 4:2:0 CAPTURE format is
exposed by this patch, whereas V4L2_PIX_FMT_YUV420 was already present in
aml_s4_video_formats from commit a516ebbbab5a.

Should V4L2_PIX_FMT_MJPEG be added to aml_s4_video_formats as well?

[ ... ]

> diff --git a/drivers/media/platform/amlogic/vdec/mjpeg.c b/drivers/media/=
platform/amlogic/vdec/mjpeg.c
> new file mode 100644
> index 0000000000000..7989b5f42a563
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/mjpeg.c
> @@ -0,0 +1,471 @@

[ ... ]

> +static void mjpeg_job_done(struct aml_vdec_ctx *ctx, enum vb2_buffer_sta=
te st)
> +{
> +	struct aml_vdec_dev *dev =3D ctx->dev;
> +	struct vb2_v4l2_buffer *dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	struct vb2_v4l2_buffer *src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +
> +	/*
> +	 * A JPEG request carries no controls, so the buffer is its only
> +	 * object: once that is done the request is complete, and completing
> +	 * the control side afterwards (as device_run does for the other
> +	 * legacy codecs) binds to a finished request and WARNs.  Do it first.
> +	 */
> +	if (src && src->vb2_buf.req_obj.req)
> +		v4l2_ctrl_request_complete(src->vb2_buf.req_obj.req,
> +					   &ctx->ctrl_handler);
> +	mjpeg_canvas_free(dev->dec_hw, ctx->codec_priv);
> +	if (dst)
> +		vb2_set_plane_payload(&dst->vb2_buf, 0,
> +				      ctx->pix_fmt[AML_FMT_DST].plane_fmt[0].sizeimage);
> +	ctx->int_cond =3D 1;
> +	ctx->job_finished =3D true;
> +	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, st);
> +	wake_up(&ctx->queue);
> +}

[Severity: Critical]
Does calling v4l2_m2m_buf_done_and_job_finish() here in
mjpeg_threaded_isr() -> mjpeg_job_done() while aml_mjpeg_dec_run() is still
sleeping in wait_event_timeout() cause use-after-free and hardware races?

When m2mops_vdec_device_run() in drivers/media/platform/amlogic/vdec/aml_vd=
ec.c
runs a job:

    ctx->job_finished =3D false;
    ret =3D ctx->codec_ops->run(ctx);

    v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);

completing the M2M job inside mjpeg_job_done() before aml_mjpeg_dec_run()
wakes up and stops the hardware creates several issues:

1. v4l2_m2m_buf_done_and_job_finish() returns src_buf and dst_buf to vb2 and
wakes userspace poll() / VIDIOC_DQBUF waiters before aml_mjpeg_dec_run()
returns to m2mops_vdec_device_run() to call
v4l2_m2m_buf_copy_metadata(src_buf, dst_buf). Userspace can dequeue dst_buf
without its copied timestamp, field, timecode, or flags, or re-queue/free
the buffers before v4l2_m2m_buf_copy_metadata() touches them.

2. v4l2_m2m_buf_done_and_job_finish() clears TRANS_RUNNING and schedules the
next M2M job via v4l2_m2m_schedule_next_job(). A subsequent job can enter
m2mops_vdec_device_run() on another CPU, set ctx->int_cond =3D 0, and call
aml_start_vdec_hw(hw) before the previous job's aml_mjpeg_dec_run() finishes
waking up and executes ctx->int_cond =3D 0 and aml_stop_vdec_hw(hw), stoppi=
ng
and resetting the VDEC hardware mid-decode.

3. Because v4l2_m2m_cancel_job() only waits for TRANS_RUNNING to be cleared,
a concurrent VIDIOC_STREAMOFF or fops_vcodec_release() can proceed into
vb2ops_vdec_stop_streaming() -> aml_mjpeg_exit() (freeing m) and kfree(ctx)
while the job thread is still executing ctx->int_cond =3D 0,
aml_stop_vdec_hw(hw), and m2mops_vdec_device_run().

4. mjpeg_canvas_free() releases the DMC canvases and v4l2_m2m_buf_done()
invalidates CPU caches for the capture buffer before aml_stop_vdec_hw(hw)
stops the AMRISC processor and waits for LMEM_DMA_CTRL and WRRSP_LMEM writes
to drain.

Should aml_mjpeg_dec_run() stop the hardware after wait_event_timeout()
before the canvases are freed and the M2M job is finished?

[ ... ]

> +void aml_mjpeg_exit(void *priv)
> +{
> +	struct aml_vdec_ctx *ctx =3D priv;
> +	struct aml_mjpeg_ctx *m =3D ctx->codec_priv;
> +	struct aml_vdec_hw *hw;
> +
> +	if (!m)
> +		return;
> +	hw =3D vdec_get_hw(ctx->dev);
> +
> +	if (ctx->dos_clk_en)
> +		aml_stop_vdec_hw(hw);
> +	mjpeg_canvas_free(hw, m);
> +	if (m->stage_vaddr)
> +		dma_free_coherent(hw->dev, m->stage_size,
> +				  m->stage_vaddr, m->stage_paddr);
> +
> +	if (hw->curr_ctx =3D=3D m)
> +		hw->curr_ctx =3D NULL;
> +	kfree(m);
> +	ctx->codec_priv =3D NULL;
> +}

[Severity: Critical]
Can aml_mjpeg_exit() reset the shared VDEC core while another context is
decoding, or free m while mjpeg_threaded_isr() is still running?

First, ctx->dos_clk_en is set to 1 in m2mops_vdec_device_run() on the first
job and is never cleared. In aml_mjpeg_exit(), aml_stop_vdec_hw(hw) is
called whenever ctx->dos_clk_en is set, without checking if
hw->curr_ctx =3D=3D m. If userspace calls VIDIOC_STREAMOFF or closes an idle
MJPEG context while another VDEC context is actively decoding on the shared
hardware, aml_stop_vdec_hw(hw) will halt the AMRISC processor and reset the
core mid-frame.

Second, aml_mjpeg_exit() clears hw->curr_ctx and immediately calls kfree(m)
without masking VDEC_ASSIST_MBOX1_MASK or calling
synchronize_irq(hw->dec_irq). If mjpeg_threaded_isr() is in flight and has
already read m =3D hw->curr_ctx (for example, right after a timeout or job
completion), can it dereference m and m->v4l2_ctx after kfree(m)?

> +
> +int aml_mjpeg_dec_run(void *priv)
> +{
> +	struct aml_vdec_ctx *ctx =3D priv;
> +	struct aml_mjpeg_ctx *m =3D ctx->codec_priv;
> +	struct aml_vdec_hw *hw =3D vdec_get_hw(ctx->dev);
> +	struct vb2_v4l2_buffer *src, *dst;
> +	u32 spec;
> +	long ret;
> +
> +	if (ctx->pix_fmt[AML_FMT_DST].pixelformat !=3D V4L2_PIX_FMT_YUV420) {
> +		dev_err(hw->dev, "mjpeg: capture format must be YUV420\n");
> +		return -EINVAL;
> +	}

[Severity: Medium]
What happens during format negotiation when userspace configures MJPEG on t=
he
OUTPUT queue?

In drivers/media/platform/amlogic/vdec/aml_vdec.c:

1. vidioc_vdec_enum_fmt() enumerates all AML_FMT_FRAME formats (NV21M, NV21,
NV12M, YUV420, NV12) on the CAPTURE queue regardless of the selected OUTPUT
codec.

2. vdec_s_fmt_output() copies the OUTPUT pix_mp into ctx->pix_fmt[AML_FMT_D=
ST]
and leaves ctx->dec_fmt[AML_FMT_DST] at its initial default of
V4L2_PIX_FMT_NV12 instead of updating the CAPTURE format to
V4L2_PIX_FMT_YUV420:

    ret =3D vdec_try_fmt_mp(ctx, f->type, pix_mp);
    set_pic_info(ctx, pix_mp, f->type);

    ctx->pix_fmt[AML_FMT_SRC] =3D *pix_mp;
    ctx->pix_fmt[AML_FMT_DST] =3D *pix_mp;

3. vdec_s_fmt_capture() accepts NV12, NV21, NV12M, or NV21M when the OUTPUT
format is JPEG (and accepts YUV420 when the OUTPUT format is H.264 or
MPEG-2), so buffer allocation and VIDIOC_STREAMON succeed and only fail
later here in aml_mjpeg_dec_run() with -EINVAL.

Should VIDIOC_ENUM_FMT, vdec_s_fmt_output(), and vdec_s_fmt_capture()
restrict and default the CAPTURE format to V4L2_PIX_FMT_YUV420 when the
OUTPUT codec is CODEC_TYPE_MJPEG?

> +
> +	src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	if (!src || !dst)
> +		return -EINVAL;
> +
> +	if (!mjpeg_supported(hw->dev, vb2_plane_vaddr(&src->vb2_buf, 0),
> +			     vb2_get_plane_payload(&src->vb2_buf, 0)))
> +		return -EINVAL;

[Severity: High]
Can vb2_plane_vaddr(&src->vb2_buf, 0) return NULL here and in
mjpeg_prepare_input()?

In aml_vdec_queue_init(), the OUTPUT queue is configured with
io_modes =3D VB2_MMAP | VB2_DMABUF and mem_ops =3D &vb2_dma_contig_memops. =
When
userspace queues a VB2_MEMORY_DMABUF buffer whose exporter does not impleme=
nt
vmap or when dma_buf_vmap_unlocked() fails, vb2_plane_vaddr() returns NULL
(unlike h264_stage_with_headers() in h264.c, which checks for a NULL
virtual address).

When vb2_plane_vaddr() returns NULL and the payload length is at least 4,
mjpeg_supported() will dereference p[0]:

    if (len < 4 || p[0] !=3D 0xff || p[1] !=3D 0xd8)
        return false;

and mjpeg_prepare_input() also calls vb2_plane_vaddr(vb, 0) without a NULL
check before reading in[3].

> +
> +	hw->curr_ctx =3D m;
> +	hw->hw_ops.irq_handler =3D mjpeg_isr;
> +	hw->hw_ops.irq_threaded_func =3D mjpeg_threaded_isr;
> +
> +	if (mjpeg_prepare_input(ctx, src) < 0)
> +		return -ENOMEM;
> +
> +	spec =3D mjpeg_canvas_setup(ctx, &dst->vb2_buf);
> +	if (spec =3D=3D ~0u)
> +		return -ENOMEM;
> +	mjpeg_restore_hw(ctx, spec);
> +
> +	dev_dbg(hw->dev, "mjpeg run %lu bytes spec %06x\n",
> +		vb2_get_plane_payload(&src->vb2_buf, 0), spec);
> +
> +	ctx->int_cond =3D 0;
> +	regmap_update_bits(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CONTROL, 0x6, 0x6);
> +	aml_start_vdec_hw(hw);
> +
> +	ret =3D wait_event_timeout(ctx->queue, ctx->int_cond,
> +				 msecs_to_jiffies(MJPEG_TIMEOUT_MS));
> +	ctx->int_cond =3D 0;
> +	if (!ret) {
> +		dev_err(hw->dev,
> +			"mjpeg timeout: status %x from %x pc %x lvl %x rp %x wp %x bitcnt %x\=
n",
> +			read_dos_reg(hw, MJPEG_DEC_STATUS),
> +			read_dos_reg(hw, MJPEG_FROM_AMRISC),
> +			read_dos_reg(hw, MPC_E),
> +			read_dos_reg(hw, VLD_MEM_VIFIFO_LEVEL),
> +			read_dos_reg(hw, VLD_MEM_VIFIFO_RP),
> +			read_dos_reg(hw, VLD_MEM_VIFIFO_WP),
> +			read_dos_reg(hw, VIFF_BIT_CNT));
> +		aml_stop_vdec_hw(hw);
> +		mjpeg_canvas_free(hw, m);
> +		return -ETIMEDOUT;
> +	}

[Severity: High]
If wait_event_timeout() expires just as the VDEC interrupt fires and
mjpeg_threaded_isr() runs on another CPU, can the timeout path race with
mjpeg_job_done()?

On timeout, aml_mjpeg_dec_run() does not mask VDEC_ASSIST_MBOX1_MASK, call
synchronize_irq(hw->dec_irq), clear hw->curr_ctx, or set
ctx->job_finished =3D true before stopping the hardware and freeing the
canvases.

As a result:

1. Both mjpeg_threaded_isr() -> mjpeg_job_done() and the timeout path call
mjpeg_canvas_free(hw, m) without locking:

    for (i =3D 0; i < ARRAY_SIZE(m->canvas); i++) {
        if (m->canvas[i] >=3D 0)
            meson_canvas_free(hw->canvas, m->canvas[i]);
        m->canvas[i] =3D -1;
    }

Because m->canvas[i] is only set to -1 after meson_canvas_free() returns,
both threads can free the same canvas indices concurrently.

2. When aml_mjpeg_dec_run() returns -ETIMEDOUT to m2mops_vdec_device_run() =
in
drivers/media/platform/amlogic/vdec/aml_vdec.c:

    if (ret < 0 && !ctx->job_finished)
        goto err_cancel_job;
    ...
err_cancel_job:
    if (src_req)
        v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);
    v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
                                     VB2_BUF_STATE_ERROR);

m2mops_vdec_device_run() checks !ctx->job_finished without synchronization
against mjpeg_threaded_isr(), so both mjpeg_job_done() and err_cancel_job c=
an
call v4l2_ctrl_request_complete() and v4l2_m2m_buf_done_and_job_finish() for
the same job.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025192507.2100=
58-1-christian.koever-draxl@student.uibk.ac.at?part=3D6
