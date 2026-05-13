Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29748327BF8;
	Wed, 13 May 2026 13:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778678303; cv=none; b=fSQzjw9yzIdFfMFBJ5IEaIg876V/iE7/rA6OA5iwR7B6hkclqEFYZFjXrVZWaK1+bcvBlee69AQ2jof5f8ups7nPI+lLWSHpE1k6sdicv/ydChqPoYGEwrTlTWg87hBZa8Q5eXNxTuANywhmT1NE8MDSgO9VGRBpSJMp4qtgo38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778678303; c=relaxed/simple;
	bh=tggQw14cE36Ooi+jxk1SSHsmS/Luwps1jDkCJEkdV+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ILJx3zM6T2MXShdu53GSH0lH9pDCRsuSgdwizHTY6uO7eUb3Hqz0KIu8c/KPOV2Zg+87kNBNYin8SHhHVf3BYUmsRaZBSCkLdXNTs9uzbQsGUxOU6lQ6fcVrHvbCD+MBwv6/OAH4DAj/5ZbV2S3UiXdae1juMvL1kY1cOzVHVH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vd3VCKUq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vd3VCKUq"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9849D298C;
	Wed, 13 May 2026 15:18:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778678285;
	bh=tggQw14cE36Ooi+jxk1SSHsmS/Luwps1jDkCJEkdV+g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Vd3VCKUqgzho9o4w+4pCkdzVgAMUSiSd/Xur6455mZVpQ78ZWEXFpaf6T6VRFStiy
	 G8TtXYipl8W1ZATX5HXnAdpjaRpH+U172tcgKoB2iBfKK8WAz4hQ/dCZXUXg6M5AKO
	 Mf0OBBLVXX005QJoltqoNyKEit7dbxghMg2XMUZc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 13 May 2026 16:17:38 +0300
Subject: [PATCH v2 16/16] arm64: dts: ti: beagley-ai: Enable HDMI display
 and audio
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-beagley-ai-display-v2-16-9e9bcefde6bc@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Andrew Davis <afd@ti.com>, 
 Robert Nelson <robertcnelson@gmail.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7725;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=odPI4cnCuMihRKu6ZVnIBnX5RP8SNojspw7tkGWhGP4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBHoCk8FvrF4ayLVKu1VvZUvvHbvt/OynZpGJ6
 vQIP4HHgfuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagR6AgAKCRD6PaqMvJYe
 9a+lD/47xOw9Vfioc6vPk7mSSQ2sC0nOZ63bPivyczNmPOkgSwYgjZWBbAq8EoAd0qAhtk3uRY/
 8dwUDW5Pw+j46xUJl2+fMsq7tWIWQE36L8hd4K6Te98muNr2xjL1pxzjLxFNNZh84W72LclyJo8
 RJmvgwR4ahDePRAQTBScCjz9JXLj2K87gr4VQ3HlHbdKOmKak5DhEFjZxw0VG54OWwrhLzHd0F7
 5fhrFwJC85ck0qVcCogDe7vStwNktGp574SZv28LoJ3X7CGG37klnwuFLum0g/nipTeQCd4rAqu
 Nyl39fceH1wozRdcFQOjHIRxzt/Fvx/71zNWmtQBw+isqev93OPkEkyVvBXN5d+zKG5v6RYTIf3
 TnjHnCZKYzs2RnM2YL2IBs5BNwN8fgq8DL7A8/byPp86OEbbVGUfZzXtTnYBRlRK/0qygHH4JCi
 vpRiEhfarEocMkvMFZWBZmsB8aWdXO3XIPcZpbV9F0JgBk3fmlDMnagibpoqf7t+B3e5Pu+Ft2s
 UPmsWG6akcXLNZ+dKtxEBDCUDJdop8FNZi5NNHX9Fbj1b/hBQ+BeQXVa0AUDuUNmP0UDF8CzqC7
 xL3pMEt1biRvGB4islyhQUmG83VSVmyQhVXwqbMrXy5U/P4Bb0I+e1/jUfBSBJ+b9wJu6HiKWMP
 lK6KepDQr5Vp+SA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Andrew Davis <afd@ti.com>

Enable HDMI support for BeagleY-AI platform. The display controller used is
TIDSS and the HDMI bridge used is IT66122.

Based on DT by: Robert Nelson <robertcnelson@gmail.com>

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
[tomi.valkeinen: cosmetic fixes]
Tested-by: Robert Nelson <robertcnelson@gmail.com>
Tested-by: Swamil Jain <s-jain1@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 197 +++++++++++++++++++++++++
 1 file changed, 197 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index 5255e04b9ac7..b7bcc90005d7 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -146,6 +146,34 @@ led-1 {
 			default-state = "on";
 		};
 	};
