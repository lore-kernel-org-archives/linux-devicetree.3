Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721613;
	b=f38/VFj8h5LBq8x0ZbosAMmNYVXTF0YMoZo7uSBxj8nUNXRSbEhf8DcVmgEUtB07VXfZ
	 LKlrFs5uAWCTd2vhTVsflN8hR3dleLboZFS5eg5ti4sHWcA/i59ujR9E2AwNS7RkDsY07
	 sHoYLVQHjlA78762nWLZNIIboNQIAcxUhJbyS+PIzbLOTaymorm0wDausTuu71UZSpPBo
	 o4k/dIHBnkSTh/FoYy8YhJ5neNLSAWKfsnqjWTy1PBq3kWkbOTwdvUXMy1go1Y7TYxv2z
	 NPJNAepzpgzrDQR1LyiNtURhEBqdltg1MUB0wrkbUAfeJ3KRnQeUWjwfBpwUm7nnhjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hbddC97o04ZKg1StPMOMc8GcEnBHPu2bJqDhfBcc/DY=;
	b=GIZxtLOY9X7R+OCWLM+dNpL9wnvDfBXZQmD5RFcwTVDCcEA3ELsc1plT+6aixblEZCR7
	 y1phDSMeM1xGXHIZjCMiZbRv95GRyNshsNUKngmBRqrSRS9937t1Af23c3MIvGvs7Y4iE
	 3Jbf2gBn3kfgmAR4h2lYKKDkCaiVMe4jss5UnQdl3IZSKmDl5Etxxg/LZnuj1hDUVTUFh
	 VD3FUIM54KQ9rApeXC6iHvV90sKBUkWe9aAItkoPapoLwT2mskny0OjhKqDmEUvHLHf28
	 ia4g2xm8iRRMmPJePg5Zgl1l6C5tb2z3LJMfq/ZyRjXiOf3ODg2Vxj4Yf4f75ibWDJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEuFmZmc;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369D4606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 369D4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEuFmZmc
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so70895945e9.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721612; x=1796326412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbddC97o04ZKg1StPMOMc8GcEnBHPu2bJqDhfBcc/DY=;
        b=nEuFmZmcwnPbcn1dHuvkbLsuE9X/xMVvodmJkIFdaqgVqSdEL6e2dycqIkqYjQbsMc
         Zel9/5cKu+fwWhDY6atXZl7AebF49FZ0qjif2xpuNJB+uRbMIIZsys9dZdJU26oBLsNh
         NfP5z3u/0prt2/r5aa58p+62QD6ah9hCMXBUCtZ/uptsipGEkzqrp9lJjwbHzrFcNmCD
         WznyDMKC+Z0uhFPV78FxMpUKpQnI62mjswgCayTyXU4Jx+hiJnIoRy6az7CeCBKrADYw
         0rPvypsOGk0+toY2uWnl/d9QcgeR+fAj7Mo2xgE2RLuAggqFlmlOvG5D+rVtjKwUOKSC
         WIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721612; x=1796326412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hbddC97o04ZKg1StPMOMc8GcEnBHPu2bJqDhfBcc/DY=;
        b=1nR28Pu8GrJaMQKEODz5bQT7Khf7kmI3XQHz8bihp7aFUPEZ6VLs6sNcHPyHkqwmW1
         ZFFJOmv/XvImZI3IkbVgcQYYELHM4R8r1CRqxUGfAm0pOLzflCV+YBnO73sOojWebdqx
         XmHOqHpPnsRag1jlEOs3u8yrI2j1+IRuG7IS8/l9u3uNCMdxvodjAli5f2lq2sUrh1uo
         wbPi+Pc7jytv+8UjQIrHkc/jGVf7i+4aTfa1iewSld6g+5mx0gTalVYeex9qjPCZAuN3
         HgGwYnIGCFTqjNR4mYLo+gx+tOTlByQihd464zFgyqyE0HmetYOfGLqxWZNJopifxB/d
         zeTg==
X-Forwarded-Encrypted: i=1; AL+hErEOPstp1MFmFG/pQlv0MzYVtiOwMch0jwoLC4wWp1lDBYq7NtvhPuZNEozSzpTUTXYqJHpAX8ebYOOZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/4xWom83azvyDE/SPSAqkzHoixTN/Pu6KdPHOPjSkDsexMBNEi
	mXbghDlC8Ogg3XaWCqrzKT5nlSuDByymxf7OQi1HDxGytJ8VcxnCFDkU
X-Gm-Gg: AZFdTZe8CQwnJT0Rdbr/tsXMNuQFe4k89CpjgPsLvYF3f5pczUuwfpUELlcHFhOrn5v
	NLZrWOC0ZXrNO34ftGmjNjzJfk02Rg9p20m6l86pzoUFzcDKICPAlOW2nKl344q/79+bLMy9cMY
	0VtXf9Js/0D4DLUL4aR+DR5gZotJOV7jbk5NfPdMLTz3zKhx55hzy8N0PF61ejT4GQapuGuv7yS
	icdt+DbSGfPW0SJTe/XzgDV95jGFN63nhwLUe2dITSf/gWddk2LeJEYCEXtPlZIolQ3V6jZAU7t
	OE75/vr/S0SXsj02FZXPGJY/54SXoBX39fhjc5be79WUOp5zjpnmXypMX8fN9wgLcJ+A2gfTPRj
	FCijjc+bCdAAa6HxCswIOLOdZi1Xk8zGVD4WYRpXSrojTy5oLgOMZS0lIt5Co/OBSx3YdDPKg9Z
	1WL0tbpJVGfjyoB2tYmE1gNbYu8HfyQleq2TyMg0LkNZG+w337bc0WNARTBZYa0mNyC6KoQs5Ea
	5cQv+8QxmMFOrmMtlZD5k18iTw6HQAQFJf5okvcyOVaEOtmose8atGQ3xy3iocVJ4moEGEmpIiN
	2R7v76HwVL6pIoSZVpmvIwTf7nI3PLFQCRzTzKuDklupNg==
X-Received: by 2002:a05:600c:a08e:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4bb887e0682mr449158305e9.4.1795721611530;
        Thu, 26 Nov 2026 11:33:31 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:31 -0800 (PST)
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
Subject: [PATCH v13 19/25] crypto: amlogic: hasher: add one-shot digest path
Date: Thu, 26 Nov 2026 20:32:35 +0100
Message-ID: <20261126193241.1471372-20-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
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
 drivers/crypto/amlogic/amlogic-gxl-core.c   |  1 +
 drivers/crypto/amlogic/amlogic-gxl-hasher.c | 29 +++++++++++++++++++--
 drivers/crypto/amlogic/amlogic-gxl.h        |  5 +++-
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 3a6bac10bb04..e79175368d8c 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
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

