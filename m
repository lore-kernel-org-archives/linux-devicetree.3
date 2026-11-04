Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805317;
	b=0M9e84eE68lr2Fay/0ZPZQHsBxb97uHiPqOsxkhmdYlotKxRxMoZtDO73JvIEKUQDp5r
	 xnOLmfsRRzWP6VlxLDTXirIR23j0A2XUe4pAqrP16Jicc05enNVG70hBUzrF1JB2iwOFl
	 kmnQbwODpipFu9nA00f49lVhT9VbtLE0NW03LSCTboGUYcfwKBIs3odaDhgGGFoTBYHpD
	 ii8pHb4lmQpA/yq4WsYpmAQEX/es0Q9w28eu+P6J98fa5bt/zcjSajH/ucPiKPx6C8bOV
	 SWCqHn+xXQZbDzOisNb5V4X/nK92kUTlzEv6VvBXkh9ceBKv6JSwCIErhqUUn75gQtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DFblrsKj7wHc7kkkI+I8FwISQ2EQY25liHLiJP/E5C4=;
	b=MY0/suTzZploV1Umil30VAjrFZRsDv1m5J3vpHgW02LResV1tVbmIIYP6WsxB6Ro5XS2
	 yyniVSmiVC+C9dci57vQ4cFxtclxWmo1N8GZoDtmoqVjUmBeF1X2HCO9GftYsNxJUShpu
	 vzUD+8u8Hk/K0S1eeOIEVymt6Axr6dIE9KqkDW5+iFSVe5I64t0dGYy6KcIeG4m3thw3c
	 scKzNd5r40G+5QyF17/OQmMTsqC2Y2KC/Dmp9lsrsK5xqAowic73WIJnVSINMEykstuxo
	 czeTY7eDcOLhDotD6nc54ruYVUL39uCQxlqxQ0D1yr6mfSE4OtMoTbC6ioXNW8HC4zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tQfuAzn2;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C89606A331
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 15:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50C89606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tQfuAzn2
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e10a70540so519595f8f.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 07:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793805316; x=1794410116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFblrsKj7wHc7kkkI+I8FwISQ2EQY25liHLiJP/E5C4=;
        b=tQfuAzn2MJXlUP1IwBT/Ie+7FBsFWL2r1J6cTk0T1/Ywv0mZDjArS1W/RjnlRbGhwk
         cKjLZ1M1rzvkeULmCjJ66msIxDPdIcedzILWSgPDMzRzmqEF50xbSFy5qjy205UctCab
         K/2LGlcYLyR45yZTgMzItubACYaKtx42THcgR1s+ewkEbfaKA1U8Ub96nUua3C/C1k+d
         8UZDqRzjruwXJmZySPrCP3mKUFDeb/AqCE79p4OzZXbD40HeUSzS8UmCxftlOlQ0jAt7
         KVQo0Wi/t5rdWDQ6rDa6vZ4TBU7FtZa41Jc7Wr4HMwGhhQ45fkblta4MoU2XBsE0Dath
         7+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805316; x=1794410116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFblrsKj7wHc7kkkI+I8FwISQ2EQY25liHLiJP/E5C4=;
        b=xCRoDIMVtUZ3v9mZIfVW1rZB3oDiLUtLXGz/saxRU196sG6HNF7thaA85voCdfwmEL
         SgNeh+3LvVMPsXhwy6mWw6GD2e1aplPvy6v7TQQbBUVd4pk4T52JGJzkincXHBItVr+h
         VaUwuJfXRw2V8MQ/iEf1DQT+5lWgdpzv0p2MRB7rdMicL8oaUbcfCOMtVLcdwXukrRet
         mokpcthFjs98LdI82RLvaZPYNRK15f9jzmSuza9aAU6N7fTuEwzqBBZ89UM1eCOImQv0
         OATEzW9S3NSR+VBGWCp+0HCiQgEpU5QFuAS096usTa2x8k56rfI6J8hXatQb5beo+fNX
         dMqg==
X-Forwarded-Encrypted: i=1; AKwUvByQNOeA0cmR4wTiaKfqB+4SZU05MwS2uO0wARuIYZVmRjWjjbCI6BXfCFfAIcRhPYmrjZbKeGoXX2Gi@vger.kernel.org
X-Gm-Message-State: APuU4Z+PyIA9Qg1nnm2OE6OmyHNhIH3Q5yVPcMYJHYWdeaNYls+2uPDY
	ErBwTiD/f5UwuL8R6DrJWnpDP5D1ymEAq2aAzNfsvzlqtNaSEAt8FPYO
