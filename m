Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721279;
	b=kP02Yo3M6t+ii87bGQJQ5mb7sHf9fhencbu5rabuuurLTvGTY4tZsHCNlfrF+6K7CXFo
	 iuW4F8ExdCfdkCReP2FmzWD0FKKTyqFpjWWRx0MReXZwC4V+zqcM0xAoJBGndxQ87JSpg
	 3lzdngGV3gvFHyRbBTh9CCfPb8aEDYLZZfb8YvK0luBnln4UsE9LMpx+CuUUYuCJ+0fa2
	 GP3iz/7r8alv81PNZ6GYvkLyfkBSVfwDt4zZ/NbTsc84d0DM+vrJXBB8J0HX4138urHhv
	 ssDfdmjcp8nn60n6KlbQRQbRUI/6lcxmzPBw0a/mMMmknDg1lU/wdazBf7wU67iYB9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721279;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FNzEHA4/L2PAmJ+F/LcXdz2bE0OJ7mWf/LIjnfOf7EY=;
	b=Q0o/kXtIr0s+fXsOgDy2RrwpamakHfdGskuWR2I9EzCB+AZAH1QrZGMpOs37F2OlzplK
	 0yDnFlb4NXLcFaig/yVfiyDKApTIyghvwyrzm1AfygpBWMUvCTqNuY8n3DAGc/ACGlcLh
	 OmgNiaLuvdR1SLW60eOg00i/OuFGllSATdHu+0LYh44rDiKEQ/PZcA2FFGFwn3V1/YkZD
	 3bcBfgmVPHb/0LVy66JbAEnQL2fUWD5A77mZfj8PWaQmVXoveI53FIlGCA0D3fJ3OsGBd
	 tjsiie0e1GSWl4t7OWfBDUBE65rRbMNSjfrgzwA36cYb6CTg3H/han5ZLGXAtvcmkwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=cts9fInG;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=hTDmMdGM;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F09606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F09606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=cts9fInG;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=hTDmMdGM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795721278;
 bh=FNzEHA4/L2PAmJ+F/LcXdz2bE0OJ7mWf/LIjnfOf7EY=;
 b=cts9fInGtWJx5PetlT13bOLHeI4WNVmKATRmvPlR3u8O3Sx38uZuX8i96b+a1qLQ4BVQGIYRR
 8oA8y3GiHUf3/uFN0bjwxUfzQtcbQyEn4cCXcjQ2TB1CKA9e3RKB7YKjvxjAtXpFnH/CWF5Pmzp
 XFpoxBOpywBqvt8cOviE2hxpxyK/91ZX0k8Haqou9Y1up3TMJdE60pQB6501b6AorsNGLGsyrRY
 nqULitqMo6FheIaBBHJykv/tfAkHIg7Khcl8FcvlWGU9aUnr3hwyDZ23V5nO2VmJjkrIm1qf5+2
 DkaUteDMZP3EmwTLSwtTTH8a2N9zXgZDqDsjplMgzbeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795721278;
 bh=FNzEHA4/L2PAmJ+F/LcXdz2bE0OJ7mWf/LIjnfOf7EY=;
 b=hTDmMdGMb0jlWl+LVGSrf71k6hKs4EYKOaxVy6AJmIqUvk0B4XKkjv9JKlkHdbRACr8LqjvSd
 woDmF6QPiDIh+O2vmzg7ypuHesnDkaC5gsOwCGpkChxKo8WGFX0gGKi7WqzJDactJh2JpVCTNbd
 GQF9fNdCQiXiuYt+ltiIZiw=
CFBL-Feedback-ID: 6b08883ab69a54ed847adb5e:08f0c09a429f60df47897387344267c7
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b08883ab69a54ed847adb5e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.39
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: dts: rockchip: Add ArmSoM Forge1 board
Date: Thu, 26 Nov 2026 19:27:45 +0000
Message-ID: <20261126192746.1595707-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126192746.1595707-1-jonas@kwiboo.se>
References: <20261126192746.1595707-1-jonas@kwiboo.se>
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

ArmSoM Forge1 is an industrial-grade product powered by the RK3506J
triple-core Cortex-A7 application processor. It is specifically designed
for industrial gateways, HMIs, PLCs, handheld POS devices, and home
appliance display/control applications.

