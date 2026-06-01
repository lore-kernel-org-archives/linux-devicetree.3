Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D1438E8C9
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780305012; cv=none; b=eEn4Qju2/DDF8OfGnxYOgEkAimJRxHs9Kx1x/oXWdDN3AS9oeKY7hJhAZlh8R435TiBxlVw/jT3Jvc8MRiC4nohWMCUIBWmkuvq2v+6mb+zcfOYVLNe3qbxSm2bJDSa0CTpEWJuiGplpQoP8Gu0w9hqvj5C9KfJ7jG8IYx9zMNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780305012; c=relaxed/simple;
	bh=O055fl7Q6C95FP8VZC+mjY+4NKnfYBiH4TDCEFF6iBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pm5U0acISyy3KsZTojANuMp5G/b64kgIJM9wbdDC0MIcWknPvJv1BsG4AY96wfMNze7rzvRwdEvCdwHqcrzxKFa/ZsnLFTFMVMTUOsJMHfzSRN6p+tQvoSSlw6lX0g+5pBiNFGiEskBBNUHMfw6iu9STRkWPawJtxyu2d9NJEMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p131N6KS; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p131N6KS"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c85822059d8so1440379a12.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 02:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780305009; x=1780909809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkDhvG8TM2x7wepuURdjh/MsyEIEYIzTYi2SAcScS4o=;
        b=p131N6KSWyKbO0YosQonNMv8Y1CWv/5bCnuqbsC9+esiyP/zb68wFnsxReSgmdv5lp
         ImSYSDhaDn08QgJR3g6yRe0DB7Hvzfonhdjmc1uZAZ0Prul1ZXir3+g24XaCnyrjf8Z+
         G2UoeT9nrY+QfR2BLeD9Fj7mwtdWa8YyKPLmyQBjOeqJCgAVt1m7qYlHBf9sxRzBXCmX
         e21gXAmfnwgARhTwmVcvZdYDKvCYzw19cAFBPoQfkXElrQt7zYJbfvQD9NzYujp7lm4Y
         1iZ8E8Myx7NR0t06vbQqWLzFDqfR5pFI+/Jsxu7Pp8aLcwUwv2UawmlGcA4L7i4s7s/K
         40Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780305009; x=1780909809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tkDhvG8TM2x7wepuURdjh/MsyEIEYIzTYi2SAcScS4o=;
        b=KYKOig702RCSXcP23uqIKEGGFVKAHYmdzTSycS3Sl92KP75JFKwV99illNDe9UabBq
         7VxzR0y4KNMg59CPi4CsbC+hp3wD2m2GARNBecK2JXT3AEmCzpe/3orC4KYry+YBncDX
         YtROmJbnDiGx+cN4pC1hET5ENVnMuo1pK+E7+2D3COFuxKs1I9SNXX2sM979PbL1vFk9
         OaMJ/Rv+ZKUZiLXc05zckCL3BUZUB5ZIS41g9AqSvyemrjRKzlwoafLAHyqI1QJTvVIr
         xSxutQAuwynTq6pQWElbSwTg5h7Irac1jWGvfDEpy4Z6vDqwtCcSpu6N7eQGz37ZXWw0
         hdUA==
X-Forwarded-Encrypted: i=1; AFNElJ/XuWYuSiNMNiHD3IlB+zI9KlXJQHH2euu2iOxm2t3ARIk2x9z1p0adrRbNsW+Rz6ZLvOn6+7rw2biR@vger.kernel.org
X-Gm-Message-State: AOJu0YwBLeLqwODE1QE52toKDx2xyu9l0bSrTwVDhojKjnih4tCaH36S
	qhAB/ePsTXLf1UTzlUsaGtvLgiHs0LmzPXuFuVF51x2JIYzzhQGQt3la
