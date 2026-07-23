Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D982435E1BF;
	Thu, 23 Jul 2026 10:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801750; cv=fail; b=uu2vXOcFM0ra/OndC0D5mR5QPoMFKho4ViYebiAzJWh3isy7G6OB1/kZwO/UiVP9C5P6n0UPG6hQHbCkdBY/ySZsDB3cXSikrXL/6FOfjt4qFh7Q6fy0xfa9HiWppqF8k3kLqFQeq4F1cppTWkvTYzXPW3/KBgfYaleOD56Px7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801750; c=relaxed/simple;
	bh=ItLAX6rRatNTFg6LMigSQlDmcaoOIy1bF9CcNUl9MZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Gl5olrFhHTkVfubUsJxrm3Hb/ihr2Ss7iyoJJ9Eb+lIh5/C/8q/fAEDBB0iPLb0VeFabHWpklRawgcC0Ddg/vXXgnw77YcnwMi1TjCrHbvUtd8HR+t3FDYL14A3E87SS4+lKXak2xANxDL/h2dfzFRu1ea9aqFPbXa48zNkOBuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=BaWhzV5N; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=u8PSW+mE; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="BaWhzV5N";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="u8PSW+mE"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N9JonS2008613;
	Thu, 23 Jul 2026 05:15:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ItLAX6rRatNTFg6LMigSQlDmcaoOIy1bF9CcNUl9M
	ZM=; b=BaWhzV5NMrqutH3gxN5q3Zyn+4k1Wo3MA0fH2tyEAnCYs28WrZ2TTjCdK
	icuHz0wBjIueuwlXYWCeY5zM4KudLMdSEYnyneFD95vTT3c8dBBYIP6xrXHzNAM8
	46enf9dlcl3QdRYB5pnaF6BCn0z7+qEQUGd5fhWqvYjyMucMZNVMWSD7jMBJIdxr
	DIYP2knWIt4jlalFK0IMY8YpPHi5OjnBBX+ZwCxW4jZxtkYXw8fyZHKwlGc6Zc0O
	Y0eDKnByIjyy9z/fCTOHEKU554q6OhKolPLBAAjTb+nJObTVj7XOqj5DdGGlr5E4
	on69M2Zn9GVLKUD+75foEUNpogTVQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011053.outbound.protection.outlook.com [52.101.57.53])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fkg7ug6y9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 05:15:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCXE1GDqTVva/J1EVazj+Hagy4oTuj7TaHiLWBAo7lM59KreEpCwGDfvABfuho3+EqcSFumGpCda5uzUmlvYtwWPUKcWuYdBOJeNTeG7QbiyFNV1mxsh402WMBrVRBCS46ffFCXy93P+1m7lpK8/h49KY6Og1RDYKDqQvjieYY31LvO32uCVeF2Xtls3qMXyDu2xwp49g7pJrfonqfSUUH+3mVqnAkT/Rd5DMjDbjYAgt5Mke+vaX5Ltr14qW/tVLP03+oBiCXgagiz8+Yion0P0uSPWoO83H+RVbDEE2/ugFypfnVv34L/y1fhzFx6FY15ccs2xRHo6++SD7aXgdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItLAX6rRatNTFg6LMigSQlDmcaoOIy1bF9CcNUl9MZM=;
 b=LhdJjclgtlv2FNWK/irf2NnpKvAQJHh3hXmaSgXdcm4rUiiQZGd23wV+GYCBx2NzetDs6yiqWBbLAySz5o8qAbyyCkemuZzZIiFAVLTzW3WPQWznh8a9AYiGfzMTSEVy7hKekyvqOgRwZ7tVpuXecT/qHfQNkWyMP/9+bWgoxcL6Otvwe9IDHKsn5DViCB1/tklgmWqkmt121CoJiphTtmNuXq5U/dfe1C9wDzEDVjQfG21+DT8r/Cx37GS2/9m59f2nsPCNHCetR+1T1dZ7uM+E66O6GE8gX0B88HnElSIgBdocM329Mdym0vGQtb+PnJ1CJefoQZA/z2eI4oCvkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItLAX6rRatNTFg6LMigSQlDmcaoOIy1bF9CcNUl9MZM=;
 b=u8PSW+mE0/JyEMrCX1SbheaQ51dkqhAbOxlWVtC8PHSd0f23MaZ2uGcPgd2Li3TnD7jylu7Pej3badQt3lkdXtkfWJimBxCq8ksotF4Am+r85c5hm1W2FxjPREDmaOd/Q8WDwOVAN84Q+iZ4GomXFVVz1NX47jpy1V91pXQDm5M=
