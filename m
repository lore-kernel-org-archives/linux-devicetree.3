Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023098.outbound.protection.outlook.com [40.107.44.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AA736AB4A;
	Tue, 24 Mar 2026 11:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352880; cv=fail; b=d/6EjPQZJh3UZeB2PsIwuGk04pG8U6eg4Hlpg9ZCrZznKIlkpEe1zEwPC3RyMt68UahMulJ3xR71IFH7hj0kUF0nSF2m7QMuK+z/xqN9AaDDe3nULlglTg8s+7NVmxkfVvCMH2eOKQ2FfVir8fmnoQEiPbsv76aefAzs/oFQogs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352880; c=relaxed/simple;
	bh=vmoeNO+aK8YYygbeeGOO6jWWFOp9Vnh0B+Ktjo1+Yg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDJ/8KBWX6ufU5WyodvrVPpYaNkqe0qEkAmRLBRVy2wfVVyEwlSy5CVEVk/2BHiEPHVQnpsAJnjXcwUik1tqk8Orr12cwNB9/z8c5F6TQvQN+BX8CT4IVAaKIL1034Qbd9cqkMa3h9Q2mG4kfxxycEZb6dY+I8scEDP3/KZzYNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQz6tdqononBkvGuznMkra0kkx1Hmp4RBZFpjYbRL4Je9HLcCslsiaq2wvHTflSNTNSM5SEoWU4RFg5Ocei6OB/d/LnCWdwWhfVEabIeg9R1H4tAWiOBUdDqHIYwiIbqtG2L92FUaqF3qfj+LqabD+pVMhRLNNfjuxWEhYvQq1C1Pc6NZBFNFrv2A8G8Hn8tF+v0tslSOKET1IU0DLScb3sQbpdoFOJseBgnPliT6tE4v4ho0uvVAJ2iWLx0Twnv32gIyEYiyHuJi1Qub50dzhh33r6pBAA06P/g/0zM7SISeBCDB6Ad3Y9uK4fW4Gug5w/dJKKIDYeriECSeJXZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xf9rlczStewUcTXhPmxk6Iebg3fBe00yuYDUw52jRng=;
 b=hSgaRbNo0sLqg8n6u6ERzHH9eOr29FbKEtGeZqtJ47vYuYz41Rn0adfzy08tl4FUsZN4egjZBTzNrhfmrkwUfHQgzEZnrg4ZBx0yr5SjL9eNNHF71kbVMleU2LBhn5UKvwwszl9vsnOMU6GEJdORvTby01iqjrT8bEGZNm7ipmh68fnGuRBc1IKFK/TpQvsS2FOl5YG+PHxzTR2nXmBCbJJHRGxRhJDSsfvOMYpWzFXS0boKnoNqJSikY8prVEEgOf4pJJ4MizXLW9SWOYtgP20uBBn/pml5Ahi/H8f0EIL1ZeOAx4UdfrRbMGEuTH3m5p+GdmZi4ugCamF0N0pOkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) by OSNPR06MB8332.apcprd06.prod.outlook.com
 (2603:1096:604:471::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 11:47:53 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:192:cafe::6a) by SI2PR01CA0021.outlook.office365.com
 (2603:1096:4:192::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 11:47:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 11:47:52 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6B8BD40A5A01;
	Tue, 24 Mar 2026 19:47:51 +0800 (CST)
Date: Tue, 24 Mar 2026 19:47:50 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Zichar Zhang <zichar.zhang@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	fugang.duan@cixtech.com, linusw@kernel.org,
	cix-kernel-upstream@cixtech.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/1] arm64: dts: cix: add FCH(S0)/S5 GPIO controllers
 for sky1
