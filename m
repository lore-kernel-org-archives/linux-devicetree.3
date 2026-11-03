Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739102;
	b=XCX1IP1Qt/yKDTE+yHrRAKbmrn6h9CfddHLWFfFtBCmA4pybK+HevDYrlYS3Kv2nqTw/
	 9P9eWBuC2fWXKnoOb3pMHgXTMmyGPf2qY99HeGnH283UJDb/QydtPB1VJAJI4qRo0JHQb
	 wTndkzPosPeF8eXq8NoQ0WGvOMkRrcD3cwGHuk4d63LBBHqrPixrl0DQANJbiQJhQE7JX
	 7OrUp7wRRjLMkiLCIgBc+3TY4LglOFt1wYuopczGbLNOkCzqFwYVJkWDXYN54UtUmYwJa
	 oMAKl3i7zerr3FqWPwiRgCE1FMVaNv9mhgzBG59yO7DXYIntZV9ouy2JG+DorKaLecQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739102;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Lkr4zaDeQ4tlPbPAmT56UfDc02oLdw2sE6kJspmXFEE=;
	b=31R7VFrQIjt8YYtUbGBwTFLh0nx3K5m8yp5WnnPfft4zfpCH2HSc7ANDhglDTE7ES/hQ
	 qXyeivaQg2sPMhg28nf2qs20+oaNr3nz7MfJ5vdHr0bb6L32krCLq8O1FsqyvYypuxb+y
	 cv9il4tohmP6Vx3vU+bjFAs8VeaSoL8uw/DfQv4zrWZ91OZqza+P4+XehEO8JQ2RPWhiW
	 GFnvax8nthjwZA8UTS9qL0CApNu44tpecCZ4fL5e2vLFh+7HcG3JtC7oMGdSVUv7F+ehT
	 2kGXyNYk1YZz8XCED6xkoFYrPO8u4oFzPiN3GRH78m+1yXWDxtbYMpT5PkMQqgMkUrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JXTIRh+X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4626606A32D
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JXTIRh+X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC321F000C1;
	Tue,  3 Nov 2026 20:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793739101;
	bh=Lkr4zaDeQ4tlPbPAmT56UfDc02oLdw2sE6kJspmXFEE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JXTIRh+X6i6UQunsH6RFYYou4/zdnI95Leo67htFGjy5we6G3vwuqbBN9XWcr2Y73
	 AcnS+rGaGlQf//V0oWA6vuPqfWtPPDBv8rDvl3Hq5CSq8WNoXT5uMvAH21F2tjhVUY
	 mN95YYg7wkowAxOIDIKBzHrdPu4ttVARHm/0MbMvLs5C2M20K869E/YqVx4r47WcHg
	 WyTY2Hf2LxjLw/U5YAk88hHH07OSp+ox59hpPvk/+OYzGt7IhO4ZEIlqGpgZ6A+7iN
	 vNzjyUxwf+8K//R6wSsdsiDvXuT7mNWZOnwNadaCwHEbc/l/bV2qqrEtOR1dD/YHQq
	 DaqskuZQ7mkBQ==
Message-ID: <sashiko-outbox-196017@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261103-camss-isp-ope-v13-9-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
 <20261103-camss-isp-ope-v13-9-c2cbf15a39b1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 20:51:40 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 14 potential issue=
(s) to consider:
- [High] media: qcom: camss: ope: use-after-free on ope_v4l2_register() fai=
lure
- [Medium] arm64: dts: qcom: agatti: duplicate IOMMU stream IDs on camss an=
d isp_ope
- [Medium] media: qcom: camss: premature consume and reset of params in ope=
_apply_params()
- [Medium] media: qcom: camss: vb2 ownership and poll bugs in ope_dqbuf() a=
nd ope_poll()
- [Medium] media: qcom: camss: invalid G_PARM and S_PARM on capture in ope_=
g_parm()
- [Medium] media: qcom: camss: wrong compose bounds origin in ope_proc_get_=
selection()
- [Medium] media: qcom: camss: missing enum_mbus_code callback in ope_disp_=
pad_ops
- [Medium] media: qcom: camss: max-size check and late validation in ope_bu=
f_prepare()
- [Medium] media: qcom: camss: ope: 0 Hz OPP rounded up in ope_adjust_power=
()
- [Medium] media: qcom: camss: ope: split ioctl locks between vdev_lock and=
 vbq_lock
- [Medium] media: qcom: camss: ope: unbalanced pipeline stop on unregistrat=
ion
- [Medium] media: qcom: camss: premature ope_sched_resume() in ope_runtime_=
resume()
- [Low] media: qcom: camss: signed shift overflow in DS_RESOLUTION()
- [Low] media: qcom: camss: ope: incomplete kernel-doc in pipeline.h
--

