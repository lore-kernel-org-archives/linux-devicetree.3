Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2137.outbound.protection.partner.outlook.cn [139.219.17.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676EF39C006;
	Thu, 16 Apr 2026 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776332135; cv=fail; b=dAC21BDrbVnbJI73ozf529DV4KrrYxZXZ3aZM6wmyswNxyfozyC4k8seEGrx8bYMZyoqZ8dBshmCTSb+971ZDZHrpETu8Hp7LUfRC64+Ggzbz2RRDtrbD2oZVyiwZ2A/h77PcLVuxr9gDwqcFyG5TD/CREd2rrLg4G115G+hsnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776332135; c=relaxed/simple;
	bh=Sno/tq8MkA5VNY+3A0NgqMT7ysF2f244RpDjqjuKU3I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u7k92sf2xMCJId4mlFHnFZihl2q3ybp+QnPTK4wiIdELmsMczHuk3nibd1s7RfWDlyFrMwDyWZhbH49m1TnJxndJPR5RidS6M3tFxNaPCm3wCvkkom1hVPSM9E08z9yzvSrQneMcJvMcPaGzMgJ4YMq9tBr54UIjhdC51U0l/BI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
Received: from NT0PR01MB1231.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:e::9) by ZQ2PR01MB1225.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.51; Thu, 16 Apr
 2026 09:01:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I91zOmj1ENp/oN0XM/JIoaYGe1gy0uX3XvbPcno33IdscVXpDHzXXxXbLGdM4MG4C4EhEfrjYIEIlQSG8BoQy0dwMg0BdM1xuKPby1D0bcTd22I6UbjUKcjvVUDGmpEWYq/oylCjNjGXAKJ5IzwstOXQnmUbYU4MsQPJu7h7KfxrSPhmkeldfmHQqoGGPpW15IpEuhUcxH7dmz81k4khszrO1XGBnUVbyNy1rvAUmw6nMI2nwwC4nMteFETygMwVSU9nl9t/0y11T26CWf3+BrzG2+qq1JOpUxQLZkTG+a5WX0OUFhWeFmxT4Oj/o9v4ah2CzN8HTKR7jx+AMlNrFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtltmKOGplzEzrG09zlhDNKsckHkq+fdRC2gzKRIw5U=;
 b=WoLDJYHkBycTM8xxnvl6bwRKrs/fZv3JtH9SRPvUsIbiRrOpeBmc2DKCRcWmrX4Yfcf+NNq1mRMLujaN2dmm0oCnon9VVsqBi+bLVMKLBe4dH6yx9T7XbIvWT67Amp9fJffItBEieKedvD1dh09FKNBL2OjLQ0PzEotB/bGJGcXabt+QoqUAMF8fk+ijEV+Khv3om1Na1DkKeEQez9JPMYGv+ess7EgY2NMMfdLj5W6PmnO0DiVuctUbpY8Htq7SJVu9lKj1kyc0cWo1oAOHhih+RBR+/FX1BsMf30z/o0jhCoBG0xtnDuKaW/6dnGetdP4JHZf8Xm2IpbENwcEQ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) by NT0PR01MB1231.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.51; Thu, 16 Apr
 2026 06:48:32 +0000
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 ([fe80::1666:48e8:19e9:ad29]) by
 NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn ([fe80::1666:48e8:19e9:ad29%7])
 with mapi id 15.20.9769.048; Thu, 16 Apr 2026 06:48:32 +0000
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
Subject: [PATCH v2 3/5] irqchip/starfive: Use devm_ interfaces to simplify resource release
Date: Wed, 15 Apr 2026 23:47:49 -0700
Message-Id: <20260416064751.632138-4-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic:
	NT0PR01MB1216:EE_|NT0PR01MB1231:EE_|ZQ2PR01MB1225:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bcf45ea-f464-45f1-cbb1-08de9b842b95
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 /jjNneOWnhQn5Su9+xlWTaNikudlM50QwL9XwLJe79gaBjKaNHFXikFDQPadviRcNnXeiZAVNBJliLktihoTo04oRW1DMXInH98MGJl07JMH7S7qHAZuAHwUIyetfZvnV9HOOkGvNOzug72RW63gm5t3QI/D9Pg3NFCe2Q0QJhh/KJ8tDqD6fD0EUqdzV9rEJRgVcH6/kEF9IF6kV17nLYCuACM9/8VJ7U3uqjMF3sblDrPhjf3cMtMB/4+ljd4esCADT/kXFhJY6OdlwHhZ1LYpByg5TT9hsKHFy8p+3J4KdPZ6aM7oW6Jew2YUgphcizIA82oVBnW/bkNwCJdkZzbMkocT9Rt5cMDRrSRB+CZHACNA7jZRuckwJmWbkM6c6UaLU3jX8hpn+5tYLsFUH2efHET7GqzKRXJbjRTh7ZuVtNZ06P7lgoycTqVQfl6R4E8F1toLnvBIT9ma2EhMihdtvamlN1ApR5jjVjmof4yvW0TBBo3SpAFX5zoe0FajvstuNW54f36LHZzKQlQ/lAsDuocYMosT3iWn2ESRtf/HymQxH/4Q7j25nGtTzaZoPBEim6ls12ICOsznqL3h/HPPsIG13L/DY/aCAEkbDwQ=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?LNm+Tn0DgIhODUcJ5nME958EHrHPDq7pqtxO9+HOs9kVqIoiJ9fcQ8sV7v5V?=
 =?us-ascii?Q?Jlkj16JUiD3ae6mSe36uKy3qjdDsXm4UOC/BofoUnhUk3flhu1GSt80adE/6?=
 =?us-ascii?Q?jp7I1ZlQKtv3M6nMwolCfvcF0/P/2NcIa5azT54fJ33sDisvHBPdiQNQY8t2?=
 =?us-ascii?Q?4eGpOee3ZHH06FxYrVWsCFY9FpCTdyASKpZOtqodApxMBkQ6RuSbXipacuC3?=
 =?us-ascii?Q?9juIaCsw513TwAqSAT1seW78Gg7R4viDymLrxytagNtRetB9ohAuMhjQcGDG?=
 =?us-ascii?Q?Kr0xHo15cjNiUX+DpIWi5slnjzc2G28LlyNBPWgSTjBKKdBBL0LGrwBiWOoY?=
 =?us-ascii?Q?R0XHjS8FtaJc/ORtTmCuJ1k3rUhDltn7wsuJOEO8Vb3y9Vzsz2hG+sgnz9dZ?=
 =?us-ascii?Q?3MEYCjLZt+8hFhVM6PlMlBlEaERfi1cJPqLiqJMjUgnXaw5UK7sAprndVXiu?=
 =?us-ascii?Q?fZeTH4Z14cTt6SZnKpI1atASC3FNrouec+EHUSk6mNsni4A4IFIJGqscnTVB?=
 =?us-ascii?Q?Iaw1YpbUjNaBi6WxHHD/Q1bD5J4+rqTg0l1jlaA2OeTOm3J1eYH+On81VB16?=
 =?us-ascii?Q?47TP5/BsL4RB2D3GyK/YTyX9+z92gH+KlogSSE1ZSsCBqlYvq2XuSqZs6oCs?=
 =?us-ascii?Q?Ja8QkkX5lI6pjWVYSXl3oybXHVfbVnrsSbOvdmCtsK2DpP4GTCzk+6iqeAyx?=
 =?us-ascii?Q?ktFNEU0opO3Erh2Gsf2sMZ4azYWlggGJ9xb4UdnwSUusfTi31klObY9zcz8D?=
 =?us-ascii?Q?kvlJki0XN5Mp6gvZBsN8fYmO0ub90nG43/RSAq5pzbwKudZvf0IOFmeH4ri3?=
 =?us-ascii?Q?xczqT4XlTCTqWnIkyjQ4ydVZgRlqL0l/1x+hRw8340cFqxTk2yJDo+IP+3Se?=
 =?us-ascii?Q?4S0hW/nXFWbKtzu2czDHoEqprigcLcKknDNiezzt6De4VWvMqyW8yPt+QtJP?=
 =?us-ascii?Q?bHUt6p1c5uc+b3xnORsQdkPNG1yEi/yH8XVkZPwhGLnKFFbrKd9m6d73G20E?=
 =?us-ascii?Q?11sT26NnMvOePz42nCnxd1Y0XTRtRNiNME0Tn8MIxrxnmnXIkPRpHKmjK9rw?=
 =?us-ascii?Q?ftl4MyS+F/IbJST95XV6jV9QZAXZRsh4tps3agaH/kfD+IqCq5OI2ZEIoOpJ?=
 =?us-ascii?Q?DZT5XGXohiKOqeqvNpuVPkEOzpV2VLc0LCY6OxajfklYlyoiQcNON02nPt0c?=
 =?us-ascii?Q?bygXFGxRDNE55ziiLp/FFxVJlpIlS4PG4PZUkA+/P4IKNZ6LsrPc5pb6tVb4?=
 =?us-ascii?Q?0aqdoY7WAAJMqt+S1C8EDWxpt9HCfUO9w/aJCiFXYNSUOtFvJCD4WV6v1rVS?=
 =?us-ascii?Q?jmIIsbHYL/Y8/zy/XTA1Zm7d+Nh/fqTMF4J4G6/nMBqY3vHagEwLd33qDOLA?=
 =?us-ascii?Q?3xarXhDpC5PQ4CEA7zjCMs49CBrUAwVpMUee+mDaUeWU/W0wJ5HqX1rEKHUc?=
 =?us-ascii?Q?WKbjSfIKY4kyrgR4Rds2rN1OTEuCPOqdOc0BV2yKsZnvCLz/dltbAOpA877r?=
 =?us-ascii?Q?damZMlrYEDu2Gd0ZNNc8VD77IaOO231Y2qVdj49X8t3ZATfousRWx4wZe158?=
 =?us-ascii?Q?PTykphpNkwHD8R/Aaw2aSS1wvGHID8U472iTlWYaAfjvZzUHCj6RvyOSXu9q?=
 =?us-ascii?Q?d0v6/ihsIjcFuNgPpxegcz0MBBq/+ZPGtZj/Get9EBGlZO7C1R8GGSBLwM9I?=
 =?us-ascii?Q?eylCPQvpe0d1ixJP6FsBTwY60OVqokqrOvNEg+Rfz4gII11rB9Zkollw0Qn6?=
 =?us-ascii?Q?szBcucsXSfYWifEh5TYBKjmfCn7fAeiUX4OEDgASMJ7CZMRmhxKT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bcf45ea-f464-45f1-cbb1-08de9b842b95
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 06:48:32.7795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmhu3ILs3ucdZIAL7hLrPuNQiWTQNCF4uLdPb5v1nFDDdFUcdDrMhVeBfm2onCpw61jM1Y7W/+qK8dCXIy3m3WqVwUYa/DTrM2VEXTEoeXnLE6Hn4Y78qUVFFSRP55tY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1231
X-OriginatorOrg: starfivetech.com

