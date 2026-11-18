Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044625;
	b=jOgxD4Kffz/m7GsVFIuaxobu9LF1qgght+MS0l8E6zIH93MY8at1YeL0t/ygEe6sUsv6
	 IOr7E4ocTh8HhG3oSFOrAy5HR9yu4Z6C1BUuDRXHrchOT9f6UcOXNCuhoU7OxZCk3fVFg
	 PmblPZRycy8Hj+eIMQQ+htmWUFGykUBLjZyGAWYtyU2Xr+pJsqTd0ZdPAGL6l0rDh1dTq
	 q7KqJYCU62dQhIey4SZfAOp73OAxkX2IXTH4CBZrHS0vYMSmsodPRaimYyUn/EMu+TbI/
	 VZxK/banK7GBG3y6M+fAjb0BvC3EHDSp8gn6rFZX3bj322chB5OauqU+5339WnJNgtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ka6EiiJs49bxCemd8juXL8/rZqv7klKL+5L8rFexwUo=;
	b=QMFRcS7H0cs3bJrTDIH6deoXc9iHvdn+EmROG1c03Cf26V8Co3QQh4yqjAP7c9FHBg60
	 csyv4PpvfZnS8GvUK7gSsrQ9CWjsQYJlnxau0ryubfFwjJlnauj1I9XMIXheCH1NAltAg
	 o3FzVutjPo4BjTsyEeEVO70m2v4cixSPecpE/puoA24PnKvXq1+qYSDYaQWE+mFvvEyqx
	 CgwISHxJDtcwzs170/qNtmu7wQG/9D0/yCLdscUZhzHaM8Upwja2jA83jYfUb9UtaCzw4
	 kifrT6KdMdWjDAWRNl8lh6cDFRJ2kEQJ63GcUTSt2tUKzLltGT+FAJbPiOwU6PuqphQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tFDqmGyL;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF6C60A2615
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 23:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF6C60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tFDqmGyL
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so2243070a12.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795044623; x=1795649423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ka6EiiJs49bxCemd8juXL8/rZqv7klKL+5L8rFexwUo=;
        b=tFDqmGyLtDZbf0DNEhm4DYCVZljrQtnQNBMH9iaEWIGy1ayyJN9kAr5nIbmMQDuDNl
         ilqKeoONnAL857du69InhJOXWIUSzgscznR3Odlf7jsaVBkaBTFM90WMeieUBcqhCCFE
         qgg3Cx2g/1d8rGJZqH+bUSFdKxXtRIav39fJh+O8QY4F9nv3QEPuVfYvxNz2xRLaPc5u
         l2uPuQ0nom9coWKY49ac9btwc3hIlxHLTqswFco1r7TbnC2uk8mZ3XGzfe+aghAZcYku
         j6fc2Oe6h5M4TKNkNkmYx7JJJEFaKGv1KeK7j7F+5aoi+w7np+FIUmmsI8C9ucA3O5cf
         BoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044623; x=1795649423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ka6EiiJs49bxCemd8juXL8/rZqv7klKL+5L8rFexwUo=;
        b=UST7cFKey8OVuYA3QXQ7mf75CAR5vnLrYRKfEK6pBaS+H2y4G3Vmh635StY/Xv8aTo
         xSWs5pzKImTZXc6N1Y3NMSl6ysGs6t6+t10fhQMmKJ6NopQi74pQQPu36KAgT/+FDk7v
         J5hKYKBHgV+pVjhCT9TwcezBd4nrt36z4cF/9Zm2os+WCjb/AjGpk9WTSxLLiQOFmNPr
         tZV84XspuOvokEjYgUMiA3lv5604gq+XmolhMOCzx85bqCzQFO5UoeBwMImD8Vt7URVw
         pIvJKuW96JpWvI1DaVv7Xaz7Z0UEVmBx1ypaNi7JfVwiFe+BstmPdQOyqq4hzFoyidzo
         F5Vw==
X-Gm-Message-State: APuU4Z9BavQdkAGgdYYUxHPRaLm5YYgfBTUoSzdgmtEexxZhmR2NuG6Y
	hyMhZZV09Jdo2xTjJu535g8hiyHD1EDwXham+//NSeA9bdoopj31EEeL
