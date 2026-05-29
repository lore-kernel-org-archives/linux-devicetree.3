Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E006D37C0FB
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 21:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780090515; cv=none; b=TERB7TLkWxxU7KFcB2Ks/KRZfJkps3yrgoEp/hy7cONyyaxwpxWrKQj3CB+n9+OdvQUor+FGzmbXLuQ0NuJsjX6GZaS3SF2BMP4g/UfP4Y/i50eJ1JSWq3OLg9ieLDXMARxdDv0xVO1cPqgG0bGIhEUc/LEnLrY0PPre0/owGcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780090515; c=relaxed/simple;
	bh=lYpOc6fOaDh4ZLFazxlIdvbY6RYb+I78E4ytgUqwwqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NQMC0iVXmPB4abxdholqwRhEUSaUxWP0gpumHPPYQmo+lPoZ/djhVYUEEeEd98Vv3rVZxRuSZkYlkOn/xgXZrCeK1SEKN/zfV+8++H3mhPn3hY6L9pQuxEFCzG6x2ofxTnmoMKMaIxbgs4kHHeKjHsDMwcC0UV0z0iGSijfZ2Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sepRQN+/; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sepRQN+/"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304f0039c02so1854141eec.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780090513; x=1780695313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DFWDKwyRKBZ32Uk9BFeT4rrN2UfaBXZB6E4lTU+3VHI=;
        b=sepRQN+/dCn0i2TjKX1EpX1tU7QO3SWXhLR/IsoR1sJz0/aBTx5zNFc2jpX0EAKtKe
         HKnlKqosbDQVhVcCy0bpuiy74wMPUsQyGs6I+Or+6S+E+wa1dNq6CvYPEZ8cOEzfHHx3
         zgO7ZJ2//wH7xcb+VQ964hHpN24iaOYshBoHhQIvvV9xGFv/H6syTg1Hsv9AZmDflDig
         CvhE6FjHu9wOgUywxEB38yuhwPWvjpw2ZKwAL2U1wtxxC5/jIDgxd8XdFE1pTd/9j/FI
         Cz4uLYy1Fgm1vRI3beKA57gkJ4r1rcZiLxYFoAELhZWFqADXyG7f2QZ5QIxYjgjpo9fL
         YLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780090513; x=1780695313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DFWDKwyRKBZ32Uk9BFeT4rrN2UfaBXZB6E4lTU+3VHI=;
        b=oA/0gM85R6gKq4h08ADNmrAeZ5nCeHFI5toQRfAd6yZm4NJd6gsxg+O6+W8Fqdpu8V
         cObcM2meDxmA33TP4LfSHiwyosC4GseIaefipRynqh9W9s6WKZ0bclaUvGaaophsvTwJ
         rSmcecjJf2okeLNL2N08hoeKNqzh7NUdqNuXYm1BV3fYRNkCP+cUnQi/0ZCNYrL5ptQt
         HOJRuJvSt7IceU3BS9oWoYi0cpwqGpCKOhxAHJbnCPxNFMSjQ5jlahkWIkvTZJLnPVTU
         OCYX/wLQ2HHkuYmf6X1WHgfneEuNM/0R8kWvMGlm1/Vcp/Ry+4gB5fg/Ktl389q35mpK
         emJw==
X-Forwarded-Encrypted: i=1; AFNElJ+9nTS+H2pG1LM4hkqmuks8L7oBr7YAgQSq6xseMbGNYJu/T3QAmFlUh34dg+nEtfKSFCaSQH+QR2Aq@vger.kernel.org
X-Gm-Message-State: AOJu0YyuDdw5dXsm8ZW5EaSsoCRCY4FZuA3cZzrKeuykWlhj8Dh+Q1XP
	H7XIkc+9iptlP0EkzpOjLJLk6WT1nCfrVo2JPD6Z3Ecu1i87zLJs01+s
X-Gm-Gg: Acq92OFhzb2iP/GE0z2jeD0nUfCNONFXSlQfJhf1e1SNa9CxKV3E1cahoRAwE/UJJxi
	n8aODME4Umj+qOEeE9Hc9l/vNmh7I4LCmguLSGRUF515Onuo9Bkh8WNRFsr2sn0Yx9G0C8xMEVM
	5F1lpAmrYT3c03Z6Cwt/4kwEOnFzqTGFEo5xIIYh5kuRlrSVpyx4ljtndr5rTTh3UIOb20hm1pY
	f81M80tyCZIQJ8YwG4dMxaiRYQ4HftI42b3jA2GX6EByltNmh6X1MO9kSlXsb849i8uTdknPPuK
	G5zrDiTBfBJsh5LMq94Q5ndR++UZPxZzycFzx/qfUoSloS0k04N6ohOk+ObvwudPJSjZLVbz8y8
	4Y5RGOi4vh8V3sZP8YiiyrsKScSdsHZTirSvMftiX6SfCXiM+wb9c9TZp2MzogiDZodqRzQp4H5
	ElZCt3hUTe8lgfNBA2WeL5GQShNs38LGbVPoJkyCMUXemPk7o=
X-Received: by 2002:a05:7300:6427:b0:2ed:e16:6b4d with SMTP id 5a478bee46e88-304fa6ef8d4mr913625eec.35.1780090512861;
        Fri, 29 May 2026 14:35:12 -0700 (PDT)
Received: from localhost.localdomain ([76.173.186.92])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2c312csm2564173eec.6.2026.05.29.14.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 14:35:12 -0700 (PDT)
From: Jeremiah Bishop <jbishop.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeremiah Bishop <jbishop.dev@gmail.com>
Subject: [PATCH] dt-bindings: usb: convert PXA USB bindings to YAML
Date: Fri, 29 May 2026 11:35:06 -1000
Message-ID: <20260529213506.37462-1-jbishop.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the legacy pxa-usb.txt binding documentation to YAML schemas.

