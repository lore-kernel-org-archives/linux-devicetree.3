Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721591;
	b=2oOvP+3lXUrINFUIYmh8IkXF3JfqcifB1X02Z9NMY9CaOGSbmzdlfEtyWRfLGPXLdTqE
	 Pjj9EI1KNsl8T22pDGBGYqv0y7svjY2v2raohGG4gYMarH4BHyLWXzM5m5yFlkuXCR2hr
	 XJ5DFTgHiy6NAesqqU61j9aHiYGu8CrihcU8GvFu6N9uVV51Ax9CrQ8a0qfVA8vQF4Xqk
	 wIXolu0ATPgaN3LFewRitWxO7A6zdt6vBwZLOTBe3pi4AgRCOMeR9lm0ZeDk1r0j7+4el
	 KOip8+GO8rtd4VR07CBOaUYwGu5a2CvkNutYvSYGK1caSmtX3aBXVN6UXlF3IihIv0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4dPCbEZZdSDry+u4vUWC6GFpLLhoS8x3SOrFseRsQ00=;
	b=c0UdOmHhVll7JEzg3mBZEnDhGfuJqwERvDTsYZNcIJpNiHzmJRqugS2YP68gdOLCu3uH
	 W6uDJVRyWZvTQBEkN0Df1VH9Vz2ZB2ZbumCbTLNcIaPhKyX5e+e+hfCx2RKwVA/ilxJGU
	 VJJ4RSLyUuAsjI1RJnH0aBrXLEttuQ7xOrDvKmfF5CwnlYIdB6MBag4/uFFr9WBI3huqy
	 zSXj3rw156TEOHL2g/UEFjYK+4nvQ52uXe5RXKM6zxgALXV7j2jMFxLhSsnz36Mk6i1lM
	 ToG6qRzi/5KTctN4JP3XVyEUO7Os8DZuK69zqJRK06OBSwWnXPnxpHdvKmVfE4Sx9uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mkpaz6UC;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1F7606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC1F7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mkpaz6UC
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so75635245e9.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721589; x=1796326389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dPCbEZZdSDry+u4vUWC6GFpLLhoS8x3SOrFseRsQ00=;
        b=Mkpaz6UCHOtGL6iPPYjQft730v22C3IhBySgtpMEtHkU5PkET0CEmjjITJvr2NTbuf
         Oyt1Vvb5LpjB9jrXbOtiHWOYBeaMXDESimUxWYA98si+fIorcMm/6hcRBVIbGkLZwq6O
         PYtMnmhb4zrXPRzmV5yjvGhkf2rtUn2gsqrTiRUrtrSvcKP6+1oTtwLz3yGPIu7VRuxw
         GPVozBl3QlumNvA2C+ZmCvw3AYWHXUNiS4yPraiX/aKUbdIAgBJOtv6vSzXECMeNTvvo
         XLIP6nx5VOXaSAyFOlCG4BbMbEtzT91si2co/MZyCSKHP8L5VZLf87ZVBDoDGAm1SWV3
         WjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721589; x=1796326389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4dPCbEZZdSDry+u4vUWC6GFpLLhoS8x3SOrFseRsQ00=;
        b=fJn0XgJUV9eTQHUGJ6j9hJUIrti8sX++KKiixMjI7vqPUU8NxtzUaAqG/If0/xwMvD
         OI7eiT5JQvPkCKAWKUOPGcZYeMf4enlmUXhlNCUw7lzsL8ecyUB0UjqBRenlLxI26SW3
         swdfGAZEIytpPsVxJgHTCRhrHmts7T4L5Je+OVRqed7eFxXt+b0/S/P4BNbQL0eAx20B
         TcjAxJWTKLG2yqKUP2KFStctsf3aYG7jNvhC2mrbRP/JfTAd4/2lKXMg5Z0o8bkOf0V+
         8jqLbt1oWAbgDdZUxxpa4s1W7r9J+f6SwCIwSv4p9lmcDwS3TtyqpTpelfQEf2TT7i2B
         eZzA==
X-Forwarded-Encrypted: i=1; AL+hErG6qIaaj/os6IbJrqKjn9PiUcX5y2foB9ZiAtfhLxsT5hs8Lz9TdBy2gTvBcg5qgqu7fRlrWzyzL0nB@vger.kernel.org
X-Gm-Message-State: APuU4Z/k2hlLdqyiFbdL4vHmGzvaoDBFfyOd8B+41qZG78XId2Rgd5VX
	TNDz/D1uAwY0BMlqD9p+Wc5glMJ38ZuDTAYjMKwc6bQOZFkuJkzcRlS6
X-Gm-Gg: AZFdTZcprRJQN9/6Yc4mYF2vtpd4kEKhcqOIrMtWmZ5Dt+4G0YQxq2LwCTtOpnG8bzd
	7DcP+8G7ZY8bUcTyxzMr4w3mmQ6K/Vkzn1CH/FBfhTgDFwHp0w9xZ+BOG8p5ClZitrW9C0b/46J
	a7wYdPuYbn7KRhqAxK/jn5jH5QzCEDPxcEeJapddtTyChIxmzYj7sX9lyyK+Pzjywqez3qYFcPb
	KwMeirMGmOszfIyFJdUKo/gev44bacyb9dctZClYWhjx8unq0jhgpAaRIJ78GpRAADp7pWXDrhr
	PHwjv5r0uwsmqtXxn3Xv06XyrCDGLNHz79Gctqy4azwq1fMLm5Ip1u8LR7jjbPp9pQsHtlFhwjm
	tMlnWceW/1QBJeQaIvM6OqzrnI1qCERdvjoZYocNIHZTFaVzKRq9mM70fbqgBe6uuSnyvtOYfoy
	QCGsPHNW2fP9mI2+gG2S0ngKVG05Z+vvTfrSZJzeDdRe+ts2c6CCG5kjJdFPA97GzYsyDZtzBQY
	Vqa537/90GV99oOJxzD1XVJUgV8Qhw3uKKAvX5sOl1g11Zw23pQ9Pfl1CT+IAt91KHnj3pgKzKP
	iNl2rQ+puYcdNcFP7xG3t7lVYGc5Iqa0D6F5LVa8k4DvZQ==
X-Received: by 2002:a05:600c:6219:b0:4bb:60b1:4409 with SMTP id 5b1f17b1804b1-4bb88816525mr432560755e9.19.1795721589007;
        Thu, 26 Nov 2026 11:33:09 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:08 -0800 (PST)
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
Subject: [PATCH v13 06/25] crypto: amlogic - Add MMIO helpers
Date: Thu, 26 Nov 2026 20:32:22 +0100
Message-ID: <20261126193241.1471372-7-jnieto.alaber@gmail.com>
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

