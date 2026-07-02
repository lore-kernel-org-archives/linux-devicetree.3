Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD9414B977
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 00:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782951145; cv=none; b=jKgXNGFsbhwzPk1KvQnB9rKAqbroXXs0PgF0Ier6t15XhGE2f425CzfiN/IDZgMWY/XIoncXoIjst1sHUHoqUaY5Z8w2CaRTejcywcSTJenwHqId+EHGbb4/Xtcm8h0AteGYRkgeNK2YTijPean8/+7X/VVrUea6F92Cvqocu/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782951145; c=relaxed/simple;
	bh=cLxNfSKH8IWDWvord2X1actg3hzBb3LobhMJoCAGD+g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EdvafP+WFHawhhwro+HoL6cp9bIRHr4EE49wvZQFZbH7pE9ZExrW1NWoT0nliMdjqGD+9n8vbrOW/cF+Jstniayr9vVPDOuSBo25cPE7mJD7evvEKgmRMb5xQ42hIgmKqRA2LSNoCYhGEUWKYZ58oV0t3qqRV0ZAx+/KeozXmGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0dl7k5N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0dl7k5N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B601F000E9;
	Thu,  2 Jul 2026 00:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782951144;
	bh=yy8ipkgi08YIPGS3VMeXn0M4ACuafplJ5arxRPkgsCg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P0dl7k5N/OpPObWM5NCzCGinmZg/3l3myB+U29l3zqIOe3imr3CA8o1WoP7iDupcK
	 uioEkaRqGAg/C+uGqbduwtXQ3QhVI4oi2m50aDw+0oEkVj2oz8Zetg2WLKAeue/7s0
	 gKOu5UeGXaDn133GREAYSsh/0n6ED4JDH9Kd8M64upRPLpFjkXZAHNPovJ/PglBVZR
	 zFN0RIm8gYtHnFUx7QHtid+gWC8tg7Lglf1jqD4AKw4JnF7ifcLszEA549wVp4S1Nr
	 Nc8hBisE3ToEv102uhWNeJ8A6qwnCkAFsHhUs7SgaQcbJ+L5Zt2b/ZzpF2a1Q2xmTc
	 GT+sX1Y6RRUsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 35/38] phy: rockchip: usbdp: Simplify power state
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-35-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
 <20260702-rockchip-usbdp-cleanup-v9-35-e31efbb62d2e@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 00:12:23 +0000
Message-Id: <20260702001223.A7B601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] Dynamic PHY re-initialization destroys active DP lane state, s=
ilently breaking the active display link.
- [High] State leak on initialization failure leaves the driver desynchroni=
zed from the PHY subsystem.
- [High] High-speed only configurations fully power on unused SuperSpeed PH=
Y hardware, wasting power and risking timeouts.
- [High] The PHY fails to re-initialize when the Type-C mux changes between=
 2-lane DP and 4-lane DP while only DP is actively powered on.
- [High] Initialization failure during a mode change leaves the software st=
ate permanently desynchronized from the hardware.
- [Medium] PHY_NOTIFY_POST_RESET is sent to the DWC3 driver unconditionally=
, even when powering down the PHY.
--

commit e22432b71115cadf57aac2173cacace2579279d3
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: phy: rockchip: usbdp: Simplify power state handling

This commit introduces a sw_mode field to track software-requested PHY modes
independently from hardware capabilities. It centralizes power state
management and re-initialization into a single update function.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index a19b048fb39ca..51aac07ef9fe9 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c

[ ... ]

