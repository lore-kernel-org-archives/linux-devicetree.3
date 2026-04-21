Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082133D646C
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 13:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776633; cv=none; b=FhzQZDZ9bvIW4yUK9rhFzooQgOb7PXDTMd7a026WrgaBDV+fz67UaIxwqBAiSoAYvl0rDsmaNOuQ9TCmOFhJT5sJRlqe5tnpOnGd7t8yskkjo6KId+y2jpOtdt5m+MQR5RvPvVe1UV4JUneqCh4NdHuS3yTUuGJVdoFykV41toE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776633; c=relaxed/simple;
	bh=u/ioaHJrqVTAkRU518saoiZIhVz9VXpHLY6GquZAhmE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O9yDB2Xk9CndXARNF9irKESU/0a8StS1SCRjR13go2Fo+nCyMT9qQXMKX+cVue3+6ddhm4SZHoqaCJU1VGRyTh4iQ4AWVzwi737OBpLE5y2atPCuxfocRGAEl3RKIaQqgbaqqvS8UV5Wd5x4NGrMoz6Rt+c8MK56Jp1JgrveZFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WygD46+G; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WygD46+G"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so1502409a12.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 06:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776776631; x=1777381431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=maE5jQDJwsycLww5UnLtB8sLxR1IdmgJ/9+EbDBJAp4=;
        b=WygD46+GFGbsHpCdfqZuUcCrZCg9SU9JCd7B24ezqOr1WqFL27GiEpq+LVNRxlNTAu
         CrC/Iy813f1Sl4XEj8w0AYUk1xCSnKBwwEH6oZLNFE7dM10uq+gopckmi8ExYWFfcW3C
         +OV3guQuxexRwvtETyulafWGp8jCeZwRHA52AKId6MSy0Z319BsEar2zHWfSxw3BzYzI
         AFYdIC8nwspthGTsf27KJHqa7FB/YelSosvCYiQKlU+6/JS81PQJbzkuDpYNx4/HLn9x
         rYqoY1COr4g7jywWSrtpHZMocs9WGn40JsEARr/feohibKQFN4pAN9ecpEEUco28qMM2
         owbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776776631; x=1777381431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=maE5jQDJwsycLww5UnLtB8sLxR1IdmgJ/9+EbDBJAp4=;
        b=RpWZE0EGOpoAovdBAu5nWqvkzK3fPtFTrFhL1KsMwXFz/Xs0DDzs1whl//LcF67wZc
         BH8UaeVIUvJ8W/mbho+i3wzhFAYBO3YQ5SM87ZnTfz2rpsead/RFzthE+96vy2ws+HpK
         4vHZD58b0t+zinmUUt4os6mquUdiPJo1PNmBlqg/ShT9j6ILdVvG/hEVl9p3l0eR6sB7
         dvg9B1x8fYEUveC1rHgXv5Pq7GLGyhBWSvk/Yt4tqinT+XgJ32RpKg2wGgZ+4OJVcnZ8
         a5P/Sy8yDhDPqx/KPp35KI6LxhnCuTsXIUGATY28yvfacljz7DgHJw5WwHD8dnMycf7W
         ytvw==
X-Forwarded-Encrypted: i=1; AFNElJ8VzIkFo6mDURHqJ2nuBCs3J+BnE5Y0lxfK15Ns03C1JfkbPUGoX8SkaykP2MBc01Pz1DzrS/yHDias@vger.kernel.org
X-Gm-Message-State: AOJu0YzRIaLcooSadfbiltXboJV6s5NcYedXU4cjUgoHHAeTzbncovWm
	YxsRvnM+9yVymFQs/+L22f2gqlZbcHQcbqwbu0cqVt9GsJlOVjTTPpQP
X-Gm-Gg: AeBDievVowerMfiLtG31wxGQYN3sQMwK6JBOFCL96+FDc8DOjHE2lQwIA0RWx8qxv0e
	0Plfr0lljSptcIrGJhy/6Z6JyWrdLCSJ9e+6b4qh72yDY8Zx/W4N4M/3W0cyLkywwwHgLp88Rnf
	smlsn/6Ht/uorRI2gEMPgkWiFdyvCvpE3im8uAT4C9Vn+JO7ArPgPRqD4XoOMoJd7R8w7qxgdcb
	aeIp3b3I7uPMPhnebPZjCdRXSiu3UL2gykADcdWQyZgfBtRI/KbuFgAjlOLxwIZy0r49eawStuI
	gq+ijgLtV6Y6U0A7Xpzk14IWC1QhGe+GjZtqKsO9d41/Q9PSfrWXXRi+9mCuaIafUPdPSrZMC8s
	TGRLXOxm7rsvW0U9+CiSe6m51PavnwVxu1CYpb+BIxmTBdk6lhUPz17gco3TMkGJkmqi93xs3el
	X7SrqrYCf0xZElmo0YUpkIejXf3my217yZ4RtM4RQrpA4h+Whs3lDzUYrACyCArPwQE9KTk5EId
	g2GXKZEiaAoaGIcGcTpKvo=
X-Received: by 2002:a05:6a20:9146:b0:3a2:dbaa:82ee with SMTP id adf61e73a8af0-3a2dbaa8538mr5955384637.9.1776776631018;
        Tue, 21 Apr 2026 06:03:51 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981a0asm14456484b3a.3.2026.04.21.06.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:03:50 -0700 (PDT)
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
Subject: [PATCH v2 1/1] ARM: dts: aspeed: santabarbara: Add system monitoring GPIOs
Date: Tue, 21 Apr 2026 21:03:41 +0800
Message-ID: <20260421130344.2751662-2-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260421130344.2751662-1-fredchen.openbmc@gmail.com>
References: <20260421130344.2751662-1-fredchen.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add several GPIO expanders to the Santabarbara platform, with ioexp0
(0x20) configured to aggregate interrupt signals from downstream
expanders to optimize sideband pin usage.

The new GPIO nodes provide support for:
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

