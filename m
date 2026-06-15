Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAE83FD96B
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533332; cv=none; b=Lpk8f0cRgbXeIvOBGdJa3YZqO7ZsumhzNr06Xs/dh6H+PTNXGJ8RhJke5FrbJ1zEFnuOn3ZEbDDxi4+7Mzt923Y2x8e7YVUoazWfUYGq/b7ruJcpVrkwoe0H8Zccbw925fTOWfcgQAf7yTzHJVXYQlL92cr7Eozaf98Ww+4mrR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533332; c=relaxed/simple;
	bh=k4dHw+/Po3x9wsSDVnPMlPIamhpqhjNDNpXbagJiHMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bxbyl2gpg4zWsfR3Iu+fz604OCHuvTR86bHFTiS3mmzMi670kHiXUtDkDSAjdVbOUZlMGD7VZYgZW+sWM2kJAjyCvHvAcqQkUl6T4lQCoRcznQTMySPXTMqe2BEDXDxHeDPTSTFsXPEp/C3UeiL0kAjUTPy9+BjALKpjcExcFhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMKN1nWD; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMKN1nWD"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36b900f350fso3078232a91.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533327; x=1782138127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxVnZWCxxOews4BbfFbVhqTO+lFrEwCqaGSZwp09khE=;
        b=RMKN1nWDAQMzeH7UBwMDzNjfhvfBtH7HVjgtZgmHVKWi/iIzxxqGIx2gi98+FjbUWA
         ClPM4fhprspf79qKG8J6q1IiM9iFYhZBh/s3M0Uwy1a1IvwL5dvIjjDL0K637Gl+q8S1
         KUKvInkPCnIIli1O3vvNXZ4f9KDk0I8JdJnpHdQzD1oZte7/B23i9aA+r32mhEmOyLeS
         rX2b1piVBaM+fi7t+6WMQ1vHiV/fHgZBPa4W+7BGQGPSq62CUGashcsSOftTPlwObj4N
         C+U5gavVyCvjHFgPLOOWCGdJvx0EFe6gu9gbQP/9pNesM8/Z4ErW7LsqeCGkJXo9bLbJ
         hxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533327; x=1782138127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hxVnZWCxxOews4BbfFbVhqTO+lFrEwCqaGSZwp09khE=;
        b=ZUVCxmjFRnvx6OKWlGsP4ByAUhjD7/jCXlWyYSM0ZzqWwZSpBNVYCqnJrihmfnxLwf
         4vM4HYC7v0N/GUnQDyj08+f7Lov3wGb/5KAz8H2caK6sCVct+J1VcKIEEDLAYuJd5jgb
         T7dlBe4EL7MqMc6L8hnfG7EcAlp8HGeqYYWrtUHHzqTGeL5crVxTlu98reGiictuVsmx
         4XUKIjJEyIO5UfZbF2V0cTpi4BbGRj/ZnUBvm8yfXQFmMIPaW4uiW8adBNE/qR1rqNKG
         JikNc9pv+//KYkyclslgOWs9oAT5QFdOq6qqW7JLei2AHoqBXr5jMruiLf+ms/6YDu0+
         xgDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8uvoBBZWBTwPhN7RLyl6hfw1eOFnX1zY0We8IXxebphDnCWLo6oIB7BpLuEYhjoIn0QfSSDi+RHMsX@vger.kernel.org
X-Gm-Message-State: AOJu0YxgpF/RQt5Ee+ZHt619xJkXx/VgYsiRHG9ZhsSkyNEKfIrJ9KtM
	3ahiq3vc8MMoT58ULJATMUMbeoEnXzQb7cQXCdA3DJ6ul+cr4TS27Iwi
X-Gm-Gg: Acq92OHuScHXrsRTJSIqyWCjvkn1tb4JYAg8S5ZRjQ8dvI8gNVLPlnWGyQh2ixX484K
	WPexk2fEo8fln4wh4Vr3XyfzNtKiEjS+oCQW/bxbHxV5u2uwI1Gg88hSRbr3sWRXKJrgt/r3q97
	V6P41Truq6ROZfk4O09wS7JhJarLI+yhQOvtBpe8kkK2QHGPKckwAXEr7uQ5aqhN8Lt3jXSbsbS
	cYyFV4NdskZAgdy+bTssfkshrSMPCE4qqpB8L54M0lgTa52xI+d9El2IxLqQ7JdKez8BZnDqncz
	derTvK7/qxeqvTSoHAcCJL0a4gL/j9BK4ibQUDQ5Y1eHLnxDQXU5C6/iFXcl+0pStzEq3k4KhdD
	gE9TmLWXuvCCcFRxCW5UZHXimuNLcT1aSlRbiYGpSysNMyAp+ypSUvhamekcA0M0/g4QlKMGyTi
	rWjBupzOanP6XQjF5NZaN5
