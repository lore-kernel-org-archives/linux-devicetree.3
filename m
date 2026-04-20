Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17CC2D8DC2;
	Mon, 20 Apr 2026 11:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776682923; cv=none; b=cNME02kTgZuRp2BoE+IhJpl/vrln2/4nQ3AZiTYb0AH67C1omTRMeFd7ltqE7TPKS02JHAJM5Y++JH6mumse01NHUc12G/RY9mqLJ3DcckrVEXs3sArPMl3ebeb7SQ20jQY3fOxi+HzcFPDt0MwcrR5VLatEeFIFh8ET1QUEjm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776682923; c=relaxed/simple;
	bh=wEFL3OZffnREpGBS2ozgm2jKsxN4TsWV/oZgbFCA5R0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tILG/YFZ7u8P8mXJBS5kec7+FRbW1qk/ra2lD/NwdBBBEWC/hbvpqioXsN/wF6VwFmHwrLyP1qkI0/Aed0aM3g5cjvBoxABDVixHjBCyJqhwH1mZCn1+L27HxZTRzYq2hax+hpEakPP4nJ1h7Mk9wqN4KRDUTyRKFYJ+MPTXU8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 97FB41A0346;
	Mon, 20 Apr 2026 12:52:40 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5F9B31A033A;
	Mon, 20 Apr 2026 12:52:40 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 5E301180028E;
	Mon, 20 Apr 2026 18:52:39 +0800 (+08)
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
Subject: [PATCH v9 1/7] i3c: master: Expose the APIs to support I3C hub
Date: Mon, 20 Apr 2026 16:22:16 +0530
Message-Id: <20260420105222.1562243-2-lakshay.piplani@nxp.com>
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
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>

---
Changes in v9:
 - No change

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
index 5cd4e5da2233..d11fe6937ba8 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1652,8 +1652,23 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
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
@@ -1677,6 +1692,7 @@ static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(i3c_master_reattach_i3c_dev);
 
 static void i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
 {
@@ -3195,6 +3211,16 @@ int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev, struct i3c_xfer *xfers,
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
@@ -3216,7 +3242,22 @@ int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
 
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
@@ -3231,7 +3272,20 @@ int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev)
 
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
@@ -3270,7 +3324,18 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
 
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
@@ -3301,6 +3366,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
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

