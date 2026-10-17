Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C076C348463
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 10:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233138; cv=none; b=G/cu2dBdtbg8V0puNs8o4xpGQr3GhlVPy5kIBaHaDY22UXr87IsuKHCoVEU/9Zn81Wf/oUo32upo4ozNXCOKN3CJoVrFRKotGSa5RE3ObiNBhVafIlMZGe++mNaG9MbeTfYo1hV/1eV8hwsNwizgrYfGKWvW3aW0H2wQonygePc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233138; c=relaxed/simple;
	bh=v2Hn9EYwuQ+E6lf0Rf3ht21Voze0wDWEtPegUEo1zhc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=f0wc4lX7An/fFmnfMnipisCxCxHRSAeSavTq9nMdqQjrdlC62TEbX5v3/Q5QSiwJHH9XEZiB16IhOxUdRugaKeEVSXcna9GoEeXiXC1rcZeyp4fbh2Olu7FWTwOtAxxYzKA9xoZMCGV39hK4QRStLEUYjUVYw4fm5CYofJjeuYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTK2483k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTK2483k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382901F000C4;
	Sat, 17 Oct 2026 10:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792233136;
	bh=pSG2Urt3XB9A0dnhckPlcULhrMUaFsfBg2jNhZn7nzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hTK2483kySCWzMmph3JO3X5TSU9XzNruuFEYS7WlNKqnHNuCwVgnzcTJNCU48ha6Z
	 y224QT51oW5CeouW58rQ9gUgZIdOKS6hl+4gruyeiMXTqzlalEqgk6CGMaEtX9vWQX
	 kK4SNSrDYodusDzwaVZKikxan53euG3WjJV616PlLP1wSdvzlxv6WXmQQ69bY8gAc9
	 kBww1oZXp9yowMiP09u0PDGxyx2EGyMTMK9mBHvIK5TpQ7S06aa1gEhZik2hW0pk3U
	 NEhh6ObO6mHVIBRvi9W1ONmm54RxyZ75iVMyB0KIK9qfuvE1sACSvjkDYRk+lwMBoL
	 E7elTOqF9hlPw==
Message-ID: <sashiko-outbox-175458@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 4/9] net: stmmac: mediatek: simplify TX/RX
 delay handling in mt2712_set_delay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-dwmac-mediatek-mt8189-v3-4-25daf2bbcf35@collabora.com>
References: <20261016-dwmac-mediatek-mt8189-v3-0-25daf2bbcf35@collabora.com>
 <20261016-dwmac-mediatek-mt8189-v3-4-25daf2bbcf35@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 10:32:15 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] stmmac: mediatek: swapped RGMII and RMII/MII delay stage divisors
--

commit 83d585b88ab8ffcfd715b793f8dc33929760603d
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

net: stmmac: mediatek: simplify TX/RX delay handling in mt2712_set_delay

This commit simplifies TX/RX delay handling for MT2712 by calculating
delay stage values locally instead of modifying the driver data. It
also introduces macro definitions for the stage divisors and maximums.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drive=
rs/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index f7eb85110df08..596411d4a5b2b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -36,6 +36,14 @@
>  #define ETH_FINE_DLY_GTXC	BIT(1)
>  #define ETH_FINE_DLY_RXC	BIT(0)
> =20
> +#define MT2712_RMII_DLY_RXC_STAGE_DIV	170 /* 170ps per stage */
> +#define MT2712_RMII_DLY_TXC_STAGE_DIV	170 /* 170ps per stage */
> +
> +#define MT2712_RGMII_DLY_RXC_STAGE_DIV	550 /* 550ps per stage */
> +#define MT2712_RGMII_DLY_RXC_MAX	17600 /* 32 x 550ps */
> +#define MT2712_RGMII_DLY_TXC_STAGE_DIV	550 /* 550ps per stage */
> +#define MT2712_RGMII_DLY_TXC_MAX	17600 /* 32 x 550ps */
> +

[Severity: High]
Are these stage divisors swapped compared to the original code?

In the original code, the divisors were:
/* 550ps per stage for MII/RMII */
mac_delay->tx_delay /=3D 550;
...
/* 170ps per stage for RGMII */
mac_delay->tx_delay /=3D 170;

With the new definitions, RMII gets divided by 170 and RGMII by 550, which
reverses the intended delay values for both interfaces.

[ ... ]

> @@ -129,71 +137,36 @@ static int mt2712_set_interface(struct mediatek_dwm=
ac_plat_data *plat,
>  static int mt2712_set_delay(struct mediatek_dwmac_plat_data *plat)
>  {
>  	struct mac_delay_struct *mac_delay =3D &plat->mac_delay;
> -	u32 delay_val =3D 0, fine_val =3D 0;
> +	u32 rx_delay_stage_val, tx_delay_stage_val;
> +	u16 rx_delay_stage_div, tx_delay_stage_div;
> +	u32 delay_val =3D 0;
> +	u32 fine_val =3D 0;
> =20
> -	mt2712_delay_ps2stage(plat);
> +	if (phy_interface_mode_is_rgmii(plat->phy_mode)) {
> +		rx_delay_stage_div =3D MT2712_RGMII_DLY_RXC_STAGE_DIV;
> +		tx_delay_stage_div =3D MT2712_RGMII_DLY_TXC_STAGE_DIV;
> +	} else {
> +		rx_delay_stage_div =3D MT2712_RMII_DLY_RXC_STAGE_DIV;
> +		tx_delay_stage_div =3D MT2712_RMII_DLY_TXC_STAGE_DIV;
> +	}
> +	rx_delay_stage_val =3D mac_delay->rx_delay / rx_delay_stage_div;
> +	tx_delay_stage_val =3D mac_delay->tx_delay / tx_delay_stage_div;
> =20
>  	switch (plat->phy_mode) {
>  	case PHY_INTERFACE_MODE_MII:
> -		delay_val |=3D FIELD_PREP(ETH_DLY_TXC_ENABLE, !!mac_delay->tx_delay);
> -		delay_val |=3D FIELD_PREP(ETH_DLY_TXC_STAGES, mac_delay->tx_delay);
> +		delay_val |=3D FIELD_PREP(ETH_DLY_TXC_ENABLE,
> +					!!tx_delay_stage_val);
> +		delay_val |=3D FIELD_PREP(ETH_DLY_TXC_STAGES,
> +					tx_delay_stage_val);

[Severity: High]
Because the divisors are swapped above, could the resulting stage value
exceed the bitfield boundaries?

Since RMII is now incorrectly divided by 170 instead of 550, valid device
tree delay values might produce a stage count that exceeds the 5-bit width
of the ETH_DLY_TXC_STAGES hardware field. When this happens, FIELD_PREP()
would silently truncate the stages value, leading to misconfigured hardware
timings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-dwmac-medi=
atek-mt8189-v3-0-25daf2bbcf35@collabora.com?part=3D4
