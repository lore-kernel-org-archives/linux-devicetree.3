Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2483D45EA
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780552903; cv=none; b=rozrCGwyRC2UGhbxB4XkMY9JRQdI2t7QcNHg3TvigG3+xZgwu0IXVj1f6zVFSZcJsFI8BUk/jtomJSaqjUzjTp9ah/R13wTqnvpDXEaxOEamFgo0hRawMWaDppC+3G40vm56hpzb0K8rmzVNgYH4csh2Zucc5iriAtvMSaE+k4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780552903; c=relaxed/simple;
	bh=GPcu4EJEbQ66YIl1AFF/3SAr9vb6VsAorD6jLaSvXLw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p7cMK2skoDPXYUR+UoBpyAozU/Jf5zMpoG3ElkKMscQ0lbAlYMUgN0kwbkltokHiP+35RvlhWKU18u5n9n9HfMs4thoiRj6tySlfN+HhtqFUDipv4xRqAoPTpPdudDE+84K3sMaYABJ/hmCINxQR6QET0tEd8wJitp17eMin36I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcYO6OFt; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcYO6OFt"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-842273a2c4dso223579b3a.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780552901; x=1781157701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NtaAcXvkd+ZHvkxzFNtCE7f1OoHFsi4VoYohL3Cqqs4=;
        b=LcYO6OFtRMvApI3BJRBbR4+o5M7c+RmvfRKyKuSaCozYQgZn2MB9D7r+3f4TQN3cUc
         XaD23IF5IYNnN2qthWO0+xLzVNiBlQCpihZcYRta5g1yvB/Qn93IxqebXRdNJ4N+CK/y
         RKQ6X8FLy+75quN3JVecImcSRHXoG2SG0uEsO8M79dmNFRSGv2+P6N9pTq3lCUGcGVbU
         vryb4nFS6DWrRIgOq1HQrQUn99bGFiE7d1AHB6rmcGqAUdAevkR+oScCsu7K/8hviIoq
         8ZYy0G/OYsOrets9P/o4VMSQ/PdbBqA76sNj0SMmzXwWKZ6bfHFF0EXNnHmg2e3rk8HG
         sP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780552901; x=1781157701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtaAcXvkd+ZHvkxzFNtCE7f1OoHFsi4VoYohL3Cqqs4=;
        b=sloRYWh4gMgr6M7GzoHWPqL2tblOqAyFri+0LlIDimUXdlmtiFPS3ArHO0CZpDyzXe
         ux+RyGDA7WNZCGZvjMn8kPeL+92KgXT19YibU+tpPtVG5B/xTj43NXy36d1Q+MSB+z+v
         TZWsguMpmlbsRKP8eDECZGHZ2ZFg4is6JAMl2wra+bndjWC+T1OUHRpWsxKFA/fIl5OS
         TWBissCaRBNPjFmOFyIedU7WXIhu6bem9ehlzFFVMHusoegC7gPP7NZQy08HiFWTTmQE
         zcqPnqL/dns6BdyIx94frqAYDvhuo3kCm126tIslYg9Xr7ubppXumJ50kOUpycgvDPZZ
         7pYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+I2T1YEDXRiEmyr2v4qwHFvAg+D4VXP/3yK3BuojdKyQEBW9S/A/fAvRp5zbc1gFI9evQMD0KXGVaT@vger.kernel.org
X-Gm-Message-State: AOJu0YwTU6vZUdYUP5Q14lTst2BM3jFH8MNklj2Q13EGOakE5dQa2uug
	tdoogl2kK6sJutOQJXbO6y8soGqSLfNPIFjw4GkPL/oyS1Z/8UaKviaS
X-Gm-Gg: Acq92OGpIBRWh4h8PvN8JleeuwLG0IptVG0I/mLTsdUDtCkaWX+jjR6V5TdfSvwBGUM
	9hHfxSCWT7XIxdcu5Mq8VJn4DnD9VIDAZAFfoXQz61lLyxLwBgzu+KBmim1PkST2oon8x5FQj23
	EIGpfpRtj87WcW50pggKYe4iph5abmPLq+hgNOmsghuQ73SsOC2ey6v3uM5nC8Hy8kXH2MMwgRH
	7FTVR3IwUuCz6lfkO+/Q9z9n8as0Y7s37i9VddNGbcCsT6TyfYlByy7DcvREX6yS9fz6o5l8mCA
	eItxzgBiPVs0VWk11mDTmcizd3RPf5wbgsxCJvvxU8n+Pvz5n5KIckhV5SQgk+StLQMV/6ij5sh
	4rb21mIplFVWWrIyqoABhzcWnfdtlxStTCM+WQ1p3Mqujeaj9AOfF8wRSNYt6Sr+kpE7OpVwzii
	L6+DPY6OmkFw900/u61lfQsi77RpJoHhy63y2Fn+B2IHMJIH6JIAJzz1Cg3ay+wX90hmx9TM0Ro
	Ec4b5GsqxusVfKEk5QJ
X-Received: by 2002:a05:6a00:3687:b0:83e:f208:b0f8 with SMTP id d2e1a72fcca58-84284fad484mr6307177b3a.47.1780552900943;
        Wed, 03 Jun 2026 23:01:40 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428706fa9asm4178130b3a.45.2026.06.03.23.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:01:40 -0700 (PDT)
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
Subject: [PATCH] arm64: dts: nuvoton: ma35d1: add CAN nodes
Date: Thu,  4 Jun 2026 14:01:04 +0800
Message-Id: <20260604060104.1662700-1-zychennvt@gmail.com>
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
MA35D1 SOM board.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 26 ++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 60 +++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..1b8ea14d3446 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -37,6 +37,18 @@ clk_hxt: clock-hxt {
 	};
 };
 
+&can1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can1>;
+};
+
+&can3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can3>;
+};
+
 &clk {
 	assigned-clocks = <&clk CAPLL>,
 			  <&clk DDRPLL>,
@@ -56,6 +68,20 @@ &clk {
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
index e51b98f5bdce..584dd8d44701 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -244,6 +244,66 @@ gpion: gpio@340 {
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
+			assigned-clocks = <&clk APLL>, <&clk CAN0_DIV>;
+			assigned-clock-rates = <200000000>, <50000000>;
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
+			assigned-clocks = <&clk APLL>, <&clk CAN1_DIV>;
+			assigned-clock-rates = <200000000>, <50000000>;
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
+			assigned-clocks = <&clk APLL>, <&clk CAN2_DIV>;
+			assigned-clock-rates = <200000000>, <50000000>;
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
+			assigned-clocks = <&clk APLL>, <&clk CAN3_DIV>;
+			assigned-clock-rates = <200000000>, <50000000>;
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
 		uart0: serial@40700000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40700000 0x0 0x100>;
-- 
2.34.1

