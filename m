Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830643ED5B3;
	Tue, 14 Jul 2026 09:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021209; cv=none; b=bx83oIgMXi7s9MkbUwLl846Eb92HKCOU8AsSONAbqJeZTJrTOd2UiTVj9a46dV34VKdfQVZMQhu4VWQ9mVk3LnBJkvJYLhZ40t4gDDW9ReFo/B3i6As/I4yHcg2UM6oDn6upOCyj6Uerv5oNHU7vh547A6NgQncwItjlMR8ml2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021209; c=relaxed/simple;
	bh=u0U+l6q4EAYa0LG8Hr5S9eTNmgsdiREMu8F9oGpx5FQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dH6LKSK2/ANFqfG/EGXLUTvCVzWe4GqVHeqbRH3BbYfZqUcJ2y+xO3geLN+cMurlDphFqxVD+1pIWlWCkkwixM8D7wdDy5V6rJw1Qp0H4IRGqhiZuAMMb7u9X9PIX6IminQSJylmfiSk8jalSfoEsBpZF+yw9UnTGy2U6EDiOoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B7D411A003D;
	Tue, 14 Jul 2026 11:21:06 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5345E1A006C;
	Tue, 14 Jul 2026 11:21:06 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id F1C5718000B5;
	Tue, 14 Jul 2026 17:21:04 +0800 (+08)
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
Subject: [PATCH v14 6/8] i3c: hub: Add support for the I3C interface in the I3C hub
Date: Tue, 14 Jul 2026 14:50:51 +0530
Message-Id: <20260714092053.2461482-7-lakshay.piplani@nxp.com>
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

Add virtual I3C bus support for the hub and provide interface to enable
or disable downstream ports.

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>

---
Changes in v14:
 - Add hub route serialization around DAA, CCC, private transfer and IBI paths
 - Add comments explaining that downstream devices behind hub target ports
   share the parent controller address space
 - Use i3c_bus_maintenance_lock()/unlock() instead of raw parent bus lock
   operations
 - Hold the parent maintenance lock across temporary hub address reattach,
   transfer and address restore
 - Rework IBI request/free forwarding, so downstream devices are temporarily
   attached to the parent controller for IBI setup
 - Clean up the preallocated virtual IBI object and workqueue before forwarding
   the IBI request to the parent controller
 - Avoid NULL dereference in the core IBI free path when the forwarding
   callback has already cleared dev->ibi

Changes in v13:
 - Reserve parent I3C bus address slots for downstream devices with matching static and
   assigned addresses by parsing target-port DT nodes
 - Keep broadcast RSTDAA blocked and add explanatory comment
 - Add TODO for empty IBI slot recycle callback
 - Add comments for intentional no-op callbacks

Changes in v12:
 - Drop redundant depends on I3C from config I3C_HUB
 - Return -EOPNOTSUPP for unsupported I2C transfers instead of reporting
   success.

Changes in v11:
 - Fix virtual hub address reattach handling
 - Fix parent bus locking during address reattach operations
 - Improve transfer and IBI request error handling

Changes in v10:
 - Remove unnecessary ibi_lock handling in request/enable/disable/free
   IBI APIs
 - Remove redundant parent pointer from struct i3c_hub and derive upstream
   master from hub_dev

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
 drivers/i3c/Kconfig     |  14 +
 drivers/i3c/Makefile    |   1 +
 drivers/i3c/hub.c       | 607 ++++++++++++++++++++++++++++++++++++++++
 include/linux/i3c/hub.h | 102 +++++++
 5 files changed, 726 insertions(+)
 create mode 100644 drivers/i3c/hub.c
 create mode 100644 include/linux/i3c/hub.h

diff --git a/MAINTAINERS b/MAINTAINERS
index fcb3917aa096..a0b7fd85f8e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19311,8 +19311,10 @@ L:	linux-kernel@vger.kernel.org
 L:	linux-i3c@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
+F:	drivers/i3c/hub.c
 F:	drivers/mfd/p3h2840.c
 F:	drivers/regulator/p3h2840_i3c_hub_regulator.c
+F:	include/linux/i3c/hub.h
 F:	include/linux/mfd/p3h2840.h
 
 NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
index 626c54b386d5..7536f3740c94 100644
--- a/drivers/i3c/Kconfig
+++ b/drivers/i3c/Kconfig
@@ -21,6 +21,20 @@ menuconfig I3C
 
 if I3C
 source "drivers/i3c/master/Kconfig"
