Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792833971;
	b=jBXsv0RFspzAa8UYzGT9hNL0HMxPxlN0ep3kjES4HA4/PcihByNO2FZfsJARF67vO8Gj
	 wRGV9NLPDQ/vXeDZy62kGytswAicIkgdu7eXobNrUtqeMPTJ3ZYQy9sa8chj1fVX24eyI
	 91GyRbRC8BFPCqZNrxFuS7REh4QUIVOs5lz9SyoGvFIvJpARBkPF54awx8erkXsQ3bKEt
	 ga5y9xyF3L6aK/qCNnymHZhH+LKDGgzGdtD0HK8peeh4/jZ5zZZw3VKSVkxWK/y5nvu61
	 T6prTe8DSsTqLlQkKPx1lguvF8w/CJSjGtIYiIahgPqSn12YGPSPf+e1LGV3GoLr0dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792833971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=thIlTFdBb0qcp3PAkfPcVWyFY4ERXyIUZczud0xoE2o=;
	b=1VlTJ0n+YKCYvdvdfYZK5A+umUWWJ6+hVKUVo1WpwPDIsqpu/RJ89NteU3qIV+xzzmsU
	 As31mfP7pmszPDGD1vqVuy+vTVFxWtLxVIhMNkCVMuyvUiyTnPdI6IwVpw3FuyUMneWJd
	 Qv0UrKlynqKVcs5xo91Fw7gA/YFjt9sGD2DrvfGF0CHXnTtmbFSl8ssXbpP3StzCOXeCr
	 Rv+qjlGfPuxQL1CVd5VUke334a3aKWRR59r/wwhKXhC6+6ZfppMrePPkO7XQBqgrKscsd
	 RxOpK4vIaxufrGlG31+0NbxhpJBoqAFptiz7UnpW59o/LJypfTBDx85IrIK2aO5j5uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yom9RZ3l;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C22606A323
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 09:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C22606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yom9RZ3l
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so881321a91.2
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 02:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792833971; x=1793438771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thIlTFdBb0qcp3PAkfPcVWyFY4ERXyIUZczud0xoE2o=;
        b=Yom9RZ3lbEZ6Ax6ZUwhl8hPNc4gHe8FzT3pYzh7VUa9NX7nyj8Fxc4nAGg6OowU28I
         mAB7peGMdUBo3782ZWTuQxaVFLn6M1tYp45M3HLyIh7MLlndZwSAVkvxfi97H9VbvniO
         FOnT3i2BH+38FkBrUl3vmMq2Eiv7SAUrnA3Y9fCZQ+xqhEyb9htEcjaWjualhqBFv91a
         M95XjryA6L6UNN/Y1iG67QkFBt+I31yHp3CofNImku26o7pse+zLTTtUPL51hYi94QTX
         ZpNxTSbwICCncT5okcQcXX+EUk6fTGroreTrgj0Vl9aTR9AQbH/87AJ+PmnTWvwEJzZr
         +FVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792833971; x=1793438771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=thIlTFdBb0qcp3PAkfPcVWyFY4ERXyIUZczud0xoE2o=;
        b=PvYtirMLDG+2J985OoTCRskE9HVETodWL+g8kuSZdmLeNbHe9i0poxhozOQ3GvfpyB
         4UvGsU31KV0J+6mMY8fdCcZrlveKq1K/mOMtWmfeTlsoPYuGZivkUNkhTAxN6kjDDyKD
         mc/X+R9RVNqkmcwtCo0QQ0YsuveNZbbkzvy+ISTkvRqBcgDDES+4+Vy/7UMVI5d1E/0R
         nyKssLektjVL7saj9tqodumHPMT7M6BOffdCCPagUj8hWJtt/+kWQ+E8wW3s8WDRSFrY
         YcVzYqhDG7rj1RXUW4h/qM1ZQ9eC/Rte/bl1bCtQIEyym+m2D7Ccwt0vPJJ36KiisQm8
         gFHA==
X-Forwarded-Encrypted: i=1; AKwUvBw31jBK00Zi7X2lFSB/CseEG4wnPPfOg0nRYPu7alfJAp8gcqdeSRpiMx6DhzrZmlDMQJezZ9L1jY6Z@vger.kernel.org
X-Gm-Message-State: AFq9FYLkh5B7O3XRxi8vdGhfw6XwH+PA3bWT2r+2LsTnObdRcFaTjZm1
	DJWhA8xO4gjziR3UArXIH8lJwmo5daRl/AfSkos5NvVT0F0WoAPv80k0
