Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E22C4CA286
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821330; cv=none; b=kdBv4eNsNnHcHqDY4Z0lzVugjOpUIYQ1Of+kuU8h7h77lTsJcrrkyFjJKMqKXTNs145l6xKhYgwDLR+vWYy33Cbqvwm97t3h7HMtsbXfSL2Y46vslo6sjaW4b46wSf+JOBDf6ZzGWL83VD1DBCm8KcxwmQKv1mDZd4dwroWy/Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821330; c=relaxed/simple;
	bh=NiM0i3wLzihtseVQe9RRGwQ0xHZi6+9ZkOtD4VUdltg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HFRBSB67GB8a5YCFjmWW6y7uv1GGe2HxPwoEEpWicsOzvDa3msJQaIhWyrqxjOsxr7CgaC6bHcKvFOScLOLLqsrGN+YMRaD294cSB4NJF1GlcCIwyL+wYy+mY1wHJxJK2uDksAg2aGjRhtp3TcQJoHAXlQyeBRjJgAZcjo2t+Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNJ+ii9O; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNJ+ii9O"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f6609c657so410846f8f.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784821320; x=1785426120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZ8QAc8qJULY7/QHPktrWVDTniFgBIQqY4nl+TBZBrk=;
        b=hNJ+ii9OjsDX8G/bQGCeNbal3zn+9GHwqq0p4YSYdEp7qZ5+qmIqAmT+KTCQOfNzru
         S4aK99LgCrOnZFKKb6L8oNG1JeseOm6CS4o+YPOspfXnnQfgh0KO5qNhnS+L+Od4AVs0
         zGSl8IRI2u29zBNKa0HP8PYWgc7nFBO+6XFcKhmEAzQABmpWAx2g/OVvDjxzv878WPmK
         yJyX+bl+LHBG4PVnvU1O3uqORDidOv4RPdMXahMjc0DJXAMKQXW/IVn0BKzd30mQNDtc
         JyXQ69F8F9z5HmiaItvAeu9ZD0feIiF697Euj7PrjNB1Ak08w3ppuACPUdllFcCHxujw
         msvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821320; x=1785426120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DZ8QAc8qJULY7/QHPktrWVDTniFgBIQqY4nl+TBZBrk=;
        b=QiyXj6gV6UPXk/gfFbYHP0pz3d/ibVFS2J9FK1t673731pCZv9I4NXyQ3167y3ZD/2
         c5Xq7hX/gFP6jiV//Fe0WPq/QL4/EXDOM4cd4T46ciAay4Ls7ri/ik12EpAcOfjVs+6I
         sOK49Ssyz/AgDLAYi4yQ0eDoVtO0WwnNlbu0J4MQregQUzpdstEh2QCpITn2fvU7ZYJt
         CDb6BZFW3FyTgvdhLB+m/Zk3VrkpWK98Kcrt+Kn5c3qcUWczV65XXpd3J0VdEkmOsPhp
         O6HGSMUNvQwYkKTB0Q8IgpPDLg6aWrOYrdfdYHbGtosWoa+avKJNFXCSbJPC2SuAhLBx
         SBEg==
X-Forwarded-Encrypted: i=1; AHgh+RrjMLHHLlrQHxMdOsa3+WyjC/c6qacDZJKfMKkBr3OGWjJLSYK7TSMY6F3DjjIJ+MHwa4bS/fcv2Nxv@vger.kernel.org
X-Gm-Message-State: AOJu0YyHU+xO+ahlV1mkA56oJCw8+5I9ylRGRafyKvkfWZtmgmFlpjVh
	VTfGaWqwLKfdC0e2CjnFG27hu5zn2BMjYSI1qlxhOVb0ClHVF4a+LdFd
X-Gm-Gg: AR+sD12KA4WL0tMuDhmFpFGHkb5Ed5OiOPyjlakPGlfA+TMK0tDiimNVF/3/i3khsv6
	U9eFZdx2+bqrSevnnOFaI/KBGTafAAxWkydh8E7ruOsiAKURCWZXGlB/vCONU318XrVqGRmnX01
	7SzIY4zt0fze3PZfhssJZiCSMIEB8+cuOX0EDYJ5L0BNamkLF4TJAUMEn7VLhhYAIEhAKGXUc7b
	BDhgjDB8AoTfsYr12DGTmNCw7FkZoBd4innGayM44k2nsJjOYxqEgu7rDOyBwteOP9Ruie3/DTj
	SM52yR2fhBq7K1RfErcNzC3ujrgXoUUSyy9of2KM9QrRabI7sO0PyzNZnE27FpIMBUf4faRN7vI
	4IkdNWUmdQCvfxDyzCUt+esV41wyLWeUrzDTLTjjX+MZBClVFIeYKxXge6dAhULr7XsCf2TVlMH
	QkZ9Co2cuO4nHwyKrA4HKcLPEfzzQ=
