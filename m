Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC75478E57
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 11:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780414; cv=none; b=k8pWLS8wqzqd/Sv+JsbMe0fphotGxXl9ctpyH2nKUlGAXwWOiijOj5ZO0BlTJbiQbJGu8/sHN1lum+0cT+FA3RnaHTbe892ZAR2LtJ3KWkTQkL8Zo9UN9Dw07T4f+8Xa2miYnuwkH8/x5jJf0MPJAwx5sAxxwVHYHj6ML/vAz+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780414; c=relaxed/simple;
	bh=6xPsWRUPeleJLK8WJ2QWq0vWWv1E8zE0psVdoiyxOqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3OF68yuK+ktmJmzOvW+ahsBMTNlXOdAifn4WepXofmaW5xgD2MskJFpq4Pw5bQqX+CLLuXQMYNxpGM7/l7ZREmyD0pwxhJvXba+RiQru3Lq9UMtXbbsjP+evcdYzHNPI4aU6XdWScNLHUeCc+H2c5+IgAkZg+ya3I5JA85iNwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArUfWelN; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArUfWelN"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so26317695ad.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 04:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780412; x=1789385212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/VmjijarNN4xgegaOIIjybmiUp5b9EVo/zWnU+ss9Bo=;
        b=ArUfWelNAwpel3U0GHpNXZ1SMXSs1FQcjtrUvTZd4xecIjVn4dH8ToDzt/3vtyI87y
         Ksxt2M72ohtJBt5CbDi7wHbyFa/kQnvMpykOkgCwcdPWZXSEmHanK15L6X7DOdoxRJL9
         vmpeB0TvpXbKs+P1jMfXZR4KSb3EhbP2UnjwzwlIQ7iZHjgb+0a3E0NefibgU+BkkqI+
         C3B7/4HxEVXbnEkm1Nvyl92XRKAbmXKMCR4QQAe7z0z9QT758rkvKzLvm+TgcRIUZELp
         57rrC8iAyW7dkfBGG7vWl0kODD2EjgUCVcJhBeX+jPEHNJZ3s2kDKSx9WOB/wFVwsnOi
         T25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780412; x=1789385212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/VmjijarNN4xgegaOIIjybmiUp5b9EVo/zWnU+ss9Bo=;
        b=hbWkT8VYrXtvr7zThHJ0oB3+40J5CA+MlxYvD50eCP6cD7Kz0bzKXUYMS84TPuJr9+
         NWrBwcapJ97e1D2wYUAcwJuEePQXr7vtAkdr5TsCVLFbZFOVaAT8B3RH/HCDn1lVNLtt
         0v7RZtq8TDJDxuVwpDPl4lO/C1RrVlSU4m4MTAu2ZOm5ei04X/Wyi+HhT/IFR/r+iWQR
         zrHwSuTruZYOAG3MNgEotenWSlGBKMaf3QtCAWd8Pft3kaFQQ1y5v2jWFBDBkJjRu3FG
         wu8XCTm2B8RXaEY3vQFchtZM8c+/l0BIjHl4IfZLgYg75wWmbazAXYD8l3Ziff2rGVUR
         r2Rw==
X-Forwarded-Encrypted: i=1; AKwUvByblmQtvECBd7gNC4TD6Bp+bQCDo7uGt6WFGg5uX6yYn8XLHguTWGuVDOjuAN+oTzFTyFO2kG2cODUT@vger.kernel.org
X-Gm-Message-State: AFuF++kDnjIHiegwpVwfgnMgJMdT3HyDCf+Layn1pWY9zaMqInDBT2+N
	j05Jvvpem4UZJICKgKVSSv3pvnGUxWueic3AHFC+V3xhGmABn6BbkFCX
