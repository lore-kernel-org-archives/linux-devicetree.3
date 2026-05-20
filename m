Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561813F65E6;
	Wed, 20 May 2026 17:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779299896; cv=none; b=LKkcBlzmYs6IgOJ/QMviyY/NrspOhY+nwKc9Mhn8DhmPANh92HKLDBuIsH1vWHAR7x4ynOskreVU0vTdPNFR4Ebua1cBkicv3D+vcq66GHGbPd1gmy7ZYkUKhKPe/p8xL3eLu7SeVcf+MN7stnGIfzgk70Yw6thTTQrQHqrvmMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779299896; c=relaxed/simple;
	bh=D34oyRalJU7w4zSKMX2VWqqBPYUSTOu3AY/y9/6W9NM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bXOk4FkMyRUpIwxNzFMgisIaAZioejMl2MdUX/BexuTRr9NTET8U8IA0+19HGtjviKHvVprX/2r7xxXdfoTiB/B5KK9EfPWqWzB2fPEdVZi41HvGCwPxki37u/BywuJ6n77cFrvkozxiy68lM0MtGxSTZnuwj361ODIf7qIxCiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=TGawOXLC; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="TGawOXLC"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D43A8277F8;
	Wed, 20 May 2026 19:58:11 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcTIMyrtl7h1; Wed, 20 May 2026 19:58:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1779299891; bh=D34oyRalJU7w4zSKMX2VWqqBPYUSTOu3AY/y9/6W9NM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TGawOXLCXst5uEC+yv7g2KCMItdGo+/Kvj7urez3RkAKdyQBlOSMvJNUTaRAIh/1q
	 KS8Bh1idQjfW6K777UTQccbVEzRznsMnJxFdGk4ssA8QdNXyewRX3RqAurI5tN3MBS
	 qYh4Le1A4EgCc2VSv7Odgeehf50rqpI4/WQAadMCZvNNj38P/cca4TJy91sd6vqXQ7
	 yAJDTCNqcNQSaKNuK1H8x0luMMlWzBQ5Acr6a9pQooGRhLW/a+39qJimfg1z36WXZu
	 Z7vHPQ0HJfYbL2XHbFDqSbrQClLPINVwtaS/CVdLGQPvdm5jiSiEaJ6OgK586xV8ce
	 Wl7eNxuAoAmOg==
From: Rustam Adilov <adilov@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 3/6] dt-bindings: phy: realtek,usb2phy.yaml: extend for resets and RTL9607C support
Date: Wed, 20 May 2026 22:57:25 +0500
Message-ID: <20260520175728.720877-4-adilov@disroot.org>
In-Reply-To: <20260520175728.720877-1-adilov@disroot.org>
References: <20260520175728.720877-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "realtek,rtl9607-usb2phy" compatible for USB2 PHY on the RTL9607C
SoC series.

Add a resets property to properties to describe the usb2phy reset line.

In RTL9607C, USB2 PHY reset line is from "IP Enable controller" which is
multipurpose and handle activating various SoC peripherals.

It is unclear whether RTD SoCs have something similar to that so set
the resets to false for these devices.

RTL9607C requires the "resets" to be specified so add the corresponding
if check for the "realtek,rtl9607-usb2phy" compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 .../bindings/phy/realtek,usb2phy.yaml         | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/realtek,usb2phy.yaml b/Documentation/devicetree/bindings/phy/realtek,usb2phy.yaml
index 9911ada39ee7..7b50833c8e19 100644
--- a/Documentation/devicetree/bindings/phy/realtek,usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/realtek,usb2phy.yaml
@@ -11,7 +11,8 @@ maintainers:
   - Stanley Chang <stanley_chang@realtek.com>
 
 description: |
-  Realtek USB 2.0 PHY support the digital home center (DHC) RTD series SoCs.
+  Realtek USB 2.0 PHY support the digital home center (DHC) RTD and
+  RTL9607C series SoCs.
   The USB 2.0 PHY driver is designed to support the XHCI controller. The SoCs
   support multiple XHCI controllers. One PHY device node maps to one XHCI
   controller.
@@ -57,6 +58,12 @@ description: |
   XHCI controller#1 -- usb2phy -- phy#0
   XHCI controller#2 -- usb2phy -- phy#0
 
+  RTL9607C SoCs USB
+  The USB architecture includes OHCI and EHCI controllers.
+  Both of them map to one USB2.0 PHY.
+  OHCI controller#0 -- usb2phy -- phy#0
+  EHCI controller#0 -- usb2phy -- phy#0
+
 properties:
   compatible:
     enum:
@@ -69,6 +76,7 @@ properties:
       - realtek,rtd1395-usb2phy-2port
       - realtek,rtd1619-usb2phy
       - realtek,rtd1619b-usb2phy
+      - realtek,rtl9607-usb2phy
 
   reg:
     items:
@@ -130,6 +138,9 @@ properties:
     minimum: -8
     maximum: 8
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -157,6 +168,18 @@ allOf:
     then:
       properties:
         realtek,driving-level-compensate: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - realtek,rtl9607-usb2phy
+    then:
+      required:
+        - resets
+    else:
+      properties:
+        resets: false
 
 additionalProperties: false
 
-- 
2.54.0

