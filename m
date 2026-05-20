Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287CA33B951
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779320547; cv=none; b=LEVDbI5rdpPMC1az9iUcgpuGpFl+UI+wf2kaWMJWeXK3jfC0pNOPSAc1zGt6iGKiL146GQQG8ZFK9mPJA5HRjsJhYSYmFkKlttcalzfycjeBUU5wWod8qXQbQce/yz7++BMaVo1pskrAw8CAroHtFYOKo9dbZtNZAklfljBLGfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779320547; c=relaxed/simple;
	bh=WJmvhEEKRZ3ewNQZ6Qmfyi7mVRdL+OVnDtYQTXRqXkQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HijHDGz8J4ii87YlRWlLyGhr5wGCiVOUeESKNsSXzT7ey6S4AiUlsaCYTXp7zpYypT4rXnNFMY+P4g/oT5MTaYk468zzeC4zmpeFDJg2gRvQVbxFV/FHme264SSZMIneC2YJAwJPDC/hCrguNsCpVF7JulRq6GJAuDdWpl28X1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0+Dt4Tc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0+Dt4Tc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995A11F000E9;
	Wed, 20 May 2026 23:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779320545;
	bh=XuyD/luNwXmJIrgVd9WlQJkm4uC8hlMB6VU4qOkL0lc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h0+Dt4TcIpR/AFnPYBeTPYXM8OSNSVweMdc8KzzTz8CI3+3bJY/K6Mogp4WvUB3X2
	 KCzwbabvbb838inUUG9JE71h6b1L5HOLKC5DOVslMDz2B6w8fEb48N1m1xtcBCLSlt
	 mneUFjCjELMtbEurZL448JbrS41dUIv819W9AHmlx7fEz8i4/JELjm82pUpOm3P0r/
	 GUJdQHYV0HlNlJKOrWL78B4KiasuRBJj8OYO4fbTQn/jyoFtJCXy8bz/jdQU0Px10M
	 wxwHK2MW+5n1myMcfU5pbWynjPJ346ybPhABFdpNyUw/rjq87uMfMANR/Zo/1zL6L6
	 vgVGb6iA6+flQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 25/28] media: rockchip: rga: add feature flags
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521-spu-rga3-v7-25-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-25-3f33e8c7145f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 23:42:25 +0000
Message-Id: <20260520234225.995A11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The return value of `rga_setup_ctrls()` is ignored in `rga_open()`=
, leading to a Use-After-Destroy vulnerability if control initialization fa=
ils.
- [High] The mem2mem device is released before the video device is unregist=
ered in `rga_remove()`, leading to a Use-After-Free.
- [High] The main driver structure `rockchip_rga` is managed by devres (`de=
vm_kzalloc`) but accessed by V4L2 file operations, causing a Use-After-Free=
 on unbind.
- [High] Streaming DMA synchronization is incorrectly called on coherent me=
mory allocated with `dma_alloc_attrs()`, and placed after triggering the ha=
rdware.
--

commit c9c0ebd48cb930bc4deb38afc01630239c973c0d
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: add feature flags

In preparation to the RGA3 addition add feature flags, which can limit
the exposed feature set of the video device, like rotating or selection
support. This is necessary as the RGA3 doesn't initially implement the
full feature set currently exposed by the driver.

[ ... ]

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 1878b4e26360b..8d60e94da32d8 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -177,17 +177,21 @@ static int rga_setup_ctrls(struct rga_ctx *ctx)
> =20
>  	v4l2_ctrl_handler_init(&ctx->ctrl_handler, 4);
> =20

[ ... ]

>  	if (ctx->ctrl_handler.error) {
>  		int err =3D ctx->ctrl_handler.error;
> =20
>  		v4l2_err(&rga->v4l2_dev, "%s failed\n", __func__);
>  		v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>  		return err;
>  	}
> =20
>  	return 0;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does ignoring the return val=
ue
of this function in rga_open() lead to a use-after-destroy vulnerability?

drivers/media/platform/rockchip/rga/rga.c:rga_open() {
...
	rga_setup_ctrls(ctx);

	/* Write the default values to the ctx struct */
	v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
...
}

If rga_setup_ctrls() fails, it calls v4l2_ctrl_handler_free() which destroys
the control handler's embedded lock. Since rga_open() ignores the error and
continues to v4l2_ctrl_handler_setup(), will it attempt to acquire the
destroyed lock?


[Severity: High]
This is a pre-existing issue, but does the teardown order in rga_remove()
cause a use-after-free if the device node is held open?

drivers/media/platform/rockchip/rga/rga.c:rga_remove() {
...
	v4l2_m2m_release(rga->m2m_dev);
	video_unregister_device(rga->vfd);
...
}

If the mem2mem device is released before the video device is unregistered,
could a userspace process with an open file descriptor trigger a
use-after-free when closing it? The rga_release() file operation dereferenc=
es
the freed m2m_dev via v4l2_m2m_ctx_release().


[Severity: High]
This is a pre-existing issue, but does managing the main driver structure
with devres lead to a use-after-free on unbind?

drivers/media/platform/rockchip/rga/rga.c:rga_probe() {
...
	rga =3D devm_kzalloc(&pdev->dev, sizeof(*rga), GFP_KERNEL);
...
}

When the driver is unbound, devres automatically frees the memory. Since
the v4l2 framework allows video device file descriptors to outlive the
driver unbind process, could a userspace application close a lingering file
descriptor and call rga_release() on the freed rga structure?


[Severity: High]
This isn't a bug introduced by this patch, but is streaming dma
synchronization incorrectly used on coherent memory?

drivers/media/platform/rockchip/rga/rga-hw.c:rga_hw_setup_cmdbuf() {
...
	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);

	/* sync CMD buf for RGA */
	dma_sync_single_for_device(rga->dev, ctx->cmdbuf_phy,
				   PAGE_SIZE, DMA_BIDIRECTIONAL);
...
}

Since the command buffer is allocated using dma_alloc_attrs() with
DMA_ATTR_WRITE_COMBINE, is it valid to call dma_sync_single_for_device()
on it? The dma api prohibits calling streaming sync functions on addresses
returned by coherent allocation functions. Also, is it problematic that
the sync happens after writing the dma address to the hardware register?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-spu-rga3-v=
7-0-3f33e8c7145f@pengutronix.de?part=3D25
