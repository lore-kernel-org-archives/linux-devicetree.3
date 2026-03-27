Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99908366043
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630092; cv=none; b=ewisQrwcX0fgQCOYqo7qmOAX7kTeDYWcgwEkM9Km1PNX1b6x/GqEtKWk0Y5Kz+VdgxspfrFA4jWgmsNcAEFdqhkoyHI/SwC5wfUwhiLot8z8fNW59OhNJktf5v1J5E/yyUgyp5UIPR2TSCwNZBfGGmb5yMfUIzkuNr0/5ubWqb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630092; c=relaxed/simple;
	bh=pTS8uG5VmLH/V/Tc99jd7kQoII4k336sCKYir7dR+yY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bH9oAgZcGVUBapIiBElAk+1e7y/BMthBAUCeLjtncILpkoRm6qjI3hnnHb1YKh00jMt+WPXuR7+K6BbBKobGRh6VM7lHjDWcYHFHSZT3wxTgwInM3B9w9g0vhWoR7IixequEEer2971+JWZwkckJWgCHgje3imLU97V9/mV1IdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pR1Jy6QL; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pR1Jy6QL"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2aaed195901so10471035ad.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774630091; x=1775234891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBHc0eO3/NbG1nFm7mct65bznXsLp+shsTmz7+UdJu8=;
        b=pR1Jy6QL1oeYKhQkFNeqUh0fywmXfwJ4VE6KJrmjAmtFXgr4EdB4wdQOPR22V1PXgL
         RDzJwB2IoFXPPBkPimjXilmElhryDT6OihhBTtEYk0TkHfVer5B35fwhdf6MIBFwfRYs
         pkT89oi4jA9ChKoYI0u0qytTloWN7r8nq0bUmwELiLk6Ol+No1/SRyA9YzeV3W5esIA3
         MfqrNAfxdUVEIwVga09fKdm2Ma3BVSvqdNArEjCo57NjbI4YNFoRQpy8Z1bqy5YbhDTY
         b3iKhf7Emm80m+upX8ztEeZAel8+5ncdFYxLxq8iCnyDxzS4imRwrWKwSIzucTceni5u
         t77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630091; x=1775234891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBHc0eO3/NbG1nFm7mct65bznXsLp+shsTmz7+UdJu8=;
        b=VRnXhCZUGSzaNpCs/SoNFTkFUMsiYs5pv3uDLlVMex86UVtowuW+4sGj9qZCuPoXMH
         2rx55BuaiqzBBFRkemI8oHAEVX3ADGFbL723xVFs9m9zK+2r9vLXlWt7XXwzkf0LCvmf
         XyEq0EC5ZOLUfDMfvl5NAQDouQs2f7QFL/P/qYuq5XgTjln/BeNngN6vw9Nuf0nIc+Kn
         BJ0R2Hbqv2I0ZGAxiohTu+pamm4JrbrzuNiCwKkuiOigh9uOMEmgqaUqWVjECn3rB1fu
         R4Hhk0tifcVsgl3rU3+M8hzd5tEOfjaqDZnSZ1uE8VwptMYwMKSoaEUAhZPGwQZmaUg6
         8Ujw==
X-Forwarded-Encrypted: i=1; AJvYcCUXQeYD8EIqdW7GTT2/PMdKPfe95i2mtp13uKFdDr4/IxU4c+WQyYTtF1+TYc4m0QAs1G9L35JUlS8q@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+8OCgY/HNDj3517yJjbazZa8HwhIA2JVVnuRs1x/PisWAA+gA
	mWvB0q7RW8bznYSZjT6uXxbShrqBdy5rFynYgCohO/Dx6j+hgQ0A5PVD
X-Gm-Gg: ATEYQzx71NxWzBfO81UdfL8mUqHuCgsgWgpy2wtLEIFRoUIA4eR993Xnx1JHHg2Ah9j
	yGP2vL2i+gRExXSjltea7ykSz+pF29vWAoLLB9b0sRKqfrtlSLvwvGS2viqBw7fYdqG3xJiWSeO
	OxkHsUR9xfIDM9ymBz5EwWRmzx8A+uT9c8aOnO6vYyD0Np03KIOyLvQO891IG73GcJ99TfmYIUC
	vNNTKNt4aVS/+i83fTLwn8KNxMzvFQntsofDhwnI/6T0jRtXRqdmS0N6MqgXEcKTxN5TqV+EQT8
	jmv7LdGDP6MlJwDnbyB5W2hAnuD/9GpF2j7NOBiwb7UtEk2pPggWxDHwA1yhSA3Yxf9dUfdP0/g
	YTcg2YD26I/BE8Nz0f2wIbjt3QVeESrKxGFdYdxPkyBvNGJj7ynbTtL8PpFqwtih7/LYR204oMy
	fSZNaYf8SQAuqLJHgcTWNrOBmqSxxhuMYcBf23DLg6VTCR
