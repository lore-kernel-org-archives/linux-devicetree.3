Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599520;
	b=ZVFfMaoCDWouaxstwR8d5g/aKhMABRVRIEBN55s8D8JtKf/mZtNDU6Ycj+0JRt4alUmz
	 PzO5artBrHwtK0ISiiVIKGPpjdc2lw9icRpmnNLH3x4UExBPBQXwfBZS0sp6SEJZd4qnm
	 KZGLZeSu5M9zYaMQXaB1aJwKso5GlvKo/hWznpt1l/xJNY1pWIqiYox0l2aTAfQmXMj2L
	 tsHFG7Ojj5zlNFnYvF+skxR1QMTgkz4hjCNgmFHMW85gh7s3GAnupfaCa8e+gGw5CCsN1
	 PerH1RB/N3rnNb69zQC4asd1P7lj0Udn+6m546NeqqqD+rBhbwE2Rl9dmy9Otaltc9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599520;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=aB7zHHNpHRUOAhRubIfiMWf3awkmEEH+5/Zcgv96f5o=;
	b=GjbE0JUDirXOmAh9kfPlZjurVKOADTlEwSD8kFS+HSDEwjVLgJq9y0ppm0/r0lWshP1D
	 KcInMR5x7YJtctURhPOzbfXI73iubRGZfBv/5035qdEZbz60rc+7Xd8Fg5C51dcceDHDk
	 NrbKZ925kYkIrUamwbSbARdetbACHklVoYlIszOd4EOfwxHCyqq/+gOrcLXC5g3G9Em8b
	 5YS12ajpZdvod8MkMT3/HBrljVG6IrfFDSd9t7y9h0ErgRrIhwVG5+iyvlIWFgs6D1IUB
	 zKMO6qbOgyBjzIN/OLhYNbcBBkJ0/9VOJUdP/4jqQ9po7DcDnzdzWdKST4liUGuVkHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF16606A327;
	Mon,  2 Nov 2026 06:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DF16606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=aB7zHHNpHRUOAhRubIfiMWf3awkmEEH+5/
	Zcgv96f5o=; b=P639pk0jQz7FPiRtnOIOujMOtPWw7XP5v0ThcNhKVGV9GpusQX
	KNAe1dcxJyaJMKJ/NJNxf3LNbW6MdwyoYBuav5RQmsb1/hYQ8ObIIylazra6+c9X
	A6GLBy6Q6hRyNbxIrbz/rMs+S8ILqyT2gqSzTt+YA0/2stKi6UileNqd4=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.182.90])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCnGzAKKOhq6vN1AA--.1803S4;
	Mon, 02 Nov 2026 14:05:03 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-arm-msm@vger.kernel.org,
	linux-regulator@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v5 2/4] regulator: willsemi,wl2868c: add the WL2868C camera PMIC driver
Date: Mon,  2 Nov 2026 14:04:56 +0800
Message-ID: <20261102060458.461372-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102060458.461372-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261102060458.461372-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgCnGzAKKOhq6vN1AA--.1803S4
X-Coremail-Antispam: 1UD129KBjvJXoW3JFyxuF1kur1UWrW7tw18Xwb_yoWfJFy8pa
	n8XFZIkr48GFWrWrZ7CF12k3W5Wwn2vw1akryrC3yfZw1ayF97AF9I9Fy5AFykGr1kWFyS
	qas8JFyUCF4UWa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7
	CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7IUY5C7UUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARESB2rnk1cDXgBbsK

The WL2868C is an I2C camera power management IC with seven LDOs.
LDO1 and LDO2 are fed from VIN12 and cover 0.496 V to 1.512 V with a
7-bit voltage selector; LDO3 and LDO4 share VIN34, and LDO5 to LDO7
have one input each, covering 1.504 V to 3.544 V with an 8-bit
selector. All outputs step by 8 mV.

Every output is gated by a per-LDO bit in the enable register, and the
whole chip is additionally gated by the SYS_EN bit in the same
register. The driver sets SYS_EN together with the LDO bit on enable
and requires both to read back before reporting the regulator as
enabled, because no output comes up while SYS_EN is clear. An
optional active-low RST_N GPIO is released during probe, followed by
a 1 ms delay for the device to come up, and is asserted again when
the driver is unbound.

