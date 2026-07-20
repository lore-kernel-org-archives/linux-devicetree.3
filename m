Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA774340413
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 11:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546458; cv=none; b=iufyWecPoj2LHi/1+Q11UFVlrHm064X8V/JVsp7TYSZl/30sQ040pUTYcIcg+5I9XUvqGJ1cqrOFtcjpsPqznW206EiCz7Vvwj+rhOhO7hWl1B3z9cYcvZqUPvr20VgjrkKhRGUS6R8WBOx9+Nu4Y1MDNQ1bZ2HOe/agn4pSym8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546458; c=relaxed/simple;
	bh=wXqZSdqvIcJKWS3NHh7hSZzb0Fy4RHTv7j5v15ANLnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YIw3jiG+oL2g3stJGa30zjbY+fGZAJl9cjdZMjV8+5kavkteWhtLLPcVqsgmJg6rdkPHDV2roQohdBeW1lbdRxjfzjcxf2BzhpOxOw0MeSejY+TlXvQpsC/JnUVE9g8umcrZmi6iVNX58N5lPEDI1fFjCZ7Vot1dNi+Vvdg1+YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OBNw+tFx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OBNw+tFx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954dff6536so16429915e9.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 04:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784546451; x=1785151251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nLCXRdYBbzsqqU+KjFO/DdbrpddiifvGaDhMVqXEjUY=;
        b=OBNw+tFx2lkKhP84nCU0zQmgB0urTeCEPo5dQEX90ViCqx/ttT9LtDmAqTkGsJyPrG
         RaMsbMFRgavqaZA+O2roa3HpI5ls+WN978b+ugCtq4CEvM1Ca14TQrUbYSlDf4T5PqjH
         8kk0qWczDOQpgRz+dgf1KUYrUWEcGMoH8m2KJze4D44oauD18yHwRBQ2UbmFWt7HGxa9
         QvMmbRUtzjMnS7tA7WeCqHzpS4mrZHOPgPQuT7rrVhIKepQn+cqo1X37A/yIRCYS9aZ/
         Q5sdF8H7yi5RPNxESOTm7rYthrz/VUFyXslKVaNQBc6IWyT29Eu1GV3wUDHo+UL40QTG
         GfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784546451; x=1785151251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nLCXRdYBbzsqqU+KjFO/DdbrpddiifvGaDhMVqXEjUY=;
        b=EZoVlUnYxf44ycN6vPrYvMA/hIh9ektJ+sUTe5eA5XsV4X1xZ2osAp0A9wt86X1bhP
         +Qu594+mYv8Q8oOD9V2eYdiboQrEQiQKNh8cmWQIO6bcZ9gOS7Y6V2fTHayD+tg4AqVy
         B3D4mzZBakSHT8/46G47MqLlIoVqksyz6oxcWgZL1B26XWb/AxD9UOUUXunsBiYKGmSE
         xlPyT88DUZ6SvJbLJkI1Nn0Jpy8S2hgiAPNgeYwm+XXUXsgkZZQZCJsdz2QfLKnNZXYs
         7kPopvf4A6XilObV11EHyQLO8JkqSr419X4ufOarvHL3yywVccKcxwfHmSLaPwyVabm4
         Xusw==
X-Gm-Message-State: AOJu0YzxniQez4Po3ag7HUpaCJsWR/CUVQo6JHDUzp1rixkp3I8gSnkF
	9haSfx7+GbKBJcsVfU8iCBo0vbZ2n/DwnwjMWfQJF7e42bKP2zWVM3N9uEpt6yTeFKJzYZ/jIAV
	NHWy3
