Received: from mail-pj2-f31.google.com (mail-pj2-f31.google.com [74.125.227.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B80F4562BD
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789979902; cv=none; b=U5r+aYHAgvlt/+p9GSzpBrQtUy5T7XFQqo7bD7xqJq+cTWy/eJ7Av55HtvlnsKwdlv/EYHgSiEUKI3aFQ1vb8JLPKZXtqsCmAnw5/9WzvNZakXvV9UzG8IBzFDjCyy8UoE1x1/44Sxi585G1iw4UIsAOtBzTh4YXCOXuBumHWhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789979902; c=relaxed/simple;
	bh=0aK3nrisfIvMUC7hMzoMx1aGyZsFxW2jrw74ipuIpwY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FMWf3vS5Vf5J61oy8mg9iMCd/R23vQHqoh/3GEycUJSVqe9HbQ9HMVjBg7KeB12nvkzkLQP81sVn9tWnpLx5VXldgKTJ53ugR8Wp7EbYmc8oVYArXLrIbc/Qiv6JWh2JPkF2RFPkBUjMK5VoWzRFn0rX/vr/TJZeDCYWv992BiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ar7gBbyh; arc=none smtp.client-ip=74.125.227.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ar7gBbyh"
Received: by mail-pj2-f31.google.com with SMTP id d9443c01a7336-2dd53691be5so24841195ad.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 01:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789979900; x=1790584700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=;
        b=Ar7gBbyhibhn9BnlOsiMj3+7WDHE8D5Abb7FUmkzG8wdB33+Kwa6pp0mpGPFmUsG0K
         zGmM3dcpm6ACqvv1mU5H9PxMaijb7jmkvYcW/5SzuDuLLwLNfW3GocZulERhhwVcPus9
         2s1Z1T9HCpgAvKmJH8Hjapfxicw4z6wFRkYz7Qyyn+F69ZCWQgQM8QwQ6XL4VTd0QtBP
         y27SBnB2ebYDcxD+ro3gdUx/rRenVWBkGUUQ+JsRMiJzJhFz81Pni+mr6IFfHorXn1PA
         93WC5YZEqIEhk2FVCy/rKoQ64jilh0xOSxjBKI+ajNkNP7s39wQYoGQaE9Q3kFIF6/tZ
         DfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789979900; x=1790584700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=;
        b=OA5CJtYkmdRakmF8ZcxjWVmX0X+s2nFPQYFgpbYGks6GNmj5bLNoeurRr2f6IV+VGP
         hmEWJcygeYNRlbO/muY7xRgSLTX3TS8pGz0uGJRCq8xUCVYHinmzVJPHGfinNwRugqBL
         9gEP75tCYPXCukRfnbp+GXVT3TrSF1xDDch8QFAAxj3j09j8HuW2wKFTQPc+AC7Net9j
         awz4ezCJ17roTq+P33ixEQWLNYVjv1FVXXfq42/wTGCUOPcS/xh7emf6hfmYW3Ti1I5X
         KEl8OdSRB5ljQPg2rJE8TQzWvTiTg8BD2CH+6hNAg+c+vxmqIxD6TDZENp+Zg1vJmobj
         HoUw==
X-Forwarded-Encrypted: i=1; AKwUvBwKoyjq2kVQPDvhIMNPXYv6mEQXTHrFGmW7JUrhWXB7+xpr1gJZmQIMQAfKQw058IP6W9HKm2oQyTX4@vger.kernel.org
X-Gm-Message-State: AFuF++lT280SRX59zx/doidLz31MUD23ieUgee9HBcebxzes3HDw1ok4
	mENZaSBETRraVF7mj5MOyGRNrpX9oDUr5i6CGQ/2ziWUiS41Te07CJnQ
X-Gm-Gg: AYBFou0cNfZ/bOi2jrt7+S0VBYLuG0UBt85Z2G5uZBJmu/o1RjscHPt01dYHkyt6KQB
	OikV/rhvmmc3nYP/TPDc9taRYss5yiaPcDLYGs0qFGkXxV8XXh9D8fHs7YpFdBFcgwJy5HdaXX4
	d03GJDBl84zeRRBcC9f7PuJY1x0uQsQ5PngJp5dinZs6I1u4EhRpKPlYYrcfJlBHat6MuiM++v1
	p1JnMowVyEBPu8FFgFwGhj6aVCLpIxRuMCSq1+EDANg7DwNoBsmacyCa4RUQhGWIQBplh4NtR+3
	MCIRXzyWJkTvPzQ3HXZf1yOXLITlzIn+4DZEmavFH9FRh6yVxgPjCjXtKComTwdMmGWFAEtOm4Y
	ukyROSGEt7XN6MBUcJBdl/2BCW9gSy4HBbrYPH8RXz9O6AZudEtKctdf6wVC09UdWiUKzTJw2N1
	N1gt97HA8HQA1ArqJYK5mq8zsV5TG0AYJWEa2qwJQuy4LgeNOzuFoeLGdzVvNL9LGAkZ9iyDL5r
	fmh45BC7qZ6mPPbbUgUjZvkY+m/rwps2xjtqNogAU0tpnoCCv3+ri5D
X-Received: by 2002:a17:90a:da90:b0:39e:6a80:b796 with SMTP id 98e67ed59e1d1-39e6a80b849mr10118808a91.38.1789979899922;
        Mon, 21 Sep 2026 01:38:19 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6ca50694sm15121508a91.2.2026.09.21.01.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:38:19 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v10 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Mon, 21 Sep 2026 16:37:53 +0800
Message-Id: <20260921083753.1109826-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921083753.1109826-1-zychennvt@gmail.com>
References: <20260921083753.1109826-1-zychennvt@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add I2C controller nodes to the MA35D1 SoC dtsi file.
Also, enable the I2C2 interface on the MA35D1 SOM board and
configure its pinctrl to allow communication with the onboard
NAU8822 audio codec

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 20 ++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 72 +++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..422468dbc3bf 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -57,6 +57,18 @@ &clk {
 			   "integer";
 };
 
+&i2c2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+
+	nau8822: audio-codec@1a {
+		compatible = "nuvoton,nau8822";
+		reg = <0x1a> ;
+		nuvoton,spk-btl;
+	};
+};
+
 &pinctrl {
 	uart-grp {
 		pinctrl_uart0: uart0-pins {
@@ -100,6 +112,14 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	i2c-grp {
+		pinctrl_i2c2: i2c2-pins {
+			nuvoton,pins = <1 8 4>,
+				       <1 9 4>;
+			bias-disable;
+		};
+	};
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..28488889f564 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -372,6 +372,78 @@ uart15: serial@407f0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@40800000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40800000 0x0 0x1000>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C0_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C0>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c1: i2c@40810000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40810000 0x0 0x1000>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C1_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C1>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c2: i2c@40820000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40820000 0x0 0x1000>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C2_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C2>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c3: i2c@40830000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40830000 0x0 0x1000>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C3_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C3>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c4: i2c@40840000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40840000 0x0 0x1000>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C4_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C4>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c5: i2c@40850000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40850000 0x0 0x1000>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C5_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C5>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		uart16: serial@40880000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40880000 0x0 0x100>;
-- 
2.34.1

