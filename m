Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD96737756E;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630122; cv=none; b=pTth1u37Xm7zR+U+mTsMsJyQOgHzx4hYpIRBW69Z5No8CA5M0CYJ0O6Ht8LLhef3MH5hf48k0PycSP0F3/PISOfvNffTLMGwPD3xIHlP7R44/gmg7CK3K+A+3CbjVVROBPWU45VcY1hIZ9l4OEx66Ok0PtUR2ltG8GWVQfgyyOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630122; c=relaxed/simple;
	bh=JV00sjmhquXboKON+JjhU41ZdESA0A3y8urFRlEdNU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfjlLZzuU2vJIdneLiXK2/vz/+Erih7O+3Y+EcnJZbYjXvv0p6RS29NUSHxw98P7PUO0KfXelN2iqETJ+EGZCEeU8fLA+ufkoD32CBGvSnjx45SkRCaFyyAiDbGcj03ZWN5+BHf5Lr8rFMUcJUrbwt2iQVzHG7jUkq81MPSG9cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NiO41nuW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NiO41nuW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 748BAC2BCB8;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784630122;
	bh=JV00sjmhquXboKON+JjhU41ZdESA0A3y8urFRlEdNU8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NiO41nuWWBZngmxJJIEebm1oddpO3QqlHSYM1sBxdafID57RgEdL4vx8h1Ffspx4W
	 ZZoWLk0b7AjMEn/YQuW07XtbfnF2yES6DzD0Or/Ors3QLMNnbBy0ZUaRu7XaTiTJsv
	 eeV4hehdbB0BdgVGcS+Vud8YyKoL0KYa4Eh4jZhR07SgfC1cKKGTBsRMKkd2460mJr
	 rdYv0nExbAhhG9XLt70W71JkLH+2f/gUIRWcQUVxFknE1V4QkdNbGqahuRWKUeRjFe
	 T78uAU6bMiyX9GX6QBJjLhD0Zs7RhpVuwu2+pF9vo7ceaQCWoEJk1gl4q9/8WQ2zy4
	 RnHRKX6S1g8gw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 638CEC4451C;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Tue, 21 Jul 2026 18:35:19 +0800
Subject: [PATCH 1/4] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: support
 per-direction phys
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dcphy-rx-v1-v1-1-4fc83c0ccac9@gmail.com>
References: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
In-Reply-To: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784630121; l=3235;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=qKIkMZo6/4E4nSFrHbQ73C4ZiCIq+4PFw3ZZsww73IM=;
 b=geNFFEuGY+1qt+RJXr7yo9Fj8vo+15a4R78etc9erRBw+z48QFkH6TiN426oNaMWSYTA7yfvZ
 Xkdya/bcYdoA0mT85vIjQ0ZF7sAkM2soLtzXNt1CYE+0YSmOEbRjbGo
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-Endpoint-Received: by B4 Relay for jason98166@gmail.com/20260721 with
 auth_id=887
X-Original-From: Jason Yang <jason98166@gmail.com>
Reply-To: jason98166@gmail.com

From: Jason Yang <jason98166@gmail.com>

The Samsung MIPI D-/C-PHY block on RK3588 drives a MIPI DSI transmitter
and, on the same PHY, can receive a MIPI CSI camera. Describing both as
independent consumers of one PHY requires the direction to be expressed
in the devicetree.

Allow "#phy-cells" to be 1 or 2. The existing single-cell form still
selects the PHY type and refers to the transmitter, so shipped DSI
device trees stay valid. A second cell adds the direction, letting a
DSI (TX) and a CSI (RX) reference the same PHY node as separate
consumers.

Add include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h for the
RK_DCPHY_DIR_TX and RK_DCPHY_DIR_RX direction constants.

Signed-off-by: Jason Yang <jason98166@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml   | 22 ++++++++++++++++------
 .../dt-bindings/phy/phy-rockchip-samsung-dcphy.h   | 13 +++++++++++++
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
index c8ff5ba22a86..53d695137566 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
@@ -20,12 +20,22 @@ properties:
     maxItems: 1
 
   "#phy-cells":
-    const: 1
+    enum: [1, 2]
     description: |
-      Argument is mode to operate in. Supported modes are:
-        - PHY_TYPE_DPHY
-        - PHY_TYPE_CPHY
-      See include/dt-bindings/phy/phy.h for constants.
+      A single cell selects the PHY type and always refers to the
+      transmitter (DSI) direction. It is kept for backwards compatibility
+      with existing device trees:
+        - <PHY_TYPE_DPHY>
+        - <PHY_TYPE_CPHY>
+
+      Two cells select the PHY type and the direction, so that the
+      transmitter (DSI) and the receiver (CSI) can be described as
+      independent consumers of the same PHY:
+        - <PHY_TYPE_DPHY RK_DCPHY_DIR_TX>
+        - <PHY_TYPE_DPHY RK_DCPHY_DIR_RX>
+
+      See include/dt-bindings/phy/phy.h and
+      include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h for constants.
 
   clocks:
     maxItems: 2
@@ -82,6 +92,6 @@ examples:
                  <&cru SRST_S_MIPI_DCPHY0>;
         reset-names = "m_phy", "apb", "grf", "s_phy";
         rockchip,grf = <&mipidcphy0_grf>;
-        #phy-cells = <1>;
+        #phy-cells = <2>;
       };
     };
diff --git a/include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h b/include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h
new file mode 100644
index 000000000000..60f6630f58b3
--- /dev/null
+++ b/include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 Jason Yang <jason98166@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_PHY_ROCKCHIP_SAMSUNG_DCPHY_H
+#define _DT_BINDINGS_PHY_ROCKCHIP_SAMSUNG_DCPHY_H
+
+/* Direction of a Rockchip Samsung MIPI D-/C-PHY combo block */
+#define RK_DCPHY_DIR_TX		0
+#define RK_DCPHY_DIR_RX		1
+
+#endif /* _DT_BINDINGS_PHY_ROCKCHIP_SAMSUNG_DCPHY_H */

-- 
2.43.0


