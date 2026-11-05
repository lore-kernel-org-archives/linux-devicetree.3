Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841656;
	b=mow8n3YKGZV4Ludo/gPMY30fNoKaiRrX7qyTiMBKihRqHgoRwRT5sPLt4u9ukqf9TvRo
	 tanaTqOS0OGfHY+nm4bmjP/ur3BuiMc9FTOws70CuvCs337m4o5As1ykiIzk4SrL6vUvQ
	 +aHwcyTdLS9EYxnQTV34A/LE/kpP6aHBnCGVGCqPpZImhiwPLCHLgm1XjE7XxKWHVGPOj
	 dikt3+VLZkwcLhmCO2Zv3HVt8U3ziaIfxgQ+PzNLXgSwIjpRevSiIAKFAYMtd5QAvutbj
	 15T23Bu6G5ab7fEDUkPiaBi6zf77vY1JmgnZqARpJYaPe+m51LHtjvjTtWh3URf6Wfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841656;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=67/DhddsOxWP9zsaLstwYj171Xr65+ZA+kn2PoKaIY8=;
	b=OyiGSyDikuCt1rDO5HEJ58ac8ENxpYyu/LL+lKWX1ybNlAQTGruaVM2DT7ikKIpFatj+
	 OHKZ6rgTs6WbJK6H4u/69v33APLvhfX+Spis0GhRanc/JEe1uawtnCEFKGeNWY1ep2Z61
	 ZO1jqjIk1weZ07qPHanReWEIwBu1QLzqWCzYzo/LocqF1rHzuLP0FEuCPP6fddRRMe55G
	 mDwN5aJsQJ8A25P0PIZ1B7gQYJqgrC5W9tfdAchFtuJqFEAJhJIMX07AYHfQeMSzahHtA
	 LMYDQbXdIMQ30lEedBwHx+IfFY0o+3fpVQ4oedeWbTSndxd9RdVUhPs1wPyCxVLrA6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fbGHJXMc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF98606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 01:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fbGHJXMc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF741F00919;
	Thu,  5 Nov 2026 01:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793841655;
	bh=67/DhddsOxWP9zsaLstwYj171Xr65+ZA+kn2PoKaIY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fbGHJXMcRM1bcTie6CEDgJTyK5VoPudNeMzRVAC9NOOg8x2X6IJ4RCpZYFgptP0xX
	 Wv3VTloIAVyI4HosEPc0sH6r8dGMxYnjb7AuubHIHlMB4m84lpBxE11Tq2xIcc8dSJ
	 k++ZZ2VQ9nf3o2EtXrjRRQ8o7+UtpqAV5hytwGl08Lj50FWpmaXlHNzciPfuTnKSLE
	 B6MEzOh4d564Tj38IYSYxGe+yip2XnICGitZ0Mo1jWAXPdWnXh+aCx56ybc7EXYuqd
	 B9mGBSL6Ay0/LyXgZZmX3PoVkP9BIW8ngQj+x8R8K0nzzWZkPH8FbWLuVT3vlN6P20
	 Pdz7IkcOwtX/w==
Message-ID: <sashiko-outbox-198401@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/15] drm/rockchip: vop2: Reset AXI and DCLK to
 improve robustness
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-7-1bb63ef5766e@collabora.com>
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
 <20261105-dw-hdmi-qp-yuv-v6-7-1bb63ef5766e@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 01:20:55 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] drm/rockchip: vop2: missing of_node_put() on error in vop2_creat=
e_crtcs()
- [Medium] drm/rockchip: vop2: axi_rst pulsed in vop2_bind() without enabli=
ng aclk or PM
--

commit 7b3ce842063d5aafe025d15a4339ddc7bddb6893
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: vop2: Reset AXI and DCLK to improve robustness

This commit adds optional AXI and VP DCLK reset controls to the Rockchip VO=
P2
driver, pulsing the AXI reset during bind and CRTC disable and the VP DCLK
reset during CRTC enable to leave the hardware in a clean state.

> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index b85cd94d1e9d9..98430587a7abe 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c

[ ... ]

> @@ -2585,6 +2610,12 @@ static int vop2_create_crtcs(struct vop2 *vop2)
>  			return dev_err_probe(drm->dev, PTR_ERR(vp->dclk),
>  					     "failed to get %s\n", dclk_name);
> =20
> +		vp->dclk_rst =3D devm_reset_control_get_optional_exclusive(vop2->dev,
> +									 dclk_name);
> +		if (IS_ERR(vp->dclk_rst))
> +			return dev_err_probe(drm->dev, PTR_ERR(vp->dclk_rst),
> +					     "failed to get %s reset\n", dclk_name);

[Severity: Medium]
Does returning directly here leak the port device_node references acquired =
in
earlier iterations of this loop?

In vop2_create_crtcs(), each iteration for a connected video port acquires a
port reference at the end of the loop body:

drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:vop2_create_crtcs() {
	for (i =3D 0; i < vop2_data->nr_vps; i++) {
		...
		port =3D of_graph_get_port_by_id(dev->of_node, i);
		if (!port)
			return dev_err_probe(drm->dev, -ENOENT,
					     "no port node found for video_port%d\n", i);
		vp->crtc.port =3D port;
		nvps++;
	}
}

If devm_reset_control_get_optional_exclusive() fails on a subsequent iterat=
ion
(i > 0), vop2_create_crtcs() returns immediately to vop2_bind(), which also
returns the error without calling of_node_put() on vop2->vps[0 .. i - 1].cr=
tc.port
(a pre-existing issue also shared with the other early returns in
vop2_create_crtcs()).

> @@ -2944,6 +2975,13 @@ static int vop2_bind(struct device *dev, struct de=
vice *master, void *data)
>  		return dev_err_probe(drm->dev, PTR_ERR(vop2->pll_hdmiphy1),
>  				     "failed to get pll_hdmiphy1\n");
> =20
> +	vop2->axi_rst =3D devm_reset_control_get_optional_exclusive(vop2->dev, =
"axi");
> +	if (IS_ERR(vop2->axi_rst))
> +		return dev_err_probe(drm->dev, PTR_ERR(vop2->axi_rst),
> +				     "failed to get axi reset\n");
> +
> +	vop2_reset_assert_deassert(vop2, vop2->axi_rst);

[Severity: Medium]
As reported by Sashiko on v5 [1], can pulsing vop2->axi_rst here in
vop2_bind() take effect if the VOP2 power domain is powered down or
vop2->aclk is gated?

In vop2_bind(), vop2_reset_assert_deassert() is called before
pm_runtime_enable(&pdev->dev) and without resuming runtime PM or enabling
vop2->aclk. After vop2_probe() completes, genpd_dev_pm_sync() schedules
power-off for the RK3588_PD_VOP domain (which uses GENPD_FLAG_PM_CLK |
GENPD_FLAG_NO_STAY_ON), and the core clocks are only prepared and enabled
later in vop2_enable():

drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:vop2_enable() {
	ret =3D pm_runtime_resume_and_get(vop2->dev);
	if (ret < 0) {
		drm_err(vop2->drm, "failed to get pm runtime: %d\n", ret);
		return ret;
	}

	ret =3D vop2_core_clks_prepare_enable(vop2);
	if (ret)
		goto err_put_pm;
}

By contrast, vop2_disable() pulses vop2->axi_rst while runtime PM and the c=
ore
clocks are still active, and vop_initial() in rockchip_drm_vop.c resumes
runtime PM and enables hclk and aclk before pulsing resets. Should this res=
et
be performed while the power domain and aclk are enabled?

[1] https://lore.kernel.org/r/20261014-dw-hdmi-qp-yuv-v5-7-6fab0fe43a9b@col=
labora.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-dw-hdmi-qp=
-yuv-v6-0-1bb63ef5766e@collabora.com?part=3D7
