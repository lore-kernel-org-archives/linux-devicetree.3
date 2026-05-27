Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603863C09E4
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 20:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779913485; cv=none; b=e/jGs5sOZltUE7j2FTxih94+nI81LeDJNQ6wsN3h8CE7cYJNNDib7XXRWAMp7z3RX8oINk+Tocg0/5k4aS7eRrreT8WWmaorAJ6biuuDMXvEdbo2Kucj/nLHi1wadW6UyslliWNbIjb808C//KBy3QlEnBumiYmOBkPtW3D3rJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779913485; c=relaxed/simple;
	bh=yfuIjwTgJQwfvZEGN0tBwIXrlnZvk9sDrd6F4ppSMOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F5q4vLlFbleBeCUVij8WsbFu+xxucOaJwiv2bzYLz+PgY/1NxJ8N+HbsHHcH3DVmMCGHnLy3J0V0wFnNZMY0oUIHz81mGS0EQnJjbYWH57lLAYqYkXuwpU0DrD4P9K5TjkWdyftB53G78wy9pW8IXi+IGkdEkbEWTE/WVMP7woc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LakB3ZDe; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LakB3ZDe"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4904127c32cso37324645e9.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 13:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779913477; x=1780518277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L8LWQHTdq/ho5Vz5WdWTx5ETAym+yqkek8n+lrIJOUw=;
        b=LakB3ZDec4EUDf3ZlNXrjUneeBIWR42mVc8umlqI/GsecE4h3OHmyuXZZrBSXFMvWM
         UB0lnFNAMgfaU5fgMGqHMqJpcSASwqL8+4JbQQMSvKvDaXAEm3J1ogp47SljXCXZtKwX
         SopxY/u/YN2oRASLDzrWWUndGr43AyDA5FBkPvbLko3+EkCM09FIpNqLVgOP/CbBTGaP
         1dF2SOb7Kp/eGKLG1yC7W1mqQKxzqiTiKgga5zYG70DzRdESPJ3kaH4IBD8diepP01W0
         xjGYZKINSVfjbllTR16KvXSQcBfljnO8RTDLS/Th+LYuvfxNVE6uscnmQZa6AYde+4IJ
         lSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779913477; x=1780518277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8LWQHTdq/ho5Vz5WdWTx5ETAym+yqkek8n+lrIJOUw=;
        b=npWie3gCC7K0eSlvr+a8L8zkPVJJx/zp5Fa7cpRNpAm83L/1DrZD8qvRz60xcewoAZ
         4m1oV0Xrv0aFs9YpiJo2OVzKlPPvhoUzNnuUm9bmBHv6izcFp8cimW6UBb+DtZKLh0I3
         qQvX0Xv30qFb0MnXxxVlytwF2O0Klc0XRYa+b2RSvfJw2GZualIxixea6m00tmvVd46i
         v4JF83rVg9jDNFd0fpxHeH7ke5qkXcuiF3Xm+TJkASLLh0yaKOIdtYTBORqLKM9ebidw
         /jqRnvY3NG7ZGbrO2xF+y1/VUC7ym6uQqSKOY+s29npMLbGGQANQ2WOxdaKJDCYKKqCK
         dgsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+m+7TDTN4NSb95h67AhOtBHnLBakq4bV+X9Tc+h1qztBG5L/pHg++t2H0KbjIfTXNeuP0DluyyAX0@vger.kernel.org
X-Gm-Message-State: AOJu0YyapCnF506gDptDmAuUF1Tvo9vXCvgUuRNZDT2L941Un5VPBuLO
	gerwIFx8EExbwEBrnG0qhKI65q5RWbTCCowbDFcAwum7w8e2+hgWvsnV
