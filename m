Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C76B3C6A38
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 21:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237759; cv=none; b=Pv8lBdWTt3jnmRYsRnADnbQXhuDt+sM5VqUYouIJxgP9ShvFgSZsGGDzNYVVSawctm+FGBhPhNiQY7Bp8HE1CnpQqsZvDIYOe6XIsLea5oSBwHJE8UkTfzBFxz51FVZRZUJyuraBOc8xjJbq6ZkbXP2Kt6ndmTTO2joX5DTJaNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237759; c=relaxed/simple;
	bh=MWgeMQguSvX0yNa9AkilnGzLi/Gpu4RxxeyumH/X22g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bPHP0k1Px9tEZHggJDaMcEyPhD/3Ae872UR29HfE8NOHzHR2Y2JhErWK07O9Pr5yyTi4ShEkzYrPnCUbLXdyDq6jcoE2P07xQsnULxigDv/sHV8lcy5sPJuADLxRwhkPjNwelAjTCYWdxIS1mB+OT28BAuyzBL843FgIbSJ+8Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAyD52IZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAyD52IZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so57008755e9.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784237754; x=1784842554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Cbd7RpSigAze/UtmT1+z+tOpgI5gcPixymoRHCvScg=;
        b=EAyD52IZ7vwRc00V4kJ+cnovL26UBPelQ8JjcJVkaPGoko5wInT2RV+vw7m9u1FmuQ
         DNg7Rjgu6xIDpysPY++A7o4iwl5DmLHGJryyy5X81duvrHfd5Ft6LxOLcicjW6lA5RDW
         gUKCH5U5hVn+JJkqizOkmfmlS5CFxYZYyrAR4H50Ic5R/BjRz3sXlunzeJCO78xRLI5L
         Vznn/2QNYCNANEd6mRfopSdHryF9Ia7f4hfo40sFT5z32zMYTHfwbWaOvpYBx451PdOS
         kZ5KtOjbiCXxL8WkQH3kqwqdgPKp+wr08yLsSBBTZgUe/NMV9QNxa+M6V8QnuQ2DDxh/
         R1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784237754; x=1784842554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Cbd7RpSigAze/UtmT1+z+tOpgI5gcPixymoRHCvScg=;
        b=qnKZGjQtvtRViQ1PjSpr5J87JWvGEpdwXdytCvpN8XIAZrUgSAXtQOw06NqmzGoFr+
         D4Lawja8l3R23RKQ+cegxkXwkdA+MrLXx/U4Sy7weGlaRanB0+zDGCQa8+oMBVdpIo1Z
         9DHiHAZPeAjW4VUS31qdgWKMqW1rzt0F0qor9s1UKytAPD3yLea3joayumUINiINUg0F
         i6itFP2Nl+WSThHc2ox/MT+3kMjqAuYBJE+tnvw6jjTYj3Xomej9c+Y9ARX4yz9zFzIp
         afy4/Ra2AgC02PcBzo3ILH8VTbZatn8iG8PyjhYOt7U1U9uwBXy8eUkzC2T3zBKjxmKv
         R97Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp12+XSwXtPdavK0TiqafF9VjuT3LWyjPrhBL2jz4P/JVdeRCbz7LrFtuMbQCeewj3/samGf1zD0jm+@vger.kernel.org
X-Gm-Message-State: AOJu0YwAoUwGWsNdalKGkAWCKD8+C0Mf8lVLKH0EwGg2WyuKYzoFbUhk
	hAGeoEf2ANtvIvICAasY5i+No/v1EwH5yb7LtLf6XrbXGiEdq4X3umX7g4UOADI9mQRuYQ==
X-Gm-Gg: AfdE7cm+OAGCC9STAQPNPOCmyRLIP81b9QxaBuvH7KndT5KaZxi1E9t+e+b6a4mU6rl
	gLiONcvIy47biPtDsDEADqDUV8VAu/XuGtfuoeXjYt3zqqb9mt/KENHStfhhZYd/4STf2ZHP9Od
	rIeeXhwiqBp3bMa0UlKpDo2NzC8ZlnRibXCVNHcNjT3U8O7aRS+XF4BsVpELgRowE6cl9nvX2hX
	hdd+m5+J4ffEKDs1zgjgL1J4twHVPln2EkwyoOrFYqosUcOQie33NE3EBfS3ahur+4EEI43ipPc
	7XsO8WL6TZsBnlbGj7FeyHB+onxXdmDLyh4k+Dn5ZlIdHa+0afZZMFmuNUfodPo4alAC1eNuGQr
	F0TimTaGI/XdBwYEO7IuVHMd0lMVL0d86Jk3dodF377VA3Bm8TfuUoqd92shVApxEvh/MRGeFWE
	4LACyiGhujYmjT
X-Received: by 2002:a05:600c:6217:b0:492:4363:e7d6 with SMTP id 5b1f17b1804b1-49538cc1510mr144373665e9.37.1784237754220;
        Thu, 16 Jul 2026 14:35:54 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f09sm27517548f8f.26.2026.07.16.14.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:35:53 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 17 Jul 2026 00:35:37 +0300
Subject: [PATCH v7 01/13] dt-bindings: phy: Add zx297520v3 USB phy
 documentation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260717-zx29clk-v7-1-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
