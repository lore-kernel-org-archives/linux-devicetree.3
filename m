Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB7F427A06
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687828; cv=none; b=HUWdBEe90YFBxRVhrpBHaQZ2LmKkHbXbmjzBbkuw3eqbCxlHgQ4FtRRtME34xTqD/aDP0nCKanqy9sj3Qpwxilme/D1JboBlnoftrVIBnKEa/v2Bh57TSYYg9Y/jja4lSSGamHJjGSBz5QtnZaXrwZnZ9VRMgdB6xBRDqGMiD2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687828; c=relaxed/simple;
	bh=Kl62jHuUaelFOEPIWYxJuz+Ii2qpiFS/Z0CqGlkVdEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZSczsII1XvVzCQS9muMCMg9ahaMa2g9EENmEuAVtzAcuQ5oqP3P6VFRhO8DGO6qOYXQAXhyAXmyxhYBMDEtyRNJgXrwYXKtNb5OCOstZusnOYn9j1jmD5c8FMdsCdDuQZMSt44Pllohyu7pYfiCrkG9QxBX2PAwsiFJ+hFje2kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJBfE9Gj; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJBfE9Gj"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-470174001a0so605402f8f.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 05:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783687825; x=1784292625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zq7WT6pb2hCIlufQNlz/a478iuvERh6JuHMOfy/4F6w=;
        b=hJBfE9Gj+3ZlMKQtSbsBwv/DgSLg9v013Lwvv6s8ggP4hPelJgWALmzo0OKByHpWa0
         YEbVYUXHrjvdHETL6JFX5kIMq166Yfr3hmcyWYBMm99mfMvjTwl8gSbeiHEd/FBh/18U
         T/4iKPu1jjCVyvldBJNOqYXaCAyTQKJQyi1Rq4ZL1QHB1eJd2J82aF1tHxKTNERBNJf8
         B4cwbL1Rsw1BTYTPyoPnHdsAIRNpbY/QkLw9RmTv4QseM8qRnE9F3G+StCRkaAgYQqvh
         TBYqyRP78cAkZ78trcvcsPdo7ZS/7i6dQn3TEgNHX2zaxbv7MUaTp2gON2cC+DGk6Nx/
         SwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687825; x=1784292625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zq7WT6pb2hCIlufQNlz/a478iuvERh6JuHMOfy/4F6w=;
        b=YFmuQeaMXAGPR23yoIM/h7UlduNEQJIbDRkp5/lDkhHWO9ukDvjsztlZbMdFNOC5L4
         Kpef1uiS1LbrSgFPo6T2R98eiytCiPbdiMcZlXphIqp98Nkem/xuOfZa9wt3qZNFh6nN
         1GSoHKz/MraaWxGw7ah0K2Xv8xu5ctvEFjRD0EDa4gzUoMnshL2TWHMcgKlVxqDeIVW4
         iIg7k5HCkKdQzAztSWbEmToO04Wf8ZRx0yQHqokK1ipJzRFpJShuLsgEVg55/tTA/TDG
         CddaHRnIFYaxaDw9xCm5xM/GfOwbi4SnLUXwy8r7pJ6znAsLOTcIjlxbQAqOTs5a2lK6
         DjIQ==
X-Forwarded-Encrypted: i=1; AHgh+RoajR8xRbA1VLbtlemoN7LyzDNWq+5uFT/CJDl1SzfSg0XLTBbLMLfEBtWec61WsJ8NwE7rdz3nJvUV@vger.kernel.org
X-Gm-Message-State: AOJu0YxYxJBNmyVVGCqJ1NkLjr3WlBKSDte9kTsfqFxAd7ifS7JAv62p
	iaYhm7fB2ZfeQkdGGai+vwOmqNrLy9GtXF6Td0xCIiihnsSirlhkiQU5
