Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792648880;
	b=uRbmDW+6gBl1AgrMCCXVyCZfozGGybkIjep6Vh6zckLvaF4fP9jouEjPH4wEKqzo3f5G
	 qbPQkPjAPq1V1fk2xGwW+cz2Pa0LnkTCVtZvWOExqN+YWtudW01Dmyr6FBwI5wwhToWyL
	 4XtTwTd/sq+KFgHrdn3pHtgIQEVXsPHYn805zy1jAQF4FlZCqu89+wZ6quxRrP/Ts2BlE
	 bRasczivUkXm1CNlQwmWfm/Zyh0GBmQFjQYxz635w7WaD3WD8IK4CNNxyuJENAfCpFoEW
	 7ZgMZWQCxdC6rVncwxv3WQPxncpKJltMn2ewJkQrTYoWRNo5IJXNTywF195yiY2cCtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792648880;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4UYII/jxqMf0Quc8mwHI4jTBZTgUQarKMX32yAjEysA=;
	b=L/H7JRjwZSnDvkpFpAlpehtomcTjcR0FX3r5YBtfQl36a/RU94YqJdzRPo//9WdMb1jc
	 ElKZJIPG9EPwtt6wgQpdwxpxmt0kH60VYfk9vnJOxuaTBeo+yky9Z8hDDdHYs5qaGaf6U
	 v9Vxt6VTJ1yzhssA1H5lC3SbJS4sE/10kDNqSddluuWtRc0AHgWLM1eUlwpE6tabKVrVw
	 mS19qyPZzRdNF0i5Tuv3goerhqta2fYlNu9QvrmVEvmgkylGi9rvC2o86V9f/Zy3A2BB8
	 HMaOo4Ks3NaH+UHnA9ThTrbyhnEWOu/jQkSZtMyd8MUj1UjjiyhGH8Z+gvJ+hpnHzmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P5ukIY0p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C81606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 06:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P5ukIY0p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3541F000C1;
	Thu, 22 Oct 2026 06:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792648879;
	bh=4UYII/jxqMf0Quc8mwHI4jTBZTgUQarKMX32yAjEysA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P5ukIY0pmciuJ3ESYXxuJNznGL7xRM+JIpLf9K9mdsPenrSQKjyE3WMkSv0DxwM7J
	 LjVSNmcoBK8HSzI5CAbXmriLh/96UNe+JSKHwYYcv4zpx6zBsgxnRaC2AllYbVH2+J
	 vLg8lJ+LnyChlUXWHkyXLiTGFJmYzCP6+qVo85Ao8hsqt7n6HR8DFyc2Hugm2djc2a
	 RntP6YgLuGX2rkbxVDHcQDL/op4RN7AupXvyi86M4T6Kuowmk0jTy0ajmRxwrXkkgG
	 yArE+JABw1PsmD/i0k3QjVuXTTu98bXWazooY4VFBc9TTSNrEuuaSe63KAjMJCOd8/
	 FXKx8st78VODw==
Message-ID: <sashiko-outbox-181046@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 5/6] arm64: dts: amlogic: Add video decoder driver
 support for S4 SOCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, media-ci@linuxtv.org
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-5-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
 <20261022-b4-s4-vdec-upstream-v12-5-616240978792@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 06:01:18 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [Critical] media: amlogic: vdec: OOB read and canvas leaks in h264 refere=
nce list handling
- [Critical] media: amlogic: vdec: colocate buffer OOB DMA write in h264_co=
nfig_decode_buf()
- [High] media: amlogic: vdec: aml_vdec_init_dec_inst() returns -1 on queue=
 restart
- [High] media: amlogic: vdec: invalid IS_ERR() check on meson_sm_get() in =
probe
- [High] media: amlogic: vdec: poc_is_in_dpb() and get_dpb_by_poc() ignore =
active flag
- [High] media: amlogic: vdec: dos clock in vdec_clock_gate_init() is never=
 enabled
- [High] media: amlogic: vdec: ignored power and clock errors in aml_vdec_h=
w.c
- [High] media: amlogic: vdec: aml_vdec_drv_remove() powers off hw before u=
nregistering
- [High] media: amlogic: vdec: broken TEE deferral and error codes in aml_v=
dec_tee_fw.c
- [High] media: amlogic: vdec: infinite poll under ctx_mutex in h264_config=
_decode_buf()
- [Medium] media: amlogic: vdec: missing REGMAP_MMIO and MEDIA_CONTROLLER s=
elects
- [Medium] media: amlogic: vdec: aml_vdec_drv_probe() registers video_devic=
e too early
- [Medium] media: amlogic: vdec: missing set_pic_info() in reset_output_fmt=
s()
--

commit 7d77b0e5560dd6f7c9fdd465c00fffdff91c7e55
Author: Zhentao Guo <zhentao.guo@amlogic.com>

arm64: dts: amlogic: Add video decoder driver support for S4 SOCs

