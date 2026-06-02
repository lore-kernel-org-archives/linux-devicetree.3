Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3473DE430;
	Tue,  2 Jun 2026 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405284; cv=none; b=CoIv00Dx4gX9H9S7kB5BB5wNUHz6gNK+i+Gi2hoC87BC8mfi/h+wXCYAcKz35feUOyYi+T6zjM7UUuV4ivYUiqTV/wbznLhrvP0xhGf0vexd2M0ptpsN9WT9YvFhrVBbTyCdgQa/tPx99fB6lNVad62CsJnM16Bg8CZwO60cFC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405284; c=relaxed/simple;
	bh=GT4w4gtqjY0VcKrqe3C/0fAMkIWcAPHxwpTVBPjzcFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZjZGgEcQK0ODB/r69ibSNWxgHeOB9iBnf6OmFiwmhCnlRXSXzGCieSkfpCdmtji808XsnCctYP3j0cN4GH+4yU0lPwzLUIddpOWqFeca61fLjIA+jyT/hjKLmtCRFqtYijSOCE5kg/8HwHh0IxXC4ScQz+tawTEKYbOzNc16FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BZ1bk+L5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BZ1bk+L5"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF5E1103F;
	Tue,  2 Jun 2026 15:00:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780405258;
	bh=GT4w4gtqjY0VcKrqe3C/0fAMkIWcAPHxwpTVBPjzcFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BZ1bk+L5g++f6XN/GdgcDpbdkMt3+UDubkBAyMBUhopJIC6wB+YDXk4GNod6PHxOx
	 B+SPQqiWRWFVbXLx3rj8YUf4B+ZpZ5oee0PdDgtC1Bp1unLFgWd1MppUl4/eVhncC8
	 2kahMMTkpPnlX3iWezrCWXt7SeNmaQ207wG7Ej8g=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 02 Jun 2026 18:29:30 +0530
Subject: [PATCH v3 4/4] arm64: dts: ti: k3-am67a-beagley-ai: Add overlay
 for IMX219 on CSI1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-beagley-cameras-v3-4-fe6ae35b7eda@ideasonboard.com>
References: <20260602-beagley-cameras-v3-0-fe6ae35b7eda@ideasonboard.com>
In-Reply-To: <20260602-beagley-cameras-v3-0-fe6ae35b7eda@ideasonboard.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5227;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=GT4w4gtqjY0VcKrqe3C/0fAMkIWcAPHxwpTVBPjzcFk=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqHtQF+YigSfKXhmo/zTgVNURHOJLZRcBFCEobz
 iUQLVMzBqCJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCah7UBQAKCRBD3pH5JJpx
 RVfUD/0QcIz4oS625+mHXIKUYRDlZBuUfPmyKToyu/5xjsI5v5+hnL0XzxeEjaqc5oQSxZ3DwSk
 QC6894WggPjApQH8sInFdtpaBnKEVoR7c5ZbrJ9WLhxV+z1pu4QhRIflk1qlfI0ueTy7nw54T8Y
 lqlnSS1pF8OWUtPVUbIrlF+2rYO/IWzqQk7c+5FaCXNyimpngFW1zUWZpQ5iCzTBqWCJFoU/jgL
 Ycmsz1bg2/M9fWIRfReZcBawF1s/KRELHPMB/zRSSuV/28scptanXoSI+qF+At9yWnSIgFvsNsn
 peQeOivC8QC1+L5CYuVd3IikIqZg8+Dw3NGbiAUrkWfMnljOW0Zw4niUR9r0aCZdje1S2TPM66s
 P5t8cWKF8eoYakgc0vOOnFAkG6k/Vomzo7Ub8ldefChXqOl4fMsiuACP8ileuaIDVt4zMPVU92M
 5ioZqL/QSa5ljUSk/ZnySVqir3/1peFJ22CvIcy8EO/cO5f/Oc5ZYEjav7iP+ZsdoR0FqzjxBtF
 6jQQ45L4lSNMC+1TGyCl9ZrBG6GU00DxTzv7wGuTRhuFXetZ+x3L6ARQyjYIfZfjUSaNZqYbr4F
 a13fl4cDpepEQPYw4+VOEQA+UxF4n57PKGMz9YX11ZSaj46W6OmZ7deGMTE06swWUvDHZSVik9U
 j7cbhA9F+/MN9pQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

RPi v2 Camera (IMX219) is an 8MP camera that can be used with BeagleY AI
through the 22-pin CSI-RX connectors. Add a DT overlay to enable use of
this camera sensor through the CSI1 connector.

The CSI1 connector is muxed with DSI0, so ensure that we route it to
CSI1 (DSI_CSI_OE=0 and DSI_CSI_SEL=1).

Link: https://pip.raspberrypi.com/categories/1205-drawings-and-schematics
Link: https://docs.beagle.cc/boards/beagley/ai/03-design.html#id60
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Now that I2C node is defined by the board DTS, only set status = okay
  here
- Add schematic links for the v2 camera module and BeagleY CSI connector
---
 arch/arm64/boot/dts/ti/Makefile                    |   4 +
 .../dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso    | 118 +++++++++++++++++++++
 2 files changed, 122 insertions(+)

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
index 000000000000..cf3729f5ae60
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso
@@ -0,0 +1,118 @@
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
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
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

