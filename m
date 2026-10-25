Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792959908;
	b=yxrPBDeDh4SjraP7X8fuCcPDkEUflnBGavqaNmzFT+KkL+6Zon3QR2YsjjZUOb+VcfCB
	 3xpML4kpzq6WSbHwfsV2gOwsfPSh1Kd0pMJfcnniYjbLs7uoZ8IEzg5czpYmfKLG8lYJA
	 FMXJGmmpueFXcPUqSS1d4m3KoviiAlchhVGiBpWLBgUPFnxGfXqaNHZx6XB+hp/GQcOux
	 NOIrb7NSGv77VTr370Q8CdJwoMLQqEVpMd6Dx9Oks93QuLwpYOrh4RC0L6s/VXBeC3pnh
	 7vLlzZxP9RH8j2gqcFuOPzJvxYLrx74W4P3D08bcWew3aMnIkafCbVsrSjIJcj/Gcjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792959908;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=USYuB/iBceDIalfx+LjzGa77rMhT1KTwAJc4vA2wHXE=;
	b=R9VY5pwSLwf+d14YBjMMULo9K7/sJHOgRZFD4d66r5o2dmDLvBlEdqQUpDbBukL4xSNj
	 ZYnBfIdddGImc1t1zNEG66j/8WSY78Ws3GbjNR9SvDtR0CcpcIj0BbCAVmMqdj/MI4QsS
	 c80J3Z2CESVQRFhYLN3QZb2V7lXyjWZehE8YnYzzEIdP7XZoxx+Ye13utHtBGTolu1vGE
	 VkHQVpS9m/5Df5SepQRhBNzK3ryDCgJOpbhg3kBxyinA8cXw+xzCtbbex4wFQc6TzLswI
	 9osv9DYOo3kEMjIGtbUP07fRU056YkJpAT6r3Ax3RrZ4OBtVQo1G8Vv5SR36UUkB/jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o0DPu1SI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31FC606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o0DPu1SI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C561F01825;
	Sun, 25 Oct 2026 20:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792959907;
	bh=USYuB/iBceDIalfx+LjzGa77rMhT1KTwAJc4vA2wHXE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o0DPu1SIDkfsib7EwlJKstPA2wxgPwWrDoOcBat6HIqQuP5DaGS0dvSb1xRsVFe0W
	 +242r6wKGr2oxCfQhJAFptcXSDgWdkAHAbzBuQJrJT55e3EPPpRR/Un3Fvldm4d6ez
	 zvsFmpwdNOyxndOyfmSB7fAhezIO9UIJUDsCQy9Ct6YDKnr6I9+0FCGPHoryqKSYDR
	 XZAkzUS7AloltdBYfYhWj3tp5qDqFCKCWkkJcXo5b5P5R0InbEQEgneTzr5/6sY8Os
	 0YygUcom8oHdSgLEzuNwyOdLASbJiDZECaIMwWGGkQQURi/fg7bnGftW1i1N2/JC+7
	 y6NnZ6RGCSGiA==
Message-ID: <sashiko-outbox-184425@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/11] media: amlogic: vdec: fix the microcode loading
 and prepare the HEVC core
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261025192507.210058-4-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192507.210058-4-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 20:25:06 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] media: amlogic: vdec: broken src_req error handling in m2mops_vdec=
_device_run()
- [High] media: amlogic: vdec: metadata copy and request completion after j=
ob finish
- [High] media: amlogic: vdec: unbalanced hvdec_enable() and stale hevc_fw =
on poweroff
- [High] media: amlogic: vdec: premature IRQ registration and race in hevc_=
irq_thread()
- [Medium] media: amlogic: vdec: V4L2_PIX_FMT_YUV420 exposed to non-MJPEG c=
odecs
- [Medium] media: amlogic: vdec: DMA direction mismatch in aml_vdec_dst_cpu=
_written()
- [Low] media: amlogic: vdec: undocumented hevcf_rate module parameter
--

commit a516ebbbab5a6b016789fa31a24a5ab176743824
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

media: amlogic: vdec: fix the microcode loading and prepare the HEVC core

This commit fixes TEE microcode loading by preserving the 256-byte signature
header and issuing SYS_BOOT_COMPLETE before the first load. It also adds
power domain, clock, reset, IRQ, and request handling preparation for the
HEVC core.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.c b/drivers/med=
ia/platform/amlogic/vdec/aml_vdec.c
> index d4dcd0180d2d0..2a5ff842fd39c 100644
> --- a/drivers/media/platform/amlogic/vdec/aml_vdec.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c

