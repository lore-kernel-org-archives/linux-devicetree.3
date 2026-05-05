Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350D73DEAFF
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 07:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964535; cv=none; b=Ppj24wQlyzvp5z2qe7LR3mhD5XUR4aZmaLyRZVETh/YFY+Ti0V6I1ObTkn0/V74mYvpjbH59HUjToqJRMklRY8O0hSa/5FLVMiPQjWt/dcnzJt0fWy50ioUjdBjeZh25SPKn8boHH0klG0AQggOXtMBMKDLp6y2N6ifQ67rNWLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964535; c=relaxed/simple;
	bh=iHfi4qBDrEwjYuv1vedv6xVdNftnQD0gzac0f7qxf7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNvQauqysL5DGkibj9cYmap+ULf+1E92HwTemb5wceqHis25hC3PC1EYD9wnWOVIe2913DgpNqqYDijnIr9IvDAUTJE7E/N9PrIG+jaO/dWgWe3BBXPcocVNlX2ygsIstVm5SBx2zkR1pZmSoL6gRegtgq4NDWCpwicdo+GynDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivKeycCg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivKeycCg"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so46034915e9.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 00:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777964532; x=1778569332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WorZYhOoTBDaWVLEYTDQ9XR3zgZj8QwE6iKO1vmk6Wc=;
        b=ivKeycCg+CqNeoni94A3DR7kctnUvzdzQ6nrR1lzSQXO+lGhn8oucG6kiichsGl1tF
         HvxoWLpMHE2zRmlkeRNjJsi9W5XlMan2lv4eIvvuXfbt+voTKTaMNZcG0ihMPe6hKcBf
         cu7ua4H/FbZwfsrVitchjFyiMF++Z5j5GhnD6IX9cDVnSev3CrayDCyWIGjKQMOR7Prr
         1qRMFMj3PsCX8RprIE/7dIPjRx+P/5gQ4qxtW+xOTYkzfEdNawisLwkKeyNC3rFk89Bq
         Wd1+UsmcZZ7bcboj5vAJTmzCfGcuqZY+KLBoryo/9NsNSquzg9OgzuIJjLQGcutrjVe8
         b2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964532; x=1778569332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WorZYhOoTBDaWVLEYTDQ9XR3zgZj8QwE6iKO1vmk6Wc=;
        b=gk4qmqluI+616T0C1hDbps+3knr3xpCiPXWb+VOJZvRuLv7IQLnEEtw+/42DMy6R1O
         c4C6Hah96ZBwmB3uIJG9pohUBpWO3N68qCfSZtmJI+bspxwbtyfXrU7nfLIW9ak3Jbfb
         RdGOX2OMCwzHNktUdOHZjGCE84lYf8RjUdd58DUVl9/hBj73giwW+mv/PIV07Mk/GzON
         JzdbTiyAXMSlgsD8I2IsgeUwWVDi0cM0zc/bnCbRLiLr4oxxJsqcGu42tuY6QXs3jUOO
         6T7E/Pv7D36HrB7GxVq0POOjo6E8K0SuVjfY5U9l1jVqaho7iH9hNA7mlNG7l3XcHNyU
         +1uQ==
X-Forwarded-Encrypted: i=1; AFNElJ+FiRwjPYsuPvBdJZwokbTBaBZcJm+B8qpUtAwNBVCEyONCZr1fuLsL/CkNDrWTyNoARW3nKPSUVQFC@vger.kernel.org
X-Gm-Message-State: AOJu0YzRfx3JF6/gVq+g9tUAkjjvYhsqWJhHiq1HA+nOeO4auxU2bJzZ
	ZFjLxQuOo2q01X00EjI3EXUjZpvIKp7XcBKTGlfluX6OpHghskTZh4sL
