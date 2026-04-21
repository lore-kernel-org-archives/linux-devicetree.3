Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012032.outbound.protection.outlook.com [52.101.66.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED8A40DFA1;
	Tue, 21 Apr 2026 03:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776742115; cv=fail; b=tyqrT5nK6XFg2vF2ukn3vJBnLWK1Urzuxzuj4DDoeS3NuTqVd9JlJj1xKpE/E1X0VkJdd1G081YsYk/pmoY+m6Ax3vld7kiDn6NpISkee75JidnsLwk1dvr3DzHx2JZRpWhqudMJeT63uYvPzLh7Y4gQ167oP9Hwi+WBV/j3ygs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776742115; c=relaxed/simple;
	bh=QRaTjG30OxUWLOmnLunMnKVG2Z3rOwEMiDR6XHeaP/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Tz/bedz/GYxJEKzar2ahR18cpXJBWQYZQ9+w6lz6LrRZNaOF7RrBvSmABdcDOzT04DTqi76MITOVHHVzzULGkuVw43VJMpgfxaixq3v5DeSIPX75WpPxlI75MGcnB5QWoOrTWmLRHPViST/SGpw00hbMFrvAIX/FCud6T1aVd0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cMq1dqDJ; arc=fail smtp.client-ip=52.101.66.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cMq1dqDJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giAinmSxnEHzqbCPPQZhuJocNlzGkE+pYNrDiKE1+ybGym2IZk0puRPbVjnhu5G8ftCpCQpkjLUI0GrHnheGy9RNq0JMen8YWsxL84a/WrHvbkhS8eW5gEn9JWGE4UoSzELd/tf56sDvU6b5eY/GwgiANyd2/d5W5xZtcd+n0PF/VhGO1KKYxfwcCSyMF1ZG15B8EdSwzibM4GCLpse/tW1VhY8oi/jzXcWeWMc/Ym8zTIvdiZqMBSs4hfz03dH+uW0RSx9VTpZ5+P+W1tdFZJt+0OSIIpmuwsATM+UZIRVRNssnMaEm8MzfaroMkU91k2zyVi+1YFYFk8Re+28iMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbFjU1pUrC15wjZXBS6ubpgYTF848gtiCrNLQ/RG8Oc=;
 b=Y3qAOMal40nhiE9NOtONjcDg3OQB25XK7wCmtpj9gWJFp5Zl83yfNDopHXo/j+UXL9Wdfhb6U7lyOSVG0BvXkAm99mnFTQPXfblj+67qYBefq3hDOYo8RN6VBUCtAjBfdBFbAiu4nOhZUL0ojrUutMbFUJyew7ouBRzikE/MpOwnLKymf+F4iS/KxWSTosehytNCrJDmvxFNNYEhMo3LMIet/Lnww62rXyD+8ixP8AAQRVmGJrV/xQcLgtfAmSO+eMaGk1tbHiRa10GAmM4e1Ie/LtbtRlG66d4g7gCNqiuQ36j5Rb7X36jJZv5t4iY5EJlcRtLgiizfbDP0mw3EUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbFjU1pUrC15wjZXBS6ubpgYTF848gtiCrNLQ/RG8Oc=;
 b=cMq1dqDJbFGySu/nms6O2jQvJReOhk1iZPopWtg+k7gkHgwlCYkKbLuQTgF1tQW20OkCih4JbGL7gQxmQrV9aeXRnEP4GGY/sArG+viIvFpnP1w8AVXCN1dVJHMWngNTvc1s1W501ExXhR0rY0TPtlYakgCrr5JzsNuUQb1jqKVIt+TsxRIiEDgenIZ+hg2OhSQEBCUnDd8XmPQP8O7zaoWMYkTj8UOzwR+Y6H2ij2LAQ/icWqLxUSeQiD5mCBgQ5gzlVt536kir+tAOsXG94CE3tGQhLhsDlv/qqE2+0sZrwDL2HiyIyGnqTuSWJ9g1rCgSjvVz629oN4Sm4tuZwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB11591.eurprd04.prod.outlook.com (2603:10a6:150:2b0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 03:28:29 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 03:28:29 +0000
Date: Mon, 20 Apr 2026 23:28:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v9 6/7] i3c: hub: Add support for the I3C interface in
 the I3C hub
Message-ID: <aebu1YNvvdGNVkfq@lizhi-Precision-Tower-5810>
References: <20260420105222.1562243-1-lakshay.piplani@nxp.com>
 <20260420105222.1562243-7-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420105222.1562243-7-lakshay.piplani@nxp.com>
X-ClientProxiedBy: PH0PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:510:5::18) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB11591:EE_
X-MS-Office365-Filtering-Correlation-Id: 58e46c36-2030-4229-1703-08de9f560e21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|7416014|366016|19092799006|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	q1v3D2Ck7cwgb6+oRjjKoyIvwkUpAG4fI+BtbjkI88a3HcvbmpBohwuYrlcQ2ztqDssXyEtnJgV5kynpVFoYWiwSW4vltQlngRryLvGnCyRJ6lm0RZCFiRLlDL0tqtyDrSIiDWS7kO4dnjSmKvye748qn/psLqXQ4vzQPe8oz/t6nFG+pC0YHhYSgQwgHtZS1jkX6oQFozGCeP0YeNpaHtAqHGu2eCgXP/7XbcCg8lMxIf5q5/YdmZWqz7ruu6YlMQ/6oCRruA3HX1d09mNj9BuewPGMA7K0qqYm0iQDhKd14huZUJy8W7mE8tDjJ5LRaUc/Y9hHNfKO4sPN7DFWTJvL/cKGZkSJ4G+YIyM5NvzefTfd02UMcy1uAMpoIcHCS30iKAeYXk+DG8wHIH4wbA5tM6Y/vmsws63lkEmCRxc7YW9Q5wpDYdHDqcF4QMCDK+aMievvykLdNGmC1frwwc5BjNugX78AkoEZQ2JFR80D37iwvqoovh18MZuoI7aPuI+fv6Xm0O6bDdevc/d+nslWWUAdzYFsDCe5BGIMpP4jk1XIbJ4bWlza5mBLKpDZJQsyp0YAlGyIK43tUSmBAUg3QFl0AgTM7iQZpvvBPoBtd4EECSZo5kK90s5X5n1IA0wPgL8R4GTtj9BUO8aLiTVJZnZiAx39mqFB40+RjwKo2Hw3SI4PfVIuUkNBB4Seez7zFtjT4Tq2R2MjAZPaySt0UUhpHRwYQovmnlgCaTItGiw4jigXU5F/vGMYk/DGvV/oIH7ZTIY81BJ1ueTKiI2DEMpwIB/kq+MGT00rJX0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(19092799006)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?03kGAH8nky/3gzAVcQyPmm/peRy07U/9Gm1cu0XkVBso2g2kgyOLbrqPGFdE?=
 =?us-ascii?Q?1JM3WtBh/DE16AGOyOO9LhJLXAxtLeLQAzL0JHzEfPGZ4PRWgCx5aVpRA9yB?=
 =?us-ascii?Q?X1TcfeBTExTsXRNJlLC86RIAnF/Q12E9fdBiAygBHTIfu4RgIAQ3AR//1PsF?=
 =?us-ascii?Q?guWQTr+1x9YgCwA1VnolZNuxKP0/kzejvv5T4NBCodk6YF4NOBjERd66co5q?=
 =?us-ascii?Q?q8lGmStZz8NRsRip3sL6JjuntWxOL/FbDJUctZRsLuDEaa+qb916gdpuIGp0?=
 =?us-ascii?Q?0l5Gv9HIiSMspqkqfJ6KWSla+DHvP5J168gkurZAcSamXogKSaOpwos9e4ut?=
 =?us-ascii?Q?Ys1xfhOnMTwZlo7g8uiAIytII++7MkB06k6kyxvfJNigx9//gRwNDRkHoRil?=
 =?us-ascii?Q?ZUQwPFQl8JzZk+mcAnngoHGkR611sIVX68TVfkrkk0bH3NOM9WVE9bdcihPL?=
 =?us-ascii?Q?+ISip+lQ7lVNDzH9ItvJh2vXJWwYFIrvaTiPK3D4PdZKePg8twYx1JzOVwX+?=
 =?us-ascii?Q?w8EcGBPLR8gsCbqks0mt6PRYh2R0PJlJd+OcyejhfBxudKCU2qsYeC1EvMaH?=
 =?us-ascii?Q?KZtzQkLVsieQDfpJEZiEvwvhmb9bhl8bwGOEMWOCRGNpc/dYUfeYLaVBXAII?=
 =?us-ascii?Q?ljYCjN1nw4CIpp7PX+OF0JJnrcJs/2HG6keLRM1HQjEAYE8tgEau/fiJ8jjA?=
 =?us-ascii?Q?Qm2MZOuUZPIex4lOxPT2vTkVdSjstlNiKQFLzWnQdumJ+xAy/lP7g4ZOLodV?=
 =?us-ascii?Q?7/gY7QXkB/9kOGf/2ptD1S0+zvzX0YmIFcNwRi/UiaM+kBI3WOohpu65rf2b?=
 =?us-ascii?Q?4orCw7SZEi0bUmaeUshKmp71+IuOtgN/7Uv5TFrewyRmy7jyEn3162VowbLq?=
 =?us-ascii?Q?CWPVtAUywgI+2Bh+K4pN0qI4/emgnE9OeSxifNwTnCSDHjy/aSA4z4y/OIWx?=
 =?us-ascii?Q?32HjmrdD18b1dYjBqsFD8ezrHGHexsMaa+Og0kPN853dWX8iartYxk7ll27o?=
 =?us-ascii?Q?1M8626+aVyt0uHidEtmpfzDyFa9UvjKVLrSWbR3Oilnq7s5Ao5RnYUg3j3XS?=
 =?us-ascii?Q?XQ0iPPiGh0flI/UHr/1eEESDkjqtLqzsMP3KbXU3JIhYycpMd4d4UhP2g3Aj?=
 =?us-ascii?Q?Go8QdkZSg5Lx5wbpK4J3P4WnTN0ayjzgJy70nVtxQLYQaKvl0h2cd4gvJiHV?=
 =?us-ascii?Q?UymIrSrQzYHiOFdtEhJCwavWO6EGdjmcfP5k0/QXLxPNCgr/L+zku1TpwBCd?=
 =?us-ascii?Q?WFQdBAMjtLTobNvhwLrexBTRDnFJWOE9k5ZozwHcVpqbe1v3TrY5gzGR2JXo?=
 =?us-ascii?Q?XFdZsxNqTf0zRnacvfUTrREUOd1nQ2haioMR2ovhmOVkVthORJicya9eJWTl?=
 =?us-ascii?Q?QQplLIWir0TD6FYANexRm4Jwakw1uuP54kqKikGBDddoM4kW8krQZTG8Z0h5?=
 =?us-ascii?Q?H+NCb0FJpfGRVn9F3SsuatJsX9+6+ixrUcUFcjMxxpdtljWvlQYmdRg8fuff?=
 =?us-ascii?Q?bZ+0WtIpBqEYtja3y5kl275DMoESUPMFtCYGZGppNuvdH07PqKRu3H7mnMgl?=
 =?us-ascii?Q?u/Wrd1echiZogn8OMq8yeEOcKa31M5OvrOxYMms8iXzqmL+DunJgOOLVESp0?=
 =?us-ascii?Q?XQXvkFFCG3nJbRsaFrMBfksGt6tP81ip56MzQdRVgrTgEBk+w3DLlwk2TS+g?=
 =?us-ascii?Q?xQa5IMAfSxDTDGJ6V9I4mSqFi6XR4z/nsCPqTsAhOt5El5qN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e46c36-2030-4229-1703-08de9f560e21
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 03:28:28.9910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tdvpiaSVWzNSF7ks2FjEefBQTk0NIbBo3O+RC4NHs1QsH1QIByeOqIEVfu2QVW8gb0VTkZNgaA0cbXQZXMlmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11591

