Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8501347535
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717662; cv=none; b=trywSruzuGcJvLWN4rDktAkTc+100CCMEpn7GfvWWmRx6SwuJMmTaN6Xk6x7VQIbt57bK+qjVAqU9wDjKzp40wXsjiyEpdLXqHPsMdKrKheOfuFkDpsWkJ66Q/0STkgjre1yK5SWsbUP4+tcMgd31CCnwvzZtymEWYXee0sPbzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717662; c=relaxed/simple;
	bh=QbkEWasvGFkqS7MDUh5Dif7zSSUTlgT56lHXHZjUDjY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RiwXCrRuAb+ZAon+YBmQRa3xaljG0I4mcG/YaooXvrMJhzdocjtyBpjoRucY0qYKtz2pAODKE/FR6ZzhMaI+e+Rfzlq1pYJTeOUPdtBxXSDVy3gCGSzLJeDcbXXEhfe2TEi3xbpzTIrLKsLtKnYVU8alJEhKowVr+gMT0mZ2EcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdmG1IgP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdmG1IgP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D761F000E9;
	Fri, 10 Jul 2026 21:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783717661;
	bh=OjDT+XU08SbkEiLzCZ3Sp0g2d4xORNwQTRirAqxonvE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LdmG1IgPddPqXFjlEboNzWU6K6Cbgw76Ywc3mThJmOwHB64zEV9R+vHxfAaAubMSl
	 ZUlrnrNHu6ZB2XHhH/tWlLIQtrXAXyzBjrf9sQrMgz6aKP84GuEnT7bgLe2pyDLbyY
	 mp4KnTZTorDnyqg2Q81wQBqFdqkSMaXS2HJ2XKAgQMfVnzBSpzkIsadEw/FG2sR3V0
	 DGEJ1Qe6vCGgd7xOD+Bs+8bq+ZZz/+K4yB9rj+lkjYoLDer2eZeUGf23M24SDmPwP+
	 oW1A/dI1piVEGKuHOxOQ43y0aKv6r/1vigHHFqIUelCZQLW7mN/0CwAjyg4xELHAMl
	 SpH7lfqfU/cmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 03/36] phy: rockchip: usbdp: Do not lose USB3 PHY
 status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-phy@lists.infradead.org, olteanv@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-3-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
 <20260710-rockchip-usbdp-cleanup-v12-3-8b41a9a9bef0@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 21:07:40 +0000
Message-Id: <20260710210741.02D761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Removing the clearance of `udphy->status` introduces unbalanced cl=
ock disables and repeated hardware teardowns on the `rk_udphy_setup()` erro=
r path.

Pre-existing issues:
- [High] Missing mutex acquisition in `rk_udphy_dp_phy_configure` leads to =
data races on shared driver state.
- [High] Incomplete handling of mode transitions causes DWC3 SErrors and pe=
rmanently breaks the USB3 data stream.
--

--- Patch [3]: [PATCH v12 03/36] phy: rockchip: usbdp: Do not lose USB3 PHY=
 status ---
commit efe9bcb0d6328640e43461f982816e45f55f9a36
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Do not lose USB3 PHY status

By default (i.e. without manually enabling runtime PM) DWC3 requests the
USB3 PHY once and keeps it enabled all the time. When DisplayPort is
being requested later on, a mode change is needed. This re-initializes
the PHY. During re-initialization the status variable has incorrectly
been cleared, which means the tracking information for USB3 is lost.

This is not an immediate problem, since the DP side keeps the PHY
enabled. But once DP is toggled off, the whole PHY will be disabled.
This is a problem, because the USB side still needs it powered.

Fix things by not clearing the status flags.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index a5ffdf7a6e76b..12dfdd470a782 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1008,7 +1008,6 @@ static int rk_udphy_power_on(struct rk_udphy *udphy=
, u8 mode)
>  			rk_udphy_u3_port_disable(udphy, false);
>  		udphy->mode_change =3D false;
>  	} else if (udphy->mode_change) {

[Severity: High]
This is a pre-existing issue, but I have a question about how the mode
transitions are handled here in rk_udphy_power_on().

When Type-C negotiation changes the mode to UDPHY_MODE_DP_USB, the driver
skips calling rk_udphy_u3_port_disable(udphy, true). It then cuts the PHY
clocks via rk_udphy_disable() while the DWC3 controller might still be
active. Can this cause System Errors (SErrors) from the DWC3 controller?

Additionally, if the old mode was UDPHY_MODE_DP, the USB3 port is disabled
but never re-enabled after rk_udphy_setup() succeeds. Does this leave the
USB3 data stream permanently broken in the GRF registers?

> -		udphy->status =3D UDPHY_MODE_NONE;
>  		if (udphy->mode =3D=3D UDPHY_MODE_DP)
>  			rk_udphy_u3_port_disable(udphy, true);
> =20
>  		rk_udphy_disable(udphy);
>  		ret =3D rk_udphy_setup(udphy);
>  		if (ret)
>  			return ret;

[Severity: High]
Since this clearance is removed, what happens if rk_udphy_setup() fails
immediately after this block?

If rk_udphy_setup() returns an error, the function exits without updating
udphy->status to reflect that the hardware was actually disabled by
rk_udphy_disable() just above.

Could this lead to unbalanced clock disables and repeated resets later when
phy_power_off() or phy_power_on() is called, since the driver still assumes
the PHY is active?

[ ... ]

[Severity: High]
This is a pre-existing issue, but does rk_udphy_dp_phy_configure() need to
hold udphy->mutex when accessing shared driver state?

Looking at drivers/phy/rockchip/phy-rockchip-usbdp.c:

rk_udphy_dp_phy_configure() {
	struct rk_udphy *udphy =3D phy_get_drvdata(phy);
	...
	if (dp->set_voltages) {
		for (i =3D 0; i < udphy->lanes; i++) {
			lane =3D udphy->dp_lane_sel[i];
...

This function reads udphy->dp_lane_sel, udphy->lanes, and
udphy->lane_mux_sel without acquiring the mutex.

Meanwhile, if a Type-C orientation flip occurs, rk_udphy_orien_sw_set()
acquires the mutex and mutates this exact state:

rk_udphy_orien_sw_set() {
	...
	mutex_lock(&udphy->mutex);
	...
	udphy->flip =3D orien =3D=3D TYPEC_ORIENTATION_REVERSE;
	rk_udphy_set_typec_default_mapping(udphy);
...

Can this data race cause voltages to be programmed to the wrong PHY lanes,
leading to DP link training failures if a cable is flipped during active
DisplayPort use?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-rockchip-u=
sbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com?part=3D3
