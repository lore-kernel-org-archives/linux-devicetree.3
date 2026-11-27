Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780900;
	b=jBpr1Cs+MkqGEmuWFgiDYYAeycQid+aS4kZ47ZnykLG6IMxnMd9CdVDNMXhsSqfUQYQG
	 8Jyq3x+QZ49hMx+SxukmmVJDDKTe9WP9W9HZ+TUPUBnLg8ZaUPOmUnjUncWEF2jJ5DRfJ
	 9lp2gBUXIFISuTvjhJfao0tyY1fGLzqrFb5aBrSQoGmKMKjKmRoPGLDoHIKREn+AUSzq2
	 ppnGo67uXTmCB0PrM65q1LqesavKKlVi/Qw8Koum0WqCA0ryLdXDuwaIc/sVHOTukAxw3
	 2Og00XDM9BswkktH+6bSMIXxEDSx5p+/oy+IT4Amyf7MthAfcbIH7q0Mk6QJaEkCmCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nxc11hNBW94mgo6fpLwgg5kNO2aiNmHNREZLRKJ6+6w=;
	b=vJMcwVOpMBUx9oReDJaVNHDgopSTbh1aeILo5M4jcV1OEMJaFKu2cU5Wr2L8QeuZ+pCE
	 QWwU4lFeKWYvmTOvxqSVMPyA255YxllCBHA7HCLlleGopWiR46Ke96XathYTlxqsRz9WC
	 SB1jQTvZQjMGhNU+25oC685YtjGsbWgCISgOp0J4pDQPnPTdE7+6T/1MrHl7cCdG3azDl
	 Aa6731Kvqwb79SF+elsaV2U9GdkpIRsqatEPv9s1GlSz6paNZiDTmtBVslYfMrLgU9zrD
	 2d1dq0j8sYEtUnAd4cbYxFo4rjV64TL4nwx+jwpmsd/NcmnSx/EvhKPg1NF0mzCMnFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KHqgnAHE;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2779C606A326
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2779C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KHqgnAHE
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492690dd5daso6138861f8f.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780898; x=1796385698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxc11hNBW94mgo6fpLwgg5kNO2aiNmHNREZLRKJ6+6w=;
        b=KHqgnAHEOhn/4xaotXNJGm/oleWgjpLyK0OCxX3lKPxwbWtOhSLUOI8jaXA+rUc9Bw
         C/BitbHA+938MTFLN79QqgyalSCwmj71CO//jwIjz9RK+6fHKsIF8QXHpI57WHXrfvGA
         uVhphUUHBhfyQwXMGX+KJXyzRyjdJeFtMRTBuIIoMTsIsQ7MP14683ZDtypTwjLxBH3u
         MhBw+XkJmL+prGZl4izMAyCL/8G0OF78SyFg4PI3jVLQ4jpw8rq4w83Os4RgIER5mpwX
         jLylB2sVYwzAmR4P7hDgelxPsqSv6xVmA77kmeexT7UHlWF+v3Lf166Jv4DhUJ+4loAL
         NIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780898; x=1796385698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxc11hNBW94mgo6fpLwgg5kNO2aiNmHNREZLRKJ6+6w=;
        b=pT4rowC0T4cfPryRKRsANkUcOjXRhWsByl81p32QVFw1uGR/2PCnPlnnoXenWuxv+W
         DUv1g6c8ZKAxVkB3gmCE56WVlwB1S/U6NELlAvf8ocTXY6vHaiXQZCijTipeHJM9/9V5
         SqQbxmhXod6QfOo410ixR+hv8encytvdQ4Z6PP3mFyfkW4D9XuO4VYGb2w5v+JCwcRXw
         fgi6PWotNHH+iqqT0wgLDmbxBV+Qv24w0IelKdylS9p+25dTvkUpfFL9KFd9g/XZHUJm
         eyYS2PaobNVYY2bBxOlnOB4E2AtejKN7CkRV1wwwctkq9gjCcMBwIXN9DgsaTwq9gI1s
         yVZg==
