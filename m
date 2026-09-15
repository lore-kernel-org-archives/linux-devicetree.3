Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF79B3CB8E5
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475913; cv=none; b=W26T3jpikPfFv4Pcd8ESpNwuA3w1DCBvJKpgycW9Q64iwCRDjyE5KsvAEDMwOBiQX+xiNr/GnQxGkGJ7ilkHEgDuaEtMs7iDe3fubQ7N5FuspGkmniV8GzxIteKW0vcDMzE9zyqDb76gB6wPCd3w9Cl9cSF5hY+RWrkUzA0GsDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475913; c=relaxed/simple;
	bh=5Bv9DWXKoe1rCy2VuILgNvXFcH8nqtMIfGBD86DCJpE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O8lKVBjGribrvJRukJEr5ARs/lAeLOdefOmCH7JLiXSZjma4q8BHfTg1Wej0tdFoMnsqpPFtUVDy1hr2GvmQX0b6goWIjE22uauJrOhsQJ48W9geHkfdPc2PJueD1MRxEyxcZ9PRPwgsevtvLkiO9YIa1Eh8FVNLaSDQF7micIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5eEceuL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5eEceuL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso25582765e9.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475908; x=1790080708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=N5eEceuLdEIiqXJu0C65Wq8SUgMHAAF5uRMuagiwZG0nkjbKAS01GmgtSeWXjJZSyv
         dycHNifG6Wy5qv4o9tNaVVRm2g4q9kTgo/Msujeqwx6rQxrA9kOjQz0aFE3LhPvUeIit
         RzxuMknl4w1rPb9XgTY5xRVk/MU2fv3nwa/W05oZW7yiGJGESdj5uEvKZagbTrkJiKeY
         To3qypmPYRw7V4ZpKRbuaNWkB472Rx4OUuvThiJUlAPADgEC57dV0gB3SSyTJkN01lea
         2kwP/s+eO3UxT/Y+kgOfmroEwlGvDNFjIFLRCA10MUZ4OO7YrlFI3+on+N/LUh4e3Se6
         WvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475908; x=1790080708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=SlO6OP1vPiQc3vmkzVFm5tqaFbGdSmmS7ccCkaFsyGaUOSRqSFx1iI626pgYWHzpYY
         yQ7Nbjik0YpvfhIQE6nH2EuzbA2OLk0EzdkCMzfQRvKISPBmutcwVHAx/tso05SlHZLM
         PFynmGi4kDOdisBMfK/xrBq3KRKRJHT4Rj6E49LuTQgpwyPdRUaEBR4rnCjAhRiUFTcF
         8aO2IDXiZMMkQxe/EN1f823ISgLXF98ssXe8rSGsHZdtCScqqfQYVNFPFI/ebuySpSnV
         F03UYQSJG8nawRD8xjn4sR+cMrGH1eFhNc2xBImw5l5fppG+G+EzW5bsJMvlG9CZhwdf
         cNmg==
X-Forwarded-Encrypted: i=1; AKwUvBxk3d8E/+V8OKsbhykpKgyM4XBltDymUIl+DrVEML4o6mxzrKOwDpwywhVyypHwYF5YHtuHTmOnfYKZ@vger.kernel.org
X-Gm-Message-State: AFuF++kX0zMd2Ub4ymujzD5a65L/nqKU55ayM+nuH9NYeBy4FLSUtKMI
	Ds25HjA7tsbLucP+gjzddTPNvc+4BhNOWy1IuZJgSCjwLtvYzQtJYzg9
X-Gm-Gg: AYBFou0rhdZu7eG/oYuO9Io7T353CZc3iY+23aem1kON0gFPnTDBo9uqgm2pHhTPpjv
	oaPnNJ+886wUHeT6H07k8cxa8TJCCcnnoiQ3P3IqKPJar7kguEi97O5n5vFMA4oyQQ6C/hTdmZg
	IX9Sl1V+4/5W1/x8pNA7Ugz/S7Fm6xdX2tbrIVYRh6GsNvLuQyDKR41SDwTh8kR1SuJB/+9e52q
	YbqHIAsbegSGH5jXK0zQp0PBWCafA/quIwgNRBenzAvLih5DY/HH0oYgkotEawkJ5WolW7nZPmc
	UyQH6XE1LJFxI8gg5ZeMkgH3X7rlCVWPSR2kqMO0lo4aaIIrEAErDF23EhNeOmJY4NreqtCKgz+
	39+UEYvqDebgdvcXNG8/YawFGa/bh48zro/6zq4B5B97uPc8IKF7GtHSr0AMwOiAubEpd13u0SX
	7wr8sTgyFVNjsUcOEPOdQ1ZMkyubr0z4okRp4rb8NieLXwsg3xwjvgyJ0oID4+TjFUcZFDdeZgy
	9zk2QL6+s9YKou+r0pA+/5Fdzi1M8Y5ZD3BspOkA+7u6UbJEffze4IRbHvvUDM2mi9cwN4YJig=
X-Received: by 2002:a05:600c:4e47:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49e7a677cdbmr68143945e9.25.1789475907626;
        Tue, 15 Sep 2026 05:38:27 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a8d5asm62958635e9.9.2026.09.15.05.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:27 -0700 (PDT)
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
Subject: [PATCH net-next v22 2/9] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Tue, 15 Sep 2026 14:37:59 +0200
Message-ID: <20260915123812.14747-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915123812.14747-1-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
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
2.53.0

