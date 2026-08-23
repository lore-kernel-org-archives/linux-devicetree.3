Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885792472A2
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 11:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787484995; cv=none; b=pDz5Uamlx9RTmMUfo2QXF1RtqRKyFTB5oKsgUBd9bdcfEdymuyHE3/u/YaCXLr4fFbQxjLp60Nq+UtUnHEdzDlYjv3Xu6gyCQve/Fmcf+P/WVB8QCelS+xsT2fXhDR2HpS9TKQ0ypSlnbOTfHPEEKXRpjlpbo49boESH6sDJH80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787484995; c=relaxed/simple;
	bh=D9+HB94m9EnAZAJdLipHElnn0dFB4wnyphLhMCMIXTs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VLBzQN+y08GxPm3ltHAtw/+88N5DsAxteS532hB6MTN9UeF943gkQG7OYDyl5VH087YyKgOx0wWhqZqk52/j2/5BAmBCV6ZoJtajdKgVr1mKq9dfox7+SbmV1baNHH5+jJMkzwXYYsuPNHQRzIGc5ar3JdvXqRTcXQkKLQQfbQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGLot8Fp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGLot8Fp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C499A1F000E9;
	Sun, 23 Aug 2026 11:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787484994;
	bh=5t6+8MRReuwEWWtWz590EOauv6OUxUupfcdl9H/F+q4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OGLot8Fp/K7oAlwnKRbJvnLVn0Kgz1ozM5vvhxPnrR6/CmyDe+2X7vvb+mW/0JUgw
	 OUUKqPoxARKfx5quv8N99qiz3OuBNc3z2uU/0gcKJ4hB0sarmAoMZ+5XcjD6kJ1l9x
	 mHsOM3hK5oXknM8X/1jZwSFtpUBO6jb+LkEQWlehoH6vRvug/j7U86JZMIxMjfrgWO
	 LLcDTdgnRSulhgq3Zcdlpm8huYXKfPFwmlFwSgrbVewiOGqrfOeXrXRpd0s0242pBr
	 qcuXh9Hdi+8ygYbOqMRQwWum4mEgf8Ks5VDdSfgaxGcRi72gn9VxA1vZR+1wRkuKQh
	 wAFxySMPJtt9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/6] drm/ssd130x: Change SSD133X color format to
 RGB565 from RGB332
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amit Barzilai" <amit.barzilai22@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260823111959.17029-3-amit.barzilai22@gmail.com>
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-3-amit.barzilai22@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 11:36:33 +0000
Message-Id: <20260823113633.C499A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing drm_format_conv_state_reserve() pre-allocation forces unsa=
fe GFP_KERNEL allocation in atomic context.
- [High] Sleeping functions called from plane atomic update callback.
--

--- Patch [2]: [PATCH v5 2/6] drm/ssd130x: Change SSD133X color format to R=
GB565 from RGB332 ---
commit e1ae8460e953e75a280fd3111fa7957d70e68fcc
Author: Amit Barzilai <amit.barzilai22@gmail.com>

drm/ssd130x: Change SSD133X color format to RGB565 from RGB332
   =20
SSD133X screens were driven at 8bpp RGB332 despite supporting 16bpp RGB565.
Switch the SSD133X data path to RGB565.

> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/=
ssd130x.c
> index 0b0fc6fe3df23..8cf1e9c84a810 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c

[ ... ]

> @@ -978,17 +990,18 @@ static int ssd133x_fb_blit_rect(struct drm_framebuf=
fer *fb,
>  				struct drm_format_conv_state *fmtcnv_state)
>  {
>  	struct ssd130x_device *ssd130x =3D drm_to_ssd130x(fb->dev);
> -	const struct drm_format_info *fi =3D drm_format_info(DRM_FORMAT_RGB332);
> +	const struct drm_format_info *fi;
>  	unsigned int dst_pitch;
>  	struct iosys_map dst;
> =20
> +	fi =3D drm_format_info(DRM_FORMAT_RGB565);
>  	if (!fi)
>  		return -EINVAL;
> =20
>  	dst_pitch =3D drm_format_info_min_pitch(fi, 0, drm_rect_width(rect));
> =20
>  	iosys_map_set_vaddr(&dst, data_array);
> -	drm_fb_xrgb8888_to_rgb332(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_stat=
e);
> +	drm_fb_xrgb8888_to_rgb565be(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_st=
ate);

[Severity: High]
This is a pre-existing issue, but does this conversion allocate memory with
GFP_KERNEL in an atomic context?

Because ssd133x_primary_plane_atomic_check() does not pre-allocate the form=
at
conversion state using drm_format_conv_state_reserve(), this call to
drm_fb_xrgb8888_to_rgb565be() can fall back to a dynamic GFP_KERNEL allocat=
ion
within __drm_fb_xfrm(). This leads to might_sleep() warnings since it execu=
tes
during the plane's atomic_update callback.

> =20
>  	ssd133x_update_rect(ssd130x, rect, data_array, dst_pitch);

[Severity: High]
This isn't a bug introduced by this patch, but does this function sequence
perform sleeping operations from an atomic context?

The ssd133x_primary_plane_atomic_update() callback runs in an atomic context
where sleeping is forbidden. However, it calls drm_gem_fb_begin_cpu_access()
(which waits on dma_resv and can sleep) and then calls into this function,
which reaches ssd133x_update_rect(). The update function performs hardware
writes using regmap_bulk_write() on sleepable I2C/SPI buses.

> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823111959.1702=
9-1-amit.barzilai22@gmail.com?part=3D2
