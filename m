Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780895;
	b=KqP561r7efmdJp2zpE2FYZ8cu1DnG+lREYQdkib35kRxoVeAEXPK8p0jWmoUbd2afRzZ
	 SLuse2j5J/z9rJMYE3vVn13IQ0vohwGIIuArEB3U+SmaWMeyoxH0a80rkZai05BjjSJD+
	 oCxjiLpvl+3W4XDTIr/bEupriIR62/KH9yUu0PEnC2WPBULfntK2g+Pi+PbfvBp4Ui7Y9
	 ctHDVwSOAO5VDOp4pMTN/VquOEp7L234bArAIWC/FPf3QQxsas1W5ZwB0YiAJBoadvDgn
	 oDZbvu1vMaeXc9qfLkI+KylqDYqo791800+fAVmtBJP6jqEZ570XNeyB+rkLEz9ldyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=irpOvezoJ07TWhE5LsBvszMrdXj1JWX1J2IkgqrEATQ=;
	b=d0eM5SvgYEU5o3Ld54gtURhWLxKlatXt6LBg6EXgfx2eTSKxtvc63FvUBuV5tgFchQSU
	 6oRCoh8DBreP6R91DeopTJDPU4j0KNvw6jOe03y3U8yjTcRezjucsW5XRhpQJKvCES6vP
	 DqLIaM+eRrnSmcrv7lNIiUTlD7A4WScrWNgTrc0ZUt0OQn6eIMwQ2Fk6W7tpfaHGbpOCa
	 UuPPlCd5FYOiUJPgD9LWlr/5iAIvmS3nSf58mUiDj8S6qxXgqT4102zrp231F0RnWyZJr
	 /Y8+t3nrqjTtvyMo1U0efKEcbrdIPhxAJHmUCoQrFnuE4jxWkL3uihpaTPvwDl0ltDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8G9cLce;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EB9606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53EB9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8G9cLce
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so73189465e9.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780894; x=1796385694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irpOvezoJ07TWhE5LsBvszMrdXj1JWX1J2IkgqrEATQ=;
        b=F8G9cLcewBDqlKa8aWQuc84OrEo60FypROi/pIucDaZOYY6G1Iho3rItWtv++BEzVW
         o6Bz2jfpIJn1fYXkocNm8ScvOsn7NBIR3RIz5E1m7SNrvh8m0Hf8MfHA9pYfZXFpd2tQ
         JwJzvmx34ETBl/sR1hiiDqtOFvA9xIsiMrPTQinmOLxBTLLjD5LlJOLHkiTfiAnJJE/8
         pw1Ya34ml4+KhEJ1d/LbWNptEzPmYb1iz78Ij6Ckzx8Pq1ptBAKCvwaf3IpiFIsJFcEC
         NmbttMxoUf/Nyq5/g64SIWZ4RqQQx1fRKcqgDJeGCN3Ny/eCbPcBcWfli3nPna1Hpr7d
         FfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780894; x=1796385694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=irpOvezoJ07TWhE5LsBvszMrdXj1JWX1J2IkgqrEATQ=;
        b=23j7mmG9hcyRVlaUK4sdAXxHlNjlYTHVweijYeYn5M0hqPDYsvHZmJ2+iVk5TUsYbI
         brYgKB9HV0DF9xozae86AgMqCgQWJ6GgNYxTAoDrt8jNyr17p+hpE7J+t+8fYPsq5k8R
         5bFwtbanwJXplifRtGTlGLqpjYEBHOp3VWfnKp4yCf78NY5vWz4A7o//s9Q5hZDNJO32
         5fiUWZL9BktHnMZqeJwzxIg23hRZvrbBJIFl1u79gDU0qGlj23pdn57VR+13YkLsgF6t
         gDecYoUjEC+y8DTi23+lhycHuD8Ga4tDIQZVJg2t+oB1cvPP/VHR0tSP4YVOJqrOsaMU
         +A9A==
