Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF6A3911AB
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 10:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960947; cv=none; b=EW81TjNSunddVe0UJO4THMF2vxz4l4LIuQPvEnDjQ6gobEruAPsC3OLxMvyDMC1Zb6OgiwP1LBmYwwiZ3fU9hNS/t5ybRGE8tZCFJIJy8UrkhrBD4bvozIKrK4258oBjlGo5fHg+nYkXDRL9je5vP3UkRKZsV5SKQj9xX7IQFcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960947; c=relaxed/simple;
	bh=Q2h113tVKecw0OrZU44B+Jd0YxaZaCLGYBCZpmNBfUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SLFq7efR/NUHys8QXrbgo2+M3/bagzP813uVSgBiv/UiuGZnoWMvyr24o3ffvAIZC2nYZVOHBBfnQv1TEO7XdzTW08TVO6r6yfti/WSWDnbloxGZ/VbqPvhCs2RqLS3quo4KV2d0Yjxo/qQ6iGENE6OHvzsWFgJTRn8CFCCfjjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oii8hYzq; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oii8hYzq"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so2073708f8f.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 03:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786960933; x=1787565733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqJEqlY84oD9PFP/pbIju8kV6td9uIw0KsaaeOaBMEE=;
        b=Oii8hYzqGi5mrNjk17CdhQ9T5VtMGrMkQfsIL4iX0hW/NydnOQlmCWxtzXLIthVKUz
         VQgQZZS1JNPwGQYgDe9pPP4vAv2dmfpvybF9OXRPx+QxGo6UKltNsd198yzwufhYOwCY
         XF41Ymrd7JWb+c0GlaGt0qr4OS2D6mUPolj/MOEWKOy6l33FdCD5v3Qg/s2g4Z7f3k8X
         VzXmLgntJjMLrjOO3bUvVufVtO+v1mWgZfMn/xCvI/8Qsz7LlEHCyJYYFKplIe5n/gZy
         CEQzUpjsN8/sS061a5CtGa5GkmFRrM+m1U+wEgOMfGdhrEwcq4d80nZn3UBOPa0wChF/
         TocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786960933; x=1787565733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqJEqlY84oD9PFP/pbIju8kV6td9uIw0KsaaeOaBMEE=;
        b=XOd1TrZLaRjUYiESBcBIg9WT3vLbC0W27Hg51fICY3ww0Hn6YJuRmcB90COwEZdUVo
         ieYMYUpSP6R9/XF4Yh3EFBSVePIIcxZxMjlVIF++xYC4KvIG2bryysF499W+kj518uNx
         ARsfeoGuimuvH/bFjUg8VWni09+3ZIJPCmjTDcyWsWL7ER/rAsHiFpVaGhD1uza0lQej
         scthKd3Jdy+H+ktoVwXQP7d2CMyor4nSNKa2SnwacKPwDmLNsj52Vh4HlIzc7xDU1MAA
         glaV67rTBrLVh9xLNZo1uqh48Qbp2G4k8iGUZdwNwBrxSQa18exr3ahWct2kTrdAhwxa
         PM4w==
X-Forwarded-Encrypted: i=1; AHgh+RqAij35ZpDINZCzyKydCLg/jJXMWMSsWCHBhOItlN8jdfST5lUQU4cFhjR3i1kbBNdoBjlm2YzLc0zl@vger.kernel.org
X-Gm-Message-State: AOJu0YyOFYfoBvXBk7iR6rGjGYLbYYHLATNFoPIxlH52mh1atxXf8tWm
	/FcfE0IMaAp7DwIew4lbEo43/7U8xWtDroawO42rVO0sZobHOxY/Mu+B
