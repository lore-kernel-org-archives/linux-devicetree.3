Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AE641B35F
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 12:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982542; cv=none; b=JVcC749mWKX3V6euP5pDHMzCGGHqE9MOdIkXkJhR30jK63unl8NRyd0QwUwDAkw1sbvsw5MwMH0dm+HFSXVnC+h4SMwipAtXG5cYsTyJhUtMGfw2aLMd+68gZ3JZiKJ7A8WEFbByiONvO5zzy1NWYqU9Y1RgAf6bs7y4cTwrG8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982542; c=relaxed/simple;
	bh=cNLr2taXbpX2OcE5yjZznFeiiGyGBLPTTQZdFmvHAlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CM6/HFfEZ75VPFP9p6+UcqxJ8MyAyi+U1P+4sxkcZe+zuNFRWaWpFe/44oduikWhm6HDBKsWfvFmlV9BTntTRyqlDIU8jhmBIfZU0WN0iS4MlbcrDvi3c7EV3sVJV49UvAzHqQMz5J0K71qrfb2ueGNnpSOvSxnQF6v1uygRZ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PABCs2RJ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PABCs2RJ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d7e23defbso2917281f8f.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 05:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777982537; x=1778587337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzsA6N6NmgWM0rNix94AHnL8OJvlx0hoitqTUcN+rEo=;
        b=PABCs2RJ4CC/lCPPs/NDapQ5G+8ZMphKDzGr0QIBuvd913TZvcAdHW3VKkDnRzKJG0
         2j7b1EPLkEAKS8k+Q5mIt/otvG6PBYiILVsfOQSV28jaEv6ra6a4putUVj+ku07e4a0y
         YKCukfRtgiHBaGhMV3sIiaLDjq6uS3f/U7JZoBoT5PkReYKKaYNdWHvMaZdYHCpNAZql
         eDYU+uuZZTHQLxcRcvYmtx1ZQtHx9IAmub+bqdQ9/fXBpvaKFklPRHOJ3mrJlWhBMLU+
         zGz7gdNUSudjDpVbO3VXuUnkzHZQtMgpOsIUTEOw/5dTKirgEqY9YNTNaJ8GLZ41bHec
         LcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777982537; x=1778587337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DzsA6N6NmgWM0rNix94AHnL8OJvlx0hoitqTUcN+rEo=;
        b=RdARsqLD/QBQe4vZAGk7AjIg8WXiYc0Y8y+AZgi5hZXwsLyVu82ySN51fYUZ1bWiNV
         baEacnn673uF6PwK2Z/3aDzTMJuMv53pH4CyOOUEpINtnqfFr8fzn+4WgoKm8wizLh3m
         0WG/EoDjKfiWEGqX0+ydlABkhqY2NzxhK6QnFZT4pJhwVJmqFB4GoVLtUk/TcRyM5LKp
         //MSqp4KoEXnYlcUf04E90NwZTcOyhw9h1CVPZkubOH4BFpeCc4XSNTtDxLlSsOFKlYR
         YIwkRCrHGICEmpTdWiA42imyWBN2Va5uaCQ7tkqtbCJgDQClFo+VwTgsHic2IJeOY7S7
         t5+g==
X-Forwarded-Encrypted: i=1; AFNElJ8NefwClcUviNeay/Cll3p2FBhD68SLi2LxbtvHprF6WtVB3QbshjAsSo0Y7tM+DHeedthNPhW2aD4d@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa70MHtrDdCWKIvV5ejVej30lm9dT5PDdrJ5+ncMAKV+BHIIem
	MWMFlJc6wvO9kQDa8GZun/p6op8Q6KAOZulyOfKIT7vmLG6iY/oHx0Nt
X-Gm-Gg: AeBDieuSv5fPWojOxbo5VuXF7DUmmGmEMkULX5XiYW3dJw1vPcquCaFZJ0nrXsLyNXK
	ZhKQaeUdFYHWDrNRsznLqO6NK/WSR7Ovy9PFXYwmfGjz++OJ8twmqnnLJAggY0cuZ5u2eDreoVF
	OXFZn8wUK2MketWhWMufWSj+E1t7xbd1/YQfr9+23V19RRt1slzkGpx8uh9y8KkDCpbufi1ht4b
	DAVC/rQVbryP5NkDSFmm4/g7VjrTa33AS9UiFEEAJC4T+n0PMCpqAhFVumJbhbz1E18dda93+Ln
	3TmpFSoHQPBr2hXaxdsS0Z07wmoKqwUpQ/fRC7wfUG8Txc+jPLXT5C/LG76Li/dlKKBu6+yvMq1
	1IKDqmcbGWJIKnpX+rmJ1jwGLDMh+Wo9AxOvuS05l2dWIE+yDBsRS2rstdQpFh2JKQcsnu+fCyj
	1WlVZFrWslmsNmD+1CwUks+tl1kextxFRKBmQet/WA2OkdCsGqz8Ou0732t58q6b4r7gi12J5La
	TQsCR70NfJmNKmwHWRfk2gS7x3PykEVB1t1AHeP/j2JUtOuDhCIh7lBjg==
