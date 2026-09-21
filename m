Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2375C48E0F8
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988470; cv=none; b=QXAZsJNk7JHVKghzb1TWLpY4kTSo5CzX5kmDh47ut5Yxq6t1L9XWTfnvKLl4CWzvjfewMOk0oWd3OmhLt8C8trZOLI4KdpkOynQj8x/fjbbbh+2+8Qh1sjyI5xqpMZAJ7ZA89x5JVGi1QWXx8DBUKtiwvwW1WaoLFMyOE8KHkDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988470; c=relaxed/simple;
	bh=crSJB8mHimPQYUC2eGv0NrncV7UaIOvRQXYK9SxofUo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F2loPojeXwdjxWtBVYkZtnSlej/pyyeBmd+7SsXiQRxoRTH/PRv2ef8LjKjBxTwt0rtJ2cKqczSHvP6aDUGR6rSY0n7YMIhHPNwdvEfWbx35PcH0XNhJGuO8d+lxtT55JchWsaS8654ARf6zsfe2BHT1giqwjnfwFKzxlg1rX3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aYbKHRpr; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aYbKHRpr"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e73659ac5so41375935e9.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 04:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789988464; x=1790593264; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cvjbTKhoGU/dDzLNariOWDtPZWx05brpq3W1pqMLn2I=;
        b=aYbKHRprg+FFM2byy4pWPRT08+haUq8ZYyyx1SvNjH7roOjWhOZd9TFppTSYlSbLrn
         SRzduKY8RV3ddEwgSYjw7JJt2oVkMHqhQwGwkznazsadxKM7AKKFKOsJsik9wgCtId4M
         0AYG5W/+RuSkiosZtzGPeecSYGsrAGZaTiI+UXgZN0kroRcdC3TJio59aC/Ef1d7Ljrj
         GYCdNiH7eGkI5wScdEFaikgRqIuv7j5zh2NWWeE6MuHr9nR1U1NUXkwKd6csnOkUFUEI
         iGnUUGuHNSiMQL0DCHtReEimTxNPuGAX+5H5WcRFLk+oJ1NQmcCI1JmyAnBan7VQzehb
         gzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988464; x=1790593264;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvjbTKhoGU/dDzLNariOWDtPZWx05brpq3W1pqMLn2I=;
        b=NgkeSRLhydvDWolc7BLCFg1qhxW/IVBKv9euP4Fh6PUR45TPpD9jxJfYw9PyRTCluM
         kl83Q8IBR/sHnfW4ZQS+jitvrqJip7UlCDRrl6lroP6KYuv9o6l0XYZCdOss4y3mb+YV
         XZCTFquYXSvJe6Nw3EcvL/8YG/XeHGxw1ijrRx34I+0UxG7qj3cEVd7UnaSb51JF0hCc
         krXYvHsdJBWuOg9t58wGZaFj7pszl+3borhiH1MI1Pw10X4iO90KPaNmoiczU939rZYn
         k2wCjwflP91qP9EDgdotXWZI8+zpWm1zLBtauC2yfMQ9Bb/fvXoZhcaB0dlr3PQaCBPH
         etkw==
X-Forwarded-Encrypted: i=1; AKwUvBz4SM01Db6Pp7Y8iCwETlUb/3iFNqeR4BdoatfqxAetEYnKrRvLY/XaRBWBUpRkOqPK1NwUO4Bc4Kqb@vger.kernel.org
X-Gm-Message-State: AFuF++nfpR7C2iWO1p4XeJVZHTnZEixMjeOGPqJIFpTWrgdgskqIBxnY
	8eAjuosKJHDb/3VBZeGPQ1Tb35fNsjkQ2r0bG7AtbfTAHrAi3cJt7M6yI3P0lGi54QUBRUuOj4Y
	snO8T5nlaenC6c2I+Bhvu0g==
