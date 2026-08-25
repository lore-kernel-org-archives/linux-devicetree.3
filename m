Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D127303A35
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 14:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666623; cv=none; b=P4/3IQ7SHAMNgXJpT+6pF0iP5CBYq43gHnDm6/OSy9+ObhPgcw8jIc2YcXnTqu+M7xdn4u+wIYaxis3e7knu9BNMRxesPA0MDaOPYxEEoCBjmRDvP9dUdWB2Ey30U13TJHFkSgql6fNr4Hogqjsb/ska7UGEWI9DAxsS3fdZm6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666623; c=relaxed/simple;
	bh=R2bDNVR7GSydkmNElMUAg05BAE2OiMKvE7+ag5ucuNk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lpIX7w4+cufqoVkKiKn2wsUwUvpkxOYZ+EfggXTv9fKe2PNqX4lPg6ePwUaikG6ZrAkKSqUZKiWslRmMKCnJ2bJs6RiNE5YjsrY0bra5GyylYJF3wx2fet18s+K2ArxjPyXUrHRIHGqisyR3pmJqi1yVofqHLXaIHA7MKQc5ugM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jssQVDTs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jssQVDTs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169861F00A3A;
	Tue, 25 Aug 2026 14:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787666622;
	bh=5TWQYw3KgHCSdWpARpmH/nuJyK0lhWfkjseNBRArYyY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jssQVDTs2yeiMaS/JDiWRSL+VXjBhO0a1gJqBsKdcWtOY3EUlR64WbTzNmFxADU48
	 IPRgqInqKZTYBRzXDhyebCh2O/gBL6LLpqm+TiPAWkhEq+sLRcU8WQYL3z1iYtoVHI
	 ZRxFFGyp5y9coaea0nHT+UkgO607kLmfxJH7qcPsloesbzJdAzrGdAZA8sUo6rU2Y4
	 u5j5g3t3XLJEZ6hj8Pt5UY1MxHmytkaIpTrTZMobokbOj31jX9U/n7RBVSl4CVqi16
	 nUSVloDzrShwOC9AoY94RJJeOEzV4VWEiqrx1yAMtj1ri8ZXlBxRK7sqd85DmhziRi
	 okS8YPWHPQqZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] media: rockchip: Add JPEG decoder driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260825-rockchip-jpegdec-v2-2-86af859a3266@pengutronix.de>
References: <20260825-rockchip-jpegdec-v2-0-86af859a3266@pengutronix.de>
 <20260825-rockchip-jpegdec-v2-2-86af859a3266@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 14:03:41 +0000
Message-Id: <20260825140342.169861F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [Critical] DMA Use-After-Free and M2M permanent deadlock in `rkjpegd_stop=
_streaming`.
- [High] Use-After-Free vulnerabilities during driver removal due to incorr=
ect teardown ordering, missing refcounting, and devres misuse.
- [High] API Misuse / Format State Corruption in `VIDIOC_S_FMT` causing Out=
-of-Bounds DMA.
- [High] Interrupt Handler reads hardware registers without clock verificat=
ion, leading to an asynchronous external abort.
- [Medium] Driver removal cancels asynchronous runtime PM and watchdog oper=
ations, leaking power domain references.
- [Medium] DMA Cache Coherency violation in grayscale manual chroma initial=
ization.
- [Medium] Data race on format and crop structures between the mem2mem work=
er thread and ioctls.
- [Low] Missing payload initialization in `rkjpegd_set_last_buffer` returns=
 uninitialized `bytesused` to userspace.
- [Low] Improper use of `pm_sleep_ptr()` for the `dev_pm_ops` structure poi=
nter.
--

--- Patch [2]: [PATCH v2 2/4] media: rockchip: Add JPEG decoder driver ---
commit 9bad9a9888014b5b0bd6f04cbdd400f5de01d0f8
Author: Sascha Hauer <s.hauer@pengutronix.de>

media: rockchip: Add JPEG decoder driver

Add a driver for the JPEG hardware decoder Rockchip integrates into a number
of its SoCs. Exposes one V4L2 M2M device implementing the stateful decoder
interface.