X-Gm-Gg: AfdE7cmUKNKZ1c3y/3RsazJ/oOnYWGsK7/OZOxxvUFWCrw++SuaXFXNGkUu/2/pP/L+
	yD57DPggUkpPj6bEGMxCr9zJyC5AcYUbPBCEDjiYbSH+OPuOVP9w50NH8jyigrYTZq8Cx06VW+Z
	hBD279P6JEsdk4zU9j2w5XgJUDYWO0KiBqSnNExeMFYGQLA2R4BaqTKaXT+V0q3gVR74GuQwFM+
	z9ob2pKbvQPVPFqQMQ7P1yOmlcNVWMUIcLApKuFcx6w11hvGuQlNLhTLFILN1H99oW8Vmz8Dk5q
	eDpcnPZsic3Qy/JebdIx9NwZlW/Jvhk9yj/PL2MNzLdryIvMhbDYDkRxtzrGjDMbCxG00pLCGdb
	YqMvXLvHrscNhmhdrHxDz5UEldu+5p5Onyzz0aOT1sZVkDf10/+Mbht+Wx9v0sg6jPihugeMOBx
	YjGP4tSFl+Wiba1GOk6vcvpzycvTcic/GJBbOL1RPWTWZ0+ntkmIj8
X-Received: by 2002:a05:6000:24c2:b0:47d:dfea:f733 with SMTP id ffacd0b85a97d-47df07a1f1cmr12652338f8f.3.1783687824499;
        Fri, 10 Jul 2026 05:50:24 -0700 (PDT)
