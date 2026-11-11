Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794414575;
	b=ahJFnwtjOfob/Z66hR2+MErGVv5897b52qt0EFwVn3I+XdQ2KIj5NxmS3rkwUis1s6u2
	 ++JRAmChsxEHxdcYcC6p923YeNowyooKXZsZBwAGQX0kOmmhQCAjb2EJRaAeZPfZs+xDo
	 /E+D76UbL0WTx154e8B/6ElTdGJiJ7I78X/YW+F6PFVTiVs8Zu/N+smR67XlivVS3/Nnq
	 c+1b601YytJkiPghDasPa9L+RJIkyYrUIvAweyAV9qUkGBQSM2gyespOWKkft3vTqDXhT
	 tOrKoWXaWLn1ZndgP4aTXwsfSCKnUE43gEWjgAQArMJhfjekSHfrEpOzTvk+Xz7pFow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yp8lqH6axhct/I1kovHzSzHwkmW7n4Ch/SpgYzqnw64=;
	b=aNTgyKS2ersG3bYxaiuEFwMosSWqa5o+jhaWzZ7fzj8m6Yps+yC0ANEwPSdx0msmZpd5
	 WpBXdjErdOC1NXyLdgb62uiybeAwHcYuMa9gg8uz5KAx8IchM1jeiqF0M0dolsCpiB8dA
	 NteQhEG88Eti5Xc+geUpFqdKdhq1JiXT5jvIaWI+4nZwuMr1Oo+7o7sXrTLHUW+Cu/Hci
	 z8fPei2awz4GgMQJFnEsaMa/ILO9AHAQJKZPcNxpGY31Y6f7x1B74DLEPagdpWyvkNCn/
	 OTwqMxL0yFQ7+Vv043X+c46aHypeMxCmEIoKCWY1xYE7w6cu9OLjsHwAgFxqRQyMw3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g7MidrFB;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CB260A261E
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 16:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3CB260A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g7MidrFB
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36fe5944e9aso3281708eec.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 08:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794414574; x=1795019374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yp8lqH6axhct/I1kovHzSzHwkmW7n4Ch/SpgYzqnw64=;
        b=g7MidrFB6fyZBfTay71G94iIx/OxwGXaufJ81e9P86lGKuiXKjFMZPWBthhyV7B8BL
         vJKIcaA4HcpTVhzG/hQ1NRbqzy8knvHGOLteVbkQjjV7rziORZn3Rm0ESI6gFE/OhFjv
         93+jyxUkTTtBROPrnWH32t8F7FQqpjrrxUoBhUctD/jEb924jJgBrIVkHy0OeHxviN5z
         mWElAAW8AD6onFAZrLMinlq/uV3E67WBT0AzYIJpGgcF/xIb+BxOhd8TTphuNbHSJB4q
         yqakQmJKSY1zNLtKP1NRXmyIfqE26UI9tKeeJvBmCA0hVQ/vCh0Zja2gddEEBb6AWOlU
         bJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794414574; x=1795019374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yp8lqH6axhct/I1kovHzSzHwkmW7n4Ch/SpgYzqnw64=;
        b=tmBNtzPsCZKlxdqTnHYaKp3WfgQL6YF1/doDr+FwjWx7GDmQNj9Croh6XigRBLxu/j
         QB6fBxo9pMgRZ5ZiMFVjM7NMSqLe+5E/3BfihrVLacP4+EMoPglku5p19Hxm2hK3qaim
         8QosZKNzW0f4VK/Bunph6yJY8AgzQalbrxnEo1SXmopWw+IJs6xnuy5zJ6JiVR+giKJ+
         EDHcsEUahkDyfazdYUk/Bw36YWNXPgf1LRwRCKczpZxVeQHMZqDPcRyJx4bpPfAx8T1c
         2ffWKlXeHDDdlG7YA1UpKDQtfmWHjni36MSnBTEjoJztCAtqK+bovUUyizSAtOqhznIw
         fCmA==
X-Gm-Message-State: APuU4Z9YI/nHeWtgikWV0yqcEjC5y2oxYKLnzC7C8jRwIiCup89SMWZ1
	JdTAmFY70P7X74FHCsqs+lablwF0PC+RAsZViEth+UgTkbZ3KbkheZft
X-Gm-Gg: AYBFou0SD1T5K886QIfDq7D8+HkffdFvQ3f0LB1Ekwa70huJ+e35UgEBS3pSdzaEZWv
	oWn24VUzMTfeD7q9oKquRuP4DBx29Q/XcLd93bCjBtNupz76qyLwvCNT7QoXHqJcG6fc7rFaIOS
	NvDchnAmfNXGZBADJA2TRwFELehuLK+Slt27hSzSenFHDskJcXTLOx++xTkqrM+VtbBRRGEvClJ
	qc2lM4HBv11ReqBWwz8t04zEGXVXk4YNxZvwOAS1UWdzMra+fmsqbO9mZEZB4H3JIgLb1t0bEXd
	c4mm/+bowEG8VlpXKTkytIqR+dM1rAr4Rr9xP8MPlllRlXwr+xbngKdpBnl90Asx4FFEr5zVWLf
	1EE05MtlxjVaebMV9cqCJ9AyQjOdEEcaTub12mguX0ZHnZnLH7TmUHJDj5rPQa54GQcvjkiQcPQ
	jHhUx9CBcNL/GoqkYBFhf4yyQBTLCflKwiCV7bq2RHOE6fy8AeyT4PVRpDqh1WkHLSQKf7536/M
	eAMp7yVnt0GvfO9F5dxAKLgbbKYWGMZO21+UWMaKWbA2OaGuiM4XBab4+SMk/a/jiyIr8ZsadPU
	ZI8Ost7Jdwyoyi38AFDrkQWlPdWZxvh7sCTzv+YhAK4aI7IpVQ==
