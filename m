Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C431930D41C
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218722; cv=none; b=kYYha6xttNPCoxiFaF0zqaCJmwH9Gc+94dZ6ZKeDD6KA2ozpwqgVb2ArDoKSHaTjeeqnD6PlvTt6ts758leuPztjzyjFgKuZQd1uSTbvMohonIAIdyJ1RGcDztt1lK39QUm5rMnaPrVUlvUMW4Rftkr7jdzWMkHshkY531Kj4SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218722; c=relaxed/simple;
	bh=ZbR5e3iSx3We61kptyp25XVhlVD2xl4rq8aQcMhjv/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IlMgm8x2J7ppMbobsrpUg8g6ksteoLkv7yBcb22XLgjc9A64RNCCF85MRzHp09Ay3wrWmrbET9tIZNaeHOW/tPD+7oj3bWHGwC2B6UhJ/nmkYeM9sQ0LA5FRH/QOcL70bP6pINZezZA5HAmfUzUR8PhQDkCxW/lMloxiJuNzXHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOz0xGv9; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOz0xGv9"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38f0f3c8da5so594121a91.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788218719; x=1788823519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vEDujxfcQqG+DZ1q+qLYb+AredW1xx3215/C6epQlL0=;
        b=XOz0xGv9tYY7HAoBMytL5cwGTAbkc1rXZJPhMehstlJyJi9LUMBK/+VQMzDtjucS6y
         LHCM8aGToieiuTMkiUJJAoaSspTeqYiL7fGCFaOWsyDHXDL+YcDYMNioMiAYC5bVYnJy
         qFu0F2oZX31QpBA7m21SCcmStMbUKlcEX90pcw/OKdETAuboYl0dmvcI5QWloq2Wbwkz
         dlyAMvCX9zTLND7rolHqbWxLhWJMZhJCJ/51KGkEht4k1vDUIlMdYACB1BcK3uOlmhgr
         ulQp69t1nDNsPOWT+7O5o7PbO9DcvVDHAzZnItFv4rOAp6F4CrTi1pWBWIcQoljHzjr7
         lO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788218719; x=1788823519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEDujxfcQqG+DZ1q+qLYb+AredW1xx3215/C6epQlL0=;
        b=RtigOBiY3qQ5lWT7mt09vK9YN9t1iXuRdmaMEcebuMEXtZ7qHl3QuYctoXsBXsJjjv
         b938bISmtj+XEk4wdajLrJdcvTdYrO3AZCYZNMXFuXCRiWlahv5RTo8jC1swTTpsrWis
         3KyDsjeufvWRSohns4/FC8gWWI0aMffxvWRE5HYqAG/WpbkEcCQbhYQglH/NGYGoagJ2
         x1YLyOKFUVR85se+ACz1BjuLZe4mot3fOEYnP8wpxNneBnzsRvAXyWDpAKdGRDWQ+7Lg
         ysVRsyWSaVdx34rbBBWJ55u7f8P020+SZLotvQYsrshJCx0XD2Gw9ZwRl0jjlNEqtJEB
         XTLg==
X-Forwarded-Encrypted: i=1; AKwUvBw6x7x8Hw+2URvRl1Io8+CvbNCPR0NZIOtQgRRcLYUvT+L1Wp3YQXi/tg1S4tE6lbIpi2llfxTTSZHm@vger.kernel.org
X-Gm-Message-State: AFuF++lTPEqXGebrR8bwN9r0bWVBicgPvdOIZa6kZv/uwhup62VDMnaU
	ORMAgOJRZuHszMKu53lDWozFTFv8m51HbauiYUafpnuDjyeGw5trMN7h
