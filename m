Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4670B3D25D2
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 18:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792260113; cv=none; b=tdAmIPUUM00VjDgNla7eNeJ+3sx0Vb27xh8p1WBn80WZ5dkRYDK14veQbM5Q6fO0XpH6X/+aDmzx/tOmAoOTHoczR1ukUG8RNQnmWPnuiqTo/6acg7x3n0jaskHVhRg3i8XY99aXCv1mvARGOJgFE3MAlPbQHVW24YILaDnugNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792260113; c=relaxed/simple;
	bh=pKYYbTKgnWyBpIOuKZaJmJCGy/gO8qvkO8MA7kmhyu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sL+aRyavZj06au5LYNHLaYu0FtZluT+FMDpE+Wxgac8zPV/feuPF7FJVS14Uqc9wuOENTSbUsL9KZJzrLbL+nyAyi1gHgtzU6YFNLKrpmdmQ4DyI9QJ/h+tjAdPS5HXBTALRRGdB3Po18imCWbRbnqUUov9UFUBHGhIS3i0+lk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pu0wqwMk; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pu0wqwMk"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2db80fcdf8bso4427775ad.2
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 11:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792260111; x=1792864911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i10C1318BcrIJPXpXStoFrX+oUsWnUZudq49qSCTuyQ=;
        b=pu0wqwMkKSskoEgBxKGDTmYC/9yFy+ZLF45I2/N7qzD+zkz5iI6vnjsMbxGscWMTUD
         fw0z1bkkI/SG1I7+72F+li08gO9usjBMDUULga1+zz/Tjq5bKMAiT+iOGU7xqBpGrdF7
         a2DSVIeReivVlCZniyLE72FJFuuBLf4n5K9SV5gOUm9ve+Oq6gyoPXVbPhXgzvSezbKp
         OVO4p/biNwU+4jNJZQtSpv5GOHmtUaZSgjlblqiNwmoGVGPWtUot6ehwVneGNQ9tM021
         BYKykGeSKUDRNefSVu1nKR7hdpyPo4Jr10tDu7+I+LM3jcDDY6+KGmneLTx8f3Eg9iwD
         zCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792260111; x=1792864911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i10C1318BcrIJPXpXStoFrX+oUsWnUZudq49qSCTuyQ=;
        b=22juM8RP3nyR/7vA8RsoAoolgXcZrl71SGJUn673kgJtuItGMEAljF8mxygFgyy+0q
         Pa4sP235UrzXW5rghj866khetMuR5d3PiObh7uL0BC7WRPevZ1Fzid+/3jTpetvgkJeM
         +FiMHb3YI7HpAbvhAC6Nis1I9dEPGfPe3r95YUNBeU6dHYzpymuQ9W7OnumrkMbiz024
         8P5Bfrq0tpy2kx4lfV7dtsl15F2y/7D66SQeyG8+119p77iQB3J0CcDoBgbTFKfYIdCl
         VjRiTBqmrEvyT1TKtf5gbCTiME+WOmpex/3/NLYuPAAOFaF/hXFS8TjwDuIHywrJceAP
         8whw==
X-Forwarded-Encrypted: i=1; AKwUvBz28pRI1IleXw6qRB5wTFN6HsSboH5fX8XwLjT+eooPraIyVNQr7WuY63ppsfY4FVNCbCzGg9J87QGf@vger.kernel.org
X-Gm-Message-State: AFq9FYLUhdHF7mYXSAYUL9enrDSYj3xmDtWKEufD7onapVBU24rTz3fs
	0qdbLWuyhyE/+hKM6PUsV8JcedZZLSFCH6Fmh7F1gaZ7A/Wf9l9p7Vli
X-Gm-Gg: AYBFou2ZbUcHB7w5SHSnNjZiGkEAdUB7GUbgKdfAK2uE9eHMOTDN7e65UCBFMYotfVk
	HtR0iqzKIQ0zEQVUWk7xRvz+dSVhIenE+znYrPrU4X5haZUS61giTHF66i6wK1ryuPSA7s0k8//
	vfUPtsAxNTwB3ElwwmAqqxvdRWGEMrvyeu6jBTeQw/IUEk7kpWeIKL24IfdxaaZrFSfhxbaoze2
	OTux9WAeXBWuP+RTOdP4Le3nPfZyWz/s//T5xZ3XDMQNOyi6X6eMetOUbmH1X0mAX1YSXW5EZ/7
	JUc9+nsigNvFIu7wNkPaXzQXM3Fx7Kov3xOPl47nXk0LDarNQAYsUeAxK36xeBCPxkJFv1qwR/I
	PCACT6C+r+9kFMOeIoLFtJ72sDuHrtgRMuNGCd7jLmzv75OzQ0GTCEhmqlQSIUTwHMHtXiLEhGt
	RLnEyvCcWhRdhEXooag9/wUl1SJAO/q8fTlnJY1eDmMfUz7I8ye6vLLMyrkCeC+QKaH6RhhR/wz
	Q25KaAAgs2J/AEXMrLOciY1omYL2u1X7uuLhk3yz9uUbtXyVeAYUV3DyJ0RpOQklEBxgPZyxpnv
	R6xezaZArfSWzal4w9wQISd9fsuIPt6wLgUIC6BHRqLeyfMZcdCwBA==
