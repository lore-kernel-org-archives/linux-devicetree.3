Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEE93B7779
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718429; cv=none; b=YLJVNlV+IjWveB5un+SHZ6dG6xuWLk+NP2aBjYl6/OybKIl9bR0sSNmibkyE336G2Ji6jIzaNeczoMy5K58WVrJbaz9q/KhrjMsEModtq/zb0jqYMRV8zBFD8eYpXAej/oLCuLtOciEMhHIGr2Gpn9yCpdviPxT1GR3Fxj4UXl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718429; c=relaxed/simple;
	bh=qB8hSpSlODVhW9ezUcW5d18QL45R20nDbVtfhlnLPjo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r5fnBXG0/ILSWyPoo8mXkUJwFExJ09e1DKDifWq8aM/2STVYPZ66f7N6L+TTuzE0IIqBa8IzlLwH8W65Wqj2rAkvHz4cNaVgXnEwfIPiORAOILCxSAlFO9Ny+0+MLXFwbq/ANs4zq/Cgx3l3+0GkIN0/4vblMzqqtG4tRHrPZuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OYfAhWWd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYfAhWWd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FD81F00A3E;
	Fri, 10 Jul 2026 21:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718428;
	bh=+4C6LHBHn5bWwNjIOH4OmWGa5kFrkHURsLUPb26QVZ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OYfAhWWd/XE0FW78ls054wx3wy6EO7LylctyDh761qlBONhZUg6SL99NvTeBUHgaQ
	 VfPpEsOR8xSF9CnNg2WuEGarG8hPLcKjk1s+FED9GO3gK3UfLFbLIVYGh1nFN6azqI
	 q8AUI9Pq2PIKeZSXgGP4gZLKWDggcNqqCdEoq0a3AZFyYziuOOV6ETSIirSbVOh7H5
	 PONbBIO8/9eyAJTElnLrMcaJzltdlrSw0sWpSaiS0gVbCveKffZ6VTKtRQL6zfc8d4
	 Zv2/ccmbCS2VXEm4amrTus4upLlQr3aift5bnA0sSEXqZy31/awnhgMTj+zHYuppm3
	 hHaSByfOtTauA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 26/36] phy: rockchip: usbdp: Avoid xHCI SErrors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-26-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
 <20260710-rockchip-usbdp-cleanup-v12-26-8b41a9a9bef0@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 21:20:27 +0000
Message-Id: <20260710212027.B0FD81F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Clock and power leak in `rk_udphy_usb3_phy_exit` when Type-C mode =
drops USB support.
- [High] The patch unconditionally re-enables the SuperSpeed U3 port during=
 PHY initialization and re-initialization, ignoring the high-speed restrict=
ion (`udphy->hs`).

Pre-existing issues:
- [High] When a Type-C device is unplugged, the PHY re-initialization is fl=
agged but never executed, leaving the USB3 port physically disabled and bre=
aking subsequent USB3 connections.
--

--- Patch [26]: [PATCH v12 26/36] phy: rockchip: usbdp: Avoid xHCI SErrors =
---
commit 66857e87fceaec79fad3845d46dbfd48c9340977
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Avoid xHCI SErrors

This commit addresses an SError caused by the dwc3 driver accessing xHCI
registers while the USBDP PHY is temporarily disabled during a mode switch.
It resolves this by disabling the USB3 port prior to re-initialization, whi=
ch
safely re-routes the PIPE clock to the UTMI fallback clock.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index edee27933d890..ff768e5b43ca0 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1000,12 +1000,15 @@ static int rk_udphy_power_on(struct rk_udphy *udp=
hy, u8 mode)
>  			rk_udphy_u3_port_disable(udphy, false);
>  		udphy->phy_needs_reinit =3D false;
>  	} else if (udphy->phy_needs_reinit) {
> -		if (udphy->mode =3D=3D UDPHY_MODE_DP)
> -			rk_udphy_u3_port_disable(udphy, true);
> +		rk_udphy_u3_port_disable(udphy, true);
> +		udelay(10);
> =20
>  		ret =3D rk_udphy_init(udphy);
>  		if (ret)
>  			return ret;
> +
> +		if (udphy->mode & UDPHY_MODE_USB)
> +			rk_udphy_u3_port_disable(udphy, false);

[Severity: High]
Does this code unconditionally re-enable the SuperSpeed U3 port purely base=
d on
the mode?

During rk_udphy_usb3_phy_init(), the U3 port is kept disabled if udphy->hs =
is
true. However, when a mode switch or DP power-on triggers a PHY
re-initialization in rk_udphy_power_on(), this new logic executes without
checking !udphy->hs.

Could this result in misconfiguring the hardware by enabling the SuperSpeed=
 U3
port on boards that explicitly restricted the PHY to high-speed
(maximum-speed =3D "high-speed")?

>  		udphy->phy_needs_reinit =3D false;

[Severity: High]
This is a pre-existing issue, but does the phy_needs_reinit state machine g=
et
stuck when a Type-C device is unplugged?

If a DP-only cable is unplugged after a standard USB3 cable was active,
typec_mux_set() reverts to UDPHY_MODE_DP_USB and flags
phy_needs_reinit =3D true. The DP framework calls rk_udphy_dp_phy_power_off=
(),
which clears the DP bit from udphy->status:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_power_off() {
    rk_udphy_dp_lane_enable(udphy, 0);
    rk_udphy_power_off(udphy, UDPHY_MODE_DP);
}

Because the USB3 controller never suspended, udphy->status remains non-zero
(set to UDPHY_MODE_USB), so the PHY isn't disabled. Crucially, no driver ca=
lls
rk_udphy_power_on() to process the pending phy_needs_reinit state.

Will this strand the active USB3 PHY in a disabled physical state, breaking
subsequent USB3 connections?

>  	}

[Severity: High]
Regarding the related commit in this series that clears USB status on PHY e=
xit,
is there a clock and power leak in rk_udphy_usb3_phy_exit() when the Type-C
mode drops USB support?

In rk_udphy_usb3_phy_exit():

	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
		udphy->status &=3D ~UDPHY_MODE_USB;
		return 0;
	}

When the Type-C mode dynamically changes to a state without USB support (e.=
g.,
a DP-only cable is connected), udphy->mode becomes UDPHY_MODE_DP. If the USB
controller then suspends and calls phy_exit(), rk_udphy_usb3_phy_exit()
executes this early return.

This clears the UDPHY_MODE_USB bit from udphy->status, but misses checking =
if
udphy->status =3D=3D UDPHY_MODE_NONE. Could this completely fail to call
rk_udphy_disable(), wasting power and potentially blocking system suspend?

Additionally, rk_udphy_power_off() inappropriately refuses to turn off acti=
ve
hardware features if the negotiated Type-C udphy->mode has already shifted
away from the requested mode:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_off() {
	if (!(udphy->mode & mode)) {
		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
		return;
	}
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-rockchip-u=
sbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com?part=3D26
