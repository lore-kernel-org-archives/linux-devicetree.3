Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1159637B018
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 12:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780317397; cv=none; b=TXMuYVPFC4sSjKiLQeoYUuREOwR4u8N6TjPMgU0t1r7zQL74d9s5numiDoZFFQOoLWtTftkpvqUCZyMNqFPgFE8vOFehKn+vI+SzkRiUQN0Ji4wHeY6ryUWbv81dTsi6GZxt/LI5alu9Lh5SJOjdE7IF8M52fnSSSbYME7ffsGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780317397; c=relaxed/simple;
	bh=nQXYkWU1nHnC4HFc4Rgo539gkitI7wCY7HOwvuQyErY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D8y42LXFdD4vyb3Ot/RwsioIy1pZP1Y7v9M8twloagmt4zH2ngBy+34eAuyn1HpHSeMZI5TJz8431Ro+qwVPKMLEf+j2vE3gbAEdM7GXQRdaDQbESccpZ9NaaP7GyGB3ak8yRkQsCThYJmNdGbTpGdbfkNhBi7+u0V11Nf0NMgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qeza9Hfn; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qeza9Hfn"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8423f236418so467707b3a.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 05:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780317391; x=1780922191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Imd9/fAtqlasKAzWHBv88+Bca+cbBU97o2xdH6WlKJg=;
        b=Qeza9Hfnj78jqNP1KK2iWXYE3R5EvEyR+ZNcJbunczQvLoBaJEO/ryAkrTXxo5s7RP
         oTeq6DphZNvxkTDlyvQhozOJAAZn+oKrQArkda9dFd5oZkVfoJUmaTfgmUhx062r6oey
         xeos1gjgpg0GHYOsxrikWzea5r4KBhDrXIHrYFqr6MFZnf4T2X1CrP2U8St72zuunxAz
         YYR50HEBNrmN9cfD7uEOHByy7PfQCftWd/gfk33UhVo4GKAXfIvwgJ363aF3vOaAQ9af
         G94gmdjWIEquceOXIz1JCd36J4VymWe+lg/0OiF2zLzVB3Jrtl7ABqX1wR10rG4SJKzC
         UXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780317391; x=1780922191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Imd9/fAtqlasKAzWHBv88+Bca+cbBU97o2xdH6WlKJg=;
        b=DeRfM+bBcDsb052H95ie9f5Jqqo75luoPqi7pCoLkUFo6CGzas4fdxQ5Ac57lOlRRP
         Kb4ANkuihOl7APRf94uzLrOQNCBUnw9XcB9i8DS5E4VQC6ORj77y1NgUpqbrQcIDRI2U
         2MUDl7uZgi9Do8xvTqgemlH8mB6PQ5MX6ktD4NcgvFJyjy84Fr2kvU1xUiXavTFjpWlJ
         fednhTMQfFnl85UGdjGV/qbDMPsGe/dwvCJHST2XtPGPaTqmsq4OqSuH7+mb5tkyexlc
         1VOZ9W9TFwqgJBVK1/or5jqbMb/rmbE2fBrYoo/BuBxpaYcJpE5kmg4CSNtCE81eDu7X
         6Zlg==
X-Forwarded-Encrypted: i=1; AFNElJ8s9yy8zBjbCrrmnGD+ilsXyhI4Ddby2Z3NMtzvD0FDt+hNfIQWm6bmFQZ20OqElzlveoJu1KK89m7D@vger.kernel.org
X-Gm-Message-State: AOJu0YxAL2g1Zyt9uCnJlwDvIw/GrIycRqcWRZi/tyvTJzXGY+BAeoQc
	N1VXowYLaSJuI399Ji4ilbHVHFUAU/qz1ComeI+A8TONkAi+FTo5ZFYX
