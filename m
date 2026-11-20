Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191128;
	b=akRUWffR8OvqQH4vCdpScSWSfpVZ1xjdFcy3p0g9bNLV5Ciog22GfUYbsmBzNPPzPOv4
	 yxo56AuLDkrowWFzWTktCxPFjJKk94gMFQTr9iHlk+utmEDZcG8aY7yiB/jSJaC6doFrC
	 21V46JoWI0O72qog/V7yPAt6h1EpOtgl/o1wNVSzZWd3BeN+KM03UtQ1+V6RGG+fBBHPf
	 IE/JFJxaSo7wKbIvREbyRfiozHTEL03ZVuv5UIVPw1faASjzf/m/2frqteEJNEJqXmKvA
	 LLJ70D3AF/tBFIOx9za+oLjwPIElMwxrQO6g4npFttOK4R42JbrUxRqB/N8sYwiyJaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a35Mq+RYpt2dEaWC1d1eJMfVyB9If3Q8Pl622VJ/HUQ=;
	b=SNl+0qlJ4qYSznqTLuABTYf6GV7JKE/FvDdUzdNr6vuZ1PmGGRjpzyIqrD9VjKOr1gj9
	 CE5hq8+/NouwNcBtTbw2ozIwfw+PXl1uzzadRZSGP7yND7SPNKFVinG/NhAHHm2ejhvYf
	 smrN3tQquIRWWxaLl9FiCJWjE9zDr3bGWHCM4wFxnYEHZYp3tzQ29gGa/YZUwzHa3jhzE
	 Cr90FMibhr0owwFEZJCZyuVFGgeXcCWA7EFM0G5v0/md3LCLSTtPdMupCSkcaCdw4zPkl
	 AwvHCAAD2hl7t2mJoLM5UvVcKOy6SWMv7PdPE4n5J1j/xI7o7rJwQeLDqy+wrJSbbVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=rre5WqEt;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE0B606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EE0B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=rre5WqEt
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so11664295e9.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795191126; x=1795795926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a35Mq+RYpt2dEaWC1d1eJMfVyB9If3Q8Pl622VJ/HUQ=;
        b=rre5WqEt0XIIzu746pRmcbTYVoZFrtf9ZFff4VeOTjzJKrx4xPLRNIgj/pe9UkV7kI
         ZQ7vBRScwwMCf3kXkZHgH7LRGEPFzOkbAiyrMu6MX3jB7+usIHcM3VDwvgttWJD/oqEO
         iJxUIGzDcp+hcXbzpecm05CisHey7nbMYGxok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191126; x=1795795926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a35Mq+RYpt2dEaWC1d1eJMfVyB9If3Q8Pl622VJ/HUQ=;
        b=JyFykQrDH395CEYRLuWeJBq/nhpAiQ0xgyIEG8nkGwSAy0ThTRG5MNiaCtGdJZkRc4
         AoZ0hd26I5tyKmx1lN9aQWhYvQDdFVLpMHeSVWrEk1yHqdByRfY6yNRjAgiftcwoV9+L
         wgm8M+8Gn239rSNEm8P9BWBO4UM//ZwNXip6sU9WlYs/J8umhRy/jR7qHYywXhXNfQ7B
         bqEKIa7rDrCz6pqv5o/1kMmdUd7Gsoz1BEoWpu3nj/fX3ifLIed3bjgb01pMP65hQWTZ
         1BGlZZIGBMmtvK2tLCMdcwCdWvngPgBjonT1um4hWc74egxsTTjjv6sojUnaSdZWemNR
         tbiA==
X-Forwarded-Encrypted: i=1; AL+hErH6ynnpr7n6onQEDGj6/4lOKB3/AH/TZ7DvkgErbnX9656XwjJbTtMtikvFIZYfiUUhQSHmz9M9hEH3@vger.kernel.org
X-Gm-Message-State: APuU4Z+Hi+nkFz6lJ28SXexxIHZX8lIbcLa+Y5lN7NkoOybP7aHeDMBP
	6xPyuijSeJYt0uvIhZsNcTWjH0+yHV3aV+CVXiitCHWwfkAMuLBKAJAXr0TqI5/VfyrTICZMnSE
	mMna2
