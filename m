Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDAA30C35C
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 01:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778982572; cv=none; b=OTx3jyjFEmp3MgD+yivscAVSOsVzdr6VcNUiZuRK16Pk8JBj4ARvFE0kpphEffEXiTb+ebF70r3Oc3bILmh1WT6JG3Qm9SncySlELtTQ0AfOqnGkDgzpxSvwrMQ3EqO0WMzZiaVMTnq4HXmHoCgQPSFKAn3HKzoZknj/c5QEoho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778982572; c=relaxed/simple;
	bh=sl9eoUEuuug2fKZ7asFlwOV6fpkC8fTTfUlujR+t0SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0weT17CPZ9jSgf0BDT370qgLeKW1XjsiTNt48GI9M71MbR0DntUf4FgOobB6uzsl9kO7pkXsYVu+7mV+KWIvlJtIIpeuCfyB60aLz3IXoDNrSSGkMtIedPwwiQngbZFtBZej4ByawFpr18iurF2SKNqxUTHBe7jS6Nw7Zx2wn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKMwn2FV; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKMwn2FV"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3697c35eab7so341422a91.0
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 18:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778982568; x=1779587368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeZkpj1zuQf2Hxz4Sd2FM8Ip5yddG0cz8geYRJ8r5eU=;
        b=OKMwn2FVoK+ASWWaaQtCj+zmH/49Ep3d0uFD8vacR3qJ4Xek+XaH8K/k+vrJr4XJlm
         J9VcNanit0GnOodvnU9W6tOOXUcjigUx4tD9IREEZFiY7KX36UM/TDCej+bDyCeX9/ri
         OAaL0xuGAjsvn+AeH5GuZ0BPYwN5UlC2IEs/rSuWMLZm9Y6c3Z66TV/BRpiWgVZq4pT7
         sOoEYC/0Z/mdSG4uF+Le2pADJorrr6FR9tyVF0IwS4cJyxnvCai7NPSufmR1hcbuzmUB
         fKy8qx9auOixNdqwjRD4DYaAkNMiP00rkCXAKTJKX0c+jZSvjyP4RykG4O3e2tnpH4mM
         vIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778982568; x=1779587368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GeZkpj1zuQf2Hxz4Sd2FM8Ip5yddG0cz8geYRJ8r5eU=;
        b=KuZZD/iMuHq/4QZQ7a1Iq7l89kAvAandF9zttkE+vBHdN+y5jAOcRTKZJBYis7biqb
         Gsk4xCIEIAgV2LBIJM48VPuWvY+saIchhlddLb4Q/Twu/41SqwgNM40OwX+ofgkSLa41
         WDr6TNJ2u7CqR2m9JrU+HMmHm8cmHRwqsSq/zZHX+VGHuBUvuJbB7Rp5b1QsZypHudT4
         8NoIqenxGFslCmQJpG9kf/r9tVetvOoXQlqhd6GCi9FxYlLl/w0aoW+cYK8HISgQbo5f
         OR/TmbNBy6O6e1zRnFERjuWW70JQxmYUbu+4tZuZFH3peiO0vfIbJhFZnp6YfCRPqXr9
         qWVA==
X-Forwarded-Encrypted: i=1; AFNElJ/pi8SklqNURI7APMh07WOaruQkxEm4jOpvZ6FUhXjtgxgmjamITcOUqBFiUHynIEIngugnS8AH40xF@vger.kernel.org
X-Gm-Message-State: AOJu0YzULNEefVTIr2dqwSNBnE3iSD0cJ+kXr6vKiGN6bYGow4JF703/
	9uXhWRXK3TV3qkTyvKvcwZdGOiJb1lPiVFfpOYKwlzNj4of1p1zqPs/M
