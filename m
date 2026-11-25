Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618378;
	b=jUlidLvP+L6VrwlAXVEfy99jgWFrTFcjtdlAhnmtm0DcmbLAkXPZ5I96tSl/cGi71Els
	 Usv5GgtaQSVRNadh413Z3hWSth66pFvwiwu0NNtYrKmwUAGaXYHT+ThPC1rd8qSwgAUXE
	 i74pPVRp3eGg07SRxB7Qmc9cnE5ViMt0P23lWaKSrVekUjDb/H3DDacN+m3zQH/5FCVW3
	 BSesXadcPpcUVT7L7lij4Xki6xhh89YFPsMce8LyVISA/dno3Y7lq3KD/G3XhSgrfv0Lc
	 Vb4ap28ci1AFj6J6Vfsc9RbBd8OsqMyzNC1V6P1WB/6C9nrwWmHOD93zmqQPxy34U3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618378;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=X+Dzq3n9YXwcxc+ZztTdcqP3bgBeGhE5JeZBv9eT0n4=;
	b=FVdWX4t2bICPnJYhcsrNDn0VLIe8saqAg5MYOq/utInKo7uBOtrpLm9qTiv+lCshwhqY
	 DSDSir2+GXWRrKItN+ZwLx63BR8lLHprr0NMVQPj37rUlLE29XcwovdFOQocwCPR6Q5Au
	 WsB/v9KSwWXBpNrNnvx8758M0GKkzhv5t4Nlxqn6p0m1QN2+ww6+UcZUHk8APDCJHZCMk
	 RFdwxwZzpaPBIklpT4TESzYRd8YOuCclmYyXyjRPilq/YgPkFcZiWXA0LQY7NI+kkHGiA
	 dEGzVD336gQig7QXtGrNF1uQy/H/ex0QlGJp6f0IwfYs4dJ4biruZ7RRDuvhkOGECcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ve+D622g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60417606A336;
	Wed, 25 Nov 2026 14:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ve+D622g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021D21F000C4;
	Wed, 25 Nov 2026 14:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795618378;
	bh=X+Dzq3n9YXwcxc+ZztTdcqP3bgBeGhE5JeZBv9eT0n4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ve+D622gqw2eKtBxBaJFe6lnNAi+O2bom/E+Tu4UBnkFxEaK5jafvWm0dm1B1GTbQ
	 eogQu2Xw7WmU7GaQUPgLxRhbvXGbTiRIfq3Zj5LGO/S9ajryZGJNtNhDZItTzkXUw1
	 77y+iOxZzEX1PSVLnTxM1YoGjdUukqxMQDVQvgYgVJMxjJh+eSSyNkDxaDKD3wQEvd
	 AkNWRZZJooeVVHenn4nGOGrS7DNgFyXsF738FGUm4kMA8je5KAM578xAT7OXfJMNy0
	 CMDBVQrowAWHR+DrZkTtMtxbj/fj0bkDGTprF8Dg2sbthIRoI+ZrNwcDBVqewpSj/Q
	 ogAUnXAkE18mQ==
Subject:
 Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
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
Date: Wed, 25 Nov 2026 14:52:56 +0000
Message-ID: <179561837659.3135.6655031502321722558@kernel.org>
In-Reply-To: <20261121213102.143130-4-tanure@linux.com>
References: <20261121213102.143130-4-tanure@linux.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 2 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] No driver or binding in the tree accepts the new ethmac node's
  compatible pair, "amlogic,t7-dwmac" + "snps,dwmac-5.10a".
- [High] The commit message names two problems and claims this patch
  handles them: 1.
- [Medium] The T7 MAC is declared as "snps,dwmac-5.10a".

--

arm64: dts: amlogic: t7: add the ethernet controller

This patch adds the T7 Synopsys MAC node, its PRG_ETH glue registers, and
a g12a-compatible MDIO multiplexer to amlogic-t7.dtsi. The multiplexer
also gets an internal PHY bus. The MAC, the multiplexer and the internal
PHY bus are all disabled by default.

> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7bd53ec166071..eb7f46c98b0b4 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -250,6 +250,31 @@ gic: interrupt-controller@fff01000 {
>  			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
>  		};
>  
> +		ethmac: ethernet@fdc00000 {
> +			compatible = "amlogic,t7-dwmac", "snps,dwmac-5.10a";

[Severity: High]
Which driver is expected to bind this node? I can't find anything in the
tree that accepts either compatible string.

meson8b_dwmac_match[] in drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
lists only the meson8b, meson8m2, meson-gxbb, meson-axg and meson-g12a
compatibles. This node has no G12A or AXG fallback.

dwmac_generic_match[] in dwmac-generic.c stops at snps,dwmac-4.10a. The
only use of "snps,dwmac-5.10a" is the stmmac_gmac4_compats[]
feature-detection list in stmmac_platform.c. That list is only consulted
after some driver has already bound.

The later patch "arm64: dts: amlogic: t7: khadas-vim4: enable the
ethernet port" sets ethmac and eth_phy to okay. Wouldn't the board then
end up without ethernet?

meson8b_init_rgmii_delays(), set_phy_mode() and meson8b_init_prg_eth()
only run from meson8b_dwmac_probe(). So the PRG_ETH registers at
0xfe024000 keep the bootloader's interface mode and delays.

The stmmac MDIO bus for mdio0 is never registered either. That makes
g12a_mdio_mux_probe()->mdio_mux_init() on mdio-parent-bus = <&mdio0>
return -EPROBE_DEFER forever.

The node also looks like it fails dtbs_check against
amlogic,meson-dwmac.yaml:

- select has no T7 string.
- The fallback contains list only allows snps,dwmac-3.70a or snps,dwmac.
- clock-names is fixed to stmmaceth/clkin0/clkin1/timing-adjustment.

The commit message says the multiplexer "probes after the controller has
programmed them" and that "unless the controller holds that clock, the
writes are lost". No driver in the tree does that for this node, and this
series only adds a T7 binding for the MDIO mux.

Is there a dt-bindings patch and a driver match patch that this depends
on and should mention?

[Severity: Medium]
Is snps,dwmac-5.10a the right IP version for this MAC? The string is in
stmmac_gmac4_compats[], so stmmac would drive the core with the GMAC4/5
register map and descriptor format.

The S4 node in meson-s4.dtsi seems to describe the same block. It has:

- the MAC at 0xfdc00000 and the glue at 0xfe024000
- macirq on GIC_SPI 74
- the same rx and tx fifo depths
- an ETH power domain
- a g12a-compatible mux at apb+0x28000

But it declares the core as 3.70a:

	compatible = "amlogic,meson-axg-dwmac",
		     "snps,dwmac-3.70a",
		     "snps,dwmac";

If the T7 core is also 3.70a, then once a driver binds, stmmac would read
the version register at the wrong offset. It would also use the wrong DMA
and descriptor layout.

Could the version be checked against the hardware version register (0x20
on 3.x, 0x110 on 4.x and later) and stated in the commit message?

> +			reg = <0x0 0xfdc00000 0x0 0x10000>,
> +			      <0x0 0xfe024000 0x0 0x8>;
> +			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq";
> +			clocks = <&clkc_periphs CLKID_SYS_ETH>,
> +				 <&scmi_clk CLKID_FCLK_DIV2>,
> +				 <&mpll CLKID_MPLL2>,
> +				 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>,
> +				 <&clkc_periphs CLKID_SYS_ETHPHY>;
> +			clock-names = "stmmaceth", "clkin0", "clkin1", "pipeline",
> +				      "pclk";

[Severity: High]
The commit message says the pipeline gate "is switched off as unused",
and that the controller has to hold the clock it shares with the glue
registers. Does listing these two clocks here keep either of them
enabled?

Nothing under drivers/net requests a "pipeline" clock:

- stmmac_probe_config_dt() only gets stmmaceth, pclk and ptp_ref.
- meson8b_dwmac_probe() only gets "timing-adjustment", plus clkin0 and
  clkin1 as mux parents.

The only "pipeline" consumer in the tree is meson-gx-mmc.c, and it claims
the clock explicitly with devm_clk_get_enabled().

Also, t7_sys_ampipe_eth is declared without CLK_IGNORE_UNUSED:

drivers/clk/meson/t7-peripherals.c:
static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);

Even after a T7 entry is added to dwmac-meson8b, wouldn't
clk_disable_unused still gate CLKID_SYS_AMPIPE_ETH? That would cut the
MAC's DMA path to memory.

For CLKID_SYS_ETHPHY, the mux is the only holder until a MAC driver binds
this node:

drivers/net/mdio/mdio-mux-meson-g12a.c:g12a_mdio_mux_probe() {
    ...
	pclk = devm_clk_get_enabled(dev, "pclk");
    ...
}

That reference is dropped whenever the mux probe defers or fails. This
looks like the same ordering hazard the commit message says it closes.

The five-entry clock-names list also doesn't match
amlogic,meson-dwmac.yaml. That schema allows at most four entries, with
index 3 being timing-adjustment.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121213102.143130-1-tanure%40linux.com