[ ... ]

> @@ -130,23 +129,46 @@ static void m2mops_vdec_device_run(void *m2m_priv)
>  	/* incase of bus hang in stop_streaming */
>  	ctx->dos_clk_en =3D 1;
> =20
> -	if (ctx->curr_dec_type =3D=3D CODEC_TYPE_H264)
> +	if (ctx->curr_dec_type =3D=3D CODEC_TYPE_H264 ||
> +	    ctx->curr_dec_type =3D=3D CODEC_TYPE_MPEG2 ||
> +	    ctx->curr_dec_type =3D=3D CODEC_TYPE_MJPEG ||
> +	    ctx->curr_dec_type =3D=3D CODEC_TYPE_MPEG4)
>  		aml_vdec_reset_core(dev->dec_hw);
> =20
>  	if (load_firmware(dev->dec_hw, ctx->curr_dec_type) < 0)
>  		goto err_cancel_job;
> =20
> +	ctx->job_finished =3D false;
>  	ret =3D ctx->codec_ops->run(ctx);
> =20
>  	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> -	if (src_req)
> +	/*
> +	 * AV1 completes the request itself, in its interrupt handler, before
> +	 * the buffer is done - by the time run() returns here the job has
> +	 * already finished and the request with it.
> +	 */
> +	if (src_req && ctx->curr_dec_type !=3D CODEC_TYPE_AV1 &&
> +	    ctx->curr_dec_type !=3D CODEC_TYPE_VP9 &&
> +	    ctx->curr_dec_type !=3D CODEC_TYPE_HEVC &&
> +	    ctx->curr_dec_type !=3D CODEC_TYPE_MJPEG)
>  		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);

[Severity: High]
Isn't calling v4l2_m2m_buf_copy_metadata(src_buf, dst_buf) and
v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler) after
ctx->codec_ops->run(ctx) too late in the buffer lifecycle?

Every codec's ->run() callback waits synchronously for the decode to finish
and calls v4l2_m2m_buf_done_and_job_finish() (either in its threaded ISR,
such as h264_threaded_isr_func(), or directly in aml_mpeg12_dec_run() when
stashing the first field of an interlaced pair) before returning to
m2mops_vdec_device_run().

Because v4l2_m2m_buf_copy_metadata() runs after
v4l2_m2m_buf_done_and_job_finish():

1. For non-held capture buffers, v4l2_m2m_buf_done_and_job_finish() marks
   dst_buf done via vb2_buffer_done() and wakes VIDIOC_DQBUF before
   dst_buf->vb2_buf.timestamp, dst_buf->field, dst_buf->flags, and
   dst_buf->vb2_buf.copied_timestamp are copied from src_buf, mutating
   dst_buf after it has already been returned to videobuf2/userspace.

2. With VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF enabled in
   aml_vdec_queue_init(), the call chain:

   v4l2_m2m_buf_done_and_job_finish()
     -> v4l2_m2m_schedule_next_job()
       -> __v4l2_m2m_try_queue()

   checks dst->vb2_buf.copied_timestamp and compares dst->vb2_buf.timestamp
   against src->vb2_buf.timestamp before v4l2_m2m_buf_copy_metadata() has
   updated dst_buf. When dst_buf is reused from a previous frame (so
   copied_timestamp is already 1 with the old timestamp), __v4l2_m2m_try_qu=
eue()
   sees a timestamp mismatch against the queued second field and prematurely
   finishes the held capture buffer. When dst_buf is used for the first time
   (copied_timestamp is 0), __v4l2_m2m_try_queue() fails to flush the held
   buffer on a timestamp mismatch. In addition, aml_mpeg12_dec_run() (added
   in the later commit "media: amlogic: vdec: add MPEG-1/2 decoding") reads
   dst->vb2_buf.timestamp during ->run() while it still holds the stale
   timestamp.

3. For CODEC_TYPE_H264, CODEC_TYPE_MPEG2, and CODEC_TYPE_MPEG4,
   v4l2_ctrl_request_complete() runs after v4l2_m2m_buf_done_and_job_finish=
()
   has already called vb2_buffer_done(src_buf) and unbound
   src_buf->vb2_buf.req_obj. If the request had no control objects bound,
   unbinding src_buf transitions req->state to MEDIA_REQUEST_STATE_COMPLETE,
   so v4l2_ctrl_request_complete() hits WARN_ON() in
   media_request_object_bind() or accesses a freed media_request if userspa=
