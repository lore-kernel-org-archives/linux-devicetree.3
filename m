Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0742DF13B
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 08:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786782724; cv=none; b=JR30qajTyCxo+FpSjbBAv2aYJuJ0uhadeoHm+T1zXc1MhyDZStpPHWKjjH3agQHXtdfoY3ZDIJaBqcBkDjHqNxzNAagZS0XNRawKEyj/yAs6mRJnbyJA2eaWaajXkHFRwKjQgvUuOov5Hbn4VekKGBcb5O2uBM2BTtJvwEtygpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786782724; c=relaxed/simple;
	bh=ig0Czw6EoJk1SeXGouZnD93LG49YWVcmjNh23KhFKG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bRdbGRI2mLMydFhh97CSWqQXFM2TxI3CgoRDwCcNSBFFeb+Kt6/1ImomIjwu+1E9oFZ+TzD+s2WjJNbBoaLQDdskr2qMjWN1K+MBZ9Iv/wfCRxWrwXOGWTse9R+QNCnsacAridhajbcd31T+tXyQRpBO3Xg0wX82gvML8akoEOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezbi7WP1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezbi7WP1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so17472445e9.1
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 01:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786782721; x=1787387521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JmXRmBb374yuyQNwVRXydj5Wcgj3TvsFot0DLbSW/P4=;
        b=ezbi7WP1C99y+DrBGx3M0jA6VoLTK3P8mIUGr4d7JM+dSO4k0cVtFkBl21OZASJhxU
         qcZx17Q7cikKzcbDV3nBA20C2k67OMZYhTe/5wramfuU1AGiJCNVXpuE3adYPtFsKGZ+
         Pd4b8JC2HrVooV3nv9s9gRinJ4EaSz/i0yBVxS5bfBy4dGAuw1s6Vxk1whym35q3EaFT
         SeD7hSev7L9vt1F2P6/AJ+DKB25x/QTsSd7yRRLTGfrOJBPtR9IGl+sIj2GVu7//3seA
         m+75QcOThLMbHFDoQc2vhWATGMtmZQZqtgWL9bG27uoPhFGArzH+G3yhJLdt4nQmEgN+
         2hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786782721; x=1787387521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JmXRmBb374yuyQNwVRXydj5Wcgj3TvsFot0DLbSW/P4=;
        b=BVyq/G+uLSnqvepf/1FFQpHb5md3T5It2AtOuvz6xlURHKeaQ4fq6a1Z6DPZIlznSh
         UgNnX1DefPKnqYbVQRWd0ZF0L/i7aaW6MFiGW8lUNfx7+wmQOe0XZtJfPwdh46b7Iy0o
         xFeUFd35hmoAnzN8Ha8uv/3LuVM7BQgyRRTtOn1iLtsVLvSIMq4hd2KGpnuHY2jqAroW
         xFTer9lzZUV8vzm1APCtQhSBZWbbKrd3WLvCAoVKfm54YZm89OimiysCRgRJyjDJxcXH
         HiREhGmXMpoLRMBkDA+3XEPJhahCCXPDD8wazz/tX+wcvUk9laI2w5BXl7xnQjcbKpJ8
         lbzQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDCsmQmOmGecnWLGYZsKv5bCy+vYURJEegX7BK7RoTifWM+4araofK4s21oCgDCN5Nlex8eGG569bc@vger.kernel.org
X-Gm-Message-State: AOJu0YzEvahHH8PSQPNwcDEkemzZYK1D1DrdQstedaVhjKm0XWQdaIp6
	HwSIHuFvk8S6JxNQd3+TCa621nInCXUV4qF7O/1ySk4qjAhzmsZhd3WO
X-Gm-Gg: AR+sD13uySipKBdw/DQjullHnspzAzjxZfNiIR5EFhmr4vlZO0GWGwf3oSVG/N1IoQ5
	oYVcXOrPWpMNP/KukU+7LlcHAKxbeOzZ18ee/GRIJOraJ1NgGiZd0Z8MMbun9AVB8pPqQroBBX5
	GLs+/9tPucWVg26mBrKP+0FmVtXgPCBwMYbWZw3u0EbwAFpG8vB+teailqL1ISJ/FrXSjwkUrHD
	VmFONDk0xiWsQn/VC6htjxxAD2cu56qDf+6qfoirz2Uqw8MF3WoBDoA/FqVmItgbDh1C7pRcn6b
	KNWV4mc20oP8nOfPYdpHcCt7MUPZ9WHvbo9J4CmGt8R0XfgamrYtxmlL/jP4HwxtRzEDafX1cNc
	NhhempaOlJ1goAGRB9TPZbswapeXukD/ztxRtJ+R8eK7rJFxAYljZF0FE4s8npZSUJUexyi5RtT
	xwfR1JnJmyeJnFBivGwTl0f2Dxvd5HhccTRMLi+/cVKEKiD/otBC6isx/6sTNrAkqpJkCQgHbpa
	7BXHGe56XdKmNp1vB5Q1/benJuxL7Q=