X-Gm-Gg: AYBFou0aopLwvZWIA6PaTqluqUz1pIJDwjnPAfJJoLENeHn3ipKlTEDYv6vPTQtZGjc
	0RS+tAU+ODST1e1GD64dD+UQQeFB9ZOdHSh3NzKm9dtzesspbsE83YKI46iTacTtHT55ILlQBbD
	PDHzYgPLc+2pZnu232xDZASDEAJRZ3Zm2r68BdLDhv3qsHxFrtmPc4sDly0VPFLnYY0rsQQI4bN
	JZ2cwBnhlj90oAJLkvW/ET42go3Ig1JWgGtuzSq6WjIP6zsfF8WH/pBg0HRXL6zF2GfaUBNVun5
	OFAo/ihPYEbNtLzeCAkEh6+roInDCOKMUzbA11kQW/ebtyg4CtZBM86lPNDhIImFstPKcLbKRRn
	CLOVzRazs9IA0tnnza7dTwDXS4DoNWoLFkAA3zEgAhJTn3M4G0CiS+fFr4CsYt1meZeVgVM3tia
	qZ9P3nPcmhtj+gfVmHVvmbEwJZpZtnr9pWX44zaqCPCzOmG2B5PjSQqV4DF3m4wAly1tNMgHyCG
	knEdA6dXdMtFILpi35KXd/34xHQs83R+E6TGGrshiEIrAotLQr1DsiVxPAlV+SrrAii8oHNaTP0
	JtM4W6Z9bnjLyJSd2IbsE0cQmT+AHL9mTBwOTEaSJlQ=
X-Received: by 2002:a17:907:2d13:b0:c29:4490:50d6 with SMTP id a640c23a62f3a-c510e32e95amr349706866b.47.1795044622876;
        Wed, 18 Nov 2026 15:30:22 -0800 (PST)
Received: from localhost.localdomain ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51234d2159sm47809166b.78.2026.11.18.15.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:30:22 -0800 (PST)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Thu, 19 Nov 2026 04:29:41 +0500
Subject: [PATCH v3 3/4] arm64: dts: rockchip: add Forlinx OK3568-C
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
Message-Id: <20261119-ok3568-c-v3-3-071840643591@gmail.com>
References: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
In-Reply-To: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044612; l=14897;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=tX2Y6oInXHlF7LGeYX8tx/h7XSmFIQ6WKFvUUCYG8wI=;
 b=C2kHY0UfLlorvt/1ENOv7Lzq63xFtzYQzELvngyWilo7M0aufKSp1JkbXDre0ik7Rl3/4DP5F
 D5ypDhOoAIFBzHloIwCsu+fglAPVX78ybY8YtsdsrbP3mDCet0HMquE
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=

OK3568-C is the carrier board for FET3568-C System on Module.

OK3568-C features:

2x 1GbE Realtek RTL8211F Ethernet
1x HDMI Type A out
1x Edp and LVDS headers
2x USB Type C (2.0 and debug console)
1x USB 3.0 OTG Type A (2.0 part is multiplexed with Type C)
1x USB 3.0 M.2 M Key (4G/5G modem)
2x USB 2.0 Type A
1x PCIE 3.0 PCIe (2 lanes)
1x PCIE 2.1 PCIe (1 lane)
1x TF scard slot
1x MIPI CSI
1x MIPI DSI
2x CAN 2.0
1x RTC
1x earphone output and Speaker output, 1x mic.
50-pin expansion header
ADC keys
onboard WiFi And BT (AW-CM358SM)

Add support for Forlinx OK3568-C board.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile            |   1 +
 arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts | 566 +++++++++++++++++++++++
 2 files changed, 567 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index e7936a21c118..48c83f79f83b 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -155,6 +155,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-mecsbc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-odroid-m1.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-photonicat.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts233.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts233-pcb-12-11.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts
