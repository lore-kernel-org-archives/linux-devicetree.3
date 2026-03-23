Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D622D97B7;
	Mon, 23 Mar 2026 06:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774247273; cv=none; b=Moh0tgoiv1AKiohZsC99hPHN0gvYDvezBB6nmFXr4n4fWOaO/o+YNL4gmWETQH0hSIQvqLlsntKxMxyIgQwHZhYh8JZIkBDGIEBON+A8AYZMhV5kk+U7NLYztoIk3UjOZOkIbHtWv0aSUFUdSGijeDJEjKMxHRJMJHRSAbtjGQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774247273; c=relaxed/simple;
	bh=XYtf5WCF8tsQ5euIhmd900EF7nxJFGRRRX0BScFVFMI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GsoGRn1Ue1iQSl2vUNyiZAi/tO84ZiEsFgjGywhz03XGCA3wx3O87foHIJnL89CNKF+oXVuYO9+1aMma4XKne586B55yvG2zr4wuMmumGe3/GHlJrsoTKHNy2Gz3+yfb/7cRnJhg738U7VZBtMSdfkCxYknTVd3P2Yhs7iXBz9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4EDD8200A67;
	Mon, 23 Mar 2026 07:27:45 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 197D3200A5E;
	Mon, 23 Mar 2026 07:27:45 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id BD0F31800083;
	Mon, 23 Mar 2026 14:27:43 +0800 (+08)
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
Subject: [PATCH v8 1/7] i3c: master: Expose the APIs to support I3C hub
Date: Mon, 23 Mar 2026 11:57:31 +0530
Message-Id: <20260323062737.886728-2-lakshay.piplani@nxp.com>
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

The following APIs were already declared in i3c_internals.h but were
missing EXPORT_SYMBOL_GPL() in their implementation, making them
inaccessible to modular drivers such as the I3C hub driver:

1) i3c_dev_enable_ibi_locked()
2) i3c_dev_disable_ibi_locked()
3) i3c_dev_request_ibi_locked()
4) i3c_dev_free_ibi_locked()

i3c_master_reattach_i3c_dev() is declared in include/linux/i3c/master.h
and exported via EXPORT_SYMBOL_GPL() to make it accessible to the I3C
hub driver.

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

---
Changes in v8:
 - No change

Changes in v7:
 - Fix kernel-doc warnings for *_locked() APIs
 - Clarify API exposure in commit message

Changes in v6:
 - Split the patch into two parts:
        1) expose the existing API
        2) add new APIs.

Changes in v5:
 - No change

Changes in v4:
 - Updated I3C master to handle hub support
---
---
 drivers/i3c/master.c       | 70 ++++++++++++++++++++++++++++++++++++--
 include/linux/i3c/master.h |  2 ++
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 9e6be49bebb2..2a12fbb67ba3 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1619,8 +1619,23 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
 	return 0;
 }
 
-static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
-				       u8 old_dyn_addr)
+/**
+ * i3c_master_reattach_i3c_dev() - reattach an I3C device with a new address
+ * @dev: I3C device descriptor to reattach
+ * @old_dyn_addr: previous dynamic address of the device
+ *
+ * This function reattaches an existing I3C device to the bus when its dynamic
+ * address has changed. It updates the bus address slot status accordingly:
+ * - Marks the new dynamic address as occupied by an I3C device.
+ * - Frees the old dynamic address slot if applicable.
+ *
+ * This function must be called with the bus lock held in write mode.
+ *
+ * Return: 0 on success, or a negative error code if reattachment fails
+ *         (e.g. -EBUSY if the new address slot is not free).
+ */
+int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
+				u8 old_dyn_addr)
 {
 	struct i3c_master_controller *master = i3c_dev_get_master(dev);
 	int ret;
@@ -1644,6 +1659,7 @@ static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(i3c_master_reattach_i3c_dev);
 
 static void i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
 {
@@ -3168,6 +3184,16 @@ int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev, struct i3c_xfer *xfers,
 	return master->ops->i3c_xfers(dev, xfers, nxfers, mode);
 }
 
+/**
+ * i3c_dev_disable_ibi_locked() - Disable IBIs coming from a specific device
+ * @dev: device on which IBIs should be disabled
+ *
+ * This function disable IBIs coming from a specific device and wait for
+ * all pending IBIs to be processed.
+ *
+ * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
+ * Return: 0 in case of success, a negative error core otherwise.
+ */
 int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
 {
 	struct i3c_master_controller *master;
@@ -3189,7 +3215,22 @@ int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(i3c_dev_disable_ibi_locked);
 
+/**
+ * i3c_dev_enable_ibi_locked() - Enable IBIs from a specific device (lock held)
+ * @dev: device on which IBIs should be enabled
+ *
+ * This function enable IBIs coming from a specific device and wait for
+ * all pending IBIs to be processed. This should be called on a device
+ * where i3c_device_request_ibi() has succeeded.
+ *
+ * Note that IBIs from this device might be received before this function
+ * returns to its caller.
+ *
+ * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
+ * Return: 0 on success, or a negative error code on failure.
+ */
 int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev)
 {
 	struct i3c_master_controller *master = i3c_dev_get_master(dev);
@@ -3204,7 +3245,20 @@ int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(i3c_dev_enable_ibi_locked);
 
+/**
+ * i3c_dev_request_ibi_locked() - Request an IBI
+ * @dev: device for which we should enable IBIs
+ * @req: setup requested for this IBI
+ *
+ * This function is responsible for pre-allocating all resources needed to
+ * process IBIs coming from @dev. When this function returns, the IBI is not
+ * enabled until i3c_device_enable_ibi() is called.
+ *
+ * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
+ * Return: 0 in case of success, a negative error core otherwise.
+ */
 int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
 			       const struct i3c_ibi_setup *req)
 {
@@ -3243,7 +3297,18 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(i3c_dev_request_ibi_locked);
 
+/**
+ * i3c_dev_free_ibi_locked() - Free all resources needed for IBI handling
+ * @dev: device on which you want to release IBI resources
+ *
+ * This function is responsible for de-allocating resources previously
+ * allocated by i3c_device_request_ibi(). It should be called after disabling
+ * IBIs with i3c_device_disable_ibi().
+ *
+ * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
+ */
 void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 {
 	struct i3c_master_controller *master = i3c_dev_get_master(dev);
@@ -3274,6 +3339,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 	kfree(dev->ibi);
 	dev->ibi = NULL;
 }
+EXPORT_SYMBOL_GPL(i3c_dev_free_ibi_locked);
 
 static int __init i3c_init(void)
 {
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 592b646f6134..aeccec171e64 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -613,6 +613,8 @@ void i3c_master_dma_unmap_single(struct i3c_dma *dma_xfer);
 DEFINE_FREE(i3c_master_dma_unmap_single, void *,
 	    if (_T) i3c_master_dma_unmap_single(_T))
 
+int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
+				u8 old_dyn_addr);
 int i3c_master_set_info(struct i3c_master_controller *master,
 			const struct i3c_device_info *info);
 
-- 
2.25.1

