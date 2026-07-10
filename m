Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F63F369965
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 16:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700440; cv=none; b=mVtdC19k6ITYrZpJ/OPaVR3TNA1lOAPLxRQ9iVVJRxiwax2K0SFuxLgG03X9p+upG7U/HjzdAMRMww4zGs9AF8e6tpY3xgClO9dZRNbHxAunXOHckcyX2k+u0rslV+0dYSnxkC85jWh0cr2wt8NpaNJPAcZJJQZLakV58e+fi7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700440; c=relaxed/simple;
	bh=9zxoqymZ80r71tWMDE2WH7fGW56fyniJA6VTTeyaRs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mA9zb7syF8Nqx20Hmvq0NQo2lFDmfjjIPyAMODjSWnUTkbiFfvmLK/nkXoaJYIqq98FUaGmzECnLImEoSP7fxiGDasCwLhOrv97vn6hWQNVV69HKKTjSGVGqM+aGNqoYMymJaA0IOlAMPgnZWx6H5nB2fAQf4Dis9t+gWHQM5Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QcAEbMB4; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QcAEbMB4"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47defd0c1c5so795153f8f.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783700433; x=1784305233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SiAI33cKfdy7BdW4tm3zWvGEdwTKPISlOxtZgHMWE6w=;
        b=QcAEbMB4jAPdDICOnBN6ZpCmZOAuTGLB8GsThF35goVBN+1RKiQwrrqwLwTa9xR4iD
         xwirMDx3r5+EUePniI0ZUvEBM0gthQhgDcZgEYtXPg7eSpE7E+qrAl2HP6Rwqk2Hy8FL
         z1CID+3mdrSIMmyAvlhQer9ELYXjFKno/3gPCKFBghOONovZnLll/1In5WKBfISgdkyg
         dbOvTwwM4skQFTlaO0kVRLtfkvGwBrhS6DkzqF2poq86Fmfj5uqncSvcg7MxpkDYTPLD
         7xMZF7yCThfBRI5eeFBZac7zD8A7glIFs0qltYPtzreV5pCW8kEX58PgiX8QVoUo37vO
         uydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783700433; x=1784305233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SiAI33cKfdy7BdW4tm3zWvGEdwTKPISlOxtZgHMWE6w=;
        b=MLaADLFgLbJuwxOmaFKLWtf6jwsmzvPwIbSgTqeznapPCYqw/lcw0oxD+xReOMieqt
         +5LHwfFbWJ+K1NMQh48K4UXRs69L2K6JsBxHOAAdh35WvFRPhzjh8rf21OGl33Uwnyet
         Typb2J4EQF0US2kGRokndQoV/cGwKuED+/28bZ1afe1t7wk9uLp4IrKV37lsEXHsuNXA
         dfcISw7MdXFOkoqwEZBzEBSNMkcQ6EHnWcJXMmk6FBUAXnIDfq+xXFGI6A9djKgmuoIi
         9q6xcpWjgvUvT6C23+VmWXG6lPX4rO0ZejyNtDo7A7seiQEM9oYbZuyaCNORXpJ86mTq
         08jA==
X-Gm-Message-State: AOJu0YyZwLhqUMTWGFGrIEe1zoRW2SP3PyFbCB+BmmTITIwi+ja2+Nhl
	nETOTz6GoDc1Tay9JyfazyfyyaFYiqZ3PfbigHwNdaWsSUZGOkCsIGmtzMmdkkV2RBY=
X-Gm-Gg: AfdE7cl8qXCbgPu9jxtNvMnmtBxzgRtMCriCVVqIW8MW6rYmeaBfRCDDq413OF+0JPc
	OyMeCDTgXtbwm1X/Ts+Z09tD2pSYuOf+5FoOahtYB1PjrE76/MmZmZVkQdiZTVBDlNOKp+p+tyy
	4x8HMwf+bBibgIEuDJPSZWXsi2rzzvqNFV6ItQAi2wyD8CXBIn8AW85bl+Cx43XgCLPp2+b/Lt+
	iRTQUDSlfrKk3TO+ZGkp0tQXNj3TOKP9fBTg60zn5Y3p/m4CEaHVLXiMUSqIgymSRHJhZ86wE9i
	Xx6bTPBXGGj/iK8nHjwhva1ktJcFUKFjHLYKIYmQhD40Ph2VAqYWtLdzdzjXVjgopxG9RWseYli
	ID/fJY6KHt2EnURwu1uguuhCsvAYhGXG1ksyssUSkcsj+sTL9F9/wrT9oc9MPHrSZ/ErY5GM+yO
	DyD/R6t3G/4HA=