X-Received: from wmix8-n2.prod.google.com ([2002:a05:600c:e548:20b0:49d:2730:73de])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d25:b0:49f:d753:3de9 with SMTP id 5b1f17b1804b1-49fd7533df5mr5289235e9.33.1789988463507;
 Mon, 21 Sep 2026 04:01:03 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:00:48 +0100
In-Reply-To: <20260921110050.3977591-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921110050.3977591-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921110050.3977591-7-vdonnefort@google.com>
Subject: [PATCH v2 6/8] optee: Add support for arm,ffa-lend-pool
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Hook OP-TEE dynamically allocated protected memory pools to the
"arm,ffa-lend-pool" driver. While the SMC transport platform device
resolves the pool through its DT "memory-region" property, the FF-A
transport lacks a device tree node and binds via ffa_lend_pool_attach().

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/tee/optee/Makefile        |  1 +
 drivers/tee/optee/core.c          |  6 +++
 drivers/tee/optee/ffa_abi.c       | 13 +++++-
 drivers/tee/optee/ffa_lend_pool.c | 72 +++++++++++++++++++++++++++++++
 drivers/tee/optee/optee_private.h |  4 ++
 drivers/tee/optee/protmem.c       | 20 +++++----
 drivers/tee/optee/smc_abi.c       | 21 ++++++---
 7 files changed, 121 insertions(+), 16 deletions(-)
 create mode 100644 drivers/tee/optee/ffa_lend_pool.c

diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
index ad7049c1c107..4986d863b9f7 100644
--- a/drivers/tee/optee/Makefile
+++ b/drivers/tee/optee/Makefile
@@ -9,6 +9,7 @@ optee-objs += supp.o
 optee-objs += device.o
 optee-objs += smc_abi.o
 optee-objs += ffa_abi.o
+optee-objs += ffa_lend_pool.o
 
 # for tracing framework to find optee_trace.h
 CFLAGS_smc_abi.o := -I$(src)
diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index a52c1f498b99..39f315cea830 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -201,6 +201,12 @@ void optee_remove_common(struct optee *optee)
 	/* Unregister OP-TEE specific client devices on TEE bus */
 	optee_unregister_devices();
 
+	/*
+	 * Must follow optee_unregister_devices(). Clients require the lend pool
+	 * linkage to successfully free their memory.
+	 */
+	optee_lend_pool_unregister(optee);
+
 	optee_notif_uninit(optee);
 	optee_shm_arg_cache_uninit(optee);
 	teedev_close_context(optee->ctx);
diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index 633715b98625..e979dbc9a547 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -1042,13 +1042,21 @@ static int optee_ffa_protmem_pool_init(struct optee *optee, u32 sec_caps)
 	int rc = 0;
 
 	if (sec_caps & OPTEE_FFA_SEC_CAP_PROTMEM) {
+		rc = optee_lend_pool_register(optee);
+		if (rc)
+			return rc;
+
 		pool = optee_protmem_alloc_dyn_pool(optee, id);
-		if (IS_ERR(pool))
+		if (IS_ERR(pool)) {
+			optee_lend_pool_unregister(optee);
 			return PTR_ERR(pool);
+		}
 
 		rc = tee_device_register_dma_heap(optee->teedev, id, pool);
-		if (rc)
+		if (rc) {
+			optee_lend_pool_unregister(optee);
 			pool->ops->destroy_pool(pool);
+		}
 	}
 
 	return rc;
@@ -1172,6 +1180,7 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
 
 err_unregister_devices:
 	optee_unregister_devices();
+	optee_lend_pool_unregister(optee);
 	if (optee->ffa.bottom_half_value != U32_MAX)
 		notif_ops->notify_relinquish(ffa_dev,
 					     optee->ffa.bottom_half_value);