Message-ID: <acJ55iqzw289t9z9@nchen-desktop>
References: <20260312094923.3473444-1-zichar.zhang@cixtech.com>
 <20260312094923.3473444-2-zichar.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312094923.3473444-2-zichar.zhang@cixtech.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|OSNPR06MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 69c49ee0-1c96-4111-4f6b-08de899b2e80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	guNBLcfPTP3pEndBx3mFhI8PQvx3VVZY8k/NqSjU9/JbU2yPsUiEjQKlnNnRdtgE/pBqlyq1wb5Qj+rT+DJxMBSCuxqfrHyMX9PExRDMqmIiS0AH204T+xhjVImHK8bd12jzB9uRgqhUK3Fo/ACsS4ZmZ7F76XeCqtG0dvwnjzYW402k/kVtzXDtyfKzoqeRtuWYJ3pdVgSjq25+2hLeX3C1D4sSEeLkGzfEGuXhCtbBRF3pwzBserninvxSqnSChb81d5hGEhqafhMijiDSp/pNz8acN72CJ3Bcy3oN5jJb5+VQSkwaUnrqgKEifI2MOy5Aj+9D3v+yuyAd76vUABqe9xU1hXc485guQAaX+15ja2XCQnPvcosHNzLv/DrPUdrHM+bW/Jp8SlAacY0dHlcB3JBmkoXfAb5YCgRlnm4x2AsEPv9NyfsGESv2EkX9Ub77fdk8pxYk01d+IzZdxTH9Ks/IQicQtDS4FPk2rF14IN6jofdWIDB5gj6iDnBbaxaq9P+0Kq8ZTK/3ryRS2S7o/rsokw7EGCdLA3X2tDYegbqe5UWrICqZWUTJCgYmRWoLXrYlj2K0XaVH91/I1tSvAiOm0U00MgpB0C0xL8OXV+nawD+QrQ7NNd4jSMDIETgFili0hGsGfAVjx3/CZ5/Z1xeXstBdt2XO3dhjZjx9ZaOPni7CfNdoVFHfRec6bYcMkZb0T86hbX1ZYiBkbWao6ZxUl+u6w7J9jDoFViVLlt2YHMUCDE3804k2rIj+ilYe0Scql2BCrlfmMt2j6Q==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G5jB6Uz4hjFsoBUkbxWkkIKgwI9l3coe0SSi55XA/g/2HGgvoy2w0MnT+oTMkYHRWkChXhq95qP/epOt76GknrfhTh62evwZ24ypbbVF+ItbOoivrqyUZFmVUH7ClQt+/j9l8oQjx/DDvA8uTFptMmR+hPCRg3W3OOwDVFe1QQpm0gmffnvy9j8D8r/+4BYTQsbhdRT+xBpFnZmEyIR80gUpQlBRlFcf+0JRujm1QLNK/k1wtZNXQkjCNlgNPNxGQTC3QLtoP+J4Rj1TTmodu4zQWnfIVxWwgPxf7pPfoHjc/wXPdhBy+ywGbfKay/jm/a8vyBFHxh2d8PHYAXpXyuaysvhjrMzubkpccOT54SxmSezhf0DHA2U2T8uZ/fUnQzaDdLKoEWlozgaNlESL/3/OsKorayB/QUvrgQDU6psScF46PgMvf7VPMJu9VrRw
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 11:47:52.3757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c49ee0-1c96-4111-4f6b-08de899b2e80
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8332

On 26-03-12 17:49:23, Zichar Zhang wrote:
> Add Cadence GPIO controller nodes for Sky1 FCH(S0) and S5 domains in
> sky1.dtsi, and enable those controllers on sky1-orion-o6.
> 
> Signed-off-by: Zichar Zhang <zichar.zhang@cixtech.com>

Applied, thanks.

