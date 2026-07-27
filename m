Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BFC3EDAD9;
	Mon, 27 Jul 2026 09:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144967; cv=fail; b=BDoym13A/bXMaUV5mUafyYAQAJxv1rbIyLAs9IqP1vh+H4wYuFsgRN4yiBaCsKgy07JpewWz6d7egbt0ZHCGFvC10XasAE7QEmqSpsnj5h5VjuPpNBrLGj/mmorYpfualqXiScGEqZIl8kHhNK7gljbv+vkluIJ2YymOfGqZ50c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144967; c=relaxed/simple;
	bh=45tY2VNXAVG5ATC8kf80WTbqY/zzdRlhAKoMlo+Crwo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=JHdVojMK+nBipS4gXla6/Ovir2A3nOHg+0/pEMc2NpheKFF55UYqWuL3XcU1nylr6OyxB7PNe/aU1tzabKKqpS7IfPaw/8EftXNxZ0OXS6e9Fpr4GY7aNQB94CuxLKBvYp9C47QI+6ypSLojVPWuNdFYWIyK78r9HYiCqHJcjz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=fzus50eK; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YG77JCDJ; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="fzus50eK";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YG77JCDJ"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R9Pvg9768504;
	Mon, 27 Jul 2026 04:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=45tY2VNXAVG5ATC8kf80WTbqY/zzdRlhAKoMlo+Cr
	wo=; b=fzus50eK3nZxogF9yUawp+JHsdslTj9UFDOz/d0F1FZ5k5J0fW9P3O9dF
	EiOiViclGoXeaIoNnsnUDQzO+fy7fJb1+3QAS9Tmc9+9qtmIgOseJ3PQ/dEgfLc/
	GO/EZHgIjB8eAjUOFH5j6GcFccCtikgZwFZUOHgA10XhwOOWyXCZnpvvPiFiwil9
	SnXWTclHgpBSPJb1tQN6wbbYgdWU59qg4Nh3uAKDZHzC0AxmHvbgOcarSHHAh1iB
	kzFFS+DYNzNUg/6DTkDJdvxoRB/w4TQH64u52U1JZAj/31mHKibtUeWcAJLxT1o+
	cP1556Nw61+IyDYzITA1YM1jLg3sg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011045.outbound.protection.outlook.com [52.101.57.45])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fp4pp01f9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:35:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwcCcjCnlJHZdiCPudutR2KhvfnrgPINbl65i+wjfZ2viZyU1cdwyw1K3i+wNLr0ixktMEtMsld4dDPqWJvyxuxILXGAsM6nRzLw0NH43jARovhR8faKBDhlRK4eOvvrM9/M8B4QtCPIDcT78i2s/ZhLTi6HCG6IDqZ5+iyLusf9b92PgIqfWznUuZEycN/mUkN+vU49SDa4sTiN1k0wzxspb2cMF3YoZ38Xk0ie5ycYnbC7/0Baae/y7fFan6XXwSgEcDJ49mR+jtREMUX/zPAZY5KTE6v4IkHGCQ9Hz7/V3kOzdk3hSwvTS+9Y1NG5guFaLVL24Pyz74MPVTwtyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45tY2VNXAVG5ATC8kf80WTbqY/zzdRlhAKoMlo+Crwo=;
 b=ujukmbCOefdQdpdW7G35L/PDhszZFuoFNmdkK8sNmz0b9sT9SwOlqDM0sCTiIHv5Ur/qpVTKUKm/IJaWOVlbqUjoHyY8YNb5CLrZKXyRp2sn7xA7qto/TAbGFIomODMx+tOpvgUHwCc6V6SGxGFP78nHqK4witp9jIo/sHlRQbJogJONOziUzLdrprNm8HEVjUVUlNw1JsA2BjEwC1tdxua93lUiTabA7zMiGp6lZXvc28ov5dOOSNSKUzlX+RcxsKGXdQWdO1UvQ/BXTf3NufA29JKGEiBDqqhSWPA/VhET25YKS3CdP4/afbTXKesOlTij6cYI4nhIxHBAXOU7yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45tY2VNXAVG5ATC8kf80WTbqY/zzdRlhAKoMlo+Crwo=;
 b=YG77JCDJsRuX/Njj1U1Dl+2Ik8uA0ter8u0aX2oRY9toxWIOAsd8GUpwXe0ZyzXceK6AqPO/kI7RQqOJBjqTMUr51nzaLWyDM9tjwoYQpUX1/PW+cy5ebPIYAAVQFI32zQz/fG6L9zRK0DiUGU3+3C+FZwG/cSx+fDV10B7phcY=
