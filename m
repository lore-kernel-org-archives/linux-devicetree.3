Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B434368D4B
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377823; cv=none; b=EMHuto/eZyl0wJFZ+rH/8vOLMhgZmEWLBWm2Yhd5M49DJkxVs9ljkjXRbbIEaVHs2f7B8ungG4efTyR/6V2tdLg0/0Shyw1NcF8tqxYfASNXTbJFpbuA9HQfhOeyiF8LkZs39QKPk4mTQ5bfsd+w/zlEl9lDb3G1DaUflB1t8r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377823; c=relaxed/simple;
	bh=AUrwy4VG7i1vxV+aY9+U6sgvejCDhS730W8Tn29xvzc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wb+CyR4BVPRv6E1jQK1gVKNN1c6ZlJmCSCNB5wK6LaJQV61uzKrKwOy1o5iJcT7QWrdv4owF2qyG2tVUW357KroXaLnTOL0L+HBEuIt1xmUDPcAxx8l1QgEEwNBn3I4cb+1Jtfs0Vkf4cEyBiuI/1vYS1kmZbymCJLadrxlUtl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyGeN33L; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyGeN33L"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso34101065e9.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779377820; x=1779982620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xW4ciKbbQRnX/OjD6z0+5b7UCtG5NvYvPMF/2Ve0g6c=;
        b=IyGeN33LJ3fSeS8SqlZZjHOtiZl0A5VJE1R6LGqR3lSECfaoj76IO1dsom5i1EWxzp
         kRK9ipaK5EcgiL1vsNK+SxOItRQHzLDwdH5FgZmu7QJ3Ve02OYMhDFuAZ73hWi8egaZq
         sWZ9uhZyaY66EhYYo8js0/UEoqocAoBeyh0tIRozdjSXl+kFSTjbYHVLg7X/rxssuoiA
         dnuiLjGuPUVhOjYTqVs5BDHlSv9KW+wgEXaCn5Z5v/RJTSqvo2cKtFNbGNzFbajEXatH
         bvXuDdEeCdSZCzqJ5DYpZLZGbqp5cHMg8e5RLierJPkgoNTEtFx7f4X7uJz3XWYZmiZ9
         z22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377820; x=1779982620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xW4ciKbbQRnX/OjD6z0+5b7UCtG5NvYvPMF/2Ve0g6c=;
        b=UAGn4piKNJKC7y/eJuHTrdoTlTbwonwpFxIFmG84/LxPLkD3Nppyfa3bWPdCDmAkCT
         Jh7ceO0d97kfZAiZb+hHkKqGwtN7LkQeFU1mr+gzhZt5NBENzoxnVahl+mZATzkWiKNG
         xln8LlakRKKnCHtH5qOlSsqn2TvxpSfhTv7WM2AeMVbE6PuEBBB87agyMCOvHcBPherR
         NqENO7LS3Le6pMRBkySs0khXyOtQIrJqsRGq/Dj4zFIEwMGYoeSKKDMDDyzRgInaOuNJ
         DRo65DXq4w938UO5YyxCRFIyC3l1dXH4LxttsWAgoHFYbL9Dihb17/65hU4cpM0pMaRm
         UuXg==
X-Forwarded-Encrypted: i=1; AFNElJ+XhgQg+UVn1vhLhk7cGhzDU/OPsEHyCmeFexlzGuMJWvujcJNKC2EdakgnjrYJ5eSmovrIVZaTs92i@vger.kernel.org
X-Gm-Message-State: AOJu0YzwKQmjKI8NLyVefSIb8nUwngNdvd+lKsWk0s1CqmTIt/EDs4k/
	zY275Fj+9OJUGiAx4pVdAL0mZ9ellwkNF8H9kNdn4gHWW7gSZ1dToGcM
X-Gm-Gg: Acq92OFqWAGDQN2S5SPv13prq/wjYgF7F23fU3EifkZWSn1dT9891qHBX+u4ORJrUJa
	xWeQOknPXlvo0zCATXI0dfaAVg8xqIko4etwx60PR1FcRr5NSRRq0gVfgHoiP4hdJG1+P8wrRNZ
	18F+NXDn/CT9Lqa65ZzXKZh6PsqKLI5X/AZOmdQ71yeL+TnB74RmHiNmsRB2oDeAaRphDZGsD49
	h4Cn+tgT5in4nm0bq21QAb4/n5Wl2bgG4EohcafqF5WUkglSfytXR67uy3I1Aq3R5abQnj/C+RR
	GcGILgvtScqD7S8EbR2s9oFli2/tTsQ0KxL/sMB1cLQgFCMmYOoYrXw5JAHvF6XY/OoDOKx7MOM
	R4WXsWE/8mv1fFpQYqF4N2wEoP0D5H4QXWKZmd8lLmctMoJx1zcJfJciIL2Z3nZQKYpIKkYCXqV
	i1xvD2QJ1URjBcO5IHIU+fBFBOUcJK3FAoWC8YBT3XSa0fJoHIrEEzfIxl988xVQA=