X-Gm-Gg: AYBFou1J/k1ZWe5vchWCVuVSHe58SkuQ3MQLiXetEDu4wHJoFahWkty8Rii05wDeiTr
	+ZmEp5LL7MBeJSjMm08P/f0X+Z1YrflNBozF4nofgvibnqwYW2OioqVdRLHx7lbG2mKC+WFv4sM
	BlLC+AWhrc20onWeMp4xUrKN7olNh3L7BTWTetctv+zedr5TQhLiPM/0Yp0imYwYgJ9HWMS3qVM
	8P35ixWFtMPPzNtysKqjv7sUukw5ywZGUuHDCSeVg3nWlootJXKAt8ll7T594E+B62eOzzTvarL
	Qfpf1ICSbZK8AVWmKkgmflcoXik7RIIVe7TN7jJEMUdA+8SofF+Ur/oY5u/Iuv2lt3o2xCfTe8+
	jXIg1JlxqRZr76/SgBMhgGYumYMWjOYnCZKF8hV7fCIGTRRqQdq+ifUh13uHweLoJy1QoqsxvxC
	AHQ6VZefFS+yKKu79HwLWAToeWWL3CZfxvmbRJJQNYXlr+sTAcSpz/BISh1iabEFl27pOeC2NkH
	6pwH/hDa2/wIHyX09nkyPySSkjU+B3TLjGxXQRRLA4WTJlwYsxH5E8st8Apfw+NfAOfufa8zVNG
	m7LMc6qP4vYoECzHaPhT48N45IpkrnMEY1r+t7OJLl9bk5B7+XIySfpwttEoqGSbPWUj8ukm3lS
	veUxZkkYuBJyobLujSht0hKRD5/vBZoiDg2s=
X-Received: by 2002:a17:90b:35c6:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3adeae64f23mr1257289a91.40.1792833970704;
        Sat, 24 Oct 2026 02:26:10 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba38910sm1392312a91.1.2026.10.24.02.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:26:10 -0700 (PDT)
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
Subject: [PATCH v3 2/2] riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
Date: Sat, 24 Oct 2026 17:25:58 +0800
Message-ID: <20261024092558.143621-3-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board EEPROM at 0x50 holds the DRAM configuration (number of chip
selects, data rate and type), which has to be read before DRAM can be
trained. The P1 PMIC at 0x41 supplies the CPU core (buck1), the 1.8 V
rail of the EEPROM (buck3) and the SD card I/O (aldo1), which have to
be set up before that. Boards that boot from SPI NOR also need the
flash.

Mark these board devices bootph-pre-ram on the boards that have them.

Reviewed-by: E Shattow <e@freeshell.de>
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi | 5 +++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 5 +++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 6 ++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    | 6 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  | 5 +++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  | 6 ++++++
 6 files changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
index 81c40df2a3..5d1132f5a9 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
@@ -71,6 +71,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>;
 		pagesize = <16>;
 		read-only;
@@ -100,6 +101,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -113,6 +115,7 @@ pmic@41 {
 
 		regulators {
 			buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -127,6 +130,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -155,6 +159,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 58035d886b..90c4585d94 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -194,6 +194,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
 		pagesize = <16>;
 		read-only;
@@ -223,6 +224,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -236,6 +238,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -250,6 +253,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -278,6 +282,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 635e95aad1..93f486ba60 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -208,6 +208,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c04";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC18 */
 		pagesize = <16>;
 		read-only;
@@ -230,6 +231,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -243,6 +245,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -257,6 +260,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -285,6 +289,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -386,6 +391,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 23f32a8a3d..ce7342ed82 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -167,6 +167,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
 		pagesize = <8>;
 		read-only;
@@ -199,6 +200,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -212,6 +214,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -226,6 +229,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -254,6 +258,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -353,6 +358,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index eb77aae9d6..83ad1cc06d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -158,6 +158,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		pagesize = <16>;
 		size = <256>;
 		read-only;
@@ -187,6 +188,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&vcc4v0>;
 		vin2-supply = <&vcc4v0>;
@@ -200,6 +202,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -214,6 +217,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -242,6 +246,7 @@ buck6 {
 			};
 
 			aldo1_3v3: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 790234f355..dba5f8a021 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -185,6 +185,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		pagesize = <16>;
 		size = <256>;
 		read-only;
@@ -214,6 +215,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&vcc4v0>;
 		vin2-supply = <&vcc4v0>;
@@ -227,6 +229,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -241,6 +244,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -269,6 +273,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -366,6 +371,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
-- 
2.43.0

