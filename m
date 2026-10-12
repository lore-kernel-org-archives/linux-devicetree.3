Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B603E5EC0
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 23:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791849399; cv=none; b=lAzlVT8GTD20YgCqecW5HXcSl4l1YCnq627OwtqTemzSWThLRFpNLwnm+M45ueF796CH7gCRvcZd0vpZsSMFkW7oB4rqwSxXvOnPhm4ALEFFuHzTT7v8/jHskg8rAUVm+LiT/TIrp6Y7SEF46tKIei4qp/J3lwjXGzxl8VKVC3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791849399; c=relaxed/simple;
	bh=lGsGKkyy9d4NARIdZRFLBjgm8D1dG3invfof4OQu4rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AQxNQ4+ItFYFvpOFn6M0NgUQ3/065N3z8POfV0ofrp/X1oA87z0H6kdM4dWB0BLVTa7uneLSbkkqs9Wx7C96gAqS4nKUtZsOeVIzg4FQZNR2OKhyoyohA3mjRj+0U0pWZFrfGAo3av4H3diCvquPP2WivR6uTPYyWpx4w214sSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tk5CQmfA; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tk5CQmfA"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso6007220eec.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 16:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791849396; x=1792454196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIe3e2jypmCgxdV2fa+T8K7iVPWqEf6EkwCnIkIhFj0=;
        b=Tk5CQmfAnGhKL02MeeCgzkkL9Bqe9DsjDORVnX+d+Nz7I7/J4rVPs45gJsIJj1Csf8
         FcaByblUm/LWE/HJyN9Ipha4TkZpouSkZtRpyrdrLO9bk/APAYmM3wlAkTGSNwz+l+T/
         36YvkqunAGh4VO+p6/6JHNmMt6XaRkxD/zp/KJHpYt4SsbWqAVWF1hDmfJi0znBgQh0Z
         ib+9lgiqDRhkYZeQ7jnMFrxWsQOHF4IB16r3T7dXSht6yu6nF+gvKEcNyXhdOqXfvTa0
         qd3KUSrURfT68yq95BElKJ/JSqMbVOeItTziCws59g20AZg5m54HWkOfb90FN+IaIVc+
         XIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791849396; x=1792454196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GIe3e2jypmCgxdV2fa+T8K7iVPWqEf6EkwCnIkIhFj0=;
        b=PeffYpUd4c1t5aw7+E0BTJYxSJjy3xKpAKRvkps1hTy3NosTpzHni5Bhz5zdWA44m5
         BhkdJ/mNeNV0hBLZVX+A10hJLqeQSpbwXZN/Nh11TetXEpUw/t6idLAlOgxcTSeC7p1p
         gXxvc5dPjN1kDi+m4UMZmF3X77kmW8I6AgiVSXSgS+JHP1fmEDpQ7W2hCUgOUS/1ehjp
         vDNEoC1TD+cLsR573XrOQBnKFpfnjz2G7Zz3svomL44oYHW0FU+SsPBdNlvbxsea+HWm
         4dYjLTLQxRTT5YLdaANrGhF/rh2r/ndO0M8UMBRtpHCxkx3ROe38a2xaDOnJuQ/AUBU8
         OxSg==
X-Forwarded-Encrypted: i=1; AKwUvBz29Q6UEiqFKzE5as57Ay12u67ZEBl+pHFxmB+8JQoHB5zRl7BpJJhLn5FZmIZH/GG6pDBq+e4BmvT3@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6MVHYHVJjmJt0gU5LgyRj/duzPJPHIYfWuGIwa9dtSi8+P6qC
	w1qyVmEDv9snSuoJJFpuA8VaDZdjja4VgOFpAuTs8dKez43rNVV263gq
X-Gm-Gg: AYBFou2z8rhbw/7ZV7AVRtiUvA5/ZKkXjLKgMo5GlX6WOGnewEbt86FdabBK+PQn+AC
	BqG5BUVE/xnkyxycTga9RcCcmLGoESkHats/Lg+KEqpS0Uy1IDWOEx6qKYXBkagfUC8PWNfkALZ
	1BwmZNfi+L5IPnl5kDRXVwrjfmACEWEA7oByAORJLo2dtcbpakVS7t7+M3yHQ5ZyR+yDO+Tz1SU
	OWlRxKe4AMFZllleLzLEFCIE1fcI7X3KjRSHRtHyttpJLYP8dquGysrQII2swxTTvoiktKxzPRe
	uWYyYBph2sTL2+R6T3o1l1CyVNwAhZhDEADBsGMvkUVlPi5pbsJOxxSD7JuKqSGsNUiKy3LTxrE
	bDHwQf5pFmyfYFRo1xld7kUp3zjmRatoqZfO6PgOjBWQI3F6XOUCoZdz0k2mAJIQd3jJYCAqg4Z
	7MDjcm8quA1BDaAHLMiLEDTh+XnEr11nDO/xQNayWxSKqrZbtizXWutkD3QcNZ/wmjV91T9XFU+
	WnSiL58Am8w4ccP7RTHB5fsQclRRTFPte21DRfSB+EvkkkJC0+WqLD9lyF8ke+FhiLvmnR6rxB4
	wBOzeSDOKCwfarUESEKn4TrLsLHJS1ewBNT8ezhddKD4GuZl0PZ+6Q==
