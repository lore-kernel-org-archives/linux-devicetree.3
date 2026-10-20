Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.81.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792466236;
	b=kIOv0uBHJSOp1XP61Xk47Cd2MfNEqpGAoGOQu3XhcLQuLfOg3MlZigrCQICXSBczyjbQ
	 rM7kJwQ9zKJHslhVzqttEzI+qOu9gbUb14inhzEhsG2mnQIWBHZ+NznHsWb1uDmm04zs8
	 0kiuxvr6Tz2vM7403VZd8Y52GhzTzD/3R0je+oXkeUnq9VjSDKBp5m4U2PnBdwjBpt9W9
	 s31rItVE7jxUln3jRA9xH5KuyKYZoW3kw/BQOZ72WQOdksMUQQ+i+yUjLAGTWUw/AFg9h
	 VtEczjpwZQDc/yYYwzLlQyu6L5xq3lU1A5t6LfvYNS5RpXsEuU0vn7qtZ+tOul82pPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792466236;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:X-HM-Tid:X-HM-MType:X-HM-Spam-Status:
	 DKIM-Signature;
	bh=rnLHPhFG/gXRDlU2dAZnibIxBciJw1AG1LGW/j1wmKY=;
	b=b2AqDGLIXAtSA/qmpuftz5zquz4J8AGv1IglUZn86VjRVdtWDL9bjCl3D58fn4E45GY6
	 h9xg5SSghjhjaZfOIZlRwtTpj8BYvW9TvnqqqgjYBV4BQ+py3gNKYEDx47CLz0vBtf8UX
	 tP6/g6DAkWfU19kggy8/LKOb4QXoVCYmERURxKCKUbGfLASrj0nr+3/kTGq942wE+qXLe
	 h/aTYZwdCD9kCZCVDwa7KcTb0igapB6HeIWq4WRGZfdpHr8spvMCtbjN0/HBSInDERtHm
	 Ca2giHpKKz/hU4YDz3cWQq4h/sy0RgVI0ZtHW/NR+gSQHO4ocT2w1ymw7Ss32WWOyHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=dhcUOd5t;
	arc=none smtp.remote-ip=156.224.81.183
Received: from mail-m81183.xmail.ntesmail.com (mail-m81183.xmail.ntesmail.com [156.224.81.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAF3606A31A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 03:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCAF3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=dhcUOd5t
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 51a517e04;
	Tue, 20 Oct 2026 11:17:02 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Vinod Koul <vkoul@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	devicetree@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>,
	Coia Prant <coiaprant@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 1/2] dt-bindings: phy: rockchip,pcie3-phy: Document firmware-name
Date: Tue, 20 Oct 2026 11:16:45 +0800
Message-Id: <1792466206-127946-2-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1792466206-127946-1-git-send-email-shawn.lin@rock-chips.com>
References: <1792466206-127946-1-git-send-email-shawn.lin@rock-chips.com>
X-HM-Tid: 0aa1574fff2203a4kunm7337cf0a90149d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQ05ITVYaSx8ZQhodS0
	0ZHh9WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=dhcUOd5t40dMKZ29YLHBvyBTJMaBuBFII57x8Cufud7wbY12fgE4qcsoDKpVEwjxpEckNqtr4/8rOWxlyN6aehhHTwG2kN4pxJD+yKgaidjSfcW+1QMsYfjOT3g2/qttKWZdrCtlICKV1mAX11hq0TUhE+ZCznfM9c6XwX1M6MY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=rnLHPhFG/gXRDlU2dAZnibIxBciJw1AG1LGW/j1wmKY=;
	h=date:mime-version:subject:message-id:from;
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

RK3568 can load an updated PHY firmware into its internal SRAM. The
firmware file is named by the optional firmware-name property; when it
is not described the microcode already present in the PHY is used.

Document the property and add it to the RK3568 example.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
index d7de8b5..2356812 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
@@ -67,6 +67,11 @@ properties:
       minimum: 0
       maximum: 1
 
+  firmware-name:
+    description:
+      Name of the PHY firmware loaded into the internal SRAM on RK3568.
+      If omitted, the firmware already present in the PHY is used.
+
 required:
   - compatible
   - reg
@@ -113,4 +118,5 @@ examples:
       resets = <&cru SRST_PCIE30PHY>;
       reset-names = "phy";
       rockchip,phy-grf = <&pcie30_phy_grf>;
+      firmware-name = "rockchip/pcie3-t22-c8g2-1.6.3-202a-p7.fw";
     };
-- 
2.7.4

