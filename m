Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2109.outbound.protection.partner.outlook.cn [139.219.17.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C97237BE7B;
	Thu, 16 Apr 2026 06:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776322131; cv=fail; b=e2hPxDjLoH4s5k2ryLds57A7YnCXvGyQKbntK3toCg77H85dZwtBgqomOySo5X+91V7ZSM0d8FoqLLhKInRpbaJGbW9UXw1ZsYvyrTSTmY49qnwTipc6lHDG3K6Se4cWk3aQMXJ+K8MYAbzeBF81MkUHmnDof/oSzpJGyPQj32s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776322131; c=relaxed/simple;
	bh=8Cpl5B/ySK24ROygo8tjpK215mDkCPDcKgK8LsFcz4A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=opThPmjkJgk/jWXUP5DGjvu/gWuUYFnAR7xOVxn0fKiua2rrtfN8tH8Y2YqxXrOgD4ssSA3+y/k9uthi0ihdDclFEoixnKWRvFlHRSimcYCyt8ggrOfDKC8UjmN4yeJw41Z7aFe+Gq5wP//I5a3pdDMD5BUN/eF237xTqOvPvbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBfx8GE/63FB2Kc5oXyoTVRAwBLZfkGXdhdy3GvWf3kptQy1DO1TJT0//u23HOTONJe7v+UpgElB+x7rIOGyiG4OI3WotVQUpe+Ax4xsq7XIA1jSvXNsDLizvHQ0KQfljHx3aKEWCeAUSLi4qRYhT+QivS/mELBV1GqOnwfFRbIsUPWu1kiv8E5sSR94TqBjXLs3KhzSBwIQgRMCHZJnYMfWpbfsqh3tO03/WbJCPCCgpdLU4ny6Z7s+vRcD+Us9xswNpbx+JKKMPKBiTQdrciVXbAdPzxnkDxurVp7KGaaRB04j1M1RR0poHMCeunouzJTPU6sYPdZnOH+2PuUBKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36LQKrzoyeqi/EovQ77CNtu3JpnSfH7XeZPX9HNd/WQ=;
 b=g+CnPigIL2fBel07HVj9DcbYACoY335YELIFIzjcEebNLAsmHhwUC5tnxRFKQik+pypIKXDcvTD26ZPplo9Ab693rZRXfKyFInbfL+tPJ0SaAaDCa904Xcku25SyZBpWdkrnCpqDCmw4iKum+GEpI3oTUpoe5nULnC9iekuNaVWnTxri7qpc+fCCGQTGe7oEXfneClfXpTjoKeU8CldDuolSDPbHPiVrQ3Eqoi2V3BEPuWZOevgYvlQZLDTeQO7q07sM5/4gTZ7/rU9dAmsXH7lMOjTwaLtTWKzDkjsVBIuYi+zlFcDR6y+ewMo5zSaDmjfO7a80w7snzTAxIpCUYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) by NT0PR01MB0958.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.51; Thu, 16 Apr
 2026 06:48:34 +0000
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 ([fe80::1666:48e8:19e9:ad29]) by
 NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn ([fe80::1666:48e8:19e9:ad29%7])
 with mapi id 15.20.9769.048; Thu, 16 Apr 2026 06:48:34 +0000
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
Subject: [PATCH v2 5/5] irqchip/starfive: Implement irq_set_type() and irq_ack() callbacks
Date: Wed, 15 Apr 2026 23:47:51 -0700
Message-Id: <20260416064751.632138-6-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5c44bdef-cc50-40a2-2a24-08de9b842e20
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	hAEVKdIxzlnC3YDmB2+a62ooAxdmRF7wDeQ90iX9xCgmJUlc3bJBgNhAcOvmnDA4jAWk3CJ9KGZBbLdHJ8PN4dQ4Wu3zWWRN+Mk+IB4YSpB2piy/A2TjRoxrB872L5MQhasFqyLe61DAbLoBI/PWVdTKI15VKqDyhNdvo5ju2j/Lxid8IhI7SVr1yzJzCR3DJPpH68u+kDtB8zNR4s6PAD2sQJ2eCuCqXwLk7matRAzIaR0DN9cF3Se6tsyoN1KjTcrgqqETZqVHz0Wr9IO4bZ4n4adD7JBaIqDA72BFmELezvBEljSXBZxfmvQJwf8dgpVgVDXWRkhsPL0sCviZ/GwdmNHnlmxLi/COHsOP/6i4s9DGL9WLB/05ljx61S6ZYh6Pdmxgl6Mzeom5uDOJtbkmcdHx0hAhNvbVTsKijiuwLBgKmUaRi/winnc2gr3SO7UC3cFq1C/6Gz3cmUMXSHdAn18aLVb63LcTWo1UdVGcxHwivqBMONkMmSMmL4NzjUtIzgPXEUn44DmThvLAT+iSWBGDyuQJVmH0lcFoxqv52RzveG4ZMhlHQZREGbgKnsG0WmGDIRlSGTPoiN10L9OFJOt6E53iKX5RDz1RwfU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6sHQ9rZRBIg068YM8m2f78VuNQwxu5cPAsm9YSk0bOA5DnDbcIdkD6iZ5eLq?=
 =?us-ascii?Q?ECoNHX8qQ8DUPjmGVCyf1vssTkjREWUYMwGBdAxsdCZuw4QLP7v8UnH60ZkG?=
 =?us-ascii?Q?fKwB8Hi+2Z0JeDcoLTr1HAOYY0Slp1cvHHxvYl/vfAYd5UGJTUR4ZzDM9a0v?=
 =?us-ascii?Q?UeblS4yRJ3fbTOdEamcnK1mGHT3qxB0uc/VwWljsEw2Cod8Bb6jgjC5/Uj3j?=
 =?us-ascii?Q?vZvdP7Ey3i5hcHXWT3bMKwu+H1BwtDvt0JMQ4jGGxPubLfiGAjU1WklfKA3m?=
 =?us-ascii?Q?cLc2mPdwNKTtDjC1uUQac+K6bhs/v00p7GeA/Hc+0rGa95GijNe4M4hFH6MC?=
 =?us-ascii?Q?83esael0cI8INc17zpTPHwrAD/RUe1O5kEwDv2YsPUEIOaCqg/RiUVTeeYDB?=
 =?us-ascii?Q?s6u+lHwRcUTGSjXTRqsbNe9KHP/4LmW2K06wx4OGh3Bknq/pBWATagvv+oZ8?=
 =?us-ascii?Q?15idXKBSPlrZWLDw27PZdsfocvKYsBghIkENzvkZ7jYlvaMQn4mr+xFnqq7U?=
 =?us-ascii?Q?F8d7TUZw1DylTyQV/Q51HHBEQcKwS8PN22B1yQQUP0KQQMZS+uNhTSoAvzM3?=
 =?us-ascii?Q?GyDL3fJ3wk3I+RmT2T05t85XChN+zqd4MmVxfF3OM7oqX6qhEFEJ0VexBApN?=
 =?us-ascii?Q?w5aAC197z1EREbbwCAoXTWJWM3q1FHQ97UNbTp61qHaSsLR6hg5qRNN79LV5?=
 =?us-ascii?Q?tXb3LaAWPqRfCbPAoEkd/erA7JHa3u8SRexLvM4CNlU9oov74noMZWpC7002?=
 =?us-ascii?Q?4J6rzpJyRXH2JOhXu8CrnHhBQ61Te4Ww8xWnasgA+j0zIE8hRqALjccPpHCc?=
 =?us-ascii?Q?mnN9nFYngxsEIZ/AcapoezN/YZNWbbkSWkKVCGhhier1Gp2pcRl00xIS+JuE?=
 =?us-ascii?Q?ORxuv3ItTCvmkZYyx8wdYINDAGJ0vRQVEPVz6Bq1Vj51QHm0LPEc/kLXAYnZ?=
 =?us-ascii?Q?t96dLQlt3lRKtOFjH2jbJ5WXUEoT5Cozt31CWnUYfwnhxsleh437sG6cmNks?=
 =?us-ascii?Q?S7HpKwdy7tOVL+3HaHNk/jXt+PLS2INn0CmW8CjLa9DJ0AYheTclZeoztWlv?=
 =?us-ascii?Q?8H5cwzp7HfdeehcjJMOW7eh8dVCQBzTB5ZBwBhi0oQ8qyFwArNxr7tvYnWIh?=
 =?us-ascii?Q?QWUSYlnVXlyi+Y46voHablGo5yNHovpXXxaWwKRNqWr/W8WtqL/xMnOH2r/h?=
 =?us-ascii?Q?dSmnjztTfCDSjBhVktO9L42evBwiW/p8/GSgGIF6K62+b88iwDAC9PQLn8Zz?=
 =?us-ascii?Q?z9yR41JwSgHK8H1vpv7phN2DlkhhZSy3nHPwkRO8bUanlovqCaVAwvxoIQfG?=
 =?us-ascii?Q?HBMAqxreBds+wcm8YL5+IFpuPLs15dPS3SnypV9XgDT3ntO6qJYbGSv0EePA?=
 =?us-ascii?Q?pYvYnBlfQ7nIwYQr1qx0HoaQUJEVBiL6eQXuvc9Nw0tSX86Z9pXynOC1RWAq?=
 =?us-ascii?Q?C+iUWj5DZtbOPrNhUqilLFTTPhQcKV1sHicmI7pfWnrjoJ1f/U2OQx2+8MDC?=
 =?us-ascii?Q?MScxPIkcccDzlmJaU0CCQOicB2hi9nZ5wDaSb54qtw6OmhGh1Vvz71SLYn7O?=
 =?us-ascii?Q?ZSHWg1eKxCmxxHI0K5277lYaCpmIdwr22o9oLlXCUuekp6KstpvcAeJfnczP?=
 =?us-ascii?Q?th6Urx1lMsRKB2wlQK1LbsaKIDVG0Vph8csCBILBgMRbwAdvl5Kcn0z9FiaQ?=
 =?us-ascii?Q?e4KpDbYeB+Ig/Zs9xgkXQgaA4YOIK8WqsbO4FXB0BNJ3U1CC6sWvDbqJN5N4?=
 =?us-ascii?Q?SOo3WtxMYhOrC8C+LeYHUM5deO2wofEXYyw/clPrwtHbrcnyjU7H?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c44bdef-cc50-40a2-2a24-08de9b842e20
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 06:48:34.6227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yt5d40H4CUqGnLO27XwDKwdnGqjNva42XLLTQ+9IUdkVGJvqGzYCTdeuubckRjf0bBsUO5Dvs3GSm7B0VKIxL7pN4GWhx4PDv95ONfjZTQFixULNKDJYeZriIuE01yxP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB0958

