Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011063.outbound.protection.outlook.com [40.107.130.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3359042587C;
	Mon, 20 Jul 2026 13:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554618; cv=fail; b=ZyPDkcRKZhKhjzJoHLL62fKvr/OjP9ljDM7l5xwcpDQA+ziEYPAtsFBmQtU3aemBbSGpLeFIitferQcdPejXgpQocaYKxz5WRYXZI7m16rBTR20s2CqgwvDKSjER12pMEjqE8zFRi0iLspXWBb1uK4qKaz7j6/yyBNkQ7iwRANk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554618; c=relaxed/simple;
	bh=dU+f5Pg4D9zMuvMxGOEh2uvS9kOabbAYg6j2hW4ybo4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oAFWW9txaZCLLSYOcZ1KkrgmyeVQ62lh4jEnndwNUn7RXQGSvIJeoCUZ94hdQreFiKP3HbfrTmE/0eEb2Wpg4rN/AuTBzMDdYMnORDLSQWzLfnM2KnWMSU8pxvG32f4I9oMLKlctY0QlpEUx2Dvz0YXNZ7Ox66qW3YH97PaTazE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hHLxrZbA; arc=fail smtp.client-ip=40.107.130.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hHLxrZbA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWSB4BQdgomiqoqQaM9nJY0+tBAqIEtNOWdEP4P2JH9jvBjcsY1yqLPSdkBJTu13ajOU1M63ws9oMCGVEDwscYKg2Xj+hjiYIBVOG6gOcQEuRz+f/M7+aObgsKqrA6HPOApkMBrSMvvRVcxSEOUCsNi+lYb5OyTAPe4xWHSuIMBmucWxSUXl8hDhVBFQ6+pCPj0SzhavW1FskP79Rfxeeqexkp8YIanjp5OHDsjZSe8gMDrb9LECw9StC4EQxvCWCNm4ay2T/Kxq90KZycezZ9W+0e3oGcuJNnX1uyMIziKES63a6ASOfGGT9Zaf6Uc1TwwJmX2nhE9DX1cz/pmz/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wgozz3iY/XFOrlVr9tAxyaSXAHbOWmgv2RPOTYXaPMg=;
 b=EXERs/yh9HHFY6KK7diMJxeeNU+UJeTlgOyl1C3fWDy9nDlF4VUg13xGoCvYLBluGrhnE+oYmp30IVTvK6ssxcCPNmw8lBzxbEaCe0eMPXuiNKmGcJx+S98EVWl/2LPRxIMxooI5jc+zubW+FGxxVzS8F3tTDK9OBfY3TDNi0tPqToU/gl1hjytPcaO7jLvk5SFswQRKljVa9MdGhhRWsG6/S4hHV8vQ7EJ7X+j7KcWXmjocVDBEH003e/WmWFBrjRq6MIFiY0kcDwL4WcGj0a0wN0iS4+T56OG+cCdIE0h+00zUqPnrSGJ1yekg979+vesEp5Tk39fm4V6ClIHGBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wgozz3iY/XFOrlVr9tAxyaSXAHbOWmgv2RPOTYXaPMg=;
 b=hHLxrZbAX5ThUo3A4K89wVsJGP+Y7Z+xWiVCtaDQ0E6Kys14eTNAv37IwvEF7dYPFrUTPfzOAKNhyAoGJAqPqf/C82/JWW40019xFVft0EuOM0ezQHLiFRdlJgc11qNq8WmuU4nOuRHjb4si70BEhJFPwuKx0bQCMQ0vJWu1nponARzZpV1MhnbT/xF6Fx9IyTwLq95fqFPOwidSYd1rfDoKKsOK/DkOdIJ5UHpO3FtGb3RMhYir0tlcHmwquMUDZKj0bWaCPuQACYb6i6WXsC8wSABwYGiM8KWang2kASD2/Wr3k6VXv+OFQ8MDroC3U2fv+zMdWjTy3B9t68jcng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by AS8PR04MB8626.eurprd04.prod.outlook.com (2603:10a6:20b:429::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 13:36:53 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 13:36:53 +0000
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
Subject: [PATCH v3 phy-next 1/8] soc: fsl: guts: use a macro to encode the DCFG CCSR space
Date: Mon, 20 Jul 2026 16:36:35 +0300
Message-Id: <20260720133642.136324-2-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720133642.136324-1-vladimir.oltean@nxp.com>
References: <20260720133642.136324-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::14) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|AS8PR04MB8626:EE_
X-MS-Office365-Filtering-Correlation-Id: b292f0c8-7b15-4b5d-5e7c-08dee663f5c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|23010399003|366016|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	oFsbwtCClYH8IBiJf/dADNgDuNCv5zvM+1k2Tq8W5TS4qlxxdcPjLEGNluHxg9ligpA3b1wkGQGlGIkbBLJe520dgSh0ykssXWNb+ls5d6HTS2pLLyzuvrjWjnXqmsJCI2ATxN6Sb+tou+/0AulrBB1r7QL7GjZFDX14U7KiSxH3DuNujgMyDnOAJrr9NhrrbVTsnzNAqHla5g5ZLThqlHFzmxuOZbgr0mnX0L2CjXzY0y9crjDIG26uHkuIRoHcb/EermvVO1fvF3Ln/XGfnKsyWvvB2ZffFlmNHMFahvjSMwGclmYU9Fkd5p1KfA7G8y/TRLtW9TodbpXULgiokxU+mmGGCWa8K2Md38aHiJf6Eshe0gr5Ze/SgmQZ7Trit6I8clydxDjQevyVSYgJikfB4/VySep3YQhxF9F13R+pjeCtQ/U5JIKyAPuO+4hResmpG+WfGEN0bLLqIywIZ+PfzLcOGh5hCWwmBZ9e0GhlsoFbZOv+XK/7GNvRcVGsU/xKeYbYpSfy+stQdFzmecGuCqO/CPnHBSQyyhRXRdmA69V+GvX3HNcUYK8OWsTwle3e7/WDEqEVhkyI4frLg8xlwxVzKy5wx4QyyipaTznr7eTQA2CpeCGB+2TsVC3d/pMx2z/EFvrVsyxDlBW6xwNeq9MTLYs8wj1WOFUiXb0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BQoqqXeFUgsRNKov0EzNDrjZT0SDoW8/xHNsNlzNzRFSu7Xe6MsHxOFNpBIj?=
 =?us-ascii?Q?46X1aeEcDpKkcxfC+Ggj/4Dx2xeEO3C/MCNizR41VwVz0geACW76fx1pkS/t?=
 =?us-ascii?Q?LhrKoDwlWcq6aS3Gohh2+Ae43DNea/fwq+GORAgr/P68GG8Y6/IVzjR42JqO?=
 =?us-ascii?Q?HOahMup+7CF4Xie0OO+7tDB2+D/XHariECNqOIccaa7fDPdC7PFLJAnheYF1?=
 =?us-ascii?Q?35+YwLtioR3Jp3iIPg9dij/o7IjkPKeiNSDwqzo66Fbu9atNIiU0yJcw7eHC?=
 =?us-ascii?Q?du2tbGh5clAepZU5PhIJwiPjad5f54QqWlVhSKQ1ZrLkrclphVXO4ExRhu+C?=
 =?us-ascii?Q?BLdlMq7g+d94ffwnBBO8HltbrNEI6RegMM+4wt5Hg11uSHWj7j6+xd77gAWt?=
 =?us-ascii?Q?/lEnG0QZfe2axU9GuVSr+Pg74eb3gR13dJK6CE3pXih1P4twUIGJt3J8Slub?=
 =?us-ascii?Q?s3strWfI7y1GQ6rwqqlJb9xSCbzPj2COqsQttPe7bQqqitMew27XBAgGVAqM?=
 =?us-ascii?Q?sREFigAY/J33JFPPIOzHwXWWiVgBnUXbQfD7HQ3QbQEd1OTkK+vnnXIldq7y?=
 =?us-ascii?Q?snP+vpOnkSmT2iyt0J8hhQaWC7+Haqwm9Ng/h2e1OnpqX3C1TErrsYV7UurR?=
 =?us-ascii?Q?bVXWArB+JYd6A/5ji8AvsKp4pFiwGVKlf/rSxFNyXVCCxvkY2l/9t5Yg+c7l?=
 =?us-ascii?Q?qRSmaKkrwWdYzfoVx5yGz9m+8kLp7/Lx865AiVHrlPJMyzhkxMRTnC+rcQYE?=
 =?us-ascii?Q?0y1jhCCGOo79O+ZTcoTQlkClzZdYsgP1qwX6pozHnECm8dQHF/QDTZxJMNSg?=
 =?us-ascii?Q?KCG7E/sRNCb3TXhii5qUrWvKEgkUe/4LGQLzlLS/o8/IaaM0za750rvM4wL3?=
 =?us-ascii?Q?2by9eaCvbUmk4S8vvkwq0kAgZ/nMWpO2BexR9BDooIHecLTWRmFNx1IcIy/4?=
 =?us-ascii?Q?8D01UsZ8cXc4o2VqZ3E9jGVPnxMagMEuBhn+Vq0d43XibUL37H/d/G8yaCCq?=
 =?us-ascii?Q?sC4jR0NIFBb2qTZ+ZrpxTGP4RvaKK2wzi17cMpH3NOv4WhUwsm8vnj2EuSak?=
 =?us-ascii?Q?0fJMkF8Fek6FcYIygiAYu4Lbvv0X5RKGgpLoMdvv+7oa21V4PIvVCboVfDhv?=
 =?us-ascii?Q?HLhvcvE8XU2Zb02huK6oAj9ABhnsYdVeCZr6BBEDnV8hMhjewLXI+XsiX5Yr?=
 =?us-ascii?Q?v7Yl12W1/HajZEY9K9zdkv1i+kyzcgkBC0p34ICYdTANNIzX7rd1WnGElfHk?=
 =?us-ascii?Q?xVd37ruOrMCpGplapSdA+6C1ONZnxR8fAr69S1lsifJ21K8G3Ot7tDsGhgaV?=
 =?us-ascii?Q?gRzh9kIjTW/Byh21O49nHvrrKeDz6lOciqgcIH+MVpo2D9n4bSg58bqcrDpm?=
 =?us-ascii?Q?rGFWDZ9+m3UYawO6H/3xMd/qyjubanROEqdTKGlv+/SkUkfonGC9nVoJ+Nt7?=
 =?us-ascii?Q?6bCT3KnvfcwBPgEGkUaMsv1AEkEorkyTIGsmkAU/CrNMvJijQWTjZC1cKBsi?=
 =?us-ascii?Q?GVELJLtvnOr7EK/qZiCkLa739dSKCaJljdCRvD12Pc51pqqriDczBvpvUEJD?=
 =?us-ascii?Q?NW66SulEsFGLneWTNoUClmYb3PfhAneH+Yu4XkI/rxL2/uco6uKl93XkkddS?=
 =?us-ascii?Q?zOI9McdNqwPlhXI3dZAkRtxLnwFYSKe4jlaiXUslTloBSp8FCpoyZuSMmh96?=
 =?us-ascii?Q?quSB+DXnQmDesZVFrXYP0xih324TS6dqY2E1NO5y4AzXlFMv/3eoET70miYo?=
 =?us-ascii?Q?WQit3ffAvQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b292f0c8-7b15-4b5d-5e7c-08dee663f5c6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 13:36:53.4008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqcswZuwa0riEE4FCR9hIyAz85WUljj6fFkI3iVz3OCEiW7dXS7FK5Ii//DVi2tGK+eh4nbvEWqAZzDjq8qmRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8626

From: Ioana Ciornei <ioana.ciornei@nxp.com>

Instead of using a hardcoded value when iomapping the DCFG CCSR space,
add a new macro for it. The code will be easier to follow this way,
especially when we add support for the DCFG DCSR space as well.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v1->v3: none
---
 drivers/soc/fsl/guts.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 9bee7baec2b9..f87ee47c1503 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -14,6 +14,8 @@
 #include <linux/platform_device.h>
 #include <linux/fsl/guts.h>
 
+#define DCFG_CCSR	0
+
 struct fsl_soc_die_attr {
 	char	*die;
 	u32	svr;
@@ -197,7 +199,7 @@ static int __init fsl_guts_init(void)
 		return 0;
 	soc_data = match->data;
 
-	regs = of_iomap(np, 0);
+	regs = of_iomap(np, DCFG_CCSR);
 	if (!regs) {
 		of_node_put(np);
 		return -ENOMEM;
-- 
2.34.1

