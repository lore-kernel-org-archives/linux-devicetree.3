Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCA343F4DF;
	Tue, 14 Jul 2026 09:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021215; cv=none; b=lYr8PbAwETL9GTsrDtk/QwnWbL96N9EtBOh+cNhzIAxorPHkJKlnfbTPykTrs50JzHjUW4O0go0Ku/Sx+7rbqThZpbMO+0JNeFox5qB1CnevsRv4/c47vI0+bdWC38jruM/vgvGi7BNlDUKq1k3nyEbP81bC0M3h0e24JDo3bSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021215; c=relaxed/simple;
	bh=PEO/zpMGRltw6szxIm5MS8MHeIz3/jB/dmjOihGnfas=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cyniycfMsovsdpQW/sPj1YEj0NlR4LGlg9zhXxrokXX9hYoy7TPJqPnY+ETayQ0awb31fmpzFAjNIN7+53ZjVVB/3X3rIzkVk1VoSeJwqFB6v9mPxnuhCX1lbNbuLcyypPVXJlzaI3K/6bmg7y/iugGoiZHRXC77N/6Rs3l7duA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 14536200029;
	Tue, 14 Jul 2026 11:21:04 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CFEBA20005B;
	Tue, 14 Jul 2026 11:21:03 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 7E41218000B5;
	Tue, 14 Jul 2026 17:21:02 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v14 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator
Date: Tue, 14 Jul 2026 14:50:49 +0530
Message-Id: <20260714092053.2461482-5-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

Add core MFD support for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
family of multiport I3C hub devices. These devices connect to a host via
I3C/I2C/SMBus and expose multiple downstream target ports.

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---
Changes in v14:
 - Clean up MFD driver comments, formatting, variable names and author
   information
 - Define and document the I3C hub DCR value in hexadecimal form
 - Use direct regmap bit-width values instead of local macros
 - Add a shared protected_reg_lock for protected register accesses across
   P3H2X4X child drivers

Changes in v13:
 - Use i3c_device helpers (i3cdev_to_dev()) instead of direct struct access
   to maintain API abstraction
 - Avoid including internal I3C headers and use public device headers instead
 - Ensure proper device matching by relying on manufacturer ID checks in probe

Changes in v12:
 - No change, added Reviewed-By tag

Changes in v11:
 - Use MFD_CELL_NAME() for child device registration
 - Rename local variables for consistency
 - Rename driver names to follow subsystem conventions:
   - Use '-' instead of '_' in driver names
   - Drop the "_drv" suffix from driver names

Changes in v10:
 - Drop redundant is_p3h2x4x_in_i3c flag

Changes in v9:
 - Renamed macros to follow consistent uppercase naming conventions
 - Made REGMAP selects in the P3H2X4X MFD Kconfig conditional,
   to avoid I3C/I2C dependency issues

Changes in v8:
 - No change

Changes in v7:
 - Use new config I3C_OR_I2C

Changes in v6:
 - No change

Changes in v5:
 - Corrected the ordering in the Makefile and Kconfig for MFD_P3H2X4X
 - Updated dev_err_probe() for regmap_init failure.
 - Updated module description

Changes in v4:
 - Split the driver into three separate patches(mfd, regulator and I3C hub)
 - Added support for NXP P3H2x4x MFD functionality
---
---
 MAINTAINERS                 |   2 +
 drivers/mfd/Kconfig         |  13 ++++
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/p3h2840.c       | 139 ++++++++++++++++++++++++++++++++++++
 include/linux/i3c/device.h  |   2 +
 include/linux/mfd/p3h2840.h |  25 +++++++
 6 files changed, 182 insertions(+)
 create mode 100644 drivers/mfd/p3h2840.c
 create mode 100644 include/linux/mfd/p3h2840.h

diff --git a/MAINTAINERS b/MAINTAINERS
index ba65ae5a008b..3420701a75c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19311,6 +19311,8 @@ L:	linux-kernel@vger.kernel.org
 L:	linux-i3c@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
+F:	drivers/mfd/p3h2840.c
+F:	include/linux/mfd/p3h2840.h
 
 NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
 M:	Woodrow Douglass <wdouglass@carnegierobotics.com>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 7192c9d1d268..405b50c3c77b 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -617,6 +617,19 @@ config MFD_MX25_TSADC
 	  i.MX25 processors. They consist of a conversion queue for general
 	  purpose ADC and a queue for Touchscreens.
 
+config MFD_P3H2X4X
+	tristate "NXP P3H2X4X I3C Hub Device"
+	depends on I3C_OR_I2C
+	select MFD_CORE
+	select REGMAP_I3C if I3C
+	select REGMAP_I2C if I2C
+	help
+	  Enable Support for NXP P3H244x/P3H284x I3C HUB device using I3C/I2C
+	  communication interface.
+
+	  This driver provides support for I3C hub and regulator, each subdriver
+	  can be enabled independently depending on the required functionality.
+
 config MFD_PF1550
 	tristate "NXP PF1550 PMIC Support"
 	depends on I2C=y && OF
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e75e8045c28a..a284b22c7b13 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -122,6 +122,7 @@ obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
 obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
 obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 
+obj-$(CONFIG_MFD_P3H2X4X)	+= p3h2840.o
 obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
 
 obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
