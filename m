Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530308;
	b=2686PdeSv8cQy4UtnQfMgxR1qhnUeTzPq7xcxxpeQ73IK8Dd2hT5qWNJFk6jKUloXgbN
	 vTi9oqVNNbnYkro8iqoCyGINUFsciofRY9DjlZMEiILetXHHldhJoxBbwBjIKbjkQkpR9
	 RBgusqYWxY6LrMdXFZiCJ3PHob7JKF5EZ21G0/CA0VGIDdsjhQ8MGcfxTcPhn8xwPEGrW
	 /H8BTrol2XMjTDuTdUayDrF86/MOI+KRpJI9eH+bbJqAFIaqxix+YT3kdOI2zHJthcACN
	 0TnVli/rXNkSbyVBFKjBjMrztfNBBLmqAph6XhUQpXrECeQPS2LlC5qISePAMI2Llmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530308;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=3ucKS45RXEHn2gU7vhNXFmg0bqnAk6ju+Nq34BVO1yk=;
	b=eJ6U3uaou6crfU2HUMyWiXk6T0m+1QoBLZIUU/mUJnBxL2I4DcmhqxV1OPR9X+Sq/Nzb
	 i9ZluIDR70iP+/mPWMCy9EjFTMSAqV6XtqMlGRPtXRMUo2ZyFxoxDCIPsWDNaSCBVtPF+
	 aAJPaWVMb6XuQIzsKrgf3iIvPZMVvpSK8G3z1u5G16eU8Wd4BhntT9AxHR9EIvRgOH+4g
	 C4ZT1SaSZ5cZyK7MeUsNEiKvZsLxzCvGfpjSaamxeAKNnmC6u7u+LAY7Q3Vqc3ebmJLzb
	 xElVWJdPclkBgthONHxMN1TQSGjczPeWv2kldSCOFem9j/6rKi6dCXZA7S4N2K/n3xA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=og2ZiiB9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.48
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013048.outbound.protection.outlook.com [52.101.72.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB17606A31E;
	Tue, 24 Nov 2026 14:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AB17606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=og2ZiiB9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEth1D0EY1kH442i4/h34Pe+fIZeVzlXY0vDmoTnChCbh/JEBLHwpn3MiTPLgAOdZqoMqEkGz4cg+l31S40ojmvj2Z4NiJFeWQSNAHyolYXktEQB+f6Hbm0bWoSCOdnP83HwhU+cYEEqCtRCt70Nkh0383R6UndO7IauNuwW4FAalXUHeUdbjkBBYueBXuFhqqRnOot30cdjSF5d2uut+vtYwys1g0yd5w6eDi6VTTOPd4J7sjVqWhyxYtAVB3ALRq+JHs2bVg2m3SmOftylvn+rjMH2LThS1B4ZJbADefvsNUHjAs91zk1f/X76R4RBYtXorIFwwqRsbhTTHC/Xlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ucKS45RXEHn2gU7vhNXFmg0bqnAk6ju+Nq34BVO1yk=;
 b=ueB8/uWVxSU0iDa1fPZj5AvF4UadBNlE3r2Os5+bTRmH7RRCoqFJzW9o60CAzoWMUSu1QZssAR+26qK/ijbjDjZuptzq6Cxagt+5cPKWglRSYubxB/4dMRh1PqIzJ7SMJMIowjJMTTAiOrMvewKf7cyJ2jcYEibnBSasWYgjaQnxzGRefj3c909v7aIHCb5nNuQ5g9OUvk4JTdy9UgPhZLtHyT7Hvz2xjUKaQ+LTFkkJuT268dARYmyyRXzRKro3HLn1ymXUwMWEGMAF8rNTj6qgb5kZrzfOtvCskOvLuhMG7Ro8EIm12G4jZDDJUUgZ72GdjIE633K1Pp5y2UlB/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ucKS45RXEHn2gU7vhNXFmg0bqnAk6ju+Nq34BVO1yk=;
 b=og2ZiiB9+h4Yz8e5dmLBcGTcL5uBdw26UhtaHHjD28z1veYAdHvVmxKo1LhRqtwDU9LTK+u8N+vbSi1Gl1FKOWYRxF71dO0kQruvq2nRxKeIOZI6RtailMvonpxGgRvETyH4BGYbGMRhYiV3lZP5L4c7r8hO69iiOxu6jOAiSeon8TjxyawZO24vIj/9K26XrJeNu+bXP1hDiAVGYKvQZbHtl6gIjOACHMNfPpEezzNilx+iXpkIzND435o9KAfZV4tn1EPjdsI+XOSXdhYO4i5K6lExmRpUQjMxL0nZqvjgzE/0uG+HCfPIElCNPi2BN+3bN1WOn3b2BXqgHC8QQA==
Received: from GVX0EPF0005F6CF.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::64c) by MMZPR10MB615434.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:190:34::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 14:25:03 +0000
Received: from WA1PEPF00009B38.eurprd05.prod.outlook.com (2603:10a6:1d8::115)
 by GVX0EPF0005F6CF.outlook.office365.com (2603:10a6:158:401::64c) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.639.14 via Frontend Transport; Tue, 24 Nov 2026 14:25:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 WA1PEPF00009B38.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 14:25:03 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 15:25:19 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 15:24:14 +0100
