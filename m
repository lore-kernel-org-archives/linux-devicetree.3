Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04822874F8
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550307; cv=none; b=sFakty8SbFRuRt+hE3HovXM6uTAg6V+17FFG4+kv0ZaiAR+AzcDyUE3cJcmdPUQMKJKQBrRd2YLnUf05wTqNNpXC8RWl8+UU4J3LQMrKTnj/HN5gix5T+o/YoVGexDdOG3OlfLSxdWJrtRSVrAasGhJNBHEv8xZ9wzbQLWSB9WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550307; c=relaxed/simple;
	bh=8GA+44Msk8RirdcVaycxf84DP7nx2pqE+keaYyNzzKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QxvRPL8Evvuqd7fQYRibMKt9pfp13Blkz8PhetkZ2SSPK3Y//tYsa2bUMe1et4pivYY9gdn4fVGjlUUh07MeGMjuy716zoH0sdrjMLAm85J0c59BVz5+QMU7SHuKdYamRi9SEJP5zzFm8NPXl/MDS6N7uNEiy6k1tiN0nq2Y8iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=XxF2RQgc; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="XxF2RQgc"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c19d23b19so8401264c88.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 18:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778550302; x=1779155102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kexuGnZ7n87Q9HMmGJjCKYJSXcGHSGXz2FL5A1FkJjs=;
        b=XxF2RQgcq4UuWRom88oejx1V8nicopFsxpvN1xlg132Iu/4DoTjsYtOij6LWmyg44g
         wpKgPWYpoKkGdzsj/MWMcgzAxE12VY361m+Be3XheWYyN/LfdvUKLG5FVqqM0GRl73ut
         mWVu8wJ6NS3e1V4C87SCStLrZQtWPmyxUkq9NKocmpuSbAlgVJnWMFTQRFFaYMn+GoTZ
         THWZbbC6MBCd2lerR63MROYcd+B4nRlk+71ogD30hIOpFYetdZ1d3WUbsxRECGf179AN
         dcZk/sDcIRi5S7K2EuWwfVJcEcaudqPWMA3+wpq43ks1G2jrnSJQsYcFf7LcpqWCoVvH
         WDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778550302; x=1779155102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kexuGnZ7n87Q9HMmGJjCKYJSXcGHSGXz2FL5A1FkJjs=;
        b=AoulvqYNOQnMhWLgJXrMZoTRRdBUCT356eGCQg5Vu0ZbaCvYJ1c5NBGN9Q05O85cuN
         +R8egXhjE5zsVn6W/jLI8tPlucr+sUpVL4/XaIGt2n04jH4pvTqeZJIDeQge7nXpqxis
         V4/FtVHRxND3atR3J8JfvlyKEcc9ErhwEi9S/2shJAUyAp+Khux0mvm9GSpbSR8SqmnC
         TgWM2JnOvY++4kNLfBfhxfTCLnlwg/8W8oluUNz8BOfibob5NyruidLb98Qhe0HFaWCJ
         ERgNi+2InPrJcV2379SyivXs51Te2mOC/7xRVEPkM43k0HISjEWWYCaocDWYdfy2G6yN
         VY9g==
X-Forwarded-Encrypted: i=1; AFNElJ+X03wWqk5JdFjl4Wip34M5aC5Bsj+z55JOTNjggFayn+dGmInDvRt5iaomAFID1+iszjVWyewt2cdR@vger.kernel.org
X-Gm-Message-State: AOJu0YzWnWjbm1AMWVStYGx6Opg6rB9CTS2H7+KLAQ8UleSgwA4fhyO9
	ZzMmacx/nDYtsm1x5v1IiirODSJ+bIV49a8NTYVjLTZzbumSesxX4r8R3f3xgHd3rNCnb6qmAuU
	2l6ORokc=
X-Gm-Gg: Acq92OFeCBSBFcPc28/z2jRzP365K2sy/nD/OznIVGjN94/SD4ySRyeta5v5r7JKvWh
	pxa96M97fo8Hrp+yyf3cWOr2IVilOCen7b9o0DiOFUFEk6yjh991Ihq0FTOX3TwBOlOJAWcAHV9
	5WK9qh1lLRKaJNhYfnFHf34ePTPYeEKz8xZ5KqLnz+avmFhzV+EFbjNus6CGej32h63NRo7r6h3
	2NmFh1ZZQKXpoRgdS+eNAMkmvRzbWQPQ4a6kaDpkkB7Ud20zGNh7vf3VCKsVMnGx9SBsEcdg+Pa
	D0pslbOqfurMZcYBHtzBBVKZpa0NNzjTC9WfkdOE9wTzFT3JsQA5qzvvP0uIwmLHGFQXpDovKfj
	Ik7uY5x7H2NezkKiqlZgSqJqozuoxMG126xO3YhajwEWZqqGUGISI5lJvRHAKNGVlC+9BADm6gh
	dLr1t5lFYqvbVwwJoTgNlKgGoSr3GhwdKHjq0U
