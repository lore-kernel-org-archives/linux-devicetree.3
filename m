Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D273B893A
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 17:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779383314; cv=none; b=dQ5VjNgWxN6AZhybLyw5f48GnboZ7cZQJHtA3be2GCrX1wXOtT4/XS+zH8B2ZlcIrf0tGbyr/ZBeeO4zrDMxYISqJ5I5N02VKe86HhL8oI0CWqE0MF+rUCsMEa93XZApqRbw3ILVNKRaoPx1hSeR50WcxOTDrfmJwTrl433qLOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779383314; c=relaxed/simple;
	bh=XVSXONIYOQDfTPeLhk/uxG+qfvUsFWMoBP/MIkuS0+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qYeJMc1Orx5DJPbPWBKzR1LE8nn9IBXyUbHzhwMhOft2b58O8bCCfn+bRLdgRBLOsO1NLNMfBQwV78pUZ2+qpLA9z3sujw8WlTBXbigm+24N819DGFBcDepoSmnFE0Nwg29LJlnHC7OnWMfkdkMvSQAmYq3TyTOjLr00q8sDMq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pzaqYx3x; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pzaqYx3x"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ba17c8cfacso62157255ad.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779383313; x=1779988113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eb5xOudQb1z4nmcnfT4P1pNyVmRx1hYvhT4nQVlTghI=;
        b=pzaqYx3xlmwHw0yO7s/DdbRRvUZSk9/drddfTWYpCiT0Klyhyb+it1LfmAMXWg5Wml
         jhcmsX3XYc6shqgo6HwhALkodAprxzBUpyqign1W5/nH+zNt4T96/XoiWUqrvWrQNm0U
         n0Iqp08OdbPpWyRcjlDPLEKVdUQ91DgBtF2b8opbUB0tOJ8Rdb0TaD2N48y+eLSLsxAp
         Qq2tfJuZ6CxMtZj6v2QdQEnRroe+6pImnEv0x9b/RZzal2ByduHoyQl2hgAuMZe4jPBX
         a+Lo7EFqyRkTOTjwsFdT/53EMVFK/HftYwmSkpjVXb6ukqEJ3P3row6WbL0W4g7itWGV
         swEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779383313; x=1779988113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eb5xOudQb1z4nmcnfT4P1pNyVmRx1hYvhT4nQVlTghI=;
        b=YPmEeFYh42wVgQvBo/O17oS6oSRnzzagwwSHQn4xwIpu0lD8k9vFMO2wCHJzzolOva
         SnCHgvFirAtC+W04UuGxvgIS6mXXT8jVZeZOrztHye+gLYI4qEqD7yvUf/Vrg6Psjp0h
         x3L6FSiTworyl/lnzMsHoM8N2fqN7FbjroZtB+MAzfifSWF7Y+3OAHTE9arkxMi+v0Y0
         n3iOp7n18ma2AoWTlZ+fx0WCNk23nY+qUZ36L7Uxh8Ia86MMki7eVRWxuONbuJRai6sx
         91WnchepTh3n35w7v+EsAH53fd/HOyh716N/Vb+4udv6oTeTruW+e+rhUliHUQfO7M4e
         m83g==
X-Forwarded-Encrypted: i=1; AFNElJ/6L82IrDkQh4h2Lacn3c5sFtwmWC4NvvBLU/e/T51U0MlTuJ26VxdS3VVhPyXjvfxMXtjCpcvD7uud@vger.kernel.org
X-Gm-Message-State: AOJu0YyDYyjU++9bpqSEMQLy4xli04FzAl4sTuFCEnTbw4LhfvzAzLdq
	JQaRu8f6Ms1fV27I66gLSClI5vF+supR1u+Zs5FqDa1/f19K+OBRbeZR
X-Gm-Gg: Acq92OEMuHr+rv0xNBGfDB+qjtBS9Dn3oSayVGJEw02RP4h6hlrgQB4BW0tXPs8f1pX
	6cKLQnR/McLZu+QmGqpdqZ76JNjUR49oaLEeLkAJsLI3aNlL1jBF7qVuZGKtt0TiXghxMat5eJn
	Z+Jjgvgky168Vee0cbcDgXr0ASa+qKSGm6oqty+pGylqbNEjaIaUH44ZrqmvatRftg0c4IJhmnY
	7cHQLNaQGoiMD16Tg7CWH3CqT0bfLitexe3ifDfN0x75ASMwmEt6P/1veUqIvQ6QX1J2EeRTUNJ
	e6v8aZEWTEfBD2k57dY28wD5jehKcI74OFQ1OkrAGBAh5MG2qo2HoTDnEYUbS9Rro6y1FpJHxih
	TeeyO3D2RfNK6ceRT9RNiGcHt7TX6JfjmIbekyR6GcT8K6vKa5VeLSDBztm+G8OnKq6Hr7lNkve
	VM8zM/VDbxEa+wCdd0s8WqHK1Vtt5Y32/O5JVhCfucaiYY4zE=
X-Received: by 2002:a17:903:94b:b0:2bd:412:21fb with SMTP id d9443c01a7336-2bea32d03a1mr43209085ad.8.1779383312593;
        Thu, 21 May 2026 10:08:32 -0700 (PDT)
