Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326DA40B396;
	Thu, 23 Jul 2026 08:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796236; cv=none; b=YGZOkxs/EyHg/DvJyp8PvGlD7fjjwu5TAGTSblfKD+EduE/c48K/8jb3oW1PBTUy/kzUUqp9gyAxkkB5KB+AUiJqx1Py6EHVov+LufWNfUwOJ3R4CGs6juWJygJ8uhH9qZbiI2HayTiRNXaucJoz1l8KxqbGO9q0yPQYWUK4+AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796236; c=relaxed/simple;
	bh=Iyb6/RBUcwCrGpVnL2MQ/78iA1kNbq3EQwLu0LhwlaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XgRq3qrCJliLnzZ+kDhUDvBtXbtk5rGLgs6Nci+bIekXCK83llFwMKNia9jztybwmIYsMnbPvQjB9a5VE0nu1O+T9p2FJnfCmkWTOVlt1PSp8xTfOPfZZik2GLtpHplkWc/wXPkqcstYyzxSgT9qWIfggeOyZ1mowLagvE3jYow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.114])
	by APP-05 (Coremail) with SMTP id zQCowAAHOEIp1GFqdib2AA--.64522S4;
	Thu, 23 Jul 2026 16:43:29 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Fu <wefu@redhat.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v2 2/2] phy: add a driver for T-Head TH1520 USB PHY
Date: Thu, 23 Jul 2026 16:43:16 +0800
Message-ID: <20260723084316.3573714-3-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260723084316.3573714-1-zhengxingda@iscas.ac.cn>
References: <20260723084316.3573714-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAHOEIp1GFqdib2AA--.64522S4
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr15uw1rZFyrCF1rKr15urg_yoW3Aw4kpa
	9xCFWrtr4ktFsIgw4fJr1UCFWSqay3ta4agry7G3WfZFy3Gry5ua98WFW5Zr9Yvrs7ZrWf
	tr95GFW2kF1UK37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUbH5lUUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

The USB PHY on T-Head TH1520 SoC is a Synopsys USB 3.0 FemtoPHY, with
some PHY parameters exported as another system controller along with it.

As a few PHY parameters' default value isn't ready to work, add a driver
configuring them before letting the PHY run, in addition to
clock/reset/regulator management.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Changes in v2:
- Removed unreferenced register names.
- Changed the behavior to leaving bus clock on instead of binding it to
  the regmap.
- Removed early return for reset deassert failure in phy exit callback.
- Tweaked the Kconfig item (removed default value and added "select
  REGMAP_MMIO).

 drivers/phy/Kconfig                |   1 +
 drivers/phy/Makefile               |   1 +
 drivers/phy/thead/Kconfig          |  11 ++
 drivers/phy/thead/Makefile         |   2 +
 drivers/phy/thead/phy-th1520-usb.c | 180 +++++++++++++++++++++++++++++
 5 files changed, 195 insertions(+)
 create mode 100644 drivers/phy/thead/Kconfig
 create mode 100644 drivers/phy/thead/Makefile
 create mode 100644 drivers/phy/thead/phy-th1520-usb.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 19f3b7d12b7d4..a05019020ee09 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -200,6 +200,7 @@ source "drivers/phy/st/Kconfig"
 source "drivers/phy/starfive/Kconfig"
 source "drivers/phy/sunplus/Kconfig"
 source "drivers/phy/tegra/Kconfig"
+source "drivers/phy/thead/Kconfig"
 source "drivers/phy/ti/Kconfig"
 source "drivers/phy/xilinx/Kconfig"
 
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index d7aa516bcc49e..0ac5b21477619 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -52,5 +52,6 @@ obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
 					   starfive/	\
 					   sunplus/	\
 					   tegra/	\
+					   thead/	\
 					   ti/		\
 					   xilinx/
