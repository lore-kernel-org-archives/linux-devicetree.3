Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFA03F4105
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 08:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499132; cv=none; b=LEfemH48O6WphPKjysE6k2K4imhH79IgzOL3fzAY90sqQSeryjycIkRmnA6FaR7jBKSJ7j4F3DLQIX6Iz9pG2KOr7G6itYsl+rcQKTS6GxGdALx0PpY4GSrewOY8v5LXGnXPWecMsX6FcZaleGR5+oh1KQoNpDvhvYA7BtaYCkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499132; c=relaxed/simple;
	bh=6+AWnhGvzr9BcTVL8+ch4QRT0EtaOFi7bOI5xBH/z0c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gk4lsUm+IiMwRBd3Fu5Jhcg1PtPJ+cG+cz+56//UNKSUMhRHIk65VxMgmbfNM1zlp3b0la/i950tOR7SJDfSYNke9a17aLPiw+e3fY3JfBSqTSIgFrXjMKjqwOUs75tr/cgfd96eOa7FHfBgVmN90f4+fgtEjQBdxfzOSb9cYjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMYlfqQ9; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMYlfqQ9"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ca70925c25so5846295ad.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 01:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783499118; x=1784103918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jyaycIlFsITmoKtSt+baeUtSj03KZOHsdXm+Zi9cFI=;
        b=EMYlfqQ9fr7PnhWt9YqOzOQY+JyA+BmgBMbDlneEWHWEt7Thn5uPu/s60C1VgMWzwt
         zG1yFaeTkRAxCPVOraJsYf7vJAce8DJEZdT/lIdRVTDSerIDnTR0k7Pk7Cwcw3YiIi71
         +KFYqSQCi670yJF1aq8nHak1r1uO6Cd3Y7ffE2fzLeGDQDQokAqCwzI9Sd6r3YtHMxfk
         KFL1tGs+G7Ui6pOrlvYvyGYJWK3vbbyBmZh/QkE1fwQATw4yle8pitkvDUZMxUtTlbyA
         UlWFM/xMR8OgRSG0PkDny5ubQtMjiUErfZtZw+cUeGywvrRGYmSeOrXm0g3xFu5SM8QI
         L3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499118; x=1784103918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jyaycIlFsITmoKtSt+baeUtSj03KZOHsdXm+Zi9cFI=;
        b=ZRkw9go45K+GxIt0C/e9qpgVOcbverj2v4/EYcJoFK7i9QB6gL5AYLFLOhNK580r5J
         i8Nmz0pprkvjqeIk/5snYp8s7As+w13IzpoTnnZz34cJv7DSN9FXTgHoV8KxCry4saGH
         Vmx4IRect4e3Vy/dudYwIOdm0jqCeUNl7iFOlBMHx0DyDhndhlc/lxzI7RiJWfT+sHnL
         QI4CzaH/61Ut5g8/ezckdrsmJanIKToWTCadPM6f5XbHQe/OEAXy4VEGVK/ZSMjEaDIo
         yMHdtcuJkoBgnYbGo+miKZ+Eh3FqQKzhzW+MHBDnfDVj4Jtv0hmDitdXpA+GUvXryTfX
         wbhw==
X-Forwarded-Encrypted: i=1; AHgh+RoIk62lpJQfcdPBjmGBKrA4OpQJKpDMBZCEPF/7wkpeS3E+XdpF4VHmMGZWh7ClybjYRbfrVGMctSjG@vger.kernel.org
X-Gm-Message-State: AOJu0YwqMzOevjtXeAfq/rZNtpU5hMNta0PiprLujZSEhN2XTo7byCtU
	QbhQkHkN1m4Z8mBFcJEwGubcTdh3aa9QXR+ByTigWDBm/bjUyD8s4mfl
