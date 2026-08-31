Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC723D3492
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166604; cv=none; b=qC9zR/CjFdpqcjfs07sfbx8u3+retkDf5T5e8SRynOBls7vz9PBY5JRMg5jdZ0edKJIWaKqoT18aGyLb2mn7htIZfI7LsPPlCRMXLhe+It/Fn2Te7WvyzmNQO1HW3ErWbn01+rgiAte2EoTsnGwIvh/rYYcB7uZnT+DpqI1Arls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166604; c=relaxed/simple;
	bh=GERvTYEAdY+XxE/Yt01Sj7ICmgcjFXI9KyXJm9aPRgI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dHqMq9Fz/q+R48X4M9siOpML+oDmtFifuC9lwr6MQ5S/SS4QkOOTOvr6aR8sXKF2nzex5S4Ssjze5cQao5FSl2cbi2UZca3zG5jM3VpSsubl+EjbsbpRZrYWU70js7tj+h0Smypy8LgmZFwWwK1SEnohkg5SIu8rwwGUGK17Z3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LDHXxWH+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LDHXxWH+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 170E61F000E9;
	Mon, 31 Aug 2026 08:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788166602;
	bh=dp6BXRBBLZqV92tRn+YcHe6My4dK5IzTayWn+yi2Ams=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LDHXxWH+Xnizq4UPNDgTrNKij39PW6UxruVyzX3NFXivtIIC8OKLnXzpmpPiNoPA1
	 fvcQ199lk0SW3A+9OsDN4X2ZLEtol7z++46PzYFoSknQ6L9mXGiV8oHO5QSytVlLx1
	 28fxk9Po/mFxy2b69jvcqVSwIi/D4p7xrbLxlJuTePx3JO7INPPfCNcylzss0y97kL
	 SpJH/fuO/sMhQdvuXRePUpR4C8xa6J7vVmKGM7YltjSuaMvW7Rh9uZKFB3Y2iHch6/
	 gtZvwjaI8cL+H48r4rWieXrc7j+xPGCM0sjwXrZI17Bh5b5s/6QgbT26FSQ0OjkZpQ
	 jZKSSb+RyD7jA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/6] decoder: Add V4L2 stateless H.264 decoder driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260831-b4-s4-vdec-upstream-v8-4-830195b9bd91@amlogic.com>
References: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
 <20260831-b4-s4-vdec-upstream-v8-4-830195b9bd91@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 08:56:41 +0000
Message-Id: <20260831085642.170E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 15 potential issue=
(s) to consider:
- [Critical] Missing validation of dynamic SPS dimensions against queue for=
mat leads to massive out-of-bounds DMA buffer writes.
- [High] Unbinding the driver while a file descriptor is open leads to Use-=
After-Free of the `dev` and `m2m_dev` structures.
- [High] Stale DMA addresses are used for reference frames if the same DPB =
entry appears multiple times in a reference list.
- [High] The VIFIFO hardware read/write pointers are programmed to access p=
ast the end of the userspace-provided DMA buffer, causing out-of-bounds DMA=
 reads.
- [High] Failure to allocate a canvas silently aborts configuration, leadin=
g the hardware to decode into a stale or uninitialized canvas index.
- [High] Missing locking in `aml_h264_dec_run`'s timeout path allows concur=
rent hardware access with the threaded ISR, corrupting hardware state.
- [High] Dangling `dec_hw->curr_ctx` on early error returns in `aml_h264_de=
c_run` causes Use-After-Free in the threaded ISR.
- [High] Unhandled failure in `vb2_find_buffer()` causes hardware DMA to us=
e uninitialized or stale addresses.
- [High] The driver allocates video buffers without restricting them to 32-=
bit DMA addresses, but writes them to 32-bit hardware registers.
- [High] The 'dos' clock is requested but never enabled, which will hang th=
e system when DOS_BUS registers are accessed.
- [Medium] The V4L2 request reference is leaked on the load_firmware error =
path.
- [Medium] Returning IRQ_HANDLED for an unhandled interrupt causes an IRQ s=
torm.
- [Medium] `request_firmware()` is called with a NULL device pointer, break=
ing firmware caching and sysfs fallbacks.
- [Medium] vdec_try_fmt_mp fetches alignment from the first supported forma=
t instead of the requested format.
- [Medium] The output queue is erroneously marked as streaming if initializ=
ation fails, causing state mismatch.
--