X-Forwarded-Encrypted: i=1; AL+hErGT+Eo1k4wBho/ssRb9/cy0Oa3vetE0MssKeYOClabgZrjd9YRdsExXQvBCuxTzpoPFz1qctMdSvAYX@vger.kernel.org
X-Gm-Message-State: APuU4Z/I0NsP3grnfixTGfLvTX8AfIKVP6cGPQQJYfQPaxsh484HStGQ
	Vvp1ZobcjQX3Sn4O8KjOqPJQlEFI3/Rjkxm/qXfQDXzaF9vOyZvThPyc
X-Gm-Gg: AZFdTZczDQyBlrwYmso9eQ94RR45n8KbUPp8TZS+MOht0OLVNabuxtcXZptdUpai5l/
	VDdsHeJzWiA3aeLdlCUEtTD/NBcxWwh5fvCYqQBi3seLm1qpBMEtse902SE1WeXOwga/Bjj2vTw
	FsNBEaygKr0zAP+GzcaxYe8hjIvwZJ5pg28TF6QM+XGboq4oAFiA2VZgLYgaS0ZxptINFocpSck
	tFpWjnRSSpju462H7M4rbh0eIzNcEK3/v3Pcz6JxIIABxoKwwCQdu0lravpfEpRPwrMmevOGhBh
	6VS6QOQgl2FxswXeAx5WOfG9TIUfOzgnvYVTqMoIc89ZO6VOZNKm8cN155oEv6cFTsCNhdEM3XO
	53k4O5QROo9i3/KoQfyPFIMH5eSfqxoz6VQTNx/on/HWqsFOFkyjv+J1U8ry6aNXnFuSv9/4tE1
	iWhmwHPykpoWRVVjU3xGpdCo+yctnPzqCVUgEZkWM8HeJ6UP057LZSp+qg6WTPsuCnj3GYw5oaA
	aVdZPlEYxnMhRweYifphitavlBtve2K/So0ebDrOBkYd4EmkSEjw0r8rsbAOI3b0pRieTKzlnOM
	kGzRcFTBbUQ32xu00YzqxGa3khms1jLMW5oOth+Fnfp1WC0=
X-Received: by 2002:a05:600c:530f:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4bb8892a21amr453451655e9.34.1795780892976;
        Fri, 27 Nov 2026 04:01:32 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:32 -0800 (PST)
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
Subject: [PATCH v14 11/30] crypto: amlogic - Process more than MAXDESCS descriptors
Date: Fri, 27 Nov 2026 13:00:44 +0100
Message-ID: <20261127120103.1532882-12-jnieto.alaber@gmail.com>
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

1. The old alhorithm was not designed to process a large
amount of memory, and therefore gave incorrect results.

2. Not all Amlogic SoC's use 3 KEY/IV descriptors.
Add keyiv descriptors count parameter to platform data.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 459 ++++++++++++--------
 drivers/crypto/amlogic/amlogic-gxl-core.c   |   1 +
 drivers/crypto/amlogic/amlogic-gxl.h        |   2 +
 3 files changed, 283 insertions(+), 179 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index c17ce5cc70a8..cb6b959bb1f9 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -17,35 +17,41 @@
 #include <crypto/internal/skcipher.h>
 #include "amlogic-gxl.h"
 
-static bool meson_cipher_need_fallback(struct skcipher_request *areq)
+static bool meson_cipher_need_fallback_sg(struct skcipher_request *areq,
+					  struct scatterlist *sg)
 {
-	struct scatterlist *src_sg = areq->src;
-	struct scatterlist *dst_sg = areq->dst;
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
+	unsigned int blocksize = crypto_skcipher_blocksize(tfm);
+	unsigned int cryptlen = areq->cryptlen;
+
+	while (cryptlen) {
+		unsigned int len = min(cryptlen, sg->length);
+
+		if (!IS_ALIGNED(sg->offset, sizeof(u32)))
+			return true;
+		if (len % blocksize != 0)
+			return true;
+
+		cryptlen -= len;
+		sg = sg_next(sg);
+	}
+
+	return false;
+}
 
