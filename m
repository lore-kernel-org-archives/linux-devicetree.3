Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721594;
	b=t4b2uRpR1cdjb/tDc30/yFoMUQ30sHWDvZE6MmO9TFhnlXbzJNLDmBpc0XOH6mvBmp8U
	 HQgQW5JIbH0nZHFAw8vCfpsT0rLWiJ2XR9iG046Yodv6WnQBLHs9xFnX0ZXTbxVcMpw1M
	 WOmQkNih0CQs44u/IE92TIflZsZ8UAhEX1m5InhO3OZc3YetOkFnaXyqgvFMwW19B0Vsf
	 4c6BrftVvda0WhkQxIIylA5H4LfD951c3CR2bPPuMVC64MqF+3Wv3rTZl3q9Bm206dyRa
	 /Yx9M9JcNRmhJ6/pB6yTKKzeDCwtZcVRnQ5VLheUtgwqA3O9YKJTdPZDy43eYYg5Klw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KMyqFUlA/AvT12hLb9IrqwnM+Bo9I2ifCE4zJcXn8o8=;
	b=CrMW4b+Qn4ey7vd2cKnI9wH9a+WPIo0c/5p6k1H5pZ54084V/3UnCcCKzH7Yud2SDG8c
	 YIMCYUgJnYIBFsRif+tscegKRWDrOAd2rcyebHeiAlz81c0WFFH858iVilcMvnTBqW2vL
	 0fExFIT140di5CtZYtuLkLvNLY7gcQYdubVqlIKFG0iSxwg7l+MO1Q9HFfwHOdpfK7SZP
	 bPmK4krw+SfVrUzHORgfRv09hM6OM3kPXJ/LaZ/8qyFgnjBRYPIxhqcqXINSklTJ4A2kW
	 I/+MPhSRAMp0jgUqMk6FDoneUiRqDzcH0pSevgpQ8WZGPxwe+I6PKF9Z24OjCoiuqmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XxDgi8QT;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74267606A32E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74267606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XxDgi8QT
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so74410365e9.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721592; x=1796326392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KMyqFUlA/AvT12hLb9IrqwnM+Bo9I2ifCE4zJcXn8o8=;
        b=XxDgi8QT02dsNExn25lPHnbwnj7Qwk5uN+3TjT5DdBH4d47lL0PhgIeZxzMlS9HXay
         Hhy3K/8h0DFTghkVSBGsmdaqKr3tEiIeTSCjQQS0fyPmEIxad2xt688nEeJ8NvgFMDBB
         BtIdSY+dk9Fl7rUCxLcoZlh/Ke/J6IQuHLSzJIHTlMvkkSEdWy1ugpWimGxnwj+edOVR
         Omd6UkEBPMsqZkI87je6QezQA7cuL1W4rKOQ9YMo6etqdqZDJHSomsgkUJfJRctM52/A
         rKvXE8kTM2q/u7yG4yPXAJzF9Zvgd3TAjn3V+0ldWBwISEfRxgZM1Smdnkx06RfmZA2u
         I3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721592; x=1796326392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KMyqFUlA/AvT12hLb9IrqwnM+Bo9I2ifCE4zJcXn8o8=;
        b=sjoMdQE+0QM5CPjZE5D0Gv+A9jearjoitLZSkPVEfjKeIl2xASOe0XVDlJpS51+iws
         mXNCBSMLrpGHrR7Vt6hZAB6hKvdEpPAeSSiGCDI0u75jfWkTir9zWZDb/pScl5YbLVWf
         kKwOsICcUCWHYPOnpujkPJ5RyCtMdYZjVgQknJESCzukqTJl2pnKk5P64nlX77lNqvhk
         BXy/bOXGHsPtkkxkPvQNS/Qerv3o1/4hAKwX4wGq5LGmDDW52HBzE7nYs/jBaO2VT6Vh
         suxHTCQC8YpnhwHawvsmTosntbtuYODgGMn0skKrgzjNePEfAKQ8tmnvPYcr7+0f1aDu
         13vA==
X-Forwarded-Encrypted: i=1; AL+hErE9BX67f6LlJlqhIQ0HYLEp9OevHyslmwHOdF2fIyoS4ffaTeOW4gGXAX8rY00JQGl7OO5a4JcVWaig@vger.kernel.org
X-Gm-Message-State: APuU4Z+G2ZauFvA/bSzI7y2wyfKotT6EQ9zTJI9D2fD4lYucoQzBcroP
	BUlZuLnjTZZ+JM4kt38Fyp+K379KQqeUFYRhkMVzB1NFLnnisWx42JDF
