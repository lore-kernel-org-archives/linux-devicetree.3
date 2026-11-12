Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511981;
	b=1wr0kDO9UpanjtYP4gEvQ+jWU4+iHOI4K2oA8WxPLdEBpsYbiSCdnW7s7orSRGewWcp3
	 w5LVr2eBcTwH4epAKraGVFA2HWegd9iV6/rSvNaXnbmxvXcq6sulcyOAZEarRNoG0vB3O
	 ZDLEgm5ByPV5Ww8dkw+VxDQzjgIci86RY8rD5s/RjCulhRNbWWGWguBc8FU1VJkCrWDu2
	 IIgyo+hXINfKx05yM9WI7s/WmE9vqkvsTXs8teMPrEfeXp3OXa7HaNh/XTG49wx5la59m
	 l5pjeHzowS1GyupW8HSSHbG6bVDrXnm4IjlVn2afXhhb3cTWuuIKysDJt8/dtEhAS7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I1+vR9QxfCce51TW0jo5Fo/3ZflfP0wWJngCGR19FuU=;
	b=WgkBe1Y4aXPm6f+vce7gm6QK4gDECmm3uTFzxo1jJ4Njc9bNY2ndLdx1vH/dgXtcswjQ
	 JxQ/YO3STs4i4t/Lh+SgiPijDkwKolwdjqzL4v3F4OvQnTj7N2s+bVUG3FF/wPJpl038Q
	 csZJwfBbq+LFx6qvM3UTxyRMlEnhf+sDedPaepuauIGQugjH2qT2Cx/tGVBp3UqW5rRUr
	 TvmSyn82PHeZYR6wTnnzRjFQLNTigJ8QECfpxkUMG5bY+qG9s2OGKsAjHQ8lWQn+nenic
	 BJDIDK/LdHOaxmj/461vfpQzv/Twg2lvLaVOIavVjX04rmXRdEjRz9WwnAFmwTnmrVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E70eTPU2;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F13D606A334
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 19:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F13D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E70eTPU2
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso308481eec.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794511980; x=1795116780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I1+vR9QxfCce51TW0jo5Fo/3ZflfP0wWJngCGR19FuU=;
        b=E70eTPU2nlLkfa6nXlOF2XdhHalwudnshzE3mu9MAGe3GnwTFJZzm5ut7w/jyI/pH+
         a9i3JCpQl+IES2gcMhtifXNO/iDtdnUxDooSZn1reETzONRQCSFHIM/EZCi+pE7TaAkN
         J13aRXCHjRdd/hCk06PNZeS+A+JXJa+8vm354UHhr0kVb3jcGWEzZm5Zv33moW+9A+w+
         TWP/dcnmGezMAfgCVWrGuoIiA49pjy926w8igWy/mo6mVbFMMrma7K92H36MT44AQ8iO
         r9SsscmaIyJzR6pMiiuV0Rvqa/1dR37cnYo4y9o2KSoBnEyyI9s25bAGMuA5KUJ8+KlQ
         kqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511980; x=1795116780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I1+vR9QxfCce51TW0jo5Fo/3ZflfP0wWJngCGR19FuU=;
        b=txLBwnw9ySsR3RvrgkyC1ZRx+iAFR2QVcb28xDVrQAfdF+DoB0eiVgnurmc+DlDOUN
         NMqJK2M1gWbLDe+0G5LWrj54J9jTQoImVb/FjV+edH2mGTteBI0u/3zd6ajXcwn6P7SH
         ENOUdsDshsY1MGJpvzA6/bIPRwZ3QRjAONz0qOyeTA/puqXziMyq7ro772sabBJSrtbN
         KUzrmCh3stIwFpf06ELu/+qBrlC/lvbGD9QVGVtKO4dVbKF89J1Qdo58WFgMU+/Q41Iv
         uiV9sLCCDeeaPRUvQMzp1/EqvLhrZSV0LiHNCu3JbmzPy5SK6FwzwVQ5LXQR/u6eRja0
         Y5mQ==