X-Gm-Gg: Acq92OG4Sjd0Qtm7T/4bS5IyTxaujjhNAnizlcA6UN/lAh0d4zeXqStoOBhGNXdMzlO
	k6pmL2IDEcKwd0JXujVxmSCnBiRxD5Dsiqbk9fc3J7FB4V7ypYgbhlIUvAI+9M/tRPKQTjPkIdd
	J5tm1ADDae+tcLoP7IqeTFGS+kI+hD6k/XeRdVnGYX23JxIMk6SBHvEUvic7ykdk3/bTvQ3fZX/
	QB9CFaWbM4C5Qu4Iwp737YaaPi/TzKHVJxsDDCAdNTjt1tUAhFJ1RpsP1jwKCEzkd8z29AY5edK
	z5ybLSmJHnD/k4jak/59VUAMWoAGZOKOdjD/s9wD/ruok2zt9hUf1bIxE+lxidprOKRwRv4beA+
	UKllmOEcLZM+4TXZVYZDvN7ddIeCjp7A6baKkAoywLXTQBCV3/GVGSGqyDP3/SWJpK4KuK6pZtC
	Rq3qqTluTToXLljDr5NAp7XzpikKBiO8u1fd7YWpCGVMyu7RzxhaKWX/AHtp3CvmI3IaBH9NYoF
	f5oT3FxkCL3O/MXKclwB6qLq4mt+IsrNayPrTibpu3hEUmB
X-Received: by 2002:a05:600c:34d5:b0:490:52c0:744c with SMTP id 5b1f17b1804b1-49052c07701mr359810975e9.20.1779913476816;
        Wed, 27 May 2026 13:24:36 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1c3e:1134:26fb:2a51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm514992175e9.10.2026.05.27.13.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 13:24:36 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes
Date: Wed, 27 May 2026 21:24:30 +0100
Message-ID: <20260527202430.606341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the xSPI0 and xSPI1 controllers on the RZ/T2H N2H EVK board.

Configure the xSPI0 controller interface to 1-bit (x1) mode, even though
the connected MX25LW51245 octal flash device supports octal mode. Add a
corresponding inline hardware comment detailing this restriction;
operating in octal mode causes the BootROM to fail loading the first-stage
bootloader following a Watchdog Timer (WDT) reset.

Configure the xSPI1 controller interface connected to the AT25SF128A
flash device for 4-bit (x4) mode to utilize all available data lines.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Dropped CKN pin
- Added ECS pin configuration for T2H EVK
- Added Switch settings for both T2H and N2H EVKs
- Fixed partition address for xSPI0 flash device
- Added spi-max-frequency property for both xSPI controllers
- Dropped grouping the pinctrl into subnodes for XSPI1 and
  for XSPI0 merged the ctrl and data pins into a single group

v1: https://lore.kernel.org/all/20260526204045.3481604-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Note,
- Ive reabased the patch on top of patch [0].
- Sending just this single patch as SoC DTSI patches have been reviwed
  and are queued for merging.
[0] https://lore.kernel.org/all/20260514210220.7616-1-fabrizio.castro.jz@renesas.com/
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  15 +++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 127 ++++++++++++++++++
 2 files changed, 142 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index 4c0e52850ca9..e9ed2de128f6 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -345,3 +345,18 @@ usb_pins: usb-pins {
 	};
 };
 
