Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22E03D1715
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721532; cv=none; b=NvFD0wehlJ+qC1Eq4Z4E+2XnSOdKcS6YJjMMHrQia6Y05s9MVWISNJUlcvhTz0HSgaRgk011+yyNybniS/1n6v+I6/sX1EmLpTjAKOjD5G2V0OxrfwRm8h3cudSNev/hfpRJjJ2iWLsSckgbn6OFGpx/B9Y6HRaQm/QzGCFQErU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721532; c=relaxed/simple;
	bh=p8WO4o/I480NES+b3qaNouXk4eoGUbReu9hZJqx0uvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sN879Rwwy1deJieHchnHmNP8gThAUjozJTTLJJInZAO2Tt0re9Q91u5a+8bNOKCQYzYn6r5D6ehXx/B6x89PH9s9t/4UPmg975BmlK5KAu+YLPwehx6x34rWmiAzT0e4+UoZP0Y+lPfNYQ3Li4USAQHCVDLOHwz2BS1MP01kGDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BqjcZL4P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BqjcZL4P"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AEA0C2BCF4;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783721532;
	bh=p8WO4o/I480NES+b3qaNouXk4eoGUbReu9hZJqx0uvE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BqjcZL4Pny7CHMtlEBxXtBkq+ZhOd7YGmSjPe9/JATBW1P6MP4l2PB1i6fOgFCu0A
	 P6478dMdxX8TeqHO5zNjQtiKF9oIq4tdDNeRsdNoKHzshX+DJTFcQNGaUMGVY0PklP
	 BAXWFuRSnPG86uHPG0Hm8Fa2Y//cLNMA4Jf+kmCjOBe0UF9nl/59KgUThCDju/A4u9
	 akK79klWCuFAGIqN+tyKsOtkTe1rF85IDsz1k7h0XQpGtUKIDxHIYAs5IZFDnz8aoV
	 suqAjNWVAJQDI5vUT6zPQp4xjxMGn1QW81oCy+ouwDR0oAh8dtat/ymsT0w8dW4k4z
	 2GldbSuWCEBFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDC9C44501;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sat, 11 Jul 2026 00:11:52 +0200
Subject: [PATCH v2 03/12] arm64: dts: rockchip: move NanoPi R6 code into
 common dtsi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-nanopi-m6-v2-3-422675a65402@gmail.com>
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
In-Reply-To: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721530; l=6924;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=l+IoGL0+AR8uHVcN+bVq+UedJE3QXtq5gzvflNswvyo=;
 b=otyvpGReSdJaqxJ7SY0Tq/+rUJIHKP8tAQExm37YA2dqkndZh5+4MldsyZRfWX4WDstongo0o
 DRI5Uv+xTRWDFuyXjLg0Ue74qJSBFgxZhsBAjQ2vdow4GVmlKtERSnm
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Move NanoPi R6C and R6S specific DT into its own file.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 96 ++++++++++++++++++++++
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts |  1 +
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts |  1 +
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi   | 89 --------------------
 4 files changed, 98 insertions(+), 89 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
