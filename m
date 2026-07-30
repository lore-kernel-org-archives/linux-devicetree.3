Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201213FE352
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403508; cv=none; b=XYGE+kpCiy0TFmT2/dENt6+ew6iML1WRm7DzVgP7pRZFumS51njpSRSfhexSYqeUSNOuwSo91KxBpcUsLaT9GWvaBtE1+BZCSmFkkvxNmiSnyqpbdyBSHTx811moOGpNJnwthZ7QuLJk3u39FXaEygrMiwUbI5XUdbSRGF6jGy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403508; c=relaxed/simple;
	bh=+H/W06OtWOUaAXI5Urqcqhgio3A7vzXlFEDAR/6LHyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sAnI9vWEQf9dsjZfLYepbBvGHMpIzwjVRoO6ijt3tq6wXXFEoMBSNdLBzHzVIaJSrFW2l23QOSOwQYIkQVxPK7PdinoW98OZi40VVXpgWySko2EnHQxube6nby+Zk808eFOCEGUUPTjf6OZIbeQ+kN0JsU1lxjH7XNUqp6Jc4m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iAioOw0S; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAioOw0S"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49802c418b5so2278825e9.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 02:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785403505; x=1786008305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HmxdOuY2ztTCL/bOsHlKrWIxWkSPLuUMlltrw2X6NRk=;
        b=iAioOw0StjTUxGWobr1xe9TqzNlgufjRsSVX3xF4bgoW3Pty1YpGRFHISBSs3rhGRJ
         EhGjuyXnqxOH8lC2ZHckz65N1ij+4jAHkSb6Src0uhQ3JHcmrP8yGvGx3g8F1XAXEHdw
         ydXK1H15x4ODz2bFxyUVEbSWX4wHu32EFmtd0A7EeRxU9ph1mym3mymePGK9a9S5Txgi
         lWyER46K1XgXffRuYyfyOkbuVIfraSf8x5LhwpboIk96zM9BO4mLN+B9Xkvu2no3W5wr
         JaKs1M5/VzOcSr1GJn2DEN+v/WOFhlSi1BP/L0UANvafUVOGdvF8pZIWMdWYx1YYnNok
         4kxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403505; x=1786008305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmxdOuY2ztTCL/bOsHlKrWIxWkSPLuUMlltrw2X6NRk=;
        b=SCZLSMULo+FP1jm0s7cMJerNoivQ3uu9nKB14kx11xX5qtMwl/S95woJ6zjrCUcdI4
         PKA9t4TkaT0E+WHmHyaC1dUD1Bt8I0UKtlcXJjagxhqEGmISY+2jUPj5RkuCbh3HSzS2
         ni6OLUMH4QrH0skto6nBOmElpghahOrzx8P1KJUCht3xxVSCbp2xMVtS5M9YqDBM5sEX
         ygcyMsUIMaPU4ghO9GW6JKUm0qoQsEUU+psfhZOgK9d/gyV9u/yxyoGGO0fe2tH2dhH9
         9gl2KSvNibyYwiF5QX/kAIAX7URPi+LCt9CaJk1N4ULfCia9cmkdJPEieph6eWhLZju9
         YKYg==
X-Forwarded-Encrypted: i=1; AHgh+RorpGy5WVJOEnfjY2gbxK3U8o1qH7Sq7/prU02trLq7H9ryUqH5bbZAk9fAzvKyQEVXyhmd5RiEhYFc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/CqMbQ9PssvknYfCYA2rYO2vQmiDv08HCeMKE1ss5ABcXBB87
	ywD5YQgGqPKvZPL3RLCnZ9isqpMuoHh6fKfXFsAI8oqQLhtItTXarQAY
X-Gm-Gg: AR+sD12e6jwKvc0F0vuPt6GfhJmj4r7GkukJ4aOg/anYulxTtnPd6zYJkhz7guQ0kgU
	XjjlWe20Yo5dDPW6d20uTtrEVj6CDYeoCSYmi0WNEJfdIHxxfcakhWjpsZ4e/ONwqNqHiJOn44Z
	4bABG8Wt54hOuO48q/mqcEPys/79g2EmWcctwvvnccAy++EJkLRDQ1gmmuAYHBRlIFnElqCoPjg
	206AYQNOKzl4+xHQiavg7Ao5WRJwR4MLimshXQfg3+GkVuKSf9niRnm31/BXZSZ5P++rmGs58bY
	qLagjYwB8dXst31MADaKHoO8jODiHEMPNYsd07RhNq1dQFlD8bmF1ZVRLTuZu0qQBiOpI6CO1KS
	LBkdA27EqT2cpxzwefIQ24YVZZYGw1CCJKer/UG0uX0hsWMGuv+mXKS1tUWzVUSHenNpjMlKiTg
	C7u8YjBkcjiFoQZZwzkKiaLsU8DOdZdtHlp+f69xncRAmzXWJd6ZtBf0a9vcB9/a2612H7X/FN6
	fxvE1rjBFChZ/nsCwYVeR7E/ApZc5ud/w==