This series adds the Amlogic S4 V4L2 stateless H.264 video decoder driver in
commit 18a11b2c70a7ef55c42ed897bc1624397ec3430c ("decoder: Add V4L2 statele=
ss
H.264 decoder driver") and enables the corresponding vdec, canvas, and optee
device tree nodes in meson-s4.dtsi.

> diff --git a/drivers/media/platform/amlogic/vdec/Kconfig b/drivers/media/=
platform/amlogic/vdec/Kconfig
> new file mode 100644
> index 0000000000000..2c5dd84529621
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
> +    depends on MESON_SM
> +    select VIDEOBUF2_DMA_CONTIG
> +    select V4L2_H264
> +    select V4L2_MEM2MEM_DEV
> +    select MESON_CANVAS

[Severity: Medium]
Should VIDEO_AMLOGIC_VDEC also select REGMAP_MMIO and MEDIA_CONTROLLER here?

In drivers/media/platform/amlogic/vdec/aml_vdec_hw.c,
dev_request_hw_resources() calls devm_regmap_init_mmio(), which fails to li=
nk
when CONFIG_REGMAP_MMIO is disabled.

In addition, aml_vdec_drv_probe() in
drivers/media/platform/amlogic/vdec/aml_vdec_drv.c registers a media device
with aml_m2m_media_ops (vb2_request_validate and v4l2_m2m_request_queue) for
stateless H.264 decoding, which compiles to no-op stubs if
CONFIG_MEDIA_CONTROLLER is disabled. In
drivers/media/platform/amlogic/vdec/aml_vdec.c, should aml_vdec_queue_init()
also set src_vq->requires_requests =3D true alongside
src_vq->supports_requests =3D true so non-request buffers are rejected?

[ ... ]

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.c b/drivers/med=
ia/platform/amlogic/vdec/aml_vdec.c
> new file mode 100644
> index 0000000000000..e65ebb2ce311f
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c

[ ... ]

> +static int aml_vdec_init_dec_inst(struct aml_vdec_ctx *ctx)
> +{
> +	struct aml_vdec_dev *dev =3D ctx->dev;
> +	struct aml_video_fmt *fmt_out =3D &ctx->dec_fmt[AML_FMT_SRC];
> +	int ret =3D -1;
> +
> +	ctx->codec_ops =3D &dev->pvdec_data->codec_ops[fmt_out->codec_type];
> +	/*
> +	 * The codec instance is only released when both queues are
> +	 * streamed off: do not allocate a new one (leaking the previous
> +	 * instance) when the output queue is restarted while the
> +	 * capture queue is still streaming.
> +	 */
> +	if (ctx->codec_ops->init && !ctx->codec_priv) {
> +		ret =3D ctx->codec_ops->init(ctx);
> +		if (ret < 0)
> +			return ret;
> +	}
> +	ctx->curr_dec_type =3D fmt_out->codec_type;
> +	dev_info(&dev->plat_dev->dev, "%s set curr_dec_type %s\n",
> +		 __func__, dec_type_to_name(ctx->curr_dec_type));
> +
> +	return ret;
> +}

[Severity: High]
When the output queue is stopped and restarted while the capture queue rema=
ins
streaming, ctx->codec_priv is already non-NULL, so aml_vdec_init_dec_inst()
skips ctx->codec_ops->init(ctx) and returns the initial ret =3D -1.

In vb2ops_vdec_start_streaming():

    if (aml_vdec_init_dec_inst(ctx) < 0) {
        while ((src_buf =3D v4l2_m2m_src_buf_remove(ctx->m2m_ctx)))
            v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_QUEUED);
        return -EINVAL;
    }

Won't this cause vb2ops_vdec_start_streaming() to always fail with -EINVAL =
on
output queue restart unless ret is initialized to 0 in
aml_vdec_init_dec_inst()?

[ ... ]

> +static int vdec_try_fmt_mp(struct aml_vdec_ctx *ctx, enum v4l2_buf_type =
type,
> +			   struct v4l2_pix_format_mplane *pix_mp,
> +			   const struct aml_video_fmt *dec_fmt)
> +{
> +	int i, align;
> +
> +	pix_mp->field =3D V4L2_FIELD_NONE;
> +	align =3D dec_fmt->align;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(type)) {
> +		pix_mp->num_planes =3D dec_fmt->num_planes;
> +		pix_mp->pixelformat =3D dec_fmt->fourcc;
> +		if (!pix_mp->plane_fmt[0].sizeimage)
> +			pix_mp->plane_fmt[0].sizeimage =3D
> +			    (pix_mp->height * pix_mp->width * 3) / 2;
> +		pix_mp->height =3D ALIGN(pix_mp->height, align);
> +		pix_mp->width =3D ALIGN(pix_mp->width, align);
> +	} else {
> +		pix_mp->height =3D ctx->pix_fmt[AML_FMT_SRC].height;
> +		pix_mp->width =3D ctx->pix_fmt[AML_FMT_SRC].width;
> +	}
> +
> +	v4l2_apply_frmsize_constraints(&pix_mp->width, &pix_mp->height,
> +				       &dec_fmt->stepwise);

[ ... ]

> +static int vdec_s_fmt_output(struct aml_vdec_ctx *ctx, struct v4l2_forma=
t *f)
> +{
> +	struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> +	struct v4l2_pix_format_mplane *cap_fmt =3D &ctx->pix_fmt[AML_FMT_DST];
> +	const struct aml_video_fmt *out_fmt;
> +	struct vb2_queue *vq, *peer_vq;
> +	int ret;
> +
> +	vq =3D v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	if (vb2_is_busy(vq) &&
> +	    pix_mp->pixelformat !=3D ctx->pix_fmt[AML_FMT_SRC].pixelformat)
> +		return -EBUSY;
> +
> +	/*
> +	 * Since s_fmt output will reset the width and height in the capture qu=
eue,
> +	 * s_fmt_output with resolution change should not take effect when capt=
ure
> +	 * queue is busy.
> +	 */
> +	peer_vq =3D v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_M=
PLANE);
> +	if (vb2_is_busy(peer_vq) &&
> +	    (pix_mp->width !=3D cap_fmt->width ||
> +	    pix_mp->height !=3D cap_fmt->height))
> +		return -EBUSY;

