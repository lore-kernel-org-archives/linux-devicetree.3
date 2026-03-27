Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B9F361668
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630098; cv=none; b=HXV6+pQU3fNstKdse+ZduNXW5VNv//497iPzOrC/R5yfM6KNpfBjCpTEk2ZVLC1P/cR2UDQPHp63FCBmVM5OYI1stmL79kPF6VxSTcCEHgzsKa11wF00KBUZcECq2692tBdqG4SGu6SyBcBCyG9yfVQWX6Zon/mleVWnQIM37aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630098; c=relaxed/simple;
	bh=MtDErEaoqToxmXWxShx/4zVcbSjwCCWvFD8QCYhOpMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IZTonN8QMvCRNMuWZl+dTKzDtv5tkX2v6Yqh6BDzuQh292VqnNzAyFiOgsCnk8SKBw2/2V0NAbpRdG8LeUY8Fkc/4XSetfQXP/HdKqJTxsKopjb+B0+KbgZdb9Xy90vqcmvd2537UQ/EYpvBosQxaJ/tTFRwGvARCiRfdr6GzLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cz5ItPs0; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cz5ItPs0"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b04d051664so19903815ad.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774630096; x=1775234896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OzEqlfjCP+7hOjyp4vYS6CJ3+BJqvMqcHKBBEUysxc=;
        b=cz5ItPs0PDG9cPjcBdbaBPMfD1Yxehk+qGO9BvoC7UVXG4/b47nd4bfsQpJBY8Edrn
         S0ZxJJljub4afGvygJInyGGQ29fVMYnlSN7eiIIIy2uRWUey1akSirsrisuxgukp7SOz
         +onJ0NYBBWmY6clpkG0zEl3wE7NNfiNwwkR11AYlOgl6+yOj4Sl36ASX0c/1bwROXA7r
         hJ0kMPSqC8KkL/lhY2CdhwVcR5pUwQioOAUZ16dgbdhwXmnKyiBAlzcn6hvE7nK6drcM
         R0rYg2MfZAQMjBAtt1ycWcvEiqzKsWz1ZlAfB98vxA9GJwkvtqSqgRBQmykEG5F0ceiI
         yHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630096; x=1775234896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9OzEqlfjCP+7hOjyp4vYS6CJ3+BJqvMqcHKBBEUysxc=;
        b=Xm4fAryuDba6uKCCu7LbckCG7o77qt8EmOqY/dI1QJJxKm1gN6IeGok+NduZaDKM3R
         arusuMbrW423q8vn5dgI+ndp52VE61YDqFFhUwsnYAxEJenbPjxflx1hKE1BrLoLWg/n
         q5Md5DQ5mriF0i2NF5kMR9FcYENlRFY1ul+eab8FTWDGUeMs7d4QCKzRDE44NNuG5bma
         PlOIy/qQ93J3YOu20ST0oEVbAkJ8hApMjtZAyRREPPry8qjqw1qQqlVjSRd6XNVGzAms
         Rap6kZKJALQHn3dsE4XrV5abvmRGV+MdLXuMPb632vw8+EHS0tHujPQ+IcsoqZ73aJI8
         iVrQ==
X-Forwarded-Encrypted: i=1; AJvYcCULNairr0gi7EvGi9gtoBboQWqKkhMAW7PJxEOfvPiV4bGsBhAeVE1VoHNxwJWB8n4azTpZvSjvIrJU@vger.kernel.org
X-Gm-Message-State: AOJu0YyhQuJrSAX6fEW6evTs+MltkCnILLgQ1U79roEeAloCRShwX2vF
	XUjh0f07JCKS6Im4iRpxj9tqSzmLCt+HsY6M26I95m5o5oXfSoLxx6/E
X-Gm-Gg: ATEYQzxlIFL3C7m8fsfwynYO8Uf0ESHt0lJU+3kuzTeAMVUbjeQG363G8SHGhMfZ/dp
	ArySnchNXXwxwY0uue1/W1CrQhGUSxW5XjSV9Wjw1uo6wGZI2o1Webl7H1uCKeCC+sUYuOybQ6c
	1A8BNDeBlK++Zs5vWft5CBj0WOpG2xsbbLHSOZzYoRpOv/f7fOXYY/tLopM9ZVYaDsIqdeahX6O
	vIsuPYpAqqaGOOGVzdVvww/8LORlBWrp1s+LHG+XUf/IXW1Ivww+XsU+VL595wnWlpqi4Y57npZ
	cUebr1ZbxZGV7/t6GAifl/pkwzFduYnIVf90CLarV+tm/ghvYTXrYCIa/5tz7CD4Uyyg+BSmzHb
	gtHHtCqyEUeyzXj9oZFMoWynZN2MxwagNjz5FO2Ua4KFEJVmQw2Z1ziOUvEJPQjPXvpodf2mm2B
	3A7g0JGsF06BhBk3wapW6Ia8lseDSXfJzWsAxM575qjme5
