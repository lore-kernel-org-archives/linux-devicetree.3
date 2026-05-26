Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5693DB651
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789886; cv=none; b=Qy1bPqeoqDTqiKbt54tO4vKGQi35Zt8mu5iD1np2ZV7Ee1M8HdFzNi6fZmyOfI6o5fsghI/JuzTeFEkLiux5rb+j6BIgavPCy9EU9spPBl1FZLCqwmO7hJxddarIpUBuyvj6YZ4TXWEcADZiMJdJJTCH73K9Lge7/+lES7rP9+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789886; c=relaxed/simple;
	bh=YpSaMMiialySLav+slUNAhbXgmxC+WZ9fGhC7BYiqFs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kkmWrQHTO42xH352hj66cDhzlbyWG4iMweZojqI9BxgjWTn7U1PFel2AFLwX8FlYmIVjbHMv4K5U4Yw4D482VyM1u92mcRFD9NkIW/Mag8QtWwa00F0/RfjbRlreOkwUxSqC7ciL06Ab4bCxE4BEE241H41UXPzL9hyw1t+oDIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7FaE6tf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7FaE6tf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497C21F000E9;
	Tue, 26 May 2026 10:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779789883;
	bh=hqdQK8EKP6IBYEXynOFlMsicI52NwFDuGSnbYPzTjW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C7FaE6tfZqK1iYnjLz5K0/W8YGvqVDPtakGSyUZpNiYrQob7JPsanbYMFGSbsULFo
	 QfI7KSEVqEdYWl5fDj3w5q2GZOXSOQ7ObftsdEyPLUf8mYn1nKT25jxuXPkTzTPlWt
	 VD7PMNGuapJQcaLVE4HiHuJyOwcKH8nq4Fjf5GyIKgGLeg9Y2sFprVhc1zwjRtMgXD
	 ATw4Ax40dLOtVHb1QFixW7aEfOgYNNRVbZmCVZObowaOUIMZaGbdJjQu5622ij+595
	 m92qHZFyoyGOUXM5r2SKAXyd5o7RtLns3SaGUkPj937R5rnvIWfyohJRh6oCvdKhSx
	 6cODonHYXKPzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC RESEND v5 4/6] decoder: Add V4L2 stateless H.264
 decoder driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo via B4 Relay" <devnull+zhentao.guo.amlogic.com@kernel.org>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260526-b4-s4-vdec-upstream-v5-4-33bc817f93f4@amlogic.com>
References: <20260526-b4-s4-vdec-upstream-v5-4-33bc817f93f4@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 10:04:42 +0000
Message-Id: <20260526100443.497C21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 22 potential issue=
(s) to consider:
- [Critical] Global context pointers are unconditionally overwritten, break=
ing isolation for multiple instances and leading to UAF.
- [High] Accessing V4L2 M2M buffers and request objects after they have bee=
n completed by the ISR.
- [High] Missing `v4l2_m2m_buf_done_and_job_finish()` on error path causes =
a permanent stall of the V4L2 M2M context.
- [High] Probe error paths fail to clean up PM domains and device links.
- [High] Setting the OUTPUT queue format mistakenly overwrites the CAPTURE =
queue's format with a compressed stream format.
- [High] Multi-planar raw capture formats result in out-of-bounds DMA acces=
s due to improperly hardcoded plane counts.
- [High] Redundant hardware canvas allocations and error path failures leak=
 and exhaust the global hardware canvas pool.
- [High] Tautological comparisons on unsigned variables cause bounds-check =
bypasses and spurious resource frees.
- [High] Missing validation of V4L2 SPS/PPS controls leads to multiple heap=
 buffer overflows, integer overflows, and OOB DMA.
- [High] Teardown in `aml_vdec_drv_remove` frees the driver context while f=
ile descriptors can remain open.
- [High] Failing `start_streaming` does not return queued buffers to the VB=
2 framework.
- [High] Double free and premature free of `ctx->codec_priv` via `vb2ops_vd=
ec_stop_streaming`.
- [High] Bypassing PM runtime acquisition leads to unbalanced clock/PM refe=
rences.
- [High] Lockless buffer access and unchecked NULL dereference in IRQ handl=
er.
- [High] The DOS clock is never enabled before accessing DOS_BUS registers.
- [Medium] Incorrect error checking of `of_parse_phandle` leads to NULL poi=
nter dereference and wrong error return.
- [Medium] Unmet dependencies when using `select` with architecture-specifi=
c symbols in a `COMPILE_TEST` driver.
- [Medium] Missing check for pm_runtime_get_sync return value allows access=
 to unpowered hardware.
- [Medium] The V4L2 control handler memory is leaked if `v4l2_ctrl_handler_=
setup` fails.
- [Medium] Video device node is exposed to userspace before hardware initia=
lization is complete.
- [Medium] Missing minimum length validation for loaded firmware data.
- [Medium] Missing `dma_rmb()` barrier before reading DMA memory updated by=
 hardware.
--

commit 05d0db2be715fa3e4cc8fc756c957d431e6f5b89
Author: Zhentao Guo <zhentao.guo@amlogic.com>

    decoder: Add V4L2 stateless H.264 decoder driver
   =20
    Add initial support for V4L2 stateless video decoder
    driver on Amlogic S4(S805X2) platform. In phase 1,
    it supports 8bit H.264 bitstreams decoding. Currently
    only progressive streams are supported.

