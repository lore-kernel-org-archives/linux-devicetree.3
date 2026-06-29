Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F6C1A6838
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730048; cv=fail; b=N1qNDEqxtG6AdiBq7RyhWp0O3Kp/5zLtOFMYgZyc94jczi7hvC5m6qGsejHOMXez17sDJb7/c+bSbWx8wgJAnN6vrOVvJ7haF2L2M2Gx8wEt8QFMODB4cp/i2tASJp2I0zf+8Brr1uiYnf0CjjnFa2NQEJieYwPaKAMrfxOssNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730048; c=relaxed/simple;
	bh=1dZmy2nqBy/xClsqXM8umixjt1Ot8bvBZ0Xxph0DySM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sxgtdDBfxFuKgIeqCK9TXqyfHrG3AMZE2fMmfaSbYgEWdVMpmmWTrbz3PFuucO/rXmztBZag3pIe7tsOgk7B5R+gcyG5veKbtxrqsuN15oWjYYX9fEKhMkX/T+do0vFWZCNRdnNYQcK2vxytF9OYb5BCDam3CTAW7ncfff8Sy8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=QCP81a3X; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NvT3y24M; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="QCP81a3X";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NvT3y24M"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATK9W1860424;
	Mon, 29 Jun 2026 05:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=hSyr0E5EAWjNUjmnv4pgwlZehzuG2L0NydudLE/pV
	4w=; b=QCP81a3XLCItomwM5XfIKeL7TK3oF+jUG556P0RH2VubRw+/zRDK7LEIx
	orxbSyXjdSOMWbuIWQ7fYpO+bBVhrzzHmGi1+Ob7Vyt5bAnSptKcwFNkUZjMozpF
	qn3RCcx5X9D1PVDCUTZm4OstnwOERy3+Gobxc9E91ja+U/ifZddj3d7+jujMuZIh
	qxu+lb8wsBwqeC46YpYbGUZCNoTtmvy0Os6+FMgogLd5NKLhlUFOf0xLxq0u3GGO
	mKjQBxlA8m12wOe396tiVsO7S8v0xPcrqnz7lB+QJdxqSPmgbL2IiONAy/DXxZsm
	hcsGxKj6udqoeNUDaV6jw1R0wfj9Q==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010000.outbound.protection.outlook.com [52.101.201.0])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f2wnpf6qk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 05:47:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JricxjxW+0O0T5pfOtcoG2i2upQ011fklApAYFQMxvxSjktb5z8z+gzcCb+iNwX1ZWJE0Yy+sQ2VOElHeC5Bca8D7b7/eArnxGzpRgoPxAqVie7txZN7IZHA6ooXJwTM1bnjOpReJmaoa/BdlfUAa0gefGpFC+IdsB9aod3Z43pUYtBy4PbVU0/RCTYw0J6Pc6rFkUbUw0oTOW4KeRQfSXxdSYt6SiV1hR7OY5G/yuDL6H/aEe6LkKqHHANTE982PBqw6VaaviVxumPjE9pSsPlKpmjo5+oOgqzBg7wmj1/l41gvZsMBJoZLDrlr7AM68ku3yiPQdXD9TxV8zYYR2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSyr0E5EAWjNUjmnv4pgwlZehzuG2L0NydudLE/pV4w=;
 b=IOVgyARONCBTxL/JUtK+4p4LrcZ6UlPJaSGS5S3/FIzueFXvFgTtMrm3udrmN//t5yXtKnobRa5Mr0a1fAdoLqn0Xh9sBrwXMsVUhsD1KN1hQDGeOpxudz5SEPF4CUXu3eW4fFNVb/NCJdg/oxiBwc0omsJCdpE5HsoVhvmuOyiSdCudb1PpAD0mK8YtNsNAUeNL9MjhbdP36egA3O0L7k5mWppsXtFXDy6Xx6b77y2FozcXKCvWGCd/iuRVPn44IZLM03ePTwbeIDPduzby026OeRRvjPRqOHgMQyDheaFY9Wxz3YoogY7z6Fa06wB+DTf6CL0WX12SjsUuhj5cXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSyr0E5EAWjNUjmnv4pgwlZehzuG2L0NydudLE/pV4w=;
 b=NvT3y24M5xtgMM6bdqcFe0d+UMyHmVIWhSpzbh7ymhjdE9qGwoSuKil09PzT7kx3efR+W/S//Ii0WRJ+P9naqdbJR5ZSyJ8Mp6xYkFRpfl+mfgTkmE1/aiMjNt5DNKgDu7cKhqQXDzAa50H3FplYuRyJ47SepemK4x4yispgxlw=
