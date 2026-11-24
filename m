Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530430;
	b=aJO7gSBgi1p325WgKjcsCmsjv2grDmbDwqgwV/QDZBBc09gioIgTjRZWFUHC32F7SLv+
	 E9YVZ4VeE+f9wsIPPa4cfK23I99GrGO23U3vSyggt47/UYVs58/9FLx1KRDKcnhdqLxXT
	 p1rwnyM+sv5ZvpOkf70DRhH68Ej6SEtYOuwKn9VHZXJddWXjR04weMYKGryDXTFF1n7u/
	 yA7CYfJmYxUAiufcGSz/MWhZe2lTwy5rNNRkwG7YozPTQsH/0bOVi4Eo4oRq+mrCwxU9m
	 uPM23KRCs2MTK6yyQeXUthrGJEWy8YbaStFhSgIsMSgMzE+L0vX+mrLWjJXnkXi87WA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530430;
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
	bh=8F/E1Htn7JfUl+A5hw7HiC8ZdBnUivPoq6fyABNHCBc=;
	b=O+vefS0ImVOf/RO6nXDA/Ry1xbRXE66QMQ8E/02MMs0pDAkuRmMLfaE2xvmBywMDZhPu
	 hGDxTiXwsBtE+H302ps8EF1ChWBB58JKt3fzOnqPuzZFJeqKrwfZFBK413W84XAPHHRJF
	 hsfMkcPQ5lu0oIPGJshobamx+A5O+xO6SxfHxkPwDmARbzN9j5Z9c6lASyz3IlGTUrWuX
	 Ik1gIWOEAKU1Lg0q1yCtKmDHUHRVFGyt/ZU6fIURc9Fh7KBmkSipFHFpk9aTYSVdhfg6N
	 RN4ekj9NSPv+G5KYLB5ab1AtLeSz5uda/ycMpITN2vYdQOIrKMAbYtB9hkZtZIEnpvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=iIO4m7J9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.22
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011022.outbound.protection.outlook.com [52.101.65.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27026606A31E;
	Tue, 24 Nov 2026 14:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27026606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=iIO4m7J9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKFCGqQ3IAvNcXy35GwIU44Akv27lTozqPWvM0+nJgDnI2Bg7A0VkokdpPLe7gL+PwCN7iWKVKHegveCMojqgcQiis1NE6MQj0a6ezvU4jn50eWXTdgFzXoymFRdAyk93s2u70OXpcVF60XNonmRpK2QDA2vNZ7+tWWd810NNY7ca5ALQbC6Ifa3CtQ3znfMNc7FmKC6rjlWAJv48oEEr8RHwAtgqFZ0wiuMJHRzT7h2R83Pt9erZSlDL+xxNHxJcIRn1KMJb83f8kudWBYKZnVJa4DQgBOjWUOJMtQgrt437YJERNvzDucRYdNbPAHKyu6OQtjH9Qi9BPsmr5qddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8F/E1Htn7JfUl+A5hw7HiC8ZdBnUivPoq6fyABNHCBc=;
 b=eauxNitmh0mw8y6r/hnccAbFnckzxuYkn/S1NvHPpUrL1Y2QhOUg49HGu05dtx7QwjBGGaff/xqdOIujprdIQtTuoeLBr+dm56BkncUyK3XC01YoGfzZSiRpse2zLbiwqALiAXXivJ3AsnYwvi7hDPrS/lGAYqvUgxqiRb1ddGdi2u7RG3Dk5aiod1O/ea8CtLwqhXkX79imemwY+ceTMKLWNjz3e801E6jAg2YZoFaMxXw86q+v6Zhovl4zVLsE5Y8ZjwMTjo7siwXpIBdqgaAgQ3P28p9H1VzBOZFDUBi7Vx6tDo0u/h7ap4i81tFmwxRWLtRDCwQY73Kypf/Ibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8F/E1Htn7JfUl+A5hw7HiC8ZdBnUivPoq6fyABNHCBc=;
 b=iIO4m7J99xY/lRTqb6NsLRlqwj4EFXTvwY3NB6onQMURtoE3MnvELayL8Dw1oplBcH0CCZ8jKTGZZ6t1i5DMWjOLvYpGLiQ3M0GPIWoPZCx6H0EuxT2k6XifYJzav2GO1I98H2iXDkgTOHmRjp7TaWZLsPoxvh2K7Wlq60T3/JX2oBauwSeBin7HzJCSWnTyLYhOmeNmR3hnCWCjngN3Cqms8Nn0H/ummrwuviJNdgtPxE1TV5m50OD8llBxtwR2s/CKe+jTm0F/bYrqGKmelPKck91SvK3SVgnjGvqsIWh2HCstKVVFdRaSU4+2ahlTNMCmjBO5Q/6V2/0FxjFLPw==
Received: from OS6P279CA0106.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:3c::8) by
 AM8PR10MB4083.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1e8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Tue, 24 Nov
 2026 14:27:06 +0000