[ ... ]

> +static void reset_output_fmts(struct aml_vdec_ctx *ctx)
> +{
> +	struct aml_vdec_dev *dev =3D ctx->dev;
> +	const struct aml_video_fmt *out_fmt;
> +	struct v4l2_pix_format_mplane fmt;
> +
> +	/* reset default output fmt to V4L2_PIX_FMT_H264_SLICE */
> +	out_fmt =3D aml_vdec_get_video_fmt(dev, V4L2_PIX_FMT_H264_SLICE);
> +	if (!out_fmt)
> +		return;
> +
> +	ctx->dec_fmt[AML_FMT_SRC] =3D *out_fmt;
> +
> +	memset(&fmt, 0, sizeof(struct v4l2_pix_format_mplane));
> +
> +	fmt.height =3D out_fmt->stepwise.min_height;
> +	fmt.width =3D out_fmt->stepwise.min_width;
> +	/* reset bytesperline to 0 for output fmts */
> +	fmt.plane_fmt[0].bytesperline =3D 0;
> +	fmt.colorspace =3D V4L2_COLORSPACE_DEFAULT;
> +	fmt.ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
> +	fmt.quantization =3D V4L2_QUANTIZATION_DEFAULT;
> +	fmt.xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
> +	vdec_try_fmt_mp(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, &fmt,
> +			out_fmt);
> +
> +	ctx->pix_fmt[AML_FMT_SRC] =3D fmt;
> +}

[Severity: Medium]
In fops_vcodec_open() -> aml_vdec_reset_fmts() -> reset_output_fmts(),
set_pic_info() is not called after vdec_try_fmt_mp(). If userspace starts
streaming without calling vdec_s_fmt_output(), won't ctx->pic_info.fb_size[=
0]
remain 0, causing h264_config_decode_spec() and h264_config_ref_spec() in
drivers/media/platform/amlogic/vdec/h264.c to set c_dma_addr equal to
y_dma_addr for single-planar NV12/NV21 capture buffers?

Also in vdec_try_fmt_mp(), pix_mp->plane_fmt[0].sizeimage is calculated from
pix_mp->height * pix_mp->width before ALIGN() and
v4l2_apply_frmsize_constraints() clamp the dimensions, and in
vdec_s_fmt_output(), pix_mp->width and pix_mp->height are compared against =
the
64-aligned cap_fmt dimensions before vdec_try_fmt_mp() aligns them. Should
sizeimage and the busy resolution check use the aligned and clamped dimensi=
ons
instead?

[ ... ]

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c b/drivers=
/media/platform/amlogic/vdec/aml_vdec_drv.c
> new file mode 100644
> index 0000000000000..1870d56659cf4
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c

[ ... ]

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
> +	return 0;

[Severity: Medium]
In aml_vdec_drv_probe(), video_register_device() exposes the video node to
userspace before dev->v4l2_dev.mdev is initialized, before the media
controller entities are registered, and before vdec_enable(dev->dec_hw) pow=
ers
on the VDEC hardware domain and clock.

Could a userspace process open the video device immediately after
video_register_device() and race with media controller setup or trigger
m2mops_vdec_device_run() before vdec_enable() has run?

[ ... ]

> +static void aml_vdec_drv_remove(struct platform_device *pdev)
> +{
> +	struct aml_vdec_dev *dev =3D platform_get_drvdata(pdev);
> +
> +	/*
> +	 * The IRQ is devm-managed and only released after remove()
> +	 * returns: mask it and wait for any in-flight threaded handler
> +	 * before powering off the VDEC domain, otherwise the handler
> +	 * could access powered-down registers.
> +	 */
> +	disable_irq(dev->dec_hw->dec_irq);
> +	vdec_disable(dev->dec_hw);
> +	media_device_unregister(&dev->mdev);
> +	v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +	video_unregister_device(dev->vfd);
> +	media_device_cleanup(&dev->mdev);
> +
> +	v4l2_m2m_release(dev->m2m_dev_dec);
> +	dev->pvdec_data->destroy_hw_resource(dev);
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +}

[Severity: High]
In aml_vdec_drv_remove(), disable_irq() and vdec_disable(dev->dec_hw) power
off the VDEC domain and disable the VDEC clock before unregistering the med=
ia
and video devices or releasing M2M contexts.

If a decode job is in flight in aml_h264_dec_run() or an open file handle is
subsequently closed via fops_vcodec_release() -> vb2ops_vdec_stop_streaming=
()
-> aml_h264_exit(), won't read_dos_reg() and aml_stop_vdec_hw() perform MMIO
accesses to DOS_BUS registers that have already been powered down and
unclocked?

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c b/drivers/=
media/platform/amlogic/vdec/aml_vdec_hw.c
> new file mode 100644
> index 0000000000000..043f0bbf32516
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c

[ ... ]

