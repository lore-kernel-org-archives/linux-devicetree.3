Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787174;
	b=OAIUl35wN2qCaZPeSupFi9VkX0WIJheXCwCHbXhiV1w6UQg+px0Z/YHlKAy4lTr7AMBh
	 K1rVIR/i7OfWSEkE6JMAsgQIymaT2IlfwemWZas1FPDuY2JQjlMXX8BRDLyf+Vct2iGi0
	 ZRU/bdp5d9wY8Mpjvzr9OKO4zhkCQPX7wFsZcWaV5lfvBVhpNGVPjwJoFSyqY58oH3lZD
	 IW6RWBcwXT2JtL79Yn7TAo4NSd2o+awqAxTljm+BQ7sh7TZ40K2dFBgGQCqb0GyJxiQqX
	 XhDJSn4R53d/Bw0JesFNK8WhOh4O8ogTlBGT2hc2W5cJiiqZVFVTcXts/X+kpAkoSUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787174;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KlgtZ7vJnCdOnuFP8Fo4dNpRmBsOYJarjE4+YBlB3Qw=;
	b=Gvm0pubgqn3CVZsW8uF8rWb7I0+5f2VxgpBgPLYWClOYLnushLAhC5HHkuv1ujSrGrCo
	 HD6sPJrV2B75wI/sKzq8/zL6CIIuPKhg89OG5zM34syMQBpQBM9RgZ288QO1fnXYAhe5f
	 5BCx5BuYCqHmWUBLYvRuuPc1ucKU2lmnE5m2fv44wuxNafchisqS/MfNHU1V6AnJguB/f
	 bE+mj+qKlnZbALtAIoKNslfZj6M4kCBNUqPIKE71ViHW/07unIHzFTEOWXej3eqYpAyjD
	 Bro9IrYLaaADB0mp6k2BC/CoLRAPR8o8iAXq+BGKDJsbt+g5M6P3bvzf+Tk+tlWLRYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="cQ/zcUF2";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ECC606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 10:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cQ/zcUF2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8624B1F000C1;
	Wed,  4 Nov 2026 10:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793787173;
	bh=KlgtZ7vJnCdOnuFP8Fo4dNpRmBsOYJarjE4+YBlB3Qw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cQ/zcUF24YtpyvhZLK02o8MZ78hRhT6/8mB0dvGXSYfTtE+fzTohD/FOF+yMkdiwx
	 JCAOOrdS9Y6WdrdwB15IABHFwaXvDQCSi8owkfSD+yF1OQX28y7TXiq0bThMBnuCVG
	 7344dEsJx+kY1UiMFfFI6NQhP5owOtbEHo7VKpI5jihYdptcdGRuazC4lka+OVsvWy
	 /wdbKvW3cprh9KNtBBUGGFAo6spk8hXL70eh8Eeag1JyKB1i4ekDpWyvFmy/zk2/Fs
	 vz5U3Fdzx4LV5HkrEveIfXu8RPLpgXUi+GlkvkH+ffFFiXLdnRLe8sV20sCb1Fn+NO
	 ot2NBwg8raDdw==
Message-ID: <sashiko-outbox-197063@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 06/10] net: stmmac: mediatek: use standard
 internal delay properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-dwmac-mediatek-mt8189-v4-6-c86c14fc50f4@collabora.com>
References: <20261103-dwmac-mediatek-mt8189-v4-0-c86c14fc50f4@collabora.com>
 <20261103-dwmac-mediatek-mt8189-v4-6-c86c14fc50f4@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 10:12:53 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] net: stmmac: mediatek: MII/RMII delays rejected in mediatek_dwmac_=
config_dt()
- [Low] net: stmmac: mediatek: wrong variable logged in mediatek_dwmac_conf=
ig_dt()
--

commit ee9099b5600c9180a26ef3e97094da27f2aa7a09
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

net: stmmac: mediatek: use standard internal delay properties

This commit updates the mediatek-dwmac driver to support the standard
rx-internal-delay-ps and tx-internal-delay-ps properties for RGMII internal
clock delays while falling back to the vendor mediatek,rx-delay-ps and
mediatek,tx-delay-ps properties when the standard ones are absent.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drive=
rs/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index cda3f3edde39f..b4abc20c83143 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c

[ ... ]

> @@ -257,8 +259,8 @@ static const struct mediatek_dwmac_variant mt2712_gma=
c_variant =3D {
>  	.dwmac_set_delay =3D mt2712_set_delay,
>  	.clk_list =3D mt2712_dwmac_clk_l,
>  	.num_clks =3D ARRAY_SIZE(mt2712_dwmac_clk_l),
> -	.rx_delay_max =3D MT2712_MII_DELAY_MAX,
> -	.tx_delay_max =3D MT2712_MII_DELAY_MAX,
> +	.mii_delay_max =3D MT2712_MII_DELAY_MAX,
> +	.rgmii_delay_max =3D MT2712_RGMII_DELAY_MAX,
>  	.dma_bit_mask =3D 33,
>  };