X-Gm-Gg: AZFdTZdZatJ8OTuYtBF1fe07fKyqUl06+lmGVb3ReQZVhcXl3XsXvXjQRx43msjB8NL
	HU60VHgeRt2sQMI+hReN/IuYJ07pdpdXl9cqs+9BxjaIrIZBGfU6qGlEGmSBEaiZ0VCguyLRCLw
	32HgM7Pv2I6ccBxPXKMY+n4jtp2VidsrGu9zfTHk50qQpx8d9KP/Z7dqVYIOkH9R/PwC44fk/dY
	TEGUJUmyIbQv8Kv8ryDWHP0VR4JGE39xg8PHJ9nFuAKRmbPUdzQhVQEornEZOTC49xI92TaKBSe
	khCQYg4o7lULLM9AXXmiSqXYB7s0rynlPPbN9d0xydkgC5ZBHVnUEtjjkLPPRy9o4ANR1YjYxik
	5/LfyPdFJP/yTGEy/wIO0d1WwoDM2qMqjdcmdcrNcOKBuQ2TY5v3iulxaJtqPmXqa2RaMF297nn
	hakbsO47cALyw6B7+pgzsaV7VRGOa+UdjaTfeEu5tqoI69YlwEg+0Ob1lKoPX+jvyqYKvYPSF66
	nft7qgUKnapNNeX8HaTc3hhrAImJAFm5OJsrBSl6yJUR84EXeEvBNkC9DhOOX2ZzOZGcsq+Yt7P
	yhIhrGg7enStzWXLlSYgyJVmO9ApBZlBuS/CDyY3jfrPOQ==
X-Received: by 2002:a05:600c:4e16:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb88810991mr475888005e9.21.1795721591813;
        Thu, 26 Nov 2026 11:33:11 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:11 -0800 (PST)
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
Subject: [PATCH v13 08/25] crypto: amlogic - Drop status field from meson_flow
Date: Thu, 26 Nov 2026 20:32:24 +0100
Message-ID: <20261126193241.1471372-9-jnieto.alaber@gmail.com>
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

This field is used only to check for timeout. But there is more
convenient way to achive the same goal.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 13 +++++++++----
 drivers/crypto/amlogic/amlogic-gxl-core.c   |  1 -
 drivers/crypto/amlogic/amlogic-gxl.h        |  2 --
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index f6c13d8fcb47..cd94296e4d9a 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -228,13 +228,18 @@ static int meson_cipher(struct skcipher_request *areq)
 	}
 
 	reinit_completion(&mc->chanlist[flow].complete);
-	mc->chanlist[flow].status = 0;
 	meson_dma_start(mc, flow);
-	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
-						  msecs_to_jiffies(500));
-	if (mc->chanlist[flow].status == 0) {
+
+	err = wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
+							msecs_to_jiffies(500));
+	if (err == 0) {
 		dev_err(mc->dev, "DMA timeout for flow %d\n", flow);
 		err = -EINVAL;
+	} else if (err < 0) {
+		dev_err(mc->dev, "Waiting for DMA completion is failed (%d)\n", err);
+	} else {
+		/* No error */
+		err = 0;
 	}
 
 	dma_unmap_single(mc->dev, phykeyiv, keyivlen, DMA_TO_DEVICE);
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 58d56f352dd6..81d0e8731ab1 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -53,7 +53,6 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
 	for (flow = 0; flow < mc->flow_cnt; flow++) {
 		if (mc->chanlist[flow].irq == irq) {
 			if (meson_dma_ready(mc, flow)) {
-				mc->chanlist[flow].status = 1;
 				complete(&mc->chanlist[flow].complete);
 				return IRQ_HANDLED;
 			}
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index e14cd5021add..cf07c5fbc5bf 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -59,7 +59,6 @@ struct meson_desc {
  * @engine:	ptr to the crypto_engine for this flow
  * @keylen:	keylen for this flow operation
  * @complete:	completion for the current task on this flow
- * @status:	set to 1 by interrupt if task is done
  * @irq:	IRQ number for amlogic-crypto
  * @t_phy:	Physical address of task
  * @tl:		pointer to the current ce_task for this flow
@@ -68,7 +67,6 @@ struct meson_desc {
 struct meson_flow {
 	struct crypto_engine *engine;
 	struct completion complete;
-	int status;
 	int irq;
 	unsigned int keylen;
 	dma_addr_t t_phy;
-- 
2.47.3

