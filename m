Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795529748;
	b=RD80NfBrcVZaDedDUDhgT+GxGebaMjoJjhYQpraO42Gp0ujTKTKsB4Jkig5w1yfN0WA6
	 Mstrxe+UzP2C9hSEjQAwpBnB9MIE+cWGRvyY1TJBbl2LBCmJyaGNkOZr2+cYzeKDQleRU
	 gjdhjCiqqmn/crgSjgRGkd7VBbGljZ4R49sVB8eGFYlPnQcAp8EEgSgtcXkiLm6rI2ueS
	 oSAGb7d8Wv8tMsspCbiZN+CIZGmYocqoEYPPv4OdBM/MrMuMUuqLFVOivoqS4YSDryvuR
	 TSJKspE3nXklm1RZ6srJxOIuDq611TmoMriMZM5SmuQqjn3cU/PoRkWcH0Xb/z2PZcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529748;
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
	bh=PgFgOAGdvBDjrGcHKhisFicaLqzAMaB6HOOJFwKLCuo=;
	b=xMKlOqqFeQ0a81xMF7DtfezmtbleF/UkULql2yf8UG5lhAzySdhwG4wj7Rl0HtFMfsUZ
	 KhGWbhaN6gBMglEYxXhh3ZeVwdlG+a2vnkTmb1GnV+hthHPxih+H+Lq/yEA2SpVnswwyV
	 LpnTY5rJoUTZkCq/y3DcXHMPddVvJkkPOuQ4bfVBXlUAXqKc6n0vCvw88JwiNGhJXCAmC
	 yQT6mjkU285Wvs7VK2eAhgnXhDZIFjzMcoucTMW8DCmsekDommJHG1ujbSiWHaAijZMop
	 KKnwzx/I0/8o2qh7fOyahNnFeVX8MXBIQAY1PGnW4SMNc8YamYzkyH0gQLlTWTowyIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=YIwB3Eci;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.69
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013069.outbound.protection.outlook.com [40.107.162.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F2F606A321;
	Tue, 24 Nov 2026 14:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2F2F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=YIwB3Eci
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aC30AvNy76tMdBG2xp07G9wD3Y4f2sGDo3OjEV8Eg2t7B7C+REyCMIBE0SGAlq82of90IVZV/fZ1tUy8+AYOGpVXuWsQ408uK5yTjQDbebw+Dh53RgCyXr/GHYr2qq6zJSk+pZIVTDAa1ixU+BAVzcsRfMqCKtHWZGMOqSSFfbFjQEkjgn9PrishcORGgf2yowAlosygqzTgSvMVQ47qPMywtDJV5ajFgVlzDoF7C9A/zVUOjOo88MPV5Uy9vvipY1/3umvpChxqivhf2ekMRNe1gXtVOGrlqJSbo5kHVDOtE2jOrBqBahoq6uWKQoiC2Hmu332Anqpf1h1woo6+UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgFgOAGdvBDjrGcHKhisFicaLqzAMaB6HOOJFwKLCuo=;
 b=n2TDVeGEY5pxMPlvSiG20mVdan81JL5QH0SOGHtqHszuao+GzH2m1wahu4pK0acX96aqJIOPxPSanlhz7K5nDSGy9cRrY0+I+1heVOFGYZieAWnWitWblXqNOUXpDF3GoDaaCDYErH1bXSYDveQWU2rWAshc+msliWEJJ1qtY5UXsyJbR39kWPAD/anCkEWZENLx11ie0xlA8UQEX4/AEejJlQUEHVgN7lMvCO1GEXBoP6C39Suw+ez5ATGwIWfN/PCop2OJIj0Hx1jcwM7mgsWiDYVGxjroXbqmJK1WY/I5zzRbNPQRQk4mZh0t5b7U0mpUCdeUzHndKQ4PMGl0jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgFgOAGdvBDjrGcHKhisFicaLqzAMaB6HOOJFwKLCuo=;
 b=YIwB3Ecin3TjIMUack+iSe4nAiDLVjeXwpf4VV5m3T+gj53Mo2yiQYcaTMqernNvnzbkuE9jZXD5o3SRkCJsHgPB158bzMhxXsVC9IrisJ3PmCnXR9y/yOpnqiYRpRwMYeow3ZBh0c/NUbBrllYawyTmZqgcID3420UW10ir2/SiPGhNJLnO25VFjq6fuFhxEQ/hWh93H3sCNEgXllPlv/e7MDCizbrks0cxDd0sWD8nczrWWZi4egc6UqeKgLjg8j8Gg9+nvSDihb99d1LmN5g1o6+yd00uPAXuhp9vc70xTJljI95vY+lSs1p/QcEgW3DLHtSmm0/DxHjA1xsSow==
Received: from LO2P265CA0496.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13a::21)
 by GV1PR10MB6010.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:5d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Tue, 24 Nov
 2026 14:15:42 +0000
