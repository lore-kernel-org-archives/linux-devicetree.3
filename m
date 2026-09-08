Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C535293E5
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 23:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788911915; cv=none; b=t6AJ2VjnRSFZcVuGApSYDa0SOzwXeBBOxG5GiXo0UqncYjEYH3oNZxSYwMgMUeJgoqol7oBPuKlV4xUsBVdsFsXWvWKxnf7xSpj7NYHDCsoQNGUrdlsnahmSQA0Pu0+RFCdib5/tYaOiD5p1C8ONsA/beSPXmKel+s+PgjDRN34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788911915; c=relaxed/simple;
	bh=8k7mu99096T5cIt/2lgLlI5vCBRPRrpOogHtvZ8RcmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DTQIZZsEqWliALeYpBFJhJfUQpploNaUm6dN47yncCBOfdZiK1zJoXeoAO5CzfIRlw6LQ1IB6ujti3N/TCypTqFyV+NMLaITN3JrV7yKye3t9McPGn67typxO4I5ZnBU9H//94HqzFmo5d+8VM8E/5cv61fz901kYWnA6r1rl10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJ0mKAl+; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJ0mKAl+"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso4655408e87.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 16:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788911912; x=1789516712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4EIBbDtP3pE4sX49bamShduyelpdA+kNTYkxo4+Kss=;
        b=gJ0mKAl+ZQdo94g0uSwq0XSH73ufqE38SBUBhubeNWcDPfZIMakITDtjg5EetVPr+Z
         6lXspubkFMGto4RDpUVudG4NOivsMkeJz8XTR64bQQkXtORemoWVYQtlBBEbX0c63M+X
         VZGbvju4oUUwYU4TWL9vhbx2P1Y8E4wP+9kTWMyJT1Sxe80zcogBNmOpVM13zxmYOzPV
         tfdRyogASB5p5vCI+Y4CCNg54IwuZwUANjFxeCvrf2hrEIrSBuDnsuckv5OMX4lYauLx
         0WRKGbA1GPZQdmjwAvlGFNWsWvJlzqY6EP2aGpR0yt50eGv8Dzkxk77W+0CXkg79gtgl
         9COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788911912; x=1789516712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k4EIBbDtP3pE4sX49bamShduyelpdA+kNTYkxo4+Kss=;
        b=kxYrlaDt9vZ1TZQ9ICDxnHv1JhkQBILBm06qM5Fl9akdk5G5KMH1S0fjNC5Wy6526N
         yNFg8kHcM78lULIgBLePZcxEqTuZimnq2W9Vs51x55ErKB4wDC1DuhZ8LIpHFOkxPTQe
         dLNt1+WQp/UYNBCq0V4JR6KSesAAqFmbJVDJGEomwpQmZAro4ECj1XC1ZD09Yjwev5RS
         cJDfkR8BsEXTTf0ubhulWcaFIoifnysHgEWsznVZaEGYK91hDyaXIL4bHqRU10HlnK8+
         WGaRDCd9osIyaPC4wT7crGjRP5m091CIdIBjD2+1HOnb8FS1ukqy1qoAL0n9k2krijTo
         6O6w==
X-Forwarded-Encrypted: i=1; AKwUvBwYk5KQhDwrGKI3Hpl4SH65/HWcln9mxKoA5DOqLMekvyqgkb+/19K6/8nJYeCYK5HqvHC2/A40DvG3@vger.kernel.org
X-Gm-Message-State: AFuF++k+7ea/zviqniKeRiaBokgvOQAtl1O7epSQZFms3enzYAZl/03c
	VyQ0OvpbUVgJtJjibpvCRrihqZ5rbMQjUCo/G7FDzNQ4Xw5RJy9AihrD
X-Gm-Gg: AYBFou2EvXe/tT1q4xI4mVctI8H67ZcT/SRCyZahfMiwP855e2qjdg9bjARxvnjY8rZ
	pL/+22kmgmldMPZA3ehXPQ/wCuGCpoNPlKS+aMH3xaEyYVi+CTDcNE5qU5wmcz4FbTz0b8PekWO
	peIHR4/pmKu0NATa0pyUfMHNpokHR1wDywHTbbQ6x6Db0P3t5mM5/Au5dqmuD8wRQ1f63P/ZuI9
	Ide2JxuCv8nptKaAz3e3ioRWsAOGH3U+jL70YYX3yqUG5mOyWIy1fvRPUsffQ125ILfo08SCvZQ
	CyMjUIBzkjL5YVIfQEGnWpjbi43iCN1x8PagTz3X3LDuYPn7s7TiCcMCCshmE01J76pH39yfMZB
	oinK5hkp71qcoPJX/GCYfymqStzdQcDpxxFxvFuUSjZydz1Xo5LJaxbnXmU7Xbb5nhALnDSJUAa
	0h579qxrB9PSStbQw/hDft5EC14MN359oVt1eHvQdRXJita2wnAXOB+s2sjOaiE8RwCTYbrbHS1
	CU=
