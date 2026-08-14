Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918FB33938C
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 02:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786673792; cv=none; b=SFrB30dfWbjD6ZXdmRV00CNf0eRYRtaMi+RVc+7IIKLFQQybyOqkjzPmadSlUIrmBeoV2l+Uz6Uq7aJ1BGWcWDcZxl1tjSWDDlKSWtrd8vWsqpPym7zcjegI+wreSp4hSpzhf0dqXG73rcvuXoIyzBxvU16skTwSXHoR4lMwzpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786673792; c=relaxed/simple;
	bh=yx2uuXrQYpx7GaphOQLbDqnI5MgDZYcf3eHk/WHIRVU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MXbwoZKobhLlL/r3wv2ZJZ2NsiQsEmge+YKKMmM5cCyXR35clv/98lkILuBHJFBasuIeW4ilr/58v2O4hMSN4vjSU5X10ojRA0Dz33sjP2+bZ9aimfZyKO5mt1OYOaLMgJTnybjAuCSmExiVIMput8LGYDKh3De64EomcbjHcQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSyJmGhg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSyJmGhg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83721F000E9;
	Fri, 14 Aug 2026 02:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786673791;
	bh=9RonhfSzlqrxdxQRcxRKzAuTLRsdZgWjKvsDGN+YiNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iSyJmGhgcZKtXCftaXLaOmYtu5MUsYRPuRIfJm7PNI9t8X71iOM3ze/QrT50nWA7X
	 CWMzEYsB23iwCEosG06ilw6u+//Wi3Vv2Jp8490PdiRjDPYTJJR7sYymFs2/06m1nE
	 xIh2btrvxTS6duzrh8ZO1CVfBgGIgcW4bhG0/d9AsphSvssIX0h2aLbmXAxIsWdtQl
	 YKqkTQeIpDxww5KMOudvXqBjMjZ6mNc2k9K0g+NNQUQF4SZm7qTpUd2Y3lmB2Re4+K
	 MxT+qTcOO9UX3+FxBMh2Ray3yPuazLDwjG3p2p4IGkEH/DilAbEl02P7tfxupJkAQl
	 U6qNUhQvzqHyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 07/38] phy: rockchip: usbdp: Keep clocks running on
 PHY re-init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, vkoul@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-7-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-7-b5ad9c68fa11@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 02:16:25 +0000
Message-Id: <20260814021630.B83721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `rk_udphy_dp_phy_configure` function accesses shared state and=
 performs hardware register operations without holding the driver-level `ud=
phy->mutex`.
--

--- Patch [7]: [PATCH v14 07/38] phy: rockchip: usbdp: Keep clocks running =
on PHY re-init ---
commit d5dccbf2706084c2aa72c0b8c94ff4bf16bfe46f
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Keep clocks running on PHY re-init

This commit avoids disabling and re-enabling clocks during PHY mode changes.
It directly calls rk_udphy_init() instead of rk_udphy_disable() and
rk_udphy_setup() to prevent unnecessary delays.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 6cb9f6b4dbf6d..e3f5a26c876a5 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -987,8 +987,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, =
u8 mode)
>  		if (udphy->mode =3D=3D UDPHY_MODE_DP)
>  			rk_udphy_u3_port_disable(udphy, true);
> =20
> -		rk_udphy_disable(udphy);
> -		ret =3D rk_udphy_setup(udphy);
> +		ret =3D rk_udphy_init(udphy);
>  		if (ret)
>  			return ret;
>  		udphy->mode_change =3D false;

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this file I
noticed a potential race condition in rk_udphy_dp_phy_configure().

Can this corrupt hardware state during a concurrent Type-C event?
Looking at rk_udphy_dp_phy_configure(), it accesses shared state without
holding the udphy->mutex:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_configure() {
	struct rk_udphy *udphy =3D phy_get_drvdata(phy);
	...
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
	...
}

The Type-C framework invokes rk_udphy_orien_sw_set() or
rk_udphy_typec_mux_set() asynchronously. These functions acquire
udphy->mutex and overwrite the udphy->dp_lane_sel and udphy->lane_mux_sel
arrays, and can trigger a PHY re-initialization.

Concurrently, the DRM DP framework can invoke rk_udphy_dp_phy_configure(),
which reads these arrays and modifies the PHY hardware pma_regmap locklessl=
y.

If a Type-C device is plugged in while the DP framework is performing link
training, could writing configuration to the incorrect PHY lanes due to a
partially updated lane mapping array break DisplayPort link training or
interleave register writes with a concurrent PHY reset?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-rockchip-u=
sbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com?part=3D7