+
+	hdmi0: connector-hdmi {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "d";
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&it66122_out>;
+			};
+		};
+	};
+
+	sound0: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "it66122 HDMI";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&hdmi_dailink_master>;
+		simple-audio-card,frame-master = <&hdmi_dailink_master>;
+
+		hdmi_dailink_master: simple-audio-card,cpu {
+			sound-dai = <&mcasp1>;
+			system-clock-direction-out;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&it66122>;
+		};
+	};
 };
 
 &main_pmx0 {
@@ -185,6 +213,20 @@ J722S_IOPAD(0x0240, PIN_INPUT, 7) /* (B24) MMC1_SDCD.GPIO1_48 */
 		bootph-all;
 	};
 
+	main_i2c1_pins_default: main-i2c1-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x01e8, PIN_INPUT_PULLUP, 0) /* (C24) I2C1_SCL */
+			J722S_IOPAD(0x01ec, PIN_INPUT_PULLUP, 0) /* (A22) I2C1_SDA */
+		>;
+		bootph-all;
+	};
+
+	main_gpio0_ioexp_intr_pins_default: main-gpio0-ioexp-intr-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0110, PIN_INPUT, 7) /* (G27) MMC2_DAT1.GPIO0_67 */
+		>;
+	};
+
 	mdio_pins_default: mdio-default-pins {
 		pinctrl-single,pins = <
 			J722S_IOPAD(0x0160, PIN_OUTPUT, 0) /* (AC24) MDIO0_MDC */
@@ -227,6 +269,47 @@ vdd_3v3_sd_pins_default: vdd-3v3-sd-default-pins {
 			J722S_IOPAD(0x0254, PIN_OUTPUT, 7) /* (E25) USB0_DRVVBUS.GPIO1_50 */
 		>;
 	};
+
+	dss1_pins_default: dss1-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0100, PIN_OUTPUT, 0) /* (AB23) VOUT0_VSYNC */
+			J722S_IOPAD(0x00f8, PIN_OUTPUT, 0) /* (AB24) VOUT0_HSYNC */
+			J722S_IOPAD(0x0104, PIN_OUTPUT, 0) /* (AC26) VOUT0_PCLK */
+			J722S_IOPAD(0x00fc, PIN_OUTPUT, 0) /* (AC27) VOUT0_DE */
+			J722S_IOPAD(0x00b8, PIN_OUTPUT, 0) /* (W27) VOUT0_DATA0 */
+			J722S_IOPAD(0x00bc, PIN_OUTPUT, 0) /* (W25) VOUT0_DATA1 */
+			J722S_IOPAD(0x00c0, PIN_OUTPUT, 0) /* (W24) VOUT0_DATA2 */
+			J722S_IOPAD(0x00c4, PIN_OUTPUT, 0) /* (W23) VOUT0_DATA3 */
+			J722S_IOPAD(0x00c8, PIN_OUTPUT, 0) /* (W22) VOUT0_DATA4 */
+			J722S_IOPAD(0x00cc, PIN_OUTPUT, 0) /* (W21) VOUT0_DATA5 */
+			J722S_IOPAD(0x00d0, PIN_OUTPUT, 0) /* (Y26) VOUT0_DATA6 */
+			J722S_IOPAD(0x00d4, PIN_OUTPUT, 0) /* (Y27) VOUT0_DATA7 */
+			J722S_IOPAD(0x00d8, PIN_OUTPUT, 0) /* (AA24) VOUT0_DATA8 */
+			J722S_IOPAD(0x00dc, PIN_OUTPUT, 0) /* (AA27) VOUT0_DATA9 */
+			J722S_IOPAD(0x00e0, PIN_OUTPUT, 0) /* (AA25) VOUT0_DATA10 */
+			J722S_IOPAD(0x00e4, PIN_OUTPUT, 0) /* (AB25) VOUT0_DATA11 */
+			J722S_IOPAD(0x00e8, PIN_OUTPUT, 0) /* (AA23) VOUT0_DATA12 */
+			J722S_IOPAD(0x00ec, PIN_OUTPUT, 0) /* (AA22) VOUT0_DATA13 */
+			J722S_IOPAD(0x00f0, PIN_OUTPUT, 0) /* (AB26) VOUT0_DATA14 */
+			J722S_IOPAD(0x00f4, PIN_OUTPUT, 0) /* (AB27) VOUT0_DATA15 */
+			J722S_IOPAD(0x005c, PIN_OUTPUT, 1) /* (AC25) GPMC0_AD8.VOUT0_DATA16 */
+			J722S_IOPAD(0x0060, PIN_OUTPUT, 1) /* (U26) GPMC0_AD9.VOUT0_DATA17 */
+			J722S_IOPAD(0x0064, PIN_OUTPUT, 1) /* (V27) GPMC0_AD10.VOUT0_DATA18 */
+			J722S_IOPAD(0x0068, PIN_OUTPUT, 1) /* (V25) GPMC0_AD11.VOUT0_DATA19 */
+			J722S_IOPAD(0x006c, PIN_OUTPUT, 1) /* (V26) GPMC0_AD12.VOUT0_DATA20 */
+			J722S_IOPAD(0x0070, PIN_OUTPUT, 1) /* (V24) GPMC0_AD13.VOUT0_DATA21 */
+			J722S_IOPAD(0x0074, PIN_OUTPUT, 1) /* (V22) GPMC0_AD14.VOUT0_DATA22 */
+			J722S_IOPAD(0x0078, PIN_OUTPUT, 1) /* (V23) GPMC0_AD15.VOUT0_DATA23 */
+		>;
+	};
+
+	main_mcasp1_pins_default: main-mcasp1-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0090, PIN_INPUT, 2) /* (P27) GPMC0_BE0n_CLE.MCASP1_ACLKX */
+			J722S_IOPAD(0x0098, PIN_INPUT, 2) /* (V21) GPMC0_WAIT0.MCASP1_AFSX */
+			J722S_IOPAD(0x008c, PIN_INPUT, 2) /* (N23) GPMC0_WEn.MCASP1_AXR0 */
+		>;
+	};
 };
 
 &cpsw3g {
@@ -284,6 +367,13 @@ J722S_MCU_IOPAD(0x050, PIN_INPUT_PULLUP, 0)	/* (C6) WKUP_I2C1_SDA */
 		>;
 		bootph-all;
 	};
