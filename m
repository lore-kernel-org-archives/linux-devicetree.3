Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AD63E023A
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 16:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781283348; cv=none; b=t4cDoxuBPyJ7kAen65ddGh6/1ELvtdAtAKF6eFmjWoTA4YE9SZgZJermH8/JgNEujQ4dIZi/MHoJAlIuvReXpScLkp5Mzz/PDJMyVUP1FismN5FncVSPA2rRzOtm2dNMrD4DgOy8pKTAxu+hmMsd1uCA2o/4YlSHQKst3Bi3aHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781283348; c=relaxed/simple;
	bh=aO1c/EP9pynvs5sP5XSjLsP6xMvrPeEvyqs0urYIlG0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r5c0luLzaFYE9raVjYaEHKgUHSbYRwyEXLd3G/SRazfuxxvoxgHd+UWQKsCrB1A2f6moHkKsj0OpyHtLQtuc982ToNCBVcBoyGKmGBj/j82XscBWiEyWsQjYC6qQupnARSf271eaSMs4SsXUH5hP2CwFUnUjIBMdoF116RTVzUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CAAFFSnq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAAFFSnq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E1F1F000E9;
	Fri, 12 Jun 2026 16:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781283347;
	bh=3Vzfc9HirnSF3zMElWl/zEwg1b4O0ieN8ZAsLgsaBzA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CAAFFSnqR+ihh1p+h1aP7S60q2OBcEp2cYZ2W6ZqFnZNRzAxM0NXNhzGqtRHpZ+T4
	 A77PvJKtSxYdN7z4qchS8gfm+gYOF1fz3ZBcmPYM/zHZ8V1GuC6O64MYCVztfSyAMZ
	 J+Jt8vVn3DegSXlKT65qaYZ/cz4BtIimyjlUcA/4Dc2jz/lJGpzdbwhDCyJqNe9AQW
	 5qB066+ORiYau3l/98PtxkZ4udBbDlMoxUlVP0FLStjYhmNqg5SSx8dfxQ994K0g/o
	 yGxc02wzRwmKFeg3Bf5JvW5dg3rqZ1+vkGYnxkoCX/FWFmRL30lJclkHxRjKH5kD48
	 DBakxSm00vxJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/18] phy: rockchip: usbdp: Support single-lane DP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-7-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-7-efc83069869f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 16:55:45 +0000
Message-Id: <20260612165546.98E1F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Incorrect USB orientation (`flip`) configuration when 1-lane DP =
is assigned to lane 1.

Pre-existing issues:
- [High] Writing to PMA registers while PHY clocks are disabled when DP mod=
e is not supported.
- [High] Clock resources enabled during probe are leaked on probe error pat=
hs and upon driver unbind.
- [High] The DP PHY configuration lacks boundary checks against the physica=
l lane count, leading to USB register corruption.
--

commit c46d73844b37e1f374324a737da2265a3fef0813
Author: Zhang Yubing <yubing.zhang@rock-chips.com>
Subject: phy: rockchip: usbdp: Support single-lane DP

