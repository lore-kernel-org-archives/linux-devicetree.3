Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2572C331ECD
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 04:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786681433; cv=none; b=bvxlcfCD39ubvVEbim+rCoYpXhWs2uT0E71mbn/FZvny8GYe5QjRDxjkbB46OvqBFJ1VJoiA7pmSLjH6OJjqvtGSty+vP+sqDCsKqxibW5WOU2bMLkOculpmm08tD8cYXUdZgZZG9+8hZ/nrJrbVl0ORf41KqaRXvJVeP9OTuyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786681433; c=relaxed/simple;
	bh=AQEMWmZH6R5rGxyRN9kcMKaLGhEFfvt473+zMyIXpSQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t+bok2coT/eoTmSBNoXp3+DDXfA4PbTxbes1A/n9dn/tny30tl5RF0kf2NAW2hqOI9HKWpUtLwpDeRMHNNDOae11zzFJ2lj6Wv2NKEpWMmuKisgxH/ViexOfPSKF9+ub5xVl8JbjNFDmJZZkwmsbNZqOq4GKVCeztLDdqG7chsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kiB19n7x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kiB19n7x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3C81F000E9;
	Fri, 14 Aug 2026 04:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786681431;
	bh=7ecA2dpQ2ZAcKTr79TObxc90Kw0z+3n04P0JTcZdRc8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kiB19n7xusSxWAbxPLYZCDHL4Caasv4yumRR7FdXrhk4eSDgo3uqlsukXAcRExr3M
	 t8Q3jJLWS1MYhSOZmHmGgZzayU8gQbUJZhP6KWPtpWfTClnH4WXaMUBnoaeDjky8+W
	 uYuiv1tzU9s7drgJpHQTjGcf1cLNoPmlGQxZV7ggYb/PgCCHlSO4fqBX1z18PnjQUa
	 /SEeytMb5bQRqFwi6nGd3EaztmWjWCBbhfYByetdudBwksmttoyXhoIiOyJpE+IItL
	 fZPgHKoih1XR8JW6D7+IfGhrf7TMmsXLvYuPhmJlS07oI38XihCnZs7f+lEC4fAv3/
	 FSgdUPMLAMDfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 21/38] phy: rockchip: usbdp: Properly handle
 TYPEC_STATE_SAFE and TYPEC_STATE_USB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-21-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-21-b5ad9c68fa11@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 04:23:45 +0000
Message-Id: <20260814042351.3B3C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing PHY hardware re-initialization on DP AltMode exit leaves U=
SB 3.0 broken.
- [High] Failure to re-enable U3 port (USB3) when transitioning from DP-onl=
y mode back to DP+USB mode in rk_udphy_power_on.
--

--- Patch [21]: [PATCH v14 21/38] phy: rockchip: usbdp: Properly handle TYP=
EC_STATE_SAFE and TYPEC_STATE_USB ---
commit bc1b433620764837d185aacbce6b35af43522e3a
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Properly handle TYPEC_STATE_SAFE and TYPEC_STATE_USB

This patch updates the Type-C mux set callback to handle safe state and USB
state events. It ensures the software state is updated when exiting DP
AltMode.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619155020.CC7361F000E9%40smtp.ke=
rnel.org
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 4e54020d17551..0399cbf96e195 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
[ ... ]
> @@ -1305,11 +1314,10 @@ static int rk_udphy_typec_mux_set(struct typec_mu=
x_dev *mux,
>  	struct rk_udphy *udphy =3D typec_mux_get_drvdata(mux);
> =20
> -	/*
> -	 * Ignore mux events not involving DP AltMode, because
> -	 * the mode field is being reused, e.g. state->mode =3D=3D 4
> -	 * could be either TYPEC_MODE_USB4 or TYPEC_DP_STATE_C.
> -	 */
> -	if (!state->alt || state->alt->svid !=3D USB_TYPEC_DP_SID)
> +	/* Ignore mux events not involving USB or DP */
> +	if (!rk_udphy_is_supported_mode(state))
>  		return 0;
> =20
>  	mutex_lock(&udphy->mutex);

[Severity: High]
This isn't a bug introduced by this patch, but does this logic leave USB 3.0
broken when exiting DP AltMode?

When the Type-C mux transitions to TYPEC_STATE_SAFE or TYPEC_STATE_USB,
rk_udphy_set_typec_state() updates the software state and sets
phy_needs_reinit =3D true.

Since the USB subsystem is already powered on, it will not call
phy_power_on() again. The DP subsystem calls phy_power_off(), but
rk_udphy_power_off() only clears the UDPHY_MODE_DP flag from the status
without reinitializing the hardware.

Can the PHY hardware remain stuck in 4-lane DP mode because the required
re-initialization is never executed?

There is another pre-existing issue in the re-initialization path that might
prevent recovery.

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_on() {
[ ... ]
        } else if (udphy->phy_needs_reinit) {
                if (udphy->mode =3D=3D UDPHY_MODE_DP)
                        rk_udphy_u3_port_disable(udphy, true);

                ret =3D rk_udphy_init(udphy);
[ ... ]
}

[Severity: High]
This is a pre-existing issue, but does the code fail to re-enable the U3
port when transitioning from DP-only mode back to DP+USB mode?

When transitioning into UDPHY_MODE_DP, rk_udphy_power_on() disables the
U3 port. However, when transitioning back to a mode supporting USB and
hitting the udphy->phy_needs_reinit path, it merely calls rk_udphy_init()
without calling rk_udphy_u3_port_disable(udphy, false) first.

Would this omission cause a permanent regression for USB 3.0 functionality
even if the PHY hardware was successfully re-initialized?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-rockchip-u=
sbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com?part=3D21
