Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA1236C0AB
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 22:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783548452; cv=none; b=fk108t5vZxhlMPXPCaHJnxZ7cRAh048PsmcZcyop4g4b9lTMhcE4FgTU1p82q2cMPfcThF65urqTCUc+kKpDbXCeI7r96zvcTds/3uxzRl4JFikVBRw+08VV6+lsHV7/UeI1krtwPb32KdNs4jdY13rHlQC0hDy9429K/B8Vvjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783548452; c=relaxed/simple;
	bh=HqH8CtBBUqcZ0nWKGvea411l6No4yWmJ9iLjXqnhhNA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MRXFePXSxM4UeKZPY/GyarkilTadOshAD7t49PfKToGyB4S0g6jfYjaYE1LNeyVZJu0gLUdR33ug8OzCgSJQx12PqGW7OysXRcilJYsJY7dYcQK5AABQqMqnlUdRAb3ynltDQ/Aa4yZKHWzpCIIxkxXR+PmusALB0zzANEmsh/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNEMiE3o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNEMiE3o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A3D1F000E9;
	Wed,  8 Jul 2026 22:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783548451;
	bh=e1Bs0GLLNqJlWg78pbHrXQVMOT2NZWLWpYH5qHZPGHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gNEMiE3oXk3gsp7NesrCjI8DZOxTBLa34sy61X5tsZ7uRGsc5m7TxOyv68B7PJqt+
	 lXqKeVt18sfNmURHwElNnMcUsvK2X2LZu4VAJ3i7kSmJ4vDHSvBAc9GbGpFoD9Hj66
	 t9kTzLd6e39rFbblmCYoCHMcrPw56JRGigty7jQpPgYFapZbMUn57TKN7n5KFGPWpW
	 MGDOocUWBNO6We8MXOISbiiEGewl3/d2jY3iXkeYp9z7xmsNQvXL5dAV7GkEwtAa64
	 23jQN9w6xrSquRo1rT/w2WxoHl/qIb+IEzGFkLQ6jRFaCt6lDs595qG7erI0B3jFhL
	 DFHvtlEYth2zw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/14] drm/rockchip: vop2: Balance state on
 atomic_enable() error paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260709-dw-hdmi-qp-yuv-v3-3-a4a982a9f2e7@collabora.com>
References: <20260709-dw-hdmi-qp-yuv-v3-0-a4a982a9f2e7@collabora.com>
 <20260709-dw-hdmi-qp-yuv-v3-3-a4a982a9f2e7@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 22:07:30 +0000
Message-Id: <20260708220730.B9A3D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unhandled VBLANK event on `atomic_enable` error paths causes users=
pace to hang indefinitely and triggers a kernel warning.
--

--- Patch [3]: [PATCH v3 03/14] drm/rockchip: vop2: Balance state on atomic=
_enable() error paths ---
commit 852e494693bdb0b841a64b02cd2bceb48e307231
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: vop2: Balance state on atomic_enable() error paths

This commit attempts to fix resource leaks in the error paths of
vop2_crtc_atomic_enable() by properly decrementing enable_count and
unpreparing clocks. It also tracks the per-VP bring-up state to skip=20
teardown in atomic_disable() and hardware programming in atomic_flush()=20
when the enable phase does not complete successfully.

Link: https://lore.kernel.org/all/20260623202043.8BFE21F000E9@smtp.kernel.o=
rg/

[ ... ]

> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index e11dc8c7f78ba..271c3cba6fb49 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c

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
This is a pre-existing issue, but does this code leave userspace hanging on
atomic_enable error paths?

Since this patch uses vp->enabled to skip hardware programming on failure,
what happens to the pending vblank event? If vop2_crtc_atomic_enable() fail=
s,
it returns before calling drm_crtc_vblank_on().

However, immediately following the spin_lock_irq() in vop2_crtc_atomic_flus=
h(),
the code unconditionally attempts to arm the event:

	if (crtc->state->event) {
		WARN_ON(drm_crtc_vblank_get(crtc) !=3D 0);
		drm_crtc_arm_vblank_event(crtc, crtc->state->event);
		crtc->state->event =3D NULL;
	}

Because vblank wasn't enabled during the failed bring-up,
drm_crtc_vblank_get() fails and triggers the WARN_ON. The event is armed but
never signaled because the disabled hardware generates no interrupts.

Should the driver consume the event directly here (e.g., using
drm_crtc_send_vblank_event) if vp->enabled is false to prevent the composit=
or
from blocking indefinitely?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-dw-hdmi-qp=
-yuv-v3-0-a4a982a9f2e7@collabora.com?part=3D3
