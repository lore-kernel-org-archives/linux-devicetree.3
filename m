Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B1140FDAC;
	Tue, 30 Jun 2026 13:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824404; cv=fail; b=Si17rZ+yLgF9yiXq/lyETYtrtIeCSlLXlE4eXivhnuJ6X+tNaYu323E43Wg8g5jR4ZdXAxdSQFAry8py1OugdoE5Nfyzy/j/jY5VVpNArjjVYaRus6Jb7xKLISewU3OaVPM+KDZKCIfGRX5O8IQ8GENVfOPodS4Nkb/PrQeyZf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824404; c=relaxed/simple;
	bh=m/WguH4F7PkoGYjYeVFzKLlx8Uk2eC98t62zz82jyVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nJMyWsEplqGUZBfVnkZvxrx/DccrwPzUPsCtU9kABSlDPfyxvmtAwDc2zpLkcvD9pLJ6m7P/5ezu5tQscx6z6HLai4K/Oa9faIaxmfhpH2sXQs+l9IFuBNRy6b+ugqHFbo1p1fCi6MnIVt3ok0PqQf7MfJJZOpgauMAWQe2RNU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=OuGQeFSX; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JQjWty6Z; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="OuGQeFSX";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JQjWty6Z"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9lFIP504259;
	Tue, 30 Jun 2026 07:59:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=m/WguH4F7PkoGYjYeVFzKLlx8Uk2eC98t62zz82jy
	VE=; b=OuGQeFSX2E6fOPjIVQNetAM7Ub9m43yGf5JbbRWNyrEmVrl+jEDEhqxRk
	qorcNr+zYRGjOiUag4wsiPyZLkGyxWu607KVxuOS9ii7CJBykLdTSBBxRVyV9+EO
	61uGLJ9rxdSZamjEVvfH/V6Ev2DfGJtPUU19svGSj5VNeIYz/3AbO1ffwRcm2XXP
	z53JcEcAu+Ar5joAyZEBj2/KMAKaD6wKt+bHabBExxIb5p6i36vjcduVPZxmGqfN
	b9uS4EekoCgn9Jdreo5+fgZnJP8ZIhDTVeAlCdbnKYyuas3NApmAnRVEY7TnTrY1
	3QDw6kS+jgiKHfwqzJucyoCCE2bPQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011030.outbound.protection.outlook.com [40.107.208.30])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f47k7aaak-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 07:59:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZxDkiUd9V50USk96XTAtGXjaMPHk04xpGevTECS2lYaNgVQmje2kRB1e74TmSywTQm3BZ12rOae8XqZoiBRREQedM3mQff3y8VSkxJBKDQUmOF1ZZG0gjVz0HERrnDzz92FFH2cz4VzjiQLj1S0KCOUczRbSyz3GAGy4q8oo5NcUJ/LlK9lAIV77afuqftNMiux/li9v5Zl46CHaxtt9zeYmxTDWHRCm57875YyTVpXIh5OdZoQQ6G5NZTwRFN2QAG7ELJAURsCSHhDVEH5NVZWZebSgLpGafsP0JFKihzhWbfj0pP2khKKrgA88gqJNU16pnBbRvLepqFqTfCymPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/WguH4F7PkoGYjYeVFzKLlx8Uk2eC98t62zz82jyVE=;
 b=BEq2yNUQ1zuNdZopCunYZu3ml45VMTYifZ7jeZOqLSesGI+tbTpYvkt3s++0h+rXLnmYo5HiKD9AHxMrb88s07MUX+AeagwoeRwHT9Encbvs3acU7c3B+IFofnSBakx7PJlrUmZLyG0Hi3M2CspBPg22n5bVfT2fQgqzsXTAQuhJDn1BUgo83h7tTLrlpRtEUQqKhBv+oMRZW1g5p10R9OshGyfwoZmd8ZRoeg02I0o3/Gk3+saGmQTbR4L1hzNXQU5Iv6IL+eXAklKj9n8yMN1IrTWeoWXb7c5SxaJiiht4levUXoOTSCAN4e0VS76nt0WlNv+Z5HeFrE1HoTWHCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/WguH4F7PkoGYjYeVFzKLlx8Uk2eC98t62zz82jyVE=;
 b=JQjWty6ZcgCiEI9TG6Hlka0OoM5SSYidDHwGysSdL2icPJMSWlQ0lwHvPPzgXWKwrg1mqXkvap5P01RMV0UDQKBWJSbihRsrpvnR2euJrE1Sun5C/0L6JutypRjdW3rs/iBRXyQgKvPBE22Jxqd3pq9Xx62eSGHPU9hp686qGPQ=
