Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FDA3B7750
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 07:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778052854; cv=none; b=mz7Fzl3RQV6aPrjcy3GK8fDAnUp//lK7XiTjwfAb+FhG8LfSN084iNDetfXEJf8Szi78abP7SaBme3R5XcpyDeLZS4RC45BEWCDfEW1OvHPdMh0DL9a2NB+GzEH2NbYLlvd0OKXrOfDWESbRx9o7JYXSf90IkLiFOjuPMQzlAEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778052854; c=relaxed/simple;
	bh=jguWteL59hRNCLg5EFZn9vJ/WOWKO9Bmxmk1QhpdmHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ArG4pWNM2uh3w3iuFLlnQSE1QPRjkJUDHNIc2HOyOfDa01l9D6emQ1zGAZoK9OIz0zIlFEfklVaXq5rDnBax78pjXNsvSmvyWIGPJo5wE5tlZX2KMoiV1wgDVFq6cNy1YlzWXnc1yfNdhaLEuzh5Fhi7TocJRN+MbmWV3PmLfck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KHdsLH3E; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KHdsLH3E"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so76864395e9.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 00:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778052851; x=1778657651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OxKkMh8u9xkmmjdoRwc/n9KG6W4dpMKfpCUekbP5XKw=;
        b=KHdsLH3EyosJBOjW9NcaygaY1TYM3UO2DQN3yi8nRpOw5ewK6vrREYvxW8iN143HsZ
         X5Z4wprniXbNVr8oiu9McYi+zTB5fpIHK8ldiVlY+nRJz1FTCHKH88DiJt4t3CX8mwX5
         fMzvBZ/UK2i8/VTvPqoIk5nc7uQgxzUn6+MpgbJCbqsl7KJT/+ni+iQ7eYUsqfTFEemV
         TLnxRzb/UBVsCr47dFsS8s249WyKEmYt0ak6BugCRgF+xVuBvfZ+3E3NjnfwbrylsWuD
         flxHokeoZUpquhYq7rmnBkI7OhOrSHXnpqwk9zJMfpJPMDWDT8oApdlluOh4vXNjkFbU
         TrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778052851; x=1778657651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OxKkMh8u9xkmmjdoRwc/n9KG6W4dpMKfpCUekbP5XKw=;
        b=lgF9LHw5aOvL9V0Pcmeb33ShSe1Zy7SjAMFE0yM/8Uro+I9f4GQGjgoYaMiZLRP1dZ
         VeUtUPTm0T3LZ1YPubgcQ6PNCdHX8uUxXO/xLJ6s84sIGZda2lX69KFRHVXwWxgaUTvq
         hgtX9S/P5yL7wYlBuidpYariGKz+yHMW6vSgsJXgEdnbX+fWLgI//9bPgSWkRQZETVna
         S6X4wgH9aImYQyh5RHDfIXN/9pgy7c+IJ139mh1Fbp9D+6xb6n8iyiJinlmA6+kk2ByT
         6vjcRJkPUHjakn8HDmkrE2L8zx4CEOFMkdW4g+3VAuj9dgdgJ91Ns3QEEdMvB89Ky0qw
         AOOg==
X-Forwarded-Encrypted: i=1; AFNElJ+nowhQL1BQ4QSCVHdo+2aSUKZgxD+tDrCAfpLe0srnpg+A+ZKOOYaBFIWDwNm8cWjFpYacgcxnXEJD@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv2Y/F3vi37d1bXYC2dhbk4GATVRlGniW5XAXV9/m6zoacRlNq
	I6oYPnG27rBmdsxUwwqsL3bI2ZK0/bVfIt1ltUixCXehd4wWHyATuR3ETh/yoVv3kRI=
