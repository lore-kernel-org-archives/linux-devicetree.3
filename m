Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539472;
	b=OTlisBcGw4Ia954hgqujyEEz2Lonal6ljAbrrngPipkToEzB5hn9Y/dUbhSSSZEtvcoV
	 7kCzUP5GdMhxEWW+lAuR8jBXqovOa//FocpzzezM8sw38qCWpX6HWI43DYyPuCKGppQx5
	 mSlrmrkSbs3NXfdkaLzfNtVXCsesHHoO/9zJW8Lbt0v1UkhNxmay0jA5SNmAoLSFvdF5l
	 2zGEqjHiHPRb6pLtUAOHXCqrxen1wYva/E3N4RBQxaFM8JKX3NphWPGjNKgXPMPUYDsUq
	 XkC84UEZqX8DwhSsztrAJmaiBCSdXWBfWLDtI1JyeyuR7u0baVLhxZ+6B6Wv7L8I3Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FNmujXb6LfKjJX2ZlxoiiNyAJelpmJZVaYM64gdY/bo=;
	b=s4Y1HZO5MWHnoVMe33zdiV1h1gFWLAMwq2h7gaLTL/3nLNr2qh31beqxoEb3qci3dfdm
	 sNDo8yjM9qSo9ETHRk+aIROJFfMlwcgzxgGjKJvkIIZvEk0vtq94O2pKeFnJ7wlbVh2LC
	 BvQRi8166uScE/64yR+QeBJw+QLYBrKPGj7VcRTuExclkRICdWfWrvGuV16cUuHA+QB8A
	 DOkbBYGCk0jvuldakSyQIXRdlvnB7lciRpflyY986k5A/oeIinrg2JON65E5v3GNCnsCG
	 AQbac3scoHVcePWoVtHzz4pHuOuD1yfeia0jr4KaJo6351o9N0SRurYG6gL32nshrSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qN+msQuU;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4F3606A685
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB4F3606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qN+msQuU
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so3679062f8f.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795539470; x=1796144270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNmujXb6LfKjJX2ZlxoiiNyAJelpmJZVaYM64gdY/bo=;
        b=qN+msQuUjF9QpAiF6J2ugc0+0w1pIJfcroHv5UH8MxXSaYM0TqRlj7zaC7F1oDmOA6
         6KVCsgEdZnfPockFvHumL1x/LJTy83aflnkfr1Ay6oMdGi1NQL1syElDPOh3OiiCgDOl
         NzU0jm9B2+mjszkJoU4H2GRXcQZHiEltReZ1QTukhusX/MukKnViAhiK69iGU04JFHGO
         CHFnIqKIUHNN8u6nYjeULKqlaOcnfj13xWt7SIuZEndYfgH1ODOsPF5TE4ryjVDL7MRn
         FI5aMETjI1+8dd0R1ZfGf54rhpjk5hZGmxXxvZ/CtV4Qn9yOaXKkzLhGzyqx006Tkqx8
         bmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539470; x=1796144270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNmujXb6LfKjJX2ZlxoiiNyAJelpmJZVaYM64gdY/bo=;
        b=SUdXQCItKqUZDXwW3KzL7+WqgWMT2DDk5TZVkvysHUOMxOrScxW5sLc2XOIm3wbP0F
         u7tlW5NpIOY05M5VmJnZLvoSUvxPn9KlXwAZqsifA2UILabkeTTdS2SaE7SeQgm/8Zya
         PvsQyWBN1sgEInhusJ3kKTTaexkgzxkcNOfMOu1njKfLob6QwhCyHaOCBdnzINp4y0jA
         2W4jDaSrtHcifeOrD1Cfw3u27sXBx6sQwTzyxxBYq31IVRTzdnsms1h2VKNhoSAHN6Ig
         O93b9cOnfeUW167Ly+Ktpp/rXcTz5lzAPLIQ9QhFmOGg0BC0jso1NO7Yecc91cEJJkIZ
         pSNw==
X-Forwarded-Encrypted: i=1; AL+hErG1Qd4Vk1Jej6zGrFZ6oZ+0Db7MS94DBQbmH38Y42LKP5mqcE2Ny9rBI12UGhPGb+V0mVAVcFt2m1hA@vger.kernel.org
X-Gm-Message-State: APuU4Z/L5TFZlJ8CMr6+GPnvYd+QobPdBINdcHd/K5KeqTXxEtFYhaGg
	eJEcTpy3QHd5cO0tg4M6LzbMTe5u/nKjYQ9VlN3zgiTA2pz+TA3wU7QH
