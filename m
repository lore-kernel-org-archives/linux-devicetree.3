Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514164;
	b=GVKWrX06fJrtqJXbsqTY1CtM+8RAJub18pMC6IJWS+iNE2+Fqa7xkcPlSt1bRMfwi8tE
	 wllHljAPW0vc0G5mQjv3ts+fdj+BhjsZ2xxBLHF2IyO6Qdvy5fn5ADNWBgo6Gpjs+7TFA
	 dEoFU+7VWkjv0NEhjNvgyJ9oHcwPTfmgWCS2mBIWN8fY24nusAuu13J3TyzubMIhd/Jvz
	 YLwx1P2olLI8EjcQQksWgCB4BuEA4IAlFTgqkiEoXHD6NnVe3W/6YTACs2EjXmcCHpo40
	 BwI62YOE4VZprjO+3N+PNGflBauysafgN0tkYCwQERWogTtO+4q7EsZbNcF/T5tGfMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514164;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=06AQXyihJq/OEvwcZMATqFb1XaBS16clhoCnTaBSROQ=;
	b=X3/Spo/EAyAn1Hg18kbn5V+t5AN2sY9MbWz79qvBFoaXe4g4xO2UBNv6FbyACdv7Dn4m
	 Syv2m7hFied6lGbelRdUqv0J5tAV1cgGgOONkc+OWiGFVvFTN2rPMa/FMeerln+Ms1tZc
	 +321JKoBlO8PcI4oA7pBE2SvlQ6QQUQgkwpRwqt6RRYDuwcTc3kZiBu/bXqxrKKN6qnFd
	 NsHfp3X77YSH6N6jxo/VOGGiKbHGMOLx9oEF5O1r3nf04phQvUdKKBrImTHgwTrvAHX1m
	 3pJKfAqn55TWxVsfGN+Ny6gPJYYEg9/l3vYRKzXzn0e/XG2e8fnu3bLBrOqLe1vMu0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=lJTqO4zD;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A75606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A75606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=lJTqO4zD
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261124095556euoutp029e4f04902d68afbf813a44863099c632~q8pykrGoN2848228482euoutp02D
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:55:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261124095556euoutp029e4f04902d68afbf813a44863099c632~q8pykrGoN2848228482euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795514156;
	bh=06AQXyihJq/OEvwcZMATqFb1XaBS16clhoCnTaBSROQ=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=lJTqO4zD+PB7K66c1WmgMyxjayLU/IN7CjD4ccWJvUcW/TfFPAn8blRjLAGnxUINq
	 Z7+Wi23Px2QiGbMg5ITc1Ov4KMVtxrdd95dmsF/mYnBknG/ZxF3mcwFo3b7Lber4GX
	 vDAJ+4H8s2nOHdHVkl4TB3mWZgxDyq3q7yfZVRxc=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261124095555eucas1p1bf8a1e59f2197aafda6bc4f048384eec~q8pyNkyh21824718247eucas1p1R;
	Tue, 24 Nov 2026 09:55:55 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261124095554eusmtip24b9eb202848a11b54137244f0282c269~q8pxZUQWH3142631426eusmtip2b;
	Tue, 24 Nov 2026 09:55:54 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 24 Nov 2026 10:53:58 +0100
Subject: [PATCH v8 1/5] dt-bindings: phy: Add starfive,jh7110-inno-hdmi-phy
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
Message-Id: <20261124-jh7110-inno-hdmi-phy-v8-1-5e3008122cba@samsung.com>
In-Reply-To: <20261124-jh7110-inno-hdmi-phy-v8-0-5e3008122cba@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2057;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=6AQm50xtAvbrSQTSn64RxXqfjCuQ7qgMNyPcGxB0fq8=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWSzxmuq14sV/uf5x3FGacaLf0oXq/0WH8xNzNl//IJlz
	rG556P+d5SyMIhxMMiKKbKc3RhtJPmP4Wn58ce/YOawMoEMYeDiFICJiH9k+O/2y7lZdHbMbX2h
	LTphQpWWh2N0tr9ewt58T9locsD6xjJGhuk/n3z+wB4vuSAh3FDmlaf0lX1bEmeabayYJ/e8I2r
	XAgYA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261124095555eucas1p1bf8a1e59f2197aafda6bc4f048384eec
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261124095555eucas1p1bf8a1e59f2197aafda6bc4f048384eec
X-EPHeader: CA
X-CMS-RootMailID: 20261124095555eucas1p1bf8a1e59f2197aafda6bc4f048384eec
References: <20261124-jh7110-inno-hdmi-phy-v8-0-5e3008122cba@samsung.com>
	<CGME20261124095555eucas1p1bf8a1e59f2197aafda6bc4f048384eec@eucas1p1.samsung.com>

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
index 0000000000000000000000000000000000000000..8dbd113b1534a37d00dfd60454f300531a813b8b
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
+  # Documentation/devicetree/bindings/display/starfive/starfive,jh7110-hdmi-subsystem.yaml
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

