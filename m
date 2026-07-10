Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6E9368D40
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 16:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700444; cv=none; b=NsNZRPS89VtEqJStXsSjg1eWzemgLUVN+qKtFfwp4UG4ww/bVnIeq4CaAI8FWTpxyDL8DaFqilPXAZNPvqt23FouVAvO5NIbj+8QGz4siBqSUmiDVmbGZmQMXzMcTDQvrBW2Eqe1voyh3loctKLFj2viVA6e1kb7yLnoEaPi16Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700444; c=relaxed/simple;
	bh=aKA++7iGj8cfWjYkl+P3XL439pCE0c7aQMINLycDwcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UcFhwn5wdK7d/jZpDXbYtBkRkIw2xZ/IfMkiB5vrR1bejWOPsNRDfIEm8k7wu7MstAULJ9F0qPbOl0/sWUXklEtgjgZ7mq+3IXDhivbJZkFAr0FLEfu9Vu4QM5zWy+wkoxk2YT0n43qQCs7OaZG0HQKKiTayA6u8dYMnwP+xMHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BO7NI91L; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BO7NI91L"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-475881b9a4bso1106176f8f.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783700436; x=1784305236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=liybW/djMi9v7ALLjEXwb2mxGZ6qRKeE4rCm2Wf6aeQ=;
        b=BO7NI91LEkK8MHZJ8/9bw/mGmMD/Tf9nKAa68QhZVq4zBIXoc77kdEqmC2zSetOjdq
         ZI5Fjf41pgE+0u2tKf40YhquEY2GkTLbZQ95oiDvTl7uS/8rQ7Kvj1tTkZ+QAlHCykIO
         oVkHRHR0XtfOLpNIUfXwNj9AMTqLOptbLC/4ObQ5irO5i4IFcR45vfcWwdOfkrfo6MEa
         6aBUq0l0TkfVrxR8wphILA5pzR7UFYvdOuxfCuuM4WBYLJNciWzc/uOr6gKXyl5b/WbR
         tYu4krZ5MAETFbqZbJpE+b+Z7N6YytJGwInOcoaUrxII8Q174KUwBUqGLYGElvTgA4K9
         NoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783700436; x=1784305236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=liybW/djMi9v7ALLjEXwb2mxGZ6qRKeE4rCm2Wf6aeQ=;
        b=FEbBSwE7OVAAoJuuACYLc4s2puIEFi6nw6lzFo79+5ZZpHMBhfSeh2ygMeqQTBuW7q
         y8ncLzRmKra9rTzzkFqF9BqSNrCS16DlfGV+t9R4xwMWH4S5LSdmlWV0ghqv1zZdscWU
         fqkc+0BCdEf6a82T40RUxi3unaWHGuZguMlVknA8jmerbokYMi0IJZHriEL4L5UJYyKK
         rZdTO1xGMJmJRTUm931HNzRODQvtZOaN7x2dyiUUCv2s2xogojZbszIt7sri5TACUNBh
         MtHVwTzSfltot2SnmqJ/jIH62O2Zf7ocykArGjYo25Fufiz+wPtNlgdz6dXEM4taCApY
         aHoA==
X-Gm-Message-State: AOJu0YxNd4IsGFNSXjf6i/kt5maltRcgp6ghH24rs7JZ+1lQSsp1k80+
	mzFRCb1MdY/uDi0039Sg7ry1B1i4g6tMVTgVJLgisv+tLfWmn4pfykZvo1IjQbodeCQ=
X-Gm-Gg: AfdE7cnhUSO3prChRUm6iQF06AJeiT7JYWtGOFt3rfsqf2qJpfzgPeIAuYNPGTm6OoI
	bgpk1jKG5pZ5ne8JK51yekfgGCCcGthA/44+O8LobOgMPyZjYlCYOtAKZXJ3vjvFHIkf8kLMh8R
	yQhQA3RDr9ujE8yMp8xwFGIzn2JyDgzcs1YJh6B6SWzYEqYFoV7TP+bwWDlIv9971xO8VpCp2Uu
	FB3joKWkhsMRrgOSiQ5WFS5TrR2BZWT/sgOXH3YElCfZrPSWOgX8Waw8AkoWqxmVVrVoRy5Faay
	6HI8x/Cvu7Kf3efAuU0EFuS5cheRBVCIe8wkfq3uZJW+WFrWLuouIm/9GeL+N0ah07DXpzKnPM+
	nYDRuu3ix+s+h/qlvTOaM1lB4aC6zjBnPX550zqaq0M+L4VJ+upZxzxSLmB/pP5nMfGGo7d4NKw
	u2TlqrGZrt5Xgef4aNQeNJaw==
