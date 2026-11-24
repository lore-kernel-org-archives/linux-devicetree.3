Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535652;
	b=aG6O6yCQAiMKPR66+LA7MwfYplbcMCLxZrozW5CzK5IC68MTeV15exgwg28CQL1lsh2+
	 TqFN4/p+rvRpHJGTQrkRYaf647MqjRdB3DgAo5qU5Z652uXvjetX6i0SYgUSL7cEzG1qb
	 SQKNlqV6nk6TLpgCaP3Idt7k5WQy3bMZGqOnmsjuXIQ7DQpIt6vZ/XBy2pHqtF0lKvgJX
	 aZJ8P2jsg8TZULahNqKbaTYOAG1Y+quRGTWttkrc1z8rsnvzH//loZ4G8Hy8SpkC7Gy5a
	 VK6zhIMoq39560q3rX9Y2pPwci3i9of9FaZgw6dqwthzKv2PkwKIDTucadd6N75RHsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535652;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=62A24Gw4i4WAxGXf7pnGFl3gBBjZlO8f7ocs/xykGLk=;
	b=oYx7CRkSRScdtWArlS1PmYF1abOnuL2qU9wK45/2+l7+W7E/PyxRhLAVTEqA1kho3hJH
	 u4HQWHB8ibZ8fYbVkitUbuHjNmfI6jYVdld349xLuyI81230Hpe1lvabFMkqoVD/9yKHV
	 +B7revf4WzPYw+PyAGKBY0sGV/YEBvgcXROp2RdAvu3Pdgop46Wua8S5DlgNj79D7L6Pk
	 v3avW8l7QkqeMtSc+5IcM++aA5qKgC4YZemUEikblSu8YWkuw3zZyYH3uan/oP031Y65a
	 lg/3CqI4VjOkn/kqDSjB9/YObgvGkVCsOMiHluq9oLR3V33NFfux/P8HS+A0toeFvAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=FF5wxxqN;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295BC606A338;
	Tue, 24 Nov 2026 15:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 295BC606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=FF5wxxqN
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261124155410euoutp02e9308c19e452f4a05473bed72f938313~rBilH4smm0431604316euoutp02N;
	Tue, 24 Nov 2026 15:54:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261124155410euoutp02e9308c19e452f4a05473bed72f938313~rBilH4smm0431604316euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795535650;
	bh=62A24Gw4i4WAxGXf7pnGFl3gBBjZlO8f7ocs/xykGLk=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=FF5wxxqNIAG4221QVQT5ijF8No14GuEctjfZ6fTGRapH6wvFDY5HPaP0XPkCuAleu
	 AygwdUhaAXmOwKf5s+Xa+yS74x8g5fISRoEx33sNGP8FCaVt3iSQFxnm/8gdObr/Vg
	 eGSH2q6SrXMiHJeIhm5JXKFWIbNmH787CVdIrE5w=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155410eucas1p1a505fa8e80ea04caa33bbd7d1a8b796c~rBik429jn3132331323eucas1p1e;
	Tue, 24 Nov 2026 15:54:10 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155408eusmtip168e72ec1fad54c3cfb25b2f4186394ef~rBijQSSRo2656326563eusmtip1L;
	Tue, 24 Nov 2026 15:54:08 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 24 Nov 2026 16:52:42 +0100
Subject: [PATCH v8 06/18] dt-bindings: display: starfive: Add
 starfive,jh7110-vout-subsystem
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
Message-Id: <20261124-jh7110-clean-send-v8-6-de92635dd857@samsung.com>
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
	<cristian.ciocaltea@collabora.com>,  Conor Dooley
	<conor.dooley@microchip.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8475;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=jo+3YRaX1EEGhdkIUITSgYqM0z7lh3i1I9uuh/FVxrU=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWSzbhZ9cS7zq+7iujk/90fwtd3a6BdXtGj7PLa91Tt3d
	bPLTXbb3lHKwiDGwSArpshydmO0keQ/hqflxx//gpnDygQyhIGLUwAmosXD8L+8ffZ8168H6y5+
	klcNLl+523P9xxk6/6abz32labdoi/FqRobuqIy+nKiGlW8+1bvGGLfs3R20Oi/8xjW1SWf3eCw
	IFGMCAA==
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261124155410eucas1p1a505fa8e80ea04caa33bbd7d1a8b796c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261124155410eucas1p1a505fa8e80ea04caa33bbd7d1a8b796c
X-EPHeader: CA
X-CMS-RootMailID: 20261124155410eucas1p1a505fa8e80ea04caa33bbd7d1a8b796c
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
	<CGME20261124155410eucas1p1a505fa8e80ea04caa33bbd7d1a8b796c@eucas1p1.samsung.com>

The JH7110 groups its display hardware into a video output subsystem,
dom_vout_top, covering the DC8200, the HDMI transmitter, the video
output clock generator and the video output system controller.