> @@ -1023,66 +1015,61 @@ static int rk_udphy_parse_dt(struct rk_udphy *udp=
hy)
>  	return rk_udphy_reset_init(udphy, dev);
>  }
> =20
> -static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
> +static int rk_udphy_update_power_state(struct rk_udphy *udphy)
>  {
> +	u8 target_mode =3D udphy->hw_mode & udphy->sw_mode;
>  	int ret;
> =20
> -	if (!(udphy->hw_mode & mode)) {
> -		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
> +	if (!udphy->phy_needs_reinit && udphy->status =3D=3D target_mode)
>  		return 0;

[Severity: High]
Does this early return prevent the PHY from re-initializing when the Type-C
mux changes between 2-lane and 4-lane DP?

If the Type-C driver changes the mux configuration so hw_mode changes from
UDPHY_MODE_DP_USB to UDPHY_MODE_DP, but only DP is currently requested
(sw_mode =3D=3D UDPHY_MODE_DP), target_mode will evaluate to UDPHY_MODE_DP =
in
both cases.

Because target_mode acts as a bitmask, the lane count change in hw_mode is
masked out, causing this check to succeed and entirely skip the required
re-initialization.

[ ... ]

> +	if (udphy->status =3D=3D UDPHY_MODE_NONE) {
> +		/* Power up (incl. clocks) */
>  		ret =3D rk_udphy_setup(udphy);
> -		if (ret)
> +		if (ret) {
> +			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
>  			return ret;
> -
> -		if (!udphy->hs && udphy->hw_mode & UDPHY_MODE_USB)
> -			rk_udphy_u3_port_disable(udphy, false);
> -		udphy->phy_needs_reinit =3D false;
> -
> -		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
> -	} else if (udphy->phy_needs_reinit) {
> -		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
> -
> -		rk_udphy_u3_port_disable(udphy, true);
> -		udelay(10);
> -
> +		}
> +	} else if (target_mode =3D=3D UDPHY_MODE_NONE) {
> +		/* Power down (incl. clocks) */
> +		rk_udphy_disable(udphy);
> +	} else {
> +		/* Mode change =3D> re-init */
>  		ret =3D rk_udphy_init(udphy);

[Severity: Critical]
Does dynamically re-initializing the PHY here destroy the active DP lane
state and silently break the display link?

When a concurrent mode change occurs, such as the DWC3 controller waking
from runtime suspend and requesting UDPHY_MODE_USB, rk_udphy_init is called
to re-initialize the PHY.

During initialization, rk_udphy_init unconditionally asserts resets and
writes 0 to CMN_DP_LANE_EN_ALL. However, rk_udphy_dp_lane_enable is
exclusively called during rk_udphy_dp_phy_power_on.

Since the DP lanes are never restored after this re-initialization, will
any USB runtime PM transition drop the display link without notifying the
DRM stack?

>  		if (ret) {
>  			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
>  			return ret;
>  		}

[Severity: High]
If rk_udphy_init fails, does this leave the software state permanently
desynchronized from the hardware?

If a failure occurs during a mode change, such as a PLL lock timeout,
rk_udphy_init jumps to its assert_resets error label, leaving all PHY
hardware resets asserted.

Since this error path returns without clearing udphy->status, the software
state will believe the previous mode is actively running while the hardware
is dead. If the subsystem retries or reverts to the old mode,
udphy->status =3D=3D target_mode will erroneously succeed, trapping the PHY
in a broken state.

[ ... ]

> +	/* Ensure USB3 support is enabled when supported and requested */
> +	if (!udphy->hs && target_mode & UDPHY_MODE_USB)
> +		rk_udphy_u3_port_disable(udphy, false);
> =20
> -	udphy->status |=3D mode;
> +	/*
> +	 * Inform DWC3, that we are done with the reset, so that it can deassert
> +	 * its PIPE reset line.
> +	 */
> +	phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);

[Severity: Medium]
Is it safe to unconditionally send PHY_NOTIFY_POST_RESET to the DWC3 driver
here, even when target_mode =3D=3D UDPHY_MODE_NONE?

Since this notification is now sent after the power-down branch calls
rk_udphy_disable, the DWC3 driver may deassert its internal reset line
and resume PIPE communication. Doing this when the PHY is completely powered
off and its clocks are disabled could lead to internal controller state
corruption or SErrors.

[ ... ]

> @@ -1091,9 +1078,11 @@ static int rk_udphy_dp_phy_power_on(struct phy *ph=
y)
>  	int ret;
> =20
>  	scoped_guard(mutex, &udphy->mutex) {
> +		udphy->sw_mode |=3D UDPHY_MODE_DP;
> +
>  		phy_set_bus_width(phy, udphy->dp_lanes);
> =20
> -		ret =3D rk_udphy_power_on(udphy, UDPHY_MODE_DP);
> +		ret =3D rk_udphy_update_power_state(udphy);
>  		if (ret)
>  			return ret;

[Severity: High]
If rk_udphy_update_power_state fails, does this leak the UDPHY_MODE_DP bit
in sw_mode?

The bit is added before the fallible update call and is never reverted on
error. The PHY framework considers the initialization failed and will never
call phy_power_off to clear the state. Future operations will then
incorrectly include this leaked mode in target_mode.

[ ... ]

> @@ -1329,13 +1320,9 @@ static int rk_udphy_usb3_phy_init(struct phy *phy)
> =20
>  	guard(mutex)(&udphy->mutex);
> =20
> -	/* DP only or high-speed, disable U3 port */
> -	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs) {
> -		rk_udphy_u3_port_disable(udphy, true);
> -		return 0;
> -	}
> +	udphy->sw_mode |=3D UDPHY_MODE_USB;
> =20
> -	return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
> +	return rk_udphy_update_power_state(udphy);
>  }

[Severity: High]
By removing the early return for high-speed only configurations (udphy->hs),
does this force full SuperSpeed initialization unnecessarily?

Without the early return, UDPHY_MODE_USB is unconditionally set in sw_mode.
This forces rk_udphy_update_power_state to power up the PMA/PCS and wait
for the SuperSpeed LCPLL to lock, which wastes power on unconnected or
unsupported hardware and may cause LCPLL lock timeouts.

[Severity: High]
Similar to the DP power on routine, if rk_udphy_update_power_state fails
here, does this leak the UDPHY_MODE_USB bit in sw_mode?

The bit is set before the update call and is never reverted on error,
desynchronizing the driver from the PHY subsystem.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-rockchip-u=
sbdp-cleanup-v9-0-e31efbb62d2e@collabora.com?part=3D35