X-Received: by 2002:a05:6000:3c6:b0:476:7036:f854 with SMTP id ffacd0b85a97d-47df072bac3mr13807717f8f.21.1783700435929;
        Fri, 10 Jul 2026 09:20:35 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5e43:31e8:5645:d4e0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9e4d83bdsm61083925f8f.13.2026.07.10.09.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:20:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 10 Jul 2026 18:19:27 +0200
Subject: [PATCH v2 3/3] regulator: axp20x: add support for the AXP318W
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-axp318-regulator-v2-3-ee5f1c56b49f@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19552; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=MCtvUOesjSEVTEOzPEYLha8oA+CrAEAJfuoPPVPW43s=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqURvEhe2b+luK34pzy6QXoMSoX9JXdZ2/sNZlN
 l4zX3dkuvaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCalEbxAAKCRDm/A8cN/La
 hQ4wEACFX5b6sza1FEdImKvy8yGl8+OWZ+dW7R1lfzAaZG3LRaK4jl5F9WRLYNAI7lnUD8cjWa+
 Cpm/sg39YoAYBRqxmgUolcz+VIg7mXysgziSZNhPne025HAj/SL1Md1JRvr5JRqtpa79S0k24Ti
 +4amD/BDeCNjsrWuFxLdjsTrBdVBOXu/C7NbuMool1I8YW5deYmACHFCpkDGCR5/OMdsQwrVJzJ
 d+FCVyxCVaqilH7OalZLrRZGn63Cih7T6nHSv5ZXn8bWq54KADtkxXnGXg4KH7BSVo8fy8xFuBS
 WOfzUw7BuL/gDnwVEvwkRrw9nn126jcEh0NsdpZ4KB0n0n1nnCrWKEu7sSyDNd233s0mD52s9Mb
 YI30qnEj9dtjS/N/4FfS9zo+i/i0S01XJWY1mvl63+r9b22ulf3pWdVtjjurMG5epDGaqqPKCeT
 T9jsvlAAAcqC8MowlsIOdE0fp067OcVMk0ccsdhhsp7EfLLorKS4hoyYcmAbmfUjuAdmUvaATXI
 SgEbFXtWTRU1cMDBaOB8ZYmnfgD0IiPGP436qIV72ihRuNwWfQ9GMfp92H0NkCcs8y+qFBTlJcC
 quYszIfUCaNa3j4GdJ+3mD+u+FOg5zQUluBsIhRqdh4Ag0djACy6I958QX44G0rn1tu3GlIxOwH
 9twr7+rxkrgwzUQ==
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
 drivers/regulator/axp20x-regulator.c | 298 ++++++++++++++++++++++++++++++++++-
 include/linux/mfd/axp20x.h           |  43 +++++
 2 files changed, 333 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index da891415efc0..bc8d3aa2bd67 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -138,6 +138,31 @@
 #define AXP313A_DCDC_V_OUT_MASK		GENMASK(6, 0)
 #define AXP313A_LDO_V_OUT_MASK		GENMASK(4, 0)
 
