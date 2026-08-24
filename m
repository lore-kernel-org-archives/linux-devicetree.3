Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF8E2DA759
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787555842; cv=none; b=spq45jFUXLucrThtu0wUqkbokrd9XNzCPRz5XbQMn7PZooJCzV06Hn0suP7a5QJbMQbAB4wNK1rr9Cba6eFRB2+Sc9GlYIp2SucbVAjdNOSqdPGJQiy4BRasbJ0O9cYUd2csIoQSPSoNWKl736Hn1Ga71m7vX0I8UsRxBhipnoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787555842; c=relaxed/simple;
	bh=8eXI/foalr8fP1fCdbx54MMyuxQYLSllRy8BbKxlxxY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MxXk4barAx7ScB+qFFFdrAI/csBc23lHQTWS/bb/RoSstv33fmSoqqOBEHRAJgccMR8do+42R/cN+jPQESwvH3uZmZbolkUsmhYp1Wy4NrYG7ce5Wwu/gwM1d9ozL3hnAGjAXoQ0xGN5I81K7F6fNGJq4dstteH4QUCtC2zZqfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6geSKQw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6geSKQw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B061F000E9;
	Mon, 24 Aug 2026 07:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787555840;
	bh=R6fC1+qpaizMeoFpcSY8QveleiMfNbp997lvoxXc4ss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a6geSKQwO66iutn8Dx+GpUOWzlkQMUfn52g0cUsTtqYnKQYQx2QCRDQxdWzvOOQpq
	 4ubIkRvVhQFqGVY5VUlX8AYfiAvKInTF1Qua4tRA1ICi+lB41w/sp5z9J6P7QNT5py
	 uK3AA3unGjYe9+78KgEsUI5YzgwtB+kwcscP6zvjgYHUWrvRc3yDb/xKgOXw61ciUw
	 VQ4+kQvVkPo3AfqrIAOrtXEfxZ+kBxFb9J/Jg0w/oQjMykFxIuV4D03uKqR03XiZvK
	 R5WuG6MrNjIPnudJnus46AQqVnfL8LNQHqexC0lhnGxZfau4YeQmfXs5NOrlUqMPTD
	 X6BN+INxezTbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] media: rockchip: Add JPEG decoder driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824-rockchip-jpegdec-v1-2-8011822bf500@pengutronix.de>
References: <20260824-rockchip-jpegdec-v1-0-8011822bf500@pengutronix.de>
 <20260824-rockchip-jpegdec-v1-2-8011822bf500@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 07:17:19 +0000
Message-Id: <20260824071720.50B061F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [Critical] Missing upper bound checks on dynamically parsed JPEG dimensio=
ns cause an integer overflow in sizeimage calculation, leading to severe ou=
t-of-bounds memory corruption.
- [High] The driver struct `rkjpegd_dev` is tied to the device binding life=
time rather than the character device lifetime, causing Use-After-Free on u=
nbind if file descriptors remain open.
- [High] Unsafe teardown ordering in `rkjpegd_remove` leads to Use-After-Fr=
ee in the IRQ handler.
- [High] Decoding a YUV411 JPEG frame with an odd 16-pixel block width caus=
es a hardware out-of-bounds write.
- [High] A race condition between the IRQ handler and the watchdog timeout =
causes a fatal bus fault.
- [High] The driver abruptly cuts power to the hardware during system suspe=
nd if a job is actively running, leading to bus hangs.
- [High] The hardware is instructed to read past the end of the mapped stre=
am buffer, triggering IOMMU page faults.
- [Medium] Unlocked access to `ctx->dst_fmt` and `ctx->crop` in `rkjpegd_so=
urce_change` causes data races with userspace ioctls.
- [Medium] Incorrect wrapper macro `pm_sleep_ptr()` is used for the `dev_pm=
_ops` structure pointer.
--

--- Patch [2]: [PATCH 2/4] media: rockchip: Add JPEG decoder driver ---
commit bbf9cc98a537ee90d3d08994ca3f13423c297391
Author: Sascha Hauer <s.hauer@pengutronix.de>
Subject: media: rockchip: Add JPEG decoder driver

