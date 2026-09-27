Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978FB434998
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 18:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534330; cv=none; b=Ql6soEXtgqbSz5BLk/zL9P0TP3k2xePaWKqZxsKKIpAkKkQnR/EuvbbSa5HxRLUC0VJ+7LGB47hhLjyxZ17EfL/lOIy4rcdAnRTlf9UrApYof83x6p69thQfhaoUI9Qa+kalLzA2gXY2aXeN/yTxVLCprGouWst/WJgsPNkh6PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534330; c=relaxed/simple;
	bh=EJs5qgt3NWKSAIIiBOYju0+8VclX/uzTMKj/BsMy6cg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dl93mpDHR0fnXE3Y/+IHC4um+w2hPZg4YUVq8LBcfkiiNkhOyNi0nzuCuf5Cb9LNIYChPNsftdHvzG0qDVMiB7a2et9IRtm/lsbJiSvM+tl2mstr7xjIcmTrCnnSC0iyNvBUHnt13FVFewaj7qOhQeovWvgGcsMn8SVcXPwmbjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOBAEKnC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOBAEKnC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E8A1F000FF;
	Sun, 27 Sep 2026 18:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790534329;
	bh=WCA4T+kummSJSRk1IidlaIDa4hC2fbK0BftJInoUqSw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bOBAEKnCrNwDjagHCdf4h1Tf9cx2Z+viXH8kYeynPLfGdG3SweDonLV0540YWOpE6
	 STlZXZXDbhxgc4kXQyarisUiSQDwzYW2EgHzdp2M+//1lLcygIxZxnjV5fZ3JK4uOC
	 bT/jAo8r6+bFiddeb/OKg1h3TA50INijvjpnhNYHTQLN0RC10ytXXrXkOShdVzMSj/
	 1eB00xLjOLEinsiA0+Lx2L2To1HQmHxZViQbJ4J4rWPI8dlNvV1h+ziziz7gdkGmyZ
	 I0LYW4cy19aORJOQmKm11FefHBbsXTZNP3ob3wDPNe1/G0NQW/MvQ4f8zrIA0Rcb1A
	 ucLtay/+qwtCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/14] drm/solomon: ssd16xx: Expose session
 management as plane properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Devarsh Thakkar" <devarsht@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260927182329.4193961-11-devarsht@ti.com>
References: <20260927182329.4193961-1-devarsht@ti.com>
 <20260927182329.4193961-11-devarsht@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 18:38:48 +0000
Message-Id: <20260927183848.D3E8A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] drm/solomon: stale plane properties used in CRTC hooks due to sy=
nc ordering
- [Medium] drm/solomon: unprotected concurrent access to global device prop=
erties
--

commit 16a8f4fa23daecbcef4ac45581fba368964d7807
Author: Devarsh Thakkar <devarsht@ti.com>

drm/solomon: ssd16xx: Expose session management as plane properties

This commit adds DRM plane properties for session management flags,
allowing userspace to control automatic display clear/refresh behavior
at lifecycle transitions.

> diff --git a/drivers/gpu/drm/solomon/ssd16xx.c b/drivers/gpu/drm/solomon/=
ssd16xx.c
> index 3815af0cee5c5..6331f367d8649 100644
> --- a/drivers/gpu/drm/solomon/ssd16xx.c
> +++ b/drivers/gpu/drm/solomon/ssd16xx.c
[ ... ]
> @@ -1588,6 +1670,10 @@ static void ssd16xx_plane_atomic_update(struct drm=
_plane *plane,
> =20
>  	device->refresh_mode =3D new_ssd->refresh_mode;
>  	device->color_mode =3D new_ssd->color_mode;
> +	device->clear_on_init =3D new_ssd->clear_on_init;
> +	device->clear_on_close =3D new_ssd->clear_on_close;
> +	device->clear_on_disable =3D new_ssd->clear_on_disable;
> +	device->refresh_mode_init =3D new_ssd->refresh_mode_init;

[Severity: Medium]
Since ssd16xx_plane_atomic_update() returns early if there is no framebuffe=
r:

static void ssd16xx_plane_atomic_update(...)
{
        ...
        if (!fb)
                return;

Will these device property assignments be skipped entirely when the plane
is being disabled?

Additionally, doesn't drm_atomic_helper_commit_tail_rpm() call the CRTC
enable and disable hooks before the plane update? If a user submits an
atomic commit that updates clear_on_disable and disables the CRTC at
the same time, won't ssd16xx_crtc_atomic_disable() read the stale global
device property before this plane update has a chance to synchronize the
new atomic state?

[Severity: Medium]
Is it safe to write to global device properties like device->clear_on_close
here? This code executes under DRM modeset locks, but if another client
closes its DRM file descriptor, wouldn't ssd16xx_drm_master_drop() read
these same properties under drm_device->master_mutex?

Since they don't share locks, could this lead to a data race where the
master drop path reads torn or stale values while an atomic commit is
processing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927182329.4193=
961-1-devarsht@ti.com?part=3D10
