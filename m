Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE54A3AE6E5
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789650; cv=none; b=L7qb6lcI8qGkVtZTHGppacBDXxxZUORGiK6yfhFbfTxtPLgmhiUfZmRlUQrtH52ZdaBBWrhVXn6PcgH86MsOL7Dnpo/dkEaeaw83Rrc48TN9JcCSKVkcpytmAS3CFAt5dd7ScETsogIbpn+v6R1eeFO5RcI0zBkqyxCHexMoc/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789650; c=relaxed/simple;
	bh=zJArM2OixImZhfSHivx5jBwJhqsjU3ULBz2XIEegnmw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=BMdDaMNNt+AGBEmlnDu+j5RRVECrdlhFgDl5OH7RtnYN9Ze8nZYMb6NSxbtAGcjY2KhysJWbarypygxIXPB+r156vqKPhbcv+YFmV4pQKMu39LJkxw9hJVgOgwYZ2jyC/L7VaLWJzNvdpmCZobcjvfZRLv5IUj0QnZPvLq0SiQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Un0d5S0X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Un0d5S0X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03501F0089B;
	Mon, 12 Oct 2026 07:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791789648;
	bh=/J8A8LCaAA3CsQhAHUEsS6ViRpTCjWN6mIioaoOUMy8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Un0d5S0X3zvht+neaoYId0lqPGrupk9sCmTsd3b5UyCdyZhM7mQE8NwPE8Si7yxsJ
	 rYzoom0+tu2nf0/NZLWIsza+di30s2dZ4Cweuupryuyx7HQt9BsNIeA2gwO+EFzP+z
	 KM1pIyZU3lUekFp0H+iTyiXpW6EFtouHJXU9MNV6R2tY89wCgvvk63odZozsU8KDxL
	 1ryr2YNXR33mBjOMhNPzZEc9nZyyyqWQ+P0eqgB00OmYjSu1N303MCrxdKye1fWJUH
	 Xiz89TgDSHTwM5LTBsF+ubadsQMdeBDEh5COFSdIKDjdDhPjLtTykTOh+nh4+Bl6rp
	 GKKfR/IlhBJfg==
Message-ID: <sashiko-outbox-167785@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 4/6] decoder: Add V4L2 stateless H.264 decoder
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261012-b4-s4-vdec-upstream-v11-4-25939f85ada5@amlogic.com>
References: <20261012-b4-s4-vdec-upstream-v11-0-25939f85ada5@amlogic.com>
 <20261012-b4-s4-vdec-upstream-v11-4-25939f85ada5@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 07:20:47 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 19 potential issue=
(s) to consider:
- [Critical] media: amlogic: out-of-bounds array access in aml_vdec_init_de=
c_inst allows control flow hijack
- [Critical] media: amlogic: concurrent STREAMOFF frees codec context while=
 worker thread is waiting
- [High] media: amlogic: uaf on device removal due to devm_kzalloc and v4l2=
_m2m_release
- [High] media: amlogic: get_canvas_index maps stale dangling DMA addresses=
 to hardware
- [High] media: amlogic: stale one_col_buf_size causes DMA buffer overflow =
on resolution change
- [High] media: amlogic: missing error handling in pm_vdec_power_domain_pow=
er_on causes leaks and MMIO aborts
- [High] media: amlogic: aml_stop_vdec_hw resets hardware concurrently with=
 threaded ISR
- [High] media: amlogic: unprotected dos_enable in device_run races with am=
l_h264_exit
- [High] media: amlogic: vb2_find_buffer called from threaded ISR without h=
olding queue lock
- [High] media: amlogic: video device registered before hardware power doma=
in is enabled
- [Medium] media: amlogic: irq registered before hardware reset and without=
 handler
- [Medium] media: amlogic: failed canvas config silently compresses hardwar=
e reference list
- [Medium] media: amlogic: per-instance power domain device state corrupts =
static global array
- [Medium] media: amlogic: ref_list1 incorrectly checked against ref_list0 =
valid flag
- [Medium] media: amlogic: poc_is_in_dpb ignores V4L2_H264_DPB_ENTRY_FLAG_V=
ALID leaking resources
- [Low] media: amlogic: double completion of media request triggers WARN_ON
- [Low] media: amlogic: vdec_s_fmt_output falsely rejects identical format =
changes with -EBUSY
- [Low] media: amlogic: hardware stride configured using SPS width instead =
of v4l2 bytesperline
- [Low] media: amlogic: implicit declaration of kzalloc_obj causes build fa=
ilure
--

