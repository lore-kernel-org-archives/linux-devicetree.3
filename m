Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06AA3AD529;
	Tue,  5 May 2026 17:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778000664; cv=none; b=BmD55s6MuRl6MxfnIQSOUcFFxj0bqeE9e3hil+y/rQvuW9o96ciD/ZhgEzzGBmWu0/Y49PKJanwNFk5rI2nZxCN/sYqp6bGiFtWFvsDx0mlY6nV6WtdOpDfOROyiFu+TlQHH2PIksP7zZf1XmMKfKeYaDWOEaNtMa2b5P3scQgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778000664; c=relaxed/simple;
	bh=8ZoLOe12ID/7uovI00v6wKYmtdjPngoMenv4XujlqAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EEgJqoksuAoS20Yz89FTsWfhNUO0LSJFpClMO2kTVszubetxjPRVo5RYYjQatr8qTEI4/liVtiPyXo+MxR2AFaplo/OB84ZLCnkYR8fUMMKgEACgx3CFGPp/0NFSep+xQ9LQjZuGG371CRnE3omViZkZ1GyU43N3tlt7cmgJQgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=LLQKluJe; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="LLQKluJe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=a7ZZa2fA4GJyEXrtVvhdL02eBrNP1m57y2wG+TdNGvk=; b=LLQKluJeH1HhlGVbCfL3AwRHIL
	sGFth6sZmW2GTqGnBYAF6i2nMdbP7RRxIvmt5IFOXxB112Me+NrmXsauMNVtPzaz/tpAZFMG3tDMu
	FwOkbkx7DcaiuWJpkzOF9VSClFLex+iE3d2sLB0EY5b8idLV3P4z57nwer+oT5MpPT8tNFCt/3zqA
	bR8CA6eCG89onkgWH84Rx/zULqhTBVccH8kRucH7UP/wO+w3X0o/zE5kzJ2MOa0wAbd0TNsrZIU6N
	Dvl8wS/e4kDXmYgQY9AV6KH9MG68uKfw23rhWkYnr3Hcn6EPc+9CqeQ5Lc3BGvGo3lgVDMp8On3uW
	9vOS9W6g==;
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jonas@kwiboo.se
Subject: [PATCH v2 3/5] dt-bindings: phy: rockchip,inno-usb2phy: Add compatible for RK3528
Date: Tue,  5 May 2026 19:04:08 +0200
Message-ID: <20260505170410.3265305-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505170410.3265305-1-heiko@sntech.de>
References: <20260505170410.3265305-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonas Karlman <jonas@kwiboo.se>

The embedded USB2 PHY on RK3528 is very similar to the one in RK3568,
the main difference being that it only uses two clocks instead of three.

Add compatible to support the USB2 PHY in RK3528.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../bindings/phy/rockchip,inno-usb2phy.yaml   | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
index b95c9e3e44fe..f50fc69fbbe4 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
@@ -20,6 +20,7 @@ properties:
       - rockchip,rk3328-usb2phy
       - rockchip,rk3366-usb2phy
       - rockchip,rk3399-usb2phy
+      - rockchip,rk3528-usb2phy
       - rockchip,rk3562-usb2phy
       - rockchip,rk3568-usb2phy
       - rockchip,rk3576-usb2phy
@@ -41,11 +42,15 @@ properties:
     maxItems: 3
 
   clock-names:
-    minItems: 1
-    items:
+    oneOf:
       - const: phyclk
-      - const: aclk
-      - const: aclk_slv
+      - items:
+          - const: phyclk
+          - const: pclk
+      - items:
+          - const: phyclk
+          - const: aclk
+          - const: aclk_slv
 
   assigned-clocks:
     description:
@@ -65,6 +70,9 @@ properties:
     description: Muxed interrupt for both ports
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   resets:
     maxItems: 2
 
@@ -150,6 +158,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3528-usb2phy
               - rockchip,rk3568-usb2phy
               - rockchip,rv1108-usb2phy
     then:
@@ -218,6 +227,19 @@ allOf:
         clock-names:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3528-usb2phy
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
   - if:
       properties:
         compatible:
-- 
2.47.3

