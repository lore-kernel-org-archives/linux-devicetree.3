Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793074957;
	b=zvjTbX+HDYPRLpRwZ9ymPDNSNYmzD98Vk0iLyeWbtoKJDMyxkJHjl82+LHQT2AXZFqd7
	 e/KuCxRNrE0H6uqn5T642kS+8bb0DrBekw4KBXhh8fYy6fX2hF7ZcHoMrjBtMamrHj2Pt
	 fPCz42QhLD5sECEyxiOynsib9qTgtkgvAjF5aNcVI3K1eALxXJeSgjBd9HJ/uMab+WDFl
	 30/SiL100Q4c+jYdbHjohi/+99SLO4sAW+VqeG0Ri1fmVyNw9dBgkR0b79Zj7STGpQtUd
	 igwrk9aSYwYi2QyCxr/Tlhfk1hWU494rz5O33XQZCaP5Arx1CfOKrOvm1a2wgJuf7cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=83nafzbkV5Ank6Et04/R6CJDCI1/AnYfnAhSh3P32qs=;
	b=2OIto17uD5yKXA7FNbuuYqUapbkNSRZWIJj9JUPsKkqna34Mz7tKBIFiG9PqtSrlwzni
	 6YlKNxd1FsKAgVj9APriRjrUOZbMrvqxDZSev7LNl3q7lkk7pq+5YZgwyWPrm1prGwotK
	 271T09mUDTjGjvtUWJNAYilmjKrLcE0xzbOSZfMzClaAFdZM1+mBhDNXvv7HyoB8GCO36
	 zU5MFw69TzLT3LpRO4uMPMtX0XDrFmLqYSKuh/2zIIJal6xpbenwrbHD10uJ0JfJbbcfc
	 qFbxuvOFzmOewPiz0dw4k3hJOdHdRoTY97xYDOc6YbG3C4vBm05KLayYE5Z0mfyufjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a+wGxFL6;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CFA60A260D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39CFA60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a+wGxFL6
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2761c69fbso2274162c88.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 21:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793074956; x=1793679756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=83nafzbkV5Ank6Et04/R6CJDCI1/AnYfnAhSh3P32qs=;
        b=a+wGxFL6vPz0tnG4aLstR1Sq26EWr6OeWwfyyR+B3s7EKRImOBqVKYneGshHE7hBdI
         WiO7OzK5q5e4hRb4/Ial5PuRZTJ02iTEAfp8oop8fbUybD+nR06tcM88nxUijMNcgNW+
         NHthwmyQAopd3MzfgS69Mr24HMK8TLvNScZ79aLjrdNVhIJzq1/zRUvZgZ1EO6ULC8fi
         D6pjKXER7cE5+FHbx34Ajlc4RU8Bd3+I8/UrG72742qxHu3vUTanKK9Z98vO0O+685ce
         tiacj5nY/KAWZFMvFY4Cc8jLvsKh/EzGsVGLzCO3c/qfstw3nGh4VoH9zt9F5+HKgNTE
         aCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793074956; x=1793679756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=83nafzbkV5Ank6Et04/R6CJDCI1/AnYfnAhSh3P32qs=;
        b=pAePnknFYzWmIi/acJlHnyh+8raLJLKltc5IRdQzdWnkBjH8M1kNPZWjIqTHo5iyt0
         yfXc99cY7Wm+q2pRIp+WvBq8JCMlrOWPKUAukC9PYvD/Nf+FhFiWBEe+mmJbUPrga241
         EXTzHjQduIjoEjivsjkADL7G7MvV5PMRohAlliPpSsXLAVY3doPrrJwXHSDOfiqz2Ule
         lfIqbOCkGxd/5N4AilJxNbUHviftYOjg2eALqD/6zBko5oixZTsFrb5OAbgzvktEHK6X
         Uad63b/Xh9fDTCIrGFJMavOH+Sf9rm04XlBhtcKH/gU0LjclEz5q3EEb5BCGjzi9o/k7
         g6GQ==
X-Gm-Message-State: AFq9FYL19KE5O+xVg0C5VaeJvFbPNyIPSgGL4I6xZ6VLvYnn1rJx/SqT
	n4p0DbWwA8rQzjYos+JgDTLjNia4dI3zQCr7Vd3akRbE0Yd/5XLQGiUf