X-Received: by 2002:a05:6000:611:b0:43c:ffb1:2214 with SMTP id ffacd0b85a97d-44bb4722800mr24295650f8f.16.1777982536525;
        Tue, 05 May 2026 05:02:16 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7d2a:9b5b:a191:3b81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b03e04sm4386398f8f.21.2026.05.05.05.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:02:16 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes
Date: Tue,  5 May 2026 13:01:53 +0100
Message-ID: <20260505120153.680979-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the xSPI0 and xSPI1 controllers on the RZ/T2H N2H EVK board.

The xSPI0 controller is connected to an MX25LW51245 octal flash device.
Although the hardware supports octal mode, configure the bus width to
1-bit (x1) mode. Enabling octal mode causes the BootROM to fail loading
the first-stage bootloader following a Watchdog Timer (WDT) reset.

The xSPI1 controller is connected to an AT25SF128A flash device.
Configure this interface for 4-bit (x4) mode to utilize the available
data lines.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index f87c2492f414..0894c9d38971 100644
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
@@ -331,6 +334,59 @@ ctrl-pins {
 				 <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* SD1_CD */
 		};
 	};
+
+	xspi0_pins: xspi0-group {
+		clk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(5, 1, 0x1c)>, /* XSPI0_CKP */
+				 <RZT2H_PORT_PINMUX(5, 2, 0x1c)>; /* XSPI0_CKN */
+			input-schmitt-disable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+
+		data-pins {
+			pinmux = <RZT2H_PORT_PINMUX(5, 6, 0x1c)>, /* XSPI0_IO0 */
+				 <RZT2H_PORT_PINMUX(5, 7, 0x1c)>, /* XSPI0_IO1 */
+				 <RZT2H_PORT_PINMUX(6, 0, 0x1c)>, /* XSPI0_IO2 */
+				 <RZT2H_PORT_PINMUX(6, 1, 0x1c)>, /* XSPI0_IO3 */
+				 <RZT2H_PORT_PINMUX(6, 2, 0x1c)>, /* XSPI0_IO4 */
+				 <RZT2H_PORT_PINMUX(6, 3, 0x1c)>, /* XSPI0_IO5 */
+				 <RZT2H_PORT_PINMUX(6, 4, 0x1c)>, /* XSPI0_IO6 */
+				 <RZT2H_PORT_PINMUX(6, 5, 0x1c)>; /* XSPI0_IO7 */
+			input-schmitt-disable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+
+		ctrl-pins {
+			pinmux = <RZT2H_PORT_PINMUX(5, 3, 0x1c)>, /* XSPI0_CS0 */
+				 <RZT2H_PORT_PINMUX(6, 6, 0x1c)>, /* XSPI0_RESET0 */
+				 <RZT2H_PORT_PINMUX(5, 5, 0x1c)>; /* XSPI0_DS */
+			input-schmitt-disable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+	};
+
+	xspi1_pins: xspi1-group {
+		ctrl-pins {
+			pinmux = <RZT2H_PORT_PINMUX(1, 0, 0x1c)>, /* XSPI1_CKP */
+				 <RZT2H_PORT_PINMUX(1, 1, 0x1c)>; /* XSPI1_CS0 */
+			input-schmitt-enable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+
+		data-pins {
+			pinmux = <RZT2H_PORT_PINMUX(1, 4, 0x1c)>, /* XSPI1_IO0 */
+				 <RZT2H_PORT_PINMUX(1, 5, 0x1c)>, /* XSPI1_IO1 */
+				 <RZT2H_PORT_PINMUX(1, 6, 0x1c)>, /* XSPI1_IO2 */
+				 <RZT2H_PORT_PINMUX(1, 7, 0x1c)>; /* XSPI1_IO3 */
+			input-schmitt-enable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+	};
 };
 
 &sci0 {
@@ -395,3 +451,82 @@ &wdt2 {
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
+		m25p,fast-read;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+		vcc-supply = <&reg_3p3v>;
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
+			partition@1fb000 {
+				label = "fip-0";
+				reg = <0x00060000 0x007a0000>;
+				read-only;
+			};
+
+			partition@300000 {
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
+		m25p,fast-read;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		vcc-supply = <&reg_3p3v>;
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

