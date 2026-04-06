Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993673859E8;
	Mon,  6 Apr 2026 14:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.143.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486381; cv=none; b=TpnqD1dIu0FygVkiZFtNaGUun2zhwptm6XNCl3s4TVDy0aNxptZhzS4n5zoxwIfIJSLVvgXregc84jO/837HjWu4Jx5rN+yniFMQUQUMAaFodY3Het63PZTsc/BkHYCaea5ZdhOGs08CRtr8o5nFn7JpTP9rs06N+oKQWqkmlw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486381; c=relaxed/simple;
	bh=92itrKp4qIinBgarcOCT3VcszxeJW+F0Vl3En/Dd4CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tskmggCcfFCcsQUmEiu76StjrBiSEAXjU9WtU2UmjapuTYkb66RDGo+4pK2ap8SNQMFyswOHhxH8bniJ/z3PR5eFeqMnutY7pj/abVGk7HEX/Lw5YlnLiI6wsPXe0S+7/6aLC8CijP2Ii+UY0paF7ekfTw/t9ssw6pFd+ijDRnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=is7OoNNR; arc=none smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="is7OoNNR"
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636CMDMc1258421;
	Mon, 6 Apr 2026 14:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=ZsPTcGa1nEqBP
	RTL8HK78mdgFEkMZ8OgLFkJQdHttGQ=; b=is7OoNNRImVIC6B2UjC/Gzx0XKRE6
	49ExgHoBWjrTknteH15tss/651wpdEluP4sf4jQeFVAECokt6rtJp5x6mUvW4ryl
	W5HpXaoEr5rGPYdPzshkJXYhHQ9iS2lX31kt6VzOsG9/pOaE1O9DENHBQk3gavms
	eW2D8S8VDu4G6CPmB3mVzCcSa1EK3quqpDXbi/26r24OdWiBKLlPhHZCwUKEPDo+
	B5rYa0Pfrpk+ppvDgDB66l1CVWZPnnkKj9fBjRjyijUUIF1+AE7XHMOMUMV5LXuQ
	n2QZuVG+r2No0DafFYuGE4rOk7+9AaEs+73kRoRX26VA+59wCwzGcO8gg==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4dc8vyuxas-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Apr 2026 14:39:24 +0000 (GMT)
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 4C502801734;
	Mon,  6 Apr 2026 14:39:24 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.39])
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id 23C768081EC;
	Mon,  6 Apr 2026 14:39:22 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nick.hawkins@hpe.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] arm64: dts: hpe: Add HPE GSC SoC and DL340 Gen12 board DTS
Date: Mon,  6 Apr 2026 14:38:20 +0000
Message-ID: <20260406143821.1843621-4-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406143821.1843621-1-nick.hawkins@hpe.com>
References: <20260406143821.1843621-1-nick.hawkins@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WrEm8Nfv c=1 sm=1 tr=0 ts=69d3c59c cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=ZSrvDirOKP4VPF05hnFf:22 a=MvuuwTCpAAAA:8 a=IAahzOsQSAGs1RANxgQA:9
X-Proofpoint-GUID: ZIHSYdimVFQ8D4FBSNnjbfZFgB_ClQRN
X-Proofpoint-ORIG-GUID: ZIHSYdimVFQ8D4FBSNnjbfZFgB_ClQRN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE0NCBTYWx0ZWRfX+9XktqemlSoL
 4K9Wa3OeHU4QOsEDKM8Swhssnqt7Jc2zta7gkAcOaS0rDDd9KgBQpuGW/AQP69nB/rkmlJXyLK4
 dQaiONlIbVyfUVBGVO6YClcu6t0gmQx94wFmESqutIO8jrS24mJ/NQ+BWPCR6toGnjMy8smh2C2
 dHlCC5rRYo1XFdcty42+BaHeGT46bXnuJg2HlNi64GQHeLaG84X1a32yKT1W5VwYLGgCgbyDhXN
 NlryHtU3UoySMs4CbMQoNKMnpn6KhTIvP+l5hCV2Nqq8V8WvAzV1+pNCBRJJXw0bzR7u+ChlvCk
 Vt7hVJtM6PhcIZMYGrcCK5MYnsFbNZQ7vV0PxbukxERKOaY4k+zB6OW2q+IKKbEArv5RmOKNef/
 +NpFzTa3UCg91iOSkR0UTcaoftSz3MoFKo2vx2cEUuCvN+zxfwKMMO+j1/oGSCNblse28zIiMFv
 ebIwfctvZOxw74pvCRA==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060144