Message-ID: <a3c0dd3c-d528-49fc-9c1a-94ca14023f96@foss.st.com>
Date: Tue, 24 Nov 2026 15:24:13 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: mark STM32MP23 timer as stopping in
 suspend
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Amelie
 Delaunay" <amelie.delaunay@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B38:EE_|MMZPR10MB615434:EE_
X-MS-Office365-Filtering-Correlation-Id: 18172374-e22d-4454-4fca-08df4a36bafe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|261022075727099003|261102123227099003|261021121427099003|261021123027099003|10067099003|11063799006|56012099006|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	qQ/Mss6xKW7ZdU3u6o0KnsvJFzit6lKSSSwVOSSYnCt/QdeuEhMAZBqmw+mpcTtTh5XjCpW//yXu36Gt0MAyyC1Ke+gXUr8k9KemeLGL+ZWAwNw096WgUrXrZQWIUQcA/9hJT/HAtZnJrp5Z15FA1s0pMDFaPRZgXVpBERZu9DGR78nO0scllcVO7DW73zbghYRqSXj0LoqgD71XGFpn68opGM1N9ucEAe5PwAoAPjevel0gQ+PgRkS6xZc3fdfbw/OsEOm8rmjATTIpZt16B0t2BNgj+0kAia4sV0WB1cNyOPnIJDUWM1wSK5uhVOxaBIvcZAMF5APCieoCpwmzQ7M2fMxwxpjR7xCIJ/WEtcmluCr9hiQ8WNhlZ4KvlHu98u63M3UhbgSjr/ZsVE2a/m/Kb7E35sQJJcb55eJ4VumiA8+lA5yWhjXdEJnUvalirfmxhaM5oggw318rHbYlovglKxHt5Xys1Iiin3ovlhPr607uOJV5OhDG8gcgdkQCTvt/i5TfX5IJZRK61Zc6K8GqrZEHh8CxmSx2UjF6vSNThj9+LdpcJEG6NZvm1ZLYRbD+LqfZ+29Ucqn6dhoM5wUxE/tzoy1W0BxrJ51bD+JILf9ew8QRYc85KKkAydfOGRs57JdP2uqW81tp9zWQxhH2sZKfekm2+5iRalNbmYNSCPRMiPhFpnSJy5RWp2hZRjJXg2R8R2PublnJHRgDGA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(261022075727099003)(261102123227099003)(261021121427099003)(261021123027099003)(10067099003)(11063799006)(56012099006)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	He/rkupT380AIRiXoliwHG2RH/trblVwt6GQy+jYniLu6Oz/L3ehq66C87gh0iDdgA6xYid5kCaD04Wo4Uw+wv1kLuLFok9MenUpJJOoK1RUg4MAXtcA5h4dLis/yuZnMMBb2cPeZh0vuJAY+75HZk75iARiDOV1RPgUvovmfcEMfGGYZeUzx49+fRKmEgZPKZTaCoHgjUsA/ZWdktOBcECg9gdSKrBWusAnxOd8wgOeg0yYflUA9k49IxQ98qX5zNJdrPLruq8SIhaVUFbYjxUs9IKPcEfzg2XYzzLvJR0B0B3QLiGvJEuwVCb78Ak56vjbAqIUw0T88nZ68wojbYGf4CiT8KtxKmPGf8LS54FmJ5EM+fYWDvWllmOT7TrdsBl5xPzr/F1bhwK9xf0sAT9ep6EwVbB6nYMiWwS+LTGaDMUAEdXkjODNuLEdnUR/
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:25:03.4775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18172374-e22d-4454-4fca-08df4a36bafe
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF00009B38.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR10MB615434

hi

On 10/30/26 10:29, Patrick Delaunay wrote:
> The generic ARM timer, based on STGEN, stops ticking in low-power
> states such as Stop1. Replace the always-on property with
> arm,no-tick-in-suspend in the STM32MP23 timer node, matching the
> STM32MP25 configuration.
> 
> Fixes: e9b03ef21386 ("arm64: dts: st: introduce stm32mp23 SoCs family")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>   arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> index fefbf6f4f153..a7970fdebec7 100644
> --- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> @@ -143,7 +143,7 @@ timer {
>   			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
>   			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
>   			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
> -		always-on;
> +		arm,no-tick-in-suspend;
>   	};
>   
>   	soc@0 {
> ---
> base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
> branch: sdfsdfssfdfsd
> 

Applied on stm32-fixes

Alex