> diff --git a/drivers/media/platform/amlogic/vdec/Kconfig b/drivers/media/=
platform/amlogic/vdec/Kconfig
> new file mode 100644
> index 0000000000000..d392967c77436
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +config VIDEO_AMLOGIC_VDEC
> +    tristate "Amlogic Video Decoder Driver"
> +    depends on ARCH_MESON || COMPILE_TEST
> +    depends on VIDEO_DEV
> +    depends on V4L_MEM2MEM_DRIVERS
> +    depends on TEE
> +    select VIDEOBUF2_DMA_CONTIG
> +    select V4L2_H264
> +    select V4L2_MEM2MEM_DEV
> +    select MESON_CANVAS
> +    select MESON_SM

[Severity: Medium]
Will selecting architecture-specific symbols like MESON_CANVAS and MESON_SM
cause unmet dependency warnings on unsupported architectures when COMPILE_T=
EST
is enabled?

[ ... ]
> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.c b/drivers/med=
ia/platform/amlogic/vdec/aml_vdec.c
> new file mode 100644
> index 0000000000000..d4dcd0180d2d0
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c
[ ... ]
> +int aml_vdec_ctrls_setup(struct aml_vdec_ctx *ctx)
> +{
> +	int i;
> +	int ctrls_size =3D ARRAY_SIZE(controls);
> +
> +	v4l2_ctrl_handler_init(&ctx->ctrl_handler, ctrls_size);
> +	for (i =3D 0; i < ctrls_size; i++) {
> +		v4l2_ctrl_new_custom(&ctx->ctrl_handler, &controls[i].cfg, NULL);
> +		if (ctx->ctrl_handler.error) {
> +			dev_info(&ctx->dev->plat_dev->dev, "add ctrl for (%d) failed%d\n",
> +				 controls[i].cfg.id, ctx->ctrl_handler.error);
> +			v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> +			return ctx->ctrl_handler.error;
> +		}
> +	}
> +	ctx->fh.ctrl_handler =3D &ctx->ctrl_handler;
> +	return v4l2_ctrl_handler_setup(&ctx->ctrl_handler);

[Severity: Medium]
If v4l2_ctrl_handler_setup() returns an error, does this code leak the memo=
ry
allocated for the control handler? The caller doesn't seem to free it on
this failure path.

> +}
> +
> +static void m2mops_vdec_device_run(void *m2m_priv)
> +{
> +	struct aml_vdec_ctx *ctx =3D m2m_priv;
> +	struct aml_vdec_dev *dev =3D ctx->dev;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct media_request *src_req;
> +	int ret =3D 0;
> +
> +	src_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	dev_dbg(&dev->plat_dev->dev, "device run : src buf : %d dst buf %d\n",
> +		src_buf->vb2_buf.index, dst_buf->vb2_buf.index);
> +	if (WARN_ON_ONCE(!ctx->codec_ops->run))
> +		goto err_cancel_job;
> +
> +	src_req =3D src_buf->vb2_buf.req_obj.req;
> +	if (src_req)
> +		v4l2_ctrl_request_setup(src_req, &ctx->ctrl_handler);
> +	dos_enable(dev->dec_hw);
> +	/* incase of bus hang in stop_streaming */
> +	ctx->dos_clk_en =3D 1;
> +
> +	if (ctx->curr_dec_type =3D=3D CODEC_TYPE_H264)
> +		aml_vdec_reset_core(dev->dec_hw);
> +
> +	if (load_firmware(dev->dec_hw, ctx->curr_dec_type) < 0)
> +		goto err_cancel_job;
> +
> +	ret =3D ctx->codec_ops->run(ctx);
> +
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> +	if (src_req)
> +		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);

[Severity: High]
Since ctx->codec_ops->run() blocks on wait_event_interruptible_timeout, and
the ISR completes the job by calling v4l2_m2m_buf_done_and_job_finish(), co=
uld
src_buf, dst_buf, and src_req already be returned to userspace and potentia=
lly
freed by the time this thread wakes up to access them?