X-Gm-Gg: AfdE7ckAWGpS4/CezMWZfTKxRZeQWfcfP1ZIHx83Wl8TGmPB8iNhifCGE5gIDq0/j4V
	3Z/xggCjE+dS88f/exEN/FA6mN075gn6hK/pUsiuMcUasAeEanzJjiYvt2Ph2jXEToeqcxtGLci
	xogRJQ2Ms0QaA1pM14XnDGeshGzmA4Ow0wRxLgcivjwreykJ3XR8yOT68s0sRDV10uiz4Tdmtxd
	wGal30EvzuzmBZnz+YQ1r48KZOZQdalklOlkwUhIg/qGvBj5sHLOKah03mfc6L+W9RcPnGt1C1D
	ti+93C8ucrEOfBjjc4aNm72m00i0H4lyQsFY8Yh8kfRpRty6bmzLX3FvjJuKVezlmv5lG/inTzj
	zChKyY8mJhM45ui95ZuX+9bMJiGQOfYCBfRiU90bppYgbADwzUGJU7u/e6ZeiOQ9LIyJadi7j3M
	Wp
X-Received: by 2002:a05:600c:630e:b0:495:4856:2659 with SMTP id 5b1f17b1804b1-4954a3db6b0mr152920055e9.9.1784546451047;
        Mon, 20 Jul 2026 04:20:51 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:f341:e28f:dde9:3687])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4955a9e5f26sm85490455e9.0.2026.07.20.04.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:20:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 20 Jul 2026 13:20:31 +0200
Subject: [PATCH v5 4/5] mfd: axp20x: Add support for AXP318W PMIC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-axp318-regulator-v5-4-a1afa7ee24f9@baylibre.com>
References: <20260720-axp318-regulator-v5-0-a1afa7ee24f9@baylibre.com>
In-Reply-To: <20260720-axp318-regulator-v5-0-a1afa7ee24f9@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11128; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=lCIoI2OR8DW2EqdOmZne0ZKTXbwoT8DKQPeKDXJ7r8I=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqXgSGvBFCQU8gvp7Z3sQDgjiiF1/O05oN0QDZq
 2OFUAtOJJGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCal4EhgAKCRDm/A8cN/La
 hdUkEACY3n1RtJODCv/gBi1cQXgVKtGp1k6v/BoIreUYH3lk7C2h3PbjVn/L5yyYfUYamn7uxG+
 TG6Dhz0pEFvAAzLcKRuy7UTnrSqqJ5fLstCa2l1jEXC5YXUElKn2a5Ty4pPsUAuWZDHEGwNQKTs
 BUhSkD9/zjNt4KTq4ZvSCqf/YL2FgaKp/bmbSHqafohgnFDZiAoquTQ+HZeYjekHr89P+Y0Ucw3
 VjwLBCbCpwpiJ4ydVNRR3bq1MZhlXwjtgLcQ9Q6gZ5GG/Jgq6/s7C1aLCvkOHp5gxSwtmCQXC4y
 Rfy1gBessTaN9uetBHOKAUPNd+3vIGwf1HaEzHe4wwon6akrcT51g9oWPrEudnFn7DObRTtXjxn
 4NmZdPxk8CwBcZfqkWjVx6IckhusUj4OBiXzcFi4SjRhTnHlA/ckrvy2pZ9WQnLiLonEJhU0j0Y
 Cy/ty8MH4zdzupxeyIBwnGuioActHGGKKKmYyKMoqRGIhduhkmgYRro4NVVYNNNh4SF5hDlnKyV
 z/I4oHc7hqw+OFapfvGGhBRDl190L9djKk7eUD2PeWGr8tfF6M7SMOt/UWO+eB854uhPQoBZ2i9
 3OB91/+vZRs9fse1Fn9FEDLDVQ3VVdJDzdZzJkuudv0NQOijMWpUVSs73v0wNA+e7azcWRnDWwE
 N8lpzH1f+B+1p8A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

From: Andre Przywara <andre.przywara@arm.com>

The AXP318W is a PMIC chip produced by X-Powers, it can be connected to
an I2C bus.

It has a large number of regulators: 9(!) DCDC buck converters, and 28
LDOs, also some ADCs, interrupts, and a power key.

Describe the regmap and the MFD bits, along with the registers exposed
via I2C only. This covers the regulators and interrupts for now.
Advertise the device using the new compatible string.