X-Received: by 2002:a05:600c:820b:b0:493:f442:3dd4 with SMTP id 5b1f17b1804b1-49800ed1b03mr22085445e9.39.1785403505130;
        Thu, 30 Jul 2026 02:25:05 -0700 (PDT)
Received: from fedora.tail6d6c39.ts.net ([82.77.79.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-498011fec37sm44168585e9.9.2026.07.30.02.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:25:04 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH] dt-bindings: power: Convert TI SmartReflex to DT schema
Date: Thu, 30 Jul 2026 12:24:54 +0300
Message-ID: <20260730092454.52466-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments SmartReflex bindings to DT schema.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../bindings/power/ti,smartreflex.yaml        | 70 +++++++++++++++++++
 .../bindings/power/ti-smartreflex.txt         | 47 -------------
 2 files changed, 70 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/ti,smartreflex.yaml
 delete mode 100644 Documentation/devicetree/bindings/power/ti-smartreflex.txt

diff --git a/Documentation/devicetree/bindings/power/ti,smartreflex.yaml b/Documentation/devicetree/bindings/power/ti,smartreflex.yaml
new file mode 100644
index 000000000..b2dc59b4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/ti,smartreflex.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/ti,smartreflex.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments SmartReflex
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+description: |
+  SmartReflex is used to set and adjust the SoC operating points.
+
+properties:
+  compatible:
+    enum:
+      - ti,omap3-smartreflex-core
+      - ti,omap3-smartreflex-mpu-iva
+      - ti,omap4-smartreflex-core
+      - ti,omap4-smartreflex-mpu
+      - ti,omap4-smartreflex-iva
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ti,hwmods:
+    description: Shall contain the TI interconnect module name if needed by the SoC
+    $ref: /schemas/types.yaml#/definitions/string
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    smartreflex@4a0db000 {
+        compatible = "ti,omap4-smartreflex-iva";
+        reg = <0x4a0db000 0x80>;
+        interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+        ti,hwmods = "smartreflex_iva";
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    smartreflex@4a0dd000 {
+        compatible = "ti,omap4-smartreflex-core";
+        reg = <0x4a0dd000 0x80>;
+        interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+        ti,hwmods = "smartreflex_core";
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    smartreflex@4a0d9000 {
+        compatible = "ti,omap4-smartreflex-mpu";
+        reg = <0x4a0d9000 0x80>;
+        interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+        ti,hwmods = "smartreflex_mpu";
+    };
diff --git a/Documentation/devicetree/bindings/power/ti-smartreflex.txt b/Documentation/devicetree/bindings/power/ti-smartreflex.txt
deleted file mode 100644
index 21ef14d6a..000000000
--- a/Documentation/devicetree/bindings/power/ti-smartreflex.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-Texas Instruments SmartReflex binding
-
-SmartReflex is used to set and adjust the SoC operating points.
-
-
-Required properties:
-
-compatible: Shall be one of the following:
-	    "ti,omap3-smartreflex-core"
-	    "ti,omap3-smartreflex-mpu-iva"
-	    "ti,omap4-smartreflex-core"
-	    "ti,omap4-smartreflex-mpu"
-	    "ti,omap4-smartreflex-iva"
-
-reg: Shall contain the device instance IO range
-
-interrupts: Shall contain the device instance interrupt
-
-
-Optional properties:
-
-ti,hwmods: Shall contain the TI interconnect module name if needed
-	   by the SoC
-
-
-Example:
-
-	smartreflex_iva: smartreflex@4a0db000 {
-		compatible = "ti,omap4-smartreflex-iva";
-		reg = <0x4a0db000 0x80>;
-		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-		ti,hwmods = "smartreflex_iva";
-	};
-
-	smartreflex_core: smartreflex@4a0dd000 {
-		compatible = "ti,omap4-smartreflex-core";
-		reg = <0x4a0dd000 0x80>;
-		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
-		ti,hwmods = "smartreflex_core";
-	};
-
-	smartreflex_mpu: smartreflex@4a0d9000 {
-		compatible = "ti,omap4-smartreflex-mpu";
-		reg = <0x4a0d9000 0x80>;
-		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
-		ti,hwmods = "smartreflex_mpu";
-	};
-- 
2.54.0

