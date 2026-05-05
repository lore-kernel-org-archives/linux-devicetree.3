Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011024.outbound.protection.outlook.com [52.101.62.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BDC47DD5E;
	Tue,  5 May 2026 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777996899; cv=fail; b=W1Zpg4q3qoD6qFj7A2rkLQwnMjoQXDxwO9a3bAMg1Jl86pYLlyLNJu6gVo9vuO5HJicSyvHqzE8kttnRBctWyUSG2ZSl2vWhJzlYaBDwmOKIBy+xGPkWMkaHDvlNf8O784zJjqW6Dpv91e3u7iCv18Ut85TLbBeYCn9l6pvJmhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777996899; c=relaxed/simple;
	bh=/NjgxUlJVW9YFSI1Mk2aAW72QVbuMrk4A+P07mywOZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rXDj3nwzmxozqTASaLyy6JOeM/PzrMM5nEmx7BDmFWNNriA4QKPxRfiOtKLTMcBqUE+VdAeBieNvGFc3WGF7ildq5Te82n16Xvu/Vqbw0yG931MR/iuxdZMsnbFQFWFtKhCjWXwG3csARCA4hc9FShCrtKAWt9cJOC2oETkBEj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aVteUMZc; arc=fail smtp.client-ip=52.101.62.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aVteUMZc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+HlBKEhxue0oh3e12B5I/D3itpa7nYipQE3OLrWtDOTnvugwlUpdD0Pd5uzN4sW3BkBmNvVEh6DQ5ktwQ/dJFON1UHclbYbRtdWRsNqOl+qYA9UFftOUN4Btv7gECYPxDBCxAsWwatV8HX0+WYaxthllHqDyF2h+CBc4kh9+0ZXL8PUW1fW2bEWRNaka2VMMgg9L/gzOHeAOdSVUT8zUvZ2ecEoz8BR+fjMmNYhC5zODNR6JPdGr0iXtWFMBBJk6X/AqGi5uoTVXJ10iHwbzkZ7pf4USLMRbJpW92OyUmnxIoSvaKlAePtmfJh/wsL3mX1ADWYmA5RT/cEzcHjnCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DtfoRY00T0kAtmGHt3+22xnzBZkSVVASZxf8fmdMlw=;
 b=deHgseclMJ1N9Ocle+deYNg+Atpfzout+dBx9mGeY8q/DBKkZHHIzF1sLeDOf2mq5m1n03+IA57fV7l8GUdTOSGLI/f6s7WpolTpFcx4ag9t4NoaXJlcbNWXGJtdkk7yPQsv0eSZQs+rLnU/1M37EHbSSsyQKH/hacor8SU9w0ZaLOo1WjRSGd5y5Z3sY7QX3Hz5WS+8vLskYX/fQdjo+CUhmEfrYMN6dDPUxFu/F+fjG0V32NqadOl8PPtfxG+b2/8K2l6phTbtcXkluvDT2EjLAp6hmdIl9G2c5G99Kqhaqm7OOOQv7qwy3vrWYJWZCifUYGDbNxFp+MNb97I3/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DtfoRY00T0kAtmGHt3+22xnzBZkSVVASZxf8fmdMlw=;
 b=aVteUMZc3RZU7fWLFRtw6+awP2RHqWdKq7Q7LB3WT2fjf3Zg+32mjsm+GdvEKlARRu6IW/RZrVye/ahgAVtoqacpbkkSOZRBpSaR2WOMOV1VfAdW7xfyX6YqZeKw2k3dss/y2dqyuA23JPad1etBVDUdnfHjxlWXr0BfUU8EkCc=
Received: from SA1P222CA0075.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::22)
 by IA0PR10MB6796.namprd10.prod.outlook.com (2603:10b6:208:438::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:01:32 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:2c1:cafe::32) by SA1P222CA0075.outlook.office365.com
 (2603:10b6:806:2c1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 16:01:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 16:01:32 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 11:01:29 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 11:01:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 11:01:29 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645G1TJq3598180;
	Tue, 5 May 2026 11:01:29 -0500
Message-ID: <c8cf753b-f542-40bd-b1ef-a06720b2106c@ti.com>
Date: Tue, 5 May 2026 11:01:28 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: ti: Add k3-am62l3-beaglebadge
To: Judith Mendez <jm@ti.com>, Bryan Brattlof <bb@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260501233148.4180391-1-jm@ti.com>
 <20260501233148.4180391-3-jm@ti.com>
 <20260504161900.sivd2s4roiqtnsc7@bryanbrattlof.com>
 <073e52f1-f5d0-43aa-b9f0-d4f179838f10@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <073e52f1-f5d0-43aa-b9f0-d4f179838f10@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|IA0PR10MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b08d2c-a71c-4a93-bd96-08deaabf935a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fumLGokvsLOQQhPA6qTnF+WiUr2B+a5dyNBagUmmuWTHlYasuT++8oiKbHH4FAPpERAjdXTccUXf+l26ab2BDmEx6lRPQu0ASgJZW4D9pKY6dJ9DFuUx9l7BNWruZialgKJj22ORUaftxscBNGBEGGrPa4gnR1kA64xpHUGn0H6Jf+BGvCDJQL/YYntTle+TQwfmb5zl+IIz15Yn+tk9LCfVPPoHdnH/th1ZXTVZiut/fYjDip337JNhG+3oZYrqEJSb2FgEIEBqefIiHD+rnuzx8X/yZZ7nfvF2bff1S23YQKpkTWN1m1AVQUw0eep4nAXSKrSD3enmXqXhpgbHetohMw7W7VxeGdQmQlji5CXH6NDMqeemGh4FNIzKRfwg+JPR+ifpcHgcIGNK6CcPklPCP67Qu1p+6sx8rKrU2E7dauO/ssaH27Ah7rEA9ZbryaGy6DyqY1uP6ZLyD9buxHBoAZ2WeAoKCNgscLP5jooHC2+oAGlSiCxKMQswFfUEKiofA8OSheB7hCmd29dlaiJ9boEsFcxbrfdDEUN9zeQTppr+m4th8nSKIUumtVLpumwCycT/NvChf7L71h4fVVzhlnDiyPWIWMaN2+RjS94tZ5OfuNknSqpCpXyhcOFxlFafs7WV4chHou0IxoyGjoOgmJKdhbY2G0Vk10R6Za4=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pmSrSCJjW+NU/G9Aes1u41J4LzcZq8+s7x7hSYRpMSQMXwW246zs/OZ+wlLpGPbG5n+P/2R0dN+shFYnbHxa/ySXZdoAwC4qo/31S5ZDNNh5YWKJjQMcP5EylC+0atSiZcpWMjiUNN3vsqv/2rDpmOCJM4KIPad6kBpkE419s4M2NVtsqvROgEAUBYqui8Wj7Dedg8U8N4f1omsg4Ja7B1631whbYXCbryr6Zc0a/Chzif5BfKFlxMHfFG4hdBzvjK29mffC7PhuOgKY8ekMrZ3x1WMNMlefYrthtt3ahj6k/lJC+9CUF7/pio8zCRnn3i2Qq6ZM2e72z+4SUmdstHmY1T2lyA9PJt9qkLMUnZmcOfF1O7fUlrq3iSSk6b//CQLC9NdDpd1eZ4BpliEDMnsHgoE+rg8WOOwAeSkH6Rz02Hx4DsnVtUEv126WjyGn
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:01:32.0109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b08d2c-a71c-4a93-bd96-08deaabf935a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6796

On 5/5/26 10:48 AM, Judith Mendez wrote:
> Hi Bryan, all,
> 
> On 5/4/26 11:19 AM, Bryan Brattlof wrote:
>> On May  1, 2026 thus sayeth Judith Mendez:
>>> BeagleBoard.org BeagleBadge is a compact, affordable open source
>>> hardware single board computer based on the Texas Instruments AM62L3
>>> SoC designed for IoT and embedded applications with low power consumption.
>>> Expansion is provided over open standards based headers including
>>> QWIIC and GPIO interfaces.
>>>
>>> https://beagleboard.org/
>>> https://github.com/beagleboard/BeagleBadge
>>>
>>> Co-developed-by: Andrew Davis <afd@ti.com>
>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>> ---
>>>   arch/arm64/boot/dts/ti/Makefile            |   1 +
>>>   arch/arm64/boot/dts/ti/k3-am62l3-badge.dts | 655 +++++++++++++++++++++
>>
>> ...
>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-badge.dts
>>> b/arch/arm64/boot/dts/ti/k3-am62l3-badge.dts
>>> new file mode 100644
>>> index 000000000000..0125d3fec5e9
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-badge.dts
>>> @@ -0,0 +1,655 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * https://www.beagleboard.org/boards/beaglebadge
>>> + *
>>> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/input/input.h>
>>> +#include <dt-bindings/leds/common.h>
>>> +#include <dt-bindings/net/ti-dp83867.h>
>>> +#include "k3-am62l3.dtsi"
>>> +#include "k3-pinctrl.h"
>>> +
>>> +/ {
>>> +    compatible = "beagle,am62l3-badge", "ti,am62l3";
>>
>> I noticed the $subject calls it the k3-am62l3-beaglebadge do we want to
>> name the DT that as well?
>>
>>> +    model = "BeagleBoard.org BeagleBadge";
>>> +
>>
> 
> So I see other beagle boards have the following:
> 
> beagle,am67a-beagley-ai in k3-am67a-beagley-ai.dts
> beagle,am625-beagleplay in k3-am625-beagleplay.dts
> beagle,am62-pocketbeagle2 in k3-am62-pocketbeagle2.dts
> beagle,j721e-beagleboneai64 in k3-j721e-beagleboneai64.dts
> 
> so I think we should be using:
> 
> beagle,am62l3-beaglebadge in k3-am62l3-beaglebadge.dts
> 
> so if it is fine with everyone will update compatible
> & DT filename accordingly.
> 

Looks correct to me.

>>
>>> +&sdhci2 {
>>> +    vmmc-supply = <&wlan_en>;
>>> +    bus-width = <4>;
>>> +    non-removable;
>>> +    cap-power-off-card;
>>> +    keep-power-in-suspend;
>>> +    #address-cells = <1>;
>>> +    #size-cells = <0>;
>>> +    pinctrl-names = "default";
>>> +    pinctrl-0 = <&mmc2_pins_default>;
>>> +    ti,driver-strength-ohm = <50>;
>>> +    ti,fails-without-test-cd;
>>> +    status = "okay";
>>> +
>>> +    wlcore: wlcore@2 {
>>> +        compatible = "ti,cc3300";
>>
>> Sadly this only exists on our evil vendor tree :/
> 
> So sure, I saw that the WIFI driver is not in mainline,
> but I also referenced beagleplay series & it seems
> like as long as the hardware is described properly,
> the node can be upstreamed. Please correct me if I
> am wrong here..
> 

Only in some special cases, but in general the driver needs
to be upstreamed first. And even in those special cases a
DT binding is always needed first. Otherwise how would we know
if the node is described properly.

For Beagleplay I only see the CC1352P7 radio in DT upstream,
and it has a proper binding[0]. For now drop the CC3300, we
can simply add it when the driver gets upstream.

Andrew

[0] Documentation/devicetree/bindings/net/ti,cc1352p7.yaml

>>
>>> +        reg = <2>;
>>> +        interrupt-parent = <&gpio0>;
>>> +        interrupts = <52 IRQ_TYPE_EDGE_RISING>;
>>> +        pinctrl-names = "default";
>>> +        pinctrl-0 = <&wlirq_pins_default>;
>>> +    };
>>> +};
>>> +
>>
>> Scanning over the bootlog it looks like the VTM driver is active but
>> we're missing the thermal-zones{} node which is causing it issues.
> 
> Opps, will add. thanks.
> 
> ~ judith