X-Forwarded-Encrypted: i=1; AL+hErFd7J5vqNNgVCJM4DGRPh5tBBKsK5tHfOao/wG+zou6eHXRtpImlP6pDOiOw1zTbII0xys5WAHKurTA@vger.kernel.org
X-Gm-Message-State: APuU4Z+UTNEIdh8Ef1TbA0moyStXkgbEHWStpsys7dtVl2MxP+0jA116
	jjNbWazz4LhUe8r3Lhm5Wg5d3eYLCaxnFnzGEVgfcX1flBRoXFhqpb/n
X-Gm-Gg: AZFdTZetWqQJevKBXUUSJwyaT9vkjAHvW7dIiQOvTxwwmw4YxkdwB1ab67XKfixaqCr
	QV/0/Zoser4Fk3yGdr4i+E7LCcvjtVGBGSZije/ZHW0OmycSFH4C966FwKNd/XpaEmNP6F4ncP9
	J/L00sZRoEgU2gEQqdTLleDzYcWjSuWmi3MrsoLgVrVEtKIJW5QhZEoVyreoyevtXzIvtHKAp82
	po2w6OsnHx+bHlqzciD62/fg1TVOE0Drvs+fKSDXT/XGWfc+ESJpFQpxQ+7dVeXzi0BZIi46sz0
	LVlDLZux4wJ4dIdNVMxqmNEC1gIXEYHwlRS0kY2vL44K7q0mc++RLRPgt6rSNdR3f1Smj8VYE0p
	0m8wQgIA7qSpVUzlVbh5vISD+wqph3ZU1dEhM97cURkKJh0xuFKDGCogR2pyBkCgHqlwfW8Aih1
	h61M7yPCO3nOVqy4h84hMSnU2cwrns5fs0OsbgRj/GtIWKlXopYkcEl1XoztjIHthaBFsflDKU5
	9tt2PxlsfrWoZupwptknIuZvAKBhQMdCQKTR+GboTAsv5jxZjdbbfYvooCRI95hJ9CZ46XWa22I
	Pi7k6jtyblTpS7r21patKE4rnbipldcN6yDzLN6E+hrcKvP5G9/ycjvyrfAVf1+j3QD/
X-Received: by 2002:a05:600c:a085:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4bb88811c75mr511614215e9.19.1795780896830;
        Fri, 27 Nov 2026 04:01:36 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:35 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v14 13/30] crypto: amlogic - Introduce hasher
Date: Fri, 27 Nov 2026 13:00:46 +0100
Message-ID: <20261127120103.1532882-14-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexey Romanov <romanov.alexey2000@gmail.com>

Introduce support for SHA1/SHA224/SHA256 hash algos.
Tested via tcrypt and custom tests.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/Makefile             |   2 +-
 drivers/crypto/amlogic/amlogic-gxl-core.c   |  25 +-
 drivers/crypto/amlogic/amlogic-gxl-hasher.c | 485 ++++++++++++++++++++
 drivers/crypto/amlogic/amlogic-gxl.h        |  48 ++
 4 files changed, 558 insertions(+), 2 deletions(-)
 create mode 100644 drivers/crypto/amlogic/amlogic-gxl-hasher.c

diff --git a/drivers/crypto/amlogic/Makefile b/drivers/crypto/amlogic/Makefile
index 39057e62c13e..4b6b388b7880 100644
--- a/drivers/crypto/amlogic/Makefile
+++ b/drivers/crypto/amlogic/Makefile
@@ -1,2 +1,2 @@
 obj-$(CONFIG_CRYPTO_DEV_AMLOGIC_GXL) += amlogic-gxl-crypto.o
-amlogic-gxl-crypto-y := amlogic-gxl-core.o amlogic-gxl-cipher.o
+amlogic-gxl-crypto-y := amlogic-gxl-core.o amlogic-gxl-cipher.o amlogic-gxl-hasher.o
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 0e17105520df..9676b86a5089 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -19,6 +19,9 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <crypto/internal/skcipher.h>
+#include <crypto/internal/hash.h>
+#include <linux/dma-mapping.h>
 
 #include "amlogic-gxl.h"
 
