Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACAD32B13E
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 23:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782950383; cv=none; b=V5gS4Co+MnVRZ365G5B2UyyNi9752qQo2YComDQV2vjUnjR476Agu+gLE1WpGZeSC2KyB0u6tRcPV3vbSv2EPk42C79z72fzbONu8+Jlb//K9zuV9X/gxTv5VIidzzUYzazye7BZ0ho2TiR3+GLf3lpRzAKdkQ9xLe6+MGlNUuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782950383; c=relaxed/simple;
	bh=tv5mHOsLwxrXVP0eY4durfLO1jHBuKFhgoq3b7ldnMM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KLH47QgDjQvukVP8Dmfi2WamtV8Qbe1YVZXtGiIeWEJ1C8S5B9UGnij49xDXXguO/VSu+a3AVPsqtnc6u0BH/jNCoafTaiRlCSFZVlYxnSc+VeDBFr339N290aKv2jay4JX2XwWjImxVrPtRpt3RsRhNpqQQlACZPY8V0vWN7lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PnT+f5cZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PnT+f5cZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB6F1F000E9;
	Wed,  1 Jul 2026 23:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782950382;
	bh=gJi862FfvBLrfFNrclBDTwE6ISz+czGKhEhxq9xpjJE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PnT+f5cZfGwmMK4Eh90O5pYu6JJp1VZN6rrN03/408UTBCB/ArCeDqCANua1IQjDy
	 BbvmawD2Nf4+dyPhxnKIa6VBuVCYuH3IfRsNvtLQQsaA7He0Y1p+H6vyIoItJLhqZl
	 mNWd4gOJExWsKaO8DGRZujWBkcxRPT7B6qgo0Ks4OjEqyyG2AN4ozsK4FguFDhkkYj
	 gmWzR+CuQ6PA5q5TkUCWzkfH0avpUCqE7HrgDLu6Q3/6zPR9+moK0OQ97sF69NEOl7
	 i2PV3pjk/ea04sko1ATCJRTzEWl+Ziskx0hbQe6d8nvYZeBnGdzvOr4WDwsadqx0w+
	 DBYWTz1S/RA2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 13/38] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, vkoul@kernel.org, robh@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-13-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
 <20260702-rockchip-usbdp-cleanup-v9-13-e31efbb62d2e@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 23:59:41 +0000
Message-Id: <20260701235942.1DB6F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix: the added DP lane count validation is bypassed whe=
n updating voltages, leading to USB3 PHY corruption.
--

commit e3930e8c2271673fb1869d7c43a33a65c3e10987
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Limit DP lane count to muxed lanes

This commit adds a check to limit the DisplayPort lane count to the number
of muxed lanes. This ensures the DP controller cannot configure 4 lanes
when the PHY is restricted to 2 lanes, protecting USB3 functionality.

Link: https://lore.kernel.org/linux-phy/20260612165546.98E1F1F000E9@smtp.ke=
rnel.org/

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index da15178d7f16e..0cfd23a405cb0 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1134,6 +1134,9 @@ static int rk_udphy_dp_phy_verify_link_rate(struct =
rk_udphy *udphy,
>  static int rk_udphy_dp_phy_verify_lanes(struct rk_udphy *udphy,
>  					struct phy_configure_opts_dp *dp)
>  {
> +	if (dp->lanes > udphy->dp_lanes)
> +		return -EINVAL;
> +

[Severity: High]
This is a pre-existing issue, but does this validation fully protect against
USB3 lane corruption?

This check is placed in rk_udphy_dp_phy_verify_lanes(), which is only
executed when dp->set_lanes is true.=20

If a Type-C mux switch reduces udphy->dp_lanes from 4 to 2, but an ongoing
DP link training loop subsequently calls phy_configure() with
dp->set_voltages =3D 1 and dp->set_lanes =3D 0, this new check is skipped.

The voltage configuration loop in rk_udphy_dp_phy_configure() will then
iterate using the stale udphy->lanes count:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_configure() {
    ...
    if (dp->set_voltages) {
        for (i =3D 0; i < udphy->lanes; i++) {
    ...
}

Could this still write DP configurations into PMA registers corresponding to
lanes 2 and 3, which are actively assigned to USB3? Even after later commits
add a mutex to rk_udphy_dp_phy_configure(), udphy->lanes doesn't appear to =
be
clamped to match udphy->dp_lanes during voltage-only updates.

>  	switch (dp->lanes) {
>  	case 1:
>  	case 2:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-rockchip-u=
sbdp-cleanup-v9-0-e31efbb62d2e@collabora.com?part=3D13
