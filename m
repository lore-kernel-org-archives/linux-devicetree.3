Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E084A429CCD
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827115; cv=none; b=rF2Kmd4U3FHjA9gJYURzK8VSaNy5htw2gesiok2VMDpI0WpJAIpsarr3Oa8THJygDDSke1/Jh8VYFiTuEfoKdN7XIl3Acrto+5q0m//wz15htGcDGJ1g0crhIpNubaxkbYHrz5AX3Vmui/h0bGvLM6qHHPnRki9iasTUSsb0dCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827115; c=relaxed/simple;
	bh=MKjq23mwbHabkMkKyl1pk/U2S7bpmtBZr4AcT9DgqNE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TSmP9wC1PELnz6OF+yCmshWFLoh/MaJmY9Dmktstw0256QD7r6x3pGIeUmseypTXwEdnSBLRivn+yq1LS/PSLgqG26zv51GavMzA8PSl8lruLJ+wZ4zhOBvlAvFO5P0yz4y8ChSBMUKViK84cW99TV9P+yKBwzWcUC+PXDZCrBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTv0XHcX; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTv0XHcX"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso4024821a91.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 00:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785827113; x=1786431913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYle3ok/ZHpbCa/gvJJfuJ/kdU7yLL+dRoi+qfcwl8E=;
        b=TTv0XHcXUHCxcof6iEz/59xWEC0/WfiqQvyMed6DlO3mfnqZYfM63ZpM15MsXMGGzu
         kiU3F+1bk9KS1bHmcYryNxzWBPMY5RYW8fN2YCb5NtASoELmS/t7uNrdFIEGgnjw0bFn
         M9GTt2vQdGbHiixeaYVpiySx07CB5JLFDLBUaeqL9YulPK+wCoE+zBT2tiEIneBQj/Zz
         Y5POnsp7a4VDfcBxe0GFJxQu6riQHAR8WvIc/uaNzH29xjFQPAtAnLJFIFfu9tXgEycb
         4LQ6m9xctoB5XHZIPUEBYuVqpGN5AGCPpRELNb9uSQoKJPzjnUjmoVy5buLbV7xJc1Dk
         8Osg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827113; x=1786431913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYle3ok/ZHpbCa/gvJJfuJ/kdU7yLL+dRoi+qfcwl8E=;
        b=muLbyYmskH4ZhDlcvEj1CXFjXdjasBQgzHrBzF8QV9zeAoHjjvZZwjVKj5sal41IGE
         S3awk1ihd2y11Swp3zOx+XArSft/xajIatvAT0C9q6+ICijhIlHPISJLOKWFPkGQagaT
         haOhO8Gw4PsY9T/ubCS+HNzU1VKNZSDUFDOltWt3mQ/IkRs5hy6efKrCj+10QhKDjp5u
         LD3wqGlz8sapHlM7R4Bt9VC2A2oxOA/gfCblR8L5w+qGEYAfqRFwRX46IzRtw+SKGK/5
         GYBsOmNldnhe1CLcojB6HXRD3qq29WrjOQYM4d3omEQRYd86cLm9ADhutCk/DAKl+boO
         BJig==
X-Forwarded-Encrypted: i=1; AHgh+RpbQpzw9tLfKQKAVHGsNapsqITpzYxgIPylZrFNiOP7p5NVnEEqsyUNlDNBAKT0kl7S6qHFQz6+e8kc@vger.kernel.org
X-Gm-Message-State: AOJu0YyVOrRdxz/ub6LFq8wE/VwbnuUD+4nbOCYQk6jppRWj6YaFfWG4
	6v2ZrX1RsZaSPLTwd6zXNRUfV73itkmkfg52P+BFeliAMBiohf5HfHpK
X-Gm-Gg: AR+sD115I7uqXlVjP6j/knFQfYrnjRqS4Pz6P5CXvt6tZsCUFDmB0BKo2I8RQ3FNFng
	YqEfqfOVfCiI6w1bOhK89aKigw82aiS+8OYC/9Zn3Uk4LSquC92tGQTe/hebBxVlU1dpjeQdK2m
	R9h4rX99eQGZbm1GWvT2k3LBjZtToOf9OvZ74WumGVx+TanJSVz6BlwcI1Fs7Y3/g4eYABm6zn+
	p4U/hSwFPYIjxpdTfq3Cf/TCvwcJ+TyAVKuN4IMwbQYfpU5FUORz2QyMkV3ZpA8xNFlF2iXZWSC
	HV2JusaLSR2wSL0GOxEna4o6QpnF1ig9lmjUuJYBKvvorVUucJWSszrJ2OZjYeNY4rAMUsTu2QU
	11OmiuHNob9ntgE6m+21aW3TX66qAU/uI9uh2sQZDVJntKQJkLNSm1YV4+cJjiprX+auZzvYi1Q
	2jMFlY61dtPggt6wnf5NqOVlYEDDoHyyI/gdM+gaDQjmCFg4oKzzBg1BGamNh2w81VtAKwcK2LD
	hQMvCYkgg5PAH0049INimge7WrwiYPtqzKcoZfWSNzhBzg=
X-Received: by 2002:a17:90b:5403:b0:381:792d:f993 with SMTP id 98e67ed59e1d1-38fbc4835fcmr12263384a91.17.1785827113305;
        Tue, 04 Aug 2026 00:05:13 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febfd8ff8sm859815a91.4.2026.08.04.00.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:05:12 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: watchdog: Add MA35D1 Watchdog
Date: Tue,  4 Aug 2026 15:03:49 +0800
Message-Id: <20260804070351.1846165-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804070351.1846165-1-zychennvt@gmail.com>
References: <20260804070351.1846165-1-zychennvt@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for the watchdog timer (WDT)
controller found on Nuvoton MA35D1 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../bindings/watchdog/nuvoton,ma35d1-wdt.yaml | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml
new file mode 100644
index 000000000000..aced7d77a7d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/nuvoton,ma35d1-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Watchdog Timer
+
+maintainers:
+  - Zi-Yu Chen <zychennvt@gmail.com>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,ma35d1-wdt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        wdt1: watchdog@40440000 {
+          compatible = "nuvoton,ma35d1-wdt";
+          reg = <0x0 0x40440000 0x0 0x100>;
+          interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+          clocks = <&clk WDT1_GATE>;
+        };
+    };
+...
-- 
2.34.1