commit da274125c14d2da90bb83a7ffc30b57d96da9323
Author: Zhentao Guo <zhentao.guo@amlogic.com>
Subject: decoder: Add V4L2 stateless H.264 decoder driver

This commit adds initial support for a V4L2 stateless video decoder driver =
on
the Amlogic S4 platform. It supports 8-bit H.264 progressive bitstreams in
this first phase.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.c b/drivers/med=
ia/platform/amlogic/vdec/aml_vdec.c
> --- a/drivers/media/platform/amlogic/vdec/aml_vdec.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c
> @@ -133,6 +133,8 @@ static void m2mops_vdec_device_run(void *m2m_priv)
>  		v4l2_ctrl_request_setup(src_req, &ctx->ctrl_handler);
> =20
>  	dos_enable(dev->dec_hw);
>  	/* incase of bus hang in stop_streaming */
>  	ctx->dos_clk_en =3D 1;
>  	ctx->curr_frm_err_flag =3D 0;
> =20
>  	if (ctx->curr_dec_type =3D=3D CODEC_TYPE_H264)
>  		aml_vdec_reset_core(dev->dec_hw);

[Severity: High]
Does this execute hardware setup before curr_ctx is assigned and without
cross-instance locking?

If another decoding instance is concurrently stopped via VIDIOC_STREAMOFF, =
its
aml_h264_exit() could see (!dec_hw->curr_ctx || dec_hw->curr_ctx =3D=3D h26=
4_ctx)
evaluate to true, locking ctx_mutex and shutting down the hardware while th=
is
instance is simultaneously trying to initialize it.

> @@ -148,6 +148,8 @@ static void m2mops_vdec_device_run(void *m2m_priv)
>  	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>  	if (src_req)
>  		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);

[Severity: Low]
Is this explicit call to v4l2_ctrl_request_complete() triggering a double
completion warning?

Later in this function, v4l2_m2m_buf_done_and_job_finish() will call
vb2_buffer_done(), which invokes the buf_request_complete callback defined =
in
aml_vdec_vb2_ops. That callback also calls v4l2_ctrl_request_complete() on =
the
same request.

[ ... ]
> @@ -231,6 +231,10 @@ static int aml_vdec_init_dec_inst(struct aml_vdec_ct=
x *ctx)
>  	struct aml_video_fmt *fmt_out =3D &ctx->dec_fmt[AML_FMT_SRC];
>  	int ret =3D -1;
> =20
>  	ctx->codec_ops =3D &dev->pvdec_data->codec_ops[fmt_out->codec_type];
>  	/*
>  	 * The codec instance is only released when both queues are
>  	 * streamed off: do not allocate a new one (leaking the previous
>  	 * instance) when the output queue is restarted while the
>  	 * capture queue is still streaming.
>  	 */
>  	if (ctx->codec_ops->init && !ctx->codec_priv) {
>  		ret =3D ctx->codec_ops->init(ctx);

[Severity: Critical]
Does this permit an out-of-bounds array access if fmt_out->codec_type is
untrusted?

If unprivileged userspace calls VIDIOC_S_FMT on the output queue with a
capture-only format (e.g. V4L2_PIX_FMT_NV12), aml_vdec_get_video_fmt() could
return that format and record its codec_type as CODEC_TYPE_FRAME (1). When
STREAMON resolves the codec operations here, index 1 reads past the end of =
the
aml_S4_dec_ops array and dereferences a wild function pointer.

[ ... ]
> @@ -311,6 +311,10 @@ static int vdec_s_fmt_output(struct aml_vdec_ctx *ct=
x, struct v4l2_format *f)
>  	peer_vq =3D v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_M=
PLANE);
>  	if (vb2_is_busy(peer_vq) &&
>  	    (pix_mp->width !=3D cap_fmt->width ||
>  	    pix_mp->height !=3D cap_fmt->height))
>  		return -EBUSY;

[Severity: Low]
Could this falsely reject identical format changes with -EBUSY?

The cap_fmt structure contains the active capture format, which has already
been aligned to hardware constraints. The pix_mp structure contains the
unaligned user-requested dimensions. If userspace requests the exact same
unaligned format while the queue is busy, this check fails and falsely reje=
cts
a legitimate no-op format setting.