On Mon, Apr 20, 2026 at 04:22:21PM +0530, Lakshay Piplani wrote:
> Add virtual I3C bus support for the hub and provide interface to enable
> or disable downstream ports.
>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
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
>  - Convert Kconfig option to tristate
>  - Fix signedness issue in return value
>  - Fix kernel-doc warnings
>
> Changes in v6:
>  - Add support for the generic I3C interface in the I3C Hub
> ---
> ---
>  MAINTAINERS             |   2 +
>  drivers/i3c/Kconfig     |  15 ++
>  drivers/i3c/Makefile    |   1 +
>  drivers/i3c/hub.c       | 460 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/hub.h | 107 ++++++++++
>  5 files changed, 585 insertions(+)
>  create mode 100644 drivers/i3c/hub.c
>  create mode 100644 include/linux/i3c/hub.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b2119fadef7b..bb3e8e9674c4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19274,8 +19274,10 @@ L:	linux-kernel@vger.kernel.org
>  L:	linux-i3c-owner@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> +F:	drivers/i3c/hub.c
>  F:	drivers/mfd/p3h2840.c
>  F:	drivers/regulator/p3h2840_i3c_hub_regulator.c
> +F:	include/linux/i3c/hub.h
>  F:	include/linux/mfd/p3h2840.h
>
>  NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
> diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
> index 626c54b386d5..65304b416bb4 100644
> --- a/drivers/i3c/Kconfig
> +++ b/drivers/i3c/Kconfig
> @@ -21,6 +21,21 @@ menuconfig I3C
>
>  if I3C
>  source "drivers/i3c/master/Kconfig"
> +
> +config I3C_HUB
> +	tristate "I3C Hub Support"
> +	depends on I3C
> +	help
> +	  Enable support for the I3C interface in hub devices.
> +
> +	  This option adds virtual I3C bus support for hubs by creating
> +	  virtual master controllers for downstream ports and forwarding
> +	  bus operations through the hub device. It also provides an
> +	  interface used by hub drivers to enable or disable downstream
> +	  ports during bus transactions.
> +
> +	  Say Y here if your platform includes an I3C hub device
> +
>  endif # I3C
>
>  config I3C_OR_I2C
> diff --git a/drivers/i3c/Makefile b/drivers/i3c/Makefile
> index 11982efbc6d9..9ddee56a6338 100644
> --- a/drivers/i3c/Makefile
> +++ b/drivers/i3c/Makefile
> @@ -2,3 +2,4 @@
>  i3c-y				:= device.o master.o
>  obj-$(CONFIG_I3C)		+= i3c.o
>  obj-$(CONFIG_I3C)		+= master/
> +obj-$(CONFIG_I3C_HUB)		+= hub.o
> diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> new file mode 100644
> index 000000000000..67c5d2695a61
> --- /dev/null
> +++ b/drivers/i3c/hub.c
> @@ -0,0 +1,460 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2026 NXP
> + * Generic I3C Hub core implementing virtual controller operations.
> + */
> +#include <linux/i3c/device.h>
> +#include <linux/i3c/hub.h>
> +
> +#include "internals.h"
> +
> +/**
> + * i3c_hub_master_bus_init() - Bind controller to hub device
> + * @controller: Virtual controller for a hub port
> + *
> + * Associates the virtual controller with the hub device descriptor so that
> + * transfers are executed through the hub on the parent bus.
> + */
> +static int i3c_hub_master_bus_init(struct i3c_master_controller *controller)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_hub *hub;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	if (!hub->hub_dev)
> +		return -ENODEV;
> +
> +	controller->this = hub->hub_dev->desc;
> +	return 0;
> +}
> +
> +static void i3c_hub_master_bus_cleanup(struct i3c_master_controller *controller)
> +{
> +	controller->this = NULL;
> +}
> +
> +static int i3c_hub_attach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	return 0;
> +}
> +
> +static int i3c_hub_reattach_i3c_dev(struct i3c_dev_desc *dev, u8 old_dyn_addr)
> +{
> +	return 0;
> +}
> +
> +static void i3c_hub_detach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +}
> +
> +/**
> + * i3c_hub_do_daa() - Perform DAA via hub port
> + * @hub: Hub instance
> + * @controller: Virtual controller for a hub port
> + *
> + * Enables the port connection, performs DAA on the parent controller,
> + * then disables the connection.
> + */
> +static int i3c_hub_do_daa(struct i3c_hub *hub,
> +			  struct i3c_master_controller *controller)
> +{
> +	int ret;
> +
> +	if (!hub || !hub->parent)
> +		return -ENODEV;
> +
> +	i3c_hub_enable_port(controller);
> +	ret = i3c_master_do_daa(hub->parent);
> +	i3c_hub_disable_port(controller);
> +
> +	return ret;
> +}
> +
> +static bool i3c_hub_supports_ccc_cmd(struct i3c_hub *hub,
> +				     const struct i3c_ccc_cmd *cmd)
> +{
> +	return i3c_master_supports_ccc_cmd(hub->parent, cmd);
> +}
> +
> +/**
> + * i3c_hub_send_ccc_cmd() - Send CCC through hub port
> + * @hub: Hub instance
> + * @controller: Virtual controller
> + * @cmd: CCC command
> + *
> + * Enables the port connection while issuing CCC on the parent controller.
> + */
> +static int i3c_hub_send_ccc_cmd(struct i3c_hub *hub,
> +				struct i3c_master_controller *controller,
> +				struct i3c_ccc_cmd *cmd)
> +{
> +	int ret;
> +
> +	if (!hub || !hub->parent)
> +		return -ENODEV;
> +
> +	i3c_hub_enable_port(controller);
> +	ret = i3c_master_send_ccc_cmd(hub->parent, cmd);
> +	i3c_hub_disable_port(controller);
> +
> +	return ret;
> +}
> +
> +/**
> + * i3c_hub_master_priv_xfers() - Execute private transfers via hub
> + * @dev: Target device descriptor
> + * @xfers: Transfer array
> + * @nxfers: Number of transfers
> + * @mode: transfer mode (SDR, HDR, etc.)
> + *
> + * Handles address adjustment and forwards private transfers through the hub
> + * device.
> + */
> +static int i3c_hub_master_priv_xfers(struct i3c_dev_desc *dev,
> +				     struct i3c_xfer *xfers,
> +				     int nxfers,
> +				     enum i3c_xfer_mode mode)
> +{
> +	struct i3c_master_controller *controller = i3c_dev_get_master(dev);
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_dev_desc *hub_dev;
> +	u8 hub_addr, target_addr;
> +	struct i3c_hub *hub;
> +	int ret;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	if (!hub->hub_dev)
> +		return -ENODEV;
> +
> +	hub_dev = hub->hub_dev->desc;
> +
> +	i3c_hub_enable_port(controller);
> +
> +	hub_addr = hub_dev->info.dyn_addr ?
> +		   hub_dev->info.dyn_addr : hub_dev->info.static_addr;
> +
> +	target_addr = dev->info.dyn_addr ?
> +		      dev->info.dyn_addr : dev->info.static_addr;
> +
> +	if (hub_addr != target_addr) {
> +		hub_dev->info.dyn_addr = target_addr;
> +		ret = i3c_master_reattach_i3c_dev(hub_dev, target_addr);
> +		if (ret)
> +			goto disable;
> +	}
> +
> +	ret = i3c_device_do_xfers(hub->hub_dev, xfers, nxfers, mode);
> +
> +	if (hub_addr != target_addr) {
> +		hub_dev->info.dyn_addr = hub_addr;
> +		ret |= i3c_master_reattach_i3c_dev(hub_dev, hub_addr);
> +	}
> +
> +disable:
> +	i3c_hub_disable_port(controller);
> +	return ret;
> +}
> +
> +static int i3c_hub_attach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	return 0;
> +}
> +
> +static void i3c_hub_detach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +}
> +
> +static int i3c_hub_i2c_xfers(struct i2c_dev_desc *dev,
> +			     struct i2c_msg *xfers, int nxfers)
> +{
> +	return 0;
> +}
> +
> +static int i3c_hub_master_do_daa(struct i3c_master_controller *controller)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_hub *hub;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	return i3c_hub_do_daa(hub, controller);
> +}
> +
> +static int i3c_hub_master_send_ccc_cmd(struct i3c_master_controller *controller,
> +				       struct i3c_ccc_cmd *cmd)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_hub *hub;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	if (!hub->parent)
> +		return -ENODEV;
> +
> +	if (cmd->id == I3C_CCC_RSTDAA(true))
> +		return 0;
> +
> +	return i3c_hub_send_ccc_cmd(hub, controller, cmd);
> +}
> +
> +static bool i3c_hub_master_supports_ccc_cmd(struct i3c_master_controller *controller,
> +					    const struct i3c_ccc_cmd *cmd)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_hub *hub;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return false;
> +
> +	hub = hub_controller->hub;
> +
> +	return i3c_hub_supports_ccc_cmd(hub, cmd);
> +}
> +
> +/**
> + * i3c_hub_request_ibi() - Request IBI through parent controller
> + * @desc: Target device descriptor
> + * @req: IBI setup
> + *
> + * Temporarily updates parent controller context to request IBI for a device
> + * connected through the hub.
> + */
> +static int i3c_hub_request_ibi(struct i3c_dev_desc *desc,
> +			       const struct i3c_ibi_setup *req)
> +{
> +	struct i3c_master_controller *controller = i3c_dev_get_master(desc);
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_master_controller *orig_parent;
> +	struct i3c_master_controller *parent;
> +	struct i3c_hub *hub;
> +	int ret;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	if (!hub->parent)
> +		return -ENODEV;
> +
> +	parent = hub->parent;
> +
> +	orig_parent = i3c_hub_update_desc_parent(&desc->common, parent);
> +
> +	ret = i3c_master_direct_attach_i3c_dev(parent, desc);
> +	if (ret) {
> +		i3c_hub_restore_desc_parent(&desc->common, orig_parent);
> +		return ret;
> +	}
> +
> +	mutex_unlock(&desc->ibi_lock);

why need unlock desc->ibi_lock firstly? If have to do that, need comments
because it is uncommon and try to avoid this kinds of situation.

Frank

