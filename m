Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781928;
	b=acvXuhKQZwglWYffAKs3/YhEUxbm++PZbxBz5aD0zfjBq1P745BftEkzUnxgsDOMBdyY
	 dJ+jjiZIjhv5oiJ/2SWksfXBadoFXUq7VYRtiVGaLcdhPMZ0rkrxA5No4rDVd81iBzE+h
	 7eBB5uvM5T82Z0g7zMkvvC2scl+vtzqpxHkr8gma9noexWXolC1/Xfiw5CvcLJ8QPsx7r
	 +R2RK4z8PeguRtf7CpAbuYSKwHpNY64LvGJjSsJ5RpJrGlhuG1Llg4BgM4FNiS/rdJS+q
	 vWMSu/b87phfHKJQQGSdjWxgAt1Q7J5a4zpYB448lAx8c4cthkuUwlLWKXGBfB5jZXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HHc1h34Szr9MIeTslR2JBSbsVjgERamOhUYUByTP2dQ=;
	b=lI1Qm9ZPh5M29g4mUuoWUJKGucMdqmOH8Fxb4t+OWorFwrp5TTZxHYnP+iyUCZxuEHlm
	 2DfbWEF7drQHexFbtgNnLNeGFZ3XeAFWDl68M8d7qve74IL/+Wi8L8gjGMzkfZZdVf0Ga
	 NoKvYD9dvnF4hwW5Dn13J6rkKnERVP6zRzsOS1SscYt4dYxn5Us0mK/DyPaLLRxsTLuZx
	 VUP5U53IOc5im+SQgudhEAzG9egXUKVh9K33HLnszXMlokPEHAFnhMeBXkCvDCYVYRS0E
	 6KiXNQbg/LbcdIKWJpfCGhdx8o5kd9xnOpZAD/ORcb37k5au1iUBCTQE35eODEOpA1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=En16u6wH;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9CF606A330
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A9CF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=En16u6wH
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so54839545e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781927; x=1796386727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHc1h34Szr9MIeTslR2JBSbsVjgERamOhUYUByTP2dQ=;
        b=En16u6wHuXlftRpCxrv4LWYfLAhL6sdMDfR/gRyHqICof8EOZ2p5PhojWublR37GQ9
         4zVRfN/XKekxMR37e9hIHcVDBTyKoNkX7cKDk8vAqVTAETwW8yRUk2XaT+rB7Estv1t2
         tor0LE0pW5PqSk0wPGk4qUm3tg30Wr3sAPwrn3ZVwK0MtK0xpsBOlHIxUDTv+J/j+8L/
         XBg9tRIdz8+YhV2z+Qa6kTyxNYtIHUGD5LRT/skegDSrOzulAlpViIb7sS6xzFqa/UUX
         nhL8wQZwhHHbjwQ+5dN0E3bH87NbwGTpfLz/ZctojPlLnPhZC0rmxvDNVU05vFu3oSS+
         udRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781927; x=1796386727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HHc1h34Szr9MIeTslR2JBSbsVjgERamOhUYUByTP2dQ=;
        b=OJQPmZDZuRRu/GCsIpsbS/CJOZ91TwHKAgBZ+6ktJ9QEFdrALxHIP69slY2Spfv10i
         Pg9fSFEWBoR/poobSXzFleoru+SzNWKSf3AJAANRgCULSdlfBujXYyVrvHucxSlaSoYV
         derrt3MP5VcRLeMRInNh3j3PRGLpJzBPIcskMCE6inzuDxGQWHe0pQ9FluLb0d52rgTp
         y92OjL3WgSD+oGZWqFcaLkwi3irQed5/C3mXP6N3a3Of8oJjsHEaVIsX6Jst50pFZZ/3
         0FXdSaW8VWzOPmLrjs2ujid304tWuM//eUtXHVpm5jNCz2sVNHdoF67Zcjq/PpC1nYyZ
         ZDRw==
X-Forwarded-Encrypted: i=1; AL+hErGJHpDJ1OUaFkhcMQRo0QqnrsVhQXt0rY1sk8+ZEKwsddb8dZiOl5zdpvNp8xO3YmMHcQZCF4d4UwlB@vger.kernel.org
X-Gm-Message-State: APuU4Z/4NNFXJdrJNpiJysTSTpN/oKfLDsd1rettgGySKQaibNd6spEk
	PXGwiT4kD9+ISeNKD+cd0mmwNYesvMvqBp8RvtAARHss8sqoN1lwQyK9CtnQXK7I9ec=
