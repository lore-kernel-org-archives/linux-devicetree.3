Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780917;
	b=TCiV4z88f4+90WBXdFeQbIumAW4ZqoJT0vsg6igcAXXsNh83AR7t9JGScNNWvvSvTjqT
	 gD4fiaerPXqfVjS1MlrSq/MLVhxvMTswDM+TxCo29/iyQBnuGZCQ3JZ7F1U0HHsj1yaYo
	 hZW+2ZRUe/VdPOqDj3PxPOtm6r+PRwOFcGbTKwW2i/JM3qF0nYzEax5swElLLGSvlXYN7
	 IJlQWCvgnJKllvnRebeG842IHRbkAabFVPL5H5rAFn9JXcbIWVwiqfx85Vh+1eLD+3sfr
	 i9DsMN9dhICLbdV2yv5V7k8y5vbO2Kz65mJa9ZZbOttuEPHOaUHTxojB89ZNx2xPJhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H6JuaHlgOFaTRvm4ik6+FqVcECQ77XVTUFxb5teXNtM=;
	b=hHWPTwAvXqBbapnttLWjyhLS9k94nl5pkwA/D8tZmjv3wz7P+ci0lwGq8AREY82LCTqP
	 Sq/Qu5NMTNhrSTzJb1RK4A2AYv/6qusOL1wXuaFTBrvlZg+pS8S6jgK6AXzkh6wX3BaXZ
	 8Uxzcd6UIS4ojXq3DdTgfYTwt0ihztK0lKaFQ5XUh0Sy8h/GxSRo4motUX4bDDZEcEWWV
	 Jx4VyP7aWHt5LU/kG6+TXUgPZIGW2WU+3IfY6SSolcDdY9zHzIwoFwbBxHYhDrSyfw69/
	 /kYT9OnGcaSRSO6fwwyAZPvn7CMDH4oTPaBIhcYC1C5UQs2+T1MNYMVjs9vaNze+0/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rvezEVeP;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2AB606A31F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE2AB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rvezEVeP
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so102606495e9.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780915; x=1796385715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6JuaHlgOFaTRvm4ik6+FqVcECQ77XVTUFxb5teXNtM=;
        b=rvezEVePSWgqG1fmVnf+JOhFq/PFr9tnnD7HkDU0tqdSbXoUmjQeUQB44qGRNwMqWf
         hrRLMpLkEKgQ+tzCUtUj2CLMY/Zy3rGTDge1q4gm4p4Va0gFYgAhUZZWKyp7v3pvlXv3
         8tO4Z7KozGU9zAXAggPpRPfT+D9oVdMWyPmObg4RmTjKAs9yolWjOzJNDvZ3WoNq7zzv
         aJ56tlaiK+7FWGsEP5ttH+4Rq+ntH3j6nnNpFT1zFbSJK0dImalZwn+O7WocwpHY4D66
         h7V1QbJYdGSkVuLR4eh8ToGwDa3a+i8hhZv4uGSPgJ2PWxy5YanClyKBgTnQSLLWXBS5
         keXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780915; x=1796385715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6JuaHlgOFaTRvm4ik6+FqVcECQ77XVTUFxb5teXNtM=;
        b=hmmmOlDq+Ecw7INcp7NvhahVUL9jOEhqRX1a/ZBqbmpN6YR/+b85XrVb5aZlXFKETj
         s8tXTTQ+AbAJmVYHdA2e3LC15MbKrWsNA79EJHc12RPOUXsYxMGIPyfa/OTTly/iEGzq
         ooJZtwThAtC9cgkPqh0KQBgnibQRJVG920ZzpmvJGUM4ddHUNlRdnslPmGkXUDEZEx8E
         MNZEMZ9jmgXVCYDPkx4g/QFfBGXf+C6xVMohDmek/N+mUxlhiS9dIdEDWR7Bhw3aJSZO
         1Uw6mfDtkyTN5XrpYq9uxcdNYJMWfUCQxsYug3stgPpAOKt0cJxCpSWOocG1eHUYAKKA
         QBXA==
