Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445647;
	b=m6tyKKR+zGl3EBrpIssUw/+FNp+bsC01nVT0o7CFsmj+G9h5G8jyHMIGFk1IwS9gD/hy
	 pA0xJZebq3EXgNUeWjPAua6Hf8/xvuIeLJvcNku+TGlgh9TgxQGTJU4BKOMmG6GkAafB/
	 GXdh2kdABxUJlb/3BEf7Ry7s/FACNK52cQ1yWf1muZ/aosy0z1jDB/OfUpxPTRFkipFVh
	 Q+s3CV/rfgFo3k3S9wgWFS1UtSa/Z1XvlmBDwXbclRtX5CA2rkdIwXlCUHhpMaQJK9WhE
	 3uVYIodcHhVOYNTiRc8sel6dAKtz2rwWT4OBeBzdbN5xA2Kgby4ZnaVpfrBxAazXq/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1ORwnkX7J2hOX5n3O1ta3audEQJV0+CKETTB/1+Lf3w=;
	b=bSFwe+53dfkG2wPPPTi5SykGxnd0o6UlyH7rzrzCGPyX7DhkMMYCiPClTl9mMTJDTavT
	 +SHTCv8l1YWUsO5rhUnCbEFbjDL8Z5ZHTBulx35abXKecKhwkBYm67RFPkyJHNKXAwCx7
	 WqCI0KE6uIBf6Vg1kNH1deSLoYJZfGpRBY/ZxmtuHveEn5rG6H+KQ3/KRuiAFs5N/vZaj
	 Jmr5HaK8VbFOiuFezMgdtZhcxWdi5jhTRpdYEBN18GKP9eXaqL/IMCA/+CmIboYTjZX7G
	 0C3lOVcw+qckQchRZyXZou6Tu1F/olWDhH3AhWmRsKvOrjzujCiT8lQXkb/goUWwkaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AdpIuPTA;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26985606A6A9
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26985606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AdpIuPTA
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1776885f8f.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445645; x=1796050445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ORwnkX7J2hOX5n3O1ta3audEQJV0+CKETTB/1+Lf3w=;
        b=AdpIuPTAFtxQYe9e3oALunPMgkqq0WHN1wt9+08FmpsjDYbHHpHxDFFVZwKeqUSpHD
         e/I+U4W9fQQHvYUN+JQNJB+TTjjDdKIhytaLLI1AWvxFsJEW/JBrKoXnrLKKT5LtvCcs
         y6VW0kEllA9NWqHJ8Zp0u0LYHEXKQnel2rSLe7Q0X7JIL9SwB9O4HWjIarn6OXpPXZwq
         DBlLLMXg/pkkHqdBzcwPpNgNojFnkhD3ZwRn0K2N+dLT+xWM0lm1b2ADoOq1dOeAiQ/d
         ayYymBoeLQlJmXNJak6YAbfv/y6eV+Bh8VT7+E/Y4wBMbRV2MX07VIXuNbOz98vmIgqu
         0a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445645; x=1796050445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ORwnkX7J2hOX5n3O1ta3audEQJV0+CKETTB/1+Lf3w=;
        b=WgHYL5RHhxA95zzcpHv4CzZfrblZxqmWLNnL4umVlx63/KiELwMMCqRSPgNyh3XPl4
         3gPHKth8vJsbGmDdgvimBaqH54CC0r42o0k7g9s8WUrglXI2wEHItAYMjniPdYUhHzlr
         4wMdVf4fEs4qtKhlHKEKzKJZRgYL2Sq4x8kiyXdEO+OWbXchaWq6v8bHeumTpYZvEu44
         rAqdEsBMRwrdsTwrEJlE+8LwRiIHazAEf7FmkEWkMwG//yLoUQF1JwEERh0R4eP0hqM5
         EIjR0S9AB5JE87OwysTH9C2JTNnzWGfxMsXHHKX/ChhYMUPutaAZ14YuPpGdTMyo8xp2
         29tg==
X-Forwarded-Encrypted: i=1; AL+hErE+TfRM29+UXgC9GDaSFQ03YQSt0MsfzwW/0J7DAYszLDmmEDB4nnVDxWdAGjcicU3SC28nX6VVsJ6F@vger.kernel.org
X-Gm-Message-State: APuU4Z9AVvA+fxEqCK9iig8wff5jAvqaxHbtxAs7JpUvOR4FXMgk2ADt
	2nILhr5e98CuwOh3am6RedRJZj+mP1y9lBUCAcTgmEyRVwqJ4nCsVPuGwasXBisQX2myFgtkN1M
	fveWUxhc=
X-Gm-Gg: AZFdTZeMzr4aIilM12/lHxfALww3y0e8QJHRuQ8IqLZ7pYvtioSgfJ+RCmr+5iPWQBd
	71sAK12EMZevWUMVtYeCxpu7x4t0T2bnq/zAS+dsIUq2zfxiZ4nK8c0l+pHYlE75CVwA+wUw0pc
	O10JnsDKWDNuTSFYdWCgGatgiT73I9L5iCBVzkIINML9mUxY26eo0hIm8u/76d5hA+cjByBcuI4
	t+yvceT6vmoXaiQgCKfd4MgV5pug/3VvqDEBZ7cqwa1PhLxGVtQ5q9ddWFHftxUJi0QP/9j/pwU
	Euc66G/4eK1mPVRVGbj7ol0ZMHCfdRwUrSEFwwcqLuDG6dqaJYHmV7xUnzME3QuuNZhnufFMhtJ
	brZOiNEkryLfHP0vhKC2aGUs8hMBmrgkYwlPXyByIpyCmfIbKvGIbjk6hI00XNt7D99BGgH34iS
	I2pbukP8tFBgFb/RNARiFtF1pHoZzoNRa1lDnNduxIYSYf8Bq+oXnYMn63zvKsAycXF4ybJjnEK
	rTnS1mIceMj841cUkphsPnXX1VLYTU2DWedybjp7sSmWZ8UFCfv7UhfanOG9lnE3YtM3BsvRFD7
	G/Yuye8r212eyKWxOwo19IhGXjY4VjgBKKGY5vb8Tnnon3ss
X-Received: by 2002:a5d:5d87:0:b0:499:9f62:d64c with SMTP id ffacd0b85a97d-4abaf64be07mr25689240f8f.10.1795445645615;
        Mon, 23 Nov 2026 06:54:05 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm22057256f8f.20.2026.11.23.06.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:05 -0800 (PST)
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
Subject: [PATCH v3 24/28] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2712 40-bit DMA
Date: Mon, 23 Nov 2026 15:57:02 +0100
Message-ID: <20261123145728.29082-25-andrea.porta@suse.com>
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

BCM2712 has six DMA channels (6 to 11) with the same 40-bit programming
model as the BCM2711 ones, each with a dedicated interrupt. Add a
compatible for them.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/dma/brcm,bcm2835-dma.yaml          | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index b53652d5146b..0c74cc1d223e 100644
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

