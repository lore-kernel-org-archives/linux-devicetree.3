Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD1F3B3BE5;
	Wed,  1 Jul 2026 06:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889118; cv=none; b=hO3UUrMZgBiBTvoRKnt8Ecyz6fAWM9taPY3jilGBL6AaInKL5TILHM17foGgT6kez/APQWi9tWQiL3AAmheQpwExqfbhX0Izf6L15Hw9ImaNE5rep0Q7qyZMqR3Nm3yz6lA1CG6e8arDCE3JsODr66ZhoNbGdiV8daP2HRKeziQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889118; c=relaxed/simple;
	bh=PMotyQehgGrEVoSSxouKDsCZuOfMr0EXxz1QwPMc58k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eII/LVZI3sH/CaZfFanbze3cCgH2D3As8bxBBBM/LguwfUZVhOC8eHYmZcD/3p5680zEEf09kzGeDzsmBoC2em8PG07o+W9WWPtXSft0vuNjR1Nqoxxo5zmAMO4A7KWIvotYDpp0zb8LDzYnWoqW4vvLtB11r/2j0t9hVS32zFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 1 Jul
 2026 14:58:18 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 1 Jul 2026 14:58:18 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 1 Jul 2026 14:58:17 +0800
Subject: [PATCH v3 1/3] dt-bindings: phy: aspeed: Document AST2700 USB3.2
 PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260701-upstream_usb3phy-v3-1-00e12315b6f9@aspeedtech.com>
References: <20260701-upstream_usb3phy-v3-0-00e12315b6f9@aspeedtech.com>
In-Reply-To: <20260701-upstream_usb3phy-v3-0-00e12315b6f9@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782889098; l=1695;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=PMotyQehgGrEVoSSxouKDsCZuOfMr0EXxz1QwPMc58k=;
 b=hFYD8zr7qSwYWi6q+U7ERKc+wEuXk5ozWnoYh3PntDKqnIiHF9YUjjcmrw0X6MNajmxg8Kify
 Fc5OD8AAIs5D9K5zHG+UO9vW52Z/J5fAJ34frQ6l1q6meyT4e65Uu4d
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

Document AST2700 USB3.2 PHY. This IP is connected between
USB3 controller and PHY module.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../bindings/phy/aspeed,ast2700-usb3-phy.yaml      | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/aspeed,ast2700-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/aspeed,ast2700-usb3-phy.yaml
new file mode 100644
index 000000000000..b83037aa0438
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/aspeed,ast2700-usb3-phy.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/aspeed,ast2700-usb3-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2700 USB 3.2 PHY
+
+maintainers:
+  - Ryan Chen <ryan_chen@aspeedtech.com>
+
+properties:
+  compatible:
+    const: aspeed,ast2700-usb3-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  '#phy-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed,ast2700-scu.h>
+    #include <dt-bindings/reset/aspeed,ast2700-scu.h>
+
+    usb-phy@12010000 {
+        compatible = "aspeed,ast2700-usb3-phy";
+        reg = <0x12010000 0xc0>;
+        clocks = <&syscon0 SCU0_CLK_GATE_PORTAUSB2CLK>;
+        resets = <&syscon0 SCU0_RESET_PORTA_PHY3>;
+        #phy-cells = <0>;
+    };

-- 
2.34.1

