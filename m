Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781953;
	b=powzI17+DmuzWUoVjl6h6prZwowPJG5HChGRr2jOmMsEgaomLD3gSkyzTC8J0uvo9w1A
	 ApOOviB7YO4swwlvzbYFeA1quFPXyEkHQ5edNcTbRITWVUkEzSMRZXg1TUmctZ0TBJS5D
	 oTXwOC1uq4K/px4P6W+nOwzxZmSpGxwaEtt1BrPrexVvx6vulCX916Zdz+7rUy8LNMRQT
	 hCiR4g0oj4fyIij5fMTT4eeHQkAFj0n+YN7O96AAEaLhzRNqd8jOZZmzHFwQ3+dajHW4N
	 ZK71NdaFU/OuxUok3RwbW72/7lm4gDRUj1ok8xMdNzDMMuWWMEhPjCySIL0B38GPmFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R3AnFPOxgAgx5s9ofy+ghKg7a/HyXXQSnc09fl1YVw8=;
	b=cnho4JJjt64p/Lf9S7Y6lVz8UxxNhHMLld9fm+GvxQ4WbTAA9lxkXz/uklOBsF/9p+af
	 BV9+ary8ungwUu+diiPt4L02re9CZtdqfzy1enay/kssWPVFtjsw3lymK63b0U4QZrq4W
	 dM0+oME0JxYXoS4O+Rw7QxZb5zYowVawqtBQV5SzWSDugF/8hCkwxsMlo5B4JZd7kBov/
	 OXdC6+bZdADrWlHKnTqmCfJwaq4Wuy1Oz+stlRt+yV23fK32T/pPobKyWVwTZaM9fc9D1
	 +jHykuUdD7mUQytcZJJVBGG8HCftWYkG0usMOlUlbmzZMRRAqdNaAWJxSsDoP2OdlcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="HtDJMx0/";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21817606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21817606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HtDJMx0/
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b467581b98so77467895e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781951; x=1796386751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3AnFPOxgAgx5s9ofy+ghKg7a/HyXXQSnc09fl1YVw8=;
        b=HtDJMx0//Ztf2mzoZz95DmiOpLMxYRts4sLL3SwarcjnV78nqWfuYjTJQg5TnS9aaE
         jsWsoEYKD7l+serS9ZgtXbhj4UBCI/haitQDZmwhu7DkpgdG6lEynM+ueKEaEya4jmMf
         RVOZ1CA6128q+uZfcfdJUysvqE684zpkHTzzg0A7m61t7xa5aEpIJ6CBczpS1ttvE70E
         t1SY88ATW3AAEHiIG3NEliyEJo3THf9pOdalkk29ZXe50atSLuS1qQkagDA5kxTg3dH1
         Ic/q/P1Gbs1oWbA//uJSsTcyiTiFFxE6pePcfo5Xsv27cbnz4XoZXO+WPAGzhw0eoKAg
         ZpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781951; x=1796386751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R3AnFPOxgAgx5s9ofy+ghKg7a/HyXXQSnc09fl1YVw8=;
        b=i0zxcp4t4k9qdyGEHAYMqVFOWb84wWC56QRDbJJPn+pFYLsAdITjQeXnqmkwPcFOzE
         T3ZRkhegX10nl5Ve/+FFVJgp4Um9WTXgDHS6oIo00TOBvrBGoBWOVykcx+Q/NQACQfT+
         neRseRVF4GpNEiGq7+TOmdcmX9IHhUQNnwVjuYKKUl8I/wtcbPtAS8rVDO+jqIEJhIfB
         U5USCx9Jqhc5bhzCt3co3gxpdNy1A2BSQhZAcyrjV20TLrA380CoJnLvwawho16BGT4A
         JkfQMJE//0QTkLdDuiozg8dO0q5HbnpjOruRuXgahBKJiTamCyUriO/aOb9y47avdmsW
         NEHw==
X-Forwarded-Encrypted: i=1; AL+hErGPFfU6kQr1Q5WZKtjqCC2ocOnPSSTIYVvIabNkLfJixJgXOGrpnxuivKCOPVjMUoEkdKCLg4Wz+DJU@vger.kernel.org
X-Gm-Message-State: APuU4Z/VYGCF+SSFdQaRpqNLg5eQRjttnMkBOwy9PlIdk1XuFeC4WOyE
	rqTvGRpPU38jWwFfuqChqaAxSqahzGDDTI5TVMPdegabjDjTv0n2ZTDuZn9MnbCbCRQ=
