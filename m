Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FF94D9F83
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 18:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360699; cv=none; b=hxZNi0rM3zxhRqbs8nO9oRw9hafq/ntrQXfIZbRmeh7C38gBD56syztI8Dr4o9nJrc0Z+EARpe2dUlw1wqCQmwq+QyJyrfBilB3eYJHko/U/rgHYh6Vk6TVedRVC3ChRt3Dp1TXbcsABDds/+b4lNNiZtcxlHy/lL/y9egPrZOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360699; c=relaxed/simple;
	bh=/IYRt7m1hBhlgCk4AnhppCirk0sLdTYFTGd86B/RQ+g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dVviZHzzmgcfYXy1HGUG/jttUwIiUjWseXWJqB3cBeWuujLRLDl6ElnZIn+1e57KhewBX7FreNNIwVmj4DV45iLmYRYUL68EjihzLdTRU7lloFnohC663gSF3uRKbmysiZ734ARyRMkBqizqvC/e81tiSFAUMKcyEUyH4HyoinI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSF/dNWl; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSF/dNWl"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so6546805e9.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 11:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790360696; x=1790965496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=HSF/dNWl0DstfrmZlN1oheHpcEMvf4H2w7Zf4zuHGLv+LgybtVfIhq8Ul+NsSp0D/l
         VY96h9dgIAtX2GE/inGyAXeipElfVyuMDD9KuwPqdHjWpPVZ0TlimA9X9XiQEJhc8YAD
         M5Q9aOdrVS5EntO3xA+tbJ75bzcZUvURxdWIiEDxklY4m2r6xRlrq5wjGrywzvOIcDkB
         jUxEWuu5hJJXqPGwMx9tjBDwlqjbRjPHAeVYkmmnR1eIpjZFuCLfTkwdGwQDsBD4C+2G
         ehw/CieA560F651TXDrjFl1Is2s7r4oSjQ9YOV69RkRBZRT6KA3e/6ORO01gXVdbt85/
         oDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360696; x=1790965496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=OfJr2NaySzGcAxzgc+a7y4R8tKkBjdhxdZi4M6frxAHtCLtw+ZBpK6HLm2huOo00i8
         hfHETKghUTePMqRvbk+2o6aur89zArt8P6n06+vIzQ1RncLFm6ndY/inEaUkTK7tAK6t
         0cypYQFBWUWBSEaelyy5pOc+/vvPeieyf5O6DQUY+2qG1ROjkPrCiwWT2kua/kZKZqNM
         CVXnKit1HOiV8dANaHh6GJZHJ310HYDTu22l9cZ0Zg/DBUe6t+LW95wXlODRBOAgrXMc
         B8M3YB7DOTsHoOkOifkRkVUqtYkKHPm/XyoWqtSdRyQfbVbyse7TPG4omsoQh58iXa3W
         INbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGweK/6o+5CMpRX8aRk9gbChQmzb1tqsps/bA4DCEnB1BGesArezS0KCyiesSYJccDMuTaHAa47gI0@vger.kernel.org
X-Gm-Message-State: AFuF++kkkgUwnLxhaeXACcQKcrTV/GztqE3S0D1h5sPhJ+0tmD7HUiif
	JhI6/YY/LouGghIvDn3fvgJQoUvowrjiCxpISSTShcFPg6pgKGj/hG3f
X-Gm-Gg: AYBFou1RydYQT0Em52QyFEvbLgb1bZVoa/yJa/eS9NivXt/vmaAgCT4hm88WpZkFnKs
	xyQlpaweYTRXtgK/60ynHtQP60wqPgPCtR+XN8TRbspCgYqe32WpPPufbDq28pddQ4a1i7teWuL
	rAoaz4zCiDFt0tQDyAb61211WIhoJn3NII6YjS2vkjYgF9Sk1RH7X90faytohfEMF8Xsj2jV7it
	rM8cwr62iJc2Es5GEIOq2Sb7W4zASMirpKTnJ/SKDKbL6zYbv1hvWrK/DmFOVk36eJjxZKsZbls
	uZ/DoikkF9M1fD3My2DUz5jJHz1ZV8pp1mBkmhLT8oI0FO+5V/MG4M9H39jWab+fG+UkV+I/cm1
	fMXvi+Tfdd3VT9aMoHffqAvpcLBuI16csO0KOSGan17hvvwLfxDFeQ7URFEKt2I4ovEzxMfiTeS
	nQfm+nEDUcaLGo56twYYEJP4QFN/wa9Q7TqgrtP3YXt1GzyIzDmFAVfRN5GG4eMvZUuxuYnw5cd
	tJ2COWsVWUhEO5Bsr8tZZJianuAOFjicX5EABZ90wR+LZ4TfbqzWDDpjSowoJKG
X-Received: by 2002:a05:600c:6994:b0:49f:dc71:e609 with SMTP id 5b1f17b1804b1-49fe66e6468mr115600995e9.20.1790360695684;
        Fri, 25 Sep 2026 11:24:55 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm266231245e9.12.2026.09.25.11.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:24:53 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v23 2/9] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Fri, 25 Sep 2026 20:24:24 +0200
Message-ID: <20260925182435.21207-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925182435.21207-1-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for AN8855 Switch Internal PHY.

Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
PHYs on the MDIO bus.

Each PHY might need to be calibrated to correctly work with the
use of the eFUSE provided by the Switch SoC. This can be enabled by
defining in the PHY node the NVMEM cell properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/airoha,an8855-phy.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
new file mode 100644
index 000000000000..d2f86116badf
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch Internal PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
+  PHYs on the MDIO bus.
+
+  Each PHY might need to be calibrated to correctly work with the
+  use of the eFUSE provided by the Switch SoC.
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ethernet-phy-idc0ff.0410
+  required:
+    - compatible
+
+properties:
+  reg:
+    maxItems: 1
+
+  nvmem-cells:
+    items:
+      - description: phandle to SoC eFUSE tx_a
+      - description: phandle to SoC eFUSE tx_b
+      - description: phandle to SoC eFUSE tx_c
+      - description: phandle to SoC eFUSE tx_d
+
+  nvmem-cell-names:
+    items:
+      - const: tx_a
+      - const: tx_b
+      - const: tx_c
+      - const: tx_d
+
+required:
+  - compatible
+  - reg
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@1 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <1>;
+        };
+
+        ethernet-phy@2 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <2>;
+
+            nvmem-cells = <&shift_sel_port0_tx_a>,
+                          <&shift_sel_port0_tx_b>,
+                          <&shift_sel_port0_tx_c>,
+                          <&shift_sel_port0_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+    };
-- 
2.55.0

