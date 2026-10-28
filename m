Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200954;
	b=HBnUxqSf0LRy6RMva5St35uSgKFX9Rphjyo83Lvt+z2eUfwUoGxVyXbN8ZzrKYO8umVu
	 j7GSVg5K17gQ8ghe9NmzpkpknFVSEf+mJDlrEgktW4/pZ+D09eAHMLyz9f7R8Kp7DJw4r
	 3RmxgAs1v8xGr1YOLWPS962x7fMy6VXETKScO4xQJeWnv6LVKi7tRwkmlWNQIEK+/UxmO
	 R1N/xSq7IgxeDWfT7ncAe4Z8y00wZv1OzTDFhc3shD/J4oy3DL5gXrc+uqWU9G4AfUAmJ
	 aNkJXy59P0ke6MvpeKSa0mAev4Z5KOdP7qzFvhA5a7C8myM8trH1TFSOTv0Hobi2tcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200954;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=xBtco3yaw3qEzXnfIqoE7d0Ook29poapW94M82D2xPU=;
	b=hTIHZoJudHa0C2Ibocw/dboFJRhnSNUJd0PKf2NsUHbkjAAYVeGJ9DHS4bW+Pe58Vwpd
	 XsEC+wYYYgiHiEShEXbjSpkhTXRH0r7/HJ5J5C2hfC7MacFpYniWWKDjWkrNhlp3vi1pF
	 Y5a1X0u+r2Kz6rpIuBEFfLmoL6PbJaMoS2WRIWBixKeswSCcEIE6LhL1SyxU5skxlhXWS
	 jRLlasH2xj6w5Bv7tir5hwsUzztEtS+IOuBUzM28oKeKmkSvax/l2Gy42LYhaNhYBtLra
	 TiZVJKxR97JToDOpnINVnHi1mz/sBLven7d2/Xku5AZiVztf8Gfn4jo6lwYWmjt3GuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=fQwPSBpU;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82CB606C038
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A82CB606C038
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=fQwPSBpU
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261028152227euoutp028db92579b40c22d16e06cd5a2af40a74~iusK2gJkx1485514855euoutp02L
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:22:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261028152227euoutp028db92579b40c22d16e06cd5a2af40a74~iusK2gJkx1485514855euoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793200947;
	bh=xBtco3yaw3qEzXnfIqoE7d0Ook29poapW94M82D2xPU=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=fQwPSBpUAkaEsyUCQ8rrhxlmIAkTBNxkPuEgbG+gG3aOm6HHfPWc9RMqVhK9J4qwY
	 r4oD6xTY4JUxACnPovdtFm3WyAAqO3BL8vLaaClPD9mWfOiWUWDHlkLKMfQr/HW2QJ
	 PYxcITTU6peVRe7kuEi1ejqICeAKFyQqlcLEqQ7A=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261028152226eucas1p1d17fa9350e2d480774843e5b9e78fb37~iusKa4ztM1685916859eucas1p1c;
	Wed, 28 Oct 2026 15:22:26 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261028152225eusmtip16d6428135e48edb5558e2cbfe49d21ca~iusJm4mEe2037320373eusmtip1Q;
	Wed, 28 Oct 2026 15:22:25 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 28 Oct 2026 16:21:41 +0100
Subject: [PATCH v6 1/5] dt-bindings: phy: Add starfive,jh7110-inno-hdmi-phy
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-jh7110-inno-hdmi-phy-v6-1-f3379684d97e@samsung.com>
In-Reply-To: <20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>,  Manivannan Sadhasivam <mani@kernel.org>, Rob
	Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
	Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Emil Renner
	Berthing <kernel@esmil.dk>,  Hal Feng <hal.feng@starfivetech.com>, Dominique
	Belhachemi <db@domibel.de>,  Michal Wilczynski <m.wilczynski@samsung.com>,
	Andy Yan <andyshrk@163.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2053;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=WSoM/PLgxIAO3P/HP4El0/pBeW1xIxFbcAyyXD+Ha8c=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWQ9EjYQKrk1N7aa4wx7YUij4xrX0wvezhLa4u1Tvszj1
	ttgJXOujlIWBjEOBlkxRZazG6ONJP8xPC0//vgXzBxWJpAhDFycAjAR40uMDB9e3f7AwHDgHr+p
	vXKjo+9VyeuvreZVLtXQ3Rpn/SNpJTvD/6pz/6TnXMx1FtvNzcvDJZt7KNSqQmzjvGy1fKboc4v
	KWAA=
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261028152226eucas1p1d17fa9350e2d480774843e5b9e78fb37
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261028152226eucas1p1d17fa9350e2d480774843e5b9e78fb37
X-EPHeader: CA
X-CMS-RootMailID: 20261028152226eucas1p1d17fa9350e2d480774843e5b9e78fb37
References: <20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com>
	<CGME20261028152226eucas1p1d17fa9350e2d480774843e5b9e78fb37@eucas1p1.samsung.com>

Add the dt-binding for the StarFive JH7110 Innosilicon HDMI PHY.

This device is a child of the starfive,jh7110-hdmi-subsystem node. It
functions as both a PHY provider for the controller and as a clock
provider for the variable pixel clock (hdmi_pclk), which it generates
from its refoclk.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../phy/starfive,jh7110-inno-hdmi-phy.yaml         | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6417553e0f5ba295b0451301ca7c1a25534993a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/starfive,jh7110-inno-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Innosilicon INNO HDMI PHY
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+description:
+  The PHY portion of the StarFive JH7110 INNO HDMI IP.
+
+properties:
+  compatible:
+    const: starfive,jh7110-inno-hdmi-phy
+
+  clocks:
+    maxItems: 1
+    description: Reference oscillator.
+
+  '#clock-cells':
+    const: 0
+
+  '#phy-cells':
+    const: 0
+
+required:
+  - compatible
+  - clocks
+  - '#clock-cells'
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  # Shown as a child of the HDMI subsystem node; see
+  # Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi-subsystem.yaml
+  # for the full node.
+  - |
+    phy {
+        compatible = "starfive,jh7110-inno-hdmi-phy";
+        #clock-cells = <0>;
+        clocks = <&xin24m>;
+        #phy-cells = <0>;
+    };
+
+...

-- 
2.34.1

