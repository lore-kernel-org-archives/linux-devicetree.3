Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.103
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795153909;
	b=5CZAkZnUvn69p2CXOJNBBj4JXuTMki4LiDHvprMBLgYakcDx4lOAHyT/sVSWoA0iMoAN
	 8Z6Vrqo9Ik0dgxdNH4NvzzvEFNumLt2rQ2lTSV/tm4BSGsfAIemvjZ2cEd9U308c6ZmJI
	 Az1sVEoupuQSxYA6qPXRpcQCh8k4+Iubsm+E7A70EcN4XLgjCqJGw523PuZWcX8X+LeLC
	 gLRVSVh9pbuwjMCdkMRe4ppCMv239qOfdFGOIY/C5S1/vL1pR4JCubj8ixkx7G2EqWJeM
	 K1sT0+QPNBWR2+4ZQdniJ/4hbZ9CuRVLn2CPYQn/PEyRr9OIN2dfh4c7upWko9Lu7zA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153909;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
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
	bh=fAjvXaj7tYkT3DZdvrd+6EuGIWycDnvsk4IKDM7473A=;
	b=M8tbUqIn9TVzzjEBVGyGKRGEDHVLYW5Vlvp/GXPfZ1BsRpPcC2k539YP1Y00pa/wZcv7
	 q0Uh8v5z7R82HZ+vBOy4/K+eC94CF4vf4yy/FW1GYgDWTlRJrQrMm5c5X1KC40JQ4VPju
	 ij1OqNKmP8ebpC4IfJaskHNxgRiAen/3Oi9fKdy2apjVVR3/Zg9rvLvsdneAN+qR6jSb9
	 4J5u75N8F93NW48xCrvOOlLLh7DFOS11X2AIdsbhiEXUn1TRWmw4D9+DYMbMS4HdW+KCo
	 y36AzDiJFXLhrPkdvg4nIBr+HGfprHkzEw9KemeqaLZ8EnCHB/zWI5eM2+YqK3x4aOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.103
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023103.outbound.protection.outlook.com [52.101.127.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7225C606A325;
	Fri, 20 Nov 2026 05:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7225C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Khc7wzseyDOiW2KiNILmcrFk6zwMoPHActL3l78z4PBZbaEWYDA5DEIjE8iiKrnoklP4wowmjoIdtfD/GOUgGXt7QiX8QK51/keKeWN9T4TfdroXcVpis7VWvtEQfaW5a4w4bMrB6ngLrqinp+7DKaFk2UOuxA1M4KRf9nhrkjIQBtWwODu5ehn9SBk1jE5SI7mCl25sGHW5CbNxqyq0j2l+B/T0hqrLaDCZg/tnhHB3FEH/5dbyvkZrFF+oriC1N2aftTj+T5KV2nrd3ysqRL0dIRiQZrW37vwY0QTSrTFMG0PA63cT5Uy5Qf0zNpaewvI+eiezmOkXXpYTVNKYvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAjvXaj7tYkT3DZdvrd+6EuGIWycDnvsk4IKDM7473A=;
 b=gIHYFeJImT5ZQMjN6DnYn3rAkI7WMAnc7+dKG5omYGPyTEqZfdo13J0Wq89bRHJvUhF3FGr+M0kY7Kte74qMi7tw5JMSzak4qwQN9fsHj6+Km6M8CsQ44/CA7zRYRMGgPpQBDY+BUApaHAcpqcIS+mMfI8wAAoj42TpkPc02XYY7VKLF8b4XysXA/GUYq5m/yTnHSWiXaVWF18IxXOqWo1hToOqDmVh3oEw0raUecaHPgKuuCdLCsCgkvpjB4ot74mG/9SCUXJmyy4WjwFeMbLkLSl8BsOczVL0ttDeTHuq0yrkQ9k854pOKVR/n70cPzAsClc2Q1hdRqROQWfDyHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0009.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16f::11)
 by KUYPR06MB8843.apcprd06.prod.outlook.com (2603:1096:d10:9b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 05:51:43 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:301:16f:cafe::9a) by PUVP216CA0009.outlook.office365.com
 (2603:1096:301:16f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 05:51:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 05:51:42 +0000
Received: from gary-System-Product-Name (unknown [172.16.66.27])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B5E77427EFCF;
	Fri, 20 Nov 2026 13:51:40 +0800 (CST)
Date: Fri, 20 Nov 2026 13:51:39 +0800
From: Gary Yang <Gary.Yang@cixtech.com>
To: Luo Liu <Luo.Liu@cixtech.com>
Cc: "vkoul@kernel.org" <vkoul@kernel.org>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Wuyi Shen <wuyi.shen@cixtech.com>,
	Eastlake Yang <Eastlake.Yang@cixtech.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: cix: Add Sky1 DP PHY node
Message-ID: <av_f6zeEHFUR5yCX@gary-System-Product-Name>
References: <20261116073800.2396894-1-Luo.Liu@cixtech.com>
 <20261116073800.2396894-4-Luo.Liu@cixtech.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116073800.2396894-4-Luo.Liu@cixtech.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|KUYPR06MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: 909f2d60-033b-4d58-010e-08df46ca5aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|23010399003|1800799024|22082099003|18002099003|4143699003|10067099003|56012099006|261102123227099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	28Lcx1TwKZDA/Co74XZTUVIK1AuuKkUYcCZXDzcj8AcwZbpbb05zWdkpjIp0iDeIpcrAFzYQcpv40ikegH6Jdy3NqRLGqsPL5LeWeGDazS6X29REmAlvfEjNdty1PXyUDChSopNekwFhzsiFUzrfIYS9r1l7mPop6qHYlyrYKtvF//rBff7KDvArFGLqdZatsId7ni0UgV0Yl4BIPxjl+GWSOAxz8jzjnmmxYZ2Ee6YGSKcPrJ3o+D94ENDyD2W5hcCnleLIAZ3Z0vrmH3h6WMSMeiHqeKiZzg2GQgylJNK0+Uw32NWOIVpFyC9PIMyDvshg70P1LbA5A/GgWIH/LO+gMiRN8q98aE8wMpcvTPwDV+gkoSatqbilCh/4QaAq9+QecuSZMTbopdYqkm/PuAN5wRxnQw1wWaCighUABHrILnjO5BOFpVb3w1beFKlUoSwb5tAKMgMsXRBvrC/Ox08GuWrofuj70WZTiSA923asDsBZ75Yz2GdthcS2IsppLpE3biYTt0yflG+Z+PvX1+WOWKyk+PUqXpeprWa6y80gX3aW62lCi++BiKACPWfsR7KJ/9/D32YloTFpyZCqi9Y0fn3BIKhyIkmgootmnJ0OPkzhZsyGFlN522PF1lJUAphSovbCbUBziZZvg5y6SQhIUlVSIbqftkNXwurfDbgMiaxwCTqMSVsW90StqQkf
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(23010399003)(1800799024)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(261102123227099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZIF0gDqliKv+NwTtpIkQWNY1ltRcN5NyN7vOG81VxdWEep8Poz8rchuP290hiVXmOXIOVTvoBZ2A8v31qSmjRUQdNWr63YyfyB0oF1y2f4UfZk8DZlZpfkK+qNnT544hkwNUMJjP5iN0+OKCaHEdPzrYVaQhAJvb7RAedtbHg06uvp1y0Nkre2sp7pD9XYTopOdUjWTbgwwBlUXuwZY51rAhBpaCQNDJTgX3U3OkK/oA6ZsEps7jvCcZIzJWBozwBAQT5tzJFkrhZb9ZgYp6H2/rxPTv4t//2WeWCb1CKdQGsk0b81uOUct4jtzxVOW5J5/TJJ2da8UhnQAI7x795MDlUfCxwkn5LUzoCtMANakN+b0ci5DbqAC9fOsJaVTeH0IKFsSBN0MZE1CrEx0xbgQyepsSNdsqaISVlut7Podqv5dlOh14F8jlYRZUAlgo
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 05:51:42.5725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 909f2d60-033b-4d58-010e-08df46ca5aaa
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB8843

On 2026-11-16 15:38, Luo Liu wrote:

> Describe the Sky1 DP PHY in the SoC DTSI, including the DPC2 APB
> clock shared with the DisplayPort controller, so DisplayPort can
> consume it once the controller is enabled. Enable the PHY on the
> Radxa Orion O6 board.
> 
> Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
> ---
> Changes in v5:
> - No changes.

Applied, thanks!

Best Regards
Gary

> 
>  arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  4 ++++
>  arch/arm64/boot/dts/cix/sky1.dtsi         | 10 ++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> index e39c87774c12..b659c10f1f4d 100644
> --- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> +++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> @@ -36,6 +36,10 @@ linux,cma {
>  
>  };
>  
> +&dp_phy {
> +	status = "okay";
> +};
> +
>  &fch_gpio0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> index 0a820f45feb9..cbc14ac5b2b7 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -762,6 +762,16 @@ ppi_partition1: interrupt-partition-1 {
>  			};
>  		};
>  
> +		dp_phy: phy@1414c000 {
> +			compatible = "cix,sky1-dp-phy";
> +			reg = <0x0 0x1414c000 0x0 0x4000>;
> +			clocks = <&scmi_clk CLK_TREE_DPC2_APBCLK>;
> +			clock-names = "apb";
> +			resets = <&s5_syscon SKY1_DP_PHY_RST_N>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		s5_syscon: syscon@16000000 {
>  			compatible = "cix,sky1-s5-system-control", "syscon";
>  			reg = <0x0 0x16000000 0x0 0x1000>;
> -- 
> 2.25.1
> 
