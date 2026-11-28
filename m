Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795838002;
	b=Slb6D1+njkndM2uUjJEvDx0lNKiEOdKx42M/OGmv9145BXjQEwQAKxVSvP3jTJjAc7r/
	 XqI0K6eqRU+P71bnY0XTgWYNO9bWjWNv6P+xy/5Qm8vmmiwHik6bPNtoKSORD47xzTc55
	 mLAqJIsy8lO5gZ6w0UL20Y8F5Gdez0SM5whdpZP66YovV6I5e2aqYJ8u6EUgwrg4Z1xGM
	 YxAQbpVSOpZjMN+0QWlg3OBd+Wjpr18biVSuioklfDTq2Siw+KwtETkmPLweTf6PZRfO7
	 FYHrRealii8z9w1C1bH/Bix6uIWuH3MMGTaB6V+3pGgohBjQJj8JbePlWizrtQxDYwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795838002;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RYaNgkhw0Zy/T1OcXP1WkkwTWFw60iMf37eUeE1Oo9U=;
	b=aP+IRg63dEhvLBSiI55gOy2OqCC/TS3ZXPU57cAVq82DL7e5RaEmhBMN06+pcA+NmSJn
	 vs5ei3N509j0n7hwkUPvHPp8i58bePfbYoPNHT2ULzuiDcp/NBuq2bfwFeV3FuSkwmVaL
	 2MZWGuY740sctX6hXpz7r6owDI0BPCRXJrRPK3BGPPheSJHaeiLz6WwwOmsbc0Vcr7AMJ
	 V/qCLEpr8gnu4DCumCB1UYDDziP1Qh0Oy0LrocnYm4gUiaV34+IukDdyhfWlLIwWp1bqX
	 VIH4xJ//C548ZHmiSQazoPqWj7jqP7inot59OVy2McJVumwp+7hYmkTJ9YChtTIxg9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mNmD+ubV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAF5606A33B;
	Sat, 28 Nov 2026 03:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mNmD+ubV
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795838002;
	b=JcKedYtZY59hxIjWSJ6zyl7Af/OAxIt2TAANNTXSyMVG3C4K5X22PYM85jeZ9DaSLRlR
	 7dhDm04P573fjA7MO7vH5/dDElaLAtXGjzxH1i+P08ovc3lZDu/BnJTYUFBuV+ictD5Ia
	 18JiHgzKlsDY0N7THnfhDJsX1O/Yt8OY+rn1V4s4larZ7jW72uYxKMH43SRSUuNmMCDYS
	 LvvYcoIXt0IU4hzKv1d9NyPTmhpWD/QDCCwgwPLgpsmVXFfS+0F33K3yu/E35UBGFu7N0
	 AoakYTDTmCPq7UvBAbWq9yxO4gwKiJ2hYPbD6xhaxIbmbEfFUoDudRtODyJ01aymGCg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795838002;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RYaNgkhw0Zy/T1OcXP1WkkwTWFw60iMf37eUeE1Oo9U=;
	b=uQHEUwpsQhWxxUikajZ2b5zoMqgMXhHofelTX+7temcwCdmfDefBo+1LaEKDv7KkJ41D
	 XNoU7UCqvseBPMvM6zWCLPWv7ugylLAEf5mmkOcSMwdKRXqQyvVw5Jhgd78/BnJORaMLd
	 X4/gXL8n9iz3lrwwerM1Tvb9DBUTvbMk1T1Rg8Dp2WVi/B13qZTsz5coxO2YjuWI+2uJu
	 /NyU6sDnLN+6bVIpRdbguD60+ctJX7rd5uXB2p2RE6UFcL0m3PR8drp+NmxYuvovr9Tis
	 KGHzoz3EXO1UJk7udgGHQYSuo26wyZsVmelq5NBaV+Dc2JmSA6x/0BrZNbZ2W6smO+w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BEA791F00893;
	Sat, 28 Nov 2026 03:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795838002;
	bh=RYaNgkhw0Zy/T1OcXP1WkkwTWFw60iMf37eUeE1Oo9U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mNmD+ubVxphgdRdjGK6kd9ImMRItb4cEo4AXa2u58XJdpwgHGJ1Vjq6cfqsU5B2Ul
	 IC0KPZA1tThg7ndWSR5NTM71N6ETedW0nPWE8cXeNKXl/pKLYd+zjzj3s4I5vr/myM
	 tjEYgUejRkhpkQlC7bgD+tOkbCJwwBAmlAnxVhOaGrRW5LeqN5nay8n/dxbYNmp/DG
	 dzPJsEwDWQvEt/EDma712uwVRjwzaTKhd6MAah93qaKmrpuSKr3EVRz4USs3r6N8ca
	 JIfzNzIHtC1C24MGhHAtnJqUIfNUnoess7Q+sSxux6tFvz/E9Xf24N1XoyN++mjFtF
	 ga058uM2keYCA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 468824DF6E;
	Sat, 28 Nov 2026 03:53:10 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 06:53:09 +0300