> +	if (ret < 0)
> +		goto err_cancel_job;
> +
> +	return;
> +
> +err_cancel_job:
> +	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
> +					 VB2_BUF_STATE_ERROR);
> +}
[ ... ]
> +static void set_pic_info(struct aml_vdec_ctx *ctx,
> +			 struct v4l2_pix_format_mplane *pix_mp,
> +			 enum v4l2_buf_type type)
> +{
> +	if (V4L2_TYPE_IS_OUTPUT(type)) {
> +		ctx->pic_info.output_pix_fmt =3D pix_mp->pixelformat;
> +		ctx->pic_info.coded_width =3D ALIGN(pix_mp->width, 64);
> +		ctx->pic_info.coded_height =3D ALIGN(pix_mp->height, 64);
> +		ctx->pic_info.fb_size[0] =3D
> +		    ctx->pic_info.coded_width * ctx->pic_info.coded_height;
> +		ctx->pic_info.fb_size[1] =3D ctx->pic_info.fb_size[0] / 2;
> +		ctx->pic_info.plane_num =3D 1;

[Severity: High]
If a multi-planar format like NV12M is negotiated, shouldn't plane_num be s=
et
to match the actual planes used? By rigidly setting plane_num to 1 here, co=
uld
the driver end up computing out-of-bounds DMA addresses for the C plane lat=
er?

> +	}
> +}
[ ... ]
> +static int vdec_s_fmt_output(struct aml_vdec_ctx *ctx, struct v4l2_forma=
t *f)
> +{
> +	struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> +	const struct aml_video_fmt *out_fmt;
> +	struct vb2_queue *vq;
> +	int ret;
> +
> +	vq =3D v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	if (vb2_is_busy(vq) &&
> +	    pix_mp->pixelformat !=3D ctx->pix_fmt[AML_FMT_SRC].pixelformat)
> +		return -EBUSY;
> +
> +	out_fmt =3D aml_vdec_get_video_fmt(ctx->dev, pix_mp->pixelformat);
> +	if (out_fmt)
> +		ctx->dec_fmt[AML_FMT_SRC] =3D *out_fmt;
> +	else
> +		dev_dbg(&ctx->dev->plat_dev->dev,
> +			"%s fmt %d not supported, use default\n", __func__,
> +			pix_mp->pixelformat);
> +
> +	ret =3D vdec_try_fmt_mp(ctx, f->type, pix_mp);
> +	set_pic_info(ctx, pix_mp, f->type);
> +
> +	ctx->pix_fmt[AML_FMT_SRC] =3D *pix_mp;
> +	ctx->pix_fmt[AML_FMT_DST] =3D *pix_mp;

[Severity: High]
Does overwriting ctx->pix_fmt[AML_FMT_DST] here corrupt the capture queue's
pixel format by erroneously assigning it the output queue's compressed
bitstream format?

> +
> +	return ret;
> +}
[ ... ]
> +static int vb2ops_vdec_start_streaming(struct vb2_queue *q, unsigned int=
 count)
> +{
> +	struct aml_vdec_ctx *ctx =3D vb2_get_drv_priv(q);
> +
> +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +		ctx->is_output_streamon =3D 1;
> +		if (aml_vdec_init_dec_inst(ctx) < 0)
> +			return -EINVAL;

[Severity: High]
If aml_vdec_init_dec_inst() fails and returns an error, doesn't the driver
need to return all queued buffers to userspace with state VB2_BUF_STATE_QUE=
UED
to avoid permanently leaking them?

> +	} else {
> +		ctx->is_cap_streamon =3D 1;
> +	}
> +
> +	return 0;
> +}
> +
> +static void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
> +{
> +	struct aml_vdec_ctx *ctx =3D vb2_get_drv_priv(q);
> +	struct vb2_v4l2_buffer *src_buf =3D NULL, *dst_buf =3D NULL;
> +
> +	aml_vdec_release_instance(ctx);

[Severity: High]
Since aml_vdec_release_instance() calls aml_h264_exit() which frees
ctx->codec_priv, what happens if userspace stops only the capture queue whi=
le
the output queue is actively streaming? Will this cause a use-after-free on
ctx->codec_priv for ongoing decode jobs or incoming IRQs?

> +
> +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +		while ((src_buf =3D v4l2_m2m_src_buf_remove(ctx->m2m_ctx)))
> +			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> +		ctx->is_output_streamon =3D 0;
> +	} else {
> +		while ((dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->m2m_ctx)))
> +			v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
> +		ctx->is_cap_streamon =3D 0;
> +	}
> +}
[ ... ]
> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c b/drivers=
/media/platform/amlogic/vdec/aml_vdec_drv.c
> new file mode 100644
> index 0000000000000..d63cbd4f9e26d
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
[ ... ]
> +static int fops_vcodec_open(struct file *file)
> +{
> +	struct aml_vdec_dev *dec_dev =3D video_drvdata(file);
> +	struct aml_vdec_ctx *ctx =3D NULL;
> +	int ret =3D 0;
> +
> +	ctx =3D kzalloc_obj(*ctx, GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	mutex_lock(&dec_dev->dev_mutex);
> +	dec_dev->dec_ctx =3D ctx;

[Severity: Critical]
Is it safe to assign the newly allocated context to the global
dec_dev->dec_ctx? If multiple file handles are opened concurrently, won't t=
his
overwrite the pointer and cause the ISR to route events only to the most
recently opened instance?

> +	ctx->dev =3D dec_dev;
> +	v4l2_fh_init(&ctx->fh, video_devdata(file));
> +	file->private_data =3D &ctx->fh;
> +	v4l2_fh_add(&ctx->fh, file);
> +	dec_dev->filp =3D file;
> +	mutex_init(&ctx->v4l2_intf_lock);
> +	init_waitqueue_head(&ctx->queue);
> +	ctx->int_cond =3D 0;
[ ... ]
> +static int aml_vdec_drv_probe(struct platform_device *pdev)
> +{
> +	struct aml_vdec_dev *dev;
> +	struct video_device *vfd_dec;
> +	struct aml_vdec_hw *hw;
> +	int ret =3D 0;
> +
> +	dev =3D devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	dev->plat_dev =3D pdev;
> +	mutex_init(&dev->dev_mutex);
> +
> +	ret =3D v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "v4l2_device_register err\n");
> +
> +	vfd_dec =3D video_device_alloc();
> +	if (!vfd_dec) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to allocate video device\n");
> +		ret =3D -ENOMEM;
> +		goto err_device_alloc;
> +	}
> +	*vfd_dec =3D dec_dev;
> +	vfd_dec->v4l2_dev =3D &dev->v4l2_dev;
> +	vfd_dec->lock =3D &dev->dev_mutex;
> +	video_set_drvdata(vfd_dec, dev);
> +	dev->vfd =3D vfd_dec;
> +	platform_set_drvdata(pdev, dev);
> +
> +	hw =3D devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
> +	if (!hw) {
> +		ret =3D -ENOMEM;
> +		goto err_dec_mem_init;
> +	}
> +	dev->dec_hw =3D hw;
> +
> +	dev->pvdec_data =3D of_device_get_match_data(&pdev->dev);
> +	ret =3D dev->pvdec_data->req_hw_resource(dev);
> +	if (ret < 0)
> +		goto err_hw_init;
> +
> +	dev->m2m_dev_dec =3D v4l2_m2m_init(&aml_vdec_m2m_ops);
> +	if (IS_ERR(dev->m2m_dev_dec)) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem dec device\n");
> +		ret =3D PTR_ERR((__force void *)dev->m2m_dev_dec);
> +		goto err_hw_init;
> +	}
> +
> +	ret =3D video_register_device(vfd_dec, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to register video device");
> +		goto err_vid_dev_register;
> +	}
> +
> +	dev->mdev.dev =3D &pdev->dev;
> +	strscpy(dev->mdev.model, AML_VDEC_DRV_NAME, sizeof(dev->mdev.model));
> +	media_device_init(&dev->mdev);
> +	dev->mdev.ops =3D &aml_m2m_media_ops;
> +	dev->v4l2_dev.mdev =3D &dev->mdev;
> +
> +	ret =3D v4l2_m2m_register_media_controller(dev->m2m_dev_dec, vfd_dec,
> +						 MEDIA_ENT_F_PROC_VIDEO_DECODER);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media controller\n");
> +		goto error_m2m_mc_register;
> +	}
> +
> +	ret =3D media_device_register(&dev->mdev);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to register media device");
> +		goto err_media_dev_register;
> +	}
> +	vdec_enable(dev->dec_hw);

