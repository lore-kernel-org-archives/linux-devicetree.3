Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795838001;
	b=b50n5mWce5Cyv/AHPEuFrmmi2ZZc0L4yLlAQkUhj7QNSixjTrECvdVwO4dHgof3b9NcH
	 kiPFaleagApLlV9z3RpiOXyuFp8rF7HiWpJSMGblggyUJ7kK0pY1oGqlFTvT8j6yt/aGn
	 we75hcngLeAm03mtS5tMswLN8MkHmjkrAbag1Unw2I3JalaQOIxxZ8ayQFX3p7WXna1OQ
	 Ca3l5TNExk1+6uCAePJd/F5Id2HZ5QKioGGTvDINztQ5cizyAHxxvl3C2Kp/UxUDqy5rL
	 XJvn/lqpYUsosZTf1p8xxHsKMMJr27bkKShs8twH/k7dQaBlc9aF1FbDGonB8rsi1FQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795838001;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=A/gTkB/lb+NLhf/QB68wmo/gjOjiWHNG68BZhih5dmQ=;
	b=rc0T9IQK2d5HEi3DZ80duOHpJfcwxw3XK7YtmWrmS4v7YkEEijoA71rSAhUDLsYhhjwU
	 0CrDVSicygpPKn/mWo1ihmPFu9rPr0GlCswnjYrGpGGEQh6GajlwZRG/3YnTb8xVRQT2R
	 LUonTFbITUEEemt5saWdBgdZcvqjrlhJH8eBvVOO+Oz10idizm9dK5RI3xHlfwn9HTNWg
	 gSgIq1c6W1F80fXxD0AbUVP4jwGtMWWBjyhaN8lGWfqh5/TLkE/wjZSKC6j+UyQjqQMTi
	 VIK4YhVKlCNmJkDkTmd1YXosCPN6+tqfOoUdoJaqooyq5LI0dkvbQ1ZJ2X7yGg8k9Kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=msh7Snil;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DB6606A31C;
	Sat, 28 Nov 2026 03:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=msh7Snil
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795838000;
	b=bKOtxAMxbOsCaa266oPv4CY+psbg2Cr+bQNiMQCZdS37qOXom2RKLrCh3cW2U11LIAvM
	 AEdAnT9ghtP7jDb2Pk+jZyzVDATtsuecW47NjYo7ojkJ0rTZ8QE1GGZtqOmjtOhYq8s48
	 d9Nxsy5MvWMr5E+qDOJNyqwWkbGcpA73CpC8Z3H30ijj22gmv0QuCc50p5X5gnAm+jE2d
	 POauum5WJf4YIQkHKhK8M/7vYdJEdHZose0dVTT/GVzLvd5FUq10pgP8W7pVDaNS2NMKf
	 HhAObFi3IVW75aSnNaNNTs5DJ1z7lVih9YGDIM8Md/RAk3BHdRaTOCkgoobDo8EGuBA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795838000;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=A/gTkB/lb+NLhf/QB68wmo/gjOjiWHNG68BZhih5dmQ=;
	b=Fc8I7TODD/4C39s73jbXZaZVYgSci2HxR/4lIU7tpLp59yqdL8P2K0ZoxCon1oIKzB0u
	 Z86NsFC18eIP2jogQqTCMFzGXcPqtQtDU/az4vF44XMylV0pBi2J2EpojZQYviKV5LmSn
	 jbEw2ymdLS7b9rxm4wT5kI40zq0+Nxku1HvDIPndU1qZJOHGcgGDk6oX5md3nmCuws9be
	 kvC39/xORZabkfl2KJnSpZeTbNTzjCO+QYG2qdwKKG4b9f/Q1xw6EG8hO6eyRFu3vHpPE
	 gt2ZOHJ0lp1kSRFRr3/ssY5ZlAHq1xKQFePj/95/LbBiApQ9LPLFNUVD+h6k9nK33aQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E57E01F00898;
	Sat, 28 Nov 2026 03:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795838000;
	bh=A/gTkB/lb+NLhf/QB68wmo/gjOjiWHNG68BZhih5dmQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=msh7SnilDMJWQc1/KD9Jb9PVGrnrQpCOCXfviLGQtvRa3KdfPqzW0KC4CDnH9zowP
	 2ouZvZzsiDrYVZSEeaWHCHehiqVaVu1tZC+VPlBo4I1aubvzEXxCCe2VKFuijVzAAd
	 KwkarCQo0SQ8pf2ZU46PmkZsoY4ASl5772fSit6A/Q4B1S3MPbmV478LcPUk7nKmjN
	 aH8yVeF/aWd0/d7b9c5H3Nth1E9VfFR0a5C27Slwhii4m6TjeWHTSg7+AxKqKAjFCN
	 UGFDLs7KL6lfK6aaSgZpRHmePtWekOrVhDHOOyBCCIH0n1z+fMYEiBms0CrDj/n5H/
	 18u9HuS2ilU5Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6D70B4DF88;
	Sat, 28 Nov 2026 03:53:10 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 06:53:10 +0300