Received: from CH0PR03CA0042.namprd03.prod.outlook.com (2603:10b6:610:b3::17)
 by CH2PR10MB4358.namprd10.prod.outlook.com (2603:10b6:610:a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 29 Jun
 2026 10:47:21 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::a9) by CH0PR03CA0042.outlook.office365.com
 (2603:10b6:610:b3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 10:47:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 10:47:20 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 05:47:20 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 05:47:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 05:47:20 -0500
Received: from [10.24.50.145] (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TAlI1a280164;
	Mon, 29 Jun 2026 05:47:19 -0500
Message-ID: <93458e95-c12b-4b88-b3be-4d38105c98df@ti.com>
Date: Mon, 29 Jun 2026 16:17:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: ti: Add PLL1 refclk to J784S4 SoC
 SERDES node
To: <conor+dt@kernel.org>, <robh@kernel.org>, <devicetree@vger.kernel.org>
CC: Gokul Praveen <g-praveen@ti.com>
References: <20260629102308.56616-1-g-praveen@ti.com>
 <20260629102308.56616-2-g-praveen@ti.com>
 <20260629103110.B86F31F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Gokul Praveen <g-praveen@ti.com>
In-Reply-To: <20260629103110.B86F31F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|CH2PR10MB4358:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c592ab-c51b-4090-8975-08ded5cbcbe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|22082099003|18002099003|56012099006|3023799007|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	qMtQpeBa4EnzLOjcB+nuhj0zS1cyFNxsNwWkOHErYvG1u4zf4bqIrSMD0V1xmMYEj1XPuJx1zhMQ3+LeMC37FXMUAgWOsvf9BywSoj0LJAQWBbFyYuvfhEymRlEMlV9lPy3rvIUBn7kuxpEEUdLqOHdjZKOV+m3FQznYVcXxgcxg57DD4PM+IHRfSBPe8wsC7tmhuXyeOPg/dQ0yPcecLvOsSRffYUA3RJX/Ufex/7FO6dewVeFlhbFiyBkZYTwQxfmx78k+4fwxtN1hHCYi0voSzsvCxc6fGVAvFsLRILBpjFDnF0tea4BymGm500iqbTRvLCLBSwBXT9sOsMyplmrJkRfsFoifBFlga/XXTSvyR8lfhNy0aAPXGKw4/mi14Oceb9SNyhE/dfK6g5y/xlY69Xa6K5x7Vv14z4ECyfhMo/NbILD9/PRyhH4EJtujtaE84UR2motuKTdLkPBzfcmNaa7xXefPI5/5UNF6AoRikmzsHfJwsiWGrUA2sefmpG4jAtZbRh9E+6YqCPg7HspQBCbXmxf5903GxyvqqK7Fhr4KqsCmXYfOW7045dd04z2UNazbnhRwcaDMWq5SvrT/B4DcsVqK5tmjKwd2iOkH5MOl9x2IdeE9MLKxGq57/oZc4gW5su6zTHYK7aDCtB0uBuTQR2hJ3WXBqmBBG32U3bvro11WaM93icXfBbzSjjYnMztnlC6qdsL2ucPVyQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(22082099003)(18002099003)(56012099006)(3023799007)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3tPzdVOSiiZkR9ayF8qksOrpvwmJxakeqaNRXI+3GI3rZOkEYPCwjPWTGeYIpG6t+lVPCrsnb37WSfD9fFwAvES59KovIN4KaWIlITqepDoz5KgxewEKF5Xj8OwM8+KxYD21KCnaf3HI0nIVsFTAJmAKN6abzsgc9wWDBe01zBsH6QHeaf0L2OMQMKj7x/gyeYQLclMZheG7JoyS44fm+Ng/ELxw3B8CeDQHyyXevNOIt4D49ZOiPLnIqqDnpOjxKZbeAB5Y34vDRsnX1CPnkTStEEMwadSQjgoAlHestHpB2prEOojmj3EwCLBuzgNj6IJREBa6tMMAHHyfST1bxq8hJRcKJ5CEYgwDSzsdzUWG7HqQrGKmK1Nf0r2yi9+Ui8mHgFMv+3iTTPj5TPz0C0jYGpQhsH6jrFovoUBLrsrZ+I46pxbBu8KDqzyKSYUL
X-Exchange-RoutingPolicyChecked:
	Zd+5fSKw5IuZ3NeGbU5lU773uL5FqIrxdXWnQBAxgEhxPTY/K+XejFOshrliGmZacuSbdzY6+gVhyASKj9ZmRRcjwDno87JiM9FjddwI11xGf2u6JR45m3uQRqevbZe8uLCnpRqKO+gSZAAg4P2xEltgZovUm2z4KfaYYaF2c+uiXgAxDs4JGrImw1kl6KE2BLrhGHnaAKqsLW1gwSgFCEPYymqkNDYIZA3WQd8dTWK+3TQ8ifZzTttGIoHWE1O33HixH5tTFCPeCc9xgCbCiZHvrvYVBD+0ykuwSyY7e3Y5YAVf4atYvY6AOyWhOVc1mRdnSy90azEYLTCCWqriLg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 10:47:20.7753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c592ab-c51b-4090-8975-08ded5cbcbe1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4358
X-Authority-Analysis: v=2.4 cv=QdxWeMbv c=1 sm=1 tr=0 ts=6a424d3b cx=c_pps
 a=0bDVNUKav+K/acou55tioQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=XSAmcW93rSpqjpVliKwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: LVTeFu23TJ-6y2TYGmzk34yLCMRRRCR8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NyBTYWx0ZWRfXwKe2tZ8hSwDl
 VDyn7i913EVeeEN/y6JNW4lE2I5ujnIRpr2R+ace4nCNMbCVhyYYCHZLIM1K8J+k9qY6/ZDgvSw
 4t/XkLwkGBoptk3T0ogdfWN0rRFPbhvGKx3h//9d6k95O6PXyTsxWrJjWehVjxzmLuZU1f3Wh2s
 +YfeU36UCd/3ts2bHB5Tjh63lJfvk6fMLLZL3CIl5cTn2JG94GZvENmvEC8hrYtbnPCe7N75/sY
 hyDTcRZbL0QYh7yMX0RUA4fPBoWI6iUVDx/JrauvHdxd9O3gmTM8hKbbT+YM3W9m+aD5mfmwrhz
 MQPwEc/epeT6e9RtzZIaJVkkeGtww+VgRA/D76a1ZWmbkVts8taJJXIuQJiUmIXHaAJZD8KhBoJ
 MvhrHrdwDQoedO7iVxKQYIPKrP3Z1Jh+cr28dKkxCru0ttSy0bZXG/EBIsJEXdtdRWDg83FQ8EN
 DN6M93R2FI30MzAPoZw==
X-Proofpoint-GUID: LVTeFu23TJ-6y2TYGmzk34yLCMRRRCR8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NyBTYWx0ZWRfX/Csq/XG+Vx3A
 9NsZAMenVOyg306Jl4HE2o9YsSx7xYmxmia3v0EALkqZAqxZ81DZylDZzL4Imlf0OiqapZiwJ56
 Y0Sm51GbXf6ostmxVf9NBC/+zojuxmc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290087

Hi ,

On 29/06/26 16:01, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Device Tree Binding Schema validation failure due to missing schema item for the third clock name.
> --
>
> commit c724dfc4b95310a6b37f143a703b52391002ee90
> Author: Gokul Praveen <g-praveen@ti.com>
>
> arm64: dts: ti: Add PLL1 refclk to J784S4 SoC SERDES node
>
> This commit adds the PLL1 refclk to the clocks and clock-names parameters
> of the SERDES2 node. It updates both the devicetree binding schema and the
> k3-j784s4-main.dtsi file to reflect the new clock.
>
>> diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
>> --- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
>> +++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> [ ... ]
>> @@ -47,7 +47,7 @@ properties:
>>       minItems: 1
>>       items:
>>         - const: refclk
>> -      - enum: [ pll1_refclk, phy_en_refclk ]
>> +      - enum: [refclk, pll1_refclk, phy_en_refclk ]
> [Severity: Low]
> Does this schema correctly allow a third clock name?
>
> The items list here only defines two elements (the const and the enum). Under
> dt-schema rules, any device tree node specifying a third element will fail
> validation because there is no corresponding schema item defined for it in the
> items array.
>
Yes, because the description of the "clocks" paremeter in the YAML 
mentions the following:

"PHY input reference clocks - refclk (for PLL0) & pll1_refclk (for PLL1).
       pll1_refclk is optional and used for multi-protocol 
configurations requiring
       separate reference clock for each protocol.
       Same refclk is used for both PLL0 and PLL1 if no separate 
pll1_refclk is used.
       Optional parent clock (phy_en_refclk) to enable a reference clock 
output feature
       on some platforms to output either derived or received reference 
clock.
"

which means that a maximum of 3 clocks can be used (refclk for PLL0, 
pll1_refclk for PLL1, phy_en_refclk for PHY_EN_REFCLK)

>> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
>> --- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
>> @@ -122,8 +122,9 @@ serdes2: serdes@5020000 {
>>   			resets = <&serdes_wiz2 0>;
>>   			reset-names = "torrent_reset";
>>   			clocks = <&serdes_wiz2 TI_WIZ_PLL0_REFCLK>,
>> +				 <&serdes_wiz2 TI_WIZ_PLL1_REFCLK>,
>>   				 <&serdes_wiz2 TI_WIZ_PHY_EN_REFCLK>;
>> -			clock-names = "refclk", "phy_en_refclk";
>> +			clock-names = "refclk","pll1_refclk", "phy_en_refclk";
> [Severity: Low]
> Will this trigger a dtbs_check warning?
>
> Since the device tree node is updated to supply 3 clock-names, but the
> YAML schema items list above is still implicitly limited to 2 definitions,
> this will likely cause a build-time validation failure.
>
> Should a third item be added to the YAML items array to match this 3-clock
> configuration?
The YAML has already been updated in this patch with a 3-clock 
configuration.
>
