Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FE44266AF;
	Thu, 14 May 2026 14:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778770645; cv=none; b=ui3PjZzSJ9dMOkWjgay83iWLrc2OB46PNLQWlps9j7CgQX/aERmNPoLxrNX+gAj4YsEkCjcRLQJoMZLFqrutMFnx3YYaPFHoRVjVKjZhVfO9BiBdmjN/MgSPE2E+TAaF+nqphwNgmKRKBponoLTTrK4C1X8/r0T8MoMy7NM1hL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778770645; c=relaxed/simple;
	bh=34dUVelDNyzyurWopahv0CCQSF86l/7bAQs4JUoefBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=akdDmQBgFaCzB0YFb7msnMj+kQt5HrYZREZeivagXSsPnMntBuMjbJIKLIcU+DK5QOWxGXdblDa2zAfUnlr5SPanU7QuU3ZwCRvKWIvXIhDxj5nZxWw3WVLmEGz5WcnhTiH98RQpBl9NCbnspVdd0u144NtzcXU4Dt2hJddAVAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u22oxHwk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u22oxHwk"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1da4:3c70:f102:9ea:5df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1999F56D;
	Thu, 14 May 2026 16:57:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778770633;
	bh=34dUVelDNyzyurWopahv0CCQSF86l/7bAQs4JUoefBg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u22oxHwkB5Cf8G7kueOnVnNuDIrFJwynbqY3Vlk1qsqb8pGQmVf46Q3sN4By9hS6o
	 rvIn3Q8J3KhllEy0dSJgHAgtfcfPNrNs9TqebGFgPZLFRnX0o+n0odTqnB5u+VNGUc
	 rvi35NwjSXQGCEK/Cul29oJne/bfhhlRToGTd57I=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 14 May 2026 20:26:29 +0530
Subject: [PATCH 3/4] arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for
 IMX219 on CSI0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-beagley-cameras-v1-3-5c3500b5a436@ideasonboard.com>
References: <20260514-beagley-cameras-v1-0-5c3500b5a436@ideasonboard.com>
In-Reply-To: <20260514-beagley-cameras-v1-0-5c3500b5a436@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4871;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=34dUVelDNyzyurWopahv0CCQSF86l/7bAQs4JUoefBg=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqBeK6X0Ip39c/yuPjAiVsA45QburQtmqJ+xWtO
 +5nsUFPgeeJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCagXiugAKCRBD3pH5JJpx
 RYgfD/45E46b4lXh1XIj47AlMXoTSuJfJ17SEdDnW1QxYE8B4/nMF1gAYCteekiTqANhb1J/egN
 mJPxHceQ9TRi80RsH6a7GORo9Dw2y/JjILchUEN2r5k6YdfuF3DWALaB7czlJwxvKLksmkTF9vG
 1WYT7MbYDZ8lUZfUSA9nWwfkxlep9g9rdTDPnJT+I4NWn+aicVWHZ6Fvs9/bDRMaI1gTtydcxkp
 jOPHnhDEujBSZ4sMwXlZGko1ytFVF/hgyFl6NEs3xhPBgPpa9GzXynB1YZpw3Y4gJLH5G01zMxy
 gU8L/dHHN52s71qVCxktknkGzB+co/jmR9rQXkdWz8NLPqfBUzaNijX8Pg2f5lbehpOYP9YYfsS
 m2hrT2KISlgBAuqR4aykL2b9b39fCu98JVbo1Lrx28271hFkMRdANDW+VaEE/hlOjCRtLKZc0cZ
 mDdolAnlh2giHfhYuqwGdISfc1gpCwkEd9BxB5Q3QDaWLSYf9aWwRs1dwFIo8P4ALYSA3Xai5yn
 Fm7AGT+2Nx8VzxjMcOkIQwbijl44J7tt6DWivIwpJqRwBhinXbp1T3hdxXA8xbU4MydQ9NCOBs0
 n70uwLF6nCLZB/JS/YqSpJAuQwsprCKEllq793We+wkIRvxkXFGtiniLuApbhDTUZPqhLyCD5XM
 tRpKeDQNag9I9oA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

RPi v2 Camera (IMX219) is an 8MP camera that can be used with BeagleY AI
through the 22-pin CSI-RX connectors. Add a DT overlay to enable use of
this camera sensor through the CSI0 connector.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 arch/arm64/boot/dts/ti/Makefile                    |   4 +
 .../dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso    | 121 +++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 5269c9619b65..68a82e161c20 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -152,6 +152,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
 
 # Boards with J722s SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai-csi0-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
@@ -245,6 +246,8 @@ k3-am642-tqma64xxl-mbax4xxl-sdcard-dtbs := \
 	k3-am642-tqma64xxl-mbax4xxl.dtb k3-am64-tqma64xxl-mbax4xxl-sdcard.dtbo
 k3-am642-tqma64xxl-mbax4xxl-wlan-dtbs := \
 	k3-am642-tqma64xxl-mbax4xxl.dtb k3-am64-tqma64xxl-mbax4xxl-wlan.dtbo
+k3-am67a-beagley-ai-csi0-imx219-dtbs := k3-am67a-beagley-ai.dtb \
+	k3-am67a-beagley-ai-csi0-imx219.dtbo
 k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
@@ -318,6 +321,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
+	k3-am67a-beagley-ai-csi0-imx219.dtb \
 	k3-am68-phyboard-izar-lvds-ph128800t006.dtb \
 	k3-am68-phyboard-izar-peb-av-15.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso
new file mode 100644
index 000000000000..52698d1a0f08
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * RPi Camera V2.1 on BeagleY AI CSI0 port
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
+	clk_imx219_csi0: imx219-csi0-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
+	reg_2p8v_csi0: regulator-2p8v-csi0 {
+		compatible = "regulator-fixed";
+		regulator-name = "2P8V_CSI0";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-always-on;
+	};
+
+	reg_1p8v_csi0: regulator-1p8v-csi0 {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V_CSI0";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-always-on;
+	};
+
+	reg_1p2v_csi0: regulator-1p2v-csi0 {
+		compatible = "regulator-fixed";
+		regulator-name = "1P2V_CSI0";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-always-on;
+	};
+};
+
+&mcu_pmx0 {
+	cam0_reset_pins_default: cam0-default-reset-pins {
+		pinctrl-single,pins = <
+			J722S_MCU_IOPAD(0x003c, PIN_INPUT, 7) /* (C1) MCU_MCAN1_TX.MCU_GPIO0_15 */
+		>;
+	};
+};
+
+&mcu_gpio0 {
+	status = "okay";
+};
+
+&main_i2c2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c2_pins_default>;
+	clock-frequency = <400000>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	imx219_0: sensor@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+
+		clocks = <&clk_imx219_csi0>;
+
+		VANA-supply = <&reg_2p8v_csi0>;
+		VDIG-supply = <&reg_1p8v_csi0>;
+		VDDL-supply = <&reg_1p2v_csi0>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam0_reset_pins_default>;
+
+		reset-gpios = <&mcu_gpio0 15 GPIO_ACTIVE_HIGH>;
+
+		port {
+			csi2_cam0: endpoint {
+				remote-endpoint = <&csi2rx0_in_sensor>;
+				link-frequencies = /bits/ 64 <456000000>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&cdns_csi2rx0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi0_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2rx0_in_sensor: endpoint {
+				remote-endpoint = <&csi2_cam0>;
+				bus-type = <4>; /* CSI2 DPHY. */
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
+
+&dphy0 {
+	status = "okay";
+};

-- 
2.54.0

