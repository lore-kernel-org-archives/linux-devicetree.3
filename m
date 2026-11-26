Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653460;
	b=qMQjSmRSLJXvWUpw5GSHSc6ONWVXmgKxRT4WgMhI0cXgk6InBlTAv/N0lR6UaRKBjB4o
	 GaK8NB52vo1lSZoPFlATdS8L4nx8IUZwx11WrzKfQUkC4YuRIiIhn+rNhi3sWHm9eeN+Q
	 WeiC1kmSRKnBHt84W9FKVyLF9G+hKujNLjcO1cbEBf9yJwUDL3vbohpt7hTHMujzYoWg5
	 FbByalrOCbHItdZozLu3hPFyYV6Z7Ipz7NA/ZX2U6/vSayJMiaB/FAgIqcVRl7B15lGIj
	 ijDSdTMJnZlqKGOFEaNrgAfHUkngs9yOkyIMNbtY835niNdJyxN1RpUYdqWV5kCYzTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653460;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=dGOcqYzY9Rg6e3NHo6k5IHpDjIl4lxU9LwYZOM0pJ4A=;
	b=Js4cLiu8MVFvcpbRKQWNKn5K92Hc/nQEySeUWeuZWFUxEYAm+ALyecUQFFzfWcNcHwHQ
	 C6JJbl0JgT/H2DwAleoIZ+Zm0bpnGakTUSJB3dxmP01b5V7DYm0J5EInxJAloNzihPFzr
	 axG9CmRs+DVtJ6LFGASeE7EIC2D5us2CN2o4M1ri6HVTZNHzI3mCrL3ebNmybeUymKW51
	 fihk4VnAOj7DGe5s/dd2eZejfDhlkBtSNtzYNZsN+Fo1K0fbYjl3EOPM6qm1HZ4fi7a1k
	 pMJ5CCDphgMaKBT93tzZCldcZ8C72eR1WVSQ0PdgnxukXzuoxwoYx954D5TmHYyJPng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2A1wsCe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2479606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2A1wsCe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07861F000CA;
	Thu, 26 Nov 2026 00:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653459;
	bh=dGOcqYzY9Rg6e3NHo6k5IHpDjIl4lxU9LwYZOM0pJ4A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Z2A1wsCeEJQYfNN5j96/UGF+DT7ph48b/EBa/qxCQvB0fiipP2Ra20GSy5ohckXPN
	 TAFjRvyI55YE5i6vMD8rv6cVURGcyNh2/bRozr5Y/7fLlTk9E3JDmF1rdcGG6UPY+X
	 RTgFaMrUdcNXWv/P8a3XYday8n670yDbEgN8KayY/1XyrIGHPkh9UUQSlMsVSVWVKD
	 M0ucqsoY+fgXwKXeAsYigvHTMiwKPqWnSQOA5xYRsDZfj4nmVu43+2LcQkfrsIfjKk
	 miiLpHygGCIvFnJNQpH/IYseeNR+lNB/vM3z9j32rJKuOvANSztyz+JXkJjNPU4mbT
	 1qJgNOqDh5E+g==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:18 +0100
Subject: [PATCH 14/20] ARM: dts: ux500: Use valid I2C bus node names
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-14-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

I2C bus node names allow a single suffix after i2c-. Rename the GPIO
buses to i2c-gpioN and the Nomadik buses to i2c-N so i2c-controller
validation recognizes their address cells and children. Also use bus
for the Nomadik AMBA simple bus. Found with CHECK_DTBS=1.

Fixes: 451f2334f09c ("ARM: nomadik: device tree for NHK15 board")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-nomadik-nhk15.dts            |  4 ++--
 arch/arm/boot/dts/st/ste-nomadik-s8815.dts            |  6 +++---
 arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi         | 10 +++++-----
 arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts |  8 ++++----
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts     |  8 ++++----
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts     | 12 ++++++------
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts     |  8 ++++----
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts     | 16 ++++++++--------
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts       |  8 ++++----
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts     |  8 ++++----
 10 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-nomadik-nhk15.dts b/arch/arm/boot/dts/st/ste-nomadik-nhk15.dts
index cdff33063d6f..ebf761059bfe 100644
--- a/arch/arm/boot/dts/st/ste-nomadik-nhk15.dts
+++ b/arch/arm/boot/dts/st/ste-nomadik-nhk15.dts
@@ -89,7 +89,7 @@ ethernet@300 {
 		};
 	};
 