X-Received: by 2002:a05:6000:186e:b0:45e:73eb:5119 with SMTP id ffacd0b85a97d-47df07baab4mr13245526f8f.22.1783700433570;
        Fri, 10 Jul 2026 09:20:33 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5e43:31e8:5645:d4e0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039bcdasm63802681f8f.21.2026.07.10.09.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:20:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 10 Jul 2026 18:19:26 +0200
Subject: [PATCH v2 2/3] mfd: axp20x: Add support for AXP318W PMIC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-axp318-regulator-v2-2-ee5f1c56b49f@baylibre.com>
References: <20260710-axp318-regulator-v2-0-ee5f1c56b49f@baylibre.com>
In-Reply-To: <20260710-axp318-regulator-v2-0-ee5f1c56b49f@baylibre.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11095; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=NcHOfKeewmUBgKytsKZ9ahmJ407l5OMS40t153fNi4s=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqURvDavfVKfO2ymDp1cTFrEiB52Kn03sYPWcuR
 66/LyqR+kmJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCalEbwwAKCRDm/A8cN/La
 hT08D/9QA1r3RJfNMPtZ/dtyIB7A27ps9wAxjUj9XLElfaIa2LlsrxGUOwe/QStzfgCssYTZJra
 JaMa3XBOhh3vlLrIZF1VTgrwadyPtF1DU87bDsWkfKWdq6369YE8JGi3MZ0mIv7ziY7LDrOaNnR
 u0ONUlXAcIgVuTPWpn2fvQjfuBusmG4iikU50NnggeX+DQMxB7cHe3EaQAm13Yt9MN+eO0/I94s
 AvttJxKfIxN37Yp2vmynri+kehO/nUvCNtNu+9uAdMS90U76VqGuQ+jX6eU4p9BHn7cNWf0EseT
 8TAFZSByhcpJpvCLC6BLC/OcT7f1hS58qZI2YWixwIbHf41IPsGARB6jQI1p5TMYkxzNehp/53e
 R5xKZsJ3dtAYsB5aFdmyfrX301kMxhp/0TEN4PtxCVduLFJO0Zncfq9CU/niapb1SS+gGFJRb5b
 l9T2+WcKhBgsf2NfcYjWW2E408Rh4wucybQ/19MdnOPfIeaESV1Qh0fqckCdfrxvwetz5ZqrARd
 x8V1d+RhsndV3jPX6biKrcsjmRZIPEOC37IMCfkIboFtz7iKOvDtPyYgt7kiJmNC1D+Lj+h+2DR
 4Iob/la9J1Pdw5WbDsuvGTFp5NYIctUiL/vmoSIPlPwY7Udc7EQHxCExJ6ooh95137Zc6czUbWx
 xi90uH9E8FrggaQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

From: Andre Przywara <andre.przywara@arm.com>

The AXP318W is a PMIC chip produced by X-Powers, it can be connected to
an I2C bus.

It has a large number of regulators: 9(!) DCDC buck converters, and 28
LDOs, also some ADCs, interrupts, and a power key.

Describe the regmap and the MFD bits, along with the registers exposed
via I2C only. This covers the regulator, interrupts and power key
devices for now.
Advertise the device using the new compatible string.

