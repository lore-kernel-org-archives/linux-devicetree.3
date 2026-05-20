Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612A73A453F
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779320596; cv=none; b=EhO/pJKPI3VKnc1++Vt4tqbli7D9igWIC7s4vJRRh94VIissklp9EO03nDGB2aj8gFqkWc1K+gAf3FL5XQfhzqPB9AaZj+wAkf+K0ozK3raXvDfEAlWhjtd9toeJYXDDd2Oe42qM14+Vqejsl6qTRJZqdLz5ozrX9CToRkXWTKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779320596; c=relaxed/simple;
	bh=QCQ1mswDZYOd714Qbd0tB+AOwBGnQn0w4CRVgW/9eRc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ke7Za7ur6HL+tlSlb7nt/+DMCNBmysNSReXucADwbnYFGxf8sE9X1KZAbJomRWrVTHSuLyc1MPR33Z0e+Ng9/p/pbjiH+jXwT2QguQlbOa2bx7XpLOVlUi7cVGql4i6TPdHmr7tFTwN+ItViJTLn2/G1MfoeYnvegETKSRodlHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFGHAOwG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFGHAOwG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 179711F000E9;
	Wed, 20 May 2026 23:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779320595;
	bh=gt7DEeArdQlgzhvjI5nSWFrZ2OM+npyCe/dtRPeb4f8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZFGHAOwG8H/5rZseUqeoLD7s2UklXC+kiCXIaCiqZNWC7lo8rMEm8DNWWndSvWwVd
	 v4AstiiIbQhJ0ksSvAz+zN3OgIeRAUUkyQ5I81Y6P0tDjNtvFdUyv3Mku+xFGq5Yi+
	 EbNPh2P0stRSz5O7q8jIFTZoAvzR7H+U4zU5EDd9URsY4YK7pJshP5G8MSja7G6Xqq
	 hHPr8yyKGtyWfnmkSZ/R3u0m0rDZPK8T4YTl3sLv+JaJWoyUKTZo0NOYx91MY2cgTO
	 gCPU4d39GEw+/5mG2znawnVvDEXcvuOrnmCuyW9lKf6UjcSmf3lbtE1kl3ZhjfaiKH
	 Xv4QfstHShF8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/28] media: rockchip: rga: fix too small buffer
 size
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-spu-rga3-v7-6-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-6-3f33e8c7145f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 23:43:14 +0000
Message-Id: <20260520234315.179711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Teardown asymmetry and Use-After-Free during device unbind due=
 to premature resource release.
- [Critical] Use-After-Free of the main rockchip_rga structure due to devre=
s lifecycle mismatch.
- [High] DMA API violation and potential out-of-bounds memory invalidation =
on command buffer.
--

commit f24ab77ddd82ca43a87c0f75d653428b04cd703c
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
Subject: media: rockchip: rga: fix too small buffer size

This commit fixes the RGA_CMDBUF_SIZE macro to represent the command
buffer size in bytes rather than in number of u32 elements. It adjusts
the memset() in rga_cmd_set() to use the correct byte size.

> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index 43ed742a16492..d1618bb247501 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -414,7 +414,7 @@ static void rga_cmd_set(struct rga_ctx *ctx,
>  {
>  	struct rockchip_rga *rga =3D ctx->rga;
> =20
> -	memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
> +	memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);

[Severity: High]
This isn't a bug introduced by this patch, but I noticed the driver
allocates the command buffer using dma_alloc_attrs() with
DMA_ATTR_WRITE_COMBINE, yet it calls dma_sync_single_for_device() later
in this function:

	/* sync CMD buf for RGA */
	dma_sync_single_for_device(rga->dev, rga->cmdbuf_phy,
		PAGE_SIZE, DMA_BIDIRECTIONAL);

The DMA API prohibits calling streaming sync functions on coherent or
write-combined allocations.

Because the memory is mapped as write-combined, the implicit write barrier
provided by writel() when writing to the command register should be suffici=
ent
to drain the write buffers, making the sync unnecessary.

Additionally, the sync size is hardcoded to PAGE_SIZE (4096 bytes) instead
of the actual buffer size. If the system allocator packs small allocations
into a sub-page coherent pool, syncing 4096 bytes could cause out-of-bounds
cache invalidation for adjacent memory objects.

Could we remove this unnecessary sync or switch to a proper streaming DMA
allocation?

> =20
>  	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
>  	/*

Additionally, while reviewing the driver, I noticed a couple of other
pre-existing lifetime and teardown issues:

[Severity: Critical]
This is a pre-existing issue, but I noticed a potential use-after-free
during device unbind due to premature resource release.

In rga_remove(), the driver tears down core resources by calling
v4l2_m2m_release(rga->m2m_dev) before video_unregister_device(rga->vfd).

Because the video device is still registered, user space could issue an ioc=
tl
(e.g., VIDIOC_QBUF) concurrently.

The V4L2 core routes this to the m2m handlers, which would dereference the
already-freed m2m_dev.

Furthermore, the hardware isn't stopped and the devres-managed IRQ isn't
disabled during teardown. If an active hardware job completes after
rga_remove() returns, the interrupt handler will access freed memory.

Should the driver unregister the video device and halt the hardware before
releasing the m2m context?

[Severity: Critical]
This is a pre-existing issue, but there appears to be a use-after-free
vulnerability related to the devres lifecycle of the main rockchip_rga
structure.

The core device structure (struct rockchip_rga) is allocated using
devm_kzalloc(), which tightly binds its lifetime to the platform device.

However, the V4L2 character device can be held open by user space
independently of the hardware's bind/unbind lifecycle.

If the platform device is unbound, rga_remove() executes and the devres
manager frees the rockchip_rga structure immediately.

When user space later closes its file descriptor, the V4L2 release callback
(rga_release()) is invoked and attempts to acquire a mutex
(mutex_lock(&rga->mutex)) embedded within the already-freed structure.

Should the core structure's lifetime be decoupled from devres and instead
be reference-counted?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-spu-rga3-v=
7-0-3f33e8c7145f@pengutronix.de?part=3D6
