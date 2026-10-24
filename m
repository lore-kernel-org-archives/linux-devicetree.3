Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792833969;
	b=xKp1GsuWWgfueiajiOPKIz+AcmJHGI6UXoGcHnhgnJrbPPC2YlnkHLAaQtiWfnFl6ACQ
	 /eetfbVPGnen5AX/OMWEeC//UTMGk2uw4M88dggxw+VmxWSvCxz2p41Rfa43RHtZ4gidR
	 W5fhyAJT7xMDpFcTCx9Z0zDt9Z3LPfnWMenGAPim2eCybOe8fe+ds7CDs8mDVVx8WNjYR
	 Aj6qfTkRWzyhRVIudzfWf/38VpVbzQl30OwSOE8IeY4rX5LzcNM80TO3RIH+8B+i7EZ8+
	 Mefi6gpmwD+4oeqyAzfnkfLppT3/wTMY4k/OKKx1Td99q54Kr/kJU1t3Ct/rsq9Vx5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792833969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X5ZJMOxvmROQRxk8HIdSLxRbfib4kWxlGWVgMaC6xl4=;
	b=cvySuqQRdF9q0v1UobPShDiFjQ37ZQmdpM89w/bNjLKyX75jnRU4WiHJ+pnmKRmUhXg/
	 arXy734verEFhmV0SOayDm+502AaQxmg3I5Y3Co2a/E/ZlHhGcztiR89wA4JM2IVSQnGB
	 GLWz7MhbhEwr6J6k+xIpyBlDVlio7/4B6nup04bqz1HOuvUuwTwt00pFA0Q0v0X3VeEV0
	 6yBuveVNRovRYu4OekF2L1jfTZJfltfiWo1StrmcXqY28M21uh3kWqR1LbQ/jCojPzR6f
	 O9KdttnVY4ofAr49N/2wyr56DQROcFzPJf/SOPXdej7LRk23Y0dyOOIpFhZ/nreg1Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="W51/Lg0e";
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6F0606A321
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 09:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F6F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W51/Lg0e
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so1196175a91.2
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 02:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792833967; x=1793438767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5ZJMOxvmROQRxk8HIdSLxRbfib4kWxlGWVgMaC6xl4=;
        b=W51/Lg0ea8WRSyIB0CJF2KEH9Qk7M2dEWp9lsvfMd7bQJY7HcFidcEvC+em4DZ0lt2
         IT7CCEPqMjCpfL37yynWiaiGae/9+zv8bx+WcYtfLd6ZfERu6i850uKXTX2agM+0VNb2
         uZB/fNOt4nZLPzwv/pS1NYkn+vddbGFvS+Rdpe8jR7Z/2TBpeomGQEPZZNWjsL3fAwP+
         ybF+oK0wrHdaaqan3af4IxAev31MekMNQAqRgpY5Ip5hw6XM7SDV9xGzHXVL8T2xioAz
         6zX7dnNBzMWpWnQLOB8e/JlCwrh8OTS4S3gQ0vmjSr8aXSYNEQrHk5WvJxC4t3aWfwE3
         VuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792833967; x=1793438767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X5ZJMOxvmROQRxk8HIdSLxRbfib4kWxlGWVgMaC6xl4=;
        b=Dtu/Ld3k5ExPf1o7Aq2lF08nCAK890p8vP+7bWs1XzZ5w7jLENGq6+n6XfFdJ/OLFn
         WzwEiIV9Us797NWyhGNrVxTxWHDSvDqqYVmBTdVx+STQ6qkulxztnMPehi1KnfkdKPRh
         WJPiHAzAIZkojsvQ+GBNptpwUTkFrodIlMsNfeNfz3gbVeBb6SimYDQVW91j8LZ14wQi
         vIvdxYATri9hI/AC8h3CwUu6ypi0YRL5ksJGE5xL/V9z/vu/Bx42Uz8EcKliiN9J/lB0
         RjVEHJmtWBEGMbz4lN6/5ShiDmfoLegVYThBuKuDUq/2ExxSMLiivxAXoQQ57Lz+Kd0A
         IWqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWqlSAkhkqqLcWcfCN5CWYJwsggWReDiX4WlvBCL3KT7fQzcnJvdXnqkaWDh8uy1POWopiLf8u9XL+@vger.kernel.org
X-Gm-Message-State: AFq9FYKxhffa8Mo/AAC5fkPJfDcq/HV1/PXu1YVWI8uV89ecVvjmyxBJ
	l7XgUFvlv0V4u9QdIxfT11GwwQHeR/h4RGcf5t25XUqFjml94Yv83PIV