X-Received: by 2002:a17:903:228e:b0:2ae:5163:c2aa with SMTP id d9443c01a7336-2b0cdc28166mr35337035ad.20.1774630090965;
        Fri, 27 Mar 2026 09:48:10 -0700 (PDT)
Received: from Black-Pearl.localdomain ([116.72.145.18])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc8b9da6sm86065305ad.58.2026.03.27.09.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:48:10 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 27 Mar 2026 16:47:45 +0000
Subject: [PATCH v4 4/5] dt-bindings: usb: atmel,at91rm9200-udc: convert to
 DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-atmel-usb-v4-4-eb8b6e49b29d@gmail.com>
References: <20260327-atmel-usb-v4-0-eb8b6e49b29d@gmail.com>
In-Reply-To: <20260327-atmel-usb-v4-0-eb8b6e49b29d@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3

Convert Atmel AT91 USB Device Controller (UDC) binding to DT schema.
Changes during conversion:
- Include "atmel,pullup-gpio" and "atmel,matrix" in the properties since
  they are required by existing in-tree DTS definitions.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../bindings/usb/atmel,at91rm9200-udc.yaml         | 76 ++++++++++++++++++++++
 .../devicetree/bindings/usb/atmel-usb.txt          | 28 --------
 2 files changed, 76 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
new file mode 100644
index 000000000000..a4eabb935e6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/atmel,at91rm9200-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel AT91 USB Device Controller (UDC)
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+description:
+  The Atmel AT91 USB Device Controller provides USB gadget (device-mode)
+  functionality on AT91 SoCs. It requires a peripheral clock and an AHB
+  clock for operation and may optionally control VBUS power through a GPIO.
+
+properties:
+  compatible:
+    enum:
+      - atmel,at91rm9200-udc
+      - atmel,at91sam9260-udc
+      - atmel,at91sam9261-udc
+      - atmel,at91sam9263-udc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: hclk
+
+  atmel,vbus-gpio:
+    description: GPIO used to enable or control VBUS power for the USB bus.
+    maxItems: 1
+
+  atmel,matrix:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the Atmel bus matrix controller.
+
+  atmel,pullup-gpio:
+    description:
+      GPIO controlling the USB D+ pull-up resistor used to signal device
+      connection to the host.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/gpio/gpio.h>
+    gadget@fffa4000 {
+        compatible = "atmel,at91rm9200-udc";
+        reg = <0xfffa4000 0x4000>;
+        interrupts = <11 IRQ_TYPE_LEVEL_HIGH 2>;
+        clocks = <&udc_clk>, <&udpck>;
+        clock-names = "pclk", "hclk";
+        atmel,vbus-gpio = <&pioC 5 GPIO_ACTIVE_HIGH>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
index bf2149e5f0b3..ab353576d1de 100644
--- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
+++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
@@ -1,33 +1,5 @@
 Atmel SOC USB controllers
 
-AT91 USB device controller
-
-Required properties:
- - compatible: Should be one of the following
-	       "atmel,at91rm9200-udc"
-	       "atmel,at91sam9260-udc"
-	       "atmel,at91sam9261-udc"
-	       "atmel,at91sam9263-udc"
- - reg: Address and length of the register set for the device
- - interrupts: Should contain macb interrupt
- - clocks: Should reference the peripheral and the AHB clocks
- - clock-names: Should contain two strings
-		"pclk" for the peripheral clock
-		"hclk" for the AHB clock
-
-Optional properties:
- - atmel,vbus-gpio: If present, specifies a gpio that needs to be
-   activated for the bus to be powered.
-
-usb1: gadget@fffa4000 {
-	compatible = "atmel,at91rm9200-udc";
-	reg = <0xfffa4000 0x4000>;
-	interrupts = <10 4>;
-	clocks = <&udc_clk>, <&udpck>;
-	clock-names = "pclk", "hclk";
-	atmel,vbus-gpio = <&pioC 5 0>;
-};
-
 Atmel High-Speed USB device controller
 
 Required properties:

-- 
2.53.0

