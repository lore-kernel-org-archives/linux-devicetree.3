Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C54F418346
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786638854; cv=none; b=bSqdgB8bZYLTDJXWC3YEZG74UqhmrSf8ErOgyHpoIAgLAZKzAT++5CLi1xk1Ex16AqeLW6xKUJa1bN5Nd/Rsz7e8Ag/VOVEvenhg81x4l0p2TOysTQMVPUouPhp7FjFslLLm8UBERRw+EDaG8Z2NdqmQlV3A5whcTk9e+Qyl6iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786638854; c=relaxed/simple;
	bh=KybE467r2v1MOUcmEkc88VExWxzUR2AW6N1gN81j3ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XP7Boxcw3zMorY+MRMMX0GQUoS2Rc2ddFrneGZDjQEADByWWETEk/jb91wm7AKGW5eMS9Ishigz5NjhMxRFC/SlaAoFeRP8DxIxUgt3IVz24mMeJmpRJTV4bAi/GT/6Ilpliw+1vMeYMUF3xPFf1Jusy0Pxf5z0uwYltKR9vvDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsXXAyiu; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsXXAyiu"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d01548ac96so221725ad.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786638852; x=1787243652; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GVD1+XSIWN9etxd7MSlZkNE6f3T+ZdQMW52j2/SNBUI=;
        b=TsXXAyiusfkbtO36nK1HNWt4x28slUFdAVnbNxUh61KwaZNfA5xkv2NF/kWjk3Fqkx
         mjRCPmXGVBjNYxddQNNd9y0DN3QL7t/8rAF/PqTEfDGcatbBvhxsTC/3J+MGUZ68NaCE
         ph/b1sx8mziK6HkjKECxGYVwd2TWUsDx/QIcrqI1txw8RaIONbJfITu7rwa9eF7Dvet0
         JQQkdZokL+LzWmE+tZVVFjfRe/NVOEfKBGn3nwpISwfcz8bTlfpJ8FQFm6N6+JeNqIsc
         6uEpBzXt2iJgp4O3uOF6hpeFbAIcn9Xk4Nsl+ahmpkI/D0ZPeenE+v5M0YUg6phP3ooV
         gQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786638852; x=1787243652;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GVD1+XSIWN9etxd7MSlZkNE6f3T+ZdQMW52j2/SNBUI=;
        b=IE2qlocGvgwTouuuBSfFKW0cZzjCdw3KoUDgOVYEk4sDffAgF7swyDL69z5DxFlPNj
         6xH2d1MhZXk1J85t77OxVYsaQCWhzpJQbZjqX7vkIQiywHuEu3Gm2Yjvlrna3YdA7/Eg
         suQTtzl8k+rOqCzBaMVQEs+zFaLXafF3EDkJOGNMx4GtGaHusiv5XbF0bw24pF0wL62C
         OxcPgxTU8cLTtxprgTNtobpm16fKXitZ3y+lJ0Z8+G2mv4tSWISL7JiGBgogYieWfnMa
         KyydJJoWRdkuTY47ioMmIDLSG2Bj2AGNNMvIqH/NQAoBoownPgFWBDKEMCC16ebrMDAh
         7jVQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTm34sZPpvIb159RfiGpf1qR4jjG3oj4VrzghyWFzLijtudePC5Je3Yjoi+043segUZpJNaF48taC5@vger.kernel.org
X-Gm-Message-State: AOJu0YwirQI/Pt+ZHlB4HRIFZfqa07a8m89JMnmp+o8RT+XerU4/gwv5
	JQXs90Xc4yivvHsOqnyspUswcsM1lME/KcjdfP70mKXB6FMZM3ktk963
X-Gm-Gg: AR+sD12js1JTtiz/aFYRoEZTVqg8gdHyiDfCS+6GuM+geDjqAFhhPoCyWc915U/4HAa
	TwwGlHXkopBVcNBwbUEumBrYIhNh4sysEbszo4pJ5d9bpz1eZ/OWWrufZdrFvuTCm7aACLG9f0G
	wf2MMnpkk/OkxPIN7AKLo39HhT1FesAPbuDGFVXrymBY6G/V62rlKFYxfurwgBTJbyimLpcLNBA
	4cXb0WNNn3toDgv7J3RXpmW4zpERnJh4iROfdl1QNQ4+AFOeL8thNGLH2PNAp+fEQDMx0qlWheX
	WMsC/4AAR5W8s3qGM//jWWLM4CpoANVrub3XRTHv6bRZkW5mBSyYASqkZjQTx9qZ09HiCM0m5eZ
	K0RLLIeYfKe1sM9/YjROrolXS/7k7CkQkeHOOqOwHV9TuupPXZhPhdla79RRNK43ZgTSN8TU+fU
	OEhqdPhn8yI0lBD0QUOfgX3nhSHUkPj62elNKNsPzSetl39fYdmvamqLW8svoQ6UfptTnNDnFE
