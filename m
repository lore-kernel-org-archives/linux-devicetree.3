Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E5B1FC8
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 06:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784357958; cv=none; b=fii6ebmzB1udG5B7MwR6C+mSvfghSvk7DsuY7VwijdZl3AezzpZXpcLAlj57lJfGGXSIH11rpWeWVme29d70oI1AuwzYT2/2ie5vfLB+0o0mutmQq7EK6X4pJCM/y2MakhwkjvjwTnQNPoOdgFHUDldj9OIzfCVSTDBSOiA+lvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784357958; c=relaxed/simple;
	bh=/JaZaggmcU4mM2XMXzeBAAcN8IDacVIt01i6eni4vbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sphbbkMEhfXjGU2mdUACO2Ji6Nqf/0wenYXB94prT7xjeSyrmvC+c7qT70rkBbXa0S2bIJg9wA0q0rK86wfx0TzNAVnccwjTO2RKmbxNewEb8xN/jRXjQbI3cQQTF+cjcCzAqe5r1F47j6hjXO7aSoe+SEA5Ak4Yd5+W1D3z7cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WC6zo1Hn; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WC6zo1Hn"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso5700736a12.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 23:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784357956; x=1784962756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rsOUSUt886TS557j3eLCKb0lOcTAFGL71D/nsvZD1ug=;
        b=WC6zo1HnrP5e6Ye1fHeozS69I7cD8hTuI8NqIIllmdogHqYvj9JpN2gSFvNa4+fLO6
         0xCDilrIzDFYVPJ6OLrdlcVFE9HvHPng7lu8s/eeKG4X8OLCWZS3pl6/hgHzajIEQVN2
         aeHrWhQCkL//w9O3A5HO+zyax/VTPs1E+1mHw35fnpU2SRE1uJOj4bQFjsRyqdEeQt51
         3kiADN3WQHyE5gCab1ptGPLdTX/uzo6p6JYFnjU/U0EDpcErimueOoDMzaHy+1ay2Qm1
         oSxta0AVJQno/rnG0ssn/dHsTIDCv9ILu6jKwHcADGvaNCQ6q1WhdMPyJWZ4m8QR9IPA
         eAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784357956; x=1784962756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rsOUSUt886TS557j3eLCKb0lOcTAFGL71D/nsvZD1ug=;
        b=DNNB1QB9hD15WwvbGFAt8FYUuNOjuvq7GIRHhlhgBfAzRAsnEnpwSEdXpfFrs23ZDy
         3onEeoDVCyjrtzoqFDLNAmX9gfn4niM4eeWYTRLBaUxx6sy67yI/Zj1hVQv3gtBjbQGY
         KcCZQLM+zeI9pdbxfXthUbLuApHs0JaNl9zeMVFFUxhqJjiUW2WdRLRCgk9KX00x6v2b
         2VwLWxFaIYutvSxQgaPKuKDQVN07ZXyTdrpwI7EaITRyA5N7w76JTHUmnxguvq5nPl+a
         Re+X+b1NqR9tFIRggjLPUP5nErD2gr6Dn/hbCth3Jy/Mz7OuJgrLZKbkF9qz6xyUj9ei
         aukA==
X-Gm-Message-State: AOJu0YwRWfo/11nYoNGeguqQtMhiDLhKxWiNZaFaX15sSLPlRjwDCeSQ
	faYDPMxIusC7jjCO/VWe3c6eWQbYAfdEqADDARphtLkK5SBWcILJuedQ
X-Gm-Gg: AfdE7cl3R8PXbrnD9bGwyQqf3OKTX2jrr66tJKBrkO1KrJrZM7VvFd8CzJr9xNEsWNx
	OXxdnUFulX8ruCaKAmVoGAgaZKNnfsp5cyNbELGYBsNcZpqCs2JHP7t920CNDkpQYX682UL9YRS
	J+2zm4KUlpoA9YhU2gWawMxApJppU6bdiGe1OaU8u4Mnl7KnxA5gyPOypQFZ09LwjWV/uMZdl0X
	mp3m1VkdDsR19dgY48/eOJb3qtrTyZ9OOnLdcvhl6zcyzcwoE2wmuuUOLezevdhVWKM9HOdPVen
	4/sjeLYU63MxbmGp8GJx/7rBdugvMFrZxW4l+tA5+ZW5OwBoZkB3vA9UU60dI+yZvtRpzIgZap/
	VXMVeuB+M3cn50hSwR5lnPfALJfbpImJNzkS3RqAs7i2YQx96WmxBj8bNn1Tw2Roo5OeY64fC0K
	0Koy2+XXWsiNLsL7VVH5be
