Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010031.outbound.protection.outlook.com [52.101.61.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DCA1624D5;
	Thu, 25 Jun 2026 06:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782370417; cv=fail; b=MaD5YKXbaq/VpQJ37UDSDDFEAZu8w8rcWspX7MNGHRsiZ8wRX4rV2cRQ+QNYK9cpfCRFYAqr7BsF9gXwAusarKV3ML6AT7J2MQ332n2xi+QzGDUQyJ06lE6naF2Z7TfwaNRGWJKcctpc2mVetw5PO7Ok83lJDJD4LkSc16ax2AQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782370417; c=relaxed/simple;
	bh=UOO336KuqAfMuMMMWTFOaEQAIRM5MVWSHEM3GC/9cIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H1wUAwClfvQZvL3mTo9bO5q0DpJIURKP7S9w0AI3AM2JTQWRahfML8IEMWog2EFW/3/NKexGsreLjyfuY1ExX4EK1XvyxZDEKEckv2WyFpdCGYcDRjS/rTIcTKXeElH8Q4s1NvVuVxpEeVopx3nYyxFvn/pwUyXAWLSskL6J9vg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=lTivp7eK; arc=fail smtp.client-ip=52.101.61.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="lTivp7eK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxoLh2TcEoQZ4UBqF1tLPovU+5cZ1lGcekh+JPS/kJkiBaZRXWWPgyhyJZsENQ60TG1Q9KnNpOwfgojc5GYjPhdxfdUqlB6S94KKdmQszBOmNqOOEotS9oeRarlbdkAugw/sqto3Xhm0Hp260Op9ONDG+Zm658S3nUcy6h2+qJXecM2Z9x3trk9clDSeB86ypBEdpck8hGVxOtORKwB2iw0KA4xwduo6wehKimRaJI/EM0z7yjc2cb53Dw5fpKPOm1zQ0WCUPrvojDe9iJELFKa/dHgfXWk65bdldiYNBF4MPIjHJRmz8GkBGVVa2CUd0dF8PIcZlAAF2gAsSmB3ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3/0y1nVb8+2Z5chAGNRWxwozUOUAKT+LwZPqD6g5PU=;
 b=uIociVW/gwX1EDhN02hN8HKBQNFzRNQYQNF/BInOnUMQJdnwd4LhWThQh4IhhJcadJefiqdZgt6lZJ55oLXhyhIH9pGAH4lm+Ol5jHckCoUcTp+FUzXKgM37aXP+mTVCck6ah+RzZ8evItzSO3wvddomHCTEFitN1g6R5xk/nxYifbLJa4SCo4hCADEafiTT0t3+Vy7P8e6QCKjMS2EuO9/2oLFgrDXpNiKxOedPOWyfQrC8WTcPMKSQ66rx+AXcjdwF+BvoLYjSw1vNd1Y7oFi1SglS6zsDXa6WLTt3CS4h+J7Jl/V/Nhc+Uk0+7ioKOPpYqqePWOF3Kfd97h5/IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3/0y1nVb8+2Z5chAGNRWxwozUOUAKT+LwZPqD6g5PU=;
 b=lTivp7eKZuBWzXFCjGsbKqedNj1CsOf04fJtiyJRcTG0+9FKkSD/ayCcSiXfPGhrVU9mmnf4qWV/SYi4WjItWdcQ+zZvFhd6WOUAGdCa/StkLY+v7DGziVym7u6iVqlRQyS5Oe+p5B9Eqm/gltEqFnqkCAA7kBP1CyW6m04ewsxw57KDHKztibjL35m5WSDHCr99xF++AyRIuH7LR9hg/KK14wa77XCRTuU73lqMOTZkMAQI3/Dp4MPLgB0W6TMBHt4N7un4msq64FFrOo8ir5GfRSZqrkb8uz+aUGPdPHaAyPHmrN+QmPsa8VzUWk7ck2Mrkq+LJLHjUYGIUcAVjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SN7PR03MB7229.namprd03.prod.outlook.com (2603:10b6:806:2e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 06:53:33 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0139.018; Thu, 25 Jun 2026
 06:53:33 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: socfpga: agilex72: Add initial device tree
Date: Wed, 24 Jun 2026 23:53:29 -0700
Message-ID: <20260625065329.20274-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260625065329.20274-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260625065329.20274-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|SN7PR03MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e37a219-efe1-4fd0-324a-08ded28678ac
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|55112099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	0Ptk11TyCRq5x90iR+Hx+85tVbtzxfYcg4GO1JzI6i/A/UyfkU53BfU9g9/o2RKt6TR8tahimCdh6Ls3JC0EsvOFDgNA0X0ojq9psqmvXSUv6xUDxXVR4PgyJnnpZsOIGUjKTphCGBc8jTWp3NJObb2ilzLg3no1fyesNcMFgf/syKNuYBKFDimMTvxVjhd/zddq8krvXes4e+Uzts4rEMyTYzx5lwHjENSXJ4/G0WoSM64EwN1KjHPBU+y3uq4D4yY4vwWs6923HLcPrUu04Ejg0fmyDc2zvA6p2nrqjhZlLHimbk4ouTIydXlu0u9x2U4rbiBn29xVe46PsFHMApbfq8F3GTAuwALyrXSNTC0ez2gKyJsYDQrOlnNMnXM0LET1bNd+9ABhdD+anjD3y21v6me4+nn1AP5882uzM2qksA9KAqyzaL2lryGbK2R7qDM8XrYmu9Ju20FF+qIrDKHWa741LJbzycDyLNf6yjN/oPDW72ZcezMwF4UcLxHfGtfFNUi+GexjLKvOhNEL8zf0v+4jsTizFf2AbU4jKDaSsPhF5CLVvgbgBj2EBfn5b5BEhdhmtYbdeRB81c614cm30hAgJeAx7oYtlduOQ47FNsGLZUDj0e45XdJt6FK5+EaYz7U6/0fPvpTYh+oNiuzRxZ6k4SrSopYQLnpJnG4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(55112099003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dniVtOUNnIjTuRdxgNmdBD/pExpUshpAeiWr5b7LzS5QPN2hW78qo3A6sSMf?=
 =?us-ascii?Q?7suLdcJWDKzjtJgjsgVEYYLfhZBsLsjW0mqHT3I1W8J49P2cAW9ObFXv2zpH?=
 =?us-ascii?Q?MdLIiFuXg/fX2b4fxAuNqLK7cOkBemy8JFRi0KbkuVeUCuZOvMm5wWVZLqW2?=
 =?us-ascii?Q?tfSQmYPzXrUQCM9XqQ+y+7dji3QHtTSw3MY+VX7Ipdo04KZKpv5utWpjYYGV?=
 =?us-ascii?Q?58OOE9+a62zQG1hU/DDMS6ic23OuDOe/N/rfQPeJ0mR3wDPfHIlB6Q6B6/e1?=
 =?us-ascii?Q?ISMJMqUwxPOiB6GT45NlrPM+TZrTNv2OHWUq2qhp/S9tcFYv7NutzGOwMwcE?=
 =?us-ascii?Q?TrcSCWM1hR9x/ngWAkxxkRWsElGVh7ErWVZubn4D1avVjJdJ+FI9wcciOZX8?=
 =?us-ascii?Q?iJ9S2kzfD7HNcJ6/UiKhtclsw6Qn9T+/CFYWvKh+0xuFKdiTN4+P+gF7swmZ?=
 =?us-ascii?Q?wbgbABJnxBNrgk7t1SHln3ULi2DIa4v4TLS6V+bkiY9yn0IRHNvmnqlAYIWE?=
 =?us-ascii?Q?p4fW+j42FIGWr3lB9NzMlbCVsY0+z8GyTrnWKEjGVp8o0XBLbajTk7iZWe7Y?=
 =?us-ascii?Q?5IM+u8RxkyOH1GtwIjK7/dzQwIT37mHHyytMwYS2B2+NJvg/yiD/CpSsSmRI?=
 =?us-ascii?Q?cG47jWP72gvXgonWraGVvoV0iqyTVoosRJ1lpJtyuuEWSjSQmi5//XETEQHe?=
 =?us-ascii?Q?no9NRGl2mx36Xp5M97sDBsccz0b5ZABrNoQABNZaLzkQpmFRq4fEgFThfxgI?=
 =?us-ascii?Q?nJ/ryPsNs1D6Md/A0ZkFgEvlHlYMyW0yVVgeulrYT65lOdTTJTMDyQkixUpB?=
 =?us-ascii?Q?HmeoFLtaAEFko1aObCJ4TUqoJCCC41r4KKYBPR19ceK8mUd/7HGrg57yqSCl?=
 =?us-ascii?Q?NJTOm/EymJ1q/cz1Ow6oeiRMveSeNh//zPDfVlCp8PspQQeI/UX/mAkbXU5c?=
 =?us-ascii?Q?2SGEDqhgqML6TyGa3nYsU6kI0ue5E7depDAQy3Tjk5stlcvSCF23ZgMpXb/Q?=
 =?us-ascii?Q?GY6dNk3Stjj0hG0KPTOMr2dlbtRwIHM5eNqYqPCvbM4QAyMF74myZlC0FUI/?=
 =?us-ascii?Q?w45GIb6tZERZsG2WPLOOUUnCfnSYtynosbD43UPvC7upK/RvElakstntHKsz?=
 =?us-ascii?Q?t94Tl9qJQJqQWz81EigLGqfbxerSP6WufjhOancmQNPGyh8mO+7SETPxaIgo?=
 =?us-ascii?Q?MX4D6gDGwWKSKu/67noKFoqD6XjD2Lwea58i56H8EV3CDwFmay/PEqpE4F4D?=
 =?us-ascii?Q?1BhTJQajNxhE1Kb17tu0KJ07oIXEx1Fug+sd0JW4E8/ciwemlh8L5COv+sjD?=
 =?us-ascii?Q?HRz4rR7xwA+Bce5OXwVPCjPZWytU/t+tipktZzq3+axVGyZHLns8WhQjDgI9?=
 =?us-ascii?Q?8VaZwJ3OvLrcNgQkkVrxtrO9bklycwooOaHOT058yCBaKgbO1QdwVABg6GbH?=
 =?us-ascii?Q?uKAPML3k2JdoATs4ZXRbakK/spVtuMh+vbwtSemtuZnmtI8m/cOnuuNNXvLq?=
 =?us-ascii?Q?paW4HyUjXLq31a5146MoDAnEmsva9QMQXkRU1BIAFouv3OQz0ciY0O8ez5wM?=
 =?us-ascii?Q?uWjBZre0cbisqGqgduHztJLjwH3jX7kJCvAD5AAQ92zmLCPiK3xmhronyoaw?=
 =?us-ascii?Q?z8nIWfI3/Z6xmfFyYkZBhyl8hrZU+NfGeBUQYpI5kvd2+ABA+lpia5FaDeD0?=
 =?us-ascii?Q?EGY0IXzRj3wAC04cMagNRx702Qo4oDRmi88hAuM7qcqahRxlpPZpBFOVXRl8?=
 =?us-ascii?Q?7hrepFcUyK2x6h2Zq9D0XrqgFQuI2GFK6bd9OaSqmGq/4ZSr4HupcQwiWOPD?=
X-MS-Exchange-AntiSpam-MessageData-1: mCE6YNlFc6Xa3g==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e37a219-efe1-4fd0-324a-08ded28678ac
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 06:53:32.7063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7nWVPndTAxRwepedIEHilOMWKknvVrvEF/OaGwfcA988WcR9NiY3eWGs1M1rWenHUxiaQoaOwyfUUIPCkFEAUViJsOyG4jPmhf6OqvZYY/7jDvSE6rrLFK/l5zM6geX16JMydMp1WoFK8NS8zJMow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7229

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Add initial device tree support for the Intel SoCFPGA Agilex72
platform. This introduces the SoC DTSI and the SoCDK board DTS as
the first upstream submission for this platform.

The Agilex72 SoC features a heterogeneous CPU cluster with
Cortex-A520 and Cortex-A720 cores, and includes an SMMU v3 for
memory management.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
Changes in v3:
- Add UART serial console (uart0, uart1) with fixed-clock placeholder at 125 MHz
- Add aliases and chosen nodes in board DTS for serial console

Changes in v2:
- Re-add arm,armv8-timer node which is mandatory for kernel boot
- Rename platform from agilex7-gen2 to agilex72

---
 arch/arm64/boot/dts/intel/Makefile            |   1 +
 .../boot/dts/intel/socfpga_agilex72.dtsi      | 156 ++++++++++++++++++
 .../boot/dts/intel/socfpga_agilex72_socdk.dts |  27 +++
 3 files changed, 184 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts

diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index 088a03b89c99..270c70fdf084 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex5_socdk_013b.dtb \
 				socfpga_agilex5_socdk_modular.dtb \
 				socfpga_agilex5_socdk_nand.dtb \
+				socfpga_agilex72_socdk.dtb \
 				socfpga_agilex7m_socdk.dtb \
 				socfpga_n5x_socdk.dtb
 dtb-$(CONFIG_ARCH_KEEMBAY) += keembay-evm.dtb
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
new file mode 100644
index 000000000000..c29c2afcaab7
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
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
+	compatible = "intel,socfpga-agilex72";
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
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts
new file mode 100644
index 000000000000..998f19f492b3
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+#include "socfpga_agilex72.dtsi"
+
+/ {
+	model = "Altera SoCFPGA Agilex72 SoCDK";
+	compatible = "intel,socfpga-agilex72-socdk", "intel,socfpga-agilex72";
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
2.43.7

