Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2109.outbound.protection.partner.outlook.cn [139.219.17.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3349C2701CB;
	Thu, 16 Apr 2026 06:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776322129; cv=fail; b=IWFzRbk/UFEzQTDDc7kj9Tu9P6695fSueQVwi0TW/bATAErJddumkJBCdx7dNawvzYUJtT4hIXM4LTNQqunuDX/D7wPLAcAxXaLLpPRqomlQwM4X510VIlmDNaV+R3Gd/ExYKUxy084fM3T/xo0YArVAzKB9otI5aR+mFOenCvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776322129; c=relaxed/simple;
	bh=Qk/8LEGoc63GNpxtIvZDMaxFQ4TvHQALoYd07eACZSY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LJRPruxxr6Z/eI/6oANbElqc8Z9aOjFDGAU5e6AJvafG3MJl6LzVtpgB5QB+sbTCBCGMfaX+Go7iakJBmEw9r6vg4AxzF7RwlReT1Z+wbmS/2Toh416ctlpYKaDvDHFOgptGNhVeo4A08X371h7na+ea6Uz36fO3/RkwXTQNR6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHSl8Azcycgd7rEMdwDWi/0j8Zz0ZGyDkZ5GBo4HewahB9J8Abw5P1+uB96jCVYCq0h4M6lOG/OeKkmGfkhFKO28xEM0hY/z23tzWIrVHFlXXQfCRxeflyNHHo0ozpzQph12N2Uwq1IdCgkVjeJVW2zXTdWN8d4kv2KwV0TjypSmlEGNMmdMrZGyXup+mOApfqrvrf7WLdjLBfv8iy18dTdTX6ou61tBCn0u+EtMIwT4xSbAhzZgTpzlTp829t1aBvH/YqSPl9ND6pQoTJb1lnJGMdfRGAfuWwispJn+3YFJ/ikntaTe6zJjOylGNSRgb82Jw7NhXLLL2U+bNuaDBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ky9+NsbukRRnrjfnFHqpw+8nXptkShIqusPsaB7VxVM=;
 b=hhNjFIPTuV+9dbDkRgXbMOv8TxX8yOSKvydTjvD2RierTYqe/EKVVEhxPUhjisIIm9aanVzuIL4MEwBUcCdfFRhdAJU6wOsOL925vbiRkCW9PAtKFF8MtvEO1q3B/Gu0zQJR7T3A0KxCXMQ4Em0Z7oh+1Lrfz/fgDNXjJpX5RhtTiWwQueWQdSVPQ2EIti1Wpy3Qt1lWkD6FH1ZLgyrzA/GabxFM1aOfLIjxmWW9A4835jnugcla6/c+zweQyUA8B50NicYDlt7byCGw3AV3hebebN3ecz/auHaozlqk9BfNdOu/8+nyR50+xiKonN3PjVZWVrwKujXQOUpA3Fwlug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) by NT0PR01MB0958.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.51; Thu, 16 Apr
 2026 06:48:33 +0000
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 ([fe80::1666:48e8:19e9:ad29]) by
 NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn ([fe80::1666:48e8:19e9:ad29%7])
 with mapi id 15.20.9769.048; Thu, 16 Apr 2026 06:48:33 +0000
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
Subject: [PATCH v2 4/5] irqchip/starfive: Increase the interrupt source number up to 64
Date: Wed, 15 Apr 2026 23:47:50 -0700
Message-Id: <20260416064751.632138-5-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: NT0PR01MB1216:EE_|NT0PR01MB0958:EE_
X-MS-Office365-Filtering-Correlation-Id: 97330bfe-1282-4916-0de5-08de9b842d82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	BtE0hxSzqPqhp9cm0KpNMj0+mCTBWfkt8cYwg8IXvOD2qJKsk04EE+oJCx4A/GY58MPRixDutOLofrTYKOpD/3PzaTRjJl3KDhg0hQaIDWDCM7zo2bqajtL/H2u52tCnKaPdFlgQkbCW6HyPggqEd99vYbzvBl6PEIsTbGogmnirIFWU2++yP/+QSfKPlrDZWPuqU+TYkNDTnAzckTYQY9Hatm7e0MbOh2JvykNVYhge/M16X/4Xz1fz6wmCTj0aGUEDqH1YqBU5NDE3+O9y5bbeFi42RB2C6TIKGMn/fKnj9HcbNfsOp+r1IQ7bLWCHpiZQr8y13s6nAX7/WWb2S5oQmxNLOUQqxfwoTXcLyNOnjw6QjdbnWr5UinypnCOsbXv4JyOxqhNVSI0lWiJAdXNdz/6JqbmF6KyJ4ANn2EvFLoflCltchIVICCjEuLRfR2AjztZH0Lp6RZOhw/b6dv+bSMSJoHMKryco5/GCaQ21MNesx1MqzdlyRfUZt6QXLCKktFlb+h6e9F1XthhhlKLWb6LgRkFWt1ZWMZDOId7Z6Ag5rS/kwIKBovcVBsMWyFM0UWCdQtcLocytcY+o4TNtGrccffpRcfgqBqppGaE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WXTGknR6qtLWGPoX1JwSx+U4eExmSFleVEiMNdIAzwkFjIR7jLtu8QHD0Yjh?=
 =?us-ascii?Q?siIkAYB+W6lAeZPxtydduMwy+Ri5kDvpNjsWwwoOYj+ZaaRl2GkJCGTceODJ?=
 =?us-ascii?Q?HtNF6pIlu+Ecn40KYfbZqO4synodrRB8bERF6/+E5EM0bw1W/wlIWDEtWoXT?=
 =?us-ascii?Q?Bl6qrn7YSyk8+Zc/xvh5BiBI+QkohsLZEUazR8gX8bLZPSPnjgSIjMU4hUeQ?=
 =?us-ascii?Q?aUt4/sYtHMjtNWlcyYNG7FcNeQC5AIq6EkarV0UXKXmHJbAZIVDaW86Zv3xz?=
 =?us-ascii?Q?4V+dyFsEayHtGb4SxWQdeiIdnL9QCzH7v/C2xJ2/m3AkWoSAItjrnlB1z8Mp?=
 =?us-ascii?Q?Ng9DwEQFx3kJbVPg4XgzpraNIaemXrazKPJW3ZZ9mBQdnBAsB/k3B1Y4ozlm?=
 =?us-ascii?Q?Y7unrY63lHTzReWvImTDBuZ/WboYNACe4WK+RYNp6BxoqPfSBcGHYJzO3wKs?=
 =?us-ascii?Q?pz9hwVFqZmCrEDYazyxd83nGZ2zTex8NTNhxM+HI7l2a6YTVfeSpCeYEJ4v4?=
 =?us-ascii?Q?tTi3MRvp9OZfpF517WhJUO6UAmlIAPUcf3CN7ONRvfw6t+TvKd4ulcwKT7cA?=
 =?us-ascii?Q?3SDyh543NNu7yq6JEClUzfP4uVoemYSulyAOBvVYmnZZcRY/6ewdLutC3bXS?=
 =?us-ascii?Q?FO6HST+X0pkKjkEHfvQE9yqCG0Iavq1JrqjweaL7W7sa830LBleBDHvkLWHv?=
 =?us-ascii?Q?jc4/RYzitR7rK1mmuHhlm+GsFQpkzKgmVEoX9LexPAxJozW4X373gyx2W8Mp?=
 =?us-ascii?Q?siWIsMCIyKJQAnfOXLOMRTCdPqX7ktdfI3acZUuth6JntjhGl62FCucX7h0J?=
 =?us-ascii?Q?38HqR9Qt2Tftufypm51ANxo70CmSWfKSQ4WoVPIKCZfl1uusLkx8smPinnPe?=
 =?us-ascii?Q?oB4mb0SEHDTOwVGVZUJux4HjeB25lRMFrjcuYtB1NCvnmEAciizUndci0MML?=
 =?us-ascii?Q?7o5aZkNrfn6blAxd64gHv99+qnaRXqOCX7igGhC85cjpgwlRCYfnGefqu8/d?=
 =?us-ascii?Q?Prrvs3Wt+3whRAG/7wIub83aZsHfh8BpNJbOgb8ebyEDeAjnntAOmPo+q7XD?=
 =?us-ascii?Q?EvJ3mR4hm8S08klMBIyy+od/aMwUxQcpZK5gE2NECqRPc/H9YXlnxK72tiYX?=
 =?us-ascii?Q?kVzUsgzFSY3WvNpUy3Ezry1YQhV3exnnfJW/SmMZwLjoj92mgy8NUSW5gzza?=
 =?us-ascii?Q?Kcsv5nxm48/7F7dCHbWC+f3MGFeQ9n35eWSiFMvho1BEy3uWvLerE0WlBOV5?=
 =?us-ascii?Q?ovp2JNf6EETg6pXVkz8adyzhTzAFV5tYqqWGL0BACOVGnbo58TUntcXZuNvH?=
 =?us-ascii?Q?jqhZ5qfrSfhYUWdm96cbDb7N4LfwxVvvgwpZdkaNGqc6LYmStUqZqZyOSiaB?=
 =?us-ascii?Q?h6+J4rtrJvspDqUEDkCM72y9GIG18aaYyn2gdv9KX+C1GrF1n+PM3R01oi7f?=
 =?us-ascii?Q?q2m1cYHkzj/YIAEhKiXR1qn8RLv5ELvnbwspu0RX7kzLRxVwPoeg8rRkY4/2?=
 =?us-ascii?Q?jTzyCr0SfmLB9Pps5OR1hPh8VEnqm3l2vtAgbXHwM7p68VJW0raZK4aykpiO?=
 =?us-ascii?Q?O/HP4Suw39OA8aPyuhKQPglKThzP/I2YOICp+p32ZtVyq2LVRldRaMFodWo8?=
 =?us-ascii?Q?SJiPglwVrBm3CTNJXAJDLmzD+Jxo0ngDm5Qt6KUsj+EN5HNk2CHVADxb0ikR?=
 =?us-ascii?Q?ArXcF1RRpAhpZ01nUIsc9RxHd4BlVQ3uMnrvIoaaZr26ZniZwpSY2TQLcCwR?=
 =?us-ascii?Q?Jg0utv7+w6CLHSF9vBmoDAg2faWgh0OGLoshFUwjlSKgi2CvpPVx?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97330bfe-1282-4916-0de5-08de9b842d82
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 06:48:33.5699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nthymyt+1cnP7to3c9bKY+qsuqZiKfqlAn7dOZ6wqvKxcXIjltQwWzsxRlZUNvCagpHI0yCSDvSyz3ya2RoLFtRtP9qUglF035SQEdgxc5V+2LeowZ37iPpPYX87X3P1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB0958