diff --git a/drivers/phy/thead/Kconfig b/drivers/phy/thead/Kconfig
new file mode 100644
index 0000000000000..3c2c797c50c0b
--- /dev/null
+++ b/drivers/phy/thead/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config PHY_TH1520_USB
+	tristate "USB PHY driver for T-Head TH1520 SoC"
+	depends on ARCH_THEAD || COMPILE_TEST
+	depends on COMMON_CLK
+	depends on HAS_IOMEM
+	depends on OF
+	depends on RESET_CONTROLLER
+	select GENERIC_PHY
+	select REGMAP_MMIO
+	help
+	  Enable support for the USB PHY on the T-Head TH1520 SoC.
diff --git a/drivers/phy/thead/Makefile b/drivers/phy/thead/Makefile
new file mode 100644
index 0000000000000..5b459bc7004bd
--- /dev/null
+++ b/drivers/phy/thead/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_PHY_TH1520_USB) += phy-th1520-usb.o
diff --git a/drivers/phy/thead/phy-th1520-usb.c b/drivers/phy/thead/phy-th1520-usb.c
new file mode 100644
index 0000000000000..802af72353a11
--- /dev/null
+++ b/drivers/phy/thead/phy-th1520-usb.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Institute of Software, Chinese Academy of Sciences (ISCAS)
+ *
+ * Authors:
+ * Icenowy Zheng <zhengxingda@iscas.ac.cn>
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+
+#define USB_SYSCON_OFFSET		0xf000
+
+/* All the below registers are in the USB syscon region */
+#define USB_SSP_EN			0x34
+#define USB_SSP_EN_REF_SSP_EN		BIT(0)
+
+#define USB_SYS				0x3c
+#define USB_SYS_COMMONONN		BIT(0)
+
+/* The last register according to the manual */
+#define USB_TEST_REG3			0x5c
+
+struct th1520_usb_phy {
+	struct platform_device *pdev;
+	struct phy *phy;
+	struct regmap *regmap;
+	struct clk *ref_clk;
+	struct reset_control *phy_reset;
+};
+
+static int th1520_usb_phy_init(struct phy *phy)
+{
+	struct th1520_usb_phy *th1520_phy = phy_get_drvdata(phy);
+	int ret;
+
+	ret = clk_prepare_enable(th1520_phy->ref_clk);
+	if (ret)
+		return ret;
+
+	ret = reset_control_assert(th1520_phy->phy_reset);
+	if (ret)
+		goto err_disable_clk;
+
+	/*
+	 * Do some initial PHY setup:
+	 * - Set COMMONONN to allow the PHY to automatically power down.
+	 * - Set REF_SSP_EN to enable feeding reference clock to SuperSpeed
+	 *   PHY clock PLL.
+	 */
+	regmap_set_bits(th1520_phy->regmap, USB_SYS, USB_SYS_COMMONONN);
+	regmap_set_bits(th1520_phy->regmap, USB_SSP_EN, USB_SSP_EN_REF_SSP_EN);
+
+	ret = reset_control_deassert(th1520_phy->phy_reset);
+	if (ret)
+		goto err_disable_clk;
+
+	udelay(10);
+
+	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(th1520_phy->ref_clk);
+	return ret;
+}
+
+static int th1520_usb_phy_exit(struct phy *phy)
+{
+	struct th1520_usb_phy *th1520_phy = phy_get_drvdata(phy);
+	int ret;
+
+	ret = reset_control_assert(th1520_phy->phy_reset);
+	clk_disable_unprepare(th1520_phy->ref_clk);
+
+	return ret;
+}
+
+static const struct phy_ops th1520_usb_phy_ops = {
+	.init		= th1520_usb_phy_init,
+	.exit		= th1520_usb_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+static const struct regmap_config phy_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = USB_TEST_REG3,
+};
+
+static int th1520_usb_phy_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct th1520_usb_phy *th1520_phy;
+	struct reset_control *bus_reset;
+	struct clk *bus_clk;
+	void __iomem *base;
+	int ret;
+
+	th1520_phy = devm_kzalloc(dev, sizeof(*th1520_phy), GFP_KERNEL);
+	if (!th1520_phy)
+		return -ENOMEM;
+
+	th1520_phy->pdev = pdev;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	th1520_phy->ref_clk = devm_clk_get(dev, "ref");
+	if (IS_ERR(th1520_phy->ref_clk))
+		return PTR_ERR(th1520_phy->ref_clk);
+
+	/* Enable the bus clock and leave it that way */
+	bus_clk = devm_clk_get_enabled(dev, "bus");
+	if (IS_ERR(bus_clk))
+		return PTR_ERR(bus_clk);
+
+	/* De-assert the bus reset and leave it that way */
+	bus_reset = devm_reset_control_get_exclusive_deasserted(dev, "bus");
+	if (IS_ERR(bus_reset))
+		return PTR_ERR(bus_reset);
+
+	th1520_phy->phy_reset = devm_reset_control_get_exclusive(dev, "phy");
+	if (IS_ERR(th1520_phy->phy_reset))
+		return PTR_ERR(th1520_phy->phy_reset);
+
+	/*
+	 * Schematics of several boards (Lichee Module 4A/Milk-V Meles)
+	 * describe this power rail as always-on.
+	 */
+	ret = devm_regulator_get_enable(dev, "avdd33-usb3");
+	if (ret)
+		return ret;
+
+	th1520_phy->regmap = devm_regmap_init_mmio(dev,
+						   base + USB_SYSCON_OFFSET,
+						   &phy_regmap_config);
+	if (IS_ERR(th1520_phy->regmap))
+		return dev_err_probe(dev, PTR_ERR(th1520_phy->regmap),
+				     "Failed to init regmap\n");
+
+	th1520_phy->phy = devm_phy_create(dev, dev->of_node, &th1520_usb_phy_ops);
+	if (IS_ERR(th1520_phy->phy)) {
+		dev_err(dev, "failed to create PHY\n");
+		return PTR_ERR(th1520_phy->phy);
+	}
+
+	phy_set_drvdata(th1520_phy->phy, th1520_phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id th1520_usb_phy_of_table[] = {
+	{ .compatible = "thead,th1520-usb-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, th1520_usb_phy_of_table);
+
+static struct platform_driver th1520_usb_phy_driver = {
+	.driver = {
+		.name = "th1520-usb-phy",
+		.of_match_table = th1520_usb_phy_of_table,
+	},
+	.probe = th1520_usb_phy_probe,
+};
+
+module_platform_driver(th1520_usb_phy_driver);
+
+MODULE_DESCRIPTION("T-Head TH1520 USB PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.52.0