X-Received: by 2002:a05:7300:681c:b0:36a:18e2:64c with SMTP id 5a478bee46e88-37685d72786mr3532806eec.11.1794414573884;
        Wed, 11 Nov 2026 08:29:33 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm34892599eec.16.2026.11.11.08.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:29:33 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 2/2] ARM: dts: zynq: Add ALINX AX7Z020B development board
Date: Wed, 11 Nov 2026 11:29:17 -0500
Message-ID: <20261111162917.97532-3-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111162917.97532-1-cyan2254650260@gmail.com>
References: <20261111162917.97532-1-cyan2254650260@gmail.com>
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

Add devicetree support for the ALINX AX7Z020B development board.
The board is built around the ALINX AC7Z020 system on module with a
Zynq-7000 (XC7Z020-2CLG400I) SoC, 1 GB DDR3 SDRAM and 32 MB QSPI
flash, and provides Gigabit Ethernet (JLSemi JL2121 PHY), USB 2.0
host, MicroSD slot, dual CAN buses (SN65HVD232 transceivers on
MIO 10-13), I2C RTC/EEPROM/LM75 and the serial console on UART1.
DevCFG FPGA manager is also enabled.

The two SMA AD inputs and the spare differential pair are wired to
XADC aux channels VAUX1, VAUX9 and VAUX12. The XADC hard macro is
always accessible from the PS, so expose these channels via the
driver's xlnx,channels property.

Link: https://www.alinx.com/
Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 arch/arm/boot/dts/xilinx/Makefile             |   1 +
 .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  70 +++++++++
 .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 142 ++++++++++++++++++
 3 files changed, 213 insertions(+)
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts

diff --git a/arch/arm/boot/dts/xilinx/Makefile b/arch/arm/boot/dts/xilinx/Makefile
index 9233e539b1..5c4bcd9492 100644
--- a/arch/arm/boot/dts/xilinx/Makefile
+++ b/arch/arm/boot/dts/xilinx/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ZYNQ) += \
+	zynq-alinx-ax7z020b.dtb \
 	zynq-cc108.dtb \
 	zynq-ebaz4205.dtb \
 	zynq-microzed.dtb \
diff --git a/arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi b/arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
new file mode 100644
index 0000000000..1e80045cdc
--- /dev/null
+++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DTS for ALINX AC7Z020 System on Module
+ *
+ * Copyright (C) 2026 Pufan Jin <cyan2254650260@gmail.com>
+ */
+
+#include "zynq-7000.dtsi"
+
+/ {
+	compatible = "alinx,ac7z020", "xlnx,zynq-7000";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x40000000>;
+	};
+
+	pmu@f8891000 {
+		interrupt-affinity = <&cpu0>, <&cpu1>;
+	};
+};
+
+&clkc {
+	ps-clk-frequency = <33333333>;
+};
+
+&devcfg {
+	status = "okay";
+};
+
+&qspi {
+	bootph-all;
+	status = "okay";
+	num-cs = <1>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "boot";
+				reg = <0x00000000 0x00500000>;
+			};
+
+			partition@500000 {
+				label = "bootenv";
+				reg = <0x00500000 0x00020000>;
+			};
+
+			partition@520000 {
+				label = "image";
+				reg = <0x00520000 0x00a80000>;
+			};
+
+			partition@fa0000 {
+				label = "spare";
+				reg = <0x00fa0000 0x01060000>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
new file mode 100644
index 0000000000..472d9fcaaf
--- /dev/null
+++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DTS for ALINX AX7Z020B Development Board
+ *
+ * Copyright (C) 2026 Pufan Jin <cyan2254650260@gmail.com>
+ */
+
+/dts-v1/;
+#include "zynq-alinx-ac7z020.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "ALINX AX7Z020B Development Board";
+	compatible = "alinx,ax7z020b", "alinx,ac7z020", "xlnx,zynq-7000";
+
+	aliases {
+		ethernet0 = &gem0;
+		serial0 = &uart1;
+		serial1 = &uart0;
+		mmc0 = &sdhci0;
+		spi0 = &qspi;
+		i2c0 = &i2c0;
+	};
+
+	chosen {
+		bootargs = "";
+		stdout-path = "serial0:115200n8";
+	};
+
+	usb_phy0: phy0 {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+		reset-gpios = <&gpio0 46 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&adc {
+	xlnx,channels {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* AD1: XADC_AD1P/N, E17/D18 */
+		channel@2 {
+			reg = <2>;
+		};
+
+		/* AD9: XADC_AD9P/N, E18/E19 */
+		channel@a {
+			reg = <10>;
+		};
+
+		/* Spare pair: XADC_AD12P/N, F19/F20 */
+		channel@d {
+			reg = <13>;
+		};
+	};
+};
+
+&can0 {
+	status = "okay";
+};
+
+&can1 {
+	status = "okay";
+};
+
+&gem0 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethernet_phy>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethernet_phy: ethernet-phy@1 {
+			reg = <1>;
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_LAN;
+					default-state = "keep";
+				};
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_ACTIVITY;
+					default-state = "keep";
+				};
+			};
+		};
+	};
+};
+
+&i2c0 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	eeprom@50 {
+		compatible = "atmel,24c04";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+
+	rtc@68 {
+		compatible = "dallas,ds1338";
+		reg = <0x68>;
+	};
+
+	temperature-sensor@48 {
+		compatible = "national,lm75";
+		reg = <0x48>;
+	};
+};
+
+&sdhci0 {
+	bootph-all;
+	status = "okay";
+	disable-wp;
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	bootph-all;
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+	dr_mode = "host";
+	usb-phy = <&usb_phy0>;
+};
-- 
2.56.0

