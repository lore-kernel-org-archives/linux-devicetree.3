Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA20946E01A
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984301; cv=none; b=lII9xtTvDz1OPGI6rkdNMIpsawZJ0mmKmcuOcUZTL44hqLLh4cjxPaetBtWv+3QA6LAu3fkp3uGd2U1AR3Yiq0VSQxf/eTAp3mgZGqchm6nlEdEgm3DZdGhZa1Rz6H9pluTaxNI1sDr7r8KmD+vw4FVK5+hP+TDtpLwFp6E56JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984301; c=relaxed/simple;
	bh=2Ad1//ANn9jUaWSto1gTo1V2AWdLh+AOOX+UNys/6/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IgMp5aoaHX+kVJg+DmDWa7pX3CVyEQd+ob1KCD0vaVnrV/TgKMjlvhbGDtIllFVAiAx16XszwPhDaOF+i0ADzOmwh/bghVSuNWR44vRpTx1wc15+ks36BZ2L89C5aJLcgPFnvSVnAX7omXyIIVjX+qtR6q6ekNkEQiBrkHKYkDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o6lASGgL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o6lASGgL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so15796225e9.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 02:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789984297; x=1790589097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jgsi8s/TxKszCjwnnjlFdNO+l6uZRRARfJHburMqhtU=;
        b=o6lASGgLyrAk12B1GZIa0bwqS2wZwxLfmh0SdiPCFelUA0pmNsWHeUWfC9DxeJ34Yo
         PfB0MUcY+d/utRx59WPznaOlXsGw47ZSAXmhAr0TnVN84pAKR08EhEdRMS/ySfs+7Lz+
         FbaAoe++IJyDdVwQNme0bVUGtE1CPwE/Nd3ItTkcYhFirr8Nngm916CCr5M/46q1AkVh
         SVCogIRCiXQZNLUsz89E81+sSWzRx/T52lvGTgXLLAvpm2cZ5EqkCWw7+IQ/85DoPSC7
         CQMU6tHYAL+9QsFfzgir0+qXlHOOOY9r1DO80maIVtoV1RQO1kPk8lvAS3f8iby9l6xI
         yhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984297; x=1790589097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jgsi8s/TxKszCjwnnjlFdNO+l6uZRRARfJHburMqhtU=;
        b=bhK1COFPv0PDI+xye0yVsoMfeR0m4Zfvf/ARxUocPwz/7jOmyD7l+O0uRQaoYAEuDE
         Z0PXH5akFmq1fuoW79SVTRiyg98Tin/ET7nsFyBv0/98EP+NI3cuCHaYw4GT9oZbFe23
         cCP3etZ5zhuTr1MzrTEsoRYjOfeTZG1yrTVBSvGd5mQXzp4o3vlzx1Ox/TEHE+ZFjSGD
         p7koOuhmqJ4focwqKkYtdxP9il4vU/HhbDXtAw75ET60JVLs7638bk1G/wTGSjoc/dKt
         MhxUH4zJ7xA6YIqpA2l4b+4D7jUUG3IwdSBjLtEJI6epd5gRdudvGLklSE2hpDIHDoc5
         V+Bg==
X-Gm-Message-State: AFuF++kcQMAGcYqupZq7zTe4f9Rj8qGO4kMBLDOQ9bWmqw3x/XRBwDTY
	9Im4NDXLditKRogRqBIZsthcYOQbkO3Pf4hgjoBMmJEVCN6pVcnmzcfRQLHDgMsnWNI=
X-Gm-Gg: AYBFou2FBA+LYlhwXhzX2uJEt3AkNxE7FTbsBLWuiQp62VDSm4jcJ2EMg1xw0eQWL1j
	1Vu8QYnEQAYeo1vq1NeQgKV2ElAa91aks28XiggZF7Ei/jEIijZ42+7yXxJNZhOOMhJ+GMmjfCk
	wxQpoW871aFnFRnZWeORXdPIS1KrVnjNPHxBc7AkgqsA1THitmoqzVj9ZMgxY0YxeXIoUNWwGHk
	FJcMMnDmIJTQimFuVg5iaoBb8AQhUV51FN2y8gSBqZDTaH9GFa+Jpeg0y/dDZZ4hn/8MThs158x
	vp4NW2jNclhqnxXs8rsSlAY3aCeaG8kU9HZT6VfkMDJehyvtpRB0NMwdM7RILVSP0g4LzPhoEde
	ZkCeDjUXxf/159ybs/N6mPPv+phzPRcYM/rQaghstbrYFOffndsgZCYqtUszlNyE0hYhIEn4i1i
	mfNMAG1f1/PqYZLILD1f5nNR2vDYhkTxodFvL9d1T0tlLUgkFMs4xIPP9Zuh56b4ueMYOPOZC5B
	dkNAf3D8E8weVs9bLRR
