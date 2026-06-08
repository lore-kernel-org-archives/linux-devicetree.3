Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D0536F8E8
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 06:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899384; cv=none; b=G4PadzcRhcOYixJHi0ZKhd2aGZoTbFkZ7+ZR0a51EMImUhFsP1xLQoBAcNjv4raDSdPBsdGTGZ+lLaov6EWDoWpBzfR57sN7ELiHpK4v1xzJ/VEaXkyDlynfOr/0E4KvxWyoQB4ivPjpBkxg6hOf45jGHonv8oWFcROMglics4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899384; c=relaxed/simple;
	bh=xbM/2WzkK5HS8lvEHLhlY7SIJXrEpe8Tbc7EW+MeFxE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VMjDl5530Dnh2wIpOT7cj2sycnDGnZXkPfvzzgKnNB0nxRsEp5VPhvSwVycIXxEw8icpqAqdtRuwPJ1FZjdvyJk/xFxCapsebd09Vs1VrnRvfy9+0ATLVmohBSp6NvagGFmnZic7chxFmlEY2z7Wpe5Vh+Gbi4kXS3EAcKTEOWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqgvSK74; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqgvSK74"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0b944f6edso41102805ad.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 23:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780899382; x=1781504182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjWUXj+heXGcA4AnuFAwW33oYwo0QFJERzR79tHEGeY=;
        b=LqgvSK74kymrnim0G+xfAUACJ92zfX2f+SL2wqlp/ZeoRsDXl7aqs2CtuxYrfmQFV/
         oLjuU+p99DW/nS4SF7NgRvSzBo4XIOBxfVsvSKvOaUad29JvtSxLbeMhFileoy4INAfe
         WUCYI41qwtVTMAQFrjx9ttVjLNZX96UjR9GYhp10+W50Rp4Rc+L8W7PX4Y/ghnBTywjt
         oYsiZjnA/hPZ8PvGtGfhyZPdBOqrJxQTzOxw7GZYbNFxqW2ZywdT0FKhgdA30Cl31x8v
         jIEPPCNQHYePydmIPjDk080uj+6yI0qTVep0yqeFzwxENeK77iAqUhNZpkg4k8Rw58La
         xWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780899382; x=1781504182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AjWUXj+heXGcA4AnuFAwW33oYwo0QFJERzR79tHEGeY=;
        b=X99X+zjKM7tl6hKUmIKYKLCT6YA/y+lr39URG5odaup9TpEMnUW7Nq0o13ifRr1ArH
         EvGTsp5YOjFqs/gEsG32C1HXZRLrJQZVfBjwZi6mil9MJGzG5u/ccoLe1ThV0483iZ3M
         dpbJDm1PHZ0L8VSkdjUkjlKACrjYxmCVhjHnFdTKIidPH0NlzOB+zIrmf7uQO5m9jzbm
         MrU06Pw6yzS6kYn+qqGA5MOoNGDzZPesG1VwQITOQ081VzBPuVrJkMJxvBTuQBnA29AI
         74qwTRHCV5PiRt8CtPWJyt3JXwKk/Ot8zRZ0oYYR5TBCRPhvP6TjAZXJM3I1pz11xIdF
         IL+w==
X-Forwarded-Encrypted: i=1; AFNElJ+MylnRd1NvkLTbGazu4yQrXzCK2An21WLcV7XjR5rN9rbNbLMj6vi/9NzisCIwHcpEuXoZLQ5Fsn6X@vger.kernel.org
X-Gm-Message-State: AOJu0YztRMs0BvzDRFvBtdhfbOkrYVa++7D6Nu0Bjb91NJq0ys62YdCp
	9KkaWmsyXaKatCZ7WP2bUoYnsf97jtrj+rB9/9sO4yB1O9HjW5S4yXc1
X-Gm-Gg: Acq92OGpDtpdYl6vQaxjueBTnVUTGG0Mu1VzgU3tpZkXnWHAbCAoEHvK9Wgs9YCzIVW
	ZZETXrAkd16PCkU5EzZbjfMWEFE970IaiXiSYBXVjov8AYuJ4jdlGGJLJ3p5F60cgR7NxM/LxHh
	qgLCYUaNWpF703CcwUMg3/fJZUH5bwCfinkjFn9sAbpKhzosUhQIhxSrqf83+uDj0E6S5fdAy90
	BiePokqLzrt8QINeojnP0u4q+f/LvVo9CmG/+YjQr7b8n765/aLnV3z6PLE8uGOz/qo6IpEgS2x
	USurH5znYn9iv0FlSrlkvKix7+ZYeIIruaYg7glG9OR8oNeohpTOEnd/C8W9h4Opp5tCze4k3hh
	6dMIzYrLjr0nqZZQaTV4muu+UvS2Nhip6HVrWdxrCl/QUjavw64tQNIMLAMD/2WHUgIBmy2G76g
	i8ZgrGBbmjGH+VFexQPN6uys6jguJosDYkwlERjxZkuNmzQfkQs3kjPlQH
