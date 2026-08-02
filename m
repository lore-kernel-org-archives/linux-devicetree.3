Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E05C38F95B
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 14:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785680744; cv=none; b=bGgS9cVYM+/5LOu/NsnFJnUwwmlXYhmaeFIaItkMIltqHLxH4BGWETCJX7IuLJzu6vnLE2wZB9cqjrA12vg3mDjnwyZLLFjf1hnksAJs5irZky7SaDgjMPSgSZq0Ikzco0r+HOTh/OWzX5A9ycgAZKOoEEQMa9+5AqNTV4noLg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785680744; c=relaxed/simple;
	bh=990j879z1sH9KI6uG+PmUuanccuAz/JHNT3JnF+A48Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fv7VT0kbQ7s4EugMfEqf3G9TMKgJI5uy7WDbU8o/k3TZHDeLIGhxFRBRlSGFIZarg+7jEp7a9FBm7dtpJLtmS2rDlBxMRUDz2878kgW2OU4J+AIhbcKJei4lt7GjCu1GX65mSQU1198ScCN/dWvRjz4CaOTZRN7mgcgUA1GyG8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0sbJohG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0sbJohG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26DA1F00A3D;
	Sun,  2 Aug 2026 14:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785680743;
	bh=SkbzWR0sFsjZ3Aq+wP68kkn9EMw/5h3rshkV4z/0Or8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H0sbJohGZyS4Bg0Aazal7SHaSGlgD1ShDqn0bSzZ8KZZ3YIwQI3uCehiPLInl/uo3
	 qLCF4EmUJZoRtNceo6GGZIKpe8Ao1cmw9/o3vXb0IGc51Vl3GUh75wtmKPU43sfVsb
	 PNGwm6HFMktDCj2zSaVQoPTbvG8yoQNtcEjVGTYru3X0kwS+oh5Bdgh5i52EENEa81
	 AVLYpMJ+vCPONU/54VPqeU6FN1dZc1i0g4YypW/JDdyfV+9n2wu6dZUg3KqclTYKD5
	 HGMa8IuLNHftSpuxxFj82Fm+MUGjBU6krcFOgBMnA46AcEyNvTBAiGnmf40PGnWlu5
	 rOjcT/zrRfjpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/10] net: stmmac: dwmac-rk: add SGMII support for
 RK3568
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: vkoul@kernel.org, wsa+renesas@sang-engineering.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20260801142244.679437-10-coiaprant@gmail.com>
References: <20260801142244.679437-2-coiaprant@gmail.com>
 <20260801142244.679437-10-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 14:25:42 +0000
Message-Id: <20260802142542.A26DA1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] rk3568_set_to_sgmii fails to clear interface selection bits 4:6, l=
eading to potential hardware misconfiguration.
- [Low] DWMAC_ROCKCHIP selects PCS_XPCS_ROCKCHIP without inheriting its PM =
dependency.
--

--- Patch [8]: [PATCH v2 08/10] net: stmmac: dwmac-rk: add SGMII support fo=
r RK3568 ---
commit 53e13be00ad70a538e5aaf2d42200c1ae27d3eef
Author: Coia Prant <coiaprant@gmail.com>

net: stmmac: dwmac-rk: add SGMII support for RK3568
   =20
The RK3568 SoC integrates a Synopsys DesignWare XPCS that can be
connected to GMAC0 or GMAC1 in SGMII mode. Add the necessary glue
logic to support this configuration.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part1%20V1.1-20210301.pdf (Page 386)

> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/et=
hernet/stmicro/stmmac/Kconfig
> index e3dd5adda5aca..5088acc06982e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -170,6 +170,7 @@ config DWMAC_ROCKCHIP
>  	default ARCH_ROCKCHIP
>  	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
>  	select MFD_SYSCON
> +	select PCS_XPCS_ROCKCHIP

[Severity: Low]
Could selecting PCS_XPCS_ROCKCHIP here cause a Kconfig unmet dependency
warning or build failure if PM is disabled?=20

PCS_XPCS_ROCKCHIP depends on PM || COMPILE_TEST, but DWMAC_ROCKCHIP lacks
this dependency.

>  	help
>  	  Support for Ethernet controller on Rockchip RK3288 SoC.
> =20

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net=
/ethernet/stmicro/stmmac/dwmac-rk.c
> index 8d7042e689261..e47ca1bec5b8b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
[ ... ]
> @@ -851,18 +857,32 @@ static void rk3568_set_to_rgmii(struct rk_priv_data=
 *bsp_priv,
>  		     RK3568_GMAC_CLK_TX_DL_CFG(tx_delay));
> =20
>  	regmap_write(bsp_priv->grf, con1,
> +		     RK3568_GMAC_MODE_RMII_RGMII |
>  		     RK3568_GMAC_RXCLK_DLY_ENABLE |
>  		     RK3568_GMAC_TXCLK_DLY_ENABLE);
>  }
> =20
> +static void rk3568_set_to_sgmii(struct rk_priv_data *bsp_priv)
> +{
> +	u32 con1;
> +
> +	con1 =3D (bsp_priv->id =3D=3D 1) ? RK3568_GRF_GMAC1_CON1 :
> +				     RK3568_GRF_GMAC0_CON1;
> +
> +	regmap_write(bsp_priv->grf, con1, RK3568_GMAC_MODE_SGMII_QSGMII);
> +}

[Severity: High]
Does this actually clear the interface selection bits 4:6 as mentioned in t=
he
commit message?=20

It looks like this only writes RK3568_GMAC_MODE_SGMII_QSGMII (which sets
bit 7) but doesn't supply a write mask or data to clear bits 4:6. If the
bootloader left bits 4:6 set to a non-zero value, could this lead to an
incorrect hardware configuration?

[ ... ]
> @@ -1379,16 +1441,19 @@ static int rk_gmac_powerup(struct rk_priv_data *b=
sp_priv)
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D gmac_clk_enable(bsp_priv, true);
> +	if (ret)
> +		return ret;
> +
> +	if (bsp_priv->phy_iface =3D=3D PHY_INTERFACE_MODE_SGMII)
> +		goto set_mode;
> +

[Severity: High]
Because of the goto here, the standard clearing of interface selection bits
using bsp_priv->gmac_phy_intf_sel_mask that happens below is bypassed for
SGMII mode.=20

Should rk3568_set_to_sgmii() handle clearing those bits instead?

>  	ret =3D rk_get_phy_intf_sel(bsp_priv->phy_iface);
>  	if (ret < 0)
> -		return ret;
> +		goto clk_disable;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801142244.6794=
37-2-coiaprant@gmail.com?part=3D8