X-Received: by 2002:a17:90b:1d44:b0:36d:b9c5:e8f6 with SMTP id 98e67ed59e1d1-37c2bd49b00mr11352930a91.19.1781533327200;
        Mon, 15 Jun 2026 07:22:07 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm7178233a91.2.2026.06.15.07.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:22:06 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/10] Input: cap11xx - add support for CAP1114
Date: Mon, 15 Jun 2026 22:20:36 +0800
Message-ID: <20260615142103.352163-11-jerrysteve1101@gmail.com>
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

CAP1114 is a 14-channel capacitive touch sensor with 11 LED outputs
and hardware reset support.

The CAP1114 uses two control registers for LED output management and
requires two button status registers for touch input state reporting.

By default, channels CS8~CS14 operate as a single grouped block.
Set the corresponding register enable bit to enable these channels as
independent touch inputs. Note these channels share the input threshold
of the eighth entry, causing num_sensor_thresholds to differ from
num_channels.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/input/keyboard/cap11xx.c | 73 ++++++++++++++++++++++++++++++--
 1 file changed, 69 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/cap11xx.c b/drivers/input/keyboard/cap11xx.c
index c48ee8520a27..187a212dfa8f 100644
--- a/drivers/input/keyboard/cap11xx.c
+++ b/drivers/input/keyboard/cap11xx.c
@@ -18,6 +18,12 @@
 #include <linux/gpio/consumer.h>
 #include <linux/bitfield.h>
 
+#define CAP1114_REG_BUTTON_STATUS1	0x03
+#define CAP1114_REG_BUTTON_STATUS2	0x04
+#define CAP1114_REG_CONFIG2			0x40
+#define CAP1114_REG_CONFIG2_VOL_UP_DOWN	BIT(1)
+#define CAP1114_REG_LED_OUTPUT_CONTROL1	0x73
+
 #define CAP11XX_REG_MAIN_CONTROL	0x00
 #define CAP11XX_REG_MAIN_CONTROL_GAIN_SHIFT	(6)
 #define CAP11XX_REG_MAIN_CONTROL_GAIN_MASK	(0xc0)
