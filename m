Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6070B23B638
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 01:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786670377; cv=none; b=XU+dWsX4yKpL1W7LWGn3s2W0nW9ZzwE1iDsTSX/Kmex+V+dTBvklWapOgeOLS2PlyGax01MIdNkHZ5ptF17loYVSkXYE1rvjO3k8sZdECxUCmDU9MNlgCd4C6+wJO8Pi79qKcfbMHFQNtqna66EzBaGZO4L1UkzNk8JiR5VVgXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786670377; c=relaxed/simple;
	bh=/UjCEV6WbzbMAtxgCeIipRX833YVny20agINB3+0/gU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LHeCmlr4Dc/e0qPTjb7GlAOiszHgm3pyozZa8lOhzZIhfiVbNfNJA4A4BPMhTFEHB0X1tpczGbDmYPX4Fovs4G1NbLP/51k8lhXnR7BzsoZkwEXmMW6/Kgv/CRkQKaBu/e33Zi0tq7Uuj32k64dNruSv2qdTROneNete5RrpDLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Akg4nvlo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Akg4nvlo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936C81F00A3A;
	Fri, 14 Aug 2026 01:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786670376;
	bh=ORmsrIyAUvbu41PIwJr9uHh8CFUMjNkRXWYEvyViahc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Akg4nvloaI1tS5nnlFglMQB/tmpuSwIKnhaf5LHNI4zGQVekt9+NGdM6uB7EXN9AP
	 +ICez8H+yppx7F37hArMPflnGA+lGx65QbqS+NnZmn6VhUxOiaVBD5SC6ePhkOzIW7
	 spU5ARygwQqBbZCdS3xqlQMClGksktHYO7mHLGHSdgzdlYMbtzNLLkqbrNKflhdcIy
	 x6jsHIoakouNorx8Z3VImeiS51ZtX8cu0yCMvVrz7d354XK5CG/Mzc6da1KE49LEXB
	 eneEMoDIDYsK3hggFp1usWWg1NcXIBLNNEdKEap63eApCsJeApw18+Thlcv5nsF5Ed
	 xYMmQs5/nKgVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 02/38] phy: rockchip: usbdp: Update mode_change
 after error handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-2-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-2-b5ad9c68fa11@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 01:19:35 +0000
Message-Id: <20260814011935.936C81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The PHY status tracking drops the active mode state when handling =
a mode change, potentially causing premature PHY shutdown for active client=
s.
- [High] Transitioning to a combo mode (DP+USB) fails to re-enable the USB3=
 port because `rk_udphy_u3_port_disable(udphy, false)` is never called in t=
he mode_change path.
- [High] Returning success (0) for an unsupported mode in `rk_udphy_power_o=
n()` bypasses PHY clock enablement, leading to a kernel panic when the call=
er performs unclocked register accesses.
- [High] Type-C mux handler allows 4-lane DP states on 2-lane hardware, usi=
ng uninitialized lane mappings and corrupting hardware configuration.
--

--- Patch [2]: [PATCH v14 02/38] phy: rockchip: usbdp: Update mode_change a=
fter error handling ---
commit 44520eeef5c577fb420ec25d39b4f335cf37c1a1
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Update mode_change after error handling

If rk_udphy_init() or rk_udphy_setup() fails, the reinit will not be
tried again. Fix this by only updating the variable after all potential
errors have been handled.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612163835.8D5471F000E9@smtp.=
kernel.org/
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index fba35510d88ce..a5ffdf7a6e76b 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1000,15 +1000,14 @@ static int rk_udphy_power_on(struct rk_udphy *udp=
hy, u8 mode)

[Severity: High]
This is a pre-existing issue, but returning 0 (success) for an unsupported
mode bypasses PHY clock enablement.

If rk_udphy_power_on() is called with a mode not currently present in
udphy->mode (for example, DP forced by DRM when the PHY is configured for
USB-only), it prints an info message and returns 0:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_on() {
	if (!(udphy->mode & mode)) {
		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
		return 0;
	}
        ...
}

