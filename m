Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E3C29E116
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 12:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898661; cv=none; b=tJNo9Nfruc+QfQgHzeWkfy3m/bP72f7ME67PeiYwTbyc0mL+uV7GWmS0wo5vp/k6kmXfwaUjs4ja1oWrFPoMEKDCvvRaHkf9CWz5M3cnmae+vs+zGoium4gZRo6pcokZ/pexTgdwi0pNoiO5+4+X71s71hP79x+H+1vHcPJC9v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898661; c=relaxed/simple;
	bh=rrOIGT0whi5Rw+dQf/vHXUlI6F/g9aneDp9M4Aaqnqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lvcoq1YDkDO7TkhXRrMOF6ql8C0M9/YxvLV/51eHRITrZ0CXUE5Sh1lV+StAj8leYWPI2lqlvKtv+I/0wFQC079fUam+IuoUcRaNy/7PPgLsjBXN2KVhpTIfr2VEjDcWC+FgWly9A54wBKP3DaZgKfh0eTjrg0MGga6eyTWvCYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ixYBxpJC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ixYBxpJC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so24819675e9.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 05:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777898650; x=1778503450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29DSsXZsWXZav9BRgsUmTtQvE8JjTg55XGr0k5jPXE8=;
        b=ixYBxpJCGWOVCgVd/bPI7xWZbUQ9MDKIbFDGc6+X8/OfeT0E/bg0y5wXNkcZJYq6uU
         NVvFfIn50S8vT322MSSG0sd4LIQlhoJEHCV08+61DvGrURHhIez/YohjQw1A58ewN1Lt
         m3pscskvZoIPC3gqkIjkgGbkaDwhVX2PtjUWjTHKoCbJaPuMIUgLPAIFrhK5D7Ca7s4h
         nLtVc9LllnOtksxcLznueQdU/x1bY29Qnvf9G02NuEMSsvWmntotekSvktGbSiXqTIE1
         BzxHNpJYpt7zkWwSQ5tpBFingAxst/2urq48Km1frR0EK1n7HgEJALDZhhqq6Nf3T2Yk
         KcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777898650; x=1778503450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=29DSsXZsWXZav9BRgsUmTtQvE8JjTg55XGr0k5jPXE8=;
        b=W3IOBY1dCGYQLMYhW3TFao4n9WJhX9vRpxJFSTQIKN1ojn+SGEm3bz39AregfMlJp5
         QDEUoO9kebkOV5IzVy8E7nYCuqAz7GJqRMWsGJxs3LhQ5KXmfLXN0imBhZO7cwSTqz7i
         TElpVmlW2J7FYv3/lRwaZGzy3117jeChr66LtrOTlbab1uABYaSFgBh9L/c0/nMin0Oc
         uLoqpEal9q2CfjuxpJHvtm8CVB+lgBwSL+d59BvNLjmXTD6NjjDV94f58B8YA2Totg7F
         kNORMWGxVm5XE9QzmZFyhmO0brQ6cxJrihLrnEKfLLqWsEwhM/regGz/DDp770/2biv5
         zkGg==
X-Forwarded-Encrypted: i=1; AFNElJ9MJ09oxy3ONY10PK7UTE+lEY1SKFj3GjWbEesOTr5s0dOIbaJ+ECBxhRwBy7d/SpqKTs9PgGyVOiJq@vger.kernel.org
X-Gm-Message-State: AOJu0YztfM4bbvYUku4xwSHgIZjwPlR3nYOUUgg8e6xTUzLtHmyijDW1
	6AF9PXOUgBxSR7hRaD0RmiEU0xiWI2yHk11MzvJr28vPdTQxKzekN+CJrqDFO47SzNoB71rzEYV
	8cUeAc2XrlA==
X-Gm-Gg: AeBDievghU3BtR0YcT+rqTYbXm/99uZ76kZfPltr45AU7ta+WfbrT7/oHVI7rZx0e/w
	8judRiWSdwkTXP/VAtwwAeX1ZrGKrVWN1c4M0i3IZXk61tRyMOGkckW3AP+eXH5j6Lk/kG9DkN4
	leKQsg2sseaqIXppSxCtGIhIDHN07rNARVY2f/5546SretkPln+IGQ3KSgKzzPUMQGibGq6nACx
	EKLO+NUDaAPCJoWH/jQSFFmI7BRScxv8uwkvnJ6wNpOcHhDPilGTxyMAOCv3rVzZtn2QZ8d3hvx
	53x2M+ZTYp0RMwLyjjhRLViPkORkfTEciM5TtRR9mI1APReQQDau3HpZnoCDyb4lqLcrgXYJrrr
	8W12PdiIg2+e2oRp8qQttyomflq1UEu5SaWN2wA3rrrzWN9IxbdHITw63KYIN7cRwfAOsbqPtZo
	rL8LXwCMqCJaJiSx871eVuWuaNf4uDVzF7tjRpRnp1N3QrPKM8c2TP0w0=
