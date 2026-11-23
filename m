Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445623;
	b=ptxaMmbqQblMhwJ9zxm+x8CA9Pq8UxKJrFK6XgHrxtPLsQ9+Nj3u6ZwsazYwMovjoazH
	 TYnvIUAPbyF0gcArKcoQouoQgqMAXF16zKsZIkkvHH0IkLhFNfps8kOS640nDY7INhSM6
	 97/nsJB0AsDAmMU/2m/ctg8dSdqkydy19fWePLVZB+hD8yUyVJp/1BbDPxrxa/EUtfbBl
	 F+jtvAR4L+XEJqoAZsVtE+6YXJB2kMVMk56F+wI/BPOITvug9/sUlCG+mCCSrqA+2nF/v
	 lz23Pegcf2fc8URDGe/9tus9zmKU7/8MrbalMl2Rg7Qq8H8Dlnu/CEYs9kkAdpaQZ/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/H68XX0nc4DQMcp3IW1hnsD4xLPw1PDfZHd0l5DhZUM=;
	b=i0HLrERlYebIr6oGlXeY6dbLrf+UFea3UUm/vu8QIa9qsZMqMNG8ErP7//Xplp2bZqS5
	 KuI1ffh7u5YA7Vz5PirAusFuM0S56Z7ZiWVYUjeTp+Fmz+MUgghdbQa/6tVzyQFf2MFmZ
	 RTjUPqIL9QK75dQb2sasTesJopcxP/9y8xfgtDESSf5foIn8ABOSDwxj2qy0lYmeoJFLK
	 jCrNZ2bJKkcR+teoinwkn42zI7BXZMMeQwCPhPZmuAnoyyHB6JrI7iHEaeVKJ1tT7kfQ6
	 fnG9XrQffOqTkZ5tkqphYPnIIQeGZw2RmrVIfo8ECPEkdkemD48WQrUxzq2QqDNZcJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZnUczZGc;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA93606A692
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AA93606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZnUczZGc
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso31397795e9.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445621; x=1796050421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/H68XX0nc4DQMcp3IW1hnsD4xLPw1PDfZHd0l5DhZUM=;
        b=ZnUczZGce39WuLbA6SN2SJVn8NtyCeWSFRGoi71yGwH5CFHJAmI9skg+ZpHMMCs482
         WtoA2CviYyBJsEViW2o0/5gO9pPNI+uosQ+aBRug2FpcMlHO/PwdC/FuzSvKln40+eEq
         th5LtGwkkLXfXkK1eDhkaEZR75OFe483bxBd444Sc4CS0MBdgpAZkZHK15lCKchG2cGE
         04NgawBhYWp9EdxDPIHgxazeEYCGHs9jAaGnZ9SHUK3r3HEDqo466oztVBAsyQJ7tzFv
         Y7cnhytK27MgwaNkmUZiv3nztGhAzKAxdWRhfd8ieX0CV1vkkZYZG5E8sNKG/rN59RjZ
         W5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445621; x=1796050421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/H68XX0nc4DQMcp3IW1hnsD4xLPw1PDfZHd0l5DhZUM=;
        b=aDyA9VAfhnbt3WWUNAsaVWu4VF9LtcFHiLm2KLu0L9hk+FK6D1e4LJOobQmVZqEt6M
         RvqCxUr9Q7hqbJ/cDs5DzQ2zRsNIBMD6BSiRO7iQObGpbkmEBA0DWIuXIfnU6YmfVwYm
         t2STApwk5ZPB1XPXMTL9/hCDUW71uxzVPSche5hwrSeVfx5IqefQd81f0V13Uf5CbuUV
         2ryUb+GuL7HCpE83v1jpjJY+kQEedUyQAt3ErTDQ5V6qlK7NFHvdUKkQPe3107OgS69f
         +ue644pzS4hL2FUgWBZsRIkpJ4AacMQ22bjrmRmpdBleY8ir6QK6QlPLmks0okEGx93o
         QRJg==
X-Forwarded-Encrypted: i=1; AL+hErGS+pR/aw43PxgZ0mJrY41LEvDDCs/Ivi0K6OtO4Vi9yliicpinBNK6B90Gw35sZqnn8Rexj0BrYFtF@vger.kernel.org
X-Gm-Message-State: APuU4Z8cllMTGgY5q8zRC6PNgWZRjDjIhiUQjL8bREmO/Bf1/X2BXiDK
	/uX+1BoWkDoinTwvip2rJ4gCGikPPVnWhD6kECVaWMu8LWEfmly11sMdaAalZLT6QC8=