X-Gm-Gg: AZFdTZcc5ENcN9RguXdMxFFCvJ5X4wTitiXdLtzQKgit53FeLfSm8AabAzIEZVHpywe
	dVaGBFjrqQnr1RpMIOZWbnkVab/XRhM+dNhBSgptPJwI7lRoU+087PUGIODffxlwNktgsV+Quw4
	a1GT6q5jToxAUi/tlXwa5kUybYm5rPmrQsS0eFDUu87Oc92MNH66Ihm/Tt/E5b1JsCEQ0GHi2Ae
	qihkcPKn/qk9OvykQjFSxI6XflYcB13JyKdxPCmBZpniyIu4Pt2uj37Sj8njHmAzQ1q8rxhK0zX
	brBaP9GufctNoR/V3lw9zQVj2huCpiTkmevJXwT/w70vbrWWoBL5bu1WyOuCEvxHC27L7BNCb2g
	TnCUzo9CA3Z2aCDvSy5lsV8iebodJ0nRbj0W/Z/uXsRlK/uPxks2Na8xbvMx4TdF1YMPdvhGl3/
	Eup25bXqLXyVQ7nx/ldStb3APYL8PjYNYqLlpKQHZqpBO2KWxW7DSBTADr4nceFLHEFn7t1yf3V
	sKaB6F7xv1rhKEAHEUT7qwm3NyrY4KefOkDY3VYu7Y3/1M/FGhptZLlcM8UNMESJwzaX7pdOVt9
	GDy2qSC+YbW2E2RyxSlzb0qWJzuMoriznWK85nvQlxsClzARRQ==
X-Received: by 2002:a05:600d:1c:b0:4bb:9dbd:feb7 with SMTP id 5b1f17b1804b1-4bb9dbdff35mr234651065e9.9.1795781926690;
        Fri, 27 Nov 2026 04:18:46 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm412781955e9.1.2026.11.27.04.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:46 -0800 (PST)
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
Subject: [PATCH v4 04/28] dmaengine: bcm2835: Add NO_WAIT_RESP, DMA_WIDE_SOURCE and DMA_WIDE_DEST flag
Date: Fri, 27 Nov 2026 13:21:54 +0100
Message-ID: <20261127122236.4976-5-andrea.porta@suse.com>
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

From: Phil Elwell <phil@raspberrypi.com>

Use bit 27 of the dreq value (the DREQ cell of the DT DMA specifier) to
request that the WAIT_RESP bit is not set.

Use bits 24 and 25 of the dreq value to request that wide source reads
or wide dest writes are required.

These bits are only interpreted by the driver, which translates them
into the corresponding bits of the TI register (or of the info field of
the control blocks): they are never written to the hardware as they
are.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 5a9854a3c08e..7bd1fbb2c36d 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -154,6 +154,18 @@ struct bcm2835_desc {
 				      BCM2835_DMA_FLAG_WAIT_FOR_WRITES | \
 				      BCM2835_DMA_FLAG_DIS_DEBUG))
 
+/*
+ * Flags of the DMA specifier to be translated into TI register bits. They
+ * are never written to the TI register as they are, as they occupy bits
+ * which are either reserved or have a different meaning there.
+ */
+#define WAIT_RESP(x) (((x) & BCM2835_DMA_FLAG_NO_WAIT_RESP) ? \
+		      0 : BCM2835_DMA_WAIT_RESP)
+#define WIDE_SOURCE(x) (((x) & BCM2835_DMA_FLAG_WIDE_SOURCE) ? \
+			BCM2835_DMA_S_WIDTH : 0)
+#define WIDE_DEST(x) (((x) & BCM2835_DMA_FLAG_WIDE_DEST) ? \
+		      BCM2835_DMA_D_WIDTH : 0)
+
 /* debug register bits */
 #define BCM2835_DMA_DEBUG_LAST_NOT_SET_ERR	BIT(0)
 #define BCM2835_DMA_DEBUG_FIFO_ERR		BIT(1)
@@ -617,8 +629,9 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
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
 
@@ -648,7 +661,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = BCM2835_DMA_WAIT_RESP;
+	u32 info = WAIT_RESP(c->dreq) |
+		   WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t frames;
 
@@ -700,7 +714,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
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