+static bool meson_cipher_need_fallback(struct skcipher_request *areq)
+{
 	if (areq->cryptlen == 0)
 		return true;
 
-	if (sg_nents(src_sg) != sg_nents(dst_sg))
+	if (meson_cipher_need_fallback_sg(areq, areq->src))
 		return true;
 
-	/* KEY/IV descriptors use 3 desc */
-	if (sg_nents(src_sg) > MAXDESC - 3 || sg_nents(dst_sg) > MAXDESC - 3)
-		return true;
+	if (areq->dst == areq->src)
+		return false;
 
-	while (src_sg && dst_sg) {
-		if ((src_sg->length % 16) != 0)
-			return true;
-		if ((dst_sg->length % 16) != 0)
-			return true;
-		if (src_sg->length != dst_sg->length)
-			return true;
-		if (!IS_ALIGNED(src_sg->offset, sizeof(u32)))
-			return true;
-		if (!IS_ALIGNED(dst_sg->offset, sizeof(u32)))
-			return true;
-		src_sg = sg_next(src_sg);
-		dst_sg = sg_next(dst_sg);
-	}
+	if (meson_cipher_need_fallback_sg(areq, areq->dst))
+		return true;
 
 	return false;
 }
@@ -76,6 +82,213 @@ static int meson_cipher_do_fallback(struct skcipher_request *areq)
 	return err;
 }
 