X-Gm-Gg: AYBFou3MalEcdVUJhOw+T4VGrg3DGL3+h41Xj/aqVtmbq2xsD+Y5qM5RB2Mfl72gkbU
	jeOj5HQij95YY2sRvkCUsGXiLCLIxnUuhQynDczglyCTvpqx0z0NU3IQ7WwdIE8JKIwub13PGNz
	WaYLb7hq2/M+nEDoJx3ABOF+XreHjMQkJiAYPcoX5gAViPgp+r+9LItJzxZUQNZzVGgFUvUmi89
	haJSboL1mreRTVzjpyXxiL70bV5kWG+B/AZBA/YPjDH33ctJXfua58G2SQri284m5XjsyvJ6eZn
	XsxuyCaLWTiPBinHQFd+1avyHrMOgLerieV1Vw7UCzuj9qCH7idC9BOA1eGhOYPXL1MFeNKd4a2
	kfstPaHatthcgRig42AmX0Y8W5QWOeO5lteXYxfdfCJDXNhpRtxyF3zXSuzG5qwcQ+KNM9GJGWR
	P4pMj1zIw2aAzQzYsd3b4PiGfPlt+HVTyAvcfdWPxYkqpBY7ZH4VewTlyVz53UxHlXvE1PMsw=
X-Received: by 2002:a17:90a:ec85:b0:398:bad2:c0f with SMTP id 98e67ed59e1d1-398bad20e7bmr14555598a91.5.1788218718935;
        Mon, 31 Aug 2026 16:25:18 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75fc49sm1963213a91.12.2026.08.31.16.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:25:18 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 01 Sep 2026 04:53:09 +0530
Subject: [PATCH v3 5/6] dt-bindings: usb: ti,am33xx-usb: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ti-am33-usb-v3-5-5e15c617d2e9@gmail.com>
References: <20260901-ti-am33-usb-v3-0-5e15c617d2e9@gmail.com>
In-Reply-To: <20260901-ti-am33-usb-v3-0-5e15c617d2e9@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrzej Siewior <bigeasy@linutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Ravi B <ravibabu@ti.com>, Kumar Gupta <ajay.gupta@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Bin Liu <b-liu@ti.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-omap@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788218595; l=8205;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=ZbR5e3iSx3We61kptyp25XVhlVD2xl4rq8aQcMhjv/E=;
 b=OK8WmRfKp8tQaxPx85rZ9BP5a5Jt/eX2mJYmSRouEhjxrLWCM6Ae2tuucDbzsx7P8eIv1+/fd
 cyHqE2Zq7tjAHFxeESRzH52QMomOn3qr7fLNUyZl07+p4u8iLUfG7lj
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI AM33xx USB Wrapper text binding to DT schema.
Changes during conversion:
- Drop the USB control module from child nodes, as it physically resides
  within the System Control Module address space, not the USB wrapper.
- Allow standard phy@[0-9a-f]+$ child node names alongside the legacy
  usb-phy@[0-9a-f]+$.
- Mark the legacy ti,hwmods property as deprecated.
- Document required #address-cells, #size-cells, and ranges property
  missing from text binding.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/usb/am33xx-usb.txt         | 143 ---------------------
 .../devicetree/bindings/usb/ti,am33xx-usb.yaml     | 103 +++++++++++++++
 2 files changed, 103 insertions(+), 143 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
