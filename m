Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175161;
	b=NJiWum8gF2dA7soRleVwO7FDy8r5Rahhdrk4qcmuCiSpljEbgGwPVJME4AmmO4U6of8P
	 4eXXx8yQXM3H+coWPnMBLebdiBup/vNJ4CafjwIc9miiRhdbsuJW5goxpMy3vTFLw6U/0
	 zXOsgi9iXMdHv2eyaXujLksFfY8Y1TVFLC2sYkskproWQ1k5HT1oWmqnwu098xUyZ1GzG
	 pc7bgkNgK8quT6o90rGKDzQibQg8bfEvbtn0YKawIcA6Nwx+dEad68UlN0n+EAIiRPR7w
	 N96y4NnGuZkdcOKfkOwTKSc8mELoy92BpG3kDdk17A96/yBNzOz9uTBu0CcFGBd3JkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175161;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oYoHsG83FQZULUWCke+dZGB/1XRF4iHwIyLD1IPShN8=;
	b=h3uhlQIGOmIP9d6ARX+oibQbWDep2CE5NiBYmmWk3Oai4dhuRnPziKqj9WFE2VZoour3
	 rWFu+FHUKhJRMX5aMcaH91ylXl1btZeIy4ubjsR4E+lZfTtSe9AoPPIeGCsk3WlanCn2z
	 j6lQpAOE3CnBWYbnS8llDI2KjVSnuQ0AN9IDHzK3vH0wouLxpIbPxsJVNe/5le6DcX/+2
	 mxsD6r8RKW1Pr1Dru8NllT+9Xxv7KyX0zY29OS+gpu3wGvI2Wwvl3n8Wq6i26kcorYmFt
	 mpGtQX/ZWFGk19lKIEMSuNqsFDsN8obOgvAFG8UlOqV+xhmKHXNVzTdbJe7JioykQig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qe4iv3H9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0572D60A262F;
	Fri, 20 Nov 2026 11:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qe4iv3H9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2839F1F000CA;
	Fri, 20 Nov 2026 11:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795175160;
	bh=oYoHsG83FQZULUWCke+dZGB/1XRF4iHwIyLD1IPShN8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Qe4iv3H9QRX18LS884wJFtJI1QMtrlFCZZsQzFYMsB4UvzqAFBSFlc0TpQlUGoJjt
	 8w/jifjlut16wTKgpIoIIfAGdGNA21z7yQlDTt59XDYVdnLbmDuUDN3CyUT2UoareX
	 wecSSKpAA7QQQUSQasn5UrCBkAODjk7CBY95aWBVQOK54i9Q6k8684TlP0eTZ6NO1W
	 MzTlh3PCpYhBbWhGHbqkAsFYQ0SooIvoFxWvaYFKFESGRG0a07MF4fsvbrT9n/V3pT
	 Zroilq6MXRAJRIV3tnSIXtutGVQB1ZeNqoEfw41OgB0gWpRR9CED3SRcSUGyDWd9fg
	 69THS/vjVZVaA==
Subject: Re: [PATCH net-next v4 05/10] net: stmmac: qcom-ethqos: add
 DLL-bypass for PHY-managed RGMII delays
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
Date: Fri, 20 Nov 2026 11:45:58 +0000
Message-ID: <179517515873.3136.13386164324921238997@kernel.org>
In-Reply-To: <20261117-shikra_ethernet-v4-5-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-5-c41902e5f2fa@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] In ethqos_set_clk_tx_rate()
  (drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c), the new…
- [Medium] Speculative: the new RGMII_ID DLL-bypass path returns before
  the POR reset loop in ethqos_fix_mac_speed_rgmii().

--

net: stmmac: qcom-ethqos: add DLL-bypass for PHY-managed RGMII delays

This adds a DLL-bypass programming path for RGMII_ID, where the PHY
supplies both TX and RX delays. The path is guarded by a new
phy_managed_delays flag in the platform descriptors. It also changes
ethqos_set_clk_tx_rate() so the link clock is not doubled at 100M/10M in
RGMII_ID mode.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index f2428f0467bbb..99ea7e0cfb00d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

[ ... ]

> @@ -189,7 +193,15 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
>  	if (rate < 0)
>  		return rate;
>  
> -	return clk_set_rate(ethqos->link_clk, rate * 2);
> +	/* Clock Rate Requirements:
> +	 * MAC added delay: 250/50/5 MHz for 1G/100M/10M
> +	 * No MAC delay (DLL bypass): 250/25/2.5 MHz for 1G/100M/10M
> +	 */
> +	if (ethqos->phy_mode != PHY_INTERFACE_MODE_RGMII_ID ||
> +	    speed == SPEED_1000)
> +		rate *= 2;

