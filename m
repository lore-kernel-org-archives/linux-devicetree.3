Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E402F3AEB38
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781502564; cv=none; b=LTFb/aW0WMmLEFH/DG5CxnGeZ3Pb4+93Y3A2yR/pnVCaVKVmc/pPe1WLQaixGE9+cuqkl+rxByJe/IrHd3SYl7+5PfckN2BYOPw7mkI7b40r4N2qTb8SzeUxh5MI3ZfYxdnxSSjWXLI/dQ3iusoaSS+F+8xFkxanTt76MPQlNX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781502564; c=relaxed/simple;
	bh=d8AUWY81lUGyrq4OuNxWdCyjJVT2cCr5NNkFGPHs9xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K2+OiD+7LUsjc127wej9jVkgivwlodYyWxJIvzYF/BVzr3Jg8VtJp0YOcDADrnPusY1ao0DXMMXd40wSKJlcyjr54gSYeTX0Y/eVQ4iygGlhW2x7Fm+8o86KFxNNoq2JyOA2q0ekPe63EZv7KsaInJ5GklspJP6B3p+CXcA0/Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYhxty9r; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYhxty9r"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-137335bc3caso3283157c88.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 22:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781502562; x=1782107362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GD68h9MMT+UECQIssPO5nRF88/8ApCFVC30JnkmQtnQ=;
        b=hYhxty9rsOYsNFDXRHj4D1ATNL/lrg/BAMV1fnvCkal94Z7d0WhWU4YuJVy2Ady5GG
         iiZdcGC9FRNRPHtt1pjmjg7qlY0p2hcBtxuFDN/nB3MNsbxg9r6j8LQ/OKZ7mjDACewf
         tkqvontquV8sYl9klzPk0Bs94p83EmbTI/ShyhRjJHQKVI2fOHwV/3zi27echK/c74ab
         HQvlWktz8QcTCtHccFKOnsEukEMca1/oFA9mULESE0LXuQYJNS083ycRhjCx7kNiayzS
         84dh2hxXhWaMn14gQDB5fPI8QP/ucf2I6ZILyRYPFEqn8b+TEXWM4+TiF2sflkFXLxkd
         8A9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781502562; x=1782107362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GD68h9MMT+UECQIssPO5nRF88/8ApCFVC30JnkmQtnQ=;
        b=MAydvVh12di67QoLEFb/pTgqBbvLF4EyBEwqKCn54v6cqzR38LYU+Pemszj4Tm0aOH
         OfJhhRWY9verdAqFM8iSDbFyBezwVEwCmK813BZY6R6pBKT9Y6GXMwDaeXwvNJWD4FCt
         ECD/OFOD6E0lDs7Sngqq8xKlfWp9J0kCtKfHETRxqN4ebSSCCiOp37bJVn84uuzZ86XF
         j9IfQPPrXfeh34j6LPt/MSlkfvsufVVLdL8/EFYyJbKVxc/JwifBjcjCVqmXlwcY8FRW
         IvkW0aI2WR3d60ws6ZI7Ilun1G6CJfdOT3g7Zob8+tJ0hYO39CUfkGti74bNJR9WWNyc
         Kvng==
X-Forwarded-Encrypted: i=1; AFNElJ8mY8TDTUEeTt+EyCTWhjRxEtYqd0Nvn9ePlWpQdW2woW8Yl0MOHrW45r+EGn5kiQUuhiZDhcjN4BYn@vger.kernel.org
X-Gm-Message-State: AOJu0YyFZyZ9tgtTYyJiCwwAHUr8NHUYr4XYrsj7QPBCndjhRiHYMnOv
	I5ZGiKPu31uT8W6kIRztuhej91TemGRbv1fMLOq12buAU8hxArGPC53L
X-Gm-Gg: Acq92OFz2TGKAasPw4Llu7JnJMcjtPOy+agpByV3maLsE1DcAQcfkIFHhmtjLaonUmx
	IRxuctAD6EiCBoiX0xnzJkqjzLCl67XiAFe7FaHmzHSx9Fb9N977M0R8wLYGOj9Nni5JOF2kRTs
	RsQYQehEraKWF928+/lI4FO5C4ps+Tw6ZG8VHt/WQIJZ+JHFbEPDZHkB2ugIPrPhy87RqP0+n8d
	0OACVqkoScZjXdFglzEPaM0/K3zwoLkyJejs2GNkZC7WjtT+WrB9LIIlNThdxq4qxgsI2oGg5e2
	w/QSW+/Iu7WojK1bBHLs/2mW77JuaYsFJ0yxaq4OLGWc0raBgJYm2IxiCqxZHui5y680/ZYcAKa
	j2UJoFGL4ynivmyxjgce4EzgwkPxTsiD62khPHqCiO9GlGGgDEocTWLgnMsB391VhaOXVzJjizV
	hhBIIXYooKcgGwH7prnfxQeFLCny/FCwKBllsii/k6qXTkfsWUsCtm34dparCQsds2m5fVHcRiE
	jx8TIx+cPH6
