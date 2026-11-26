Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795686471;
	b=ws38NSGeU3rclPE8mhffm2ZzzUwzJoe2wEtMBfg3boJj9Q1U4n3M8rQY1n1CfSIQkcZy
	 HfGGgJmgF/J+Yt4x7ZKwPrlaVtrHl/jIPrpLjMcVpcU7cDpfqdkDNY2ayWemY7RXFLqym
	 /pLzxXE+hRhHkuHo81Tb8IkrdDipvIufyyQQeYGzZuV9YNxqym/HZWbJN6udy4V5W0k3T
	 f6IXKsMZIUBgHl3LTPMPi0WwYG7/PNYx0x7F9ZnXyCZ470p2k4DsPBRChAl+GwtmSfXM/
	 R3rjiG3QiWDn6jcDIQZFkaT1ke3mWbe7SJRrk0GFbbPwK3cFvOdlqJoHnoT8poR65QQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686471;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=eq1p+Ex/8mIBHU8Qt5C30QIxZgDwKvzJ+MobtiE/1K8=;
	b=4vTyYhij9UXDSwQwWUbta0jU4K7PRnsWk1C/Lka5PPf1dSlLc/kIOFLPhOBkqfLXP5eZ
	 kkcswDFPqWouhCBDRs99INna/a6FJyguoXwCk3Pw229VbDFfNTcqlSmTpVCUk7HwtuQ2x
	 zbtV02yxEXOqliF4hhEIkA3G6fPGt56BO1ib+Y9Dln3Ef8OSmTl57iVC3XeMvUgqYMG6N
	 6MljtKtZjHa8ZQ43RdJP7xinhxOq4E4Xwk5MWq/oliuylAjMu5c3CXzxaQK/GHTketRkt
	 br20bxTBeQuSON10vbMJB3TFqL+LpqQoiCBCioMHuTxdCZgzYtJR8KxCGoNEfwUZUrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AuEEmUUT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010C6606A31C;
	Thu, 26 Nov 2026 09:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AuEEmUUT
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795686470;
	b=f9OLc+EbCkw/JvwlQvrTHNsOPa45x/N6WHD4KcJCFJ1dlO1BIt3FEl2q1R+zFXBLZDJS
	 JMAEk5DdS40Z2vKRUGHkKPedwot30VTMRS9iV1iF6x2PcDrxEgp616nIt4NihOohx7iUv
	 asew/brHNnECI5aQJ3eU/jo4I0FAc7V2JtcNMrwucMtRvKNNM72iN6gnsmh/Hn/fjSzkO
	 SjdcsMNt06EDIBUr/aATQe2k0fk7QTmATwGNAnTyHHsJSlei5o3z44PhoIgqWIj/Syw5u
	 6MY0DdJcmSoJ93LHo//3GBsLoX7LONzaEV7+a/OUMG1oKlzuGolfsNe2FjsQtCDjMsw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795686470;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=eq1p+Ex/8mIBHU8Qt5C30QIxZgDwKvzJ+MobtiE/1K8=;
	b=jnjGluZbFbUoa49RiczPzyke5LW/7/1uQxBDj50Jlk0ZkfFLVFUohhG/7X/9VzvYKZKw
	 cLkV1UZFnhcYxt3btBQ86vhU1IU8gjsjhKPGnibbTD4dNnpxBwXuhetp0d0QYcTMjnRMS
	 GuKrzYtWl/ad8wR0TD1IekJG7+pKA7XSp8ACh/tMkF7STRGPEDYdl5RyJH0M8KPQHuFGk
	 70JpklCyMW7j3gGltCt8TJhFa4HsJABKf57o0L2HFK11hE/KxZFv3lC6P/wboFRts0uMh
	 Qu2y5GoUp3nYKnJ49YJPWnC3gMokrnxssvLpRCUlVjKZeWuX/VZDNb8HMjWLX/NXKLA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E99581F0156B;
	Thu, 26 Nov 2026 09:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795686470;
	bh=eq1p+Ex/8mIBHU8Qt5C30QIxZgDwKvzJ+MobtiE/1K8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AuEEmUUTj6UBrMuRDptqMy+CBkt43yvvBu1OMI7ot13L8vfVMohHk+/h14nYrnydh
	 /uuPQdzvuNQqyRPH2jhJEQ+2cR/8ggwlUoEsisqiRO/m6Iv349rc8qRWUO8GX9LJZT
	 tJE8NOiLEAomaDMACe0mc/R7Ed2XzQ+3ldPddjQaS1JXwBqa2rBiSWFYWT8rTyzwS9
	 d7yOlKFBSrlS7ffM53O4OmDCqXLl5R7Mcg58Jk6am6lxari3rmmMIxkRvAMNFxiRpL
	 VjZHT9xC9S3NUDjfm0UMFJSrwpLdmzhnM82qRn4neE7ggz4yHQmN1RcipaYsEhAhrT
	 XEe4QgsA3mQ/g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 776DB4D3BE;
	Thu, 26 Nov 2026 09:47:37 +0000 (UTC)
