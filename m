Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2092.outbound.protection.partner.outlook.cn [139.219.17.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8D5381B07;
	Fri, 10 Apr 2026 10:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775817252; cv=fail; b=X4/P5liHQ2FSJOzIPV8gdwD74lADZuOmExwCksmR2uuiCrjRCD8X+YqTSURjgDv7ZJt2KZsjMdJd9iPJIjSCQIDObPHQLpqwGxeUvBg/ki6m9nmyySdp5NYGPAPBwuh133ZZ2svlTFK9vs4RtmLDpumJDZmxcTnV2TM6HHe1rYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775817252; c=relaxed/simple;
	bh=4+mekNrESqB4jgnogijRZCxjNcvrsd2tqz0i9ComYcU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S85wBvXtLUgwwjZ4wNFt8YuLtqzjrnQ1kiyaMLnHjZlYUpRQNgOsj5P6zegqUP2wQ/QEypfr4wL2jVmG2oghBsvrbpNBpkOlC98COuiGuSkAtfyiCYFmiGoU6ZkoADKIcZuynypIn8ARN0I+hGQWn0+A3xOrRs+0S84c42remJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRiPATPdsoWPUY1JDNO/df1cj7WSBNoWloeXTY2cwVGZMfUgFJTtx4EfCLuPU09LFatpYSpbRH2j3KYjhd8/BCEbef+9+GFNcJ/DutfrVygdtEWfkDhQ3S5dLMhjpn82eU1GT+yxQnks/muc2n4uHqvBZDI47azpPruodOCbPCnDGuDXXOHojEvKAlMo30kr+FCQfaKfvrbgDUS5tw3/LXNSP2bTGllYph2yDQ70kBKYfI1nhoLcUnRj7VsWwDFTzB5gXHzi2fFfJSt/FiGbwE0ToSGVUUEm1QokP83oVWGnj67dqXUQR7W6+hU84OtR2UhsbICUKIw6nxAJxAImAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIzfmPLjiZkfjr1NThVGis4foSNaXDJmj3UG8N8hSjM=;
 b=bN3nnPiGhU7tCTByPU2oxucGYLOLWKAC8q1Sp8JhFJONYgmVE0PT3SDC/0t3hbS9hZRTdjpk4LKZbPp2TA164d2Hmchk9s78circK0EQ0IieLScSHQSYk0epZ5mlKJc0iD5Scq/KBR+mDQxBld9J3T3vFh6s9EkIcKw087zKVAb19g4FIPq6ugtWsJiWwq64BcHLJE0SUfL25Lroscyl7rZQ4CRZAUn+WENdBN0TEnfR4LE7WjzX7LqpUW3Vnye43XPTSqX8XCp/EesQ4A23MP64cGDFsKwkwCmWcyY8IR6yY/VJz3i2c4la8UDsh2QeOBRSCAmHfGn9g9KAujt4ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1218.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 09:01:19 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 10 Apr 2026 09:01:19 +0000
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
Subject: [PATCH v1 5/5] irqchip: starfive: Implement irq_set_type and irq_ack hooks
Date: Fri, 10 Apr 2026 02:01:06 -0700
Message-Id: <20260410090106.622781-6-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 392e1857-7885-4c6d-6862-08de96dfbb0e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|56012099003|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yv02kXq1nsSF/4sqBZ3SpmtHlnUAKW68hgsmvRcIkfIfBk+eES1fm6GkQxZxq58TaTXcJo83A8ArelazCB3HcBmk2w7hSfCWxaaz3xT/K0ue2628etOxOx0+kVVgrh8HiEU8vuFVt9eowgEKnjQqxB++bUiY1FerTuIb2Ct51ML5vf9Pu/lk7LDUyqSlJxd8ds0VXjszmWFg8e4WLbN1cJ7v/9fTO7B+JNjXhSkhDj1IgFttw8hzWp9NmEZEBa6ViJrQCX3YbIgeN3Bwznt8N3igldCK5Ll58BOriCIBqMAGubgRL/WFFPZkRsE+9bmfwv8tQPPuprJ3KJHsIHFeY0tpe4YtP1erWYDR7lCP35emMkxy0v6mgNzArf8JRFijWYkRIzH3U1Z75a9HNv+FwfT6hrqTKCD/7rsA7f5Ac3N5xBgybRIcZ1AzoY0A02rGnYgtLbsm2Qw+mHVV9sklo/1dqgryNaaAx8dQ+jGjPOQVyfpmzvcKfy1LpJooIcY00s6mLgn5oBaU8aTD0NrGr6K+9xgmcSo6+dV0bz24Hzw60XGEJ+/aXnqOztj5yjb2IacbBeAaG16nxhgacwAtyg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(56012099003)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9S22Gh8f/jYA0wIzHnBkU/lJQoUu0T+mpYgkjr6rTPDq+mRqQKItDKukH2Xu?=
 =?us-ascii?Q?9piKiSOr59cGzgQrWDBBF19mi/OlVLaHneyzdv9ptaO7GqrXk3NXsoz/kIQw?=
 =?us-ascii?Q?X6EWzbN1Dnwe79F7TY3pjV5ctyfMhu4ak7tCWTbexCRDKf4vf3HW/9Z4kg1p?=
 =?us-ascii?Q?YbERcHyr1AQadjSZ5GEzQfYuWubvUDb0D6fhrgaxPtA+NJ2AZc5GFEsvgVlc?=
 =?us-ascii?Q?QpDpOMXq63URZf6vrtsvklvGZKdsThnqwc/w8MKbt2ZLM7gwjrww/CgiGq83?=
 =?us-ascii?Q?rTjOwNgjQXjpiTBm1zr8tFFe+YbfQbyuTdOXH7R5y72P25OzQTTZqPqvl0A/?=
 =?us-ascii?Q?q9xhkcgwl7LVpR1p7OLcj7XQL59evzaAIQsRtyKLLkG1TRhkumiNiHKJa2rx?=
 =?us-ascii?Q?yxPToe5O2/qpY6P+ncCW1z0VQ/943/gosiSRfF3EfQt1r6TwVnkBHCIaj8ln?=
 =?us-ascii?Q?ejSySo9c32aswY6DY53I0ViFvDfyACin1UGs8a5iEBb72DGriiirzGDdplmP?=
 =?us-ascii?Q?S9YVo4/aDCul8nCBH2m3b5ljkLko5vKek/OWtDXYCgrFLdtRXbpdLToH9yue?=
 =?us-ascii?Q?ySG+nCQIiPauXulq/6Gi+1rRHsDevuQVHNok06Ygk3/GdlcLA/DJazqmYUC8?=
 =?us-ascii?Q?PSCWXHRYPDt63Fty8yO4Ksa/lK/kmbLEBoPpx1zJrXpCIDYHQ6FaCWV4Esl3?=
 =?us-ascii?Q?adleyQPU0HzxiUoEyzlUD1sWiCBX6MroOqJa91T1EZ76J5g0q0lj+dQrIghM?=
 =?us-ascii?Q?8wxLzuWSGQ44GAcO5s0C0QWEppxURuvU8CqBV0uAnUQ2qmo8J7qZ7VduyyK+?=
 =?us-ascii?Q?A3vnoCxTPjCO7n4+qIYT/jJHUhB9Sl6UPDpOETjc+DLZwYqevamHqwZPKUOD?=
 =?us-ascii?Q?bSxdcYQMUoC5GR80dR5laTiCre5PwswkzKE1dasTyMHEbznH2aU3FjUJwaqP?=
 =?us-ascii?Q?b98K+3DX8NS1u+0dSiWb0llcyu/ElvZqa4MGUFEqytNgHvxMO2cfAmtSO8HI?=
 =?us-ascii?Q?z7yYTlTP357UvN2i0nLXtwtqKOiu3qCgd4gb9SqDQTLKcoFkBlyjxDeOl/Nj?=
 =?us-ascii?Q?DPJoPPzis9J8aRRPcIFhvT6CDRUzKNcm9a2/nhy0sA9m37hNe2YpJy74kB2m?=
 =?us-ascii?Q?ad8dYpgAtdMQ78z/1aP/wpXjQ+5WO5PGLboiNxC/RV7pQg+0gwDBDlHFX7HR?=
 =?us-ascii?Q?XjiItiIiPf9lue5adQvjpcA5JCnA1VsJoNT2woWSikQoMTVj6ZGgK/AewIgV?=
 =?us-ascii?Q?3rKOksTrcs1CbTtWDGDM2fgZs4bHuQv3o2Mr73waVRIxPwfhEEaIXO9gwnQK?=
 =?us-ascii?Q?I/rzQ3gaos24Ak69XPiWVJn8HPvEyEb2Vr3hxLISB2Uid6FdHb+XZDhehr4U?=
 =?us-ascii?Q?iZ8xLBLjQPaFxEhnezTHBgzANGv6cPqXwT9rznwYiw8alAPiHpFWAqmD5iRd?=
 =?us-ascii?Q?Hh8sKkhYk7SIKQlHMgNDmE4Yz/zUEfEV+RLMZm7ilho1VuzWznFcAEa8cXrm?=
 =?us-ascii?Q?2mhzzdUMGsQ8p5+HEsyayS7lbkh4IlOpyDDOHkioSax2UCrSBh4HB0QR4RlD?=
 =?us-ascii?Q?ffyyIassJmXZ9sW22JBgdBA+5lzzOIapPS3i+z7k6AA3P1IC8sYZVAa2wGjJ?=
 =?us-ascii?Q?1R+MHjGGO4J40oXqgQCbdcT28LdMrV4rOYLeILaHnqkJADIS7kqeg1X6NoIS?=
 =?us-ascii?Q?OSe/vysZWLhmSak8NEaKQ/Q8ZGtxtGM08rwXuabPVOKPiVLr1mbJLgbeTAiO?=
 =?us-ascii?Q?aAA0MsNkSftDwTsZabjSTMk7Ajra0pZ0k+P63C9rFcpKFXHo9nbE?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 392e1857-7885-4c6d-6862-08de96dfbb0e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 09:01:19.4231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7f4ImWwDLGO2/H1JsBWrib4S+vfJH4UXap6Vu2UnMfAzvxATp+bmLmu8iPAx+tnu8OXgs5+orBxO3BZ02S4xIZk8foNLf0StL8l4Wv1jY31a3hnQF04uvVNSQ6x+rYLZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1218

Add irq_set_type hook to support configuring interrupt trigger types
(level high/low, edge rising/falling) for the JHB100 interrupt controller.
Also add irq_ack hook as required by handle_edge_irq.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/irqchip/irq-starfive-jhb100-intc.c | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/irqchip/irq-starfive-jhb100-intc.c b/drivers/irqchip/irq-starfive-jhb100-intc.c
index d5ecbb603a58..d34f960b0770 100644
--- a/drivers/irqchip/irq-starfive-jhb100-intc.c
+++ b/drivers/irqchip/irq-starfive-jhb100-intc.c
@@ -9,6 +9,7 @@
 
 #include <linux/bitops.h>
 #include <linux/clk.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
@@ -18,12 +19,20 @@
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
@@ -31,6 +40,17 @@ struct starfive_irq_chip {
 	raw_spinlock_t		lock;
 };
 
+static void starfive_intc_mod(struct starfive_irq_chip *irqc, u32 reg,
+			      u32 mask, u32 data)
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
@@ -77,10 +97,62 @@ static void starfive_intc_mask(struct irq_data *d)
 	raw_spin_unlock(&irqc->lock);
 }
 
