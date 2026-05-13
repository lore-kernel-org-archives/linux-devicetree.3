Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C40631B803;
	Wed, 13 May 2026 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778678301; cv=none; b=f+zAIGzEdGcdBqHQh6pi2FOJKD8hZhLM6AdFnvgrJ5SrZcvIw/Fq5dRb3rbEItA5bwRu+0PYOMLVNVBVqX5J7/2g9hhu6/x9x9S0+lh/PtC5F9U84z64aCMVp+XjPTj6dAWirdlC3Zy7MLI5yMBBvZ7rPcDleaCj2MUIhn9vm2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778678301; c=relaxed/simple;
	bh=MN6gx8GYe5AmBvcrHuK35BGCdY8iabWy4vmQ/SnipFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YHmxu/H+YMTPASdindpBEIfcmqeWe7FooBCzC/IYoEFD02CljzbYNrjdte62FfTQKfvA7+8KqtCtLxCpeb/XrcProP55OeYALmJAQVAen6BO0dQpfuDR6lhqewtFLeB/yYlj6o7FHXVVabV6nDGV5uWj4bDJAeT6hHtN5Q0nQkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J2P5bFyn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J2P5bFyn"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67BF83055;
	Wed, 13 May 2026 15:18:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778678284;
	bh=MN6gx8GYe5AmBvcrHuK35BGCdY8iabWy4vmQ/SnipFg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J2P5bFynHd0vfwnU6swShwDFdW0W1yqZs95pmrvkAc9egGSht8lTTdYTC2eVlA/zJ
	 vzKeqy+xZ0btEdsNr7KDUsPbI/py1AWMjMbI1vyh36UreOTKKc4ABY5S3kSdVoG0ud
	 BClKY+nSj0Ond2TrAe2y0sRtx8TYVsjLKr2yh51k=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 13 May 2026 16:17:37 +0300
Subject: [PATCH v2 15/16] arm64: dts: ti: k3-am62p-j722s-common-main: Add
 support for DSS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-beagley-ai-display-v2-15-9e9bcefde6bc@ideasonboard.com>
References: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
In-Reply-To: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8659;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=zJr8xt+UVG09ZxVvgTj+ef6tvCst5mbuQtco7mnX1HI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBHoBlQxqEv7AscI6GKbObjkoctOcC14SJ8btS
 8CR2lAxVFmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagR6AQAKCRD6PaqMvJYe
 9VTuD/0Zs198hxXzBRyNzZTEgdDTg/YxWYxideTp5Q09Xkkjto1hy453SqMTG2gNdBQnC6O8f00
 PLOvu0NBf7bhew/mwVJt3sv/bxqRHU7y70xBaZh0QmF+YE8xk6l6XiPDXVBhpcm6GyyFoe26SNV
 X0JwZ9mj7Tq/mOZ/9RMk38LpC01Bkoho/ReBPIlW5Zw6xWuaQGkGJP3vB/ZyyOPnl4jULwqbvA0
 vB8XXAiXXpxWeYPLh57zE5aHmAtbi0MZQqrkOvbgVSEqQxH40RgjIDNht2sk3+GccF/2NXBmwsI
 RBS95eAqWDA4POUqQOESCcP9QF5TDsdvPzt2dtmNdINJ24aqIG4kFv52eiZTjmg/NvcGPQUERSj
 IdsADfFKcswMuxzN1AdOaTkAX2fXZtVa2vAfH0FX/2qObp96FVWjyyO1WO6GVWMHaByOCDkmzJL
 LARgXwJRr4jSrHGP/lsE0nUqjBEU72DtRjhBgLTxgTRIzNMHBgSEyxVE2d/ceoAz7iBCEUBHPul
 8ehCdSb0eKi4SunFpaNjWE/bl8om6ejbRrhv7Zq55V9uQRZUuV6Oje27S36+zK8sVL++tW2NVpw
 ZgLQhd2SZ1xYmWAs36YGk42w90049ycaMZ3twimbrcow1xz6NI1mY+YknT0RdnWtXUCyz9r5Zu4
 +2+NlZbByrJ4CHA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Jayesh Choudhary <j-choudhary@ti.com>

TI's AM62P and J722S SoCs support 2 display subsystems (DSS), DSS0 and
DSS1, each with two video ports (VP) and two video planes. The outputs
from the DSS VPs can be routed to two OLDI TXes (OLDI0, OLDI1), a DSI
TX, or parallel DPI output.

DSS0 supports:
- VP0: OLDI0 in single-link mode or OLDI0 and OLDI1 in dual-link or
  clone mode.
- VP1: DPI