> =20
>  	out_fmt =3D aml_vdec_get_video_fmt(ctx->dev, pix_mp->pixelformat);
>  	if (out_fmt) {
>  		ctx->dec_fmt[AML_FMT_SRC] =3D *out_fmt;

[Severity: Critical]
Can this bind a capture-only format to the output queue?

The aml_vdec_get_video_fmt() function ignores fmt->type during lookup. This
means a format like V4L2_PIX_FMT_NV12 can be applied to the output queue,
which eventually leads to the out-of-bounds access in aml_vdec_init_dec_ins=
t().

[ ... ]
> @@ -522,6 +522,8 @@ static void vb2ops_vdec_stop_streaming(struct vb2_que=
ue *q)
>  	}
> =20
>  	if (!ctx->is_output_streamon && !ctx->is_cap_streamon)
>  		aml_vdec_release_instance(ctx);
>  }

[Severity: Critical]
Does this free the codec context without synchronizing against the active
worker thread?

If STREAMOFF runs while the device_run worker thread is blocked in
wait_event_interruptible_timeout(), aml_h264_exit() will free ctx->codec_pr=
iv.
When the worker thread wakes up, it will write to the freed memory.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c b/drivers=
/media/platform/amlogic/vdec/aml_vdec_drv.c
> --- a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
> @@ -23,6 +23,7 @@ static int fops_vcodec_open(struct file *file)
>  	struct aml_vdec_ctx *ctx =3D NULL;
>  	int ret =3D 0;
> =20
>  	ctx =3D kzalloc_obj(*ctx, GFP_KERNEL);

[Severity: Low]
Is kzalloc_obj() an undefined macro/function here?

It looks like this might have meant to be kzalloc(sizeof(*ctx), GFP_KERNEL),
and will cause a build failure as written.

[ ... ]
> @@ -68,6 +69,7 @@ static int fops_vcodec_release(struct file *file)
>  {
>  	struct aml_vdec_ctx *ctx =3D fh_to_dec_ctx(file);
> =20
>  	v4l2_m2m_ctx_release(ctx->m2m_ctx);

[Severity: High]
Does this access the M2M device after it has been freed?

If the device is unbound via sysfs while a userspace process holds the file
descriptor open, aml_vdec_drv_remove() runs and calls v4l2_m2m_release().
Since the driver structures were allocated with devm_kzalloc, they are freed
immediately. When userspace eventually closes the file descriptor, this del=
ayed
call accesses the freed m2m_dev_dec.

[ ... ]
> @@ -168,6 +170,8 @@ static int aml_vdec_drv_probe(struct platform_device =
*pdev)
>  		goto err_m2m_dev_init;
>  	}
> =20
>  	ret =3D video_register_device(vfd_dec, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
>  		v4l2_err(&dev->v4l2_dev, "Failed to register video device");
> @@ -189,6 +193,7 @@ static int aml_vdec_drv_probe(struct platform_device =
*pdev)
>  		v4l2_err(&dev->v4l2_dev, "Failed to register media device");
>  		goto err_media_dev_register;
>  	}
>  	vdec_enable(dev->dec_hw);

[Severity: High]
Is the video device registered and exposed to userspace before the hardware
power domain is enabled?

A fast userspace process can immediately open the device and start streamin=
g,
causing the driver to execute MMIO reads/writes on unpowered registers,
resulting in synchronous external aborts.

[ ... ]
> @@ -233,6 +238,8 @@ static void aml_vdec_drv_remove(struct platform_devic=
e *pdev)
>  	video_unregister_device(dev->vfd);
>  	media_device_cleanup(&dev->mdev);
> =20
>  	v4l2_m2m_release(dev->m2m_dev_dec);
>  	dev->pvdec_data->destroy_hw_resource(dev);

[Severity: High]
Does releasing the M2M device here create a use-after-free risk for open fi=
le
descriptors?

