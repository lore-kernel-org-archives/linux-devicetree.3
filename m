Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795537118;
	b=gL5vhysoTh9470LzTSpmHD+8l53sS9Y7/kRmNcxLdbpWyjbZ5q+jLh7ImiQMzDWXPZOd
	 oVnIiW/8/o5rmafaubj/JnN6+55DxHk8adUQyinyLLH40mcfK2mSDl998pk7XtV2Hrs+u
	 Tw9PTHO1FYHvDLG1gloDoUHd/dIFqlDO8Fyv8pxrs1QqVx4yS8FG2A0+9Dx0g8hcnsMXj
	 Jqk/Wire6HV9U3+gT8VSWE7crMUVPbDqTCAD8EYGbnzSczed2xDzHUrMiB66xjdxamEVO
	 FxcM1llLe4eNIZtx85sjEVaA2s80Tmw/CKi5TcQeXQaBAkWYgYlMbM6+++WdSZH5nrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537118;
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
	bh=46uldnw9fZbBIOZe2YX01/yNb3tLUAE0QCm+8hJEZzs=;
	b=WziYyo1fM8vj1RxR7YBIsk+O1nZMqw4ImwIWQh7e4FSDQJRxeEAPwNyjJ0TJo5Osy/6G
	 L7JcvMNlsCyQKXOKTgyy0jxHzR4Hz82WAYOWjbALM2XzLrXv8KEd6bISg+hDAAXu5qOkA
	 ZcMJD1NE2bL7NqBfM/F4Zc9yISRFVnITuZ88mvYMTzkh/yuzyBqBjt2HkmpHpJVSHBE/5
	 OoqNU1vNDxW65C6voEyUrlbuqReNxQ8b7OU0kDzMN1ycZ8tTVeCslVyYnFw9isHNHdpl/
	 fou+RgHFLPEZ4Xv2a2FBvcO5RgXo1szn7WdjDzlKFzWgwgvu2md2OIVOELDl0ZBcxNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=B8GMGQXg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.14
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011014.outbound.protection.outlook.com [40.107.130.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BA0606A330;
	Tue, 24 Nov 2026 16:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1BA0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=B8GMGQXg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pwost8+btof0tBu/+/yytzHwQ/1PccxUZPPs1CIDC2VdpZ4lXCGEeW4XrUHacj7AGRzdt9zWKyHm75L/GLUD2387vh79cNTNeMNMvxEMApC41Ogyl4XRU6kGz9lKm27UZie06bsto+tV/yyLRWFuCTuSWUr2pXwcibb78InbmK6jCyiiKda0l+UB1QQNIXm88VC5C26vEc5QXf+H2S5R3ACXfFslCGPeupJHqcOMnJ+wJHaPzYJgQLRHt6Yo9dfE/6B5/OwS8gm6m3HRI/tCyP++ydNUbPS5RwqPpGs9yboHIqzYkvjU995BXczNQFIuo4NujQCieQgBOS4IZxmoMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46uldnw9fZbBIOZe2YX01/yNb3tLUAE0QCm+8hJEZzs=;
 b=auVNkBgpr6jC0co15jkH2gTUqDxM2HMmu966FIPyYifXQC3n2J2Z/rK7tHqYYT0IrKJJ1dHMnpCO9li7rGbZCQlgBxk43+D/jG+mF+/aGiKQlQ6ao4E/wHCK+sEc84YkBQuXkPORVvRV8bnNN1jckUHu88JQLXWrjUBgm1uAlrt69y/0mbpS5Sz+Etwly7dlrTVIXmzKmAK+39OecT5DCUyc/OP0N7K54UNTCgYPA6YMC0GHMM0acq4dnckeI7KqaqgE7Hn9YKo/VQbRKxmCqdsKLYaTzu6LCqGUKRg/ex5IrpxQZOSmo4ubEfFfni8pBfRaIx6my8BCqyTAmAWd6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46uldnw9fZbBIOZe2YX01/yNb3tLUAE0QCm+8hJEZzs=;
 b=B8GMGQXgkZ/ypkrBG77zXiqd0nmAPQdasgZ/ZAIgrirT36OWJM2m8S5A3ijxor8NM295ZJ2NtZb252PaPJGpFEdpu5fL+JD+xT4FfztAr1qYOkhvoanbWBTP1hQ++UjgogIsYdh+vn4wMzNuNcUD9UOzikvMlGNAslL/hfw63W0SI86Yn42pKPzZryQxUTt/PX0THFIMQ69KUNVNzy9vQ5zu8P3FH0GexBN4XKqsEXa4LN6Fil/c0XC9Inc9wys/lKXyStXtYxJHaSsKx8Syt+c5AnLoFn5/XFBGEGzjz4BTQ7V1bL9eTrtO5JIuJ9rEOv6RaX5IuuE7eqeEVBOzqA==
Received: from DUZPR01CA0194.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::19) by BR0PR10MB613821.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:2c8:61::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 16:18:33 +0000
Received: from MAD0EPF000008B7.eurprd04.prod.outlook.com
 (2603:10a6:10:4b6:cafe::43) by DUZPR01CA0194.outlook.office365.com
 (2603:10a6:10:4b6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 16:18:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008B7.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 16:18:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:19:37 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 17:18:31 +0100
Message-ID: <1a7384a1-fb23-4299-804a-67340bae0aec@foss.st.com>
Date: Tue, 24 Nov 2026 17:18:31 +0100
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
Subject: Re: [PATCH] ARM: dts: stm32: Convert GPIO hog to USB connector Vbus
 supply on STM32MP15xx DHCOM PicoITX
To: Marek Vasut <marex@nabladev.com>, <linux-arm-kernel@lists.infradead.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
	<devicetree@vger.kernel.org>, <kernel@dh-electronics.com>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20261022124138.185850-1-marex@nabladev.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20261022124138.185850-1-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B7:EE_|BR0PR10MB613821:EE_
X-MS-Office365-Filtering-Correlation-Id: 805a007f-d3f0-4f51-b289-08df4a4695b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|23010399003|1800799024|82310400026|10067099003|261102123227099003|11063799006|56012099006|261026121527099003|261021123027099003|261022105027099003|261021121427099003|261026140227099003|261021135927099003|261028144727099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Gtggl7d7fv5XZBc8AIjjlTDSeyfqWA9IkG0Mjvax7vz4hnADXJOYpbD4+eRJ2/48hpFVyKvkMuY3Xs995FYK3dWJrEKz1avu3hjBX3Sqs/ChW6X4SahyOmfzQtj2U2ASfEB4CVToOFaQ8cXBbDlxiMJc33yc2TgCCRLrInRouf7g7nsclwOr1bRFZaQSV5NL7enYxZIyClqw4WbmgpzwXgjkaeeU607P4uByJaZc/wvRLLYbmz0NmAgzzVgdROx/PeW+nEkIFnVAopwim1UVo6FcWYzQRVw61leSIpxeaurPUKOGgxm2TyxtABjiV3lYrp0ohUlzi6rETywfXrG216oGbxGvbQtB0PukQWyQfObMfEmcGfO8FZSjhht1QbzPEBUVNs2DUtLiYqcTYZxBgvKG/wYifXvLEBLVQSasA877DQq1HDVCQlYgGQVChOgWwubW/IHM4N47d0kfERvpraT8LhVlDBH9EGQOP22d3pFxYFlBZDzdVeF34uHBkqRR0rgo2xlCIvxqZxMKJFph+gXckbRjCkAO18dks6BUhLUaVIcwUjIF5M60AWZrAwzbTmJmLq6+M4pObZNldthrXKST2JvuLV7QR8JEH0EWwEzF81sF44dK9znPmeCXZ10WuH/q3H/QMeuVgTkk+b3EBu5IwZK1Pvq6xTnLrXxtvIA3n3uxwvAY81uruTPBnvLa2xxJTxF4T4xDqxyJoIUQzA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(10067099003)(261102123227099003)(11063799006)(56012099006)(261026121527099003)(261021123027099003)(261022105027099003)(261021121427099003)(261026140227099003)(261021135927099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+f8sPr4p3iBJxnCnsz+kVFjxYSCRi7DGfO4DPS1mrmuHexVTSTzWI2odcr40R7wO+nwf2sKPoL8GFrtRuIS6leXToGGAONPvFT4ZwaYjEr/KCDOol+S+R/kCudzq5/3DY2qEA2Cxr5junaWFpuq7z112q5eP4taMkqhQ7bFlYxrT1HdvzwxBR+wtt+wwHUCqOb14eJbzjUJokL+fkuOUyCuxegWqZcs+sazkMLevvFqh7B5V132ZO4w83gcr3oKEoQ6G84ESCzJQdNC0oq3PeUDNfV+hrrwDK+vtGEeK2GeqKlUnY6CJmAzo2qJjlvrzzC7NY5I+FSJYU/AEqRKzglzW20BezGYrFxO+J2jKCkC7fR3TSKqEwk54GCI+n4JV5RTnDG63A9klADe/4WguBHTQwhlNQLq1lisOQJssPY0tHzOw1SsNH5wnd2Is3fL2
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:18:32.8369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 805a007f-d3f0-4f51-b289-08df4a4695b1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B7.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR10MB613821

Hi Marek

On 10/22/26 14:40, Marek Vasut wrote:
> Replace current GPIO hog with USB-A connector vbus-supply.
> This moves the Vbus GPIO into port control, where it can
> be enabled and disabled by the controller as needed.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   .../dts/st/stm32mp15xx-dhcom-picoitx.dtsi     | 27 +++++++++----------
>   1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi
> index 01c693cc03446..7f444bd4c58d3 100644
> --- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi
> @@ -16,6 +16,14 @@ led-0 {

Applied on stm32-next.

regards
Alex
