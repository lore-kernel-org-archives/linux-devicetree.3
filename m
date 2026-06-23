Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADED35675B
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 20:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246045; cv=none; b=ceydKppxsh8QcA72JuC1Nd9gxh8xgxrKuaEZZU+o1L8Udn5cNTTfONunsdYnLNYP8+F8bAXsmdMAguLLUzrTBZyaTh0eDVWLuPFMtzioOTQbHFmsF7h3O3sh0GHBTkbWm46cfAmT4tuAsE1kaPEOMixrizaIRORrxfYpzzedjy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246045; c=relaxed/simple;
	bh=+K8tuW2455goyzyLvYmvUvRgKVfZh/aJBCbvmF9tABE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SbTpoTpwbxneMUwIOQZ4tr8smdwf4VIs4HRuIURGEvEqq7tfCxnghJ0E5Zt5X0yNdcwUhFn5QBYWnws07j4bhKd0nJv7SNjHz/Xd9fSxUTybUqcCI0fSyTCAEa9lb6NBfeTSn8pxRkp6hTlEZdz/cCdTRfMVMILlMLMeQ9HKl9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZbxA+xvn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZbxA+xvn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFE21F000E9;
	Tue, 23 Jun 2026 20:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782246043;
	bh=VpHUaNWePYf2H4z+8r7fDXexwC6n6eCmfj8CaUM1zCk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZbxA+xvnL/GsYgdQhoGfbVsKWJtRAY2IBg3SztszAodhg/8rvKroZiFVuwvjYWdYT
	 B08wRUwGMPG/ML9ADN6n3kT6qrHtMSSo7NywTljltnhtxWgjymH0CSvZsET3b2FSoL
	 dEOGV6+g9jFGi4IU1v4HYeQua5BwsdVj2N/AjQM/BE6uBPUjQPBcXQFz92MI4Wweqs
	 WrU6X3vxXq9I4MQ9F+3dn3EbPSjUN9mybra/9g0gD/Xq7/u5oiUb2gQWtuuUUaFYao
	 cmHwI3cC+CrmTE0BZANCf60Vv6gPmAY7/3xpBoLKxVtZOb3BVj6JuaYqb+/elOhXtx
	 iWVWUuiqVYLHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/9] drm/rockchip: vop2: Reset AXI and DCLK to improve
 robustness
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260617-dw-hdmi-qp-yuv-v1-2-a665cfd06d7d@collabora.com>
References: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
 <20260617-dw-hdmi-qp-yuv-v1-2-a665cfd06d7d@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 20:20:43 +0000
Message-Id: <20260623202043.8BFE21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] AXI reset is performed after detaching the IOMMU domain, risking m=
emory corruption.

Pre-existing issues:
- [High] Unpowered hardware access and unbalanced PM runtime usage due to i=
gnored error in vop2_enable().
- [High] Clock enable count underflow and resource tracking mismatch on ear=
ly return in vop2_crtc_atomic_enable().
--

commit 13864800def8231541cc3847f090a3ab6ab365c2
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: drm/rockchip: vop2: Reset AXI and DCLK to improve robustness

Assert the AXI reset in the CRTC disable path, and the VP DCLK reset in
the enable path. These resets are intended to leave the hardware in a clean
state for the next use, helping recover from exceptions such as IOMMU page
faults.

> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 4cce3e336f5b3..2833fb49ad81a 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c

[ ... ]

> @@ -938,6 +959,8 @@ static void vop2_disable(struct vop2 *vop2)
>  {
>  	rockchip_drm_dma_detach_device(vop2->drm, vop2->dev);
> =20
> +	vop2_clk_reset(vop2, vop2->axi_rst);
> +

[Severity: High]
Does asserting the AXI reset here risk memory corruption?

If the AXI master is recovering from an exception and still issuing DMA
requests, detaching the IOMMU domain first leaves a window where the master
could access physical memory without translation.=20

Could this lead to memory corruption or spurious page faults? Should the AXI
master be explicitly reset before the IOMMU is detached?

>  	pm_runtime_put_sync(vop2->dev);
> =20
>  	regcache_drop_region(vop2->map, 0, vop2_regmap_config.max_register);

[ ... ]

> @@ -1948,6 +1971,8 @@ static void vop2_crtc_atomic_enable(struct drm_crtc=
 *crtc,
> =20
>  	vop2_crtc_atomic_try_set_gamma(vop2, vp, crtc, crtc_state);
> =20
> +	vop2_clk_reset(vop2, vp->dclk_rst);
> +

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for unpowered
hardware access to cause a crash if vop2_enable() fails?

In vop2_enable(), if pm_runtime_resume_and_get() or clock preparation fails,
it logs an error and returns void. However, vop2_crtc_atomic_enable()
unconditionally increments vop2->enable_count and continues configuring
hardware:

	if (!vop2->enable_count)
		vop2_enable(vop2);

	vop2->enable_count++;

Since the power domain and core clocks would remain off on failure, could t=
he
subsequent writes to VOP2 hardware registers trigger a synchronous external
abort and crash the system?

[Severity: High]
This is a pre-existing issue, but can an early return in
vop2_crtc_atomic_enable() cause severe state mismatches?

If clk_prepare_enable(vp->dclk) fails earlier in this function:

	ret =3D clk_prepare_enable(vp->dclk);
	if (ret < 0) {
		drm_err(vop2->drm, "failed to enable dclk for video port%d - %d\n",
			vp->id, ret);
		vop2_unlock(vop2);
		return;
	}

The function returns early without updating state properly. During disable,
vop2_crtc_atomic_disable() blindly decrements the tracking state:

	clk_disable_unprepare(vp->dclk);

	vop2->enable_count--;

	if (!vop2->enable_count)
		vop2_disable(vop2);

If another CRTC is active, couldn't this underflow or prematurely drop the
count to 0, unintentionally shutting off core clocks and PM runtime for the
actively running CRTC?

>  	drm_crtc_vblank_on(crtc);
> =20
>  	vop2_unlock(vop2);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-dw-hdmi-qp=
-yuv-v1-0-a665cfd06d7d@collabora.com?part=3D2
