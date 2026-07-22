Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CF8466AE8
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738791; cv=none; b=SuPaq0D5dA8iWI4FtGzbdzI6AFwM+YdamWMKcdEvK7orlblTy6nVhMYL/sO0PJlwznHPA1b3XzXL61wR3UfP8bQOmtrUFXlq76iAhZi0kwC0rzuNEfenuS4MPyfGIlrIQeWUZXw3qDwU5MV8r35is7urPB1XnNI++gvEr9k/+ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738791; c=relaxed/simple;
	bh=vbUaQgLr8MujYHQ5b5L4HHRWyH6HlD6i/56H/NwdBJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Cu2sTah0MU4IQzvEx4ACLFDtHs52R8lrV4AxalDtdkBIKtgaP72k/Tf8i12xutEexJxvZFBf6YQTkRoI52RTuwa41H7qDFYQbi+WCKDVamjHRB/+TUin+35yMyhzQQj40xK6MJ/Vc++rs+jSpugQrLYmuqRVaYAb6s9Uzzfmo50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHzi2CiE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHzi2CiE"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cecc8a3dbfso78965ad.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784738779; x=1785343579; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ApRmu0hV+edA5zoSd0iaFk7vC5Xw6Ixw9nitS/yb1RY=;
        b=ZHzi2CiE1/64qqDMlsUpwOMG819T8JFLfKO6O9zILkfkrtGZjl8jOTqCFi/rxBFIQy
         7Og7yaf27dAVOujUX9JNMO9NTf9eqJvDseDxajc8Y+u7NCmO5BU07jWd627i14/dNhAl
         RpsbWZr5LPtNS60rC8s2qpggyNJWmitiNlnaee1APUni91E73BXojcgskzNj3YFDlVZb
         ih2XLiCNlZ3QkBPyHAbMGzN+Yu75V1IB6gGko7L+wyrdHsXrqDdpByGLZHt77ImEYl7C
         2ZfW9z5usxfu93KvYJGdWiRytn3OfP/wcrZ4NCqU8Z3hxs3HkLMKoqu7+xHV8YGfPGSm
         VYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784738779; x=1785343579;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ApRmu0hV+edA5zoSd0iaFk7vC5Xw6Ixw9nitS/yb1RY=;
        b=KJkkU7YKBZqDlGl/U2+vzm6Thu7HrNKFnIatrcNWWwWaqK23L4RZ0V/1y5+KOO1TYz
         JT3e4fNbaLrrT/Hvc1oz3wX9bo+J1EFh5Su149wppIjVbharzTv3as1oihyxAj/kkOHC
         zVk0VeZBBfx6tqA/AdYUDYHzGMZwueDL8tGwjPP9FKqOFmoWyv6skEctOJ6t1+nOYn/t
         25H9SWJCywSW2HmUglRWkf3rjzfGgDeqbFJodewD2uEMHsbGV9ug23wUZlVlXlzAB+ZP
         IL6OzCBZpQqC7KWcEbAe0imVU2vI5e+g3w4q3/NxAJVUp6C6vFqm5nH9US0SZ0Jobndq
         omuQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0l0Utpyaey3Dse0OTzXdXsmhnmW2DvIx7LiaGZ0HPwFidPakhwZhAoqghvdmAbJRvGp5Huf44Ho8J@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ2T0qJKOIrOE7j8S9xDLOnqz09m/tvt+P0QBuCHTvvQQ44tK6
	iN0SducbmySxPmGbv5cc6r6ipgXanOxr94NRyQUJwtgQpayk/rOgF56f
