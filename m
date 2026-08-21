Received: from spam.axera-tech.com (unknown [114.118.28.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A4C47A86A;
	Fri, 21 Aug 2026 09:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.118.28.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306095; cv=none; b=DGA0hoyC1gOt3OaAJ1TyXt0v/f1lx9B06/DjIf9HLJF1fM6yX1qZLBnsProFnm66ihU0tpB4PTAK05yjCUI0YRjCR2tsGhpzpSk89ce+oLobc4cEAoODhpLYHw/XcHQvCWqFFH6wWppbzE95ATO5a59MrLGE5p7rV9+sPU2+rD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306095; c=relaxed/simple;
	bh=3X3wyaDmXz7D29E5a4YcUgpvoAFMmWNICN87b2MBl5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZmfMG63WQZXMv9e6rKDuK1cOnbM5UQBKxnIFuv14FhlrYmJVv5ql+zJfUIApbOclF8NjDKt6VKQAFFcWaG+oFCO62pU+dH8MpQY9K67uLfatTcieQd5cR/+fLPGzVm+vJSIUxFfWAMNPxGm1KiV9RcxDmkq5xm7PNHK+MSr+wbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com; spf=pass smtp.mailfrom=axera-tech.com; arc=none smtp.client-ip=114.118.28.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axera-tech.com
Received: from spam.axera-tech.com (localhost [127.0.0.2] (may be forged))
	by spam.axera-tech.com with ESMTP id 67L9W0aq010059;
	Fri, 21 Aug 2026 17:32:00 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from aixinexchange02.aixin-chip.com ([10.122.86.161])
	by spam.axera-tech.com with ESMTPS id 67L9USlF009398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Aug 2026 17:30:34 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from [127.0.1.1] (10.126.103.103) by aixinexchange02.aixin-chip.com
 (10.122.86.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 21 Aug
 2026 17:30:31 +0800
From: Leng Honglin <lenghonglin@axera-tech.com>
Date: Fri, 21 Aug 2026 17:30:05 +0800
Subject: [PATCH 5/6] arm64: dts: axera: add AX650 Demo initial support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ax650-v1-v1-5-e1b013938e6b@axera-tech.com>
References: <20260821-ax650-v1-v1-0-e1b013938e6b@axera-tech.com>
In-Reply-To: <20260821-ax650-v1-v1-0-e1b013938e6b@axera-tech.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shi Zhicheng
	<shizhicheng@axera-tech.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will
 Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus
 Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>,
        Leng Honglin
	<lenghonglin@axera-tech.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787304625; l=5267;
 i=lenghonglin@axera-tech.com; s=20260818; h=from:subject:message-id;
 bh=3X3wyaDmXz7D29E5a4YcUgpvoAFMmWNICN87b2MBl5s=;
 b=A+yOz1mzO41sVuKiZTa2jE7J5fAut/n6hrrXf1ySrHXQN0hbYy5z1gQPEIGfoDRDKYut1egrh
 H2hf2YunhUxADzQZ1JfZIgWAKSmnOpHwJpRpB92tD1zaO8h4LLpQIJA
X-Developer-Key: i=lenghonglin@axera-tech.com; a=ed25519;
 pk=fo0agzxyiwbJZc3VZRLVthobvWCvq0qAViAw4TxhF80=
X-ClientProxiedBy: aixinexchange02.aixin-chip.com (10.122.86.161) To
 aixinexchange02.aixin-chip.com (10.122.86.161)
X-DKIM-Results: [10.122.86.161]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:spam.axera-tech.com 67L9W0aq010059

Add initial device tree support for the Axera AX650 SoC and Demo board.

Reviewed-by: Shi Zhicheng <shizhicheng@axera-tech.com>
Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
---
 arch/arm64/boot/dts/Makefile             |   1 +
 arch/arm64/boot/dts/axera/Makefile       |   3 +
 arch/arm64/boot/dts/axera/ax650-demo.dts |  30 +++++++
 arch/arm64/boot/dts/axera/ax650.dtsi     | 134 +++++++++++++++++++++++++++++++
 4 files changed, 168 insertions(+)

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index fc726b215f12..93740acb553d 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -10,6 +10,7 @@ subdir-y += apm
 subdir-y += apple
 subdir-y += arm
 subdir-y += aspeed
+subdir-y += axera
 subdir-y += axiado
 subdir-y += bitmain
 subdir-y += blaize
diff --git a/arch/arm64/boot/dts/axera/Makefile b/arch/arm64/boot/dts/axera/Makefile
new file mode 100644
index 000000000000..76f436a9466a
--- /dev/null
+++ b/arch/arm64/boot/dts/axera/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+dtb-$(CONFIG_ARCH_AXERA) += ax650-demo.dtb
diff --git a/arch/arm64/boot/dts/axera/ax650-demo.dts b/arch/arm64/boot/dts/axera/ax650-demo.dts
new file mode 100644
index 000000000000..aef8f0516232
--- /dev/null
+++ b/arch/arm64/boot/dts/axera/ax650-demo.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Axera Semiconductor Co., Ltd.
+ */
+
+/dts-v1/;
+
+#include "ax650.dtsi"
+
+/ {
+	model = "Axera AX650 Demo";
+	compatible = "axera,ax650-demo", "axera,ax650";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	memory@100000000 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x2 0x00000000>;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/axera/ax650.dtsi b/arch/arm64/boot/dts/axera/ax650.dtsi
new file mode 100644
index 000000000000..4fceaee81496
--- /dev/null
+++ b/arch/arm64/boot/dts/axera/ax650.dtsi
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Axera Semiconductor Co., Ltd.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x400>;
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x500>;
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@600 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x600>;
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@700 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x700>;
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13
+			(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,
+			<GIC_PPI 14
+			(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,
+			<GIC_PPI 11
+			(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,
+			<GIC_PPI 10
+			(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
+	/* GIC-400 block base; register frames start at offset 0x1000. */
+	gic: interrupt-controller@4900000 {
+		compatible = "arm,gic-400";
+		#interrupt-cells = <3>;
+		#address-cells = <0>;
+		interrupt-controller;
+		reg = <0x0 0x4901000 0x0 0x1000>,
+			<0x0 0x4902000 0x0 0x1000>,
+			<0x0 0x4904000 0x0 0x2000>,
+			<0x0 0x4906000 0x0 0x2000>;
+	};
+
+	pmu {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
+			<&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		uart0: serial@2016000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x02016000 0x0 0x400>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <200000000>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+	};
+};

-- 
2.34.1