X-Gm-Gg: Acq92OEQL8ZbVV3BJjTnBpwzK1FZDJW1rcphZOLuLQcVrf/BleJdZssXw0F6rjGCeOs
	sO7QLbWGYMizUjZEXMJcKCODIioTCAM+gSzUTlDjak0WmY5ZDRZk8GsgQhMfXmtjpe/8X0ObSJz
	SgFDICYHjiOFyh83/LrtjZ1FkBdLy7Sn2l9LApcHK996FYI2IAaDlYlK/e0Vp822xuJpYtORrxD
	lLk0TWid4Zq8xsqdHegQ2WwvMPvAA2ZcdPthZW72pUKT2joaZsPG1JaEG3tKKhSoYqLFkHpM0n/
	vU5Me2Q+16DHQtD6ZNoZJhtaGaE2MrSBq/OPhGJ+wSb9EkP1GW4qXjfNJLgoFC7PH7I0KTWXTSc
	TFxq6Qe0HKTLDpSv0hoDOLleqTEFFy5JiP7Q6LE8xsYBuijXas6lCNazZAepJUKH1DmU/2ZPPks
	6DYPci7iLL0a1GKNFRiejU1XgWOovVSx4ySOciEFC6KYLYAXJDpuqqEYOD
X-Received: by 2002:a05:6a21:483:b0:3b3:ae0:96db with SMTP id adf61e73a8af0-3b427fb5f0dmr10401950637.9.1780305009348;
        Mon, 01 Jun 2026 02:10:09 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:91f7:9b52:3422:d8b9:6baf:c53f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772df0fasm9105827a12.30.2026.06.01.02.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:10:08 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v3 2/2] hwmon:(pmbus/xdp720) Add support for efuse xdp730
Date: Mon,  1 Jun 2026 14:39:25 +0530
Message-Id: <20260601090925.3781-3-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260601090925.3781-1-Ashish.Yadav@infineon.com>
References: <20260601090925.3781-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Adds support for the Infineon XDP730 Digital eFuse Controller by
updating the existing XDP720 driver.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
XDP720/XDP730 Digital eFuse Controllers provides accurate system telemetry
(V, I, P, T) and reports analog current at the IMON pin for post-processing.

Both parts share the same PMBus register map and direct-format
coefficients; they differ in the GIMON gain step exposed via the
TELEMETRY_AVG register (bit 10) and in the VDD_VIN pin number
(XDP720: pin 9, XDP730: pin 20).

