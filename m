Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE073624B7
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630085; cv=none; b=B72THDn/zwFQjj3hYNpu1sKHgqMxqWa7wT3YVoC1A8/w5ZSJyoECkbMVPb3JhdfEug5lWmJ+XLvrCI43shdXR6tgKASIp8MupdH+JE34I+a1ZJj3tLYpPtYn17G7WJuLkERxdNSD+mbLTeFwLR0i4B6Uijn+HdL088IEKSl6gbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630085; c=relaxed/simple;
	bh=Z8MJ5nSQHTa5NXYBn3gqCApWzdTH+o38SeU1BHLtWhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UQdDiE6UyYkgVP1Ht7XWSSUnFSCAMPGbcBBpacZ3sdm3kEGMThi5uc7icVU6XgmitK9Dl+tTBSsf3JmudIwUMRr54MvBaZTQL2XgFFeBV2A8bEEnqCEWbpAmVJcLyTQ5szNzRJzmXuVNyYMKDUdYs8dneznLtVtMf4ZdNr5Zgxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxplJA9i; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxplJA9i"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b062069f80so14040115ad.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774630082; x=1775234882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcCW/GTEnEUFiHAWHz6f8JvJTk6/azgZ2oCG+4+XfEY=;
        b=CxplJA9i9OJgO/RNhyXa9jsPuQxkj/UT71a0QoPpaPcIHf+16YOY0da0kFjGr2XxPI
         KVUIRvgNsWIzN6itRrE/4NWQ8Zu9G2tB71SHifSeyPUAUTfG3hgqtiqyL4nMQhjzVzyp
         vu1AxK865pjCLiK0aoQo//J3gSdf1bSOuLHSsF+B46Xg67wHexF/HvqaR/CHyqY5HugP
         KDRk1pgjJRXFJeG8KSAijndw+J+Plq8Zcy3tnOBWSd/W35q6mL9w0j7ucCK/Ob2s+V2E
         oC3gv7I6rcBnKqGRptoKp7vtC4VNUFNgKxEOoMCbrc+9Myjowman1NHEKkecSqzuPrSV
         pSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630082; x=1775234882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KcCW/GTEnEUFiHAWHz6f8JvJTk6/azgZ2oCG+4+XfEY=;
        b=QI+laN9aMVch+5pItAgfmQrgSzJpnjnm2G7Vodm/f6HIEuPSQODPhoZEaL/6/4uelq
         w8HJ5Kqo3h1pEv23dBK/hFnQQaAOKCGofVf5Bk1/mrbMMwMewzuJX8E7UcVmf1oFbx2O
         /SZlfrI4mNi1hPOMzfE6Nv0DcWxIQ4PArc5392XgexmMfSSf3FTlWeMEKreLTrhhpCFj
         CPI52fGOsiApaOhz3xjkoJ5Kry0uzsLVpI1+v9BdrZRxDJPFgVYHZM/nXw/ZNw3UIdfN
         vSpgt6OYFPfVjL+rlJ3aEXfv/mJT97Opc6N2R2fvSD++w18T8VxKGTNCXSUD3cVi18g3
         6KWg==
X-Forwarded-Encrypted: i=1; AJvYcCW+xi8E1Uy7f3rQ6zUiHoaf8pSkWAZQMrAnWaDPFbren3Y84gexcR6RsDWCCVD1Qq4Vs1fA45e9WEq9@vger.kernel.org
X-Gm-Message-State: AOJu0YwijvcmGxzRvv1/rVtALW35n8nAQUKAmWGs0ii3w+4NU07aFFl7
	XXsIOmC88WS05XdvamI1/RQeGDMne2zmKA8Yp5nIl7LiFKLGb7ahjAwx
X-Gm-Gg: ATEYQzxE03KcSN1HtJQdn1oQFSm6WRLAyesWnvF6Ba6TOsYfAyVWKh+vqoGwcEAhiQp
	S0Sd8XR0/ob7grI/mwVdD7h4NwrdsCG79Kl6Gzlk49+fMiy9mNHpmrQAJYvhgVNyHDslaNb4hmT
	/Ov3LmsftHqS/kcQDN2S03Q5voqtqUXyOUDtDGMOJbEI7Ar/dRJ/cRHSiN5OzwPaehfn4KRi24w
	uKxgiMgacoiGdQWC7zxWb8GGtxFBh2idGNIVYjar19i6FJMtLxBtTNZKrdS0j6tf3dLcTcGl7bI
	WIdwnDuqhclp1zZQoWs7EK0ayfhSKTkb0HxuKyWjGbsjF6Uosq+RhUYpyX38XEYEDTSo6JtlrIh
	ypMnA7UUqMeWsSq9FoKPlihqoVEccjRAWQZ8Pr6Xd4elwft/buFlZK4qlM/YBe4gwRoNho/gTHD
	FAhkz6jWc5wiI7CUUZyaXNHkehmLiLtWQQgNwlUUN0MgYn
