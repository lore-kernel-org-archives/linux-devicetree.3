Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049463DBD6E;
	Wed, 25 Mar 2026 14:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774447569; cv=fail; b=S7IQ3DTnWa81X2AJiTpCtI4J8rIIhh6iaRquvJaIN9GXb46d5VwWNvHd+/Uuxkb7o5BPdlT9D60j4BMbayyZn+M36xHtXpO/m6Y6uyAHDKL8yCaBvFY/SMWLa+f9miF5mSI64wWTQiPC+gusxh4FzPlhiExS6bCJ7Uueq9bZNWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774447569; c=relaxed/simple;
	bh=LDsfUOeqnTKyFzuEAUEkVD8wMeiTbiakmLqqzIrbLGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YBqn5sOb3b/Wr7dRKie9FA7nC5hMks+GuYvowjZhnfDaqmOk0V+mOF2xJf15PPNyY6TPvI+fGUsX5Yyfe8v3FCiU5e96+eLMwdHHXOkYj/Vv9ekmAnfFhu8UlHt92e3Y/lni7p8gtnI5mgU+VFcKlJxhvP58muaalPK15QPDaqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=YtYFzpSG; arc=fail smtp.client-ip=52.101.70.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="YtYFzpSG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jhxhe6Md8/8kObnKC1Fit2pvEmDsBYq3csI20tBpbkUTZVpuD+06UU6e5M1Co0/wK1G+W+DKwViOjbEynQdV1KjOfI7e7F5aaz3Y6JlKeHstScDeWHAx0HN/sGv3X+AGmCerrTVJRY4dXyPh1SDhJrrhveRAf8CwTW3f4NNwOAuGZ/vetTAhnhIR27qxRlKIprKLDCm5Xl2ChzwBpzl9bIzKo/Ewc4MGQuo0QfivhVrsnqVYOrSVvp6pPWWTJaN/DK11fqNtKL5I6s0vnD/8DqZlI+TJr1Z3Pes/h/EmqdR2f9d8ILMWsFZdxEpXtBpcK8aD11FiNUMUX0tdcppSJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqxoRN5g0EKQMWQCd6IzRpFpiUiI25FuVz4/3jPuP10=;
 b=xk9C0yO+C6weQS5jma4gi7TbFw4OQNvS+azmLTwpW2wulq9wpg8zPzZ7xxPJecRNVrOTGMCaVoJRrXiz2w8kCxOpqQOJU4tpWlPoHOK8NhWftW9ckXp8rrMBgf4bhvgFQo3MbLrt/09KxoGGYASMpE+5PuFMaMS15MknBOsnyiCI5qQsPz5zNCBD8qwQS9aEQwxZFyOmsJpL/CFldSB+Gtpal3EEun0PjdBL3Pp+NkNxGAewudAfdY+aY8vrkIg80mIhmAmWYd2fFWDGCIzHjmhIQOr3NsnX7B/FO3AnAYZWu0/dw1TWENN7pGe+c7dtHFNkuyN+q2g3s2zxd48UzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqxoRN5g0EKQMWQCd6IzRpFpiUiI25FuVz4/3jPuP10=;
 b=YtYFzpSGJ2tUeOJ0m1cvPjedBuWKEW6Fy++YnI4S24siJV+JUUw8r6No6fjex5cI+B+RoaDr54LYQvu9p84YAP0dqce3Q0nE7dxWo3a3foI9TYNU1PJvw1ia4bmV5vS1ovCC9HwQ27DjHM4zOvINhv8kBoVkxz6FSYm0hJI9JuK0oRfCWToeJK/25cOjbn+d45xMj5w4e5jNFadRxD5SZtRwt/VyaY8SGKT6xL9nXq4y2NM0QK/8HFpw1+MT+Ij76YVIFBK31CWsWTXwvESPyWRvZGw7syqVTVeBY3vrLe+FbGRolJTr9EGDCLFkq6FjSFBOkUCKcfsojeB+/GkIwQ==
