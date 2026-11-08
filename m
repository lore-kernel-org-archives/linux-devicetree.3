Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174633;
	b=onZU6aoR/KRysdP6y8ysSPQybxsi5aAiZkhVicJwugVAlb7rz/+7dAX357ClxJ5mYZmn
	 qbKzNp0uJvH63KejbPxdduuNPrnNkiISQbft09ANH3iSDFmvMJUsCmH9cX/bQUKAryuUZ
	 sehghpo0rwlK9pREVGark8+3JwSxEb7y06LYqBgA15N5AKk0fl0woO8ZHsnOVwZOBC6d4
	 vMizRRjr8vzZp2qezmXlDyNMH8mq1Nl8O1fKdySiUGB4YAYAVfYQe9/4KcXvhXE68z69q
	 FhWTnj1yZGkYkBkr5pweuxmNozwTnNZAiuNesU9374UbA0PgI8SAOZzUvw/uF1folaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nwKFqp+H5YggATRuxpPQ2JLO3+LdBN2PnTSM+VuGKKc=;
	b=OiP1BwBlh48m6MhH1zEzSXl7wbdoSq16w/XBkCau78YLRLEKVTlDhTInBBN3B4Outw1N
	 OwR7wCsP9jyMDmLEE9n6xgK8pWh5LO2LYMonIyx7mExBY6kKBCOJR6tMgQF+IsDbaNJ1I
	 Mt/WE2bUEUTHcrwNoX6XfSGj0HkQTGULoxc82fCohaCSwSgPeq8vrF7dQFycNrBAkDBhf
	 NTNj1xVfIeXTa+ubP9k/V0KmbcKt7UU3AfJrjjpvopY13Bqk7kM8T3XCPb8w/lwqtSykc
	 krj8FN2I81viL2W+MPG8A0lFHKNrzmKHj/iLFhcrLX08NDge266bVsZxCNji48qvJGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alhWQP4H;
	arc=none smtp.remote-ip=74.125.229.133
Received: from mail-dl2-f5.google.com (mail-dl2-f5.google.com [74.125.229.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4BC606A338
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A4BC606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alhWQP4H
Received: by mail-dl2-f5.google.com with SMTP id a92af1059eb24-1ac216daf7dso221512c88.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794174632; x=1794779432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwKFqp+H5YggATRuxpPQ2JLO3+LdBN2PnTSM+VuGKKc=;
        b=alhWQP4HwCjG/iNXhjcZUJdA812nM0k3xZYU4BysNd8W/C7oasnfvCmLldAT4ldYWk
         NiUdxU4KNl3e+Sk7BPTJT01etwMHMPBcfIayWnZrAC/pBMxalV8XL7FsirMmIIKAyy/+
         P8L1Jtrn5HOOkJqk0Sggrmu4O//z0jjU/x0ZQq2lwW0Pvt8qSL6X/O6mdNj464C+26X6
         p8JpQ/qFWRJCS9wRvviHPy35EBmLaD9CKEcHKX/B0OS0ze34wcQfyS54sdbytTSvOZ22
         /9RKBcfRcxIsMvd6rch7bdbO9VOLzAjmn3XfZmyuc+0BlDHr41FpP8N0zm5w8PoPTK1V
         A0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174632; x=1794779432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwKFqp+H5YggATRuxpPQ2JLO3+LdBN2PnTSM+VuGKKc=;
        b=J8MLCbwu7+YrgieM33n7g0jL4bdM5i2aD2vKd/tcJ7SKzaRS9RlfOH8IHoarkQNZ55
         cLZbTslTIeEwkfzTwxop+gtH0H0ADLFdK4v4WSaZKm4ooJQ4P7HloPe3u0QQG/sRBRnn
         2cEowGrX/8nzuzVAGmfBhLu8SlprnC+6Mzs5WTrlQ/dcN2cd/LdenyrdV8y6cKSZNsq2
         ycerFUgWkMAptQp7EK1ltZSeXQSpD1HtBOez7yWqG96PGMKtmB2+xGCl0CbwStTHPbds
         MyMgk5TmtKZzrEwTTQuMffF/1uoTHuFO99xA5kHCZTiA1EM+7h8oZjPFoIfTzrUCOnsS
         4KCA==
X-Gm-Message-State: APuU4Z+LrDfFmUkPcZXsv7zwVGVYqbKRTgO7KHvfB7WwwOEoYQFOeaxM
	hHoJX7633EgSMLNINkb744mYYJRxtik15yMAVk/h91uKt/HaBPq2ikhd
X-Gm-Gg: AYBFou3PWR7bObFCWAeit3q4meta2UyJdFRDlCvQIP0apu1n/tp8Jt21ekcfVRaDlNq
	xoKpA/z1tF3yoAHK9+olyawHQpT3VlHJbdZjPcq7GmAfP0fhi5hlpsgLxz6AgUUB2serObPqTcx
	3ekq9VGyHDQrhoyIGVecmq15YCsU+RFjIKoFMFFXU8mqpAl+upWvcrSUrIoQ+wk6HIWD1F1ZFGk
	MFBgxi5hNrGZcobgUQX9yfAc8ORpwiERwb7W2TD8OF7MsCcnTfaB8lTaEr59E+f1FPOYvSJ1Aa6
	qhv5QVxF6Ipm0fRdV/95HVXw0r0em8XiEj4Xa3u3VTLTlEka24bQSqES+qt2NHwqChkSLPZgkLs
	tfgr9YhKApfm6AZyYo59DUYaofunpvGumvxLqrSM1ghWVicmAEN+WXfIV46wmd36RpUpwVnCUks
	yewVUdC2MnRhBJHGmz2/2SDTBcp91riTyV0/wqvgFPhCTwwG+kL4aKtJsqwsVzQBnetGPUop527
	FiuV/QiBQZPIZhyggZkwGQrhXa00DKjKuRGLn/wA1zE05vO3VZj/wh1I4uoOrtSe3yj+4fb5f7d
	QHozIxCp5qj7Iaf1mWD40sxNameU+WKzjS6tmCVhQC3/NIhySA==
X-Received: by 2002:a05:7301:da07:b0:369:fdae:c9fd with SMTP id 5a478bee46e88-37256038e90mr5078656eec.13.1794174631525;
        Sun, 08 Nov 2026 13:50:31 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265efd2dcsm7587575eec.17.2026.11.08.13.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:50:31 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: zynq: Add ALINX AX7Z020B development board
Date: Mon,  9 Nov 2026 05:50:10 +0800
Message-ID: <20261108215010.351256-3-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108215010.351256-1-cyan2254650260@gmail.com>
References: <20261108215010.351256-1-cyan2254650260@gmail.com>
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
 .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  72 +++++++++
 .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 137 ++++++++++++++++++
 3 files changed, 210 insertions(+)
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
index 0000000000..2da08424f1
--- /dev/null
+++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
@@ -0,0 +1,72 @@
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
+/ {
+	pmu@f8891000 {
+		interrupt-affinity = <&cpu0>, <&cpu1>;
+	};
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
index 0000000000..4dfef96ad3
--- /dev/null
+++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
@@ -0,0 +1,137 @@
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
+		channel@10 {
+			reg = <10>;
+		};
+
+		/* Spare pair: XADC_AD12P/N, F19/F20 */
+		channel@13 {
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
+	ethernet_phy: ethernet-phy@1 {
+		reg = <1>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_YELLOW>;
+				function = LED_FUNCTION_ACTIVITY;
+				default-state = "keep";
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