DSS1 supports:
- VP0: OLDI1 in single-link mode, or DPI
- VP1: DPI or DSI

The DSI is only connected to VP1 of DSS1, but OLDI and DPI are shared
between the DSS instances. Thus only a single VP can output to DPI, and
a single VP can use an OLDI block. Note that in single-link
configuration OLDI0 can be used by DSS0, and at the same time OLDI1 can
be used by DSS1.

Add the necessary nodes to k3-am62p-j722s-common-main.dtsi, including
DSS0, DSS1, OLDI0, OLDI1, DPHY and DSI.

An important note about OLDIs:

We have two OLDI hardware blocks. Each OLDI has certain configuration
that has to be done before it can be used. The OLDI blocks get this
configuration directly from the DSS block, via DSS registers. However,
as a single OLDI block can be used either with DSS0 or DSS1, the
source for the configuration changes according to (probably, this is
unclear) a DSS related clock mux.

So, afaics, when thinking about Linux device hierarchy wrt. control
busses, OLDI blocks are children of DSS blocks, and they reside in a
special DSS bus. And the OLDI parent changes according to the mux. As
far as I know, there is no way we can represent this in the DT.

Thus the solution used here (and in the driver) is that each DSS node
contains the OLDI nodes that can be used with that DSS. Thus the DSS0
node has two child nodes, OLDI0 and OLDI1, and the DSS1 node has one
child node, OLDI1. The OLDI1 nodes thus refer to the same piece of
hardware, and they cannot be used at the same time. The selection which
OLDI nodes to use are chosen in the board dts files, so assuming the dts
files are correct, no resource conflict can happen.

This is not a very nice solution, but the hardware doesn't make it easy
to have a clean solution, and, most importantly, this works.

[j-choudhary@ti.com: Refactor changes for k3-am62p-j722s-common-main.dtsi
 and add changes for new OLDI driver support]

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
[tomi.valkeinen: various fixes and improvements]
Tested-by: Swamil Jain <s-jain1@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi    | 109 +++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p.dtsi               |  16 +++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi               |  16 +++
 3 files changed, 141 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 41067f2f1425..6bdd7e7a8cee 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -64,6 +64,11 @@ audio_refclk1: clock-controller@82e4 {
 			#clock-cells = <0>;
 		};
 
