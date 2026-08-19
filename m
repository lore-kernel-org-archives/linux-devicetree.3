Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0C94582E1
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787138641; cv=none; b=NnR+ohLS1LQ9uhlbNoNu35svsCkUgLp6A41chvhTWEuIOtYH6L2XR4Xt5r/kjbm9QOZeZK6+kETbkx+P1RmCFYEfmooeQtt8iUkXFE0uo/VI53oW6qjaQlUWmFsQhD8ShJ5brNbJHkPQXavY2uHiqDbHv+ly7NOTRAx9ap2t/R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787138641; c=relaxed/simple;
	bh=6dUo2k3vEZ+/lTjpzspWLoBprJz1EJkUt09Ed0SBkoM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UWRgb530JC0VvkSosifXAXKHUSRARdetlKZat4Y1PVupPnoriMMH3TFRJK1y/NXPaWeN3DL0CDguGIgmR0GtyIBxHrr/Y2hX0Vi2XkB/63Vlf7KHxr/tcfbDX6KHrY1eaVF+jchwWPczrsiJ3gxBzcLIAekS/3s0IYDYilbAab0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqTtsu0Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqTtsu0Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C981F000E9;
	Wed, 19 Aug 2026 11:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787138640;
	bh=oNOto2q9/imcdZs9UEaCXcKcmqsKD63VZVj46urzq0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lqTtsu0YkSiCPMI9WE4cniW8v4Gi+iIwnXddG4ZPuM+fiu5jP+rZT7o7jZCtUAVrm
	 Y+qzgsATQTE/sCXBObkw21/YfvN5RLZZ/M6LU2dYqzFh6ZBoDazXx8Bt/GJkP3O4Ls
	 B+p8IFSfFsQ9z/52RTbfBXsAHrRcQ7S8IMd9JEoIKdABpjNnrcOfjimbZbG53ADnvy
	 daA3gcIZ7eVZ/GyAhmQQ0jUYgW21H140gzKok8vtybQsUFvI2n5p3GSBOXDmeXv9ua
	 r/9Y/VilmOmvThYpR1EhsJ2zh0tc0CKByLUjEWS9ZlOVZZJExJmfRfKhnSECjJHM4H
	 pDX3dxnaZFnzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] media: verisilicon: Fix the cleanup when a codec
 ->run() fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260819-rk3588-jpegdec-v1-1-33d74cdf369c@pengutronix.de>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
 <20260819-rk3588-jpegdec-v1-1-33d74cdf369c@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 11:23:59 +0000
Message-Id: <20260819112359.E8C981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing calls to `hantro_end_prepare_run(ctx, error)` on early err=
or paths in multiple codec `->run()` callbacks, leading to permanently inco=
mplete V4L2 control requests.
- [High] Missing NULL pointer check for the return value of `vb2_plane_vadd=
r()` before dereferencing it during JPEG header assembly.
- [High] Missing synchronization to cancel `vpu->watchdog_work` during devi=
ce removal, leading to a Use-After-Free.
- [High] Race condition between late hardware IRQ delivery and `hantro_watc=
hdog()` execution causes the watchdog of the *next* job to be cancelled and=
 the next job to be prematurely finished.
--

--- Patch [1]: [PATCH 1/7] media: verisilicon: Fix the cleanup when a codec=
 ->run() fails ---
commit 67d0bec622e69de9d51450bf1c4cea20e9bb249c
Author: Sascha Hauer <s.hauer@pengutronix.de>
media: verisilicon: Fix the cleanup when a codec ->run() fails

This commit pairs hantro_start_prepare_run() and hantro_end_prepare_run()
on error paths to ensure V4L2 requests are properly completed. It adds an
error argument to hantro_end_prepare_run() so the watchdog is only armed
when the hardware actually starts, preventing unrelated jobs from being
aborted. Resources are also properly released in device_run() on failure.

Fixes: 892bb6ecead9 ("media: hantro: do a PM resume earlier")
Fixes: e2da465455ce ("media: hantro: Support VP9 on the G2 core")
Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")

> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 2e81877f640fb..d9936f6979d2c 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
[ ... ]
> @@ -162,6 +179,9 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
>  	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
>  				   &ctx->ctrl_handler);
> =20
> +	if (error)
> +		return;
> +
>  	/* Kick the watchdog. */
>  	schedule_delayed_work(&ctx->dev->watchdog_work,
>  			      msecs_to_jiffies(2000));

[Severity: High]
This is a pre-existing issue, but does the device removal process in
hantro_remove() lack synchronization to cancel vpu->watchdog_work?

The driver schedules vpu->watchdog_work when a job starts. If a
userspace application is streaming and a timeout occurs precisely when
the device is unbound, the watchdog work might execute after the vpu
object is freed by devres. This could lead to a use-after-free since
cancel_delayed_work_sync() is not called during teardown.

[Severity: High]
This isn't a bug introduced by this patch, but can a late hardware IRQ
delivery cause a race condition with hantro_watchdog()?

If a job times out, hantro_watchdog() resets the hardware and completes
the job. The M2M framework then schedules the next job and arms its
watchdog. If the delayed hardware IRQ for the original job fires,
hantro_irq_done() targets the current context (the new job) and cancels
its watchdog. Could this cause the IRQ handler to erroneously call
hantro_job_finish() on the new job while the hardware is still processing
it, leading to state corruption and premature buffer returns?

> diff --git a/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c b/dr=
ivers/media/platform/verisilicon/hantro_g1_h264_dec.c
> index ad5c1a6634f5c..30c2ac32cd0b0 100644
> --- a/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c
[ ... ]
> @@ -264,7 +264,7 @@ int hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
>  	set_ref(ctx);
>  	set_buffers(ctx, src_buf);
> =20
> -	hantro_end_prepare_run(ctx);
> +	hantro_end_prepare_run(ctx, 0);

[Severity: High]
This is a pre-existing issue, but do the early error paths in codec run
callbacks bypass hantro_end_prepare_run() after hantro_start_prepare_run()
is invoked internally?

If context preparation or reference setup fails in hantro_g1_h264_dec_run(),
hantro_g2_hevc_dec_run(), or hantro_g1_vp8_dec_run(), early returns might
miss the required call to hantro_end_prepare_run(). This can leave the
V4L2 control requests incomplete indefinitely, which could lead to a resour=
ce
leak and userspace application hang when malformed streams or invalid V4L2
parameters trigger these paths.

> diff --git a/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c b/dr=
ivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
> index 86cc1a07026f0..78f51e92fb2e3 100644
> --- a/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
> +++ b/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
[ ... ]
> @@ -148,7 +148,7 @@ int hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx)
>  		| H1_REG_ENC_PIC_INTRA
>  		| H1_REG_ENC_CTRL_EN_BIT;
> =20
> -	hantro_end_prepare_run(ctx);
> +	hantro_end_prepare_run(ctx, 0);

[Severity: High]
This isn't a bug introduced by this patch, but is there a missing NULL
pointer check for the return value of vb2_plane_vaddr() in
hantro_h1_jpeg_enc_run() before it is dereferenced?

Earlier in this function, vb2_plane_vaddr() assigns the virtual address
of the destination buffer to jpeg_ctx.buffer. If the buffer mapping fails
due to an invalid exporter or vmalloc exhaustion, it returns NULL. The
pointer is then unconditionally passed to hantro_jpeg_header_assemble(),
which calls memcpy() on it, potentially causing a kernel panic. Should
there be a check here to safely handle mapping failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-rk3588-jpe=
gdec-v1-0-33d74cdf369c@pengutronix.de?part=3D1
