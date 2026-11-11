Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395322;
	b=2TK1JfOCAxtYmJiyroML5bjmvLOVBTepL46KRQ8YbfgzlS22I4p4x4vNIb/k9Cd/gO02
	 gg9BvdmGxYM2NGYU6onT0qlaJ01b+Ac8BLn0cR5Gr8hYhKy9WmVqHfUzArMa4r7nXp1b8
	 NFdnFDHoy2vd4j1irrtGmxw/BJvV6v2plTABnNr5DTV+S+Ae7QS3wQkU+UC50hwarHja5
	 JcaJ4jYJDSjcvAspqo5usn6fDJq1Cx989V4Fio97+Z/9Yi1J0jbNlnWfM4wUeHg3oXJOU
	 nqjsheZV12LgUioDhDbK0kdJpI3fhbqKW51nZOd55vBchpbZ33qUTY1IuyvpTgtHIrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=1XlqkjYgUHqMtiyvO2/LqlbV238Aov7kyKv1cwFa5P4=;
	b=XgL1dEbZmcpHTkNA0Sb3kWHCjiTNK/aH/kAQZamsZnGKvMcv4mkq9kwtwkEL1qzZ5SHd
	 RT4KX3a2bGc3xpLIKxtKWEocmFpQVoThMgyjb3Z1D5qJYup6Xsut2hbQPHFKFQkFFedPb
	 fEVATrMzCxrbMH5FLCL+jKQ7wzNQvhLWAUaS8K0sIJD+hI1xbKBgZNdGXJ1nBEUgx06Gx
	 hEBUcnNE1hbd/aLTZ3B7N7MczFrr/GRTK7xITsVOC12dEpsTrzN8y8/aXH5nK+Hw24dW8
	 5e2clOXLPgEez5IcN7iQt/tsnKkjvw3bjkAYEzqZ7G1QKu3pYegnyqjw2m9X0JcsYlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IEvbFdBC;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AC560A6F56
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60AC560A6F56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IEvbFdBC
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4923b9fdd43so2535276f8f.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395321; x=1795000121; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1XlqkjYgUHqMtiyvO2/LqlbV238Aov7kyKv1cwFa5P4=;
        b=IEvbFdBCypzS0fNB91Yc7eC2ClJ1Jatry1pvolvHYo50T4Fhc5mWp6vTYtpFRTVrs0
         X6E5EcDiUehejZrxp+5nri0yBkASXmlH//DCafzdal2GMSNh8fJfqvr9zBfHHsefHrWS
         aBz2opDOESYlF2c6zYUbYgLHzRlQlz1yGCAYh/Y5w8AYJ329OFgvfniTbVhNq8wVOo5Z
         TMqgA4sMeC/FBOrfCdZs6livjLwCyywZ0b3MiuM0I4BDudPhFkJXWe+5ZrsCAt1pvtsM
         6MOPdA0Ik1QudM8++GBBchAY0kjyjnrXFeIw/WAzzqzelyLNM3JJ6TXkhyEH3tobupE9
         q9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395321; x=1795000121;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1XlqkjYgUHqMtiyvO2/LqlbV238Aov7kyKv1cwFa5P4=;
        b=jwIANh8OxUOuD1oPQgG23oKf6umi1SEBSxSNeMwNKYJ7rFZNIcaWpiq/IboAtbEU30
         4rM5pT5a2sjhQE4q1jkndzpbJVQe/EbtORf8mRHWbDaAa8FyFsbDJgGZh24xt8L+mVIJ
         j+QAIzJMqxwpJ8szZ3Zg5RN+CZhsg2bBdt0mOKL5cqFgbXDHxj/NZ5UtssewYGKSXJ7m
         LoI6kYI+hxxs1rEcdDGbFyOng6SQ7nt/rmMrAXnuI0H1SL2e1qVuOXcZLdLAYs72t8lH
         lje3dBftHO9JJ4nlgZtXWUys8D8cnb6NK6U4O07wBjjoFAVpw/4+5rGE1zB4JaeHwxtZ
         J+rA==
X-Forwarded-Encrypted: i=1; AL+hErGNr3D7l2aGNMchTD/LbpEm2c08QCi0ysbscjYnYUXAF898bqdHItIpXqSygUTH7sjP+N0B55RE+4im@vger.kernel.org
X-Gm-Message-State: APuU4Z/ThC4V2CM5EJb7MUtxXSrGFMZ5x7mwGH3Bn7AodrcW0KsslAJI
	w17hFmVhZUBcG1SubdBe3uxFzXmazv8oYaHpWBAIw7n23rJMa1rSQH+RiN0O40Palxp3XPddcLI
	Pv2x+3wnBsbiifnpZ0eBeJw==