+struct cipher_ctx {
+	struct {
+		dma_addr_t addr;
+		unsigned int len;
+	} keyiv;
+
+	struct skcipher_request *areq;
+	struct scatterlist *src_sg;
+	struct scatterlist *dst_sg;
+	void *bkeyiv;
+
+	unsigned int src_offset;
+	unsigned int dst_offset;
+	unsigned int cryptlen;
+	unsigned int tloffset;
+};
+
+static int meson_map_scatterlist(struct skcipher_request *areq, struct meson_dev *mc)
+{
+	int nr_sgs, nr_sgd;
+
+	if (areq->src == areq->dst) {
+		nr_sgs = dma_map_sg(mc->dev, areq->src, sg_nents(areq->src),
+				    DMA_BIDIRECTIONAL);
+		if (!nr_sgs) {
+			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgs);
+			return -EINVAL;
+		}
+	} else {
+		nr_sgs = dma_map_sg(mc->dev, areq->src, sg_nents(areq->src),
+				    DMA_TO_DEVICE);
+		if (!nr_sgs) {
+			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgs);
+			return -EINVAL;
+		}
+
+		nr_sgd = dma_map_sg(mc->dev, areq->dst, sg_nents(areq->dst),
+				    DMA_FROM_DEVICE);
+		if (!nr_sgd) {
+			dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_TO_DEVICE);
+			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgd);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static void meson_unmap_scatterlist(struct skcipher_request *areq, struct meson_dev *mc)
+{
+	if (areq->src == areq->dst) {
+		dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_BIDIRECTIONAL);
+	} else {
+		dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_TO_DEVICE);
+		dma_unmap_sg(mc->dev, areq->dst, sg_nents(areq->dst), DMA_FROM_DEVICE);
+	}
+}
+
+static void meson_setup_keyiv_descs(struct cipher_ctx *ctx)
+{
+	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(ctx->areq);
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(ctx->areq);
+	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
+	struct meson_alg_template *algt = container_of(alg,
+		struct meson_alg_template, alg.skcipher.base);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct meson_dev *mc = op->mc;
+	unsigned int ivsize = crypto_skcipher_ivsize(tfm);
+	unsigned int blockmode = algt->blockmode;
+	int i;
+
+	if (ctx->tloffset)
+		return;
+
+	if (blockmode == DESC_OPMODE_CBC) {
+		memcpy(ctx->bkeyiv + AES_MAX_KEY_SIZE, ctx->areq->iv, ivsize);
+		dma_sync_single_for_device(mc->dev, ctx->keyiv.addr,
+					   ctx->keyiv.len, DMA_TO_DEVICE);
+	}
+
+	for (i = 0; i < mc->pdata->setup_desc_cnt; i++) {
+		struct meson_desc *desc =
+			&mc->chanlist[rctx->flow].tl[ctx->tloffset];
+		int offset = i * 16;
+
+		desc->t_src = cpu_to_le32(ctx->keyiv.addr + offset);
+		desc->t_dst = cpu_to_le32(offset);
+		desc->t_status = cpu_to_le32(DESC_OWN | DESC_MODE_KEY | ctx->keyiv.len);
+
+		ctx->tloffset++;
+	}
+}
+
+static bool meson_setup_data_descs(struct cipher_ctx *ctx)
+{
+	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(ctx->areq);
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(ctx->areq);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
+	struct meson_alg_template *algt = container_of(alg,
+						       struct meson_alg_template,
+						       alg.skcipher.base);
+	struct meson_dev *mc = op->mc;
+	struct meson_desc *desc = &mc->chanlist[rctx->flow].tl[ctx->tloffset];
+	unsigned int blocksize = crypto_skcipher_blocksize(tfm);
+	unsigned int blockmode = algt->blockmode;
+	unsigned int maxlen = rounddown(DESC_MAXLEN, blocksize);
+	unsigned int todo;
+	u32 v;
+
+	ctx->tloffset++;
+
+	todo = min(ctx->cryptlen, maxlen);
+	todo = min(todo, ctx->cryptlen);
+	todo = min(todo, sg_dma_len(ctx->src_sg) - ctx->src_offset);
+	todo = min(todo, sg_dma_len(ctx->dst_sg) - ctx->dst_offset);
+
+	desc->t_src = cpu_to_le32(sg_dma_address(ctx->src_sg) + ctx->src_offset);
+	desc->t_dst = cpu_to_le32(sg_dma_address(ctx->dst_sg) + ctx->dst_offset);
+
+	ctx->cryptlen -= todo;
+	ctx->src_offset += todo;
+	ctx->dst_offset += todo;
+
+	v = DESC_OWN | blockmode | op->keymode | todo;
+	if (rctx->op_dir == MESON_ENCRYPT)
+		v |= DESC_ENCRYPTION;
+
+	if (!ctx->cryptlen || ctx->tloffset == MAXDESC)
+		v |= DESC_LAST;
+
+	desc->t_status = cpu_to_le32(v);
+
+	return v & DESC_LAST;
+}
+
+static int meson_kick_hardware(struct cipher_ctx *ctx)
+{
+	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(ctx->areq);
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(ctx->areq);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
+	struct meson_alg_template *algt = container_of(alg,
+						       struct meson_alg_template,
+						       alg.skcipher.base);
+	struct meson_dev *mc = op->mc;
+	unsigned int ivsize = crypto_skcipher_ivsize(tfm);
+	unsigned int blockmode = algt->blockmode;
+	enum dma_data_direction new_iv_dir;
+	struct scatterlist *sg_head;
+	void *new_iv;
+	int err;
+
+	if (blockmode == DESC_OPMODE_CBC) {
+		struct scatterlist *sg_current;
+		unsigned int offset;
+
+		if (rctx->op_dir == MESON_ENCRYPT) {
+			sg_current = ctx->dst_sg;
+			sg_head = ctx->areq->dst;
+			offset = ctx->dst_offset;
+			new_iv_dir = DMA_FROM_DEVICE;
+		} else {
+			sg_current = ctx->src_sg;
+			sg_head = ctx->areq->src;
+			offset = ctx->src_offset;
+			new_iv_dir = DMA_TO_DEVICE;
+		}
+
+		if (ctx->areq->src == ctx->areq->dst)
+			new_iv_dir = DMA_BIDIRECTIONAL;
+
+		offset -= ivsize;
+		new_iv = sg_virt(sg_current) + offset;
+	}
+
+	if (blockmode == DESC_OPMODE_CBC &&
+	    rctx->op_dir == MESON_DECRYPT) {
+		dma_sync_sg_for_cpu(mc->dev, sg_head,
+				    sg_nents(sg_head), new_iv_dir);
+		memcpy(ctx->areq->iv, new_iv, ivsize);
+	}
+
+	reinit_completion(&mc->chanlist[rctx->flow].complete);
+	meson_dma_start(mc, rctx->flow);
+	err = wait_for_completion_interruptible_timeout(&mc->chanlist[rctx->flow].complete,
+							msecs_to_jiffies(500));
+	if (err == 0) {
+		dev_err(mc->dev, "DMA timeout for flow %d\n", rctx->flow);
+		return -EINVAL;
+	} else if (err < 0) {
+		dev_err(mc->dev, "Waiting for DMA completion is failed (%d)\n", err);
+		return err;
+	}
+
+	if (blockmode == DESC_OPMODE_CBC &&
+	    rctx->op_dir == MESON_ENCRYPT) {
+		dma_sync_sg_for_cpu(mc->dev, sg_head,
+				    sg_nents(sg_head), new_iv_dir);
+		memcpy(ctx->areq->iv, new_iv, ivsize);
+	}
+
+	ctx->tloffset = 0;
+
+	return 0;
+}
+
 static int meson_cipher(struct skcipher_request *areq)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