X-Received: by 2002:a05:600c:6305:b0:49f:c2ef:cfb9 with SMTP id 5b1f17b1804b1-49fc56719a8mr110540865e9.4.1789984296651;
        Mon, 21 Sep 2026 02:51:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd03fe55sm254330365e9.2.2026.09.21.02.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:51:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 21 Sep 2026 11:51:32 +0200
Subject: [PATCH v2 3/3] regulator: add regulator driver for the Nexperia
 NEX10000UB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-topic-sm8x50-nex10000ub-v2-3-eeeaf9b0c913@linaro.org>
References: <20260921-topic-sm8x50-nex10000ub-v2-0-eeeaf9b0c913@linaro.org>
In-Reply-To: <20260921-topic-sm8x50-nex10000ub-v2-0-eeeaf9b0c913@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6646;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=2Ad1//ANn9jUaWSto1gTo1V2AWdLh+AOOX+UNys/6/8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqsP4lzVzzGMsbjcvCm0G3iY0mqkw/vMvUjfkRC2bE
 WFGSe/WJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarD+JQAKCRB33NvayMhJ0ZcpEA
 CO18GV/ozAYuwCNWjr0CHoMFZb0rREfFJuq6aDSwZIMwA5kg5dw4HWb+yD3as5TscrpQ/t5JN55YY0
 9/OrTqRzPpseCcgwmB8zFMlPNASRsX6vUO1xzZdHPTyf+tmoZQ7G2w+BgcV3O6JhEL7dhhD0GpnthX
 Y8iS0prRiE0Wcz0dOFNTY8YiJqUhl2+nqHZaa6LcTrSpLCxvwsginzHMefxH8lgLDDjmx7I+E/8GGj
 vxeCzL01c/yDq7JE+z4ayGWJ8Zwqxx8Nc21hlAuUYLNBfLSiYSveojRXtQh6MDcks+7pos/TeXP9A0
 zeQQyuhddaTgGmHxzAb7KXyokC+uqiUJds4FdGdn+4ZyBKBqYcSAFfG4af9zX1npE0eMBfP9Foj4SH
 b3UGF8yotgn/SnjsJmXUmjZVA4713kRyeZndqnJWf5vvXK5g7LCEmRyApBjgvdCbbJji6NWuOh7s4a
 Iw/skQ9GNVjLbR2m/tEovCwFzsw9yH+xsf0YLkBr+TRjGkAx37LR6avsepergLSnHv8hElrHdraZaJ
 i+vC2bJr5GgNbMUzof7+Y1l0a17AjW3Dr7qjTDwIjy1TGjAiPAcCgv4ztonVleHE6/r8OM6+5BvXec
 J5NBYRv3ulGCjvZSBsswSpbnK5ZEGyONJYezCt+Ftm05tYKO5PCUtuJ0PLdA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add regulator support for the Nexperia NEX10000UB dual output LCD
bias power supply which provides programmable positive and negative
output voltages mainly for display panels applications.

The driver supports setting the output voltage from 4V to 6V in
100mV steps for each output via the I2C programming interface and
supports the enable GPIOs for both outputs.

Product datashet can be found online at [1].

[1] https://assets.nexperia.com/documents/data-sheet/NEX10000UB.pdf

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/regulator/Kconfig                |   8 ++
 drivers/regulator/Makefile               |   1 +
 drivers/regulator/nex10000ub-regulator.c | 147 +++++++++++++++++++++++++++++++
 3 files changed, 156 insertions(+)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 89789ac7a786..4b98ce62ba01 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1020,6 +1020,14 @@ config REGULATOR_MTK_DVFSRC
 	  of Mediatek. It allows for voting on regulator state
 	  between multiple users.
 
+config REGULATOR_NEX10000UB
+	tristate "Nexperia NEX10000UB Dual Output Power regulators"
+	depends on I2C && GPIOLIB
+	select REGMAP_I2C
+	help
+	  This driver supports the NEX10000UB single inductor - dual output
+	  power supply specifically designed for display panels.
+
 config REGULATOR_PALMAS
 	tristate "TI Palmas PMIC Regulators"
 	depends on MFD_PALMAS
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8df8..907efdf644eb 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -120,6 +120,7 @@ obj-$(CONFIG_REGULATOR_MT6370) += mt6370-regulator.o
 obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
 obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
 obj-$(CONFIG_REGULATOR_MTK_DVFSRC) += mtk-dvfsrc-regulator.o
