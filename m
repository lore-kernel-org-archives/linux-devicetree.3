Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9317C39CD01;
	Mon, 10 Aug 2026 08:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786349895; cv=fail; b=TzyVTj1mEiW9hJ4nN+L3kygWzxXNLIyD0mqxT6ZXZ6LYQoAXPh3dKN/tfWEDLiIsDELtViM1lzqxKAxQrLcwO+JqnC37/hQ8jSMyFkc4Wp6R/3uDxMY4KSN5xpSmTrbuTX5hJV8UEoG6B4k21RZs3dpuReqgg7oMysEw8AI9dCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786349895; c=relaxed/simple;
	bh=XzVTJTc47ywSCVxoX/ouhTlfHd6dvqvNoRInqEOXwG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QE5O5B3/xVQjCbfENVSU6/MqJ97pf4wLse4WO7rmF2KdQ3Aff7OeKRP1QseNJ6tHLvuzXRa91qo4tkT5yACPpA5nKqP+lkiGJbaSz0oH6lKlFQoZSDP3MXjAPQRLnsVFGHm5cgYzwZTiJli62bBxn1IMvVcQILSEJXqN0nyJxRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=h3jCbT9w; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="h3jCbT9w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbkqnBCeQYenmyRcf7NXW11aGZn1tdS5JHhn5TpV9JBcLKgrbCB9Z7ruRXkdN10v/4NZ+7g2xBfn3psZ6JqVqT1GMPMBf9ubpLNoPe0m6TjdwBW2m0Ta5/3oZwHEZmWzt94hZVniCmvrZJ4msCKkWnIbw2wYMwqCfBCyUVbfkeJbO7y3a0TKm1/cVzlWr4ujud18EAzJuB9PlVergV3GkuY32U9SlhkSuWdvId9G3BJV0c9fwnxvyqqGo7YsHyeN2by6pL7FfsIVCdA9ETYaxblnK8ti90+INz5Mp5a/+Bm/t5XnumAAWCew0pQymMPfhY+6PWyre/jMC1CRj5CzMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6Sc98wohWQf5jGMAQ9JvdVySYESPqIKxJF0F2oYYJA=;
 b=tvY9iYPXPh56ZOrx366ktgxFlbw1jzTQCLrTsn+LDnbP+Tji/1tZxjMqY3qZbZoryqL+wXOuBO+OV398RCtplWFfEwtm0KSLgvf3O2bMLXxYAKBRSdF+YgAuBSTbSdj0hVjPpU8Aw380HN3ELsB9bKbM9hFcd2zNI+zIeA8Fg8+ei3B/FY4qWpDFjt6YPxpRpbSgkxRw+bO8dgVnvi8kmJPSQDEyoFmZv26D9g2YMRJyBjjix3l69Rv3CMkTMH1SIFjjqeS0Dn3kYoPy9GOUI+EiWdcU0dn6/sBAv4kk6fKamk7zeXy1L2Gt3UpVycc1/ifU2/gXQ3pxClIw+qE3TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6Sc98wohWQf5jGMAQ9JvdVySYESPqIKxJF0F2oYYJA=;
 b=h3jCbT9wjpAVj7fC4j1cBHnKKV31d3VuYOABd6BJg12SWU/40bXrvYPJP8K4vSzLVwtj8tZUT78eJUL2wxuhS3ZZyUAOqOce4JoUM2KomHCiiZw9/N0WYcNYRZdWuiSBmLkRts538MLr9MoGrxJew150hyt7Z1BBHitNUU8mgb3r3weYnAjDtiETI73NSgT3TE2m3i9dQ91DN7cc88BxWYhYb5CLvwhy5/jeHnOELAaYQAMwCQ2lhM7wCLilqe4WdOEl8po8vaw2IF1ICrk6m465ujhU7EhQz7y8VyAGrvebSQVFPH2lwKWdPG5+i5gow+bGMKUzYQo8YXssE8HIhQ==
