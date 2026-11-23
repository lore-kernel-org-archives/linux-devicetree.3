Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795403265;
	b=5gl3BB32q648NCuzOCARp8MwiNA9gNzZLX3z+Jb3WAgda23HE1I4F7if74ik4mFxB7KZ
	 /dyDmW6CkZcxjoCeEY78O8x50fkup2obcRu3IiAJiL4e8p3lr7TQs4zowk5vlDNLMqyyQ
	 3QPGjuOZ7iHTwI9BF6E4FvBKgvt0ftoCUnN3yJo6h9Y1VVNtfuPGFbpG10EOMvDTZi3ur
	 08mtcof5uMHy7AjaXOaKLZiOyz3qKyvqqnAg0b0VLu4z0lJDaX3LbNWHlgzJO6n0m27Ei
	 613KzCDYX9tOUMGkGBoxSu0Ip4WrlSAsJUund8cDFMRsiAJVCQUawf0UOkYw2bFYvFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403265;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EEjXBCSermC5XnoBYhMJUthJ3HfgGrN66oi6FLQHx0A=;
	b=M7V40M4Ng3NgNN3P+F+yqa43YddeZqnM1IMYKLY8UroPL4O1qvBBQnqgHCgcp1qCnmd9
	 5f3jArQpAIPs1+NX9af5yf0daRE6IkxVbvf6xysWxeTQMmAmpu0q2WwDpdc7l+6SIgDXw
	 /lx9gy2bnP8GGG6oQxJ6rR5kckSnJvVkFK6e3pzf5jdjXCiVIZuXtBIQwuBW/cL6WTmCa
	 JtyyQTkTuoS5hw6sz97z/uor/xKJaV7RhPqdQ2Bq8rdyAzzhE0v7p425LM7GY1JKZyWPW
	 cJTrY2OPFzj7EM/rjNbVmN5DvgSzIuPrYeqp/uSoASdV9sy/BZiK25xJalBUSU4p0Mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZnFGWSFD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0562D606A6B4;
	Mon, 23 Nov 2026 03:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZnFGWSFD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795403264;
	b=1ZtHDq93iCVKPM0Sq1Vr8mMz6Jsbrk+QpuScZPzkXbWmkBOiKjDEwbMgcT7oDMUEEwZU
	 DSCCR7L/C5fPe7LCbJ57vxeZ22gG1PtPuULGlYhvCD8SXrmTsTl9E0efVJjXrrGwbeWLr
	 oZ0JAnMz+eJdN1Pg3nkC3mPv1DwNofMGtD8x1z5p2Wcs3J1WY8juznmTixz1MJ1jsWqqf
	 QkAYGoDvA4Bl8vfJ+RlJOESvDfr/BIie8oo1j5ACA6lMBaVH+9WazSNCWJ19j6XqJOVoC
	 /L7QRpo8iuCQ6YaAz5FvMIgcvh8r+ZPqj2X8aMLQMMP5DKDDvneYQlgW5UnW7f31Fbw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795403264;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EEjXBCSermC5XnoBYhMJUthJ3HfgGrN66oi6FLQHx0A=;
	b=Pn/gB2tPo/CoD+lowySDu+SUaC8svw5zQ9Xlk7KVBLWL5SqVh7MnSdZzLhCtlJzy2S3S
	 4erFXkkC7LKjPM5PsXmYR+pZ0johz6a+oUOQhItKn4NGAsn+FKrf86xFVUeov8QS1mN6N
	 OqK0Zp3KzpqUiwRQPbq0CW0QORZU0SV+d6AkcixQzUbHh4lmJUPIUiWa2dHewcXwDMbz/
	 +uqwR17qc4+KZbq8bsqZjgPJbnFIJNjok59jzxj+owgTVRfTfXHnYAnFOPSNzztW5luSm
	 ntGWW1gZscDquAGzV3zsNbJ+F731eP58GqVpYoyLuJzNszkeqQDUy3joLnzp9ATEjPg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6AC51F00A00;
	Mon, 23 Nov 2026 03:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795403264;
	bh=EEjXBCSermC5XnoBYhMJUthJ3HfgGrN66oi6FLQHx0A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZnFGWSFDWriNokQ83/4EPjHQ8QnNgYt0dBJAFaUPDJFS9O3AXyugGzxrMzauXm9Lh
	 4POcNGhliQZX9RAAL4AY6IgBIhe+PX0QPZ8wAH2jyCieojF8eO1lgXnK4nfgq3uYQu
	 /IDgxDN3AHx29lVhSRSN6JmsfP3M1PXneLGJHpMWSnOgjvWTPA4bxiez8R0bDiRxZh
	 d+68enJgc6GX9EOT9gCg7vdTQbmfLmYL/59mbF2sIR/XFJb5ZceSyWNlX2Dd6n9nY0
	 X0gwGXPvWb4P0IbUBiX1xJaCZsQ+fPFpXXGagGCyVH41lZ38ZtSWt86X1F7FnkgzTK
	 6Qh9HhJPVVGFg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 474CF4C30B;
	Mon, 23 Nov 2026 03:07:33 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Mon, 23 Nov 2026 11:07:28 +0800
