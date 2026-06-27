Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AC03AEB2B
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 12:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782562511; cv=none; b=VqOGOUjHjJ1bm8m0Ohru+TxwC7xejXKSfaHRx6DWFju5TKH+lcNeP6h2Gt/BZVHzqQ8WWxqfS9fIe/td31RhqoEzuqfpKR4ajABE36gIp7QkKeCYU2Hc4WBPV4xlzexelINB52RztYaIBV9rNYZZDg7lXm1a2Ms7E787Yxgat0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782562511; c=relaxed/simple;
	bh=iGJsYt/Bv9F16j2sHAuvVpyHLNtnWuUZ4tp5PqKiCTY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oXGH9lBymNUAI1UP9uaCsBdpHFF7X4pjdsm06WiTz84iKyzryXgFEeI7TQC2kEtwRHmsDA5hUNJIzNRmspUMx7zyBFmVzGz3SpOnLTg//QnDJXuydP1pR8yB/CH6pCxG6rRNKTg4Y7qYChSSctgn68H85ViFQDTzLUm/J1QTKCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPjkablV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPjkablV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so12896255e9.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 05:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782562506; x=1783167306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0HAnRoWmxVJhdNy0Aj/UApzioKy1NxiDXgx0VMIzbA=;
        b=TPjkablV//3/K6l+V+qxPzo2uCC0i2B3LRWJ8UEe7WlQBhMJuGYY+LxXTsHgiZPtrB
         xnfmWHV0/JhEYNA+E7UALsKevVYyYhhWy7/mEQwXZeUP50AzgIddKp1mMrt/Nozg1uxB
         3tbJj72kCTKVAQaJwqaaQc9cQqG8220XXd0pNQdQIrUcmEGANg1erED6/PjVRc3KPvjv
         t7Kyyz8mEGcayzFWg+xHa79ImmlUZv9YHTjbYeIJk9L35J+JuoDCkG31DaB8arN/tClo
         Ynznusmu7vy2H5FcuNvD83TO542TYgNHSQ5+1ro5XyL5zi1Wole3CptaX8r1IfqmSDYf
         Nf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782562506; x=1783167306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n0HAnRoWmxVJhdNy0Aj/UApzioKy1NxiDXgx0VMIzbA=;
        b=R1ZG05cgYMC6imjOS7iNi5jbILSP0uxHAEFRIV3Wl1y4N/pMH1q6BG5zpGQGJJGQCZ
         pgLRLOxd+tbvS3iuoWdF+r9JC03CaKi/VJvFQ+7OBAJIaZjiRSkOlDtkWjA3XWLRoioW
         PIVx7Gj4IaYjtV4tbLyrxAzxp0DnB6+iIkG1w/u8GQ+u3ozZZR7/SbtchVvRsb2EMDWs
         sPpQ7V7CZdsNkkSTGbIToHDyWPvpdQ6JtxHRz7nocffD/W3TaOoe0wT74Z3RCcUWJpnT
         iE49iEikAGQJTH5flXzjbEUYmZor8p1C0fXbXHRDS/rMJ27BCavofWjABbtJmOaekTzs
         2QJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+0+yoEvkioXbCqRKRHxsnwvU9ozknpYHdrMEbbN6Yoc0lyhneRYmnR3zIAtm5UaQKocMjDLSRgn1E1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6bjcHD9F0CVw8LFFNYl0xoxy+mokQLfwaqkkdDPTbcaw11peU
	peYJJlN9vG4C9docuFUmn+lysuJbMkWShJo5ErgZM2PEZtQklgl6Peh6
X-Gm-Gg: AfdE7ckXyUYfUd1pXD2hAbMEQUYAB16ejfiV2HI+WVwIHV8cIv6VQ44H+Ht7D+TIz7c
	7oe7ydAH8FQqfsxEdNzUHM0Sch/9Fbb+hOjR+dFz0mkLFKMdiJOP7KQlcvW+JM9Z9cm9hzX4j+c
	KmGJCH6+NTlMZ5AKHQNXVdEJI7tYUDcseyl1CCaw0TPkZBsIBErZKLCmFOaiaFY4X+fZdjEbbSQ
	X1ibtWWqJf9U8449WNRPHeZbOlpruRTjI9P6naKpk6Ap5NwWE4sBhoF9qt7ZJwPSc1xo4TV7Mxp
	c/YlDHF0N6jovu1Cra6pkuAkJ6i42ttRbibCuR0swpe/lECklFbMwJHjmefpDHbIK50pOhIKXxs
	//hskw+dNM2/TrgmfMPs2I0kzfgcIPx54BWb/NcoQbpsL2cVCW7wOGSrtOQrVxtFGGr4D/Hf6xr
	OUxFk/w6cRjtqQ6XgtPN4VIZnCbJOmtXol5fM0cUAHQti4vILVCChTS7vaA4CXiUFJiFc9MtRn
X-Received: by 2002:a05:600c:e557:20b0:490:a1dc:e542 with SMTP id 5b1f17b1804b1-49266862d71mr106741475e9.6.1782562506392;
        Sat, 27 Jun 2026 05:15:06 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-89-195.ip49.fastwebnet.it. [93.34.89.195])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49269002511sm149028265e9.8.2026.06.27.05.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 05:15:05 -0700 (PDT)
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
Subject: [PATCH v3 4/4] PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581
Date: Sat, 27 Jun 2026 14:14:45 +0200
Message-ID: <20260627121450.3529133-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627121450.3529133-1-ansuelsmth@gmail.com>
References: <20260627121450.3529133-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Airoha AN7581 SoC supports configuring the first PCIe0 lane to 2-lanes
mode (2x link) by bonding it with the second PCIe lane (PCIe1). This is
done by configuring the PCIe MUX in the SCU register.

To correctly configure PCIe0 in 2x link, define in DT the following
additional property:
- additional reg, 'sec-pcie-mac' for the secondary PCIe.
- PERSTOUT reset for both main and secondary PCIE0, called 'perstout' and
  'sec-perstout'
- airoha,scu property to correctly configure the SCU register for the PCIe
  MUX
- 'num-lanes' set to '2' to enable PCIe0 in 2x link

In such configuration the EQ preset are configured to the same values.

To permit correct configuration of the PCIe line, additional logic is added
to assert and deassert the PERSTOUT resets.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 104 ++++++++++++++++----
 1 file changed, 87 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index b0accd828589..ba28d95e5d44 100644
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

