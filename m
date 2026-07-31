Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAEB43849F
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509035; cv=none; b=Pf1iUqhjdV1FnQ+h/sa9zdJ5+vZ2qC0QrlgfuVkq7Tko3lW1BBHCKFEjX8BdUqVrqdos2j9DsqS9WjuOu8iTto3gBBxom6oc3GTc3QEEdrTyEsTXyYVHekrp6r4kbyGGJZBwPf0eAOoqB8A69D7hH4YWbwlE2VbsJ33iiBBICts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509035; c=relaxed/simple;
	bh=cPlCNpAmkXW66Y4FH05sass5lvTqJtGFtyB1OWNY78w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ijurz+Nsd/FVxMz1axUbXbJaIiVQR9by1rkvikhTRyTBsVkrFgSOK+PQB0CM8nj7RYV55KoJtbTmlJeWhMnHnhoJVqNTSGcvIQ6Z5xXcwyU8p0tietEuSeLCFfqy0wQ0d+uJFWadSx2s8hgj3qfSsxNUUz78dz9oniA0CnhcdVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=U2pDU8ZC; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="U2pDU8ZC"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fd66a094eso74353f8f.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785509031; x=1786113831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8QdM7aDJ6BUm8/+T7aYi5rYCae/1VGfhBTecUKPKjBE=;
        b=U2pDU8ZCwkymsPbMlKuh8MTBEydm1NfdfeghA0f6kUuhkwF+c7uvxx08OJamVzb9q2
         +wFgUWeZZ5BwCzUXJYosJboeHfFfgtvkAici2Y0i8XEiVhjjEsKVO4iSN5v/FFn4jAt9
         hVCZ/AKOjf2wEhY0lBKIQYQgUcgEtuMXFIHC6Wn1QKEnxicnLA0p62ym2ZCUgyyFYSWK
         ofpmIS+jN0D0UkYd/mGKgQ2herdZbjWxk1oMi0CtLkztZ50uYcCSR0A2cmZI2k4X+g0q
         zIm6+dJtQD9qGdRw72w6JwKSMSwG/oUm07lg9tHyXihF6MLQzxpqLqwH91HL3Klg4y9H
         t4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785509031; x=1786113831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8QdM7aDJ6BUm8/+T7aYi5rYCae/1VGfhBTecUKPKjBE=;
        b=mr5hsT54Ma9bh6gXBdwACmPGjeK/GcWWGB7tv0I12ySBEbnR9FDfR+bkf3Df/VRsX3
         7fgOb6FTH7v0FJBtJExuCn49P3JE/lnge2CXlgxc3s9rUn/dGipY1teIE2u8YuYEahpU
         kuPWOHQOKqh4x4LoP2UiMio9GxJ8npGaka8y5wEaGbKf1tRU8L0aXdiaGAWCsd+g/yGM
         BYSGYxudtyEprE8Z9ggzg3zCX064o0QTefm8FLLHtYzk7Een5zOpnalWJyBLGmBftwBv
         D9EihoDJAYjvJ24+pPrV/4h46CHBIJmjgzXt+nsgmPYa8qmG37LtTWmjXwB9ddtO/XFv
         4SIg==
X-Gm-Message-State: AOJu0YxL3TJ6Z+eI1arn6m7zERxz/VADDhNP8ZX8CKFQ7vPh+Br7GFBX
	3bACxEIybBh4H7WJkxkBJGCShoXzZb13uwNQzc7IW5cNEbMEilCY/OXtMLp49Usy5ZQ=
X-Gm-Gg: AR+sD12Hc5UKMpMCxdKyoBDOsE70nLs5nRbYToLX9y3GQ1L8Pj6FRry7VXevLftcJ1y
	J9kQAPnAfNjqX3r3W6c0lfy1RskD6ydyYTnz0McntfJkuh4ZEapM14iPK6/NIjIfd+LKF2rZZnP
	vyRiPBsUY8GqwBoFvAsr+elUMPim7AYuUrXZoxya+bh52e1elra8krOb5lrZTxEG5ElDEZallyv
	XEVJm+aQI252y1+V6LlRL8Oo4WhQfm3MNhKvyniASFHkwbfqh9rGi8d3iqBGBDtYE5bzK7o5SRk
	de6jgRl877ugukRSqyZZOUbnjF6ZfKC7cMx8YUMTQfoavFYNZHXK6vsXSQdwn9RwhQ7Nch8i2or
	4F8UtWeZ1aDVHhQIPiYBjxyTpWSJQgrLDZEfqKHel8Db2Ni0a7boO7jKNnVdYcnvEay4+MGB3az
	EodAoLpLdlzC9D0LIn8790yNK1ykdqX9e/sVtzTf2/igGknJm4lWx2mtaTFA==
