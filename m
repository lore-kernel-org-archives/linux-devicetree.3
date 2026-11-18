Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795019583;
	b=v3Kf8kMs34PVM+99m6KPByV9mIuG0arVMEQbiAO7rL+ozHvTnLR9lb1NMoeqSOwicNxI
	 0VCHD5oe0Fum2XmC3/bxHXuQXtJBoPpPK6A1OpNC+NMhILfe/yGGtWGmeKJTvpYbVxD6R
	 NXyJ53Il+6AT2Vm5S3suPNSNxDp0W2on+63T9JfRz4ea2OGb66JPIKJ8EFmIySu5ZZoRr
	 FEvgd9KbJaR6ka1KyxdJx4IytfOLsqYhDa/pwgjzajRE7u2fxmete7jAZGWzoQ8zMkVpl
	 N3XSAbFAMfFEhnDRlxaA4AS60SAyZXRc2sLTs27iebaS3M0g6TJKZIcjh13cdkaMqCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019583;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=P5YQSXH2nnhBy49ynhKIO379xmRMN9E4x5+MoRfmRMc=;
	b=bZ9MER1cL/hZX0joYEkvwkFnlqX0qKBEl/tuod4EBUOLkvUKiKtorEbKEil/gIrjqMEi
	 aHBX6WEkDGTyEvoWpDyDEpddQhnJDSIsUlozmCm94euyXe5lwoefjt+0+hr5iOB5eHtPh
	 aeufCwPS1fRgBYiduDR2zhptik2WxR2qsOoxhq2eYt/N1ZP4L53nWOchAYmlaxoAQAmqB
	 3IedVeaHoXEuRX1AfiSTqmXOG25sbkJMVzEyr1nBsx+1QPnRxLvsm1nC9Y1hEJKQsq3fJ
	 BR0NWxU+Umxjy3paltu/9lNJm67WFwwzKAACDpbfWVuuPQWdcuk6oGy5YlkWlV1wLfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=UzRWwSyk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.3
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013003.outbound.protection.outlook.com [52.101.72.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6D1606A33A;
	Wed, 18 Nov 2026 16:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B6D1606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=UzRWwSyk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDcRH5z0JXLtPyjDf/GzbJGgNADZCBdgBYjUjgC6R7TIQM3HgV9RON3r7SfY8W244/Sj2Xwc1eFtkVFBoXnuZzcs8sKJ0eJhbG/IHMyPfEr+4ba/2gEvJxzuU9YUN+l+Pab3QWHE97QMcpsoRCX6A7Gu7qcqoPgtUJ7YjE0xtuCfNuDkovaLGlx0jd/eI/roalejQK5pgfpGnvxlEG8dWuj47MrI9t1gR05mItSo+J4g5bCbmGAVYcXQHjIY9cWCtBVtJAzgWfp2qck/DS6y5LvhBbzmITzR1WzqUeqoi2xHi0AqfimWjdZ+YEZpquxA3IZ7H6VASXHtkMl1iqybEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5YQSXH2nnhBy49ynhKIO379xmRMN9E4x5+MoRfmRMc=;
 b=FOqfuOibJwLkqtSrvaDXJc20eE9vyXJRtzHb80eNqclSPNXuJTu2Q8ZbTOfvuiooLYYFuFjUwCiMLVnpw3tyyCyTYabFy44ViGaCg5lVKg9UstmLiLTPsFEC8GcZuNg/PR8W0l1NMpVTHB421W5Z2/YkYI4T6ofkRzndi14kuKnDBnfNflXEwb+CLNomGjhQH6B1mmrP/Bv7h3FQGU4FyYUKHBTGWPJ/58TLJnCvqz6WfPbEhd6pFVFsAC4aeYqrkALXJ/VcDFnGV2xbiHyxouD2w5+Ai4uLMu2ik6l4fG7hqW+kU0TSDTl6Yvix6/I8y+dPorz6w6J1mK6UaqqPLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5YQSXH2nnhBy49ynhKIO379xmRMN9E4x5+MoRfmRMc=;
 b=UzRWwSykWSqYGyUYk9XaB1YjJjJqAl6/iCguF8MMR3nOTfQCds1+7uo3SioD+2bqm+XGgxLdrv2A8GFB/eXtaznuoca0JJMToH6XjWQcadjg01rV2KA4srn5u3N+iMRlXkdgEwEOcsKDoM6s6i56cB9oloctdERiPROtBIXes9z55GwTQFZQ62laDVZIqgwmyXp7/yJUnT4L5DNpk/NbFRFQwqcD3nj3I9p+ojdE3ucDjuZwSgodii0Ioe4FkF2Mx7M/XqIyl9+VtP36FM6LuhoIZTR+DqwRQZ/SspHFPYM9j4cDoVKb9wuTjcW3s/0rWKLnVtNYZ44jv2O+7qslHQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by DU2PR04MB8999.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 16:32:58 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 16:32:58 +0000
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
Subject: [PATCH 0/3] phy: lynx: add support for downstream retimer PHYs
Date: Wed, 18 Nov 2026 18:31:31 +0200
Message-Id: <20261118163134.2149894-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P250CA0028.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::33) To MI9PR04MB019273.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI9PR04MB019273:EE_|DU2PR04MB8999:EE_
X-MS-Office365-Filtering-Correlation-Id: c663fe86-f4d7-4a32-bdfa-08df45919b29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|376014|18002099003|11063799006|56012099006|261026121527099003|261021121427099003|261021123027099003|10067099003|261102123227099003|261009223027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	nVEo6zsUekodE4M+nPeF+MDktYJ9hEZWQjF5SkCEZNyr0WsllyaBOj70DU2h4Q/ncyxFQ+tlkykxGShag/K6WiwzrmtLTjdROzsuvS67VCw+1EX49woEYLsG580CL9FbTSc04UE/C1ZGi7P1UjyfexH+rYrTr8vD5mm4Sooun9QQmPEIqTDGaaDWnHySPFXoK9C1dT8VhHYLYvf/4QWXojvXughPdca8tbh6B022umLV2gSWOpL8NX98lBx9hPDBBvOORuGslN8oLlJel5HRgD8o5LbVQd848+JTidshZ1Q5iYOWr3FX2ZCdJYPA90zJnnggibvvJekA2CQ2t/oWiThTGwzkYDr5lWmDEZ+4EXxqjyOO90OMC1AH17T2crc4KkWGn+vlMoFbdFMqXtxW17CF3hEF/JnIrmjKJoG6QP2v1Kp7R44InK7zxVH54euWXNUEy2VUfpovk3/VpV6PgpuU6SXh3B2FW6Jwj5SP6X6uz9WwSw/Nx6nibET8ZPaBmU6nodsufhQDSp9No2e+G5QlnRk2qTCX4/QNeQB6+SYsUu7EMgtUEJ/4yef4SUtUAEaai1MdQbTfxridSfLOhK8vF20e5+p5Z+szRr7NAxXxcSrWSwOLye5+c05H71owKIRbirOhpGW1ukXGKMMzmfxY+iZF/2lNbW94DlWcm40=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(376014)(18002099003)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(261021123027099003)(10067099003)(261102123227099003)(261009223027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YbplEnleYwVaDO2h5vioxZxTzIIQ6NvHB6t5DYYJ5AXgxdpIni5FMucV0V8v?=
 =?us-ascii?Q?Dw85q+A+3SIWnn89D4JvzqnbO7Y8QF2ErLOleol5xeR/kgw5D8lNM7KsnkCg?=
 =?us-ascii?Q?6iHtICrmAK0UD6BgIa5E8x9C2YBnpW6Pmrncpei7x+LTE9eDRhJjgOAK1g+I?=
 =?us-ascii?Q?9QSijMOpAAJF5tnyjhMGRv2ct37hZQAHdQIoUn0hIvgdu74yfqNbtnlYDc7G?=
 =?us-ascii?Q?GiessJB0gO/GojF4dDEcP4IYqcl7VUOxNJz/KH1rsrC+tL139VYLU3dWrGQi?=
 =?us-ascii?Q?2O6jMEAI1l0LQL2AgxPnrsjIAmb3bACopt8JGJF2rQlaeGS73fiNw6YDG7DE?=
 =?us-ascii?Q?+ezC0j8xJOfXLxnpeQBvbNua1ZMtKZOnnmyKPmp8TDQimAuV2o8h5spGUEQ5?=
 =?us-ascii?Q?nvoPy8fg9e5CRoTWXaOSXCcUQNMvpBW4bfe03moeG0SI1082FYzHvXFyrVbO?=
 =?us-ascii?Q?lIOTZ/rIns6CwY7D9auzmz9hUBJ/DY9oHHwFriIJysVZcS1knHWXjqKupEXQ?=
 =?us-ascii?Q?kvPIP0c+ikMDc+e+pVUo6x388uE8UCw9+4i1jfVsH/SXXNgaFXYeJS89rC1T?=
 =?us-ascii?Q?8tyAj7KDunmDZCzZC2blPiTT5oGQgoadbuDX8I5a5iG1GGSfoDYlREszGddv?=
 =?us-ascii?Q?VCZ/UNLjfPkLgd/6H89N0uZP1i5cXOX9GEw7SRBYVV/MiVgkAyfEpqig+0bg?=
 =?us-ascii?Q?7/2zyP+UrMZzfpn++Lk7vBlOXr46j73xi6/lJd9gboH7kV5eHWBjofcWy+od?=
 =?us-ascii?Q?pfQ4+pT9gro5yuelQduuxg1WQOQnbTGnwvt732skjewq7tuZ0wrF9m7Un9Fd?=
 =?us-ascii?Q?LO8i6u4dr14mJ69g89Loj73d7TYPPmDCONpi6vajS/jVlYnUaQvDnOkRTx50?=
 =?us-ascii?Q?138bkutK17hWxmaOQS2uauXM2RE0Ty9Rax55PGSFwQ52dsluLf0Q+zvWvNr0?=
 =?us-ascii?Q?cfyDqFAhjpFynu4B/0ds71NPDDIQzouA5S33qyOPzmCm2YXi0TjHvZsWf4if?=
 =?us-ascii?Q?GxVwfgg63BvKfGc8eHQYXXA/mvHeRm730HYM1/wB0eNzUnIlZMkOPX4PLAs+?=
 =?us-ascii?Q?VsVb6itbqx1r9IEWwsTBzm4exxZJnNg+Bu7eY9QbrVb/malkQB3EHuIuX5lG?=
 =?us-ascii?Q?EJXWUcBHknDdSwc6GG49weZ7i1J8SkRBAWAkBlDpe65LzFqN5dtR1xd1DCkt?=
 =?us-ascii?Q?rdl4+eFtckNBOHMs+yCd1J966DNveQ/R7kUpMM/5YdW30e3oheSWeUu/sWbG?=
 =?us-ascii?Q?8AE8MtcIMCV8JaKCoa6jc3UVL5I9ILqW66+cU3HDmldWVGEwQwBMQwnw+joX?=
 =?us-ascii?Q?Qp99ziEnogIIICqUYws70Cbli2EKwoYjh8RuzBBuZa7Pdx3/4eiDINIU05Z6?=
 =?us-ascii?Q?SFUIrpThGJlRbQ1A8gHT6JKSrFEp5bIi4yTBUfGuy+HjPJFxG5aw3fZ9lc1r?=
 =?us-ascii?Q?nxUIoug7R0z0iI0gH6HWX7u7VxXkOk4udEJ8uuQI8MH7YkwvSggA8XAk9zEE?=
 =?us-ascii?Q?54ApF3j+6JOk+o6KT8GFkVWFj3XCFroHGIDopQZaTIbOd80higG6+QsHcEjD?=
 =?us-ascii?Q?aK2VAq9F0F8owtzakQrWsrGtYsVQeJfmqtTLsgsJq7BtirNXQEliuAxpx2Oc?=
 =?us-ascii?Q?G49MZcMehx0XoaTgWtt/i7ZBBvb3y1ilvTbFO718B9tKFxRcgjZN0e/X/5nV?=
 =?us-ascii?Q?6QExxFpb32C/EY/LwJYFEPW+k3D/xJmpsqrNnbOJ1N43tG0rualPlg/jF7z4?=
 =?us-ascii?Q?2JyG5lshBg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c663fe86-f4d7-4a32-bdfa-08df45919b29
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 16:32:58.6288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHIn/xTN97r+kEB9jOF5NQ/nJefJmxH6MMAThwwCyCTQKfBBGOixgFH2Ntw9Im6e5/gxnA2rNOP4TsMpIC+cGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8999

This patch set adds support in the Lynx SerDes PHY drivers for
retimer PHYs which can be found on the board downstream of the SerDes
lane towards any connector such as an SFP cage.

The first patch extends the Lynx 10G and Lynx 28G dt bindings so that we
allow the phys and phy-names properties at the SerDes lane level.

The second patch extends the core lane probing function with
lynx_lane_get_retimers() which walks the lane's phys array and gets a
reference to any downstream PHY found. The 3rd patch sets up the
forwarding of the phy_ops received by the SerDes lane towards the
retimer PHYs as well.

One thing to note here is that the forwarding code is kept rather
grouped in phy-fsl-lynx-core.c rather than in the individual Lynx10G and
Lynx28G drivers so that in the future, if necessary, it can be moved
internally into the Generic PHY framework. This leads to the consequence
that the actual phy_ops with which the PHY is created cannot be const
since the .owner field needs to be copied from the structure received
from the actual PHY driver.

Ioana Ciornei (3):
  dt-bindings: phy: lynx: allow downstream phys on the lane nodes
  phy: lynx: get the PHYs listed in the lane nodes
  phy: lynx: forward the phy_ops to the downstream PHYs of a lane

 .../devicetree/bindings/phy/fsl,lynx-10g.yaml |  27 ++
 .../devicetree/bindings/phy/fsl,lynx-28g.yaml |  27 ++
 drivers/phy/freescale/phy-fsl-lynx-core.c     | 266 +++++++++++++++++-
 drivers/phy/freescale/phy-fsl-lynx-core.h     |  14 +-
 4 files changed, 327 insertions(+), 7 deletions(-)

-- 
2.25.1