X-Received: by 2002:a17:902:cf03:b0:2b0:c451:aea8 with SMTP id d9443c01a7336-2b0cdc2a006mr32092775ad.14.1774630081879;
        Fri, 27 Mar 2026 09:48:01 -0700 (PDT)
Received: from Black-Pearl.localdomain ([116.72.145.18])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc8b9da6sm86065305ad.58.2026.03.27.09.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:48:01 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 27 Mar 2026 16:47:43 +0000
Subject: [PATCH v4 2/5] dt-bindings: usb: generic-ohci: add AT91RM9200 OHCI
 binding support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-atmel-usb-v4-2-eb8b6e49b29d@gmail.com>
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

Convert the Atmel AT91RM9200 OHCI USB host controller binding to DT schema
by defining it in the existing generic OHCI schema.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../devicetree/bindings/usb/atmel-usb.txt          | 27 --------------
 .../devicetree/bindings/usb/generic-ohci.yaml      | 41 ++++++++++++++++++++++
 2 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
index 12183ef47ee4..c09685283109 100644
--- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
+++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
@@ -1,32 +1,5 @@
 Atmel SOC USB controllers
 
-OHCI
-
-Required properties:
- - compatible: Should be "atmel,at91rm9200-ohci" for USB controllers
-   used in host mode.
- - reg: Address and length of the register set for the device
- - interrupts: Should contain ohci interrupt
- - clocks: Should reference the peripheral, host and system clocks
- - clock-names: Should contain three strings
-		"ohci_clk" for the peripheral clock
-		"hclk" for the host clock
-		"uhpck" for the system clock
- - num-ports: Number of ports.
- - atmel,vbus-gpio: If present, specifies a gpio that needs to be
-   activated for the bus to be powered.
- - atmel,oc-gpio: If present, specifies a gpio that needs to be
-   activated for the overcurrent detection.
-
-usb0: ohci@500000 {
-	compatible = "atmel,at91rm9200-ohci", "usb-ohci";
-	reg = <0x00500000 0x100000>;
-	clocks = <&uhphs_clk>, <&uhphs_clk>, <&uhpck>;
-	clock-names = "ohci_clk", "hclk", "uhpck";
-	interrupts = <20 4>;
-	num-ports = <2>;
-};
-
 EHCI
 
 Required properties:
diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 961cbf85eeb5..d42f448fa204 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -55,6 +55,7 @@ properties:
           - ti,ohci-omap3
       - items:
           - enum:
+              - atmel,at91rm9200-ohci
               - cavium,octeon-6335-ohci
               - nintendo,hollywood-usb-ohci
               - nxp,ohci-nxp
@@ -137,6 +138,24 @@ properties:
       The associated ISP1301 device. Necessary for the UDC controller for
       connecting to the USB physical layer.
 
+  atmel,vbus-gpio:
+    description:
+      GPIO used to control or sense the USB VBUS power. Each entry
+      represents a VBUS-related GPIO; count and order may vary by hardware.
+      Entries follow standard GPIO specifier format. A value of 0 indicates
+      an unused or unavailable VBUS signal.
+    minItems: 1
+    maxItems: 3
+
+  atmel,oc-gpio:
+    description:
+      GPIO used to signal USB overcurrent condition. Each entry represents
+      an OC detection GPIO; count and order may vary by hardware. Entries
+      follow standard GPIO specifier format. A value of 0 indicates an
+      unused or unavailable OC signal.
+    minItems: 1
+    maxItems: 3
+
 required:
   - compatible
   - reg
@@ -144,6 +163,28 @@ required:
 
 allOf:
   - $ref: usb-hcd.yaml
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: atmel,at91rm9200-ohci
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: ohci_clk
+            - const: hclk
+            - const: uhpck
+
+      required:
+        - clocks
+        - clock-names
+
+    else:
+      properties:
+        atmel,vbus-gpio: false
+        atmel,oc-gpio: false
+
   - if:
       not:
         properties:

-- 
2.53.0

