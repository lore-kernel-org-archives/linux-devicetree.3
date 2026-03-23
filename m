Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CBE38B7DA
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261098; cv=none; b=EMQv+ecP9ddaktDhmIkW2iPqGzz34c1ZbotBlkL8y/NcUWJhObTthd84BhsZdnSQkVRqnSKFJhO1WR4Bqzfh9VNDagTsUKOk+1hCqaAlJU7B7O5CplHumFWGYLpDPFlBvEYde4W6RA9z35JvrQgsuLgXLCGIJdQxTJR+kdcakKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261098; c=relaxed/simple;
	bh=qZcnNJnjeWofkzv2Oyg4DP08CAegl5yI3o2c9CpJVWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D4uKuU0U486oXi+0CFuZ/0UG6d4iEKDIbpLDkSoMZJewnYuCrzPju0fD+GBjt1gTCn7QXwtYn4iZW0791XV+rR1h3yrP3RSUdgvewlgdHk6oRCSRXA7oM/T1ANRpRil7yFxlCMnrGJWIOQ8uVLBmL0wol5mNGaiJlrdbYTL0wqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQDte4Zd; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQDte4Zd"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-829afe24fb5so2007588b3a.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261096; x=1774865896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPbwlhrnVmSnNsmoWdfq7/dDDDS8CnPiI8sSHsNGG9s=;
        b=AQDte4ZdZ/cSMRKQgPLwIFs84Y6mvWsci/X8TpaQgCa2B58o4Dv/puRR3HhMhrr4DN
         sza3WfupmXsBNYhj42ItMNtEq+FYhl7AfQrHZiITPakDq97rbhlNPXiQaGBh4GcO4t6B
         dAKuE04Nx5eQE6l17IESu6I3A7o7pYWS9aBnCFq+n6nykqYBqHS9d+KpEIzWsaec8d63
         r9zv8UL2SFQ3GUPH2Ngvl3EgV4qvLvizpqw6RE5y/u5txSIDdnqDqj/bXq458937Zeba
         uPqPdHO/zDk57otsRyM3yrlk0kAKmu7K5fY1sRArbQoA1sPlyQC1yKeOVMpi1KgGjgtu
         6+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261096; x=1774865896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EPbwlhrnVmSnNsmoWdfq7/dDDDS8CnPiI8sSHsNGG9s=;
        b=Kf9fRa3dYo+SnqrK+F23LoCme8F2MgiN0j6vVJpKEKLhEkljlBdWfpnoO+eGDyd9um
         YktDH9lugFcsnESx/DPu1bLqly2dfD2bm1dRCwtiJ6j1JWU/OeyVWvZJLlZ2jqR/OapS
         BjoyvHCyWBVjMoJ6QMi3ua3VgRkKWKeOXCJSYWEZGJ7cjGp2HRyCM6nHhhhpSnOAYg55
         tIElMARczBuTC5nmpPvbvxxwQ+LILHTXf3vmi4Ilwpa/cW24gwWDSqCNL/IFPZDdGGo8
         6tlIqgIga3h/aQROL4BHa+EZq96C6oYLq2dA0WbExeQQloS4r6jDdNeHIDTCEJZ7fgAk
         GjDw==
X-Forwarded-Encrypted: i=1; AJvYcCUzLZyArunZztdza1yrmXqeVqEjTwpUSCQPBn0F3Zr6SLl1L8RAG6kqhk8JZ/na1io1qniLPc2W8mfa@vger.kernel.org
X-Gm-Message-State: AOJu0YwcRKQoXKpqHj6/tLigLcEZ58W0NY1+ypjc9mVpNb+EjbB6GOC0
	JGUAoo1jVmELOkMhCHfgl10dPfxDa2J1egWsfHhBhIL2PVyDXP1I1/j7
X-Gm-Gg: ATEYQzwPVCYRrygsrikIPZue6TUAKhl5IMPadrwUog20m+NAZ7Zpq5xRzCL3n5j0w8+
	EDE6bX+HbE0hHjWE6rCP2NtLVrd7fVfDsk/4nWXkcZ/vrLGxqJUuKIrbcsmtNMAKpw/s/U0htFf
	wgV4WNm/rw8p20/uQ0a/hSFN3+ARlOA3vRANgUA+GTKG/NaRZUE3x5NuN4irq0mK8J+DKCN5vj6
	9Vts+49Odq3h8ao5uPqCc/KTIvxdwXboWrpN1NBeL9bzM88NnuibZHPRx6BKzq11UN4aVRYlmbS
	AzfONROutsIf++iQk+VKEfVTM0RvjcG8+5M3RGblGbXrFFugsqkAIDonVdX+6dXCF6Zju4c1HR6
	Frejq65FsMymxeeTMCZ1ENtcrn/w6Gh8CHUuO6TfH/ARyvmjg/kU41mjidlyPS62tv6VVf+55WH
	109bJt/t4D57JmjUkXCkjQZseLyGkpOttkguhgjenne44RWH7Xqq0c0ECeZ+Y/B/HEvD0dXryl5
	tceR0VKTM7S
X-Received: by 2002:a05:6a00:21d3:b0:81a:857b:f944 with SMTP id d2e1a72fcca58-82a8c2a0946mr9629170b3a.26.1774261096384;
        Mon, 23 Mar 2026 03:18:16 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04220d9asm8630779b3a.60.2026.03.23.03.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:18:16 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v15 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
