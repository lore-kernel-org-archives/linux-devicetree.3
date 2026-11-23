Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795473437;
	b=l39rDghziFp1GrXbE3tzFmAsz/jMdSTyQHDadvzY9/l2ZrOhDw5EqWbEsn2836XtMh9+
	 EjTFbag/XNSftl1AfYkGcz1hX+ZAvQu5MVSBma08uBfCSHLOAB8p06izBQx5a1qiXybzx
	 Y0I4yij7xiHGqi02cVTpzdrI065L8nSoyz9GTa4hLEaOVi8s7WcEbpmSisJE40NMfCm4c
	 tbLlW1kSOVYZY8Z4GK8knG2ZTn+XB66o0X+Ph8vCHUlQfdEdlb+Cnl5/dhxUuJIuYRfH5
	 PM1a641zvR9ShRQ4RpZWYEuWwY3wegABAf4b/FGN3zut+mvSDJu/q89Ih9JAf9sMF1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473437;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=i/EOq4TZZ/tSTs25OJTlgBUOYfVCAp1H5O47gCgkSPE=;
	b=a03zNW18EKxhRcUEBkU5djj3jQa5kGODbrPj+Br92l5NdmOV6LkGDXKeGgg2pcFOwVSy
	 +Z8VPc568x+3geFcUZeIwloDz7BQMm7ZJOKRcqBFbCrWYYZdv6zy1IZQCCnvN79kG2N3J
	 HNHjq2YBgNWI55CYv9s4Lb6OSdGzSMQLRuAmaT/0Tj/PC80AtOdWorbeWyIhBfvw+3V1Q
	 F/hq7Uj26uGrGWCgGUSHJ6qo1aiV5A7ao6Fiq3/i2HE59H31v3KJ6021JdQ8hc6t71+c1
	 BASSNfFeDFnt3TFH62AOo+bSO49Gm9yryCwy4R2tfVSCZuPc536aI9AIkjb4tQPbwWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b="biDje/8X";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.66
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010066.outbound.protection.outlook.com [52.101.84.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082E3606A31E;
	Mon, 23 Nov 2026 22:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 082E3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=biDje/8X
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPkhxRx4YtUguUIlycYnfgRF99QxBUna///2rExH94n80+3iq9XfgJ5msYGAN+gq6uXFh/PB7GHkLMaMvHZnQechKrtxlZ7nzVbwMi9dbyfG6knnwWITUl6yXaCgM5uzR55BAJQIqjKTf98LZ/wVyVFJnYzf6yr4nCXF59MY6NiEF6+3Exscn/hzcP1ykv+AHDtVipwQFTM/LAhWxNH1oS7b7aSekIGsTajiEUYddahTGwWCaXOiZ2ckhCqBDhBm61B+oaea0k11EzpbxQ7NVG+cCjUWKSOHQA7reuLvkPifCyH8kHt9ed+qI4scdYoquNbv+0cn1gTau2pjljtp+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/EOq4TZZ/tSTs25OJTlgBUOYfVCAp1H5O47gCgkSPE=;
 b=vs4t+/xu95FHn85AnuwGRwBim4xKPmwqZRa2J7Q7MJk0U7G5CSqF8rAVn3khXUymOm4Lz1el93jQSOMLJkvX/KaksiSEE8pCGJ2s4qQMrADvc22HHBMZrnx/nwhAuFvSTWcbEY7nUh/wgdUl+EYZB4Yb2GLL7rkNQd4Q1fPb9GDs+ck6KzOvIi8myPn9F05rOL/gzP7axLnx+MmX0Gh0fnhWa+2H9zpwP8WsXB1iXcIOC+RNZqCiqUIbQ6Jvt8jzGOcQyVVHoW5AF2fEGAjinOEBlew9fA8f8lQcMDYYA/qQxRDpkvWLmBcOy3AoEc4cOfhsh77jYfasIcxcxDzlkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/EOq4TZZ/tSTs25OJTlgBUOYfVCAp1H5O47gCgkSPE=;
 b=biDje/8XyeYhEUd5l+pctI5MLhjNbqZ3asDXDm7ubRniyW2480D9m3jQxWDPwvkT8ytOGcfkhfsk+nWedgnvtKKLYtHl2jm7gvpBEiuHHqbXWprN3cn6mGmd22N8UUMR1p21gBULzesbVAXeSEQnzT/6M7bGA2bdc1v+sBhJki9MdQOIYzpqEFEk5wx02zQbEZZqept4nXKsrMkQEjtUkOJDAG05ser+KBl6z9aIV+Ubt+8IwiQoeTj5mZDHRhi307V85MPqghfeMeRWrYZHOIthV9PpqeFAo1SjpJ3YKQx/CVwt9rbnwOBwEU90xr4+GkS5q3sPSzTE6jk4c6XGvg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by DU6PR04MB11181.eurprd04.prod.outlook.com (2603:10a6:10:5c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 22:37:13 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 22:37:13 +0000
Date: Tue, 24 Nov 2026 00:37:09 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH 0/3] phy: lynx: add support for downstream retimer PHYs
Message-ID: <awSbDyUn-ND2oq2Q@lxl00025.wbi.nxp.com>
References: <20261118163134.2149894-1-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118163134.2149894-1-ioana.ciornei@nxp.com>
X-ClientProxiedBy: AM9P195CA0005.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::10) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|DU6PR04MB11181:EE_
X-MS-Office365-Filtering-Correlation-Id: d23b382a-e41d-43b2-c7b8-08df49b25179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|10070799003|23010399003|1800799024|376014|366016|261026121527099003|261102123227099003|261022075727099003|261021121427099003|11063799006|10067099003|56012099006|261021123027099003|22082099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	W1V0OokySk+ozqhCWPGaRWU32u+WBJytpec3eXSfMVqe/1lNy/ugGAbXuvBLoj66IqLTV8ElUGEVA+5z1w+8baHxOen7hj3/ydJrhGl+xW41kbAXHcr2+T+sKzWJhAGK1Sw6/6Vw4FcwTiTwkFuagv6zQkOcFlFho2EmD8xJGD5TKVrOETLDDYaLc53PMUUFEfjyGU/+gZdkDBIjhUg6dK5muQ0Fg3rm/zXHoMGD5Or6s0Rvo9j/HtoTHUNdlOFVUbUMPvy4EWAtHUzs9xFVt04KX4rJVfhx9sZU4aKUVyqT03Oi+Rm+wguUGE14WxQ9F5kyJFRCUhrxdEtTUz5sP7Rj5a6aSMNyc/o6t6Ps4YSdw8s4M4YwtOlUJg6p+Xjg5nTj4l6VtyYTrO929soWDS3Oa8oaQWwDFn8QOg0AxDt78PaXOs/hwgR8vxzyEyBLvBxSkBd3fOtf85V7bPRQMpVsemBoTK9+IJhUpf4b529xg5YVXDWyVRCzirx19tlAM0Dl0wZ4m49BLdRDPsvHoviz/W6Ik42XRDuJgMi8Ueueh0NqACpuMT7BXD0eIlUvroaE/NSCmRqZxyYWTLzlHjqyVGbU5Q3pK93PrPYUqvQD/J8z8B6qd8SZAFaIFEzrzVEo40xE8Th7k4EM/nuPVJUYSqajoFsRsP1v5KXQbzI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(10070799003)(23010399003)(1800799024)(376014)(366016)(261026121527099003)(261102123227099003)(261022075727099003)(261021121427099003)(11063799006)(10067099003)(56012099006)(261021123027099003)(22082099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1p4C4SJkgW8OEQ2unN68lNgeWCRzn8Oxuq42nUmRX3grfJQRHSKqIK9LZsjJ?=
 =?us-ascii?Q?L12FFXyh1mrKjyayMv7/FCNj1SiVMZ8pIiG+oLNdca2yifHgrXty4sxUc6kg?=
 =?us-ascii?Q?aMhP5JgGkaECAn/NzdjTlkNS0VPvTTSACBUj75zFRqBHQo7fwMV6tzAqSuDU?=
 =?us-ascii?Q?EV9DAAwU+x2QzOiZf0xzPLSQ8Hu6rHan7TG48nWl4O7QQA84EXLvCV4fCyzH?=
 =?us-ascii?Q?1Q7ZfCyn1HENdnI6lILKj1TxhZlGdXYhltVNAQs25ITX3qCBTjOp31lJZjYB?=
 =?us-ascii?Q?2A18TkhoOOOLTm7YoflBWPVzXO0AmJVkd7LHiTmXML4Hn98gNt03K0Omp6Yt?=
 =?us-ascii?Q?n+yZrxnezotdCabDQrxPzzFdDltoYFwbJcGqyRF1M3itAnpoKc0oU64/3rLP?=
 =?us-ascii?Q?9QZlYGOPid5VWn3y7JwG4uu/oDFzdpIOrssPUCEw6UygX6XpU0E2R5JIgVKK?=
 =?us-ascii?Q?AP/5W9k52xXoIUYTCfTa3bF5t7BA7IUVaQMkTjy6L46Uu5ifyRfF/ugID+CG?=
 =?us-ascii?Q?T8/ZBA1NqksbiZbu/vhrZv8ALvIEd9vM1nJzj2o410NUl5ygHU60TpCT3vyI?=
 =?us-ascii?Q?gz8JWPgVdjRH0+egqu6aQ+mLiNzpSw1a31s4OOAOSYhHCGKTxvvTer+IACY3?=
 =?us-ascii?Q?gBNWwr5/eRTZTILgz+AiEG3FMgVMsWm7i+eEwFDhes/rI+BKF0lg+TyCqCm+?=
 =?us-ascii?Q?MEmVhsp1UVO0RNf3bm033gCGkcOtK8Fl88jqw8omQzwzhcQSacVuvlH3jKmA?=
 =?us-ascii?Q?6+2QT2jbpXfIEYdOpdtxs7kSSWZbJc9j1gjXrftGEAOsfIq6LsSl7s9uPZgH?=
 =?us-ascii?Q?vvK1OvNp1ROC54phI8RYpbyY92bsQxpUYNH606l/pYuEUVKD0lVKxF7I8WWP?=
 =?us-ascii?Q?Xj5wIAF/266IzASvcUCY3DXhfXAVvUJZIMnnZg2bNskPSSkAtF6xMC6FF+Iw?=
 =?us-ascii?Q?y7/zGuagh1FfDtMTi1Q+EqOFf2SzZFecJWYeYyRLpAGxXp9JbGGq2LgVPApB?=
 =?us-ascii?Q?t/Ug+dFtxwLR1Whaqyv5e70BIMp002kjtrQpd96EXomQJlLjeQu89raq3/QM?=
 =?us-ascii?Q?TI7S/j6wjPV4GW3lFJIy28iWBD42sAbWyPyFSUkFaEfSMGxce9BZia59/Wdy?=
 =?us-ascii?Q?njP7Jspat9IclXJ9H+mwK1yLTv3v6h1U7HLJPF0lZ3zXfshbrP2R5r4IhxNs?=
 =?us-ascii?Q?e8llHHnvkDsRQuOxtzYVlbURloZAof0PPx46ZBkEsxUnQ09WTuWy3iMt57Ox?=
 =?us-ascii?Q?8LdO/EtCEzB86CGWjsD4hbzr/E7OGLwBW8hOZn6PmROP59N0NpWvJ8WKKNmJ?=
 =?us-ascii?Q?Kpwrn9r+JMUh2vyHIYTgEyeFLPbfWLfIxHz9qF9zlmmzl4IKbNg5Hg3UXrQU?=
 =?us-ascii?Q?bXM4bJcWnN1eq8U3BUqYAHO5B/SYuzdGpAdSiw3Ct53JOqteOFUUMcK71JnY?=
 =?us-ascii?Q?B1QLCzyrw9KjK6WfLF5R+7S2aLychsTP7BGcZqPHb8fLFPZgq+MIlA/nT56+?=
 =?us-ascii?Q?AR+AseCb9JSRHGs91S6jgkaI90C2BYQ1sexUZs44z3Z6bmF7RA4bAX3Peq1R?=
 =?us-ascii?Q?9SEHBlKDP4M8OTVFOite9yB6QoysOEqyxAMNHDENUoh8Y6iIcBEuj4r0CWXY?=
 =?us-ascii?Q?iWs7iaX4t7DjBZH9B4LRW4xBazpkusO93Fn76SOZT5dV4NA76JID7XFE6+VK?=
 =?us-ascii?Q?xerHvk34EXbj7SzvvsnilK2zGHm2hSYUtTcOimLZm6czN6n3BW62wcIbfbs5?=
 =?us-ascii?Q?f3wJ9FU0aANNc2Wnz87ikUSdSUO7AHLDcCrxcod8LiR6zq7va8FTwMxdZVDY?=
X-MS-Exchange-AntiSpam-MessageData-1: 3rND12Or7p+mMA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d23b382a-e41d-43b2-c7b8-08df49b25179
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 22:37:13.1127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVVRoRFtfOB2eLDxgxAVhiECQ00I2SD1+qRdRhRfJuc9QkggnjJLbG1HE0aGj6/TI6bAzTYJubVjCEtcymmHfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11181

On Wed, Nov 18, 2026 at 06:31:31PM +0200, Ioana Ciornei wrote:
> This patch set adds support in the Lynx SerDes PHY drivers for
> retimer PHYs which can be found on the board downstream of the SerDes
> lane towards any connector such as an SFP cage.
> 
> The first patch extends the Lynx 10G and Lynx 28G dt bindings so that we
> allow the phys and phy-names properties at the SerDes lane level.
> 
> The second patch extends the core lane probing function with
> lynx_lane_get_retimers() which walks the lane's phys array and gets a
> reference to any downstream PHY found. The 3rd patch sets up the
> forwarding of the phy_ops received by the SerDes lane towards the
> retimer PHYs as well.
> 
> One thing to note here is that the forwarding code is kept rather
> grouped in phy-fsl-lynx-core.c rather than in the individual Lynx10G and
> Lynx28G drivers so that in the future, if necessary, it can be moved
> internally into the Generic PHY framework. This leads to the consequence
> that the actual phy_ops with which the PHY is created cannot be const
> since the .owner field needs to be copied from the structure received
> from the actual PHY driver.
> 
> Ioana Ciornei (3):
>   dt-bindings: phy: lynx: allow downstream phys on the lane nodes
>   phy: lynx: get the PHYs listed in the lane nodes
>   phy: lynx: forward the phy_ops to the downstream PHYs of a lane
> 
>  .../devicetree/bindings/phy/fsl,lynx-10g.yaml |  27 ++
>  .../devicetree/bindings/phy/fsl,lynx-28g.yaml |  27 ++
>  drivers/phy/freescale/phy-fsl-lynx-core.c     | 266 +++++++++++++++++-
>  drivers/phy/freescale/phy-fsl-lynx-core.h     |  14 +-
>  4 files changed, 327 insertions(+), 7 deletions(-)
> 
> -- 
> 2.25.1
>

For the series:

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