X-Received: by 2002:a05:600c:5643:b0:499:77ba:4b6 with SMTP id 5b1f17b1804b1-49987ad988emr113620185e9.9.1786782720567;
        Sat, 15 Aug 2026 01:32:00 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.242])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49988b1d33asm126774485e9.10.2026.08.15.01.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 01:32:00 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH] dt-bindings: mfd: Convert TPS61050 to DT schema
Date: Sat, 15 Aug 2026 08:31:45 +0000
Message-ID: <20260815083145.2145984-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments TPS61050/TPS61052 boost converters bindings
to DT schema.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/mfd/ti,tps61050.yaml  | 92 +++++++++++++++++++
 .../devicetree/bindings/mfd/tps6105x.txt      | 62 -------------
 2 files changed, 92 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps61050.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/tps6105x.txt

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps61050.yaml b/Documentation/devicetree/bindings/mfd/ti,tps61050.yaml
new file mode 100644
index 000000000000..974ef78d6e26
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,tps61050.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,tps61050.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TPS61050/TPS61052 Boost Converter
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+description:
+  The TP61050/TPS61052 is a high-power "white LED driver". The device
+  provides LED, GPIO and regulator functionalities.
+
+properties:
+  compatible:
+    enum:
+      - ti,tps61050
+      - ti,tps61052
+
+  reg:
+    maxItems: 1
+
+  regulator:
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    description: Puts the chip in regulator mode.
+    unevaluatedProperties: false
+
+  led:
+    type: object
+    $ref: /schemas/leds/common.yaml#
+    description: Puts the chip in LED mode.
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - not:
+      required:
+        - regulator
+        - led
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tps61052@33 {
+            compatible = "ti,tps61052";
+            reg = <0x33>;
+        };
+    };
+
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tps61052@33 {
+            compatible = "ti,tps61052";
+            reg = <0x33>;
+
+            regulator {
+                regulator-min-microvolt = <5000000>;
+                regulator-max-microvolt = <5000000>;
+                regulator-always-on;
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/leds/common.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tps61052@33 {
+            compatible = "ti,tps61052";
+            reg = <0x33>;
+
+            led {
+                color = <LED_COLOR_ID_WHITE>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/tps6105x.txt b/Documentation/devicetree/bindings/mfd/tps6105x.txt
deleted file mode 100644
index dc448a9d5b4d..000000000000
--- a/Documentation/devicetree/bindings/mfd/tps6105x.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-* Device tree bindings for TI TPS61050/61052 Boost Converters
-
-The TP61050/TPS61052 is a high-power "white LED driver". The
-device provides LED, GPIO and regulator functionalities.
-
-Required properties:
-- compatible:		"ti,tps61050" or "ti,tps61052"
-- reg:			Specifies the I2C slave address
-
-Optional sub-node:
-
-This subnode selects the chip's operational mode.
-There can be at most one single available subnode.
-
-- regulator: presence of this sub-node puts the chip in regulator mode.
-	see ../regulator/regulator.yaml
-
-- led: presence of this sub-node puts the chip in led mode.
-	Optional properties:
-	- function : see ../leds/common.txt
-	- color    : see ../leds/common.txt
-	- label    : see ../leds/common.txt
-			(deprecated)
-
-Example (GPIO operation only):
-
-i2c0 {
-	tps61052@33 {
-		compatible = "ti,tps61052";
-		reg = <0x33>;
-	};
-};
-
-Example (GPIO + regulator operation):
-
-i2c0 {
-	tps61052@33 {
-		compatible = "ti,tps61052";
-		reg = <0x33>;
-
-		regulator {
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-		};
-	};
-};
-
-Example (GPIO + led operation):
-
-#include <dt-bindings/leds/common.h>
-
-i2c0 {
-	tps61052@33 {
-		compatible = "ti,tps61052";
-		reg = <0x33>;
-
-		led {
-			color = <LED_COLOR_ID_WHITE>;
-		};
-	};
-};
-- 
2.43.0

