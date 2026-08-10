Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8948B3AE713
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786369265; cv=none; b=f8vgjp7BW46wS8AC+hUDaVrMm6jKybGGua1oRMout1Frp2rHbTTi7z21q8jTldMctZIMJ6by6SbRk855JvQ+FT6DUK5q7ZzmlJMLLji2SY5AM7nzzZ5qn8mGr+e4fgaf/EiYDLMhUB9ZJA+Jz4OgrAxQnRj0K4D5kBkSxOjnLJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786369265; c=relaxed/simple;
	bh=LA/0a06CBcq8NIcqlOzqgEkiAtM2qgLlLDEZKX/kdjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QI0bPCYiwdMSWE+L8wBbojhN/i8gsvlFTgsxxLdoyRXGNZEqQyQaWc8VBodscUOW9T9jWj5sEzskSWPa1lVPyCaEFkv5gW6HjO7nDv0/9EzqLfiUiNI+TzAaryw8YnHcotTIXoIVAqeTjs8fkY67D30Sn1MUW2lDGnLUsN6JP1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeGLpLvO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeGLpLvO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49553515a8bso29711765e9.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786369262; x=1786974062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wtud52AlEqqFOILsKBTozTKKN+FZdgc3NBX6f/UaI+8=;
        b=aeGLpLvOAACTnrn6sx9QFKyVZURQ4xKjriYbKkjOq/gwVkelK9cAjQiZrwD63PN35k
         Xtjt3yawVAdS+kVFg/rbeK03eKwaANlAa+oLcEZyNzLWnof4LflIIq17ik77xFt8/QN+
         2ubhX7eZASKCshSClj6vcvqgGBY+OtgqxyBhihPOF4Ky+8XcT2OTGz38iuwbV1OJ1OWZ
         hIPcE6z9oG6Lr2xTp1YGcmr2fY5ZsDzoLJybInRFpk0hvVs2s+kzIfv+FmVrNzXjRTnB
         IbfeTDB81nrdUr1vw9g47AHOZzvn2Wq1n3+hAqarwJTsCA/EkZEIYPvGDzpkaGbBTqUh
         Ipzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786369262; x=1786974062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtud52AlEqqFOILsKBTozTKKN+FZdgc3NBX6f/UaI+8=;
        b=gZXPmdGEaRALRZIiG854nXyxnIsmDclFNYdnlDYOMLOOVb6gZixXZtHy7l+sYUDR5R
         SjXC6tuUfPhjreWqkDY4w9mhmxShQv2yBy5ZVLXQVPcUwZo1mIxlpHnhOBIKVDxZmUiL
         a0G4R24QZDgq2FsCj0Zhev2F1i3+TJkjFFSi9BvEVyTAzM/B5Tk8pk5yY/Y7av+HtUCU
         uqzc0+u4RIYWR1TV8RNVIBXEsweFdfi6pZI7LHNZ1V9BYvkNU05rHduFi25YHHSplC7I
         GyRJTqLm+s25TXi+WY9KJw9tECNsoDEERHEYwvAqFkofUQ0PoseGG8D7cwoFxJS1VSpc
         DxBg==
X-Forwarded-Encrypted: i=1; AHgh+RovSbx5VLPA+W7y8c4s2rfFK/tbEBVl74aVR6QiQsSNhUz1iomZZOMjEu015zSEvg6WiZM1LhCTL3ls@vger.kernel.org
X-Gm-Message-State: AOJu0YzPC+ZKSEkl+vr8VD4l7d+6BAywJfjwvjlbLQiIhOpKYfCth0MD
	Wlt+j0BDEmObNp7R32pD2I2lKwHdq+oNwZb63pyk4d6+23W5nsPniGHL