+#define AXP318_DCDC1_V_OUT_MASK		GENMASK(4, 0)
+#define AXP318_DCDC2_V_OUT_MASK		GENMASK(6, 0)
+#define AXP318_LDO_V_OUT_MASK		GENMASK(4, 0)
+#define AXP318_ELDO_V_OUT_MASK		GENMASK(5, 0)
+#define AXP318_DCDC2_NUM_VOLTAGES	88
+#define AXP318_DCDC6_NUM_VOLTAGES	128
+#define AXP318_DCDC7_NUM_VOLTAGES	103
+#define AXP318_DCDC8_NUM_VOLTAGES	119
+#define AXP318_THRESHOLD_VOLTAGE	1540000
+/*
+ * FIXME:
+ * Some LDOs of the AXP318 may be fed by different supplies and
+ * the documentation repeatidly warns that output voltage must
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
+
 #define AXP717_DCDC1_NUM_VOLTAGES	88
 #define AXP717_DCDC2_NUM_VOLTAGES	107
 #define AXP717_DCDC3_NUM_VOLTAGES	103
@@ -371,8 +396,8 @@
 		.ops		= &axp20x_ops,					\
 	}
 
-#define AXP_DESC(_family, _id, _match, _supply, _min, _max, _step, _vreg,	\
-		 _vmask, _ereg, _emask)						\
+#define AXP_DESC_EXT(_family, _id, _match, _supply, _min, _max, _step, _vreg,	\
+		     _vmask, _ereg, _emask, _ops, _bpreg, _bpmask, _dropout)	\
 	[_family##_##_id] = {							\
 		.name		= (_match),					\
 		.supply_name	= (_supply),					\
@@ -384,13 +409,32 @@
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
@@ -419,8 +463,9 @@
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
@@ -436,10 +481,23 @@
 		.enable_mask	= (_emask),					\
 		.linear_ranges	= (_ranges),					\
 		.n_linear_ranges = ARRAY_SIZE(_ranges),				\
-		.ramp_delay = (_ramp_delay),					\
+		.ramp_delay	= (_ramp_delay),				\
 		.ops		= &axp20x_ops_range,				\
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
@@ -567,6 +625,49 @@ static int axp20x_regulator_enable_regmap(struct regulator_dev *rdev)
 	return regulator_enable_regmap(rdev);
 };
 
+static int axp318_threshold_check(struct regulator_dev *rdev,
+				  unsigned int sel)
+{
+	int old_sel, old_uV, new_uV;
+
+	/* Only applicable if the regulator is enabled */
+	if (!rdev->desc->ops->is_enabled(rdev))
+		return 0;
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
+	if ((old_uV <= AXP318_THRESHOLD_VOLTAGE
+	     && new_uV > AXP318_THRESHOLD_VOLTAGE) ||
+	    (new_uV <= AXP318_THRESHOLD_VOLTAGE
+	     && old_uV > AXP318_THRESHOLD_VOLTAGE))
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
@@ -580,6 +681,15 @@ static const struct regulator_ops axp20x_ops_range = {
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
@@ -590,6 +700,19 @@ static const struct regulator_ops axp20x_ops = {
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
+
 static const struct regulator_ops axp20x_ops_sw = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
@@ -765,6 +888,157 @@ static const struct regulator_desc axp313a_regulators[] = {
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
+};
+
 static const struct linear_range axp717_dcdc1_ranges[] = {
 	REGULATOR_LINEAR_RANGE(500000,   0, 70, 10000),
 	REGULATOR_LINEAR_RANGE(1220000, 71, 87, 20000),
@@ -1347,6 +1621,7 @@ static int axp20x_set_dcdc_freq(struct platform_device *pdev, u32 dcdcfreq)
 		step = 150;
 		break;
 	case AXP313A_ID:
+	case AXP318_ID:
 	case AXP323_ID:
 	case AXP717_ID:
 	case AXP15060_ID:
@@ -1585,6 +1860,10 @@ static int axp20x_regulator_probe(struct platform_device *pdev)
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
@@ -1651,7 +1930,9 @@ static int axp20x_regulator_probe(struct platform_device *pdev)
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
@@ -1709,7 +1990,8 @@ static int axp20x_regulator_probe(struct platform_device *pdev)
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
index c1f9dc06387a..406075db233c 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -562,6 +562,49 @@ enum {
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
+	AXP318_REG_ID_MAX,
+};
+
 enum {
 	AXP717_DCDC1 = 0,
 	AXP717_DCDC2,

-- 
2.47.3

