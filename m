Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3FC3BCD37
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067932; cv=none; b=iP0VG1LYQj5OATs0ZmXY00KcVMoMSgzGn97EVwAwkDKeeBA6TAz5sWHvwXhFrY1k5iItYtgSHvRF1tpz1RZrTm6jotg0Cig+4CXRakl8g6U6pP/FcRpQsIp0zCbkIZa3WCQkG1VfH9txK5EgFKTMoP6bAri30kpFAy4IXNjejn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067932; c=relaxed/simple;
	bh=R2c8uMXAUEptjYc3/IyhdhrkIh7o4ZpSIdOcvsvHYr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m4UpxWhuSDE/0AkKqF7Rcf0JfVxmPP5+rbddqbP6KBThkQeQil7w92l/kYaRpA3d0d88fNszxvnLpCGVHGseoXRuBDWnbmqhXp0TqHAIaThrWdZ9tP0j4pNKsWX7vqd+zr9wngPgvvmzb0PxYANw7lcl2gylusE7zWtFDByPMx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTah6e8+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTah6e8+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845051F000C7;
	Thu, 15 Oct 2026 12:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792067931;
	bh=MbJvQNoMk0M26ZBdseS2QniM8fkIrDzbqeeY6sFe2X4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gTah6e8+FzUBaxCmFMoYG4zWBhgVicBJDtfDjH8DTjmFlpLovRxMcTTU3VamEfIxy
	 lzxLL0PydBpADiVmapduP/c6BITOBQr7QvmSGx6V2VmSyOj0gz0TGGUE19/PZqQL5p
	 DJWFXKB2RkNsNqu3nC0B7Ce8d8VOGd0swbrNFCXliFTmt3qUJfUyswQ4R/xvGhv1qA
	 i5P+8wjUP/XxYcGpxWRcjHGPSGZGdHNzg5m4i+/LIajXvvF6EE9iQZgvs4nKiYEqYG
	 Q8AOaGnsoulhpEyG/EH0TwVCHOg9omo0nx0G4t4vENpQAQgl+JBPa3y+oaNy2797K6
	 7n3M9v6CSCYPA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCHv2 2/2] arm64: dts: altera: Add support for the Agilex27 platform
Date: Thu, 15 Oct 2026 07:37:00 -0500
Message-ID: <20261015123700.2137706-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20261015123700.2137706-1-dinguyen@kernel.org>
References: <20261015123700.2137706-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Agilex72 platform is being rebranded to Agilex27. The Agilex27 is
exactly the same as the Agilex72. Add the base DTSI and the devkit's
DTS.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2: leave the agilex72 files
---
 arch/arm64/boot/dts/altera/Makefile           |   1 +
 .../boot/dts/altera/socfpga_agilex27.dtsi     | 156 ++++++++++++++++++
 .../dts/altera/socfpga_agilex27_socdk.dts     |  27 +++
 3 files changed, 184 insertions(+)
 create mode 100644 arch/arm64/boot/dts/altera/socfpga_agilex27.dtsi
 create mode 100644 arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts

diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/altera/Makefile
index 8f41349103b80..14e260fb16f3b 100644
--- a/arch/arm64/boot/dts/altera/Makefile
+++ b/arch/arm64/boot/dts/altera/Makefile
@@ -3,6 +3,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex_socdk.dtb \
 				socfpga_agilex_socdk_emmc.dtb \
 				socfpga_agilex_socdk_nand.dtb \
+				socfpga_agilex27_socdk.dtb \
 				socfpga_agilex3_socdk.dtb \
 				socfpga_agilex5_socdk.dtb \
 				socfpga_agilex5_socdk_013b.dtb \
diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex27.dtsi b/arch/arm64/boot/dts/altera/socfpga_agilex27.dtsi
new file mode 100644
index 0000000000000..369981fe85e38
--- /dev/null
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex27.dtsi
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+/dts-v1/;
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "altr,socfpga-agilex27";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		atf_reserved: atf@80000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x80000000 0x0 0x100000>;
+			alignment = <0x1000>;
+			no-map;
+		};
+
+		service_reserved: svcbuffer@80100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x80100000 0x0 0xf00000>;
+			alignment = <0x1000>;
+			no-map;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a520";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x0>;
+		};
+
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a520";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x100>;
+		};
+
+		cpu2: cpu@200 {
+			compatible = "arm,cortex-a720";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x200>;
+		};
+
+		cpu3: cpu@300 {
+			compatible = "arm,cortex-a720";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x300>;
+		};
+	};
+
+	clocks {
+		uart_clk: uart-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <125000000>;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	intc: interrupt-controller@7000000 {
+		compatible = "arm,gic-v3";
+		reg = <0x0 0x7000000 0x0 0x10000>,
+		      <0x0 0x7080000 0x0 0x100000>;
+		ranges;
+		#interrupt-cells = <3>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-controller;
+		#redistributor-regions = <1>;
+		redistributor-stride = <0x0 0x40000>;
+
+		its: msi-controller@7040000 {
+			compatible = "arm,gic-v3-its";
+			reg = <0x0 0x7040000 0x0 0x20000>;
+			msi-controller;
+			#msi-cells = <1>;
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xffffffff>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		device_type = "soc";
+		interrupt-parent = <&intc>;
+
+		smmu: iommu@c100000 {
+			compatible = "arm,smmu-v3";
+			reg = <0x0c100000 0x30000>;
+			interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 129 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 132 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eventq", "gerror", "priq";
+			dma-coherent;
+			#iommu-cells = <1>;
+		};
+
+		ocram: sram@0 {
+			compatible = "mmio-sram";
+			reg = <0x00000000 0x80000>;
+			ranges = <0 0 0x80000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
+		uart0: serial@9038000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x9038000 0x100>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
+
+		uart1: serial@9039000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x9039000 0x100>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
new file mode 100644
index 0000000000000..15d331cdeeb47
--- /dev/null
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+#include "socfpga_agilex27.dtsi"
+
+/ {
+	model = "Altera SoCFPGA Agilex27 SoCDK";
+	compatible = "altr,socfpga-agilex27-socdk", "altr,socfpga-agilex27";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.42.0.411.g813d9a9188