X-Gm-Gg: AR+sD11Y6IuPsD1Qh2QEfuB6AfuvGfwLfoAXMiVGGzwmP/uh6BvM8PmksggucUAd6jC
	Sf/NgGexYTJBSirb2FZZVOvzXUvQmPhbiusN9NnCttni4VR1yBK4tK0CVmvk0J49zryF0hkowj/
	S91u0v3j9gDI205MpVPglXmdsuxCxctyWfzMCnJvymh9IwH8pta+HMRPauCqq9/m10qFqf13Y2Q
	Sg66xl4QKzoVUlSQo0NF15ydnF6hZ8V7qOiyo418S1lyZawwjyG2EPM1CgUuAWKwRwqtURy9GA8
	/96Tfuc2CaYMRXnj+1+hrVLwXjdwjro0Ox+EKkTWu4983ltiPazsh0tykS4UF/VxxZhM4aDvXhf
	bB55dN68+raa6SgVBTZgRyj54rEXQq3feyTYTWlYEqMiBIU++ddyLjhKD3ese9Kq19qynbdjfu7
	sXQOuQs1Iqs1Blkk8UbmYe6dYJPgoSGgGfntRBPKzjhMtYfb1r+K6Nmxkvw8bGsL81S6zMA5q0L
	vWzKyTf0189obmrDCpGOPvuMWHQhDPzEXB49GkwCw==
X-Received: by 2002:a05:600c:354a:b0:499:726b:7375 with SMTP id 5b1f17b1804b1-499726b73c4mr29698875e9.14.1786369261351;
        Mon, 10 Aug 2026 06:41:01 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.40])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995dee21dcsm306252935e9.0.2026.08.10.06.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 06:41:00 -0700 (PDT)
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
Subject: [PATCH v3] dt-bindings: arm: omap: Convert L4 interconnect to DT schema
Date: Mon, 10 Aug 2026 13:40:51 +0000
Message-ID: <20260810134051.380538-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments OMAP L4 interconnect bus bindings
to DT schema.

During the conversion, several updates were made:
- Defined the compatible property as an array to require
  the TI-specific string first, followed by either 'simple-bus' or
  'simple-pm-bus'.
- Added a 'select' block to ensure this schema is only
  applied to TI-specific nodes, preventing duplicate
  schema warnings against the core simple-pm-bus.yaml.
- Added the L4 compatible strings used by the boards but missing from
  the text binding, and corrected the 'ti,am3-l4-wkup' typo to
  'ti,am33xx-l4-wkup'.
