Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334896;
	b=GuFi0F2OlOgNltHk8glXH8TD8Gbpl2wlfnGWuM3eiUCYIwd6eVSBacdcsWSgqtk7mh4z
	 u0MgClpcla1vDm6gEMVnnwP0b2bfQ4ZxBQwr2VCIsJuGqySA2Qu/tMg0tMfkUBbvrGccQ
	 XFnFAbBRlGeQmamYAW5XZsj7LiEvq62oO3Us1DHHwwU454q4cjt+f2jJYSykUM49vqpC5
	 wFl553noLOeVFTfBo98eJ8La2OKbliwah5oxYi2TBJGBuQgnrLfCCpggCzZI0krQgKba5
	 ohtN84YvUFdeH3k1CVEn8GEOqezbBElvm2YgmaavGbqgMUUTGlj1I5lNtNP0H4RoFkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Y8eBE4mstirD1wH/W53MQwpGw8q55NqNEBcvZZG9b4k=;
	b=YYjCgOGeK4l67SvKK7HajlPI6qUNdFuwOu0cAbTNi5LBKna2nOYeJN91Cdtrpb2MI9LP
	 xjZQuL/sS9ex8zDuU80/Fw8rL0EiJ6N/X7KJvAdy/PkYd/keleOrqSNa9Vi4Y5qwFL6/V
	 T9nYwES3XTSqtdyCZZlaZ0dI/5JsqUd/im6XWlcKGmzgKSeeAPXMdBzZYuIgB5kCE1enl
	 mq+LleoJslWvYLfqpSAJedm9HJ/TU9NPn85Z9v8DN8wlFiiqGvzvGducmNcFbW+Btb5sA
	 5Pc9NSCuP0+58XDOkfx4mHjqTJwIg6NZIqVpCYy5rf71UKYaXeo345bx5w8zMPsA4tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LOvD+t1j;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C52660A2613
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 18:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C52660A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LOvD+t1j
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so21848555e9.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794334894; x=1794939694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8eBE4mstirD1wH/W53MQwpGw8q55NqNEBcvZZG9b4k=;
        b=LOvD+t1jtQoO468c2qxlerbiigLNbV3eC4l2+mFChSs/vGt8Vx0pk6UQAa5pF+VcRS
         vL+7ZELNcB7hCb1Spo/Uz/65UqJYxIn4ZoAsT3npfBsKnUlIQVs+Z4mrw2n0p/1IfSET
         S3BQNaJZNQLXvgbLXw2JVG6kfuXUADIUPCVSLjcb68qdAUrecCKKSnkKdOxHu1qZtzd9
         F+62+UNIbNn0Mny7iRY8UqHaNFJXQ7kwNtn+CDwxPbmQGW2duiG8zWiVmNEuLhjZkzEB
         oQyK1nX0l9lurPkZTD34MRSrFusklYAfjCUAzBYHhBqpWmiNc8tMRmefz7qRmf/bwaj1
         TPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334894; x=1794939694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y8eBE4mstirD1wH/W53MQwpGw8q55NqNEBcvZZG9b4k=;
        b=YorxCAS/P4NGtcDHaKIIXmC1iOCKdzfj7t5IGKaz2MBdefp0r31BIfJjbJk3Rw5+Ot
         QYFR9cu6Ww2HKjwv2x8VNvZ/b0hsoMnEvgBV0lReFPwJ2mJgDtfCrWIM7HkdwivE1FgD
         52XV5INOTwx1evGzflX9XNb2qstMDZRakHS+D/K/LWXxMWm3FxyfL/3+IN++UDO9IXO3
         EnN5J3Q+0MzO5rji/NVabtXRSiWVRMsjBsR+/INTnAkKdfXpkkPysq6ViPvJm74vBDBB
         6ckwTfJ9+Tfrka7CNDM0K33wW3ZKrBq3iVyWlcBDzUGy26hp/XVVIxFBXAZ7Db4imk9E
         +PSg==
X-Forwarded-Encrypted: i=1; AL+hErETIlpxR9LnPhzp16FZ7pxuPpVwRxq8UXqANBiNwgWeAiZJIyuRc/HqljQuMRYWcI1THZePzqnARY9V@vger.kernel.org
X-Gm-Message-State: APuU4Z/1pzkfTpIFAwjU018OM33t5tcrCTWekwASfmMtJyHlr8oWvmxD
	NRfh8+spzsRM36Xdiy2trGfQL2lSNbgS13t6sF2+9aqKqFwJ3jMDup90
