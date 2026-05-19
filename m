Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F38478E39
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184832; cv=none; b=q1GlFQPGNlkTNj52s1RxmuduSZ9P/JAVg4Um4HxXZK2VLbPq4wV7QHy8vnGE/89H9BtVjfCRjm+MaYWR1Nld1/qoPMUIWpYrlmaneCL0KCN858ZMH8pMxzber11nYI55ehEIEBLYh4GU6ijGDvZMG28xGZqjlPDL5zMTR8rkSxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184832; c=relaxed/simple;
	bh=ZHWHc+VtthD6hvYeK7oMeY1NPDjDF8a5lqw7D41CD5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DpWJoBI7XZUS/kQxZrJ1rgjD6O+9saKfV4GybMsxE2BOmCCx+ViSKDnKRMc/2LWVTgP0DNtd1QPmWilI+YOMTWeRCwBenUsh9+Z+KtcElAFwLdk0M7aNlBVOhoIJgXEDB0+HRLQ3gMnVJx5qSC7VunjLPVkqQwHqIO+8SBi5WtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQwggyMK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQwggyMK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so24624885e9.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779184828; x=1779789628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fq2NvGmvJa4BQjcZHZ81YHd3i89ilFfO+t5Hs3o6u68=;
        b=UQwggyMKWdY0ux2jGcoTU4nKjMVNRNvIR+7aWbnwZsBrA6GIumVbaFw9re0lPwMjJv
         T0+uBohAKvQqBxb91r6eILG6jbEvEBpBRpAUGphK/BX8gYCAiRZsdqh5b1MTbIVS8zJc
         Vy1fcYwFXCfl2rFVAVsh/mY7dfV8QErPJyxWZ1Y+iX8vgBoS0NSH2uujwih8wTe8BCaQ
         IeYBexEwRwTr3LWyB9zU5PG6Zkr13BivEcVdEi8kqJ183xm7LaWu6CzZigPzB/yelegA
         vFjj4xNRE75U0IzFeOsZYMIm38D1vyynZ/p6Yg2EfQk7Dl4n+v1Ivps2iebxCNYxcO7o
         po6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184828; x=1779789628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fq2NvGmvJa4BQjcZHZ81YHd3i89ilFfO+t5Hs3o6u68=;
        b=KDRXhCizwP7WfhoXocHYzZ1jeZGbfmzDX6zPEIfDHPaXnw81gSotWq7koR+XWzKbMj
         GzBO77ep8SfoKM3boQGOuOEL47ZBDy7fPaKT7w2Nb+BRPu65d6f8lKF6NVT1o4lB2rc3
         jq1P00OdbxbdfNIg63vW1ZvmmBATTYqOXRnV/xlqQVkSODLOiU2TQ9U9zvG96yTzycl2
         cPsLRhEjbUEmEl5kVg+qZw89qbCvC53Uv+JErIfD9VTY7ruKd7GOmnmzWOLt2PQGOhQh
         gv8npyop1XVd7mBveYCNxPRNWmMFbXF1stgtaCCUjHap48vbi74ViDXEnOnjEmZ627OC
         CS+w==
X-Forwarded-Encrypted: i=1; AFNElJ97XfqJaKbTwG7hrB7kyCUv5UPHM6AmKrFG6vbsH4yLwEmLDn+eglGjbGWxgODFKVe4FoYXZtVRO3Br@vger.kernel.org
X-Gm-Message-State: AOJu0YwZXstlolYzJPgYq8uY9mtduCHtPgBlyx7Lhf+2YsOgkMFJV+A0
	SMvTB7Aifsqghi0Ca4TU1tnjzXonLmUaysanDIb5yglxgmGSgJUaiZCM
X-Gm-Gg: Acq92OET0GzXWg6gqzNk+Pm+44s+FxYM3ggBL/WGfXxD5p5VIX4pANq+26GHMDT4FWY
	OpNRviuw1TaM+OytLO8zX1myihPrThfBg87ywiUYIZZerQ+89ltYKTc9/rnYGfamfC0JTeehpPL
	3AiVAxOeUk83Q7TfnPlHgJ9JHlWPkTk+xRZjXs4bTg7Kc3ziy23Zf4sKztIs+P51ApUZyyw7Ayk
	lPlYjyqt7oTxk6crIvjTheucg59UI+N5EJFuAJf/aMw7B43jtshxkzLZQlWhCGN9CTb23DSFc53
	ZqKsrpajLiiU6cYcUTAy7Xshh/H8iVrPb20TM+PnNumhnFO38eIUv7FgQ0aWldcWaFpj2JuYrbV
	RI/jfNTccy74drjTfR8veZQ0TnVNM5JlaRu6MaHiAYNoTYqC2owmq+tBV1ZJubgr04WosPxRAeI
	nTCo+2ArmNcQl/PPvD/tPjD2cZpRIygcL0L7KJChGPLcNHKJ9WjRCQmu3r0gg=
X-Received: by 2002:a05:600c:4455:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48fe60ea92dmr267488935e9.8.1779184827051;
        Tue, 19 May 2026 03:00:27 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febc56f89sm131791455e9.3.2026.05.19.03.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:00:26 -0700 (PDT)
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
Subject: [PATCH 1/2] arm64: dts: renesas: r9a08g046: Add rsci{0..3} device nodes
Date: Tue, 19 May 2026 11:00:17 +0100
Message-ID: <20260519100022.116318-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519100022.116318-1-biju.das.jz@bp.renesas.com>
References: <20260519100022.116318-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add rsci{0..3} device nodes to RZ/G3L ("R9A08G046") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 930873ae7786..a53d579eaad2 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -358,6 +358,90 @@ i2c3: i2c@10090c00 {
 			status = "disabled";
 		};
 
+		rsci0: serial@100b8000 {
+			compatible = "renesas,r9a08g046-rsci";
+			reg = <0 0x100b8000 0 0x1000>;
+			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei",
+					  "aed", "bfd";
+			clocks = <&cpg CPG_MOD R9A08G046_RSCI0_TCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSCI0_PCLK>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_RSCI0_PRESETN>,
+				 <&cpg R9A08G046_RSCI0_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci1: serial@100f1000 {
+			compatible = "renesas,r9a08g046-rsci";
+			reg = <0 0x100f1000 0 0x1000>;
+			interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 424 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei",
+					  "aed", "bfd";
+			clocks = <&cpg CPG_MOD R9A08G046_RSCI1_TCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSCI1_PCLK>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_RSCI1_PRESETN>,
+				 <&cpg R9A08G046_RSCI1_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci2: serial@100f2000 {
+			compatible = "renesas,r9a08g046-rsci";
+			reg = <0 0x100f2000 0 0x1000>;
+			interrupts = <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 429 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 430 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 432 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei",
+					  "aed", "bfd";
+			clocks = <&cpg CPG_MOD R9A08G046_RSCI2_TCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSCI2_PCLK>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_RSCI2_PRESETN>,
+				 <&cpg R9A08G046_RSCI2_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci3: serial@100f3000 {
+			compatible = "renesas,r9a08g046-rsci";
+			reg = <0 0x100f3000 0 0x1000>;
+			interrupts = <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 435 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 438 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei",
+					  "aed", "bfd";
+			clocks = <&cpg CPG_MOD R9A08G046_RSCI3_TCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSCI3_PCLK>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_RSCI3_PRESETN>,
+				 <&cpg R9A08G046_RSCI3_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
 		canfd: can@100c0000 {
 			reg = <0 0x100c0000 0 0x20000>;
 			/* placeholder */
-- 
2.43.0