> diff --git a/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c b/drivers/=
media/platform/rockchip/rkjpegd/rkjpegd.c
> new file mode 100644
> index 0000000000000..377964eb74a64
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c
> @@ -0,0 +2328 @@
[ ... ]
> +static int rkjpegd_g_fmt_vid_cap(struct file *file, void *priv,
> +				 struct v4l2_format *f)
> +{
> +	f->fmt.pix_mp =3D file_to_rkjpegd_ctx(file)->dst_fmt;

[Severity: Medium]
Is there a data race here if the M2M worker thread concurrently modifies
ctx->dst_fmt in rkjpegd_source_change() locklessly? This could expose
an inconsistent or torn format state to userspace.

> +
> +	return 0;
> +}
[ ... ]
> +static int rkjpegd_s_fmt_vid_out(struct file *file, void *priv,
> +				 struct v4l2_format *f)
> +{
> +	struct rkjpegd_ctx *ctx =3D file_to_rkjpegd_ctx(file);
> +	struct vb2_queue *vq =3D v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx);
> +	int ret;
> +
> +	if (vb2_is_busy(vq))
> +		return -EBUSY;
> +
> +	ret =3D rkjpegd_try_fmt_vid_out(file, priv, f);
> +	if (ret)
> +		return ret;
> +
> +	ctx->src_fmt =3D f->fmt.pix_mp;
> +
> +	/*
> +	 * Picking a coded format invalidates whatever was negotiated on the
> +	 * capture queue.  Seed it from the coded resolution so a userspace
> +	 * that already knows the frame size can allocate without waiting for
> +	 * the first source change.
> +	 */
> +	rkjpegd_fill_raw_fmt(&ctx->dst_fmt,
> +			     ALIGN(ctx->src_fmt.width, RKJPEGD_RAW_STEP),
> +			     ALIGN(ctx->src_fmt.height, RKJPEGD_RAW_STEP));

[Severity: High]
Can a user configure a small capture resolution via REQBUFS and then set the
output format to a large resolution here? Since the capture queue's busy
state is not checked before unconditionally overwriting ctx->dst_fmt, the
hardware might later DMA a large frame into a small allocated physical buff=
er,
causing out-of-bounds memory corruption.