+
+config I3C_HUB
+	tristate "I3C Hub Support"
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
index 000000000000..6105bb710be6
--- /dev/null
+++ b/drivers/i3c/hub.c
@@ -0,0 +1,607 @@
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
+/*
+ * Devices behind the hub are not attached to the virtual bus.
+ *
+ * Instead, i3c_hub_master_priv_xfers() temporarily updates the hub dynamic
+ * address with the target device address before issuing the transfer. Once the
+ * transfer completes, the hub address is restored back to its original value.
+ *
+ * Therefore, no per-device attach, reattach, or detach handling is required for
+ * the virtual bus.
+ */
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
+	struct i3c_master_controller *parent;
+	int ret;
+
+	if (!hub || !hub->hub_dev)
+		return -ENODEV;
+
+	parent = i3c_dev_get_master(hub->hub_dev->desc);
+	if (!parent)
+		return -ENODEV;
+
+	mutex_lock(&hub->lock);
+	i3c_hub_enable_port(controller);
+
+	/*
+	 * Downstream devices reachable through hub target-port routes share the
+	 * parent controller's I3C address space. The hub gates access to a
+	 * target-port network, but it does not create an independent dynamic
+	 * address domain per virtual bus.
+	 *
+	 * Run DAA on the parent controller so dynamic addresses remain unique
+	 * across all downstream devices, even when they are behind different
+	 * target ports.
+	 */
+	ret = i3c_master_do_daa(parent);
+	i3c_hub_disable_port(controller);
+	mutex_unlock(&hub->lock);
+
+	return ret;
+}
+
+static bool i3c_hub_supports_ccc_cmd(struct i3c_hub *hub,
+				     const struct i3c_ccc_cmd *cmd)
+{
+	struct i3c_master_controller *parent;
+
+	if (!hub || !hub->hub_dev)
+		return false;
+
+	parent = i3c_dev_get_master(hub->hub_dev->desc);
+	if (!parent)
+		return false;
+
+	return i3c_master_supports_ccc_cmd(parent, cmd);
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
+	struct i3c_master_controller *parent;
+	int ret;
+
+	if (!hub || !hub->hub_dev)
+		return -ENODEV;
+
+	parent = i3c_dev_get_master(hub->hub_dev->desc);
+	if (!parent)
+		return -ENODEV;
+
+	mutex_lock(&hub->lock);
+	i3c_hub_enable_port(controller);
+	ret = i3c_master_send_ccc_cmd(parent, cmd);
+	i3c_hub_disable_port(controller);
+	mutex_unlock(&hub->lock);
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
+	struct i3c_master_controller *parent;
+	u8 hub_addr, target_addr;
+	struct i3c_hub *hub;
+	int ret, xfer_ret;
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
+	parent = i3c_dev_get_master(hub_dev);
+	if (!parent)
+		return -ENODEV;
+
+	mutex_lock(&hub->lock);
+
+	i3c_hub_enable_port(controller);
+
+	i3c_bus_maintenance_lock(&parent->bus);
+
+	hub_addr = hub_dev->info.dyn_addr ?
+		hub_dev->info.dyn_addr : hub_dev->info.static_addr;
+
+	target_addr = dev->info.dyn_addr ?
+		dev->info.dyn_addr : dev->info.static_addr;
+
+	if (hub_addr != target_addr) {
+		hub_dev->info.dyn_addr = target_addr;
+
+		ret = i3c_master_reattach_i3c_dev_locked(hub_dev, hub_addr);
+		if (ret) {
+			hub_dev->info.dyn_addr = hub_addr;
+			goto out_unlock_parent;
+		}
+	}
+
+	ret = i3c_dev_do_xfers_locked(hub_dev, xfers, nxfers, mode);
+
+	if (hub_addr != target_addr) {
+		hub_dev->info.dyn_addr = hub_addr;
+
+		xfer_ret = i3c_master_reattach_i3c_dev_locked(hub_dev,
+							      target_addr);
+		if (!ret)
+			ret = xfer_ret;
+	}
+out_unlock_parent:
+	i3c_bus_maintenance_unlock(&parent->bus);
+	i3c_hub_disable_port(controller);
+	mutex_unlock(&hub->lock);
+
+	return ret;
+}
+
+static int i3c_hub_attach_i2c_dev(struct i2c_dev_desc *dev)
+{
+	return -EOPNOTSUPP;
+}
+
+static void i3c_hub_detach_i2c_dev(struct i2c_dev_desc *dev)
+{
+}
+
+static int i3c_hub_i2c_xfers(struct i2c_dev_desc *dev,
+			     struct i2c_msg *xfers, int nxfers)
+{
+	return -EOPNOTSUPP;
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
+	if (!hub->hub_dev)
+		return -ENODEV;
+
+	/*
+	 * Do not forward broadcast RSTDAA through the hub. The hub itself
+	 * is visible on the parent bus, so forwarding RSTDAA would also
+	 * reset the hub dynamic address. Downstream RSTDAA is not supported
+	 * by the hub virtual-controller model.
+	 */
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
+	if (!hub->hub_dev)
+		return -ENODEV;
+
+	parent = i3c_dev_get_master(hub->hub_dev->desc);
+
+	i3c_bus_maintenance_lock(&parent->bus);
+
+	orig_parent = i3c_hub_update_desc_parent(&desc->common, parent);
+
+	/*
+	 * Downstream devices are exposed through the virtual hub controller.
+	 * Private transfers only use the hub device temporarily with the
+	 * downstream device's dynamic address; they do not attach the downstream
+	 * device to the parent controller.
+	 *
+	 * Attach the device to the parent controller before requesting IBI so
+	 * the parent can allocate any controller-private IBI state.
+	 */
+	ret = i3c_master_direct_attach_i3c_dev_locked(parent, desc);
+	if (ret) {
+		i3c_hub_update_desc_parent(&desc->common, orig_parent);
+		i3c_bus_maintenance_unlock(&parent->bus);
+		return ret;
+	}
+
+	if (desc->ibi) {
+		if (desc->ibi->wq) {
+			destroy_workqueue(desc->ibi->wq);
+			desc->ibi->wq = NULL;
+		}
+
+		kfree(desc->ibi);
+		desc->ibi = NULL;
+	}
+	ret = i3c_dev_request_ibi_locked(desc, req);
+	if (ret)
+		i3c_master_direct_detach_i3c_dev_locked(desc);
+
+	i3c_hub_update_desc_parent(&desc->common, orig_parent);
+
+	i3c_bus_maintenance_unlock(&parent->bus);
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
+	if (!hub->hub_dev)
+		return;
+
+	parent = i3c_dev_get_master(hub->hub_dev->desc);
+
+	mutex_lock(&hub->lock);
+	i3c_hub_enable_port(controller);
+
+	i3c_bus_maintenance_lock(&parent->bus);
+	orig_parent = i3c_hub_update_desc_parent(&desc->common, parent);
+	i3c_dev_free_ibi_locked(desc);
+
+	/*
+	 * Drop the temporary parent attachment created for IBI setup.
+	 * The downstream device remains exposed through the virtual hub
+	 * controller.
+	 */
+	i3c_master_direct_detach_i3c_dev_locked(desc);
+	i3c_hub_update_desc_parent(&desc->common, orig_parent);
+	i3c_bus_maintenance_unlock(&parent->bus);
+
+	i3c_hub_disable_port(controller);
+	mutex_unlock(&hub->lock);
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
+	if (!hub->hub_dev)
+		return -ENODEV;
+
+	parent = i3c_dev_get_master(hub->hub_dev->desc);
+
+	mutex_lock(&hub->lock);
+	i3c_hub_enable_port(controller);
+
+	orig_parent = i3c_hub_update_desc_parent(&desc->common, parent);
+
+	i3c_bus_maintenance_lock(&parent->bus);
+	ret = i3c_dev_enable_ibi_locked(desc);
+	i3c_bus_maintenance_unlock(&parent->bus);
+
+	i3c_hub_update_desc_parent(&desc->common, orig_parent);
+
+	i3c_hub_disable_port(controller);
+	mutex_unlock(&hub->lock);
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
+	if (!hub->hub_dev)
+		return -ENODEV;
+
+	parent = i3c_dev_get_master(hub->hub_dev->desc);
+
+	mutex_lock(&hub->lock);
+	i3c_hub_enable_port(controller);
+
+	orig_parent = i3c_hub_update_desc_parent(&desc->common, parent);
+
+	i3c_bus_maintenance_lock(&parent->bus);
+	ret = i3c_dev_disable_ibi_locked(desc);
+	i3c_bus_maintenance_unlock(&parent->bus);
+
+	i3c_hub_update_desc_parent(&desc->common, orig_parent);
+
+	i3c_hub_disable_port(controller);
+	mutex_unlock(&hub->lock);
+
+	return ret;
+}
+
+static void i3c_hub_recycle_ibi_slot(struct i3c_dev_desc *desc,
+				     struct i3c_ibi_slot *slot)
+{
+	/*
+	 * TODO: Forward IBI slot recycling to the parent controller when
+	 * downstream-device IBI support is fully enabled. Current users only
+	 * rely on the hub device IBI path for SMBus-agent events, so no parent
+	 * hardware slot is recycled through this virtual callback currently.
+	 */
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
+ * @ops: Vendor callbacks
+ * @hub_dev: I3C hub device
+ */
+void i3c_hub_init(struct i3c_hub *hub,
+		  const struct i3c_hub_ops *ops,
+		  struct i3c_device *hub_dev)
+{
+	hub->ops = ops;
+	hub->hub_dev = hub_dev;
+	mutex_init(&hub->lock);
+}
+EXPORT_SYMBOL_GPL(i3c_hub_init);
+
+const struct i3c_master_controller_ops *i3c_hub_master_ops(void)
+{
+	return &i3c_hub_master_ops_data;
+}
+EXPORT_SYMBOL_GPL(i3c_hub_master_ops);
+
+/**
+ * i3c_hub_reserve_parent_addrslots_from_dt() - Reserve child addresses in parent bus.
+ * @hubc: I3C hub controller for a target-port virtual bus.
+ * @node: Target-port bus Device Tree node.
+ *
+ * Reserve parent bus address slots for downstream I3C devices that keep the
+ * same static and assigned dynamic address, so parent DAA does not reuse them.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int i3c_hub_reserve_parent_addrslots_from_dt(struct i3c_hub_controller *hubc,
+					     struct device_node *node)
+{
+	struct i3c_master_controller *parent = hubc->parent;
+	enum i3c_addr_slot_status status;
+	u32 assigned_addr;
+	u8 static_addr;
+	u32 reg[3];
+	int ret;
+
+	if (!parent || !node)
+		return -ENODEV;
+
+	for_each_available_child_of_node_scoped(node, child) {
+		ret = of_property_read_variable_u32_array(child, "reg", reg, 1, 3);
+		if (ret < 0)
+			continue;
+
+		ret = of_property_read_u32(child, "assigned-address", &assigned_addr);
+		if (ret)
+			continue;
+
+		static_addr = reg[0];
+
+		if (!static_addr || !assigned_addr)
+			continue;
+
+		if (static_addr != assigned_addr)
+			continue;
+
+		i3c_bus_maintenance_lock(&parent->bus);
+		status = i3c_bus_get_addr_slot_status(&parent->bus,
+						      assigned_addr);
+		if (status == I3C_ADDR_SLOT_FREE)
+			i3c_bus_set_addr_slot_status(&parent->bus,
+						     assigned_addr,
+						     I3C_ADDR_SLOT_I3C_DEV);
+		i3c_bus_maintenance_unlock(&parent->bus);
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(i3c_hub_reserve_parent_addrslots_from_dt);
+
+MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
+MODULE_AUTHOR("Vikash Bansal <vikash.bansal@nxp.com>");
+MODULE_AUTHOR("Lakshay Piplani <lakshay.piplani@nxp.com>");
+MODULE_DESCRIPTION("Generic I3C hub support");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/i3c/hub.h b/include/linux/i3c/hub.h
new file mode 100644
index 000000000000..8ad2cf3c9d5b
--- /dev/null
+++ b/include/linux/i3c/hub.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2026 NXP
+ * Generic hub definitions and helper interfaces.
+ */
+#ifndef _LINUX_I3C_HUB_H
+#define _LINUX_I3C_HUB_H
+
+#include <linux/i3c/master.h>
+#include <linux/mutex.h>
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
+/**
+ * struct i3c_hub - Generic I3C hub context
+ * @ops: Vendor callbacks for port connection control
+ * @hub_dev: I3C device representing the hub on the parent bus
+ */
+struct i3c_hub {
+	const struct i3c_hub_ops *ops;
+	struct i3c_device *hub_dev;
+	struct mutex lock; /* Serializes hub port routing. */
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
+void i3c_hub_init(struct i3c_hub *hub,
+		  const struct i3c_hub_ops *ops,
+		  struct i3c_device *hub_dev);
+
+int i3c_hub_reserve_parent_addrslots_from_dt(struct i3c_hub_controller *hubc,
+					     struct device_node *node);
+#endif
-- 
2.25.1

