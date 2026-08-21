Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4935248EBD0;
	Fri, 21 Aug 2026 12:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313756; cv=none; b=O28T+JqN4FLx8Y/H+n538ES9NAsbWxQN+Uzb2MTOkPF73uF6qpgGgvtPREGugfuvcf8AD0Tnq015VJFdhumx5zazeYMwobW4A02aUEMJ3M0ol/6KA6RxmiLQRFCBIyLv3L2sStS+YjscxgVlnYig57YR3IVEO29adKXw6+v7MV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313756; c=relaxed/simple;
	bh=1YWU9CaZpCJLqtsjR0F+p6T2Me/cuaHMCTUFje7w4FY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QYARg9IcLwCJ7IE4Mw+i1w6bzx1nerM5cmvYfo2prN8dsuSW5mEpAUJl2wcngh7oUYav8fXd2TB2NDph1ldVXGwfMlL3X8QKrwReeGTjkKH/zJ8GRGQG4m0C1mh5vnkfIcarDydAXHvkae/2PDWFXu/raOwWW2DBIB3n1IX3HW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUj7xkHh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUj7xkHh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C746CC19425;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787313755;
	bh=1YWU9CaZpCJLqtsjR0F+p6T2Me/cuaHMCTUFje7w4FY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TUj7xkHhOpHb1lmJRcyBM75SlfrtGOsr5jpb6N9bov6ZMJV5zaqikJhAkeOYD0w5q
	 Zysfc4GVcLFePBHBWK7F/blFUL1OG/ezEj9Lm1qD9Q0QwsnVIGN9jgH+YXjhQLsLZb
	 7EbBrn8wAg/Br1IIW3AMF3C8tG/YapRJBs55KLPvgMHM8Swi425s7G9QnbaqTA84sZ
	 ryOsqAdlwXjX5ZssN8l3nnFS0zeJTIf3zRwNtWtiHIsVWLaRZLOJ47C8912grFbUPt
	 K92gCSts90RQ+33m2yacztYtVtYbPGmQ4pgT2K9vEbiJZF3iOj5QYy+p73Q1egG6R5
	 IKzGZh3OHn2CQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4CA6C5DF7D;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Fri, 21 Aug 2026 20:02:34 +0800
Subject: [PATCH v4 6/7] phy: rockchip-samsung-dcphy: Add a second PHY for
 the receiver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-dcphy-rx-v1-v4-6-f1797634233d@gmail.com>
References: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
In-Reply-To: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787313753; l=4769;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=Tpo2aJZByzL9nN+hv+FBEOMzziNDSj5dFxgoQfw6WoE=;
 b=DtlVLAqZAPRh42okYQIYhYZh/DDPpEAGH5EoRKvqs7GDAbe3CI85tDMs3bus5ETqQq9Z2KvHe
 l1323U8UXUMDyMD7SCEwuN7iWKLYdcAOUHq8mGn2G3qcoXYOaRrB+8x
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-Endpoint-Received: by B4 Relay for jason98166@gmail.com/20260721 with
 auth_id=887
X-Original-From: Jason Yang <jason98166@gmail.com>
Reply-To: jason98166@gmail.com

From: Jason Yang <jason98166@gmail.com>

Give the receiver a struct phy of its own, with its own phy_ops and its
own samsung_mipi_phy for the state the two do not share.

of_xlate() takes the second cell, PHY_TYPE_DSI selecting the transmitter
and PHY_TYPE_CSI the receiver, and falls back to the transmitter for a
single-cell provider, so existing device trees keep working. It now
rejects an unknown value in either cell, and a mix of D-PHY and C-PHY
consumers, which the TRM does not support [1].

The receiver's callbacks return -EOPNOTSUPP until its bring-up is added
in the next change.

[1] RK3588 TRM: section 22.1 (overview)

Assisted-by: Claude:claude-fable-5
Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 69 +++++++++++++++++++++--
 1 file changed, 63 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 5d9d44a1d6a2..d27a5916bd40 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -296,6 +296,8 @@ struct samsung_mipi_dcphy {
 	struct reset_control *apb_rst;
 	struct reset_control *grf_apb_rst;
 	struct samsung_mipi_phy tx;
+	struct samsung_mipi_phy rx;
+	/* PHY mode, PHY_TYPE_DPHY or PHY_TYPE_CPHY. */
 	u8 type;
 
 	const struct samsung_mipi_dcphy_plat_data *pdata;
@@ -1508,6 +1510,22 @@ static int samsung_mipi_dcphy_exit(struct phy *phy)
 	return 0;
 }
 
