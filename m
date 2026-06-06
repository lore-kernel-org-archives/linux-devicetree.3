Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F1F26B2D2
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 15:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780758380; cv=none; b=mYn3ImMSBLm2KJgciNqTFxmhgEAAfV9w0I3h6yGGaXyBP41v4DpFwPROkxVRGiHaTbX1HK06vNJefwYDIT9A7na32YMXi4dPeR9JoF+hjIVLJy7tlgsTPk4+qUeQuXm5PzamwpGXRlBoaGdQPHQ1Uf7iXgagcxgWjnOQK0WoUMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780758380; c=relaxed/simple;
	bh=nuMfPmdQ6ap4c/tSQKOX7CZVAISHerWLS0jW+tD3DlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lmu9OdaV+V5PG81Rs+RyUJRunyZXsNfe8E6E4CpPkHz8rzCLSu993wN+ZIwAaRnVp/f71LB1PXCL2gH+4/Za4c8HCf57jLT1ag+xIFT/akLHFFTagiBAhree9U3P342VanKOPHYqsTeNJU9vG6Lsi6ASr0vYqUhRIBMyXEFt6x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEMISu4a; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEMISu4a"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-13817614cd3so617435c88.0
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 08:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780758379; x=1781363179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAASWV/lnc1JU2Ktl9cqYdwLLsmulMXfF+xD4dEkl1M=;
        b=QEMISu4awcCJEAu2fv1FFwohTFrcuyX1EQoUnVLZtpN3D4qiNQdi7hYt89uG4Z7Am8
         wnkeTFhZvTS525xIR9gtiKgwQIGo/drX7r+afGf2IxK4AZwWwW1v3V6Lnou7fMPmPR3R
         Gi2xruE0zzL6Sm8sXRZS1nX6RUZKktiu3JahqeEh5LCelVdCRQ8wvGXZqwJN3erGVb4W
         knGEVHR7kIMWxotlD2cHkAZV07rNlOzVg1n8EaQ9VQQH1QHlZ3KKbq/jA1VuvSqzpQNQ
         xGErDXwIQ4QDc2W2g3yAaSZgujgIKCiKdR3+LVAdGybXGx7mJ1EtQP5cTUQNfDhIc34M
         Q9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780758379; x=1781363179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dAASWV/lnc1JU2Ktl9cqYdwLLsmulMXfF+xD4dEkl1M=;
        b=Hr5GlFwy9SOzKOiI9u6vih6FJq+Xybkhg/eZAOeJAJlHI1+Si/Za4rz52/dXVGw7AZ
         f/5Sc9WDh4MyT8LZb/XrTQZyaHK0j8v5LYc9aJBLO15gpfuG7qhBOYlQPWmiztA/EUYl
         7pxj51DWNZlDh6wfQHhzLAXm6a8GYbXBxew7BCQAd/LMcDIz4cLG35HAw3mKsl5acBpy
         KsfluAgSaA45nKQ//XcoolpYcM7Dzw1g6cTEwX1lgEPlYyhf38hyPzd4mvZLPa0sVZV9
         QrhleMVMcPwmZsZ5txV3zBcgrHuhHciSBOo6/Qer2WoK/zvokq1bl4xwdcmGgF3BNSVF
         vQlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hGEvpDm81zA/mk+ZW/PgHTdKKFGaasoAvyC/ipJte0ynGe2ogWUFAnnrIvNLf4wDuLeRXrwLo5mOX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrk8C1VY1J/YpDsiIH3F9H4eDavryxx1MoV1+ixji/dQXl1dNq
	kxb0xuz4lMuwOe5b96lZS1V3vmEACrpjdh+giNS/dzCzRCX+ZFoS8L5R
X-Gm-Gg: Acq92OGdx4i5Z3eCdYzJvSELk0Z5hRN8CisqMwIOQc5N4pUiZZJ789Yme3mybyUlZpV
	7InxF5ubTkiBuUIaU5WOeQ8AQFiYeegX4R3DrMeZgr6u8XghuWrZ52sxAftUoK9bcBKQsUiZZPY
	V0iEE3nKae6j7Y+LqsOWh98XePhA73UW2wp+WNbUJB81ZHimXotfUjsmxKfpQsQeUxJar9e3VUW
	WlZRXJMkmUyYoYlH8AElrk5IkPlT8/yCMJOUr3HYuCh/Ro1nmd2SNmfD3GreDOzobsv+Gr28f70
	Og1iGTxa1RsSZrG7+iQh2i8m5nh3avAtmAFnLgI3tp0v5dTGpKHQihcJWoFqFirrJicOuZPYHv5
	5zCcPbp9WlesdGrDmEw+Erww1Jn4s26YTme+3CQGnxvUGn3JaWVaPAvHDnn3+rg7Ck0gVgor31k
	NSwBUDmGFuKi+uswd45aZUaUExj+9aFWN6KVtsf0l1CX9RTWhuiQ==
X-Received: by 2002:a05:7022:239d:b0:137:f875:c1de with SMTP id a92af1059eb24-13806722a34mr5157604c88.22.1780758378474;
        Sat, 06 Jun 2026 08:06:18 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539035sm8415607c88.11.2026.06.06.08.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 08:06:17 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] Input: cap11xx - refactor code for better CAP1114 support.