-	i2c0 {
+	i2c-0 {
 		lis3lv02dl@1d {
 			/* Accelerometer */
 			compatible = "st,lis3lv02dl-accel";
@@ -173,7 +173,7 @@ mmcsd-hog {
 		};
 	};
 
-	amba {
+	bus {
 		clcd@10120000 {
 			status = "okay";
 			pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/ste-nomadik-s8815.dts b/arch/arm/boot/dts/st/ste-nomadik-s8815.dts
index 7c7a53604204..487b6daf07be 100644
--- a/arch/arm/boot/dts/st/ste-nomadik-s8815.dts
+++ b/arch/arm/boot/dts/st/ste-nomadik-s8815.dts
@@ -106,7 +106,7 @@ ethernet@300 {
 		};
 	};
 
-	i2c1 {
+	i2c-1 {
 		lis3lv02dl@1d {
 			/* Accelerometer */
 			compatible = "st,lis3lv02dl-accel";
@@ -115,7 +115,7 @@ lis3lv02dl@1d {
 	};
 
 	/* GPIO I2C connected to the USB portions of the STw4811 only */
-	gpio-i2c {
+	i2c-bitbang {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio2 10 0>;
 		scl-gpios = <&gpio2 9 0>;
@@ -131,7 +131,7 @@ stw4811@2d {
 	};
 
 
-	amba {
+	bus {
 		/* Activate RXTX on UART 0 */
 		uart0: serial@101fd000 {
 			pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi b/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
index b90c15352c13..f635af262d96 100644
--- a/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
+++ b/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
@@ -139,7 +139,7 @@ mmcsd_default_cfg1 {
 				};
 			};
 		};
-		i2c0 {
+		i2c-0 {
 			i2c0_default_mux: i2c0_mux {
 				i2c0_default_mux {
 					function = "i2c0";
@@ -153,7 +153,7 @@ i2c0_default_cfg {
 				};
 			};
 		};
-		i2c1 {
+		i2c-1 {
 			i2c1_default_mux: i2c1_mux {
 				i2c1_default_mux {
 					function = "i2c1";
@@ -689,7 +689,7 @@ partition@1b80000 {
 	};
 
 	/* I2C0 connected to the STw4811 power management chip */
-	i2c0 {
+	i2c-0 {
 		compatible = "st,nomadik-i2c", "arm,primecell";
 		reg = <0x101f8000 0x1000>;
 		interrupt-parent = <&vica>;
@@ -715,7 +715,7 @@ vmmc_regulator: vmmc {
 	};
 
 	/* I2C1 connected to various sensors */
-	i2c1 {
+	i2c-1 {
 		compatible = "st,nomadik-i2c", "arm,primecell";
 		reg = <0x101f7000 0x1000>;
 		interrupt-parent = <&vica>;
@@ -738,7 +738,7 @@ stw5095@1a {
 		};
 	};
 
-	amba {
+	bus {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
index 2d71366c479b..a24b113a98c2 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
@@ -215,7 +215,7 @@ led {
 	};
 
 	/* Bit-banged I2C on GPIO143 and GPIO144 also called "SUBPMU I2C" */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -228,7 +228,7 @@ i2c-gpio-0 {
 	};
 
 	/* Bit-banged I2C on GPIO151 and GPIO152 also called "COMP I2C" */
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 24 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 23 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -689,7 +689,7 @@ codina_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for subpmu */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		i2c_gpio_0_default: i2c_gpio_0 {
 			codina_cfg1 {
 				pins = "GPIO143_D12", "GPIO144_B13";
@@ -698,7 +698,7 @@ codina_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for the NFC */
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		i2c_gpio_1_default: i2c_gpio_1 {
 			codina_cfg1 {
 				pins = "GPIO151_D17", "GPIO152_D16";
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
index c81531adcd63..1ec9558ad6fe 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
@@ -285,7 +285,7 @@ led {
 	};
 
 	/* Bit-banged I2C on GPIO143 and GPIO144 also called "SUBPMU I2C" */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -305,7 +305,7 @@ magnetometer@c {
 	};
 
 	/* Bit-banged I2C on GPIO151 and GPIO152 also called "NFC I2C" */
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 24 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 23 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -834,7 +834,7 @@ codina_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for subpmu */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		i2c_gpio_0_default: i2c_gpio_0 {
 			codina_cfg1 {
 				pins = "GPIO143_D12", "GPIO144_B13";
@@ -843,7 +843,7 @@ codina_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for the NFC */
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		i2c_gpio_1_default: i2c_gpio_1 {
 			codina_cfg1 {
 				pins = "GPIO151_D17", "GPIO152_D16";
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
index 323887f8a858..4ee2d02bbaed 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
@@ -249,7 +249,7 @@ ktd259: backlight {
 	};
 
 	/* Bit-banged I2C on GPIO143 and GPIO144 also called "SUBPMU I2C" */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -321,7 +321,7 @@ panel_in: endpoint {
 	};
 
 	/* Bit-banged I2C on GPIO201 and GPIO202 also called "MOT_I2C" */
-	i2c-gpio-2 {
+	i2c-gpio2 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio6 10 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio6 9 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -364,7 +364,7 @@ ldo {
 	};
 
 	/* Bit-banged I2C on GPIO196 and GPIO197 also called "MPR_I2C" */
-	i2c-gpio-3 {
+	i2c-gpio3 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio6 5 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio6 4 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -830,7 +830,7 @@ gavini_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for magnetometer and NCP6914 */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		i2c_gpio_0_default: i2c_gpio_0 {
 			gavini_cfg1 {
 				pins = "GPIO143_D12", "GPIO144_B13";
@@ -839,7 +839,7 @@ gavini_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for the Immersion ISA1200 */
-	i2c-gpio-2 {
+	i2c-gpio2 {
 		i2c_gpio_2_default: i2c_gpio_2 {
 			gavini_cfg1 {
 				pins = "GPIO201_AF24", "GPIO202_AF25";
@@ -848,7 +848,7 @@ gavini_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for the TI DPP2601 */
-	i2c-gpio-3 {
+	i2c-gpio3 {
 		i2c_gpio_3_default: i2c_gpio_3 {
 			gavini_cfg1 {
 				pins = "GPIO196_AG26", "GPIO197_AH24";
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
index 52a54732719e..0d5106144061 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
@@ -56,7 +56,7 @@ bat_therm: thermistor {
 		#thermal-sensor-cells = <0>;
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio2 14 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio2 13 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -82,7 +82,7 @@ touchkey@20 {
 		};
 	};
 
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 24 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 23 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -554,7 +554,7 @@ golden_cfg1 {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		i2c_gpio_0_default: i2c_gpio_0 {
 			golden_cfg1 {
 				pins = "GPIO77",	/* TOUCHKEY_SCL */
@@ -573,7 +573,7 @@ golden_cfg1 {
 		};
 	};
 
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		i2c_gpio_1_default: i2c_gpio_1 {
 			golden_cfg1 {
 				pins = "GPIO151",	/* COMP_SCL */
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
index f0ccf370710f..50634fcbd9d6 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
@@ -240,7 +240,7 @@ led {
 	};
 
 	/* Bit-banged I2C on GPIO143 and GPIO144 also called "SUBPMU I2C" */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -324,7 +324,7 @@ gp2a_shunt: current-sense-shunt {
 	};
 
 	/* Bit-banged I2C on GPIO196 and GPIO197 also called "TOUCHKEY_I2C" */
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio6 5 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio6 4 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -352,7 +352,7 @@ touchkey@20 {
 	};
 
 	/* Bit-banged I2C on GPIO201 and GPIO202 also called "MOT_I2C" */
-	i2c-gpio-2 {
+	i2c-gpio2 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio6 10 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio6 9 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -395,7 +395,7 @@ ldo {
 	};
 
 	/* Bit-banged I2C on GPIO151 and GPIO152 also called "NFC_I2C" */
-	i2c-gpio-3 {
+	i2c-gpio3 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 24 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 23 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -905,7 +905,7 @@ janice_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for magnetometer and NCP6914 */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		i2c_gpio_0_default: i2c_gpio_0 {
 			janice_cfg1 {
 				pins = "GPIO143_D12", "GPIO144_B13";
@@ -914,7 +914,7 @@ janice_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for the Cypress touchkeys */
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		i2c_gpio_1_default: i2c_gpio_1 {
 			janice_cfg1 {
 				pins = "GPIO196_AG26", "GPIO197_AH24";
@@ -923,7 +923,7 @@ janice_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for the Immersion ISA1200 */
-	i2c-gpio-2 {
+	i2c-gpio2 {
 		i2c_gpio_2_default: i2c_gpio_2 {
 			janice_cfg1 {
 				pins = "GPIO201_AF24", "GPIO202_AF25";
@@ -932,7 +932,7 @@ janice_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for the NFC */
-	i2c-gpio-3 {
+	i2c-gpio3 {
 		i2c_gpio_3_default: i2c_gpio_3 {
 			janice_cfg1 {
 				pins = "GPIO151_D17", "GPIO152_D16";
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
index 0d2d5bcc32d2..791910749c98 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
@@ -196,7 +196,7 @@ led {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -207,7 +207,7 @@ i2c-gpio-0 {
 		/* TODO: this should be used by the NCP6914 Camera power management unit */
 	};
 
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 24 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 23 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -627,7 +627,7 @@ kyle_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for NCP6914 */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		i2c_gpio_0_default: i2c_gpio_0 {
 			kyle_cfg1 {
 				pins = "GPIO143_D12", "GPIO144_B13";
@@ -636,7 +636,7 @@ kyle_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for ALPS HSCD compass */
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		i2c_gpio_1_default: i2c_gpio_1 {
 			kyle_cfg1 {
 				pins = "GPIO151_B17", "GPIO152_D16";
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
index 335539be55fd..b89a4922a073 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
@@ -175,7 +175,7 @@ led {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -186,7 +186,7 @@ i2c-gpio-0 {
 		/* TODO: this should be used by the NCP6914 Camera power management unit */
 	};
 
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 24 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 23 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -614,7 +614,7 @@ skomer_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for NCP6914 */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		i2c_gpio_0_default: i2c_gpio_0 {
 			skomer_cfg1 {
 				pins = "GPIO143_D12", "GPIO144_B13";
@@ -623,7 +623,7 @@ skomer_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for ALPS HSCD compass */
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		i2c_gpio_1_default: i2c_gpio_1 {
 			skomer_cfg1 {
 				pins = "GPIO151_B17", "GPIO152_D16";

-- 
2.56.1

