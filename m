Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C6514884C;
	Mon, 29 Jun 2026 11:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731445; cv=fail; b=j8U2oyq8xt0k1mIYa0mRACykMhpvnoU0wnoP7NZFbTtVhPjwu7hbf9qWVdNFlry5lpkX2J5sKFS+/J4odhraYyN14+LSloX/dwzCiQqqU3GwDrtBI98nzyjJVuSph4+lVujP2KajigA7uVzfMqXWjBWvYdRlD/ta0fhwJh5bw0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731445; c=relaxed/simple;
	bh=MrLhpn5yU/oyaHygMixKLam7298e7JcLYC6CC9JN3C8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GaiIksZonY3qA7CaXgxR+Oq1owwANpigZqOjpseH0Q4bgBATGecfXt5TQZ6XBcuEE2ehJrMGR80nCIIpdpbtQXk1H0NE1cF7QhB9Wqa8Vryf7g5JVd9DHGwfOlLJTnERNRQXiatK6nZl0/w9jojlPoVCxXZEtgwcS25EKq5IWNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=fYzMyVcm; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dHYHkczX; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="fYzMyVcm";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dHYHkczX"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATNuG1860503;
	Mon, 29 Jun 2026 06:10:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=wL0sWoHUfA6SyWe4GCnAQx1wog4ubKzjYrbMB3eYf
	Cw=; b=fYzMyVcmf+q+A0mOjrOsDDsuDauvW9RBq2FAeiukouJZrVmYXtcWkB42j
	sCnZ49J58dQv+CrF2zOCJKKJlbOw4oBc/QE01VfESAaomdowq4kDb22jz+LUzBWi
	xDToGwlI8pXSSc1gcOsVSXUByPqcGBOpDDMpvk/dkTCTt2lz3mz0W26E7ZuM8/BX
	SWjwO667daglzgk4JMBcd2+qeGylILK6FXWA+jkB5g5kCb/DP+jiu44BkFVHGfLT
	4wrjtXkvRKZUQ3DDTUQGRgNS1WvfRM4gaXyubqJQgAofUKAvqQWyH5Nh2nrjX5w0
	WgbAVF+9bOAS4FTKsSM/UPuMILHTw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f2wnpfadu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 06:10:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciyGJp+9phMfXAj5h0zp8VicUoncMi+lLRzKGRnIy6Fc6SzHK/KZ1tH95PsZIMnCZ8If+d9/MO69zb39AdaK4+Y7EmUZIdXJE3zzapxrf+HBLUDHhg8j5q/CgJ0PQmncZUpjRNVAQl7YOA8WSpzqSsH1ZHI7SEOWXjFwQZR0XSWzEHc9Bf1gEhDXOQqd/jgKOTq9TwmwY2VXPOQdLeLhR1O9J3dvgalGKdhCg9cY6aiHJ/ddHOY2yzgXav0SB/awow9rLMRFdKZcmxUxdAHYnIo02ModKUe1QvsIRWfXcN/3YmJk36yLc/7flaTRNVkFbYjvqrTJAQGRSC6mwHWExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wL0sWoHUfA6SyWe4GCnAQx1wog4ubKzjYrbMB3eYfCw=;
 b=TboAsh56gQZ2AbEuJ238v53d9ipLNrRCGU+cAkbJOz9vNiLC/m3TnxAfkO7hRph/etrg37JsGXVhuRZuPfUkKb+0Jwu9oAxMesmrSHgQhPn/sPdMb4zIqR2y+8ZpO4GajN3SU5qCfEwy4KseE7dYITZ3ptjLrUyEGAatvUqadGM47q6Khzi6k4DDSLT7L+BfIL25tzQvdREQxxWNKD9bIMd5xkXfFEXE4qbbmp+a1mStRZBYr9bZmFW2ne6qLCG01R+/K7Ry4kSdkqaZEIpaxDbb/hhEhUI1Ti0YfuonWMuavKzTIPS5LRYAw3jl8N7dyHDajUDoMZPEHp0Hb2aUMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wL0sWoHUfA6SyWe4GCnAQx1wog4ubKzjYrbMB3eYfCw=;
 b=dHYHkczXG5KCoMX/VKMOQNwdVi7Yi6Z1hoF/BfCK+bvbw8HOKGZiy9GMHBy4aLBZ4HePGCU7fH1dZc5U6MEFhoSQXLgk5/r64HpPCUhYaauiJAB7JL8lvbYnXNi3o1Hgt5kySewwkHYRe4nZZALiwqzgVpDrxMiiEeUHBhV+XZo=
