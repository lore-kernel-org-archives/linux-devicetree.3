Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013045.outbound.protection.outlook.com [52.101.83.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA77130FC27;
	Fri, 12 Jun 2026 20:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781294563; cv=fail; b=lEiOKydbs5HuRx25KTpQuHqkYJgmko3irbGlr/QiAeYExhpHS2kp0tEsW+2nJGojnqYAbEqjU7EODjIHp4nbUaefZYoB0XIcci/ZsXpk1VXnfsjIlq+A5z/MoZn1tb03tYuuh9s2bZJKNW+Z+DtTFixIxqORLIC8Rg8WqcqLohs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781294563; c=relaxed/simple;
	bh=FGvPcBC6tocCCD3vUyHP0uv9ykBNNE2V+qMOfDhiUxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pDiESBiwt6P5HkMEFH4bYJIMUv0mj77yf32xA3p4R+94H9D8D9msNp5T24evUn4+4b5E6ofDrXOTNmrOwVFR3f7K3J2wYAGAu0cKhNKYt3Y6KfDqSB9E0p22dcw30lZTKCx80lZNc0inpsHSrz//ayUUDdI64s/1pOzBKLPe2bE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RkDcZCVO; arc=fail smtp.client-ip=52.101.83.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RkDcZCVO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EkTI5d91pQRgnOpLdcKDZ18RhU0ejKwIhVu4bXsLjoxlbsrkm5J1BHCy9Vl8mYYDkB6GIB3+4z8zqobukbhHq5vFFfsHOrKh3MBAHZgogh3JyivPgZt8i+6m3RnVoRrOrm1jNTrQj2lvUEjJ5ASjjvXvRo4Y3CuQHffoH4zQ8hB6r3K3/H3ZVb6ma8tWB869QZCe3h3J0lGu6jR7JARSDgw1hGdhU1pfMJinDMJPHB+2uMhWul74gdqTD8iRlcpLGuPXDbezzs+HuO26B0z7ndfs8gGfxxwyHWz4DbwqfpDb+zJ4fPjfRM5MlarDc+dWFXXRn6dQFDpcRMOxI9+8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Q5p860SxDEQwYS8yihqGPgzU7/d2eWfYM+cr/HgIAM=;
 b=scBLyzXaoYYwkqTg3URqbwuiAhCSWBau8y73haLbSzHKokZJ3vykdhqzh4Bb397MLC4dSroPR93xJXrV661eAjF9ZnOomzQyjGZjeRFHvL4sX+7N6pNufsiaMkiQYOHHXH+gBHFQbNg3hnQikDzlsav2jxt/PKjhZopoa16IX5rTs3wcb43fnrHuxhpv0/foQyHfbvF3PBHwRC1woFpshN9yE2ej7prpSE2J6vHyH8ICguHt+hG6Cg3Psk5kF/YPpeDqMcE24yuCeyup2H7lHwipOkER3FjC8TwjH51L9Ssn0m2Qn+UnUYLzqU8O7TQqtzdgl34Y3g07ZMQALOmaSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Q5p860SxDEQwYS8yihqGPgzU7/d2eWfYM+cr/HgIAM=;
 b=RkDcZCVOUNhsxdfZlfXxfp5cj1sF8uzCYaMmMuA6s26X98S5RXaAMnrS7Ymsfp5ED/Gee4jLncC4D4a2vP1j8IKt1otvbBMM6+dhrgu1na+N+DF3GQ4kvH9XyPlu7tipH5NHJbQMlTrruAE7bWs4BYRMrbq4zKQWpgcHQQ5PGNXtcH0HnT+MUgMdyOti62w+Un7lizL9UXT/O+LRrpQ2O+0MBBApPdDhn/4MyOzQ4g2ULooVcx0C7FwmU/bsfttkQod/mslurGTCXphSGqLixr+gUkU/GIZ1hQ18u3CURckT6G7xacHek653MRguvPE/BsnHj5wdRxAR7CiIxc03RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 20:02:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 20:02:38 +0000
Date: Fri, 12 Jun 2026 16:02:30 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com
Subject: Re: [PATCH v11 5/9] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Message-ID: <aixl1v8c6IoIF4pC@lizhi-Precision-Tower-5810>
References: <20260612111816.3688240-1-lakshay.piplani@nxp.com>
 <20260612111816.3688240-6-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612111816.3688240-6-lakshay.piplani@nxp.com>
X-ClientProxiedBy: SA9PR13CA0169.namprd13.prod.outlook.com
 (2603:10b6:806:28::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_
X-MS-Office365-Filtering-Correlation-Id: f3147e30-894c-4f24-5d1b-08dec8bd8d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|376014|7416014|56012099006|11063799006|6133799003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eov0UzGJp5XbS3Pwvuy3J3HuPZKneMu9MLtvHK55MRHPvtfRCNHR1YwJs+AjL67tCdp6zDV5kaWAPt0thvH80tinFpu0hx2c6vYdVC+QM1GC7Y0r63FpKe/7ByHCVq4vmnNTX5VXIIdL2NRLh27bxXKMrh5BFnrL2RbrklyNehpAuBvBrO8iJCGA+B+aThi/r4pNl+svaKizE3ryKpUuYwvyafP8fmkRIu02NneM5TCkDzeHQxPNKqmZrkVTlTQMvXmAB3USkyN1RjLsVofwbQkmlsNbwMbESyoVDYLpBUxwGXTFpC4miK990+qHnoxR+34jukgJOwghobJtGwdX/UWlrSqGIHaiRReCpWfLc1oZhg5z2Fd4z5Ch4FPZxAX6AiDKLVgYwegLmZ2WLGd5867vVD4T/8ZKajyctG+SMqp/iVUQBWogvsoAHMkNGqHuvLWLJn7sWjuP5GmlMTZKgS3lt2OCvF97+TIy4BPf8uAxyRLt9hC+1YE4hZYoJl1XjJKqruHRwk1Q6T/l2LkcpEE/H+yuazZYmobOQsnGP81B261v8GOvorRvxt5Y4lHyMp//i+9Drdo2389HbW/CnAFXNoJgjR4de+FM5oIiSHvuuo8BUG5naYEN4pZU6YSURb6N7YaN8oIotGiR/zub7nuQUIh+YCIghdz93Sr7UofWw86PdGyTwikkGq/WOU5/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(376014)(7416014)(56012099006)(11063799006)(6133799003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tmkE0eHKuvYeioEz8yL16+k40vwQT8CCSjSExQ0y52vZ59t07RlW1MDCAxnb?=
 =?us-ascii?Q?1zZzR7768lXxgh3ApK6XiyWqjmg+dL80B+fP7XJUpmSGk1YzfemXD9KHUIFl?=
 =?us-ascii?Q?wmh2s1YekXSg3+C9or8bxEIRcnR4+8G0spygrnAQ98fe90nxNkJdOXiyrXP3?=
 =?us-ascii?Q?aOrFjusIV7d/oC9QE5xEtQKi1m7VD2akkrHprEV0weFVU92/XeTXNtzAKC5A?=
 =?us-ascii?Q?4kgvERvna0+IZ44YyhuGhpKPq/0gR8Cskrgmx6045teY4Ub5bzUFUgLqEgNU?=
 =?us-ascii?Q?oaRiCf/zBoWXWBTW34SdvR/GVZfnZHeFNo8s8SvOeaG0xen8i6CraE12hTzb?=
 =?us-ascii?Q?v2F5L5LTREFK2os/pg62zkAEGqZUUcgUwHjxo8GMkjMR+iMDuz681xAWv0LA?=
 =?us-ascii?Q?OrSBZtY0F0j/DtANfcLXVfsKRvw8D1Syl8zVZSHv2qjh3w1PgSiX3X1lN967?=
 =?us-ascii?Q?zlvCmqVIs7nM3giv0fUr2zfFOXgmhmqdOB1lLJmVQA79Zn4jqpBnpo7rY4Ku?=
 =?us-ascii?Q?0LDQht+kFVO7cmqM9FnC1BzliR5mbbF/JSWnCqsn10tHGYTT9YAsv5jEl5L3?=
 =?us-ascii?Q?9TOy7AfcEDg+oUF0wu8aiRpnv2ulthtV1xFjmmRqzcc99+QBhlMakX396SgR?=
 =?us-ascii?Q?0VdgEtLS3TeByicRgDbLF4/XoOOXTJ60MQlybHnBptfkq/w6C4XKgHOI6VBl?=
 =?us-ascii?Q?s2cU26yQY/mgcO7IrubynS5XKT9/juEKBQ303yONgr/iEQh7edvbaIOlNqhx?=
 =?us-ascii?Q?eYicePisioAZfhNl52jGjoznE7cubO8yp9igtSBvkbDBLYAFZ94LfV5K7LPp?=
 =?us-ascii?Q?FzImhYx9xvXndO9U6zOESXbjkuSU4Z77YGRbsy4ERllZKPUPaSKwk9mucnw/?=
 =?us-ascii?Q?AFHg+bMt+z/gyix0hEtcDd1yzLrnyE+y0/0wxQ2poSrKuVGQJIJjUbJAI8pH?=
 =?us-ascii?Q?HCu06qYZ/vi+5UAY+t0luST2awd1GGHenya3F+X5lWK2Fwn//AgOzgiFn+r8?=
 =?us-ascii?Q?1N4mKJitXqJ2Y+Fyhc8zGk1boPxzwEHEq5XaSKE55RKf6MMSTtHURcESGPpe?=
 =?us-ascii?Q?qNy9F43qnxN3hdRfYMQ6VmIoTLGhP8O3dpQi5SLPZWYQQkEhCd16D72vQN9B?=
 =?us-ascii?Q?L4Coiv+mOeIHiQhDjOqojVSw946W7zLJb3QkV+TbCc7eto7fiI/F/0yQuMRD?=
 =?us-ascii?Q?iLOwO609KCKd79tYBtpfRn8Sorc6PbWZv0T2mSzHkW8IVVLTAVzX8AqrxrXI?=
 =?us-ascii?Q?aGVoddMkERactM81+iv/38izhDeNC6l3zYWgFcHAEF7fPRYNMJA8UIbcAFuv?=
 =?us-ascii?Q?Ko1L2E75JZ0kfu7uxaT1iH2LIlWrasKO/vLHGf1YidfitkjiQWO4KSqTzOQ0?=
 =?us-ascii?Q?UKofBphVmUM+WoBiMIvhJGyqYVOo4qEoyArujFkn6e4Y3eXU0fDm/iTRgkcy?=
 =?us-ascii?Q?nqsFgzieAD4lG5hIis0fGgh+MhfdDVpvefQ3RrL0Gd9mXp5xVwhP+YlkrxDm?=
 =?us-ascii?Q?X+hTcDWAEaoEchqrzo7KKjy2tcxYxW56alwGASFcfR1Nf+WdUSZ1IaGNfuv3?=
 =?us-ascii?Q?e1ieroQtNBfCjeS2YwLrH27+VpIg4LaKnz2Eu04l76IFLo6hakx0Frh6pqOq?=
 =?us-ascii?Q?uIKOwbteJfs+cZUL9I+YJNWvM6Yigo06uhNy6eThednsesx9sGAXShGGMPFy?=
 =?us-ascii?Q?Esz7NgwJoHulJj1m+TouGPgrvjFY/ywuyiIHvRSS1R5oh5+8Wx2A/vHKFyWg?=
 =?us-ascii?Q?eWEDkTJit8LahH8GwUS4MwqavAzzHdlEvPca7fEVHyfvUfAxzQaJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3147e30-894c-4f24-5d1b-08dec8bd8d9d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 20:02:38.6695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6JWsYWlACipstXVSgmixE4T9H8k5JtV7dwXdeE3gG7sHsYEnki5BqgHwOy9vV9eL1wV0XyuV7Sh9Lrz93vgj6k2jcJesgrTejPKM2ltocZ+6xtjICxzyPc8vaQBEsfK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11799

On Fri, Jun 12, 2026 at 04:48:12PM +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> Add core MFD support for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> family of multiport I3C hub devices. These devices connect to a host via
> I3C/I2C/SMBus and expose multiple downstream target ports.
>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> ---
> Changes in v11:
>  - Use MFD_CELL_NAME() for child device registration
>  - Rename local variables for consistency
>  - Rename driver names to follow subsystem conventions:
>    - Use '-' instead of '_' in driver names
>    - Drop the "_drv" suffix from driver names
>
> Changes in v10:
>  - Drop redundant is_p3h2x4x_in_i3c flag
>
> Changes in v9:
>  - Renamed macros to follow consistent uppercase naming conventions
>  - Made REGMAP selects in the P3H2X4X MFD Kconfig conditional,
>    to avoid I3C/I2C dependency issues
>
> Changes in v8:
>  - No change
>
> Changes in v7:
>  - Use new config I3C_OR_I2C
>
> Changes in v6:
>  - No change
>
> Changes in v5:
>  - Corrected the ordering in the Makefile and Kconfig for MFD_P3H2X4X
>  - Updated dev_err_probe() for regmap_init failure.
>  - Updated module description
>
> Changes in v4:
>  - Split the driver into three separate patches(mfd, regulator and I3C hub)
>  - Added support for NXP P3H2x4x MFD functionality
> ---
> ---
>  MAINTAINERS                 |   2 +
>  drivers/mfd/Kconfig         |  13 ++++
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/p3h2840.c       | 119 ++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/device.h  |   1 +
>  include/linux/mfd/p3h2840.h |  26 ++++++++
>  6 files changed, 162 insertions(+)
>  create mode 100644 drivers/mfd/p3h2840.c
>  create mode 100644 include/linux/mfd/p3h2840.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ba65ae5a008b..3420701a75c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19311,6 +19311,8 @@ L:	linux-kernel@vger.kernel.org
>  L:	linux-i3c@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> +F:	drivers/mfd/p3h2840.c
> +F:	include/linux/mfd/p3h2840.h
>
>  NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
>  M:	Woodrow Douglass <wdouglass@carnegierobotics.com>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 7192c9d1d268..405b50c3c77b 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -617,6 +617,19 @@ config MFD_MX25_TSADC
>  	  i.MX25 processors. They consist of a conversion queue for general
>  	  purpose ADC and a queue for Touchscreens.
>
> +config MFD_P3H2X4X
> +	tristate "NXP P3H2X4X I3C Hub Device"
> +	depends on I3C_OR_I2C
> +	select MFD_CORE
> +	select REGMAP_I3C if I3C
> +	select REGMAP_I2C if I2C
> +	help
> +	  Enable Support for NXP P3H244x/P3H284x I3C HUB device using I3C/I2C
> +	  communication interface.
> +
> +	  This driver provides support for I3C hub and regulator, each subdriver
> +	  can be enabled independently depending on the required functionality.
> +
>  config MFD_PF1550
>  	tristate "NXP PF1550 PMIC Support"
>  	depends on I2C=y && OF
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index e75e8045c28a..a284b22c7b13 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -122,6 +122,7 @@ obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
>  obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
>  obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
>
> +obj-$(CONFIG_MFD_P3H2X4X)	+= p3h2840.o
>  obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
>
>  obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
> diff --git a/drivers/mfd/p3h2840.c b/drivers/mfd/p3h2840.c
> new file mode 100644
> index 000000000000..0a80992d6250
> --- /dev/null
> +++ b/drivers/mfd/p3h2840.c
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025-2026 NXP
> + * P3H2X4X i3c hub and regulator device.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/i3c/master.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/p3h2840.h>
> +#include <linux/regmap.h>
> +
> +static const struct mfd_cell p3h2x4x_devs[] = {
> +		MFD_CELL_NAME("p3h2x4x-regulator"),
> +		MFD_CELL_NAME("p3h2x4x-i3c-hub"),
> +};
> +
> +static const struct regmap_config p3h2x4x_regmap_config = {
> +	.reg_bits = P3H2X4X_REG_BITS,
> +	.val_bits = P3H2X4X_VAL_BITS,
> +	.max_register = 0xFF,
> +};
> +
> +static int p3h2x4x_device_probe_i3c(struct i3c_device *i3cdev)
> +{
> +	struct p3h2x4x_dev *ddata;
> +	int ret;
> +
> +	ddata = devm_kzalloc(&i3cdev->dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	i3cdev_set_drvdata(i3cdev, ddata);
> +
> +	ddata->regmap = devm_regmap_init_i3c(i3cdev, &p3h2x4x_regmap_config);
> +	if (IS_ERR(ddata->regmap))
> +		return dev_err_probe(&i3cdev->dev, PTR_ERR(ddata->regmap),
> +				     "Failed to register HUB regmap\n");
> +
> +	// The hub child driver retrieves information from i3cdev
> +	ddata->i3cdev = i3cdev;
> +
> +	ret = devm_mfd_add_devices(&i3cdev->dev, PLATFORM_DEVID_AUTO,
> +				   p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs),
> +				   NULL, 0, NULL);
> +	if (ret)
> +		return dev_err_probe(&i3cdev->dev, ret, "Failed to add sub devices\n");
> +
> +	return 0;
> +}
> +
> +static int p3h2x4x_device_probe_i2c(struct i2c_client *client)
> +{
> +	struct p3h2x4x_dev *ddata;
> +	int ret;
> +
> +	ddata = devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, ddata);
> +
> +	ddata->regmap = devm_regmap_init_i2c(client, &p3h2x4x_regmap_config);
> +	if (IS_ERR(ddata->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(ddata->regmap),
> +				     "Failed to register HUB regmap\n");
> +
> +	ddata->i3cdev = NULL;
> +
> +	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
> +				   p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs),
> +				   NULL, 0, NULL);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "Failed to add sub devices\n");
> +
> +	return 0;
> +}
> +
> +static const struct i3c_device_id p3h2x4x_i3c_ids[] = {
> +	I3C_CLASS(I3C_DCR_HUB, NULL),
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(i3c, p3h2x4x_i3c_ids);
> +
> +static const struct i2c_device_id p3h2x4x_i2c_id_table[] = {
> +	{ "nxp-i3c-hub" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, p3h2x4x_i2c_id_table);
> +
> +static const struct of_device_id p3h2x4x_i2c_of_match[] = {
> +	{ .compatible = "nxp,p3h2840", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, p3h2x4x_i2c_of_match);
> +
> +static struct i3c_driver p3h2x4x_i3c = {
> +	.driver = {
> +		.name = "p3h2x4x-i3c",
> +	},
> +	.probe = p3h2x4x_device_probe_i3c,
> +	.id_table = p3h2x4x_i3c_ids,
> +};
> +
> +static struct i2c_driver p3h2x4x_i2c = {
> +	.driver = {
> +		.name = "p3h2x4x-i2c",
> +		.of_match_table = p3h2x4x_i2c_of_match,
> +	},
> +	.probe =  p3h2x4x_device_probe_i2c,
> +	.id_table = p3h2x4x_i2c_id_table,
> +};
> +module_i3c_i2c_driver(p3h2x4x_i3c, &p3h2x4x_i2c);
> +
> +MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
> +MODULE_AUTHOR("Vikash Bansal <vikash.bansal@nxp.com>");
> +MODULE_AUTHOR("Lakshay Piplani <lakshay.piplani@nxp.com>");
> +MODULE_DESCRIPTION("NXP P3H2X4X I3C HUB multi function driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index 971d53349b6f..6188082599dd 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -85,6 +85,7 @@ struct i3c_xfer {
>   */
>  enum i3c_dcr {
>  	I3C_DCR_GENERIC_DEVICE = 0,
> +	I3C_DCR_HUB = 194,
>  };
>
>  #define I3C_PID_MANUF_ID(pid)		(((pid) & GENMASK_ULL(47, 33)) >> 33)
> diff --git a/include/linux/mfd/p3h2840.h b/include/linux/mfd/p3h2840.h
> new file mode 100644
> index 000000000000..2d4fae2176ae
> --- /dev/null
> +++ b/include/linux/mfd/p3h2840.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2025-2026 NXP
> + * This header file contains register definitions and bit masks for the P3H2X4X.
> + */
> +
> +#ifndef _LINUX_MFD_P3H2840_H
> +#define _LINUX_MFD_P3H2840_H
> +
> +#include <linux/types.h>
> +
> +/* Device Configuration Registers */
> +#define P3H2X4X_DEV_REG_PROTECTION_CODE				0x10
> +#define P3H2X4X_REGISTERS_LOCK_CODE				0x00
> +#define P3H2X4X_REGISTERS_UNLOCK_CODE				0x69
> +#define P3H2X4X_CP1_REGISTERS_UNLOCK_CODE			0x6a
> +
> +/* Reg config for Regmap */
> +#define P3H2X4X_REG_BITS					8
> +#define P3H2X4X_VAL_BITS					8
> +
> +struct p3h2x4x_dev {
> +	struct i3c_device *i3cdev;
> +	struct regmap *regmap;
> +};
> +#endif /* _LINUX_MFD_P3H2840_H */
> --
> 2.25.1
>