[Severity: Medium]
By calling video_register_device() before vdec_enable(), isn't the device n=
ode
exposed to userspace before the hardware is powered up and initialized? Cou=
ld
this allow userspace to issue ioctls on unpowered hardware?

> +	return 0;
> +
> +err_media_dev_register:
> +	v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +error_m2m_mc_register:
> +	media_device_cleanup(&dev->mdev);
> +err_vid_dev_register:
> +	v4l2_m2m_release(dev->m2m_dev_dec);
> +err_hw_init:
> +	dev->dec_hw =3D NULL;

[Severity: High]
Does this error path forget to call dev->pvdec_data->destroy_hw_resource(de=
v)?
Failing to clean up hardware resources here might permanently leak attached=
 PM
domains and device links.

> +err_dec_mem_init:
> +	video_device_release(vfd_dec);
> +err_device_alloc:
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +	return ret;
> +}
> +
> +static void aml_vdec_drv_remove(struct platform_device *pdev)
> +{
> +	struct aml_vdec_dev *dev =3D platform_get_drvdata(pdev);
> +
> +	vdec_disable(dev->dec_hw);
> +
> +	if (media_devnode_is_registered(dev->mdev.devnode)) {
> +		media_device_unregister(&dev->mdev);
> +		media_device_cleanup(&dev->mdev);
> +	}
> +
> +	if (dev->m2m_dev_dec)
> +		v4l2_m2m_release(dev->m2m_dev_dec);
> +	if (dev->vfd)
> +		video_unregister_device(dev->vfd);
> +	if (dev->dec_hw) {
> +		dev->pvdec_data->destroy_hw_resource(dev);
> +		dev->dec_hw =3D NULL;
> +	}
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +}

