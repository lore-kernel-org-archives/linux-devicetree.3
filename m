Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781934;
	b=uKLkN6FGz5peaMgVY0Ev6DouOVVMt12Iyv58c7Sh6ixWHjrk71KUNA/K1BwJrX6l5Rcv
	 ugEQoKIPWIkiZOJxKFTsvEXW37hqhT7UjwHZKIksHkV2Y3zQsXE/tQQsP0PBMQpdEf89W
	 VjpnjjvWd/3EMSttsVeDmUFmTCgdQPhGEIkfSKOKhAsY9jBJbPWlQXC9ysC+nLkQaTvsA
	 vw3zRcgrytho1/WrHNdkC2cPVMrQIoxGN+pCEUFw+m6XK+CoCuCFmZXcqc4bxrrUB7E4c
	 /9xZ5ZE43DRDJqF5cj98md2wCHFJ9s5pDK1m9hKIpX6EOP3wXGpC8x7bGDp6IYCJCHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tMNGeO93sTxsEO33pmW8bPBo/h98Zw55MeMFxQkFO1s=;
	b=KeTcVu1Cti8YwY56p+k2M+9tifefCiUQbDxuIeVU9hIsHbVKCL0r7espK6TMJiz4Aamt
	 GUz5kl9r65Z+EcPg+3zIWkY8IidECOtjck23sPn6teQxnrE5NbsK4Y0oiohtecMNn9L/4
	 IyPgNXHyE6DYx9J85lVtBDEAPLGAvlFHz2moSLvIHo8Anka76xsSBTZwfaQHTPB5mpGJB
	 t9SB+PwGy8yg1a4QOOpPd+5O7GmVU4Zor8JuM8YxiddpUR27g51FvxdPpMJ6ixb99C4cy
	 AJcqlOgEsTV21yMYWw1P70gbNu/gLZNvFwaoJxYlK8SR6kxr1Bw6ErMx7pKLB6bE3Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=f7V+6qQp;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25CA60A2630
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D25CA60A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=f7V+6qQp
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso7233369f8f.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781932; x=1796386732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMNGeO93sTxsEO33pmW8bPBo/h98Zw55MeMFxQkFO1s=;
        b=f7V+6qQp9oKQCCyIIuvhYzNaC0PSDlXmV9Kf87U58Jdd8Tfa3UwNQPJaDGJm55jY2X
         VY/VSZL9DjzgO71JIj+jKNYhtKYMfOTmiRhRLSvTW3Pmy7uiPzz6pOaFfmxELYynSdgd
         s5wquoBzlT+vnNbtdzTC4idxwJddDlexIyKaK+uW/0nMlgN47rIH1AsLXnohCWo7TsdF
         nfqd1KAGtBnCazYGG1sGY733YUGrXpyDrb+B2gQBwZKp7r/CS9hOzdaMAeMIj3ryyzc8
         RSvyb5npBLRcjTdu0wVgp3uliyFCYIJ80rIOKhHMdYzk9NpXFzReqmI16qTSCA67f61h
         Q5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781932; x=1796386732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tMNGeO93sTxsEO33pmW8bPBo/h98Zw55MeMFxQkFO1s=;
        b=tw9VYqQlt3ugLkT2UBCwcmBxgqXCrU/N+3U1C8hEDGU/dOHxW5V24fLdKoRCUuowym
         jHWwaVdNHEEEQ9fZh7gM4XIQRQ1NiLSQoHYSioE2gtZmEQ6xCocDKrTDzSDcQTPqNmQd
         le9FEVs6tMbjKvcQG0eZLDUNztoXp5cnxmj0ut5xM01jsYVMterNjcHCKPY1/5oei266
         iy3SYyPBOaJltfmF0ioa71ZsAkyrjC7W0vRssi9qyhJv49fdfEIxk/4KTlUtkOw5E2tc
         ZFpdNQ6qOg24n0SdYTdB8TTm5fP7qTGA/bgovhZgBHh+jQXn+TI04aP5RyYztvS3CLbA
         9dpQ==
X-Forwarded-Encrypted: i=1; AL+hErEyBuQmyzrkdNq3DtYYlvv1go0YRMgUF3vk3bUKbMKO696NS3bEBhc38PKG4QCcoNNyiXH+RNUnEIzu@vger.kernel.org
X-Gm-Message-State: APuU4Z9m+OUfHDiH91oksBtVmQI5IbcHrBEa5GdaxUC7eo9S/QLMFJaH
	9mCSEhebA6GEDarFtGzsDpmxtfqHnJ1cmG3HbuUVknuu9mjMDka0xctxlSrCQUGZ1NU=