Peter
> ---
>  arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  28 +++++
>  arch/arm64/boot/dts/cix/sky1.dtsi         | 119 ++++++++++++++++++++++
>  2 files changed, 147 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> index 4dee8cd0b86d..e39c87774c12 100644
> --- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> +++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> @@ -36,6 +36,22 @@ linux,cma {
>  
>  };
>  
> +&fch_gpio0 {
> +	status = "okay";
> +};
> +
> +&fch_gpio1 {
> +	status = "okay";
> +};
> +
> +&fch_gpio2 {
> +	status = "okay";
> +};
> +
> +&fch_gpio3 {
> +	status = "okay";
> +};
> +
>  &iomuxc {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_hog>;
> @@ -86,6 +102,18 @@ &pcie_x1_1_rc {
>  	status = "okay";
>  };
>  
> +&s5_gpio0 {
> +	status = "okay";
> +};
> +
> +&s5_gpio1 {
> +	status = "okay";
> +};
> +
> +&s5_gpio2 {
> +	status = "okay";
> +};
> +
>  &uart2 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> index 72f3b195a927..3772548e8c0b 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -185,6 +185,13 @@ psci {
>  		method = "smc";
>  	};
>  
> +	s5_gpio_apb_clk: clock-100000000 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +		clock-output-names = "s5_gpio_apb_clk";
> +	};
> +
>  	soc@0 {
>  		compatible = "simple-bus";
>  		ranges = <0 0 0 0 0x20 0>;
> @@ -348,6 +355,70 @@ i3c1: i3c@4100000 {
>  			status = "disabled";
>  		};
>  
> +		fch_gpio0: gpio-controller@4120000 {
> +			compatible = "cdns,gpio-r1p02";
> +			reg = <0x0 0x4120000 0x0 0x1000>;
> +			clocks = <&scmi_clk CLK_TREE_FCH_GPIO_APB>;
> +
> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			ngpios = <32>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +
> +		fch_gpio1: gpio-controller@4130000 {
> +			compatible = "cdns,gpio-r1p02";
> +			reg = <0x0 0x4130000 0x0 0x1000>;
> +			clocks = <&scmi_clk CLK_TREE_FCH_GPIO_APB>;
> +
> +			interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			ngpios = <32>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +
> +		fch_gpio2: gpio-controller@4140000 {
> +			compatible = "cdns,gpio-r1p02";
> +			reg = <0x0 0x4140000 0x0 0x1000>;
> +			clocks = <&scmi_clk CLK_TREE_FCH_GPIO_APB>;
> +
> +			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			ngpios = <32>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +
> +		fch_gpio3: gpio-controller@4150000 {
> +			compatible = "cdns,gpio-r1p02";
> +			reg = <0x0 0x4150000 0x0 0x1000>;
> +			clocks = <&scmi_clk CLK_TREE_FCH_GPIO_APB>;
> +
> +			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			ngpios = <17>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +
>  		syscon: syscon@4160000 {
>  			compatible = "cix,sky1-system-control", "syscon";
>  			reg = <0x0 0x4160000 0x0 0x100>;
> @@ -587,6 +658,54 @@ s5_syscon: syscon@16000000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		s5_gpio0: gpio-controller@16004000 {
> +			compatible = "cdns,gpio-r1p02";
> +			reg = <0x0 0x16004000 0x0 0x1000>;
> +			clocks = <&s5_gpio_apb_clk>;
> +
> +			interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			ngpios = <32>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +
> +		s5_gpio1: gpio-controller@16005000 {
> +			compatible = "cdns,gpio-r1p02";
> +			reg = <0x0 0x16005000 0x0 0x1000>;
> +			clocks = <&s5_gpio_apb_clk>;
> +
> +			interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			ngpios = <10>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +
> +		s5_gpio2: gpio-controller@16006000 {
> +			compatible = "cdns,gpio-r1p02";
> +			reg = <0x0 0x16006000 0x0 0x1000>;
> +			clocks = <&s5_gpio_apb_clk>;
> +
> +			interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			ngpios = <10>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +
>  		iomuxc_s5: pinctrl@16007000 {
>  			compatible = "cix,sky1-pinctrl-s5";
>  			reg = <0x0 0x16007000 0x0 0x1000>;
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter
