Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5533803E1
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091525; cv=none; b=BgS41poTrhsexNqSexIRWJqKbjABzLowMbis0rkleKyITK82DkmBTxRhfLTrHYZ+xHPAtKaYm6Gtjbe3GRnlkLmdHrR6laDKrDLG4BIhKbPJ7H+rVuno4UadFnG/dpeABcP/7XRsA0PSMklT1PvEIAtFuXv83xi9jAoKF6tMmuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091525; c=relaxed/simple;
	bh=770vvauxCkSQIAD2FF0wlLT2Nqrx1err+XbH+ZMASVs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YMJ+PjpLSTxe1L1go3/rOvOdwDCZSvAyEqz7eBkXs9Xy414a3U9u0zePKCTSmID7pkG2USelitsr6dcsdx5KloVy9IxlFk5s79YA2nJQoBPQVaMBvM1pFdxa1hewxgZm0FKP1oL2+U3B1hR4Pb7oFEiijeNnAu6Cp7e8b0yy1dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Urz3HQdM; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Urz3HQdM"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbb7926836eso2347469a12.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786091514; x=1786696314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CjG/L6vRX47pDzFHeJpXAhEEn3GJ7KDceCdHzawl8to=;
        b=Urz3HQdMGKHXLP8tmixUCyF1zSGM7YENNq1QJFbxBwj1kSSW4x6FTq8MekuyZHYKZw
         Ub7l440tqEL8HdLC98WLlgMHiwURyUVJcLyKV61v8UJRJi+2dzoUMgDukkLWvQ3/q6Oh
         tgcMC9X6ybVipeouiIG46dar98J3WLj/EY7dYvMkk1UtbRwFt6nx1/FYSu0+D5AzUUql
         7SdWkTdxMOQYXZ00lrFi/5GVwjjTgKIwHgKMVa5VXU8eWjTBqFJT4gBcTkYE/JDWQDLh
         9pZ4u6GiDb4o1cUZ2hCkLR7H305NGnyIkHjg3h4EGx2udMx4nSYA4Mf62PejIojah2Rm
         tWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091514; x=1786696314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CjG/L6vRX47pDzFHeJpXAhEEn3GJ7KDceCdHzawl8to=;
        b=VEIYXtp9kDwXxcSALOeYTkU7q40+Ao4LyuieZngDw9QrHkgamHol25T/zDjrZRUVSg
         kihE09ltfn59wA+c4gZKHWPnx+rBZVQBxX7KThwcgjifCkPY0ZfmTtAPvIIcZ0DYmG9C
         vOyjZnfm+31JwnMb/5gJzsvWeWAW2GV8Ih6PiCoo3Jck+NG7xpn8UfdW95Uyp9A/v/Sy
         67sL66AOCzhqBStMqa5GkNHYDMQeOFFPFTdYKEOcN7ZSjRIXwhSt9uBN3BJZoJF0dLoD
         5f7cjgYrjjYPucsjEO96O+pgTNky34gUPKuFJbqmuOsTeglwZMB9mwSKlG+wJCffmfC1
         fasQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVNHdhVs4LmJ95XLinlt9u2LIiQa6aNoPa/UXQNT0rDYiGJfftCPe48sIFnW9M9kyiDngbKt2gE33L@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7//nPZeKIsutz2xJ0ar8hUKTDJ6PSfffbVJcuULTiU6d0UOlu
	YbCnntFCLqFsalUDXu08XL9WbRwG6nGhN+jKIZIyVjncp5hUr4f/PRga
