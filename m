Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530082;
	b=YNw1mFNDOoVpeYku1gm1hMcbFoTmZ+PRO83TGIh2urLM61Aci2CHt++XC9/RtEz9HKOO
	 8V6x8A9DPnhZ4sjlVFLQtcUg8fLW0FqZGc9swwP+ZsSfgoJZ3pU03b0KjJ3QbXwcTCHUu
	 LYRDPvqOzR+R8e4lFTLmfM8+A7u5oShHF8B/jDJwn+cvWYYFKfyww4CivETEquYu4XCk2
	 oeOVDW0+ev88kQyWpFw/kOvxIQ0Sm4HwPYr8Ku0HPjq8CDDk6m10SvzHaS2Si8kC4Be/A
	 bkBaOPAUTpsOGFSJzLeqyftOBGwNyRs0xaFoArHV3WxAF/Dc+reF6DReb9eVd2tpS5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530082;
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
	bh=6LQMpoN9tp4e2KbllfcYkbyvUI9DVOn+GgVnLjrkKTA=;
	b=cUUKYp3sOG8OhJY/KTQTimFDYYtMutl2tSf9/750mlI74AGkhLnfW3ELW8G2QhIa0zKp
	 wvFJ/hNBToyaGSoZAdRqb2AOVvlPAcODdxWu/hP40h/AsXw2OLUHNrFYWqRRD6jOEMDdR
	 FsUipk6QCJROUjy9OJi7V9WvCFhFC519ELTT6ys9vPaONG1hSVW6r4rleiNix6aa0Gan/
	 LpT2TbX0rBfvfLuxkkcOX+iQMjnQR5les0V5oy9oJVYHUl1kRbGZe0nFX8vYNjt0ClQzT
	 5hjizCHMZd+B4b73q1Y4tZizL60rKDE+PZpKJ4T3JrIWIsR7rlqEsloqwnyoREdRAjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=V6Lybgl1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.28
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011028.outbound.protection.outlook.com [52.101.65.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A402E606A31E;
	Tue, 24 Nov 2026 14:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A402E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=V6Lybgl1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXbLeJybPdk9wSIf50OQJG5fwIqYcGeSdmKrsdKjyhCVBi9AxYSJ0KE2j4W6NtBFws8ifO1XRk9iOGzxiIFSkqyLRqspEMaWtapXX/TJLKlPjOvGlnN+2Wb54cO1i02U9NjLS3pXBxmjhc32LD71BBYK0o15K4M2LuCuK0pcghgRyLWqs8RICeWXk+atfU9oG/5+M6enaDezAe9DhkZhsvVBzjjCj2YoPH2nVC79M+spM75nB3zuttWC8G+17SH+3Mw297fODIchmBznGCpK4O57PefUNgoaEKYeAj68IgqUOXzlOaYITIpJVurvktbVfJINKmjaPZqaStPkZKUd0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LQMpoN9tp4e2KbllfcYkbyvUI9DVOn+GgVnLjrkKTA=;
 b=aFaqd+CQlWOCnK7iJqHBjf6zt0Rzh0ryDQMPPyvb1D34/H+VxNqmvUZ4R6DqD57yTxsZShpcBacA1iUF5pnL7HlQ9q7+/gPzf1B2VAx5jkvfhWn7jGpPdd42gWqaIMVAWuumzhAAo/C2wn9/lO0i0WqfbcQUxOmbDGpSnc9veZPYOf6PYGiB9YsL5D9FKM0doFnu301kkw5mxeMGuAfwyGGWC02iN8WBkCLqLlAju/4YS+MZyTlA+XxA4lEvrWq4s3jGyRdrSJtCKnqZ+BTGer4OC7ry2cSkHQpnEufw33Mmm5/GHyKi0IsOa/weYEiSYJ8SBJbrQTJ8Yx1mUsvvyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LQMpoN9tp4e2KbllfcYkbyvUI9DVOn+GgVnLjrkKTA=;
 b=V6Lybgl1QcbAqz1wyH3znASUpa3SxlDHFulSB6KcTVwUWrRH/xal7ROdE4Id9hy5b25tMC0N9R9Ke3Uajqp2yi/LU4buLhRLXP/VDqwylM9BUdoMdZtwoK289Rlt/AKb6hUkIPQIrfw6cqZUFcxvk1D6q7NWijUvVrI0X+mmshSQwAYqFLsCxXUC2l0cjNBIr/BngSaBgjIVMkGCY1pejLBBMjTgOp1f1Wzbd0xzU51GJIeEqxmIqSFbL7vGfWdyhX+LQzZcuVM1PM7wKa7sno60mzBr7NAI/TqwB716R1eh8p6LdN59edqRPm7evZVIe/8YdxKGI8MRqSRHHXCWTQ==
Received: from LO3P265CA0033.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:387::16)
 by DB8PR10MB3815.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:160::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Tue, 24 Nov
 2026 14:21:16 +0000