@@ -84,191 +297,79 @@ static int meson_cipher(struct skcipher_request *areq)
 	struct meson_dev *mc = op->mc;
 	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
 	struct meson_alg_template *algt;
-	int flow = rctx->flow;
-	unsigned int todo, eat, len;
-	struct scatterlist *src_sg = areq->src;
-	struct scatterlist *dst_sg = areq->dst;
-	struct meson_desc *desc;
-	int nr_sgs, nr_sgd;
-	int i, err = 0;
-	unsigned int keyivlen, ivsize, offset, tloffset;
-	dma_addr_t phykeyiv;
-	void *backup_iv = NULL, *bkeyiv;
-	u32 v;
-
-	algt = container_of(alg, struct meson_alg_template, alg.skcipher.base);
+	struct cipher_ctx ctx = {
+		.areq = areq,
+		.src_offset = 0,
+		.dst_offset = 0,
+		.src_sg = areq->src,
+		.dst_sg = areq->dst,
+		.cryptlen = areq->cryptlen,
+	};
+	int err;
 
-	dev_dbg(mc->dev, "%s %s %u %x IV(%u) key=%u flow=%d\n", __func__,
+	dev_dbg(mc->dev, "%s %s %u %x IV(%u) key=%u ctx.flow=%d\n", __func__,
 		crypto_tfm_alg_name(areq->base.tfm),
 		areq->cryptlen,
 		rctx->op_dir, crypto_skcipher_ivsize(tfm),
-		op->keylen, flow);
+		op->keylen, rctx->flow);
+
+	algt = container_of(alg, struct meson_alg_template, alg.skcipher.base);
 
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
 	algt->stat_req++;
-	mc->chanlist[flow].stat_req++;
+	mc->chanlist[rctx->flow].stat_req++;
 #endif
 
-	/*
-	 * The hardware expect a list of meson_desc structures.
-	 * The 2 first structures store key
-	 * The third stores IV
-	 */
-	bkeyiv = kzalloc(48, GFP_KERNEL | GFP_DMA);
-	if (!bkeyiv)
+	ctx.bkeyiv = kzalloc(48, GFP_KERNEL | GFP_DMA);
+	if (!ctx.bkeyiv)
 		return -ENOMEM;
 
