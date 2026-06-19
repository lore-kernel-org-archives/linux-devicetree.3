Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9AE33E345
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884685; cv=none; b=ZNbyu7ac4rBCsUmvTXNZeGnhhdTVoCescFd0KOR4td4hT+ixDqK4FpKuf3lSIx8JS/TgRvmnnYXk2A5UR2HPsNq6Ifc9h4G4pOrpv3Tc4N2eD4h2kMo4D2BVUnxxS8jqYuPmGLQ0DY6OHtGDSPT0sXeew0bmaM/emyshF0bz9K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884685; c=relaxed/simple;
	bh=BimsJujaKxc+YXTEr1Ai1ZankX5Oysi0crwubp+y6o8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GNCu8fkMkBGh+m5TS6h6QcMwcY6DBpqTzVkT3xgc12MpsiAUcmf9rqmXf1zgNtD20nmf70umDbBWSe2HMqoJrOqi2Xg9P7LclgUreWf7VHAs5FJXg9IF1pxiYhnb0RdW7c61azpeq5IlLUGiVEBPJ5JCjbY6Dxywx7vv0NqExy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkufxEgl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkufxEgl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6371F000E9;
	Fri, 19 Jun 2026 15:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781884678;
	bh=GQvAwt9Y1E1Mw0o3anxmAtGAk0gdaxc2uyD5ov6XhrY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UkufxEglXllKKCiGe4zfDzpzXrI2HJ1PtlsUcsbNe6fTL7OUCH/zWhWu75icHZ5u+
	 MXrQt1ZsyCUyzYIgpF943IySTa5GoGRR7PA7cGg4YIPiWW1ftIke+NDxwMeb9NEkVP
	 0BU1z7dM0YTtlDMXt6DZ05EPIssWENp27WhOBbQOXatmpZ8C5iFikWXdpsYSOi0otX
	 1OuX+d1pc7b9dQcU4Exfre6JGj8607qTUmyF3l1zsC9D3DLd9loZwM5rVWtH3srJBL
	 70S2RtR/x35dFt0eDiY6mMPwkKUixJiYB5nwcoTJlSiPGhxvmi2DPRhBf/DCmIIlzi
	 9ahNPyQgRIRig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 21/23] phy: rockchip: usbdp: Support going from
 DP-only mode to USB mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-phy@lists.infradead.org, olteanv@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-21-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
 <20260619-rockchip-usbdp-cleanup-v6-21-3bb1f54b3f35@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 15:57:57 +0000
Message-Id: <20260619155757.AE6371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The `usb_in_use` flag is bypassed if `phy_init` is called while th=
e PHY is in a DP-only mode, permanently breaking USB functionality for subs=
equent adapter swaps.
- [High] The fix fails to restore USB functionality when transitioning from=
 a DP-only adapter to a pure USB Type-C device.
- [High] The `!(old_mode & UDPHY_MODE_USB)` check in `rk_udphy_typec_mux_se=
t()` erroneously fails because `rk_udphy_orien_sw_set()` preemptively modif=
ies the mode during unplug/replug.
- [Medium] If `rk_udphy_power_on()` fails during a type-C mux transition, `=
udphy->mode` remains permanently updated, preventing future retries from re=
storing USB power.
--

commit fe9deaf95e7e3b871d382c46e07c07e56534ca4d
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Support going from DP-only mode to USB mode

This patch adds support for restoring USB functionality when a DP-only
adapter is unplugged and replaced with an adapter supporting USB, working
around the USB controller keeping the PHY enabled.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 81aae3bc57476..7f26b74cb5151 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
[ ... ]
> @@ -1287,7 +1293,13 @@ static int rk_udphy_usb3_phy_init(struct phy *phy)
>  		return 0;
>  	}
> =20
> -	return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
> +	ret =3D rk_udphy_power_on(udphy, UDPHY_MODE_USB);
> +	if (ret)
> +		return ret;
> +
> +	udphy->usb_in_use =3D true;

[Severity: High]
Does this early return logic introduce a regression that prevents the flag
from being set if the system boots with a DP-only adapter?

If phy_init is called when the current mode lacks USB, it takes the early
return visible in the context above and skips executing
udphy->usb_in_use =3D true.

When a DP+USB adapter is later plugged in, udphy->usb_in_use will be false,
and the newly added restoration logic in rk_udphy_typec_mux_set() will
silently skip powering on the USB PHY.

> +
> +	return 0;
>  }
[ ... ]
> @@ -1315,6 +1329,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_=
dev *mux,
>  				  struct typec_mux_state *state)
>  {
>  	struct rk_udphy *udphy =3D typec_mux_get_drvdata(mux);
> +	u8 old_mode;
> =20
>  	/*
>  	 * Ignore mux events not involving DP AltMode, because

[Severity: High]
Is there a regression here where pure USB adapters bypass this restoration
logic entirely?

The code just below this in rk_udphy_typec_mux_set() aborts for non-DP
events:

	if (!state->alt || state->alt->svid !=3D USB_TYPEC_DP_SID)
		return 0;

If a pure USB Type-C device is connected after a DP-only adapter,
rk_udphy_orien_sw_set() updates the default mapping to UDPHY_MODE_DP_USB,
but rk_udphy_typec_mux_set() is never triggered. Since the USB controller
keeps the PHY logically enabled without calling phy_init again, the USB PHY
would remain powered off.

> @@ -1326,8 +1341,20 @@ static int rk_udphy_typec_mux_set(struct typec_mux=
_dev *mux,
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

[Severity: High]
Does this introduce a regression where old_mode already includes
UDPHY_MODE_USB during an unplug/replug sequence?

When unplugging a DP-only adapter and plugging in a DP+USB adapter,
rk_udphy_orien_sw_set() is called first and unconditionally sets
udphy->mode to UDPHY_MODE_DP_USB.

When rk_udphy_typec_mux_set() is called moments later, old_mode =3D udphy->=
mode
will capture UDPHY_MODE_DP_USB.  The check !(old_mode & UDPHY_MODE_USB)
would then evaluate to false, causing the USB PHY restoration to be skipped.

> +	    udphy->usb_in_use && !udphy->hs)
> +		return rk_udphy_power_on(udphy, UDPHY_MODE_USB);

[Severity: Medium]
If rk_udphy_power_on() fails here, does it leave udphy->mode permanently
updated without a rollback?

rk_udphy_set_typec_state() modifies udphy->mode before this power-on
attempt.  If rk_udphy_power_on() returns an error, the mode retains the USB
bit. If the Type-C subsystem retries the switch later, old_mode will now
include the USB bit, which would permanently prevent future retries from
passing the restoration check.

> +
>  	return 0;
>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619-rockchip-u=
sbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com?part=3D21
