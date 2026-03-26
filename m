Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C63A3A6B61;
	Thu, 26 Mar 2026 19:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774553707; cv=none; b=fqqXlnAxKY9CNjrMIoHyB56nkRBQjhqMstXbvYPdtY9JffBxBGD/SRri32aXE64WyAXJnsqDkNsm40e8YJ6WuqvthO+r5Vc6yGN18rENRH5NSyPniLOZ3MuV2+Tl4J+n992EfX4+e4BrQ6X/q1QLaqKXbUgKM4eWt7IYI/hESUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774553707; c=relaxed/simple;
	bh=4ZmFKr7dM5tEngab2lKeqNKhMtO+0Uw5iKWA8I4POAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FZ+8SO0/EFpLzyzolQC1+AQFTHN6oPyWpPF1kLb08XERvOS6U59kv+8/1+seihHYjrkhpD9AY3n7gru0VEl7y5jBW+ZfECd7utZ9S8pf0oObgHwL/HQMWJKF4UfVknovWsD1HvWj8zBGCuxCyPsFa5J5pey8pse6YkbXyOI4e24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=HVjdZM2m; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HVjdZM2m"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A1ED227080;
	Thu, 26 Mar 2026 20:35:04 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otfLdpXYr2hf; Thu, 26 Mar 2026 20:35:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1774553704; bh=4ZmFKr7dM5tEngab2lKeqNKhMtO+0Uw5iKWA8I4POAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HVjdZM2mEKkS4pMN92I83CQk7IKDECsPmh2N+/ClIisxfq6F6ozQav+7j5IlbgDd6
	 ZvxguyAQ9A2Ipb4vbJClYvHcqEchx2J9YGqp4ZU0m6eLsIQsutsQfwqS/p5AGrMXcu
	 +6i2U+AIVRiEWuJpbNxNuDBiXYn40ig2Uhktu1ZyQFAQ4FpKs1CvjRKlO6CiPJ8FfS
	 eT5ZIM9Ah571ELwoPk6dD+Kaeck7kTyBEMKTChs0RcXkM2lVuopMZcm7OJup5y0JTd
	 4yxnBcLxlj7528hiud/2p65sF5DBBmSPFYc4uwBX3eS2mw57vV0DJtSM5c3LyNzj66
	 GDPS1zet0IvrQ==
From: Rustam Adilov <adilov@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>
Subject: [PATCH 3/6] dt-bindings: phy: realtek,usb2phy.yaml: extend for resets and RTL9607C support
Date: Fri, 27 Mar 2026 00:34:16 +0500
Message-ID: <20260326193419.48419-4-adilov@disroot.org>
In-Reply-To: <20260326193419.48419-1-adilov@disroot.org>
References: <20260326193419.48419-1-adilov@disroot.org>
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

It is unclear whether RTD SoCs have something similar to that but make it
available to them anyway.

RTL9607C requires the "resets" to be specified so add the corresponding
if check for the "realtek,rtl9607-usb2phy" compatible.

Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 .../bindings/phy/realtek,usb2phy.yaml         | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/realtek,usb2phy.yaml b/Documentation/devicetree/bindings/phy/realtek,usb2phy.yaml
index 9911ada39ee7..cdc7b72e5f60 100644
--- a/Documentation/devicetree/bindings/phy/realtek,usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/realtek,usb2phy.yaml
@@ -11,10 +11,12 @@ maintainers:
   - Stanley Chang <stanley_chang@realtek.com>
 
 description: |
-  Realtek USB 2.0 PHY support the digital home center (DHC) RTD series SoCs.
+  Realtek USB 2.0 PHY support the digital home center (DHC) RTD and
+  RTL9607C series SoCs.
   The USB 2.0 PHY driver is designed to support the XHCI controller. The SoCs
   support multiple XHCI controllers. One PHY device node maps to one XHCI
   controller.
+  This driver also supports the OCHI and EHCI controllers.
 
   RTD1295/RTD1619 SoCs USB
   The USB architecture includes three XHCI controllers.
@@ -57,6 +59,12 @@ description: |
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
@@ -69,6 +77,7 @@ properties:
       - realtek,rtd1395-usb2phy-2port
       - realtek,rtd1619-usb2phy
       - realtek,rtd1619b-usb2phy
+      - realtek,rtl9607-usb2phy
 
   reg:
     items:
@@ -130,6 +139,9 @@ properties:
     minimum: -8
     maximum: 8
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -157,6 +169,15 @@ allOf:
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
 
 additionalProperties: false
 
-- 
2.53.0

