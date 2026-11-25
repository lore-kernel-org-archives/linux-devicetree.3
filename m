Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618380;
	b=jIrVQ11Xy2NxsrC2RbdDTlX+kLOrT8NTcjF1PUYsCxUQ2P/SRCKTbr8BcWfIbLg0b2nM
	 nMGT7rzgntNZNlF6AHwFQh70WHJ+9mKLoSyCWGaCBm/7t2n0GNBPOScYiUV98VnIB6FaD
	 PVTcimYWQui1nqHv5Kbsvs2Z5NRlA8lPvC6KDM0lVgdqOZJRXhIWR1OWAhZ39Dcf+21UI
	 lJkcR1iP6LBr/WJ0oMFvJA259uN4Tvc7cKFnvJpq4Y9owIqG+ZZO83JguyFnUNEBN+2o3
	 3GB+9MMXk0le8OfocR/JRZzzdbBVVy6c7Hc1j2Q20hEY30mLnA54qkvp5sTxbjGzKOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618380;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Noo/1qHPis8a4ZHqIhQBRWowzWTBe2fSXWZTT6D4Yww=;
	b=rlB230qvSxZzN/QEhAimT3DHY2d1poEQmoctrJ8gQxngS2SCy0WRTzLRAt1oauSQQjOX
	 WMnTmbUsQoOwuWnp7TjYZ3wByFCtX7Lyu43t73Ny2xpy553cm3OVQa4BWRWgG7RYcs9Ir
	 y68H38iQP0kFVVhopjMitg/xqp6MoVPtM6+8+u8pmkAYnoY3LMwuDbtSjC/5o+aFmdSeM
	 mRJKpA8jfEyNbT6xP3eREpmK5Mds79K3YISp6D2dUt4F0x/lstbnhU+PWzHPr7os0D6lV
	 +0tIC4zlJh65f40D1LWrKXWYQS/XnOe/zNvU88z1JAdk6kCpygztIjoXtSHpk3ajMLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QpjZ6tOI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F00E606A327;
	Wed, 25 Nov 2026 14:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QpjZ6tOI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B54D1F000F2;
	Wed, 25 Nov 2026 14:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795618380;
	bh=Noo/1qHPis8a4ZHqIhQBRWowzWTBe2fSXWZTT6D4Yww=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QpjZ6tOIlUhf+kQlKZgHLxYc2XlcmBaIfPkRV1LIW1ys2U5rcZAujgkg2H5gV/4AM
	 UrnSWvJXDyp/05FTYBkD9R9jSI3uzxxh9YOuNivFJe0w7W4t6HFQzQGxwS1sueI2/e
	 4A3X09csZMChHfVemR3ARVz9gcosJmopth4sAp3aDEvljqiwounqI5SC7WIDvOYSwc
	 Qn4XBn15u+NExx01d+6LUqzqVNOFUvXhpDPZAUnPMI3R/RT/mioKPLRiCmBFRif1mW
	 ZP5DYr/p68hTyp5g61kQA0opzo3ZwejEk3aS4qyAk1hxceeC2doZsic7/j0nI3KZJK
	 yZJ7PrxiCOEsg==
Subject: Re: [PATCH v8 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
From: netdev-bot+sashiko@kernel.org
To: tanure@linux.com
Cc: xianwei.zhao@amlogic.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Wed, 25 Nov 2026 14:52:58 +0000
Message-ID: <179561837863.3135.7453763060716815613@kernel.org>
In-Reply-To: <20261121213102.143130-5-tanure@linux.com>
References: <20261121213102.143130-5-tanure@linux.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit says it enables the Khadas VIM4 ethernet port.

--

arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

This patch enables the T7 ethernet MAC and the MDIO multiplexer on the
Khadas VIM4. It also describes the RTL8211F RGMII PHY at address 1 on the
external MDIO bus, with its interrupt on GPIOH_6. With phy-mode =
"rgmii-id", the PHY adds both RGMII delays.

> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 0fa83362b4179..7b86ab2579aaa 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts

[ ... ]

> @@ -256,6 +257,28 @@ xtal: xtal-clk {
>  	};
>  };
>  
> +&ethmac {
> +	status = "okay";
> +	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
> +	pinctrl-names = "default";
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&external_phy>;
> +};
> +
> +&eth_phy {
> +	status = "okay";
> +};

[Severity: Medium]
Can any driver at this revision bind to the ethmac node this enables?

The node in amlogic-t7.dtsi has:

arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:
		ethmac: ethernet@fdc00000 {
			compatible = "amlogic,t7-dwmac", "snps,dwmac-5.10a";

The amlogic,t7-dwmac string appears only in amlogic-t7.dtsi. The Amlogic
glue driver's match table, meson8b_dwmac_match[] in dwmac-meson8b.c, ends
at g12a:

	{
		.compatible = "amlogic,meson-g12a-dwmac",
		.data = &meson_g12a_dwmac_data,
	},
	{ }

dwmac_generic_match[] in dwmac-generic.c ends at snps,dwmac-4.10a, plus
snps,dwmac and the snps,dwxgmac entries. Under drivers/, the only place
that names snps,dwmac-5.10a is stmmac_gmac4_compats[] in
stmmac_platform.c. That list detects the core version. It is not an
of_match_table.

If nothing probes ethmac, its mdio0 child bus is never registered. The
eth_phy mux enabled just above binds through the amlogic,g12a-mdio-mux
fallback and has mdio-parent-bus = <&mdio0>. So mdio_mux_init() would
defer on every attempt:

drivers/net/mdio/mdio-mux.c:mdio_mux_init() {
    ...
		parent_bus = of_mdio_find_bus(parent_bus_node);
		if (!parent_bus) {
			ret_val = -EPROBE_DEFER;
			goto err_parent_bus;
		}
    ...
}

Wouldn't that leave ext_mdio and external_phy unregistered, so that
phy-handle never resolves?

Also, nothing would program the PRG_ETH glue window, which is the second
reg region at 0xfe024000. That window holds the RGMII mode select, the
clkin0/clkin1 TX clock mux and the MAC-side delays.

Nothing would claim the pipeline clock (CLKID_SYS_AMPIPE_ETH) either. The
previous patch in the series, "arm64: dts: amlogic: t7: add the ethernet
controller", says this gate is otherwise turned off as unused. It also
says the port keeps the bootloader's delays unless the controller
programs them.

amlogic,meson-dwmac.yaml does not document amlogic,t7-dwmac, so
dtbs_check would report the now-enabled node as undocumented.

Does this patch depend on a separate glue driver and binding series? If
so, could the commit message name that prerequisite, or could this patch
be sent together with it?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121213102.143130-1-tanure%40linux.com