From: Mason Huo <mason.huo@starfivetech.com>

StarFive JHB100 SoC interrupt controller actually supports 64 interrupt
sources, the original code only supported up to 32. now it is extended
to 64. Also use guard(raw_spinlock) to automatically release spinlocks.

Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/irqchip/irq-starfive-jhb100-intc.c | 47 +++++++++++++---------
 1 file changed, 29 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-starfive-jhb100-intc.c b/drivers/irqchip/irq-starfive-jhb100-intc.c
index c33229b39a40..b3d86bd926ed 100644
--- a/drivers/irqchip/irq-starfive-jhb100-intc.c
+++ b/drivers/irqchip/irq-starfive-jhb100-intc.c
@@ -19,10 +19,11 @@
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
@@ -54,19 +55,25 @@ static void starfive_intc_bit_clear(struct starfive_irq_chip *irqc,
 static void starfive_intc_unmask(struct irq_data *d)
 {
 	struct starfive_irq_chip *irqc = irq_data_get_irq_chip_data(d);
+	int i, bitpos;
 
-	raw_spin_lock(&irqc->lock);
-	starfive_intc_bit_clear(irqc, STARFIVE_INTC_SRC0_MASK, BIT(d->hwirq));
-	raw_spin_unlock(&irqc->lock);
+	i = d->hwirq / STARFIVE_INTC_SRC_IRQ_NUM;
+	bitpos = d->hwirq % STARFIVE_INTC_SRC_IRQ_NUM;
+
+	guard(raw_spinlock)(&irqc->lock);
+	starfive_intc_bit_clear(irqc, STARFIVE_INTC_SRC_MASK(i), BIT(bitpos));
 }
 
 static void starfive_intc_mask(struct irq_data *d)
 {
 	struct starfive_irq_chip *irqc = irq_data_get_irq_chip_data(d);
+	int i, bitpos;
+
+	i = d->hwirq / STARFIVE_INTC_SRC_IRQ_NUM;
+	bitpos = d->hwirq % STARFIVE_INTC_SRC_IRQ_NUM;
 
-	raw_spin_lock(&irqc->lock);
-	starfive_intc_bit_set(irqc, STARFIVE_INTC_SRC0_MASK, BIT(d->hwirq));
-	raw_spin_unlock(&irqc->lock);
+	guard(raw_spinlock)(&irqc->lock);
+	starfive_intc_bit_set(irqc, STARFIVE_INTC_SRC_MASK(i), BIT(bitpos));
 }
 
 static struct irq_chip intc_dev = {
@@ -98,16 +105,19 @@ static void starfive_intc_irq_handler(struct irq_desc *desc)
 
 	chained_irq_enter(chip, desc);
 
-	value = ioread32(irqc->base + STARFIVE_INTC_SRC0_INT);
-	while (value) {
-		hwirq = ffs(value) - 1;
+	for (int i = 0; i < STARFIVE_INTC_NUM; i++) {
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
@@ -140,7 +150,8 @@ static int starfive_intc_probe(struct platform_device *pdev, struct device_node
 
 	raw_spin_lock_init(&irqc->lock);
 
-	irqc->domain = irq_domain_create_linear(of_fwnode_handle(intc), STARFIVE_INTC_SRC_IRQ_NUM,
+	irqc->domain = irq_domain_create_linear(of_fwnode_handle(intc),
+						STARFIVE_INTC_SRC_IRQ_NUM * STARFIVE_INTC_NUM,
 						&starfive_intc_domain_ops, irqc);
 	if (!irqc->domain)
 		return dev_err_probe(&pdev->dev, -EINVAL, "Unable to create IRQ domain\n");
@@ -155,7 +166,7 @@ static int starfive_intc_probe(struct platform_device *pdev, struct device_node
 					 irqc);
 
 	dev_info(&pdev->dev, "Interrupt controller register, nr_irqs %d\n",
-		 STARFIVE_INTC_SRC_IRQ_NUM);
+		 STARFIVE_INTC_SRC_IRQ_NUM * STARFIVE_INTC_NUM);
 
 	retain_and_null_ptr(irqc);
 	return 0;
-- 
2.25.1

