Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7793B3E9C3A
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782465655; cv=none; b=S+rekCz5bfnXpekJMlq450ragicoQj6uwgNJ3wJRB2W0EI5Jlz9bYAGeX+yfEH/uk0RACjD0tWYsCKj4suT1h4Bl3EKDRSWbDEpQQTqUnfP6ICNDLCTtvOaSiZvDJTmFFuAvTLDZ8tpdrtfnjTRBL4r3uVnHgKbwqcxnVzt6iag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782465655; c=relaxed/simple;
	bh=dgvt/w8zrnFna7HVbfdxHjX7SUvNNqTUEI2NGloZhZU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZLZzDlQsyRcOACJJGjPFG30aMAbAVBdvTIkmYTs5fb0TtATy8B8DSTIJeaDIvM7EZa9+oNUZA2li2ijzy/vMkyMUt6SYJROTHht0mgU8qceMqXzFCWhvD76RWNqxOyBS2CHWLYo8Cnut4xy4ocshJ4ewMW1AQMC2JCDz9//6nbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3x6HQ4V; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3x6HQ4V"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-46dc0d0eb2aso490197f8f.1
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782465649; x=1783070449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3/Tou2Y2bkgqurZkBs8ONUNyfbAU/Y1H2i6z9bjz4A=;
        b=a3x6HQ4Vkn3i7/wPYw4XgjuDMhrfCcZeiLx45LHlmaVlrWaX0/EEDFUn644rKHD5y/
         ekOxKG25MDlQwlZFAiG/xTaXeJ2yKZTP6wxHQJhGKau7Eo8ekMedMdRUZsKmDjhkYL3K
         ghgjaM7iSglH+wu8VpoG9f1ufZziI4B9LcXZOHfc/s9+6l91cMl0fBXoqjAZbUW2e9R6
         KmiJ77g0+gmolWa/L5mqgwm8+ZdlY9KZdQLwdtWvb/HyIAYGUeCUUfklFJXOyktv9RFE
         D/g/I3N/3hBRSEb38ClvyxOzbZZV8AN/yGBh9M/srcE8z83mgppR6lLmCz37rnXBR2D0
         kUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465649; x=1783070449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d3/Tou2Y2bkgqurZkBs8ONUNyfbAU/Y1H2i6z9bjz4A=;
        b=sCoXVbs8e54FEfCZEvDwUWwlEQi1w81gwV5Rq6TSkiOJj5EF0zk2ZzUW89aj4j7K1d
         ZLNLb0TPCJCr0skqJaYkfBE7164b0gK3amDylfdRA6qVcyWHSbK4Cx3FKFAttAAbctF3
         5ILA8DxS72YpfE+/aDrIhfHdf/NyK5F9lr+ZeZk/Y71fWywV78jgJA+aPLkPOmrpEPLN
         0MUrRNT9nokfg9dbeDARrkIqEQIr/ZWeCFkOJZCNuTQO5V63XOQsAQHfwj9KJeYvCCoC
         sdJmyb3x+nwFr3G03V170C8aaIFxGQ2+JwX0k9zqRkjzGGwzGrbTsLyJK1WirCVt3LLu
         5GvQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYWQjWjYz9vHz6ZwXSr9SKJx4RJLxH+apkdQ7z3I0DlLPi4YD2q4s7/+q4ahi+PWKHmrMSvCUw5nYE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs8ibK1gCLBLygk+aDL9LCUh8ee4Hiss/pcxKPTn3n0utxq19S
	VgFJCOw6z9EmIrhs/b+kKI8Ybcz93r+3qKFmWRNWzJbjqw+WDWlla3tC
