Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA10933688D
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253751; cv=none; b=SjKqooiPU8hPCnuhEfdHAOcJMcu4JG09SPojrqyypb1ClYtJXH84hQb5wXFoRb7spg/zgLtHc4B08AkDqcKgp88RGjMq6KxwwaRctjDCZvfTF5yMR3IppLhj5/ntD3aTIp0tMlH+FUkZxG5cn6PuOY9xTmmotgQNJ7CrjeiKJZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253751; c=relaxed/simple;
	bh=5Bv9DWXKoe1rCy2VuILgNvXFcH8nqtMIfGBD86DCJpE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W8wdqwJk9DMGnNVCyYrEnA2rwCnseTeeGXNk9mpyaVc2iB/HA2ez+h0DTIhR0LYBNMxwPppcj/YhtNUMeeIkrSXQ98X8vsVE0OUQMINQcD24uNvirozYZdHpjiJd9kaDwOa1JqArVJvfddlXUYjIjRQqDOlKPYAMyXb3yWMpEP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYQ9yTL8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYQ9yTL8"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-495635a85d2so15215e9.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253748; x=1785858548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=HYQ9yTL8SIHRB13ankJKULr1U0ouZkza6Hih/6eJ66lZhr9lNGn9AiJxfeUkW6tYDr
         0pBuPsij4VISZH2sbDxr6KZbcckZ9OW1Zh8WE8A1ZWPXeW9U1y07P2M3oJnZ0aYjyPR8
         CVgmqW0fIok0Zam2fQIFOZ8IiS6lS1KbGn4U913hlUsZTZOu8GcRnSK7+HXOujZqnaKE
         bWRjMtLW56T1Lx16jXd8Ay19NHWujL75tdRkdkH+tPOn6fC/ySnICKA++58UdBsANhfJ
         Ftif6SEgXgM+bi3QyAq5ckwDbPRuTgW1GG8lSQH3ibhd+OQOD+b/y8R+tB9bOv6usC1e
         LprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253748; x=1785858548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=r5oqDMPFIfso7dss0or4T6i0qFUPDJddfVF6VLH8qy71z+maH5JGPEZ77iZmWGL/oV
         rHClk1i3bZ5+JiRlxc09OF6cxJW/Fxx9DF+/MauhCVWV5gujAd7XWBoSx8Xl6H5uw2zA
         dPpYYrct2hgBPTu9va4qgjNhGNotDdEHQV1dLMmISO9ePoLq9/PCxutOiD/LQKXtXlT/
         3RKHpr7MQ7QJ4ILo/wth4u7eL21YZxVrqlT6uWcLr2NKQMb7FiMZ96YtxRmg2aCPNiOm
         FTc3kxY7ICEoBiDJUL2kFEbxP0CG6UvgtDUPnn9s404YEGlTGeFhgXiK8o77x04QluyV
         XVhQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8zZy5ajIqEM+aZmHlpiK83peRe1I3XxkhH1VLv43NpNOGWP6j2BADXhlJxryh3QvVWQsy+xTv4pA1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6/cQXw6AGohbEWnlK+AVwPN+kqsOLI4H16ligkbnmpH1B3H6Z
	nyevt0J6lqEves6gjmgQG9+4CFFe9W0PwS6EGhY8Lu50W85dlkA/QFOq
X-Gm-Gg: AR+sD11h2Adh57Ti8HF89vyGiHOtzdoqSxig0gzQPg/yDGZXXjjyRcsf+6R/WV3yOpU
	hzIj6y85S9Agg79GZAesIjYl4o43Fm46g6B0KknswpisYrkUBhip51aphSF72cPMUwr0wSRsLdu
	qIfiATCFhhNqcTVU2jNjNuemSY8v+IBBP1UCoVIz6+cN8KDtW2Pvn1MfFgIvcHqv+eqGyYYl1Gb
	ZwBKhkB6wkb1Y5L3UmG5LCL8gYBkYlSoNqp4GqlEB+yyJTemwFlaOb894u+TxawM/kP7Aq6vh+v
	HceaO29qBzafKz4Ee4iN76zRohI/OM3tQa/sPPmoIRUYpsJX17nzQKjajDBT9z/HbBsH9zfkoHV
	bzNnpSYkWIveJJ2pPVOjhqQL/4dml62/ACzBGW95rPsm1/IuFTxdkVapCbsixbY4+Pv+AmWbBfL
	mTzAVyOfzNN6dnoAfV0g==
X-Received: by 2002:a05:600c:3e18:b0:495:71fc:3a64 with SMTP id 5b1f17b1804b1-496c6569058mr33783105e9.25.1785253747906;
        Tue, 28 Jul 2026 08:49:07 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain ([37.161.95.51])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm94912035e9.15.2026.07.28.08.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:49:07 -0700 (PDT)
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
Subject: [PATCH net-next v19 02/10] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Tue, 28 Jul 2026 17:48:29 +0200
Message-ID: <20260728154846.1828945-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728154846.1828945-1-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
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

