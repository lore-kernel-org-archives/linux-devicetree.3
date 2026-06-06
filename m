Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71373313E01
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 04:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780721932; cv=none; b=U+8mVEvftg2/bzcaeBAycDz+hdJ/JvO+RYWbxkEbhg27TExA0xQj6ycGGW0OolyNZkeIENuReDQmZMBqN37mKh9087ODK9pvWDdekZOa4M1ciDy2HvQExwsq2fXUSVYHRYvZmSCzvpEJnyCBr+q6bjNDpNMUrr4S/TwwfuZwiLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780721932; c=relaxed/simple;
	bh=J/hbghdGiskCXq2LMuJR1POlS86t7rcaRIUrzBWVHgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=beDeJDJfX9yOiug43/4FZf5CTipzfPo7Qt86rgObAGCUDfORmLTtTUKoE6OxQA3+gYTGzMW3rQ+50JHitbkzlVeXEKRvnCe0Zfs0E4D/b6eIKrnbKxsw6n2Pfn6bffZNwDzKyA0CmRxNce+FuYArstsoA65CdaEfNHHqZ5SiyGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YduCpeko; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YduCpeko"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bf1cdcfd6deso294150366b.3
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 21:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780721929; x=1781326729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THaL1QVPpQgP2z5ftX+u3ovu7VRE23Z1E4qNugQA6t8=;
        b=YduCpekonrnNLVeTKOipMxkHqK9ZRrMCmfcIqHtSKi+Gb1r2p2R2pSajBPHv0wUH94
         vG3ZDzYW22kbtqWDbqgc7S4eF3chQbsehw6l3nhGjFhLf3icNZD79XVsr140tkQ6a5Xk
         /69X8ba4crVwVD7aM8l6Gzcm/je+PzYn8r2QxKaTBk972bfN1727q+rCnpMJuDb1srbk
         5MILrAIn1MU2boYxE+MDyz3UQnEtVOY82K9VEMccUw35dMoScaHy0KKjS4RieUPwDPRs
         D42KzQNWq73p+4oyoLevuEuRBz5zQEoA6CJSoH8g6fucj4nCK3L1AC/IDNBxlVJOZ2BX
         v7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780721929; x=1781326729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=THaL1QVPpQgP2z5ftX+u3ovu7VRE23Z1E4qNugQA6t8=;
        b=Bq4YSwPnUU13TFbBRotlpVnfQbhnEKZNU7CauRYI0e/Uhlm8O7hPuRVFMB1WIrrPLt
         WGvV2ek5ONpFRTotLc0QVIix8a7XZvGlJvXaR3jpnuW5lY62d2315JL3nF+xrOdOXLm3
         i3cWw03kOuM31CtR9KvJLHCxmrWqNYXFdmd6gZ8p/WJRxOJQOHGcN7HX/KGoU6BJndi4
         imuV25f+NfOvPML7w7aNcR3V/wT+og/RPToh/SrkvvBX5CefNRDu75DENgA2MhX4M0LJ
         ZwOHAA0BcnM0WaakQxNiMHfGGLPj0oxULVvM4mgGtsRJBdhzwEka2RnoMPBqniAWMJah
         ya2w==
X-Forwarded-Encrypted: i=1; AFNElJ/l0QwyaBWtE38jRa/Ls4PGKyTH/vyKHZLNsCYSYJ+7z+M1lEcytjzbI5v3NDma1+T4AUHJNdNuZssp@vger.kernel.org
X-Gm-Message-State: AOJu0YyNl2FoGXs3C/HXDqF+vjg2fbPyR73TfoLaplyFuCdHhzziK4O9
	WbzVbIn0uX2OClQMxnqMs02GX975TCe7cT4YVUnjtVXJEwQm7upNtcV/
