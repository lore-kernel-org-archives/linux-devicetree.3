Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A85495AC6
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716373; cv=none; b=JZU1IapfHH/oNgioA/wlpJMFgtR5v8fxERIgSNE6UllLAkec/iwHqhSJfzjw53SoKyE0jYaEY4S5+aq7qQdza+0l0wtvHFxzgGER4Ya24AHyqo24E6aypJtN5F/okaMwjYBXKVTy/a6Xj//TsFVbbGabOqfNq+o0i/mbzZoxSpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716373; c=relaxed/simple;
	bh=epSLdb651MrkntMU4XB6cXcgOiuC2kVhWEx1L8cR5y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tJnNYsSNKMdBH8Yez9aj/CjoXdGZstg0oawJNdnv1aNSZaLz3deoZkwNtgDcv31qDQq0NZt8H8q0dHuHN3MbjR+n+YeicNeK04y8b5q4u9U3MtODgCDu16atu/xHJHesD9OS1WsZ5GxAQl8cw+CSymWuOzrBAOIbwaWTljGaZs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fA77lZSr; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fA77lZSr"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so1982955e9.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 00:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789716345; x=1790321145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bNYpa68S4DBjavPMqThufQRfvpiQXbIDxaTmfzv5czw=;
        b=fA77lZSr55nh0/zesHi02P1FuYZfmikcIJbXWtj5PO5V7aB7krWtARJpiPv8L0gLmb
         yOot/hDJ7Qf+JgnFnpCHfjl2Isi7kjoqgsuaUTtKt5UrhtlwPHSwFuOGgkA1v7RodhvX
         3k01A025yuAqx18QZchRQKw8IKsLTMrrQPx85j4QlYnnvD0avkyPmJkXbu5JH+WuJv1V
         5/bpCIgENp5CkI0ZVSxoox7gZb0wmnWYFdHMu774XQCOGc55ZGibQob3V9F4nnQ40kSK
         PCQX0TJ9UNVe18sU5oM7MYeGX4bleBVwKDpXWKkf5FqYBwAHwN0tgQBfuzx8OGD3XhpA
         zuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716345; x=1790321145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNYpa68S4DBjavPMqThufQRfvpiQXbIDxaTmfzv5czw=;
        b=Ftfj4gFkmRh+iBb6ilCXYFWNSwFSm10EtYCV661y2Ysq8q3j7sLzsOGdxHvQDNasUo
         bDUy1LKbkp4JsaVAvBUmawIIzFJN1wVqV5OvYIecOvqKbpvteQwx0BPNXevGA0u+6cR2
         mmzq387RRuhvsH1UEI1p6SzNIZ2Ule4MI9QilfCkP4BV9TdldkBBo4kbbABleEoOrbN1
         mYzUM/VvABglLGx/Iy3KhXQXJR5WwwU2EfiTDDhP+fTf4FqIzKapfOSnMIJp8hv5Qm10
         o05ldYlgD44o6UJxdtvZgUb5a3WYB4pRD3FXF1C8R+W2cQ3Hpy+rMcdre34ur08IzXUT
         u8bA==
X-Gm-Message-State: AFuF++lLLhlvCWWADUK1B/K+fFpRNfZXbx8ZIzmAxnE5cB5mQiFSiwe6
	LDsWdLnUOSGrWp7Fso6bBszVL8BF+BW2Oxb4NHixTvXSwxMGaG8mfFAlovlPmFuVW9E=
X-Gm-Gg: AYBFou1IjbVyxxoIrX5G5cbcsKjaZXXTyyOmdQhw6uKCc0jfNY0rrKYMhJQB/RfUJg/
	m6ycJfs65Va7LrKJCgQOEv94ZWOnsRoj8XOQVmisSjbgKBpMHp7XkGvfJaDuAxzir4bsRMjV748
	ovDHOSRUNL0Muh/lyYGX8msqyvp1iv1zHSDBGT5orGl7/tbn11BPucaEpa0SB5qZHoRWS+x9cZR
	z06IF0w7F5GB7WD4LBpIafsYYGZCL6ogWfBB7sv7BTpEDLn5r3PjJR7pFHLfCPO/Ria+wMvLUeS
	TJhMnL9hytIOcUvdLZKg19ZzX+9z3WV2US7HXuGjLAzzqtB6VPgWwvI+2QkLJBMZy6W4CltlRn3
	iF2u46RsJ+EVp6qB3U4C2UxFjt0pYoBjmteE5bGuY6LCHwG8fVntDld6mxyIjKqXXSxzxoGiUzI
	EkStI8/UefLmwpcbc7heAYxkCqMGd6LgdaMTxnDIX+brhWv95qaBG+fY0GkkZqpxsAOSqnqJnE8
	qqQ0xR/EcYrEQ==
X-Received: by 2002:a05:600c:4e0a:b0:49d:29ab:540b with SMTP id 5b1f17b1804b1-49fc5723f3cmr16888655e9.15.1789716345332;
        Fri, 18 Sep 2026 00:25:45 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm139523555e9.6.2026.09.18.00.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:25:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 18 Sep 2026 09:25:39 +0200
Subject: [PATCH 3/3] regulator: add regulator driver for the Nexperia
 NEX10000UB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-sm8x50-nex10000ub-v1-3-5afe06bace03@linaro.org>
References: <20260918-topic-sm8x50-nex10000ub-v1-0-5afe06bace03@linaro.org>
In-Reply-To: <20260918-topic-sm8x50-nex10000ub-v1-0-5afe06bace03@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6643;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=epSLdb651MrkntMU4XB6cXcgOiuC2kVhWEx1L8cR5y8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqrOd2JVBi/mk3vZAY9fMtCEEFv4FVJ5Wzr1ro+EuW
 spffDnWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaqzndgAKCRB33NvayMhJ0R2JD/
 9AlXR366Fc2d1xHkC5e4BjUVAPJF3hQkcJjyOumcrFTOTwmWrC6l/A9Gc12HjZSBetET8CooVLiWx+
 04TNSGrI54RD0iC9zbxL78YBObSsGhFS8kzZVvv/XtQFjRlVUjc96yEd+shVnxoTn14vfxBfBC3EW2
 ZgEenqOrw5GCHjR8xiTClAfHF7WZdvbjparF7cedI4Qm7VFEzGfSDhNhUMVOUIiznwUglqPiVDCDah
 CMX7ea5xjKXSsoHj5C2C99h5VxApXIwZ0J3ERxRegH65aDpGc3T+zQnEe78DyiQceQtL8TWmT7GuaC
 83mQpxgIxLuuNCZuZA/FuZQEez7GQp5B6sS/QS6B0TiW3pwnHcHMOecNnX6LWed6ZC+4j3plP+HvqA
 oXEvKCjeqmnmPMxGW8ivm5n0J0WI3kRXpxGgRAcDLkdiy9ybiVHDGckp4c561AfWxp5chrNzBicD5h
 bTpaGbcCwj69CIChFzV+/+2I+aKG6+rkRQIXhqivfX7KJ+nWoVBF2IGR6+Ak8ZtpSV0egnwv1ybEg/
 O/2s33fVPwpq222BzmAMGAnny/uoZKBa9opTuMGHU6ac+9w8S5F/GgG2CNigIkA9xfxQF6SI70iGJh
 pLaL1TVSQQNQwN+yMATLmHsL3HWMhkijWP0IllL5E4uiO2dZr9AKKKnhDGRg==
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
index 000000000000..b45a805d5601
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
+					   GPIOD_ASIS, desc->name);
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

