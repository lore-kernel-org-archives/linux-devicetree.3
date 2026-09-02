Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B130746C822
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 23:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390118; cv=none; b=JiSlCbHCrzHliiqnS27u9iGV2M3Bo5undtZOjYO/LiF02OMpr+17JZ+lMrnfQVUxrOkw65GZY+MOlC/Je4NQy2J2F9fwJ5qO12fb++TrdsUgKTC4Nk2prV0gt7g7Sf45p3d1/pFz6qMvemTL5hDWWIqYrp0kFixclETeyi6Xp5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390118; c=relaxed/simple;
	bh=cmLQWDSI1eR/OJ6ZnaCjO8IVh4U76RYWo/Np2is3JJI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WKTVP+7slwm2yuNTYNgssxMG6S2Z4YS/QrrYsmGiuAbGim6OXDVfbnEziAOrJ4fhWmWaUvOS4ddeIwCRl05lnrygBBBnA0US/Zx4C1pYRp36IQTqy2lCm9Y1JL4n0fNy50O2scPwqOPX9aFxEZ3ZBgFuzKqBp0AvPVhguQqtWHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxBoe/D7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxBoe/D7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C29E61F000E9;
	Wed,  2 Sep 2026 23:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788390107;
	bh=2xxJ3vXyS2cx7QfAvvt1AgbxxFY+sQkBBJ+l79+1XpM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GxBoe/D71YkQcoe7v+oSvbiJ6Wa9KB2aaxZ6x3KJSGldBmXP359FJw9aGrqw1UUAv
	 FD37s64fNPjJC+hNbdLLCAeiKvfWXh0qb8L0sPGpJfhFmKpmAnGm+xURnetdMlTr4A
	 fV/YF8UNPt1Dg/6saLaHxJb1uhMdmNtlBcnBngZBl922WPyPa0zompDaSdgkn4iivH
	 Tzw4qqPr8X9Qvo0t74iB7TJNzLTlNkuR9mlIorbaVtD64e0ZQyRXR0oKoeD/7PrrBt
	 Z7t8i14wMaYaS4sDLhtw7f709SX3A8+P5S3B5Sn4r0syoHwaQquxtSsRZIzDTm3kJS
	 +CMNyHSuu0mVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/14] drm/rockchip: vop2: Consolidate HDMI PHY PLL
 clock parent switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260903-dw-hdmi-qp-yuv-v4-9-fb45bf4147eb@collabora.com>
References: <20260903-dw-hdmi-qp-yuv-v4-0-fb45bf4147eb@collabora.com>
 <20260903-dw-hdmi-qp-yuv-v4-9-fb45bf4147eb@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 23:01:46 +0000
Message-Id: <20260902230146.C29E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Sleeping functions clk_set_parent() and mutex_lock() called from C=
RTC atomic enable callback.
--

commit afbd808f729085c5fb27d8d2795c3ac8b9bd1609
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: vop2: Consolidate HDMI PHY PLL clock parent switch

This commit refactors the DCLK parent switch logic for HDMI0 and HDMI1
PHY PLLs into a single shared code path instead of repeating the parent
selection and clock switch for each endpoint.

> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1964,42 +1964,34 @@ static void vop2_crtc_atomic_enable(struct drm_cr=
tc *crtc,
[ ... ]
> +		if (pll_hdmiphy) {
> +			if (!vp->dclk_src)
> +				vp->dclk_src =3D clk_get_parent(vp->dclk);
> +
> +			ret =3D clk_set_parent(vp->dclk, pll_hdmiphy);

[Severity: High]
This is a pre-existing issue, but does calling clk_set_parent() in this
function violate atomic context rules?

The vop2_crtc_atomic_enable() callback runs in an atomic context during a
display modeset, where sleeping is strictly forbidden by DRM subsystem
guidelines.=20

Because clk_set_parent() might sleep, could this lead to system instability,
potential deadlocks, or kernel warnings when reconfiguring the display?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-dw-hdmi-qp=
-yuv-v4-0-fb45bf4147eb@collabora.com?part=3D9
