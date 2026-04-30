Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B766F3FE655
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538934; cv=none; b=e9yZQG5VfpsDpVw6kAYNZdh7pu3ZdAnu1g+dxISBG5TfqloeymwlqX5wXEatl8kVZJrgLeAIJLQsV6n72EgkjZBfeTys9aw0IoCx1dgYQPpPofNj+e0TRF7WCDuoa3eRj744twQPOJr3HarMXFGdDz55X//vusqqLm1hGwVr6so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538934; c=relaxed/simple;
	bh=L1ADRSEKiHkrZ90LVIlez9Z2sRlYLND+yG4NKRBA0hE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dXErpP8M5yWAaPOLBcSyTET8OHfO/xSl+JXUqHr/WP1sjOXoPV0B7g9S99ib8jP/82b8OFl5G0OcnIDLokfP3iI8UCoKW/n8z3LiaB7Otpy7fJ5XRaEU22LFAjGUR3JM+sCEAhMYsPypyep456mzVwBeiMG7+Ch3NgdZYdfyNA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NLjAvYK8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NLjAvYK8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso3560055e9.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 01:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777538931; x=1778143731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kXLCkoCz9qlwf2uhnklfCrtj7yA2s9uCD0vIq7Tqgw=;
        b=NLjAvYK8cMiugjVdpEiGsxnLsyD/m+udXb5Jpj24surXxAeK6k+wP5YKK89CJTpzo7
         1aOI6gUfqGBWsHRvNO8JyMJuDdaxuj02PThMufNVGJqFg9aRktsWstl0nkTgmbBWxJfB
         FyNkXq5PcYuIth8+NY2dkxhiDj3m3+Xa/t5z4vFDCeRBBaxWOGL/DJoam5WEySvTT/rU
         2Tye6VdgZ0KnqxSt9TE1R2uggtv5DjhT0xbJhaR0mMhx0q5hArCGQ5n7QMt1Q3FENW6q
         UdcuOcrYmTLlrJLwfeWdLAp09iFq6jJPMCaWzwjIVh+HiuHr18n3GL1yXi/KpLpL4NyX
         0W9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777538931; x=1778143731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4kXLCkoCz9qlwf2uhnklfCrtj7yA2s9uCD0vIq7Tqgw=;
        b=rH2fIe3265pZ6zu1uiqm97Qc/wvNZB8ZNi1zzlulmHCOrL47FQPXvS5d8hDcBo5fDG
         FL0ZMistsUMr64U9wZwprkX54oFuH8K77Lc+Brp+j54OKLGpNeidQ5EZAIbHd2Lg2FM/
         tXX74glWPiwhEHZteq3QFEuLgVDx4/KeQYKfqoo4UDBdo3VFFARlUZA4Vr0ILYPnh+Jt
         d7Jo0ADHf6gGRGjzvip8vQ588EXgnc2bG8Z74gILPODB/kHtW04UmJssdNjXYxo2Pu13
         7GyEcHNhbk+5Ury78roa3a4/f2HPx2AHWe/ilvH36v4Wah1CVSosJ5icFz4y4LDd17Cj
         D7Dg==
X-Forwarded-Encrypted: i=1; AFNElJ9d91T4VURxIDvDR1yVkMLnCxoqRXiJw3fC9btv3y//VGA++kgIUV0dvP2RBQuN/4PKQMwmqY8fK7Bg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrb3p04gzfL/rJQcD4zCOzvLiXVWwuOI/FR8QwPrAaqAhRKLQx
	fEOfg4/VlSGfyub+9laaV5b/LjvGsQOPDHVnpDlKU5Ad/I3aUOA0OuLervCqzQwGl3e7UBPmtVP
	/Lu5VeAE=
X-Gm-Gg: AeBDieumxUGv9Os0QQSvSnQRKpNKeYdof+Rn+bbwQEySK95tU7l89MzUftdYPeYLxCd
	yaczEKXRKi553vqG0VHwEWIhS3PBs+fqdMgtzt/yzdDiWReZLp0plmNuMvhBhFps2SHeGkMnqz1
	EJkX9fUY0uB8VJWyWfm7fv61iN0pa8v3pGJVBZWIgWibnbpOcpE+NESwEa72P6AK76qs50oAlLv
	FfxDn7dtqZe9l4a6NEpdr+329y5tgwv9ZlyLq3sO7k1WTsfqHrF4bQi5tDdSgvhW+LR07CrCpiu
	8r3FhGpQydrU9LjLNuZy525FpoYDL4eQsW6OPH3Q2L4nrPpxhsdslV9gtmxWFtBOp+XBYb6ghAg
	SnD7oRke2NFfrTn7AqgqgBw6Chz8aW4oDrrxrYv3IkIK3J7By/YzZin5BrPA+jTEgpg4cuWbZBa
	tz679N6rtVVdHG8bSPqeFOKM7TxxyrevPlaX4ZwR0GfVNn8727cw9JQSM6JUG4CVcnSg==