Subject: [PATCH v2 1/3] ARM: dts: cortina: Describe CS7542 peripheral
 controllers
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
Message-Id: <20261128-b4-cs7542-peripherals-dts-v2-1-ccab93aac77f@gmail.com>
References: <20261128-b4-cs7542-peripherals-dts-v2-0-ccab93aac77f@gmail.com>
In-Reply-To: <20261128-b4-cs7542-peripherals-dts-v2-0-ccab93aac77f@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795837989; l=12707;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=Ygt65dlC1QAXsB1UcFOsf5900XRiBvpd/B0krlRAM1M=;
 b=ZmcuonlQ3h6TlBo1xooooAscNVC9jNWD9y5GGrQjh4No6POHNO89/eqIxRJxkzfgC4OyCgA9u
 9CRQjZwEASUBJXNSmJ16XEkfxdbtGi/EONwwEjbAaUO/H8K7x8sYnUb
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Describe the shared global clock and pin controllers, peripheral
interrupt controller and GPIO banks, I2C, RTC, TRNG, NAND PIO
controller, MDIO, network engine and three PCIe root ports.

Use the global syscon for clocks and resets, a separate PCIe PHY
provider and the complete exclusive Ethernet DMA/reset domain. Keep the
optional controllers disabled until the board supplies wiring, reserved
memory and endpoint descriptions. Replace the fixed APB assumption with
strap-selected clocks. Migrate the existing UART and watchdog clock
consumers and remove the board APB-rate override in this same patch, so
the board remains buildable after each commit.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../dts/cortina/cs7542-securifi-almondplus.dts     |   4 -
 arch/arm/boot/dts/cortina/cs7542.dtsi              | 321 ++++++++++++++++++++-
 2 files changed, 311 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts b/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts
index e3152fd1d..2da364592 100644
--- a/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts
+++ b/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts
@@ -37,10 +37,6 @@
 	};
 };
 
-&apb_clk {
-	clock-frequency = <150000000>;
-};
-
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/cortina/cs7542.dtsi b/arch/arm/boot/dts/cortina/cs7542.dtsi
index 29b0b7da8..3d827502c 100644
--- a/arch/arm/boot/dts/cortina/cs7542.dtsi
+++ b/arch/arm/boot/dts/cortina/cs7542.dtsi
@@ -3,6 +3,8 @@
  * Device Tree Source for the Cortina Systems CS7542 SoC
  */
 
+#include <dt-bindings/clock/cortina,cs7542-clock.h>
+#include <dt-bindings/reset/cortina,cs7542-reset.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -10,11 +12,10 @@
 	#size-cells = <1>;
 	interrupt-parent = <&gic>;
 
-	/* Rate is selected by the boot strap pins, set by the board */
-	apb_clk: clock-apb {
+	ref24: clock-24mhz {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-output-names = "apb";
+		clock-frequency = <24000000>;
 	};
 
 	cpus {
@@ -26,6 +27,7 @@
 			compatible = "arm,cortex-a9";
 			reg = <0>;
 			next-level-cache = <&l2>;
+			clocks = <&global CS7542_CLK_CPU>;
 		};
 
 		cpu@1 {
@@ -35,6 +37,7 @@
 			enable-method = "cortina,cs7542-smp";
 			cpu-release-addr = <0 0xf00000b8>;
 			next-level-cache = <&l2>;
+			clocks = <&global CS7542_CLK_CPU>;
 		};
 	};
 
