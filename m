Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781957;
	b=jKmwkOEeo49otfMU3m1pcHKGT0TUC/XrphDqoilKbMWZmp4+L9wBBLrCGcnkuhd468fP
	 qK/wq/t8R7+FR+KXoS/fcaDxvSv0l+ayFcwdFmHycw8Hl3hCfcTLHB7ZBwShn+9KgvCBT
	 g2Dn0XNo7wmRIXu3Mas5y1ledDMmvRWYt4WfN5xtgCZgnsQgg12s/1HbBpv0SnblkUCQd
	 iBJ6cn4YIBIB7hvdBCbPMBwOxSZEdcQHCBpKumN8u3stTVlBmRJpwJZ6W9gIzc/gbBu8m
	 fwd1lA46ogHWqLt+hEgOpiD2OYKY7vr8BhS3mKgDMSiX31Gorr/SH2RhtvkXvVgdYfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qmoiYjlPD+Xn2b6TFwZys1qhd0znVC5RxZEyMOw5DJU=;
	b=kxojRbLqmO01AvMPG7POGksTl6GgcdgKfgv6ogNooGZ1aV/eYWxdJqbAYHM/AOUceF9e
	 SRkiWUlOjsHRmO0BkVtadEicjXuXbTn1Jah9+IZC3bkO1IiCuGO/TURMYm9DE54ZvBf80
	 YzYh+OK8BzkPqDhybMauR1XyEgu8ImvdALUxjTG/1fp7pHi3D0eJZbsWhs33v8nKq1ll5
	 CIpGIsSLlf6k3erlp8V38+ZljMlOtt3tOlYq6k1Q/vvpyJ8CJlLw9x/Lc8ROFqefdtLbW
	 n2Vm4/H6BcGNQtmMMU0dD/PCPzzGsGToQDMTxmqhYuWekN/Y18ynVXiXXVOl/DRz71g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="Uab/npfa";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CBD606B82C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9CBD606B82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Uab/npfa
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so65744785e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781955; x=1796386755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmoiYjlPD+Xn2b6TFwZys1qhd0znVC5RxZEyMOw5DJU=;
        b=Uab/npfaAoMERFdLfsRHfMv3D5m93m5Z89zlLOvN9XGRJC00fHgYA4zUAlSvfXPj9V
         2vhJ8kj7KeIQLhpY33KuL2N4AB6FFUSx1Km4kTfwZiuSFoFLRGt62qXBDXECiYrycHSm
         7DsraX4S/HLVemJvM4Z04y6mHbSM2aP8N4qlaRardBRn5fP+16/wHW4elcrq0Yh9WIAe
         oFouu7oGno3RXlYVur2Vz9FRuGGuB6LpoC06IoEddumwCB0Rq01kajUL5LfGu4CPIUZG
         AwatjhOBNbc+nqTweOiBZnxMGyj8LbXEiSFGArP9DFiLZAKaclmrUl4LMHIobozmZop/
         c4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781955; x=1796386755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qmoiYjlPD+Xn2b6TFwZys1qhd0znVC5RxZEyMOw5DJU=;
        b=Zf8DXBiY4WSqXZKid9QPrRQcqppuv4TUolzFtfjk6ztZ4Kck6246NhJWpPN54lx4e7
         OxmrvKERoxaw49FpqEIJQHD0d121JodE9eVjgw29+FlEIbgkULlDl8r902WsbvPFh0to
         W33BbxSYAC2s8nb+Hxa9Y9aT7AzsawukvN6lpLFh60PqjoW6dQ7KZRvuZHKc7gIM0+dB
         zfzc93id9fUiemiL7PKgHNOSp89SC2gChtYZzN0C3Cqek29akHEEAfCpNzwGhyK0GFQm
         hIYGR/yQG4hlpmdWbhg4idzgVCFCVCzhKyFIN1i9YBbjhBl1RwH+kYNv/YD4E7hDlT0l
         pOAg==
