Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDABD3F8257
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374705; cv=none; b=SpKOs/QP3//kLrr8S8lLwLH5ocepoKQ7HQBFmB8+twKzF4Jg54soBS/wr/pmbpXTI1PhNTKvlCQSxqkM6P04t+ub+1QvA2CuF2+Ox/mKX4hP/oYkT2ZH54ZhYl1vLkiMqhcXlTCRHuixZNe/Dydxw0anpzRE6PDNGnBUv+RUF5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374705; c=relaxed/simple;
	bh=oEcPZHaLQvwycsmLQhonIuZiTkPu9VaqNL5TysAWdQk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JAncvqel2V+fkdfhzrMFOlVVgtYsG4JDyQXVVQeu9/d1Cnd9kbZJv6RDF+fLcVjrF7Suxmlq9TtAnQEVwhjPSDcGf4q0kDMK1EAcD5NXfFBDWQEqCVL4XyNGRR1x1VNFr3vvqXQOnBQkmUEnlaT5uZo4kQy+BjLcIqHVU3c0pmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgipXaIC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgipXaIC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589761F000FF;
	Mon, 14 Sep 2026 08:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374703;
	bh=OEEnKb1ph5sj4yiLGstEyb9833qHCZnX01jq0OlwEWo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FgipXaICQDK6EwBFb74pcb/6ZVL/bAyBkDsJvMWSs5CcxF9NUhi8aONANxh6J1UDa
	 4tk5cFZ3TQUk+oT8kqokkBcB8KDAP9C+drD3UWOXmIK9jk5PvMreLS+owdDvEFYdDT
	 J4QfXyTrhpcytvKKkMfPpmUTy2Hf1VL4yCNESCk9BJKPSRfP2cJKsnQu/ZPyjBmHIU
	 T4fWls9XZS922z47GB7szFaWQziNp0Aiyj2wySh5bjFpgvEAzXQo4Kknx0SycpAyQP
	 FjA5YjsiCVh6AA3mS8BFwEB7tgE7Y8ZYdhGfgrS7ZcdHaUHb5p8xOBAGfgB9RB+K6j
	 Tm7wZM6VAaSJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 4/6] decoder: Add V4L2 stateless H.264 decoder driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, media-ci@linuxtv.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260914-b4-s4-vdec-upstream-v9-4-72fdb0d71b02@amlogic.com>
References: <20260914-b4-s4-vdec-upstream-v9-0-72fdb0d71b02@amlogic.com>
 <20260914-b4-s4-vdec-upstream-v9-4-72fdb0d71b02@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 08:31:42 +0000
Message-Id: <20260914083143.589761F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 14 potential issue=
(s) to consider:
- [Critical] Missing synchronization between streamoff and the M2M worker c=
auses Use-After-Free and permanent M2M deadlocks.
- [High] Firmware loading loop silently skips chunks when TEEC_ERROR_BUSY i=
s returned.
- [High] Colocated MV CMA buffer is not resized on dynamic resolution chang=
e, leading to hardware DMA buffer overflow.
- [High] Static global array retains stale device and link pointers, causin=
g double-free on power domain release.
- [High] Hardware DMA buffer overflow into capture queue buffers due to mis=
sing size validation.
- [High] Hardware Out-of-Bounds Read due to artificially increased VIFIFO W=
rite Pointer.
- [High] Slot leaks and array collisions because `INVALID_POC` aliases with=
 valid POC -1.
- [High] `h264_config_decode_spec` unconditionally dereferences the result =
of `v4l2_m2m_next_dst_buf()`, which can be NULL if the capture queue was st=
opped.
- [High] Premature freeing of m2m_dev and device context in remove() leads =
to Use-After-Free if file descriptors remain open.
- [High] Race condition between the timeout handler and threaded ISR causes=
 unsynchronized hardware register accesses.
- [Medium] `tee_pta_invoke_cmd` masks internal errors from `tee_client_invo=
ke_func()`.
- [Medium] `aml_vdec_drv_probe` dereferences `pvdec_data` without checking =
if `of_device_get_match_data()` returned NULL.
- [Medium] Kernel stack memory leak to DMA-coherent buffer due to uninitial=
ized array in `config_sps_params()` and `config_pps_params()`.
- [Medium] Manual 16-bit word swapping of DMA data assumes CPU endianness, =
breaking on big-endian architectures.
--