In-Reply-To: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5153;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=MWgeMQguSvX0yNa9AkilnGzLi/Gpu4RxxeyumH/X22g=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqWU6xcWZOmOXtOLohhzgy+hM6oOkxf17Sa7bRM
 oer1RlHKaCJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCallOsRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKD6w/+MJmxYIyepRX+FyR6Y2BS1xstCgAxbVa
 V2LfZHa60uXTnOQjweIZny/aZvtk9oG1fmQcB29kMUwDm50sZITCqWBMWRL2E+xjVH9r55CG47a
 csbwc6VvJWAohr4URm4L+nTQarehBpqczIbo+wh0HVKczceIp7areXGL/5/eYHfNCCExjcxzvyr
 84/h3Bq82p+gHYpmtOTWvezhrV5LXVS6nG0+y0wJBOs1xLcUJj5YiQjr6PnzVDswSIYVz4gP3N3
 bOwg8Nk2+pd+Uxjdw7+AbIiR8BaaFwwRcvQx1zr/3TdU2aCn5cNzoAFd64ZjJrIW3jHrlJBRfpA
 Om0s+tWSwC2XMqxF5epTfzM5P7uo2yC2QxbCG2GmDa5kek03rFQVL36ALPJX500QQthmvGttASu
 GqOG7LEUA52ljXfs8kLRU3QL1pde2ZN4QP6kyFl4yT9+8KlF22hGWc4BV0Byk82CY9nnteMzj5Y
 NehEK9+olrStownN5eU1Y/XRUOBdsr5yjaiUlnGfB2w93dUe7GNJdPDm427SQ62gAQ2p0P2Wv3t
 dUOpqRXXJTdKaL//MCZ3rw+QPL5AegBy9YyKISXQGBoUjg50L2aH7pdLNS15x1c43zbNmwDKhYh
 oOTzG68KamAIZoheKX+RVCRcs+Xm8gO3gwdge8ZC5xHGJOIc27to=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This binding will be used as a subnode of topcrm, which will be added in
the next patch.

Why is this a child node and not #phy-cells added to topcrm itself,
like clocks and resets as writing-bindings.rst suggests? Because
of_phy_provider_register checks if the of_node the PHY provider is added
to belongs to the device or is a child of the device, so I can't put the
PHY driver into an MFD (or AUX) child without its own node.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

How do I handle examples? It would be identical to the example in
topcrm. The example needs the reset defines from the next patch in
either case.
---
 .../bindings/phy/zte,zx297520v3-usb-phy.yaml       | 96 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +
 include/dt-bindings/phy/phy-zte-zx297520v3-usb.h   | 12 +++
 3 files changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml b/Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml
new file mode 100644
index 000000000000..8bad9365d5cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/zte,zx297520v3-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 USB and HSIC PHY
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  This PHY is found on zx297520v3 boards. It has no configurability on its own,
+  but it does require a correct reset and wait sequence to initialize. It can
+  provide interrupt notification when USB is connected and disconnected.
+
+  The phy is a component of the board's topcrm controller. The hardware needs to
+  be declared as a child node of the zte,zx297520v3-topcrm node.
+
+  The register space and IRQs always account for two PHYs: One USB 2.0 OTG phy
+  and a HSIC PHY. Not all boards have both. If one is missing, the corresponding
+  ready flag will never be set.
+
+  The "include/dt-bindings/phy/phy-zte-zx297520v3-usb.h" header contains the
+  definition for the PHY indices.
+
+properties:
+  compatible:
+    const: zte,zx297520v3-usb-phy
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: IRQ reporting USB connection
+      - description: IRQ reporting USB disconnection
+      - description: IRQ reporting HSIC connection
+      - description: IRQ reporting HSIC disconnection
+
+  interrupt-names:
+    items:
+      - const: usb-up
+      - const: usb-down
+      - const: hsic-up
+      - const: hsic-down
+
+  resets:
+    items:
+      - description: USB phy reset
+      - description: HSIC phy reset
+
+  reset-names:
+    items:
+      - const: usb
+      - const: hsic
+
+  "#phy-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - resets
+  - reset-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy-zte-zx297520v3-usb.h>
+
+    topcrm: clock-controller {
+        compatible = "zte,zx297520v3-topcrm", "syscon";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #reset-cells = <1>;
+
+        usb-phy@84 {
+          compatible = "zte,zx297520v3-usb-phy";
+          reg = <0x84>;
+          interrupts = <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
+            <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
+            <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
+            <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
+          interrupt-names = "usb-up", "usb-down", "hsic-up", "hsic-down";
+          resets = <&topcrm 18>,
+            <&topcrm 20>;
+          reset-names = "usb", "hsic";
+          #phy-cells = <1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8729cea57c3d..cb50c2e3b4ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3878,8 +3878,10 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	include/dt-bindings/phy/phy-zte-zx297520v3-usb.h
 
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
diff --git a/include/dt-bindings/phy/phy-zte-zx297520v3-usb.h b/include/dt-bindings/phy/phy-zte-zx297520v3-usb.h
new file mode 100644
index 000000000000..8a0a3ccbdd63
--- /dev/null
+++ b/include/dt-bindings/phy/phy-zte-zx297520v3-usb.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) Stefan Dösinger.
+ */
+
+#ifndef __DT_BINDINGS_PHY_USB_ZX297520V3_H
+#define __DT_BINDINGS_PHY_USB_ZX297520V3_H
+
+#define ZX297520V3_USB_PHY	0
+#define ZX297520V3_HSIC_PHY	1
+
+#endif /* __DT_BINDINGS_PHY_USB_ZX297520V3_H */

-- 
2.54.0