X-Gm-Gg: AR+sD13iHcpqoEXqN+hU5sFX3FD5fZQxH5orH4Em/kK2dCqWMUgSwylXdfGfHFkAVgw
	tp4s6e+i50WfznkvbvSJai3DpVgclP5ekxX9MeAntkC+uTPKd3D693NlZWhUAAsWJHaT5e0gi3m
	6T7YaUpLwyT6OErRHUWkHo2lkcIJVeYnEGZmq2Ba485QMy1MX6lwZEIifGMkhLSZKqtTn4CyZar
	Gwjogu5EHKVL2IKTUc75AMeilkizyzxgnG5hWorcrIlbJzK1or9NOONEjqKvz5AMusj0+K7zNEv
	Gt7hISwKwYZ72eAq8AzY3OFVkv5cXH5A7GV6lmgZ7X23TZ8GRbWcQskar0wBeQ+TIlHO/ogWlWh
	8AFExqEBezUV6gEwv8dfn5O9h7GwbkHV1rOUPzrtLQnU8nn/Nt+C6FsLU+LRCMnZ5wNJhFUsZNm
	x5HhBCFvMC1RzQ+3qR2TO1LPnlTGeDQooBSbXTdcaxdQOPNdeLs4mm9s/+SvdwlgmSdG/vtEnWu
	y5nfWTMs1nInYab8KfNoZmrYkLPiO4=
X-Received: by 2002:a05:600c:4713:b0:499:93b3:91ea with SMTP id 5b1f17b1804b1-49993b395f5mr174213035e9.15.1786960932454;
        Mon, 17 Aug 2026 03:02:12 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.242])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999610ed6dsm170661445e9.8.2026.08.17.03.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:02:11 -0700 (PDT)
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
Subject: [PATCH v3] dt-bindings: mfd: Convert TI TWL6040 to DT schema
Date: Mon, 17 Aug 2026 10:02:07 +0000
Message-ID: <20260817100207.2970303-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments TWL6040 audio codecs family bindings to DT
schema.

During the conversion, the following updates were made:
- Changed 'twl6040,audpwron-gpio' to 'ti,audpwron-gpio', which was
  misnamed in the old txt binding.
- Made 'gpio-controller', '#gpio-cells', and 'ti,audpwron-gpio' optional
  because modern platforms do not require them.
- Renamed the vibra 'vddvibl_uV'/'vddvibr_uV' properties to
  'ti,vddvibl-uV'/'ti,vddvibr-uV', the names actually read by the
  twl6040-vibra driver.
- Required 'vddvibl-supply' and 'vddvibr-supply' when the 'vibra' child
  node is present, since the twl6040-vibra driver unconditionally
  requests both.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Changes in v3:
- Required 'vddvibl-supply' and 'vddvibr-supply' when the 'vibra' child
  node is present, since the twl6040-vibra driver requests both
  unconditionally.

Link to v2: https://lore.kernel.org/all/20260816092847.2522994-1-egbostina@gmail.com/
Link to v1: https://lore.kernel.org/all/20260815083451.2147129-1-egbostina@gmail.com/

 .../devicetree/bindings/mfd/ti,twl6040.yaml   | 151 ++++++++++++++++++
 .../devicetree/bindings/mfd/twl6040.txt       |  67 --------
 2 files changed, 151 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/twl6040.txt

