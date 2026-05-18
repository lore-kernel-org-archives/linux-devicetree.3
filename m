Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011071.outbound.protection.outlook.com [52.101.70.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E69E3CFF68;
	Mon, 18 May 2026 07:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088975; cv=fail; b=Ajf07VjEOosUMu4fvdwiDioQJpoq1AE5BT4wS62b89Ot6FAGO16qtPUGTU1jzK5inMdcLDDFj8rhbARDBh3ndEkbTYlUnJCX/D1OfFZTZmfv3oPIopFd2SXmphlW8wuUKVUYr2lffWxRT9hlPWc/NPF7cHqhiyLrnpbs+dLk6Xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088975; c=relaxed/simple;
	bh=QKaeX5cadsxvxBVMJL2uzuDjxG8yTX+xA5KtX6Cx4sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nh7LYcOS+oWIQ2RxVoTOAt2cf8G5XOOCqkpb3ZCqEk50C05kVF0r/p/lZb6nH9YU+0ch6AqAdQpj0Iz8KwsmA+hlQrBLUEg50lj71RpEvm8xK60sLfEDBvGmNjKBeZF21VnS44uXyP/Xgl3L9w4FobAEZUw3Nb4MuotzEzjipxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fjSxIhok; arc=fail smtp.client-ip=52.101.70.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fjSxIhok"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mi75O78fd85Y71ceB1EV973ZVliQmoFbnZzN65TwrMuxX8E/K+ij/+PeWyXXaFUBb7decw6gEVK5Y/iznBOLURyPhD87iy3E7YX+SqT9LzJxZFsoYZ9c9QWNIoSk1at4QOrFZpzFPtnnLaP/ywysAd3TndfAPNTZc5nGFE2/M2zqP8JGdbey4FLj6jVAJlH1BdpUhZKAXBhJJg6hs0IOj4E/Ave8QRpqV+QQra4WYuqMkMhg34dRa3ci2YD2z/gfD8212EYBQWMupMOQLYmviSV18+aFdR40JTrY2x5wpG9Fem9vy55QmX5NmOgFovXxzJVLHWsnA3ioAFtmrO/C8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYc2TBkaHl8eq6DLTqJOT6zOjymyXUi4XMG+wJi6xA4=;
 b=xWxVsFhLCQuJT+kG1SVv5GGpUNNCQYNzyG87FcPxOMAWRN3VwaldEqrUzU7IuXELNBNyB/efie+3q+XMcYiZKt2as84JwIQ7bbCFyhAbG/+GDL11mqHzGOTbqWlsuxo+TtZSySTO4xo5G7zqIXEtw3wtYdDD4OiZ9PMpw5W7tMXbZ0sEv7xsmcttza0rkGxFx2xc2G8hb5bgRe8SdxKXtD0Lj/S0n5dDXg43Od4cbl9EtarTxHeX8PNOa10aRehy/wAyH5uH0PhmQ0POK2ENJ4JK4d48Ztn7um6L8OgU0FFEtwFvbMVr8djKpTNeaT5pXXTowUg1h+gtGiPAWeUABA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYc2TBkaHl8eq6DLTqJOT6zOjymyXUi4XMG+wJi6xA4=;
 b=fjSxIhokLCNBV/PpKa9BhLTKiarM3flVSIYASqNGSB7f2JfL1yJHAIrz36P52wUJrKghoppJCNfezPa2s2uT+iD1T0GjY8CEcDKNkrbOIRbIWrNjq238INeHsJL7Evku/LO/1q1VcXG2gUcy5AZOnVV1lfZgKCb4P1S9tieegToX1Kl86XLVr693YrbTLXvYvwtW2i0qf4RbEJZk0UET6HfDEioP2vGbND48Vh9dwSJ8kWEsJHhDe258ltAt4wojyev333qMz8afk9gM/wKfpBC1wwI/7e4T9tpHHpVRQ/dRFPA2oHokN0egTq6HiJi1I+owDJBuNxOVbeb7B8QG+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com (2603:10a6:102:89::16)
 by AMBPR04MB11764.eurprd04.prod.outlook.com (2603:10a6:20b:6f6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 07:22:51 +0000
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d]) by PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d%5]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 07:22:50 +0000
Date: Mon, 18 May 2026 10:22:47 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, johan@kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 phy-next 2/2] phy: ti: add PHY driver for TI
 DS125DF111 Dual-Channel Retimer