X-Gm-Gg: AR+sD12/UG2k+PyXEE44BCm2OP+3e9RD9hbj+EYUvpbmssjwIKeGv2eRL+l9KdNZYke
	/5ihoPJCb+owaIewGdFf7WOUZoPc8lwf/YSNhSvV/WY9jf74Uvio+3/6wfNUPcjJW4SRBtQcH5n
	j3Mof6Mj5p1xBBq5bAPW2J6XRJoBeTZgXZ2XIPVyho3CFmc2g6ZfS7AxG1jxmrwg4P9CyqVPFxV
	lD7IUYU3uwBPh7c4mVLRLl/hG+P6MFalTFHocL12u8WG6+QsOoKMulyKvKVQyJf52X81AOdIgJl
	mVYSWtenq5aJ2FWmHhuxK6xwTZaPxh0BCAZpcXd4g1Xv/NjBvQlrNXC5KpSj0SYjBKNA1lAPGkb
	LGVQiBhAUDT4GJm3rSt5EXsB6Mw7Orr5bq5Y0gI+lGdm0AvmLvdoVxILBYhl4/kE8G5mc5w9/Bs
	1M1o4fl0ZAl8XM70A=
X-Received: by 2002:a17:90b:390b:b0:37f:fc3a:382d with SMTP id 98e67ed59e1d1-38e92a12cf3mr7370793a91.6.1784738779007;
        Wed, 22 Jul 2026 09:46:19 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5428:2944:6b74:18c8:3132:3887])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d12f267fdsm8075300c88.0.2026.07.22.09.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:46:18 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 22 Jul 2026 22:15:54 +0530
Subject: [PATCH v2] dt-bindings: pinctrl: ti,dra7-iodelay: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-ti-iodelay-v2-1-995f55f605bf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/03MQQqDMBCF4avIrJuSRDvSrrxHcRGSiQ6oKYlIR
 XL3ptJFl/+D9x2QKDIleFQHRNo4cVhK6EsFdjTLQIJdadBSo2wlipUFB0eT2YVG397R28ajh3J
 4RfL8PrFnX3rktIa4n/amvuuPUfU/symhxM1LdDXaxhjbDbPh6WrDDH3O+QNXsZBzpAAAAA==
X-Change-ID: 20260706-ti-iodelay-26f796fc4f6f
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784738769; l=5450;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=vbUaQgLr8MujYHQ5b5L4HHRWyH6HlD6i/56H/NwdBJw=;
 b=rEU0i1BziL3CY0uUPYI8Q4A7fXhen3llw9rlXnVMuf5jobLvgA1LKrAKEhRW/j4d1pDbPTsxN
 ARQAzRBuqfIBuhpgREizy1wY8EY12fvT+WKr/JdFsQh8IupSn6DJdte
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI IODELAY controller from text to DT schema. Document child
properties missing from text bindings for proper validation.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Add pinctrl-pin-array as required for child node
- Support generic child node that ends with _conf
- Link to v1: https://lore.kernel.org/r/20260713-ti-iodelay-v1-1-5f06d36c4aac@gmail.com
---
 .../bindings/pinctrl/ti,dra7-iodelay.yaml          | 83 ++++++++++++++++++++++
 .../devicetree/bindings/pinctrl/ti,iodelay.txt     | 47 ------------
 2 files changed, 83 insertions(+), 47 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ti,dra7-iodelay.yaml b/Documentation/devicetree/bindings/pinctrl/ti,dra7-iodelay.yaml
