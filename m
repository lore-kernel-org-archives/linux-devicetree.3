Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3439C2D97BD;
	Mon, 23 Mar 2026 06:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774247280; cv=none; b=RZzkX1knQO5euRZ4bkdaIphVcHJcS5dbEav7Fa+timQ3teUSk/Lc83GmOSscEbm4kC0N04Qo3zDjtuRRK2CmXjiUHFXNTIMW1xypbclVSlAsIr/yIP23Sfe7omsDZT4EJv7qQHWVbmL00Y6cMx6mGQbh7AuQYibvsRoXObCaonw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774247280; c=relaxed/simple;
	bh=1W7BaifyytoxpOgRpD4mD1PQB1euBZURGl/DDeth9Vg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vk/ZvefyOXNLKY+munkEpTffCdjnEVUkZJkqdnFZaQdxufwnsdbCjqJH05aztS+CQeq08HQiRClXk5Iyjr7YHAbWI8wOjuzs2JcLVmNGBpgYJXH9OKBBXIGTiPaJVCeXCKduNku/hmA8/x2ceryCLJFAgYYkF8vkLSJyvYAsTCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 027C2200A5E;
	Mon, 23 Mar 2026 07:27:47 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BE949200A5A;
	Mon, 23 Mar 2026 07:27:46 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 79E561800083;
	Mon, 23 Mar 2026 14:27:45 +0800 (+08)
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
	lakshay.piplani@nxp.com
Subject: [PATCH v8 2/7] i3c: master: Add the APIs to support I3C hub
Date: Mon, 23 Mar 2026 11:57:32 +0530
Message-Id: <20260323062737.886728-3-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260323062737.886728-1-lakshay.piplani@nxp.com>
References: <20260323062737.886728-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

Add simple helpers to direct attach/detach I3C devices and two CCC helpers
to check CCC support and send CCC commands. These additions prepare the
master core for I3C hub support.

1) i3c_master_direct_attach_i3c_dev()
2) i3c_master_direct_detach_i3c_dev()
3) i3c_master_send_ccc_cmd()
4) i3c_master_supports_ccc_cmd()

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

---
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
 drivers/i3c/master.c       | 103 +++++++++++++++++++++++++++++++++++++
 include/linux/i3c/master.h |   8 +++
 2 files changed, 111 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2a12fbb67ba3..500afd8296d1 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1619,6 +1619,59 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
 	return 0;
 }
 
+/**
+ * i3c_master_direct_attach_i3c_dev() - attach an I3C device to a master
+ * @master: I3C master controller to attach the device to
+ * @dev: I3C device descriptor representing the device
+ *
+ * This function attaches an I3C device to its master controller once the
+ * device has a valid address on the bus. Devices without
+ * an assigned address are ignored. The master device itself is never
+ * attached through this bus.
+ *
+ * Return: 0 on success, or a negative error code if the attach operation
+ *         fails in the master controller driver.
+ */
+int i3c_master_direct_attach_i3c_dev(struct i3c_master_controller *master,
+				     struct i3c_dev_desc *dev)
+{
+	int ret = 0;
+
+	/*
+	 * We don't attach devices to the controller until they are
+	 * addressable on the bus.
+	 */
+
+	if (!dev->info.static_addr && !dev->info.dyn_addr)
+		return -EINVAL;
+
+	/* Do not attach the master device itself. */
+	if (master->this != dev && master->ops->attach_i3c_dev)
+		ret = master->ops->attach_i3c_dev(dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i3c_master_direct_attach_i3c_dev);
+
+/**
+ * i3c_master_direct_detach_i3c_dev - Detach an I3C device from its master
+ * @dev: I3C device descriptor to be detached
+ *
+ * This function detaches an I3C device from its master controller.
+ * It ensures that the master itself is not detached. If the device is not
+ * the master and the master controller provides a detach operation,
+ * the detach callback is invoked to perform the actual removal.
+ */
+void i3c_master_direct_detach_i3c_dev(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *master = i3c_dev_get_master(dev);
+
+	/* Do not detach the master device itself. */
+	if (master->this != dev && master->ops->detach_i3c_dev)
+		master->ops->detach_i3c_dev(dev);
+}
+EXPORT_SYMBOL_GPL(i3c_master_direct_detach_i3c_dev);
+
 /**
  * i3c_master_reattach_i3c_dev() - reattach an I3C device with a new address
  * @dev: I3C device descriptor to reattach
@@ -1783,6 +1836,56 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 	}
 }
 
+/**
+ * i3c_master_supports_ccc_cmd() - check CCC command support
+ * @master: I3C master controller
+ * @cmd: CCC command to verify
+ *
+ * This function verifies whether the given I3C master controller supports
+ * the specified Common Command Code (CCC).
+ *
+ * Return: 0 if the CCC command is supported and executed successfully,
+ *         -EINVAL if arguments are invalid,
+ *         -EOPNOTSUPP if the master does not support CCC commands,
+ *         or another negative error code from the master's operation.
+ */
+int i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
+				const struct i3c_ccc_cmd *cmd)
+{
+	if (!cmd || !master)
+		return -EINVAL;
+
+	if (!master->ops->supports_ccc_cmd)
+		return -EOPNOTSUPP;
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
+	i3c_bus_maintenance_lock(&master->bus);
+	ret = i3c_master_send_ccc_cmd_locked(master, cmd);
+	i3c_bus_maintenance_unlock(&master->bus);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i3c_master_send_ccc_cmd);
+
 /**
  * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
  * @master: controller
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index aeccec171e64..c00f0918394c 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -615,6 +615,14 @@ DEFINE_FREE(i3c_master_dma_unmap_single, void *,
 
 int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
 				u8 old_dyn_addr);
+int i3c_master_direct_attach_i3c_dev(struct i3c_master_controller *master,
+				     struct i3c_dev_desc *dev);
+void i3c_master_direct_detach_i3c_dev(struct i3c_dev_desc *dev);
+int i3c_master_send_ccc_cmd(struct i3c_master_controller *master,
+			    struct i3c_ccc_cmd *cmd);
+
+int i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
+				const struct i3c_ccc_cmd *cmd);
 int i3c_master_set_info(struct i3c_master_controller *master,
 			const struct i3c_device_info *info);
 
-- 
2.25.1

