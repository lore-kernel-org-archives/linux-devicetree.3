Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36E03AB466
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784878086; cv=none; b=nPseNFKAEFg5uTQPcbwuLR2gUgRdIhP4j1O2EJ22DLuigUG1+68Nrf8eWINPTyZBOGhHt6rrUS90aDqsvN585IaCwLLjRIx6NCY84qUpH3FypWaOUBWfrtm84t7LN0g5jBQE8Yw4fXTq1/9l6cGlpasosIIZAUSdrcgQcZVUpdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784878086; c=relaxed/simple;
	bh=mSlzTiR4aGekS2kOd2RUzSNzcvwWrY6v95Fl8b2qp34=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uTpU+nMLHqXj1byVDPN49x2v8a6HDUlKklx29wwQ02zWW1cP3uGtU6WsL6HuRPXos/Sm78Sl7Oyl6+7YyJwxezrBKZ8biRH0ZD0DGyANrYlfsDHu2oT7RVqtp3w+S2IwSFqUOrDrJxjxgFhae1q7x3Sq6vFyf9hecSTBCU5kEAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ouUQZtRl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ouUQZtRl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057C41F000E9;
	Fri, 24 Jul 2026 07:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784878083;
	bh=PeSjIIhfQOu8wIrBPMmR+mNqrjWwGrGrXNkHIkBHa8E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ouUQZtRlyHoZZwmRdlrtcksIeVchquaeg5gwc/ixBoxzeLVdzjfyb/XNCIErDiWBv
	 +9iPTM62qK0E7ubtS54Sn6UnhR0DVK3mPw9kdkj2Zk4KcKXxZzONDtgsdkdgCjjk/S
	 9jntAi/RIaHBrlummOyInL/tFLfPnCfqDBfC9z8uN/pTz2AHNc8bQfhbMTloS8tojh
	 pJ+5p24FgbYHWA1x/+LHIPyMCZlKNtsHRCY205diOdRi8kcmUtLATuyZuLjIRQjovh
	 kJPqUYI7QpT7E761B6NBGCbAnZLDi00xFk4lGml9Bynzk9+wuvN8V2Y8PGLNlGeOBe
	 ZX1j71jjVi+FQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/6] decoder: Add V4L2 stateless H.264 decoder driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-4-6072a7ee7428@amlogic.com>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-4-6072a7ee7428@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 07:28:02 +0000
Message-Id: <20260724072803.057C41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 31 potential issue=
(s) to consider:
- [Critical] Asymmetrical stop/start streaming triggers a Use-After-Free an=
d NULL pointer dereference on the decoder context.
- [Critical] Unvalidated reference list sizes and PPS parameters lead to ma=
ssive heap/array buffer overflows.
- [Critical] Global context pointers are unconditionally overwritten on ope=
n(), corrupting state for concurrent users.
- [Critical] Multi-planar capture formats (e.g. NV12M) are broken because `=
plane_num` is hardcoded, causing severe DMA memory corruption.
- [Critical] The driver does not validate the video dimensions specified in=
 the SPS against the actual V4L2 destination buffer size, allowing arbitrar=
y DMA out-of-bounds writes.
- [Critical] Colocation buffer physical address calculations suffer from in=
teger truncations and overflows, bypassing bounds checks and causing arbitr=
ary DMA memory corruption.
- [High] Incorrect error checking for `of_parse_phandle()` leads to a NULL =
pointer dereference and wrong error code.
- [High] `S_FMT` on the OUTPUT queue explicitly clobbers the CAPTURE queue'=
s pixel format.
- [High] Hardware resources and PM domains are permanently leaked in probe =
error paths.
- [High] The `dos` clock is requested but never prepared or enabled.
- [High] `copy_ref_list` incorrectly duplicates `ref_list0` into `ref_list1=
_unreordered`.
- [High] Metadata copying and request completion occur after buffers are ha=
nded back to userspace.
- [High] Synchronous blocking in `device_run` allows double-finishing of V4=
L2 M2M jobs on timeout.
- [High] Missing bounds check on firmware size causes integer underflow dur=
ing buffer allocation.
- [High] `TRY_FMT` ignores user-requested pixel formats, directly returning=
 the active configuration.