X-Gm-Gg: AR+sD13YhcL+9kyL5rvMR26Ucg31kb0S8oARmZDYN4bgaM1URsqVoTRz+pR/aqXjY9q
	9A20MCZ2xYpHpbMlwxqNwp5aBT/rQlK9OQklDzHJeLLsrt69bsBNbBB6L7CFqN2QKfz3f9ficOB
	IqJFuyogDnHSLiEbINv40DeFC84L0D5MWOmqvzvZc0wFYMPtUY6uyAa+SXOKksr2irYbG12lEtO
	eUi6NBsmRRRClNY00A5ujt3xT3HGyNXKqESiDPWD9GpJrhG1WxnCVG+HyUAumTd9iArd1+dp0h4
	+RAtbHV0YLijk2karedhzrIS94ACm5ILtCETaazO6f0VQyDOpRALAKvHL9w6sg39M2e2jcDNvoX
	bZSOTKxKaIMj+erIqqiFFnruZIbA0GNtOjL5qArGexTTnX/QQPT/APfp8UiM8nh2zHKo2Cd4nv4
	TyafS0NXVtZqk5cmHHHpz9p3XUT/SdGrEN/chlueVrR8ZQ8TE6vY0iEQNJ5tTnWD4yIYtIqduav
	jWz8wX30Xnc+9Cwb9Pw5T59orAQtCo5CjMKjcmzefNCtSES1A==
X-Received: by 2002:a05:6a00:a1f:b0:847:83bd:6671 with SMTP id d2e1a72fcca58-84f2e04a630mr22800889b3a.19.1786091514166;
        Fri, 07 Aug 2026 01:31:54 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a553071sm627409b3a.43.2026.08.07.01.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:31:53 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] ARM: dts: aspeed: santabarbara: Add system monitoring GPIOs
Date: Fri,  7 Aug 2026 16:34:04 +0800
Message-ID: <20260807083415.672008-2-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
References: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add several GPIO expanders on the switch board for NIC, PEX, and cable
presence monitoring. Due to a design change, ioexp0 (0x20) now
aggregates interrupts from the downstream expanders (0x21-0x27) onto a
single sgpiom0 line, reducing the number of sideband interrupt pins
required.

