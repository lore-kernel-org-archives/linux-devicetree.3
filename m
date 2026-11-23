Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445618;
	b=k6UJSkpZs/CJM1+gFe0bJWTvLIA1cfnzJbZbKPXdgZG87FIC/RC1U+dubjVdMdR4ml/d
	 16kz7jwKqC7+aZ2ma81vhAwJ6caOe7u4sya6mn8gczebw4CWm9t7aEhGE+6c/VYnxsiKI
	 P1soZk+uc9uRcujwkwS5Hpbhr8jBkQEZ6X+Ed5Xylm5/ZU0MnrS7Ucn0jfoD6awArPHWt
	 BZf/Ax6R6rpeTT/cbajp61F/cswL28GyCB/BNrzc1/r7+7qUaQuzg/PmL4wxfvt05jsw8
	 CPMBqTnPQEIDxWxvTM3xCcv6dvu3+TDX5wz39diSPahjI+9HCbeTTnE45nZrZL0piVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JxDKEoGRrpB16fYCd/JI86ZtPyeRLyCQkqjj66jBYHw=;
	b=qfH35lcemb5GdKGsjPSjA7j7Cmg4AeutttUNnlEvWDSFDXr5Ku5ipLUxWO6br7YfaprL
	 0iyiyFA6xj3aYwjHnHBKN9d70TKkDexBdiMOmQyZes/n2sj3Qhr5qSFb0H1/D7reVWjat
	 llhjjBm2KQBxwSDWvBwI8VC6OdpJN75bhocff/zbjq1XjZfCytilqRNNTVpVnSBPOdPKa
	 MMuk0jbFt87znoxfYJhmAP6PFdYUB2juB1vXOVpVwrEfAoj7NgrjN5SPFFHEagbcoVy8U
	 WyhBeTy0Iv3ZLbSYW+YnOKxduLKpyQTzq5nJdiU4wgilKKusS+sVlN+uxgP+iBTHbig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NyjJ9YXD;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CF0606A6A1
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0CF0606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NyjJ9YXD
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49412eb1474so2157531f8f.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445616; x=1796050416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JxDKEoGRrpB16fYCd/JI86ZtPyeRLyCQkqjj66jBYHw=;
        b=NyjJ9YXDdL5wLNFFks+a7ZkP+HOPom/OLO8Ph65XoMDp1EwbWrGgYaffFRXi2L8vuh
         WQE1vQarforaMB6KWEz9zzSZqJanxqzoMq1BsDfe8++tRGDKY3IIitcn4BF1K1lebSFL
         KrWPP4560y0y/IB7RBfC7rUhJSa9APSfecaz69f5++NKDHY+LeniSZBj/vPZqjTpEHJC
         3h5FKLYP0/++vd3sIkkdHeDTYfxY6zyMsdV7d9gbwghmLNEngD/pwpOhdl3gr/s8yHEo
         6CFXyrBr8onT7u87gfFXNNkZwlbPcd6aXDC9E/aTQPhoj6ReJaymYF5oe2fudnsm+zY9
         2T/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445616; x=1796050416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JxDKEoGRrpB16fYCd/JI86ZtPyeRLyCQkqjj66jBYHw=;
        b=ReZa5Xb6+8gtJqlwUnDavCLHJhx2+jHIfXPYxmazzmJatg0NPimYdLrU+0jVhn8AEV
         cOfRb4XJRE9Sb9dItVJ0YmeY38oitse5hh16lBa8t5L+5unuuMe77vQ9X5wkBr6nZUC1
         ZZS2PluWIsAHz3lL4vPEiKVc/KiTm1+wCiDgV5Kdidi834DHDqMkgrlvo1aOXQwoccT3
         XvrvCyGTHfZR1DXe9VSC4HMsM31e0CeYPYrideX6WKrUyvJGS8vNYI2EfbgzVMH3241c
         5T2AE2LAIqu9xdGQ6bS5Otw5KTAt2FFbZxPPn2wYI4frg+/vs1AJ6ocdHWew13EhR5f3
         jUKw==
X-Forwarded-Encrypted: i=1; AL+hErFCQBV0k0I0a88DXa//hy7dgel+TNX2NTPPzeDxOmgGugMM5GmQcb60fDFnMXrBZJLE5xZrDv0FA/4f@vger.kernel.org
X-Gm-Message-State: APuU4Z8NujJMSNea/P1mqi8FrmYy6P1oDEvxwM8/nYAv3izF0KCVocwa
	FNOAppCu/4FHJ4ABheAFELbR7u/rwlUgCfM4kC24KWyWXd6l89OIGBY66slLypd/YNLNawhjAMB
	m7F2NT3A=