ce
   has already dequeued the buffer and closed the request fd.

4. Also, in this commit, h264_threaded_isr_func() in
   drivers/media/platform/amlogic/vdec/h264.c calls
   v4l2_m2m_buf_done_and_job_finish() without setting ctx->job_finished =3D=
 true
   (which is only added in the later commit "media: amlogic: vdec: h264:
   decode Main and High profile bit-exact").

Should v4l2_m2m_buf_copy_metadata() be called before ctx->codec_ops->run(ct=
x),
and v4l2_ctrl_request_complete() be called before
v4l2_m2m_buf_done_and_job_finish()?

> -	if (ret < 0)
> +	/*
> +	 * Only cancel a job that is still running: a codec that finished it in
> +	 * its own interrupt handler must not finish it twice.
> +	 */
> +	if (ret < 0 && !ctx->job_finished)
>  		goto err_cancel_job;
> =20
>  	return;
> =20
>  err_cancel_job:
> +	/*
> +	 * Whatever went wrong, the request must not be left incomplete or the
> +	 * client waits for it forever.  AV1 completes it in its own done path
> +	 * on success, so this only covers the paths that never got there.
> +	 */
> +	if (src_req)
> +		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);
>  	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
>  					 VB2_BUF_STATE_ERROR);
>  }

[Severity: High]
Can src_req be used uninitialized or completed twice when jumping to
err_cancel_job in m2mops_vdec_device_run()?

First, earlier in m2mops_vdec_device_run():

	struct media_request *src_req;
	...
	if (WARN_ON_ONCE(!ctx->codec_ops->run))
		goto err_cancel_job;

	src_req =3D src_buf->vb2_buf.req_obj.req;

If !ctx->codec_ops->run triggers, goto err_cancel_job jumps past the
assignment of src_req and evaluates if (src_req) on an uninitialized pointe=
r.

Second, when ctx->codec_ops->run(ctx) returns a negative error with
!ctx->job_finished for CODEC_TYPE_H264, CODEC_TYPE_MPEG2, or CODEC_TYPE_MPE=
G4
(for example, when control lookup, input preparation, or wait_event_timeout=
()
fails in aml_h264_dec_run()), m2mops_vdec_device_run() calls
v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler) right after ->run(),
and then takes:

	if (ret < 0 && !ctx->job_finished)
		goto err_cancel_job;

Under err_cancel_job, it calls v4l2_ctrl_request_complete(src_req,
&ctx->ctrl_handler) a second time on the same request, which triggers
WARN_ON(!hdl->request_is_queued) and a duplicate
media_request_object_complete(obj) in v4l2_ctrl_request_complete().

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c b/drivers/=
media/platform/amlogic/vdec/aml_vdec_hw.c
> index 29a195eb68721..935018ea96c62 100644
> --- a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c

[ ... ]

> @@ -249,6 +263,14 @@ static void dos_local_config(struct aml_vdec_hw *hw,=
 bool is_on, int id)
>  	dev_dbg(hw->dev, "%s end, id %d, is_on %d\n", __func__, id, is_on);
>  }
> =20
> +/*
> + * The core clock rates come from assigned-clock-rates in the device tre=
e.
> + * hevcf_rate overrides the HEVC core's for testing.
> + */
> +static ulong hevcf_rate;
> +module_param(hevcf_rate, ulong, 0444);
> +MODULE_PARM_DESC(hevcf_rate, "Override the HEVC core clock in Hz (0 =3D =
device tree)");

[Severity: Low]
Since hevcf_rate is exposed as a module and kernel command-line parameter v=
ia
module_param(), should it be documented in
Documentation/admin-guide/kernel-parameters.txt?

[ ... ]