X-Received: by 2002:a05:600c:49a2:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-4903608937bmr31486225e9.20.1779377820234;
        Thu, 21 May 2026 08:37:00 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49033d9edcbsm79159825e9.13.2026.05.21.08.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:36:58 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v9 3/5] clk: en7523: Add support for selecting the Serdes port in SCU
Date: Thu, 21 May 2026 17:35:54 +0200
Message-ID: <20260521153645.7028-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521153645.7028-1-ansuelsmth@gmail.com>
References: <20260521153645.7028-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the SCU register for clock and reset, there are also some register to
select the Serdes port mode. The Airoha AN7581 SoC have 4 different Serdes
that can switch between PCIe, USB or Ethernet mode.

Add a simple PHY provider that expose the .set_mode OP to toggle the
requested mode for the Serdes port.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/Kconfig      |   1 +
 drivers/clk/clk-en7523.c | 218 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 216 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index b2efbe9f6acb..e60a824b5117 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -221,6 +221,7 @@ config COMMON_CLK_EN7523
 	bool "Clock driver for Airoha/EcoNet SoC system clocks"
 	depends on OF
 	depends on ARCH_AIROHA || ECONET || COMPILE_TEST
+	select GENERIC_PHY
 	default ARCH_AIROHA
 	help
 	  This driver provides the fixed clocks and gates present on Airoha
diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 1ab0e2eca5d3..183cf7fe4bda 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -6,14 +6,18 @@
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
+#include <linux/spinlock.h>
 #include <dt-bindings/clock/en7523-clk.h>
 #include <dt-bindings/reset/airoha,en7523-reset.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
 #include <dt-bindings/clock/econet,en751221-scu.h>
 #include <dt-bindings/reset/econet,en751221-scu.h>
+#include <dt-bindings/soc/airoha,scu-ssr.h>
 
 #define RST_NR_PER_BANK			32
 
@@ -40,9 +44,22 @@
 #define   REG_HIR_MASK			GENMASK(31, 16)
 /* EN7581 */
 #define REG_NP_SCU_PCIC			0x88
+#define REG_NP_SCU_SSR3			0x94
+#define REG_SSUSB_HSGMII_SEL_MASK	BIT(29)
+#define REG_SSUSB_HSGMII_SEL_HSGMII	FIELD_PREP_CONST(REG_SSUSB_HSGMII_SEL_MASK, 0x0)
+#define REG_SSUSB_HSGMII_SEL_USB	FIELD_PREP_CONST(REG_SSUSB_HSGMII_SEL_MASK, 0x1)
 #define REG_NP_SCU_SSTR			0x9c
 #define REG_PCIE_XSI0_SEL_MASK		GENMASK(14, 13)
+#define REG_PCIE_XSI0_SEL_PCIE		FIELD_PREP_CONST(REG_PCIE_XSI0_SEL_MASK, 0x0)
+#define REG_PCIE_XSI0_SEL_XFI		FIELD_PREP_CONST(REG_PCIE_XSI0_SEL_MASK, 0x1)
+#define REG_PCIE_XSI0_SEL_HSGMII	FIELD_PREP_CONST(REG_PCIE_XSI0_SEL_MASK, 0x2)
 #define REG_PCIE_XSI1_SEL_MASK		GENMASK(12, 11)
+#define REG_PCIE_XSI1_SEL_PCIE		FIELD_PREP_CONST(REG_PCIE_XSI1_SEL_MASK, 0x0)
+#define REG_PCIE_XSI1_SEL_XFI		FIELD_PREP_CONST(REG_PCIE_XSI1_SEL_MASK, 0x1)
+#define REG_PCIE_XSI1_SEL_HSGMII	FIELD_PREP_CONST(REG_PCIE_XSI1_SEL_MASK, 0x2)
+#define REG_USB_PCIE_SEL_MASK		BIT(3)
+#define REG_USB_PCIE_SEL_PCIE		FIELD_PREP_CONST(REG_USB_PCIE_SEL_MASK, 0x0)
+#define REG_USB_PCIE_SEL_USB		FIELD_PREP_CONST(REG_USB_PCIE_SEL_MASK, 0x1)
 #define REG_CRYPTO_CLKSRC2		0x20c
 /* EN751221 */
 #define EN751221_REG_SPI_DIV		0x0cc
