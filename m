Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747B4381AF1;
	Mon, 20 Apr 2026 11:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776682927; cv=none; b=UFWlOtBbA3virFtgdXiF5Ic0bUxwFGqZibVS2B65kROqvPToJ8vKqFOC93SqK002LgFxs298PHh+ka7bvNeXlwZ8pXm9HaTI+MN2sJqpjsuHY8Db7TgELzy9ykvSy1d6vRLQqkXcf0J/JLjfnH/hXXuzPSlZna9DNQX6a8eBUaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776682927; c=relaxed/simple;
	bh=JBqC7A7VraPKmGUoWxqyPyOHb+3UT36bIzasTeq8axE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M6jkEDvROvlJPEphE2fnyugvOWMoPL8n7UgSYw2Zr7TzN7I+jafH5Hv2hwbn0jRC0iyrvI8ocCBA1ZoVO4oZ9gnkPkevBkd/4lZni0fe0I8lnNVl2oWr4/4+XGnLZHgWX6h9jIVZOGIGZBVPAfvl9ObiZfqoztBqoK32mzM5qqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0BCE920030A;
	Mon, 20 Apr 2026 12:52:48 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9A2412002FA;
	Mon, 20 Apr 2026 12:52:47 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 3DF2D1800257;
	Mon, 20 Apr 2026 18:52:46 +0800 (+08)
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
Subject: [PATCH v9 6/7] i3c: hub: Add support for the I3C interface in the I3C hub
Date: Mon, 20 Apr 2026 16:22:21 +0530
Message-Id: <20260420105222.1562243-7-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260420105222.1562243-1-lakshay.piplani@nxp.com>
References: <20260420105222.1562243-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Add virtual I3C bus support for the hub and provide interface to enable
or disable downstream ports.

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>

---
Changes in v9:
 - No change

Changes in v8:
 - No change

Changes in v7:
 - Convert Kconfig option to tristate
 - Fix signedness issue in return value
 - Fix kernel-doc warnings

Changes in v6:
 - Add support for the generic I3C interface in the I3C Hub
---
---
 MAINTAINERS             |   2 +
 drivers/i3c/Kconfig     |  15 ++
 drivers/i3c/Makefile    |   1 +
 drivers/i3c/hub.c       | 460 ++++++++++++++++++++++++++++++++++++++++
 include/linux/i3c/hub.h | 107 ++++++++++
 5 files changed, 585 insertions(+)
 create mode 100644 drivers/i3c/hub.c
 create mode 100644 include/linux/i3c/hub.h

diff --git a/MAINTAINERS b/MAINTAINERS
index b2119fadef7b..bb3e8e9674c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19274,8 +19274,10 @@ L:	linux-kernel@vger.kernel.org
 L:	linux-i3c-owner@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
+F:	drivers/i3c/hub.c
 F:	drivers/mfd/p3h2840.c
 F:	drivers/regulator/p3h2840_i3c_hub_regulator.c
+F:	include/linux/i3c/hub.h
 F:	include/linux/mfd/p3h2840.h
 
 NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
index 626c54b386d5..65304b416bb4 100644
--- a/drivers/i3c/Kconfig
+++ b/drivers/i3c/Kconfig
@@ -21,6 +21,21 @@ menuconfig I3C
 
 if I3C
 source "drivers/i3c/master/Kconfig"
+
+config I3C_HUB
+	tristate "I3C Hub Support"
+	depends on I3C
+	help
+	  Enable support for the I3C interface in hub devices.
+
+	  This option adds virtual I3C bus support for hubs by creating
+	  virtual master controllers for downstream ports and forwarding
+	  bus operations through the hub device. It also provides an
+	  interface used by hub drivers to enable or disable downstream
+	  ports during bus transactions.
+
+	  Say Y here if your platform includes an I3C hub device
+
 endif # I3C
 
 config I3C_OR_I2C
