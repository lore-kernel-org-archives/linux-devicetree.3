Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013022.outbound.protection.outlook.com [40.107.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A6717A300;
	Fri, 10 Apr 2026 11:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775819198; cv=fail; b=urIcX02pRu1juwOMMbXfoYSERnGm4ZijByh2ZrpO+YK1nUK18urwlEyr0FXHIzRTZ1f/tENhcAN0+wyud0Qth5DzHCtFxVioAZHuMZWTsDZ9FercPPNwiJp/w53pSXVwMlH8dHNB9kQY8FoMNFPIG0kRGUHNrbBKLI7+fozmVPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775819198; c=relaxed/simple;
	bh=o/yLz/XnOHK14HD+7/bGSPSNULxgIBCUvCp7wjopcfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u8L5yS1jkx3A4pH5fs/1LmjIWSZhAxtr5YGE/qwHivxQXztZHO8UhZucWSzMjKW8D8RP8DxgXLunnNAUmxZt7RTAgrLuGvD9oHuPjDhB4FnCMLpr0HKXYlW4diengotFa5p8DLQzDYnvgx0SShlo8vrDnBTQJDfoNY85Ppx3l2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=J8iByKcO; arc=fail smtp.client-ip=40.107.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="J8iByKcO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKwyhDsj2B3PQmvIwYSv07YFn29uVl7JM5nahq551LEY4fh0k7AT6XFH3Lr8/36J+kHPxlRygscKYr1RBJdPCkZl6Qrmscv+CZl7tZT1EZWh36iUiModkpbDjGSzUeQkAXNc/n4QK58OxlMoT6cnK2n4VbJDIGAiB3HuF2RyAoMBcDuV/RZYmQgI6Sntb+ckZof6giEx/qwB6q+o5ywwc3ftGFsJaVKsFi2l4hQpI1NoiwFeH0R864MEV5AkWKxBhgp2QuBBNRO3AJ9fpSZIckB7/ZY/xVHMwiu+h/7C/GI0Yv0hRY/SeABZ5frdWdu0bDluD4YguBDdYlB3qx9/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6Pe1VIXVggxtokPapnGQtptDpXYLWzTZMo6ijQ+n4M=;
 b=oP4//veeyPbclVHvZHDkbVuoup5eII31XjTBr9iFuy3flkJLc7ll6vud2bRDSLmiEiPoa5d5wiWAlopI+BZvYb75JQRmzwPLEjoNkaBqL4HWntT6SX74emaw9Evow6sBSTGYimrfmylNnwJ2dgws7VR6Sen/iVtHHAANB5XHulJGj6c+kFOuXaBh/QTf6ckq1Nxduwg4tXVv+Zp8zW791bo56I3As+E4nJYqnVLLWnc+HEAJ/dKStyAESAYZ7X3uwHK3HZXsDjlKB1p0LQHxbzGf7Zgfow4MAc2meY2VVJd7zcw/9yAP/tVWH1JTdqiENSY0mY85lDW93IZZxXzfUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6Pe1VIXVggxtokPapnGQtptDpXYLWzTZMo6ijQ+n4M=;
 b=J8iByKcOn+EqvBcQc6/iQmgsk0qYRwmnTNJT/N6IbhJ9jVj3gCUstjsu4xTKsbGZV4iMbFZLDyjzvKrSd/E8GtJUrYTvLn9+Nn+opjpWdPonJmN1YmD3JhBNR9goMPJaYopI/t+cb3d3FNFKgzozmr9R3nXsIg3aBzoqgC2L5X8=
Received: from BN9PR03CA0452.namprd03.prod.outlook.com (2603:10b6:408:139::7)
 by PH0PR10MB5548.namprd10.prod.outlook.com (2603:10b6:510:db::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Fri, 10 Apr
 2026 11:06:32 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:408:139:cafe::ee) by BN9PR03CA0452.outlook.office365.com
 (2603:10b6:408:139::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 11:06:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 11:06:29 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 06:06:29 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 06:06:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Apr 2026 06:06:29 -0500
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63AB6Omw087182;
	Fri, 10 Apr 2026 06:06:24 -0500
Message-ID: <1899be45-56b2-4f22-a090-a6a437e4ce1b@ti.com>
Date: Fri, 10 Apr 2026 16:36:23 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: display: ti,am65x-dss: Fix AM62L DSS reg
 and clock constraints
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<devarsht@ti.com>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<praneeth@ti.com>, <vigneshr@ti.com>
References: <20260129150601.185882-1-s-jain1@ti.com>
 <20260205-spectral-dramatic-jellyfish-cec4e2@quoll>
 <4b554339-95e1-4980-8899-57ba637ba80c@ti.com>
 <7b3660cf-cc5a-47d6-9cc8-362544cfdb37@ti.com>
 <bb9712c6-a8be-4068-b549-96a12bc55e3c@kernel.org>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <bb9712c6-a8be-4068-b549-96a12bc55e3c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|PH0PR10MB5548:EE_
X-MS-Office365-Filtering-Correlation-Id: 947a88ba-dfc3-4dd4-06de-08de96f137b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	3bGk9g7NxJrrSWsMvljljC0NnJDSucpJRU5XCGFq9H3kPZ+jci4X51c8F4fCWZn8gHeBJ5BV9Ygk4r3If4coqNvKuarGPTEEXjcpvqF/fY8LdZBT1IH0guCO7vzm0B7+ntJ2lc/Rhnzfaqk2o89wGQY1z6NaIYAbb+zq8VLe0EiG7TvbzmZyWkCmmEpDzz7NW4EiFKUuTsKgt9oFZ1i3g7m7fb/VfwjKhLV0ShggBavmDixSC2KRiLLuwwk+8RXiV7X71o70DgPzc+YcYmHh9eYeh8lNfh5rvFK8XpGTIw5AnPyrvpkWZpXIpJIzaMxne06cWn19NO9aLcfn/4WRoIQz+hZEpmR934Wk3FO9gWwDYDPIYrQg2hXTO1zOoqNBxmtBLYZCtQDI/sJXoFVuWHKz4WPS6tJS7O6NI/acWn7VmEbyv2v8UjAoBzmojmQ+7CCZcedZO/qVwlOWswzaIhiib+DcNOjmV9bpCrqaeEK0TCD8LQbHifqtXSz6LworvQ5rB0++vC9pewgDYa4ihbrSN8+WlbDs1RojsApy3r0PqKV4lPz5cGPJ4pw/EUki67PUgOt7QGjB2Nr6CTzyLm2CYx/xbSlhjd3CC5IG02oMFZUS0NpZeSFIw1PpKy58GUOraMsKMuMttZ8VjwA681Ls5UxHmFRZpK8WcL0EQnHXOV/CEfzTRxSjWBYmCKXWYn7Y3MSHsF/mefdYHYJnII3OKSfWwAr7M7eVxiMzCBLzEnp9DlGu5D62UJrLLNDaTrIHRuvy2EVbF4Ei0jpqxA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	byvVkSMbQu63057EKH9Ox7xmvlWOXcRDCCehJpQ4+tCQ0UZ+A0guhnX7RTnzLTgeGXzY9exJtIZKeiB6955O5gzUMQgsKt6jMLpBw6hVCHpaa2ISH8LnnoVrQ3pJEJxP2Dufe9oT89Aok8umVY/zAk5Hec6NtPNjSXtmLAaFxS7780j9OgRRek9InxEAPSMP0+ecyn4EjKuVQky9LbAb9cmYcr7cCsWtdxScC7QTxdxoVvl+GNEa7JMkKioP5LGjqNfkAXCV7UOLCHGMgQoLYf00b+5mTtZviwHYZo2nZk2A5npSjH0+/30xXy4/mLKOcwhyA2JmIYNijwnHO9cSo5HF4hbGc0g7IVSVvbpdL//p9JyfdFPKFyknFOoTIdxoAOWp/fzPny3O/ykkgWxSbj8tVlDvUhiHLlaVxj51C8xoZaGUDgeGGNQLs3ck+lRi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 11:06:29.8000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 947a88ba-dfc3-4dd4-06de-08de96f137b6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5548



On 3/16/26 22:14, Krzysztof Kozlowski wrote:
> On 16/03/2026 13:36, Swamil Jain wrote:
>>>       description:
>>>         Addresses to each DSS memory region described in the SoC's TRM.
>>>       oneOf:
>>>         - items:
>>>             - description: common DSS register area
>>>             - description: VIDL1 light video plane
>>>             - description: VID video plane
>>>             - description: OVR1 overlay manager for vp1
>>>             - description: OVR2 overlay manager for vp2
>>>             - description: VP1 video port 1
>>>             - description: VP2 video port 2
>>>             - description: common1 DSS register area
>>>         - items:
>>>             - description: common DSS register area
>>>             - description: VIDL1 light video plane
>>>             - description: OVR1 overlay manager for vp1
>>>             - description: VP1 video port 1
>>>             - description: common1 DSS register area
>>>
>>> .....(Similarly for reg-names, clocks, clock-names,...)
>>>
>>> allOf:
>>>     - if:
>>>         properties:
>>>           compatible:
>>>             contains:
>>>               const: ti,am62l-dss
>>>       then:
>>>         properties:
>>>           clock-names:
>>>             maxItems: 2
>>>           clocks:
>>>             maxItems: 2
>>>           reg:
>>>             maxItems: 5
>>>       else:
>>>         properties:
>>>           clock-names:
>>>             minItems: 3
>>>           clocks:
>>>             minItems: 3
>>>           reg:
>>>             minItems: 8
>>>
>>> ```
>>>
>>> Could you please confirm on this?
> 
> If there is no common part of each list, then this looks correct. Other
> way would be the example I wrote ~2 hours ago on DT IRC (different
> patchset) - so the qcom,ufs way. It depends how readable is the final
> schema.
> 
>>
>> Hi Krzysztof,
>>
>> Gentle ping, could you please confirm on the above design?
> 
> If you do not hear from me or other reviewer for some time after asking
> "shall I do like that", just send next version implementing what you
> think should be done and mentioning in changelog, that this is how you
> address reviewers feedback.
> 

Thanks Krzysztof, sent a v3: 
https://lore.kernel.org/all/20260410105955.843868-1-s-jain1@ti.com/

Regards,
Swamil.

> Best regards,
> Krzysztof

