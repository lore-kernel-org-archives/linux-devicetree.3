Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DF233E355
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 16:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782146910; cv=none; b=lL/Biru4S9FFu8KTHHCIq+Wx59WiTvbL8jktSlBQ1MWBktueWGjIyUmKlCV8SeZ4sSXYBs/xUCbr5a2G6kmhyPnrE9CU92CO8B5l+Yq9CANRZLNjwGMLRtgdzyZZXHKQl9/R/JwoVMDeoq+8C/7uVQatqFk2TWSuJy9z9I6k8p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782146910; c=relaxed/simple;
	bh=9pnDUMsYN4bLDacbUShHnnwlGp6iebcXM8Oe6u5BVsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t0sp24gilxnMj3tcsI3PvOe3kvss3eqjEgc01yGoFwBRUO+OB0rPmUP4OGCZu+CkyycLpjEUqn/sqLJ3rpfdq45t9/EbMQWVcnbcvMfv1AgsuwxuPm0E0mr8ui7uOeZ+FKQOxQzjpwPufDx+nKCVDwnx7j1FfyOO0bkft75/kBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8H1mmrv; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8H1mmrv"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4629051c946so57084f8f.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 09:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782146907; x=1782751707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpHYnOpYrUuJndOSPodxmolgXNfjkZjteGgpuioWvrs=;
        b=j8H1mmrvjOhmdZoEKocpzI3a6B+Ku+UD/yohbjcrwuPI92fxLpa1XEPxamXzlDb25P
         2ya53R615a+O9riX8dL10dfzo/2zxJsHy+SR021u0i0D/6F78DAb2OWwMaJyWHE61Y0q
         A0toWGPAOaCyjR4nfuysxsy+VtAtvyDWsDPGrTNY3m1qwE6rsmF+uEk0815bEGgRWsED
         JZQCo8OFGNE0f85/GkBTH3vGI31ZOSeNMLsamNEcohFsrAmGRq9be3jXzEi1TMyTYCb3
         BDF5bGCHZ+G20gh+q0CQ2OjXG+3F+yKWI0QWy2q52qG4kHBJWfSpI78rKdSYzKjJY8Ij
         nYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782146907; x=1782751707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vpHYnOpYrUuJndOSPodxmolgXNfjkZjteGgpuioWvrs=;
        b=eQLDdl4DdlP0C+MHWRm12KlwPzlxnzL6ThKonfCsBVymppnftyqqfgF2mNKyAZu0kn
         YSPI2dXt7Rf6/fI2wyMB7cmlaA4jgWpV8BUU0vPehzhXaqxrFXasgYGQo+nVIcLv4p5m
         iFNcmHgT9in/s4jWYYc8Ry6ZyQLgFxTCRy0BcjyROOEANT+/GUUgIcEfrHpHi/hppPdp
         jMr6J3uYd50LXZ7PHJG+c5Kz526LUQrwRsmyt9AL//fYoH2JJSRYN2yrfX+f03Pca7A/
         srwUbMfmLwz5CmxgaFYm8LDUHxcWBAFpPy0x/i8n0Z7gWpqg4wZP8TPPCQc1JSuI8lGA
         n1bQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRTCleQXs04GS1zChfGs21Bn+Otq+Wq6Ojvm754E1u81IIFHTBpHst8EGY4qcUlLTbE7Z2IK33anXW@vger.kernel.org
X-Gm-Message-State: AOJu0YwIjEdGQ2BUa+cIdCuUmvAExqxJh80q5nMiDSjUZ3Nzn/NqqcZx
	c1a+OgGNsgr68DfyveX/kBN/D9dKIjp3vG1hmR3JfcovlPQPa4UEZ+K4
X-Gm-Gg: AfdE7clnXL5D1KxvoZmO57IvtePkZpW9WHAN6ycG+OOn7FxebykypxwCZdf4Pg9ZwSp
	7oj8KJCkrcFGgVV7DTbUqGZf0SrQCGrnIDynm5q6v0AZT/yb2sBFbJIQDfAQGAeDdrCY2HLIuaK
	XW6VXZu59jRdMu2eqFn+49RWLkCPxLw0x2S+KauRHxweQoMaZGgQkykgj/D9TpfUaxhrOAaWZPF
	A05mtiHahXUnfPNyHbJza7nxAmpgU2aJHM223Xw/261YqBONIMgBh8aHnPi7qJahoefgVqrLcKS
	Qa5KF4awy0d4kizFFDYwWqua4on80mS8q8+gx17yMsgAeNOmox4dYiV+mDpjTgKb9FwiQelhPau
	oBXxBhiWfB9tXE4A3j3uH5X7KGq7sNYquK453pb3R3SSgokYb2clWq6v9Isxsn3qKNNYWgtk/B8
	GwhEqjqMAnr2DnxhGl1/PI
X-Received: by 2002:a05:6000:184a:b0:43d:7606:5a47 with SMTP id ffacd0b85a97d-46a7eaeafa0mr445703f8f.2.1782146906849;
        Mon, 22 Jun 2026 09:48:26 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:fdf9:c68d:5fce:b1ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f56aasm27433872f8f.6.2026.06.22.09.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 09:48:26 -0700 (PDT)
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
Subject: [PATCH v18 3/4] arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
Date: Mon, 22 Jun 2026 17:48:13 +0100
Message-ID: <20260622164819.184674-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622164819.184674-1-biju.das.jz@bp.renesas.com>
References: <20260622164819.184674-1-biju.das.jz@bp.renesas.com>
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
v17->v18:
 * No change.
v1->v17:
 * No change.
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |   1 +
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 111 ++++++++++++++++++
 2 files changed, 112 insertions(+)

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
index 091a227233cb..446c7780cb30 100644
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
@@ -216,7 +234,100 @@ i2c0_pins: i2c0 {
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
+		sd0-ctrl {
+			pins = "SD0_CLK", "SD0_CMD";
+			power-source = <1800>;
+		};
+
+		sd0-data {
+			pins = "SD0_DAT0", "SD0_DAT1", "SD0_DAT2", "SD0_DAT3",
+			       "SD0_DAT4", "SD0_DAT5", "SD0_DAT6", "SD0_DAT7";
+			power-source = <1800>;
+		};
+
+		sd0-rst {
+			pins = "SD0_RST#";
+			power-source = <1800>;
+		};
+
+		sd0-ds {
+			pins = "SD0_DS";
+			power-source = <1800>;
+		};
+	};
+
+	sdhi0_usd_pins: sd0-usd {
+		sd0-cd {
+			pinmux = <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */
+		};
+
+		sd0-ctrl {
+			pins = "SD0_CLK", "SD0_CMD";
+			power-source = <3300>;
+		};
+
+		sd0-data {
+			pins = "SD0_DAT0", "SD0_DAT1", "SD0_DAT2", "SD0_DAT3";
+			power-source = <3300>;
+		};
+	};
+
+	sdhi0_usd_uhs_pins: sd0-usd-uhs {
+		sd0-cd {
+			pinmux = <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */
+		};
+
+		sd0-ctrl {
+			pins = "SD0_CLK", "SD0_CMD";
+			power-source = <1800>;
+		};
+
+		sd0-data {
+			pins = "SD0_DAT0", "SD0_DAT1", "SD0_DAT2", "SD0_DAT3";
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