@@ -172,6 +175,15 @@ int meson_register_algs(struct meson_dev *mc, struct meson_alg_template *algs,
 				return err;
 			}
 			break;
+		case CRYPTO_ALG_TYPE_AHASH:
+			err = crypto_engine_register_ahash(&algs[i].alg.ahash);
+			if (err) {
+				dev_err(mc->dev, "Fail to register %s\n",
+					algs[i].alg.ahash.base.halg.base.cra_name);
+				meson_unregister_algs(mc, algs, count);
+				return err;
+			}
+			break;
 		}
 	}
 
@@ -190,6 +202,9 @@ void meson_unregister_algs(struct meson_dev *mc, struct meson_alg_template *algs
 		case CRYPTO_ALG_TYPE_SKCIPHER:
 			crypto_engine_unregister_skcipher(&algs[i].alg.skcipher);
 			break;
+		case CRYPTO_ALG_TYPE_AHASH:
+			crypto_engine_unregister_ahash(&algs[i].alg.ahash);
+			break;
 		}
 	}
 }
@@ -227,13 +242,20 @@ static int meson_crypto_probe(struct platform_device *pdev)
 
 		dbgfs_dir = debugfs_create_dir("gxl-crypto", NULL);
 		debugfs_create_file("stats", 0444, dbgfs_dir, mc, &meson_debugfs_fops);
-
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
 		mc->dbgfs_dir = dbgfs_dir;
 #endif
 	}
 
+	err = meson_hasher_register(mc);
+	if (err)
+		goto error_hasher;
+
 	return 0;
+
+error_hasher:
+	meson_cipher_unregister(mc);
+
 error_flow:
 	meson_free_chanlist(mc, mc->flow_cnt - 1);
 	return err;
