Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD8D442384
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390834; cv=none; b=Q9CahLkjuRtfinmSOnH/JP8Xf1FP1YYR3JAms4d3MgRZLcAlJWunMRElEaoW6rLHDYvr0HflxuiWmjlj9aEblt+p7TufiXkAPLthVQw9ipwFj6zgYm5gYMz6sb+YP9GSyuAhumkaYgriRJEWg5zvqJC3HoEQ/mDDbE1wU830OIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390834; c=relaxed/simple;
	bh=L/Xi+O03EBynElRL7L0vL8qcfN7hIjPo8s3prz4BfVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RqVkxFHpvLK1hBmyT/it9moJEq/SXAyXtseZMDEfQpuIvBH4MDWYeB7gZwtyB0hF8ViIgSrS1WV+Ukd8hCutBvD5zJZfLq9OZ8gFk1Rrv7aaQMnjaB+UL4uf/0e1hi89biEiHL41upzLyc7cPzzbGYxDwYGOClqfhdxEpA0GN4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sh2BVM3M; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sh2BVM3M"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f6609c657so1183290f8f.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786390815; x=1786995615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yR/4hjRVD3BKmEkJnBlwxN5TsqF/X+OQ8T6Cq6656R0=;
        b=sh2BVM3MbZ1TpQenwhNDkrzOa//eZtU1WZ3d7nCrM5624be2/XsGn18J/Z3ddz4ewS
         krMJ63rASnjP23p8K3zCdYPwfl2yllg16OdnFv4ikckH5UDG/MuG8LC8pJWK7AqRXbS8
         4NKVCLk+O/Zf39WvP5lp7f9RAJk6KMzwq7G13fRVaoazVi/LhCSX06tSq4+dBYCMcOTi
         o/aoQRMVHWPgQBZhqlVR//W9eK/zpcBx3TNF29U+1jQGuQ8/Bjkc4b5qnWp7k/FM+56+
         lunxS0jjOMxZek6mmK0AB9UIvgfq2bf4FQER3PbKJwJ8T3FM6lta0pHcIF4io7p6hSXt
         bvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786390815; x=1786995615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yR/4hjRVD3BKmEkJnBlwxN5TsqF/X+OQ8T6Cq6656R0=;
        b=FhXiGHoOzQ2iqcoV7pOMlrIQbiBe2ODymLw8YLCQqGbckjRbLCD5ZLMjC7sh1J2xIN
         YFIZUC60bkD+WSCWQ0EZC29yjWTY4AKwcFfOhYiL+NhRH0l0h/GE+5nTfoe4aKUWMrKm
         vWR7Y89Ilwu/DEH9A4bxbv3ThCf3FpsOXHNSG0cRuCj64SgC1xV4M8tKZl1k4lBOKFVD
         uQOIrUIATygpRz/QjkG+AbTiEknLwf8ReZGwBb4Es3dNuNkDjsLDfHyWLHgDbqr/JVW3
         ZH4/ADGyqtAo2vm3Sq7XIrzQGPstm+58mgcF4D96qg2vWpTzXWF3V66JCVDi/KTseJcB
         QZ9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp9TYzTqP8KuWpTYnWWGkwmY0fcZr7wkHh88Six3YcLlsgIcXQ2ba9MxvHa1RQ18DF+N8HIslGAxiZn@vger.kernel.org
X-Gm-Message-State: AOJu0YyHgnKaZt8XrXQQ4ac+IPxqhkCH19fp007B5kdkmqoi4y4xBxt3
	/HHPtDH3/Nvt6UBRZyaRoT8D1pO6lchgbLtR3YoB0zZqu+MWNkr30DoY
X-Gm-Gg: AR+sD11ESUE//fa9sWob3b71NFw5TQowQvwO4diKgXsyyajlfjeY1sJZfKNV0Ebq6ry
	GQNaFbZiByD1N9u+6jnl92xgj1zpPIIAUOqrF9p8K4Gt62nF54q8Lpwj2vomAnGbVtXdwLwumWL
	GwYpilx8NExxGEcyQFDPzPTIHQVdgj7vUpD3ouL+5TiEg/Fd+lLCHMfYnMyGzIB0cYk6E4kG+WB
	3HoKStzqRwaUq1/M5omDRxjSSOYLMXxOICR761SfOQ7rGMnv0tkFKDARxwl9yL4m0SZof3Jmfmi
	kOdvrJQ0ie+PJzOn1hailCoeQQeccJfLsVCwXourkhrPbtqB2cBKmQ1ANia8rB5/3W3ML4JF7BT
	5Qs3Qpok+ooKZ4W3eTmJ1efNDZpM17qXHbpgFqhe3LbxXPrnaWOJ486OB1Hg/njNbTAKQeVq9wK
	VCQii8cGGho7Z6Iy9QvulYkD/Ef5h8Z/wmIsA8M2/7gpiUfGR/5ujvL2i4fe1xQzw=
X-Received: by 2002:a05:6000:611:b0:47f:756f:9a8f with SMTP id ffacd0b85a97d-480026edbbcmr34391910f8f.26.1786390815397;
        Mon, 10 Aug 2026 12:40:15 -0700 (PDT)
Received: from antoniarch ([78.213.94.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021506cbsm39291689f8f.14.2026.08.10.12.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:40:15 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v4 9/9] rtc: abx80x: add support for ABX81X
Date: Mon, 10 Aug 2026 21:38:26 +0200
Message-ID: <20260810193826.210683-10-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810193826.210683-1-apokusinski01@gmail.com>
References: <20260810193826.210683-1-apokusinski01@gmail.com>
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
index 08b22c067699..7145de876b50 100644
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
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/rtc.h>
+#include <linux/spi/spi.h>
 #include <linux/watchdog.h>
 
 #define ABX8XX_REG_HTH		0x00
@@ -109,8 +110,8 @@
 
 static u8 trickle_resistors[] = {0, 3, 6, 11};
 
-enum abx80x_chip {AB0801, AB0803, AB0804, AB0805,
-	AB1801, AB1803, AB1804, AB1805, RV1805, ABX80X};
+enum abx80x_chip {AB0801, AB0803, AB0804, AB0805, AB0815,
+	AB1801, AB1803, AB1804, AB1805, AB1815, RV1805, ABX80X};
 
 struct abx80x_cap {
 	u16 pn;
@@ -123,10 +124,12 @@ static struct abx80x_cap abx80x_caps[] = {
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
@@ -1073,14 +1076,107 @@ static void abx80x_unregister_driver(void)
 
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
+		return PTR_ERR(regmap);
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

