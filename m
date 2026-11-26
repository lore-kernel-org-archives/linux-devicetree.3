Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653466;
	b=qADEdfP+lw5tdJ1ShgWV+ZoQbHeVwCcFh8pFI3UNfx+HHMpPJ/BfxTX6qPeZxoP40MDa
	 +uXkIkqcAnsDn/iSykfrht3IYgXRkI8kTC2aSmgXH8xvTl03miM9tFD8RHOPQwMPrHJuD
	 9vRsFVrybRkZSGa5myb6SyGRQKVOt/X9V2OiVDepM+PTlRWKWb2dlH/pQCd1CbjCG02+E
	 /mQ9LEIGvAcwfwyv+XZ3By6GHOjjiK+6HNxbpv89/umXj0QwcxbR8DH2wAqhthtUm3jYK
	 SUoewcRBNZhrrfs51DFIQ8hjxq9MiFYgf6XVW/9TWChOUMjRNZYMt59VcSamck1RxPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653466;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=ReRvhe43r+7BKekCxeMyvC5OZywehkr70IjbGLfffBU=;
	b=qltGPpiDfqotzjuwSiwhl2e3luEBxIhkUyZxf4QxLJ/MRpVph3BXd9yMFFGmKkfVJPCp
	 LrmTILSR1O65kB1GkFdGMERLuLA37DLbqrLnr0VQoOodhRqc9tt2QkoDn2cFl8dxgQGHk
	 /7yiwSpm1x9FZBPcUXK57WnsANxZNEUtLHnysGkbw6pOEQe9JVHJguQ62vZiVPgjoxCfy
	 Pbh9kTMJPb5T4W3MfmUfT8xeHzD+erU1IK+88NQM0kqRaAKuunyJYv7PMFej21o/noUxd
	 84dnxEvBBoz0O8xAPw0ZZ2lUZVZc5yQFzkartrIlGGPc2sTJVVNJrDwjIrIBIGvXnXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fhDojiir;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D7A606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fhDojiir
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE1D1F000C6;
	Thu, 26 Nov 2026 00:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653465;
	bh=ReRvhe43r+7BKekCxeMyvC5OZywehkr70IjbGLfffBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fhDojiirDA3m1eMjl/vzGVk5q7BNcQPZHlj7v/nOct94e1yiAhevHBhx2y282hji9
	 40H6OlOIvTPejfy6KR+fBtMBvRBpXymG+h+Qm1EawVkfR2aa27Yl6P8kURqxFAnzfM
	 osejD4LkOx7lyPBPTbjSFiubiLPrFAtCLtc1l9J2lNA4hXb9Ck0lw9USf3OLv2i/DL
	 DDfqJuY6YyPfkH9eosEfMMplP9UkyxV4BoH1D+/ErYutY8Bm8YqPlHNesteN+hoOWp
	 fBIn+l4RHc5yoyQA89WmhkW1ncWvJOp3jMkv3xrcbjy0t+XsGOlogDxc3I9sTN9t90
	 n7y4a/q0VHKXA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:21 +0100
Subject: [PATCH 17/20] ARM: dts: nomadik: Correct controller and clock unit
 addresses
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
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-17-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

Use the MMIO addresses in I2C and cache-controller node names. Remove
frequency and dummy unit addresses from clock nodes without reg. The
clock driver uses node names without unit addresses, so clock names
stay unchanged. Name the GPIO I2C bus i2c-bitbang to avoid the GPIO
consumer property pattern. Found with W=1 CHECK_DTBS=1.

Fixes: f2b56a6b2b07 ("ARM: dts: ste: Align L2 cache-controller nodename with dtschema")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-nomadik-nhk15.dts    |   2 +-
 arch/arm/boot/dts/st/ste-nomadik-s8815.dts    |   2 +-
 arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi | 150 +++++++++++++-------------
 3 files changed, 77 insertions(+), 77 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-nomadik-nhk15.dts b/arch/arm/boot/dts/st/ste-nomadik-nhk15.dts
index ebf761059bfe..b39cee4b7021 100644
--- a/arch/arm/boot/dts/st/ste-nomadik-nhk15.dts
+++ b/arch/arm/boot/dts/st/ste-nomadik-nhk15.dts
@@ -89,7 +89,7 @@ ethernet@300 {
 		};
 	};
 
