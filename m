Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DE128000F
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 23:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776641066; cv=none; b=aGap7gKIKEGEsYi26GzVFHDs9aBl7CsXnjw36fVMxs8z0gvy8c82RGPaE2c+oVHsORDoysd3htdUkioMboKQz8zByjadnXwc3GodHNP3dmm5g2ub6gxDphJgSNZPIK8CYY/ShyKVrjxdEcyUiDXdbFkCCCHr0ddHr7HcjWSnPWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776641066; c=relaxed/simple;
	bh=qdp4S1ycSoghdrsZA7/NsSAACV+sbKq1KZFe/S2hrcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zh3WQvFCblK1F2vqwQ6ZmdOKBf4sEcuQHFRbfnciL0HyXSVsVIEC8P30fFUI09Y9yhz+/0/7mR8LShfIF5CO5tVySe0xgYooC6CdqAGssDVnzS1WaIS893Eps40Hy7WJAknDvPLMGRvFwwIvEM8IUYHV8xiPGG9RWCqb5ftwsv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1VrgB6d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1VrgB6d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6DDC2BCB6;
	Sun, 19 Apr 2026 23:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776641065;
	bh=qdp4S1ycSoghdrsZA7/NsSAACV+sbKq1KZFe/S2hrcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U1VrgB6dH98NpavcTq5gGA7pA/e5gjkarTUeFaXYbYdkv1qWy9veuLwQ0zr9lvjKg
	 yfsvV0RMHeTqwO0L8r76hvbjR9yToPWQc49jTUMtOsC3scrCdxmDxUx7h82zJA9PFh
	 k9WTCZlKBtJJhPE10WE4UkCSC9b+QEFFPB6VpVVRrAnSfBvZ0VtEBiZrR4cN6ZjIn5
	 98lyRUmY7d1Can9DWR9bHFIKZ5KWQvSEbXtG7dow/SKEm6R3JTAlcjBsI5EZjs8ZkL
	 jK2d/z0X+yhmeFHVULEjAOkZaZ88hrQ+EUxp86sUqSH2B/qLINfilsO+yv9nGqPzyq
	 HwhKpwogTjV0g==
From: Dinh Nguyen <dinguyen@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCHv2 2/2] arm64: dts: socfpga: agilex7m: Add SoCFPGA Agilex7-M devkit
Date: Sun, 19 Apr 2026 18:24:16 -0500
Message-ID: <20260419232416.68331-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20260419232416.68331-1-dinguyen@kernel.org>
References: <20260419232416.68331-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Agilex7-M devkit contains an Agilex7M SoC, which is a newly branded
version of the original Agilex SoC. The Agilex7M core peripherals are
identical to the Agilex SoC.

We can re-use the socfpga_agilex.dtsi for this devkit. The Agilex7-M
devkit supports PCIE 5.0(x16), DDR4, DDR5, LPDDR5 and does not have QSPI.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2: use the updated "altr,socfpga-agilex7m" and
    "altr,socfpga-agilex7m-socdk"
---
 arch/arm64/boot/dts/intel/Makefile            |   1 +
 .../boot/dts/intel/socfpga_agilex7m_socdk.dts | 104 ++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dts

diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index 33fcc55d0cb9..088a03b89c99 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -8,5 +8,6 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex5_socdk_013b.dtb \
 				socfpga_agilex5_socdk_modular.dtb \
 				socfpga_agilex5_socdk_nand.dtb \
+				socfpga_agilex7m_socdk.dtb \
 				socfpga_n5x_socdk.dtb
 dtb-$(CONFIG_ARCH_KEEMBAY) += keembay-evm.dtb
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dts
new file mode 100644
index 000000000000..952987cf3fd4
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dts
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2026 Altera Corporation
+
+#include "socfpga_agilex.dtsi"
+
+/ {
+	model = "Altera SoCFPGA Agilex7-M SoCDK";
+	compatible = "altr,socfpga-agilex7m-socdk",
+		     "altr,socfpga-agilex7m";
+
+	aliases {
+		serial0 = &uart0;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		ethernet2 = &gmac2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led0 {
+			label = "hps_led0";
+			gpios = <&portb 20 GPIO_ACTIVE_HIGH>;
+		};
+
+		led1 {
+			label = "hps_led1";
+			gpios = <&portb 19 GPIO_ACTIVE_HIGH>;
+		};
+
+		led2 {
+			label = "hps_led2";
+			gpios = <&portb 21 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0 0x80000000 0 0>;
+	};
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gmac0 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy0>;
+
+	max-frame-size = <9000>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy0: ethernet-phy@4 {
+			reg = <4>;
+
+			txd0-skew-ps = <0>; /* -420ps */
+			txd1-skew-ps = <0>; /* -420ps */
+			txd2-skew-ps = <0>; /* -420ps */
+			txd3-skew-ps = <0>; /* -420ps */
+			rxd0-skew-ps = <420>; /* 0ps */
+			rxd1-skew-ps = <420>; /* 0ps */
+			rxd2-skew-ps = <420>; /* 0ps */
+			rxd3-skew-ps = <420>; /* 0ps */
+			txen-skew-ps = <0>; /* -420ps */
+			txc-skew-ps = <900>; /* 0ps */
+			rxdv-skew-ps = <420>; /* 0ps */
+			rxc-skew-ps = <1680>; /* 780ps */
+		};
+	};
+};
+
+&mmc {
+	status = "okay";
+	cap-sd-highspeed;
+	broken-cd;
+	bus-width = <4>;
+	clk-phase-sd-hs = <0>, <135>;
+};
+
+&osc1 {
+	clock-frequency = <25000000>;
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+	disable-over-current;
+};
+
+&watchdog0 {
+	status = "okay";
+};
-- 
2.42.0.411.g813d9a9188