X-Received: by 2002:a05:7022:4182:b0:12c:3d3c:ac08 with SMTP id a92af1059eb24-131967d7b58mr12705209c88.4.1778550302351;
        Mon, 11 May 2026 18:45:02 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e4016asm15815467eec.28.2026.05.11.18.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:45:01 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 11 May 2026 18:44:28 -0700
Subject: [PATCH 2/2] hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-d1u74t-v1-2-623c2bc1532a@nexthop.ai>
References: <20260511-d1u74t-v1-0-623c2bc1532a@nexthop.ai>
In-Reply-To: <20260511-d1u74t-v1-0-623c2bc1532a@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778550299; l=8057;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=8GA+44Msk8RirdcVaycxf84DP7nx2pqE+keaYyNzzKA=;
 b=UxvQKVD046/J9KK1fnfW0gRoNRK/36foCFIwEaQMsSinWPUuofZBGieYEj+mTgqO+JswwMIWE
 32Xv1igd5DyAIaqSlHeYRiI9HQyZLri5JB24hDfn4AVlMYmTz0niJ6Z
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add PMBUS driver for Murata D1U74T power supplies.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/hwmon/d1u74t.rst | 97 ++++++++++++++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst  |  1 +
 MAINTAINERS                    |  2 +
 drivers/hwmon/pmbus/Kconfig    |  9 ++++
 drivers/hwmon/pmbus/Makefile   |  1 +
 drivers/hwmon/pmbus/d1u74t.c   | 85 ++++++++++++++++++++++++++++++++++++
 6 files changed, 195 insertions(+)

diff --git a/Documentation/hwmon/d1u74t.rst b/Documentation/hwmon/d1u74t.rst
new file mode 100644
index 000000000000..f7786ebba0b4
--- /dev/null
+++ b/Documentation/hwmon/d1u74t.rst
@@ -0,0 +1,97 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver d1u74t
+==================
+
+Supported chips:
+
+  * Murata D1U74T
+
+    Prefix: 'd1u74t'
+
+    Addresses scanned: -
+
+    Datasheet: Only available under NDA.
+
+Authors:
+    Abdurrahman Hussain <abdurrahman@nexthop.ai>
+
+
+Description
+-----------
+
+This driver implements support for Murata D1U74T Power Supply with
+PMBus support.
+
+The driver is a client driver to the core PMBus driver.
+Please see Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
+
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
+details.
+
+
+Sysfs entries
+-------------
+
+======================= ======================================================
+curr1_label		"iin"
+curr1_input		Measured input current
+curr1_max		Maximum input current
+curr1_max_alarm		Input maximum current high alarm
+curr1_crit		Critical high input current
+curr1_crit_alarm	Input critical current high alarm
+curr1_rated_max		Maximum rated input current
+
+curr2_label		"iout1"
+curr2_input		Measured output current
+curr2_max		Maximum output current
+curr2_max_alarm		Output maximum current high alarm
+curr2_crit		Critical high output current
+curr2_crit_alarm	Output critical current high alarm
+curr2_rated_max		Maximum rated output current
+
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_crit		Critical input over voltage
+in1_crit_alarm		Critical input over voltage alarm
+in1_max			Maximum input over voltage
+in1_max_alarm		Maximum input over voltage alarm
+in1_rated_min		Minimum rated input voltage
+in1_rated_max		Maximum rated input voltage
+
+in2_label		"vout1"
+in2_input		Measured input voltage
+in2_crit		Critical input over voltage
+in2_crit_alarm		Critical input over voltage alarm
+in2_lcrit		Critical input under voltage fault
+in2_lcrit_alarm		Critical input under voltage fault alarm
+in2_max			Maximum input over voltage
+in2_max_alarm		Maximum input over voltage alarm
+in2_min			Minimum input under voltage warning
+in2_min_alarm		Minimum input under voltage warning alarm
+in2_rated_min		Minimum rated input voltage
+in2_rated_max		Maximum rated input voltage
+
+power1_label		"pin"
+power1_input		Measured input power
+power1_alarm		Input power high alarm
+power1_max  		Maximum input power
+power1_rated_max	Maximum rated input power
+
+temp[1-3]_input		Measured temperature
+temp[1-3]_crit 		Critical temperature
+temp[1-3]_crit_alarm	Critical temperature alarm
+temp[1-3]_max		Maximum temperature
+temp[1-3]_max_alarm	Maximum temperature alarm
+temp[1-3]_rated_max	Maximum rated temperature
+
+fan1_alarm		Fan 1 warning.
+fan1_fault		Fan 1 fault.
+fan1_input		Fan 1 speed in RPM.
+fan1_target		Fan 1 target.
+======================= ======================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 8b655e5d6b68..97b1ef65b1c1 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -60,6 +60,7 @@ Hardware Monitoring Kernel Drivers
    corsair-psu
    cros_ec_hwmon
    crps
