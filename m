Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA98C3403E3
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 16:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157459; cv=none; b=rTDi+ihBvrSXXkbIwnJY+3e27nX0PmOw+D/J90LO2oMj/Qitst53lRbvsU92gkLtV0PNBh9/cxp3dPakYr8fd9jWa0E9iY50+hyDi+LlZcW+sPX5exnLaUMWI8/BVtEG5uJqBVQYiU3YUD3cepZud1glVjWlaNZ+hJBNCLM1AAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157459; c=relaxed/simple;
	bh=AMyaJAlXeJvniDEF3axE5YHJONY0ub3pEgJ9X2Ql/Qo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=agxNSnnlKaI1ZrC/1S9vkusFxe3SpGZLMXJ0FdY104gjy+STSOVA5R888THrqbIGrjJJ+CqNvouZer3M5x9+uOi4asAj1mMKuLZaIGcB4EoEjsg/XzKwA7KLSonKQksMgH44FlIvMqGPj5HkSy0UbG2V0JkQZ8nH7iVr3dRXk4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cn+ihj7G; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cn+ihj7G"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490686877a1so47672355e9.0
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 09:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157453; x=1780762253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U8Gyx6oCmyjHjdEMoVlTcL2TEpNtDmtm8pRxBC6xutI=;
        b=Cn+ihj7GNMhJ8+WR3iOauYClgeKoV+Y5mjZ2SlZGC0uXGbhmlnwTeCqvDzKWBW3x2I
         KvHiN24UayYZlWdPcTAkQUuHDuzV8PWve1W0/YsHcKQU5f2sRAhrv+wpPYW2MX8JS9qZ
         hjuOPf2+nA9oS1+Y8uqCmD/Y86MpsQd0C7IMB3DbjYVI7reWbojIE8lPEFytypsRk3nH
         xzX0edpB2MJwLEADUmen5OTeEJdXkJep2rOYPGXHfJttXtHyJKCrp095bxLcSRP7pI5e
         e2M8Fs1qx9jkCqEUpBIL1CL5gwETvL+8xbMZa30DQadDPg7ovpniv81rCiGOf34un02j
         lWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157453; x=1780762253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8Gyx6oCmyjHjdEMoVlTcL2TEpNtDmtm8pRxBC6xutI=;
        b=GHOk0Swdzsi50Su9kX4DNuoLhTPhBihFC2JOlXyTGhQXcEgE83PqlloRNd4aw+zLZf
         hGjZ6hBI+TdyFV/DLvk5h7Vkiyj6Vlou+Xfl6MUZDOu9qjWtjp0ACtojtOKGuoWOhcWg
         526ql4lTipa2+pD50p08ySjP9pAlHRsVe/4T2jDpG2ZH6m2XHltTgBLB+DQ64vN3LQ/p
         UtSYIUoIcLURMMdN9rx7qjUIvBM4wp/f0Vgow1Xw6czUCx0aFQ05fJbv/n3YTiosJKOr
         32Yq23nlZmuIEpMbmgwSej5JlUZHzhRi+wzacN0aXsjOLy/yWHCqSa2qER1zXtM/fFiK
         aMpg==
X-Forwarded-Encrypted: i=1; AFNElJ/KG3/MgiRtdx8kWQaLXJ70u/+ojD7GpeKUzQpOvWLlLbNzUSmF0qpFl3+KNE5C9yF/kF3cWxeOPJ9L@vger.kernel.org
X-Gm-Message-State: AOJu0YxPavA3/K5NMX7DGc88q0ofyHV85fjmG6qXcRbVUDSoaIU579qg
	ozLSvcb1K6DykWpAuXx8J4UR9v/CWlk8cRmK4Bhz6Q4g48eBqlGPH0MU
X-Gm-Gg: Acq92OEIhpWJmdFXUCGYn9ntn4CX1tQ+obghvmT4V039WucuayyrpfPmTaeJ0lvN2N9
	rlzJDUTz3YHtPlQ4/PBz89CfBckVHiC3Z3e+upAlEAYBZD/2dDMxYwyXAOZ18nxog/mlMGNCczl
	ECsz6n246DtpgSIwriOZmOvlnFInYdbBuDR73JMsGFkV2QgL87UHeLocY2RM5WFZ48y/XlqJ6kc
	33ZViMbeap2xsZX1WzhNxv60LehBtA4utky82Zh1oIQR28dknxsbXX6yf6gP7nm1boqppjlXdC8
	08pMyXxWlo+2GPIj5r8Bfh3AZRxGk4B1oW1WSavjgO27dgQ2KzpYkL5Px6Oqos2wxOBfeiuQT7y
	0ocz/0CTNo+G43USyQ31WibzF1iphW9ymCPwvFp2Rkw3vaJRFIfEWg7h4wioW2BPiTxuEJbeOwl
	QXx7zWntWJ6jR7Zj/RhbmUP/Ah6xrQnmsbrF8fD7WZ6H7CsRZ5NONHDKxJsG0=
X-Received: by 2002:a05:600c:1387:b0:490:3cf0:8d81 with SMTP id 5b1f17b1804b1-490a2a4e8ebmr51440535e9.13.1780157453099;
        Sat, 30 May 2026 09:10:53 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6f35f8sm105350435e9.13.2026.05.30.09.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:10:52 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 15/17] arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
Date: Sat, 30 May 2026 17:10:42 +0100
Message-ID: <20260530161050.131041-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree nodes for the three SDHI controllers (SDHI{0,1,2})
on the RZ/G3L SoC (r9a08g046) and enable SDHI1 on the RZ/G3L SMARC
EVK platform with pincontrol and GPIO-based voltage switching
regulator support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 73 ++++++++++++++-
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 88 +++++++++++++++++++
 2 files changed, 160 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index f948ae32f6f5..ce42c945fdf4 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -762,9 +762,80 @@ dmac: dma-controller@11820000 {
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
+				 <&cpg CPG_MOD R9A08G046_SDHI0_IACLKS>,
+				 <&cpg CPG_MOD R9A08G046_SDHI0_IACLKM>;
+			clock-names = "core", "clkh", "cd", "aclk", "aclkm";
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
+				 <&cpg CPG_MOD R9A08G046_SDHI1_IACLKS>,
+				 <&cpg CPG_MOD R9A08G046_SDHI1_IACLKM>;
+			clock-names = "core", "clkh", "cd", "aclk", "aclkm";
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
+				 <&cpg CPG_MOD R9A08G046_SDHI2_IACLKS>,
+				 <&cpg CPG_MOD R9A08G046_SDHI2_IACLKM>;
+			clock-names = "core", "clkh", "cd", "aclk", "aclkm";
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
index 624fcaea350f..a4cc07408b3f 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -14,6 +14,7 @@
 #define SW_GPIO4		1
 #define SW_I3C_EN		0
 #define SW_SER0_PMOD		1
+#define SW_SDIO_M2E		0
 
 #define PMOD_GPIO4		0
 #define PMOD_GPIO6		0
@@ -38,6 +39,7 @@ / {
 	aliases {
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
+		mmc1 = &sdhi1;
 		serial0 = &rsci2;
 		serial1 = &rsci3;
 		serial2 = &rsci1;
@@ -69,6 +71,19 @@ codec_dai: codec {
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
 
 &i2c2 {
@@ -175,6 +190,68 @@ scif0_pins: scif0 {
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
@@ -219,6 +296,17 @@ &scif0 {
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
+#endif
+
 #if !SW_SD2_EN
 &ssi0 {
 	clocks = <&cpg CPG_MOD R9A08G046_SSI0_PCLK2>,
-- 
2.43.0

