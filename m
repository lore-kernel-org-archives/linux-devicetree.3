Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E334C3546E9
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 17:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780247471; cv=none; b=h1ykMKtSYQm/BqxwpD0hY93zwKzCQg/mUN2K5jFkSd4JL7CVqoDm2dGqibuLTYwQtT6jl64kMUBk8jfLq13gvAvuXhP6DukwDOXviS/kzlmzXvr75BSMH4VZVZAlbeaeS2WXOAVoV9jfq+vbeWAn9CHdy91CJafFhOGgoFs9Gr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780247471; c=relaxed/simple;
	bh=zZmnDGXA0rjd7t+4m0wzAeMbNljHZ9els6ULfCQTEQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YbkK+pkCxWqfHNs+UNUo6l1QfXmg8cHrbPchanucGuj+h0i0gZk44o5Z2tNd2jycOduvcrWT4ZxqmAf5fCIuM/jP8yJYfvtqe8fVpfOHFhRL8JgxA0X0Kvt6RYbfx7+xlPS1tsYYIjWZjnZIHjWQ3TPh6HpA4eif0dFBAS6DOAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+LpNkFU; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+LpNkFU"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c858b5de728so688283a12.0
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 10:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780247469; x=1780852269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ws/VbADK0GzMeGV08WlLARgSCxKJf8L/Iez7FqjR8aU=;
        b=c+LpNkFUTMY5gRKY83Hs6iuVyqvdQu6ttgfJZjY/HrcNKfuqrPSk6XupNNoJspZl6g
         EPVBrk1KqH8UhrcvDKh9A41fMt9mU7XBRFXPX3XEEcT6IQweVktOS48hI/Z6iNiXfSm4
         UW+kzAdueAqn3QYCxo/RECAwOtCUHa2C/RWztBoRJ0ksU35kXdqrbBPh5A9mOrEgOTAB
         yqRTrrcRPremi4whR+lWXTuQmvqVAe0LPjopa7N/IwuZLsttPwwBfX/7fshE1Og1tNrc
         jiRKCDAUanzr6R7TG5DVr5uhZPswUs57hwbkCAi6H14SlZjuOZqhYwN06SY8DMVmW8qG
         bbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780247469; x=1780852269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ws/VbADK0GzMeGV08WlLARgSCxKJf8L/Iez7FqjR8aU=;
        b=rwMQWV6LAu3rwWoi4Nm0Tt9dKhJVQ99WiQBt5L9MPP+uEVXVAP+PFQ3U7sTotdVUX9
         96dmRqEe7yZ0JChPvu28MaCACL3qqgyxeivbETZzYbyf85JGtPxuOx62Ni3LbL2ygrtY
         cRkUvBvLG/ol5lF7bvvjs4y5BSQxrdWQfKug7qiqgCs7pNLR7bUJLjZFpfZf8aw4mx0l
         5URQUfaIchwJ0qlER9liRwKqtrG+UMkXoouC3U1apbBWtcsGQRqIHauaPe325RH/kzM6
         0sW83YmN3x8JX4SYoKfhCWlOgtYugCl4gRrTlhZVkkM6thRZNQmk8jGWVOkOKVXhpUcN
         Fx6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/bq9ORt3Fm66XI1RfRQOuDAK0Z5DDiVf+pfKydmX7z0bv81tsXHB7rHQfZgMbz0b1CM69Zqk54hp+G@vger.kernel.org
X-Gm-Message-State: AOJu0YwsrR/OjSHoVSeOyDM4WBbfnUt5gTiH44tzBgNhjb/3tXF4EGg3
	KDadW+66QqyPMC5hT6iN4RdmATWdheCSQ/3Pw1bvNXPL8zrgXRl85SSS
X-Gm-Gg: Acq92OFDdMkGckHs0w8gey0yJed7q4jBcof3dNwIHGfh6gUp2fUgEvZJ+rxiNy2l+Q5
	AHiwa6OZ9jUBKR0bCEcZ3s6ilroFcMLfRC2dod73wdFSQb3ZUe/m1H/f6zTA0fPuUgWT38XY3Xd
	23rwTlrHfZM12SLrZ4xNriZ2U5rS6wqQDFPS14PjG0T0Z5lLoiuasV4QFKFJKAmGx8Fr/S8iZ2C
	BiEifeoMJU1XIGHQD9j61J7S5YmTnHVPOhR9chJ2XC/31T9sHIgwAcfoVyL2cpdj6fG9DuJZTJQ
	FvM9mXJid0B3njpGLCHVkzCHl9X3ytE5qON757g66s0ph9YmumU3hOS8QIzVK2DxSsWocCbkH1w
	OunvTG2JKq2gxyJktB2yAXE9/oCJiLrSRZEzBkTa0TSQ3nci5T/+AJ0KQK3c60gU2WRwCSIs9bQ
	VIyP7Nvh5qVz7oB+DBVfTyIv184q3hK74p5jC6qDr6pWFcKNO8bSqIdoz2T4gS
