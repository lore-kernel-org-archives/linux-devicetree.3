Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653438;
	b=3GWXUUUd0I8usja5J8WBDXwhoPh9qvht67Sz+gIfFA94ODbv8W9k+QTxiO0tP0a5Vpfr
	 rNGXRvjoi7P7R0jqK2EmW7HzM/stevOhZ3qihoNLLDD+89EqWkrzYvhRRB/XI1OoBDFqL
	 KMnYJe2XcsBlmkc2rAkNk2cOikAQOrAH1wLiwGePxKvt/g9YerN+VdGzT0ZDQssbAdzDZ
	 IcMx7VRnv4o/oXn2n3q8minsh+cnR26Z8WRKRWbByftaGc8cj7SF0QfpVEIsthPl+lY82
	 Y4axxcxU/HvTKsqvpFf0wLcFmuwueHlFg9CA7yuVvOSyoYI87ZWoP+NbmGr7SnAiIiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653438;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=uVupoW+kahnaPSWgFyIp1BQs39uWiXLnt0FbgSsbxs4=;
	b=3xXNHHiDpfVsgZrMztK/7nZOH2nP1qm3aaYsHyrrI/shSApL4z6+AELuKXCJ9dU6TzHY
	 RXczlp5YiHXjGAebgNhabQ14E6aW5CgZeE0pnjXqRKGNt4dc3JZn70DK6sIXowgiFWVb6
	 0OGWIrwSg81mG7ObbZ8/914fehHsNGwkS6cs5lvAU2/39QiT56MwtVu4laiWWmpUN7tue
	 tNgSVtXLB+f+0IXkyXc3JW4XchFhZbYwzJjAHvhG0msGNfqr/zqm1S0pmq8mfSX+rbg6v
	 57Z5llMHSOE2hiX47JvAgDR7u2jW9tDV17Emis1Z5KFNUcX5V9HUACQcCFA7fPAQ+Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DuUqt0sc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1394606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DuUqt0sc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA2C1F000C6;
	Thu, 26 Nov 2026 00:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653438;
	bh=uVupoW+kahnaPSWgFyIp1BQs39uWiXLnt0FbgSsbxs4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DuUqt0scyQ4BfGn60h3o/qj6MXFvD0z3ynsfSxlhiQgsVyVxdjpQzkaeCJia7WvO+
	 c6mSLSMKChFMGh3JK7QtJ90jKzaHOKK9jtlTep02T4mkkHLFFCb0CHIffLpwiXbV5z
	 X0Bf13tWStvZYPD2k+LGcOgduw+bwUmhJhVFVZWk4huNhxN5VPhlTK4cK0rKKvb39D
	 LZqaPIFhJNQYydxtVtDOgJ9PjG2hcXZo8TMOFsZE/JmpvuxIWWn7+5Dgy+j+dEk58R
	 LFrZnEifrW2iJZw1I8myTNBKeze64P7dRK6Y5qqs5nEIptyTUS1F63dS8GNkvM7zDy
	 cRzF31OKM1SPA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:08 +0100
Subject: [PATCH 04/20] ARM: dts: ux500: Remove bus clock rates from I2C
 peripheral nodes
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
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-4-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

Several Samsung I2C peripherals contain clock-frequency = <400000>.
These devices do not consume such a clock; bus frequency belongs to
the I2C controller. Remove the misplaced properties while retaining
the controller settings. Found with CHECK_DTBS=1.

Fixes: 8388234ec562 ("ARM: dts: ux500: Add Codina TMO device tree")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts | 2 --
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts     | 3 ---
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts     | 1 -
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts     | 2 --
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts       | 2 --
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts     | 2 --
 6 files changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
