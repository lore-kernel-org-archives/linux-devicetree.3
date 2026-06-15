Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD01C3F8886
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533320; cv=none; b=RM7TBvTRvGbIQZ3PpY8+hNcPBdMIiUuFvTU+OOYhxMI6raRNgqYP6IKidwPCbkn4bGAR/zxBtrp8OK8z/715WW1gxR67JX4ptyfxOtvFruoGVKI8JbMIGCCqetgTssAI0+bhmwsysHyAJ154APcPSSO2xJUFdDdwp1jOiUkTYZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533320; c=relaxed/simple;
	bh=qfK3SKX6U5kDYSvYsmzi2QUd5YPBvw5DVn0OKZsUIIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ayQDOMHCCwOroPKRQxE8TtEAgbr8v8eJrqjV0hQD9FjebV9e+enoiMCKWS970EAfhcZrdVcdj/dBK3jHZsKvmixJaT/whq4LrscRtmC2Rzi9Es26URcdhvaZSn1+y4Bk97/d52Jl5hrWGWkYD53HGrGIH4NYgdUiqcjSi3UjZKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iI5qDT09; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iI5qDT09"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36da151a152so2395169a91.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533313; x=1782138113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+lG/D10H+WbBBEJPWpqjE1Xy7NGrC7DoYpfX8RmnS0=;
        b=iI5qDT091vFfqdtnVDzBsZnwNP4YaCkVkjvE5t6XRNenHEeNo3rKOk9NQ16xZY8rEU
         cnkRk/zW0T7pDKVhEupveOkFErUqJ1lbUoxORf5Rd2wR6Tjh6uUT4IZt04ldo/XcOlM1
         vf4Teyiy8gBrc1EQ6poS8GYVequId1xz5xFLDTXm37gzIfHMQAx2dnQTNcluuxWFLftF
         eBFCMn+qJSg94F8rHEZJwomSWB/KvUMyUlIvXxcXfJz2CUzF5vLfjiAKEuhripFRIhrd
         c/cr8ZnIJ9EV39Cl15jRO2eBSxDKFVRFrddgyI6pLbY8xYlGAILznR0JnJGLTFCdFxBb
         ud7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533313; x=1782138113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m+lG/D10H+WbBBEJPWpqjE1Xy7NGrC7DoYpfX8RmnS0=;
        b=OVvPjVllGasXizRW5eeSdLqkME8vW54vXeykVs++lB8iYQxaN0oZGdYhwZnRKMf+Fs
         geuNtRH+03iHDo5yssjy7zhMlV8FkNATfICuXqrdaGqyJZ58AoauCVTqoewqHL3JKi+Q
         NguxYP1k1OlrB3HROa9wAEO8/8xVsjzOP2NCjy92kRcgDxYf1iUoyM+xf0C/ov7/8gVL
         SwP5TRGbrNRcFHmgQ9iX4yPQMDglHoKdXSBbti29sNFKBFCDp0tUWaClpLzOd/GInNIU
         fqtj8VbhE65J/YNbEq5Wtc95LImhXzLaAfMMX0eGZv0x4zM8aURWBVdjWmBpgXbKl/TZ
         /RQw==
X-Forwarded-Encrypted: i=1; AFNElJ/Jv920/zt0g/NB3j9rvPtJTPhBugDrzYIQgy2H1qJlp0BSlBfAE7d1vcPYYz1o+Ho54TNMXCq0vfCe@vger.kernel.org
X-Gm-Message-State: AOJu0YxXdCV+DEFahyw7z4u7KgSqGKxgZi5cjbIhLWcx599bed5WEftj
	ln6oZ86Rb/nrx0WqXGTMQ6SZqFqMugKwo01IbhYECqzQP8D7h33aTvafXXzNXlpI3h47qQ==
X-Gm-Gg: Acq92OEb/KovX9f2FSCdq72CH9/icPxrNdyrAit336vhTUvGtTFx85xWIw+tD1eCppa
	6U9gOBy6lp7GDGnk3Mlx0hZ/S95kr92B/JOzZZ89synHM+/3j6DhLAFubKgzNmub9WMenpi76x4
	HkSlF17EAfuf9WPs8eoqHpFARkF0VmNTfRLOZZtN9E5TthdiEIQO78g8h4bZ/Pdo0rcSR6tNtwH
	VPCFRnBtVu5NC56dDUmOgdqp5C0ZPRJY+ywXw6SF+42DjC8zPhpV47vQPD9dei1ZDFJ8EiLjRFn
	mbm2TAS0NN5rIaJkHBY5sHeXW+/u4Q2yy4sxTpEkVfzP2EbWlnec2nvwbTLoXuGyq6o1XqIW+la
	3wH4TZL3l15DkxbJSA20rkAdkvWkVPYsmmS16lHsS4Rkf02qIP7/U50AkZ7eGG6LKKvGzua+DKU
	Weyal+IO4NXZG75I40WM8D