X-Gm-Gg: AZFdTZcLglizzdX2QGtM/EKCLY9E6sjrdyeMIpE3vMT0zLKfIsYhMaQGJm+zhp6CkLj
	C7IPDlFqAPjRmIagwo3rr/d1xOLZwPoaM6ObezyIVJ5edfcOAxWEhDWd5p+SAFm42O0qzSjb0/v
	dGA0cNY54VcQjvHg1sbxxfd9UACCBNnGbsKEtK9jvqmjBxN9lHXVGrU3czjQkvRrYRYx6KR6tDM
	zYSd9uYLHazuWeIejRmP2WXO+Pe6ZWmoE4rycIj24yHFBAFq3NQNrKjBvCpdQu12+UhQf+eeNb8
	AYkxacoZMYwwDLZWcmXthOpwbl9d625a7Rr/Si1uQwBIQh2q0NS+225kun+PEiEXF76kR52YcWH
	bgO4O+ZowplMODEjTnQLT8Doab8TbunEoo6XU/Sv2v0YGvzg9sdNq0iU881Djc01P5u2RMmMwdj
	9jj1Ss9lOwED4wg6rG8XK/8Qw71Vux4XWCIvevVe19Rvx0Fcuv0y0zmKT3oWu3xcNUtJa2PZg+Q
	rXFwt1HHOihREX42ecwdvXHr744/8phWSSDM8qsS3XwrfryqjXJOSyvHg3BOBNhrS7aM4FEqypT
	EQQnAni0K67p496jfwUUjJIehAui
X-Received: by 2002:a05:6000:299c:10b0:4a7:9630:7b5a with SMTP id ffacd0b85a97d-4abb47b2043mr35030668f8f.47.1795781932170;
        Fri, 27 Nov 2026 04:18:52 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm44903360f8f.36.2026.11.27.04.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:51 -0800 (PST)
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
Subject: [PATCH v4 08/28] dmaengine: bcm2835: move CB info generation into separate function
Date: Fri, 27 Nov 2026 13:21:58 +0100
Message-ID: <20261127122236.4976-9-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
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

Actually the generation of the Control Block info follows some simple
rules. So handle this with a separate function to avoid open coding
for every DMA operation. Another advantage is that we can easier
introduce other platforms with different info bits.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 53 +++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index d2e000e94347..eb306397b0fa 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -228,6 +228,33 @@ static inline struct bcm2835_desc *to_bcm2835_dma_desc(
 	return container_of(t, struct bcm2835_desc, vd.tx);
 }
 
+static u32 bcm2835_dma_prepare_cb_info(struct bcm2835_chan *c,
+				       enum dma_transfer_direction direction,
+				       bool zero_page)
+{
+	u32 result = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
+		     WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
+
+	if (direction == DMA_MEM_TO_MEM)
+		return result | BCM2835_DMA_D_INC | BCM2835_DMA_S_INC;
+
+	/* Setup DREQ channel */
+	if (c->dreq != 0)
+		result |= BCM2835_DMA_PER_MAP(c->dreq);
+
+	if (direction == DMA_DEV_TO_MEM) {
+		result |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
+	} else {
+		result |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
+
+		/* non-lite channels can write zeroes w/o accessing memory */
+		if (zero_page && !c->is_lite_channel)
+			result |= BCM2835_DMA_S_IGNORE;
+	}
+
+	return result;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -631,9 +658,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
-	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC |
-		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
-		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
+	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
@@ -664,8 +689,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
-		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
+	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t frames;
 
@@ -675,19 +699,14 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 		return NULL;
 	}
 
-	if (c->dreq != 0)
-		info |= BCM2835_DMA_PER_MAP(c->dreq);
-
 	if (direction == DMA_DEV_TO_MEM) {
 		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		src = c->cfg.src_addr;
-		info |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
 	} else {
 		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		dst = c->cfg.dst_addr;
-		info |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
 	}
 
 	/* count frames in sg list */
@@ -717,8 +736,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
-	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
-		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
+	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
+					       buf_addr == od->zero_page);
 	u32 extra = 0;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
@@ -749,26 +768,16 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 			      "%s: buffer_length (%zd) is not a multiple of period_len (%zd)\n",
 			      __func__, buf_len, period_len);
 
-	/* Setup DREQ channel */
-	if (c->dreq != 0)
-		info |= BCM2835_DMA_PER_MAP(c->dreq);
-
 	if (direction == DMA_DEV_TO_MEM) {
 		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		src = c->cfg.src_addr;
 		dst = buf_addr;
-		info |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
 	} else {
 		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		dst = c->cfg.dst_addr;
 		src = buf_addr;
-		info |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
-
-		/* non-lite channels can write zeroes w/o accessing memory */
-		if (buf_addr == od->zero_page && !c->is_lite_channel)
-			info |= BCM2835_DMA_S_IGNORE;
 	}
 
 	/* calculate number of frames */
-- 
2.51.0

