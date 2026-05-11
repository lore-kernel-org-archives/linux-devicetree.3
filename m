Received: from mail-vs1-f98.google.com (mail-vs1-f98.google.com [209.85.217.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEC136CDFC
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778468044; cv=none; b=NfVxx0sawLwSRhNawI4BztGIsGF6TWakdOVAl8NPBuIMuvnjvEwfx+4Vgndw8OcKwETKMS7RNNwCxigyGGmXibqU0jrqjsiymgdYirzHxmbAGwAcx5NPIi1ap4GpA1nBFPs4Cy7hS4PVxanDfYjz1Lq4RzpPhTNV/ur2nL3ak+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778468044; c=relaxed/simple;
	bh=gUwIpP/8goiE4qj+03iE2vGgNqExBMyN3J3ucTn8yKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rhnVWzfolEscBRFaHknR+DcGOe6YyMwCH422E02uqi7RzdnGMoZmGk5sA3oFHwyRJQxjbkU937pZ+GlLmLJycIStBAMGGSbgxlIsoSKM9bQeSelynrftsWcdlf9T/0eX5MTCgtj+HYjlMb2bIyWiouo0Wlt2Im7jZ3hnTtovP4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=QYVRHN4h; arc=none smtp.client-ip=209.85.217.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="QYVRHN4h"
Received: by mail-vs1-f98.google.com with SMTP id ada2fe7eead31-6314cc192a4so578809137.0
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 19:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1778468040; x=1779072840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+3SVstQBn6rFj5dNvRMm82iLexq6e+N+mFrTPcOjTQ=;
        b=QYVRHN4h9aaxrKT0JGkrE0+prQp+xW65DDQRdgwmNpXTFGMPpFYB1My25ohIrSGgph
         B3daMonMP42DAu8H6YSBJEimACpcH2M99mwNu12nPz+rgEiyx032tm4rZFnoNtwTco58
         +1uZDnes/CXgn8dgW4u2AGd+LpgfgUHO4tAsjqpw126e+xOqD5LX+2+IVlmz53VVjsJC
         565iga+cnsbeSuqJZT9P8YkaCUTh98rUbARf46w4Mb79rp2NYzg16RgQ66oESQPhMkxL
         6KUb5w4GXyK6vIUhQ9ct4ZMvThVMPiCj2Yjd6/CXHa9Kv9cuHmlvwJRKHHncjHhXxLef
         ROlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778468040; x=1779072840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w+3SVstQBn6rFj5dNvRMm82iLexq6e+N+mFrTPcOjTQ=;
        b=M713cGrYb7QnVlUH8RkL/HTwl1O6hczmv8v0qLmwNdrapIilF0btFAkWV7iSNoLPOW
         wjOdccXj7gQoPUzwrJJXzh00vgmIIaEG5sJYs8+M7O1J92H0Z2idkB4AomBSLcWVInQB
         qhUeg/SLtjlLiZQteqpizcVre0jcH5tllfAY2ZrWAC9O3J4y4ede9scpJArBYAAWBK+6
         Mg0vUxyDfY4VNhprUp3hqjDDx+ooXWVfD9gDNovSMRF0K4q1GrHY3m26NwSxZaITXZuf
         skCLLmInSjre1H+qRgnDJiOLkEXDPVVW7EIEgoJF8nsampmyUkPP7RAHK6G9NpMdsCbb
         92eg==
X-Forwarded-Encrypted: i=1; AFNElJ9bQTwaifW9tPJP2ZxWK0wqYlMLGTCHTC9FM5yvtC2022U/zlKzT5FbBc86WRKxcVDimwrl9ZozVXaC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuuq30imVmOCDgXZ0h2Wert2LYPPKu/MQ3rvPGBVT6L1miUWDe
	vofUyYsqtS/6C/w1s/e5z87J1nQmFoUC03WwPwvEO/0poFOm8JhoLjmqqrsHi4twZ1qrVbOwjpF
	FJBtcYrJqrCM809ADg1CZFvlk/srmHpmc0Z1F
X-Gm-Gg: Acq92OGVH6BUimf4nCv8e7X+/jicqAbV0A0dICPjD30zQHC4hajGjAR/KqIS4MFdapd
	fxjuLt6czF1DiPKb1ZI8YdYudRNu9xlCynHc5dpE0XmvDZA0f/pu/WGCju2zFKNoQLzFI39G5VL
	tsEeQTXXq2mJtJ63xaxu53YQLQlBzQ9b/LY5H3N/PWVYrdLVV31yAJR5F+e6zNKesKBXKxrL9Wo
	zV7huZuM01V3IZrCGzWDS9GmdQAXX+yHkw7nN/kkSIz20fljDhSDqkx8eHZW2xwkbp36sBj8BcV
	L9M3+4HcfCyk9eGvN1HFii4gRkK597AwSx0KJGJ/2EMoZVu+MEKF1N9rlFrCMd7PNIVLuKRJsCB
	/fgMLw29qUijVMDhQXzY+8G4f9sU/y3s6Wf+ZJJyZ0EPx
X-Received: by 2002:a05:6102:290c:b0:633:7f34:260e with SMTP id ada2fe7eead31-6337f342be0mr1082138137.20.1778468039809;
        Sun, 10 May 2026 19:53:59 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-6313ff6c191sm698744137.1.2026.05.10.19.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 19:53:59 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Alexey Charkov <alchark@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH v10 3/4] arm64: dts: rockchip: refactor items from Orange Pi 5/b to prep for Pro
Date: Sun, 10 May 2026 21:53:49 -0500
Message-ID: <20260511025352.106126-4-dennis@ausil.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511025352.106126-1-dennis@ausil.us>
References: <20260511025352.106126-1-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Orange Pi 5 Pro uses the same SoC and base as the Orange Pi 5 and
Orange Pi 5B but has had sound, USB, and leds wired up differently. The
5 and 5B boards use gmac for ethernet where the Pro has a PCIe attached
NIC.

Move the 5/5B-specific bits (analog-sound/es8388, FUSB302 Type-C,
gmac1, pwm-leds, i2s1_8ch routing, USB role-switch plumbing) out of
rk3588s-orangepi-5.dtsi into a new rk3588s-orangepi-5-5b.dtsi that is
included by both 5 and 5B.

The RK806 PLDO1 and PLDO2 outputs are wired differently between the
5/5B and the Pro (PLDO1/PLDO2 are swapped), so label the PMIC node
rk806 in the base dtsi, drop pldo-reg1/pldo-reg2 from it, and define
them via a &rk806 regulators augmentation in rk3588s-orangepi-5-5b.dtsi.
The Pro will supply its own mapping.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
Reviewed-by: Alexey Charkov <alchark@gmail.com>
---
 .../dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 256 ++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |   6 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 253 +----------------
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts |   2 +-
 4 files changed, 272 insertions(+), 245 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
new file mode 100644
index 000000000000..b42d2f5d9e3e
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device tree definitions shared by the Orange Pi 5 and Orange Pi 5B
+ * but not the Orange Pi 5 Pro.
+ */
+
+#include <dt-bindings/usb/pd.h>
+#include "rk3588s-orangepi-5.dtsi"
+
+/ {
+	aliases {
+		ethernet0 = &gmac1;
+	};
+
+	analog-sound {
+		compatible = "simple-audio-card";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hp_detect>;
+		simple-audio-card,name = "rockchip,es8388";
+		simple-audio-card,bitclock-master = <&masterdai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&masterdai>;
+		simple-audio-card,hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,routing =
+			"Headphones", "LOUT1",
+			"Headphones", "ROUT1",
+			"LINPUT1", "Microphone Jack",
+			"RINPUT1", "Microphone Jack",
+			"LINPUT2", "Onboard Microphone",
+			"RINPUT2", "Onboard Microphone";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Microphone", "Onboard Microphone",
+			"Headphone", "Headphones";
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s1_8ch>;
+		};
+
+		masterdai: simple-audio-card,codec {
+			sound-dai = <&es8388>;
+			system-clock-frequency = <12288000>;
+		};
+	};
+
+	pwm-leds {
+		compatible = "pwm-leds";
+
+		led {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			linux,default-trigger = "heartbeat";
+			max-brightness = <255>;
+			pwms = <&pwm0 0 25000 0>;
+		};
+	};
+
+	vbus_typec: regulator-vbus-typec {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio3 RK_PC0 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&typec5v_pwren>;
+		regulator-name = "vbus_typec";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+};
+
+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy1>;
+	phy-mode = "rgmii-rxid";
+	pinctrl-0 = <&gmac1_miim
+			&gmac1_tx_bus2
+			&gmac1_rx_bus2
+			&gmac1_rgmii_clk
+			&gmac1_rgmii_bus>;
+	pinctrl-names = "default";
+	tx_delay = <0x42>;
+	status = "okay";
+};
+
+&i2c6 {
+	es8388: audio-codec@10 {
+		compatible = "everest,es8388", "everest,es8328";
+		reg = <0x10>;
+		clocks = <&cru I2S1_8CH_MCLKOUT>;
+		AVDD-supply = <&vcca_3v3_s0>;
+		DVDD-supply = <&vcca_1v8_s0>;
+		HPVDD-supply = <&vcca_3v3_s0>;
+		PVDD-supply = <&vcca_3v3_s0>;
+		assigned-clocks = <&cru I2S1_8CH_MCLKOUT>;
+		assigned-clock-rates = <12288000>;
+		#sound-dai-cells = <0>;
+	};
+
+	usbc0: usb-typec@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
+		vbus-supply = <&vbus_typec>;
+		status = "okay";
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			op-sink-microwatt = <1000000>;
+			power-role = "dual";
+			sink-pdos =
+				<PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM)>;
+			source-pdos =
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			try-power-role = "source";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					usbc0_hs: endpoint {
+						remote-endpoint = <&usb_host0_xhci_drd_sw>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					usbc0_ss: endpoint {
+						remote-endpoint = <&usbdp_phy0_typec_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					usbc0_sbu: endpoint {
+						remote-endpoint = <&usbdp_phy0_typec_sbu>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&mdio1 {
+	rgmii_phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x1>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PB2 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&pinctrl {
+	usb-typec {
+		usbc0_int: usbc0-int {
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		typec5v_pwren: typec5v-pwren {
+			rockchip,pins = <3 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&i2s1_8ch {
+	rockchip,i2s-tx-route = <3 2 1 0>;
+	rockchip,i2s-rx-route = <1 3 2 0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2s1m0_sclk
+			   &i2s1m0_mclk
+			   &i2s1m0_lrck
+			   &i2s1m0_sdi1
+			   &i2s1m0_sdo3>;
+	status = "okay";
+};
+
+&pwm0 {
+	pinctrl-0 = <&pwm0m2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&rk806 {
+	regulators {
+		vcc_1v8_s0: pldo-reg1 {
+			regulator-name = "vcc_1v8_s0";
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+
+			regulator-state-mem {
+				regulator-off-in-suspend;
+			};
+		};
+
+		vcca_1v8_s0: pldo-reg2 {
+			regulator-name = "vcca_1v8_s0";
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+
+			regulator-state-mem {
+				regulator-off-in-suspend;
+				regulator-suspend-microvolt = <1800000>;
+			};
+		};
+	};
+};
+
+
+&usb_host0_xhci {
+	dr_mode = "otg";
+	usb-role-switch;
+
+	port {
+		usb_host0_xhci_drd_sw: endpoint {
+			remote-endpoint = <&usbc0_hs>;
+		};
+	};
+};
+
+&usb_host2_xhci {
+	status = "okay";
+};
+
+&usbdp_phy0 {
+	mode-switch;
+	orientation-switch;
+	sbu1-dc-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
+	sbu2-dc-gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usbdp_phy0_typec_ss: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&usbc0_ss>;
+		};
+
+		usbdp_phy0_typec_sbu: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&usbc0_sbu>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
index 83b9b6645a1e..d76bdf1b5e90 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
@@ -2,12 +2,16 @@
 
 /dts-v1/;
 
-#include "rk3588s-orangepi-5.dtsi"
+#include "rk3588s-orangepi-5-5b.dtsi"
 
 / {
 	model = "Xunlong Orange Pi 5";
 	compatible = "xunlong,orangepi-5", "rockchip,rk3588s";
 
+	aliases {
+		mmc0 = &sdmmc;
+	};
+
 	vcc3v3_pcie20: regulator-vcc3v3-pcie20 {
 		compatible = "regulator-fixed";
 		enable-active-high;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index fd5c6a025cd1..9bdecd5a07e5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -3,19 +3,13 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/leds/common.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
-#include <dt-bindings/usb/pd.h>
 #include "rk3588s.dtsi"
 
 / {
-	aliases {
-		ethernet0 = &gmac1;
-		mmc0 = &sdmmc;
-	};
-
 	chosen {
 		stdout-path = "serial2:1500000n8";
 	};
@@ -34,38 +28,6 @@ button-recovery {
 		};
 	};
 
-	analog-sound {
-		compatible = "simple-audio-card";
-		pinctrl-names = "default";
-		pinctrl-0 = <&hp_detect>;
-		simple-audio-card,name = "rockchip,es8388";
-		simple-audio-card,bitclock-master = <&masterdai>;
-		simple-audio-card,format = "i2s";
-		simple-audio-card,frame-master = <&masterdai>;
-		simple-audio-card,hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
-		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,routing =
-			"Headphones", "LOUT1",
-			"Headphones", "ROUT1",
-			"LINPUT1", "Microphone Jack",
-			"RINPUT1", "Microphone Jack",
-			"LINPUT2", "Onboard Microphone",
-			"RINPUT2", "Onboard Microphone";
-		simple-audio-card,widgets =
-			"Microphone", "Microphone Jack",
-			"Microphone", "Onboard Microphone",
-			"Headphone", "Headphones";
-
-		simple-audio-card,cpu {
-			sound-dai = <&i2s1_8ch>;
-		};
-
-		masterdai: simple-audio-card,codec {
-			sound-dai = <&es8388>;
-			system-clock-frequency = <12288000>;
-		};
-	};
-
 	hdmi0-con {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -77,28 +39,14 @@ hdmi0_con_in: endpoint {
 		};
 	};
 
-	pwm-leds {
-		compatible = "pwm-leds";
-
-		led {
-			color = <LED_COLOR_ID_GREEN>;
-			function = LED_FUNCTION_STATUS;
-			linux,default-trigger = "heartbeat";
-			max-brightness = <255>;
-			pwms = <&pwm0 0 25000 0>;
-		};
-	};
-
-	vbus_typec: regulator-vbus-typec {
+	vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
 		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio3 RK_PC0 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&typec5v_pwren>;
-		regulator-name = "vbus_typec";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc5v0_sys>;
+		gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_LOW>;
+		regulator-name = "vcc_3v3_sd_s0";
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3_s3>;
 	};
 
 	vcc5v0_sys: regulator-vcc5v0-sys {
@@ -109,16 +57,6 @@ vcc5v0_sys: regulator-vcc5v0-sys {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
-
-	vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
-		compatible = "regulator-fixed";
-		gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_LOW>;
-		regulator-name = "vcc_3v3_sd_s0";
-		regulator-boot-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vcc_3v3_s3>;
-	};
 };
 
 &combphy0_ps {
@@ -161,20 +99,6 @@ &cpu_l3 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
 };
 
-&gmac1 {
-	clock_in_out = "output";
-	phy-handle = <&rgmii_phy1>;
-	phy-mode = "rgmii-rxid";
-	pinctrl-0 = <&gmac1_miim
-		     &gmac1_tx_bus2
-		     &gmac1_rx_bus2
-		     &gmac1_rgmii_clk
-		     &gmac1_rgmii_bus>;
-	pinctrl-names = "default";
-	tx_delay = <0x42>;
-	status = "okay";
-};
-
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
 	status = "okay";
@@ -270,69 +194,6 @@ &i2c6 {
 	pinctrl-0 = <&i2c6m3_xfer>;
 	status = "okay";
 
-	es8388: audio-codec@10 {
-		compatible = "everest,es8388", "everest,es8328";
-		reg = <0x10>;
-		clocks = <&cru I2S1_8CH_MCLKOUT>;
-		AVDD-supply = <&vcca_3v3_s0>;
-		DVDD-supply = <&vcca_1v8_s0>;
-		HPVDD-supply = <&vcca_3v3_s0>;
-		PVDD-supply = <&vcca_3v3_s0>;
-		assigned-clocks = <&cru I2S1_8CH_MCLKOUT>;
-		assigned-clock-rates = <12288000>;
-		#sound-dai-cells = <0>;
-	};
-
-	usbc0: usb-typec@22 {
-		compatible = "fcs,fusb302";
-		reg = <0x22>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&usbc0_int>;
-		vbus-supply = <&vbus_typec>;
-		status = "okay";
-
-		usb_con: connector {
-			compatible = "usb-c-connector";
-			label = "USB-C";
-			data-role = "dual";
-			op-sink-microwatt = <1000000>;
-			power-role = "dual";
-			sink-pdos =
-				<PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM)>;
-			source-pdos =
-				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			try-power-role = "source";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					usbc0_hs: endpoint {
-						remote-endpoint = <&usb_host0_xhci_drd_sw>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-					usbc0_ss: endpoint {
-						remote-endpoint = <&usbdp_phy0_typec_ss>;
-					};
-				};
-
-				port@2 {
-					reg = <2>;
-					usbc0_sbu: endpoint {
-						remote-endpoint = <&usbdp_phy0_typec_sbu>;
-					};
-				};
-			};
-		};
-	};
-
 	hym8563: rtc@51 {
 		compatible = "haoyu,hym8563";
 		reg = <0x51>;
@@ -346,32 +207,10 @@ hym8563: rtc@51 {
 	};
 };
 
-&i2s1_8ch {
-	rockchip,i2s-tx-route = <3 2 1 0>;
-	rockchip,i2s-rx-route = <1 3 2 0>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2s1m0_sclk
-	             &i2s1m0_mclk
-	             &i2s1m0_lrck
-	             &i2s1m0_sdi1
-	             &i2s1m0_sdo3>;
-	status = "okay";
-};
-
 &i2s5_8ch {
 	status = "okay";
 };
 
-&mdio1 {
-	rgmii_phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-ieee802.3-c22";
-		reg = <0x1>;
-		reset-assert-us = <20000>;
-		reset-deassert-us = <100000>;
-		reset-gpios = <&gpio3 RK_PB2 GPIO_ACTIVE_LOW>;
-	};
-};
-
 &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
@@ -392,22 +231,6 @@ hp_detect: hp-detect {
 			rockchip,pins = <1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
-
-	usb-typec {
-		usbc0_int: usbc0-int {
-			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
-		};
-
-		typec5v_pwren: typec5v-pwren {
-			rockchip,pins = <3 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-};
-
-&pwm0 {
-	pinctrl-0 = <&pwm0m2_pins>;
-	pinctrl-names = "default";
-	status = "okay";
 };
 
 &rknn_core_0 {
@@ -491,7 +314,7 @@ &spi2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi2m2_cs0 &spi2m2_pins>;
 
-	pmic@0 {
+	rk806: pmic@0 {
 		compatible = "rockchip,rk806";
 		reg = <0x0>;
 		interrupt-parent = <&gpio0>;
@@ -666,31 +489,6 @@ regulator-state-mem {
 				};
 			};
 
-			vcc_1v8_s0: pldo-reg1 {
-				regulator-name = "vcc_1v8_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			vcca_1v8_s0: pldo-reg2 {
-				regulator-name = "vcca_1v8_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-					regulator-suspend-microvolt = <1800000>;
-				};
-			};
-
 			vdda_1v2_s0: pldo-reg3 {
 				regulator-name = "vdda_1v2_s0";
 				regulator-always-on;
@@ -841,26 +639,7 @@ &uart2 {
 };
 
 &usbdp_phy0 {
-	mode-switch;
-	orientation-switch;
-	sbu1-dc-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
-	sbu2-dc-gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
 	status = "okay";
-
-	port {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		usbdp_phy0_typec_ss: endpoint@0 {
-			reg = <0>;
-			remote-endpoint = <&usbc0_ss>;
-		};
-
-		usbdp_phy0_typec_sbu: endpoint@1 {
-			reg = <1>;
-			remote-endpoint = <&usbc0_sbu>;
-		};
-	};
 };
 
 &usb_host0_ehci {
@@ -872,15 +651,7 @@ &usb_host0_ohci {
 };
 
 &usb_host0_xhci {
-	dr_mode = "otg";
-	usb-role-switch;
 	status = "okay";
-
-	port {
-		usb_host0_xhci_drd_sw: endpoint {
-			remote-endpoint = <&usbc0_hs>;
-		};
-	};
 };
 
 &usb_host1_ehci {
@@ -891,7 +662,7 @@ &usb_host1_ohci {
 	status = "okay";
 };
 
-&usb_host2_xhci {
+&vop {
 	status = "okay";
 };
 
@@ -899,10 +670,6 @@ &vop_mmu {
 	status = "okay";
 };
 
-&vop {
-	status = "okay";
-};
-
 &vp0 {
 	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
index d21ec320d295..8af174777809 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
@@ -2,7 +2,7 @@
 
 /dts-v1/;
 
-#include "rk3588s-orangepi-5.dtsi"
+#include "rk3588s-orangepi-5-5b.dtsi"
 
 / {
 	model = "Xunlong Orange Pi 5B";
-- 
2.54.0

