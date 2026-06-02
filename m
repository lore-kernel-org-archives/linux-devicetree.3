Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013036.outbound.protection.outlook.com [52.101.72.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF23B3803F5;
	Tue,  2 Jun 2026 17:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780420621; cv=fail; b=ZC5+6ebGwm/Wx9GN0oyjCd3EKvVrTf2E3zCaY3WVCtZcQJqjjfq6Iv6t7baBBPywwY4ojXv4lUnB/q0wJbIF6q6k9C4apzC8XinSOMKuAG0UxJI+bYB5jDuW7uwk4ASHvhS+ShegD+1x8RQ0q24mkIryfCpGp5eKtuQpH1DyBL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780420621; c=relaxed/simple;
	bh=UDAuv3ffUGkCXbW0fLASFYKcj1zCVAmyxdJ13zvcRhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RcCcQwbRYsGoNjalMbo58fwO7oMNeLDiyGzBlD5l3z80I9DlTU/YCk6H437wHL1bU9OAGoVwwnNO+fSy4BdiLjBU1A36QgdCP4+64qEDTsdmdMrD6TP/C6QsdHx2qkK+k2G0Rs6UW8xeOoRzInnplHKR0b93Q230XuGeCVWJmVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=amnSI92o; arc=fail smtp.client-ip=52.101.72.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="amnSI92o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWT+FxPgMlgjPTY/C/SuznP6FPL7LiaWkfGKlUywVa86QspYddkoTO+hTeY48moghDPXHOd7vKtJ/J9PJ2pHQ9sZEnI2WSE4NhOTUa12kZ4AToHOc9416HK0e+RhA5BOabHuRjq77vQxKd2DFQWzEAUjCJUKblPQASJScb3l5Pf84ZHyl3Nmy7xE4mxh/cM9amu7vE4b8N2t5u4jb36u1Z0FMcws+INdsD2SHkmmiNJzL/Dz0wM8Y98V5IFA7Mfn4C+6p1+k9U8vqyNGB4Kf0simCR3lEHe7PWg3XYRgOewNbQvNVm/TO8sKQ6ukH3PO50zkotETlreayY7RAXBtKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBIqU27PgwAhLDGzvbH8276m0HCE76J7ij4u/Nh/v7E=;
 b=u74NveCw/ecBSy8aXhmRC0766Aqb3o+C7P4OgILVsyrQ4Y94iubfkUNWb1hUiyFHBZDlloSKJ9lfpK82P98HNMzNxqbaX2gJIf8Hdsb0c2EEuMGRAIF4ODHFd/UtlseF+JV8UHznzVFke+TXWHW7ZLSOyAhWYnIY2LbCuCOSwQ5TVAwEuQa8buvmxtMmjVFMsMD7GrK0SHp+kNW17e6VChKwl8Rzks10A+AOI2EQI7OaAdvL8hCnxwx8awDkPuAWnOn7MwpcTn4zJ2jJq+Dmq79D6/ZgRpMySSyOuJbvsJIIIwUFS0rVWxbpvz2+fFS9O8b4fbngDAAv8DJpoRUUMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBIqU27PgwAhLDGzvbH8276m0HCE76J7ij4u/Nh/v7E=;
 b=amnSI92o1NZNsn6jF+1Qb669b6TgwuBVLE++lO36mBelKQ64GqDfMhDxtX0OOa2Yenjs2Crw0ug9RoeeBhtCt7F8r6S0vfXmSGC0bVP0HZSY99mLd+Wfcu2WMCW5Kw0hFPQ9lgVctBZfy8CmBXLAO7ookCS5a8VHvfxXOVLHA+fHahSdXkA/Ja3H1LqJVyYk/4PUfjC09f8YZzW6POjJnoCMIXykqyoozeQFlOQvs8NoF6VS6lneBiQn3LRIiIs5EZeAsCmLVjfSekbQssNUqBeJ+K1tkr8oJ1zYNNe7/rOfJZxqUUh8fCD4q1UGvk/Dskiqs6bNteNzOQ9jT8SjGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB8550.eurprd04.prod.outlook.com (2603:10a6:10:2d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 17:16:57 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 17:16:56 +0000
Date: Tue, 2 Jun 2026 13:16:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v10 2/9] i3c: master: Expose the APIs to support I3C hub
Message-ID: <ah8QAWLFa6iflHiE@lizhi-Precision-Tower-5810>
References: <20260525064209.2263045-1-lakshay.piplani@nxp.com>
 <20260525064209.2263045-3-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525064209.2263045-3-lakshay.piplani@nxp.com>
X-ClientProxiedBy: SA1PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc09b73-278e-4eb4-4128-08dec0cabfb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|19092799006|366016|38350700014|22082099003|18002099003|4143699003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	Gz4qHqzQD+esPrG3pPnGP4wTaFi71m7ItONK13MQQLe3gtibQzX/BVLzoR29ithda6yZb8mMal1GWCXy4rBINHIjQz5/Whgc7cU/c3Tk91rYw3yEZinsPc8nb34TrM8zTtKzAFywMMM/S68CIXgduOyz39XFSAOgUt9fW7B8jI4qFD5DWoFLtiZbbsmGl8MtRyyEn/JrxDCgyP0qkPRVDZgXwlhpyVGpvK5k8HmNrJqdcugBZftfJKEe7SeBT47WeShIN8aV7Sd8HpW8jscg/ppFpwa1uQ91rz3GS6dYA9x9s+1DWWTxVm26oYjpWZJYNheh5Y0EAziBiZiYQlgPMlybnLsxEqon1MvpyLRF0QGRy1EnQn5jYlV28rT4wg09/sy2tS6CmABognQdNLrHSY7SNK37cPzJxWQm/n7FdnCnPoHt0bMBEkhdy1b6ywikK9v/X0cNHd6SF6sKYwh3a+in5f1XICn6iRVu2Dg5uM7dv0P9y3iVCd4AsLQpsP0vydYlh1WN0591cmGxgIfOlfQjsMWVvuVb9sA9RJMPTM8yJf32dfxjn5qQQYknMEhClphxF6AnRiyNAg6iSGYLXUZ17RYTgSM4XB9ps+2UbWB98HFf7Y3hXdGujiza6I+Eafm2XjnJRWsn+CebjTthTlvOea8v1+ZUdmlwR2rv/kFUPSq2AYcntGXvHLbO/fQQfCayqhsA8IR7lTSIjP/3/aBx/PKTLS7q8Ry7bkNydv+xbpRBGJ2Ov0Ih8lnadEsB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(19092799006)(366016)(38350700014)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nwwVJKGA+85CVATqSkwqznUDlh9phLlKSPNgAuysp2TsuI1R2VQW2he5rjhu?=
 =?us-ascii?Q?qACPzGV89Uo3jIxdu1Xqkm+UV2SS4OeSsYOFshklDiA4rHPeZN8JBITLfgO6?=
 =?us-ascii?Q?paFgD28kFUmT/FSf77zhy26KPDEGvmO/LjlZRGsrsGQGULWDUChMhREUt4Lo?=
 =?us-ascii?Q?7DGFQU0Qy5gaalp21TYQt0reayhIyXKOwngO/T1tmrFq5iYhvqb2Z0pbr/Ea?=
 =?us-ascii?Q?o6gIxBjPPnUA8ihnx/XjVbAuF2xgLH5X+GiKkVtDlcNZDWbTyv0+BwhJHuSt?=
 =?us-ascii?Q?CTMuhzJ+tuAnhzSR/8oryDQiQz38jCpyv//w1Q+d3/wYcq57YBCkQzKUHJMr?=
 =?us-ascii?Q?MTXiYRBNw+k3Qh2M6F6E+goxC49pad8av+CxnzbTTTmkPgO2RQfPS2YW1HMq?=
 =?us-ascii?Q?qCFewMFCSi2M5ucT6PGwMrJc3FAVIcrTRG07+8/2Wf4/X1g/ZVf8L1hPPwfr?=
 =?us-ascii?Q?QjjHa2G+2mNalsz6s3R55PnQB/sEQo3WB2d+YCAj6PvPup+SBUPMqq7w/xWN?=
 =?us-ascii?Q?0uCR1UEJbt9MsFi2lgPqjCPezuX5gCapenW1k+uYKEHovaT+I75COeasU6pp?=
 =?us-ascii?Q?Vpl/6Vz2rTRHKZrtH5iOO9uxoNWjpz5qYzD7ZYHsJoal6utPWaykk8rnc4Tp?=
 =?us-ascii?Q?j/L3gVEC+XYZRT5DSgPVlpu5sUXtECp/WTD6BKjACKD2NRFCJzWseg3mtosN?=
 =?us-ascii?Q?8OWwCNKoeX3RVDGkoAF30Z4iWUxylN9KTTjfep7O8WBQKJ9ospk/XTiWHAy8?=
 =?us-ascii?Q?iHdJ+bozElxbIrdRjDA3YZ7UEYr0xmcRj59qalfPZ/zHI7NuVjUdGSrG0sP8?=
 =?us-ascii?Q?7WTvRGBw6OFOApF6yKYRciR8FGdbRZx3iAlV8rKm/gQru9netzooJnIAvhu3?=
 =?us-ascii?Q?HEZzpouFTiqZptIqS1KQc9w4VxSM4Kp0ur5Y9HHscx8cTOjdrUFBS/UK7LRs?=
 =?us-ascii?Q?bHqbiiJi52prcJGkRuhQtBFdHpCzQN7SW3m7Vj+irP3JOO23SeqU4Gq0ZTxS?=
 =?us-ascii?Q?QLsvnReOpwyXg/VTj/JW6RxlF5PruGh0Dvocm1DjsEQ7w4yZ+rFffEvjCik0?=
 =?us-ascii?Q?jcpXbF1m84Pip+IgFHmQBUhJhRA+fsZQZFQ/rzS+N5Z9gq7gJnNHDU7uwS7p?=
 =?us-ascii?Q?tQQ3jEWxwYH+VDDohGhFb6CuDzX5FLDQfRzm+3lZG4QJn/hXragNgLcvghnU?=
 =?us-ascii?Q?F8azhShomXOx7IIp6hGdFB1Rj1ZpMLgImeby5mrr2leL52AN03U0X4AdvHwH?=
 =?us-ascii?Q?qmsp2RX2eIuYkQe9hgTWi1AWUP5BNhW6jpOl7+yXnZaImSaMAtAtH3DOQIHa?=
 =?us-ascii?Q?+iwolfI2r4tHPqtKo8yLJofZHNB4+GKc/60FjyMHc6oyy3LYXLUcsDXkyq2p?=
 =?us-ascii?Q?1bnR2BCckyT2puQpmllNGu59K5PWVezq37TDggUkrZVH0QxbYUKp1awzopQi?=
 =?us-ascii?Q?14KkgwirNbG9CwpBXnrZwNaqAuNd+14RM5nTBN0ohS7UiRvqbkyM8gVF0Iem?=
 =?us-ascii?Q?5zIGtMLiP/LYnR4YzqkeexsPdPzwOAUNIO/UzXbOWsPpn+kLhPcsTxcsF5T0?=
 =?us-ascii?Q?nxYYjAO7UgRR8xy2Zcdd67SmGoT8cwBBi3Dfwp+SkFwoNHSF651FitriN3Sk?=
 =?us-ascii?Q?qvN+ViJ3hnJBCeBtNKxeJf/U+XHsWt8JtUQCefTUMQU6anucuNa2acfrXGsS?=
 =?us-ascii?Q?71eA8ITNIWD1dQB3FBaoPW7FIVsC2qvuVaB90tfd+3xHmH9g?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc09b73-278e-4eb4-4128-08dec0cabfb9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 17:16:56.7584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJlaU4OGaimWa+tNfMJqUC76kS95NXYBGiDQZeEdhCAa5kGIqBAs+Kggp9S6zPoJL8vEUwszj9fHVnsTtjk7rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8550

On Mon, May 25, 2026 at 12:12:02PM +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> Change the below internal static functions to APIs to allow new I3C hub
> driver to use them
>
> 1) i3c_dev_enable_ibi_locked()
> 2) i3c_dev_disable_ibi_locked()
> 3) i3c_dev_request_ibi_locked()
> 4) i3c_dev_free_ibi_locked()
> 5) i3c_master_reattach_i3c_dev_locked()
>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> ---
> Changes in v10:
>  - Expose the renamed reattach API.
>
> Changes in v9:
>  - No change
>
> Changes in v8:
>  - No change
>
> Changes in v7:
>  - Fix kernel-doc warnings for *_locked() APIs
>  - Clarify API exposure in commit message
>
> Changes in v6:
>  - Split the patch into two parts:
>         1) expose the existing API
>         2) add new APIs.
>
> Changes in v5:
>  - No change
>
> Changes in v4:
>  - Updated I3C master to handle hub support
> ---
> ---
>  drivers/i3c/master.c       | 70 ++++++++++++++++++++++++++++++++++++--
>  include/linux/i3c/master.h |  2 ++
>  2 files changed, 70 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index e89d73508b9a..0636e3e21758 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1652,8 +1652,23 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
>  	return 0;
>  }
>
> -static int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
> -					      u8 old_dyn_addr)
> +/**
> + * i3c_master_reattach_i3c_dev_locked() - reattach an I3C device with a new address
> + * @dev: I3C device descriptor to reattach
> + * @old_dyn_addr: previous dynamic address of the device
> + *
> + * This function reattaches an existing I3C device to the bus when its dynamic
> + * address has changed. It updates the bus address slot status accordingly:
> + * - Marks the new dynamic address as occupied by an I3C device.
> + * - Frees the old dynamic address slot if applicable.
> + *
> + * This function must be called with the bus lock held in write mode.
> + *
> + * Return: 0 on success, or a negative error code if reattachment fails
> + *         (e.g. -EBUSY if the new address slot is not free).
> + */
> +int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
> +				       u8 old_dyn_addr)
>  {
>  	struct i3c_master_controller *master = i3c_dev_get_master(dev);
>  	int ret;
> @@ -1677,6 +1692,7 @@ static int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
>
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(i3c_master_reattach_i3c_dev_locked);
>
>  static void i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
>  {
> @@ -3195,6 +3211,16 @@ int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev, struct i3c_xfer *xfers,
>  	return master->ops->i3c_xfers(dev, xfers, nxfers, mode);
>  }
>
> +/**
> + * i3c_dev_disable_ibi_locked() - Disable IBIs coming from a specific device
> + * @dev: device on which IBIs should be disabled
> + *
> + * This function disable IBIs coming from a specific device and wait for
> + * all pending IBIs to be processed.
> + *
> + * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
> + * Return: 0 in case of success, a negative error core otherwise.
> + */
>  int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
>  {
>  	struct i3c_master_controller *master;
> @@ -3216,7 +3242,22 @@ int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
>
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(i3c_dev_disable_ibi_locked);
>
> +/**
> + * i3c_dev_enable_ibi_locked() - Enable IBIs from a specific device (lock held)
> + * @dev: device on which IBIs should be enabled
> + *
> + * This function enable IBIs coming from a specific device and wait for
> + * all pending IBIs to be processed. This should be called on a device
> + * where i3c_device_request_ibi() has succeeded.
> + *
> + * Note that IBIs from this device might be received before this function
> + * returns to its caller.
> + *
> + * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
> + * Return: 0 on success, or a negative error code on failure.
> + */
>  int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev)
>  {
>  	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> @@ -3231,7 +3272,20 @@ int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev)
>
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(i3c_dev_enable_ibi_locked);
>
> +/**
> + * i3c_dev_request_ibi_locked() - Request an IBI
> + * @dev: device for which we should enable IBIs
> + * @req: setup requested for this IBI
> + *
> + * This function is responsible for pre-allocating all resources needed to
> + * process IBIs coming from @dev. When this function returns, the IBI is not
> + * enabled until i3c_device_enable_ibi() is called.
> + *
> + * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
> + * Return: 0 in case of success, a negative error core otherwise.
> + */
>  int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
>  			       const struct i3c_ibi_setup *req)
>  {
> @@ -3270,7 +3324,18 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
>
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(i3c_dev_request_ibi_locked);
>
> +/**
> + * i3c_dev_free_ibi_locked() - Free all resources needed for IBI handling
> + * @dev: device on which you want to release IBI resources
> + *
> + * This function is responsible for de-allocating resources previously
> + * allocated by i3c_device_request_ibi(). It should be called after disabling
> + * IBIs with i3c_device_disable_ibi().
> + *
> + * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
> + */
>  void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
>  {
>  	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> @@ -3301,6 +3366,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
>  	kfree(dev->ibi);
>  	dev->ibi = NULL;
>  }
> +EXPORT_SYMBOL_GPL(i3c_dev_free_ibi_locked);
>
>  static int __init i3c_init(void)
>  {
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 592b646f6134..355e9b3d9ae3 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -613,6 +613,8 @@ void i3c_master_dma_unmap_single(struct i3c_dma *dma_xfer);
>  DEFINE_FREE(i3c_master_dma_unmap_single, void *,
>  	    if (_T) i3c_master_dma_unmap_single(_T))
>
> +int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
> +				       u8 old_dyn_addr);
>  int i3c_master_set_info(struct i3c_master_controller *master,
>  			const struct i3c_device_info *info);
>
> --
> 2.25.1
>
