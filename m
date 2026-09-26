Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256AE286425
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790429792; cv=none; b=oS8xgmtrL4/s8e1ie5V9iD3mU+OZOxpmcxUoixeHssLspaW+T+bp0xjsoN0HcZm0FckCs31o0C6uKyrG9EfPFm3aI0PwROQPgSvXv2Ob1emnGZsRYGyJusLqhmVQ8L1+C8GsuldxWvaM68RHZQQCeHWNJbBZ0xexQLsDQhF9v1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790429792; c=relaxed/simple;
	bh=vF4M/0BVIEaCjAlaL9rViN4weBr+CWLaurLOZaKRwVQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T9X+IyslYvRXdLrBgpNTItmFNSFAuyKdJRMBiBtm20tng+2nOEIGtcwN4teFJLUyXZmNSX9eqYfWtR2y3qZxiTCUZ0oK940Hq0hOJRVTJm/TJIJoAJsuv08A/pyJkGsBo8XGBi61dtDgIa4WqDkTxKS+W8jtgHExHBwkmeY3PEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ge1I+aKG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ge1I+aKG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBDB91F000FF;
	Sat, 26 Sep 2026 13:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790429791;
	bh=0SnqblCAJKF7MFupHPUALdHa6YRyPNGTlEBMtHUrkJ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ge1I+aKG/VIb9zKM+G2/7CIfGfdhQ0l1yiAQ+5POANsEC5nDKwatnHvfavDByOOOE
	 gzPvhneSdmh63QTK6LHS4oo+RsexqMWrAxfDY4xwI1u8krb6zgvKaRgNU6BBKOv7Bp
	 btObPwJA85vlINfL3ssOz47f3Zuy3kqBofoWQebvvqhdpS1Q6f06YkgGGwHWEDnObP
	 HpeObJbI0lL3mzB03cfNrKWBc40CWm9+ZDgogp1Nz3Q0TIWbqjB2lh6idtKQ/OhEB/
	 M3kYHxOaw2LCn6tNg5QxQtU0Wlc7fqr2wOtEFppNPQlQGjpZ8ctqXbqKtAPvcQdQJV
	 N/AEpUlHlrwfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/17] media: apple: add avd driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260926-avd-v2-6-ecebe6a3648e@icloud.com>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
 <20260926-avd-v2-6-ecebe6a3648e@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 13:36:30 +0000
Message-Id: <20260926133630.BBDB91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [Critical] media: apple: avd: buffer overflow in push() due to missing bo=
unds check
- [High] media: apple: avd: devm_kzalloc of video_device causes Use-After-F=
ree
- [High] media: apple: avd: non-synchronous cancel_delayed_work() causes UA=
F and deadlock
- [High] media: apple: avd: missing error check in avd_init_job() causes NU=
LL dereference
- [High] media: apple: avd: UAF of m2m_dev in threaded IRQ handler during u=
nbind
- [High] media: apple: avd: off-by-one in AVD_PIODMA_CMD_SIZE causes OOB DM=
A read
- [High] media: apple: avd: VIDIOC_TRY_FMT mutates internal context state c=
orrupting decodes
- [High] media: apple: avd: missing IS_ERR check on reset control causes pa=
nic
- [High] media: apple: avd: race between threaded IRQ and watchdog complete=
s wrong job
- [High] media: apple: avd: avd_stop_streaming reclaims active buffers lead=
ing to DMA UAF
- [High] media: apple: avd: missing size validation in avd_boot causes OOB =
write
- [High] media: apple: avd: device left detached from IOMMU domain after re=
set
- [Medium] media: apple: avd: unsafe hardware register access in IRQ handler
--

commit f9c8639c9bc75cad903911b0f8b6e86b0705207f
Author: Sofus Forstreuter <sofus.c@icloud.com>

media: apple: add avd driver

Add the AVD (Apple Video Decoder) driver with V4L2 M2M stateless
support based largely on rockchips implementation.

