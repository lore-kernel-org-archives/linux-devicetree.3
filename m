Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787175;
	b=iV4c3/rW9S2nI0kQCV9Z9m0cfPNP2aeuXSgEKQ1Klp0z6q/S4r6xhxyRwZSnhsTNx9gW
	 2gflOwJfc89Z/Bo4j5Q3hLQ4p09sk/PJf2xOA3ekFQK8C5Mg3M1xkQz+NzHtmD89VhgHL
	 yibvm9nY8vTb51bPewKa6Loj+eRkdR2qjPUdyrOwijbCDoR5vRTrRi0/TVhsKz1MMFZWR
	 t3pSQPrlaKrS/r7Vv5jdMndIdlpx2dnmW+GVWPQ8yUwR4vP9o0c7PPYCfvASsEoPC8jkN
	 Y/0RErHyKm67wFI5sh0C6/vzVQaz4ytAmeQ3XfqCpXDuFax3GY9V3PZG3wFLFFJ1C7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787175;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8ykacx5e/2uEUYWJJgKBDPsoR53N8+vTabbtAZz+6c4=;
	b=oER+nu1LPRfg8dTPpPk0S2osHrc36LIYVWq3nSVBkGOZ1it9SHSFxBfmBrifrYIbpudH
	 9c1azf2Kn6liiXN/tOwcjuqDnyuunix2OXISh7vYlD2R2Hsm5xqQj08Kjn7413gofE2/t
	 Z21rJZlaxpV9ysj5VS4ipkxyxLcseTUOK8iqs/vHYfw4+CSwZHYcIlwdNjKQrjDOgs4ys
	 HPlOWkOOr3zr75L8NMUa/TrhCJmToGRr7LLD6vb9pnuabnma5XzehKCvk9MvjnsrFCEzK
	 4MppohYM47LqvLavsWFjuhHNR84im6sS16K3lwy07uR4U2V+5mMRYugrV4ZynkwKb6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJeZwdZY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BBF606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 10:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJeZwdZY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009CA1F0093A;
	Wed,  4 Nov 2026 10:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793787175;
	bh=8ykacx5e/2uEUYWJJgKBDPsoR53N8+vTabbtAZz+6c4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iJeZwdZYqcnT5AKhp8XORF+omNnuptgmOYpRvBPYO68mnIpBU3P+2JhSx78pPyogk
	 C16z27xSLhfCPhkvahEUE0DWLV3SupU+DF5T18xxAF94eDgvXjQd0lUYSJx+PSTXLI
	 d/zAK/xIf6pzmNQq5hLRVWPHKN7PsLGdwITCXccrakScMOtU54k9lKEYyHhNYhn3Vf
	 TxhbDgrYbYFdM4vLTZ+vkSamM9VXg6uATgFL7pPFQd06jxQ1/m7cYSdxgJ40MyolLj
	 s6GAmXlsDFvel9u2vnEW97WTBbxeTX7hrUcB8bX5W3fS4PPO9aRIF1FKiGCgVPOsar
	 JmvrzzfNi8jEQ==
Message-ID: <sashiko-outbox-197067@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 10/10] net: stmmac: mediatek: add support
 for MT8189 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-dwmac-mediatek-mt8189-v4-10-c86c14fc50f4@collabora.com>
References: <20261103-dwmac-mediatek-mt8189-v4-0-c86c14fc50f4@collabora.com>
 <20261103-dwmac-mediatek-mt8189-v4-10-c86c14fc50f4@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 10:12:54 +0000
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
- [Medium] net: stmmac: mediatek: rgmii_delay_max applied to MII/RMII fallb=
ack delays
- [Low] net: stmmac: mediatek: wrong delay logged in mediatek_dwmac_config_=
dt()
--

commit 05a1a870b144ad38c76a76fcfec8bbabb47b798b
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

net: stmmac: mediatek: add support for MT8189 SoC

This series refactors internal RX/TX clock delay handling in the MediaTek
DWMAC driver to support standard RGMII delay properties and adds support for
the MT8189 SoC.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drive=
rs/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 30ae0dba7fffd..07d0c186ab655 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c

[ ... ]

> @@ -434,24 +492,56 @@ static int mediatek_dwmac_config_dt(struct mediatek=
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
>  	}
> =20
> +	if (rgmii_tx_delay_ps >=3D plat->variant->rgmii_delay_max) {
> +		dev_err(plat->dev, "Invalid RGMII TX clock delay: %dps\n",
> +			rgmii_tx_delay_ps);
> +		return -EINVAL;
> +	}
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

[Severity: Medium]
In drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c, when
mediatek_dwmac_probe() calls mediatek_dwmac_config_dt(), will checking
rgmii_tx_delay_ps and rgmii_rx_delay_ps against
plat->variant->rgmii_delay_max unconditionally reject valid MII and RMII
configurations on SoCs where mii_delay_max is larger than rgmii_delay_max?

On MT2712, MT2712_MII_DELAY_MAX is 17600ps while MT2712_RGMII_DELAY_MAX is
5440ps:

drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:
#define MT2712_MII_DLY_STAGE_DIV	550 /* 550ps per stage */
#define MT2712_MII_DELAY_MAX		17600 /* 32 x 550ps */
#define MT2712_RGMII_DLY_STAGE_DIV	170 /* 170ps per stage */
#define MT2712_RGMII_DELAY_MAX		5440 /* 32 x 170ps */

When a board uses MII or RMII mode and specifies mediatek,tx-delay-ps or
mediatek,rx-delay-ps in the range [5440, 17600) without the RGMII-specific
tx-internal-delay-ps or rx-internal-delay-ps properties, rgmii_tx_delay_ps
and rgmii_rx_delay_ps fall back to tx_delay_ps and rx_delay_ps and then fail
the plat->variant->rgmii_delay_max check with -EINVAL.

Should the rgmii_delay_max checks only be enforced when the PHY interface
is in RGMII mode?

> +		dev_err(plat->dev, "Invalid RGMII RX clock delay: %dps\n",
> +			rgmii_tx_delay_ps);
> +		return -EINVAL;
> +	}

[Severity: Low]
In mediatek_dwmac_config_dt(), when rgmii_rx_delay_ps >=3D
plat->variant->rgmii_delay_max, dev_err() passes rgmii_tx_delay_ps instead
of rgmii_rx_delay_ps. Should this log rgmii_rx_delay_ps instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-dwmac-medi=
atek-mt8189-v4-0-c86c14fc50f4@collabora.com?part=3D10