> +void dos_enable(struct aml_vdec_hw *hw)
> +{
> +	dos_reg_write_bits(hw, DOS_GCLK_EN0, 0x3ff, 0, 10);
> +
> +	regmap_write(hw->map[DOS_BUS], GCLK_EN, 0x3ff);
> +
> +	regmap_update_bits(hw->map[DOS_BUS], MDEC_PIC_DC_CTRL, (1 << 31), 0);
> +}

[ ... ]

> +static int vdec_clock_gate_init(struct aml_vdec_hw *hw)
> +{
> +	hw->gates[CLK_DOS].id =3D "dos";
> +	hw->gates[CLK_VDEC].id =3D "vdec";
> +	hw->gates[CLK_HVDEC].id =3D "hvdec";
> +
> +	return devm_clk_bulk_get(hw->dev, CLK_MAX, hw->gates);
> +}

[Severity: High]
vdec_clock_gate_init() acquires hw->gates[CLK_DOS] ("dos"), but
pm_vdec_power_domain_power_on() and pm_vdec_power_domain_power_off() only
enable and disable the "vdec" and "hvdec" clocks, and dos_enable() only wri=
tes
internal DOS registers.

Where is hw->gates[CLK_DOS].clk prepared and enabled before dos_local_confi=
g()
and dos_enable() access DOS_BUS registers? If CLKID_DOS is gated by the
bootloader or clk_disable_unused, won't these MMIO accesses hang or abort?

[ ... ]

> +static int pm_vdec_power_domain_init(struct aml_vdec_hw *hw)
> +{
> +	int i, err;
> +	const struct power_manager_s *pm =3D hw->pm;
> +	struct pm_pd_s *pd =3D pm->pd_data;
> +
> +	mutex_init(&hw->pm_mutex);
> +
> +	for (i =3D 0; i < VDEC_MAX; i++) {
> +		pd[i].dev =3D dev_pm_domain_attach_by_name(hw->dev, pd[i].name);
> +		if (IS_ERR_OR_NULL(pd[i].dev)) {
> +			err =3D PTR_ERR(pd[i].dev);
> +			dev_dbg(hw->dev, "Get %s failed, pm-domain: %d\n",
> +				pd[i].name, err);
> +			pd[i].dev =3D NULL;
> +			continue;
> +		}

[ ... ]

> +static void pm_vdec_power_domain_power_on(struct aml_vdec_hw *hw, int id)
> +{
> +	const struct power_manager_s *pm =3D hw->pm;
> +	struct device *dev =3D pm->pd_data[id].dev;
> +	struct clk_bulk_data *gate_node =3D NULL;
> +	int ret =3D 0;
> +
> +	if (id =3D=3D VDEC)
> +		gate_node =3D vdec_get_clk_by_name(hw, "vdec");
> +	else if (id =3D=3D HVDEC)
> +		gate_node =3D vdec_get_clk_by_name(hw, "hvdec");
> +
> +	if (gate_node) {
> +		ret =3D clk_prepare_enable(gate_node->clk);
> +		if (ret) {
> +			dev_err(hw->dev, "failed to enable %s clock: %d\n",
> +				gate_node->id, ret);
> +		} else {
> +			if (id =3D=3D VDEC) {
> +				clk_set_rate(gate_node->clk, 499999992);
> +				dev_dbg(hw->dev, "after set, vdec clock is %lu Hz\n",
> +					clk_get_rate(gate_node->clk));
> +			}
> +			dev_dbg(hw->dev, "the %-15s clock on\n", gate_node->id);
> +		}
> +	} else {
> +		dev_info(hw->dev, "clk %d, unreachable\n", id);
> +		ret =3D -ENODEV;
> +	}
> +
> +	if (!ret && dev) {
> +		ret =3D pm_runtime_resume_and_get(dev);
> +		if (ret < 0)
> +			dev_err(hw->dev, "failed to power on %s domain: %d\n",
> +				pm->pd_data[id].name, ret);
> +		else
> +			dev_dbg(dev, "dev: %p link %p the %-15s power on\n",
> +				dev, pm->pd_data[id].link, pm->pd_data[id].name);
> +	}
> +
> +	/*
> +	 * Do not touch the DOS registers when the clock or the power
> +	 * domain could not be enabled, the MMIO access would abort.
> +	 */
> +	if (!ret)
> +		dos_local_config(hw, 1, id);
> +}
> +
> +static void pm_vdec_power_domain_power_off(struct aml_vdec_hw *hw, int i=
d)
> +{
> +	const struct power_manager_s *pm =3D hw->pm;
> +	struct device *dev =3D pm->pd_data[id].dev;
> +	struct clk_bulk_data *gate_node =3D NULL;
> +
> +	dos_local_config(hw, 0, id);
> +
> +	if (dev) {
> +		pm_runtime_put_sync(dev);
> +		dev_dbg(dev, "dev: %p link %p the %-15s power off\n",
> +			dev, pm->pd_data[id].link, pm->pd_data[id].name);
> +	}
> +
> +	if (id =3D=3D VDEC)
> +		gate_node =3D vdec_get_clk_by_name(hw, "vdec");
> +	else if (id =3D=3D HVDEC)
> +		gate_node =3D vdec_get_clk_by_name(hw, "hvdec");
> +
> +	if (gate_node) {
> +		clk_disable_unprepare(gate_node->clk);
> +		dev_dbg(hw->dev, "the %-15s clock off\n", gate_node->id);
> +	} else {
> +		dev_info(hw->dev, "clk %d, unreachable\n", id);
> +	}
> +}
> +
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
> +	hw->pm->power_on(hw, core);
> +
> +out:
> +	mutex_unlock(&hw->pm_mutex);
> +}

[Severity: High]
There appear to be two error-handling issues in the power domain and clock
helpers here:

1. In pm_vdec_power_domain_init(), if dev_pm_domain_attach_by_name() returns
an error pointer (such as -EPROBE_DEFER) or NULL, pd[i].dev is set to NULL =
and
the loop continues while returning 0. Then vdec_poweron() sees
!hw->pm->pd_data[core].dev and exits without enabling the clock or power
domain, while vdec_enable() still returns 0. Won't subsequent MMIO writes in
m2mops_vdec_device_run() -> dos_enable() access unpowered and unclocked DOS
registers?

2. In pm_vdec_power_domain_power_on(), if clk_prepare_enable(gate_node->clk)
succeeds and pm_runtime_resume_and_get(dev) fails, gate_node->clk is left
enabled and the failure is not propagated to vdec_poweron() or vdec_enable(=
),
leaving ref_count at 1. When vdec_disable() -> vdec_poweroff() ->
pm_vdec_power_domain_power_off() later runs, won't it call
dos_local_config(hw, 0, id) on the unpowered domain and call
pm_runtime_put_sync(dev) despite pm_runtime_resume_and_get(dev) having fail=
ed?

[ ... ]

> +	hw->canvas =3D meson_canvas_get(&pdev->dev);
> +	if (IS_ERR_OR_NULL(hw->canvas))
> +		return PTR_ERR(hw->canvas);
> +
> +	sm_np =3D of_parse_phandle(pdev->dev.of_node, "amlogic,secure-monitor",=
 0);
> +	if (!sm_np)
> +		return -ENODEV;
> +
> +	hw->sec_fw =3D meson_sm_get(sm_np);
> +	of_node_put(sm_np);
> +	if (IS_ERR(hw->sec_fw))
> +		return PTR_ERR(hw->sec_fw);

[Severity: High]
In drivers/firmware/meson/meson_sm.c, meson_sm_get() returns NULL (not an
ERR_PTR) when the secure-monitor platform device has not probed yet.

Because IS_ERR(NULL) is false, dev_request_hw_resources() succeeds with
hw->sec_fw =3D=3D NULL instead of returning -EPROBE_DEFER. When decoding st=
arts in
m2mops_vdec_device_run() -> load_firmware() -> meson_sm_call(hw->sec_fw, ..=
.),
won't meson_sm_call() dereference a NULL hw->sec_fw pointer on fw->chip?

Similarly, above that check, if meson_canvas_get() were to return NULL,
if (IS_ERR_OR_NULL(hw->canvas)) return PTR_ERR(hw->canvas); would return 0.
Should hw->canvas use IS_ERR(hw->canvas) and hw->sec_fw check !hw->sec_fw a=
nd
return -EPROBE_DEFER?

[ ... ]

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c b/driv=
ers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
> new file mode 100644
> index 0000000000000..9af9eae88fb89
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c

[ ... ]

> +	/* Open session */
> +	memcpy(sess_arg.uuid, uuid.b, TEE_IOCTL_UUID_LEN);
> +	sess_arg.clnt_login =3D TEE_IOCTL_LOGIN_PUBLIC;
> +	sess_arg.num_params =3D TEE_PARAM_NUM;
> +	ret =3D tee_client_open_session(ctx, &sess_arg, param_init);
> +	if (ret < 0 || sess_arg.ret !=3D TEEC_SUCCESS) {
> +		dev_info(hw->dev,
> +			 "%s open session failed, cmd =3D %u, ret =3D %d, res =3D 0x%x, origi=
n =3D 0x%x\n",
> +			 __func__, cmd, ret, sess_arg.ret, sess_arg.ret_origin);
> +		if (!ret)
> +			ret =3D sess_arg.ret;
> +		goto free_shm;
> +	}
> +
> +	inv_arg.func =3D cmd;
> +	inv_arg.session =3D sess_arg.session;
> +	inv_arg.num_params =3D TEE_PARAM_NUM;
> +
> +	while (sent_size < fw_size) {
> +		memset(shm_va, 0, ONCE_SENT_SIZE);
> +		if (fw_size - sent_size > ONCE_SENT_SIZE) {
> +			memcpy(shm_va, (firmware_data + sent_size),
> +			       ONCE_SENT_SIZE);
> +			param_invoke[0].u.memref.size =3D ONCE_SENT_SIZE;
> +		} else {
> +			memcpy(shm_va, (firmware_data + sent_size),
> +			       fw_size - sent_size);
> +			param_invoke[0].u.memref.size =3D (fw_size - sent_size);
> +		}
> +		param_invoke[0].u.memref.shm =3D shm;
> +		ret =3D tee_client_invoke_func(ctx, &inv_arg, param_invoke);
> +		if (ret < 0 || (inv_arg.ret !=3D TEEC_SUCCESS && inv_arg.ret !=3D TEEC=
_ERROR_BUSY)) {
> +			dev_info(hw->dev,
> +				 "%s invoke func failed, cmd =3D %u, ret=3D %d, res =3D 0x%x, origin=
 =3D 0x%x\n",
> +				 __func__, cmd, ret, inv_arg.ret,
> +				 inv_arg.ret_origin);
> +			if (!ret)
> +				ret =3D inv_arg.ret;
> +			goto close_session;
> +		}
> +		sent_size +=3D param_invoke[0].u.memref.size;
> +	}

[ ... ]

> +	ctx =3D tee_client_open_context(NULL, optee_ctx_match, NULL, NULL);
> +	if (IS_ERR(ctx)) {
> +		dev_info(hw->dev, "Failed to open TEE context\n");
> +		ret =3D PTR_ERR(ctx);
> +		goto free_firmware;
> +	}

[Severity: High]
In aml_vdec_drv_probe() -> dev_request_hw_resources() -> aml_tee_fw_preload=
()
-> pass_firmware_to_tee():

1. When the OP-TEE driver has not registered its TEE device yet,
tee_client_open_context() returns ERR_PTR(-ENOENT). Propagating -ENOENT cau=
ses
aml_vdec_drv_probe() to fail permanently instead of deferring probe with
-EPROBE_DEFER.

2. In tee_pta_invoke_cmd(), when tee_client_open_session() or
tee_client_invoke_func() returns 0 with sess_arg.ret !=3D TEEC_SUCCESS or
inv_arg.ret !=3D TEEC_SUCCESS, ret is assigned the raw u32 TEEC status code
rather than a negative errno (which aml_vdec_drv_probe() only checks for
ret < 0).

3. In tee_pta_invoke_cmd(), when inv_arg.ret =3D=3D TEEC_ERROR_BUSY, the er=
ror
branch is skipped and sent_size +=3D param_invoke[0].u.memref.size advances=
 past
the current 128 KB chunk without retrying it. Won't this silently drop a
chunk of firmware data?

[ ... ]

> diff --git a/drivers/media/platform/amlogic/vdec/h264.c b/drivers/media/p=
latform/amlogic/vdec/h264.c
> new file mode 100644
> index 0000000000000..7ec7af73d44c7
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/h264.c

[ ... ]

> +static int poc_is_in_dpb(int poc, const struct v4l2_h264_dpb_entry *dpb)
> +{
> +	int i;
> +	int ret =3D 0;
> +
> +	for (i =3D 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
> +		if (poc =3D=3D dpb[i].top_field_order_cnt) {
> +			ret =3D 1;
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}

[Severity: High]
In poc_is_in_dpb(), dpb[i].top_field_order_cnt is matched across all 16
entries of dpb[] without checking dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_A=
CTIVE.
The same issue also occurs in get_dpb_by_poc() further below:

    static struct v4l2_h264_dpb_entry *
    get_dpb_by_poc(struct v4l2_ctrl_h264_decode_params *decode, int poc)
    {
        int i;

        for (i =3D 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
            if (decode->dpb[i].top_field_order_cnt =3D=3D poc)
                return &decode->dpb[i];
        }
        return NULL;
    }

Because unused DPB entries have flags =3D=3D 0 and top_field_order_cnt =3D=
=3D 0 (and
evicted entries may retain their stale top_field_order_cnt with the active
flag cleared):

1. In h264_config_decode_spec() -> clear_unused_col_buf(), poc_is_in_dpb()
matches inactive DPB slots, preventing canvas_pos and colocated_buf slots f=
rom
being released on non-IDR frames and exhausting the 17 canvas_pos slots
(especially on multi-slice frames where h264_config_decode_spec() is called=
 on
every slice).

2. In h264_config_decode_buf(), if an inactive DPB slot with
top_field_order_cnt =3D=3D 0 precedes an active reference picture with POC =
0,
get_dpb_by_poc(decode, 0) returns the inactive slot, so
if (dpb && (dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)) evaluates to fal=
se
and writes 0 into H264_BUFFER_INFO_DATA for the active reference frame.

Should both poc_is_in_dpb() and get_dpb_by_poc() require
(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)?

[ ... ]

> +static int get_refidx_by_picnum(struct aml_h264_ctx *h264_ctx, int pic_n=
um,
> +				int curr_list)
> +{
> +	int i;
> +	struct h264_decode_buf_spec *ref_list;
> +
> +	if (curr_list =3D=3D 0)
> +		ref_list =3D &h264_ctx->ref_list0[0];
> +	else
> +		ref_list =3D &h264_ctx->ref_list1[0];
> +
> +	for (i =3D 0; ref_list[i].dpb; i++) {
> +		if (pic_num =3D=3D ref_list[i].dpb->pic_num)
> +			return i;
> +	}
> +
> +	return -1;
> +}
> +
> +static struct h264_decode_buf_spec *get_st_refpic_by_num(struct aml_h264=
_ctx *h264_ctx,
> +							 int pic_num, int curr_list)
> +{
> +	int i;
> +	struct h264_decode_buf_spec *ref_list;
> +
> +	if (curr_list =3D=3D 0)
> +		ref_list =3D &h264_ctx->ref_list0_unreordered[0];
> +	else
> +		ref_list =3D &h264_ctx->ref_list1_unreordered[0];
> +
> +	for (i =3D 0; ref_list[i].dpb; i++) {
> +		if (pic_num =3D=3D ref_list[i].dpb->pic_num && ref_list[i].long_term_f=
lag =3D=3D 0)
> +			return &ref_list[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct h264_decode_buf_spec *get_lt_refpic_by_num(struct aml_h264=
_ctx *h264_ctx,
> +							 int pic_num, int curr_list)
> +{
> +	int i;
> +	struct h264_decode_buf_spec *ref_list;
> +
> +	if (curr_list =3D=3D 0)
> +		ref_list =3D &h264_ctx->ref_list0_unreordered[0];
> +	else
> +		ref_list =3D &h264_ctx->ref_list1_unreordered[0];
> +
> +	for (i =3D 0; ref_list[i].dpb; i++) {
> +		if (pic_num =3D=3D ref_list[i].dpb->pic_num && ref_list[i].long_term_f=
lag =3D=3D 1)
> +			return &ref_list[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static void reorder_short_term(struct slice *curr_slice, int cur_list,
> +			       int pic_num_lx, int *ref_idx_lx)
> +{

[ ... ]

> +	for (c_idx =3D num_ref_idx_lx_active; c_idx > *ref_idx_lx; c_idx--)
> +		memcpy(&ref_list_reordered[c_idx], &ref_list_reordered[c_idx - 1],
> +		       sizeof(struct h264_decode_buf_spec));
> +
> +	memcpy(&ref_list_reordered[*ref_idx_lx], pic_lx, sizeof(struct h264_dec=
ode_buf_spec));
> +	dev_dbg(&ctx->dev->plat_dev->dev, "%s : RefPicListX[%d ] =3D pic %p pic=
_num(%d)\n", __func__,
> +		*ref_idx_lx, pic_lx, ref_list_reordered[*ref_idx_lx].dpb->pic_num);
> +	*ref_idx_lx =3D *ref_idx_lx + 1;
> +
> +	n_idx =3D *ref_idx_lx;
> +	for (c_idx =3D *ref_idx_lx; c_idx <=3D num_ref_idx_lx_active; c_idx++) {
> +		if (ref_list_reordered[c_idx].long_term_flag || !ref_list_reordered[c_=
idx].dpb ||
> +		    ref_list_reordered[c_idx].dpb->pic_num !=3D pic_num_lx)
> +			memcpy(&ref_list_reordered[n_idx++], &ref_list_reordered[c_idx],
> +			       sizeof(struct h264_decode_buf_spec));
> +	}
> +
> +	h264_ctx->list_size[cur_list] =3D num_ref_idx_lx_active;
> +}

[Severity: Critical]
Can reference list reordering and canvas allocation read out of bounds,
dereference a NULL dpb pointer, and leak hardware canvases?

1. In reorder_short_term() and reorder_long_term(), when
num_ref_idx_lx_active =3D=3D 16 (V4L2_H264_NUM_DPB_ENTRIES), the shift loop=
 copies
ref_list[15] into ref_list[16] and sets list_size[cur_list] =3D 16. Because
h264_release_decode_spec() only clears indices 0 .. list_size[cur_list] - 1,
ref_list[16].dpb remains non-NULL. On a subsequent call where
ref_list[0..16].dpb are all non-NULL, the loops in get_refidx_by_picnum(),
get_st_refpic_by_num(), and get_lt_refpic_by_num() have no upper bound on i
and read past the end of ref_list0[] / ref_list1[].

2. When num_ref_idx_lx_active exceeds the number of valid entries built by
h264_config_ref_lists() (or when h264_config_ref_spec() fails on an entry),
reorder_short_term() and reorder_long_term() set
h264_ctx->list_size[cur_list] =3D num_ref_idx_lx_active. Then get_canvas_in=
dex()
allocates hardware canvases via config_decode_canvas() for every entry up to
list_size[cur_list] without checking buf->used or buf->valid (also writing =
DMA
address 0 to ANC0_CANVAS_ADDR for canvas_pos 0), whereas
h264_release_decode_spec() only frees canvases when if (buf->used) is true,
permanently leaking canvases from the meson_canvas pool. In addition, in
h264_threaded_isr_func(), h264_release_decode_spec() is only called before
get_canvas_index() when first_mb_in_slice !=3D 0, so a second
H264_SLICE_HEADER_DONE interrupt with first_mb_in_slice =3D=3D 0 leaks the
canvases allocated for the first slice.

3. In h264_config_decode_buf(), when h264_ctx->list_size[1] > 0,
colocate_pic =3D &h264_ctx->ref_list1[0] dereferences
colocate_pic->dpb->top_field_order_cnt without checking colocate_pic->valid=
 or
colocate_pic->dpb !=3D NULL.

[ ... ]

> +	read_poll_timeout(read_dos_reg, reg_val,
> +			  !(reg_val & 0x800),
> +			  10, 0, true, hw, H264_CO_MB_RW_CTL);

[Severity: High]
In h264_config_decode_buf(), read_poll_timeout() is called with timeout_us =
=3D 0
while vdec_threaded_isr_handler() holds hw->ctx_mutex.

Since timeout_us =3D 0 polls indefinitely in read_poll_timeout(), if bit 11
(0x800) of H264_CO_MB_RW_CTL does not clear, won't vdec_threaded_isr_handle=
r()
spin forever under hw->ctx_mutex and cause aml_h264_dec_run() to deadlock on
mutex_lock(&dec_hw->ctx_mutex) when wait_event_interruptible_timeout()
expires?

> +
> +	/* col buf for curr frame */
> +	colocate_adr_offset =3D COL_SIZE_FOR_ONE_MB;
> +	if (use_mode_8x8_flag)
> +		colocate_adr_offset >>=3D 2;
> +	colocate_adr_offset *=3D curr_slice->first_mb_in_slice;
> +
> +	if (h264_ctx->curr_spec.col_buf_index >=3D 0 &&
> +	    h264_ctx->curr_spec.col_buf_index < h264_ctx->colocated_buf_num) {
> +	    /* collated_cma_addr is limited to 32bit by flag GFP_DMA32 when all=
ocated */
> +		colocate_wr_adr =3D (unsigned int)h264_ctx->collated_cma_addr +
> +		    ((h264_ctx->one_col_buf_size *
> +		      h264_ctx->curr_spec.col_buf_index) >> (use_mode_8x8_flag ? 2 : 0=
));
> +		if (colocate_adr_offset > h264_ctx->one_col_buf_size ||
> +		    colocate_wr_adr + h264_ctx->one_col_buf_size >
> +		    (unsigned int)h264_ctx->collated_cma_addr_end) {
> +			dev_err(hw->dev,
> +				"Error, colocate buf is not enough, index is %d\n",
> +				h264_ctx->curr_spec.col_buf_index);
> +			return -1;
> +		}
> +		regmap_write(hw->map[DOS_BUS], H264_CO_MB_WR_ADDR,
> +			     (colocate_wr_adr + colocate_adr_offset));
> +		dev_dbg(hw->dev, "col buffer addr =3D 0x%x col_buf_index %d\n",
> +			(colocate_wr_adr + colocate_adr_offset),
> +			h264_ctx->curr_spec.col_buf_index);
> +	} else {
> +		regmap_write(hw->map[DOS_BUS], H264_CO_MB_WR_ADDR, 0xffffffff);
> +		dev_dbg(hw->dev, "col buffer addr =3D 0xffffffff\n");
> +	}
> +
> +	if (h264_ctx->list_size[1] > 0) {
> +		struct h264_decode_buf_spec *colocate_pic =3D
> +		    &h264_ctx->ref_list1[0];
> +		struct h264_decode_buf_spec *curr_pic =3D &h264_ctx->curr_spec;
> +		int l10_structure =3D 2;	/* for pic struct =3D=3D FRAME, default to 2 =
*/
> +		int cur_colocate_ref_type;
> +		unsigned int colocate_rd_adr;
> +		unsigned int colocate_rd_adr_offset =3D 0;
> +		unsigned int val;
> +
> +		cur_colocate_ref_type =3D
> +		    (abs(curr_pic->poc - colocate_pic->dpb->top_field_order_cnt) <
> +		     abs(curr_pic->poc - colocate_pic->dpb->bottom_field_order_cnt)) ?=
 0 : 1;
> +		colocate_rd_adr_offset =3D COL_SIZE_FOR_ONE_MB;
> +		if (use_mode_8x8_flag)
> +			colocate_rd_adr_offset >>=3D 2;
> +
> +		colocate_rd_adr_offset *=3D curr_slice->first_mb_in_slice;
> +		if (colocate_pic->col_buf_index >=3D 0 &&
> +		    colocate_pic->col_buf_index < h264_ctx->colocated_buf_num) {
> +		    /* collated_cma_addr is limited to 32bit by flag GFP_DMA32 when al=
located */
> +			colocate_rd_adr =3D (unsigned int)h264_ctx->collated_cma_addr +
> +			    ((h264_ctx->one_col_buf_size *
> +			      colocate_pic->col_buf_index) >> (use_mode_8x8_flag
> +							       ? 2 : 0));
> +			if (colocate_rd_adr_offset > h264_ctx->one_col_buf_size ||
> +			    colocate_rd_adr + h264_ctx->one_col_buf_size >
> +			    (unsigned int)h264_ctx->collated_cma_addr_end) {
> +				dev_err(hw->dev,
> +					"Error, colocate rd buf is not enough, index is %d\n",
> +					colocate_pic->col_buf_index);
> +				return -1;
> +			}
> +			val  =3D ((colocate_rd_adr_offset + colocate_rd_adr) >> 3) |
> +				(cur_colocate_ref_type << 29) |
> +				(l10_structure << 30);
> +			regmap_write(hw->map[DOS_BUS], H264_CO_MB_RD_ADDR, val);

[Severity: Critical]
In h264_config_decode_buf(), can a slice with a non-zero first_mb_in_slice
program H264_CO_MB_WR_ADDR and H264_CO_MB_RD_ADDR to DMA past the end of the
colocated buffer slot or past h264_ctx->collated_cma_addr_end?

When use_mode_8x8_flag is set, each slot's stride is
h264_ctx->one_col_buf_size >> 2, but colocate_adr_offset and
colocate_rd_adr_offset are compared against the unshifted
h264_ctx->one_col_buf_size, allowing the offset to cross into the next 3
colocated buffer slots.

Furthermore, the end-address check tests
colocate_wr_adr + h264_ctx->one_col_buf_size > h264_ctx->collated_cma_addr_=
end
without adding colocate_adr_offset (and likewise for colocate_rd_adr without
colocate_rd_adr_offset), so when col_buf_index is at the end of the buffer =
and
colocate_adr_offset > 0, colocate_wr_adr + colocate_adr_offset can point up=
 to
one_col_buf_size bytes past collated_cma_addr_end.

[ ... ]

> +}

[ ... ]

> --=20
> 2.43.0

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-b4-s4-vdec=
-upstream-v12-0-616240978792@amlogic.com?part=3D5
