Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781925;
	b=o2tCEqmYKt59nzlw6Bk+Bq31ePvAkAePz8vNxVDTCcFKI+6jwwPJwpryHjrzEBwTRtU5
	 ryC2d1ncoN62f5v4FQ6N4kAaLCI04mRwN/8ZHqSYrvbvaN47H6Ui9ckJnygD+uXb0rqlJ
	 cn3FQgWH2i4hiRU6H2oJlcWGzm9Gdg2YZoFmoE4PCILe/XsY3c7Vq7Z2cy0EzXRPOytMe
	 MH5QUaVX9W2d/UMqfUFo2aFTEv5gViDKqbhfMhRJQeIEhtHk7owGQvb24jXxUwHADHCW2
	 VKQ0hAZQoFraHhWXLJi0ItGzBTdOlItj5TD6kgJ89GQ1cyRRyQwWXyW4THJs8Dc9yjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nnn/mFpoR7L3dnATqzoKoqtIs3zKchqzDBWjzMLVr8g=;
	b=5dUy+FswGOuTIkTQTx7PdW6/kfKfTxL7Lq0JJLDybsSG+TydwyoNgCwDGqN6tFrdFGdQ
	 33jADwNDKWKSttdLhjJdIxYkRucPV+itJcJBGGfMA6N9A6wJTUC4/h//wxc1saUa+lcYc
	 F9AH40hL7aKjSwxZ1yK7G5Gnmj6hA0T598xE502KwxNSDY2lcUzd3D94xpuGMxONwM/zd
	 Fve1PNfuiSFbFadFxb3LMXPcy3PHJEf3uatzWflkRQ0fhpAB8jTkMlJg2mSX8d+m6CgcQ
	 y9C2jRMaEpjCdku2RT6pP+3OTKrgxMRnOrRs120ePsbh6TKnka2+xq3okn6Z+8SXf+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SM47LHuP;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B85606A695
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91B85606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SM47LHuP
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso4609209f8f.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781924; x=1796386724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnn/mFpoR7L3dnATqzoKoqtIs3zKchqzDBWjzMLVr8g=;
        b=SM47LHuPhTeAXndjkqj6zx/iIGjRZu9YMHQ/bxgxsXVsjd93y1tAIlNTKJ+2FJ3KRo
         lgcnesAPP/2v8JH9utitM8SbbIyYjSHjGjCqG4Eg8WRhJ/KwRBAVFqh4spWziDMtXsZL
         SQIn+woZGCT70hnYh7SLvDhdl/WOcV3HeEtvW/C4mgl3bQDaVXFpbFjQ6NYDVUiCU9F4
         4cyeqOboJoFqvia7EUA2pNJs7ed76fW0wjqjLxWnEWVi5ruNhD8JM/5muIKqmjG6fUFP
         0fEaVhfPfi4naerv+cwwg1wa/NLwQtuPpok7AyyGNxOI5KwijvnmPzK04kkBNaZx15E/
         flVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781924; x=1796386724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nnn/mFpoR7L3dnATqzoKoqtIs3zKchqzDBWjzMLVr8g=;
        b=vK0rxllqxsRrecYPI9rum/3D7F9M5agbdsdYXqd7pcsgi+57hXRlpFILI5ArWy0lSk
         10TR1ZtLmPhpGMUUHsgQZZjq1ZN1MjHoeIP6aXSAy9mfg6p/O/C/Zs/W8G5hGvG55HJo
         nMONkzTlrMAGwKO3PT7eAdXAfINC5LSJg7q6zfol6n+l7Lp+K3Q2gHYGdCmERTpcpB5A
         RsRS9MvBIbBoKn4Us16ETFegCtVdoOwwZ/XE/wRy+lG2WymagIp5ZrXwOzSRVroNXQAW
         lFVFk8/fo4/aq9ZkZOHFcGrXYlWcV9gV3SXy732duDJG0ja/+lHumgGv7cgaY5wKN1HD
         mqZw==
X-Forwarded-Encrypted: i=1; AL+hErFmQsrFYiCofA/wOKV47zhWSnxXa11K193Q/exfSV7rH8Um9jpwH39IDgESjgk5afOxt04EyM/+7rHC@vger.kernel.org
X-Gm-Message-State: APuU4Z9IVLnJemDGc4eV3f1qz939H50uFWa1jc0EMO/xsx+2h5thEZbR
	PXo5M7AuBSKTqO7KGu81Lrzf63727jD1yB/fTQuyNi5T86mf3dQype856CDKKVRJkB0=
