Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422694CA287;
	Tue, 19 May 2026 12:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779192469; cv=none; b=HSWudR5N0sPeUuiP+mOPWdfMZ/HrES1kwoAn8O2OGUyAWEVll5xcJt63KEE3hvTrLi1WEAmWUdtlIiBmpneUA3xu5pOyQeaeyBG2GWG6ftMNwfLsBjaZY5xZa87wnroKWFIUgwTQXOCz+5fFKFHZDbJ97cMdsK9OOekjGYPk2rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779192469; c=relaxed/simple;
	bh=gpqTD0Xn8LKI//W9G5vwQJRXzsCVXSaBHa1Rrsg1yAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gv+sOJ+6w11kxECArjMIhSrrcmavX2FR8pKLtRp4YSi0txeLGUuD0iyzeuSc7fnPC3wGH8CvEQlhPDKTfC1ocZNMO14upIUqpJ10SJD4EaBVokpPzMJIyL/nAMIkS/TmHIdEwt5HBVqL8CEVJLFQIOgS+uOP91OVAn81l3Uwv6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=q90D9Mjw; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="q90D9Mjw"
Received: from fluffy-mammal.metal.fwg-cag.de (unknown [IPv6:2001:9e8:cdf1:d100:2163:78fd:7eaf:4049])
	by srv01.abscue.de (Postfix) with ESMTPSA id 48D1B1C68E7;
	Tue, 19 May 2026 14:07:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1779192465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WN55OMQqz3wdIMZ49jgyxtfYZUp+iEm7h/R+lN43srQ=;
	b=q90D9Mjwe8z0ZE+7jfDzcoMu9iZQcLa6YEukEyFpiHthsQdVudKsv2gFyuhUHJuPBXpbLn
	k5OdLgARgxICs3OCxPu6volvWpu9Ey6ptfz+87kCDEcjeqGTddTy5LtXA40/WMzExvn8Sb
	q3WGKzXHS3AZarwHolKBKGNREiFNi2Qd/OXTlftbut/P6PNd6n4I2Yd4SKg9OPOvTmCQg8
	EgMeT6CaSs54E66MYhdXdehB9+/Eg6JByZAh+3ElGrMb/d9rYFiIL/OsRlIzY3MdFVPNXx
	zZLaZPuq2TjpvIrsw+laUI+HdTfkvIpTeZPetc/Shy7TGLs+xRRE1rQ2prktJg==
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Tue, 19 May 2026 14:06:13 +0200
Subject: [PATCH v3 3/3] regulator: Add regulator driver for Unisoc SC2730
 PMIC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-sc2730-regulators-v3-3-5bf0e02507e3@abscue.de>
References: <20260519-sc2730-regulators-v3-0-5bf0e02507e3@abscue.de>
In-Reply-To: <20260519-sc2730-regulators-v3-0-5bf0e02507e3@abscue.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Zhongfa Wang <zhongfa.wang@unisoc.com>
X-Mailer: b4 0.14.3

Add a regulator driver for the Spreadtrum/Unisoc SC2730 PMIC, used
e.g. with the UMS512 and UMS9230 SoCs. This version of the driver is
based on a downstream driver provided by Unisoc [1][2] and the existing
SC2731 driver.

Signed-off-by: Zhongfa Wang <zhongfa.wang@unisoc.com>
[cleanup, adapt to new device tree requirements]
Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>

[1]: https://github.com/MotorolaMobilityLLC/kernel-sprd/commit/30be0ddfe6b9a877fc9c328fbd2bae84e645eb31
[2]: https://github.com/MotorolaMobilityLLC/kernel-sprd/blob/android-13-release-tla33/drivers/regulator/sc2730-regulator.c
---
 drivers/regulator/Kconfig            |   7 +
 drivers/regulator/Makefile           |   1 +
 drivers/regulator/sc2730-regulator.c | 411 +++++++++++++++++++++++++++++++++++
 3 files changed, 419 insertions(+)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 78076ac6eac4..b777f795cec2 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1483,6 +1483,13 @@ config REGULATOR_S5M8767
 	 via I2C bus. S5M8767A have 9 Bucks and 28 LDOs output and
 	 supports DVS mode with 8bits of output voltage control.
 
