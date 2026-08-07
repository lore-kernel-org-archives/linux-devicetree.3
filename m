Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1355377EAC
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786110756; cv=none; b=tXcDM0MO3Px90UVf4yrS1zlC+aptbIIrasCqriFknjR7cIBlwIBtVvTHhY5U6XEiVFIJB+MG2oBIircAAl/fO7OLNDHXBqUQYGtvzsDZPO517fZCcsxDWI/JegXCVt07CS+4mTpvIg32cuLGOipOFgj221dRhtchohnghDnDBoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786110756; c=relaxed/simple;
	bh=PJZhZEi1W4+Y2hMFwYNULOMEipGiY6VSurAAtC+vpWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G0aJ2/w+Dd8v0arkG3Owp8gsRESwKtz4nT9Pq/PuUryaB5rIxJiZ46PHUDQ+Ts7H6gqqSMC4TCSQmTexfN9PepFoPz8wgkkkhAztPE0ypGrW/sAJgkW+3u+u3ldoeZ+nB/e/8W6ziE6nIRVBWNjuMcid4RHgE7ObeWeK6x7JnFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHCAmfRL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHCAmfRL"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954df200ddso24027715e9.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 06:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786110740; x=1786715540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1iIB52Ggh7rCKXZKgQhlKYuhVA2prPvS2jFcH92T3A=;
        b=QHCAmfRL/zQx+4OJdCPa08gKR3lCa8RPV2DthMyeW2IugK9qVCcDE9Mjn3pCYDMaIG
         GU0tXlhkTuQ56SVivPvrZi0gdr+9mP+vG90Jucyc1L+urzMYxM1XB3OGSxduOYSuLCGo
         ckiSzBlx/W1K99u4oEtgO+JtM1kKNk45iokF/vWv3ehEVbujELgNR6O+VeKb2cQuHO+z
         1vEGH7gZUGsN1RBF3BgXC1X/JfEQFik+g9KdvA37dMOlBaXQ+C9c5MXyIoDrDIDh+Gqg
         R3feZ5yTcURD8bNDcE4idAfN/V/uqi1qRnK4xByEEv6cvLQ9SBxi3+UN0JaMGLkRAV+G
         axOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786110740; x=1786715540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1iIB52Ggh7rCKXZKgQhlKYuhVA2prPvS2jFcH92T3A=;
        b=oBKFv6oqygWa/Nla+eIwVL2S492CzUzateTi3sOPp2+CQUGvqEqEKPqhDSbaVTI77M
         qx4xsLMHNLT7V5BHl9l9Vk4EHIapyza5pQNEARQQ0RJD7NeXYbTjiClI2k3qkQs2SPte
         m/U4oz0/HN8O7X2SorFEMoxDbFYF31RQXnEQfK0qGDtqjOhjOBTWXTRm69kQVUMFyLd4
         ejyODc5mc9jmI8XHkMDRKbfw9ean1mHKelh33o4XMireJmB3yeIhleJa3z+CD+SV9FYt
         12MXLlvvOaU4/KiwbSLeKABXAu6vOraXWyeJQO/AKIHqz5tvFVL+TEt/gUoQ3sw5AZxY
         vD8w==
X-Forwarded-Encrypted: i=1; AHgh+RoOilXyIc6eS/VfRh3SJxMU3rVLOptheQp3i/MBbNIG6kYGL4RWBYHd5H/uZLJU1x0+G8dnEQ2ysj1B@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj20dSJLvpzU5tF8hjQxSb5UJx1QMJwVMYIzmlSAGAtWH3fF+l
	i4jV8qtXdsg4+WVQqRytQQeMMSfIRQY9tBf82TujT7pNSbsKRtk0qnQJ5J2j6w==
X-Gm-Gg: AR+sD11yW+DScECN+3k5EHAxQVCdbw4NZRQQoLiu8iHNqJtYevbWd78s8B9uLzdiqjP
	pnBb4lzM38L8Oi22me5JUb8086GqkZ0JtpNqBALn5ETuCY/1TK3joVEROmPUujZQTCQs/8PGLPy
	O6Z9BvP+92XUmBufyz/zc5M7wyEzMW792kKMG+vyVlsZWJ06Uh+3XMtFX3ovVKlffQHGO6YzYqv
	sjXw0yzmftTsbWrgzGxWMyWnUshAOTynSdsAp/AcKIgsaGjWELomn7X5CCIl57/wdYPsbwN5tQK
	9iSr2mNuW4O86xVkWlIhejSdkb4sr9skNXnUR1mgrlzZFV1x/n75atdhxoh+A59CT0jHkF96zcj
	HwDwD8cjj33R14fH5ER6adACeDZi/JOWz2UgDmQc8lXTX4s4AiJQ88aRpNX9lFk7gXH7g942crz
	kwVfZuLIHR8VyY2dlvl8XZm1I0tYTpJJ+uDtRdQEh7SFBP7aJYYOtpjaFCqRCranEt9DhKz2wX6
	fr3QQ==
