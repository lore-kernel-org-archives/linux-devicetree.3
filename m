Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841645;
	b=dQ+q0G/ZGfZhvbcEFnfWajdZbYgH8z5S7MRjlgRetrxHJJYysb+1jWH53EoMG8H+tLsO
	 B0KBL6LgJ8mxCklNW66yXlg9pQZJw78Y0DlIhEY8RfIbxYspFXlxya5vadYYizIlrqwEw
	 a+mpcoPpFi5Z/+TUDvuVZEUiyJ1b3l/2DBVBMkJGb3fvvT9TCCuVkmaAPnl5OvyJSjeNA
	 KDJUfe2vdo09Z5RnDzYBr3HoL1bMIKhHEl6d6+W9JqInX4OgmAxUJAmxNi8HnZf1Gmxzf
	 PqzbJH3VqPw8ax4vQSEwaOz2fnFBJ+TyWwmIjuFil6wYqP4KIgMBWo6ZV1zr7H/YqZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841645;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/VS0Zy1jHEWSehoUdiN2AjF7xBRQ6sZ3HJrnRijhhZQ=;
	b=MjRRYukAIpIzP6/Ek5a5VNjU5v4ZZyW3iZG1dzrlBslb0/nzBe06j/To5JW3jv58XtO0
	 rwMnpZX5WYY0OXAshZ/AEGvbaWpT1rHlUlGV3HsOsPwvpVMLeSObHivi2oFI4YpGz+j95
	 SNxvZr+EaxpZwoXmdoWj0voXjIIryoJNP+005tugJNMnhx1dFdP5vZ+hPjFdneu4cURGA
	 3tEfIoYnngG58Pvd+HmSlrugO2vabR5BJACz7BHzHfUH6WGs6ivbK7qQShfsTUYWDFoeG
	 gV3UVJkcjeR5t/NN8Aa+Q9RDL4YV4vIxWyjpcW8YTOMWb15hZiBasbK/BBS1kCTyj6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gkXxeM3t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B62606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 01:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gkXxeM3t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59521F000C1;
	Thu,  5 Nov 2026 01:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793841645;
	bh=/VS0Zy1jHEWSehoUdiN2AjF7xBRQ6sZ3HJrnRijhhZQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gkXxeM3tv2GJj86zUd5bXEzPPqv99+ch7F5q5mCpQ8Pvy3SAUpblG9OLirV0DyR7O
	 o9JrPs+sr9V9dAugrLrL6u3qCjIfYuNJg8zvN7DdX9/ycE8N7epadqnJmQrR+KIwsq
	 nMRBVIGHSmKbpL5hSPW9RND0Gy0pak2gnI51H6y9iB7fd+3FxSrEZFvMy6KmcnMESu
	 eOlaXpo4BfvmUA2l06Qt3f1Ya3XN3MkLXXqYGiRy5RJ7U8yV33ZnsYwrqhPz9XiAFV
	 ex4lY2BU+QiGMZnmFponf5JHmvSWNFd9w7b74x6FHnIFe72kKnTy87TXXglha1S+81
	 QXOZUxNX95cUA==
Message-ID: <sashiko-outbox-198400@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/15] drm/rockchip: vop2: Balance state on
 atomic_enable() error paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-4-1bb63ef5766e@collabora.com>
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
 <20261105-dw-hdmi-qp-yuv-v6-4-1bb63ef5766e@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 01:20:44 +0000
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
- [High] drm/rockchip: vop2: plane left enabled in vop2_plane_atomic_update=
()
- [High] drm/rockchip: vop2: unhandled vblank event in vop2_crtc_atomic_flu=
sh()
--

commit ad40a8e305ba6e768ae3478a34b5ddce63b79357
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: vop2: Balance state on atomic_enable() error paths

This commit cleans up clocks, vop2->enable_count, and PM runtime state on
vop2_crtc_atomic_enable() failure paths and introduces a per-video-port
enabled flag so atomic commit callbacks skip hardware programming and
teardown when a CRTC failed to enable.

Link: https://lore.kernel.org/all/20260623202043.8BFE21F000E9@smtp.kernel.o=
rg/

> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index bc14ca9d598dc..8d5613531acb9 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c

[ ... ]

