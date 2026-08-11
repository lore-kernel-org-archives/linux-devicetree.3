Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B233F326B
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786452456; cv=none; b=XPR+Y45mJ2ab0Ztbxa9fsQ4620r3VRIVk8TOwmZGAZDhzGvdyUS/2aSivjQ+WLGmH068TnKPRk9ZHvLvYrmgTGFZ5z5CfklKKP3h/A6v0UKWrefHlOx33/nHmEZgwMpsobdAxTLL0Ttm4Ibz4r2dRsR6sx8LGQCBQjNp7k7v9L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786452456; c=relaxed/simple;
	bh=dHRAEbo4aUMQIiy/6DJkWDKxYmAeDO8q58abHqM7RHM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U7sjOaSfgFdrPazs0KrT/Ir5R3u0i8x5oELGUMDvFgWk6mCg/Fl6jE+c93Sj1Qk0cdSeZXW5ytFLKZRfBMSV6SVSCBkZaFWfV6BFUeCxS9VVSy5YDcSuqG0mFQfp0BUROn3KbWyv56B2BqxL5b1B6kFiGd1nERIYk/pC5y5oQj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oQqhm0Uh; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oQqhm0Uh"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-476a130c138so2862068f8f.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 05:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786452453; x=1787057253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EcSpluxem6KSuAknXHTGcr8nUevidmfU4kqJoK66tLM=;
        b=oQqhm0UhHrdnIofq2CCn0MBaB4cKKEimo1y5jn6wEPl+N2ROUgzAMzJknobPZqxTRv
         2d071FiZ3RHvHQjxlBQQ6i1UesXSt8qR3fnQp1EhT2xgr3uItQis+dGwrZX33HPOcUhL
         Z07ca6GMjVvY4QAvC6fvgX0CdAIQQimYGELbRti92RUZhN8o1Cz8BYDxSk4AfmiARiL1
         MelpBuGv3IW3vvVjBhQcIpXbZfmSsFDxCcBPeRcDr74Jf0p5Vni/2i0AroFxTWkRH9zg
         uZtK0vjRh9A9kAvnbtoCDS+1ztj2e/mVRxsUqcxmUzXM1Yb6ayZUrzzMwlMbuFcQ/tpY
         hubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786452453; x=1787057253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EcSpluxem6KSuAknXHTGcr8nUevidmfU4kqJoK66tLM=;
        b=dpmKxXD++a3OV/wH09ytCrOSoyh5S4wkczwrhB5im2dPpEJcLtvKhrmd6NnV+/2UhV
         1sYFWOZ6moG+252t6L9GokD8lalN/Ite/lInTia4kCDZeAqYkJa9XRoNnARerGqaSK17
         +di/Fz/T1y60iklrE25fQ7h0xz2UmbB6oqa493t/5WWTOcEgSjfXy9vpd/gCbdw2+dHn
         m3SziTklJtXZOo5XmaSD3ywQ3oBN1dl5rboJUX/OPWfVboEVHO5QfIHuncvQoPYIYRaG
         NwSL/8fsZcrZF+cGrJdccgx39sUshP+ZEAG8Wl3JSGOCDf3E2qbJnJmd3x7+nvN0mkli
         ZEpA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1f6ZRVqnKJenTeqdAK+dsSgH69NrlYrG2yju1X8O4onEIi9MozW3/rTlywpTbFnXbgcqjOrNSxmwi@vger.kernel.org
X-Gm-Message-State: AOJu0YwjPTrpocKQ3utnMf1sFn12/WS/R2TvqWD5bTom4/cxmXW3EZbO
	HWzY0Zveq8brbxI5Bo9GcNiKJoEIfKai0VnVmljgevE93DySKMdF2YI/
