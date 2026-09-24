Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE6545D915
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268610; cv=none; b=MVd78nkm15Tt6sPkGlj+BEfmd9/GgYdoAup3jCyNOV4D1I6LRtHK892X6jh8lVe90mEBq8BIwWiCSRtpfX860S8gRRTUvS6hoS6Oq0gCFjZANGngh/RDCrdMixW1ATjxWkc63ZzGyIbmgOsI862IPD8RDGn3LaHvPJq/9rdT8dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268610; c=relaxed/simple;
	bh=Za87flAote++s7Pn7UtJWpkNBt3IMKZ9Wwr01f4xxGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cznY8520catEP/HaoKeZT5tQ81twcgo3nENDplGeH8HVjQ2Z7M7TU8IzCXFo/HekVa72S1Ul0Q/V8iz/HFNqf0FgCcH71dVxKIwS1WMzCY8avXyS4p98pmO3HHyOfylE126LuQZuGz+aHKCfrwLI4h94/9WB5mUYJlBcYJQhdJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=gj97qixY; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="gj97qixY"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso13715f8f.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790268607; x=1790873407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AzSmeiBBpTlgTrANysRJi9lJX2Ve1g4o0H/NUCnUg0=;
        b=gj97qixYwU5zxsOCfjAN+//uCJ1ZHs7PFAH5tNKn39JFEH2hNuKfw1k8vSDbuR8J+N
         hazSzQGyx2tH74C3C+zljE1xEGhzIyFBB9Tbuc0v4xMfkAgzeXoH750tZwCkooyX044x
         T5LMEDLYEvvdERC5aNjnQ3se85LRDCFVdGT15V8i2VKTW7xezCu/vR0Ke5H+4x/Qc4XZ
         3iGxwNKe1KlAuKyME1keawwKiaTZCduyvFTyARYE9O1UPAaMVLstiYJeiJVRKldl7xc9
         p/CcKNdVC7w2oB2qeolAZXtgg88QosfgidAD2NfDhxmSqntKlzl6EwSPUUlPxDyH/up1
         hjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268607; x=1790873407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+AzSmeiBBpTlgTrANysRJi9lJX2Ve1g4o0H/NUCnUg0=;
        b=FZl53ZcNu9EtkpNYxQgiLXmSFqhRS+u17NbJo/phUYbDKIWxLKI5acG96exMQuPx6B
         /M0WzspYttqKpKl33w4g2ODmZN8xvBywXGh7uTTjo04c8ilysY2e9y5FU7DPs8siB3Z9
         92oNmTTeEHuS9dR3IbJHN1UN6qyZwx3OtvAQt0MTMwkcPooZXxVOOmAxWbochZFPgsMy
         SN8ch8p2wM5c53bwO1zDDTvmbTkeWhNbDT9uq/pEdqYZwQlvJou9Sx6DNnlbMDSOmLhN
         dOmg9wGrgyGMoEOOWfWXD9zeGbM99QhKiLSjA3Gk+CtQUGNfO+aDXKUybuZwEZNfqnCD
         YQ8Q==
X-Gm-Message-State: AFuF++n/Uwmt/7SENy9P0whnHi5RCCiJuMLXr3cRGOTrHNDGd2FSwV1h
	RMvUAW01WCMcCLAkJlwu011Sc6ebKrjmuymwuaMBem5ATzLxvIXUsCQUr94rmO4N8AagjIA/H4H
	R3kpK2Qs=
X-Gm-Gg: AYBFou3WL1TAkTApemaa5f6XMXJiylIQp2sTxdKo64G4Wrb73x5OaOQuOgp7u9FHzGU
	DRvKCGxEdlcEz4nnfHdGJetxboHwYwrvPeMFnWH7hk1XmEeW1+EdYs19IP6KH1IVWPNW3ajF+1m
	sxY8wCA/nkqW2zr7FE7XiG03PFMsFwlNRWBC52CJyDFHUP++7z4LLHxVxIeYWrfBkZ77sW5yJqy
	F8OMe6Kunkt1xMXa0YkmGAMxN0/YaGK+vcQkF2Opx0OP3yGD4wwpC9kZy21i3rgKBOQRcxyPtnX
	RfPSJ91rTg9N/sFsa9tdZVZzrwwfJem7kXWEnRUMIhU5wotOAougFNWzbfboVWJlER9XEmWWDqF
	AlexodG/YWsOY74NiSrOfNTW7dfwr8qcu9ra5mGnF1LTRxztPb/y413t2TK1nXv7Eq/FMB94AOA
	t3gGjQH2bVlI4AMAZlETIk6C1U0CftMUtCLUyW1mGxphGT/T6EA1G8yZOxopANquQY/V7EykQFr
	kOTXWnuULIggYpxMhZhkB20G7UqCe+HO3EK
X-Received: by 2002:a05:6000:2f8a:b0:487:27f6:a4d2 with SMTP id ffacd0b85a97d-488716a5f27mr5629854f8f.34.1790268606795;
        Thu, 24 Sep 2026 09:50:06 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3625ccsm327139f8f.22.2026.09.24.09.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:50:05 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v5 3/6] arm: dts: sunplus: add PWM, watchdog and MMC nodes to SP7021 DTSI
Date: Thu, 24 Sep 2026 18:49:19 +0200
Message-ID: <20260924164922.117236-4-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924164922.117236-1-ag@ffroot.co.za>
References: <20260924164922.117236-1-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device nodes for the peripherals that have upstream drivers:
- PWM controller
- Watchdog controller
- eMMC controller

