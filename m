Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A8A2FDC27
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 21:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782508586; cv=none; b=COMYDfIJ8vUcuKNQwqQQfe8L35+ZF/L6r+rxXZmgnZ8NQ9vY8McsPA5ETz/YRuNwuMYoUKjSQTbRgHDbXCwdl/d4krQn1K4IQM8xBwc+0M4KNmZHlzxOD8rNT7kBNKOkkqFoIF0FowyyNRonImGi15lVWZoxZfZhUhh88AMxF0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782508586; c=relaxed/simple;
	bh=tE6sgGEYhzw7/8HY52SzKgpzvwewl/C2OKL9riJpAgE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DKKLu4eBK8XBQ+mTAHkwGpb9oJQhqm6gNQ2joygeLbJYs+cmPnfYpT5LxmD9maDpZtZDpWhXXU6Oj4Vw8P8B5tu0wFkXWzSVE+LG4I7zcxg7h9MuA4Ez4ecB7Z2ddC9rjN3jcMB3D7Ojv4SCGd9jlrM2inA8BN403IfDLDA7MNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NP7SHClv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NP7SHClv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B06A1F00A3A;
	Fri, 26 Jun 2026 21:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782508584;
	bh=KmTa9EWFcjjs/UzPD8dR70INSTu++99OmYLpPcfybYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NP7SHClvdT3HEvWwt5zxzgx7b0RMNIQKW23poSBlsG3pUj7/6o2Dt7pCpxyHj5kMN
	 jXDlIz/DsZ3gDs5VFNJB73bMCgkEDGX6eSxiPSaaUX2sQvYOsZ7Sse1br1d475V2n+
	 IAbnBNceviyUL4Sw3ebnHmMoMqC9QCkPJNQbWDvA9EEkibS4bSL2lbNoL7uxTsU4Qa
	 za216jPtOOceGg1UwJfZWk9HHTGroQ+cXPalnPhJZDqx47cCX/08yJRpGcNuUMNo4L
	 Qg6BC3Sv3ZE6wtZcdMjK7Dt4IbY5MY4cL5UGY7PpgBuyB0eYSinR0vrENWXmCGd5VS
	 HV4EIsCt0W3UA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 06/29] phy: rockchip: usbdp: Drop seamless DP
 takeover
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-6-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
 <20260626-rockchip-usbdp-cleanup-v8-6-47f682987895@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 21:16:23 +0000
Message-Id: <20260626211624.5B06A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unconditionally disabling the active DP PHY while the upstream dis=
play controller is still streaming data causes an AXI bus stall and system =
hang on Rockchip SoCs.
- [High] Forcing DP HPD to disconnected during probe permanently breaks fix=
ed eDP/DP displays.
--

commit 31addd0a9ff6667916e1a40ca73d061ababa8583
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Drop seamless DP takeover

This commit drops support for seamless DP takeover from the bootloader. If a
pre-enabled DP PHY is detected, it logs a warning, forces HPD low, and
unconditionally disables the PHY.

Link: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.ke=
rnel.org/

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 3fc8222fcaec2..f7ff55f03b7cf 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -938,10 +939,12 @@ static int rk_udphy_get_initial_status(struct rk_ud=
phy *udphy)
>  	rk_udphy_reset_deassert_all(udphy);
> =20
>  	regmap_read(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET, &value);
> -	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_A=
LL, value))
> -		udphy->status =3D UDPHY_MODE_DP;
> -	else
> -		rk_udphy_disable(udphy);
> +	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_A=
LL, value)) {
> +		dev_info(udphy->dev, "Started with DP PHY pre-enabled; seamless takeov=
er unsupported\n");
> +		rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trig=
ger, false);

[Severity: High]
Will forcing HPD low here permanently break fixed eDP or DP displays?

While this pulls HPD low to signal a disconnect, fixed eDP/DP boards do not
use Type-C muxes and will never trigger a re-assertion via Type-C events.
Since the upstream DP controller driver does not know about the VO GRF
override, the HPD signal remains permanently forced low, and the display
will be seen as disconnected by the kernel.

> +	}
> +
> +	rk_udphy_disable(udphy);

[Severity: High]
Could calling rk_udphy_disable() synchronously right after forcing HPD low
trigger an AXI bus stall?

If the DP PHY was left enabled by the bootloader, the upstream display
controller (VOP) might still be actively issuing AXI/AHB transactions to the
PHY.=20

The HPD state change via GRF is asynchronous, but this disables the PHY clo=
cks
immediately on the very next line. Removing the clock from an active AXI sl=
ave
often causes the bus to stall indefinitely, resulting in a hard system free=
ze.

> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626-rockchip-u=
sbdp-cleanup-v8-0-47f682987895@collabora.com?part=3D6