Link: https://docs.armsom.org/armsom-forge1
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- Remove unintended use of zero-width space in commit message
- Add spi_nand label to flash@0 node
- Drop rtc_int pinctrl, it was not referenced and unclear how RMIO may
  affect how hw description of RTC IC may end up
---
 arch/arm/boot/dts/rockchip/Makefile           |   3 +-
 .../dts/rockchip/rk3506j-armsom-forge1.dts    | 223 ++++++++++++++++++
 2 files changed, 225 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506j-armsom-forge1.dts

diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
index faebeb20f467..ef11b2b95ae4 100644
--- a/arch/arm/boot/dts/rockchip/Makefile
+++ b/arch/arm/boot/dts/rockchip/Makefile
@@ -49,4 +49,5 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rk3506-luckfox-lyra-plus.dtb \
 	rk3506-luckfox-lyra.dtb \
 	rk3506b-luckfox-lyra-ultra.dtb \
-	rk3506b-luckfox-lyra-zero-w.dtb
+	rk3506b-luckfox-lyra-zero-w.dtb \
+	rk3506j-armsom-forge1.dtb
diff --git a/arch/arm/boot/dts/rockchip/rk3506j-armsom-forge1.dts b/arch/arm/boot/dts/rockchip/rk3506j-armsom-forge1.dts
new file mode 100644
index 000000000000..ddc752059d50
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3506j-armsom-forge1.dts
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include "rk3506.dtsi"
+
+/ {
+	model = "ArmSoM Forge1";
+	compatible = "armsom,forge1", "rockchip,rk3506";
+
+	aliases {
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		mmc0 = &sdmmc;
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
+			press-threshold-microvolt = <0>;
+			linux,code = <KEY_SETUP>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&run_led>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	vdd_0v9: regulator-0v9 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_0v9";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+	};
+
+	vcc_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_sys: regulator-5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vcc5v0_usb20_otg1: regulator-5v0-usb20-otg1 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb20_otg1_drv_h>;
+		regulator-name = "vcc5v0_usb20_otg1";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vcc_ddr: regulator-vcc-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_ddr";
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vcc5v0_sys>;
+	};
+};
+
+&fspi {
+	status = "okay";
+
+	spi_nand: flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		bootph-pre-ram;
+		bootph-some-ram;
+		spi-max-frequency = <80000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+	};
+};
+
+&gmac0 {
+	assigned-clocks = <&cru CLK_MAC0>;
+	assigned-clock-rates = <50000000>;
+	phy-handle = <&rmii_phy0>;
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth_rmii0_miim>, <&eth_rmii0_tx_bus2>,
+		    <&eth_rmii0_rx_bus2>, <&eth_rmii0_clk>;
+	clock_in_out = "output";
+	status = "okay";
+};
+
+&gmac1 {
+	assigned-clocks = <&cru CLK_MAC1>;
+	assigned-clock-rates = <50000000>;
+	phy-handle = <&rmii_phy1>;
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth_rmii1_miim>, <&eth_rmii1_tx_bus2>,
+		    <&eth_rmii1_rx_bus2>, <&eth_rmii1_clk>;
+	clock_in_out = "output";
+	status = "okay";
+};
+
+&mdio0 {
+	rmii_phy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rmii0_rstn>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio0 RK_PC2 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&mdio1 {
+	rmii_phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rmii1_rstn>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio1 RK_PC7 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&pinctrl {
+	ethernet {
+		rmii0_rstn: rmii0-rstn {
+			rockchip,pins = <0 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		rmii1_rstn: rmii1-rstn {
+			rockchip,pins = <1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	leds {
+		run_led: run-led {
+			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	sdmmc {
+		sdmmc_det_l: sdmmc-det-l {
+			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	usb {
+		usb20_otg1_drv_h: usb20-otg1-drv-h {
+			rockchip,pins = <1 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdmmc {
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA3 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	no-sdio;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc_bus4>, <&sdmmc_clk>, <&sdmmc_cmd>, <&sdmmc_det_l>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_3v3>;
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.56.1

