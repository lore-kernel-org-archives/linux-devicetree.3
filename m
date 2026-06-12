Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2396E2010EE
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249037; cv=none; b=rS+UOUYUR/LwuGUYEAcXh5ktZJXpN2aNxzY+X3Lr/hTu/gBnueRRtwXJSyoZqg2bRtZMAvNKS+IV7I1tHTwh/vVsazVrA2kOyOmC2XzP48FffBLrXQu0IHAXLCLqq7K3hcD3U32uN6rMAMj4idVZl08q0zcKR/Cv5+dYuV3+a3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249037; c=relaxed/simple;
	bh=V3fVADudkUgfW9W8kxlseng+KfGlx0PhN4tl8YNByfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hn9t6rXtLjGr59CL+YR/R8wZBMfcyD1U8/lrLp+5Saw4u6p9IV+FZjUxi6Yhp+MLXqkA0Bf9DcOJ6J8udZetinsLT/pNHDOUah7wm0OSs8QVMwsxy0a4ZyU00NcJecb7lOvzKDunlcFmKWRuY+l4oyXyQ/xGSYVAiiVtZu/GpgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGkxCuQ8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGkxCuQ8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso5786885e9.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781249034; x=1781853834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jR431f9K+bXO1tvKG0cOPvpIj8IvID0B5a8VmWlfHKs=;
        b=DGkxCuQ8sygpwUm9Yv77SUfSuM4OYI1kxlVNGpDC4MFcyFDyfOBaBa8AgrgFueQM25
         Lqhz0pDC29t+UgxlSQO4CDBRdfnFulEY0x3oR+9LUD/6iY5m1F6kawhDSSaZyrHRLkAH
         gV3ibH9fMovK0ljUuH1ty9Ls904LMMz2yziwwqUvSUiSitunYmTCF/o4cboR5fdcA4C0
         04f8eML7RYY3mHVS9ImJJc7qhFZdf94kNf5VQa+6vjnMoWiANMpLn4Hf8VNRhR5FITSg
         yf299NxGQRAri6VM7vmotLsNT3HPCa6lqKmsbIsMFJGD4wDGH2Dk5u2IuiBOt1a2Hpxl
         K32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249034; x=1781853834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jR431f9K+bXO1tvKG0cOPvpIj8IvID0B5a8VmWlfHKs=;
        b=XNbuDUBIXgf/t8UsX1bR3OKOeCt+n1Lp0UzARPAWDm8YJs7yZI82muEet4U/fhB3+y
         U6ABW9Tf2AkYA7VoSv/dcKXAz9s349PeZM18lheXb1vT18BGmhTuXOy4hdHqp21qV40o
         XGxgj/x3mhD8M1vaRwztHGh84Lz8xJK4Z2lcUhnz8hvRj3jVc2X0vA3VFki8vii62P8l
         dFpz3Wj+mNuawA5ya3W7lgzk7JhctRvFwF/2+uiaDKvNJQZ5EBaiw8NbaL6gLxcLzdWc
         vJZmYvv0vqPB6RxkBZGfKxGWkTA2IwCY6AIDD8DJm663gSkAP6+/UUs5cvhGFDM6mD24
         kICA==
X-Forwarded-Encrypted: i=1; AFNElJ+SGQ2w8CJ/DogaC5M8rmjDCtuNKzhpvhlJDq0Hh2//uOgfl2TyivglFSibinwXfob8xTW1ysuL5GC4@vger.kernel.org
X-Gm-Message-State: AOJu0YwlXz38VUDZisYNmqgilkZaeefm1HUZrOLHhIw7chSxPF3hCz1T
	23f+nMxyX086ApAXJyUpAhwJ3cKEmB8n9Hl+5TPrJPugLnq1Ygbw/Qfl
X-Gm-Gg: Acq92OHtrgLv2OKFnp/XERK3JkYr8fUs2fWWWwR0v18Y7ohHbGQrXZDjJdBhiQPsY/X
	2gaLLTg0plwyZPAEU/eJ0LTGvwMMqy5KD6EEHrRjW4x0KlLZ+s5kul+4CcccWNOlnfIsu/EkHKv
	vguSBPfV+giILmbgwey5XQvaRr6PWAwkKlLUfrL78ddT5/FU66j1VrA7Wbdd8+s1qmDe2EqsGuP
	UXnuAOUfja2ngCBStUBEVF/KduDfn/+i0I7sMrpH03PVZwsbDPnx7WN/PhqM/QuincwDCq3Iv0X
	yC8aFTN55q0GdDAqRoTZxVAiP4dBhftWSj1KnUGcOtTxi2gxFwJgSHKBpq7QU+IEy+fbVNimwa8
	y4SQH9LYI+2AznYohPGHlOBviUJEJfCwYkXMdJbt+5AEPzHkE6BW3gG+Ul2qLYel/ajjqBLrOyh
	M+0hLXePibVIZr9yiAx8BCbL024CqxMH27SIE6oTbsH7wQvMZqEg==
X-Received: by 2002:a05:600c:5292:b0:490:b4e5:ce7e with SMTP id 5b1f17b1804b1-490ec4fe3bfmr19052895e9.25.1781249034415;
        Fri, 12 Jun 2026 00:23:54 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea963cf8sm28715245e9.2.2026.06.12.00.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:23:54 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] Input: cap11xx - refactor code for better CAP1114 support.
Date: Fri, 12 Jun 2026 15:22:13 +0800
Message-ID: <20260612072237.1177304-8-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612072237.1177304-1-jerrysteve1101@gmail.com>
References: <20260612072237.1177304-1-jerrysteve1101@gmail.com>
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
index 75746a8a2233..d45bb231d7a1 100644
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
+				   GENMASK(num_leds - 1, 0), 0);
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
 
@@ -554,41 +564,64 @@ static int cap11xx_i2c_probe(struct i2c_client *i2c_client)
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

