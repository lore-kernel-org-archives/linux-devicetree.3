Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BB13DB630
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327174; cv=none; b=kTiOAi0SZ8DX4x2vPChNU5insgrudwbINsF3XNy5z8DCulsB6jDZnGfSdQ6jyajna9AyGNosrx4hi7qceQMiOKahGlMOCDeWTJYTzAWzEKlWBPuOLLM2eymMd67TyRMXzEz/suLk6Y5QJXHmNUl+O8UOS6fWem88OwZks/ZR5GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327174; c=relaxed/simple;
	bh=RZTQ2H/zzNTFrVxP5f5192LTONxSh/ltoz3RRhQzsG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RX8KIpbrZm0uffqR5e8V0KMXS/ttIBuwKhOVXvbP8jsVxOHPsSQ8KpIQd/LyZOmkc8EJZm9JnhB6hQxV69V03lKJ70SMIZb5Eh/Sdkrws4fBbP1loBhwstHvPi03Exka0SCr88jejjiUc9lePt959uIFZqa1VcQNMliL48vBQQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1/4O/gP; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1/4O/gP"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so1806491f8f.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 08:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327154; x=1780931954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fl3qFf3690+fE50JY3SQOXjzJEQ1bfcjE1YgTovPA6E=;
        b=h1/4O/gPfRv/HHJqc/lQyR287miEaJngBhbvey0jCYwGsUUUF05RtFdcwvDFn+z6Zj
         6FWGRME/fTf4SFB3c3DR7hQBjG3CiAiVbPMDh/SRyM3GykIxJUGB/MbJMTzn5btjcazo
         e8y+ByQORZZP5U0QfLffflTrIv5drS6KYIWtDZYBOTAwSbgS/jvjsM1G0L8Se3EqCbk7
         Gbv41GbC1+SFKHFWKK0E5S7yOdCrhGgPP5+6s1nXkjy8yuEvORbscLTFDhd+dVKFCWhw
         yinQbg/1FXZte3lPlRoKDbBDCJ8BE8tIbe46fofSQ6mbERohk9e/zQqSSZIvUmy+ClK3
         JPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327154; x=1780931954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fl3qFf3690+fE50JY3SQOXjzJEQ1bfcjE1YgTovPA6E=;
        b=k6xthoe7G/mqmE5UrHSmfAV8Yk/8pZ/B4Xfc+R3AkmJ/1SkAoZ/qNjeliipVDPbUJf
         Z2Pu3SqCaNS74H9T9Szj4xKEhUe6FHRrQFBWbsctO8cQBMTog/8fbYBMWsSSK6aJNuQo
         AjhgFP/c3aq9pmAm/UEr6eas4VG+x1sbgiX+mtl4YV017ShihYt+fcszVSYuFvOzlwCv
         MOuz/uEPSm4SWszZbSbTJqRRAOo7EI7mkBc5HmVz7/70ZbemjOS1YNnDRIZInyMfrwqR
         3LXc8MySCFuY8uMWrayzZ6cYYU1fw3Vm8YjlycWHnIiXrlpJjQeRx4DTuSm2SGdBMrw0
         1cXg==
X-Forwarded-Encrypted: i=1; AFNElJ8EBzCTKdXJm4pFGzkfSy3qorC98Bj0blBG63ffkwhThqGKEp2kWWkiKIvPutT0UWD5Jwb/CCrq72JZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfg0zR0i54h4AQfsx78a2VVkrNZ6Uz7HGmGN2mDsvfajTjG5jN
	B44JWPLGdQGLSfZ59nFY1zSes1p1y/lzBiv2dzSOXdJAGOPU81pbbO3B
