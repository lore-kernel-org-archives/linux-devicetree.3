Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792638585;
	b=Fw+JqUxwEjG/zDq1fDghWXPy06c65AaFCkhIs4ing6vjH1325t2qGImN5oFTdh83YlFM
	 VjV1khaVxewQcUhcmeM9AeYxpx/tqpC3J2OyFzwIivHDYCpVK4CjXtgIjTjq5Sj+u2osx
	 si2Dx9k4Q0SJHX7YAZkG5wHhboqnjuFLwa5mPchCVs+wLo0llhI4le3+Ath2FyLULQK70
	 FFCNeay+O4ZzIUS7AECDcQz/btp9PDzu2rKDZGBDMwIIbq6A5lB0/fvLHs0m5KErW2ktY
	 1IBp9e5vghHLHXKSZhEv4Dzsqn63PJqvhsVpxL/QazVkIXvVLe4meMDwN8SBFrkCIjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792638585;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jgf34uKfxpoRe0lvQPrJdjYJzLbCXEyXvafWFETELLs=;
	b=mRVesxw1HFntP6reAPhyfT3+yJo8pyJbWZUsXtHBpBA5U5TBDkXLed/CVBkgrLHrHAXW
	 yAQFTGYnMZl/D+AvWAN3RGGh9P7YRx6fDNL/FoDsPIWXKRw4iBI9ZoUEAYugz+goKmxzP
	 rlGFJYhFF71QnM2v+2LEVO06/bApKza6FCnaAZhu/YOTuXm4P2xzXhoui3zjGvNRzytHx
	 cGQn+vcv91Fjcn1n9vTog/IyqDPeVai8mllMTt4rXxDqiNc4BKQooy4KTaTtgsOHWeBSv
	 D3g182CyI43OY8azKWJKq+iNHhKxYBJ32Wti9S3il+hmkJhhu2guYc+Ae/sLpZUtjvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jhBMP3vK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54305606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 03:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jhBMP3vK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0AE81F000C5;
	Thu, 22 Oct 2026 03:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792638585;
	bh=jgf34uKfxpoRe0lvQPrJdjYJzLbCXEyXvafWFETELLs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jhBMP3vKyzct+mg8rla6x2XUygkVaY5e2ODZNx9TMRC7PdykZb9fRgSp3fJkKUg9Q
	 FgVYozUdGgqM1W2rAlUIUe4umuLnFtgMr88eB4gjX2bgYcLQYuAR1mZ1GLQ7IYrXHs
	 7Oj3iDTiAUScy0hbQp8eGAKq8bQIn2knQGH3h2BBtCDtRgPOfXiSB+Pr7ZW+Mw5Yk2
	 VYDaxJ1TnnGoRgyc5zGqOCgopznHi69/5MfSfPF9aylGsjWeJJHs847JAnYzL/TTq4
	 tp+c2O/sBkygirc4PqY2w8G14Fg+xEQTStrgkAxaEMDjQJ8hFSsjtdZEx5TISjtJI4
	 hh+7ZXczcE9CQ==
Message-ID: <sashiko-outbox-180898@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/3] arm64: dts: rockchip: rk3568-photonicat: enable
 SGMII LAN port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022025844.150320-4-coiaprant@gmail.com>
References: <20261022025844.150320-1-coiaprant@gmail.com>
 <20261022025844.150320-4-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 03:09:44 +0000
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
- [High] arm64: dts: rockchip: gmac0 SGMII probe failure in rk_gmac_powerup=
()
- [High] arm64: dts: rockchip: missing driver and DT binding for rk3568-xpcs
--

commit aa6d6fc31ff0de23e03fbaf6018d2105111972d7
Author: Coia Prant <coiaprant@gmail.com>

arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port

This commit enables the gmac0 and xpcs nodes on the Ariaboard Photonicat
board to support its Motorcomm YT8521SC Ethernet PHY over SGMII via
combphy2, and adds the PHY and LED definitions under mdio0.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/ar=
m64/boot/dts/rockchip/rk3568-photonicat.dts
> index 12ae9159bea87..d9015dbfb9f5c 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
> @@ -261,9 +261,18 @@ &cpu3 {
>  	cpu-supply =3D <&vdd_cpu>;
>  };
> =20
> -/* Motorcomm YT8521SC LAN port (require SGMII) */
> +/* Motorcomm YT8521SC LAN port */
>  &gmac0 {
> -	status =3D "disabled";
> +	assigned-clocks =3D <&cru SCLK_GMAC0_RX_TX>;
> +	assigned-clock-parents =3D <&clk_gmac0_xpcs_mii>;
> +	managed =3D "in-band-status";
> +	pcs-handle =3D <&xpcs>;
> +	phy-handle =3D <&sgmii_phy>;
> +	phy-mode =3D "sgmii";
> +	phy-supply =3D <&vcc_3v3>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&gmac0_miim>;
> +	status =3D "okay";
>  };

