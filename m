Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780896;
	b=4m1Tdvq7nemi27jHIoDtzT5GQVx05Pb/ZS6+CBCymU9QkPYkhLk8CV0XAtiSuaqhkpDR
	 S9vEHUxWTm3uSZW9z/v/YPTooGYUtgqhc+ZZjuXmUy2A1I2B70kiiHVmHI9sWEBk1BR9r
	 mlOlncMPG8fghbBC5NFYQECHa9FRJ8KNRtdT2doBR6KNy22SLQQLTSEFwA6At7o1+jQx2
	 VkM5oZTIfebbaltRKw3YXmH/dUGj/+hhjb7gFzlYRyUVYm8Rzt98c2Bj5VutdV9hYWBe/
	 FEWiiYT86rPJSOMk3BXtUqQUt9QQR5CVJlc9X1YYhWJB70/QAi1qBJOfyh5ULWTk3DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IoF64jnw/OxIgULPI43O4WtliYquxuYl5hRwBwB9SZc=;
	b=1/QW5GqGbsYlC7g0htmTC7TC+1DtgNwA1zBKuOh5bK5/Y9dVMdD6hLsTte8grDmRx8jy
	 2vv49TcVphJJffsozfVbn7/zgaxcouutJ644GYDLKLA10VkQuE/FFrA7K7SGJTYmjh+th
	 W/rJVu/4j61q/5QEZfjGaawez5QAEkLMFCwRsBAyHLvP80UCqFoTOmOsFu0ZkbJNbTBCN
	 /xt1hn5uCaQdrgyH/mH5wNUmEvtEVg29pW6M8md7iNs3N+YWM4bycTQUa5QTGZclvq66x
	 QctErjOtBdZVCS/GK8ic4o8CMRxnWmMkPyLD1OBT7OfXTHui7a3BqHiT8Ii3+BPdYqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WgEaWKjP;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B58606A324
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77B58606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WgEaWKjP
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so72567545e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780894; x=1796385694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoF64jnw/OxIgULPI43O4WtliYquxuYl5hRwBwB9SZc=;
        b=WgEaWKjPV5zmXL/3lgqXEg0gxOrNwI/LPcqAucBk2MpEZDiYJ8sxM5Au/BYmZ3b1dF
         YgQjwSBWjVyxrfGwxLJX5UoB0EtRSmpb4ljV00C4rJvPXYYs+IPLmABrHgGB++Jt7pWt
         adH3EXlTUikKVrI/yoIdaeeQXm+JoUrGFupfpG175tMBl1bkeSVt9FfxUcNhEDGyucr1
         tJ8eiCDEbRMRCyyElqiJz29GmaAmI7jULDmiEHI2j4yonbAtvyvtTgBwvAMuL1d4UC3h
         Mx5CddwtkKpdVD4CIRXBqEerl2KsoeBuimfv29Sl9xbSEJlj5eOky5+EVzEdg4nTl73E
         6V4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780894; x=1796385694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoF64jnw/OxIgULPI43O4WtliYquxuYl5hRwBwB9SZc=;
        b=biuhODVFWaPvIqXshdqscOhaY0XpO8Y8eMX9zNMwuhpwPsql+AjaSu9KvnZovTZT4K
         JgXE/YV4IYUcsbsIlUbRWg2S+BytvC2tqoCPPmmUY9i21RQkfR1eprg6W0vWoiyzCrjF
         mPPgMVCUKjRsEeDeBLgOU5r74YgSfUTPXeGpkHwKe/iILjBnusy4DCROXOeYddRNi2pR
         DlYuF/g3aHfs1LgpJ7QIYqdmepTHBYkiWgauLNfuzLvDMzxvkNVP7rudSX3OMOqfXqCj
         63k3BWNbh9aMccp4d20BU9yS/3hjFew9FasVJl/cBHxD/sdbGVB1GuCfJSzNtl3kYFqW
         Ka0g==
X-Forwarded-Encrypted: i=1; AL+hErHBG53zPIBqP2jItKk5PeZdkAxw7gia5IESgJ8ud3jI+ywiUN9T3kNIFs5FkZGRb38YUX0UPPDQDgFr@vger.kernel.org
X-Gm-Message-State: APuU4Z8c32emZBK54koWyaWEcgXdftheCmfVL6YibFWtyLRgfKHne26H
	DJK7bmEMzJAne8KneKFZD8QQvZAX9QkGvcDRhvjO0UFa9tZXWCBnBjp3
X-Gm-Gg: AZFdTZeMQUO0n8wTWRMK410oSfxnBEruSsyxwRFGeuoj4geMZpCQoRhiPovO2Nfyk20
	B5NnwQb2fRyeALgqnkJKnA/1FpjqDRpXUy/xWb1QKHtPH2K8V5ulCwaUavVu3+viIm+2SAqj1Lk
	fAm4wkRSw69cVx2Jqz8IC6dvK4qpHxTpJHRuLcMzM7kfkqYeDFHCHpSp9yvK89ZJtbILhL/G6yV
	7ubNa1AaiOTRJmTv4pIZVdO1CqMhB+TyYF6RYJqUTipInLDztTpAuyjyD6PDhKMdKohraXwLD+I
	/RoOMnAew/NTs5Rt9+5WBcHvdWZsGcB/2OP9sLK2hrzETlfoimoB/kACOuHgtdwy0m9+IwS3a1i
	XsiTMC3mUdRiTV+iOixP1Df2GdxS7JMjnN1ZSwGU4QfYQZ+d0fstmiLXN4TxEi3zeund4z5MLuv
	bC8aUFQGSZGwpvzA3/Wx24i3IOqoPh3I23IcomdSr+SSHw21w845qCEZyQNuKaklS5jq5oAl4GO
	Sfce8W64V8JkBWS+HBWliQ24KJDipv01pu92sIKYoCKtit3PSSsn2QyjjmhQ9J1ffpxHZ8x7cE/
	kDYsHN+ECWQhVhBHBcMeKWuDJ2wasCnbMYbCzzRAHXDfRew=
X-Received: by 2002:a05:600c:1911:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4bb8880a584mr492741765e9.13.1795780891427;
        Fri, 27 Nov 2026 04:01:31 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:29 -0800 (PST)
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
Subject: [PATCH v14 10/30] crypto: amlogic - Cleanup defines
Date: Fri, 27 Nov 2026 13:00:43 +0100
Message-ID: <20261127120103.1532882-11-jnieto.alaber@gmail.com>
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

