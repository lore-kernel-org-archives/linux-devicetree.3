Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89EA481229
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 07:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778571619; cv=none; b=qCU09dMA/vWFXiO/xHbpyUOV6491jmwSiC/55XuBJ6cSMJE3kzTxdrae5FAEXi+eNhLt5MIxOln3w2BY/lIQuZHOkVaCe8EfTo/V/anZ50xRYo+PiRBeN8lYzC3FUWPiGSw5PNb8JJG8YDklka5eDouxFyvU+FaAPw6w8zRYqTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778571619; c=relaxed/simple;
	bh=3OQ02ZZI0kQ/5sJ1+5YlEDCXa+LoKBlgxgLGOXru+fE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NsMbRFxJhqEkYbOiDPsjPQ+eKS4kZcYw7XNf+rOkhY5XAaic+e4+TziNkJSqshQztqQtVLfcyP0ymkPnRqHBum7yJ//LqSOOUSKUzSy+k+bvzCzA6GkHybbUBcNZ5iXHq30fc3/vrEFw0/bTbUqRi+vKhibIXhSsD726ury7olk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diN/inxy; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diN/inxy"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so3157678a91.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 00:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778571614; x=1779176414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4n/F1eKXbXqdeANeiK1vkq+es+HjdGAH5wuLHdXDwY=;
        b=diN/inxyDE7b6Lkwh7eAwGQ/EybW3yEyfi0O69EB83gcu814QUEMSdQhcXSSy9StYl
         7wNEU7o6ulflOCfQZ2sX1hZvjKEJ2o4UnwCCMf1zY9JyourmgUNQgrEQpdJBABqS5uxT
         NP+IGs9wU91Ayx91BZePcTrIJ59Cf+eB0VfxOZdRxNYGOTGXmLf51DPc5iCut2IpJmdn
         kPgCPr2W6IfYYkiV08vramTWCqoGIFaNfrdyeTEAmUlpUj9NK4n70dqMn74CQ7XCfcKf
         hOprlynss5fcaAsoSXEEHjUq+xPRSDkNTGtMtihDk8oc2X71pD0oJhFqgn+xqIZea1NV
         Hhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778571614; x=1779176414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m4n/F1eKXbXqdeANeiK1vkq+es+HjdGAH5wuLHdXDwY=;
        b=LR/cEUMUtiAnu9kRu0s244glTDstWgB5AFDO8rJyGdf03pNSvhUA71NHhjg44AqpWd
         QsESU2WLYG4OvCFw8gXjvTK1Z92ezGQwThRYnLydGiuhsovMw1PnQspMJ1TxzufMkYD5
         nSujoh5l/4CZw6MgagC+pkGtvydG4nKloJBztJUFT64mN/o4uAxV2khrpP9UDGhpd69n
         psh4rYaq3FikyEOajZcgN1ul2a8UrTcd/7goTYlcWDbqLUdfCM3vGINXcF1ILR0yrFQ6
         Y4og3p1WLC4mJrJda7SRIh70jhPrR4TUJkgA0+4k4qnnIe/iuQCF1s9gqXb9nBEpJ5W/
         z4wQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qOXhd6n3CpH6vMP/+6JngKIRU1bxX2YFe2eeEzjK+KWD8Z3HIjYqenoCdG4b53DpxPx0Oih3APRPS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6LDslARitbZwxpe6KWMyPUOrs/tHyqs0kNvQN/Lxi29/OM3sE
	6dyeolzf0ODkpRx17NZrqKa/KAL6lbA70kmUFbb0bpCrJZKqlfbniRBM
X-Gm-Gg: Acq92OG5WnxIN0JDs7s1aF5MpS47YmGxA9B1C6z0SmQeitfHzHFbqjIeLvcUxd9Wmy8
	lVwF1TpW8EQa3LwUCyc5im/RbSEv6A6DyPyq6hZzKCvEBuWoguQYExbgSDOXFOgxNyO9MxpsN2p
	nlf1WnxycBK/ROJr4tcM1kO8uC7L1LnYXzE0V1SIb5TV7fGUVAmv6SxSj3fnzA/FMo2Pm91o+vC
	JGKrC3/AxWyxfRXr6tWC39P0txkWBiuBFW34oLRVh73zzBqFVyNMpD7a4J12zd0sJ90clBqCWdK
	gC5pnXMXHyPKONF/SaOxApGbSK+EAz0a3bfdNwrTmNmcHQ7hwLxK5DleJrl21WOWTbnGVyENM99
	B+NbOyS0VKu9nzJ5cRiPX1Hx0cNLclyicxt/1TRAPIdAuxMneppAwDZvxhErCnELeOto73B53U0
	cHRAMIjedg5Wnpp6edHoK8KpVZZ9LtqyVYJhRDc9mpyr4b/rU9fV7NfJgiZWw92nP88TPPSd9kF
	7zVAzJ69Q==
X-Received: by 2002:a17:90b:590f:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-3685368061emr7314796a91.9.1778571614197;
        Tue, 12 May 2026 00:40:14 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d65ed459sm13264489a91.14.2026.05.12.00.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:40:13 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v3 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Tue, 12 May 2026 15:39:53 +0800
Message-Id: <20260512073953.564323-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512073953.564323-1-zychennvt@gmail.com>
References: <20260512073953.564323-1-zychennvt@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add I2C controller nodes to the MA35D1 SoC dtsi.
Also enable the I2C interfaces on the MA35D1 SOM board
to allow communication with onboard peripherals.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 15 +++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 60 +++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..a0f1d76d288e 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -13,6 +13,7 @@ / {
 	compatible = "nuvoton,ma35d1-som", "nuvoton,ma35d1";
 
 	aliases {
+		i2c0 = &i2c2;
 		serial0 = &uart0;
 		serial11 = &uart11;
 		serial12 = &uart12;
@@ -55,6 +56,12 @@ &clk {
 			   "integer";
 };
 
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+};
+
 &pinctrl {
 	uart-grp {
 		pinctrl_uart0: uart0-pins {
@@ -98,6 +105,14 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	i2c-grp {
+		pinctrl_i2c1: i2c1-pins {
+			nuvoton,pins = <1 10 12>,
+				       <1 11 12>;
+			bias-disable;
+		};
+	};
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..a88d1c2938e7 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -372,6 +372,66 @@ uart15: serial@407f0000 {
 			status = "disabled";
 		};
 
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
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@40850000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40850000 0x0 0x1000>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C5_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		uart16: serial@40880000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40880000 0x0 0x100>;
-- 
2.34.1

