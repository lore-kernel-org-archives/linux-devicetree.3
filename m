Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50FE3AA1A9;
	Sat, 15 Aug 2026 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786785286; cv=none; b=OXEouiJIUIeQymvtMTp0IXsrc9EndHUOSBWGtgtwbLH7STtbpeK0SuCG7SM4FcMPY94CwUrr4uAz60LqfPmfOP2oW6uFwh5r7ZThDYkpaMlcpFhmdok6LEnMIXz4wrd8nRlBDpwxJoPczrF2uCt4k0/rTz/2p7iwfbGL8YsairM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786785286; c=relaxed/simple;
	bh=fy1Yhltaa1Q3i0THgRe8+wftvG07v8/paH+tXjFdftg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hi+f5bM56Aoaph0zHgp6pbyQU2L8u46GkgD/XbDvsuxDU/iuW5D5PR56sl8Ae5N8OVOt9beph3QsTzm53K+NOiJFwsfkf/pHNmjAmJi2MqULjK9xQq30oaiUZ4DYTCq2y8YYDdiybo/UFEcjUkSgBM6s5uNEqkJ+ttzAfFhssXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=dTiyPCvu; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="dTiyPCvu"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 53F92882CB;
	Sat, 15 Aug 2026 11:14:41 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKqDhHViGYTz; Sat, 15 Aug 2026 11:14:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786785280; bh=fy1Yhltaa1Q3i0THgRe8+wftvG07v8/paH+tXjFdftg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dTiyPCvuNjw2mJ3U9xgC06JwyMT8JPvWV1j6AYiXXBuDKCsjEhtLGw5QAqh9xXMzM
	 3Sv/cSph5wZLLZ7DwWjd2Akjg81vdayQS47TGT1PRLtS5Fv/VdwJyRDSK2RFtrZfwJ
	 wx0x09BCLGgwMk77tnMmJ96Pqblyv6t3tCn87gPX77SMWhEbnO1bJ+HP4nQrNs2q9W
	 r80nLwmuetmEsL9K9HyRN7DRO9+FA97B5ojw3oKEbIIk8zmzdDKUpedmZMOzQ9d26k
	 wN1yG6wbG4Ff4DYEDgKv+FNfecV8hzV+znMw0+PhMH7iykVxsFxC9/N1WNN324DB8I
	 l6kjjpPVx9llg==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v7 3/6] dt-bindings: phy: realtek,usb2phy.yaml: extend for resets and RTL9607C support
Date: Sat, 15 Aug 2026 14:13:37 +0500
Message-ID: <20260815091340.26910-4-adilov@disroot.org>
In-Reply-To: <20260815091340.26910-1-adilov@disroot.org>
References: <20260815091340.26910-1-adilov@disroot.org>
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
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
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
2.55.0