+   d1u74t
    da9052
    da9055
    dell-smm-hwmon
diff --git a/MAINTAINERS b/MAINTAINERS
index b6a055fbb870..8f443a2f0e45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6808,6 +6808,8 @@ M:	Abdurrahman Hussain <abdurrahman@nexthop.ai>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/hwmon/pmbus/murata,d1u74t.yaml
+F:	Documentation/hwmon/d1u74t.rst
+F:	drivers/hwmon/pmbus/d1u74t.c
 
 CRYPTO API
 M:	Herbert Xu <herbert@gondor.apana.org.au>
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 8f4bff375ecb..ee93b22d2887 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -113,6 +113,15 @@ config SENSORS_CRPS
 	  This driver can also be built as a module. If so, the module will
 	  be called crps.
 
+config SENSORS_D1U74T
+	tristate "Murata D1U74T Power Supply"
+	help
+	  If you say yes here you get hardware monitoring support for the Murata
+	  D1U74T Power Supply.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called d1u74t.
+
 config SENSORS_DELTA_AHE50DC_FAN
 	tristate "Delta AHE-50DC fan control module"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 7129b62bc00f..8cf7d3075371 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -76,3 +76,4 @@ obj-$(CONFIG_SENSORS_XDPE1A2G7B)	+= xdpe1a2g7b.o
 obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
 obj-$(CONFIG_SENSORS_PIM4328)	+= pim4328.o
 obj-$(CONFIG_SENSORS_CRPS)	+= crps.o
+obj-$(CONFIG_SENSORS_D1U74T)	+= d1u74t.o
diff --git a/drivers/hwmon/pmbus/d1u74t.c b/drivers/hwmon/pmbus/d1u74t.c
new file mode 100644
index 000000000000..3127e0e5a23d
--- /dev/null
+++ b/drivers/hwmon/pmbus/d1u74t.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2026 Nexthop Systems.
+ */
+
+#include <linux/i2c.h>
+#include <linux/of.h>
+#include <linux/pmbus.h>
+
+#include "pmbus.h"
+
+static const struct i2c_device_id d1u74t_id[] = {
+	{ "d1u74t" },
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, d1u74t_id);
+
+static struct pmbus_driver_info d1u74t_info = {
+	.pages = 1,
+	/* PSU uses default linear data format. */
+	.func[0] = PMBUS_HAVE_PIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		   PMBUS_HAVE_IIN | PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
+		   PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_TEMP |
+		   PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
+		   PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_FAN12 |
+		   PMBUS_HAVE_STATUS_FAN12,
+};
+
+static int d1u74t_probe(struct i2c_client *client)
+{
+	char buf[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
+	struct device *dev = &client->dev;
+	int rc;
+
+	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	if (rc < 0)
+		return dev_err_probe(dev, rc, "Failed to read PMBUS_MFR_ID\n");
+
+	if (rc != 9 || strncmp(buf, "Murata-PS", 9)) {
+		buf[rc] = '\0';
+		dev_err(dev, "Unsupported Manufacturer ID '%s'\n", buf);
+		return -ENODEV;
+	}
+
+	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	if (rc < 0)
+		return dev_err_probe(dev, rc,
+				     "Failed to read PMBUS_MFR_MODEL\n");
+
+	if (strncmp(buf, "D1U74T-W", 8)) {
+		buf[rc] = '\0';
+		return dev_err_probe(dev, -ENODEV, "Model '%s' not supported\n",
+				     buf);
+	}
+
+	rc = pmbus_do_probe(client, &d1u74t_info);
+	if (rc)
+		return dev_err_probe(dev, rc, "Failed to probe\n");
+
+	return 0;
+}
+
+static const struct of_device_id d1u74t_of_match[] = {
+	{
+		.compatible = "murata,d1u74t",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, d1u74t_of_match);
+
+static struct i2c_driver d1u74t_driver = {
+	.driver = {
+		.name = "d1u74t",
+		.of_match_table = d1u74t_of_match,
+	},
+	.probe = d1u74t_probe,
+	.id_table = d1u74t_id,
+};
+
+module_i2c_driver(d1u74t_driver);
+
+MODULE_AUTHOR("Abdurrahman Hussain");
+MODULE_DESCRIPTION("PMBus driver for Murata D1U74T-W power supplies");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");

-- 
2.53.0