commit e9b18dde076886d4503de413170d4ece303a05fe
Author: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

arm64: defconfig: Enable Qualcomm CAMSS OPE driver

This series adds the Qualcomm Camera Subsystem Offline Processing Engine
(OPE) V4L2 memory-to-memory ISP driver, its media-controller pipeline and
parameter helpers, Devicetree nodes for Agatti and Shikra, and enables the
driver in arm64 defconfig.

Link: https://github.com/jwrdegoede/libcamera/commits/camss_pipeline_v2.1/
Link: https://github.com/loicpoulain/camss-isp-m2m-test

> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/q=
com/agatti.dtsi
> index d9f4cbfd2861c..8f2b451b8f6e8 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -1990,6 +1990,83 @@ port@1 {
>  			};
>  		};
> =20
> +		isp_ope: isp@5c42000 {
> +			compatible =3D "qcom,qcm2290-camss-ope";

[ ... ]

> +			iommus =3D <&apps_smmu 0x800 0x0>,
> +				 <&apps_smmu 0x820 0x0>,
> +				 <&apps_smmu 0x840 0x0>;

[Severity: Medium]
Does isp_ope conflict with the stream IDs already claimed by camss in
arch/arm64/boot/dts/qcom/agatti.dtsi?

Right above isp_ope, the camss@5c11000 node still lists the OPE CDM, read,
and write stream IDs alongside the VFE stream ID:

	camss: camss@5c11000 {
		...
		iommus =3D <&apps_smmu 0x400 0x0>,
			 <&apps_smmu 0x800 0x0>,
			 <&apps_smmu 0x820 0x0>,
			 <&apps_smmu 0x840 0x0>;

Unlike shikra.dtsi (where camss@5c11000 only lists 0x400), agatti.dtsi keeps
0x800, 0x820, and 0x840 on camss. On boards or overlays that enable camss
alongside the default-enabled isp_ope node, both devices claim those three
stream IDs on apps_smmu. When isp_ope probes first, arm_smmu_device_group()
assigns a group to SMEs 0x800, 0x820, and 0x840, and when camss later calls
arm_smmu_device_group(), SME 0x400 has group =3D=3D NULL while SMEs 0x800, =
0x820,
and 0x840 match isp_ope's group, returning early without recording the group
for SME 0x400 and forcing both devices to share a single IOMMU group. Should
0x800, 0x820, and 0x840 be removed from camss@5c11000 in agatti.dtsi?

> diff --git a/drivers/media/platform/qcom/camss/ope/core.c b/drivers/media=
/platform/qcom/camss/ope/core.c
> new file mode 100644
> index 0000000000000..e111fd1b2b1a2
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/ope/core.c

[ ... ]

> +/* Downscaler fixed-point helpers */
> +#define Q21(v)			(((uint64_t)(v)) << 21)
> +#define DS_Q21(n, d)		((uint32_t)div_u64((uint64_t)(n) << 21, (d)))
> +#define DS_RESOLUTION(in, out) \
> +	(((out) * 128 <=3D (in)) ? 0x0 : \
> +	 ((out) * 16  <=3D (in)) ? 0x1 : \
> +	 ((out) * 8   <=3D (in)) ? 0x2 : 0x3)

[ ... ]

> +	/* Downscalers */
> +	for (int i =3D 0; i < OPE_DS_MAX; i++) {
> +		struct ope_dsc_config *dsc =3D &stripe->dsc[i];
> +		u32 base =3D ope_ds_base[i];
> +		u32 cfg =3D 0;
> +
> +		if (dsc->input_width !=3D dsc->output_width) {
> +			dsc->phase_step_h |=3D
> +				DS_RESOLUTION(dsc->input_width,
> +					      dsc->output_width) << 30;
> +			cfg |=3D OPE_PP_DOWNSCALE_MN_DS_CFG_H_SCALE_EN;
> +		}
> +		if (dsc->input_height !=3D dsc->output_height) {
> +			dsc->phase_step_v |=3D
> +				DS_RESOLUTION(dsc->input_height,
> +					      dsc->output_height) << 30;
> +			cfg |=3D OPE_PP_DOWNSCALE_MN_DS_CFG_V_SCALE_EN;
> +		}

[Severity: Low]
Can shifting the result of DS_RESOLUTION() left by 30 bits in
ope_prog_stripe() trigger a signed 32-bit shift overflow?

DS_RESOLUTION() evaluates to signed int literals 0x0, 0x1, 0x2, or 0x3. When
the downscaling ratio is less than 16x (including every NV12 or NV16 frame
where OPE_DS_C_PRE scales 2x horizontally), DS_RESOLUTION() returns 0x2 or
0x3, and shifting that signed int by 30 overflows into the sign bit under
CONFIG_UBSAN_SHIFT. Could DS_RESOLUTION() use unsigned literals (0x0U..0x3U)
or FIELD_PREP(GENMASK(31, 30), ...)?

[ ... ]

> +static void ope_apply_params(struct ope_ctx *ctx)
> +{
> +	struct vb2_v4l2_buffer *vbuf;
> +	int ret;
> +
> +	vbuf =3D ope_queue_remove(ctx, OPE_QUEUE_PARAMS);
> +	if (!vbuf)
> +		return;
> +
> +	ret =3D camss_isp_params_apply(ctx->ope->dev, &vbuf->vb2_buf,
> +				     ctx->params_buf,
> +				     ope_params_type_info,
> +				     ope_params_handlers,
> +				     ARRAY_SIZE(ope_params_handlers),
> +				     ctx);
> +	if (ret)
> +		dev_warn_ratelimited(ctx->ope->dev, "invalid parameters\n");
> +
> +	vb2_buffer_done(&vbuf->vb2_buf, ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STA=
TE_DONE);
> +}

[Severity: Medium]
Can ope_apply_params() consume a parameter buffer before OPE_QUEUE_PARAMS h=
as
finished starting streaming, and does stopping OPE_QUEUE_PARAMS abort active
video frames?

During VIDIOC_STREAMON on ope_params, vb2_start_streaming() passes pre-queu=
ed
buffers to ope_buf_queue() before calling ope_start_streaming():

	vb2_start_streaming()
	  ope_buf_queue()
	    list_add_tail(&buf->list, &ctx->queues[idx].rdy_queue);
	    ope_try_schedule(ctx);
	  ope_start_streaming()

While OPE_QUEUE_FRAME_IN and OPE_QUEUE_DISP_OUT are gated by ope_job_ready()
checking ctx->queues[...].streaming, ope_apply_params() calls
ope_queue_remove(ctx, OPE_QUEUE_PARAMS) without checking
ctx->queues[OPE_QUEUE_PARAMS].streaming. If ope_input and ope_disp_output a=
re
already streaming, a job running before ope_start_streaming() sets
streaming =3D true will dequeue and complete the parameter buffer via
vb2_buffer_done(), triggering WARN_ON(!list_empty(&q->done_list)) in
vb2_start_streaming() if ope_start_streaming() fails.

In addition, in ope_stop_streaming() and ope_queues_release():

	ope_sched_cancel(ctx);
	ope_queue_drain(ctx, idx, VB2_BUF_STATE_ERROR);
	ope_sched_resume(ctx->ope);

stopping or closing ope_params while a video frame is in flight calls
ope_sched_cancel(ctx), which resets the OPE hardware via ope_hw_reset_sync()
and completes the active video frame buffers with VB2_BUF_STATE_ERROR, even
though parameter buffers are CPU-copied before hardware execution starts.

[ ... ]

> +static int ope_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct ope_ctx *ctx =3D ope_ctx_from_vq(vb->vb2_queue);
> +	unsigned int idx =3D ope_idx_from_vq(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +	unsigned int sizeimage;
> +
> +	if (idx =3D=3D OPE_QUEUE_FRAME_IN)
> +		sizeimage =3D ctx->fmt_in.sizeimage;
> +	else if (idx =3D=3D OPE_QUEUE_DISP_OUT)
> +		sizeimage =3D ctx->fmt_out.sizeimage;
> +	else
> +		sizeimage =3D v4l2_isp_buffer_size(CAMSS_PARAMS_OPE_MAX_PAYLOAD);
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
> +		if (vb->vb2_queue->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +			if (vbuf->field =3D=3D V4L2_FIELD_ANY)
> +				vbuf->field =3D V4L2_FIELD_NONE;
> +			if (vbuf->field !=3D V4L2_FIELD_NONE)
> +				return -EINVAL;
> +		}
> +	}
> +
> +	if (vb2_plane_size(vb, 0) < sizeimage)
> +		return -EINVAL;

[Severity: Medium]
Does ope_buf_prepare() reject valid variable-length VB2_USERPTR parameter
buffers while deferring v4l2-isp buffer validation until the worker runs?

OPE_QUEUE_PARAMS enables VB2_USERPTR in ope_init_vq() and uses the extensib=
le
variable-length v4l2-isp format. However, ope_buf_prepare() requires
vb2_plane_size(vb, 0) to be at least
v4l2_isp_buffer_size(CAMSS_PARAMS_OPE_MAX_PAYLOAD), which rejects USERPTR
buffers sized for only a subset of parameter blocks.

At the same time, ope_buf_prepare() does not call
v4l2_isp_params_validate_buffer_size() or v4l2_isp_params_validate_buffer()
at VIDIOC_PREPARE_BUF / VIDIOC_QBUF time; validation and copying only happen
asynchronously in ope_run_job() -> ope_apply_params(), allowing malformed
parameter buffers to succeed at VIDIOC_QBUF.

[ ... ]

> +static void ope_adjust_power(struct ope_dev *ope)
> +{

[ ... ]

> +	opp =3D dev_pm_opp_find_freq_ceil(ope->dev, &pixclk);
> +	if (IS_ERR(opp)) {
> +		unsigned long max_freq =3D ULONG_MAX;
> +
> +		dev_warn(ope->dev, "Requested pixel clock %luHz exceeds hardware limit=
\n", pixclk);
> +
> +		/* Clamp to the highest available OPP */
> +		opp =3D dev_pm_opp_find_freq_floor(ope->dev, &max_freq);
> +		if (!IS_ERR(opp)) {
> +			pixclk =3D max_freq;
> +			dev_pm_opp_put(opp);
> +		}
> +	} else {
> +		dev_pm_opp_put(opp);
> +	}
> +
> +	ret =3D dev_pm_opp_set_rate(ope->dev, pixclk);

[Severity: Medium]
As reported by Sashiko on v12 [1], when the last streaming context stops in
ope_stop_streaming(), pixclk is 0, but ope_adjust_power() unconditionally
calls dev_pm_opp_find_freq_ceil(ope->dev, &pixclk).

Because dev_pm_opp_find_freq_ceil() rounds pixclk =3D 0 up to the lowest OPP
frequency (19.2 MHz), dev_pm_opp_set_rate(ope->dev, pixclk) is never called
with 0, so the OPP table is not disabled and the required-opps vote on the =
cx
power domain remains active while the device is idle. Should the
dev_pm_opp_find_freq_ceil() lookup be skipped when pixclk is 0?

[ ... ]

> +static int ope_init_vq(struct ope_ctx *ctx, unsigned int idx)
> +{
> +	struct ope_dev *ope =3D ctx->ope;
> +	struct ope_vq_priv *qpriv;
> +	struct vb2_queue *q =3D &ctx->queues[idx].vq;
> +	int ret;
> +
> +	qpriv =3D kzalloc_obj(*qpriv);
> +	if (!qpriv)
> +		return -ENOMEM;
> +
> +	qpriv->ctx =3D ctx;
> +	qpriv->queue_idx =3D idx;
> +	qpriv->vdev =3D camss_isp_pipeline_get_vdev(ope->pipeline, ope_queue_to=
_entity[idx]);
> +	q->drv_priv =3D qpriv;
> +	q->ops =3D &ope_vb2_ops;
> +	q->lock =3D &ctx->vbq_lock;

[ ... ]

> +	/* Only valid because there is a single device-wide ope_ctx for now */
> +	qpriv->vdev->queue =3D q;
> +
> +	return 0;
> +}

[ ... ]

> +static int ope_s_fmt_vid_out(struct file *file, void *priv, struct v4l2_=
format *f)
> +{
> +	struct ope_ctx *ctx =3D ope_ctx_from_file(file);
> +	const struct ope_fmt *fmt;
> +
> +	if (vb2_is_busy(&ctx->queues[OPE_QUEUE_FRAME_IN].vq))
> +		return -EBUSY;
> +
> +	fmt =3D ope_fmt_try(ctx->ope, false, &f->fmt.pix_mp);
> +	ctx->fmt_in.fmt		    =3D fmt;
> +	ctx->fmt_in.width	    =3D f->fmt.pix_mp.width;
> +	ctx->fmt_in.height	    =3D f->fmt.pix_mp.height;

[ ... ]

> +static int ope_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_=
format *f)
> +{
> +	struct ope_ctx *ctx =3D ope_ctx_from_file(file);
> +	const struct ope_fmt *fmt;
> +
> +	if (vb2_is_busy(&ctx->queues[OPE_QUEUE_DISP_OUT].vq))
> +		return -EBUSY;
> +
> +	fmt =3D ope_fmt_try(ctx->ope, true, &f->fmt.pix_mp);
> +
> +	ctx->fmt_out.fmt	    =3D fmt;
> +	ctx->fmt_out.width	    =3D f->fmt.pix_mp.width;
> +	ctx->fmt_out.height	    =3D f->fmt.pix_mp.height;

[Severity: Medium]
As reported by Sashiko on v12 [2], does assigning vdev->lock =3D
&pipeline->vdev_lock in isp_register_vdev() while setting q->lock =3D
&ctx->vbq_lock and qpriv->vdev->queue =3D q in ope_init_vq() split
serialization between queue and format ioctls?

In v4l2_ioctl_get_lock(), ioctls with INFO_FL_QUEUE (VIDIOC_REQBUFS,
VIDIOC_CREATE_BUFS, VIDIOC_PREPARE_BUF, VIDIOC_QBUF, VIDIOC_STREAMON) lock
vdev->queue->lock (&ctx->vbq_lock), whereas non-queue ioctls (VIDIOC_S_FMT,
VIDIOC_G_FMT, VIDIOC_S_PARM, VIDIOC_G_PARM) lock vdev->lock
(&pipeline->vdev_lock). As a result, ope_s_fmt_vid_out(),
ope_s_fmt_vid_cap(), and ope_s_parm() check vb2_is_busy() and mutate
ctx->fmt_in, ctx->fmt_out, and ctx->framerate under pipeline->vdev_lock whi=
le
concurrent vb2 callbacks (ope_queue_setup(), ope_buf_prepare(),
ope_start_streaming(), ope_adjust_power()) read those fields under
ctx->vbq_lock.

Furthermore, ope_s_fmt_vid_out() and ope_s_fmt_vid_cap() only check
vb2_is_busy() on their own queue rather than checking whether the pipeline =
is
already streaming. Because video_device_pipeline_alloc_start() only validat=
es
media links when the first video node starts streaming (when
pipe->start_count =3D=3D 0), starting streaming on one node (such as ope_in=
put or
ope_params) and then calling VIDIOC_S_FMT on another node whose queue has no
buffers yet allows ctx->fmt_out or ctx->fmt_in to be changed after link
validation has already completed.

[ ... ]

> +static int ope_g_parm(struct file *file, void *priv, struct v4l2_streamp=
arm *sp)
> +{
> +	struct ope_ctx *ctx =3D ope_ctx_from_file(file);
> +
> +	if (!V4L2_TYPE_IS_OUTPUT(sp->type))
> +		return -EINVAL;
> +
> +	sp->parm.output.capability =3D V4L2_CAP_TIMEPERFRAME;
> +	sp->parm.output.timeperframe =3D ctx->fmt_in.timeperframe;
> +
> +	return 0;
> +}

[Severity: Medium]
Should VIDIOC_G_PARM and VIDIOC_S_PARM be disabled on the ope_disp_output
capture node?

Both ope_input and ope_disp_output share ope_video_ioctl_ops, which wires up
ope_g_parm() and ope_s_parm(). On ope_disp_output (VFL_DIR_RX), calling
VIDIOC_G_PARM or VIDIOC_S_PARM with V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE pass=
es
check_fmt() in v4l2-ioctl.c and then fails with -EINVAL in ope_g_parm() /
ope_s_parm() because !V4L2_TYPE_IS_OUTPUT(sp->type) is true, whereas V4L2
expects -ENOTTY when an ioctl is not supported on a capture node. Could
v4l2_disable_ioctl() be used on ope_disp_output for VIDIOC_G_PARM and
VIDIOC_S_PARM (or separate ioctl_ops tables be used)?

[ ... ]

> +static int ope_dqbuf(struct file *file, void *priv, struct v4l2_buffer *=
buf)
> +{
> +	struct ope_ctx *ctx =3D ope_ctx_from_file(file);
> +	struct vb2_queue *vq =3D ope_vq_from_file(file, ctx);
> +
> +	return vq ? vb2_dqbuf(vq, buf, file->f_flags & O_NONBLOCK) : -EINVAL;
> +}
> +
> +static int ope_prepare_buf(struct file *file, void *priv, struct v4l2_bu=
ffer *buf)
> +{
> +	struct ope_ctx *ctx =3D ope_ctx_from_file(file);
> +	struct video_device *vdev =3D video_devdata(file);
> +	struct vb2_queue *vq =3D ope_vq_from_file(file, ctx);
> +
> +	if (!vq)
> +		return -EINVAL;
> +	if (vb2_queue_is_busy(vq, file))
> +		return -EBUSY;
> +
> +	return vb2_prepare_buf(vq, vdev->v4l2_dev->mdev, buf);
> +}
> +
> +static int ope_create_bufs(struct file *file, void *priv, struct v4l2_cr=
eate_buffers *create)
> +{
> +	struct ope_ctx *ctx =3D ope_ctx_from_file(file);
> +	struct vb2_queue *vq =3D ope_vq_from_file(file, ctx);
> +	int ret;
> +
> +	if (!vq)
> +		return -EINVAL;
> +	if (vb2_queue_is_busy(vq, file))
> +		return -EBUSY;
> +	ret =3D vb2_create_bufs(vq, create);
> +	if (!ret && create->count)
> +		vq->owner =3D file->private_data;
> +
> +	return ret;
> +}

[ ... ]

> +static __poll_t ope_poll(struct file *file, poll_table *wait)
> +{
> +	unsigned int idx =3D ope_queue_idx_from_file(file);
> +	struct ope_ctx *ctx =3D ope_ctx_from_file(file);
> +	struct v4l2_fh *fh =3D file_to_v4l2_fh(file);
> +	struct vb2_queue *vq;
> +	unsigned long flags;
> +	__poll_t rc =3D 0;
> +
> +	if (idx >=3D OPE_QUEUE_COUNT)
> +		return EPOLLERR;
> +
> +	vq =3D &ctx->queues[idx].vq;
> +
> +	poll_wait(file, &vq->done_wq, wait);
> +	poll_wait(file, &fh->wait, wait);
> +
> +	spin_lock_irqsave(&vq->done_lock, flags);
> +	if (!vb2_is_streaming(vq) || vq->error) {
> +		rc |=3D EPOLLERR;
> +	} else if (!list_empty(&vq->done_list)) {
> +		if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +			rc |=3D EPOLLOUT | EPOLLWRNORM;
> +		else
> +			rc |=3D EPOLLIN | EPOLLRDNORM;
> +	}
> +	spin_unlock_irqrestore(&vq->done_lock, flags);
> +
> +	if (v4l2_event_pending(fh))
> +		rc |=3D EPOLLPRI;
> +
> +	return rc;
> +}

[Severity: Medium]
As reported by Sashiko on v12 [3], why not use the standard vb2_ioctl_* and
vb2_fop_* helpers instead of custom wrappers in ope_dqbuf(),
ope_create_bufs(), and ope_poll()?

There are three issues in these custom wrappers:

1. ope_dqbuf() does not check vb2_queue_is_busy(vq, file), allowing a second
open file descriptor to dequeue buffers from an active stream owned by
another file handle.

2. ope_create_bufs() checks vb2_queue_is_busy(vq, file) even when
create->count =3D=3D 0, causing read-only capability queries to fail with -=
EBUSY
instead of populating capabilities and max_num_buffers as
vb2_ioctl_create_bufs() does.

3. ope_poll() directly accesses private vb2_queue fields (done_wq, done_loc=
k,
done_list, error) without holding vq->lock. Because it does not check
poll_requested_events(wait), polling only for EPOLLPRI events while the que=
ue
is not streaming immediately returns EPOLLERR, and because it does not check
vq->waiting_for_buffers on capture queues, polling after VIDIOC_STREAMON wi=
th
no queued capture buffers blocks instead of returning EPOLLERR.

[ ... ]

> +static int ope_proc_get_selection(struct v4l2_subdev *sd,
> +				  const struct v4l2_subdev_client_info *info,
> +				  struct v4l2_subdev_state *state,
> +				  struct v4l2_subdev_selection *sel)
> +{

[ ... ]

> +	if (sel->pad =3D=3D OPE_PROC_PAD_SOURCE) {
> +		const struct v4l2_rect *crop =3D
> +			v4l2_subdev_state_get_crop(state, OPE_PROC_PAD_SINK_IN);
> +
> +		switch (sel->target) {
> +		case V4L2_SEL_TGT_COMPOSE:
> +			sel->r =3D *v4l2_subdev_state_get_compose(state, OPE_PROC_PAD_SOURCE);
> +			return 0;
> +		case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> +		case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> +			sel->r =3D *crop;
> +			return 0;

[Severity: Medium]
In ope_proc_get_selection(), should V4L2_SEL_TGT_COMPOSE_DEFAULT and
V4L2_SEL_TGT_COMPOSE_BOUNDS on OPE_PROC_PAD_SOURCE return origin (0, 0)
instead of copying crop->left and crop->top?

In ope_proc_adjust_src_compose(), the compose rectangle is clamped against
bounds starting at (0, 0):

	bounds =3D (struct v4l2_rect){ 0, 0, sink_crop->width, sink_crop->height };
	ope_sd_adjust_crop_rect(compose, &bounds, halign, valign);

However, ope_proc_get_selection() sets sel->r =3D *crop, which includes any
non-zero crop->left and crop->top from OPE_PROC_PAD_SINK_IN. When a non-zero
sink crop offset is configured, a valid compose rectangle at (0, 0) falls
outside the reported V4L2_SEL_TGT_COMPOSE_BOUNDS.

[ ... ]

> +static const struct v4l2_subdev_pad_ops ope_disp_pad_ops =3D {
> +	.get_fmt       =3D v4l2_subdev_get_fmt,
> +	.set_fmt       =3D ope_disp_set_fmt,
> +	.link_validate =3D v4l2_subdev_link_validate_default,
> +};

[Severity: Medium]
Does ope_disp_pad_ops need an .enum_mbus_code callback?

isp_register_subdev() sets V4L2_SUBDEV_FL_HAS_DEVNODE on every subdev in the
pipeline, exposing a /dev/v4l-subdevN device node for ope_disp, but
ope_disp_pad_ops omits .enum_mbus_code, so VIDIOC_SUBDEV_ENUM_MBUS_CODE on
ope_disp always fails with -ENOTTY.

[ ... ]

> +	cpu_latency_qos_add_request(&ope->qos_req, PM_QOS_DEFAULT_VALUE);
> +
> +	/* ope ownership is transferred to ope_v4l2_register(), even on failure=
 */
> +	ret =3D ope_v4l2_register(ope);
> +	if (ret) {
> +		cpu_latency_qos_remove_request(&ope->qos_req);
> +		platform_set_drvdata(pdev, NULL);
> +		return dev_err_probe(dev, ret, "V4L2 registration failed\n");
> +	}
> +
> +	/* Everything @ope_irq() touches is in place, let interrupts in */
> +	enable_irq(ope->irq);

[Severity: High]
As reported by Sashiko on v12 [4], if ope_v4l2_register(ope) fails in
ope_probe(), doesn't cpu_latency_qos_remove_request(&ope->qos_req) access
freed memory?

Every failure path in ope_v4l2_register() invokes ope_v4l2_dev_release(),
which frees ope via kfree(ope):

	ope_probe()
	  cpu_latency_qos_add_request(&ope->qos_req, PM_QOS_DEFAULT_VALUE)
	  ope_v4l2_register(ope)
	    ...
	    ope_v4l2_dev_release(&ope->v4l2_dev)
	      kfree(ope)
	  cpu_latency_qos_remove_request(&ope->qos_req)  <-- use-after-free

In addition, on the success path of ope_probe(), enable_irq(ope->irq) is
called after ope_v4l2_register(ope) has already published the V4L2 and media
device nodes to userspace, leaving a window where userspace can open the
device and start streaming before the IRQ is enabled.

[ ... ]

> +static int ope_runtime_resume(struct device *dev)
> +{
> +	struct ope_dev *ope =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D clk_bulk_prepare_enable(ope->nclks, ope->clks);
> +	if (ret)
> +		return ret;
> +
> +	__ope_irq_init(ope);
> +
> +	/*
> +	 * Let the contexts that are still streaming pick up a new job. The job
> +	 * is started from a work item, which may run before runtime PM reports
> +	 * the device active again, i.e. while ope_irq() still drops interrupts.
> +	 * Programming a job takes long enough for that window to be closed by
> +	 * the time the hardware can raise one.
> +	 */
> +	ope_sched_resume(ope);
> +
> +	return 0;
> +}

[Severity: Medium]
Can scheduling ope->run_work from inside ope_runtime_resume() race with
pm_runtime_force_resume() and drop an edge-triggered hardware interrupt?

During system resume, pm_runtime_force_resume() invokes ope_runtime_resume()
while dev->power.disable_depth > 0, before calling pm_runtime_enable(dev).
Inside ope_runtime_resume(), ope_sched_resume(ope) queues ope->run_work on
system_wq, which can execute on another CPU and call ope_run_job() ->
ope_start(ope).

If the task running pm_runtime_force_resume() is preempted before reaching
pm_runtime_enable(dev), the hardware can raise its IRQ_TYPE_EDGE_RISING
interrupt while dev->power.disable_depth > 0. In that state,
pm_runtime_get_if_in_use(ope->dev) in ope_irq() returns -EINVAL, causing
ope_irq() to return IRQ_NONE without reading or clearing OPE_TOP_IRQ_STATUS
and stalling the active job.

> diff --git a/drivers/media/platform/qcom/camss/ope/pipeline.c b/drivers/m=
edia/platform/qcom/camss/ope/pipeline.c
> new file mode 100644
> index 0000000000000..9a8afbc30d323
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/ope/pipeline.c

[ ... ]

> +void camss_isp_pipeline_unregister(struct camss_isp_pipeline *pipeline)
> +{
> +	int i;
> +
> +	/* Unregister entities in reverse order. */
> +	for (i =3D (int)pipeline->num_entities - 1; i >=3D 0; i--) {
> +		struct camss_isp_pipeline_entity *slot =3D &pipeline->entities[i];
> +
> +		if (slot->registered) {
> +			switch (slot->obj_type) {
> +			case MEDIA_ENTITY_TYPE_VIDEO_DEVICE:
> +				if (video_device_pipeline(&slot->vdev))
> +					video_device_pipeline_stop(&slot->vdev);
> +				video_unregister_device(&slot->vdev);
> +				break;

[Severity: Medium]
As reported by Sashiko on v12 [5], can camss_isp_pipeline_unregister() call
video_device_pipeline_stop() an unbalanced number of times or unregister
subdevs while their pads are still part of an active media_pipeline?

When any video node in the connected graph calls
video_device_pipeline_alloc_start() in ope_start_streaming(),
__media_pipeline_start() sets pad->pipe on every connected pad in the graph.
As a result, video_device_pipeline(&slot->vdev) becomes non-NULL on all thr=
ee
video nodes (OPE_ENTITY_FRAME_IN at index 0, OPE_ENTITY_PARAMS at index 1,
and OPE_ENTITY_DISP_OUT at index 4) even if only one or two of them started
streaming.

Additionally, because OPE_ENTITY_DISP (index 3) and OPE_ENTITY_PROC (index =
2)
are unregistered before OPE_ENTITY_PARAMS (index 1) and OPE_ENTITY_FRAME_IN
(index 0), if two or more video nodes are streaming during unbind, stopping
index 4 only decrements pipe->start_count without terminating the pipeline,
and the subdevs at indices 3 and 2 are unregistered while their pads are
still attached to the active media_pipeline.

> diff --git a/drivers/media/platform/qcom/camss/ope/pipeline.h b/drivers/m=
edia/platform/qcom/camss/ope/pipeline.h
> new file mode 100644
> index 0000000000000..62e4116012ad0
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/ope/pipeline.h

[ ... ]

> +struct camss_isp_entity_desc {
> +	const char				*name;
> +	u32					obj_type;
> +	u32					function;
> +	const struct camss_isp_pad_desc		*pads;
> +
> +	union {
> +		/* MEDIA_ENTITY_TYPE_VIDEO_DEVICE */
> +		struct {
> +			u32					caps;
> +			void					*drvdata;
> +			const struct v4l2_file_operations	*fops;
> +			const struct v4l2_ioctl_ops		*ioctl_ops;
> +			const struct media_entity_operations	*entity_ops;
> +		} vdev;
> +		/* MEDIA_ENTITY_TYPE_V4L2_SUBDEV */
> +		struct {
> +			const struct v4l2_subdev_ops		*ops;
> +			const struct v4l2_subdev_internal_ops	*internal_ops;
> +			const struct media_entity_operations	*entity_ops;
> +		} subdev;
> +	};
> +};

[ ... ]

> +/**
> + * camss_isp_pipeline_register() - validate descriptors and register the=
 graph
> + * @pipeline:    pipeline (allocated with camss_isp_pipeline_alloc())
> + * @v4l2_dev:    caller-owned and already-registered V4L2 device; its
> + *               associated media_device (v4l2_dev->mdev) must also be
> + *               initialised and registered before this call.

[Severity: Low]
As reported by Sashiko on v12 [6], this isn't a bug, but the kernel-doc
comment for struct camss_isp_entity_desc documents the nested @vdev.* and
@subdev.* members without @vdev: and @subdev: entries, which causes
scripts/kernel-doc to warn that struct members vdev and subdev are not
described.

Also, the kernel-doc comment for camss_isp_pipeline_register() states that
v4l2_dev->mdev must already be registered before the call, whereas
ope_v4l2_register() only calls media_device_init() beforehand and calls
media_device_register() after camss_isp_pipeline_register() succeeds.

[1] https://lore.kernel.org/r/20261102-camss-isp-ope-v12-9-702254689feb@oss=
.qualcomm.com
[2] https://lore.kernel.org/r/20261102-camss-isp-ope-v12-9-702254689feb@oss=
.qualcomm.com
[3] https://lore.kernel.org/r/20261102-camss-isp-ope-v12-9-702254689feb@oss=
.qualcomm.com
[4] https://lore.kernel.org/r/20261102-camss-isp-ope-v12-9-702254689feb@oss=
.qualcomm.com
[5] https://lore.kernel.org/r/20261102-camss-isp-ope-v12-9-702254689feb@oss=
.qualcomm.com
[6] https://lore.kernel.org/r/20261102-camss-isp-ope-v12-9-702254689feb@oss=
.qualcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-camss-isp-=
ope-v13-0-c2cbf15a39b1@oss.qualcomm.com?part=3D9