From: =?utf-8?q?Alexandra_=C3=98stermark_via_B4_Relay?= <devnull+alex.cramt.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 10:47:37 +0100
Subject: [PATCH v2 3/3] arm64: dts: socfpga: agilex5: add support for
 Terasic DE25-Nano
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
Message-Id: <20261126-de25-nano-v2-3-02e43ba72681@gmail.com>
References: <20261126-de25-nano-v2-0-02e43ba72681@gmail.com>
In-Reply-To: <20261126-de25-nano-v2-0-02e43ba72681@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Mahesh Rao <mahesh.rao@altera.com>, 
 Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>, 
 James Clark <jjc@jclark.com>, 
 =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795686456; l=3350;
 i=alex.cramt@gmail.com; s=20261118; h=from:subject:message-id;
 bh=V3m+t24prnHtAV40uETUSwMPIzzcnltdfZUuhWnXUvU=;
 b=0091DnP1cT+Ozo3KkmjOpUkM79VI8nlQNYDhMoZRh5Vx87yNIH6UDuImeRYszSHV2M6RQ9msN
 EqYg0aaRwPZDelg67jfCnsBdGajePK5ZcMulkTh69GedmwT8qSWbp8Z
X-Developer-Key: i=alex.cramt@gmail.com; a=ed25519;
 pk=vQBaXUvFG7cCIaWDKclPMjo3b4XfPEVkuPjaWCkYddc=
X-Endpoint-Received: by B4 Relay for alex.cramt@gmail.com/20261118 with
 auth_id=1561
X-Original-From: =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
Reply-To: alex.cramt@gmail.com
Content-Transfer-Encoding: 8bit

From: Alexandra Østermark <alex.cramt@gmail.com>

The DE25-Nano is an Agilex 5 SoC FPGA board with gigabit Ethernet, a
microSD slot wired for 3.3 V only, USB and one HPS LED.

Based on Terasic's and Altera's vendor device trees for the board, which
describe the SD slot on an SDHCI node that upstream doesn't have; this
uses the upstream SD6HC sdmmc node instead.

The HPS LED is active high: the vendor trees mark it active low, which
inverts it.

I2C1 is on the HPS's own pins and reaches the onboard LIS2DW12
accelerometer at 0x19, so unlike the other I2C controllers it doesn't
depend on the FPGA design.

Boot from microSD, gigabit Ethernet, USB, the LED, I2C1 and the watchdog
were tested on the board. The QSPI flash, the other I2C buses and the
SDM hardware monitor are left out until they have been tested.

Signed-off-by: Alexandra Østermark <alex.cramt@gmail.com>
---
 arch/arm64/boot/dts/altera/Makefile                |  1 +
 .../boot/dts/altera/socfpga_agilex5_de25_nano.dts  | 95 ++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/altera/Makefile
index d38fe88a1..29170f793 100644
--- a/arch/arm64/boot/dts/altera/Makefile
+++ b/arch/arm64/boot/dts/altera/Makefile
@@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex_socdk_multiqspi.dtb \
 				socfpga_agilex_socdk_nand.dtb \
 				socfpga_agilex3_socdk.dtb \
+				socfpga_agilex5_de25_nano.dtb \
 				socfpga_agilex5_socdk.dtb \
 				socfpga_agilex5_socdk_013b.dtb \
 				socfpga_agilex5_socdk_modular.dtb \
diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex5_de25_nano.dts b/arch/arm64/boot/dts/altera/socfpga_agilex5_de25_nano.dts
new file mode 100644
index 000000000..128095578
--- /dev/null
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex5_de25_nano.dts
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023, Intel Corporation
+ * Copyright (C) 2026, Alexandra Østermark
+ */
+#include "socfpga_agilex5.dtsi"
+
+/ {
+	model = "Terasic DE25-Nano";
+	compatible = "terasic,de25-nano", "intel,socfpga-agilex5";
+
+	aliases {
+		serial0 = &uart1;
+		ethernet0 = &gmac0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			label = "hps_led0";
+			gpios = <&portb 17 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+};
+
+&gmac0 {
+	/* TX/RX delays are on the PCB */
+	phy-mode = "rgmii";
+	phy-handle = <&emac0_phy0>;
+	max-frame-size = <9000>;
+
+	status = "okay";
+
+	mdio0 {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		emac0_phy0: ethernet-phy@1 {
+			reg = <1>;
+		};
+	};
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&osc1 {
+	clock-frequency = <25000000>;
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	disable-wp;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
+&smmu {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&usb0 {
+	disable-over-current;
+
+	status = "okay";
+};
+
+&watchdog0 {
+	status = "okay";
+};

-- 
2.56.0