diff --git a/drivers/tee/optee/ffa_lend_pool.c b/drivers/tee/optee/ffa_lend_pool.c
new file mode 100644
index 000000000000..b865c37efd5a
--- /dev/null
+++ b/drivers/tee/optee/ffa_lend_pool.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Support for the arm,ffa-lend-pool, unmaps lent memory from the host stage-1
+ * to mitigate for CPU speculative read of Secure memory
+ *
+ * Copyright (C) 2026 Google LLC.
+ * Author: Vincent Donnefort <vdonnefort@google.com>
+ */
+
+#include <linux/arm_ffa.h>
+#include <linux/errno.h>
+#include <linux/of_reserved_mem.h>
+
+#include "optee_private.h"
+
+static struct device_node *optee_dev_node(struct optee *optee)
+{
+	return dev_of_node(optee->teedev->dev.parent);
+}
+
+static struct device *optee_device(struct optee *optee)
+{
+	return &optee->teedev->dev;
+}
+
+static int optee_lend_pool_err(int err)
+{
+	/*
+	 * Registration of the arm,ffa-lend-pool reserved-memory is optional as
+	 * another (although less performant) stage-2 mitigation might be in
+	 * place.
+	 */
+	if (err == -ENODEV)
+		return 0;
+
+	return err;
+}
+
+int optee_lend_pool_register(struct optee *optee)
+{
+	struct device_node *np = optee_dev_node(optee);
+	struct device *dev = optee_device(optee);
+	int ret;
+
+	if (np)
+		ret = of_reserved_mem_device_init_by_idx(dev, np, 0);
+	else
+		ret = ffa_lend_pool_attach(dev);
+
+	return optee_lend_pool_err(ret);
+}
+
+void optee_lend_pool_unregister(struct optee *optee)
+{
+	struct device_node *np = optee_dev_node(optee);
+	struct device *dev = optee_device(optee);
+
+	if (np)
+		of_reserved_mem_device_release(dev);
+	else
+		ffa_lend_pool_detach(dev);
+}
+
+int optee_lend_pool_prepare(struct optee *optee, struct page *page, u64 nr_pages)
+{
+	return optee_lend_pool_err(ffa_prepare_lend(optee_device(optee), page, nr_pages));
+}
+
+void optee_lend_pool_reclaimed(struct optee *optee, struct page *page, u64 nr_pages)
+{
+	ffa_lend_reclaimed(optee_device(optee), page, nr_pages);
+}
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index aefe1e6f5689..f26723e81573 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -325,6 +325,10 @@ void optee_supp_uninit(struct optee_supp *supp);
 void optee_supp_release(struct optee_supp *supp);
 struct tee_protmem_pool *optee_protmem_alloc_dyn_pool(struct optee *optee,
 						      enum tee_dma_heap_id id);
+int optee_lend_pool_register(struct optee *optee);
+void optee_lend_pool_unregister(struct optee *optee);
+int optee_lend_pool_prepare(struct optee *optee, struct page *page, u64 nr_pages);
+void optee_lend_pool_reclaimed(struct optee *optee, struct page *page, u64 nr_pages);
 
 int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
 		    struct tee_param *param);
diff --git a/drivers/tee/optee/protmem.c b/drivers/tee/optee/protmem.c
index be3abf6e8aa6..b8ee372d20c0 100644
--- a/drivers/tee/optee/protmem.c
+++ b/drivers/tee/optee/protmem.c
@@ -42,19 +42,16 @@ static int init_dyn_protmem(struct optee_protmem_dyn_pool *rp)
 		goto err_null_protmem;
 	}
 
-	/*
-	 * TODO unmap the memory range since the physical memory will
-	 * become inaccesible after the lend_protmem() call.
-	 *
-	 * If the platform supports a hypervisor at EL2, it will unmap the
-	 * intermediate physical memory for us and stop cache pre-fetch of
-	 * the memory.
-	 */
+	rc = optee_lend_pool_prepare(rp->optee, phys_to_page(rp->protmem->paddr),
+				     rp->page_count);
+	if (rc)
+		goto err_put_shm;
+
 	rc = rp->optee->ops->lend_protmem(rp->optee, rp->protmem,
 					  rp->mem_attrs,
 					  rp->mem_attr_count, rp->use_case);
 	if (rc)