X-Gm-Gg: Acq92OHq9oQdCOHdJScMblBMB0I1WjJc9L0KiZEzvR+yIZqZ9aCQIYmPZjXLwv7m5BP
	8itvqfmrrAcjaViIbL8E3y9PfvYEjp3BeoOgTLZMIML7Re8Wh+pjq4DavL8ToR17nNGej8inykP
	s5OstlT5YYIizToysI4cg6pSOSOpWWaHsQm4E4h75cg+zQAzqyHPAkMjLEiZASZ/0ISE++Q1qhv
	q7Lg53YYA8M+2UcPj1Xmxp/7tonQdSIwAqZsWrw7JrS0v34KTFeihnumoEAaAFjsFrlTcN01G4q
	GTvc9VH6ePb91gKikxppVi9uAqlYM3lrDY/gF/YVkj1QQDjRS5OVH47/oJP0bKIeXp/ZgSY5nyl
	mCT9MHd0GDTMsVjlCsW7F436Bcrfu3bfjhsAzgJQ7RQbR3+KUPlS7EbjDkr6elgM40baBz0zN2Q
	KkbS52tmTuiq6BVGG3Pd5X+Qi8bnvwXWqDWBq/HTz872tDQTrBW7w=
X-Received: by 2002:a05:6a00:2188:b0:842:21f0:5114 with SMTP id d2e1a72fcca58-84225445d05mr10149469b3a.30.1780317391037;
        Mon, 01 Jun 2026 05:36:31 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8424defc024sm3765997b3a.47.2026.06.01.05.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:36:29 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 1/1] arm64: dts: rockchip: add Vicharak Axon board
Date: Mon,  1 Jun 2026 18:06:03 +0530
Message-ID: <20260601123603.129679-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601123603.129679-1-hrushirajg23@gmail.com>
References: <20260601123603.129679-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Vicharak Axon single-board computer based on
the Rockchip RK3588 SoC.

The board supports:

- eMMC storage
- microSD card
- Gigabit Ethernet
- HDMI output (dual HDMI)
- HDMI input
- USB 2.0 host ports
- PCIe 2.0 slots
- PCIe 3.0 x4 slot
- SATA
- RTC
- Status LEDs

The board uses an RK806 PMIC and provides the regulators required by
the RK3588 SoC.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile        |    1 +
 arch/arm64/boot/dts/rockchip/rk3588-axon.dts | 1069 ++++++++++++++++++
 2 files changed, 1070 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-axon.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index cb55c6b70d0e..503927ffa849 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -179,6 +179,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3582-radxa-e52c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-sige7.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-w3.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-axon.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-coolpi-cm5-evb.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-coolpi-cm5-genbook.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-io.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-axon.dts b/arch/arm64/boot/dts/rockchip/rk3588-axon.dts