X-Received: by 2002:a05:600c:8708:b0:48a:5970:2003 with SMTP id 5b1f17b1804b1-48a844e4a83mr31227695e9.3.1777538931036;
        Thu, 30 Apr 2026 01:48:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c1d0228sm137328025e9.2.2026.04.30.01.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:48:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 30 Apr 2026 10:48:47 +0200
Subject: [PATCH v2 2/2] regulator: add SGM3804 Dual Output driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-topic-sm8650-ayaneo-pocket-s2-sgm3804-v2-2-76108c65a560@linaro.org>
References: <20260430-topic-sm8650-ayaneo-pocket-s2-sgm3804-v2-0-76108c65a560@linaro.org>
In-Reply-To: <20260430-topic-sm8650-ayaneo-pocket-s2-sgm3804-v2-0-76108c65a560@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10710;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+i0RMuPTBhqEnTknFmfhVd7hvPYNqSPW7+dUEk1keLg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp8xdw4rarX+7ocva6BMFIQ600uAfT8TAXmxzWhHLA
 afutd9qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafMXcAAKCRB33NvayMhJ0XzWD/
 wMUSBgNmNmeEX812VWxcBk82afSrWAfVP20uGGHEO15r7F9EoHbQRSBB1sLErpIcliMS1PWcQUVU4B
 YwIRfJ9l+gIS4bCREeqCi7waX6ZyTzhs4fDEkXHD2b65yxmtw/93rgrPW6ci1xFF/aXKjjCfzuGVef
 bVggQ41U+qmGLMmV7VR5HZ1rZ5JeYUZGQxEwtOuykdt7Inpn/9s9JHjBDx7cZUxwwp8pB0Q/tyjT5x
 htQ7ljFHNhCDTk7f10jrjbAR0g704TqQ0J7OVqum7zGfKRxkyiPvvL0KZCrjXeTq67ZQs27yja8Yza
 mctwwcVpPmRhD4vz61ZweyFErHY7QjNs30qNC1pi5ETJ+j2t8wovYRZA5XRZJv/K8uhFcdt04dKC4a
 6rpowUVh1ffAk4PUs3H0U/Aos8yQ6pzmrIXwQhKLXsr3csZ9MBOzGmwQ8Mx2dxXbxK/eBa+PVUGBvD
 J2OaH7oHPRtRD4aky1Va7SBYiOqKCsWlFU5qOgoIJoOyBJ/BQDnMnouMfaDbBNm9wXISwYjaU0r2mi
 THgGCYfjP37PMWisZw7dUkEzU24h2thBNR5RofVTe34/y5+FgKikson9W5Ih3hrqsn3vt3CQlUK62K
 pFZz0zhC/OU4vm4iPP7L/Bprkowuk4pQ2ne/BfGtda5SJQ7l3iym6xCR+WjA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: KancyJoe <kancy2333@outlook.com>

Add support for the SG Micro SGM3804 Single Inductor Dual Output
Buck/Boost Converter used to power LCD panels a provide positive
and negative power rails with configurable voltage and active
discharge function for each output.

The SGM3804 is powered by the enable GPIO pins inputs and only
supports I2C write messages. Thus we can't use the regmap
helpers directly and we need to cache the selector and
rail discharge state then setup the rails once the gpio
is enabled.
In order to add flexibility and simplify the driver, the
regmap cache is enabled and populated with default values.

Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/regulator/Kconfig             |   6 +
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/sgm3804-regulator.c | 290 ++++++++++++++++++++++++++++++++++
 3 files changed, 297 insertions(+)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index e8002526cfb0..7a2ba22716a8 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1590,6 +1590,12 @@ config REGULATOR_SUN20I
 	help
 	  This driver supports the internal LDOs in the Allwinner D1 SoC.
 
+config REGULATOR_SGM3804
+	tristate "SGMicro SGM3804 voltage regulator"
+	depends on I2C && OF
+	help
+	  This driver supports SGMicro SGM3804 dual-output voltage regulator.
+
 config REGULATOR_SY7636A
 	tristate "Silergy SY7636A voltage regulator"
 	depends on MFD_SY7636A
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 35639f3115fd..7c345c7caee7 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -181,6 +181,7 @@ obj-$(CONFIG_REGULATOR_STM32_PWR) += stm32-pwr.o
 obj-$(CONFIG_REGULATOR_STPMIC1) += stpmic1_regulator.o
 obj-$(CONFIG_REGULATOR_STW481X_VMMC) += stw481x-vmmc.o
 obj-$(CONFIG_REGULATOR_SUN20I) += sun20i-regulator.o
+obj-$(CONFIG_REGULATOR_SGM3804) += sgm3804-regulator.o
 obj-$(CONFIG_REGULATOR_SY7636A) += sy7636a-regulator.o
 obj-$(CONFIG_REGULATOR_SY8106A) += sy8106a-regulator.o
 obj-$(CONFIG_REGULATOR_SY8824X) += sy8824x.o
