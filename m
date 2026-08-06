Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2124.outbound.protection.partner.outlook.cn [139.219.17.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7107947ACE1;
	Thu,  6 Aug 2026 12:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786019193; cv=fail; b=aKmwgAuvBjzi7C64tUdzHLexRKipELWMkyUjocVcdBhhVGMajvw2dWdMzdvmsmT2f9EW5+s3vKneBr8G6IJOq5B478glEivmceloaOugQhiYZaAsiiVuf3978Fd+3ew1OPpUHkv5G726AY9aADMz8b1XMWa4o6QOXAAcA4uN99k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786019193; c=relaxed/simple;
	bh=KYZpUqSYYndWJRwryKSFuNHTMJoaqc1OrJDmv1JfeJY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RxS0i6z0fupOu3uRhNARsrLVQ8sujjj3ubLSNEIqNa0la05eUwRWF5BJzcmnlT4xzR1VrGxWzeVzsw+NKsyau1QloxfPDPDffMWXVX35ZUaANooO8hppRxNjwM4QnEZHf353tHhp0Nul+3DpfC8H+XIxS0gDQ9UgwIZn/2lNxX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9wdna6itJ/G8D9FMaGc6Vq7xTAfEcBjyT6vHCf0J/LoVx4/95ORqmMA5eWCAV4VwNx4eslw/r3A9gejeQSJ2LeIJG/PVocKLQvTN0Ss4cz9AnOMCf2qtUxb7hjw8FNQHyvvj54NgsvcRWuLJ/fEQEABvMbScONC7zlyVxxP0rxCcxddZogXTEag0SGGn9HbiwKXgMWKcDqMrSgzI4dOZsTCpH04U2AyeA+XA8e2okEK4CiiXzBpe3KWZnHwDxvFXKVsmWB1TLD02gFQJ8M2RRq5R/OaLgKmi0HBjQV4kOyTMjZQpm+kC4FQ+RWrUQV35onwzJ5Ten//JLAqDh3sXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPb2QnGh1os+kWhLWa77i5BmbkC9onxaKPLywl3icU8=;
 b=O6c3XL7SLgU++Hh4mhaGuqmQ9oITu3Rz7RUrV6IwO6+w1jq9/rRqBSOt90hSFXogR5oHEonQV8ShuoDB67DDk4o3ibIEYogcqH86hus9FBG1tVOOm70+u22y+DnzwUqISFWXZvSHZapI/RSf1u2WW7Ol/NJ9yJeQ2FxSRHF5f4yRf1gkmdqNzNZIFVwH1grBt1cC7GZ5nPNhiJTXVb/XiePjVt3DcLZjB3EEjWVpDHvGqglMSoHYGDAeXpzEoC+vRi2birecMnjPyppctKIhv2lAp2qnaXMDbD636PaoHXCDSZcSYXiskjd6If+I78JqhhKOcO9HTLEweMqAyxw8yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::5) by ZQ0PR01MB1207.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 12:26:10 +0000