@@ -256,6 +278,7 @@ static const struct meson_pdata meson_gxl_pdata = {
 	.descs_reg = 0x0,
 	.status_reg = 0x4,
 	.setup_desc_cnt = 3,
+	.hasher_supported = false,
 };
 
 static const struct of_device_id meson_crypto_of_match_table[] = {
diff --git a/drivers/crypto/amlogic/amlogic-gxl-hasher.c b/drivers/crypto/amlogic/amlogic-gxl-hasher.c
new file mode 100644
index 000000000000..c83739ec3456
--- /dev/null
+++ b/drivers/crypto/amlogic/amlogic-gxl-hasher.c
@@ -0,0 +1,485 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hardware asynchronous hasher for Amlogic SoC's.
+ *
+ * Author: Alexey Romanov <romanov.alexey2000@gmail.com>
+ */
+
+#include <linux/crypto.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <crypto/internal/hash.h>
+#include <crypto/sha1.h>
+#include <crypto/sha2.h>
+
+#include "amlogic-gxl.h"
+
+static int meson_sha_init(struct ahash_request *req)
+{
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct meson_hasher_tfm_ctx *tctx = crypto_ahash_ctx_dma(tfm);
+	struct meson_hasher_req_ctx *rctx = ahash_request_ctx(req);
+
+	memset(rctx, 0, sizeof(struct meson_hasher_req_ctx));
+
+	rctx->flow = meson_get_engine_number(tctx->mc);
+	rctx->begin_req = true;
+
+	return 0;
+}
+
+static int meson_sha_update(struct ahash_request *req)
+{
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct meson_hasher_tfm_ctx *tctx = crypto_ahash_ctx_dma(tfm);
+	struct meson_hasher_req_ctx *rctx = ahash_request_ctx(req);
+	struct crypto_engine *engine = tctx->mc->chanlist[rctx->flow].engine;
+
+	return crypto_transfer_hash_request_to_engine(engine, req);
+}
+
+static int meson_sha_final(struct ahash_request *req)
+{
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct meson_hasher_tfm_ctx *tctx = crypto_ahash_ctx_dma(tfm);
+	struct meson_hasher_req_ctx *rctx = ahash_request_ctx(req);
+	struct crypto_engine *engine = tctx->mc->chanlist[rctx->flow].engine;
+
+	rctx->final_req = true;
+
+	return crypto_transfer_hash_request_to_engine(engine, req);
+}
+
+static int meson_hasher_req_map(struct ahash_request *req)
+{
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct meson_hasher_tfm_ctx *tctx = crypto_ahash_ctx_dma(tfm);
+	struct meson_dev *mc = tctx->mc;
+	int ret;
+
+	if (!req->nbytes)
+		return 0;
+
+	ret = dma_map_sg(mc->dev, req->src, sg_nents(req->src), DMA_TO_DEVICE);
+	if (!ret) {
+		dev_err(mc->dev, "Cannot DMA MAP request data\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void meson_hasher_req_unmap(struct ahash_request *req)
+{
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct meson_hasher_tfm_ctx *tctx = crypto_ahash_ctx_dma(tfm);
+	struct meson_dev *mc = tctx->mc;
+
+	if (!req->nbytes)
+		return;
+
+	dma_unmap_sg(mc->dev, req->src, sg_nents(req->src), DMA_TO_DEVICE);
+}
+
+struct hasher_ctx {
+	struct crypto_async_request *areq;
+
+	unsigned int tloffset;
+	unsigned int nbytes;
+	unsigned int todo;
+
+	dma_addr_t state_addr;
+	dma_addr_t src_addr;
+	unsigned int src_offset;
+	struct scatterlist *src_sg;
+};
+
+static bool meson_final(struct hasher_ctx *ctx)
+{
+	struct ahash_request *req = ahash_request_cast(ctx->areq);
+	struct meson_hasher_req_ctx *rctx = ahash_request_ctx(req);
+
+	return !ctx->nbytes && rctx->final_req;
+}
+
+static int meson_fill_partial_buffer(struct hasher_ctx *ctx, unsigned int len)
+{
+	struct ahash_request *req = ahash_request_cast(ctx->areq);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct meson_hasher_tfm_ctx *tctx = crypto_ahash_ctx_dma(tfm);
+	struct meson_hasher_req_ctx *rctx = ahash_request_ctx(req);
+	struct meson_dev *mc = tctx->mc;
+	unsigned int blocksize = crypto_ahash_blocksize(tfm);
+	unsigned int copy;
+
+	if (len) {
+		copy = min(blocksize - rctx->partial_size, len);
+		memcpy(rctx->partial + rctx->partial_size,
+		       sg_virt(ctx->src_sg) + ctx->src_offset, copy);
+
+		rctx->partial_size += copy;
+		ctx->nbytes -= copy;
+		ctx->src_offset += copy;
+	}
+
+	if (rctx->partial_size == blocksize || meson_final(ctx)) {
+		rctx->partial_addr = dma_map_single(mc->dev,
+						    rctx->partial,
+						    rctx->partial_size,
+						    DMA_TO_DEVICE);
+		if (dma_mapping_error(mc->dev, rctx->partial_addr)) {
+			dev_err(mc->dev, "Cannot DMA MAP SHA partial buffer\n");
+			return -ENOMEM;
+		}
+
+		rctx->partial_mapped = true;
+		ctx->todo = rctx->partial_size;
+		ctx->src_addr = rctx->partial_addr;
+	}
+
+	return 0;
+}
+
+static unsigned int meson_setup_data_descs(struct hasher_ctx *ctx)
+{
+	struct ahash_request *req = ahash_request_cast(ctx->areq);
+	struct meson_hasher_req_ctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct meson_hasher_tfm_ctx *tctx = crypto_ahash_ctx_dma(tfm);
+	struct meson_dev *mc = tctx->mc;
+	struct meson_flow *flow = &mc->chanlist[rctx->flow];
+	struct hash_alg_common *alg = crypto_hash_alg_common(tfm);
+	struct meson_alg_template *algt = container_of(alg,
+		struct meson_alg_template, alg.ahash.base.halg);
+	struct meson_desc *desc = &flow->tl[ctx->tloffset];
+	u32 v;
+
+	ctx->tloffset++;
+
+	v = DESC_OWN | DESC_ENCRYPTION | DESC_OPMODE_SHA |
+	    ctx->todo | algt->blockmode;
+	if (rctx->begin_req) {
+		rctx->begin_req = false;
+		v |= DESC_BEGIN;
+	}
+
+	if (!ctx->nbytes && rctx->final_req) {
+		rctx->final_req = false;
+		v |= DESC_END;
+	}
+
+	if (!ctx->nbytes || ctx->tloffset == MAXDESC || rctx->partial_mapped)
+		v |= DESC_LAST;
+
+	desc->t_src = cpu_to_le32(ctx->src_addr);
+	desc->t_dst = cpu_to_le32(ctx->state_addr);
+	desc->t_status = cpu_to_le32(v);
+
+	return v & DESC_LAST;
+}
+
+static int meson_kick_hardware(struct hasher_ctx *ctx)
+{
+	struct ahash_request *req = ahash_request_cast(ctx->areq);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct meson_hasher_req_ctx *rctx = ahash_request_ctx(req);
+	struct meson_hasher_tfm_ctx *tctx = crypto_ahash_ctx_dma(tfm);
+	struct meson_dev *mc = tctx->mc;
+	struct meson_flow *flow = &mc->chanlist[rctx->flow];
+	int ret;
+
+	reinit_completion(&flow->complete);
+	meson_dma_start(mc, rctx->flow);
+
+	ret = wait_for_completion_timeout(&flow->complete,
+					  msecs_to_jiffies(500));
+	if (ret == 0) {
+		dev_err(mc->dev, "DMA timeout for flow %d\n", rctx->flow);
+		return -EINVAL;
+	} else if (ret < 0) {
+		dev_err(mc->dev, "Waiting for DMA completion is failed (%d)\n", ret);
+		return ret;
+	}
+
+	if (rctx->partial_mapped) {
+		dma_unmap_single(mc->dev, rctx->partial_addr,
+				 rctx->partial_size,
+				 DMA_TO_DEVICE);
+		rctx->partial_size = 0;
+		rctx->partial_mapped = false;
+	}
+
+	ctx->tloffset = 0;
+
+	return 0;
+}
+
+static void meson_setup_state_descs(struct hasher_ctx *ctx)
+{
+	struct ahash_request *req = ahash_request_cast(ctx->areq);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct meson_hasher_req_ctx *rctx = ahash_request_ctx(req);
+	struct meson_hasher_tfm_ctx *tctx = crypto_ahash_ctx_dma(tfm);
+	struct meson_dev *mc = tctx->mc;
+	struct meson_desc *desc;
+	int i;
+
+	if (ctx->tloffset || rctx->begin_req)
+		return;
+
+	for (i = 0; i < mc->pdata->setup_desc_cnt; i++) {
+		int offset = i * 16;
+
+		desc = &mc->chanlist[rctx->flow].tl[ctx->tloffset];
+		desc->t_src = cpu_to_le32(ctx->state_addr + offset);
+		desc->t_dst = cpu_to_le32(offset);
+		desc->t_status = cpu_to_le32(MESON_SHA_BUFFER_SIZE |
+					     DESC_MODE_KEY | DESC_OWN);
+
+		ctx->tloffset++;
+	}
+}
+
+static int meson_hasher_do_one_request(struct crypto_engine *engine, void *areq)
+{
+	struct ahash_request *req = ahash_request_cast(areq);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct meson_hasher_tfm_ctx *tctx = crypto_ahash_ctx_dma(tfm);
+	struct meson_hasher_req_ctx *rctx = ahash_request_ctx(req);
+	struct meson_dev *mc = tctx->mc;
+	struct hasher_ctx ctx = {
+		.tloffset = 0,
+		.src_offset = 0,
+		.nbytes = rctx->final_req ? 0 : req->nbytes,
+		.src_sg = req->src,
+		.areq = areq,
+	};
+	unsigned int blocksize = crypto_ahash_blocksize(tfm);
+	unsigned int digest_size = crypto_ahash_digestsize(tfm);
+	bool final_req = rctx->final_req;
+	int ret;
+
+	ctx.state_addr = dma_map_single(mc->dev, rctx->state,
+					sizeof(rctx->state), DMA_BIDIRECTIONAL);
+	ret = dma_mapping_error(mc->dev, ctx.state_addr);
+	if (ret) {
+		dev_err(mc->dev, "Cannot DMA MAP SHA state buffer");
+		goto fail_map_single;
+	}
+
+	ret = meson_hasher_req_map(req);
+	if (ret)
+		goto fail_map_req;
+
+	for (;;) {
+		unsigned int len = ctx.src_sg ?
+			min(sg_dma_len(ctx.src_sg) - ctx.src_offset, ctx.nbytes) : 0;
+
+		ctx.src_addr = 0;
+		ctx.todo = 0;
+
+		if (!rctx->final_req && !ctx.nbytes)
+			break;
+
+		meson_setup_state_descs(&ctx);
+
+		if (rctx->partial_size && rctx->partial_size < blocksize) {
+			ret = meson_fill_partial_buffer(&ctx, len);
+			if (ret)
+				goto fail;
+		} else if (len && len < blocksize) {
+			memcpy(rctx->partial, sg_virt(ctx.src_sg) + ctx.src_offset, len);
+
+			rctx->partial_size = len;
+			ctx.nbytes -= len;
+			ctx.src_offset += len;
+		} else if (len) {
+			ctx.src_addr = sg_dma_address(ctx.src_sg) + ctx.src_offset;
+			ctx.todo = min(rounddown(DESC_MAXLEN, blocksize),
+				       rounddown(len, blocksize));
+			ctx.nbytes -= ctx.todo;
+			ctx.src_offset += ctx.todo;
+		}
+
+		if (ctx.src_sg && ctx.src_offset == sg_dma_len(ctx.src_sg)) {
+			ctx.src_offset = 0;
+			ctx.src_sg = sg_next(ctx.src_sg);
+		}
+
+		if (!ctx.todo && ctx.nbytes)
+			continue;
+
+		if (!ctx.todo && !rctx->final_req && !ctx.tloffset)
+			continue;
+
+		if (meson_setup_data_descs(&ctx)) {
+			ret = meson_kick_hardware(&ctx);
+			if (ret)
+				goto fail;
+		}
+	}
+
+fail:
+	meson_hasher_req_unmap(req);
+
+fail_map_req:
+	dma_unmap_single(mc->dev, ctx.state_addr, sizeof(rctx->state),
+			 DMA_BIDIRECTIONAL);
+
+fail_map_single:
+	if (final_req && ret == 0)
+		memcpy(req->result, rctx->state, digest_size);
+
+	local_bh_disable();
+	crypto_finalize_hash_request(engine, req, ret);
+	local_bh_enable();
+
+	return ret;
+}
+
+static int meson_hasher_export(struct ahash_request *req, void *out)
+{
+	struct meson_hasher_req_ctx *rctx = ahash_request_ctx(req);
+
+	memcpy(out, rctx, sizeof(*rctx));
+	return 0;
+}
+
+static int meson_hasher_import(struct ahash_request *req, const void *in)
+{
+	struct meson_hasher_req_ctx *rctx = ahash_request_ctx(req);
+
+	memcpy(rctx, in, sizeof(*rctx));
+	return 0;
+}
+
+static int meson_hasher_init(struct crypto_tfm *tfm)
+{
+	struct meson_hasher_tfm_ctx *tctx = crypto_tfm_ctx_dma(tfm);
+	struct crypto_ahash *atfm = __crypto_ahash_cast(tfm);
+	struct hash_alg_common *alg = crypto_hash_alg_common(atfm);
+	struct meson_alg_template *algt = container_of(alg,
+		struct meson_alg_template, alg.ahash.base.halg);
+
+	crypto_ahash_set_reqsize_dma(atfm, crypto_ahash_statesize(atfm));
+
+	memset(tctx, 0, sizeof(struct meson_hasher_tfm_ctx));
+
+	tctx->mc = algt->mc;
+
+	return 0;
+}
+
+static struct meson_alg_template mc_algs[] = {
+{
+	.type = CRYPTO_ALG_TYPE_AHASH,
+	.blockmode = DESC_MODE_SHA1,
+	.alg.ahash.base = {
+		.halg = {
+			.base = {
+				.cra_name = "sha1",
+				.cra_driver_name = "sha1-gxl",
+				.cra_priority = 400,
+				.cra_blocksize = SHA1_BLOCK_SIZE,
+				.cra_flags = CRYPTO_ALG_ASYNC,
+				.cra_module = THIS_MODULE,
+				.cra_alignmask = 0,
+				.cra_init = meson_hasher_init,
+			},
+			.digestsize = SHA1_DIGEST_SIZE,
+			.statesize = sizeof(struct meson_hasher_req_ctx),
+		},
+		.init = meson_sha_init,
+		.update = meson_sha_update,
+		.final = meson_sha_final,
+		.export = meson_hasher_export,
+		.import = meson_hasher_import,
+	},
+	.alg.ahash.op = {
+		.do_one_request = meson_hasher_do_one_request,
+	},
+},
+{
+	.type = CRYPTO_ALG_TYPE_AHASH,
+	.blockmode = DESC_MODE_SHA224,
+	.alg.ahash.base = {
+		.halg = {
+			.base = {
+				.cra_name = "sha224",
+				.cra_driver_name = "sha224-gxl",
+				.cra_priority = 400,
+				.cra_blocksize = SHA224_BLOCK_SIZE,
+				.cra_flags = CRYPTO_ALG_ASYNC,
+				.cra_module = THIS_MODULE,
+				.cra_alignmask = 0,
+				.cra_init = meson_hasher_init,
+			},
+			.digestsize = SHA224_DIGEST_SIZE,
+			.statesize = sizeof(struct meson_hasher_req_ctx),
+		},
+		.init = meson_sha_init,
+		.update = meson_sha_update,
+		.final = meson_sha_final,
+		.export = meson_hasher_export,
+		.import = meson_hasher_import,
+	},
+	.alg.ahash.op = {
+		.do_one_request = meson_hasher_do_one_request,
+	},
+},
+{
+	.type = CRYPTO_ALG_TYPE_AHASH,
+	.blockmode = DESC_MODE_SHA256,
+	.alg.ahash.base = {
+		.halg = {
+			.base = {
+				.cra_name = "sha256",
+				.cra_driver_name = "sha256-gxl",
+				.cra_priority = 400,
+				.cra_blocksize = SHA256_BLOCK_SIZE,
+				.cra_flags = CRYPTO_ALG_ASYNC,
+				.cra_module = THIS_MODULE,
+				.cra_alignmask = 0,
+				.cra_init = meson_hasher_init,
+			},
+			.digestsize = SHA256_DIGEST_SIZE,
+			.statesize = sizeof(struct meson_hasher_req_ctx),
+		},
+		.init = meson_sha_init,
+		.update = meson_sha_update,
+		.final = meson_sha_final,
+		.export = meson_hasher_export,
+		.import = meson_hasher_import,
+	},
+	.alg.ahash.op = {
+		.do_one_request = meson_hasher_do_one_request,
+	},
+},
+};
+
+int meson_hasher_register(struct meson_dev *mc)
+{
+	int i;
+
+	if (!mc->pdata->hasher_supported) {
+		pr_info("amlogic-gxl-hasher: hasher not supported at current platform");
+		return 0;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(mc_algs); i++) {
+		struct hash_alg_common *alg = &mc_algs[i].alg.ahash.base.halg;
+
+		alg->base.cra_ctxsize = sizeof(struct meson_hasher_tfm_ctx) + crypto_dma_padding();
+	}
+
+	return meson_register_algs(mc, mc_algs, ARRAY_SIZE(mc_algs));
+}
+
+void meson_hasher_unregister(struct meson_dev *mc)
+{
+	if (!mc->pdata->hasher_supported)
+		return;
+
+	meson_unregister_algs(mc, mc_algs, ARRAY_SIZE(mc_algs));
+}
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index c401cbbadaa3..b092d0c89cd8 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -5,6 +5,7 @@
  * Copyright (C) 2018-2019 Corentin LABBE <clabbe@baylibre.com>
  */
 #include <crypto/aes.h>
+#include <crypto/sha2.h>
 #include <crypto/engine.h>
 #include <crypto/skcipher.h>
 #include <linux/debugfs.h>
@@ -23,13 +24,22 @@
 
 #define DESC_OPMODE_ECB (0 << 26)
 #define DESC_OPMODE_CBC (1 << 26)
+#define DESC_OPMODE_SHA (0 << 26)
 
 #define DESC_MAXLEN GENMASK(16, 0)
 
+#define DESC_MODE_SHA1   (0x5 << 20)
+#define DESC_MODE_SHA224 (0x7 << 20)
+#define DESC_MODE_SHA256 (0x6 << 20)
+
 #define DESC_LAST BIT(18)
+#define DESC_BEGIN BIT(24)
+#define DESC_END BIT(25)
 #define DESC_ENCRYPTION BIT(28)
 #define DESC_OWN BIT(31)
 
+#define MESON_SHA_BUFFER_SIZE (SHA256_DIGEST_SIZE + 16)
+
 /*
  * struct meson_desc - Descriptor for DMA operations
  * Note that without datasheet, some are unknown
@@ -83,11 +93,13 @@ struct meson_flow {
  * @reg_descs:	offset to descriptors register
  * @reg_status:	offset to status register
  * @setup_desc_cnt:	number of setup descriptor to configure.
+ * @hasher_supported:	indecates whether hasher is supported.
  */
 struct meson_pdata {
 	u32 descs_reg;
 	u32 status_reg;
 	u32 setup_desc_cnt;
+	bool hasher_supported;
 };
 
 /*
@@ -139,6 +151,38 @@ struct meson_cipher_tfm_ctx {
 	struct crypto_skcipher *fallback_tfm;
 };
 
+/*
+ * struct meson_hasher_req_ctx - context for a hasher request
+ * @state:		state data
+ * @partial:		partial buffer data. Contains sent data which
+ *			size < blocksize
+ * @partial_size:	size of the partial buffer
+ * @partial_addr:	physical address of partial buffer
+ * @partial_mapped:	indicates is partial buffer currently mapped or not
+ * @flags:		request flags (for example, is this final req or not)
+ * @flow:		the flow to use for this request
+ */
+struct meson_hasher_req_ctx {
+	u8 state[SHA256_DIGEST_SIZE + 16] ____cacheline_aligned;
+	u8 partial[SHA256_BLOCK_SIZE] ____cacheline_aligned;
+	unsigned int partial_size ____cacheline_aligned;
+	dma_addr_t partial_addr;
+	bool partial_mapped;
+
+	bool begin_req;
+	bool final_req;
+	int flow;
+};
+
+/*
+ * struct meson_hasher_tfm_ctx - context for a hasher TFM
+ * @enginectx:		crypto_engine used by this TFM
+ * @mc:			pointer to the private data of driver handling this TFM
+ */
+struct meson_hasher_tfm_ctx {
+	struct meson_dev *mc;
+};
+
 /*
  * struct meson_alg_template - crypto_alg template
  * @type:		the CRYPTO_ALG_TYPE for this template
@@ -153,6 +197,7 @@ struct meson_alg_template {
 	u32 blockmode;
 	union {
 		struct skcipher_engine_alg skcipher;
+		struct ahash_engine_alg ahash;
 	} alg;
 	struct meson_dev *mc;
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
@@ -174,3 +219,6 @@ int meson_cipher_register(struct meson_dev *mc);
 void meson_cipher_unregister(struct meson_dev *mc);
 void meson_cipher_debugfs_show(struct seq_file *seq, void *v);
 int meson_handle_cipher_request(struct crypto_engine *engine, void *areq);
+
+int meson_hasher_register(struct meson_dev *mc);
+void meson_hasher_unregister(struct meson_dev *mc);
-- 
2.47.3