new file mode 100644
index 000000000000..a798552c1ac2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ti,dra7-iodelay.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ti,dra7-iodelay.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pin configuration for TI IODELAY controller
+
+maintainers:
+  - Nishanth Menon <nm@ti.com>
+  - Bhargav Joshi <j.bhargav.u@gmail.com>
+
+description:
+  TI dra7 based SoCs such as am57xx have a controller for setting the IO delay
+  for each pin. For most part the IO delay values are programmed by the
+  bootloader, but some pins need to be configured dynamically by the kernel such
+  as the MMC pins.
+
+properties:
+  compatible:
+    const: ti,dra7-iodelay
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  '#pinctrl-cells':
+    const: 2
+
+patternProperties:
+  ^.*_conf$:
+    type: object
+    additionalProperties: false
+
+    properties:
+      pinctrl-pin-array:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: |
+          An array of 32-bit integers defining the pin delay configuration.
+
+    required:
+      - pinctrl-pin-array
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+  - '#pinctrl-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/dra.h>
+
+    padconf@4844a000 {
+        compatible = "ti,dra7-iodelay";
+        reg = <0x4844a000 0x0d1c>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #pinctrl-cells = <2>;
+
+        mmc2_iodelay_3v3_conf {
+            pinctrl-pin-array = <
+            0x18c A_DELAY_PS(0) G_DELAY_PS(120) /* CFG_GPMC_A19_IN */
+            0x1a4 A_DELAY_PS(265) G_DELAY_PS(360) /* CFG_GPMC_A20_IN */
+            0x1b0 A_DELAY_PS(0) G_DELAY_PS(120) /* CFG_GPMC_A21_IN */
+            0x1bc A_DELAY_PS(0) G_DELAY_PS(120) /* CFG_GPMC_A22_IN */
+            0x1c8 A_DELAY_PS(287) G_DELAY_PS(420) /* CFG_GPMC_A23_IN */
+            0x1d4 A_DELAY_PS(144) G_DELAY_PS(240) /* CFG_GPMC_A24_IN */
+            0x1e0 A_DELAY_PS(0) G_DELAY_PS(0) /* CFG_GPMC_A25_IN */
+            0x1ec A_DELAY_PS(120) G_DELAY_PS(0) /* CFG_GPMC_A26_IN */
+            0x1f8 A_DELAY_PS(120) G_DELAY_PS(180) /* CFG_GPMC_A27_IN */
+            0x360 A_DELAY_PS(0) G_DELAY_PS(0) /* CFG_GPMC_CS1_IN */
+            >;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/ti,iodelay.txt b/Documentation/devicetree/bindings/pinctrl/ti,iodelay.txt
deleted file mode 100644
index c3ed1232b6a3..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/ti,iodelay.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-* Pin configuration for TI IODELAY controller
-
-TI dra7 based SoCs such as am57xx have a controller for setting the IO delay
-for each pin. For most part the IO delay values are programmed by the bootloader,
-but some pins need to be configured dynamically by the kernel such as the
-MMC pins.
-
-Required Properties:
-
-  - compatible: Must be "ti,dra7-iodelay"
-  - reg: Base address and length of the memory resource used
-  - #address-cells: Number of address cells
-  - #size-cells: Size of cells
-  - #pinctrl-cells: Number of pinctrl cells, must be 2. See also
-    Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-
-Example
--------
-
-In the SoC specific dtsi file:
-
-	dra7_iodelay_core: padconf@4844a000 {
-		compatible = "ti,dra7-iodelay";
-		reg = <0x4844a000 0x0d1c>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		#pinctrl-cells = <2>;
-	};
-
-In board-specific file:
-
-&dra7_iodelay_core {
-	mmc2_iodelay_3v3_conf: mmc2_iodelay_3v3_conf {
-		pinctrl-pin-array = <
-		0x18c A_DELAY_PS(0) G_DELAY_PS(120)	/* CFG_GPMC_A19_IN */
-		0x1a4 A_DELAY_PS(265) G_DELAY_PS(360)	/* CFG_GPMC_A20_IN */
-		0x1b0 A_DELAY_PS(0) G_DELAY_PS(120)	/* CFG_GPMC_A21_IN */
-		0x1bc A_DELAY_PS(0) G_DELAY_PS(120)	/* CFG_GPMC_A22_IN */
-		0x1c8 A_DELAY_PS(287) G_DELAY_PS(420)	/* CFG_GPMC_A23_IN */
-		0x1d4 A_DELAY_PS(144) G_DELAY_PS(240)	/* CFG_GPMC_A24_IN */
-		0x1e0 A_DELAY_PS(0) G_DELAY_PS(0)	/* CFG_GPMC_A25_IN */
-		0x1ec A_DELAY_PS(120) G_DELAY_PS(0)	/* CFG_GPMC_A26_IN */
-		0x1f8 A_DELAY_PS(120) G_DELAY_PS(180)	/* CFG_GPMC_A27_IN */
-		0x360 A_DELAY_PS(0) G_DELAY_PS(0)	/* CFG_GPMC_CS1_IN */
-		>;
-	};
-};

---
base-commit: 1e9cdc2ea15adf4a821eefedabf6c0c8cf0b6a55
change-id: 20260706-ti-iodelay-26f796fc4f6f

Best regards,
-- 
Bhargav