X-Received: by 2002:a05:6000:240a:b0:47f:9447:62bf with SMTP id ffacd0b85a97d-47fd2ab7af3mr5342805f8f.2.1785509030936;
        Fri, 31 Jul 2026 07:43:50 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd41d1756sm5428824f8f.4.2026.07.31.07.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:43:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 31 Jul 2026 16:43:30 +0200
Subject: [PATCH v6 5/5] regulator: axp20x: add support for the AXP318W
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-axp318-regulator-v6-5-b4e745552a35@baylibre.com>
References: <20260731-axp318-regulator-v6-0-b4e745552a35@baylibre.com>
In-Reply-To: <20260731-axp318-regulator-v6-0-b4e745552a35@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=21087; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=4RVYcCbWmpUy7Aem4G3dzn5By1vjwTdoe6KYKqM0p+M=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqbLSY6jluuzGopfUEsojtzhTVTzsaLFxleKCFq
 oSPP8JOaoWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamy0mAAKCRDm/A8cN/La
 hePCD/9iWlAMGfNEjvc6+UxZCjmeS/Um4lR6iI/xcg1UL42/dZtCdwkVF6vcoYuBlC3B+Ludd+3
 IA1D51Rx+N+X+6KFWyGPfDHJKKBiRHCtRHy4kjBWmVNIoLSgIeyDAaM7wX5t8bJnCQwgRJR5PCU
 bDqg0+8TALp+YS3HDd1eDRCp9yvyE38q63GknhQwVuzO/c43io4HpI3EQuDXb2tP95CgiQCwha/
 uGFbuwDleAEKhxunn1waUJyj5p2RxOLsUIFHn1sdwVYRYozeAOxktzWFjlOYaMPajB/BMqcvhPa
 FZkQroCfxiwdYuE4vgCuNmUWWgbv0es1s2J4q+ubU2XMqFxHKwh0mqYmBIP4hxWXvPaCDO1IWdu
 rluBGsY0AvGQUANgo+H3z6NQwaH3hATKeOTT2R1oUch9PAWMQvJNdCsmSZVfVW4m+aa01ey6sQz
 mPRCQF385+BM2bK/n2/cIBvBc2WMc2LVCAer8CcXIkQi5epB5bO/A99OPB2u9MMabUGYGwcxCyE
 DktjrJvR9Klvmj9HM4Y3BZl+fCCla1IXsmhTpFcoG2wcFpWj2PXdebgOuH3r0PWVXdHNfezwO2X
 jF62tFUwDNIjB8O7JNlHrYKdhAd59dctqJWvUdYjExM5mERTDcR5ko7SU9p6bVRIbIgQ0Jy+v9U
 FiutM3pNHle8hmg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

From: Andre Przywara <andre.przywara@arm.com>

The X-Powers AXP318W is a typical PMIC from X-Powers, featuring nine
DC/DC converters and 28 LDOs, on the regulator side.

Describe the chip's voltage settings and switch registers, how the
voltages are encoded, and connect this to the MFD device via its
regulator ID.
We use just "318" for the internal identifiers, for easier typing and
less churn. If something else other than the "AXP318W" shows up, that's
an easy change, externally visible strings carry the additional letter
already.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Co-developed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/regulator/axp20x-regulator.c | 324 ++++++++++++++++++++++++++++++++++-
 include/linux/mfd/axp20x.h           |  45 +++++
 2 files changed, 360 insertions(+), 9 deletions(-)

diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index da891415efc0..9e81e2cb7542 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -138,6 +138,29 @@
 #define AXP313A_DCDC_V_OUT_MASK		GENMASK(6, 0)
 #define AXP313A_LDO_V_OUT_MASK		GENMASK(4, 0)
 
