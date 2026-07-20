Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EA6392806
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542954; cv=none; b=JeHHQ5I3cBQ0xXuR/yqI69uG8keKm9QEtIph9XHpmqtPB6E497T7CF5GgjMWqmLWzqfPTMtS9UgjDDyxb5gTRHafccdAYhaM10pT/9fgG7jXId3O6Q1XYf8ZLdyZsvgP+iWKn5xmhx5Ha80jK0jS9+mcX2FD3qRKIREm270Mt+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542954; c=relaxed/simple;
	bh=cIwC0oC0HqkbdEbqtI2pH3Cw4jfxhvxzji3+pSjEakI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EKOiZk3s/sCJlp7f3/j+de/uzxftYP6io+cYZEXMSkfvDXpgn1/zzMl03iUuk4E8D80qJ5PR81+RKfCa5VhN34+LJ5czUlSUpZ1ddvn2go5YC+ZKIn0mZIqwixdxQD+kOMAGE6XuLF5obOBpwNwqfb76SJM6qQHDoLk3teq8a5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r8ZPU+tn; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r8ZPU+tn"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso6050214a91.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784542953; x=1785147753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVUZrYg+XX3ftKTmbZ6y3GjBx4YY/KKIzTtukvscq4w=;
        b=r8ZPU+tnpOeK83QJ98q6B9nuG79Kpr9O1UFxoSBFKRqzVlryCbvKckVUlVZf7VMilz
         7cKQA42+L2vu1r7CGavr88ChtS4lQN8P9i0BnEjUVBcOKDVORmNignLEelr7j7+sRdSK
         eX6VSgjNBQ8jHYuliwjBB+zslehw91dAPXUtT+IXYpXFcNMwT+75irp6uMCY/GMhAtiN
         cJOgFOYT7O7Nt60aQAEdPOnkkCqXVxe3LS4Y8Ofnhs0+jAbjvGQOQjglmYKcxwJICuwy
         hLyryPGNMgf9EL/joWA28b29jQW4sLbh/uej2LB/EvWBnqRHV4LO+UNGApbRkHY7dZyW
         xoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542953; x=1785147753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVUZrYg+XX3ftKTmbZ6y3GjBx4YY/KKIzTtukvscq4w=;
        b=tIXVEwTRHGD9/p6nZkHc7R8DLT7lEusHU9rmk3+7URTpwGJUrZ6p/SQifmjviu7aZ+
         HqThrnzqJdEq3qxsp0/o5N3mK7oqwb9yZz1zKz0ezGNZEuGuP+vMTItmKf/YUa+ROxsj
         v7Ine0cDp9gBH/OPgLwIioLUlEbo7WP1fvSg/wD6zPsruo4fSnIfz9nwAyrYI51lv1pQ
         g9qYTGe4CuWPKUpxNWaLHsrnSCrOgcGwokjrcRx48T/p0lQaNS0zzG+Qzyo5bdl+YoW2
         pn1afzLkqSOxCwmUj7qdQ5iHdRDjdTBRPJ8G8g6TuUqihK4d4fNrkub+s+y5ThK9KDq/
         TCOw==
X-Forwarded-Encrypted: i=1; AHgh+RrHozeUqGV9vLC40gWclQiaabaK247JzbFOuMY+MU7NkWqDwatRCLhzoY6mR4t48Rvz/sshvbwk/VNf@vger.kernel.org
X-Gm-Message-State: AOJu0YxCyz3Jw/c6fn+IlK0DGA0C6SXk8/nl7cpfJyohVzbTIBsHo5Rt
	J/u85BPJKXeBA0Heof9wdPan4YCZ4dEUuLWpudLcNp1DbPxg5Jd0fVZq
X-Gm-Gg: AfdE7cm8H/WcjTZUY69sR+FS4JS6iaISzPxRkjm8u8h65j7kfoy7ozrVp27ezFuVV66
	OCQjuTyKfw3g2haxYvGxA/4qPVguEszgwIzF+Rhcql++Z+fri3mW1ImEl7c8WLEThxh9VmS22ci
	ETyHgfE+YZVYFPF1b/N0UYf6073dyM/yC2lNr3JrIePR9w2Ncuded4UBh9ahTnYWan7lBUhPqRr
	pvAusoTO+htVErf1e4uSM6m3F8OJkq8cp8Gcvre5gEot5zCak+r3JpMcOL0QMyVtp4l/p6JHmNG
	NcJrrwyFOa+breDkCucFK1m76+90tN5Q4oEnjyZm4l3mSfpHgOAd2uzHQ5MyBSfW2sNDO2hRwlR
	ozPblmOOxHCc7dQuU4OwlTOpxYf7cgNlA9YHwDkFWOXGFmM/fR+Z/dRZlaLvbdmPT1Pp5VzzqH+
	1xVXE+ipkMDhWllgMltLr8pxiueXQg2rtwlNTqhD7s0CVcGLVFu/ot2MD973Ep+1Y=
X-Received: by 2002:a17:90a:dfcf:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-38e4b422aaamr13448276a91.3.1784542952701;
        Mon, 20 Jul 2026 03:22:32 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b20df7esm5616125a91.13.2026.07.20.03.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:22:32 -0700 (PDT)
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
	Joey Lu <a0987203069@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and OTG
Date: Mon, 20 Jul 2026 18:22:20 +0800
Message-ID: <20260720102222.251179-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720102222.251179-1-a0987203069@gmail.com>
References: <20260720102222.251179-1-a0987203069@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml | 44 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
index fff858c909a0..1bd22dd0e5fc 100644
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
@@ -42,4 +81,5 @@ examples:
         clocks = <&clk USBD_GATE>;
         nuvoton,sys = <&sys>;
         #phy-cells = <0>;
+        nuvoton,rcalcode = <7 7>;
     };
-- 
2.43.0

