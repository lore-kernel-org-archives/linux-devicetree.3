Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792786025;
	b=s0VP9ayf2O6dd8HCgnoubA2Jjf+9siGOlGvqwYUyczP9YikyBtrPuNSQXDT+MbtTZXdE
	 NtkA+KMk+IuFi0GiA0QaiEOBLjyc2OtC2Aj/smY+LvxY/+rPD8YjX+88NFfcYkMeEGio9
	 T3AiLrLxvu6cQ6G7K9/frBgjdigLu71t+aWH9t4EGSvT9wW1jBDUhPupdN7kQXWfRTc5k
	 R/aeVlbNGVL4EXgBvOdKp5MCuULGHykKUnVzmqty2A6tcdjNM3IDKWXOMlaBXNaGTfm54
	 GbVIBizgkNVK837ly4HnR2HhIsiDUeD4bQ5WMBmQ2X5OGFzTOQt3qGINLhkkZ1f3ppg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792786025;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rwkE1XbChLJLaa3WTB3mh24jVj/qSIsomJRKnW/5jOk=;
	b=1HY60gGpWYJjlIm1IaFrMHDPjfNyHVxZE69HCZ4Vkblwd3XVdZo2J6l2lF0ozoszoS88
	 zhZiD5NhmPf+2Rs/05ZdqyhKSC62OUcbIRfHXNGzTqaQnTS+iOs5NPC6+DkMkJDWHpemV
	 4s9cxntOA5PO34S86qMLzkLxQh6AUP5cbHwgmjYrfpFU8abLjAD6G7u5B8uk608v63mer
	 0uEOqIhs+/xrxtw7pZiHAuDwg5M0o71llfhOshoD0LcOLunSC4IFegwVyz1OYdYZNx4D5
	 qLZU+dipRVXTmYaWbo9YLj986Wkz8YfnBLV5bXmgokQpRy32pehT86jBLQySyOuHJWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LVClSG71;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62DB606A31A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 20:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LVClSG71
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFC91F01825;
	Fri, 23 Oct 2026 20:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792786024;
	bh=rwkE1XbChLJLaa3WTB3mh24jVj/qSIsomJRKnW/5jOk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LVClSG71hCcqOv5/eqtNo2R93zJuycAigxfqw86fZUBbomVlfaGpfeBbZdQ/vsFz5
	 N7TmXuWw5qwYYMBDgMfiUd+cLNmMwEM4Ir63RyPHcRYbZuyQF1I8490n8TvXIYne45
	 tHWnJ3SYbW53gkbijy1p9RZKHDC6xx6uQ5T/NVocFW6R5l8YonKDfbAJd70MK+TnEs
	 UeP7jhTPZkaLsJRyKXhi/HEGO10TZtpTJwF/RMOl/AG4RzqdEuPZ/lhPtTZPkN85xc
	 F91FTr4hGqwtVZIhYy+cREuNm4oYhdQxMuU/SckVO41R0tb3Tfvuo2ICIjLtTjzxeF
	 80fX3G0AsiUzw==
Message-ID: <sashiko-outbox-183166@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/7] arm64: dts: amlogic: t7: add the ethernet
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lucas Tanure" <tanure@linux.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261022200640.3101932-7-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
 <20261022200640.3101932-7-tanure@linux.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 20:07:03 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: amlogic: t7: missing status disabled on untested int=
ernal_ephy
--

commit 8b67e94cfb48fb74bfbb5053e5ce7da85b48466a
Author: Lucas Tanure <tanure@linux.com>

arm64: dts: amlogic: t7: add the ethernet controller

This patch adds the Synopsys DWMAC ethernet controller, the MDIO multiplexe=
r,
and the internal 100M PHY nodes to the Amlogic T7 SoC device tree.

> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boo=
t/dts/amlogic/amlogic-t7.dtsi
> index 7bd53ec166071..94ea225145015 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi

[ ... ]