+obj-$(CONFIG_REGULATOR_NEX10000UB) += nex10000ub-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_LABIBB) += qcom-labibb-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_PM8008) += qcom-pm8008-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_REFGEN) += qcom-refgen-regulator.o
diff --git a/drivers/regulator/nex10000ub-regulator.c b/drivers/regulator/nex10000ub-regulator.c
new file mode 100644
index 000000000000..f44b8b7906b9
--- /dev/null
+++ b/drivers/regulator/nex10000ub-regulator.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Nexperia NEX10000UB Regulator driver
+ *
+ * Copyright (C) 2026 Linaro Limited.
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+
+#define NEX10000UB_REG_VPOS		0x00
+#define NEX10000UB_REG_VNEG		0x01
+#define NEX10000UB_REG_ID		0x02
+
+#define NEX10000UB_VOUT_MASK		0x1F
+#define NEX10000UB_VOUT_N_VOLTAGE	0x15
+#define NEX10000UB_VOUT_VMIN		4000000
+#define NEX10000UB_VOUT_VMAX		6000000
+#define NEX10000UB_VOUT_STEP		100000
+
+#define NEX10000UB_REGULATOR_ID_VPOS	0
+#define NEX10000UB_REGULATOR_ID_VNEG	1
+#define NEX10000UB_MAX_REGULATORS	2
+
+static const struct regulator_ops nex10000ub_regulator_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = regulator_list_voltage_linear,
+	.map_voltage = regulator_map_voltage_linear,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+};
+
+static int nex10000ub_of_parse_cb(struct device_node *np,
+				  const struct regulator_desc *desc,
+				  struct regulator_config *config)
+{
+	struct gpio_desc *ena_gpiod;
+
+	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), "enable", 0,
+					   GPIOD_OUT_LOW, desc->name);
+	if (IS_ERR(ena_gpiod))
+		return PTR_ERR(ena_gpiod);
+
+	config->ena_gpiod = ena_gpiod;
+
+	return 0;
+}
+
+#define NEX10000UB_REGULATOR_DESC(_id, _name)			\
+	[NEX10000UB_REGULATOR_ID_##_id] = {			\
+		.name = "nex10000ub-"#_name,			\
+		.supply_name = "vin",				\
+		.id = NEX10000UB_REGULATOR_ID_##_id,		\
+		.of_match = of_match_ptr(#_name),		\
+		.of_parse_cb = nex10000ub_of_parse_cb,		\
+		.ops = &nex10000ub_regulator_ops,		\
+		.n_voltages = NEX10000UB_VOUT_N_VOLTAGE,	\
+		.min_uV = NEX10000UB_VOUT_VMIN,			\
+		.uV_step = NEX10000UB_VOUT_STEP,		\
+		.enable_time = 2000,				\
+		.vsel_mask = NEX10000UB_VOUT_MASK,		\
+		.vsel_reg = NEX10000UB_REG_##_id,		\
+		.type = REGULATOR_VOLTAGE,			\
+		.owner = THIS_MODULE,				\
+	}
+
+static const struct regulator_desc nex10000_regs_desc[NEX10000UB_MAX_REGULATORS] = {
+	NEX10000UB_REGULATOR_DESC(VPOS, vpos),
+	NEX10000UB_REGULATOR_DESC(VNEG, vneg),
+};
+
+static const struct regmap_config nex10000ub_regmap_config = {
+	.reg_bits	= 8,
+	.val_bits	= 8,
+	.max_register	= NEX10000UB_REG_ID,
+	.cache_type	= REGCACHE_NONE,
+};
+
+static int nex10000ub_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct regmap *map;
+	int id;
+	int ret;
+
+	map = devm_regmap_init_i2c(client, &nex10000ub_regmap_config);
+	if (IS_ERR(map)) {
+		ret = PTR_ERR(map);
+		dev_err(dev, "regmap init failed: %d\n", ret);
+		return ret;
+	}
+
+	for (id = 0; id < NEX10000UB_MAX_REGULATORS; ++id) {
+		struct regulator_config config = { };
+		struct regulator_dev *rdev;
+
+		config.regmap = map;
+		config.dev = dev;
+
+		rdev = devm_regulator_register(dev, &nex10000_regs_desc[id],
+					       &config);
+		if (IS_ERR(rdev)) {
+			ret = PTR_ERR(rdev);
+			dev_err(dev, "regulator %s register failed: %d\n",
+				nex10000_regs_desc[id].name, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct i2c_device_id nex10000ub_id[] = {
+	{ .name = "nex10000ub" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, nex10000ub_id);
+
+static const struct of_device_id __maybe_unused nex10000ub_of_match[] = {
+	{ .compatible = "nexperia,nex10000ub" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, nex10000ub_of_match);
+
+static struct i2c_driver nex10000ub_i2c_driver = {
+	.driver = {
+		.name = "nex10000ub",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.of_match_table = of_match_ptr(nex10000ub_of_match),
+	},
+	.probe = nex10000ub_probe,
+	.id_table = nex10000ub_id,
+};
+
+module_i2c_driver(nex10000ub_i2c_driver);
+
+MODULE_DESCRIPTION("NEX10000UB regulator driver");
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
+MODULE_LICENSE("GPL");

-- 
2.34.1