Received: from SA1P222CA0078.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::25)
 by SJ2PR10MB7708.namprd10.prod.outlook.com (2603:10b6:a03:574::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 09:35:51 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:806:2c1:cafe::8b) by SA1P222CA0078.outlook.office365.com
 (2603:10b6:806:2c1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 09:35:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 09:35:49 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 27 Jul
 2026 04:35:43 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 27 Jul
 2026 04:35:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 27 Jul 2026 04:35:43 -0500
Received: from [10.24.53.154] (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.53.154])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66R9ZdqT848741;
	Mon, 27 Jul 2026 04:35:40 -0500
Message-ID: <eac428f3-fbab-437b-a881-e0d333de8360@ti.com>
Date: Mon, 27 Jul 2026 15:05:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] dt-bindings: phy: cadence-torrent: Update clocks for
 multilink SERDES
From: Gokul Praveen <g-praveen@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "sjakhade@cadence.com" <sjakhade@cadence.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "yamonkar@cadence.com"
	<yamonkar@cadence.com>,
        "Vadapalli, Siddharth" <s-vadapalli@ti.com>
References: <20260722061831.1045884-1-g-praveen@ti.com>
 <20260723-venomous-nuthatch-of-inquire-dade7b@quoll>
 <0b8a91f0-8a2e-4dfa-aecf-acb865442d53@ti.com>
Content-Language: en-US
In-Reply-To: <0b8a91f0-8a2e-4dfa-aecf-acb865442d53@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|SJ2PR10MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: 78fbabaa-9070-4153-e85f-08deebc2718c
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700016|23010399003|1800799024|6133799003|18002099003|22082099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Oxkfn9NyDTl7lcPWfhtPbIMfYy513HQRGo+srydIA+IezNObzyHk6n/KWpPgWG4152NZOo6gm2rNoAMmyUDG3JotERArx7X3TWC25NlJNmHt0ukWQx47iDXLZUDjnh4duMby+ul1bOarb8GPcc2/iyDnqMFyenZt6vkaLTvtiPl3my93Rp+ik8nS0xMuVeXQisTchDAQFcUCTdxgZHM1QRlyqCvQiAzSbECvs2fo4wr22U961tCf8okwJFBGHYKnvC8aL+9iIOhg+vvPwWzXVtogLHcws6aVRd1hoS1EJHIOQlAbVtOuzntOfkshnFsJwaDhckaW/XkF0IYYEi4dE+zxcndYojofYxEKyl56RBTMe+SdtnIoW29HDP6c9gpQk0E/KShbMgpA//qksdFwvjHy04V5Qzbw8qndS21NpapQz8q3rwURo5n/PTIdlcTyvI5ZQebADVJGR/csrsR+/FM5R+la1tO2t97gGM3eS2iaHYXRF+pm5rhxBZXcNY6DcQ/3ZVSctn6vN7LZLRuDADTIugqEbFEqTvDYTZbK9asR3QA+eh6ANVP41weW/IVfVjVq9nFVX8dJln4pAiJqnYi/sXLL4CDbfB/SBl6uRLEOtGK1+QPnOqPW0N5MfpK7+UOOaHnhPFEcVexwq+9AISoJ7DIozdL3FoPaNz9tQFGJoDD33j2obWqagGu0MxNZVswQV2xhlIiF5AeW+qZ8gg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ftyQHIlYFGgwVGB5BxHc+O/E5bqxmY3GbJqtBcHHUvPuAPqWy5NYDbokuhbqckXwUkHaKF/eoUlj0cbrh6XO4ieREKeIAJ5SkQxNus0pmoB87idqpSHhglIC00oSa9m4Ld8br+nsvNvxLC6jChmdt9AFa0mYvVzYdzBSN06MCIoYKIGpxdwPCBCprjSnw+9GpvGjXntA9glEnpLhFohv5Z6qibks1zZnB6wVmO7/1s/Dx8WecPF1DN0JBQWH3+Y3GSY2ebl6JRnAqDdKi5eUVJYoaqQvSvPbLZ+sONvEmaGptS26tfqtHeWkimTuxNL/hb23nO4Q4ZqpahnzVPO3k7lklGAeM3gps/lPqOu0LsnfliCeEAXkcXCdxKPdxgpECM4cEpTii/l5x5d1dHBzC1LZAMFc3zOkcXvqK4usTaQhb/OM92tda/1ZqB56ZCgY
X-Exchange-RoutingPolicyChecked:
	lcOiD9wuzm1ZToolVWNwoCJMrl+X/k9wEqZ67bpC6v3IOWrhqjiWbHx6SfkceedwBbXNA4+QqHBUiXeFnfMEUPlkLj1zO1RjJ6Oxsw06LuIFANZ5lG3y+nBSuO1KeHBed6+kglJNsKv5EyUhTd7XYH5z/q4JOtfWCo8kCUI1AL1rKx8r6u4XFj4VcHwLFKJuhFBeLL7fxC+Yc+0AhR4Niz9esKmlYchLUI35mGO8xjAG48wQ5DNGbj7grv2QVUXNXsW8zrNvbfkOp6I0eE5bbYvQPRL/9yydrgiVDM+UVMQILX1ORdvAlWiit2iP3muycCYmyUXksg6o/w3q4re5kw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 09:35:49.3735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fbabaa-9070-4153-e85f-08deebc2718c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7708