X-Gm-Gg: AYBFou3Jdk4PRnTWCecilbvLXJ5FlfLX+9C4eI4PvxpaxgiG3pXDXO2b1AZWHhpQtgo
	nP1c6EdFN5s+XcGxId1/evJvnACH2pBt9hjmf2DBaeKn+S6oLTBDlk1ck6wpxqFu1IPP83a6QwZ
	MboWA8ylA9rhA90sDpx+S0XoA2cRlCWrUwT53J3qm9euXDaOVhnhiv4+uFB1om+rxOby6tEUTKN
	4EqjfOfvwFsMFOX7HKIzHUiJCNVdcCofu1qE23KXoHkBrFwciEpXgQY6Gr5Dh1BtLWUIR/xvGh8
	CAvyIZKI+d0qOZCtYP8jHE8Va6UIn2i9wwt4PEbO/7NRFmBN1qiekwkOLdWXcthmrFO0nXZvPE8
	HbgAvR4Yt1G8K9HKqCRZPvec1/k3P8BJHIK+r57xz/mbT5y7diy+veSJ922r9fvSlMKUQDc78xm
	qjSTy0lwRzzLi/LYDmay8LmZiDxSWCNePHP89bQRjTQ7dnG2Scl8Lym3MmS9jpyflXjPAp6wSmg
	felLBUVAshMSLvypBkZgw6Y8PRM6DuJBR46sD1z7wqqfqOsawJe1fuluDTfzeSGrlcjNWA7rNGC
	IXIN9uX6dx76kq04uLT81mKQ+4a+1IoiqUSTnVSJlGL9YNyCqjjjtJIW7iGkHxRF
X-Received: by 2002:a05:701b:458e:10b0:195:c6c2:c6b with SMTP id a92af1059eb24-19937abc802mr11936974c88.35.1793074956099;
        Mon, 26 Oct 2026 21:22:36 -0700 (PDT)
Received: from m.tailc35649.ts.net ([2401:4900:1c0f:90b7:e702:7c19:441a:f9a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm26568725c88.8.2026.10.26.21.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 21:22:35 -0700 (PDT)
From: Mrigendra Chaubey <mrigendra.chaubey@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: ti: k3-j722s-evm: Enable HDMI display
Date: Tue, 27 Oct 2026 09:52:31 +0530
Message-ID: <20261027042231.499107-1-mrigendra.chaubey@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jayesh Choudhary <j-choudhary@ti.com>

The EVM drives its HDMI port from DSS1 VP0 over DPI through a SiI9022
bridge on MAIN I2C1. The bridge reset, its interrupt and the DDC/HPD
level-shifter enable are lines of a TCA6416 expander on the same bus.

Add the expander, the bridge, the HDMI connector and the DPI pinmux,
and enable DSS1 with VP0 clocked directly from the HDMI PLL.

Keep the bridge out of reset using a GPIO hog rather than reset-gpios:
after a reset pulse the SiI9022 NAKs its first I2C transfer, so the 
sii902x probe fails with -EREMOTEIO.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Yashas D <y-d@ti.com>
[mrigendra.chaubey: squashed ti-linux-6.18.y commits 65b8b66908be and
 589e383cef77; carried over the DSS1 ports node and dss1_pins_default
 from the AM62P DSS series; dropped the unused OLDI reset hog,
 EXTPCLKIN pin and bridge audio properties; added bus-width and
 documented the reset hog. Tested on J722SXH01EVM.]
Signed-off-by: Mrigendra Chaubey <mrigendra.chaubey@gmail.com>
---
Depends on patches 4, 5 and 14 of the AM62P display series v3:
https://lore.kernel.org/all/20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com/

Also depends on patches 1-3, reposted as patches 1-3 of:
https://lore.kernel.org/all/20260903-tidss-pre-beagley-v1-0-93928baa8b12@ideasonboard.com/

Tested on J722SXH01EVM with Linux v6.18.58 and an HDMI display
connected; sii902x and tidss probed successfully. Builds and passes
dtbs_check on next-20261026 with the prerequisite patches applied.

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 172 ++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index c6486cf5a0..90c5151f52 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -220,6 +220,18 @@ transceiver2: can-phy2 {
 		standby-gpios = <&exp1 17 GPIO_ACTIVE_HIGH>;
 	};
 
+	hdmi0: connector-hdmi {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&sii9022_out>;
+			};
+		};
+	};
+
 	csi01_mux: mux-controller-0 {
 		compatible = "gpio-mux";
 		#mux-state-cells = <1>;
@@ -260,6 +272,14 @@ J722S_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (B22) I2C0_SDA */
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
 	main_i2c2_pins_default: main-i2c2-default-pins {
 		pinctrl-single,pins = <
 			J722S_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (P22) GPMC0_CSn2.I2C2_SCL */
@@ -366,6 +386,45 @@ J722S_IOPAD(0x030, PIN_INPUT, 7) /* (K23) GPIO0_12 */
 		>;
 	};
 
+	main_gpio0_ioexp_intr_pins_default: main-gpio0-ioexp-intr-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0110, PIN_INPUT, 7) /* (G27) MMC2_DAT1.GPIO0_67 */
+		>;
+	};
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
+			J722S_IOPAD(0x005c, PIN_OUTPUT, 1) /* (U27) GPMC0_AD8.VOUT0_DATA16 */
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
 };
 
 &cpsw3g {
@@ -627,6 +686,84 @@ tlv320aic3106: audio-codec@1b {
 	};
 };
 