X-Gm-Gg: AYBFou3cMNO79OD1XAY+EBzVK5+bALM1A+Yl87kYErZtphbr2dXycrROJCvsQvx5r6H
	0388+5zRMkgE1huv1VQ3l/pePYVD3hdFiRMyFPsZgf9hBip2tkgiJPFjMxOUSx7vcGLINeizM5g
	R68A2SLObiMjaYsUbJvOjPa6thK0xI/psIQ4AdKaJPM3vnU7oIHoZvbWX6qJgmo+UJMcN+QbA23
	/wDFtF1ZXSqIM08qy0vz/hnAKmP5g7j+Qwnq2f35HKmWQyUJW7bimx7xtcE+oVMT+bZLdcPvf33
	cmz9TbVtn44c5Vp1IVBTNtW8Cyi70ZIGZHEsBkd3Mv7WOmiGP7+JKwJI3r6REXKDjNS2s6uJKvN
	RzUQsWyGu8hZ435HHY16PAO9tIlAg9eKURrOP/8BaFALV5Aqa2dQWJ/gaurxBujGYYGbpF8jhqG
	cmPtoMdYQMRXKs8VtT8iH7sDfIhLs5p8m9nxg9khyeOuEkXM6xrBQsACfEdyn5+XjJnfcbZy3y1
	SF1OpdJ6gpYuE+qLksWhDfrHvzdAQB/YUrslmebELnFCS8QljqaFmXHEGtWTAWTjH6F9NZcVvj1
	JYyMZ/xfOsGQSyYGhPgxceOhoUHDp/2/6LsTEKit//aTQ6KxJi3V1Ry+V4XK03ZOClgbkmS0DXG
	qU0R+CjE0jZJUE2ltKZpH5cbqVy3KDHGOYX6EenP77jlmhvVsgg2tGhA=
X-Received: by 2002:a05:600c:4703:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4ba08dc2f58mr3296135e9.7.1794334893593;
        Tue, 10 Nov 2026 10:21:33 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d9df5csm95507825e9.0.2026.11.10.10.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:21:32 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 3/3] arm64: dts: imx8mp-var-smarc: Add support for Variscite Echo board
Date: Tue, 10 Nov 2026 19:18:13 +0100
Message-ID: <3cb427c8d5c6244cebeca5310bd03171f5685edf.1794334398.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794334398.git.stefano.r@variscite.com>
References: <cover.1794334398.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite Echo carrier board with the
VAR-SMARC-MX8M-PLUS system on module.

The Echo board includes:
- uSD card support
- USB ports and OTG
- Two Gigabit Ethernet interfaces
- UART, SPI and I2C interfaces
- HDMI display interface
- WM8904 audio codec
- Capacitive touchscreen
- GPIO expanders, buttons and LED
- PCIe interface
- CAN peripherals

Link: https://variscite.com/carrier-boards/echo-board/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-smarc-echo.dts   | 647 ++++++++++++++++++
 2 files changed, 648 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index e51558a49f8b..2492a78c01bc 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -724,6 +724,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-ultra-mach-sbc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-smarc-echo.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw72xx-2x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts
new file mode 100644
index 000000000000..341d8af16cd8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts
@@ -0,0 +1,647 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Variscite Echo carrier board for VAR-SMARC-MX8M-PLUS
+ *
+ * Link: https://variscite.com/carrier-boards/echo-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+#include "imx8mp-var-smarc.dtsi"
+
+/ {
+	model = "Variscite VAR-SMARC-MX8M-PLUS on Echo-Board";
+	compatible = "variscite,var-smarc-mx8mp-echo",
+		     "variscite,var-smarc-mx8mp",
+		     "fsl,imx8mp";
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pcal6408_1 4 GPIO_ACTIVE_LOW>;
+		};
+
+		button-up {
+			label = "Up";
+			linux,code = <KEY_UP>;
+			gpios = <&pcal6408_1 5 GPIO_ACTIVE_LOW>;
+		};
+
+		button-down {
+			label = "Down";
+			linux,code = <KEY_DOWN>;
+			gpios = <&pcal6408_1 6 GPIO_ACTIVE_LOW>;
+		};
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pcal6408_1 7 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_led>;
+
+		led-0 {
+			function = LED_FUNCTION_DISK;
+			gpios = <&gpio4 18 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "mmc2";
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "c";
+
+		port {
+			hdmi_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	reg_audio_echo: regulator-audio-echo-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8904_echo_supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_base_per_3v3: regulator-base-per-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "BASE_PER_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio1 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <100>;
+		off-on-delay-us = <12000>;
+	};
+
+	reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
+		compatible = "regulator-gpio";
+		regulator-name = "VSD_VSEL";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <3300000 0>, <1800000 1>;
+		vin-supply = <&ldo5>;
+	};
+
+	sound-echo {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&echo_codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&echo_codec_dai>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "wm8904-ech-audio";
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
+		echo_codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904_echo>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&ecspi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi1>;
+	cs-gpios = <&gpio5 17 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	status = "okay";
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	status = "okay";
+};
+
+&hdmi_pai {
+	status = "okay";
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	scl-gpios = <&gpio2 8 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 9 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	typec@3d {
+		compatible = "nxp,ptn5150";
+		reg = <0x3d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ptn5150>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
+
+		port {
+			typec_dr_sw: endpoint {
+				remote-endpoint = <&usb3_drd_sw>;
+			};
+		};
+	};
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&i2c4 {
+	wm8904_echo: codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK1>;
+		clock-names = "mclk";
+		DCVDD-supply = <&reg_audio_echo>;
+		DBVDD-supply = <&reg_audio_echo>;
+		AVDD-supply = <&reg_audio_echo>;
+		CPVDD-supply = <&reg_audio_echo>;
+		MICVDD-supply = <&reg_audio_echo>;
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
+		wlf,in1l-as-dmicdat1;
+	};
+
+	pcal6408_1: gpio@20 {
+		compatible = "nxp,pcal6408";
+		reg = <0x20>;
+		vcc-supply = <&reg_base_per_3v3>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pcal6408>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	pcal6408_2: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		vcc-supply = <&reg_base_per_3v3>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch>;
+		reset-gpios = <&pcal6408_1 0 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+	};
+};
+
+&i2c6 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c6>;
+	pinctrl-1 = <&pinctrl_i2c6_gpio>;
+	scl-gpios = <&gpio3 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio3 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&lcdif3 {
+	status = "okay";
+};
+
+&pcie {
+	reset-gpios = <&pcal6416 14 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie_phy {
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	status = "okay";
+};
+
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
+&pwm2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm2>;
+	status = "okay";
+};
+
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	assigned-clocks = <&clk IMX8MP_CLK_SAI2>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <11536000>;
+	clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_IPG>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK1>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&clk IMX8MP_CLK_DUMMY>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+/* Header */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+/* Console */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+/* Header */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb3_phy0 {
+	fsl,phy-tx-vref-tune-percent = <122>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-comp-dis-tune-percent = <115>;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <33>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	status = "okay";
+};
+
+&usb3_phy1 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vref-tune-percent = <116>;
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	adp-disable;
+	dr_mode = "otg";
+	hnp-disable;
+	maximum-speed = "high-speed";
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	srp-disable;
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		usb3_drd_sw: endpoint {
+			remote-endpoint = <&typec_dr_sw>;
+		};
+	};
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	/* Prevent controller from entering U1/U2 power-saving states. */
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	vqmmc-supply = <&reg_usdhc2_vqmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14		0x16
+		>;
+	};
+
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__ECSPI1_SCLK		0x12
+			MX8MP_IOMUXC_I2C1_SDA__ECSPI1_MOSI		0x12
+			MX8MP_IOMUXC_I2C2_SCL__ECSPI1_MISO		0x12
+			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17		0x12
+		>;
+	};
+
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK		0x12
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI		0x12
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO		0x12
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13		0x12
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__CAN1_TX			0x154
+			MX8MP_IOMUXC_SPDIF_RX__CAN1_RX			0x154
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_CEC__CAN2_TX			0x154
+			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX			0x154
+		>;
+	};
+
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x400001c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x400001c2
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x40000010
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA6__I2C2_SCL		0x400001c2
+			MX8MP_IOMUXC_SD1_DATA7__I2C2_SDA		0x400001c2
+		>;
+	};
+
+	pinctrl_i2c2_gpio: i2c2-gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA6__GPIO2_IO08		0x1c2
+			MX8MP_IOMUXC_SD1_DATA7__GPIO2_IO09		0x1c2
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL			0x400001c2
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA			0x400001c2
+		>;
+	};
+
+	pinctrl_i2c3_gpio: i2c3-gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18		0x1c2
+			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19		0x1c2
+		>;
+	};
+
+	pinctrl_i2c6: i2c6grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXFS__I2C6_SCL		0x400001c2
+			MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA			0x400001c2
+		>;
+	};
+
+	pinctrl_i2c6_gpio: i2c6-gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXFS__GPIO3_IO19		0x1c2
+			MX8MP_IOMUXC_SAI5_RXC__GPIO3_IO20		0x1c2
+		>;
+	};
+
+	pinctrl_led: ledgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18		0xc6
+		>;
+	};
+
+	pinctrl_pcal6408: pcal6408grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05		0x1c6
+		>;
+	};
+
+	pinctrl_ptn5150: ptn5150grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10		0x10
+		>;
+	};
+
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT		0x116
+		>;
+	};
+
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO11__PWM2_OUT		0x116
+		>;
+	};
+
+	pinctrl_sai2: sai2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_TXFS__AUDIOMIX_SAI2_TX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI2_TXC__AUDIOMIX_SAI2_TX_BCLK	0xd6
+			MX8MP_IOMUXC_SAI2_RXD0__AUDIOMIX_SAI2_RX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI2_TXD0__AUDIOMIX_SAI2_TX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI2_MCLK__AUDIOMIX_SAI2_MCLK	0xd6
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX		0x40
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX		0x40
+			MX8MP_IOMUXC_UART3_RXD__UART1_DCE_CTS		0x40
+			MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS		0x40
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX		0x40
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX		0x40
+		>;
+	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX		0x40
+			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x40
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d4
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d6
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
+		fsl,pins = <
+			/* Card detect */
+			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12		0x10
+			/* Power enable */
+			MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08		0x1c4
+			/* Voltage select */
+			MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04		0xc0
+		>;
+	};
+};
-- 
2.47.3