@@ -81,6 +98,8 @@ enum en_hir {
 	HIR_MAX		= 14,
 };
 
+#define EN_SERDES_PHY_NUM		4
+
 struct en_clk_desc {
 	int id;
 	const char *name;
@@ -113,6 +132,18 @@ struct en_rst_data {
 	struct reset_controller_dev rcdev;
 };
 
+struct en_serdes_phy_instance {
+	struct phy *phy;
+	unsigned int serdes_port;
+};
+
+struct en_clk_priv {
+	void __iomem *base;
+	/* protect SCU register */
+	spinlock_t lock;
+	struct en_serdes_phy_instance *serdes_phys[EN_SERDES_PHY_NUM];
+};
+
 struct en_clk_soc_data {
 	u32 num_clocks;
 	const struct clk_ops pcie_ops;
@@ -830,12 +861,179 @@ static int en7581_reset_register(struct device *dev, void __iomem *base,
 	return devm_reset_controller_register(dev, &rst_data->rcdev);
 }
 
+static int en7581_serdes_phy_set_mode(struct phy *phy, enum phy_mode mode,
+				      int submode)
+{
+	struct en_serdes_phy_instance *instance = phy_get_drvdata(phy);
+	struct en_clk_priv *priv = dev_get_drvdata(phy->dev.parent);
+	u32 reg, mask, sel, val;
+	unsigned long flags;
+
+	switch (instance->serdes_port) {
+	case AIROHA_SCU_SERDES_PCIE1:
+		reg = REG_NP_SCU_SSTR;
+		mask = REG_PCIE_XSI0_SEL_MASK;
+
+		if (mode != PHY_MODE_ETHERNET && mode != PHY_MODE_PCIE)
+			return -EINVAL;
+
+		if (mode == PHY_MODE_ETHERNET) {
+			switch (submode) {
+			case PHY_INTERFACE_MODE_USXGMII:
+			case PHY_INTERFACE_MODE_10GBASER:
+				sel = REG_PCIE_XSI0_SEL_XFI;
+				break;
+			case PHY_INTERFACE_MODE_SGMII:
+			case PHY_INTERFACE_MODE_1000BASEX:
+			case PHY_INTERFACE_MODE_2500BASEX:
+				sel = REG_PCIE_XSI0_SEL_HSGMII;
+				break;
+			default:
+				return -EINVAL;
+			}
+		} else {
+			sel = REG_PCIE_XSI0_SEL_PCIE;
+		}
+
+		break;
+	case AIROHA_SCU_SERDES_PCIE2:
+		reg = REG_NP_SCU_SSTR;
+		mask = REG_PCIE_XSI1_SEL_MASK;
+
+		if (mode != PHY_MODE_ETHERNET && mode != PHY_MODE_PCIE)
+			return -EINVAL;
+
+		if (mode == PHY_MODE_ETHERNET) {
+			switch (submode) {
+			case PHY_INTERFACE_MODE_USXGMII:
+			case PHY_INTERFACE_MODE_10GBASER:
+				sel = REG_PCIE_XSI1_SEL_XFI;
+				break;
+			case PHY_INTERFACE_MODE_SGMII:
+			case PHY_INTERFACE_MODE_1000BASEX:
+			case PHY_INTERFACE_MODE_2500BASEX:
+				sel = REG_PCIE_XSI1_SEL_HSGMII;
+				break;
+			default:
+				return -EINVAL;
+			}
+		} else {
+			sel = REG_PCIE_XSI1_SEL_PCIE;
+		}
+
+		break;
+	case AIROHA_SCU_SERDES_USB1:
+		reg = REG_NP_SCU_SSR3;
+		mask = REG_SSUSB_HSGMII_SEL_MASK;
+
+		if (mode != PHY_MODE_ETHERNET && mode != PHY_MODE_USB_DEVICE &&
+		    mode != PHY_MODE_USB_DEVICE_SS)
+			return -EINVAL;
+
+		if (mode == PHY_MODE_ETHERNET)
+			sel = REG_SSUSB_HSGMII_SEL_HSGMII;
+		else
+			sel = REG_SSUSB_HSGMII_SEL_USB;
+
+		break;
+	case AIROHA_SCU_SERDES_USB2:
+		reg = REG_NP_SCU_SSTR;
+		mask = REG_USB_PCIE_SEL_MASK;
+
+		if (mode != PHY_MODE_PCIE && mode != PHY_MODE_USB_DEVICE &&
+		    mode != PHY_MODE_USB_DEVICE_SS)
+			return -EINVAL;
+
+		if (mode == PHY_MODE_PCIE)
+			sel = REG_USB_PCIE_SEL_PCIE;
+		else
+			sel = REG_USB_PCIE_SEL_USB;
+
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(priv->base + reg);
+	val &= ~mask;
+	val |= sel;
+	writel(val, priv->base + reg);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static const struct phy_ops en7581_serdes_phy_ops = {
+	.set_mode	= en7581_serdes_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static struct phy *en7581_serdes_phy_xlate(struct device *dev,
+					   const struct of_phandle_args *args)
+{
+	struct en_clk_priv *priv = dev_get_drvdata(dev);
+	struct en_serdes_phy_instance *instance;
+	unsigned int serdes_port;
+
+	if (args->args_count != 1) {
+		dev_err(dev, "invalid number of cells in 'phy' property\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	serdes_port = args->args[0];
+	if (serdes_port >= EN_SERDES_PHY_NUM) {
+		dev_err(dev, "invalid serdes port: %d\n", serdes_port);
+		return ERR_PTR(-EINVAL);
+	}
+
+	instance = priv->serdes_phys[serdes_port];
+	if (!instance) {
+		dev_err(dev, "failed to find appropriate serdes phy\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	return instance->phy;
+}
+
+static int en7581_serdes_phy_register(struct device *dev)
+{
+	struct en_clk_priv *priv = dev_get_drvdata(dev);
+	struct phy_provider *phy_provider;
+	int i;
+
+	for (i = 0; i < EN_SERDES_PHY_NUM; i++) {
+		struct en_serdes_phy_instance *instance;
+
+		instance = devm_kzalloc(dev, sizeof(*instance),
+					GFP_KERNEL);
+		if (!instance)
+			return -ENOMEM;
+
+		instance->phy = devm_phy_create(dev, NULL,
+						&en7581_serdes_phy_ops);
+		if (IS_ERR(instance->phy))
+			return dev_err_probe(dev, PTR_ERR(instance->phy), "failed to create phy\n");
+
+		instance->serdes_port = i;
+		priv->serdes_phys[i] = instance;
+
+		phy_set_drvdata(instance->phy, instance);
+	}
+
+	phy_provider = devm_of_phy_provider_register(dev, en7581_serdes_phy_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
 static int en7581_clk_hw_init(struct platform_device *pdev,
 			      struct clk_hw_onecell_data *clk_data)
 {
+	struct en_clk_priv *priv = platform_get_drvdata(pdev);
 	struct regmap *map;
 	void __iomem *base;
 	u32 val;
+	int ret;
 
 	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
 	if (IS_ERR(map))
@@ -845,6 +1043,8 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	priv->base = base;
+
 	en7581_register_clocks(&pdev->dev, clk_data, map, base);
 
 	val = readl(base + REG_NP_SCU_SSTR);
@@ -853,9 +1053,12 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	val = readl(base + REG_NP_SCU_PCIC);
 	writel(val | 3, base + REG_NP_SCU_PCIC);
 
-	return en7581_reset_register(&pdev->dev, base, en7581_rst_map,
-				     ARRAY_SIZE(en7581_rst_map),
-				     en7581_rst_ofs);
+	ret = en7581_reset_register(&pdev->dev, base, en7581_rst_map,
+				    ARRAY_SIZE(en7581_rst_map), en7581_rst_ofs);
+	if (ret)
+		return ret;
+
+	return en7581_serdes_phy_register(&pdev->dev);
 }
 
 static enum en_hir get_hw_id(void __iomem *np_base)
@@ -962,16 +1165,25 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	const struct en_clk_soc_data *soc_data;
 	struct clk_hw_onecell_data *clk_data;
+	struct en_clk_priv *priv;
 	int r;
 
 	soc_data = device_get_match_data(&pdev->dev);
 
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->lock);
+
 	clk_data = devm_kzalloc(&pdev->dev,
 				struct_size(clk_data, hws, soc_data->num_clocks),
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, priv);
+
 	clk_data->num = soc_data->num_clocks;
 	r = soc_data->hw_init(pdev, clk_data);
 	if (r)
-- 
2.53.0