X-Gm-Gg: AYBFou2LdD8VLwcL16QQvbvyyl8623Szx6o/SCwnaB7Zp4n7SaIUNYMsFn7uMe9mkba
	n6aqOnFhtDsJsLQQZLldI9iewoy70cH6ai1O8qeZnhmN+FNjAVfZnQs8fvnymV6yRL2mTGFZh5V
	J9fFsuUVMhMBB8DFV9RGcnK70ECQ8FgkSAWlBKldBd8AWDIeUCI1E7jhSQ3HXE+hXidsp4MkAZJ
	dvinoKhIprUHc3oEwdiZG5gSi85vqyjnOf8Y7E/ZGFL4qYKfxzV/7fF3YJX8uWAXxNnyc6dylmc
	1GPf6AptQ8evVxuK/ICeciXypkODcel29szM1mxWBT2aagcufrb96vCXVi8yiqlumkvyQcaCqpd
	sAH2UkJ1OTIMqQMELnfYt8kSfaqXykRYzu8ErUe94yDTM0Yu+L369OQNQGsGSvD1EAbHQJIHzKD
	CeB9R+ZBW+orK+RkmdDWiv4W7dJNLiWmHTlFFMBMzB87dPFlKTylm+yvVTZRA3DevqL/lek7wrs
	WmhhckgPnN/8IdfbFOSuSqma5J1P0MMPTLdRROSGl2F7Zn1avNHJTfK6mgpLmAe8XlYm0gA3yHN
	npnQIuPbeYEAzGMhggOG+Grzmk4UX1ZPxJvxwpd9A8fxWSEBMx4GPnyjsIhWZ8Eh+hsdb+cKETs
	JqiVHBH1pxwM/qpOpx5n29qgInxRSmVfMR+g=
X-Received: by 2002:a17:90b:1812:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3adeac04979mr1472063a91.10.1792833967618;
        Sat, 24 Oct 2026 02:26:07 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba38910sm1392312a91.1.2026.10.24.02.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:26:07 -0700 (PDT)
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
Subject: [PATCH v3 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Sat, 24 Oct 2026 17:25:57 +0800
Message-ID: <20261024092558.143621-2-alan.tseng.cs@gmail.com>
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

The K1 BootROM loads the next boot stage from SD, eMMC or SPI NOR into
SRAM, and that stage brings up DRAM. To do so it needs the fixed clocks,
the clock and reset controllers, the console UART, the boot media
controllers (sdhci0, eMMC and QSPI), and two I2C buses that every K1
board wires the same way: i2c2 to the EEPROM that holds the DRAM
configuration, and i2c8 to the PMIC that supplies the SoC.

Mark these nodes bootph-pre-ram, the phase that sets up SDRAM.

Reviewed-by: E Shattow <e@freeshell.de>
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd3411..8a954f56a9 100644
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
@@ -544,6 +548,7 @@ i2c1: i2c@d4011000 {
 		i2c2: i2c@d4012000 {
 			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4012000 0x0 0x38>;
+			bootph-pre-ram;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&syscon_apbc CLK_TWSI2>,
@@ -586,6 +591,7 @@ i2c5: i2c@d4013800 {
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -726,6 +732,7 @@ i2c7: i2c@d401d000 {
 		i2c8: i2c@d401d800 {
 			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd401d800 0x0 0x38>;
+			bootph-pre-ram;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&syscon_apbc CLK_TWSI8>,
@@ -857,6 +864,7 @@ pwm19: pwm@d4022c00 {
 		syscon_mpmu: system-controller@d4050000 {
 			compatible = "spacemit,k1-syscon-mpmu";
 			reg = <0x0 0xd4050000 0x0 0x209c>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -869,6 +877,7 @@ syscon_mpmu: system-controller@d4050000 {
 		pll: clock-controller@d4090000 {
 			compatible = "spacemit,k1-pll";
 			reg = <0x0 0xd4090000 0x0 0x1000>;
+			bootph-pre-ram;
 			clocks = <&vctcxo_24m>;
 			spacemit,mpmu = <&syscon_mpmu>;
 			#clock-cells = <1>;
@@ -877,6 +886,7 @@ pll: clock-controller@d4090000 {
 		syscon_apmu: system-controller@d4282800 {
 			compatible = "spacemit,k1-syscon-apmu";
 			reg = <0x0 0xd4282800 0x0 0x400>;
+			bootph-pre-ram;
 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
 				 <&vctcxo_24m>;
 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
@@ -956,6 +966,7 @@ uart0: serial@d4017000 {
 				compatible = "spacemit,k1-uart",
 					     "intel,xscale-uart";
 				reg = <0x0 0xd4017000 0x0 0x100>;
+				bootph-pre-ram;
 				clocks = <&syscon_apbc CLK_UART0>,
 					 <&syscon_apbc CLK_UART0_BUS>;
 				clock-names = "core", "bus";
@@ -1085,6 +1096,7 @@ qspi: spi@d420c000 {
 				reg = <0x0 0xd420c000 0x0 0x1000>,
 				      <0x0 0xb8000000 0x0 0xc00000>;
 				reg-names = "QuadSPI", "QuadSPI-memory";
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_QSPI_BUS>,
 					 <&syscon_apmu CLK_QSPI>;
 				clock-names = "qspi_en", "qspi";
@@ -1328,6 +1340,7 @@ usb_dwc3: usb@c0a00000 {
 			sdhci0: mmc@d4280000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4280000 0x0 0x200>;
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_SDH_AXI>,
 					 <&syscon_apmu CLK_SDH0>;
 				clock-names = "core", "io";
@@ -1341,6 +1354,7 @@ sdhci0: mmc@d4280000 {
 			emmc: mmc@d4281000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4281000 0x0 0x200>;
+				bootph-pre-ram;
 				clocks = <&syscon_apmu CLK_SDH_AXI>,
 					 <&syscon_apmu CLK_SDH2>;
 				clock-names = "core", "io";
-- 
2.43.0