X-Gm-Gg: AYBFou3YPlO55Q4pjv4DVsZq0Tiqs0dv2rK/RW9p3Wnr3cCTkuLgaSjv0gt9HzAVALE
	OaXvCYhukskjbkjCa3n0bGLfa29wvfJrG89jzUiksnlXc3qutmcPK82zc244v9NmjP8YJ7F0YKR
	HFRW66iGDd3O3kmqdUQSZZMDVtZCTtCSN4X9L1Q2aIxgNpVXSCe6SAuHxRxiGFugtR3YneY0fBb
	t7BCj0ymshHNBKI+u+KUigR4kID3+7re4vhR2oGHex77SdZfKDSoze4gDE9iR7PHkwDTUhIglV5
	El16tvIwD1EeVeoSfYB6GrTH0ANk48U20bnEglOMF8GBw4b9XKv1yfBMjQDj8HoqNZJCknNnrY8
	l125gW3tps+sNpXO3YS+Sa2h1tTYOSSbjQotAiCmRxVvGTxuN6Xo2ZH1ZniW3WNR4IyLPPFAslk
	yjbrnnvmZBoudxgPAPAXzj1o4Q5rxg9smfM+eZ
X-Received: by 2002:a17:902:e951:b0:2d8:d4ce:7e3b with SMTP id d9443c01a7336-2db126289bbmr311560445ad.16.1788780412378;
        Mon, 07 Sep 2026 04:26:52 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1982c63fsm41788675ad.42.2026.09.07.04.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:26:52 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support
Date: Mon,  7 Sep 2026 19:26:05 +0800
Message-ID: <20260907112606.465778-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907112606.465778-1-inochiama@gmail.com>
References: <20260907112606.465778-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe controller on Spacemit K3 is almost a standard Synopsys
DesignWare PCIe IP with extra link and reset control. Unlike
the PCIe controller on K1, this controller supports external MSI
interrupt controller and can use multiple PHYs at the same time.

Add driver to support PCIe controller on Spacemit K3 PCIe.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 132 ++++++++++++++++++
 2 files changed, 134 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index dcfbe7e229fd..f9c27165260e 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -443,7 +443,7 @@ config PCIE_SOPHGO_DW
 	  Sophgo SoCs.
 
 config PCIE_SPACEMIT_K1
-	tristate "SpacemiT K1 PCIe controller (host mode)"
+	tristate "SpacemiT PCIe controller (host mode)"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on HAS_IOMEM
 	select PCIE_DW_HOST
@@ -451,7 +451,7 @@ config PCIE_SPACEMIT_K1
 	default ARCH_SPACEMIT
 	help
 	  Enables support for the DesignWare based PCIe controller in
-	  the SpacemiT K1 SoC operating in host mode.  Three controllers
+	  the SpacemiT SoC operating in host mode. Three controllers
 	  are available on the K1 SoC; the first of these shares a PHY
 	  with a USB 3.0 host controller (one or the other can be used).
 
diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index c610b367412a..5031b688fdab 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -28,8 +28,18 @@
 #define SMLH_LINK_UP			BIT(1)
 #define RDLH_LINK_UP			BIT(12)
 
+#define INTR_STATUS				0x0010
+
 #define INTR_ENABLE				0x0014
 #define MSI_CTRL_INT			BIT(11)
+#define RDLH_LINK_UP_INT		BIT(20)
+
+#define K3_PHY_AHB_IRQSTATUS_INTX		0x0008
+
+#define K3_ADDR_INTR_STATUS1			0x0018
+
+#define K3_CACHE_MSTR_AWCACHE_MODE	GENMASK(14, 11)
+#define K3_CACHE_MSTR_AWCACHE_BEHAVIOR	0xf
 
 /* Some controls require APMU regmap access */
 #define SYSCON_APMU			"spacemit,apmu"
@@ -44,6 +54,9 @@
 
 #define PCIE_CONTROL_LOGIC			0x0004
 #define PCIE_SOFT_RESET			BIT(0)
+#define PCIE_PERSTN_OE			BIT(24)
+#define PCIE_PERSTN_OUT			BIT(25)
+#define PCIE_IGNORE_PERSTN		BIT(31)
 
 struct k1_pcie;
 
