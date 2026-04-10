Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2092.outbound.protection.partner.outlook.cn [139.219.17.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8310238736A;
	Fri, 10 Apr 2026 10:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775817248; cv=fail; b=cf2jYBCh0lvRUG90gzmNtGc/m7Fs4ULwBGoEiePlyShdGJoRt+2nvwQcVNg1Tq16Eq61DXhNCQhSu0CzhFAz8aYIDYBmtAUYBw+PNTG0UBUmiAEWIevDJijmpAXv3J7utc32eVSdnrqU9Mb2PVEoTXlNHh8Zc1kRlxkxhFjsSgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775817248; c=relaxed/simple;
	bh=vykxvldXZ4VIDz8tnQBa/yesN11pNCyqvz9jvv7K6Ys=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GUSgAw3Gd05U0VP3Nb/Bn3sUYje5meYjYL9Lf+/qshOeYaFrsXBNtb1LtNcIR6pIvm+McpeYHl2jHWc5C6pbiWDcUs6fs7Qw9lYAhER6C5uDRqWP6tEQ1oy2OwrOX3M/zbHhMzO8ohgCApHEpS+Wef4k/jqjizvJ7PRh94r181k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQyI62SfYDpgcbDY60iJ7+goYunLzMPN9rbc4JufYqbPKU7mkEFTy7XMvjJXG0YeSGSRErBltNsz+RKovIrM1UVv+Ppq3ZGdc449tyn3qIGCRQ1JTUQE0aPllMmMDCgzkjK2rjEiayeOCTUQArGNyOc5ZGlbc4HAzWaxd00o95EEe13flCyOPdL0hXA6o2n3Fz/RZlkjfOlbUvdi6qk5lWgebc7YxxvDqwcUU4KVoXXzEhnjrC1IxR3GuanOxcydVWeQH+34t9ZWWJZgjzqK8TbRuTkBMOnWb8yWdyjDXU0tGom7AUgi0zUEnuc6G62f7ln6pt2uVxr28bKz/YMgyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFOh+h1iu7oVJvNxrwfU17kQyzMdni2BEZN3kgQvpoM=;
 b=Htc99AB8mUdAWbQVLQTiMJ8A15AawW6k+ehSm1sw9Q6mL27Ipd8m1hQMqlSJYERvl/mDmTUgKpDYQ4yUtq3lzynIetFxImJezCwMEHMNk/KEeKfNe3hUEZHjKlimCUYbKoS/u6Z2geg0hcgZBdaiQ5amDh1VMBxd7l7xfqaf3grjolHfrTL7HpsM/0gJle1qu1/kG08WHTnPV8Az+pmy8gotqK0vG26JnTY/gsOb/O6+N16VC5gmV8ZjCCKbiKIHc59j1FOPqZEThlgvyauxkn8upjDNtVe9ia7BT1GRM0c35wwJTgNCEZSfzuB7qsaxQzbHy5bdWa5rqrV97r3L+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1218.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 09:01:18 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 10 Apr 2026 09:01:18 +0000
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
Subject: [PATCH v1 4/5] irqchip: starfive: Increase the interrupt source number up to 64
Date: Fri, 10 Apr 2026 02:01:05 -0700
Message-Id: <20260410090106.622781-5-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 129d65b3-43fb-450d-445f-08de96dfba7f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|56012099003|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZFgQpoG2xOxHczCDE8hLeTZrarwAuhjx+AhXnVmbFJAvD0F5n6N4LjAK3xf/aoThuimtalx4dbXYlK1qWMxkn0trhElUQnRFxEqbzBzG/Ch5iEgwLesYFMh1IhoLV7Lba2J7xGF2z6YgSrPDs2glY5MwBNUV64tIifZ8FFxZFXuZQnQ4f62mUwzC7zOE112gNbEfrUq47oViSHyCXrQwNWpSV4S6eLXXbWKTXI+gL5c3xDibei1ghgpVAiMrv6qjDbFdSnlIQabq9i7MywGdrgFiU6RILxH6xrHE0t4ec3Pr05nV7qJ5TlZkKJrJqzsWWkiGFpdb7dtyFJ/z2yty4YpV1SqLVbuMUymJ1VoJSjWU1gvL3vxGbfDph8SqjH6tkkwiTNSGYJE11HTojD+OXA4yRYXa+OCqQRt0PmiIsuA8yIUBSsgbZb4kPL5irSOCfBTQSWHLb5jDB7heGSGHyEsVmk3K7ZpUz6cRj9IxlZtsSnEzQb8m8jQeETsNgXgnifVh7yMQnXrDvyoMQ62nvNIH3x+hIH5fUAjuNHbHR+JBzT0lDU0RLyiVRYbH7ix83RUJeivMJPWNBHJZmghG6g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(56012099003)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U3ivJu/IIsQ70n7HYEp25l3RxCS20a04N8Rjb4vYnwsYVgimHxgi3lTlUAmH?=
 =?us-ascii?Q?L8gzMWEQbaL7VbWe9OyhRLVP3+MOOb9h+jVUhfdq+9XKmR0/TtSjeOJFAliW?=
 =?us-ascii?Q?PHOOf7odZcXRXVV3KAAban5Iazc4HGFlNeto8N2kjFAjFqyG5Ydm0hiajLpF?=
 =?us-ascii?Q?sSaULEsMw7E9tUL4kf9k5zxv48k4n1gS0lq4bxxdVHdeOP6RqFgeAhGJ9CCE?=
 =?us-ascii?Q?vFk44UDFAVbiYLDd9Lt2O3s2nU8QQhLdjDUW5T4pkQail9Szp0xU8Hn1k5qY?=
 =?us-ascii?Q?iiJo9uj9pEKUVNFFKx27ntrQELCDU7vta3O0v1C1DYgWADmTGNx6KdicWmHQ?=
 =?us-ascii?Q?ZLRqNZvx5qt2I8Qke1YZzxoF3UBRSCRzFoNj3D8VSJxrBct/MjwVjlZsqUQR?=
 =?us-ascii?Q?hHc924BGZa613NM+lRb5Bs9UQn+vdaqGPb3vc1fd+BA68fx6pxPrMGzWSpEp?=
 =?us-ascii?Q?IfkZPueoNSp3TRvhO7DgFZgQMusAj3eHmwvipDF1/Bv7HaYPI3P2pB1o8LRi?=
 =?us-ascii?Q?A5J+hSMh7EsQpsZdwJaZhFfv9ruN8kSBswOMSC0ToMvwREsR25CSA8K4zMc7?=
 =?us-ascii?Q?mNgBMK/CpTXqS15nI+bpQDdR8/CAtyYMxYPUtpCH4O9GgZphZ/2zOtwmzwdF?=
 =?us-ascii?Q?ov9Hv3HEJaO7V4tI/2TcO8qFCvooi1CB0moP2a84/4/Yv1uRa62gDTU6bpHU?=
 =?us-ascii?Q?gK64XIy1Xea9fXWzWMl8fN0Urff3WKA/Sp03KjQWnAvz38nnXhbf/xTjnSbt?=
 =?us-ascii?Q?+SyN9trEXjiQDFJuLNC7tc+NyqEnFcp/7gzq6Z2VZJA8/NcSLaojYk64LMO7?=
 =?us-ascii?Q?7gLGJ8DFodb8hIZFNadaVnqkYgY8Tf3NGVsygTVQYlnGnujdEhGRsrU6Ecy+?=
 =?us-ascii?Q?9GJpY1k8QoZI0XOZD5TH3anQ5Z+d917wlma1hHLvr0h+jpA/zL1d7p6eyTqM?=
 =?us-ascii?Q?i5jkLwJTcaFR3oUxxVvYHA4Rtc3ia3mGjl3PAmuzSGpaDEKMB0AJpkwdakv3?=
 =?us-ascii?Q?Zc88+f0k86clkmd53+g5Udypm//acd2eVk6rNwoAGieDZQC8H3Y09qt5CFFW?=
 =?us-ascii?Q?DBKhqirxYndH+V+mUONX/5uT2aN29yZLXGdtBk6bUUhCVyvGlDqa/wbr35P/?=
 =?us-ascii?Q?A99j9ceDI2EoSn7/9UbiNqlJCPQZyD9sneWhQu8Eh54H5ujwI7EaVETj0iyS?=
 =?us-ascii?Q?ilNfPHWsaOyLOxTgSdjLdTMVVdwFn7STz9jx+pAjkYv4ogyiQCl05PHsbNZM?=
 =?us-ascii?Q?vmMK9tuNf0nQWwppJJy/bUegdYXg7x8751bJ4k/xuzRtZaU3JK92s7/+s1Fa?=
 =?us-ascii?Q?aguFNpaIj0hh10wggT32X/DC7vPAJGM8BiGOwj2H0y3QwukX1kJ/oi5FW711?=
 =?us-ascii?Q?hJC+go1s9C0tbFl84ocvQ0gPA2K0IwvID2ojxu0smScFVdUe9YZD1BKcXPTo?=
 =?us-ascii?Q?YbWepIgrUt5bjXWsjP4tMDojKGNI4jJvEe+wFxdfLjfg3EmWSMODE6TUXPqK?=
 =?us-ascii?Q?fPys0Uv5MalLbv0T1tCHc05nOVoaL4ml7Ji8M0/zIZ0KKpbRb8HvW7EZvGqh?=
 =?us-ascii?Q?TE4qzs/WZBgA9WBWZlIqbwVXjvoimq8fpMHY7DVg67SGR4liLUUzoI73d9Jn?=
 =?us-ascii?Q?+dkVCxN/BaIK5jMcsiu6NbiXqHn2Na4ghq2lg0wSGBWFH2Zng0vHpAu5bUoY?=
 =?us-ascii?Q?dTREfWSip59xCOlr4BBpmVVHrz6FYcn7xivMVhONsjZadrnwuAk3/WoFL0on?=
 =?us-ascii?Q?n9tnU1BRJlWng6OpZmKqrIVTYCmAwew3OJeiFW3qR/psMMotPO2X?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 129d65b3-43fb-450d-445f-08de96dfba7f
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 09:01:18.5094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxR/i2iz8z0rBI+Eql9ZqsCVYHHA/PeFBb9p03KNbSVJmw4RJGeSgNnmH1Uu7jvN/mI7hwwgQfn9jE14HENSDfmFUWn6RIQ0yG9xIghZrt9gSlCRmLjw+WrxvbSvkIoG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1218

From: Mason Huo <mason.huo@starfivetech.com>

StarFive JHB100 SoC interrupt controller actually supports 64 interrupt
sources, the original code only supported up to 32. now it is extended
to 64.

Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/irqchip/irq-starfive-jhb100-intc.c | 43 ++++++++++++++--------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/irqchip/irq-starfive-jhb100-intc.c b/drivers/irqchip/irq-starfive-jhb100-intc.c
index 312a4634870a..d5ecbb603a58 100644
--- a/drivers/irqchip/irq-starfive-jhb100-intc.c
+++ b/drivers/irqchip/irq-starfive-jhb100-intc.c
@@ -18,10 +18,11 @@
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 
-#define STARFIVE_INTC_SRC0_CLEAR	0x10
-#define STARFIVE_INTC_SRC0_MASK		0x14
-#define STARFIVE_INTC_SRC0_INT		0x1c
+#define STARFIVE_INTC_SRC_CLEAR(n)	(0x10 + ((n) * 0x20))
+#define STARFIVE_INTC_SRC_MASK(n)	(0x14 + ((n) * 0x20))
+#define STARFIVE_INTC_SRC_INT(n)	(0x1c + ((n) * 0x20))
 
+#define STARFIVE_INTC_NUM		2
 #define STARFIVE_INTC_SRC_IRQ_NUM	32
 
 struct starfive_irq_chip {
@@ -53,18 +54,26 @@ static void starfive_intc_bit_clear(struct starfive_irq_chip *irqc,
 static void starfive_intc_unmask(struct irq_data *d)
 {
 	struct starfive_irq_chip *irqc = irq_data_get_irq_chip_data(d);
+	int i, bitpos;
+
+	i = d->hwirq / STARFIVE_INTC_SRC_IRQ_NUM;
+	bitpos = d->hwirq % STARFIVE_INTC_SRC_IRQ_NUM;
 
 	raw_spin_lock(&irqc->lock);
-	starfive_intc_bit_clear(irqc, STARFIVE_INTC_SRC0_MASK, BIT(d->hwirq));
+	starfive_intc_bit_clear(irqc, STARFIVE_INTC_SRC_MASK(i), BIT(bitpos));
 	raw_spin_unlock(&irqc->lock);
 }
 
 static void starfive_intc_mask(struct irq_data *d)
 {
 	struct starfive_irq_chip *irqc = irq_data_get_irq_chip_data(d);
+	int i, bitpos;
+
+	i = d->hwirq / STARFIVE_INTC_SRC_IRQ_NUM;
+	bitpos = d->hwirq % STARFIVE_INTC_SRC_IRQ_NUM;
 
 	raw_spin_lock(&irqc->lock);
-	starfive_intc_bit_set(irqc, STARFIVE_INTC_SRC0_MASK, BIT(d->hwirq));
+	starfive_intc_bit_set(irqc, STARFIVE_INTC_SRC_MASK(i), BIT(bitpos));
 	raw_spin_unlock(&irqc->lock);
 }
 
@@ -93,20 +102,23 @@ static void starfive_intc_irq_handler(struct irq_desc *desc)
 	struct starfive_irq_chip *irqc = irq_data_get_irq_handler_data(&desc->irq_data);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long value;
-	int hwirq;
+	int hwirq, i;
 
 	chained_irq_enter(chip, desc);
 
-	value = ioread32(irqc->base + STARFIVE_INTC_SRC0_INT);
-	while (value) {
-		hwirq = ffs(value) - 1;
+	for (i = 0; i < STARFIVE_INTC_NUM; i++) {
+		value = ioread32(irqc->base + STARFIVE_INTC_SRC_INT(i));
+		while (value) {
+			hwirq = ffs(value) - 1;
 
-		generic_handle_domain_irq(irqc->domain, hwirq);
+			generic_handle_domain_irq(irqc->domain,
+						  hwirq + i * STARFIVE_INTC_SRC_IRQ_NUM);
 
-		starfive_intc_bit_set(irqc, STARFIVE_INTC_SRC0_CLEAR, BIT(hwirq));
-		starfive_intc_bit_clear(irqc, STARFIVE_INTC_SRC0_CLEAR, BIT(hwirq));
+			starfive_intc_bit_set(irqc, STARFIVE_INTC_SRC_CLEAR(i), BIT(hwirq));
+			starfive_intc_bit_clear(irqc, STARFIVE_INTC_SRC_CLEAR(i), BIT(hwirq));
 
-		__clear_bit(hwirq, &value);
+			__clear_bit(hwirq, &value);
+		}
 	}
 
 	chained_irq_exit(chip, desc);
@@ -152,7 +164,8 @@ static int starfive_intc_probe(struct platform_device *pdev, struct device_node
 
 	raw_spin_lock_init(&irqc->lock);
 
-	irqc->domain = irq_domain_create_linear(of_fwnode_handle(intc), STARFIVE_INTC_SRC_IRQ_NUM,
+	irqc->domain = irq_domain_create_linear(of_fwnode_handle(intc),
+						STARFIVE_INTC_SRC_IRQ_NUM * STARFIVE_INTC_NUM,
 						&starfive_intc_domain_ops, irqc);
 	if (!irqc->domain) {
 		dev_err(&pdev->dev, "Unable to create IRQ domain\n");
@@ -171,7 +184,7 @@ static int starfive_intc_probe(struct platform_device *pdev, struct device_node
 					 irqc);
 
 	dev_info(&pdev->dev, "Interrupt controller register, nr_irqs %d\n",
-		 STARFIVE_INTC_SRC_IRQ_NUM);
+		 STARFIVE_INTC_SRC_IRQ_NUM * STARFIVE_INTC_NUM);
 
 	return 0;
 
-- 
2.25.1