> @@ -645,6 +672,37 @@ gpio_intc: interrupt-controller@4080 {
>  					<10 11 12 13 14 15 16 17 18 19 20 21>;
>  			};
> =20
> +			eth_phy: mdio-multiplexer@28000 {
> +				compatible =3D "amlogic,g12a-mdio-mux";
> +				reg =3D <0x0 0x28000 0x0 0xa4>;
> +				clocks =3D <&clkc_periphs CLKID_SYS_ETHPHY>,
> +					 <&xtal>,
> +					 <&scmi_clk CLKID_FCLK_50M>;
> +				clock-names =3D "pclk", "clkin0", "clkin1";
> +				mdio-parent-bus =3D <&mdio0>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				ext_mdio: mdio@0 {
> +					reg =3D <0>;
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +				};
> +
> +				int_mdio: mdio@1 {
> +					reg =3D <1>;
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +
> +					internal_ephy: ethernet-phy@8 {
> +						compatible =3D "ethernet-phy-id0180.3301",
> +							     "ethernet-phy-ieee802.3-c22";
> +						interrupts =3D <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
> +						reg =3D <8>;
> +					};
> +				};
> +			};

[Severity: Medium]
The commit message states:

  The on-chip PHY follows the G12A; no board in tree uses it, so it is
  untested. It stays disabled for boards to enable.

However, in arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi, only ethmac has
status =3D "disabled"; while eth_phy, int_mdio, and internal_ephy are all l=
eft
enabled by default.

When a board enables ethmac (even to use an external RGMII PHY on ext_mdio),
g12a_mdio_mux_probe() calls mdio_mux_init() in drivers/net/mdio/mdio-mux.c,
which registers every available child bus:

    for_each_available_child_of_node(mux_node, child_bus_node) {
        ...
        r =3D of_mdiobus_register(cb->mii_bus, child_bus_node);

Because internal_ephy under int_mdio is available and specifies a hardcoded
PHY ID compatible string ("ethernet-phy-id0180.3301"),
__of_mdiobus_parse_phys() in drivers/net/mdio/of_mdio.c creates and registe=
rs
the PHY device without reading hardware ID registers:

    of_mdiobus_register()
      -> __of_mdiobus_parse_phys()
        -> fwnode_mdiobus_register_phy()
          -> phy_device_register()
            -> device_add()
              -> phy_probe()

During phy_probe() in drivers/net/phy/phy_device.c, MDIO reads issued by
phy_disable_interrupts() and genphy_read_abilities() switch the mux to child
bus 1 via g12a_mdio_switch_fn() -> g12a_enable_internal_mdio() in
drivers/net/mdio/mdio-mux-meson-g12a.c:

    if (!__clk_is_enabled(priv->pll)) {
        ret =3D clk_prepare_enable(priv->pll);
        if (ret)
            return ret;
    }
    ...
    writel(PHY_CNTL2_USE_INTERNAL |
           PHY_CNTL2_SMI_SRC_MAC |
           PHY_CNTL2_RX_CLK_EPHY,
           priv->regs + ETH_PHY_CNTL2);

    value |=3D PHY_CNTL1_PHY_ENB;
    writel(value, priv->regs + ETH_PHY_CNTL1);

This powers on the untested internal EPHY PLL and enables the internal PHY =
in
ETH_PHY_CNTL1 and ETH_PHY_CNTL2 even on boards using an external PHY.

Additionally, on T7 boards that leave ethmac disabled, leaving eth_phy
enabled causes g12a_mdio_mux_probe() to enable pclk, program the PLL
registers in g12a_ephy_pll_init(), and then fail in mdio_mux_init() with
-EPROBE_DEFER because mdio0 is never registered.

Should internal_ephy (or int_mdio) and eth_phy have status =3D "disabled"; =
so
that the untested internal PHY stays disabled until a board explicitly
enables it?

> =20
>  			uart_a: serial@78000 {
>  				compatible =3D "amlogic,t7-uart", "amlogic,meson-s4-uart";
>  				reg =3D <0x0 0x78000 0x0 0x18>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022200640.3101=
932-1-tanure@linux.com?part=3D6
