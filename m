Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CACA44C509
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389502; cv=none; b=UsX0lmpSrhRbh0ZgkMFnNqDe7PZWsFvr4dc93NSppKXbvxUb3/Nx3eN7lIGMimZupo4NaKVd6LuQaVK/b8XQCL5t9A1zBgPy7d6KyXujs2HoNsrSuGhIDKXi2SeK8ZLbBmMrH8+LlGmABha0z6eRLCgXnZ0BQCyZfC00NUPiyUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389502; c=relaxed/simple;
	bh=8svJyl4LQa//tl5sEfnqjH5bLrQ18mU1I4+vciNnwIU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JNjtkLvOs6qfrheFiIfWRosb19+QPAajMC6L+B7IDBpJDrec7bH7K1HpU5J9c6Aa3qU3Rr3StB+AyDb720DzukNfDKFj2mZkyEaxkKBfbETVFBKw7IdKbzd9mUG0tsr3ZpA7OAJFy0Fu/kkjWa1o5DhnM4u6vDZuOh8J2yg0IxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOT0LHeU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOT0LHeU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78141F000FF;
	Mon, 14 Sep 2026 12:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789389501;
	bh=ZgWYb59Qi/Ir+N0WqamHSx46nxjnu/wJ8PB8dHDSDwM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AOT0LHeUClxl2oODCyOGJpw6Hwu0d4Wg9q6pYOj4Ka6hjy/fxqX+jyd139+MOiJJe
	 K8XexyWdviJmpVMSYnNXulRoCPHwzdNzTeptCx458hwAr4D6Dwa3JVDcPVF4pWOs36
	 ZUVDkOU4QQAcnEB9LJJ8pMIjvgjCkqSeN7LK7OfATSkCBi+m5vpG2rVAs0VGFghutP
	 isx20X2w+pHTOcNkPYIl+I5s+Bn0p/kytdcVMbC/nl0u1lno9pz4pU9Te+XiKgH8FN
	 XeKxvC3+lHJHv9Yi1hbVlKRXEaBNLwVuLudrr2d88k8369cHCBLSTiOFP/ZC9pKK8X
	 NZePpOJU+aGvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] media: rockchip: Add JPEG decoder driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260914-rockchip-jpegdec-v3-2-3583c376d0d2@pengutronix.de>
References: <20260914-rockchip-jpegdec-v3-0-3583c376d0d2@pengutronix.de>
 <20260914-rockchip-jpegdec-v3-2-3583c376d0d2@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 12:38:20 +0000
Message-Id: <20260914123820.A78141F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [Critical] VIDIOC_REQBUFS with count=3D0 bypasses job cancellation, causi=
ng DMA use-after-free and a permanent deadlock.
- [High] File descriptor closure after device unbind causes Use-After-Free =
of `m2m_dev` and `jpegd`.
- [High] Hardware interrupt can fire after `m2m_dev` is freed during `rkjpe=
gd_remove`, causing a Use-After-Free.
- [High] Watchdog delayed work can be re-armed after cancellation in `rkjpe=
gd_remove`, causing a Use-After-Free.
- [High] NULL pointer dereference in the IRQ handler if a spurious or pendi=
ng interrupt fires during probe.
- [High] The interrupt handler reads hardware registers without checking if=
 the device is active via pm_runtime, leading to crashes on spurious interr=
upts.
- [High] Runtime PM usage counter and genpd reference are leaked if the dev=
ice is removed while a job is running.
- [High] Missing CPU cache flush after writing to the chroma plane of a DMA=
 buffer.
- [Medium] TOCTOU data race on `ctx->source_change` causes spurious `-EINVA=
L` buffer rejections.
--

commit 9f20ee21619c78c1798cf24abb6642d0ab18573c
Author: Sascha Hauer <s.hauer@pengutronix.de>
Subject: media: rockchip: Add JPEG decoder driver

This commit adds a V4L2 M2M driver for the Rockchip VDPU720 JPEG hardware d=
ecoder. It handles JPEG input to NV12 output, utilizing a DMA side buffer f=
or hardware tables and providing error recovery.

