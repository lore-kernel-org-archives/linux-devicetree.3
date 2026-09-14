Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD7441CB5F
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377285; cv=none; b=MSlNZnrJoifmiJYOyr0/pYkbOWXeCU+/KMQZDPAv2849DcU+cvk4X5TAfTF1g9gnF6nEFbMrU0sDUfVvJDPVijYOk3oVjS5tKskcbwZT4UUoX/1Vyj/zXuU06EOytoo6+5i8phXuuNO3tR7zPIpykzp9CbucslJJeKarMFJUY14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377285; c=relaxed/simple;
	bh=tRyVMVlmai5U7icibwDNYU4Ky6e1qGY5EFWn9JPwqbw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tnrux159p6ZcnQSfVE7sVW/J4FKNcSNFJ0xaOpHwiGR16xe1fpb4HMcdxAO0diR8GwQa4UowOg+SjHpGxsGAVQVcxRVE4mK1qiuN1IoVZTAqvZiB+nCitAWNWMc8/0F3/0Oq0SmwbqHWejIwiFkSGQUrnvII1q0sKnIE3diiLiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNHRYfUJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNHRYfUJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023141F000FF;
	Mon, 14 Sep 2026 09:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377283;
	bh=LrutReZ5R9lj/02OwAOFdnsGfMcThHjIY3yuMYn4ORw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GNHRYfUJUdoVjjWXzh++r4dV8YS5TozSqVqmo2Uv65sWYEd8pz20DEP8NFaPz/4mI
	 kR/pe1ucZ5IlMoIV6bzklQn2rttLaZX/Oia3ZFz4660+7wlAgM0M/9JHU6yoVcqYWB
	 nZ1HqJlZPUOSD7wwOWMoybF7EREtzRIivnGieuvRy9tyvfUHU0SyQwhyZd10kCJ7tW
	 ehxUQyK1pY+Lsx36+jadIAFrY5xOK6Bs0H5JPllPWnsU2UUOwZMyOfkT/6nrtdloqZ
	 RHfFyVi6cA2Mv5nxIw+VnyBeeSuAMW9cokP9Uyg0uaYZq+0/qaLaRLLgJ3ylGPkBR3
	 CWH3gLY+zUZDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/6] drm/ssd130x: Change SSD133X color format to
 RGB565 from RGB332
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amit Barzilai" <amit.barzilai22@gmail.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260914085931.66857-3-amit.barzilai22@gmail.com>
References: <20260914085931.66857-1-amit.barzilai22@gmail.com>
 <20260914085931.66857-3-amit.barzilai22@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 09:14:42 +0000
Message-Id: <20260914091443.023141F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `fmtcnv_state` buffer reservation in `ssd133x_primary_plan=
e_atomic_check` causes a `GFP_KERNEL` allocation in atomic context.
--

commit 58733b43936278b0113cbbd363c279ece2464617
Author: Amit Barzilai <amit.barzilai22@gmail.com>

drm/ssd130x: Change SSD133X color format to RGB565 from RGB332

SSD133X screens were driven at 8bpp RGB332 despite supporting 16bpp RGB565.
Switch the SSD133X data path to RGB565.

> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/=
ssd130x.c
> index feec4933e3e6b..cbf77a74c4fa0 100644
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
This is a pre-existing issue, but does this code cause a GFP_KERNEL allocat=
ion
in atomic context?

When the screen is updated, ssd133x_primary_plane_atomic_update() (which ru=
ns
in atomic context) calls ssd133x_fb_blit_rect() which in turn calls
drm_fb_xrgb8888_to_rgb565be().

This internally calls __drm_fb_xfrm(), which attempts a GFP_KERNEL allocati=
on
if the conversion buffer was not previously reserved:

drivers/gpu/drm/drm_format_helper.c:__drm_fb_xfrm() {
	if (!vaddr_cached_hint) {
		stmp =3D drm_format_conv_state_reserve(state, sbuf_len, GFP_KERNEL);
		if (!stmp)
			return -ENOMEM;
	}
}

Because ssd133x_primary_plane_atomic_check() omits the
drm_format_conv_state_reserve() call (unlike its ssd130x and ssd132x varian=
ts):

drivers/gpu/drm/solomon/ssd130x.c:ssd133x_primary_plane_atomic_check() {
	...
	else if (!plane_state->visible)
		return 0;

	return 0;
}

Will this cause the allocation to be unconditionally executed in atomic con=
text
on the first frame update?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914085931.6685=
7-1-amit.barzilai22@gmail.com?part=3D2