new file mode 100644
index 000000000000..2f8c580afc2b
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/ {
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&key1_pin>;
+
+		button-user {
+			label = "User";
+			linux,code = <BTN_1>;
+			gpios = <&gpio1 RK_PC0 GPIO_ACTIVE_LOW>;
+			debounce-interval = <50>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		sys_led: led-0 {
+			label = "sys_led";
+			gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			pinctrl-names = "default";
+			pinctrl-0 = <&sys_led_pin>;
+		};
+
+		wan_led: led-1 {
+			label = "wan_led";
+			gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&wan_led_pin>;
+		};
+
+		lan1_led: led-2 {
+			label = "lan1_led";
+			gpios = <&gpio1 RK_PC3 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&lan1_led_pin>;
+		};
+
+		lan2_led: led-3 {
+			gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&lan2_led_pin>;
+		};
+	};
+
+	vcc5v0_usb_otg0: regulator-vcc5v0-usb-otg0 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio1 RK_PD2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&typec5v_pwren>;
+		regulator-name = "vcc5v0_usb_otg0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_usb>;
+	};
+};
+
+&pinctrl {
+	gpio-key {
+		key1_pin: key1-pin {
+			rockchip,pins = <1 RK_PC0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	gpio-leds {
+		sys_led_pin: sys-led-pin {
+			rockchip,pins =
+				<1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		wan_led_pin: wan-led-pin {
+			rockchip,pins =
+				<1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		lan1_led_pin: lan1-led-pin {
+			rockchip,pins =
+				<1 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		lan2_led_pin: lan2-led-pin {
+			rockchip,pins =
+				<1 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	usb {
+		typec5v_pwren: typec5v-pwren {
+			rockchip,pins = <1 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts
index 77fef2662ca5..90922c55da37 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include "rk3588s-nanopi.dtsi"
+#include "rk3588s-nanopi-r6.dtsi"
 
 / {
 	model = "FriendlyElec NanoPi R6C";
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts
index f8993418a122..8b318561342c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include "rk3588s-nanopi.dtsi"
+#include "rk3588s-nanopi-r6.dtsi"
 
 / {
 	model = "FriendlyElec NanoPi R6S";
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 91b6eefd7abf..d41c49716fa2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -33,19 +33,6 @@ button-maskrom {
 		};
 	};
 
-	gpio-keys {
-		compatible = "gpio-keys";
-		pinctrl-names = "default";
-		pinctrl-0 = <&key1_pin>;
-
-		button-user {
-			label = "User";
-			linux,code = <BTN_1>;
-			gpios = <&gpio1 RK_PC0 GPIO_ACTIVE_LOW>;
-			debounce-interval = <50>;
-		};
-	};
-
 	hdmi-con {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -57,38 +44,6 @@ hdmi_con_in: endpoint {
 		};
 	};
 
-	leds {
-		compatible = "gpio-leds";
-
-		sys_led: led-0 {
-			label = "sys_led";
-			gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "heartbeat";
-			pinctrl-names = "default";
-			pinctrl-0 = <&sys_led_pin>;
-		};
-
-		wan_led: led-1 {
-			label = "wan_led";
-			gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&wan_led_pin>;
-		};
-
-		lan1_led: led-2 {
-			label = "lan1_led";
-			gpios = <&gpio1 RK_PC3 GPIO_ACTIVE_HIGH>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&lan1_led_pin>;
-		};
-
-		lan2_led: led-3 {
-			gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&lan2_led_pin>;
-		};
-	};
-
 	vcc5v0_sys: regulator-vcc5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc5v0_sys";
@@ -151,18 +106,6 @@ vcc5v0_usb: regulator-vcc5v0-usb {
 		vin-supply = <&vcc5v0_sys>;
 	};
 
-	vcc5v0_usb_otg0: regulator-vcc5v0-usb-otg0 {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpios = <&gpio1 RK_PD2 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&typec5v_pwren>;
-		regulator-name = "vcc5v0_usb_otg0";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc5v0_usb>;
-	};
-
 	vcc5v0_host_20: regulator-vcc5v0-host-20 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -380,34 +323,6 @@ &pd_npu {
 };
 
 &pinctrl {
-	gpio-key {
-		key1_pin: key1-pin {
-			rockchip,pins = <1 RK_PC0 RK_FUNC_GPIO &pcfg_pull_up>;
-		};
-	};
-
-	gpio-leds {
-		sys_led_pin: sys-led-pin {
-			rockchip,pins =
-				<1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-
-		wan_led_pin: wan-led-pin {
-			rockchip,pins =
-				<1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-
-		lan1_led_pin: lan1-led-pin {
-			rockchip,pins =
-				<1 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-
-		lan2_led_pin: lan2-led-pin {
-			rockchip,pins =
-				<1 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
 	hdmi {
 		hdmi0_tx_on_h: hdmi0-tx-on-h {
 			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -427,10 +342,6 @@ sd_s0_pwr: sd-s0-pwr {
 	};
 
 	usb {
-		typec5v_pwren: typec5v-pwren {
-			rockchip,pins = <1 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-
 		vcc5v0_host20_en: vcc5v0-host20-en {
 			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};

-- 
2.55.0