commit ab3cf88bf6f6c60b14702ce65b846740e397629f
Author: Zhentao Guo <zhentao.guo@amlogic.com>

decoder: Add V4L2 stateless H.264 decoder driver
   =20
Add initial support for V4L2 stateless video decoder driver on Amlogic
S4(S805X2) platform. In phase 1, it supports 8bit H.264 bitstreams decoding=
.=20
Currently only progressive streams are supported.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.c b/drivers/med=
ia/platform/amlogic/vdec/aml_vdec.c
> --- a/drivers/media/platform/amlogic/vdec/aml_vdec.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c
[ ... ]
> @@ -135,16 +135,18 @@ static void m2mops_vdec_device_run(void *m2m_priv)
>  	if (ctx->curr_dec_type =3D=3D CODEC_TYPE_H264)
>  		aml_vdec_reset_core(dev->dec_hw);
> =20
>  	if (load_firmware(dev->dec_hw, ctx->curr_dec_type) < 0)
>  		goto err_cancel_job;
> =20
>  	ret =3D ctx->codec_ops->run(ctx);
> =20
>  	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>  	if (src_req)
>  		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);
>  	if (ret < 0 || ctx->curr_frm_err_flag)
>  		goto err_cancel_job;
>  	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
>  					 VB2_BUF_STATE_DONE);
> =20
>  	return;
> =20
>  err_cancel_job:
>  	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
>  					 VB2_BUF_STATE_ERROR);
>  }

[Severity: Medium]
Does this error path leak the V4L2 request reference? If load_firmware()
fails, the code jumps to err_cancel_job and completes the buffers, but bypa=
sses
the v4l2_ctrl_request_complete() call, leaving userspace waiting indefinite=
ly.