[Severity: High]
If a process keeps the video file descriptor open when the device is unboun=
d,
devm_kzalloc will free the dev structure after this remove function complet=
es.
When the file descriptor is eventually closed, fops_vcodec_release will
execute and attempt to access dev->dev_mutex. Will this lead to a
use-after-free on the dev structure?

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c b/drivers/=
media/platform/amlogic/vdec/aml_vdec_hw.c
> new file mode 100644
> index 0000000000000..79ba2a68bde41
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
[ ... ]
> +static int vdec_clock_gate_init(struct aml_vdec_hw *hw)
> +{
> +	hw->gates[CLK_DOS].id =3D "dos";
> +	hw->gates[CLK_VDEC].id =3D "vdec";
> +	hw->gates[CLK_HEVCF].id =3D "hevcf";
> +
> +	return devm_clk_bulk_get(hw->dev, CLK_MAX, hw->gates);
> +}
[ ... ]
> +static void pm_vdec_power_domain_power_on(struct aml_vdec_hw *hw, int id)
> +{
> +	const struct power_manager_s *pm =3D hw->pm;
> +	struct device *dev =3D pm->pd_data[id].dev;
> +	struct clk_bulk_data *gate_node =3D NULL;
> +
> +	if (id =3D=3D VDEC_1)
> +		gate_node =3D vdec_get_clk_by_name(hw, "vdec");
> +	else if (id =3D=3D VDEC_HEVC)
> +		gate_node =3D vdec_get_clk_by_name(hw, "hevcf");
> +
> +	if (gate_node) {
> +		clk_prepare_enable(gate_node->clk);

[Severity: High]
While the "vdec" and "hevcf" clocks are enabled here, isn't the "dos" clock
omitted entirely? If the "dos" clock remains gated, could accessing DOS_BUS
registers result in a synchronous external abort?

> +		if (id =3D=3D VDEC_1) {
> +			clk_set_rate(gate_node->clk, 499999992);
> +			dev_dbg(hw->dev, "after set, vdec clock is %lu Hz\n",
> +				clk_get_rate(gate_node->clk));
> +		}
> +		dev_dbg(hw->dev, "the %-15s clock on\n", gate_node->id);
> +	} else {
> +		dev_info(hw->dev, "clk %d, unreachable\n", id);
> +	}
> +
> +	if (dev) {
> +		pm_runtime_get_sync(dev);
> +		dev_dbg(dev, "dev: %p link %p the %-15s power on\n",
> +			dev, pm->pd_data[id].link, pm->pd_data[id].name);
> +	}
> +
> +	dos_local_config(hw, 1, id);

[Severity: Medium]
Should the return value of pm_runtime_get_sync() be checked before calling
dos_local_config()? If the power domain fails to power up, accessing the
hardware registers could lead to a bus hang.

> +}
[ ... ]
> +static void vdec_poweron(struct aml_vdec_hw *hw, enum vdec_type_e core)
> +{
> +	if (core >=3D VDEC_MAX)
> +		return;
> +
> +	mutex_lock(&hw->pm_mutex);
> +	if (!hw->pm->pd_data[core].dev)
> +		goto out;
> +
> +	hw->pm->pd_data[core].ref_count++;
> +	if (hw->pm->pd_data[core].ref_count > 1)
> +		goto out;
> +
> +	if (hw->pm->power_state(hw, core))
> +		goto out;

[Severity: High]
If the power domain is already active, this code jumps past power_on() but
still increments ref_count. Won't the subsequent teardown decrement ref_cou=
nt
and call power_off() unconditionally, causing unbalanced clk_disable_unprep=
are()
and pm_runtime_put_sync() calls?

> +
> +	hw->pm->power_on(hw, core);
> +
> +out:
> +	mutex_unlock(&hw->pm_mutex);
> +}
[ ... ]
> +int dev_request_hw_resources(void *priv)
> +{
[ ... ]
> +	hw->canvas =3D meson_canvas_get(&pdev->dev);
> +	if (IS_ERR(hw->canvas))
> +		return PTR_ERR(hw->canvas);
> +
> +	sm_np =3D of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);
> +	if (IS_ERR(sm_np))
> +		return PTR_ERR(hw->canvas);

[Severity: Medium]
Since of_parse_phandle() returns NULL on failure rather than an ERR_PTR,
doesn't the IS_ERR check fail to catch a missing node? Passing NULL to
meson_sm_get() later might cause issues. Also, why is PTR_ERR(hw->canvas)
returned here instead of an appropriate error code?