X-Gm-Gg: AZFdTZeuer+gIlTdw+YhX6IkFKiROMzMP0nlwvv9dz3xKwgShMn7X5Ttn62cBh7bwv4
	6Es/oiYQEbAkSkA2KGALwMCnZvjjzmVKuRJn0mAB30MQ0TvRT8S6np9v4AND/fx14b8VjO7NqMO
	BUaGRUpdaKv24RhD/7LhAnQU2NsrsqDlzeS+ihDasHsuZXMkTOXysXqMQkO+95e3HOS6gtpA09P
	N8LHS8gTJsD4Z9hHWV/387KjlIFt8b8dC2sxjGhQUd2ZpCnbbnI4MJtUlMaQzYYbtv8uiGQwBCZ
	crDHtEJNtsAQXmKIzkGKoE5H9dOSfwh9JuKTmitFms0eqC55Uf+anR0zhpohmNZFPafm6zH0tCf
	PhB74hKgKRVFDoAR6kKgyHCvNehfQLzmuzb3T8sbiZO7VVDntX6zlZKZq0Or5jODxKkGgOpAylr
	WDWKSqAaKsCU0oRPueuzrxTFLNSmZn9N6xlatWvrhP4tlR4k/V/zOw38ac7wjshq7UUo4GUUwaz
	uAm11K06Pb7G66ahyZiPIT8d6Su0dcAWp5zM29F8hMQDdpvU0ptDgauGrmbzWwpv8LFWNt7uJwZ
	gOs+wtgJfeKa8qj9y2vdmz+DIubJBcMF1mxHOVTDn5lD1gR7o2a2ysImCoXMHKJZmw==
X-Received: by 2002:a05:6000:4617:b0:4a9:760f:1824 with SMTP id ffacd0b85a97d-4abb19c153bmr29395730f8f.21.1795539470283;
        Tue, 24 Nov 2026 08:57:50 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d107:658c:9ded:696c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm28794104f8f.20.2026.11.24.08.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:57:49 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 24 Nov 2026 16:57:47 +0000
Subject: [PATCH v3 1/3] arm64: dts: renesas: r9a08g046: Add SDHI nodes for
 RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
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
Message-Id: <20261124-sdhi_rzg3l-v3-1-67cdc83b7e48@bp.renesas.com>
References: <20261124-sdhi_rzg3l-v3-0-67cdc83b7e48@bp.renesas.com>
In-Reply-To: <20261124-sdhi_rzg3l-v3-0-67cdc83b7e48@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795539468; l=6995;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=Ev04D/2dmUKKADHCQT1A85zgHK5TqTFvBPMJYI4lOIA=;
 b=3AO5G9CQy92SyZpfjHqG/PKnc3BB1M2gprhJv/cVRgF+2JqqKx12UwABhXS3SL1v3qoDmjECl
 /wk1dX9x9LJDQFDGeg10v990dT9puBAjrVJyRUKqOnSFQ2FYDH145eb
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree nodes for the three SDHI controllers (SDHI{0,1,2})
on the RZ/G3L SoC (r9a08g046) and enable SDHI1 on the RZ/G3L SMARC
EVK platform with pincontrol and GPIO-based voltage switching
regulator support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3
- Fixed syntax error in sdhi1 #else branch.
v2
- Disabled sdhi1 when RZ_BOOT_MODE3 is 0, so its pinctrl and regulators
  are not left enabled.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 73 ++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 92 ++++++++++++++++++++++
 2 files changed, 164 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index bb69e5e3528d..b710f47d3f03 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1068,9 +1068,80 @@ dmac: dma-controller@11820000 {
 			dma-channels = <16>;
 		};
 