X-Gm-Gg: AZFdTZf0KSVRdwZDjH9FA/WX+6i0Iwczg119dHhmB9JKcpwtrUODKw9UddHTPEmfThm
	7YFjuZjEfJkJ3jB+ipHjtFGeXnLvEFmrdCIE6BCly3nwhhzgLKAKb5PtA3dblz+eV3tlgRP0430
	Ehfgw+EiyL2+Qh3Qd82ia43RSbNquAd+dKDI2vp7s3EDGMgPj7bvqatdtvMrwZWBhcP9XLTWdfy
	3/m1d9X3cnk5qC1Ut7X/OUD9Eze6RyZ8vy3L1ACR/BeV8rcYBG7SPumiwQ1myOZh152W3WJC1v4
	rJ4HzbvC9+B4/POaGk/U8bHEj4eXIf2kMoFtABlrEWH6JDfQKEptx4UmQdVvfv916UsWyk+riKQ
	3RFDpXtWd6NmRkUEaxKu5Hfx1JR++bnlBxm35SRPso2l/INHM8X1DMPAscqAg8nM5Z6DThpeF45
	aggWIFm6PoxCZuYTl+41nrlRVFhgStTO0aQNKhNa3QQE32rK9i+uJXkPilx1/jj4HkvkxVxLF7J
	aj1WmhWVmT9n9pEO+DH2EewtYfeBTaXb4fAWPoex+rkEtEAg17FGgobi3bcm0fEcesquUbl2iK0
	1MzXEYkbGPo8YzoGgt7tV9CbGR4=
X-Received: by 2002:a05:600d:1c:b0:4bb:685e:cc41 with SMTP id 5b1f17b1804b1-4bb8c526ac4mr199511415e9.8.1795445621520;
        Mon, 23 Nov 2026 06:53:41 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm173289665e9.3.2026.11.23.06.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:40 -0800 (PST)
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
Subject: [PATCH v3 06/28] dt-bindings: dma: brcm,bcm2835-dma: Document dma-channel-mask and DREQ flags
Date: Mon, 23 Nov 2026 15:56:44 +0100
Message-ID: <20261123145728.29082-7-andrea.porta@suse.com>
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

The available channels are currently described by the vendor specific
brcm,dma-channel-mask property, while the generic dma-channel-mask
property from dma-common.yaml carries exactly the same information.
Allow the generic property and mark the vendor one as deprecated,
requiring at least one of them, so that device trees can provide both
for compatibility with older kernels.

The single specifier cell is also not limited to the DREQ number: the
driver interprets some of the upper bits as per-channel flags (AXI
priorities, wide accesses, burst and write-response handling). Document
the meaning of those bits.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/dma/brcm,bcm2835-dma.yaml        | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index c9b9a5490826..f619e395cf0d 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -37,15 +37,30 @@ properties:
     maxItems: 16
 
   '#dma-cells':
-    description: The single cell represents the DREQ number.
+    description: |
+      The single cell contains the DREQ number in bits 0-4, optionally
+      combined with the following per-channel flags:
+        bits 16-19: AXI priority
+        bits 20-23: AXI panic priority
+        bit 24: use wide (128-bit) source reads
+        bit 25: use wide (128-bit) destination writes
+        bit 27: do not wait for AXI write responses
+        bit 28: wait for outstanding writes before signalling completion
+        bit 29: do not pause the channel when the debug signal is asserted
+        bit 30: use multi-beat bursts
     const: 1
 
+  dma-channel-mask:
+    maxItems: 1
+
   brcm,dma-channel-mask:
     $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
     description:
       Bitmask of available DMA channels in ascending order that are
       not reserved by firmware and are available to the
       kernel. i.e. first channel corresponds to LSB.
+      Use the generic dma-channel-mask property instead.
 
 unevaluatedProperties: false
 
@@ -54,7 +69,12 @@ required:
   - reg
   - interrupts
   - "#dma-cells"
-  - brcm,dma-channel-mask
+
+anyOf:
+  - required:
+      - dma-channel-mask
+  - required:
+      - brcm,dma-channel-mask
 
 examples:
   - |
@@ -96,7 +116,7 @@ examples:
                         "dma14",
                         "dma-shared-all";
         #dma-cells = <1>;
-        brcm,dma-channel-mask = <0x7f35>;
+        dma-channel-mask = <0x7f35>;
     };
 
 ...
-- 
2.51.0