commit 32d79a55cb39fe35641a2ada550274595010cdce
Author: Zhentao Guo <zhentao.guo@amlogic.com>
Subject: decoder: Add V4L2 stateless H.264 decoder driver

Add initial support for V4L2 stateless video decoder driver on Amlogic
S4(S805X2) platform. It supports 8bit H.264 bitstreams decoding, currently
only progressive streams.

> --- a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
> @@ -68,14 +68,8 @@ static int fops_vcodec_release(struct file *file)
>  {
>  	struct aml_vdec_ctx *ctx =3D fh_to_dec_ctx(file);
> =20
>  	v4l2_m2m_ctx_release(ctx->m2m_ctx);

[Severity: High]
Does fops_vcodec_release() trigger a use-after-free here?

If the v4l2 device was unregistered and the driver unbound,
aml_vdec_drv_remove() will have already destroyed the m2m_dev_dec structure.
When an application subsequently closes a retained file descriptor, this
accesses the freed m2m structure.

>  	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>  	v4l2_fh_del(&ctx->fh, file);
>  	v4l2_fh_exit(&ctx->fh);
>  	kfree(ctx);
> =20
>  	return 0;
>  }
> =20
> [ ... ]
> =20
> @@ -148,6 +148,8 @@ static int aml_vdec_drv_probe(struct platform_device =
*pdev)
>  	}
>  	dev->dec_hw =3D hw;
> =20
>  	dev->pvdec_data =3D of_device_get_match_data(&pdev->dev);
>  	ret =3D dev->pvdec_data->req_hw_resource(dev);

[Severity: Medium]
Will aml_vdec_drv_probe() crash if of_device_get_match_data() returns null?

If the driver is bound manually via sysfs driver_override, there won't be
any match data, causing a null pointer dereference when accessing
req_hw_resource().

>  	if (ret < 0)
> =20
> [ ... ]
> =20
> @@ -226,9 +226,6 @@ static void aml_vdec_drv_remove(struct platform_devic=
e *pdev)
>  	video_unregister_device(dev->vfd);
>  	media_device_cleanup(&dev->mdev);
> =20
>  	v4l2_m2m_release(dev->m2m_dev_dec);

[Severity: High]
Can this cause a use-after-free if file descriptors remain open?

This prematurely frees the core v4l2 m2m structures and triggers cleanup
of devm allocations before all file descriptors have been closed. A
subsequent close by userspace will hit the use-after-free in
fops_vcodec_release().

>  	dev->pvdec_data->destroy_hw_resource(dev);
>  	v4l2_device_unregister(&dev->v4l2_dev);
>  }

> --- a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
> @@ -160,8 +160,8 @@ static void pm_vdec_power_domain_release(struct aml_v=
dec_hw *hw)
>  	for (i =3D 0; i < VDEC_MAX; i++) {
>  		if (!IS_ERR_OR_NULL(pd[i].link))
>  			device_link_del(pd[i].link);
> =20
>  		if (!IS_ERR_OR_NULL(pd[i].dev))
>  			dev_pm_domain_detach(pd[i].dev, true);

[Severity: High]
Does pm_vdec_power_domain_release() leave dangling pointers in the global
vdec_domain_data array?

Because the global pd[i].link and pd[i].dev pointers are never set to null,
a sequence where the driver is unbound and rebound, or encounters consecuti=
ve
probe failures, will result in a double-free of the device_link and power
domain.

>  	}
>  }