X-Received: by 2002:a17:903:35d0:b0:2cf:ca85:57e2 with SMTP id d9443c01a7336-2d389344e5cmr49852345ad.1.1786638852267;
        Thu, 13 Aug 2026 09:34:12 -0700 (PDT)
Received: from [10.219.45.252] ([2409:40c2:5044:2bd6:f356:6376:2cfa:e7ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d8casm10603376eec.3.2026.08.13.09.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:34:11 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 13 Aug 2026 22:03:53 +0530
Subject: [PATCH] dt-bindings: mfd: ti,keystone-devctrl: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSw5AMBRG4a3IHbuJ1iPYihiI/rghJW0jROxdY
 /gNznnIwwk8tclDDqd42W2EShMal8HOYDHRpDNdZbXKOQivuH3YLdjgHIPbuELRaKUn5KWhWB4
 Ok1z/tevf9wM0GVnYZQAAAA==
X-Change-ID: 20260813-ti-keystone-devctrl-6e49212fe35d
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786638844; l=5070;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=KybE467r2v1MOUcmEkc88VExWxzUR2AW6N1gN81j3ao=;
 b=uDBoLTKL/WyJNfH2ctuGPsUGLJgENsF6FPrEqhaeh3EVjeih0qRhPPZ9BLHHdSeLwO8XVzQpJ
 yw33URF9Ri6AR0aQAA/99mZtQCIl2Hnx5XuvSix7b9sb+0Fb/T2gwlh
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the Texas Instruments Keystone Device State Control binding from
legacy text format to DT schema.

During the conversion, the following updates were made:
- Added "simple-mfd" to the allowed compatible strings.
- Enforced child bus properties (#address-cells, #size-cells, and ranges)
  to be required only when the "simple-mfd" compatible is present.
- Added patternProperties definitions to validate standard child nodes
- Updated the examples to demonstrate simple-mfd parent usage and updated
  node names to conform with standard Devicetree specifications.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Note:
Running dt_binding_check on patch will yield a warning for
'ti,keystone-reset' in the example block. The YAML conversion patch
for that child node is already in progress here:
https://lore.kernel.org/linux-devicetree/20260813-ti-keystone-reset-v1-1-189389503324@gmail.com/
---
 .../bindings/mfd/ti,keystone-devctrl.yaml          | 105 +++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           |  19 ----
 2 files changed, 105 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
new file mode 100644
index 000000000000..33a72c290fb1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,keystone-devctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments Keystone Device State Control
+
+maintainers:
+  - Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
+
+description:
+  The Keystone II devices have a set of registers that are used to control the
+  status of its peripherals. This node is intended to allow access to this
+  functionality.
+
+properties:
+  compatible:
+    minItems: 2
+    items:
+      - const: ti,keystone-devctrl
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^keystone_dsp_gpio@[0-9a-f]+$":
+    type: object
+    description: Keystone DSP GPIO controller
+
+  "^keystone_irq@[0-9a-f]+$":
+    type: object
+    description: Keystone DSP to ARM interrupt controller
+
+  "^reset-controller@[0-9a-f]+$":
+    type: object
+    description: Keystone reset controller
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: simple-mfd
+    then:
+      required:
+        - "#address-cells"
+        - "#size-cells"
+        - ranges
+    else:
+      properties:
+        "#address-cells": false
+        "#size-cells": false
+        ranges: false
+
+additionalProperties: false
+
+examples:
+  - |
+    device-state-control@2620000 {
+        compatible = "ti,keystone-devctrl", "syscon";
+        reg = <0x02620000 0x1000>;
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    device-state-control@2620000 {
+        compatible = "ti,keystone-devctrl", "syscon", "simple-mfd";
+        reg = <0x02620000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x02620000 0x1000>;
+
+        keystone_irq@2a0 {
+            compatible = "ti,keystone-irq";
+            reg = <0x2a0 0x4>;
+            interrupts = <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
+            interrupt-controller;
+            #interrupt-cells = <1>;
+            ti,syscon-dev = <&devctrl 0x2a0>;
+        };
+
+        reset-controller@328 {
+            compatible = "ti,keystone-reset";
+            reg = <0x328 0x10>;
+            ti,syscon-pll = <&pllctrl 0xe4>;
+            ti,syscon-dev = <&devctrl 0x328>;
+            ti,wdt-list = <0>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt b/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt
deleted file mode 100644
index 71a1f5963936..000000000000
--- a/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-* Device tree bindings for Texas Instruments keystone device state control
-
-The Keystone II devices have a set of registers that are used to control
-the status of its peripherals. This node is intended to allow access to
-this functionality.
-
-Required properties:
-
-- compatible:		"ti,keystone-devctrl", "syscon"
-
-- reg:			contains offset/length value for device state control
-			registers space.
-
-Example:
-
-devctrl: device-state-control@02620000 {
-	compatible = "ti,keystone-devctrl", "syscon";
-	reg = <0x02620000 0x1000>;
-};

---
base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
change-id: 20260813-ti-keystone-devctrl-6e49212fe35d

Best regards,
-- 
Bhargav

