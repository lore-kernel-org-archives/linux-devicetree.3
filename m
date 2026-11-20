Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175163;
	b=3rSDunz0aS/Z1G/zeNajNJLQ0RVHEZu+Z1wsH/RgMixjdiFEGnnAwJuNFT81tLIismaT
	 ks7NGmN6QWbBUZJqAZM3eX3UC52t7PClsNtrO7ZzOeQbHHPtYKoJXBUWrQnwFoIhvFWuC
	 pEPg5WNw71Cmd5c4ot5tK0F6Kr6RcmJsq33EhkGXa1ACp1dCHPk/jdc4UkW+Sb4RUKE8+
	 /yo1UCj51ArLdZFT81CLgy4BfOjRdwVCpDytUfYk79f+Piz7PchcfEnQZktBdrOGXjb5g
	 BWBlEFHSd8Mk5iCdpa45nhWKG7xbtYhiLAIFgHSLHbOVKUeT0DXXVPgdozShj9FrE7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175163;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=r3BTEoTWdxpLsSrAwe3pSyp3V8A+NO3HPrbJJYpXFMw=;
	b=xwVS4My0BRoZ5+31xN/NybYCU5LUwOgpGSwBUJoYlOhwWpk8LkIhOXJMmKUTo7G0bKFw
	 FE3FJWwZSETqcZWUxK8N5a1Lp6it+ZYtIp/rJuB35exyCUgT8uI/tzbm6KirkZpoeCmyU
	 wBcjKoHfu4o8DSkAAvlXxHrmSIr0/y6jVB62NRUc8xrX5yBz17qCjj9pkuPYX/b6Fx2Zj
	 PYvhBADfA5raG4GaUuHJwMSrqco9p2VVOfxCqjkH3V7kxHAxmAYaq7Y0IWe4rkHeGRc1Q
	 OoO+nPVJsP1JU3j8BgICahvNmUBvWn9O9YjSha+cmwsTyMTO37pnaMYWtaT0XRR+6Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J3nRUyJ3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370B460A2639;
	Fri, 20 Nov 2026 11:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J3nRUyJ3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47F41F00A00;
	Fri, 20 Nov 2026 11:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795175163;
	bh=r3BTEoTWdxpLsSrAwe3pSyp3V8A+NO3HPrbJJYpXFMw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=J3nRUyJ34H/ZRu8a+NI9fDD/6j/tpohkyinDxyNdTniY/BL/y6w1AzXiqu6nUeBck
	 4KQzbhE3eWYfjOPen1pZ60/M94RHNijndWO+ciDdukCWDvJoUTBoWVaeo3oQEwMSRK
	 r/s0Mm7fE9hHIMY+8dHT7SvLHoQnRfiU51+lOttrJJ3WpQp6R/WRtTl5LhDdBR/TL9
	 Vh3hSv1/ZnHyskTyZEsqHQtcVKuGehh4mKQXf4ZlS6z8rDOqKbf13ALaWG+1ARIgvF
	 5k5m0hblFfpNEHoVk4IPhhFDWqNnu5PTfZmn9GlQW1z3oikEYoBQObSkaQLNfcj9ru
	 WXnhJPhIlbsLQ==
Subject: Re: [PATCH net-next v4 09/10] net: stmmac: qcom-ethqos: add Shikra
 EMAC support
From: netdev-bot+sashiko@kernel.org
To: mohd.anwar@oss.qualcomm.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, afd@ti.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, richardcochran@gmail.com, andersson@kernel.org,
 konradybcio@kernel.org, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
 joabreu@synopsys.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, lorenzo.bianconi@oss.qualcomm.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 20 Nov 2026 11:46:01 +0000
Message-ID: <179517516121.3136.6880108744896327095@kernel.org>
In-Reply-To: <20261117-shikra_ethernet-v4-9-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-9-c41902e5f2fa@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 (1) · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] On Shikra, the DLL-bypass path is only used for phy-mode
  "rgmii-id", but nothing stops a DT from using another RGMII mode, and…
- [Medium] Putting "stmmaceth" in shikra_noc_clk_names (dwmac-qcom-
  ethqos.c:335-340) puts the stmmac-core-owned clock under OPP rate and…

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but by the
  earlier commit in this series "net: stmmac: qcom-ethqos: add DLL-…

--

net: stmmac: qcom-ethqos: add Shikra EMAC support