[Severity: High]
When gmac0 probes with phy-mode =3D "sgmii", the call chain
rk_gmac_probe() -> devm_stmmac_pltfr_probe() -> stmmac_dvr_probe() ->
rk_gmac_init() -> rk_gmac_powerup() in
drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c validates the PHY interface
through rk_gmac_check_ops() and rk_get_phy_intf_sel():

drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:rk_gmac_check_ops() {
	switch (bsp_priv->phy_iface) {
	case PHY_INTERFACE_MODE_RGMII:
	case PHY_INTERFACE_MODE_RGMII_ID:
	case PHY_INTERFACE_MODE_RGMII_RXID:
	case PHY_INTERFACE_MODE_RGMII_TXID:
		if (!bsp_priv->supports_rgmii)
			return -EINVAL;
		break;
	case PHY_INTERFACE_MODE_RMII:
		if (!bsp_priv->supports_rmii)
			return -EINVAL;
		break;
	default:
		dev_err(bsp_priv->dev,
			"unsupported interface %d", bsp_priv->phy_iface);
	}
	return 0;
}

drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:rk_get_phy_intf_sel() {
	int ret =3D stmmac_get_phy_intf_sel(interface);

	/* Only RGMII and RMII are supported */
	if (ret !=3D PHY_INTF_SEL_RGMII && ret !=3D PHY_INTF_SEL_RMII)
		ret =3D -EINVAL;

	return ret;
}

In addition, rk_get_interfaces() only sets RGMII and RMII in phylink's
supported_interfaces, and dwmac-rk.c does not parse pcs-handle or populate
plat_dat->pcs_init / plat_dat->select_pcs to attach an XPCS instance.

Will enabling gmac0 with phy-mode =3D "sgmii" and pcs-handle =3D <&xpcs> ca=
use
rk_gmac_powerup() to fail probe with -EINVAL before mdio0 or the network
interface can be registered?

[ ... ]

> @@ -606,3 +645,8 @@ &xin32k {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&clk32k_out1>;
>  };
> +
> +&xpcs {
> +	phys =3D <&combphy2 PHY_TYPE_SGMII>;
> +	status =3D "okay";
> +};

[Severity: High]
In arch/arm64/boot/dts/rockchip/rk3568.dtsi, the xpcs node is defined as:

	xpcs: ethernet-pcs@fda00000 {
		compatible =3D "rockchip,rk3568-xpcs";
		reg =3D <0x0 0xfda00000 0x0 0x200000>;
		clocks =3D <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
		clock-names =3D "csr", "eee";
		power-domains =3D <&power RK3568_PD_PIPE>;
		status =3D "disabled";
	};

Looking at xpcs_of_ids[] in drivers/net/pcs/pcs-xpcs-plat.c, only
"snps,dw-xpcs*" compatibles are matched, and no driver in the tree matches
"rockchip,rk3568-xpcs" or handles its "eee" clock and phys properties.

When rockchip_combphy_probe() in
drivers/phy/rockchip/phy-rockchip-naneng-combphy.c probes combphy2, it
asserts the PHY reset line:

	ret =3D reset_control_assert(priv->phy_rst);
	if (ret) {
		dev_err(dev, "failed to reset phy\n");
		return ret;
	}

That reset is only deasserted when a consumer driver calls phy_init() ->
rockchip_combphy_init(). Furthermore, Documentation/devicetree/bindings/
(including Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml)
does not document "rockchip,rk3568-xpcs" or the phys, power-domains, and
"eee" clock properties on this node.

Could enabling &xpcs before the driver and binding schema for
"rockchip,rk3568-xpcs" are present leave combphy2 held in hardware reset and
introduce dtbs_check regressions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022025844.1503=
20-1-coiaprant@gmail.com?part=3D3