> @@ -1197,13 +1203,21 @@ static void vop2_plane_atomic_disable(struct drm_=
plane *plane,
>  	struct drm_plane_state *old_pstate =3D NULL;
>  	struct vop2_win *win =3D to_vop2_win(plane);
>  	struct vop2 *vop2 =3D win->vop2;
> +	struct vop2_video_port *vp;
> =20
>  	drm_dbg(vop2->drm, "%s disable\n", win->data->name);
> =20
>  	if (state)
>  		old_pstate =3D drm_atomic_get_old_plane_state(state, plane);
> -	if (old_pstate && !old_pstate->crtc)
> -		return;
> +
> +	if (old_pstate) {
> +		if (!old_pstate->crtc)
> +			return;
> +
> +		vp =3D to_vop2_video_port(old_pstate->crtc);
> +		if (!vp->enabled)
> +			return;
> +	}
> =20
>  	vop2_win_disable(win);
>  	vop2_win_write(win, VOP2_WIN_YUV_CLIP, 0);
> @@ -1298,6 +1312,9 @@ static void vop2_plane_atomic_update(struct drm_pla=
ne *plane,
>  	if (WARN_ON(!crtc))
>  		return;
> =20
> +	if (!vp->enabled)
> +		return;
> +
>  	if (!pstate->visible) {
>  		vop2_plane_atomic_disable(plane, state);
>  		return;

[Severity: High]
What happens if an active plane is migrated from an enabled CRTC to another
CRTC whose vop2_crtc_atomic_enable() failed?

When a plane moves between CRTCs, drm_atomic_helper_commit_planes() sees
new_plane_state->crtc !=3D NULL and plane_crtc_active(new_plane_state) =3D=
=3D true,
so it calls vop2_plane_atomic_update() rather than
vop2_plane_atomic_disable(). Meanwhile, on the source CRTC,
vop2_crtc_atomic_begin() -> setup_overlay() only iterates over planes in the
source CRTC's new plane_mask and does not disable the migrated window.

In vop2_plane_atomic_update(), vp is derived from the destination CRTC
(pstate->crtc). Returning early when !vp->enabled skips
vop2_plane_atomic_disable(plane, state) and leaves VOP2_WIN_ENABLE set on t=
he
source CRTC while drm_atomic_helper_cleanup_planes() unmaps and releases
old_plane_state->fb at the end of the commit tail, allowing the hardware
window to continue DMA scanout from the old framebuffer.

Since vop2_plane_atomic_disable() already checks old_pstate->crtc and
whether the old video port is enabled before touching hardware registers,
should vop2_plane_atomic_update() call vop2_plane_atomic_disable(plane, sta=
te)
when !vp->enabled, just as it does when !pstate->visible?

[ ... ]

> @@ -2034,13 +2066,19 @@ static void vop2_crtc_atomic_flush(struct drm_crt=
c *crtc,
>  	struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
>  	struct vop2 *vop2 =3D vp->vop2;
> =20
> -	/* In case of modeset, gamma lut update already happened in atomic enab=
le */
> -	if (!drm_atomic_crtc_needs_modeset(crtc_state) && crtc_state->color_mgm=
t_changed)
> -		vop2_crtc_atomic_try_set_gamma_locked(vop2, vp, crtc, crtc_state);
> +	if (vp->enabled) {
> +		/*
> +		 * In case of modeset, gamma lut update already happened
> +		 * in atomic enable.
> +		 */
> +		if (!drm_atomic_crtc_needs_modeset(crtc_state) &&
> +		    crtc_state->color_mgmt_changed)
> +			vop2_crtc_atomic_try_set_gamma_locked(vop2, vp, crtc, crtc_state);
> =20
> -	vop2_post_config(crtc, false, crtc_state, old_crtc_state);
> +		vop2_post_config(crtc, false, crtc_state, old_crtc_state);
> =20
> -	vop2_cfg_done(vp);
> +		vop2_cfg_done(vp);
> +	}
> =20
>  	spin_lock_irq(&crtc->dev->event_lock);

[Severity: High]
As reported by Sashiko on v2 [1], how is crtc->state->event handled in
vop2_crtc_atomic_flush() when vop2_crtc_atomic_enable() fails and leaves
vp->enabled as false?

When vop2_crtc_atomic_enable() aborts on any error path, it returns before
calling drm_crtc_vblank_on(crtc). Later in the same commit tail,
drm_atomic_helper_commit_planes() still calls vop2_crtc_atomic_flush(), whi=
ch
runs:

	spin_lock_irq(&crtc->dev->event_lock);

	if (crtc->state->event) {
		WARN_ON(drm_crtc_vblank_get(crtc));
		vp->event =3D crtc->state->event;
		crtc->state->event =3D NULL;
	}

	spin_unlock_irq(&crtc->dev->event_lock);

Because drm_crtc_vblank_on(crtc) was never called, drm_crtc_vblank_get(crtc)
fails with -EINVAL and triggers the WARN_ON(). The event is then moved into
vp->event, but because the video port is not running and vop2_cfg_done(vp)
was skipped, the frame start interrupt never fires to complete vp->event, a=
nd
vop2_crtc_atomic_disable() only checks crtc->state->event while skipping
teardown when !vp->enabled.

Does this leave commit->flip_done unsignaled (stalling subsequent commits on
this CRTC in drm_atomic_helper_wait_for_dependencies()) and leak vp->event =
if
another commit flushes before the CRTC is enabled, or cause an unbalanced
drm_crtc_vblank_put() in the interrupt handler if a later modeset succeeds?
When !vp->enabled, should vop2_crtc_atomic_flush() send crtc->state->event
immediately via drm_crtc_send_vblank_event() instead of queuing it in
vp->event?

[1] https://lore.kernel.org/r/20260706194935.AC7601F000E9@smtp.kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-dw-hdmi-qp=
-yuv-v6-0-1bb63ef5766e@collabora.com?part=3D4