-	memcpy(bkeyiv, op->key, op->keylen);
-	keyivlen = op->keylen;
-
-	ivsize = crypto_skcipher_ivsize(tfm);
-	if (areq->iv && ivsize > 0) {
-		if (ivsize > areq->cryptlen) {
-			dev_err(mc->dev, "invalid ivsize=%d vs len=%d\n", ivsize, areq->cryptlen);
-			err = -EINVAL;
-			goto theend;
-		}
-		memcpy(bkeyiv + 32, areq->iv, ivsize);
-		keyivlen = 48;
-		if (rctx->op_dir == MESON_DECRYPT) {
-			backup_iv = kzalloc(ivsize, GFP_KERNEL);
-			if (!backup_iv) {
-				err = -ENOMEM;
-				goto theend;
-			}
-			offset = areq->cryptlen - ivsize;
-			scatterwalk_map_and_copy(backup_iv, areq->src, offset,
-						 ivsize, 0);
-		}
-	}
-	if (keyivlen == AES_KEYSIZE_192)
-		keyivlen = AES_MAX_KEY_SIZE;
+	memcpy(ctx.bkeyiv, op->key, op->keylen);
+	ctx.keyiv.len = op->keylen;
+	if (ctx.keyiv.len == AES_KEYSIZE_192)
+		ctx.keyiv.len = AES_MAX_KEY_SIZE;
 
-	phykeyiv = dma_map_single(mc->dev, bkeyiv, keyivlen,
-				  DMA_TO_DEVICE);
-	err = dma_mapping_error(mc->dev, phykeyiv);
+	ctx.keyiv.addr = dma_map_single(mc->dev, ctx.bkeyiv, ctx.keyiv.len,
+					DMA_TO_DEVICE);
+	err = dma_mapping_error(mc->dev, ctx.keyiv.addr);
 	if (err) {
 		dev_err(mc->dev, "Cannot DMA MAP KEY IV\n");
-		goto theend;
+		goto free_keyiv;
 	}
 
-	tloffset = 0;
-	eat = 0;
-	i = 0;
-	while (keyivlen > eat) {
-		desc = &mc->chanlist[flow].tl[tloffset];
-		memset(desc, 0, sizeof(struct meson_desc));
-		todo = min(keyivlen - eat, 16u);
-		desc->t_src = cpu_to_le32(phykeyiv + i * 16);
-		desc->t_dst = cpu_to_le32(i * 16);
-		v = DESC_MODE_KEY | DESC_OWN | 16;
-		desc->t_status = cpu_to_le32(v);
-
-		eat += todo;
-		i++;
-		tloffset++;
-	}
+	err = meson_map_scatterlist(areq, mc);
+	if (err)
+		goto unmap_keyiv;
 
-	if (areq->src == areq->dst) {
-		nr_sgs = dma_map_sg(mc->dev, areq->src, sg_nents(areq->src),
-				    DMA_BIDIRECTIONAL);
-		if (!nr_sgs || nr_sgs > MAXDESC - 3) {
-			dev_err(mc->dev, "Invalid BIDIR SG count %d\n", nr_sgs);
-			err = -EINVAL;
+	ctx.tloffset = 0;
 
-			if (nr_sgs)
-				dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_BIDIRECTIONAL);
-			goto error_keyiv;
-		}
-		nr_sgd = nr_sgs;
-	} else {
-		nr_sgs = dma_map_sg(mc->dev, areq->src, sg_nents(areq->src),
-				    DMA_TO_DEVICE);
-		if (!nr_sgs || nr_sgs > MAXDESC - 3) {
-			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgs);
-			err = -EINVAL;
+	while (ctx.cryptlen) {
+		meson_setup_keyiv_descs(&ctx);
 
-			if (nr_sgs)
-				dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_TO_DEVICE);
-			goto error_keyiv;
+		if (meson_setup_data_descs(&ctx)) {
+			err = meson_kick_hardware(&ctx);
+			if (err)
+				break;
 		}
-		nr_sgd = dma_map_sg(mc->dev, areq->dst, sg_nents(areq->dst),
-				    DMA_FROM_DEVICE);
-		if (!nr_sgd || nr_sgd > MAXDESC - 3) {
-			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgd);
-			err = -EINVAL;
 
-			if (nr_sgd)
-				dma_unmap_sg(mc->dev, areq->dst, sg_nents(areq->dst), DMA_FROM_DEVICE);
-			goto error_src;
+		if (ctx.src_offset == sg_dma_len(ctx.src_sg)) {
+			ctx.src_offset = 0;
+			ctx.src_sg = sg_next(ctx.src_sg);
 		}
-	}
 
