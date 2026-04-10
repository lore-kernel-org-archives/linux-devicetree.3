Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2109.outbound.protection.partner.outlook.cn [139.219.17.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8C0223323;
	Fri, 10 Apr 2026 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775828139; cv=fail; b=ZfnDDoS2mgiU+fiWbzMyLu/h+1fvzGIm2+XqC3Xs9SoVurz0zH2FjRRJUAILUMCqLxFsGGVamqzORxBIzhs/eYwyZ+WU5nGnacHrO0FeB3ycjHJQERt7ufOInCTZl5UnXQSugATDnaFyZiTnQnideQRQu0u9thrYLsmi0EwPlAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775828139; c=relaxed/simple;
	bh=LiS7zBidJgJL5HiqbEjFC3705ZAdr1IddIHFNI4kvQo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ukyac5DLqoYfEBKpbEkXFO+6btX0WhEhdxCfWauH3EXbYS9F7mN990X2JDmuHzJtgktiPzgQOVhb+Qk7nkmQUXHZqpy1xTzZ4nBFREQ7fxDFkxIEMMMEfmJjqb/WEG4dLuC+0Uc8jT/vYOZWdwDT/SUHIKZ47y/SSdyyZ66ecd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8YJyQxtfnpfr8gcdGdy+h760vgfABmnL9+FYvN2X9kHaKyjU4P7EILhrCqnI3BZ3vrszbB1xLb6fCUVqqF5ITJdIMn1ATOsYbd/l8H5oVykyURu/5UWMoNPH/cTk5IgyeK/0bS9V0hOJFNqk85Kj38g73In0cLAxMN8f5Fc0o7CWekb1FcuhPD8XU3aSGwnxsSEs7kCbZ/VIZgbFH410dVTz6msxUqm7Qfc+SdDLwFXBNhNfN3tvgzpZLBWlev0bNAJvdDXHg8sAzta6XdITGeHevJsxTIaUqhoVqlHrTUd6/JLZWU/+iyXmthGthpLNqOughk9mGT+RF8BZ04Jag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7QHqJywyYBuCYEkhBAkzgv7c+ZKQ0vDbMfZ3yfMoQ8=;
 b=WGIdqkH9wYGKfEPYYrIAbnGaHfJFWIDefaT5TcaAH1wkuEE+DFvk5NURFFBL36T5pTTZoJ/PmeEIg5hQP7+UrrM6XFmlWmm6NgawSF45IpcL7Abub6MGPK8p1zBrpBGErh697KFhW5hdclx3+ubU3jDDeb3tfrRygSiFi/+PNE6HwxCgBekbvqSNdgTZZJTVTp98oMnqwo6TY/pEGa2Cp2vvM89LSfx7PgL9uEIskENSGnelYuYqfeT042i14/9jDggSEmkamDQ0pYhCudPlcHDyIpWHh2VOnOIWZkJCk4GbtJfKFZLPSWhXg7kxFyQupECn3BxxpqcLQVRHt08tSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1218.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 09:01:16 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 10 Apr 2026 09:01:16 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 2/5] irqchip: starfive: Convert the word "jh8100" to "jhb100"