-		goto err_put_shm;
+		goto err_lend_pool_reclaimed;
 	rp->protmem->flags |= TEE_SHM_DYNAMIC;
 
 	rp->gen_pool = gen_pool_create(PAGE_SHIFT, -1);
@@ -76,6 +73,9 @@ static int init_dyn_protmem(struct optee_protmem_dyn_pool *rp)
 	rp->gen_pool = NULL;
 err_reclaim:
 	rp->optee->ops->reclaim_protmem(rp->optee, rp->protmem);
+err_lend_pool_reclaimed:
+	optee_lend_pool_reclaimed(rp->optee, phys_to_page(rp->protmem->paddr),
+				  rp->page_count);
 err_put_shm:
 	tee_shm_put(rp->protmem);
 err_null_protmem:
@@ -112,6 +112,8 @@ static void release_dyn_protmem(struct optee_protmem_dyn_pool *rp)
 	rp->gen_pool = NULL;
 
 	rp->optee->ops->reclaim_protmem(rp->optee, rp->protmem);
+	optee_lend_pool_reclaimed(rp->optee, phys_to_page(rp->protmem->paddr),
+				  rp->page_count);
 	rp->protmem->flags &= ~TEE_SHM_DYNAMIC;
 
 	WARN(refcount_read(&rp->protmem->refcount) != 1, "Unexpected refcount");
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index b8a2bdac3208..e46eb881cf90 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1522,7 +1522,6 @@ static void optee_smc_remove(struct platform_device *pdev)
 		optee_disable_shm_cache(optee);
 
 	optee_smc_notif_uninit_irq(optee);
-
 	optee_remove_common(optee);
 
 	if (optee->smc.memremaped_shm)
@@ -1714,14 +1713,25 @@ static int optee_protmem_pool_init(struct optee *optee)
 
 	if (protm)
 		pool = static_protmem_pool_init(optee);
-	if (dyn_protm && IS_ERR(pool))
+	if (dyn_protm && IS_ERR(pool)) {
+		rc = optee_lend_pool_register(optee);
+		if (rc)
+			return rc;
+
 		pool = optee_protmem_alloc_dyn_pool(optee, heap_id);
+		if (IS_ERR(pool)) {
+			optee_lend_pool_unregister(optee);
+			return PTR_ERR(pool);
+		}
+	}
 	if (IS_ERR(pool))
 		return PTR_ERR(pool);
 
 	rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
-	if (rc)
+	if (rc) {
+		optee_lend_pool_unregister(optee);
 		pool->ops->destroy_pool(pool);
+	}
 
 	return rc;
 }
@@ -1833,14 +1843,14 @@ static int optee_probe(struct platform_device *pdev)
 	    (sec_caps & OPTEE_SMC_SEC_CAP_RPMB_PROBE))
 		optee->in_kernel_rpmb_routing = true;
 
-	teedev = tee_device_alloc(&optee_clnt_desc, NULL, pool, optee);
+	teedev = tee_device_alloc(&optee_clnt_desc, &pdev->dev, pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_free_optee;
 	}
 	optee->teedev = teedev;
 
-	teedev = tee_device_alloc(&optee_supp_desc, NULL, pool, optee);
+	teedev = tee_device_alloc(&optee_supp_desc, &pdev->dev, pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_unreg_teedev;
@@ -1932,6 +1942,7 @@ static int optee_probe(struct platform_device *pdev)
 		optee_disable_shm_cache(optee);
 	optee_smc_notif_uninit_irq(optee);
 	optee_unregister_devices();
+	optee_lend_pool_unregister(optee);
 err_notif_uninit:
 	optee_notif_uninit(optee);
 err_close_ctx:
-- 
2.55.0.1082.g2b9226bbc0-goog