We use just "318" for the internal identifiers, for easier typing and
less churn, but use "318W" for anything externally visible. If something
else other than the "AXP318W" shows up, that's an easy change then.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x-i2c.c   |  2 ++
 drivers/mfd/axp20x.c       | 84 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/axp20x.h | 86 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 172 insertions(+)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index 5c93136f977e..4e4ebfc78525 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -65,6 +65,7 @@ static const struct of_device_id axp20x_i2c_of_match[] = {
 	{ .compatible = "x-powers,axp221", .data = (void *)AXP221_ID },
 	{ .compatible = "x-powers,axp223", .data = (void *)AXP223_ID },
 	{ .compatible = "x-powers,axp313a", .data = (void *)AXP313A_ID },
+	{ .compatible = "x-powers,axp318w", .data = (void *)AXP318_ID },
 	{ .compatible = "x-powers,axp323", .data = (void *)AXP323_ID },
 	{ .compatible = "x-powers,axp717", .data = (void *)AXP717_ID },
 	{ .compatible = "x-powers,axp803", .data = (void *)AXP803_ID },
@@ -83,6 +84,7 @@ static const struct i2c_device_id axp20x_i2c_id[] = {
 	{ "axp221" },
 	{ "axp223" },
 	{ "axp313a" },
+	{ "axp318w" },
 	{ "axp717" },
 	{ "axp803" },
 	{ "axp806" },
diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 679364189ea5..956a0370e6a5 100644
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
+	regmap_reg_range(AXP318_SHUTDOWN_CTRL, AXP318_TEMP_ADC_H_EN),
+	regmap_reg_range(AXP318_DIE_TEMP_ADC_H_EN, AXP318_DIE_TEMP_ADC_H_EN),
+	regmap_reg_range(AXP318_GPADC_H_EN, AXP318_GPADC_H_EN),
+	regmap_reg_range(AXP318_GPIO_CTRL, AXP318_WDOG_CTRL),
+};
+
+static const struct regmap_range axp318_volatile_ranges[] = {
+	regmap_reg_range(AXP318_IRQ_EN1, AXP318_IRQ_STATE4),
+	regmap_reg_range(AXP318_POWER_REASON, AXP318_SHUTDOWN_REASON),
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
@@ -368,6 +394,11 @@ static const struct resource axp313a_pek_resources[] = {
 	DEFINE_RES_IRQ_NAMED(AXP313A_IRQ_PEK_FAL_EDGE, "PEK_DBF"),
 };
 
+static const struct resource axp318_pek_resources[] = {
+	DEFINE_RES_IRQ_NAMED(AXP318_IRQ_PEK_RIS_EDGE, "PEK_DBR"),
+	DEFINE_RES_IRQ_NAMED(AXP318_IRQ_PEK_FAL_EDGE, "PEK_DBF"),
+};
+
 static const struct resource axp717_pek_resources[] = {
 	DEFINE_RES_IRQ_NAMED(AXP717_IRQ_PEK_RIS_EDGE, "PEK_DBR"),
 	DEFINE_RES_IRQ_NAMED(AXP717_IRQ_PEK_FAL_EDGE, "PEK_DBF"),
@@ -447,6 +478,15 @@ static const struct regmap_config axp313a_regmap_config = {
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
@@ -663,6 +703,28 @@ static const struct regmap_irq axp313a_regmap_irqs[] = {
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
@@ -884,6 +946,17 @@ static const struct regmap_irq_chip axp313a_regmap_irq_chip = {
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
@@ -1061,6 +1134,11 @@ static struct mfd_cell axp313a_cells[] = {
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
 };
 
+static struct mfd_cell axp318_cells[] = {
+	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
+	MFD_CELL_RES("axp318w-pek", axp318_pek_resources),
+};
+
 static struct mfd_cell axp717_cells[] = {
 	MFD_CELL_NAME("axp20x-regulator"),
 	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
@@ -1313,6 +1391,12 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
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
index b352661d99a1..c1f9dc06387a 100644
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
@@ -116,6 +117,69 @@ enum axp20x_variants {
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
+#define AXP318_SHUTDOWN_REASON		0x51
+#define AXP318_SHUTDOWN_CTRL		0x52
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
@@ -819,6 +883,28 @@ enum axp313a_irqs {
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