From: Nick Hawkins <nick.hawkins@hpe.com>

From: Nick Hawkins <nick.hawkins@hpe.com>

Add SoC-level DTSI for the HPE GSC ARM64 BMC SoC, covering the CPU
cluster, GIC v3 interrupt controller, ARM64 generic timer, and console
UART.

Add the board-level DTS for the HPE DL340 Gen12, which includes
gsc.dtsi and adds memory and chosen nodes.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
---
 arch/arm64/boot/dts/hpe/Makefile           |   2 +
 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts |  18 ++++
 arch/arm64/boot/dts/hpe/gsc.dtsi           | 104 +++++++++++++++++++++
 3 files changed, 124 insertions(+)
 create mode 100644 arch/arm64/boot/dts/hpe/Makefile
 create mode 100644 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
 create mode 100644 arch/arm64/boot/dts/hpe/gsc.dtsi

diff --git a/arch/arm64/boot/dts/hpe/Makefile b/arch/arm64/boot/dts/hpe/Makefile
new file mode 100644
index 000000000000..6b547b8a8154
--- /dev/null
+++ b/arch/arm64/boot/dts/hpe/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+dtb-$(CONFIG_ARCH_HPE) += gsc-dl340gen12.dtb
diff --git a/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts b/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
new file mode 100644
index 000000000000..7a3d9f1c4b2e
--- /dev/null
+++ b/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "gsc.dtsi"
+
+/ {
+	compatible = "hpe,gsc-dl340gen12", "hpe,gsc";
+	model = "HPE ProLiant DL340 Gen12";
+
+	chosen {
+		stdout-path = &uartc;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x40000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/hpe/gsc.dtsi b/arch/arm64/boot/dts/hpe/gsc.dtsi
new file mode 100644
index 000000000000..1f4c2a7b3d91
--- /dev/null
+++ b/arch/arm64/boot/dts/hpe/gsc.dtsi
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree file for HPE GSC
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	osc: clock-33333333 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "osc";
+		clock-frequency = <33333333>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0 0xa0008048>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <1>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0 0xa0008048>;
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
+	soc: soc@80000000 {
+		compatible = "simple-bus";
+		reg = <0x80000000 0x80000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		uarta: serial@c00000e0 {
+			compatible = "ns16550a";
+			reg = <0xc00000e0 0x8>;
+			clock-frequency = <1846153>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <0>;
+		};
+
+		uartb: serial@c00000e8 {
+			compatible = "ns16550a";
+			reg = <0xc00000e8 0x8>;
+			clock-frequency = <1846153>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <0>;
+		};
+
+		uartc: serial@c00000f0 {
+			compatible = "ns16550a";
+			reg = <0xc00000f0 0x8>;
+			clock-frequency = <1846153>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <0>;
+		};
+
+		uarte: serial@c00003e0 {
+			compatible = "ns16550a";
+			reg = <0xc00003e0 0x8>;
+			clock-frequency = <1846153>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <0>;
+		};
+
+		gic: gic@ce000000 {
+			compatible = "arm,gic-v3";
+			reg = <0xce000000 0x10000>,
+			      <0xce060000 0x40000>,
+			      <0xce200000 0x40000>;
+			#address-cells = <0>;
+			#interrupt-cells = <3>;
+			#redistributor-regions = <1>;
+			interrupt-controller;
+			redistributor-stride = <0x0 0x20000>;
+		};
+	};
+};
-- 
2.34.1
