Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2E9145B27
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790321122; cv=none; b=l+Ntb5GEAcentnXY00DUN8CcnHbcs4IHWDvu/xP/JQ0QWkUv4iFFTWgkDNdC89mD67tjyPcXQ0zFpQEPwg+76FG0YztVG+mP9Z/uk7lPKXBoRbhs7EqmsKeLFyv36gcy8om4XNTBHVfNYD1IHetkKXjLTdWKkRt32BZvCRrf/NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790321122; c=relaxed/simple;
	bh=ma1F6lDdK6qzqTLo9vBUQ7iqen4xm0xZkBtE5+mC80g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jiai848Ltr7hN7mw4UY/nhbLjTKu7GglqsAhZyNwBfRr1yZREjOYP8vLm01VRyTvwWss2aJ2pIDz7/eH10/qU1lmx78QTjw2HJtpngM/ipfpJb7VbxK8BO7QMF6e13EQteyeeHTl847A3q4o7RKLzrSAlGJ+mZNiPvR0lGk+NxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJz3NbZx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJz3NbZx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9E61F000FF;
	Fri, 25 Sep 2026 07:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790321120;
	bh=TJ4y5d8ONhNPYSSYwEUjyeEzn7iIl+maLCScyKqgXg8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gJz3NbZxYCWMO6ERRXUEDfIEgUAuJE5lnAFIkYSAJpS0eKPITjWAt99TT4AKxanyl
	 2a8Ck0VsK4OwgfPTozBXWOFUmTM+n2me0cKYeOcNvdItH6VLvZBrNsolaJGmRKKH/h
	 pgztr8Ey1wfe0na+mSumhzRNsPZbkXOCb7IG8GfSsTQC/YcDg6L9UAYvWUPJBQm0FM
	 ynK12ZGhzVXA6ptLOJZujHD50VXq+WtxahageGQzdUF9TADyNotvjns4KaqIrORzBJ
	 NzwAMIaIChgOJMpqahUAtb/HNpyS0GL+Pbn7RUsByaKmz5Sd823Jnvpj5XTStbMNuy
	 NO5yWi8jJzAog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 5/7] net: stmmac: mediatek: use TX clock
 phase shift in RGMII mode with 1Gbps speed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260924-dwmac-mediatek-mt8189-v2-5-430bd74d5ef9@collabora.com>
References: <20260924-dwmac-mediatek-mt8189-v2-0-430bd74d5ef9@collabora.com>
 <20260924-dwmac-mediatek-mt8189-v2-5-430bd74d5ef9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 07:25:20 +0000
Message-Id: <20260925072520.8D9E61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] net: stmmac: mediatek: uninitialized variable use in mt8195_fix_=
mac_speed()
- [Medium] net: stmmac: mediatek: MT8195_DLY_GTXC_INV is unconditionally cl=
eared at 1Gbps
- [Medium] net: stmmac: mediatek: GTXC delay macro enabled with 0 stages at=
 10/100Mbps
--

commit 1bf37b19d2230e6132c222fa9547ec69b20a4290
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

net: stmmac: mediatek: use TX clock phase shift in RGMII mode with 1Gbps sp=
eed

This patch introduces the dwmac_fix_mac_speed callback for the MT8195
MAC to configure the TX clock phase shift after link speed negotiation.
It prefers a 2ns fixed delay at 1Gbps speed and falls back to the HW
delay macro circuit for 10/100Mbps speeds.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drive=
rs/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index dee12cfa437d0..6123efbbaf026 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c

[ ... ]

> @@ -433,9 +436,62 @@ static int mt8195_set_delay(struct mediatek_dwmac_pl=
at_data *plat)
>  	return 0;
>  }
> =20
> +static void mt8195_fix_mac_speed(void *priv, phy_interface_t interface,
> +				 int speed, unsigned int mode)
> +{
> +	struct mediatek_dwmac_plat_data *priv_plat =3D priv;
> +	const struct mediatek_dwmac_variant *variant;
> +	struct mac_delay_struct *mac_delay;
> +	u32 tx_delay_stage_val, reg_offset;
> +	u32 reg_val =3D 0;
> +
> +	if (!priv_plat)
> +		return;
> +
> +	mac_delay =3D &priv_plat->mac_delay;
> +	variant =3D priv_plat->variant;
> +
> +	if (!mac_delay->tx_delay ||
> +	    (interface !=3D PHY_INTERFACE_MODE_RGMII &&
> +	     interface !=3D PHY_INTERFACE_MODE_RGMII_RXID))
> +		return;
> +
> +	/*
> +	 * When link speed is 1Gbps with RGMII interface, and a TX internal
> +	 * delay needs to be applied on MAC, prefer to override the delay
> +	 * settings with a 2ns fixed delay which is controlled by
> +	 * RGMII_TXC_PHASE_CTRL. Otherwise, fallback to HW delay macro circuit
> +	 * for 10/100Mbps link speeds.
> +	 */
> +	if (speed =3D=3D SPEED_1000) {
> +		reg_val =3D MT8195_RGMII_TXC_PHASE_CTRL;

[Severity: Medium]
Will this assignment cause the MT8195_DLY_GTXC_INV setting to be lost when
the link speed negotiates to 1Gbps? The subsequent regmap_update_bits() inc=
ludes
MT8195_DLY_GTXC_INV in its mask, which appears to clear the inversion bit in
hardware if it was previously set.

> +	} else {
> +		if (variant->tx_delay_stage_div)
> +			tx_delay_stage_val =3D mac_delay->tx_delay /
> +					     variant->tx_delay_stage_div;
> +
> +		reg_val |=3D FIELD_PREP(MT8195_DLY_GTXC_ENABLE,
> +				      !!mac_delay->tx_delay);

[Severity: Medium]
Is it intentional to set the enable bit based on the raw mac_delay->tx_delay
instead of the computed tx_delay_stage_val? If the raw delay is smaller than
the divisor, tx_delay_stage_val truncates to 0, which would enable the GTXC
delay macro with 0 stages.

> +		reg_val |=3D FIELD_PREP(MT8195_DLY_GTXC_STAGES,
> +				      tx_delay_stage_val);

[Severity: Medium]
What happens if variant->tx_delay_stage_div is 0? The explicit check sugges=
ts
it could be 0, but without an else branch, tx_delay_stage_val remains
uninitialized and its stack memory would be written to the hardware registe=
r.

> +		reg_val |=3D FIELD_PREP(MT8195_DLY_GTXC_INV,
> +				      mac_delay->tx_inv);
> +	}
> +
> +	reg_offset =3D variant->peri_eth_ctrl_offset + MT8195_PERI_ETH_CTRL0;
> +	regmap_update_bits(priv_plat->peri_regmap,
> +			   reg_offset,
> +			   MT8195_RGMII_TXC_PHASE_CTRL |
> +			   MT8195_DLY_GTXC_ENABLE |
> +			   MT8195_DLY_GTXC_INV |
> +			   MT8195_DLY_GTXC_STAGES,
> +			   reg_val);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-dwmac-medi=
atek-mt8189-v2-0-430bd74d5ef9@collabora.com?part=3D5
