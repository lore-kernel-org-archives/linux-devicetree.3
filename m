Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679136;
	b=iHT/J5TD0KVrHlOqOLRGSTITHbac+MVZCTH6Qx5ddUrr5Xka5Bo9QAq66z33Im0ciKKr
	 XZ4uXOafOibIHF3QaFgyoK7OVNxJKerlLoiv2x5NmZwE8CkkbC68nELb8hYut0giYC2jn
	 kIr+061F60cGVlAAQKT2J2EFXH9eccWccGyL5AsN01KVTQ8De7PAlDDt7XTsQZQ0238UH
	 cF2CoBMhhREUApBXRGbso5Datk7WF9mCfNw2ul4zn7NwIQKM9bd310fxoszPyoH3k82wl
	 cL0W1brcpCugyaYWRQXs6s1vgSg3VB2/fz4XSr1lDnU7i9c/0qkQPU0JhiIfkL2TYUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679136;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=A9K6RkgQ1vHlkb7fqWCFJaJDYD0d1tdrNCpLiTMotOM=;
	b=QxftzjsMtzN10xZampDTs0AV8LcwN3QEcTJVTKfxoEoAAJpHrqG7wPrKc11+Q28MUu6K
	 GRE7/nkCnCVJIg6Yh/SS/JrFAnDGpwMhHazMe2fP8gLjWLgf9SIUw2Nlf2TaZXFNbmz5K
	 uDrlcJUNA1h5tVVs8a2UaGc9d5BKfQaXFDD5ToIcKfcez5YQ1RJHJ7kk7SFrYoDMwnsnN
	 Sk23RpFS2nieVXE8yTdG67fCUSx/3m89ZbSymajfNVyZmlSSNBSCGiuFmNOm+gblWNdxz
	 qu1z2P8g0SY52KL6u82MUYmG5Ob0QcByXhZtzkywh5aluN8LYUrU43WMQSiLYwjZeeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=I2bC3kAR;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8975C606A326;
	Thu, 26 Nov 2026 07:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8975C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=I2bC3kAR
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 645BEC2B9C5;
	Thu, 26 Nov 2026 07:45:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0393E60237;
	Thu, 26 Nov 2026 07:45:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A831811E69637;
	Thu, 26 Nov 2026 08:45:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795679129; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=A9K6RkgQ1vHlkb7fqWCFJaJDYD0d1tdrNCpLiTMotOM=;
	b=I2bC3kARiYxoBsF1f+GjPGDVb4kaUokJHLW+5C42qhHq52CSQ9zsrIuk/7wmdZKlub5MZD
	Nzsqmi0SUZBcPItT2P0XsYf7xNk5Hhut+grWrrmVOLRWAbaWM3cSarLt8fZO1YUvnOX0id
	WlKa5KHF7EPV62Ahm99bqtlJqoU8M+q7p6WYVlZiot6dRJhnOYlhBdk9Au0zjbYPU77r7g
	DnnAUqpVK3/EwsyuLfCCfNYMFRRd5MZ8TOLpkoMg2oqanenUsw100MNj34SBScKJIwGZ/v
	QY98US3y+nEbanJrhqkKxvVZlRyeka+yG+WaovW9MMLiUXYF3cqc4sg9Pg+GDw==
Message-ID: <79d96092-732a-4162-aac5-f53114f55472@bootlin.com>
Date: Thu, 26 Nov 2026 08:45:19 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 2/2] net: stmmac: dwmac-rk: Add RK3572 support
To: 1579567540@qq.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 David Wu <david.wu@rock-chips.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261123-add-board-ok3572-c-net-v5-0-8ec9012b578f@qq.com>
 <20261123-add-board-ok3572-c-net-v5-2-8ec9012b578f@qq.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261123-add-board-ok3572-c-net-v5-2-8ec9012b578f@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/23/26 04:07, Cunhao Lu via B4 Relay wrote:
> From: Cunhao Lu <1579567540@qq.com>
> 
> The RK3572 has two GMAC controllers with separate mode and clock control
> registers in the PHP and NVM0 GRFs. RGMII delay lines are configured
> through the IOC.
> 
> Add the register layout and delay callback for both controllers so the
> Rockchip glue driver can configure their RGMII and RMII interfaces and
> select the appropriate clocks for each link speed. Skip parsing the
> deprecated tx_delay and rx_delay properties for RK3572.
> 
> Signed-off-by: Cunhao Lu <1579567540@qq.com>

