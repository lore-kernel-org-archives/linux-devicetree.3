Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916B03B3BE9
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 10:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783506984; cv=none; b=rHjWuoUbJLv8QH09coWOeX7kgLyab+wAT5faZY2Ls0ZJN64n8u4oZScLgicTXbq9Njkadc7p5nhqln79tWomn2BMzBLWn5tD+EBvQbSXOAey4tXLZdB9fExlwyZb1okHMqO1Xt35+wO4fykHOM01xKnEL+geDnpVfCsRtKcGqEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783506984; c=relaxed/simple;
	bh=Ob0dYBFqY/5HTxCXhKqts/RHtKz3wp+Q7Jld3x+7WFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnQTql4/Cl7bAMCKmfdNobiJTcJLiKmlMhXty4cyteK8WVB7TF/ADvRX5ezRURagqO1t58Sygtea1Dq2dQPHxTVoTBBRZZzSczZiGz2luexF8RJ0EDa7xlWtWrWRX5O8mTBMMjWp7IHCRrjc0YxJqlYoAk0kEqquMO5zg17OZqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hF3+0phM; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hF3+0phM"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc6ae3e7f1so3346845ad.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 03:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783506977; x=1784111777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H89YxPz+LDcG3sLulupfETRoJ4vkpxtSzZRwMnjcQcA=;
        b=hF3+0phMLDvtTJhUkpYRAC/YTKS4ngfwK0SAP1TpGjhADu+oTy72gpZlfZw1+wPJYg
         Uivn2sRAmyrkmaoLeMopDrqay5G7e0rwQlr22fGu+HyYBYQBYV08UQi7IdeuLqlizMgp
         FAWdI3JBKsxPyD7xOBuNCTbLJlyaRs/jDrd+hxFtHL9UfRkMB4P/TtX8OL4YtpIE1ecF
         pI747iIo7MGZXPW/+8hOKpsFZRQe80ubIfxJD8Iz9q71jYejwaDsSGKwTJbRxQNVVOV3
         9P1neaGJs991SQvd/bhMod0fegLCXtHAQ8R6yu172PTsXqa84AWGS3udfX2PJHmIXhja
         4H5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506977; x=1784111777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H89YxPz+LDcG3sLulupfETRoJ4vkpxtSzZRwMnjcQcA=;
        b=khIVXijF5VoSOSiUq8R2PPEPqiZ0drK70Oi1b27FYbVLTFnQKKdsHZgKnPWlY/HKC4
         C5Mcsh1KBDb+X67sk/lNhuqLr0NPKanH1uqbv5UurV0kxHWrAoaLwGKazVBHj+b7JMPA
         qj/TWgG2h5LzrKH7SAdQgExPz96Rpdvfnb46v1HibT2VChZRyTyDNQodJMXgArNEVAVA
         aN9rd03nrny4wqo/TZe21iZYGZJsqhse4n1WxQLGFM3GgarBW2QzVOcQ/WNA+JPikths
         8h/XhUBQKlBe9OyNrg/vAb2yjTirAp4jYhlxUYDmirtajfxK9yuseXG9l17NX2F0dlU4
         8oHw==
X-Forwarded-Encrypted: i=1; AHgh+RpRQAXYEyjnkOO4zq/Jk1ehkHcPdK9ny193VWR/XwNlFtj0S4150cQuH4vL83tcBu8X9XWA9HnLud7M@vger.kernel.org
X-Gm-Message-State: AOJu0YzH/F0/sx+qruCsovw5WToiyW9yyk3yrOHh1N0GKGf4lLnmeKPd
	u8Z5Nk4escUHePM39GAGCZqvurcvtwiID9oBvziSq8jLmtpguG4IrdrK
X-Gm-Gg: AfdE7ckoQz2KGo7mthp+44mcEZCBIoHTnhO/kHmrvtjqO9VXiy3oRhY4S5fXlmFExml
	ASt3V/tPEYeWw5Grbzwqp7P3WGFOXvEMs/ZvdtRDRb/vPHKCFiSkLiQLYtllqBiIfUwrNqIu3cY
	FX98Q/PVKJqyHuGMhZsUsjuH9x020tMJz1zwvUwuHf5mUyCNkXK74uKbizV9tJrMDF2Byu1Mq0e
	WBDCooJOgY8VKyaFuu2Umsn0G2MMW2EfG64gOEN0aSeORY1cZyhFOok5TtLzVxdjHx/HFXE09Lo
	1W6Fr6eqxNhPaDS7r0tdW1me5JjBXNNMfL7W4f1sPq2HL9TQdrk6pK3qnLurMfT04jh2bl3Fp43
	IS0n+LOre8pLrtNlw+yLtwkpmNJuVQqgC8P7n+MZDUyG2eW25YY+fxk1C0dbUcw3oUpBZ39uSyo
	JmqXxjVWrfamRjhvKOyX+8nUTQcX3moOsiR8QmDar/sfhqxPnLt9aCZgPEQCtG5Bag9t410NQma
	Q==
