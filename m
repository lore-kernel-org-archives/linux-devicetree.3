Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D804E35DA78
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194540; cv=none; b=N+H5FO7ncRLnSdxXZQOsXJkSM+rh6BqymJrhccsENtmqnC7fkrUGSRrPJzxWm0KW9XZD9OzqEKkyEy4YaYUtHFsTVIovqZAOCjol8kzFbRtpVdlHcYQcjDeMkc0djUJHpWsp/ZCPZ/w0fp+FPhWredlSBDUDXTWUCvMgtA3+TaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194540; c=relaxed/simple;
	bh=PpMajIyqOBpWAmz7Y+zTzy+LmcDAIG7fDv7ywEKE0+4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LRtC6n2/V5J++bky9s0UBuG5SyAreilTs5G3dzdiKkq2EZCc5TVxGnPgB0wiKjLTnczr2kogPElrakFhoT62dwmLbffX62KQUF8GFNcxd1XnH+OqvO6waOkIOJkxADb4f9A4AGSafQtP/CnQSCTA1hj6J6FLBn9d/W8W5KTbQSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKALkIao; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKALkIao"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301BF1F00893;
	Mon,  5 Oct 2026 10:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791194538;
	bh=socEQDK4B5+P793pS7JrR9TzGsEyBlfGg+mrbDVHufA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KKALkIaoDhq12kPFYVYw3yWQkjER2UbxTFpqEEI8CJ7UTpwAFr24I9C+f3NX9VVit
	 Qhvbfyx6I7VqHkK/ltuD8o4rgikRD9BiPEqKdqfNnKtcgpx8FDIUj1btOH9CTbX6JN
	 agoX/KD+8ZGACJ3s23AQfHClncSNbZAZKMBwvu/Lten/Vn+rEPc4f3smBpCe2/Co7a
	 R01eOyuiXfXgu1vRlpOwYgf2ZBUDJG4P7TTqTbOybkLUl0FEP1ZZg/Dlu7VGgx2Ztb
	 EqVldY/F/lUJwBcphNyO6w0N+9mXPbhAwcbnTt9kthJ5NGOGZNfl6VO62y196YoXoY
	 7LKbBmb5czJdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/4] media: rockchip: Add JPEG decoder driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20261005-rockchip-jpegdec-v6-2-25f16dea1697@pengutronix.de>
References: <20261005-rockchip-jpegdec-v6-0-25f16dea1697@pengutronix.de>
 <20261005-rockchip-jpegdec-v6-2-25f16dea1697@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 10:02:17 +0000
Message-Id: <20261005100218.301BF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] media: rkjpegd: user-triggerable WARN_ON_ONCE in error path
- [High] pm: kernel crash from spurious IRQ reading unclocked registers
- [High] media: rkjpegd: IRQ handler wipes out watchdog soft reset
- [Medium] pm: resource leak due to missing synchronous suspend in remove
- [Medium] media: rkjpegd: data race on ctx->sequence_cap between QBUF and =
IRQ
--

commit e33f32166562ddeac3fb6446b67084c1666b6b89
Author: Sascha Hauer <s.hauer@pengutronix.de>

media: rockchip: Add JPEG decoder driver

Add a driver for the JPEG hardware decoder Rockchip integrates into a
number of its SoCs, exposing one V4L2 M2M device implementing the
stateful decoder interface.

> diff --git a/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c b/drivers/=
media/platform/rockchip/rkjpegd/rkjpegd.c
> --- a/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c
> +++ b/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c

[ ... ]

> @@ -1388,8 +1388,9 @@ static void rkjpegd_job_finish_no_pm(struct rkjpegd=
_ctx *ctx,
> =20
>  	src->sequence =3D ctx->sequence_out++;
>  	dst->sequence =3D ctx->sequence_cap++;
> =20

[Severity: Medium]
Does this create a data race on ctx->sequence_cap?

Here in rkjpegd_job_finish_no_pm(), ctx->sequence_cap is incremented in
hardirq context protected by drain_lock. However, it is also incremented in
rkjpegd_last_buffer_done() under vdev_lock in process context.

If userspace issues a VIDIOC_QBUF on the capture queue while a drain is
ongoing, this might lead to duplicate sequence numbers or skipped counts
since the differing locks provide no mutual exclusion.

>  	/* GStreamer takes an empty capture buffer for the end of the stream. */
>  	vb2_set_plane_payload(&dst->vb2_buf, 0,
>  			      ctx->dst_fmt.plane_fmt[0].sizeimage);

[Severity: High]
Could this trigger a kernel WARN_ON_ONCE when handling an undersized buffer?

If userspace queues a frame with a larger resolution, rkjpegd_vdpu720_run()
detects the undersized capture buffer and fails with -EINVAL. The error path
jumps here, which unconditionally sets the payload size to the new, larger
ctx->dst_fmt.plane_fmt[0].sizeimage.

Because sizeimage exceeds the underlying plane length, setting it via
vb2_set_plane_payload() will trigger a warning.

[ ... ]

> @@ -1405,6 +1405,7 @@ static irqreturn_t rkjpegd_vdpu720_irq(int irq, voi=
d *dev_id)
>  	struct rkjpegd_dev *jpegd =3D dev_id;
>  	enum vb2_buffer_state state;
>  	u32 status;
> =20
>  	status =3D rkjpegd_read(jpegd, VDPU720_REG_INT);
> =20

[Severity: High]
Could a spurious interrupt cause a synchronous bus fault here?

The IRQ is requested via devm_request_irq() in rkjpegd_probe() before
pm_runtime_enable() is called and before resets are deasserted. If a
spurious interrupt is pending from a prior bootloader or kexec stage, the
IRQ handler fires immediately and reads VDPU720_REG_INT while the device
clocks are still disabled.

Should the handler use pm_runtime_get_if_active() to guard access, and the
IRQ be requested after PM initialization is complete?

>  	/* First phase of the IRQ clear, see VDPU720_IRQ_CLR_KEEP. */
>  	rkjpegd_write(jpegd, status & VDPU720_IRQ_CLR_KEEP, VDPU720_REG_INT);
> =20
>  	if (!(status & VDPU720_IRQ_RAW))
>  		return IRQ_NONE;
> =20
>  	rkjpegd_write(jpegd, 0, VDPU720_REG_INT);

[Severity: High]
Can the IRQ handler wipe out a concurrent soft reset requested by the
watchdog?

If the watchdog timeout executes vdpu720_soft_reset(), it writes
VDPU720_SOFT_RST_EN to this register. If a hardware IRQ fires concurrently,
this IRQ handler reads the register and then unconditionally writes 0 to
clear it.

This seems to wipe out the VDPU720_SOFT_RST_EN bit before the watchdog
finishes waiting for VDPU720_SOFT_RST_RDY, potentially leaving the block
wedged.

[ ... ]

> @@ -2121,6 +2121,7 @@ static void rkjpegd_remove(struct platform_device *=
pdev)
>  	reset_control_assert(jpegd->resets);
>  	/* Suspends at once, a pending autosuspend does not keep it active. */
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }

[Severity: Medium]
Does this leave the hardware active and leak clocks on module unload?

If a job finishes and calls pm_runtime_put_autosuspend(), a delayed suspend
is queued. If the driver is removed before the timer fires,
pm_runtime_disable() cancels the pending autosuspend, but does not suspend
the active device.

Should the driver explicitly suspend the device synchronously before or
after disabling PM runtime?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-rockchip-j=
pegdec-v6-0-25f16dea1697@pengutronix.de?part=3D2