X-Gm-Gg: Acq92OF2/kU+fwkI5JFahS3+KBpzOgk70GF9b2MXmtadtLigRcYzrFTMg54G+Ps1/5D
	O8SJJpDKCnT47j9v/0oEQrEOsbV9hUeaJ0UyqKpaJrZ9G1AEfTCDQ1qdnm8ODZZjdQDQjHF/ZJk
	Q5w5UVDC1ol7U/YB09/FWQBOe9OkLsmzDhCg20Iwn/ieMzhzBkDdNHLmlO5VuGo39vqtGrqYtVI
	KXCaXVe/Q38U2n1aYx0q8WKOhO50hk2r3oPSZ06McQFk7s6hZdztXtFcTBwYxmmJwVs50Fi9gD6
	iFdeU3OoSHkDkB291HzVhhdRDEYLxS0dQ4g8Z2VMCrhljxvxRuZqZwtfy3vm9HxR0tS6RoEFvPu
	GarZssbPxI2G89HOIsI8OGNkKocZIhEIStvXSqberSiqRepgxE69xBl6jWomQgC67vOYRTYk//Q
	3GDaLHp4e1SE4h9KCcokL99Jw=
X-Received: by 2002:a17:90b:33c4:b0:35d:9c32:6219 with SMTP id 98e67ed59e1d1-369519e8faamr9623598a91.9.1778982567704;
        Sat, 16 May 2026 18:49:27 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369512424c2sm6853019a91.4.2026.05.16.18.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 18:49:27 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Alex Elder <elder@riscstar.com>,
	Nam Cao <namcao@linutronix.de>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 5/5] PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support
Date: Sun, 17 May 2026 09:48:40 +0800
Message-ID: <20260517014841.254085-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517014841.254085-1-inochiama@gmail.com>
References: <20260517014841.254085-1-inochiama@gmail.com>
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
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 169 ++++++++++++++++++
 2 files changed, 171 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index f2fde13107f2..fae971ecd876 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -439,7 +439,7 @@ config PCIE_SOPHGO_DW
 	  Sophgo SoCs.
 
 config PCIE_SPACEMIT_K1
-	tristate "SpacemiT K1 PCIe controller (host mode)"
+	tristate "SpacemiT K1/K3 PCIe controller (host mode)"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on HAS_IOMEM
 	select PCIE_DW_HOST
@@ -447,7 +447,7 @@ config PCIE_SPACEMIT_K1
 	default ARCH_SPACEMIT
 	help
 	  Enables support for the DesignWare based PCIe controller in
-	  the SpacemiT K1 SoC operating in host mode.  Three controllers
+	  the SpacemiT K1/K3 SoC operating in host mode. Three controllers
 	  are available on the K1 SoC; the first of these shares a PHY
 	  with a USB 3.0 host controller (one or the other can be used).
 
diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 7f6f1df31cd8..7854d26220a9 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -23,6 +23,7 @@
 
 #define PCI_VENDOR_ID_SPACEMIT		0x201f
 #define PCI_DEVICE_ID_SPACEMIT_K1	0x0001
+#define PCI_DEVICE_ID_SPACEMIT_K3	0x0002
 
 /* Offsets and field definitions for link management registers */
 #define K1_PHY_AHB_IRQ_EN			0x0000
@@ -32,8 +33,20 @@
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
+
+#define K3_MAX_PHY_NUMBER		6
 
 /* Some controls require APMU regmap access */
 #define SYSCON_APMU			"spacemit,apmu"
@@ -48,6 +61,9 @@
 
 #define PCIE_CONTROL_LOGIC			0x0004
 #define PCIE_SOFT_RESET			BIT(0)
