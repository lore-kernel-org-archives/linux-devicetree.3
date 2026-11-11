Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398956;
	b=BJhajSE8VqHr9yvMvDT7H2PhRdnZFuwkMqnifd1NGUsh0bw8XtIFRt4hEJqiXP+V20SS
	 MOAQGY3DOCpCIqO58rPViltwdaLNUdwNoQ4HnfNni+HeOxsIxKMYgqHLW/y6YK3HyfTcv
	 frrz0oqVx4+UwMGEYTzxCpI+jGTsCkkRQEu3Tmsgi5qxMzeHpXBt/PipuqNG/ZHfNfKWd
	 ypLbszLQ/Pab/bUbWmAQD9kPOz/UDHkNoGv8liWKkKzrOrp4I78VksPg6Cn7FVl5T570K
	 chlljA9UMFTLX6qxJd4CLacQRA7Rn+fyrIOLX3+UCFg/HO+BkEya0RSVrT+pfyIWl1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398956;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ALLgAAqY59xEE03OcIpi+vu55/+Auj7NRmFj/zsQzCQ=;
	b=1yd2RkD5LpQ7zTt7SxaUimtT7A7zdr1sDQwali3qY3dPqP/Pya8ein/JHiYr2t+3oXI/
	 whMgi19WQ5HQZ/+uYlKNEfL8XuF0nqcuK+CCOMmgO+s82A69DlDZYVW5F7+RcB2OOsFDO
	 y7yWpcq4GS1uIiM5su8ni67SltivVl4jso3wRNlStqoFKZ12FowIC51aSAyFGPj6ZpvRv
	 tRTz0WAxMBlQCxASyG2lCxweXtHCyAxPRyBWWyJiEp+XB+GuCESe5e6b6Hx7RbKaBBNrp
	 q8Vph2WIVnv1peawozltQUNpCKXszyxlFaJHe6rKIMR7raFfF1DxkIUPiyvSLQH/4Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LAJG9JEB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB485606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LAJG9JEB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C101F00A05;
	Wed, 11 Nov 2026 12:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794398956;
	bh=ALLgAAqY59xEE03OcIpi+vu55/+Auj7NRmFj/zsQzCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LAJG9JEBcqMX+2MxdGww56siARq3PPCkjUy4eD3kkDQzhYfdp8lQt9EHQnISEoN9f
	 Vce0fZaVQo07Bh5RqIVQ1L16hCAN6wVsSgUGDtpnosx/C/wqG9mJdt+d8xXhcncU6D
	 ZEtDRWf4yEqg6qkNPkKa7fFqJe9xLtvT2XubqYgye3cRAV2QdpML0Ci2nSfrIXDxRL
	 0XjmiXwRrwaII6mpi+ScdEyvKNjm62euW3oDIjnHpwWoq9DdPySb2tnPCj3r3noA8n
	 pCyAXtnNImXaY/h63TM1g9JZXrywcS7jQygmATa7MzPZF0FypOfUKQUDnQ4Sknm87b
	 lRhT/83OwBglQ==
Message-ID: <sashiko-outbox-208947@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 06/10] net: stmmac: mediatek: use standard
 internal delay properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-dwmac-mediatek-mt8189-v5-6-7d99d6292962@collabora.com>
References: <20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962@collabora.com>
 <20261110-dwmac-mediatek-mt8189-v5-6-7d99d6292962@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 12:09:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: stmmac: mediatek: off-by-one RGMII cap in
  mediatek_dwmac_config_dt()
--

commit 67e9a961803ad0d99ebf09bcf04f114dc90c181a
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

net: stmmac: mediatek: use standard internal delay properties

This commit adds support for the standard rx-internal-delay-ps and
tx-internal-delay-ps Device Tree properties for RGMII internal clock
delays, falling back to the vendor delay properties when the standard ones
are absent.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drive=
rs/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index cda3f3edde39f..ee43d694099bd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c

[ ... ]

> @@ -427,24 +432,58 @@ static int mediatek_dwmac_config_dt(struct mediatek=
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
> +	of_property_read_u32(plat->np, "mediatek,tx-delay-ps", &tx_delay_ps);
> +	if (tx_delay_ps >=3D plat->variant->mii_delay_max) {
> +		dev_err(plat->dev, "Invalid TX clock delay: %dps\n",
> +			tx_delay_ps);
> +		return -EINVAL;
> +	}
> +
> +	/* Read RGMII TX internal delay standard property */
> +	if (!of_property_read_u32(plat->np, "tx-internal-delay-ps",
> +				  &rgmii_tx_delay_ps)) {
> +		if (rgmii_tx_delay_ps >=3D plat->variant->rgmii_delay_max) {
> +			dev_err(plat->dev, "Invalid RGMII TX clock delay: %dps\n",
> +				rgmii_tx_delay_ps);
>  			return -EINVAL;
>  		}
> +	} else {
> +		/*
> +		 * standard property value not available, fallback on vendor
> +		 * value instead and cap it to max RGMII delay value
> +		 */
> +		rgmii_tx_delay_ps =3D min(tx_delay_ps,
> +					plat->variant->rgmii_delay_max);
>  	}
> =20
> -	if (!of_property_read_u32(plat->np, "mediatek,rx-delay-ps", &rx_delay_p=
s)) {
> -		if (rx_delay_ps < plat->variant->rx_delay_max) {
> -			mac_delay->rx_delay =3D rx_delay_ps;
> -		} else {
> -			dev_err(plat->dev, "Invalid RX clock delay: %dps\n", rx_delay_ps);
> +	of_property_read_u32(plat->np, "mediatek,rx-delay-ps", &rx_delay_ps);
> +	if (rx_delay_ps >=3D plat->variant->mii_delay_max) {
> +		dev_err(plat->dev, "Invalid RX clock delay: %dps\n",
> +			rx_delay_ps);
> +		return -EINVAL;
> +	}
> +
> +	/* Read RGMII RX internal delay standard property */
> +	if (!of_property_read_u32(plat->np, "rx-internal-delay-ps",
> +				  &rgmii_rx_delay_ps)) {
> +		if (rgmii_rx_delay_ps >=3D plat->variant->rgmii_delay_max) {
> +			dev_err(plat->dev, "Invalid RGMII RX clock delay: %dps\n",
> +				rgmii_rx_delay_ps);
>  			return -EINVAL;
>  		}
> +	} else {
> +		/*
> +		 * standard property value not available, fallback on vendor
> +		 * value instead and cap it to max RGMII delay value
> +		 */
> +		rgmii_rx_delay_ps =3D min(rx_delay_ps,
> +					plat->variant->rgmii_delay_max);
>  	}

[Severity: Medium]
Can capping rgmii_tx_delay_ps and rgmii_rx_delay_ps to
plat->variant->rgmii_delay_max overflow the 5-bit stage fields in
mt2712_set_delay()?

rgmii_delay_max is an exclusive upper bound (5440 on MT2712, or 32 * 170ps).
When a fallback vendor delay in [5440, 17599] ps is clamped to 5440,
dividing by MT2712_RGMII_DLY_STAGE_DIV yields stage 32 (0x20), which
FIELD_PREP() truncates to stage 0 in ETH_DLY_GTXC_STAGES and
ETH_DLY_RXC_STAGES instead of clamping to stage 31 (for example via
plat->variant->rgmii_delay_max - 1).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-dwmac-medi=
atek-mt8189-v5-0-7d99d6292962@collabora.com?part=3D6
