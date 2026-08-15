Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7923837DEBA
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 08:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786782900; cv=none; b=QGOlfTwxDgklEMwZgBw0r0e0yotO8L8utL16BkShFU5F7uVFRXAMiOk/eAwKRd75i+4XZyvozBBzRC9eLdhmfYMwfd5Uv7C91ULVhRnZvGYFhs8N1pnksVQtsC1Sc2pcqs8mLxVndA/joXZZardzpH52VRtlTGnAhp4IVldwC6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786782900; c=relaxed/simple;
	bh=m6g2XUJeHF1PIlSodfI1hjH2eJL9yELjoJ2ytDpo5Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sJVKBNXrj2/ZgYXpxDZJeM7AnEUpCoBUPdLw9931R7dTkHO9sg9cCogITD9R0hxjYqPpeR/+VTDs0oCLJPsxJzf8+2vRfFbTdjdTa8PerrNlQ+Y0fC57UsZbAQcf8qIxYHIhL0sEHkvRoA8rHcd3ETouXorAeEA8Ci5+x1V55rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzijwEgB; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzijwEgB"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso851670f8f.0
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 01:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786782896; x=1787387696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pzGpX7JiK+m5ce9c9KT1xWR6DUie8OR3CMeaDAX9MSE=;
        b=GzijwEgBqjXYfr08cSHRQ/7ogHuHmoWkBtt8/DmhbCaMtX7Vgyo3s+Ap1q+z8LDDa+
         Fho7m/sZoLMyfMmbdqezyCaaJBgnk3yFBdCq/bdPPaoCdb5ueyDG+0j09+CsaFzdO6uM
         L/q3/7XwdU0yzdLyrhV6nW+OnCv00eM3z4HkaOC6Hz3rMQ9g+ejWLdrqjiVEEDtLH3nu
         NAwIzWi4CVxpxT4KoEmikR2bIzZ/eYFF9wZXBkf20+XOxwotg0gn2hvS2yVay0Bfp67c
         7n4tqXxHHYj+pSKV6jHP67Um//g/Silet3ZF5RgIck0BHkCoLCkIxB58ke+O7ZHoxucj
         LXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786782896; x=1787387696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzGpX7JiK+m5ce9c9KT1xWR6DUie8OR3CMeaDAX9MSE=;
        b=lJUCrmHaQ+WEXoQaNml/vYhiaW53oTqRvse2g+96aBrMDTja3AYZkFTDXCVbKwQZWW
         SiBX01QshEMoSDDoymu7NZMBPgCEdSOAUj4QxqQffvZAmEUrAhissf6LTekVtMYFD16e
         bklkPVq5IeBz0ckzWs07p+O6ZTSKwiK2Bf0jgVrC7EHQrJyRf5b0OvBh0AYnDsEyfBlw
         g6NN2MRY0zLxjP5YgoBQ6904ha8CXaXmMw6pwhdURpwawuXDS7fu6HxgsQI8sFUTEmN1
         b4vhHlFahK+kb5bWho152WIf9WGK1MNPrHv0IO8E2nxvehusbni0RJo5HGJTb+mjPemJ
         LYhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpH+gcctwM4AYQ5rHey/Rg3Q3LH/bvgLx0JeCVa9O4AVyWSQgV8MuC8vYYi//G3plA08WxS7CbXGmR@vger.kernel.org
X-Gm-Message-State: AOJu0YywQCDiUcNZZke9KAliV4ytzQS9CJxi07/25hu0kE8uymGKmdaC
	064VljQF9oS1GuUAxDMi6NJmOjbxSEFXdSjWFSV1ptwJGr3iIIo+Uajf
X-Gm-Gg: AR+sD11Nyd6jRUWDErcfRQY77fpvbnRoD1GsYMOz2rL55S/gMhf1NPE3FVAHdhZvAPh
	OTzH7UhxeXyWgquNhv6FdvWQjlTa6dHUdqOuFknv1aqSmUloB1CiJ7+hyrDMyL+UHULF1yXGBjB
	6tTmo7+K6vYQl+EyJI6iVDfcOgL/vaxg7HeSafnz8hZxAS1QeQBEiUqEj1p6rfhGO+eV3D/vJt9
	AfN93NG8RtUu5Ce3ADGtodxeV1c9uSeFECkqEGDqAwa8q3IGntO3AkV22HANqOMsDIJ2gpQjSW1
	xUucTmLnULixHENndt7G54FRBTcuTyyIhywmdRLxjb13+G+rqq06F4ybDZgVbyexyb/AoTSW6yQ
	hMGTV/sZ0FmMIxshjTT3VQvMylae4DA2hFe7aA9ZkmVpznoN+ZS2gwO1MR2323dE24CaP+OdHm7
	1yfu4IX36gSHLE7z1sNsJXrEsv9RN6Itxs60iopIn+RSSaj+zmOghKI1HttbHaJUhYfKz3dYMt9
	bggUI1j+9XA0NkxSesGEK0BIHDAizo=
X-Received: by 2002:a5d:5303:0:b0:47f:8802:c182 with SMTP id ffacd0b85a97d-481607a3329mr13321970f8f.29.1786782895668;
        Sat, 15 Aug 2026 01:34:55 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.242])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4815f2005b0sm16295848f8f.8.2026.08.15.01.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 01:34:55 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: mfd: Convert TI TWL6040 to DT schema
Date: Sat, 15 Aug 2026 08:34:51 +0000
Message-ID: <20260815083451.2147129-1-egbostina@gmail.com>
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

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/mfd/ti,twl6040.yaml   | 142 ++++++++++++++++++
 .../devicetree/bindings/mfd/twl6040.txt       |  67 ---------
 2 files changed, 142 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/twl6040.txt

diff --git a/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
new file mode 100644
index 000000000000..a93835aa9153
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
@@ -0,0 +1,142 @@
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
+      vddvibl_uV:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: vddvibl default voltage if it needs to be changed
+      vddvibr_uV:
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