> +	rkjpegd_propagate_colorimetry(&ctx->dst_fmt, &ctx->src_fmt);
> +	ctx->crop.left =3D 0;
> +	ctx->crop.top =3D 0;
> +	ctx->crop.width =3D ctx->src_fmt.width;
> +	ctx->crop.height =3D ctx->src_fmt.height;
> +
> +	return 0;
> +}
[ ... ]
> +static void rkjpegd_set_last_buffer(struct rkjpegd_ctx *ctx)
> +{
> +	struct vb2_v4l2_buffer *next_dst_buf;
> +
> +	next_dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +	if (!next_dst_buf) {
> +		ctx->fh.m2m_ctx->is_draining =3D true;
> +		ctx->fh.m2m_ctx->next_buf_last =3D true;
> +		return;
> +	}
> +
> +	v4l2_m2m_last_buffer_done(ctx->fh.m2m_ctx, next_dst_buf);

[Severity: Low]
Should this function call vb2_set_plane_payload() to clear the payload
length before completing the buffer? Without it, an uninitialized bytesused
value might be returned to userspace for empty EOS buffers.

> +}
[ ... ]
> +static void rkjpegd_job_finish_no_pm(struct rkjpegd_ctx *ctx,
> +				     enum vb2_buffer_state state)
> +{
> +	struct vb2_v4l2_buffer *src, *dst;
> +
> +	src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	if (WARN_ON(!src) || WARN_ON(!dst))
> +		return;

[Severity: Critical]
If buffers are removed during a concurrent VIDIOC_STREAMOFF (as seen in
rkjpegd_stop_streaming()), will the missing buffers cause this function to
return early, bypassing the job finish sequence and leaving the M2M context
permanently deadlocked in the RUNNING state?

> +
> +	src->sequence =3D ctx->sequence_out++;
[ ... ]
> +static int vdpu720_fill_chroma(struct rkjpegd_ctx *ctx,
> +			       struct vb2_v4l2_buffer *dst_buf)
> +{
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +	u32 y_size =3D ctx->dst_fmt.plane_fmt[0].bytesperline * ctx->dst_fmt.he=
ight;
> +	u32 size =3D ctx->dst_fmt.plane_fmt[0].sizeimage;
> +	void *dst_cpu;
> +
> +	dst_cpu =3D vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
> +	if (!dst_cpu) {
> +		dev_err_ratelimited(jpegd->dev,
> +				    "JPEG capture buffer has no kernel mapping\n");
> +		return -EINVAL;
> +	}
> +
> +	memset(dst_cpu + y_size, 0x80, size - y_size);

[Severity: Medium]
Will this CPU write dirty the cache without flushing it to RAM? Since the
buffer is already queued for DMA, the subsequent DMA sync by the V4L2 core
upon completion will invalidate the cache, potentially destroying these
initialized values and leaving the UV plane with stale RAM data.

> +
> +	return 0;
> +}
[ ... ]
> +static irqreturn_t rkjpegd_vdpu720_irq(int irq, void *dev_id)
> +{
> +	struct rkjpegd_dev *jpegd =3D dev_id;
> +	enum vb2_buffer_state state;
> +	u32 status, clr_mask;
> +
> +	status =3D rkjpegd_read(jpegd, VDPU720_REG_INT);

[Severity: High]
Could the IRQ handler be executed immediately after the watchdog enables the
IRQ but before clocks are enabled? Unconditionally reading hardware registe=
rs
here without verifying the device clocks are active (e.g. using
pm_runtime_get_if_active()) might cause an asynchronous external abort.

> +
> +	/*
[ ... ]
> +static void rkjpegd_watchdog(struct work_struct *work)
> +{
> +	struct rkjpegd_dev *jpegd =3D container_of(to_delayed_work(work),
> +						 struct rkjpegd_dev,
> +						 watchdog_work);
> +	struct rkjpegd_ctx *ctx =3D v4l2_m2m_get_curr_priv(jpegd->m2m_dev);
> +
> +	if (!ctx)
> +		return;
> +
> +	disable_irq(jpegd->irq);
> +
> +	dev_err(jpegd->dev, "frame processing timed out\n");
> +	rkjpegd_vdpu720_reset(ctx);
> +
> +	/*
> +	 * The frame is handed back as an error even if it did complete: the
> +	 * block has been reset underneath it and the interrupt telling us so
> +	 * was cleared with it.  After RKJPEGD_TIMEOUT_MS that is what it is.
> +	 */
> +	rkjpegd_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +
> +	enable_irq(jpegd->irq);

[Severity: High]
If the hardware asserted the IRQ line concurrently before or during the
reset, could the interrupt controller have latched the interrupt? Re-enabli=
ng
the IRQ here while the job is already terminated (and clocks disabled by
rkjpegd_job_finish) seems like it could trigger the IRQ handler prematurely.

> +}
[ ... ]
> +static void rkjpegd_source_change(struct rkjpegd_ctx *ctx,
> +				  struct rkjpegd_src_buf *src_buf)
> +{
[ ... ]
> +	dev_dbg(ctx->dev->dev, "source change to %ux%u\n", width, height);
> +
> +	rkjpegd_fill_raw_fmt(&ctx->dst_fmt, buf_width, buf_height);
> +	ctx->crop.left =3D 0;
> +	ctx->crop.top =3D 0;

[Severity: Medium]
Following up on the read in rkjpegd_g_fmt_vid_cap(), is it possible for a
torn read to occur since this function locklessly modifies ctx->dst_fmt and
ctx->crop from the worker thread while concurrent ioctls might be reading t=
hem?

> +	ctx->crop.width =3D width;
> +	ctx->crop.height =3D height;
[ ... ]
> +static void rkjpegd_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct rkjpegd_ctx *ctx =3D vb2_get_drv_priv(vq);
> +	struct vb2_v4l2_buffer *vbuf;
> +
> +	for (;;) {
> +		if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +			vbuf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +		else
> +			vbuf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +		if (!vbuf)
> +			break;
> +		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);

[Severity: Critical]
Does returning these active buffers to userspace without first stopping the
hardware operation pose a risk? If the hardware continues to DMA into the
physical pages of the removed capture buffer, it could corrupt whatever
userspace reuses the memory for.

> +	}
[ ... ]
> +static int rkjpegd_release(struct file *filp)
> +{
> +	struct rkjpegd_ctx *ctx =3D file_to_rkjpegd_ctx(filp);
> +
> +	v4l2_fh_del(&ctx->fh, filp);
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	rkjpegd_vdpu720_exit(ctx);

[Severity: High]
Following up on the cleanup in rkjpegd_remove(), could accessing the m2m_dev
and jpegd structures here trigger a use-after-free when unbinding the driver
with an open file descriptor?

> +	v4l2_fh_exit(&ctx->fh);
> +	kfree(ctx);
> +
> +	return 0;
> +}
[ ... ]
> +static void rkjpegd_remove(struct platform_device *pdev)
> +{
> +	struct rkjpegd_dev *jpegd =3D platform_get_drvdata(pdev);
> +
> +	cancel_delayed_work_sync(&jpegd->watchdog_work);
> +	rkjpegd_v4l2_cleanup(jpegd);

[Severity: High]
Since this frees the V4L2 m2m_dev structures while userspace may still have
open file descriptors, does this lead to a use-after-free when the file
is eventually closed and rkjpegd_release() executes?

> +	reset_control_assert(jpegd->resets);
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +	clk_bulk_unprepare(RKJPEGD_NUM_CLOCKS, jpegd->clocks);

[Severity: Medium]
Does unbinding the device while a decode job is active leave the hardware
and PM domain in an inconsistent state? Canceling the watchdog and calling
pm_runtime_disable() without aborting the active job appears to leak power
domain references (by aborting pending put requests), and unpreparing active
clocks may trigger subsystem warnings.

> +}
[ ... ]
> +static struct platform_driver rkjpegd_driver =3D {
> +	.probe =3D rkjpegd_probe,
> +	.remove =3D rkjpegd_remove,
> +	.driver =3D {
> +		.name =3D RKJPEGD_NAME,
> +		.of_match_table =3D of_rkjpegd_match,
> +		.pm =3D pm_sleep_ptr(&rkjpegd_pm_ops),

[Severity: Low]
Should pm_ptr() be used here instead of pm_sleep_ptr() for wrapping the
dev_pm_ops structure pointer? The power management subsystem guidelines
dictate using pm_ptr() for the structure pointer and pm_sleep_ptr() for the
individual sleep callbacks within the structure to ensure proper dead-code
elimination.

> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-rockchip-j=
pegdec-v2-0-86af859a3266@pengutronix.de?part=3D2