They share one NoC port whose clock and reset gate access to every
register in the region, and the region sits in the PD_VOUT power
domain. Describe the subsystem as a bus node so those resources are
owned by the block that shares them.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../starfive/starfive,jh7110-vout-subsystem.yaml   | 218 +++++++++++++++++++++
 1 file changed, 218 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-vout-subsystem.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-vout-subsystem.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..74ac777d0406206b86ac77ca77003a32a7b10721
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-vout-subsystem.yaml
@@ -0,0 +1,218 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/starfive/starfive,jh7110-vout-subsystem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 video output subsystem
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+description:
+  The JH7110 groups its display hardware into a video output subsystem, named
+  dom_vout_top in the documentation. It covers the DC8200 display controller,
+  the HDMI transmitter, the video output clock generator and the video output
+  system controller, all behind one NoC port. That port's clock and reset gate
+  access to every register in the region, and the region sits in the PD_VOUT
+  power domain, so this node owns those resources on behalf of its children.
+
+properties:
+  compatible:
+    const: starfive,jh7110-vout-subsystem
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: NoC display bus clock.
+
+  resets:
+    maxItems: 1
+    description: NoC display bus reset.
+
+  power-domains:
+    maxItems: 1
+
+  dma-noncoherent: true
+
+  ranges: true
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+patternProperties:
+  "^display@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: starfive,jh7110-dc8200
+
+  "^hdmi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: starfive,jh7110-hdmi-subsystem
+
+  "^syscon@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: starfive,jh7110-vout-syscon
+
+  "^clock-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: starfive,jh7110-voutcrg
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - power-domains
+  - ranges
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/power/starfive,jh7110-pmu.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        display-subsystem@29400000 {
+            compatible = "starfive,jh7110-vout-subsystem";
+            reg = <0x0 0x29400000 0x0 0x200000>;
+            ranges;
+            #address-cells = <2>;
+            clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>;
+            dma-noncoherent;
+            power-domains = <&pwrc JH7110_PD_VOUT>;
+            resets = <&syscrg JH7110_SYSRST_NOC_BUS_DISP_AXI>;
+            #size-cells = <2>;
+
+            display@29400000 {
+                compatible = "starfive,jh7110-dc8200", "verisilicon,dc";
+                reg = <0x0 0x29400000 0x0 0x2800>;
+                clocks = <&voutcrg JH7110_VOUTCLK_DC8200_CORE>,
+                         <&voutcrg JH7110_VOUTCLK_DC8200_AXI>,
+                         <&voutcrg JH7110_VOUTCLK_DC8200_AHB>,
+                         <&voutcrg JH7110_VOUTCLK_DC8200_PIX0>,
+                         <&voutcrg JH7110_VOUTCLK_DC8200_PIX1>;
+                clock-names = "core", "axi", "ahb", "pix0", "pix1";
+                interrupts = <95>;
+                resets = <&voutcrg JH7110_VOUTRST_DC8200_CORE>,
+                         <&voutcrg JH7110_VOUTRST_DC8200_AXI>,
+                         <&voutcrg JH7110_VOUTRST_DC8200_AHB>;
+                reset-names = "core", "axi", "ahb";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        dpu_out_dpi0: endpoint@0 {
+                            reg = <0>;
+                            remote-endpoint = <&hdmi_in>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                    };
+                };
+            };
+
+            hdmi@29590000 {
+                compatible = "starfive,jh7110-hdmi-subsystem";
+                reg = <0x0 0x29590000 0x0 0x4000>;
+
+                controller {
+                    compatible = "starfive,jh7110-inno-hdmi-controller";
+                    clocks = <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
+                             <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
+                             <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
+                             <&hdmi_phy>;
+                    clock-names = "pclk", "mclk", "bclk", "pixel";
+                    interrupts = <99>;
+                    phys = <&hdmi_phy>;
+                    resets = <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
+                    starfive,vout-syscon = <&vout_syscon>;
+
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        port@0 {
+                            reg = <0>;
+
+                            hdmi_in: endpoint {
+                                remote-endpoint = <&dpu_out_dpi0>;
+                            };
+                        };
+
+                        port@1 {
+                            reg = <1>;
+
+                            endpoint {
+                                remote-endpoint = <&hdmi_con_in>;
+                            };
+                        };
+                    };
+                };
+
+                hdmi_phy: phy {
+                    compatible = "starfive,jh7110-inno-hdmi-phy";
+                    #clock-cells = <0>;
+                    clocks = <&xin24m>;
+                    #phy-cells = <0>;
+                };
+            };
+
+            vout_syscon: syscon@295b0000 {
+                compatible = "starfive,jh7110-vout-syscon", "syscon";
+                reg = <0x0 0x295b0000 0x0 0x10000>;
+            };
+
+            voutcrg: clock-controller@295c0000 {
+                compatible = "starfive,jh7110-voutcrg";
+                reg = <0x0 0x295c0000 0x0 0x10000>;
+                #clock-cells = <1>;
+                clocks = <&syscrg JH7110_SYSCLK_VOUT_SRC>,
+                         <&syscrg JH7110_SYSCLK_VOUT_TOP_AHB>,
+                         <&syscrg JH7110_SYSCLK_VOUT_TOP_AXI>,
+                         <&syscrg JH7110_SYSCLK_VOUT_TOP_HDMITX0_MCLK>,
+                         <&syscrg JH7110_SYSCLK_I2STX0_BCLK>,
+                         <&hdmi_phy>;
+                clock-names = "vout_src", "vout_top_ahb",
+                              "vout_top_axi", "vout_top_hdmitx0_mclk",
+                              "i2stx0_bclk", "hdmitx0_pixelclk";
+                power-domains = <&pwrc JH7110_PD_VOUT>;
+                #reset-cells = <1>;
+                resets = <&syscrg JH7110_SYSRST_VOUT_TOP_SRC>;
+            };
+        };
+    };
+...

-- 
2.34.1

