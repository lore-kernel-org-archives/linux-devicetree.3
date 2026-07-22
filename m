Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B273E40DB5A
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750460; cv=none; b=m+ke3asrWhNdnMHGly4Yg850+ZVyqJn3p2RV+mwWkk8IM4p6E+JxW0JfC23jeKDWxXnsxRGAQDgi/Ju5/Nk1jA+eOgICFCaTO+zgs+rDIfHU/bLisn/qhGlVusAe6SPzLA/xstT0qI5FHgJaQ1m6wsPCCnf2FvV3eTy4m4xM9e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750460; c=relaxed/simple;
	bh=KpygZ8GB+c7/5lGdx/FQyjXu05OWpxeL93FdegbIR5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=InHnt4zEywc+a9zHhvnmFQJvhtz7S+2oH/JGY+10OzBK+SKCaPzFOS+WnGJfIG8W58t1Z1mjyvTBetKMiQibdpRrFUVCsNLVT5363cOZK8raF4/3/YWw5GIJYX6yWbID1dX03jm+A4Iuc1i83xZ/fYf/AdfRjSwNlfx9ITE2/7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oly6qDJi; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oly6qDJi"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4720f3bf164so3709739f8f.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784750454; x=1785355254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pM44BapRGczB/9Ps+Zp6uv/1Q9pZfNzF0sciKn08xQ0=;
        b=oly6qDJialRZ6oP+y8WhMsO9axWK5ll3pxScD9s6WbZWNSARVPjaDYgA/seCd9F9jT
         uuybMm6TAtpVXnAa+nFJlfBRlJRB5Y2ts7/qNDW4l6JcP95N7bsC36VO9+55IGZewUhm
         mJSx/tfZtSaL4amNL7SQUoUNKO1R5YLWABp0NLHzPn5EDha6PQv3y1xn76pqlzBc8zxk
         XRAzU/6Hs1IS7hszMb51I7UI/kyDZdmoPndTFvLBS8+R4BzMDn1k/untwCeTKtZvU0/U
         GFRfHgY6RcWPlTv0J/8hIBckh6IKfdjrV4WDOYoezKpVmluU5ApsPYJLM8kjdXYZa2gw
         au/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784750454; x=1785355254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pM44BapRGczB/9Ps+Zp6uv/1Q9pZfNzF0sciKn08xQ0=;
        b=ODOuM9202kLxa38h3Gz434yGjLyplnMDOvSy1LckY8Ik8Xuu2ccnh2zHFlWQmt+6NF
         QhHshvEcc/cmN0bWmsvuYFMjwU0zBs+OlK00Lsssu3roM0lROhKESkfJD9Io/Q2feGaw
         sI4Dyl/l17bmO7XjW8rTGIAts4jyIAbWyLv/aqhhuuRwpMhqfyknOT+6A6ARsWep5YXt
         haExFB5CHjWTls5Y4GUpB2LknF+mNEXLKjIE4CRgp23LgaPonf08wruU6rvN+VZTnotT
         J4fdUIOv3a6TVpBwQQePN0F2cx/TfV7LUVBLO62FNn1eZisOmRaBw9zyrP94EpW3YOzE
         minQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCyiuQaX0rZOZf/IGlHAn2p7Q9aLl3D4bJRmZZNu8+mLtqF2F6SUlMuy2ihxwJFQMST2yLszlCQPY/@vger.kernel.org
X-Gm-Message-State: AOJu0YxrREtMFaAvnhKeqJmT7nZ+M6TgBSBbxfQ8derDRUxGRQduIgu+
	ZX4ZquYugxHi9IaPRxhyQ/kcWDPSWYLVp6Awrq7o1msW5Yt+od2023uO