X-Gm-Gg: AYBFou2CZdxMuvUjpRbYLtF4YXah6liiSNm3jBEFT/EnFlHLja+QjoOXpXcf4lF6agR
	1aNCaLFCtgSPWkdFrr4oSX2esw3FvmYvpA9gugtqFpXVH92FNRa/jWMIRzWrHEc/YlFkNMC6CPk
	iiWD5vAdKEbH8MLdqqtdVX6+ImeHmHH1NsGZ6wW8jk0DZFbEBA0rAiA/j05qg0lpprtHqpGq1XA
	41qTPscG64wPa3VOdeJl7DueH61j/nu7VLHiZAOpwj2++pD/B37Ch8ZX/1xcYRMVHLFxFGP6PtH
	ODDYZqMzbN0DhDuPez3eKUe1O8P3Qyjf+wS/x93s6kfOgtC1OAkFdy4GKQVnlPGFt/4bH0VAY9x
	fNCkYPp3J1vaM5n6PnZfJIQCGrkjBKUblMvKcebchf/cvgl8MpjhJmXtSzNOXv+mx0SGFcAmOfQ
	p83a3FdbqtK3gW2Tedcz5X/S24OzsWr9N++4yTp0ar+FyUPJoQfe1ivD2DOlmOyRGLc7Hsfdp8T
	mFs6B5sn/z/d+DFQUgUMMuEnFDH9czSp2TP3vzQvxsPPOsNHE+Oc11+NUvGV07uBfPppYx8ftqm
	wPCf+GuU4QGzy/3KTvByyf64kwMYB+lBLPCku+Ue8ZzR74pI5dFb30chBX628KjaEbyMjX/aJoR
	1YOLe9laM7Dc=
X-Received: by 2002:a05:6000:40cc:b0:48e:5ea7:b1b9 with SMTP id ffacd0b85a97d-48e6e30543fmr39077085f8f.31.1793805315536;
        Wed, 04 Nov 2026 07:15:15 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:f5b6:cc80:9262:e168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fee968763sm4435197f8f.56.2026.11.04.07.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:15:15 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 04 Nov 2026 15:15:10 +0000
Subject: [PATCH v8 1/4] arm64: dts: renesas: r9a08g046: Enable TSU
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-usb_rzg3l-v8-1-ab109c4bd108@bp.renesas.com>
References: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
In-Reply-To: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793805313; l=3652;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=XRcEYurVJ3RtFvSbUwyqsFOLiicLqaaDuk5zv/Zmpaw=;
 b=qWa+sU7QYRPyPhTsTBf773Xnwyx7TZ8z3MOIIhxftcxt6p6lAhZYB8C9KERtOY0KrNKg/27rt
 rEtz0RvvzyjDbtX9jLWzlf6smm0CFuGu7614JBjaIEAz0y4sKzknFre
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add #cooling-cells to the CPU nodes, and describe the ADC1 (used
exclusively by the TSU) and TSU nodes along with a CPU thermal zone
using passive and critical trip points, with CPU frequency cooling
maps for thermal mitigation.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8:
movedvfrom [1]
[1] https://lore.kernel.org/all/20260925061617.127349-8-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 66 ++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index f33d5d7468ff..35046c7dac54 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -179,6 +179,7 @@ cpu0: cpu@0 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC0>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -189,6 +190,7 @@ cpu1: cpu@100 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC1>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -199,6 +201,7 @@ cpu2: cpu@200 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC2>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -209,6 +212,7 @@ cpu3: cpu@300 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC3>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -374,6 +378,37 @@ scif5: serial@1004e000 {
 			status = "disabled";
 		};
 
+		adc1: adc@108c0000 {
+			compatible = "renesas,r9a08g046-adc1";
+			reg = <0 0x108c0000 0 0x10000>;
+			interrupts = <GIC_SPI 378 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD R9A08G046_ADC1_ADCLK>,
+				 <&cpg CPG_MOD R9A08G046_ADC1_PCLK>;
+			clock-names = "adclk", "pclk";
+			resets = <&cpg R9A08G046_ADC1_PRESETN>,
+				 <&cpg R9A08G046_ADC1_ADRST_N>;
+			reset-names = "presetn", "adrst-n";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			channel@8 {
+				reg = <8>;
+			};
+		};
+
+		tsu: thermal@108d0000 {
+			compatible = "renesas,r9a08g046-tsu";
+			reg = <0 0x108d0000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_TSU_PCLK>;
+			resets = <&cpg R9A08G046_TSU_PRESETN>;
+			power-domains = <&cpg>;
+			#thermal-sensor-cells = <0>;
+			io-channels = <&adc1 0>;
+			io-channel-names = "tsu";
+		};
+
 		i2c0: i2c@100ae000 {
 			compatible = "renesas,riic-r9a08g046", "renesas,riic-r9a09g057";
 			reg = <0 0x100ae000 0 0x400>;
@@ -1382,6 +1417,37 @@ stmmac_axi_setup: stmmac-axi-config {
 		snps,blen = <16 8 4 0 0 0 0>;
 	};
 
+	thermal-zones {
+		cpu-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&tsu>;
+
+			cooling-maps {
+				map0 {
+					trip = <&target>;
+					cooling-device = <&cpu0 0 3>, <&cpu1 0 3>,
+							 <&cpu2 0 3>, <&cpu3 0 3>;
+					contribution = <1024>;
+				};
+			};
+
+			trips {
+				sensor_crit: sensor-crit {
+					temperature = <120000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+
+				target: trip-point {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,

-- 
2.43.0

