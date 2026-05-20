Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B7C39C00F
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779319762; cv=none; b=LHOBFeUJVizYdplChL6c6p88P7acPuxiW2MmdQ7Bbt954QFfhxXJS1JbGdh0c37ebBOVDJ5FVze8jNPPQiwsatPClMM/wrMsNbbX0CWytQUp5nAoKvyJYC0n78dtf9Ug4fUabs4K3zL6Jo4sdF9UFn9ZWWECsP744HF1XTIH6pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779319762; c=relaxed/simple;
	bh=VwwIQZ6JdkdrXUp9hI1OWEvUZbEVfrM7bF97IYhbZMM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iehkKn+X8z8LHA20yyrc/P6Wgf2GYoMtyt4uqPhTjyiirEtTvwQiTTcQPjT1Udw6NuYvqEr+TizMEYOeq+LETgxpxZ6PYh1rU0OCXigKds1aD4dq6qXfOjs9sOyKzsN7DRWtACjCwTCj17brwrMDZaPzALmUdHYhCeb9gX+9Uq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YB9K+nX6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YB9K+nX6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC4A21F000E9;
	Wed, 20 May 2026 23:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779319761;
	bh=mzw7Ng5+LpUGYRwV5Gm7nHqJ4NSKORw0Rdf0833n480=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YB9K+nX6zCzZlmClMiH/Oie+iCeTvgylpJ6IDNsHpKP9P8cp/s+5l5laLIM8c1Cvk
	 KS9jRbDfqc5IesZCjnvfo5SvC7JsiGjih6BZrx4pubpCzjQ7mnmhEQzGe/89roNOHK
	 hf2BCM5Ig/ciD2M9YECXrnJ0gw6v/EFtUwnsMEFWkJZL7tpiTD0grwWOMQe+Bp8tCq
	 /X1sP4xYtbQWd7ZrHL9IJgJqmPjWMPRAm7RaeXYcgJNbfp5TcOAxVY/qgnhL/dJ0We
	 Ep1U9YeFjWW7aX3F/ZTW/RTkCNdof5WteXJ3HmkP9OwKtyriOcbLZXVyFtewU66GpL
	 KGcKOJlxLXb9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 18/28] media: rockchip: rga: use card type to specify
 rga type
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260521-spu-rga3-v7-18-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-18-3f33e8c7145f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 23:29:20 +0000
Message-Id: <20260520232920.EC4A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Critical] Changing the V4L2 capability `card` name from `"rockchip-rga"`=
 to `"rga2"` breaks existing userspace applications matching on the origina=
l card name.
- [Medium] The patch updates the `card` field in `vidioc_querycap` to use `=
card_type` but fails to update the `name` field in the underlying `struct v=
ideo_device`. This leaves sysfs and the ioctl out of sync.

Pre-existing issues:
- [High] The driver incorrectly uses dma_sync_single_for_device() on a DMA =
buffer allocated with dma_alloc_attrs(..., DMA_ATTR_WRITE_COMBINE).
- [High] The interrupt handler warns if the context or buffers are NULL, bu=
t fails to abort, leading to immediate kernel panics upon dereferencing the=
m.
- [High] MMIO registers are unconditionally accessed without ensuring that =
device power domains and clocks are enabled.
- [High] Hardware resets are asserted and deasserted before device clocks a=
re enabled.
--

commit affdef8a4b194a7e1143a9a140724a4fc44d285b
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: use card type to specify rga type

This commit adds a card_type field to the rga_hw struct to prepare for
RGA3 support. It updates the V4L2 capability card field to use this
hardware-specific type string, intending to allow userspace to
differentiate between RGA2 and RGA3 device nodes.

> In preparation of the RGA3 support add a filed to the rga_hw struct
> to specify the desired card type value. This allows the user to
> differentiate the RGA2 and RGA3 video device nodes.

[Severity: Medium]
Will this leave the sysfs name out of sync with the V4L2 capability,
preventing the differentiation goal described here?

During device registration in rga_probe(), the struct video_device
inherits its name from rga_videodev.name, which remains hardcoded to
"rockchip-rga". Consequently, /sys/class/video4linux/videoX/name will
still return "rockchip-rga" for all versions, which prevents udev rules
from differentiating the nodes using sysfs attributes. Should vfd->name
be updated dynamically during probe?

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 22954bbae55fc..91775b43ff617 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -354,8 +354,10 @@ static const struct v4l2_file_operations rga_fops =
=3D {
>  static int
>  vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *c=
ap)
>  {
> +	struct rockchip_rga *rga =3D video_drvdata(file);
> +
>  	strscpy(cap->driver, RGA_NAME, sizeof(cap->driver));
> -	strscpy(cap->card, "rockchip-rga", sizeof(cap->card));
> +	strscpy(cap->card, rga->hw->card_type, sizeof(cap->card));

[Severity: Critical]
Does changing the card name from "rockchip-rga" to "rga2" break existing
userspace applications?

The V4L2 capability card string is part of the user-space ABI. Existing
userspace tools or udev rules expecting the original string might fail to
recognize the device, potentially causing an ABI breakage.

>  	strscpy(cap->bus_info, "platform:rga", sizeof(cap->bus_info));
> =20
>  	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but does this driver incorrectly use
dma_sync_single_for_device() on a DMA buffer allocated with
dma_alloc_attrs(..., DMA_ATTR_WRITE_COMBINE)?

Calling streaming DMA sync functions on addresses returned by coherent
allocations violates the DMA API. Should a memory barrier like wmb() be
used instead?

[Severity: High]
This isn't a bug introduced by this patch, but does the interrupt handler
fail to abort when the context is NULL?

Looking at rga_isr(), if rga->curr is NULL, the code emits a WARN_ON(!ctx)
but does not return, and proceeds to dereference ctx in ctx->fh.m2m_ctx.
Can this lead to an immediate kernel panic if a spurious interrupt arrives?

[Severity: High]
This is a pre-existing issue, but are MMIO registers unconditionally
accessed without ensuring device power domains and clocks are enabled?

The driver relies on pm_runtime for clock management and drops its PM
reference at the end of rga_probe(). It appears pm_runtime_get_sync()
is not called before writing to hardware registers in the device_run()
callback or when opening the device. Can this trigger a synchronous
external abort if a shared or spurious interrupt arrives while the device
is suspended?

[Severity: High]
This isn't a bug introduced by this patch, but are hardware resets asserted
and deasserted before device clocks are enabled?

In rga_parse_dt(), the core, axi, and ahb reset controllers are triggered
before pm_runtime_enable() is called to enable the RGA clocks. Since
hardware reset logic often requires clocks to be active, does toggling
resets with gated clocks leave the hardware in an undefined state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-spu-rga3-v=
7-0-3f33e8c7145f@pengutronix.de?part=3D18