+static void starfive_intc_ack(struct irq_data *d)
+{
+	/* for handle_edge_irq, nothing to do */
+}
+
+static int starfive_intc_set_type(struct irq_data *d, unsigned int type)
+{
+	struct starfive_irq_chip *irqc = irq_data_get_irq_chip_data(d);
+	u32 i, bitpos, ty_pos, ty_shift, tmp;
+
+	i = d->hwirq / STARFIVE_INTC_SRC_IRQ_NUM;
+	bitpos = d->hwirq % STARFIVE_INTC_SRC_IRQ_NUM;
+	ty_pos = bitpos / STARFIVE_INTC_TYPE_NUM;
+	ty_shift = (bitpos % STARFIVE_INTC_TYPE_NUM) * 2;
+
+	switch (type) {
+	case IRQF_TRIGGER_LOW:
+		tmp = STARFIVE_INTC_TRIGGER_LOW << ty_shift;
+		irq_set_handler_locked(d, handle_level_irq);
+		break;
+	case IRQF_TRIGGER_HIGH:
+		tmp = STARFIVE_INTC_TRIGGER_HIGH << ty_shift;
+		irq_set_handler_locked(d, handle_level_irq);
+		break;
+	case IRQF_TRIGGER_FALLING:
+		tmp = STARFIVE_INTC_TRIGGER_NEGEDGE << ty_shift;
+		irq_set_handler_locked(d, handle_edge_irq);
+		break;
+	case IRQF_TRIGGER_RISING:
+		tmp = STARFIVE_INTC_TRIGGER_POSEDGE << ty_shift;
+		irq_set_handler_locked(d, handle_edge_irq);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	raw_spin_lock(&irqc->lock);
+
+	starfive_intc_mod(irqc, STARFIVE_INTC_SRC_TYPE(i) + 4 * ty_pos,
+			  STARFIVE_INTC_TRIGGER_MASK << ty_shift, tmp);
+
+	/* Once the type is updated, clear interrupt can help to reset the type value */
+	starfive_intc_bit_set(irqc, STARFIVE_INTC_SRC_CLEAR(i), BIT(bitpos));
+	starfive_intc_bit_clear(irqc, STARFIVE_INTC_SRC_CLEAR(i), BIT(bitpos));
+
+	raw_spin_unlock(&irqc->lock);
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