- [High] Bypassing clock enabling when the power domain is active breaks PM=
 usage counts and clock balancing.
- [High] Device lifetime mismatch with `devm_kzalloc` causes Use-After-Free=
 on driver unbind.
- [High] Failed allocations overwrite error results, and always-true `u8` c=
hecks cause unowned canvas release.
- [High] Hardware stream parser is programmed to read 1024 bytes past the u=
ser-supplied payload, causing OOB DMA reads.
- [High] IDR picture checks erroneously use strict equality against a bitma=
sk field.
- [High] Spurious hardware interrupts result in a guaranteed kernel crash b=
y dereferencing a NULL `curr_ctx`.
- [High] The DPB preparation loop incorrectly terminates early if a sparse =
entry is encountered.
- [High] Failing to return queued buffers when `start_streaming` fails caus=
es videobuf2 warnings and leaks.
- [High] Missing video_unregister_device() on probe error path leaves a dan=
gling character device.
- [High] Premature job finish notification causes a race between `aml_stop_=
vdec_hw` and `aml_start_vdec_hw`.
- [High] Missing job finish notification in the ISR error path permanently =
hangs the v4l2_m2m queue.
- [High] `ERR_PTR` stored in power domain array causes a kernel panic when =
dereferenced by PM API.
- [High] `read_poll_timeout_atomic` used with large timeouts stalls the CPU.
- [Medium] Selecting MESON_SM without satisfying its dependencies causes un=
met dependency warnings.
- [Medium] Failure during power domain initialization leaks successfully at=
tached domains.
- [Medium] `h264_ctx` is leaked during initialization failure.
--

--- Patch [4]: [PATCH v6 4/6] decoder: Add V4L2 stateless H.264 decoder dri=
ver ---
commit afc65ff0c18671a19fba53cb7a5d5a671420c2d6
Author: Zhentao Guo <zhentao.guo@amlogic.com>

decoder: Add V4L2 stateless H.264 decoder driver

Add initial support for V4L2 stateless video decoder driver on Amlogic S4
(S805X2) platform. In phase 1, it supports 8bit H.264 bitstreams decoding.=
=20
Currently only progressive streams are supported.

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
Does selecting MESON_SM here bypass architecture-specific dependencies?
If this driver is built with COMPILE_TEST on architectures that lack the
dependencies for MESON_SM, it could trigger Kconfig unmet dependency warnin=
gs
and build failures.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.c b/drivers/med=
ia/platform/amlogic/vdec/aml_vdec.c
> new file mode 100644
> index 0000000000000..d4dcd0180d2d0
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c
> @@ -0,0 +1,736 @@

[ ... ]

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

[ ... ]

> +	ret =3D ctx->codec_ops->run(ctx);
> +
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> +	if (src_req)
> +		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);

[Severity: High]
Could v4l2_m2m_buf_copy_metadata and v4l2_ctrl_request_complete be accessing
buffers after they have been returned to userspace?

The synchronous wait_event in the run callback completes when the hardware =
ISR
calls v4l2_m2m_buf_done_and_job_finish. By the time run returns here, the
buffers might have already been returned to userspace and potentially unmap=
ped
or freed, leading to a use-after-free.

[ ... ]

