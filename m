Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63051CDFCA
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 01:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780880425; cv=none; b=NKRHi3Bry48orx2HpAz59Mri0yT81TkbDAYJsPdnSPJZ2hNKWDmu5PQQyAbM5oQdUjmWkyA7kF2rRD6TwTYAYypiZscgGfEK/BkxJ5fwHh77Y+/r9YYpHt8PVTvwJfo3A4XQSNGvdXM4U2z2W12iV/qs/RiQA3NlUbJmWUgYtOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780880425; c=relaxed/simple;
	bh=MKjwcF5QA8boZl++n/seX1fhDS3eFeN/H/j/NPGTEmc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RV8As61C3q2YPtmxk3idwytbJVNqZTsGHZ9Aw7KkmgRGd0tKh/VNCq5EeOxDrzsIOV9VwdSTO5Ua10HTfp0hRmVJL3K5c3lgnwoh+CpprK8wt+IKNpifDqbNsfWekBoKU66FM8vgvIQEd/9CHNcbzyb0nQuowqV5AoWGvU4Ftpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFgXxxRY; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFgXxxRY"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0c3546924so23507425ad.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 18:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780880424; x=1781485224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iIPw2Ul3tsPc2bxto6n13tf9Lx1PY2MWkQj5XztoNyM=;
        b=AFgXxxRYpq3P6dXhjTOi1NDamdHMzfKVDctIEb5h4EPefnu389rEmvTY5ljdLVxUdO
         iYtywSqszMhhzpaJueJGZo35/BFq5l42MQaIqmJHrSmRoLzOlA89eIL3rDMHpi34PAT3
         kh8j/2gge5/PZgQrqNuYvzeODq5SVWftJRFietw5Kc1Tt2ENk9HH9xi7muSZn2wxhkep
         i9UcOJ9GA3OldoU61S6XUg8eEEJYTL6XLjnEAj7fex59cEUeQzSl+6oh2WGRi9eqcILA
         LYhM8tXP6KM3qFXQP9me1rM+0ZQxKQj5rHniXs1GeUmN7CQEY0KveN4BEOVD2g8Q9Pqa
         W/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780880424; x=1781485224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIPw2Ul3tsPc2bxto6n13tf9Lx1PY2MWkQj5XztoNyM=;
        b=tKugKSPWohYTjRfB8tDdeeFXZNh4gv4PX8lTbkCeQjOtrIC7WGOny7JE/dW/5GsVJ5
         5ey0OTHZmDcG6uuDiPZ4czfO6E9mush2OEBGDS/3wTYs6eVM9P3ejuBOKz7eaI6LnTap
         WFrV52UR5MyemPhH6oaBuSk3kmEGQ1TG6sis7AjQMnhBVYly352C8rYyZ91I2WN6yhav
         k0bIQ91adw4Lkp6Q66C8E3R4qBlnOwF6LahfMvw1AvEH8TsBCr7oUWxy6fDnH4+gP0Qs
         fB55hVAoZNzEEYVH0/LAswFjYSADeuaEulKVvmRVT2O5Y0+7lPZT9nqwXaJTql20eWO9
         FSgA==
X-Forwarded-Encrypted: i=1; AFNElJ/whoN/xQpytRLvyw0HDXyJct4GGbggzXPuM2nHtSmijMtZGpD07NYNvighw5wMVLGyWy/2U8xGkI1X@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxne5dDXRI28WjZqw7iVA4U+UDxyN1bA5xFLUXMV216CxYO2cr
	NCYpb42ud8xEEumiIOpmPSABtzvxs47vwVzPOMrxiY+JJtgp0wufBWCJM2+0vmUJ
X-Gm-Gg: Acq92OF1EiRwR7Y/xYvFBgXWn/nAUsmHIAxXTUaV2M1MErLYAZyps3eVoBjqvjo4pG8
	U2jjb7sm2bmvnpX3Bx09TTVr2S+vgjVNxnkDztSNxaDlAjjoAPOSQVjcSxOQ+zE9UwwRADnfajr
	/t7OqqGNWHjvu35vC6q0b0xhLuodZAQBny7g2YaKufiVQRYzMIB8mQ1Xe2vh+Giowy9NO5evZTn
	X774M8SyuFWGOjWEVkld5QFnAWKMkBepqitJweALJphXIWoRYXk0gE0w3P64OoVLy4y5Rm+DCbW
	hErGvo2m15nwqcBXqG7pR8LToWB5fMSD1vvwnGlkHOuj4RELAPJzWxRKWHYE5wtxhhYQpt12vW6
	AAEWPIMsZhl2n7mL7GI29qk8vsxfTCkSD7E9bBdUgStmTkD5F0Ob8BDhfwkRsTg8s+yEizbh0uH
	xCNvxXiGWu0TINSs5Xxp8wghDXGF9Xa1bSs7ZSTXj3pKYFu96YVyqD2u6S71ZEqpJyeR+5bHY2M
	BfWQpxfb1vsFkmPzrB8
X-Received: by 2002:a17:902:f608:b0:2c0:baaa:db94 with SMTP id d9443c01a7336-2c1e881fd52mr142085415ad.22.1780880423815;
        Sun, 07 Jun 2026 18:00:23 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649c302sm156772795ad.73.2026.06.07.18.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 18:00:23 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v2] arm64: dts: nuvoton: ma35d1: add CAN nodes
Date: Mon,  8 Jun 2026 09:00:09 +0800
Message-Id: <20260608010009.3389558-1-zychennvt@gmail.com>
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
v2: 
- Move assigned-clocks and assigned-clock-rates configurations of 
  CAN_DIV from SoC-level ma35d1.dtsi to board-level ma35d1-som-256m.dts
- Update APLL frequency to 200MHz to ensure the CAN controllers 
  receive the required 50MHz input clock.
  
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

