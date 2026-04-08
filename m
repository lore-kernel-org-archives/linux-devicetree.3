Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011057.outbound.protection.outlook.com [52.101.62.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC273AF643;
	Wed,  8 Apr 2026 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644766; cv=fail; b=TA8iu25RHiwmoadcF/q2zeiKn+U/J+ANIl6ZJzj6U5S7ZrfiNJIPwbid7ww3D02S7iiQ6buPfnx1j6XQJ6wJ7mJO9AmP70WGO0Bx5JOVGxO8rTWNYqqVs3ICUFh7dxI0u2/uQLY+G5fCaKJAY21VjWARXbZJp2GBsfDHOuCDc2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644766; c=relaxed/simple;
	bh=XWqytm/5hHumkkqqvKqieUjFa3kp+I66TiEZJttNRPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ckojb9rioJEL+wWnLz8FoY12QMcw2V+n9EeQGkMP46wYZV+eg8qgZfGH2AUVCsbwcElF2vKOtUVYqkMT9e4rNgCmPXgiWe8xCjburw/4PRCrpqXWPCSQW2YusMdMsKwly5lZxxGQ5gnK5IfuEUFurcjHAeFqLtqAO+bjMC3rxVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dzF72Dk2; arc=fail smtp.client-ip=52.101.62.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dzF72Dk2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnJt4gYbsdIqmpy4Q3WrqQ27AoUSd28a9E6mhGHW36Ob5CsGrmqBO9t3urvHes/+xbyAVB3TFbOQEINQ5+SjMFCCe2rq0mO8z3bNyjONUi7M3WdtrA/D+oz1nBSgB2idVurJzjMaYIkjFItMbpmEaHz2OBw9AA4NUKJ1FDrrjr/utam/uq6piH6icIdhCuWKgnCH+Idc4DiZYDt+oS49psNcPXVRitlylmAgNqpCV8F5q4HW1JBGNCD72GJo+iIJfoQKGwubN4xiNuo7StxGJg89pPz5O4RIxUE935U8dZCNJHhFScSU8jgFNMwHPZ0e9PAGi3aODDoJaRajoQQigQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSMV7A/xAfYbwor6YtxORvmwr60ODVGm1Lr0q+Oc9dQ=;
 b=MopFl/EDgS9YZwGMy9RpjCFTUAblThf4N9wVerlj57SSYwmNdx67rInd+fwxfB89MHHcrDnp+yvNbA3uZdpzUp9PZR77SCmvE82EaDUGqPhPoiYGdMLO4BButRsNtPxQ4PA/VNgLag9Skn9MS+Dz3QKXWp9cpaNF7WRdoXzwz/Uu6vKu23ACjMki1dMgI/PjNgcKhxH7919+Wk4MQnYLyz3DjpRTlilR2T2REMD2gF2JPULlqV5e1COKflOzIazMXTzfoNjCE1rsOQB+35wsZKfqjboobKeS2ksW0TjNMsjXklb/gBLhzm/xdSosI+nbIY9UrB933rC5TsqBFNERUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSMV7A/xAfYbwor6YtxORvmwr60ODVGm1Lr0q+Oc9dQ=;
 b=dzF72Dk20kABLhL46gi2owoje8gVxFtQnoJjE0M/uFBOheGnSP2po8FQVm7WFgnVE69qH+YYFcbJpn4TmfJHeHMynjRLId46NLvEOAyMaVQKx7QmPk1LcWSD7uCAGSw/7D2ejfwCT7rWbfTnrxqCXjRRQbRI1iXHjeFfW3iJIvs=
Received: from PH7P220CA0056.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::14)
 by SJ2PR10MB7583.namprd10.prod.outlook.com (2603:10b6:a03:537::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.34; Wed, 8 Apr
 2026 10:39:21 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::bd) by PH7P220CA0056.outlook.office365.com
 (2603:10b6:510:32b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 10:39:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 10:39:20 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 05:39:20 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 05:39:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 8 Apr 2026 05:39:20 -0500
Received: from [172.24.233.12] (uda1253387.dhcp.ti.com [172.24.233.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 638AdHHd583775;
	Wed, 8 Apr 2026 05:39:18 -0500
Message-ID: <17a7f37e-115c-4127-9568-3d52a3f0328d@ti.com>
Date: Wed, 8 Apr 2026 16:09:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC uL PATCH 2/2] mux-controller: ti: add driver for event mux
 router
To: Greg KH <gregkh@linuxfoundation.org>
CC: <peda@axentia.se>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <vigneshr@ti.com>,
	<linux-kernel@vger.kernel.org>
References: <20260313060437.3704592-1-r-sharma3@ti.com>
 <20260313060437.3704592-3-r-sharma3@ti.com>
 <5ba0d92e-7f2f-423a-8d1c-561c350c1db3@ti.com>
 <2026033026-shuffling-kisser-ac6c@gregkh>
Content-Language: en-US
From: rahul sharma <r-sharma3@ti.com>
In-Reply-To: <2026033026-shuffling-kisser-ac6c@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|SJ2PR10MB7583:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f36ba76-b92d-4240-2fc9-08de955b17fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	33ZOy5laZYtpJE0PIWO6UdTcLZqy89CqiZXXWSgWtcpbyFWgkdM/i7KbDoUAI3NoqwBtgIIuz6hITyeVmwhw44xoHVuRxMdxvA1JugOg4LT81oR8jy2BH96QXVhBtDODHN5NVaDwlWCAIea5iwl2f9LIo7Cq14qrKjILpg09HgnAvsFkvPKLhEfX7eMYfKoKHSS1/XNR4vD/MPTHKrAQX3iU/FB1f0TZj3OCB85eAFj+ZclXVnPAbzchMLwXyytjjC2bi/FbyysjaXLL2/Vl0Eut9OCz9c1912Bu2W4pJqD3OexJDpKm3H9gokMgrgLtp+UL2ky5f/B6T5LMlZoYBXXDcGJJ6MPw10liiboJBjwk9D2B/T8PvzHs1eMt+tjdtc+xdUgz/jXlMdXHyB8sRMZBW25Eb70yAcp9KDtBg3Yx7BFoIB16J1YcIDcgQxE9nYA4kT1olYwW5y+K/QYoU9h1OoltHrM504H09ePsTBzFR5WYt+LLDyMXsG648v/dXRFukVBXcniGF1+umNdSpOk+scUlLC/p+3N8ReAx6CuFWtqnGli3RhUsCOXFa9MbGMBx8y0aLF2v3GTCDNPP7JT0co1VlOfg5v4u2K0ye2S5JkR9VTrYOkvnVWrW1Ao1iEXpJseSVe0cFSBNtZHleVSmy2bQfOWbcGyzb3lL42PE8VOZBtZLp2r6V7n6dfdCQ127EufZyF8+OpNF9tQcLq7Fc7W9Tb6p/qVfLE30IvXklHkh6CQdNbnWtnAyiY9KnwMZojdBX6550gvt7VS6xA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	peiYln0Ki161btbVB91o6afzCilMOxp9B3xBAYt4ZVY3MfTxElHfXMxzakUjSaWpyk5dMqdfVqiJkLCgfjAEixE8+n0XeliB5xetV0VjP3Qk3Wv01Ug+sN/OLdBkbExlJj4OdQvhCjHmk0rbtd4zooZMvDItPOSuKYq6XsL0f6/Ct/6AsbeO6Y2tq0R/BjCv/CuKHUHpegCB52LTQOvBIr1TbzwB3AbeZNsbZ8QoPnjTOHhyOVTU1O0XDcK7+NjLOGvdOMC4FoNVadNQKXJyt7YuyQwPKQ9pQe6nwvDDef//7S48dqspt+dUusy+MbL+Vh+i0XnjVRmbSWaAigANLceLN61CFxQ0okYRYORpQsLx1q7mySb5njvgPWIjskItRUdcQEKNR4kPuc77uiyLUxyu3vs7LqoXKesmZV7zqEMc8A5/Lmh6/U26je/qaGvg
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:39:20.9300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f36ba76-b92d-4240-2fc9-08de955b17fb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7583

On 30/03/26 12:33, Greg KH wrote:
> On Mon, Mar 30, 2026 at 11:02:11AM +0530, rahul sharma wrote:
>> CC: Greg Kroah-Hartman
>>
>> Hi Greg,
>>
>> Could you please review this patch(2nd one in the series). It seems Peter is
>> not online for almost a month.
> 
> But I am not the mux maintainer, so I am probably not the best one to
> review it :(

Hi Greg,

I agree, but is there any other way to get Peter's attention on this. Or 
is there any other maintainer who can review on his behalf. Could you 
please guide me on this ?

Also, there was another patch series that was posted last year. It was 
trying to do the same but changes were on the generic driver side i.e. 
drivers/mux/mmio.c

Link: https://lore.kernel.org/all/20250605063422.3813260-1-c-vankar@ti.com/

On that patch series too there wasn't any comment from Peter. I would 
like to know how to go forward on this.

> 
> One instant comment though:
> 
>> On 13/03/26 11:34, Rahul Sharma wrote:
>>> The driver supports event muxing routers like gpio mux router and timesync
>>> router. This driver is adaptation of original reg-mux driver, along with
>>> changes specific to support TI's mux router.
>>>
>>> The idle states this driver supports are only 2 which active(represented
>>> by 1 in dt-node) and in-active(represented by 0 in dt-node).
>>>
>>> Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
>>> ---
>>>    drivers/mux/Kconfig           |  15 +++
>>>    drivers/mux/Makefile          |   2 +
>>>    drivers/mux/ti-k3-event-mux.c | 235 ++++++++++++++++++++++++++++++++++
>>>    3 files changed, 252 insertions(+)
>>>    create mode 100644 drivers/mux/ti-k3-event-mux.c
>>>
>>> diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
>>> index c68132e38138..ad3af2724d28 100644
>>> --- a/drivers/mux/Kconfig
>>> +++ b/drivers/mux/Kconfig
>>> @@ -59,4 +59,19 @@ config MUX_MMIO
>>>    	  To compile the driver as a module, choose M here: the module will
>>>    	  be called mux-mmio.
>>> +config MUX_TI_K3_EVENT_ROUTER
>>> +	tristate "TI Event Mux Router using MMIO registers"
>>> +	depends on OF && (REGMAP_MMIO || COMPILE_TEST)
>>> +	help
>>> +	  This is extension of MMIO mux for  timesync router and gpiomux
>>> +	  routers on TI K3 SoCs. This driver supports the 3-field format for
>>> +	  mux control: <register-offset mask value>.
>>> +
>>> +	  The driver allows configuration of hardware mux routers using
>>> +	  memory-mapped registers. It's based on the mmio-mux driver but
>>> +	  supports the extended 3-field format for more precise control.
>>> +
>>> +	  To compile the driver as a module, choose M here: the module will
>>> +	  be called mux-ti-k3-event.
>>> +
> 
> Don't you need a blank line before your new config option?

Sure, I will correct this.

BR,
Rahul
> 
> thanks,
> 
> greg k-h