Received: from DUZPR01CA0270.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::22) by AM0PR10MB3233.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:183::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 08:18:07 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::d) by DUZPR01CA0270.outlook.office365.com
 (2603:10a6:10:4b9::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 08:18:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 10 Aug 2026 08:18:06 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 10:23:00 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 10:18:05 +0200
Message-ID: <9adc2fdf-9ab2-4a7b-b215-4038ddd792c4@foss.st.com>
Date: Mon, 10 Aug 2026 10:18:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: st: add power-domains to sdmmc1 on
 stm32mp231
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-kernel@vger.kernel.org>
CC: <linux-amarula@amarulasolutions.com>, <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20260530135701.3961023-1-dario.binacchi@amarulasolutions.com>
 <20260530135701.3961023-2-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260530135701.3961023-2-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E2:EE_|AM0PR10MB3233:EE_
X-MS-Office365-Filtering-Correlation-Id: 1539212d-ee27-4ba5-960b-08def6b7e844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|7416014|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	NJtm3+89oyR8yM17dxMMsbjkL3HJchyet2qu56riCHC3Z0MqEG1G4sFIBegVUn2oClEonASNMA5WJM62Lw6bmYd8nbc9quF61LQPPQgoJG7LneanZUDDIO1N//6m4qg7VcoY2OGv1dQjG0bYm9yAyGP/W2Maj/hdszjFskeoAm9wqLbwZRckf2N5/8OmRii1QnK908Wj9LcOF3aUGLTP20oUQfD76KvVeZBNdcPqVzOUFbH0qruNVB39aweP74XOXpFc0z6eW0DpqU/hRR67/MNe4jsLD5UT4Sgm1S0nir5LWph0N+8veAloy4soHY1CVsYJn2YLPBc0Gal/cSdw6//6W30lbIDa/D6dFhmJUkXJECTRBDGwkXsATFWZRF9nauQk741CEmNVur/IcAvRwpHERaY0l4KEnkBCG0SQ24ymexV6hkqbG8/oj8S7Iv+WPXdq2b2WdAAh6LNuWOulHD3gVR26FW4Q9LGKNfWeROc7cTXMeUX07dUnOsBBHSLLZdVEX1lHXFiCGTgD1jG4/q3UPQAaQugBWjORPxd7DSQe6+3sp2Hb5769AvesYszhrev+tyr30pbBMnBPdE7IUnOJeeSTqDcpX3ehtQWGByivy5ci7XQ+Le+xLo3Op0lSnFlA1Pfc4acoYUv6aB0jScDL7x5hv8w8OQnUEuDOWFBU+BpO8ftT7tcxgcr9SBGd2wl+/NdDPc0rEOpYZTsvJQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(7416014)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	anCZU+VJuen5B+I2E/IYNrJAh3vdBwjtfHk+LJQDI51WEiFHZaZX57uD3mnWGS87U2aoEaEUApSt6eUx3pdaz3klpVWepQ1lYZiNftjFbxf4XzH4IGVQV0sc5zvtC+7kfMT1iP1tiMSMANtH5ZyZLfSEFhjHutZfg5vSmo5RvUhtjVJDzAl0/zgKAU5AOENwX5CmSz63CdEo2oBBmfOfvJziQWDCQHQSNd1BgteRKXxJqMbC/cL5zCEMbqh421jvPPkif46CFuECiiXu5Rcm7ZaHEgW2/L+MLUg9/ZJmygEz6YHaPsgEj0+pmK8b4+ubTxBdXeH2m19QdCBwAizayNbFKB/ucWLaDzOUNtRMiGPkFjhjSWnNM5wUtkPrFfkxMMrcPGf0sc1hkYCKPt+HWeEfbRJy7ebNrsb/4+oGpThjHuF+Z21j5l8KDuOcPrUO
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 08:18:06.8207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1539212d-ee27-4ba5-960b-08def6b7e844
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3233

Hi Dario

On 5/30/26 15:56, Dario Binacchi wrote:
> The sdmmc1 node was introduced early in the SoC bring-up before power
> domains were systematically mapped. Add the missing power-domains
> property to align it with the rest of the peripheral nodes.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v2:
> - Add patch. Suggested by Sashiko
> 
>   arch/arm64/boot/dts/st/stm32mp231.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> index 9e1d240888ff..0feb8943efae 100644
> --- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> @@ -727,6 +727,7 @@ sdmmc1: mmc@48220000 {
>   				cap-mmc-highspeed;
>   				max-frequency = <120000000>;
>   				access-controllers = <&rifsc 76>;
> +				power-domains = <&cluster_pd>;
>   				status = "disabled";
>   			};
>   

Those 2 patches seem already included in the following series:
https://lore.kernel.org/all/20260703065110.1433283-1-dario.binacchi@amarulasolutions.com/

regards
Alex