+#define AXP318_DCDC1_PFM_PWM_CTRL	BIT(7)
+#define AXP318_DCDC23_POLYPHASE_CTRL	BIT(6)
+#define AXP318_DCDC45_POLYPHASE_CTRL	BIT(7)
+#define AXP318_DCDC1_V_OUT_MASK		GENMASK(4, 0)
+#define AXP318_DCDC2_V_OUT_MASK		GENMASK(6, 0)
+#define AXP318_LDO_V_OUT_MASK		GENMASK(4, 0)
+#define AXP318_ELDO_V_OUT_MASK		GENMASK(5, 0)
+#define AXP318_THRESHOLD_VOLTAGE	1540000
+/*
+ * FIXME:
+ * Some LDOs of the AXP318 may be fed by different supplies and
+ * the documentation repeatedly warns that output voltage must
+ * be less than the supply, which is the case for any LDO really.
+ *
+ * The best way to let the framework handle this is to set the
+ * min_dropout_uV field. However the AXP318 documentation
+ * does not provide any information about this.
+ *
+ * Realistically, it can't be less than 1uV so use this
+ * for all LDOs until we know more.
+ */
+#define AXP318_LDO_MIN_DROPOUT		1 /* uV */
+
 #define AXP717_DCDC1_NUM_VOLTAGES	88
 #define AXP717_DCDC2_NUM_VOLTAGES	107
 #define AXP717_DCDC3_NUM_VOLTAGES	103
@@ -371,8 +394,8 @@
 		.ops		= &axp20x_ops,					\
 	}
 
-#define AXP_DESC(_family, _id, _match, _supply, _min, _max, _step, _vreg,	\
-		 _vmask, _ereg, _emask)						\
+#define AXP_DESC_EXT(_family, _id, _match, _supply, _min, _max, _step, _vreg,	\
+		     _vmask, _ereg, _emask, _ops, _bpreg, _bpmask, _dropout)	\
 	[_family##_##_id] = {							\
 		.name		= (_match),					\
 		.supply_name	= (_supply),					\
@@ -384,13 +407,32 @@
 		.owner		= THIS_MODULE,					\
 		.min_uV		= (_min) * 1000,				\
 		.uV_step	= (_step) * 1000,				\
+		.min_dropout_uV = (_dropout),					\
 		.vsel_reg	= (_vreg),					\
 		.vsel_mask	= (_vmask),					\
 		.enable_reg	= (_ereg),					\
 		.enable_mask	= (_emask),					\
-		.ops		= &axp20x_ops,					\
+		.bypass_reg	= (_bpreg),					\
+		.bypass_mask	= (_bpmask),					\
+		.ops		= (_ops),					\
 	}
 
+#define AXP_DESC(_family, _id, _match, _supply, _min, _max, _step, _vreg,	\
+		 _vmask, _ereg, _emask)						\
+	AXP_DESC_EXT(_family, _id, _match, _supply, _min, _max, _step, _vreg,	\
+		     _vmask, _ereg, _emask, &axp20x_ops, 0, 0, 0)
+
+#define AXP_DESC_DO(_family, _id, _match, _supply, _min, _max, _step, _vreg,	\
+		    _vmask, _ereg, _emask, _dropout)				\
+	AXP_DESC_EXT(_family, _id, _match, _supply, _min, _max, _step, _vreg,	\
+		     _vmask, _ereg, _emask, &axp20x_ops, 0, 0, _dropout)
+
+#define AXP_DESC_BYPASS(_family, _id, _match, _supply, _min, _max, _step, _vreg,\
+			_vmask, _ereg, _emask, _bpreg, _bpmask, _dropout)	\
+	AXP_DESC_EXT(_family, _id, _match, _supply, _min, _max, _step, _vreg,	\
+		     _vmask, _ereg, _emask, &axp20x_bypass_ops, _bpreg,		\
+		     _bpmask, _dropout)
+
 #define AXP_DESC_SW(_family, _id, _match, _supply, _ereg, _emask)		\
 	[_family##_##_id] = {							\
 		.name		= (_match),					\
@@ -419,8 +461,9 @@
 		.ops		= &axp20x_ops_fixed				\
 	}
 