> diff --git a/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c b/drivers/=
media/platform/rockchip/rkjpegd/rkjpegd.c
> index 0000000000000..f154759025dd9 100644
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c
[ ... ]
> @@ -634,6 +634,8 @@ static void rkjpegd_job_finish_no_pm(struct rkjpegd_c=
tx *ctx,
> =20
>  	src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>  	dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>  	if (WARN_ON(!src) || WARN_ON(!dst))
>  		return;
> =20

[Severity: Critical]
If an active job is orphaned because VIDIOC_REQBUFS was called with count=
=3D0,
the empty queues will trigger this WARN_ON and the function returns early
without calling v4l2_m2m_job_finish(). Does this leave the M2M context
permanently deadlocked in the TRANS_RUNNING state?

> @@ -653,6 +653,8 @@ static void rkjpegd_irq_done(struct rkjpegd_dev *jpeg=
d,
>  			     enum vb2_buffer_state state)
>  {
>  	struct rkjpegd_ctx *ctx =3D v4l2_m2m_get_curr_priv(jpegd->m2m_dev);
> =20
>  	if (!ctx)
>  		return;

[Severity: High]
This dereferences jpegd->m2m_dev. If a spurious interrupt fires during probe
before rkjpegd_v4l2_init() initializes it, or if an active job finishes and
fires an interrupt during rkjpegd_remove() after rkjpegd_v4l2_cleanup() has
freed it, could this result in a NULL pointer dereference or use-after-free?

[ ... ]
> @@ -1220,6 +1220,8 @@ static int vdpu720_fill_chroma(struct rkjpegd_ctx *=
ctx,
>  		return -EINVAL;
>  	}
> =20
>  	memset(dst_cpu + y_size, 0x80, size - y_size);
> =20
>  	return 0;

[Severity: High]
This uses a CPU memset to write to the chroma plane of the destination buff=
er.
If the capture buffer is an imported DMABUF that is mapped cacheable, will
these writes remain in the CPU cache and cause downstream hardware to read
stale data unless an explicit DMA cache clean operation is performed?

[ ... ]
> @@ -1332,6 +1332,8 @@ static int rkjpegd_release(struct file *filp)
>  	struct rkjpegd_ctx *ctx =3D file_to_rkjpegd_ctx(filp);
> =20
>  	v4l2_fh_del(&ctx->fh, filp);
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  	rkjpegd_vdpu720_exit(ctx);

[Severity: High]
When an application keeps the file descriptor open while the device is unbo=
und
via sysfs, this function will execute later when the fd is finally closed.
Since rkjpegd_remove() has already freed m2m_dev and the devres framework h=
as
freed the jpegd structure, won't accessing ctx->fh.m2m_ctx and ctx->dev here
trigger a use-after-free crash?

[ ... ]
> @@ -1402,6 +1402,8 @@ static void rkjpegd_v4l2_cleanup(struct rkjpegd_dev=
 *jpegd)
>  	media_device_unregister(&jpegd->mdev);
>  	v4l2_m2m_unregister_media_controller(jpegd->m2m_dev);
>  	video_unregister_device(&jpegd->vdev);
>  	media_device_cleanup(&jpegd->mdev);
>  	v4l2_m2m_release(jpegd->m2m_dev);
>  	v4l2_device_unregister(&jpegd->v4l2_dev);
>  }

[Severity: High]
Should the driver rely on refcounting the v4l2_device (e.g., through a rele=
ase
callback) instead of unconditionally freeing m2m_dev here, ensuring the
resources stay alive if file descriptors are still held open by userspace?

[ ... ]
> @@ -1457,6 +1457,8 @@ static irqreturn_t rkjpegd_vdpu720_irq(int irq, voi=
d *dev_id)
>  	enum vb2_buffer_state state;
>  	u32 status, clr_mask;
> =20
>  	status =3D rkjpegd_read(jpegd, VDPU720_REG_INT);
> =20

[Severity: High]
This reads the VDPU720_REG_INT register unconditionally upon entry. If a
spurious interrupt or an irqpoll event occurs while the device is in a
runtime-suspended state (with clocks and power domains gated off), will this
read trigger a synchronous external abort on ARM? Should it use
pm_runtime_get_if_active() to verify the power state first?

[ ... ]
> @@ -1549,6 +1549,8 @@ static void rkjpegd_source_change(struct rkjpegd_ct=
x *ctx,
> =20
>  	dev_dbg(ctx->dev->dev, "source change to %ux%u\n", width, height);
> =20
>  	v4l2_event_queue_fh(&ctx->fh, &rkjpegd_src_change_event);
>  	ctx->source_change =3D true;
>  	ctx->initial_source_change =3D false;

[Severity: Medium]
ctx->source_change is updated locklessly here after dropping fmt_lock.
Could a concurrent VIDIOC_QBUF operation in rkjpegd_buf_prepare() observe
this flag out of order, leading to a race condition?

[ ... ]
> @@ -1602,6 +1602,8 @@ static void rkjpegd_device_run(void *priv)
>  		return;
>  	}
> =20
>  	ret =3D pm_runtime_resume_and_get(jpegd->dev);
>  	if (ret < 0)
>  		goto err_finish;

[Severity: High]
This acquires a runtime PM reference for the duration of the job. If the
device is unbound and rkjpegd_remove() is called while this job is still in
flight, is there a mechanism that correctly waits for the job and drops this
reference, or does it permanently leak the usage counter and genpd referenc=
e?

[ ... ]
> @@ -1615,6 +1615,8 @@ static void rkjpegd_stop_streaming(struct vb2_queue=
 *vq)
>  		if (!vbuf)
>  			break;
>  		if (V4L2_TYPE_IS_CAPTURE(vq->type))
>  			vb2_set_plane_payload(&vbuf->vb2_buf, 0, 0);
>  		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
>  	}

