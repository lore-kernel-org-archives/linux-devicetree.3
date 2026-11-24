Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535648;
	b=w2JTeRy20DBPohlu+ktsW9E+4dq8SI6+rbOXWziwxqf5OTJOE3+nzII1I42DRUcLkBsN
	 P85Al8XOMfi7TkLPMa/TmOR0YLt/10AndPz0wyhYsPgZpmh3pM8zfAFZdL9C3c+38utdj
	 3l1hf/ynl+6xAAKybcb8fXRWIQPRb5Uks6ILdHIf2C4hBAUw/amqsC/5eKVLeM0S2JmCP
	 oxS4LJpfBynBprtIkQ5CpPZ9oW+nowuxu+Lm8nRu+w6f+uLSu5c/wExQOr1wz0GtxRrI6
	 lZPxq8ie+uRxeTRFo9CvXWNiUJs3mBncxm5aPzKxRkG+O33JHylv1BCjFD2nPCPMv1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535648;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=jENpz6dzCvEP9Gnuo5alwVcJmoZBCGPAfNYJOI8T6Fs=;
	b=kbMWpCINAv7tHl0UXr+uY1URxx/Q5gGTQj/+9vjWpi1FBh2QRE95ceCtaDhWAIOlKEcL
	 HsyKPXs0i0ieWUGz2vIifRmCMyW2BN7F5txT3mCvGdrC4DkhtOlUVxOS2QrEYQKPvIMLD
	 AQi6wkR1mkglmv8WPRoMXqmipb0OI7jZFPxuQiYvN4ATVW65sBJmRg0FabbulQRSyvpZg
	 X5+t3QN7DAuHrpVRLnm7OIeBHUdI9FqlQ0x4dJ9M/L0RT8ekT3NF2IJAM9Kjay2ePKsQU
	 ygifAWDBoMcxfmebM4y3rBCpvaL9FmjqbbiiauvYftk+XSYgyVywrQIjfBk0X1Kno4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="eSJ0j/zy";
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1CB606A696;
	Tue, 24 Nov 2026 15:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F1CB606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=eSJ0j/zy
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261124155405euoutp015ac407c3ce906e43725bcabe259f2675~rBigHsSlr1661816618euoutp01h;
	Tue, 24 Nov 2026 15:54:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261124155405euoutp015ac407c3ce906e43725bcabe259f2675~rBigHsSlr1661816618euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795535645;
	bh=jENpz6dzCvEP9Gnuo5alwVcJmoZBCGPAfNYJOI8T6Fs=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=eSJ0j/zyhTzjaERBfi09hode5MG2FPtOqMJ3l7eexiVFkkL+iL5Sm6RZCewI4VTVV
	 /PL73YfWr/UAH4QOwidhXWOdsvGdQu1K8wJBeFDTASQzLxnZuwPegWQEzHGInAZ3bp
	 mPwh2f3i4rqBc+FGnXSahvGwbGFDr/Olcc/tgI1k=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155405eucas1p16e1890307874ae88842b4aa4c852f5af~rBifz3E-30908509085eucas1p1I;
	Tue, 24 Nov 2026 15:54:05 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155403eusmtip1d5fc396a63b3ea918f46ec380b4991f3~rBieQLsYO2899328993eusmtip1I;
	Tue, 24 Nov 2026 15:54:03 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 24 Nov 2026 16:52:39 +0100
Subject: [PATCH v8 03/18] dt-bindings: display: bridge: Add
 starfive,jh7110-inno-hdmi-controller
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
Message-Id: <20261124-jh7110-clean-send-v8-3-de92635dd857@samsung.com>
In-Reply-To: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Robert Foss
	<rfoss@kernel.org>,  Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Philipp Zabel
	<p.zabel@pengutronix.de>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Yakir Yang
	<kuankuan.y@gmail.com>,  Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>,  Conor Dooley <conor@kernel.org>, William Qiu
	<william.qiu@starfivetech.com>,  Xingyu Wu <xingyu.wu@starfivetech.com>,
	Sandy Huang <hjc@rock-chips.com>,  Manivannan Sadhasivam <mani@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4310;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=0Pe+zrvXANQYyAd1ud584zGkokHB97sZliMA0xpSBQ8=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWSzbhb9ZHziPU+Vp42wYfaEieartA68NfTJcZNu4tn59
	6b77J6ejlIWBjEOBlkxRZazG6ONJP8xPC0//vgXzBxWJpAhDFycAjCRujcMf+VlPcx3/P7D36MV
	L/1W6GHeHQbWjVcKOSZ+Csk9b/KqlJuR4fJeo6wtvbI/T+fNf7VmXckDb0b+Ky6Nbee2/f5b8uO
	kFDcA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261124155405eucas1p16e1890307874ae88842b4aa4c852f5af
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261124155405eucas1p16e1890307874ae88842b4aa4c852f5af
X-EPHeader: CA
X-CMS-RootMailID: 20261124155405eucas1p16e1890307874ae88842b4aa4c852f5af
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
	<CGME20261124155405eucas1p16e1890307874ae88842b4aa4c852f5af@eucas1p1.samsung.com>

Add the dt-binding for the StarFive JH7110 Innosilicon HDMI controller
(DRM bridge).

This device is the second child of the starfive,jh7110-hdmi-subsystem node.
It consumes its register access, audio master and audio bit clocks
(pclk, mclk, bclk) from voutcrg, and both the pixel clock (pixel) and
the PHY from its hdmi_phy sibling.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../starfive,jh7110-inno-hdmi-controller.yaml      | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml b/Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..eb03404d8c60a6ecadd0a4f5aee7c46b6f4da3ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Innosilicon HDMI Controller
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+description:
+  The controller portion of the StarFive JH7110 INNO HDMI IP.
+
+properties:
+  compatible:
+    const: starfive,jh7110-inno-hdmi-controller
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The HDMI controller main clock
+      - description: Audio master clock
+      - description: Audio bit clock, from the I2S transmitter
+      - description: The pixel clock, generated by the PHY
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: mclk
+      - const: bclk
+      - const: pixel
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  starfive,vout-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the dom_vout_syscon system controller, which holds the mux
+      selecting the DC8200 output that drives the HDMI transmitter.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input from the DC8200. The remote port number selects the DC8200
+          panel and the remote endpoint number the interface on that panel,
+          0 for DPI and 1 for DP.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output to the HDMI connector.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - phys
+  - starfive,vout-syscon
+  - ports
+
+additionalProperties: false
+
+examples:
+  # Shown as a child of the HDMI subsystem node; see
+  # Documentation/devicetree/bindings/display/starfive/starfive,jh7110-hdmi-subsystem.yaml
+  # for the full node.
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    controller {
+        compatible = "starfive,jh7110-inno-hdmi-controller";
+        clocks = <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
+                 <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
+                 <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
+                 <&hdmi_phy>;
+        clock-names = "pclk", "mclk", "bclk", "pixel";
+        interrupts = <99>;
+        phys = <&hdmi_phy>;
+        resets = <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
+        starfive,vout-syscon = <&vout_syscon>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&dpu_out_dpi0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&hdmi_con_in>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.34.1