Received: from GLaDOS.station ([185.81.127.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm61218665f8f.26.2026.07.10.05.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:50:24 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH v2 2/3] arm64: dts: ti: Add support for Variscite VAR-SOM-AM62
Date: Fri, 10 Jul 2026 14:50:16 +0200
Message-ID: <5101905e5f99332557500447b0b7ad40e75c15f9.1783687321.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783687321.git.stefano.r@variscite.com>
References: <cover.1783687321.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite VAR-SOM-AM62 system on module.
This SOM is designed to be used with various carrier boards.

The module includes:
- AM62x Sitara MPU processor
- Up to 4GB of DDR4-3733 memory
- Up to 128GB eMMC storage memory
- Integrated 10/100/1000 Mbps Ethernet Transceiver Analog Devices
- Audio codec wm8904
- Resistive touch panel interface controller
- I2C, UART and SPI interfaces
- Bluetooth 5.2 + WiFi single or dual band

Only SOM-specific peripherals are enabled by default. Carrier board
specific interfaces are left disabled to be enabled in the respective
carrier board device trees.

Link: https://variscite.com/system-on-module-som/ti-sitara-am62x/var-som-am62/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Fix AM62X_MCU_IOPAD macro
 - Fix OPP table comment
 - Remove reg_vdd_mmc2 regulator

 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi | 487 +++++++++++++++++++
 1 file changed, 487 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi
new file mode 100644
index 000000000000..08afe751e4d6
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi
@@ -0,0 +1,487 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Common dtsi for Variscite VAR-SOM-AM62
+ *
+ * Link: https://variscite.com/system-on-module-som/ti-sitara-am62x/var-som-am62/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ * Copyright (C) 2026 Stefano Radaelli <stefano.r@variscite.com>
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pwm/pwm.h>
+#include "k3-am625.dtsi"
+
+/ {
+	compatible = "variscite,var-som-am62", "ti,am625";
+
+	memory@80000000 {
+		/* 2G RAM */
+		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
+		device_type = "memory";
+		bootph-pre-ram;
+	};
+
+	mmc_pwrseq: mmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mmc_pwrseq>;
+		reset-gpios = <&main_gpio0 49 GPIO_ACTIVE_LOW>;
+	};
+
+	opp-table {
+		/* Add 1.4GHz OPP. Requires VDD_CORE to be at 0.85V */
+		opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-supported-hw = <0x01 0x0004>;
+			clock-latency-ns = <6000000>;
+		};
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ramoops@9ca00000 {
+			compatible = "ramoops";
+			reg = <0x00 0x9ca00000 0x00 0x00100000>;
+			record-size = <0x8000>;
+			console-size = <0x8000>;
+			ftrace-size = <0x00>;
+			pmsg-size = <0x8000>;
+		};
+
+		/* global cma region */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x00 0x8000000>;
+			linux,cma-default;
+		};
+
+		rtos_ipc_memory_region: rtos-ipc-memory@9b500000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9b500000 0x00 0x00300000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dma_memory_region: memory@9da00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9da00000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_memory_region: memory@9db00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9db00000 0x00 0xc00000>;
+			no-map;
+		};
+
+		secure_tfa_ddr: tfa@9e780000 {
+			reg = <0x00 0x9e780000 0x00 0x80000>;
+			alignment = <0x1000>;
+			no-map;
+		};
+
+		secure_ddr: optee@9e800000 {
+			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
+			alignment = <0x1000>;
+			no-map;
+		};
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "On-module +V1.8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&reg_3v3>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "On-module +V3.3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	reg_3v3_phy: regulator-3v3-phy {
+		compatible = "regulator-fixed";
+		regulator-name = "On-module +V3.3_PHY";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_eth_phy>;
+		gpios = <&main_gpio0 45 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "dsp_b";
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,name = "wm8904-audio";
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"IN1L", "Microphone Jack",
+			"IN1R", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&mcasp1>;
+		};
+	};
+};
+
+&cpsw3g {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1>;
+	status = "okay";
+};
+
+&cpsw3g_mdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mdio1>;
+	status = "okay";
+
+	cpsw3g_phy0: ethernet-phy@4 {
+		compatible = "ethernet-phy-id0283.bc30";
+		reg = <4>;
+		bootph-all;
+		reset-gpios = <&main_gpio0 46 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <20000>;
+	};
+};
+
+&cpsw_port1 {
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&cpsw3g_phy0>;
+	status = "okay";
+};
+
+&main_i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	wm8904: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&audio_refclk1>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_1v8>;
+		CPVDD-supply = <&reg_1v8>;
+		DBVDD-supply = <&reg_3v3>;
+		DCVDD-supply = <&reg_1v8>;
+		MICVDD-supply = <&reg_1v8>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+		/* GPIO1 = DMIC_CLK, don't touch others */
+		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+	};
+};
+
+&main_i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&main_pmx0 {
+	pinctrl_i2c2: main-i2c2-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0b0, PIN_INPUT_PULLUP, 1) /* (K22) GPMC0_CSn2.I2C2_SCL */
+			AM62X_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24) GPMC0_CSn3.I2C2_SDA */
+		>;
+	};
+
+	pinctrl_i2c3: main-i2c3-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01d0, PIN_INPUT, 2) /* (A15) UART0_CTSn.I2C3_SCL */
+			AM62X_IOPAD(0x01d4, PIN_INPUT, 2) /* (B15) UART0_RTSn.I2C3_SDA */
+		>;
+	};
+
+	pinctrl_mcasp1: main-mcasp1-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0090, PIN_INPUT, 2) /* (M24) GPMC0_BE0N_CLE.MCASP1_ACLKX */
+			AM62X_IOPAD(0x0098, PIN_INPUT, 2) /* (U23) GPMC0_WAIT0.MCASP1_AFSX */
+			AM62X_IOPAD(0x008c, PIN_OUTPUT, 2) /* (L25) GPMC0_WEN.MCASP1_AXR0 */
+			AM62X_IOPAD(0x0084, PIN_INPUT, 2) /* (L23) GPMC0_ADVN_ALE.MCASP1_AXR2 */
+			AM62X_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (K25) GPMC0_WPn.AUDIO_EXT_REFCLK1 */
+		>;
+	};
+
+	pinctrl_mdio1: main-mdio1-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x160, PIN_INPUT, 0) /* (AD24) MDIO0_MDC */
+			AM62X_IOPAD(0x15c, PIN_INPUT, 0) /* (AB22) MDIO0_MDIO */
+		>;
+	};
+
+	pinctrl_mmc_pwrseq: pinmux-mmc-pwrseq-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x00c8, PIN_OUTPUT, 7) /* (Y25) VOUT0_DATA4.GPIO0_49 */
+		>;
+	};
+
+	pinctrl_mmc0: main-mmc0-default-pins {
+		bootph-all;
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
+			AM62X_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
+			AM62X_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
+			AM62X_IOPAD(0x210, PIN_INPUT, 0) /* (AA1) MMC0_DAT1 */
+			AM62X_IOPAD(0x20c, PIN_INPUT, 0) /* (AA3) MMC0_DAT2 */
+			AM62X_IOPAD(0x208, PIN_INPUT, 0) /* (Y4) MMC0_DAT3 */
+			AM62X_IOPAD(0x204, PIN_INPUT, 0) /* (AB2) MMC0_DAT4 */
+			AM62X_IOPAD(0x200, PIN_INPUT, 0) /* (AC1) MMC0_DAT5 */
+			AM62X_IOPAD(0x1fc, PIN_INPUT, 0) /* (AD2) MMC0_DAT6 */
+			AM62X_IOPAD(0x1f8, PIN_INPUT, 0) /* (AC2) MMC0_DAT7 */
+		>;
+	};
+
+	pinctrl_mmc2: main-mmc2-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x120, PIN_INPUT_PULLUP, 0) /* (C24) MMC2_CMD */
+			AM62X_IOPAD(0x118, PIN_INPUT_PULLDOWN, 0) /* (D25) MMC2_CLK */
+			AM62X_IOPAD(0x114, PIN_INPUT_PULLUP, 0) /* (B24) MMC2_DAT0 */
+			AM62X_IOPAD(0x110, PIN_INPUT_PULLUP, 0) /* (C25) MMC2_DAT1 */
+			AM62X_IOPAD(0x10c, PIN_INPUT_PULLUP, 0) /* (E23) MMC2_DAT2 */
+			AM62X_IOPAD(0x108, PIN_INPUT_PULLUP, 0) /* (D24) MMC2_DAT3 */
+			AM62X_IOPAD(0x11c, PIN_INPUT_PULLUP, 0) /* (#N/A) MMC2_CLKB */
+		>;
+	};
+
+	pinctrl_restouch: main-restouch-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x00c4, PIN_INPUT_PULLUP, 7) /* (W24) VOUT0_DATA3.GPIO0_48 */
+		>;
+	};
+
+	pinctrl_rgmii1: main-rgmii1-default-pins {
+		bootph-all;
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x14c, PIN_INPUT, 0) /* (AB17) RGMII1_RD0 */
+			AM62X_IOPAD(0x150, PIN_INPUT, 0) /* (AC17) RGMII1_RD1 */
+			AM62X_IOPAD(0x154, PIN_INPUT, 0) /* (AB16) RGMII1_RD2 */
+			AM62X_IOPAD(0x158, PIN_INPUT, 0) /* (AA15) RGMII1_RD3 */
+			AM62X_IOPAD(0x148, PIN_INPUT, 0) /* (AD17) RGMII1_RXC */
+			AM62X_IOPAD(0x144, PIN_INPUT, 0) /* (AE17) RGMII1_RX_CTL */
+			AM62X_IOPAD(0x134, PIN_INPUT, 0) /* (AE20) RGMII1_TD0 */
+			AM62X_IOPAD(0x138, PIN_INPUT, 0) /* (AD20) RGMII1_TD1 */
+			AM62X_IOPAD(0x13c, PIN_INPUT, 0) /* (AE18) RGMII1_TD2 */
+			AM62X_IOPAD(0x140, PIN_INPUT, 0) /* (AD18) RGMII1_TD3 */
+			AM62X_IOPAD(0x130, PIN_INPUT, 0) /* (AE19) RGMII1_TXC */
+			AM62X_IOPAD(0x12c, PIN_INPUT, 0) /* (AD19) RGMII1_TX_CTL */
+			AM62X_IOPAD(0x00bc, PIN_INPUT, 7) /* (V24) VOUT0_DATA1.GPIO0_46 */
+		>;
+	};
+
+	pinctrl_eth_phy: main-eth-phy-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x00b8, PIN_INPUT, 7) /* (U22) VOUT0_DATA0.GPIO0_45 */
+		>;
+	};
+
+	pinctrl_spi0: main-spi0-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01bc, PIN_OUTPUT, 0) /* (A14) SPI0_CLK */
+			AM62X_IOPAD(0x01b4, PIN_OUTPUT, 0) /* (A13) SPI0_CS0 */
+			AM62X_IOPAD(0x01c0, PIN_OUTPUT, 0) /* (B13) SPI0_D0 */
+			AM62X_IOPAD(0x01c4, PIN_INPUT, 0) /* (B14) SPI0_D1 */
+		>;
+	};
+
+	pinctrl_uart5: main-uart5-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x00ec, PIN_INPUT, 4) /* (AA24) VOUT0_DATA13.UART5_CTSn */
+			AM62X_IOPAD(0x00e8, PIN_OUTPUT, 4) /* (AB25) VOUT0_DATA12.UART5_RTSn */
+			AM62X_IOPAD(0x00d0, PIN_INPUT, 4) /* (Y23) VOUT0_DATA6.UART5_RXD */
+			AM62X_IOPAD(0x00d4, PIN_OUTPUT, 4) /* (AA25) VOUT0_DATA7.UART5_TXD */
+		>;
+	};
+
+	pinctrl_vdd_mmc2: main-vdd-mmc2-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x00d8, PIN_INPUT, 7) /* (V21) VOUT0_DATA8.GPIO0_53 */
+			AM62X_IOPAD(0x00dc, PIN_INPUT, 7) /* (W21) VOUT0_DATA9.GPIO0_54 */
+			AM62X_IOPAD(0x00f0, PIN_INPUT, 7) /* (Y22) VOUT0_DATA14.GPIO0_59 */
+			AM62X_IOPAD(0x00f4, PIN_INPUT, 7) /* (AA21) VOUT0_DATA15.GPIO0_60 */
+		>;
+	};
+};
+
+&mcu_pmx0 {
+	pinctrl_wkup_clkout0: wkup-clkout0-default-pins {
+		pinctrl-single,pins = <
+			AM62X_MCU_IOPAD(0x0084, PIN_OUTPUT, 0) /* (F13) WKUP_CLKOUT0 */
+		>;
+	};
+};
+
+&main_spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi0>;
+	ti,pindir-d0-out-d1-in;
+	status = "okay";
+
+	/* Resistive touch controller */
+	ads7846: touchscreen@0 {
+		compatible = "ti,ads7846";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_restouch>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <48 IRQ_TYPE_EDGE_FALLING>;
+		spi-max-frequency = <1500000>;
+		pendown-gpio = <&main_gpio0 48 GPIO_ACTIVE_LOW>;
+		ti,x-min = /bits/ 16 <125>;
+		ti,x-max = /bits/ 16 <4008>;
+		ti,y-min = /bits/ 16 <282>;
+		ti,y-max = /bits/ 16 <3864>;
+		ti,x-plate-ohms = /bits/ 16 <180>;
+		ti,pressure-max = /bits/ 16 <255>;
+		ti,debounce-max = /bits/ 16 <10>;
+		ti,debounce-tol = /bits/ 16 <3>;
+		ti,debounce-rep = /bits/ 16 <1>;
+		ti,settle-delay-usec = /bits/ 16 <150>;
+		ti,keep-vref-on;
+		wakeup-source;
+	};
+};
+
+&main_uart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart5>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&mcasp1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mcasp1>;
+	op-mode = <0>;  /* MCASP_IIS_MODE */
+	serial-dir = <  /* 0: INACTIVE, 1: TX, 2: RX */
+		1 0 2 0
+		0 0 0 0
+		0 0 0 0
+		0 0 0 0
+	>;
+	tdm-slots = <2>;
+	#sound-dai-cells = <0>;
+	status = "okay";
+};
+
+/* On-module eMMC */
+&sdhci0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mmc0>;
+	bootph-all;
+	disable-wp;
+	mmc-pwrseq = <&mmc_pwrseq>;
+	non-removable;
+	status="okay";
+};
+
+/* On-module Wi-Fi */
+&sdhci2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mmc2>, <&pinctrl_wkup_clkout0>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	assigned-clocks = <&k3_clks 157 158>; /* wkup_clkout_sel_out0 */
+	assigned-clock-parents = <&k3_clks 157 164>; /* clk_32k_rc_sel_out0 */
+	bus-width = <4>;
+	disable-wp;
+	non-removable;
+	cap-power-off-card;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+	};
+};
+
+&usbss0 {
+	ti,vbus-divider;
+};
+
+&usbss1 {
+	ti,vbus-divider;
+};
+
+/* mcu_gpio0 and mcu_gpio_intr are reserved for mcu firmware usage */
+&mcu_gpio0 {
+	status = "reserved";
+};
+
+&mcu_gpio_intr {
+	status = "reserved";
+};
+
+&wkup_rtc0 {
+	status = "disabled";
+};
+
+&wkup_rti0 {
+	/* WKUP RTI0 is used by DM firmware */
+	status = "reserved";
+};
+
+&wkup_uart0 {
+	/* WKUP UART0 is used by DM firmware */
+	status = "reserved";
+};
+
+&main_uart1 {
+	/* Main UART1 is used by TIFS firmware */
+	status = "reserved";
+};
+
+#include "k3-am62-ti-ipc-firmware.dtsi"
-- 
2.47.3

