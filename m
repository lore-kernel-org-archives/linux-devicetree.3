Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE853BF692;
	Mon, 29 Jun 2026 11:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732071; cv=fail; b=FNickQ5808iqaGj0O0xfB6ov/hMTNFHzoR0+WcFIaEAQWfpDeQDEmj8XlLwg+Cwt88aCntrb6UuIv+uS1gDfAyMPHtUdyjDQfs2i1P/FRGtQAMXtcS1dVlepvENRorV95YssivLWmZ3R0cR32FbWFdLdNwDzsJtaLbNIVjx3paI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732071; c=relaxed/simple;
	bh=45Be+1A/qnSSCZTkvW3M2SMNh2UwJig2MfsZL+Ea93E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TlgtIoDRWkrcmA2fcrM00vZL+TRJ6xvk6c1caCSW/ZQXataXg+x2kb5gyN97CFWV/G6ifB8NaaRDieruPzUiIDTXvHDB95nfPHN7Di4NjVV4xt+nhkHaqN+U0jsvvDFYZGp4NxU8pa38HzvTXrJL0EOlpfdXsHTJFdMeECNY5QU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=QKcGTW9H; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sHG8g189; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="QKcGTW9H";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sHG8g189"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TBEESJ1948104;
	Mon, 29 Jun 2026 06:21:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=oJRa/WCGy0q87Nogs26/4vZutdElS7ar/1zJdQBJo
	cY=; b=QKcGTW9HbfGRItzq2pPRMP4k+4WXPjGxVpZTVZNRsUOr64ywQ8RysGWdC
	XQwhSHnFSYH/qyoSEwS2tCqbrr6efn5drj+T5PUGvTzwPge0eYWb2XHey4ZPMqCX
	52EASZBUpJAQfQRBoznZ1eEX3chPMHUR0qe3SpvyxrgaHVWcw6tbkf3dxlQwtwVL
	CLtCSlG13GTYYHCQ0cdVOJlXlyy8iNtYTCyE0gahMjz/VDl//5CCP/T7Juv0KMYA
	NxbFszdPetpO5cKzn683jIc/S5rhqNgysecVibHiSPthQuU5bE51mvPceTDh3c6K
	g8hfYM7vEN/ENVsDk3eehb9azuMCw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010053.outbound.protection.outlook.com [52.101.193.53])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f3qngr1a8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 06:21:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkEnmKxzatl86DXa5aBME528XUjVYRv8So93/oCiTKDIsx9wTbyjM433rtdcRr0kjakPX6ZGhfE0t7Ithh1FoNbUDzamoa5LCVvnepUHwqSzZGdjw+ppbh9px5p5sOpYPKnl51Iz+CotGbg1grJ2csR32vJ+UsthKBVw/v48u82pga9pf+yj3ZcoCoi0WH4mlCmPBXB/YK//IzP9THscZqtSR4sk8gYSlQyA9+pSuTJEGiQR/yf4eDDeuaKE2tb2UWchS/B3L9z0fOsePUggjfxc07yWPbo8jXcejgKwXQc25FhVxaTOB7mPeGhirZof7MQ39AbCSE16jCmOYZ+pXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJRa/WCGy0q87Nogs26/4vZutdElS7ar/1zJdQBJocY=;
 b=PJxOL47h5c96LXHV2Yx5VFfd9WdRatHY5uajdFVkjAsFM1owL9kDDVVQbz4fwWlFkcyzqJnmikvKOMdBU1UGrIXMKCc+slTeMFeU4LZFp06/Z0Xfmsee4heba+KJ28YV6Bx/bheC1ZTcgu0hxsljdTUoU1Hm1Y3qWBM056Zwdcc8pApXco+2ebhJA70Rc0RALOBa9nU4GeKdt7YfTjBNCjIN8WUfy6hMaQ8K8QUDo3hLmw1DORqS5WyQ+uKs6qqiqo1EsvR22dQIgxJ4xUPvyn2XhnsSEs1w3rFC4Y3lzz38tJa3+X29n0s8pF2CHFKIHR19xO9duPPU+iAsJC5jEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJRa/WCGy0q87Nogs26/4vZutdElS7ar/1zJdQBJocY=;
 b=sHG8g189Zzzh5vB2JCdE99DqhcyJl7dK+rGYvW4dYiE/m2ciJV0E4jJ49ciN9R31+WoKET4UXVaj8/+Q43oVQ5/pUMMrx+QaGf8LrWadUUTfQbSEYDgDMSrpDLZCihvHE2HaBF4YUrilGa3OqbUEHgNTwYUDuUgs7mqfOdASZAw=