Add a driver for the JPEG hardware decoder Rockchip integrates into a number
of its SoCs. Downstream it is known as the VDPU720. Exposes one V4L2 M2M
device implementing the stateful decoder interface.

> diff --git a/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c b/drivers/=
media/platform/rockchip/rkjpegd/rkjpegd.c
> index 0000000000000..cccf365ebc5d4
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c

[ ... ]

> +static void rkjpegd_fill_raw_fmt(struct v4l2_pix_format_mplane *pix_mp,
> +				 u32 width, u32 height)
> +{
> +	pix_mp->pixelformat =3D V4L2_PIX_FMT_NV12;
> +	pix_mp->width =3D width;
> +	pix_mp->height =3D height;
> +	pix_mp->field =3D V4L2_FIELD_NONE;
> +	pix_mp->num_planes =3D 1;
> +	pix_mp->plane_fmt[0].bytesperline =3D width;
> +	pix_mp->plane_fmt[0].sizeimage =3D width * height * 3 / 2;

[Severity: Critical]
Can this size calculation overflow the 32-bit integer?

If the parsed width and height are maliciously large, bypassing maximum
resolution clamping in rkjpegd_source_change(), the resulting undersized bu=
ffer
allocation can cause a massive out-of-bounds write later in
vdpu720_fill_chroma() where size - y_size underflows.

> +	memset(pix_mp->plane_fmt[0].reserved, 0,
> +	       sizeof(pix_mp->plane_fmt[0].reserved));
> +	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
> +}

[ ... ]

