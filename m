Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499B93E9C08
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 20:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194988; cv=none; b=GtCZi41xNIe5SntgergDcsdcXkbc/pFXXX34Vqt4iFVNNj+UCnM2toGXe351GoPar+Z1MPD+rvhLWeFiM0+2qSrZSQvuTUHFryUYcEpk4hMzu+ksCW1/kjf4Ls/TxN4+muTn8QUQnGfrq8QRw+qqdynk/i0UUbJ9FSFi+3ihjXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194988; c=relaxed/simple;
	bh=hYDoDnMsKfc2K4l73QX3mfc01djD0ZHm4lyFuIhD2tw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mOtb/60m4RNz1nPliWc8LWVWTBWTKvN1qtJqj7uEfl6ruG8GVK2zrwYChmrTtLlpjmJbte7wkymHZXOFq7r3vw78Ka2MWIUqk1VcrBxDfh/ww7gdP+y2SjykW3BwJmXwUyrLbSGU/SyWt09ASufNUneokkgUzN2jC2HV+P7L9ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVM9kFAL; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVM9kFAL"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a1a631f6aso172700366b.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194978; x=1790799778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XihgTCn3FgUBl9p3rY1vgcPErnbpNQs2ORgadSRzkUA=;
        b=AVM9kFALLk8fuss+2aQEvSzlTBZBq8JrAovZhfgvqEWq0vuxvMQ0pNat4RXtVML26i
         bqEkFkcx5nQ+5ceNFtJCXEqo/Gi2/58Ug/NrqHSgjyQaZpZmeUxt1k3umS8ChNfPq7pP
         ZY+SzzYDBvo8GpoHTbPlOKG3s6Khyr/682RXkj2b0FQSlGQEH57xEbvOoJUGAAQz0tF/
         03jLWpJhXZyAjI+hiLUKcMPfeqwLlPi2k7IZC5KgCCCt4h/QN/LGDcbxzmwQue8t/4uR
         Sc4Veslmc2XpElJsgreDhm9aYEi9tRCM3aMy7tOCZE1kIdrUVhaCILWftw6lczXX79NL
         5qPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194978; x=1790799778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XihgTCn3FgUBl9p3rY1vgcPErnbpNQs2ORgadSRzkUA=;
        b=cM6QMaT3IkzMto+rjo5uNrAzn7Fjt0De7nz4kqeG7jbdCBGYy1qKrW/fu/QBsRlXn6
         jpW3mLqCKV7rgllEbtYaWD4vfbW7hbn44HtHPTsj/OYDqUAVGdxhVwmcVsE+NrKuxbX7
         alUZtwLAv8i0NDJr76jMkdBfgZ5bH57p1tnTBXlMP2OcdDVwXbhqoaERugaBlc46JusK
         B81d7QHpQH1ooJePb97c9OCKcfrfea7GtaYo07LbBL9r1XndW9upI3ZZJLHvZjXl7opH
         mJKIgYYvGGzQb3zNBm2MpNnTPEq4F1SyL8OGk4TIFj3wbSO6pCZktJDMfbYMynM+NJYf
         5vBw==
X-Forwarded-Encrypted: i=1; AKwUvBychWEbYOMncQ1PgpNygc/B6FCPQbrIRvF6IgEA3zI4YznNZzaXn8r/+s+LG7IKUClb4LwsB4L03o1H@vger.kernel.org
X-Gm-Message-State: AFuF++mzgypiDvBr36AUmq607BVvAk5udaVHt9KfnOxkJ9ELtch4LjJN
	EmgFm02ZgaknvdOwdoHtoLxn+JY6ejUAzhJNS8G1Jwpq8MSQrM6H0ty+
X-Gm-Gg: AYBFou220tyhZaH16fyaKVwq6pRfW6NH+Y4Hz18d7V8kQpICVcbIUYmdWDjDr7Ji/bO
	Tkhnomh+Iw7VcKxqXyzfNJvDRZakSu+0Ni4/raM8pCN0pRQ7WCjMe+TtqBKGICV2PVIvs4Nc4ou
	zTGAMOXUp8JmiSBkEw8AayRvW6tEDYjwFTQWZl8mpZ38K32wwkc1bHK1XqZ/bUmd2yRgZvGwOE+
	/YuPhARSJN6+MZYR1wxRfIQmIkhMQMdYYBLSo8vqidzh3gAdpmtKabr4MJKZ3ZmWTJiA8y2ZjQ2
	12yU8ed4B7WcHY2A7gIZk+aWE2iFvknizG2xHBKPAx1xLGuQM/I5URGIedOgVz8Ex3zP7HC+6dV
	mzJT0bilcELrxt7LI+mKG7y2NtC8B9nQO7uJjBA9u+EQabAUjJHMXN5Xj1FOK2PyQauU4FIK0Zn
	5lvFghRQdS0A+oFy85kO2OIlEjEML0GYoKZByP5jhpvqmkIOrxnXItcEczS5n0XVbE1HMF19+XO
	BeGIpKCwzVxM9SOEIsTAdnR7aDj4yo6YnQtaoK8cLMH
X-Received: by 2002:a17:907:d24:b0:c24:b11a:470f with SMTP id a640c23a62f3a-c2ac2106076mr27276466b.0.1790194977830;
        Wed, 23 Sep 2026 13:22:57 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:22:57 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 03/11] dt-bindings: pinctrl: add Allwinner B288 pin controller
Date: Wed, 23 Sep 2026 21:16:53 +0100
Message-ID: <20260923201701.43391-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One controller at 0x01c20800 with four external interrupt banks.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../pinctrl/allwinner,sun8i-b288-pinctrl.yaml | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml
new file mode 100644
index 000000000000..806da97ab708
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/allwinner,sun8i-b288-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner B288 Pin Controller
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+properties:
+  compatible:
+    const: allwinner,sun8i-b288-pinctrl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      One interrupt per bank of external interrupt capable pins.
+    maxItems: 4
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: High Frequency Oscillator
+      - description: Low Frequency Oscillator
+
+  clock-names:
+    items:
+      - const: apb
+      - const: hosc
+      - const: losc
+
+  gpio-controller: true
+  interrupt-controller: true
+  gpio-line-names: true
+
+  "#gpio-cells":
+    const: 3
+
+  "#interrupt-cells":
+    const: 3
+
+patternProperties:
+  "-pins$":
+    type: object
+    $ref: /schemas/pinctrl/pincfg-node.yaml#
+    additionalProperties: false
+
+    properties:
+      pins: true
+      function: true
+      bias-pull-up: true
+      bias-pull-down: true
+      bias-disable: true
+      drive-strength:
+        enum: [10, 20, 30, 40]
+
+    required:
+      - pins
+      - function
+
+  "^vcc-p[bcdfg]-supply$":
+    description:
+      Power supplies for pin banks.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sun8i-b288-ccu.h>
+
+    pio: pinctrl@1c20800 {
+        compatible = "allwinner,sun8i-b288-pinctrl";
+        reg = <0x01c20800 0x400>;
+        interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
+        clock-names = "apb", "hosc", "losc";
+        gpio-controller;
+        #gpio-cells = <3>;
+        interrupt-controller;
+        #interrupt-cells = <3>;
+
+        mmc0_pins: mmc0-pins {
+            pins = "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
+            function = "sdc0";
+            drive-strength = <30>;
+            bias-pull-up;
+        };
+    };
-- 
2.53.0