X-Received: by 2002:ac2:4e15:0:b0:5b7:6378:bdd with SMTP id 2adb3069b0e04-5b763780d37mr586405e87.12.1788911911465;
        Tue, 08 Sep 2026 16:58:31 -0700 (PDT)
Received: from KAS (94-29-32-34.dynamic.spd-mgts.ru. [94.29.32.34])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b765652d3esm127328e87.59.2026.09.08.16.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 16:58:31 -0700 (PDT)
From: Andrey Korshunov <razor1702@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: rockchip: Add FriendlyElec NanoPi R28S
Date: Wed,  9 Sep 2026 02:58:23 +0300
Message-ID: <20260908235824.665-2-razor1702@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <20260908235824.665-1-razor1702@gmail.com>
References: <20260908235824.665-1-razor1702@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NanoPi R28S is a 45x45 mm router board from FriendlyElec with the
Rockchip RK3528A SoC. It has the following features:

- 1GB LPDDR4
- MicroSD card slot
- eMMC module socket
- 1x 1GbE RTL8211F Ethernet on gmac1
- 1x 1GbE RTL8111H Ethernet on the PCIe Gen2 x1 controller
- AICSemi AIC8800D80 Wi-Fi 6 / Bluetooth module on sdio0
- HYM8563 RTC with battery connector
- 1x USB 2.0 Type-C, 5V input and maskrom port
- 1x USB Type-C debug console, uart0 behind a USB-UART bridge
- 2 buttons (User, Maskrom)
- 3 LEDs (SYS, LAN, WAN)

The PHY reset is described on the MAC with snps,reset-gpio rather than in
the PHY node. This board leaves the PHY in reset unless the bootloader
released it, and of_mdio.c reads the PHY ID with get_phy_device() before
phy_device_register() picks up a PHY node's reset-gpios, so described that
way the PHY is reported missing and the port never comes up. As
mii_bus->reset, stmmac runs it before the bus is scanned and defers the
probe until the GPIO controller is available.

Signed-off-by: Andrey Korshunov <razor1702@gmail.com>
---

Tested on the board, booting Armbian images built from this device tree
on 7.2.4 and on v7.3-rc2. Both Ethernet ports carry link: stmmac finds
the RTL8211F on mdio1, and the RTL8111H enumerates behind the PCIe root
port. adc-keys and the HYM8563 RTC probe, and the system runs off the SD
card, iozone included.

An earlier build on v7.3-rc1 wedged the SD host - dw_mmc timing out on a
bare SDMMC_CMD_UPD_CLK, the card then rescanned in a loop, boots taking
minutes or hanging before the rootfs appeared. Neither v7.2.4 nor
v7.3-rc2 does that with the same device tree file, so it did not come
from here.

dwc3 is the one node not exercised beyond probing - the board's only USB
port is the Type-C jack that takes the 5V input and doubles as the
maskrom port, so there is nothing for it to talk to.

 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3528-nanopi-r28s.dts  | 387 ++++++++++++++++++
 2 files changed, 388 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index e7936a21c..12e117159 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -94,6 +94,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-vicharak-vaaman.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-armsom-sige1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-hinlink-h28k.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-r28s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-zero2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-radxa-e20c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-rock-2a.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