Received: from ultimate.. ([58.84.62.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea98ed6efsm16864275ad.46.2026.05.21.10.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 10:08:32 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v2] dt-bindings: clock: via,vt8500: Convert to DT Schema
Date: Thu, 21 May 2026 22:37:28 +0530
Message-ID: <20260521170810.19702-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the VIA/Wondermedia VT8500 and Wondermedia WM8xxx series SoCs clock
controller binding from the legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
Changes since v1:
- Add default value for divisor-mask
- Add required properties compatible and model
- Fix example node name
- Update example size cells and reg value

Link to v1:https://lore.kernel.org/all/20260520025131.17772-1-challauday369@gmail.com/
---
 .../bindings/clock/via,vt8500-clock.yaml      | 126 ++++++++++++++++++
 .../devicetree/bindings/clock/vt8500.txt      |  74 ----------
 2 files changed, 126 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/vt8500.txt

diff --git a/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
new file mode 100644
index 000000000000..9e19103866bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/via,vt8500-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/Wondermedia VT8500 Clock Controller
+
+maintainers:
+  - Michael Turquette <mturquette@baylibre.com>
+  - Stephen Boyd <sboyd@kernel.org>
+
+description: |
+  Clock controller bindings for VIA/Wondermedia VT8500 and Wondermedia WM8xxx
+  series SoCs.
+
+properties:
+  compatible:
+    enum:
+      - via,vt8500-pll-clock
+      - wm,wm8650-pll-clock
+      - wm,wm8750-pll-clock
+      - wm,wm8850-pll-clock
+      - via,vt8500-device-clock
+
+  reg:
+    maxItems: 1
+    description:
+      Offset of the PLL register within the PMC register space.
+
+  clocks:
+    maxItems: 1
+    description:
+      Parent reference clock.
+
+  "#clock-cells":
+    const: 0
+
+  enable-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Offset of the clock enable register within the PMC register space.
+
+  enable-bit:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 31
+    description:
+      Bit index controlling clock enable.
+
+  divisor-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Offset of the clock divisor register within the PMC register space.
+
+  divisor-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0x1f
+    description:
+      Bitmask describing the divisor field inside divisor-reg.
+
+required:
+  - compatible
+  - "#clock-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - via,vt8500-pll-clock
+            - wm,wm8650-pll-clock
+            - wm,wm8750-pll-clock
+            - wm,wm8850-pll-clock
+    then:
+      required:
+        - reg
+        - clocks
+
+  - if:
+      properties:
+        compatible:
+          const: via,vt8500-device-clock
+    then:
+      required:
+        - clocks
+      anyOf:
+        - required:
+            - enable-reg
+            - enable-bit
+        - required:
+            - divisor-reg
+
+additionalProperties: false
+
+examples:
+  - |
+    / {
+        compatible = "via,wm8650";
+        model = "Wondermedia WM8650";
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ref25: clock-25000000 {
+            compatible = "fixed-clock";
+            #clock-cells = <0>;
+            clock-frequency = <25000000>;
+        };
+
+        plla: clock@200 {
+            compatible = "wm,wm8650-pll-clock";
+            reg = <0x200 0x04>;
+            clocks = <&ref25>;
+            #clock-cells = <0>;
+        };
+
+        clksdhc: clock {
+            compatible = "via,vt8500-device-clock";
+            clocks = <&plla>;
+            divisor-reg = <0x328>;
+            divisor-mask = <0x3f>;
+            enable-reg = <0x254>;
+            enable-bit = <18>;
+            #clock-cells = <0>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/clock/vt8500.txt b/Documentation/devicetree/bindings/clock/vt8500.txt
deleted file mode 100644
index 91d71cc0314a..000000000000
--- a/Documentation/devicetree/bindings/clock/vt8500.txt
+++ /dev/null
@@ -1,74 +0,0 @@
-Device Tree Clock bindings for arch-vt8500
-
-This binding uses the common clock binding[1].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be one of the following:
-	"via,vt8500-pll-clock" - for a VT8500/WM8505 PLL clock
-	"wm,wm8650-pll-clock" - for a WM8650 PLL clock
-	"wm,wm8750-pll-clock" - for a WM8750 PLL clock
-	"wm,wm8850-pll-clock" - for a WM8850 PLL clock
-	"via,vt8500-device-clock" - for a VT/WM device clock
-
-Required properties for PLL clocks:
-- reg : shall be the control register offset from PMC base for the pll clock.
-- clocks : shall be the input parent clock phandle for the clock. This should
-	be the reference clock.
-- #clock-cells : from common clock binding; shall be set to 0.
-
-Required properties for device clocks:
-- clocks : shall be the input parent clock phandle for the clock. This should
-	be a pll output.
-- #clock-cells : from common clock binding; shall be set to 0.
-
-
-Device Clocks
-
-Device clocks are required to have one or both of the following sets of
-properties:
-
-
-Gated device clocks:
-
-Required properties:
-- enable-reg : shall be the register offset from PMC base for the enable
-	register.
-- enable-bit : shall be the bit within enable-reg to enable/disable the clock.
-
-
-Divisor device clocks:
-
-Required property:
-- divisor-reg : shall be the register offset from PMC base for the divisor
-	register.
-Optional property:
-- divisor-mask : shall be the mask for the divisor register. Defaults to 0x1f
-	if not specified.
-
-
-For example:
-
-ref25: ref25M {
-	#clock-cells = <0>;
-	compatible = "fixed-clock";
-	clock-frequency = <25000000>;
-};
-
-plla: plla {
-	#clock-cells = <0>;
-	compatible = "wm,wm8650-pll-clock";
-	clocks = <&ref25>;
-	reg = <0x200>;
-};
-
-sdhc: sdhc {
-	#clock-cells = <0>;
-	compatible = "via,vt8500-device-clock";
-	clocks = <&pllb>;
-	divisor-reg = <0x328>;
-	divisor-mask = <0x3f>;
-	enable-reg = <0x254>;
-	enable-bit = <18>;
-};
-- 
2.43.0