Received: from WA1PEPF00009B38.eurprd05.prod.outlook.com
 (2603:10a6:e10:3c:cafe::28) by OS6P279CA0106.outlook.office365.com
 (2603:10a6:e10:3c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 14:27:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 WA1PEPF00009B38.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 14:27:06 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 15:27:45 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 15:26:39 +0100
Message-ID: <3e7501f4-59eb-43d3-9111-fbf391d09d12@foss.st.com>
Date: Tue, 24 Nov 2026 15:26:38 +0100
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
Subject: Re: [PATCH v2] arm64: dts: st: add PSCI idle state to STM32MP23 CPU
 domains
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Amelie
 Delaunay" <amelie.delaunay@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261119184209.v2.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20261119184209.v2.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B38:EE_|AM8PR10MB4083:EE_
X-MS-Office365-Filtering-Correlation-Id: 23d1e509-f283-48a6-0d84-08df4a370414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|10067099003|11063799006|56012099006|261009223027099003|261021123027099003|261022105027099003|261026121527099003|261022075727099003|261028144727099003|261026140227099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	FjkTud8z57H/MMRP4Z/ZEvS2A6X9S3braqzxBQ2eErGfKZOOKlecmXXYy4tXgOSURCga9XSouXNLWmY9pVYLzrjCq4IFPGJPUamT8LdhkXZMcF2VrBMqJoZFR+oYOO96er+pLQGGFDD8Gp/aElyPamQVM+CyumsNpi1FjKfZEzB4R+OsCUJXarm2oAISrbwYMaD5hsO/kmAS6TyLFOhVIKTB3Ohb8G+fwJaxgRsHbpi0yItFAADJx8Q10uQMxVf1Gaotq4uxAlK+pANeGcyDXbu0B626hj2/mlGB74Wo0Jdsv9V7NaSheyMbrQ6l/UkgOhjn638xZCOAg1K4BXF9ku8CJwO8rX3qjMR5gVNw8ZETo18l2yMEBEjGIQ6vyVqc7N9SZu3QPvU9TpQpX7aaGb+HQ9EHxKDg+Yj1q29c4cnBgplBJFvfs0OoISW15CpeQEim03SSAuUsdxJKA0xH+qkpW5Ud+xRwlj7kjhCo8h4WT/l8gQw3f63A6YmhgTM4v4/n34zVt2QvFOz9xlj2Vb8KOd+hLHvXstiE59vRdZBNhMN+o8OVtWLUDrlL694L0JXXhVSYeiePrrEQcF3cdzIzhho6XFGgXCEpz2YiKOvnnmuo0d78pOS9tRkWb1AFuivzqbNIK6dSdmq5C8cznD3fvscjXbYOxBwp9Ry019Q=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(10067099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261022105027099003)(261026121527099003)(261022075727099003)(261028144727099003)(261026140227099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lX51490LF3MoN6gKltq8c/DQFyeQYXTYSmBMSiiCNVB6zcIatlpKtBry5tvSNW4ihqlUExtqrC54LYNGjlpM90acVuiQpqsXXWYl4nO6s8X7oft30CmdB+vGbt1d9gxSujTN5+LAwPgH4tOngtGhOzMlHf4JP52bK9lZwLzeCVSHRoT61pudOi3QR3ZVLz6BM3kUYMk7IVmfJhoN6qVItbF48w0z4NJf58v6Vck1y9JJAUQS3iNFvgENRogRLPDODZ9mF+kaY2wlInhWc9UiPus1ASfYqH4InmgkHD/DzcOzzh8B2L6+13edxJFgXBRxim8P5L+gH/4QbhijefhXULLXixGxHDCEocMc1DV82CVdSVTXyebabrmgOnQsdXYWPgH9VSGkuoMHKj2L7VMnPQHZqq2uCOrvSNvsgU1BDXOgNzNDjTdQQ8pBX4RW+qT/
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:27:06.0960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d1e509-f283-48a6-0d84-08df4a370414
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF00009B38.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4083

Hi Patrick

On 11/19/26 18:42, Patrick Delaunay wrote:
> Define a PSCI CPU suspend state and reference it from both STM32MP23
> CPU power domains.
> 
> In OSI mode, PSCI power domains are initialized as off. The idle-state
> allows the CPU power-domain governor to manage them, avoiding probe
> stalls for devices that depend on the cluster power domain, including
> SDMMC1.
> 
> Fixes: e9b03ef21386 ("arm64: dts: st: introduce stm32mp23 SoCs family")
> Link: https://lore.kernel.org/all/20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid/
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> Hi,
> 
> It is v2 of previous patch [1], with only update of commit message.
> 
> I add a link on previous patch [2] which changes the timer node with
> compatible arm,armv8-timer, see Sashiko issue [3] for details.
> 
> [1] [PATCH] arm64: dts: st: add PSCI idle state to STM32MP23 CPU domains
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20261104133023.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid/
> https://lore.kernel.org/all/20261104133023.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid/
> 
> [2] [PATCH] arm64: dts: st: mark STM32MP23 timer as stopping in suspend
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid/
> https://lore.kernel.org/all/20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid/
> 
> [3] [High] arm64: dts: st: stm32mp231 cpu-sleep local-timer-stop conflicts with always-on
> https://lore.kernel.org/all/sashiko-outbox-197300@kernel.org/
> 
> Patrick
> 

Applied on stm32-fixes.

Alex