[ ... ]

> @@ -427,24 +432,56 @@ static int mediatek_dwmac_config_dt(struct mediatek=
_dwmac_plat_data *plat)
>  		return PTR_ERR(plat->peri_regmap);
>  	}
> =20
> -	if (!of_property_read_u32(plat->np, "mediatek,tx-delay-ps", &tx_delay_p=
s)) {
> -		if (tx_delay_ps < plat->variant->tx_delay_max) {
> -			mac_delay->tx_delay =3D tx_delay_ps;
> -		} else {
> -			dev_err(plat->dev, "Invalid TX clock delay: %dps\n", tx_delay_ps);
> -			return -EINVAL;
> -		}
> +	of_property_read_u32(plat->np, "mediatek,tx-delay-ps", &tx_delay_ps);
> +	if (tx_delay_ps >=3D plat->variant->mii_delay_max) {
> +		dev_err(plat->dev, "Invalid TX clock delay: %dps\n",
> +			tx_delay_ps);
> +		return -EINVAL;
>  	}
> =20
> -	if (!of_property_read_u32(plat->np, "mediatek,rx-delay-ps", &rx_delay_p=
s)) {
> -		if (rx_delay_ps < plat->variant->rx_delay_max) {
> -			mac_delay->rx_delay =3D rx_delay_ps;
> -		} else {
> -			dev_err(plat->dev, "Invalid RX clock delay: %dps\n", rx_delay_ps);
> -			return -EINVAL;
> -		}
> +	/* Read RGMII TX internal delay standard property */
> +	if (of_property_read_u32(plat->np, "tx-internal-delay-ps",
> +				 &rgmii_tx_delay_ps)) {
> +		/*
> +		 * standard property value not available, fallback on vendor
> +		 * value instead
> +		 */
> +		rgmii_tx_delay_ps =3D tx_delay_ps;
> +	}
> +
> +	if (rgmii_tx_delay_ps >=3D plat->variant->rgmii_delay_max) {
> +		dev_err(plat->dev, "Invalid RGMII TX clock delay: %dps\n",
> +			rgmii_tx_delay_ps);
> +		return -EINVAL;
>  	}
> +
> +	of_property_read_u32(plat->np, "mediatek,rx-delay-ps", &rx_delay_ps);
> +	if (rx_delay_ps >=3D plat->variant->mii_delay_max) {
> +		dev_err(plat->dev, "Invalid RX clock delay: %dps\n",
> +			rx_delay_ps);
> +		return -EINVAL;
> +	}
> +
> +	/* Read RGMII RX internal delay standard property */
> +	if (of_property_read_u32(plat->np, "rx-internal-delay-ps",
> +				 &rgmii_rx_delay_ps)) {
> +		/*
> +		 * standard property value not available, fallback on vendor
> +		 * value instead
> +		 */
> +		rgmii_rx_delay_ps =3D rx_delay_ps;
> +	}
> +
> +	if (rgmii_rx_delay_ps >=3D plat->variant->rgmii_delay_max) {
> +		dev_err(plat->dev, "Invalid RGMII RX clock delay: %dps\n",
> +			rgmii_tx_delay_ps);
> +		return -EINVAL;
> +	}

[Severity: High]
In drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c, can
mediatek_dwmac_config_dt() reject valid MII and RMII delay values on MT2712?

For mt2712_gmac_variant, mii_delay_max is MT2712_MII_DELAY_MAX (17600 ps),
whereas rgmii_delay_max is MT2712_RGMII_DELAY_MAX (5440 ps).

When the interface is configured for MII or RMII, the RGMII-specific
tx-internal-delay-ps and rx-internal-delay-ps properties are absent from the
device tree, so rgmii_tx_delay_ps and rgmii_rx_delay_ps fall back to
tx_delay_ps and rx_delay_ps.

Because mediatek_dwmac_config_dt() then unconditionally checks
rgmii_tx_delay_ps and rgmii_rx_delay_ps against plat->variant->rgmii_delay_=
max
regardless of phy_mode, won't any MT2712 MII or RMII configuration with
mediatek,tx-delay-ps or mediatek,rx-delay-ps between 5440 ps and 17599 ps f=
ail
probe with -EINVAL?

[Severity: Low]
Also in mediatek_dwmac_config_dt() in
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c, when rgmii_rx_delay_ps
is greater than or equal to plat->variant->rgmii_delay_max, should the
dev_err() call log rgmii_rx_delay_ps instead of rgmii_tx_delay_ps?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-dwmac-medi=
atek-mt8189-v4-0-c86c14fc50f4@collabora.com?part=3D6