diff --git a/drivers/mfd/p3h2840.c b/drivers/mfd/p3h2840.c
new file mode 100644
index 000000000000..652077408dbd
--- /dev/null
+++ b/drivers/mfd/p3h2840.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025-2026 NXP
+ *
+ * Authors:
+ *	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
+ *	Vikash Bansal <vikash.bansal@nxp.com>
+ *	Lakshay Piplani <lakshay.piplani@nxp.com>
+ *
+ * P3H2X4X multi-function device driver.
+ */
+#include <linux/i2c.h>
+#include <linux/i3c/device.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/p3h2840.h>
+#include <linux/regmap.h>
+
+static const struct mfd_cell p3h2x4x_devs[] = {
+	MFD_CELL_NAME("p3h2x4x-regulator"),
+	MFD_CELL_NAME("p3h2x4x-i3c-hub"),
+};
+
+static const struct regmap_config p3h2x4x_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xFF,
+};
+
+static int p3h2x4x_device_probe_i3c(struct i3c_device *i3cdev)
+{
+	struct device *dev = i3cdev_to_dev(i3cdev);
+	struct i3c_device_info devinfo;
+	struct p3h2x4x *ddata;
+	int ret;
+
+	i3c_device_get_info(i3cdev, &devinfo);
+
+	if (I3C_PID_MANUF_ID(devinfo.pid) != I3C_MANUF_ID_NXP)
+		return -ENODEV;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(dev, &ddata->protected_reg_lock);
+	if (ret)
+		return ret;
+
+	i3cdev_set_drvdata(i3cdev, ddata);
+
+	ddata->regmap = devm_regmap_init_i3c(i3cdev, &p3h2x4x_regmap_config);
+	if (IS_ERR(ddata->regmap))
+		return dev_err_probe(dev, PTR_ERR(ddata->regmap),
+				     "Failed to register HUB regmap\n");
+
+	/* The hub child driver retrieves information from i3cdev. */
+	ddata->i3cdev = i3cdev;
+
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+				   p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs),
+				   NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add sub devices\n");
+
+	return 0;
+}
+
+static int p3h2x4x_device_probe_i2c(struct i2c_client *client)
+{
+	struct p3h2x4x *ddata;
+	int ret;
+
+	ddata = devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(&client->dev, &ddata->protected_reg_lock);
+	if (ret)
+		return ret;
+
+	i2c_set_clientdata(client, ddata);
+
+	ddata->regmap = devm_regmap_init_i2c(client, &p3h2x4x_regmap_config);
+	if (IS_ERR(ddata->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(ddata->regmap),
+				     "Failed to register HUB regmap\n");
+
+	ddata->i3cdev = NULL;
+
+	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
+				   p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs),
+				   NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to add sub devices\n");
+
+	return 0;
+}
+
+static const struct i3c_device_id p3h2x4x_i3c_ids[] = {
+	I3C_CLASS(I3C_DCR_HUB, NULL),
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(i3c, p3h2x4x_i3c_ids);
+
+static const struct i2c_device_id p3h2x4x_i2c_id_table[] = {
+	{ "nxp-i3c-hub" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, p3h2x4x_i2c_id_table);
+
+static const struct of_device_id p3h2x4x_i2c_of_match[] = {
+	{ .compatible = "nxp,p3h2840", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, p3h2x4x_i2c_of_match);
+
+static struct i3c_driver p3h2x4x_i3c = {
+	.driver = {
+		.name = "p3h2x4x-i3c",
+	},
+	.probe = p3h2x4x_device_probe_i3c,
+	.id_table = p3h2x4x_i3c_ids,
+};
+
+static struct i2c_driver p3h2x4x_i2c = {
+	.driver = {
+		.name = "p3h2x4x-i2c",
+		.of_match_table = p3h2x4x_i2c_of_match,
+	},
+	.probe = p3h2x4x_device_probe_i2c,
+	.id_table = p3h2x4x_i2c_id_table,
+};
+module_i3c_i2c_driver(p3h2x4x_i3c, &p3h2x4x_i2c);
+
+MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
+MODULE_AUTHOR("Vikash Bansal <vikash.bansal@nxp.com>");
+MODULE_AUTHOR("Lakshay Piplani <lakshay.piplani@nxp.com>");
+MODULE_DESCRIPTION("NXP P3H2X4X I3C HUB multi function driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index 971d53349b6f..1dcfc4cc1cef 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -82,9 +82,11 @@ struct i3c_xfer {
 /**
  * enum i3c_dcr - I3C DCR values
  * @I3C_DCR_GENERIC_DEVICE: generic I3C device
+ * @I3C_DCR_HUB: I3C hub device
  */
 enum i3c_dcr {
 	I3C_DCR_GENERIC_DEVICE = 0,
+	I3C_DCR_HUB = 0xC2,
 };
 
 #define I3C_PID_MANUF_ID(pid)		(((pid) & GENMASK_ULL(47, 33)) >> 33)
diff --git a/include/linux/mfd/p3h2840.h b/include/linux/mfd/p3h2840.h
new file mode 100644
index 000000000000..ba9a38756ecb
--- /dev/null
+++ b/include/linux/mfd/p3h2840.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2025-2026 NXP
+ */
+
+#ifndef _LINUX_MFD_P3H2840_H
+#define _LINUX_MFD_P3H2840_H
+
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+/* Device Configuration Registers */
+#define P3H2X4X_DEV_REG_PROTECTION_CODE				0x10
+#define P3H2X4X_REGISTERS_LOCK_CODE				0x00
+#define P3H2X4X_REGISTERS_UNLOCK_CODE				0x69
+#define P3H2X4X_CP1_REGISTERS_UNLOCK_CODE			0x6a
+
+#define I3C_MANUF_ID_NXP					0x011b
+
+struct p3h2x4x {
+	struct i3c_device *i3cdev;
+	struct regmap *regmap;
+	struct mutex protected_reg_lock; /* Serializes protected register unlock/lock sequences. */
+};
+#endif /* _LINUX_MFD_P3H2840_H */
-- 
2.25.1