index 3350fc775cc9..6afc9b0113ff 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
@@ -241,7 +241,6 @@ i2c-gpio-1 {
 		magnetometer@c {
 			compatible = "alps,hscdtd008a";
 			reg = <0x0c>;
-			clock-frequency = <400000>;
 
 			avdd-supply = <&ab8500_ldo_aux1_reg>; // 3V
 			dvdd-supply = <&ab8500_ldo_aux8_reg>; // 1.8V
@@ -482,7 +481,6 @@ i2c@80004000 {
 			proximity@39 {
 				/* Codina has the Amstaos TMD2672 */
 				compatible = "amstaos,tmd2672";
-				clock-frequency = <400000>;
 				reg = <0x39>;
 
 				/* IRQ on GPIO146 "PS_INT" */
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
index 8df2e4b74174..d3325276dfa0 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
@@ -298,7 +298,6 @@ i2c-gpio-0 {
 		magnetometer@c {
 			compatible = "alps,hscdtd008a";
 			reg = <0x0c>;
-			clock-frequency = <400000>;
 
 			avdd-supply = <&ab8500_ldo_aux1_reg>; // 3V
 			dvdd-supply = <&ab8500_ldo_aux2_reg>; // 1.8V
@@ -321,7 +320,6 @@ nfc@2b {
 			compatible = "nxp,pn544-i2c";
 			/* IF0, IF1 high, gives I2C address 0x2B */
 			reg = <0x2b>;
-			clock-frequency = <400000>;
 			/* NFC IRQ on GPIO32 */
 			interrupt-parent = <&gpio1>;
 			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
@@ -565,7 +563,6 @@ i2c@80004000 {
 			proximity@39 {
 				/* Codina has the Amstaos TMD2672 */
 				compatible = "amstaos,tmd2672";
-				clock-frequency = <400000>;
 				reg = <0x39>;
 
 				/* IRQ on GPIO146 "PS_INT" */
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
index 277060c08a20..1cbccaa1c3cd 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
@@ -536,7 +536,6 @@ i2c@80004000 {
 			proximity@39 {
 				/* Gavini has the GP2A030S00F proximity sensor */
 				compatible = "sharp,gp2a030s00f";
-				clock-frequency = <400000>;
 				reg = <0x39>;
 				/* FIXME: GPIO146 provides power on, IR LED? */
 			};
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
index e821527f418c..1ab09e8d8d2d 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
@@ -411,7 +411,6 @@ nfc@2b { /* 0x30? */
 			compatible = "nxp,pn544-i2c";
 			/* IF0, IF1 high, gives I2C address 0x2B */
 			reg = <0x2b>;
-			clock-frequency = <400000>;
 			/* NFC IRQ on GPIO32 */
 			interrupt-parent = <&gpio1>;
 			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
@@ -607,7 +606,6 @@ i2c@80004000 {
 			proximity@44 {
 				/* Janice has the GP2AP002A00F with light sensor */
 				compatible = "sharp,gp2ap002a00f";
-				clock-frequency = <400000>;
 				reg = <0x44>;
 
 				interrupt-parent = <&gpio4>;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
index 30f9bdfd2893..dad2844169b1 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
@@ -414,7 +414,6 @@ i2c@80004000 {
 
 			proximity@44 {
 				compatible = "sharp,gp2ap002s00f";
-				clock-frequency = <400000>;
 				reg = <0x44>;
 
 				interrupt-parent = <&gpio4>;
@@ -438,7 +437,6 @@ i2c@80128000 {
 
 			accel@18 {
 				compatible = "bosch,bma254";
-				clock-frequency = <400000>;
 				reg = <0x18>;
 
 				mount-matrix = "-1", "0", "0",
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
index c3eb07fe2a27..9aaf42014efe 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
@@ -394,7 +394,6 @@ i2c@80004000 {
 
 			proximity@44 {
 				compatible = "sharp,gp2ap002s00f";
-				clock-frequency = <400000>;
 				reg = <0x44>;
 
 				interrupt-parent = <&gpio4>;
@@ -419,7 +418,6 @@ i2c@80128000 {
 
 			accel@18 {
 				compatible = "bosch,bma254";
-				clock-frequency = <400000>;
 				reg = <0x18>;
 
 				/* GPIO224 used as "smart alert" interrupt */

-- 
2.56.1