X-Gm-Gg: AfdE7ck4PSCph88usecNges4jJj6EB6P72wYZXENj47hn47JYNhlc4xSyb3Or0UpKQU
	BgtFUIMJmGd9CZMmPPEe+gNWk7NPCsCgFnEKsUR/7wF9BEcplkbKJd1uip0+eXVrCUWWl9oVVI5
	JEZKsJfTeG1a9XOyBm9oD0Exws99y1Uk2JDWCnDeMviLnbfrePds0yT6OAMrIt++ZDMBy6Bm6m4
	vd3v36pt3Zjto3XG0iaWnW81pPMm89ZPRUkYUGN9UGWzuodXbt7NQmdWi5JRga/fA66a6D8TqSr
	10Q6qKh2daOwlxvNdNF1Dzxav/CZCoUcZudQixxHwOwCsifWOXkl3K6fQFdaCY7/8t/kKzJRm5J
	6A8xozf7zEYgcAkx6ktsFiXNwocVlP+LgDnDrK58GXk7ElmoZgEe5QSLMKmXlMg9FxC8thnRdYC
	fWbtuie3ByC7vhO7z6NlpNJb8CWSCSV5waojVKjO0PTuBEXXO5//ohPD0IKVXL/xFyMA7Ztxo=
X-Received: by 2002:a17:903:b07:b0:2c8:1c05:16aa with SMTP id d9443c01a7336-2ccea2d56f0mr17414495ad.19.1783499118444;
        Wed, 08 Jul 2026 01:25:18 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d952sm24010315ad.61.2026.07.08.01.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:25:18 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: arnd@arndb.de,
	olof@lixom.net
Cc: soc@lists.linux.dev,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v2 RESEND] arm64: dts: nuvoton: ma35d1: add CAN nodes
Date: Wed,  8 Jul 2026 16:24:57 +0800
Message-Id: <20260708082457.460710-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add controller nodes for the four Bosch M_CAN blocks found on the
Nuvoton MA35D1 SoC.

Additionally, configure pinctrl and enable CAN1 and CAN3 on the
MA35D1 SOM board. Also, update the APLL frequency to 200MHz to ensure
the CAN controllers receive the required input clock for 50MHz operation.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
Resend note:
 - resend with the complete Cc list; no patch changes

 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 32 +++++++++++-
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 52 +++++++++++++++++++
 2 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..fb23b0573bdc 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -37,6 +37,22 @@ clk_hxt: clock-hxt {
 	};
 };
 
+&can1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can1>;
+	assigned-clocks = <&clk CAN1_DIV>;
+	assigned-clock-rates = <50000000>;
+	status = "okay";
+};
+
+&can3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can3>;
+	assigned-clocks = <&clk CAN3_DIV>;
+	assigned-clock-rates = <50000000>;
+	status = "okay";
+};
+
 &clk {
 	assigned-clocks = <&clk CAPLL>,
 			  <&clk DDRPLL>,
@@ -45,7 +61,7 @@ &clk {
 			  <&clk VPLL>;
 	assigned-clock-rates = <800000000>,
 			       <266000000>,
-			       <180000000>,
+			       <200000000>,
 			       <500000000>,
 			       <102000000>;
 	nuvoton,pll-mode = "integer",
@@ -56,6 +72,20 @@ &clk {
 };
 
 &pinctrl {
+	can-grp {
+		pinctrl_can1: can1-pins {
+			nuvoton,pins = <11 14 4>,
+				       <11 15 4>;
+			bias-disable;
+		};
+
+		pinctrl_can3: can3-pins {
+			nuvoton,pins = <11 10 3>,
+				       <11 11 3>;
+			bias-disable;
+		};
+	};
+
 	uart-grp {
 		pinctrl_uart0: uart0-pins {
 			nuvoton,pins = <4 14 1>,
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..494724a25f3b 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -244,6 +244,58 @@ gpion: gpio@340 {
 			};
 		};
 
+		can0: can@403c0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403c0000 0x0 0x200>, <0x0 0x403c0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&clk HCLK3>, <&clk CAN0_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
+		can1: can@403d0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403d0000 0x0 0x200>, <0x0 0x403d0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&clk HCLK3>, <&clk CAN1_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
+		can2: can@403e0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403e0000 0x0 0x200>, <0x0 0x403e0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&clk HCLK3>, <&clk CAN2_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
+		can3: can@403f0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403f0000 0x0 0x200>, <0x0 0x403f0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&clk HCLK3>, <&clk CAN3_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
 		uart0: serial@40700000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40700000 0x0 0x100>;
-- 
2.34.1

