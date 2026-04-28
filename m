Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A187A40242E
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384336; cv=none; b=juIjzY8jxY/b6ZJmY5+DERTSGPOtBiyPZt+N5oLWGZmSwALi91I2P5TsGGuP/jr5NrvSbWWEPvdyA8p4ejL+lkI787HFNg8iAoQvhd7zMv/hxe3Fib+YjK4Edj2bPkUtKoi/s/Vzk+u4YmwpnAT/zpIgSzieTWRmvhIZyNBBDUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384336; c=relaxed/simple;
	bh=/fqAkdyrLaisATfPWFL25iMhF4oyrS6qJz2IaP7APT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jhMRY4NNb2Enka+EuX2RvPswN+sSL0U3GX8SpCCEOrsRND5F7hkEFzH9L/da5k2oWa6tyHOoIlCTx7dpNtpapD7fiU99+aGEMQKZdknolNpoB7h+6mkTWWnnui3V5ZUzAsvzB2QqMIHY1jwaAaQ7rt40qVZsAv1gCmjvtkMnxxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iCd7go7Q; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iCd7go7Q"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43fe8bda8e9so6416331f8f.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 06:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777384333; x=1777989133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zD1RrLk38fWrR9Bubp6Ekaq6ndaJfkS2ygjcj1Qfki0=;
        b=iCd7go7QX80AdIt5sKIXDfw6JUMumW4EEGkQeHz92C6yBigkCV47mum9Se7XzD3n4w
         7n04sRe9ViSBtWgbk/h86AbcallLSffCriys/JgV/Oriqqf9siphNKNXBJrp3zYGlzx6
         xW2WVZOosAs89m33l2eTE9d8C+o/p0KCgNfigYiiAKWTR0YltjH5gpAyWPW9vbOiQAy6
         AgTMDwRcYESPUYnWL7klXTy4aTw+5T5tuoJAQu3ROjuN6iIcqnQ2pRiGB0GfIGio7Ka5
         Q1aP1H7DYU3RXkiNydgWMYIUM4qPGVbU17LL9MrdW2KqmWaoFmjtIo9s41KPhkDuWGpj
         AQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777384333; x=1777989133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zD1RrLk38fWrR9Bubp6Ekaq6ndaJfkS2ygjcj1Qfki0=;
        b=GJp6tZGYsxeuqsBHS9gNShnryL8VfvLpBNeLQ28sT7rVZt5cPRufsqd8/PGpYFuu1y
         qBRiPaH40NhqfdwutnipGCLxo7sw1nAKfDMjmWNeI/OxQ/tXMbftLszlxUklUqOtTNoM
         vS6Iy0/HfC4h+hKiTlJqqN1B91gkDDcAHfPIQZIS5LvH/1DPNaC8xixMAEVRLi+bfQf+
         +hSBvWNMO7mI+PiQqLdetRvja9b5Alu1jN0wxDNWS7HrqN2Ccc3dh1MprNhn/ibOjDat
         O24ByGxuLoCG3+vf4wKohXVyobNom5J7YtnpQ5pAha5KkVwLqC9jUBRed9Z45FyffIV/
         IJtg==
X-Forwarded-Encrypted: i=1; AFNElJ+niUF98nw81zkuUDG06OYqmwxRaupLUafNswJ/kcbXjo7+vqM7NDCzwIJajv/wYHbJjRRM7mwT4pMX@vger.kernel.org
X-Gm-Message-State: AOJu0YyAM25QqMLXOG/Br+F0y9/5dQ6/1ZfU9l4B/4nhqgGK5CtZtFDH
	UHUUhsohwEo5uN+9OFxIITi5NGsKs0turd61v3HcXzXCnfWgaY6+POFg/ttfUCK/oUk=