> diff --git a/drivers/media/platform/apple/avd/avd-drv.c b/drivers/media/p=
latform/apple/avd/avd-drv.c
> index 0000000000000..68752c44d4ec6 100644
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-drv.c
[ ... ]
> @@ -133,14 +133,16 @@ int avd_end_segment(struct avd_ctx *ctx, bool updat=
e_submit)
>  	struct avd_job *job =3D &ctx->job;
>  	struct avd_segment *seg =3D &job->segments[job->num];
> =20
>  	/* avd_segment includes piodma_cmd which is not transferred */
>  	seg->piodma_cmd =3D
>  		AVD_PIODMA_CMD_SIZE((sizeof(struct avd_segment) - 8) / 4);

[Severity: High]
Does this calculation result in an off-by-one error for the command size?
The macro AVD_PIODMA_CMD_SIZE appears to expect the transfer size in number
of words minus one. Passing the exact word count (512) could cause the
hardware to read one word past the end of the segment's instructions array,
leading to an out-of-bounds DMA read.

>  	seg->piodma_cmd |=3D AVD_PIODMA_CMD_DEST(job->dest);
>  	seg->piodma_cmd |=3D AVD_PIODMA_CMD_CONST;
[ ... ]
> @@ -148,15 +150,16 @@ int avd_init_job(struct avd_ctx *ctx, enum avd_code=
c codec, size_t segments)
>  {
>  	int ret =3D 0;
>  	struct avd_job *job =3D &ctx->job;
> =20
>  	job->codec =3D codec;
>  	job->dest =3D 0x1000;
>  	job->num =3D 0;
>  	job->num_submit =3D 0;
>  	job->num_alloc =3D segments;
>  	ret =3D avd_buf_alloc(ctx->dev, &job->buf,
>  			    job->num_alloc * sizeof(*job->segments));
>  	job->segments =3D job->buf.cpu;
>  	memset(job->buf.cpu, 0, job->buf.size);

[Severity: High]
Can job->buf.cpu be NULL here if the allocation failed?
The return value of avd_buf_alloc is assigned to ret, but it isn't checked
before the unconditional memset, which would lead to a NULL pointer derefer=
ence
under memory pressure.

>  	return ret;
>  }
[ ... ]
> @@ -195,30 +198,34 @@ static int avd_boot(struct avd_dev *avd)
>  {
>  	u32 val;
>  	int ret;
>  	char version[64];
> =20
>  	if (avd->variant->revision !=3D 3)
>  		dev_info_once(avd->dev, "booting hw version: %04x",
>  			      readl_relaxed(avd->ctrl));
> =20
>  	writel(avd->sram_start, avd->piodma + 0x24);
>  	dev_info_once(avd->dev, "piodma version: %04x base: %08x",
>  		      readl_relaxed(avd->piodma + 0xb4),
>  		      readl_relaxed(avd->piodma + 0x24));
> =20
>  	memcpy_toio(avd->code, avd->fw->data, avd->fw->size);

[Severity: High]
Is it possible for the firmware size to exceed the mapped IO memory region?
Since avd->fw->size is not validated against the resource size of avd->code,
an excessively large firmware image could cause an out-of-bounds MMIO write.

> =20
>  	writel_relaxed(AVD_MBOX_ENABLE, avd->mbox + AVD_REG_MBOX1_STATUS);
[ ... ]
> @@ -235,21 +242,23 @@ static void avd_shutdown(struct avd_dev *avd)
>  static int avd_reset(struct avd_dev *avd)
>  {
>  	int ret =3D 0;
> =20
>  	ret =3D pm_runtime_resume_and_get(avd->dev);
>  	if (ret < 0)
>  		return ret;
> =20
>  	ret =3D reset_control_reset(avd->rstc);
>  	if (ret)
>  		dev_err(avd->dev, "reset: failed: %d", ret);
> =20
>  	iommu_attach_device(avd->empty_domain, avd->dev);
>  	iommu_detach_device(avd->empty_domain, avd->dev);

[Severity: High]
Does this leave the device permanently detached from any functional IOMMU
translation context?
By detaching the empty domain without subsequently attaching the working
domain (avd->domain), it appears the device is left without an active domai=
n,
which could cause IOMMU faults on the next DMA operation.

> =20
>  	ret =3D avd_boot(avd);
[ ... ]
> @@ -288,27 +297,32 @@ static void avd_watchdog_func(struct work_struct *w=
ork)
>  static irqreturn_t avd_irq_handler(int irq, void *data)
>  {
>  	struct avd_dev *avd =3D data;
>  	struct avd_ctx *ctx =3D v4l2_m2m_get_curr_priv(avd->m2m_dev);
>  	enum vb2_buffer_state state;
>  	u32 status;
> =20
>  	status =3D readl(avd->mbox + AVD_REG_MBOX0_RETRIEVE);

[Severity: Medium]
Could this register read happen while the hardware is suspended?
According to the power management guidelines, an IRQ handler shouldn't acce=
ss
hardware registers without first using pm_runtime_get_if_active() to ensure
the device isn't in an RPM_SUSPENDED state, which could result in invalid d=
ata
(0xffffffff) or bus errors during a spurious interrupt.

>  	writel(AVD_MBOX0_NOT_EMPTY, avd->mbox + AVD_REG_MBOX_IRQ_CLR);
> =20
>  	if (status & 0x10000) { /* dbg */
>  		dev_warn(avd->dev, "no handler for IRQ: %3d",
>  			 status & ~0x10000);
>  		writel_relaxed(0, avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
>  		return IRQ_HANDLED;
>  	}
> =20
>  	if (!ctx)
>  		return IRQ_HANDLED;

[Severity: High]
Is it safe to retrieve the context via v4l2_m2m_get_curr_priv(avd->m2m_dev)
during teardown, or when a watchdog race occurs?

First, during module unbind (avd_remove), avd_v4l2_cleanup() is called which
frees the m2m_dev before the devres-managed IRQ handler is disabled. If an
interrupt fires in that window, wouldn't v4l2_m2m_get_curr_priv(avd->m2m_de=
v)
trigger a use-after-free on m2m_dev?

Second, if the watchdog completes a timed-out job and the M2M framework
dispatches a new job, a concurrent interrupt for the timed-out job could fe=
tch
the newly dispatched job's context here. Calling avd_job_finish(ctx, state)=
 on
this new context could prematurely complete it.

> =20
>  	if (status & 0x1000) {
[ ... ]
> @@ -428,21 +442,22 @@ static int avd_open(struct file *filp)
>  static int avd_release(struct file *filp)
>  {
>  	struct avd_ctx *ctx =3D file_to_ctx(filp);
> =20
>  	cancel_delayed_work(&ctx->watchdog_work);

[Severity: High]
Can a non-synchronous cancel_delayed_work() leave the watchdog executing
while the context is freed?
If the watchdog is executing on another CPU, cancel_delayed_work() returns
while the handler runs. The subsequent kfree(ctx) destroys the context, cau=
sing
a use-after-free in avd_watchdog_func(). Moreover, if the watchdog is block=
ed
from calling avd_job_finish(), v4l2_m2m_ctx_release() could block indefinit=
ely
resulting in a deadlock.

> =20
>  	v4l2_fh_del(&ctx->fh, filp);
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
>  	v4l2_fh_exit(&ctx->fh);
>  	avd_buf_free(ctx->dev, &ctx->inst);
>  	avd_buf_free(ctx->dev, &ctx->pipe_state);
>  	avd_buf_free(ctx->dev, &ctx->job.buf);
>  	kfree(ctx);
> =20
>  	return 0;
>  }
[ ... ]
> @@ -507,21 +522,23 @@ static int avd_probe(struct platform_device *pdev)
>  	struct avd_dev *avd;
>  	int ret, irq;
> =20
>  	avd =3D devm_kzalloc(&pdev->dev, sizeof(*avd), GFP_KERNEL);

[Severity: High]
Does allocating the avd structure with devm_kzalloc() create a use-after-fr=
ee
risk when tied to the V4L2 device lifecycle?
The avd structure contains the video_device (avd->vdev). Because it's manag=
ed
by devres, it gets freed when avd_remove() completes. If a user keeps a file
descriptor open, V4L2 core will access the freed video_device memory upon
subsequent ioctls or closure.

>  	if (!avd)
>  		return -ENOMEM;
> =20
>  	platform_set_drvdata(pdev, avd);
>  	avd->dev =3D &pdev->dev;
>  	avd->pdev =3D pdev;
> =20
>  	mutex_init(&avd->vdev_lock);
> =20
>  	avd->variant =3D of_device_get_match_data(&pdev->dev);
> =20
>  	avd->rstc =3D devm_reset_control_get_exclusive(avd->dev, NULL);

[Severity: High]
Could avd->rstc be an ERR_PTR if devm_reset_control_get_exclusive() fails?
Without an IS_ERR check, a failure like -EPROBE_DEFER or -ENOMEM would store
an ERR_PTR here, which would later cause a kernel panic when dereferenced by
reset_control_reset(avd->rstc) in avd_reset().

> =20
>  	avd->piodma =3D devm_platform_ioremap_resource_byname(pdev, "piodma");
[ ... ]
> @@ -541,20 +558,21 @@ static int avd_probe(struct platform_device *pdev)
>  	irq =3D platform_get_irq_byname(pdev, "mbox0");
>  	if (irq < 0)
>  		return irq;
>  	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL, avd_irq_handle=
r,
>  					IRQF_ONESHOT, dev_name(&pdev->dev),
>  					avd);

[Severity: High]
Does using devm_request_threaded_irq() keep the interrupt alive too long
during teardown?
Because devres cleans this up after avd_remove() finishes, an interrupt can
fire after avd_v4l2_cleanup() has manually freed m2m_dev, leading to the
aforementioned use-after-free in avd_irq_handler().

>  	if (ret) {
>  		dev_err(avd->dev, "Could not request IRQ 0");
>  		return ret;
>  	}
[ ... ]
> @@ -587,14 +605,15 @@ static int avd_probe(struct platform_device *pdev)
>  static void avd_remove(struct platform_device *pdev)
>  {
>  	struct avd_dev *avd =3D platform_get_drvdata(pdev);
> =20
>  	avd_v4l2_cleanup(avd);

[Severity: High]
Could this manual cleanup lead to a use-after-free due to the devm_kzalloc(=
) of
avd?
Once avd_v4l2_cleanup() and avd_remove() complete, devres reclaims the avd
memory. This leaves V4L2 with a dangling pointer to the video_device if file
descriptors are still open.

> =20
>  	iommu_domain_free(avd->empty_domain);

> diff --git a/drivers/media/platform/apple/avd/avd-inst.h b/drivers/media/=
platform/apple/avd/avd-inst.h
> index 0000000000000..d44d1f7f66c20 100644
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-inst.h
[ ... ]
> @@ -134,14 +134,15 @@ static inline void push(struct avd_ctx *ctx, u32 in=
st)
>  {
>  	struct avd_job *job =3D &ctx->job;
>  	struct avd_segment *seg =3D &job->segments[job->num];
> =20
>  	seg->instructions[seg->num++] =3D inst;

[Severity: Critical]
Is seg->num bounded against overflowing the instructions array?
Without checking if seg->num exceeds AVD_MAX_INST (512), a complex bitstream
from userspace could cause an out-of-bounds write. This could overwrite mem=
ory
like the piodma_cmd of the next segment, potentially injecting arbitrary DMA
commands.

>  }
> =20

> diff --git a/drivers/media/platform/apple/avd/avd-v4l2.c b/drivers/media/=
platform/apple/avd/avd-v4l2.c
> index 0000000000000..88079da5ee276 100644
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-v4l2.c
[ ... ]
> @@ -121,21 +121,23 @@ static void avd_fill_decoded_pixfmt(struct avd_ctx =
*ctx,
>  				    struct v4l2_pix_format_mplane *pix_mp)
>  {
>  	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, pix_mp->width,
>  			    pix_mp->height);
> =20
>  	if (is_interchange(pix_mp->pixelformat))
>  		pix_mp->plane_fmt[0].sizeimage =3D 0;
>  	ctx->comp.start_offset =3D pix_mp->plane_fmt[0].sizeimage;
> =20
>  	fill_comp(&ctx->comp, ctx->image_fmt, pix_mp->width, pix_mp->height);

[Severity: High]
Does this mutate the driver context state during VIDIOC_TRY_FMT?
The V4L2 specification explicitly prohibits VIDIOC_TRY_FMT from modifying
internal state. Since avd_try_capture_fmt calls this helper, untrusted
userspace could probe formats during active streaming and silently corrupt
the global ctx->comp state used by avd_run_preamble() for active decodes.

>  	pix_mp->plane_fmt[0].sizeimage +=3D ctx->comp.size;
[ ... ]
> @@ -321,18 +323,20 @@ static int avd_v4l2_init(struct avd_dev *avd)
>  	avd->mdev.dev =3D avd->dev;
>  	strscpy(avd->mdev.model, "avd", sizeof(avd->mdev.model));
>  	strscpy(avd->mdev.bus_info, "platform:avd", sizeof(avd->mdev.bus_info));
>  	media_device_init(&avd->mdev);
>  	avd->mdev.ops =3D &avd_media_ops;
>  	avd->v4l2_dev.mdev =3D &avd->mdev;
> =20
>  	avd->vdev.lock =3D &avd->vdev_lock;
>  	avd->vdev.v4l2_dev =3D &avd->v4l2_dev;
>  	avd->vdev.fops =3D &avd_fops;
>  	avd->vdev.release =3D video_device_release_empty;

[Severity: High]
Does setting release to video_device_release_empty bypass standard V4L2 cle=
anup?
Opting out of the standard V4L2 release tracking prevents the core from saf=
ely
deferring cleanup until the last file descriptor is closed, leading to the
use-after-free since the video_device is part of the devm_kzalloc'd avd str=
uct.

>  	avd->vdev.vfl_dir =3D VFL_DIR_M2M;
[ ... ]
> @@ -495,27 +499,32 @@ static void avd_queue_cleanup(struct vb2_queue *vq,=
 u32 state)
>  static void avd_stop_streaming(struct vb2_queue *q)
>  {
>  	struct avd_ctx *ctx =3D vb2_get_drv_priv(q);
> =20
>  	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
>  		const struct avd_coded_fmt_desc *desc =3D ctx->coded_fmt_desc;
> =20
>  		if (WARN_ON(!desc))
>  			return;
> =20
>  		if (desc->ops->stop)
>  			desc->ops->stop(ctx);
>  	}
> =20
>  	avd_queue_cleanup(q, VB2_BUF_STATE_ERROR);

[Severity: High]
Is it safe to unconditionally reclaim all buffers while hardware decoding c=
ould
be active?
When VIDIOC_STREAMOFF invokes avd_stop_streaming(), avd_queue_cleanup() is
called without synchronizing against the actively running hardware job.
This causes the queues to be abruptly emptied, returning the buffers to vb2.
The hardware could continue its DMA into these reclaimed buffers.

>  }
> =20
>  const struct vb2_ops avd_queue_ops =3D {
>  	.queue_setup =3D avd_queue_setup,
>  	.buf_prepare =3D avd_buf_prepare,
>  	.buf_queue =3D avd_buf_queue,
>  	.buf_out_validate =3D avd_buf_out_validate,
>  	.buf_request_complete =3D avd_buf_request_complete,
>  	.start_streaming =3D avd_start_streaming,
>  	.stop_streaming =3D avd_stop_streaming,
>  };
> =20
>  void avd_job_finish_no_pm(struct avd_ctx *ctx, enum vb2_buffer_state res=
ult)
>  {
>  	if (ctx->coded_fmt_desc->ops->done) {
>  		struct vb2_v4l2_buffer *src_buf, *dst_buf;
> =20
>  		src_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);

[Severity: High]
Could v4l2_m2m_next_src_buf() return NULL here if avd_stop_streaming() empt=
ied
the queue?
If a stream is closed while the hardware is still active, the queues are
cleared by avd_queue_cleanup(). When the hardware job eventually finishes,
this attempt to retrieve the source buffer will yield NULL, which will then
be passed to desc->ops->done(), causing a NULL pointer dereference.

>  		dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>  		ctx->coded_fmt_desc->ops->done(ctx, src_buf, dst_buf, result);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-avd-v2-0-e=
cebe6a3648e@icloud.com?part=3D6