X-Received: from wrqn16.prod.google.com ([2002:a5d:4210:0:b0:48e:3826:ef3f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:481d:b0:493:803e:800f with SMTP id ffacd0b85a97d-499c6e96f58mr3024659f8f.29.1794395320547;
 Wed, 11 Nov 2026 03:08:40 -0800 (PST)
Date: Wed, 11 Nov 2026 11:07:38 +0000
In-Reply-To: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111110738.872947-9-vdonnefort@google.com>
Subject: [PATCH v3 8/8] optee: Add support for lendable-dma-pool
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, m.szyprowski@samsung.com, jenswi@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mark.rutland@arm.com, robin.murphy@arm.com, hch@lst.de, 
	ryan.roberts@arm.com, sumit.garg@kernel.org, sudeep.holla@kernel.org, 
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org, 
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, iommu@lists.linux.dev, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

When memory is lent to secure world, fatal CPU speculative reads can
still occur while it retains a cacheable mapping. Use the
lendable-dma-pool API to unmap pages before lending and restore them
upon reclaim.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/tee/optee/protmem.c | 48 ++++++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/tee/optee/protmem.c b/drivers/tee/optee/protmem.c
index be3abf6e8aa6..10e8f1540e5e 100644
--- a/drivers/tee/optee/protmem.c
+++ b/drivers/tee/optee/protmem.c
@@ -4,6 +4,7 @@
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/dma-mapping.h>
 #include <linux/errno.h>
 #include <linux/genalloc.h>
 #include <linux/slab.h>
@@ -21,6 +22,7 @@ struct optee_protmem_dyn_pool {
 	u_int mem_attr_count;
 	refcount_t refcount;
 	u32 use_case;
+	bool unmapped;
 	struct tee_shm *protmem;
 	/* Protects when initializing and tearing down this struct */
 	struct mutex mutex;
@@ -32,6 +34,35 @@ to_protmem_dyn_pool(struct tee_protmem_pool *pool)
 	return container_of(pool, struct optee_protmem_dyn_pool, pool);
 }
 
+static int zap_direct_map_dyn_protmem(struct optee_protmem_dyn_pool *rp)
+{
+	int ret;
+
+	ret = dma_zap_direct_map(&rp->optee->teedev->dev,
+				 phys_to_page(rp->protmem->paddr),
+				 rp->protmem->size);
+	if (ret && ret != -ENODEV)
+		return ret;
+
+	rp->unmapped = !ret;
+
+	return 0;
+}
+
+static void restore_direct_map_dyn_protmem(struct optee_protmem_dyn_pool *rp)
+{
+	if (WARN_ON(!rp->protmem))
+		return;
+
+	if (!rp->unmapped)
+		return;
+
+	dma_restore_direct_map(&rp->optee->teedev->dev,
+			       phys_to_page(rp->protmem->paddr),
+			       rp->protmem->size);
+	rp->unmapped = false;
+}
+
 static int init_dyn_protmem(struct optee_protmem_dyn_pool *rp)
 {
 	int rc;
@@ -42,19 +73,15 @@ static int init_dyn_protmem(struct optee_protmem_dyn_pool *rp)
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
+	rc = zap_direct_map_dyn_protmem(rp);
+	if (rc)
+		goto err_put_shm;
+
 	rc = rp->optee->ops->lend_protmem(rp->optee, rp->protmem,
 					  rp->mem_attrs,
 					  rp->mem_attr_count, rp->use_case);
 	if (rc)
-		goto err_put_shm;
+		goto err_restore_direct_map;
 	rp->protmem->flags |= TEE_SHM_DYNAMIC;
 
 	rp->gen_pool = gen_pool_create(PAGE_SHIFT, -1);
@@ -76,6 +103,8 @@ static int init_dyn_protmem(struct optee_protmem_dyn_pool *rp)
 	rp->gen_pool = NULL;
 err_reclaim:
 	rp->optee->ops->reclaim_protmem(rp->optee, rp->protmem);
+err_restore_direct_map:
+	restore_direct_map_dyn_protmem(rp);
 err_put_shm:
 	tee_shm_put(rp->protmem);
 err_null_protmem:
@@ -112,6 +141,7 @@ static void release_dyn_protmem(struct optee_protmem_dyn_pool *rp)
 	rp->gen_pool = NULL;
 
 	rp->optee->ops->reclaim_protmem(rp->optee, rp->protmem);
+	restore_direct_map_dyn_protmem(rp);
 	rp->protmem->flags &= ~TEE_SHM_DYNAMIC;
 
 	WARN(refcount_read(&rp->protmem->refcount) != 1, "Unexpected refcount");
-- 
2.56.0.542.g3ef89b7020-goog