X-Received: by 2002:a05:693c:26c1:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-3537ddd6142mr13773283eec.1.1791849395693;
        Mon, 12 Oct 2026 16:56:35 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b690af3easm8686145eec.1.2026.10.12.16.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:56:35 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
Date: Tue, 13 Oct 2026 07:56:24 +0800
Message-ID: <20261012235624.77993-3-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012235624.77993-1-alan.tseng.cs@gmail.com>
References: <20261012235624.77993-1-alan.tseng.cs@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On K1 boards an SPL reads the board EEPROM (0x50 on i2c2) to identify
the board, and before DRAM training it programs the P1 PMIC (0x41 on
i2c8) rails buck1, buck3 and aldo1. Boards that boot from SPI NOR also
need the flash on QSPI.

Mark these board peripherals, and the I2C buses they sit on,
bootph-pre-ram on the boards that have them.

Assisted-by: claude-opus-5-5 dtbs_check
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi | 7 +++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 7 +++++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 8 ++++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    | 8 ++++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  | 5 +++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  | 6 ++++++
 6 files changed, 41 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
index 81c40df2a..6269d2ba7 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
@@ -64,6 +64,7 @@ &pdma {
 };
 
 &i2c2 {
+	bootph-pre-ram;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_0_cfg>;
 	status = "okay";
@@ -71,6 +72,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>;
 		pagesize = <16>;
 		read-only;
@@ -93,6 +95,7 @@ serial-number {
 };
 
 &i2c8 {
+	bootph-pre-ram;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
 	status = "okay";
@@ -100,6 +103,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -113,6 +117,7 @@ pmic@41 {
 
 		regulators {
 			buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -127,6 +132,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -155,6 +161,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 58035d886..e74505984 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -187,6 +187,7 @@ &qspi {
 };
 
 &i2c2 {
+	bootph-pre-ram;
 	pinctrl-0 = <&i2c2_0_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -194,6 +195,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
 		pagesize = <16>;
 		read-only;
@@ -216,6 +218,7 @@ serial-number {
 };
 
 &i2c8 {
+	bootph-pre-ram;
 	pinctrl-0 = <&i2c8_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -223,6 +226,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -236,6 +240,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -250,6 +255,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -278,6 +284,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 635e95aad..406b7ca16 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -201,6 +201,7 @@ &pdma {
 };
 
 &i2c2 {
+	bootph-pre-ram;
 	pinctrl-0 = <&i2c2_0_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -208,6 +209,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c04";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC18 */
 		pagesize = <16>;
 		read-only;
@@ -223,6 +225,7 @@ product-name {
 };
 
 &i2c8 {
+	bootph-pre-ram;
 	pinctrl-0 = <&i2c8_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -230,6 +233,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -243,6 +247,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -257,6 +262,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -285,6 +291,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -386,6 +393,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 246f8f2ab..0531bd003 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -127,6 +127,7 @@ &pdma {
 };
 
 &i2c2 {
+	bootph-pre-ram;
 	pinctrl-0 = <&i2c2_0_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -134,6 +135,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
 		pagesize = <8>;
 		read-only;
@@ -159,6 +161,7 @@ num-macs {
 };
 
 &i2c8 {
+	bootph-pre-ram;
 	pinctrl-0 = <&i2c8_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -166,6 +169,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -179,6 +183,7 @@ pmic@41 {
 
 		regulators {
 			buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -193,6 +198,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -221,6 +227,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -320,6 +327,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index 2d1ba34cb..8e9bbbeb1 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -113,6 +113,7 @@ rgmii1: phy@1 {
 };
 
 &i2c8 {
+	bootph-pre-ram;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
 	status = "okay";
@@ -120,6 +121,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&vcc4v0>;
 		vin2-supply = <&vcc4v0>;
@@ -133,6 +135,7 @@ pmic@41 {
 
 		regulators {
 			buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -147,6 +150,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -175,6 +179,7 @@ buck6 {
 			};
 
 			aldo1_3v3: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index b907a1396..857b4ebe3 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -143,6 +143,7 @@ &pdma {
 };
 
 &i2c8 {
+	bootph-pre-ram;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
 	status = "okay";
@@ -150,6 +151,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&vcc4v0>;
 		vin2-supply = <&vcc4v0>;
@@ -163,6 +165,7 @@ pmic@41 {
 
 		regulators {
 			buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -177,6 +180,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -205,6 +209,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -298,6 +303,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
-- 
2.43.0

