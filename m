Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1556C3B42D6
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 19:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625265; cv=none; b=lpDG/L0vlc8+zNcr2BiBa1uQ2NlmTKKMlyLPfz3HFXPK5qJmwPkQlNyMIyKrrlQ7F+RFz+N0p58Wqdw9DMI37eUPAK21y5H9JHeBXd4YKXrkG/Tz4sXBIFGwkw9P5bBb9e/IBXusBFLOC7TNmYYdAbdh7hqNonx1KwiR92jIHok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625265; c=relaxed/simple;
	bh=NOihqgHUC/MQKpm7AxH3D1OWfH3No/TLqLAdWucjJxs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iEEJ6gsVs32Re2kdrQ/Go42JUydlihykUYmDu6t+UEXiCalSIzlq1kd2ERstw/6r+PgksuYNx5isGL21lsGvDqoFxb9fGWdVpOaF2trdfKTgGyyDwEZpwicZnc9DlQE9ca5CXWhBEuduD5U1YNYq4yPo+Jym8BFh0O9b5xfOZpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VnhH1L+o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VnhH1L+o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431BA1F000E9;
	Thu,  9 Jul 2026 19:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783625263;
	bh=ojimdSKL7yFLNVHqovzToUoR66kYEIlZT9Kj2ekQW4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VnhH1L+orH83KASf4caE5eJ+sZ/++TaX2uSseXXU8iPUrbIpl0JmD9SLX/3LOKHq8
	 aRH7e6SZqWJNRP8BvyIAbLvZBsofJroFqBXY51I8kpoyB8bhCs7qMEWsOqDwCOdorZ
	 6zqxJGNeTfXePzQODNV5jIzkdmum6wINiHagmUMIp+iKSJKMNQZKv1lbHFIGX422uW
	 LYzG1miYIUBPQI+CRVR1aWr1KtczPzC1laLRx+xI0s6m8uB/kIJOOTvwX5XvfG6kwJ
	 rRmjgJ3aVado8Ve2kajLffvVXCKYjgW8in/l0odxcDC9G9qB2x1kJ/RD/a1Q7Mariu
	 rrmWk6dE20KVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 21/36] phy: rockchip: usbdp: Properly handle
 TYPEC_STATE_SAFE and TYPEC_STATE_USB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: vkoul@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-21-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
 <20260709-rockchip-usbdp-cleanup-v11-21-a149ac60f76c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 19:27:42 +0000
Message-Id: <20260709192743.431BA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Exiting DP AltMode fails to physically restore USB lane muxing if =
the USB controller remains logically active.
- [High] `rk_udphy_usb3_phy_exit` leaks the USB PHY power state if the Type=
-C mux mode was changed to DP-only before the USB controller calls `phy_exi=
t`.
--

--- Patch [21]: [PATCH v11 21/36] phy: rockchip: usbdp: Properly handle TYP=
EC_STATE_SAFE and TYPEC_STATE_USB ---
commit 8663a5e7459552707b3ef82190885d5f5b02aa6b
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Properly handle TYPEC_STATE_SAFE and TYPEC_STATE_USB

This commit adds support for TYPEC_STATE_SAFE and TYPEC_STATE_USB Type-C
state events to ensure muxing is properly updated when exiting DP AltMode.
It fixes an issue in the rockchip usbdp combo phy driver.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619155020.CC7361F000E9%40smtp.ke=
rnel.org

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 4e54020d17551..0399cbf96e195 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1293,17 +1293,26 @@ static const struct phy_ops rk_udphy_usb3_phy_ops=
 =3D {
>  	.owner		=3D THIS_MODULE,
>  };

[Severity: High]
This is a pre-existing issue, but I am wondering if rk_udphy_usb3_phy_exit()
leaks the USB PHY power state when the Type-C mux mode is changed to DP-only
before the USB controller calls phy_exit()?

If the Type-C mux switches to 4-lane DP AltMode, udphy->mode becomes
UDPHY_MODE_DP. If the USB controller then suspends or is unbound, it calls
rk_udphy_usb3_phy_exit(), which returns early:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_usb3_phy_exit() {
    ...
    /* DP only or high-speed */
    if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
        goto unlock;

    rk_udphy_power_off(udphy, UDPHY_MODE_USB);
    ...
}

This skips rk_udphy_power_off(), leaving UDPHY_MODE_USB set in udphy->statu=
s.
Since status never reaches UDPHY_MODE_NONE when DP later powers off,
rk_udphy_disable() is never called. Will the PHY clocks and resets remain
permanently active when they should be suspended?

> =20
> +static bool rk_udphy_is_supported_mode(struct typec_mux_state *state)
> +{
> +	/* Handle Safe State and USB State */
> +	if (state->mode < TYPEC_STATE_MODAL)
> +		return true;
> +
> +	/* Handle DP AltMode */
> +	if (state->alt && state->alt->svid =3D=3D USB_TYPEC_DP_SID)
> +		return true;
> +
> +	return false;
> +}
> +
>  static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
>  				  struct typec_mux_state *state)
>  {
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
This is a pre-existing issue, but can the PHY get permanently stuck in 4-la=
ne
DP mode when exiting DP AltMode if the USB controller remains logically act=
ive?

When rk_udphy_typec_mux_set() handles the transition to TYPEC_STATE_SAFE
or TYPEC_STATE_USB, it updates the software mode and sets phy_needs_reinit
to true via rk_udphy_set_typec_state() later in this function:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_typec_mux_set() {
    ...
    rk_udphy_set_typec_state(udphy, state->mode);
    ...
}

However, the hardware muxing is only updated in rk_udphy_power_on():

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_on() {
    ...
    } else if (udphy->phy_needs_reinit) {
        if (udphy->mode =3D=3D UDPHY_MODE_DP)
            rk_udphy_u3_port_disable(udphy, true);

        ret =3D rk_udphy_init(udphy);
    ...
}

If the USB controller (e.g. dwc3) is already active, it will not call
phy_power_on() again. This causes the hardware re-initialization to be miss=
ed,
leaving the PHY physically in 4-lane DP mode. Is it possible for USB 3.x
to become completely unresponsive in this state, even though the Type-C
subsystem correctly returned to USB mode?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-rockchip-u=
sbdp-cleanup-v11-0-a149ac60f76c@collabora.com?part=3D21
