Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AF23F823E;
	Mon, 17 Aug 2026 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963143; cv=none; b=QTaVIYuhj2sVIy+uw9dNgteyzyCmxrFmNf15AMv6pnvpjYxuBAvxvbPBnH/OovMpP6hz230D85GHgCvgwbMUyVPl3wkFA2qAnVlyGb/E9GWCZzd/EXGfntp7DOhPWK/buRR5U0W/MIAJAbw9gIcTipOJ99jvjt5SlOBHJ9SoZ6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963143; c=relaxed/simple;
	bh=D+UIAw6vFjX2sSUeQhQYMbpi9pWgGlSiN2zO2mkmypg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=txstYFOK4/zmTsW5OybFAG25pvOyNpjuxLvPlkuAgPK/oz35ucEqvFzZAhhb7UnHtmY2DGd94PTNUGIkRmdBqHT6scdwfbInxFw9B2LnYX9cYZnnvStev26NcquNnRWmsjxhEvOOusvLfLkTHlIEyUotPROIwzuFtye0I+Z1kOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8FBA12000FD;
	Mon, 17 Aug 2026 12:38:58 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2F5CC2001E0;
	Mon, 17 Aug 2026 12:38:58 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id D01521800224;
	Mon, 17 Aug 2026 18:38:56 +0800 (+08)
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
Subject: [PATCH v15 6/8] i3c: hub: Add support for the I3C interface in the I3C hub
Date: Mon, 17 Aug 2026 16:08:42 +0530
Message-Id: <20260817103844.2142802-7-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260817103844.2142802-1-lakshay.piplani@nxp.com>
References: <20260817103844.2142802-1-lakshay.piplani@nxp.com>
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
Changes in v15:
 - Replace temporary descriptor reparenting and hub-address switching with
   a permanent parent-facing descriptor for each downstream I3C device
 - Keep the logical device descriptor associated with the virtual hub
   controller while using the parent-facing descriptor for physical
   controller operations
 - Implement downstream device attach, reattach and detach using the new
   controller-only helpers
 - Forward IBI slot recycling to the physical parent controller
 - Remove the helper that temporarily changed the logical descriptor's
   master pointer

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
 drivers/i3c/hub.c       | 675 ++++++++++++++++++++++++++++++++++++++++
 include/linux/i3c/hub.h |  92 ++++++
 5 files changed, 784 insertions(+)
 create mode 100644 drivers/i3c/hub.c
 create mode 100644 include/linux/i3c/hub.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 448c5017f665..11f231ce05cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19552,8 +19552,10 @@ L:	linux-kernel@vger.kernel.org
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
index 000000000000..04726393004b
--- /dev/null
+++ b/drivers/i3c/hub.c
@@ -0,0 +1,675 @@
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
+ * struct i3c_hub_dev_data - Per-downstream-device hub state
+ * @parent_desc: Permanent parent-facing descriptor whose master points at the
+ *		 physical parent controller, used to forward controller-specific
+ *		 operations there.
+ *
+ * The logical descriptor on the virtual hub bus keeps its master aimed at the
+ * virtual hub controller and is never modified. This separate descriptor lets
+ * the controller-only core helpers resolve the physical parent without racing
+ * concurrent readers on the virtual bus.
+ */
+struct i3c_hub_dev_data {
+	struct i3c_dev_desc parent_desc;
+};
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
+	struct i3c_master_controller *controller = i3c_dev_get_master(dev);
+	struct i3c_hub_controller *hub_controller;
+	struct i3c_hub_dev_data *data;
+	struct i3c_master_controller *parent;
+	struct i3c_hub *hub;
+	int ret;
+
+	hub_controller = dev_get_drvdata(&controller->dev);
+	if (!hub_controller || !hub_controller->hub)
+		return -ENODEV;
+
+	hub = hub_controller->hub;
+	if (!hub->hub_dev)
+		return -ENODEV;
+
+	parent = i3c_dev_get_master(hub->hub_dev->desc);
+	if (!parent)
+		return -ENODEV;
+
+	data = kzalloc_obj(*data);
+	if (!data)
+		return -ENOMEM;
+
+	/* Fix the parent-facing descriptor's master to the physical parent. */
+	INIT_LIST_HEAD(&data->parent_desc.common.node);
+	mutex_init(&data->parent_desc.ibi_lock);
+
+	data->parent_desc.common.master = parent;
+	data->parent_desc.info = dev->info;
+
+	i3c_bus_maintenance_lock(&parent->bus);
+	ret = i3c_master_attach_i3c_dev_controller(&data->parent_desc);
+	i3c_bus_maintenance_unlock(&parent->bus);
+	if (ret) {
+		mutex_destroy(&data->parent_desc.ibi_lock);
+		kfree(data);
+		return ret;
+	}
+
+	/*
+	 * The logical descriptor stores the hub-private data, while the
+	 * parent-facing descriptor stores the physical controller's private
+	 * data.
+	 */
+	i3c_dev_set_master_data(dev, data);
+
+	return 0;
+}
+
+static int i3c_hub_reattach_i3c_dev(struct i3c_dev_desc *dev,
+				    u8 old_dyn_addr)
+{
+	struct i3c_hub_dev_data *data = i3c_dev_get_master_data(dev);
+	struct i3c_master_controller *parent;
+	int ret;
+
+	if (!data)
+		return -ENODEV;
+
+	parent = i3c_dev_get_master(&data->parent_desc);
+	if (!parent)
+		return -ENODEV;
+
+	/* Re-sync device information after the address change. */
+	data->parent_desc.info = dev->info;
+
+	i3c_bus_maintenance_lock(&parent->bus);
+	ret = i3c_master_reattach_i3c_dev_controller(&data->parent_desc,
+						     old_dyn_addr);
+	i3c_bus_maintenance_unlock(&parent->bus);
+
+	return ret;
+}
+
+static void i3c_hub_detach_i3c_dev(struct i3c_dev_desc *dev)
+{
+	struct i3c_hub_dev_data *data = i3c_dev_get_master_data(dev);
+	struct i3c_master_controller *parent;
+
+	if (!data)
+		return;
+
+	parent = i3c_dev_get_master(&data->parent_desc);
+
+	/*
+	 * The generic IBI lifecycle must be released before detaching the
+	 * physical controller state.
+	 */
+	WARN_ON(data->parent_desc.ibi);
+
+	if (parent) {
+		i3c_bus_maintenance_lock(&parent->bus);
+		i3c_master_detach_i3c_dev_controller(&data->parent_desc);
+		i3c_bus_maintenance_unlock(&parent->bus);
+	}
+
+	i3c_dev_set_master_data(dev, NULL);
+	mutex_destroy(&data->parent_desc.ibi_lock);
+	kfree(data);
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
+ * @mode: Transfer mode (SDR, HDR, etc.)
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
+	struct i3c_master_controller *parent;
+	struct i3c_hub_dev_data *data;
+	struct i3c_hub *hub;
+	int ret;
+
+	hub_controller = dev_get_drvdata(&controller->dev);
+	if (!hub_controller || !hub_controller->hub)
+		return -ENODEV;
+
+	hub = hub_controller->hub;
+
+	data = i3c_dev_get_master_data(dev);
+	if (!data)
+		return -ENODEV;
+
+	parent = i3c_dev_get_master(&data->parent_desc);
+	if (!parent)
+		return -ENODEV;
+
+	mutex_lock(&hub->lock);
+
+	/*
+	 * Parent-facing device information may be refreshed before IBI
+	 * resources are requested; once IBI resources are requested, the
+	 * information remains immutable while the parent controller may use
+	 * the descriptor asynchronously.
+	 */
+	if (!data->parent_desc.ibi)
+		data->parent_desc.info = dev->info;
+
+	i3c_hub_enable_port(controller);
+
+	i3c_bus_normaluse_lock(&parent->bus);
+	ret = i3c_dev_do_xfers_locked(&data->parent_desc, xfers,
+				      nxfers, mode);
+	i3c_bus_normaluse_unlock(&parent->bus);
+
+	i3c_hub_disable_port(controller);
+
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
+ * Publishes the generic IBI object on the permanent parent-facing descriptor
+ * and requests IBI for a device connected through the hub. The parent-facing
+ * descriptor references the same IBI object so the physical controller uses
+ * the logical workqueue, pending counter and client device during
+ * asynchronous IBI delivery.
+ */
+static int i3c_hub_request_ibi(struct i3c_dev_desc *desc,
+			       const struct i3c_ibi_setup *req)
+{
+	struct i3c_master_controller *controller = i3c_dev_get_master(desc);
+	struct i3c_hub_controller *hub_controller;
+	struct i3c_master_controller *parent;
+	struct i3c_hub_dev_data *data;
+	struct i3c_hub *hub;
+	int ret;
+
+	hub_controller = dev_get_drvdata(&controller->dev);
+	if (!hub_controller || !hub_controller->hub)
+		return -ENODEV;
+
+	hub = hub_controller->hub;
+
+	data = i3c_dev_get_master_data(desc);
+	if (!data)
+		return -ENODEV;
+
+	parent = i3c_dev_get_master(&data->parent_desc);
+	if (!parent)
+		return -ENODEV;
+
+	/*
+	 * Publish the final device information snapshot together with the
+	 * generic IBI object under hub->lock. Keep the parent-facing
+	 * information immutable while parent_desc.ibi is set and the parent
+	 * controller may use the descriptor asynchronously.
+	 */
+	mutex_lock(&hub->lock);
+	data->parent_desc.info = desc->info;
+	data->parent_desc.dev = desc->dev;
+	data->parent_desc.ibi = desc->ibi;
+	mutex_unlock(&hub->lock);
+
+	i3c_bus_normaluse_lock(&parent->bus);
+	ret = i3c_dev_request_ibi_controller_locked(&data->parent_desc, req);
+	i3c_bus_normaluse_unlock(&parent->bus);
+
+	if (ret) {
+		mutex_lock(&hub->lock);
+		data->parent_desc.ibi = NULL;
+		data->parent_desc.dev = NULL;
+		mutex_unlock(&hub->lock);
+	}
+
+	return ret;
+}
+
+static void i3c_hub_free_ibi(struct i3c_dev_desc *desc)
+{
+	struct i3c_master_controller *controller = i3c_dev_get_master(desc);
+	struct i3c_hub_controller *hub_controller;
+	struct i3c_master_controller *parent;
+	struct i3c_hub_dev_data *data;
+	struct i3c_hub *hub;
+
+	hub_controller = dev_get_drvdata(&controller->dev);
+	if (!hub_controller || !hub_controller->hub)
+		return;
+
+	hub = hub_controller->hub;
+
+	data = i3c_dev_get_master_data(desc);
+	if (!data || !data->parent_desc.ibi)
+		return;
+
+	parent = i3c_dev_get_master(&data->parent_desc);
+	if (!parent)
+		return;
+
+	i3c_bus_normaluse_lock(&parent->bus);
+	i3c_dev_free_ibi_controller_locked(&data->parent_desc);
+	i3c_bus_normaluse_unlock(&parent->bus);
+
+	/*
+	 * The outer generic IBI free path owns and releases desc->ibi after
+	 * this callback returns.
+	 */
+	mutex_lock(&hub->lock);
+	data->parent_desc.ibi = NULL;
+	data->parent_desc.dev = NULL;
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
+	struct i3c_master_controller *parent;
+	struct i3c_hub_dev_data *data;
+	struct i3c_hub *hub;
+	int ret;
+
+	hub_controller = dev_get_drvdata(&controller->dev);
+	if (!hub_controller || !hub_controller->hub)
+		return -ENODEV;
+
+	hub = hub_controller->hub;
+
+	data = i3c_dev_get_master_data(desc);
+	if (!data || !data->parent_desc.ibi)
+		return -ENODEV;
+
+	parent = i3c_dev_get_master(&data->parent_desc);
+	if (!parent)
+		return -ENODEV;
+
+	mutex_lock(&hub->lock);
+
+	i3c_hub_enable_port(controller);
+
+	i3c_bus_maintenance_lock(&parent->bus);
+	ret = i3c_dev_enable_ibi_controller_locked(&data->parent_desc);
+	i3c_bus_maintenance_unlock(&parent->bus);
+
+	i3c_hub_disable_port(controller);
+
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
+	struct i3c_master_controller *parent;
+	struct i3c_hub_dev_data *data;
+	struct i3c_hub *hub;
+	int ret;
+
+	hub_controller = dev_get_drvdata(&controller->dev);
+	if (!hub_controller || !hub_controller->hub)
+		return -ENODEV;
+
+	hub = hub_controller->hub;
+
+	data = i3c_dev_get_master_data(desc);
+	if (!data || !data->parent_desc.ibi)
+		return -ENODEV;
+
+	parent = i3c_dev_get_master(&data->parent_desc);
+	if (!parent)
+		return -ENODEV;
+
+	mutex_lock(&hub->lock);
+
+	i3c_hub_enable_port(controller);
+
+	i3c_bus_maintenance_lock(&parent->bus);
+	ret = i3c_dev_disable_ibi_controller_locked(&data->parent_desc);
+	i3c_bus_maintenance_unlock(&parent->bus);
+
+	i3c_hub_disable_port(controller);
+
+	mutex_unlock(&hub->lock);
+
+	return ret;
+}
+
+static void i3c_hub_recycle_ibi_slot(struct i3c_dev_desc *desc,
+				     struct i3c_ibi_slot *slot)
+{
+	struct i3c_hub_dev_data *data = i3c_dev_get_master_data(desc);
+
+	if (!data)
+		return;
+
+	i3c_dev_recycle_ibi_slot_controller(&data->parent_desc, slot);
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
index 000000000000..90f4be0fdfba
--- /dev/null
+++ b/include/linux/i3c/hub.h
@@ -0,0 +1,92 @@
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

