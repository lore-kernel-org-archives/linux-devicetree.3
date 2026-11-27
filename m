Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795813184;
	b=ysoUeS6JVb4cagNDL406iPmB/WFJiCNzsbhzrJSQXLKSngcXSBVSvgQnTaRO/dc8TwMB
	 5IF1IFsk8I3vKF4qKko6/oXFFluqHX9qYtSd9ObP8zWpox6DApSdiVwtbtZ9Ixc7Geisg
	 6X1XJFLeUIZctan9uUxfRLmdVuzKXibe5DnL3cRTTVuieSpIUibs6t8Mnts/osij4tO3o
	 CEw1jfYo951pQ09We6+hBl4/eTKGS+Kr3Y64n6FHAbxBm1svkeDR4+/0sqLPEyDNcb0hF
	 XfxAsuD1xLIK++tUqNg9ccUxRFEo9RwTuGNcgVuGWqe849Xr3meU6KziX9CB3FAQAww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795813184;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ItruHbiA74ID4F3460f8iXRPyMQffRcpND+FAJeOuOc=;
	b=pQwKQVuS4k1Zzwj3uUPDlhTd2SgAQkRUlbjWaYBAFdj6QCAO99PxkWhGvpNzNUOGmPoQ
	 j1RbIC+3u4iyIBlte7A/6bDqUxlqL7ZAwf937xkJesjXpt8AkIxGkv8L1R06nC9n1WEzZ
	 U1CwJSGKDZhfQJGO79rbJwiK+h2i3LSZEnlfYY1HkgxXWySbwP/XBeiNV3v3xSsn39TwD
	 cCYYpAoJ6vLf6ifu7VkwSmjPUpmKDwD30fr+HTqJy20SkB3PRip2wtJCwhrZdaHWksBqJ
	 dxGKmL3Ltl2OS7sv8lGjN1OfC/VzXt8fX9cpDOaFSpWMgYm/OFZaHWU+57J7GS05nbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jUWLN/F4";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DA5606A321;
	Fri, 27 Nov 2026 20:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jUWLN/F4
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795813183;
	b=YgG/5zPw0F1BO7ubNqMapkq2x23v4Cd97SfG5gRLQfFrCaIV4RJbgbl8Xu4Qsz8lprNi
	 VHTzzTjlQ3I99cr5O2RzGvOAdsZ0G5gMKO816P6y+4UElMpdttHKZVpF9F+gK4zwVhfCj
	 tMfM6ROuGrjCr44Lh7jHpAlwH1HuJyyaT92W4bwDdcSukK79s5ru3MY/PhAnvpyHy+L+d
	 LaHb63DVu/SiA8jKY8FKbyKC96kp15aSLXjPp2egyKSIgIdhWnncuU1jBuYOff2KDCQ2G
	 BjDhwB6HWWrsrD5Qv1k84O0ZwrsDYTMw319QSCycubkRy7zrxcUdgd7q0dTBlBbI17Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795813183;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ItruHbiA74ID4F3460f8iXRPyMQffRcpND+FAJeOuOc=;
	b=L3qPMQ9eY3+K2GHtTJj1AFQS9CFbBC02cpPFGh71ONMQ3dFqvEKRsCDYAFU6V4mBaSHS
	 kEJug+yT/3hM3c09Th8YGjMk8+UdGhv23jDgu3c9PMzFPnWoyDAbjRNR4sz/i+lj3H8g8
	 SORJEmCd+4B+J3ynAQU1gHro+3bOo4Q5pRkE8Qc+6y40QJ1v429VrSy/63mOlzNfkXqqb
	 JIx3wxrQlfI/hZCSHc7mw5948RoUBe5wIMLdkDrzIA3dDxABN1bml5jJLRy4oF8r+Mygy
	 CcyO2xJvXoVwYPTMT9NKsvPiwrm3xUMVOsF2p/hheewjLyVVe4IO35Bp12Kmd8fisJQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66A9E1F00899;
	Fri, 27 Nov 2026 20:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795813183;
	bh=ItruHbiA74ID4F3460f8iXRPyMQffRcpND+FAJeOuOc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jUWLN/F4PdCPnUMsGri4oLF5ZkpdI490PZGWzMxp3Ue/YoGgxW0IyQbKxbGQw5xbb
	 4WfebtCYKPt1XdPhPl1zKnt6AF2pr7J678B8cxgNNGIlHQpM8bj7MDIj9chtfljysd
	 mcs2sC65VVwjeyYvnrln5CD5kuMI9FlL6FdCSoWmvTkYRMxMlfODZhB+rZFIgY1ITn
	 IMUKIv9GTpi7dsaoEY+X8XlqmYwurnO9L8pk0e4M6fzNSiuEYZRhwSQHNeewSEZv/M
	 qdk47QSPSWbwU19hn5hSvL2HpibQxPPHT2cEI368zXxwHrqk3EjOOkqztlrSiWtqDZ
	 42XteLjBez3RA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E45094DDFF;
	Fri, 27 Nov 2026 20:59:29 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 23:59:30 +0300
Subject: [PATCH 2/3] ARM: dts: cortina: Enable Almond+ board peripherals
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
Message-Id: <20261127-b4-cs7542-peripherals-dts-v1-2-7ce24b842b3a@gmail.com>
References: <20261127-b4-cs7542-peripherals-dts-v1-0-7ce24b842b3a@gmail.com>
In-Reply-To: <20261127-b4-cs7542-peripherals-dts-v1-0-7ce24b842b3a@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795813168; l=7952;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=Y8k2l9d3K1ZNV+7EeNdj9panZNgi90qabzAGt3bSRUM=;
 b=+0wn17TnKYyjVICowJreU1ia/zJewc3XUNg3aC0Q65dL7GMy9LROQqzW8CpltnmguyGwBq7QJ
 kHaoMpKilNkDe8BF69fszEIdkTDPjO9kOlV3Esq16W7n5OikU9PERnb
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
 1 file changed, 339 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts b/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts
index e3152fd1d..32bab3f0b 100644
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
@@ -29,18 +47,336 @@
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
 
-&apb_clk {
-	clock-frequency = <150000000>;
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
 };
 
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


