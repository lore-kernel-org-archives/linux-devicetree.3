Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FD02DB7BD;
	Tue, 14 Jul 2026 09:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021208; cv=none; b=TC2eraIv3OPqvBetFFADMUb/RnYhNJKWodVa9rueK6V3aYNNBQ6gfWs+VkSu8NI0Mc7JDUz3xCSbmGMFW03CQzQFE8QriY9RUzwsiKKMY31RlcsrzCE763YaNSr7aeHrX3M3UIKQwAgxYHpPVn7ZXjHcsQhPAG5quyr1thRYa5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021208; c=relaxed/simple;
	bh=uSmgbSzJU6j44fkLAHGrqDcRRBTv/0EvNXJEboNDKW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UmCaEwTdasHE8DtXbgJPYm4xY/mWMHZjD5QxgBr6WrkcGjMVx8DjRISpBcFbBkEXSuoopB76a8d0t6ezlk2KtdTLFTAhSeyI5EbgAK3SqNOCtPi0ayGqn0nmC77uXcOR3DyQ/dctIQQ/BRKkbZSw8fm+zL/m9XXCHxXqmO8R8D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 78D281A0086;
	Tue, 14 Jul 2026 11:21:00 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0F7061A006C;
	Tue, 14 Jul 2026 11:21:00 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 96AA418000B0;
	Tue, 14 Jul 2026 17:20:58 +0800 (+08)
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
Subject: [PATCH v14 1/8] i3c: master: Add APIs for I3C hub support
Date: Tue, 14 Jul 2026 14:50:46 +0530
Message-Id: <20260714092053.2461482-2-lakshay.piplani@nxp.com>
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

Add helpers for attaching and detaching I3C devices and CCC helpers
to check CCC support and send CCC commands, address slot helpers to
query and update I3C bus address slot state, registering virtual
masters with an explicit firmware node, and exposing the bus maintenance
lock helpers.

These additions prepare for I3C hub support. A hub driver needs to attach
downstream devices temporarily to the parent controller, reserve/query
parent bus address slots, forward CCC commands, register virtual target
port controllers using the target-port firmware node, and serialize
operations against the parent bus maintenance lock.

i3c_master_register_fwnode() allows virtual I3C masters to register using a
firmware node different from their parent device node without temporarily
modifying parent->of_node.

The attach and detach helpers must be called with the bus lock held in
write mode.

The new helpers are:
1) i3c_master_direct_attach_i3c_dev_locked()
2) i3c_master_direct_detach_i3c_dev_locked()
3) i3c_master_send_ccc_cmd()
4) i3c_master_supports_ccc_cmd()
5) i3c_bus_get_addr_slot_status()
6) i3c_bus_set_addr_slot_status()
7) i3c_bus_maintenance_lock()
8) i3c_bus_maintenance_unlock()
9) i3c_master_register_fwnode()

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>

---
Changes in v14:
 - Add i3c_master_register_fwnode() to register virtual I3C masters with an
   explicit firmware node
 - Export i3c_bus_maintenance_lock() and i3c_bus_maintenance_unlock()
 - Add runtime PM get/put around i3c_master_send_ccc_cmd()
 - Make i3c_master_supports_ccc_cmd() return false when the controller does
   not implement send_ccc_cmd()

Changes in v13:
 - Fix address handling in direct attach by using i3c_master_get_i3c_addrs() and
   adding rollback on failure to prevent bus address collisions
 - Fix detach path by clearing master_priv and releasing addresses to avoid use-after-free
   and stale state issues
 - Export address slot helper APIs and add kernel-doc for them

Changes in v12:
 - Add address check in i3c_master_direct_detach_i3c_dev_locked() to skip
   detach for unaddressed devices.

Changes in v11:
 - Convert i3c_master_supports_ccc_cmd() to return bool and align
   semantics with CCC support checks used by the I3C core

Changes in v10:
 - Rename i3c_master_direct_attach_i3c_dev and i3c_master_direct_detach_i3c_dev
   APIs to *_locked, as these APIs must be called with the bus lock held in
   write mode

Changes in v9:
 - No change

Changes in v8:
 - No change

Changes in v7:
 - Update commit message to clarify purpose (prepare for I3C hub support)

Changes in v6:
 - Split the patch into two parts:
        1) expose the existing API
        2) add new APIs.
