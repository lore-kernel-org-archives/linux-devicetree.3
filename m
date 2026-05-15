Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8A335C1AD;
	Fri, 15 May 2026 01:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778807869; cv=none; b=NnQg05rWuWQw6dcoplkLnPaheiibWgGgDLr0BFRxdELgSM0C8dd0+XWyuSfzG2ILpryPksVLXgLNA/ydgGY7KKDFR90LUdsO16MtYHFQeywdqVoLe9X07hompd/K2iAXzVHBnvzWFh9dJ939189krX2++fqlD9rbdu5JwvgKiwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778807869; c=relaxed/simple;
	bh=OIp5QhZYmoy06OSupWAuN0F9VpYPnxuiqhpGxD9A+sQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hugvXsf9j19dVK8zzS6GZlyftdJ86abTibo02YiE1zH/hBH+sdwCGOv4jQ+Y2VgfQoo/kdUy/lKNhNwQlvVMV6c87Qu3W7X0Avpketle1q8O67ym5+ETjc1L90puD1CqIBftFZMWbJuUbuH2HTPlyzWDvI3SYw/DGU1PQy89V4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UZD/ow7H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UZD/ow7H"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1da4:3c70:f102:9ea:5df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF5B963C;
	Fri, 15 May 2026 03:17:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778807856;
	bh=OIp5QhZYmoy06OSupWAuN0F9VpYPnxuiqhpGxD9A+sQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UZD/ow7He7lx7OLGLuEgoIvPKWCpeCWrmWNeqMHQD0VVlVmuGalRKKtuxk+6ztYdv
	 EImJvj1h9kNj0AnJM9t/V/2tFYjHYruGPTrXfVvA1NBs6pl+m3mQGGMrTPWobw4Ljf
	 BDs18a7Kz4l78hpUjSLUVjBK+T/K6Y3w9ypYJhwU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 15 May 2026 06:46:39 +0530
Subject: [PATCH v2 4/4] arm64: dts: ti: k3-am67a-beagley-ai: Add overlay
 for IMX219 on CSI1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-beagley-cameras-v2-4-f6acb66c9995@ideasonboard.com>
References: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com>
In-Reply-To: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5011;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=OIp5QhZYmoy06OSupWAuN0F9VpYPnxuiqhpGxD9A+sQ=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqBnQcZjXD+gmNkTCk0fOIjBSnwP+WJ0Kzg/YJ+
 UR/vFt7nayJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCagZ0HAAKCRBD3pH5JJpx
 RTb8D/0SMo1w2bH21j8uCRfIoCFucrR7Owxgx0KURU4OI7a75ejeRurATcjetizk6z0ry8fcUzI
 C19AUjLYSNI/LhHavuxLnkTyJ8ook37eS2GyG/gsqSoBuMTNDBIbn4pmdpgHVZJ40puQ9kpJljV
 VtQ+2rQsPtc+ZGvB6cnmn7cjbZ/FRjweEa0pyFZN16ICZku9FzM1FJ9ZxhPyYUjkfG/dNu4QAqz
 kbalz+HIV044xm4yblSDhFYspZ0JGFCfVOagD4atixA/3P87W/YNUsJZ4Ot1stOoMOap+EbS9k2
 Bv5zdJ939yuDsWmKT9hEfifT8ZRnr4uyqTJBHA8xvmhIHszOG07Z+37mKSClE9gfSlCalpsHyOy
 cxrJlFh9YMQAmTcjPN8yIHbqGLxf77e1G8dxTCiecVgsUSXxlN61pDAXtt0V/N3WaiEanEOy2eM
 XBIdurRlAKXliKlzgRn5JArj7fpJ9ahywCk77wMNGqb1gHPhZ6OBu4+Z1ikuH7wsBE4Lxc+ldqy
 W/GJLV6CtdLmzq/ji358dydEpHCmKiEm8gPfs+plheCkjMLnsQzG4WWIDORVag1kW0172ef1gZ6
 LRt68Xux2x3Eory95XfALyY9ggJUJbI9tnvamx3ql6A0E4IGpZ0H5mVN8oKaFLQHZ07kguQTnm2
 lpKAMeQZEepS3vw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

