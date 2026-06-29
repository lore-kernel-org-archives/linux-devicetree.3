Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE26535A393;
	Mon, 29 Jun 2026 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729840; cv=fail; b=eElaIr/C+UTfbxpkVVNEtvaYei/nzQdPet51B/9HUT+VIjG1aaTUXCUeUWlF9ZtN+VdY5F27arIrQmO3S1KKIOpU8csSv/bcvOxfZ/a1DLXNEpkw1tBNmMX1OW7DBwj1let7EPsBYT4ZGAcZIzNp2rntWg3opWXHaZyIWfd4j6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729840; c=relaxed/simple;
	bh=5OoWhkREXubmGDumNqkh141AtTYdacLW0RVDImoMdFE=;
	h=Message-ID:Date:MIME-Version:CC:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YIv96eSLsDV4VhskYMPW/AEWrTz36z8EGY6k0514mTTk6nrui7FfDGUrO8vZyK91OMKO2vzbj48qR3fZoHY4he2mvmrVGsDyOMeO60dRwW4nSdK1OuxZ1yOxnmPXhW37Vw61E54R+/GEwfx0WU9s1imO/n1S0UXYt0uiMe2KNpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=HpEXU1u5; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=f+fhI4Rt; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="HpEXU1u5";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="f+fhI4Rt"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65TAT6SY1669068;
	Mon, 29 Jun 2026 05:43:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=wweWYNZdAWKcDdnFMp17T9btWj2MldbTvuc7rmEAD
	yQ=; b=HpEXU1u5wnR8J+xPmNtyysxt3EYrnkcBLbdu1MV/hxd7o8T77qKFDbj+0
	ZJhedM4MJW4yjjP03v+lZ3wYDYHjPfjmkTJic42rvh6Ilfyz2YkJoGuXi3AGTZH1
	f4B/Ox8wfrnONTkdIFTNPcvQhJEPeFZk74Pu/HfjRcTPVY0G9dkDs2atenB+ZFwI
	qnLHFsb9lLo4MOQ9+hyKpyC/PeGvKcY65Nr0RULbnc8io27PAyFCYeS1iAf6yYqN
	zUfJr/w6uZXlz9s2qw+ZSHsk/CwiExFom8zzJ3fL6ARvqLocFHq/zAwTWufrZ1vI
	ysjCYzT73elOvEdI+a9hxEKJVy4gw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011027.outbound.protection.outlook.com [40.107.208.27])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f30fset11-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 05:43:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b43Ok8zs6in2AsV5sD6aRtVFBZla7ambnUAKQYZVlBk7VhP0xHtP8LuuBpi6yqSuzzj0M02hXB+UOhfxYhQ3ztt9KXKFd2eBnUOlrlRtxy4f2FiUISRV9SFMPs1k9DfT1D1JBCNBBf5CiTv8xpH9bKfkeZ130pk9Tg3vZReYzuXguyEv2zjcfj1+5bJiGx76EeUYk+OpBGsEsI7pnB7EIlXkP5lGriSq7Z2gvv8uE06FGaoYQdesqiPRdJW6ico6yDwWBl1NmkfAa9POfGgJB7+1jT8FeCKEnDYqumxlrgWOOV4UiUSedi7Zy5V+t5q4ItWujo51AhwcS8GEUTBYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wweWYNZdAWKcDdnFMp17T9btWj2MldbTvuc7rmEADyQ=;
 b=xE0igBzaQMQmFW86lVFA07z0hbyDb10PNtdyzNQ9PXsWLsFL7iy4YZBCZoobvjaAS4EQcZh37ohLUa9XF4Xomyt26MALCWmv4nBhc3N/TB0DQDxPcUugiPmEpFYEwgso1ssgfoCCguqzqJCaVt2a+8S7NBO+q7vtSHtVm+ZL4/vImeiLIJphSExpGGc5+i6gTV9TJf1/DP9aCKry3ctRQPJYkjYjR6x9dHGWQZ5UJH31xw2VHdFijJUhw4qAFlS19zrdQ2Xm3x719s2Dl27bIpb4bZ6NERnrh9lyVbhLlRkkHbHN8jClTKr1A7m2enWqHrLXnhjrDrqarTY1lXzuhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wweWYNZdAWKcDdnFMp17T9btWj2MldbTvuc7rmEADyQ=;
 b=f+fhI4RtM9u1h5eHGZNdnTZy5lldO2CFlkvvLwrHyqfSrg5U4Vydupl6dqHwP6aBZZoDe+fxz5wxYS23LMDCq2ytjq7NpxHn//WEitYbwqBAFcKxVlmosDL5XFMn5obVc9vlBOdK6NzV2uyBL5hXlvhegbUeJw1/W9RZU/QDjXU=