> --- a/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
> @@ -124,12 +124,12 @@ static int tee_pta_invoke_cmd(struct aml_vdec_hw *h=
w, struct tee_context *ctx,
>  		param_invoke[0].u.memref.shm =3D shm;
>  		ret =3D tee_client_invoke_func(ctx, &inv_arg, param_invoke);
>  		if (ret < 0 || (inv_arg.ret !=3D TEEC_SUCCESS && inv_arg.ret !=3D TEEC=
_ERROR_BUSY)) {

[Severity: High]
Does tee_pta_invoke_cmd() bypass error handling when the tee returns
TEEC_ERROR_BUSY?

If the tee subsystem is busy, this condition evaluates to false, causing
the firmware loading loop to silently skip the chunk without any retry.
This will corrupt the hardware firmware and cause the device to fail.

>  			dev_info(hw->dev,
>  				 "%s invoke func failed, cmd =3D %u, ret=3D %d, res =3D 0x%x, origin=
 =3D 0x%x\n",
>  				 __func__, cmd, ret, inv_arg.ret,
>  				 inv_arg.ret_origin);
>  			ret =3D inv_arg.ret;
>  			goto close_session;

[Severity: Medium]
Will this return success if tee_client_invoke_func() fails internally?

If tee_client_invoke_func() encounters an internal error (like -ENOMEM)
before invoking the command, it returns a negative code. Since the command
didn't run, inv_arg.ret remains its default TEEC_SUCCESS (0). Setting ret
to inv_arg.ret here masks the failure and returns success.

>  		}
>  		sent_size +=3D param_invoke[0].u.memref.size;

[Severity: High]
Can this advance the buffer pointer even when the chunk was rejected?

If TEEC_ERROR_BUSY was returned, the loop skips the error branch and
erroneously advances sent_size, permanently losing the chunk.

>  	}

> --- a/drivers/media/platform/amlogic/vdec/aml_vdec.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c
> @@ -150,6 +150,8 @@ static void m2mops_vdec_device_run(void *m2m_priv)
>  		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);
>  	if (ret < 0 || ctx->curr_frm_err_flag)
>  		goto err_cancel_job;
>  	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
>  					 VB2_BUF_STATE_DONE);

[Severity: Critical]
Can m2mops_vdec_device_run() deadlock the v4l2 m2m core?

If userspace unbinds the stream using VIDIOC_STREAMOFF concurrently,
vb2ops_vdec_stop_streaming() removes all buffers and frees ctx->codec_priv.
Because the buffers were aggressively stripped,
v4l2_m2m_buf_done_and_job_finish() will trigger a v4l2 WARN_ON and abort,
permanently hanging the m2m queue.

>  	return;
> =20
>  [ ... ]
> =20
> @@ -404,6 +404,7 @@ static void vb2ops_vdec_stop_streaming(struct vb2_que=
ue *q)
>  	}
> =20
>  	if (!ctx->is_output_streamon && !ctx->is_cap_streamon)
>  		aml_vdec_release_instance(ctx);

[Severity: Critical]
Is it safe to tear down the instance context without synchronizing against
the m2m worker thread?

This frees ctx->codec_priv synchronously via aml_vdec_release_instance(),
but the m2mops_vdec_device_run() worker thread might still be blocked in
aml_h264_dec_run(). When the thread resumes, it will write to the freed
h264_ctx, causing a use-after-free.

>  }

> --- a/drivers/media/platform/amlogic/vdec/h264.c
> +++ b/drivers/media/platform/amlogic/vdec/h264.c
> @@ -13,2 +13,2 @@
>  #define INVALID_POC 0xffffffff

[Severity: High]
Does this sentinel mathematically alias with a valid h264 poc of -1?

A picture order count of -1 evaluates to 0xffffffff. Using this as the
INVALID_POC sentinel causes valid reference frames with a -1 poc to be
skipped during buffer release and incorrectly matched when searching.

>  [ ... ]
> =20
> @@ -200,6 +200,8 @@ static int config_sps_params(struct aml_h264_ctx *h26=
4_ctx,
>  	u32 offset =3D 0;
>  	unsigned short data_tmp[0x100];

[Severity: Medium]
Does this leak uninitialized stack memory?

Only the first few words of this 256-word array are populated before the
entire 512-byte buffer is copied into dma memory below.

>  	int i, ii;
> =20
>  	memset(sps_base, 0, 0x100);
> =20
>  [ ... ]
> =20
> @@ -248,8 +248,8 @@ static int config_sps_params(struct aml_h264_ctx *h26=
4_ctx,
> =20
>  	for (i =3D 0; i < 0x100; i +=3D 4) {
>  		for (ii =3D 0; ii < 4; ii++)
>  			sps_base[i + 3 - ii] =3D data_tmp[i + ii];

[Severity: Medium]
Will this break on big-endian cpus?

The code treats dma-mapped memory as an array of unsigned short, which will
byte-swap the parameter blocks on a big-endian cpu before the hardware reads
it.

>  	}
> =20
>  [ ... ]
> =20
> @@ -347,6 +347,8 @@ static int h264_prepare_input(struct aml_vdec_ctx *ct=
x)
>  	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_RP,
>  		     round_down(src_dma, VDEC_FIFO_ALIGN));
>  	dummy =3D payload_size + VLD_PADDING_SIZE;
>  	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_WP,
>  		     round_down((src_dma + dummy), VDEC_FIFO_ALIGN));