---
---
 drivers/i3c/master.c       | 229 +++++++++++++++++++++++++++++++++----
 include/linux/i3c/master.h |  20 ++++
 2 files changed, 226 insertions(+), 23 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index dbb4d8119b5f..2cb94face156 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -42,10 +42,11 @@ static BLOCKING_NOTIFIER_HEAD(i3c_bus_notifier);
  * logic to rely on I3C device information that could be changed behind their
  * back.
  */
-static void i3c_bus_maintenance_lock(struct i3c_bus *bus)
+void i3c_bus_maintenance_lock(struct i3c_bus *bus)
 {
 	down_write(&bus->lock);
 }
+EXPORT_SYMBOL_GPL(i3c_bus_maintenance_lock);
 
 /**
  * i3c_bus_maintenance_unlock - Release the bus lock after a maintenance
@@ -56,10 +57,11 @@ static void i3c_bus_maintenance_lock(struct i3c_bus *bus)
  * i3c_bus_maintenance_lock() for more details on what these maintenance
  * operations are.
  */
-static void i3c_bus_maintenance_unlock(struct i3c_bus *bus)
+void i3c_bus_maintenance_unlock(struct i3c_bus *bus)
 {
 	up_write(&bus->lock);
 }
+EXPORT_SYMBOL_GPL(i3c_bus_maintenance_unlock);
 
 /**
  * i3c_bus_normaluse_lock - Lock the bus for a normal operation
@@ -391,11 +393,19 @@ i3c_bus_get_addr_slot_status_mask(struct i3c_bus *bus, u16 addr, u32 mask)
 	return status & mask;
 }
 
-static enum i3c_addr_slot_status
+/**
+ * i3c_bus_get_addr_slot_status() - Get I3C bus address slot status
+ * @bus: I3C bus.
+ * @addr: I3C address to query.
+ *
+ * Return: Address slot status for @addr.
+ */
+enum i3c_addr_slot_status
 i3c_bus_get_addr_slot_status(struct i3c_bus *bus, u16 addr)
 {
 	return i3c_bus_get_addr_slot_status_mask(bus, addr, I3C_ADDR_SLOT_STATUS_MASK);
 }
+EXPORT_SYMBOL_GPL(i3c_bus_get_addr_slot_status);
 
 static void i3c_bus_set_addr_slot_status_mask(struct i3c_bus *bus, u16 addr,
 					      enum i3c_addr_slot_status status, u32 mask)
@@ -411,11 +421,18 @@ static void i3c_bus_set_addr_slot_status_mask(struct i3c_bus *bus, u16 addr,
 	*ptr |= ((unsigned long)status & mask) << (bitpos % BITS_PER_LONG);
 }
 
-static void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
-					 enum i3c_addr_slot_status status)
+/**
+ * i3c_bus_set_addr_slot_status() - Set I3C bus address slot status
+ * @bus: I3C bus.
+ * @addr: I3C address to update.
+ * @status: Address slot status to set.
+ */
+void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
+				  enum i3c_addr_slot_status status)
 {
 	i3c_bus_set_addr_slot_status_mask(bus, addr, status, I3C_ADDR_SLOT_STATUS_MASK);
 }
+EXPORT_SYMBOL_GPL(i3c_bus_set_addr_slot_status);
 
 static bool i3c_bus_dev_addr_is_avail(struct i3c_bus *bus, u8 addr)
 {
@@ -1652,6 +1669,83 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
 	return 0;
 }
 
