Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4D63E7BAD
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778861131; cv=none; b=HV9sT26sUI+A4G2eZO96OdKtlBZ6hiXo5jP2vvIkTziy3uX4gkBvHZ/FEzscucmiKybdER7oushJEp6cKBU517ZbiooTKGwuCmcKctOUhzsQj9SVs63QS5787THQ5KDAi5VvDZ4hET1NtDDNAktCtVx3dxq4XJJRZ8rJkO0Ul3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778861131; c=relaxed/simple;
	bh=eIexaNfG/rLBr75r9vpsJXwatV8r4XXYIQrhNQI9MjA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AGN5LH/k0YvAm0O6QJ1V8wIzlGhpY8wttL8lS5zCQWPw5bsr1M3bA5u3t4QHu978ZqqsgO7yz9vk9XrdYYfIpp3lrcI//SYBRx8gSu8P2MtxBJsnT2mLta15tPreTfGouOtMrpDPQ0HQrjkVqwgVOhYNcNJ2RQlrLY6WaFMl/5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsp/+oTa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsp/+oTa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E2EC2BCB0;
	Fri, 15 May 2026 16:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778861131;
	bh=eIexaNfG/rLBr75r9vpsJXwatV8r4XXYIQrhNQI9MjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=bsp/+oTa9Sss1ZdxgpepMo2CQserx1MVckRIyHYs9FXmnRYY+D5zzGk9+95wGJswm
	 7gWKuXPWVUYXd0K0ebFnRtKvPcTFV/tPjIy19OkbLO7AjoTa0qou5GhfSh3yMJ2ljB
	 lZlDLUufO/IWnonlDZQ+01ZFNroD90LfUworA/GyvJHO91UQY/jyAjY4Pxc+AYVH+f
	 GtuuzlC78mFxXpfZc6ELNp6UodUWz9kEdYzATCCE10/HWdCanmw+JlbJLyn/0GjfDS
	 sIzyWyoevOw7ZccPpxw8mHjHLxm9v3Dht7b0rfVLbA1xFTKev7EPWwDZZM6l/O23pH
	 QJpMP+UPEm7Wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/28] media: rockchip: rga: move hw specific parts
 to a dedicated struct
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-spu-rga3-v6-11-e547152eb9c9@pengutronix.de>
References: <20260515-spu-rga3-v6-11-e547152eb9c9@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 16:05:30 +0000
Message-Id: <20260515160531.11E2EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Lack of PM state verification in the ISR allows spurious inter=
rupts on suspended hardware to trigger a kernel panic.
- [Critical] Integer overflow in `vidioc_s_selection` allows bypassing boun=
ds checks with maliciously large crop dimensions.
- [High] Use-After-Free race condition during module removal due to unbalan=
ced teardown order in `rga_remove()`.
- [High] Unhandled initialization error in `rga_open()` leads to a use-afte=
r-free of a destroyed mutex.
--

commit 0a388e94d347297bf67ec0c6a92dbb56a186e007
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: move hw specific parts to a dedicated struct

In preparation for the RGA3 unit, move RGA2 specific parts from rga.c
to rga-hw.c and create a struct to reference the RGA2 specific functions
and formats.

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 8c34f73d69764..f599c992829dd 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -55,13 +54,8 @@ static void device_run(void *prv)
>  static irqreturn_t rga_isr(int irq, void *prv)
>  {
>  	struct rockchip_rga *rga =3D prv;
> -	int intr;
> =20
> -	intr =3D rga_read(rga, RGA_INT) & 0xf;
> -
> -	rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
> -
> -	if (intr & 0x04) {
> +	if (rga->hw->handle_irq(rga)) {
>  		struct vb2_v4l2_buffer *src, *dst;
>  		struct rga_ctx *ctx =3D rga->curr;
> =20
>  		WARN_ON(!ctx);

This isn't a bug introduced by this commit, but is it possible for rga_isr
to be called when the device is suspended?

If the device is suspended, reading RGA_INT might return 0xffffffff, which
evaluates to true here. Since ctx would be NULL, the code warns but then
dereferences ctx via ctx->fh.m2m_ctx, which could cause a panic.

With the planned addition of IRQF_SHARED support for external IOMMUs
mentioned in later patches, another device on the same shared interrupt
line could trigger this when the RGA is suspended. Would we need to verify
if the device is active using pm_runtime_get_if_active() before accessing
registers?

[ ... ]

> @@ -360,9 +225,9 @@ static int rga_open(struct file *file)
>  	ctx->out =3D def_frame;
> =20
>  	v4l2_fill_pixfmt_mp(&ctx->in.pix,
> -			    ctx->in.fmt->fourcc, DEFAULT_WIDTH, DEFAULT_HEIGHT);
> +			    ctx->in.fmt->fourcc, def_width, def_height);
>  	v4l2_fill_pixfmt_mp(&ctx->out.pix,
> -			    ctx->out.fmt->fourcc, DEFAULT_WIDTH, DEFAULT_HEIGHT);
> +			    ctx->out.fmt->fourcc, def_width, def_height);
> =20
>  	if (mutex_lock_interruptible(&rga->mutex)) {
>  		kfree(ctx);

This isn't a bug introduced by this commit, but looking further down in
rga_open(), is it safe to ignore the return value of rga_setup_ctrls(ctx)?

If control setup fails, rga_setup_ctrls() internally calls
v4l2_ctrl_handler_free(), which frees the internal control buckets and
destroys the mutex.

However, rga_open() blindly proceeds to call
v4l2_ctrl_handler_setup(&ctx->ctrl_handler) and assigns the freed handler
to ctx->fh.ctrl_handler. Could this lead to a use-after-free of the mutex
during subsequent V4L2 ioctl operations?

[ ... ]

> @@ -660,7 +527,7 @@ static int vidioc_s_selection(struct file *file, void=
 *priv,
> =20
>  	if (s->r.left + s->r.width > f->pix.width ||
>  	    s->r.top + s->r.height > f->pix.height ||
> -	    s->r.width < MIN_WIDTH || s->r.height < MIN_HEIGHT) {
> +	    s->r.width < rga->hw->min_width || s->r.height < rga->hw->min_heigh=
t) {
>  		v4l2_dbg(debug, 1, &rga->v4l2_dev, "unsupported crop value.\n");
>  		return -EINVAL;
>  	}

This isn't a bug introduced by this commit, but can the
s->r.left + s->r.width check overflow here?

Since s->r.width is an unsigned 32-bit integer, providing a maliciously
large width (e.g., 0xFFFFFFFF) and a small left offset could cause the
addition to wrap around to 0, bypassing the bounds check.

Furthermore, 0xFFFFFFFF < rga->hw->min_width evaluates to false, which
bypasses this minimum size check as well. Could this result in out-of-bounds
memory operations when the hardware DMA engine is programmed with these
excessively large dimensions?

[ ... ]

> @@ -883,7 +750,7 @@ static void rga_remove(struct platform_device *pdev)
>  {
>  	struct rockchip_rga *rga =3D platform_get_drvdata(pdev);
> =20
> -	dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
> +	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
>  		       rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
> =20
>  	v4l2_info(&rga->v4l2_dev, "Removing\n");

This isn't a bug introduced by this commit, but is the teardown order
in rga_remove() safe?

It frees the DMA command buffer and releases the mem2mem context before
calling video_unregister_device().

Could a concurrent userspace process holding the device open continue to
issue V4L2 ioctls while the module is unloading, potentially causing a
use-after-free on m2m_dev or the newly freed DMA buffer memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-spu-rga3-v=
6-0-e547152eb9c9@pengutronix.de?part=3D11
