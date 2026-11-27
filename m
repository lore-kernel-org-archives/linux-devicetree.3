Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781931;
	b=SeORCIsC98Ge9UrZ7aAL99JK4yu51739rq1QirazFoDddYtDgEP2vHQitdxBjAvv6H7u
	 LgHFYpfcYybLwg15lDzXrzPu/Isr16602nnmqq2EfMczXc5dhVyx+EPYsarHGOVeDRmPW
	 Ggu3ksekc2/TnIHVOT5fyp3m84Ip0iTaKGOCPAL9qA6eILtsdHWuFl5H6jc1PyhkLNcNQ
	 Ps0+opgpdJKbFhyII/QBjnV9JeaQCKcJ9EdyJMhg5WLb8Kg66M3AuQZec40GAcHy1Vc8U
	 UICOlu2GTROHu45e7un6iDNXF78srQpgkXMme/QSBl44ocM7+IM7gsPlWWp6Vml7uXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fe54TCs34sdjcHDpXrVtFkvlLgVi62aI0olf7UQPt/k=;
	b=uzqTYS/VOUikiJOQoLrK4XPMVIZ5P5hS6oHyCLuhAMLFK6x0595hYFyPAJnp7sheVnB6
	 kbqzbXiNDpcS2oSHWaRevtFQAzpNn++AerfYxmAa0JKv2H74slJ+7iDqZYxJua+Rp3Kes
	 JAAbkaGKA9W338U/VTkTgO0fnugXUMw4/vsebe2uE3py5ukx4LJzolyYbnRvCJvNVv0Z/
	 pW+4Uc6qD99OkonzNG/TIGUx1v4T1rnly9MdAFe5oNEkcIFmu+Yhr8Cle91pDdvu3lu8N
	 mToXShtXoQXIoUZOQX76/8S/j10viUG1UjoKqOQOPAk8bFNWB9MnPp6eYox+e5oawvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=H63zCcdE;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE70960A2608
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE70960A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=H63zCcdE
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so81467575e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781929; x=1796386729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fe54TCs34sdjcHDpXrVtFkvlLgVi62aI0olf7UQPt/k=;
        b=H63zCcdE8v8z38ylXUNkl0BtOyn7d6plpHm2Zqev9QRdI3N+jCsz1ux3c58bR/omVs
         Tti5Nt9EfL0oZLwXP6Kg78um7P0Tetfg0nuOuepo++jWs5cKJZJ6pVGywi5Gxd9DAcQM
         xRExX5WT5UyB6FfbHu2rtYVDZBFRlzQG3cgvWz7w0+nrt3r91O/DJYgaSaRtdJh7emiG
         gT0W6/+0b3wYhrS0QVQhW8ACkxBQjB4JGzlxgvrRMWvDCmyeawz/GgaTnvwZgF3Ou9Ol
         kxTMnCRAhKXArM7FjuAgO9KgBwSIRx5nEqpe97fnL9QnTh35A+V/+WnhbgXfoQyi6lDc
         HwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781929; x=1796386729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fe54TCs34sdjcHDpXrVtFkvlLgVi62aI0olf7UQPt/k=;
        b=LfcKZiQFthn5KnJ6sPtoIe8IA+dcxmjrF2cbzfhn3jyLv2Kq1uxBkemzgzwO/+R9pn
         OLP4Nru4edP39258pOlMwXRHmI5VdgOyyZbjbltHjVY/x/1ITYxiGay0HD++fpG8Hmgh
         OB0LYOcG8HV8QptKlm8FPrtw6cSJ8RJsipE13FrCL3NLdQ6yN/A0Mh/Y/JACkfZvl+a3
         OZ5hYzH6gKhgYQidYT+IxTnSVQNJbUyqF8xQK76eX7srQT4zA2mEQZjh/vVULrJvqLbJ
         STL+d2mUL444iN4Av0PBI1Oc3yZtDIBbp3iisbKt6o1NgqVgT/77vVNqFMJliVrlLXks
         Kj8w==
X-Forwarded-Encrypted: i=1; AL+hErGjCS9F5Tvm/6Q9jrJb++DIydWfH+lxH2ElxHDxFJrsZ25t5fVK30T5YQaPXB1lwbJK4ts7duIY7a/s@vger.kernel.org
X-Gm-Message-State: APuU4Z/E2b0xKSJPKOdC9ZGOymnyma7NQVymTW/POwTLzBzawALh+QLk
	socrHdTiuZ3wPjd3UZNM8VtcaAyUQa4tDZXYjPeD+WoT7qnzyHWCaVvT+3z6anIE2vE=
X-Gm-Gg: AZFdTZcY9xPP9Jwkrp4SvUvj+HKVhGVArXwymLCpvW5O1ObhlGWi8Za3gt5m0avObPU
	KzgYgSb4gJ+mSoRWQbtB0FVHg7VuFkeZ+lePdf6Dw7rCzhgahMQVLYVtdWC4B767MB7pt6b8S1i
	TSqJk0aiSVwHIEHyH6jBis5XacQq8wGKg9vx+dzKlTeERilvQ9NbyMHreVd8+dO5jCEF410JLMr
	oN52I6AVHvoGpN3KgKGygk22PgNXfC2r4IsNL+doOt9gbsJn6NP52MCUqeEA0I2YsddXHYN78/Y
	6dMy9GZqrf4/k+dq5xaTV0fjRcjbBPnfo92D5rdqv4mgYL8O6/pCHXwF5+3IVeH0MCdFU+AePY2
	qTswVVDsVx6phXkvb8dPTHL1vtaVSZMh3lDiEv3R9v3soZobmLLxY1S+kDtP6onpubLNKUpJJMp
	JVfb6XG00kC9WCb9BncDpuX3pgubHTvmWyMC7wWKmLIXAQojAQCFiFsloMhWEGlmnyzK+jnZDQ+
	JErH80KlYGozahQXw/NHDnTQVwmSo8g5QZErc+4IeYves6kjTRSknIPVUZHG/PfXb7ZnTxbZIRj
	V+4VH21rOF5m9gpIL1r81ZI9FasT
X-Received: by 2002:a05:600c:a085:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4bb887ca0dfmr515690305e9.4.1795781929355;
        Fri, 27 Nov 2026 04:18:49 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm568064995e9.9.2026.11.27.04.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:49 -0800 (PST)
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
Subject: [PATCH v4 06/28] dt-bindings: dma: brcm,bcm2835-dma: Allow the generic dma-channel-mask
Date: Fri, 27 Nov 2026 13:21:56 +0100
Message-ID: <20261127122236.4976-7-andrea.porta@suse.com>
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

The available channels are currently described by the vendor specific
brcm,dma-channel-mask property, while the generic dma-channel-mask
property from dma-common.yaml carries exactly the same information.
Allow the generic property and mark the vendor one as deprecated,
requiring at least one of them, so that device trees can provide both
for compatibility with older kernels.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../devicetree/bindings/dma/brcm,bcm2835-dma.yaml  | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index f81740e49301..51ad8bc33d5b 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -51,12 +51,17 @@ properties:
         bit 30: use multi-beat bursts
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
 
@@ -65,7 +70,12 @@ required:
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
@@ -107,7 +117,7 @@ examples:
                         "dma14",
                         "dma-shared-all";
         #dma-cells = <1>;
-        brcm,dma-channel-mask = <0x7f35>;
+        dma-channel-mask = <0x7f35>;
     };
 
 ...
-- 
2.51.0

