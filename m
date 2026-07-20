Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013023.outbound.protection.outlook.com [52.101.83.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBFD40EBBF;
	Mon, 20 Jul 2026 15:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562209; cv=fail; b=rS9lBXgxPpYgIzlDCX0Vl1lUEdNB+uK0HtUI9kYh9rdPaAm81jE5a/rb8F1cbsCf3Y3q4sf64gpJGTDmkZiGRk3LAD13djP3Pd/7HOKKw0lgn1hm9yfVjqmsqnpiX7nV6UWYtpvFUh8BQqSTSgHW1Ei8T7jNWtrwVdB9g1Lcm4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562209; c=relaxed/simple;
	bh=zVhVw77VIqWdszaVAF11AEbVCi/eMU09zva7dxZu+NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qkFtVLNOlWCbQAL2urJwWDzHSFdWqLDN9JoRTlKMxtQxMnWCTgRWojcwUKQIiSyx5iScF3ffuEAq968VThjBnpMSYw0D8XgTUYMzlKJ6vBVnvcyDBTjhyb66lEkfBHgpDvQiu00Redjxe1fndwWbkuHrO3OWUbczcM4pcfJd6jM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Dq13n5ly; arc=fail smtp.client-ip=52.101.83.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Dq13n5ly"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzCGYcida+GvbaPg9ElbTDidotTVAPkco2bZSNLKm24/3PZY2Toz7EFH5N4U7nRqlmsJqtrCsoJyxorRNGzZiTfmNojUgroG2p0VRLpFfy1N/9/g0oP/3li1ibrZbNdnUAXWBVIl/OVTZnnTzqi2EONqYFAAwRD4CIXMpaj4SF2g6qgtoOx5/tLC1o3tb61G2JIDbTJxfELxekDHGrashVA/dYahOwtsgUdz0e2+IIXomyx5UdFd9KwjBWUhpF7A5W9IMMHKve3zYtlIudFpmz7SfzPnn0vGi+meIRdw8j91ka/pSzRvk5mtgn7Nt8yjILILDB0i9zh21T/5j2sYOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xpo1As/WL8/gJvnwcA0x3wPSRkvpMTSzifhHFffCHvE=;
 b=r2UC6UZp+xyfB8dPJ8QqTYRdlZjZYVqTplEBN/mPY7PMi0X1tQU7NPae2MtaRbU2RrES8kKaBCgqgpAfcjuMHUkjqpp+4PTxzPYpEir4jLiMJP9wxWHy0LA3ta0bOeMcGFBYg6imILhkaZ/sfouWDrQ/HD2joE1sI9n8svGXCHKRuzBa7hjEkwZerWs3O7SCTQKhkywL0cSzqM9HJQXBSJWFL7BWtgA9ldSRqH7z4D+MiRyuXHqNJD2JzjF2XLiW3XkZYScBqeqJSS1Oc/pq+AKuTv8BXrti1FiRr9zpuBIUads61e5StU6e2bueP5PBoe3a/fIWx4Rku+/Uri5c/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xpo1As/WL8/gJvnwcA0x3wPSRkvpMTSzifhHFffCHvE=;
 b=Dq13n5lyLPY8Mhx364o0GJ46P05glFfjY7hlUwUX7pf0qGm7mccRs2uLd/2AxN8kjG0rdQuhz1P7uo2pErkkG1CWH0tKiKnh2+0TfAD/fjWjmPmKvtbIUk4VP03/2HBYPQUZ+nNgDjstStFIKHZCL+WvmfhKm0oWMDFDTJSkK8nSGUzy50JbaFpT7rFcrhzLEbroyHnHFkS3CpmHkWXOiuM2QGYjxolYW6BWRWdHzcwggvAXpwWnTVYaQo6dzXULNuJbdbxR5ZP9FuqC3UHiVRyV2X5gDU9kXB4YZ+BJs2BkOPcd2UVxOTBctaNnv6YLm21YK7Z8dEPG+HtzYxmTbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10663.eurprd04.prod.outlook.com (2603:10a6:800:260::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 15:43:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 15:43:24 +0000
Date: Mon, 20 Jul 2026 11:43:15 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, michal.simek@amd.com,
	radhey.shyam.pandey@amd.com
Subject: Re: [PATCH v2 2/2] i3c: master: dw: Drop redundant core reset name
Message-ID: <al5CExDODceH9mt4@lizhi-Precision-Tower-5810>
References: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
 <20260720073510.1869623-3-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720073510.1869623-3-shubhamsanjay.patil@amd.com>
X-ClientProxiedBy: PH8PR02CA0042.namprd02.prod.outlook.com
 (2603:10b6:510:2da::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10663:EE_
X-MS-Office365-Filtering-Correlation-Id: bcfb7b7e-4782-4849-579b-08dee675a212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|7416014|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oJOEDM4DjfApmkO6hS3+O7Sa2PfqTLKo1SHZHwJR0XlpC5ITzr3td9tdzEknXdABrq4r630DZFHHO4kDAas2aJ0KFrTTbNBPY4rNq2fydSJWf1D4VySWnMe1YZ1SJQs/tZUwSf8E6/c/HrjG6gC1VwDzC239XMRL4deIrVbFy+K0ALaBkXp1VRBGso8txeLykVimzzO6DmfxaZw3lGG2QLwPcTgcb2QOG3/t7+roH597pxdSAGD/xlLNckXsIWYFClvW2bGuG/dFpXhyIbib3QWawbW3qFUm3GmlfMLTPqUDSYrrwmTlDk9PLAzIaALSptgfO/zAp0fJVZzv3E07Sxz1W02bmKeWCnbLrm7MW8UcL7U6Ks2RTtLj/j7CygYTQqD0w1lF2QEcDamLNX/vnmRwxC/rAVju3l7cZxsLSP9foraFw/PkpS540s6S3m/zU3D5JfwzzzGicnL3S3AzKtq7+6Q8N04l6oooijD5KoCtBsEa8TtGmD68uiyVA4ycf9alTkeXThu99C/EX/8idXojzCBi+OtaJ9WU0VeI/1WKvvMiNJfJy0yAy5d8LpXhnAWeRxvWHecs/O0eL1sNCpjFVQI33TYtSK+XUDwqV6Lb3Lt/su+odCktBv51eRdFjDwhDcVMPk5mBlzkD6hBV6OfFtr1MROXZYorH06D6Zw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(7416014)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O+NbtL7tZ53cWMSDQgQPFn7DCQBxCeNTjoR0z9vxmhMdvqDYwVvSwcTFtInb?=
 =?us-ascii?Q?2oypUEwWzFtpIOyvYNztRwV8B2C9UuelDV1lyZS+ATipam4OC5lwv73F9Ah5?=
 =?us-ascii?Q?sq4/ncWASiB4LQrLkf+mGpRM92fCN0Da18xyD9y6g/3ZxHdtjdWuYO9j4fZy?=
 =?us-ascii?Q?RWUv9bX6bjq71R/MgZ9T3FMx2ckPEt1apMeu4YsLUzGFooJPaWf18cbpvjdp?=
 =?us-ascii?Q?ZR13N2o7I/0Bbysd8mRpB7CbGfLF38v78HohN83jUPW6hyEXyDUO+MSai+vc?=
 =?us-ascii?Q?zMZRy3huij9RDSq0bkQUn6+K3OZJpzFP5JAudeM+UvPd+4HsdBlvRF5BeT89?=
 =?us-ascii?Q?RdWD5w5iVcGwsNq191kKCJB8MI67+lvvl1IuFUe7zbSQcp3ztc90fk/8o4kd?=
 =?us-ascii?Q?JVaX6wkpxBZkIgbZuX9unJfpm3F3wxQHiwQ6e4lc1cnYVrqUmwZRirUbcswr?=
 =?us-ascii?Q?CZD7GIFxOaxxiVDSy9qELYaZoW9COOgfE2vsL9gmbpffwtvDXNPUIbIgJXXG?=
 =?us-ascii?Q?IdIC27r5FVElVBmijBEW1/+YCu/vMrSzQ0dTRrQSeFKf0fP9rGZ5j0NvhDGS?=
 =?us-ascii?Q?iZo+O3aBuMDqZ8IaxHiXbUOOdM2XoULA3xCab4ZTb0Q4wqMRpQ4pi1T2eXKc?=
 =?us-ascii?Q?BlhswTwZCOF1ZJyqpublkHF7IGJuOXWo14nHVLvoPngeZl/gGsRlWDTAu1jR?=
 =?us-ascii?Q?EFoXungxfzPvrtkKv1xmQzP2I6a7iPmN4Kv82Agp9lOFpTup+YXcGgm0NW7L?=
 =?us-ascii?Q?TRGHoc2P/6ji5VOoQQZqYEahQg7WXn8cpexhZS4+YT6ch9bBzjcf83G3Bsfy?=
 =?us-ascii?Q?/q1EyFTzNVByw6p4tRUa+lz6AlDn6dOBmGBYozMcBJnC6GQ8R25rEjkHl65v?=
 =?us-ascii?Q?iMXkGE+/s6vYhcPCI3SG/CUZpdkVrJQ37+WwgmpTv0dNZ9BwlK/lOI6YbvSm?=
 =?us-ascii?Q?DC1aznOGNxQMCYHia2Pr/gHc1m00gvVzQjXOAuuGR5cQzjwvnGU3ex218OIl?=
 =?us-ascii?Q?KksF/JhlzQ9O1pMjmvdQ8dIMZol61c9juu7GGJtJs9l6sOi2F3SZ4LhK9iDL?=
 =?us-ascii?Q?R/Shw9/JnYQxw6mdk1nG+FY2hFpozwSb9T3hR3hemWmusOgT5mT0+UnV/64V?=
 =?us-ascii?Q?v3Z2aMWYbSv8oatGYj+ttcXk6/MWJmjhkVV7dvsCx7wf5LIxoa5Uq3FU53yK?=
 =?us-ascii?Q?m6V9Udlr5LImhGowLg6oZiTIXfXeKCXVNBdsqoGzJZTpfNdnQTD4nVWAGjh8?=
 =?us-ascii?Q?i+XDwEYGBwksKUJammJhyocQuPy2Mt0NTJPnUG7glPFDjkG+e5Y3+ELyTmSn?=
 =?us-ascii?Q?LtwzGAw/20i4lwqzQNkZZA+bw14CgSLPQQy1dBZqWZJJsYht+y4A+JbSijP4?=
 =?us-ascii?Q?3z2RACkQVbHfHSZFR/AkE36aaVaqMQ6oF87UMYL75SqKOxncP63qB3gPk9Vn?=
 =?us-ascii?Q?HdH5FcyHuyF4ExgvZIMImMjw/TatmB7cNgKxczqknta0H4AYS58V2dWOpis6?=
 =?us-ascii?Q?RfGk30yYwWWBUCk2pOC2BHw9VDb4mvQeOcQqkuiuzRwPGXXkQY6HK7QRYYOU?=
 =?us-ascii?Q?9haF9rDwOmMHaxUIJLLXqdUciYaVJgs2lNgATbOTnNaKRoG/YqMCpdhR8sIy?=
 =?us-ascii?Q?pG/9bbvgjaq0IL2Mj+PFRQY6ro+VHHJtk1cP5BCdJ3Updsa+QRsSL5Lqf0EJ?=
 =?us-ascii?Q?CxcHPpQgaNa2mKtPUnh5SafyxWCCg027pQEoYDUs7taCla26hIETuAt2MlB9?=
 =?us-ascii?Q?5v09vVR4AwzVEp8PiOnJoVUKehFf0WFHtcafeaTr3d2K5ABV5GdY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcfb7b7e-4782-4849-579b-08dee675a212
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 15:43:23.9988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6yWvcwa0bVS2LlT33ZylHl1S1osHBbrvWkQQDsHO8OsLWjzZebYm0y5vbaqMKVpDGnpWfOco8nZHxhxYkWT+huIaG+C9C3iXZLB4ZHPMd+H9SHDygtq1xtG9z3aNGIj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10663

On Mon, Jul 20, 2026 at 01:05:10PM +0530, Shubham Patil wrote:
> The DesignWare I3C master has a single reset line, so a dedicated
> reset name is redundant. Look up the reset by index by passing NULL
> instead of the "core_rst" name.
>
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/dw-i3c-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 2f8c0c4683e0..488fb455d3cc 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1584,7 +1584,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  		return PTR_ERR(master->pclk);
>
>  	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
> -										"core_rst");
> +										NULL);
>  	if (IS_ERR(master->core_rst))
>  		return PTR_ERR(master->core_rst);
>
> --
> 2.34.1
>