@@ -44,11 +47,227 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 
+		pcie0: pcie@80000000 {
+			compatible = "cortina,cs7542-pcie";
+			reg = <0x80000000 0x1000>, <0x80001000 0x1000>, <0xf00a0000 0x100>;
+			reg-names = "dbi", "config", "app";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			linux,pci-domain = <0>;
+			bus-range = <0 0xff>;
+			num-lanes = <1>;
+			ranges = <0x82000000 0 0x80200000 0x80200000 0 0x1fe00000>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi";
+			clocks = <&global CS7542_CLK_PCIE0>;
+			resets = <&global CS7542_RESET_PCIE0>;
+			phys = <&serdes 0>;
+			phy-names = "pcie";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie0_intc 1>,
+					<0 0 0 2 &pcie0_intc 2>,
+					<0 0 0 3 &pcie0_intc 3>,
+					<0 0 0 4 &pcie0_intc 4>;
+			status = "disabled";
+
+			pcie0_port: pcie@0,0 {
+				compatible = "pciclass,0604";
+				reg = <0 0 0 0 0>;
+				device_type = "pci";
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+
+			pcie0_intc: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		pcie1: pcie@a0000000 {
+			compatible = "cortina,cs7542-pcie";
+			reg = <0xa0000000 0x1000>, <0xa0001000 0x1000>, <0xf00a0400 0x100>;
+			reg-names = "dbi", "config", "app";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			linux,pci-domain = <1>;
+			bus-range = <0 0xff>;
+			num-lanes = <1>;
+			ranges = <0x82000000 0 0xa0200000 0xa0200000 0 0x1fe00000>;
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi";
+			clocks = <&global CS7542_CLK_PCIE1>;
+			resets = <&global CS7542_RESET_PCIE1>;
+			phys = <&serdes 1>;
+			phy-names = "pcie";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie1_intc 1>,
+					<0 0 0 2 &pcie1_intc 2>,
+					<0 0 0 3 &pcie1_intc 3>,
+					<0 0 0 4 &pcie1_intc 4>;
+			status = "disabled";
+
+			pcie1_port: pcie@0,0 {
+				compatible = "pciclass,0604";
+				reg = <0 0 0 0 0>;
+				device_type = "pci";
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+
+			pcie1_intc: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		pcie2: pcie@c0000000 {
+			compatible = "cortina,cs7542-pcie";
+			reg = <0xc0000000 0x1000>, <0xc0001000 0x1000>, <0xf00a0800 0x100>;
+			reg-names = "dbi", "config", "app";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			linux,pci-domain = <2>;
+			bus-range = <0 0xff>;
+			num-lanes = <1>;
+			ranges = <0x82000000 0 0xc0200000 0xc0200000 0 0x1fe00000>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi";
+			clocks = <&global CS7542_CLK_PCIE2>;
+			resets = <&global CS7542_RESET_PCIE2>;
+			phys = <&serdes 2>;
+			phy-names = "pcie";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie2_intc 1>,
+					<0 0 0 2 &pcie2_intc 2>,
+					<0 0 0 3 &pcie2_intc 3>,
+					<0 0 0 4 &pcie2_intc 4>;
+			status = "disabled";
+
+			pcie2_port: pcie@0,0 {
+				compatible = "pciclass,0604";
+				reg = <0 0 0 0 0>;
+				device_type = "pci";
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+
+			pcie2_intc: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		global: syscon@f0000000 {
+			compatible = "cortina,cs7542-syscon", "syscon", "simple-mfd";
+			reg = <0xf0000000 0x100>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+
+			pinctrl: pinctrl {
+				compatible = "cortina,cs7542-pinctrl";
+			};
+		};
+
+		ethernet: ethernet@f0010000 {
+			compatible = "cortina,cs7542-ethernet";
+			reg = <0xf0010000 0x500>,
+			      <0xf0090000 0x800>, <0xf0020000 0x4000>,
+			      <0xf0030000 0x400>, <0xf0040000 0x800>,
+			      <0xf0060000 0x100>, <0xf0400000 0x100000>;
+			reg-names = "ni", "dma", "fe", "qm", "tm",
+				    "sch", "xram";
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eth0", "eth1", "eth2";
+			resets = <&global CS7542_RESET_NI>,
+				 <&global CS7542_RESET_FE>,
+				 <&global CS7542_RESET_TM>,
+				 <&global CS7542_RESET_SCH>,
+				 <&global CS7542_RESET_QM>,
+				 <&global CS7542_RESET_DMA>,
+				 <&global CS7542_RESET_NI_XRAM>;
+			reset-names = "ni", "fe", "tm", "sch", "qm", "dma", "xram";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			cortina,global-syscon = <&global>;
+			status = "disabled";
+
+			gmac0: ethernet-port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			gmac1: ethernet-port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			gmac2: ethernet-port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+		};
+
+		nandc: nand-controller@f0050000 {
+			compatible = "cortina,cs7542-nand";
+			reg = <0xf0050000 0x300>, <0xe0000000 0x08000000>;
+			reg-names = "regs", "data";
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&global CS7542_CLK_AXI>;
+			resets = <&global CS7542_RESET_FLASH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		intc: interrupt-controller@f0070004 {
+			compatible = "cortina,cs7542-intc";
+			reg = <0xf0070004 0x8>;
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		mdio0: mdio@f00700a0 {
+			compatible = "cortina,cs7542-mdio";
+			reg = <0xf00700a0 0x14>;
+			clocks = <&global CS7542_CLK_APB>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c: i2c@f00700e8 {
+			compatible = "cortina,cs7542-i2c";
+			reg = <0xf00700e8 0x28>;
+			interrupt-parent = <&intc>;
+			interrupts = <11>;
+			clocks = <&global CS7542_CLK_APB>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		uart0: serial@f0070110 {
 			compatible = "cortina,cs7542-uart";
 			reg = <0xf0070110 0x30>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&apb_clk>;
+			clocks = <&global CS7542_CLK_APB>;
 
 			status = "disabled";
 		};
@@ -57,7 +276,7 @@
 			compatible = "cortina,cs7542-uart";
 			reg = <0xf0070140 0x30>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&apb_clk>;
+			clocks = <&global CS7542_CLK_APB>;
 
 			status = "disabled";
 		};
@@ -66,7 +285,7 @@
 			compatible = "cortina,cs7542-uart";
 			reg = <0xf0070170 0x30>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&apb_clk>;
+			clocks = <&global CS7542_CLK_APB>;
 
 			status = "disabled";
 		};
@@ -75,8 +294,90 @@
 			compatible = "cortina,cs7542-uart";
 			reg = <0xf00701a0 0x30>;
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&apb_clk>;
+			clocks = <&global CS7542_CLK_APB>;
+
+			status = "disabled";
+		};
+
+		gpio0: gpio@f00701d0 {
+			compatible = "cortina,cs7542-gpio";
+			reg = <0xf00701d0 0x20>;
+			interrupt-parent = <&intc>;
+			interrupts = <6>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio1: gpio@f00701f0 {
+			compatible = "cortina,cs7542-gpio";
+			reg = <0xf00701f0 0x20>;
+			interrupt-parent = <&intc>;
+			interrupts = <7>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio2: gpio@f0070210 {
+			compatible = "cortina,cs7542-gpio";
+			reg = <0xf0070210 0x20>;
+			interrupt-parent = <&intc>;
+			interrupts = <8>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio3: gpio@f0070230 {
+			compatible = "cortina,cs7542-gpio";
+			reg = <0xf0070230 0x20>;
+			interrupt-parent = <&intc>;
+			interrupts = <9>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio4: gpio@f0070250 {
+			compatible = "cortina,cs7542-gpio";
+			reg = <0xf0070250 0x20>;
+			interrupt-parent = <&intc>;
+			interrupts = <10>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		serdes: phy@f00a1000 {
+			compatible = "cortina,cs7542-pcie-phy";
+			reg = <0xf00a1000 0x400>, <0xf00a5000 0x400>,
+			      <0xf00a9000 0x400>, <0xf00a0e00 0x180>;
+			reg-names = "phy0", "phy1", "phy2", "status";
+			clocks = <&ref24>;
+			cortina,global-syscon = <&global>;
+			#phy-cells = <1>;
+		};
+
+		trng: rng@f0600000 {
+			compatible = "cortina,cs7542-trng";
+			reg = <0xf0600000 0x20>;
+			cortina,syscon = <&global>;
+			status = "disabled";
+		};
 
+		rtc0: rtc@f4920000 {
+			compatible = "cortina,cs7542-rtc";
+			reg = <0xf4920000 0x50>;
+			interrupt-names = "alarm", "periodic";
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -99,21 +400,21 @@
 			compatible = "arm,cortex-a9-global-timer";
 			reg = <0xf8000200 0x20>;
 			interrupts = <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
-			clocks = <&apb_clk>;
+			clocks = <&global CS7542_CLK_APB>;
 		};
 
 		timer@f8000600 {
 			compatible = "arm,cortex-a9-twd-timer";
 			reg = <0xf8000600 0x20>;
 			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
-			clocks = <&apb_clk>;
+			clocks = <&global CS7542_CLK_APB>;
 		};
 
 		watchdog@f8000620 {
 			compatible = "arm,cortex-a9-twd-wdt";
 			reg = <0xf8000620 0x20>;
 			interrupts = <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
-			clocks = <&apb_clk>;
+			clocks = <&global CS7542_CLK_APB>;
 		};
 
 		gic: interrupt-controller@f8001000 {

-- 
2.53.0