-	i2c-0 {
+	i2c@101f8000 {
 		lis3lv02dl@1d {
 			/* Accelerometer */
 			compatible = "st,lis3lv02dl-accel";
diff --git a/arch/arm/boot/dts/st/ste-nomadik-s8815.dts b/arch/arm/boot/dts/st/ste-nomadik-s8815.dts
index 487b6daf07be..3941abcdb700 100644
--- a/arch/arm/boot/dts/st/ste-nomadik-s8815.dts
+++ b/arch/arm/boot/dts/st/ste-nomadik-s8815.dts
@@ -106,7 +106,7 @@ ethernet@300 {
 		};
 	};
 
-	i2c-1 {
+	i2c@101f7000 {
 		lis3lv02dl@1d {
 			/* Accelerometer */
 			compatible = "st,lis3lv02dl-accel";
diff --git a/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi b/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
index 4eba7c943368..76db00fcba18 100644
--- a/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
+++ b/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
@@ -15,7 +15,7 @@ memory@0 {
 		    <0x08000000 0x04000000>;
 	};
 
-	L2: cache-controller {
+	L2: cache-controller@10210000 {
 		compatible = "arm,l210-cache";
 		reg = <0x10210000 0x1000>;
 		interrupt-parent = <&vica>;
@@ -139,7 +139,7 @@ mmcsd_default_cfg1 {
 				};
 			};
 		};
-		i2c-0 {
+		i2c0 {
 			i2c0_default_mux: i2c0_mux {
 				i2c0_default_mux {
 					function = "i2c0";
@@ -153,7 +153,7 @@ i2c0_default_cfg {
 				};
 			};
 		};
-		i2c-1 {
+		i2c1 {
 			i2c1_default_mux: i2c1_mux {
 				i2c1_default_mux {
 					function = "i2c1";
@@ -195,7 +195,7 @@ src: src@101e0000 {
 		 * MXTAL "Main Chrystal" is a chrystal oscillator @19.2 MHz
 		 * that is parent of TIMCLK, PLL1 and PLL2
 		 */
-		mxtal: mxtal@19.2M {
+		mxtal: mxtal {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <19200000>;
@@ -207,7 +207,7 @@ mxtal: mxtal@19.2M {
 		 * divided by 8. This clock is used by the timers and
 		 * watchdog. See page 105 ff.
 		 */
-		timclk: timclk@2.4M {
+		timclk: timclk {
 			#clock-cells = <0>;
 			compatible = "fixed-factor-clock";
 			clock-div = <8>;
@@ -216,7 +216,7 @@ timclk: timclk@2.4M {
 		};
 
 		/* PLL1 is locked to MXTALI and variable from 20.4 to 334 MHz */
-		pll1: pll1@0 {
+		pll1: pll1 {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-pll-clock";
 			pll-id = <1>;
@@ -224,13 +224,13 @@ pll1: pll1@0 {
 		};
 
 		/* HCLK divides the PLL1 with 1,2,3 or 4 */
-		hclk: hclk@0 {
+		hclk: hclk {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-hclk-clock";
 			clocks = <&pll1>;
 		};
 		/* The PCLK domain uses HCLK right off */
-		pclk: pclk@0 {
+		pclk: pclk {
 			#clock-cells = <0>;
 			compatible = "fixed-factor-clock";
 			clock-div = <1>;
@@ -239,27 +239,27 @@ pclk: pclk@0 {
 		};
 
 		/* PLL2 is usually 864 MHz and divided into a few fixed rates */
-		pll2: pll2@0 {
+		pll2: pll2 {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-pll-clock";
 			pll-id = <2>;
 			clocks = <&mxtal>;
 		};
-		clk216: clk216@216M {
+		clk216: clk216 {
 			#clock-cells = <0>;
 			compatible = "fixed-factor-clock";
 			clock-div = <4>;
 			clock-mult = <1>;
 			clocks = <&pll2>;
 		};
-		clk108: clk108@108M {
+		clk108: clk108 {
 			#clock-cells = <0>;
 			compatible = "fixed-factor-clock";
 			clock-div = <2>;
 			clock-mult = <1>;
 			clocks = <&clk216>;
 		};
-		clk72: clk72@72M {
+		clk72: clk72 {
 			#clock-cells = <0>;
 			compatible = "fixed-factor-clock";
 			/* The data sheet does not say how this is derived */
@@ -267,7 +267,7 @@ clk72: clk72@72M {
 			clock-mult = <1>;
 			clocks = <&pll2>;
 		};
-		clk48: clk48@48M {
+		clk48: clk48 {
 			#clock-cells = <0>;
 			compatible = "fixed-factor-clock";
 			/* The data sheet does not say how this is derived */
@@ -275,7 +275,7 @@ clk48: clk48@48M {
 			clock-mult = <1>;
 			clocks = <&pll2>;
 		};
-		clk27: clk27@27M {
+		clk27: clk27 {
 			#clock-cells = <0>;
 			compatible = "fixed-factor-clock";
 			clock-div = <4>;
@@ -284,7 +284,7 @@ clk27: clk27@27M {
 		};
 
 		/* This apparently exists as well */
-		ulpiclk: ulpiclk@60M {
+		ulpiclk: ulpiclk {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <60000000>;
@@ -295,193 +295,193 @@ ulpiclk: ulpiclk@60M {
 		 * peripheral clocking, clock gates.
 		 */
 
-		hclkdma0: hclkdma0@48M {
+		hclkdma0: hclkdma0 {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <0>;
 			clocks = <&hclk>;
 		};
-		hclksmc: hclksmc@48M {
+		hclksmc: hclksmc {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <1>;
 			clocks = <&hclk>;
 		};
-		hclksdram: hclksdram@48M {
+		hclksdram: hclksdram {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <2>;
 			clocks = <&hclk>;
 		};
-		hclkdma1: hclkdma1@48M {
+		hclkdma1: hclkdma1 {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <3>;
 			clocks = <&hclk>;
 		};
-		hclkclcd: hclkclcd@48M {
+		hclkclcd: hclkclcd {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <4>;
 			clocks = <&hclk>;
 		};
-		pclkirda: pclkirda@48M {
+		pclkirda: pclkirda {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <5>;
 			clocks = <&pclk>;
 		};
-		pclkssp: pclkssp@48M {
+		pclkssp: pclkssp {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <6>;
 			clocks = <&pclk>;
 		};
-		pclkuart0: pclkuart0@48M {
+		pclkuart0: pclkuart0 {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <7>;
 			clocks = <&pclk>;
 		};
-		pclksdi: pclksdi@48M {
+		pclksdi: pclksdi {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <8>;
 			clocks = <&pclk>;
 		};
-		pclki2c0: pclki2c0@48M {
+		pclki2c0: pclki2c0 {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <9>;
 			clocks = <&pclk>;
 		};
-		pclki2c1: pclki2c1@48M {
+		pclki2c1: pclki2c1 {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <10>;
 			clocks = <&pclk>;
 		};
-		pclkuart1: pclkuart1@48M {
+		pclkuart1: pclkuart1 {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <11>;
 			clocks = <&pclk>;
 		};
-		pclkmsp0: pclkmsp0@48M {
+		pclkmsp0: pclkmsp0 {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <12>;
 			clocks = <&pclk>;
 		};
-		hclkusb: hclkusb@48M {
+		hclkusb: hclkusb {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <13>;
 			clocks = <&hclk>;
 		};
-		hclkdif: hclkdif@48M {
+		hclkdif: hclkdif {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <14>;
 			clocks = <&hclk>;
 		};
-		hclksaa: hclksaa@48M {
+		hclksaa: hclksaa {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <15>;
 			clocks = <&hclk>;
 		};
-		hclksva: hclksva@48M {
+		hclksva: hclksva {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <16>;
 			clocks = <&hclk>;
 		};
-		pclkhsi: pclkhsi@48M {
+		pclkhsi: pclkhsi {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <17>;
 			clocks = <&pclk>;
 		};
-		pclkxti: pclkxti@48M {
+		pclkxti: pclkxti {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <18>;
 			clocks = <&pclk>;
 		};
-		pclkuart2: pclkuart2@48M {
+		pclkuart2: pclkuart2 {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <19>;
 			clocks = <&pclk>;
 		};
-		pclkmsp1: pclkmsp1@48M {
+		pclkmsp1: pclkmsp1 {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <20>;
 			clocks = <&pclk>;
 		};
-		pclkmsp2: pclkmsp2@48M {
+		pclkmsp2: pclkmsp2 {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <21>;
 			clocks = <&pclk>;
 		};
-		pclkowm: pclkowm@48M {
+		pclkowm: pclkowm {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <22>;
 			clocks = <&pclk>;
 		};
-		hclkhpi: hclkhpi@48M {
+		hclkhpi: hclkhpi {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <23>;
 			clocks = <&hclk>;
 		};
-		pclkske: pclkske@48M {
+		pclkske: pclkske {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <24>;
 			clocks = <&pclk>;
 		};
-		pclkhsem: pclkhsem@48M {
+		pclkhsem: pclkhsem {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <25>;
 			clocks = <&pclk>;
 		};
-		hclk3d: hclk3d@48M {
+		hclk3d: hclk3d {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <26>;
 			clocks = <&hclk>;
 		};
-		hclkhash: hclkhash@48M {
+		hclkhash: hclkhash {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <27>;
 			clocks = <&hclk>;
 		};
-		hclkcryp: hclkcryp@48M {
+		hclkcryp: hclkcryp {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <28>;
 			clocks = <&hclk>;
 		};
-		pclkmshc: pclkmshc@48M {
+		pclkmshc: pclkmshc {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <29>;
 			clocks = <&pclk>;
 		};
-		hclkusbm: hclkusbm@48M {
+		hclkusbm: hclkusbm {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <30>;
 			clocks = <&hclk>;
 		};
-		hclkrng: hclkrng@48M {
+		hclkrng: hclkrng {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <31>;
@@ -489,159 +489,159 @@ hclkrng: hclkrng@48M {
 		};
 
 		/* IP kernel clocks */
-		clcdclk: clcdclk@0 {
+		clcdclk: clcdclk {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <36>;
 			clocks = <&clk72 &clk48>;
 		};
-		irdaclk: irdaclk@48M {
+		irdaclk: irdaclk {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <37>;
 			clocks = <&clk48>;
 		};
-		sspiclk: sspiclk@48M {
+		sspiclk: sspiclk {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <38>;
 			clocks = <&clk48>;
 		};
-		uart0clk: uart0clk@48M {
+		uart0clk: uart0clk {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <39>;
 			clocks = <&clk48>;
 		};
-		sdiclk: sdiclk@48M {
+		sdiclk: sdiclk {
 			/* Also called MCCLK in some documents */
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <40>;
 			clocks = <&clk48>;
 		};
-		i2c0clk: i2c0clk@48M {
+		i2c0clk: i2c0clk {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <41>;
 			clocks = <&clk48>;
 		};
-		i2c1clk: i2c1clk@48M {
+		i2c1clk: i2c1clk {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <42>;
 			clocks = <&clk48>;
 		};
-		uart1clk: uart1clk@48M {
+		uart1clk: uart1clk {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <43>;
 			clocks = <&clk48>;
 		};
-		mspclk0: mspclk0@48M {
+		mspclk0: mspclk0 {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <44>;
 			clocks = <&clk48>;
 		};
-		usbclk: usbclk@48M {
+		usbclk: usbclk {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <45>;
 			clocks = <&clk48>; /* 48 MHz not ULPI */
 		};
-		difclk: difclk@72M {
+		difclk: difclk {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <46>;
 			clocks = <&clk72>;
 		};
-		ipi2cclk: ipi2cclk@48M {
+		ipi2cclk: ipi2cclk {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <47>;
 			clocks = <&clk48>; /* Guess */
 		};
-		ipbmcclk: ipbmcclk@48M {
+		ipbmcclk: ipbmcclk {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <48>;
 			clocks = <&clk48>; /* Guess */
 		};
-		hsiclkrx: hsiclkrx@216M {
+		hsiclkrx: hsiclkrx {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <49>;
 			clocks = <&clk216>;
 		};
-		hsiclktx: hsiclktx@108M {
+		hsiclktx: hsiclktx {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <50>;
 			clocks = <&clk108>;
 		};
-		uart2clk: uart2clk@48M {
+		uart2clk: uart2clk {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <51>;
 			clocks = <&clk48>;
 		};
-		mspclk1: mspclk1@48M {
+		mspclk1: mspclk1 {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <52>;
 			clocks = <&clk48>;
 		};
-		mspclk2: mspclk2@48M {
+		mspclk2: mspclk2 {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <53>;
 			clocks = <&clk48>;
 		};
-		owmclk: owmclk@48M {
+		owmclk: owmclk {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <54>;
 			clocks = <&clk48>; /* Guess */
 		};
-		skeclk: skeclk@48M {
+		skeclk: skeclk {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <56>;
 			clocks = <&clk48>; /* Guess */
 		};
-		x3dclk: x3dclk@48M {
+		x3dclk: x3dclk {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <58>;
 			clocks = <&clk48>; /* Guess */
 		};
-		pclkmsp3: pclkmsp3@48M {
+		pclkmsp3: pclkmsp3 {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <59>;
 			clocks = <&pclk>;
 		};
-		mspclk3: mspclk3@48M {
+		mspclk3: mspclk3 {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <60>;
 			clocks = <&clk48>;
 		};
-		mshcclk: mshcclk@48M {
+		mshcclk: mshcclk {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <61>;
 			clocks = <&clk48>; /* Guess */
 		};
-		usbmclk: usbmclk@48M {
+		usbmclk: usbmclk {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <62>;
 			/* Stated as "48 MHz not ULPI clock" */
 			clocks = <&clk48>;
 		};
-		rngcclk: rngcclk@48M {
+		rngcclk: rngcclk {
 			#clock-cells = <0>;
 			compatible = "st,nomadik-src-clock";
 			clock-id = <63>;
@@ -689,7 +689,7 @@ partition@1b80000 {
 	};
 
 	/* I2C0 connected to the STw4811 power management chip */
-	i2c-0 {
+	i2c@101f8000 {
 		compatible = "st,nomadik-i2c", "arm,primecell";
 		reg = <0x101f8000 0x1000>;
 		interrupt-parent = <&vica>;
@@ -715,7 +715,7 @@ vmmc_regulator: vmmc {
 	};
 
 	/* I2C1 connected to various sensors */
-	i2c-1 {
+	i2c@101f7000 {
 		compatible = "st,nomadik-i2c", "arm,primecell";
 		reg = <0x101f7000 0x1000>;
 		interrupt-parent = <&vica>;

-- 
2.56.1

