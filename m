Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1593D522F
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 18:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792260117; cv=none; b=p5wae1q+nHJ9qTHindixtmm6x+gy620sZUdfb/frTwpYotUwbHgpJ3+ttUJp0GjExFVO0+RjJyfeZ6a8JnefpxJ+clvr09B+52pYPf78DpPUWHCtJ3JAuC11ft58btLqIaT//8E6GZ066EdYX1lMW7cmRJR4MrvCMUkr0gbVLx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792260117; c=relaxed/simple;
	bh=+rJ38hYTReBLGM0i0BEGwwNq1xjdWSYTDMxpDbwZz3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBldYdpTJbcAUaescJ+oJDP+F9uSuEcopFKu2OmPJu9wYmFBAcmjQ3w2cpmTdtTAwLcX5px1sagzHTwdBRqbV17AmLSXnGXlgfN0UISOARexF6bSN9czbtnG0kLetGJT5FC+GLFWo70S7NjZMv2f9GsLTnZX6RL4LUbBLRx3HNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1L7H/wI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1L7H/wI"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2dd76b1361dso3800365ad.1
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 11:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792260115; x=1792864915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bhMU5YQDF+h0QOZnuRQ0eb4Qi9wFPzDrVlWZL7Jj0pM=;
        b=M1L7H/wIrYjGpiPZTzkdIP7PsB6lXhhzoQYeizBmExAqNrqf33Pcdv+3/vFzmSQmV4
         1vC3/kYFxzxSdCSpWyZcMYD4+lBiHsd+LDw1dJCcU2NuLmEHSgOAZ1ej8nIbcL+/WJGu
         8R041Ad4Eq4Ijs8PJbYqwDygfAn55xQzXIrVqobVmmhZoHnZcHHAkT2xhaT3TPh6JeQL
         ZM8/Fe1bXb/h6wyGKccwlG7/xCwZ/ZhdMYjRCkIIuXDht3/l+P0yYXFA/hmkzCdU46Jw
         tD2ongjZWxDp+bBqqsmZWS8IHHiXYSeXkuScAsslHdO0t99FHGYTJdc+fMrr7pE+vbxR
         UIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792260115; x=1792864915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bhMU5YQDF+h0QOZnuRQ0eb4Qi9wFPzDrVlWZL7Jj0pM=;
        b=SZfc2Xbihg6i/xDT1fuEE4FX0UjBbkU57nucIPJnO9Skmyc7Tm8eUHiKUz3EvGepnk
         IyC/+4VAKGlJTBrAb93MbCJaU6Xb8SY6ruDF9ySbiwmrkkbLj8MoHRAfV+vzeK/4HCA/
         LS/zqyH8euur8nxIldvu+sEduSr5/GBiLC5y6OL2/WUbwt5HTZxm1yZ9M0FRonhVBJGl
         7ky4ofmnqIeMEXBOphnkzPnNEJdV8Ye4ega2X+Ni4S/jPoRxoLglZ5PxIby6VrKAw/br
         h8i2Fj5Kzykr8Vvw1+wDIhpUPvLs+JsDUnwfB+qTW4grnckUWlA+kBqPbrr4/sWINt7V
         fnqA==
X-Forwarded-Encrypted: i=1; AKwUvBypRHcetkK+Ou11HFdI+5bh6Kw3v4hXr4835XLE1cM8o9GACnPGwfne6bTzvYJEV++fygKKqBCiMOq2@vger.kernel.org
X-Gm-Message-State: AFq9FYLxTpULvhY+go3CoveNy3wlKg3+PcUEQNEZI951feN9x9gYwwZc
	inSfFc4wrTZou5jp0LjvO0beaAMRTVupjzCTr3VmlPnOSUcgTwhnJYDt