new file mode 100644
index 000000000..a699b72cf
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
@@ -0,0 +1,387 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 FriendlyElec Computer Tech. Co., Ltd.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pwm/pwm.h>
+#include "rk3528.dtsi"
+
+/ {
+	model = "FriendlyElec NanoPi R28S";
+	compatible = "friendlyarm,nanopi-r28s", "rockchip,rk3528";
+
+	aliases {
+		ethernet0 = &gmac1;
+		i2c1 = &i2c1;
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
+		mmc2 = &sdio0;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:1500000n8";
+	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-maskrom {
+			label = "MASKROM";
+			linux,code = <KEY_SETUP>;
+			press-threshold-microvolt = <0>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&user_key>;
+
+		button-user {
+			gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
+			label = "USER";
+			linux,code = <BTN_1>;
+			wakeup-source;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&lan_led_g>, <&sys_led_r>, <&wan_led_g>;
+
+		led-lan {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "netdev";
+		};
+
+		led-sys {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "on";
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-wan {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_WAN;
+			gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "netdev";
+		};
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <5000000>;
+		reset-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
+	};
+
+	vdd_0v9: regulator-0v9-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_0v9";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_ddr: regulator-1v1-vcc-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_ddr";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_1v8: regulator-1v8-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_3v3: regulator-3v3-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc3v3_sd: regulator-3v3-vcc-sd {
+		compatible = "regulator-fixed";
+		gpios = <&gpio4 RK_PA1 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sdmmc_pwren_l>;
+		regulator-name = "vcc3v3_sd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3>;
+	};
+
+	vcc5v0_sys: regulator-5v0-vcc-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vccio_sd: regulator-vccio-sd {
+		compatible = "regulator-gpio";
+		gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sdmmc_vol_ctrl_h>;
+		regulator-name = "vccio_sd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		states = <1800000 0x0>, <3300000 0x1>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vdd_arm: regulator-vdd-arm {
+		compatible = "pwm-regulator";
+		pwms = <&pwm1 0 5000 PWM_POLARITY_INVERTED>;
+		pwm-supply = <&vcc5v0_sys>;
+		regulator-name = "vdd_arm";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <746000>;
+		regulator-max-microvolt = <1201000>;
+		regulator-settling-time-up-us = <250>;
+	};
+
+	vdd_logic: regulator-vdd-logic {
+		compatible = "pwm-regulator";
+		pwms = <&pwm2 0 5000 PWM_POLARITY_INVERTED>;
+		pwm-supply = <&vcc5v0_sys>;
+		regulator-name = "vdd_logic";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <705000>;
+		regulator-max-microvolt = <1006000>;
+		regulator-settling-time-up-us = <250>;
+	};
+};
+
+&combphy {
+	status = "okay";
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&cpu1 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&cpu2 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&cpu3 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy>;
+	phy-mode = "rgmii-id";
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii_miim>, <&rgmii_tx_bus2>, <&rgmii_rx_bus2>,
+		    <&rgmii_rgmii_clk>, <&rgmii_rgmii_bus>, <&gmac1_rstn_l>;
+	snps,reset-active-low;
+	snps,reset-delays-us = <0 20000 100000>;
+	snps,reset-gpio = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&vdd_logic>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1m0_xfer>;
+	status = "okay";
+
+	rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PC1 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtc_int_l>;
+		wakeup-source;
+	};
+};
+
+&mdio1 {
+	rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x1>;
+	};
+};
+
+&pcie {
+	reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc_3v3>;
+	status = "okay";
+};
+
+&pinctrl {
+	ethernet {
+		gmac1_rstn_l: gmac1-rstn-l {
+			rockchip,pins = <4 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	gpio-keys {
+		user_key: user-key {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	leds {
+		lan_led_g: lan-led-g {
+			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		sys_led_r: sys-led-r {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		wan_led_g: wan-led-g {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	rtc {
+		rtc_int_l: rtc-int-l {
+			rockchip,pins = <4 RK_PC1 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	sdmmc {
+		sdmmc_pwren_l: sdmmc-pwren-l {
+			rockchip,pins = <4 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		sdmmc_vol_ctrl_h: sdmmc-vol-ctrl-h {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm1m0_pins>;
+	status = "okay";
+};
+
+&pwm2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm2m0_pins>;
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdhci {
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	no-sd;
+	no-sdio;
+	non-removable;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+/* Guangzhou Shikun SKI.WB800D80S.1 module, an AICSemi AIC8800D80. */
+&sdio0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-mmc;
+	no-sd;
+	non-removable;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	disable-wp;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc3v3_sd>;
+	vqmmc-supply = <&vccio_sd>;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0m0_xfer>;
+	status = "okay";
+};
+
+/*
+ * The only USB port on the board is the Type-C jack silkscreened 5V/OTG: it
+ * takes the 5 V input and doubles as the maskrom/eMMC flashing port, so the
+ * controller is device-only. The debug console is not a port of this SoC
+ * either - it reaches uart0 through a separate USB-UART bridge.
+ */
+&usb_host0_xhci {
+	dr_mode = "peripheral";
+	extcon = <&usb2phy>;
+	maximum-speed = "high-speed";
+	phys = <&usb2phy_otg>;
+	phy-names = "usb2-phy";
+	status = "okay";
+};
+
+&usb2phy {
+	status = "okay";
+};
+
+&usb2phy_otg {
+	status = "okay";
+};
-- 
2.54.0.windows.1