Date: Mon, 23 Mar 2026 18:17:56 +0800
Message-ID: <20260323101756.81849-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323101756.81849-1-a0987203069@gmail.com>
References: <20260323101756.81849-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac driver.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 136 ++++++++++++++++++
 3 files changed, 149 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index d3a6ab7383fc..c2cb530fd0a2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -132,6 +132,18 @@ config DWMAC_MESON
 	  the stmmac device driver. This driver is used for Meson6,
 	  Meson8, Meson8b and GXBB SoCs.
 
+config DWMAC_NUVOTON
+	tristate "Nuvoton MA35 dwmac support"
+	default ARCH_MA35
+	depends on OF && (ARCH_MA35 || COMPILE_TEST)
+	select MFD_SYSCON
+	help
+	  Support for Ethernet controller on Nuvoton MA35 series SoC.
+
+	  This selects the Nuvoton MA35 series SoC glue layer support
+	  for the stmmac device driver. The nuvoton-dwmac driver is
+	  used for MA35 series SoCs.
+
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 945c5354eced..a1cea2f57252 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_DWMAC_IPQ806X)	+= dwmac-ipq806x.o
 obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
 obj-$(CONFIG_DWMAC_MEDIATEK)	+= dwmac-mediatek.o
 obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
+obj-$(CONFIG_DWMAC_NUVOTON)	+= dwmac-nuvoton.o
 obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
 obj-$(CONFIG_DWMAC_RENESAS_GBETH) += dwmac-renesas-gbeth.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
new file mode 100644
index 000000000000..e2240b68ad98
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Nuvoton DWMAC specific glue layer
+ *
+ * Copyright (C) 2025 Nuvoton Technology Corp.
+ *
+ * Author: Joey Lu <a0987203069@gmail.com>
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/of_net.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/stmmac.h>
+
+#include "stmmac_platform.h"
+
+#define NVT_REG_SYS_GMAC0MISCR  0x108
+#define NVT_REG_SYS_GMAC1MISCR  0x10C
+
+#define NVT_MISCR_RMII          BIT(0)
+
+/* Two thousand picoseconds are evenly mapped to a 4-bit field,
+ * resulting in each step being 2000/15 picoseconds.
+ */
+#define NVT_PATH_DELAY_STEP     134
+#define NVT_TX_DELAY_MASK       GENMASK(19, 16)
+#define NVT_RX_DELAY_MASK       GENMASK(23, 20)
+
+struct nvt_priv_data {
+	struct device *dev;
+	struct regmap *regmap;
+	u32 macid;
+};
+
+static int nvt_gmac_get_delay(struct device *dev, const char *property)
+{
+	u32 arg;
+
+	if (of_property_read_u32(dev->of_node, property, &arg))
+		return 0;
+
+	if (arg > 2000)
+		return -EINVAL;
+
+	if (arg == 2000)
+		return 15;
+
+	return arg / NVT_PATH_DELAY_STEP;
+}
+
+static int nvt_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
+{
+	struct nvt_priv_data *priv = bsp_priv;
+	u32 reg, val;
+	int ret;
+
+	if (phy_intf_sel == PHY_INTF_SEL_RGMII) {
+		ret = nvt_gmac_get_delay(priv->dev, "rx-internal-delay-ps");
+		if (ret < 0)
+			return ret;
+		val = FIELD_PREP(NVT_RX_DELAY_MASK, ret);
+
+		ret = nvt_gmac_get_delay(priv->dev, "tx-internal-delay-ps");
+		if (ret < 0)
+			return ret;
+		val |= FIELD_PREP(NVT_TX_DELAY_MASK, ret);
+	} else if (phy_intf_sel == PHY_INTF_SEL_RMII) {
+		val = NVT_MISCR_RMII;
+	} else {
+		return -EINVAL;
+	}
+
+	reg = (priv->macid == 0) ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR;
+	regmap_update_bits(priv->regmap, reg,
+			   NVT_RX_DELAY_MASK | NVT_TX_DELAY_MASK | NVT_MISCR_RMII, val);
+
+	return 0;
+}
+
+static int nvt_gmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
+	struct nvt_priv_data *priv;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get platform resources\n");
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return dev_err_probe(dev, PTR_ERR(plat_dat), "Failed to get platform data\n");
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return dev_err_probe(dev, -ENOMEM, "Failed to allocate private data\n");
+
+	priv->regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys",
+							    1, &priv->macid);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to get sys register\n");
+
+	if (priv->macid > 1)
+		return dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
+
+	plat_dat->bsp_priv = priv;
+	plat_dat->set_phy_intf_sel = nvt_set_phy_intf_sel;
+
+	return stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
+}
+
+static const struct of_device_id nvt_dwmac_match[] = {
+	{ .compatible = "nuvoton,ma35d1-dwmac"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nvt_dwmac_match);
+
+static struct platform_driver nvt_dwmac_driver = {
+	.probe  = nvt_gmac_probe,
+	.remove = stmmac_pltfr_remove,
+	.driver = {
+		.name           = "nuvoton-dwmac",
+		.pm		= &stmmac_pltfr_pm_ops,
+		.of_match_table = nvt_dwmac_match,
+	},
+};
+module_platform_driver(nvt_dwmac_driver);
+
+MODULE_AUTHOR("Joey Lu <a0987203069@gmail.com>");
+MODULE_DESCRIPTION("Nuvoton DWMAC specific glue layer");
+MODULE_LICENSE("GPL");
-- 
2.43.0