X-Gm-Gg: AYBFou3ADieqYvHAi4R2VNIz5A7qzZN8mmVwdpzOQWKJkiEDaJhFSZn/jVmiuYTySOi
	mUJu41aVdqHlADvDHt4DYq8ZF4RIv9M4UAFKW3DZwwysFpA8BCepOC1fwsIsOTEEdD8z0EW/RDQ
	FL/MbTeGauLlu95xjNDYwvzKrNtKTuvkc9pP4E/Bdci/o6UFfC0plY8VNXCKlXSypQ8GFl1MskQ
	Q9PKy/JatXHumV/qiyx02W2wkdpGvF1K4lfG787SRYhsZdLy2FyEJ8EP8/G96JPe+ceLTcTFEDO
	SDNLdCeGIVdl4J4lzWeGHA0A2dvqri+Eyhwsn5FwaO1XWmXsjtV2vgN5rXUV7Yt88vqUa1ZTkXL
	Jg7y2RUQt7xYb9KFPcRkHaXz9Cwt33PADJZ8mjsyqMvgh3TNkLT7BSSKdIPzB9xB7XFDT8yVhJR
	+k0UsT8JbPeyhBIDgrqFKgGGsdTKcdWAWtt//IMwNsxm2PEHkAVvC1UbEQdNpSvGJEYUVbGp/uQ
	kgpt9+n66PpdynctC0YWip6dah52PkBySJ85+DIL5/Z+BoVydfQkxcsh0IeVN2bsmS7QXXc7cSl
	/auJV9L6blOze3c131hjj5BVBZEjQx/6/nphJRb/+1S58Gy2ciKaiIk=
X-Received: by 2002:a17:903:948:b0:2dd:ad74:ac32 with SMTP id d9443c01a7336-2e9a6d25aeemr29917805ad.27.1792260115229;
        Sat, 17 Oct 2026 11:01:55 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d98d9sm23030035ad.2.2026.10.17.11.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:01:54 -0700 (PDT)
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
Subject: [PATCH v2 2/2] riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
Date: Sun, 18 Oct 2026 02:01:41 +0800
Message-ID: <20261017180141.3477743-3-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017180141.3477743-1-alan.tseng.cs@gmail.com>
References: <20261017180141.3477743-1-alan.tseng.cs@gmail.com>
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

Mark these board peripherals bootph-pre-ram on the boards that have
them, together with i2c2 where the EEPROM sits. i2c8 is tagged in
k1.dtsi, as every K1 board connects the PMIC there.

Assisted-by: claude-opus-5-5 dtbs_check
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi | 6 ++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 6 ++++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 7 +++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    | 7 +++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  | 4 ++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  | 5 +++++
 6 files changed, 35 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
index 81c40df2a..acb8fa2e6 100644
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
@@ -100,6 +102,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -113,6 +116,7 @@ pmic@41 {
 
 		regulators {
 			buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -127,6 +131,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -155,6 +160,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 58035d886..b91db3204 100644
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
@@ -223,6 +225,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -236,6 +239,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -250,6 +254,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -278,6 +283,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 635e95aad..d2a39cf55 100644
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
@@ -230,6 +232,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -243,6 +246,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -257,6 +261,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -285,6 +290,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -386,6 +392,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 23f32a8a3..a3d0e38ac 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -160,6 +160,7 @@ &pdma {
 };
 
 &i2c2 {
+	bootph-pre-ram;
 	pinctrl-0 = <&i2c2_0_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -167,6 +168,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
 		pagesize = <8>;
 		read-only;
@@ -199,6 +201,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -212,6 +215,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -226,6 +230,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -254,6 +259,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -353,6 +359,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index eb77aae9d..5e2fde8be 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -187,6 +187,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&vcc4v0>;
 		vin2-supply = <&vcc4v0>;
@@ -200,6 +201,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -214,6 +216,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -242,6 +245,7 @@ buck6 {
 			};
 
 			aldo1_3v3: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 790234f35..d4adfc5b7 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -214,6 +214,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&vcc4v0>;
 		vin2-supply = <&vcc4v0>;
@@ -227,6 +228,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -241,6 +243,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -269,6 +272,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -366,6 +370,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
-- 
2.43.0