Use devm_ interfaces to simplify resource release. Make clock and reset
get optional as they are not used on the JHB100 SoC. Replace pr_ logging
with dev_* logging. Use __free(kfree) cleanup attribute to auto-free irqc
on error paths

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/irqchip/irq-starfive-jhb100-intc.c | 77 ++++++----------------
 1 file changed, 20 insertions(+), 57 deletions(-)

diff --git a/drivers/irqchip/irq-starfive-jhb100-intc.c b/drivers/irqchip/irq-starfive-jhb100-intc.c
index 2c9cdad7f377..c33229b39a40 100644
--- a/drivers/irqchip/irq-starfive-jhb100-intc.c
+++ b/drivers/irqchip/irq-starfive-jhb100-intc.c
@@ -7,16 +7,15 @@
  * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
  */
 
-#define pr_fmt(fmt) "irq-starfive-jhb100: " fmt
-
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
-#include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 
@@ -117,85 +116,49 @@ static void starfive_intc_irq_handler(struct irq_desc *desc)
 static int starfive_intc_probe(struct platform_device *pdev, struct device_node *parent)
 {
 	struct device_node *intc = pdev->dev.of_node;
-	struct starfive_irq_chip *irqc;
 	struct reset_control *rst;
 	struct clk *clk;
 	int parent_irq;
-	int ret;
 
-	irqc = kzalloc_obj(*irqc);
+	struct starfive_irq_chip *irqc __free(kfree) = kzalloc_obj(*irqc);
 	if (!irqc)
 		return -ENOMEM;
 
-	irqc->base = of_iomap(intc, 0);
-	if (!irqc->base) {
-		pr_err("Unable to map registers\n");
-		ret = -ENXIO;
-		goto err_free;
-	}
+	irqc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (!irqc->base)
+		return dev_err_probe(&pdev->dev, -ENXIO, "unable to map registers\n");
 
-	rst = of_reset_control_get_exclusive(intc, NULL);
-	if (IS_ERR(rst)) {
-		pr_err("Unable to get reset control %pe\n", rst);
-		ret = PTR_ERR(rst);
-		goto err_unmap;
-	}
+	rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, NULL);
+	if (IS_ERR(rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rst),
+				     "Unable to get and deassert reset control\n");
 
