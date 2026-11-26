Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721596;
	b=Bp9rHDm2PXHetZVgF/Vhu8nOkIZvzE+zo5Ho5so5+PDG40BWQMCkcq84bdS556XPZv2I
	 utS0YWYDROcSIGv4S/rudPzvJj5o+tDPaFpF6AIHBaWRcSroF+2FPD0flZei255ZUDH8k
	 p6uc/MT7/GpZi4DR41jtj6tI9I4Iw3aVdXbsmdAzNpV/4xZF/FFBiZEpBjBy2JKuuZxE4
	 oVlDi3IcydnoP9H7MIyP47uIGaGU1n09Kf0dZHFzVbLuDQBgdK359YohBpGWey1k5LLQ2
	 xnPP67eTmmk56O7lbZveqUh/cJgQHo9WxCiC/2yqEUro98hzo8FIQDY0FaKqqxV1Lbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IoF64jnw/OxIgULPI43O4WtliYquxuYl5hRwBwB9SZc=;
	b=CWxc5v0IGCsfAnKTOU7DH6fPauncld7CTSetQqCOkohT/jC3upFE1us1nWwcLt5Apt6g
	 vIh94mpepm5ok/VT+uk7MAknpmqiIIhua/Z6EEZqEy+HFOSxkklPEHVL+0CZq5vH6I2sG
	 qM21J/tsUE1PRKamjcjR5Qi8LPCFBDXRxVBBRxkMD+xoVEA87Zg2WidIlXUNV7AApTYV+
	 ozzjwhVK8Y8kpfFGxntJ03gmEg1YksbiLgBtSqLqCNrFSP5a/NNaQMLJJcTmeoN6e1G8Y
	 J5epGMziJ+HQ1W+lJhOPaCfpoAlW04mwxDeHJw1Kwg+TJ89hi17YSktDVpgsGNuKNpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnqP3S8h;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5671B606A32C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5671B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnqP3S8h
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so63239905e9.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721595; x=1796326395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoF64jnw/OxIgULPI43O4WtliYquxuYl5hRwBwB9SZc=;
        b=cnqP3S8hNwYCVxe6qhH3SCYe9yECLOv/Zw+1SUqsATHV+noeg4z0Ihz8drVNv3T+DO
         mV9Qpo27f4qjbb2y3IsMehStvSkg4MCJ/WmHI6b6ayMZfKHSBXR2JVUr0WIwyPSZY1iI
         kYyTCFKK9l7oLHyGw/IQWIqNyz9ZMLyDwSUQECVtxFkJ+ouXbT0saWR5zU388N1OEk8X
         bH93Vy9+f9od5SeM7SgZSLRf4OzSBOKHHNseX19N+bxJ75UxtpKS1d99c6gqAlmwGV1R
         kf4A6X5OUmM9jjq2G3fHXkSIUl2U6OuH2udUwaydc4oEPcVIZ4IpG9lefpqh+sSsAqzv
         5tjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721595; x=1796326395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoF64jnw/OxIgULPI43O4WtliYquxuYl5hRwBwB9SZc=;
        b=W++oY48SIVDO2kLN4PrL/+m/1zw2LsNVy/VA0R54d1BB/DTWEu1Enh+boMCGMYLvmy
         C2nq5qEaRP3QY0cZ8LsHXvPi+XSoxSPbgGEsNZcid7I0+favSHt4/nRNm1b/T84nfqbl
         qlwie2oCOJw1V6qezkTJ8FerxTxA4emGOegPTcFJ2c5nVtuXPp2BGyJ+EJVVHBCYM2CQ
         dPD476usA2YXFXm+mNC3PbTGXqR33dM0zcst4eH+Ko3Cb27boHcGOhcqkeM68fdMkWGD
         Szpm32LTQdbaBfWOYk4VOGCqJRg8tWMAWH9dtJ+5v9hsGJBHBA5Wh3V1M5lU5k8YPt6P
         EncQ==
X-Forwarded-Encrypted: i=1; AL+hErGR3LV7Mt8py9/TbBnv0et6QUkN4ZYlPvi29hWEBCNjgS+Okaqc/3zikbjMUnHlZTzSMJ0ugSZNFRnS@vger.kernel.org
X-Gm-Message-State: APuU4Z8c2gtPMDdX/qlwbNWXiiHHKSSFg/3w0ZxPo1PcuJxvB//tr4n5
	D0jnKUhq8tAkMNGZBWOokaTwsCCtx76BrKQmjWFmNE0IdlhCh4VUAYk2
X-Gm-Gg: AZFdTZcYqskpcacRdV0zix5fTQpMuEl65m+SLwBbw0DNXvUg5P6PI7EiA70S/lcPpx1
	GAH+HZxut8zEZIByAPvsSEz8PlRURD2vN3lTa8vIzGODdKEC9l7ec/wpavKdOMJsdaOwVyQCFBv
	3LxgrCqvdpEPnHjxrDR4ZZ5lAmQB7gf60WJz9BgSQ6oL3G1gfwiXVC6bWs8G1J24IXIuxfeDKnG
	OnEZ0hRfGWJXfQanXlgvvhdqSvw83hhDllHuAX4AHeR+/xkalNtetZQeMgWgZVFJQnELEp2GEPw
	dpwl+NuqMZk9fbS7YbTnH8j15b6SPSPx/kEO2VV1qRUOTFIdxo4vFEqhckfUBRqlHgh0mPrpkgi
	geKJ40jy3v+o/IiEGyxYDoRN1hKqLIihnZj2OS4a/DbkZi8jsInOqryo5I28tYR27SXCpQIicTQ
	vHFkzVG0/8/XjYD8mGMv9PWcaNUqGyvLej2g8zV/FM80IXViz0HqoAGBje3SC8d0HZ9Z+a4eOlL
	QvQjXmclu6YTAMzGTJIPS9QsqgG69XJJwp44F7MUdErRXlgzmsYcDgVqP9d8nzMieOmFqtFoOxt
	0BiK/R/4hB2DSM3aHPqwcL3NVSJN2S27ExeH36ZyaSH53xGQVHGkv9YonID99Yb9E1M=