The original text binding documented two distinct devices: the PXA OHCI
USB host controller and the PXA270 USB device controller. Split the
documentation into separate schemas, marvell,pxa-ohci.yaml and
marvell,pxa270-udc.yaml, and remove the obsolete text binding.

The schemas preserve the existing compatible strings and properties used
by current in-tree users while adding machine-readable validation and
examples.

Signed-off-by: Jeremiah Bishop <jbishop.dev@gmail.com>
---
 .../bindings/usb/marvell,pxa-ohci.yaml        | 91 +++++++++++++++++++
 .../bindings/usb/marvell,pxa270-udc.yaml      | 50 ++++++++++
 .../devicetree/bindings/usb/pxa-usb.txt       | 53 -----------
 3 files changed, 141 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/marvell,pxa270-udc.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/pxa-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml b/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml
new file mode 100644
index 000000000000..3f7935384b9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/marvell,pxa-ohci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell PXA OHCI USB Host Controller
+
+maintainers:
+  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+  - Alan Stern <stern@rowland.harvard.edu>
+
+allOf:
+  - $ref: usb-hcd.yaml#
+
+properties:
+  compatible:
+    const: marvell,pxa-ohci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  marvell,enable-port1:
+    type: boolean
+    description: Enable USB port 1 if present.
+
+  marvell,enable-port2:
+    type: boolean
+    description: Enable USB port 2 if present.
+
+  marvell,enable-port3:
+    type: boolean
+    description: Enable USB port 3 if present.
+
+  marvell,port-sense-low:
+    type: boolean
+    description: Port sense pin in low-active.
+
+  marvell,power-control-low:
+    type: boolean
+    description: Power control pin is low-active.
+
+  marvell,no-oc-protection:
+    type: boolean
+    description: Disable over-current protection.
+
+  marvell,oc-mode-perport:
+    type: boolean
+    description: Enable per-port over-current protection.
+
+  marvell,power-on-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Power On to Power Good time in milliseconds.
+
+  marvell,port-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3]
+    description: |
+      Selects the mode of the ports.
+        1 = PMM_NPS_MODE
+        2 = PMM_GLOBAL_MODE
+        3 = PMM_PERPORT_MODE
+
+  marvell,power-budget:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: USB power budget.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    usb@4c000000 {
+        compatible = "marvell,pxa-ohci";
+        reg = <0x4c000000 0x100000>;
+        interrupts = <3>;
+        clocks = <&clks 11>;
+        marvell,enable-port1;
+        marvell,port-mode = <2>; /* PMM_GLOBAL_MODE */
+    };
diff --git a/Documentation/devicetree/bindings/usb/marvell,pxa270-udc.yaml b/Documentation/devicetree/bindings/usb/marvell,pxa270-udc.yaml
new file mode 100644
index 000000000000..0be51e0db80b
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/marvell,pxa270-udc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/marvell,pxa270-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell PXA27x USB Device Controller (UDC)
+
+maintainers:
+  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+properties:
+  compatible:
+    const: marvell,pxa270-udc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  gpios:
+    maxItems: 1
+    description: GPIO to control the USB D+ pullup.
+
+  phys:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    udc@40600000 {
+        compatible = "marvell,pxa270-udc";
+        reg = <0x40600000 0x10000>;
+        interrupts = <11>;
+        clocks = <&clks 11>;
+        gpios = <&gpio 22 GPIO_ACTIVE_LOW>;
+    };
diff --git a/Documentation/devicetree/bindings/usb/pxa-usb.txt b/Documentation/devicetree/bindings/usb/pxa-usb.txt
deleted file mode 100644
index 53fdae4fa6f6..000000000000
--- a/Documentation/devicetree/bindings/usb/pxa-usb.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-PXA USB controllers
-
-OHCI
-
-Required properties:
- - compatible: Should be "marvell,pxa-ohci" for USB controllers
-   used in host mode.
-
-Optional properties:
- - "marvell,enable-port1", "marvell,enable-port2", "marvell,enable-port3"
-   If present, enables the appropriate USB port of the controller.
- - "marvell,port-mode" selects the mode of the ports:
-	1 = PMM_NPS_MODE
-	2 = PMM_GLOBAL_MODE
-	3 = PMM_PERPORT_MODE
- - "marvell,power-sense-low" - power sense pin is low-active.
- - "marvell,power-control-low" - power control pin is low-active.
- - "marvell,no-oc-protection" - disable over-current protection.
- - "marvell,oc-mode-perport" - enable per-port over-current protection.
- - "marvell,power_on_delay" Power On to Power Good time - in ms.
-
-Example:
-
-	usb0: ohci@4c000000 {
-		compatible = "marvell,pxa-ohci";
-		reg = <0x4c000000 0x100000>;
-		interrupts = <18>;
-		marvell,enable-port1;
-		marvell,port-mode = <2>; /* PMM_GLOBAL_MODE */
-	};
-
-UDC
-
-Required properties:
- - compatible: Should be "marvell,pxa270-udc" for USB controllers
-   used in device mode.
- - reg: usb device MMIO address space
- - interrupts: single interrupt generated by the UDC IP
- - clocks: input clock of the UDC IP (see clock-bindings.txt)
-
-Optional properties:
- - gpios:
-   - gpio activated to control the USB D+ pullup (see gpio.txt)
-
-Example:
-
-		pxa27x_udc: udc@40600000 {
-			compatible = "marvell,pxa270-udc";
-			reg = <0x40600000 0x10000>;
-			interrupts = <11>;
-			clocks = <&pxa2xx_clks 11>;
-			gpios = <&gpio 22 GPIO_ACTIVE_LOW>;
-		};
-- 
2.43.0