Date: Fri, 10 Apr 2026 02:01:03 -0700
Message-Id: <20260410090106.622781-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
References: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0017.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::6) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1218:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b305e2e-65b0-4cea-9d22-08de96dfb954
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|56012099003|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GGXdK++5g3+z5AFS+0+LZJlDxPm+68LuM6AM7LbiEhh/Ua90zY5TXQW35WmqASJQdH6hcnFLZYh1wcU3SBLSLRCtuReNzNVxiTLfmfoJpUtAGYGJCF5KZJKsNbP3QffkpRFnj70953tfHwzWCdoVCHsLb1WLhLullSx53sCPesXtiBbq9YnAnRE6ZC0qIB4fFutTi7J5cYRm2Kw7ZJpxwUbh4kg66S4T124BIKs2AbiYvPiepmrqHq4xencIdMG7u6ApwHlWDDNBoNNaauZgK24jGIkFcmyVEDxyi77SbPOtcPRXQLDpaq/yZUWlO1GHSXs5KTqMvZHTsFgOD0AkWo+4QJWZjD0ct+BriH/hRWW37KIfvlFr4y3WvhwmYH6wWruFG2Vbny/VYU5I9UuC061m9+LDIGMddOtHUlASDII3fZc66YR5Ntu5DLnt2jnmO/ITg0IF6clusfY0Bt8dqiyHs3dbOZ+JIW3U3Os4o0V24g5zMMTZ9yho00TjRRCp4u4z7GbeuhMZ5pfs42eovp5oaDHvxlQdtkzakKY4dXnCwNxQ6I6Th7DIiGV53FMG4rWHhC+ED2HqrrllX9vab3HTv0yZhSODpywKb8Jnils=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(56012099003)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?67+YplaeRg4BMNIWY3sPRMiujTOcG9iUvFy6jMZeD7M26L9qOCxPXrskPZb6?=
 =?us-ascii?Q?/9F7PAXpKT2O0MqiXpk2KrdLH7qunYTsPZdrjxHQL1Snm/0kbI0U7KtZhJ9I?=
 =?us-ascii?Q?a07Qulkf+qJh7BPqUacbhAesfOICCToK0s4IZnk6p0+Y57ezkeAQF8dcY8hh?=
 =?us-ascii?Q?K7dgxi1jVxyl3GtCIWcDj3gL5JZzTuPTJ+FaesBNQNSX8UuXHLNdFLbMlOLy?=
 =?us-ascii?Q?/kmNwg/P23w213sIeFscMwmTw+hhyJwTgXeO0BoQmvKW52xXJ5WfiGEL3f0p?=
 =?us-ascii?Q?CV/DBG0u07i2JI5AAq+mxgpc9EhxMdwCIh6/+95BRlber18iBZ5/QhVvL+Ll?=
 =?us-ascii?Q?qiz0JNjy2EsjUdYWF+VWAMg0UbTNm5OPgRIyND0lhoQxaMTxpVLD4RQFHb2U?=
 =?us-ascii?Q?fSqL2w2q/lqDKHeyK+1zYuAE2DPqhv6gesNdD9JM7tJneZSQ9B4NTwkQhibK?=
 =?us-ascii?Q?sseeJ6Plb5UPG6ec8YJ5ZeQhTc4VmPFZO9T2mAqV4x4jTO5ym5aDqjTDDC/L?=
 =?us-ascii?Q?nUy1tlJygaD1Bjdy23PWVF60nrFZCXRRzaDPWBoMkTBdQTuVieT9rbhuDbuZ?=
 =?us-ascii?Q?uxdHTlSXd5AKhLfnPhA23xSCA19Y6CYbqlBUbtKmEPi1f3K/JwQKIhXHJ5bw?=
 =?us-ascii?Q?ENd8b35vxNZP0CwPM0Q8//zXyJFnxS3bdZN11llfeQJbM9D0t+bNgh0BvfII?=
 =?us-ascii?Q?wue7ya3XE+ljf/5NiIxsakwlSm+1+Mj//8jmt2OE7fa+SgQIrGjlq2SkpBA6?=
 =?us-ascii?Q?yZkxRs1gMyIwTDaLv0gbscBxlFfmR+dz+a1aIkKrjqeKudJPmN13KufTx4PO?=
 =?us-ascii?Q?pRY/xbXN1Fc8VM03B5e9FB/GIo6pTJ6xBWryztwThK7Cx2Qv3l9c7VImQmyq?=
 =?us-ascii?Q?1JmutQLy0q+8tilCm8mPZ0hFWYv0tGgiYK3ArY1xmt3t1rpm+WnRF5/lvXji?=
 =?us-ascii?Q?9Ww16OvvuoZb9YITzc2K/7cC0FvmcTG73RQRRBrx2VXhe+c+lUS5yRCFmmeb?=
 =?us-ascii?Q?PeZWcRH7aKk4OGjEpP0aeXWgP8mHiK+V7M+YiPBLoAmWZFL2lbFD6yUqtLMa?=
 =?us-ascii?Q?7smU3QV/dbyu4ZTSA8GGAkLbWW3gcJ39Qo3Fkz8h+zbE3pX7xD9PU1v0Dukp?=
 =?us-ascii?Q?e8TZmW/K4jOhKcsZMmljbA8m82Ihc3DIcLW9gmnnB8nbMpKv5uVe9JS99TLA?=
 =?us-ascii?Q?yNZdzBuLw4wAQSunV4b+XBrlWcJ4U+ILxiP2N4vYzNpaPWHITzFACMSsqb+e?=
 =?us-ascii?Q?tGg8/z3VGZzGi8jlm2ieJOecGTv/WTI6+bhhULqFVSCR1PviX4i7az5Q5GNW?=
 =?us-ascii?Q?sieGBLuLN2xy+zwlxPPZBfN/Ul7d+jxFJAkjZN+A/IHVVv11/OFg7Vb6qKCl?=
 =?us-ascii?Q?TdZqPvyNyJJ+PJyTlBrWn2GKcz4swuAQZx3Shx1T6CLg3nEcL3JXiFWRd0QM?=
 =?us-ascii?Q?iKUDOhyLp8sne+qYH6Qs+Iu93eIPdxUb3oeZVkDLtbJJBytM/8SPL62H8W3/?=
 =?us-ascii?Q?tVyWamudxAMvPMWUxIlqUCqsPb+9VNR4Pt/yoll/TfgiUyJdCY1B8r8kcODi?=
 =?us-ascii?Q?vJfUIt4CvnL/NxpLxu98rWAysxQToy7dF+HQ+l9k1o9MmAwjmI/Z9NH8LyOt?=
 =?us-ascii?Q?+CF9AWEQbCwypZmTIaM3faHZBCOc/PAuwxTobFPO59sR2DC0KJoMGFPpr5bk?=
 =?us-ascii?Q?hf1SzRaA8hfv5ScvLalm7z9yvDtvKcCEEXiQHFDlXTs1vp83SEzlmc8eqZWL?=
 =?us-ascii?Q?17Kt/ov+4fvhDcE4eWKVdiDiwwztQVUDiMrZGH9/yje2l4whdUeB?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b305e2e-65b0-4cea-9d22-08de96dfb954
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 09:01:16.5883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZJxGfEgzjNOdnLkbJdOZLtqfitRT/NQ9znKEVLgj4oGR9aZ2QIHj9B5on2JySEVSmgGOznjqDpqXFTdtus0ebQXK2ge0Ij5/XjFVW+KXO36Ej1FwMpKCGkqzU8ApRyM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1218