new file mode 100644
index 000000000000..94f08fdc1143
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts
@@ -0,0 +1,566 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include "rk3568-fet3568-c.dtsi"
+
+/ {
+	model = "Forlinx OK3568-C";
+	compatible = "forlinx,ok3568-c", "forlinx,fet3568-c", "rockchip,rk3568";
+
+	aliases {
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		mmc1 = &sdmmc0;
+	};
+
+	adc-keys-0 {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1750000>;
+		poll-interval = <100>;
+
+		button-volume-up {
+			label = "V+/Recovery";
+			linux,code = <KEY_VOLUMEUP>;
+			press-threshold-microvolt = <1750>;
+		};
+
+		button-volume-down {
+			label = "V-";
+			linux,code = <KEY_VOLUMEDOWN>;
+			press-threshold-microvolt = <297500>;
+		};
+
+		button-menu {
+			label = "Menu";
+			linux,code = <KEY_MENU>;
+			press-threshold-microvolt = <980000>;
+		};
+
+		button-escape {
+			label = "ESC";
+			linux,code = <KEY_ESC>;
+			press-threshold-microvolt = <1305500>;
+		};
+	};
+
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
+	/* DSC557-0344FI1 clock generator */
+	pcie30_refclk: pcie-clock-generator {
+		compatible = "gated-fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "pcie30_refclk";
+		vdd-supply = <&vcc3v3_pi6c_oe>;
+	};
+
+	rk809-sound {
+		compatible = "simple-audio-card";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hp_detect>;
+		simple-audio-card,name = "Analog RK809";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,hp-det-gpios = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,widgets =
+			"Headphone", "Headphones",
+			"Speaker", "Speaker",
+			"Microphone", "Onboard Microphone",
+			"Microphone", "Headset Microphone";
+		simple-audio-card,routing =
+			"Headphones", "HPOL",
+			"Headphones", "HPOR",
+			"Speaker", "SPKO",
+			"MICL", "Onboard Microphone",
+			"MICR", "Headset Microphone";
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s1_8ch>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&rk809>;
+		};
+	};
+
+	vcc12v_dcin: regulator-12v-vcc-dcin {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc12v_dcin";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	vcc1v8_wifi_bt_reg_on: regulator-1v8-vcc-wifi-bt-reg-on {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio3 RK_PD4 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_reg_on>;
+		off-on-delay-us = <20000>;
+		regulator-name = "vcc1v8_wifi_bt_reg_on";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		startup-delay-us = <200>;
+	};
+
+	vcc1v8: regulator-1v8-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc1v8";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc3v3>;
+	};
+
+	vcc3v3_pi6c_oe: regulator-3v3-vcc-pi6c-oe {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pi6c_oe>;
+		regulator-name = "vcc3v3_pi6c_oe";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <5000>;
+	};
+
+	vcc3v3_pcie20: regulator-3v3-vcc-pcie20 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_pcie20";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0>;
+	};
+
+	vcc3v3_pcie30: regulator-3v3-vcc-pcie30 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_pcie30";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0>;
+	};
+
+	vcc3v3: regulator-3v3-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0>;
+	};
+
+	vcc4v2_5g: regulator-4v2-vcc-5g {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio1 RK_PB1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&modem_5g_pwr>;
+		regulator-name = "vcc4v2_5g";
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+		startup-delay-us = <50000>;
+		vin-supply = <&vcc5v0>;
+	};
+
+	vcc5v0: regulator-5v0-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+};
+
+&can0 {
+	compatible = "rockchip,rk3568v3-canfd", "rockchip,rk3568v2-canfd";
+	assigned-clocks = <&cru CLK_CAN0>;
+	assigned-clock-rates = <300000000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&can0m0_pins>;
+	status = "okay";
+};
+
+&can1 {
+	compatible = "rockchip,rk3568v3-canfd", "rockchip,rk3568v2-canfd";
+	assigned-clocks = <&cru CLK_CAN1>;
+	assigned-clock-rates = <300000000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&can1m1_pins>;
+	status = "okay";
+};
+
+&combphy0 {
+	status = "okay";
+};
+
+&combphy1 {
+	status = "okay";
+};
+
+&combphy2 {
+	status = "okay";
+};
+
+&gmac0 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_miim
+		     &gmac0_tx_bus2
+		     &gmac0_rx_bus2
+		     &gmac0_rgmii_clk
+		     &gmac0_rgmii_bus
+		     &gmac0_clkinout
+		     &eth0_pins>;
+	status = "okay";
+};
+
+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy1>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1m1_miim
+		     &gmac1m1_tx_bus2
+		     &gmac1m1_rx_bus2
+		     &gmac1m1_rgmii_clk
+		     &gmac1m1_rgmii_bus
+		     &gmac1m1_clkinout
+		     &eth1m1_pins>;
+	status = "okay";
+};
+
+&hdmi {
+	avdd-0v9-supply = <&vdda0v9_image>;
+	avdd-1v8-supply = <&vcca1v8_image>;
+	status = "okay";
+};
+
+&hdmi_in {
+	hdmi_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi>;
+	};
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+
+	pcf8563: rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+	};
+};
+
+&i2s0_8ch {
+	status = "okay";
+};
+
+&i2s1_8ch {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2s1m0_sclktx
+		     &i2s1m0_lrcktx
+		     &i2s1m0_sdi0
+		     &i2s1m0_sdo0>;
+	rockchip,trcm-sync-tx-only;
+	status = "okay";
+};
+
+&mdio0 {
+	rgmii_phy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <0x1>;
+		clocks = <&cru CLK_MAC0_OUT>;
+		assigned-clocks = <&cru CLK_MAC0_OUT>;
+		assigned-clock-rates = <25000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rgmii_phy0_rst>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PA4 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&mdio1 {
+	rgmii_phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <0x1>;
+		clocks = <&cru CLK_MAC1_OUT>;
+		assigned-clocks = <&cru CLK_MAC1_OUT>;
+		assigned-clock-rates = <25000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rgmii_phy1_rst>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PA2 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&pcie2x1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie20m0_pins>;
+	reset-gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pcie20>;
+	status = "okay";
+};
+
+&pcie30phy {
+	status = "okay";
+};
+
+&pcie3x2 {
+	clocks = <&cru ACLK_PCIE30X2_MST>, <&cru ACLK_PCIE30X2_SLV>,
+		 <&cru ACLK_PCIE30X2_DBI>, <&cru PCLK_PCIE30X2>,
+		 <&cru CLK_PCIE30X2_AUX_NDFT>,
+		 <&cru CLK_PCIE30X2_PIPE_DFT>,
+		 <&pcie30_refclk>;
+	clock-names = "aclk_mst", "aclk_slv",
+		      "aclk_dbi", "pclk", "aux",
+		      "pipe", "ref";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie30x2m0_pins>;
+	reset-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pcie30>;
+	status = "okay";
+};
+
+&pinctrl {
+	bluetooth {
+		bt_wake_host: bt-wake-host {
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		host_wake_bt: host-wake-bt {
+			rockchip,pins = <0 RK_PD5 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
+	ethernet {
+		rgmii_phy0_rst: rgmii-phy0-rst {
+			rockchip,pins = <3 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		rgmii_phy1_rst: rgmii-phy1-rst {
+			rockchip,pins = <3 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	modem {
+		modem_5g_pwr: modem-5g-pwr {
+			rockchip,pins = <1 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	/* Drop pcie20_clkreqnm0 pin. Used as DSC557-0344FI1 enable-gpio instead. */
+	pcie20 {
+		pcie20m0_pins: pcie20m0-pins {
+			rockchip,pins =
+				/* pcie20_perstnm0 */
+				<0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>,
+				/* pcie20_wakenm0 */
+				<0 RK_PB5 3 &pcfg_pull_none>;
+		};
+	};
+
+	pcie30x2 {
+		pcie30x2m0_pins: pcie30x2m0-pins {
+			rockchip,pins =
+				/* pcie30x2_clkreqnm0 */
+				<0 RK_PA6 2 &pcfg_pull_none>,
+				/* pcie30x2_perstnm0 */
+				<0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>,
+				/* pcie30x2_wakenm0 */
+				<0 RK_PC5 3 &pcfg_pull_none>;
+		};
+
+		pi6c_oe: pi6c-oe {
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	sound {
+		hp_detect: hp-detect {
+			rockchip,pins = <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wifi {
+		wifi_reg_on: wifi-reg-on {
+			rockchip,pins = <3 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&pmu_io_domains {
+	pmuio1-supply = <&vcc3v3_pmu>;
+	pmuio2-supply = <&vcc3v3_pmu>;
+	vccio1-supply = <&vccio_acodec>;
+	vccio2-supply = <&vcc_1v8>;
+	vccio3-supply = <&vccio_sd>;
+	vccio4-supply = <&vcc_1v8>;
+	vccio5-supply = <&vcc_3v3>;
+	vccio6-supply = <&vcc_1v8>;
+	vccio7-supply = <&vcc_3v3>;
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcca_1v8>;
+	status = "okay";
+};
+
+&sdmmc0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	disable-wp;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc3v3_sd>;
+	vqmmc-supply = <&vccio_sd>;
+	status = "okay";
+};
+
+/* WiFi part of the AW-CM358SM connected with SDIO */
+&sdmmc2 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc2m0_bus4 &sdmmc2m0_clk &sdmmc2m0_cmd>;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc3v3>;
+	vqmmc-supply = <&vcc1v8_wifi_bt_reg_on>;
+	status = "okay";
+};
+
+/* BT part of the AW-CM358SM connected with UART */
+&uart8 {
+	dma-names = "tx", "rx";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart8m0_xfer &uart8m0_ctsn &uart8m0_rtsn>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+		device-wakeup-gpios = <&gpio0 RK_PD5 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PD3 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-names = "wakeup";
+		nxp,wakein-pin = /bits/ 8 <18>;
+		nxp,wakeout-pin = /bits/ 8 <19>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_wake_host &host_wake_bt>;
+		vcc-supply = <&vcc1v8_wifi_bt_reg_on>;
+		wakeup-source;
+	};
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
+&usb_host0_xhci {
+	extcon = <&usb2phy0>;
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
+&usb_host1_xhci {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb2phy0 {
+	status = "okay";
+};
+
+&usb2phy0_host {
+	phy-supply = <&vcc4v2_5g>;
+	status = "okay";
+};
+
+&usb2phy0_otg {
+	phy-supply = <&vcc5v0>;
+	status = "okay";
+};
+
+&usb2phy1 {
+	status = "okay";
+};
+
+&usb2phy1_host {
+	phy-supply = <&vcc5v0>;
+	status = "okay";
+};
+
+&usb2phy1_otg {
+	phy-supply = <&vcc5v0>;
+	status = "okay";
+};
+
+&vop {
+	assigned-clocks = <&cru DCLK_VOP0>, <&cru DCLK_VOP1>;
+	assigned-clock-parents = <&pmucru PLL_HPLL>, <&cru PLL_VPLL>;
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi_in_vp0>;
+	};
+};

-- 
2.56.0

