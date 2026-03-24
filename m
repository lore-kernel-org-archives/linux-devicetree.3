Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7459B3DA7E3;
	Tue, 24 Mar 2026 09:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345033; cv=none; b=aFKCxr8O11t4R/CgzqUAegkv3eyYLxcF/kbik6eDgAZmYrGrUXDL/uxHYwL5Yq4xSecs92H0QDGkvEk+I9Lqno8pP17Fm3Tim8JUPsgaEdmZtykamPaak0jreihxUgzCNZS3yC4D43LpLMu1nJKljqs3AvFF9KGRy/xUyUdp1xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345033; c=relaxed/simple;
	bh=wJiWrtQGjxB1AByDaNG2VsdLRsFPNe+l+X8OeOgm9G0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WzGOA1EwlxsrzV0inU8hHQw96xEMTl6HkXwnizHjMDdDOYNgDF8KmYwTEDf783lFyhDM11VNGEYVBzBYKvSUHyMwrxc5/oG4gPbpRe5ZXl/TgQf8pePSoAa4Bv7T+FwW7+qqFFfwkhs5B0tFR3rfp1hHk+ZEoZoJMwxykkLPkUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=bCKlw4sX; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="bCKlw4sX"
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 7F82D275B7;
	Tue, 24 Mar 2026 10:37:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774345030;
	bh=SGe9Ea0du/z3XFPAO984Z8weC3fJi6ZlDoBA0mOR4pI=; h=From:To:Subject;
	b=bCKlw4sXjxtW0t4gHkWFIH0ljtyh/DjUCBFhBUrsFQeBpLgATtRzcZoc9wg52AQFZ
	 vJUry9DSVIoq8rqWwXDg5RWsMsJfLbxBa51eTxl6GNe7kNacdEYnAwge0NyxgFPs6Y
	 K7PqHtcTqhgvNfprubeAD83dYRMManJxmTs+QBh7IFxguF3NLX0HULFrCFg7mj2lh1
	 52aA8KP+CfNFhLzbfTzMDM94iDfNA58/QxAp5k2u/eJK2E4iYMbTjygHlWuxj4Uc9p
	 ECRl2mkoQTxm9SNCbHnOM//ow5Z5q6vg5sgWTGA+diK+Ws89A7TNKD6bGQr3djj3Pm
	 gCm2U4C2M+O4A==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/7] dt-bindings: arm: ti: Add verdin am62/am62p zinnia board
Date: Tue, 24 Mar 2026 10:36:56 +0100
Message-ID: <20260324093705.26730-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324093705.26730-1-francesco@dolcini.it>
References: <20260324093705.26730-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add Toradex Verdin Zinnia carrier board mated with Verdin AM62 and AM62P.

Link: https://www.toradex.com/products/carrier-board/zinnia-carrier-board
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index adda61e06173..2a6a9441c23d 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -79,6 +79,7 @@ properties:
               - toradex,verdin-am62-nonwifi-ivy    # Verdin AM62 Module on Ivy
               - toradex,verdin-am62-nonwifi-mallow # Verdin AM62 Module on Mallow
               - toradex,verdin-am62-nonwifi-yavia  # Verdin AM62 Module on Yavia
+              - toradex,verdin-am62-nonwifi-zinnia # Verdin AM62 Module on Zinnia
           - const: toradex,verdin-am62-nonwifi     # Verdin AM62 Module without Wi-Fi / BT
           - const: toradex,verdin-am62             # Verdin AM62 Module
           - const: ti,am625
@@ -91,6 +92,7 @@ properties:
               - toradex,verdin-am62-wifi-ivy    # Verdin AM62 Wi-Fi / BT Module on Ivy
               - toradex,verdin-am62-wifi-mallow # Verdin AM62 Wi-Fi / BT Module on Mallow
               - toradex,verdin-am62-wifi-yavia  # Verdin AM62 Wi-Fi / BT Module on Yavia
+              - toradex,verdin-am62-wifi-zinnia # Verdin AM62 Wi-Fi / BT Module on Zinnia
           - const: toradex,verdin-am62-wifi     # Verdin AM62 Wi-Fi / BT Module
           - const: toradex,verdin-am62          # Verdin AM62 Module
           - const: ti,am625
@@ -103,6 +105,7 @@ properties:
               - toradex,verdin-am62p-nonwifi-ivy    # Verdin AM62P Module on Ivy
               - toradex,verdin-am62p-nonwifi-mallow # Verdin AM62P Module on Mallow
               - toradex,verdin-am62p-nonwifi-yavia  # Verdin AM62P Module on Yavia
+              - toradex,verdin-am62p-nonwifi-zinnia # Verdin AM62P Module on Zinnia
           - const: toradex,verdin-am62p-nonwifi     # Verdin AM62P Module without Wi-Fi / BT
           - const: toradex,verdin-am62p             # Verdin AM62P Module
           - const: ti,am62p5
@@ -115,6 +118,7 @@ properties:
               - toradex,verdin-am62p-wifi-ivy    # Verdin AM62P Wi-Fi / BT Module on Ivy
               - toradex,verdin-am62p-wifi-mallow # Verdin AM62P Wi-Fi / BT Module on Mallow
               - toradex,verdin-am62p-wifi-yavia  # Verdin AM62P Wi-Fi / BT Module on Yavia
+              - toradex,verdin-am62p-wifi-zinnia # Verdin AM62P Wi-Fi / BT Module on Zinnia
           - const: toradex,verdin-am62p-wifi     # Verdin AM62P Wi-Fi / BT Module
           - const: toradex,verdin-am62p          # Verdin AM62P Module
           - const: ti,am62p5
-- 
2.47.3

