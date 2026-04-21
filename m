Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010048.outbound.protection.outlook.com [52.101.69.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBD036607C;
	Tue, 21 Apr 2026 03:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776741009; cv=fail; b=jZGx/5ubWGb5x945S7QFHk5I2j225f53U303Qc/JdfX0ZcPNr7IDIhWdQPRZuGQLS3lbuPSN+oON7xqmi+D8tIBIECsA7MTfirFiSnjLS9mZ6Qu3y2C62IPlaUykRkFPPpC7h0p5ujVWix2mp63T669i0BfWVLk5zbz/ffYGJCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776741009; c=relaxed/simple;
	bh=0MgAAxmevbtU7dElKykIaD0J0QhLQe+LIU4GwvTPiK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rhbmAb4cnncMo3u0ErIQkQcKU/MkWj46zhBgxMyKrWkziTsfv51VVR6iZrLL4b+TUPbFW68Gb71I7Yyg4uP4G9z5JdKFKUQP6I7YbfKYY5cf5W8m5A/n7LhsNDlR7cnwyhR2nhLx1dX28srjRix7YhNdnN8XTDtb98GQenyuGxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cvEDRS3K; arc=fail smtp.client-ip=52.101.69.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cvEDRS3K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LAlgoDOIrKH6S/GscVipAOboNQmXz+xhOxj98Mmi1fNh6Fug6aBr773u9ITfEJZ8+XLTJEmn6c9seZ/Pd67mf6QN0B+i06P0A9JtbeltkiAlDBA4PNMUcB9npgnjo5H7HQep+05puOjjx30GDMO1kKJsb08XDc4t6wSglB/PhLRxCme4WGLR/0DxmFko2YRqh3B7ZZIQXi+J+XFzV41Rt0t09x9iGQaLyKgreTcOyQkHbvkS4X6G5ut9EVKnyfBiZ6uEmq6iNji5gPn7BIq9qQNeoa7oEY4xg0ZT9KQTRWbpczVN1Pjgr6E3fBWXpUfLvGHqLzkdIbMzKxhIrAFSsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raM3VlaQVUdV+T5uo+9SscOyQHne51mYxgXDCKwJ3Ao=;
 b=jM9kxv4fr2qBEU7yzlerhyVMrqke5dHbS4lWhOtNG2VIreWwRCXsW6vLDyoBcZ92FsJfj3ttACZB4DP37+RDDk73QGqGJI8oaUhgw9UgDCQBnm4CCiyoxeq1npeQyDuah65o7PvujX//NT33DW5C7oJPNSzN87pP6rqXiXLPaLKC+0pZFYvDorIc5wngDMYid6IQrZFN+aYk89O/9AfhcZQOXgNFHJNU04CWC+RZnATMr4fRej+1ebIF8HMnHamEVGqTw4mwdOOlS4+29fv85cBJGeS1tRVDsR0Aj2iAu8gl/dNoaghPheX0imty11uWo2MtuEkH8DwL+uM18XVPrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raM3VlaQVUdV+T5uo+9SscOyQHne51mYxgXDCKwJ3Ao=;
 b=cvEDRS3KCrzJbCaSAkWwDvBgoDBiBFbT3gXpbgxOG1Xin6mCobebHIF6SYubEXgi1brfq/QUSsWzclCQvJ0qpkqAWrQAMiePnmy/ohVbNA3CZ0kXDT7LtPkaT1VU+VhrCKMT+KIHCq1iEU6aOiNdPwt2Xd39gC0NQap0209rUUmGLwjw2mNcSgLz3hll4iD5Bu+mqH0gPKMHCHQBtOZScuIkElL+IDNAgjuRxSlulAUdS9HFc+2jEiPsWqj10nQpXWmaE9HCDBmrQtssHznh3fU0ZpyHemxHuK4oQVE/vJnr/hCTXCx0xf8v9mYnCqfAse/Sz5qRdTjWkzwGaYXiBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10521.eurprd04.prod.outlook.com (2603:10a6:150:1d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Tue, 21 Apr
 2026 03:10:03 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 03:10:03 +0000
Date: Mon, 20 Apr 2026 23:09:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v9 2/7] i3c: master: Add the APIs to support I3C hub
Message-ID: <aebqhZH0yQORtgam@lizhi-Precision-Tower-5810>
References: <20260420105222.1562243-1-lakshay.piplani@nxp.com>
 <20260420105222.1562243-3-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420105222.1562243-3-lakshay.piplani@nxp.com>
X-ClientProxiedBy: SN7PR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:806:120::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10521:EE_
X-MS-Office365-Filtering-Correlation-Id: 398987c5-ec1c-429b-441e-08de9f537b5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|366016|376014|19092799006|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CcNbHISuNS7LDHH1KWGmY+GnUoXIZqCPli4aSJIpT/mOG/bxImH+kqGpBk+DDzwGAxmZi8nta+5RRESOFNSM9anfnrrrkx5odVpWjmyToHldJGlbrkLf1qK+Xi2zmOVJ9NE6EVt/ZajgWlZ5l+lcIeF01Q81IBaFCbJfDSPGm0RetKb2NFHKhLyabm9JWyFaWETlgMfArsdAZhy68aOF8YX5L2qS13ORsAIpRpnrgi7beJ7m0dEoi9tMcY2I3ku5qK+3B+2sRVIQ0o9uTkledXBZkbNjdh3SQ/stwLSy+TSWce8qUo7yporIIERQ7FrghpJt8MrKnqwMWvDI9nBTKsqVxnz4qWoR2TaJ/CwAYUqZrQHvVg8Q8aJVuShKYp2SGDwrdzF9Z4WMISMjR4xupUkvnMjXL6KRyzjSYvPTjftTDdLzsScEAeSPP6vjRrQg4/JkY0Tplw4N2H5mokKAjrPSV+XBVNuEchUkc+VsvJfSPWrmh5eryxpmdNB8pIrbbY+CfR3rnsnIlFTn6LKjZaYOdjXoWv1MLUzPOE1NJFxYeiL7AwEIOafHCgu08HF9SsX4aOPID0ObQ70afpecx4l5GW6JfqR7A8M1+RtRIB8M4Ngf14coRMu34PTWS9/LDBEaawU9RLpaxvy1MwSp6g1rRnjwrc9Rc/SD7s6G6EatCfaprdY3ji/UB5QB4Qc1JhRvT8B59gM8grUpWCQg3AMUO2/4wyTYtAFGvETe8/Qe+hw0HHQ8qHUkmduFZnWv88GSWBu1DUCZuBEUrmIf81osSLNoe4OAeakMZrfcM0o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(366016)(376014)(19092799006)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Na0oiVGNdkZwcR5crc1aDcQIwQ6rtlE2lpeM7i6r0SBuG6ByNdceSu7jM7yI?=
 =?us-ascii?Q?EyUEwlAyGba5ZBZa4sTOwC0OPPd7OPx+5fpCxvOTvxa2RkYFuxKh4hdGWPmX?=
 =?us-ascii?Q?5aJ/IA41lM7AkxXwYo/7fjK6hFnw9dN3WPg+S/Bs4LEZKkJ3Dj/uy7TnKPPq?=
 =?us-ascii?Q?xvc7cJQh17oneRrS3G+H4qXdwR3ZIo+QB6mSlIFOVcBR6CgNladtMM5oqrta?=
 =?us-ascii?Q?Q647bea8yW+BwnlMZ8983YuF+CPt9Yd/6fdQWPPP7Nfj7gdRMdx0aVuwJPZA?=
 =?us-ascii?Q?5uyp4WZlvtLIyj50VUSx/Rzq6EDFcu3sonLQJMibLjshP0PqRdDlRpaDM9LU?=
 =?us-ascii?Q?kwhRyhxxvu1FaYnYsZbGFtKmLmFfGX75tPtjix5FimrKYn52vyGowdiSBItg?=
 =?us-ascii?Q?vomZos0ggabw2peA59rRnozyfVyvsZr1MFe2SXXsdGwQlXNbjNVsRpWTT6fy?=
 =?us-ascii?Q?syXNEumnCkh6w6RkYN51M82PD4Y6tbmhtBHToii9dLJNzeFsQ17oXUl0RKx4?=
 =?us-ascii?Q?WxFZm90CAnlMT63xrCFckCtr5+VUqlY0o+H7IDkTzs1fWS/ZsUUbtEHLnuBq?=
 =?us-ascii?Q?Qf6Ig8Fr8CGfFhtRVEzScEU7z1Pt1YD0fTWX5EC04Ka0/5kzFUzhY+MC4I2K?=
 =?us-ascii?Q?mNioJ0+y/kUgxj46gP5Zoohc4XbiRMzBiqeTMdBnVcGqZHlVN7bFyxMT+iB9?=
 =?us-ascii?Q?vIHkszFPgBClVYc7mmcc/h2vY/kL1qD3FqrgctOtPLUiBsU3AQYzxa5ViRpK?=
 =?us-ascii?Q?4kHtbThfi8x1xELDoW8HqbGYdj8tOPluM8JempWOCRrng8Olv+jXR5L4zN9f?=
 =?us-ascii?Q?9q2SdRdOGsNsmNO8+VNramT2zQaEXEldWRpZhNvKWq86eqNDsJoJyrGyFBmx?=
 =?us-ascii?Q?0cXwOE7OJAbBj0pKRsXrM3gPwGeuROALf7C3fce0BUSSzGMVmpGqPlaz0WfO?=
 =?us-ascii?Q?EKnUIQliNtQdJGwI19WG/ym//O4Ct8FbGVyYBLLCabaSh9fKkCk67OLOMDUq?=
 =?us-ascii?Q?ZYOSETt9HrSkSCHBCbR1F4TxpyDQHZoGA7iVR/MFEueB2EHgu/0uYlBffXQ9?=
 =?us-ascii?Q?LtT9+aIS9/ZPk8mDfB28ah+W/XDDy3PtXYCCzxOAQZFrsub08C+sy8Hltj9L?=
 =?us-ascii?Q?Yr6jLNmA/jC2m5s2ByAqDV7R6aAfYE0Mb/BBqv6jQAO3LPHPTqeraMKR57Uw?=
 =?us-ascii?Q?CEwptNXO3MOzAw/40GAOe4T9y+TpX5dFaHJGMivjjxUezlg4+wl42QhAxeP2?=
 =?us-ascii?Q?5x3nIEh4nXTJVo7eGlhMAzN0/IOLp5zKnBQlAyuS+3PA/gEBsyNQrhF5wDMB?=
 =?us-ascii?Q?Kv0BrK4O89ghzKzoOnC+xtM1214kms0yAjbYa5XnXOqPB/JjSPu9zLP6TH6f?=
 =?us-ascii?Q?E5PYsqOjm1waT48dA77vHehxzEtjggGY406LF96ENMcsZoWSm4yq7C+IJvwa?=
 =?us-ascii?Q?HOrKRpbiXvgOMXHDpdQYsPIZrAz+XLFMjzczHatgQGb9X26Gcr1h9I9Dk2XR?=
 =?us-ascii?Q?SEAVnymRVuXwJXQc+xhYDpCjkSmBlB+Fz410d+9amQQb+RI55YVV6Q4GH85E?=
 =?us-ascii?Q?CIXXeLElah2vkNONdGYLRX7BNq5I6CXTMevh2DONSo3b7915C21jZino+VzB?=
 =?us-ascii?Q?tRN6QlEKEcQYe0TiHEGrUxMR8XKysT6ATPJLJSeIG0qhyzmABnXKVYAZL0tp?=
 =?us-ascii?Q?O2XPe9uO6llLOSS6BASULoErNzQFtrSEf4Sku261aeACOZhu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 398987c5-ec1c-429b-441e-08de9f537b5e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 03:10:03.6103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6HLXl4z0uXPlvDV/s4i6u0znFQlNtb+kNTe7dgQI5+asq+yoDjS30kzTinYWSMGnfXsa/golkvcImBLASnSJLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10521

On Mon, Apr 20, 2026 at 04:22:17PM +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> Add simple helpers to direct attach/detach I3C devices and two CCC helpers
> to check CCC support and send CCC commands. These additions prepare the
> master core for I3C hub support.

Nit: This additions prepare for I3C hub support.

>
> 1) i3c_master_direct_attach_i3c_dev()
> 2) i3c_master_direct_detach_i3c_dev()
> 3) i3c_master_send_ccc_cmd()
> 4) i3c_master_supports_ccc_cmd()
>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
>
> ---
> Changes in v9:
>  - No change
>
> Changes in v8:
>  - No change
>
> Changes in v7:
>  - Update commit message to clarify purpose (prepare for I3C hub support)
>
> Changes in v6:
>  - Split the patch into two parts:
>         1) expose the existing API
>         2) add new APIs.
> ---
> ---
>  drivers/i3c/master.c       | 103 +++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/master.h |   8 +++
>  2 files changed, 111 insertions(+)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index d11fe6937ba8..2b88021d8a23 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1652,6 +1652,59 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
>  	return 0;
>  }
>
> +/**
> + * i3c_master_direct_attach_i3c_dev() - attach an I3C device to a master
> + * @master: I3C master controller to attach the device to
> + * @dev: I3C device descriptor representing the device
> + *
> + * This function attaches an I3C device to its master controller once the
> + * device has a valid address on the bus. Devices without
> + * an assigned address are ignored. The master device itself is never

Nit: wrap at consistent position. (such as 80 chars), check others.

Frank