X-Received: by 2002:a17:90a:e70d:b0:36b:9798:4f67 with SMTP id 98e67ed59e1d1-37c2bc73c79mr11726358a91.8.1781533312731;
        Mon, 15 Jun 2026 07:21:52 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm7178233a91.2.2026.06.15.07.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:21:52 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/10] Input: cap11xx - refactor code for better CAP1114 support.
Date: Mon, 15 Jun 2026 22:20:33 +0800
Message-ID: <20260615142103.352163-8-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615142103.352163-1-jerrysteve1101@gmail.com>
References: <20260615142103.352163-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend cap11xx_hw_model structure to support CAP1114 with
different register offsets and hardware characteristics:

- led_output_control_reg_base: different address on CAP1114
- sensor_input_reg_base: different address on CAP1114
- num_sensor_thresholds: separate value from num_channels for CAP1114
- has_repeat_en: repeat enable support, disabled by default on CAP1114

Include linux/bits.h, update the register operations related to LEDs.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/input/keyboard/cap11xx.c | 73 +++++++++++++++++++++++---------
 1 file changed, 53 insertions(+), 20 deletions(-)

diff --git a/drivers/input/keyboard/cap11xx.c b/drivers/input/keyboard/cap11xx.c
index 3d75c0f90752..2e9382a721e9 100644
--- a/drivers/input/keyboard/cap11xx.c
+++ b/drivers/input/keyboard/cap11xx.c
@@ -5,6 +5,7 @@
  * (c) 2014 Daniel Mack <linux@zonque.org>
  */
 
+#include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -35,7 +36,6 @@
 #define CAP11XX_REG_LED_DUTY_CYCLE_4	0x93
 
 #define CAP11XX_REG_LED_DUTY_MAX_MASK	(0xf0)
-#define CAP11XX_REG_LED_DUTY_MAX_MASK_SHIFT	(4)
 #define CAP11XX_REG_LED_DUTY_MAX_VALUE	(15)
 
 #define CAP11XX_REG_PRODUCT_ID		0xfd
