Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445620;
	b=3KzZUEZ/yLE5a7V7TjfREhw+jkKP9AJ+8S36WuHtPy1A1s+L+7l4XZzhgIY8MWQSjTuO
	 z5CCpmyPhnmE/uVMFUNPLv7NdFteCtQrBVOBbpM2sadhooRISjaX8MYdSTxedPjPcyXVY
	 ji8YO5AHvA17D8mVFCCG6Ehch0/+Ji18YkeO9K5zpFXGj+mPAqhZ/52SZ0xzoTMbsndoX
	 Hv8RbIpZ6USewVWdHOOl3XEa+j2fqLG98ojZOiUvM9JcyXD23PXqwmlYNwSrLSKaffI9w
	 gJOsvHZs/Oe0z4/0UQI3RLiHduqxnCSQeO2Biz1Tb+7rgKN4poIX3/o9oRiGGMM18Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N0XUkbBZQjwMXywlAqudB9OULMaRdVS1E8mdwW3kIvQ=;
	b=aH7vQDagj0fZ3VRKqITMBFidt6pPyGaiR7LoE+byC+xWVXW/LFv+XtjqWwaDlLJyIKl1
	 KeCA/h820/MXfy1laZQaYmi6u1y5IBx5uAtr5bJ/51CLOAEWTQkWnS71VLY+kRda4QxG/
	 XTM3aMXGOy9tlurvqnciovqqMPBMrNa/6RHukoRB6YL6wx8TULn93oqKpsGLXCf+jMqQ6
	 fgy5STAznH2d9QWKOp4nwJy0nJ7fDP3Tur61b8iVZzLRTZ1+bmrJ/AnC460eeR0tVmFnJ
	 W2QYpy7XJ2jWQuvpTiJ4e+uvEO2+Dgx9U7iGjaXdVjVrgEiWCWRbEK1lxbfC6TtvFfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VsRcNHUS;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5672606A6B4
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5672606A6B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VsRcNHUS
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so4947645e9.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445618; x=1796050418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0XUkbBZQjwMXywlAqudB9OULMaRdVS1E8mdwW3kIvQ=;
        b=VsRcNHUStZVYhtqFMcQakr0YXKqAbT6JzT7+DP8OORhloXY+hy7LjP0dZr4FCdl3LD
         4hAFRZyEifxkGj1EzibEhkPSbSuUOHQcM24kRsM14j49f79tLmUun7UO99XZRXiVRkZ9
         CAgfaoCshkt12aTOMolFtdXUdzW8wAk2VNHTPywNDQVw0qT6TdZWtbJNA30O/YRKopub
         YevWMxldCWgCejmIJOsN6l3pgZ1DZysW4YQbXsIeCPLGL981TwdGE9GiMxAIn5TPXytc
         p3+1fHHJTFiRWy/f0dYSKS5MR3d3I2yPC5NMJTjQaSLie1co05flttzCPHQBKWQao076
         0MsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445618; x=1796050418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N0XUkbBZQjwMXywlAqudB9OULMaRdVS1E8mdwW3kIvQ=;
        b=syIdx7eUGhej8392ApO0Fq5hD1RBQKciWBCyc2c808Ol0oOAnOl8Du0KYoFEscTkm9
         sRcbRftSw9ifUu2Sl0hnJ3gd4dTJbFLic4Kk2OtVfTnlP4DncjfQtivfSw4bEJlgw3PU
         U5UAMDsW8qRsDb2ECM9yVDZ15GQ3oElu3jLNEujSs15wulRPiaqORxZzlyQVQ2G/sk+e
         5czyW4ZKoIEiJwgn5Ysu/KWhLR7U2XOde6whiI8VCAAHgEzEOktDAlzwiANIiYFRx6Q9
         hEJE9WerzjyUUWO94ZQkg0Bv5+7LJAV24tHqvYGRiRJaZL0jN5MPIbnrCE9gAbbfyGLD
         v9eQ==