X-Received: by 2002:a17:902:eccd:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2e9a6c1b983mr25597675ad.16.1792260111161;
        Sat, 17 Oct 2026 11:01:51 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d98d9sm23030035ad.2.2026.10.17.11.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:01:50 -0700 (PDT)
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
Subject: [PATCH v2 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Sun, 18 Oct 2026 02:01:40 +0800
Message-ID: <20261017180141.3477743-2-alan.tseng.cs@gmail.com>
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

A bootloader SPL that follows the K1 BootROM runs from SRAM before DRAM
is up. It needs the root clocks, the clock and reset controllers, the
console UART, the I2C bus of the PMIC (i2c8, which every K1 board
uses), and the boot media controllers: SD (sdhci0), eMMC and QSPI NOR.
Mark these nodes bootph-pre-ram so an SPL can use the upstream device
tree as is, instead of carrying the tags in per-board overlays.

These are the SoC nodes that the mainline U-Boot SPL for K1 currently
tags in its board -u-boot.dtsi files.

Assisted-by: claude-opus-5-5 dtbs_check
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd341..5d9550272 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -322,6 +322,7 @@ cluster1_l2_cache: l2-cache1 {
 	clocks {
 		vctcxo_1m: clock-1m {
 			compatible = "fixed-clock";
+			bootph-pre-ram;
 			clock-frequency = <1000000>;
 			clock-output-names = "vctcxo_1m";
 			#clock-cells = <0>;
@@ -329,6 +330,7 @@ vctcxo_1m: clock-1m {
 
 		vctcxo_24m: clock-24m {
 			compatible = "fixed-clock";
+			bootph-pre-ram;
 			clock-frequency = <24000000>;
 			clock-output-names = "vctcxo_24m";
 			#clock-cells = <0>;
@@ -336,6 +338,7 @@ vctcxo_24m: clock-24m {
 
 		vctcxo_3m: clock-3m {
 			compatible = "fixed-clock";
+			bootph-pre-ram;
 			clock-frequency = <3000000>;
 			clock-output-names = "vctcxo_3m";
 			#clock-cells = <0>;
@@ -343,6 +346,7 @@ vctcxo_3m: clock-3m {
 
 		osc_32k: clock-32k {
 			compatible = "fixed-clock";
+			bootph-pre-ram;
 			clock-frequency = <32768>;
 			clock-output-names = "osc_32k";
 			#clock-cells = <0>;
@@ -586,6 +590,7 @@ i2c5: i2c@d4013800 {
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -726,6 +731,7 @@ i2c7: i2c@d401d000 {
 		i2c8: i2c@d401d800 {
 			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd401d800 0x0 0x38>;
+			bootph-pre-ram;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&syscon_apbc CLK_TWSI8>,
@@ -857,6 +863,7 @@ pwm19: pwm@d4022c00 {
 		syscon_mpmu: system-controller@d4050000 {
 			compatible = "spacemit,k1-syscon-mpmu";
 			reg = <0x0 0xd4050000 0x0 0x209c>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -869,6 +876,7 @@ syscon_mpmu: system-controller@d4050000 {
 		pll: clock-controller@d4090000 {
 			compatible = "spacemit,k1-pll";
 			reg = <0x0 0xd4090000 0x0 0x1000>;
+			bootph-pre-ram;
 			clocks = <&vctcxo_24m>;
 			spacemit,mpmu = <&syscon_mpmu>;
 			#clock-cells = <1>;
@@ -877,6 +885,7 @@ pll: clock-controller@d4090000 {
 		syscon_apmu: system-controller@d4282800 {
 			compatible = "spacemit,k1-syscon-apmu";
 			reg = <0x0 0xd4282800 0x0 0x400>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -956,6 +965,7 @@ uart0: serial@d4017000 {
 				compatible = "spacemit,k1-uart",
 					     "intel,xscale-uart";
 				reg = <0x0 0xd4017000 0x0 0x100>;
+				bootph-pre-ram;
 				clocks = <&syscon_apbc CLK_UART0>,
 					 <&syscon_apbc CLK_UART0_BUS>;
 				clock-names = "core", "bus";
@@ -1085,6 +1095,7 @@ qspi: spi@d420c000 {
 				reg = <0x0 0xd420c000 0x0 0x1000>,
 				      <0x0 0xb8000000 0x0 0xc00000>;
 				reg-names = "QuadSPI", "QuadSPI-memory";
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_QSPI_BUS>,
 					 <&syscon_apmu CLK_QSPI>;
 				clock-names = "qspi_en", "qspi";
@@ -1328,6 +1339,7 @@ usb_dwc3: usb@c0a00000 {
 			sdhci0: mmc@d4280000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4280000 0x0 0x200>;
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_SDH_AXI>,
 					 <&syscon_apmu CLK_SDH0>;
 				clock-names = "core", "io";
@@ -1341,6 +1353,7 @@ sdhci0: mmc@d4280000 {
 			emmc: mmc@d4281000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4281000 0x0 0x200>;
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_SDH_AXI>,
 					 <&syscon_apmu CLK_SDH2>;
 				clock-names = "core", "io";
-- 
2.43.0