+/*
+ * XSPI0 Pin Configuration:
+ * ------------------------
+ * Signal     | Pin     | SW5
+ * -----------|---------|---------------
+ * XSPI0_ECS  | P07_5   | 5: OFF, 6: ON
+ */
+&xspi0_pins {
+	ecs-pins {
+		pinmux = <RZT2H_PORT_PINMUX(7, 5, 0x1c)>; /* XSPI0_ECS0 */
+		drive-strength-microamp = <2500>;
+		input-schmitt-disable;
+		slew-rate = <0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 46f4aaac0478..cdb5096a71b3 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -5,6 +5,7 @@
  * Copyright (C) 2025 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/net/mscc-phy-vsc8531.h>
@@ -20,6 +21,8 @@ aliases {
 		mmc0 = &sdhi0;
 		mmc1 = &sdhi1;
 		serial0 = &sci0;
+		spi0 = &xspi0;
+		spi1 = &xspi1;
 	};
 
 	chosen {
@@ -456,6 +459,45 @@ ctrl-pins {
 			input-schmitt-disable;
 		};
 	};
+
+	xspi0_pins: xspi0-group {
+		ctrl-data-pins {
+			pinmux = <RZT2H_PORT_PINMUX(5, 1, 0x1c)>, /* XSPI0_CKP */
+				 <RZT2H_PORT_PINMUX(5, 3, 0x1c)>, /* XSPI0_CS0 */
+				 <RZT2H_PORT_PINMUX(5, 5, 0x1c)>, /* XSPI0_DS */
+				 <RZT2H_PORT_PINMUX(5, 6, 0x1c)>, /* XSPI0_IO0 */
+				 <RZT2H_PORT_PINMUX(5, 7, 0x1c)>, /* XSPI0_IO1 */
+				 <RZT2H_PORT_PINMUX(6, 0, 0x1c)>, /* XSPI0_IO2 */
+				 <RZT2H_PORT_PINMUX(6, 1, 0x1c)>, /* XSPI0_IO3 */
+				 <RZT2H_PORT_PINMUX(6, 2, 0x1c)>, /* XSPI0_IO4 */
+				 <RZT2H_PORT_PINMUX(6, 3, 0x1c)>, /* XSPI0_IO5 */
+				 <RZT2H_PORT_PINMUX(6, 4, 0x1c)>, /* XSPI0_IO6 */
+				 <RZT2H_PORT_PINMUX(6, 5, 0x1c)>, /* XSPI0_IO7 */
+				 <RZT2H_PORT_PINMUX(6, 6, 0x1c)>; /* XSPI0_RESET0 */
+			drive-strength-microamp = <9000>;
+			input-schmitt-disable;
+			slew-rate = <1>;
+		};
+	};
+
+	/*
+	 * XSPI1 Pin Configuration:
+	 * ------------------------
+	 * Signal     | Pin      | RZ/T2H (SW1)  | RZ/N2H (DSW2)
+	 * -----------|----------|---------------|---------------
+	 * ALL        | Multiple | 6: ON         | 6: ON
+	 */
+	xspi1_pins: xspi1-pins {
+		pinmux = <RZT2H_PORT_PINMUX(1, 0, 0x1c)>, /* XSPI1_CKP */
+			 <RZT2H_PORT_PINMUX(1, 1, 0x1c)>, /* XSPI1_CS0 */
+			 <RZT2H_PORT_PINMUX(1, 4, 0x1c)>, /* XSPI1_IO0 */
+			 <RZT2H_PORT_PINMUX(1, 5, 0x1c)>, /* XSPI1_IO1 */
+			 <RZT2H_PORT_PINMUX(1, 6, 0x1c)>, /* XSPI1_IO2 */
+			 <RZT2H_PORT_PINMUX(1, 7, 0x1c)>; /* XSPI1_IO3 */
+		drive-strength-microamp = <9000>;
+		input-schmitt-enable;
+		slew-rate = <1>;
+	};
 };
 
 &sci0 {
@@ -520,3 +562,88 @@ &wdt2 {
 	timeout-sec = <60>;
 };
 
+&xspi0 {
+	pinctrl-0 = <&xspi0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	assigned-clocks = <&cpg CPG_CORE R9A09G077_XSPI_CLK0>;
+	assigned-clock-rates = <50000000>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		vcc-supply = <&reg_3p3v>;
+		m25p,fast-read;
+		/*
+		 * Configure for 1-bit mode to prevent the BootROM from failing
+		 * to load the first-stage bootloader following a watchdog reset.
+		 */
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+		spi-max-frequency = <50000000>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "bl2-0";
+				reg = <0x00000000 0x00060000>;
+				read-only;
+			};
+
+			partition@60000 {
+				label = "fip-0";
+				reg = <0x00060000 0x007a0000>;
+				read-only;
+			};
+
+			partition@800000 {
+				label = "user-0";
+				reg = <0x800000 0x003800000>;
+			};
+		};
+	};
+};
+
+&xspi1 {
+	pinctrl-0 = <&xspi1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	assigned-clocks = <&cpg CPG_CORE R9A09G077_XSPI_CLK1>;
+	assigned-clock-rates = <50000000>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		vcc-supply = <&reg_3p3v>;
+		m25p,fast-read;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <50000000>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "bl2-1";
+				reg = <0x00000000 0x00060000>;
+			};
+
+			partition@60000 {
+				label = "fip-1";
+				reg = <0x00060000 0x007a0000>;
+			};
+
+			partition@800000 {
+				label = "user-1";
+				reg = <0x800000 0x800000>;
+			};
+		};
+	};
+};
-- 
2.54.0