@@ -76,10 +76,14 @@ struct cap11xx_priv {
 
 struct cap11xx_hw_model {
 	u8 product_id;
+	u8 led_output_control_reg_base;
+	u8 sensor_input_reg_base;
 	unsigned int num_channels;
 	unsigned int num_leds;
+	unsigned int num_sensor_thresholds;
 	bool has_gain;
 	bool has_irq_config;
+	bool has_repeat_en;
 	bool has_sensitivity_control;
 	bool has_signal_guard;
 };
@@ -204,8 +208,8 @@ static int cap11xx_init_keys(struct cap11xx_priv *priv)
 	}
 
 	if (!of_property_read_u32_array(node, "microchip,input-threshold",
-					priv->thresholds, priv->model->num_channels)) {
-		for (i = 0; i < priv->model->num_channels; i++) {
+					priv->thresholds, priv->model->num_sensor_thresholds)) {
+		for (i = 0; i < priv->model->num_sensor_thresholds; i++) {
 			if (priv->thresholds[i] > 127) {
 				dev_err(dev, "Invalid input-threshold value %u\n",
 					priv->thresholds[i]);
@@ -279,10 +283,12 @@ static int cap11xx_init_keys(struct cap11xx_priv *priv)
 	of_property_read_u32_array(node, "linux,keycodes",
 				   priv->keycodes, priv->model->num_channels);
 
-	/* Disable autorepeat. The Linux input system has its own handling. */
-	error = regmap_write(priv->regmap, CAP11XX_REG_REPEAT_RATE, 0);
-	if (error)
-		return error;
+	if (priv->model->has_repeat_en) {
+		/* Disable autorepeat. The Linux input system has its own handling. */
+		error = regmap_write(priv->regmap, CAP11XX_REG_REPEAT_RATE, 0);
+		if (error)
+			return error;
+	}
 
 	return 0;
 }
@@ -301,7 +307,7 @@ static irqreturn_t cap11xx_thread_func(int irq_num, void *data)
 	if (ret < 0)
 		goto out;
 
-	ret = regmap_read(priv->regmap, CAP11XX_REG_SENSOR_INPUT, &status);
+	ret = regmap_read(priv->regmap, priv->model->sensor_input_reg_base, &status);
 	if (ret < 0)
 		goto out;
 
@@ -355,7 +361,7 @@ static int cap11xx_led_set(struct led_classdev *cdev,
 	 * 0 (OFF) and 1 (ON).
 	 */
 	return regmap_update_bits(priv->regmap,
-				  CAP11XX_REG_LED_OUTPUT_CONTROL,
+				  priv->model->led_output_control_reg_base,
 				  BIT(led->reg),
 				  value ? BIT(led->reg) : 0);
 }
@@ -367,6 +373,7 @@ static int cap11xx_init_leds(struct device *dev,
 	struct cap11xx_led *led;
 	int cnt = of_get_child_count(node);
 	int error;
+	u32 duty_val;
 
 	if (!num_leds || !cnt)
 		return 0;
@@ -380,15 +387,18 @@ static int cap11xx_init_leds(struct device *dev,
 
 	priv->leds = led;
 
+	/* Set all LEDs to off */
 	error = regmap_update_bits(priv->regmap,
-				CAP11XX_REG_LED_OUTPUT_CONTROL, 0xff, 0);
+				   priv->model->led_output_control_reg_base,
+				   GENMASK(min(num_leds, 8) - 1, 0), 0);
 	if (error)
 		return error;
 
+	duty_val = FIELD_PREP(CAP11XX_REG_LED_DUTY_MAX_MASK,
+			      CAP11XX_REG_LED_DUTY_MAX_VALUE);
+
 	error = regmap_update_bits(priv->regmap, CAP11XX_REG_LED_DUTY_CYCLE_4,
-				CAP11XX_REG_LED_DUTY_MAX_MASK,
-				CAP11XX_REG_LED_DUTY_MAX_VALUE <<
-				CAP11XX_REG_LED_DUTY_MAX_MASK_SHIFT);
+				   CAP11XX_REG_LED_DUTY_MAX_MASK, duty_val);
 	if (error)
 		return error;
 
@@ -553,41 +563,64 @@ static int cap11xx_i2c_probe(struct i2c_client *i2c_client)
 }
 
 static const struct cap11xx_hw_model cap1106_model = {
-	.product_id = 0x55, .num_channels = 6, .num_leds = 0,
+	.product_id = 0x55,
+	.num_channels = 6, .num_leds = 0, .num_sensor_thresholds = 6,
+	.sensor_input_reg_base = CAP11XX_REG_SENSOR_INPUT,
 	.has_gain = true,
 	.has_irq_config = true,
+	.has_repeat_en = true,
 };
 
 static const struct cap11xx_hw_model cap1126_model = {
-	.product_id = 0x53, .num_channels = 6, .num_leds = 2,
+	.product_id = 0x53,
+	.num_channels = 6, .num_leds = 2, .num_sensor_thresholds = 6,
+	.led_output_control_reg_base = CAP11XX_REG_LED_OUTPUT_CONTROL,
+	.sensor_input_reg_base = CAP11XX_REG_SENSOR_INPUT,
 	.has_gain = true,
 	.has_irq_config = true,
+	.has_repeat_en = true,
 };
 
 static const struct cap11xx_hw_model cap1188_model = {
-	.product_id = 0x50, .num_channels = 8, .num_leds = 8,
+	.product_id = 0x50,
+	.num_channels = 8, .num_leds = 8, .num_sensor_thresholds = 8,
+	.led_output_control_reg_base = CAP11XX_REG_LED_OUTPUT_CONTROL,
+	.sensor_input_reg_base = CAP11XX_REG_SENSOR_INPUT,
 	.has_gain = true,
 	.has_irq_config = true,
+	.has_repeat_en = true,
 };
 
 static const struct cap11xx_hw_model cap1203_model = {
-	.product_id = 0x6d, .num_channels = 3, .num_leds = 0,
+	.product_id = 0x6d,
+	.num_channels = 3, .num_leds = 0, .num_sensor_thresholds = 3,
+	.sensor_input_reg_base = CAP11XX_REG_SENSOR_INPUT,
+	.has_repeat_en = true,
 };
 
 static const struct cap11xx_hw_model cap1206_model = {
-	.product_id = 0x67, .num_channels = 6, .num_leds = 0,
+	.product_id = 0x67,
+	.num_channels = 6, .num_leds = 0, .num_sensor_thresholds = 6,
+	.sensor_input_reg_base = CAP11XX_REG_SENSOR_INPUT,
+	.has_repeat_en = true,
 };
 
 static const struct cap11xx_hw_model cap1293_model = {
-	.product_id = 0x6f, .num_channels = 3, .num_leds = 0,
+	.product_id = 0x6f,
+	.num_channels = 3, .num_leds = 0, .num_sensor_thresholds = 3,
+	.sensor_input_reg_base = CAP11XX_REG_SENSOR_INPUT,
 	.has_gain = true,
+	.has_repeat_en = true,
 	.has_sensitivity_control = true,
 	.has_signal_guard = true,
 };
 
 static const struct cap11xx_hw_model cap1298_model = {
-	.product_id = 0x71, .num_channels = 8, .num_leds = 0,
+	.product_id = 0x71,
+	.num_channels = 8, .num_leds = 0, .num_sensor_thresholds = 8,
+	.sensor_input_reg_base = CAP11XX_REG_SENSOR_INPUT,
 	.has_gain = true,
+	.has_repeat_en = true,
 	.has_sensitivity_control = true,
 	.has_signal_guard = true,
 };
-- 
2.54.0

