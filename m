Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF4A4A1E07
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263758; cv=none; b=qbdF3QphWWhKbNHK9fOkCN1tzAu0wBI1XUfPHyOrIMBWbPJxNXYYhvI4PvT6Ic2NOjUUYcAPUP1KRiS6CBGu0Z1SIhncaXrnY8+koZ96cQmiRS6dPdtqiGBe9f1e8KR/KAfGETTeg6RAXwsiKXEu9TOmeZCEWYKkjGAloTI89Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263758; c=relaxed/simple;
	bh=ELakquxIMCzvKuo96nYWf6NhSdmUvNFR/C1228arM0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6jW+YZuixHjI0HacSB1FGr70seX4qFzwAf5COHerlKhcAMFwjpuV2ZI1AJenBuHk/svtg6SJ33YSVvWkVxY1x+NjXJVNUqs0ZquOuMAKFPLOTgC7x/qJNsOz9bBHFveMMaOFTg1h1eOGkBzK6qmRrpQAoPz208sOAzwe++hR8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=y1DAX0Np; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="y1DAX0Np"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887635e952so232199f8f.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790263754; x=1790868554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4nApwDcK7osAtHQ4CZDuyWi27LJxNQtg3TKGcmGjpI=;
        b=y1DAX0NpUsMX6f9/pj2W5crqsm5ysn7iw8c+y7MMRvnwloEIQd0FsyMOmgPNffaPJ/
         V96acq9QJsCRv0a54okYf3GK/IFuoCk3szDNoLrMuwNKbu8zwbywR/P0o/P3dAl2hZh9
         4TOo4sb4nnN1WwQr0o7RcqKec+ibSCUXJtaXN9mTIAaB3BUXQnBR+0XF5Gp7c5BjglZE
         bz/bH5WMeISLrgJ2EB08QJzR/5ygnD8p1UC9F+9T5LhXHWw1sedRDtrSPLbe+DSkwCxC
         HOHgMTp3CW0vYMDcicCKZAMxWGU4SMZgzOzn7Fdl3wm7n/3ZU1aA9QzK7EoLpTvOWuAu
         hxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263754; x=1790868554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4nApwDcK7osAtHQ4CZDuyWi27LJxNQtg3TKGcmGjpI=;
        b=f5jP5i475LHbEAoSdL3n3MlHBSEgs46GXnbmgmIlaMPM+vaD3x5OKWOKWl44aKgVA2
         77s3PwR+F3zC9CZpybWqx/T7YR+tVbVRH25JZYh+BHfBBnnQ3Y2ulpxyrTl5I+tfU0el
         PORuQVVla2MwGPdWlayUyiuLoJcQwv81f2rBERgrbxl+pmbXnQVfrR/V8tnuulBCTU/E
         49Z6pYPoFyXyOulMVy/4lZRHNYCYu/EmUvBV5WxFP1VrCxmSZtkz3p0UofVLGYG4EbV4
         kEGNCVkVm8B1EWC2Fo7dx0rUsnMdGf9Ai1o6mBiNUPsh1Pl0pzSp8gAIU0fSmf5CNBGG
         T1HQ==
X-Gm-Message-State: AFuF++m/pMaIxBzlatmn7X6EuRpaJE+tgOY9lVfWvW/A4+u75Br8E561
	KiAs4pGgz7bxH1++k7nujAfVAEOwu5HZ11VBvIfim2jfEckY8JJXhyFoZuuVD6C6rDg=
X-Gm-Gg: AYBFou1CJDRFGiUIxuJdpPUA1BN9voMxvBebCQdWfVQ7A8YTGPBuzIF7c4uStxU00Qf
	BALQtTna08xSWGFubcmpBVDEzaxwJi45ojN6sk7trVYvIrZFzuHq3CLTAh1fRwh3VlthtfZMBkk
	CV620ohJkEraK64wxnHWwrKs0NqwcNvMoEyNpb6gLpX4imL0llYUr/+lJCPzwFHeYnR/er3EHxo
	HEIfQAM/yRKY6Dfq7DtUoLBjOwGIn6dx4I5emXMjquycBz8C6B/kYmpdslLZHYq8ROEDT9rfTXz
	keDe3E1iX9FtuKMOhpKS6YxE0SPpA4Kimi85oVfSTB+01nwNSASLU+da24q+7cKvqyWHreW7Ai2
	7gXjll1qYpzZ+RHe4fpWCbGVbIz9eEYTdUCmWqdZ11YoSpmqTwMDw0CIiAqErpXSI71smOPRBPG
	HMpBsSk0P5eSu31zZLqzcE9wfJpAbMCh2PINYebA57oitoPNw9QqYBo36vsFCefl94tqVySTex1
	cLpmRTSy95i6yEXN0UupBL08U6OF51q7wdI
X-Received: by 2002:a05:6000:184e:b0:488:5fa9:34aa with SMTP id ffacd0b85a97d-488716d22bcmr5931880f8f.20.1790263754406;
        Thu, 24 Sep 2026 08:29:14 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm14781552f8f.0.2026.09.24.08.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:29:13 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v4 3/6] arm: dts: sunplus: add PWM, watchdog and MMC nodes to SP7021 DTSI
Date: Thu, 24 Sep 2026 17:28:41 +0200
Message-ID: <20260924152844.81705-4-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924152844.81705-1-ag@ffroot.co.za>
References: <20260924152844.81705-1-ag@ffroot.co.za>
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