The StarFive JH8100 SoC was discontinued before production. The
newly taped-out JHB100 SoC uses the same interrupt controller IP.
Rename the driver file, Kconfig symbol, and internal references
from "jh8100" to "jhb100" to accurately reflect the supported
hardware.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                            |  4 ++--
 drivers/irqchip/Kconfig                                |  6 +++---
 drivers/irqchip/Makefile                               |  2 +-
 ...arfive-jh8100-intc.c => irq-starfive-jhb100-intc.c} | 10 +++++-----
 4 files changed, 11 insertions(+), 11 deletions(-)
 rename drivers/irqchip/{irq-starfive-jh8100-intc.c => irq-starfive-jhb100-intc.c} (94%)

diff --git a/MAINTAINERS b/MAINTAINERS
index a2961727e3d1..93cbe852ac0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25309,11 +25309,11 @@ F:	Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
 F:	drivers/phy/starfive/phy-jh7110-pcie.c
 F:	drivers/phy/starfive/phy-jh7110-usb.c
 
-STARFIVE JH8100 EXTERNAL INTERRUPT CONTROLLER DRIVER
+STARFIVE JHB100 EXTERNAL INTERRUPT CONTROLLER DRIVER
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jhb100-intc.yaml
-F:	drivers/irqchip/irq-starfive-jh8100-intc.c
+F:	drivers/irqchip/irq-starfive-jhb100-intc.c
 
 STATIC BRANCH/CALL
 M:	Peter Zijlstra <peterz@infradead.org>
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index f07b00d7fef9..697c6b2e006c 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -651,13 +651,13 @@ config SIFIVE_PLIC
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
-config STARFIVE_JH8100_INTC
-	bool "StarFive JH8100 External Interrupt Controller"
+config STARFIVE_JHB100_INTC
+	bool "StarFive JHB100 External Interrupt Controller"
 	depends on ARCH_STARFIVE || COMPILE_TEST
 	default ARCH_STARFIVE
 	select IRQ_DOMAIN_HIERARCHY
 	help
