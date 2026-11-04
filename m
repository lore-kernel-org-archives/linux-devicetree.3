Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793761389;
	b=VG0IPz7hX5C0KeerKdmx3M/OngvL+skNCYdT5Lvzddb8UlolvM0vHO48I2ii5wJT7ra+
	 G4iAHS+QPNU7NkgHX/DOezoBUFEOYFNBDSNjf8fQLztamOLul1jZ1ryKEX6SYS2bsQtv2
	 sjL3vBjzVc4hCv1FKe02xPOFgwN+weRLZjPKrG2Y0HmSfkEumhP3MHvcMtEesj2RE6um3
	 q0fEl/pe6IuMcJ0DTVWd5pGXG0mT4LWuTeYrBvvcWL9Bw8D13FLE3qMs1B59FWmAfrTeb
	 nfEp/q8hd+Aw0ar6h0pSpc1jF8HPj3At9HI5csRqzNuFk6KotAvi/0JifagQIxiC3TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793761389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=JODTwBcTg5LnDv4KmwCkQfqEz0wC3Hbmzw/64fppHts=;
	b=ZFzz4ghyLUW0Ela8D8Tlktl37O0MoTgTbS2ysMknrY0nDmqOuJczgTumYO89zhyD57dl
	 VNmGsa56YkaYWK47sR7S5pK/WMHB74ZYlgcGfpFix8yVkj62zi+hsSSTBvOeGUUq3rtpc
	 jxUVTT91sQaW6gr93+nUlArHtYxEU/v0GUoUqvMCTi5cjidxEvw71vzNrEHQJ6y/kfjve
	 S+NC6TMDKcJ74WMLSpAEOaMmm23T+SdGWs4QyHDPfoaeUH+Cm5LXKOeOD7svMGTkBuVxI
	 HOc45/h+ND8Bc28D4Ppz0N7bag7vrodrZNSSLBLrKOWBdLy91WmXvBImTPTDcKSzgkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A6IMNBE5;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65FD606D811
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 03:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D65FD606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A6IMNBE5
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso733855c88.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 19:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793761388; x=1794366188; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JODTwBcTg5LnDv4KmwCkQfqEz0wC3Hbmzw/64fppHts=;
        b=A6IMNBE5Z+EgwzrT94tR+g0zbZnUHBITCVZiYh3zom4ly75wPSYGMAHjKvvPhx+cdQ
         6PvGJipCnxydSQ4ScbNKTPJPlTu/XT/qvC4B9OaiqZUwk/SjZncp1jxRU2ye9pY5QV2f
         CYD51/G4uUSts2Zng+UL61Fqz17W2iWko+RXgNrhnOk/EeufSYk0KH80EUQfKndpiYHA
         FM2GHQNmmmaKOqNlyzZw/eyT66azUNnDY8Jvbpq94hoiuzQuCB7ISKDRFqZ6z5F07TR8
         ixbarNY7FSfLJiv81Y4223bClYOAid0yFXRLdwk6fDnOFu7IB211qY66GtiH9fd399cG
         fmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793761388; x=1794366188;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JODTwBcTg5LnDv4KmwCkQfqEz0wC3Hbmzw/64fppHts=;
        b=h7oWG4zPF5pNKx2CK6VRqW7p4Hdi+ZQ9v7+w5mGElluks0NhlCBb4sdMm9MWbNNTqX
         v4XoQQ6r1yBtXswcBIu6uU3zabzaxDXOTLy//jkqgKRTJSP/V6FLFMbHjxYRMczp/p0Q
         lPN2uiBWpyJ2kUsYIw2CR78FFGiSuBoQZe+Zm3OSNtQ2I31QaQdWMeHJPU4n3l4kDlBR
         OwwgAwKHVv2dL01k4n3hLxy90px7aU0CobW8FbDtBf/qlb+hvWuOc3xtpy392Iay7hKv
         wC8y6iVPs7KnXQiAxS1t+f/CokwD4JyLLLv8fO9pjTtUpO+e+y4fRmR2Q1GreSPmuSLZ
         8mfg==
X-Forwarded-Encrypted: i=1; AKwUvBww8UpT7Pj9rPDq4LyoHlWNSFQ0yy3ENN01loW4fufvIaeVOOg13QUzN+jEB6ROUHB+hgdwd0KHS/0J@vger.kernel.org
X-Gm-Message-State: APuU4Z+tnem4v7f+GvMQJ9vMm8CyvjOZ853RqbyI/42SBAflrtOHHrMe
	HL553DifLNXCZBKUvu4ROap93h5XjsHhBlSN3ewB1g0W6Mp7pVsu3ukfH/zWJ1W0YSVTpZJ3O30
	DbH7wpWgf6g==
X-Received: from dlbur23.prod.google.com ([2002:a05:7022:ea57:b0:185:5973:326c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4512:20b0:193:9aa3:474c
 with SMTP id a92af1059eb24-1ac5ac4efa0mr21972153c88.21.1793761387538; Tue, 03
 Nov 2026 19:03:07 -0800 (PST)
Date: Tue,  3 Nov 2026 19:02:58 -0800
In-Reply-To: <20261104030300.1140180-1-irogers@google.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261104030300.1140180-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261104030300.1140180-2-irogers@google.com>
Subject: [PATCH v17 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
From: Ian Rogers <irogers@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Dom Cobley <popcornmix@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Add device tree bindings for the Broadcom Raspberry Pi AXI PMU block
found on BCM2835, BCM2711, and BCM2712 SoCs.

The hardware exposes two MMIO register blocks: the primary monitor
evaluates the System fabric and the secondary monitor evaluates the
VideoCore VPU fabric.

Co-developed-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 44 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
new file mode 100644
index 000000000000..2f1f4f286ab5
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/brcm,bcm2835-axiperf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2835/2711/2712 AXI Performance Monitor
+
+maintainers:
+  - Ian Rogers <irogers@google.com>
+
+description:
+  The Broadcom BCM2835 series (including BCM2711 and BCM2712) features hardware
+  performance monitors on the AXI bus for evaluating memory bandwidth and
+  system traffic. Two monitor register blocks are present: the primary monitor
+  evaluates the System fabric, while the secondary monitor evaluates the
+  VideoCore VPU fabric. This block is distinct from the BCM5301X AXI Trace
+  Module.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2711-axiperf
+      - brcm,bcm2712-axiperf
+      - brcm,bcm2835-axiperf
+
+  reg:
+    items:
+      - description: System monitor registers
+      - description: VPU monitor registers
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu@7e009800 {
+        compatible = "brcm,bcm2835-axiperf";
+        reg = <0x7e009800 0x100>,
+              <0x7ee08000 0x100>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..b8a3cb005c91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5338,6 +5338,13 @@ N:	bcm113*
 N:	bcm216*
 N:	kona
 
+BROADCOM BCM2835 AXI PMU DRIVER
+M:	Ian Rogers <irogers@google.com>
+L:	linux-perf-users@vger.kernel.org
+L:	linux-rpi-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
+
 BROADCOM BCM2835 CAMERA DRIVERS
 M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 L:	linux-media@vger.kernel.org
-- 
2.56.0.385.gac671c819a-goog

