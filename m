Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6627C3D6497
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 10:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233138; cv=none; b=BNp8h8TT2RNCHEyfMh8gtMZcdJ6Pu0dPpwK1eYGD2MXs1zQn9yB3Xv2oldZ6pKrmbVAveaHAktkonvAY0DHD25MNiMi0i2gXMhxI6vIO0QtGzeAyYkIIxLfW/sIpJcxthpS/PLfwdjvrZ640yOqyuCo4FYKh2kgSkwNyjXb71Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233138; c=relaxed/simple;
	bh=LRTnUHG6cDlzwZuDlPiIvn8p1HK7m48NpnuMN0I5lIk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FBfyqysWdpgHd7RMFJ1dZKKqQOu5XgV3goX3COQzjVBx9DD0NNMAmyc5DmnOGmRWqhdjBfoSlANJgN9XLV+HFc/r5jtjFWn29rqRDQrfChQXPDGa/KeT8y/YhLkH/HX60KiTi5cRTWXo6AKqHRF+tVWXiH4yVO3mqos80AKze6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNavpQqK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNavpQqK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E6F1F000C5;
	Sat, 17 Oct 2026 10:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792233137;
	bh=KqJAskyE+1iN1GEuLWnl6gU4mOgt7hO+wpznLhG27N0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KNavpQqK0oOAzpMtu0PK9Ud/XZUXpYq8Qp/fpitMkJpsbj+JmH+/V794ZvLSC4uJa
	 8Rp4Mi/RQzS/a7em5ikDhfl2lBREy5MdCap+dLgb1jutuG07Mh6frbfxBDT06kgco7
	 uqF/uZ0fYjjaj7k9wzLiP6UXtb2qoKJjYr5hVC2Kd5mX2vS9FUBks7AWEPCYjRoHnL
	 tcgDb3g9ss7Al6b6c6RU9MYAODMePdoM/y5Hn5/Bim730pYnGxtOKXTXp9WRBAsdAV
	 swRFaW0rsjLMAG32CBU/Ad7ILMN19LbldKqb7o2Xyj8gNByGTd0+cHFnV4hCPMLYDF
	 Ggr35J78mOs+w==
Message-ID: <sashiko-outbox-175459@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 5/9] net: stmmac: mediatek: add RX/TX delay
 stage divider in platform data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-dwmac-mediatek-mt8189-v3-5-25daf2bbcf35@collabora.com>
References: <20261016-dwmac-mediatek-mt8189-v3-0-25daf2bbcf35@collabora.com>
 <20261016-dwmac-mediatek-mt8189-v3-5-25daf2bbcf35@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 10:32:16 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: stmmac: mediatek: copy-paste error assigns RMII macro to RGMI=
I TX delay divider
--

commit c43e3615c53c38caf38fb0fc788d29a2ffa994ad
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

    net: stmmac: mediatek: add RX/TX delay stage divider in platform data

This commit adds RX and TX delay stage divider values to the variant
platform data for MediaTek SoCs. This prepares the driver for newer SoCs
like MT8189 which have different internal delay stage steps.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drive=
rs/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 596411d4a5b2b..cb5bda53edb94 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c

[ ... ]

> @@ -258,6 +270,10 @@ static const struct mediatek_dwmac_variant mt2712_gm=
ac_variant =3D {
>  	.num_clks =3D ARRAY_SIZE(mt2712_dwmac_clk_l),
>  	.rx_delay_max =3D MT2712_RGMII_DLY_RXC_MAX,
>  	.tx_delay_max =3D MT2712_RGMII_DLY_TXC_MAX,
> +	.rx_rmii_delay_stage_div =3D MT2712_RMII_DLY_RXC_STAGE_DIV,
> +	.tx_rmii_delay_stage_div =3D MT2712_RMII_DLY_TXC_STAGE_DIV,
> +	.rx_rgmii_delay_stage_div =3D MT2712_RGMII_DLY_RXC_STAGE_DIV,
> +	.tx_rgmii_delay_stage_div =3D MT2712_RMII_DLY_TXC_STAGE_DIV,
                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Does this initialization assign the wrong macro for the RGMII TX delay divi=
der?

It looks like mt2712_gmac_variant.tx_rgmii_delay_stage_div is being initial=
ized
with the MT2712_RMII_DLY_TXC_STAGE_DIV macro instead of the RGMII variant d=
ue
to a possible copy-paste error.

Before this patch, mt2712_set_delay() correctly used the RGMII constant for
the tx_delay_stage_div. Because of this error, when configuring the TX delay
for an RGMII interface on the MT2712 platform, the driver will now divide t=
he
delay by the RMII constant instead.

This will result in an incorrect, much larger delay stage value being
programmed into the PERI_ETH_DLY register via the ETH_DLY_GTXC_STAGES field,
which could break RGMII transmission timing.

>  	.dma_bit_mask =3D 33,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-dwmac-medi=
atek-mt8189-v3-0-25daf2bbcf35@collabora.com?part=3D5
