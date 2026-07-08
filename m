Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E3336EA84
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 22:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783548453; cv=none; b=oXSzS8sJ+Hgk2sU5KgCws1GvbqZHdfon+ubeeTie/kub7q/LeVHTaujAzplTqi1MP+0QE2gT8nmatyobDL5XaHsgOvzBpPZeWcNbLyZVjwG3Czb/KBsvxOUVggYfdrS8smmN92m1PYmDeeKOk3At1Uo+5DdKbWTl6uh6yQr8I1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783548453; c=relaxed/simple;
	bh=pEqLiL3vpU0PX3L1DlOmX3No2FisODlZXMa3lMc0PJ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=epqmgzfpNUEbQx4hpf8kWTzOJUKQH6nv3XkQwriuvYQUtl3LiuQ7AufRYF1W2o60kBg7/GqNgTyxYHy3kc5t9fUrxvov5mTPLq0Ov952vLjD5Ccs6t87UNNaa/dTSuh3acVH1jJCAwF0ojt6AXSPnMy68X0TI/inz0vAN/h2Tao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TGIVFml1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TGIVFml1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEF31F00A3A;
	Wed,  8 Jul 2026 22:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783548452;
	bh=3fpbC/Z0mJGQm7aVImQX8xB7NVoKCka3RpMX/M6VdYA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TGIVFml1zwFWa1SgzsQmBn8eTvtBCf5jvi7gYl5eFxjF1Rf+ciy2xbEizKWWupJ4e
	 wiA3DTPc8CFsLv/PxarOX1n2T6jlrFjIgcTMMC54W3R8NNgDvSBgdT19/aiUEA7yg0
	 sEggF1vWO9Qelwz1AGs9R1cElev2q5ikq0tLvk4F62lOBvBO7xlkG2TJiCfOZvEAP1
	 YWz50at/mqe7oFdxcic/qQ2ylEZjFRjSlaC0OdrqnY2/gtPraw4ybla/Eviv4E90jP
	 oLCLo2503hXgCNXMXq41NxEeHL0VTgRqsVT+6y+9UJmNCgRMII3rIzzHmD1nFxJ5Kr
	 ziUge/BaPjrLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/14] drm/rockchip: vop2: Avoid division by zero
 when computing max_dclk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260709-dw-hdmi-qp-yuv-v3-5-a4a982a9f2e7@collabora.com>
References: <20260709-dw-hdmi-qp-yuv-v3-0-a4a982a9f2e7@collabora.com>
 <20260709-dw-hdmi-qp-yuv-v3-5-a4a982a9f2e7@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 22:07:31 +0000
Message-Id: <20260708220731.9DEF31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The expression `VOP2_MAX_DCLK_RATE * 8` silently overflows `unsign=
ed long` on 32-bit architectures, resulting in a drastically lower `max_dcl=
k` value.
- [High] The CRTC atomic enable callback invokes multiple sleeping operatio=
ns while executing in an atomic context.
--

--- Patch [5]: [PATCH v3 05/14] drm/rockchip: vop2: Avoid division by zero =
when computing max_dclk ---
commit ba0b89bfb2234e515bb1a3e786beceb00c9813f0
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: vop2: Avoid division by zero when computing max_dclk

The commit modifies vop2_crtc_atomic_enable() to avoid division by zero
when vcstate->output_bpc is 0 by defaulting bpc to 8. This happens when
the CRTC drives a non-HDMI output.

Link: https://lore.kernel.org/all/20260623203310.9F8C81F000E9@smtp.kernel.o=
rg/

> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 4bb1985b87267..e9f5d015b6458 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1931,8 +1931,9 @@ static void vop2_crtc_atomic_enable(struct drm_crtc=
 *crtc,
>  	 * to 4K@60Hz, if available, otherwise keep using the system CRU.
>  	 */
>  	if (vop2->pll_hdmiphy0 || vop2->pll_hdmiphy1) {
> -		unsigned long max_dclk =3D DIV_ROUND_CLOSEST_ULL(VOP2_MAX_DCLK_RATE * =
8,
> -							       vcstate->output_bpc);
> +		unsigned int bpc =3D vcstate->output_bpc ?: 8;
> +		unsigned long max_dclk =3D DIV_ROUND_CLOSEST_ULL(VOP2_MAX_DCLK_RATE * =
8, bpc);

[Severity: High]
This is a pre-existing issue, but does VOP2_MAX_DCLK_RATE * 8 silently=20
overflow unsigned long on 32-bit architectures?

Since VOP2_MAX_DCLK_RATE is 600000000UL, multiplying by 8 mathematically=20
yields 4,800,000,000. On 32-bit architectures, this wraps around to=20
505,032,704 before being passed to DIV_ROUND_CLOSEST_ULL(), which would
result in max_dclk being ~63 MHz instead of 600 MHz.

Could this prevent higher resolutions like 1080p and 4K from being=20
configured properly on 32-bit kernels?

> +
>  		if (clock <=3D max_dclk) {
>  			drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mas=
k) {
>  				struct rockchip_encoder *rkencoder =3D to_rockchip_encoder(encoder);

[Severity: High]
This is a pre-existing issue, but does vop2_crtc_atomic_enable() execute=20
sleeping operations within an atomic context?

Looking earlier in vop2_crtc_atomic_enable():

	vop2_lock(vop2);

	ret =3D clk_prepare_enable(vp->dclk);
	if (ret < 0) {

The function unconditionally acquires a mutex via vop2_lock() and calls=20
clk_prepare_enable(), which can sleep. Since CRTC atomic enable callbacks
execute in an atomic context during non-blocking commits, could this cause
system instability or deadlocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-dw-hdmi-qp=
-yuv-v3-0-a4a982a9f2e7@collabora.com?part=3D5