-#define AXP_DESC_RANGES_DELAY(_family, _id, _match, _supply, _ranges, _n_voltages,	\
-			_vreg, _vmask, _ereg, _emask, _ramp_delay)	\
+#define AXP_DESC_RANGES_DELAY_OPS(_family, _id, _match, _supply, _ranges,	\
+				  _n_voltages, _vreg, _vmask, _ereg, _emask,	\
+				  _ramp_delay, _ops)				\
 	[_family##_##_id] = {							\
 		.name		= (_match),					\
 		.supply_name	= (_supply),					\
@@ -436,10 +479,23 @@
 		.enable_mask	= (_emask),					\
 		.linear_ranges	= (_ranges),					\
 		.n_linear_ranges = ARRAY_SIZE(_ranges),				\
-		.ramp_delay = (_ramp_delay),					\
-		.ops		= &axp20x_ops_range,				\
+		.ramp_delay	= (_ramp_delay),				\
+		.ops		= (_ops),					\
 	}
 
+#define AXP_DESC_RANGES_THRESHOLD(_family, _id, _match, _supply, _ranges,	\
+				  _n_voltages, _vreg, _vmask, _ereg, _emask)	\
+	AXP_DESC_RANGES_DELAY_OPS(_family, _id, _match, _supply, _ranges,	\
+				  _n_voltages, _vreg, _vmask, _ereg, _emask,	\
+				  0, &axp318_threshold_ops_range)
+
+#define AXP_DESC_RANGES_DELAY(_family, _id, _match, _supply, _ranges,		\
+			      _n_voltages, _vreg, _vmask, _ereg, _emask,	\
+			      _ramp_delay)					\
+	AXP_DESC_RANGES_DELAY_OPS(_family, _id, _match, _supply, _ranges,	\
+				  _n_voltages, _vreg, _vmask, _ereg, _emask,	\
+				  _ramp_delay, &axp20x_ops_range)
+
 #define AXP_DESC_RANGES(_family, _id, _match, _supply, _ranges, _n_voltages,	\
 			_vreg, _vmask, _ereg, _emask)				\
 	AXP_DESC_RANGES_DELAY(_family, _id, _match, _supply, _ranges,		\
@@ -567,6 +623,50 @@ static int axp20x_regulator_enable_regmap(struct regulator_dev *rdev)
 	return regulator_enable_regmap(rdev);
 };
 
+static int axp318_threshold_check(struct regulator_dev *rdev,
+				  unsigned int sel)
+{
+	int old_sel, old_uV, new_uV, enabled;
+
+	/* Only applicable if the regulator is enabled */
+	enabled = rdev->desc->ops->is_enabled(rdev);
+	if (enabled <= 0)
+		return enabled;
+
+	old_sel = rdev->desc->ops->get_voltage_sel(rdev);
+	if (old_sel < 0)
+		return old_sel;
+
+	old_uV = rdev->desc->ops->list_voltage(rdev, old_sel);
+	if (old_uV < 0)
+		return old_uV;
+
+	new_uV = rdev->desc->ops->list_voltage(rdev, sel);
+	if (new_uV < 0)
+		return new_uV;
+
+	/* Crossing the threshold ? */
+	if ((old_uV <= AXP318_THRESHOLD_VOLTAGE &&
+	     new_uV > AXP318_THRESHOLD_VOLTAGE) ||
+	    (new_uV <= AXP318_THRESHOLD_VOLTAGE &&
+	     old_uV > AXP318_THRESHOLD_VOLTAGE))
+		return -EBUSY;
+
+	return 0;
+}
+
+static int axp318_threshold_set_voltage_sel(struct regulator_dev *rdev,
+					    unsigned int sel)
+{
+	int ret;
+
+	ret = axp318_threshold_check(rdev, sel);
+	if (ret < 0)
+		return ret;
+
+	return regulator_set_voltage_sel_regmap(rdev, sel);
+}
+
 static const struct regulator_ops axp20x_ops_fixed = {
 	.list_voltage		= regulator_list_voltage_linear,
 };
@@ -580,6 +680,15 @@ static const struct regulator_ops axp20x_ops_range = {
 	.is_enabled		= regulator_is_enabled_regmap,
 };
 
