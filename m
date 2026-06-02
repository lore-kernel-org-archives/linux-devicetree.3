Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010062.outbound.protection.outlook.com [52.101.69.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D8937F8BA;
	Tue,  2 Jun 2026 17:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780420467; cv=fail; b=F4iEB5FPsbwxbf4tz9EWOwNylmm6BTh3jmlWBSQ/2zd3YXzIoyvWMM9JQx3ZBAn061CAmK/P82+k7U+4ktfhWgUOWw4NQFgDua3LLG1fjIQIAySdujjXePhHnbi+z33gnjKY1HfmAViK8Er57XGXT8O9nobeJdwh+rdsi7vyAAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780420467; c=relaxed/simple;
	bh=uxCwej7KipXDB2bH+Cjdn8CxCi5febDmoITreNIc9hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CFlubbQCrARjjxYTvZhy+kL5RtBI2c7Las/ueUpT3ZKm9ehZBSDqFXLghIhZxldoSIwdzM0Ssd0G9xALo7Qt5L/2bygbIobgroUoUX6tDFHIQaQ2GBwcpX/eEKz8BUIll+XJbrxgpjJys30ApxPV/zevbavRynJXEMJY8b/RuSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Vdio1ULj; arc=fail smtp.client-ip=52.101.69.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Vdio1ULj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWF9HYdSWuBdlDONBz5fGMYZax75IqPCvBFqNKWhTAjTUhoxa1xHg4qWriQzt6cKkyRkJ8Im8yea2FCMXa8RxDUttNdyzqBvle1FTEbTg9SkJSbSbXFte4HtUwFhmHoNrIPmlxuUBi+UNAHKYrY29tVFTxd9q55nnt8Dj7TLIh9+vIOcWFCA5sFuXanF35itqwgnH2WQ/MHhUpmY9dWbYYvD3KQ00MeNMuKOYjGqZ/dvCws7KMLdUNNFm2N37dAwplL8OJt19JBfLOO/t0o94q2KSh+fdhsNg/Kajm+szNTtv+bOnUo/XyjVHe8NQIf8rSqa6Gn6Na/DYmhgTcrHtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=un4Hewj3XJdwZJ9Qwmzrhgj0wPf12Agv6hTRHKTC9dI=;
 b=Kl+n2I+HVT72akDQrk8PdHtIwKEK8vW0n1lGypXUax8Z/ZkSbF7RqXEodbm7qBaRzbu2uxUMAKyC+/dtbCPI614W5UgjjpqAzaGeS3PBcqnzJyaDCjHLkKctmJjHKfjTQrt2zuJSe9HNLPO5TJ/6oqXHWq22HSprlgGzqNxYrPWqcZ46dUByPe4fqwVQCYlWZKfnU5Zz1BZvYEJwKhR4KYeE2qn3hkVZyITtPiknbK86QxHatYLQ/j6z4oOebb5rXH4C5pAXb7Qw46124EEAHMklSs56Fz4jolcW2aqKp67S3rohd74SO7eYbF3kh4owtpkix9S+xhPIEHQbQZXvFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=un4Hewj3XJdwZJ9Qwmzrhgj0wPf12Agv6hTRHKTC9dI=;
 b=Vdio1ULjgDRb+hcRqMA6SjSAAPWLpjletV5lExUVzguahrH6gbFIbg2snogdH5e2EpnVoVTFBBIdLNHwE/gnw9J3134OL1DqyfvoC7GEOzTCe+91cUs6JXojwkbKNdq2zmIGKh2pF3raA+voK3SBFO0eEPxmouQkUUIwcX7lxrDwSUWbiFFHSw0eL7tFjEu0pLEAfTks48kXWmt9vX4jsQg0xaoOA6hfTYQ6WNZ/atqgbKc9QiEyV5+23+4gQZY3vJYbHJFiTQizngOyRpA6ys9JlkL9cUq6T6lmFrbbGfoMKxg1gy5kP3KLkArsDXcj5km8Fqy/2mIJJI6hxqT8AA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB8550.eurprd04.prod.outlook.com (2603:10a6:10:2d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 17:14:23 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 17:14:20 +0000
Date: Tue, 2 Jun 2026 13:14:14 -0400
From: Frank Li <Frank.li@nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v10 1/9] i3c: master: rename
 i3c_master_reattach_i3c_dev() to *_locked
Message-ID: <ah8PZrLTkgLGF3XT@lizhi-Precision-Tower-5810>
References: <20260525064209.2263045-1-lakshay.piplani@nxp.com>
 <20260525064209.2263045-2-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525064209.2263045-2-lakshay.piplani@nxp.com>
X-ClientProxiedBy: SN6PR16CA0049.namprd16.prod.outlook.com
 (2603:10b6:805:ca::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: 186aa2e8-c0cc-471e-ac48-08dec0ca62cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|19092799006|366016|38350700014|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	/rO0gcutvxpBdOdyC4MMIkOSThCFwxXBSD/5xMWpqDjuWTuexIJO+dNMiJbSWT5MsQ54oE8dbVoW/jWjG+whkjLFvlqVNkes301NYft71EC3CNFLZZlZ2Ijkn183w9T6PJriAoWu1O6qx7HiwUit1kxrUChyiBi1tFtiDCKEkalfv6bpRUBCqGywPKf3gNwMyICVa+5ofyzjRWz0Y/ni9+dX3ZOlbiAvTHS/1j8aneZ9VYSzurR8eVOV6iWJOjpmYrv19Ze5xNJFeWDsWAkMVj061h2qzZtBJ/Bf872nfJAe4KqYU/0r8zH2SqB9/cHfTYPavwKYCfgDOMuQaRBLukVDymrmHpT8dDjxRfTCg8zm9NdARYl/0ipRXL9ytkqeiRBm2sU91BPAbi7BixAozIGUmju3J/4GSrH18b6EI02HhnXAj8v2j1ll7abDgPB1rVofu9IEulbpY5gXU/YHrS8wObn5EECo9PPwNnOUz7C9PKoQ4B81shZEjsHOM2/0TG0uDLyJGRPgw4l2BtM2OFFyS4Q1K+K2WEtf1z55MUjOKyZQ8LVD2obAJ5Z+LgUE4bm+zf+8QbgdAbgo7YApgPZgg/hAauuUXd9ccA5PZJ5o2swUqoa016nx/O4EHIGfdw0p18QFVbdzA5Q4AXeJN+3/Toj0ROEYOI2m7BGh8e1mdk+7gkFGZWmYt02/s/+f4SdaDYDuBivjyPesPpdYR2AwJXQqyb29O2QEMmSbehxj3IyoY+J4k8xSaBLiRHV1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(19092799006)(366016)(38350700014)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HRrBBEWOoJYiiJo2oxSDKOmPkgrWTcj56l2f2Ttc2DZ/tibUjbse1F01OcMU?=
 =?us-ascii?Q?tdQA1xoWeRQGaHIc848V7jCf4iZ8B9pG3hvfbjQxXFu1xDMQaNJKlWJqOsLk?=
 =?us-ascii?Q?DojScirX7FIBgekvdCWlqartPVpwKaNavDX6SWKWY0xnKblmp2/47bDTke3O?=
 =?us-ascii?Q?zOCMDBb5EXcaNarqRyapb84l6UySI4vvVmU/83FeyqINz9TIV1fyjFMMxwDE?=
 =?us-ascii?Q?IR5FjD6FAL7z+tF8h0qDZfldd+DQ7eujKB00GAFvVRl3b7RxBjnyDGuWr+HB?=
 =?us-ascii?Q?OV00KjIG535AfLxDPjrfPpI3kS1qxKcyNNyXOxWlJzHZxec8468e6LwTStaK?=
 =?us-ascii?Q?njSnilFCRWnYTr7YJ20rcZCkrZ9bxayHQgLeKSzsgHZHCC9detp1g/6+g888?=
 =?us-ascii?Q?niRVmD/447OKljyXvdvv6LcvrkxF71xAEULK1yBi7uR6tUqSlcVvugeQi7vF?=
 =?us-ascii?Q?dBMTeQOSah9PXpkWUYCEPQl+hMmlQjeIzaqT3tCyk0j3Pk6djG7/D7XD57wU?=
 =?us-ascii?Q?NUEgy5pMyxZ6o/Q1L0TbJSpxlJdtfjkXIEKyF9hcDtte56EBCV7p+MVnWU3+?=
 =?us-ascii?Q?RR6DmzKry0dzNefUrGsVUzZ42IebUJrw4I1arH36jfnmBht+G52LlnvJJuvi?=
 =?us-ascii?Q?j3+2oYrKiQhBrzQlgsKb7xANw+I8mWEkn3p6+5/exRMOTpyfduNOxJ8jPVL7?=
 =?us-ascii?Q?1YZswvgdh+K/wXzAKWQYMxMg0XD2HndydrwPEwul6FHEIvaRr8TSEnBRJ5vh?=
 =?us-ascii?Q?arqGRo3eVEF2Tou3iZCGDwsdy/OjeP2N0kTHW4IKwuAt66Di8L2x/P8KcE1Y?=
 =?us-ascii?Q?18QxJHvTA0aook8PdU+mXwkzb8DE58e1z7qXhA5tZ+th9koM1Dijpedd5g+h?=
 =?us-ascii?Q?WW7jOS8SSJ73HeisdSkURyYHIeV7Aoy10uImUAzPDG/fWdRiCYI54JJJrwTP?=
 =?us-ascii?Q?lpSWI2FT96x04Y9kghdOcngpXwATcMDHJEVz7AktCLs8GA2a2UdFVY/kafzu?=
 =?us-ascii?Q?WppoM+LAkLCiQdPgIJOYyAjfKo7kH7cvhnUTPO7hxluwYP6ffxnNKhLJGWtP?=
 =?us-ascii?Q?nTrh+O0k4EQdTULoI7/BwwW8FdZR+rhwDIJJQdvXsoq+9CR7wrhYsDdUELQD?=
 =?us-ascii?Q?XJflsvIwlzcZNpPv/+ZS+vdnhTqczDwuDdtyA889nL56gJG9o1UEkW7imJtv?=
 =?us-ascii?Q?s1Y/5bGQ6PyqIhsNETuRGWvr13lIPT7CF1GHNdFpnorKSdknFT6Qvu76MxAX?=
 =?us-ascii?Q?50dN5eJrsp+JpJRhcXFc56KfhOZ2WLDq+FhjDPshPmd2CxcuqZFJFFzZ1Jvu?=
 =?us-ascii?Q?nduHd684/Tq4619r6iTR3KJ3nCG0qqmjD2fI9nJXkDScBV4cuL7l3fNz/rj/?=
 =?us-ascii?Q?49I0pqK5/5oQ4PCPDAf+auB7U1zI2Lj8LyUCt3s+tLQYrZS1A9MVvXfxbHLw?=
 =?us-ascii?Q?jKruRH0Seg4/l/c4H9eyWV/hMx+A/8ArJKi7QEpcBU2JwJeqQlWa5mJUPC8x?=
 =?us-ascii?Q?Fh6vCM+/ayogj+XQ9uLG9yXHf/zZFWjfTVgXAugdfV/uIIuFLacIdT3DXGUX?=
 =?us-ascii?Q?9Zdph+KYB5kGp0m0+4+EYnAOOtc1FMnTH4KwCYV5pHOYyTzgFjoZ+KropfOb?=
 =?us-ascii?Q?jMrwfWCM6g6ftYCODmtBsExNFALQ2iK6ZhvYo5vWvdYRhRMh+ptJNT/vbbVh?=
 =?us-ascii?Q?jmMvSQX0SD9Z+zfKwi5jDJQPuozKblPLoOnHeZoJ+MEccS2GTdYButG0LGUT?=
 =?us-ascii?Q?YyZ0gk/20g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 186aa2e8-c0cc-471e-ac48-08dec0ca62cb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 17:14:20.8380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/BRB9YIFYvq17cT+FNVrm8gma6oToD/K7sZ40Y6V5mkooMr9z0choiiJYIAN2N/rOaPuHsa/zgBjwKB27G2SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8550

On Mon, May 25, 2026 at 12:12:01PM +0530, Lakshay Piplani wrote:
> Rename i3c_master_reattach_i3c_dev() to *_locked() to make the locking
> requirement explicit and consistent with other I3C core helpers that
> require the bus lock to be held by the caller.
>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Changes in v10:
>  - Rename i3c_master_reattach_i3c_dev() to *_locked to reflect required
>    bus locking
> ---
> ---
>  drivers/i3c/master.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 5cd4e5da2233..e89d73508b9a 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1652,8 +1652,8 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
>  	return 0;
>  }
>
> -static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
> -				       u8 old_dyn_addr)
> +static int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
> +					      u8 old_dyn_addr)
>  {
>  	struct i3c_master_controller *master = i3c_dev_get_master(dev);
>  	int ret;
> @@ -1742,7 +1742,7 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
>  		goto err_detach_dev;
>
>  	i3cdev->info.dyn_addr = i3cdev->boardinfo->init_dyn_addr;
> -	ret = i3c_master_reattach_i3c_dev(i3cdev, 0);
> +	ret = i3c_master_reattach_i3c_dev_locked(i3cdev, 0);
>  	if (ret)
>  		goto err_rstdaa;
>
> @@ -2358,7 +2358,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  		if (!ret) {
>  			old_dyn_addr = newdev->info.dyn_addr;
>  			newdev->info.dyn_addr = expected_dyn_addr;
> -			i3c_master_reattach_i3c_dev(newdev, old_dyn_addr);
> +			i3c_master_reattach_i3c_dev_locked(newdev, old_dyn_addr);
>  		} else {
>  			dev_err(&master->dev,
>  				"Failed to assign reserved/old address to device %d%llx",
> --
> 2.25.1
>