Received: from PH7P220CA0111.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::35)
 by SN7PR10MB6449.namprd10.prod.outlook.com (2603:10b6:806:2a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 10:43:47 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:510:32d:cafe::26) by PH7P220CA0111.outlook.office365.com
 (2603:10b6:510:32d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 10:43:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 10:43:47 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 05:43:46 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 05:43:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 05:43:46 -0500
Received: from [10.24.68.110] (uda0492258.dhcp.ti.com [10.24.68.110])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TAhgtf273685;
	Mon, 29 Jun 2026 05:43:42 -0500
Message-ID: <c4378e60-f4fc-441d-91f5-885d8b097f09@ti.com>
Date: Mon, 29 Jun 2026 16:16:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <conor+dt@kernel.org>,
        <c-vankar@ti.com>, <krzk+dt@kernel.org>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <s-vadapalli@ti.com>
Subject: Re: [PATCH v2 0/3] Add support for dual port USXGMII+SGMII
To: Gokul Praveen <g-praveen@ti.com>
References: <20260629102308.56616-1-g-praveen@ti.com>
Content-Language: en-US
From: Siddharth Vadapalli <s-vadapalli@ti.com>
In-Reply-To: <20260629102308.56616-1-g-praveen@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|SN7PR10MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e214ae6-8982-42b6-aebd-08ded5cb4ca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|6133799003|22082099003|18002099003|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	R22I8rbo4x/QXHjTcJLHfH68ibCMFk5hXMHVm6GhmcL9J72DO7k1Cg6FYF0CJExz8c1vmNda1STFqQuh2WtLnIQqoTu+bphqiaZkzHO9+8gpq+iJoHnGxVicFgOB6YyJ619441KthHL3z2NMTz1qZ1UkMa70CNg2ORIZta3KeUnzcu0GxEURDamDnwcTTaxK2slN7E0n7ZKC87P7vaF0n6Onov3QaSt/JDc/OwLZnLak6kdo7zBXpFfrgp9wUy0VOVTeLAN34JDEDkcaGL6Q5N4efenREHYx2svkFwt8SgfERa89E3sP13n22qRq6pJWf1wR0RMf5hCgFaqqei3rmgRwtxsUNaLyRkZR2TBNNOx/0S6DKsegt7WHoyfh9ZiBd2s5llAvfrF/W3bIh886oks31ig34sV6wWN/nUseyHsM+2QxKecYyOpHqQJSKaRN22ll5bAR++LvGjqjf7ziBHGJ8l6pF+hTJ/+WFDcZ6xK20HGCbpVovlC0z/S0ifEkPtRkr1dBmSXpyZITguzGNo7PA1u3KzKwYgio8KaaYSIsTBz8EI+9nBhkUf5U0Skjz1fY5AagTt2r/lQ+o2AIvRDGGHx7z/0fOAxnJHh0fznwUDhLd19hspAmPJX2YjxM80GIg+w/KsmEud2OBim1oqqPOsJ7dgxMdHGLD4mjQEs35k+w9Z5bnMJkYXIF7XK8nlngKgzYuKTyYD0o2rGcPw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TtLnHoNApUGYE0c2ghQQCVKQUEc5e4QqQzHNe+xI57Rve6sSDMx43diQDfT7VWTY3t4y2LoiOlu1gR5nECm8kAdFDIMEbbfIr1Bg1cLnJfm5zA5FTNEYv9fP77QSyPoNrs4LuE+wo5s70P8+eopdb0bbnWTws7m2mZaFBGGbBjgRpduAtOY0xXvD4pZJWWH5fFVhIeAa5/Wx9DvzPG4bSY+h7ka0NqtBbuwcsfgNmOd93lQ4WIarD5SUx1UdUkc2q4G16VsKNPAtF/W1RtMNKuQ3Ls1lTAvl4jqZId+L12VBC7bU9+ud+LirsWv6Sr0fxwbPWsljgI8gKiyguAgAc5yRANXpHTinusMWhZ2kzkn2EeNQ4tDe76W6/P5GOJiEFuBHC3aQK1h4Fm1lpecICYZT11Uprie4SlhOm82urroIWe9DUsMNJkTuAcCL3NWr
X-Exchange-RoutingPolicyChecked:
	sFJyiDd8Hq/hwphK1z92pWaLNvDIaUaNqj3jwoBgU0/S313o+yo0yJLcVRTlBK7rw1D60hmg+m1WgGKpXON4RxZFimIWLybauHlG+VcGLYd3qgJAEuQ6yQwDsJmCYhfroXpnyz3FnvtNQcQRRvh92zh702n1AQHlSuuLRU6CwwEWimFJBuBrCO1vLoI3M+DUxnZfNJyaxlHmx4NieMw3qFF3XtsAchFqCipiAUzM0NieshU0TlH8AuHXJe85KZwHRpcYkcuLHugbmizqfuNlY8wrfGL8atDjb1iP11pNa0OooA0Kw4gQNmcZHLtWiybylcSItOyAAKoarLePKLOJEQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 10:43:47.3590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e214ae6-8982-42b6-aebd-08ded5cb4ca8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6449
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NyBTYWx0ZWRfX1Ig2vnyTwac5
 yseyxpg2VdyQ3PPPCbMK93bRHCjd6VB7O+dOyQFHmFOs5Mw9KeaSJ0slMyDoe/3vgXf3YfzBErO
 A6OUDYs7T3qnIOvmeoPCpM1Y2X6yPla5+9v/dIrasYuw97H+dbuThKozHfVhUWp8fWrP3/eTS7z
 ZErb019eKjT41x6JGVYSMC5D2DfBuIpntDgh1k6MCWZ8r8T5NCXfhMVjM/TCFGOE9koWJ5aKxr7
 0CVtgjLF92wp3Z/G3VDLxzgtp/VBJEhZplQ1ALGA37HoDqWcg7T0lnd+Gr44/Ru/y4lpfNeHnst
 4SbjFpDWnFBqTR4W9zAVt+w1pej87qo198z2n0EBGMisdIrqolbdXYdFBRNVfnLIObhQ5QXOA22
 N2Q1F/dEX07sN0fwvzk9qYuK0w2KkwTp/+orffvBrncP1IZcSInRvlah/0vq94SzhTjhVMFigou
 pkQ3MWVUxA3L9N6hA2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NyBTYWx0ZWRfX5bx05CvGCqDp
 YSq/Xmjq2lI8MZZflTtwYteqRT7gVnkd5/PO15x91cAwKyifVc9wjP6hOD/hHlcRPuSNwUx+MxW
 TGRfXjKvfHokuHTzJNRxZQijggEPASk=
X-Proofpoint-GUID: fWzIKi8A8qlm3nf1JBmYQUUuL-NuBbrk
X-Authority-Analysis: v=2.4 cv=dcmwG3Xe c=1 sm=1 tr=0 ts=6a424c67 cx=c_pps
 a=iNm6N7YJuWyXLwPauF+ZSw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=enlRZd1G3o1rKbeKyEEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: fWzIKi8A8qlm3nf1JBmYQUUuL-NuBbrk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290087

On 29/06/26 15:53, Gokul Praveen wrote:
> This patch series enables dual port USXGMII and SGMII Ethernet mode
> support on the TI J784S4 EVM platform using the CPSW9G Ethernet switch.

Patch 1 => For Bindings
Patch 2 => For Driver
Patch 3 => For Device-tree overlay

Please split patch 1 and patch 2 into a different patch series and post 
patch 3 only after patches 1 and 2 are merged. Also, the patch series 
containing patches 1 and 2 should have the 'net-next' suffix in the patch 
subject:
	[PATCH net-next ...]

Additionally, the subject for Patch 1 looks incorrect as it doesn't follow 
the format expected for Bindings patches.

> 
> The CPSW9G instance supports both SGMII and USXGMII modes simultaneously
> on MAC Ports 1 and 2, which connect to ENET Expansion 1 and ENET
> Expansion 2 slots through the SERDES2 instance. The series includes:
> 
> 1. A fix to the SERDES2 node to add the missing PLL1 refclk, which is
>     required for multilink SERDES configuration to function properly.

Is it a 'fix' or a 'feature'? Please don't use them interchangeably. If it 
is a 'fix', which commit is it fixing? Specifically, which commit 'claimed' 
to enable the configuration that you seem to be fixing?

> 
> 2. A driver fix for the am65-cpsw Ethernet driver to properly configure
>     the MAC in SGMII mode according to the CPSGMII Module specification,
>     including correct advertisement ability register settings and master
>     mode configuration.

Although you have called it a 'fix' again, the CPSW is a MAC and not an 
Ethernet PHY. Therefore, the existing configuration is intended to 
advertise CPSW as an SGMII capable MAC (SGMII Slave Mode Configuration).

For more details, please refer:
https://lore.kernel.org/all/20220914095053.189851-6-s-vadapalli@ti.com/

[TRIMMED]

Regards,
Siddharth.