X-Gm-Gg: Acq92OGUxieZqdHx+FHAyeTJf2cThwSIH2YCtQA1SxiWh3nsNAhKZvvtUkFr2K2QKYA
	z8tsEHevHUIOjRQaLlLVIjB6YAfdGctjtIk/lBHM4DK0tk+x9Do7i6QlAIRfs8E0XCGxRlJtWVy
	TRUJYeLDa8EggXl0GKr2rEhUewC0q6YvwW24NiIHWSEEyA6rsaQEBIkC+cY84wbhtYRrVoLC1c1
	9ViFgoD73hw/DKROafEY5WSrW5jzokDTOPV314jxVMig2LcPKrAYONkVPZcJl9VAJ3PZd5imZcF
	y4+F2l3xr4XQ7bJY0rxo+xh3FAUxAJ64zxHAtTMsWaAqHMByn6XC4ypuiDAZGzk7lVe4WskGuXU
	TXsDUkihbo60nevbaE7BCK8Q0eE1VWth/h4p+U9tI53BbMUTJHCSXg9yVzckeaNx12ho8feo60N
	2u0dNKOdIrtZQPF3uWXPaq1bQwSMEqvAoVJg==
X-Received: by 2002:a17:907:608b:b0:bcb:66df:819a with SMTP id a640c23a62f3a-bf3741e8062mr385758166b.40.1780721928778;
        Fri, 05 Jun 2026 21:58:48 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm570597166b.32.2026.06.05.21.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:58:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v4 14/14] video: leds: backlight: lm3533: Support getting LED sources from DT
Date: Sat,  6 Jun 2026 07:57:38 +0300
Message-ID: <20260606045738.21050-15-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606045738.21050-1-clamor95@gmail.com>
References: <20260606045738.21050-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Control Bank to HVLED/LVLED muxing support based on the led-sources
defined in the device tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/leds/leds-lm3533.c          | 58 ++++++++++++++++++++++++++++-
 drivers/video/backlight/lm3533_bl.c | 43 ++++++++++++++++++++-
 2 files changed, 99 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index a661aedcdc60..fe3e01b265e1 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -27,6 +27,11 @@
 #define LM3533_ALS_CHANNEL_LV_MIN	1
 #define LM3533_ALS_CHANNEL_LV_MAX	2
 
+#define LM3533_REG_OUTPUT_CONF1			0x10
+#define   OUTPUT_CONF1_SHIFT			2
+#define   OUTPUT_LVLED_MASK			0x3
+#define LM3533_REG_OUTPUT_CONF2			0x11
+#define   OUTPUT_CONF2_SHIFT			6
 #define LM3533_REG_CTRLBANK_BCONF_BASE		0x1b
 #define LM3533_REG_PATTERN_ENABLE		0x28
 #define LM3533_REG_PATTERN_LOW_TIME_BASE	0x71
@@ -55,6 +60,9 @@ struct lm3533_led {
 	u32 max_current;
 	u32 pwm;
 
+	int num_leds;
+	u32 leds[LM3533_LVCTRLBANK_MAX];
+
 	bool have_als;
 };
 
@@ -623,7 +631,35 @@ static const struct attribute_group *lm3533_led_attribute_groups[] = {
 
 static int lm3533_led_setup(struct lm3533_led *led)
 {
-	int ret;
+	u32 output_cfg_shift = 0;
+	u32 output_cfg_val = 0;
+	u32 output_cfg_mask = 0;
+	int ret, i;
+
+	if (led->num_leds) {
+		for (i = 0; i < led->num_leds; i++) {
+			if (led->leds[i] >= LM3533_LVCTRLBANK_MAX)
+				continue;
+
+			output_cfg_shift = led->leds[i] * 2;
+			output_cfg_val |= led->id << output_cfg_shift;
+			output_cfg_mask |= OUTPUT_LVLED_MASK << output_cfg_shift;
+		}
+
+		/* LVLED1, LVLED2 and LVLED3 */
+		ret = regmap_update_bits(led->regmap, LM3533_REG_OUTPUT_CONF1,
+					 output_cfg_mask << OUTPUT_CONF1_SHIFT,
+					 output_cfg_val << OUTPUT_CONF1_SHIFT);
+		if (ret)
+			return ret;
+
+		/* LVLED4 and LVLED5 */
+		ret = regmap_update_bits(led->regmap, LM3533_REG_OUTPUT_CONF2,
+					 output_cfg_mask >> OUTPUT_CONF2_SHIFT,
+					 output_cfg_val >> OUTPUT_CONF2_SHIFT);
+		if (ret)
+			return ret;
+	}
 
 	ret = lm3533_ctrlbank_set_max_current(&led->cb, led->max_current);
 	if (ret)
@@ -700,6 +736,26 @@ static int lm3533_led_probe(struct platform_device *pdev)
 	led->pwm = 0;
 	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->pwm);
 
+	led->num_leds = device_property_count_u32(&pdev->dev, "led-sources");
+	if (led->num_leds > LM3533_LVCTRLBANK_MAX) {
+		dev_err(&pdev->dev, "num of LED sources exceeds max %d: %d\n",
+			LM3533_LVCTRLBANK_MAX, led->num_leds);
+		goto err_deregister;
+	}
+
+	/*
+	 * If led-sources property is not set then either this Control Bank uses
+	 * its default LVLED or is not linked to any LVLED at all.
+	 */
+	if (led->num_leds > 0) {
+		ret = device_property_read_u32_array(&pdev->dev, "led-sources",
+						     led->leds, led->num_leds);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to get led-sources\n");
+			goto err_deregister;
+		}
+	}
+
 	ret = lm3533_led_setup(led);
 	if (ret)
 		goto err_deregister;
diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 2aa4b86042ff..ed358fb3c759 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -7,6 +7,7 @@
  * Author: Johan Hovold <jhovold@gmail.com>
  */
 
+#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/mod_devicetable.h>
@@ -22,6 +23,7 @@
 #define LM3533_HVCTRLBANK_COUNT		2
 #define LM3533_BL_MAX_BRIGHTNESS	255
 
+#define LM3533_REG_OUTPUT_CONF1		0x10
 #define LM3533_REG_CTRLBANK_AB_BCONF	0x1a
 #define   CTRLBANK_AB_BCONF_ALS(n)	BIT(2 * (n))
 #define   CTRLBANK_AB_BCONF_MODE(n)	BIT(2 * (n) + 1)
@@ -36,6 +38,9 @@ struct lm3533_bl {
 	u32 max_current;
 	u32 pwm;
 
+	int num_leds;
+	u32 led_strings[LM3533_HVCTRLBANK_COUNT];
+
 	bool have_als;
 	bool linear;
 };
@@ -232,13 +237,30 @@ static struct attribute_group lm3533_bl_attribute_group = {
 static int lm3533_bl_setup(struct lm3533_bl *bl)
 {
 	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
-	int ret;
+	u32 output_cfg_val = 0;
+	u32 output_cfg_mask = 0;
+	int ret, i;
 
 	ret = regmap_assign_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
 				 CTRLBANK_AB_BCONF_MODE(ctrlbank), bl->linear);
 	if (ret)
 		return ret;
 
+	if (bl->num_leds) {
+		for (i = 0; i < bl->num_leds; i++) {
+			if (bl->led_strings[i] >= LM3533_HVCTRLBANK_COUNT)
+				continue;
+
+			output_cfg_val |= ctrlbank << bl->led_strings[i];
+			output_cfg_mask |= BIT(bl->led_strings[i]);
+		}
+
+		ret = regmap_update_bits(bl->regmap, LM3533_REG_OUTPUT_CONF1,
+					 output_cfg_mask, output_cfg_val);
+		if (ret)
+			return ret;
+	}
+
 	ret = lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current);
 	if (ret)
 		return ret;
@@ -316,6 +338,25 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 
 	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &bl->pwm);
 
+	bl->num_leds = device_property_count_u32(&pdev->dev, "led-sources");
+	if (bl->num_leds > LM3533_HVCTRLBANK_COUNT)
+		return dev_err_probe(&pdev->dev, bl->num_leds,
+				     "num of LED sources exceeds max %d\n",
+				     LM3533_HVCTRLBANK_COUNT);
+
+	/*
+	 * If led-sources property is not set then either this Control Bank uses
+	 * its default HVLED or is not linked to any HVLED at all.
+	 */
+	if (bl->num_leds > 0) {
+		ret = device_property_read_u32_array(&pdev->dev, "led-sources",
+						     bl->led_strings,
+						     bl->num_leds);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "failed to get led-sources\n");
+	}
+
 	ret = lm3533_bl_setup(bl);
 	if (ret)
 		return ret;
-- 
2.53.0

