Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795637048;
	b=JS3g6Pp74JZOxVMLFWQdM2TvTUhrRi51Oi5P2pxAhit3SHqClmhBCgUE8ZJiYKGp8ihE
	 JXOLtRl6nO4FbdH/a9TLx4BN6miS6VMUaisrDmaUq9pc0cToYutGb0YR71PZntg5C2E/s
	 z7yap4XxTsB8Xv5i0JnTMG7+W5NQOQZOEVVbYB73csFZWQSUipuPkL1wptXmBaJH0Gu3y
	 VfV5Mm7aJ22eityZCo5TW/1Lx5VV/qthHr1cWzkauUQcwOveiyqzeMacbMQnDbl9ygc/S
	 X+cyYIHblt+6eSSENCVkrGY7dTWDZBa8cEm8mQ4MOMwl9u//z/OW2OGbBp57MtQet0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637048;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=X067xGujr+9o+89isKilc3P7EN6kk6JQeHctQG1v0YQ=;
	b=vK6slYbW0AV+KvDH4j/ffODv07hJdOW4klmwWNq5zH+G7nu7rYo21TGKI8tNoxiqROoA
	 A3WNxFk6TyypOrkc5ZdN5+c4MBtd1blMmzbxFieZM+zE3Q2sg0x9ZunizMzrZ1CTg4t2n
	 MJpyL5K0VCx1vjI1QUQ+FlGvQdMi+W8XBaWIGW9jjW6w9fjkkwhT5i5cgdXB7KspO2lAA
	 qDiA5C61+fav31rw8AN3nDDo+lQTPXa2/ra9s/0TiONfJy2jhoC94s2eiHiKZcbicO9Uu
	 EQZ2RXy4IXeWkELRJG4t8MVzyTpAt9Ez+KhpXFHzi0plhWVc+rNWy82oH4cNYGeIoUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ehofGywm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.17
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013017.outbound.protection.outlook.com [52.101.72.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E2C606A321;
	Wed, 25 Nov 2026 20:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23E2C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ehofGywm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxZjb4TzO/pEJmOkZ8uqwBOxCQBJ7YVwViC0OFMVHI3unbF50kyZR2MBAOs5QjAhKjNZ5H8KioV/sAxsjAEEHcIieAhMVsA20GQ3H0w48a/Jzej8GwX3yTEIOh49TihQ9dIHyySJxgdh6l+rW3Q7evTuES1X4ddGlzGzUZnfCY8eS6xFP2laYvNOfKzzwMG4zEaHqpw4GaOm4CLoYZTRuZyoyGLneP13WY/3FvnOyna35crj8s0zELTTZ7mzKaG1No7chgq8ZHmJyVa+CWMjfZyqliipESdfbD7DP4JklxHgDGjHcGcLuI7mZoHO7lXJu/5cN16FyXAYXBkVHCGrvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X067xGujr+9o+89isKilc3P7EN6kk6JQeHctQG1v0YQ=;
 b=cXa5zG/SmlywuVAZRgW7CLppumg4BH9CxmbeT4XNwbaSDYbARSCf5Ij7BbfFNIwUL74NU1HiVTzdySqaLcemrvJUuq2bIDAscG05KH0cnydH+5+TIWBv230ao2ZNJpmqwWGX2v28OUioMoj/+EscnvBuqFZDPqOGVh+lHDD8fFwMnzESS0TcP+j3jKDdI069hrRjGE7ncwjPaMc/AF+WBhkGhkh098QVk7GikNJ5CZVTXXeZGA2GubE7YTp/d1k9+ED03hg8a1BnZ1Z4Mm4l+Jcy8xFsNzASDK1XVMW7+VuW8LT4mMvNBlY+1iXBdpHw/Hm1HLe25jqD45c5C7aKMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X067xGujr+9o+89isKilc3P7EN6kk6JQeHctQG1v0YQ=;
 b=ehofGywmenx8YI9kF4EIbiFiuVrUNN9ineEyXMTBJ6p+/9uEG9ENBy52lGC/g2XggOeoVtY4LRpGSdBeSKhxqBZ0nTzyElI/13irCK2uDOgFxySalUanWD4EiFW9B69PCULmMbGLMiRN2Brk7hKUNKvwHxQqoLwx+MnLV/GCF/yEM5IHGk6tjCvJ7wtchQs8D1l7Wh0Ppj3dY3H9vUWdeRnaxBh71m5obmiLxhPl9QZM2817CGPIMO3sDrI2rVk3zSAsio7bssHj3Jed7HB7c8N/rRcxOnsxt6nMD3YTie1t93/pdwS9RhhRNOyS6NWzOiACi82aFAmjUwGoGR+wyg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV4PR04MB237295.eurprd04.prod.outlook.com (2603:10a6:150:402::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 20:04:04 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 20:04:03 +0000
Date: Wed, 25 Nov 2026 15:03:57 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Michael Trimarchi <michael@amarulasolutions.com>
Subject: Re: [PATCH v3 2/8] ARM: dts: imx: Use minimum NAND ECC strength on
 BSH boards
Message-ID: <awc_LcVNuEc2SqTn@lizhi-Precision-Tower-5810>
References: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
 <20261111-add-bsh-smm-m2-v3-2-4abdf10e9a7f@cn.bosch.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-add-bsh-smm-m2-v3-2-4abdf10e9a7f@cn.bosch.com>
X-ClientProxiedBy: CPAP307CA0010.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:3::9)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV4PR04MB237295:EE_
X-MS-Office365-Filtering-Correlation-Id: 1869b1d9-cbcb-426e-04e4-08df4b2f4119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|19092799006|10067099003|56012099006|11063799006|261021121427099003|261102123227099003|261009223027099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8AmExdEHaFQQ9xvNTLzUYNmM6gIdouU44qkA1I504jJbAU/rdyjayGjCJ9gW9scTDWXMeVABAA2cLWZb3QGBJwhKkn5VjJ27qroRQvUcjVvy1t1Xpf/Jon1VDPze1iZ3ep+csYueCq6IxUsXPynQ4Uv4wzKV8nncFa9Uc4mzjc7aFSV6nDsx7bnlLSt2nIIFYBQ7ai6wwiFxbib4Htl5WK06/AaMU3uCdRnr2i0LeNsrcfgqKALcWkJjcUkCF3KZfIbSYqM4vchYrYEOKtW/JaDYz3seh8OrUte6gZ5tsuwDg+WxLEj4J1iDx1wRvBaxxHUeH2ZS9VVtmitpUMGlFZnDrlxYIPZXqitTxMBQUczXzXP1O60GUstfZQFw0rUOgvdYkopTqJO4+ExqV7ZhxI9hYn4Y+PcrdceNbr0uPPdTnjaXuxyseZ0gF56I+5vgZxLfFhIl89mA2eh8MHtgd1iuJjio/S9qXKop9urxiVaN4r47B/5sG4lb1HL9dwc+c8fwejaJ7oa2rgcpVnyp6Wl5J/NykZWidDsdpR5NcmVnQrgbt7WrJfmxNfN5W8+gY5sJOje4ENPM4vM2mKIbUP/ooi0quYVP6Ld1WxmzxrlKAepRCXRDbBqX4j5wcWb+7yJKSeGwK3L/OGq1A3s5E9yyg5qdUAJs/9pJkrSa+Wo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(19092799006)(10067099003)(56012099006)(11063799006)(261021121427099003)(261102123227099003)(261009223027099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uq/ommDcRNuZvh1I64iCntpD6KzM9lYdRofOHPkdAn5YRHn7bI9n9Jer5lPm?=
 =?us-ascii?Q?NI342WKLTvMusUEzRU1e8w1fTZ7T0lRgr5NrLn5WvGAFLRzdQfYEQlJ75i/v?=
 =?us-ascii?Q?oNhVPalDPBKl7VevWMKG1vaiXVBK/5LgsIwAFI/ROe+tYNqqKikJxacozjDQ?=
 =?us-ascii?Q?NVXphIhdLGxFFddshW44ny1ScsSW/2fDGTZ+zowOCIn7Z05eFMnCTCNX1cd5?=
 =?us-ascii?Q?u9wPiuirWga8ZUdb4phBaYhtR1n4GvMGZ81Npy2kafz39SUf/Q170Wc684r+?=
 =?us-ascii?Q?Ydwzt+8IHW/RMVE2TPaY00FrSzXBz2Gp0fVIzvQCyxAkTU2/NuYnX+Rx/8RZ?=
 =?us-ascii?Q?NZ7RbG0yxu2kuzJ7diaXv8n4BDFIVUZP+dgxUL137zFp3wYcN2rQ3BWf2pEi?=
 =?us-ascii?Q?fL96YlbETHAX32CgybSKU1+M2aVwYzqenpTPTeGox61I3+cP5TUEXt8puPb8?=
 =?us-ascii?Q?pCr6edMxEumYh1ueJpb4pIhPDlTVwufIXDdH5aeS4IYrailf3H5iv+UffqkS?=
 =?us-ascii?Q?INj7bNGyVYM+kLrgfaJp9W0zJ0qUwpFVpd/s87BEhx/oL6QyMZciHP4CF3Bc?=
 =?us-ascii?Q?C2FW8InA/gyme3Gsa0izz7guxtIDFGk2YDhezcjQLRO/AeXMDEHlpxW9+cf3?=
 =?us-ascii?Q?u3LPf1mk4NYDCwrB74uuYkZEzGHYn07TWObQEGhBIO/gbg8iJZ7H0lR77U0r?=
 =?us-ascii?Q?M2rgjdyV/rBO7aj+c+s3l9najDnt+5kq/GVjByq4noyfOlf4Pxk1WrGaO/js?=
 =?us-ascii?Q?FOl7bIX8e3LilkfzEK7Nr8ZOsINxhy9z1SdGtC1WmDyZsrdpEvr0au1cNmlu?=
 =?us-ascii?Q?kRDhA+PUGe9PvtDeXYsTDNEZMIQ9Tv3w+FXU0p7xch3uh+3Q/tnAKq7J9lne?=
 =?us-ascii?Q?QUBCwI+ePG+Nuvmno1QHQQ2RZhr/SM1JeF7mPOUUd/Lubw8rh9GVzTXQehDM?=
 =?us-ascii?Q?oIRDJEEuxbYTwq0Tr6IP3wy6euGSVzkise10MDEktZBr4Sakpqk4hgMtH59R?=
 =?us-ascii?Q?YJLQbmflNPqKJiZ202F+t6qn9SSCv6Qioc1bsjT1CIDCXFVrJlXvcVARW6BN?=
 =?us-ascii?Q?hvq6tgtovY1kQGft4usIES4X0WO+sdFcgjptqWxo9i1UVIu0ct3YuYSDdQkz?=
 =?us-ascii?Q?QGS0WS7XPxuyuToLSG/cAcRiqPYO8UC9YA/qR+HYuIJ0pWkcSMBMwxITkQZQ?=
 =?us-ascii?Q?FPXub2qFzSFN4rjt8qaLCTkEMFFJf+hHp+Z3XFD94HIhZaNtduRdSUWhMxFE?=
 =?us-ascii?Q?hQxrnJzUF64Md2+JEe0TwYSwTAcZ82YzR4eUmJCdupsJ4CLcs8VGX6d2PFi6?=
 =?us-ascii?Q?0pK+saokNkVy00G6GyiQ1PdkbgglscXOzwiPcMpEKZykfJI8auOQH/TgFhcA?=
 =?us-ascii?Q?/u5xbfWVBc6fyFWbJUKJQCu2kEULIAcbMf15qjXFEl+6yELlTm4Uq+ej6Ejj?=
 =?us-ascii?Q?LewWeHgWRC8jYms0KRx9rZZFw4bELN+zfpf0M3BqfzHRfQ8hKvN5eIUt3ZO3?=
 =?us-ascii?Q?kjnL6mEAz6glufilRsG0AROZ3odAuGNoa7Eaqc3pMCkc3W+8khM6HY8PxhIe?=
 =?us-ascii?Q?uT9tRK3SREoGwT5LtzEr/Ay3wO44Ztzypd3EEigEl1Aykn8TbfUYStuyVfOg?=
 =?us-ascii?Q?x+dlATcNK7CcRNlrkHLUxrrsONeHDXaV53kj1wRIso8C88Kkb3B1M9g/AOx2?=
 =?us-ascii?Q?WiSub03vTQKnR1IEzo3yz+BIgd5jhyA20iOMKE6ZJWOmCuPyOAUEhVfIB7eY?=
 =?us-ascii?Q?LC4xPazK7Pg1A/dtxo2tYy2uvnR8/+Nj9QMMoptvC5oU+4NrZhaA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1869b1d9-cbcb-426e-04e4-08df4b2f4119
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 20:04:03.8539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XG0Qgn2sb1CY3Sps4oCdNZjWX0/ABk+baRKKOGIFF4tAk2DN8XNQ9q1VO+GrKoi2XEoA11y7OER9e+ySlRZPCLNw3jM0mp8ZfMUOOc133pCpd7Fd5ThLZ8kK8BI9lCXN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB237295

On Wed, Nov 11, 2026 at 05:23:18PM +0800, Haoning Cheng wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
>
> Configure the GPMI NAND controllers on the BSH SMM-M2 and SMM-S2
> to use the minimum ECC strength required by the NAND flash.
>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts    | 1 +
>  arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts | 1 +


Please use sperate commit for arm64 and arm32 platform. This time I split
these for you.

Frank

>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> index 2d9f495660c9..aac211a9f9eb 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> @@ -26,6 +26,7 @@ &gpmi {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
>  	nand-on-flash-bbt;
> +	fsl,use-minimum-ecc;
>  	status = "okay";
>  };
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
> index 11a1ba5bfdb7..df11f81ac50c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
> @@ -21,6 +21,7 @@ memory@40000000 {
>  &gpmi {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> +	fsl,use-minimum-ecc;
>  	status = "okay";
>  };
>
>
> --
> 2.43.0
>