We use just "318" for the internal identifiers, for easier typing and
less churn, but use "318W" for anything externally visible. If something
else other than the "AXP318W" shows up, that's an easy change then.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x-i2c.c   |  2 ++
 drivers/mfd/axp20x.c       | 81 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/axp20x.h | 88 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 171 insertions(+)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index a76bec5604c4..64c212b76e5e 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -66,6 +66,7 @@ static const struct of_device_id axp20x_i2c_of_match[] = {
 	{ .compatible = "x-powers,axp221", .data = (void *)AXP221_ID },
 	{ .compatible = "x-powers,axp223", .data = (void *)AXP223_ID },
 	{ .compatible = "x-powers,axp313a", .data = (void *)AXP313A_ID },
+	{ .compatible = "x-powers,axp318w", .data = (void *)AXP318_ID },
 	{ .compatible = "x-powers,axp323", .data = (void *)AXP323_ID },
 	{ .compatible = "x-powers,axp717", .data = (void *)AXP717_ID },
 	{ .compatible = "x-powers,axp803", .data = (void *)AXP803_ID },
@@ -84,6 +85,7 @@ static const struct i2c_device_id axp20x_i2c_id[] = {
 	{ .name = "axp221",	.driver_data = AXP221_ID },
 	{ .name = "axp223",	.driver_data = AXP223_ID },
 	{ .name = "axp313a",	.driver_data = AXP313A_ID },
+	{ .name = "axp318w",	.driver_data = AXP318_ID },
 	{ .name = "axp323",	.driver_data = AXP323_ID },
 	{ .name = "axp717",	.driver_data = AXP717_ID },
 	{ .name = "axp803",	.driver_data = AXP803_ID },
diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 84839d4aa1ca..ea00c0cdce58 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -42,6 +42,7 @@ static const char * const axp20x_model_names[] = {
 	[AXP223_ID] = "AXP223",
 	[AXP288_ID] = "AXP288",
 	[AXP313A_ID] = "AXP313a",
+	[AXP318_ID] = "AXP318W",
 	[AXP323_ID] = "AXP323",
 	[AXP717_ID] = "AXP717",
 	[AXP803_ID] = "AXP803",
@@ -218,6 +219,31 @@ static const struct regmap_access_table axp313a_volatile_table = {
 	.n_yes_ranges = ARRAY_SIZE(axp313a_volatile_ranges),
 };
 
+static const struct regmap_range axp318_writeable_ranges[] = {
+	regmap_reg_range(AXP318_DCDC_OUTPUT_CONTROL1, AXP318_IRQ_STATE4),
+	regmap_reg_range(AXP318_SHUTDOWN_SRC_CTRL1, AXP318_TEMP_ADC_H_EN),
+	regmap_reg_range(AXP318_DIE_TEMP_ADC_H_EN, AXP318_DIE_TEMP_ADC_H_EN),
+	regmap_reg_range(AXP318_GPADC_H_EN, AXP318_GPADC_H_EN),
+	regmap_reg_range(AXP318_GPIO_CTRL, AXP318_WDOG_CTRL),
+};
+
+static const struct regmap_range axp318_volatile_ranges[] = {
+	regmap_reg_range(AXP318_IRQ_EN1, AXP318_IRQ_STATE4),
+	regmap_reg_range(AXP318_POWER_REASON, AXP318_SHUTDOWN_SOURCE),
+	regmap_reg_range(AXP318_TEMP_ADC_H_EN, AXP318_GPADC_L),
+	regmap_reg_range(AXP318_GPIO_INPUT, AXP318_GPIO_INPUT),
+};
+
+static const struct regmap_access_table axp318_writeable_table = {
+	.yes_ranges = axp318_writeable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(axp318_writeable_ranges),
+};
+
+static const struct regmap_access_table axp318_volatile_table = {
+	.yes_ranges = axp318_volatile_ranges,
+	.n_yes_ranges = ARRAY_SIZE(axp318_volatile_ranges),
+};
+
 static const struct regmap_range axp717_writeable_ranges[] = {
 	regmap_reg_range(AXP717_PMU_FAULT, AXP717_MODULE_EN_CONTROL_1),
 	regmap_reg_range(AXP717_MIN_SYS_V_CONTROL, AXP717_BOOST_CONTROL),
@@ -447,6 +473,15 @@ static const struct regmap_config axp313a_regmap_config = {
 	.cache_type = REGCACHE_MAPLE,
 };
 
+static const struct regmap_config axp318_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.wr_table = &axp318_writeable_table,
+	.volatile_table = &axp318_volatile_table,
+	.max_register = AXP318_WDOG_CTRL,
+	.cache_type = REGCACHE_MAPLE,
+};
+
 static const struct regmap_config axp323_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -663,6 +698,28 @@ static const struct regmap_irq axp313a_regmap_irqs[] = {
 	INIT_REGMAP_IRQ(AXP313A, DIE_TEMP_HIGH,		0, 0),
 };
 
+static const struct regmap_irq axp318_regmap_irqs[] = {
+	INIT_REGMAP_IRQ(AXP318, DCDC8_V_LOW,		0, 7),
+	INIT_REGMAP_IRQ(AXP318, DCDC7_V_LOW,		0, 6),
+	INIT_REGMAP_IRQ(AXP318, DCDC6_V_LOW,		0, 5),
+	INIT_REGMAP_IRQ(AXP318, DCDC5_V_LOW,		0, 4),
+	INIT_REGMAP_IRQ(AXP318, DCDC4_V_LOW,		0, 3),
+	INIT_REGMAP_IRQ(AXP318, DCDC3_V_LOW,		0, 2),
+	INIT_REGMAP_IRQ(AXP318, DCDC2_V_LOW,		0, 1),
+	INIT_REGMAP_IRQ(AXP318, DCDC1_V_LOW,		0, 0),
+	INIT_REGMAP_IRQ(AXP318, PEK_RIS_EDGE,		1, 6),
+	INIT_REGMAP_IRQ(AXP318, PEK_FAL_EDGE,		1, 5),
+	INIT_REGMAP_IRQ(AXP318, PEK_LONG,		1, 4),
+	INIT_REGMAP_IRQ(AXP318, PEK_SHORT,		1, 3),
+	INIT_REGMAP_IRQ(AXP318, DIE_TEMP_HIGH_LV2,	1, 2),
+	INIT_REGMAP_IRQ(AXP318, DIE_TEMP_HIGH_LV1,	1, 1),
+	INIT_REGMAP_IRQ(AXP318, DCDC9_V_LOW,		1, 0),
+	INIT_REGMAP_IRQ(AXP318, GPIO3_INPUT,		2, 6),
+	INIT_REGMAP_IRQ(AXP318, GPIO2_INPUT,		2, 5),
+	INIT_REGMAP_IRQ(AXP318, GPIO1_INPUT,		2, 4),
+	INIT_REGMAP_IRQ(AXP318, WDOG_EXPIRE,		3, 0),
+};
+
 static const struct regmap_irq axp717_regmap_irqs[] = {
 	INIT_REGMAP_IRQ(AXP717, SOC_DROP_LVL2,		0, 7),
 	INIT_REGMAP_IRQ(AXP717, SOC_DROP_LVL1,		0, 6),
@@ -884,6 +941,17 @@ static const struct regmap_irq_chip axp313a_regmap_irq_chip = {
 	.num_regs		= 1,
 };
 
+static const struct regmap_irq_chip axp318_regmap_irq_chip = {
+	.name			= "axp318w_irq_chip",
+	.status_base		= AXP318_IRQ_STATE1,
+	.ack_base		= AXP318_IRQ_STATE1,
+	.unmask_base		= AXP318_IRQ_EN1,
+	.init_ack_masked	= true,
+	.irqs			= axp318_regmap_irqs,
+	.num_irqs		= ARRAY_SIZE(axp318_regmap_irqs),
+	.num_regs		= 4,
+};
+
 static const struct regmap_irq_chip axp717_regmap_irq_chip = {
 	.name			= "axp717_irq_chip",
 	.status_base		= AXP717_IRQ0_STATE,
@@ -1061,6 +1129,10 @@ static const struct mfd_cell axp313a_cells[] = {
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
 };
 
+static const struct mfd_cell axp318_cells[] = {
+	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
+};
+
 static const struct mfd_cell axp717_cells[] = {
 	MFD_CELL_NAME("axp20x-regulator"),
 	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
@@ -1248,6 +1320,9 @@ static int axp20x_power_off(struct sys_off_data *data)
 	case AXP313A_ID:
 		shutdown_reg = AXP313A_SHUTDOWN_CTRL;
 		break;
+	case AXP318_ID:
+		shutdown_reg = AXP318_SHUTDOWN_CTRL;
+		break;
 	default:
 		shutdown_reg = AXP20X_OFF_CTRL;
 		break;
@@ -1312,6 +1387,12 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
 		axp20x->regmap_cfg = &axp313a_regmap_config;
 		axp20x->regmap_irq_chip = &axp313a_regmap_irq_chip;
 		break;
+	case AXP318_ID:
+		axp20x->nr_cells = ARRAY_SIZE(axp318_cells);
+		axp20x->cells = axp318_cells;
+		axp20x->regmap_cfg = &axp318_regmap_config;
+		axp20x->regmap_irq_chip = &axp318_regmap_irq_chip;
+		break;
 	case AXP323_ID:
 		axp20x->nr_cells = ARRAY_SIZE(axp313a_cells);
 		axp20x->cells = axp313a_cells;
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index 1badb4868d17..0191467de4ec 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -19,6 +19,7 @@ enum axp20x_variants {
 	AXP223_ID,
 	AXP288_ID,
 	AXP313A_ID,
+	AXP318_ID,
 	AXP323_ID,
 	AXP717_ID,
 	AXP803_ID,
@@ -116,6 +117,71 @@ enum axp20x_variants {
 #define AXP313A_IRQ_STATE		0x21
 #define AXP323_DCDC_MODE_CTRL2		0x22
 
+#define AXP318_DCDC_OUTPUT_CONTROL1	0x10
+#define AXP318_DCDC_OUTPUT_CONTROL2	0x11
+#define AXP318_DCDC1_CONTROL		0x12
+#define AXP318_DCDC2_CONTROL		0x13
+#define AXP318_DCDC3_CONTROL		0x14
+#define AXP318_DCDC4_CONTROL		0x15
+#define AXP318_DCDC5_CONTROL		0x16
+#define AXP318_DCDC6_CONTROL		0x17
+#define AXP318_DCDC7_CONTROL		0x18
+#define AXP318_DCDC8_CONTROL		0x19
+#define AXP318_DCDC9_CONTROL		0x1a
+#define AXP318_LDO_OUTPUT_CONTROL1	0x20
+#define AXP318_LDO_OUTPUT_CONTROL2	0x21
+#define AXP318_LDO_OUTPUT_CONTROL3	0x22
+#define AXP318_LDO_OUTPUT_CONTROL4	0x23
+#define AXP318_ALDO1_CONTROL		0x24
+#define AXP318_ALDO2_CONTROL		0x25
+#define AXP318_ALDO3_CONTROL		0x26
+#define AXP318_ALDO4_CONTROL		0x27
+#define AXP318_ALDO5_CONTROL		0x28
+#define AXP318_ALDO6_CONTROL		0x29
+#define AXP318_BLDO1_CONTROL		0x2a
+#define AXP318_BLDO2_CONTROL		0x2b
+#define AXP318_BLDO3_CONTROL		0x2c
+#define AXP318_BLDO4_CONTROL		0x2d
+#define AXP318_BLDO5_CONTROL		0x2e
+#define AXP318_CLDO1_CONTROL		0x2f
+#define AXP318_CLDO2_CONTROL		0x30
+#define AXP318_CLDO3_CONTROL		0x31
+#define AXP318_CLDO4_CONTROL		0x32
+#define AXP318_CLDO5_CONTROL		0x33
+#define AXP318_DLDO1_CONTROL		0x34
+#define AXP318_DLDO2_CONTROL		0x35
+#define AXP318_DLDO3_CONTROL		0x36
+#define AXP318_DLDO4_CONTROL		0x37
+#define AXP318_DLDO5_CONTROL		0x38
+#define AXP318_DLDO6_CONTROL		0x39
+#define AXP318_ELDO1_CONTROL		0x3a
+#define AXP318_ELDO2_CONTROL		0x3b
+#define AXP318_ELDO3_CONTROL		0x3c
+#define AXP318_ELDO4_CONTROL		0x3d
+#define AXP318_ELDO5_CONTROL		0x3e
+#define AXP318_ELDO6_CONTROL		0x3f
+#define AXP318_IRQ_EN1			0x40
+#define AXP318_IRQ_EN2			0x41
+#define AXP318_IRQ_EN3			0x42
+#define AXP318_IRQ_EN4			0x43
+#define AXP318_IRQ_STATE1		0x48
+#define AXP318_IRQ_STATE2		0x49
+#define AXP318_IRQ_STATE3		0x4a
+#define AXP318_IRQ_STATE4		0x4b
+#define AXP318_POWER_REASON		0x50
+#define AXP318_SHUTDOWN_SOURCE		0x51
+#define AXP318_SHUTDOWN_SRC_CTRL1	0x52
+#define AXP318_SHUTDOWN_SRC_CTRL2	0x53
+#define AXP318_SHUTDOWN_CTRL		0x55
+#define AXP318_TEMP_ADC_H_EN		0x65
+#define AXP318_TEMP_ADC_L		0x66
+#define AXP318_DIE_TEMP_ADC_H_EN	0x67
+#define AXP318_GPADC_H_EN		0x69
+#define AXP318_GPADC_L			0x6a
+#define AXP318_GPIO_CTRL		0x70
+#define AXP318_GPIO_INPUT		0x71
+#define AXP318_WDOG_CTRL		0x77
+
 #define AXP717_ON_INDICATE		0x00
 #define AXP717_PMU_STATUS_2		0x01
 #define AXP717_BC_DETECT		0x05
@@ -819,6 +885,28 @@ enum axp313a_irqs {
 	AXP313A_IRQ_PEK_RIS_EDGE,
 };
 
+enum axp318_irqs {
+	AXP318_IRQ_DCDC1_V_LOW,
+	AXP318_IRQ_DCDC2_V_LOW,
+	AXP318_IRQ_DCDC3_V_LOW,
+	AXP318_IRQ_DCDC4_V_LOW,
+	AXP318_IRQ_DCDC5_V_LOW,
+	AXP318_IRQ_DCDC6_V_LOW,
+	AXP318_IRQ_DCDC7_V_LOW,
+	AXP318_IRQ_DCDC8_V_LOW,
+	AXP318_IRQ_DCDC9_V_LOW,
+	AXP318_IRQ_DIE_TEMP_HIGH_LV1,
+	AXP318_IRQ_DIE_TEMP_HIGH_LV2,
+	AXP318_IRQ_PEK_SHORT,
+	AXP318_IRQ_PEK_LONG,
+	AXP318_IRQ_PEK_FAL_EDGE,
+	AXP318_IRQ_PEK_RIS_EDGE,
+	AXP318_IRQ_GPIO1_INPUT = 20,
+	AXP318_IRQ_GPIO2_INPUT,
+	AXP318_IRQ_GPIO3_INPUT,
+	AXP318_IRQ_WDOG_EXPIRE = 24,
+};
+
 enum axp717_irqs {
 	AXP717_IRQ_VBUS_FAULT,
 	AXP717_IRQ_VBUS_OVER_V,

-- 
2.47.3