[Severity: High]
Does h264_prepare_input() instruct the hardware to read past the end of the
buffer?

The hardware write pointer is artificially increased by VLD_PADDING_SIZE
(1024 bytes) beyond payload_size without verifying the physical
vb2_plane_size() is large enough to contain it.

>  [ ... ]
> =20
> @@ -398,6 +398,6 @@ static int config_sps_params(struct aml_h264_ctx *h26=
4_ctx,
>  	h264_ctx->frame_height =3D (sps->pic_height_in_map_units_minus1 + 1) <<=
 4;
> =20
>  	if (!frame_size_in_range(stepwise, h264_ctx->frame_width,
>  				 h264_ctx->frame_height)) {
>  		dev_info(&ctx->dev->plat_dev->dev,

[Severity: High]
Can a mismatched sps trigger a buffer overflow?

This checks the sps against the global maximums but ignores the actual size
of the currently allocated v4l2 capture buffer. If userspace allocates a
small buffer and submits a 1080p sps, the hardware will overflow the buffer
during config_decode_canvas().

>  [ ... ]
> =20
> @@ -425,6 +425,8 @@ static int alloc_colocate_cma(struct aml_h264_ctx *h2=
64_ctx,
>  	gfp_t gfp =3D GFP_KERNEL | GFP_DMA32;
> =20
>  	if (h264_ctx->collated_cma_vaddr)
>  		return 0;

[Severity: High]
Does alloc_colocate_cma() prevent the cma buffer from resizing?

If the stream dynamic resolution increases, returning early here leaves
one_col_buf_size at its old, smaller value. Later, h264_config_decode_buf()
bounds checks using the stale size, overflowing the contiguous memory area.

>  	hw =3D vdec_get_hw(ctx->dev);
> =20
>  [ ... ]
> =20
> @@ -490,6 +490,8 @@ static int config_decode_canvas(struct aml_vdec_hw *h=
w,
>  	buf_spec->canvas_allocated =3D 1;
> =20
>  	/* config y canvas */
>  	meson_canvas_config(hw->canvas,
>  			    buf_spec->y_canvas_index, buf_spec->y_dma_addr,
>  			    mb_width << 4, mb_height << 4,

[Severity: High]
Does config_decode_canvas() command the hardware to write past the end of
the dma buffer?

Because the sps dimensions are unvalidated against the actual buffer size,
this can configure the canvas to write a 1080p frame into a much smaller
v4l2 buffer.

>  [ ... ]
> =20
> @@ -540,6 +540,8 @@ static void release_colocate_buf(struct aml_h264_ctx =
*h264_ctx, int index)
>  			     __func__, index, h264_ctx->max_num_ref_frames);
>  		} else {
>  			if (h264_ctx->colocated_buf_poc[index] !=3D INVALID_POC &&
>  			    ((h264_ctx->colocated_buf_map >> index) & 0x1) =3D=3D 0x1) {
>  				h264_ctx->colocated_buf_map &=3D (~(1 << index));

[Severity: High]
Does release_colocate_buf() leak buffer slots for valid reference frames?

Since INVALID_POC aliases with -1, reference frames with a poc of -1 fail
this condition and are never released.

>  [ ... ]
> =20
> @@ -611,6 +611,6 @@ static int h264_config_decode_spec(struct aml_vdec_hw=
 *hw, struct aml_vdec_ctx *
> =20
>  	vb2_v4l2 =3D v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
>  	vb =3D &vb2_v4l2->vb2_buf;

[Severity: High]
Will h264_config_decode_spec() crash if v4l2_m2m_next_dst_buf() returns nul=
l?

If the capture queue was stopped by VIDIOC_STREAMOFF, the destination
buffers are removed. This unconditionally dereferences a null pointer inside
the interrupt handler context.

>  	h264_ctx->curr_spec.y_dma_addr =3D vb2_dma_contig_plane_dma_addr(vb, 0);
> =20
>  [ ... ]
> =20
> @@ -916,6 +916,8 @@ void aml_h264_exit(void *priv)
>  				  h264_ctx->cma_alloc_addr);
> =20
>  	kfree(ctx->codec_priv);
>  	ctx->codec_priv =3D NULL;
>  }

[Severity: Critical]
Does aml_h264_exit() trigger a use-after-free?

This frees the context while the m2m worker thread is actively executing and
waiting. When the thread resumes, it dereferences the freed memory.

>  [ ... ]
> =20
> @@ -966,6 +966,8 @@ int aml_h264_dec_run(void *priv)
>  		 * h264_release_decode_spec() concurrently.
>  		 */
>  		aml_stop_vdec_hw(dec_hw);
>  		synchronize_irq(dec_hw->dec_irq);
>  		h264_release_decode_spec(dec_hw, ctx);
>  	} else if (-ERESTARTSYS =3D=3D ret) {
>  		ret =3D -1;

[Severity: High]
Can aml_h264_dec_run() race with the threaded isr and corrupt hardware stat=
e?

aml_stop_vdec_hw() immediately executes hardware resets via DOS_SW_RESET0.
If the threaded isr is concurrently writing configuration blocks to DOS_BUS
registers, the accesses will interleave and corrupt the decoder state.

>  [ ... ]
> =20
> @@ -979,6 +979,8 @@ int aml_h264_dec_run(void *priv)
> =20
>  	h264_ctx->init_flag =3D 0;
>  	aml_vdec_set_curr_ctx(dec_hw, NULL);

[Severity: Critical]
Is it possible to use a freed pointer here?

If aml_h264_exit() was invoked concurrently via streamoff, h264_ctx was
already freed, resulting in a use-after-free when modifying init_flag.

>  	return ret;
> =20
>  [ ... ]
> =20
> @@ -1436,6 +1436,8 @@ static int h264_config_decode_buf(struct aml_vdec_h=
w *hw,
>  		colocate_wr_adr =3D (unsigned int)h264_ctx->collated_cma_addr +
>  		    ((h264_ctx->one_col_buf_size *
>  		      h264_ctx->curr_spec.col_buf_index) >> (use_mode_8x8_flag ? 2 : 0=
));
>  		if (colocate_adr_offset > h264_ctx->one_col_buf_size ||
>  		    colocate_wr_adr + h264_ctx->one_col_buf_size >
>  		    (unsigned int)h264_ctx->collated_cma_addr_end) {

[Severity: High]
Does this bounds check fail during dynamic resolution changes?

Because alloc_colocate_cma() bails out early instead of updating
one_col_buf_size, this logic uses the stale size to validate a hardware
write, leading to a dma overflow.

>  [ ... ]
> =20
> @@ -1676,6 +1676,8 @@ static irqreturn_t h264_isr(int irq, void *priv)
>  	return IRQ_WAKE_THREAD;
>  }
> =20
>  static irqreturn_t h264_threaded_isr_func(int irq, void *priv)
>  {
>  	u32 dec_status;

[Severity: High]
Does h264_threaded_isr_func() perform register writes that race with the
timeout handler?

The threaded isr handles configuration and starts the hardware. If the main
thread's wait times out, the timeout handler will reset the hardware
concurrently, causing the register writes here to collide.

>  [ ... ]
> =20
> @@ -1687,6 +1687,8 @@ static irqreturn_t h264_threaded_isr_func(int irq, =
void *priv)
>  	switch (dec_status) {
>  	case H264_SLICE_HEADER_DONE:
>  		for (i =3D 0; i < 0x400; i +=3D 4)
>  			for (ii =3D 0; ii < 4; ii++)
>  				h264_ctx->dpb_param.l.data[i + ii] =3D p[i + 3 - ii];

[Severity: Medium]
Will this loop break on big-endian architectures?

Using cpu-native unsigned short accesses to read the hardware's dma output
memory assumes the cpu uses the same endianness as the hardware. On
big-endian, this will byte-swap the data incorrectly.

>  		save_reg_status(h264_ctx);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-b4-s4-vdec=
-upstream-v9-0-72fdb0d71b02@amlogic.com?part=3D4