> +static int vdec_try_fmt_mp(struct aml_vdec_ctx *ctx, enum v4l2_buf_type =
type,
> +			   struct v4l2_pix_format_mplane *pix_mp)
> +{
> +	struct aml_video_fmt *dec_fmt;
> +	int i, align;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(type))
> +		dec_fmt =3D &ctx->dec_fmt[AML_FMT_SRC];
> +	else
> +		dec_fmt =3D &ctx->dec_fmt[AML_FMT_DST];
> +
> +	pix_mp->field =3D V4L2_FIELD_NONE;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(type)) {
> +		pix_mp->num_planes =3D dec_fmt->num_planes;
> +		pix_mp->pixelformat =3D dec_fmt->fourcc;

[Severity: High]
Does this unconditionally overwrite the user-requested pixel format with the
current active format? This prevents userspace applications from querying
supported formats using VIDIOC_TRY_FMT since their requested format is
aggressively overridden.

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
Can this S_FMT call on the OUTPUT queue corrupt the CAPTURE queue's state?
By directly assigning to ctx->pix_fmt[AML_FMT_DST], configuring the bitstre=
am
format clobbers the raw uncompressed format already configured on the CAPTU=
RE
queue.

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
Should this failure path return the queued buffers to the framework?
When start_streaming fails, the videobuf2 framework requires the driver to
return all queued buffers (e.g. using vb2_buffer_done with
VB2_BUF_STATE_QUEUED), otherwise the queue stalls and videobuf2 warns.

[ ... ]

> +static void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
> +{
> +	struct aml_vdec_ctx *ctx =3D vb2_get_drv_priv(q);
> +	struct vb2_v4l2_buffer *src_buf =3D NULL, *dst_buf =3D NULL;
> +
> +	aml_vdec_release_instance(ctx);

[Severity: Critical]
Is it safe to release the codec instance here when only one of the queues
is stopped?

If userspace stops the CAPTURE queue, aml_vdec_release_instance is called,
which frees the codec context and nullifies codec_priv. If the OUTPUT queue
is still streaming, subsequent hardware interrupts or V4L2 jobs will
dereference the freed or NULL codec_priv, causing a kernel panic.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c b/drivers=
/media/platform/amlogic/vdec/aml_vdec_drv.c
> new file mode 100644
> index 0000000000000..d63cbd4f9e26d
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
> @@ -0,0 +1,239 @@

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
Does this unconditionally overwrite the global device context pointer?
If multiple programs open the video device, the global pointer is overwritt=
en.
Since the threaded ISR unconditionally uses these global pointers to look
up the active context, an interrupt generated by one client will be process=
ed
using another client's context, leading to state corruption and use-after-f=
ree
crashes.

[ ... ]

> +static int fops_vcodec_release(struct file *file)
> +{
> +	struct aml_vdec_dev *dec_dev =3D video_drvdata(file);
> +	struct aml_vdec_ctx *ctx =3D fh_to_dec_ctx(file);
> +
> +	mutex_lock(&dec_dev->dev_mutex);

[Severity: High]
Is the lifetime of dec_dev properly managed here?
In aml_vdec_drv_probe, the aml_vdec_dev struct is allocated with
devm_kzalloc, tying it to the platform device. If the driver is unbound
while userspace still holds an open file descriptor, the memory is freed.
When userspace later closes the file descriptor, fops_vcodec_release will
dereference the freed memory when attempting to take the mutex.

[ ... ]

> +static int aml_vdec_drv_probe(struct platform_device *pdev)
> +{
> +	struct aml_vdec_dev *dev;
> +	struct video_device *vfd_dec;
> +	struct aml_vdec_hw *hw;
> +	int ret =3D 0;
> +
> +	dev =3D devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);

[Severity: High]
Could tying this structure to the platform device using devm_kzalloc
lead to use-after-free bugs as described in the release fop above?

[ ... ]

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

[ ... ]

> +err_media_dev_register:
> +	v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +error_m2m_mc_register:
> +	media_device_cleanup(&dev->mdev);
> +err_vid_dev_register:
> +	v4l2_m2m_release(dev->m2m_dev_dec);
> +err_hw_init:
> +	dev->dec_hw =3D NULL;

[Severity: High]
Does this error path leak the requested hardware resources?
If probe fails after req_hw_resource completes successfully, jumping to
err_hw_init clears the pointer without invoking the corresponding
destroy_hw_resource callback, permanently leaking power domains, device
links, clocks, and IRQs.

> +err_dec_mem_init:
> +	video_device_release(vfd_dec);
> +err_device_alloc:
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +	return ret;
> +}

[Severity: High]
Is a call to video_unregister_device missing on the error paths after
video_register_device succeeds?
If probe fails late (like during media_device_register), the error cleanup
invokes video_device_release which immediately frees the memory, but
leaves the active video node registered. If userspace opens it, it will acc=
ess
the deallocated structure.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c b/drivers/=
media/platform/amlogic/vdec/aml_vdec_hw.c
> new file mode 100644
> index 0000000000000..29a195eb68721
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c

[ ... ]

> +void aml_stop_vdec_hw(struct aml_vdec_hw *hw)
> +{
> +	u32 reg_val =3D 0;
> +	int ret;
> +
> +	regmap_write(hw->map[DOS_BUS], MPSR, 0);
> +	regmap_write(hw->map[DOS_BUS], CPSR, 0);
> +
> +	ret =3D read_poll_timeout_atomic(read_dos_reg, reg_val,
> +				       !(reg_val & 0x8000),
> +				       10, 100000, true,
> +				       hw, IMEM_DMA_CTRL);
> +
> +	ret =3D read_poll_timeout_atomic(read_dos_reg, reg_val,
> +				       !(reg_val & 0x8000),
> +				       10, 100000, true,
> +				       hw, LMEM_DMA_CTRL);
> +
> +	ret =3D read_poll_timeout_atomic(read_dos_reg, reg_val,
> +				       !(reg_val & 0xfff),
> +				       10, 800000, true,
> +				       hw, WRRSP_LMEM);

[Severity: High]
Could this atomic poll timeout cause a soft lockup?
read_poll_timeout_atomic uses udelay to busily spin the processor without
yielding. Spinning for up to 800ms severely violates kernel latency constra=
ints
and will trigger CPU stalls and soft lockup warnings.

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
> +			continue;
> +		}
> +
> +		pd[i].link =3D device_link_add(hw->dev, pd[i].dev,
> +					     DL_FLAG_PM_RUNTIME |
> +					     DL_FLAG_STATELESS);
> +		if (IS_ERR_OR_NULL(pd[i].link)) {
> +			dev_err(hw->dev, "Adding %s device link failed!\n", pd[i].name);
> +			return -ENODEV;
> +		}

[Severity: High]
Can pd[i].dev end up storing an ERR_PTR if dev_pm_domain_attach_by_name fai=
ls?
If an ERR_PTR is returned, IS_ERR_OR_NULL catches it, but pd[i].dev retains
the error pointer. Later, in pm_vdec_power_domain_power_on, the code checks
if (dev). Since ERR_PTR is non-NULL, the check passes, and the error pointer
is sent directly into pm_runtime_get_sync, causing a kernel panic.

[Severity: Medium]
Does this error path leak previously attached domains?
If device_link_add fails on the second iteration, returning -ENODEV directly
bypasses cleanup (device_link_del / dev_pm_domain_detach) for the successful
first iteration.

[ ... ]

> +static void pm_vdec_power_domain_power_on(struct aml_vdec_hw *hw, int id)
> +{
> +	const struct power_manager_s *pm =3D hw->pm;
> +	struct device *dev =3D pm->pd_data[id].dev;
> +	struct clk_bulk_data *gate_node =3D NULL;
> +
> +	if (id =3D=3D VDEC)
> +		gate_node =3D vdec_get_clk_by_name(hw, "vdec");
> +	else if (id =3D=3D HVDEC)
> +		gate_node =3D vdec_get_clk_by_name(hw, "hevcf");

[Severity: High]
Is the dos clock missing from being enabled here?
The dos clock is fetched in vdec_clock_gate_init, but this function only
checks for vdec and hevcf to enable. If the dos clock remains disabled,
subsequent accesses to the DOS_BUS could stall the system bus.

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
> +
> +	hw->pm->power_on(hw, core);
> +
> +out:
> +	mutex_unlock(&hw->pm_mutex);
> +}

[Severity: High]
Does skipping power_on here break the PM usage counts and clock balancing?
If hw->pm->power_state is true, the driver jumps to out without calling
power_on. However, power_on is responsible for clk_prepare_enable and
pm_runtime_get_sync. By bypassing it, the clock isn't prepared, but
vdec_poweroff will unconditionally execute power_off, disabling the
clock and triggering a PM put underflow.

[ ... ]

> +int dev_request_hw_resources(void *priv)
> +{
> +	struct aml_vdec_dev *dev =3D (struct aml_vdec_dev *)priv;
> +	struct aml_vdec_hw *hw;
> +	struct platform_device *pdev;
> +	struct device_node *sm_np;
> +	void __iomem *reg_base[MAX_REG_BUS];
> +	struct resource res;
> +	int i;
> +	int ret =3D -1;
> +
> +	if (!dev || !dev->dec_hw)
> +		return -1;
> +
> +	pdev =3D dev->plat_dev;
> +	hw =3D dev->dec_hw;
> +	hw->dev =3D &pdev->dev;

[ ... ]

> +	sm_np =3D of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);
> +	if (IS_ERR(sm_np))
> +		return PTR_ERR(hw->canvas);

[Severity: High]
Does of_parse_phandle return NULL on failure rather than an ERR_PTR?
If the secure-monitor property is missing, sm_np is NULL, meaning IS_ERR
evaluates to false. The driver will then pass NULL into meson_sm_get, which
likely dereferences it, resulting in a kernel panic.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c b/driv=
ers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
> new file mode 100644
> index 0000000000000..ad4156249f558
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c

[ ... ]

> +static int get_firmware(const char *path, void **data, size_t *size)
> +{
> +	const struct firmware *fw =3D NULL;
> +	int ret;
> +	void *buf;
> +
> +	ret =3D request_firmware(&fw, FIRMWARE_PATH, NULL);
> +	if (ret)
> +		return ret;
> +
> +	/* get rid of the first 32K bytes plaintext */
> +	buf =3D kzalloc((fw->size - UCODE_HEADER_SIZE), GFP_KERNEL);

[Severity: High]
Should there be a bounds check on fw->size before subtracting?
If the loaded firmware file is smaller than UCODE_HEADER_SIZE (32KB), this
subtraction underflows to a massive value, leading to a huge kzalloc failure
or out-of-bounds heap operations.

> diff --git a/drivers/media/platform/amlogic/vdec/h264.c b/drivers/media/p=
latform/amlogic/vdec/h264.c
> new file mode 100644
> index 0000000000000..7584d5eb20ec8
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/h264.c

[ ... ]

> +static int h264_prepare_input(struct aml_vdec_ctx *ctx)
> +{

[ ... ]

> +	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_RP,
> +		     round_down(src_dma, VDEC_FIFO_ALIGN));
> +	dummy =3D payload_size + VLD_PADDING_SIZE;
> +	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_WP,
> +		     round_down((src_dma + dummy), VDEC_FIFO_ALIGN));

[Severity: High]
Does this cause the hardware to read out-of-bounds memory?
Adding VLD_PADDING_SIZE (1024 bytes) to the payload size implicitly
tells the hardware stream parser to read past the end of the user-provided
V4L2 buffer payload. If the payload size aligns closely with the end of
the IOMMU/VMA mapping, this causes OOB DMA reads and IOMMU faults.

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

[Severity: Critical]
Are the dimensions provided in the untrusted SPS validated against the
actual allocated V4L2 destination buffer size?

The user-supplied SPS dimensions are translated to canvas dimensions here.
If userspace provides massive SPS dimensions but queues a small destination
buffer, the hardware decoder will write out of bounds during decoding,
corrupting adjoining kernel physical memory.

[ ... ]

> +static void config_decode_canvas(struct aml_vdec_hw *hw,
> +				 struct h264_decode_buf_spec *buf_spec,
> +				 u32 mb_width, u32 mb_height)
> +{
> +	int canvas_alloc_result =3D 0;
> +	int blkmode =3D 0x0;
> +
> +	canvas_alloc_result =3D meson_canvas_alloc(hw->canvas, &buf_spec->y_can=
vas_index);
> +	canvas_alloc_result =3D meson_canvas_alloc(hw->canvas, &buf_spec->u_can=
vas_index);

[Severity: High]
Does the second assignment overwrite the allocation result of the first?
If the allocation of the y canvas fails but the u canvas succeeds, the
failure is masked, and the hardware is configured with an uninitialized
y_canvas_index.

[ ... ]

> +static void reorder_short_term(struct slice *curr_slice, int cur_list,
> +			       int pic_num_lx, int *ref_idx_lx)
> +{
> +	struct aml_h264_ctx *h264_ctx =3D
> +	    container_of(curr_slice, struct aml_h264_ctx, mslice);
> +	struct aml_vdec_ctx *ctx =3D h264_ctx->v4l2_ctx;
> +	int c_idx, n_idx;
> +	int num_ref_idx_lx_active;
> +	struct h264_decode_buf_spec *pic_lx =3D NULL;
> +	struct h264_decode_buf_spec *ref_list_reordered;

[ ... ]

> +	for (c_idx =3D num_ref_idx_lx_active; c_idx > *ref_idx_lx; c_idx--)
> +		memcpy(&ref_list_reordered[c_idx], &ref_list_reordered[c_idx - 1],
> +		       sizeof(struct h264_decode_buf_spec));

[Severity: Critical]
Is num_ref_idx_lx_active properly validated before this backwards memcpy?
num_ref_idx_l0_active_minus1 is parsed from the untrusted bitstream or
user-supplied PPS, and can be up to 65535. get_ref_list_size returns this
value, which is then used as a loop boundary for memcpy over the
fixed 17-element ref_list0 array, causing massive heap buffer overflows.

[ ... ]

> +static void copy_ref_list(struct aml_h264_ctx *h264_ctx, int curr_list)
> +{
> +	if (curr_list =3D=3D 0)
> +		memcpy(h264_ctx->ref_list0_unreordered, h264_ctx->ref_list0,
> +		       sizeof(h264_ctx->ref_list0));
> +	else
> +		memcpy(h264_ctx->ref_list1_unreordered, h264_ctx->ref_list0,
> +		       sizeof(h264_ctx->ref_list1));
> +}

[Severity: High]
Does this memcpy copy from the wrong source list?
It copies h264_ctx->ref_list0 into ref_list1_unreordered instead of
h264_ctx->ref_list1, breaking B-frame reference list reordering.

[ ... ]

> +static void clear_unused_col_buf(struct aml_h264_ctx *h264_ctx,
> +				 struct v4l2_ctrl_h264_decode_params *decode)
> +{
> +	int i, col_poc;
> +
> +	/* flush all col buffers when IDR */
> +	if (decode->flags =3D=3D V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC) {

[Severity: High]
Can this equality check fail because flags is a bitmask?
If decode->flags has another bit set (like V4L2_H264_DECODE_PARAM_FLAG_FIEL=
D_PIC)
alongside V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC, the strict equality fails. T=
his
prevents the necessary flushing of colocated buffers on IDR frames.

[ ... ]

> +static void h264_config_decode_spec(struct aml_vdec_hw *hw, struct aml_v=
dec_ctx *ctx)
> +{
> +	struct aml_h264_ctx *h264_ctx =3D (struct aml_h264_ctx *)hw->curr_ctx;
> +	struct vdec_h264_stateless_ctrl_ref *ctrls =3D &h264_ctx->ctrl_ref;
> +	struct v4l2_ctrl_h264_decode_params *decode =3D
> +	    (struct v4l2_ctrl_h264_decode_params *)ctrls->decode;
> +	struct h264_decode_buf_spec *buf_spec_l0, *buf_spec_l1;

[ ... ]

> +		buf_spec_l0 =3D find_spec_by_dpb_index(h264_ctx, i, 0);
> +		if (buf_spec_l0) {
> +			buf_spec_l0->canvas_pos =3D
> +			    get_canvas_pos_by_poc(h264_ctx,
> +						  dpb->top_field_order_cnt);

[ ... ]

> +			buf_spec_l0->y_dma_addr =3D
> +				vb2_dma_contig_plane_dma_addr(vb, 0);
> +			if (ctx->pic_info.plane_num > 1)
> +				buf_spec_l0->c_dma_addr =3D
> +				    vb2_dma_contig_plane_dma_addr(vb, 1);
> +			else
> +				buf_spec_l0->c_dma_addr =3D
> +				    buf_spec_l0->y_dma_addr +
> +				    ctx->pic_info.fb_size[0];

[Severity: Critical]
Is ctx->pic_info.plane_num accurate here for multi-planar capture formats?
In vdec_try_fmt_mp and set_pic_info, plane_num is hardcoded to 1 when
formatting the output queue. When userspace sets a multi-planar format
(like NV12M) on the capture queue, plane_num remains 1. The code here
subsequently calculates the UV address as y_dma_addr + fb_size[0], pointing
completely out of bounds of the actual Y plane allocation, causing severe
DMA memory corruption.

[ ... ]

> +	for (i =3D 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
> +		struct v4l2_h264_dpb_entry *dpb =3D &decode->dpb[i];
> +
> +		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> +			break;

[Severity: High]
Should this be a continue instead of a break?
V4L2 DPB arrays can be sparse. If an empty slot is encountered early in the
iteration, break exits the loop completely, skipping configuration for
all subsequent valid reference frames in the array.

[ ... ]

> +static int alloc_colocate_cma(struct aml_h264_ctx *h264_ctx,
> +			      struct aml_vdec_ctx *ctx)
> +{
> +	int alloc_size =3D 0;
> +	int i;
> +	struct aml_vdec_hw *hw;
> +
> +	if (h264_ctx->collated_cma_vaddr)
> +		return 0;
> +
> +	hw =3D vdec_get_hw(ctx->dev);
> +	if (!hw)
> +		return -1;
> +
> +	/* 96 :col buf size for each mb */
> +	h264_ctx->one_col_buf_size =3D h264_ctx->mb_total * 96;
> +	alloc_size =3D PAGE_ALIGN(h264_ctx->one_col_buf_size *
> +			(h264_ctx->max_num_ref_frames + COL_BUFFER_MARGIN));
> +	h264_ctx->collated_cma_vaddr =3D dma_alloc_coherent(hw->dev, alloc_size,
> +							  &h264_ctx->collated_cma_addr, GFP_KERNEL);

[Severity: Critical]
Can this allocation size wrap around?
Because the SPS parameters used to compute one_col_buf_size and
max_num_ref_frames are unvalidated, the multiplication can wrap around in
32-bit space, allocating a tiny CMA buffer.

[ ... ]

> +static int h264_config_decode_buf(struct aml_vdec_hw *hw,
> +				  struct aml_vdec_ctx *ctx)
> +{

[ ... ]

> +	if (h264_ctx->curr_spec.col_buf_index >=3D 0 &&
> +	    h264_ctx->curr_spec.col_buf_index < h264_ctx->colocated_buf_num) {
> +		colocate_wr_adr =3D h264_ctx->collated_cma_addr +
> +		    ((h264_ctx->one_col_buf_size *
> +		      h264_ctx->curr_spec.col_buf_index) >> (use_mode_8x8_flag ? 2 : 0=
));

[Severity: Critical]
Is colocate_wr_adr incorrectly typed as 32-bit (unsigned int)?
Assigning the 64-bit collated_cma_addr (dma_addr_t) to a 32-bit integer
truncates the upper bits. The subsequent bounds check
(colocate_wr_adr + one_col_buf_size > collated_cma_addr_end) wraps around in
32-bit space, allowing out-of-bounds DMA programming.

[ ... ]

> +static void release_canvas_index(struct aml_vdec_hw *hw,
> +				 struct h264_decode_buf_spec *buf)
> +{
> +	if (buf->y_canvas_index >=3D 0) {
> +		dev_dbg(hw->dev, "free y_canvas %d\n", buf->y_canvas_index);
> +		meson_canvas_free(hw->canvas, buf->y_canvas_index);
> +		buf->y_canvas_index =3D -1;
> +	}

[Severity: High]
Does this negative bounds check work on a u8 variable?
buf->y_canvas_index is declared as a u8. The check >=3D 0 will always be
true, causing it to blindly invoke meson_canvas_free(hw->canvas, 255)
when it hasn't been allocated, which corrupts other subsystem canvases.

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

[Severity: High]
Is it safe to blindly dereference h264_ctx here?
When the stream is torn down in aml_h264_exit, curr_ctx is assigned NULL.
If a spurious or delayed hardware interrupt fires shortly after, this will
trigger a NULL pointer dereference panic.

[ ... ]

> +		if (h264_config_decode_buf(hw, ctx) < 0) {
> +			h264_release_decode_spec(hw, ctx);
> +			ctx->int_cond =3D 1;
> +			wake_up_interruptible(&ctx->queue);
> +			goto irq_handled;
> +		}

[Severity: High]
Is the v4l2_m2m_buf_done_and_job_finish call missing from this error path?
The code wakes up the waiter thread, but skips signalling job completion to
the M2M framework. The framework will never register the job as finished,
permanently hanging the M2M queue for any subsequent jobs.

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
> +	case H264_SLICE_DATA_DONE:
> +		h264_release_decode_spec(hw, ctx);
> +		h264_ctx->decode_pic_count++;
> +		ctx->int_cond =3D 1;
> +		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
> +						 VB2_BUF_STATE_DONE);
> +		wake_up_interruptible(&ctx->queue);
> +		break;

[Severity: High]
Could marking the job finished here cause a race with aml_stop_vdec_hw?
Calling v4l2_m2m_buf_done_and_job_finish signals the framework to
immediately dequeue and start the next job. Concurrently, the awoken
thread inside aml_h264_dec_run proceeds to issue an aml_stop_vdec_hw,
shutting down the hardware unit out from under the newly scheduled job.

[ ... ]

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

[Severity: Medium]
Does this error path leak the freshly allocated h264_ctx structure?
If vdec_get_hw returns NULL, the function returns -1 without calling
kfree on h264_ctx.

[ ... ]

> +int aml_h264_dec_run(void *priv)
> +{
> +	struct aml_vdec_ctx *ctx =3D (struct aml_vdec_ctx *)priv;
> +	struct aml_h264_ctx *h264_ctx =3D (struct aml_h264_ctx *)ctx->codec_pri=
v;
> +	struct aml_vdec_hw *dec_hw =3D vdec_get_hw(ctx->dev);
> +	int ret =3D -1;
> +	int i;

[ ... ]

> +	aml_start_vdec_hw(dec_hw);
> +	h264_ctx->init_flag =3D 1;
> +
> +	regmap_write(dec_hw->map[DOS_BUS], DPB_STATUS_REG, H264_ACTION_SEARCH_H=
EAD);
> +
> +	ret =3D wait_event_interruptible_timeout(ctx->queue, ctx->int_cond,
> +					       msecs_to_jiffies(DECODER_TIMEOUT_MS));

[Severity: High]
Does synchronously blocking inside device_run violate the M2M Request API?
If this timeout triggers, device_run returns and callers typically assume
the job failed and may finish it. However, the delayed hardware interrupt
could subsequently fire and call v4l2_m2m_buf_done_and_job_finish for the
same job, double-finishing the context and corrupting M2M framework state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-b4-s4-vdec=
-upstream-v6-0-6072a7ee7428@amlogic.com?part=3D4