Received: from DU2PR04CA0074.eurprd04.prod.outlook.com (2603:10a6:10:232::19)
 by PAVPR10MB7260.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 14:06:03 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::40) by DU2PR04CA0074.outlook.office365.com
 (2603:10a6:10:232::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 14:06:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 25 Mar 2026 14:06:03 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Mar
 2026 15:08:32 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Mar
 2026 15:05:40 +0100
Message-ID: <2908a58f-90c8-45ef-8a6d-728bb7d0efaf@foss.st.com>
Date: Wed, 25 Mar 2026 15:05:39 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: omit unused pinctrl groups from stm32mp25
 dtb files
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260311-mp25_pinctrl_omit-v1-1-5a3d40046b10@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260311-mp25_pinctrl_omit-v1-1-5a3d40046b10@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FF:EE_|PAVPR10MB7260:EE_
X-MS-Office365-Filtering-Correlation-Id: ba28ace0-89ba-4f90-1fe5-08de8a77a698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	N2tpbZskm7Ga8IoyMZjvK+KJ/sYZi8RP6/EDYqwDgqSA7VYoLsWMkSoPhCmVeO+17UpD7Lo4UqrFgXnkIjJMz3XbuYG+SccelTo5E695IBk0gSbiib9wMDlejpzWNz7kr334OjsvMzVJelNzcYmQXo300SKJem+TgjmsrIPRcC9xijpof8mT7J8WFJVXRiRwyLtbscz0Wr49sLzrubsOpMImRkkcb/DsgJAH4cwRMjR4er3Nc0Ya866uOv25WEVnODG1EdrIGmaBeJ0MGySKLgUcxgCpD1juhFBbyTXKlscDiIXMHvKK5PR+3EC0nhN8mNtNgiaMFEDMQDNUjietybY43MAqz/pv+y9EF7cslgdxgQ8wVrxEFnf7dxIAOviykmum+SkPDMroh91uTjkuQIL8Nv9rPo7AJhCg2cpRCmRMuTVspm499Ec5IE0j8dJuobuv/RCp+gboXkUtg9P35bRrW4H0Gz5OOEN3+ixe2NE+AiXvUQ+zKGFZR1pZF8MI9Z+TY0+gZd+fOgKDSaYlbAdO4ahAMt3rrglDpmqZoGlQkATOC8am/MwFT7XSYAWmITAb1p7fj1REMnA0Bxyqgl0th/pSISBbr5Bk2as6XULgnzOSn8argCkQgcCjvI8Cw7Mbj3GHWXi74tsIiLR4ST3z3tGPm787bgl0JwuX0KRAhTTH9Leejnf9Aq/vnePQWLHNRC99ZAW65Cq+nG7N9JrH0Tohv4kBW0Bz+v4gficXAyiklVzF+qT5RZ+MXzI9hwpMcP8GEgOgy2R3cLat5w==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ffWRCBGrHsj/1NXhjYY1zAE5aGsdJ9RzLJRdEeZpga5ukFAgHv1rawQp9pE2Iacuby/67mqq5cjpfMQqKys1Y6KowkuzfPqrvuKEha5jtpmseroEtrwLZasgQvYJ58adBuh79KJQ1F2LR8RIgtFKcFdqxxloOrxmQSawEbs6T2oZkbC5jjBrQZ+m4ywV2k80DWlkiaFXZFrC4TUdLIqRyGSaZDZ7QvqTTIfCpwrln67tTSwf5+QbNnU6lT9vgi0m4EvJ/AsGKf0LTws+zupEbVsQUxC6JVCxgeHSFjTSqzZ8Blem0eC746/bq/sQ9nZEpabcvRGfgUIDhrUo7Imo14ybo4ElaZOj7WlAC9C3kgyxqGSuUPeJkvo6UYI8uRwZWFxjC3MNFLhxlJ0JTRdF3cf6RijbO8TfCmDdhLLuxKWlpX+sDGmS2rsLzv8mssLj
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:06:03.2812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba28ace0-89ba-4f90-1fe5-08de8a77a698
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7260

Dear Amélie

On 3/11/26 12:30, Amelie Delaunay wrote:
> stm32mp25-pinctrl.dtsi gathers all pinctrl groups from current and future
> STM32MP25-based boards. Some groups may remain unused by any board,
> resulting in wasted binary space.
> Adding /omit-if-no-ref/ to the groups will remove unused groups from the
> device tree blobs.
> 
> Use the following regex to update the file:
> 's/^\t[^:]\+: [^ ]\+ {$/\t\/omit-if-no-ref\/\n&/'
> Also, merge the duplicated pinctrl_z node.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 44 +++++++++++++++++++++++++--
>   1 file changed, 42 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
> index c34cd33cd855..a7ac9d08484c 100644
> --- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi

Applied on stm32-next.

Regards
Alex