Received: from CH5PR04CA0004.namprd04.prod.outlook.com (2603:10b6:610:1f4::10)
 by PH0PR10MB7061.namprd10.prod.outlook.com (2603:10b6:510:284::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 10:15:26 +0000
Received: from DM2PEPF00003FC7.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::9c) by CH5PR04CA0004.outlook.office365.com
 (2603:10b6:610:1f4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 10:15:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DM2PEPF00003FC7.mail.protection.outlook.com (10.167.23.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 10:15:25 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 05:15:23 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 05:15:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 23 Jul 2026 05:15:23 -0500
Received: from [10.24.53.223] (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.53.223])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66NAFJcN1503212;
	Thu, 23 Jul 2026 05:15:19 -0500
Message-ID: <0b8a91f0-8a2e-4dfa-aecf-acb865442d53@ti.com>
Date: Thu, 23 Jul 2026 15:45:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] dt-bindings: phy: cadence-torrent: Update clocks for
 multilink SERDES
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <neil.armstrong@linaro.org>, <robh@kernel.org>, <sjakhade@cadence.com>,
        <vkoul@kernel.org>, <yamonkar@cadence.com>, <s-vadapalli@ti.com>
References: <20260722061831.1045884-1-g-praveen@ti.com>
 <20260723-venomous-nuthatch-of-inquire-dade7b@quoll>