+		sdhi0: mmc@11c00000 {
+			compatible = "renesas,sdhi-r9a08g046";
+			reg = <0x0 0x11c00000 0 0x10000>;
+			interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK>,
+				 <&cpg CPG_MOD R9A08G046_SDHI0_CLK_HS>,
+				 <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SDHI0_IACLKM>,
+				 <&cpg CPG_MOD R9A08G046_SDHI0_IACLKS>;
+			clock-names = "core", "clkh", "cd", "aclkm", "aclks";
+			max-frequency = <150000000>;
+			resets = <&cpg R9A08G046_SDHI0_IXRST>,
+				 <&cpg R9A08G046_SDHI0_IXRSTAXIM>,
+				 <&cpg R9A08G046_SDHI0_IXRSTAXIS>;
+			reset-names = "rst", "axim", "axis";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		sdhi1: mmc@11c10000 {
+			compatible = "renesas,sdhi-r9a08g046";
 			reg = <0x0 0x11c10000 0 0x10000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK>,
+				 <&cpg CPG_MOD R9A08G046_SDHI1_CLK_HS>,
+				 <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SDHI1_IACLKM>,
+				 <&cpg CPG_MOD R9A08G046_SDHI1_IACLKS>;
+			clock-names = "core", "clkh", "cd", "aclkm", "aclks";
+			max-frequency = <150000000>;
+			resets = <&cpg R9A08G046_SDHI1_IXRST>,
+				 <&cpg R9A08G046_SDHI1_IXRSTAXIM>,
+				 <&cpg R9A08G046_SDHI1_IXRSTAXIS>;
+			reset-names = "rst", "axim", "axis";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			sdhi1_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI1-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <1200>;
+				status = "disabled";
+			};
+		};
+
+		sdhi2: mmc@11c20000 {
+			compatible = "renesas,sdhi-r9a08g046";
+			reg = <0x0 0x11c20000 0 0x10000>;
+			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK>,
+				 <&cpg CPG_MOD R9A08G046_SDHI2_CLK_HS>,
+				 <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SDHI2_IACLKM>,
+				 <&cpg CPG_MOD R9A08G046_SDHI2_IACLKS>;
+			clock-names = "core", "clkh", "cd", "aclkm", "aclks";
+			max-frequency = <150000000>;
+			resets = <&cpg R9A08G046_SDHI2_IXRST>,
+				 <&cpg R9A08G046_SDHI2_IXRSTAXIM>,
+				 <&cpg R9A08G046_SDHI2_IXRSTAXIS>;
+			reset-names = "rst", "axim", "axis";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			sdhi2_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI2-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <1200>;
+				status = "disabled";
+			};
 		};
 
 		eth0: ethernet@11c30000 {
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 517747aef36e..b096ba9e3d99 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -16,6 +16,7 @@
 #define SW_GPIO9_CAN1_STB	0
 #define SW_I3C_EN		0
 #define SW_SER0_PMOD		1
+#define SW_SDIO_M2E		0
 
 #define PMOD_GPIO4		0
 #define PMOD_GPIO6		0
@@ -40,6 +41,7 @@ / {
 	aliases {
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
+		mmc1 = &sdhi1;
 		serial0 = &rsci2;
 		serial1 = &rsci3;
 		serial2 = &rsci1;
@@ -71,6 +73,19 @@ codec_dai: codec {
 		};
 	};
 #endif
+
+#if RZ_BOOT_MODE3
+	vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
+		compatible = "regulator-gpio";
+		regulator-name = "SD1_PVDD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pinctrl RZG3L_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
+		gpios-states = <0>;
+		states = <3300000 0>, <1800000 1>;
+		regulator-ramp-delay = <1200>;
+	};
+#endif
 };
 
 &canfd {
@@ -257,6 +272,68 @@ scif0_pins: scif0 {
 		power-source = <1800>;
 	};
 
+#if RZ_BOOT_MODE3
+	sd1-pwr-en-hog {
+		gpio-hog;
+		gpios = <RZG3L_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd1_pwr_en";
+	};
+#endif
+
+	sdhi1_pins: sd1 {
+		sd1-cd {
+			pinmux = <RZG3L_PORT_PINMUX(J, 0, 8)>; /* SD1_CD */
+		};
+
+		sd1-clk {
+			pinmux = <RZG3L_PORT_PINMUX(G, 0, 1)>; /* SD1_CLK */
+			power-source = <3300>;
+		};
+
+		sd1-cmd {
+			pinmux = <RZG3L_PORT_PINMUX(G, 1, 1)>; /* SD1_CMD */
+			input-enable;
+			power-source = <3300>;
+			bias-pull-up;
+		};
+
+		sd1-data {
+			pinmux = <RZG3L_PORT_PINMUX(G, 2, 1)>, /* SD1_DAT0 */
+				 <RZG3L_PORT_PINMUX(G, 3, 1)>, /* SD1_DAT1 */
+				 <RZG3L_PORT_PINMUX(G, 4, 1)>, /* SD1_DAT2 */
+				 <RZG3L_PORT_PINMUX(G, 5, 1)>; /* SD1_DAT3 */
+			input-enable;
+			power-source = <3300>;
+		};
+	};
+
+	sdhi1_uhs_pins: sd1-uhs {
+		sd1-cd {
+			pinmux = <RZG3L_PORT_PINMUX(J, 0, 8)>; /* SD1_CD */
+		};
+
+		sd1-clk {
+			pinmux = <RZG3L_PORT_PINMUX(G, 0, 1)>; /* SD1_CLK */
+			power-source = <1800>;
+		};
+
+		sd1-cmd {
+			pinmux = <RZG3L_PORT_PINMUX(G, 1, 1)>; /* SD1_CMD */
+			input-enable;
+			power-source = <1800>;
+		};
+
+		sd1-data {
+			pinmux = <RZG3L_PORT_PINMUX(G, 2, 1)>, /* SD1_DAT0 */
+				 <RZG3L_PORT_PINMUX(G, 3, 1)>, /* SD1_DAT1 */
+				 <RZG3L_PORT_PINMUX(G, 4, 1)>, /* SD1_DAT2 */
+				 <RZG3L_PORT_PINMUX(G, 5, 1)>; /* SD1_DAT3 */
+			input-enable;
+			power-source = <1800>;
+		};
+	};
+
 	ssi0_pins: ssi0 {
 		pinmux = <RZG3L_PORT_PINMUX(H, 0, 9)>, /* SSIF0_RXD */
 			 <RZG3L_PORT_PINMUX(H, 1, 9)>, /* SSIF0_BCK */
@@ -312,6 +389,21 @@ &scif0 {
 	pinctrl-names = "default";
 };
 
+#if RZ_BOOT_MODE3
+&sdhi1 {
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-1 = <&sdhi1_uhs_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sd1_pvdd>;
+};
+#else
+&sdhi1 {
+	status = "disabled";
+};
+#endif
+
 #if !SW_SD2_EN
 &ssi0 {
 	clocks = <&cpg CPG_MOD R9A08G046_SSI0_PCLK2>,

-- 
2.43.0