Received: from DS1P223CA0004.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:453::12) by
 MN2PR10MB4285.namprd10.prod.outlook.com (2603:10b6:208:198::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Mon, 29 Jun
 2026 11:10:31 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:8:453:cafe::96) by DS1P223CA0004.outlook.office365.com
 (2603:10b6:8:453::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 11:10:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 11:10:31 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 06:10:30 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 06:10:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 06:10:30 -0500
Received: from [10.24.50.145] (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TBAQPl324486;
	Mon, 29 Jun 2026 06:10:27 -0500
Message-ID: <620d6a59-1e85-47c3-b7bd-2845f103f1d5@ti.com>
Date: Mon, 29 Jun 2026 16:40:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add support for dual port USXGMII+SGMII
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <conor+dt@kernel.org>,
        <c-vankar@ti.com>, <krzk+dt@kernel.org>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Gokul Praveen
	<g-praveen@ti.com>
References: <20260629102308.56616-1-g-praveen@ti.com>
 <c4378e60-f4fc-441d-91f5-885d8b097f09@ti.com>
Content-Language: en-US
From: Gokul Praveen <g-praveen@ti.com>
In-Reply-To: <c4378e60-f4fc-441d-91f5-885d8b097f09@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|MN2PR10MB4285:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c7a5da-550a-4c83-29f4-08ded5cf08a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|18002099003|22082099003|13003099007|56012099006|6133799003|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info:
	8XWl2amJZswzYKLKHJLnbvns/Okmde7+HdtIxD/8cBro/kJ4xRKSddOgVfLUBDbumm1HFkR7k4dQeDmkyXVOhvEfUJCMeldjI95lhnlIyhAAfH3ndzqinfwin9g3Qc7/wOhvz1kmRy7Da7AZP1lb55PDQXdyXhXFBzSq7igCa6yHg7iJ1ZNhjsI49pzLSlqzh1CbeCy0dK9ZeP+tmM7/zpVOgBde23XYp8sQIaq2kO/PYHMmhMHdGouPp4ssZQMtZ2h51dYTKjKH18lZI7197ZNdGU9Za5MPZdFknc6wu//5SMt323pyqy1FLENJFUASOzHffGCvFExEXCDDlHun6nEjuo3eOcaQR/X0q7ky6TWii5WNw8P79tWtdpz8absf5uxKu2rfwZTKcKW+y8S804X9RjijQ2Grc54pcdJAiKJykz1kwoucN+QulSBpC9oghZaKaJ8+FTGSuxsh+zIGqfXTFONRCmYJnrdX1ASOF5fOE33mLlJlpryCmfn1sZ0gK+2Hs702PchQfaNcLQHGX3ERDG8+Vt62u5rmt6K6bP4/SRXfOyUV3i1jqbp4yHFq/3DLvCYWQIse0ApSuKFsEV+wKwbeSLWE6pa2E+HQwtY2stk+v3h9AJY8BixGOepe7qe8R5JOriMffipzOxgTDjXNd0d3wposVuEu2MqriA/zBer6T+RFvgvIUr6gREmGOZTpbEpAl4pDQZfx7MtdlQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(22082099003)(13003099007)(56012099006)(6133799003)(4143699003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HMfaJUwt1reG0cJK9GwtOcxUdEeI6laNHndtBij8QY32g95hBWZnCSjbHUMw4ptMRUCp1fdz+7MwGy2ZudmqicgMBv5wHfA4LPUoYO7qFnTQsYRNia6oH8ng4axAV4J7dpLZ40r9p8o5CgjZ6eWBGmtdoUiBpfgeiJWYX5oAr6Yh3XnjlxJT02IK/oOnEcklObSJa4kSl/bsM0hDV0CJpwfa6Mk2hJtaP2fN4XpHDEGjolCiQbTt/hvXSHnxFoKQpIAZlAza2sYp1oniQo73WU4yoolNDWgoD7BcU0CmfdmxPlpPeWemAttY7uSFm3JBxl0n9Ci6bmHd2frQD+2u17AW/k/8qrQIf7hVGmulCGVRTGPnSA9+sZJ3TIahnn4E5neBKcFOsz7u3flA4kRAboPapFbSYxeo77Sdz4YYODTrLpJrxUgCRt0qweA4uzIz
X-Exchange-RoutingPolicyChecked:
	eC7CZeLdzxynTxZHtP7nNxYiuyzUilUxDLeERW99sVslbXZ3J1swEo5NeGhmPIjXAuTFhTERTBeBt3EYjF7PDNd9BAd97TEdPfKTkXmBauToAbCIUF9UV35yV7hrIRWk7JwTBz8j6amsqja9K24Vi9wo3m3kn/rwJmPpQ9xPJcxi/eu6NqWjymvP7SCl03c2U5FZOiIkSovFNla2S/rme79cgQMAdKjyPIhrsTIxiiLpiwFAb4B3MtrNbJoarzDjTLrMP8h+2OWHLDVWK2nziazkVOfGUlqukNjqYp+xdgYS0nrMsXdbaBNMq5gNoXr4ZmZxKMEH+/yx+GmYsEVIlA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 11:10:31.1862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c7a5da-550a-4c83-29f4-08ded5cf08a0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4285
X-Authority-Analysis: v=2.4 cv=QdxWeMbv c=1 sm=1 tr=0 ts=6a4252ab cx=c_pps
 a=hWS9KTtKglmM4LJ/Q12dcg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=TcE6-T_9CPYD3Jh3W-8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: HvytA5qmsirRSszOxUWJ7rE9csIsUv8x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfX4GupAvpDHYeA
 PuFkPPC01mlSG/mxhSVdladKUSHMK5xr3SApIKaVBipcWH3MKduRy5K3bndFYC2JgrKlVqeHzHY
 cn5wRREvz/HMRJu1a3etoXzuh/traMpCJY7IfuPIuXhF+VOLwj+C3dV8t4FNKAxFLVW9x/KsZhH
 JaOsuE4qQRaeHh1AJqzQe2T6IeS2SzaKxktMnRDTIyVPm1vVNM9vdEbrq5Xo+tfCvkw8a3pia9E
 4/xA/hJogjKKf5/RRfb1ajsNbJX6ss9eOh8pA5QeqKmw94X0Ws28n72BLudr9jNkAuyvBd4JYNf
 4TcFL2zYeqJS14VYYwjQnKHpTMEU8XGt1fxpJNQi9hSOwlw+lIp/mw64WZw4EGfb/jEcCoDaaYV
 KgOO4BQtrLlIzGw6eIa8w8l+lusoxLSM0IHiVV6b5O2SIW73PEXXEwtAtQ/2ZXGnwtgyJppQbLH
 1CjN3tWvloyMjUHPuRA==
X-Proofpoint-GUID: HvytA5qmsirRSszOxUWJ7rE9csIsUv8x
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfXyTeMYyAASJ6s
 f/7s8t5tXtOgNHZw13yvQmwR7vxCBmcDAZ3fAbof2wU9JyWjx07Au8xNGN8dD+LTSmS/ROy+Hge
 pHHyxFizlx5vNzqV94LE/zu0ne9Hg+U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290091

Hi Siddharth,

Thank your for the prompt feedback.

On 29/06/26 16:16, Siddharth Vadapalli wrote:
> On 29/06/26 15:53, Gokul Praveen wrote:
>> This patch series enables dual port USXGMII and SGMII Ethernet mode
>> support on the TI J784S4 EVM platform using the CPSW9G Ethernet switch.
>
> Patch 1 => For Bindings
> Patch 2 => For Driver
> Patch 3 => For Device-tree overlay
>
> Please split patch 1 and patch 2 into a different patch series and 
> post patch 3 only after patches 1 and 2 are merged. Also, the patch 
> series containing patches 1 and 2 should have the 'net-next' suffix in 
> the patch subject:
>     [PATCH net-next ...]

Sure, I will add the 'net-next' suffix ,siddharth.

>
> Additionally, the subject for Patch 1 looks incorrect as it doesn't 
> follow the format expected for Bindings patches.
>
Sure, I will follow the format.
>>
>> The CPSW9G instance supports both SGMII and USXGMII modes simultaneously
>> on MAC Ports 1 and 2, which connect to ENET Expansion 1 and ENET
>> Expansion 2 slots through the SERDES2 instance. The series includes:
>>
>> 1. A fix to the SERDES2 node to add the missing PLL1 refclk, which is
>>     required for multilink SERDES configuration to function properly.
>
> Is it a 'fix' or a 'feature'? Please don't use them interchangeably. 
> If it is a 'fix', which commit is it fixing? Specifically, which 
> commit 'claimed' to enable the configuration that you seem to be fixing?
Yes, it is a feature, siddharth. I will change the commit description.
>
>>
>> 2. A driver fix for the am65-cpsw Ethernet driver to properly configure
>>     the MAC in SGMII mode according to the CPSGMII Module specification,
>>     including correct advertisement ability register settings and master
>>     mode configuration.
>
> Although you have called it a 'fix' again, the CPSW is a MAC and not 
> an Ethernet PHY. Therefore, the existing configuration is intended to 
> advertise CPSW as an SGMII capable MAC (SGMII Slave Mode Configuration).
>
> For more details, please refer:
> https://lore.kernel.org/all/20220914095053.189851-6-s-vadapalli@ti.com/
>
> [TRIMMED]


Actually, this patch which you have mentioned 
"https://lore.kernel.org/all/20220914095053.189851-6-s-vadapalli@ti.com/" 
is no longer present in the latest kernel driver , siddharth.

Regards

Gokul Praveen

>
> Regards,
> Siddharth.