Add irq_set_type() callback to support configuring interrupt trigger types
(level high/low, edge rising/falling) for the JHB100 interrupt controller.
Also add irq_ack() callabck as required by handle_edge_irq().

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/irqchip/irq-starfive-jhb100-intc.c | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/irqchip/irq-starfive-jhb100-intc.c b/drivers/irqchip/irq-starfive-jhb100-intc.c
index b3d86bd926ed..0d5914813afd 100644
--- a/drivers/irqchip/irq-starfive-jhb100-intc.c
+++ b/drivers/irqchip/irq-starfive-jhb100-intc.c
@@ -10,6 +10,7 @@
 #include <linux/bitops.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
@@ -19,12 +20,20 @@
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 
+#define STARFIVE_INTC_SRC_TYPE(n)	(0x04 + ((n) * 0x20))
 #define STARFIVE_INTC_SRC_CLEAR(n)	(0x10 + ((n) * 0x20))
 #define STARFIVE_INTC_SRC_MASK(n)	(0x14 + ((n) * 0x20))
 #define STARFIVE_INTC_SRC_INT(n)	(0x1c + ((n) * 0x20))
 
+#define STARFIVE_INTC_TRIGGER_MASK	0x3
+#define STARFIVE_INTC_TRIGGER_HIGH	0
+#define STARFIVE_INTC_TRIGGER_LOW	1
+#define STARFIVE_INTC_TRIGGER_POSEDGE	2
+#define STARFIVE_INTC_TRIGGER_NEGEDGE	3
+
 #define STARFIVE_INTC_NUM		2
 #define STARFIVE_INTC_SRC_IRQ_NUM	32
