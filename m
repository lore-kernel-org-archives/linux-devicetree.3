Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41D31A08AF
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 01:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788831969; cv=none; b=m+jWqgbql2cp1aYtPnbid6z6VirJCu8KiQyn0B0jThzfz2VFMlDS7jBUuE54VBJ9YLCwWvOe78bl6QZikdYQCiy4ZlMeUAThIln4XVQiob6rlCeIlbGa7EXrErIboPWq84vDM6dhYX16nK7A8mPf5h/9J3fnu2oGWT55M1CxQg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788831969; c=relaxed/simple;
	bh=b7u6brZRUA8GCKrZRSAmIpIFE/mzdWyxVCYN8QqoqJw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s5RA/kwFBLO1xvpZkwhtyyDV+lhxg/l9XBbnPYqJbA4TlYLV0Mwd5lHtN8yXjoMqZ7vAFdKVFVE5JpCFXj/DBahzNzOBA53sz/kTT43jsiqusTYJluWRyDZShDDAdmlcB8f9EwOjrQew4L8D5JZXjYwfbZOZ69gzNr6ihJPXodc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pDkoudMX; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pDkoudMX"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84830c774a0so3806719b3a.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 18:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788831967; x=1789436767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hJ3bKwcyB7ptCjFnxYzYbWXHilW0QPTLoxB6wvOt2lQ=;
        b=pDkoudMXMwPsN/wuWEyo64qggKwNUvJ0UFOhTb8xVfD0ao4+2EisGV2SebCefWSjqw
         wdyboceed2rQuePA/RX5LJlb2foMpu+fflpzfvc33F7lP2rzVrDKsir8jCypjiD1jgxT
         mBgR6VWT69KzTnT62r/NSx+7hFEcvuhYs92jdc7YZqv4RwvZaK3BtnXfWpPkcHeY/iCt
         iK4581+0Vzu13qhYf2cEmA47dhsjagkPEz+Qt0w9lKEjOcsRh6YhunzoU+qlcPU2PkDz
         WIg2vjDto1V6tZSjmplBN2J6B3kVrK6qSgzysaOk6N9Y/K6uYXPB2RWlpu+QAeqMWljt
         6UfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788831967; x=1789436767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJ3bKwcyB7ptCjFnxYzYbWXHilW0QPTLoxB6wvOt2lQ=;
        b=NkqXaa27XxCLY77yK4mMyV7H+y2CtJ5rjE5eyDnRW/jeUy/xLg/yPBJKpV4RPICAOs
         Wb0KkS4wFmmm8s//DXxD5cTi15OpuuKCp+ZT05e6C04dwKQAfFM3/1fGSz1xioxI29j0
         J1rLEMX8DZgB64gWDIRYGKk+lgG/RdsVYXFUzrARith36z9Wbd4Fq62z7WFktVUex5Zs
         jZ+qm8fe2ZvfpCGmaGGZjL0ztxWxkBCwBKkK01ntE64wgxdpmHogKFQnvhWN4ISLLjzr
         3lW1StoIDBi9UgpjQxmovNSnDGLynNmMeXSnD3g1dyBW+swXa8mvSxvdP+E3Zm1uAax0
         O1bQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbjsvTBYRbycf0c8NaiZUvSdJnCu6hSl9kOJbmrYHuV0TVuUahDrTIOANHQuEe3g01V21Mm+RZV+91@vger.kernel.org
X-Gm-Message-State: AFuF++mT6e5tMBSoXp7/YVu+kXNvmEdQ1klEbnU2PXjRQVJSLqdIT0Bu
	Zo9eS5oIc5Wl2BJhasFHA0zFY7+333+20ueILJM38MpQVENn/tHjj6xN
X-Gm-Gg: AYBFou2XJPxlEYIrmmRsZZuhrkc2CYIcH1WE2gjRZZt40MpeJE1NoxdIV3ZbiiFQZXp
	iWIoO8b3dAGqkX9n8R/4uj+Od91a+oSpp+moxZ7HVF580IOjOWKkfEgMkf7KarUJrStUyB6ipvC
	XRfvcmNtH2a71/Fgh2siRCf2AmGEd8Iv8/whAk7qVgcl8CmLZcvd04xW9PICVvtQDrc0lGO621a
	SQUGLh444NKG/eKOOUxAfFX1zoxxFNuUtUZn7fPIRJlt4RCqt3vMnOo71QsMlA0TSaqgW81bn7z
	6WxxCmW30eYnzbdMyah8gVNyLnVvp6YaAnIN2xqelrfpDVwHPJkGWAdBdzcFNRUxl5nzq7b/j36
	ARhCFIGXxXSAGiaJegX71eCGOtRPOX3OFKpVkwadysgaKi6VfzXK3HGhmriyh40RwiaOxlla4bu
	D+jvUn9evd+yb+eACpVulMXZHg1yff7g9gm15sX7LqU/cqMI3z0HhqBaaeN38u7AaejOmQMrUTq
	Iv11WmgFsMjoRCLpqwtA3oLAIzScing3RlxnU3edNIuVA==
X-Received: by 2002:a05:6a00:600d:b0:847:99bb:b6d0 with SMTP id d2e1a72fcca58-86168591720mr39700598b3a.15.1788831967118;
        Mon, 07 Sep 2026 18:46:07 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8633cc0f7e2sm3142089b3a.37.2026.09.07.18.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:46:06 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mkl@pengutronix.de,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v3] arm64: dts: nuvoton: ma35d1: add CAN nodes
Date: Tue,  8 Sep 2026 09:45:26 +0800
Message-Id: <20260908014526.413399-1-zychennvt@gmail.com>
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
MA35D1 SOM board. Also, update the APLL frequency to 160MHz to ensure
the CAN controllers receive the required input clock for 80MHz operation.

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>
Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
v3:
 - Change CAN clock to 80MHz and APLL to 160MHz to use a higher multiple
   of 40MHz, as suggested by Marc.
v2: 
 - Move assigned-clocks and assigned-clock-rates configurations of
   CAN_DIV from SoC-level ma35d1.dtsi to board-level ma35d1-som-256m.dts
 - Update APLL frequency to 200MHz to ensure the CAN controllers
   receive the required 50MHz input clock.

 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 32 +++++++++++-
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 52 +++++++++++++++++++
 2 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..7bed0287e256 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -37,6 +37,22 @@ clk_hxt: clock-hxt {
 	};
 };
 
+&can1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can1>;
+	assigned-clocks = <&clk CAN1_DIV>;
+	assigned-clock-rates = <80000000>;
+	status = "okay";
+};
+
+&can3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can3>;
+	assigned-clocks = <&clk CAN3_DIV>;
+	assigned-clock-rates = <80000000>;
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
+			       <160000000>,
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

