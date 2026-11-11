Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382309;
	b=Ma49QpDpswM/gojO/6EctPj2/TzsATlQbzmyBioUhd6HcIDq0oHmvEu8bh4hqbDSi2H2
	 NGvMKVsJMVBQF1HIpRqXwZDLGc9X2spR1tAK524kSD/HRd6tidKZ1jGFATbnqIkL1yZ+X
	 759RpKzQCF/cCxO9eVkTNE2vMzoCxP6GYi8/z5AAf3tjEBw6RS2plK/p0zgjBraQbn+jW
	 c4Ct7jDz5/q25RJ3N7FfWdzCmPtiG1g6zXPh4AyTWboOJh/SUNKGG2XAMU7MGGm8pghw6
	 yc6/ZAkxLc/CNOOdJ8AplXStB5bhAB5tOY5rQCA715t8k5jqLWRieUh7naGUEc3Kk0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
	b=2MXCE1f6/dOwDzRdF8PRC9UiVbXNTdkw/R4LPN5TGTC/OmLpeLg0OK2yAX4xrSUtZEST
	 fhahAxpm1jzjs7f/2Vr2gjjHtyKeBv47ZYaajJsRBVSKZzcB/H1KZmrEwPzVTJymckTnr
	 BlNFzRIBBTUi4+7vV5PkdwfqneXZDWg1I9ymNRYRDdxABJ9mNnQhPJc/QSI607BZfbXe1
	 wdwBgAdxtmnnpItX2trosL0ffbY9UPcm1OSusnv6izDiZ5URl7As4D6Hrkx5NDD8lWFN8
	 6ZkZia6UDHVuB841YFAMO6S0I3gu77afxikaL+48b3ok41+O04JLHJ91+fZrgADWFNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RfUUt5q/";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B108960A2620
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B108960A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RfUUt5q/
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso5924735eec.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382308; x=1794987108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=RfUUt5q/D7/C3thNae+CWtR0BgB7jbfkU8p7uK0ciZpMW9MmyXBEtJ+8RpQXZe8ci+
         Ufykdt5aNVwpeQtFjWQIGP1kG0lvTe7jEwUWXRMQTgIALXnZl1DkwDVg+YKiE4e8c4qc
         PybinaSOcsvmrJ4sgcuB82pTXOEwThfFTCmjpLqesHbOUKvA3g46zy4imxtCacktBZMh
         KjleZ7pNPIwYC00GHxXs8y9lNlpmEUNJe7n4+pVpBHPvW8QcqupGTWKAppX2DKQPXvfv
         y/oNd7Qkl3GlnYN6QqOZzoaRZLHbb2929Qhy4fMdKGRoeenisxRCkP3UCq8tc4DXGHf8
         lmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382308; x=1794987108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=CrhBy0DqLytlH24eNLgPkO+KbzDiuFIHFzRs23PrnpLHqtVJRNtCQb63PK+H2vbhun
         CYAmYPaXKcdRNsDBU8k1NLksFZavR4SOmT4bh/Ic7uZ72X5Knk1K1n5xHG2HCmnINzaI
         G5/vKOWcIPPVreKeKtAbI8iwTxEg+hXBKWEo3478YKilBcm1f/I2Mlovg6oHvRNbmoOx
         xYpYS7iVYumROQrA+1Zp7PCTLxTrsYAjkA8Dgt21Qiu3Qx0QRh6ea6sXbUxdSE2UAMGd
         /a5scctqzZs1K4OKttiiHGYsWW8QLwwXNtCmxtSXMAngx2KK5QWEoIpw4CuDQpm5bKZY
         BiUQ==
X-Forwarded-Encrypted: i=1; AL+hErGBRaTll4tOJIT0eoBFwkIC2042xsIoHZ3iX4kV71bxnFROU+ZkkzbU86EfqpxjVQDKmPpvG0xkKv//@vger.kernel.org
X-Gm-Message-State: APuU4Z/Bf6du39hJjWCS73KYzAI8AvCVZmxfhH6Cp8YNIOQ+mvVjdEuk
	nqjuTEyyU4Hkfl1fq9b1h5tmc+arucgf6GL8s11kNDvxmEe1NE3nwxcd
X-Gm-Gg: AYBFou25LtzDbiWtpYaOyqX4nUvzX62rnqpGGaT8cuDX6c/q0i+Ks8CYoS0xt2gy5d5
	Fh9J3pPTHUr8tSTzkF0Ma/nFuQjrkIzNFq+H3AEs+wP9IGhTejBbKPhP4LOVp+iVx8pw5cADiPj
	OelFOz+04FrjkMO0gWWSK6tSav9MgKlQif5DI5aGONq2dbXPTuIcNKXIa37vnGEC0A4RmTDVm4c
	P68AZgUOIT/JNUVNgalKrndQFqtGEpG9AuolligA18Up8mQWkec1+ibTvBM0rqnlHrjZOSTLbP2
	UwHmQ2nJgd0AewITJxBmBsKTsMdz0V5KZKhL9fJov7AQ3xZO/DyzsBB9gBKoZ3O2BtFoabw+WWp
	uR0RB9IoJb1R8i5bJ6N8EGAkJ7g40QMTHIGmqHNYSyMu2Gv/HQFxe4+ZyLJDm5/53kNc8U+AHlA
	RqYT/WYX2UYYk8xRBfBFftKyfazNq2q5YOPgWnbSqvnnrfDSNUdqfIGxMNgRmaolJyFzaxDjmAH
	U7xJ2mbM2Kmvv3R6aKVDd1jSF1FKVlMCPy7+QxkC4suGOsqWkvyBsDeO31rUJjwPcbxPJk23oUE
	C7RDUbULDRqo7a+nipNxP7mqpLg0qZVtqRlWRKlb+EVlnF/tFDbirVVK0cnm2yOew8Kunjxtg2j
	a9aJ0iL+n8yCXQXXzIg==
X-Received: by 2002:a05:7300:d198:b0:375:f17a:d691 with SMTP id 5a478bee46e88-37686859024mr1969808eec.38.1794382307362;
        Tue, 10 Nov 2026 23:31:47 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm12640655eec.8.2026.11.10.23.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:46 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
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
Subject: [PATCH v9 1/4] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and OTG
Date: Wed, 11 Nov 2026 15:31:34 +0800
Message-ID: <20261111073137.381966-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073137.381966-1-a0987203069@gmail.com>
References: <20261111073137.381966-1-a0987203069@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
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
    board design time to match the PCB trace impedance.  Both PHY0 and
    PHY1 values must be supplied together when the property is present.
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