X-Received: by 2002:a05:600c:190d:b0:499:5a5e:f2f3 with SMTP id 5b1f17b1804b1-4995a5ef379mr102575185e9.5.1786110740178;
        Fri, 07 Aug 2026 06:52:20 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:13c:7c2e:7f0a:5759:2e0d:bf8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8b09sm6581333f8f.23.2026.08.07.06.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:52:19 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 07 Aug 2026 15:51:55 +0200
Subject: [PATCH v5 4/4] iio: light: veml6031x00: add support for events and
 trigger
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-veml6031x00-v5-4-e60876fb3640@gmail.com>
References: <20260807-veml6031x00-v5-0-e60876fb3640@gmail.com>
In-Reply-To: <20260807-veml6031x00-v5-0-e60876fb3640@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786110728; l=22756;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=PJZhZEi1W4+Y2hMFwYNULOMEipGiY6VSurAAtC+vpWg=;
 b=nzIsl0qFy94d9yZG637ukhQkvARdfx9+Pcsmfj8fj0sKWUAZITmw5Ttz5nz/UU4mn4WA2H+w6
 0WdCCQ578E2BKBk1wbn2CbmS6YHjIazTPWI/oiBeh1vHNExTSIK7VsE
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=Lge8w8xidNSf/INy7JAIbAW+Hezkp3nsBh2OjKL7lLU=

The device provides a shared interrupt line for to notify events and
data ready, which can be used as a trigger. The interrupt line is not a
requirement for the device to work. Implement variants for the cases
whether the interrupt line is provided or not.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/iio/light/veml6031x00.c | 538 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 532 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031x00.c
index 0cccd40d729e..e193f87e6740 100644
--- a/drivers/iio/light/veml6031x00.c
+++ b/drivers/iio/light/veml6031x00.c
@@ -22,6 +22,9 @@
 #include <linux/regulator/consumer.h>
 
 #include <linux/iio/iio.h>
+#include <linux/iio/events.h>
+#include <linux/iio/sysfs.h>
+#include <linux/iio/trigger.h>
 #include <linux/iio/iio-gts-helper.h>
 #include <linux/iio/triggered_buffer.h>
 #include <linux/iio/trigger_consumer.h>
@@ -29,16 +32,29 @@
 /* Device registers */
 #define VEML6031X00_REG_CONF0       0x00
 #define VEML6031X00_REG_CONF1       0x01
+#define VEML6031X00_REG_WH_L        0x04
+#define VEML6031X00_REG_WH_H        0x05
+#define VEML6031X00_REG_WL_L        0x06
+#define VEML6031X00_REG_WL_H        0x07
 #define VEML6031X00_REG_ALS_L       0x10
 #define VEML6031X00_REG_ALS_H       0x11
 #define VEML6031X00_REG_IR_L        0x12
 #define VEML6031X00_REG_IR_H        0x13
 #define VEML6031X00_REG_ID_L        0x14
 #define VEML6031X00_REG_ID_H        0x15
+#define VEML6031X00_REG_INT         0x17
 
 /* Bit masks for specific functionality */
 #define VEML6031X00_CONF0_SD        BIT(0)
+#define VEML6031X00_CONF0_AF_TRIG   BIT(2)
+#define VEML6031X00_CONF0_AF        BIT(3)
 #define VEML6031X00_CONF1_IR_SD     BIT(7)
