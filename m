Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445627;
	b=oMRiTZAABUMBrImYmON8CrFvfmZflLGX57ij1UvykDSfbrDVhPXUHZfuPe06RdaSZV0Y
	 3yRP0m6Rk7tQ9X+XYKACMTGvWdx2Gohyoh4KhGnHm7WGpN0+YlpaV2NLx14PMHjI7aIWX
	 6Dw4XozE7c0BMob3jD+gBoQjCdHUVgN+tG4fuqahvATbmu36+WifaI/tSazTsTmNwL3fr
	 tBkrHTVngPMYnjbr+N9IcSX9kKqqGecQA6NfhOZwh0C5TaSA7qAf0uHjrUnXPNQdPaU/Q
	 vfqXY15jXISDeXlQ6zbaNMIIw9v0Z+FuTC7S1HuxQORaKOBb1Rg9SC+N8aTP2Ztq5Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AI8HWgrEJm2ajFDDgXXsC9dIqWcTrg87ImDVMUpFPTg=;
	b=ZUKQIoFvTid9R2vp8F0og4o6vX3qQtWeuOzjfJ2h6zJVPzCSJizeZlvz3tqs4bN6Q4ti
	 tClAbQCeU0k7nJ20laYKFCSAON4G00CWRzIxo8HXCpivk9mORBfwSZWrEs+pCx3qOoYBZ
	 j8x/GGpF/Cdj03nlFyQUFabiY13P45SzcRUlq7tYraO3WKaT09AUo8LWmdyjkVfdJkKFl
	 yk9samZuNfIoOjOmB2vh1LGUdGYbTWrNYR3srx1hbYbGiyAmH1Lk8HWMiiHBmAnt1Tc9A
	 v37hT9jZprv6qxG+dS/K5hLY5UZ21AdUysJBiWgrGPaaH13g2YUVDX+HVUmZYU2NheQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=S0x9ZWBT;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0C160A380A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A0C160A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=S0x9ZWBT
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492690dd5daso2568656f8f.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445625; x=1796050425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AI8HWgrEJm2ajFDDgXXsC9dIqWcTrg87ImDVMUpFPTg=;
        b=S0x9ZWBTAnHocL3EnDhx3xxWTqRrV/1bdeeQE6I0VvXAyjH8j614pphvZjIpi5ihD1
         bDYvWO970aFkNWfDRvFLvXS39Wn8Lwn2LA+IShv1m1DxW+Z9T0DrgEGHjzmrnk+QX3m7
         MCsa3lda5o1rLOHrNj6I2P0el+vgv+rnKt1p5nDy2Vqw+mJnp1GHk2xKeulSJZbY8jHw
         MgDt6kXPZIe6tcmpLOOB4vodLc4i9NIVY9vBeXvzCOHyddKNsM8E/6/KDSlKkj/MXjhK
         3yBQQjKERDP0zlsa0QDQJUSM6Q/NRDDmK8Hj54XuTDRMEequKhRe61qzcrB8qnDEp9vn
         /l0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445626; x=1796050426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AI8HWgrEJm2ajFDDgXXsC9dIqWcTrg87ImDVMUpFPTg=;
        b=Y9yQ1H+b9bB460li59uSc8Nje51XTndycHfyPTcpC62Bg6zDQ2QEi2ac88LU/2dULk
         B8ldMuKIyU/C1ezx7X722RPK0wIkgbGwS0FX8rDazFB7liivL1uOGQEUmjrJ2eNN2Ovz
         Gnbhn2VpxaUM7m8e+XqqgOU0qVU9JlXWPaDDW+cWi1R1skHnUuPFVZ2SytQrnLDj70TX
         pMfh0KTm8Y593E3dDgUI6hXrtQQ96d3H2K55r+uZ6oJuOwar0FQ4RQO9/6FKadZdYWws
         z/P/x6N7y4HHi1iM7UAOJwMlYicv1koYtj81MywjXG9q0EdP1bhUmCNvPzLQxl9aob9q
         1NrA==
