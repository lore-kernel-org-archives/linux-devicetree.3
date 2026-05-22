Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B262D3976A9
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455362; cv=none; b=GPG6KU7u6W2i2r1+KL5YyJY88OMu3xGUZ32whBW25dkgPuCC9l6zL84791mKsW4VUr5xfgmlcUjwNx2cNiOCqBxduMZXaibE4PnzIeCCg+4D7K22tM6F67aHK+DZO5Dm+bZXw9w9H2E1qKRTayqMrR3+kLvydVveQeuZu2giZfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455362; c=relaxed/simple;
	bh=aWp4jSGV301SVIRZ6/VL/0twGqRHgJWikmRBN4qq7z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eVm4YRV4KWb73t1BdhupExU9GwlvqnVy6HFghxCXa2qWMW2OiPWqBuWCJkosBcZyd4K2eivlhUyVCfo8uQSmmpLhgQyJmIzx3Q+Mn8zpOW8ZRwK5j4L45hWeasOuawsmootmoa6745Be/79Kd8VUfSoeNJMhB2Q2BS/cbFfKsOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OwXRlt6t; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OwXRlt6t"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48e82c23840so59251675e9.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779455358; x=1780060158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kAl1EoIKEurpHX2I5k3rnTe5SSNKGGLuS7IVOoxc3c=;
        b=OwXRlt6t7zbFnOOjKf0twpWlR0V70E8fGwqZktuLGDlXyFpXSRUjYJvJ2aSgp2JsKv
         x/vZ9dQt+sPP+VPw3ljx8wQfGpfeqkv0RHUSl6FUfCMRLfSIc5SExY4+KKG2XuQKfgSo
         xu87LApyV/jOwOZhPErl8tKldr768lgkDlTI2x2Pqig0gbPUSqliuUKuI4yOnmvvIZgY
         5P95qGEpDd9DWWYlHu0O3Xb3noxURtDguFHWofUK4fSPJ6rqSoMM58jCrM+7zVS7LU4p
         WfaLebsRCV0eKrjq3USfNtP2Hts1OZRGVZYosThwMUi901e1CPAtoE0h6J2UCgklIYq0
         th1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455358; x=1780060158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+kAl1EoIKEurpHX2I5k3rnTe5SSNKGGLuS7IVOoxc3c=;
        b=QRHA2P2Hy5lhKROhryaC0DeT0QoCcgwBC5omrUYQiUjusKuPUsIxogk8IgnDTOvYJf
         lbAiDngV7biPrBQrBw+DzmoSJ78XD8Fn+YpwAn74A4Ym/sLJEXCznduZFh+GdxZLz+3N
         ogC4sdmOMaKQLPaDgmULnwtWHCnxKQySXwSiJgN9+p4k+MRM5k83sLC/qCsCulfpZUa/
         BnVI4Xk2pHz20vJHWUvlQ3BIqg+cuI8vgjyXHrBN06rUI5IVZkyjX59W4QiKhfmjdon1
         qfWPPXHFT5DZhQAE+5IwW0EuMdYhDLA1+XjZVwRnWAQh6zQAJPLlfdPevUJxZLp8995H
         0bxg==
X-Forwarded-Encrypted: i=1; AFNElJ8UchX5ybN9us/bomBRBeyQ59klBiNfQytt/5erSXyo3ApgbgGxG7EI6/h3er34F/Xs/F4C6xwMi5vl@vger.kernel.org
X-Gm-Message-State: AOJu0YzsaZHukJFBbpavyjPSAZJpW0Oc+xbSMLvLLq4gCHY4bhQNo16A
	hmp6X8rPfwlgrRQGOh2Jrr229akAOTdf8Fd0u/rJXTsdXC6ZCl12V967+j4Sk5TcJKY=
X-Gm-Gg: Acq92OGrHp3LqNeraQvjcz6dTb8Pjch+lC7AdBRrvrlxq1QtZwgyul7aHqYQVffl1Fo
	5BxSO9rQlIxMttfUu1IjX8PZFUX15nLuKZ+zDXCKlMYUp4USdoBaNznqmaaIxZiWmt4wbhGf7Zn
	YrnvDWSvwabqwvtk8wFcYYNGVYkWa9wx3bXAZ12Vdrkpk/FlWsHLmHO32bKLrw5/f3bB5/VEnrj
	PaclPEqphdlLryeE5keEZGzMqGQ5Gvkzy1uDumgl0bm7/uFMB7yyrI9eBjODRC5LXHu32F1A+1j
	TRJ8VNybEnxrQJGG8/m2MKvZKT6aoyhr1unaEYq9EIPzAj+vG+Q/BYYNTuY4hUZUe0b0/Lg/54h
	J7A/XsodL5F6mdjgEN9Hvr7IgFxvTsqbeRMd1ZZ141isc2yuT6F6dziGtVyDuLiyXRU66PXvazB
	zfTf+oJNKywmkFxjH9/LC30zz/lAafquleTYi8E/2GFPpj