Date: Sat,  6 Jun 2026 23:03:59 +0800
Message-ID: <20260606150458.250606-7-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606150458.250606-1-jerrysteve1101@gmail.com>
References: <20260606150458.250606-1-jerrysteve1101@gmail.com>
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
index 7015aa7654ce..408880cf6516 100644
--- a/drivers/input/keyboard/cap11xx.c
+++ b/drivers/input/keyboard/cap11xx.c
@@ -5,6 +5,7 @@
  * (c) 2014 Daniel Mack <linux@zonque.org>
  */
 
+#include <linux/bits.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
@@ -34,7 +35,6 @@
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
+					priv->model->led_output_control_reg_base,
+					GENMASK(num_leds - 1, 0), 0);
 	if (error)
 		return error;
 
+	duty_val = FIELD_PREP(CAP11XX_REG_LED_DUTY_MAX_MASK,
+			     CAP11XX_REG_LED_DUTY_MAX_VALUE);
+
 	error = regmap_update_bits(priv->regmap, CAP11XX_REG_LED_DUTY_CYCLE_4,
-				CAP11XX_REG_LED_DUTY_MAX_MASK,
-				CAP11XX_REG_LED_DUTY_MAX_VALUE <<
-				CAP11XX_REG_LED_DUTY_MAX_MASK_SHIFT);
+				CAP11XX_REG_LED_DUTY_MAX_MASK, duty_val);
 	if (error)
 		return error;
 
@@ -554,41 +564,64 @@ static int cap11xx_i2c_probe(struct i2c_client *i2c_client)
 }
 
 static const struct cap11xx_hw_model cap1106_model = {
-	.product_id = 0x55, .num_channels = 6, .num_leds = 0,
+	.product_id = 0x55,
+	.sensor_input_reg_base = CAP11XX_REG_SENSOR_INPUT,
+	.num_channels = 6, .num_leds = 0, .num_sensor_thresholds = 6,
 	.has_gain = true,
 	.has_irq_config = true,
+	.has_repeat_en = true,
 };
 
 static const struct cap11xx_hw_model cap1126_model = {
-	.product_id = 0x53, .num_channels = 6, .num_leds = 2,
+	.product_id = 0x53,
+	.led_output_control_reg_base = CAP11XX_REG_LED_OUTPUT_CONTROL,
+	.sensor_input_reg_base = CAP11XX_REG_SENSOR_INPUT,
+	.num_channels = 6, .num_leds = 2, .num_sensor_thresholds = 6,
 	.has_gain = true,
 	.has_irq_config = true,
+	.has_repeat_en = true,
 };
 
 static const struct cap11xx_hw_model cap1188_model = {
-	.product_id = 0x50, .num_channels = 8, .num_leds = 8,
+	.product_id = 0x50,
+	.led_output_control_reg_base = CAP11XX_REG_LED_OUTPUT_CONTROL,
+	.sensor_input_reg_base = CAP11XX_REG_SENSOR_INPUT,
+	.num_channels = 8, .num_leds = 8, .num_sensor_thresholds = 8,
 	.has_gain = true,
 	.has_irq_config = true,
+	.has_repeat_en = true,
 };
 
 static const struct cap11xx_hw_model cap1203_model = {
-	.product_id = 0x6d, .num_channels = 3, .num_leds = 0,
+	.product_id = 0x6d,
+	.sensor_input_reg_base = CAP11XX_REG_SENSOR_INPUT,
+	.num_channels = 3, .num_leds = 0, .num_sensor_thresholds = 3,
+	.has_repeat_en = true,
 };
 
 static const struct cap11xx_hw_model cap1206_model = {
-	.product_id = 0x67, .num_channels = 6, .num_leds = 0,
+	.product_id = 0x67,
+	.sensor_input_reg_base = CAP11XX_REG_SENSOR_INPUT,
+	.num_channels = 6, .num_leds = 0, .num_sensor_thresholds = 6,
+	.has_repeat_en = true,
 };
 
 static const struct cap11xx_hw_model cap1293_model = {
-	.product_id = 0x6f, .num_channels = 3, .num_leds = 0,
+	.product_id = 0x6f,
+	.sensor_input_reg_base = CAP11XX_REG_SENSOR_INPUT,
+	.num_channels = 3, .num_leds = 0, .num_sensor_thresholds = 3,
 	.has_gain = true,
+	.has_repeat_en = true,
 	.has_sensitivity_control = true,
 	.has_signal_guard = true,
 };
 
 static const struct cap11xx_hw_model cap1298_model = {
-	.product_id = 0x71, .num_channels = 8, .num_leds = 0,
+	.product_id = 0x71,
+	.sensor_input_reg_base = CAP11XX_REG_SENSOR_INPUT,
+	.num_channels = 8, .num_leds = 0, .num_sensor_thresholds = 8,
 	.has_gain = true,
+	.has_repeat_en = true,
 	.has_sensitivity_control = true,
 	.has_signal_guard = true,
 };
-- 
2.54.0