deleted file mode 100644
index 94312ad8ec8c..000000000000
--- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
+++ /dev/null
@@ -1,143 +0,0 @@
-  AM33xx MUSB
-~~~~~~~~~~~~~~~
-- compatible: ti,am33xx-usb
-- reg: offset and length of the usbss register sets
-- ti,hwmods : must be "usb_otg_hs"
-
-The glue layer contains multiple child nodes. It is required to have
-at least a control module node, USB node and a PHY node. The second USB
-node and its PHY node are optional. The DMA node is also optional.
-
-Example:
-~~~~~~~~
-The following example contains all the nodes as used on am335x-evm:
-
-aliases {
-	usb0 = &usb0;
-	usb1 = &usb1;
-	phy0 = &usb0_phy;
-	phy1 = &usb1_phy;
-};
-
-usb: usb@47400000 {
-	compatible = "ti,am33xx-usb";
-	reg = <0x47400000 0x1000>;
-	ranges;
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ti,hwmods = "usb_otg_hs";
-
-	ctrl_mod: control@44e10000 {
-		compatible = "ti,am335x-usb-ctrl-module";
-		reg = <0x44e10620 0x10
-			0x44e10648 0x4>;
-		reg-names = "phy_ctrl", "wakeup";
-	};
-
-	usb0_phy: usb-phy@47401300 {
-		compatible = "ti,am335x-usb-phy";
-		reg = <0x47401300 0x100>;
-		reg-names = "phy";
-		ti,ctrl_mod = <&ctrl_mod>;
-		#phy-cells = <0>;
-	};
-
-	usb0: usb@47401000 {
-		compatible = "ti,musb-am33xx";
-		reg = <0x47401400 0x400
-			0x47401000 0x200>;
-		reg-names = "mc", "control";
-
-		interrupts = <18>;
-		interrupt-names = "mc";
-		dr_mode = "otg"
-		mentor,multipoint = <1>;
-		mentor,num-eps = <16>;
-		mentor,ram-bits = <12>;
-		mentor,power = <500>;
-		phys = <&usb0_phy>;
-
-		dmas = <&cppi41dma  0 0 &cppi41dma  1 0
-			&cppi41dma  2 0 &cppi41dma  3 0
-			&cppi41dma  4 0 &cppi41dma  5 0
-			&cppi41dma  6 0 &cppi41dma  7 0
-			&cppi41dma  8 0 &cppi41dma  9 0
-			&cppi41dma 10 0 &cppi41dma 11 0
-			&cppi41dma 12 0 &cppi41dma 13 0
-			&cppi41dma 14 0 &cppi41dma  0 1
-			&cppi41dma  1 1 &cppi41dma  2 1
-			&cppi41dma  3 1 &cppi41dma  4 1
-			&cppi41dma  5 1 &cppi41dma  6 1
-			&cppi41dma  7 1 &cppi41dma  8 1
-			&cppi41dma  9 1 &cppi41dma 10 1
-			&cppi41dma 11 1 &cppi41dma 12 1
-			&cppi41dma 13 1 &cppi41dma 14 1>;
-		dma-names =
-			"rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7",
-			"rx8", "rx9", "rx10", "rx11", "rx12", "rx13",
-			"rx14", "rx15",
-			"tx1", "tx2", "tx3", "tx4", "tx5", "tx6", "tx7",
-			"tx8", "tx9", "tx10", "tx11", "tx12", "tx13",
-			"tx14", "tx15";
-	};
-
-	usb1_phy: usb-phy@47401b00 {
-		compatible = "ti,am335x-usb-phy";
-		reg = <0x47401b00 0x100>;
-		reg-names = "phy";
-		ti,ctrl_mod = <&ctrl_mod>;
-		#phy-cells = <0>;
-	};
-
-	usb1: usb@47401800 {
-		compatible = "ti,musb-am33xx";
-		reg = <0x47401c00 0x400
-			0x47401800 0x200>;
-		reg-names = "mc", "control";
-		interrupts = <19>;
-		interrupt-names = "mc";
-		dr_mode = "host"
-		mentor,multipoint = <1>;
-		mentor,num-eps = <16>;
-		mentor,ram-bits = <12>;
-		mentor,power = <500>;
-		phys = <&usb1_phy>;
-
-		dmas = <&cppi41dma 15 0 &cppi41dma 16 0
-			&cppi41dma 17 0 &cppi41dma 18 0
-			&cppi41dma 19 0 &cppi41dma 20 0
-			&cppi41dma 21 0 &cppi41dma 22 0
-			&cppi41dma 23 0 &cppi41dma 24 0
-			&cppi41dma 25 0 &cppi41dma 26 0
-			&cppi41dma 27 0 &cppi41dma 28 0
-			&cppi41dma 29 0 &cppi41dma 15 1
-			&cppi41dma 16 1 &cppi41dma 17 1
-			&cppi41dma 18 1 &cppi41dma 19 1
-			&cppi41dma 20 1 &cppi41dma 21 1
-			&cppi41dma 22 1 &cppi41dma 23 1
-			&cppi41dma 24 1 &cppi41dma 25 1
-			&cppi41dma 26 1 &cppi41dma 27 1
-			&cppi41dma 28 1 &cppi41dma 29 1>;
-		dma-names =
-			"rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7",
-			"rx8", "rx9", "rx10", "rx11", "rx12", "rx13",
-			"rx14", "rx15",
-			"tx1", "tx2", "tx3", "tx4", "tx5", "tx6", "tx7",
-			"tx8", "tx9", "tx10", "tx11", "tx12", "tx13",
-			"tx14", "tx15";
-	};
-
-	cppi41dma: dma-controller@7402000 {
-		compatible = "ti,am3359-cppi41";
-		reg =  <0x47400000 0x1000
-			0x47402000 0x1000
-			0x47403000 0x1000
-			0x47404000 0x4000>;
-		reg-names = "glue", "controller", "scheduler", "queuemgr";
-		interrupts = <17>;
-		interrupt-names = "glue";
-		#dma-cells = <2>;
-		dma-channels = <30>;
-		dma-requests = <256>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/usb/ti,am33xx-usb.yaml b/Documentation/devicetree/bindings/usb/ti,am33xx-usb.yaml
new file mode 100644
index 000000000000..0b36b9ddfb4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,am33xx-usb.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ti,am33xx-usb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI AM33xx USB Wrapper
+
+description:
+  The glue layer contains multiple child nodes. It is required to have at least
+  a USB node and a PHY node. The second USB node and its PHY node are optional.
+  The DMA node is also optional.
+
+maintainers:
+  - Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+
+properties:
+  compatible:
+    const: ti,am33xx-usb
+
+  reg:
+    maxItems: 1
+
+  ranges: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ti,hwmods:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Name of the hwmod associated with the USB module.
+    const: usb_otg_hs
+    deprecated: true
+
+patternProperties:
+  "^(usb-)?phy@[0-9a-f]+$":
+    $ref: /schemas/phy/ti,am335x-usb-phy.yaml#
+
+  "^usb@[0-9a-f]+$":
+    $ref: /schemas/usb/ti,musb-am33xx.yaml#
+
+  "^dma-controller@[0-9a-f]+$":
+    $ref: /schemas/dma/ti/ti,cppi41.yaml#
+
+required:
+  - compatible
+  - reg
+  - ranges
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    usb@47400000 {
+        compatible = "ti,am33xx-usb";
+        reg = <0x47400000 0x1000>;
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ti,hwmods = "usb_otg_hs";
+
+        usb-phy@47401300 {
+            compatible = "ti,am335x-usb-phy";
+            reg = <0x47401300 0x100>;
+            reg-names = "phy";
+            ti,ctrl_mod = <&ctrl_mod>;
+            #phy-cells = <0>;
+        };
+
+        usb@47401000 {
+            compatible = "ti,musb-am33xx";
+            reg = <0x47401400 0x400>,
+                  <0x47401000 0x200>;
+            reg-names = "mc", "control";
+            interrupts = <18>;
+            interrupt-names = "mc";
+            dr_mode = "otg";
+            mentor,multipoint = <1>;
+            mentor,num-eps = <16>;
+            mentor,ram-bits = <12>;
+            mentor,power = <500>;
+            phys = <&usb0_phy>;
+        };
+
+        dma-controller@7402000 {
+            compatible = "ti,am3359-cppi41";
+            reg = <0x47400000 0x1000>,
+                  <0x47402000 0x1000>,
+                  <0x47403000 0x1000>,
+                  <0x47404000 0x4000>;
+            reg-names = "glue", "controller", "scheduler", "queuemgr";
+            interrupts = <17>;
+            interrupt-names = "glue";
+            #dma-cells = <2>;
+            dma-channels = <30>;
+            dma-requests = <256>;
+        };
+    };

-- 
2.55.0