X-Gm-Gg: AR+sD13dl2ng81m+tw+wd+2EDXAJDW8VSe/AE+oo01xchMiTYcQ1X1Ui7fpMIg/BWmC
	v0lkAqLEyG5VCpN91SlGfQa2SXArG6RXcI3bO8oFln2LO+DVSAx26dGpxPIoGEnj55usi329mwr
	sZS/Q+V/iXVzsAlI/XV4GGsmA1K+lEiHBFz0k8p0Ly4gG+cvS3kx8FxatfAxmOI1Yddd/3rpJBw
	XNyTtff3FGjVPxmaY0lUrL5TG1ed244fJvY+Rgs6e+pHlhVMkhLJE9m1/EHECfZ8q0XSRGBwstk
	l+zgHLheCXsNvVhaLwlBzTECBEjPwAFfLzAvCYc1ejl8NAHcBzbzf7yvHNE8i3Nxl1DmpmzyK4i
	gaosmE3Be4hBu3tV5GlGA58NyBdbfP3tLzBBrBHBy0OOEQBXhdVatuxvatiYP0irhokHfR8/eQ0
	o1E2TZkYwXWT6uANZc
X-Received: by 2002:a05:6000:25f4:b0:472:1424:fc7c with SMTP id ffacd0b85a97d-47f840a7ddfmr7238204f8f.10.1784750454162;
        Wed, 22 Jul 2026 13:00:54 -0700 (PDT)
