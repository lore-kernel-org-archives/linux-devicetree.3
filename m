Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011063.outbound.protection.outlook.com [40.107.130.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84E24266B9;
	Mon, 20 Jul 2026 13:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554620; cv=fail; b=Dc3BpyBVek7G+0UAq70l7yuLAV9oKHdXsIB7C3Z21j4mJsRqznGlXfW9Qze5MNntrutLSNWjx255GICc8mqr0zoDjwMcSf7Zy1EqkxYqpSorbqD7vua9gQka5pyRclXA7zlZyS/VQKf+tL7f++zJp2JpRhdSPuRiVhf0wWEoMeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554620; c=relaxed/simple;
	bh=STH8Y3wi34dErESd2V/MFROQ5qEmuxk3Z834VKYHmkI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IfsujUoVy5w3pyS4F4T6O2SMtwR9vgMQRqROBsgZleHPm73e/fcLePYTpudA44i1BYeAz7eWk51uu76kFCEqCJa/MMVOwrVA1/zMDovUwsV5ARWWX7Uai3sMpJR/QKyNtu7WFsGWMs94yb+FQ9JuMNa8VYlFR7D5wmoCwotEcsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=H5J+1IDu; arc=fail smtp.client-ip=40.107.130.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="H5J+1IDu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1l9e85rsBT3CVV6c/8N3fvfnc6f3LreQobGPf65bclRnHjkX5/IlSEAsf+bskwtbl9HkR8jo38EI2d0biedqD3LXqvvmbluUyD+ABQvSVLk7mYWuSbpVtJ/E/b3dpt0bYPXLqANttbvpUhGJzE94+4H42omk/n4lbbaaHF2A4sl9Rw19eTZYkbhZdfJUSvBI2ctX0EJt9lCjTSdLbiuAqAXjPEaBZ4C2R0PPCG2ZbR0Utd+ldrVypu17abLtWthdyPthHv8zMPAYHyj8mdPxS5vZqAf6JschfuxNBSQTgoF6ScSbF67FXV8KBnlHJIbDWtUIujx177qYuIS4932RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmMiNXxAL6fAFXPRuZK0+CZC+L9jBROLfUUCCbZFKbg=;
 b=OKM7CHzZ3Xz/mrW1WNH1rEVc3Gb6NVbdlVHDobJ85iw3A0Hl+e8xptosqsT5PKdAEE1QYk9juZ5A7rNqVo5CWPq2xDeLCQnSC+7fLBbZXJbko2IbhnqgSZIXr5eTYlqlQpFSwScV1TTxCqWFThljDzieT7LASzIA6OSyoFmkHqUpOUcEUY0o3U9vZanzzFUFE0Y5CkvouSB4HoyK9uQvlvKMblA2s6iRNoFwPhNyv910zNoXl23Wdulw3QQp5EPv0ynEy3Q9aVQAFSPINwzJIjBGw++KNHVCUy2T5xNK3HLIAvxf31/x+uxbmMJjRUKNnLj4TVK1QDRaCCqswFnxEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmMiNXxAL6fAFXPRuZK0+CZC+L9jBROLfUUCCbZFKbg=;
 b=H5J+1IDuNoQt0Ib4kZ0ARhcOmuvtAkNQ4Id5UPBZMruryIMKJRHROygZpEYr//Oa30LA60EzW8QyaAFL9jU6nRr2p8Q7q22QB9S7A3Zm+jPMZ/FwqluyICow+TaYk/ND5sGbPDFe4uP/uZp5Wojr/F42g5m+u90HlHRFwxIK0cs1Tpk/m2EgwBQjNTS3ac1qMA2dLPassanI25MKuUdnRw3vTMRKix0UU1JKfu6hVtpT/0LJB6wjj7591yRxvus32faZxoiuQiKMTLsQuZFYC3Op4VrJ3EM2NpJboOEox84e1ZG1bqqlS+pTj2MM1DYNMqNCbBBXoI3OsNcg6djONA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by AS8PR04MB8626.eurprd04.prod.outlook.com (2603:10a6:20b:429::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 13:36:55 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 13:36:55 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 phy-next 2/8] soc: fsl: guts: add a global structure to hold state
Date: Mon, 20 Jul 2026 16:36:36 +0300
Message-Id: <20260720133642.136324-3-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720133642.136324-1-vladimir.oltean@nxp.com>
References: <20260720133642.136324-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0022.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::13) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|AS8PR04MB8626:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aa51dea-f1a9-40b6-1c7d-08dee663f6e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|23010399003|366016|3023799007|22082099003|18002099003|10067099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	7NR1j8ZUuBf1MQD0yDTZ1/w661n8yOpUFB4XIPpZIvqyomyQDklPuirteVB/aY+4MValAZRbX8C2Vv1wEQCRAoD+jgZ/I4C3S6TfZ5eHju5Fjo/B6mwlxXOabOnfbfMNeLrZ3YHOHZ3taJjKZw8Ce9auMn6afy4pY4HTgg1L730maZwWwSjhbyHXbP5izcSZUi9LbTk6J7xZ8Ex8LYqamZ0JnWE/65Y/MGUolSbbBJxMw3vnS7G+THGGt3i5kWYmjVIJ4szk5Il59KBEWn0ZTvV0gGLO07OzpIe2byq20qK9CvZIYjzM1ug3hCexF7D6i/jvGzVgINUMtM21fDGL7GhWRi9MYiZZosR65A7c/BdwhOBmokczEHrSSS806kdSkNHD7ohYQ+o/ptwyhGH0RVlXM3KB4AWrRIwQXvETIJDCvObT/D9LDYfu76BQFUoZEBWnWD2vMH95WWF7uU+tf/PNgRbNr5hS/+trl0shHqFycoXFP8L3Fr9wIpIt+wRCb+vaCSDpjdAL7xIHwPpWpjVIA1/IJZUdpX5MVy1bC0YbQ0vK1Jwjijecf/PtMz25DszENFRlawzfbLO7l9ouse8wW4EpFv2fViNo/90EOCj7455bby+zuj3UqguEZ5qfJ5lOo9ygB4dpExhsu+JrFm7D28JEYQSH8uQa4c4weEs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(23010399003)(366016)(3023799007)(22082099003)(18002099003)(10067099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WVqSHYF7EXBnS0w6/J2fr6abTe5cEhCHGY0XVd23puBXr0LyQ9FlIJBbV06W?=
 =?us-ascii?Q?QR+ZuAB1DwbQ0XSAxheFV4yEwZMPHSWi5KlJZUT7SYJBmNZlDLfbqbPTWiMX?=
 =?us-ascii?Q?spkYP2wSWadUoBX1Q9CDi5owkjRLRFh3RLKnEjA7ZVyfYnMrm0m+VVhXh0Bd?=
 =?us-ascii?Q?4DtU47Bo0vkEJZAVIietnGvjuPZd/uhCDpxmV/jMEOvSVphMKyRZASIjk7hR?=
 =?us-ascii?Q?5eMQhUOPsBinqC2U3gc81mB/iXYqZLFZdhsuu23EfLlLpYuJC60Qoydo91RY?=
 =?us-ascii?Q?Fl8B2ODrJj/C/n66dX2uCyIKZLHZJLKcVKmMu+4kM/bsOAgzBL3dF1qFbQUy?=
 =?us-ascii?Q?jKyc0bMtgaWlltaM0Ryl43byCsibiS0i3tuoJyZtxNd1MdsRTdepgd1q/Kis?=
 =?us-ascii?Q?5UGDCX+mvs2sc4Y4xiy45Y8xmowcY1DoHs1nWh6so5nFzA5MJwHC/AZQsC7i?=
 =?us-ascii?Q?vA4fCkpgy9O1F/TXf3mCvvLm/MON7p/K33hupse9sAN9Ap+sEKMIlxfUb/Pi?=
 =?us-ascii?Q?sexdHX4rId3MnFvZ9yvxlwed2msr6S4QFJ/yoIhY4RGmEeGvS33xornNO3IF?=
 =?us-ascii?Q?JF48ocRJ94zeiwOJnU+oCYfE/X6VDan0hkW4/pscBFQL0chvqlxx1m/DU6qJ?=
 =?us-ascii?Q?rljv9Y+G2Gdq9p9gjS+yQFyIjAVuOnnG3O+VxotVuFMWN9wRa9z+4KgSQ9a5?=
 =?us-ascii?Q?qN5UkBcENhPUIu3AkpbTduEfDZ9f8U0V5T1Ns1DS5H4hOhwmqbehJy1/guhK?=
 =?us-ascii?Q?xagjIjiDFOdXFTCv1MgU8g37Ow/hGB8LSESmno2KdcSDkWtK2QM3gBJs82kT?=
 =?us-ascii?Q?0pcLFep+2vP4vUa9MEZ6Ffo2cmycXgcP+uv/J/erE32D/fXgs2XRdlryRJ6f?=
 =?us-ascii?Q?7OhY/h1sO9447AuwgsRlsI2JzDVZTxqgte+mL9ahgMK1z+1oMxpdOcOgbDcW?=
 =?us-ascii?Q?hGuGd8pIei2uPMJBTSNXIUTahNFm7n4rf9sotghlX6EoMzsOh1OrclR3gbMe?=
 =?us-ascii?Q?WF+gvDzeMTpqOXep23eun7tU7RSfigAplpmErZ/Pod/Qp8xP4nm8mLvRkb0u?=
 =?us-ascii?Q?NFrgEooIcXqUa8i89WqLMpxaKkps3hFTwSp1Fsqub2RgUdq/I7eBmEwS240S?=
 =?us-ascii?Q?zgM0jR+wd7HMM6Lh4qXKjYxDNxEVytfihlt1Da3XpUpxAb0MW2TpYD8o5Si4?=
 =?us-ascii?Q?hZwdgP4bQfyxzcEVd70uPskazvG5M2JhSoeBnLGFZpUSwBJeT38rDakL7CIq?=
 =?us-ascii?Q?R44kcGWiFgYClKnlxKFp+8ObiauudNY/h4PUgxWd5TTDiWUQ9QWLN0pxAd0N?=
 =?us-ascii?Q?C+rAsDUc14rd5vAg9bcs7n9NUCxdRhMbpTd4C9BiI98qMKqv3GRVkC+UXJbc?=
 =?us-ascii?Q?LgM5Njjql6oqriSlXwthFgTAcvsqrewLJ7rs7wjNE4PrSsMWvmmxFz9UKvWX?=
 =?us-ascii?Q?ha2q3dOO4JDRVJYtmn2r4xXKq+VtsjzFhoLHweT0p8EAxs56qteYYDmXnm5b?=
 =?us-ascii?Q?exZxRdhmwQABw6vUSSqpQLeQlIw8KnL1e6sbMehLZxZU4Qh5U+ImKFec0dqP?=
 =?us-ascii?Q?/hvz0z96Ufp62ZkpCWUJP+PMe2JRhh0d+tPyLjdtA57eZpvAi0Dcj0ekN0KE?=
 =?us-ascii?Q?e+bR3C0lQDM/+QismNO95IiZOwG5EidZrZDV6qaJ8+ERfViDTA8wXpXbLp0R?=
 =?us-ascii?Q?tMG8EmK/3XSARjoRGeg/3Kec/+hXxniiHjNxIjr+2OniI7Q4WoX0ts36ru7h?=
 =?us-ascii?Q?mxhtqEGbQg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa51dea-f1a9-40b6-1c7d-08dee663f6e1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 13:36:55.2682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lWcS/A9u1ndJKIt1UgolA3nfD1dKdoRfOJuLUheJpzqYYm61Fdl+wZhAD4A7gFORCro+L6mRZa/E8kO/oBJzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8626

From: Ioana Ciornei <ioana.ciornei@nxp.com>

Add the fsl_soc_guts structure in order to pass information like base
addresses, endianness etc between the init time and the runtime
operations (RCW override) which will get added in future patches.
There is no point in mapping and unmapping the DCFG CCSR space every
time we need to make a read, just map it once and keep its reference in
this new global struture.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v2->v3:
- fix error handling in fsl_guts_init() - iounmap() the CCSR range and
  set it to NULL on the "err" label rather than "err_nomem"
v1->v2: none
---
 drivers/soc/fsl/guts.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index f87ee47c1503..a2b4c477b064 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -106,6 +106,11 @@ static const struct fsl_soc_die_attr fsl_soc_die[] = {
 	{ },
 };
 
+static struct fsl_soc_guts {
+	struct ccsr_guts __iomem *dcfg_ccsr;
+	bool little_endian;
+} soc;
+
 static const struct fsl_soc_die_attr *fsl_soc_die_match(
 	u32 svr, const struct fsl_soc_die_attr *matches)
 {
@@ -187,9 +192,7 @@ static int __init fsl_guts_init(void)
 	const struct fsl_soc_die_attr *soc_die;
 	const struct fsl_soc_data *soc_data;
 	const struct of_device_id *match;
-	struct ccsr_guts __iomem *regs;
 	struct device_node *np;
-	bool little_endian;
 	u64 soc_uid = 0;
 	u32 svr;
 	int ret;
@@ -199,24 +202,23 @@ static int __init fsl_guts_init(void)
 		return 0;
 	soc_data = match->data;
 
-	regs = of_iomap(np, DCFG_CCSR);
-	if (!regs) {
+	soc.dcfg_ccsr = of_iomap(np, DCFG_CCSR);
+	if (!soc.dcfg_ccsr) {
 		of_node_put(np);
 		return -ENOMEM;
 	}
 
-	little_endian = of_property_read_bool(np, "little-endian");
-	if (little_endian)
-		svr = ioread32(&regs->svr);
+	soc.little_endian = of_property_read_bool(np, "little-endian");
+	if (soc.little_endian)
+		svr = ioread32(&soc.dcfg_ccsr->svr);
 	else
-		svr = ioread32be(&regs->svr);
-	iounmap(regs);
+		svr = ioread32be(&soc.dcfg_ccsr->svr);
 	of_node_put(np);
 
 	/* Register soc device */
 	soc_dev_attr = kzalloc_obj(*soc_dev_attr);
 	if (!soc_dev_attr)
-		return -ENOMEM;
+		goto err_nomem;
 
 	ret = soc_attr_read_machine(soc_dev_attr);
 	if (ret)
@@ -269,6 +271,8 @@ static int __init fsl_guts_init(void)
 	kfree(soc_dev_attr->revision);
 	kfree(soc_dev_attr->serial_number);
 	kfree(soc_dev_attr);
+	iounmap(soc.dcfg_ccsr);
+	soc.dcfg_ccsr = NULL;
 
 	return ret;
 }
-- 
2.34.1