X-Received: by 2002:a17:902:cf03:b0:2ae:c529:a13f with SMTP id d9443c01a7336-2b0cdc24049mr35807125ad.14.1774630095953;
        Fri, 27 Mar 2026 09:48:15 -0700 (PDT)
Received: from Black-Pearl.localdomain ([116.72.145.18])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc8b9da6sm86065305ad.58.2026.03.27.09.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:48:15 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 27 Mar 2026 16:47:46 +0000
Subject: [PATCH v4 5/5] dt-bindings: usb: atmel,at91sam9rl-udc: convert to
 DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-atmel-usb-v4-5-eb8b6e49b29d@gmail.com>
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

Convert Atmel High-Speed USB Device Controller (USBA) binding to DT schema.
Changes during conversion:
- Make the "clock-names" property flexible enough to accept the items
  in any order as the existing in tree DTS nodes doesn't follow an order.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../bindings/usb/atmel,at91sam9rl-udc.yaml         | 74 ++++++++++++++++++++++
 .../devicetree/bindings/usb/atmel-usb.txt          | 46 --------------
 2 files changed, 74 insertions(+), 46 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml b/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
new file mode 100644
index 000000000000..cdbbd17f8036
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/atmel,at91sam9rl-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel High-Speed USB Device Controller (USBA)
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+description:
+  The Atmel High-Speed USB Device Controller (USBA) provides USB 2.0
+  high-speed gadget functionality on several Atmel and Microchip SoCs.
+  The controller requires a peripheral clock and a host clock for operation
+  and may optionally use a GPIO to detect VBUS presence.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - atmel,at91sam9rl-udc
+          - atmel,at91sam9g45-udc
+          - atmel,sama5d3-udc
+      - items:
+          - const: microchip,lan9662-udc
+          - const: atmel,sama5d3-udc
+      - const: microchip,sam9x60-udc
+
+  reg:
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    minItems: 2
+    maxItems: 2
+    items:
+      enum: [pclk, hclk]
+
+  atmel,vbus-gpio:
+    description: GPIO used to detect the presence of VBUS, indicating that
+      the USB cable is connected.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/gpio/gpio.h>
+    gadget@fff78000 {
+        compatible = "atmel,at91sam9g45-udc";
+        reg = <0x00600000 0x80000
+               0xfff78000 0x400>;
+        interrupts = <27 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
+        clock-names = "pclk", "hclk";
+        atmel,vbus-gpio = <&pioC 15 GPIO_ACTIVE_HIGH>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
deleted file mode 100644
index ab353576d1de..000000000000
--- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-Atmel SOC USB controllers
-
-Atmel High-Speed USB device controller
-
-Required properties:
- - compatible: Should be one of the following
-	       "atmel,at91sam9rl-udc"
-	       "atmel,at91sam9g45-udc"
-	       "atmel,sama5d3-udc"
-	       "microchip,sam9x60-udc"
-	       "microchip,lan9662-udc"
-	       For "microchip,lan9662-udc" the fallback "atmel,sama5d3-udc"
-	       is required.
- - reg: Address and length of the register set for the device
- - interrupts: Should contain usba interrupt
- - clocks: Should reference the peripheral and host clocks
- - clock-names: Should contain two strings
-		"pclk" for the peripheral clock
-		"hclk" for the host clock
-
-Deprecated property:
- - ep childnode: To specify the number of endpoints and their properties.
-
-Optional properties:
- - atmel,vbus-gpio: If present, specifies a gpio that allows to detect whether
-   vbus is present (USB is connected).
-
-Deprecated child node properties:
- - name: Name of the endpoint.
- - reg: Num of the endpoint.
- - atmel,fifo-size: Size of the fifo.
- - atmel,nb-banks: Number of banks.
- - atmel,can-dma: Boolean to specify if the endpoint support DMA.
- - atmel,can-isoc: Boolean to specify if the endpoint support ISOC.
-
-usb2: gadget@fff78000 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	compatible = "atmel,at91sam9rl-udc";
-	reg = <0x00600000 0x80000
-	       0xfff78000 0x400>;
-	interrupts = <27 4 0>;
-	clocks = <&utmi>, <&udphs_clk>;
-	clock-names = "hclk", "pclk";
-	atmel,vbus-gpio = <&pioB 19 0>;
-};

-- 
2.53.0