+#define STARFIVE_INTC_TYPE_NUM		16
 
 struct starfive_irq_chip {
 	void __iomem		*base;
@@ -32,6 +41,16 @@ struct starfive_irq_chip {
 	raw_spinlock_t		lock;
 };
 
+static void starfive_intc_mod(struct starfive_irq_chip *irqc, u32 reg, u32 mask, u32 data)
+{
+	u32 value;
+
+	value = ioread32(irqc->base + reg) & ~mask;
+	data &= mask;
+	data |= value;
+	iowrite32(data, irqc->base + reg);
+}
+
 static void starfive_intc_bit_set(struct starfive_irq_chip *irqc,
 				  u32 reg, u32 bit_mask)
 {
@@ -76,10 +95,64 @@ static void starfive_intc_mask(struct irq_data *d)
 	starfive_intc_bit_set(irqc, STARFIVE_INTC_SRC_MASK(i), BIT(bitpos));
 }
 
+static void starfive_intc_ack(struct irq_data *d)
+{
+	/* for handle_edge_irq, nothing to do */
+}
+
+static int starfive_intc_set_type(struct irq_data *d, unsigned int type)
+{
+	struct starfive_irq_chip *irqc = irq_data_get_irq_chip_data(d);
+	u32 i, bitpos, ty_pos, ty_shift, trigger, typeval;
+	irq_flow_handler_t handler;
+
+	i = d->hwirq / STARFIVE_INTC_SRC_IRQ_NUM;
+	bitpos = d->hwirq % STARFIVE_INTC_SRC_IRQ_NUM;
+	ty_pos = bitpos / STARFIVE_INTC_TYPE_NUM;
+	ty_shift = (bitpos % STARFIVE_INTC_TYPE_NUM) * 2;
+
+	switch (type) {
+	case IRQF_TRIGGER_LOW:
+		trigger = STARFIVE_INTC_TRIGGER_LOW;
+		handler = handle_level_irq;
+		break;
+	case IRQF_TRIGGER_HIGH:
+		trigger = STARFIVE_INTC_TRIGGER_HIGH;
+		handler = handle_level_irq;
+		break;
+	case IRQF_TRIGGER_FALLING:
+		trigger = STARFIVE_INTC_TRIGGER_NEGEDGE;
+		handler = handle_edge_irq;
+		break;
+	case IRQF_TRIGGER_RISING:
+		trigger = STARFIVE_INTC_TRIGGER_POSEDGE;
+		handler = handle_edge_irq;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	irq_set_handler_locked(d, handler);
+	typeval = trigger << ty_shift;
+
+	guard(raw_spinlock)(&irqc->lock);
+
+	starfive_intc_mod(irqc, STARFIVE_INTC_SRC_TYPE(i) + 4 * ty_pos,
+			  STARFIVE_INTC_TRIGGER_MASK << ty_shift, typeval);
+
+	/* Once the type is updated, clear interrupt can help to reset the type value */
+	starfive_intc_bit_set(irqc, STARFIVE_INTC_SRC_CLEAR(i), BIT(bitpos));
+	starfive_intc_bit_clear(irqc, STARFIVE_INTC_SRC_CLEAR(i), BIT(bitpos));
+
+	return 0;
+}
+
 static struct irq_chip intc_dev = {
 	.name		= "StarFive JHB100 INTC",
 	.irq_unmask	= starfive_intc_unmask,
 	.irq_mask	= starfive_intc_mask,
+	.irq_ack	= starfive_intc_ack,
+	.irq_set_type	= starfive_intc_set_type,
 };
 
 static int starfive_intc_map(struct irq_domain *d, unsigned int irq,
-- 
2.25.1

