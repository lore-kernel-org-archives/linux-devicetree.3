Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B3A370AF8
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 16:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786035230; cv=none; b=r5QV7J3Ftv4ZxjkAasbxgj7o/VPdMOS0D/ktz1YFp5tBjWc4SP5wTCcLaCkQeBz74jpKGs02GMSJr8MM4+DcLpcN2KMRYPa2UQ3iu6oVMLw4rrTwjmqZKAWp9LsPzDaQFhaiJYZLIzjqrmxo4/1TGZptWHktcGVYt5unucgCTeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786035230; c=relaxed/simple;
	bh=FWPs4B/TJew8PcUb8f/hza5eB0wVqePy9Sz1cj9WhI0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bY2vWNS+yFMhqTr0w3t/oUwmNhjQkbyHn5H8OppzuU5sH4lyXIv2i8KE/TAsQwQKm00LL7m2/jAcG3U+OjliIY8tBzPW65dz15z/Zbl38xpcPpVk7Fk2jNI2H7FUAyBEkOUAkjleCiPI7QnfLBCBGw1YF9e8A5voLst3b7FeMcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhwLMWlg; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhwLMWlg"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-472326ca506so1642074f8f.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 09:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786035227; x=1786640027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tg5FdjePWRklsBJbX6Npe19S1RoA39DQ5iJXo4rcmgc=;
        b=RhwLMWlgH7ORMqZQwgg1qoPbHtv4ytfgxL0VNVZeB+f7ULmVw/NBVuk5kn7xK36pMD
         vvv4Mpgi19fFZROJoGaOuS/ilZI7hPOHchLniz4rrAGeu0+Ieji7BGnDPtJ4WTSKdJkv
         gOoLMgwjfWvkqIQMpQuMLDbi7s72kkBoKkrnPPosB57KHSszDxqaQZ6CKdNge+mYWLmF
         9zO4CkGRi66UgjmHHuCq6fR5TwgSklK4hGgPPscDvfP3XSpmWLgd3kN0ZJDblwa2VAzo
         ZTJjhLMwNMoh0UW7Cee/5L4BqmL+erUXK7fhA4Loz7//ofU2VlvAqPBF9uprAEY6u0wg
         rLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786035227; x=1786640027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Tg5FdjePWRklsBJbX6Npe19S1RoA39DQ5iJXo4rcmgc=;
        b=SIudqikhaRAnZNQumxEcAYsLPlqYlG82PWk2/MoAet2oHZKR4j6RuSyhQpJI83Gh/J
         neVS2vqT+rXYDxNPAJ7OkFE2EpLHbsIT05EMkDliW4aWZiD0qZFPNJoKg3jXwrWBTZAu
         ndYJ4EUaWowEAOK9+YVcDlvGLFpgHBSH6Kc1SQAB2Y4ycjqF+GyJ061MHOk22Nl+WBE+
         H8Ztfi6T635XF4c3xJh73LyP+QjwCE5fvWdKxXhWvzoU7gURAVV7aCoIOcfwZT9VSNUq
         p7SaJdNHg9yJ1GPk3o532ofFNM9LZGbYMdnPLDCJnIGTeC5D/LRh7YneGF+eHloy9+qv
         zEEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqp+deaN4MuZyFBFTJ21AYRwZ/QHIaZ1vw9+iWepoIacj5W29oCkLBOp7gHIuKG9recV2dK0gAlbCrn@vger.kernel.org
X-Gm-Message-State: AOJu0YxgezPurkziEMiPRQv/klan1Y+/uaNvcNBxkYM5URN58JrS7LIx
	2uR6wkvTGFks+noB/dyQMu8YJ8rcWP7mmfgi/GpSjWjQ2yymTZc7iH++
X-Gm-Gg: AR+sD110s7gqFt12ozFm9VbUqE6/hwpS/sko75b9CxfCM6qzwxYLOoZWo5icWCju1Xo
	i+IxOpk2lxbr3GOo2in0AKsRMBefyQ0vv7aGE6zyHZNCSSinnOZh/7YYyhQ4k/AJCEA/+mM1oxS
	Zrl/VKIkewtX18LpGa5oJgApcER/Icb47yiQQcMnOpvZfHizQnyHbleQzhWVHvnWC0yxXxz6QBD
	aNCHXNj+3gdt0kyNM4SPJWTTCPwK1MBVKYBFD7lJYyPJde+Aqo1Jd5p9IWA2omCCMVWbGuACtdw
	1VXQ6iPN3NBqNvVTEmDKghDRb3XlGZ2W51y1B84ZuMtsvnoCvVhAvp9EdfSdm++Ox3j4aNxCYa9
	1XbBqI3F3GhzzCKeECuoFDPwPUr5NAY4f/ApyjgLcjuS79DfzAU1bO1e0YxIzuFq3KjaLNGyqSx
	y3wDx2MI3Oe8hXL8lZELAw2sRlaIjMdnWtffGOdmcv7S7MiMG+l5HwsYh/hnQqn2Ju2K8vdKsU4
	JGKaSWWpxvo0iP+MHGM+pYJkCxqhmSZiuzMl0qCcvoUUgFnnpmFwg==