X-Gm-Gg: AfdE7cmHe31mT1ywl+RDN1QcxCX2Km42iNOee5iBmV+d3NhzdK7Yz0f/OY7WOgebiTQ
	tuElIAsn+N+6xKsv8xUyeH3fZWJnYWlTiYdA/UB+inlqV7iHyuIFp686DCOJlqyketJSFzLYgE1
	snb70BMrhiuEN9Q/N/2VlSvlZXJjRrBw3GTE2ojAIfzQaTdrDuxeraYSskiZdAvPZP7PBbHzHO3
	zAlR0jGWYaYz/Omvh+h5ngc8F/0qgk+IJcmqNQkzY/qpQTsT5qtgQsO+5WBsFYxZ/rNY6zx8Kvg
	XxUJabQxDUhThpR97Iq4B2RRHPu7+IbgWeeOedktEP486Ewa9fTKbxltorrKl4C1dWytmS3pYPd
	b3N5dCEd0JjZHFAjpGheZ9A0jKYe0uOLQDdp7/JBfYPaWR+9w2qUG/9maSvZe7er7Zh6Bos7MJG
	WL/cqud2BZU+OKH0b4y2dc/k1tvA5WnAXB5PzJVwd5hhLTzqVwFQYOzQpmIUY9ON9XJ9yTgcyPM
	lXQc2narBp/
X-Received: by 2002:a05:6000:454a:b0:46d:d5f9:d170 with SMTP id ffacd0b85a97d-46dd5f9d3a6mr6557284f8f.46.1782465649353;
        Fri, 26 Jun 2026 02:20:49 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-46e6167c05fsm9094388f8f.25.2026.06.26.02.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:20:48 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581
Date: Fri, 26 Jun 2026 11:20:28 +0200
Message-ID: <20260626092029.3525264-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260626092029.3525264-1-ansuelsmth@gmail.com>
References: <20260626092029.3525264-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Airoha AN7581 SoC supports configuring the first PCIe0 line to 2-lanes
mode by bonding it with the second PCIe line. This is done by configuring
the PCIe MUX in the SCU register.

To correctly configure the line for 2-lanes mode, it's required to define
in DT an additional reg, 'sec-pcie-mac' for the secondary PCIe.
It's also needed to define the additional reset and the PERSTOUT reset.
Also 'airoha,scu' property is mandatory to correctly configure the SCU
register for the PCIe MUX.

Finally to toggle 2-lanes mode, it's needed to define in DT 'num-lanes' as
2.

In such configuration the EQ preset are configured to the same values.

To permit correct configuration of the PCIe line, additional logic is added
to assert and deassert the PERSTOUT resets.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 101 ++++++++++++++++----
 1 file changed, 82 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index b0accd828589..14893cff135a 100644
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
+	if (num_lanes == 2 && device_is_compatible(dev, "airoha,en7581-pcie")) {
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
 
+	/* Assert PERSTOUT for all relevant lines */
+	err = reset_control_bulk_assert(MAX_NUM_PERSTOUT_RESETS,
+					pcie->perstout_resets);
+	if (err) {
+		dev_err(dev, "failed to assert PERSTOUTs\n");
+		return err;
+	}
+
+	/* Configure SCU MUX to disable PCIE1 for 2 lines mode */
+	if (num_lanes == 2)
+		regmap_update_bits(scu, SCU_PCIC, SCU_PCIC_PCIE_CTRL,
+				   FIELD_PREP(SCU_PCIC_PCIE_CTRL, BIT(1)));
+
 	/*
 	 * Unlike the other MediaTek Gen3 controllers, the Airoha EN7581
 	 * requires PHY initialization and power-on before PHY reset deassert.
@@ -1024,33 +1073,47 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
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
 		goto err_clk_prepare_enable;
 	}
 
-	/*
-	 * Airoha EN7581 performs PCIe reset via clk callbacks since it has a
-	 * hw issue with PCIE_PE_RSTB signal. Add wait for the time needed to
-	 * complete the PCIe reset.
-	 */
+	/* Wait for refclk to stabilize */
 	msleep(PCIE_T_PVPERL_MS);
 
+	/* Configure all the lines to the same EQ config */
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
+	/* Deassert PERSTOUT for all relevant lines */
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
-- 
2.53.0

