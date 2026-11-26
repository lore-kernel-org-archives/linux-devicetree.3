Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653467;
	b=MKguYyhsuq1ULlHlUjtbMpfv3FtBncO/COBPHA8YAeoFWMb8aW5unOMsy8jAq/LplnTl
	 r/MWUT/4IwYmlT3VFa4QOfqX9nI6Rm6ILh2cSeiSRN2we6twPT0NbpzFnyspxDh7VqnPD
	 QN5uiT5zIxypIGmTLKMKUFcMwro/BWVsQF328NykXyJdKohGwONDwCdhOtPlbWGtC2fH2
	 8KCzmzvq0MXtHjuX8Y3GzhA50xE8ARO5tM+D85H+RLbA6XhCWpEFIYs3IU3zh34qzMU1B
	 uh8Lh2fCWjvlj2VG/VyMVOOcDT1MLeKzrFYnyDWal5jdV1HYKwJ9xPe3Ls6wduSG6CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653467;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=r7N7SqIA/4p1jKPsm/nuV3waM4cS4hmF8iD3OEjT/vw=;
	b=uCCsZrwJkkgHQkv9OJWoADv3HtfcKoPztqgjradGkh9zJdsLHmAVZrcF4rBGUyF7vUrq
	 tmA1IKvr3davO8kit8T+wno3dS7JwA/j8gfNJ43UCaeXVCMTc7N6yT2PhlBFM5cC0oFcl
	 rxKJYBDoD0XLDbm6KaF2eWC2js7+okSSQFxGdy3UQN8xJW1RfyLNe7AK7ck58Qz9GYqMi
	 XwFJi/MZJPeD+LMKV9l0OQtbdi2e89+k4j1pzdMPWwRdfWVilUDWc6viMh9t1PYj6SEoK
	 8HdNASZ246Ckn8lmTCdc/ANKYlNHarxQGhHdko9EIB2gBywIseEEwvZNyUkU8xAEtfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bo8s0QQd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD897606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bo8s0QQd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EED1F000C0;
	Thu, 26 Nov 2026 00:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653467;
	bh=r7N7SqIA/4p1jKPsm/nuV3waM4cS4hmF8iD3OEjT/vw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bo8s0QQdJ1mmqFL8g/QqfKkgA13uM0gObf4lQhO7OXgTEQBQ4kRwWCGr7nLafhbEm
	 rhLvos4vkPFuSgI1m3hoxS40Vnl5/XjDU2fidgOtvYLkR+e/H28bSHjXv3FhkIsvtd
	 UeArsz8IyIvLIGQxGGjs5mR+oeswoZGCaa5MnkLQBUzTpi+xYq/Rp4+NN17w1T/ggY
	 LNeD6xuJuoCws40cn5N7R6YmqTflDcLG0+kfw9FlaR742cfaKSv7lOXTehYDKZbPIA
	 DhzVFYVKWvbQ/7FN19Cl3yPqkQz7OO4Zkab4E8Mhc3s9Oqcuq0sVdaDkrC7zD11rLF
	 z0onO7R0xK6Yw==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:22 +0100
Subject: [PATCH 18/20] ARM: dts: ux500: Move the pin controller out of the
 simple bus
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
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-18-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The pin controller has no MMIO resource of its own: it references the
GPIO banks and PRCMU. Move it to the root and move the board extensions
with it, since simple-bus children must have an address. Label-based
references continue to refer to the same pin configurations. Found with
CHECK_DTBS=1.

Fixes: ee04139d916a ("pinctrl/ARM: move GPIO and pinctrl deps to device tree")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi              |  15 +-
 arch/arm/boot/dts/st/ste-href-family-pinctrl.dtsi | 369 +++++++++++-----------
 arch/arm/boot/dts/st/ste-href-stuib.dtsi          | 138 ++++----
 arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi  | 127 ++++----
 arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi  | 103 +++---
 arch/arm/boot/dts/st/ste-href.dtsi                |  15 +-
 arch/arm/boot/dts/st/ste-hrefprev60.dtsi          | 107 +++----
 arch/arm/boot/dts/st/ste-hrefv60plus.dtsi         | 359 ++++++++++-----------
 arch/arm/boot/dts/st/ste-snowball.dts             | 305 +++++++++---------
 9 files changed, 772 insertions(+), 766 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index 920d07fbf00e..05d91367a38a 100644
--- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
@@ -107,6 +107,14 @@ map0 {
 		};
 	};
 
