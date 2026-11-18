Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795019593;
	b=2fmNMz6GyBotrxBvX2MWZFibC5O2hEusOFNHl5t4q3Lf4bFfyQUBb3G2QZYXMsvyTgAB
	 PI6wfJRQz9jZhLrn1ewd+COLqxFHfmWCstFpIDhlWFa8f9zhmYS6rufY/do9EI7t0noMX
	 /h1jzcFkCy3YUEinlrvTrxWYYfU+KHSolXlMgPQmNhUvr3O1OpkreVODHbPbQ+3wfIK4P
	 Lwk11JCZ9SIR7yApriCaiIGLoWMGsOuCBXsciKylC6KOyq/qSjup/Uqu/1/yKZBPL51qT
	 dYcVX4fXDj58n0paXpbv7HgwyNszPkA2YvtYp09KDVVNDOIDO8WtygfB7GoLuzQOnXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019593;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=SJFoDtfMFzWA34fz7xmu7AX2ve+tOoxp2McVJuCy/aU=;
	b=CXH+MfLKtjtHHESajoI0iR/g7FAmatfmy1QgmCCXLDQOF2Y9TPkPKHphsbiKYJjN4oNi
	 Q2ks1hkz03QWgIqguhI4yWfNaFr1nkbnXRYyxRc5wKuyvOZVIKkJuvhptL+t+/+GvcEMv
	 vERJxpyDp5t99s2djaDMqMU5Afor1hjkD2YpKlz0Idwz30MLDyVkZaC1uqTBAr4Z0CEkq
	 3WXPUNX5D6ZuMyk6S10r52kbiujsB1KkfFfXcHhxdCHuY6+XwDTORTRbmkfZCbWNQ2g2C
	 3tjh4Bx06Es+RRBNunEstRU/Fy5pNFVsT3qCCz/883moN2A9SnQchjclwk5zI10Q/6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=VWNebqgi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.28
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013028.outbound.protection.outlook.com [52.101.72.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B42F606A7D9;
	Wed, 18 Nov 2026 16:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B42F606A7D9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=VWNebqgi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWxsv+yhZ1PptytJdxTIKmbYX9IhvIgaZZQqVjhIbtCyKijT0D/4O9WqDjiTzIVWAQosrtrz3RQZU6jVzakKpDPBGOLh0webwAfbr2mjZc2ANoY83HnR4mzX4towSzstHLVWV0FIjhYs/Bqd2uSLL7oodM1hNsLj1juAi4CX0GLJLTZ82b0aXt2Hf24IOnUoznXoE2u8z6iuyt2ve/C1lqo8lLu4wTlYRdl9kFlZJDksQpG7JeNqeAvZnk1L0rsn5+CEIF3ubU7HoDm2ACS7yukg2FVtt5vFe6DdlHI57v4LMWPFzXmmaNl9KM6PCSDV+v0hVTKa1jal36YJxuKbJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJFoDtfMFzWA34fz7xmu7AX2ve+tOoxp2McVJuCy/aU=;
 b=pj9V59aUPQA++X998iq8SqskgGwhcSIvl8x2UtFhFG6eTKpat7EgHlu6HwtK9aoRWgC/+7ZjUL9B30jrrutBKhHTbU+jXwq6Sr5gS91EG+BX0cHbA25ddQInSNblwa0S8zSwrNStkGVcH3Geq4o8ZI4XmgFQ/sLq+E8Dj2oDbUfULB8Iq/pGbkn75fbzVIC9SdYBQ2KggOqx316hvn5McUsdExZNPVqqfiZy2eJWY2s+CocGu9k4/u0vCSZk4TWwUXx1hwTxnU5wCk/k8VuKxQl4Nrq5pKQ7pyia+9O9EpsiaiEG7tg4is+hz4wGzmD0Tzl0xrgI82k8rfMilFUB/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJFoDtfMFzWA34fz7xmu7AX2ve+tOoxp2McVJuCy/aU=;
 b=VWNebqgi4WTlJxfxvYosW5liyIWFK6vrCbvf18tFSRG1qYFUTz/BdTt4u3JFns6YQmo1eD51KHkrYXwUBQ9gvEbABGi9em92ciSdPv/tK56KPwpCuz9/xy/H/XSNTpbSsT6VbX8f15/dadsRQDAm3g+15bFQ7AfYgkJJb3WaS/vL8DFGSVcL2FvCCcvtN56XvBf5/G/WES4M8vVG0SjiFNjjdkmKLeiwR+6705s2Shjl03ZoX4IJ2iAs9gOM+gyldHdTX5bwrLnLz/NJ0BZtw9ggKJJnA1TrBZqX+6Xi6jhPGIkFxwtuqdcnP5YKraN/MvruIFXbNnQAKFHxt0K6cg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by MA9PR04MB766428.eurprd04.prod.outlook.com
 (2603:10a6:250:10c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 16:33:03 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 16:33:03 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [PATCH 2/3] phy: lynx: get the PHYs listed in the lane nodes
Date: Wed, 18 Nov 2026 18:31:33 +0200
Message-Id: <20261118163134.2149894-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118163134.2149894-1-ioana.ciornei@nxp.com>
References: <20261118163134.2149894-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P250CA0001.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::6) To MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI9PR04MB019273:EE_|MA9PR04MB766428:EE_
X-MS-Office365-Filtering-Correlation-Id: ce60d5c8-28d3-4dc4-6b8b-08df45919db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|19092799006|261022075727099003|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hJfezcBlqpU94O3WMd6qI9PkLTMTMx+7HK20NyhlD9a2Vq4h4H8fIWSy1/e75ro323Me761jjghtQ0r1gH+djVTHXiDUg1OffLqMrsEAYroSOaNf0WY1RRxa/oPD5p/5j6xfeVQPzJhhKQZWpno9Me05vtIPHmsYvRIsHt1059Zg45xWP2LROwB1IP4RvWsyUlKkyCW1K0cL88dHJ8cO0udByYeCpjN2DexXnPf5jt3tMH4e53Iud0gcNRCgGfuvQu2ceg4qf90hEBBzqJ3+aBgaYVZxAF4gSkfAvkXwBaHzeknbGJWCZ2aaMMsrjd4fZ6TuRuhJYg5d0vpyaeUKjXUvlWghczmTJi6+sHOp9wGQxov3xDAKpg6o1Z86i80HJujGCPT6JN1LPtuiD+IWShJXfDab/zTnvVLqyUs+XuHUTY/yOnUuBtCa0OvwjVgGig3k+MPhJwbv32c788qwkPCXuNR96LvELchaA5L+IngrWz/XauJNNkgy24mnMTfBpsRIUjxJTzMQcI+zL/dMCxMQddBR2HG70CHqSNQ54+TekcyRrTy3pWmVq89iUCvpGYCkcZzMzgaUokH1hXllEXS1Jd/c3RqbB7tUpp1bo5qBemuTp2z2TE4SIwRS6KumqUHJ0hh7o3ldrqjZqed6Ana9QFvhhQaR1bs3CrIbWp4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(19092799006)(261022075727099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OY3Q6AUrojzKpsxHp9BgGARzEA0m9NNQhOqQftXwljZ0zPZFNEeoQYk9pqUn?=
 =?us-ascii?Q?jPnSsy2w8N1djXfcsb0iRN2zfy5k1dTuOBOrwUUW1rcu9F7lkksuogSCTMSR?=
 =?us-ascii?Q?GhG0x3SwMt+bqnC4sTJPDSy5chaZE2vrqsNEemUmNK0eSBBFS0+ryp3wcGVP?=
 =?us-ascii?Q?Ii1Ptbi4PSAsWpGZh0u2N18szQiKBZMgbUMtjgIoJbiv/ATUeaMjf3DoZ7q2?=
 =?us-ascii?Q?F88uaFf+qv+YuogogGEZAIHMHQqw31ANpf+Y5PUBCjXnGEb1Fnty4ifHT6xb?=
 =?us-ascii?Q?JB0cb/dEgwy2NVCW9Slxeo+plPUEL2jDtZBmADyFYaDEP9gJ6ePfkk0lCRLL?=
 =?us-ascii?Q?eeYL57cfNLUGAsINDKNDW31T4QHzBxhqdlBCXBl0PfLxKowP2eHO/CZMguGZ?=
 =?us-ascii?Q?S1inPp40ShnAS2kQmLXiSwDQzmmk2QcFF5Gmf5ys0qzzV5D2RbC6QkrI3eup?=
 =?us-ascii?Q?Tdv2UQpLjUpJZa1OzXBhwG+S8Xazmzant7zlkUZlflahDxajmIS3NpjrObpw?=
 =?us-ascii?Q?l3jEhjR5iVeQOesztHWq2JnXuYYk2IxktDtP5DQDe6o1i9CihXKy9h+ClqZv?=
 =?us-ascii?Q?HTZEbrUf411OM/KfMYN+JFFupAFRtSeQgo5ppqHPEpHjGOGmxpFwpPCOgb0W?=
 =?us-ascii?Q?qRWtr5WBoZWizYSyuZJYrPvHBW62VGrYzYGaoJivk+XTFpviWHu169YshZG2?=
 =?us-ascii?Q?8Iv7cOqSG2Dat+qv/hC4KeNTg8dOloSdc4IdEeC6P7rToQhVsWrQVGC/IrU0?=
 =?us-ascii?Q?6aDVdcef12UCAOqXfaEQ871Ae8StuqGwlq2xhnCDmn8YvDoQ49NWprl34BL1?=
 =?us-ascii?Q?MXccBxeNa41pw1Mn/8ad154Cv5opYbT9S8kQrKRWYpbKRmRb8b5b2BQsQf4+?=
 =?us-ascii?Q?sTYQYAVeOapa1D7moHLLKZ4I8DyhkfbegmKaR/LkGLPFlplhpwen3XyCFL8F?=
 =?us-ascii?Q?Cf9CS78qrVtcJXoRC/tBfgDT02S1wr4zL3RRVcLBHePp3fX6Y9y2g9PxRSlk?=
 =?us-ascii?Q?c7adWyM6dDJhuxyAz2d4Ql2r1ZSbsCSb9ZWjseiEWANohBXuSHu5Ze8OQ2Zh?=
 =?us-ascii?Q?8vFE0/ApJBLrCMxGwxG+7a3okDtCNgOhKtsyH/J9YKxJyxZ3ESI2pZDjY9h+?=
 =?us-ascii?Q?SveG7Mp9XYNZfDfHvWUcr4XanZAlS+MeNX8fRRO1TD57G+V/n1xygb6D4pBO?=
 =?us-ascii?Q?D+cQlg4FdcNIi9/ddAXtVagO+/vuzLPEor9OtE5oJzB6c7SyI3M9F5HlxbER?=
 =?us-ascii?Q?e40UHOWesnnA1jODFABmORuk4+8eO4MCgzGLVhL8UbHmx8JhB9Wpv8u/VOWO?=
 =?us-ascii?Q?RLE3Xe2L6ZH4AkDMWJD8LMuNsgDj3tcYnZYLnyiho1Mzk3SFzAj9azG4KADB?=
 =?us-ascii?Q?o2berNNJdmmk3Ys7D1+zwvNo41hlXmB9buuRDz/d/jfp4/0x8QUUkSHoi5Pu?=
 =?us-ascii?Q?vB+EB2J6JFVn20etqTRQcKEbZ+2d21GRpVQdOlO5htEFFCByroKGUhQLdI+V?=
 =?us-ascii?Q?MxhXooVMKA2DqcNacBulwj5ShXsEZka3O12U3MkGKu9wI/ymnjlT3WPtIQh0?=
 =?us-ascii?Q?JMYUopN/Tj0iR1t9scKxN41vCvKgMQ5R2TxV+6KjEKKPyXeB4oYXKZbKk34b?=
 =?us-ascii?Q?NgPCnYTTuqSEqeQzqW4FpBxsQFB2LrFn5JaGi3f8qjoV0R58nbbPtshfWbLv?=
 =?us-ascii?Q?a8QoeKEY1zBTxoVp7Bs2joQzZCtAzUF8zRE+qdj+0miLdxyiVcOXLEbQdOxN?=
 =?us-ascii?Q?WnSpIBStxQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce60d5c8-28d3-4dc4-6b8b-08df45919db2
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 16:33:03.1834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSC9Cz6JlEBbwP8S6VprmwFKE9Oji1iqeVEfTcdFHDow9aYkmZk1TmCO+EIRzED2Pf99wqD/4lXSZ9WgpYPwJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA9PR04MB766428

A SerDes lane can be connected to the connector through other PHYs, for
example a retimer, which the device tree lists in the "phys" property of
the lane node.

Since the SerDes lane can work without these downstream PHYs, get a
reference to the retimers at lane probe time but do not let them prevent
the whole SerDes driver from probing in case one of them is not fully
enabled:

- On -EPROBE_DEFER, ask driver_deferred_probe_check_state() whether to
keep waiting. It returns -EPROBE_DEFER until the end of initcalls and,
with modules enabled, until the deferred probe timeout expires, so a PHY
whose driver is only late is still used. After that, for example because
the driver of a retimer is not enabled, skip the PHY with a warning
instead of deferring forever.

- Also skip any other downstream PHYs to which the driver cannot get a
valid reference.

- The DT bindings do not limit the number of PHYs, but the lane keeps at
most two of them, which is enough for a retimer with one channel per
direction. Warn about and ignore the extra entries.

Forwarding of the phy_ops to the downstream retimer PHYs is added in the
next patch.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 drivers/phy/freescale/phy-fsl-lynx-core.c | 60 +++++++++++++++++++++++
 drivers/phy/freescale/phy-fsl-lynx-core.h |  4 ++
 2 files changed, 64 insertions(+)

diff --git a/drivers/phy/freescale/phy-fsl-lynx-core.c b/drivers/phy/freescale/phy-fsl-lynx-core.c
index 2cfe9236ffc5..307427b73d40 100644
--- a/drivers/phy/freescale/phy-fsl-lynx-core.c
+++ b/drivers/phy/freescale/phy-fsl-lynx-core.c
@@ -1,7 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0+
 /* Copyright 2025-2026 NXP */
 
+#include <linux/device/driver.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 
 #include "phy-fsl-lynx-core.h"
@@ -319,12 +321,70 @@ static struct phy *lynx_xlate(struct device *dev,
 	return priv->lane[idx].phy ?: ERR_PTR(-ENODEV);
 }
 
+/* Get the PHYs on the signal path between the lane and the connector, such as
+ * the channels of a retimer, from the "phys" property of the lane node.
+ *
+ * The lane can be used without them, so if a retimer is not available or not
+ * described correctly, for example because its driver is not enabled, skip it
+ * with a warning instead of keeping the whole SerDes from probing.
+ */
+static int lynx_lane_get_retimers(struct lynx_priv *priv,
+				  struct lynx_lane *lane,
+				  struct device_node *dn)
+{
+	struct device *dev = priv->dev;
+	struct phy *retimer;
+	int num, i, err;
+
+	lane->num_retimers = 0;
+
+	if (!dn || !of_property_present(dn, "phys"))
+		return 0;
+
+	num = of_count_phandle_with_args(dn, "phys", "#phy-cells");
+	if (num <= 0) {
+		dev_warn(dev, "%pOF: invalid \"phys\", skipping\n", dn);
+		return 0;
+	}
+
+	if (num > LYNX_MAX_RETIMERS) {
+		dev_warn(dev,
+			 "%pOF: ignoring %d \"phys\" over the maximum of %d\n",
+			 dn, num - LYNX_MAX_RETIMERS, LYNX_MAX_RETIMERS);
+		num = LYNX_MAX_RETIMERS;
+	}
+
+	for (i = 0; i < num; i++) {
+		retimer = devm_of_phy_get_by_index(dev, dn, i);
+		if (!IS_ERR(retimer)) {
+			lane->retimer[lane->num_retimers++] = retimer;
+			continue;
+		}
+
+		err = PTR_ERR(retimer);
+		if (err == -EPROBE_DEFER)
+			err = driver_deferred_probe_check_state(dev);
+		if (err == -EPROBE_DEFER)
+			return err;
+
+		dev_warn(dev, "%pOF: ignoring phys[%d]: %pe\n", dn, i,
+			 ERR_PTR(err));
+	}
+
+	return 0;
+}
+
 static int lynx_probe_lane(struct lynx_priv *priv, int id,
 			   struct device_node *dn,
 			   const struct phy_ops *phy_ops)
 {
 	struct lynx_lane *lane = &priv->lane[id];
 	struct phy *phy;
+	int err;
+
+	err = lynx_lane_get_retimers(priv, lane, dn);
+	if (err)
+		return err;
 
 	phy = devm_phy_create(priv->dev, dn, phy_ops);
 	if (IS_ERR(phy))
diff --git a/drivers/phy/freescale/phy-fsl-lynx-core.h b/drivers/phy/freescale/phy-fsl-lynx-core.h
index a60429ba9324..c2ad81a9144b 100644
--- a/drivers/phy/freescale/phy-fsl-lynx-core.h
+++ b/drivers/phy/freescale/phy-fsl-lynx-core.h
@@ -9,6 +9,8 @@
 #include <soc/fsl/phy-fsl-lynx.h>
 
 #define LYNX_NUM_PLL				2
+/* Enough for a retimer with a generic PHY per direction */
+#define LYNX_MAX_RETIMERS			2
 #define LYNX_QUIRK_HAS_HARDCODED_USXGMII	BIT(0)
 
 struct lynx_priv;
@@ -33,6 +35,8 @@ struct lynx_pll {
 struct lynx_lane {
 	struct lynx_priv *priv;
 	struct phy *phy;
+	struct phy *retimer[LYNX_MAX_RETIMERS];
+	int num_retimers;
 	bool powered_up;
 	bool init;
 	unsigned int id;
-- 
2.25.1

