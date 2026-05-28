Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012031.outbound.protection.outlook.com [52.101.53.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F0332B117;
	Thu, 28 May 2026 22:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005905; cv=fail; b=k+38loNpoiuePrWRPylOOk8RHjdEFnpkpZFLkoOgxEm7K797jqg9ieKtR6d+/0gp+HpL/3freCU82lvwe6jJi++Az/ORhvfGMVSbejwoB3vkHp+4Vsd9snC2bCril7IJtkSA2iqtmG10Qvehm6HIZxd/6GG3vBZsHDSe3lZlqB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005905; c=relaxed/simple;
	bh=Ai7onshc5z69HSJGES1qxeRI96ROkWsTZnBotYG5jNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nxwzMnheHAZPHPBXeUXw41a7om1WByRn9Ie59Xg8yUXpRQbZto9cKSpFLwyAJIAFrsk7aqOrZ3/4i6t6h3lTaWdKpKX9PHCQ5c+VHtsBb98jhm3pwOLJTPX2nkPe1o/jSR3Aj+s6jZ1dLex+UmcVxC3rM9bSV4o/qZuZbcma/70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hLmrRAnI; arc=fail smtp.client-ip=52.101.53.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hLmrRAnI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cx2Ov2yEfYEQzeheJpsJQzkLWWHdaaib+jt85uEHLmO02xLIVfa5VRKVcWopaoOuqvjEdh5yxr81ora5gwT9YecBSlJg0sv7FkMlrvh1ECmlGv3dW62R4Dcys/EjnpdyjULb/+oIQQm6sb7BEuboV1pGwqn5Lb2MagjI7zOg3cGt5NdUhayuy7yP5w4Fkmy3ZQ/i2oyHAUZlGOjZkHjUVcdeieHFU+E6UDOpUMZDOehsz/XapKPXqt64pSAChtUdxpeBFGpUCRuYoNdn9W7QgsVNkXEcy7AhBIx3UHYOP16SqhOdcdOlJtfXiAc7vDYaDMVwjrFIDuoIZpdsisEGkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuBpRqmQPS5IyTaDEcuWfyYzwjNEqWRs+0jndKJZvHM=;
 b=wf5cKEaKdZniY14QSZJWrc8ZPczyFeyBhb9vExqjcHydACPfnkEwHqOeGMjnMOXSdJUwYaaiNUK7cQc3ZxKkUXp1+Wr5ygeDDeluC9A5Sg2Gpaml6DRc2qFSr5tyM8jIxorHmJH+va5RQ9Kuzo3fPYmaV8kAv4bx9ZH9jXKLcA6DYAtXqMgCwFWoV5l3lon25rCy6b7N0eSXnvoJoeuE0UF6hQDV4+xERZCWalP4n47jfawt7WQPJEK1XfwvbovO9ghjPlJfXVkxgdiGF5N+V6VpjzdJuViPpwn9rkP567mKxqT9btBuhVmIqmASm7E4UU/1sXfDKW1/ejk6j9j9XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=microchip.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuBpRqmQPS5IyTaDEcuWfyYzwjNEqWRs+0jndKJZvHM=;
 b=hLmrRAnI4FWZoKSMJNYiiDYvncDwsCmCLbVVld7S/EwzxIhCMD6gA6bwFfaiMY28hV5+OhNkUrEBbj1tBn/NLDM+1e9vUoloJEUbZaSdGx0Ce4S+gDMOdkyVFPVb02vB9L48iQvWRkvoKMSsAIwWMbf7hbOvMb1grd8WbHWTSwY=
Received: from DS1P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:453::14) by
 IA1PR10MB6900.namprd10.prod.outlook.com (2603:10b6:208:420::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 22:05:01 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:8:453:cafe::40) by DS1P223CA0002.outlook.office365.com
 (2603:10b6:8:453::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.14 via Frontend Transport; Thu, 28
 May 2026 22:05:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 28 May 2026 22:04:59 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 17:04:57 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 17:04:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 28 May 2026 17:04:57 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64SM4vjL2895615;
	Thu, 28 May 2026 17:04:57 -0500
Message-ID: <2f7de62f-9a26-4d9b-b239-90a5d7c57398@ti.com>
Date: Thu, 28 May 2026 17:04:57 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: ti: Add k3-am62l3-beaglebadge
To: Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>, Jason Kridner <jkridner@gmail.com>, Robert Nelson
	<robertcnelson@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
References: <20260526235417.1326187-1-jm@ti.com>
 <20260526235417.1326187-3-jm@ti.com>
 <26a43b26-b7d4-4c5d-a286-4ac1869e2d42@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <26a43b26-b7d4-4c5d-a286-4ac1869e2d42@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|IA1PR10MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: e74b1854-d1ac-4794-3cd0-08debd05294e
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|18002099003|22082099003|3023799007|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	1rJJdIUSOOKMJUTUJ0oHUdhlJmByx2lYpNDdKBv5oJ+XqxSj48jSWm1SG4xP/NZLtupHx6wukKw4g3TkPndpJra4zrqx1Ko5HJaHfzIRjI7efR9vAfwn923oomXv8tH52tetsT2nuhWtaMmoN+PpmrQhcMY0Rz87Vwx0QE4PuyvOnktRtwBJNVwogh/cvu9cZHJPIviNWkhOlAj8SbL3KVrdD8LTXbc3V66iTlV+w0A54hQW3Y3FJSlU/Te4YBYJ+rLDzgSQDnNkLKUqlmd2OaoPUUx6xvy3dELK5GXjf/LRiiq2zu0R6nilZv5ZkhUI7v/EHkt77dxhprU6dmYYJTmI9zKfa0gf3feWtyecrWMG6qYtYE/FQDHEwfDWxnpicKaLMCaKTWlXqVZLeKzfjivRV3K55jIAFI0h+H1+5EiPXVlWzlFkho/KfSoMoHV3tdn0AsGIffKiVQBmGP+/CMGBs6EULrU0mgZPA16ufS3R9MyqpSMhMdpNplTaQxHG8aVlbu+2eEPkOcxkG4Z1QQn5cYDtX3VC4eG6JAWxkLxrlRWoeGwFo8DLv7Lr65GfMTCT336ghaMT+ZgNWJ03tuZgiNx5UKxxAUViZ3TBgrNAatIIyR2KPa4xPwpNLo/NXepsG/XIeE/zdmSGqcS59E4ctfBtGUs5ndnkWXQcLxtookmI9mMyueabNRswWB3X
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(18002099003)(22082099003)(3023799007)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SR1yVOfBgAjnRZKd6ON0swyPp3vdQdztf0FIuMoVZ02oVNANKx94GWO0YTR/AjzBpsP720E47ASvWLp/QS5OGCju0GgtXX9D7KV7zC8BZMudWhGt9mmO5aupvymUk3EH1RIb9snNWiPWRW0J6qf0p/vfrdsYgVfAUnkXCRrEe4iWWOCHv0u+d2Ak99iaT7RPTEx+3d+ZapupJg+2H+eFy6yoSZS0zmj9lnSdQxrlz8i4wWJn6DPR7eftsgKAhMyOsesSFU9wosJrFugnHFU3TlR9J7CpfrUinylSorQ5GU+QMcJbdP6HWgFphepV28sD3KnNQCmJMf840j+DJCSieMAP7ypqe6OjMblW8bSg0I0CTh0EsE+RFH8UKW6+H2MwE/H1eoB25ysHj6i8NhGi7z3lKPcjoIJTgC1Zwem842EWH3MeLx9whcRK9rsu8ycs
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 22:04:59.7665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e74b1854-d1ac-4794-3cd0-08debd05294e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6900

Hi Vignesh,

On 5/28/26 5:52 AM, Vignesh Raghavendra wrote:
> 
> 
> On 27/05/26 05:24, Judith Mendez wrote:
>> BeagleBoard.org BeagleBadge is a compact, affordable open source
>> hardware single board computer based on the Texas Instruments AM62L3
>> SoC designed for IoT and embedded applications with low power
>> consumption. Expansion is provided over open standards based headers
>> including QWIIC and GPIO interfaces.
>>
>> https://www.beagleboard.org/boards/beaglebadge
>>
>> Co-developed-by: Andrew Davis <afd@ti.com>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>> Changelog since v4:
>> - Canonical URL fixed
>> - Switch gpio -> gpios in voltage regulator nodes
>> - Regulator-always-on removed in sensor_3v3
>> - Add bootph-all on pinmux nodes
>> - Fix gpio-line-names formatting
>> - Nodes: sdhci2, wlan_en regulator, & pinmux removed
>> - USB aliases removed
>> ---
>>   arch/arm64/boot/dts/ti/Makefile               |   1 +
>>   .../boot/dts/ti/k3-am62l3-beaglebadge.dts     | 658 ++++++++++++++++++
>>   2 files changed, 659 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
>>
>> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
>> index 5269c9619b65c..4e377ca011cd8 100644
>> --- a/arch/arm64/boot/dts/ti/Makefile
>> +++ b/arch/arm64/boot/dts/ti/Makefile
>> @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62d2-evm.dtb
>>   
>>   # Boards with AM62Lx SoCs
>>   dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
>> +dtb-$(CONFIG_ARCH_K3) += k3-am62l3-beaglebadge.dtb
> 
> Sort this alphabetically please

Will fix (:

> 
>>   
>>   # Boards with AM62Px SoC
>>   dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts b/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
>> new file mode 100644
>> index 0000000000000..8e816d21a586f
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
>> @@ -0,0 +1,658 @@
>> +// SPDX-License-Identifier: GPL-2.0
> 
> Dual license this like other files

Ok no problem, will fix and send out v6

~ Judith

...

