Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010055.outbound.protection.outlook.com [52.101.61.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA26C329E5D;
	Wed, 24 Jun 2026 05:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782280611; cv=fail; b=de4nK4Pf4afbXBgF76STvxpM6gnFTC92VjapsCdU4akbXWRnylzz/byOAeVRzeLGjaqfF9p7Z1YPP/U9Tb+4B9Z9OYuaqDfg0nFZ8MF15ckP/kQ53KFx8DEv36t6JnpQVIBcLhvPNwOTCuO1Brm0KEjj+hZo81SHlRxwSKSpSBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782280611; c=relaxed/simple;
	bh=AhS48X6Vrow+NGID5ZJNRmkIXyvsr0gRNIWePWDy4a4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=He5D72hvmhalgbSBSd6p4/e+SM/pfqq/D3/tkxYA+7NTS5BV6Oexhz6hERN5bDqY1KaCUdei1RnnojL+jJ6J10Y9b37i1qaXJJBatdZ1TZ+uSbteeUV8z5hE+8zkzP79ELpIfPUhFaDL9XTJU9HasFLcJGtk87ZCdGf+gtV6Axg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=swko8fl/; arc=fail smtp.client-ip=52.101.61.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="swko8fl/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kaSq2GhMppgA0j99cyEVNk1DBRcY83gmtYo8cJsESbVrc251p2oVxO6pxNYHQGf0u45/Ia56df/4LA+aFJCffFV7GUQ0/49s5t22gje/IsfJp7balA0ZXPV7sixraa/yWGnSEuUXRuejF2CcXrK1Ngd5LeSMKB3JXaTJWkbHuKj0q2Gq0/hHF+P5UwmRKuogwmZTa2G5BbRu2DFNz0LecWNj0gopiaGlr/qmEc9J+ykCISA2l7PoYOMFeZRZqm29iSj7tLIDugucTH8E52tYDkS7Rl4xCIrkl4rBRdOtJNJ86rUjLR0160kF/d5krH6G6bQAIB4L5ol/GsIvcoyOSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZDRi9wZ8QLk9S/SU0Z39DEclwAp7QQ2mwWmwrSDE14=;
 b=f+AXD+CylPGOT0TZuFVr2I7BhhjtVck8ra33oRmWhZzhjkjsM+zl0oOICaBZfuC97lBy+zHMwzuX3TDv9+BeYT/CiGY7XWhQpHq+eGYAURtMWgJcVZtmEHU5pfMjUJesNypROcqJjJE7ARkZ+HnNMPSs+7OhCOLM8h2qwbogml/z2vdlFbBQ4UWE1PKdoDW9wntAGq15gaGknwj0G6mxUO6kRLnMmy264Zesz0FGncKdQWCYbEti3FG2DESjibmhFJs64CiD7S/ydlAlnhePSHc4F3lKlHASolW4eGPYWKUsCy1tqW7N+b/L+CR+94k05fuXs8CIk0zbqdg4nvFGVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZDRi9wZ8QLk9S/SU0Z39DEclwAp7QQ2mwWmwrSDE14=;
 b=swko8fl/wQLqdQv75JP38h/e0g8s8N5fF9rZQg9ZTaWYPTJ/riSyPPvINTW8km93yYGdaPU/uajOWMylcUrk+wUFTvkfsnQfmesllJSDRds0vlWe6fRuY+g9GfeMbTVXPn41lRt0eIOLzecZr/ZohqraywlWc5ZeM8wsOyWeinTWPU9qG30FRV3gVsSeJ7xP8L4svDmx60osrCPXhO94LESzajabLOGdooayjYmuAHqp5XePvYFfXOF19JFCY+TAHkdqpewwEs/fOtwkln0tN3odMpVdjjMkt2je4YOj5FwRs74P9sUZ2N5p4vqz/65p/hoao9GyetbDsrprOakotg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by CO1PR03MB5683.namprd03.prod.outlook.com (2603:10b6:303:9a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 05:56:47 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 05:56:47 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: socfpga: agilex72: Add initial device tree
Date: Tue, 23 Jun 2026 22:56:44 -0700
Message-ID: <20260624055644.7508-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260624055644.7508-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260624055644.7508-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0184.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::9) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|CO1PR03MB5683:EE_
X-MS-Office365-Filtering-Correlation-Id: 6959e089-5af4-4321-9954-08ded1b56085
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|18002099003|22082099003|55112099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	mrCDw73r/nVxFo3MHaP9CJMuz4Nwrh89qXYoa1kvX29Bdq1BAzFa8yEJ8V1YsshKa5fn0rc6lBS2jbU6i4mqP3KIBJUo/fcVmTJtv47YroyCKFmyz/iKrBm0J7vjYQQzdthTuypAiJs4UgWcLlT1bhFBxQp3XliASW+Z069RUXzj9mXUxLgJAwDL2gl2+oERU41lF4A6GcgLZBHl4nSZ7FalM9jKEMvHN+848qFNnLJxFTBerH047maNj5qpsnUZgNdYzVNbXT5bF+7KXOs2gpVyMUR0TJsMkbInbVWUsiaPoJit2hcfLuEjD42KY0di32uVla6JQ2Jok3/K6sh0oWJorH06dwOk9YAeiQRUSKg7c1bljeGF6GWIjMa/1xDqLFR16sP1HuNrEbxTbRHE6ecVIh4pBqLRNWPV8yl0ejhvRSDosXynCHXmfSk6iX+boMpFmDLGb1f8/hB6SP7Br1vOi9HtbfwfJWXZJCCwV1M5+scoTgp6jVnmzyI13gPvxTb94jnVQupBBD5ijcEeuk9JWHSWvhNwdPDDEPwmQeEeHEHhtgRG9nxvf4fcbpGc9ZTRVPX2R6gFxlj63HX0YlyUi6UQaY7Imnjse7ZiQWnlZWRIn6Pa/Wo31lMqVtazpqRjBK4b0A0u0tikXFw0Sr/O4VyNhbkMzte/DOcPmKA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(55112099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l68Z5I4txV49iG4FL4x2WgpmmkjgMAV1F+uWo2B/xPvwBC+eLafDwtopfHTC?=
 =?us-ascii?Q?sI0+s+o3ibZklbV4/fGKVWwXAHlwdKpAGwLSQe2ORj5cg1Jm9Rw/7uixlB2r?=
 =?us-ascii?Q?VIqYTVWmrYHptWzWjD4bMXphiiDR+J2XS3JRamhLfw2xvO4rBRN/wfGU6VlC?=
 =?us-ascii?Q?CP1y1oFi1Jme23XPshIjDDcyl3Lb5XE+EZasX2NQc3DkVuQnpd6M+IzpsgAf?=
 =?us-ascii?Q?NAq+nDo9/MxHZQ/qMAqRafwMKt5+nEQIfDemjroka5sy2lFrDjCTfX1o5A5N?=
 =?us-ascii?Q?I7Yigz85qmPUxLeYL4o+XjgB98JsjpKTbL0ROwLbN6uR4yjzv6PiBcl27dQb?=
 =?us-ascii?Q?z/L6N27FqY4C0T25XmN8eRKSdUgN3cXvAqr1m+h+CD878794lRQFHxCtLo/y?=
 =?us-ascii?Q?tUzAxHqBnWG//xuwBXNsbBEyyYBibLIZ3kLngQGyxSEz3bCb9GLOaxJsX+px?=
 =?us-ascii?Q?q5mU1xXws1O+u3P2swTGmFfk1A33bPV5hb/Tho4XW75tERbm9p6rzeR/x6KI?=
 =?us-ascii?Q?q34zbA7EyRHsZgV3/HZ0gmouTpk9G+LKS4NibZXm9J+uSOPSwi/GirCrVd7i?=
 =?us-ascii?Q?t04qfTNDL8ZHjEZW0DpvLEgzxq5viCbuBZl9NRzEgHdpVzzS9Gq5M2LPxmxF?=
 =?us-ascii?Q?63IorogbFCkO7uIBU31lCj16LMrghN5/6/A/WiGQ5V8lcyxOUOLq7zlPTMDD?=
 =?us-ascii?Q?sbo5NuZfbxwOSSFi2lELDcKTEOvrbNq7xq5KyBXLj2ymJj3mctb5dbtmjLC2?=
 =?us-ascii?Q?eQhznHxKEc7Ulgc9S2Isd2J/byqd8wdwE0BxctKWuTIP7LJ2SChvREti+kjT?=
 =?us-ascii?Q?WwjMRPwl4Rkln9C1IiwmA5RhbSnF0dUFadCZvyHxu52FGkuTeMbJf4mxG+GX?=
 =?us-ascii?Q?Jkx0YFl9F5ysXpP+eBl/LFey4NahoUqslUJ2+PjV0QHcyp0iMyN6qHsHscKs?=
 =?us-ascii?Q?dqcXLYka5Ewm1M6lZ0393Rrne4fg/9lSbpjTUQe259iJF9OXqL+v7rBM5IHu?=
 =?us-ascii?Q?/S5YNJS3VSPwnbS12tzZmPY+CbFpqe8k/Yzdtb8jdg/BMOzoSGpjskEwsOz0?=
 =?us-ascii?Q?DKiMJWXrsw4CciD1WTVJ/gG+doFE3EGiAiGnXOjob8QKV7m51sBUsxr2aNl4?=
 =?us-ascii?Q?EzlOVpdVScYo7Yu2GgwiYr65yGAWEEc42QHEFlUgDV7jctDPn1eSFehJNhes?=
 =?us-ascii?Q?lNXlXQULv2XDxLDhAOxCv/NgL5KKA1zcHkDKbPFFV+lqjn8tyNDR6HcuXzmO?=
 =?us-ascii?Q?bZ53rVzUsvdJjSekO6THGOo+8vzjdmGNQ3raojYPyF9b85ffuo004F2Z4F1C?=
 =?us-ascii?Q?zvYIzxUxc2gljWiUjw/RtgsOzV5yy+SNTv5SFPEc0WPH7B39nfo3zExOP4OV?=
 =?us-ascii?Q?PK0YS/qfdQKHoZGfzCpqi9YKAWSWoe6zXz+TA5HuRf3Jsm7kiJMCYvhnETIy?=
 =?us-ascii?Q?+mf3droVrVydTHAt5boT/DM1QbYGb4V3dSF1the7VCCRjZjjoOUM9W/D+uw1?=
 =?us-ascii?Q?DxspAHibUZmn8jaE4NNC1lItHdOoGqdDw4lbV2CgysHY+GML0kVkZwP1X+hI?=
 =?us-ascii?Q?bNjfhU1v934Cak9TfnbwRUY66jGqHiE8SWx4ZMqaggc57y5P6HPXfWMToBlD?=
 =?us-ascii?Q?6vHKBtksUCsJI1QIi0whkBypv980TteHS+kzF8RmQZdxQGeXqT7srqsIZeF6?=
 =?us-ascii?Q?XyDGsrtFgBBLbGM6/ULn2AGFFiKbqFI5u/lWOMrl3Ik93DMRzcqu6EzueB4R?=
 =?us-ascii?Q?YyKSwjFbgGRvUB9NWJqJuqNfBq7BBJ+HqJz9/HJZ366sUzHJ8yKMBup8B2vy?=
X-MS-Exchange-AntiSpam-MessageData-1: XazLxiR/7gkjPA==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6959e089-5af4-4321-9954-08ded1b56085
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 05:56:47.4387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcR+kms6oeHAwKVlwJrayv2Fus+xONi03ZqI430XzC+jhm7DxPAbjqMSSWWtZrst2jZC6LJZD/LdOZPgEmXkYuaCwTMY9t3s4QvsEDS2Pml349FXjfkrDwzSm0Lycu23l6JaaUj+uRRgYxfHWy9Xdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5683

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Add initial device tree support for the Intel SoCFPGA Agilex72
platform. This introduces the SoC DTSI and the SoCDK board DTS as
the first upstream submission for this platform.

The Agilex72 SoC features a heterogeneous CPU cluster with
Cortex-A520 and Cortex-A720 cores, and includes an SMMU v3 for
memory management.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
Changes in v2:
- Rename platform from agilex7-gen2 to agilex72
- Add arm,armv8-timer node (was mistakenly removed in v1); other
  review comments from Shashiko are either addressed or confirmed as false positives
  consistent with existing SoCFPGA platform conventions
---

 arch/arm64/boot/dts/intel/Makefile            |   1 +
 .../boot/dts/intel/socfpga_agilex72.dtsi      | 128 ++++++++++++++++++
 .../boot/dts/intel/socfpga_agilex72_socdk.dts |  15 ++
 3 files changed, 144 insertions(+)
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
index 000000000000..2a4ad4130f37
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
@@ -0,0 +1,128 @@
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
+	};
+};
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts
new file mode 100644
index 000000000000..336e12a88cb4
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts
@@ -0,0 +1,15 @@
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
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+	};
+};
-- 
2.43.7