X-Gm-Gg: AR+sD13TcGhxslkPdN295bnQK74E6BBiIpQxHXIk4Odzthx+yHbBu/Z3HfTsdouTozI
	DcZqsNHQa+E3nddBYLMOtm87pnWwZL4Bp9nnYkPEOez8rQIERWlCw3MJgNx06Z5s8oLaOd/2aK0
	4YNL3qKNlVJL0kPTDmvekYMtOJPq5SkrzwwBPFwTZjiAJMqoJck1l6IG4bPnsJI9a8QEqiHeg7m
	pr8Y68Sz/vqtt5C695v7pBtIGKqJHS/TuMA+Geb+fpDC4gKgM8vQIDIZk9Iwboeh3bpyHO2tKiL
	qPvfSIYejeidqwBadmkCbk9Go+gsNqcJjHol5fBDJzx8YBvOWmS9Vc+weGHXHkgTDihVd68lim+
	WbLYjDxTQqS1chbnti4ekja0pFiIg8gcua0AOhLCeSfC1ImM69979J5kQVx/i8Ye6NlX3QzXwC9
	GZeKWitdzt0cZqVq/qmeZibC52h+EBkJ/6Goh2j8KrvRnbz0MduBKozYCfePE4XyufApNuZ0Gme
	e4ZKHL82M9+wqaVxzM/kq9qUdeVdRSY2OEWFRzYQajWmuNxZmY0DE6znFM=
X-Received: by 2002:a5d:5e85:0:b0:47f:f4a9:ff34 with SMTP id ffacd0b85a97d-4814ade7cb5mr5716045f8f.30.1786452452943;
        Tue, 11 Aug 2026 05:47:32 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4814a7165a3sm4118207f8f.26.2026.08.11.05.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:47:32 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: phy: Add documentation for Airoha AN7583 USB PHY
Date: Tue, 11 Aug 2026 14:47:22 +0200
Message-ID: <20260811124724.702467-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811124724.702467-1-ansuelsmth@gmail.com>
References: <20260811124724.702467-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for Airoha AN7583 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
always supported. The USB 3.0 mode is optional and depends on the Serdes
mode currently configured on the system for the relevant USB port.

To correctly calibrate, the USB 2.0 port require correct value in
"airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
selecting one of the 4 monitor clock for calibration (internal clock not
exposed to the system) but each port have only one of the 4 actually
connected in HW hence the correct value needs to be specified in DT
based on board and the physical port. Normally it's monitor clock 1 for
USB1 and monitor clock 2 for USB2.

To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
property is required with the phandle pointing to the correct Serdes port
provided by the SCU node. Providing the phys property is optional if USB
3.0 is not used.

The second USB PHY on Airoha AN7583 SoC is used for PCIe Gen2 usage and
similar to USB 3.0 require a phys property to configure the serdes.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/phy/airoha,an7583-usb-phy.yaml   | 205 ++++++++++++++----
 1 file changed, 168 insertions(+), 37 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
index a6e2c0b1acc4..46b311040e02 100644
--- a/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
@@ -26,64 +26,195 @@ description: >
 
 properties:
   compatible:
-    const: airoha,an7583-usb-phy
+    enum:
+      - airoha,an7583-usb-phy
+      - airoha,an7583-pcie-phy
 
   reg:
-    items:
-      - description: phy register
-      - description: ana register
-      - description: pma register
-      - description: dig register
+    minItems: 3
+    maxItems: 4
 
   reg-names:
-    itmes:
-      const: phy
-      const: ana
-      const: pma
-      const: dif
+    minItems: 3
+    maxItems: 4
 
-  usb2-phy:
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  usb3-phy:
     type: object
 
     properties:
-      reg: [0, 0x1000]
+      phys:
+        items:
+          - description: phandle to Serdes PHY
 
-    airoha,usb2-monitor-clk-sel:
-      description: Describe what oscillator across the available 4
-        should be selected for USB 2.0 Slew Rate calibration.
-      $ref: /schemas/types.yaml#/definitions/uint32
-      enum: [0, 1, 2, 3]
+      '#phy-cells':
+        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+          as defined in dt-bindings/phy/phy.h.
+        const: 1
 
-    '#phy-cells':
-      description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
-        as defined in dt-bindings/phy/phy.h.
-      const: 1
+    required:
+      - phys
+      - '#phy-cells'
 
