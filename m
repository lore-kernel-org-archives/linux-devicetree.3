Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2125.outbound.protection.partner.outlook.cn [139.219.17.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8CB196C7C;
	Thu,  2 Apr 2026 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132182; cv=fail; b=VMEbhMIoFIEz/G0A8IpXUISkid6WF1HpyMz2JA76tCOFzJyMuRrov+qQsEwAWEzMLgKzm0qcykwTO3f31AIylNIkhqJwNTFyVGX3uV8a8Z+OO0biv5GayGTxbIIyFlrdMmzgpC+o/x5Kj9B/bVxFd2aM0SKAWK4HfiefKg1zHK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132182; c=relaxed/simple;
	bh=5y1lSW1+3FXA+xorrSVLoYAek/p1sTC4XOLziBEqNRo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A97I6XYUSXf7oQbpnahBQLbHf6jH7V+MMw3popkzWiNHlWmH0raroTXxYVE2AAbpe9wgW/0gtEhckfTo5LJ6arDaLg/bSN05hnVaB5XAnjsVFmvxD7KBiK1WoNqCNiKgG55kfYa5j3q1xL0aqUecnUh3h0vUXkKAkVQGP4V0G58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIrGkjonkgQsJY9pCTr1BXWks0J/qIfQwXPjompduBbKMmyf1mFkZ5izuFOIJDxImZSNwOYdyjU/P82Bsah75N4hzfY8VaMU2f8urkR/d51fZ7D1Z5pvdsjdRjHWFBGSyQIRAau9RYAPdeIuxCDDbEs2hhLV3A8JZPmb+jNbfVnb8waZl8Xv88LBktL09VpIiNhQ9x9YFdzRuJrLOyPqqFLgT5Ewk7ziHIStgHH6VecMC6Qhx4+d65PJBe+yYTv38YcqxVstISOzslF7ZZRDt9wzUujnwfyFqbyghkYryxSduJFV9qdZqJD4p+rDT/RCPxKd6BCdzhQj/OdJzHEVog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOHThFcdGeIbvxJBqTpDlm0FgTCXd3dbUM9ADIP+kpM=;
 b=X1InimPef/ymxYhGXtBIarZcHVDgg0OHXHopAmw9kuIqdUSk0blFS/IOXPl1maPBq6nyf3wg9cRHkYXpoIvVletwKDL8vPZ6zThgSIO7LgGQZ0J9iwBqMngCP6p6A/wftFdVVqUFxQuUM5ho7NfTovDKDhITWJi7JMKgUsV4cy3qqZtn9CvUm5w3hEJbzz6qKkvMWmQFJiMXsg4npihTYPBQXyufciDYtmOqAEM5wvS1/SUV+tnqPsAJRH7ht0eqYdSAIM9rUGXoM0fZkBVVwBerwecW2mbBNt9/ZDIvIom4BpXanB2MnnewPZkr0vXttSn0eQtKoca7OTBhGM5WbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1235.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 08:40:39 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.018; Thu, 2 Apr 2026 08:40:39 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Yixun Lan <dlan@kernel.org>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Guodong Xu <guodong@riscstar.com>,
	Michal Simek <michal.simek@amd.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>,
	Icenowy Zheng <uwu@icenowy.me>,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Michael Zhu <michael.zhu@starfivetech.com>
Subject: [PATCH v1 5/5] riscv: dts: starfive: jhb100: Add JHB100 base DT
Date: Thu,  2 Apr 2026 01:40:19 -0700
Message-Id: <20260402084019.440708-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260402084019.440708-1-changhuang.liang@starfivetech.com>
References: <20260402084019.440708-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0023.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::32) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1235:EE_
X-MS-Office365-Filtering-Correlation-Id: 6599151e-cea3-4ec5-525c-08de9093846a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|22082099003|56012099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	QieMCbxtFfq0MOKQjdx/juKMKAcy3QoNRfrIeG4AJPlR+y1mR/0rdEWawbErtd0jbha3fCznqv4KM7roddEqJBtwB+xlN6wpp9IkfvjAMPWe8Zmy45lWy9HeG3DFKjqCf9dh9nNQQdPpJEyzr6xtDNCPadlL/cV6D13yojB+zDoQywmbTTsbSA9wTJ50OhSEE/G0bnRKqoSAB9cBSeMy+JrOXYgC8MWIh6VlT/VO/pNUMPHKwfcvD1YfDKd1YV/+ZuhnNuZPcaED7SapcIkOuJbl86jo/edGPSLH+D5bNeyXrLOpmMRu9t6zq7EcTTd7F+joRz5dkRY2Gmahbw4iIslVzF6KILImMPCjx986Vi2NTyiDFnUrqTrIkih5HqAqD3pZHNLqtVvSl+gaSW9pJ3KjOb7SFGRrzCGye552FAfEM1oht7ocfnviq7ahVEK7mkcZzLtclncbZ8108vTxO4m/W/Ri4TRWBELEcCVFySBEdJSUxOmQxygigQIJG/jJZU0Fep0kVVYXPZPMQEvwFAdZAJFhk789dmFy8GAqOk3rUz9O9nS7mgn1ohJsvAvJVsyqPTmHfgVZRy2h0ZjEArpKP20v32+xGbab2stAs+c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(22082099003)(56012099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X6cE6XsqVuKFtdHBD9GLrFcqlj73TsppafQqwtQ9uSUyxjWMDXdZ+9RyuhRg?=
 =?us-ascii?Q?fD5hpti5cP0suqsiT6gVBQ/TONXvQnDUgxGc+e+gha4MTnrqLTlvNaTzkMxF?=
 =?us-ascii?Q?UBJu7j2SLo4c61/HtNZL22CuB8rppCWszzGZgGoXZj3emM+MXQw9ddvfK7H+?=
 =?us-ascii?Q?Qz+NJ38311PO5FVRI1bpbZDd7X3UMdDDMowyMUsWKyMezewJEsDXZZRjPtEb?=
 =?us-ascii?Q?KhmyCmqUIJq/YaqVKJt8+1OU2ZLdxv2epauVCe69XcPa05yW8rmcbon/qHIg?=
 =?us-ascii?Q?+1qtoLn5Wzv/m8l4DY2Ig06vJdJuzCOBRcXe6KF49mK5S+2RU+x7A9JwevgP?=
 =?us-ascii?Q?ovi2/y9QLFoh1B2QPazom5aRwcQsIvU5amWFetrh7UpxvcWunHS67t56x3fm?=
 =?us-ascii?Q?1Ja/xc9ca+dv9gHfhjDhVrD1aWnIekfygxDYm+9l+gw8e8h3VMHJkOgedq72?=
 =?us-ascii?Q?iOksAbhmxIZGuLgVirWqwsuFGV0P8xfiKvR9YLXik3zChcyXrILWDTToG6OW?=
 =?us-ascii?Q?4h8kuICv2PlN1lLXk6rmUVPoYsRZD2T1LVHiBXyuRY6HHF7wP45E6gatrZ2J?=
 =?us-ascii?Q?ScKcJIjqIFuoiP0KWtQ0MxIo/3Hla85/wPdDybLtYwuuaY+zQ8J0Z7NLXWml?=
 =?us-ascii?Q?TpkPrzdc6N4P1wiDMpeElY73uGDQk1hZtwOgHQnN35cSygrj4vWnFGpdCjEa?=
 =?us-ascii?Q?Gi/UDEGhxe+u5KVQ/hBNfwDXtG6XG7rWcbYl5d0b7i5UafoZFBYyPb754j2V?=
 =?us-ascii?Q?AldfgLZehhYlmBqasIg124TTJRutkJUPMiYAwL9iCxqDe2K9y0sDPM+gXx7e?=
 =?us-ascii?Q?5qLdMWqSmypsVTJrCzTW87aeV3I16lC9aRjBGXoJOC2rb7XQl+usb1YLtkE0?=
 =?us-ascii?Q?SH0c6rjnjDTiy1Hq1J62ZbN2LzF1gUmq7Az/du3e2Bku1AXF/CyaelQ97/eG?=
 =?us-ascii?Q?0e3MUX4RzsCXgbVlTKyDT3XCJDidOlKN1X2Ku/Fnf245eY+k9K2e/AVVobE4?=
 =?us-ascii?Q?vhWsPiBlmLeezDc8Q9NLo/1LLtxPdTjhnkWlV/39rA969lg/jDgUAmQYfUjK?=
 =?us-ascii?Q?ej9u8x3lsmi6A+X0687/uvC3zziAUwP6faRsg5hq/u2vuHa+wb6cl/iQ5IpQ?=
 =?us-ascii?Q?daFfCcSHOIua3KOFZcQl5ihoLMA0CmRApxkLDI8Ev53DNqJpkOGSPJZDt/KY?=
 =?us-ascii?Q?osoN8r/LwynmQ3DJmAl/ekXyLMEleeM4GghdTZ9KXbdCkOuYYZjhzJ1FRWbs?=
 =?us-ascii?Q?yMW8AWZrDHJ3qVtoBeMSd6BOSdVIJcr/Mezx/ZY6uvVmwtxcc7XNfcOW1Wum?=
 =?us-ascii?Q?htigiqVqcyRdLCwnd5p2k0fcmJUfBFqUEryoaFgQDIVZySqk5mZUrgp/+BxY?=
 =?us-ascii?Q?rMTBvuCZHvHQoGzQDXBUaFUnNxn+wIYFE4UZXCM4cs33V+R1dJDBvYoGGevi?=
 =?us-ascii?Q?SI3DrD5c2Ep5a3pbbYxu3iZk+0QJ2wSEFzbeKjWjAzocBVjaRttJJk+vGhio?=
 =?us-ascii?Q?uPbZfZLpkQxPmdjbKT0rVnIIlhGCIq8HGrOLY03v6eEoGC++iGwxwkPYvZn5?=
 =?us-ascii?Q?Bxceaz+SRTu5/i4L4+6ms1K4s3ruTTGdT4aXiJTWLZb4QIanTcAQB47I+IXD?=
 =?us-ascii?Q?Xfy2p145EAUQyLcn7N/n4/CpoQgP1Skg1tzA2my8UL59fjh4jIik3i861brz?=
 =?us-ascii?Q?M7MOcNoJtBIKenjK4Non1AuHSltMrb/ozDhVlr+ZYSqaSh5dYG/ywojaXiQU?=
 =?us-ascii?Q?1DB55ZVAO42l5x9oE5BoYsuIW3+OpedS7PWUdDhtlqdJrV5hPwBm?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6599151e-cea3-4ec5-525c-08de9093846a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 08:40:39.1606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjO2zlfjvI+UQ4ceVu3m2/R4ChUU1SlUZ1FTM+aQ7efraQmrKTgtg1OPSScgfzadhEuo5y9wGpZ36mtY27xwJEQ7gp/KcN6IfN0Jl7xm16pyt0mou3Epg2TSpn82b/hI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1235

From: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Add JHB100 base dtsi and dts. Consist of 4 Dubhe-70 cores, CLINT, PLIC,
PMU, UART and 1GB DDR.

Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/starfive/Makefile         |   2 +
 .../boot/dts/starfive/jhb100-evb1-eth.dts     |   6 +
 arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi |  32 ++
 arch/riscv/boot/dts/starfive/jhb100.dtsi      | 326 ++++++++++++++++++
 5 files changed, 372 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d10988cbc62..b1892a480c31 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25306,6 +25306,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jh8100-intc.yaml
 F:	drivers/irqchip/irq-starfive-jh8100-intc.c
 
+STARFIVE JHB100 DEVICETREES
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	arch/riscv/boot/dts/starfive/jhb100*
+
 STATIC BRANCH/CALL
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index 3dd1f05283f7..7cdb75788053 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -18,3 +18,5 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-lite.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-lite-emmc.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
+
+dtb-$(CONFIG_ARCH_STARFIVE) += jhb100-evb1-eth.dtb
diff --git a/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts b/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
new file mode 100644
index 000000000000..62cd046e1224
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2024-2026 StarFive Technology Co., Ltd.
+ */
+
+#include "jhb100-evb1.dtsi"
diff --git a/arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi b/arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi
new file mode 100644
index 000000000000..462b6fb7953b
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2024-2026 StarFive Technology Co., Ltd.
+ */
+
+#include "jhb100.dtsi"
+
+/ {
+	model = "StarFive JHB100 EVB-1";
+	compatible = "starfive,jhb100-evb1", "starfive,jhb100";
+
+	aliases {
+		serial6 = &uart6;
+	};
+
+	chosen {
+		stdout-path = "serial6:115200n8";
+	};
+
+	cpus {
+		timebase-frequency = <5000000>;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0x0 0x40000000>;	/* 1GB */
+	};
+};
+
+&uart6 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/starfive/jhb100.dtsi b/arch/riscv/boot/dts/starfive/jhb100.dtsi
new file mode 100644
index 000000000000..4d03470f78ab
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jhb100.dtsi
@@ -0,0 +1,326 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2024-2026 StarFive Technology Co., Ltd.
+ */
+
+/dts-v1/;
+
+/ {
+	compatible = "starfive,jhb100";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "starfive,dubhe-70", "riscv";
+			riscv,isa = "rv64imafdcbh";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h", "zba", "zbb",
+					       "zbc", "zbs", "zicbom", "zicbop", "zicboz", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintpause",
+					       "zihpm", "svinval", "svnapot", "sscofpmf";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <16>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <512>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <24>;
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2c0>;
+			reg = <0x0>;
+			tlb-split;
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu1: cpu@1 {
+			compatible = "starfive,dubhe-70", "riscv";
+			riscv,isa = "rv64imafdcbh";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h", "zba", "zbb",
+					       "zbc", "zbs", "zicbom", "zicbop", "zicboz", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintpause",
+					       "zihpm", "svinval", "svnapot", "sscofpmf";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <16>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <512>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <24>;
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2c1>;
+			reg = <0x1>;
+			tlb-split;
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu2: cpu@2 {
+			compatible = "starfive,dubhe-70", "riscv";
+			riscv,isa = "rv64imafdcbh";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h", "zba", "zbb",
+					       "zbc", "zbs", "zicbom", "zicbop", "zicboz", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintpause",
+					       "zihpm", "svinval", "svnapot", "sscofpmf";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <16>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <512>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <24>;
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2c2>;
+			reg = <0x2>;
+			tlb-split;
+
+			cpu2_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu3: cpu@3 {
+			compatible = "starfive,dubhe-70", "riscv";
+			riscv,isa = "rv64imafdcbh";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h", "zba", "zbb",
+					       "zbc", "zbs", "zicbom", "zicbop", "zicboz", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintpause",
+					       "zihpm", "svinval", "svnapot", "sscofpmf";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <16>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <512>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <24>;
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2c3>;
+			reg = <0x3>;
+			tlb-split;
+
+			cpu3_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu1>;
+				};
+			};
+
+			cluster2 {
+				core0 {
+					cpu = <&cpu2>;
+				};
+			};
+
+			cluster3 {
+				core0 {
+					cpu = <&cpu3>;
+				};
+			};
+		};
+
+		l2c0: cache-controller-0 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <2048>;
+			cache-size = <0x20000>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2c1: cache-controller-1 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <2048>;
+			cache-size = <0x20000>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2c2: cache-controller-2 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <2048>;
+			cache-size = <0x20000>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2c3: cache-controller-3 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <2048>;
+			cache-size = <0x20000>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l3_cache: cache-controller-4 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <3>;
+			cache-sets = <1024>;
+			cache-size = <0x20000>;
+			cache-unified;
+		};
+	};
+
+	pmu {
+		compatible = "riscv,pmu";
+		interrupts-extended = <&cpu0_intc 13>, <&cpu1_intc 13>,
+				      <&cpu2_intc 13>, <&cpu3_intc 13>;
+
+		riscv,event-to-mhpmevent = <0x00005 0x0000 0xA>,
+					   <0x00006 0x0000 0xB>,
+					   <0x00008 0x0000 0x10>,
+					   <0x00009 0x0000 0xF>,
+					   <0x10000 0x0000 0x19>,
+					   <0x10001 0x0000 0x1A>,
+					   <0x10002 0x0000 0x1B>,
+					   <0x10003 0x0000 0x1C>,
+					   <0x10008 0x0000 0x8>,
+					   <0x10009 0x0000 0x9>,
+					   <0x1000C 0x0000 0x9E>,
+					   <0x1000D 0x0000 0x9F>,
+					   <0x10010 0x0000 0x1D>,
+					   <0x10011 0x0000 0x1E>,
+					   <0x10012 0x0000 0x1F>,
+					   <0x10013 0x0000 0x20>,
+					   <0x10014 0x0000 0x21>,
+					   <0x10018 0x0000 0x17>,
+					   <0x10019 0x0000 0x18>,
+					   <0x10020 0x0000 0x8>,
+					   <0x10021 0x0000 0x7>;
+
+		riscv,event-to-mhpmcounters = <0x00005 0x00006 0x00007FF8>,
+					      <0x00008 0x00009 0x00007FF8>,
+					      <0x10000 0x10003 0x00007FF8>,
+					      <0x10008 0x10009 0x00007FF8>,
+					      <0x1000C 0x1000D 0x00007FF8>,
+					      <0x10010 0x10014 0x00007FF8>,
+					      <0x10018 0x10019 0x00007FF8>,
+					      <0x10020 0x10021 0x00007FF8>;
+
+		riscv,raw-event-to-mhpmcounters =
+			<0x00 0x00 0xFFFFFFFF 0xFFFFFFE0 0x00007FF8>,	/* Event ID 1-31 */
+			<0x00 0x20 0xFFFFFFFF 0xFFFFFFFE 0x00007FF8>,	/* Event ID 32-33 */
+			<0x00 0x22 0xFFFFFFFF 0xFFFFFF22 0x00007FF8>;	/* Event ID 34 */
+	};
+
+	clk_uart: clk-uart {
+		compatible = "fixed-clock"; /* Initial clock handler for UART */
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&plic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		clint: timer@2000000 {
+			compatible = "starfive,jhb100-clint", "sifive,clint0";
+			reg = <0x0 0x02000000 0x0 0x10000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
+					      <&cpu1_intc 3>, <&cpu1_intc 7>,
+					      <&cpu2_intc 3>, <&cpu2_intc 7>,
+					      <&cpu3_intc 3>, <&cpu3_intc 7>;
+		};
+
+		plic: interrupt-controller@c000000 {
+			compatible = "starfive,jhb100-plic", "sifive,plic-1.0.0";
+			reg = <0x0 0x0c000000 0x0 0x4000000>;
+			riscv,ndev = <400>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			#address-cells = <0>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>,
+					      <&cpu1_intc 11>, <&cpu1_intc 9>,
+					      <&cpu2_intc 11>, <&cpu2_intc 9>,
+					      <&cpu3_intc 11>, <&cpu3_intc 9>;
+		};
+
+		bus_nioc: bus_nioc {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-noncoherent;
+			dma-ranges = <0x4 0x00000000 0x0 0x40000000 0x2 0x0>,
+				     <0x4 0x00000000 0x4 0x00000000 0x2 0x0>;
+			ranges;
+
+			uart6: serial@11982000 {
+				compatible = "snps,dw-apb-uart";
+				reg = <0x0 0x11982000 0x0 0x400>;
+				clocks = <&clk_uart>, <&clk_uart>;
+				clock-names = "baudclk", "apb_pclk";
+				reg-io-width = <4>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+		};
+	};
+};
-- 
2.25.1