X-Received: by 2002:a05:600c:859a:b0:48a:581c:ead with SMTP id 5b1f17b1804b1-48a98637facmr111494475e9.10.1777898650231;
        Mon, 04 May 2026 05:44:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aab44sm26919443f8f.29.2026.05.04.05.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 05:44:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 04 May 2026 14:44:06 +0200
Subject: [PATCH v3 2/2] regulator: add SGM3804 Dual Output driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-topic-sm8650-ayaneo-pocket-s2-sgm3804-v3-2-c4783443890b@linaro.org>
References: <20260504-topic-sm8650-ayaneo-pocket-s2-sgm3804-v3-0-c4783443890b@linaro.org>
In-Reply-To: <20260504-topic-sm8650-ayaneo-pocket-s2-sgm3804-v3-0-c4783443890b@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10751;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Kk/ZMsGKHebvpPpc8smbsG87iC9ElVBwSEwR/cSOBfs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp+JSXMBXZT8EoSzlZc0xRs/1u1wDsMZAGsxgalNWL
 jwuybDCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafiUlwAKCRB33NvayMhJ0aM2EA
 CYuDAWXNj6khq/j3A2iDokLRWMKGN0kES362SICXRQsN7tj8cSRzlhx6AzSSyC+25o5DUIjulwVzM2
 KShZsdtgmsrXsMxrOc5l1xvWh56jg96GhE9MIxGiO8O1PM+fisvD2jRACObxtRcsnW6y8Od73rr+nv
 PQ7xVhiisZMM/0dgpb9rPX7nlQnbCRYDtcLGkqtuYN8xQNKgnbTdpctxNLliZqSb5+IjLBz+i5op8d
 p3ZxlhCKKUhF8owYlS7VNryoCEgRkvOGvk41hDZtH4Mr9zKHAvVsZpNi6LqwhIC+i38fPIDii4TvRi
 672ASsjskZUOL/QywiO8GsEsXyhYAPWR7RLrLCwgXdxz78CEDIhnMp8/k2b/L2nVhT8gw+4GzwgD5i
 4/XbI32fc7gnKjyyPC4dE2xc3ggs9/l32b1Au/EJ+wq444dlIcnifa/gqqMn67UiH8bNjzzBjNMMGj
 07PV3En4md/bz+HFpj6V7yL0rq+F8S6q7arTNU+FfWBkuJAG+Ym9S6dZd9YsDA+SnjCKi1SlUlxlKJ
 xXSQPQ6AmSNFNP/NQUMZOmEeJOEWN+ww1AxKsybiyQXlXDDk3dTTEiF3etLS6nhzgL/0liHJfxnPNH
 +15GVgczrtQHJe7Zg1DJUu2DKzAvwhQnT7BvHOiCYxHaScLXGMuyPA1RtXog==
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
 drivers/regulator/sgm3804-regulator.c | 297 ++++++++++++++++++++++++++++++++++
 3 files changed, 305 insertions(+)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index e8002526cfb0..9335c1bd0c5b 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1590,6 +1590,13 @@ config REGULATOR_SUN20I
 	help
 	  This driver supports the internal LDOs in the Allwinner D1 SoC.
 
+config REGULATOR_SGM3804
+	tristate "SGMicro SGM3804 voltage regulator"
+	depends on I2C && OF
+	select REGMAP_I2C
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
index 000000000000..182dcf763afb
--- /dev/null
+++ b/drivers/regulator/sgm3804-regulator.c
@@ -0,0 +1,297 @@
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
+	gpiod_set_value(ctx->gpios[rdev_get_id(rdev)], 0);
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
+	/* Set default values */
+	for (i = 0; i < ARRAY_SIZE(sgm3804_regulator_desc); i++) {
+		ctx->gpios[i] = devm_gpiod_get_index(dev, "enable",
+						     i, GPIOD_ASIS);
+		if (IS_ERR(ctx->gpios[i]))
+			return dev_err_probe(dev, PTR_ERR(ctx->gpios[i]),
+					"failed to get enable GPIO %d\n", i);
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