+static const struct regulator_ops axp318_threshold_ops_range = {
+	.set_voltage_sel	= axp318_threshold_set_voltage_sel,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+};
+
 static const struct regulator_ops axp20x_ops = {
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
@@ -590,6 +699,18 @@ static const struct regulator_ops axp20x_ops = {
 	.set_ramp_delay		= axp20x_set_ramp_delay,
 };
 
+static const struct regulator_ops axp20x_bypass_ops = {
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.list_voltage		= regulator_list_voltage_linear,
+	.enable			= axp20x_regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.set_ramp_delay		= axp20x_set_ramp_delay,
+	.get_bypass		= regulator_get_bypass_regmap,
+	.set_bypass		= regulator_set_bypass_regmap,
+};
+
 static const struct regulator_ops axp20x_ops_sw = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
@@ -765,6 +886,158 @@ static const struct regulator_desc axp313a_regulators[] = {
 	AXP_DESC_FIXED(AXP313A, RTC_LDO, "rtc-ldo", "vin1", 1800),
 };
 
+static const struct linear_range axp318_dcdc2_ranges[] = {
+	REGULATOR_LINEAR_RANGE(500000,   0, 70, 10000),
+	REGULATOR_LINEAR_RANGE(1220000, 71, 87, 20000),
+};
+
+static const struct linear_range axp318_dcdc6_ranges[] = {
+	REGULATOR_LINEAR_RANGE(500000,    0,  70,  10000),
+	REGULATOR_LINEAR_RANGE(1220000,  71,  87,  20000),
+	REGULATOR_LINEAR_RANGE(1800000,  88, 118,  20000),
+	REGULATOR_LINEAR_RANGE(2440000, 119, 127,  40000),
+};
+
+static const struct linear_range axp318_dcdc7_ranges[] = {
+	REGULATOR_LINEAR_RANGE(500000,   0,  70, 10000),
+	REGULATOR_LINEAR_RANGE(1220000, 71, 102, 20000),
+};
+
+static const struct linear_range axp318_dcdc8_ranges[] = {
+	REGULATOR_LINEAR_RANGE(500000,    0,  70,  10000),
+	REGULATOR_LINEAR_RANGE(1220000,  71, 102,  20000),
+	REGULATOR_LINEAR_RANGE(1900000, 103, 118, 100000),
+};
+
+static const struct regulator_desc axp318_regulators[] = {
+	AXP_DESC(AXP318, DCDC1, "dcdc1", "vin19", 1000, 3400, 100,
+		 AXP318_DCDC1_CONTROL, AXP318_DCDC1_V_OUT_MASK,
+		 AXP318_DCDC_OUTPUT_CONTROL1, BIT(0)),
+	AXP_DESC_RANGES(AXP318, DCDC2, "dcdc2", "vin23",
+			axp318_dcdc2_ranges, 88,
+			AXP318_DCDC2_CONTROL, AXP318_DCDC2_V_OUT_MASK,
+			AXP318_DCDC_OUTPUT_CONTROL1, BIT(1)),
+	AXP_DESC_RANGES(AXP318, DCDC3, "dcdc3", "vin23",
+			axp318_dcdc2_ranges, 88,
+			AXP318_DCDC3_CONTROL, AXP318_DCDC2_V_OUT_MASK,
+			AXP318_DCDC_OUTPUT_CONTROL1, BIT(2)),
+	AXP_DESC_RANGES(AXP318, DCDC4, "dcdc4", "vin45",
+			axp318_dcdc2_ranges, 88,
+			AXP318_DCDC4_CONTROL, AXP318_DCDC2_V_OUT_MASK,
+			AXP318_DCDC_OUTPUT_CONTROL1, BIT(3)),
+	AXP_DESC_RANGES(AXP318, DCDC5, "dcdc5", "vin45",
+			axp318_dcdc2_ranges, 88,
+			AXP318_DCDC5_CONTROL, AXP318_DCDC2_V_OUT_MASK,
+			AXP318_DCDC_OUTPUT_CONTROL1, BIT(4)),
+	AXP_DESC_RANGES_THRESHOLD(AXP318, DCDC6, "dcdc6", "vin678",
+			axp318_dcdc6_ranges, 128,
+			AXP318_DCDC6_CONTROL, AXP318_DCDC2_V_OUT_MASK,
+			AXP318_DCDC_OUTPUT_CONTROL1, BIT(5)),
+	AXP_DESC_RANGES_THRESHOLD(AXP318, DCDC7, "dcdc7", "vin678",
+			axp318_dcdc7_ranges, 103,
+			AXP318_DCDC7_CONTROL, AXP318_DCDC2_V_OUT_MASK,
+			AXP318_DCDC_OUTPUT_CONTROL1, BIT(6)),
+	AXP_DESC_RANGES_THRESHOLD(AXP318, DCDC8, "dcdc8", "vin678",
+			axp318_dcdc8_ranges, 119,
+			AXP318_DCDC8_CONTROL, AXP318_DCDC2_V_OUT_MASK,
+			AXP318_DCDC_OUTPUT_CONTROL1, BIT(7)),
+	AXP_DESC_RANGES_THRESHOLD(AXP318, DCDC9, "dcdc9", "vin19",
+			axp318_dcdc8_ranges, 119,
+			AXP318_DCDC9_CONTROL, AXP318_DCDC2_V_OUT_MASK,
+			AXP318_DCDC_OUTPUT_CONTROL2, BIT(0)),
+	AXP_DESC_SW(AXP318, SWOUT1, "swout1", NULL,
+		    AXP318_DCDC_OUTPUT_CONTROL2, BIT(3)),
+	AXP_DESC_SW(AXP318, SWOUT2, "swout2", NULL,
+		    AXP318_DCDC_OUTPUT_CONTROL2, BIT(4)),
+	AXP_DESC_DO(AXP318, ALDO1, "aldo1", "aldo156in", 500, 3400, 100,
+		    AXP318_ALDO1_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL1, BIT(0), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, ALDO2, "aldo2", "aldo234in", 500, 3400, 100,
+		    AXP318_ALDO2_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL1, BIT(1), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, ALDO3, "aldo3", "aldo234in", 500, 3400, 100,
+		    AXP318_ALDO3_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL1, BIT(2), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, ALDO4, "aldo4", "aldo234in", 500, 3400, 100,
+		    AXP318_ALDO4_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL1, BIT(3), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, ALDO5, "aldo5", "aldo156in", 500, 3400, 100,
+		    AXP318_ALDO5_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL1, BIT(4), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, ALDO6, "aldo6", "aldo156in", 500, 3400, 100,
+		    AXP318_ALDO6_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL1, BIT(5), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, BLDO1, "bldo1", "bldoin", 500, 3400, 100,
+		    AXP318_BLDO1_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL1, BIT(6), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, BLDO2, "bldo2", "bldoin", 500, 3400, 100,
+		    AXP318_BLDO2_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL1, BIT(7), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, BLDO3, "bldo3", "bldoin", 500, 3400, 100,
+		    AXP318_BLDO3_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL2, BIT(0), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, BLDO4, "bldo4", "bldoin", 500, 3400, 100,
+		    AXP318_BLDO4_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL2, BIT(1), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, BLDO5, "bldo5", "bldoin", 500, 3400, 100,
+		    AXP318_BLDO5_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL2, BIT(2), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, CLDO1, "cldo1", "cldoin", 500, 3400, 100,
+		    AXP318_CLDO1_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL2, BIT(3), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, CLDO2, "cldo2", "cldoin", 500, 3400, 100,
+		    AXP318_CLDO2_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL2, BIT(4), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, CLDO3, "cldo3", "cldoin", 500, 3400, 100,
+		    AXP318_CLDO3_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL2, BIT(5), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, CLDO4, "cldo4", "cldoin", 500, 3400, 100,
+		    AXP318_CLDO4_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL2, BIT(6), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, CLDO5, "cldo5", "cldoin", 500, 3400, 100,
+		    AXP318_CLDO5_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL2, BIT(7), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, DLDO1, "dldo1", "dldoin", 500, 3400, 100,
+		    AXP318_DLDO1_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL3, BIT(0), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, DLDO2, "dldo2", "dldoin", 500, 3400, 100,
+		    AXP318_DLDO2_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL3, BIT(1), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, DLDO3, "dldo3", "dldoin", 500, 3400, 100,
+		    AXP318_DLDO3_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL3, BIT(2), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, DLDO4, "dldo4", "dldoin", 500, 3400, 100,
+		    AXP318_DLDO4_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL3, BIT(3), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, DLDO5, "dldo5", "dldoin", 500, 3400, 100,
+		    AXP318_DLDO5_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL3, BIT(4), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, DLDO6, "dldo6", "dldoin", 500, 3400, 100,
+		    AXP318_DLDO6_CONTROL, AXP318_LDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL3, BIT(5), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, ELDO1, "eldo1", "eldoin", 500, 1500, 25,
+		    AXP318_ELDO1_CONTROL, AXP318_ELDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL3, BIT(6), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, ELDO2, "eldo2", "eldoin", 500, 1500, 25,
+		    AXP318_ELDO2_CONTROL, AXP318_ELDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL3, BIT(7), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, ELDO3, "eldo3", "eldoin", 500, 1500, 25,
+		    AXP318_ELDO3_CONTROL, AXP318_ELDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL4, BIT(0), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_BYPASS(AXP318, ELDO4, "eldo4", "eldoin", 500, 1500, 25,
+			AXP318_ELDO4_CONTROL, AXP318_ELDO_V_OUT_MASK,
+			AXP318_LDO_OUTPUT_CONTROL4, BIT(1),
+			AXP318_ELDO4_CONTROL, BIT(6), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_BYPASS(AXP318, ELDO5, "eldo5", "eldoin", 500, 1500, 25,
+			AXP318_ELDO5_CONTROL, AXP318_ELDO_V_OUT_MASK,
+			AXP318_LDO_OUTPUT_CONTROL4, BIT(2),
+			AXP318_ELDO5_CONTROL, BIT(6), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_DO(AXP318, ELDO6, "eldo6", "eldoin", 500, 1500, 25,
+		    AXP318_ELDO6_CONTROL, AXP318_ELDO_V_OUT_MASK,
+		    AXP318_LDO_OUTPUT_CONTROL4, BIT(3), AXP318_LDO_MIN_DROPOUT),
+	AXP_DESC_FIXED(AXP318, RTC_LDO, "rtc-ldo", "ips", 1800),
+};
+
 static const struct linear_range axp717_dcdc1_ranges[] = {
 	REGULATOR_LINEAR_RANGE(500000,   0, 70, 10000),
 	REGULATOR_LINEAR_RANGE(1220000, 71, 87, 20000),
@@ -1347,6 +1620,7 @@ static int axp20x_set_dcdc_freq(struct platform_device *pdev, u32 dcdcfreq)
 		step = 150;
 		break;
 	case AXP313A_ID:
+	case AXP318_ID:
 	case AXP323_ID:
 	case AXP717_ID:
 	case AXP15060_ID:
@@ -1430,6 +1704,20 @@ static int axp20x_set_dcdc_workmode(struct regulator_dev *rdev, int id, u32 work
 		workmode <<= ffs(mask) - 1;
 		break;
 
+	case AXP318_ID:
+		/*
+		 * Only DCDC1 has PWM control on the AXP318
+		 * The other DCDCs control DVM through bit 7 of the related
+		 * registers. Work mode could possibly extended to deal with
+		 * this but it is not how it is documented at the moment
+		 */
+		if (id != AXP318_DCDC1)
+			return -EINVAL;
+		reg = AXP318_DCDC1_CONTROL;
+		mask = AXP318_DCDC1_PFM_PWM_CTRL;
+		workmode <<= ffs(mask) - 1;
+		break;
+
 	case AXP806_ID:
 		/*
 		 * AXP806 DCDC regulator IDs have the same range as AXP22X.
@@ -1543,6 +1831,17 @@ static bool axp20x_is_polyphase_slave(struct axp20x_dev *axp20x, int id)
 		}
 		break;
 
+	case AXP318_ID:
+		regmap_read(axp20x->regmap, AXP318_DCDC_CONTROL1, &reg);
+
+		switch (id) {
+		case AXP318_DCDC3:
+			return !!(reg & AXP318_DCDC23_POLYPHASE_CTRL);
+		case AXP318_DCDC5:
+			return !!(reg & AXP318_DCDC45_POLYPHASE_CTRL);
+		}
+		break;
+
 	default:
 		return false;
 	}
@@ -1585,6 +1884,10 @@ static int axp20x_regulator_probe(struct platform_device *pdev)
 		regulators = axp313a_regulators;
 		nregulators = AXP313A_REG_ID_MAX;
 		break;
+	case AXP318_ID:
+		regulators = axp318_regulators;
+		nregulators = AXP318_REG_ID_MAX;
+		break;
 	case AXP717_ID:
 		regulators = axp717_regulators;
 		nregulators = AXP717_REG_ID_MAX;
@@ -1651,7 +1954,9 @@ static int axp20x_regulator_probe(struct platform_device *pdev)
 		if ((regulators == axp22x_regulators && i == AXP22X_DC1SW) ||
 		    (regulators == axp803_regulators && i == AXP803_DC1SW) ||
 		    (regulators == axp809_regulators && i == AXP809_DC1SW) ||
-		    (regulators == axp15060_regulators && i == AXP15060_SW)) {
+		    (regulators == axp15060_regulators && i == AXP15060_SW) ||
+		    (regulators == axp318_regulators && i == AXP318_SWOUT1) ||
+		    (regulators == axp318_regulators && i == AXP318_SWOUT2)) {
 			new_desc = devm_kzalloc(&pdev->dev, sizeof(*desc),
 						GFP_KERNEL);
 			if (!new_desc)
@@ -1709,7 +2014,8 @@ static int axp20x_regulator_probe(struct platform_device *pdev)
 		 */
 		if ((regulators == axp22x_regulators && i == AXP22X_DCDC1) ||
 		    (regulators == axp809_regulators && i == AXP809_DCDC1) ||
-		    (regulators == axp15060_regulators && i == AXP15060_DCDC1))
+		    (regulators == axp15060_regulators && i == AXP15060_DCDC1) ||
+		    (regulators == axp318_regulators && i == AXP318_DCDC1))
 			of_property_read_string(rdev->dev.of_node,
 						"regulator-name",
 						&dcdc1_name);
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index 0191467de4ec..251f057ea76d 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -128,6 +128,7 @@ enum axp20x_variants {
 #define AXP318_DCDC7_CONTROL		0x18
 #define AXP318_DCDC8_CONTROL		0x19
 #define AXP318_DCDC9_CONTROL		0x1a
+#define AXP318_DCDC_CONTROL1		0x1b
 #define AXP318_LDO_OUTPUT_CONTROL1	0x20
 #define AXP318_LDO_OUTPUT_CONTROL2	0x21
 #define AXP318_LDO_OUTPUT_CONTROL3	0x22
@@ -564,6 +565,50 @@ enum {
 	AXP313A_REG_ID_MAX,
 };
 
+enum {
+	AXP318_DCDC1 = 0,
+	AXP318_DCDC2,
+	AXP318_DCDC3,
+	AXP318_DCDC4,
+	AXP318_DCDC5,
+	AXP318_DCDC6,
+	AXP318_DCDC7,
+	AXP318_DCDC8,
+	AXP318_DCDC9,
+	AXP318_ALDO1,
+	AXP318_ALDO2,
+	AXP318_ALDO3,
+	AXP318_ALDO4,
+	AXP318_ALDO5,
+	AXP318_ALDO6,
+	AXP318_BLDO1,
+	AXP318_BLDO2,
+	AXP318_BLDO3,
+	AXP318_BLDO4,
+	AXP318_BLDO5,
+	AXP318_CLDO1,
+	AXP318_CLDO2,
+	AXP318_CLDO3,
+	AXP318_CLDO4,
+	AXP318_CLDO5,
+	AXP318_DLDO1,
+	AXP318_DLDO2,
+	AXP318_DLDO3,
+	AXP318_DLDO4,
+	AXP318_DLDO5,
+	AXP318_DLDO6,
+	AXP318_ELDO1,
+	AXP318_ELDO2,
+	AXP318_ELDO3,
+	AXP318_ELDO4,
+	AXP318_ELDO5,
+	AXP318_ELDO6,
+	AXP318_SWOUT1,
+	AXP318_SWOUT2,
+	AXP318_RTC_LDO,
+	AXP318_REG_ID_MAX,
+};
+
 enum {
 	AXP717_DCDC1 = 0,
 	AXP717_DCDC2,

-- 
2.47.3