+	pinctrl: pinctrl {
+		compatible = "stericsson,db8500-pinctrl";
+		nomadik-gpio-chips = <&gpio0>, <&gpio1>, <&gpio2>, <&gpio3>,
+					<&gpio4>, <&gpio5>, <&gpio6>, <&gpio7>,
+					<&gpio8>;
+		prcm = <&prcmu>;
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -591,13 +599,6 @@ gpio8: gpio@a03fe000 {
 			power-domains = <&pm_domains DOMAIN_VAPE>;
 		};
 
-		pinctrl: pinctrl {
-			compatible = "stericsson,db8500-pinctrl";
-			nomadik-gpio-chips = <&gpio0>, <&gpio1>, <&gpio2>, <&gpio3>,
-						<&gpio4>, <&gpio5>, <&gpio6>, <&gpio7>,
-						<&gpio8>;
-			prcm = <&prcmu>;
-		};
 
 		usb_per5@a03e0000 {
 			compatible = "stericsson,db8500-musb";
diff --git a/arch/arm/boot/dts/st/ste-href-family-pinctrl.dtsi b/arch/arm/boot/dts/st/ste-href-family-pinctrl.dtsi
index 434fa6baf71f..8a0ba98d0484 100644
--- a/arch/arm/boot/dts/st/ste-href-family-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-family-pinctrl.dtsi
@@ -6,207 +6,206 @@
 #include "ste-dbx5x0-pinctrl.dtsi"
 
 / {
-	soc {
-		pinctrl {
-			/* Settings for all SPI default and sleep states */
-			spi2 {
-				spi2_default_mode: spi_default {
-					default_mux {
-						function = "spi2";
-						groups = "spi2_oc1_2";
-					};
-					default_cfg1 {
-						pins = "GPIO216_AG12"; /* FRM */
-						ste,config = <&gpio_out_hi>;
-					};
-					default_cfg2 {
-						pins = "GPIO218_AH11"; /* RXD */
-						ste,config = <&in_pd>;
-					};
-					default_cfg3 {
-						pins =
-						"GPIO215_AH13", /* TXD */
-						"GPIO217_AH12"; /* CLK */
-						ste,config = <&out_lo>;
-					};
+	pinctrl {
+		/* Settings for all SPI default and sleep states */
+		spi2 {
+			spi2_default_mode: spi_default {
+				default_mux {
+					function = "spi2";
+					groups = "spi2_oc1_2";
 				};
+				default_cfg1 {
+					pins = "GPIO216_AG12"; /* FRM */
+					ste,config = <&gpio_out_hi>;
+				};
+				default_cfg2 {
+					pins = "GPIO218_AH11"; /* RXD */
+					ste,config = <&in_pd>;
+				};
+				default_cfg3 {
+					pins =
+					"GPIO215_AH13", /* TXD */
+					"GPIO217_AH12"; /* CLK */
+					ste,config = <&out_lo>;
+				};
+			};
 
-				spi2_idle_mode: spi_idle {
-					/*
-					 * The idle mode is basically sleep mode sans wakeups. Also
-					 * note that we have muxes the pins off the function here
-					 * as we do not state any muxing.
-					 */
-					idle_cfg1 {
-						pins = "GPIO218_AH11"; /* RXD */
-						ste,config = <&slpm_in_pdis>;
-					};
-					idle_cfg2 {
-						pins = "GPIO215_AH13"; /* TXD */
-						ste,config = <&slpm_out_lo_pdis>;
-					};
-					idle_cfg3 {
-						pins = "GPIO217_AH12"; /* CLK */
-						ste,config = <&slpm_pdis>;
-					};
+			spi2_idle_mode: spi_idle {
+				/*
+				 * The idle mode is basically sleep mode sans wakeups. Also
+				 * note that we have muxes the pins off the function here
+				 * as we do not state any muxing.
+				 */
+				idle_cfg1 {
+					pins = "GPIO218_AH11"; /* RXD */
+					ste,config = <&slpm_in_pdis>;
+				};
+				idle_cfg2 {
+					pins = "GPIO215_AH13"; /* TXD */
+					ste,config = <&slpm_out_lo_pdis>;
+				};
+				idle_cfg3 {
+					pins = "GPIO217_AH12"; /* CLK */
+					ste,config = <&slpm_pdis>;
 				};
+			};
 
-				spi2_sleep_mode: spi_sleep {
-					sleep_cfg1 {
-						pins =
-						"GPIO216_AG12", /* FRM */
-						"GPIO218_AH11"; /* RXD */
-						ste,config = <&slpm_in_wkup_pdis>;
-					};
-					sleep_cfg2 {
-						pins = "GPIO215_AH13"; /* TXD */
-						ste,config = <&slpm_out_lo_wkup_pdis>;
-					};
-					sleep_cfg3 {
-						pins = "GPIO217_AH12"; /* CLK */
-						ste,config = <&slpm_wkup_pdis>;
-					};
+			spi2_sleep_mode: spi_sleep {
+				sleep_cfg1 {
+					pins =
+					"GPIO216_AG12", /* FRM */
+					"GPIO218_AH11"; /* RXD */
+					ste,config = <&slpm_in_wkup_pdis>;
+				};
+				sleep_cfg2 {
+					pins = "GPIO215_AH13"; /* TXD */
+					ste,config = <&slpm_out_lo_wkup_pdis>;
+				};
+				sleep_cfg3 {
+					pins = "GPIO217_AH12"; /* CLK */
+					ste,config = <&slpm_wkup_pdis>;
 				};
 			};
+		};
 
-			mcde {
-				lcd_default_mode: lcd_default {
-					default_mux1 {
-						/* Mux in VSI0 and all the data lines */
-						function = "lcd";
-						groups =
-						"lcdvsi0_a_1", /* VSI0 for LCD */
-						"lcd_d0_d7_a_1", /* Data lines */
-						"lcdvsi1_a_1"; /* VSI1 for HDMI */
-					};
-					default_mux2 {
-						function = "lcda";
-						groups =
-						"lcdaclk_b_1"; /* Clock line for TV-out */
-					};
-					default_cfg1 {
-						pins =
-						"GPIO68_E1", /* VSI0 */
-						"GPIO69_E2"; /* VSI1 */
-						ste,config = <&in_pu>;
-					};
-				};
-				lcd_sleep_mode: lcd_sleep {
-					sleep_cfg1 {
-						pins = "GPIO69_E2"; /* VSI1 */
-						ste,config = <&slpm_in_wkup_pdis>;
-					};
+		mcde {
+			lcd_default_mode: lcd_default {
+				default_mux1 {
+					/* Mux in VSI0 and all the data lines */
+					function = "lcd";
+					groups =
+					"lcdvsi0_a_1", /* VSI0 for LCD */
+					"lcd_d0_d7_a_1", /* Data lines */
+					"lcdvsi1_a_1"; /* VSI1 for HDMI */
+				};
+				default_mux2 {
+					function = "lcda";
+					groups =
+					"lcdaclk_b_1"; /* Clock line for TV-out */
+				};
+				default_cfg1 {
+					pins =
+					"GPIO68_E1", /* VSI0 */
+					"GPIO69_E2"; /* VSI1 */
+					ste,config = <&in_pu>;
+				};
+			};
+			lcd_sleep_mode: lcd_sleep {
+				sleep_cfg1 {
+					pins = "GPIO69_E2"; /* VSI1 */
+					ste,config = <&slpm_in_wkup_pdis>;
 				};
 			};
+		};
 
-			ske {
-				/* SKE keys on position 2 in an 8x8 matrix */
-				ske_kpa2_default_mode: ske_kpa2_default {
-					default_mux {
-						function = "kp";
-						groups = "kp_a_2";
-					};
-					default_cfg1 {
-						pins =
-						"GPIO153_B17", /* I7 */
-						"GPIO154_C16", /* I6 */
-						"GPIO155_C19", /* I5 */
-						"GPIO156_C17", /* I4 */
-						"GPIO161_D21", /* I3 */
-						"GPIO162_D20", /* I2 */
-						"GPIO163_C20", /* I1 */
-						"GPIO164_B21"; /* I0 */
-						ste,config = <&in_pd>;
-					};
-					default_cfg2 {
-						pins =
-						"GPIO157_A18", /* O7 */
-						"GPIO158_C18", /* O6 */
-						"GPIO159_B19", /* O5 */
-						"GPIO160_B20", /* O4 */
-						"GPIO165_C21", /* O3 */
-						"GPIO166_A22", /* O2 */
-						"GPIO167_B24", /* O1 */
-						"GPIO168_C22"; /* O0 */
-						ste,config = <&out_lo>;
-					};
-				};
-				ske_kpa2_sleep_mode: ske_kpa2_sleep {
-					sleep_cfg1 {
-						pins =
-						"GPIO153_B17", /* I7 */
-						"GPIO154_C16", /* I6 */
-						"GPIO155_C19", /* I5 */
-						"GPIO156_C17", /* I4 */
-						"GPIO161_D21", /* I3 */
-						"GPIO162_D20", /* I2 */
-						"GPIO163_C20", /* I1 */
-						"GPIO164_B21"; /* I0 */
-						ste,config = <&slpm_in_pu_wkup_pdis_en>;
-					};
-					sleep_cfg2 {
-						pins =
-						"GPIO157_A18", /* O7 */
-						"GPIO158_C18", /* O6 */
-						"GPIO159_B19", /* O5 */
-						"GPIO160_B20", /* O4 */
-						"GPIO165_C21", /* O3 */
-						"GPIO166_A22", /* O2 */
-						"GPIO167_B24", /* O1 */
-						"GPIO168_C22"; /* O0 */
-						ste,config = <&slpm_out_lo_pdis>;
-					};
+		ske {
+			/* SKE keys on position 2 in an 8x8 matrix */
+			ske_kpa2_default_mode: ske_kpa2_default {
+				default_mux {
+					function = "kp";
+					groups = "kp_a_2";
 				};
-				/*
-				 * SKE keys on position 1 and "other C1" combi giving
-				 * six rows of six keys.
-				 */
-				ske_kpaoc1_default_mode: ske_kpaoc1_default {
-					default_mux {
-						function = "kp";
-						groups = "kp_a_1", "kp_oc1_1";
-					};
-					default_cfg1 {
-						pins =
-						"GPIO91_B6", /* KP_O0 */
-						"GPIO90_A3", /* KP_O1 */
-						"GPIO87_B3", /* KP_O2 */
-						"GPIO86_C6", /* KP_O3 */
-						"GPIO96_D8", /* KP_O6 */
-						"GPIO94_D7"; /* KP_O7 */
-						ste,config = <&out_lo>;
-					};
-					default_cfg2 {
-						pins =
-						"GPIO93_B7", /* KP_I0 */
-						"GPIO92_D6", /* KP_I1 */
-						"GPIO89_E6", /* KP_I2 */
-						"GPIO88_C4", /* KP_I3 */
-						"GPIO97_D9", /* KP_I6 */
-						"GPIO95_E8"; /* KP_I7 */
-						ste,config = <&in_pu>;
-					};
+				default_cfg1 {
+					pins =
+					"GPIO153_B17", /* I7 */
+					"GPIO154_C16", /* I6 */
+					"GPIO155_C19", /* I5 */
+					"GPIO156_C17", /* I4 */
+					"GPIO161_D21", /* I3 */
+					"GPIO162_D20", /* I2 */
+					"GPIO163_C20", /* I1 */
+					"GPIO164_B21"; /* I0 */
+					ste,config = <&in_pd>;
+				};
+				default_cfg2 {
+					pins =
+					"GPIO157_A18", /* O7 */
+					"GPIO158_C18", /* O6 */
+					"GPIO159_B19", /* O5 */
+					"GPIO160_B20", /* O4 */
+					"GPIO165_C21", /* O3 */
+					"GPIO166_A22", /* O2 */
+					"GPIO167_B24", /* O1 */
+					"GPIO168_C22"; /* O0 */
+					ste,config = <&out_lo>;
+				};
+			};
+			ske_kpa2_sleep_mode: ske_kpa2_sleep {
+				sleep_cfg1 {
+					pins =
+					"GPIO153_B17", /* I7 */
+					"GPIO154_C16", /* I6 */
+					"GPIO155_C19", /* I5 */
+					"GPIO156_C17", /* I4 */
+					"GPIO161_D21", /* I3 */
+					"GPIO162_D20", /* I2 */
+					"GPIO163_C20", /* I1 */
+					"GPIO164_B21"; /* I0 */
+					ste,config = <&slpm_in_pu_wkup_pdis_en>;
+				};
+				sleep_cfg2 {
+					pins =
+					"GPIO157_A18", /* O7 */
+					"GPIO158_C18", /* O6 */
+					"GPIO159_B19", /* O5 */
+					"GPIO160_B20", /* O4 */
+					"GPIO165_C21", /* O3 */
+					"GPIO166_A22", /* O2 */
+					"GPIO167_B24", /* O1 */
+					"GPIO168_C22"; /* O0 */
+					ste,config = <&slpm_out_lo_pdis>;
+				};
+			};
+			/*
+			 * SKE keys on position 1 and "other C1" combi giving
+			 * six rows of six keys.
+			 */
+			ske_kpaoc1_default_mode: ske_kpaoc1_default {
+				default_mux {
+					function = "kp";
+					groups = "kp_a_1", "kp_oc1_1";
+				};
+				default_cfg1 {
+					pins =
+					"GPIO91_B6", /* KP_O0 */
+					"GPIO90_A3", /* KP_O1 */
+					"GPIO87_B3", /* KP_O2 */
+					"GPIO86_C6", /* KP_O3 */
+					"GPIO96_D8", /* KP_O6 */
+					"GPIO94_D7"; /* KP_O7 */
+					ste,config = <&out_lo>;
+				};
+				default_cfg2 {
+					pins =
+					"GPIO93_B7", /* KP_I0 */
+					"GPIO92_D6", /* KP_I1 */
+					"GPIO89_E6", /* KP_I2 */
+					"GPIO88_C4", /* KP_I3 */
+					"GPIO97_D9", /* KP_I6 */
+					"GPIO95_E8"; /* KP_I7 */
+					ste,config = <&in_pu>;
 				};
 			};
+		};
 
-			wlan {
-				wlan_default_mode: wlan_default {
-					/*
-					 * Activate this mode with the WLAN chip.
-					 * These are plain GPIO pins used by WLAN
-					 */
-					default_cfg1 {
-						pins =
-						"GPIO226_AF8", /* WLAN_PMU_EN */
-						"GPIO85_D5"; /* WLAN_ENA */
-						ste,config = <&gpio_out_lo>;
-					};
-					default_cfg2 {
-						pins = "GPIO4_AH6"; /* WLAN_IRQ on UART1 */
-						ste,config = <&gpio_in_pu>;
-					};
+		wlan {
+			wlan_default_mode: wlan_default {
+				/*
+				 * Activate this mode with the WLAN chip.
+				 * These are plain GPIO pins used by WLAN
+				 */
+				default_cfg1 {
+					pins =
+					"GPIO226_AF8", /* WLAN_PMU_EN */
+					"GPIO85_D5"; /* WLAN_ENA */
+					ste,config = <&gpio_out_lo>;
+				};
+				default_cfg2 {
+					pins = "GPIO4_AH6"; /* WLAN_IRQ on UART1 */
+					ste,config = <&gpio_in_pu>;
 				};
 			};
 		};
 	};
+
 };
diff --git a/arch/arm/boot/dts/st/ste-href-stuib.dtsi b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
index e2bd0418bb7a..b3b0e681f628 100644
--- a/arch/arm/boot/dts/st/ste-href-stuib.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
@@ -25,6 +25,75 @@ button-145 {
 		};
 	};
 
+	pinctrl {
+		/* Pull up this GPIO pin */
+		stmpe {
+			stmpe_stuib_mode: stmpe_stuib {
+				stuib_cfg {
+					pins = "GPIO218_AH11";
+					ste,config = <&gpio_in_pu>;
+				};
+			};
+		};
+		prox {
+			prox_stuib_mode: prox_stuib {
+				stuib_cfg {
+					pins = "GPIO217_AH12";
+					ste,config = <&gpio_in_pu>;
+				};
+			};
+		};
+		hall {
+			hall_stuib_mode: stuib_tvk {
+				stuib_cfg {
+					pins = "GPIO145_C13";
+					ste,config = <&gpio_in_pu>;
+				};
+			};
+		};
+		accelerometer {
+			accel_stuib_mode: accel_stuib {
+				/* Accelerometer interrupt lines 1 & 2 */
+				stuib_cfg {
+					pins = "GPIO82_C1", "GPIO83_D3";
+					ste,config = <&gpio_in_pu>;
+				};
+			};
+		};
+		magnetometer {
+			magneto_stuib_mode: magneto_stuib {
+				/* Magnetometer uses GPIO 31 and 32, pull these up/down respectively */
+				stuib_cfg1 {
+					pins = "GPIO31_V3";
+					ste,config = <&gpio_in_pu>;
+				};
+				stuib_cfg2 {
+					pins = "GPIO32_V2";
+					ste,config = <&gpio_in_pd>;
+				};
+			};
+		};
+		touch {
+			touch_rohm_mode: touch_rohm {
+				/*
+				 * ROHM touch screen uses GPIO 143 for
+				 * RST1, GPIO 146 for RST2 and
+				 * GPIO 67 for interrupts. Pull-up
+				 * the IRQ line and drive both
+				 * reset signals low.
+				 */
+				stuib_cfg1 {
+					pins = "GPIO143_D12", "GPIO146_D13";
+					ste,config = <&gpio_out_lo>;
+				};
+				stuib_cfg2 {
+					pins = "GPIO67_G2";
+					ste,config = <&gpio_in_pu>;
+				};
+			};
+		};
+	};
+
 	soc {
 		i2c@80004000 {
 			stmpe1601: port-expander@40 {
@@ -123,75 +192,6 @@ bu21013_tp@5d {
 			};
 		};
 
-		pinctrl {
-			/* Pull up this GPIO pin */
-			stmpe {
-				stmpe_stuib_mode: stmpe_stuib {
-					stuib_cfg {
-						pins = "GPIO218_AH11";
-						ste,config = <&gpio_in_pu>;
-					};
-				};
-			};
-			prox {
-				prox_stuib_mode: prox_stuib {
-					stuib_cfg {
-						pins = "GPIO217_AH12";
-						ste,config = <&gpio_in_pu>;
-					};
-				};
-			};
-			hall {
-				hall_stuib_mode: stuib_tvk {
-					stuib_cfg {
-						pins = "GPIO145_C13";
-						ste,config = <&gpio_in_pu>;
-					};
-				};
-			};
-			accelerometer {
-				accel_stuib_mode: accel_stuib {
-					/* Accelerometer interrupt lines 1 & 2 */
-					stuib_cfg {
-						pins = "GPIO82_C1", "GPIO83_D3";
-						ste,config = <&gpio_in_pu>;
-					};
-				};
-			};
-			magnetometer {
-				magneto_stuib_mode: magneto_stuib {
-					/* Magnetometer uses GPIO 31 and 32, pull these up/down respectively */
-					stuib_cfg1 {
-						pins = "GPIO31_V3";
-						ste,config = <&gpio_in_pu>;
-					};
-					stuib_cfg2 {
-						pins = "GPIO32_V2";
-						ste,config = <&gpio_in_pd>;
-					};
-				};
-			};
-			touch {
-				touch_rohm_mode: touch_rohm {
-					/*
-					 * ROHM touch screen uses GPIO 143 for
-					 * RST1, GPIO 146 for RST2 and
-					 * GPIO 67 for interrupts. Pull-up
-					 * the IRQ line and drive both
-					 * reset signals low.
-					 */
-					stuib_cfg1 {
-						pins = "GPIO143_D12", "GPIO146_D13";
-						ste,config = <&gpio_out_lo>;
-					};
-					stuib_cfg2 {
-						pins = "GPIO67_G2";
-						ste,config = <&gpio_in_pu>;
-					};
-				};
-			};
-		};
-
 		mcde@a0350000 {
 			status = "okay";
 
diff --git a/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi b/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi
index 4a2bfa4c702b..ecec418e29e0 100644
--- a/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi
@@ -26,6 +26,70 @@ button-145 {
 		};
 	};
 
+	pinctrl {
+		prox {
+			prox_tvk_mode: prox_tvk {
+				tvk_cfg {
+					pins = "GPIO217_AH12";
+					ste,config = <&gpio_in_pu>;
+				};
+			};
+		};
+		hall {
+			hall_tvk_mode: hall_tvk {
+				tvk_cfg {
+					pins = "GPIO145_C13";
+					ste,config = <&gpio_in_pu>;
+				};
+			};
+		};
+		tc35893 {
+			/* IRQ from the TC35893 */
+			tc35893_tvk_mode: tc35893_tvk {
+				tvk_cfg {
+					pins = "GPIO218_AH11";
+					ste,config = <&gpio_in_pu>;
+				};
+			};
+		};
+		accelerometer {
+			accel_tvk_mode: accel_tvk {
+				/* Accelerometer interrupt lines 1 & 2 */
+				tvk_cfg {
+					pins = "GPIO82_C1", "GPIO83_D3";
+					ste,config = <&gpio_in_pd>;
+				};
+			};
+		};
+		gyroscope {
+			/*
+			 * These lines are shared between Gyroscope l3g400dh
+			 * and AK8974 magnetometer.
+			 */
+			gyro_magn_tvk_mode: gyro_magn_tvk {
+				 /* GPIO 31 used for INT pull down the line */
+				tvk_cfg1 {
+					pins = "GPIO31_V3";
+					ste,config = <&gpio_in_pd>;
+				};
+				/* GPIO 32 used for DRDY, pull this down */
+				tvk_cfg2 {
+					pins = "GPIO32_V2";
+					ste,config = <&gpio_in_pd>;
+				};
+			};
+		};
+		synaptics {
+			synaptics_tvk_mode: synaptics_tvk {
+				/* Touchscreen uses GPIO 84 */
+				tvk_cfg1 {
+					pins = "GPIO84_C2";
+					ste,config = <&gpio_in_pu>;
+				};
+			};
+		};
+	};
+
 	soc {
 		i2c@80004000 {
 			tc35893@44 {
@@ -219,68 +283,5 @@ panel@0 {
 				};
 			};
 		};
-		pinctrl {
-			prox {
-				prox_tvk_mode: prox_tvk {
-					tvk_cfg {
-						pins = "GPIO217_AH12";
-						ste,config = <&gpio_in_pu>;
-					};
-				};
-			};
-			hall {
-				hall_tvk_mode: hall_tvk {
-					tvk_cfg {
-						pins = "GPIO145_C13";
-						ste,config = <&gpio_in_pu>;
-					};
-				};
-			};
-			tc35893 {
-				/* IRQ from the TC35893 */
-				tc35893_tvk_mode: tc35893_tvk {
-					tvk_cfg {
-						pins = "GPIO218_AH11";
-						ste,config = <&gpio_in_pu>;
-					};
-				};
-			};
-			accelerometer {
-				accel_tvk_mode: accel_tvk {
-					/* Accelerometer interrupt lines 1 & 2 */
-					tvk_cfg {
-						pins = "GPIO82_C1", "GPIO83_D3";
-						ste,config = <&gpio_in_pd>;
-					};
-				};
-			};
-			gyroscope {
-				/*
-				 * These lines are shared between Gyroscope l3g400dh
-				 * and AK8974 magnetometer.
-				 */
-				gyro_magn_tvk_mode: gyro_magn_tvk {
-					 /* GPIO 31 used for INT pull down the line */
-					tvk_cfg1 {
-						pins = "GPIO31_V3";
-						ste,config = <&gpio_in_pd>;
-					};
-					/* GPIO 32 used for DRDY, pull this down */
-					tvk_cfg2 {
-						pins = "GPIO32_V2";
-						ste,config = <&gpio_in_pd>;
-					};
-				};
-			};
-			synaptics {
-				synaptics_tvk_mode: synaptics_tvk {
-					/* Touchscreen uses GPIO 84 */
-					tvk_cfg1 {
-						pins = "GPIO84_C2";
-						ste,config = <&gpio_in_pu>;
-					};
-				};
-			};
-		};
 	};
 };
diff --git a/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi b/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi
index adb8d0be6f73..527432ce120c 100644
--- a/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi
@@ -21,6 +21,58 @@ button-145 {
 		};
 	};
 
+	pinctrl {
+		hall {
+			hall_tvk_mode: hall_tvk {
+				tvk_cfg {
+					pins = "GPIO145_C13";
+					ste,config = <&gpio_in_pu>;
+				};
+			};
+		};
+		tc35893 {
+			/* IRQ from the TC35893 */
+			tc35893_tvk_mode: tc35893_tvk {
+				tvk_cfg {
+					pins = "GPIO64_F3";
+					ste,config = <&gpio_in_pu>;
+				};
+			};
+		};
+		accelerometer {
+			accel_tvk_mode: accel_tvk {
+				/* Accelerometer interrupt lines 1 & 2 */
+				tvk_cfg {
+					pins = "GPIO82_C1", "GPIO83_D3";
+					ste,config = <&gpio_in_pd>;
+				};
+			};
+		};
+		magnetometer {
+			magn_tvk_mode: magn_tvk {
+				/* GPIO 32 used for DRDY, pull this down */
+				tvk_cfg {
+					pins = "GPIO32_V2";
+					ste,config = <&gpio_in_pd>;
+				};
+			};
+		};
+		cyttsp {
+			cyttsp_tvk_mode: cyttsp_tvk {
+				/* Touchscreen uses GPIO84 for IRQ */
+				tvk_cfg1 {
+					pins = "GPIO84_C2";
+					ste,config = <&gpio_in_pu>;
+				};
+				/* GPIO143 is reset */
+				tvk_cfg2 {
+					pins = "GPIO143_D12";
+					ste,config = <&gpio_out_hi>;
+				};
+			};
+		};
+	};
+
 	soc {
 		i2c@80004000 {
 			tc35893@44 {
@@ -162,56 +214,5 @@ panel@0 {
 			};
 		};
 
-		pinctrl {
-			hall {
-				hall_tvk_mode: hall_tvk {
-					tvk_cfg {
-						pins = "GPIO145_C13";
-						ste,config = <&gpio_in_pu>;
-					};
-				};
-			};
-			tc35893 {
-				/* IRQ from the TC35893 */
-				tc35893_tvk_mode: tc35893_tvk {
-					tvk_cfg {
-						pins = "GPIO64_F3";
-						ste,config = <&gpio_in_pu>;
-					};
-				};
-			};
-			accelerometer {
-				accel_tvk_mode: accel_tvk {
-					/* Accelerometer interrupt lines 1 & 2 */
-					tvk_cfg {
-						pins = "GPIO82_C1", "GPIO83_D3";
-						ste,config = <&gpio_in_pd>;
-					};
-				};
-			};
-			magnetometer {
-				magn_tvk_mode: magn_tvk {
-					/* GPIO 32 used for DRDY, pull this down */
-					tvk_cfg {
-						pins = "GPIO32_V2";
-						ste,config = <&gpio_in_pd>;
-					};
-				};
-			};
-			cyttsp {
-				cyttsp_tvk_mode: cyttsp_tvk {
-					/* Touchscreen uses GPIO84 for IRQ */
-					tvk_cfg1 {
-						pins = "GPIO84_C2";
-						ste,config = <&gpio_in_pu>;
-					};
-					/* GPIO143 is reset */
-					tvk_cfg2 {
-						pins = "GPIO143_D12";
-						ste,config = <&gpio_out_hi>;
-					};
-				};
-			};
-		};
 	};
 };
diff --git a/arch/arm/boot/dts/st/ste-href.dtsi b/arch/arm/boot/dts/st/ste-href.dtsi
index 459f82134d03..253f4795978f 100644
--- a/arch/arm/boot/dts/st/ste-href.dtsi
+++ b/arch/arm/boot/dts/st/ste-href.dtsi
@@ -44,6 +44,14 @@ bat_therm: thermistor {
 		#thermal-sensor-cells = <0>;
 	};
 
+	pinctrl {
+		sdi0 {
+			sdi0_default_mode: sdi0_default {
+				/* Some boards set additional settings here */
+			};
+		};
+	};
+
 	soc {
 		serial@80120000 {
 			pinctrl-names = "default", "sleep";
@@ -242,13 +250,6 @@ msp3: msp@80125000 {
 			status = "okay";
 		};
 
-		pinctrl {
-			sdi0 {
-				sdi0_default_mode: sdi0_default {
-					/* Some boards set additional settings here */
-				};
-			};
-		};
 
 		mcde@a0350000 {
 			pinctrl-names = "default", "sleep";
diff --git a/arch/arm/boot/dts/st/ste-hrefprev60.dtsi b/arch/arm/boot/dts/st/ste-hrefprev60.dtsi
index 5686d777311f..6bbc745febe8 100644
--- a/arch/arm/boot/dts/st/ste-hrefprev60.dtsi
+++ b/arch/arm/boot/dts/st/ste-hrefprev60.dtsi
@@ -15,6 +15,60 @@ button-139 {
 		};
 	};
 
+	pinctrl {
+		/* Set this up using hogs */
+		pinctrl-names = "default";
+		pinctrl-0 = <&ipgpio_hrefprev60_mode>;
+
+		ssp0 {
+			ssp0_hrefprev60_mode: ssp0_hrefprev60_default {
+				hrefprev60_mux {
+					function = "ssp0";
+					groups = "ssp0_a_1";
+				};
+				hrefprev60_cfg1 {
+					pins = "GPIO145_C13"; /* RXD */
+					ste,config = <&in_pd>;
+				};
+
+			};
+		};
+		sdi0 {
+			/* This additional pin needed on early MOP500 and HREFs previous to v60 */
+			sdi0_default_mode: sdi0_default {
+				hrefprev60_mux {
+					function = "mc0";
+					groups = "mc0dat31dir_a_1";
+				};
+				hrefprev60_cfg1 {
+					pins = "GPIO21_AB3"; /* DAT31DIR */
+					ste,config = <&out_hi>;
+				};
+
+			};
+		};
+		tc35892 {
+			tc35892_hrefprev60_mode: tc35892_hrefprev60 {
+				hrefprev60_cfg {
+					pins = "GPIO217_AH12";
+					ste,config = <&gpio_in_pu>;
+				};
+			};
+		};
+		ipgpio {
+			 ipgpio_hrefprev60_mode: ipgpio_hrefprev60 {
+				hrefprev60_mux {
+					function = "ipgpio";
+					groups = "ipgpio0_c_1", "ipgpio1_c_1";
+				};
+				hrefprev60_cfg1 {
+					pins = "GPIO6_AF6", "GPIO7_AG5";
+					ste,config = <&in_pu>;
+				};
+			 };
+		};
+	};
+
 	soc {
 		/* Enable UART1 on this board */
 		serial@80121000 {
@@ -65,58 +119,5 @@ mmc@80126000 {
 			cd-gpios = <&tc3589x_gpio 3 GPIO_ACTIVE_HIGH>;
 		};
 
-		pinctrl {
-			/* Set this up using hogs */
-			pinctrl-names = "default";
-			pinctrl-0 = <&ipgpio_hrefprev60_mode>;
-
-			ssp0 {
-				ssp0_hrefprev60_mode: ssp0_hrefprev60_default {
-					hrefprev60_mux {
-						function = "ssp0";
-						groups = "ssp0_a_1";
-					};
-					hrefprev60_cfg1 {
-						pins = "GPIO145_C13"; /* RXD */
-						ste,config = <&in_pd>;
-					};
-
-				};
-			};
-			sdi0 {
-				/* This additional pin needed on early MOP500 and HREFs previous to v60 */
-				sdi0_default_mode: sdi0_default {
-					hrefprev60_mux {
-						function = "mc0";
-						groups = "mc0dat31dir_a_1";
-					};
-					hrefprev60_cfg1 {
-						pins = "GPIO21_AB3"; /* DAT31DIR */
-						ste,config = <&out_hi>;
-					};
-
-				};
-			};
-			tc35892 {
-				tc35892_hrefprev60_mode: tc35892_hrefprev60 {
-					hrefprev60_cfg {
-						pins = "GPIO217_AH12";
-						ste,config = <&gpio_in_pu>;
-					};
-				};
-			};
-			ipgpio {
-				 ipgpio_hrefprev60_mode: ipgpio_hrefprev60 {
-					hrefprev60_mux {
-						function = "ipgpio";
-						groups = "ipgpio0_c_1", "ipgpio1_c_1";
-					};
-					hrefprev60_cfg1 {
-						pins = "GPIO6_AF6", "GPIO7_AG5";
-						ste,config = <&in_pu>;
-					};
-				 };
-			};
-		};
 	};
 };
diff --git a/arch/arm/boot/dts/st/ste-hrefv60plus.dtsi b/arch/arm/boot/dts/st/ste-hrefv60plus.dtsi
index c9e9ef830988..2d9d5607a78a 100644
--- a/arch/arm/boot/dts/st/ste-hrefv60plus.dtsi
+++ b/arch/arm/boot/dts/st/ste-hrefv60plus.dtsi
@@ -67,6 +67,186 @@ therm2: thermistor-1 {
 		#thermal-sensor-cells = <0>;
 	};
 
+	pinctrl {
+		/*
+		 * Set this up using hogs, as time goes by and as seems fit, these
+		 * can be moved over to being controlled by respective device.
+		 */
+		pinctrl-names = "default";
+		pinctrl-0 = <&ipgpio_hrefv60_mode>,
+			  <&etm_hrefv60_mode>,
+			  <&nahj_hrefv60_mode>,
+			  <&nfc_hrefv60_mode>,
+			  <&force_hrefv60_mode>,
+			  <&dipro_hrefv60_mode>,
+			  <&vaudio_hf_hrefv60_mode>,
+			  <&gbf_hrefv60_mode>,
+			  <&hdtv_hrefv60_mode>,
+			  <&gpios_hrefv60_mode>;
+
+		sdi0 {
+			sdi0_default_mode: sdi0_default {
+				/* SD card detect GPIO pin, extend default state */
+				default_hrefv60_cfg1 {
+					pins = "GPIO95_E8";
+					ste,config = <&gpio_in_pu>;
+				};
+			};
+		};
+		ipgpio {
+			/*
+			 * XENON Flashgun on image processor GPIO (controlled from image
+			 * processor firmware), mux in these image processor GPIO lines 0
+			 * (XENON_FLASH_ID), 1 (XENON_READY) and there is an assistant
+			 * LED on IP GPIO 4 (XENON_EN2) on altfunction C, that need bias
+			 * from GPIO21 so pull up 0, 1 and drive 4 and GPIO21 low as output.
+			 */
+			ipgpio_hrefv60_mode: ipgpio_hrefv60 {
+				hrefv60_mux {
+					function = "ipgpio";
+					groups = "ipgpio0_c_1", "ipgpio1_c_1", "ipgpio4_c_1";
+				};
+				hrefv60_cfg1 {
+					pins = "GPIO6_AF6", "GPIO7_AG5";
+					ste,config = <&in_pu>;
+				};
+				hrefv60_cfg2 {
+					pins = "GPIO21_AB3";
+					ste,config = <&gpio_out_lo>;
+				};
+				hrefv60_cfg3 {
+					pins = "GPIO64_F3";
+					ste,config = <&out_lo>;
+				};
+			};
+		};
+		etm {
+			/*
+			 * Drive D19-D23 for the ETM PTM trace interface low,
+			 * (presumably pins are unconnected therefore grounded here,
+			 * the "other alt C1" setting enables these pins)
+			 */
+			etm_hrefv60_mode: etm_hrefv60 {
+				hrefv60_cfg1 {
+					pins =
+					"GPIO70_G5",
+					"GPIO71_G4",
+					"GPIO72_H4",
+					"GPIO73_H3",
+					"GPIO74_J3";
+					ste,config = <&gpio_out_lo>;
+				};
+			 };
+		};
+		nahj {
+			nahj_hrefv60_mode: nahj_hrefv60 {
+				/* NAHJ CTRL on GPIO76 to low, CTRL_INV on GPIO216 to high */
+				hrefv60_cfg1 {
+					pins = "GPIO76_J2";
+					ste,config = <&gpio_out_lo>;
+				};
+				hrefv60_cfg2 {
+					pins = "GPIO216_AG12";
+					ste,config = <&gpio_out_hi>;
+				};
+			 };
+		};
+		nfc {
+			nfc_hrefv60_mode: nfc_hrefv60 {
+				/* NFC ENA and RESET to low, pulldown IRQ line */
+				hrefv60_cfg1 {
+					pins =
+					"GPIO77_H1", /* NFC_ENA */
+					"GPIO142_C11"; /* NFC_RESET */
+					ste,config = <&gpio_out_lo>;
+				};
+				hrefv60_cfg2 {
+					pins = "GPIO144_B13"; /* NFC_IRQ */
+					ste,config = <&gpio_in_pd>;
+				};
+			 };
+		};
+		force {
+			force_hrefv60_mode: force_hrefv60 {
+				hrefv60_cfg1 {
+					pins = "GPIO91_B6"; /* FORCE_SENSING_INT */
+					ste,config = <&gpio_in_pu>;
+				};
+				hrefv60_cfg2 {
+					pins =
+					"GPIO92_D6", /* FORCE_SENSING_RST */
+					"GPIO97_D9"; /* FORCE_SENSING_WU */
+					ste,config = <&gpio_out_lo>;
+				};
+			 };
+		};
+		dipro {
+			dipro_hrefv60_mode: dipro_hrefv60 {
+				hrefv60_cfg1 {
+					pins = "GPIO139_C9"; /* DIPRO_INT */
+					ste,config = <&gpio_in_pu>;
+				};
+			 };
+		};
+		vaudio_hf {
+			vaudio_hf_hrefv60_mode: vaudio_hf_hrefv60 {
+				/* Audio Amplifier HF enable GPIO */
+				hrefv60_cfg1 {
+					pins = "GPIO149_B14"; /* VAUDIO_HF_EN, enable MAX8968 */
+					ste,config = <&gpio_out_hi>;
+				};
+			 };
+		};
+		gbf {
+			gbf_hrefv60_mode: gbf_hrefv60 {
+				/*
+				 * GBF (GPS, Bluetooth, FM-radio) interface,
+				 * pull low to reset state
+				 */
+				hrefv60_cfg1 {
+					pins = "GPIO171_D23"; /* GBF_ENA_RESET */
+					ste,config = <&gpio_out_lo>;
+				};
+			 };
+		};
+		hdtv {
+			hdtv_hrefv60_mode: hdtv_hrefv60 {
+				/* MSP : HDTV INTERFACE GPIO line */
+				hrefv60_cfg1 {
+					pins = "GPIO192_AJ27";
+					ste,config = <&gpio_in_pd>;
+				};
+			 };
+		};
+		mcde {
+			lcd_hrefv60_mode: lcd_hrefv60 {
+				/*
+				 * Display Interface 1 uses GPIO 65 for RST (reset).
+				 * Display Interface 2 uses GPIO 66 for RST (reset).
+				 * Drive DISP1 reset high (not reset), driver DISP2 reset low (reset)
+				 */
+				hrefv60_cfg1 {
+					pins = "GPIO65_F1";
+					ste,config = <&gpio_out_hi>;
+				};
+				hrefv60_cfg2 {
+					pins = "GPIO66_G3";
+					ste,config = <&gpio_out_lo>;
+				};
+			};
+		};
+		dangling-pins {
+			/* Dangling GPIO pins */
+			gpios_hrefv60_mode: gpios_hrefv60 {
+				default_cfg1 {
+					/* Normally UART1 RXD, now dangling */
+					pins = "GPIO4_AH6";
+					ste,config = <&in_pu>;
+				};
+			};
+		};
+	};
+
 	soc {
 		/* Name the GPIO muxed rails on the HREF boards */
 		gpio@8012e000 {
@@ -193,184 +373,5 @@ mmc@80126000 {
 			cd-gpios = <&gpio2 31 GPIO_ACTIVE_HIGH>; // 95
 		};
 
-		pinctrl {
-			/*
-			 * Set this up using hogs, as time goes by and as seems fit, these
-			 * can be moved over to being controlled by respective device.
-			 */
-			pinctrl-names = "default";
-			pinctrl-0 = <&ipgpio_hrefv60_mode>,
-				  <&etm_hrefv60_mode>,
-				  <&nahj_hrefv60_mode>,
-				  <&nfc_hrefv60_mode>,
-				  <&force_hrefv60_mode>,
-				  <&dipro_hrefv60_mode>,
-				  <&vaudio_hf_hrefv60_mode>,
-				  <&gbf_hrefv60_mode>,
-				  <&hdtv_hrefv60_mode>,
-				  <&gpios_hrefv60_mode>;
-
-			sdi0 {
-				sdi0_default_mode: sdi0_default {
-					/* SD card detect GPIO pin, extend default state */
-					default_hrefv60_cfg1 {
-						pins = "GPIO95_E8";
-						ste,config = <&gpio_in_pu>;
-					};
-				};
-			};
-			ipgpio {
-				/*
-				 * XENON Flashgun on image processor GPIO (controlled from image
-				 * processor firmware), mux in these image processor GPIO lines 0
-				 * (XENON_FLASH_ID), 1 (XENON_READY) and there is an assistant
-				 * LED on IP GPIO 4 (XENON_EN2) on altfunction C, that need bias
-				 * from GPIO21 so pull up 0, 1 and drive 4 and GPIO21 low as output.
-				 */
-				ipgpio_hrefv60_mode: ipgpio_hrefv60 {
-					hrefv60_mux {
-						function = "ipgpio";
-						groups = "ipgpio0_c_1", "ipgpio1_c_1", "ipgpio4_c_1";
-					};
-					hrefv60_cfg1 {
-						pins = "GPIO6_AF6", "GPIO7_AG5";
-						ste,config = <&in_pu>;
-					};
-					hrefv60_cfg2 {
-						pins = "GPIO21_AB3";
-						ste,config = <&gpio_out_lo>;
-					};
-					hrefv60_cfg3 {
-						pins = "GPIO64_F3";
-						ste,config = <&out_lo>;
-					};
-				};
-			};
-			etm {
-				/*
-				 * Drive D19-D23 for the ETM PTM trace interface low,
-				 * (presumably pins are unconnected therefore grounded here,
-				 * the "other alt C1" setting enables these pins)
-				 */
-				etm_hrefv60_mode: etm_hrefv60 {
-					hrefv60_cfg1 {
-						pins =
-						"GPIO70_G5",
-						"GPIO71_G4",
-						"GPIO72_H4",
-						"GPIO73_H3",
-						"GPIO74_J3";
-						ste,config = <&gpio_out_lo>;
-					};
-				 };
-			};
-			nahj {
-				nahj_hrefv60_mode: nahj_hrefv60 {
-					/* NAHJ CTRL on GPIO76 to low, CTRL_INV on GPIO216 to high */
-					hrefv60_cfg1 {
-						pins = "GPIO76_J2";
-						ste,config = <&gpio_out_lo>;
-					};
-					hrefv60_cfg2 {
-						pins = "GPIO216_AG12";
-						ste,config = <&gpio_out_hi>;
-					};
-				 };
-			};
-			nfc {
-				nfc_hrefv60_mode: nfc_hrefv60 {
-					/* NFC ENA and RESET to low, pulldown IRQ line */
-					hrefv60_cfg1 {
-						pins =
-						"GPIO77_H1", /* NFC_ENA */
-						"GPIO142_C11"; /* NFC_RESET */
-						ste,config = <&gpio_out_lo>;
-					};
-					hrefv60_cfg2 {
-						pins = "GPIO144_B13"; /* NFC_IRQ */
-						ste,config = <&gpio_in_pd>;
-					};
-				 };
-			};
-			force {
-				force_hrefv60_mode: force_hrefv60 {
-					hrefv60_cfg1 {
-						pins = "GPIO91_B6"; /* FORCE_SENSING_INT */
-						ste,config = <&gpio_in_pu>;
-					};
-					hrefv60_cfg2 {
-						pins =
-						"GPIO92_D6", /* FORCE_SENSING_RST */
-						"GPIO97_D9"; /* FORCE_SENSING_WU */
-						ste,config = <&gpio_out_lo>;
-					};
-				 };
-			};
-			dipro {
-				dipro_hrefv60_mode: dipro_hrefv60 {
-					hrefv60_cfg1 {
-						pins = "GPIO139_C9"; /* DIPRO_INT */
-						ste,config = <&gpio_in_pu>;
-					};
-				 };
-			};
-			vaudio_hf {
-				vaudio_hf_hrefv60_mode: vaudio_hf_hrefv60 {
-					/* Audio Amplifier HF enable GPIO */
-					hrefv60_cfg1 {
-						pins = "GPIO149_B14"; /* VAUDIO_HF_EN, enable MAX8968 */
-						ste,config = <&gpio_out_hi>;
-					};
-				 };
-			};
-			gbf {
-				gbf_hrefv60_mode: gbf_hrefv60 {
-					/*
-					 * GBF (GPS, Bluetooth, FM-radio) interface,
-					 * pull low to reset state
-					 */
-					hrefv60_cfg1 {
-						pins = "GPIO171_D23"; /* GBF_ENA_RESET */
-						ste,config = <&gpio_out_lo>;
-					};
-				 };
-			};
-			hdtv {
-				hdtv_hrefv60_mode: hdtv_hrefv60 {
-					/* MSP : HDTV INTERFACE GPIO line */
-					hrefv60_cfg1 {
-						pins = "GPIO192_AJ27";
-						ste,config = <&gpio_in_pd>;
-					};
-				 };
-			};
-			mcde {
-				lcd_hrefv60_mode: lcd_hrefv60 {
-					/*
-					 * Display Interface 1 uses GPIO 65 for RST (reset).
-					 * Display Interface 2 uses GPIO 66 for RST (reset).
-					 * Drive DISP1 reset high (not reset), driver DISP2 reset low (reset)
-					 */
-					hrefv60_cfg1 {
-						pins = "GPIO65_F1";
-						ste,config = <&gpio_out_hi>;
-					};
-					hrefv60_cfg2 {
-						pins = "GPIO66_G3";
-						ste,config = <&gpio_out_lo>;
-					};
-				};
-			};
-			dangling-pins {
-				/* Dangling GPIO pins */
-				gpios_hrefv60_mode: gpios_hrefv60 {
-					default_cfg1 {
-						/* Normally UART1 RXD, now dangling */
-						pins = "GPIO4_AH6";
-						ste,config = <&in_pu>;
-					};
-				};
-			};
-		};
 	};
 };
diff --git a/arch/arm/boot/dts/st/ste-snowball.dts b/arch/arm/boot/dts/st/ste-snowball.dts
index 29e680264e5b..754e452c947e 100644
--- a/arch/arm/boot/dts/st/ste-snowball.dts
+++ b/arch/arm/boot/dts/st/ste-snowball.dts
@@ -132,6 +132,159 @@ vmmci: regulator-sd {
 			  2900000 0x0>;
 	};
 
+	pinctrl {
+		/*
+		 * Set this up using hogs, as time goes by and as seems fit, these
+		 * can be moved over to being controlled by respective device.
+		 */
+		pinctrl-names = "default";
+		pinctrl-0 = <&gbf_snowball_mode>,
+			  <&wlan_snowball_mode>;
+
+		ethernet {
+			/*
+			 * Mux in "SM" which is used for the
+			 * SMSC911x Ethernet adapter
+			 */
+			eth_snowball_mode: eth_snowball {
+				snowball_mux {
+					function = "sm";
+					groups = "sm_b_1";
+				};
+				/* LAN IRQ pin */
+				snowball_cfg1 {
+					pins = "GPIO140_B11";
+					ste,config = <&in_nopull>;
+				};
+				/* LAN reset pin */
+				snowball_cfg2 {
+					pins = "GPIO141_C12";
+					ste,config = <&gpio_out_hi>;
+				};
+
+			};
+		};
+		sdi0 {
+			sdi0_default_mode: sdi0_default {
+				snowball_mux {
+					function = "mc0";
+					/* Add the DAT31 pin even if it is not really used */
+					groups = "mc0dat31dir_a_1";
+				};
+				snowball_cfg1 {
+					pins = "GPIO21_AB3"; /* DAT31DIR */
+					ste,config = <&out_hi>;
+				};
+				/* SD card detect GPIO pin, extend default state */
+				snowball_cfg2 {
+					pins = "GPIO218_AH11";
+					ste,config = <&gpio_in_pu>;
+				};
+				/* VMMCI level-shifter enable */
+				snowball_cfg3 {
+					pins = "GPIO217_AH12";
+					ste,config = <&gpio_out_hi>;
+				};
+				/* VMMCI level-shifter voltage select */
+				snowball_cfg4 {
+					pins = "GPIO228_AJ6";
+					ste,config = <&gpio_out_hi>;
+				};
+			};
+		};
+		ssp0 {
+			ssp0_snowball_mode: ssp0_snowball_default {
+				snowball_mux {
+					function = "ssp0";
+					groups = "ssp0_a_1";
+				};
+				snowball_cfg1 {
+					pins = "GPIO144_B13"; /* FRM */
+					ste,config = <&gpio_out_hi>;
+				};
+				snowball_cfg2 {
+					pins = "GPIO145_C13"; /* RXD */
+					ste,config = <&in_pd>;
+				};
+				snowball_cfg3 {
+					pins =
+					"GPIO146_D13", /* TXD */
+					"GPIO143_D12"; /* CLK */
+					ste,config = <&out_lo>;
+				};
+
+			};
+		};
+		gpio_led {
+			gpioled_snowball_mode: gpioled_default {
+				snowball_cfg1 {
+					pins = "GPIO142_C11";
+					ste,config = <&gpio_out_hi>;
+				};
+
+			};
+		};
+		accelerometer {
+			accel_snowball_mode: accel_snowball {
+				/* Accelerometer lines */
+				snowball_cfg1 {
+					pins =
+					"GPIO163_C20", /* ACCEL_IRQ1 */
+					"GPIO164_B21"; /* ACCEL_IRQ2 */
+					ste,config = <&gpio_in_pu>;
+				};
+			};
+		};
+		gyro {
+			gyro_snowball_mode: gyro_snowball {
+				snowball_cfg1 {
+					pins =
+					"GPIO166_A22", /* DRDY */
+					"GPIO169_D22"; /* INT */
+					ste,config = <&gpio_in_pu>;
+				};
+			};
+		};
+		magnetometer {
+			magneto_snowball_mode: magneto_snowball {
+				snowball_cfg1 {
+					pins = "GPIO165_C21"; /* MAG_DRDY */
+					ste,config = <&gpio_in_pu>;
+				};
+			};
+		};
+		gbf {
+			gbf_snowball_mode: gbf_snowball {
+				/*
+				 * GBF (GPS, Bluetooth, FM-radio) interface,
+				 * pull low to reset state
+				 */
+				snowball_cfg1 {
+					pins = "GPIO171_D23"; /* GBF_ENA_RESET */
+					ste,config = <&gpio_out_lo>;
+				};
+			 };
+		};
+		wlan {
+			wlan_snowball_mode: wlan_snowball {
+				/*
+				 * Activate this mode with the WLAN chip.
+				 * These are plain GPIO pins used by WLAN
+				 */
+				snowball_cfg1 {
+					pins =
+					"GPIO161_D21", /* WLAN_PMU_EN */
+					"GPIO215_AH13"; /* WLAN_ENA */
+					ste,config = <&gpio_out_lo>;
+				};
+				snowball_cfg2 {
+					pins = "GPIO216_AG12"; /* WLAN_IRQ */
+					ste,config = <&gpio_in_pu>;
+				};
+			};
+		};
+	};
+
 	soc {
 		/* Name the GPIO muxed rails on the Snowball board */
 		gpio@8012e000 {
@@ -493,158 +646,6 @@ ab8500_ldo_ana_reg: ab8500_ldo_ana {
 			};
 		};
 
-		pinctrl {
-			/*
-			 * Set this up using hogs, as time goes by and as seems fit, these
-			 * can be moved over to being controlled by respective device.
-			 */
-			pinctrl-names = "default";
-			pinctrl-0 = <&gbf_snowball_mode>,
-				  <&wlan_snowball_mode>;
-
-			ethernet {
-				/*
-				 * Mux in "SM" which is used for the
-				 * SMSC911x Ethernet adapter
-				 */
-				eth_snowball_mode: eth_snowball {
-					snowball_mux {
-						function = "sm";
-						groups = "sm_b_1";
-					};
-					/* LAN IRQ pin */
-					snowball_cfg1 {
-						pins = "GPIO140_B11";
-						ste,config = <&in_nopull>;
-					};
-					/* LAN reset pin */
-					snowball_cfg2 {
-						pins = "GPIO141_C12";
-						ste,config = <&gpio_out_hi>;
-					};
-
-				};
-			};
-			sdi0 {
-				sdi0_default_mode: sdi0_default {
-					snowball_mux {
-						function = "mc0";
-						/* Add the DAT31 pin even if it is not really used */
-						groups = "mc0dat31dir_a_1";
-					};
-					snowball_cfg1 {
-						pins = "GPIO21_AB3"; /* DAT31DIR */
-						ste,config = <&out_hi>;
-					};
-					/* SD card detect GPIO pin, extend default state */
-					snowball_cfg2 {
-						pins = "GPIO218_AH11";
-						ste,config = <&gpio_in_pu>;
-					};
-					/* VMMCI level-shifter enable */
-					snowball_cfg3 {
-						pins = "GPIO217_AH12";
-						ste,config = <&gpio_out_hi>;
-					};
-					/* VMMCI level-shifter voltage select */
-					snowball_cfg4 {
-						pins = "GPIO228_AJ6";
-						ste,config = <&gpio_out_hi>;
-					};
-				};
-			};
-			ssp0 {
-				ssp0_snowball_mode: ssp0_snowball_default {
-					snowball_mux {
-						function = "ssp0";
-						groups = "ssp0_a_1";
-					};
-					snowball_cfg1 {
-						pins = "GPIO144_B13"; /* FRM */
-						ste,config = <&gpio_out_hi>;
-					};
-					snowball_cfg2 {
-						pins = "GPIO145_C13"; /* RXD */
-						ste,config = <&in_pd>;
-					};
-					snowball_cfg3 {
-						pins =
-						"GPIO146_D13", /* TXD */
-						"GPIO143_D12"; /* CLK */
-						ste,config = <&out_lo>;
-					};
-
-				};
-			};
-			gpio_led {
-				gpioled_snowball_mode: gpioled_default {
-					snowball_cfg1 {
-						pins = "GPIO142_C11";
-						ste,config = <&gpio_out_hi>;
-					};
-
-				};
-			};
-			accelerometer {
-				accel_snowball_mode: accel_snowball {
-					/* Accelerometer lines */
-					snowball_cfg1 {
-						pins =
-						"GPIO163_C20", /* ACCEL_IRQ1 */
-						"GPIO164_B21"; /* ACCEL_IRQ2 */
-						ste,config = <&gpio_in_pu>;
-					};
-				};
-			};
-			gyro {
-				gyro_snowball_mode: gyro_snowball {
-					snowball_cfg1 {
-						pins =
-						"GPIO166_A22", /* DRDY */
-						"GPIO169_D22"; /* INT */
-						ste,config = <&gpio_in_pu>;
-					};
-				};
-			};
-			magnetometer {
-				magneto_snowball_mode: magneto_snowball {
-					snowball_cfg1 {
-						pins = "GPIO165_C21"; /* MAG_DRDY */
-						ste,config = <&gpio_in_pu>;
-					};
-				};
-			};
-			gbf {
-				gbf_snowball_mode: gbf_snowball {
-					/*
-					 * GBF (GPS, Bluetooth, FM-radio) interface,
-					 * pull low to reset state
-					 */
-					snowball_cfg1 {
-						pins = "GPIO171_D23"; /* GBF_ENA_RESET */
-						ste,config = <&gpio_out_lo>;
-					};
-				 };
-			};
-			wlan {
-				wlan_snowball_mode: wlan_snowball {
-					/*
-					 * Activate this mode with the WLAN chip.
-					 * These are plain GPIO pins used by WLAN
-					 */
-					snowball_cfg1 {
-						pins =
-						"GPIO161_D21", /* WLAN_PMU_EN */
-						"GPIO215_AH13"; /* WLAN_ENA */
-						ste,config = <&gpio_out_lo>;
-					};
-					snowball_cfg2 {
-						pins = "GPIO216_AG12"; /* WLAN_IRQ */
-						ste,config = <&gpio_in_pu>;
-					};
-				};
-			};
-		};
 
 		mcde@a0350000 {
 			pinctrl-names = "default", "sleep";

-- 
2.56.1