X-Gm-Gg: Acq92OG7XeLrtaRaZHwNDINRDNE9YPCjRXCD93F4KQCmXVKVT1xGgYmQRLR0aLjL+v+
	0VWPAvCcZhnuh5dAxyztHkseFtbOJmhDxfPFN+dCUwmNHx2bTUDEnkgEQeIWi77D1N42hH024b8
	FsxkhS+TWVeJ0x1ouFf+yF6raSouG2Nq/lbk4Jmn5e8BB6MokkJ6xcK9PDmk0u1LbB06gYFEC5h
	O6CJO1pXBu5ax+WJhsTOd1uBA+cJsXUfiAQvV0GzxVNEj/FZU5+zg/lzSAbE9gJsOprI2fxkn6z
	A8IqY0rNhSJO5XbO9IOQ6d03klZcSXqbBcTka2F7SHiUTjbkog9C3pF0buqcvkOiG0MmfKr5mj7
	fAb8BiHgMxud6TruaTCMuTnvvZO10EUftqyeYbi1svCGVzaiVrC8VjagOlr1bpa8JeD4SuEUaPo
	H/7Sbyp4csl/OnDbpcbJIhmyg=
X-Received: by 2002:a05:6000:1376:b0:43d:7868:21f0 with SMTP id ffacd0b85a97d-45ef6afc537mr16294468f8f.9.1780327154150;
        Mon, 01 Jun 2026 08:19:14 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm25753103f8f.18.2026.06.01.08.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:19:13 -0700 (PDT)
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
Subject: [PATCH v3 11/11] video: leds: backlight: lm3533: Support getting LED sources from DT
Date: Mon,  1 Jun 2026 18:18:31 +0300
Message-ID: <20260601151831.76350-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260601151831.76350-1-clamor95@gmail.com>
References: <20260601151831.76350-1-clamor95@gmail.com>
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
 drivers/leds/leds-lm3533.c          | 55 ++++++++++++++++++++++++++++-
 drivers/video/backlight/lm3533_bl.c | 40 ++++++++++++++++++++-
 2 files changed, 93 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index f2502daf450d..6db1c1fd2e20 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -7,6 +7,7 @@
  * Author: Johan Hovold <jhovold@gmail.com>
  */
 
+#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/leds.h>
 #include <linux/mfd/core.h>
@@ -27,6 +28,12 @@
 #define LM3533_ALS_CHANNEL_LV_MIN	1
 #define LM3533_ALS_CHANNEL_LV_MAX	2
 
+#define LM3533_REG_OUTPUT_CONF1			0x10
+#define   OUTPUT_CONF1_MASK			GENMASK(7, 2)
+#define   OUTPUT_CONF1_SHIFT			2
+#define LM3533_REG_OUTPUT_CONF2			0x11
+#define   OUTPUT_CONF2_MASK			GENMASK(3, 0)
+#define   OUTPUT_CONF2_SHIFT			6
 #define LM3533_REG_CTRLBANK_BCONF_BASE		0x1b
 #define LM3533_REG_PATTERN_ENABLE		0x28
 #define LM3533_REG_PATTERN_LOW_TIME_BASE	0x71
@@ -54,6 +61,9 @@ struct lm3533_led {
 
 	u32 max_current;
 	u32 pwm;
+
+	int num_leds;
+	u32 leds[LM3533_LVCTRLBANK_MAX];
 };
 
 
@@ -641,7 +651,33 @@ static const struct attribute_group *lm3533_led_attribute_groups[] = {
 
 static int lm3533_led_setup(struct lm3533_led *led)
 {
-	int ret;
+	u32 output_cfg_shift = 0;
+	u32 output_cfg_val = 0;
+	int ret, i;
+
+	if (led->num_leds) {
+		for (i = 0; i < led->num_leds; i++) {
+			if (led->leds[i] >= LM3533_LVCTRLBANK_MAX)
+				continue;
+
+			output_cfg_shift = led->leds[i] * 2;
+			output_cfg_val |= led->id << output_cfg_shift;
+		}
+
+		/* LVLED1, LVLED2 and LVLED3 */
+		ret = regmap_update_bits(led->lm3533->regmap, LM3533_REG_OUTPUT_CONF1,
+					 OUTPUT_CONF1_MASK,
+					 output_cfg_val << OUTPUT_CONF1_SHIFT);
+		if (ret)
+			return ret;
+
+		/* LVLED4 and LVLED5 */
+		ret = regmap_update_bits(led->lm3533->regmap, LM3533_REG_OUTPUT_CONF2,
+					 OUTPUT_CONF2_MASK,
+					 output_cfg_val >> OUTPUT_CONF2_SHIFT);
+		if (ret)
+			return ret;
+	}
 
 	ret = lm3533_ctrlbank_set_max_current(&led->cb, led->max_current);
 	if (ret)
@@ -716,6 +752,23 @@ static int lm3533_led_probe(struct platform_device *pdev)
 	led->pwm = 0;
 	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->pwm);
 
+	led->num_leds = device_property_count_u32(&pdev->dev, "led-sources");
+
+	/*
+	 * If led-sources property is not set then either this Control Bank uses
+	 * its default LVLED or is not linked to any LVLED at all.
+	 */
+	if (led->num_leds > 0 && led->num_leds <= LM3533_LVCTRLBANK_MAX) {
+		ret = device_property_read_u32_array(&pdev->dev, "led-sources",
+						     led->leds, led->num_leds);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to get led-sources\n");
+			goto err_deregister;
+		}
+	} else {
+		led->num_leds = 0;
+	}
+
 	ret = lm3533_led_setup(led);
 	if (ret)
 		goto err_deregister;
diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 945625c54fc4..2119433bae45 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -7,6 +7,7 @@
  * Author: Johan Hovold <jhovold@gmail.com>
  */
 
+#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/mod_devicetable.h>
@@ -22,6 +23,8 @@
 #define LM3533_HVCTRLBANK_COUNT		2
 #define LM3533_BL_MAX_BRIGHTNESS	255
 
+#define LM3533_REG_OUTPUT_CONF1		0x10
+#define   OUTPUT_CONF1_MASK		GENMASK(1, 0)
 #define LM3533_REG_CTRLBANK_AB_BCONF	0x1a
 #define   CTRLBANK_AB_BCONF_MODE(n)	BIT(2 * (n) + 1)
 
@@ -35,6 +38,9 @@ struct lm3533_bl {
 	u32 max_current;
 	u32 pwm;
 	bool linear;
+
+	int num_leds;
+	u32 led_strings[LM3533_HVCTRLBANK_COUNT];
 };
 
 
@@ -253,7 +259,8 @@ static struct attribute_group lm3533_bl_attribute_group = {
 static int lm3533_bl_setup(struct lm3533_bl *bl)
 {
 	int id = lm3533_bl_get_ctrlbank_id(bl);
-	int ret;
+	u32 output_cfg_val = 0;
+	int ret, i;
 
 	ret = regmap_update_bits(bl->lm3533->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
 				 CTRLBANK_AB_BCONF_MODE(id),
@@ -261,6 +268,20 @@ static int lm3533_bl_setup(struct lm3533_bl *bl)
 	if (ret)
 		return ret;
 
+	if (bl->num_leds) {
+		for (i = 0; i < bl->num_leds; i++) {
+			if (bl->led_strings[i] >= LM3533_HVCTRLBANK_COUNT)
+				continue;
+
+			output_cfg_val |= id << bl->led_strings[i];
+		}
+
+		ret = regmap_update_bits(bl->lm3533->regmap, LM3533_REG_OUTPUT_CONF1,
+					 OUTPUT_CONF1_MASK, output_cfg_val);
+		if (ret)
+			return ret;
+	}
+
 	ret = lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current);
 	if (ret)
 		return ret;
@@ -336,6 +357,23 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 	bl->pwm = 0;
 	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &bl->pwm);
 
+	bl->num_leds = device_property_count_u32(&pdev->dev, "led-sources");
+
+	/*
+	 * If led-sources property is not set then either this Control Bank uses
+	 * its default HVLED or is not linked to any HVLED at all.
+	 */
+	if (bl->num_leds > 0 && bl->num_leds <= LM3533_HVCTRLBANK_COUNT) {
+		ret = device_property_read_u32_array(&pdev->dev, "led-sources",
+						     bl->led_strings,
+						     bl->num_leds);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "failed to get led-sources\n");
+	} else {
+		bl->num_leds = 0;
+	}
+
 	ret = lm3533_bl_setup(bl);
 	if (ret)
 		return ret;
-- 
2.51.0

