Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541973DEAD4;
	Fri, 10 Apr 2026 17:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.147.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775841405; cv=none; b=f4DjF9IMQtWl9ZrL3x911NpvxVgEdkyjzUhaEe6YH9HA9a90yJcDVNl8KiToH/ku/kOnBLnjrxkZEQV2LrewAdaPgcmQLTpnDgIx3cPGRrkY7HrmU//H7vOQJgluNdQ1wx9e2d4FCv6LVg0V6GsssKW5Uj4AfE8L/xaPx8qvweQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775841405; c=relaxed/simple;
	bh=fe7rrOkFzppDS9JuSxkmG+T2nMAOyt6Mg2k91hMVneE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nsfu/RWTf7YD+3ORjaqRedqHmBE5IukoYxQK7TQDV1dZLzdsn/G6TOpw2aLUtgbd0yzVD7W7KEDH6pWmGKOcRGML4Ipce6pWUzruAbdSDufvQGFOE0xk4J7Z+iOpZx77c0Mbao2vfdVyAkYPJKusl/wbIG/jeoO4/JrtT8SpNfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=WHHkEzUv; arc=none smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="WHHkEzUv"
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ACZGqA898647;
	Fri, 10 Apr 2026 17:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=d8mOWdXKD47qj
	tYZ2B6Qm+anVoC/Nc8eb6brCCp65aQ=; b=WHHkEzUvJE8NHZlsXP7tecL5LTpT8
	Ftxf4vA5qkhOh4W/wpYJH2qN1QDnjvRhSaZQogUV3vSTXu4wzM5ASYRliluHHH1y
	wCGzZFhZnH0UYWMR2KFHgbW9RO05Y1dEmZPHp1UQXaYbIC85iA3IxB+7/5wBJGyl
	RDJ/vt5tCMNXSwNUaRD1ZzzOaKTudoI31C/vn3ylUkhaiT1icT8JJucr0OMo1s1S
	QkqKxd2bgu07eEfrf/Ek/GNSoeTKuT8GM4J/9E7iat2y8uk26PAvv7e8HX8BhmNP
	+wMIrIZ32JRw9j1dGxdoFs7ElQXYwxj6UN2ubKmJNKLLCdunMZQR7YZXw==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4df1bgb2px-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Apr 2026 17:16:25 +0000 (GMT)
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id B58DE801AC7;
	Fri, 10 Apr 2026 17:16:24 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id 47C3D808530;
	Fri, 10 Apr 2026 17:16:24 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nick Hawkins <nick.hawkins@hpe.com>
Subject: [PATCH v5 3/4] arm64: dts: hpe: Add HPE GSC SoC and DL340 Gen12 board DTS
Date: Fri, 10 Apr 2026 17:16:10 +0000
Message-ID: <20260410171611.2547255-4-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410171611.2547255-1-nick.hawkins@hpe.com>
References: <20260410171611.2547255-1-nick.hawkins@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE2MiBTYWx0ZWRfX0BAOoDBxs6sA
 r0F7LzMujNk8BmAclWXfGTlNcbIhvpvrej/P5XnNHt3Dxrm12IUHXY0hn6Rosq7BNkJI2GBVaya
 wzj/Mv8BIHNCVU8QDVpFg3mm4lpZBskTIGnQapjXb3i3lHLTSE4JOCwcg0gUzg9fL8v3TUOL5jR
 TNU4/OzUqO9/4n4Euj57hlIOrQW90ioQeE/JmNcQ2sMgibdCVKMnn1lJTk+qMHk0NJXOEx/e1rS
 Yl2e346uQiAJLivY27nxekPLBAZa60feNsTWNZZtuR3W8331tA2A8ucjzbhcg3Tdmu7ICmp8gVX
 cVJR63Ah/dS4QgZ916qIbQ7n5Vnqmhu288PXr5UpCHiMOOCOyCKlDifLWRt64DYkjFwyBm/WC0Q
 yMF7FGaL8Lse6Yv4VeobnYmfkJXd+dUVb5xNujq9EcNX7pKb3gnX2O9AzJenY0/C9Bye5OoVts/
 I+pBUseFqnQnJOiPhSg==
X-Proofpoint-ORIG-GUID: N05lh3INzBHd0J60Twa_1S2imvFuuJ4J
X-Proofpoint-GUID: N05lh3INzBHd0J60Twa_1S2imvFuuJ4J
X-Authority-Analysis: v=2.4 cv=At7eGu9P c=1 sm=1 tr=0 ts=69d93069 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=RtSn8ETxjE2H05FtM2s8:22 a=MvuuwTCpAAAA:8 a=KK1IH8HFS8MDNeiM4vUA:9
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100162

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
