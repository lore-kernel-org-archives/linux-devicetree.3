Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546DA1A238F
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 23:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782950344; cv=none; b=T6WDkrlToLI66FdYyl4lCrDk1V65efRzOa2LqBPI9yIHkXfdWJQsJeXGBJEUZw4tEoWMtXnS8o4REhRLmHMkSIXTahwj5VayMs6n94kaG9U617TpZI4KNiVrD6v5nXbsILMHBjIszNtCO77AlpvqhtdjHKqK0QzqcdJncjfEAtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782950344; c=relaxed/simple;
	bh=NqjiYJRN9eke/4mseL9qWyf/DXDnNd5Ln1JsWiQjJ7o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ISH8Ybrt3A1wlj6OW/cTF9wJJlDDy2dguRvSaH8TRTRClqMgOihqPbRhh3BQpiJlGEYeCJlrAFr+6CH9G6yvN2ieOC7iEu0OesVt1IQl6i8QZiCySVmgi6Xh2jClT72NGZNsjz2PMrZr7qKalJv8W7XEf4f5Hu6JO3nqYrZDUHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2WtNhji; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2WtNhji"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8800B1F000E9;
	Wed,  1 Jul 2026 23:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782950343;
	bh=bIy4jNIZE4AKwiaiANhfC8Sexabsd1MckjNxwJlu4fs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O2WtNhjiBwQejsKy3chFeaGs0FfPNS5MjQHC5fQSrVcHsLaBpQaXAqywQqua/FIGD
	 t6gw/povquKny2RNxA+NfdJ/0N+C3nLcq+6LlWLDeK2VB+/Uk+Iy22UbZORkPpwc+c
	 CNhZZ/G+AbZsxlilzg11wG0fWWt2NGOPOKeKrAxli4WAQAtvkjHwdlMf9L43uZwsA9
	 Il+TFqIJ5heoFcSSMDUTHmRiccrEClV5N2qZLcvRzGbixAP9ERnEpUajBN2uSpcZu9
	 EewrN7e+PsEu0OEmzQcjGMDuSgjqq5X/UClvtAfiTrb4ruEk7v7WFzuB9weivCRa+O
	 uXRLBLIzs1ohQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 06/38] phy: rockchip: usbdp: Drop seamless DP
 takeover
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: olteanv@gmail.com, conor+dt@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, vkoul@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-6-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
 <20260702-rockchip-usbdp-cleanup-v9-6-e31efbb62d2e@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 23:59:02 +0000
Message-Id: <20260701235902.8800B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Permanently breaks native DP and eDP displays if the bootloader pr=
e-enables the PHY.
- [High] Unconditionally disabling a pre-enabled DP PHY during probe withou=
t deterministic synchronization with the display controller (VOP) will caus=
e a hardware lockup.
--

commit b62be7660327d19c538f4a7e04fe1f77ddb82d23
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Drop seamless DP takeover

This commit removes support for seamless DP takeover in the Rockchip USBDP =
PHY
driver. It attempts to work around active bootloader configurations by forc=
ing
HPD low and waiting before shutting down the PHY.

Link: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.ke=
rnel.org/

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 3fc8222fcaec2..d734553701134 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c

[ ... ]

> @@ -938,10 +939,14 @@ static int rk_udphy_get_initial_status(struct rk_ud=
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
Does this permanently break native DP and eDP displays if the bootloader
pre-enables the PHY?

By writing false to the hpd_trigger register, this forces a software overri=
de
of the physical HPD pin to a low state. Since this override is never revert=
ed
anywhere in the driver, will the hardware DP controller permanently read HPD
as low, preventing native displays from link training?

> +		/* Wait for VOP side to shut up */
> +		msleep(100);
> +	}
> +
> +	rk_udphy_disable(udphy);

[Severity: High]
Can unconditionally disabling a pre-enabled DP PHY here cause a hardware lo=
ckup?

Since the PHY driver probes very early, the DRM driver has not yet bound,
meaning no interrupt handler is present to process the HPD drop, and the Vi=
deo
Output Processor (VOP) continues streaming. After the 100ms delay,
rk_udphy_disable() abruptly turns off the PHY and its PLL.

Does halting the pixel clock while the VOP is actively transacting cause an
interconnect stall on Rockchip SoCs?

> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-rockchip-u=
sbdp-cleanup-v9-0-e31efbb62d2e@collabora.com?part=3D6
