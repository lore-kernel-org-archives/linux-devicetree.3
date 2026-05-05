Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D0C353EF3;
	Tue,  5 May 2026 17:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778000664; cv=none; b=vGLIqDL1ROo/B+sgNjwmux0XqKeAw68rbNgOfHNTP2fTO50ogESMrrokac6qAl8YE2C+qPaYKJKOzmMpIRvZWW+o8RuscJjj3nAKUL7qTc1svmNM8PDb07fuEAossx3tqeUBsATg4COekYXpXqmL8OeRgomwU+YEHTQ5CVeCwLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778000664; c=relaxed/simple;
	bh=rC1JAnMcnNlo9GWblhcot0eQjeHFuR3FudhhRiOgZKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YrndwxuAz4XIFry3j7tSErfZRWMHYBW+j1aXjfJT/9spHDoghriUKq1RuBT9H9iIyXU2KCaAymdWJYxEbDJuxZSK2J7OxYZCRS5arQK4MXMv9nIgqs6cQBgRU/AzrZWg2ZAofVZNoPqI1TEvTSi+F4rwZ5iZeF9tHlyZ1vd4JH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=1NOlqDw6; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="1NOlqDw6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=8q2IZq6215HQoBX7glbcRLyovR5wi8eLtrWHqEETf9E=; b=1NOlqDw6rTwmiPp3P/3is+4Cbi
	fnNd7WWSsTFRJAHmCrTtJT9WIfYL6ZtM4+ydiHyJ+EmOg+K5nlNcxag88C1I/XXrvnrjnmuGTaKI7
	0gWhxtecMq0gEnkb2JEEDStfIWU8njd4EdE/7DRy0IhO2ifsIak1VJvwuXXzYc4V2D4ouI9pglwmI
	/mW/KnArWeZStq/8G2jLM6ugbrwo7knHzT2lSVpG+L6tqEqKBYOGbxBuJ4G401SM/njKjh7nhO8hz
	mdCBx7veyMwrE/6jXnUiopOR2BOmvWuQ/EoXx6F7HMU7i8zUrnHDogWGGzFmwr++p8YaKlXRFwczq
	5pDrEyxw==;
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
Subject: [PATCH v2 1/5] dt-bindings: phy: rockchip,inno-usb2phy: Require GRF for RK3568/RV1108
Date: Tue,  5 May 2026 19:04:06 +0200
Message-ID: <20260505170410.3265305-2-heiko@sntech.de>
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

Typically these Rockchip USB2 PHYs are fully contained within a single
GRF. However, for RK3568 and RV1108 regs to control the USB2 PHY is
located in a different GRF compared to the base address.

Update this binding to require rockchip,usbgrf for RK3568 and RV1108 to
properly reflect that the USB GRF is required to control the USB2 PHYs
on these variants. Also disable use of rockchip,usbgrf for variants
where it is not required.

This should not introduce any breakage as the affected usb2phy nodes for
RK3568 and RV1108 were added together with a rockchip,usbgrf phandle in
their initial commit.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../bindings/phy/rockchip,inno-usb2phy.yaml        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
index 58e735b5dd05..b95c9e3e44fe 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
@@ -145,6 +145,20 @@ anyOf:
       - host-port
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3568-usb2phy
+              - rockchip,rv1108-usb2phy
+    then:
+      required:
+        - rockchip,usbgrf
+    else:
+      properties:
+        rockchip,usbgrf: false
+
   - if:
       properties:
         compatible:
-- 
2.47.3

