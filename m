Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088902F8EB0
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 17:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778348355; cv=none; b=bZjsyw+PbH88jcz1ar45RnLm5H/yeHAWWhjSAoIFN7OG+S5TBd347bSKcjBf7fk+ryunTMI+cKOIZLSyYjjJVOEmkvCUs5bB4bAQYXQxBFehvxquL6VDlDGmq3qneh0jz5p8/sIreU3miVF88ykcut+wBGcA//EjRpICY6DmVY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778348355; c=relaxed/simple;
	bh=B2oU7PLzSaweyy8Gvefj9J3MzwHYXBUqiiuC6kPXgQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EhFyyfk/QRsi+4K5Y66Y2Md0/XKfieosu+yw9KJar4abaf1l8Z9kAr5bhKswZJUVii0AsTUJ1o6Z7vhDBNyKvh5wZhxgjX4IxpFtFBoaNQ3YuAEVGuZ1g+pifJwUfs8vlhUdowUC1rYUtZvVBeXvbZrm289ZmOe3MY6AHbkZRsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ll5TZsyp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ll5TZsyp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A1FC2BCF4;
	Sat,  9 May 2026 17:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778348354;
	bh=B2oU7PLzSaweyy8Gvefj9J3MzwHYXBUqiiuC6kPXgQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ll5TZsyp7rjU2SU/czMVKufkGnuMkJd5LJZ9l8RHlcmk1a3j0xDpTc10vq8BNFepA
	 +tmxuBCBg3kIG/jFzo6tGfFjNsQM6v28a+BcMj3LY/j+pRYi5iean9XHU96jbhcVdx
	 4ILCL0Q7hmAN0VlsR/lnYXqH/THRSnVK+EZYcvOAVb46o3PQqcsIcctUOb0YeMJcQE
	 wV7jCzbeqbfcvF7Xa93Q5jdpdF75nz4bPQvFPqEg6bpygR/bnbYn5qIRweVsh2PUf5
	 GJ5BX9lNnn/e8+tlV4dmhCHLCya0WgSmlDs7A7aDKv2wgm8at5NudXWx+GMIiUsSEV
	 pZYcRz389snmA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 09 May 2026 19:38:47 +0200
Subject: [PATCH 2/2] arm64: dts: Add Airoha AN7583 SoC and AN7583
 Evaluation Board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-airoha-7583-v1-2-e5ad085b258e@kernel.org>
References: <20260509-airoha-7583-v1-0-e5ad085b258e@kernel.org>
In-Reply-To: <20260509-airoha-7583-v1-0-e5ad085b258e@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3

Introduce the Airoha AN7583 SoC's dtsi and the Airoha AN7583 Evaluation
Board's dts file.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/airoha/Makefile       |   2 +-
 arch/arm64/boot/dts/airoha/an7583-evb.dts |  23 +++++
 arch/arm64/boot/dts/airoha/an7583.dtsi    | 137 ++++++++++++++++++++++++++++++
 3 files changed, 161 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/airoha/Makefile b/arch/arm64/boot/dts/airoha/Makefile
index ebea112ce1d7..6027978a35c2 100644
--- a/arch/arm64/boot/dts/airoha/Makefile
+++ b/arch/arm64/boot/dts/airoha/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-dtb-$(CONFIG_ARCH_AIROHA) += en7581-evb.dtb
+dtb-$(CONFIG_ARCH_AIROHA) += en7581-evb.dtb an7583-evb.dtb
diff --git a/arch/arm64/boot/dts/airoha/an7583-evb.dts b/arch/arm64/boot/dts/airoha/an7583-evb.dts
new file mode 100644
index 000000000000..76b3d94434f6
--- /dev/null
+++ b/arch/arm64/boot/dts/airoha/an7583-evb.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/dts-v1/;
+
+#include "an7583.dtsi"
+
+/ {
+	model = "Airoha AN7583 Evaluation Board";
+	compatible = "airoha,an7583-evb", "airoha,an7583";
+
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,115200 earlycon";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x2 0x00000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/airoha/an7583.dtsi b/arch/arm64/boot/dts/airoha/an7583.dtsi
new file mode 100644
index 000000000000..64b2c7533aff
--- /dev/null
+++ b/arch/arm64/boot/dts/airoha/an7583.dtsi
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		atf@80000000 {
+			no-map;
+			reg = <0x0 0x80000000 0x0 0x200000>;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0>;
+			enable-method = "psci";
+			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x1>;
+			enable-method = "psci";
+			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+			cache-size = <0x80000>;
+			cache-line-size = <64>;
+			cache-level = <2>;
+			cache-unified;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	clk25m: clock-25000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+		clock-output-names = "clkxtal";
+	};
+
+	i2c_clock: clock-20000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <20000000>;
+		clock-output-names = "i2c_clock";
+	};
+
+	sys_hclk: clock-100000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "sys_hclk";
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gic: interrupt-controller@9000000 {
+			compatible = "arm,gic-v3";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x0 0x09000000 0x0 0x20000>,
+			      <0x0 0x09080000 0x0 0x80000>,
+			      <0x0 0x09400000 0x0 0x2000>,
+			      <0x0 0x09500000 0x0 0x2000>,
+			      <0x0 0x09600000 0x0 0x20000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+		};
+
+		uart1: serial@1fbf0000 {
+			compatible = "ns16550";
+			reg = <0x0 0x1fbf0000 0x0 0x30>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <1843200>;
+		};
+
+		watchdog@1fbf0100 {
+			compatible = "airoha,en7581-wdt";
+			reg = <0x0 0x1fbf0100 0x0 0x38>;
+
+			clocks = <&sys_hclk>;
+			clock-names = "bus";
+		};
+	};
+};

-- 
2.54.0