Received: from MI3PEPF0000847D.eurprd02.prod.outlook.com
 (2603:10a6:600:13a:cafe::ad) by LO2P265CA0496.outlook.office365.com
 (2603:10a6:600:13a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 14:15:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF0000847D.mail.protection.outlook.com (10.167.240.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 14:15:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 15:16:30 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 15:15:41 +0100
Message-ID: <42602329-d9ec-4762-a79e-ff135b0689e5@foss.st.com>
Date: Tue, 24 Nov 2026 15:15:40 +0100
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
Subject: Re: [PATCH] arm64: dts: st: Update gpio-line-names on STM32MP23xx
 DHCOS SoM
To: Marek Vasut <marex@nabladev.com>, <linux-arm-kernel@lists.infradead.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
	<devicetree@vger.kernel.org>, <kernel@dh-electronics.com>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20261026125240.76753-1-marex@nabladev.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20261026125240.76753-1-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000847D:EE_|GV1PR10MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 440a9c28-f537-4ea5-0c50-08df4a356c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|36860700016|82310400026|10067099003|261021123027099003|261009223027099003|11063799006|56012099006|261021135927099003|261021121427099003|261028144727099003|261102123227099003|261022105027099003|261026121527099003|261026140227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jg5HzYPc5lfdXF3O1xigEELBmkLr9nDkl2QJMJuqlVCgBOhEh2MgVne8paaWHmEBad1BZm11eArG0jwZuYObnB5aeAJsVNcHqJ1+JT2YkqpM5j/LT2/5IMU2s2M4c6VuKQFbnLZWO/PN75FSKL9c4BS8F753M/KC5ltLImn95EY9yImDoUR6aUpgo8rKN7wjGek8DM7m+OLB1kMBELdJ5K37dFmFb1zzsu5OfqjC/3L6hCPay69J/I51q1P7aNhM8KpEuS9LgAmOYnLQ4alwf6OFOrvJlYFFRgOr0hnqa9swEAC4BkIpoUPhis4noQVLP6wbJfmaIc2RY8z9dtICeXBJuY5yHpytq7XOfiNKpRfJTd6Nukif0FeCeqX7C1Aeh/NAlNLGtzr4ATKEyzhuUM7ajc1P4Bt7UWm8jHSpMHfvVzwDycnmm7VlB8xKCeFkrEvojbCp/EOGVHOpyudLS5J71q4Acg9T51okaJOdtvjuOR0H9KbZ6NpHHHB2S8SK+yjQxEkJd4lzFuLG8r78xlXPa9WxppbktJRi9tywzVJr9/8hC9wEoh+fwCEykj9nSnwN5eB9cozxf2tEkfWdmLV3yl5887SPmDhUFq1rTcm3ZoyoXT4v7Cz1n7Y8DWJoMZ5BbBFzgV3MivZUKE6qs5abdxii1ZDBq4IsHeN4VxK0nsaXAr7OcKIYD3qeMr7gMvGKMCAvQXvZuweusaJO3A==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(36860700016)(82310400026)(10067099003)(261021123027099003)(261009223027099003)(11063799006)(56012099006)(261021135927099003)(261021121427099003)(261028144727099003)(261102123227099003)(261022105027099003)(261026121527099003)(261026140227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+UVdkwOEH95Uds5fEXWWYtLmFDE5zUQUKlUQBiZWOh7m/PTsJUwZdL2p8baNhiCSmM6cop3tbyjaLcV87HGaF3G7WwjWIj+u0/JMfRTJDYmazMpilvWVwr78+Yiy3JE0cYUzFzenRGdBho3wOk5VSpyC/cB/5TGmROGRN4HGV1tQMueGjYVS1J7SjStnRRPMFqNGecO1xMl1y93ShQ7jJFewxjkMgcpZ/EJviARLmUEQA7e3QGXY1Cr+NbY32oW1rDnvB9EMi9TcrFtX6kGqJW1QdDTkmNuf9pV1327eFaDRHQFwHiNJjbGas5iZwXYnKcBeTUYsh6Z1smDQLF7Z1Oh+dt5cJN265B0/Io3hBDtI8EF6khNaZunE2toqUKFnyvJYzfceZ4DYPcgOOnsCTRgfPtkO7QoT6Lb+qsCDNxMxaBWFhy5gHtH8twVUjRoB
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:15:42.3066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 440a9c28-f537-4ea5-0c50-08df4a356c78
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000847D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6010

Hi Marek

On 10/26/26 13:52, Marek Vasut wrote:
> Adjust gpio-line-names to match both STM32MP23xx and STM32MP25xx DHCOS
> SoM pads respectively in their matching SoM DTs.
> 
> Fixes: 6642d6a47901 ("arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC")
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
>   .../boot/dts/st/stm32mp23xx-dhcos-som.dtsi    | 54 +++++++++++++++++++
>   .../boot/dts/st/stm32mp25xx-dhcos-som.dtsi    | 47 ++++++++++++++++
>   .../boot/dts/st/stm32mp2xxx-dhcos-som.dtsi    | 45 ----------------
>   3 files changed, 101 insertions(+), 45 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
> index 5d4624c3200ad..7a95f56bf857f 100644
> --- a/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
> @@ -20,6 +20,60 @@ aliases {

...

Applied on stm32-fixes.

thanks
Alex
