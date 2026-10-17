Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619AC47F793
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 10:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233141; cv=none; b=t0deaw4dFU4pdpHmqKC3RC0aprB/bc/2s1+Y1Cg2fhIcnpg/swqRKEbUNcvkRtijm7inBsNPvKyzAn69gO/rRhQlRZyA7U4C+YHMkUm50MlTHhRROyxxY0LAz9LEm35uDS3l6jyIX7XveWGFH3zPZA9N7I880WPtS+snMT32ggE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233141; c=relaxed/simple;
	bh=XuETu2zOBzeAjHDf/RiAE71EeSn5nlczpB8Fq8k9JEg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=AgVLhP1S3e3TDM2qkdBc63BB8vEM8BqDm9M1COHKlrwL8pCYpWgJBefOgae/d8e9U0qZMqdDgTZVb47zmCltryrR5Il6B0R5iORjzTPhYNbGHpedh1KGz92J9PX+bLX2Ay0ye9zp0kVuPwOqzf/mfqiComMUHOwVWVOVlbtW0jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBZXvs1D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBZXvs1D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1CEC1F000C6;
	Sat, 17 Oct 2026 10:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792233137;
	bh=6BFlRa7eHJU63EXNy5/XtcoWnUI/Im2jPhah8QCrmGU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dBZXvs1Df4urGCjpkLA7xs7/JylTeeH6StQj7xsPfHSg6H485YBjOrlqzwgjw7OgQ
	 DhsN0jhIwZCs6J+LYNdH2Mj58BaS8pP1PysU3tgjkXDXC4XjpHQn4+hGQj2OORvlRi
	 J2MzLEJP1axyRX7BdTll5j7C9Kzor86pDUIt1qcO4D+HGXAa76U2OL/2VHQh+wA0QQ
	 zHaHz2iKSu6VD4SzhHLyUItupfsNnNweXID80MlnHGtFegJ+gVx5svKS1iExs4jrhy
	 KVxK3G3x6aO+/XJ5oO+nGOy/4L1aW7agnUAiZ3ue0ARVJ8VWHGEyuv6bdt4tqrEQTA
	 dzENuOKMDuDbw==
Message-ID: <sashiko-outbox-175461@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 7/9] net: stmmac: mediatek: use TX clock
 phase shift in RGMII mode with 1Gbps speed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-dwmac-mediatek-mt8189-v3-7-25daf2bbcf35@collabora.com>
References: <20261016-dwmac-mediatek-mt8189-v3-0-25daf2bbcf35@collabora.com>
 <20261016-dwmac-mediatek-mt8189-v3-7-25daf2bbcf35@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 10:32:17 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: stmmac: mediatek: TX clock inversion is unintentionally cle=
ared at 1Gbps
--

commit 1240293d7bdcca392029932327a2063871dd1b83
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

net: stmmac: mediatek: use TX clock phase shift in RGMII mode with 1Gbps sp=
eed

This patch introduces a callback to set the TX clock phase shift in the RGM=
II
mode for 1Gbps speeds on MT8195. Because the hardware delay macro circuit c=
an
be affected by external factors, the new logic overrides the delay settings
with a more stable 2ns fixed delay after link speed negotiation.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drive=
rs/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 7dd46cd5a49e1..4b2d5280f7030 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
[ ... ]
> @@ -430,9 +433,65 @@ static int mt8195_set_delay(struct mediatek_dwmac_pl=
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
When the link negotiates to 1Gbps and a non-zero tx_delay is configured, do=
es
this omit the MT8195_DLY_GTXC_INV bit from reg_val?

Because the update mask in the regmap_update_bits() call includes
MT8195_DLY_GTXC_INV, omitting it here will forcefully clear the clock
inversion bit in the hardware register.

If tx_delay is 0 but tx_inv is true, the function returns early and preserv=
es
the inversion bit set during probe. Is it intended that clock inversion at
1Gbps is dropped only when a non-zero TX delay is configured?

> +	} else {
> +		if (variant->tx_rgmii_delay_stage_div) {
> +			tx_delay_stage_val =3D mac_delay->tx_delay /
> +					     variant->tx_rgmii_delay_stage_div;
> +		} else {
> +			tx_delay_stage_val =3D 0;
> +		}
> +
> +		reg_val |=3D FIELD_PREP(MT8195_DLY_GTXC_ENABLE,
> +				      !!tx_delay_stage_val);
> +		reg_val |=3D FIELD_PREP(MT8195_DLY_GTXC_STAGES,
> +				      tx_delay_stage_val);
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-dwmac-medi=
atek-mt8189-v3-0-25daf2bbcf35@collabora.com?part=3D7
