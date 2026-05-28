Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFC82D94AB
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976320; cv=none; b=kb7A89RD/UInPtL4b+J47fRz6tq7UaQpQlFhjrVAMUtyIvaTo0yKMjm7dOvjFaY2DWGCNEHOMBY3nJsG3QyJ7sEKMDf5C8DBPkjngryF5xKkMr6LbYumTH9ik7jvHaJCOQ5mo1A+4FgnJ/BXuKNKrPkVPn8jk8HAtiaVbRMYFgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976320; c=relaxed/simple;
	bh=n4yCPkvyfwqM7MzsAswDO+ebUjuf2G8Zgx9N9HA2HFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9IYutL+RoxSOwblKm+X8QssA3+QpkOhGqo7RLa2hqFwnBzl72Q5QEemljCgXOwJ2iDmG31Mw2Bcn4xEnjO01gtWMe0wGkHC7orzmB/9oD78avDNQEHfOU2zIfGy2Ruoi+8tLHokhqI7d+LrYVW1DFj8mzZ72lYHL5Rof1YfX2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q4UmiESg; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q4UmiESg"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68acf0a15b3so1501560a12.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779976317; x=1780581117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDQ/tiPuyfzwfBV4n9YbMw4Pd30yVycLBAunY89akC8=;
        b=q4UmiESgp8svPMTZCw8HuaCUQIkERmwTnmGJfziX6gsQq1xa0xo36IS1q87MS/Qn6a
         z7vkYuuvp1ti+RgxqZaR7vYWQ3FYtzgOp2RXlHdPfSgH6cwxcAdL+RUhpMuszmBjJyRU
         mAHe/ShSSkDmkXUHyLVm2Uz7PIa6GxxepQFwDC/q+Z+AJt7Rp5kjmia1/sMh/gssrL/v
         QpBI2A/nIHSRbUanpWLlVtmt1cOXkvlIfF7GOr472KI2ZOVoWFuZ3DsPf2+/0hazT2PL
         MeX//YMqVOxtmwHyIvkr91Rtv2wrK9tPQm8U9FIGXPo7gVZOZ2LrpehMMoWfkcH0Gz0Z
         izwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976317; x=1780581117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dDQ/tiPuyfzwfBV4n9YbMw4Pd30yVycLBAunY89akC8=;
        b=LxSFU4YkWhY0ZDR9TNL0nLg35EubBobB3Hm9KYUUi6CsVjsd8VRKS+nDFFhrdIFbiY
         +3eUvHmmX5v6jGmAjQAYH6yHoUwFRcEFkSPCAzLeKh++HUwloDz3GbwDT/cSHo/JJad2
         j7tJiiAtpKgFohMiO7HPwJOihGnV/BTeTqTVnAN0PZ0WrMAzkbOm4hh5ADXXasycla/g
         cieFFcKDxwYZLxy9wttkHdkqzqM/dkIZq5EEFjviaGFSLJmEZTbirOPYCpLAsgQ/4Dsw
         gqfK1ksmEwgJnV2UkiJgiI6fE1DNCyNPVaBAW0DJ3LrIMllOOtwyZyZCRW6YP1liCLaJ
         RZFA==
X-Forwarded-Encrypted: i=1; AFNElJ+3GUsYQLtm4UEpwoBlHmYxNno5I2RQZw04Za3uIuixxrjdPcqLJDnEFH8nhO00jOGWjpE47f+Vu/sa@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2JgnwCSYNApzbqSrfxC31ZsmXxd2DCxYB2YYIWckIdH3oPftC
	BxUvZhKkaDlJ6gRXXl8XB7yPMPEiwNmAX9XVWVcpLG0Xbjbsu5AKzuJU
X-Gm-Gg: Acq92OGV6liybInz1coHbCUZ0ZA5EhF/qzZbLAu1O2uNQGMhKWKrFol+TsuMSqUMzTg
	SmNP2Bi9jsqafzjwhNZWharXjbYoe/nLGqZnxHVWDaqlJe6jBsUxVWV7Xw1BcDwe5U3BvrGEVcv
	Psje9EoF9BCGbj+D/Aq4hMQlrm7elAvLqf+lMN3/H9r2+KspAUR/Nc0fBJYPB3j+thCsBB4r4xW
	RdIih/ViIj5Ux5dm6p1NmOeLL1wrxJMpGONMBD2PY8JVRi4Q7F89F24D+HIKrQLbj3Md3LZxXrw
	PSmzTIj5WdVTzFnj1sbbJkVeslosHR3XQF2GxSnn1NtwWwQfMWGUi2dIiqos+XMS4mQYSioHvsR
	tV8aV2iO4uJGgKwUWiIO+/ZthDjGZ7Wmr0ADFNBhoepRWZouv6IL7ienJhqXGZyE3OVki0vH4sV
	Tc/iF52zL2UahkHETKfmGFFVEf9/l8cpmjYA==