X-Forwarded-Encrypted: i=1; AL+hErFOJR/Zd2nd3kk0HuxgwiLfvTEIhiLumsbTv1tc9Sr0nk7o4AN8kgMA7ZUVD40KAT3Tr30CQm3IlAqA@vger.kernel.org
X-Gm-Message-State: APuU4Z/xQAB7Rj4t0/6QWsbMCsbvh/D+FGqwFPzNujuOW9rL2az5yFZt
	889tdQUBHlGqsmiUF+Yuk/p3+oHU5PNjSlMn5uTTDb+0sRoB9Ahr7fVl
X-Gm-Gg: AZFdTZdnzSp4Y88Ua5Ld2GoiT2T4QUBLE1MvyR0UK+LVsc1f2SCm3YFu5x9XUfYCA3a
	pb5tbz9f1eY7iXv7FHLchYHdc4uLZ0UHkBY4fKPI0Hi3Vp4xv3CPgRCRqyp6DsrN1cK0LlXidNK
	GKpcSElDLb65RzAeXutueM1mdyX9GYCEx9FzOCEIcSL7wefnTPe5LR9zNoSWd5YU68E7g0nhF68
	2AFrI2yB1DkJuDBejYqXs36oVZL9VzAEc7AlCzkObYsxQFaLI0tr4UFTVxY6wlqt70OIaXyF2uy
	Nlnhn2DDA1n+HOG+OYmlJS3M8M+p7npaEN13jIb3g8BExPkxqJ+kjngEStU5UG5gK019fj/clz2
	mde7Kw66lyKZVIxm4cQK/ZpLjdSDNKU5520FfjqhmhDF+rjkHikEgtuM7B/gnZ61uJxA1GelimE
	SCWtYfIhDz3Bbq7ajCj24DAG/t+JmaBvBfDj/gdcXC2hIMiz1q0wkeaiB7B8CtHrV2Y1k8K4q/5
	w3zud84qVC9IiH/5aehJhEhNCMLjrp+bhWIL+Jo5w15uiXesZEenFpXT/2n6STwEZiBq++tnP4I
	CXaxyPaYg8uhZNbYuBQGAwydMkVFMcnYY+dQEpb6Iwwnp0A=
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr456893495e9.9.1795780914919;
        Fri, 27 Nov 2026 04:01:54 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:52 -0800 (PST)
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
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v14 19/30] crypto: amlogic: hasher: add one-shot digest path
Date: Fri, 27 Nov 2026 13:00:52 +0100
Message-ID: <20261127120103.1532882-20-jnieto.alaber@gmail.com>
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

Implement the ahash ->digest callback so one-shot SHA requests are sent
as a single engine transfer instead of the init/update/final sequence,
and skip the spurious trailing block for digest requests.

Also unregister the hasher on device removal and lower the "hasher not
supported" message to dev_dbg.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c   |  9 ++++---
 drivers/crypto/amlogic/amlogic-gxl-hasher.c | 29 +++++++++++++++++++--
 drivers/crypto/amlogic/amlogic-gxl.h        |  5 +++-
 3 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 3a6bac10bb04..38b9645386ae 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -237,6 +237,10 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	if (err)
 		goto error_flow;
 
+	err = meson_hasher_register(mc);
+	if (err)
+		goto error_hasher;
+
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG)) {
 		struct dentry *dbgfs_dir;
 
@@ -247,10 +251,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 #endif
 	}
 
-	err = meson_hasher_register(mc);
-	if (err)
-		goto error_hasher;
-
 	return 0;
 
 error_hasher:
@@ -269,6 +269,7 @@ static void meson_crypto_remove(struct platform_device *pdev)
 	debugfs_remove_recursive(mc->dbgfs_dir);
 #endif
 
+	meson_hasher_unregister(mc);
 	meson_cipher_unregister(mc);
 
 	meson_free_chanlist(mc, mc->flow_cnt - 1);