+
+	hdmi_gpio_pins_default: hdmi-gpio-default-pins {
+		pinctrl-single,pins = <
+			J722S_MCU_IOPAD(0x0038, PIN_INPUT_PULLUP | PIN_DEBOUNCE_CONF6, 7) /* (D8) MCU_MCAN0_RX.MCU_GPIO0_14 HDMI_INTn */
+			J722S_MCU_IOPAD(0x0034, PIN_OUTPUT_PULLUP, 7) /* (B2) MCU_MCAN0_TX.MCU_GPIO0_13 HDMI_RSTn */
+		>;
+	};
 };
 
 &wkup_uart0 {
@@ -385,6 +475,63 @@ rtc: rtc@68 {
 	};
 };
 
+&main_i2c1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c1_pins_default>;
+	clock-frequency = <400000>;
+	bootph-all;
+
+	it66122: bridge-hdmi@4c {
+		compatible = "ite,it66122";
+		reg = <0x4c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmi_gpio_pins_default>;
+		vcn33-supply = <&vdd_3v3>;
+		vcn18-supply = <&buck2_reg>;
+		vrf12-supply = <&ldo2_reg>;
+		reset-gpios = <&mcu_gpio0 13 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&mcu_gpio0>;
+		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
+		#sound-dai-cells = <0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/*
+			 * HDMI can be serviced with 3 potential VPs -
+			 * (DSS0 VP1 / DSS1 VP0 / DSS1 VP1).
+			 * For now, we will service it with DSS1 VP1.
+			 */
+			port@0 {
+				reg = <0>;
+
+				it66122_in: endpoint {
+					bus-width = <24>;
+					remote-endpoint = <&dss1_dpi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				it66122_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&main_gpio0 {
+	status = "okay";
+};
+
+&mcu_gpio0 {
+	status = "okay";
+};
+
 &sdhci1 {
 	/* SD/MMC */
 	vmmc-supply = <&vdd_mmc1>;
@@ -399,4 +546,54 @@ &sdhci1 {
 	status = "okay";
 };
 
+&dss1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&dss1_pins_default>;
+
+	clocks = <&k3_clks 232 8>,
+		 <&k3_clks 232 0>,
+		 <&k3_clks 232 4>;
+
+	assigned-clocks = <&k3_clks 241 0>, /* DSS1-VP0 */
+			  <&k3_clks 240 0>, /* DSS1-VP1 */
+			  <&k3_clks 245 0>; /* DPI Output */
+
+	assigned-clock-parents = <&k3_clks 241 2>, /* PLL 17 HDMI */
+				 <&k3_clks 240 1>, /* PLL 18 DSI */
+				 <&k3_clks 245 2>; /* DSS1-DPI0 */
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* DSS1-VP1: DPI/HDMI Output */
+		port@0 {
+			reg = <0>;
+
+			dss1_dpi0_out: endpoint {
+				remote-endpoint = <&it66122_in>;
+			};
+		};
+	};
+};
+
+&mcasp1 {
+	status = "okay";
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mcasp1_pins_default>;
+	auxclk-fs-ratio = <2177>;
+	op-mode = <0>; /* MCASP_IIS_MODE */
+	tdm-slots = <2>;
+	serial-dir = <  /* 0: INACTIVE, 1: TX, 2: RX */
+		1 0 0 0
+		0 0 0 0
+		0 0 0 0
+		0 0 0 0
+	>;
+	tx-num-evt = <32>;
+	rx-num-evt = <32>;
+};
+
 #include "k3-j722s-ti-ipc-firmware.dtsi"

-- 
2.43.0