The Current and Power measurement depends on the RIMON and GIMON values.
The GIMON (microA/A) depends on the 10th bit of TELEMETRY_AVG PMBUS Register.
The value of RIMON (kohm) can be provided by the user through device tree using
infineon,rimon-micro-ohms  property.
---
 drivers/hwmon/pmbus/Kconfig  |   2 +-
 drivers/hwmon/pmbus/xdp720.c | 167 +++++++++++++++++++++--------------
 2 files changed, 100 insertions(+), 69 deletions(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 8f4bff375ecb..a9e86d92b044 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -715,7 +715,7 @@ config SENSORS_XDP720
 	tristate "Infineon XDP720 family"
 	help
 	  If you say yes here you get hardware monitoring support for Infineon
-	  XDP720.
+	  XDP720 and XDP730 Digital eFuse Controllers.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called xdp720.
diff --git a/drivers/hwmon/pmbus/xdp720.c b/drivers/hwmon/pmbus/xdp720.c
index 8729a771f216..1a5eab09f2fd 100644
--- a/drivers/hwmon/pmbus/xdp720.c
+++ b/drivers/hwmon/pmbus/xdp720.c
@@ -1,128 +1,159 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Hardware monitoring driver for Infineon XDP720 Digital eFuse Controller
+ * Hardware monitoring driver for Infineon XDP720 / XDP730 Digital
+ * eFuse Controllers.
+ *
+ * Both parts share the same PMBus register map and direct-format
+ * coefficients; they differ in the GIMON gain step exposed via
+ * the TELEMETRY_AVG register and in the VDD_VIN pin number.
  *
  * Copyright (c) 2026 Infineon Technologies. All rights reserved.
  */
 
+#include <linux/bitops.h>
 #include <linux/i2c.h>
-#include <linux/module.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
-#include <linux/of_device.h>
-#include <linux/bitops.h>
 #include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
 #include "pmbus.h"
 
 /*
- * The IMON resistor required to generate the system overcurrent protection.
- * Arbitrary default Rimon value: 2k Ohm
+ * The IMON resistor required to generate the system overcurrent
+ * protection.  Arbitrary default Rimon value: 2 kOhm (in micro-ohms).
  */
-#define XDP720_DEFAULT_RIMON 2000000000 /* 2k ohm */
-#define XDP720_TELEMETRY_AVG 0xE9
+#define XDP720_DEFAULT_RIMON		2000000000U	/* 2 kohm */
+#define XDP720_TELEMETRY_AVG		0xE9
+#define XDP720_TELEMETRY_AVG_GIMON	BIT(10)		/* high/low GIMON select */
+
+/* Chip identifiers carried in OF match-data and i2c_device_id->driver_data. */
+enum xdp720_chip_id {
+	CHIP_XDP720 = 0,
+	CHIP_XDP730,
+};
 
-static struct pmbus_driver_info xdp720_info = {
+struct xdp720_data {
+	enum xdp720_chip_id	 id;
+	struct pmbus_driver_info info;
+};
+
+static const struct pmbus_driver_info xdp720_info = {
 	.pages = 1,
-	.format[PSC_VOLTAGE_IN] = direct,
-	.format[PSC_VOLTAGE_OUT] = direct,
-	.format[PSC_CURRENT_OUT] = direct,
-	.format[PSC_POWER] = direct,
-	.format[PSC_TEMPERATURE] = direct,
-
-	.m[PSC_VOLTAGE_IN] = 4653,
-	.b[PSC_VOLTAGE_IN] = 0,
-	.R[PSC_VOLTAGE_IN] = -2,
-	.m[PSC_VOLTAGE_OUT] = 4653,
-	.b[PSC_VOLTAGE_OUT] = 0,
-	.R[PSC_VOLTAGE_OUT] = -2,
+	.format[PSC_VOLTAGE_IN]		= direct,
+	.format[PSC_VOLTAGE_OUT]	= direct,
+	.format[PSC_CURRENT_OUT]	= direct,
+	.format[PSC_POWER]		= direct,
+	.format[PSC_TEMPERATURE]	= direct,
+
+	.m[PSC_VOLTAGE_IN]	= 4653,
+	.b[PSC_VOLTAGE_IN]	= 0,
+	.R[PSC_VOLTAGE_IN]	= -2,
+	.m[PSC_VOLTAGE_OUT]	= 4653,
+	.b[PSC_VOLTAGE_OUT]	= 0,
+	.R[PSC_VOLTAGE_OUT]	= -2,
 	/*
-	 * Current and Power measurement depends on the RIMON (kOhm) and
-	 * GIMON(microA/A) values.
+	 * Current and Power measurement depend on the RIMON (micro-ohm)
+	 * and GIMON (microA/A) values; scaled per-instance in probe().
 	 */
-	.m[PSC_CURRENT_OUT] = 24668,
-	.b[PSC_CURRENT_OUT] = 0,
-	.R[PSC_CURRENT_OUT] = -4,
-	.m[PSC_POWER] = 4486,
-	.b[PSC_POWER] = 0,
-	.R[PSC_POWER] = -1,
-	.m[PSC_TEMPERATURE] = 54,
-	.b[PSC_TEMPERATURE] = 22521,
-	.R[PSC_TEMPERATURE] = -1,
+	.m[PSC_CURRENT_OUT]	= 24668,
+	.b[PSC_CURRENT_OUT]	= 0,
+	.R[PSC_CURRENT_OUT]	= -4,
+	.m[PSC_POWER]		= 4486,
+	.b[PSC_POWER]		= 0,
+	.R[PSC_POWER]		= -1,
+	.m[PSC_TEMPERATURE]	= 54,
+	.b[PSC_TEMPERATURE]	= 22521,
+	.R[PSC_TEMPERATURE]	= -1,
 
 	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
-		   PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_INPUT |
-		   PMBUS_HAVE_STATUS_TEMP,
+		   PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT |
+		   PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
 };
 
 static int xdp720_probe(struct i2c_client *client)
 {
-	struct pmbus_driver_info *info;
+	struct xdp720_data *data;
 	int ret;
-	u32 rimon;
 	int gimon;
+	u32 rimon;
 
-	info = devm_kmemdup(&client->dev, &xdp720_info, sizeof(*info),
-			    GFP_KERNEL);
-	if (!info)
+	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
 		return -ENOMEM;
 
+	data->id = (enum xdp720_chip_id)(uintptr_t)i2c_get_match_data(client);
+	data->info = xdp720_info;
+
 	ret = devm_regulator_get_enable(&client->dev, "vdd-vin");
 	if (ret)
 		return dev_err_probe(&client->dev, ret,
-			"failed to enable vdd-vin supply\n");
+				     "failed to enable vdd-vin supply\n");
 
 	ret = i2c_smbus_read_word_data(client, XDP720_TELEMETRY_AVG);
-	if (ret < 0) {
-		dev_err(&client->dev, "Can't get TELEMETRY_AVG\n");
-		return ret;
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to read TELEMETRY_AVG\n");
+
+	/* Bit 10 of TELEMETRY_AVG selects the GIMON gain step in microA/A */
+	switch (data->id) {
+	case CHIP_XDP720:
+		gimon = (ret & XDP720_TELEMETRY_AVG_GIMON) ? 18200 : 9100;
+		dev_info(&client->dev, "Initialised XDP720 instance\n");
+		break;
+	case CHIP_XDP730:
+		gimon = (ret & XDP720_TELEMETRY_AVG_GIMON) ? 20000 : 10000;
+		dev_info(&client->dev, "Initialised XDP730 instance\n");
+		break;
+	default:
+		return -EINVAL;
 	}
 
-	ret >>= 10; /* 10th bit of TELEMETRY_AVG REG for GIMON Value */
-	ret &= GENMASK(0, 0);
-	if (ret == 1)
-		gimon = 18200; /* output gain 18.2 microA/A */
-	else
-		gimon = 9100; /* output gain 9.1 microA/A */
-
-	if (of_property_read_u32(client->dev.of_node,
-				 "infineon,rimon-micro-ohms", &rimon))
-		rimon = XDP720_DEFAULT_RIMON; /* Default if not set via DT */
+	if (device_property_read_u32(&client->dev,
+				     "infineon,rimon-micro-ohms", &rimon))
+		rimon = XDP720_DEFAULT_RIMON;	/* Default if not in FW */
 	if (rimon == 0)
 		return -EINVAL;
 
-	/* Adapt the current and power scale for each instance */
-	info->m[PSC_CURRENT_OUT] = DIV64_U64_ROUND_CLOSEST((u64)
-		info->m[PSC_CURRENT_OUT] * rimon * gimon, 1000000000000ULL);
-	info->m[PSC_POWER] = DIV64_U64_ROUND_CLOSEST((u64)
-		info->m[PSC_POWER] * rimon * gimon, 1000000000000000ULL);
+	/* Adapt the current and power scale for each instance. */
+	data->info.m[PSC_CURRENT_OUT] = DIV64_U64_ROUND_CLOSEST((u64)
+		data->info.m[PSC_CURRENT_OUT] * rimon * gimon,
+		1000000000000ULL);
+	data->info.m[PSC_POWER] = DIV64_U64_ROUND_CLOSEST((u64)
+		data->info.m[PSC_POWER] * rimon * gimon,
+		1000000000000000ULL);
 
-	return pmbus_do_probe(client, info);
+	return pmbus_do_probe(client, &data->info);
 }
 
 static const struct of_device_id xdp720_of_match[] = {
-	{ .compatible = "infineon,xdp720" },
-	{}
+	{ .compatible = "infineon,xdp720", .data = (void *)CHIP_XDP720 },
+	{ .compatible = "infineon,xdp730", .data = (void *)CHIP_XDP730 },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, xdp720_of_match);
 
 static const struct i2c_device_id xdp720_id[] = {
-	{ "xdp720" },
-	{}
+	{ "xdp720", CHIP_XDP720 },
+	{ "xdp730", CHIP_XDP730 },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, xdp720_id);
 
 static struct i2c_driver xdp720_driver = {
 	.driver = {
-		   .name = "xdp720",
-		   .of_match_table = xdp720_of_match,
+		.name		= "xdp720",
+		.of_match_table	= xdp720_of_match,
 	},
-	.probe = xdp720_probe,
-	.id_table = xdp720_id,
+	.probe		= xdp720_probe,
+	.id_table	= xdp720_id,
 };
 
 module_i2c_driver(xdp720_driver);
 
 MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
-MODULE_DESCRIPTION("PMBus driver for Infineon XDP720 Digital eFuse Controller");
+MODULE_DESCRIPTION("PMBus driver for Infineon XDP720/XDP730 Digital eFuse Controllers");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("PMBUS");
-- 
2.39.5