@@ -82,6 +88,7 @@ struct cap11xx_hw_model {
 	unsigned int num_leds;
 	unsigned int num_sensor_thresholds;
 	bool has_gain;
+	bool has_grouped_sensors;
 	bool has_irq_config;
 	bool has_repeat_en;
 	bool has_sensitivity_control;
@@ -98,6 +105,8 @@ static const struct reg_default cap11xx_reg_defaults[] = {
 	{ CAP11XX_REG_SENSOR_THRESH(3),		0x40 },
 	{ CAP11XX_REG_SENSOR_THRESH(4),		0x40 },
 	{ CAP11XX_REG_SENSOR_THRESH(5),		0x40 },
+	{ CAP11XX_REG_SENSOR_THRESH(6),		0x40 },
+	{ CAP11XX_REG_SENSOR_THRESH(7),		0x40 },
 	{ CAP11XX_REG_CONFIG2,			0x40 },
 };
 
@@ -106,6 +115,12 @@ static bool cap11xx_volatile_reg(struct device *dev, unsigned int reg)
 	switch (reg) {
 	case CAP11XX_REG_MAIN_CONTROL:
 	case CAP11XX_REG_SENSOR_INPUT:
+	/*
+	 * CAP1114_REG_BUTTON_STATUS1 (CAP11XX_REG_SENSOR_INPUT) and
+	 * CAP1114_REG_BUTTON_STATUS2 is volatile for the CAP1114,
+	 * which supports more than 8 touch channels.
+	 */
+	case CAP1114_REG_BUTTON_STATUS2:
 		return true;
 	}
 
@@ -285,6 +300,17 @@ static int cap11xx_init_keys(struct cap11xx_priv *priv)
 	of_property_read_u32_array(node, "linux,keycodes",
 				   priv->keycodes, priv->model->num_channels);
 
+	/*
+	 * CAP1114 needs dedicated configuration to split
+	 * grouped sensors into independent inputs.
+	 */
+	if (priv->model->has_grouped_sensors) {
+		error = regmap_set_bits(priv->regmap, CAP1114_REG_CONFIG2,
+					CAP1114_REG_CONFIG2_VOL_UP_DOWN);
+		if (error)
+			return error;
+	}
+
 	if (priv->model->has_repeat_en) {
 		/* Disable autorepeat. The Linux input system has its own handling. */
 		error = regmap_write(priv->regmap, CAP11XX_REG_REPEAT_RATE, 0);
@@ -313,6 +339,21 @@ static irqreturn_t cap11xx_thread_func(int irq_num, void *data)
 	if (ret < 0)
 		goto out;
 
+	if (priv->model->num_channels > 8) {
+		unsigned int status2;
+
+		ret = regmap_read(priv->regmap, priv->model->sensor_input_reg_base + 1, &status2);
+		if (ret < 0)
+			goto out;
+
+		/*
+		 * CAP1114 STATUS1 register only contains data for the first 6 channels.
+		 * the remaining channels is stored in STATUS2.
+		 */
+		status &= GENMASK(5, 0);
+		status |= FIELD_PREP(GENMASK(13, 6), status2);
+	}
+
 	for (i = 0; i < priv->idev->keycodemax; i++)
 		input_report_key(priv->idev, priv->keycodes[i],
 				 status & (1 << i));
@@ -362,10 +403,16 @@ static int cap11xx_led_set(struct led_classdev *cdev,
 	 * limitation. Brightness levels per LED are either
 	 * 0 (OFF) and 1 (ON).
 	 */
-	return regmap_update_bits(priv->regmap,
-				  priv->model->led_output_control_reg_base,
-				  BIT(led->reg),
-				  value ? BIT(led->reg) : 0);
+	if (led->reg >= 8)
+		return regmap_update_bits(priv->regmap,
+					  priv->model->led_output_control_reg_base + 1,
+					  BIT(led->reg - 8),
+					  value ? BIT(led->reg - 8) : 0);
+	else
+		return regmap_update_bits(priv->regmap,
+					  priv->model->led_output_control_reg_base,
+					  BIT(led->reg),
+					  value ? BIT(led->reg) : 0);
 }
 
 static int cap11xx_init_leds(struct device *dev,
@@ -396,6 +443,14 @@ static int cap11xx_init_leds(struct device *dev,
 	if (error)
 		return error;
 
+	if (num_leds > 8) {
+		error = regmap_update_bits(priv->regmap,
+					   priv->model->led_output_control_reg_base + 1,
+					   GENMASK(num_leds - 8 - 1, 0), 0);
+		if (error)
+			return error;
+	}
+
 	duty_val = FIELD_PREP(CAP11XX_REG_LED_DUTY_MAX_MASK,
 			      CAP11XX_REG_LED_DUTY_MAX_VALUE);
 
@@ -573,6 +628,14 @@ static const struct cap11xx_hw_model cap1106_model = {
 	.has_repeat_en = true,
 };
 
+static const struct cap11xx_hw_model cap1114_model = {
+	.product_id = 0x3a,
+	.num_channels = 14, .num_leds = 11, .num_sensor_thresholds = 8,
+	.led_output_control_reg_base = CAP1114_REG_LED_OUTPUT_CONTROL1,
+	.sensor_input_reg_base = CAP1114_REG_BUTTON_STATUS1,
+	.has_grouped_sensors = true,
+};
+
 static const struct cap11xx_hw_model cap1126_model = {
 	.product_id = 0x53,
 	.num_channels = 6, .num_leds = 2, .num_sensor_thresholds = 6,
@@ -629,6 +692,7 @@ static const struct cap11xx_hw_model cap1298_model = {
 
 static const struct of_device_id cap11xx_dt_ids[] = {
 	{ .compatible = "microchip,cap1106", .data = &cap1106_model },
+	{ .compatible = "microchip,cap1114", .data = &cap1114_model },
 	{ .compatible = "microchip,cap1126", .data = &cap1126_model },
 	{ .compatible = "microchip,cap1188", .data = &cap1188_model },
 	{ .compatible = "microchip,cap1203", .data = &cap1203_model },
@@ -641,6 +705,7 @@ MODULE_DEVICE_TABLE(of, cap11xx_dt_ids);
 
 static const struct i2c_device_id cap11xx_i2c_ids[] = {
 	{ .name = "cap1106", .driver_data = (kernel_ulong_t)&cap1106_model },
+	{ .name = "cap1114", .driver_data = (kernel_ulong_t)&cap1114_model },
 	{ .name = "cap1126", .driver_data = (kernel_ulong_t)&cap1126_model },
 	{ .name = "cap1188", .driver_data = (kernel_ulong_t)&cap1188_model },
 	{ .name = "cap1203", .driver_data = (kernel_ulong_t)&cap1203_model },
-- 
2.54.0