Received: from SJ0PR05CA0159.namprd05.prod.outlook.com (2603:10b6:a03:339::14)
 by MW4PR10MB6534.namprd10.prod.outlook.com (2603:10b6:303:224::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Mon, 29 Jun
 2026 11:20:58 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::97) by SJ0PR05CA0159.outlook.office365.com
 (2603:10b6:a03:339::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 29
 Jun 2026 11:20:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 11:20:57 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 06:20:57 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 06:20:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 06:20:57 -0500
Received: from [172.24.19.216] (lk1261fh9h4.dhcp.ti.com [172.24.19.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TBKrsK341940;
	Mon, 29 Jun 2026 06:20:53 -0500
Message-ID: <ac7798b0-cf84-400d-b241-fd2f1088e7d7@ti.com>
Date: Mon, 29 Jun 2026 16:50:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add support for dual port USXGMII+SGMII
To: Gokul Praveen <g-praveen@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <conor+dt@kernel.org>,
        <c-vankar@ti.com>, <krzk+dt@kernel.org>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <s-vadapalli@ti.com>
References: <20260629102308.56616-1-g-praveen@ti.com>
 <c4378e60-f4fc-441d-91f5-885d8b097f09@ti.com>
 <620d6a59-1e85-47c3-b7bd-2845f103f1d5@ti.com>
Content-Language: en-US
From: Siddharth Vadapalli <s-vadapalli@ti.com>
In-Reply-To: <620d6a59-1e85-47c3-b7bd-2845f103f1d5@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|MW4PR10MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 921a746c-82d3-4bf9-ac9d-08ded5d07e1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|13003099007|18002099003|22082099003|5023799004|6133799003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	BKeQUZhBwF1oAgMQvm50JJ2g72s8LLXJarFtkVdu3uZAIIaQ4e6enNwBWp6catCzdqzdADWhL0Gg4gSL5gvacnFlrIf6DNjKhl0E8p+js7C/VPQWGg16euSd6EQeJPzy8MDnXiMiZ1LBoDjYVUX6l4UwMEvvgMExqpwvkA+iHD8Ln1xg5lOyuvRo1cVbb/QqECgwRWUQCmFN1bX18zpkYEcp0R5bGDNN5du3uxlWrFUrwlgT81nRDZ+QBKD+0gcaY98i/Efkdc5vlghM2IGSlmAXS4yIdRu30RdWOngdzIZVuZ4xEUZMEd5xy1oQ4YkqMvJXz1mMaXanjlal7/AoDBU2u1QTqmI/00upm+S0kW4Z4l2QrgMiVxHXyxBlYDdAS9YPXju3gj/mNtnOPRn6jT+EFezz4IQUouJAHEoaEFenAKYLgPvOyg1ZCrzE8cmsgULr3GIvzFPjE0LfplbnYNQViiS9vFmZw6GPUHMaxFdXoxiwr2ANMUxhD3N+2/QxLeVu5JacMH6yQUZL1Ax1Cz0daZUlouXEcLGWU7wDnbrQ5rbO8zh1wuL3INlM88xRad9GnDk8mKjwH/gq824Z7R+7CeOgSqQIUAFnxkybt3Sw7NaLD1qJkMxFlmdnCtlgA8FYyf8PWP5HSJ85HZaf+A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(13003099007)(18002099003)(22082099003)(5023799004)(6133799003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l3DeRBvfXgNpK4cIckkL5yIsS4xsK3OMQoH8Lw1tiPkPibPfk/IZZeH4FOdD5AqLVFJQ42owKZ1VC9JZWzSLM4NxCqIH5V0NTPIC0samNZRaaQ7hswhbzWjAV9XlK2Rtj3ReIiwrYziwUH/7UdN2uVRqMO8vuSJ9erKzNMQi5VB3FPm3n5IPh5C/SDcRSKeJVF9+euXEwRfFlo27boOp7/yJ9tF9ecRpViLN1E041nBZ+m4QjG6D2VGq2m+dUvTG/y5mNQBweIXirknIEwS8b7oPJ6JdgX7oKAEgvqgw+j3X2CgE6aDLWkXooVDpFtqWgr2YQR5CD3WA7lniuKZZlgErYug5Jneqpjxf7w6GMVyGW6eRK/6tPq14jtNmvnKZ+SBp0KcplWJtDDamgCEq3ifN8IhcVYn9FVWDUjjgiogXo8J2JM/ySS+WiW3S8DHk
X-Exchange-RoutingPolicyChecked:
	jzEEUQj7NOsfZc7kcXW+VgD0pCEEGMLDHZPQwUTTeO1tFEgWs9Tb5zNYik6S952pBCyQJGHx5kxkJF9xA6gBKjCGhZ+iUZjBswoo/YgpdljabihbsR3xpFd8s+eGn53T/Bg9cUypLhDhBH+iN/dfrsm+LC8AQeFRWgMaW+5FN1XNw0ywq0tqet6oU1SBwvgCoO5D1a3XAK1vNDhJfh6BOCZ4L8jSwNTFZbk+jh8rBn0rAE2As/oTkcTuZiLj4BlEBqgALe3f3JZG8hufI83ULqubDaZJicwlCb43eAjQzIcbA68HOwcI5+d+eGt0LhYNSOJk/ClgIX9TihVwO21lTw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 11:20:57.7718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 921a746c-82d3-4bf9-ac9d-08ded5d07e1e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6534
X-Authority-Analysis: v=2.4 cv=Yow/gYYX c=1 sm=1 tr=0 ts=6a42551e cx=c_pps
 a=XYxO6LlR7Df2C67LKP0s0A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=dVeY6--vGyAUJyzC99wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 2gJzNUMtvqq4WblLEirl3RrwHH2jxy-e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfX7I0h1eKaeGSK
 Lwc9p34VcdRTTserMTqOzCeQYgt7DGEPIZWmYuETqi5QzqRfYah58YDE7o0T4I4O52w2PtMurWS
 /FSpXiajNpqQI+xgNkn+J00YBn1724lJALzlMyTtnNufTVY3DXdMN0nPkm8udpqI2y8LpKuXzaI
 cbNJ8l9zb1W15GA6Pi+7FMxW0F5dEZYtAxz5xNpnve89B4d8AjHAG9zcwdqyiCnK9Q635bXKtR/
 7Z+QnhAU8lCsLfOBs1u9v3ezsd6XH15owEPXyMrDdyh5DefgkSHgjJ+8qfj18/8C6jMjTxfzKDJ
 yB2J2OvlYdMarsTZ0a6nJPmKO68glNZ0gpBUjoh8IcwDcN+o7w3XwD5xtm0oWLVvF5flMl4jVaO
 c+9YbHTWuOjAdlbignhtyagRhSD9/TAxaB981W+E+hE5ZjdSK2PAJYpgKifK1Z9qqK9ynBIK7PU
 A1kZmkfrWvmSoLLSe5A==
X-Proofpoint-GUID: 2gJzNUMtvqq4WblLEirl3RrwHH2jxy-e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfX52l4Shnet+sr
 WV1q0sC5SI7YOOhbUszXZY0upFtWk62ytmsUju7R0RU5Og29jpByE2orfxjDjN5HH9LuM7UnWOM
 eI3F5vDd4fYAPp/nclgGOkM+XHxEubU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290091

On 29/06/26 4:40 PM, Gokul Praveen wrote:
> Hi Siddharth,
> 
> Thank your for the prompt feedback.
> 
> On 29/06/26 16:16, Siddharth Vadapalli wrote:
>> On 29/06/26 15:53, Gokul Praveen wrote:
>>> This patch series enables dual port USXGMII and SGMII Ethernet mode
>>> support on the TI J784S4 EVM platform using the CPSW9G Ethernet switch.
>>
>> Patch 1 => For Bindings
>> Patch 2 => For Driver
>> Patch 3 => For Device-tree overlay
>>
>> Please split patch 1 and patch 2 into a different patch series and 
>> post patch 3 only after patches 1 and 2 are merged. Also, the patch 
>> series containing patches 1 and 2 should have the 'net-next' suffix in 
>> the patch subject:
>>     [PATCH net-next ...]
> 
> Sure, I will add the 'net-next' suffix ,siddharth.
> 
>>
>> Additionally, the subject for Patch 1 looks incorrect as it doesn't 
>> follow the format expected for Bindings patches.
>>
> Sure, I will follow the format.
>>>
>>> The CPSW9G instance supports both SGMII and USXGMII modes simultaneously
>>> on MAC Ports 1 and 2, which connect to ENET Expansion 1 and ENET
>>> Expansion 2 slots through the SERDES2 instance. The series includes:
>>>
>>> 1. A fix to the SERDES2 node to add the missing PLL1 refclk, which is
>>>     required for multilink SERDES configuration to function properly.
>>
>> Is it a 'fix' or a 'feature'? Please don't use them interchangeably. 
>> If it is a 'fix', which commit is it fixing? Specifically, which 
>> commit 'claimed' to enable the configuration that you seem to be fixing?
> Yes, it is a feature, siddharth. I will change the commit description.
>>
>>>
>>> 2. A driver fix for the am65-cpsw Ethernet driver to properly configure
>>>     the MAC in SGMII mode according to the CPSGMII Module specification,
>>>     including correct advertisement ability register settings and master
>>>     mode configuration.
>>
>> Although you have called it a 'fix' again, the CPSW is a MAC and not 
>> an Ethernet PHY. Therefore, the existing configuration is intended to 
>> advertise CPSW as an SGMII capable MAC (SGMII Slave Mode Configuration).
>>
>> For more details, please refer:
>> https://lore.kernel.org/all/20220914095053.189851-6-s-vadapalli@ti.com/
>>
>> [TRIMMED]
> 
> 
> Actually, this patch which you have mentioned "https://lore.kernel.org/ 
> all/20220914095053.189851-6-s-vadapalli@ti.com/" is no longer present in 
> the latest kernel driver , siddharth.
That was exactly my point. Please go through the conversation on my 
patch to understand why the patch isn't correct.

Regards,
Siddharth.