X-Received: by 2002:a17:906:f049:b0:bdc:8c6b:4842 with SMTP id a640c23a62f3a-bdd25cecf04mr1579914166b.30.1779976316385;
        Thu, 28 May 2026 06:51:56 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc65da3bbsm723636566b.52.2026.05.28.06.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:51:55 -0700 (PDT)
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
Subject: [PATCH v2 5/6] video: backlight: lm3533_bl: Set initial mapping mode from DT
Date: Thu, 28 May 2026 16:51:22 +0300
Message-ID: <20260528135123.103745-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260528135123.103745-1-clamor95@gmail.com>
References: <20260528135123.103745-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to obtain the initial mapping mode from DT instead of leaving
it unconfigured. Additionally, update the linear sysfs code, which uses a
similar coding pattern.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/video/backlight/lm3533_bl.c | 50 ++++++++++++++++-------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 42da652df58d..c03d0d1667e4 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -22,6 +22,7 @@
 #define LM3533_BL_MAX_BRIGHTNESS	255
 
 #define LM3533_REG_CTRLBANK_AB_BCONF	0x1a
+#define   CTRLBANK_AB_BCONF_MODE(n)	BIT(2 * (n) + 1)
 
 
 struct lm3533_bl {
@@ -32,6 +33,7 @@ struct lm3533_bl {
 
 	u32 max_current;
 	u32 pwm;
+	bool linear;
 };
 
 
@@ -135,8 +137,9 @@ static ssize_t show_linear(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
+	int id = lm3533_bl_get_ctrlbank_id(bl);
+	u8 mask = CTRLBANK_AB_BCONF_MODE(id);
 	u8 val;
-	u8 mask;
 	int linear;
 	int ret;
 
@@ -144,8 +147,6 @@ static ssize_t show_linear(struct device *dev,
 	if (ret)
 		return ret;
 
-	mask = 1 << (2 * lm3533_bl_get_ctrlbank_id(bl) + 1);
-
 	if (val & mask)
 		linear = 1;
 	else
@@ -159,23 +160,16 @@ static ssize_t store_linear(struct device *dev,
 					const char *buf, size_t len)
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
+	int id = lm3533_bl_get_ctrlbank_id(bl);
 	unsigned long linear;
-	u8 mask;
-	u8 val;
 	int ret;
 
 	if (kstrtoul(buf, 0, &linear))
 		return -EINVAL;
 
-	mask = 1 << (2 * lm3533_bl_get_ctrlbank_id(bl) + 1);
-
-	if (linear)
-		val = mask;
-	else
-		val = 0;
-
-	ret = lm3533_update(bl->lm3533, LM3533_REG_CTRLBANK_AB_BCONF, val,
-									mask);
+	ret = lm3533_update(bl->lm3533, LM3533_REG_CTRLBANK_AB_BCONF,
+			    linear ? CTRLBANK_AB_BCONF_MODE(id) : 0,
+			    CTRLBANK_AB_BCONF_MODE(id));
 	if (ret)
 		return ret;
 
@@ -253,8 +247,15 @@ static struct attribute_group lm3533_bl_attribute_group = {
 
 static int lm3533_bl_setup(struct lm3533_bl *bl)
 {
+	int id = lm3533_bl_get_ctrlbank_id(bl);
 	int ret;
 
+	ret = lm3533_update(bl->lm3533, LM3533_REG_CTRLBANK_AB_BCONF,
+			    bl->linear ? CTRLBANK_AB_BCONF_MODE(id) : 0,
+			    CTRLBANK_AB_BCONF_MODE(id));
+	if (ret)
+		return ret;
+
 	ret = lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current);
 	if (ret)
 		return ret;
@@ -317,14 +318,6 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, bl);
 
-	ret = sysfs_create_group(&bd->dev.kobj, &lm3533_bl_attribute_group);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to create sysfs attributes\n");
-		return ret;
-	}
-
-	backlight_update_status(bd);
-
 	device_property_read_u32(&pdev->dev, "led-max-microamp",
 				 &bl->max_current);
 	bl->max_current = clamp(bl->max_current, LM3533_LED_MAX_CURRENT_MIN,
@@ -333,9 +326,20 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 	bl->pwm = 0;
 	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &bl->pwm);
 
+	bl->linear = device_property_read_bool(&pdev->dev,
+					       "ti,linear-mapping-mode");
+
 	ret = lm3533_bl_setup(bl);
 	if (ret)
-		goto err_sysfs_remove;
+		return ret;
+
+	ret = sysfs_create_group(&bd->dev.kobj, &lm3533_bl_attribute_group);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to create sysfs attributes\n");
+		return ret;
+	}
+
+	backlight_update_status(bd);
 
 	ret = lm3533_ctrlbank_enable(&bl->cb);
 	if (ret)
-- 
2.51.0

