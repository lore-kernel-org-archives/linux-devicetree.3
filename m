Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FDC3EA957
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706477; cv=none; b=Z+iedH0WzGm/YmTObzWUmleaib0pWD3jdNmA9nFp1pvOQYOFb8nbErDoxhGrL84I9rBfHNemTphhEYHxLlnOF7CxQgv3s2i3G40gw0/VAO/UQjPS80jTNWNBYOTW05QM5XSyGfU4OkUBfT5kAGIHUZMHTf6eTA8+sFzYFyAUGFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706477; c=relaxed/simple;
	bh=Fb+Ak8BGvHxlnwN1Cl13BmIFmJNocLxweTjR+jtb21k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F8vIyzyiPnbEq5uJAZhQoUE8nLkgkRXZMOH2KAJ6bRNjK/GyPKVNI3jZX8gffptutR6TJ1NlQncX7SUr/a9LGP7dkqvg5Jk1cW5v0j3DOv8w/SOD+uBBGW562i6IVJf0VZlur3y3HoE940hK/ycBQwEJgQaR9zfRHpexdD4/JgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=erfItLcV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="erfItLcV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35251F000E9;
	Wed, 22 Jul 2026 07:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784706475;
	bh=QG5SSUQ8QlntCtMKDPEv6aswJ4vnLexaENOMYRZWecM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=erfItLcVr/q91nQRuU7l1Z5waS6q4uR7UFtbesdtsyLd19Nv2ogebJ7P7p1sEYahw
	 CrZc54CwBPWGx8niUO5/0pBihjC9DuPA1CWgSMALe2RNYUJEnnqUfCqMcDBT7P7WzX
	 nuKe/8BMwThuV/ltIj5PDDvEnLwOAjMGZkYsauxm4w1b/cw0P4Msiou0cRdXBdOk0B
	 ytyPZCoELxGHMIa37mp4AAtKOicJbfSDZBzTmt+sK+LtRnuLqnFWOIqh1MqMl5CU6z
	 Yk5ZW3UXLDKv4OpHyJGv/7D4YLgZ3TWVYskoC92fR29hvCEAkPT41MC+cnLPJQArqM
	 l6QgzzX/x2lLQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/3] media: rockchip: add VEPU510 H.264 encoder
 driver for RK3576
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260722073417.2064667-3-gahing@gahingwoo.com>
References: <20260722073417.2064667-1-gahing@gahingwoo.com>
 <20260722073417.2064667-3-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 07:47:54 +0000
Message-Id: <20260722074754.D35251F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [High] DMA Use-After-Free during `VIDIOC_STREAMOFF`
- [High] V4L2 Object Lifetime / Use-After-Free on Unbind
- [High] Reference Buffer Corruption from `frame_num` Wrap
- [High] Lifecycle and Resource Leak in `remove`
- [High] State Desync / Bitstream Corruption from Cached SPS/PPS
- [High] Compilation Failure from Non-existent Macro
- [High] NULL Pointer Dereference and DMA Cache Coherency
- [High] Race Condition / TOCTOU across Watchdog and IRQ
- [Medium] Resource Leak in `probe` Error Path
- [Medium] `clk_bulk_enable` without prepare
- [Low] PM Subsystem Violation without pm_ptr wrapper
- [Low] Logic Flaw in NV12 Size Calculation
- [Low] C bitfields for MMIO registers
--

--- Patch [2]: [RFC PATCH 2/3] media: rockchip: add VEPU510 H.264 encoder d=
river for RK3576 ---
commit a8783bc02129bde5b3f6c151d6c2930f8cb47a0a
Author: Jiaxing Hu <gahing@gahingwoo.com>
Date:   Wed Jul 22 07:34:16 2026 +0000

    media: rockchip: add VEPU510 H.264 encoder driver for RK3576
   =20
    Add a from-scratch stateful V4L2 mem2mem driver for the Rockchip RK3576
    VEPU510 H.264 hardware video encoder (raw NV12 in, H.264 Annex-B out),
    modelled on the verisilicon/hantro device_run()/codec_ops split rather
    than the downstream MPP-service/task-queue model.

> diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc-regs.h b/drive=
rs/media/platform/rockchip/rkvenc/rkvenc-regs.h
> new file mode 100644
> index 0000000000000..353ba3ebafada
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvenc/rkvenc-regs.h
[ ... ]
> +union rkvenc_reg_enc_pic {
> +	struct {
> +		u32 enc_stnd:2;			/* 0 =3D H.264 */
> +		u32 cur_frm_ref:1;

[Severity: Low]
Can using C bitfields for MMIO registers cause endianness issues? On
big-endian systems, the compiler packs bitfields MSB-to-LSB, which could
assign configuration bits to the wrong offsets. Explicit bitwise shifts and
masks are generally preferred for hardware register layouts.

> diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c b/drive=
rs/media/platform/rockchip/rkvenc/rkvenc-h264.c
> new file mode 100644
> index 0000000000000..58b4fb65b4991
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c
[ ... ]
> +static void rkvenc_h264_stop(struct rkvenc_ctx *ctx)
> +{
> +	struct rkvenc_dev *dev =3D ctx->dev;
> +	struct rkvenc_h264_ctx *h264 =3D &ctx->h264;
> +	size_t total_size =3D h264->pixel_buf_size + h264->thumb_buf_size +
> +			     h264->smear_buf_size;
> +	int i;
> +
> +	for (i =3D 0; i < 2; i++) {
> +		if (h264->recn_buf_cpu[i])
> +			dma_free_coherent(dev->dev, total_size,
> +					  h264->recn_buf_cpu[i], h264->recn_buf_dma[i]);

[Severity: High]
If userspace invokes VIDIOC_STREAMOFF while an active encoding job is runni=
ng,
does the stop callback free the recn_buf and meiw_buf DMA memory before the
hardware is stopped?

Since the driver makes no attempt to wait for the hardware to idle, could it
continue executing and perform DMA writes into the now-freed memory and
unmapped V4L2 buffers?

[ ... ]
> +static void rkvenc_h264_run(struct rkvenc_ctx *ctx)
> +{
[ ... ]
> +	unsigned int write_idx =3D h264->frame_num & 1;
> +	/* Frame 0 has no previously-written reference at all -- alias read to
> +	 * write (real hardware's refr_idx =3D=3D curr_idx for frame 0, see the
> +	 * rkvenc_h264_ctx comment in rkvenc.h). From frame 1 on, buf[write_idx
> +	 * ^ 1] genuinely holds the previous frame's real reconstruction.
> +	 */
> +	unsigned int read_idx =3D h264->frame_num =3D=3D 0 ? write_idx : (write=
_idx ^ 1);

[Severity: High]
When h264->frame_num wraps around 255 back to 0 in rkvenc_h264_done(), does
the aliasing logic here incorrectly assume it is an IDR frame?

Since frame 256 is typically a P-frame, would this cause it to read its
reference from the same buffer it is actively writing its reconstruction to,
potentially corrupting the encode and stalling the hardware? Should this
logic use the is_idr flag instead?

[ ... ]
> +	if (header_len)
> +		memcpy(vb2_plane_vaddr(&dst_buf->vb2_buf, 0), h264->sps_pps_nal, heade=
r_len);

[Severity: High]
Is it possible for vb2_plane_vaddr() to return NULL here? If the destination
buffer is a DMABUF, V4L2 does not automatically vmap DMABUFs unless
requested, which could lead to a NULL pointer dereference in memcpy().

Also, does this CPU write require a dma_sync_single_for_device() call
afterwards to flush the CPU cache before the hardware DMA writes the
subsequent slice NAL unit?

[ ... ]
> +	synt_pps.pic_init_qp =3D h264->i_qp->val;

[Severity: High]
If userspace dynamically changes the V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP
control during streaming, could the hardware slice QP desync from the
statically cached SPS/PPS NAL?

Since rkvenc_h264_gen_sps_pps() is only called once during start_streaming,
the hardware receives the dynamically updated QP but the bitstream still ge=
ts
the stale cached PPS. Could this break decoder image reconstruction?

> diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc.c b/drivers/me=
dia/platform/rockchip/rkvenc/rkvenc.c
> new file mode 100644
> index 0000000000000..d70bcc5fb96d4
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvenc/rkvenc.c
[ ... ]
> +static u32 rkvenc_nv12_sizeimage(unsigned int width, unsigned int height)
> +{
> +	return width * height + 2 * ALIGN(width, 2) / 2 * ALIGN(height, 2) / 2 =
* 2;
> +}

[Severity: Low]
Does the chroma size calculation evaluate to width * height due to C operat=
or
precedence? The expression has 2 * ALIGN(...) / 2 * ALIGN(...) / 2 * 2. It
appears this computes 2 * W * H instead of the expected 1.5 * W * H for NV1=
2,
which could result in allocating oversized buffers.

[ ... ]
> +static void rkvenc_device_run(void *priv)
> +{
> +	struct rkvenc_ctx *ctx =3D priv;
> +	struct rkvenc_dev *dev =3D ctx->dev;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev->dev);
> +	if (ret < 0) {
> +		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev, ctx->fh.m2m_ctx,
> +						  VB2_BUF_STATE_ERROR);
> +		return;
> +	}
> +
> +	ret =3D clk_bulk_enable(dev->num_clocks, dev->clocks);

[Severity: Medium]
If the kernel is built with CONFIG_PM disabled, pm_runtime_resume_and_get()
does nothing. Could calling clk_bulk_enable() here on an unprepared clock
violate the clock API and trigger a warning?

[ ... ]
> +static irqreturn_t rkvenc_irq_thread(int irq, void *priv)
> +{
> +	struct rkvenc_dev *dev =3D priv;
> +	struct rkvenc_ctx *ctx =3D dev->cur_ctx;
> +	enum vb2_buffer_state state;
> +
> +	if (!ctx)
> +		return IRQ_HANDLED;
> +
> +	if (!cancel_delayed_work(&dev->watchdog_work))
> +		return IRQ_HANDLED;

[Severity: High]
Can a TOCTOU race occur here if a hardware watchdog timeout coincides with
the scheduling of the next job?

If a watchdog fires, it completes the hung job via rkvenc_job_finish(). The
M2M core then pulls the next job, updating dev->cur_ctx and re-arming the
watchdog.

If the hard IRQ from the hung job then schedules rkvenc_irq_thread(), could
it read the new context locklessly, cancel the new job's watchdog, and
erroneously abort the new job while the hardware is actively processing it?

[ ... ]
> +static int rkvenc_open(struct file *file)
> +{
> +	struct rkvenc_dev *dev =3D video_drvdata(file);
> +	struct rkvenc_ctx *ctx;
> +	int ret;
> +
> +	ctx =3D kzalloc_obj(*ctx);

[Severity: High]
Does the kzalloc_obj() macro exist in the kernel tree? Would this cause a
build failure? Should this be kzalloc(sizeof(*ctx), GFP_KERNEL) instead?

[ ... ]
> +static int rkvenc_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	rkvenc->vfd =3D (struct video_device){
> +		.fops		=3D &rkvenc_fops,
> +		.ioctl_ops	=3D &rkvenc_ioctl_ops,
> +		.minor		=3D -1,
> +		.release	=3D video_device_release_empty,

[Severity: High]
If the driver is unbound via sysfs while userspace still holds a file
descriptor open, does devres free the rkvenc_dev structure (which embeds
the video_device) when rkvenc_remove() returns?

Since video_unregister_device() does not forcefully close existing open file
descriptors, would rkvenc_release() later dereference the freed dev and
m2m_ctx when the file descriptor is finally closed?

[ ... ]
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to power up for initial reset\n=
");

[Severity: Medium]
If pm_runtime_resume_and_get() fails during probe, does this early return
bypass the err_release_m2m and err_unreg_v4l2 cleanup labels? Could this le=
ak
the allocated v4l2_dev and m2m_dev structures?

[ ... ]
> +static void rkvenc_remove(struct platform_device *pdev)
> +{
> +	struct rkvenc_dev *rkvenc =3D platform_get_drvdata(pdev);
> +
> +	cancel_delayed_work_sync(&rkvenc->watchdog_work);
> +	video_unregister_device(&rkvenc->vfd);
> +	v4l2_m2m_release(rkvenc->m2m_dev);

[Severity: High]
Does rkvenc_remove() tear down the M2M device and cancel the watchdog witho=
ut
stopping active hardware encodes or waiting for them to finish?

Because the IRQ handler remains active until after remove() returns, could a
completing hardware job fire an interrupt and access the destroyed m2m_dev
via v4l2_m2m_buf_done_and_job_finish(), causing memory corruption?

[ ... ]
> +static struct platform_driver rkvenc_driver =3D {
> +	.probe =3D rkvenc_probe,
> +	.remove =3D rkvenc_remove,
> +	.driver =3D {
> +		.name =3D "rkvenc",
> +		.of_match_table =3D rkvenc_of_match,
> +		.pm =3D &rkvenc_pm_ops,

[Severity: Low]
Should this assignment use the pm_ptr() wrapper? Without it, building the
kernel with CONFIG_PM disabled could leave the static rkvenc_pm_ops structu=
re
and its callbacks linked as dead code, potentially triggering compiler
warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722073417.2064=
667-1-gahing@gahingwoo.com?part=3D2
