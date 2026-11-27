Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780898;
	b=2lLpDJ0ytQtkDAVB1LPcrWtR8ORPVQwM4EDMf/u10TrIM63BvTkNVEq23AVc8378Uutz
	 FcqVuzvldfC782jYGJcOGDTvs29uXNsCqxh31iabnqOmVYIpYRMaRI6rFQBZ/3VMGdzuf
	 BYjUDMEL9P37sXcesZ49PFkoIoEGhQPgKUzOj2gJVi8oxV75kEYTj9aHEI78jVsWWR+XU
	 QYxmy+8Zwkr/7dX7Mrs96RmdQIFkk3m4VcEv7dSEU4Xk4bpLBCnqJEVRiGC+3s+dfOEbd
	 ZOqxOtlIyFx2arGkPe4AZJsnrIj3PKKXV4GPLvbd9TAJ6FA470YJRc6RZunNtv2QDsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=io+uaDknt7WdBvlAK0vnW3kOhuoYLdbo2w5Zw2Ijjss=;
	b=0ppGc7muBcz7gGk802ucVnPLI69O6wR58fuD5NjLh3d7Mn76Jhex2k24ERETfkQVG6Hr
	 +vqtNCrgnqu1WBZ4l0rcDinecj86RoLOCd0oQ+CL+A7w1fHtOQ95XqUQ4b814PbpUBbAY
	 E6ybR4BJTvCwavBvsTZTRhwELRhfjeeFItSUhtr1/oqTHG18vhKocmUIZCr6qG7D5sr61
	 T1yZQyW2q51ygXjrMi1+GW4r1xZK/zmzKuLe/3n40haal7dYpb0gCvcm8eZJGenJbV+rm
	 /IRAMALxXLcyinr++/cg0kHWsPuqFu7SMWupbVyhCNXkQZuXNTGv1b+CbSkSz2e2WoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m8rt6SIZ;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CCF606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3CCF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m8rt6SIZ
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so49685515e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780896; x=1796385696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=io+uaDknt7WdBvlAK0vnW3kOhuoYLdbo2w5Zw2Ijjss=;
        b=m8rt6SIZlJE9FZaBDqADTC4TwrAEcE64A1jH1V/NJW+08sxIVWDC4Dvu4JAZP8gErz
         K/HNftG4dpQdfniTaXvJGKPaICkuw4pan6/18CzZJN8LgaQsof1VsrXFpZDxxMxUSvz6
         vCHCeTFL7+PHEYxar2TMHzBU56vrcYuC4JX9k7yv2wv4WgkiYAZXE52GD2Rro2Utdyui
         RUSlo7b8moRoNTz+pX8IXgEcjowNcRHpMW3OvJC/DnmO5Rx1x4/kiQK/rQigSfuHF0qI
         P/vyoHINCKp7Rsi/QB2J4PXjxWiFbGKr33XmG8vIY5mGmwQ6hofrh/dF8vVznZjeUYx7
         9fvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780896; x=1796385696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=io+uaDknt7WdBvlAK0vnW3kOhuoYLdbo2w5Zw2Ijjss=;
        b=KT0FH8Ue4n3hhz6QZ8V9PAM7iYBVc9LGc7FrWt0RGZ3otkryTefDF9cyLx6AF201gr
         VBKTAjbZDtMY95zqJCVOUE03Fhcp9VBdCH5jpLhzOlrmYT1JeKYHeCWIj0W9vTa4ebvX
         0vv6LdJxP0qyW7PvNR+AdQKaAieXsUlm1WamAgUzDwBzMV0b8I8cdUTNP/4tAXO/fvOC
         4PUpw/ujXdLqNuU0QfXtg9fRVucwnUxfaMVVKVLspLhgLYK9WOVg81HZwM99oJVoCrVe
         5ZWV3vu1RZWU7hMKem0k1I+yjBFNo7lOrg1x9zOQuCd0g5KHAqNeZvSk+6p5dHMPpQQ9
         6sXQ==