This commit implements support for using a single DisplayPort line in the
Rockchip USBDP PHY driver.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index febc148a754e0..bf8394174294e 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
[ ... ]
> @@ -923,7 +910,8 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udp=
hy *udphy)
>  	}
> =20
>  	udphy->mode =3D UDPHY_MODE_DP;
> -	if (num_lanes =3D=3D 2) {
> +	udphy->dp_lanes =3D num_lanes;
> +	if (num_lanes =3D=3D 1 || num_lanes =3D=3D 2) {
>  		udphy->mode |=3D UDPHY_MODE_USB;
>  		udphy->flip =3D (udphy->lane_mux_sel[0] =3D=3D PHY_LANE_MUX_DP);
>  	}

[Severity: Medium]
When configuring a single DP lane, does this correctly set the flip state if
the DP lane is assigned to lane 1 instead of lane 0?

For a 1-lane DP setup where rockchip,dp-lane-mux =3D <1>, lane 1 is occupied
by DP, so USB must be mapped to the lane 2 and 3 pair. This requires the
flip state to be true so the driver correctly polls lane 2 for USB RX CDR
lock.

However, in this scenario lane_mux_sel[0] will not be PHY_LANE_MUX_DP, maki=
ng
flip evaluate to false. This might cause the driver to poll the unconnected
lane 0 for USB lock and time out. Should this condition check if either lane
0 or lane 1 is occupied by DP?

[ ... ]
> @@ -1074,18 +1062,17 @@ static int rk_udphy_dp_phy_exit(struct phy *phy)
>  static int rk_udphy_dp_phy_power_on(struct phy *phy)
>  {
>  	struct rk_udphy *udphy =3D phy_get_drvdata(phy);
> -	int ret, dp_lanes;
> +	int ret;
> =20
>  	mutex_lock(&udphy->mutex);
> =20
> -	dp_lanes =3D rk_udphy_dplane_get(udphy);
> -	phy_set_bus_width(phy, dp_lanes);
> +	phy_set_bus_width(phy, udphy->dp_lanes);
> =20
>  	ret =3D rk_udphy_power_on(udphy, UDPHY_MODE_DP);
>  	if (ret)
>  		goto unlock;
> =20
> -	rk_udphy_dplane_enable(udphy, dp_lanes);
> +	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);

[Severity: High]
This is a pre-existing issue, but can this sequence crash the system if the
DP mode is not supported?

In rk_udphy_power_on(), if the mode does not include UDPHY_MODE_DP, it
prints an error message and returns 0 instead of an error code:

rk_udphy_power_on() {
    if (!(udphy->mode & mode)) {
        dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
        return 0;
    }
    ...
}

Because it returns success, the execution falls through in
rk_udphy_dp_phy_power_on() and proceeds to call rk_udphy_dplane_enable().

This performs register operations on memory-mapped PHY registers. Accessing
these registers while the corresponding PHY clocks remain disabled can
result in a synchronous external abort and crash the kernel. Should
rk_udphy_power_on() return an error like -ENODEV to properly abort this
sequence?

[ ... ]
> @@ -1529,7 +1518,7 @@ static int rk_udphy_probe(struct platform_device *p=
dev)
>  		ret =3D PTR_ERR(udphy->phy_dp);
>  		return dev_err_probe(dev, ret, "failed to create DP phy\n");
>  	}
> -	phy_set_bus_width(udphy->phy_dp, rk_udphy_dplane_get(udphy));
> +	phy_set_bus_width(udphy->phy_dp, udphy->dp_lanes);

[Severity: High]
This is a pre-existing issue, but does the probe sequence leak clock
resources on error paths?

In rk_udphy_get_initial_status(), if the hardware is already in DP mode,
the clocks are enabled and intentionally left enabled:

rk_udphy_get_initial_status() {
    ...
    if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) &&=20
        FIELD_GET(CMN_DP_LANE_EN_ALL, value))
        udphy->status =3D UDPHY_MODE_DP;
    else
        rk_udphy_disable(udphy);
}

However, if subsequent operations in rk_udphy_probe() fail, the probe
function returns directly without calling clk_bulk_disable_unprepare():

rk_udphy_probe() {
    ...
    udphy->phy_u3 =3D devm_phy_create(dev, dev->of_node,=20
                                    &rk_udphy_usb3_phy_ops);
    if (IS_ERR(udphy->phy_u3)) {
        ret =3D PTR_ERR(udphy->phy_u3);
        return dev_err_probe(dev, ret, "failed to create USB3 phy\n");
    }
    ...
}

Additionally, there appears to be no remove callback or devm action
registered to clean up these manually enabled clocks when the driver
unbinds.

[Severity: High]
This is also a pre-existing issue, but could a consumer request more lanes
than are physically configured in udphy->dp_lanes?

In rk_udphy_dp_phy_verify_lanes(), the driver validates that the requested
lane count is 1, 2, or 4, but it does not check if the requested lanes
exceed the physically configured capacity:

rk_udphy_dp_phy_verify_lanes() {
    ...
    switch (dp->lanes) {
    case 1:
    case 2:
    case 4:
        udphy->lanes =3D dp->lanes;
        break;
    ...
}

If a consumer requests 4 lanes on a 1-lane or 2-lane configuration,
rk_udphy_dp_phy_configure() will iterate up to the requested lane count,
reading from unconfigured indices:

rk_udphy_dp_phy_configure() {
    ...
    for (i =3D 0; i < udphy->lanes; i++) {
        lane =3D udphy->dp_lane_sel[i];
        ...
        rk_udphy_dp_set_voltage(udphy, udphy->bw, dp->voltage[i],
                                dp->pre[i], lane);
    }
}

When writing voltage settings, this will overwrite the transceiver
registers for those unintended lanes. If one of those lanes is actively
assigned to USB, this could silently corrupt the active USB connection.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-rockchip-u=
sbdp-cleanup-v5-0-efc83069869f@collabora.com?part=3D7