diff --git a/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
new file mode 100644
index 000000000000..0d4e620d25a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TWL6040 family audio codec
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+description:
+  The TWL6040s are 8-channel high quality low-power audio codecs providing
+  audio, vibra and GPO functionality on OMAP4+ platforms. They are connected
+  to the host processor via i2c for commands, McPDM for audio data and
+  commands.
+
+properties:
+  compatible:
+    enum:
+      - ti,twl6040
+      - ti,twl6041
+
+  reg:
+    const: 0x4b
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 1
+
+  "#clock-cells":
+    const: 0
+
+  ti,audpwron-gpio:
+    maxItems: 1
+    description: Power on GPIO line for the twl6040
+
+  vio-supply:
+    description: Regulator for the twl6040 VIO supply
+
+  v2v1-supply:
+    description: Regulator for the twl6040 V2V1 supply
+
+  enable-active-high:
+    type: boolean
+    description: To power on the twl6040 during boot.
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum:
+        - clk32k
+        - mclk
+
+  vddvibl-supply:
+    description: Regulator for the left vibra motor
+
+  vddvibr-supply:
+    description: Regulator for the right vibra motor
+
+  vibra:
+    type: object
+    additionalProperties: false
+    properties:
+      ti,vibldrv-res:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Resistance parameter for left driver
+      ti,vibrdrv-res:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Resistance parameter for right driver
+      ti,viblmotor-res:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Resistance parameter for left motor
+      ti,vibrmotor-res:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Resistance parameter for right motor
+      ti,vddvibl-uV:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: vddvibl default voltage if it needs to be changed
+      ti,vddvibr-uV:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: vddvibr default voltage if it needs to be changed
+
+    required:
+      - ti,vibldrv-res
+      - ti,vibrdrv-res
+      - ti,viblmotor-res
+      - ti,vibrmotor-res
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#clock-cells"
+  - vio-supply
+  - v2v1-supply
+
+allOf:
+  - if:
+      required:
+        - vibra
+    then:
+      required:
+        - vddvibl-supply
+        - vddvibr-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@4b {
+            compatible = "ti,twl6040";
+            reg = <0x4b>;
+            interrupts = <0 119 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-parent = <&gic>;
+            gpio-controller;
+            #gpio-cells = <1>;
+            #clock-cells = <0>;
+            ti,audpwron-gpio = <&gpio4 31 0>;
+
+            vio-supply = <&v1v8>;
+            v2v1-supply = <&v2v1>;
+            enable-active-high;
+
+            /* regulators for vibra motor */
+            vddvibl-supply = <&vbat>;
+            vddvibr-supply = <&vbat>;
+
+            vibra {
+                ti,vibldrv-res = <8>;
+                ti,vibrdrv-res = <3>;
+                ti,viblmotor-res = <10>;
+                ti,vibrmotor-res = <10>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/twl6040.txt b/Documentation/devicetree/bindings/mfd/twl6040.txt
deleted file mode 100644
index dfd8683ede0c..000000000000
--- a/Documentation/devicetree/bindings/mfd/twl6040.txt
+++ /dev/null
@@ -1,67 +0,0 @@
-Texas Instruments TWL6040 family
-
-The TWL6040s are 8-channel high quality low-power audio codecs providing audio,
-vibra and GPO functionality on OMAP4+ platforms.
-They are connected to the host processor via i2c for commands, McPDM for audio
-data and commands.
-
-Required properties:
-- compatible : "ti,twl6040" for twl6040, "ti,twl6041" for twl6041
-- reg: must be 0x4b for i2c address
-- interrupts: twl6040 has one interrupt line connecteded to the main SoC
-- gpio-controller:
-- #gpio-cells = <1>: twl6040 provides GPO lines.
-- #clock-cells = <0>; twl6040 is a provider of pdmclk which is used by McPDM
-- twl6040,audpwron-gpio: Power on GPIO line for the twl6040
-
-- vio-supply: Regulator for the twl6040 VIO supply
-- v2v1-supply: Regulator for the twl6040 V2V1 supply
-
-Optional properties, nodes:
-- enable-active-high: To power on the twl6040 during boot.
-- clocks: phandle to the clk32k and/or to mclk clock provider
-- clock-names: Must be "clk32k" for the 32K clock and "mclk" for the MCLK.
-
-Vibra functionality
-Required properties:
-- vddvibl-supply: Regulator for the left vibra motor
-- vddvibr-supply: Regulator for the right vibra motor
-- vibra { }: Configuration section for vibra parameters containing the following
-	     properties:
-- ti,vibldrv-res: Resistance parameter for left driver
-- ti,vibrdrv-res: Resistance parameter for right driver
-- ti,viblmotor-res: Resistance parameter for left motor
-- ti,viblmotor-res: Resistance parameter for right motor
-
-Optional properties within vibra { } section:
-- vddvibl_uV: If the vddvibl default voltage need to be changed
-- vddvibr_uV: If the vddvibr default voltage need to be changed
-
-Example:
-&i2c1 {
-	twl6040: twl@4b {
-		compatible = "ti,twl6040";
-
-		interrupts = <0 119 4>;
-		interrupt-parent = <&gic>;
-		twl6040,audpwron-gpio = <&gpio4 31 0>;
-
-		vio-supply = <&v1v8>;
-		v2v1-supply = <&v2v1>;
-		enable-active-high;
-
-		/* regulators for vibra motor */
-		vddvibl-supply = <&vbat>;
-		vddvibr-supply = <&vbat>;
-
-		vibra {
-			/* Vibra driver, motor resistance parameters */
-			ti,vibldrv-res = <8>;
-			ti,vibrdrv-res = <3>;
-			ti,viblmotor-res = <10>;
-			ti,vibrmotor-res = <10>;
-		};
-	};
-};
-
-/include/ "twl6040.dtsi"
-- 
2.43.0

