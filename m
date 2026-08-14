Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F453515D6
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 04:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786680659; cv=none; b=Jt1J8D4xXplVRbMig0ao3l9xSTTxThdMVUs8hVnp/81XR+U28aLyeBx27cTUj2Oz0JNCW4JaqIE8H4WZGKEDntPQd/flh2ZhQpogPaz3r+oJdGVbiKcn99OnTfsAuCiP6s97rG1DnpAKTXz3J8jjaVIUwkB7nlQuOgu4HAZZZCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786680659; c=relaxed/simple;
	bh=iIdwkWqkwhLUG/JN9f/lXgtwn35m3Pfg5ECEGv1TRPI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WAOedGd6JWeZWrRwMw+xSe8kdY5j3vIIfDHCIa1ZfEvnFpL9y+okYjRa/5OVGIhI456TPKAhm3i/XwJlnaDx30A1+Yn+clHq8dajBeSPTPEBgLzWmzw/9br2SHDIhaQEqDKtCrsRIwJPUU0BPqZ+5Y20mgxR7L9mo3gImlQdiC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NTMFrCgo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NTMFrCgo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A912D1F000E9;
	Fri, 14 Aug 2026 04:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786680658;
	bh=wsMbl8FoGh7KTn3Z4KEFN7fT7UmCwOxo9NPY6ckr9Xc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NTMFrCgoGKYZXnCxrL862aJYndwcUpWhjyoGHILd5g9hd807s6o0mF2l2WKsHC4e/
	 jWtcTFL7M9ratISdzkPH1EA60TTU/xwjP/5RXzaE1Cncm1lVCt5C1/ziqF7xDjUq+k
	 uaUFzjgaqi7g8lQOeYAGycRWWvR4OZZUguWbiGVBjlRH7hnQsBK5FosZOP81i9qhYX
	 KHnkYm+AlsMrQ7bkeQiKnzbzbS8lLZYpSKQX/M0meOsM2HCq67rqSFhRr++f1ggI+E
	 YbcsFl4epgBDH+8wm3LNZGF3XNugHUZVVizUjwgKFSS5sRhSvYUtr18Gt3+nsNsoZB
	 8xBb4WpamgHAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 20/38] phy: rockchip: usbdp: Factor out lane_mux_sel
 setup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-20-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-20-b5ad9c68fa11@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 04:10:49 +0000
Message-Id: <20260814041052.A912D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Data race in `rk_udphy_dp_phy_configure` allows DP link training t=
o corrupt USB PHY lanes.
--

--- Patch [20]: [PATCH v14 20/38] phy: rockchip: usbdp: Factor out lane_mux=
_sel setup ---
commit 312855a280db1af8a51a65d7c305801cd55a506d
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Factor out lane_mux_sel setup

Avoid describing the USB+DP lane_mux_sel logic twice by introducing
a helper function to reduce code duplication.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 4b454798c4ed4..4e54020d17551 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -582,6 +582,42 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy=
, u8 mode)
>  	udphy->mode =3D mode;
>  }
> =20
> +static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned lo=
ng state)
> +{
> +	u8 mode;
> +
> +	switch (state) {
> +	case TYPEC_DP_STATE_C:
> +	case TYPEC_DP_STATE_E:
> +		udphy->lane_mux_sel[0] =3D PHY_LANE_MUX_DP;
> +		udphy->lane_mux_sel[1] =3D PHY_LANE_MUX_DP;
> +		udphy->lane_mux_sel[2] =3D PHY_LANE_MUX_DP;
> +		udphy->lane_mux_sel[3] =3D PHY_LANE_MUX_DP;
> +		mode =3D UDPHY_MODE_DP;
> +		udphy->dp_lanes =3D 4;
> +		break;

[Severity: High]
This is a pre-existing issue, but can this code race with DisplayPort link
training?

If a user rapidly unplugs or rotates the Type-C cable while a display is
attached and undergoing link training, the Type-C subsystem could
asynchronously call rk_udphy_typec_mux_set(). This modifies lane_mux_sel and
dp_lanes here in rk_udphy_set_typec_state() while holding udphy->mutex.

Meanwhile, the DP MAC driver might be calling phy_configure() to perform
link training, which invokes rk_udphy_dp_phy_configure():

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_configure() {
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

If rk_udphy_dp_phy_configure() locklessly verifies dp->lanes <=3D udphy->dp=
_lanes
and loops over udphy->lanes, could it read a torn lane_mux_sel array or a s=
tale
dp_lanes value? This might result in applying DisplayPort voltages to PHY l=
anes
that have just been reassigned to USB, potentially corrupting the USB link =
and
leaving the PHY in an inconsistent state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-rockchip-u=
sbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com?part=3D20