-	  This enables support for the INTC chip found in StarFive JH8100
+	  This enables support for the INTC chip found in StarFive JHB100
 	  SoC.
 
 	  If you don't know what to do here, say Y.
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 26aa3b6ec99f..c686caaa4451 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -108,7 +108,7 @@ obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
 obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
 obj-$(CONFIG_RISCV_RPMI_SYSMSI)		+= irq-riscv-rpmi-sysmsi.o
 obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
-obj-$(CONFIG_STARFIVE_JH8100_INTC)	+= irq-starfive-jh8100-intc.o
+obj-$(CONFIG_STARFIVE_JHB100_INTC)	+= irq-starfive-jhb100-intc.o
 obj-$(CONFIG_ACLINT_SSWI)		+= irq-aclint-sswi.o
 obj-$(CONFIG_IMX_IRQSTEER)		+= irq-imx-irqsteer.o
 obj-$(CONFIG_IMX_INTMUX)		+= irq-imx-intmux.o
diff --git a/drivers/irqchip/irq-starfive-jh8100-intc.c b/drivers/irqchip/irq-starfive-jhb100-intc.c
similarity index 94%
rename from drivers/irqchip/irq-starfive-jh8100-intc.c
rename to drivers/irqchip/irq-starfive-jhb100-intc.c
index bb62ef363d0b..2c9cdad7f377 100644
--- a/drivers/irqchip/irq-starfive-jh8100-intc.c
+++ b/drivers/irqchip/irq-starfive-jhb100-intc.c
@@ -1,13 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * StarFive JH8100 External Interrupt Controller driver
+ * StarFive JHB100 External Interrupt Controller driver
  *
  * Copyright (C) 2023 StarFive Technology Co., Ltd.
  *
  * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
  */
 
-#define pr_fmt(fmt) "irq-starfive-jh8100: " fmt
+#define pr_fmt(fmt) "irq-starfive-jhb100: " fmt
 
 #include <linux/bitops.h>
 #include <linux/clk.h>
@@ -71,7 +71,7 @@ static void starfive_intc_mask(struct irq_data *d)
 }
 
 static struct irq_chip intc_dev = {
-	.name		= "StarFive JH8100 INTC",
+	.name		= "StarFive JHB100 INTC",
 	.irq_unmask	= starfive_intc_unmask,
 	.irq_mask	= starfive_intc_mask,
 };
@@ -199,9 +199,9 @@ static int starfive_intc_probe(struct platform_device *pdev, struct device_node
 }
 
 IRQCHIP_PLATFORM_DRIVER_BEGIN(starfive_intc)
-IRQCHIP_MATCH("starfive,jh8100-intc", starfive_intc_probe)
+IRQCHIP_MATCH("starfive,jhb100-intc", starfive_intc_probe)
 IRQCHIP_PLATFORM_DRIVER_END(starfive_intc)
 
-MODULE_DESCRIPTION("StarFive JH8100 External Interrupt Controller");
+MODULE_DESCRIPTION("StarFive JHB100 External Interrupt Controller");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Changhuang Liang <changhuang.liang@starfivetech.com>");
-- 
2.25.1

