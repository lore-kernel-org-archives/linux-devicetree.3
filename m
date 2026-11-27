Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780883;
	b=3vMOkm+8MdK0Ztv0dNt0r93co+6EWKqdEaZphLzbEtOfMm3pyFKw0+7GWKUFec8izWPh
	 bLpppSmcaF1DsbihcY0GiytrgBNReBMJUXLtZ40HPhNcHX4MpfKTuvpO28GK7aBjJ8hDv
	 hIv8wmjxh9DsBw2z1jNcXlCFQvlyFeE/pv56Ti032NlvscQOnMxnjwh9/39lTDgK488pD
	 OwnY5jpqvL74/QEJ8LD+Ub7k4nY0EYQcjRrzbb/GUGzVFwcil0ctgnSp3MjU4GR6gINjx
	 +nUY1wVi0o46lERygEe6r8XAGj2828W8JhTUYsOwXRpe2rs+lmzbQ2sKav9YLeupukg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4dPCbEZZdSDry+u4vUWC6GFpLLhoS8x3SOrFseRsQ00=;
	b=ytKm2TWI7jqdLNyo4n78FhNMbERTcJ868+WAO5+DDqE+bzgEAC3EnhT/dwP21Bg64MQ6
	 iHlqyk5WBAxYT0egrd8r7HNfu4+PHU8za0dWE/ZfLrCOnF86lF0oxPMKLA9j+GtiDT0kr
	 hXsYHTce0CqDSuH4t2PRuI7evgzTw20HfJHOmnthkN/XfPktBxoO1YKixWODGuo9sNVk1
	 HkWJx+TMkksJHui80z/hwBYHKwtFSiPlq4Ia+2/aMnRm9DEpZ5Xw/smyUzq8G36VO6+ME
	 FAcPHMA7pdlBgEfNK4PdqpapoUbMPphdb5ZzquRmLOKcFzS4VIf86w66vChUy37slmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4xKKHNH;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DE7606A338
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45DE7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4xKKHNH
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so49683345e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780881; x=1796385681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dPCbEZZdSDry+u4vUWC6GFpLLhoS8x3SOrFseRsQ00=;
        b=d4xKKHNHOcsd2BrwPv+xi41xFXXKqemuYyxrZtEMrZIjPRyiG+ywE7LI8HmL/yRpp0
         AHTshpNcMsSAVSjr9q7WtaWrBeswZRYMznU9279fQYXzKlWXkBiijzaAE4A2sr/+eoGL
         78Aky1O8+CrvBSOcA9WNnt09FuvMxNBx3g2z1N0F7kHmKjJdWNAR3w5LX1Y/3CPAaybI
         XxZR/CCUSTlpHKqxefVWEOlIAfm2BgmoKa8MolC9W11OZ4n2Jt64Ckp6hFAz1rmefH0y
         br+uA6fiaYWq2ATEqAqpnnDGvNv5KWkjJkj10xjWCaA4Bgu3ZrinEpX/5rEKsSGcmBE0
         Xg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780881; x=1796385681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4dPCbEZZdSDry+u4vUWC6GFpLLhoS8x3SOrFseRsQ00=;
        b=GO46VebcsO3/oLRtU1ntqduC+menj4TnbybinKMBlomg+ssMCpivm4j7kvWDz7hHXq
         ah8rky+J3acPZBwfgDGGDQ2/Ko7pxOunwdB21jjtyWaXjaWUZ09iSQcoHyXg39KaKMqj
         oPqBzSwo4voJ9Db7/1IhIufT31tgBjoqzz7VctD45tDN538XuDXLOAFJnLFIdMM/cWvJ
         vZOTeM17OdnS4F0bEcFmnhIlj2JsG5qsaACtPeMCWBJv2RUBY+T6MLAyoXW2PhK2uwRE
         XzLO/PQ9cXDVDn1qxTIx1MlXSQBZ1UdZsRtjaShdztWIqoV1g+Y4zFRRsb4tA5H+wwB2
         ZHRA==
X-Forwarded-Encrypted: i=1; AL+hErEBrmUHKkJqQ1o20rsYQnrh5ItHGQENXTKZLz6edJxqncu/2LrZUG3lWQp1XWF9St9L1WQDgCdOif3Z@vger.kernel.org
X-Gm-Message-State: APuU4Z9j8yz6ozx96XZ3cAtBMqRba5nVxtvrkbnvm/mX+SmAkhYiXmR8
	RT6ed/HtUqH8vGZAx30HuxC424KR6hL7UvIb96zw9Lf10NxYVuXG60nH
