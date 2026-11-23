Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445643;
	b=SbIbhQBwXL8nhc04X5/nyFZCFl/uoJYc0gPhSzMlb/tSMfeMqRcpNF/66ipzx80XMjAQ
	 mTTMw6iXu3cfvjfPTKEHh8EYN8I/944MAWkIFXNJyFw8tKa85G5r1ObKLSGFO+HyBhCRU
	 dfKPyCFXTeFxEUvhiI2qzsiFBmLbY0zelghus3oCHVFBDMXTCBiot6i4GQumS34b8Vivn
	 1kjNhHPwBZgvr6Y5VtJ6pNX0ZS8uZ+MhzEc0X/Iq76RO282ZBgK3FvfgjDmjE3aZLSqsM
	 ewozrIFczDm4Ln482K8YEsDGusNULhmFapKnn1jejk/lC2jiiIZ1MPVtpt5kGyC2HXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2ojavuWL7IswiT9p/75gc6DxtN1C14kg/yxfkQH6rLY=;
	b=OfDOtlBej3IagKEEPrzHfv9WVrCJLb+ySPZ9k11vQXeCsm7RJ61vBZA+TBRmG79IYGan
	 ebpMG6FtMZwq5FAdOkE4PMiXAUbGfMY38A6Jok1uaVgQZDPpFyfPucB67cLFkmFJpKwZL
	 KIFTkHlJINBON6feOyC0D/bF2oF6oTntCgHuBYNIzzktGcMgyOUjiOkNJD4NUwyVU9+3Q
	 ow4yuysMIeCU01UuDqCsGo5nUdZUQKNWlg6o6g4oaEkOzQuTzQPwtZy/df5rgrZ1uH/B7
	 uSaXe2wFG15WJ6/xT/yoB5C/z5HLSN51EJSbOeQtykk+yu5gpcWdNnj5RzowdlRQvxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=g77FX1do;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AE8606C1A9
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64AE8606C1A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=g77FX1do
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2762983f8f.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445642; x=1796050442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ojavuWL7IswiT9p/75gc6DxtN1C14kg/yxfkQH6rLY=;
        b=g77FX1dofGNAbQCzLkV0oWFpCzG9twT+vmYldF/KZ31YTTHjq8FiANr6UygbxVzgVC
         ob/k6JCn2z/t9CoAjeTx9EI4u3nsyv0rRqgY8CuK1LupvIu09qzcNKgtT35OZXLqSuv2
         NTTdu7o7B5OKVftBcY2yskHYNrO0VdZVu2nvjnOJDLrLBy/FeZGO+ET4/TPArXADyJeP
         ArZkCwELVQP5u4fHLYb302TPDJ5TM5T8XOd8/IuD7SCOte2lgEKn2vm0qcsmYhixGYaa
         VNhVWxfcex07ZYMvBgtkQpXmwXgiMFteHq07UvO/llr11roOWfc6BpWbyC0rHeC7pjhL
         lnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445642; x=1796050442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ojavuWL7IswiT9p/75gc6DxtN1C14kg/yxfkQH6rLY=;
        b=aPKjyIOxxedNB4eD11jzdeYs73GgVLWwhxtDAdU2FFt9Gw7jbNnmgOYNL4nc36zx2c
         g/G2kfmtx1auwnFtYUvZmj3vls2cUj4AsYSsRKf84b0uvYDy21VRhv4oaHOzocEyeimz
         xpOF0afsAEdoAg0E0ewX70qna/JyRwijyWqoVOvvF0s/9syrkWNoaOjQCjiIiUSXNLhO
         mch9EBBoQh/idb8CBRAW+4l969LIIO/1SiRIn8X60apwG+MR/D24BssozNfSscxCaWeP
         1EANBRF5YSPBtqQ9cucQXv3Q6YhbrWdg7v8A2aJxn0RgyZTDxs8dVsxQRrdIQ8IWytt8
         VWww==
X-Forwarded-Encrypted: i=1; AL+hErG2jmvMQzVIe2bgit/peoeIzvoId/slVYwPKtGBEGrXvVX/yV3xmEHusBSf/Z5bC5eX/wOUxYNRJl0Z@vger.kernel.org
X-Gm-Message-State: APuU4Z+3Y8ViVlH9lsycIP1IYGQmam4c9rnEJh8vt0BKAZdSP4Uem5qv
	FIYeyWoMHBlHkEiEDgJpMAt+MTJxMsQ1iTsDub6oMPmYeTQHJmoMU9W8JepwaS04Xzo=
X-Gm-Gg: AZFdTZewYSWF2NU9t5LIYcbZ5Te3VBIPms+NBy4qd2f2La64GFw7jIV14sN7kpLActF
	V4kcvX7OVXPDqdD1i2D1et5QxuMz6sGjAM02UuVWNpESoLZtIMJ49NdGoS7ZECmvJf06qwMMmRj
	Wid+SGxe7EXmXpSWvwGmQmgQblqeHSxyA24LKHE3n6B8ytgSSJXBlZuR+jQLrmtlbBaQYFQttpv
	camAu84gYCQC21c0kY7cNi42hqAfF53cE0txUQcUUdFuCNstwHAba7S2B/mqy+XHE4J0AWpmeFv
	cd6Xmx/ATRuf9/6RMewSxH4iCHup+YUWLrAJ//PFveHPVLhRhsjtbkmIbN96wh8/WuqZLY1BP2/
	kIhSSDbAxh/xmuqOL86cOF3ClJrmz2kPmSk4i8nUR1Th48TkNo7OP3lWmmFiKZJYoO4OXyjFKuE
	9J3WR7mqbaA/btA6xp0ZrlEc/2t3Ud3Wnp46mzThtb19o2CcNFchToWUKndGFkxL0CbqY7k66hN
	ykjwiiwG+7Uxmr47QkC+sHyaGW2/F1M++xCfm8yYyO0qsBd6Whohq8q9Ci6sn++g8uWpjy8zHrS
	Sfi1SBNv9QMHpHVLXmINa+U1qRI=
X-Received: by 2002:adf:e886:0:b0:48e:3ebc:d242 with SMTP id ffacd0b85a97d-4abb2dda339mr17523667f8f.37.1795445641765;
        Mon, 23 Nov 2026 06:54:01 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm26379033f8f.21.2026.11.23.06.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:01 -0800 (PST)
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
Subject: [PATCH v3 21/28] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 40-bit DMA
Date: Mon, 23 Nov 2026 15:56:59 +0100
Message-ID: <20261123145728.29082-22-andrea.porta@suse.com>
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
index f619e395cf0d..b53652d5146b 100644
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
@@ -119,4 +144,22 @@ examples:
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