diff --git a/drivers/crypto/amlogic/amlogic-gxl-hasher.c b/drivers/crypto/amlogic/amlogic-gxl-hasher.c
index c83739ec3456..978cdcd8a4f9 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-hasher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-hasher.c
@@ -51,6 +51,25 @@ static int meson_sha_final(struct ahash_request *req)
 	return crypto_transfer_hash_request_to_engine(engine, req);
 }
 
+static int meson_sha_digest(struct ahash_request *req)
+{
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct meson_hasher_tfm_ctx *tctx = crypto_ahash_ctx_dma(tfm);
+	struct meson_hasher_req_ctx *rctx = ahash_request_ctx(req);
+	struct crypto_engine *engine;
+
+	memset(rctx, 0, sizeof(struct meson_hasher_req_ctx));
+
+	rctx->flow = meson_get_engine_number(tctx->mc);
+	rctx->begin_req = true;
+	rctx->final_req = true;
+	rctx->digest_req = true;
+
+	engine = tctx->mc->chanlist[rctx->flow].engine;
+
+	return crypto_transfer_hash_request_to_engine(engine, req);
+}
+
 static int meson_hasher_req_map(struct ahash_request *req)
 {
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
@@ -251,7 +270,7 @@ static int meson_hasher_do_one_request(struct crypto_engine *engine, void *areq)
 	struct hasher_ctx ctx = {
 		.tloffset = 0,
 		.src_offset = 0,
-		.nbytes = rctx->final_req ? 0 : req->nbytes,
+		.nbytes = (rctx->final_req && !rctx->digest_req) ? 0 : req->nbytes,
 		.src_sg = req->src,
 		.areq = areq,
 	};
@@ -310,6 +329,9 @@ static int meson_hasher_do_one_request(struct crypto_engine *engine, void *areq)
 		if (!ctx.todo && ctx.nbytes)
 			continue;
 
+		if (!ctx.todo && rctx->final_req && rctx->partial_size)
+			continue;
+
 		if (!ctx.todo && !rctx->final_req && !ctx.tloffset)
 			continue;
 
@@ -393,6 +415,7 @@ static struct meson_alg_template mc_algs[] = {
 		.init = meson_sha_init,
 		.update = meson_sha_update,
 		.final = meson_sha_final,
+		.digest = meson_sha_digest,
 		.export = meson_hasher_export,
 		.import = meson_hasher_import,
 	},
@@ -421,6 +444,7 @@ static struct meson_alg_template mc_algs[] = {
 		.init = meson_sha_init,
 		.update = meson_sha_update,
 		.final = meson_sha_final,
+		.digest = meson_sha_digest,
 		.export = meson_hasher_export,
 		.import = meson_hasher_import,
 	},
@@ -449,6 +473,7 @@ static struct meson_alg_template mc_algs[] = {
 		.init = meson_sha_init,
 		.update = meson_sha_update,
 		.final = meson_sha_final,
+		.digest = meson_sha_digest,
 		.export = meson_hasher_export,
 		.import = meson_hasher_import,
 	},
@@ -463,7 +488,7 @@ int meson_hasher_register(struct meson_dev *mc)
 	int i;
 
 	if (!mc->pdata->hasher_supported) {
-		pr_info("amlogic-gxl-hasher: hasher not supported at current platform");
+		dev_dbg(mc->dev, "hasher is not supported on this platform\n");
 		return 0;
 	}
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index a44290fcf3a0..3f1ce6c05558 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -161,7 +161,9 @@ struct meson_cipher_tfm_ctx {
  * @partial_size:	size of the partial buffer
  * @partial_addr:	physical address of partial buffer
  * @partial_mapped:	indicates is partial buffer currently mapped or not
- * @flags:		request flags (for example, is this final req or not)
+ * @begin_req:		indicates this is the first request
+ * @final_req:		indicates this is the final request
+ * @digest_req:		indicates a one-shot digest request
  * @flow:		the flow to use for this request
  */
 struct meson_hasher_req_ctx {
@@ -173,6 +175,7 @@ struct meson_hasher_req_ctx {
 
 	bool begin_req;
 	bool final_req;
+	bool digest_req;
 	int flow;
 };
 
-- 
2.47.3

