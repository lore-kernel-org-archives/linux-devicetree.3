Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3D33A7D98;
	Mon, 25 May 2026 06:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779691353; cv=none; b=HgTK/6PAxjuWwd+Lql9x/oB1SUyRS7ONgm7BTo1g+Tf32qVhXxvLWmybOhpTzCmuQNcezjaWp+mPSLL86C5trwSne2jvOj8zlnAjXxbU6eka0SB7WsDztmFrXruoL+BRuSUxs9Go36OcI7HpfME/d3rJfrwvAoE4jyvfqN98m0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779691353; c=relaxed/simple;
	bh=tjqSH3CWXVS0luHZfoZm0G1Yp242RpUiLf7cNnnb+VA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k6wB7dKNpYbH4F44MrNnRgE7Pd9+twVrMPg4FENWCHHnGCFmBZxd+VZ+EfCuq8gs6elHKAA2eL7cr1Tj2Q38nvB6h9TYW1xH13LyB0E6XTbURskEy+K/Fw8rKe02PmLn7PuqEsdIUMJ2fB9Vxga1hxx+YKOK+YYm1/m/IZY5kjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E01161A3EA4;
	Mon, 25 May 2026 08:42:29 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CA4761A3F13;
	Mon, 25 May 2026 08:42:28 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 75EE61800087;
	Mon, 25 May 2026 14:42:27 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>,
	Frank Li <frank.li@nxp.com>
Subject: [PATCH v10 6/9] regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x i3c hub
Date: Mon, 25 May 2026 12:12:06 +0530
Message-Id: <20260525064209.2263045-7-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525064209.2263045-1-lakshay.piplani@nxp.com>
References: <20260525064209.2263045-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

The NXP P3H2x4x family integrates on-die regulators alongside I3C hub
functionality. This driver registers the regulators using the MFD
framework and exposes them via the regulator subsystem.

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Reviewed-by: Frank Li <frank.li@nxp.com>

---
Changes in v10:
 - No change

Changes in v9:
 - No change

Changes in v8:
 - No change

Changes in v7:
 - No change, added Reviewed-By tag

Changes in v6:
 - Use DEFINE_LOCK_GUARD_1 for reg lock/unlock

Changes in v5:
 - Updated dev_err_probe() for regmap_init failure.
 - Updated module description

Changes in v4:
 - Split the driver into three separate patches (mfd, regulator and I3C hub)
 - Introduced driver for on-die regulators in NXP P3H2x4x I3C hub
---
---
 MAINTAINERS                                   |   1 +
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/p3h2840_i3c_hub_regulator.c | 218 ++++++++++++++++++
 4 files changed, 230 insertions(+)
 create mode 100644 drivers/regulator/p3h2840_i3c_hub_regulator.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 25e578dd74dd..da698b34873b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19312,6 +19312,7 @@ L:	linux-i3c-owner@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
 F:	drivers/mfd/p3h2840.c
+F:	drivers/regulator/p3h2840_i3c_hub_regulator.c
 F:	include/linux/mfd/p3h2840.h
 
 NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d71dac9436e3..88809f493fd4 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1019,6 +1019,16 @@ config REGULATOR_MTK_DVFSRC
 	  of Mediatek. It allows for voting on regulator state
 	  between multiple users.
 
+config REGULATOR_P3H2X4X
+       tristate "NXP P3H2X4X regulator support"
+       depends on MFD_P3H2X4X
+       help
+         This driver provides support for the voltage regulators of the
+         P3H244x/P3H284x multi-function I3C Hub device.
+
+         Say M here if you want to include support for this regulator as
+         a module. The module will be named "p3h2840_i3c_hub_regulator".
+
 config REGULATOR_PALMAS
 	tristate "TI Palmas PMIC Regulators"
 	depends on MFD_PALMAS
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 35639f3115fd..46f586ccde63 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -128,6 +128,7 @@ obj-$(CONFIG_REGULATOR_QCOM_RPMH) += qcom-rpmh-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_SMD_RPM) += qcom_smd-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_SPMI) += qcom_spmi-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_USB_VBUS) += qcom_usb_vbus-regulator.o
+obj-$(CONFIG_REGULATOR_P3H2X4X) += p3h2840_i3c_hub_regulator.o
 obj-$(CONFIG_REGULATOR_PALMAS) += palmas-regulator.o
 obj-$(CONFIG_REGULATOR_PCA9450) += pca9450-regulator.o
 obj-$(CONFIG_REGULATOR_PF0900) += pf0900-regulator.o
