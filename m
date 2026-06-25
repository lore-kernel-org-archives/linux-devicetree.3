Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF06634751B
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782355214; cv=none; b=ZP0hdn4PfRKOtAB7Jflq1Cx4ZafKffZ+xEd07OPQCEOjPeqUpedbPi9o8NSjJmK4HlAKOV/Tbx6IsJOp6Dm/A7TCO9TxDHbU7I7GdcjrFAaOLvZGTZdOy593ESiWd+q7AV/ldBwt2i1jdzbRF3dVO4VSfGPqJGbhQI1lf9eUeQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782355214; c=relaxed/simple;
	bh=RlWoprA4UqYzBkfHA+20Lc29JywsSGFfnGk3IILvqKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EvAWyiMGk1yFZ0XsVsThvshFYd3C3oeBPybLhgrGERVnoOpK1RwkC/hWN0Ti1IT6JHWwGLQeQRv4z5qC7EivO1+nObKTX0a9FOtIVdoifLC+7MXD3YFWAdqpl7GS2MB+TNGTS13QwWLLP/QJh9Cgi7bDpCQkqqE527A+jqNAtbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfwbT6eG; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfwbT6eG"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37d70036426so977787a91.3
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782355212; x=1782960012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hg7nZM6fsd6Xr+ewyTepiGiAfne1TUcKmrwNgtdGTJs=;
        b=EfwbT6eGYw2lO5F9qUY2KK16o2NeYYouTpQxObYYPwWIVLLr8tFE6F192yUo1dLJvV
         EFBrLsUNlN0rqOYo4JqMehpFvHdJXV4jf0z22cQERf/SYJACGDdVnYPoReAuda5QaFCe
         VVpj6G7rOkz/E1x4si8br6XedHrk9qVgHzL1gjDm685z+LDCAitKGQ9vWKwgs/TmRN7H
         QY9AyFUc7EGpkSKsUBggdF74ZiX+B8GcDbERnFVqeqnJmu3WVJhtqj4nsUQ1YQcKwjmf
         KN3k0T8BQwZTqiVjEwM8D/HD2Pw2sUU5VHwIlO+MY31KTWr5NLrhJRVpd2fHzQWue5Ua
         JDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782355212; x=1782960012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hg7nZM6fsd6Xr+ewyTepiGiAfne1TUcKmrwNgtdGTJs=;
        b=fsWVhoJEFgzQoG5/kJu+19Yqy82Qnym2rr76oQdDlFFJMGW92g6qzg3DudWVtM1/CW
         Iq7Gz98yHRboK/JizhXIwMmZ9iN8AoGljNvWV3Wb2sDZk6RphQBUQ1Q4r6fklskJqzG3
         4cg6ZJkSi9d2L0bMYBHWePwbsndc4hzCPOF5LbhxrVkGH0b8yIHWcRAC3OGT7SqFddto
         CPRLdDHo1S9ZS7n2eRwUYvLW5NxphhFK1S/kI6F8cDQ1uSePaMvLtqi5wiVmIoCbDUl8
         wPVHjZFs54EanGHSEKDbgPHMUbPH03hx1vu5jxXSmHvlPeiADrQQ93BdFIoQKDfaxfEN
         hZLA==
X-Forwarded-Encrypted: i=1; AHgh+RrBIIabOdcoAGy2rknn534KHyKICYzP3Y5631G6rk8JSE1B1MGRs4GKIUgPXsrsBGix1xGJDqUJxhFB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz2VJkey21T7dqCaB7Y6s4DjWbo8k0nlmLs61r+zTd22CHsLIg
	o3esAS8V4ZvH72SpxWx2NJX3FVQE4+Rc4RY2s3eK66JWJqFGggpFs6cC
X-Gm-Gg: AfdE7cmAj3HjUq+Y484w3NJVLCihZ+RjIQ/anX0S+EmzOL90thYIDVO+QdN7WbghpOt
	/oPllN86tZpeORSq3IErEH3/MSzM0YsVjJ37YHojA20EB7ZillB8st1MjTt82xMSQvotj0OhHjh
	MBxKFnG0MZeakx3Qj/4UbPvhKNUoOHdZKuFtAW22ZJWCDJ2nSvWaNy4nmLhBuYqLxNuvZQGUk6s
	5F4RdJaKpds51yAyv+w7/31XMZqKnf/auuJpQqSB1g4P89vA3WAMVK+dAF7VIBnUCKqZdi42Ibi
	wz2aluF3zoVnShfNaP1ydrfXJzhi2DmvFQvUv/Cnkf8xoKw+4UghjLTeXYsoifNnF0pmXCBFqNy
	9obB5mBfNbPUJ/EKFLkEMDmoBWekhwX8ftuSjSlgSbgpaJx+cTjCxM0G0Z14fx+8OSjr1hhMtcA
	XLK7MIGPDS5BcXYsZMiCYx/hBTga3AoV62MrXqDnCdR/IXDLP4wswKOKyLMrFkRDzDFl57mo9hi
	g==
X-Received: by 2002:a17:902:f60c:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2c7fc9e00b8mr7166655ad.29.1782355212044;
        Wed, 24 Jun 2026 19:40:12 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64dc839sm8538545ad.68.2026.06.24.19.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 19:40:11 -0700 (PDT)
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
Subject: [PATCH v2 2/4] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port OTG support
Date: Thu, 25 Jun 2026 10:39:56 +0800
Message-ID: <20260625023958.569299-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625023958.569299-1-a0987203069@gmail.com>
References: <20260625023958.569299-1-a0987203069@gmail.com>
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
    with a reg property.  The nuvoton,sys phandle and clocks properties
    are removed; the driver derives the regmap from its parent, and
    clock gating is owned by each individual USB controller.

  - #phy-cells changes from 0 to 1: the cell selects the PHY port.

  - Two optional board-tuning properties are added: nuvoton,rcalcode
    for per-port resistor trim and nuvoton,oc-active-high for
    over-current polarity.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml | 62 ++++++++++++++-----
 1 file changed, 48 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
index fff858c909a0..a20d03c80932 100644
--- a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
@@ -8,38 +8,72 @@ title: Nuvoton MA35D1 USB2 phy
 
 maintainers:
   - Hui-Ping Chen <hpchen0nvt@gmail.com>
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  USB 2.0 PHY for the Nuvoton MA35D1 SoC. The PHY node is a child of the
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
+      Resistor calibration trim codes for PHY0 and PHY1 respectively.
+      Each 4-bit value is written to the RCALCODE field in USBPMISCR and
+      adjusts the PHY's internal termination resistance. Both entries are
+      optional; when absent the hardware reset default is used.
 
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
+        reg = <0x40460000 0x200>;
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