X-Forwarded-Encrypted: i=1; AL+hErGH7/jPIFCdKxbJBNmo8FZodwqtTbSc8uS0FWvuVmdEw0weN83NEYFjLBDoCzSfq/iOF68gd70fBjKg@vger.kernel.org
X-Gm-Message-State: APuU4Z8J/q1L59FmRpv5YyocLLxRDVyoc1qYfHDw+NCrQ9Yc2b4xEbcr
	rYZhqhN5kAD35CJR1XHwytfvN48oINkL3lqFMmZYH6EfGZET9623hHqelgYsoxyIrV0=
X-Gm-Gg: AZFdTZdmTGeeZ67+6+5qiVhvtqLHUDUUyfuG8uBceqyj7IatymJTxK7BRjTaYedEgwc
	iNA2TgEQZ4xd3PWmU5Pl1a+5NYUcfqlA9ue5jOrrHbwiFsoaqvAaJr4vVCT54e+3UTwFhA/40hZ
	YerfLpjfy1tKDLicmN7zsgHozZbCL9GTFfVbPqMlLzHqfdfA74d+uxKvI9Cvwij0BDUnw+4Mqdy
	lPQV34sL9iodxOlIAn4gJFCfW4Qa0hB+3nTlg/S0e3mE6bNQ98kI1DxhoB0zKOcWN8dKUugoCso
	di6Oo7IZsgWhPP7xgF47aLlJhHz9OeVC+4O5Czib6VWFiUCvUHTwWtzt2rjdEX3OG8ajCtXCGDz
	h+8jzh4tFID4squZnrBxQBmPtdc47C3hWQZHekhpxzeMGo9GVx7G8zpGPJ5zuLrgTV1X/N6hLHz
	unB5YK9ktwqz0pErPOJIfoTzM1SvAbutAy8k+DiAM0l01QtjXfKsecwt8okJLLoNtI+y70uvzjB
	L9txAANZD6MR2osRY9furdTGfAEf5JcoRaJ14lqw9BnoTAkU0uda1ZOwGToSEFArLxmWwbFdeRd
	mezHUpO9M8i90iI8u2gF+GKzHc1ZQpDXXL7ZG/JoZl8oS3TgxA==
X-Received: by 2002:a05:600c:638e:b0:4bb:6c5e:b006 with SMTP id 5b1f17b1804b1-4bb887e265fmr462247745e9.3.1795781955134;
        Fri, 27 Nov 2026 04:19:15 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm623847775e9.1.2026.11.27.04.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:14 -0800 (PST)
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
Subject: [PATCH v4 24/28] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2712 40-bit DMA
Date: Fri, 27 Nov 2026 13:22:14 +0100
Message-ID: <20261127122236.4976-25-andrea.porta@suse.com>
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

BCM2712 has six DMA channels (6 to 11) with the same 40-bit programming
model as the BCM2711 ones, each with a dedicated interrupt. Add a
compatible for them.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/dma/brcm,bcm2835-dma.yaml          | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index d4a7001d6f97..e844fea55fb4 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -17,7 +17,8 @@ description: |
 
   On BCM2711 the channels 11 to 14 of the same DMA block have a different
   programming model, which allows them to address 40 bits, and are described
-  by a separate node.
+  by a separate node. BCM2712 has six channels with the same programming
+  model, numbered from 6 to 11.
 
   The channel numbers used in the channel mask and in the interrupt names
   always refer to the whole DMA block, also when a node only describes some
@@ -38,11 +39,25 @@ allOf:
           maxItems: 4
       required:
         - interrupt-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2712-dma
+    then:
+      properties:
+        interrupts:
+          maxItems: 6
+        interrupt-names:
+          maxItems: 6
+      required:
+        - interrupt-names
 
 properties:
   compatible:
     enum:
       - brcm,bcm2711-dma
+      - brcm,bcm2712-dma
       - brcm,bcm2835-dma
 
   reg:
-- 
2.51.0

