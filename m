Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A103B6C0D
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866265; cv=none; b=b3ri4ckGOTwWqy5Xdg6fMK6ANOyPQ1fmjMH9lh461qw/U+ajATcR8dmFk2hYtctHHN34wi47CEw6fGH6F4wWX7bcDgDrVsejrscksFzRRHM9UuC51bDk8KIzLUElUwEP5SHAw4iZCm6JgW/FSUn05+mNqazVLOY6AzVlbPjMdsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866265; c=relaxed/simple;
	bh=VMluzEO+vXScleCPbSoiPiWKvNB37BOBgsT+f6Aumbg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rudAO0RRbyNNhAWMagxtktuwfDX7uNbOSV64NFsItDLRuBHMzAdrOufniBqPBaW0kAYLpEAVVm8FpgNKgSSV4fDygzWLZtPPKvGqVAQ4F3utKcTdjCmNsT1drO7cRNnH0NHenaxfHUNSF0QtCuOOsD/m1QISdLVD4aQJ43ZEKAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUwbvQ8O; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUwbvQ8O"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso2072773a91.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 03:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774866264; x=1775471064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuV6S8ARQhcEDtqDMV4JUy18vQg5CHRAe10eKnzkrUw=;
        b=QUwbvQ8O2WijVRF1EWUCh+QGPcsjNOG8Qm7uJN0UfISVHDtseEaHjj/duJzqxjLwBJ
         IhKjXuMvBpcQ2vCPWI36sp7z/uBec1GjAC1O6im6Slcm/mN5xx+JkeJ5aRRPr1D0WIrh
         HANPoT8LTIvxtBabmVKj0qsoUQ0kTCabe64X950pdkE5izsAF3QAtFvY05fZVH2QXBsq
         QNJdgvNg9Gfnli8ZG4utYcIhkjiWFGJK/DAD4P5mGj/hN+68YTrZIYSL0eI+BUp81+SW
         qIIPXHwzQwmLa3MldlFpRO4OJVhjkxJJdbfIOeilhDKjDB3ixy1f7BiyABA627WfvQYu
         j8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774866264; x=1775471064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FuV6S8ARQhcEDtqDMV4JUy18vQg5CHRAe10eKnzkrUw=;
        b=lO72dqqZjNPUxiZ/NdkWmH0WXytUxBzaOAwaH6MpawgJX82fcqPmwI2mPBk1e1D+dP
         8/qAFLKQUOgonKkYPnkpQ6QQju270rO90bDE64++Ye72lPuDZYsnw4pRvdbhF72mte3X
         JAz27OjCnmFe24X05G27W407VFtTzxuZ4tTj+n3jDtMt2dDyeEH6c6Z7c6HP+imAPRlv
         bRzYRC12VHg4tGybjoWeA0zhUj2UWZq8psk7hRv6KZs1KxKOOUOu4OGO476VuTFx6wOX
         AEnG9SlYEDD5JCWbX4oLu2gH5vqP7jdV/XmK6vn7tvU9h+SfINiSbX2nZ4jpD2jPRlcZ
         PwHA==
X-Forwarded-Encrypted: i=1; AJvYcCUSLj7cROl+AaZj696zPZOCubspDWbsrIRdUvUT0zHSWIB8NI3h2xmDjneeFrebq3V3lOZWGBUnH04k@vger.kernel.org
X-Gm-Message-State: AOJu0YyOaGCz3uHiXBO74bgxiazSU4Of3JRetFRsF22T8an88+uq19XD
	lxvDAhV/uuAE46NKOtgLg5V0TjaRfB0umPd2/ZOzYOafHDHXW9I7+f6u0eOmGQ==
X-Gm-Gg: ATEYQzzWcZsxS9q07kCIoztbwwLW8EqK3628JWVvaokWxLxtiw+KEx/eAWYml/h96FA
	GJGnSsn60ZExxW5WPx/IA7AfbvvXxxTqXbxBi/+QDmqC4xKF/LqVFir7qb0z6yICRF13WK7jcLz
	4/8EX9kf7GVkpqaCH6McBz4zoD+4PEPrJpnQEnRco4bP+eAz+lJnJyaZia/4jCOKCqkbpS2xbOi
	PAse5TLT0lAXkyGfPc79pzgKqx2zVO3N/ViBLR4VC8/7ME7GFjTr6x4hpEBv0G0WpmgraF4mxi4
	OeHkHCIPpCwiwEQtBmilFGWfV0bUgTGtqNupsEv99wER3s8ZMIjJ3Ezejva98AVphpfz4WND0xV
	MPSlFh30RkB/7ElzL4SfTYPhsAjJxx7+EtMzFyx4G6mbDZD448ClV3AQKLq2Af1ysyWgoagOuj8
	us0Sn/Q0JIjH+i1to4gXjrFGeO6xGTQymKnE7pVIuPQEAppw==
X-Received: by 2002:a17:90b:4b0d:b0:35b:e5ba:c0c8 with SMTP id 98e67ed59e1d1-35c3010dc26mr10692038a91.28.1774866263357;
        Mon, 30 Mar 2026 03:24:23 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:93c7:f319:97ce:1434:43e8:eab7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35da9ef1b70sm2487452a91.16.2026.03.30.03.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:24:22 -0700 (PDT)
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
Subject: [PATCH 2/2] hwmon:(pmbus/xdp720) Add support for efuse xdp720
Date: Mon, 30 Mar 2026 15:53:45 +0530
Message-Id: <20260330102345.37065-3-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260330102345.37065-1-Ashish.Yadav@infineon.com>
References: <20260330102345.37065-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add the pmbus driver for Infineon XDP720 Digital eFuse Controller.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
XDP720 Digital eFuse Controller provides accurate system telemetry
(V, I, P, T) and reports analog current at the IMON pin for post-processing.

