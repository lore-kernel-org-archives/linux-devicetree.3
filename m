Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013029.outbound.protection.outlook.com [40.107.159.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4863D813E;
	Thu, 11 Jun 2026 11:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176053; cv=fail; b=deE8hzRKFX1rgSAoCGRuHJYZuxAudayrGYZ99dzY+3kD38UXdMhz50GE75rnGK03KThpmGZpLdpuv1LIpVD9ffKlB4cmJDCJRBo7t0uL40Lw+FWJbkuoBvpyUhanMfbG2jukCuLJPTLeOqggA2aU6QSb0t0Y5+LoU1NbHeEasYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176053; c=relaxed/simple;
	bh=JVbc9lnOSFimpSoxav8UGVT1sy9mJuwOv9ZAcECBqz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MmJ5GLrueBvoGbP4ZtjitYSJJiHdt6NCuuewn0zgGSVLUZG8tuLb7p2n6FYb6kEgdquq8sCNdbRukH5ENK1aPUadwUOKtli6EH5FLPiK81e28A5hKCxZwT6Z533UzadKZR6xC+13pCgynAU497+aoTQDUQ8cvl4kex4tiZRfO6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hg5e/39p; arc=fail smtp.client-ip=40.107.159.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hg5e/39p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hm2VQp5uL5XEIp8tWCDIM8dDhL3/QuJRoBo3XsBj83LH6lhaUzxB3AJ+Lg7NwTF194b3fATwfgO3UgxYxxIHu5yedeJoDmdhVmK4KkIU7XjJyxzecCGsuxA+tHBcRpuzCvJBMUnVCcsSXcBe5IKCKQ+wJRGq+t5mXf9m4WvdcQ8Yams9ET1aEEPs8Tspp1Mv96QZJqgKm/FUmapydvFD85iicGXNQwShPSzIu65Q4MRYJQIiWRSfj91vtmrgn0UF3wipxuCF/obxy2lDsnChZL6qZ/f1sH6HX+sEcOQYG/l2byOffevtl9czGkhZR5ufAFY37TmslHVJaU+TGJoiOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwtJyS9OTFw46SkcJiDGJn6wuN2dvIjvV6YDgzrnX+s=;
 b=BYPhb5i8E5aHH61mU4moWMHEmShmJKndabnu8VX1m+UMxggGXMAAezwlBVWVHuVl6z2KMWEyyUTZtPneLyTEoq/Ta8eYdNsdKlEAgv7x9+HOxQasIpu5soW/sESEWOu/uK6Azmst6Dg4Vyd0SVb3CWA48MdxEh2jX7GtewhtDMaqvVNeFsqiLjxOasIX/9OlSOk1m2TOZyqIXLVo4gj9pd4/Tug7xZFtbyU8IDZ/+ySxhiXRfTghMaA6feD5f8UKxppBALYecGtrZrsSV0nR3MXbYdETw92flw8SidBA2vbry9BLbgc+rUzeS3byOs0GtYoPlJhTT7baiY4TDtG45g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwtJyS9OTFw46SkcJiDGJn6wuN2dvIjvV6YDgzrnX+s=;
 b=hg5e/39pyyix5nn31BQvA0mmtbMT6b5fKzSnsn1tJABY42RdNpF5ybVMBj2PuQjcsSSaepqVsbFavC75RZuv/YpgIJshCPQXaO/+Jx7xvj04ji8s18F9Yt4UDG6qi99NUa1o5V40DEKlv68qW9LWGmSWHsa81DgOynczwR+AqJ4CrmR7kSocJH27o8Cj4I94OwPerG6PDwVIEX2zuOQYT6ouMWKjMf8Y1C43ghVHRNIqQDyN8O5LZOGilxDRjnSiGlmknZtB/UkWvGm0t1UAnIKR2+CEyvOB/o4aGxyyaqyY44BASrbSPpUVgS3EFlmv98b1BavYc4utdUFz9WlloQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by PA1PR04MB10525.eurprd04.prod.outlook.com
 (2603:10a6:102:444::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 11:07:29 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 11:07:28 +0000
Date: Thu, 11 Jun 2026 14:07:24 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Tanjeff Moos <tanjeff.moos@westermo.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 phy-next 16/16] MAINTAINERS: expand Lynx 28G entry to
 cover Lynx 10G SerDes
Message-ID: <jd73bnmptsam6xzrapijisyygs4kik62m4p3ihyrzpvjvg6zxa@q3crnypbuaid>
References: <20260610151952.2141019-1-vladimir.oltean@nxp.com>
 <20260610151952.2141019-17-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610151952.2141019-17-vladimir.oltean@nxp.com>
X-ClientProxiedBy: AS4P195CA0025.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::20) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|PA1PR04MB10525:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d6b0ff-86a0-45ca-7072-08dec7a9a05c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|376014|1800799024|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vUsuIDy9N9nTswYOPM2KiNvqIiSjikq2KpZBeomL9MTTlK20IfTSpQggMAx3fThLWRBOpRqo71wD+isPehbjrrH4rduP6bl3jVnRwvyIW3lF2IKFqdovjNC1PEJCJ9btv6qjsktURmhK7eF96/10cSQZ5s6vdjl4uHllMZld7CXBL/m/JBHk+064/9WVsAZjiet5sPk8TkvMW+vY6Dpg322w37uVVODYZWcSdPcJJpcuolv2m5j/X5DcMM9VB/pzq2CtSp++V/RIP13qH5z4IBknkgmHV5Gcjcf7B+x5m5HNXfh2Lw4OjkbDyhJdQsUTsd6EFIxYMy51XFUOQQ0yt1aUDsznHQnJx3fsKAt/PL5Ij5/Pt8IyYjRi9ufqt2idPQnUoeWH0NKg3igubX2JWAjjgXn+3Wgi5eEp6KuhqLk8HiuabKDY0CXNYHyDKfxKAZBKNEYU7fICTEsect5TOEDw8TTO3tQLpkcvyEkRk0YTLpxN2gi3IUNfu2W7NA1ClTaagkG1BoS6iM9IwYV22UCWXlD2ymmwTsJvSTqbuWFFuAZ+Op5fpGr/BBvKNBMGpp8aL2z55fXrBb3UaxJPYKGcLQuZLN0iVKRnfLWxJ94SKP01xDWqA5hxu4NNXhQyrGXsVDfXPPHKiQs1FNd/dhvzkgS4qzJwD0M1q55+bdZkObZsBqLrwdC/0U2tjcIZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m3Y39XadIRx0XCMXXaZs+lEK9Zxa3Y81iJSmpynIUqgOCZHpSOYdVUb8GWu6?=
 =?us-ascii?Q?Qqy91O2OfOR7ZRir0qPKvpqalOIzTI5R7Ad4DjpTHoiMzI5F/3tMpd1XWjh9?=
 =?us-ascii?Q?hWm6f4zlkCTxEuFKDVDMuglzaxxuqJDTQGZY04q1wYPKII28K+H1WnrEpjXC?=
 =?us-ascii?Q?5MQMnEFCTkdpYSsGkAnMF+Mls2geZRMDsEq0dfUUxeT6Y3taDSp9AsFZ4enB?=
 =?us-ascii?Q?I2Yv1/Aj0hxHZt041zWwZgecmkqfE/5Nqw6KmZXfeghbqLMoa90t2e22VIw6?=
 =?us-ascii?Q?IAh2Q0N8hORZ1z5qcVrXIrYLLly5ExkW9RmzrRtRoj+ZPIEtcnpbVCAa1SxR?=
 =?us-ascii?Q?UZQLrqdDyWVp8V62z59lrrB7tHEj/7yc7QNBxUKMpc1yIlMywtra8Txlcx5T?=
 =?us-ascii?Q?FtjMVMy4LEToWr+XnXGb5s9DdhQLeRKdmwsh1yyLduKPbaECBLExDnwb/8oX?=
 =?us-ascii?Q?oZEPpww6AlOB73h8tInOVt3VNdMnKoAdmwgb7Ia2CoMMjxSptv1csQARLR37?=
 =?us-ascii?Q?3zERYRN6aeY6PF2G/U5BB+SnSYcKYjLMcHEKserCfpb/ASQIJoGjwp6hp/zL?=
 =?us-ascii?Q?0l+G6dcmO7LKZ1ZflaOMLDemu+MSCZrlXTiKAS0AHOc34bnuex0B4mtyNs76?=
 =?us-ascii?Q?l1YbI7g+ZfHTZSDGMv4CVURrYOEd8MbgBa57tsuzc/yjuA28LkK6jivTGhxP?=
 =?us-ascii?Q?U2ILkr3ZEAGN2YhziGrEm72ZNp6mQ3YXAkWsARAHnJYkvQ4PiWIrCrbs6SKS?=
 =?us-ascii?Q?wh2czJOMnJVsziouhmh+PYS0duszoVWJbKoxJb87lHfUfqaMkCivIUesnGFY?=
 =?us-ascii?Q?wSSsi3JO6TNfdFRFouRhb2nuJg8Dp9v/LyYMEFKeBqW1ClZI49rIonjH+sKc?=
 =?us-ascii?Q?bm+ffMgXWUi7Ia4bjsZ+15f9oMBOmsTxWPNxNplwBCDXleoaf4Upk8kY6PyK?=
 =?us-ascii?Q?WY3P7ZVy57JhA6z8wpcK8t8RfpDDZ1I5PmjmIcPpFsXyd1nj6FbFW/DobjbF?=
 =?us-ascii?Q?KQB4TilyGyBede+uZ5Vh7baPd/Fo1TZ11YI71HPA6qbN+43E6CWWaH80wMsS?=
 =?us-ascii?Q?RJaKPsI9mTbtxHtOB21Rgmsammhq96SJeTAVFuqCBwSsmSZv2w1/ua1Xy6W6?=
 =?us-ascii?Q?TGU0pWoOIiXe2PZSA7FwktSK5Tispo8DzyG0yuYKTQjS3SNk5gdfkcRR+gDA?=
 =?us-ascii?Q?BFSWppJe1PCQJH63g+tLmWFQda2KIdBaoan8Z8F9hBdHHYrgAwcknLDDJPgl?=
 =?us-ascii?Q?Jr1OxvQEFaNXgx4QbYpmkJnonnBH/d6ieNNlJqxGjGJXXhVVruRYZfEtj0UQ?=
 =?us-ascii?Q?6Jc5YFLzuwQ/ZQW8SLrm+b2tCdz0ZIjIzEdyfsOAfhdL61cDzDgpTnN5xF7q?=
 =?us-ascii?Q?qYZMQturKJ4lCQZmsNWAzR0fjFOvYiQNtXSq1kt4R1kzuQHZn1buqe1jtFQt?=
 =?us-ascii?Q?HrPL4EDA+2udt0Y9F2jYwME8cq30GUagFQWgTo7s6UsGfbENKwRPbwVtRVjk?=
 =?us-ascii?Q?7AWSNxK4UwXvFumzhtfGB+pUtZwrFiBaLhE/T/xfaZjX5ZqMH0xS54ZScq3B?=
 =?us-ascii?Q?1SBorQRBDZ0eCCmVe6+e32SnPikwZLnFwmY0G9xFNo60T0Ck+/GDomat+ZSS?=
 =?us-ascii?Q?rOF27HGAsfvTkgiSN0dj6NCaPEizw2un40jF9hKOol6AxKBhNw5s6VlpA/DL?=
 =?us-ascii?Q?oJA33DGL5y+mqrsSseVhgDaiD+6rd/LcXOlDolM16iWkZs8C9rQF2UjlqJdT?=
 =?us-ascii?Q?IQmoFeDJHg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d6b0ff-86a0-45ca-7072-08dec7a9a05c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 11:07:28.8101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdvgwDdvoidTeJHRmcKk0V5Bnr/0DnEGab4HywsSs4SnJJlYecpJRvWYtL/oFsEj9UPCpNo0jJ7i/BGZiC9DWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10525

On Wed, Jun 10, 2026 at 06:19:52PM +0300, Vladimir Oltean wrote:
> The lynx-28g and lynx-10g drivers share code and hardware architecture,
> so let them be covered by a single MAINTAINERS entry.
> 
> Add myself as a second maintainer alongside Ioana Ciornei.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>