X-Gm-Gg: AeBDiesyOuMrrdKyXQWJ3EUYMK1hZ2I3MvM8uo0pZV6O4QYE5/CQ+md7NUwcxrk9Grg
	fWPBcWpZaGxhbo/tw/e/fU7OLT1M+0LbgEu6tEmagKkoRDvbxmMlHMJJD8PZo8Y9Zx9iQxT0ngl
	UIxDWKUiGC6sL/4azjnFpSYSyl+FNAO9am1ux+GINwypT6WzzGYyqsDaq0+Tn1P1uorIZCtFJ1f
	pjl67VtsVKVPalX+4NhnDM8uFoPffccpyFQmdKKfH6uJ0gLNAhEI0xl/y354FdBZqunccV4V5vh
	Eery55vp4Oeund/Ec39bcJxxz6Epormj54SjxLUTW+UBqCFPXo1lbL24Zc13DPONM4D3BUzseir
	Rx8i5ldorTZMKcOPv3Ai4dYUx7+ht3cdf3aR+2N3rYoQbTkgA3vV+1iBaTZAV/hKhcrbeqg+Uft
	fcQJijj9JHAea5pRnDUY7PDTqvxcmFwTLLU91SAHcydj42BYDqUPyud/c=
X-Received: by 2002:a05:600c:8211:b0:485:3cf3:1010 with SMTP id 5b1f17b1804b1-48e51e09680mr38734995e9.2.1778052850963;
        Wed, 06 May 2026 00:34:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e52f5e668sm13644835e9.0.2026.05.06.00.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 00:34:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 06 May 2026 09:34:07 +0200
Subject: [PATCH v4 2/2] regulator: add SGM3804 Dual Output driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-2-7495e7905693@linaro.org>
References: <20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-0-7495e7905693@linaro.org>
In-Reply-To: <20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-0-7495e7905693@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11117;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lGb8LHGPGJupxwcOcNncbpuVvnR45zO3KoqDseFuuRw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp+u7vaAIKUm8mIxvQSIklAeWvvWdw5dnf9FU6aeQu
 +W9JFlCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafru7wAKCRB33NvayMhJ0br7D/
 9StJ8tF9oWPE9cCzrf7eACu0yRbne/zVd6HllnM5cCOgELgnA6OuNfXVN1HwbCc82FLtSYwmuLSIRl
 j0chbS1VIMtZlFKuVmN+x2q6NxrGJqsPIvaNYK+3oHW3mP2JZHyNpkbflGTWBaPYbEwMBekFgV11DX
 Neo5tDczZ5nGvZ7POyw/Laz6xtappLVoLofGfeIeVAt+UZKhs2+YRfJ5ThjhOFbcmC7n8hosyQWnhc
 PPUzhA/4EN8ib4v9kswRV0sUzM3K+k4/RO09+XE+DAjF51whLhmjUqTbWI/WCOoAbi8t7eoipfmMt7
 B2MIMrXFy0RBu0xAvYNa2F/TddbrlvRzh/A11mso0Fc2bYauEHoQZLKsr2cwoc5XTiSQAiVKedVBHj
 s64VFZYGkgqip2XlcYDVT/hmXqnfAfNAO/V/iLYv/5FOR8OOLuBbGiKJj9FezqAs/Qb7edxcVEEwfA
 9RYB2cbLLkz4G5osfgKzdJNCeagoxfZd2o5dDMKViVVNkk94hDdMWXXeD9db1qVEOBOEmcOgaHpn3l
 wbf+zKbOxwSvsPHWup/ut+rqiAGUXq6mLalnhXyXfo5m0T7QwS3X5IFofqzW0QE7DK3+fiOciKwrXq
 +rZHHHdueP1bBA3AAQueOyUOBuZbcn9uGswMcC00UDq5OCu/t8dj7Z5P5H5Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: KancyJoe <kancy2333@outlook.com>

Add support for the SG Micro SGM3804 Single Inductor Dual Output
Buck/Boost Converter used to power LCD panels a provide positive
and negative power rails with configurable voltage and active
discharge function for each output.

The SGM3804 is powered by the enable GPIO pins inputs and only
supports I2C write messages.
In order to add flexibility and simplify the driver, the
regmap cache is enabled and populated with default values
since we can't write registers when the 2 GPIOs are down.

Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/regulator/Kconfig             |   7 +
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/sgm3804-regulator.c | 308 ++++++++++++++++++++++++++++++++++
 3 files changed, 316 insertions(+)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index e8002526cfb0..1f444d5f33ae 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1489,6 +1489,13 @@ config REGULATOR_SC2731
 	  This driver provides support for the voltage regulators on the
 	  SC2731 PMIC.
 