X-Gm-Gg: AeBDiesKq/BAvZtO9dnvOSoY1SRViKOdr7tsFeAN2F/usvtTrbWh+8tHZnuSWZA2UK4
	szAUvmaxMZj+W87wr0EX5xpemJSc3ZMRDeC0ohyKpEzm4u9RKQvyhwE6ZOOAR4j2JZTgLt6AKtz
	Zz09vmbiFwhS5xvqZl3S0WDS6XwjmbVZ0pdREpxEOzO3AqVWtq7bre5QYFcaOC8eUOxSlWOr/ii
	QIJIDE14nyOkC3WvOiWrd4Rwjg7Fo8iyA9t2o77SEE3lfDRXv340Xemn/+slPeuMSrFDgfc2CaI
	EM4YFFC7FWHicPSyUpIBLfW3n4N0QkI0yY7I73HhxTP/EKXNMVwTQyPTqRAvBygYX2N3C53Ne46
	0V8GsaMJY8O8Tv/9ASwo+WkRmQWaGICg8XxIc6RjQgoPHN8dnjkfyrebY5FfwTWq3iyoAPmo6uh
	Jk+52HaSOAg9kV7GPoVo8Kfxop2K0B5DmdiPJ3TAHe5IU6LeF3Zfj8MK0=
X-Received: by 2002:a05:6000:604:b0:43d:68ad:3b7f with SMTP id ffacd0b85a97d-4464901eac2mr6205515f8f.21.1777384332925;
        Tue, 28 Apr 2026 06:52:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463f4c07a2sm6773044f8f.20.2026.04.28.06.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:52:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Apr 2026 15:52:06 +0200
Subject: [PATCH 2/2] regulator: add SGM3804 Dual Output driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-2-1d8dc7620256@linaro.org>
References: <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-0-1d8dc7620256@linaro.org>
In-Reply-To: <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-0-1d8dc7620256@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10280;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=HQIVJlEIZXjuGioJW+siBTJFNBkM8oe/nBonjij1PAw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp8LuJyDVaHOPx/RxSsD+e5bKLCbKcef9qdtVCypUG
 ULr6C5eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafC7iQAKCRB33NvayMhJ0d41EA
 CivqRuEaSbVLbTHf2E8sKLLxfx2EMX3Ywsoi2hHYQANjmayZBiFWs1FJoMHylMrgbbbRMYMV2b3f1d
 ApCiDcLmZXL0Srbrg62bPL855l09P3Eystn/3gj0OGqSnsE3jPI5FvmGjZzH7nWy36oGpFYUAFV3cg
 BFnll6eXoT0WG8GZD0PvZpFpzH+Tnx2RcOtMl/buePUqgyi3Jad96xHxFbTNDXuXHp3J90+tHUreEk
 lBz3NzGWGJbo9/n0fL/BmmdmmUpvZCaRBnqz5m4+XdBixbzF4D9OKZZVoaa8HN0ro0RYNw47A1yo4O
 tDwVvFesBWUT0DyggCf62uO5j9lkf7LRgLrFLMI7eHDdl8g2K+XZRWccGGJySA1cgNapyqtps7/B9G
 yPZoUwJeH3gPJ1Uq6VP6IPk4228Lvja8I63AVwyz5HfYvTQH1pHffOOHd1kkes1zej64V2sUoE+KY1
 /EsltOct17HdnrvhZCLPKBsrDyeFNAFjS/IsQsArk7fLXuZhCsG95ksEK72wM1bcUzjZ4KeRHrgN5X
 vWL2OfQ+YU71mVQ2xK0tOc8moPzQl1Vkngc1HWjIhnL6uqJeP8EeCAJyQ8SXML93PxFpv+GuoPUGnu
 eFYPzw/U1DJtDnnNcC+WL7COlgpRcdryls1Je6zV5ojLnWz0j+0nnpZJkSDg==
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
In order add flexibility, the regmap cache is enabled.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
---
 drivers/regulator/Kconfig             |   6 +
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/sgm3804-regulator.c | 280 ++++++++++++++++++++++++++++++++++
 3 files changed, 287 insertions(+)

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
index 000000000000..5d496e32eaf1
--- /dev/null
+++ b/drivers/regulator/sgm3804-regulator.c
@@ -0,0 +1,280 @@
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
+MODULE_LICENSE("GPL");

-- 
2.34.1