X-Received: by 2002:a05:6a20:72a2:b0:3c0:9c19:65a4 with SMTP id adf61e73a8af0-3c3adaadc22mr6577372637.76.1784357955948;
        Fri, 17 Jul 2026 23:59:15 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bb62sm13426133eec.2.2026.07.17.23.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 23:59:15 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: heiko@sntech.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: rockchip: Add Vicharak Vaaman board
Date: Sat, 18 Jul 2026 12:29:00 +0530
Message-ID: <20260718065900.755631-3-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260718065900.755631-1-hrushirajg23@gmail.com>
References: <20260718065900.755631-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial devicetree support for the Vicharak Vaaman, an RK3399-based
single-board computer.

Supported peripherals:
- RK808 PMIC with core/logic/IO regulators
- SYR827/SYR828 (vdd_cpu_b/vdd_gpu) CPU-big and GPU regulators
- Mali GPU
- Gigabit Ethernet (RGMII, via &gmac)
- eMMC (HS400, enhanced strobe)
- microSD card slot
- SARADC and TSADC
- PWM-based vdd_log regulator
- UART2 serial console

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
Changes in v2:
- Fix fixed-regulator node naming to use 'regulator-[voltage]' prefix
  consistently throughout
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3399-vicharak-vaaman.dts   | 438 ++++++++++++++++++
 2 files changed, 439 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 761d82b4f4f2..e1b974502915 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -90,6 +90,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64-screen.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire-excavator.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-vicharak-vaaman.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-armsom-sige1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-zero2.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts b/arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts
new file mode 100644
index 000000000000..dbf79b996500
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts
@@ -0,0 +1,438 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Vicharak Computers Pvt Ltd
+ */
+
+/dts-v1/;
+#include "rk3399.dtsi"
+
+/ {
+	model = "Vicharak Vaaman";
+	compatible = "vicharak,vaaman", "rockchip,rk3399";
+
+	aliases {
+		ethernet0 = &gmac;
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	clkin_gmac: external-gmac-clock {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clkin_gmac";
+		#clock-cells = <0>;
+	};
+
+	vcc12v_dcin: regulator-dc-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc12v_dcin";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	vcc3v3_lan: regulator-vcc3v3-lan {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_lan";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc3v3_sys>;
+	};
+
+	vcc3v3_sys: regulator-vcc3v3-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_sys: regulator-vcc-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vdd_log: regulator-vdd-log {
+		compatible = "pwm-regulator";
+		pwms = <&pwm2 0 25000 1>;
+		pwm-supply = <&vcc5v0_sys>;
+		regulator-name = "vdd_log";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <1400000>;
+	};
+};
+
+&cpu_l0 {
+	cpu-supply = <&vdd_cpu_l>;
+};
+
+&cpu_l1 {
+	cpu-supply = <&vdd_cpu_l>;
+};
+
+&cpu_l2 {
+	cpu-supply = <&vdd_cpu_l>;
+};
+
+&cpu_l3 {
+	cpu-supply = <&vdd_cpu_l>;
+};
+
+&cpu_b0 {
+	cpu-supply = <&vdd_cpu_b>;
+};
+
+&cpu_b1 {
+	cpu-supply = <&vdd_cpu_b>;
+};
+
+&emmc_phy {
+	rockchip,enable-strobe-pulldown;
+	status = "okay";
+};
+
+&gmac {
+	assigned-clocks = <&cru SCLK_RMII_SRC>;
+	assigned-clock-parents = <&clkin_gmac>;
+	clock_in_out = "input";
+	phy-supply = <&vcc3v3_lan>;
+	/* TX/RX delays tuned for the Vaaman board PCB trace lengths */
+	phy-mode = "rgmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii_pins>;
+	snps,reset-gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
+	snps,reset-active-low;
+	snps,reset-delays-us = <0 10000 50000>;
+	tx_delay = <0x28>;
+	rx_delay = <0x11>;
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu>;
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	i2c-scl-rising-time-ns = <168>;
+	i2c-scl-falling-time-ns = <4>;
+	status = "okay";
+
+	rk808: pmic@1b {
+		compatible = "rockchip,rk808";
+		reg = <0x1b>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <RK_PC5 IRQ_TYPE_LEVEL_LOW>;
+		#clock-cells = <1>;
+		clock-output-names = "xin32k", "rk808-clkout2";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_int_l>;
+		system-power-controller;
+		wakeup-source;
+
+		vcc1-supply = <&vcc5v0_sys>;
+		vcc2-supply = <&vcc5v0_sys>;
+		vcc3-supply = <&vcc5v0_sys>;
+		vcc4-supply = <&vcc5v0_sys>;
+		vcc6-supply = <&vcc5v0_sys>;
+		vcc7-supply = <&vcc5v0_sys>;
+		vcc8-supply = <&vcc3v3_sys>;
+		vcc9-supply = <&vcc5v0_sys>;
+		vcc10-supply = <&vcc5v0_sys>;
+		vcc11-supply = <&vcc5v0_sys>;
+		vcc12-supply = <&vcc3v3_sys>;
+		vddio-supply = <&vcc_3v0>;
+
+		regulators {
+			vdd_center: DCDC_REG1 {
+				regulator-name = "vdd_center";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <900000>;
+				};
+			};
+
+			vdd_cpu_l: DCDC_REG2 {
+				regulator-name = "vdd_cpu_l";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_ddr: DCDC_REG3 {
+				regulator-name = "vcc_ddr";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vcc_1v8: DCDC_REG4 {
+				regulator-name = "vcc_1v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vcca1v8_codec: LDO_REG1 {
+				regulator-name = "vcca1v8_codec";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vcca1v8_hdmi: LDO_REG2 {
+				regulator-name = "vcca1v8_hdmi";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca_1v8: LDO_REG3 {
+				regulator-name = "vcca_1v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vcc_sdio: LDO_REG4 {
+				regulator-name = "vcc_sdio";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3000000>;
+				};
+			};
+
+			vcca3v0_codec: LDO_REG5 {
+				regulator-name = "vcca3v0_codec";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v5: LDO_REG6 {
+				regulator-name = "vcc_1v5";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1500000>;
+				};
+			};
+
+			vcca0v9_hdmi: LDO_REG7 {
+				regulator-name = "vcca0v9_hdmi";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <900000>;
+				};
+			};
+
+			vcc_3v0: LDO_REG8 {
+				regulator-name = "vcc_3v0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3000000>;
+				};
+			};
+
+			vcc_cam: SWITCH_REG1 {
+				regulator-name = "vcc_cam";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_mipi: SWITCH_REG2 {
+				regulator-name = "vcc_mipi";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+
+	vdd_cpu_b: regulator@40 {
+		compatible = "silergy,syr827";
+		reg = <0x40>;
+		fcs,suspend-voltage-selector = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vsel1_pin>;
+		regulator-name = "vdd_cpu_b";
+		regulator-min-microvolt = <712500>;
+		regulator-max-microvolt = <1500000>;
+		regulator-ramp-delay = <1000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vdd_gpu: regulator@41 {
+		compatible = "silergy,syr828";
+		reg = <0x41>;
+		fcs,suspend-voltage-selector = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vsel2_pin>;
+		regulator-name = "vdd_gpu";
+		regulator-min-microvolt = <712500>;
+		regulator-max-microvolt = <1500000>;
+		regulator-ramp-delay = <1000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&io_domains {
+	audio-supply = <&vcca1v8_codec>;
+	bt656-supply = <&vcc_3v0>;
+	gpio1830-supply = <&vcc_3v0>;
+	sdmmc-supply = <&vcc_sdio>;
+	status = "okay";
+};
+
+&pinctrl {
+	pmic {
+		pmic_int_l: pmic-int-l {
+			rockchip,pins =
+				<1 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		vsel1_pin: vsel1-pin {
+			rockchip,pins =
+				<1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		vsel2_pin: vsel2-pin {
+			rockchip,pins =
+				<1 RK_PB6 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+};
+
+&pmu_io_domains {
+	pmu1830-supply = <&vcc_3v0>;
+	status = "okay";
+};
+
+&pwm2 {
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdhci {
+	max-frequency = <150000000>;
+	bus-width = <8>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	non-removable;
+	status = "okay";
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	max-frequency = <150000000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc_clk &sdmmc_cd &sdmmc_cmd &sdmmc_bus4>;
+	status = "okay";
+};
+
+&tsadc {
+	/* tshut mode 0:CRU 1:GPIO */
+	rockchip,hw-tshut-mode = <1>;
+	/* tshut polarity 0:LOW 1:HIGH */
+	rockchip,hw-tshut-polarity = <1>;
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
-- 
2.47.3