X-Received: by 2002:a5d:6a4e:0:b0:47f:8fc9:6eaa with SMTP id ffacd0b85a97d-47fec4edc2amr21933554f8f.8.1786035227056;
        Thu, 06 Aug 2026 09:53:47 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-42-255-151.retail.telecomitalia.it. [79.42.255.151])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47ff79a7f07sm8070586f8f.8.2026.08.06.09.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 09:53:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/2] PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581
Date: Thu,  6 Aug 2026 18:53:32 +0200
Message-ID: <20260806165334.7328-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806165334.7328-1-ansuelsmth@gmail.com>
References: <20260806165334.7328-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Airoha AN7581 SoC supports configuring the first PCIe0 lane to 2-lanes
mode (x2 link) by bonding it with the second PCIe lane (PCIe1). This is
done by configuring the PCIe MUX in the SCU register.

To correctly configure PCIe0 in x2 link, define in DT the following
additional properties:

  - additional reg, 'sec-pcie-mac' for the secondary PCIe.
  - PERSTOUT reset for both main and secondary PCIE0, called 'perstout' and
    'sec-perstout'
  - 'airoha,scu' property to correctly configure the SCU register for the
    PCIe MUX
  - 'num-lanes' set to '2' to enable PCIe0 in x2 link

In such configuration the EQ preset are configured to the same values.

To permit correct configuration of the PCIe link, additional logic is added
to assert and deassert the PERSTOUT resets. Support of these additional
reset was introduced in Airoha clk driver with commit
6712f48eb3a1 ("clk: en7523: add support for dedicated PCIe PERSTOUT reset")
and on backporting of this commit also the clk driver change will be
needed.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 106 ++++++++++++++++----
 1 file changed, 89 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index b0accd828589..c8300c47374b 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -32,6 +32,11 @@
 
 #include "../pci.h"
 
+/* AN7581 SCU register */
+#define SCU_PCIC			0x88
+#define SCU_PCIC_PCIE_CTRL		GENMASK(7, 0)
+
+/* PCIe register */
 #define PCIE_BASE_CFG_REG		0x14
 #define PCIE_BASE_CFG_SPEED		GENMASK(15, 8)
 
@@ -131,6 +136,7 @@
 #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
 
 #define MAX_NUM_PHY_RESETS		3
+#define MAX_NUM_PERSTOUT_RESETS		2
 
 #define PCIE_MTK_RESET_TIME_US		10
 
