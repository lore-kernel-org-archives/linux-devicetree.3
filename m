Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED30E3FBECF;
	Fri, 27 Mar 2026 17:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.147.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633513; cv=none; b=U+EfkrFjtT3UYkwQQrcV5MtaYQ3smW2OSj2jbveGCoxfQlH3/86heNnAJtOkv63ltgwSVQsn5H1Ql0/GvZP5brDcizeq7Z3WTunSKBo1/f8Xhn5oe/OMut/7hCEYxNmz+gjjhQcddv+m/GdGrqlK+OFiR0yzJ34gxAoDjuFpkTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633513; c=relaxed/simple;
	bh=R8w5KgNpk4JX9eUqTOlHHCXtiZfa9SFPbciAjUEygfg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cy2etO8+4wtkUyxjzZlEQcKaeJlCbuLqMZM+Mln7+3vYrx5Q50jF7TmzyOETHcb5anvft1GICDS0qhZ6hNTyPXpNIdQchlNX0ayv5ub1RpkRETogH8J8pLfL/V04twV04GEF0XaxbdFVxqxS8S7ncXHezsoCRJIiyffxDUhfhxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=Zzn1ZuAq; arc=none smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="Zzn1ZuAq"
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RFWkDR2021895;
	Fri, 27 Mar 2026 17:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=Egov095zIMBS5
	uJeq4kL9GCBWM+iBpaBPcJ8x+V07Eg=; b=Zzn1ZuAqzMg8LjsxTm1XSZShn6bre
	DTROf4VVuDdhQLcuCrqOMJaKR5IuLq8FTTbWtRSEHFQgxT0cgAsH+x6n9DIekEPU
	+SwwxiVkIKu780gbUJMXmhgRuzXuLtEVGAhKpHXdVixOACyeXu60PVaxqkrXuKI8
	XxX5M5i/jbdBP9ngW8ScaRe9Sin2tHWRFMwWx8jXolBGiq9s6y5WnPzcaNlLzevp
	65RNn+xfYbn2f26/SHYFGcTBiAUVXqXSR+rvIS2fQMz/SPosCl0DzZQFVPNuNGwX
	TfERZkKkc7utEZzrLgu/c+3MpD9XVoNuTBF+bZcerep6XopVcz4pJvMKA==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d5thwk6m8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Mar 2026 17:45:02 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id C81B581C175;
	Fri, 27 Mar 2026 17:44:51 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id 573D7810AFE;
	Fri, 27 Mar 2026 17:44:51 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nick.hawkins@hpe.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: hpe: Add HPE GSC SoC and DL340 Gen12 board DTS
Date: Fri, 27 Mar 2026 12:44:45 -0500
Message-Id: <20260327174445.3275835-4-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260327174445.3275835-1-nick.hawkins@hpe.com>
References: <20260327174445.3275835-1-nick.hawkins@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Nno3-LkmSIMeXYKX4rY_TxizHZYUmYQL
X-Proofpoint-ORIG-GUID: Nno3-LkmSIMeXYKX4rY_TxizHZYUmYQL
X-Authority-Analysis: v=2.4 cv=a4g9NESF c=1 sm=1 tr=0 ts=69c6c21e cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=ay80y3fxfMS_JZZz1qJy:22 a=MvuuwTCpAAAA:8 a=KK1IH8HFS8MDNeiM4vUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEyMyBTYWx0ZWRfX2PYYB6UyassT
 CWtbdOYb+NdW6D881ljLl9uBzkq4AvLf2PaJ3Tmwm4K6fUvlDMkaB9qIZbJrOfLV4sXRjnodA+e
 p3rViSVIJQQQjuqSdrs5xTamLS4ZJeJnrYjJeYJABuIg67l/p2FUHq069s97XpUAPe0TNvBp8VZ
 aty5rdHaibbER/dGHsrSS5MtZNNi86q3o+bzwTWz1uB17lM8mb74Fdo08ycf+xPq6BjoLhBzkbP
 AFUeHTOL2kl3oVlqikVdyNH6mYxEGqDEKiR3D2kA+GRKcLd4/C2la1MSlV/ytRQwcZ0lItyMFw3
 rPvHHzLWLysJhcGYWGxjHWsR+1hcJ5IFAAd1LWtm36VxlXdwmeX0uY8f8p1FHRavNcbFoOcJuHR
 EtoCuwSvhDq5Hn1EJWl3Lb52MVPSwh2zNXzo3DGvjhN6IlZR49G3K/PqKpFg0Ob2ntJ4uErvq/0
 CWipRlu9HykaGxeenWQ==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270123

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
index 000000000000..42cfeac99029
--- /dev/null
+++ b/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only
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
index 000000000000..087688b089e9
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
+	osc: clock-33333333 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "osc";
+		clock-frequency = <33333333>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gic>;
+	};
+
+	soc: soc@80000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x80000000 0x80000000>;
+		ranges;
+
+		gic: gic@ce000000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			redistributor-stride = <0x0 0x20000>;
+			#redistributor-regions = <1>;
+			reg = <0xce000000 0x10000>,
+			      <0xce060000 0x40000>,
+			      <0xce200000 0x40000>;
+		};
+
+		uarta: serial@c00000e0 {
+			compatible = "ns16550a";
+			reg = <0xc00000e0 0x8>;
+			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&gic>;
+			clock-frequency = <1846153>;
+			reg-shift = <0>;
+		};
+
+		uartb: serial@c00000e8 {
+			compatible = "ns16550a";
+			reg = <0xc00000e8 0x8>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&gic>;
+			clock-frequency = <1846153>;
+			reg-shift = <0>;
+		};
+
+		uartc: serial@c00000f0 {
+			compatible = "ns16550a";
+			reg = <0xc00000f0 0x8>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&gic>;
+			clock-frequency = <1846153>;
+			reg-shift = <0>;
+		};
+
+		uarte: serial@c00003e0 {
+			compatible = "ns16550a";
+			reg = <0xc00003e0 0x8>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&gic>;
+			clock-frequency = <1846153>;
+			reg-shift = <0>;
+		};
+	};
+};
-- 
2.34.1

