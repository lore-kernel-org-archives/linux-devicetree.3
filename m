Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6253AFAF4
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 19:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783624887; cv=none; b=CRQZdJ40oqk46J22fEAzY6JqQ9gssOpbiT1Wr0Wy86yfI3zJLQQR7Wl39ThPrrIwz/EyzYOmDnFXsVOU1mG53gyYR7IZGf+CKMtN6gCE2Ijjz9ZIAxvcvQ4Mvu3Y7p56WVrkBKN1rMP9n9vqi0vzbkKCghHAM4D1M0WkkkPGXs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783624887; c=relaxed/simple;
	bh=uGX6CTXfGlcrEjhdPRwZDWJw0v/HJ1cjCQzNxOjhUyY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DR54ajIRD3B10rsM3pfU9KA/P1BLNAAQ9cmehfABDAnOqwBd/537Oezoaag6z9FINag+GFsbgAyI/sqDR0xVoxAzCm+HO0U6SecQ6tTiiNEYKbYCZH5pssTIayKdB7h6xiwmwlt7UXQSdYRKyx4bDjhNvpm3GPBTHEwZ6220LF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JMkckb6/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JMkckb6/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72CF61F000E9;
	Thu,  9 Jul 2026 19:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783624885;
	bh=DNmTkwcBnzxTjrCC37k0A/W6iNdJ5fj0ljG7c/dbdOI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JMkckb6/JrcIauEbAPjA47PSq7j3Vl31AMiKfaKcZcVQf3a7+j8b/zLEq+DDpxoXT
	 8EfI5kFv4vskHeWH7g1Ih9onaYLCKcc519gX/ZuwXIjMjbc1udo72t6X95x8Uyz+e4
	 OMk5ZX9R7C2zN7v/854sKCjbqnh3kEcvqVI6L6x1iK2uayWbNkDpAUATLBjXwrQQkC
	 Zj5vaQyHvxIF7KHiucZGdOeZbX9khtOcQSt8EL7HmXmnSLnS5JuG35p38k94M3q4Go
	 6bAhCY1svDLQ/eje5BKEylN9gfaQo9UlV8eNU1+bMU68qlhy17zBs8r9es6Q0KKzKJ
	 Ng6H25UTZITZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 12/36] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-12-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
 <20260709-rockchip-usbdp-cleanup-v11-12-a149ac60f76c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 19:21:25 +0000
Message-Id: <20260709192125.72CF61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The DP lane bounds check and PHY configuration execute without hol=
ding the driver's mutex, creating a TOCTOU race condition with concurrent T=
ype-C events.
- [High] The newly added lane count check is bypassed during standalone DP =
voltage updates, allowing the same USB3 register corruption the patch inten=
ded to fix.
--

--- Patch [12]: [PATCH v11 12/36] phy: rockchip: usbdp: Limit DP lane count=
 to muxed lanes ---
commit 42fd02565f1c138c8faee25d5fd929ceb0f2e7e3
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: phy: rockchip: usbdp: Limit DP lane count to muxed lanes

This patch adds a check to limit the DisplayPort lane count to the muxed
lanes, preventing the DP controller from configuring 4 lanes when the PHY
is restricted to 2 lanes. This aims to protect USB3 usage from being
corrupted by incorrect voltage configurations.

Link: https://lore.kernel.org/linux-phy/20260612165546.98E1F1F000E9@smtp.ke=
rnel.org/

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index c4d62b234ea80..b172ce6a722ee 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1099,6 +1099,9 @@ static int rk_udphy_dp_phy_verify_link_rate(struct =
rk_udphy *udphy,
>  static int rk_udphy_dp_phy_verify_lanes(struct rk_udphy *udphy,
>  					struct phy_configure_opts_dp *dp)
>  {
> +	if (dp->lanes > udphy->dp_lanes)
> +		return -EINVAL;
> +

[Severity: High]
This is a pre-existing issue, but does this bounds check need to be
protected by a lock?

If a Type-C event (like a cable flip reducing DP lanes from 4 to 2)
occurs concurrently with a DP link training operation, could the bounds
check pass while udphy->dp_lanes is 4?

If a context switch allows the Type-C handler to reduce the lane count
and change udphy->lane_mux_sel while holding udphy->mutex, when this
thread resumes and proceeds to rk_udphy_dp_phy_configure() (which is
called without holding udphy->mutex), could it overwrite hardware
registers of physical lanes now assigned to USB3:

rk_udphy_dp_phy_configure() {
    ...
    lane =3D udphy->dp_lane_sel[i];
    ...
    regmap_update_bits(udphy->pma_regmap,
                       TRSV_ANA_TX_CLK_OFFSET_N(lane),
                       LN_ANA_TX_SER_TXCLK_INV,
                       FIELD_PREP(LN_ANA_TX_SER_TXCLK_INV,
                       udphy->lane_mux_sel[lane]));
    ...
}

[Severity: High]
This is also a pre-existing issue, but will this check be bypassed
during standalone DP voltage updates?

If a Type-C event asynchronously reduces udphy->dp_lanes (e.g., from
4 down to 2), and the DP controller subsequently issues a standalone
voltage update (where dp->set_voltages=3D1 and dp->set_lanes=3D0) prior to
a full link retrain:

rk_udphy_dp_phy_configure() {
    ...
    if (dp->set_lanes) {
        ret =3D rk_udphy_dp_phy_verify_lanes(udphy, dp);
        if (ret)
            return ret;
    }
    ...
}

Would rk_udphy_dp_phy_verify_lanes() be bypassed entirely? This would
allow the configuration loop to iterate up to the stale cached
udphy->lanes limit:

rk_udphy_dp_phy_configure() {
    ...
    for (i =3D 0; i < udphy->lanes; i++) {
    ...

and potentially cause the out-of-bounds writes to the USB3 hardware
registers that this patch intends to prevent.

>  	switch (dp->lanes) {
>  	case 1:
>  	case 2:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-rockchip-u=
sbdp-cleanup-v11-0-a149ac60f76c@collabora.com?part=3D12