Content-Language: en-US
From: Gokul Praveen <g-praveen@ti.com>
In-Reply-To: <20260723-venomous-nuthatch-of-inquire-dade7b@quoll>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC7:EE_|PH0PR10MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e062108-4204-49c5-0e0d-08dee8a35052
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|23010399003|10067099003|4143699003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	O+sYF1ATdNUj2S+hglN2giIBEPC88Y5uVCpBCe9bjJbogPszYyWMAPYBaRUZgsVYWJLVkKTrtsZB/NK+0Hx3EXF0kOAA0+NYZixl8uVqKL78uK5sB0PdLANGAL7J8is0MjQmmy6XoaVS7ozx7l5csXRWH+xp/fu/l9/GN7Q0GVIwyY25+6Lf/xlzFfNyfmKu5kqpQJDolRhMz2cb70FcpYurvN+XXJMdVE6ywn7U5HB8eOZ2T5IlcVzIYZBUxfH1GdCH38168hLAMe0MjaLkjZVPI9WHYvLG6Sj45AyVWOf5LXfmgpo7G1HuJm32lyyaCZDd3G3/PKLVXiGCarTOw5NmPlbzmz0KXhIqN4o+tJRHjg9anr7PlQljhoIRpLuWV4KooBNFXuuYH0mAVc/BN1NVpKbg14e+M1LkoV9yh1ez9ES8/IuSn5rWNUejD9LZVzACREnOMQr+MAnn5uolPeIYhANAzuxGRK0wHGya7VVfzAk+TV82V+9menEdBZXIJu20eqk55+4xsa6tdITuU15LKJ9QkIxPUwYkFoTcp31cvDTRLOsTzedgnc/9YMxx1aJKDwRMkyg8xKiMZUm68d4haSLU+tlciPLBb9xKqrxjODVgnFUYA0ki61us8ewPLyWDqr3fGabS6V9ZvJAsrFb12R02OlURC/fZKs9DR9CVL1Y455u+1TVa5uhTwnNIMXSecRfcN0pyD80dRK3zoA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(23010399003)(10067099003)(4143699003)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3cIdx+bbEelgHW8QxwbOtWkZGmk/tYpOP/m+axIYL+CEXIdEKv9ELiAtVWnkj9MRLRlZJzx0yJU/WjSmtjbECbK7ItmPmqAoIbC8NjgBTrMPlZ90AUhwAk9EAHBzkB1Fhs06FQL1eMTWPThoJjwOyrY/bOTAfFWimZGBP+pRsC1HDbvpmh10neL97OrZthUYD9P1ESDLcDsfTeFcrNmE5Drfs2ay1s/XYX/tIv6WOQtUNyIzWHEWaEPzdBtrs6rn0ux1JThPl6yzLnDFdwr4bUoN4cJK5n9TKW21wazCp273WeRX1nPpgFH2yudYmJUjOM2H+htG54Q/2ZFrbXUtuZHp+8prRSvHhVoZLHGvWBayVu2R5eKhTTdjNXRDKI6jF5+COs58ZSmh8W3zIDO1YeChJdEX8PgvHEg0bYrjonOUxsmaUBgx04hmkgzhy8fp
X-Exchange-RoutingPolicyChecked:
	lLz2/h/eHq/Lmtt3AhkOtVnOY0MNf1V56AdvzCad+hwkwwPRRzCqXJ1Mu0J4ku44RXWok+xFV9oRcgd3Jhja+hXQBY9/v2DI8iH6dLpOvJ5YtLo1EvuPkvwdbbQISVLlGZEjUYOjA0+Zucm86beqoDNBppxDCdNMy8VYUIcfitC0zKUMlD2Nex9w6u2Kz8JlvGtPbIy21g7rd9YqSJGOuxP+dpwtI6VnaMT7jymgTiS+maG2tzdJktLsEQFhqfVxiSEGP8N00tUPCCBEVJIg4Z5KIYoFL/w7erH86leBUrcb6LgfGhUQi61Un06HQ8V52nOwPXaH51uwtKE/lqDfrw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 10:15:25.7070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e062108-4204-49c5-0e0d-08dee8a35052
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7061
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMCBTYWx0ZWRfXzszcqBd+r0xJ
 lcGW+mBDSIY2B3JIan5GrAqFQzVGFvc0XAeFk21abcma64gbtwEji8Ew9bfEUSjyuFdDVOuc9JU
 1JNrtbZ71co10FwPshQF2Gla5jdgP2nxOvlTkXpxLHEFRudy92nlfbUj5ZsNGJ+v3Q6Ndo8vLNw
 rhydRzoYCawrkXE+7RhTKwxuLxGZvNWMF3m/Tocr3f6Qs0qAT/Vv+HuZpnWsvPiHsBqoMYLR41D
 WjamXjQLQjpPjVecnHLETPvsAFGtoFjeu0RRAtf4RJgTUuYPcV8gKiGwtReZi/mKaww1DLnCQfm
 dZLfvztZ0bw+Q8ULEHPjWWydLKaOwzNVlsMT+1BaKhaE67nCv1rTLhNAd1+4NNI8oPV7TAV+NUT
 1Qh2/D3kVLT2JYeUoKbng93qhdAfweAcxydY21T4KHw6SFIknUw5Sr/2uUCl8KL+HpvLIBZdXt+
 7eKMhKAfg3wK7e3U4XA==
X-Proofpoint-ORIG-GUID: G1vyzJE7qMdymiyIqgn2z-tMShbw7Uo8
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a61e9c6 cx=c_pps
 a=7AIX19wKKSH4vG2a64CeWA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=rydgXn8_Au4ypBn2xbEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMCBTYWx0ZWRfX/onWkryazVId
 ddrcV2sL5nKQ3nAaZXM+3Hy66uUX3Hvp84djWBbo9h4hPAuzn3RSJt4n1vYWpCFBDWZ5ot/e3/P
 2/M4A9TbJXaVwkX6YlSbKQt2JkO5EOQ=
X-Proofpoint-GUID: G1vyzJE7qMdymiyIqgn2z-tMShbw7Uo8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230100

Hi Krzystzof,

On 23/07/26 12:45, Krzysztof Kozlowski wrote:
> On Wed, Jul 22, 2026 at 11:48:31AM +0530, Gokul Praveen wrote:
>> For multilink SERDES configurations where each link requires a
>> different clock frequency, the SERDES provisions an additional
>> reference clock for PLL1. Hence, document it.
> The pll1 is already there.

Yes, but the existing configuration has a limitation as

it does not allow both pll1 and phy_en_refclk to be used at the same time.

>
> Also, the TI variant does it or cdns one or both?

Both of them.

Best Regards

Gokul Praveen

>
> Best regards,
> Krzysztof
>