-	src_sg = areq->src;
-	dst_sg = areq->dst;
-	len = areq->cryptlen;
-	while (src_sg) {
-		desc = &mc->chanlist[flow].tl[tloffset];
-		memset(desc, 0, sizeof(struct meson_desc));
-
-		desc->t_src = cpu_to_le32(sg_dma_address(src_sg));
-		desc->t_dst = cpu_to_le32(sg_dma_address(dst_sg));
-		todo = min(len, sg_dma_len(src_sg));
-		v = op->keymode | DESC_OWN | todo | algt->blockmode;
-		if (rctx->op_dir)
-			v |= DESC_ENCRYPTION;
-		len -= todo;
-
-		if (!sg_next(src_sg))
-			v |= DESC_LAST;
-		desc->t_status = cpu_to_le32(v);
-		tloffset++;
-		src_sg = sg_next(src_sg);
-		dst_sg = sg_next(dst_sg);
+		if (ctx.dst_offset == sg_dma_len(ctx.dst_sg)) {
+			ctx.dst_offset = 0;
+			ctx.dst_sg = sg_next(ctx.dst_sg);
+		}
 	}
 
-	reinit_completion(&mc->chanlist[flow].complete);
-	meson_dma_start(mc, flow);
-
-	err = wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
-							msecs_to_jiffies(500));
-	if (err == 0) {
-		dev_err(mc->dev, "DMA timeout for flow %d\n", flow);
-		err = -EINVAL;
-	} else if (err < 0) {
-		dev_err(mc->dev, "Waiting for DMA completion is failed (%d)\n", err);
-	} else {
-		/* No error */
-		err = 0;
-	}
+	meson_unmap_scatterlist(areq, mc);
 
-	dma_unmap_single(mc->dev, phykeyiv, keyivlen, DMA_TO_DEVICE);
+unmap_keyiv:
+	dma_unmap_single(mc->dev, ctx.keyiv.addr, ctx.keyiv.len, DMA_TO_DEVICE);
 
-	if (areq->src == areq->dst) {
-		dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_BIDIRECTIONAL);
-	} else {
-		dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_TO_DEVICE);
-		dma_unmap_sg(mc->dev, areq->dst, sg_nents(areq->dst), DMA_FROM_DEVICE);
-	}
-
-	if (areq->iv && ivsize > 0) {
-		if (rctx->op_dir == MESON_DECRYPT) {
-			memcpy(areq->iv, backup_iv, ivsize);
-		} else {
-			scatterwalk_map_and_copy(areq->iv, areq->dst,
-						 areq->cryptlen - ivsize,
-						 ivsize, 0);
-		}
-	}
-	goto theend;
-
-error_src:
-	dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_TO_DEVICE);
-error_keyiv:
-	dma_unmap_single(mc->dev, phykeyiv, keyivlen, DMA_TO_DEVICE);
-theend:
-	kfree_sensitive(bkeyiv);
-	kfree_sensitive(backup_iv);
+free_keyiv:
+	kfree_sensitive(ctx.bkeyiv);
 
 	return err;
 }
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 68d394e90f66..0e17105520df 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -255,6 +255,7 @@ static void meson_crypto_remove(struct platform_device *pdev)
 static const struct meson_pdata meson_gxl_pdata = {
 	.descs_reg = 0x0,
 	.status_reg = 0x4,
+	.setup_desc_cnt = 3,
 };
 
 static const struct of_device_id meson_crypto_of_match_table[] = {
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 15b4335942d5..6797b44905d3 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -82,10 +82,12 @@ struct meson_flow {
  * struct meson_pdata - SoC series dependent data.
  * @reg_descs:	offset to descriptors register
  * @reg_status:	offset to status register
+ * @setup_desc_cnt:	number of setup descriptor to configure.
  */
 struct meson_pdata {
 	u32 descs_reg;
 	u32 status_reg;
+	u32 setup_desc_cnt;
 };
 
 /*
-- 
2.47.3

