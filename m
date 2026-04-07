Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012029.outbound.protection.outlook.com [52.101.53.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF1733555B;
	Tue,  7 Apr 2026 05:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775540808; cv=fail; b=hxyXDPy+O944eOiK4aZzdeE3hy5O00WVIO2VWlojr/audNaHnO8AbDSuZdniWPvJIg9WueItq67G57XMQDb3/1L12Fmne3g6CALt3i0yu2S+Jd1H6Kilx8H3YPWERAJT39mvpycLf69La+ns9JXHKNKBrZZFjnHyIZFams0UhKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775540808; c=relaxed/simple;
	bh=h8EymtbYsefz8eybDT0+pLtFFjjn0cNHRrPKBJPdHk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AlOSLrAeIQJM0nB5CBdPCG4u4h3FotcrW1V0PcxsT0dkuTNy0/eDJ9lDKczZSP4vZIIzq9uk/YjRS5GoMRFuBf5lW1V5ezP/RRVohGx+uvnsoebwABYqnK5IJ+KQpZoDtsDAfLicvs44bS+WI3NbZMYqLFr1RrXH9RX5B/R+1u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=G1oLbn6T; arc=fail smtp.client-ip=52.101.53.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="G1oLbn6T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmxis/zNawhDHyKwiqz8HAiNxpH7+zNzD8Nis8OxEAPbrkhLCz103FzzMO7EyNzaWrBQFoCvg1Bt91MgpMHOWzI9Gj8Tv7SjerysR2EMcT5TX3w69UQMMaycyHUgsvTM2scUV+0L4vm0KmZRFKZwqdF4cfOqaUfXvo7ndJ1aV7LwYQFKCkKv/hXENj5NVCyxv8HfbfSm4WhWVObq17f8p/vEga+7ecF/LBVwSAE+BwLKIpZByLUw9d7LWr4zDbdqSazCC3JQtTyz1qAoqejhccazYbsX6LlmV0r8S+UxWqithnvIAcGa5FfQ+N+Y6SMDrzOIftxDVqFhvVv1N34P0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xf5X065ReSVajiDXnu4qNzcMlVH+et5ZYvUKjhvP7TY=;
 b=cVjxfjA+V0jwxDPPhDeVxO1LTuuaXzWjBMe4vS4CV3yegSp9R0gSaGiLOhy7e1gO4hSP7YexH8zxlNVe2QJeh15cfhrG/aCH/5lfKLfNsZMxZ8LTgxCgUMnHA4xDmSEP3Qji4w58fk4yhUhhpWgaKhaS0a+3fes9v2AlBHFt1OKI6MNXdm8V7vtSsIPRPaUuDiMoxhzvgxv0xSsH0ofWADri7CjHIUlMIWyGJKIgrx4DX4xseHkIeS9LLdgLTxcxxGhB9lTlDYc2oWWc4C0G0LGxgGYmE+tLTyXZ+McqiasNJsIsFWNd5+qZZ7x7Xg1i5MtcEVM+ZO9emFILt1wpjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xf5X065ReSVajiDXnu4qNzcMlVH+et5ZYvUKjhvP7TY=;
 b=G1oLbn6TWAprtNKP9iNdxVW/hvV5xku4pFF0cQeOJcQN8EY6v1TZBCg8rV2Xj0IeM/13NbBJB2y5+HLZkkodeSdjJngtydPbiCkMlr3PShZYCkLn6W2iMvYtA2r3XQy+fCa4/S4Qw7SFvqhNGgJFUxFYQM/KfrPXNxAr6pZr2y8=
Received: from BY3PR05CA0033.namprd05.prod.outlook.com (2603:10b6:a03:39b::8)
 by PH0PR10MB997616.namprd10.prod.outlook.com (2603:10b6:510:37f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 05:46:44 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::62) by BY3PR05CA0033.outlook.office365.com
 (2603:10b6:a03:39b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Tue,
 7 Apr 2026 05:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 05:46:43 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 00:46:35 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 00:46:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Apr 2026 00:46:35 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6375kVv51968249;
	Tue, 7 Apr 2026 00:46:32 -0500
Message-ID: <62dd6a7f-7a5b-4939-a18d-8b763f6e8f9b@ti.com>
Date: Tue, 7 Apr 2026 11:16:30 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] ti,j721e-system-controller.yaml: Allow
 audio-refclk as clock-controller child
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>
References: <20260330094459.128648-1-m-shah@ti.com>
 <20260330094459.128648-2-m-shah@ti.com>
 <20260331-flashy-hilarious-whale-6e606c@quoll>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20260331-flashy-hilarious-whale-6e606c@quoll>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|PH0PR10MB997616:EE_
X-MS-Office365-Filtering-Correlation-Id: 96bb3ffc-2460-47f2-a418-08de94690cb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	M9E/9zPQHEac2QbcfH6sn7pWEM1320p49IV/Nao6M4fTe75tHT8E5T//ASvFuDII81f7r9xbBDVezoFJInvG59jE3fwPdQo2SMjxKJXjEGPVy8Brd4IBCbTtHXFm0dLdSMGpMp1uBAyzMDBwL6SumIVsYzkjs2ko6yx1o5UaU+2jbpXxyR0Q8j6ZjIXEYbUPDzzPNqZ3Hx0kcCoESWy+9qhgRMvpzzzILgWggliwpD70JzTNbvZW2HhTSCUHq27g/SrzE5c+oI+Rvm5AnT4p1G0+TxYYicvww9OjpxyT5QAnmvGJXWh493YCHmIAb2tyqlVJiwMgiCgRPphhsGyI6Vfj3OkgriRIgKnzPx0eH8+xweccdFimrTTMqpfbO4PkUpcg9AxVpxDJ0Y5G6JlghLvzksLQTHzvdaQSd5JxO/1aO6TWDijKIcA/fbstutUlPF+CNZuNxdISLxLC3AGtLKhJqodWVNPv/7foxgXitihHvEUOURsZGd0WMNepP6KX3Rrm9iA6wYLODx1N2F4wZqE9ypL7ctwIm35mqWcVm245ETD3P04zT/6KksnQpgzSVWWHhWNHGV3gMPNEK1FnSSwMX4SCJot0d4fh3j1/6TJUIHrE8uJRaDPlVjJAGV8wHM0bEH6zxZuIXWx6LrfS9rhkf/o2JAi5g2rb/6zlrN6mSZNqeMolQFUch4Be0VpO6xFF8RzGiWr784uVgsgEGCbyYTkLhzzxmcSj6KySEFNk7yHCCD1hZshoHqs8rWRVNJR4nuwpjd8RJmuXpy+jZA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wK+W1+j+WrsYR2LT5mnocaZ6fs3YXyGaOfET51rW7tcwD2NtnkH8cWM8Ihf2+JTRy0kCTsw3TZS+nJNXucSMzCiqYpjVKmjxwNx+Nnu3/eZBEtfwwbjtbDt+aFplxKeSa52CVXgDkSfsu7aFwXIetT3a/2yrqEm3Rrz+DJLUcW2BQdDfG8Fgubo/zicKqWKZ/iZejez1lz79pdQuHjMgMC8/mWJDPle3CecI9N2z+zIlkpCnEhXjzga9+f7woXDG+bhRclpx3KSoGHcBpGeycxrp99AQ5ikO2JYwk40iBWEG3cwDNY62RK0clViu56D+aOoH41rlJfM5wgzUygeGQfqUCsGAXwg9Puk6FeRO/q0hsa6g5T6SSQuF2Gnu1J82avH5peOe0xyMUTRknguESeDfH9+YEr+vDz6akpW0agzw3yxgsVtMGwkd8vqW6Mq8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 05:46:43.7203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bb3ffc-2460-47f2-a418-08de94690cb0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997616

Hey Krzysztof,

On 31/03/26 12:39, Krzysztof Kozlowski wrote:
> On Mon, Mar 30, 2026 at 03:14:58PM +0530, Moteen Shah wrote:
>> The ti,j721e-system-controller binding currently only allows
>> clock-controller@ child nodes to reference the ti,am654-ehrpwm-tbclk
>> schema. However, the system controller on J721S2 also contains audio
> J721S2 or AM62?
>
>> reference clock controllers (ti,am62-audio-refclk) that use the same
>> clock-controller@XXXX naming pattern.
>>
>> Hence, extend the clock-controller pattern to accept either ehrpwm-tbclk
>> or audio-refclk schemas using a oneOf constraint.
>>
>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>> ---
>>   .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>> index f3bd0be3b279..d5d84a8f1257 100644
>> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>> @@ -53,9 +53,11 @@ patternProperties:
>>   
>>     "^clock-controller@[0-9a-f]+$":
>>       type: object
>> -    $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
>> +    oneOf:
>> +      - $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
>> +      - $ref: /schemas/clock/ti,am62-audio-refclk.yaml#
> Alphanumerical order.
>
> There is no ti,am62 in the top level compatibles, so why am62 is here?
> Top level has j721s2 but this ti,am62-audio-refclk.yaml only am62.
>
> Best regards,
> Krzysztof

The "ti,am62-audio-refclk" compatible refers to a shared audio reference 
clock IP block that was first introduced/named on AM62 but is present on 
other TI K3 SoCs as well, including J721S2. The compatible string 
identifies the IP block, not the SoC family.

This is already an established pattern — 
k3-j784s4-j742s2-main-common.dtsi uses the same compatible for the 
J784S4/J742S2 audio refclk node.

The ti,j721e-system-controller.yaml binding (which covers 
ti,j721s2-system-controller) already lists ti,am62-audio-refclk as an 
allowed clock-controller child, which was updated in patch 1/2 of this 
series to make room for this node.

Best regards,
Moteen Shah