new file mode 100644
index 000000000000..dcab9462f51b
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-axon.dts
@@ -0,0 +1,1069 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/usb/pd.h>
+#include "rk3588.dtsi"
+
+/ {
+	model = "Vicharak Axon";
+	compatible = "vicharak,axon", "rockchip,rk3588";
+
+	aliases {
+		mmc0 = &sdmmc;
+		mmc1 = &sdhci;
+		mmc2 = &sdio;
+		serial2 = &uart2;
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	hdmi0-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi0_con_in: endpoint {
+				remote-endpoint = <&hdmi0_out_con>;
+			};
+		};
+	};
+
+	hdmi1-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi1_con_in: endpoint {
+				remote-endpoint = <&hdmi1_out_con>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		status = "okay";
+
+		power_led: power-led {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&pca9554 0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		status_led: status-led {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&pca9554 1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "none";
+		};
+	};
+
+	pcie20_avdd0v85: pcie20-avdd0v85-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "pcie20_avdd0v85";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <850000>;
+		regulator-max-microvolt = <850000>;
+		vin-supply = <&vdd_0v75_s0>;
+	};
+
+	pcie20_avdd1v8: pcie20-avdd1v8-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "pcie20_avdd1v8";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&avcc_1v8_s0>;
+	};
+
+	pcie30_avdd0v75: pcie30-avdd0v75-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "pcie30_avdd0v75";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <750000>;
+		regulator-max-microvolt = <750000>;
+		vin-supply = <&vdd_0v75_s0>;
+	};
+
+	pcie30_avdd1v8: pcie30-avdd1v8-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "pcie30_avdd1v8";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&avcc_1v8_s0>;
+	};
+
+	sata_vcc_5v0: sata-vcc-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "sata_vcc_5v0";
+		startup-delay-us = <5000>;
+		regulator-boot-on;
+		regulator-always-on;
+		enable-active-high;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&hym8563>;
+		clock-names = "ext_clock";
+		pinctrl-names = "default";
+		pinctrl-0 = <&sdio_reset_wifi>;
+		reset-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
+		status = "okay";
+	};
+
+	vcc0_4v0: vcc4v0_sys: vcc0-4v0-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc0_4v0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc12v_dcin: vcc12v-dcin-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc12v_dcin";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	vcc3v3_io_expander: vcc3v3-io-expander {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_io_expander";
+		regulator-boot-on;
+		regulator-always-on;
+		enable-active-high;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	vcc3v3_pcie20_sata30: vcc3v3-pcie20-sata30 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_pcie20_sata30";
+		regulator-boot-on;
+		regulator-always-on;
+		enable-active-high;
+		gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc3v3_pcie30: vcc3v3-pcie30 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_pcie30";
+		regulator-boot-on;
+		regulator-always-on;
+		enable-active-high;
+		gpios = <&gpio0 RK_PB2 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc5v0_sys: vcc1-5v0-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc5v0_usb20_host: vcc5v0-usb20-host-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_usb20_host";
+		regulator-boot-on;
+		regulator-always-on;
+		enable-active-high;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_1v1_nldo_s3: vcc-1v1-nldo-s3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v1_nldo_s3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+};
+
+
+&combphy0_ps {
+	status = "okay";
+};
+
+&combphy1_ps {
+	status = "okay";
+};
+
+&combphy2_psu {
+	status = "okay";
+};
+
+&cpu_b0 {
+	cpu-supply = <&vdd_cpu_big0_s0>;
+	mem-supply = <&vdd_cpu_big0_mem_s0>;
+};
+
+&cpu_b1 {
+	cpu-supply = <&vdd_cpu_big0_s0>;
+	mem-supply = <&vdd_cpu_big0_mem_s0>;
+};
+
+&cpu_b2 {
+	cpu-supply = <&vdd_cpu_big1_s0>;
+	mem-supply = <&vdd_cpu_big1_mem_s0>;
+};
+
+&cpu_b3 {
+	cpu-supply = <&vdd_cpu_big1_s0>;
+	mem-supply = <&vdd_cpu_big1_mem_s0>;
+};
+
+&cpu_l0 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+	mem-supply = <&vdd_cpu_lit_mem_s0>;
+};
+
+&cpu_l1 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+	mem-supply = <&vdd_cpu_lit_mem_s0>;
+};
+
+&cpu_l2 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+	mem-supply = <&vdd_cpu_lit_mem_s0>;
+};
+
+&cpu_l3 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+	mem-supply = <&vdd_cpu_lit_mem_s0>;
+};
+
+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy>;
+	phy-mode = "rgmii-rxid";
+	phy-supply = <&vcc_3v3_s3>;
+	pinctrl-0 = <&gmac1_rgmii_bus
+				&gmac1_rgmii_clk
+				&gmac1_rx_bus2
+				&gmac1_tx_bus2
+				&gmac1_miim>;
+	pinctrl-names = "default";
+	snps,reset-active-low;
+	snps,reset-delays-us = <0 20000 100000>;
+	snps,reset-gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
+	rx_delay = <0x00>;
+	tx_delay = <0x43>;
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu_s0>;
+	status = "okay";
+};
+
+&hdmi0 {
+	enable-gpios = <&gpio1 RK_PB0 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&hdmi0_in {
+	hdmi0_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi0>;
+	};
+};
+
+&hdmi0_out {
+	hdmi0_out_con: endpoint {
+		remote-endpoint = <&hdmi0_con_in>;
+	};
+};
+
+&hdmi0_sound {
+	status = "okay";
+};
+
+&hdmi1 {
+	enable-gpios = <&gpio1 RK_PA7 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&hdmi1_in {
+	hdmi1_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_hdmi1>;
+	};
+};
+
+&hdmi1_out {
+	hdmi1_out_con: endpoint {
+		remote-endpoint = <&hdmi1_con_in>;
+	};
+};
+
+&hdmi1_sound {
+	status = "okay";
+};
+
+&hdmi_receiver {
+	pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_hpd>;
+	pinctrl-names = "default";
+	hpd-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&hdmi_receiver_cma {
+	status = "okay";
+};
+
+&hdptxphy0 {
+	status = "okay";
+};
+
+&hdptxphy1 {
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-0 = <&i2c0m2_xfer>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	vdd_cpu_big0_s0: vdd_cpu_big0_mem_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		fcs,suspend-voltage-selector = <1>;
+		reg = <0x42>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-compatible = "rk860x-reg";
+		regulator-max-microvolt = <1050000>;
+		regulator-min-microvolt = <550000>;
+		regulator-name = "vdd_cpu_big0_s0";
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vdd_cpu_big1_s0: vdd_cpu_big1_mem_s0: regulator@43 {
+		compatible = "rockchip,rk8603", "rockchip,rk8602";
+		fcs,suspend-voltage-selector = <1>;
+		reg = <0x43>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-compatible = "rk860x-reg";
+		regulator-max-microvolt = <1050000>;
+		regulator-min-microvolt = <550000>;
+		regulator-name = "vdd_cpu_big1_s0";
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	hym8563: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		clock-output-names = "hym8563";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtc_int>;
+		wakeup-source;
+		status = "okay";
+	};
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1m2_xfer>;
+	status = "okay";
+
+	vdd_npu_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_npu_s0";
+		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <950000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3m0_xfer>;
+	status = "okay";
+
+	es8388: audio-codec@11 {
+		compatible = "everest,es8388";
+		reg = <0x11>;
+		clocks = <&cru I2S0_8CH_MCLKOUT>;
+		clock-names = "mclk";
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
+		assigned-clock-rates = <12288000>;
+		DVDD-supply = <&vcc_1v8_s0>;
+		AVDD-supply = <&vcc_3v3_s0>;
+		PVDD-supply = <&vcc_1v8_s0>;
+		HPVDD-supply = <&vcc_3v3_s0>;
+		#sound-dai-cells = <0>;
+	};
+};
+
+&i2c6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c6m0_xfer>;
+	status = "okay";
+
+	pca9554: gpio@24 {
+		compatible = "nxp,pca9554";
+		#gpio-cells = <2>;
+		gpio-controller;
+		reg = <0x24>;
+		vcc-supply = <&vcc3v3_io_expander>;
+		status = "okay";
+	};
+};
+
+&sdhci {
+	bus-width = <8>;
+	full-pwr-cycle-in-suspend;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	no-sd;
+	no-sdio;
+	non-removable;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vcc_1v8_s3>;
+	status = "okay";
+};
+
+&sdio {
+	max-frequency = <150000000>;
+	no-sd;
+	no-mmc;
+	bus-width = <4>;
+	disable-wp;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdiom0_pins>;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vcc_1v8_s3>;
+	status = "okay";
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	max-frequency = <200000000>;
+	no-mmc;
+	no-sdio;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vccio_sd_s0>;
+	status = "okay";
+};
+
+&spi2 {
+	assigned-clock-rates = <200000000>;
+	assigned-clocks = <&cru CLK_SPI2>;
+	num-cs = <1>;
+	pinctrl-0 = <&spi2m2_cs0 &spi2m2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	pmic@0 {
+		reg = <0>;
+		compatible = "rockchip,rk806";
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-parent = <&gpio0>;
+		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default", "pmic-power-off";
+		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
+					<&rk806_dvs2_null>, <&rk806_dvs3_null>;
+		pinctrl-1 = <&rk806_dvs1_pwrdn>;
+		spi-max-frequency = <1000000>;
+
+		vcc1-supply = <&vcc5v0_sys>;
+		vcc2-supply = <&vcc5v0_sys>;
+		vcc3-supply = <&vcc5v0_sys>;
+		vcc4-supply = <&vcc5v0_sys>;
+		vcc5-supply = <&vcc5v0_sys>;
+		vcc6-supply = <&vcc5v0_sys>;
+		vcc7-supply = <&vcc5v0_sys>;
+		vcc8-supply = <&vcc5v0_sys>;
+		vcc9-supply = <&vcc5v0_sys>;
+		vcc10-supply = <&vcc5v0_sys>;
+		vcc11-supply = <&vcc_2v0_pldo_s3>;
+		vcc12-supply = <&vcc5v0_sys>;
+		vcc13-supply = <&vcc_1v1_nldo_s3>;
+		vcc14-supply = <&vcc_1v1_nldo_s3>;
+		vcca-supply = <&vcc5v0_sys>;
+
+		rk806_dvs1_null: rk806_dvs1_null {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs1_slp: rk806_dvs1_slp {
+			pins = "gpio_pwrctrl1";
+			function = "pin_fun1";
+		};
+
+		rk806_dvs1_pwrdn: rk806_dvs1_pwrdn {
+			pins = "gpio_pwrctrl1";
+			function = "pin_fun2";
+		};
+
+		rk806_dvs1_rst: rk806_dvs1_rst {
+			pins = "gpio_pwrctrl1";
+			function = "pin_fun3";
+		};
+
+		rk806_dvs2_null: rk806_dvs2_null {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs2_slp: rk806_dvs2_slp {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun1";
+		};
+
+		rk806_dvs2_pwrdn: rk806_dvs2_pwrdn {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun2";
+		};
+
+		rk806_dvs2_rst: rk806_dvs2_rst {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun3";
+		};
+
+		rk806_dvs2_dvs: rk806_dvs2_dvs {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun4";
+		};
+
+		rk806_dvs2_gpio: rk806_dvs2_gpio {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun5";
+		};
+
+		rk806_dvs3_null: rk806_dvs3_null {
+			pins = "gpio_pwrctrl3";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs3_slp: rk806_dvs3_slp {
+			pins = "gpio_pwrctrl3";
+			function = "pin_fun1";
+		};
+
+		rk806_dvs3_pwrdn: rk806_dvs3_pwrdn {
+			pins = "gpio_pwrctrl3";
+			function = "pin_fun2";
+		};
+
+		rk806_dvs3_rst: rk806_dvs3_rst {
+			pins = "gpio_pwrctrl3";
+			function = "pin_fun3";
+		};
+
+		rk806_dvs3_dvs: rk806_dvs3_dvs {
+			pins = "gpio_pwrctrl3";
+			function = "pin_fun4";
+		};
+
+		rk806_dvs3_gpio: rk806_dvs3_gpio {
+			pins = "gpio_pwrctrl3";
+			function = "pin_fun5";
+		};
+
+		regulators {
+			vdd_gpu_s0: dcdc-reg1 {
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_gpu_s0";
+				regulator-enable-ramp-delay = <400>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_cpu_lit_s0: vdd_cpu_lit_mem_s0: dcdc-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_cpu_lit_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_log_s0: dcdc-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <675000>;
+				regulator-max-microvolt = <750000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_log_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <750000>;
+				};
+			};
+
+			vdd_vdenc_s0: dcdc-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-init-microvolt = <750000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_vdenc_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_ddr_s0: dcdc-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <675000>;
+				regulator-max-microvolt = <900000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_ddr_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <850000>;
+				};
+			};
+
+			vdd2_ddr_s3: dcdc-reg6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vdd2_ddr_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vcc_2v0_pldo_s3: dcdc-reg7 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <2000000>;
+				regulator-max-microvolt = <2000000>;
+				regulator-name = "vdd_2v0_pldo_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <2000000>;
+				};
+			};
+
+			vcc_3v3_s3: dcdc-reg8 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc_3v3_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vddq_ddr_s0: dcdc-reg9 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vddq_ddr_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8_s3: dcdc-reg10 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc_1v8_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			avcc_1v8_s0: pldo-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "avcc_1v8_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8_s0: pldo-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc_1v8_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			avdd_1v2_s0: pldo-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-name = "avdd_1v2_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_3v3_s0: pldo-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc_3v3_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd_s0: pldo-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vccio_sd_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			pldo6_s3: pldo-reg6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "pldo6_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vdd_0v75_s3: nldo-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
+				regulator-name = "vdd_0v75_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <750000>;
+				};
+			};
+
+			vdd_ddr_pll_s0: nldo-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-name = "vdd_ddr_pll_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <850000>;
+				};
+			};
+
+			avdd_0v75_s0: nldo-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <837500>;
+				regulator-max-microvolt = <837500>;
+				regulator-name = "avdd_0v75_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_0v85_s0: nldo-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-name = "vdd_0v85_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_0v75_s0: nldo-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
+				regulator-name = "vdd_0v75_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+};
+
+&mdio1 {
+	rgmii_phy: phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x1>;
+	};
+};
+
+&pcie2x1l0 {
+	reset-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_0_rst>;
+	status = "okay";
+};
+
+&pcie2x1l1 {
+	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_1_rst>;
+	status = "okay";
+};
+
+&pcie2x1l2 {
+	status = "disabled";
+};
+
+&pcie30phy {
+	status = "okay";
+};
+
+&pcie3x4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie3_reset>;
+	reset-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&pinctrl {
+
+	hdmirx {
+		hdmirx_hpd: hdmirx-5v-detection {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+
+	hym8563 {
+		rtc_int: rtc-int {
+			rockchip,pins =
+				<0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pcie2 {
+		pcie2_0_rst: pcie2-0-rst {
+			rockchip,pins =
+				<4 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		pcie2_1_rst: pcie2-1-rst {
+			rockchip,pins =
+				<4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pcie3 {
+		pcie3_reset: pcie3-reset {
+			rockchip,pins =
+				<4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wireless-wlan {
+		sdio_reset_wifi: sdio-reset-wifi {
+			rockchip,pins =
+				<4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+};
+
+&saradc {
+	vref-supply = <&avcc_1v8_s0>;
+	status = "okay";
+};
+
+&sata0 {
+	status = "okay";
+};
+
+&tsadc {
+	status = "okay";
+};
+
+&u2phy0 {
+	status = "okay";
+};
+
+&u2phy0_otg {
+	status = "okay";
+};
+
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	status = "okay";
+};
+
+&u2phy2 {
+	status = "okay";
+};
+
+&u2phy2_host {
+	phy-supply = <&vcc5v0_usb20_host>;
+	status = "okay";
+};
+
+&u2phy3 {
+	status = "okay";
+};
+
+&u2phy3_host {
+	phy-supply = <&vcc5v0_usb20_host>;
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2m0_xfer>;
+	status = "okay";
+};
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi0_in_vp0>;
+	};
+};
+
+&vp1 {
+	vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI1>;
+		remote-endpoint = <&hdmi1_in_vp1>;
+	};
+};
-- 
2.47.3