X-Received: by 2002:a05:6300:2204:b0:3b3:26aa:5462 with SMTP id adf61e73a8af0-3b427c15679mr8366825637.5.1780247468937;
        Sun, 31 May 2026 10:11:08 -0700 (PDT)
Received: from ultimate.. ([49.204.165.28])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85770b9e2esm7565285a12.0.2026.05.31.10.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 10:11:08 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: alchark@gmail.com,
	krzk@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v5] dt-bindings: clock: via,vt8500: Convert to DT Schema
Date: Sun, 31 May 2026 22:39:55 +0530
Message-ID: <20260531171041.4149-1-challauday369@gmail.com>
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
Changes since v4:
- Remove schema select matching for via,vt8500-pmc
- Add dependentRequired validation for divisor-mask
- Fix maintainers list
- Add reg false condition for device clock
- Fix example validation against clocks child node

Link to v4:https://lore.kernel.org/all/20260524151110.21277-1-challauday369@gmail.com/

Changes since v3:
- Add schema select matching for via,vt8500-pmc
- Allow hyphen in node names under patternProperties
- Add dependentRequired validation for enable-reg/enable-bit
- Fix example validation against PMC schema

Link to v3:https://lore.kernel.org/all/20260524111813.39810-1-challauday369@gmail.com/

Changes since v2:
- Drop redundant description for clocks
- Disable reg property for device clocks
- Fix schema hierarchy to match actual DTS structure

Link to v2:https://lore.kernel.org/all/20260521170810.19702-1-challauday369@gmail.com/

Changes since v1:
- Add default value for divisor-mask
- Add required properties compatible and model
- Fix example node name
- Update example size cells and reg value

Link to v1:https://lore.kernel.org/all/20260520025131.17772-1-challauday369@gmail.com/
---
 .../bindings/clock/via,vt8500-clock.yaml      | 133 ++++++++++++++++++
 .../devicetree/bindings/clock/vt8500.txt      |  74 ----------
 2 files changed, 133 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/vt8500.txt

diff --git a/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
new file mode 100644
index 000000000000..e2e674d95654
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/via,vt8500-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/Wondermedia VT8500 Clock Controller
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description:
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
+    description: Offset of the PLL register within the PMC register space.
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    maxItems: 1
+
+  enable-reg:
+    description: Offset of the clock enable register within the PMC register space.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  enable-bit:
+    description: Bit index controlling clock enable.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 31
+
+  divisor-reg:
+    description: Offset of the clock divisor register within the PMC register space.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  divisor-mask:
+    description: Bitmask describing the divisor field inside divisor-reg.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0x1f
+
+required:
+  - compatible
+  - clocks
+  - "#clock-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: via,vt8500-device-clock
+    then:
+      properties:
+        reg: false
+      anyOf:
+        - required:
+            - enable-reg
+            - enable-bit
+        - required:
+            - divisor-reg
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
+
+dependentRequired:
+  enable-reg:
+    - enable-bit
+  enable-bit:
+    - enable-reg
+  divisor-mask:
+    - divisor-reg
+
+additionalProperties: false
+
+examples:
+  - |
+    clocks {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ref25: clock-25000000 {
+            compatible = "fixed-clock";
+            clock-frequency = <25000000>;
+            #clock-cells = <0>;
+        };
+
+        plla: clock@200 {
+            compatible = "wm,wm8650-pll-clock";
+            reg = <0x200>;
+            clocks = <&ref25>;
+            #clock-cells = <0>;
+        };
+
+        pllb: clock@204 {
+            compatible = "wm,wm8650-pll-clock";
+            reg = <0x204>;
+            clocks = <&ref25>;
+            #clock-cells = <0>;
+        };
+
+        clksdhc: sdhc {
+            compatible = "via,vt8500-device-clock";
+            clocks = <&pllb>;
+            #clock-cells = <0>;
+            divisor-reg = <0x328>;
+            divisor-mask = <0x3f>;
+            enable-reg = <0x254>;
+            enable-bit = <18>;
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