X-Received: by 2002:a05:600c:468f:b0:490:47e0:e131 with SMTP id 5b1f17b1804b1-49047e0e229mr30752695e9.16.1779455356401;
        Fri, 22 May 2026 06:09:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm45413615e9.9.2026.05.22.06.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:09:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 May 2026 15:09:13 +0200
Subject: [PATCH v5 2/2] regulator: add SGM3804 Dual Output driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-topic-sm8650-ayaneo-pocket-s2-sgm3804-v5-2-bd6b1c300ecc@linaro.org>
References: <20260522-topic-sm8650-ayaneo-pocket-s2-sgm3804-v5-0-bd6b1c300ecc@linaro.org>
In-Reply-To: <20260522-topic-sm8650-ayaneo-pocket-s2-sgm3804-v5-0-bd6b1c300ecc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11268;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=kpEEWcM85gI8g14G5k4E2QHhkCgE+znYMB7xUHeKbRk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqEFV5C/mzYijJQbRhBClQTxIWNZTrM95OuZH4JvKk
 HTVTiVCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCahBVeQAKCRB33NvayMhJ0T1jD/
 47n4qAj76lxjnItViVuiqp4KoQUkNvy/is2XdMsiVyEmSaRZpIizJ+kKssbRdTB0vu5vBuE9ZEI3kX
 DhauC2i2fLzdhg736Po9X0eAub+Qdlsb4fPC91FX+uuDsAbQX/ELxkIqlrijGusYnZwC6c0216c0RK
 OcFsOWFxbIztPUezwu9WBB6oH8xK2W4rqMn6cRaJPEnQpkwWz65LURygeU0alnsjItZ9Buoudk79W/
 2sPVGmOB8F5EMtBz20OHHYeSNiQP6fuYw00y7aiAGTB4FLU+UOXOB0T50KX23n78aJ9vqMUDSwRJGj
 JQ2Nw9ghKvBRFg28I/+pLfOsHJWfSOo+rNokq5KpRE86Is2S3XNZRki3uqB39e+6wJpL5+TMNE9KNC
 gvZDfTK07EzCm9jUy5WJ0hU3XRA4EAbvqY20qOoLyDysGgoKp36qgrLSY7WrBTrFS1/dAsv/PrDPgV
 twhr5G6joCZEq5WIjIrCfzDZuD2aZsGFE22Lse40JH0WILj+pQaNovpDQNOnDkIFkrb7+VvnnqhbEW
 U9nx6IJqS0J/eCSOISaciZxDu0uX2CGjOQxPU5cJ7zEkyFtw5bf3271At8zo+JB1E5xlAuXZbBUpHE
 09x56EC3X42K7kmSrvPZ5/Wo1SEjA/BajUV6AxStclFNSCKJQsdeIFddzdWw==
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
 drivers/regulator/Kconfig             |   8 +
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/sgm3804-regulator.c | 314 ++++++++++++++++++++++++++++++++++
 3 files changed, 323 insertions(+)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index e8002526cfb0..b79ad8852033 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1489,6 +1489,14 @@ config REGULATOR_SC2731
 	  This driver provides support for the voltage regulators on the
 	  SC2731 PMIC.
 
+config REGULATOR_SGM3804
+	tristate "SGMicro SGM3804 voltage regulator"
+	depends on I2C && OF
+	depends on GPIOLIB
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
index 000000000000..c3406cfb73d0
--- /dev/null
+++ b/drivers/regulator/sgm3804-regulator.c
@@ -0,0 +1,314 @@
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
+#define SGM3804_VOLTAGES_MAX_SELECTOR	0x2f
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
+		int ret;
+
+		/* At least a GPIO is up, we can write registers */
+		regcache_cache_only(ctx->regmap, false);
+		ret = regcache_sync(ctx->regmap);
+		if (ret) {
+			regcache_cache_only(ctx->regmap, true);
+			return ret;
+		}
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
+		.n_voltages = SGM3804_VOLTAGES_MAX_SELECTOR + 1,
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
+		.n_voltages = SGM3804_VOLTAGES_MAX_SELECTOR + 1,
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