Received: from MW4PR04CA0215.namprd04.prod.outlook.com (2603:10b6:303:87::10)
 by CH4PR10MB8228.namprd10.prod.outlook.com (2603:10b6:610:1f6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 12:59:53 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:303:87:cafe::4a) by MW4PR04CA0215.outlook.office365.com
 (2603:10b6:303:87::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 12:59:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 12:59:52 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 07:59:51 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 07:59:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 07:59:51 -0500
Received: from [10.24.50.145] (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65UCxlEN3104570;
	Tue, 30 Jun 2026 07:59:48 -0500
Message-ID: <fb62e884-2cee-4fb3-b9c3-5c2f2516883a@ti.com>
Date: Tue, 30 Jun 2026 18:29:47 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: ti: Add PLL1 refclk to J784S4 SoC
 SERDES node
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <conor+dt@kernel.org>,
        <c-vankar@ti.com>, <s-vadapalli@ti.com>, <krzk+dt@kernel.org>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260629102308.56616-1-g-praveen@ti.com>
 <20260629102308.56616-2-g-praveen@ti.com>
 <20260630-masked-slug-of-judgment-732aad@quoll>
Content-Language: en-US
From: Gokul Praveen <g-praveen@ti.com>
In-Reply-To: <20260630-masked-slug-of-judgment-732aad@quoll>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|CH4PR10MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: e49b18f1-44a2-4423-7cd7-08ded6a779d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|23010399003|56012099006|4143699003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	yOvTus0aO1tOSa8RNC4dZ2Fj/+2ZJ5BnzwTxpDiDePRIz/lSPnhRwKdBWDFY80mIETFxOriUFWeyb288vJfJ5u7zxYD1DcQDsJTjQNJoJa8r+ACMmGuew3494M974TjZwwfcbjqkpRb7/ixCPih8yyDEvaF1prP4mipO+LY/W3yMPEtw2IIKZ4XmGmQogE1rd3JsE4zeAHYbJqb4ujtRBmDlH9hdU01VVS0893jKE1XjdTo8toAclTcZlJLnE60Rr04bimdscZbF3YaFm0eR9jICNViy548ChB6/ZnPjP7m9tQkrMvzWmhynSPRQqiCUmYCCo1ncj9Jd5xfhw1vhcnISDDHue11P3qnpghWu7dU6srjWOa8iF8mTdDz2xmgz8qM9oGPiGCdRpKjmIES9S03up0ByvFhUnonkY2XqyuxfkL8SeQXxRlwdjj1KlOQULsECYbUbijr3ypEM0N0UrMtadA2nJGt3u5zZ0xPKinDBzorj4Qdx2Jg2/a5waisTvH5lm2qRISi9RhpbYkp5JUmTVqjmE41xoSv3znhebe4UOJdHORn63O6pMSStG2xK01kMmwZuD47E8fEmeDG6mhJCQEOHqeBIU9IE0iGA3mNGkbr0bhTsikBRDBLSd8GYcWDPghgQme94CUsA7QA3qIf3JmeVKsQZjf6NZX3RqyN7efgKbX1R59MTuh8UGCydv8g8siqVEcsZnflJF/FlvA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(23010399003)(56012099006)(4143699003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4zb6ChfpodaUNp2V1C57DoySgJV97g+8wNh6mnNgfnHa97uN8trQqFiKwDx8oas/ihPZtQVpXXY9Qu+zZCgTqN8DboHK8GYyKiJkBni3MqUnMkPH7iZ0ZXItP2s+HdUrOi+nL2xoVC4CqXuJtyaFCoA7IlGkF1u6iU4P7i322q0bcK6nL9ktRo2wHH0pBdEtaCHb+1DaORD0OknNS9mBRNDE78iDs1jjopl2dH5HsSN7DWvoZwaJF51HCdWNUDimN79PzOJ1+LqxcrjJacDLPhXMbRC5PUl49Z+EdxWmFypc5LgEpTySEBCUeRoMtKqPHLXsu+enPFPfiB4qk+kwzRjR13l+kNXvMmCaNXZKZgphvtP8BLVPb/IIs3fLl4yU+a/RsiTOOVUnKczay2hRbQqOBX1kShAys5cRPROeTWqr4I4AF3huP6IlyHE5FE1U
X-Exchange-RoutingPolicyChecked:
	HdqvmfoH6To6jU9Z4sg2pnlkro5+8QqZ8JYn6M/lkBNFLowo5jOYY9pAz4qzwCE2tPCKoukEDdhmJrvhwsVDqEbZLrLtEZ/aUfp6mVRgS755BuZ+rNU2uDZNt1xLDRQCzjPr66NefuaZaqFZEofBNKfg1uDn7OpB8sdWOe469UrD2pMixT7LtER88FxFmfuoc2bTmk0TSqCuP+uIOAxJzvZW4/vTKZ9hOJAD3qVG7SnCX7wVrvk+SVi8yCMUObvattBnveTgLo9nOf+853LMnwLtOq4GnvaeqKuwXSFGH88PtpmU/jjwq8N+gQx2bXyxphdp5uu+Uz5CZH7iGyX+JA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 12:59:52.3910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e49b18f1-44a2-4423-7cd7-08ded6a779d6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8228
X-Proofpoint-GUID: 0tpHbF7OjkdlzeB3BTa9ZFjZWGiGC_UL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfX5vXPmmcFaKNX
 VxeJpQHFLNBcEo3xbk1mqNz4+YHYrMEpaRZMFwcZ+o1lJtWohjASWhsjlxvvlbVrxWiLA420Ecs
 dE4KPzPpH5jt/FVvc5111ffWGVkrFyM6xCMzaqjS6oD5ADc081v/MIZRHC+LKGW62Ruy+64MCrw
 5yNkS1Y34VZiJqSk44jknfiopsG58kNRfSfU6LBBvhyMoqEqIae6cNwsQhIaktm0/RhxIm6McTK
 /yVEQ1foLSuLZgImaLUb7hj4Ra6YildwWNdIFZbpjEoDR0bfgxfNlpwAjzx5p9mHPlv1JAjZm6Y
 WRGa64EIUVRkdoJFcHloEhhNJw9+zRhOIQca68g1DN89sWi7w4mqcw2/YIMFvIjX2X5raC+dXYm
 wyhHyXGQ0BSmr2UVLA8Vleo0UbjeC+rFcwVhzBT2xgLIGXApr8fUh0dpZwkKdWJRPrY/cmMHJNt
 J2IYtCsYX0/24iFbVsg==
X-Authority-Analysis: v=2.4 cv=UshT8ewB c=1 sm=1 tr=0 ts=6a43bdcb cx=c_pps
 a=ysgzExocFkmHQmNOaQPFvQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=UEx9eSJJLW7wVaxYkO8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfXznufBbPQvjSa
 Imn4km1aJ1EafTfBIJIkAUlM4I9XmMFLhaK42XNNcotyC8jf/OhXUq319dyB/ozDyco2bUBDKJ8
 p+lIiMVBbAbXxm88Xpe3auKEbYyWvZI=
X-Proofpoint-ORIG-GUID: 0tpHbF7OjkdlzeB3BTa9ZFjZWGiGC_UL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1011 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300120

Hi krzysztof,

On 30/06/26 12:43, Krzysztof Kozlowski wrote:
> On Mon, Jun 29, 2026 at 03:53:06PM +0530, Gokul Praveen wrote:
>> Add PLL1 refclk to "clocks" and "clock-names" parameter of SERDES2 node
>> as "assigned clocks" parameter has PLL1 and serdes multilink configuration
>> fails without PLL1.
>>
>> Signed-off-by: Gokul Praveen <g-praveen@ti.com>
>> ---
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.

Sure, I will fix the warnings. Thank you for the prompt feedback, Krzysztof.

Best Regards

Gokul Praveen

> Best regards,
> Krzysztof
>