> +
> +	hw->sec_fw =3D meson_sm_get(sm_np);
> +	of_node_put(sm_np);
> +	if (IS_ERR(hw->sec_fw))
> +		return PTR_ERR(hw->sec_fw);
[ ... ]
> diff --git a/drivers/media/platform/amlogic/vdec/h264.c b/drivers/media/p=
latform/amlogic/vdec/h264.c
> new file mode 100644
> index 0000000000000..bd3aef44409f3
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/h264.c
[ ... ]
> +static void config_sps_params(struct aml_h264_ctx *h264_ctx,
> +			      unsigned short *sps_base,
> +			      const struct v4l2_ctrl_h264_sps *sps)
> +{
> +	struct aml_vdec_ctx *ctx =3D h264_ctx->v4l2_ctx;
> +	struct aml_vdec_hw *hw =3D vdec_get_hw(ctx->dev);
> +	u32 cfg_tmp =3D 0;
> +	u32 frame_size;
> +	u32 offset =3D 0;
> +	unsigned short data_tmp[0x100];
> +	int i, ii;
> +
> +	memset(sps_base, 0, 0x100);
> +
> +	h264_ctx->frame_width =3D (sps->pic_width_in_mbs_minus1 + 1) << 4;
> +	h264_ctx->frame_height =3D (sps->pic_height_in_map_units_minus1 + 1) <<=
 4;

[Severity: High]
Does this code validate userspace-provided SPS controls? For example, if
max_num_ref_frames is artificially large, could it overflow colocated array=
s?
Likewise, could an overly large pic_width_in_mbs_minus1 cause integer overf=
lows
when calculating allocation sizes?

> +
> +	data_tmp[offset] =3D PARAM_BASE_VAL;
> +	offset +=3D 2;
[ ... ]
> +static int allocate_canvas_pos(struct aml_h264_ctx *h264_ctx, int poc)
> +{
> +	int i;
> +	int ret =3D -1;
> +	struct aml_vdec_ctx *ctx =3D h264_ctx->v4l2_ctx;
> +
> +	for (i =3D 0; i < (V4L2_H264_NUM_DPB_ENTRIES + 1); i++) {
> +		if (((h264_ctx->canvas_pos_map >> i) & 0x1) =3D=3D 0) {
> +			h264_ctx->canvas_pos_map |=3D (1 << i);
> +			h264_ctx->ref_canvas[i].poc =3D poc;
> +			h264_ctx->ref_canvas[i].canvas_pos =3D i;
> +			ret =3D i;
> +
> +			dev_dbg(&ctx->dev->plat_dev->dev,
> +				"%s i %d pos_poc %d\n", __func__, i,
> +				h264_ctx->ref_canvas[i].poc);
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static void release_canvas_pos(struct aml_h264_ctx *h264_ctx, int index)
> +{
> +	struct aml_vdec_ctx *ctx =3D h264_ctx->v4l2_ctx;
> +
> +	if (index >=3D 0) {
> +		if (index > V4L2_H264_NUM_DPB_ENTRIES) {
> +			dev_dbg(&ctx->dev->plat_dev->dev,
> +				"%s error, index %d is bigger than buf count %d\n",
> +				__func__, index, h264_ctx->max_num_ref_frames);
> +		} else {
> +			if (h264_ctx->ref_canvas[index].poc !=3D INVALID_POC &&
> +			    ((h264_ctx->canvas_pos_map >> index) & 0x1) =3D=3D
> +			    0x1) {
> +				h264_ctx->canvas_pos_map &=3D (~(1 << index));
> +				dev_dbg(&ctx->dev->plat_dev->dev,
> +					"%s canvas_pos index %d released poc %d, canvas_pos_map 0x%x\n",
> +					__func__, index, h264_ctx->ref_canvas[index].poc,
> +					h264_ctx->canvas_pos_map);
> +				h264_ctx->ref_canvas[index].poc =3D INVALID_POC;
> +				h264_ctx->ref_canvas[index].canvas_pos =3D -1;
> +			}
> +		}
> +	}
> +}
[ ... ]
> +static void h264_config_decode_spec(struct aml_vdec_hw *hw, struct aml_v=
dec_ctx *ctx)
> +{
> +	struct aml_h264_ctx *h264_ctx =3D (struct aml_h264_ctx *)hw->curr_ctx;
> +	struct vdec_h264_stateless_ctrl_ref *ctrls =3D &h264_ctx->ctrl_ref;
> +	struct v4l2_ctrl_h264_decode_params *decode =3D
> +	    (struct v4l2_ctrl_h264_decode_params *)ctrls->decode;
> +	struct h264_decode_buf_spec *buf_spec_l0, *buf_spec_l1;
> +	struct vb2_buffer *vb;
> +	struct vb2_v4l2_buffer *vb2_v4l2;
> +	struct vb2_queue *vq;
> +	int i;
> +
> +	clear_unused_col_buf(h264_ctx, decode);
> +
> +	vb2_v4l2 =3D v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +	vb =3D &vb2_v4l2->vb2_buf;

[Severity: High]
If the destination queue is empty when this ISR runs, won't v4l2_m2m_next_d=
st_buf
return NULL? This would result in an immediate NULL pointer dereference.

> +
> +	h264_ctx->curr_spec.y_dma_addr =3D vb2_dma_contig_plane_dma_addr(vb, 0);
> +	if (ctx->pic_info.plane_num > 1)
> +		h264_ctx->curr_spec.c_dma_addr =3D
> +		    vb2_dma_contig_plane_dma_addr(vb, 1);
> +	else
> +		h264_ctx->curr_spec.c_dma_addr =3D
> +		    h264_ctx->curr_spec.y_dma_addr + ctx->pic_info.fb_size[0];
> +	h264_ctx->curr_spec.canvas_pos =3D
> +	    allocate_canvas_pos(h264_ctx, decode->top_field_order_cnt);
> +	if (h264_ctx->curr_spec.canvas_pos < 0)

[Severity: High]
Since canvas_pos is a u32 (inside struct h264_decode_buf_spec), isn't this
comparison (< 0) always false? This causes the code to proceed with an inva=
lid
canvas position if allocate_canvas_pos() fails.

> +		dev_err(&ctx->dev->plat_dev->dev, "curr_spec.canvas error\n");
> +
> +	if (decode->nal_ref_idc)
> +		h264_ctx->curr_spec.col_buf_index =3D
> +		    allocate_colocate_buf(h264_ctx,
> +					  decode->top_field_order_cnt);
[ ... ]
> +static void get_canvas_index(struct aml_vdec_hw *hw, struct aml_vdec_ctx=
 *ctx)
> +{
> +	struct aml_h264_ctx *h264_ctx =3D (struct aml_h264_ctx *)hw->curr_ctx;
> +	int i;
> +	struct h264_decode_buf_spec *buf;
> +
> +	config_decode_canvas(hw, &h264_ctx->curr_spec,
> +			     h264_ctx->mb_width, h264_ctx->mb_height);
> +	if (h264_ctx->list_size[0] > 0) {
> +		for (i =3D 0; i < h264_ctx->list_size[0]; i++) {
> +			buf =3D &h264_ctx->ref_list0[i];
> +			config_decode_canvas(hw, buf, h264_ctx->mb_width,
> +					     h264_ctx->mb_height);
> +		}
> +	}
> +
> +	if (h264_ctx->list_size[1] > 0) {
> +		for (i =3D 0; i < h264_ctx->list_size[1]; i++) {
> +			buf =3D &h264_ctx->ref_list1[i];
> +			config_decode_canvas(hw, buf, h264_ctx->mb_width,
> +					     h264_ctx->mb_height);
> +		}
> +	}

[Severity: High]
If a reference frame is shared between list0 and list1, will config_decode_=
canvas()
be called twice for the same buffer, causing a redundant canvas allocation
and leaking the hardware canvas pool?

> +}
> +
> +static void release_canvas_index(struct aml_vdec_hw *hw,
> +				 struct h264_decode_buf_spec *buf)
> +{
> +	if (buf->y_canvas_index >=3D 0) {

[Severity: High]
Because y_canvas_index is declared as u8, won't this check always be true?
If it's previously set to -1, it wraps to 255, causing the driver to spurio=
usly
free canvas 255.

> +		dev_dbg(hw->dev, "free y_canvas %d\n", buf->y_canvas_index);
> +		meson_canvas_free(hw->canvas, buf->y_canvas_index);
> +		buf->y_canvas_index =3D -1;
> +	}
> +
> +	if (buf->u_canvas_index >=3D 0) {
> +		dev_dbg(hw->dev, "free uv_canvas_index %d\n",
> +			buf->u_canvas_index);
> +		meson_canvas_free(hw->canvas, buf->u_canvas_index);
> +		buf->u_canvas_index =3D -1;
> +		buf->v_canvas_index =3D -1;
> +	}
> +}
[ ... ]
> +static irqreturn_t h264_threaded_isr_func(int irq, void *priv)
> +{
> +	u32 dec_status;
> +	struct aml_vdec_dev *dev =3D (struct aml_vdec_dev *)priv;
> +	struct aml_h264_ctx *h264_ctx =3D (struct aml_h264_ctx *)dev->dec_hw->c=
urr_ctx;
> +	struct aml_vdec_ctx *ctx =3D (struct aml_vdec_ctx *)dev->dec_ctx;
> +	struct aml_vdec_hw *hw =3D vdec_get_hw(ctx->dev);
> +	unsigned short *p =3D (unsigned short *)h264_ctx->lmem_addr;
> +	int i, ii;
> +
> +	regmap_read(hw->map[DOS_BUS], DPB_STATUS_REG, &dec_status);
> +	h264_ctx->dec_status =3D dec_status;
> +	dev_dbg
> +	    (&dev->plat_dev->dev,
> +	     "%s, dec_status 0x%x VIFF_BIT_CNT 0x%x MBY_MBX 0x%x VLD_SHIFT_STAT=
US 0x%x\n",
> +	     __func__, dec_status, read_dos_reg(hw, VIFF_BIT_CNT),
> +	     read_dos_reg(hw, MBY_MBX), read_dos_reg(hw, VLD_SHIFT_STATUS));
> +
> +	regmap_read(hw->map[DOS_BUS], AV_SCRATCH_F, &h264_ctx->save_avscratch_f=
);
> +
> +	switch (dec_status) {
> +	case H264_SLICE_HEADER_DONE:
> +		for (i =3D 0; i < 0x400; i +=3D 4)
> +			for (ii =3D 0; ii < 4; ii++)
> +				h264_ctx->dpb_param.l.data[i + ii] =3D p[i + 3 - ii];

[Severity: Medium]
Since lmem_addr holds DMA memory populated by the hardware, should a dma_rm=
b()
barrier be issued before reading from `p` to ensure the CPU doesn't observe
stale cached data?

> +		save_reg_status(h264_ctx);
> +		h264_get_slice_params(h264_ctx);
> +		if (h264_ctx->mslice.first_mb_in_slice !=3D 0)
> +			h264_release_decode_spec(hw, ctx);
> +
> +		h264_config_decode_spec(hw, ctx);
> +		h264_reorder_reflists(h264_ctx);
> +		get_canvas_index(hw, ctx);
> +
> +		if (h264_config_decode_buf(hw, ctx) < 0) {
> +			h264_release_decode_spec(hw, ctx);
> +			ctx->int_cond =3D 1;
> +			wake_up_interruptible(&ctx->queue);
> +			goto irq_handled;

[Severity: High]
If the execution takes this error path, ctx->int_cond =3D 1 satisfies the w=
ait
condition in m2mops_vdec_device_run(), which then returns directly without
canceling the job. Does this omit a necessary v4l2_m2m_buf_done_and_job_fin=
ish()
call and permanently stall the mem2mem context?

> +		}
> +		if (h264_ctx->new_pic_flag =3D=3D 1) {
> +			regmap_write(hw->map[DOS_BUS], DPB_STATUS_REG, H264_ACTION_DECODE_NEW=
PIC);
> +			dev_dbg(&dev->plat_dev->dev, "action decode new pic\n");
> +			h264_ctx->new_pic_flag =3D 0;
> +		} else {
> +			regmap_write(hw->map[DOS_BUS], DPB_STATUS_REG, H264_ACTION_DECODE_SLI=
CE);
> +			dev_dbg(&dev->plat_dev->dev, "action decode new slice\n");
> +		}
> +		break;
[ ... ]
> +static int aml_h264_load_fw_ext(void *priv, const u8 *data, u32 len)
> +{
> +	struct aml_h264_ctx *h264_ctx =3D (struct aml_h264_ctx *)priv;
> +	struct aml_vdec_ctx *ctx =3D (struct aml_vdec_ctx *)h264_ctx->v4l2_ctx;
> +	struct aml_vdec_hw *dec_hw;
> +
> +	if (h264_ctx->mc_cpu_loaded)
> +		return 0;
> +
> +	dec_hw =3D vdec_get_hw(ctx->dev);
> +	if (!dec_hw)
> +		return -1;
> +
> +	if (len > MC_TOTAL_SIZE) {
> +		dev_info(dec_hw->dev, "size of mc_cpu_fw id invalid\n");
> +		return -1;
> +	}

[Severity: Medium]
Should the firmware length also be checked against a minimum bounds before
calling copy_mc_cpu_fw()? Passing truncated firmware could cause out-of-bou=
nds
reads when accessing fixed offsets (e.g., data + 0x6000) inside copy_mc_cpu=
_fw().

> +
> +	h264_ctx->mc_cpu_vaddr =3D dma_alloc_coherent(dec_hw->dev, MC_TOTAL_SIZ=
E,
> +						    &h264_ctx->mc_cpu_paddr,
> +						    GFP_KERNEL);
> +	if (!h264_ctx->mc_cpu_vaddr)
> +		return -ENOMEM;
> +
> +	copy_mc_cpu_fw(h264_ctx->mc_cpu_vaddr, data);
> +
> +	h264_ctx->mc_cpu_loaded =3D true;
> +
> +	dev_dbg(dec_hw->dev, "h264 mccpu fw loaded\n");
> +
> +	return 0;
> +}
> +
> +int aml_h264_init(void *priv)
> +{
> +	struct aml_vdec_ctx *ctx =3D (struct aml_vdec_ctx *)priv;
> +	struct aml_vdec_hw *dec_hw;
> +	struct aml_h264_ctx *h264_ctx;
> +	int ret =3D 0;
> +
> +	h264_ctx =3D kzalloc_obj(*h264_ctx, GFP_KERNEL);
> +	if (!h264_ctx)
> +		return -ENOMEM;
> +
> +	h264_ctx->v4l2_ctx =3D ctx;
> +	dec_hw =3D vdec_get_hw(ctx->dev);
> +	if (!dec_hw)
> +		return -1;
> +
> +	h264_ctx->mc_cpu_loaded =3D false;
> +	dec_hw->hw_ops.irq_handler =3D h264_isr;
> +	dec_hw->hw_ops.irq_threaded_func =3D h264_threaded_isr_func;
> +	dec_hw->hw_ops.load_firmware_ex =3D aml_h264_load_fw_ext;
> +
> +	h264_ctx->lmem_addr =3D dma_alloc_coherent(dec_hw->dev, LMEM_DUMP_SIZE,
> +						 &h264_ctx->lmem_phy_addr,
> +						 GFP_KERNEL);
> +	if (!h264_ctx->lmem_addr) {
> +		ret =3D -ENOMEM;
> +		goto err_alloc_lmem;
> +	}
> +
> +	h264_ctx->cma_alloc_vaddr =3D
> +	    dma_alloc_coherent(dec_hw->dev, V_BUF_ADDR_OFFSET,
> +			       &h264_ctx->cma_alloc_addr, GFP_KERNEL);
> +	if (!h264_ctx->cma_alloc_vaddr) {
> +		ret =3D -ENOMEM;
> +		goto err_alloc_workspace;
> +	}
> +
> +	h264_ctx->workspace_offset =3D h264_ctx->cma_alloc_addr + DCAC_READ_MAR=
GIN;
> +	h264_ctx->workspace_vaddr =3D h264_ctx->cma_alloc_vaddr + DCAC_READ_MAR=
GIN;
> +
> +	ctx->codec_priv =3D h264_ctx;
> +	dec_hw->curr_ctx =3D h264_ctx;

[Severity: Critical]
Similar to the issue in fops_vcodec_open(), could assigning the context to
dec_hw->curr_ctx here break isolation across multiple concurrent instances?
When multiple streams are active, the ISR will blindly dereference curr_ctx,
potentially targeting the wrong or freed context.

> +	h264_ctx->col_buf_alloc_size =3D 0;
> +	h264_ctx->init_flag =3D 0;
> +	h264_ctx->new_pic_flag =3D 0;
> +	h264_ctx->param_set =3D 0;
> +	h264_ctx->reg_iqidct_control_init_flag =3D 0;
> +	h264_ctx->decode_pic_count =3D 0;
> +
> +	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-b4-s4-vdec=
-upstream-v5-0-33bc817f93f4@amlogic.com?part=3D4