Because it returns success instead of an error code like -EOPNOTSUPP, the
caller assumes the PHY and its clocks are fully enabled.

Will this cause the caller to proceed with operations like
rk_udphy_dplane_enable() and trigger an SError when writing to the unclocked
pma_regmap?

>  	}
> =20
>  	if (udphy->status =3D=3D UDPHY_MODE_NONE) {
> -		udphy->mode_change =3D false;
>  		ret =3D rk_udphy_setup(udphy);
>  		if (ret)
>  			return ret;
> =20
>  		if (udphy->mode & UDPHY_MODE_USB)
>  			rk_udphy_u3_port_disable(udphy, false);
> -	} else if (udphy->mode_change) {
>  		udphy->mode_change =3D false;
> +	} else if (udphy->mode_change) {
>  		udphy->status =3D UDPHY_MODE_NONE;

[Severity: High]
This isn't a bug introduced by this patch, but does resetting the status to
UDPHY_MODE_NONE here lose track of other active clients?

When a Type-C event triggers a mode change while both DP and USB clients are
active (status =3D=3D UDPHY_MODE_DP | UDPHY_MODE_USB), one client like DP m=
ight
call rk_udphy_power_on().

This branch resets udphy->status to UDPHY_MODE_NONE and reinitializes the
PHY. At the end of the function, it sets udphy->status |=3D mode (which is
only UDPHY_MODE_DP), permanently losing the UDPHY_MODE_USB bit.

If the DP client later powers off, the status becomes UDPHY_MODE_NONE, and
the PHY is physically disabled.

Could this cause a kernel panic (SError) if the DWC3 USB controller is still
active and tries to access the unclocked/unpowered PHY?

[Severity: High]
This is a pre-existing issue, but this mode_change branch seems to omit
re-enabling the U3 port.

If the system boots or engages DP-only mode, rk_udphy_u3_port_disable(udphy,
true) disables the USB3 port.  When a Type-C event requests Combo mode
(UDPHY_MODE_DP_USB), rk_udphy_power_on() executes this mode_change block.

Unlike the initial boot path which checks if (udphy->mode & UDPHY_MODE_USB),
this branch doesn't appear to re-enable the U3 port.

Does this leave the USB3 port disabled in hardware, causing USB 3.0 data
transfers to fail silently when transitioning to a combo mode?

>  		if (udphy->mode =3D=3D UDPHY_MODE_DP)
>  			rk_udphy_u3_port_disable(udphy, true);
> =20
> @@ -1017,6 +1016,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy=
, u8 mode)
>  		ret =3D rk_udphy_setup(udphy);
>  		if (ret)
>  			return ret;
> +		udphy->mode_change =3D false;
>  	}
> =20
>  	udphy->status |=3D mode;

[Severity: High]
This is a pre-existing issue, but does the Type-C mux handler allow 4-lane
DP states on 2-lane hardware?

If the hardware has only 2 lanes (specified via rockchip,dp-lane-mux in DT),
rk_udphy_parse_lane_mux_data() initializes udphy->dp_lane_sel[0] and [1],
leaving [2] and [3] as 0.

However, if an unsupported 4-lane Alt Mode request is accepted, it sets
mode =3D UDPHY_MODE_DP.  When the PHY powers on, rk_udphy_dplane_select()
computes shifts using the uninitialized elements:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dplane_select() {
    ...
	case UDPHY_MODE_DP:
		value |=3D 2 << udphy->dp_lane_sel[2] * 2;
		value |=3D 3 << udphy->dp_lane_sel[3] * 2;
		fallthrough;
    ...
}

Because they are both 0, it computes 2 << 0 and 3 << 0.

Could this corrupt the lane selection bits for lane 0 and write an invalid
bitmask to the hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-rockchip-u=
sbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com?part=3D2