X-Gm-Gg: AZFdTZeKalzGec9ZBwEVr1xg4EgTSqgCe8RP9ImLshrbRIEYJQ6iiiKmr/5Nmlcp/Vk
	WO0vs/MzzazN5U1+2Dp3rj/weZws3Arc/V0X92dJNRIO0Ktj8Lz4UQy6g7F4wasXgZ7c6enIZ5S
	qb7zJ2NrgVAnForU8cBCY7jUte40bpdYCELiAyiKffWA7UGswmYvSFApN6SQxwONEGBXxlnWlCb
	wnYpBFgElulRmkxWVGU4h6iKzv6rbSdjGC94NAzDe5p85HlUwBtT7gP1xl/blZXudHT1/reUDz+
	FkVW2KiVyFRwG0YKpmK320xByxVTYLygv41xMdRzQu0+eHcPpUCZNSQ1pnmoMyVz5rHnT0nXmzF
	04S3tcTY2nJ9MbRxK5atukrnGYW+xq4taIX91wpzzi0IorMmYljl98tiAbJRjX/+XbN2LL/1mgt
	SVF9eaqFzDNyuKd98xklrxhooob3JOPJ2YDqQriMRqOyVJWTKmhTqx2t5FttBCMyvd0i+3Jun41
	GRQi2czIR6mvRJaBydwYETvE5e77F8TvZDG3QP0ytrtQOgYMcj6C2Hl3quFFDztQkz76eiHtrO4
	r+VNJ02wzEGr
X-Received: by 2002:a05:6000:29d2:b0:4a6:4591:e4ac with SMTP id ffacd0b85a97d-4abb3b42d80mr17490933f8f.15.1795445616375;
        Mon, 23 Nov 2026 06:53:36 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm22698782f8f.41.2026.11.23.06.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:36 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 03/28] dmaengine: bcm2835: Add NO_WAIT_RESP, DMA_WIDE_SOURCE and DMA_WIDE_DEST flag
Date: Mon, 23 Nov 2026 15:56:41 +0100
Message-ID: <20261123145728.29082-4-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
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

From: Phil Elwell <phil@raspberrypi.com>

Use bit 27 of the dreq value (the second cell of the DT DMA descriptor)
to request that the WAIT_RESP bit is not set.

Use (reserved) bits 24 and 25 of the dreq value
(the second cell of the DT DMA descriptor) to request
that wide source reads or wide dest writes are required

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 690f5ba1c439..118ba2f71dc8 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -145,6 +145,21 @@ struct bcm2835_desc {
 #define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
 #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
 
+/* A fake bit to request that the driver doesn't set the WAIT_RESP bit. */
+#define BCM2835_DMA_NO_WAIT_RESP BIT(27)
+#define WAIT_RESP(x) (((x) & BCM2835_DMA_NO_WAIT_RESP) ? \
+		      0 : BCM2835_DMA_WAIT_RESP)
+
+/* A fake bit to request that the driver requires wide reads */
+#define BCM2835_DMA_WIDE_SOURCE BIT(24)
+#define WIDE_SOURCE(x) (((x) & BCM2835_DMA_WIDE_SOURCE) ? \
+		      BCM2835_DMA_S_WIDTH : 0)
+
+/* A fake bit to request that the driver requires wide writes */
+#define BCM2835_DMA_WIDE_DEST BIT(25)
+#define WIDE_DEST(x) (((x) & BCM2835_DMA_WIDE_DEST) ? \
+		      BCM2835_DMA_D_WIDTH : 0)
+
 /* debug register bits */
 #define BCM2835_DMA_DEBUG_LAST_NOT_SET_ERR	BIT(0)
 #define BCM2835_DMA_DEBUG_FIFO_ERR		BIT(1)
@@ -605,8 +620,9 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
-	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC;
-	u32 extra = BCM2835_DMA_INT_EN | BCM2835_DMA_WAIT_RESP;
+	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC |
+		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
+	u32 extra = BCM2835_DMA_INT_EN;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -636,7 +652,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = BCM2835_DMA_WAIT_RESP;
+	u32 info = WAIT_RESP(c->dreq) |
+		   WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t frames;
 
@@ -688,7 +705,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
-	u32 info = BCM2835_DMA_WAIT_RESP;
+	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
 	u32 extra = 0;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
-- 
2.51.0

