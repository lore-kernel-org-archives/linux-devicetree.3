Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A86B30C345
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 18:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782411166; cv=none; b=cZo0HGWRylWvT929H4peNjS5huJHYZl0JFoxJBoEH9av1sPDMeijGMVR714BSHt/i7gqyE882n6I6RhxAYFChGHN1fJhYjBvBo/HasKYqTnVpLG6xLNPR9eUXSk5zGn7VLq+20Ake1T+vMeHKI2En8Wqo7z9XISL/pGsjYrB+nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782411166; c=relaxed/simple;
	bh=XYNRYYneIOze7VO2TZ6DkbB2bB+6Rv2RayjOk4Zi6us=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G7JeUVpLlrMfC2BCsKxj+Tph+HvLDdrwzsYWyUsiEsXnnU38vAaJnJECznWdYQcO5tqJfJmA6zw9DbiU4l+/Lhg9xpO67ja3g/aBy7gZ+ev68pQxKDv0hGVLU7GAOdIXDMMuI1iH/qBv41eBcROoc3aMwXldWHMv5j77yFBxRgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+s+1Kjw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+s+1Kjw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0E81F00A3A;
	Thu, 25 Jun 2026 18:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782411164;
	bh=2RncQXwqznbhHie3Ilv2VL9/L076OrAzGH/nhSvBvr4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g+s+1KjweIhWVkk2zwPdcwali+AKhnshLhtPfX4lKUxr7Rm4fczlSUrF+3xor2VmL
	 8ynuieaJhOufUTN1HcyGJN/tTh0K8NWp+PY0gm6LxxLZ/EuA9dloNr2bVv5GRA8+Gz
	 BMbM9fj/y/3dYDr/JB76N9BC9UenCPWas+fT8rvozXnlnwtP3ZN89PFfHf9IyCeDTh
	 VXrgSDIYUQHbfRRPII3JL7wG+CVhUa7ZQ86vdne9IIKxb4onKBGsAvxxJrTne8UitT
	 mrySyNfby6lGLmyAZstMwaeWD1vfHVgn8Ar7JgdD89ahrWeChZ8F1tOKpVYFruL665
	 CTe64EkMxnMzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 24/27] phy: rockchip: usbdp: Support going from
 DP-only mode to USB mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-phy@lists.infradead.org, robh@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, conor+dt@kernel.org
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-24-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
 <20260625-rockchip-usbdp-cleanup-v7-24-38eb3cf654fd@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 18:12:43 +0000
Message-Id: <20260625181244.4B0E81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The `typec_mux_set` early return condition is a tautology, causing=
 the function to always return 0 and ignore all events.
- [High] The `usb_in_use` flag fails to record the USB controller's intent =
if `phy_init` is called while a DP-only adapter is plugged in.
- [High] The fallback USB power-on logic in `rk_udphy_typec_mux_set` will n=
ever trigger due to mode transition interference from orientation switch ca=
llbacks.

Pre-existing issues:
- [High] The `UDPHY_MODE_USB` state bit is leaked in `udphy->status` if the=
 USB controller unbinds/exits while the PHY is in DP-only mode.
--

commit b29d116f72e458e2aa19213a694463c70672b033
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Support going from DP-only mode to USB mode

When a USB-C adapter mapping all Superspeed lanes to DP is plugged in,
USB support is disabled in the PHY. This patch tracks USB usage and
powers on the USB PHY in the Type-C mux set callback to ensure USB
functionality is restored when switching to a USB-capable adapter.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 6f3184011e5f2..1821418375968 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
[ ... ]
> @@ -1293,7 +1299,13 @@ static int rk_udphy_usb3_phy_init(struct phy *phy)
>  		return 0;
>  	}
> =20
> -	return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
> +	ret =3D rk_udphy_power_on(udphy, UDPHY_MODE_USB);
> +	if (ret)
> +		return ret;
> +
> +	udphy->usb_in_use =3D true;
> +
> +	return 0;
>  }

[Severity: High]
If the USB controller probes and calls rk_udphy_usb3_phy_init() while a
DP-only adapter is physically connected, udphy->mode will lack
UDPHY_MODE_USB. The early return right before this will skip setting
udphy->usb_in_use =3D true.

Will this cause the fallback logic introduced below to fail when later
switched to a USB-capable adapter?

>  static int rk_udphy_usb3_phy_exit(struct phy *phy)
> @@ -1302,6 +1314,8 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
> =20
>  	guard(mutex)(&udphy->mutex);
> =20
> +	udphy->usb_in_use =3D false;
> +
>  	/* DP only or high-speed */
>  	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
>  		return 0;
> =20
>  	rk_udphy_power_off(udphy, UDPHY_MODE_USB);

[Severity: High]
This is a pre-existing issue, but does this early return bypass state
cleanup if the USB controller unbinds while the PHY is in DP-only mode?

If udphy->mode lacks UDPHY_MODE_USB, rk_udphy_power_off() is skipped, which
permanently leaves UDPHY_MODE_USB set in udphy->status and leaks hardware
clocks and resets.

> @@ -1321,6 +1335,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_=
dev *mux,
>  				  struct typec_mux_state *state)
>  {
>  	struct rk_udphy *udphy =3D typec_mux_get_drvdata(mux);
> +	u8 old_mode;
> =20
>  	/*
>  	 * Ignore mux events not involving Safe State, USB State or DP AltMode,
>  	 * because the mode field is being reused, e.g. state->mode =3D=3D 4 co=
uld
>  	 * be either TYPEC_MODE_USB4 or TYPEC_DP_STATE_C.
>  	 */
>  	if (state->mode >=3D TYPEC_STATE_MODAL || !state->alt ||
>  	    state->alt->svid !=3D USB_TYPEC_DP_SID)
>  		return 0;

[Severity: High]
Is this early return condition a tautology that drops all events?

For Safe and USB states, state->alt is NULL, so !state->alt evaluates to
true. For DP AltMode states, state->mode >=3D TYPEC_STATE_MODAL evaluates to
true. Since these use logical OR, the function will always return 0.

> =20
>  	guard(mutex)(&udphy->mutex);
> =20
> +	old_mode =3D udphy->mode;
> +
>  	rk_udphy_set_typec_state(udphy, state->mode);
> =20
> +	/*
> +	 * If the new mode includes USB but the old one didn't (e.g. leaving
> +	 * DP-only), and the USB PHY was already initialized by the USB
> +	 * controller, we need to power on the USB side now since no
> +	 * subsequent phy_init call will come from the controller.
> +	 */
> +	if ((udphy->mode & UDPHY_MODE_USB) && !(old_mode & UDPHY_MODE_USB) &&
> +	    udphy->usb_in_use && !udphy->hs)
> +		return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
> +
>  	return 0;
>  }

[Severity: High]
Will this fallback logic ever execute during a replug?

When swapping a DP-only adapter for a USB-capable one, the orientation swit=
ch
callback rk_udphy_orien_sw_set() is typically invoked first. This sets the
mode to UDPHY_MODE_DP_USB.

By the time rk_udphy_typec_mux_set() is called here, udphy->mode already
includes UDPHY_MODE_USB, so old_mode will have it as well. As a result,
!(old_mode & UDPHY_MODE_USB) will evaluate to false and bypass this logic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-rockchip-u=
sbdp-cleanup-v7-0-38eb3cf654fd@collabora.com?part=3D24