Subject: [PATCH net-next v5 2/2] net: stmmac: dwmac-rk: Add RK3572 support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-add-board-ok3572-c-net-v5-2-8ec9012b578f@qq.com>
References: <20261123-add-board-ok3572-c-net-v5-0-8ec9012b578f@qq.com>
In-Reply-To: <20261123-add-board-ok3572-c-net-v5-0-8ec9012b578f@qq.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 David Wu <david.wu@rock-chips.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Cunhao Lu <1579567540@qq.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795403251; l=4857;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=Er103tsloFwxtyv/kT9C0DhrwH98VW9zC6CCWRpsoHU=;
 b=Z2V7b5VvyQH25FE4KjoGgEHT/QYwAgUWmxRBa4lT7hyDodKvBmN1PGaFBn2b0tjmKvzPYotf2
 8ZldegRrchOBOkORIJ9EUuLmJ9wSOqR7024Wu6tPNVt8zXlkW4xgOCr
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
Reply-To: 1579567540@qq.com
Content-Transfer-Encoding: 7bit

From: Cunhao Lu <1579567540@qq.com>

The RK3572 has two GMAC controllers with separate mode and clock control
registers in the PHP and NVM0 GRFs. RGMII delay lines are configured
through the IOC.

Add the register layout and delay callback for both controllers so the
Rockchip glue driver can configure their RGMII and RMII interfaces and
select the appropriate clocks for each link speed. Skip parsing the
deprecated tx_delay and rx_delay properties for RK3572.

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
Changes in v5:
- Use skip_rgmii_delay_props to control tx_delay and rx_delay parsing.

Changes in v4:
- Skip legacy delay properties and disable MAC RGMII delays on RK3572.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 75 ++++++++++++++++++++++++--
 1 file changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index ad2bae308323..01fec12aa16a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -66,6 +66,9 @@ struct rk_gmac_ops {
 	bool supports_rgmii;
 	bool supports_rmii;
 	bool supports_sgmii;
+	/* Skip parsing legacy tx_delay and rx_delay properties on new SoCs. */
+	bool skip_rgmii_delay_props;
+
 	bool php_grf_required;
 	bool regs_valid;
 	u32 regs[];
@@ -900,6 +903,67 @@ static const struct rk_gmac_ops rk3568_ops = {
 	},
 };
 
