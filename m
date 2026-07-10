Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBA53BFAD1
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718843; cv=none; b=uLF86aaX7z1J+dDfVWHhk2TdMv2QqO1dNwRsK/HOlYCpi8D3ThNPmwzI3nUVQ98/W82cd3VxnQcP50DCEjfHd2MIWFvEzNhnb7azJ72ZskyuSZ820CGWEPeQ6hY5BKArmuUN7to6NZ+F/IEjWxFai7WKi+BxNl4KMIdAjiUvJlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718843; c=relaxed/simple;
	bh=7topajca82I6XIBtv6QR8E2zuNkz/ONU+7ZDOCw47YA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PmPcRDTq6+GJrW051K9loNKAJYdO5DaOH1tXTcH3Ok354xc8VpoB3h7EVI2hQD22j8ExtzK+RLZ+tS70NWK22Z39bVvc/WuNx2bFhIEKIoxwGC9ERXic2nS4Naq0ED7W7bFzVgQiNaBllDD2uoMAOGlhcEpgDCo2q6VTKBNQeGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VzdgVQ19; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VzdgVQ19"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1B11F00A3A;
	Fri, 10 Jul 2026 21:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718842;
	bh=8S8Mofq9IKUBUaxon8iIKcDpSZ04bKxkifE/NwiLI5s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VzdgVQ198salTdIcJehYJetIxeNLa74ZvIVrFV9jGFaIgHI5s2nBxLvQWzwQH6kMG
	 eZHS/0VpHYRwIUXGr45CKfDXu3ByMs+G4gFo3jlbChn4pRk+N+yBeHsfnIfnighEWX
	 EvSeWYJbu+mhyqAHX6TwO7xBRO1+KXr6qyoIG2/5zVkDa+d0QvrFIeGng3oP64B4LM
	 tY+G/MGOC/LDk5x2TGyZqu7Gb6e1rVV0ot9MlJWT776kB+ZCFVksoBnQlmdLFRYYn6
	 9wUqurbi4A2EmErF+sjQCWW24xveF7ypB0maKwFzAgXRmN6MSjy1abimDumTwo1jvr
	 ChG8WdJdGLFdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 35/36] phy: rockchip: usbdp: Re-init PHY on mux
 change
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-35-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
 <20260710-rockchip-usbdp-cleanup-v12-35-8b41a9a9bef0@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 21:27:21 +0000
Message-Id: <20260710212721.CD1B11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Uncoordinated PHY reset during Type-C mode change pulls the rug ou=
t from under the active DisplayPort controller, leading to lost DP configur=
ation, race conditions with DRM, and potential hardware SErrors.
--

--- Patch [35]: [PATCH v12 35/36] phy: rockchip: usbdp: Re-init PHY on mux =
change ---
commit 94db902f39e3cb43921400824c3bb5833e6b7bf2
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Re-init PHY on mux change

Ensure that the right part of the PHY are powered up when the
mode changes. This ensures the PHY is re-initialized in the
following two scenarios, which are currently broken:
cable orientation changes without DP being involved and
switching from DP-only into a mode with USB support.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index c5ad300620a65..ecf0ed0139f69 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1383,7 +1383,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_=
dev *mux,
> =20
>  	rk_udphy_set_typec_state(udphy, state->mode);
> =20
> -	return 0;
> +	return rk_udphy_update_power_state(udphy);

[Severity: High]
Will this cause an uncoordinated PHY reset that breaks the active DisplayPo=
rt
controller?

When rk_udphy_update_power_state() detects a mode change, it calls
rk_udphy_init(), which forcefully resets the PHY and disables the DP lanes:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_init() {
    ...
	/* Step 3: configure lane mux */
	regmap_update_bits(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET,
			   CMN_DP_LANE_MUX_ALL | CMN_DP_LANE_EN_ALL,
			   FIELD_PREP(CMN_DP_LANE_MUX_N(3), udphy->lane_mux_sel[3]) |
               ...
			   FIELD_PREP(CMN_DP_LANE_EN_ALL, 0));
    ...
}

If TCPM synchronously calls rk_udphy_typec_mux_set() during an altmode
renegotiation (such as switching from DP-only to DP+USB), the DP controller
might still be active because DRM handles the associated HPD disconnect
asynchronously on a different workqueue.

Could resetting the PHY while the DP controller is still active and its clo=
ck
is stopped trigger an SError or leave the display link permanently broken?

>  }
> =20
>  static void rk_udphy_typec_mux_unregister(void *data)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-rockchip-u=
sbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com?part=3D35