Received: from antoniarch ([78.210.252.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm9532851f8f.20.2026.07.22.13.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:00:53 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH 6/6] rtc: abx80x: add support for ABX81X
Date: Wed, 22 Jul 2026 21:58:14 +0200
Message-ID: <20260722195814.298552-7-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722195814.298552-1-apokusinski01@gmail.com>
References: <20260722195814.298552-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Abracon ABX81X is a family of RTCs with SPI interface featuring
the same functionalities as the ABX80X I2C clocks.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/Kconfig      |  26 +++++-----
 drivers/rtc/rtc-abx80x.c | 106 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 115 insertions(+), 17 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 4d14bcba616e..d35221f81024 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -212,18 +212,6 @@ config RTC_DRV_ABEOZ9
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-ab-e0z9.
 
-config RTC_DRV_ABX80X
-	tristate "Abracon ABx80x"
-	select WATCHDOG_CORE if WATCHDOG
-	select REGMAP_I2C
-	help
-	  If you say yes here you get support for Abracon AB080X and AB180X
-	  families of ultra-low-power  battery- and capacitor-backed real-time
-	  clock chips.
-
-	  This driver can also be built as a module. If so, the module
-	  will be called rtc-abx80x.
-
 config RTC_DRV_AC100
 	tristate "X-Powers AC100"
 	depends on MFD_AC100
@@ -955,6 +943,20 @@ config RTC_I2C_AND_SPI
 
 comment "SPI and I2C RTC drivers"
 
+config RTC_DRV_ABX80X
+	tristate "Abracon ABx80x"
+	depends on RTC_I2C_AND_SPI
+	select WATCHDOG_CORE if WATCHDOG
+	select REGMAP_I2C if I2C
+	select REGMAP_SPI if SPI_MASTER
+	help
+	  If you say yes here you get support for Abracon AB080X, AB180X,
+	  AB081X and AB181X families of ultra-low-power  battery- and
+	  capacitor-backed real-time clock chips.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-abx80x.
+
 config RTC_DRV_DS3232
 	tristate "Dallas/Maxim DS3232/DS3234"
 	depends on RTC_I2C_AND_SPI
diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 6e0c14695bdf..8481148ce3a2 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * A driver for the I2C members of the Abracon AB x8xx RTC family,
- * and compatible: AB 1805 and AB 0805
+ * A driver for the I2C and SPI members of the Abracon AB x8xx RTC family,
+ * and compatible: AB 1805, AB 0805, AB 1815 and AB 0815
  *
  * Copyright 2014-2015 Macq S.A.
  *
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/rtc.h>
+#include <linux/spi/spi.h>
 #include <linux/watchdog.h>
 
 #define ABX8XX_REG_HTH		0x00
@@ -102,8 +103,8 @@
 
 static u8 trickle_resistors[] = {0, 3, 6, 11};
 
-enum abx80x_chip {AB0801, AB0803, AB0804, AB0805,
-	AB1801, AB1803, AB1804, AB1805, RV1805, ABX80X};
+enum abx80x_chip {AB0801, AB0803, AB0804, AB0805, AB0815,
+	AB1801, AB1803, AB1804, AB1805, AB1815, RV1805, ABX80X};
 
 struct abx80x_cap {
 	u16 pn;
@@ -116,10 +117,12 @@ static struct abx80x_cap abx80x_caps[] = {
 	[AB0803] = {.pn = 0x0803},
 	[AB0804] = {.pn = 0x0804, .has_tc = true, .has_wdog = true},
 	[AB0805] = {.pn = 0x0805, .has_tc = true, .has_wdog = true},
+	[AB0815] = {.pn = 0x0815, .has_tc = true, .has_wdog = true},
 	[AB1801] = {.pn = 0x1801},
 	[AB1803] = {.pn = 0x1803},
 	[AB1804] = {.pn = 0x1804, .has_tc = true, .has_wdog = true},
 	[AB1805] = {.pn = 0x1805, .has_tc = true, .has_wdog = true},
+	[AB1815] = {.pn = 0x1815, .has_tc = true, .has_wdog = true},
 	[RV1805] = {.pn = 0x1805, .has_tc = true, .has_wdog = true},
 	[ABX80X] = {.pn = 0}
 };
@@ -1013,14 +1016,107 @@ static void abx80x_unregister_driver(void)
 
 #endif /* IS_ENABLED(CONFIG_I2C) */
 
+#if IS_ENABLED(CONFIG_SPI_MASTER)
+
+static const struct regmap_config abx80x_regmap_config_spi = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = ABX8XX_SRAM_BASE + ABX8XX_SRAM_WIN_SIZE - 1,
+
+	.rd_table = &abx80x_read_table,
+	.wr_table = &abx80x_write_table,
+
+	.write_flag_mask = BIT(7),
+};
+
+static const struct spi_device_id abx81x_id[] = {
+	{ "ab0815", AB0815 },
+	{ "ab1815", AB1815 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, abx81x_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id abx81x_of_match[] = {
+	{
+		.compatible = "abracon,ab0815",
+		.data = (void *)AB0815
+	},
+	{
+		.compatible = "abracon,ab1815",
+		.data = (void *)AB1815
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, abx81x_of_match);
+#endif
+
+static int abx81x_spi_probe(struct spi_device *spi)
+{
+	unsigned int part = (uintptr_t)spi_get_device_match_data(spi);
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init_spi(spi, &abx80x_regmap_config_spi);
+	if (IS_ERR(regmap)) {
+		dev_err(&spi->dev, "Unable to allocate regmap\n");
+		return -EIO;
+	}
+
+	return abx80x_probe(&spi->dev, regmap, spi->irq,
+			    spi->dev.of_node, part);
+}
+
+static struct spi_driver abx81x_driver = {
+	.driver		= {
+		.name	= "rtc-abx81x",
+		.of_match_table = of_match_ptr(abx81x_of_match),
+	},
+	.probe		= abx81x_spi_probe,
+	.id_table	= abx81x_id,
+};
+
+static int abx81x_register_driver(void)
+{
+	return spi_register_driver(&abx81x_driver);
+}
+
+static void abx81x_unregister_driver(void)
+{
+	spi_unregister_driver(&abx81x_driver);
+}
+
+#else
+
+static int abx81x_register_driver(void)
+{
+	return 0;
+}
+
+static void abx81x_unregister_driver(void)
+{
+}
+
+#endif /* IS_ENABLED(CONFIG_SPI_MASTER) */
+
 static int __init abx80x_init(void)
 {
-	return abx80x_register_driver();
+	int ret;
+
+	ret = abx80x_register_driver();
+	if (ret)
+		return ret;
+
+	ret = abx81x_register_driver();
+	if (ret)
+		abx80x_unregister_driver();
+
+	return ret;
 }
 module_init(abx80x_init);
 
 static void __exit abx80x_exit(void)
 {
+	abx81x_unregister_driver();
 	abx80x_unregister_driver();
 }
 module_exit(abx80x_exit);
-- 
2.55.0