X-Gm-Gg: AZFdTZetaoMBtc64nnOW38OB7IK1YEl5C5ORAq0oUEqUN+wZFWsNP7FY0UP6Aw5xvKw
	Ezkft1R02z2U/kEKQLs94e5gNP6mX7n24zX79g/Hk4apapBLkkHoVw18OoRWC7fMuUoh0y9z0w9
	02fFS7WFclNIHpltOdSUGgs1FYNRW+UlHJGbD8/iotqEx3jam+ZVSjcQ21P0PXwSK//vPOn4Jfs
	8HzTNqel50EVWww25ikeENgZMZJmGG7tFBX92GGQstfenpLUM0JkrmyUJ1b2PXdHZiZn5pgzbdj
	jTvJ5mfjtx1QmKpPX4oepCOYxvlhbyMgVEZyP4KQOxa5mOqAUG9hBtKwi7mqLOXGsg5h3IPelaL
	00X7JRkApM9NXWq4DdLevZVuAt6EzA+pwvpgvh0rIx2CQzCXHxD3mfGDuJWZxIJVeLy76wkhOTk
	A5nK1datbwS9pdqV86gf4sBrohcSk2urrWOhmmzo95Fc7hYum2r8OBF5rXGkmRaL0/xFkNrPH8T
	CZilN3unVSR43NmFOVJUJ3vASAXeRrnr4XbDqF5w5Wd76C6wCWzXe9Z8YCD+5jkOTtoU1MdQWk+
	1IJ5TQ2BoOuT+1TeXVef8C1kTGAV
X-Received: by 2002:a05:600c:a08b:b0:4bb:6651:9eda with SMTP id 5b1f17b1804b1-4bb88922ca4mr460860355e9.14.1795781951466;
        Fri, 27 Nov 2026 04:19:11 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm753770715e9.14.2026.11.27.04.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:11 -0800 (PST)
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
Subject: [PATCH v4 21/28] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 40-bit DMA
Date: Fri, 27 Nov 2026 13:22:11 +0100
Message-ID: <20261127122236.4976-22-andrea.porta@suse.com>
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

On BCM2711 the last four channels of the DMA block (11 to 14) have a
different programming model allowing them to address 40 bits, and are
described by a separate node with their own compatible. Each of them
has a dedicated interrupt.

Constrain the interrupt names, whose numbering refers to the whole DMA
block also for nodes describing a subset of the channels, and require
them for the new compatible.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/dma/brcm,bcm2835-dma.yaml        | 47 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index 51ad8bc33d5b..d4a7001d6f97 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -9,18 +9,41 @@ title: BCM2835 DMA controller
 maintainers:
   - Nicolas Saenz Julienne <nsaenz@kernel.org>
 
-description:
+description: |
   The BCM2835 DMA controller has 16 channels in total. Only the lower
   13 channels have an associated IRQ. Some arbitrary channels are used by the
   VideoCore firmware (1,3,6,7 in the current firmware version). The channels
   0, 2 and 3 have special functionality and should not be used by the driver.
 
+  On BCM2711 the channels 11 to 14 of the same DMA block have a different
+  programming model, which allows them to address 40 bits, and are described
+  by a separate node.
+
+  The channel numbers used in the channel mask and in the interrupt names
+  always refer to the whole DMA block, also when a node only describes some
+  of its channels.
+
 allOf:
   - $ref: dma-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2711-dma
+    then:
+      properties:
+        interrupts:
+          maxItems: 4
+        interrupt-names:
+          maxItems: 4
+      required:
+        - interrupt-names
 
 properties:
   compatible:
-    const: brcm,bcm2835-dma
+    enum:
+      - brcm,bcm2711-dma
+      - brcm,bcm2835-dma
 
   reg:
     maxItems: 1
@@ -35,6 +58,8 @@ properties:
   interrupt-names:
     minItems: 1
     maxItems: 16
+    items:
+      pattern: "^dma([0-9]|1[0-4]|-shared-all)$"
 
   '#dma-cells':
     description: |
@@ -120,4 +145,22 @@ examples:
         dma-channel-mask = <0x7f35>;
     };
 
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dma-controller@7e007b00 {
+      compatible = "brcm,bcm2711-dma";
+      reg = <0x7e007b00 0x400>;
+      interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "dma11",
+                        "dma12",
+                        "dma13",
+                        "dma14";
+      #dma-cells = <1>;
+      dma-channel-mask = <0x7000>;
+    };
+
 ...
-- 
2.51.0