X-Received: by 2002:a17:902:dacf:b0:2c9:e9c7:2b59 with SMTP id d9443c01a7336-2ccea42e1famr18928175ad.35.1783506976495;
        Wed, 08 Jul 2026 03:36:16 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9a3sm25987525ad.13.2026.07.08.03.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:36:16 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and OTG
Date: Wed,  8 Jul 2026 18:36:04 +0800
Message-ID: <20260708103606.1462960-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708103606.1462960-1-a0987203069@gmail.com>
References: <20260708103606.1462960-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MA35D1 exposes two USB PHY ports (PHY0 and PHY1) managed by the
same hardware block (USBPMISCR register in the system-management syscon).
PHY0 is shared between the DWC2 gadget controller and EHCI0/OHCI0
through an automatic hardware mux that follows the USB ID pin; PHY1 is
dedicated to EHCI1/OHCI1.  Because both ports share the same register
topology a single binding and driver should cover both.

Changing '#phy-cells' from const: 0 to enum: [0, 1] lets consumers name
the port they need while preserving backward compatibility: boards already
using '#phy-cells = <0>' continue to validate and function unchanged.

The two new optional properties:
  - nuvoton,rcalcode: the resistor calibration trim code is determined at
    board design time to match the PCB trace impedance.
  - nuvoton,oc-active-high: the over-current detect polarity depends on
    the choice of VBUS power switch.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml | 45 +++++++++++++++++--
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
index fff858c909a0..191d1b2272ec 100644
--- a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
@@ -8,6 +8,18 @@ title: Nuvoton MA35D1 USB2 phy
 
 maintainers:
   - Hui-Ping Chen <hpchen0nvt@gmail.com>
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  USB 2.0 PHY for the Nuvoton MA35D1 SoC. The PHY node is a standalone
+  platform device that accesses the USB PHY control registers inside the
+  system-management syscon block via the nuvoton,sys phandle.
+
+  PHY0 is the OTG port whose signals are routed to either the DWC2 gadget
+  controller or the EHCI0/OHCI0 host controller by a hardware mux that
+  follows the USB ID pin automatically.
+
+  PHY1 is a dedicated host-only port used by EHCI1/OHCI1.
 
 properties:
   compatible:
@@ -15,7 +27,12 @@ properties:
       - nuvoton,ma35d1-usb2-phy
 
   "#phy-cells":
-    const: 0
+    enum: [0, 1]
+    description:
+      When 0, the node exposes PHY0 only and consumers reference it
+      with no cell argument. When 1, the single cell selects the port,
+      with 0 for the OTG port (USB0, shared with DWC2 gadget controller)
+      and 1 for the host-only port (USB1).
 
   clocks:
     maxItems: 1
@@ -23,7 +40,29 @@ properties:
   nuvoton,sys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-      phandle to syscon for checking the PHY clock status.
+      Phandle to the system-management syscon node providing access to the
+      USB PHY control registers.
+
+  nuvoton,rcalcode:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    items:
+      minimum: 0
+      maximum: 15
+    description:
+      Resistor calibration trim codes for PHY0 and PHY1 respectively.
+      Each 4-bit value is written to the RCALCODE field in USBPMISCR and
+      adjusts the PHY's internal termination resistance. Both entries must
+      be supplied when this property is present; when absent the hardware
+      reset default is used for each port.
+
+  nuvoton,oc-active-high:
+    type: boolean
+    description:
+      When present, the over-current detect input from the VBUS power switch
+      is treated as active-high. The default (property absent) is active-low.
+      This setting is shared by both USB host ports.
 
 required:
   - compatible
@@ -39,7 +78,7 @@ examples:
 
     usb_phy: usb-phy {
         compatible = "nuvoton,ma35d1-usb2-phy";
-        clocks = <&clk USBD_GATE>;
+        clocks = <&clk HUSBH0_GATE>;
         nuvoton,sys = <&sys>;
         #phy-cells = <0>;
     };
-- 
2.43.0

