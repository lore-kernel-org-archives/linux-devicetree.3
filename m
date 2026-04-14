Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013020.outbound.protection.outlook.com [40.107.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEE439768E;
	Tue, 14 Apr 2026 10:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161211; cv=fail; b=T7cX++lsShCuW45G7JYldiaTLeVacqWCfF7OYi+LaPgLD3OdPAALSboWVNkDzRMRmkueV8SE3i8iDH04L3oiQ8sgkYmabZgYTwiaoEQt0raesIoyXWITubdjqtAETWdVO63ze6DlRIOAyZvDmLjC4foxai4il3DKi1WGvoxK2Ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161211; c=relaxed/simple;
	bh=gbxDm1rBFDRHvMN/n2AUco8PLOLvfb+ypyF1bEYAeHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=INLYPZ56THZab6ueBHw/EXudWVHQ3Q7rkOZXIOMeFeKVt+HXOO6gIiY/c2/nejwIhCnS6+bjgMhZPVoeUwAedj1zlnuHZBmbTGmhnw2EU1v7ypaUcC2wG0Z3m0cFlbTdEKFMsPkTfs+ftjLyZnt4oBfTVaRNQjL3uJVDhR05USs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Pqw0W08J; arc=fail smtp.client-ip=40.107.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Pqw0W08J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i76p1t+VAlCyvalZTpntD+QbYFOa4j/JXDgZiOrAqftyof/61Jvr3mOEHEbCqPCqLD2MsM+0nz4EAkYzEhHrNMzNXl2BC7I6BBZsHSuugYjoTPkT+nuLHX976PuKwilo5np7iKo9Q3/LT+C3XrUjULFnBScedcOpRsl2AXYMkCJzl2tIZmTdGPFKm6PB0SgE56Lq89h/VEWWKRFiRszBv8mtfzMOVT7/3Xtkp0MWJyrBzMUznJcFcFYFjZiUsU0rWMLuVsc6KSyKOOGesnJtQd3GkqNuCq4tYU5qCjJa3HPkcsVl8xn9GEQ4oDl/s9Yjb7BzPMgtx97ujCUSa9diPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UGul5mEUK4df3X31+iTBjeWfvUc336KDxRxdsevHSM=;
 b=tdDDOlUWXkGETICpAj8Bga4a++aJUW7tcbvJ59oxfOmkVJ9Z2k08bVc/oDhV2GDVp76jN30EmQzFC8r9yrT8rLIK5eDlwIktOcY8Yt7SSla1RuWRlA/uW/XfAOFRw5qmvRGagrz9hkye9nTr8QU2LOO3zNjHcOGGHe3l8XFHpWNzUKnBorVXdtSnyEGUxD8syCobxMmlavH+/p9XA9oWBUQ5BfTu20O8LMUlCp7Fg9EbJ2HBxzJY4s9gguNndLv0IEkTrT3HdItiC0X8fzkQ/jwHU05ENuTufh+ZJ+PioGVJvXRYDSq2WMT2KyQI5zHyKLRjk7f8uCCXJh5eFfiM/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UGul5mEUK4df3X31+iTBjeWfvUc336KDxRxdsevHSM=;
 b=Pqw0W08JO9G3oPDb3wSHew5vsE9GwKePptTH+vXu7rc1pfGesZsFto3qxDISsbbEV8ixGykrH35wU1RHjw+QXVPqg4WOWfPTrZd6J+5b/nFZfpa3e+Tjq1oNjM3GoWS572NcvEHIRS07zi6mVVY4rfKOlyHQwCtieKLaRnlYgOk=
Received: from CY5PR17CA0014.namprd17.prod.outlook.com (2603:10b6:930:17::23)
 by CO1PR10MB4772.namprd10.prod.outlook.com (2603:10b6:303:94::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 10:06:46 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:930:17:cafe::66) by CY5PR17CA0014.outlook.office365.com
 (2603:10b6:930:17::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 10:06:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 10:06:46 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 05:06:25 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 05:06:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Apr 2026 05:06:25 -0500
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63EA6J4M3819006;
	Tue, 14 Apr 2026 05:06:20 -0500
Message-ID: <15e0c84e-b4cf-4865-89d0-0d5caf1537c2@ti.com>
Date: Tue, 14 Apr 2026 15:36:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: display: ti, am65x-dss: Fix AM62L DSS reg
 and clock constraints
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<devarsht@ti.com>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<praneeth@ti.com>, <vigneshr@ti.com>
References: <20260410105955.843868-1-s-jain1@ti.com>
 <20260411-resilient-tireless-centipede-cd6fef@quoll>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20260411-resilient-tireless-centipede-cd6fef@quoll>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|CO1PR10MB4772:EE_
X-MS-Office365-Filtering-Correlation-Id: b8903410-b79f-4cdd-a907-08de9a0d8998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700016|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0oQ1A+gY/oq1/mdMJWijMsDIAGcPJItqvA5p4Uo22OydQNEATq1/gJyBZjoQd/aPDlasL4K1ZFjEUJOAQzh5+33/U03IGMB/WiYAyISS2vMNnddVUm5Xmxfu1Khb0LjfU8zYy9kMFACZWCG6daByZ+gr6flFWgDVLz32aipSEbtHdeCHYrmLdH7UvY+6w7z7c6sghj6QCih1UKybNI+aFaEAAZS3ceKBBEk5balRwGmRuycCv23xusGgJxvsKaFMhepbKUrghJHlzPYCYmZHbmlzY5RFWbe2Gpe1HhXRIZQeeps+0TXaCYDddP2wcZkRQPU44NFoLrutSeS+9gxJzCZWUm0R2LkYQAqwkt+Zp+7LzWDQGA/kGkm2/96gZQLsaDqAYEVK5u+uqalaCjWicXOIAP/u0y7/eoa69WcDCjnJwu/MjqXll2kOjWCUFgNp78kR39mNhK1iuHyTbSFfuVG1HhAfhqBtcFoURhKMK1zJX67hVkgeyT5i+2sakbVbRukjrBjyTP56r7b778gE88QIXAKxFNw1PgTzATFrsJF3Cr21UVE8+NKwIwrYWOj2bxOVRiObuRq/y8P5D+qsP0Vy1a1Dm+1fYzLr+o2+TXUO2bSG5+TkU6AiHo6yuiGhLzt+XBc5A9bPCbKe3Nrqf/xqHUyDT9bm1b6QI8l+VlthLGIfBTtcUJA52B8h1hHPIWE35xnEV33DAROxgdK7w699E4CvpZrG2WrGQTHTTiIqokyggkh7sohjayk1u/ppBvNDCGJVMOQx922ayYpBsQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LD8yWjMWVLCUl5Os8xAmPvod0TeW0ehcbEgevIIp1YtvO1jh4fT1VosN3yE92mMFJJDJr6dLKF1NSgf60nii2xAEzlZ+KLlwn3V/75IAezAI0NpgxniRQncJZj0PCTum159ZwzCnRFxAl7rEfyuXYGcj5johhL/pkYeqd0K+eWjt6Qtz6dmAINlOzxAAHCzi2E2uw1owrkoohtOiOE3On/1lysH5lRjKoIeMPuDKdq+XEnh7rb3A67IsKsphYY1+V5OQzfaxTsgE0nWtcz5oKlR4sq1wQyqxuDiB/co6x5vmP9E5D7vJmW02Ode5XRWu4syJHHm6sRYBBhNVpCCKckxiw6PKrnQsMNz0uH/htFOHOuu90W8MAW/zjhMvwjJnl0a5JpoZcBHu5msbOBwEn9GoC+AI3BlL7V+UZKkDzlvu5WeOY7JJ3VJPmNmzS1Ga
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 10:06:46.6009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8903410-b79f-4cdd-a907-08de9a0d8998
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4772

Hi Krzysztof,

On 4/11/26 19:37, Krzysztof Kozlowski wrote:
> On Fri, Apr 10, 2026 at 04:29:55PM +0530, Swamil Jain wrote:
>>     clocks:
>> +    minItems: 2
>>       items:
>>         - description: fck DSS functional clock
>>         - description: vp1 Video Port 1 pixel clock
>>         - description: vp2 Video Port 2 pixel clock
>>   
>>     clock-names:
>> +    minItems: 2
>>       items:
>>         - const: fck
>>         - const: vp1
>> @@ -179,6 +195,20 @@ allOf:
>>           ports:
>>             properties:
>>               port@1: false
>> +        clock-names:
>> +          maxItems: 2
>> +        clocks:
>> +          maxItems: 2
>> +        reg:
>> +          maxItems: 5
> 
> Also constrain for reg-names,
>

Sure, will add in v4.

>> +    else:
>> +      properties:
>> +        clock-names:
>> +          minItems: 3
>> +        clocks:
>> +          minItems: 3
>> +        reg:
>> +          minItems: 8
> 
> Same here, please.
> 
> And if you are sending new version: they should be listed in the same
> order as in top-level properties, so reg, reg-names, clocks and
> clock-names. (juging by the diff)

Yeah, sure, will keep the order. Thanks for the feedback, will
re-spin the patch.

Regards,
Swamil.

> 
> Best regards,
> Krzysztof
> 