[Severity: High]
Should this check also look at ethqos->data->phy_managed_delays?

In ethqos_fix_mac_speed_rgmii(), the bypass programming only runs when
both conditions are true:

	if (ethqos->data->phy_managed_delays &&
	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {

The existing descriptors don't set the flag. That covers emac_v2_3_0_data
(qcs404), emac_v2_1_0_data (sm8150), emac_v3_0_0_data (sc8280xp) and
emac_v4_0_0_data (sa8775p). With phy-mode "rgmii-id", these still take
the legacy POR/DLL path and call ethqos_rgmii_macro_init(). That function
always sets RGMII_CONFIG_DDR_MODE and programs the MAX_SPD_PRG_2/9
dividers.

The comment above says the MAC-delay setup needs 50/5 MHz. After this
patch, these boards would get 25/2.5 MHz at 100M/10M. Doesn't that
contradict this part of the commit message?

  "This new programming is guarded by a boolean set by the platform
  descriptors. No change intended on existing platforms."

A later patch in the series, "add QCS615 EMAC support", notes that unlike
QCS404, the QCS615 RGMII clock source supports the 25 MHz and 2.5 MHz
rates. So on QCS404 with rgmii-id, this could request rates the clock
source can't produce.

Another later patch, "set initial RGMII link clock to lowest speed",
changes the probe-time call to SPEED_10. Non-flagged rgmii-id platforms
would then also get the halved 2.5 MHz rate at probe. The issue is still
present at the end of the series.

Would it work to use the same predicate as the bypass path? For example:

	if (!(ethqos->data->phy_managed_delays &&
	      ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) ||
	    speed == SPEED_1000)
		rate *= 2;

> +
> +	return clk_set_rate(ethqos->link_clk, rate);
>  }

[ ... ]

> @@ -515,6 +527,58 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)

[ ... ]

> +static void ethqos_configure_rgmii_id(struct qcom_ethqos *ethqos, int speed)
> +{
> +	ethqos_set_func_clk_en(ethqos);
> +
> +	/* For rgmii-id mode, the PHY should add the required delays.
> +	 * Therefore, power down the DLL and program it in bypass mode.
> +	 * Program the IO_MACRO as per the settings recommended by the
> +	 * programming guide for bypass mode. This will ensure that the
> +	 * MAC core doesn't add any additional delays.
> +	 */
> +	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
> +	rgmii_setmask(ethqos, SDCC_USR_CTL_DDR_BYPASS, SDCC_USR_CTL);

[Severity: Medium]
Can leftover MAC-side delay state still affect RX timing here?

The early return in ethqos_fix_mac_speed_rgmii() skips the POR reset
loop. The descriptors that use this path later in the series,
qcs615_data and shikra_data, have no rgmii_por table anyway.

This function only sets SDCC_DLL_CONFIG_PDN and SDCC_USR_CTL_DDR_BYPASS.
ethqos_rgmii_id_macro_init() only does partial read-modify-writes of
RGMII_IO_MACRO_CONFIG and RGMII_IO_MACRO_CONFIG2.

Nothing on this path does any of the following:

  - writes SDCC_HC_REG_DDR_CONFIG (PRG_DLY_EN, PRG_RCLK_DLY,
    EXT_PRG_RCLK_DLY_EN/CODE)
  - clears SDCC_DLL_CONFIG_DLL_EN or SDCC_DLL_CONFIG_CK_OUT_EN
  - programs RGMII_CONFIG_INTF_SEL or RGMII_CONFIG_MAX_SPD_PRG_2/9

These fields keep whatever hardware reset or an earlier boot stage left.
For example, UEFI may have brought the MAC up in DLL/MAC-delay mode for
network boot.

The has_emac_ge_3 POR value for SDCC_HC_REG_DDR_CONFIG (0x80040800) has
PRG_DLY_EN set, and Shikra is has_emac_ge_3.

If these fields still matter with the DLL powered down and DDR_BYPASS
set, wouldn't the MAC add RX delay on top of the PHY's delay? The result
would then depend on boot history. Would it be safer to clear them
explicitly here?

> +
> +	ethqos_rgmii_id_macro_init(ethqos, speed);
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-shikra_ethernet-v4-0-c41902e5f2fa%40oss.qualcomm.com
