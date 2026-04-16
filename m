Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2138.outbound.protection.partner.outlook.cn [139.219.17.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705E237CD46;
	Thu, 16 Apr 2026 07:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776324124; cv=fail; b=CrjwxpDg8/uyxJuOGNJvIm2KdUIz+rjeWDO4mlz2KaDZIl/rWdszU3Fp+zCamLRFbmg4xRwT1ai26qThz/u4WRkTr43leBdtqesn7Z0RhlSeCgq5JqrMYe9CWb6k4XcB+anP+Jz2qfBQ9qAm+tlF8ZKMO/KvqnndnMHFAllqa9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776324124; c=relaxed/simple;
	bh=LiS7zBidJgJL5HiqbEjFC3705ZAdr1IddIHFNI4kvQo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PPTDzBWxfX1lWaxI6+zNIDxSr3uwH8M6XwOvpTH6alUdBtAB3aSjYeMdhUb6vp1y4A37+f/niyy9cz8pBNUkkjCWHQqyuiNsgwXxL4+/W5yR4ER01JUwvPQThh++FOEqF8Tz4utyFhJlGAURmgIrU79ZkkGgBfPsCG4xsa5XtV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAOraKNcewSnIC8rqlukqTX7w04D8CoQvasRy2LGH3O13tMWbOXK3OE6xSn/6xKqqj0fn2znPTGeWjjQVKAmBT52sdDjYJOkdmtWIMmNfg/8qQNBaiVhn2y+nrKNHcLRlV1oghdNNbTwLHBkDUcsXzdnRv/C+XBNqnIYn0x7tSlHq9JTj4XqgCMRPFwWA59Y7Prx6VWdQEw/4kCfwqW50fHLX3Ruf8G8UJ/QQ5o87kQIcuq7Bizcuv9VSblcmGZ5GcqMkHefI0pjEatC/cmUESknf7hFUa+xdDDd/Am2DDBpjI4l74FQj9YQW7aZOs1l0F1g3tVgmd1Eqv1Z8TmJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7QHqJywyYBuCYEkhBAkzgv7c+ZKQ0vDbMfZ3yfMoQ8=;
 b=eTivuPD5TRvjs8VTOZDN50DYl9bUpi8x02kSiYh8YZOkD4YVHSsJjjh472HdY42E10+moNzkvz4Uf965849kGw9SAMNk/wltHJx+790lLyGjLv2d1dARjDCCRXnaua28yLeco8NDtjNpcx/5ZIHGajQbob5t1HF3FPX58fqwWbVkKXlTP1fp7htxpShXKtDYJsvrWTc4VSY3x3nqhkbB9lnHoexNqSlXsCVDb9m4hweb1XBM8PewGgQcVuawaxA9SMZoZWFo2gUahWCxa0TWsodpPzjCNAhfWb8kJpalY26o5Ya0V/TH3fwnZsJ0867lWdMk0V/jgK/TXXlzxQ0Y/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) by NT0PR01MB1231.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.51; Thu, 16 Apr
 2026 06:48:29 +0000
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 ([fe80::1666:48e8:19e9:ad29]) by
 NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn ([fe80::1666:48e8:19e9:ad29%7])
 with mapi id 15.20.9769.048; Thu, 16 Apr 2026 06:48:29 +0000
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
Subject: [PATCH v2 2/5] irqchip/starfive: Rename jh8100 to jhb100
Date: Wed, 15 Apr 2026 23:47:48 -0700
Message-Id: <20260416064751.632138-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260416064751.632138-1-changhuang.liang@starfivetech.com>
References: <20260416064751.632138-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::8) To NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1216:EE_|NT0PR01MB1231:EE_
X-MS-Office365-Filtering-Correlation-Id: fda62080-720e-401b-c818-08de9b8428a8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	B0dBx6L1Xoa5D8kLcmKloi4mqsTfL4yXZNnTodevmT+XEsIGdTnLZPO4WC1zAEG31vPNsXw4Nq7mVkHVB+NEFLA5c7at6hMin9x9hE0TUHrHFQr8Y4EaFJnaClUspwzZfy5qE2D9w4xHLYL4J5KwRg6rgSfe/cb0jo2GFKnS7Yu5hgBHioaJeJQdLA/THj9r+i+7O/fHg7bmjcsMpVyMJQiECW0N8iHreSTkWA2P4O9lfNIXomisYJ8nd0j2yzJZ7XKSVpYfH1zT78Nka2G4U9isMSncr8mn+4fKr/wxiTgts6hs1qkxQFrI7Q/Ve7OZpZWiJ2KfRh+9NxPqsbOZsrr2JxpKVjKuIVHbcUvtmz8SjlXkM7v+HCVYi2Er4mxQ1khagvLAp7HdIvnyn9cqXLF5zRtW36pUZFQY8/2oW0O62Mmir7iiFMUmQBQKovYOCub8YL+OxGMwlBTAX7qMr8dUB763xkrstL+TVM0gvxJ6sQWW3zN+ayz0Tr8RMJz9k1IP0pjbsTxZXsZE6+bv4fNVadBUBWHoI5texn9CBdYnhfCQLr1bkU9i7DrZU1itzCOrtP4cWVkG5clCFIysiuYqkH9UZGLGKgE/cl8X6xs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8SmV4O6Fgk0HAC9/RtqT9JoINI5caY+fUeDO/6HtMGeQJgLv2+lLGmdHesMx?=
 =?us-ascii?Q?0vthFsTl8KkxYlmOtYVqQCbo1zNgvCmGS470ZuQUq0SR4fCguVAxsqk0vPPu?=
 =?us-ascii?Q?61seovVHF/YkaHeAXfKcJIWfbx1BbW0wJ5jfG0bYrK1V+WYdtgCER7KqOwe9?=
 =?us-ascii?Q?7gdiEyvn9eUEtB0WGi1/thKwkqEC23P/iXCukGvDLrcJqIq2Ux+FYR4WC2AO?=
 =?us-ascii?Q?qoVY4dd3oGdIM6wfwVxehey7kULUQid3WtImnpayob66RUnfsFjP90NmPeHs?=
 =?us-ascii?Q?yFCjwFRj+QTz02VwbPtH/49U74EGmU+k+uP+xkuXWTHNPiHlwOt9qvhACuPx?=
 =?us-ascii?Q?JOW1/j4TvDPkM5QsT+R+2u1HuEZXsG3j+bUi9ysID21H3gSmMotl7dDeeRak?=
 =?us-ascii?Q?bY5Ex0uj2hxyie0RE3LkCYlypRB6S/dGwn+if6YYjIZ8xeWlUvpURg93WU6S?=
 =?us-ascii?Q?1I4gKt5H3mRpVikj66UZABm3g4SoLJhZ0MKLGuhuut9J9ImFpkve7NDoEIXx?=
 =?us-ascii?Q?54U087e/VgFW0rtvea0m7IlHp8l8ih8F+BhKdiC+mmtucBUAxP+iOGoSfpxy?=
 =?us-ascii?Q?PNjBzu5vNHnZEJuWVcTsqRms0r8h67Ew3CiYRHKyOC3xd+JGm/i8/L9eT+RP?=
 =?us-ascii?Q?/yidyjFGKecUTfuGsOQn7GMujLj7wWwicNSVjokYLTJekqouKlpRJz5a5rYb?=
 =?us-ascii?Q?sXeuHYC+97bvrHy+GX2bylAarA1Tb4hcW0uoJbwryUataV8otxEiDpECBAbv?=
 =?us-ascii?Q?Hgcz2CCb/UDYT6yNru26yoW1iiidW8Mc6X+I3RP1nwBmFnZPeT4epGdrPCCk?=
 =?us-ascii?Q?JJtYKYGxv1ECWEvY9+6PtyUHvCVMFtNmygmlEzubiyNf9z35EBwcBR3YivAd?=
 =?us-ascii?Q?wUoZYfjAKu0kqOikDea8PkiaQsihXvuMGVw6Cdoyir68onccIYpMNERGVbC2?=
 =?us-ascii?Q?GoPxz+ZP9W/ySnH5OwwYtvBxaNGhB6365Ee22UU6ajgiRoBggrTSTtSzgWvh?=
 =?us-ascii?Q?VEnVXtm5FLEm3VvASnLsxg+7El0t5r4GUdmnlLznTeXjylRYcydT39nbkQRl?=
 =?us-ascii?Q?IMZNzx6NKWaJW+g2TvUg/L0XE2K3WC6xUR7RzVDd7Zg/OV4PCTnq8KW7TLhG?=
 =?us-ascii?Q?S2omby1LDtRE8HdLsSOuK00FqWUZV/w/EeGwENteTItjZXCqj6qjA/rSqABf?=
 =?us-ascii?Q?53gd9vAva3aYX5fjIm8Y4OZo9hj03F2PQxHbBW/+0Vz9WCCdfYuseRC3zdvd?=
 =?us-ascii?Q?b9/mE49I2Dup6RmM+8yoI9ekxg2W6UAFkMOO4VazSiIa2P2mU4DGezfDMiJZ?=
 =?us-ascii?Q?1THTRuTpbpkpasYjobVj0slRDvpNPxr/RRGIWgL0IlYbj3MhEAdOe0tB66zs?=
 =?us-ascii?Q?ZkeyNfOTNRqCzdrD+fiW7RlX4/LifjGj0mswvjLcLrco9q2IYn7Vep4oHgJX?=
 =?us-ascii?Q?uUVEOFwfb9CKY9E9CKS1YuuQiY25/UeqsBK+mpIrndvObN1ht1A5uLqXhHr9?=
 =?us-ascii?Q?uerF0rUNndZ3n6IzLQ1PCHxERVgoldC+Y5zjTYe1ZHoBLHAMiIuIX4v/V2IY?=
 =?us-ascii?Q?XN+vmMiJnvFaIQ8zdoG3EMl/nYlBcMgf9ItzHz0TuvjBd1+/u9W7bA3qVw92?=
 =?us-ascii?Q?k59VbTEJ25OUEze9Hr1/HNvmcn5TjsQ1dpPbI9vf7FZ39q7qLTMZvyQAOLo2?=
 =?us-ascii?Q?7VzVmT6Ib1riTsKS5U67+DaKojPEANsXa1izyYbDxiljA+e6WoF/AYOCOOXC?=
 =?us-ascii?Q?grqSvyFgo5RV+3ZxFSaiwIcTZZhHMC7GOON5D2UFZP3PGyHh3GlP?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda62080-720e-401b-c818-08de9b8428a8
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 06:48:28.0859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Inc1jbuKi8B4JNwBwoH1jPsUeHaid5IId8doWnerVaRyLIYbi1DwOSlZwhyW+LNttsIYtqRWSC39lCn3lnLbYSAYT2tLIB9ItTrksWz2hBAKUBELEnT8b+Nm4F5x6DwT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1231

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