@@ -203,9 +209,11 @@ struct mtk_msi_set {
 struct mtk_gen3_pcie {
 	struct device *dev;
 	void __iomem *base;
+	void __iomem *sec_base;
 	phys_addr_t reg_base;
 	struct reset_control *mac_reset;
 	struct reset_control_bulk_data phy_resets[MAX_NUM_PHY_RESETS];
+	struct reset_control_bulk_data perstout_resets[MAX_NUM_PERSTOUT_RESETS];
 	struct phy *phy;
 	struct clk_bulk_data *clks;
 	int num_clks;
@@ -928,6 +936,14 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get PHY bulk reset\n");
 
+	pcie->perstout_resets[0].id = "perstout";
+	pcie->perstout_resets[1].id = "sec-perstout";
+
+	ret = devm_reset_control_bulk_get_optional_exclusive(dev, MAX_NUM_PERSTOUT_RESETS,
+							     pcie->perstout_resets);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get PERSTOUT bulk reset\n");
+
 	pcie->mac_reset = devm_reset_control_get_optional_exclusive(dev, "mac");
 	if (IS_ERR(pcie->mac_reset))
 		return dev_err_probe(dev, PTR_ERR(pcie->mac_reset), "failed to get MAC reset\n");
@@ -949,18 +965,38 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 			pcie->num_lanes = num_lanes;
 	}
 
+	/* Map secondary PCIe for 2-lanes mode for EN7581 */
+	if (pcie->num_lanes == 2 && device_is_compatible(dev, "airoha,en7581-pcie")) {
+		regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sec-pcie-mac");
+		if (!regs)
+			return -EINVAL;
+		pcie->sec_base = devm_ioremap_resource(dev, regs);
+		if (IS_ERR(pcie->sec_base))
+			return dev_err_probe(dev, PTR_ERR(pcie->sec_base), "failed to map secondary register base\n");
+	}
+
 	return 0;
 }
 
 static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 {
 	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
+	unsigned int num_lanes = max(1, pcie->num_lanes);
+	struct regmap *pbus_regmap, *scu;
 	struct device *dev = pcie->dev;
 	struct resource_entry *entry;
-	struct regmap *pbus_regmap;
 	u32 val, args[2], size;
 	resource_size_t addr;
-	int err;
+	int i, err;
+
+	if (num_lanes > 2)
+		return dev_err_probe(dev, -EINVAL, "unsupported num-lanes, maximum 2 lanes supported\n");
+
+	if (num_lanes == 2) {
+		scu = syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,scu");
+		if (IS_ERR(scu))
+			return dev_err_probe(dev, PTR_ERR(scu), "failed to map SCU regmap\n");
+	}
 
 	/*
 	 * The controller may have been left out of reset by the bootloader
@@ -992,6 +1028,19 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	size = lower_32_bits(resource_size(entry->res));
 	regmap_write(pbus_regmap, args[1], GENMASK(31, __fls(size)));
 
+	/* Assert PERSTOUT for all relevant lanes */
+	err = reset_control_bulk_assert(MAX_NUM_PERSTOUT_RESETS,
+					pcie->perstout_resets);
+	if (err) {
+		dev_err(dev, "failed to assert PERSTOUTs\n");
+		return err;
+	}
+
+	/* Configure SCU MUX to disable PCIE1 for x2 lanes mode */
+	if (num_lanes == 2)
+		regmap_update_bits(scu, SCU_PCIC, SCU_PCIC_PCIE_CTRL,
+				   FIELD_PREP(SCU_PCIC_PCIE_CTRL, BIT(1)));
+
 	/*
 	 * Unlike the other MediaTek Gen3 controllers, the Airoha EN7581
 	 * requires PHY initialization and power-on before PHY reset deassert.
@@ -1024,18 +1073,6 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
-	val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
-	      FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
-	      FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
-	      FIELD_PREP(PCIE_VAL_LN1_UPSTREAM, 0x41);
-	writel_relaxed(val, pcie->base + PCIE_EQ_PRESET_01_REG);
-
-	val = PCIE_K_PHYPARAM_QUERY | PCIE_K_QUERY_TIMEOUT |
-	      FIELD_PREP(PCIE_K_PRESET_TO_USE_16G, 0x80) |
-	      FIELD_PREP(PCIE_K_PRESET_TO_USE, 0x2) |
-	      FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
-	writel_relaxed(val, pcie->base + PCIE_PIPE4_PIE8_REG);
-
 	err = clk_bulk_prepare_enable(pcie->num_clks, pcie->clks);
 	if (err) {
 		dev_err(dev, "failed to prepare clock\n");
@@ -1043,14 +1080,47 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	}
 
 	/*
-	 * Airoha EN7581 performs PCIe reset via clk callbacks since it has a
-	 * hw issue with PCIE_PE_RSTB signal. Add wait for the time needed to
-	 * complete the PCIe reset.
+	 * Old Airoha EN7581 clock driver performed PCIe reset via
+	 * clk callbacks since it has a hw issue with PCIE_PE_RSTB signal.
+	 * This is now handled by dedicated PERSTOUT resets with clk
+	 * driver only enabling the refclk.
+	 *
+	 * Wait is still needed for refclk to stabilize
 	 */
 	msleep(PCIE_T_PVPERL_MS);
 
+	/* Configure all the lanes to the same EQ config */
+	for (i = 0; i < num_lanes; i++) {
+		void __iomem *base = pcie->base;
+
+		if (i == 1)
+			base = pcie->sec_base;
+
+		val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
+			FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
+			FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
+			FIELD_PREP(PCIE_VAL_LN1_UPSTREAM, 0x41);
+		writel_relaxed(val, base + PCIE_EQ_PRESET_01_REG);
+
+		val = PCIE_K_PHYPARAM_QUERY | PCIE_K_QUERY_TIMEOUT |
+			FIELD_PREP(PCIE_K_PRESET_TO_USE_16G, 0x80) |
+			FIELD_PREP(PCIE_K_PRESET_TO_USE, 0x2) |
+			FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
+		writel_relaxed(val, base + PCIE_PIPE4_PIE8_REG);
+	}
+
+	/* Deassert PERSTOUT for all relevant lanes */
+	err = reset_control_bulk_deassert(MAX_NUM_PERSTOUT_RESETS,
+					  pcie->perstout_resets);
+	if (err) {
+		dev_err(dev, "failed to deassert PERSTOUTs\n");
+		goto err_perstout_deassert;
+	}
+
 	return 0;
 
+err_perstout_deassert:
+	clk_bulk_disable_unprepare(pcie->num_clks, pcie->clks);
 err_clk_prepare_enable:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
@@ -1136,6 +1206,8 @@ static void mtk_pcie_power_down(struct mtk_gen3_pcie *pcie)
 
 	phy_power_off(pcie->phy);
 	phy_exit(pcie->phy);
+	reset_control_bulk_assert(MAX_NUM_PERSTOUT_RESETS,
+				  pcie->perstout_resets);
 	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
 				  pcie->phy_resets);
 }
-- 
2.53.0

