Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9ED4E0B93
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562280; cv=none; b=lg6maLufXMkMEoow+F5FV24fyMVr99si7REyATTGkRekgZM8ohUe68gkmhwHQgt6VO5OEBmhpsesQs1OLp8/SA5auiQLNiL6Z9Bufo3tlJeAhBfEiVL12iEJVPQnw8RAr37txntkZOWgqnOeTz6XWlp8aIncII+72uT4BvjrXZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562280; c=relaxed/simple;
	bh=/IYRt7m1hBhlgCk4AnhppCirk0sLdTYFTGd86B/RQ+g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHLn+DMaWpIzDN1dllSLZavN4LWPdV1/ge0CXb8nqeA0AoRFl1R5EeC5sSAsvMW9Bl8uPe/ZL+l0udIzzuLrC00mxuQcywVvppxQD3Z9dYamPVkPM8zENbZLKgbJmmdKO52+wjYes17FHU2bLpK/4Tv6B5l1pKg+kfGqJhFPUrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVFMsxLY; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVFMsxLY"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so5686475f8f.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 09:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562275; x=1792167075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=LVFMsxLYM0PzWSpOwy6JNiv0PMz05vk7m++G+/r3XMJKABJkzrNG4uEvk9ad9ajwK4
         FLTkpARMIkCXw7e4i1rvqWYo3GQKfjLMGPEB1mo6qeyvQ+LTJGRfOxcdCLNG1eW06cnO
         TjLlDx4NDAmbjqqHAfaz+zG8u0SM0ZQVdPVWoGfs6mvJH53ueVdhwVQeVbHLCWiAIa87
         DpGqEJ8JBc96S2my+s6DE6paz/Q/PEUrxYm6RPxnTElzVMjkQRYXbQlfjqZfHrUFY2o0
         zYxvQTt8KnxGFSkxi6wMmdcsB2DdFKCXKbB+f2A1lY8xd2E6I4oU829G3BD8wNbaj2Yg
         WnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562275; x=1792167075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=Nw9D6krHOYlHuP4nDqNqT2Bg+CIuL25At4SpP5BWKaFWu3po++Po9hyhamrs3JUUXs
         /ibakRutasYvLT55AF5YKW/blhWKWlj2PXQ/V2YFfEobBN9oifuYfNksuX17+0R7C5Qw
         1FPiAFK/GCcUGw7P4Pk1SIaJZcmTmj8e2L1T/medMvYVDoJlo2kICcAp5l4N7IItmAPn
         7Ia/biDtWg7rzc+TVwB7wKU1IiCDL+meOwl9Mrx9p6un+pgYpXZqwsB3P8MXje6ise8A
         8yLHNTU+0Bxb3r6n4dyFSB4xS3Axfb7rMqw9+lPqpuFNEg58ql3yIfyUXrEgB4MWeTJk
         BW9g==
X-Forwarded-Encrypted: i=1; AKwUvBzeMcuFEt93p5/SgggaWK0piEQjwhC0dWWokvhtimtXVuNa7lekcnQ395qp2lMMgVW9QSYj+mWb/jme@vger.kernel.org
X-Gm-Message-State: AFuF++kwqbmT+NXu828um17rZ2KqRoNkptTK/ZgRuiCurgvrBfEoi3uS
	iBlX3D8/KYWRXNXFCFfGaIV5XvfKuW0GKBMiZ+SnDdLXBJAYSnB0e6Tm
X-Gm-Gg: AYBFou3wN8Z+toEvDr4vab+QH6es1tXMvqVh4kbKD9U4wuxezDzrVNINTWmUlbQA5oS
	h6BnIcIxH4fS90jOnWKww3lGZEJKknobOOrdrTjVjlZS/RXKk+PfkWrP77EPoTDbyWn4mPxslE3
	cBxw7JQXgP5S9ZRIcQHgFBS6+wcw+KIw65gy5moQMc9rJF1pLQ0YaIKzoxcBBCiQQpHk3NMfpzx
	++rvyU1hk7RmoCI1zEghhyrZpDinnNJy3m9igfgc+Jthw7t4WF1KU52LldecVFO2i7xVEYqylnk
	SxMRP4AWfXmbfhMAr1h0/7AMJXROPxN8fO6rkDToWCHwmoei4RAYDWrfIabolm9VBwpLXtMykmA
	vzKADlYXCfTQNeeJ7pmMEeYCC4zOh+9NCHZcdDa2kJ18gyN1dwjad3BvtTm0uOOh+iAP8R5oG7Z
	VnRDN32iUKZ9SM77E4McZ8cw8pDNr+hMx6GQyu4imvlnhU5w+GPWaic7f8QDtw5mnc1HlgdBHco
	0e3DygA+ZbKkXNo5wl91WFtiuAls+BpMXOIVJbjM2SyYrtIbm2TItUWb/EQ35IUnBxXc2cXjjz3
	S9OmXriA3esYMC8aKw==
X-Received: by 2002:a05:600c:37cc:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a18e44396cmr51955465e9.2.1791562274820;
        Fri, 09 Oct 2026 09:11:14 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm4744701f8f.15.2026.10.09.09.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:11:14 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v25 02/10] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Fri,  9 Oct 2026 18:10:47 +0200
Message-ID: <20261009161102.38961-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161102.38961-1-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
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