X-Proofpoint-ORIG-GUID: oq-o-P8B66fKGW12mz7bDcmTiJko8oCc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5NCBTYWx0ZWRfXyF7ZSCELie5I
 drNHR0vr7R82xQdrVvUYDfsiyRcXxd1iUxlV3QtM8Vc929q6tkfZDMtIfxBWqrbX45blesyd4aA
 WqXpBHE69KOliU9bV/0m6rrisbXz3i1yahegPk6DiAVEdKGpZwRlJ4foDrgpNo5goUIV3keDYE/
 mZiH/zmNbZzgjwolKyiiiBeYksVIOrynQp2HwBldph2onG9pmzNS6j/yzBCw2iJaK3HlQ6VSFDv
 OwxBE3rYHwxbpdj+2pwz0Q5qQkYuws47wynrQiVPU3qiPzdNoG5L9CMfv/vdlB9Kzbli6Ntdldp
 8PE1bz6h4LlCE6qwxTe4pn4Do5aY0xYA7kiXhuG4rYtupxMp9omHciS8Td8G3NyHtEfK45+w32r
 gsv5UsczpxWMcUIuJ83+nZWmQRG6c+PqfceMtU0BNmwDUjmqlZiBh9WnKJptgLcmg7gJL/x8EQ6
 1QDuJ3q9QBH5sBZlkhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5NCBTYWx0ZWRfX0fDOdQ0YrpPT
 sfGEAZWTkugnV7k/RlVzjC7qu6Mma7ijF5XR2DFGSf9Lj036JaCcoECwbpkbXo0Rc/Igwy3Awko
 RFn4ebYEdCLALH0zIZHkqKzKPxDhf9A=
X-Proofpoint-GUID: oq-o-P8B66fKGW12mz7bDcmTiJko8oCc
X-Authority-Analysis: v=2.4 cv=I4xVgtgg c=1 sm=1 tr=0 ts=6a67267b cx=c_pps
 a=n4nuXP1CjkzMzYAVBY1Wsg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=281WbK9POChNeo4cQIsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270094

Hi  Krzystof,

Hope this clarifies your query.

Best Regards

Gokul Praveen

On 23/07/26 15:45, Gokul Praveen wrote:
> Hi Krzystzof,
>
> On 23/07/26 12:45, Krzysztof Kozlowski wrote:
>> On Wed, Jul 22, 2026 at 11:48:31AM +0530, Gokul Praveen wrote:
>>> For multilink SERDES configurations where each link requires a
>>> different clock frequency, the SERDES provisions an additional
>>> reference clock for PLL1. Hence, document it.
>> The pll1 is already there.
> Yes, but the existing configuration has a limitation as
>
> it does not allow both pll1 and phy_en_refclk to be used at the same time.
>
>> Also, the TI variant does it or cdns one or both?
> Both of them.
>
> Best Regards
>
> Gokul Praveen
>
>> Best regards,
>> Krzysztof
>>