+config REGULATOR_SGM3804
+	tristate "SGMicro SGM3804 voltage regulator"
+	depends on I2C && OF
+	select REGMAP_I2C
+	help
+	  This driver supports SGMicro SGM3804 dual-output voltage regulator.
+
 config REGULATOR_SKY81452
 	tristate "Skyworks Solutions SKY81452 voltage regulator"
 	depends on MFD_SKY81452
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 35639f3115fd..98ecbbc3c6b7 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -172,6 +172,7 @@ obj-$(CONFIG_REGULATOR_S2MPA01) += s2mpa01.o
 obj-$(CONFIG_REGULATOR_S2MPS11) += s2mps11.o
 obj-$(CONFIG_REGULATOR_S5M8767) += s5m8767.o
 obj-$(CONFIG_REGULATOR_SC2731) += sc2731-regulator.o
+obj-$(CONFIG_REGULATOR_SGM3804) += sgm3804-regulator.o
 obj-$(CONFIG_REGULATOR_SKY81452) += sky81452-regulator.o
 obj-$(CONFIG_REGULATOR_SLG51000) += slg51000-regulator.o
 obj-$(CONFIG_REGULATOR_SPACEMIT_P1) += spacemit-p1.o
diff --git a/drivers/regulator/sgm3804-regulator.c b/drivers/regulator/sgm3804-regulator.c
new file mode 100644
index 000000000000..8df0507af610
--- /dev/null
+++ b/drivers/regulator/sgm3804-regulator.c
@@ -0,0 +1,308 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// SGMicro SGM3804 regulator Driver
+//
+// Copyright (C) 2025 Kancy Joe <kancy2333@outlook.com>
+// Copyright (C) 2026 Linaro Limited
+// Author: Neil Armstrong <neil.armstrong@linaro.org>
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/gpio/consumer.h>
+
+#define SGM3804_POS_RAIL_VOLTAGE_REG	0x0
+#define SGM3804_NEG_RAIL_VOLTAGE_REG	0x1
+#define SGM3804_RAIL_DISCHARGE_REG	0x3
+
+#define RAIL_VOLTAGE_MASK	GENMASK(5, 0)
+
+#define POS_RAIL_DISCHARGE_EN	BIT(1)
+#define NEG_RAIL_DISCHARGE_EN	BIT(0)
+
+#define RAIL_VOLTAGE_INVALID		RAIL_VOLTAGE_MASK
+#define RAIL_DISCHARGE_REG_DEFAULT	(POS_RAIL_DISCHARGE_EN | NEG_RAIL_DISCHARGE_EN)
+
+#define SGM3804_VOLTAGES_COUNT	40
+
+enum {
+	SGM3804_POS_RAIL = 0,
+	SGM3804_NEG_RAIL,
+	SGM3804_RAIL_COUNT,
+};
+
+/*
+ * The registers are only writable when the gpio is enabled, so
+ * we need to use the cache for read operations and set the regmap
+ * as cache_only when both GPIOs are down.
+ */
+struct sgm3804_data {
+	struct regmap *regmap;
+	/* Protects the regcache state update */
+	struct mutex lock;
+	struct gpio_desc *gpios[SGM3804_RAIL_COUNT];
+};
+
+static const struct linear_range sgm3804_voltages[] = {
+	REGULATOR_LINEAR_RANGE(2400000, 0x20, 0x2f, 100000),
+	REGULATOR_LINEAR_RANGE(4000000, 0x00, 0x17, 100000),
+};
+
+/*
+ * The cache is populated with those hardware default values
+ * so the regmap_update_bits operation will use the cached
+ * value to build a new register value and write it when GPIOs
+ * are enabled.
+ */
+static const struct reg_default sgm3804_reg_defaults[] = {
+	{ SGM3804_POS_RAIL_VOLTAGE_REG, RAIL_VOLTAGE_INVALID },
+	{ SGM3804_NEG_RAIL_VOLTAGE_REG, RAIL_VOLTAGE_INVALID },
+	{ SGM3804_RAIL_DISCHARGE_REG, RAIL_DISCHARGE_REG_DEFAULT },
+};
+
+/* Registers are only writable */
+static bool sgm3804_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SGM3804_POS_RAIL_VOLTAGE_REG:
+	case SGM3804_NEG_RAIL_VOLTAGE_REG:
+	case SGM3804_RAIL_DISCHARGE_REG:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/*
+ * Since all registers are only writeable, regmap will only read from the cache data.
+ */
+static bool sgm3804_readable_reg(struct device *dev, unsigned int reg)
+{
+	return false;
+}
+
+static const struct regmap_config sgm3804_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0x03,
+	.writeable_reg = sgm3804_writeable_reg,
+	.readable_reg = sgm3804_readable_reg,
+	.cache_type = REGCACHE_MAPLE,
+	.reg_defaults = sgm3804_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(sgm3804_reg_defaults),
+};
+
+static int sgm3804_sync_regcache_state(struct sgm3804_data *ctx)
+{
+	guard(mutex)(&ctx->lock);
+
+	/* If both GPIOs are down, IC is powered down and I2C writes will fail */
+	if (!gpiod_get_value_cansleep(ctx->gpios[SGM3804_POS_RAIL]) &&
+	    !gpiod_get_value_cansleep(ctx->gpios[SGM3804_NEG_RAIL])) {
+		regcache_cache_only(ctx->regmap, true);
+		regcache_mark_dirty(ctx->regmap);
+	} else {
+		/* At least a GPIO is up, we can write registers */
+		regcache_cache_only(ctx->regmap, false);
+		return regcache_sync(ctx->regmap);
+	}
+
+	return 0;
+}
+
+static int sgm3804_get_voltage_sel(struct regulator_dev *rdev)
+{
+	int ret;
+
+	ret = regulator_get_voltage_sel_regmap(rdev);
+	if (ret < 0)
+		return ret;
+
+	/* Force setting a voltage on probe */
+	if (ret == RAIL_VOLTAGE_INVALID)
+		return -ENOTRECOVERABLE;
+
+	return ret;
+}
+
+static int sgm3804_enable(struct regulator_dev *rdev)
+{
+	struct sgm3804_data *ctx = rdev->reg_data;
+	int ret;
+
+	ret = gpiod_set_value_cansleep(ctx->gpios[rdev_get_id(rdev)], 1);
+	if (ret)
+		return ret;
+
+	ret = sgm3804_sync_regcache_state(ctx);
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	gpiod_set_value_cansleep(ctx->gpios[rdev_get_id(rdev)], 0);
+	return ret;
+}
+
+static int sgm3804_disable(struct regulator_dev *rdev)
+{
+	struct sgm3804_data *ctx = rdev->reg_data;
+	int ret;
+
+	ret = gpiod_set_value_cansleep(ctx->gpios[rdev_get_id(rdev)], 0);
+	if (ret)
+		return ret;
+
+	return sgm3804_sync_regcache_state(ctx);
+}
+
+static int sgm3804_is_enabled(struct regulator_dev *rdev)
+{
+	struct sgm3804_data *ctx = rdev->reg_data;
+
+	return gpiod_get_value_cansleep(ctx->gpios[rdev_get_id(rdev)]);
+}
+
+static const struct regulator_ops sgm3804_ops = {
+	.list_voltage = regulator_list_voltage_linear_range,
+	.map_voltage = regulator_map_voltage_linear_range,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = sgm3804_get_voltage_sel,
+	.set_active_discharge = regulator_set_active_discharge_regmap,
+	.enable = sgm3804_enable,
+	.disable = sgm3804_disable,
+	.is_enabled = sgm3804_is_enabled,
+};
+
+static const struct regulator_desc sgm3804_regulator_desc[] = {
+	/* Positive Output */
+	{
+		.name = "pos",
+		.of_match = "pos",
+		.supply_name = "vin",
+		.id = SGM3804_POS_RAIL,
+		.ops = &sgm3804_ops,
+		.type = REGULATOR_VOLTAGE,
+		.linear_ranges = sgm3804_voltages,
+		.n_linear_ranges = ARRAY_SIZE(sgm3804_voltages),
+		.n_voltages = SGM3804_VOLTAGES_COUNT,
+		.vsel_reg = SGM3804_POS_RAIL_VOLTAGE_REG,
+		.vsel_mask = RAIL_VOLTAGE_MASK,
+		.active_discharge_on = POS_RAIL_DISCHARGE_EN,
+		.active_discharge_mask = POS_RAIL_DISCHARGE_EN,
+		.active_discharge_reg = SGM3804_RAIL_DISCHARGE_REG,
+		.enable_time = 40000,
+		.owner = THIS_MODULE,
+	},
+	/* Negative Output */
+	{
+		.name = "neg",
+		.of_match = "neg",
+		.supply_name = "vin",
+		.id = SGM3804_NEG_RAIL,
+		.ops = &sgm3804_ops,
+		.type = REGULATOR_VOLTAGE,
+		.linear_ranges = sgm3804_voltages,
+		.n_linear_ranges = ARRAY_SIZE(sgm3804_voltages),
+		.n_voltages = SGM3804_VOLTAGES_COUNT,
+		.vsel_reg = SGM3804_NEG_RAIL_VOLTAGE_REG,
+		.vsel_mask = RAIL_VOLTAGE_MASK,
+		.active_discharge_on = NEG_RAIL_DISCHARGE_EN,
+		.active_discharge_mask = NEG_RAIL_DISCHARGE_EN,
+		.active_discharge_reg = SGM3804_RAIL_DISCHARGE_REG,
+		.enable_time = 40000,
+		.owner = THIS_MODULE,
+	},
+};
+
+static int sgm3804_probe(struct i2c_client *i2c)
+{
+	struct device *dev = &i2c->dev;
+	struct sgm3804_data *ctx;
+	int ret, i;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	mutex_init(&ctx->lock);
+
+	ctx->regmap = devm_regmap_init_i2c(i2c, &sgm3804_regmap_config);
+	if (IS_ERR(ctx->regmap))
+		return dev_err_probe(dev, PTR_ERR(ctx->regmap),
+				     "failed to init regmap\n");
+
+	/* Get enable GPIOs */
+	for (i = 0; i < ARRAY_SIZE(sgm3804_regulator_desc); i++) {
+		const struct regulator_desc *reg = &sgm3804_regulator_desc[i];
+		struct fwnode_handle *child;
+
+		child = device_get_named_child_node(dev, reg->of_match);
+		if (!child) {
+			dev_err(dev, "missing child '%s'\n", reg->of_match);
+			return -EINVAL;
+		}
+
+		ctx->gpios[i] = devm_fwnode_gpiod_get(dev, child, "enable",
+						      GPIOD_ASIS, reg->name);
+		fwnode_handle_put(child);
+		if (IS_ERR(ctx->gpios[i]))
+			return dev_err_probe(dev, PTR_ERR(ctx->gpios[i]),
+					     "failed to get '%s' enable GPIO\n",
+					     reg->name);
+	}
+
+	ret = sgm3804_sync_regcache_state(ctx);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(sgm3804_regulator_desc); i++) {
+		struct regulator_config config = { };
+		struct regulator_dev *rdev;
+
+		config.dev = dev;
+		config.regmap = ctx->regmap;
+		config.of_node = dev_of_node(dev);
+		config.driver_data = ctx;
+		rdev = devm_regulator_register(dev, &sgm3804_regulator_desc[i],
+					       &config);
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "failed to register regulator %d\n", i);
+	}
+
+	return 0;
+}
+
+static const struct i2c_device_id sgm3804_id[] = {
+	{ "sgm3804" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, sgm3804_id);
+
+static const struct of_device_id sgm3804_of_match[] = {
+	{ .compatible = "sgmicro,sgm3804" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sgm3804_of_match);
+
+static struct i2c_driver sgm3804_regulator_driver = {
+	.driver = {
+		.name = "sgm3804",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.of_match_table = sgm3804_of_match,
+	},
+	.probe = sgm3804_probe,
+	.id_table = sgm3804_id,
+};
+
+module_i2c_driver(sgm3804_regulator_driver);
+
+MODULE_DESCRIPTION("SGMicro SGM3804 regulator Driver");
+MODULE_AUTHOR("Kancy Joe <kancy2333@outlook.com>");
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
+MODULE_LICENSE("GPL");

-- 
2.34.1

