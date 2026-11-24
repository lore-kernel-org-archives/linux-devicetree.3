Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795529563;
	b=DGnzKpIyjahPs92bJrtaNyFDjQvnRp1s/+ugESJ/F7sskAuv5qU9qDTxTJqjcIiMzXZD
	 yB9rgHdXiat5SHuvfK+ddbdC+TmUv+qIA+awwh7oLPe46e4ORMN4S3b4BH1JGHjXMDbEY
	 lpY7PUYyDQvucQkl8BG2fqhldN0Px+QFetdPlo6aHS7KlVS4V3rsNalPMPjOPCTT1yluy
	 F1o3NFvOatButJSl/2ZWn3KQOtAllUhEWlDvy7zfGXrTJXCt+KnwZRJWHl/DIwtKAnO2W
	 MkEN0/foWFfYPnGeiXOdjQyoTKnczqeypooLsgNNmsuxOImYzJ8slKHFOup4Emo/wQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529563;
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
	bh=2zvkBTFpnDd9m5FrX1ALPeQh+KOreXEr0/JLN0qggqg=;
	b=VZQ8y7CN45iVsU1fDx42BJCPN2S+ejmL4CipEFmrOuIB7FHkPeNQya4SU3J4t73zEK63
	 vU3teUajStxW2djR/HQ2AO/sMwXROLT/uaVytCrpYGihJbdsczRxUyO7QlyCaG7qu4JOZ
	 K7IAm67X05fas20StN+5I/C4TNn7xcPeWtZqxe3aGVJ360RiRMJjEz+RffcwwBXWxChnr
	 6KNutFrB5IR/5PknCxLkLfS3bwxfTFQyVKZ3Nh8vvx5YtnLWkU+JFsmsManjcUT0U5sz4
	 PS//rVUPfVRa3V/Klxv+f0hT0djltrvBker7KQ9zM8OGOC3EajuLqfHywT7x0gKVErA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b="NLiD/a5y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.38
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012038.outbound.protection.outlook.com [52.101.66.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C5E606A31E;
	Tue, 24 Nov 2026 14:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66C5E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=NLiD/a5y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAxQCX8LqfcHRjIutxx/wVGqvR4eOi5l/3FHU8wF82FGnsE+YDLzGdfZWN0vlorJ3nT5XCVqycaTo0Of4WNJW6UECdyxewmKnokUXzySUPuCvxn+IUQ7ImWRlVycpjkemPAlRUfBLsEMcUtrb00/v43TRiaD88dLgKWApY+bRlkih6bI/SFuMJKFlr+PcR9+ShIceX9CrE9SQfy0mcLRHWhcQ0ZngOfqvxrO/JwP3FQBndFn9jGP/envi3LAC+/5mvsRos/E5/CIizgfhd/3coD0PTc0KYryCzFhNbHyDQk+uSfkY4psgUcJSBpoGBxaijtg4mw1GHWNRnaNui20tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zvkBTFpnDd9m5FrX1ALPeQh+KOreXEr0/JLN0qggqg=;
 b=WzN0+pZ1Z+49U0hC4ZwMV/LzOX2UqkMu8JxFe7PZE+LhK/6Iy3MVIJG2NHLGP7W1SJJxVn+RopJb/kcaIOWu1Xhm/F57Easb7C8SrI2EtDZGo2i5KwwA63GW6es4eUUX37XuzrxyhXjgAbz/B56DZla2si3yEivCz/fB+PMhmlB9XCoP8v720kIVBAO8g6zviNb3Q/+IMg1IVOCNiqVdLGxNTX6VWcXHf/Hl/0AFiyQf75iuXIeMg4nmL8ABIf7S0K+JnM944D/UHnL9J//VobDp6SG0CJ2V7Cd9bJt3EEA55NNRzRFXn7psjnMgKTwYNLNGHp/81teml1Ot7xPF1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zvkBTFpnDd9m5FrX1ALPeQh+KOreXEr0/JLN0qggqg=;
 b=NLiD/a5yFEzFPBkNiOW4IpKN3wKnrUUWhQmA3Nb8vjpckxtQxQXwDKoVmlt66hAzkgqOjh6Ojc1uAiOwUdHAE7CuyaqCqZJKZFglMihofluxwpqxfJDSwPLuhStcR0RBsxWryVvh8D38rQbVY55J+qk6GvkDJ8Wlykxfmp9WTzkTtyk1y5o1XmMi4yZRmb1S9fQdj1z9D0Lta1gEJJAGrwOxOaAFEkwJbbuv6eTZNWWcpM/pK0pm2oQFOznC/ECoiVpCmIGUpPN5YRw7IwmB1EsoeUDBPODMQ5KOyJ6hQLydoKNub3la+IccNPkBBVy4UFrjTbvjpjui1uPKYyfjKQ==
Received: from DUZPR01CA0154.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::24) by AMBPR10MB9707.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:76c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 14:12:40 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::99) by DUZPR01CA0154.outlook.office365.com
 (2603:10a6:10:4bd::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 14:12:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 24 Nov 2026 14:12:39 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 15:13:44 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 15:12:38 +0100
Message-ID: <f8c6d70e-e9d2-443f-8e6f-1459a9bf5aaa@foss.st.com>
Date: Tue, 24 Nov 2026 15:12:37 +0100
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
Subject: Re: [PATCH] arm64: dts: st: Move Bluetooth to USART2 on STM32MP23xx
 DHCOS SoM
To: Marek Vasut <marex@nabladev.com>, <linux-arm-kernel@lists.infradead.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
	<devicetree@vger.kernel.org>, <kernel@dh-electronics.com>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20261026125201.76716-1-marex@nabladev.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20261026125201.76716-1-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D05:EE_|AMBPR10MB9707:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a3512e5-bb4c-4b9b-8596-08df4a34ffb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|1800799024|82310400026|3023799007|261021123027099003|10067099003|11063799006|56012099006|261026140227099003|261021135927099003|261021121427099003|261022105027099003|261009223027099003|261026121527099003|261102123227099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	s8n8mwzWgeZUcU3kO8+uuHxGQCNj077jCn0RdxuPUkK/6Kd+bMa5BrDSMv3GUsDN1Y/NKtCjoWKE1Qmap6QHyOLRYIeoemmXIOR/LMe8xAUu0WCgFv4GqJDuSwNie94JAvMiU0s9eXRNP9yM23+9pdPVTkigWpCmHZXsk66t4fwvO26zEHlWxs0QgaUUtdz0AMRPHiC0iYytkFaEclGWEjmXeLveUMdFtdlNvFPKpSnSX6L7bpEpSuFpXcs8dBgobY/ToSX/nYLNIjUlM3eYGeNC/mFgGn4moxyV2gcV7qpR+JqwkObLCLK0pywiKFhnm73QFuCEEn7pu9Yd763+ChuuUwO+RAvtGDObxGKF4AEq/1tj4GHdDYqrB33DILQzd2OLFmjIbxu4Do4OL2+z7aTKVkXyCzweU74zWJydGPD/ApA5+BBGRzGDtTpWaivF49d8EbqmL1Nvx4YHLt8qePWQl8QjtLlEqYwKvIyIz45hDtQbpaWSVYBIoBRqmT9xYKBAKxqyZlsSHQnJwwvMRA8og4+aOEL96GV+r4ahE/LhOPsqLkyWHNKv4t2LhxxTW3BEoknAO0orMwCmI+hdb1Ml/Y8rTI+PjLJXsd7UTzQW36UjcQZPyKKFPSsMVszD8z0VFVMogXfp1YQ1X/R9W20Ko5AF1rUwcdHyDMuV3pzUva3+2qSgP1oJTSjPUQVuXlSDUdZt1xOKi7NFs/ZrCw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(1800799024)(82310400026)(3023799007)(261021123027099003)(10067099003)(11063799006)(56012099006)(261026140227099003)(261021135927099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026121527099003)(261102123227099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TEWKbNUtIq4ubGbMmKKgCCejQ3gb69AJS+H26bYSCpF+xy+o9MkP5c1f+iaVBqu1FfD5LmF5snangT7TnXtBkubCM6wqE10FRXyZKE7GxVhMVAAydYq3b6NHRPrQDXIDAvL+DfLGbv7q338fp/2sn+4IR90Kzvdk2Jp+45VzNz+twdg2Tw+tUupuIzEtT78uEC3cnjrY4KkVguzMjQ1vlbhGGxcCv7ExG5vz/YiUEDcyPArFe8YgUFSQ/PC0UgbIN70plXqEOjqTeC325HnAghoCEo5y3xjW6P/4EkOoodx6+j3ajW8gQlpoVOREcKdnx3TEPY2GHcXj/ZGDUW2Alkl3J6FmmUK0174E/MIzxGgxWjbS8KqM1na7Y/nSc65xpEkWHv+LRiAnQx+C9h6Vk97KbC4YnYZdIa2XCrOMY1sp/ERd04WBjRVmRFiHB+ZM
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:12:39.6718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3512e5-bb4c-4b9b-8596-08df4a34ffb0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB9707

Hi Marek

On 10/26/26 13:51, Marek Vasut wrote:
> The Bluetooth chip is connected to USART2 on STM32MP23xx DHCOS SoM,
> adjust the DT to match the schematic.
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
>   .../arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
> index ffdcceb2fa237..5d4624c3200ad 100644
> --- a/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
> @@ -24,7 +24,6 @@ &rv3032 {
>   	interrupts-extended = <&gpiod 10 IRQ_TYPE_EDGE_FALLING>;
>   };
>   
> -/* Bluetooth */
>   &usart1 {
>   	pinctrl-names = "default", "sleep", "idle";
>   	pinctrl-0 = <&usart1_pins_a>;
> @@ -32,15 +31,9 @@ &usart1 {
>   	pinctrl-2 = <&usart1_idle_pins_a>;
>   	uart-has-rtscts;
>   	status = "okay";
> -
> -	bluetooth {
> -		compatible = "infineon,cyw55572-bt";
> -		brcm,requires-autobaud-mode;
> -		max-speed = <3000000>;
> -		shutdown-gpios = <&ioexp 2 GPIO_ACTIVE_HIGH>;
> -	};
>   };
>   
> +/* Bluetooth */
>   &usart2 {
>   	pinctrl-names = "default", "sleep", "idle";
>   	pinctrl-0 = <&usart2_pins_b>;
> @@ -48,4 +41,11 @@ &usart2 {
>   	pinctrl-2 = <&usart2_idle_pins_b>;
>   	uart-has-rtscts;
>   	status = "okay";
> +
> +	bluetooth {
> +		compatible = "infineon,cyw55572-bt";
> +		brcm,requires-autobaud-mode;
> +		max-speed = <3000000>;
> +		shutdown-gpios = <&ioexp 2 GPIO_ACTIVE_HIGH>;
> +	};
>   };

Applied on stm32-fixes.

regards
Alex