-	clk = of_clk_get(intc, 0);
-	if (IS_ERR(clk)) {
-		pr_err("Unable to get clock %pe\n", clk);
-		ret = PTR_ERR(clk);
-		goto err_reset_put;
-	}
+	clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "Unable to get and enable clock\n");
 
-	ret = reset_control_deassert(rst);
-	if (ret)
-		goto err_clk_put;
-
-	ret = clk_prepare_enable(clk);
-	if (ret)
-		goto err_reset_assert;
 
 	raw_spin_lock_init(&irqc->lock);
 
 	irqc->domain = irq_domain_create_linear(of_fwnode_handle(intc), STARFIVE_INTC_SRC_IRQ_NUM,
 						&starfive_intc_domain_ops, irqc);
-	if (!irqc->domain) {
-		pr_err("Unable to create IRQ domain\n");
-		ret = -EINVAL;
-		goto err_clk_disable;
-	}
+	if (!irqc->domain)
+		return dev_err_probe(&pdev->dev, -EINVAL, "Unable to create IRQ domain\n");
 
 	parent_irq = of_irq_get(intc, 0);
 	if (parent_irq < 0) {
-		pr_err("Failed to get main IRQ: %d\n", parent_irq);
-		ret = parent_irq;
-		goto err_remove_domain;
+		irq_domain_remove(irqc->domain);
+		return dev_err_probe(&pdev->dev, parent_irq, "Failed to get main IRQ\n");
 	}
 
 	irq_set_chained_handler_and_data(parent_irq, starfive_intc_irq_handler,
 					 irqc);
 
-	pr_info("Interrupt controller register, nr_irqs %d\n",
-		STARFIVE_INTC_SRC_IRQ_NUM);
+	dev_info(&pdev->dev, "Interrupt controller register, nr_irqs %d\n",
+		 STARFIVE_INTC_SRC_IRQ_NUM);
 
+	retain_and_null_ptr(irqc);
 	return 0;
-
-err_remove_domain:
-	irq_domain_remove(irqc->domain);
-err_clk_disable:
-	clk_disable_unprepare(clk);
-err_reset_assert:
-	reset_control_assert(rst);
-err_clk_put:
-	clk_put(clk);
-err_reset_put:
-	reset_control_put(rst);
-err_unmap:
-	iounmap(irqc->base);
-err_free:
-	kfree(irqc);
-	return ret;
 }
 
 IRQCHIP_PLATFORM_DRIVER_BEGIN(starfive_intc)
-- 
2.25.1