+#define RK3572_VCCIO0_3_VO_IOC_CON1		0x10608
+#define RK3572_VCCIO1_2_4_VI_IOC_CON1		0x12604
+#define RK3572_VCCIO5_6_IOC_MISC0		0x14630
+#define RK3572_PHP_GRF_GMAC0_CON		0x0070
+#define RK3572_NVM0_GRF_GMAC1_CON		0x0020
+
+static int rk3572_init(struct rk_priv_data *bsp_priv)
+{
+	switch (bsp_priv->id) {
+	case 0:
+		bsp_priv->gmac_grf_reg = RK3572_PHP_GRF_GMAC0_CON;
+		break;
+	case 1:
+		bsp_priv->gmac_grf_reg = RK3572_NVM0_GRF_GMAC1_CON;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	bsp_priv->clock_grf_reg = bsp_priv->gmac_grf_reg;
+	return 0;
+}
+
+static void rk3572_set_to_rgmii(struct rk_priv_data *bsp_priv,
+				int __always_unused tx_delay,
+				int __always_unused rx_delay)
+{
+	u32 val = GRF_CLR_BIT(15) | GRF_CLR_BIT(7);
+
+	if (bsp_priv->id == 1) {
+		regmap_write(bsp_priv->php_grf, RK3572_VCCIO0_3_VO_IOC_CON1, val);
+		regmap_write(bsp_priv->php_grf, RK3572_VCCIO5_6_IOC_MISC0, val);
+	} else {
+		regmap_write(bsp_priv->php_grf, RK3572_VCCIO1_2_4_VI_IOC_CON1, val);
+	}
+}
+
+static const struct rk_gmac_ops rk3572_ops = {
+	.init = rk3572_init,
+	.set_to_rgmii = rk3572_set_to_rgmii,
+
+	.gmac_phy_intf_sel_mask = GENMASK_U16(11, 9),
+	.gmac_rmii_mode_mask = BIT_U16(3),
+
+	.clock.io_clksel_io_mask = BIT_U16(7),
+	.clock.gmii_clk_sel_mask = GENMASK_U16(6, 5),
+	.clock.rmii_clk_sel_mask = BIT_U16(5),
+	.clock.rmii_gate_en_mask = BIT_U16(4),
+
+	.supports_rmii = true,
+	.skip_rgmii_delay_props = true,
+
+	.php_grf_required = true,
+	.regs_valid = true,
+	.regs = {
+		0x29d20000, /* gmac0 */
+		0x2a040000, /* gmac1 */
+		0x0, /* sentinel */
+	},
+};
+
 /* VCCIO0_1_3_IOC */
 #define RK3576_VCCIO0_1_3_IOC_CON2		0X6408
 #define RK3576_VCCIO0_1_3_IOC_CON3		0X640c
@@ -1341,8 +1405,9 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
 	 * provide (see rk_gmac_powerup()), so only the delay values for
 	 * those directions are needed.
 	 */
-	if (bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII ||
-	    bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII_RXID) {
+	if (!ops->skip_rgmii_delay_props &&
+	    (bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII ||
+	     bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII_RXID)) {
 		ret = of_property_read_u32(dev->of_node, "tx_delay", &value);
 		if (ret) {
 			bsp_priv->tx_delay = 0x30;
@@ -1355,8 +1420,9 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
 		}
 	}
 
-	if (bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII ||
-	    bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII_TXID) {
+	if (!ops->skip_rgmii_delay_props &&
+	    (bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII ||
+	     bsp_priv->phy_iface == PHY_INTERFACE_MODE_RGMII_TXID)) {
 		ret = of_property_read_u32(dev->of_node, "rx_delay", &value);
 		if (ret) {
 			bsp_priv->rx_delay = 0x10;
@@ -1736,6 +1802,7 @@ static const struct of_device_id rk_gmac_dwmac_match[] = {
 	{ .compatible = "rockchip,rk3506-gmac", .data = &rk3506_ops },
 	{ .compatible = "rockchip,rk3528-gmac", .data = &rk3528_ops },
 	{ .compatible = "rockchip,rk3568-gmac", .data = &rk3568_ops },
+	{ .compatible = "rockchip,rk3572-gmac", .data = &rk3572_ops },
 	{ .compatible = "rockchip,rk3576-gmac", .data = &rk3576_ops },
 	{ .compatible = "rockchip,rk3588-gmac", .data = &rk3588_ops },
 	{ .compatible = "rockchip,rv1108-gmac", .data = &rv1108_ops },

-- 
2.34.1


