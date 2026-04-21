Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011010.outbound.protection.outlook.com [52.101.70.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD25366DA3;
	Tue, 21 Apr 2026 03:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776741304; cv=fail; b=Y4l6cF5PWN0fFp2972r9/fTS22bXT/3IZI7gilswnlWSWLGF8RpI1TgTvLu/TD+/8XInd8MksBv8zZzrhq9B4CNnSRZ0BLkoi4qtQp+XqNgQQXqxPA/qm5lcXng35XosPtRVkC1BBibBXoU06XoR2+t5lJiDVhdnwELPHn4CsOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776741304; c=relaxed/simple;
	bh=mAFah0FaRPLT7qwG6ZDzVbYpnsfc677GY+zhnDGsCoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aWZyeODaLKdj6uGXGbUCyCKf/3wt37+F9B5X9ZYJ9BLn7UhsNiBbu2tB6CCATCmY5fWHDplm8jTFo6ER84j5wFAugCdFDfOuwDkl8VPx06tEsKIX1jFazsUTQODQ9rgLqb7IE4+AHuy75oOq68d55FKu6n1tHB3KMR4UtWCrdZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PYHQ5ZpT; arc=fail smtp.client-ip=52.101.70.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PYHQ5ZpT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmsSy2MP8xmDZCJSG+AVVAgl8aVsyPt21fosFDrfa3AJXRC7Jxe9RXkSbpOMl70UVcwPATMPbayDnCE0GaZehEPXh+hyg9YKRrzWsz1XtTcTVG1kDQoIwSL/XNuOpGo9Gog5Hh1u82GIUplRuidxUx88htrPYcWgKv05tpyR+ePOpsxJPUb5HLGRYAa3HwfcedYBU+x0aNiQjknfjpsB5RBhX0O08yxmKrizX4Duv8nNnxf01E5GiuEKKpTazWfuQeGpRIJ90+sIthSFeUH/oCMDDsMPEAL2U3rlMveLL7Ehac3cDKoNZrTEcps9QRa6C6KSIw8TodBiHEx2EYupig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIMx4H52JuRcLoLp/aZlJLyexl3WJ4AuAbf8aFc5vtA=;
 b=MLo0duHpbYVO89CokPBghpUifoPzoktMJhMZ6LXGM5KVZrQhkfDi/BDmU6Vd/rh+LB6ZRa3KQLI4Ln1DAAZ2IutM+gvCDs10NpONHJVcdilr+NRtc9Qxu69Uz/HzNKfmiCdEYOOwCeBeNxbmRLJp9EXL4dUoWhXUq3f7dGk8xqvvm1Uyz46iJiwES8OMjXfxOfe04hiREINkvZy0y7DS/BK3W1dzeZcM0OroZut4Fbrz91oK6pxgZqpR08T1Yyp11IcORtdhNX1EETvD6H8Q1RVXMySzXfuH8kO2kBqmw6pN1uRF4MqwEZOr/ai5ZKIJsf8NgQ0AmT6kbJHw91CiUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIMx4H52JuRcLoLp/aZlJLyexl3WJ4AuAbf8aFc5vtA=;
 b=PYHQ5ZpTvT8pnz1z1OFbAi76bckxf+yN271ogK3EGnkXTINpAuEV3e6IZGhuturqP7H3ZypZhl10Z0Gkqg+ZfTmtETXJWPCmtgS67qhN00Do2OARbZRLczQU/3WR5F1JIYzlUS7GVgICqh5NOEygc0dF7yMc/DbfiWR3mLoo3HqlzeFLKDN2R2pn+hcrpXYM7Ad0rbjX7NONURLpnV0gyAidxdaI+mG/x5SuPUZbTK8aSVivGJPO7Hd3OVW5SuG3WGEzpLZY+nBCfD7jufxFOroxnHKCb/EX2aUkogfpwfC3CTdcE2sTeUM8QUTkF7s+ysftJ1bxEzPgDYj0sZXUCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10521.eurprd04.prod.outlook.com (2603:10a6:150:1d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Tue, 21 Apr
 2026 03:14:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 03:14:59 +0000
Date: Mon, 20 Apr 2026 23:14:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v9 4/7] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Message-ID: <aebrq_W-tLqZ3K6F@lizhi-Precision-Tower-5810>
References: <20260420105222.1562243-1-lakshay.piplani@nxp.com>
 <20260420105222.1562243-5-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420105222.1562243-5-lakshay.piplani@nxp.com>
X-ClientProxiedBy: PH8P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10521:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d12bf27-4d76-4f4b-53eb-08de9f542b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|366016|376014|19092799006|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2l4han+WKs8oNiF4q9w5k25LqBk3mVaxtd3Gv6BGtPfpTw+Kg618SCNeZ/BufcV5TmDmH4cHCZ/mUznhv9+TAYNAnP9LZD/AoQwZNRzciBY8jhdEme1QuSNFy0LJs1EfPvCQkgX+VFP0Ur+e4YSD2kVVLqYkcRM5LWxq5/q2nuaYXTmOHpjE5jw7idUhkPUZHX/4yLevRa/Gq8Cgm6Uygo6eomvmmtXjIj05sbFKWJA+YgpEvNTVb1hNfbTz96tMeMNNcmNVSE2Mp5Z4L7im40SfluY8UuB1Sn+wz9ktYP4UE7UeSaN4X8Q/Gn6db1CLs+lv/rZ4i2ByxMySnbm8denXQt3sVFtN59o6sdLgm4YmdVAeOCV9ph3KxUZ0dKa3UHxzJTD1/mZbeIYHJU5hg775YS5JHsdHI4MEPjpr+X3nG44GNLt8JD9+3b5cVMIhbdWD2e8j53Bw+e6DAYOxr1Trpb4T/vtqtVPNG6/CfhP1r48fFzlK04LA3972Ke7aSWLrolFdzJBMIRU9ZLIlhMwrf0bJGfpEmoIzGoMcgY2ukJ30ieYjD81tDJ/bFr+KWjP3wvEBsqi0LPY9qa2ppYL+gE9PeMsO85VBkYjGMSvUmLYAUsr2z7Ya1yBwW8pypPDWOGGNmJMVNjo3eC7ffhmKJO4Gqm5j8K5t89r5a+QWs63T4TiMbicvfX7wLJeYQmrVEjw0rSmEa+XJ9+0R7Xyy2Il6Je5NYoPhsHXAuY/ceuDvhMnz7W0ce9wicsSSv5qhDibqqJT7V3oFPCqk3jGUTrFGFw1Embbs7yWnic8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(366016)(376014)(19092799006)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o5fKmWn3EgZpRO1M/4NyWv2LZh/XMIWbL6P3NiE6s32PrexNN2TxwT0EF4xF?=
 =?us-ascii?Q?fxatb4sde4OceYOtBfeaCO0//nScCmq+prgziJy1ZDKdrU0AtMqVYdv/Z4X0?=
 =?us-ascii?Q?oz8NfO5R5riwfVJ/FfsJmk125/cmmWUTuLaaqL5y+cuBMjd95RY5ufW2Lx7H?=
 =?us-ascii?Q?fIYXrHMmwFt26uZx/5VoVBaZJrO4M6Gt1dBH3g2tMMw7cdbHwkiH5WIiR9B4?=
 =?us-ascii?Q?pge+8WwExFuAebTZKxm4I2RXxwtEKPbezShZ/4hLtZWhZC/IdHjqPrwBYvsf?=
 =?us-ascii?Q?rh2tUIF2KdmtxK+wso95B5W1DQtIU9W6hPH0fwq4mRE++KKDvd5Ohwhx/Y7l?=
 =?us-ascii?Q?BU69FpYN5bYsaIjatuquZqUOf17ov6WwkBqqADRrjH+dVygazjtnOAPpSTyv?=
 =?us-ascii?Q?B1oehPO4fy4T/pa2s+/nACXTnuFXjRITMk68JkbUyQRymh/PwbNUimocrTZ9?=
 =?us-ascii?Q?8fGoW5ZaF+2jRf796tT3I0gsGZp68RMDMQ55jkykBD6UM9D9SXuOVi5hT1IK?=
 =?us-ascii?Q?PpdG88t0xY7AzPBDCKMXOAycdwIa3ULHOrcLuL3HAWrl3FNWY/8MppSkhVe1?=
 =?us-ascii?Q?O+I2woD2XPZRr6GEnXQ5zDcHJCn0+KPgIMhIuXIbxtuKGbdrNXmP4trejndz?=
 =?us-ascii?Q?Ir1xlEjMRQ3DYSdB3I/rhUhzk+gojWspXBUVrmmgReRM4iqNgFsH6Kaghvfj?=
 =?us-ascii?Q?BN2J0qw64Yss+tLqtVipFJedjYbOiuek0QwvvsU6l4VGOkvdXIoiy+X1cOFw?=
 =?us-ascii?Q?hgAcjhabX8Ve9rhrkd2je/sTjMHY9TKYuyzSxWFiHNdWFOXIQBPNbRt82M4h?=
 =?us-ascii?Q?Ab/5ROtRaBfF9DPyVphjEqx1Dxt/KaRP9dn1NQoKXFaEOYBc/R6jaXO9pbZB?=
 =?us-ascii?Q?FXlhoDoIWxT/QSSNS5T7HwtgcrP22ZgSJL600XrcqE96hheAS/ET4t4ShdWr?=
 =?us-ascii?Q?I0pOixLrEEAZjMiVizP7+cARFhEEpf6UG52OH8ROeH0Wr+57EqVhjXDe788B?=
 =?us-ascii?Q?KsSzJmuYgVV94dPkblZcsVCrluentHzaQbLxkGvixJLMlVxuebxJ0GGcthiJ?=
 =?us-ascii?Q?QvOYHGNWvNOMWiyTsHLCDPJ9etx7qvA8zCIASColFwTXFqW9NUhS0Dtn0nke?=
 =?us-ascii?Q?LfDs3tszZ1Q/ssqGkznSiWg0/5UPDpr4SUNFoofwqTJouykk4WRPP7f9ZuP5?=
 =?us-ascii?Q?tiNyHUr7K2+L82LDQWLml/uzK1LfNqhrA6qId1qWgL3XCv27cIw3qV10evUK?=
 =?us-ascii?Q?X/xoW6+Yfm+MAnffhuhbzhAv/v1WbJkoXzq2D62i/j5mkCU25RHerBF4os4/?=
 =?us-ascii?Q?g40/zKTm2V+I2nugMDwsKswWlNU6vqu0/qUBDQDHH+i6sGCV2jcT5uYlM5HX?=
 =?us-ascii?Q?P950wHBEOE0UWol8J5/J91vf6pYDxC+NdQPktZGjtp6+F0F7FuPExp5tQ03s?=
 =?us-ascii?Q?P5tXpXJ177uoJDQglNB6KqSv6rYVXDQbjmArucVXnMMpH6/8flA3amU0V3GE?=
 =?us-ascii?Q?zEHAzmm29rmMdJ0GA/iZnU6TT7A87H/uPQZ5XsW5w40w5Kc77F3CX3fTOpEZ?=
 =?us-ascii?Q?LjObtD3ttPrrvMGROqGVwuqXwni9MC8wX6DRgN1MzjoMWqJGzJ9xUYoWG14B?=
 =?us-ascii?Q?nVfzjDUqkbK4gnlsEWJ/9CmP+qqjYXadniqWB6lZVUiDztMcK+L7twr6+NDt?=
 =?us-ascii?Q?RlH16NbBjPkwcCjC2+PHc0AmgJEJ7xJyaRaB9MlhTxlDVdos?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d12bf27-4d76-4f4b-53eb-08de9f542b65
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 03:14:58.9139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sFoL9gtgAkMLPhTWAMWaFpo4ShfCxTFfwOIrcEwvR0lU5Zu8oqbyFDJs0XI4/HUc2zpHooKSJOuhJLPcKhgkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10521

On Mon, Apr 20, 2026 at 04:22:19PM +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> Add core MFD support for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> family of multiport I3C hub devices. These devices connect to a host via
> I3C/I2C/SMBus and expose multiple downstream target ports.
>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
>
> ---
...
> +static int p3h2x4x_device_probe_i3c(struct i3c_device *i3cdev)
> +{
> +	struct p3h2x4x_dev *p3h2x4x;
> +	int ret;
> +
> +	p3h2x4x = devm_kzalloc(&i3cdev->dev, sizeof(*p3h2x4x), GFP_KERNEL);
> +	if (!p3h2x4x)
> +		return -ENOMEM;
> +
> +	i3cdev_set_drvdata(i3cdev, p3h2x4x);
> +
> +	p3h2x4x->regmap = devm_regmap_init_i3c(i3cdev, &p3h2x4x_regmap_config);
> +	if (IS_ERR(p3h2x4x->regmap))
> +		return dev_err_probe(&i3cdev->dev, PTR_ERR(p3h2x4x->regmap),
> +				     "Failed to register HUB regmap\n");
> +
> +	p3h2x4x->is_p3h2x4x_in_i3c = true;

Needn't this one, you can check p3h2x4x->i3cdev to know if it is i3c dev.

Frank