Since dev and dec_hw use devm_kzalloc, releasing them here before all fds a=
re
closed means that fops_vcodec_release() will later dereference freed memory.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c b/drivers/=
media/platform/amlogic/vdec/aml_vdec_hw.c
> --- a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
> @@ -179,6 +179,8 @@ static int pm_vdec_power_domain_init(struct aml_vdec_=
hw *hw)
> =20
>  	for (i =3D 0; i < VDEC_MAX; i++) {
>  		pd[i].dev =3D dev_pm_domain_attach_by_name(hw->dev, pd[i].name);
>  		if (IS_ERR_OR_NULL(pd[i].dev)) {
>  			err =3D PTR_ERR(pd[i].dev);
>  			dev_dbg(hw->dev, "Get %s failed, pm-domain: %d\n",
>  				pd[i].name, err);
>  			pd[i].dev =3D NULL;
>  			continue;
>  		}
> =20
>  		pd[i].link =3D device_link_add(hw->dev, pd[i].dev,

[Severity: Medium]
Does storing per-device pointers into the static global 'vdec_domain_data'
array corrupt state for multiple instances?

If the driver unbinds and rebinds, or if multiple instances probe, the glob=
al
array will be overwritten, causing teardown routines to operate on corrupted
pointers.

[ ... ]
> @@ -283,6 +285,8 @@ static void pm_vdec_power_domain_power_on(struct aml_=
vdec_hw *hw, int id)
> =20
>  	if (!ret && dev) {
>  		ret =3D pm_runtime_resume_and_get(dev);
>  		if (ret < 0)
>  			dev_err(hw->dev, "failed to power on %s domain: %d\n",
>  				pm->pd_data[id].name, ret);
>  		else
>  			dev_dbg(dev, "dev: %p link %p the %-15s power on\n",
>  				dev, pm->pd_data[id].link, pm->pd_data[id].name);
>  	}
> =20
>  	/*
>  	 * Do not touch the DOS registers when the clock or the power
>  	 * domain could not be enabled, the MMIO access would abort.
>  	 */
>  	if (!ret)
>  		dos_local_config(hw, 1, id);

[Severity: High]
If pm_runtime_resume_and_get() fails, does this leave the clock enabled?

Because it doesn't clean up the clk_prepare_enable() call, the clock leaks.
Also, if either gate_node or dev is NULL, ret remains 0, which bypasses the
enablement but allows dos_local_config() to execute unpowered MMIO writes,
causing a bus crash.

[ ... ]
> @@ -343,6 +347,8 @@ static irqreturn_t vdec_threaded_isr_handler(int irq,=
 void *priv)
> =20
>  	mutex_lock(&hw->ctx_mutex);
>  	if (hw->hw_ops.irq_threaded_func && hw->curr_ctx)
>  		ret =3D hw->hw_ops.irq_threaded_func(irq, priv);
>  	mutex_unlock(&hw->ctx_mutex);

[Severity: High]
Does this threaded ISR program hardware registers while relying solely on
ctx_mutex?

During a decoder timeout, aml_h264_dec_run() calls aml_stop_vdec_hw() witho=
ut
acquiring ctx_mutex. This causes the hardware to be reset concurrently while
the ISR might still be actively programming its memory and registers.

[ ... ]
> @@ -428,6 +434,8 @@ static irqreturn_t vdec_irq_handler(int irq, void *pr=
iv)
>  	irqreturn_t ret =3D IRQ_NONE;
> =20
>  	if (hw->hw_ops.irq_handler)
>  		ret =3D hw->hw_ops.irq_handler(irq, priv);
> =20
>  	return ret;
>  }
[ ... ]
> @@ -479,6 +487,8 @@ int dev_request_hw_resources(void *priv)
>  		dev_err(&pdev->dev, "get irq failed\n");
>  		return hw->dec_irq;
>  	}
>  	ret =3D devm_request_threaded_irq(&pdev->dev, hw->dec_irq, vdec_irq_han=
dler,

[Severity: Medium]
Could a pending interrupt cause the IRQ line to be permanently disabled?

The IRQ is registered before the hardware has been explicitly reset, and
hw->hw_ops.irq_handler is NULL at this point. If an interrupt fires,
vdec_irq_handler() will repeatedly return IRQ_NONE, causing the kernel to
detect a spurious IRQ storm and disable the line.

> diff --git a/drivers/media/platform/amlogic/vdec/h264.c b/drivers/media/p=
latform/amlogic/vdec/h264.c
> --- a/drivers/media/platform/amlogic/vdec/h264.c
> +++ b/drivers/media/platform/amlogic/vdec/h264.c
> @@ -423,6 +423,8 @@ static int poc_is_in_dpb(int poc, const struct v4l2_h=
264_dpb_entry *dpb)
>  	int ret =3D 0;
> =20
>  	for (i =3D 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
>  		if (poc =3D=3D dpb[i].top_field_order_cnt) {
>  			ret =3D 1;
>  			break;

[Severity: Medium]
Should this check V4L2_H264_DPB_ENTRY_FLAG_VALID before comparing the POC?

If it compares against inactive or stale entries with lingering zeros, it c=
an
falsely return 1, preventing clear_unused_col_buf() from releasing the
associated canvas positions and colocate buffers.

[ ... ]
> @@ -494,6 +496,8 @@ static int config_decode_canvas(struct aml_vdec_hw *h=
w,
>  	/* config y canvas */
>  	meson_canvas_config(hw->canvas,
>  			    buf_spec->y_canvas_index, buf_spec->y_dma_addr,
>  			    mb_width << 4, mb_height << 4,

[Severity: Low]
Does this hardcode the hardware stride to the bitstream-derived width inste=
ad
of the negotiated bytesperline?

V4L2 semantics require using the bytesperline set via VIDIOC_S_FMT. If the
negotiated stride differs from the tightly-packed SPS width, the resulting
image will suffer from visual corruption.

[ ... ]
> @@ -609,6 +613,9 @@ static int alloc_colocate_cma(struct aml_h264_ctx *h2=
64_ctx,
>  	gfp_t gfp =3D GFP_KERNEL | GFP_DMA32;
> =20
>  	if (h264_ctx->collated_cma_vaddr)
>  		return 0;
> =20
>  	hw =3D vdec_get_hw(ctx->dev);

[Severity: High]
Does this bypass updating one_col_buf_size if the buffer was already alloca=
ted?

If the stream dynamically increases in resolution, h264_ctx->one_col_buf_si=
ze
will remain at the stale, smaller size.

[ ... ]
> @@ -838,6 +845,9 @@ static int h264_config_decode_buf(struct aml_vdec_hw =
*hw,
>  	for (i =3D 0; i < h264_ctx->list_size[0]; i++) {
>  		if (!h264_ctx->ref_list0[i].valid)
>  			continue;
>  		canvas_pos =3D h264_ctx->ref_list0[i].canvas_pos;
>  		/* bit 0:3 canvas_pos bit 5:6 frame struct cfg */
>  		ref_cfg_once =3D (canvas_pos & 0x1f) | (type_cfg << 5);

[Severity: Medium]
If a reference picture is invalid, does skipping it without incrementing 'j'
shift all subsequent valid entries into the wrong hardware slots?

This `continue` statement silently bypasses the hardware index packing,
corrupting the decoding of B-frames or P-frames.

[ ... ]
> @@ -865,6 +875,8 @@ static int h264_config_decode_buf(struct aml_vdec_hw =
*hw,
>  	ref_cfg =3D 0;
> =20
>  	for (i =3D 0; i < h264_ctx->list_size[1]; i++) {
>  		if (!h264_ctx->ref_list0[i].valid)
>  			continue;
>  		canvas_pos =3D h264_ctx->ref_list1[i].canvas_pos;

[Severity: Medium]
Is ref_list1 incorrectly checked against ref_list0's valid flag here?

If ref_list0 has fewer valid entries than ref_list1, the loop will erroneou=
sly
skip valid ref_list1 entries.

[ ... ]
> @@ -896,6 +908,9 @@ static int h264_config_decode_buf(struct aml_vdec_hw =
*hw,
>  		colocate_wr_adr =3D (unsigned int)h264_ctx->collated_cma_addr +
>  		    ((h264_ctx->one_col_buf_size *
>  		      h264_ctx->curr_spec.col_buf_index) >> (use_mode_8x8_flag ? 2 : 0=
));
>  		if (colocate_adr_offset > h264_ctx->one_col_buf_size ||
>  		    colocate_wr_adr + h264_ctx->one_col_buf_size >
>  		    (unsigned int)h264_ctx->collated_cma_addr_end) {

[Severity: High]
Does this bounds check permit memory corruption because it verifies against
the old smaller one_col_buf_size?

The hardware is programmed with the new larger dimensions, writing
new_mb_total * 96 bytes starting at colocate_wr_adr, overflowing the spacing
defined by the stale one_col_buf_size.

[ ... ]
> @@ -1570,6 +1585,8 @@ static int h264_config_ref_spec(struct aml_h264_ctx=
 *h264_ctx,
>  		return -1;
>  	}
> =20
>  	vb =3D vb2_find_buffer(vq, dpb->reference_ts);

[Severity: High]
Is it safe to iterate over the vb2 queue buffers from the threaded ISR with=
out
holding the v4l2_intf_lock?

If a concurrent VIDIOC_REQBUFS or VIDIOC_STREAMOFF modifies the queue while
this is executing, it could lead to use-after-free or out-of-bounds accesse=
s.

>  	if (!vb) {
>  		dev_dbg(&ctx->dev->plat_dev->dev,
>  			"ref pic for ts %llu lost\n", dpb->reference_ts);
>  		buf_spec->valid =3D 0;
>  		return -1;

[Severity: High]
Does this leave the stale physical addresses in the buffer spec?

When combined with the loop in get_canvas_index(), which ignores the valid
flag:

drivers/media/platform/amlogic/vdec/h264.c:get_canvas_index() {
...
		for (i =3D 0; i < h264_ctx->list_size[0]; i++) {
			buf =3D &h264_ctx->ref_list0[i];
			ret =3D config_decode_canvas(hw, buf, h264_ctx->mb_width,
...
}

this will configure the hardware to map and use the stale, dangling y_dma_a=
ddr
for the current frame's decoding if reference picture validation fails.

[ ... ]
> @@ -1665,6 +1682,9 @@ static int get_canvas_index(struct aml_vdec_hw *hw,=
 struct aml_vdec_ctx *ctx)
>  	if (ret)
>  		return ret;
> =20
>  	if (h264_ctx->list_size[0] > 0) {
>  		for (i =3D 0; i < h264_ctx->list_size[0]; i++) {
>  			buf =3D &h264_ctx->ref_list0[i];
>  			ret =3D config_decode_canvas(hw, buf, h264_ctx->mb_width,
>  						   h264_ctx->mb_height);

[Severity: High]
Does this iterate over all reference entries and configure canvases without
checking if the entry is valid?

This ignores buf->valid and programs potentially stale or failed DMA addres=
ses
into the hardware.

[ ... ]
> @@ -2015,6 +2035,8 @@ void aml_h264_exit(void *priv)
> =20
>  	synchronize_irq(dec_hw->dec_irq);
>  	mutex_lock(&dec_hw->ctx_mutex);
>  	if (ctx->dos_clk_en &&
>  	    (!dec_hw->curr_ctx || dec_hw->curr_ctx =3D=3D h264_ctx))
>  		aml_stop_vdec_hw(dec_hw);

[Severity: High]
Can this shut down the hardware concurrently while another instance is being
initialized?

If m2mops_vdec_device_run() is currently executing dos_enable() for a new
instance, dec_hw->curr_ctx might still be NULL. This condition evaluates to
true, resulting in aml_stop_vdec_hw() running and resetting the hardware
clocks/registers out from under the other context.

[ ... ]
> @@ -2092,6 +2114,8 @@ int aml_h264_dec_run(void *priv)
>  		dev_err(&ctx->dev->plat_dev->dev, "dec inter fail\n");
>  	}
> =20
>  	h264_ctx->init_flag =3D 0;
>  	aml_vdec_set_curr_ctx(dec_hw, NULL);

[Severity: Critical]
Does this write to the freed context after returning from
wait_event_interruptible_timeout()?

If a concurrent STREAMOFF has already freed h264_ctx, setting init_flag here
results in a use-after-free.

> =20
>  	return ret;
[ ... ]
> @@ -2164,6 +2188,8 @@ int aml_h264_dec_run(void *priv)
>  		 * h264_release_decode_spec() concurrently.
>  		 */
>  		aml_stop_vdec_hw(dec_hw);
>  		synchronize_irq(dec_hw->dec_irq);

[Severity: High]
Does this call hardware reset operations concurrently without the ctx_mutex=
 and
before synchronizing the ISR?

If the threaded ISR is active, aml_stop_vdec_hw() will reset the hardware w=
hile
the ISR is actively programming its memory and registers, leading to bus
lockups.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-b4-s4-vdec=
-upstream-v11-0-25939f85ada5@amlogic.com?part=3D4