[Severity: Critical]
If an application calls VIDIOC_REQBUFS with count=3D0 while a decode job is
actively running, this loop removes all buffers and returns them with
VB2_BUF_STATE_ERROR. Since v4l2_m2m_ioctl_reqbufs() does not wait for the
hardware to finish, does this allow the hardware to write decoded video data
via DMA into memory pages that have already been freed back to the system?

[ ... ]
> @@ -1790,6 +1790,8 @@ static int rkjpegd_buf_prepare(struct vb2_buffer *v=
b)
> =20
>  	if (ctx->source_change && vb2_is_streaming(vq))
>  		return 0;
> =20
>  	mutex_lock(&ctx->fmt_lock);
>  	sizeimage =3D ctx->dst_fmt.plane_fmt[0].sizeimage;
>  	mutex_unlock(&ctx->fmt_lock);
> =20
>  	if (vb2_plane_size(vb, 0) < sizeimage)
>  		return -EINVAL;

[Severity: Medium]
Because ctx->source_change is read locklessly above, if a concurrent thread=
 sees
it as false, grabs fmt_lock, and reads the newly updated larger sizeimage, =
will
it incorrectly reject a valid queued buffer with -EINVAL?

[ ... ]
> @@ -2243,6 +2243,8 @@ static int rkjpegd_probe(struct platform_device *pd=
ev)
>  	if (jpegd->irq < 0)
>  		return jpegd->irq;
> =20
>  	ret =3D devm_request_irq(&pdev->dev, jpegd->irq, rkjpegd_vdpu720_irq, 0,
>  			       dev_name(&pdev->dev), jpegd);
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret, "failed to request irq\n");

[Severity: High]
The IRQ is requested and unmasked here before rkjpegd_v4l2_init() initializ=
es
jpegd->m2m_dev. If a pending or spurious interrupt fires immediately, could=
 it
cause a NULL pointer dereference in rkjpegd_irq_done() when it accesses the
uninitialized m2m_dev?

[ ... ]
> @@ -2275,6 +2275,8 @@ static void rkjpegd_remove(struct platform_device *=
pdev)
>  	struct rkjpegd_dev *jpegd =3D platform_get_drvdata(pdev);
> =20
>  	cancel_delayed_work_sync(&jpegd->watchdog_work);
>  	rkjpegd_v4l2_cleanup(jpegd);

[Severity: High]
The watchdog delayed work is canceled here, but rkjpegd_v4l2_cleanup() is c=
alled
before active jobs are flushed. Since V4L2 M2M ioctls and background jobs c=
an
still be running, could a concurrent job dispatch re-arm the watchdog, caus=
ing a
use-after-free when devres frees the structure?

[Severity: High]
Furthermore, rkjpegd_v4l2_cleanup() frees m2m_dev before reset_control_asse=
rt()
is called and the IRQ is disabled. If an active hardware job completes in t=
his
window, will the interrupt handler dereference the m2m_dev that was just fr=
eed?

>  	reset_control_assert(jpegd->resets);
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }

[Severity: High]
This unconditionally disables runtime PM without waiting for active jobs to=
 finish
or dropping their PM references. Does this permanently leak the genpd and r=
untime
PM usage counters if the device is removed while a decode is in flight?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-rockchip-j=
pegdec-v3-0-3583c376d0d2@pengutronix.de?part=3D2