+config REGULATOR_SC2730
+	tristate "Spreadtrum SC2730 power regulator driver"
+	depends on MFD_SC27XX_PMIC || COMPILE_TEST
+	help
+	  This driver provides support for the voltage regulators on the
+	  SC2730 PMIC.
+
 config REGULATOR_SC2731
 	tristate "Spreadtrum SC2731 power regulator driver"
 	depends on MFD_SC27XX_PMIC || COMPILE_TEST
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 35639f3115fd..9de6f1347d14 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -171,6 +171,7 @@ obj-$(CONFIG_REGULATOR_S2DOS05) += s2dos05-regulator.o
 obj-$(CONFIG_REGULATOR_S2MPA01) += s2mpa01.o
 obj-$(CONFIG_REGULATOR_S2MPS11) += s2mps11.o
 obj-$(CONFIG_REGULATOR_S5M8767) += s5m8767.o
+obj-$(CONFIG_REGULATOR_SC2730) += sc2730-regulator.o
 obj-$(CONFIG_REGULATOR_SC2731) += sc2731-regulator.o
 obj-$(CONFIG_REGULATOR_SKY81452) += sky81452-regulator.o
 obj-$(CONFIG_REGULATOR_SLG51000) += slg51000-regulator.o
diff --git a/drivers/regulator/sc2730-regulator.c b/drivers/regulator/sc2730-regulator.c
new file mode 100644
index 000000000000..9e40c6eae494
--- /dev/null
+++ b/drivers/regulator/sc2730-regulator.c
@@ -0,0 +1,411 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018-2021 Unisoc Inc.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+
+/*
+ * SC2730 regulator base address
+ */
+#define SC2730_REGULATOR_BASE		0x1800
+
+/*
+ * SC2730 regulator lock register
+ */
+#define SC2730_WR_UNLOCK_VALUE		0x6e7f
+#define SC2730_PWR_WR_PROT		(SC2730_REGULATOR_BASE + 0x3d0)
+
+/*
+ * SC2730 enable register
+ */
+#define SC2730_POWER_PD_SW		(SC2730_REGULATOR_BASE + 0x01c)
+#define SC2730_LDO_VDDRF18_PD		(SC2730_REGULATOR_BASE + 0x10c)
+#define SC2730_LDO_VDDCAMIO_PD		(SC2730_REGULATOR_BASE + 0x118)
+#define SC2730_LDO_VDDWCN_PD		(SC2730_REGULATOR_BASE + 0x11c)
+#define SC2730_LDO_VDDCAMD1_PD		(SC2730_REGULATOR_BASE + 0x128)
+#define SC2730_LDO_VDDCAMD0_PD		(SC2730_REGULATOR_BASE + 0x134)
+#define SC2730_LDO_VDDRF1V25_PD		(SC2730_REGULATOR_BASE + 0x140)
+#define SC2730_LDO_AVDD12_PD		(SC2730_REGULATOR_BASE + 0x14c)
+#define SC2730_LDO_VDDCAMA0_PD		(SC2730_REGULATOR_BASE + 0x158)
+#define SC2730_LDO_VDDCAMA1_PD		(SC2730_REGULATOR_BASE + 0x164)
+#define SC2730_LDO_VDDCAMMOT_PD		(SC2730_REGULATOR_BASE + 0x170)
+#define SC2730_LDO_VDDSIM2_PD		(SC2730_REGULATOR_BASE + 0x194)
+#define SC2730_LDO_VDDEMMCCORE_PD	(SC2730_REGULATOR_BASE + 0x1a0)
+#define SC2730_LDO_VDDSDCORE_PD		(SC2730_REGULATOR_BASE + 0x1ac)
+#define SC2730_LDO_VDDSDIO_PD		(SC2730_REGULATOR_BASE + 0x1b8)
+#define SC2730_LDO_VDDWIFIPA_PD		(SC2730_REGULATOR_BASE + 0x1d0)
+#define SC2730_LDO_VDDUSB33_PD		(SC2730_REGULATOR_BASE + 0x1e8)
+#define SC2730_LDO_VDDLDO0_PD		(SC2730_REGULATOR_BASE + 0x1f4)
+#define SC2730_LDO_VDDLDO1_PD		(SC2730_REGULATOR_BASE + 0x200)
+#define SC2730_LDO_VDDLDO2_PD		(SC2730_REGULATOR_BASE + 0x20c)
+#define SC2730_LDO_VDDKPLED_PD		(SC2730_REGULATOR_BASE + 0x38c)
+
+/*
+ * SC2730 enable mask
+ */
+#define SC2730_DCDC_CPU_PD_MASK		BIT(4)
+#define SC2730_DCDC_GPU_PD_MASK		BIT(3)
+#define SC2730_DCDC_CORE_PD_MASK	BIT(5)
+#define SC2730_DCDC_MODEM_PD_MASK	BIT(11)
+#define SC2730_DCDC_MEM_PD_MASK		BIT(6)
+#define SC2730_DCDC_MEMQ_PD_MASK	BIT(12)
+#define SC2730_DCDC_GEN0_PD_MASK	BIT(8)
+#define SC2730_DCDC_GEN1_PD_MASK	BIT(7)
+#define SC2730_DCDC_SRAM_PD_MASK	BIT(13)
+#define SC2730_LDO_AVDD18_PD_MASK	BIT(2)
+#define SC2730_LDO_VDDRF18_PD_MASK	BIT(0)
+#define SC2730_LDO_VDDCAMIO_PD_MASK	BIT(0)
+#define SC2730_LDO_VDDWCN_PD_MASK	BIT(0)
+#define SC2730_LDO_VDDCAMD1_PD_MASK	BIT(0)
+#define SC2730_LDO_VDDCAMD0_PD_MASK	BIT(0)
+#define SC2730_LDO_VDDRF1V25_PD_MASK	BIT(0)
+#define SC2730_LDO_AVDD12_PD_MASK	BIT(0)
+#define SC2730_LDO_VDDCAMA0_PD_MASK	BIT(0)
+#define SC2730_LDO_VDDCAMA1_PD_MASK	BIT(0)
+#define SC2730_LDO_VDDCAMMOT_PD_MASK	BIT(0)
+#define SC2730_LDO_VDDSIM2_PD_MASK	BIT(0)
+#define SC2730_LDO_VDDEMMCCORE_PD_MASK	BIT(0)
+#define SC2730_LDO_VDDSDCORE_PD_MASK	BIT(0)
+#define SC2730_LDO_VDDSDIO_PD_MASK	BIT(0)
+#define SC2730_LDO_VDD28_PD_MASK	BIT(1)
+#define SC2730_LDO_VDDWIFIPA_PD_MASK	BIT(0)
+#define SC2730_LDO_VDD18_DCXO_PD_MASK	BIT(10)
+#define SC2730_LDO_VDDUSB33_PD_MASK	BIT(0)
+#define SC2730_LDO_VDDLDO0_PD_MASK	BIT(0)
+#define SC2730_LDO_VDDLDO1_PD_MASK	BIT(0)
+#define SC2730_LDO_VDDLDO2_PD_MASK	BIT(0)
+#define SC2730_LDO_VDDKPLED_PD_MASK	BIT(15)
+
+/*
+ * SC2730 vsel register
+ */
+#define SC2730_DCDC_CPU_VOL		(SC2730_REGULATOR_BASE + 0x44)
+#define SC2730_DCDC_GPU_VOL		(SC2730_REGULATOR_BASE + 0x54)
+#define SC2730_DCDC_CORE_VOL		(SC2730_REGULATOR_BASE + 0x64)
+#define SC2730_DCDC_MODEM_VOL		(SC2730_REGULATOR_BASE + 0x74)
+#define SC2730_DCDC_MEM_VOL		(SC2730_REGULATOR_BASE + 0x84)
+#define SC2730_DCDC_MEMQ_VOL		(SC2730_REGULATOR_BASE + 0x94)
+#define SC2730_DCDC_GEN0_VOL		(SC2730_REGULATOR_BASE + 0xa4)
+#define SC2730_DCDC_GEN1_VOL		(SC2730_REGULATOR_BASE + 0xb4)
+#define SC2730_DCDC_SRAM_VOL		(SC2730_REGULATOR_BASE + 0xdc)
+#define SC2730_LDO_AVDD18_VOL		(SC2730_REGULATOR_BASE + 0x104)
+#define SC2730_LDO_VDDRF18_VOL		(SC2730_REGULATOR_BASE + 0x110)
+#define SC2730_LDO_VDDCAMIO_VOL		(SC2730_REGULATOR_BASE + 0x28)
+#define SC2730_LDO_VDDWCN_VOL		(SC2730_REGULATOR_BASE + 0x120)
+#define SC2730_LDO_VDDCAMD1_VOL		(SC2730_REGULATOR_BASE + 0x12c)
+#define SC2730_LDO_VDDCAMD0_VOL		(SC2730_REGULATOR_BASE + 0x138)
+#define SC2730_LDO_VDDRF1V25_VOL	(SC2730_REGULATOR_BASE + 0x144)
+#define SC2730_LDO_AVDD12_VOL		(SC2730_REGULATOR_BASE + 0x150)
+#define SC2730_LDO_VDDCAMA0_VOL		(SC2730_REGULATOR_BASE + 0x15c)
+#define SC2730_LDO_VDDCAMA1_VOL		(SC2730_REGULATOR_BASE + 0x168)
+#define SC2730_LDO_VDDCAMMOT_VOL	(SC2730_REGULATOR_BASE + 0x174)
+#define SC2730_LDO_VDDSIM2_VOL		(SC2730_REGULATOR_BASE + 0x198)
+#define SC2730_LDO_VDDEMMCCORE_VOL	(SC2730_REGULATOR_BASE + 0x1a4)
+#define SC2730_LDO_VDDSDCORE_VOL	(SC2730_REGULATOR_BASE + 0x1b0)
+#define SC2730_LDO_VDDSDIO_VOL		(SC2730_REGULATOR_BASE + 0x1bc)
+#define SC2730_LDO_VDD28_VOL		(SC2730_REGULATOR_BASE + 0x1c8)
+#define SC2730_LDO_VDDWIFIPA_VOL	(SC2730_REGULATOR_BASE + 0x1d4)
+#define SC2730_LDO_VDD18_DCXO_VOL	(SC2730_REGULATOR_BASE + 0x1e0)
+#define SC2730_LDO_VDDUSB33_VOL		(SC2730_REGULATOR_BASE + 0x1ec)
+#define SC2730_LDO_VDDLDO0_VOL		(SC2730_REGULATOR_BASE + 0x1f8)
+#define SC2730_LDO_VDDLDO1_VOL		(SC2730_REGULATOR_BASE + 0x204)
+#define SC2730_LDO_VDDLDO2_VOL		(SC2730_REGULATOR_BASE + 0x210)
+#define SC2730_LDO_VDDKPLED_VOL		(SC2730_REGULATOR_BASE + 0x38c)
+
+/*
+ * SC2730 vsel register mask
+ */
+#define SC2730_DCDC_CPU_VOL_MASK	GENMASK(8, 0)
+#define SC2730_DCDC_GPU_VOL_MASK	GENMASK(8, 0)
+#define SC2730_DCDC_CORE_VOL_MASK	GENMASK(8, 0)
+#define SC2730_DCDC_MODEM_VOL_MASK	GENMASK(8, 0)
+#define SC2730_DCDC_MEM_VOL_MASK	GENMASK(7, 0)
+#define SC2730_DCDC_MEMQ_VOL_MASK	GENMASK(8, 0)
+#define SC2730_DCDC_GEN0_VOL_MASK	GENMASK(7, 0)
+#define SC2730_DCDC_GEN1_VOL_MASK	GENMASK(7, 0)
+#define SC2730_DCDC_SRAM_VOL_MASK	GENMASK(8, 0)
+#define SC2730_LDO_AVDD18_VOL_MASK	GENMASK(5, 0)
+#define SC2730_LDO_VDDRF18_VOL_MASK	GENMASK(5, 0)
+#define SC2730_LDO_VDDCAMIO_VOL_MASK	GENMASK(5, 0)
+#define SC2730_LDO_VDDWCN_VOL_MASK	GENMASK(5, 0)
+#define SC2730_LDO_VDDCAMD1_VOL_MASK	GENMASK(4, 0)
+#define SC2730_LDO_VDDCAMD0_VOL_MASK	GENMASK(4, 0)
+#define SC2730_LDO_VDDRF1V25_VOL_MASK	GENMASK(4, 0)
+#define SC2730_LDO_AVDD12_VOL_MASK	GENMASK(4, 0)
+#define SC2730_LDO_VDDCAMA0_VOL_MASK	GENMASK(7, 0)
+#define SC2730_LDO_VDDCAMA1_VOL_MASK	GENMASK(7, 0)
+#define SC2730_LDO_VDDCAMMOT_VOL_MASK	GENMASK(7, 0)
+#define SC2730_LDO_VDDSIM2_VOL_MASK	GENMASK(7, 0)
+#define SC2730_LDO_VDDEMMCCORE_VOL_MASK	GENMASK(7, 0)
+#define SC2730_LDO_VDDSDCORE_VOL_MASK	GENMASK(7, 0)
+#define SC2730_LDO_VDDSDIO_VOL_MASK	GENMASK(7, 0)
+#define SC2730_LDO_VDD28_VOL_MASK	GENMASK(7, 0)
+#define SC2730_LDO_VDDWIFIPA_VOL_MASK	GENMASK(7, 0)
+#define SC2730_LDO_VDD18_DCXO_VOL_MASK	GENMASK(7, 0)
+#define SC2730_LDO_VDDUSB33_VOL_MASK	GENMASK(7, 0)
+#define SC2730_LDO_VDDLDO0_VOL_MASK	GENMASK(7, 0)
+#define SC2730_LDO_VDDLDO1_VOL_MASK	GENMASK(7, 0)
+#define SC2730_LDO_VDDLDO2_VOL_MASK	GENMASK(7, 0)
+#define SC2730_LDO_VDDKPLED_VOL_MASK	GENMASK(14, 7)
+
+enum sc2730_regulator_id {
+	SC2730_DCDC_CPU,
+	SC2730_DCDC_GPU,
+	SC2730_DCDC_CORE,
+	SC2730_DCDC_MODEM,
+	SC2730_DCDC_MEM,
+	SC2730_DCDC_MEMQ,
+	SC2730_DCDC_GEN0,
+	SC2730_DCDC_GEN1,
+	SC2730_DCDC_SRAM,
+	SC2730_LDO_AVDD18,
+	SC2730_LDO_VDDRF18,
+	SC2730_LDO_VDDCAMIO,
+	SC2730_LDO_VDDWCN,
+	SC2730_LDO_VDDCAMD1,
+	SC2730_LDO_VDDCAMD0,
+	SC2730_LDO_VDDRF1V25,
+	SC2730_LDO_AVDD12,
+	SC2730_LDO_VDDCAMA0,
+	SC2730_LDO_VDDCAMA1,
+	SC2730_LDO_VDDCAMMOT,
+	SC2730_LDO_VDDSIM2,
+	SC2730_LDO_VDDEMMCCORE,
+	SC2730_LDO_VDDSDCORE,
+	SC2730_LDO_VDDSDIO,
+	SC2730_LDO_VDD28,
+	SC2730_LDO_VDDWIFIPA,
+	SC2730_LDO_VDD18_DCXO,
+	SC2730_LDO_VDDUSB33,
+	SC2730_LDO_VDDLDO0,
+	SC2730_LDO_VDDLDO1,
+	SC2730_LDO_VDDLDO2,
+	SC2730_LDO_VDDKPLED,
+};
+
+static const struct regulator_ops sc2730_regu_linear_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = regulator_list_voltage_linear,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+};
+
+#define SC2730_REGU_LINEAR(_id, of_name, en_reg, en_mask, vreg, vmask,	\
+			   vstep, vmin, vmax, min_sel) {		\
+	.name			= #_id,					\
+	.of_match		= of_name,				\
+	.regulators_node	= "regulators",				\
+	.ops			= &sc2730_regu_linear_ops,		\
+	.type			= REGULATOR_VOLTAGE,			\
+	.id			= SC2730_##_id,				\
+	.owner			= THIS_MODULE,				\
+	.min_uV			= vmin,					\
+	.n_voltages		= ((vmax) - (vmin)) / (vstep) + 1,	\
+	.uV_step		= vstep,				\
+	.enable_is_inverted	= true,					\
+	.enable_val		= 0,					\
+	.enable_reg		= en_reg,				\
+	.enable_mask		= en_mask,				\
+	.vsel_reg		= vreg,					\
+	.vsel_mask		= vmask,				\
+	.linear_min_sel		= min_sel,				\
+}
+
+static const struct regulator_desc regulators[] = {
+	SC2730_REGU_LINEAR(DCDC_CPU, "dcdc-cpu", SC2730_POWER_PD_SW,
+			   SC2730_DCDC_CPU_PD_MASK, SC2730_DCDC_CPU_VOL,
+			   SC2730_DCDC_CPU_VOL_MASK, 3125, 0, 1596875,
+			   0),
+	SC2730_REGU_LINEAR(DCDC_GPU, "dcdc-gpu", SC2730_POWER_PD_SW,
+			   SC2730_DCDC_GPU_PD_MASK, SC2730_DCDC_GPU_VOL,
+			   SC2730_DCDC_GPU_VOL_MASK, 3125, 0, 1596875,
+			   0),
+	SC2730_REGU_LINEAR(DCDC_CORE, "dcdc-core", SC2730_POWER_PD_SW,
+			   SC2730_DCDC_CORE_PD_MASK, SC2730_DCDC_CORE_VOL,
+			   SC2730_DCDC_CORE_VOL_MASK, 3125, 0, 1596875,
+			   0),
+	SC2730_REGU_LINEAR(DCDC_MODEM, "dcdc-modem", SC2730_POWER_PD_SW,
+			   SC2730_DCDC_MODEM_PD_MASK, SC2730_DCDC_MODEM_VOL,
+			   SC2730_DCDC_MODEM_VOL_MASK, 3125, 0, 1596875,
+			   0),
+	SC2730_REGU_LINEAR(DCDC_MEM, "dcdc-mem", SC2730_POWER_PD_SW,
+			   SC2730_DCDC_MEM_PD_MASK, SC2730_DCDC_MEM_VOL,
+			   SC2730_DCDC_MEM_VOL_MASK, 6250, 0, 1593750,
+			   0),
+	SC2730_REGU_LINEAR(DCDC_MEMQ, "dcdc-memq", SC2730_POWER_PD_SW,
+			   SC2730_DCDC_MEMQ_PD_MASK, SC2730_DCDC_MEMQ_VOL,
+			   SC2730_DCDC_MEMQ_VOL_MASK, 3125, 0, 1596875,
+			   0),
+	SC2730_REGU_LINEAR(DCDC_GEN0, "dcdc-gen0", SC2730_POWER_PD_SW,
+			   SC2730_DCDC_GEN0_PD_MASK, SC2730_DCDC_GEN0_VOL,
+			   SC2730_DCDC_GEN0_VOL_MASK, 9375, 20000, 2410625,
+			   0),
+	SC2730_REGU_LINEAR(DCDC_GEN1, "dcdc-gen1", SC2730_POWER_PD_SW,
+			   SC2730_DCDC_GEN1_PD_MASK, SC2730_DCDC_GEN1_VOL,
+			   SC2730_DCDC_GEN1_VOL_MASK, 6250, 50000, 1643750,
+			   0),
+	SC2730_REGU_LINEAR(DCDC_SRAM, "dcdc-sram", SC2730_POWER_PD_SW,
+			   SC2730_DCDC_SRAM_PD_MASK, SC2730_DCDC_SRAM_VOL,
+			   SC2730_DCDC_SRAM_VOL_MASK, 3125, 0, 1596875,
+			   0),
+	SC2730_REGU_LINEAR(LDO_AVDD18, "ldo-avdd18", SC2730_POWER_PD_SW,
+			   SC2730_LDO_AVDD18_PD_MASK, SC2730_LDO_AVDD18_VOL,
+			   SC2730_LDO_AVDD18_VOL_MASK, 10000, 1175000, 1805000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDDRF18, "ldo-vddrf18", SC2730_LDO_VDDRF18_PD,
+			   SC2730_LDO_VDDRF18_PD_MASK, SC2730_LDO_VDDRF18_VOL,
+			   SC2730_LDO_VDDRF18_VOL_MASK, 10000, 1175000, 1805000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDDCAMIO, "ldo-vddcamio", SC2730_LDO_VDDCAMIO_PD,
+			   SC2730_LDO_VDDCAMIO_PD_MASK, SC2730_LDO_VDDCAMIO_VOL,
+			   SC2730_LDO_VDDCAMIO_VOL_MASK, 10000, 1200000, 1830000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDDWCN, "ldo-vddwcn", SC2730_LDO_VDDWCN_PD,
+			   SC2730_LDO_VDDWCN_PD_MASK, SC2730_LDO_VDDWCN_VOL,
+			   SC2730_LDO_VDDWCN_VOL_MASK, 15000, 900000, 1845000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDDCAMD1, "ldo-vddcamd1", SC2730_LDO_VDDCAMD1_PD,
+			   SC2730_LDO_VDDCAMD1_PD_MASK, SC2730_LDO_VDDCAMD1_VOL,
+			   SC2730_LDO_VDDCAMD1_VOL_MASK, 15000, 900000, 1365000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDDCAMD0, "ldo-vddcamd0", SC2730_LDO_VDDCAMD0_PD,
+			   SC2730_LDO_VDDCAMD0_PD_MASK, SC2730_LDO_VDDCAMD0_VOL,
+			   SC2730_LDO_VDDCAMD0_VOL_MASK, 15000, 900000, 1365000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDDRF1V25, "ldo-vddrf1v25", SC2730_LDO_VDDRF1V25_PD,
+			   SC2730_LDO_VDDRF1V25_PD_MASK, SC2730_LDO_VDDRF1V25_VOL,
+			   SC2730_LDO_VDDRF1V25_VOL_MASK, 15000, 900000, 1365000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_AVDD12, "ldo-avdd12", SC2730_LDO_AVDD12_PD,
+			   SC2730_LDO_AVDD12_PD_MASK, SC2730_LDO_AVDD12_VOL,
+			   SC2730_LDO_AVDD12_VOL_MASK, 15000, 900000, 1365000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDDCAMA0, "ldo-vddcama0", SC2730_LDO_VDDCAMA0_PD,
+			   SC2730_LDO_VDDCAMA0_PD_MASK, SC2730_LDO_VDDCAMA0_VOL,
+			   SC2730_LDO_VDDCAMA0_VOL_MASK, 10000, 1200000, 3750000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDDCAMA1, "ldo-vddcama1", SC2730_LDO_VDDCAMA1_PD,
+			   SC2730_LDO_VDDCAMA1_PD_MASK, SC2730_LDO_VDDCAMA1_VOL,
+			   SC2730_LDO_VDDCAMA1_VOL_MASK, 10000, 1200000, 3750000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDDCAMMOT, "ldo-vddcammot", SC2730_LDO_VDDCAMMOT_PD,
+			   SC2730_LDO_VDDCAMMOT_PD_MASK, SC2730_LDO_VDDCAMMOT_VOL,
+			   SC2730_LDO_VDDCAMMOT_VOL_MASK, 10000, 1200000, 3750000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDDSIM2, "ldo-vddsim2", SC2730_LDO_VDDSIM2_PD,
+			   SC2730_LDO_VDDSIM2_PD_MASK, SC2730_LDO_VDDSIM2_VOL,
+			   SC2730_LDO_VDDSIM2_VOL_MASK, 10000, 1200000, 3750000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDDEMMCCORE, "ldo-vddemmccore", SC2730_LDO_VDDEMMCCORE_PD,
+			   SC2730_LDO_VDDEMMCCORE_PD_MASK, SC2730_LDO_VDDEMMCCORE_VOL,
+			   SC2730_LDO_VDDEMMCCORE_VOL_MASK, 10000, 1200000, 3750000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDDSDCORE, "ldo-vddsdcore", SC2730_LDO_VDDSDCORE_PD,
+			   SC2730_LDO_VDDSDCORE_PD_MASK, SC2730_LDO_VDDSDCORE_VOL,
+			   SC2730_LDO_VDDSDCORE_VOL_MASK, 10000, 1200000, 3750000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDDSDIO, "ldo-vddsdio", SC2730_LDO_VDDSDIO_PD,
+			   SC2730_LDO_VDDSDIO_PD_MASK, SC2730_LDO_VDDSDIO_VOL,
+			   SC2730_LDO_VDDSDIO_VOL_MASK, 10000, 1200000, 3750000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDD28, "ldo-vdd28", SC2730_POWER_PD_SW,
+			   SC2730_LDO_VDD28_PD_MASK, SC2730_LDO_VDD28_VOL,
+			   SC2730_LDO_VDD28_VOL_MASK, 10000, 1200000, 3750000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDDWIFIPA, "ldo-vddwifipa", SC2730_LDO_VDDWIFIPA_PD,
+			   SC2730_LDO_VDDWIFIPA_PD_MASK, SC2730_LDO_VDDWIFIPA_VOL,
+			   SC2730_LDO_VDDWIFIPA_VOL_MASK, 10000, 1200000, 3750000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDD18_DCXO, "ldo-vdd18-dcxo", SC2730_POWER_PD_SW,
+			   SC2730_LDO_VDD18_DCXO_PD_MASK, SC2730_LDO_VDD18_DCXO_VOL,
+			   SC2730_LDO_VDD18_DCXO_VOL_MASK, 10000, 1200000, 3750000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDDUSB33, "ldo-vddusb33", SC2730_LDO_VDDUSB33_PD,
+			   SC2730_LDO_VDDUSB33_PD_MASK, SC2730_LDO_VDDUSB33_VOL,
+			   SC2730_LDO_VDDUSB33_VOL_MASK, 10000, 1200000, 3750000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDDLDO0, "ldo-vddldo0", SC2730_LDO_VDDLDO0_PD,
+			   SC2730_LDO_VDDLDO0_PD_MASK, SC2730_LDO_VDDLDO0_VOL,
+			   SC2730_LDO_VDDLDO0_VOL_MASK, 10000, 1200000, 3750000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDDLDO1, "ldo-vddldo1", SC2730_LDO_VDDLDO1_PD,
+			   SC2730_LDO_VDDLDO1_PD_MASK, SC2730_LDO_VDDLDO1_VOL,
+			   SC2730_LDO_VDDLDO1_VOL_MASK, 10000, 1200000, 3750000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDDLDO2, "ldo-vddldo2", SC2730_LDO_VDDLDO2_PD,
+			   SC2730_LDO_VDDLDO2_PD_MASK, SC2730_LDO_VDDLDO2_VOL,
+			   SC2730_LDO_VDDLDO2_VOL_MASK, 10000, 1200000, 3750000,
+			   0),
+	SC2730_REGU_LINEAR(LDO_VDDKPLED, "ldo-vddkpled", SC2730_LDO_VDDKPLED_PD,
+			   SC2730_LDO_VDDKPLED_PD_MASK, SC2730_LDO_VDDKPLED_VOL,
+			   SC2730_LDO_VDDKPLED_VOL_MASK, 10000, 1200000, 3750000,
+			   0),
+};
+
+static int sc2730_regulator_unlock(struct regmap *regmap)
+{
+	return regmap_write(regmap, SC2730_PWR_WR_PROT, SC2730_WR_UNLOCK_VALUE);
+}
+
+static int sc2730_regulator_probe(struct platform_device *pdev)
+{
+	int i, ret;
+	struct regmap *regmap;
+	struct regulator_config config = { };
+	struct regulator_dev *rdev;
+
+	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!regmap) {
+		dev_err(&pdev->dev, "failed to get regmap.\n");
+		return -ENODEV;
+	}
+
+	ret = sc2730_regulator_unlock(regmap);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to release regulator lock\n");
+		return ret;
+	}
+
+	config.dev = pdev->dev.parent;
+	config.regmap = regmap;
+
+	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
+		rdev = devm_regulator_register(&pdev->dev, &regulators[i], &config);
+		if (IS_ERR(rdev)) {
+			dev_err(&pdev->dev, "failed to register regulator %s\n",
+				regulators[i].name);
+			return PTR_ERR(rdev);
+		}
+	}
+
+	return 0;
+}
+
+static const struct platform_device_id sc2730_regulator_id_table[] = {
+	{ "sc2730-regulator" },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, sc2730_regulator_id_table);
+
+static struct platform_driver sc2730_regulator_driver = {
+	.driver = {
+		.name = "sc2730-regulator",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe = sc2730_regulator_probe,
+	.id_table = sc2730_regulator_id_table,
+};
+
+module_platform_driver(sc2730_regulator_driver);
+
+MODULE_AUTHOR("Zhongfa Wang <zhongfa.wang@unisoc.com>");
+MODULE_DESCRIPTION("Spreadtrum SC2730 regulator driver");
+MODULE_LICENSE("GPL");

-- 
2.51.0

