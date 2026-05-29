Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013036.outbound.protection.outlook.com [40.107.201.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A88A3403E0;
	Fri, 29 May 2026 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780045169; cv=fail; b=AL4wtOKr+OtJ7M9vx14afRmiDtOR20MNX++ljItnk43Z3ViIQlzRgYFg0kyhsCsg4et0Y6zjG0dr50emmiNW4f99ZqtIQbMzockK7rkkilp+VOHdSYY9BVJGZnrUvjsh4Di6cMfuF0EsxuGd3NVHeNWfYzmYL9WGfL8xQ6gr6yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780045169; c=relaxed/simple;
	bh=m7JTZFPrdbuHn3PSi+sDLv0hA2h2q7keJHQSIHfyTGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MoaOOpbyoTftQMJbB2M0LJ9Y0J/yzka77y1G1PLIsCl+VoOnelTyNJ6YnH4OVdJLtSHM5qc2/Fx0siPFsPrR2kygFrojZKJLdcyI9ZpTokZVeThaT0WGyeuHMFeKiyFuO6Q1+1UnoueK5y3S++uRC5AanIc680CzEr9/AfwjAqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vtLgwkWs; arc=fail smtp.client-ip=40.107.201.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vtLgwkWs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bt5g8U3ovAv2fNYFcmvzpChc2XM+P4pAgG9lYm/emIvoWl1kgrOluhBGJFP8l/xbQv5mzz7lOU81K13nWRZ+arBfaNO46LokyJ8skm4aQUr5czj9jfnthDsc6/kRgo1xNa5YgbH5VyEtZ0ORZdPzQZPTZe1+3yHFapTAk2SVkxD1TkYNLXWzs4WTmHZjFcn84yRJmGV0KQwLqv2oygA2V8sdSY1q+tfnPBNZZ1dNt3uXm2T2RxuXqDPy6RwKqvqHUEo1WTrhvp/cQg46ZPE7tFBHRLrwWhxh5FMi3f3Mm6e6gyalaWxCE0FmowVhHguSNSlmOXBbb5cB9weN3KOYjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swLZ8SuKHXgcB2OhUBnq5tH+qGhMRE14sBSRsCnsi8E=;
 b=ltLPodertedhDPo1EC7UuvMc9/nr38eMKPZdTjs/BjWx1pzTEm9BenSoOQ3ZnxE4jSEjbGaygo7kqI+EaO8uS8ZxydsBYyDmpEum6axVnoH9mUhuPKLrZMX+KVAZN524dZYAnb5OwGZs54aq/FIaoWG/6Gu+qYwMKXZ9vARTwkCFa6vDfqnKAbcsLuoSGsM3C/juVbm2iqOvED31OUTaFnAAk7hE90ulXbmteURv5NY3vq0FUMr7fD5q+G15PqfIIVg9wYJDo8BWLHrUiV+XUWpnaxkQ9OlWrDBr+aMOd9wstkqLgVtBNpbiVJNQx/wQx2Z+kvdNUUNKNcg/7pPAgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swLZ8SuKHXgcB2OhUBnq5tH+qGhMRE14sBSRsCnsi8E=;
 b=vtLgwkWsQFcnt+LWecT5nHahJWmXgzAWLHdLF8DytO7wMugxihl+TV8hj4IsNz3J31QTXaliXBUDV1M3Ly1+dwLftpcJI0pnZ5+2VdcETOn5HxoLynL9DAUVXOxDh1NujpTI3fnGnxJoYXjsoGnTEEXnt3ytMgW68r4JO1To3w8=
Received: from SJ0PR03CA0283.namprd03.prod.outlook.com (2603:10b6:a03:39e::18)
 by IA1PR10MB6074.namprd10.prod.outlook.com (2603:10b6:208:3ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 08:59:23 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::a0) by SJ0PR03CA0283.outlook.office365.com
 (2603:10b6:a03:39e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 08:59:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 08:59:21 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 29 May
 2026 03:58:48 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 29 May
 2026 03:58:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 29 May 2026 03:58:47 -0500
Received: from [172.24.26.211] (lt5cg60819vj.dhcp.ti.com [172.24.26.211])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64T8whrv3846258;
	Fri, 29 May 2026 03:58:44 -0500
Message-ID: <cb4c1b80-40c0-4e63-bfa8-65a68c577999@ti.com>
Date: Fri, 29 May 2026 14:28:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62l: Add HDMI & DSI support
To: Swamil Jain <s-jain1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <tomi.valkeinen@ideasonboard.com>
CC: <r-sharma3@ti.com>, <devarsht@ti.com>, <praneeth@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260528133529.3476499-1-s-jain1@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260528133529.3476499-1-s-jain1@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|IA1PR10MB6074:EE_
X-MS-Office365-Filtering-Correlation-Id: 141d6efc-4ebd-4cad-13d1-08debd609344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|22082099003|6133799003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	ryCc0eJbT5MO/sgLndenvm6I7zJYCCQRT5JT3eB8tCW1Swna48cS8Bw+L7lvhxkCpEXuLG6IThNGIv/WQdFP3PoULKh1Y/MZD7EU0MG4j0CNeydqMPLztO7MVMIo6p+zUrBYadbAtVmbs941UzDUPpCGeqws3vD4J2MaeMeRPl6jvTEN7/XvQtqNyjXpQP1asX5tkVVC8xyuNYBqmLlz+jxWoorVqwXrshpKi7ELlm1MNOtFHwoGcL9dJAFZtac4KUhPEeUNYEphcQ4Ufq72HK+a71O8+yI+1VqfaklEn7dTPUD7zscM40ZbMLn1epdIED47xLy7zYYCz9Z6caD1N/n+fSL7n5onysmi32Vl4Yr0kjyCRd9nQ2rUFQc+bnOq9k8WElnuV2m4dleX4FgQ1e1tJz+vpH8H5rHU2bf2Bz+72oUX6D2Q6nkrQ46SSbNLq4setOHiEk/uEZW1PBwRFHHVIrSp6Ia5MjNlBTauDj/tbaB58R8uHm3NlId9J+ni9jfoPZ2zNWFgaTHlhkVncuXq6l1hFjcz4zJUkAYkn4pnEMN2OzyhKQ8SOoD3L53llg3BLV+NL7ibTUn0bDkt9+gOcPUcCTtm2bWKc/K3nPSvqyClSAILr+ayHs80q4qYdw/c5BGoJnqupLQL50u+RUtw4q6Nu7PtwLl8BHu00tfmZcUXwHtk8F85SyX2SBbGyyUHFAHiIPUWa45W73JejVoZAJcPtS/dVi+h1NAecx3cvubQg2slVdUss1DHnX8c
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AC1LSARLPwRDj6DbSJ49vTveGE6ClxA2nvc8S7X60/kc7zeMIJ4XvJMEfZ4mHBDdJ2Q7nQ6P18M+u9Vw/x6TxKXIvj9X/Uyjz5YS8H4jJpd68lCCRB9db/3rNKGmxgeE35qAIigtGK0RcSoZ2jpK85wp9cA6hvIz+U9ZmHuVokm2c+5QraZ9AJOXLuk8Pym+rQypl1Fyd4dZtW8xibn8mSCnOJru1rkZ2n1NZHrsK6/fE1/10cUQzMrgu2CPXALIF62f1OC7en9cpa5WuPb7r3FhR07YNyXNVNy+ELwNUQGZDFz/G5n/EiW+ZV9gPS9M7UXMMIjs2OktwhvpYIRkT6O29m7pYyHpofZkJXpMM52XpD/KtTxqaayYS7vAlhpPuoKFNMRnQI6FAHD1NN8NBEExyvy4L6NEfRIBsed7h0yz4WZzcxwyW9z2bf01NEbu
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 08:59:21.7160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 141d6efc-4ebd-4cad-13d1-08debd609344
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6074



On 5/28/2026 7:05 PM, Swamil Jain wrote:
> From: Devarsh Thakkar <devarsht@ti.com>
> 
> Add DSS, DSI, DPHY, and HDMI bridge nodes to enable DPI-to-HDMI output
> on AM62L[1]. The DSS uses parallel DPI interface with pinctrl
> configuration to drive an external SiI9022 HDMI bridge.
> 
> DSI and DPHY nodes are added but remain disabled, as the AM62L shares a
> single video port for DPI and DSI output.
> 
> DSI functionality can be enabled via overlays when required.
> 
> [1]: https://www.ti.com/product/AM62L
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
> Changelog:
> v1->v2:
> - Update the commit message to elaborate more about the patch.
> - Add dpi-pinctrl configuration.
> - Update the interrupt routing index for HDMI interrupt line
> 
> Link to v1: https://lore.kernel.org/all/20260513210942.692269-1-s-jain1@ti.com/
> ---
>  arch/arm64/boot/dts/ti/k3-am62l-main.dtsi | 47 +++++++++++
>  arch/arm64/boot/dts/ti/k3-am62l3-evm.dts  | 95 +++++++++++++++++++++++
>  2 files changed, 142 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> index 80615ca1e01a..1d255c9138db 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> @@ -584,4 +584,51 @@ scmi_shmem: sram@0 {
>  			bootph-all;
>  		};
>  	};
> +
> +	dss: dss@30200000 {
> +		compatible = "ti,am62l-dss";
> +		reg = <0x00 0x30200000 0x00 0x1000>, /* common */
> +		      <0x00 0x30202000 0x00 0x1000>, /* vidl1 */
> +		      <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
> +		      <0x00 0x3020a000 0x00 0x1000>, /* vp1 */
> +		      <0x00 0x30201000 0x00 0x1000>; /* common1 */
> +		reg-names = "common", "vidl1", "ovr1", "vp1", "common1";
> +		power-domains = <&scmi_pds 39>;
> +		clocks = <&scmi_clk 162>,
> +			 <&scmi_clk 161>;
> +		clock-names = "fck", "vp1";
> +		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
> +		status = "disabled";
> +
> +		dss_ports: ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +
> +	dphy_tx0: phy@301c0000 {
> +		compatible = "ti,j721e-dphy";
> +		reg = <0x0 0x301c0000 0x0 0x1000>;
> +		clocks = <&scmi_clk 348>, <&scmi_clk 343>;
> +		clock-names = "psm", "pll_ref";
> +		#phy-cells = <0>;
> +		power-domains = <&scmi_pds 86>;
> +		assigned-clocks = <&scmi_clk 343>;
> +		assigned-clock-parents = <&scmi_clk 341>;
> +		assigned-clock-rates = <25000000>;
> +		status = "disabled";
> +	};
> +
> +	dsi0: dsi@30500000 {
> +		compatible = "ti,j721e-dsi";
> +		reg = <0x0 0x30500000 0x0 0x100000>, <0x0 0x30270000 0x0 0x100>;
> +		clocks = <&scmi_clk 155>, <&scmi_clk 158>;
> +		clock-names = "dsi_p_clk", "dsi_sys_clk";
> +		power-domains = <&scmi_pds 38>;
> +		interrupt-parent = <&gic500>;
> +		interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> +		phys = <&dphy_tx0>;
> +		phy-names = "dphy";
> +		status = "disabled";


I think you should add port information for dsi as well
see DSI node in other SOC (J721E, J721S2, J784s4) for reference.


> +	};
>  };
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> index a1af4571a815..9b04fa6d2cba 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> @@ -119,6 +119,18 @@ vcc_1v8: regulator-3 {
>  		regulator-always-on;
>  		regulator-boot-on;
>  	};
> +
[..]