+#define VEML6031X00_INT_TH_H        BIT(1)
+#define VEML6031X00_INT_TH_L        BIT(2)
+#define VEML6031X00_INT_DRDY        BIT(3)
+#define VEML6031X00_INT_MASK        (VEML6031X00_INT_TH_L | \
+				     VEML6031X00_INT_TH_H | \
+				     VEML6031X00_INT_DRDY)
 
 enum veml6031x00_scan {
 	VEML6031X00_SCAN_ALS,
@@ -48,8 +64,10 @@ enum veml6031x00_scan {
 
 struct veml6031x00_rf {
 	struct regmap_field *gain;
+	struct regmap_field *int_en;
 	struct regmap_field *it;
 	struct regmap_field *pd_div4;
+	struct regmap_field *pers;
 };
 
 struct veml6031x00_chip {
@@ -60,6 +78,7 @@ struct veml6031x00_chip {
 struct veml6031x00_data {
 	struct iio_gts gts;
 	struct regmap *regmap;
+	struct iio_trigger *trig;
 	struct veml6031x00_rf rf;
 	const struct veml6031x00_chip *chip;
 	/*
@@ -68,6 +87,14 @@ struct veml6031x00_data {
 	 * consistent set.
 	 */
 	struct mutex scale_lock;
+	/*
+	 * Serialize access to irq enable/disable by events and trigger
+	 * (shared line)
+	 */
+	struct mutex irq_lock;
+	int int_users;
+	bool ev_en;
+	bool trig_en;
 };
 
 static const struct iio_itime_sel_mul veml6031x00_it_sel[] = {
@@ -102,6 +129,17 @@ static const struct iio_gain_sel_pair veml6031x00_gain_sel[] = {
 	GAIN_SCALE_GAIN(16, VEML6031X00_SEL_GAIN_2_000),
 };
 
+static IIO_CONST_ATTR(in_illuminance_thresh_either_period_available, "1 2 4 8");
+
+static struct attribute *veml6031x00_event_attributes[] = {
+	&iio_const_attr_in_illuminance_thresh_either_period_available.dev_attr.attr,
+	NULL
+};
+
+static const struct attribute_group veml6031x00_event_attr_group = {
+	.attrs = veml6031x00_event_attributes,
+};
+
 /*
  * The shutdown bits (SD and ALS_IR_SD) are in different registers, which
  * must be written together when configuring the device.
@@ -139,6 +177,23 @@ static void veml6031x00_als_shutdown_action(void *data)
 			"Failed to shut down device: %d\n", ret);
 }
 
+static const struct iio_event_spec veml6031x00_event_spec[] = {
+	{
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_RISING,
+		.mask_separate = BIT(IIO_EV_INFO_VALUE),
+	}, {
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_FALLING,
+		.mask_separate = BIT(IIO_EV_INFO_VALUE),
+	}, {
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_EITHER,
+		.mask_separate = BIT(IIO_EV_INFO_PERIOD) |
+				 BIT(IIO_EV_INFO_ENABLE),
+	},
+};
+
 static const struct iio_chan_spec veml6031x00_channels[] = {
 	{
 		.type = IIO_LIGHT,
@@ -158,9 +213,47 @@ static const struct iio_chan_spec veml6031x00_channels[] = {
 	}
 };
 
+static const struct iio_chan_spec veml6031x00_channels_irq[] = {
+	{
+		.type = IIO_LIGHT,
+		.address = VEML6031X00_REG_ALS_L,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+				      BIT(IIO_CHAN_INFO_INT_TIME) |
+				      BIT(IIO_CHAN_INFO_SCALE),
+		.info_mask_separate_available = BIT(IIO_CHAN_INFO_INT_TIME) |
+						BIT(IIO_CHAN_INFO_SCALE),
+		.event_spec = veml6031x00_event_spec,
+		.num_event_specs = ARRAY_SIZE(veml6031x00_event_spec),
+		.scan_index = VEML6031X00_SCAN_ALS,
+		.scan_type = {
+			.format = IIO_SCAN_FORMAT_UNSIGNED_INT,
+			.realbits = 16,
+			.storagebits = 16,
+			.endianness = IIO_LE,
+		},
+	},
+	{
+		.type = IIO_INTENSITY,
+		.address = VEML6031X00_REG_IR_L,
+		.modified = 1,
+		.channel2 = IIO_MOD_LIGHT_IR,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+		.scan_index = VEML6031X00_SCAN_IR,
+		.scan_type = {
+			.format = IIO_SCAN_FORMAT_UNSIGNED_INT,
+			.realbits = 16,
+			.storagebits = 16,
+			.endianness = IIO_LE,
+		},
+	},
+	IIO_CHAN_SOFT_TIMESTAMP(VEML6031X00_SCAN_TIMESTAMP),
+};
+
 static const struct regmap_range veml6031x00_readable_ranges[] = {
 	regmap_reg_range(VEML6031X00_REG_CONF0, VEML6031X00_REG_CONF1),
+	regmap_reg_range(VEML6031X00_REG_WH_L, VEML6031X00_REG_WL_H),
 	regmap_reg_range(VEML6031X00_REG_ALS_L, VEML6031X00_REG_ID_H),
+	regmap_reg_range(VEML6031X00_REG_INT, VEML6031X00_REG_INT),
 };
 
 static const struct regmap_access_table veml6031x00_readable_table = {
@@ -169,7 +262,7 @@ static const struct regmap_access_table veml6031x00_readable_table = {
 };
 
 static const struct regmap_range veml6031x00_writable_ranges[] = {
-	regmap_reg_range(VEML6031X00_REG_CONF0, VEML6031X00_REG_CONF1),
+	regmap_reg_range(VEML6031X00_REG_CONF0, VEML6031X00_REG_WL_H),
 };
 
 static const struct regmap_access_table veml6031x00_writable_table = {
@@ -181,6 +274,7 @@ static const struct regmap_range veml6031x00_volatile_ranges[] = {
 	/* AF_TRIG in CONF0 is volatile */
 	regmap_reg_range(VEML6031X00_REG_CONF0, VEML6031X00_REG_CONF0),
 	regmap_reg_range(VEML6031X00_REG_ALS_L, VEML6031X00_REG_IR_H),
+	regmap_reg_range(VEML6031X00_REG_INT, VEML6031X00_REG_INT),
 };
 
 static const struct regmap_access_table veml6031x00_volatile_table = {
@@ -188,6 +282,15 @@ static const struct regmap_access_table veml6031x00_volatile_table = {
 	.n_yes_ranges = ARRAY_SIZE(veml6031x00_volatile_ranges),
 };
 
+static const struct regmap_range veml6031x00_precious_ranges[] = {
+	regmap_reg_range(VEML6031X00_REG_INT, VEML6031X00_REG_INT),
+};
+
+static const struct regmap_access_table veml6031x00_precious_table = {
+	.yes_ranges = veml6031x00_precious_ranges,
+	.n_yes_ranges = ARRAY_SIZE(veml6031x00_precious_ranges),
+};
+
 static const struct regmap_config veml6031x00_regmap_config = {
 	.name = "veml6031x00_regmap",
 	.reg_bits = 8,
@@ -195,13 +298,20 @@ static const struct regmap_config veml6031x00_regmap_config = {
 	.rd_table = &veml6031x00_readable_table,
 	.wr_table = &veml6031x00_writable_table,
 	.volatile_table = &veml6031x00_volatile_table,
-	.max_register = VEML6031X00_REG_ID_H,
+	.precious_table = &veml6031x00_precious_table,
+	.max_register = VEML6031X00_REG_INT,
 	.cache_type = REGCACHE_MAPLE,
 };
 
+static const struct reg_field veml6031x00_rf_int_en =
+	REG_FIELD(VEML6031X00_REG_CONF0, 1, 1);
+
 static const struct reg_field veml6031x00_rf_it =
 	REG_FIELD(VEML6031X00_REG_CONF0, 4, 6);
 
+static const struct reg_field veml6031x00_rf_pers =
+	REG_FIELD(VEML6031X00_REG_CONF1, 1, 2);
+
 static const struct reg_field veml6031x00_rf_gain =
 	REG_FIELD(VEML6031X00_REG_CONF1, 3, 4);
 
@@ -219,6 +329,12 @@ static int veml6031x00_regfield_init(struct veml6031x00_data *data)
 		return PTR_ERR(rm_field);
 	rf->gain = rm_field;
 
+	rm_field = devm_regmap_field_alloc(regmap_get_device(data->regmap),
+					   data->regmap, veml6031x00_rf_int_en);
+	if (IS_ERR(rm_field))
+		return PTR_ERR(rm_field);
+	rf->int_en = rm_field;
+
 	rm_field = devm_regmap_field_alloc(regmap_get_device(data->regmap),
 					   data->regmap, veml6031x00_rf_it);
 	if (IS_ERR(rm_field))
@@ -231,6 +347,12 @@ static int veml6031x00_regfield_init(struct veml6031x00_data *data)
 		return PTR_ERR(rm_field);
 	rf->pd_div4 = rm_field;
 
+	rm_field = devm_regmap_field_alloc(regmap_get_device(data->regmap),
+					   data->regmap, veml6031x00_rf_pers);
+	if (IS_ERR(rm_field))
+		return PTR_ERR(rm_field);
+	rf->pers = rm_field;
+
 	return 0;
 }
 
@@ -327,6 +449,30 @@ static int veml6031x00_set_it(struct iio_dev *iio, int val, int val2)
 	return veml6031x00_write_gain(data, gain_sel);
 }
 
+static int veml6031x00_read_period(struct iio_dev *iio, int *val)
+{
+	struct veml6031x00_data *data = iio_priv(iio);
+	int ret, regval;
+
+	ret = regmap_field_read(data->rf.pers, &regval);
+	if (ret)
+		return ret;
+
+	*val = 1 << regval;
+
+	return IIO_VAL_INT;
+}
+
+static int veml6031x00_write_period(struct iio_dev *iio, int val)
+{
+	struct veml6031x00_data *data = iio_priv(iio);
+
+	if (val < 0 || val > 8 || hweight8(val) != 1)
+		return -EINVAL;
+
+	return regmap_field_write(data->rf.pers, ffs(val) - 1);
+}
+
 static int veml6031x00_set_scale(struct iio_dev *iio, int val, int val2)
 {
 	struct veml6031x00_data *data = iio_priv(iio);
@@ -381,6 +527,52 @@ static int veml6031x00_get_scale(struct veml6031x00_data *data, int *val,
 	return IIO_VAL_INT_PLUS_NANO;
 }
 
+static int veml6031x00_read_th(struct iio_dev *iio, int *val, int *val2, int dir)
+{
+	struct veml6031x00_data *data = iio_priv(iio);
+	__le16 regval;
+	int ret;
+
+	if (dir == IIO_EV_DIR_RISING)
+		ret = regmap_bulk_read(data->regmap, VEML6031X00_REG_WH_L,
+				       &regval, sizeof(regval));
+	else
+		ret = regmap_bulk_read(data->regmap, VEML6031X00_REG_WL_L,
+				       &regval, sizeof(regval));
+	if (ret)
+		return ret;
+
+	*val = le16_to_cpu(regval);
+
+	return IIO_VAL_INT;
+}
+
+static int veml6031x00_write_th(struct iio_dev *iio, int val, int val2, int dir)
+{
+	struct veml6031x00_data *data = iio_priv(iio);
+	__le16 regval = cpu_to_le16(val);
+	int ret;
+
+	if (val < 0 || val > U16_MAX || val2)
+		return -EINVAL;
+
+	if (dir == IIO_EV_DIR_RISING) {
+		ret = regmap_bulk_write(data->regmap, VEML6031X00_REG_WH_L,
+					&regval, sizeof(regval));
+		if (ret)
+			dev_dbg(regmap_get_device(data->regmap),
+				"Failed to set high threshold %d\n", ret);
+	} else {
+		ret = regmap_bulk_write(data->regmap, VEML6031X00_REG_WL_L,
+					&regval, sizeof(regval));
+		if (ret)
+			dev_dbg(regmap_get_device(data->regmap),
+				"Failed to set low threshold %d\n", ret);
+	}
+
+	return ret;
+}
+
 static int veml6031x00_single_read(struct iio_dev *iio, enum iio_chan_type type,
 				   int *val)
 {
@@ -494,13 +686,205 @@ static int veml6031x00_write_raw_get_fmt(struct iio_dev *indio_dev,
 	}
 }
 
+static int veml6031x00_set_interrupt(struct veml6031x00_data *data, bool state)
+	__must_hold(&data->irq_lock)
+{
+	int ret;
+
+	if (state) {
+		data->int_users++;
+		if (data->int_users > 1)
+			return 0;
+	} else {
+		data->int_users--;
+		if (data->int_users > 0)
+			return 0;
+	}
+
+	ret = regmap_field_write(data->rf.int_en, state);
+	if (ret) {
+		if (state)
+			data->int_users--;
+		else
+			data->int_users++;
+	}
+
+	return ret;
+}
+
+static int veml6031x00_read_event_val(struct iio_dev *iio,
+				      const struct iio_chan_spec *chan,
+				      enum iio_event_type type,
+				      enum iio_event_direction dir,
+				      enum iio_event_info info,
+				      int *val, int *val2)
+{
+	switch (type) {
+	case IIO_EV_TYPE_THRESH:
+		if (dir == IIO_EV_DIR_EITHER && info == IIO_EV_INFO_PERIOD)
+			return veml6031x00_read_period(iio, val);
+
+		return veml6031x00_read_th(iio, val, val2, dir);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int veml6031x00_write_event_val(struct iio_dev *iio,
+				       const struct iio_chan_spec *chan,
+				       enum iio_event_type type,
+				       enum iio_event_direction dir,
+				       enum iio_event_info info,
+				       int val, int val2)
+{
+	switch (info) {
+	case IIO_EV_INFO_VALUE:
+		return veml6031x00_write_th(iio, val, val2, dir);
+	case IIO_EV_INFO_PERIOD:
+		return veml6031x00_write_period(iio, val);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int veml6031x00_read_event_config(struct iio_dev *iio,
+					 const struct iio_chan_spec *chan,
+					 enum iio_event_type type,
+					 enum iio_event_direction dir)
+{
+	struct veml6031x00_data *data = iio_priv(iio);
+
+	guard(mutex)(&data->irq_lock);
+
+	return data->ev_en;
+}
+
+static int veml6031x00_write_event_config(struct iio_dev *iio,
+					  const struct iio_chan_spec *chan,
+					  enum iio_event_type type,
+					  enum iio_event_direction dir,
+					  bool state)
+{
+	struct veml6031x00_data *data = iio_priv(iio);
+	int ret;
+
+	guard(mutex)(&data->irq_lock);
+
+	/* avoid multiple increments/decrements from one source */
+	if (state == data->ev_en)
+		return 0;
+
+	if (state) {
+		ret = pm_runtime_resume_and_get(regmap_get_device(data->regmap));
+		if (ret)
+			return ret;
+	}
+
+	ret = veml6031x00_set_interrupt(data, state);
+	if (ret) {
+		if (state)
+			pm_runtime_put_autosuspend(regmap_get_device(data->regmap));
+		return ret;
+	}
+
+	data->ev_en = state;
+
+	if (!state)
+		pm_runtime_put_autosuspend(regmap_get_device(data->regmap));
+
+	return 0;
+}
+
+static void veml6031x00_disable_event_action(void *arg)
+{
+	struct veml6031x00_data *data = arg;
+	int ret;
+
+	guard(mutex)(&data->irq_lock);
+
+	if (!data->ev_en)
+		return;
+
+	ret = veml6031x00_set_interrupt(data, false);
+	if (ret)
+		dev_err(regmap_get_device(data->regmap),
+			"Failed to disable events: %d\n", ret);
+
+	data->ev_en = false;
+	pm_runtime_put_autosuspend(regmap_get_device(data->regmap));
+}
+
 static const struct iio_info veml6031x00_info = {
 	.read_raw = veml6031x00_read_raw,
 	.read_avail = veml6031x00_read_avail,
 	.write_raw = veml6031x00_write_raw,
 	.write_raw_get_fmt = veml6031x00_write_raw_get_fmt,
+	.read_event_value = veml6031x00_read_event_val,
+	.write_event_value = veml6031x00_write_event_val,
+	.read_event_config = veml6031x00_read_event_config,
+	.write_event_config = veml6031x00_write_event_config,
+	.event_attrs = &veml6031x00_event_attr_group,
+};
+
+static const struct iio_info veml6031x00_info_no_irq = {
+	.read_raw = veml6031x00_read_raw,
+	.read_avail = veml6031x00_read_avail,
+	.write_raw = veml6031x00_write_raw,
+	.write_raw_get_fmt = veml6031x00_write_raw_get_fmt,
 };
 
+static irqreturn_t veml6031x00_interrupt(int irq, void *private)
+{
+	struct iio_dev *iio = private;
+	struct veml6031x00_data *data = iio_priv(iio);
+	s64 timestamp;
+	int regval, ret;
+	bool trigger_poll;
+
+	scoped_guard(mutex, &data->irq_lock) {
+		ret = regmap_read(data->regmap, VEML6031X00_REG_INT, &regval);
+		if (ret) {
+			dev_dbg(regmap_get_device(data->regmap),
+				"Failed to read interrupt register %d\n", ret);
+			return IRQ_NONE;
+		}
+
+		if (!(regval & VEML6031X00_INT_MASK))
+			return IRQ_NONE;
+
+		if ((regval & (VEML6031X00_INT_TH_H | VEML6031X00_INT_TH_L)) &&
+		    data->ev_en) {
+			timestamp = iio_get_time_ns(iio);
+
+			if (regval & VEML6031X00_INT_TH_H)
+				iio_push_event(iio,
+					       IIO_UNMOD_EVENT_CODE(IIO_LIGHT, 0,
+								    IIO_EV_TYPE_THRESH,
+								    IIO_EV_DIR_RISING),
+					       timestamp);
+			if (regval & VEML6031X00_INT_TH_L)
+				iio_push_event(iio,
+					       IIO_UNMOD_EVENT_CODE(IIO_LIGHT, 0,
+								    IIO_EV_TYPE_THRESH,
+								    IIO_EV_DIR_FALLING),
+					       timestamp);
+		}
+
+		trigger_poll = (regval & VEML6031X00_INT_DRDY) && data->trig_en;
+	}
+
+	/*
+	 * iio_trigger_poll_nested() must be called with irq_lock released:
+	 * iio_trigger_poll_nested() runs trig_handler() synchronously in this
+	 * thread, which calls reenable() on completion, and that callback also
+	 * takes irq_lock.
+	 */
+	if (trigger_poll)
+		iio_trigger_poll_nested(data->trig);
+
+	return IRQ_HANDLED;
+}
+
 static int veml6031x00_buffer_preenable(struct iio_dev *iio)
 {
 	struct veml6031x00_data *data = iio_priv(iio);
@@ -535,11 +919,78 @@ static int veml6031x00_buffer_postdisable(struct iio_dev *iio)
 	return 0;
 }
 
+static int veml6031x00_set_trigger_state(struct iio_trigger *trig, bool state)
+{
+	struct iio_dev *iio = iio_trigger_get_drvdata(trig);
+	struct veml6031x00_data *data = iio_priv(iio);
+	int ret;
+
+	guard(mutex)(&data->irq_lock);
+
+	if (state == data->trig_en)
+		return 0;
+
+	ret = veml6031x00_set_interrupt(data, state);
+	if (ret)
+		return ret;
+
+	/* The AF bit must be set before setting AF_TRIG */
+	ret = regmap_update_bits(data->regmap, VEML6031X00_REG_CONF0,
+				 VEML6031X00_CONF0_AF,
+				 FIELD_PREP(VEML6031X00_CONF0_AF, state));
+	if (ret) {
+		veml6031x00_set_interrupt(data, !state);
+
+		return ret;
+	}
+
+	ret = regmap_update_bits(data->regmap, VEML6031X00_REG_CONF0,
+				 VEML6031X00_CONF0_AF_TRIG,
+				 FIELD_PREP(VEML6031X00_CONF0_AF_TRIG, state));
+	if (ret) {
+		regmap_update_bits(data->regmap, VEML6031X00_REG_CONF0,
+				   VEML6031X00_CONF0_AF,
+				   FIELD_PREP(VEML6031X00_CONF0_AF, !state));
+		veml6031x00_set_interrupt(data, !state);
+
+		return ret;
+	}
+
+	data->trig_en = state;
+
+	return 0;
+}
+
 static const struct iio_buffer_setup_ops veml6031x00_buffer_setup_ops = {
 	.preenable = veml6031x00_buffer_preenable,
 	.postdisable = veml6031x00_buffer_postdisable,
 };
 
+static void veml6031x00_trigger_reenable(struct iio_trigger *trig)
+{
+	struct iio_dev *iio = iio_trigger_get_drvdata(trig);
+	struct veml6031x00_data *data = iio_priv(iio);
+	int ret;
+
+	guard(mutex)(&data->irq_lock);
+
+	if (!data->trig_en)
+		return;
+
+	ret = regmap_update_bits(data->regmap, VEML6031X00_REG_CONF0,
+				 VEML6031X00_CONF0_AF_TRIG,
+				 FIELD_PREP(VEML6031X00_CONF0_AF_TRIG, true));
+	if (ret)
+		dev_err(regmap_get_device(data->regmap),
+			"Failed to reenable trigger: %d\n", ret);
+}
+
+static const struct iio_trigger_ops veml6031x00_trigger_ops = {
+	.validate_device = iio_trigger_validate_own_device,
+	.set_trigger_state = veml6031x00_set_trigger_state,
+	.reenable = veml6031x00_trigger_reenable,
+};
+
 static irqreturn_t veml6031x00_trig_handler(int irq, void *p)
 {
 	struct iio_poll_func *pf = p;
@@ -597,7 +1048,8 @@ static int veml6031x00_validate_part_id(struct veml6031x00_data *data)
 static int veml6031x00_hw_init(struct iio_dev *iio)
 {
 	struct veml6031x00_data *data = iio_priv(iio);
-	int ret;
+	int ret, val;
+	__le16 regval;
 
 	/* Max resolution = 6.9632 lx/cnt for gain = 0.125 and IT = 3.125ms */
 	ret = devm_iio_init_iio_gts(regmap_get_device(data->regmap), 6, 963200000,
@@ -610,6 +1062,60 @@ static int veml6031x00_hw_init(struct iio_dev *iio)
 		return dev_err_probe(regmap_get_device(data->regmap), ret,
 				     "failed to init IIO GTS\n");
 
+	regval = 0;
+	ret = regmap_bulk_write(data->regmap, VEML6031X00_REG_WL_L, &regval,
+				sizeof(regval));
+	if (ret)
+		return dev_err_probe(regmap_get_device(data->regmap), ret,
+				     "Failed to set low threshold\n");
+
+	regval = cpu_to_le16(U16_MAX);
+	ret = regmap_bulk_write(data->regmap, VEML6031X00_REG_WH_L, &regval,
+				sizeof(regval));
+	if (ret)
+		return dev_err_probe(regmap_get_device(data->regmap), ret,
+				     "Failed to set high threshold\n");
+
+	ret = regmap_field_write(data->rf.int_en, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(data->regmap, VEML6031X00_REG_INT, &val);
+	if (ret)
+		return dev_err_probe(regmap_get_device(data->regmap), ret,
+				     "Failed to clear interrupts\n");
+
+	return 0;
+}
+
+static int veml6031x00_setup_irq(struct i2c_client *i2c, struct iio_dev *iio)
+{
+	struct veml6031x00_data *data = iio_priv(iio);
+	int ret;
+
+	data->trig = devm_iio_trigger_alloc(regmap_get_device(data->regmap),
+					    "%s-drdy%d", iio->name, iio_device_id(iio));
+	if (!data->trig)
+		return -ENOMEM;
+
+	data->trig->ops = &veml6031x00_trigger_ops;
+	iio_trigger_set_drvdata(data->trig, iio);
+
+	ret = devm_iio_trigger_register(regmap_get_device(data->regmap), data->trig);
+	if (ret)
+		return ret;
+
+	iio->trig = iio_trigger_get(data->trig);
+	ret = devm_request_threaded_irq(regmap_get_device(data->regmap),
+					i2c->irq, NULL,
+					veml6031x00_interrupt,
+					IRQF_ONESHOT,
+					iio->name, iio);
+	if (ret)
+		return dev_err_probe(regmap_get_device(data->regmap), ret,
+				     "Failed to request irq %d\n",
+				     i2c->irq);
+
 	return 0;
 }
 
@@ -636,15 +1142,29 @@ static int veml6031x00_probe(struct i2c_client *i2c)
 				     "Failed to set regmap\n");
 
 	iio->name = data->chip->name;
-	iio->channels = veml6031x00_channels;
-	iio->num_channels = ARRAY_SIZE(veml6031x00_channels);
 	iio->modes = INDIO_DIRECT_MODE;
-	iio->info = &veml6031x00_info;
+	if (i2c->irq) {
+		iio->channels = veml6031x00_channels_irq;
+		iio->num_channels = ARRAY_SIZE(veml6031x00_channels_irq);
+		ret = veml6031x00_setup_irq(i2c, iio);
+		if (ret)
+			return ret;
+
+		iio->info = &veml6031x00_info;
+	} else {
+		iio->channels = veml6031x00_channels;
+		iio->num_channels = ARRAY_SIZE(veml6031x00_channels);
+		iio->info = &veml6031x00_info_no_irq;
+	}
 
 	ret = devm_mutex_init(&i2c->dev, &data->scale_lock);
 	if (ret)
 		return ret;
 
+	ret = devm_mutex_init(&i2c->dev, &data->irq_lock);
+	if (ret)
+		return ret;
+
 	ret = veml6031x00_regfield_init(data);
 	if (ret)
 		return dev_err_probe(&i2c->dev, ret, "Failed to init regfield\n");
@@ -672,6 +1192,12 @@ static int veml6031x00_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(&i2c->dev, ret, "Failed to get runtime PM\n");
 
+	ret = devm_add_action_or_reset(&i2c->dev,
+				       veml6031x00_disable_event_action, data);
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret,
+				     "Failed to add event cleanup action\n");
+
 	ret = veml6031x00_validate_part_id(data);
 	if (ret)
 		return ret;

-- 
2.43.0