@@ -303,6 +316,116 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 	return ret;
 }
 
+static int k3_pcie_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct k1_pcie *k1 = to_k1_pcie(pci);
+	u32 reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
+	u32 val;
+	int ret;
+
+	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);
+
+	k1_pcie_toggle_soft_reset(k1);
+
+	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
+	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
+			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT,
+			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE);
+
+	ret = k1_pcie_enable_resources(k1);
+	if (ret)
+		goto failed_resources;
+
+	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
+	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
+
+	ret = phy_bulk_init(k1->phy_count, k1->phys);
+	if (ret)
+		goto failed_phy;
+
+	msleep(PCIE_T_PVPERL_MS);
+
+	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
+			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
+
+	val = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
+	val = u32_replace_bits(val, BIT(7),
+			       GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
+	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
+
+	k1_pcie_set_device_id(k1);
+
+	/* Finally, as a workaround, disable ASPM L1 */
+	k1_pcie_disable_aspm_l1(k1);
+
+	return 0;
+
+failed_phy:
+	k1_pcie_disable_resources(k1);
+failed_resources:
+	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
+			   PCIE_PERSTN_OUT | PCIE_PERSTN_OE | PCIE_IGNORE_PERSTN,
+			   PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
+
+	return ret;
+}
+
+static void k3_pcie_deinit(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct k1_pcie *k1 = to_k1_pcie(pci);
+
+	/* Assert fundamental reset (drive PERST# low) */
+	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
+			   PCIE_PERSTN_OUT | PCIE_PERSTN_OE,
+			   PCIE_PERSTN_OE);
+
+	phy_bulk_exit(k1->phy_count, k1->phys);
+
+	k1_pcie_disable_resources(k1);
+}
+
+static int k3_pcie_msi_host_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	u32 val;
+
+	dw_pcie_dbi_ro_wr_en(pci);
+
+	/* For IMSIC interrupt */
+	val = dw_pcie_readl_dbi(pci, COHERENCY_CONTROL_3_OFF);
+	val = u32_replace_bits(val, K3_CACHE_MSTR_AWCACHE_BEHAVIOR,
+			       K3_CACHE_MSTR_AWCACHE_MODE);
+	dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_3_OFF, val);
+
+	dw_pcie_dbi_ro_wr_dis(pci);
+
+	return 0;
+}
+
+static const struct dw_pcie_host_ops k3_pcie_host_ops = {
+	.init		= k3_pcie_init,
+	.deinit		= k3_pcie_deinit,
+	.msi_init	= k3_pcie_msi_host_init,
+};
+
+static int k3_pcie_parse_port(struct k1_pcie *k1)
+{
+	u32 status0, status1, status2;
+
+	/* This register require a RAW for cleanup */
+	status0 = readl_relaxed(k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
+	status1 = readl_relaxed(k1->link + INTR_STATUS);
+	status2 = readl_relaxed(k1->link + K3_ADDR_INTR_STATUS1);
+
+	writel_relaxed(status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
+	writel_relaxed(status1, k1->link + INTR_STATUS);
+	writel_relaxed(status2, k1->link + K3_ADDR_INTR_STATUS1);
+
+	return k1_pcie_parse_port(k1);
+}
+
 static int k1_pcie_probe(struct platform_device *pdev)
 {
 	const struct k1_pcie_device_data *data;
@@ -380,8 +503,17 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
 };
 
+static const struct k1_pcie_device_data k3_pcie_device_data = {
+	.host_ops	= &k3_pcie_host_ops,
+	.ops		= &k1_pcie_ops,
+	.parse_port	= k3_pcie_parse_port,
+	.max_phy_count	= 6,
+	.device_id	= PCI_DEVICE_ID_SPACEMIT_K3,
+};
+
 static const struct of_device_id k1_pcie_of_match_table[] = {
 	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data },
+	{ .compatible = "spacemit,k3-pcie", .data = &k3_pcie_device_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, k1_pcie_of_match_table);
-- 
2.55.0