Message-ID: <qbwdkmrrkbrl235rtyi6jsfntlruooelyleq2jcfzllou52kma@y43tmo3i7r7t>
References: <20260516060309.2282592-1-ioana.ciornei@nxp.com>
 <20260516060309.2282592-3-ioana.ciornei@nxp.com>
 <agnu5Mmf_d8zvWXH@vaman>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agnu5Mmf_d8zvWXH@vaman>
X-ClientProxiedBy: AM9P195CA0001.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::6) To PR3PR04MB7402.eurprd04.prod.outlook.com
 (2603:10a6:102:89::16)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7402:EE_|AMBPR04MB11764:EE_
X-MS-Office365-Filtering-Correlation-Id: 06997580-b763-498f-18c6-08deb4ae44d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|18002099003|22082099003|56012099003|11063799003|3023799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	DTZy9W1AwjXvZsYQGZC+C0I+7GPd4bzjJhjJq8vszxmyBQJOd2bMnzqFBrVq43kbkCQrz5JhvEAWb4/HlPJNX+Go7BFZVMrWZxDiTKxKs+qrI6Idgw3ny5mC7ZNsgZfvjUGd1P/NDdbgmuoB7sch2LKMxt+cEntsiFVTomwd6D9LFp3QGfEamS5ocJUvvqSGvELpmnELrHvSXSJ8jgXSU/JO2JGzgy47qGMdxL7Qj1By5hyPfrmuI93e1EtVrJG6REhln80fUd1ED7K2vhav+7LIRaqb+I9euHbpOY7toy/Aepbypod3FgF8ZvHjPQAgcJanahcftCnka5fLZgctNBDJZQ/98uC1Z642di1glICezsu5+uDbn0HGqkbSVOmOQpftQi2iZJbjL78PjzFrpwbw7YOFOrbC7NgB71W5F3FCYm9y1rEwo1tAVKDJxQAWDDBSDNGchu3VNEVUPkNXgnUnrLQWnExCqcNEbmLdoEOKt+PCLwU82vA9qdK042AizxC4LwsLjjMcP0kIsSyXv/1YwsJeu3bgc/3a47HG5q4MFBC9ld/YW/8wsGAMaXY9oXan4XChMlR9i7blZy1RYGb8urb0KyOwtxN/nZL/yRyOM8VV9XXJf1Lei4MnHURCcC/BNWJiAFx83Y8tM8umUT4245ddj5pDcWZvAXP8dNfmmquo+5QAFVGqzPfqtxyp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7402.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(18002099003)(22082099003)(56012099003)(11063799003)(3023799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cpE7GttGIyyyvUSacz/Dc/+nNjF0R24K07iRHSyMYBIPublKmsn0oOOj69vK?=
 =?us-ascii?Q?yceSaLUlC7h7F7LpX+dZAJNQuNhUkYNxPQI9egPY+6xNbDmBiQm3rzZl7jSB?=
 =?us-ascii?Q?JXhxRIjaD+t7sT1chkSvwY3UQfjK8HO+/9/k6oHpBj6wYY8kcQ1kL7IitxIk?=
 =?us-ascii?Q?riwBCURonBfRRrE6mmhy0b1tWOV57qRYqVYhD5VdyKZ3lb6bBx9oFCtpd2P+?=
 =?us-ascii?Q?YForacFuZ7Wu5IW/MccF7NqYs7DX/sRTNem8uY54F1QTjY4eU1Kjg1TLn3NX?=
 =?us-ascii?Q?prS8nkZuN1/dweIxWyKTAWIzQo/+tXekUj3VQdlH9TMnLgu0mITBqPtqfttR?=
 =?us-ascii?Q?4l5DMm3oJrMJpZivorK6+L30q5DyqW4tDpCZh3mqP3wcvmJFgf5gMjNKaIwl?=
 =?us-ascii?Q?dDPyRxgGgHf7ZOc8MONnUq8DgQmT4OIFL2bifGtQDdF8FL0pHGJb+dBYjPQw?=
 =?us-ascii?Q?u9elCK5+LEYRYrIKOw1ITVAEbGxH8L7p5NRoYTiOZVh+QubwukpIm1xp8Bki?=
 =?us-ascii?Q?kASQDaJfDosobyhf+49COd8Dy31ys6j3emZ4+D9i5IEieJ571XBXOzrbm/e4?=
 =?us-ascii?Q?EVkdk1NfDcgXOnrSGnCNqLfGQ6SbYeV/5aaBf0QsClrQs43UnkK1nYEOL4v9?=
 =?us-ascii?Q?GD3pC3K5jo3t3gC9MjzfyFFCniPRiD3gomzmPu4NR3JAxSxvGSztuAm1EpSl?=
 =?us-ascii?Q?r51WQcHR2q39FkySqQ1BvucN+OSPnzxmrJUoc2l2rAq7KCHleFQa1ncvH8Kg?=
 =?us-ascii?Q?NjJbg3CXTQdOl1rXarZuP4whudXPb7yWx1HICbgwb7qk4vH7l7SPzm10z+Sp?=
 =?us-ascii?Q?dPB5MUP5ox+dOQWfNPlccxT3jEBN6PaDzpueN5tCkMCdPjH1KW4VeIRqc/1C?=
 =?us-ascii?Q?AMDWHqS1Qu+YM+0hgATitC96CEkmoEqcv+q+mPET2tRex1XsSqNMQNlgZAa+?=
 =?us-ascii?Q?1GQcHpI98f7ZzVrRkNu1OuHbD6jP0d5ktuTo/og3XwIstJesw1ih3B1Dmv8u?=
 =?us-ascii?Q?/MwRn2TnMS/DdjgvVLxTo9/Xor+MjObbn589oOmCtlXw0bzd4AK0jEL+5XUA?=
 =?us-ascii?Q?nX3eqXCgVJjSKe1rltZdzwRgI/RvPBjtU5E8r+i9iFQJqWQxSM4Ni6322WSL?=
 =?us-ascii?Q?1oyyuquk86YeOr7/cFWs48Y2ilcO7M1egUd8qAGXKSeitd+MtPQCRKgzWtc8?=
 =?us-ascii?Q?hO+vhJiM4avH+/US8j9JLoRPRW3IKYn4Hj4dWWD9T/jb6gG0UQis85z5+IRx?=
 =?us-ascii?Q?3tj2GOhwnbOG+2tf04D0964uFwgNTJMMnasO8lCdfBe0KXgczpMYzJ6AFqKL?=
 =?us-ascii?Q?ZdJ7vFeTXY3xybBnwPho9WAV4JwZXZULwCHXJBGvxMY/iggBnTbSd0+/bIul?=
 =?us-ascii?Q?PkXbx1VcFZwj57ipzBQHa8K8pi5RON8CRHatV76/eAWIUsGgb1JXpamipw5d?=
 =?us-ascii?Q?yt+n0QSPQ6CsWEeTMKXj26Nmy/Mp/VvIeDzJM0D9uKcy0xbZPPKuKLByJP4k?=
 =?us-ascii?Q?J967dxeMtSf4cZcD2ZldOY9/elWhCwWqDampKQc6Sh1GzHC3OAHg+bri8a6h?=
 =?us-ascii?Q?X7ff4YDMTQfS+MhB8ikkbJ5Tr6wmQuMuzDaPaZCLAUsVOQuKmP/IYlHhOhp3?=
 =?us-ascii?Q?Efn3apIZV18G7/qNJQwemR45jbE0V+g+jKakS8Zn3VJ3uqSSjSJjx1lH8JYA?=
 =?us-ascii?Q?+TKFfDjQMye9mTdryecWfqiLEvKI7NdiNqPQxpVf0QoM9jSoWyPvDUflaj4+?=
 =?us-ascii?Q?7TWnILLEEw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06997580-b763-498f-18c6-08deb4ae44d9
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7402.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 07:22:50.7417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lsMot00MSZ7kkBixVEZUZMnP32bbOwutZjehEpWzas3ygIyqNq6+5od9zUKwTPII4MIHE9yJ635dajJu04MKzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11764

On Sun, May 17, 2026 at 10:07:56PM +0530, Vinod Koul wrote:
> On 16-05-26, 09:03, Ioana Ciornei wrote:
> > Add a generic PHY driver for the TI DS125DF111 Multi-Protocol
> > Dual-Channel Retimer. The driver currently supports only 10G and 1G link
> > speeds but it can easily extended to also cover other usecases.
> > 
> > Since the available datasheet (https://www.ti.com/lit/gpn/DS125DF111)
> > does not name the registers, the name for the macros were determined by
> > their usage pattern.
> > 
> > A PHY device is created for each of the two channels present on the
> > retimer. This allows for independent configuration of the two channels.
> > This capability is especially important on retimers which have more than
> > 2 channels that can be, depending on the board design, connected in
> > multiple different ways to the SerDes lanes.
> > 
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> > Changes in v3:
> > - Use reverse Christmas tree ordering
> > - Print a symbolic description in case of error
> > - Some words do not need to be capitalized
> > - Remove duplicated exit code path
> > - Return -EINVAL in case of unsupported submode received in .set_mode()
> > - Add a .validate() callback
> > - Remove comma after sentinel entry
> > - Add a ds125df111_rmw() helper
> > - Use read_poll_timeout() to wait for channel reset to complete
> > 
> > Changes in v2:
> > - Explicitly include all the needed headers
> > - Change ds125df111_xlate() so that it returns an error if args_count is
> > not exactly 1
> > - Add a MAINTAINERS entry
> > ---
> >  MAINTAINERS                     |   7 +
> >  drivers/phy/ti/Kconfig          |  10 ++
> >  drivers/phy/ti/Makefile         |   1 +
> >  drivers/phy/ti/phy-ds125df111.c | 294 ++++++++++++++++++++++++++++++++
> >  4 files changed, 312 insertions(+)
> >  create mode 100644 drivers/phy/ti/phy-ds125df111.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f877e5aaf2c7..58f410b666e7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -26781,6 +26781,13 @@ T:	git git://linuxtv.org/mhadli/v4l-dvb-davinci_devices.git
> >  F:	drivers/media/platform/ti/davinci/
> >  F:	include/media/davinci/
> >  
> > +TI DS125DF111 RETIMER PHY DRIVER
> > +M:	Ioana Ciornei <ioana.ciornei@nxp.com>
> > +L:	linux-phy@lists.infradead.org (moderated for non-subscribers)
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/phy/ti,ds125df111.yaml
> > +F:	drivers/phy/ti/phy-ds125df111.c
> > +
> >  TI ENHANCED CAPTURE (eCAP) DRIVER
> >  M:	Vignesh Raghavendra <vigneshr@ti.com>
> >  R:	Julien Panis <jpanis@baylibre.com>
> > diff --git a/drivers/phy/ti/Kconfig b/drivers/phy/ti/Kconfig
> > index b40f28019131..475e80fcd52d 100644
> > --- a/drivers/phy/ti/Kconfig
> > +++ b/drivers/phy/ti/Kconfig
> > @@ -111,3 +111,13 @@ config PHY_TI_GMII_SEL
> >  	help
> >  	  This driver supports configuring of the TI CPSW Port mode depending on
> >  	  the Ethernet PHY connected to the CPSW Port.
> > +
> > +config PHY_TI_DS125DF111
> 
> This should be in alphabetical order, so I guess before PHY_TI_G...

Ok, will reorder them.
> 
> > +	tristate "DS125DF111 2-Channel Retimer Driver"
> > +	depends on OF && I2C
> > +	select GENERIC_PHY
> > +	help
> > +	  Enable this to add support for configuration and runtime management
> > +	  of the TI DS125DF111 Multi-Protocol 2-Channel Retimer.
> > +	  The retimer is modeled as a Generic PHY and supports both 10G and 1G
> > +	  link speeds.
> > diff --git a/drivers/phy/ti/Makefile b/drivers/phy/ti/Makefile
> > index dcba2571c9bd..e68445ddd848 100644
> > --- a/drivers/phy/ti/Makefile
> > +++ b/drivers/phy/ti/Makefile
> > @@ -9,3 +9,4 @@ obj-$(CONFIG_TWL4030_USB)		+= phy-twl4030-usb.o
> >  obj-$(CONFIG_PHY_AM654_SERDES)		+= phy-am654-serdes.o
> >  obj-$(CONFIG_PHY_TI_GMII_SEL)		+= phy-gmii-sel.o
> >  obj-$(CONFIG_PHY_J721E_WIZ)		+= phy-j721e-wiz.o
> > +obj-$(CONFIG_PHY_TI_DS125DF111)		+= phy-ds125df111.o
> 
> Here as well

Sure.

> 
> > diff --git a/drivers/phy/ti/phy-ds125df111.c b/drivers/phy/ti/phy-ds125df111.c
> > new file mode 100644
> > index 000000000000..8788f340e3b0
> > --- /dev/null
> > +++ b/drivers/phy/ti/phy-ds125df111.c
> > @@ -0,0 +1,294 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Copyright 2026 NXP */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/i2c.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/phy.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/slab.h>
> > +
> > +#define DS125DF111_NUM_CH			2
> > +#define DS125DF111_NUM_VCO_GROUP_REG		5
> > +
> > +#define DS125DF111_CH_SELECT			0xff
> > +#define DS125DF111_CH_SELECT_TARGET_MASK	GENMASK(3, 0)
> > +#define DS125DF111_CH_SELECT_EN			BIT(2)
> > +
> > +#define DS125DF111_CH_CTRL			0x00
> > +#define DS125DF111_CH_CTRL_RESET		BIT(2) /* self clearing */
> > +
> > +#define DS125DF111_CH_RST_SLEEP_US		10
> > +#define DS125DF111_CH_RST_TIMEOUT_US		10000
> > +
> > +#define DS125DF111_VCO_GROUP_BASE		0x60
> > +
> > +#define DS125DF111_RATIOS			0x2F
> 
> Lower case for the hex values please
> 
> > +#define DS125DF111_RATIOS_RATE_MASK		GENMASK(7, 6)
> > +#define DS125DF111_RATIOS_SUBRATE_MASK		GENMASK(5, 4)
> > +#define DS125DF111_RATIOS_MASK			GENMASK(7, 4)
> > +
> > +struct ds125df111_ch {
> > +	struct phy *phy;
> > +	struct ds125df111_priv *priv;
> > +	int idx;
> > +};
> > +
> > +struct ds125df111_priv {
> > +	struct ds125df111_ch ch[DS125DF111_NUM_CH];
> > +	struct i2c_client *client;
> > +	struct mutex mutex; /* protects access to shared registers */
> > +};
> > +
> > +enum ds125df111_mode {
> > +	FREQ_1G,
> > +	FREQ_10G,
> > +};
> > +
> > +static const struct ds125df111_config {
> > +	u8 vco_group[DS125DF111_NUM_VCO_GROUP_REG];
> > +	u8 rate;
> > +	u8 subrate;
> > +} ds125df111_cfg[] = {
> > +	[FREQ_1G] = {
> > +		/* VCO group #0 = 10GHz, VCO group #1 = 10GHz */
> > +		.vco_group = {0x00, 0xB2, 0x00, 0xB2, 0xCC},
> > +		/* By using the following combination of rate and subrate we
> > +		 * select divide ratios of 1, 2, 4, 8 on both groups
> > +		 */
> > +		.rate = 0x1,
> > +		.subrate = 0x2,
> > +	},
> > +
> > +	[FREQ_10G] = {
> > +		/* VCO group #0 = 10.3125GHz, VCO group #1 = 10.3125GHz */
> > +		.vco_group = {0x90, 0xB3, 0x90, 0xB3, 0xCD},
> > +		/* By using the following combination of rate and subrate we
> > +		 * select divide ratios of 1 on both groups
> > +		 */
> > +		.rate = 0x1,
> > +		.subrate = 0x3,
> > +	},
> > +};
> > +
> > +static int ds125df111_rmw(struct ds125df111_priv *priv, u8 reg, u8 clr, u8 set)
> > +{
> > +	struct i2c_client *i2c = priv->client;
> > +	int err;
> > +	u8 val;
> > +
> > +	err = i2c_smbus_read_byte_data(i2c, reg);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	val = (u8)err;
> > +	val &= ~clr;
> > +	val |= set;
> > +
> > +	err = i2c_smbus_write_byte_data(i2c, reg, val);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	return 0;
> > +}
> > +
> > +static int ds125df111_configure(struct phy *phy,
> > +				const struct ds125df111_config *cfg)
> 
> This should start at preceding line open braces (here and few other
> places)

And it does start after the open braces of the previous line.

The .patch format adds that '+' which messes up with the alignment,
mainly when tabs are used. Once you apply the patch you can see that the
arguments start where they should.