- Made 'reg' and 'reg-names' optional.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Changes in v3:
- Restricted additional properties to child nodes ('additionalProperties:
  type: object') and defined the '#address-cells', '#size-cells', 'clocks',
  'clock-names', 'power-domains' and 'dma-ranges' properties the L4 buses use.

Link to v2:
https://lore.kernel.org/all/20260723100540.628609-1-egbostina@gmail.com/

 .../devicetree/bindings/arm/omap/l4.txt       |  37 -----
 .../bindings/arm/omap/ti,omap-l4.yaml         | 140 ++++++++++++++++++
 2 files changed, 140 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/omap/l4.txt
 create mode 100644 Documentation/devicetree/bindings/arm/omap/ti,omap-l4.yaml

diff --git a/Documentation/devicetree/bindings/arm/omap/l4.txt b/Documentation/devicetree/bindings/arm/omap/l4.txt
deleted file mode 100644
index 6816adcdc15f..000000000000
--- a/Documentation/devicetree/bindings/arm/omap/l4.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-L4 interconnect bindings
-
-These bindings describe the OMAP SoCs L4 interconnect bus.
-
-Required properties:
-- compatible : Should be "ti,omap2-l4" for OMAP2 family l4 core bus
-	       Should be "ti,omap2-l4-wkup" for OMAP2 family l4 wkup bus
-	       Should be "ti,omap3-l4-core" for OMAP3 family l4 core bus
-	       Should be "ti,omap4-l4-cfg" for OMAP4 family l4 cfg bus
-	       Should be "ti,omap4-l4-per" for OMAP4 family l4 per bus
-	       Should be "ti,omap4-l4-wkup" for OMAP4 family l4 wkup bus
-	       Should be "ti,omap5-l4-cfg" for OMAP5 family l4 cfg bus
-	       Should be "ti,omap5-l4-wkup" for OMAP5 family l4 wkup bus
-	       Should be "ti,dra7-l4-cfg" for DRA7 family l4 cfg bus
-	       Should be "ti,dra7-l4-wkup" for DRA7 family l4 wkup bus
-	       Should be "ti,am3-l4-wkup" for AM33xx family l4 wkup bus
-	       Should be "ti,am4-l4-wkup" for AM43xx family l4 wkup bus
-- ranges : contains the IO map range for the bus
-- reg : registers link agent and interconnect agent and access protection
-- reg-names : "la" for link agent, "ia0" to "ia3" for one to three
-              interconnect agent instances, "ap" for access if it exists
-
-Examples:
-
-l4: interconnect@48000000 {
-	compatible "ti,omap4-l4-per", "simple-bus";
-	reg = <0x48000000 0x800>,
-	      <0x48000800 0x800>,
-	      <0x48001000 0x400>,
-	      <0x48001400 0x400>,
-	      <0x48001800 0x400>,
-	      <0x48001c00 0x400>;
-	reg-names = "ap", "la", "ia0", "ia1", "ia2", "ia3";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges = <0 0x48000000 0x100000>;
-};
diff --git a/Documentation/devicetree/bindings/arm/omap/ti,omap-l4.yaml b/Documentation/devicetree/bindings/arm/omap/ti,omap-l4.yaml
new file mode 100644
index 000000000000..4f3ed55ab68b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/omap/ti,omap-l4.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/omap/ti,omap-l4.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI OMAP SoCs L4 interconnect bus
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+description:
+  These bindings describe the OMAP SoCs L4 interconnect bus.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ti,omap2-l4
+          - ti,omap2-l4-wkup
+          - ti,omap3-l4-core
+          - ti,omap4-l4-abe
+          - ti,omap4-l4-cfg
+          - ti,omap4-l4-per
+          - ti,omap4-l4-wkup
+          - ti,omap5-l4-abe
+          - ti,omap5-l4-cfg
+          - ti,omap5-l4-per
+          - ti,omap5-l4-wkup
+          - ti,dra7-l4-cfg
+          - ti,dra7-l4-per1
+          - ti,dra7-l4-per2
+          - ti,dra7-l4-per3
+          - ti,dra7-l4-wkup
+          - ti,am33xx-l4-fast
+          - ti,am33xx-l4-fw
+          - ti,am33xx-l4-mpuss
+          - ti,am33xx-l4-per
+          - ti,am33xx-l4-wkup
+          - ti,am4-l4-fast
+          - ti,am4-l4-per
+          - ti,am4-l4-wkup
+          - ti,dm814-l4hs
+          - ti,dm814-l4ls
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - ti,omap2-l4
+          - ti,omap2-l4-wkup
+          - ti,omap3-l4-core
+          - ti,omap4-l4-abe
+          - ti,omap4-l4-cfg
+          - ti,omap4-l4-per
+          - ti,omap4-l4-wkup
+          - ti,omap5-l4-abe
+          - ti,omap5-l4-cfg
+          - ti,omap5-l4-per
+          - ti,omap5-l4-wkup
+          - ti,dra7-l4-cfg
+          - ti,dra7-l4-per1
+          - ti,dra7-l4-per2
+          - ti,dra7-l4-per3
+          - ti,dra7-l4-wkup
+          - ti,am33xx-l4-fast
+          - ti,am33xx-l4-fw
+          - ti,am33xx-l4-mpuss
+          - ti,am33xx-l4-per
+          - ti,am33xx-l4-wkup
+          - ti,am4-l4-fast
+          - ti,am4-l4-per
+          - ti,am4-l4-wkup
+          - ti,dm814-l4hs
+          - ti,dm814-l4ls
+      - enum:
+          - simple-bus
+          - simple-pm-bus
+
+  reg:
+    minItems: 1
+    maxItems: 6
+
+  reg-names:
+    minItems: 1
+    maxItems: 6
+    items:
+      enum:
+        - ap
+        - la
+        - ia0
+        - ia1
+        - ia2
+        - ia3
+
+  ranges: true
+
+  dma-ranges: true
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: fck
+
+  power-domains:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+required:
+  - compatible
+  - ranges
+
+additionalProperties:
+  type: object
+
+examples:
+  - |
+    bus@48000000 {
+        compatible = "ti,omap4-l4-per", "simple-bus";
+        reg = <0x48000000 0x800>,
+              <0x48000800 0x800>,
+              <0x48001000 0x400>,
+              <0x48001400 0x400>,
+              <0x48001800 0x400>,
+              <0x48001c00 0x400>;
+        reg-names = "ap", "la", "ia0", "ia1", "ia2", "ia3";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x48000000 0x100000>;
+    };
-- 
2.43.0

