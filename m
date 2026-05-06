Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2113.outbound.protection.partner.outlook.cn [139.219.146.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5543F54D1;
	Wed,  6 May 2026 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778063688; cv=fail; b=fi12Oa6OcqDZ2OCuqQiT4FpbUwpZL67YqFj340W3irs25gq5Pb04F9c9vkyQhmtRFqw11JZ74wY1Zz8hAYCcYUhKXYa6HUbCt0J3mDPNuZGqlaUKN7TF0ydjhEJVlJD3HiEPE/1tQLepAdgSPIEkcloex73Kd3a6m1RAFd5oo3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778063688; c=relaxed/simple;
	bh=a2kYXQk1CCEhgOp5/l9Fhd+vqWmoADvc2PwdQdf5+jg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gDMwpPaLuD2TF77o+0PjZ6I69It7Dwn/lo6YlctngxlqXGEPKTcRWJqS6fkhCbW7x/t72c9/1DBsWT7sbITtEobVQjEQ7sVI98NepRUQVvye+Jv3w9eIoNivBMEkHFddhxc8i0PexrjUKFXL64Hpg4sQL+zBZQBd/aBQ3W67CKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJORXmv4ruKDVY956NTnsIKv0GkUPI0Gul2gpXuUHI/PfUNZ1E95owBzbi9hjImecX74n6qzvYyVwxK5nkOrJnuB29GnvuHqac7T+Qr0JKBmKGdlPkPNgU1wplFhM6Wrq70IwfxtZI/ZulMEWSqtEHIPmijZ/dzymFxV5+CRtWSOT1MyBtboAfR/7f+Z1OhW4M5Mj9YXFEfQ1srM0eE5UgFj65WZP2flJwoUT4Yg8gCG5LTDGEQAFXbIFVGJbOS95cb5I0VkxOInM/KRmwiDZ4O/WKnUUMpmme/foqDVCnH1My2L2GxjA9YBRQDOzriFlxQyaZOctk1KGezrA8oS2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsTj+aoc0+ExI40nUrB0nnEBbyE4/0jmewMTsXGTDqY=;
 b=kY9aLNY1/AE8c5Y02gPKxMBqJDVn/QX8KQdqmBDbThNbZrOiWKtjsDFXLjalzeFYhWVNyH/tVknWuBOO4pY/ob/IkCzD6zXRog04eF74cBLJtbeRGA9spRly8LPsd0ZWq0jb80ZkXB4wtOm8xoaPlTJ365RpvOo/AFloqXfkbb91lcPhP5bFC/4fWvHewLRUEX8ICDGX1v6CBWTzjpIO3993/VrtP6XMaAzo6d49wmIj63eYpiLe8bpqbQMMUp0tpTKH2UVIl2Ju/7GaGy3LqNNS1LokC7bR4jAy/Oxdpjn0w3DLQTFW35QaQ+bNfw06mEjxySnKljwiA7rNST/bwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1171.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 08:59:55 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.008; Wed, 6 May 2026 08:59:55 +0000
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
Subject: [PATCH v2 4/4] riscv: dts: starfive: jhb100: Add JHB100 base DT
Date: Wed,  6 May 2026 01:59:37 -0700
Message-Id: <20260506085937.754808-5-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
References: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0011.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1171:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ac75e7-6267-43c9-d952-08deab4dd790
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|366016|376014|921020|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	RmltUCV8hSNBhveKL9coDeq9B74IVO6BqzsD3P3ZraF1kQYvQh91ZXpeJ1yO+1b16mDOj4HM2OMxgw9pkKJ+ez18m2i7zWM2k6/fMxBnRhRPyJdxon/PgEaJGKtanee6aCMmpfm4mLyGbUS+Duec74pbMzdkWGSoZswVBRU3t2FFkQLse7YKOybtTZeGZt2FizIdieQjocMHFn7Enj3WLUlHVWL5JceJeXNUlwwUSwHES/dgXC2ga0ULCfHPfFPXbXezw49XnCtm0K3Z2uzUrcAZwJK4c+6uVTSyJrJPKyWdnGJw0kR7jrtsgvM7rz7c6oFio2JuhDl3btd30u2jw3B31hxeHCSnYWtRBRhC56OooPjE2QuEU9MpJAcNtNFwSd2TMwkvPY3jFG5/bYG5SjSWiW/ZATy75HiZsNq140QqgaEo7EDYkFI50/O5oun2TFTki/EOUR1ZiR83c9g8sF70AjkkNpCL3GsH2/ZFFRLvsgxioKhUBE5sMd/YM55mL9vLmsWb5B1JOTN9M2IbKzpE+mR3/qqLPJt2UwKt1GdxLsPmoQV98f5/AiMkdnjyqtRk6qoMuDPlWB5KgqljcA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(376014)(921020)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eNHP/MTb9lCXaIxp4L/duslERZjYJFYJqMCxtMMtmnqAoeu0f1fKlooR2TLP?=
 =?us-ascii?Q?6TPduVzqt+2eIMvsM0zJMu3+hpo5E41SjJjpiR+DiYIPK+uq2H9HSr+IInOW?=
 =?us-ascii?Q?WEkLRo46wNbm2i/rOKESUpxEsJz9yhbQ421VI6XP/Q3cLCCj64cevDHiv2/V?=
 =?us-ascii?Q?SEVKkyD8kmKiB8urh5+aD+h9bFHniPOAcpWm3uOw8mQ+AdhAj12inX/svUMM?=
 =?us-ascii?Q?EIGT9tava2dnigZkwOf7BqZyMHEGxFgzM/c0xtRZ0iVsKRd1FAP5qByBRmdK?=
 =?us-ascii?Q?IiRTm2bVCp9QxgUfkXWLBsiuPj3Hylk5AqOQmF06p9LO23O4E/tSq6EhOou9?=
 =?us-ascii?Q?h2GiQgopvH93qZrnqAxApY0zP8X8a5vEM2tYZB7R3woMIDpC6+stonmyxBXy?=
 =?us-ascii?Q?AZP41/ZSXp1fR4GbSlrT1HqEqA86eZ16p9Bcgw+CMdCgjqxXUXyXq8PYWXuY?=
 =?us-ascii?Q?l3kQ+F+tDRmlUWoHYi3h0MGKvzt28AgY8uIuwtrGRSUUMWEoRyDmAgfr5NUP?=
 =?us-ascii?Q?twHHJpDp4DsAKTKZqocE8+dVVqW+48Y89PSia7FD9G+e7AeYORvFLBStfrEW?=
 =?us-ascii?Q?3q44VzDOjqaVKGp4g6gxaheFEQjKnmKePvTqpx8NOWg7IJGOiL2KkL7FqAfk?=
 =?us-ascii?Q?AdEy1Xvr4BTZBEECKeLN4Pkcp9gocEy7i9eZZ2yA4OHb16J2sIv+BtcFRY1P?=
 =?us-ascii?Q?hvYkBSJ2iOEws6CvBzorIGuBmWidsid1/q2dicL4Vinyo5EMZzfcL0ZZyJUb?=
 =?us-ascii?Q?blFAXuboABOb8skY3MiAX7YAo25dF2RqifVoYL7WXS82UFhkSYGNFGVP4WOL?=
 =?us-ascii?Q?rfkiB1cCl/Bv2KyygXyhQWN36KAmA/m/HM82RrySJQRodIT8c/D/Pq29L44a?=
 =?us-ascii?Q?RBO/46dHYppv0nezRbO4KxxzFQcZqFRaAMqAYCVMEplhLhpbe0PMKNbUkTAO?=
 =?us-ascii?Q?z/y8GMY0lE2RYuysgZX7mt36aV+l8mdiasR1UhbkEL+DC1pz71Xaeehe7rRZ?=
 =?us-ascii?Q?59fMnflJnc1wYQVEyq9tMghnvIsXf2nf3ZW9Uu7POnD368m6MWTb876QmTR4?=
 =?us-ascii?Q?W6XBM8j82mdPo/WbJyrnaCcjYSHac78N28QC4DZuafrgmyTvrWW2ePSV5EpM?=
 =?us-ascii?Q?P231a/DngwzUj4ut4ncW19OEH/Caan1CoHIz4lXznPkfI6ChClcqX76YDGxX?=
 =?us-ascii?Q?ohptZqJjepZhboyjVa0mctG0Jopy3z1HKyVA8TEbmFfEzLJGS5gWoZJ1VlQg?=
 =?us-ascii?Q?5meogoKWmN+rDC7s19Sr5b3hZjd9o05Ua9f6rKNemsYFYjgcWvlgZdydxNWk?=
 =?us-ascii?Q?rIw+Jan1aZ6Td6I3F1VStQ0LWtPZd014lZDjrWUoj67zviJFZWvitXLdGTYF?=
 =?us-ascii?Q?xYVP9v5ji2raFzZquoAk0l5o1QViH4jEYEZqA4Wo+DkDKYyCeTazj33B+OY5?=
 =?us-ascii?Q?a47+CVm/pWcucukqUaJdQc41zj0gnEzQCavS8yCce+i5DoQgEm0dA+ea1CCw?=
 =?us-ascii?Q?M7jTql8n0opSIJ09UfKQ6+dxLJZDIaNQMFV/vCJ4082PAJqHSW1PCEBAf549?=
 =?us-ascii?Q?VYZ2jz/VtV3JCkXRfK4YlyJ0KuqWN/66XB4m6Qy2JDJu85vYfVbdlHF+6r/D?=
 =?us-ascii?Q?YGteVMsS1TbOr7nh3gCTcKZ2flO/+JH3gvWvLjfPiLdysn5rxy9f2L46i8yl?=
 =?us-ascii?Q?Jnsj0Hhuj6K7t7b5HSn37qTRxZZdBxbh4yZ5aKarmpOgRAu9PrHQ0mwKkG6A?=
 =?us-ascii?Q?T6ag5g72vD+k4c3tyUTlSB1xSymNvJ9mSfUvSuTUUg1hKR3oI73Y?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ac75e7-6267-43c9-d952-08deab4dd790
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:59:55.2618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NU8RusicLu7Lw+ufouaT4AOOL1Su5QPr9AN3lhNNqdCMvApnuY71WwzAIxs9AzF8bVm9nHp4ItCMHeheLDBxqQRlv7lbenhLsVe6KE+4TAHv3j+wvu0seGD0iq1GtFLL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1171

From: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Add JHB100 base dtsi and dts. Consist of 4 Dubhe-70 cores, CLINT, PLIC,
PMU, UART, INTC and 1GB DDR.

Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                  |   6 +
 arch/riscv/boot/dts/starfive/Makefile        |   2 +
 arch/riscv/boot/dts/starfive/jhb100-evb1.dts |  32 ++
 arch/riscv/boot/dts/starfive/jhb100.dtsi     | 337 +++++++++++++++++++
 4 files changed, 377 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100-evb1.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 0dfad67f66c0..22e34d2ad696 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25588,6 +25588,12 @@ F:	Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
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
index 000000000000..4133ba1f45b4
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jhb100.dtsi
@@ -0,0 +1,337 @@
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
+	clk_uart: clock-25000000 {
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