X-Received: by 2002:a17:903:3d06:b0:2bf:2114:ecbe with SMTP id d9443c01a7336-2c1e8209435mr160510935ad.23.1780899382243;
        Sun, 07 Jun 2026 23:16:22 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:9004:8bfa:6dac:310c:dd97:e630])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ad138sm173856925ad.82.2026.06.07.23.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:16:21 -0700 (PDT)
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
Subject: [PATCH v4 2/2] hwmon:(pmbus/xdp720) Add support for efuse xdp730
Date: Mon,  8 Jun 2026 11:45:44 +0530
Message-Id: <20260608061544.5613-3-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260608061544.5613-1-Ashish.Yadav@infineon.com>
References: <20260608061544.5613-1-Ashish.Yadav@infineon.com>
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
 drivers/hwmon/pmbus/Kconfig  |  2 +-
 drivers/hwmon/pmbus/xdp720.c | 97 ++++++++++++++++++++++++------------
 2 files changed, 65 insertions(+), 34 deletions(-)

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
index 8729a771f216..9bdeac2d82f5 100644
--- a/drivers/hwmon/pmbus/xdp720.c
+++ b/drivers/hwmon/pmbus/xdp720.c
@@ -1,27 +1,46 @@
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
  * The IMON resistor required to generate the system overcurrent protection.
  * Arbitrary default Rimon value: 2k Ohm
  */
-#define XDP720_DEFAULT_RIMON 2000000000 /* 2k ohm */
+#define XDP720_DEFAULT_RIMON 2000000000U /* 2k ohm */
 #define XDP720_TELEMETRY_AVG 0xE9
+#define XDP720_TELEMETRY_AVG_GIMON BIT(10) /* high/low GIMON select */
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
 	.format[PSC_VOLTAGE_IN] = direct,
 	.format[PSC_VOLTAGE_OUT] = direct,
@@ -56,57 +75,69 @@ static struct pmbus_driver_info xdp720_info = {
 
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
 			"failed to enable vdd-vin supply\n");
 
 	ret = i2c_smbus_read_word_data(client, XDP720_TELEMETRY_AVG);
-	if (ret < 0) {
-		dev_err(&client->dev, "Can't get TELEMETRY_AVG\n");
-		return ret;
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret,
+			"failed to read TELEMETRY_AVG\n");
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
 
 	/* Adapt the current and power scale for each instance */
-	info->m[PSC_CURRENT_OUT] = DIV64_U64_ROUND_CLOSEST((u64)
-		info->m[PSC_CURRENT_OUT] * rimon * gimon, 1000000000000ULL);
-	info->m[PSC_POWER] = DIV64_U64_ROUND_CLOSEST((u64)
-		info->m[PSC_POWER] * rimon * gimon, 1000000000000000ULL);
-
-	return pmbus_do_probe(client, info);
+	data->info.m[PSC_CURRENT_OUT] = DIV64_U64_ROUND_CLOSEST((u64)
+		data->info.m[PSC_CURRENT_OUT] * rimon * gimon,
+		1000000000000ULL);
+	data->info.m[PSC_POWER] = DIV64_U64_ROUND_CLOSEST((u64)
+		data->info.m[PSC_POWER] * rimon * gimon,
+		1000000000000000ULL);
+
+	return pmbus_do_probe(client, &data->info);
 }
 
 static const struct of_device_id xdp720_of_match[] = {
-	{ .compatible = "infineon,xdp720" },
+	{ .compatible = "infineon,xdp720", .data = (void *)CHIP_XDP720 },
+	{ .compatible = "infineon,xdp730", .data = (void *)CHIP_XDP730 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, xdp720_of_match);
 
 static const struct i2c_device_id xdp720_id[] = {
-	{ "xdp720" },
+	{ "xdp720", CHIP_XDP720 },
+	{ "xdp730", CHIP_XDP730 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, xdp720_id);
@@ -123,6 +154,6 @@ static struct i2c_driver xdp720_driver = {
 module_i2c_driver(xdp720_driver);
 
 MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
-MODULE_DESCRIPTION("PMBus driver for Infineon XDP720 Digital eFuse Controller");
+MODULE_DESCRIPTION("PMBus driver for Infineon XDP720/XDP730 Digital eFuse Controllers");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("PMBUS");
-- 
2.39.5