Received: from ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
 ([fe80::63d1:b688:cab7:50cb]) by
 ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn ([fe80::63d1:b688:cab7:50cb%4])
 with mapi id 15.21.0292.019; Thu, 6 Aug 2026 12:26:10 +0000
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
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v3 5/5] riscv: dts: starfive: jhb100: Add JHB100 base DT
Date: Thu,  6 Aug 2026 05:25:53 -0700
Message-Id: <20260806122553.182449-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260806122553.182449-1-changhuang.liang@starfivetech.com>
References: <20260806122553.182449-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::18) To ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::5)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1208:EE_|ZQ0PR01MB1207:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d24ced2-e5fa-4299-ffa0-08def3b5e609
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|7416014|52116014|56012099006|10067099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	8OR+e65el4pSHYGV3mvlAfyAoeYdOJJ3EIfF0HqR4eo/D8gToVlbCraViEb13y3MfdZ6Qni5vLf4bsMSHMlbASvCGxSLTv5Ohr2npLn/l2AycdZceauWWamYMuXOiGdJfRfPouG+nXwRDPK3OJ1PxyFXjtqoF3k2/pAoCO5Yfp8wi6BezlkkGS+HfpjmZkHAc6ClGLKN3jS0xLs2QN63S5gUxYwwWhOyF6437/vL3fpbjcEH68+hMtOOiao1QC2+C4HNxQTi7R1SgArwGFf/+tHdb8x8HgV6WVqzU+hcUlB5ACuAws2atAi59W2p+Xdx9h2v7CseluHd3pfY4jXRp1qL2Tl5Zy7wePCilaqJpqQlkfevdxMtiljTOzTJLBy7jrfc6I1GgmT8Mmt3wHxoV42lBaaUn+GX5R/VxD9tev3btsOtiTzG5xVZ4kEGQiR+C2RSRVHPfJbvuo4VAQDXo8WNdI99EDE22Yl0b0+XK/OB8iB9B65eI98hU4DhUlV/2q/QtvZJ5W6l/vYsFqav7edvg/qpj5q7WEhMKeR3FKbRfMbqqyAjDD6lT0eKD+3PqGiHFt2MYsFyzF3PTtJTYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(7416014)(52116014)(56012099006)(10067099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XD0yEi0VIKTgHpYoy3S6A1z9WXjIHvByvhT57PHYK+8OQUax7RnAPncqgbVN?=
 =?us-ascii?Q?5rc+Ej86/++jEfptG/CRh0PPmt7D6TmuZVZJWmoYFSYy/l0Ac0JoxhPWtDg5?=
 =?us-ascii?Q?BEs0PZbY4zXIxkFdv4pApLYovQlXJV0LCr4x4yOSBjxJvyjMhgX66LXFYU5P?=
 =?us-ascii?Q?3ZuGTOz21/BDS+9cCHa4Jrr2VWtuJrLVCHFUXycGvymogV8YSDoeQQTvWj8l?=
 =?us-ascii?Q?cVGKrMGc/IVuFbQdhFgQlGhYD+Etv+tKjJVG5LjbvBrybROrl7ui1hxP5eD/?=
 =?us-ascii?Q?KrJLglbBQWFBWmtgQUKKHsyd9I+HpnkUk5IczpBk/0jvgUz0WpLi4L78/Aai?=
 =?us-ascii?Q?9u1Gp/P9vKFe2/cKUFg0VVQb8/dlIEMuo+oSoVe1Tsnud6ey2D2lbHovKW6f?=
 =?us-ascii?Q?NIYZdz0w49T+G0JK6eJbX2AxHZP0OpxR9luU++gvHpGuIJyFSq01rB7e9esk?=
 =?us-ascii?Q?q+VaDJuSlrnXb2Enq0Oqich0ZHAB0qYaf01iJDk52Jm7tdlX9Jq9oNlHrqgn?=
 =?us-ascii?Q?HIgoe1dzgdJUGOvkgeM9TZxyJ29qqp28fnbDUKuZPJRSOc8A1SuiMXNsEyJv?=
 =?us-ascii?Q?wlpX94uQu5oN5F8q5GzXj7zNnH1G94FpnDfA0suD/i2ZVfdwjZNa312zHUHE?=
 =?us-ascii?Q?jbHiPi0HbBCfM1NE1r7JK3P820qAffGKN8FT36J0qqKV6+0zLBrDqBK+AdFJ?=
 =?us-ascii?Q?2WM9q9tW4Pa4cmaneR6WlKZ+zautV9F75fCiKYP/zUDL7jbRmLW7ceCCqZAG?=
 =?us-ascii?Q?z6+zQeUZlWKyicA/Aky7MLZulZ0QT1LpPW/cX/zER7Rz79FUg9D8AmEBLcYD?=
 =?us-ascii?Q?yOduroPNlcKfusigYTu3EfpbMkQSySyI25PAgfyk1vuAOnePkFQPJmYP6oHE?=
 =?us-ascii?Q?laltwIlhNVNolMhtAbOFfBjXH4uuYUctj1YUsm1+KkyNGV4EzhgtdxFRkyM/?=
 =?us-ascii?Q?d3yynvpQZHgEz2feVPCtbiSYplA6arSOB+3tx1BAeVVY/dQXQbJ20n+y+HtU?=
 =?us-ascii?Q?rR0vO23BpdRrqeB7LB9p0p+5CT1NmrUxN2cnzDjAgv4Gbfb2dADJS2B0wSbg?=
 =?us-ascii?Q?l8cNn/9BBFZ8sRbPI8CvSyDwjy+gfhaG+srtLoX3Z6HHwwp2rG0NtKJ3jQ3d?=
 =?us-ascii?Q?+W2bd32CVK1uzE7dWd7MMQLVSOsXKc75pv+WmHVZePBNPesxPAPkuTu49dzt?=
 =?us-ascii?Q?TDHMMY0jJ/2F6E48gYE8c22UOjQM1Jmgj7T5Q5NOpAyOvZgNeVqOuzQVQT1q?=
 =?us-ascii?Q?0q74fjOtl/PAFMVjoV29puDguzAoK0khKCRLaKfrBtelTaxbvwmrpZ1YQAHf?=
 =?us-ascii?Q?ApEnKdOxRfd59AuVSfSx6Z9zGjxSphFDG+6nG1t7INrAQvv1V/U+NNbM+ymO?=
 =?us-ascii?Q?UqTJhI/3/hd4Jy4rrC/GU4zoqlyZ/eE7Pe0KGjCWmVw2f/pYwOK3oHnSYcST?=
 =?us-ascii?Q?ciGCsvG26yQTYJA0oL4jmMtWcTz1LKjWnU/drHi2KwYy5+NE3uKRZLvbJHyX?=
 =?us-ascii?Q?T5r8xCynKQVkh9B5snfWGm6OitDGC98k1xeQmowBPOs+MRoy4K4q+4gCTQ0t?=
 =?us-ascii?Q?w84ezdkbop7ljaCWSnQI4xc+TOPWuPkB2xxyYR1Q756B5B/6lHHy9/R3Qa9N?=
 =?us-ascii?Q?cOXBxjuTJRuaoW9DnuYb8e6ZcL7qvu+P4U1FINoiUGW0SYBUzRKzGAtyCW2W?=
 =?us-ascii?Q?vDUKzB8XypPzxG5Mq8+uUDzEqSAyMEpwu6pVdWcsE5K+MT3LqJF2WQ1S7r4T?=
 =?us-ascii?Q?m14b6rz358RlTGCgmPhb37pQ9ZGgEUkTPm3vnJdwSm+dfGd5Kr5B?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d24ced2-e5fa-4299-ffa0-08def3b5e609
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:26:10.8229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KiPvb0Lji+s5xpsSj35uPXV8myxGA5rpe7dMJD6wjbQRNI99ZE57G4eP/ZJLCmnZd0fypHftFpBseTltvlPeeJe0XthEHlWTILldJlrJDJKnjOlcyol48BSPMUSOYK3y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1207

From: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Add JHB100 base dtsi and dts. Consist of 4 Dubhe-70 cores, CLINT, PLIC,
PMU, UART, INTC and 1GB DDR.

Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                  |   6 +
 arch/riscv/boot/dts/starfive/Makefile        |   2 +
 arch/riscv/boot/dts/starfive/jhb100-evb1.dts |  32 ++
 arch/riscv/boot/dts/starfive/jhb100.dtsi     | 331 +++++++++++++++++++
 4 files changed, 371 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100-evb1.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 56b337a06447..ce97de46e610 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26069,6 +26069,12 @@ F:	Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
 F:	drivers/phy/starfive/phy-jh7110-pcie.c
 F:	drivers/phy/starfive/phy-jh7110-usb.c
 
+STARFIVE JHB100 DEVICETREES
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+L:	linux-riscv@lists.infradead.org
+S:	Supported
+F:	arch/riscv/boot/dts/starfive/jhb100*
+
 STARFIVE JHB100 EXTERNAL INTERRUPT CONTROLLER DRIVER
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 S:	Supported
diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index 3dd1f05283f7..42841942fe54 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -18,3 +18,5 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-lite.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-lite-emmc.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
+
+dtb-$(CONFIG_ARCH_STARFIVE) += jhb100-evb1.dtb
diff --git a/arch/riscv/boot/dts/starfive/jhb100-evb1.dts b/arch/riscv/boot/dts/starfive/jhb100-evb1.dts
new file mode 100644
index 000000000000..462b6fb7953b
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jhb100-evb1.dts
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
index 000000000000..14ab83ed4482
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jhb100.dtsi
@@ -0,0 +1,331 @@
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
+			reg = <0x0>;
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
+			reg = <0x1>;
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
+			reg = <0x2>;
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
+			reg = <0x3>;
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
+	clk_uart: clock-uart {
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
+		dma-ranges;
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
+		bus_nioc: bus {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-noncoherent;
+			dma-ranges = <0x4 0x00000000 0x0 0x40000000 0x2 0x0>,
+				     <0x4 0x00000000 0x4 0x00000000 0x2 0x0>;
+			ranges;
+
+			uart6: serial@11982000 {
+				compatible = "starfive,jhb100-uart", "snps,dw-apb-uart";
+				reg = <0x0 0x11982000 0x0 0x400>;
+				clocks = <&clk_uart>, <&clk_uart>;
+				clock-names = "baudclk", "apb_pclk";
+				interrupt-parent = <&intc>;
+				interrupts = <26>;
+				reg-io-width = <4>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			intc: interrupt-controller@13220000 {
+				compatible = "starfive,jhb100-intc";
+				reg = <0x0 0x13220000 0x0 0x80>;
+				interrupts = <1>;
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+	};
+};
-- 
2.25.1

