Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58340256D
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 00:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783123294; cv=none; b=WoqVP92W31Js2/FOUzUcm37eEoYmBFMWKjeXWxwwWqRyEx15JPNa1ZhJ34p9fdJV/4oRDMFsjZABBjt4wOm8sg8umlBSd5AEDAzY+WugIWKKfjKJnNuUOm5CEhgQWDy0qEK+3saGZFNGKFdrsqLn4cJZYovzliwkQtMbdCqtHSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783123294; c=relaxed/simple;
	bh=Lx0tqP6KGq1LONcm88ITSxZpEbYHbNJ3BPWH6V53tDU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zt+a+Mic4bxHLTEjLfH3u4rDg+b8UpUVIqdaid+3I6Oc76x/4RT242WfY1WysbfqKRhbi/dnJTdkGZU5qz8PmnGyjRpXwBHREzDrYN6cTvgqTX27/5gDE8k7ut7EHN6kMS5jOf7xhJpCyRQXc4Ym7FK3opM/ifS+kKdo+emRVhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyIFlHzY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyIFlHzY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B72D91F000E9;
	Sat,  4 Jul 2026 00:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783123293;
	bh=4mSV+jyu93ebGylRRemEboIhGJgcsyEcBLUInNIbHf4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hyIFlHzY5llRnD+8Glf5pTX32zEBt3C4FvAVGGaLVEa8MGgi0ZoQ0AOwK9STqaZ9Z
	 K4PEncVPWFlak5kcskjDOaRffa62QJOu1u+onMH4zwjDl426lNZkISkR2szUATOqGm
	 CFvQsr4bJg2/iB5fDel/nWrvhol2B0S7lN4xvXhqOgB9Y/2hcrvY9ngKe2pMlTjwWa
	 WwK1deVJe0nZESeXt5LZd6SnjNAUv9n1MJF/GCvumJ0gLR1EcK/vRmi9YGHWJyHkoC
	 5LDe+iJMT45Y/dNlwPnOeqEjfHQED2IM8catRQNd3jBl4dvFbupFw3uL3AZP28I9EL
	 vPUYgU0goOLiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 36/36] phy: rockchip: usbdp: Add USB-C state without
 DP enabled
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-36-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
 <20260703-rockchip-usbdp-cleanup-v10-36-a392711ca8a9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 00:01:32 +0000
Message-Id: <20260704000132.B72D91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Early return in `rk_udphy_mode_set` prevents `lane_mux_sel` from b=
eing updated when only the cable orientation changes.
- [Medium] Mapping `TYPEC_STATE_USB` to `UDPHY_MODE_USB` causes PHY resets =
and USB disconnections during DP Alt Mode entry.

Pre-existing issues:
- [High] Devres registration ordering causes a Use-After-Free of `phy_u3` d=
uring unbind.
--

commit 054870f51259caaa299758adc71548fa9bf71159
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Add USB-C state without DP enabled

This commit adds a separate state for USB-only mode without DisplayPort ena=
bled
to improve power management. It splits the previous DP + USB3 combined mode
when DP AltMode is not present.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -617,12 +599,40 @@ static void rk_udphy_set_typec_state(struct rk_udph=
y *udphy, unsigned long state
>  			udphy->lane_mux_sel[2] =3D PHY_LANE_MUX_DP;
>  			udphy->lane_mux_sel[3] =3D PHY_LANE_MUX_DP;
>  		}
> -		hw_mode =3D UDPHY_MODE_DP_USB;
> -		udphy->dp_lanes =3D 2;
> +	}
> +}
> +
> +static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 hw_mode, u8 dp_=
lanes)
> +{
> +	if (udphy->hw_mode =3D=3D hw_mode && udphy->dp_lanes =3D=3D dp_lanes)
> +		return;

[Severity: High]
Does this early return prevent updating the lane mux if only the cable
orientation changes?

If a cable is physically flipped, the code updates udphy->flip and calls
rk_udphy_set_typec_default_mapping(), which then sets the state to
TYPEC_DP_STATE_D.

If the PHY was already in UDPHY_MODE_DP_USB with 2 DP lanes, this check
causes an early return, skipping the newly moved rk_udphy_set_lane_mux()
call below. This would leave stale inverted lane assignments when
rk_udphy_init() subsequently configures the hardware.

> +
> +	udphy->phy_needs_reinit =3D true;
> +	udphy->hw_mode =3D hw_mode;
> +	udphy->dp_lanes =3D dp_lanes;
> +
> +	rk_udphy_set_lane_mux(udphy);
> +}
> +
> +static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned lo=
ng state)
> +{
> +	switch (state) {
> [ ... ]
> +	case TYPEC_STATE_SAFE:
> +	case TYPEC_STATE_USB:
> +	default:
> +		rk_udphy_mode_set(udphy, UDPHY_MODE_USB, 0);
> +		break;

[Severity: Medium]
Will mapping this intermediate state to USB-only force a disruptive hardware
mode change when transitioning to DP Alt Mode?

Type-C port managers typically request TYPEC_STATE_USB upon connection.
Setting this to UDPHY_MODE_USB configures 0 DP lanes.

When DP Alt Mode successfully negotiates shortly after and transitions to
TYPEC_DP_STATE_D, hw_mode changes to UDPHY_MODE_DP_USB. This triggers a
full PHY reset in rk_udphy_update_power_state() and interrupts active
USB transfers.

The commit message mentions keeping all PHY parts powered up to avoid data
stream interruptions, but could this intermediate state mapping negate that
benefit during initial connection?

>  	}
> =20
>  }

[Severity: High]
This is a pre-existing issue, but does the devres registration ordering in
rk_udphy_probe() cause a use-after-free of phy_u3 during unbind?

The Type-C orientation switch and mux are registered with devres before
the PHYs are created:

rk_udphy_probe() {
    ...
    if (device_property_present(dev, "mode-switch")) {
        ret =3D rk_udphy_setup_typec_mux(udphy);
    ...
    udphy->phy_u3 =3D devm_phy_create(dev, dev->of_node, &rk_udphy_usb3_phy=
_ops);
    ...
}

During unbind, devres executes cleanup in reverse order. The PHY structures
are freed while the Type-C mux remains registered.

If a concurrent Type-C event arrives and calls rk_udphy_typec_mux_set(),
it invokes rk_udphy_update_power_state() which uses the freed pointer:

rk_udphy_update_power_state() {
    ...
    phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-rockchip-u=
sbdp-cleanup-v10-0-a392711ca8a9@collabora.com?part=3D36