X-Gm-Gg: AZFdTZdbE1t6/AyW93nyUj7opsuyDVvNtIKnJDlZCb2s5PP+pY+h8V8XRcnDG7xT4x+
	4BBSyUs22v5jTEYC/zYKa0ckDIj/elBJDS4R6+CJrBpgyqcY1JTdI3a42BJ0ayWY1RS4p6cXARE
	A7Ek2VNbjXrzP1Znc4F7AM87cspSFqdFqo933Q+Z4VcCPugnocHeu3k3O1sGn5YHk1hqvvcRe92
	D2iHj8rpfqL9PXMCd2grmKmVP8E+LGDOnBbnaiUGe0BV7jj2gKX0MjjAnvz9g1szhMsI7+RcsGQ
	nf0HvwEvGR8cDeBHJOPG6neUiv4P3vkxWDh0gPzxsTPwUYu038qY/H8D+Xe1PqtPcHwiXoIRmMq
	GQb1Bc1jyEo11zvooL6gv3lcWb2hhX0JoK0tU1ylpa9uGaIn6VKft2tpC4uahP7yp7RhiVse3kW
	Bf2aec6FwCKHgNAEA85YUt4o2lqYTjjl4/rJPeuoe65uXQ+Z8KUUcehPSs1GIsdbFh8MEVk74mn
	kKDrGWhVS0g/04pVCRBvWd8mZ5lkR3zVTf2Nta7BcE+h32u5e2O66MdoCmRk1DGFj40Gs6ZhFUK
	kFxqQHdiRlIR1103RGkY8HASX+Ew
X-Received: by 2002:a5d:64c9:0:b0:4a6:bc53:2478 with SMTP id ffacd0b85a97d-4abb0d5256fmr47792743f8f.13.1795781923925;
        Fri, 27 Nov 2026 04:18:43 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm47786781f8f.13.2026.11.27.04.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:43 -0800 (PST)
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
Subject: [PATCH v4 02/28] dt-bindings: dma: brcm,bcm2835-dma: Document the flags of the DREQ cell
Date: Fri, 27 Nov 2026 13:21:52 +0100
Message-ID: <20261127122236.4976-3-andrea.porta@suse.com>
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

The single specifier cell is not limited to the DREQ number: the upper
bits carry per-channel flags (AXI priorities, wide accesses, burst and
write-response handling), which the downstream Raspberry Pi device trees
have been using for years and which the driver is going to support.

Document the meaning of those bits and add a header defining them, so
that device trees do not need to open code them.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/dma/brcm,bcm2835-dma.yaml        | 13 ++++++++-
 include/dt-bindings/dma/brcm,bcm2835-dma.h    | 27 +++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/dma/brcm,bcm2835-dma.h

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index c9b9a5490826..f81740e49301 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -37,7 +37,18 @@ properties:
     maxItems: 16
 
   '#dma-cells':
-    description: The single cell represents the DREQ number.
+    description: |
+      The single cell contains the DREQ number in bits 0-4, optionally
+      combined with the following per-channel flags, which are defined in
+      include/dt-bindings/dma/brcm,bcm2835-dma.h:
+        bits 16-19: AXI priority
+        bits 20-23: AXI panic priority
+        bit 24: use wide (128-bit) source reads
+        bit 25: use wide (128-bit) destination writes
+        bit 27: do not wait for AXI write responses
+        bit 28: wait for outstanding writes before signalling completion
+        bit 29: do not pause the channel when the debug signal is asserted
+        bit 30: use multi-beat bursts
     const: 1
 
   brcm,dma-channel-mask:
diff --git a/include/dt-bindings/dma/brcm,bcm2835-dma.h b/include/dt-bindings/dma/brcm,bcm2835-dma.h
new file mode 100644
index 000000000000..ace34c32a860
--- /dev/null
+++ b/include/dt-bindings/dma/brcm,bcm2835-dma.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Flags of the DMA specifier of the BCM2835 DMA controller. They are ORed
+ * with the DREQ number in the single cell of the specifier.
+ */
+
+#ifndef _DT_BINDINGS_DMA_BRCM_BCM2835_DMA_H
+#define _DT_BINDINGS_DMA_BRCM_BCM2835_DMA_H
+
+/* AXI priority (0-15) of the channel */
+#define BCM2835_DMA_FLAG_PRIORITY(x)		(((x) & 0xf) << 16)
+/* AXI panic priority (0-15) of the channel */
+#define BCM2835_DMA_FLAG_PANIC_PRIORITY(x)	(((x) & 0xf) << 20)
+/* Use wide (128-bit) source reads */
+#define BCM2835_DMA_FLAG_WIDE_SOURCE		(1 << 24)
+/* Use wide (128-bit) destination writes */
+#define BCM2835_DMA_FLAG_WIDE_DEST		(1 << 25)
+/* Do not wait for the AXI write responses */
+#define BCM2835_DMA_FLAG_NO_WAIT_RESP		(1 << 27)
+/* Wait for the outstanding writes before signalling completion */
+#define BCM2835_DMA_FLAG_WAIT_FOR_WRITES	(1 << 28)
+/* Do not pause the channel when the debug signal is asserted */
+#define BCM2835_DMA_FLAG_DIS_DEBUG		(1 << 29)
+/* Use multi-beat bursts */
+#define BCM2835_DMA_FLAG_BURST			(1 << 30)
+
+#endif /* _DT_BINDINGS_DMA_BRCM_BCM2835_DMA_H */
-- 
2.51.0