+/**
+ * i3c_master_direct_attach_i3c_dev_locked() - Attach an I3C device to a master
+ * @master: I3C master controller to attach the device to
+ * @dev: I3C device descriptor representing the device
+ *
+ * Attach an I3C device to its master controller after reserving the device
+ * addresses on the bus. The device must belong to @master.
+ *
+ * The master device itself is not passed to the controller driver's
+ * ->attach_i3c_dev() callback.
+ *
+ * Context: Caller must hold @master->bus.lock in write mode.
+ *
+ * Return: 0 on success, or a negative error code if address reservation fails
+ * or if the master controller driver's ->attach_i3c_dev() callback fails.
+ */
+int i3c_master_direct_attach_i3c_dev_locked(struct i3c_master_controller *master,
+					    struct i3c_dev_desc *dev)
+{
+	int ret;
+
+	if (WARN_ON(i3c_dev_get_master(dev) != master))
+		return -EINVAL;
+
+	ret = i3c_master_get_i3c_addrs(dev);
+	if (ret)
+		return ret;
+
+	/* Do not attach the master device itself. */
+	if (master->this != dev && master->ops->attach_i3c_dev) {
+		ret = master->ops->attach_i3c_dev(dev);
+		if (ret) {
+			i3c_master_put_i3c_addrs(dev);
+			return ret;
+		}
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(i3c_master_direct_attach_i3c_dev_locked);
+
+/**
+ * i3c_master_direct_detach_i3c_dev_locked() - Detach an I3C device from a master
+ * @dev: I3C device descriptor to detach
+ *
+ * Detach an addressed I3C device from its master controller. Devices without
+ * either a static or dynamic address are skipped because they were not attached
+ * to the controller.
+ *
+ * The master device itself is not passed to the controller driver's
+ * ->detach_i3c_dev() callback. For other devices, the callback is invoked when
+ * provided by the master controller driver.
+ *
+ * The controller-private data is cleared and the device addresses are released
+ * from the bus address slot table.
+ *
+ * Context: Caller must hold the device master's bus lock in write mode.
+ */
+void i3c_master_direct_detach_i3c_dev_locked(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *master = i3c_dev_get_master(dev);
+
+	/*
+	 * We don't attach devices to the controller until they are
+	 * addressable on the bus, so skip detach for unaddressed devices.
+	 */
+	if (!dev->info.static_addr && !dev->info.dyn_addr)
+		return;
+
+	/* Do not detach the master device itself. */
+	if (master->this != dev && master->ops->detach_i3c_dev)
+		master->ops->detach_i3c_dev(dev);
+
+	dev->common.master_priv = NULL;
+	i3c_master_put_i3c_addrs(dev);
+}
+EXPORT_SYMBOL_GPL(i3c_master_direct_detach_i3c_dev_locked);
+
 /**
  * i3c_master_reattach_i3c_dev_locked() - reattach an I3C device with a new address
  * @dev: I3C device descriptor to reattach
@@ -1815,6 +1909,59 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 	}
 }
 
+/**
+ * i3c_master_supports_ccc_cmd() - check CCC command support
+ * @master: I3C master controller
+ * @cmd: CCC command to verify
+ *
+ * Return: true if @cmd is supported, false otherwise.
+ */
+bool i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
+				 const struct i3c_ccc_cmd *cmd)
+{
+	if (!master || !cmd)
+		return false;
+
+	if (!master->ops->send_ccc_cmd)
+		return false;
+
+	if (!master->ops->supports_ccc_cmd)
+		return true;
+
+	return master->ops->supports_ccc_cmd(master, cmd);
+}
+EXPORT_SYMBOL_GPL(i3c_master_supports_ccc_cmd);
+
+/**
+ * i3c_master_send_ccc_cmd() - send a CCC command
+ * @master: I3C master controller issuing the command
+ * @cmd: CCC command to be sent
+ *
+ * This function sends a Common Command Code (CCC) command to devices on the
+ * I3C bus. It acquires the bus maintenance lock, executes the command, and
+ * then releases the lock to ensure safe access to the bus.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int i3c_master_send_ccc_cmd(struct i3c_master_controller *master,
+			    struct i3c_ccc_cmd *cmd)
+{
+	int ret;
+
+	ret = i3c_master_rpm_get(master);
+	if (ret)
+		return ret;
+
+	i3c_bus_maintenance_lock(&master->bus);
+	ret = i3c_master_send_ccc_cmd_locked(master, cmd);
+	i3c_bus_maintenance_unlock(&master->bus);
+
+	i3c_master_rpm_put(master);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i3c_master_send_ccc_cmd);
+
 /**
  * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
  * @master: controller
@@ -2998,34 +3145,31 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
 }
 
 /**
- * i3c_master_register() - register an I3C master
+ * i3c_master_register_fwnode() - register an I3C master with a custom fwnode
  * @master: master used to send frames on the bus
- * @parent: the parent device (the one that provides this I3C master
- *	    controller)
+ * @parent: the parent device providing this I3C master controller
+ * @fwnode: firmware node describing this I3C bus, or NULL
  * @ops: the master controller operations
- * @secondary: true if you are registering a secondary master. Will return
- *	       -EOPNOTSUPP if set to true since secondary masters are not yet
- *	       supported
+ * @secondary: true if registering a secondary master
  *
- * This function takes care of everything for you:
+ * This helper is useful for virtual I3C masters whose firmware node is not
+ * the same as @parent's firmware node.
  *
- * - creates and initializes the I3C bus
- * - populates the bus with static I2C devs if @parent->of_node is not
- *   NULL
- * - registers all I3C devices added by the controller during bus
- *   initialization
- * - registers the I2C adapter and all I2C devices
+ * Only OF-backed fwnodes are supported for now, because the I3C core still
+ * stores the bus node in master->dev.of_node and populates the bus using OF.
  *
  * Return: 0 in case of success, a negative error code otherwise.
  */
-int i3c_master_register(struct i3c_master_controller *master,
-			struct device *parent,
-			const struct i3c_master_controller_ops *ops,
-			bool secondary)
+int i3c_master_register_fwnode(struct i3c_master_controller *master,
+			       struct device *parent,
+			       struct fwnode_handle *fwnode,
+			       const struct i3c_master_controller_ops *ops,
+			       bool secondary)
 {
 	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE;
 	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
 	enum i3c_bus_mode mode = I3C_BUS_MODE_PURE;
+	struct device_node *np = NULL;
 	struct i2c_dev_boardinfo *i2cbi;
 	int ret;
 
@@ -3037,8 +3181,14 @@ int i3c_master_register(struct i3c_master_controller *master,
 	if (ret)
 		return ret;
 
+	if (fwnode) {
+		np = to_of_node(fwnode);
+		if (!np)
+			return -EINVAL;
+	}
+
 	master->dev.parent = parent;
-	master->dev.of_node = of_node_get(parent->of_node);
+	master->dev.of_node = of_node_get(np);
 	master->dev.bus = &i3c_bus_type;
 	master->dev.type = &i3c_masterdev_type;
 	master->dev.release = i3c_masterdev_release;
@@ -3150,6 +3300,39 @@ int i3c_master_register(struct i3c_master_controller *master,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(i3c_master_register_fwnode);
+
+/**
+ * i3c_master_register() - register an I3C master
+ * @master: master used to send frames on the bus
+ * @parent: the parent device (the one that provides this I3C master
+ *	    controller)
+ * @ops: the master controller operations
+ * @secondary: true if you are registering a secondary master. Will return
+ *	       -EOPNOTSUPP if set to true since secondary masters are not yet
+ *	       supported
+ *
+ * This function takes care of everything for you:
+ *
+ * - creates and initializes the I3C bus
+ * - populates the bus with static I2C devs if @parent->of_node is not
+ *   NULL
+ * - registers all I3C devices added by the controller during bus
+ *   initialization
+ * - registers the I2C adapter and all I2C devices
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int i3c_master_register(struct i3c_master_controller *master,
+			struct device *parent,
+			const struct i3c_master_controller_ops *ops,
+			bool secondary)
+{
+	return i3c_master_register_fwnode(master, parent,
+					  parent->of_node ?
+					  of_fwnode_handle(parent->of_node) : NULL,
+					  ops, secondary);
+}
 EXPORT_SYMBOL_GPL(i3c_master_register);
 
 /**
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 355e9b3d9ae3..64f4c39793ea 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -615,9 +615,21 @@ DEFINE_FREE(i3c_master_dma_unmap_single, void *,
 
 int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
 				       u8 old_dyn_addr);
+int i3c_master_direct_attach_i3c_dev_locked(struct i3c_master_controller *master,
+					    struct i3c_dev_desc *dev);
+void i3c_master_direct_detach_i3c_dev_locked(struct i3c_dev_desc *dev);
+int i3c_master_send_ccc_cmd(struct i3c_master_controller *master,
+			    struct i3c_ccc_cmd *cmd);
+bool i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
+				 const struct i3c_ccc_cmd *cmd);
 int i3c_master_set_info(struct i3c_master_controller *master,
 			const struct i3c_device_info *info);
 
+int i3c_master_register_fwnode(struct i3c_master_controller *master,
+			       struct device *parent,
+			       struct fwnode_handle *fwnode,
+			       const struct i3c_master_controller_ops *ops,
+			       bool secondary);
 int i3c_master_register(struct i3c_master_controller *master,
 			struct device *parent,
 			const struct i3c_master_controller_ops *ops,
@@ -739,4 +751,12 @@ void i3c_for_each_bus_locked(int (*fn)(struct i3c_bus *bus, void *data),
 int i3c_register_notifier(struct notifier_block *nb);
 int i3c_unregister_notifier(struct notifier_block *nb);
 
+enum i3c_addr_slot_status
+i3c_bus_get_addr_slot_status(struct i3c_bus *bus, u16 addr);
+
+void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
+				  enum i3c_addr_slot_status status);
+
+void i3c_bus_maintenance_lock(struct i3c_bus *bus);
+void i3c_bus_maintenance_unlock(struct i3c_bus *bus);
 #endif /* I3C_MASTER_H */
-- 
2.25.1