diff --git a/drivers/i3c/Makefile b/drivers/i3c/Makefile
index 11982efbc6d9..9ddee56a6338 100644
--- a/drivers/i3c/Makefile
+++ b/drivers/i3c/Makefile
@@ -2,3 +2,4 @@
 i3c-y				:= device.o master.o
 obj-$(CONFIG_I3C)		+= i3c.o
 obj-$(CONFIG_I3C)		+= master/
+obj-$(CONFIG_I3C_HUB)		+= hub.o
diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
new file mode 100644
index 000000000000..67c5d2695a61
--- /dev/null
+++ b/drivers/i3c/hub.c
@@ -0,0 +1,460 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2026 NXP
+ * Generic I3C Hub core implementing virtual controller operations.
+ */
+#include <linux/i3c/device.h>
+#include <linux/i3c/hub.h>
+
+#include "internals.h"
+
+/**
+ * i3c_hub_master_bus_init() - Bind controller to hub device
+ * @controller: Virtual controller for a hub port
+ *
+ * Associates the virtual controller with the hub device descriptor so that
+ * transfers are executed through the hub on the parent bus.
+ */
+static int i3c_hub_master_bus_init(struct i3c_master_controller *controller)
+{
+	struct i3c_hub_controller *hub_controller;
+	struct i3c_hub *hub;
+
+	hub_controller = dev_get_drvdata(&controller->dev);
+	if (!hub_controller || !hub_controller->hub)
+		return -ENODEV;
+
+	hub = hub_controller->hub;
+
+	if (!hub->hub_dev)
+		return -ENODEV;
+
+	controller->this = hub->hub_dev->desc;
+	return 0;
+}
+
+static void i3c_hub_master_bus_cleanup(struct i3c_master_controller *controller)
+{
+	controller->this = NULL;
+}
+
+static int i3c_hub_attach_i3c_dev(struct i3c_dev_desc *dev)
+{
+	return 0;
+}
+
+static int i3c_hub_reattach_i3c_dev(struct i3c_dev_desc *dev, u8 old_dyn_addr)
+{
+	return 0;
+}
+
+static void i3c_hub_detach_i3c_dev(struct i3c_dev_desc *dev)
+{
+}
+
+/**
+ * i3c_hub_do_daa() - Perform DAA via hub port
+ * @hub: Hub instance
+ * @controller: Virtual controller for a hub port
+ *
+ * Enables the port connection, performs DAA on the parent controller,
+ * then disables the connection.
+ */
+static int i3c_hub_do_daa(struct i3c_hub *hub,
+			  struct i3c_master_controller *controller)
+{
+	int ret;
+
+	if (!hub || !hub->parent)
+		return -ENODEV;
+
+	i3c_hub_enable_port(controller);
+	ret = i3c_master_do_daa(hub->parent);
+	i3c_hub_disable_port(controller);
+
+	return ret;
+}
+
+static bool i3c_hub_supports_ccc_cmd(struct i3c_hub *hub,
+				     const struct i3c_ccc_cmd *cmd)
+{
+	return i3c_master_supports_ccc_cmd(hub->parent, cmd);
+}
+
+/**
+ * i3c_hub_send_ccc_cmd() - Send CCC through hub port
+ * @hub: Hub instance
+ * @controller: Virtual controller
+ * @cmd: CCC command
+ *
+ * Enables the port connection while issuing CCC on the parent controller.
+ */
+static int i3c_hub_send_ccc_cmd(struct i3c_hub *hub,
+				struct i3c_master_controller *controller,
+				struct i3c_ccc_cmd *cmd)
+{
+	int ret;
+
+	if (!hub || !hub->parent)
+		return -ENODEV;
+
+	i3c_hub_enable_port(controller);
+	ret = i3c_master_send_ccc_cmd(hub->parent, cmd);
+	i3c_hub_disable_port(controller);
+
+	return ret;
+}
+
+/**
+ * i3c_hub_master_priv_xfers() - Execute private transfers via hub
+ * @dev: Target device descriptor
+ * @xfers: Transfer array
+ * @nxfers: Number of transfers
+ * @mode: transfer mode (SDR, HDR, etc.)
+ *
+ * Handles address adjustment and forwards private transfers through the hub
+ * device.
+ */
+static int i3c_hub_master_priv_xfers(struct i3c_dev_desc *dev,
+				     struct i3c_xfer *xfers,
+				     int nxfers,
+				     enum i3c_xfer_mode mode)
+{
+	struct i3c_master_controller *controller = i3c_dev_get_master(dev);
+	struct i3c_hub_controller *hub_controller;
+	struct i3c_dev_desc *hub_dev;
+	u8 hub_addr, target_addr;
+	struct i3c_hub *hub;
+	int ret;
+
+	hub_controller = dev_get_drvdata(&controller->dev);
+	if (!hub_controller || !hub_controller->hub)
+		return -ENODEV;
+
+	hub = hub_controller->hub;
+
+	if (!hub->hub_dev)
+		return -ENODEV;
+
+	hub_dev = hub->hub_dev->desc;
+
+	i3c_hub_enable_port(controller);
+
+	hub_addr = hub_dev->info.dyn_addr ?
+		   hub_dev->info.dyn_addr : hub_dev->info.static_addr;
+
+	target_addr = dev->info.dyn_addr ?
+		      dev->info.dyn_addr : dev->info.static_addr;
+
+	if (hub_addr != target_addr) {
+		hub_dev->info.dyn_addr = target_addr;
+		ret = i3c_master_reattach_i3c_dev(hub_dev, target_addr);
+		if (ret)
+			goto disable;
+	}
+
+	ret = i3c_device_do_xfers(hub->hub_dev, xfers, nxfers, mode);
+
+	if (hub_addr != target_addr) {
+		hub_dev->info.dyn_addr = hub_addr;
+		ret |= i3c_master_reattach_i3c_dev(hub_dev, hub_addr);
+	}
+
+disable:
+	i3c_hub_disable_port(controller);
+	return ret;
+}
+
+static int i3c_hub_attach_i2c_dev(struct i2c_dev_desc *dev)
+{
+	return 0;
+}
+
+static void i3c_hub_detach_i2c_dev(struct i2c_dev_desc *dev)
+{
+}
+
+static int i3c_hub_i2c_xfers(struct i2c_dev_desc *dev,
+			     struct i2c_msg *xfers, int nxfers)
+{
+	return 0;
+}
+
+static int i3c_hub_master_do_daa(struct i3c_master_controller *controller)
+{
+	struct i3c_hub_controller *hub_controller;
+	struct i3c_hub *hub;
+
+	hub_controller = dev_get_drvdata(&controller->dev);
+	if (!hub_controller || !hub_controller->hub)
+		return -ENODEV;
+
+	hub = hub_controller->hub;
+
+	return i3c_hub_do_daa(hub, controller);
+}
+
+static int i3c_hub_master_send_ccc_cmd(struct i3c_master_controller *controller,
+				       struct i3c_ccc_cmd *cmd)
+{
+	struct i3c_hub_controller *hub_controller;
+	struct i3c_hub *hub;
+
+	hub_controller = dev_get_drvdata(&controller->dev);
+	if (!hub_controller || !hub_controller->hub)
+		return -ENODEV;
+
+	hub = hub_controller->hub;
+
+	if (!hub->parent)
+		return -ENODEV;
+
+	if (cmd->id == I3C_CCC_RSTDAA(true))
+		return 0;
+
+	return i3c_hub_send_ccc_cmd(hub, controller, cmd);
+}
+
+static bool i3c_hub_master_supports_ccc_cmd(struct i3c_master_controller *controller,
+					    const struct i3c_ccc_cmd *cmd)
+{
+	struct i3c_hub_controller *hub_controller;
+	struct i3c_hub *hub;
+
+	hub_controller = dev_get_drvdata(&controller->dev);
+	if (!hub_controller || !hub_controller->hub)
+		return false;
+
+	hub = hub_controller->hub;
+
+	return i3c_hub_supports_ccc_cmd(hub, cmd);
+}
+
+/**
+ * i3c_hub_request_ibi() - Request IBI through parent controller
+ * @desc: Target device descriptor
+ * @req: IBI setup
+ *
+ * Temporarily updates parent controller context to request IBI for a device
+ * connected through the hub.
+ */
+static int i3c_hub_request_ibi(struct i3c_dev_desc *desc,
+			       const struct i3c_ibi_setup *req)
+{
+	struct i3c_master_controller *controller = i3c_dev_get_master(desc);
+	struct i3c_hub_controller *hub_controller;
+	struct i3c_master_controller *orig_parent;
+	struct i3c_master_controller *parent;
+	struct i3c_hub *hub;
+	int ret;
+
+	hub_controller = dev_get_drvdata(&controller->dev);
+	if (!hub_controller || !hub_controller->hub)
+		return -ENODEV;
+
+	hub = hub_controller->hub;
+
+	if (!hub->parent)
+		return -ENODEV;
+
+	parent = hub->parent;
+
+	orig_parent = i3c_hub_update_desc_parent(&desc->common, parent);
+
+	ret = i3c_master_direct_attach_i3c_dev(parent, desc);
+	if (ret) {
+		i3c_hub_restore_desc_parent(&desc->common, orig_parent);
+		return ret;
+	}
+
+	mutex_unlock(&desc->ibi_lock);
+	kfree(desc->ibi);
+	desc->ibi = NULL;
+	ret = i3c_dev_request_ibi_locked(desc, req);
+	mutex_lock(&desc->ibi_lock);
+
+	i3c_hub_restore_desc_parent(&desc->common, orig_parent);
+
+	return ret;
+}
+
+static void i3c_hub_free_ibi(struct i3c_dev_desc *desc)
+{
+	struct i3c_master_controller *controller = i3c_dev_get_master(desc);
+	struct i3c_hub_controller *hub_controller;
+	struct i3c_master_controller *orig_parent;
+	struct i3c_master_controller *parent;
+	struct i3c_hub *hub;
+
+	hub_controller = dev_get_drvdata(&controller->dev);
+	if (!hub_controller || !hub_controller->hub)
+		return;
+
+	hub = hub_controller->hub;
+
+	parent = hub->parent;
+
+	i3c_hub_enable_port(controller);
+
+	orig_parent = i3c_hub_update_desc_parent(&desc->common, parent);
+	i3c_master_direct_detach_i3c_dev(desc);
+	mutex_unlock(&desc->ibi_lock);
+	i3c_dev_free_ibi_locked(desc);
+	mutex_lock(&desc->ibi_lock);
+	i3c_hub_restore_desc_parent(&desc->common, orig_parent);
+
+	i3c_hub_disable_port(controller);
+}
+
+/**
+ * i3c_hub_enable_ibi() - Enable IBI via hub port
+ * @desc: Target device descriptor
+ *
+ * Enables port connection and forwards the IBI enable request to the parent
+ * controller.
+ */
+static int i3c_hub_enable_ibi(struct i3c_dev_desc *desc)
+{
+	struct i3c_master_controller *controller = i3c_dev_get_master(desc);
+	struct i3c_hub_controller *hub_controller;
+	struct i3c_master_controller *orig_parent;
+	struct i3c_master_controller *parent;
+	struct i3c_hub *hub;
+	int ret;
+
+	hub_controller = dev_get_drvdata(&controller->dev);
+	if (!hub_controller || !hub_controller->hub)
+		return -ENODEV;
+
+	hub = hub_controller->hub;
+
+	if (!hub->parent)
+		return -ENODEV;
+
+	parent = hub->parent;
+
+	i3c_hub_enable_port(controller);
+
+	orig_parent = i3c_hub_update_desc_parent(&desc->common, parent);
+
+	down_write(&parent->bus.lock);
+	mutex_unlock(&desc->ibi_lock);
+	ret = i3c_dev_enable_ibi_locked(desc);
+	mutex_lock(&desc->ibi_lock);
+	up_write(&parent->bus.lock);
+
+	i3c_hub_restore_desc_parent(&desc->common, orig_parent);
+
+	i3c_hub_disable_port(controller);
+
+	return ret;
+}
+
+/**
+ * i3c_hub_disable_ibi() - Disable IBI via hub port
+ * @desc: Target device descriptor
+ *
+ * Enables port connection and forwards the IBI disable request to the parent
+ * controller.
+ */
+static int i3c_hub_disable_ibi(struct i3c_dev_desc *desc)
+{
+	struct i3c_master_controller *controller = i3c_dev_get_master(desc);
+	struct i3c_hub_controller *hub_controller;
+	struct i3c_master_controller *orig_parent;
+	struct i3c_master_controller *parent;
+	struct i3c_hub *hub;
+	int ret;
+
+	hub_controller = dev_get_drvdata(&controller->dev);
+	if (!hub_controller || !hub_controller->hub)
+		return -ENODEV;
+
+	hub = hub_controller->hub;
+
+	if (!hub->parent)
+		return -ENODEV;
+
+	parent = hub->parent;
+
+	i3c_hub_enable_port(controller);
+
+	orig_parent = i3c_hub_update_desc_parent(&desc->common, parent);
+
+	down_write(&parent->bus.lock);
+	mutex_unlock(&desc->ibi_lock);
+	ret = i3c_dev_disable_ibi_locked(desc);
+	mutex_lock(&desc->ibi_lock);
+	up_write(&parent->bus.lock);
+
+	i3c_hub_restore_desc_parent(&desc->common, orig_parent);
+
+	i3c_hub_disable_port(controller);
+
+	return ret;
+}
+
+static void i3c_hub_recycle_ibi_slot(struct i3c_dev_desc *desc,
+				     struct i3c_ibi_slot *slot)
+{
+}
+
+static const struct i3c_master_controller_ops i3c_hub_master_ops_data = {
+	.bus_init = i3c_hub_master_bus_init,
+	.bus_cleanup = i3c_hub_master_bus_cleanup,
+	.attach_i3c_dev = i3c_hub_attach_i3c_dev,
+	.reattach_i3c_dev = i3c_hub_reattach_i3c_dev,
+	.detach_i3c_dev = i3c_hub_detach_i3c_dev,
+	.do_daa = i3c_hub_master_do_daa,
+	.supports_ccc_cmd = i3c_hub_master_supports_ccc_cmd,
+	.send_ccc_cmd = i3c_hub_master_send_ccc_cmd,
+	.i3c_xfers = i3c_hub_master_priv_xfers,
+	.attach_i2c_dev = i3c_hub_attach_i2c_dev,
+	.detach_i2c_dev = i3c_hub_detach_i2c_dev,
+	.i2c_xfers = i3c_hub_i2c_xfers,
+	.request_ibi = i3c_hub_request_ibi,
+	.free_ibi = i3c_hub_free_ibi,
+	.enable_ibi = i3c_hub_enable_ibi,
+	.disable_ibi = i3c_hub_disable_ibi,
+	.recycle_ibi_slot = i3c_hub_recycle_ibi_slot,
+};
+
+/**
+ * i3c_hub_init() - Initialize hub context
+ * @hub: Hub instance
+ * @parent: Parent I3C master controller
+ * @ops: Vendor callbacks
+ * @hub_dev: I3C hub device
+ */
+struct i3c_hub *i3c_hub_init(struct i3c_master_controller *parent,
+			     const struct i3c_hub_ops *ops,
+			     struct i3c_device *hub_dev)
+{
+	struct i3c_hub *hub;
+
+	hub = devm_kzalloc(&hub_dev->dev,
+			   sizeof(*hub),
+			   GFP_KERNEL);
+
+	if (!hub)
+		return ERR_PTR(-ENOMEM);
+
+	hub->parent = parent;
+	hub->ops = ops;
+	hub->hub_dev = hub_dev;
+
+	return hub;
+}
+EXPORT_SYMBOL_GPL(i3c_hub_init);
+
+const struct i3c_master_controller_ops *i3c_hub_master_ops(void)
+{
+	return &i3c_hub_master_ops_data;
+}
+EXPORT_SYMBOL_GPL(i3c_hub_master_ops);
+
+MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
+MODULE_AUTHOR("Vikash Bansal <vikash.bansal@nxp.com>");
+MODULE_AUTHOR("Lakshay Piplani <lakshay.piplani@nxp.com>");
+MODULE_DESCRIPTION("Generic I3C hub support");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/i3c/hub.h b/include/linux/i3c/hub.h
new file mode 100644
index 000000000000..b685d4d3cc7e
--- /dev/null
+++ b/include/linux/i3c/hub.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2026 NXP
+ * Generic hub definitions and helper interfaces.
+ */
+#ifndef _LINUX_I3C_HUB_H
+#define _LINUX_I3C_HUB_H
+
+#include <linux/i3c/master.h>
+
+static inline struct i3c_master_controller *
+i3c_hub_update_desc_parent(struct i3c_i2c_dev_desc *desc,
+			   struct i3c_master_controller *parent)
+{
+	struct i3c_master_controller *orig_parent = desc->master;
+
+	desc->master = parent;
+	return orig_parent;
+}
+
+static inline void
+i3c_hub_restore_desc_parent(struct i3c_i2c_dev_desc *desc,
+			    struct i3c_master_controller *parent)
+{
+	desc->master = parent;
+}
+
+/**
+ * struct i3c_hub - Generic I3C hub context
+ * @parent: Parent I3C master controller
+ * @ops: Vendor callbacks for port connection control
+ * @hub_dev: I3C device representing the hub on the parent bus
+ */
+struct i3c_hub {
+	struct i3c_master_controller *parent;
+	const struct i3c_hub_ops *ops;
+	struct i3c_device *hub_dev;
+};
+
+struct i3c_hub_controller {
+	struct i3c_master_controller *parent;
+	struct i3c_master_controller controller;
+	struct i3c_hub *hub;
+};
+
+struct i3c_hub_ops {
+	void (*enable_port)(struct i3c_master_controller *controller);
+	void (*disable_port)(struct i3c_master_controller *controller);
+};
+
+/**
+ * i3c_hub_enable_port() - Enable hub connection for a controller
+ * @controller: Virtual controller representing a hub port
+ *
+ * Retrieves hub context from controller drvdata and invokes the vendor
+ * callback to enable the associated port connection.
+ */
+static inline void i3c_hub_enable_port(struct i3c_master_controller *controller)
+{
+	struct i3c_hub_controller *hub_controller;
+	struct i3c_hub *hub;
+
+	hub_controller = dev_get_drvdata(&controller->dev);
+	if (!hub_controller || !hub_controller->hub)
+		return;
+
+	hub = hub_controller->hub;
+
+	if (hub && hub->ops && hub->ops->enable_port)
+		hub->ops->enable_port(controller);
+}
+
+/**
+ * i3c_hub_disable_port() - Disable hub connection for a controller
+ * @controller: Virtual controller representing a hub port
+ *
+ * Retrieves hub context from controller drvdata and invokes the vendor
+ * callback to disable the associated port connection.
+ */
+static inline void i3c_hub_disable_port(struct i3c_master_controller *controller)
+{
+	struct i3c_hub_controller *hub_controller;
+	struct i3c_hub *hub;
+
+	hub_controller = dev_get_drvdata(&controller->dev);
+	if (!hub_controller || !hub_controller->hub)
+		return;
+
+	hub = hub_controller->hub;
+
+	if (hub && hub->ops && hub->ops->disable_port)
+		hub->ops->disable_port(controller);
+}
+
+/**
+ * i3c_hub_master_ops() - Return virtual controller ops for hub ports
+ *
+ * Provides i3c_master_controller_ops used by controllers created for hub
+ * ports.
+ */
+const struct i3c_master_controller_ops *i3c_hub_master_ops(void);
+
+struct i3c_hub *i3c_hub_init(struct i3c_master_controller *parent,
+			     const struct i3c_hub_ops *ops,
+			     struct i3c_device *hub_dev);
+
+#endif
-- 
2.25.1