> @@ -364,6 +386,91 @@ int vdec_enable(struct aml_vdec_hw *hw)
>  	return 0;
>  }
> =20
> +/*
> + * The HEVC core is a second, independent power domain with its own clock
> + * ("hevcf") and its own reset in DOS_SW_RESET3.  Nothing in this driver=
 decodes
> + * on it yet; it is powered only so secure world has somewhere to put the
> + * microcode when the AV1/HEVC load is probed.
> + */
> +int hvdec_enable(struct aml_vdec_hw *hw)
> +{
> +	vdec_poweron(hw, HVDEC);
> +
> +	return 0;
> +}
> +
> +int hvdec_disable(struct aml_vdec_hw *hw)
> +{
> +	vdec_poweroff(hw, HVDEC);
> +
> +	return 0;
> +}
> +
> +/*
> + * VP9 and AV1 share the HEVC core, and once one of them has run the oth=
er
> + * cannot: it loads, parses a header and never completes a picture.  Put=
ting
> + * back every register the other codec changed does not help, reloading =
the
> + * module does - and what a reload does that nothing else here does is p=
ower
> + * the core's internal memories down and up.  hvdec_disable() cannot be =
used
> + * for that: hvdec_enable() runs for every frame and only counts, so the=
 core
> + * never actually goes off.  Cycle the memories and reset the core direc=
tly,
> + * on a switch only, leaving the power domain, the clock and secure world
> + * alone.
> + */
> +int hvdec_switch_codec(struct aml_vdec_hw *hw, int codec)
> +{
> +	if (hw->hevc_dirty || (hw->hevc_codec && hw->hevc_codec !=3D codec)) {
> +		dev_info(hw->dev, "HEVC core: %s, cycling core memories\n",
> +			 hw->hevc_dirty ? "left dirty" : "codec switch");
> +		mutex_lock(&hw->pm_mutex);
> +		dos_local_config(hw, 0, HVDEC);
> +		dos_local_config(hw, 1, HVDEC);
> +		mutex_unlock(&hw->pm_mutex);
> +		hw->hevc_fw =3D 0;
> +	}
> +	hw->hevc_codec =3D codec;
> +	hw->hevc_dirty =3D false;
> +	return 0;
> +}
> +
> +/*
> + * Load a microcode into the HEVC core through secure world, unless it is
> + * already there. Every decoder context used to load it again, and a bro=
wser
> + * opens a new context for every seek, quality switch or advert: after a=
 few
> + * hundred loads the secure loader answers with TEEC_ERROR_BAD_STATE and
> + * stays there until the next power cycle. The image survives in the core
> + * until hvdec_switch_codec() cycles the memories.
> + */
> +int hevc_load_fw(struct aml_vdec_hw *hw, int codec, u32 format, u32 core,
> +		 const char *name)
> +{
> +	int ret, sm_ret =3D 0;
> +
> +	/*
> +	 * Halt the AMRISC in any case: the previous context may have left it
> +	 * running, and the decoder start below expects it stopped.
> +	 */
> +	regmap_write(hw->map[DOS_BUS], HEVC_MPSR, 0);
> +	regmap_write(hw->map[DOS_BUS], HEVC_CPSR, 0);
> +
> +	if (hw->hevc_fw =3D=3D codec)
> +		return 0;

[Severity: High]
What happens to hw->hevc_fw and the HVDEC power domain state across error
paths and driver removal?

1. If HVDEC is powered off via hvdec_disable() -> vdec_poweroff(hw, HVDEC) =
->
   pm_vdec_power_domain_power_off(hw, HVDEC) (for example, when bringup fai=
ls
   after hevc_load_fw() on the first frame in aml_av1_dec_run() or
   aml_vp9_dec_run()), dos_local_config(hw, 0, HVDEC) powers down
   DOS_MEM_PD_HEVC and pm_runtime_put_sync() powers down the domain, but
   hw->hevc_fw is not cleared. On the next decode attempt for the same code=
c,
   hvdec_switch_codec() sees hw->hevc_codec =3D=3D codec and hevc_load_fw()=
 sees
   hw->hevc_fw =3D=3D codec, so the driver skips reloading the microcode in=
to the
   wiped core.

2. During normal decoding, hvdec_enable() increments
   vdec_domain_data[HVDEC].ref_count on every frame without matching
   hvdec_disable() calls. On driver teardown, aml_vdec_drv_remove() only ca=
lls
   vdec_disable() for VDEC, and pm_vdec_power_domain_release() detaches the
   power domains without powering off HVDEC or resetting ref_count. Doesn't
   this leak the clk_prepare_enable() reference on the hevcf clock and the
   runtime PM reference on the hvdec power domain device, as well as leave
   the static vdec_domain_data[HVDEC].ref_count non-zero across driver
   unbind/rebind?

[ ... ]

> @@ -382,6 +489,40 @@ static const struct power_manager_s pm[] =3D {
>  	},
>  };
> =20
> +static irqreturn_t hevc_irq_handler(int irq, void *priv)
> +{
> +	struct aml_vdec_hw *hw =3D priv;
> +	int n;
> +
> +	hw->hevc_irq_status =3D read_dos_reg(hw, HEVC_ASSIST_SCRATCH_0);
> +	regmap_write(hw->map[DOS_BUS], HEVC_ASSIST_MBOX0_CLR_REG, 1);
> +
> +	n =3D atomic_inc_return(&hw->hevc_irq_count);
> +	if (hw->hevc_irq_thread_fn)
> +		return IRQ_WAKE_THREAD;
> +
> +	/*
> +	 * Runaway guard for the probe path, which has no state machine to end
> +	 * a decode.  It must not apply once a real handler is driving the
> +	 * core: a stream produces a few interrupts per picture, so masking the
> +	 * mailbox at a fixed count silently stops decoding part way through.
> +	 */
> +	if (n > 64)
> +		regmap_write(hw->map[DOS_BUS], HEVC_ASSIST_MBOX0_MASK, 0);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t hevc_irq_thread(int irq, void *priv)
> +{
> +	struct aml_vdec_hw *hw =3D priv;
> +
> +	if (hw->hevc_irq_thread_fn)
> +		return hw->hevc_irq_thread_fn(irq, hw->hevc_priv);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static irqreturn_t vdec_irq_handler(int irq, void *priv)
>  {
>  	struct aml_vdec_dev *dev =3D (struct aml_vdec_dev *)priv;
> @@ -445,6 +586,25 @@ int dev_request_hw_resources(void *priv)
>  	hw =3D dev->dec_hw;
>  	hw->dev =3D &pdev->dev;
> =20
> +	/*
> +	 * The HEVC/AV1 core signals on its own interrupt (IRQ_HVDEC, the first
> +	 * entry in the DT, GIC SPI 91) through mailbox 0.  Nothing decodes on
> +	 * that core yet, so this handler only acknowledges and counts - it is
> +	 * how the microcode's replies are observed at all.  If it ever storms,
> +	 * the mask is dropped rather than letting it wedge the board.
> +	 */
> +	hw->hevc_irq =3D platform_get_irq(pdev, IRQ_HVDEC);
> +	if (hw->hevc_irq >=3D 0) {
> +		atomic_set(&hw->hevc_irq_count, 0);
> +		ret =3D devm_request_threaded_irq(&pdev->dev, hw->hevc_irq,
> +						hevc_irq_handler,
> +						hevc_irq_thread,
> +						IRQF_ONESHOT, "aml-hevc", hw);
> +		if (ret)
> +			dev_warn(&pdev->dev, "hevc irq %d request failed (%d)\n",
> +				 hw->hevc_irq, ret);
> +	}

[Severity: High]
Could registering hw->hevc_irq here in dev_request_hw_resources() before
hw->map[DOS_BUS], hw->pm->init, and vdec_clock_gate_init() are set up cause
an invalid or unpowered register access if an interrupt is pending at probe=
 or
rebind time?

Unlike vdec_irq_handler(), which checks hw->hw_ops.irq_handler before touch=
ing
hardware, hevc_irq_handler() unconditionally calls read_dos_reg(hw,
HEVC_ASSIST_SCRATCH_0) and regmap_write(hw->map[DOS_BUS],
HEVC_ASSIST_MBOX0_CLR_REG, 1). If IRQ_HVDEC fires before
devm_regmap_init_mmio() initializes hw->map[DOS_BUS] (or after it stores an
ERR_PTR on failure), hevc_irq_handler() will dereference a NULL or ERR_PTR
regmap in hard IRQ context. Even after regmap initialization, if an interru=
pt
arrives while the HVDEC power domain or DOS_GCLK_EN3 clock gate is off,
hevc_irq_handler() accesses unpowered DOS registers.

Also, in hevc_irq_thread():

	if (hw->hevc_irq_thread_fn)
		return hw->hevc_irq_thread_fn(irq, hw->hevc_priv);

hw->hevc_irq_thread_fn and hw->hevc_priv are read and called without lockin=
g,
READ_ONCE(), or synchronize_irq() when a codec instance tears down (such as
in aml_av1_exit(), aml_vp9_exit(), and aml_hevc_exit() in later commits of =
the
series). If a session exits after hevc_irq_handler() returns IRQ_WAKE_THREA=
D,
can hevc_irq_thread() race with teardown and call a NULL function pointer or
dereference a freed hw->hevc_priv context?

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.h b/drivers/=
media/platform/amlogic/vdec/aml_vdec_hw.h
> index 9dc84d0d52bf4..35645aad23758 100644
> --- a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.h
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.h

[ ... ]

> @@ -149,9 +180,42 @@ struct aml_vdec_hw *vdec_get_hw(void *priv);

[ ... ]

> +/*
> + * The CPU wrote a decoded picture into a capture buffer.  A buffer the =
client
> + * asked to be cacheable (V4L2_MEMORY_FLAG_NON_COHERENT) still has it in=
 dirty
> + * cache lines, which vb2 would invalidate on dequeue: write them back f=
irst.
> + */
> +static inline void aml_vdec_dst_cpu_written(struct device *dev,
> +					    struct vb2_buffer *vb)
> +{
> +	unsigned int i;
> +
> +	if (!vb->vb2_queue->non_coherent_mem)
> +		return;
> +	for (i =3D 0; i < vb->num_planes; i++)
> +		dma_sync_single_for_device(dev,
> +					   vb2_dma_contig_plane_dma_addr(vb, i),
> +					   vb2_plane_size(vb, i), DMA_TO_DEVICE);
> +}

[Severity: Medium]
Does passing DMA_TO_DEVICE to dma_sync_single_for_device() in
aml_vdec_dst_cpu_written() match the DMA direction of the capture queue?

In aml_vdec_queue_init(), dst_vq is a V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
queue initialized with dst_vq->allow_cache_hints =3D 1 and bidirectional =
=3D 0, so
vb2_core_queue_init() sets dst_vq->dma_dir =3D DMA_FROM_DEVICE. When non-co=
herent
capture buffers are allocated via vb2_dc_alloc_non_coherent(), they are map=
ped
with DMA_FROM_DEVICE. Calling dma_sync_single_for_device(..., DMA_TO_DEVICE)
on those buffers violates the DMA API direction contract and triggers a
warning in check_sync() when CONFIG_DMA_API_DEBUG is enabled.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c b/dr=
ivers/media/platform/amlogic/vdec/aml_vdec_platform.c
> index 60d20efb1d746..fa4f979b07ee2 100644
> --- a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c

[ ... ]

> @@ -46,10 +46,21 @@ static struct aml_video_fmt aml_s4_video_formats[] =
=3D {
>  		.align =3D 64,
>  		.codec_type =3D CODEC_TYPE_FRAME,
>  		.num_planes =3D 2,
> -		.stepwise =3D {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
> -			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
> +		.stepwise =3D {AML_VDEC_MIN_W, AML_VDEC_4K_MAX_W, 2,
> +			AML_VDEC_MIN_H, AML_VDEC_4K_MAX_H, 2},
> =20
>  	},
> +	{
> +		/* planar 4:2:0, only what the MJPEG microcode writes */
> +		.name =3D "YUV420",
> +		.fourcc =3D V4L2_PIX_FMT_YUV420,
> +		.type =3D AML_FMT_FRAME,
> +		.align =3D 64,
> +		.codec_type =3D CODEC_TYPE_FRAME,
> +		.num_planes =3D 1,
> +		.stepwise =3D {AML_VDEC_MIN_W, AML_VDEC_4K_MAX_W, 2,
> +			AML_VDEC_MIN_H, AML_VDEC_4K_MAX_H, 2},
> +	},

[Severity: Medium]
As the comment notes, only the MJPEG microcode writes 3-plane planar
V4L2_PIX_FMT_YUV420, whereas H.264 (in h264_restore_hw_ctx() and
config_decode_canvas()) and the other non-MJPEG codecs only output semi-pla=
nar
NV12 or NV21.

Because vidioc_vdec_enum_fmt(), vdec_try_fmt_mp(), and vdec_s_fmt_capture()=
 in
drivers/media/platform/amlogic/vdec/aml_vdec.c expose all AML_FMT_FRAME
entries without filtering by the active output format in
ctx->dec_fmt[AML_FMT_SRC], won't userspace clients negotiating H.264 (or
AV1/VP9/HEVC/MPEG-2/MPEG-4) be able to enumerate and select
V4L2_PIX_FMT_YUV420 on the capture queue and receive NV12 data misinterpret=
ed
as planar YUV420 (and conversely, select NV12/NV21 for MJPEG and fail in
aml_mjpeg_dec_run())?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025192507.2100=
58-1-christian.koever-draxl@student.uibk.ac.at?part=3D3
