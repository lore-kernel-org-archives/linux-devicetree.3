Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794207381;
	b=QxEKcZkuXc9TPGA6epNZQoU8s9JgAJ4L0HnST3V72zo6VXJnXbJxq2Y5tkk89IxE+hz3
	 99EkT+0mZ16b61EwAe5KPFUS6hkmUaYc4l/DBMzNUOFo4m3XMfUmS/LM6TlUq7hgwcgK6
	 oJJ6r5JoIXFxNJcaUYplJKIFQyY0/EMlTWAqMhlCcwF+ea7QLJPegOsWo0mQQkZnYJ+AE
	 zxI8N9aYh3svrpI9SQ2MBsDA/yS24vyBqesQbqOD7sJtdQwMzoUtWO0NjUkNt7bF1OjYK
	 ON2W2Nd27rZ2Dvr6M2BKZpmbRUYrcYFglLX2GYprc9d/iWxstuaYqMKM7ddulvpvuKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
	b=4es9ZAQqadB8mbkqxRBZgdU0EaoDB0+pbrOCHs5udgmuoIBJ5LAHG+d7EvU+hO4zZVeM
	 0s4Dnc3PSmb4C5DDhwpeAZduUr8anFMZXh+j5q9iHYiJ6U9i+5ntG74VS9RAs6loSxqib
	 Fl6disJd0eGPpHogaX0UA+gyJw6h8ec6R2iCH2o8XA7CWTXFwCJCf23sqa+Tsoa6KO8jL
	 kED/5eC4tYrHSXWNHgEXI7GyTSZvTy2rCmvfJh4UuNUPnzObkr+GGECV8btISL+QSaneA
	 VIpI91HmI1wfH96omvC1wUV3pKRoC804AYnizcd64qJiUZFvw3bNhhy4ykBcvYnJkvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NJ1J5TpS;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23409606A330
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 06:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23409606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NJ1J5TpS
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1ae18eb9b69so517714c88.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 22:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794207380; x=1794812180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=NJ1J5TpSsfBjPBpOSA+ef3OIsEvIcjmImv703VOn+zmfhywF5u3fauGphFugqVGf1P
         19zdzpy7fsSd87keJd4F8Kzb0EaO3DlDFGba5ISAZ6Gk+eNMH4m6B5yHFLLWvaGakLh+
         D8UZ5m8N5oh7BtMGSEnnJ/u9R9UFSeWeaO6pTWVeR7SvzQb8HU5jstuM69X0dbCBZOFL
         fswKu4Ha8iiUtVruH9kV5+pIk7IlgoyDcX6hqM+EnE8y2WuUSCNxCMgPTP+FRK7DArg4
         60jgerlb7nfQ5KTdyIBYmhHFpkBRVmcQIDLU+Rks6nRX/+7un7tSdnIAzyfGJTJKUwgv
         VVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207380; x=1794812180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=iz7c/RYiP+hni9WKXQubQG5YCv2dLQtGlQpWsUzO7rwbxeKTlfeiCsHUlZ7wbTNUFa
         Mp9GlPvxOvSm1X4TZxBf4AbYj6CIvZJvTBAxrLe44Z/C8Rs5XQFiOWvABO5GWxUMP07d
         V2Ulhnp0x4Y1vob3SXGxpJA1enQTtQzvhW416zZkG9vh1NTQZ7eRkpDY4IB+gqm9ppm6
         LjJlbUkaC79LXVp0JRaDoKd2196dYLbmV8ZGpVGn90g8y8aIalAoqxbBrWqV5tWiX0zc
         sMf0Mv2OLiEH2IATFQxs6GtPx+RCRIe18B7vUFz2I/uAqf0/ocJaASwwQ9pi7BCIFxTu
         NaXw==
X-Forwarded-Encrypted: i=1; AL+hErE3B+RVLxeb4cXwga7Z7Gt7Vb3++1sMH4v4AnMjIdscbk/k2drVINnbkVQHbjBVfvGt5bkCL64kkq84@vger.kernel.org
X-Gm-Message-State: APuU4Z8+/vm7yoLTJb1fWz9XB1jlBYr9irJ4l9YVoeC2szIrlBcFldsw
	j2qfQ/GuhOj7CzXHdEdzBCzQB7IEa3zt5mk92133vm0s3CauDvz7X4th
X-Gm-Gg: AYBFou0ItlIWOYNvY9nZNB4kFBkchGjwu4vjoVvIri9XPx6vUSCkNnFdvIAdaJi8PD5
	6a1cTGgleMWMeiZIvi524YCKquH1rFHA55nky4giHIY9KLwUB/tMhMY1ABUDDNJIVLKFv+OgpF9
	gKnEl6NQLIzuggjmv2zYiXXQgx2F8ml0169PrdFk+FDrN1sjwgH3qnqF/zKxLNkIpxTzAmW/CGz
	CD/46fQ2ectlYQI4/XZEI3OPnIiHyl2UYV+qSDJyIj38GgvhABhETazyOvBTs5uPZOusd89eJK8
	WRysT/hLhsyVDsvC/vdoiqVTuSFV9MW9bP+cBL6W5+88Lp8g5bB0k5TJEfz5G+rNbaUznIzNWFc
	dect1l+v02YjzSUhTzruRG+fJ6R90JL1F3VMr5gT/5Iqqaoo5YkaA+dmw9t8plZHw5X4rE0zjpm
	R7okqjPTl9ujYYHM8H2/wyd9xGYISWirhkoe312eYb3zuPcoksA7UVQe+VwDTaBi5cMu0VLnRVP
	7vGm0dWrU8zsKrDq+XJmVb1UYRetw1ccU1+QijsuVf1M66H/tkq1IDIMexqhPosAKo3Ud5gEwWK
	b98iiYWMPsYrfgmsyMxJb/k2jk4dWbX1ch2d6LyVUgQCGTfFNQVSR24OqD+ZYMfG4sqB+sq7s7C
	PoEPv1oiAvX/f4ALOgw==
X-Received: by 2002:a05:701b:465f:20b0:185:8c9f:de82 with SMTP id a92af1059eb24-1b39fef4183mr4962866c88.33.1794207380042;
        Sun, 08 Nov 2026 22:56:20 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm10120176c88.13.2026.11.08.22.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:56:19 -0800 (PST)
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
Subject: [PATCH v8 1/4] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and OTG
Date: Mon,  9 Nov 2026 14:56:03 +0800
Message-ID: <20261109065606.62641-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109065606.62641-1-a0987203069@gmail.com>
References: <20261109065606.62641-1-a0987203069@gmail.com>
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