X-Received: by 2002:a05:600d:6504:10b0:4bb:b378:a003 with SMTP id 5b1f17b1804b1-4bbb378a00bmr865745e9.2.1795721594660;
        Thu, 26 Nov 2026 11:33:14 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:14 -0800 (PST)
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
Subject: [PATCH v13 10/25] crypto: amlogic - Cleanup defines
Date: Thu, 26 Nov 2026 20:32:26 +0100
Message-ID: <20261126193241.1471372-11-jnieto.alaber@gmail.com>
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

It is bad to use hardcoded values directly in the code.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 24 ++++++++++-----------
 drivers/crypto/amlogic/amlogic-gxl.h        | 16 ++++++++------
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 00d3247ebea1..c17ce5cc70a8 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -141,8 +141,8 @@ static int meson_cipher(struct skcipher_request *areq)
 						 ivsize, 0);
 		}
 	}
-	if (keyivlen == 24)
-		keyivlen = 32;
+	if (keyivlen == AES_KEYSIZE_192)
+		keyivlen = AES_MAX_KEY_SIZE;
 
 	phykeyiv = dma_map_single(mc->dev, bkeyiv, keyivlen,
 				  DMA_TO_DEVICE);
@@ -161,7 +161,7 @@ static int meson_cipher(struct skcipher_request *areq)
 		todo = min(keyivlen - eat, 16u);
 		desc->t_src = cpu_to_le32(phykeyiv + i * 16);
 		desc->t_dst = cpu_to_le32(i * 16);
-		v = (MODE_KEY << 20) | DESC_OWN | 16;
+		v = DESC_MODE_KEY | DESC_OWN | 16;
 		desc->t_status = cpu_to_le32(v);
 
 		eat += todo;
@@ -214,7 +214,7 @@ static int meson_cipher(struct skcipher_request *areq)
 		desc->t_src = cpu_to_le32(sg_dma_address(src_sg));
 		desc->t_dst = cpu_to_le32(sg_dma_address(dst_sg));
 		todo = min(len, sg_dma_len(src_sg));
-		v = (op->keymode << 20) | DESC_OWN | todo | (algt->blockmode << 26);
+		v = op->keymode | DESC_OWN | todo | algt->blockmode;
 		if (rctx->op_dir)
 			v |= DESC_ENCRYPTION;
 		len -= todo;
@@ -363,14 +363,14 @@ static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	struct meson_dev *mc = op->mc;
 
 	switch (keylen) {
-	case 128 / 8:
-		op->keymode = MODE_AES_128;
+	case AES_KEYSIZE_128:
+		op->keymode = DESC_MODE_AES_128;
 		break;
-	case 192 / 8:
-		op->keymode = MODE_AES_192;
+	case AES_KEYSIZE_192:
+		op->keymode = DESC_MODE_AES_192;
 		break;
-	case 256 / 8:
-		op->keymode = MODE_AES_256;
+	case AES_KEYSIZE_256:
+		op->keymode = DESC_MODE_AES_256;
 		break;
 	default:
 		dev_dbg(mc->dev, "ERROR: Invalid keylen %u\n", keylen);
@@ -388,7 +388,7 @@ static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 static struct meson_alg_template algs[] = {
 {
 	.type = CRYPTO_ALG_TYPE_SKCIPHER,
-	.blockmode = MESON_OPMODE_CBC,
+	.blockmode = DESC_OPMODE_CBC,
 	.alg.skcipher.base = {
 		.base = {
 			.cra_name = "cbc(aes)",
@@ -417,7 +417,7 @@ static struct meson_alg_template algs[] = {
 },
 {
 	.type = CRYPTO_ALG_TYPE_SKCIPHER,
-	.blockmode = MESON_OPMODE_ECB,
+	.blockmode = DESC_OPMODE_ECB,
 	.alg.skcipher.base = {
 		.base = {
 			.cra_name = "ecb(aes)",
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 608ce75f027a..15b4335942d5 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -11,19 +11,21 @@
 #include <linux/crypto.h>
 #include <linux/scatterlist.h>
 
-#define MODE_KEY 1
-#define MODE_AES_128 0x8
-#define MODE_AES_192 0x9
-#define MODE_AES_256 0xa
-
 #define MESON_DECRYPT 0
 #define MESON_ENCRYPT 1
 
-#define MESON_OPMODE_ECB 0
-#define MESON_OPMODE_CBC 1
+#define DESC_MODE_KEY (0x1 << 20)
+#define DESC_MODE_AES_128 (0x8 << 20)
+#define DESC_MODE_AES_192 (0x9 << 20)
+#define DESC_MODE_AES_256 (0xa << 20)
 
 #define MAXDESC 64
 
+#define DESC_OPMODE_ECB (0 << 26)
+#define DESC_OPMODE_CBC (1 << 26)
+
+#define DESC_MAXLEN GENMASK(16, 0)
+
 #define DESC_LAST BIT(18)
 #define DESC_ENCRYPTION BIT(28)
 #define DESC_OWN BIT(31)
-- 
2.47.3