The device is used on the Lenovo Legion Tab (TB322FC, SM8750): the
rear camera (samsung,s5kjns) takes DVDD from LDO1, AVDD from LDO4 and
DOVDD from LDO7, and the rear VCM (giantec,gt9764) takes VDD from LDO5
and VDDIO from LDO7. The front sensor takes DVDD from LDO2, AVDD from
LDO3 and DOVDD from LDO7, and its supply wiring follows with its
pending binding series. The next patch wires the documented supplies
up in the board file.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 MAINTAINERS                           |   7 ++
 drivers/regulator/Kconfig             |  11 ++
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/wl2868c-regulator.c | 155 ++++++++++++++++++++++++++
 4 files changed, 174 insertions(+)
 create mode 100644 drivers/regulator/wl2868c-regulator.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d..a334308798 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29413,6 +29413,13 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/hid-wiimote*
 
+WILLSEMI WL2868C CAMERA PMIC
+M:	Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
+F:	drivers/regulator/wl2868c-regulator.c
+
 WILOCITY WIL6210 WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 89789ac7a7..53f5b1527f 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1858,6 +1858,17 @@ config REGULATOR_VQMMC_IPQ4019
 	  This driver provides support for the VQMMC LDO I/0
 	  voltage regulator of the IPQ4019 SD/EMMC controller.
 
+config REGULATOR_WL2868C
+	tristate "Will Semiconductor WL2868C regulator"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Support the seven LDO outputs of the Will Semiconductor WL2868C
+	  camera power management IC.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called wl2868c-regulator.
+
 config REGULATOR_WM831X
 	tristate "Wolfson Microelectronics WM831x PMIC regulators"
 	depends on MFD_WM831X
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8d..d706959588 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -212,6 +212,7 @@ obj-$(CONFIG_REGULATOR_RZG2L_VBCTRL) += renesas-usb-vbus-regulator.o
 obj-$(CONFIG_REGULATOR_VCTRL) += vctrl-regulator.o
 obj-$(CONFIG_REGULATOR_VEXPRESS) += vexpress-regulator.o
 obj-$(CONFIG_REGULATOR_VQMMC_IPQ4019) += vqmmc-ipq4019-regulator.o
+obj-$(CONFIG_REGULATOR_WL2868C) += wl2868c-regulator.o
 obj-$(CONFIG_REGULATOR_WM831X) += wm831x-dcdc.o
 obj-$(CONFIG_REGULATOR_WM831X) += wm831x-isink.o
 obj-$(CONFIG_REGULATOR_WM831X) += wm831x-ldo.o