+#define PCIE_PERSTN_OE			BIT(24)
+#define PCIE_PERSTN_OUT			BIT(25)
+#define PCIE_IGNORE_PERSTN		BIT(31)
 
 struct k1_pcie {
 	struct dw_pcie pci;
@@ -262,6 +278,152 @@ static const struct dw_pcie_ops k1_pcie_ops = {
 	.stop_link	= k1_pcie_stop_link,
 };
 
+static int k3_pcie_enable_phy(struct k1_pcie *pcie)
+{
+	int i, ret;
+
+	for (i = 0; i < pcie->phy_count; i++) {
+		ret = phy_init(pcie->phy[i]);
+		if (ret)
+			goto err_phy;
+	}
+
+	return 0;
+
+err_phy:
+	while (--i >= 0)
+		phy_exit(pcie->phy[i]);
+
+	return ret;
+}
+
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
+	ret = k1_pcie_enable_resources(k1);
+	if (ret)
+		return ret;
+
+	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
+	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
+
+	ret = k3_pcie_enable_phy(k1);
+	if (ret) {
+		k1_pcie_disable_resources(k1);
+		return ret;
+	}
+
+	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
+	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
+			PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT);
+	usleep_range(1000, 2000);
+	regmap_clear_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC, PCIE_PERSTN_OUT);
+
+	msleep(PCIE_T_PVPERL_MS);
+
+	/*
+	 * Put the controller in root complex mode, and indicate that
+	 * Vaux (3.3v) is present.
+	 */
+	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
+			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
+
+	val = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
+	val = u32_replace_bits(val, GEN3_EQ_CONTROL_OFF_PHASE23_EXIT_MODE,
+			       GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
+	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
+
+	dw_pcie_dbi_ro_wr_en(pci);
+	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
+	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K3);
+	dw_pcie_dbi_ro_wr_dis(pci);
+
+	/* Finally, as a workaround, disable ASPM L1 */
+	k1_pcie_disable_aspm_l1(k1);
+
+	return 0;
+}
+
+static int k3_pcie_msi_host_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	u32 val;
+
+	dw_pcie_dbi_ro_wr_en(pci);
+
+	val = dw_pcie_readl_dbi(pci, COHERENCY_CONTROL_3_OFF);
+	val |= u32_replace_bits(val, K3_CACHE_MSTR_AWCACHE_BEHAVIOR,
+				K3_CACHE_MSTR_AWCACHE_MODE);
+	dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_3_OFF, val);
+
+	dw_pcie_dbi_ro_wr_dis(pci);
+
+	return 0;
+}
+
+static const struct dw_pcie_host_ops k3_pcie_host_ops = {
+	.init		= k3_pcie_init,
+	.deinit		= k1_pcie_deinit,
+	.msi_init	= k3_pcie_msi_host_init,
+};
+
+static const struct dw_pcie_ops k3_pcie_ops = {
+	.link_up	= k1_pcie_link_up,
+	.start_link	= k1_pcie_start_link,
+	.stop_link	= k1_pcie_stop_link,
+};
+
+static void k3_pcie_clear_irq_status(struct k1_pcie *k1,
+				     u32 *status0, u32 *status1, u32 *status2)
+{
+	*status0 = readl_relaxed(k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
+	*status1 = readl_relaxed(k1->link + INTR_STATUS);
+	*status2 = readl_relaxed(k1->link + K3_ADDR_INTR_STATUS1);
+
+	writel_relaxed(*status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
+	writel_relaxed(*status1, k1->link + INTR_STATUS);
+	writel_relaxed(*status2, k1->link + K3_ADDR_INTR_STATUS1);
+}
+
+static int k3_pcie_parse_port(struct k1_pcie *k1)
+{
+	struct device *dev = k1->pci.dev;
+	u32 status0, status1, status2;
+	int i;
+
+	k1->phy = devm_kmalloc_array(dev, K3_MAX_PHY_NUMBER, sizeof(*k1->phy),
+				     GFP_KERNEL);
+	if (!k1->phy)
+		return -ENOMEM;
+
+	for (i = 0; i < K3_MAX_PHY_NUMBER; i++) {
+		k1->phy[i] = devm_of_phy_get_by_index(dev, dev->of_node, i);
+		if (IS_ERR(k1->phy[i])) {
+			if (PTR_ERR(k1->phy[i]) == -ENODEV)
+				break;
+
+			return PTR_ERR(k1->phy[i]);
+		}
+	}
+
+	k1->phy_count = i;
+	if (k1->phy_count == 0)
+		return -EINVAL;
+
+	k3_pcie_clear_irq_status(k1, &status0, &status1, &status2);
+
+	return 0;
+}
+
 static int k1_pcie_parse_port(struct k1_pcie *k1)
 {
 	struct device *dev = k1->pci.dev;
@@ -363,8 +525,15 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.parse_port	= k1_pcie_parse_port,
 };
 
+static const struct k1_pcie_device_data k3_pcie_device_data = {
+	.host_ops	= &k3_pcie_host_ops,
+	.ops		= &k3_pcie_ops,
+	.parse_port	= k3_pcie_parse_port,
+};
+
 static const struct of_device_id k1_pcie_of_match_table[] = {
 	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},
+	{ .compatible = "spacemit,k3-pcie", .data = &k3_pcie_device_data},
 	{ }
 };
 
-- 
2.54.0