X-Forwarded-Encrypted: i=1; AL+hErF50VLjK5JeVjCbK557H8Ha5dnAplR9ewfJmERhDHrsreGQAw0S3eS8vaNe4SesZz+DlUtLbnlpOy97@vger.kernel.org
X-Gm-Message-State: APuU4Z9FZIGxODMIy+34PEyoGHc/iYf0mXklCEWWZtgDpSI59abNRlEu
	NUHi9KVYyF/vRvYJkSJ/IieWDcTUH4YQXeiiu3T+9Kia4dE3JjOPx6NnXGpgQuFlMGc=
X-Gm-Gg: AZFdTZcbMzKINo0953TNqsUbGbPfNUlyqTbrXZkw7W2OHXGihO1uoeRNelSQKSDql+o
	3Ytqai32cRWbzFkXaPOVb2ikQhqq5VbKyjkAF0vJAOo2xH7lIAT3oXpuGyo5bbQsai9yeASws+Y
	a3OJ54qO5eN9cSyk3byLVK9ZQcLGPey1BKIrxKoHcJEGJ6g4DAJ5VsSIPxqehvHRaJ9V2mE0hNG
	W4/lp8WpjCFqCEssnXTtA9A0iKJnDHYM3SKVzJ+/8BUoPHjQMk1tX9+FDH8/Dldd/cebAFS48fD
	/KKjkpUnHqnYipEEkSjes/Ip7BTA2Zzp/rPhnos8uI2q0WdSNKy92DbhYcWFOLDP4A1vYjwr1Ys
	mJMxbLEvrb5KdcjPBHmFr8zTujcRZy1Q5Hj3lDEooCNWp6T6aneenYKHpGfwrhSLjaPRaGbq2za
	S6arhmRHWTbP38LeeEoOLY5VPa7GCqBe7cNb1lPzRVmuow7A6McL38eFdFA2pmozD8FEx6aTiiw
	v4w1vgmAtbBzH6auFll/L8hSwWpeDs+ifvEtIvOJO9Y69FVN+oIxnpVFWJ9rPgbMkWbm4dSP+Pd
	8e2tIfCZV4BTQhAYcANzCLgc6PwknEgAJu/65C03dkPHD1NM
X-Received: by 2002:a05:6000:2210:b0:48d:facb:5937 with SMTP id ffacd0b85a97d-4abab5ea340mr24200572f8f.7.1795445625624;
        Mon, 23 Nov 2026 06:53:45 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm21988037f8f.56.2026.11.23.06.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:44 -0800 (PST)
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
Subject: [PATCH v3 09/28] dmaengine: bcm2835: move CB final extra info generation into function
Date: Mon, 23 Nov 2026 15:56:47 +0100
Message-ID: <20261123145728.29082-10-andrea.porta@suse.com>
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

Similar to the info generation, generate the final extra info with a
separate function. This is necessary to introduce other platforms
with different info bits.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index adf3508246ec..77b3e2f58ac5 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -253,6 +253,26 @@ static u32 bcm2835_dma_prepare_cb_info(struct bcm2835_chan *c,
 	return result;
 }
 
+static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
+					enum dma_transfer_direction direction,
+					bool cyclic, bool final,
+					unsigned long flags)
+{
+	u32 result = 0;
+
+	if (cyclic) {
+		if (flags & DMA_PREP_INTERRUPT)
+			result |= BCM2835_DMA_INT_EN;
+	} else {
+		if (!final)
+			return 0;
+
+		result |= BCM2835_DMA_INT_EN;
+	}
+
+	return result;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -668,7 +688,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
-	u32 extra = BCM2835_DMA_INT_EN;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, DMA_MEM_TO_MEM, false,
+						 true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -699,7 +720,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
 	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
-	u32 extra = BCM2835_DMA_INT_EN;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, false, true, 0);
 	size_t frames;
 
 	if (!is_slave_direction(direction)) {
@@ -747,7 +768,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	dma_addr_t src, dst;
 	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
 					       buf_addr == od->zero_page);
-	u32 extra = 0;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, true, true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -763,9 +784,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 		return NULL;
 	}
 
-	if (flags & DMA_PREP_INTERRUPT)
-		extra |= BCM2835_DMA_INT_EN;
-	else
+	if (!(flags & DMA_PREP_INTERRUPT))
 		period_len = buf_len;
 
 	/*
-- 
2.51.0