X-Forwarded-Encrypted: i=1; AL+hErFKYxSn17a9sV1f+N1PtZHZoyNqXDlF7DZ1u0xqn76KcYtRW6gV1aKVWXLlV/QCSBFxO3yjDG4Lglnj@vger.kernel.org
X-Gm-Message-State: APuU4Z+sRdioOWXZLVO9M12oc/P4CpNmDrQKiS2RTDnwkbQiDNA9GWcK
	rtL2nmLEPI1QHPOnTHi/M3pIn79AMNtnL6VoQvQhvYrPY1GTpid/YtY0iHGv/aBnraQ=
X-Gm-Gg: AZFdTZfA8tAqEQZJpfvH+LMgahadfrqUiOgKUl/vJYLfNbUEVqipvzzgSzsLacr+Iru
	q5McyzCisswnLqoukPn2AY/Fkbr1UsOUlYWdj/HIHTK5l1pHql9FQNvMbnYYBveIR6MuTmB8Ahl
	vaVt1qnvVzTyAZwpmlgACe6X8xzmFB+kT6IU1oTOSR4PuafRuTEeq2jMEeFqhZWPl5GinaNbAwr
	W4IAOvX5Lgm0CDurGC126UM2wv7oDnVnyB3TeCBRsgu96tRo5J+6XQ5HJDcBGK76DZ+fEdNELOt
	ABYmPtKP06YLJFxWhtABxBeoyqMozd27iKVkOJgeajwv8WZJPSZyy1N+41y8iefPGOqLoqLR4vj
	E0dCoOt3SkB0GkB2exiGg9qGWjbdnrmpKDh0+FA14ko/rAjq7HQyIJ5PFpCLAnyJdcaSAu091E+
	gDXpNBxcPUJ/iFk9dLAKK7a8eeIGPUJpqKOrWmN93NxzKMO/jlOnDPobAu8p6HuIbwPt2nubCu0
	WfdN4UvHfzjEO61XIdJDmo95zn6gkeh+LBWYsRGGlBV3J/H/7dxh9ZQTSDCTZlBjGicqhIlSuLe
	fg/vQ2lVKC4BHa+2DHFktB2/vpk=
X-Received: by 2002:a05:600c:64c7:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb887fe725mr228663945e9.11.1795445618234;
        Mon, 23 Nov 2026 06:53:38 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066f6e6sm142776925e9.3.2026.11.23.06.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:37 -0800 (PST)
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
Subject: [PATCH v3 04/28] dmaengine: bcm2835: Support dma flags for multi-beat burst
Date: Mon, 23 Nov 2026 15:56:42 +0100
Message-ID: <20261123145728.29082-5-andrea.porta@suse.com>
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

From: Dom Cobley <popcornmix@gmail.com>

Add a control bit to enable a multi-beat burst on a DMA.
This improves DMA performance and is required for HDMI audio.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 118ba2f71dc8..063e1b2aabe3 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -137,6 +137,7 @@ struct bcm2835_desc {
 #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
 #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
 #define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
+#define BCM2835_DMA_GET_BURST_LENGTH(x) (((x) >> 12) & 15)
 #define BCM2835_DMA_CS_FLAGS(x) ((x) & (BCM2835_DMA_PRIORITY(15) | \
 				      BCM2835_DMA_PANIC_PRIORITY(15) | \
 				      BCM2835_DMA_WAIT_FOR_WRITES | \
@@ -160,6 +161,11 @@ struct bcm2835_desc {
 #define WIDE_DEST(x) (((x) & BCM2835_DMA_WIDE_DEST) ? \
 		      BCM2835_DMA_D_WIDTH : 0)
 
+/* A fake bit to request that the driver requires multi-beat burst */
+#define BCM2835_DMA_BURST BIT(30)
+#define BURST_LENGTH(x) (((x) & BCM2835_DMA_BURST) ? \
+			 BCM2835_DMA_BURST_LENGTH(3) : 0)
+
 /* debug register bits */
 #define BCM2835_DMA_DEBUG_LAST_NOT_SET_ERR	BIT(0)
 #define BCM2835_DMA_DEBUG_FIFO_ERR		BIT(1)
@@ -621,7 +627,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC |
-		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
+		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
+		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
@@ -652,8 +659,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = WAIT_RESP(c->dreq) |
-		   WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
+	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
+		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t frames;
 
@@ -705,7 +712,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
-	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
+	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
+		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
 	u32 extra = 0;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
-- 
2.51.0