X-Gm-Gg: AeBDieuwruVKawbHxTZC9uMBThLwv1JSXUGT5U/hN1WOWQK4KKA3TlUj4BR4iZ05i5K
	BkvPTIPKOpm33m+id0yX4VlaAc1NZzDmyZLzyt4/BXs5X1gB/MtL50uTsX4RrDWC4VSUM3E7kMb
	FGmwR58gMOaSEAGiOMGPXf+Mh7t0Yp5xEuh03HuvRIXRM2lMG8MUbQsE+wKophbraFMZIoRkSTH
	3jkpmKbJQuq1RneCGsA0opGdnfUbwEtTaiPd/zgmGBn+I7Y1958hz9TGmJsBt250hgEJttojqA8
	cocYBvTVrTQZtFZcR6xuCHOM8O/Wml1Ysolmbrg/PdaPydpQWTacCclZyE9lx8e7Oc5GgjE7zpc
	Hhu2KM5nL69lAEJqufltq9xlq0dU53R8VlplU0lqXLhuXDfBMbzTaLKXegbptvlHVaprA640Zzp
	fRZI+CUGCj67totKIi8PHKRewtbUP84rZ8WFuXjXhaXVDwsaGkOXWJa10isYs=
X-Received: by 2002:a05:600c:628c:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-48a988be16emr216544795e9.21.1777964532044;
        Tue, 05 May 2026 00:02:12 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb6ffb7sm329473105e9.5.2026.05.05.00.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:02:11 -0700 (PDT)
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
Subject: [PATCH 2/4] arm64: dts: renesas: r9a08g046: Add i2c{0..3} device nodes
Date: Tue,  5 May 2026 08:01:55 +0100
Message-ID: <20260505070206.7932-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505070206.7932-1-biju.das.jz@bp.renesas.com>
References: <20260505070206.7932-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add i2c{0..3} device nodes to RZ/G3L ("R9A08G046") SoC DTSI.
As the place holders for i2c0 is removed, add the pincontrol
device nodes to make it functional on the board DTS.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 83 ++++++++++++++++++-
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 11 +++
 2 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index f0dbd700b538..8abf4ec28df1 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -257,10 +257,91 @@ scif5: serial@1004e000 {
 		};
 
 		i2c0: i2c@100ae000 {
+			compatible = "renesas,riic-r9a08g046", "renesas,riic-r9a09g057";
 			reg = <0 0x100ae000 0 0x400>;
+			interrupts = <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 329 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G046_I2C0_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G046_I2C0_MRST>;
+			power-domains = <&cpg>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			/* placeholder */
+			status = "disabled";
+		};
+
+		i2c1: i2c@10090400 {
+			compatible = "renesas,riic-r9a08g046", "renesas,riic-r9a09g057";
+			reg = <0 0x10090400 0 0x400>;
+			interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 337 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G046_I2C1_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G046_I2C1_MRST>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@10090800 {
+			compatible = "renesas,riic-r9a08g046", "renesas,riic-r9a09g057";
+			reg = <0 0x10090800 0 0x400>;
+			interrupts = <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 345 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G046_I2C2_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G046_I2C2_MRST>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@10090c00 {
+			compatible = "renesas,riic-r9a08g046", "renesas,riic-r9a09g057";
+			reg = <0 0x10090c00 0 0x400>;
+			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 352 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 353 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G046_I2C3_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G046_I2C3_MRST>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
 		};
 
 		canfd: can@100c0000 {
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index da6f02287944..6d86b88ce104 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -11,6 +11,7 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
+		i2c0 = &i2c0;
 	};
 
 	memory@48000000 {
@@ -50,6 +51,11 @@ &extal_clk {
 	clock-frequency = <24000000>;
 };
 
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+};
+
 &mdio0 {
 	phy0: ethernet-phy@7 {
 		compatible = "ethernet-phy-id0022.1640";
@@ -144,4 +150,9 @@ ctrl {
 				 power-source = <1800>;
 		};
 	};
+
+	i2c0_pins: i2c0 {
+		pinmux = <RZG3L_PORT_PINMUX(L, 2, 4)>, /* RIIC0_SCL */
+			 <RZG3L_PORT_PINMUX(L, 3, 4)>; /* RIIC0_SDA */
+	};
 };
-- 
2.43.0