The Current and Power measurement depends on the RIMON and GIMON values.
Please look into data sheet sections 5.4.2 and 5.4.4 for more details:
https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf

The GIMON (microA/A) depends on the 10th bit of TELEMETRY_AVG PMBUS Register.
The value of RIMON (kohm) can be provided by the user through device tree using
infineon,rimon-micro-ohms  property.
---
 drivers/hwmon/pmbus/Kconfig  |   9 +++
 drivers/hwmon/pmbus/Makefile |   1 +
 drivers/hwmon/pmbus/xdp720.c | 122 +++++++++++++++++++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/xdp720.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index fc1273abe357..c8e53852d0c3 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -702,6 +702,15 @@ config SENSORS_XDP710
 	  This driver can also be built as a module. If so, the module will
 	  be called xdp710.
 
+config SENSORS_XDP720
+        tristate "Infineon XDP720 family"
+        help
+          If you say yes here you get hardware monitoring support for Infineon
+          XDP720.
+
+          This driver can also be built as a module. If so, the module will
+          be called xdp720.
+
 config SENSORS_XDPE152
 	tristate "Infineon XDPE152 family"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index d6c86924f887..bb0a7526d5b3 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -68,6 +68,7 @@ obj-$(CONFIG_SENSORS_TPS546D24)	+= tps546d24.o
 obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
 obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
 obj-$(CONFIG_SENSORS_XDP710)	+= xdp710.o
+obj-$(CONFIG_SENSORS_XDP720)    += xdp720.o
 obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
 obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
 obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
diff --git a/drivers/hwmon/pmbus/xdp720.c b/drivers/hwmon/pmbus/xdp720.c
new file mode 100644
index 000000000000..862de828198d
--- /dev/null
+++ b/drivers/hwmon/pmbus/xdp720.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for Infineon XDP720 Digital eFuse Controller
+ *
+ * Copyright (c) 2026 Infineon Technologies. All rights reserved.
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/of_device.h>
+#include <linux/bitops.h>
+#include "pmbus.h"
+
+/*
+ * The IMON resistor required to generate the system overcurrent protection.
+ * Arbitrary default Rimon value: 2k Ohm
+ */
+#define XDP720_DEFAULT_RIMON 2000000000 /* 2k ohm */
+#define XDP720_TELEMETRY_AVG 0xE9
+
+static struct pmbus_driver_info xdp720_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+
+	.m[PSC_VOLTAGE_IN] = 4653,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = -2,
+	.m[PSC_VOLTAGE_OUT] = 4653,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = -2,
+	/*
+	 * Current and Power measurement depends on the RIMON (kOhm) and
+	 * GIMON(microA/A) values.
+	 */
+	.m[PSC_CURRENT_OUT] = 24668,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = -4,
+	.m[PSC_POWER] = 4486,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = -1,
+	.m[PSC_TEMPERATURE] = 54,
+	.b[PSC_TEMPERATURE] = 22521,
+	.R[PSC_TEMPERATURE] = -1,
+
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
+		   PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_INPUT |
+		   PMBUS_HAVE_STATUS_TEMP,
+};
+
+static int xdp720_probe(struct i2c_client *client)
+{
+	struct pmbus_driver_info *info;
+	int ret;
+	u32 rimon;
+	int gimon;
+
+	info = devm_kmemdup(&client->dev, &xdp720_info, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ret = i2c_smbus_read_word_data(client, XDP720_TELEMETRY_AVG);
+	if (ret < 0) {
+		dev_err(&client->dev, "Can't get TELEMETRY_AVG\n");
+		return ret;
+	}
+
+	ret >>= 10; /* 10th bit of TELEMETRY_AVG REG for GIMON Value */
+	ret &= GENMASK(0, 0);
+	if (ret == 1)
+		gimon = 18200; /* output gain 18.2 microA/A */
+	else
+		gimon = 9100; /* output gain 9.1 microA/A */
+
+	if (of_property_read_u32(client->dev.of_node,
+				 "infineon,rimon-micro-ohms", &rimon))
+		rimon = XDP720_DEFAULT_RIMON; /* Default if not set via DT */
+	if (rimon == 0)
+		return -EINVAL;
+
+	/* Adapt the current and power scale for each instance */
+	info->m[PSC_CURRENT_OUT] = DIV_ROUND_CLOSEST_ULL((u64)
+		info->m[PSC_CURRENT_OUT] * rimon * gimon, 1000000000000);
+	info->m[PSC_POWER] = DIV_ROUND_CLOSEST_ULL((u64)
+		info->m[PSC_POWER] * rimon * gimon, 1000000000000);
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct of_device_id xdp720_of_match[] = {
+	{ .compatible = "infineon,xdp720" },
+	{}
+};
+
+static const struct i2c_device_id xdp720_id[] = {
+	{ "xdp720" },
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, xdp720_id);
+
+static struct i2c_driver xdp720_driver = {
+	.driver = {
+		   .name = "xdp720",
+		   .of_match_table = xdp720_of_match,
+	},
+	.probe = xdp720_probe,
+	.id_table = xdp720_id,
+};
+
+module_i2c_driver(xdp720_driver);
+
+MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
+MODULE_DESCRIPTION("PMBus driver for Infineon Digital eFuse Controller");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.39.5