The new nodes provide:
- NIC1-4 power good monitoring, reset control, and fault detection
- Switch PEX power good signals and hardware SKU/Revision IDs
- Cable presence detection and selection for four SPI flashes
- System power fault alert via SGPIO and E1S GPIO expander interrupt

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../aspeed-bmc-facebook-santabarbara.dts      | 125 +++++++++++++++++-
 1 file changed, 124 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 0a3e2e241063..2a822e38f091 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -616,6 +616,8 @@ gpio@74 {
 				reg = <0x74>;
 				gpio-controller;
 				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <146 IRQ_TYPE_LEVEL_LOW>;
 				gpio-line-names =
 					"P12V_E1S_ADC_ALERT","BUFF0_100M_LOSB_PLD",
 					"E1S_BP_SKU_ID0","E1S_BP_SKU_ID1",
@@ -1335,6 +1337,112 @@ eeprom@50 {
 &i2c12 {
 	status = "okay";
 
+	ioexp0: gpio@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <148 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"IOEXP_21h_INT_N","IOEXP_22h_INT_N",
+			"IOEXP_23h_INT_N","IOEXP_24h_INT_N",
+			"IOEXP_25h_INT_N","IOEXP_26h_INT_N",
+			"IOEXP_27h_INT_N","SWB_PWR_FAULT_N",
+			"","","","",
+			"","","","";
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&ioexp0>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"PDB_PRSNT_J1_N","PDB_PRSNT_J2_N",
+			"PRSNT_NIC1_N","PRSNT_NIC2_N",
+			"PRSNT_NIC3_N","PRSNT_NIC4_N",
+			"","",
+			"CBL_PRSNT_MCIO_0_N","CBL_PRSNT_MCIO_1_N",
+			"CBL_PRSNT_MCIO_2_N","CBL_PRSNT_MCIO_3_N",
+			"","","","";
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9555";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&ioexp0>;
+		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"SWB_PWRGD_P3V3_AUX","SWB_PWRGD_P1V8_PEX",
+			"SWB_PWRGD_P1V8_AUX","SWB_PWRGD_P5V",
+			"SWB_PWRGD_P1V5_PEX","SWB_PWRGD_P1V2_PEX",
+			"SWB_PWRGD_P0V895_PEX","SWB_PWRGD_P0V81_PEX_0",
+			"SWB_PWRGD_P0V81_PEX_1","SWB_PWRGD_P0V81_REFCLK",
+			"SWB_PWRGD_MODULE","",
+			"","","","";
+	};
+
+	gpio@24 {
+		compatible = "nxp,pca9555";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&ioexp0>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"RST_PERST_NIC1_N","RST_PERST_NIC2_N",
+			"RST_PERST_NIC3_N","RST_PERST_NIC4_N",
+			"RST_PERST_MCIO_0_N","RST_PERST_MCIO_1_N",
+			"RST_PERST_MCIO_2_N","RST_PERST_MCIO_3_N",
+			"FM_P3V3_NIC1_FAULT_N","FM_P3V3_NIC2_FAULT_N",
+			"FM_P3V3_NIC3_FAULT_N","FM_P3V3_NIC4_FAULT_N",
+			"PWRGD_P12V_NIC1","PWRGD_P12V_NIC2",
+			"PWRGD_P12V_NIC3","PWRGD_P12V_NIC4";
+	};
+
+	gpio@25 {
+		compatible = "nxp,pca9555";
+		reg = <0x25>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&ioexp0>;
+		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"NIC1_MAIN_R_PWR_EN","NIC2_MAIN_R_PWR_EN",
+			"NIC3_MAIN_R_PWR_EN","NIC4_MAIN_R_PWR_EN",
+			"FM_PLD_NIC1_AUX_PWR_EN","FM_PLD_NIC2_AUX_PWR_EN",
+			"FM_PLD_NIC3_AUX_PWR_EN","FM_PLD_NIC4_AUX_PWR_EN",
+			"PWRGD_NIC1","PWRGD_NIC2",
+			"PWRGD_NIC3","PWRGD_NIC4",
+			"PWRGD_P3V3_NIC1","PWRGD_P3V3_NIC2",
+			"PWRGD_P3V3_NIC3","PWRGD_P3V3_NIC4";
+	};
+
+	gpio@26 {
+		compatible = "nxp,pca9555";
+		reg = <0x26>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&ioexp0>;
+		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"SWB_SKU_ID_0","SWB_SKU_ID_1",
+			"SWB_SKU_ID_2","SWB_SKU_ID_3",
+			"SWB_REV_ID_0","SWB_REV_ID_1",
+			"SWB_REV_ID_2","",
+			"RST_PLD_PEX_PERST_N","CPLD_MB_PWR_EN",
+			"RST_PERST_SWB_R_N","SWB_LEAK_DETECT",
+			"PEX_SYS_ERR_FPGA","PRSNT_SWB_LEAK_CABLE_N",
+			"","";
+	};
+
 	gpio@27 {
 		compatible = "nxp,pca9555";
 		reg = <0x27>;
@@ -1349,6 +1457,21 @@ gpio@27 {
 			"SPI_MUX_SEL","","","";
 	};
 
+	gpio@28 {
+		compatible = "nxp,pca9555";
+		reg = <0x28>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"SCO_UART_MUX_SEL0","SCO_UART_MUX_SEL1",
+			"SPI_PROG_PL12_SEL","SPI_PROG_PL34_SEL",
+			"","","","",
+			"I3C_HUB_3_MUX_SEL_PLD","",
+			"SPI_PROG_PL12_EN_N","SPI_PROG_PL34_EN_N",
+			"SCO1_SPI_SEL","SCO2_SPI_SEL",
+			"SCO3_SPI_SEL","SCO4_SPI_SEL";
+	};
+
 	// SWB FRU
 	eeprom@52 {
 		compatible = "atmel,24c64";
@@ -1776,7 +1899,7 @@ &sgpiom0 {
 	"MB_SKU_ID_1","PASSWORD_CLEAR",
 	"MB_SKU_ID_2","",
 	"MB_SKU_ID_3","",
-	"","BIOS_DEBUG_MODE",
+	"SYS_PWR_FAULT_ALERT","BIOS_DEBUG_MODE",
 	/*H0-H3 line 112-119*/
 	"FM_IOEXP_U538_INT_N","",
 	"FM_IOEXP_U539_INT_N","FM_MODULE_PWR_EN_N_1B",
-- 
2.52.0