Received: from MI3PEPF0000855A.eurprd05.prod.outlook.com
 (2603:10a6:600:387:cafe::86) by LO3P265CA0033.outlook.office365.com
 (2603:10a6:600:387::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 14:21:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF0000855A.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 14:21:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 15:22:02 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 15:21:13 +0100
Message-ID: <085f8dd2-8773-4db4-b838-040bf0f071b5@foss.st.com>
Date: Tue, 24 Nov 2026 15:21:12 +0100
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
Subject: Re: [PATCH v2] arm64: dts: st: add PSCI idle state to STM32MP25 CPU
 domains
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261119185544.v2.1.Ia5e0774883d237f5825b7090962b454294922558@changeid>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20261119185544.v2.1.Ia5e0774883d237f5825b7090962b454294922558@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000855A:EE_|DB8PR10MB3815:EE_
X-MS-Office365-Filtering-Correlation-Id: 468f0b3b-611e-4669-5a55-08df4a363320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|18002099003|22082099003|56012099006|11063799006|261028144727099003|261021123027099003|261022105027099003|261026121527099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	XOaIkEfOejKzco+w5pA0TyMwoM9ex2cHAToMr8Y1GO+5l9ZoGj+0bQd4Dyr7ou2yhEvF+g0W+gtM1Tmeo2gI261izAPGffV2V1sgoIGNSd4dt+oTt5kvU4A54rL906JKGcqiytraYK71P0iaJDtO+AWO8SgZPxEnOcBQiaIQXa0WTphcVVY+QDu5kfaBFtq/wSvpdpAJ8UwwEJ/CU6cG61FyideFNKrNRPDDgrYmuSwjEV5FJw8PgQJsxvPmr9cwQJwkcpW59tVLryXx09qs+aEducutN3tbvoYmxnLjRjstJVhuPHpV0+YiSDnr+cEMVEOgq004+CFvVmripWvHZRw96G9ob60Wwzy8ay8/JuHSKRmOcQwb4bHAMm/eSY99ym4B67kIP7Ph9CGQ4RFodivZsX2qa0aFmue5D96SxNSVS2905xpyLjn1NDsaL0j3iaqG+4niMc9M6VzfI2I49D1iQLWR/mb4V6L50bERR0QdxfsMDLtirRKiGFOExdQnMfX+58m5BoZ8JUjqjOon2MJn6Fe+JjBnWbkG5Tw0HcRa3aecnnA5qys42wnznZWKAkbw0nR5m0eRUNCR39JlVOoss1xBRT3oV7wjUfAkMpI0BxQ6P7E8F+MSuG+5RGnEOVfje7wgZSChNNCoMoB7GSrJ/xToMOLsD+oG2O468UlCllwStRlZzNjeOQOg3i8B10SD5Y8BJS4r1V5NfAGitQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(261028144727099003)(261021123027099003)(261022105027099003)(261026121527099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R/cWPFothx/fIN6IaP+W1FW/BOsgZ95nypQDruOcq6MsQ0lykAt5DMhiJRxTi+KpCmC487BOaNFRmctMdKTEIq7fvWjagZppRbYjvWrOWyCnIFFmELMhOFOdB4czDGlzRfHCyRsLg1KFx2NH15YY5kHpnqCSAD/UJnbE/qVsBX1jBpa8jJ4DbyDnlvcoHhHqywOW49OC0k8dL1h3vP2EKcuCaqCTdM6+lWUPj/prwBtYaWqy5N+tgHKPX/iSBxp7ApkkKs3BGfl0w00O9O0d/0xBZfVXmaAUENcocqDE5S0+7sEIxXduPWaP5/VybthBPMyHYR4cl/oi7X+JkRePJ43pmJyr3NFGZgkKWuQW6ydBoGfOnF2X+kjQA3rLLVWIhb0AkPZ8FSmBg7CQ5Tc7x9e9vnqAHBqpgq8D3gWshLra14GOoPlhAUsch16kisI1
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:21:15.5900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 468f0b3b-611e-4669-5a55-08df4a363320
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000855A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3815

Hi

On 11/19/26 18:55, Patrick Delaunay wrote:
> Define a PSCI CPU suspend state and reference it from both STM32MP25
> CPU power domains.
> 
> In OSI mode, PSCI power domains are initialized as off. The idle-state
> allows the CPU power-domain governor to manage them, avoiding probe
> stalls for devices that depend on the cluster power domain, including
> SDMMC1.
> 
> Fixes: 9c8d852dabbd ("arm64: dts: st: add power domain on stm32mp25")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---

Applied on stm32-fixes.

regards
alex