diff --git a/drivers/regulator/sgm3804-regulator.c b/drivers/regulator/sgm3804-regulator.c
new file mode 100644
index 000000000000..0a1203c4ab16
--- /dev/null
+++ b/drivers/regulator/sgm3804-regulator.c
@@ -0,0 +1,290 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SGMicro SGM3804 regulator Driver
+ *
+ * Copyright (C) 2025 Kancy Joe <kancy2333@outlook.com>
+ * Copyright (C) 2026 Linaro Limited
+ * Author: Neil Armstrong <neil.armstrong@linaro.org>
+ */
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
+ * The registers are only writable when the gpio is enabled, so we
+ * can't use the regulator regmap helpers & internal gpio handling
+ * so we need to track the state and apply the state at enable time.
+ */
+struct sgm3804_data {
+	struct regmap *regmap;
+	bool active_discharge[SGM3804_RAIL_COUNT];
+	unsigned int sel[SGM3804_RAIL_COUNT];
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
+ * value to build a new register value and write it.
+ */
+static const struct reg_default sgm3804_reg_defaults[] = {
+	{ SGM3804_POS_RAIL_VOLTAGE_REG, RAIL_VOLTAGE_INVALID },
+	{ SGM3804_NEG_RAIL_VOLTAGE_REG, RAIL_VOLTAGE_INVALID },
+	{ SGM3804_RAIL_DISCHARGE_REG, RAIL_DISCHARGE_REG_DEFAULT },
+};
+
+/* Registers are writable & volatile */
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
+ * Since all registers are only writeable & volatile,
+ * regmap will only read from the cache data.
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
+	.volatile_reg = sgm3804_writeable_reg,
+	.cache_type = REGCACHE_MAPLE,
+	.reg_defaults = sgm3804_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(sgm3804_reg_defaults),
+};
+
+static int sgm3804_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
+{
+	struct sgm3804_data *ctx = rdev->reg_data;
+
+	ctx->sel[rdev_get_id(rdev)] = sel;
+
+	return 0;
+}
+
+static int sgm3804_get_voltage_sel(struct regulator_dev *rdev)
+{
+	struct sgm3804_data *ctx = rdev->reg_data;
+
+	/* Force setting a voltage on probe */
+	if (ctx->sel[rdev_get_id(rdev)] == RAIL_VOLTAGE_INVALID)
+		return -ENOTRECOVERABLE;
+
+	return ctx->sel[rdev_get_id(rdev)];
+}
+
+static int sgm3804_set_active_discharge(struct regulator_dev *rdev, bool enable)
+{
+	struct sgm3804_data *ctx = rdev->reg_data;
+
+	ctx->active_discharge[rdev_get_id(rdev)] = enable;
+
+	return 0;
+}
+
+static int sgm3804_enable(struct regulator_dev *rdev)
+{
+	struct sgm3804_data *ctx = rdev->reg_data;
+	int ret;
+
+	ret = gpiod_set_value(ctx->gpios[rdev_get_id(rdev)], 1);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, rdev->desc->vsel_reg,
+			   ctx->sel[rdev_get_id(rdev)]);
+	if (ret)
+		goto err;
+
+	ret = regulator_set_active_discharge_regmap(rdev,
+						    ctx->active_discharge[rdev_get_id(rdev)]);
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	gpiod_set_value(ctx->gpios[rdev_get_id(rdev)], 0);
+	return ret;
+}
+
+static int sgm3804_disable(struct regulator_dev *rdev)
+{
+	struct sgm3804_data *ctx = rdev->reg_data;
+
+	return gpiod_set_value(ctx->gpios[rdev_get_id(rdev)], 0);
+}
+
+static int sgm3804_is_enabled(struct regulator_dev *rdev)
+{
+	struct sgm3804_data *ctx = rdev->reg_data;
+
+	return gpiod_get_value(ctx->gpios[rdev_get_id(rdev)]);
+}
+
+static const struct regulator_ops sgm3804_ops = {
+	.list_voltage = regulator_list_voltage_linear_range,
+	.map_voltage = regulator_map_voltage_linear_range,
+	.set_voltage_sel = sgm3804_set_voltage_sel,
+	.get_voltage_sel = sgm3804_get_voltage_sel,
+	.set_active_discharge = sgm3804_set_active_discharge,
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
+	int i;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->regmap = devm_regmap_init_i2c(i2c, &sgm3804_regmap_config);
+	if (IS_ERR(ctx->regmap))
+		return dev_err_probe(dev, PTR_ERR(ctx->regmap),
+				     "failed to init regmap\n");
+
+	/* Set default values */
+	for (i = 0; i < ARRAY_SIZE(sgm3804_regulator_desc); i++) {
+		ctx->active_discharge[i] = true;
+		ctx->sel[i] = RAIL_VOLTAGE_INVALID;
+
+		ctx->gpios[i] = devm_gpiod_get_index(dev, "enable",
+						     i, GPIOD_OUT_LOW);
+		if (IS_ERR(ctx->gpios[i]))
+			return dev_err_probe(dev, PTR_ERR(ctx->gpios[i]),
+					"failed to get enable GPIO %d\n", i);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(sgm3804_regulator_desc); i++) {
+		struct regulator_config config = { };
+		struct regulator_dev *rdev;
+
+		config.dev = dev;
+		config.regmap = ctx->regmap;
+		config.of_node = dev->of_node;
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