I think the RGMII handling is good now,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
> Changes in v5:
> - Use skip_rgmii_delay_props to control tx_delay and rx_delay parsing.
> 
> Changes in v4:
> - Skip legacy delay properties and disable MAC RGMII delays on RK3572.
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 75 ++++++++++++++++++++++++--
>  1 file changed, 71 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index ad2bae308323..01fec12aa16a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -66,6 +66,9 @@ struct rk_gmac_ops {
>  	bool supports_rgmii;
>  	bool supports_rmii;
>  	bool supports_sgmii;
> +	/* Skip parsing legacy tx_delay and rx_delay properties on new SoCs. */
> +	bool skip_rgmii_delay_props;
> +
>  	bool php_grf_required;
>  	bool regs_valid;
>  	u32 regs[];
> @@ -900,6 +903,67 @@ static const struct rk_gmac_ops rk3568_ops = {
>  	},
>  };
>  
> +#define RK3572_VCCIO0_3_VO_IOC_CON1		0x10608
> +#define RK3572_VCCIO1_2_4_VI_IOC_CON1		0x12604
> +#define RK3572_VCCIO5_6_IOC_MISC0		0x14630
> +#define RK3572_PHP_GRF_GMAC0_CON		0x0070
> +#define RK3572_NVM0_GRF_GMAC1_CON		0x0020
> +
> +static int rk3572_init(struct rk_priv_data *bsp_priv)
> +{
> +	switch (bsp_priv->id) {
> +	case 0:
> +		bsp_priv->gmac_grf_reg = RK3572_PHP_GRF_GMAC0_CON;
> +		break;
> +	case 1:
> +		bsp_priv->gmac_grf_reg = RK3572_NVM0_GRF_GMAC1_CON;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	bsp_priv->clock_grf_reg = bsp_priv->gmac_grf_reg;
> +	return 0;
> +}
> +
> +static void rk3572_set_to_rgmii(struct rk_priv_data *bsp_priv,
> +				int __always_unused tx_delay,
> +				int __always_unused rx_delay)
> +{
> +	u32 val = GRF_CLR_BIT(15) | GRF_CLR_BIT(7);
> +
> +	if (bsp_priv->id == 1) {
> +		regmap_write(bsp_priv->php_grf, RK3572_VCCIO0_3_VO_IOC_CON1, val);
> +		regmap_write(bsp_priv->php_grf, RK3572_VCCIO5_6_IOC_MISC0, val);
> +	} else {
> +		regmap_write(bsp_priv->php_grf, RK3572_VCCIO1_2_4_VI_IOC_CON1, val);
> +	}
> +}
> +
> +static const struct rk_gmac_ops rk3572_ops = {
> +	.init = rk3572_init,
> +	.set_to_rgmii = rk3572_set_to_rgmii,
> +
> +	.gmac_phy_intf_sel_mask = GENMASK_U16(11, 9),
> +	.gmac_rmii_mode_mask = BIT_U16(3),
> +
> +	.clock.io_clksel_io_mask = BIT_U16(7),
> +	.clock.gmii_clk_sel_mask = GENMASK_U16(6, 5),
> +	.clock.rmii_clk_sel_mask = BIT_U16(5),
> +	.clock.rmii_gate_en_mask = BIT_U16(4),
> +
> +	.supports_rmii = true,
> +	.skip_rgmii_delay_props = true,
> +
> +	.php_grf_required = true,
> +	.regs_valid = true,
> +	.regs = {
> +		0x29d20000, /* gmac0 */
> +		0x2a040000, /* gmac1 */
> +		0x0, /* sentinel */
> +	},
> +};
> +
>  /* VCCIO0_1_3_IOC */
>  #define RK3576_VCCIO0_1_3_IOC_CON2		0X6408
>  #define RK3576_VCCIO0_1_3_IOC_CON3		0X640c
> @@ -1341,8 +1405,9 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
>  	 * provide (see rk_gmac_powerup()), so only the delay values for
>  	 * those directions are needed.
>  	 */
> -	if (bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII ||
> -	    bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII_RXID) {
> +	if (!ops->skip_rgmii_delay_props &&
> +	    (bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII ||
> +	     bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII_RXID)) {
>  		ret = of_property_read_u32(dev->of_node, "tx_delay", &value);
>  		if (ret) {
>  			bsp_priv->tx_delay = 0x30;
> @@ -1355,8 +1420,9 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
>  		}
>  	}
>  
> -	if (bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII ||
> -	    bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII_TXID) {
> +	if (!ops->skip_rgmii_delay_props &&
> +	    (bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII ||
> +	     bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII_TXID)) {
>  		ret = of_property_read_u32(dev->of_node, "rx_delay", &value);
>  		if (ret) {
>  			bsp_priv->rx_delay = 0x10;
> @@ -1736,6 +1802,7 @@ static const struct of_device_id rk_gmac_dwmac_match[] = {
>  	{ .compatible = "rockchip,rk3506-gmac", .data = &rk3506_ops },
>  	{ .compatible = "rockchip,rk3528-gmac", .data = &rk3528_ops },
>  	{ .compatible = "rockchip,rk3568-gmac", .data = &rk3568_ops },
> +	{ .compatible = "rockchip,rk3572-gmac", .data = &rk3572_ops },
>  	{ .compatible = "rockchip,rk3576-gmac", .data = &rk3576_ops },
>  	{ .compatible = "rockchip,rk3588-gmac", .data = &rk3588_ops },
>  	{ .compatible = "rockchip,rv1108-gmac", .data = &rv1108_ops },
> 