+&main_i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c1_pins_default>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	exp2: gpio@20 {
+		compatible = "ti,tca6416";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "DSI_Mux_SEL_2", "GPIO_eDP_ENABLE",
+				  "DP0_PWR_SW_EN", "GPIO_OLDI_RSTn",
+				  "GPIO_HDMI_RSTn", "HDMI_LS_OE",
+				  "", "",
+				  "DSI_GPIO0", "DSI_GPIO1",
+				  "DSI_EDID", "IO_eDP_IRQ",
+				  "OLDI_INT#", "HDMI_INTn",
+				  "", "";
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <67 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_gpio0_ioexp_intr_pins_default>;
+		bootph-all;
+
+		p04-hog {
+			/*
+			 * P04 - GPIO_HDMI_RSTn: keep the SiI9022 out of reset. Not
+			 * reset-gpios: after a reset pulse the bridge NAKs its first
+			 * I2C transfer, which fails the sii902x probe with -EREMOTEIO.
+			 */
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "GPIO_HDMI_RSTn";
+		};
+
+		p05-hog {
+			/* P05 - HDMI_LS_OE: enable the DDC/HPD level shifter */
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "HDMI_LS_OE";
+		};
+	};
+
+	sii9022: bridge-hdmi@3b {
+		compatible = "sil,sii9022";
+		reg = <0x3b>;
+		interrupt-parent = <&exp2>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sii9022_in: endpoint {
+					bus-width = <24>;
+					remote-endpoint = <&dss1_dpi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				sii9022_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
 &main_i2c2 {
 	status = "okay";
 	pinctrl-names = "default";
@@ -844,4 +981,39 @@ &mcu_i2c0 {
 	status = "okay";
 };
 
+&dss1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dss1_pins_default>;
+
+	/*
+	 * VP0 ("vp1" clock) drives DPI, not OLDI: take its pixel clock directly
+	 * instead of through the SoC default OLDI /7 divider.
+	 */
+	clocks = <&k3_clks 232 8>,
+		 <&k3_clks 232 0>,
+		 <&k3_clks 232 4>;
+
+	assigned-clocks = <&k3_clks 241 0>,	/* DSS1-VP0 */
+			  <&k3_clks 240 0>,	/* DSS1-VP1 */
+			  <&k3_clks 245 0>;	/* DPI Output */
+	assigned-clock-parents = <&k3_clks 241 2>,	/* PLL 17 HDMI */
+				 <&k3_clks 240 1>,	/* PLL 18 DSI */
+				 <&k3_clks 245 2>;	/* DSS1-DPI0 */
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* DSS1-VP0: DPI -> SiI9022 -> HDMI */
+		port@0 {
+			reg = <0>;
+
+			dss1_dpi0_out: endpoint {
+				remote-endpoint = <&sii9022_in>;
+			};
+		};
+	};
+};
+
 #include "k3-j722s-ti-ipc-firmware.dtsi"
-- 
2.43.0