X-Gm-Gg: AZFdTZecSSdSXFDvJzHTJp1Hapuyk+ilprd9MziO9n032GWPCLbFrIWhz3dVcDH28O/
	HDJiLc8GGp8I9Zt/ca1vDLr5LyMZYIs4FHXnp9MrwMx3fZsn/KMs7c2IIC7HnQtZ1m+7qj72sfb
	2DRSi4w8W4I8wmnc/cg/vavUyGiRH5qdsw/dh4Qygja8YiCyyQQJ35Ado9WPSzEiMdjGkHdTTBt
	JLBTlwFGBOeQpZcJFRj6wVw+AV4I4KPZ5jurT0ntiCtQYYlC+pcKfePXLY38IiZtRtHTWa+eTr4
	QaodQr4o2seRGv9d9LUYpYqOOegecIqImz0H3uQQ2EwARc3sv6Aq0QHvG3ljjaZAu8Jfhe+yHze
	YpsInpQSerzNux1CVQJaDkCaOYQ/hPTqxfKxoUnGhFcOjQVMMGOyZaZcK4/VFA/SO3RqonlP/cI
	ZL3EQCCrXi5rYKMhUA7pVdbP38TYVPDZHm7FwPimHtiOgi++eQooARwMiCdx5ZKTiyzoYhCIsTU
	Ks9A2eojvQUhqlInyzZmbLObb5tTcGnk9MeqJPFdTtObw93+U6+Z+8pS+CFJ5Q9JRquTxV3+9eZ
	yxc99GO1C26T1le+b+gBOxjSlorkBafrfEmPLTBXdCbLeMEfhNJ9vayOmrG9KISUEWVs
X-Received: by 2002:a05:600c:e553:b0:4bb:9457:3c93 with SMTP id 5b1f17b1804b1-4bb94573c9amr293754675e9.2.1795780880469;
        Fri, 27 Nov 2026 04:01:20 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:19 -0800 (PST)
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
Subject: [PATCH v14 06/30] crypto: amlogic - Add MMIO helpers
Date: Fri, 27 Nov 2026 13:00:39 +0100
Message-ID: <20261127120103.1532882-7-jnieto.alaber@gmail.com>
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

Add MMIO access helpers: meson_dma_start() and meson_dma_ready().

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c |  2 +-
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 24 ++++++++++++++++-----
 drivers/crypto/amlogic/amlogic-gxl.h        |  2 ++
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index c458548f29b2..62aa82e1cb5d 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -234,7 +234,7 @@ static int meson_cipher(struct skcipher_request *areq)
 
 	reinit_completion(&mc->chanlist[flow].complete);
 	mc->chanlist[flow].status = 0;
-	writel(mc->chanlist[flow].t_phy | 2, mc->base + ((mc->pdata->descs_reg + flow) << 2));
+	meson_dma_start(mc, flow);
 	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
 						  msecs_to_jiffies(500));
 	if (mc->chanlist[flow].status == 0) {
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 37224d75edfb..b972df44e8b5 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -22,18 +22,32 @@
 
 #include "amlogic-gxl.h"
 
+void meson_dma_start(struct meson_dev *mc, int flow)
+{
+	u32 offset = (mc->pdata->descs_reg + flow) << 2;
+
+	writel(mc->chanlist[flow].t_phy | 2, mc->base + offset);
+}
+
+static bool meson_dma_ready(struct meson_dev *mc, int flow)
+{
+	u32 offset = (mc->pdata->status_reg + flow) << 2;
+	u32 data = readl(mc->base + offset);
+
+	if (data)
+		writel_relaxed(0xF, mc->base + offset);
+
+	return data;
+}
+
 static irqreturn_t meson_irq_handler(int irq, void *data)
 {
 	struct meson_dev *mc = (struct meson_dev *)data;
 	int flow;
-	u32 p;
 
 	for (flow = 0; flow < mc->flow_cnt; flow++) {
 		if (mc->chanlist[flow].irq == irq) {
-			p = readl(mc->base + ((mc->pdata->status_reg + flow) << 2));
-			if (p) {
-				writel_relaxed(0xF, mc->base +
-					      ((mc->pdata->status_reg + flow) << 2));
+			if (meson_dma_ready(mc, flow)) {
 				mc->chanlist[flow].status = 1;
 				complete(&mc->chanlist[flow].complete);
 				return IRQ_HANDLED;
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 5149dc6e9f60..64f2f0e63f12 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -159,6 +159,8 @@ struct meson_alg_template {
 #endif
 };
 
+void meson_dma_start(struct meson_dev *mc, int flow);
+
 int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		     unsigned int keylen);
 int meson_cipher_init(struct crypto_tfm *tfm);
-- 
2.47.3