+		dss_oldi_io_ctrl: dss-oldi-io-ctrl@8600 {
+			compatible = "ti,am625-dss-oldi-io-ctrl", "syscon";
+			reg = <0x8600 0x200>;
+		};
+
 		phy_gmii_sel: phy@4044 {
 			compatible = "ti,am654-phy-gmii-sel";
 			reg = <0x4044 0x8>;
@@ -1110,6 +1115,110 @@ dphy0: phy@30110000 {
 		status = "disabled";
 	};
 
+	dss0: dss@30200000 {
+		compatible = "ti,am62p-dss";
+		reg = <0x00 0x30200000 0x00 0x1000>, /* common */
+		      <0x00 0x30202000 0x00 0x1000>, /* vidl1 */
+		      <0x00 0x30206000 0x00 0x1000>, /* vid */
+		      <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
+		      <0x00 0x30208000 0x00 0x1000>, /* ovr2 */
+		      <0x00 0x3020a000 0x00 0x1000>, /* vp1: Used for OLDI */
+		      <0x00 0x3020b000 0x00 0x1000>, /* vp2: Used as DPI */
+		      <0x00 0x30201000 0x00 0x1000>; /* common1 */
+		reg-names = "common", "vidl1", "vid",
+			    "ovr1", "ovr2", "vp1", "vp2", "common1";
+		power-domains = <&k3_pds 186 TI_SCI_PD_EXCLUSIVE>;	/* DSS0 */
+		clocks = <&k3_clks 186 6>,
+			 <&dss0_vp1_clk>,
+			 <&k3_clks 186 2>;
+		clock-names = "fck", "vp1", "vp2";
+		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+		ti,dpi-io-ctrl = <&main_conf 0x8300>;
+		status = "disabled";
+
+		oldi-transmitters {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dss0_oldi0: oldi@0 {
+				reg = <0>;
+				clocks = <&k3_clks 186 0>;
+				clock-names = "serial";
+				ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+				status = "disabled";
+				power-domains = <&k3_pds 243 TI_SCI_PD_EXCLUSIVE>; /* OLDI0_VD */
+			};
+
+			dss0_oldi1: oldi@1 {
+				reg = <1>;
+				status = "disabled";
+				power-domains = <&k3_pds 244 TI_SCI_PD_EXCLUSIVE>; /* OLDI1_VD */
+			};
+		};
+	};
+
+	dss1: dss@30220000 {
+		compatible = "ti,am62p-dss";
+		reg = <0x00 0x30220000 0x00 0x1000>, /* common */
+		      <0x00 0x30222000 0x00 0x1000>, /* vidl1 */
+		      <0x00 0x30226000 0x00 0x1000>, /* vid */
+		      <0x00 0x30227000 0x00 0x1000>, /* ovr1 */
+		      <0x00 0x30228000 0x00 0x1000>, /* ovr2 */
+		      <0x00 0x3022a000 0x00 0x1000>, /* vp1: Used for DPI/OLDI */
+		      <0x00 0x3022b000 0x00 0x1000>, /* vp2: Used DPI/DSI */
+		      <0x00 0x30221000 0x00 0x1000>; /* common1 */
+		reg-names = "common", "vidl1", "vid",
+			    "ovr1", "ovr2", "vp1", "vp2", "common1";
+		power-domains = <&k3_pds 232 TI_SCI_PD_EXCLUSIVE>;	/* DSS1 */
+		clocks = <&k3_clks 232 8>,
+			 <&dss1_vp1_clk>,
+			 <&k3_clks 232 4>;
+		clock-names = "fck", "vp1", "vp2";
+		interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+		ti,dpi-io-ctrl = <&main_conf 0x8300>;
+		status = "disabled";
+
+		oldi-transmitters {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dss1_oldi1: oldi@1 {
+				reg = <1>;
+				clocks = <&k3_clks 232 0>;
+				clock-names = "serial";
+				ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+				status = "disabled";
+				power-domains = <&k3_pds 244 TI_SCI_PD_EXCLUSIVE>; /* OLDI1_VD */
+			};
+		};
+	};
+
+	dphy_tx0: phy@301c0000 {
+		compatible = "ti,j721e-dphy";
+		reg = <0x0 0x301c0000 0x0 0x1000>;
+		clocks = <&k3_clks 238 16>, <&k3_clks 238 1>;
+		clock-names = "psm", "pll_ref";
+		#phy-cells = <0>;
+		power-domains = <&k3_pds 238 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 238 1>;
+		assigned-clock-parents = <&k3_clks 238 2>;
+		assigned-clock-rates = <25000000>;
+		status = "disabled";
+	};
+
+	dsi0: dsi@30500000 {
+		compatible = "ti,j721e-dsi";
+		reg = <0x0 0x30500000 0x0 0x100000>, <0x0 0x30270000 0x0 0x100>;
+		clocks = <&k3_clks 231 2>, <&k3_clks 231 5>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		power-domains = <&k3_pds 231 TI_SCI_PD_EXCLUSIVE>;
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&dphy_tx0>;
+		phy-names = "dphy";
+		status = "disabled";
+	};
+
 	vpu: video-codec@30210000 {
 		compatible = "ti,j721s2-wave521c", "cnm,wave521c";
 		reg = <0x00 0x30210000 0x00 0x10000>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p.dtsi b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
index 9d6266d6ddb8..074dc44ec049 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
@@ -144,6 +144,22 @@ cbass_wakeup: bus@b00000 {
 		};
 	};
 
+	dss0_vp1_clk: clock-divider-oldi-dss0 {
+		compatible = "fixed-factor-clock";
+		clocks = <&k3_clks 186 0>;
+		#clock-cells = <0>;
+		clock-div = <7>;
+		clock-mult = <1>;
+	};
+
+	dss1_vp1_clk: clock-divider-oldi-dss1 {
+		compatible = "fixed-factor-clock";
+		clocks = <&k3_clks 232 0>;
+		#clock-cells = <0>;
+		clock-div = <7>;
+		clock-mult = <1>;
+	};
+
 	#include "k3-am62p-j722s-common-thermal.dtsi"
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-j722s.dtsi b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
index 059c65ece183..f5b74281ab3d 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
@@ -227,6 +227,22 @@ cbass_wakeup: bus@b00000 {
 		};
 	};
 
+	dss0_vp1_clk: clock-divider-oldi-dss0 {
+		compatible = "fixed-factor-clock";
+		clocks = <&k3_clks 186 0>;
+		#clock-cells = <0>;
+		clock-div = <7>;
+		clock-mult = <1>;
+	};
+
+	dss1_vp1_clk: clock-divider-oldi-dss1 {
+		compatible = "fixed-factor-clock";
+		clocks = <&k3_clks 232 0>;
+		#clock-cells = <0>;
+		clock-div = <7>;
+		clock-mult = <1>;
+	};
+
 	#include "k3-am62p-j722s-common-thermal.dtsi"
 };
 

-- 
2.43.0