X-Gm-Message-State: APuU4Z9b8/FgrbyWq8FWMYODJ0Sj6+HgQmGAabyO6ZRuKt6xMXRkeBDx
	DApai2z1h+p63wADZ0EDxloEFDEsQ9GX302qPIr7bC3NSeZfNCkq/Z6T
X-Gm-Gg: AYBFou3Q7PdjTJp/RSoa6qN4vT4ixXDKjepQr8aswvt0EqtwNXng0P+bDatlrJcUAls
	9nD7F7euI+RtAoDTH/Esnxog6AnEfhaENrNBZg5b3/56J4bjolu4CMip7GwrPqw2CuHjXJbpCqX
	E/ZqDxke89OlVCi4DUNU7lUJEoer6UeXuEJcvW4DsjNXWD/eF6EsoaT3RuvQxXFNmx7JtTVq58a
	YTRhdtEiw8HbBjXO1hl85YwuM3pMDAOsLsYsGaoBozJsa2iu7zG/T/SAjun/tV9Zf5IVVvDmZSu
	YL9fU2SYzEARoJJ9Ii3+3mLyl1QGnfdOVTFezI/ZSlZlw5qX/6NOj3hLTfu/gg2fBcsvmwCadZU
	Xl9V6jbbPh4db/cH2CajiPJLzPN0k6dVLZ8FdTLcPBXkqcJqp83rMZ3/1B/cSM7ZgSiurELE/u6
	v8KXYmYpPhamEOYaas1gpBjzgX9EO4I5immR+J43BnzhB4j+bPHDE/YgRvgYKekkAv9ur3+DNyT
	MzgRvjMbu1TyV2JIlWQ+jsCW+/KmKDd7EFjjD5og5GTc0GnTrSHZkEySIqkiPkPI+DRHuiYNlfw
	UI9mhh3VKt4+cQOv64PQquOsF8t7dGEFn/cZq3G6arE2dulSmQ==
X-Received: by 2002:a05:7301:713:b0:376:ce6a:a499 with SMTP id 5a478bee46e88-379684ae563mr104749eec.36.1794511978886;
        Thu, 12 Nov 2026 11:32:58 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm565379eec.14.2026.11.12.11.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:32:58 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v3 2/2] ARM: dts: zynq: Add ALINX AX7Z020B development board
Date: Fri, 13 Nov 2026 03:32:45 +0800
Message-ID: <20261112193245.250149-3-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112193245.250149-1-cyan2254650260@gmail.com>
References: <20261112193245.250149-1-cyan2254650260@gmail.com>
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

Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 arch/arm/boot/dts/xilinx/Makefile             |   1 +
 .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  71 +++++++++
 .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 146 ++++++++++++++++++
 3 files changed, 218 insertions(+)
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
index 0000000000..d60e58657b
--- /dev/null
+++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
@@ -0,0 +1,71 @@
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
+	num-cs = <1>;
+
+	status = "okay";
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
+				reg = <0x00000000 0x00500000>;
+				label = "boot";
+			};
+
+			partition@500000 {
+				reg = <0x00500000 0x00020000>;
+				label = "bootenv";
+			};
+
+			partition@520000 {
+				reg = <0x00520000 0x00a80000>;
+				label = "image";
+			};
+
+			partition@fa0000 {
+				reg = <0x00fa0000 0x01060000>;
+				label = "spare";
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
new file mode 100644
index 0000000000..f232371a51
--- /dev/null
+++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
@@ -0,0 +1,146 @@
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
+		stdout-path = "serial0:115200n8";
+	};
+
+	usb_phy0: phy {
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
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethernet_phy>;
+
+	status = "okay";
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
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	temperature-sensor@48 {
+		compatible = "national,lm75";
+		reg = <0x48>;
+	};
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
+};
+
+&sdhci0 {
+	bootph-all;
+	disable-wp;
+
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	bootph-all;
+
+	status = "okay";
+};
+
+&usb0 {
+	dr_mode = "host";
+	usb-phy = <&usb_phy0>;
+
+	status = "okay";
+};
-- 
2.56.0