This adds the qcom,shikra-ethqos compatible and a new shikra_data
descriptor. The descriptor enables three NOC clocks whose rates are set
through an OPP table, sets a 36-bit DMA address width, and sets
phy_managed_delays so rgmii-id uses the DLL-bypass sequence.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 15385750b3e6e..a7fdba73da2ba 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -332,6 +332,24 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
>  	.setup = ethqos_scmi_setup,
>  };
>  
> +static const char * const shikra_noc_clk_names[] = {
> +	"stmmaceth",

[Severity: Medium]
Putting "stmmaceth" in this list places a clock that the stmmac core owns
under OPP rate and VDD_CX control. Is the enable ordering on resume safe?

ethqos_clks_config(false) drops the vote with dev_pm_opp_set_rate(dev, 0).
In drivers/opp/core.c, _set_opp() with a NULL opp goes to
_disable_opp_table(). That removes the bandwidth, level and required-opps
votes, but it never lowers the clock rates. So stmmaceth stays at its OPP
maximum rate after the CX vote is gone.

On resume, stmmac_bus_clks_config() enables that same clock before the
glue callback puts the vote back:

drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:stmmac_bus_clks_config() {
    ...
		ret = clk_prepare_enable(plat_dat->stmmac_clk);
    ...
		ret = clk_prepare_enable(plat_dat->pclk);
    ...
		if (plat_dat->clks_config) {
			ret = plat_dat->clks_config(plat_dat->bsp_priv, enabled);
    ...
}

ethqos_clks_config()->qcom_ethqos_set_opp() only runs after that. At
probe, stmmac_probe_config_dt() also enables stmmaceth before
ethqos_hlos_setup() votes.

The commit message says this is safe because "VDD_CX only needs to be
voted while DMA traffic is ongoing". However, the OPP required-opps
describe the CX corner a given clock frequency needs, whether or not
traffic is running.

Could stmmaceth be ungated at its OPP fmax while CX is at a lower corner?

For axi-noc and pcie-tile-axi-noc, the glue driver applies the vote
before enabling the clocks. Would it be better to do one of these
instead?

  - keep stmmaceth out of the OPP-managed set
  - lower its rate before dropping the vote
  - make sure the vote is in place before the core enables stmmac_clk

> +	"axi-noc",
> +	"pcie-tile-axi-noc",
> +	NULL,
> +};
> +
> +static const struct ethqos_emac_driver_data shikra_data = {
> +	.dma_addr_width = 36,
> +	.has_emac_ge_3 = true,
> +	.noc_clk_names = shikra_noc_clk_names,
> +	.num_noc_clks = ARRAY_SIZE(shikra_noc_clk_names) - 1,
> +	.rgmii_config_loopback_en = false,
> +	.phy_managed_delays = true,

[Severity: Medium]
This descriptor has phy_managed_delays but no rgmii_por table. What
happens if a Shikra DT uses phy-mode "rgmii", "rgmii-rxid" or
"rgmii-txid"?

ethqos_fix_mac_speed_rgmii() only takes the bypass for RGMII_ID:

	if (ethqos->data->phy_managed_delays &&
	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
		ethqos_configure_rgmii_id(ethqos, speed);
		return;
	}

Nothing limits Shikra to that mode:

  - qcom_ethqos_probe() accepts all four RGMII variants for every
    compatible.
  - ethqos_hlos_setup() installs ethqos_fix_mac_speed_rgmii() for all
    four.
  - The qcom,shikra-ethqos block in qcom,ethqos.yaml does not constrain
    phy-mode.

In those modes the generic DLL/IO-macro sequence runs. Its reset loop
does nothing, because num_rgmii_por is 0:

	/* Reset to POR values and enable clk */
	for (i = 0; i < ethqos->data->num_rgmii_por; i++)
		rgmii_writel(ethqos, ethqos->data->rgmii_por[i].value,
			     ethqos->data->rgmii_por[i].offset);

Every other HLOS RGMII descriptor has a 6-entry POR table. The
read-modify-write steps that follow depend on that reset:

  - ethqos_rgmii_macro_init() sets SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY and
    SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN at 10/100M, and
    SDCC_DDR_CONFIG_PRG_DLY_EN at 1G. Neither path clears the other's
    bits.
  - ethqos_dll_configure() sets DLL_EN/CDR_EN/CDR_EXT_EN at 1G, and the
    10/100 path does not clear them.

After a speed renegotiation, can both RX delay mechanisms end up enabled,
so the result depends on link-speed history?

The 1G prg_rclk_dly value of 115 also assumes a TCXO_CYCLES_CNT that
comes from the v3/v4 POR value 0x80040800. Shikra never writes that
value.

The commit message says "No POR table is needed for this intended bypass
operation", but neither the binding nor the driver enforces rgmii-id.
Would one of these be appropriate?

  - constrain phy-mode to rgmii-id for qcom,shikra-ethqos in the binding
  - reject the non-ID RGMII modes in the driver for descriptors without
    a POR table
  - add a Shikra POR table

The later patch in this series, "net: stmmac: qcom-ethqos: add QCS615
EMAC support", uses the same pattern for qcs615_data.

[Severity: Medium]
This is a pre-existing issue and was not introduced by this patch. It
comes from the earlier commit in this series, "net: stmmac: qcom-ethqos:
add DLL-bypass for PHY-managed RGMII delays".

ethqos_set_clk_tx_rate() picks the link clock rate from phy_mode alone:

	if (ethqos->phy_mode != PHY_INTERFACE_MODE_RGMII_ID ||
	    speed == SPEED_1000)
		rate *= 2;

ethqos_fix_mac_speed_rgmii() also requires data->phy_managed_delays
before it takes the bypass. Take a descriptor without phy_managed_delays
(emac_v2_1_0, v2_3_0, v3_0_0, v4_0_0) and phy-mode "rgmii-id". At
100M/10M, doesn't the MAC-delay sequence then run with a 25/2.5 MHz link
clock instead of the 50/5 MHz it expects?

That would not match "No change intended on existing platforms" in the
earlier commit. No in-tree qcom DT uses rgmii-id with these compatibles
today. Shikra sets phy_managed_delays, so this patch is consistent with
the clock-rate logic. Checking ethqos->data->phy_managed_delays in
ethqos_set_clk_tx_rate() would probably belong in the earlier commit.

> +	.dwmac4_addrs = &ethqos_dwmac4_addrs,
> +	.setup = ethqos_hlos_setup,
> +};

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-shikra_ethernet-v4-0-c41902e5f2fa%40oss.qualcomm.com