diff --git a/drivers/regulator/wl2868c-regulator.c b/drivers/regulator/wl2868c-regulator.c
new file mode 100644
index 0000000000..9c4f4240b1
--- /dev/null
+++ b/drivers/regulator/wl2868c-regulator.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Will Semiconductor WL2868C seven-channel camera regulator driver.
+ *
+ * Copyright (C) 2026 Qianhui Xu
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+
+#define WL2868C_DEVICE_ID		0x00
+#define WL2868C_DEVICE_ID_VALUE		0x82
+#define WL2868C_LDO_ENABLE		0x0e
+#define WL2868C_SYS_ENABLE		BIT(7)
+
+static int wl2868c_enable(struct regulator_dev *rdev)
+{
+	/*
+	 * SYS_EN is the master enable of the chip: no output comes up unless
+	 * it is set together with the per-LDO bit.
+	 */
+	return regmap_update_bits(rdev->regmap, WL2868C_LDO_ENABLE,
+				  WL2868C_SYS_ENABLE | rdev->desc->enable_mask,
+				  WL2868C_SYS_ENABLE | rdev->desc->enable_mask);
+}
+
+static int wl2868c_is_enabled(struct regulator_dev *rdev)
+{
+	unsigned int mask = WL2868C_SYS_ENABLE | rdev->desc->enable_mask;
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(rdev->regmap, WL2868C_LDO_ENABLE, &value);
+	if (ret)
+		return ret;
+
+	return (value & mask) == mask;
+}
+
+static const struct regulator_ops wl2868c_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.map_voltage = regulator_map_voltage_linear,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.enable = wl2868c_enable,
+	.disable = regulator_disable_regmap,
+	.is_enabled = wl2868c_is_enabled,
+};
+
+/*
+ * LDO1 and LDO2 have a 7-bit voltage selector, the other five have an 8-bit
+ * one; all of them step by 8 mV.
+ */
+#define WL2868C_LDO(_num, _supply, _min, _n_voltages, _vsel_reg, _mask, _en) { \
+	.name = "ldo" #_num,				\
+	.of_match = "ldo" #_num,			\
+	.regulators_node = "regulators",		\
+	.id = (_num) - 1,				\
+	.type = REGULATOR_VOLTAGE,			\
+	.owner = THIS_MODULE,				\
+	.ops = &wl2868c_ops,				\
+	.supply_name = _supply,				\
+	.min_uV = _min,					\
+	.uV_step = 8000,				\
+	.n_voltages = _n_voltages,			\
+	.vsel_reg = _vsel_reg,				\
+	.vsel_mask = _mask,				\
+	.enable_reg = WL2868C_LDO_ENABLE,		\
+	.enable_mask = _en,				\
+	.enable_time = 150,				\
+}
+
+static const struct regulator_desc wl2868c_regulators[] = {
+	WL2868C_LDO(1, "vin12", 496000, 128, 0x03, 0x7f, BIT(0)),
+	WL2868C_LDO(2, "vin12", 496000, 128, 0x04, 0x7f, BIT(1)),
+	WL2868C_LDO(3, "vin34", 1504000, 256, 0x05, 0xff, BIT(2)),
+	WL2868C_LDO(4, "vin34", 1504000, 256, 0x06, 0xff, BIT(3)),
+	WL2868C_LDO(5, "vin5", 1504000, 256, 0x07, 0xff, BIT(4)),
+	WL2868C_LDO(6, "vin6", 1504000, 256, 0x08, 0xff, BIT(5)),
+	WL2868C_LDO(7, "vin7", 1504000, 256, 0x09, 0xff, BIT(6)),
+};
+
+static const struct regmap_config wl2868c_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0x25,
+};
+
+static void wl2868c_reset(void *data)
+{
+	gpiod_set_value_cansleep(data, 1);
+}
+
+static int wl2868c_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct regulator_config config = { .dev = dev };
+	struct regulator_dev *rdev;
+	struct gpio_desc *reset;
+	unsigned int id;
+	int ret, i;
+
+	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get reset GPIO\n");
+
+	if (reset) {
+		ret = devm_add_action_or_reset(dev, wl2868c_reset, reset);
+		if (ret)
+			return ret;
+		fsleep(1000);
+	}
+
+	config.regmap = devm_regmap_init_i2c(client, &wl2868c_regmap_config);
+	if (IS_ERR(config.regmap))
+		return dev_err_probe(dev, PTR_ERR(config.regmap),
+				     "Failed to create regmap\n");
+
+	ret = regmap_read(config.regmap, WL2868C_DEVICE_ID, &id);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to read device ID\n");
+	if (id != WL2868C_DEVICE_ID_VALUE)
+		return dev_err_probe(dev, -ENODEV, "Unexpected device ID: %#x\n", id);
+
+	for (i = 0; i < ARRAY_SIZE(wl2868c_regulators); i++) {
+		rdev = devm_regulator_register(dev, &wl2868c_regulators[i], &config);
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "Failed to register LDO%d\n", i + 1);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id wl2868c_of_match[] = {
+	{ .compatible = "willsemi,wl2868c" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wl2868c_of_match);
+
+static struct i2c_driver wl2868c_driver = {
+	.driver = {
+		.name = "wl2868c",
+		.of_match_table = wl2868c_of_match,
+	},
+	.probe = wl2868c_probe,
+};
+module_i2c_driver(wl2868c_driver);
+
+MODULE_DESCRIPTION("Will Semiconductor WL2868C regulator driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

