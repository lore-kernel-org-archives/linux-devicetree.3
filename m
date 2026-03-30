Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012064.outbound.protection.outlook.com [52.101.48.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A473806DC;
	Mon, 30 Mar 2026 05:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774848752; cv=fail; b=M9thYwSaLbfFUhSEz4aB9WlM3C2xmSzAVqE6rNEl4ujvvA+FNimxHL1+QTu0WJwDRe/yYL/qce6Y+Cs0dNBBuBMXmxKh7N02cTu1eEN5OtlpMSAco0dIOOp7OPuS0yImWSRSD5EdFY0PrMf1fuMh5iO6XzQZFmHklmqjNw3bxOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774848752; c=relaxed/simple;
	bh=WI89rIfI6Q9AyAGq8weTtscfBMWuOnUvRo1bUE137V8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gi+jyzYznBTCWAbKyv1kX1FOjKq/ulJPeWoo++1caB0WFWwaSVsMdbAvMJU4ErsqlzI4ucAq/HdjtG/Yp4TiQcUT5JVztBFpZM3r7lV/kLRWi9ZhH88Xt0AzDb7Exdb4NgC17B0FiSl4pc/sPICRnQFkYl8iGcWM5f56zVWn3Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KYI4Thiz; arc=fail smtp.client-ip=52.101.48.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KYI4Thiz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDsk+OiZ9GfmqVQ3nc6ekXMMiDZxS9sQ0kfx393sZlqQxpWXV4CtPtMQh2NM6W3AvCkYpG+D+dXSNviaQQ2hw4FblpWBl1YMEKHdZDB3kxAzehkDqlWA6vfYPJR2sXTBY8VMlpQQ5qR6sGKjGf6ptYDVD01Mj1pLqkGpVY2P3u9FBj6bKUNKvfACdBoXwyXoHPlUaHBqnlMtPMn6NDjD6lzjgXqSe7tv70Y7RTpn83qswsbDs7h/3rRG6fc+cW1J+PCMB0zqeaD9UVA/zRZrvIy4/QERhh3kjx1A7bT9SPha0zXQGrfm2+MmM11EDOa3lGX8MOIO81c9SLYFK2BvVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzEmhXdAudwDH2/koDKDaRzMNHbAwTROqXR2n7WCks0=;
 b=UrhTUtQS4ytuJrYjOb4t/Mt/DKshXEf1dD04U1FLM3pvLgJyeDpbL4mV8YXU2HZ8ti2jESUac7gXUUceL7djMJ8zUR3Ua3no87q+vTtEUQoh798BXAhLguXIKYeLN03x7TI3kueq8CgetiZ4a4uGJM6+9CZ/pkp+Gw99VLd9q/376UFBwNxoz/INjHqvqMhfOqAKZ+/yfDn/1Qkfk9CTbD9iWta0NurbDrny9cYD6sUMDLaR0AMRU1+DXlVa1B4F1MelpyFcw/df676mHP1gBCFzfFcTMXU081Pmku/sJyyb4D7XF4sHUMpiv1OpuRAY7Kc5J8ipvAiK1t8Il+CsMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzEmhXdAudwDH2/koDKDaRzMNHbAwTROqXR2n7WCks0=;
 b=KYI4ThizI1ZYMSviJnLOYH/JtNkBtQJ3s0e0hpVxrDXYQUEpy8JZJ5umZhx6PIUiVuFLHnMny/xNUHNpnDqv/zKO5OnD0PDU30cZRjQhg4brs7TUqST80iYLne/9pkcC45KQS6l+Hq5f/UIXNzfOsj5DLl/Cezi77VpYWpXes9s=
Received: from PH8P220CA0032.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::10)
 by MN2PR10MB4366.namprd10.prod.outlook.com (2603:10b6:208:1dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 05:32:27 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:348:cafe::8c) by PH8P220CA0032.outlook.office365.com
 (2603:10b6:510:348::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 05:32:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 05:32:26 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 00:32:15 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 00:32:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 30 Mar 2026 00:32:14 -0500
Received: from [172.24.233.12] (uda1253387.dhcp.ti.com [172.24.233.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62U5WC6C3858068;
	Mon, 30 Mar 2026 00:32:12 -0500
Message-ID: <5ba0d92e-7f2f-423a-8d1c-561c350c1db3@ti.com>
Date: Mon, 30 Mar 2026 11:02:11 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC uL PATCH 2/2] mux-controller: ti: add driver for event mux
 router
To: <peda@axentia.se>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <vigneshr@ti.com>,
	<linux-kernel@vger.kernel.org>, <gregkh@linuxfoundation.org>
References: <20260313060437.3704592-1-r-sharma3@ti.com>
 <20260313060437.3704592-3-r-sharma3@ti.com>
Content-Language: en-US
From: rahul sharma <r-sharma3@ti.com>
In-Reply-To: <20260313060437.3704592-3-r-sharma3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|MN2PR10MB4366:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c70e69-30c6-45f6-8f4f-08de8e1dba89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QGq7YkxcdTZRlEJXrlvLHBDAbiTCYsBzcJOQlkVKT/ZE9pkVD2RFLIo+Q/CyCgEUVOR7egGhA0L5fHxhEA/W9vnNS7jLtHT8yqV5qoSC7EQCC5H1utno3H8nfu0f8V18uApq15A4gDO/MSnJpy46m4+LuelNrHl1LtzX9/otMKSv5VHtaVFMANXC8PVmcZlMEKo2gYvVLR5GqIOSdIKmCz/OAJkH4h8fYQVYhp2dai1iJg3MO8mugTW/Am5anGPC3HxyyLzWvM+ByyfdL7C6VjXdREzpdthqJytFOl6pVmKbEa/9LyTuVE+mwyBd5LqDMNDD20rcM6HWTqURa90MiHQX9dYZ2LVF8lr5S0pVBV49d6zEzMLabeNS4gbU0PVuFLqnOiPYi1M4TIpEGZgQzrB37m3PUZWF/k6crgYF59fcat2XYjG5BP0wmoFDe2CkDgLOhtFo3EtK5bg6RelIWt/CZIrtvwqrIvrQSz9ZzumxGjtA27/98GyMS/sjiMcfertpbJ61O3FVaSsAobueaHQigz+kRvefev1WH+1TFV3j+HBsrXDz8F7+lnzWMMst6+Mnt1+NrVnZXWvQrRLV8fYZapabYNIEzJ9+2ksR1sQEAHUF7x4SXncRilI60uQ7UUyq7Skno+TODCm9gAMboj347MN3RyRvx3yj/w3ayxbMfSQKL2+4/tc/xxrnqBemLAo04afRR4y81Z8bkKyiEQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FcGGwlD0WC2CzwWBIfO+wDcBBPTyBLo5syVUo9iDP6ALfQKn9nx3UwdR4iRPEfjNm/LQcdDLAQTL9ARu6aWd8YhRYrPnDwW6FEcQpowQapORNh6U/iRmsY0jzzx5X7NRm0bkao5kVnWgaRCDwT0RRYlcJ4mIfaGRdlxqKDcKeJdvLM8E9UA5PUHEyumqrlFVL8bVA6lVkXZUp5i+BBqKzjqHRyFueCR0DGRTbH07eI6XENbo+zM/J9xLhdqAUPMyia50z1gIGuR7kFZ2eUjG4uvObgiDRI5eKe5/J4sPwAFstMlDSwNvYAhTkLjlWlGE5DODs1+iktqOmD7htRRwR1g+QMkxAUTrS9KbaIiVzj7znUf0UBbxjkL43dketpu++0z6HheIm6Hr1YiTZZU5RUzPfKD4moYSf3M4bJGkBpPNZudfJfy7PeX0+b9zlhRJ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 05:32:26.7143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c70e69-30c6-45f6-8f4f-08de8e1dba89
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4366

CC: Greg Kroah-Hartman

Hi Greg,

Could you please review this patch(2nd one in the series). It seems 
Peter is not online for almost a month.

BR,
Rahul

On 13/03/26 11:34, Rahul Sharma wrote:
> The driver supports event muxing routers like gpio mux router and timesync
> router. This driver is adaptation of original reg-mux driver, along with
> changes specific to support TI's mux router.
> 
> The idle states this driver supports are only 2 which active(represented
> by 1 in dt-node) and in-active(represented by 0 in dt-node).
> 
> Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
> ---
>   drivers/mux/Kconfig           |  15 +++
>   drivers/mux/Makefile          |   2 +
>   drivers/mux/ti-k3-event-mux.c | 235 ++++++++++++++++++++++++++++++++++
>   3 files changed, 252 insertions(+)
>   create mode 100644 drivers/mux/ti-k3-event-mux.c
> 
> diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
> index c68132e38138..ad3af2724d28 100644
> --- a/drivers/mux/Kconfig
> +++ b/drivers/mux/Kconfig
> @@ -59,4 +59,19 @@ config MUX_MMIO
>   	  To compile the driver as a module, choose M here: the module will
>   	  be called mux-mmio.
>   
> +config MUX_TI_K3_EVENT_ROUTER
> +	tristate "TI Event Mux Router using MMIO registers"
> +	depends on OF && (REGMAP_MMIO || COMPILE_TEST)
> +	help
> +	  This is extension of MMIO mux for  timesync router and gpiomux
> +	  routers on TI K3 SoCs. This driver supports the 3-field format for
> +	  mux control: <register-offset mask value>.
> +
> +	  The driver allows configuration of hardware mux routers using
> +	  memory-mapped registers. It's based on the mmio-mux driver but
> +	  supports the extended 3-field format for more precise control.
> +
> +	  To compile the driver as a module, choose M here: the module will
> +	  be called mux-ti-k3-event.
> +
>   endmenu
> diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
> index 6e9fa47daf56..f3f367de84da 100644
> --- a/drivers/mux/Makefile
> +++ b/drivers/mux/Makefile
> @@ -8,9 +8,11 @@ mux-adg792a-objs		:= adg792a.o
>   mux-adgs1408-objs		:= adgs1408.o
>   mux-gpio-objs			:= gpio.o
>   mux-mmio-objs			:= mmio.o
> +mux-ti-k3-event-objs		:= ti-k3-event-mux.o
>   
>   obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
>   obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
>   obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
>   obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
>   obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
> +obj-$(CONFIG_MUX_TI_K3_EVENT_ROUTER)	+= mux-ti-k3-event.o
> diff --git a/drivers/mux/ti-k3-event-mux.c b/drivers/mux/ti-k3-event-mux.c
> new file mode 100644
> index 000000000000..2469500d1b48
> --- /dev/null
> +++ b/drivers/mux/ti-k3-event-mux.c
> @@ -0,0 +1,235 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * MMIO register bit-field controlled multiplexer driver
> + *
> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com
> + *
> + * Based on drivers/mux/mmio.c by Philipp Zabel <kernel@pengutronix.de>
> + * Modified to support 3-field format: reg-offset, mask & value
> + *
> + * Author: Rahul Sharma <r-sharma3@ti.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/mux/driver.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +#define MUX_ENABLE_INTR BIT(16)
> +
> +struct mux_ti_k3_event {
> +	struct regmap *regmap;
> +	u32 reg;
> +	u32 mask;
> +	u32 value;
> +};
> +
> +struct mux_ti_k3_event_chip {
> +	struct mux_chip *mux_chip;
> +	struct mux_ti_k3_event *fields;
> +	int num_fields;
> +	u32 *saved_states;
> +};
> +
> +static int mux_ti_k3_event_suspend(struct device *dev)
> +{
> +	struct mux_ti_k3_event_chip *chip = dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	if (!chip->saved_states) {
> +		chip->saved_states = devm_kcalloc(dev, chip->num_fields,
> +						  sizeof(u32), GFP_KERNEL);
> +		if (!chip->saved_states)
> +			return -ENOMEM;
> +	}
> +
> +	for (i = 0; i < chip->num_fields; i++) {
> +		struct mux_ti_k3_event *field = &chip->fields[i];
> +
> +		ret = regmap_read(field->regmap, field->reg,
> +				  &chip->saved_states[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mux_ti_k3_event_resume(struct device *dev)
> +{
> +	struct mux_ti_k3_event_chip *chip = dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	if (!chip->saved_states)
> +		return 0;
> +
> +	for (i = 0; i < chip->num_fields; i++) {
> +		struct mux_ti_k3_event *field = &chip->fields[i];
> +
> +		ret = regmap_write(field->regmap, field->reg,
> +				   chip->saved_states[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(mux_ti_k3_event_pm_ops,
> +				mux_ti_k3_event_suspend,
> +				mux_ti_k3_event_resume);
> +
> +/*
> + * State behavior:
> + * - state 0: Clears the mask bits in the target register (inactive state)
> + * - state 1: Sets both the value bits and enable bit (bit 16) in the register
> + */
> +static int mux_ti_k3_event_set(struct mux_control *mux, int state)
> +{
> +	struct mux_ti_k3_event *fields = mux_chip_priv(mux->chip);
> +	struct mux_ti_k3_event *field = &fields[mux_control_get_index(mux)];
> +
> +	if (!state)
> +		return regmap_update_bits(field->regmap, field->reg, field->mask, 0);
> +
> +	return regmap_update_bits(field->regmap, field->reg, field->mask | MUX_ENABLE_INTR,
> +		field->value | MUX_ENABLE_INTR);
> +}
> +
> +static const struct mux_control_ops mux_ti_k3_event_ops = {
> +	.set = mux_ti_k3_event_set,
> +};
> +
> +static const struct regmap_config mux_ti_k3_event_regmap_cfg = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +static int mux_ti_k3_event_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct mux_ti_k3_event_chip *chip;
> +	struct mux_ti_k3_event *fields;
> +	struct mux_chip *mux_chip;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	int num_fields;
> +	int ret;
> +	int i;
> +
> +	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base)) {
> +		return dev_err_probe(dev, -ENODEV,
> +				     "failed to get base address\n");
> +	} else {
> +		regmap = devm_regmap_init_mmio(dev, base, &mux_ti_k3_event_regmap_cfg);
> +	}
> +	if (IS_ERR(regmap)) {
> +		iounmap(base);
> +		return dev_err_probe(dev, PTR_ERR(regmap),
> +				     "failed to get regmap\n");
> +	}
> +
> +	ret = of_property_count_u32_elems(np, "ti,reg-mask-val");
> +	if (!ret || ret % 3) {
> +		ret = -EINVAL;
> +		dev_err(dev, "ti,reg-mask-val property missing or invalid: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	num_fields = ret / 3;
> +	mux_chip = devm_mux_chip_alloc(dev, num_fields, num_fields *
> +				       sizeof(*fields));
> +	if (IS_ERR(mux_chip))
> +		return PTR_ERR(mux_chip);
> +
> +	fields = mux_chip_priv(mux_chip);
> +	chip->mux_chip = mux_chip;
> +	chip->fields = fields;
> +	chip->num_fields = num_fields;
> +
> +	platform_set_drvdata(pdev, chip);
> +
> +	for (i = 0; i < num_fields; i++) {
> +		struct mux_control *mux = &mux_chip->mux[i];
> +		s32 idle_state = MUX_IDLE_AS_IS;
> +		u32 reg, mask, value;
> +
> +		ret = of_property_read_u32_index(np, "ti,reg-mask-val",
> +						 3 * i, &reg);
> +		if (!ret)
> +			ret = of_property_read_u32_index(np, "ti,reg-mask-val",
> +							 3 * i + 1, &mask);
> +		if (!ret)
> +			ret = of_property_read_u32_index(np, "ti,reg-mask-val",
> +							 3 * i + 2, &value);
> +		if (ret < 0) {
> +			dev_err(dev, "field %d: failed to read ti,reg-mask-val property: %d\n",
> +				i, ret);
> +			return ret;
> +		}
> +
> +		/* Validate that value bits are within mask */
> +		if (value & ~mask) {
> +			dev_err(dev, "field %d: value 0x%x has bits outside mask 0x%x\n",
> +				i, value, mask);
> +			return -EINVAL;
> +		}
> +
> +		fields[i].regmap = regmap;
> +		fields[i].reg = reg;
> +		fields[i].mask = mask;
> +		fields[i].value = value;
> +
> +		/* This driver supports binary mux (2 states: 0 and active) */
> +		mux->states = 2;
> +
> +		of_property_read_u32_index(np, "idle-states", i,
> +					   (u32 *)&idle_state);
> +		if (idle_state != MUX_IDLE_AS_IS) {
> +			if (idle_state < 0 || idle_state >= mux->states) {
> +				dev_err(dev, "field: %d: out of range idle state %d\n",
> +					i, idle_state);
> +				return -EINVAL;
> +			}
> +
> +			mux->idle_state = idle_state;
> +		}
> +	}
> +
> +	mux_chip->ops = &mux_ti_k3_event_ops;
> +
> +	return devm_mux_chip_register(dev, mux_chip);
> +}
> +
> +static const struct of_device_id mux_ti_k3_event_dt_ids[] = {
> +	{ .compatible = "ti,am62l-event-mux-router", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, mux_ti_k3_event_dt_ids);
> +
> +static struct platform_driver mux_ti_k3_event_driver = {
> +	.driver = {
> +		.name = "ti-k3-event-mux",
> +		.of_match_table	= mux_ti_k3_event_dt_ids,
> +		.pm = &mux_ti_k3_event_pm_ops,
> +	},
> +	.probe = mux_ti_k3_event_probe,
> +};
> +module_platform_driver(mux_ti_k3_event_driver);
> +
> +MODULE_DESCRIPTION("TI K3 Bit-field Controlled Event Multiplexer driver");
> +MODULE_AUTHOR("Rahul Sharma <r-sharma3@ti.com>");
> +MODULE_LICENSE("GPL");