X-Received: by 2002:a05:693c:2293:b0:303:f26f:df30 with SMTP id 5a478bee46e88-30820094315mr7031697eec.23.1781502561888;
        Sun, 14 Jun 2026 22:49:21 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ddaf69asm14295300eec.0.2026.06.14.22.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 22:49:21 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port OTG support
Date: Mon, 15 Jun 2026 13:49:09 +0800
Message-ID: <20260615054911.48821-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615054911.48821-1-a0987203069@gmail.com>
References: <20260615054911.48821-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MA35D1 has two USB PHY ports managed by the same hardware block:

  - PHY0 (index 0): OTG port shared between the DWC2 gadget controller
    and EHCI0/OHCI0 host controllers.  A hardware mux follows the USB
    ID pin automatically.

  - PHY1 (index 1): dedicated host-only port for EHCI1/OHCI1.

Extend the existing binding to cover both ports:

  - The PHY node is now a child of the system-management syscon node
    with a reg property.  The nuvoton,sys phandle and clocks
    properties are removed; the driver derives the regmap from its
    parent, and clock gating is owned by each individual USB controller.

  - #phy-cells changes from 0 to 1: the cell selects the PHY port.

  - Two optional board-tuning properties are added: nuvoton,rcalcode
    for per-port resistor trim and nuvoton,oc-active-high for
    over-current polarity.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml | 62 ++++++++++++++-----
 1 file changed, 48 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
index fff858c909a0..dde045aff44e 100644
--- a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
@@ -8,38 +8,72 @@ title: Nuvoton MA35D1 USB2 phy
 
 maintainers:
   - Hui-Ping Chen <hpchen0nvt@gmail.com>
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  USB 2.0 PHY for the Nuvoton MA35D1 SoC.  The PHY node is a child of the
+  system-management syscon node and covers both PHY ports.
+
+  PHY0 (index 0) is the OTG port whose signals are routed to either the DWC2
+  gadget controller or the EHCI0/OHCI0 host controller by a hardware mux that
+  follows the USB ID pin automatically.
+
+  PHY1 (index 1) is a dedicated host-only port used by EHCI1/OHCI1.
 
 properties:
   compatible:
     enum:
       - nuvoton,ma35d1-usb2-phy
 
+  reg:
+    maxItems: 1
+
   "#phy-cells":
-    const: 0
+    const: 1
+    description:
+      The single cell selects the PHY port. 0 selects the OTG port (USB0,
+      shared with DWC2 gadget controller) and 1 selects the host-only port
+      (USB1).
 
-  clocks:
-    maxItems: 1
+  nuvoton,rcalcode:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 2
+    items:
+      minimum: 0
+      maximum: 15
+    description:
+      Resistor calibration trim codes for PHY0 and, optionally, PHY1.
+      Each value is written to the RCALCODE field in USBPMISCR for the
+      corresponding PHY. The 4-bit value adjusts the PHY's internal
+      termination resistance. When absent the hardware reset default is used.
 
-  nuvoton,sys:
-    $ref: /schemas/types.yaml#/definitions/phandle
+  nuvoton,oc-active-high:
+    type: boolean
     description:
-      phandle to syscon for checking the PHY clock status.
+      When present, the over-current detect input from the VBUS power switch
+      is treated as active-high. The default (property absent) is active-low.
+      This setting is shared by both USB host ports.
 
 required:
   - compatible
+  - reg
   - "#phy-cells"
-  - clocks
-  - nuvoton,sys
 
 additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    system-management@40460000 {
+        compatible = "nuvoton,ma35d1-reset", "syscon", "simple-mfd";
+        reg = <0x0 0x40460000 0x0 0x200>;
+        #reset-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <1>;
 
-    usb_phy: usb-phy {
-        compatible = "nuvoton,ma35d1-usb2-phy";
-        clocks = <&clk USBD_GATE>;
-        nuvoton,sys = <&sys>;
-        #phy-cells = <0>;
+        usb-phy@60 {
+            compatible = "nuvoton,ma35d1-usb2-phy";
+            reg = <0x60 0x14>;
+            #phy-cells = <1>;
+        };
     };
-- 
2.43.0