+static int samsung_mipi_dcphy_rx_configure(struct phy *phy,
+					   union phy_configure_opts *opts)
+{
+	return -EOPNOTSUPP;
+}
+
+static int samsung_mipi_dcphy_rx_power_on(struct phy *phy)
+{
+	return -EOPNOTSUPP;
+}
+
+static int samsung_mipi_dcphy_rx_power_off(struct phy *phy)
+{
+	return -EOPNOTSUPP;
+}
+
 static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
 	.configure = samsung_mipi_dcphy_tx_configure,
 	.power_on  = samsung_mipi_dcphy_tx_power_on,
@@ -1517,6 +1535,15 @@ static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
 	.owner	   = THIS_MODULE,
 };
 
+static const struct phy_ops samsung_mipi_dcphy_rx_ops = {
+	.configure = samsung_mipi_dcphy_rx_configure,
+	.power_on  = samsung_mipi_dcphy_rx_power_on,
+	.power_off = samsung_mipi_dcphy_rx_power_off,
+	.init = samsung_mipi_dcphy_init,
+	.exit = samsung_mipi_dcphy_exit,
+	.owner	   = THIS_MODULE,
+};
+
 static const struct regmap_config samsung_mipi_dcphy_regmap_config = {
 	.name = "dcphy",
 	.reg_bits = 32,
@@ -1529,19 +1556,42 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
 					    const struct of_phandle_args *args)
 {
 	struct samsung_mipi_dcphy *samsung = dev_get_drvdata(dev);
+	/* Device trees without the second cell describe the transmitter. */
+	u32 protocol = PHY_TYPE_DSI;
+	u32 type;
 
-	if (args->args_count != 1) {
+	if (args->args_count < 1 || args->args_count > 2) {
 		dev_err(dev, "invalid number of arguments\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (samsung->type != PHY_NONE && samsung->type != args->args[0])
-		dev_warn(dev, "phy type select %d overwriting type %d\n",
-			 args->args[0], samsung->type);
+	type = args->args[0];
+	if (type != PHY_TYPE_DPHY && type != PHY_TYPE_CPHY) {
+		dev_err(dev, "invalid phy type %u\n", type);
+		return ERR_PTR(-EINVAL);
+	}
 
-	samsung->type = args->args[0];
+	if (args->args_count == 2)
+		protocol = args->args[1];
 
-	return samsung->tx.phy;
+	if (protocol != PHY_TYPE_DSI && protocol != PHY_TYPE_CSI) {
+		dev_err(dev, "invalid protocol %u\n", protocol);
+		return ERR_PTR(-EINVAL);
+	}
+
+	/*
+	 * The TRM (section 22.1) does not support the transmitter and the
+	 * receiver running in different modes, so the mode belongs to the
+	 * block.
+	 */
+	if (samsung->type != PHY_NONE && samsung->type != type) {
+		dev_err(dev, "phy type %u conflicts with type %u already selected\n",
+			type, samsung->type);
+		return ERR_PTR(-EINVAL);
+	}
+	samsung->type = type;
+
+	return protocol == PHY_TYPE_CSI ? samsung->rx.phy : samsung->tx.phy;
 }
 
 static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
@@ -1617,6 +1667,13 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(samsung->tx.phy, samsung);
 
+	samsung->rx.phy = devm_phy_create(dev, NULL, &samsung_mipi_dcphy_rx_ops);
+	if (IS_ERR(samsung->rx.phy))
+		return dev_err_probe(dev, PTR_ERR(samsung->rx.phy),
+				     "Failed to create MIPI DC-PHY receiver\n");
+
+	phy_set_drvdata(samsung->rx.phy, samsung);
+
 	phy_provider = devm_of_phy_provider_register(dev, samsung_mipi_dcphy_xlate);
 	if (IS_ERR(phy_provider))
 		return dev_err_probe(dev, PTR_ERR(phy_provider),

-- 
2.43.0