diff --git a/drivers/regulator/p3h2840_i3c_hub_regulator.c b/drivers/regulator/p3h2840_i3c_hub_regulator.c
new file mode 100644
index 000000000000..4f2514d4d928
--- /dev/null
+++ b/drivers/regulator/p3h2840_i3c_hub_regulator.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025-2026 NXP
+ * This P3H2X4X driver file contain functions for enable/disable regulator and voltage set/get.
+ */
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/mfd/p3h2840.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+
+#define P3H2X4X_LDO_AND_PULLUP_CONF				0x19
+#define P3H2X4X_LDO_ENABLE_DISABLE_MASK				GENMASK(3, 0)
+#define P3H2X4X_CP0_EN_LDO				        BIT(0)
+#define P3H2X4X_CP1_EN_LDO				        BIT(1)
+#define P3H2X4X_TP0145_EN_LDO					BIT(2)
+#define P3H2X4X_TP2367_EN_LDO					BIT(3)
+
+#define P3H2X4X_NET_OPER_MODE_CONF				0x15
+#define P3H2X4X_VCCIO_LDO_CONF					0x16
+#define P3H2X4X_CP0_VCCIO_LDO_VOLTAGE_MASK			GENMASK(1, 0)
+#define P3H2X4X_CP0_VCCIO_LDO_VOLTAGE(x)	\
+		FIELD_PREP(P3H2X4X_CP0_VCCIO_LDO_VOLTAGE_MASK, x)
+#define P3H2X4X_CP1_VCCIO_LDO_VOLTAGE_MASK			GENMASK(3, 2)
+#define P3H2X4X_CP1_VCCIO_LDO_VOLTAGE(x)	\
+		FIELD_PREP(P3H2X4X_CP1_VCCIO_LDO_VOLTAGE_MASK, x)
+#define P3H2X4X_TP0145_VCCIO_LDO_VOLTAGE_MASK			GENMASK(5, 4)
+#define P3H2X4X_TP0145_VCCIO_LDO_VOLTAGE(x)	\
+		FIELD_PREP(P3H2X4X_TP0145_VCCIO_LDO_VOLTAGE_MASK, x)
+#define P3H2X4X_TP2367_VCCIO_LDO_VOLTAGE_MASK			GENMASK(7, 6)
+#define P3H2X4X_TP2367_VCCIO_LDO_VOLTAGE(x)	\
+		FIELD_PREP(P3H2X4X_TP2367_VCCIO_LDO_VOLTAGE_MASK, x)
+#define P3H2X4X_LDO_COUNT					4
+
+struct p3h2x4x_regulator_dev {
+	struct regulator_dev *rp3h2x4x_dev[P3H2X4X_LDO_COUNT];
+	struct regmap *regmap;
+};
+
+struct p3h2x4x_reg_state {
+	unsigned int orig;
+	bool restore;
+};
+
+static void p3h2x4x_reg_guard_enter(struct regulator_dev *rdev,
+				    struct p3h2x4x_reg_state *state)
+{
+	state->restore = false;
+
+	if (regmap_read(rdev->regmap,
+			P3H2X4X_DEV_REG_PROTECTION_CODE,
+			&state->orig))
+		return;
+
+	if (state->orig != P3H2X4X_REGISTERS_UNLOCK_CODE) {
+		regmap_write(rdev->regmap,
+			     P3H2X4X_DEV_REG_PROTECTION_CODE,
+			     P3H2X4X_REGISTERS_UNLOCK_CODE);
+		state->restore = true;
+	}
+}
+
+static void p3h2x4x_reg_guard_exit(struct regulator_dev *rdev,
+				   struct p3h2x4x_reg_state *state)
+{
+	if (state->restore)
+		regmap_write(rdev->regmap,
+			     P3H2X4X_DEV_REG_PROTECTION_CODE,
+			     state->orig);
+}
+
+DEFINE_LOCK_GUARD_1(p3h2x4x_reg, struct regulator_dev,
+		    p3h2x4x_reg_guard_enter(_T->lock, &_T->state),
+		    p3h2x4x_reg_guard_exit(_T->lock, &_T->state),
+		    struct p3h2x4x_reg_state state);
+
+static int p3h2x4x_regulator_enable(struct regulator_dev *rdev)
+{
+	guard(p3h2x4x_reg)(rdev);
+	return regulator_enable_regmap(rdev);
+}
+
+static int p3h2x4x_regulator_disable(struct regulator_dev *rdev)
+{
+	guard(p3h2x4x_reg)(rdev);
+	return regulator_disable_regmap(rdev);
+}
+
+static int p3h2x4x_regulator_set_voltage_sel(struct regulator_dev *rdev,
+					     unsigned int sel)
+{
+	guard(p3h2x4x_reg)(rdev);
+	return regulator_set_voltage_sel_regmap(rdev, sel);
+}
+
+static const struct regulator_ops p3h2x4x_ldo_ops = {
+	.list_voltage = regulator_list_voltage_table,
+	.map_voltage = regulator_map_voltage_iterate,
+	.set_voltage_sel = p3h2x4x_regulator_set_voltage_sel,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.enable = p3h2x4x_regulator_enable,
+	.disable = p3h2x4x_regulator_disable,
+	.is_enabled = regulator_is_enabled_regmap,
+};
+
+static const unsigned int p3h2x4x_voltage_table[] = {
+	1000000,
+	1100000,
+	1200000,
+	1800000,
+};
+
+static struct regulator_desc p3h2x4x_regulators[] = {
+	{
+		.name = "ldo-cp0",
+		.of_match = of_match_ptr("ldo-cp0"),
+		.regulators_node = of_match_ptr("regulators"),
+		.volt_table = p3h2x4x_voltage_table,
+		.n_voltages = ARRAY_SIZE(p3h2x4x_voltage_table),
+		.ops = &p3h2x4x_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.enable_reg = P3H2X4X_LDO_AND_PULLUP_CONF,
+		.enable_mask = P3H2X4X_CP0_EN_LDO,
+		.vsel_reg = P3H2X4X_VCCIO_LDO_CONF,
+		.vsel_mask = P3H2X4X_CP0_VCCIO_LDO_VOLTAGE_MASK,
+	},
+	{
+		.name = "ldo-cp1",
+		.of_match = of_match_ptr("ldo-cp1"),
+		.regulators_node = of_match_ptr("regulators"),
+		.volt_table = p3h2x4x_voltage_table,
+		.n_voltages = ARRAY_SIZE(p3h2x4x_voltage_table),
+		.ops = &p3h2x4x_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.enable_reg = P3H2X4X_LDO_AND_PULLUP_CONF,
+		.enable_mask = P3H2X4X_CP1_EN_LDO,
+		.vsel_reg = P3H2X4X_VCCIO_LDO_CONF,
+		.vsel_mask = P3H2X4X_CP1_VCCIO_LDO_VOLTAGE_MASK,
+	},
+	{
+		.name = "ldo-tpg0",
+		.of_match = of_match_ptr("ldo-tpg0"),
+		.regulators_node = of_match_ptr("regulators"),
+		.volt_table = p3h2x4x_voltage_table,
+		.n_voltages = ARRAY_SIZE(p3h2x4x_voltage_table),
+		.ops = &p3h2x4x_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.enable_reg = P3H2X4X_LDO_AND_PULLUP_CONF,
+		.enable_mask = P3H2X4X_TP0145_EN_LDO,
+		.vsel_reg = P3H2X4X_VCCIO_LDO_CONF,
+		.vsel_mask = P3H2X4X_TP0145_VCCIO_LDO_VOLTAGE_MASK,
+	},
+	{
+		.name = "ldo-tpg1",
+		.of_match = of_match_ptr("ldo-tpg1"),
+		.regulators_node = of_match_ptr("regulators"),
+		.volt_table = p3h2x4x_voltage_table,
+		.n_voltages = ARRAY_SIZE(p3h2x4x_voltage_table),
+		.ops = &p3h2x4x_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.owner = THIS_MODULE,
+		.enable_reg = P3H2X4X_LDO_AND_PULLUP_CONF,
+		.enable_mask = P3H2X4X_TP2367_EN_LDO,
+		.vsel_reg = P3H2X4X_VCCIO_LDO_CONF,
+		.vsel_mask = P3H2X4X_TP2367_VCCIO_LDO_VOLTAGE_MASK,
+	},
+};
+
+static int p3h2x4x_regulator_probe(struct platform_device *pdev)
+{
+	struct p3h2x4x_dev *p3h2x4x = dev_get_drvdata(pdev->dev.parent);
+	struct p3h2x4x_regulator_dev *p3h2x4x_regulator;
+	struct regulator_config rcfg = { };
+	struct device *dev = &pdev->dev;
+	struct regulator_dev *rdev;
+	int i;
+
+	p3h2x4x_regulator = devm_kzalloc(dev, sizeof(*p3h2x4x_regulator), GFP_KERNEL);
+	if (!p3h2x4x_regulator)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, p3h2x4x_regulator);
+
+	p3h2x4x_regulator->regmap = p3h2x4x->regmap;
+
+	rcfg.dev = dev->parent;
+	rcfg.regmap = p3h2x4x_regulator->regmap;
+	rcfg.driver_data = p3h2x4x_regulator;
+
+	for (i = 0; i < ARRAY_SIZE(p3h2x4x_regulators); i++) {
+		rdev = devm_regulator_register(&pdev->dev, &p3h2x4x_regulators[i], &rcfg);
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev), "Failed to register %s\n",
+					     p3h2x4x_regulators[i].name);
+		p3h2x4x_regulator->rp3h2x4x_dev[i] = rdev;
+	}
+	return 0;
+}
+
+static struct platform_driver p3h2x4x_regulator_driver = {
+	.driver = {
+		.name = "p3h2x4x-regulator",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe = p3h2x4x_regulator_probe,
+};
+module_platform_driver(p3h2x4x_regulator_driver);
+
+MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
+MODULE_AUTHOR("Vikash Bansal <vikash.bansal@nxp.com>");
+MODULE_AUTHOR("Lakshay Piplani <lakshay.piplani@nxp.com>");
+MODULE_DESCRIPTION("NXP P3H2X4X I3C HUB Regulator driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