RPi v2 Camera (IMX219) is an 8MP camera that can be used with BeagleY AI
through the 22-pin CSI-RX connectors. Add a DT overlay to enable use of
this camera sensor through the CSI1 connector.

The CSI1 connector is muxed with DSI0, so ensure that we route it to
CSI1 (DSI_CSI_OE=0 and DSI_CSI_SEL=1).

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 arch/arm64/boot/dts/ti/Makefile                    |   4 +
 .../dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso    | 121 +++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 68a82e161c20..51e74f26c803 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -153,6 +153,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
 # Boards with J722s SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai-csi0-imx219.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai-csi1-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
@@ -248,6 +249,8 @@ k3-am642-tqma64xxl-mbax4xxl-wlan-dtbs := \
 	k3-am642-tqma64xxl-mbax4xxl.dtb k3-am64-tqma64xxl-mbax4xxl-wlan.dtbo
 k3-am67a-beagley-ai-csi0-imx219-dtbs := k3-am67a-beagley-ai.dtb \
 	k3-am67a-beagley-ai-csi0-imx219.dtbo
+k3-am67a-beagley-ai-csi1-imx219-dtbs := k3-am67a-beagley-ai.dtb \
+	k3-am67a-beagley-ai-csi1-imx219.dtbo
 k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
@@ -322,6 +325,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
 	k3-am67a-beagley-ai-csi0-imx219.dtb \
+	k3-am67a-beagley-ai-csi1-imx219.dtb \
 	k3-am68-phyboard-izar-lvds-ph128800t006.dtb \
 	k3-am68-phyboard-izar-peb-av-15.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso
new file mode 100644
index 000000000000..b3ae76e03fe3
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * RPi Camera V2.1 on BeagleY AI CSI1 port
+ *
+ * Copyright (C) 2026 Ideas On Board Oy
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	clk_imx219_csi1: imx219-csi1-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
+	reg_2p8v_csi1: regulator-2p8v-csi1 {
+		compatible = "regulator-fixed";
+		regulator-name = "2P8V_CSI1";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-always-on;
+	};
+
+	reg_1p8v_csi1: regulator-1p8v-csi1 {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V_CSI1";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-always-on;
+	};
+
+	reg_1p2v_csi1: regulator-1p2v-csi1 {
+		compatible = "regulator-fixed";
+		regulator-name = "1P2V_CSI1";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-always-on;
+	};
+};
+
+&main_pmx0 {
+	cam1_reset_pins_default: cam1-default-reset-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x01d8, PIN_OUTPUT, 7) /* (D22) MCAN0_TX.GPIO1_24 */
+		>;
+	};
+};
+
+&dsi_csi_mux {
+	idle-state = <1>;
+};
+
+&main_i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c0_pins_default>;
+	clock-frequency = <400000>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	imx219_1: sensor@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+
+		clocks = <&clk_imx219_csi1>;
+
+		VANA-supply = <&reg_2p8v_csi1>;
+		VDIG-supply = <&reg_1p8v_csi1>;
+		VDDL-supply = <&reg_1p2v_csi1>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam1_reset_pins_default>;
+
+		reset-gpios = <&main_gpio1 24 GPIO_ACTIVE_HIGH>;
+
+		port {
+			csi2_cam1: endpoint {
+				remote-endpoint = <&csi2rx1_in_sensor>;
+				link-frequencies = /bits/ 64 <456000000>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&cdns_csi2rx1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi1_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2rx1_in_sensor: endpoint {
+				remote-endpoint = <&csi2_cam1>;
+				bus-type = <4>; /* CSI2 DPHY. */
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&ti_csi2rx1 {
+	status = "okay";
+};
+
+&dphy1 {
+	status = "okay";
+};

-- 
2.54.0

