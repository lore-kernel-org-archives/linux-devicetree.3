Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB993793B5;
	Wed, 17 Jun 2026 11:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694269; cv=none; b=MJ44ArMvm51vkaOip5GDSo88KyCzL61ccS1RXUdxb+wr6Nr1LORSsU3UselQnIjydEz/qukF1TxeryHEwzyADkWy2Ss+Kt6TvBFKncON3dFzkRa7mDXzI/Qe1cRaXvDXU3q1GEf1BxOtXqr0VE3pNrKnnA8p+BgZQNdMWH2fXPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694269; c=relaxed/simple;
	bh=Ye1vFqIba0XBksT2+h0hqY3tXadljI8MUGQ5aQ5lHwc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k2fhjEFqk9yl/8LeaKJeXzzRXcCUJzTxKhnScSJOiVS+9bthEoGcQB3mzLFV/2Kdr84AoujBZ5eL3cbxxXDFFj54i+EcxJsZ9hxtHoQKY5RrlO4mzCvugzRJkHWYSCifyUp3i43emmcD+hLL5pHWUJnrCmm+3BepTGAzIMQ+g28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AE7F71A0A42;
	Wed, 17 Jun 2026 13:04:25 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7867F1A084A;
	Wed, 17 Jun 2026 13:04:25 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 2A6181800086;
	Wed, 17 Jun 2026 19:04:24 +0800 (+08)
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
Subject: [PATCH v12 1/7] i3c: master: Add APIs for I3C hub support
Date: Wed, 17 Jun 2026 16:33:49 +0530
Message-Id: <20260617110355.1591844-2-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260617110355.1591844-1-lakshay.piplani@nxp.com>
References: <20260617110355.1591844-1-lakshay.piplani@nxp.com>
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
to check CCC support and send CCC commands. These additions prepare
for I3C hub support.

The attach and detach helpers must be called with the bus lock held in
write mode.

1) i3c_master_direct_attach_i3c_dev_locked()
2) i3c_master_direct_detach_i3c_dev_locked()
3) i3c_master_send_ccc_cmd()
4) i3c_master_supports_ccc_cmd()

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>

---
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
 drivers/i3c/master.c       | 108 +++++++++++++++++++++++++++++++++++++
 include/linux/i3c/master.h |   7 +++
 2 files changed, 115 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index dbb4d8119b5f..38f80617e2c0 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1652,6 +1652,70 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
 	return 0;
 }
 
+/**
+ * i3c_master_direct_attach_i3c_dev_locked() - attach an I3C device to a master
+ * @master: I3C master controller to attach the device to
+ * @dev: I3C device descriptor representing the device
+ *
+ * This function attaches an I3C device to its master controller once the
+ * device has a valid address on the bus. Devices without an assigned address
+ * are ignored. The master device itself is never attached through this bus.
+ *
+ * Context: Caller must hold master->bus.lock in write mode.
+ *
+ * Return: 0 on success, or a negative error code if the attach operation
+ *         fails in the master controller driver.
+ */
+int i3c_master_direct_attach_i3c_dev_locked(struct i3c_master_controller *master,
+					    struct i3c_dev_desc *dev)
+{
+	int ret = 0;
+
+	/*
+	 * We don't attach devices to the controller until they are
+	 * addressable on the bus.
+	 */
+
+	if (!dev->info.static_addr && !dev->info.dyn_addr)
+		return 0;
+
+	/* Do not attach the master device itself. */
+	if (master->this != dev && master->ops->attach_i3c_dev)
+		ret = master->ops->attach_i3c_dev(dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i3c_master_direct_attach_i3c_dev_locked);
+
+/**
+ * i3c_master_direct_detach_i3c_dev_locked() - Detach an I3C device from its
+ * master controller.
+ * @dev: I3C device descriptor to be detached
+ *
+ * This function detaches an I3C device from its master controller.
+ * It ensures that the master itself is not detached. If the device is not
+ * the master and the master controller provides a detach operation,
+ * the detach callback is invoked to perform the actual removal.
+ *
+ * Context: Caller must hold master->bus.lock in write mode.
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
+}
+EXPORT_SYMBOL_GPL(i3c_master_direct_detach_i3c_dev_locked);
+
 /**
  * i3c_master_reattach_i3c_dev_locked() - reattach an I3C device with a new address
  * @dev: I3C device descriptor to reattach
@@ -1815,6 +1879,50 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
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
index 355e9b3d9ae3..7e358b6774c5 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -615,6 +615,13 @@ DEFINE_FREE(i3c_master_dma_unmap_single, void *,
 
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
 
-- 
2.25.1