Add a label to the gpio-leds node so board DTS files can override it.

Move the memory node from the DTS into the DTSI; this chip has the RAM
integrated and it's not possible to add external RAM.

Remove three board-specific pinmux nodes that do not belong in the DTSI:
- emmc_pins: eMMC pinmux, moved to the LTPP3G2 board DTS.
- sdcard_pins: SD card pinmux; the SD driver is not yet implemented.
- emac_pins: Ethernet pinmux, will be defined in board DTS files that
  enable ethernet.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 .../dts/sunplus/sunplus-sp7021-demo-v3.dts    |  4 -
 arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi | 74 ++++++++-----------
 2 files changed, 32 insertions(+), 46 deletions(-)

diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021-demo-v3.dts b/arch/arm/boot/dts/sunplus/sunplus-sp7021-demo-v3.dts
index d5c5ffc20565..d764fc1f946e 100644
--- a/arch/arm/boot/dts/sunplus/sunplus-sp7021-demo-v3.dts
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021-demo-v3.dts
@@ -23,8 +23,4 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory@0 {
-		device_type = "memory";
-		reg = <0x00000000 0x20000000>;
-	};
 };
diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi b/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
index ae9bbe0320b8..9963501b6a41 100644
--- a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
@@ -17,6 +17,11 @@ / {
 	compatible = "sunplus,sp7021";
 	model = "Sunplus SP7021";
 
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x20000000>; /* 512MB integrated */
+	};
+
 	clocks {
 		extclk: osc0 {
 			compatible = "fixed-clock";
@@ -84,50 +89,10 @@ pctl: pinctrl@100 {
 			clocks = <&clkc CLK_GPIO>;
 			resets = <&rstc RST_GPIO>;
 
-			emac_pins: pinmux-emac-pins {
-				sunplus,pins = <
-					SPPCTL_IOPAD(49,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_CLK_OUT,0)
-					SPPCTL_IOPAD(44,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_MAC_SMI_MDC,0)
-					SPPCTL_IOPAD(43,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_MAC_SMI_MDIO,0)
-					SPPCTL_IOPAD(52,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_TXEN,0)
-					SPPCTL_IOPAD(50,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_TXD0,0)
-					SPPCTL_IOPAD(51,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_TXD1,0)
-					SPPCTL_IOPAD(46,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_CRSDV,0)
-					SPPCTL_IOPAD(47,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_RXD0,0)
-					SPPCTL_IOPAD(48,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_RXD1,0)
-					SPPCTL_IOPAD(45,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_RXER,0)
-					SPPCTL_IOPAD(59,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_TXEN,0)
-					SPPCTL_IOPAD(57,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_TXD0,0)
-					SPPCTL_IOPAD(58,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_TXD1,0)
-					SPPCTL_IOPAD(54,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_CRSDV,0)
-					SPPCTL_IOPAD(55,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_RXD0,0)
-					SPPCTL_IOPAD(56,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_RXD1,0)
-					SPPCTL_IOPAD(53,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_RXER,0)
-				>;
-				sunplus,zerofunc = <
-					MUXF_L2SW_LED_FLASH0
-					MUXF_L2SW_LED_FLASH1
-					MUXF_L2SW_LED_ON0
-					MUXF_L2SW_LED_ON1
-					MUXF_DAISY_MODE
-				>;
-			};
-
-			emmc_pins: pinmux-emmc-pins {
-				function = "CARD0_EMMC";
-				groups = "CARD0_EMMC";
-			};
-
 			leds_pins: pinmux-leds-pins {
 				sunplus,pins = < SPPCTL_IOPAD(0,SPPCTL_PCTL_G_GPIO,0,SPPCTL_PCTL_L_OUT) >;
 			};
 
-			sdcard_pins: pinmux-sdcard-pins {
-				function = "SD_CARD";
-				groups = "SD_CARD";
-				sunplus,pins = < SPPCTL_IOPAD(91, SPPCTL_PCTL_G_GPIO, 0, 0) >;
-			};
-
 			spi0_pins: pinmux-spi0-pins {
 				sunplus,pins = <
 					SPPCTL_IOPAD(26,SPPCTL_PCTL_G_GPIO,0,0)
@@ -291,13 +256,38 @@ uart4: serial@8780 {
 			pinctrl-0 = <&uart4_pins>;
 			status = "disabled";
 		};
+
+		pwm: pwm@7a00 {
+			#pwm-cells = <2>;
+			compatible = "sunplus,sp7021-pwm";
+			reg = <0x7a00 0x80>;
+			clocks = <&clkc CLK_DISP_PWM>;
+			status = "disabled";
+		};
+
+		wdt: watchdog@630 {
+			compatible = "sunplus,sp7021-wdt";
+			reg = <0x630 0x08>, <0x274 0x04>;
+			clocks = <&clkc CLK_STC0>;
+			resets = <&rstc RST_STC0>;
+			status = "disabled";
+		};
+
+		mmc0: mmc@3b00 {
+			compatible = "sunplus,sp7021-mmc";
+			reg = <0x3b00 0x180>;
+			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkc CLK_CARD_CTL0>;
+			resets = <&rstc RST_CARD_CTL0>;
+			status = "disabled";
+		};
 	};
 
-	leds {
+	leds: leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
 		pinctrl-0 = <&leds_pins>;
-		system-led {
+		led-0 {
 			label = "system-led";
 			gpios = <&pctl 0 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
-- 
2.53.0

