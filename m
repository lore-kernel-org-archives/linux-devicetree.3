Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795529375;
	b=icSZHfq4zAF1gbmWq5pS5YWnFlRiAP/oHPu89oPc63JEP1OJmdEYGNU73WLvolUNQY+Q
	 LuVo+dVZd07vBz0Oh2BUAALzXpGAJ+frQIPzPKSBkWuJB0dHUdsr0uOWfJche3j4G/zpd
	 m8fM46UXC4tUrCvU7qG4d4EGH8KXMFh86GzRX7HOProu+JXJJRkbeK/y9K41B1as3Rzfn
	 msJht+3+XhWHgmHiTVYNQX9H6S2vTZSiO6IGY4DWxJu6rOcup+biUB79vJdN1JpaahUGm
	 JthmB2XDKhYZ5t0y/nTyUnWLVeGAo7gLXiynW/Dxx3Uxl35bXhRzl21s7rYJ28Z/9zQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529375;
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
	bh=DvfoQdX5TAh9acAbfEpdCjhrYNF1g8HYHnrBWffEvp8=;
	b=LDFOf4zCcuMXhvDeTC1r+LLGpb8INGYfZvtspaTtBhUOFN5O13RMEiSATm1HK391BmRk
	 U1gYivYmnaSJpfmCyvym3vFRJ6pyG1k63TOKR0WAj4x7c7AjHc1SkDo1Ifi6Bt2E62a55
	 eOSQROF6yYjNelXF40/BSAWR+joy7utAg0j4/ie6I5+WlYiUgp3LwkEWbZEnY+hE9ctrB
	 tpAgkUcr/M3PqSa8tfev3Y5Yv+wXhNzelK2I5JlVmkfH+JFeYNhqrS9q6mIU73qDxbskP
	 ws7zBduOeKJAK6sEpV7gZq8i3iknth5JWt63B6VU5ncnP+KDiRS9GXFTizQKgow6FSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=dHecZnux;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.11
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010011.outbound.protection.outlook.com [52.101.69.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D659F606A331;
	Tue, 24 Nov 2026 14:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D659F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=dHecZnux
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSj0WvZoIDToDfYaeJhmZXKGmsQmy42kt3KaAusVSC7yxGF2jpZW8lOZZjkVvg258ZeiV2Qrh1qGFUxgHSc8YpWU9fecSBFQTpxhe+8qBFDzlxGWHv8TGDGnVTKhouAQ/q/aBkVYxV2mOYZ6oQtMN8Op+X6sJxXBZD2JqHcozZ7ETFTVaWQessg4xmwIPvQcw9lHzZKpl+PcEpVUH+O5OyPvoKy/ScRwCJIPKLrtwLVQai8SF9lfSGTOFQyMGiEfpNSUcrSflw9uGGiwfLDtbFnLiLDQEmCD181vVCoH8o91PKrsubNPl3xHaaRiVE9DGHBs/JbmSyH3cn615iAhuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvfoQdX5TAh9acAbfEpdCjhrYNF1g8HYHnrBWffEvp8=;
 b=m7pKOgFncJ9hVH/QljhUtyQBMJE38csc/W0LSY1mXU1hnyc71kSB8+fjuvezNv+72CNVl15kLx080ABmoEdYORz5UIdbs2zTi6rlvpZ6ZOn3os7bg11uCK082JqNpy5VBzEZzvv5Nm49cHhwYkPD/AY0uzVJ5/BgbFVLIyQLidp8ImlQzqulDJM9MV6SrPI1Kbds3TqX1AAsENG6VDjoXrmfnHCaw89pAk3xdtk9oZFBIT0haFSNdHKh10wiLQzhlCM02PzTAe8pk9CSnygVpi1W4vGoIVgIaDtT7KMSpQjUJOsmBdUG5dzlr4IXwnX3Bf8IAxRx0bDkS0O5tKYPFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvfoQdX5TAh9acAbfEpdCjhrYNF1g8HYHnrBWffEvp8=;
 b=dHecZnuxs8oNjA31B729cK3dcF0kkDkPQN1IIKG2SjNrULGKk01W7hrKzeOJh9GQzEOFfoVDJccqozq+0BFNk9SOGjvvGuJGhP1FsNTzW/Dgq1FHLdx1jjcFw+r6D7Y+bn6aoILYjmHPCFeuGQ5tbDeIIfyiaA04FCkElp7B8E0uK9MGsf0AqkzsXFxp/+LhwdY1NvknVkNxrd7Z1Dvv9TNhwXMpDLg9zj+1cm6lHnYipF0qJ44XgYg+jaF4nCNUfDR7H63ymjt//LU9IxZnx/rzvg5aYDSTedzWEFYxb4YaCafwup/KUICt+pbKiikuq41VzU+JtgQblV2OxbaplQ==
Received: from DUZP191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::27)
 by AMBPR10MB422559.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 14:09:32 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::a7) by DUZP191CA0010.outlook.office365.com
 (2603:10a6:10:4f9::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 14:09:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 24 Nov 2026 14:09:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 15:10:18 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 15:09:12 +0100
Message-ID: <f3025431-c426-4c7a-b196-ae09aeb617a0@foss.st.com>
Date: Tue, 24 Nov 2026 15:09:11 +0100
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
Subject: Re: [PATCH] arm64: dts: st: add firmware reserved memory to Engicam
 MicroGEA-STM32MP257
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
CC: <linux-amarula@amarulasolutions.com>, <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20261028105807.2567225-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20261028105807.2567225-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D04:EE_|AMBPR10MB422559:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e1b695-9623-4582-2bde-08df4a348fdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|10067099003|56012099006|11063799006|261026121527099003|261021135927099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ZbyFuaE3z9mrCtj52TnjUyzNODjq3dPh4tIUGgNsEJYy86wqCt1DCOhc87ZaXoVMp7A67zPMh/y/EWFNal1o5BItP+KfAxMQD0Jq+WcuAZQDZlqxXa8aOkh8Kvo3dpTlO5GvrKIUeEKspRdb1pzZtAKbWSkr90ly4K6iSh47L6AWHJkx527Fyht1yp5sZg+OZicxeyin5FrSUTp8sAWQMebRO+4dG+tPpizr/V7Kuy5VxOHFFtzvi/gMscdBszJcjd87SAN7cr0TQRdAOfL3IybYdHO4qKRJMEDB+Iv8sygTkJhXXjnlkfcvmkkm9H2iEjHd9sNgblbHba8wjJ4sDEg6mz2veiMBdnDOU1TLb/ljVZD5J93cMHzCBjK8ZkRVcxhvGKC/5XPIHT1YcvQK/mlpa24HPTeV5x3qEmsc7LYEwJb71sYZBL4tq8KFzTerbgKPeNzRRc4MHjSCSuvkgQeHdpenCotmYpv5FK/DxdMKmGs2sFtgFIjFU6YSEem/ynNftCXJJPm6OTi1VQXH+5n25QV1GdJIoELGMFHmHJAro9H0eVTAfF86KLcslDqy81tk4Z4qw0jF9UXRYs1gstskjd4rbEP6aqy9kzbeLlR2y4LJzsSM11ylWCbrswiTtXl7rbQcPc9AKfhM1YOHKwVvF05KoT7r5ZptTTT8URHXqvDA0Qwjjnfe3O9HLmBNbV8RWZdLt3+r/0pEQwoigA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(261026121527099003)(261021135927099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UIweNWCt4vSxo5GbkkKo0rNxOHgrpDr0rUNYv2Uv0liz1W4hCkUJpgSN9mZPNAhxLrT+kAh2WqF9ZUk5ei2smlhvSL48W5YFBnnO2TiIIda6VrFG6i7FyWlCGR7gztOlqDGewFI0EdQ+xpe/RD4iCmWtFqR0O4NEw66XRqdKBtYRMXcVZSdxJ/nuYmPP2ml0/4JjxLBQv0CHqTc5fWTl89HPuY+I0nieksHUS9e72E9rtankmhF499lVmt1XXYV/xwZaUTukDCh/4IdnxPFAGULFRazQ44vSa/IfWzvvYB108d9woAmO05sFFzkVCSwWAIzdiXYUEqYsL1y73SBX7xFJFd7Oq4n34JFBlQ64j4pBJGUxTBl6Y39/+LrEd2HoGMBUlsIUSf2KFlJ4lHt/j6gDgAFyCM+AwrZhyyQAT4amUPnP0UWqdEVrloirCZqN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:09:32.0587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e1b695-9623-4582-2bde-08df4a348fdc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB422559

Hi Dario

On 10/28/26 11:57, Dario Binacchi wrote:
> The first 64 MiB of the DDR are used by the secure firmware (TF-M,
> Cortex-M33 firmware, BL31 and OP-TEE) and are protected by the RISAF
> firewall. Without a reserved-memory node Linux allocates pages there,
> and the first access triggers an IAC exception and an OP-TEE panic:
> 
>    E/TC:0   stm32_iac_itr:197 IAC exception ID: 137
>    Faulty address (IADDR0): 0x80000060
>    E/TC:0   Panic at core/drivers/firewall/stm32_iac.c:212 <stm32_iac_itr>
> 
> Reserve the region, as done for the stm32mp257f-ev1 board.
> 
> Fixes: c5ce8d7bcc78 ("arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>   .../boot/dts/st/stm32mp257-engicam-microgea.dtsi     | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
> index 5b4287e86def..6cd64587ecdc 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
> @@ -19,6 +19,18 @@ memory@80000000 {
>   		device_type = "memory";
>   		reg = <0x0 0x80000000 0x0 0x80000000>;
>   	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		fw@80000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x80000000 0x0 0x4000000>;
> +			no-map;
> +		};
> +	};
>   };
>   
>   &scmi_regu {
> ---
> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> branch: stm32mp257-engicam-microgea-fw-reserved-memory
> 

Applied on stm32-fixes.

regards
Alex