[ ... ]
> @@ -203,17 +205,18 @@ static int vidioc_vdec_enum_framesizes(struct file =
*file, void *priv,
>  static int vdec_try_fmt_mp(struct aml_vdec_ctx *ctx, enum v4l2_buf_type =
type,
>  			   struct v4l2_pix_format_mplane *pix_mp,
>  			   const struct aml_video_fmt *dec_fmt)
>  {
>  	int i, align;
> =20
>  	pix_mp->field =3D V4L2_FIELD_NONE;
>  	align =3D ctx->dev->pvdec_data->dec_fmt->align;

[Severity: Medium]
Is it intentional to fetch the alignment from the first element of the
supported format array here? This ignores the alignment requirement of the
actual dec_fmt passed into vdec_try_fmt_mp(), which could cause formats req=
uiring
different alignments to be validated incorrectly.

> =20
>  	if (V4L2_TYPE_IS_OUTPUT(type)) {
>  		pix_mp->num_planes =3D dec_fmt->num_planes;
>  		pix_mp->pixelformat =3D dec_fmt->fourcc;
[ ... ]
> @@ -396,16 +399,16 @@ static int vb2ops_vdec_start_streaming(struct vb2_q=
ueue *q, unsigned int count)
>  {
>  	struct aml_vdec_ctx *ctx =3D vb2_get_drv_priv(q);
> =20
>  	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
>  		struct vb2_v4l2_buffer *src_buf;
> =20
>  		ctx->is_output_streamon =3D 1;
>  		if (aml_vdec_init_dec_inst(ctx) < 0) {
>  			while ((src_buf =3D v4l2_m2m_src_buf_remove(ctx->m2m_ctx)))
>  				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_QUEUED);
>  			return -EINVAL;
>  		}

[Severity: Medium]
If aml_vdec_init_dec_inst() fails, is the output queue left erroneously
marked as streaming? It appears ctx->is_output_streamon is never rolled
back to 0 on this error path.

>  	} else {
>  		ctx->is_cap_streamon =3D 1;
>  	}
> =20
>  	return 0;
>  }

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c b/drivers=
/media/platform/amlogic/vdec/aml_vdec_drv.c
> --- a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
[ ... ]
> @@ -66,13 +66,13 @@ static int fops_vcodec_open(struct file *file)
>  static int fops_vcodec_release(struct file *file)
>  {
>  	struct aml_vdec_ctx *ctx =3D fh_to_dec_ctx(file);
> =20
>  	v4l2_m2m_ctx_release(ctx->m2m_ctx);

[Severity: High]
Could unbinding the driver while a file descriptor is open lead to a
use-after-free here? When aml_vdec_drv_remove() runs, it unconditionally
frees dev->m2m_dev_dec. However, the V4L2 core keeps the video_device
alive until the file descriptor is closed, at which point this function
will dereference the freed m2m_ctx.

>  	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>  	v4l2_fh_del(&ctx->fh, file);
>  	v4l2_fh_exit(&ctx->fh);
>  	kfree(ctx);
> =20
>  	return 0;
>  }
[ ... ]
> @@ -136,17 +136,17 @@ static int aml_vdec_drv_probe(struct platform_devic=
e *pdev)
>  	dev->pvdec_data =3D of_device_get_match_data(&pdev->dev);
>  	ret =3D dev->pvdec_data->req_hw_resource(dev);
>  	if (ret < 0)
>  		goto err_hw_init;
> =20
>  	dev->m2m_dev_dec =3D v4l2_m2m_init(&aml_vdec_m2m_ops);

[Severity: High]
Is a call to dma_set_mask_and_coherent() missing before initializing the
V4L2 M2M framework? Without restricting allocations to 32 bits, 64-bit DMA
addresses allocated on platforms with >4GB memory could be silently
truncated when the driver writes them to 32-bit hardware registers.

>  	if (IS_ERR(dev->m2m_dev_dec)) {
>  		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem dec device\n");
>  		ret =3D PTR_ERR((__force void *)dev->m2m_dev_dec);
>  		goto err_m2m_dev_init;
>  	}
[ ... ]
> @@ -201,16 +201,16 @@ static void aml_vdec_drv_remove(struct platform_dev=
ice *pdev)
>  {
>  	struct aml_vdec_dev *dev =3D platform_get_drvdata(pdev);
> =20
>  	vdec_disable(dev->dec_hw);
>  	media_device_unregister(&dev->mdev);
>  	v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
>  	video_unregister_device(dev->vfd);
>  	media_device_cleanup(&dev->mdev);
> =20
>  	v4l2_m2m_release(dev->m2m_dev_dec);
>  	dev->pvdec_data->destroy_hw_resource(dev);
>  	v4l2_device_unregister(&dev->v4l2_dev);
>  }

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c b/drivers/=
media/platform/amlogic/vdec/aml_vdec_hw.c
> --- a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
[ ... ]
> @@ -264,15 +264,16 @@ static void pm_vdec_power_domain_power_on(struct am=
l_vdec_hw *hw, int id)
>  	const struct power_manager_s *pm =3D hw->pm;
>  	struct device *dev =3D pm->pd_data[id].dev;
>  	struct clk_bulk_data *gate_node =3D NULL;
> =20
>  	if (id =3D=3D VDEC)
>  		gate_node =3D vdec_get_clk_by_name(hw, "core_vdec");
>  	else if (id =3D=3D HVDEC)
>  		gate_node =3D vdec_get_clk_by_name(hw, "core_hvdec");
> =20
>  	if (gate_node) {
>  		clk_prepare_enable(gate_node->clk);

[Severity: High]
Is the dos clock requested during vdec_clock_gate_init() but never enabled
here? Skipping the dos clock enable before accessing DOS bus registers in
dos_local_config() below could cause the system bus to hang.

>  		if (id =3D=3D VDEC) {
>  			clk_set_rate(gate_node->clk, 499999992);
>  			dev_dbg(hw->dev, "after set, vdec clock is %lu Hz\n",
>  				clk_get_rate(gate_node->clk));
>  		}
[ ... ]
> @@ -308,16 +309,16 @@ static const struct power_manager_s pm[] =3D {
>  		.power_off    =3D pm_vdec_power_domain_power_off,
>  	},
>  };
> =20
>  static irqreturn_t vdec_irq_handler(int irq, void *priv)
>  {
>  	struct aml_vdec_dev *dev =3D (struct aml_vdec_dev *)priv;
>  	struct aml_vdec_hw *hw =3D dev->dec_hw;
>  	irqreturn_t ret =3D IRQ_HANDLED;
> =20
>  	if (hw->hw_ops.irq_handler)
>  		ret =3D hw->hw_ops.irq_handler(irq, priv);
> =20
>  	return ret;
>  }

[Severity: Medium]
If hw->hw_ops.irq_handler is NULL, does returning IRQ_HANDLED trick the
spurious interrupt detector? It appears this could lead to an interrupt sto=
rm
if no work was actually performed to clear the hardware interrupt.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c b/driv=
ers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
> --- a/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
[ ... ]
> @@ -156,16 +156,16 @@ int load_firmware(struct aml_vdec_hw *hw, u32 type)
>  	meson_sm_call(hw->sec_fw, SM_LOAD_VIDEO_FW, &ret,
>  		      video_fw->fw_format, video_fw->core,
>  		      video_fw->is_swap, 0, 0);
>  	if (ret < 0)
>  		dev_err(hw->dev, "loading fw type %d core %d, ret %x\n",
>  			video_fw->fw_format, video_fw->core, ret);
> =20
>  	return ret;
>  }
> =20
>  static int get_firmware(const char *path, void **data, size_t *size)
>  {
>  	const struct firmware *fw =3D NULL;
>  	int ret;
>  	void *buf;
> =20
>  	ret =3D request_firmware(&fw, FIRMWARE_PATH, NULL);

[Severity: Medium]
Does passing a NULL device pointer to request_firmware() break firmware
caching and sysfs fallbacks? The firmware loader typically needs the correct
device hierarchy to bind the request properly.

>  	if (ret)
>  		return ret;
> =20
>  	if (fw->size <=3D UCODE_HEADER_SIZE) {
>  		release_firmware(fw);
>  		return -EINVAL;
>  	}

> diff --git a/drivers/media/platform/amlogic/vdec/h264.c b/drivers/media/p=
latform/amlogic/vdec/h264.c
> --- a/drivers/media/platform/amlogic/vdec/h264.c
> +++ b/drivers/media/platform/amlogic/vdec/h264.c
[ ... ]
> @@ -163,16 +163,16 @@ static inline uint32_t spec2canvas(struct h264_deco=
de_buf_spec *buf_spec)
>  static struct h264_decode_buf_spec *find_spec_by_dpb_index(struct aml_h2=
64_ctx
>  							   *h264_ctx, int index, int list)
>  {
>  	int i;
>  	int size;
>  	struct h264_decode_buf_spec *ref_list;
> =20
>  	size =3D h264_ctx->list_size[list];
>  	if (list =3D=3D 0)
>  		ref_list =3D &h264_ctx->ref_list0[0];
>  	else
>  		ref_list =3D &h264_ctx->ref_list1[0];
> =20
>  	for (i =3D 0; i < size; i++) {
>  		if (index =3D=3D ref_list[i].dpb_index)
>  			return &ref_list[i];
>  	}

[Severity: High]
Will multiple identical DPB entries in the reference list result in stale D=
MA
addresses? Because this search stops at the first match, any subsequent
duplicate entries in the list will be skipped when h264_config_decode_spec()
initializes the DMA addresses, potentially leaving hardware programmed with
stale or uninitialized addresses.

> =20
>  	return NULL;
>  }
> =20
>  static int h264_prepare_input(struct aml_vdec_ctx *ctx)
>  {
>  	struct aml_vdec_hw *hw =3D vdec_get_hw(ctx->dev);
>  	struct vb2_v4l2_buffer *src;
>  	struct vb2_buffer *vb;
>  	dma_addr_t src_dma;
>  	u32 payload_size;
>  	int dummy;
> =20
>  	src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>  	if (!src) {
>  		dev_info(hw->dev, "no input buffer available!\n");
>  		return -1;
>  	}
>  	vb =3D &src->vb2_buf;
>  	payload_size =3D vb2_get_plane_payload(vb, 0);
>  	src_dma =3D vb2_dma_contig_plane_dma_addr(vb, 0);
> =20
>  	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CONTROL, 0);
>  	/* reset VLD fifo for all vdec */
>  	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET0,
>  		     (1 << 5) | (1 << 4) | (1 << 3));
>  	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET0, 0);
>  	regmap_write(hw->map[DOS_BUS], POWER_CTL_VLD, 1 << 4);
> =20
>  	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_START_PTR, src_dma);
>  	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_END_PTR,
>  		     (src_dma + payload_size));
>  	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CURR_PTR,
>  		     round_down(src_dma, VDEC_FIFO_ALIGN));
> =20
>  	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CONTROL, 1);
>  	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CONTROL, 0);
>  	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_BUF_CNTL, 2);
> =20
>  	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_RP,
>  		     round_down(src_dma, VDEC_FIFO_ALIGN));
>  	dummy =3D payload_size + VLD_PADDING_SIZE;
>  	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_WP,
>  		     round_down((src_dma + dummy), VDEC_FIFO_ALIGN));