Subject: [PATCH v2 2/3] ARM: dts: cortina: Enable Almond+ board peripherals
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
Message-Id: <20261128-b4-cs7542-peripherals-dts-v2-2-ccab93aac77f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795837989; l=7904;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=mbc+WKUmGFNJLhBYQOvIv7zjllkM2PfcR9uJiM/pomQ=;
 b=5TIG0uLl+qKIDCJIOq+WxOCaDRJnfmPsa/mylqL1ZzyA78H3pKGr6HbOPq04Ft3UioKoTYyb5
 5QJEZbh6lbrCqrNTbtYSjjoogkGE9Yy32+97rRGmY+fMIN/S54zIMWj
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Enable the tested NAND geometry and stock-compatible partition layout,
factory MAC/calibration cells, QCA8337 switch wiring, PCIe radios and
xHCI endpoint, touchscreen and auxiliary UARTs. Select GPIO37 and
UART72-77 mux states and the shared PCIe reset GPIO92.

Connect the network engine to its reserved upper 64 MiB DDR region and
keep a separate ramoops reservation. Preserve the stock bootloader
console compatibility and describe the actual port labels. GPIO92 resets
both Wi-Fi endpoints, so runtime PCIe hotplug is not advertised.

The equivalent OpenWrt device tree has been booted on Almond+ with the
new PIO NAND, MDIO, PCIe and Ethernet drivers, with factory
MAC/calibration reads, Wi-Fi, USB, UDP/ICMP and jumbo/SG traffic.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../dts/cortina/cs7542-securifi-almondplus.dts     | 342 ++++++++++++++++++++-
 1 file changed, 341 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts b/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts
index 2da364592..32bab3f0b 100644
--- a/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts
+++ b/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts
@@ -5,6 +5,10 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
 #include "cs7542.dtsi"
 
 / {
@@ -13,12 +17,26 @@
 
 	aliases {
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
 	};
 
 	chosen {
+		bootargs = "console=ttyCS0,115200";
 		stdout-path = "serial0:115200n8";
 	};
 
+	keys {
+		compatible = "gpio-keys";
+
+		button-reset {
+			label = "reset";
+			gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_RESTART>;
+		};
+	};
+
 	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
@@ -29,14 +47,336 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 
+		ramoops@1bf00000 {
+			compatible = "ramoops";
+			reg = <0x1bf00000 0x100000>;
+			record-size = <0x20000>;
+			console-size = <0x80000>;
+			ecc-size = <16>;
+			no-map;
+		};
+
 		/* Reserved for the packet engine queue manager */
-		qm-buffer@1c000000 {
+		qm_reserved: qm-buffer@1c000000 {
 			reg = <0x1c000000 0x4000000>;
 			no-map;
 		};
 	};
 };
 
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&reset_pins &aux_uarts_pins>;
+
+	reset_pins: reset-pins {
+		function = "gpio";
+		pins = "gpio37";
+	};
+
+	aux_uarts_pins: aux-uarts-pins {
+		function = "uart";
+		pins = "gpio72", "gpio73", "gpio74", "gpio75", "gpio76", "gpio77";
+	};
+};
+
+&i2c {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@48 {
+		compatible = "semtech,sx8650";
+		reg = <0x48>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&rtc0 {
+	status = "okay";
+};
+
+&trng {
+	status = "okay";
+};
+
+&nandc {
+	status = "okay";
+	nand@0 {
+		reg = <0>;
+		nand-ecc-mode = "hw";
+		nand-ecc-step-size = <256>;
+		nand-ecc-strength = <1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@20000 {
+				label = "uboot0";
+				reg = <0x0020000 0x00e0000>;
+				read-only;
+			};
+
+			partition@100000 {
+				label = "uboot-env0";
+				reg = <0x0100000 0x0020000>;
+				read-only;
+
+				nvmem-layout {
+					compatible = "u-boot,env";
+
+					ethaddr: ethaddr {
+						#nvmem-cell-cells = <1>;
+					};
+				};
+			};
+
+			partition@200000 {
+				label = "uboot1";
+				reg = <0x0200000 0x0100000>;
+				read-only;
+			};
+
+			partition@300000 {
+				label = "uboot-env1";
+				reg = <0x0300000 0x0100000>;
+			};
+
+			partition@400000 {
+				label = "sb0";
+				reg = <0x0400000 0x0100000>;
+			};
+
+			partition@500000 {
+				label = "sb1";
+				reg = <0x0500000 0x0100000>;
+			};
+
+			partition@600000 {
+				label = "kernel_standby";
+				reg = <0x0600000 0x0600000>;
+			};
+
+			partition@c00000 {
+				label = "rootfs_standby";
+				reg = <0x0c00000 0x2e00000>;
+			};
+
+			partition@3a00000 {
+				label = "kernel";
+				reg = <0x3a00000 0x0600000>;
+			};
+
+			partition@4000000 {
+				label = "rootfs_stock";
+				reg = <0x4000000 0x2e00000>;
+			};
+
+			partition@6e00000 {
+				label = "stock_data";
+				reg = <0x6e00000 0x1000000>;
+			};
+
+			partition@7e00000 {
+				label = "log";
+				reg = <0x7e00000 0x0100000>;
+			};
+
+			partition@7f00000 {
+				label = "cal";
+				reg = <0x7f00000 0x0100000>;
+				read-only;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					macaddr_ath9k: macaddr@1002 {
+						reg = <0x1002 0x6>;
+					};
+
+					cal_ath9k: cal@1000 {
+						reg = <0x1000 0x440>;
+					};
+
+					cal_ath10k: cal@5000 {
+						reg = <0x5000 0x844>;
+					};
+				};
+			};
+
+			partition@8000000 {
+				label = "man";
+				reg = <0x8000000 0x0100000>;
+				read-only;
+			};
+
+			partition@8100000 {
+				label = "almond_data";
+				reg = <0x8100000 0x0500000>;
+			};
+
+			partition@8600000 {
+				label = "ubi";
+				reg = <0x8600000 0x17a00000>;
+			};
+		};
+	};
+};
+
+&pcie0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_reset_pins>;
+};
+
+&pcie0_port {
+	/* GPIO92 resets both Wi-Fi endpoints; only this port owns it. */
+	reset-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
+
+	wifi@0,0 {
+		compatible = "pci168c,003c";
+		reg = <0 0 0 0 0>;
+		nvmem-cells = <&cal_ath10k>;
+		nvmem-cell-names = "calibration";
+	};
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_port {
+	wifi@0,0 {
+		compatible = "pci168c,0033";
+		reg = <0 0 0 0 0>;
+		nvmem-cells = <&macaddr_ath9k>, <&cal_ath9k>;
+		nvmem-cell-names = "mac-address", "calibration";
+	};
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&mdio0 {
+	status = "okay";
+
+	switch@10 {
+		compatible = "qca,qca8337";
+		reg = <0x10>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				label = "cpu";
+				ethernet = <&gmac1>;
+				phy-mode = "rgmii-id";
+
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				label = "wan";
+				nvmem-cells = <&ethaddr 0>;
+				nvmem-cell-names = "mac-address";
+			};
+
+			port@2 {
+				reg = <2>;
+				label = "lan4";
+			};
+
+			port@3 {
+				reg = <3>;
+				label = "lan3";
+			};
+
+			port@4 {
+				reg = <4>;
+				label = "lan2";
+			};
+
+			port@5 {
+				reg = <5>;
+				label = "lan1";
+			};
+
+			port@6 {
+				reg = <6>;
+				label = "cpu";
+				ethernet = <&gmac0>;
+				phy-mode = "rgmii-id";
+
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
+			};
+		};
+	};
+};
+
+&ethernet {
+	memory-region = <&qm_reserved>;
+	status = "okay";
+};
+
+&gmac0 {
+	status = "okay";
+	/* The QCA8337 CPU port supplies the internal RX and TX delays. */
+	phy-mode = "rgmii-id";
+	nvmem-cells = <&ethaddr 0>;
+	nvmem-cell-names = "mac-address";
+
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+};
+
+&gmac1 {
+	status = "okay";
+	/* The QCA8337 CPU port supplies the internal RX and TX delays. */
+	phy-mode = "rgmii-id";
+	nvmem-cells = <&ethaddr (-1)>;
+	nvmem-cell-names = "mac-address";
+
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+};
+
+&pinctrl {
+	pcie0_reset_pins: pcie0-reset-pins {
+		function = "gpio";
+		pins = "gpio92";
+	};
+};

-- 
2.53.0


