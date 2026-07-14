Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5A43F54AB
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784059325; cv=none; b=ou+YcaXB9TYtzU8UNWfOSVAGqPMOJbWbsecLJDtH1cNDOkCmX3Y3o4eUbUY1a0VRNSzPVCTErqsj39zW/u+JqJulnA4250y2Zyi8ndSzVeNqCTGMErEaOhFgO/wmOgD8a9ii7Zfse3M+N3nNO+RTuZEApK8FiGdUVJ3yGjztzhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784059325; c=relaxed/simple;
	bh=aI9nSj2nUAVpg01rZQ2L2M64ckDSR0IK3+KqY1Ot6ZQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t4qcf489icrItencbO4NROAFvaCBoJHDhURsZuQhzpGuSQo7qbzC+xpcUPWjm8XmoLNQGxVmgvsCqUA6cHn4rdguQOgWKwf9ENnY1HOgg0271xr3zdEKwCZm/2bIAhrOp6ztmOv6kppM3R6/ayKzMTAPFNLuaJNdqxj4CM4fEcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9V2CDRj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9V2CDRj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F541F00A3A;
	Tue, 14 Jul 2026 20:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784059318;
	bh=UDJIT3Wc6aA9Q1xwXyK/PSKaA59Lc/tsV5lpmkJ/x1E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W9V2CDRjLKRO6lKgQ92L08Lv5pvFWSrHNl3W3wMtpVJvO6roREycuf3hISGeg5GDl
	 P6mC87jNKQQVl38tChnl+VOypPcXftEJ8N67jySLPwi2LsyDjc23imF0rzfCFT/yJs
	 LNlh2D+hYLAr5MwTI26vYBkvTvYOWaBds9IYb2cyXOXWkuLh2cZyMvwHBpkTst/rv4
	 f2CBuTUAXP9y7jb3pgYez3uKOLzX+YUnGZZ0rLCLYMLevtF9g76VRMYjFf2SuS2R8F
	 Q1MijBMWxmWLjh6/3FXeM8lMXIenHNUKRE7yNOBucRVUF03RXIbI1sUg3hc+Cvki45
	 7cdofwKVlw52w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 06/35] phy: rockchip: usbdp: Drop seamless DP
 takeover
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-6-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
 <20260714-rockchip-usbdp-cleanup-v13-6-6cb3e769d4c5@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 20:01:57 +0000
Message-Id: <20260714200158.53F541F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unbalanced clock disable in the `rk_udphy_power_on()` error path d=
uring mode changes, leading to a potential clock reference count underflow.
- [High] Data race on DP PHY configuration arrays `dp_lane_sel` and `lane_m=
ux_sel` without mutex protection.
--

--- Patch [6]: [PATCH v13 06/35] phy: rockchip: usbdp: Drop seamless DP tak=
eover ---
commit 9eb0b683c1a1900efc12a73348d324147ff4047f
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: phy: rockchip: usbdp: Drop seamless DP takeover

This commit drops support for seamless DP takeover in the Rockchip USBDP
PHY driver. The feature was missing implementation in both DRM drivers
and bootloaders, and proper USB-C state machine handoff would require
significant work. The untested code supporting it is therefore removed.

Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.=
kernel.org/

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 3fc8222fcaec2..6cb9f6b4dbf6d 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
[ ... ]
> @@ -1495,10 +1468,6 @@ static int rk_udphy_probe(struct platform_device *=
pdev)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D rk_udphy_get_initial_status(udphy);
> -	if (ret)
> -		return ret;
> -
>  	mutex_init(&udphy->mutex);
>  	platform_set_drvdata(pdev, udphy);
> =20

While reviewing this file, I noticed a couple of pre-existing issues in
other areas of the driver:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_on() {
[ ... ]
	} else if (udphy->mode_change) {
		if (udphy->mode =3D=3D UDPHY_MODE_DP)
			rk_udphy_u3_port_disable(udphy, true);

		rk_udphy_disable(udphy);
		ret =3D rk_udphy_setup(udphy);
		if (ret)
			return ret;
		udphy->mode_change =3D false;
	}

	udphy->status |=3D mode;

	return 0;
}

[Severity: High]
This isn't a bug introduced by this patch, but does the error path in
rk_udphy_power_on() lead to an unbalanced clock disable during mode changes?

When transitioning modes, rk_udphy_power_on() disables the clocks via
rk_udphy_disable() to reset the state, and then calls rk_udphy_setup().

If rk_udphy_setup() fails, it returns early without updating udphy->status.
The software state retains the active mode, but the hardware clocks are
disabled.

When the consumer later calls rk_udphy_power_off(), it reads the active
status, clears it, and calls rk_udphy_disable() again.

Could this result in a double-disable and a potential clock reference count
underflow?


drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_configure() {
[ ... ]
	if (dp->set_voltages) {
		for (i =3D 0; i < udphy->lanes; i++) {
			lane =3D udphy->dp_lane_sel[i];
			switch (udphy->link_rate) {
			case 1620:
			case 2700:
				regmap_update_bits(udphy->pma_regmap,
						   TRSV_ANA_TX_CLK_OFFSET_N(lane),
						   LN_ANA_TX_SER_TXCLK_INV,
						   FIELD_PREP(LN_ANA_TX_SER_TXCLK_INV,
						   udphy->lane_mux_sel[lane]));
[ ... ]
}

[Severity: High]
This is a pre-existing issue, but is there a data race when accessing the
DP PHY configuration arrays?

rk_udphy_dp_phy_configure() is called by the PHY framework and reads
udphy->dp_lane_sel and udphy->lane_mux_sel without acquiring udphy->mutex.

Concurrently, type-C workqueues can write to these same arrays while holding
udphy->mutex:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_typec_mux_set() {
[ ... ]
	mutex_lock(&udphy->mutex);

	switch (state->mode) {
	case TYPEC_DP_STATE_C:
	case TYPEC_DP_STATE_E:
		udphy->lane_mux_sel[0] =3D PHY_LANE_MUX_DP;
		udphy->lane_mux_sel[1] =3D PHY_LANE_MUX_DP;
		udphy->lane_mux_sel[2] =3D PHY_LANE_MUX_DP;
		udphy->lane_mux_sel[3] =3D PHY_LANE_MUX_DP;
[ ... ]
}

If an asynchronous type-C event arrives while the display controller is
configuring the PHY for link training, can the arrays be read in a partially
updated state?

Could this result in an invalid DP lane configuration being applied to the
hardware, leading to DP alt mode failure or display corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-rockchip-u=
sbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com?part=3D6