X-Forwarded-Encrypted: i=1; AL+hErFaSIOvg1kGh0+IARac1Bpg4kZ0yY2NDcTQ+iw2J7vSqLfVdTNk8npqwgz4YfKPWv+KNJQySLRHOAc4@vger.kernel.org
X-Gm-Message-State: APuU4Z/wgYVRkXwvmRIwsW1Bi+v731JIwDON82a/+S6sSIsXUblSxMXh
	SHxUfsvbsg+MJde9dEFk+igG3w4KL9wIq2agt/yZ4+k4owcCRGcYRj+i
X-Gm-Gg: AZFdTZew0pXAGMjjijz/8VhOKhQOqC6A4CUr62bmynnVvXMmidoks/l+0fs7ASxnE8G
	6br61fmxIOdnE+G++XRGztzMt7jfdaUb/rLsbR+BdBXGIk9+uKr4mSbOyPX8XwB41fGlBllBWkZ
	gXjIGlFA9to4Mdf4Xg6/p11e3W66i6Slkg4pJe5GFR855crolMivEypVBq+N9i2m9SxWyAylbrF
	qUcyGetEfo8hHvysqXQTMwBu9ag9QWuKSqV3heo4snFtJ4bBciUEZK1wGYETpkBI9XvIVkiCMhd
	YEHBIfi57jbrSnk3k89rqpYCOaaSH43OnYvcPhnnzJlw4QtBbrhiCaAp0cH/i6N/kSQBBGIeEg3
	WFP0ocYTDALl4GuC1dHNZlPZFlQ7d+uNWW3npnO9tLjTfFJaGWi3eyPn+FNAgVPN71oGkI0p5LA
	797TWxEg1iOGH6UeRtmem8izEa8m3Oxh1IsonjhbmNRm0GIOC3/ZM+4g9Z+HoQKlO8L20fqfHLr
	AG4N6JFEbr93sAQGqWeuKj39ASFc69A0EwP38r2bNxwb/g2eBTLreyLB2kWuMe6omIWHWFa6kds
	CObjG1eloZDM8fopLNG6pdMOoenyER4oAsUmddrVh+HeejM=
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr518044795e9.14.1795780894323;
        Fri, 27 Nov 2026 04:01:34 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:33 -0800 (PST)
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
Subject: [PATCH v14 12/30] crypto: amlogic - Avoid kzalloc in engine thread
Date: Fri, 27 Nov 2026 13:00:45 +0100
Message-ID: <20261127120103.1532882-13-jnieto.alaber@gmail.com>
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

It makes no sense to allocate memory via kzalloc, we
can use static buffer, speedup data processing and
don't think about kfree() calls.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 60 ++++++++++-----------
 drivers/crypto/amlogic/amlogic-gxl.h        |  4 +-
 2 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index cb6b959bb1f9..df42940f1112 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -59,7 +59,7 @@ static bool meson_cipher_need_fallback(struct skcipher_request *areq)
 static int meson_cipher_do_fallback(struct skcipher_request *areq)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