[Severity: High]
Can programming the write pointer past the mapped payload size cause
out-of-bounds DMA reads? If userspace provides a tight buffer where the
mapped plane size exactly matches the payload size, the hardware might
attempt to read the VLD_PADDING_SIZE bytes from unmapped physical memory.

> =20
>  	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_BUF_CNTL, 3);
>  	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_BUF_CNTL, 2);
[ ... ]
> @@ -345,16 +346,16 @@ static int config_sps_params(struct aml_h264_ctx *h=
264_ctx,
>  {
>  	struct aml_vdec_ctx *ctx =3D h264_ctx->v4l2_ctx;
>  	struct aml_vdec_hw *hw =3D vdec_get_hw(ctx->dev);
>  	const struct v4l2_frmsize_stepwise *stepwise =3D
>  		&ctx->dec_fmt[AML_FMT_SRC].stepwise;
>  	u32 cfg_tmp =3D 0;
>  	u32 frame_size;
>  	u32 offset =3D 0;
>  	unsigned short data_tmp[0x100];
>  	int i, ii;
> =20
>  	memset(sps_base, 0, 0x100);
> =20
>  	h264_ctx->frame_width =3D (sps->pic_width_in_mbs_minus1 + 1) << 4;
>  	h264_ctx->frame_height =3D (sps->pic_height_in_map_units_minus1 + 1) <<=
 4;

[Severity: Critical]
Is there a missing check to verify that these SPS dimensions actually fit
within the allocated V4L2 capture queue resolution? Blindly accepting these
could lead to massive out-of-bounds DMA writes when the hardware is later
programmed with these sizes.

> =20
>  	if (!frame_size_in_range(stepwise, h264_ctx->frame_width,
>  				 h264_ctx->frame_height)) {
>  		dev_info(&ctx->dev->plat_dev->dev,
[ ... ]
> @@ -396,16 +397,16 @@ static int h264_config_params(struct aml_vdec_ctx *=
ctx)
> =20
>  	return 0;
>  }
> =20
>  static void config_decode_canvas(struct aml_vdec_hw *hw,
>  				 struct h264_decode_buf_spec *buf_spec,
>  				 u32 mb_width, u32 mb_height)
>  {
>  	int blkmode =3D 0x0;
>  	int ret;
> =20
>  	ret =3D meson_canvas_alloc(hw->canvas, &buf_spec->y_canvas_index);
>  	if (ret) {
>  		dev_err(hw->dev, "failed to alloc y canvas (%d)\n", ret);
>  		return;
>  	}

[Severity: High]
If canvas allocation fails, does the hardware end up writing to an
uninitialized or stale canvas index? The failure is logged and returns
early, but the caller doesn't abort the decode job.

> =20
>  	ret =3D meson_canvas_alloc(hw->canvas, &buf_spec->u_canvas_index);
[ ... ]
> @@ -585,16 +586,16 @@ static int h264_config_decode_spec(struct aml_vdec_=
hw *hw, struct aml_vdec_ctx *
>  		if (buf_spec_l0) {
>  			buf_spec_l0->canvas_pos =3D
>  			    get_canvas_pos_by_poc(h264_ctx,
>  						  dpb->top_field_order_cnt);
>  			if (buf_spec_l0->canvas_pos < 0) {
>  				dev_dbg(&ctx->dev->plat_dev->dev,
>  					"l0 canvas_pos %d error\n",
>  					buf_spec_l0->canvas_pos);
>  				continue;
>  			}
>  			vb =3D vb2_find_buffer(vq, dpb->reference_ts);
>  			if (!vb) {
>  				dev_dbg(&ctx->dev->plat_dev->dev,
>  					"ref pic for ts %llu lost\n", dpb->reference_ts);
>  				continue;
>  			}

[Severity: High]
If the reference picture is lost and vb2_find_buffer() returns NULL, does
this skip initializing the DMA address while leaving the reference picture
active for canvas programming? This could cause the hardware to read from a
stale physical address.

> =20
>  			buf_spec_l0->y_dma_addr =3D
>  			    vb2_dma_contig_plane_dma_addr(vb, 0);
[ ... ]
> @@ -2095,16 +2096,16 @@ void aml_h264_exit(void *priv)
>  static void config_decode_mode(struct aml_vdec_ctx *ctx)
>  {
>  	struct aml_h264_ctx *h264_ctx =3D (struct aml_h264_ctx *)ctx->codec_pri=
v;
>  	struct aml_vdec_hw *hw =3D vdec_get_hw(ctx->dev);
> =20
>  	regmap_write(hw->map[DOS_BUS], H264_DECODE_MODE, 0x1);	/*decode mode fr=
amebase */
>  	regmap_write(hw->map[DOS_BUS], HEAD_PADDING_REG, 0);
>  	regmap_write(hw->map[DOS_BUS], H264_DECODE_SEQINFO, h264_ctx->seq_info);
>  	regmap_write(hw->map[DOS_BUS], INIT_FLAG_REG, 1);
>  }
> =20
>  int aml_h264_dec_run(void *priv)
>  {
>  	struct aml_vdec_ctx *ctx =3D (struct aml_vdec_ctx *)priv;
>  	struct aml_h264_ctx *h264_ctx =3D (struct aml_h264_ctx *)ctx->codec_pri=
v;
>  	struct aml_vdec_hw *dec_hw =3D vdec_get_hw(ctx->dev);
>  	int ret =3D -1;
>  	int i;
> =20
>  	aml_vdec_set_curr_ctx(dec_hw, h264_ctx);
> =20
>  	ret =3D aml_h264_get_stateless_ctrl_ref(h264_ctx);
>  	if (ret < 0) {
>  		dev_err(&ctx->dev->plat_dev->dev, "not ctrl ref for h264 decoder\n");
>  		return ret;
>  	}

[Severity: High]
If an initialization step like aml_h264_get_stateless_ctrl_ref() fails and
returns early, is dec_hw->curr_ctx left as a dangling pointer? A subsequent
interrupt might dereference this freed memory in the threaded ISR.

> =20
>  	h264_ctx->new_pic_flag =3D 1;
>  	ret =3D h264_config_params(ctx);
[ ... ]
> @@ -2127,16 +2128,16 @@ int aml_h264_dec_run(void *priv)
> =20
>  	ctx->int_cond =3D 0;
>  	aml_start_vdec_hw(dec_hw);
>  	h264_ctx->init_flag =3D 1;
> =20
>  	regmap_write(dec_hw->map[DOS_BUS], DPB_STATUS_REG, H264_ACTION_SEARCH_H=
EAD);
> =20
>  	ret =3D wait_event_interruptible_timeout(ctx->queue, ctx->int_cond,
>  					       msecs_to_jiffies(DECODER_TIMEOUT_MS));
> =20
>  	if (!ret) {
>  		ret =3D -1;
>  		dev_err(&ctx->dev->plat_dev->dev, "dec timeout=3D%u\n", DECODER_TIMEOU=
T_MS);
>  		for (i =3D 0; i < 16; i++) {	/* 16 : show ucode PC 16 times when timeo=
ut */
>  			dev_dbg(&ctx->dev->plat_dev->dev, "decoder timeout, pc 0x%x\n",
>  				read_dos_reg(dec_hw, MPC_E));
>  			usleep_range(10, 20);
>  		}
>  		/*
>  		 * Halt the hardware and wait out any in-flight threaded IRQ
>  		 * handler before cleaning up, otherwise both contexts may run
>  		 * h264_release_decode_spec() concurrently.
>  		 */
>  		aml_stop_vdec_hw(dec_hw);
>  		synchronize_irq(dec_hw->dec_irq);
>  		h264_release_decode_spec(dec_hw, ctx);

[Severity: High]
Does aml_stop_vdec_hw() race with vdec_threaded_isr_handler() here? The
timeout path accesses hardware registers without acquiring hw->ctx_mutex or
disabling the IRQ, which could corrupt hardware state if an interrupt
fires concurrently.

>  	} else if (-ERESTARTSYS =3D=3D ret) {
>  		ret =3D -1;
>  		aml_stop_vdec_hw(dec_hw);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-b4-s4-vdec=
-upstream-v8-0-830195b9bd91@amlogic.com?part=3D4