> +static int vdpu720_fill_regs(struct rkjpegd_ctx *ctx,
> +			     const struct v4l2_jpeg_header *hdr,
> +			     dma_addr_t tbl_dma,
> +			     dma_addr_t strm_dma, u32 strm_start_byte,
> +			     u32 strm_len_blks,
> +			     dma_addr_t out_dma)
> +{
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;

[ ... ]

> +	/*
> +	 * The picture dimensions below are taken from the bitstream while the
> +	 * strides are taken from the negotiated capture format.  A frame that
> +	 * is larger than what was negotiated would make the decoder write
> +	 * beyond the capture buffer, so refuse it rather than program the
> +	 * hardware with the two sets of numbers mixed.
> +	 */
> +	if (jpeg_width > buf_width || jpeg_height_aligned > buf_height) {
> +		dev_err_ratelimited(jpegd->dev,

[Severity: High]
Is the raw header width check sufficient here?

YUV411 has a horizontal MCU width of 32 pixels. If an odd 16-pixel width is
requested (e.g., 48), the capture buffer stride is set to 48. Because the
check compares against the unaligned raw header width instead of the
MCU-aligned width, the hardware will process complete MCU blocks up to 64
pixels, overflowing the allocated row bounds.

> +				    "JPEG %ux%u does not fit the negotiated %ux%u\n",
> +				    jpeg_width, jpeg_height_aligned,
> +				    buf_width, buf_height);
> +		return -EINVAL;
> +	}

[ ... ]

> +static int rkjpegd_vdpu720_run(struct rkjpegd_ctx *ctx)
> +{
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;

[ ... ]

> +	/*
> +	 * The stream register must be 16-byte aligned.  Round down to the
> +	 * nearest 16-byte boundary and record the sub-block start byte.
> +	 *
> +	 * Both are taken from the start of the plane rather than from the
> +	 * payload.  data_offset is set by userspace in VIDIOC_QBUF and
> +	 * videobuf2 only rejects it when it is not smaller than bytesused,
> +	 * so it carries arbitrary low bits.  Splitting an address that
> +	 * already includes it would leave STRM_BASE unaligned by those bits
> +	 * with no way to encode them, and the hardware would start reading
> +	 * from the wrong offset.
> +	 */
> +	strm_off        =3D data_offset + hdr->ecs_offset;
> +	hw_strm_off     =3D strm_off & ~0xfU;
> +	strm_start_byte =3D strm_off & 0xfU;
> +	strm_len_blks   =3D (ALIGN(payload - hw_strm_off, 16) - 1) >> 4;

[Severity: High]
Could this padding instruct the hardware to read past the mapped payload
bounds?

By blindly rounding the read length up to the next 16-byte boundary, a
tightly packed, page-aligned buffer (like an imported dmabuf) that ends
exactly on a page boundary might cause the hardware to over-read into
unmapped memory and trigger an IOMMU page fault.

> +
> +	ret =3D vdpu720_fill_regs(ctx, hdr, ctx->table_base.dma,
> +				src_dma + hw_strm_off, strm_start_byte,
> +				strm_len_blks, dst_dma);

[ ... ]

> +static irqreturn_t rkjpegd_vdpu720_irq(int irq, void *dev_id)
> +{
> +	struct rkjpegd_dev *jpegd =3D dev_id;
> +	enum vb2_buffer_state state;
> +	u32 status, clr_mask;
> +
> +	status =3D rkjpegd_read(jpegd, VDPU720_REG_INT);
> +
> +	/*
> +	 * Two-phase IRQ clear.  Write back a masked subset of status bits
> +	 * before checking IRQ_RAW, which some revisions require.
> +	 */
> +	clr_mask =3D (~(VDPU720_IRQ_CLR_COND & status)) &
> +		    (VDPU720_IRQ_CLR_KEEP & status);
> +	rkjpegd_write(jpegd, clr_mask, VDPU720_REG_INT);
> +
> +	if (!(status & VDPU720_IRQ_RAW))
> +		return IRQ_NONE;
> +
> +	/* Fully clear IRQ */
> +	rkjpegd_write(jpegd, 0, VDPU720_REG_INT);
> +
> +	state =3D (status & VDPU720_ERR_MASK) ?
> +		VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
> +
> +	if (status & VDPU720_DEC_ERR) {
> +		u32 mcu_pos  =3D rkjpegd_read(jpegd, VDPU720_REG_DBG_MCU_POS);

[Severity: High]
Would it be safer to serialize the watchdog timeout with the IRQ handler?

The watchdog and IRQ handler run concurrently without serialization. If the
watchdog completes the job first and unconditionally disables the block's
clocks, the IRQ handler executing on another CPU reading this register from=
 an
unclocked hardware block will cause a fatal bus fault.

> +		u32 err_info =3D rkjpegd_read(jpegd, VDPU720_REG_DBG_ERROR);
> +
> +		dev_warn_ratelimited(jpegd->dev,

[ ... ]

> +static void rkjpegd_source_change(struct rkjpegd_ctx *ctx,
> +				  struct rkjpegd_src_buf *src_buf)
> +{
> +	u32 width, height, buf_width, buf_height;
> +
> +	if (src_buf->parsed) {
> +		width =3D src_buf->header.frame.width;
> +		height =3D src_buf->header.frame.height;
> +	} else {
> +		/*
> +		 * A frame the parser refused carries no dimensions of its own,
> +		 * and the job will hand it back with an error.  Report the
> +		 * change anyway, from the coded format userspace configured.
> +		 * V4L2_FMT_FLAG_DYN_RESOLUTION tells an application to wait
> +		 * for this event before it sets the capture queue up, so one
> +		 * that never arrives leaves it waiting for a frame that cannot
> +		 * come instead of seeing the error and giving up.
> +		 */
> +		width =3D ctx->src_fmt.width;
> +		height =3D ctx->src_fmt.height;
> +	}
> +	buf_width =3D ALIGN(width, RKJPEGD_RAW_STEP);
> +	buf_height =3D ALIGN(height, RKJPEGD_RAW_STEP);
> +
> +	if (!ctx->initial_source_change &&
> +	    ctx->dst_fmt.width =3D=3D buf_width &&
> +	    ctx->dst_fmt.height =3D=3D buf_height &&
> +	    ctx->crop.width =3D=3D width && ctx->crop.height =3D=3D height)
> +		return;
> +
> +	dev_dbg(ctx->dev->dev, "source change to %ux%u\n", width, height);
> +
> +	rkjpegd_fill_raw_fmt(&ctx->dst_fmt, buf_width, buf_height);
> +	ctx->crop.left =3D 0;
> +	ctx->crop.top =3D 0;
> +	ctx->crop.width =3D width;
> +	ctx->crop.height =3D height;

[Severity: Medium]
Are these non-atomic structure assignments safe from concurrent userspace
ioctls?

This function updates these values from a workqueue context without holding
vdev_lock. A user concurrently calling ioctls that acquire the lock and read
these structures could see a torn, inconsistent structure state.

> +
> +	v4l2_event_queue_fh(&ctx->fh, &rkjpegd_src_change_event);
> +	ctx->source_change =3D true;

[ ... ]

> +static int rkjpegd_v4l2_init(struct rkjpegd_dev *jpegd)
> +{
> +	int ret;
> +
> +	ret =3D v4l2_device_register(jpegd->dev, &jpegd->v4l2_dev);

[ ... ]

> +	jpegd->vdev.lock =3D &jpegd->vdev_lock;
> +	jpegd->vdev.v4l2_dev =3D &jpegd->v4l2_dev;
> +	jpegd->vdev.fops =3D &rkjpegd_fops;
> +	jpegd->vdev.release =3D video_device_release_empty;

[Severity: High]
Does allocating the core driver structure with devres tie its lifetime
to the device bind rather than the file descriptor?

Combined with the empty video_device release callback, if a userspace proce=
ss
holds the video node open during device unbind, devres will free the struct=
ure.
Closing the descriptor later will access freed memory.

> +	jpegd->vdev.vfl_dir =3D VFL_DIR_M2M;
> +	jpegd->vdev.device_caps =3D V4L2_CAP_STREAMING |
> +				  V4L2_CAP_VIDEO_M2M_MPLANE;
> +	jpegd->vdev.ioctl_ops =3D &rkjpegd_ioctl_ops;

[ ... ]

> +static void rkjpegd_remove(struct platform_device *pdev)
> +{
> +	struct rkjpegd_dev *jpegd =3D platform_get_drvdata(pdev);
> +
> +	cancel_delayed_work_sync(&jpegd->watchdog_work);
> +	rkjpegd_v4l2_cleanup(jpegd);

[Severity: High]
Is the teardown ordering here safe against active interrupts?

The M2M device is completely freed by rkjpegd_v4l2_cleanup() before the
hardware or IRQ is disabled. If an active hardware job finishes during or
after this unbind sequence, the IRQ handler will access the freed M2M conte=
xt,
resulting in a use-after-free.

> +	reset_control_assert(jpegd->resets);
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +	clk_bulk_unprepare(RKJPEGD_NUM_CLOCKS, jpegd->clocks);
> +}
> +
> +/*
> + * The clocks are prepared once and only enabled and disabled around a j=
ob,
> + * which is what lets rkjpegd_job_finish() run from the interrupt handle=
r.
> + * There is nothing else to do around a runtime transition: the power do=
main
> + * is handled by genpd on the device's behalf.
> + */
> +static const struct dev_pm_ops rkjpegd_pm_ops =3D {
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)

[Severity: High]
Does this PM operation safely handle active DMA transactions during system
suspend?

Setting pm_runtime_force_suspend directly cuts power abruptly without ensur=
ing
active DMA transactions are idled or aborted. Powering off the VDPU while it
is issuing AXI transactions hangs the interconnect on Rockchip platforms.

> +};
> +
> +static const struct of_device_id of_rkjpegd_match[] =3D {
> +	{ .compatible =3D "rockchip,rk3568-jpegd" },
> +	{ .compatible =3D "rockchip,rk3588-jpegd" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, of_rkjpegd_match);
> +
> +static struct platform_driver rkjpegd_driver =3D {
> +	.probe =3D rkjpegd_probe,
> +	.remove =3D rkjpegd_remove,
> +	.driver =3D {
> +		.name =3D RKJPEGD_NAME,
> +		.of_match_table =3D of_rkjpegd_match,
> +		.pm =3D pm_sleep_ptr(&rkjpegd_pm_ops),

[Severity: Medium]
Should this use pm_ptr() instead of pm_sleep_ptr()?

Because the structure pointer must be wrapped with pm_ptr(), using
pm_sleep_ptr() evaluates to NULL when CONFIG_PM_SLEEP is disabled, leaving
the statically defined ops unreferenced and generating a compiler warning.

> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-rockchip-j=
pegdec-v1-0-8011822bf500@pengutronix.de?part=3D2