-  usb3-phy:
+    additionalProperties: false
+
+  pcie-phy:
+    type: object
+
+    properties:
+      phys:
+        items:
+          - description: phandle to Serdes PHY
+
+      '#phy-cells':
+        description: The cell contains the mode, PHY_TYPE_PCIE or PHY_TYPE_USB3,
+          as defined in dt-bindings/phy/phy.h.
+        const: 1
+
+    required:
+      - phys
+      - '#phy-cells'
+
+    additionalProperties: false
 
-  phys:
-    items:
-      - description: phandle to Serdes PHY. Optional if USB 3.0 is not used.
+patternProperties:
+  '^usb2-phy@[0-9-a-f]+$':
+    type: object
+
+    properties:
+      reg:
+        enum: [0x0, 0x1000]
 
+      airoha,usb2-monitor-clk-sel:
+        description: Describe what oscillator across the available 4
+          should be selected for USB 2.0 Slew Rate calibration.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+
+      '#phy-cells':
+        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+          as defined in dt-bindings/phy/phy.h.
+        const: 1
+
+    required:
+      - reg
+      - airoha,usb2-monitor-clk-sel
+      - '#phy-cells'
+
+    additionalProperties: false
 
 required:
   - compatible
   - reg
-  - airoha,usb2-monitor-clk-sel
-  - '#phy-cells'
-
-additionalProperties: false
+  - reg-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: airoha,an7583-usb-phy
+
+    then:
+      properties:
+        reg:
+          items:
+            - description: phy register
+            - description: ana register
+            - description: pma register
+            - description: dig register
+
+        reg-names:
+          items:
+            - const: phy
+            - const: ana
+            - const: pma
+            - const: dig
+
+        pcie-phy: false
+
+      required:
+        - '#address-cells'
+        - '#size-cells'
+
+  - if:
+      properties:
+        compatible:
+          const: airoha,an7583-pcie-phy
+
+    then:
+      properties:
+        reg:
+          items:
+            - description: ana register
+            - description: pma register
+            - description: dig register
+
+        reg-names:
+          items:
+            - const: ana
+            - const: pma
+            - const: dig
+
+        usb3-phy: false
+
+        '#address-cells': false
+
+        '#size-cells': false
+
+      patternProperties:
+        '^usb2-phy@[0-9a-f]+$': false
+
+unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/soc/airoha,scu-ssr.h>
-
     phy@1fac0000 {
-        compatible = "airoha,an7581-usb-phy";
-        reg = <0x1fac0000 0x10000>;
+        compatible = "airoha,an7583-usb-phy";
+        reg = <0x1fac0000 0x11ff>,
+              <0x1fa6f000 0xff>,
+              <0x1fa6e000 0x3ff>,
+              <0x1fa6a000 0x8ff>;
+        reg-names = "phy", "ana", "pma", "dig";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        usb2-phy@0 {
+            reg = <0x0>;
+            airoha,usb2-monitor-clk-sel = <0>;
+
+            #phy-cells = <1>;
+        };
+
+        usb2-phy@1000 {
+            reg = <0x1000>;
+            airoha,usb2-monitor-clk-sel = <1>;
+
+            #phy-cells = <1>;
+        };
+
+        usb3-phy {
+            phys = <&serdes_phy>;
+
+            #phy-cells = <1>;
+        };
+      };
+
+    phy@1fa5f000 {
+        compatible = "airoha,an7583-pcie-phy";
+        reg = <0x1fa5f000 0xff>,
+              <0x1fa5e000 0x3ff>,
+              <0x1fa5a000 0x8ff>;
+        reg-names = "ana", "pma", "dig";
 
-        airoha,usb2-monitor-clk-sel = <1>;
-        phys = <&scu AIROHA_SCU_SERDES_USB1>;
+        pcie-phy {
+            phys = <&serdes_phy>;
 
-        #phy-cells = <1>;
+            #phy-cells = <1>;
+        };
     };
-- 
2.53.0