-	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
 	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
 	int err;
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
@@ -91,7 +91,6 @@ struct cipher_ctx {
 	struct skcipher_request *areq;
 	struct scatterlist *src_sg;
 	struct scatterlist *dst_sg;
-	void *bkeyiv;
 
 	unsigned int src_offset;
 	unsigned int dst_offset;
@@ -147,7 +146,7 @@ static void meson_setup_keyiv_descs(struct cipher_ctx *ctx)
 	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
 	struct meson_alg_template *algt = container_of(alg,
 		struct meson_alg_template, alg.skcipher.base);
-	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
 	struct meson_dev *mc = op->mc;
 	unsigned int ivsize = crypto_skcipher_ivsize(tfm);
 	unsigned int blockmode = algt->blockmode;
@@ -157,7 +156,7 @@ static void meson_setup_keyiv_descs(struct cipher_ctx *ctx)
 		return;
 
 	if (blockmode == DESC_OPMODE_CBC) {
-		memcpy(ctx->bkeyiv + AES_MAX_KEY_SIZE, ctx->areq->iv, ivsize);
+		memcpy(op->keyiv + AES_MAX_KEY_SIZE, ctx->areq->iv, ivsize);
 		dma_sync_single_for_device(mc->dev, ctx->keyiv.addr,
 					   ctx->keyiv.len, DMA_TO_DEVICE);
 	}
@@ -179,7 +178,7 @@ static bool meson_setup_data_descs(struct cipher_ctx *ctx)
 {
 	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(ctx->areq);
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(ctx->areq);
-	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
 	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
 	struct meson_alg_template *algt = container_of(alg,
 						       struct meson_alg_template,
@@ -222,7 +221,7 @@ static int meson_kick_hardware(struct cipher_ctx *ctx)
 {
 	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(ctx->areq);
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(ctx->areq);
-	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
 	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
 	struct meson_alg_template *algt = container_of(alg,
 						       struct meson_alg_template,
@@ -292,7 +291,7 @@ static int meson_kick_hardware(struct cipher_ctx *ctx)
 static int meson_cipher(struct skcipher_request *areq)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
-	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
 	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
 	struct meson_dev *mc = op->mc;
 	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
@@ -305,6 +304,7 @@ static int meson_cipher(struct skcipher_request *areq)
 		.dst_sg = areq->dst,
 		.cryptlen = areq->cryptlen,
 	};
+	unsigned int ivsize = crypto_skcipher_ivsize(tfm);
 	int err;
 
 	dev_dbg(mc->dev, "%s %s %u %x IV(%u) key=%u ctx.flow=%d\n", __func__,
@@ -320,21 +320,21 @@ static int meson_cipher(struct skcipher_request *areq)
 	mc->chanlist[rctx->flow].stat_req++;
 #endif
 
-	ctx.bkeyiv = kzalloc(48, GFP_KERNEL | GFP_DMA);
-	if (!ctx.bkeyiv)
-		return -ENOMEM;
-
-	memcpy(ctx.bkeyiv, op->key, op->keylen);
 	ctx.keyiv.len = op->keylen;
 	if (ctx.keyiv.len == AES_KEYSIZE_192)
 		ctx.keyiv.len = AES_MAX_KEY_SIZE;
 
-	ctx.keyiv.addr = dma_map_single(mc->dev, ctx.bkeyiv, ctx.keyiv.len,
+	if (algt->blockmode == DESC_OPMODE_CBC) {
+		memcpy(op->keyiv + AES_MAX_KEY_SIZE, areq->iv, ivsize);
+		ctx.keyiv.len = AES_MAX_KEY_SIZE + ivsize;
+	}
+
+	ctx.keyiv.addr = dma_map_single(mc->dev, op->keyiv, ctx.keyiv.len,
 					DMA_TO_DEVICE);
 	err = dma_mapping_error(mc->dev, ctx.keyiv.addr);
 	if (err) {
 		dev_err(mc->dev, "Cannot DMA MAP KEY IV\n");
-		goto free_keyiv;
+		return err;
 	}
 
 	err = meson_map_scatterlist(areq, mc);
@@ -368,9 +368,6 @@ static int meson_cipher(struct skcipher_request *areq)
 unmap_keyiv:
 	dma_unmap_single(mc->dev, ctx.keyiv.addr, ctx.keyiv.len, DMA_TO_DEVICE);
 
-free_keyiv:
-	kfree_sensitive(ctx.bkeyiv);
-
 	return err;
 }
 
@@ -390,7 +387,7 @@ int meson_handle_cipher_request(struct crypto_engine *engine, void *areq)
 static int meson_skdecrypt(struct skcipher_request *areq)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
-	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
 	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
 	struct crypto_engine *engine;
 	int e;
@@ -408,7 +405,7 @@ static int meson_skdecrypt(struct skcipher_request *areq)
 static int meson_skencrypt(struct skcipher_request *areq)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
-	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
 	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
 	struct crypto_engine *engine;
 	int e;
@@ -425,7 +422,7 @@ static int meson_skencrypt(struct skcipher_request *areq)
 
 static int meson_cipher_init(struct crypto_tfm *tfm)
 {
-	struct meson_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_tfm_ctx_dma(tfm);
 	struct meson_alg_template *algt;
 	const char *name = crypto_tfm_alg_name(tfm);
 	struct crypto_skcipher *sktfm = __crypto_skcipher_cast(tfm);
@@ -443,7 +440,7 @@ static int meson_cipher_init(struct crypto_tfm *tfm)
 		return PTR_ERR(op->fallback_tfm);
 	}
 
-	crypto_skcipher_set_reqsize(sktfm, sizeof(struct meson_cipher_req_ctx) +
+	crypto_skcipher_set_reqsize_dma(sktfm, sizeof(struct meson_cipher_req_ctx) +
 				    crypto_skcipher_reqsize(op->fallback_tfm));
 
 	return 0;
@@ -451,16 +448,15 @@ static int meson_cipher_init(struct crypto_tfm *tfm)
 
 static void meson_cipher_exit(struct crypto_tfm *tfm)
 {
-	struct meson_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_tfm_ctx_dma(tfm);
 
-	kfree_sensitive(op->key);
 	crypto_free_skcipher(op->fallback_tfm);
 }
 
 static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 			    unsigned int keylen)
 {
-	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
 	struct meson_dev *mc = op->mc;
 
 	switch (keylen) {
@@ -477,11 +473,9 @@ static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		dev_dbg(mc->dev, "ERROR: Invalid keylen %u\n", keylen);
 		return -EINVAL;
 	}
-	kfree_sensitive(op->key);
+
+	memcpy(op->keyiv, key, keylen);
 	op->keylen = keylen;
-	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
-	if (!op->key)
-		return -ENOMEM;
 
 	return crypto_skcipher_setkey(op->fallback_tfm, key, keylen);
 }
@@ -499,7 +493,6 @@ static struct meson_alg_template algs[] = {
 			.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER |
 				CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY |
 				CRYPTO_ALG_NEED_FALLBACK,
-			.cra_ctxsize = sizeof(struct meson_cipher_tfm_ctx),
 			.cra_module = THIS_MODULE,
 			.cra_alignmask = 0xf,
 			.cra_init = meson_cipher_init,
@@ -528,7 +521,6 @@ static struct meson_alg_template algs[] = {
 			.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER |
 				CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY |
 				CRYPTO_ALG_NEED_FALLBACK,
-			.cra_ctxsize = sizeof(struct meson_cipher_tfm_ctx),
 			.cra_module = THIS_MODULE,
 			.cra_alignmask = 0xf,
 			.cra_init = meson_cipher_init,
@@ -548,6 +540,14 @@ static struct meson_alg_template algs[] = {
 
 int meson_cipher_register(struct meson_dev *mc)
 {
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(algs); i++) {
+		struct skcipher_alg *alg = &algs[i].alg.skcipher.base;
+
+		alg->base.cra_ctxsize = sizeof(struct meson_cipher_tfm_ctx) + crypto_dma_padding();
+	}
+
 	return meson_register_algs(mc, algs, ARRAY_SIZE(algs));
 }
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 6797b44905d3..c401cbbadaa3 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -125,14 +125,14 @@ struct meson_cipher_req_ctx {
 
 /*
  * struct meson_cipher_tfm_ctx - context for a skcipher TFM
- * @key:		pointer to key data
+ * @keyiv:		key data
  * @keylen:		len of the key
  * @keymode:		The keymode(type and size of key) associated with this TFM
  * @mc:			pointer to the private data of driver handling this TFM
  * @fallback_tfm:	pointer to the fallback TFM
  */
 struct meson_cipher_tfm_ctx {
-	u32 *key;
+	u8 keyiv[AES_MAX_KEY_SIZE + AES_BLOCK_SIZE];
 	u32 keylen;
 	u32 keymode;
 	struct meson_dev *mc;
-- 
2.47.3

