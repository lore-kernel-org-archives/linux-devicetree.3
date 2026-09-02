Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E47453A3B
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 23:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390113; cv=none; b=MEdgjxdzDssDAAz2URFR3VJPPaxIhLMomhPffzgodzTyGgBQndJbLjDIpNrU19BeahJ72s6FhpkXU8OqNlmrKV5Q0zDDZ6WMfoTIS/b+KYn4kXRB9yUnS4d4UtF+B84SIhK17P4UE16WhghXfxH6EMrzEdQHjaS6Q8QIbAbv/9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390113; c=relaxed/simple;
	bh=/QAKvo1IKQo8g6v2fOUzcpkSKGKzz+zugHV9I3rEO2w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LxfJ/tiAw2cJKkEPpRjI2JXzW3pkjsYbYZHMgfjnImZ9oOO4wK3Y+fXa9ZVMo4wgbQfLiPm12zBeu8sRztBJ/yRa/BcW7/t0TkrRFaYviXJItY+qqJsvVpTR6ppN9q6eQ6FxfjAW0VUpB4EjTq8A6qEQJm8MPhHppBgVIo/tvQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYIzjrlR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYIzjrlR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54D61F00A3D;
	Wed,  2 Sep 2026 23:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788390096;
	bh=tR6mwiMSkS5vBeij9jZpHKCQX6tqW69OwpHzizbKZNM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eYIzjrlRCPhDcnSEW5EhY5guhJy/9cCl9dxx/xfqInk/0Q/MJA8y/gTEM0skLZCbJ
	 U5d8d572BfguQwdoCGdKl3Um0iGBFmrRTvCyGqCV7svOFF7soDAJ9iWqM9Nj5qPgon
	 y0eYrtiv6jt/OHyV8LhvyD46zeCM6pcXZeoSFzuVuGL6LMfeJtAQZl2U3zL6WhFPZf
	 FrGRsoVO2xIC65QGERMZ1aJmVEtxllXM0ag+XUUGnZCLCzLYFsNWXYbNocKv4CzfRQ
	 8ieUbHIXA5drCADfN46Dh/l19rCIZ/SYQ1Q/D9Wh1lG+vZ75Kzs1K7nqaF8bIWysH6
	 WbXa72pALGYUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/14] drm/rockchip: vop2: Fix VOP2_MAX_DCLK_RATE
 overflow on 32-bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260903-dw-hdmi-qp-yuv-v4-6-fb45bf4147eb@collabora.com>
References: <20260903-dw-hdmi-qp-yuv-v4-0-fb45bf4147eb@collabora.com>
 <20260903-dw-hdmi-qp-yuv-v4-6-fb45bf4147eb@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 23:01:35 +0000
Message-Id: <20260902230135.E54D61F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the DRM subsyste=
m guidelines explicitly designate CRTC atomic enable and disable callbacks =
as executing in atomic context where sleeping is forbidden. However, `vop2_=
crtc_atomic_enable` and `vop2_crtc_atomic_disable` invoke multiple sleeping=
 functions. For example, both callbacks invoke `vop2_lock()` (which acquire=
s a mutex). `vop2_crtc_atomic_enable` calls `clk_prepare_enable()`, and `vo=
p2_crtc_atomic_disable` calls `wait_for_completion_timeout()`.
--

commit 42f6f5bd762f8191ecc03127da51288c0ad3ea76
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: vop2: Fix VOP2_MAX_DCLK_RATE overflow on 32-bit

This commit modifies the VOP2_MAX_DCLK_RATE macro to use an unsigned long=20
long suffix. This ensures 64-bit arithmetic is used during clock rate=20
calculations, preventing integer overflows on architectures where unsigned=
=20
long is 32-bit.

Link: https://lore.kernel.org/all/20260623203310.9F8C81F000E9@smtp.kernel.o=
rg/

> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 12a6341e3c988..c3f72cac63690 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -102,7 +102,7 @@ enum vop2_afbc_format {
>  	VOP2_AFBC_FMT_INVALID =3D -1,
>  };
> =20
> -#define VOP2_MAX_DCLK_RATE		600000000UL
> +#define VOP2_MAX_DCLK_RATE		600000000ULL

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this file, I
noticed that the CRTC atomic callbacks appear to invoke sleeping functions.

In vop2_crtc_atomic_enable():

    vop2_lock(vop2);

    ret =3D clk_prepare_enable(vp->dclk);

And in vop2_crtc_atomic_disable():

    ret =3D wait_for_completion_timeout(&vp->dsp_hold_completion,
                                      msecs_to_jiffies(50));

Does this code risk system instability or deadlocks? The DRM subsystem=20
guidelines designate CRTC atomic enable and disable callbacks as executing=
=20
in an atomic context where sleeping is forbidden, yet these paths acquire a
mutex, enable clocks, and wait for completion timeouts.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-dw-hdmi-qp=
-yuv-v4-0-fb45bf4147eb@collabora.com?part=3D6