X-Received: by 2002:a05:600c:a0a:b0:495:4dea:f7f5 with SMTP id 5b1f17b1804b1-49573ce968emr48765705e9.29.1784821319409;
        Thu, 23 Jul 2026 08:41:59 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:f073:32ed:a057:cd3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af5d3c2sm3411345e9.1.2026.07.23.08.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:41:59 -0700 (PDT)
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
Subject: [PATCH v19 3/4] arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
Date: Thu, 23 Jul 2026 16:41:49 +0100
Message-ID: <20260723154154.319674-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723154154.319674-1-biju.das.jz@bp.renesas.com>
References: <20260723154154.319674-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for enabling SD card or eMMC on SDHI0 on the RZ/G3L SMARC
SoM. The selection between SD and eMMC is controlled by the
SW_SD0_DEV_SEL macro in the board DTS, which must match the position
of switch SYS.1 on the SoM. By default, eMMC is enabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v18->v19:
 * Split SD0_CLK and SD0_CMD separate as input enable not available for
   SD0_CLK.
 * Added bias_pull_down, input enable, default drive strength for SD0_DS.
 * Added input enable for SD0_CMD and SD0_DAT*
 * Added default drive-strength for all SD0 pins except cd.
v17->v18:
 * No change.
v1->v17:
 * No change.
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |   1 +
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 145 ++++++++++++++++++
 2 files changed, 146 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 0b6b7e109200..96cc7ee46a6a 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -9,6 +9,7 @@
 
 /* Switch selection settings */
 #define RZ_BOOT_MODE3		1
+#define SW_SD0_DEV_SEL		0
 #define SW_SD2_EN		0
 #define SW_DPI_EN		0
 #define SW_GPIO4		1
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 091a227233cb..c365b8087520 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -9,6 +9,10 @@
  * Please set the below switch position on the SoM and the corresponding macro
  * on the board DTS:
  *
+ * Switch position SYS.1, Macro SW_SD0_DEV_SEL:
+ *      0 - SD0 is connected to eMMC (default)
+ *      1 - SD0 is connected to uSD0 card
+ *
  * Switch position SYS.2, Macro SW_I3C_EN:
  *      0 - SMARC_I2C_GP is enabled
  *      1 - I3C is enabled
@@ -37,6 +41,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		i2c0 = &i2c0;
+		mmc0 = &sdhi0;
 	};
 
 	memory@48000000 {
@@ -63,6 +68,19 @@ reg_3p3v: regulator-3p3v {
 		regulator-always-on;
 	};
 
+#if SW_SD0_DEV_SEL
+	vqmmc_sd0_pvdd: vqmmc-sd0-pvdd {
+		compatible = "regulator-gpio";
+		regulator-name = "SD0_PVDD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pinctrl RZG3L_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
+		gpios-states = <0>;
+		states = <3300000 0>, <1800000 1>;
+		regulator-ramp-delay = <1200>;
+	};
+#endif
+
 	x2_clk: x2-clock {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -216,7 +234,134 @@ i2c0_pins: i2c0 {
 		pinmux = <RZG3L_PORT_PINMUX(L, 2, 4)>, /* RIIC0_SCL */
 			 <RZG3L_PORT_PINMUX(L, 3, 4)>; /* RIIC0_SDA */
 	};
+
+	sd0-pwr-en-hog {
+		gpio-hog;
+		gpios = <RZG3L_GPIO(5, 1) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd0_pwr_en";
+	};
+
+	sdhi0_emmc_pins: sd0-emmc {
+		sd0-clk {
+			pins = "SD0_CLK";
+			power-source = <1800>;
+			drive-strength-microamp = <9000>;
+		};
+
+		sd0-cmd {
+			pins = "SD0_CMD";
+			input-enable;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-data {
+			pins = "SD0_DAT0", "SD0_DAT1", "SD0_DAT2", "SD0_DAT3",
+			       "SD0_DAT4", "SD0_DAT5", "SD0_DAT6", "SD0_DAT7";
+			input-enable;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-rst {
+			pins = "SD0_RST#";
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-ds {
+			pins = "SD0_DS";
+			input-enable;
+			bias-pull-down;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+	};
+
+	sdhi0_usd_pins: sd0-usd {
+		sd0-cd {
+			pinmux = <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */
+		};
+
+		sd0-clk {
+			pins = "SD0_CLK";
+			drive-strength-microamp = <8000>;
+			power-source = <3300>;
+		};
+
+		sd0-cmd {
+			pins = "SD0_CMD";
+			input-enable;
+			drive-strength-microamp = <8000>;
+			power-source = <3300>;
+		};
+
+		sd0-data {
+			pins = "SD0_DAT0", "SD0_DAT1", "SD0_DAT2", "SD0_DAT3";
+			input-enable;
+			drive-strength-microamp = <8000>;
+			power-source = <3300>;
+		};
+	};
+
+	sdhi0_usd_uhs_pins: sd0-usd-uhs {
+		sd0-cd {
+			pinmux = <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */
+		};
+
+		sd0-clk {
+			pins = "SD0_CLK";
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-cmd {
+			pins = "SD0_CMD";
+			input-enable;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-data {
+			pins = "SD0_DAT0", "SD0_DAT1", "SD0_DAT2", "SD0_DAT3";
+			input-enable;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+	};
+};
+
+#if (SW_SD0_DEV_SEL)
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_usd_pins>;
+	pinctrl-1 = <&sdhi0_usd_uhs_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sd0_pvdd>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+#else
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_emmc_pins>;
+	pinctrl-1 = <&sdhi0_emmc_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	bus-width = <8>;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	non-removable;
+	fixed-emmc-driver-type = <1>;
+	status = "okay";
 };
+#endif
 
 &wdt0 {
 	timeout-sec = <60>;
-- 
2.43.0