X-Gm-Gg: AYBFou1D4setNWUsUD+hFTCy0m4xOU/HgM9a7C/McaRsjn/2bwg8FXVgEXCttHUy4Wn
	/XwNMvrloO0ze9WLEtFH2pgRrunEn7u3DWr2xLhwtYSnn+awVvR/UqgbHHbS4UP5nr5Lse5vYZN
	HZJIvZ/hclpqDBQ/bjldJvJfFFZGebiSj8UZYdBvDl+VhqD2H/d6bMmlcVUG4xGNg7gwKBYiXLU
	oYCRIGbtrkseQHYMoQ3mcHn25OO2F/VZCxQ/57FG5GnZdBTP0b4auhM5f0f1rE8buv9/HN9i8KO
	U98BzveDeUOQZzYl6RQKtuEMdJiMxVeAcctGFjx/+buEV3roXABQbCsNlryzJFEK//wbPSr9vZd
	VvhnVx/K93lEo2WqQVIlTnwH5mozBOxPji07VTUlnSZYRepLQ8bMHAwC38xrEh69ze3HLtfXmDu
	PwgugPnsfHx42F+J2npMvpAtcXAgPhbCKVK+XTVjbGDgN3lIWTUoG+ETnUXc5S+GGjxb9NItvz/
	dXvay9pXNAQTAOX6dbvJtTnCs7ApGK3uVjzgxKW9a9ByFcY0vQ1YxN8bLymGZl+T+r9RXX8SeS4
	gp6qfbDDvjrhP/MyLLrUPN7//hddnyMMZMoWwP6dqiSFT71C+XsdNt8e5PArVbMg5s1jfZAHZzl
	CCyje5bL0HAb3B+hGg8ir1Bfy4wVuRWrQ8OGiNaSA3Y9lg3NWyBs=
X-Received: by 2002:a05:600c:a15:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4bb88938a62mr81026755e9.28.1795191125848;
        Fri, 20 Nov 2026 08:12:05 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm143459745e9.3.2026.11.20.08.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:12:05 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: imx8mn-bsh-smm-s2/pro: add boot phase properties
Date: Fri, 20 Nov 2026 17:11:53 +0100
Message-ID: <20261120161159.1944199-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

Add boot phase properties to the resources needed during the boot
process.

The BSH SMM S2 and S2PRO need UART, watchdog, PMIC, GPIO and boot
device access.

Tested on BSH SMM S2PRO with U-Boot v2027.01-rc1.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 .../freescale/imx8mn-bsh-smm-s2-common.dtsi   | 22 +++++++++++++++++++
 .../boot/dts/freescale/imx8mn-bsh-smm-s2.dts  |  2 ++
 .../dts/freescale/imx8mn-bsh-smm-s2pro.dts    |  2 ++
 3 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index d20393c2d901..5515236d3c09 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -77,10 +77,23 @@ ethphy0: ethernet-phy@0 {
 	};
 };
 
+&gpio1 {
+	bootph-pre-ram;
+};
+
+&gpio2 {
+	bootph-pre-ram;
+};
+
+&gpio4 {
+	bootph-pre-ram;
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c1>;
+	bootph-pre-ram;
 	status = "okay";
 
 	bd71847: pmic@4b {
@@ -95,8 +108,11 @@ bd71847: pmic@4b {
 		#clock-cells = <0>;
 		clocks = <&osc_32k>;
 		clock-output-names = "clk-32k-out";
+		bootph-pre-ram;
 
 		regulators {
+			bootph-pre-ram;
+
 			buck1_reg: BUCK1 {
 				/* PMIC_BUCK1 - VDD_SOC */
 				regulator-name = "buck1";
@@ -244,6 +260,7 @@ bluetooth {
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -280,6 +297,7 @@ &wdog1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdog>;
 	fsl,ext-reset-output;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -326,6 +344,7 @@ pinctrl_i2c1: i2c1grp {
 			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL			0x400000c2
 			MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA			0x400000c2
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_i2c3: i2c3grp {
@@ -346,6 +365,7 @@ pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x040
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_uart2: uart2grp {
@@ -369,6 +389,7 @@ pinctrl_uart4: uart4grp {
 			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX		0x040
 			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX		0x040
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc2: usdhc2grp {
@@ -414,6 +435,7 @@ pinctrl_wdog: wdoggrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B		0x046
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_wlan: wlangrp {
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
index 11a1ba5bfdb7..5add6a8e1c59 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
@@ -21,6 +21,7 @@ memory@40000000 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -43,5 +44,6 @@ MX8MN_IOMUXC_NAND_READY_B_RAWNAND_READY_B	0x00000056
 			MX8MN_IOMUXC_NAND_WE_B_RAWNAND_WE_B		0x00000096
 			MX8MN_IOMUXC_NAND_WP_B_RAWNAND_WP_B		0x00000096
 		>;
+		bootph-pre-ram;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
index 475cbf9e0d1e..b48905a9b4dd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
@@ -85,6 +85,7 @@ &usdhc1 {
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	bus-width = <8>;
 	non-removable;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -133,6 +134,7 @@ MX8MN_IOMUXC_SD1_DATA6_USDHC1_DATA6		0x0d0
 			MX8MN_IOMUXC_SD1_DATA7_USDHC1_DATA7		0x0d0
 			MX8MN_IOMUXC_SD1_STROBE_USDHC1_STROBE		0x090
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
---
base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
branch: imx8mn-bsh-smm-s2-bootph

-- 
2.43.0

