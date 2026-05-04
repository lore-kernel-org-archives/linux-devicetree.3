Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012006.outbound.protection.outlook.com [52.101.53.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C309234CFDD;
	Mon,  4 May 2026 16:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777911545; cv=fail; b=fDYsY/nEERREWVfVtNfR9XuPXdZmKCvLXZxLj0e2qUfi38hdxIq+Ryd3seqHc9xzwwUDvpf2VjNsVSGgyUNg8Y3aYsaGFx2VemSPscWoCS7ir79kiDkCDc9o2BCIkTWh8EANWUPRiO0yov2Coy4eUe4Kw0veV3M0IkKSBSQykgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777911545; c=relaxed/simple;
	bh=h3p/EPXa4eKghWqt2IqUSIcmSdQ7qXMwcg/3FM7DzQI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhopVApw5plYjOpbMv24UsAfnSCddeV1cvojEraWveH1jJBcwaLi/WBxjddAyGp/8gscjcONhycq00WACHDC4LRCrob4w06iqsSAi1MB7VxUtVCJM4/fmT1rar7WM1gAj0Tu+NyuyQGy0y11usnaOEDVfmOV297kkC/nwks1bS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OTIXkGfW; arc=fail smtp.client-ip=52.101.53.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OTIXkGfW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXsFHNME/3kSMfcu5AsxQ+UFL4PTCan2CjKoakM1m1jjf94HprSwoozkgubK+9oJE5C5eOOk8BpqRSI33Pg+JCHjRJJ7LFBsZwR9dofyr+WJgOO51VqRgABuceub+Ww6fv0oLJq+8HpkKlGzLyMKu32LmvPR2uhDz5dLQ361K/nwiRquLmW4WZYHYlXA6Xc063KW4+0HITdLD2esWUXKzZVPc13VEfmqGg1LSDDfZF4uGtU1DM78C5mkGyFFbDINuhMNVxpSn5+XK3UbjAeXne9WPE80IT5FJdF69so4E+o29AIEoV1SpzP43GyAxG04D3g6UwaSnkekpJ4LGqDBgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jd8/MlqB+QnhmtODRMTPeeoRMCr4XUoO7cnvLhgsMpE=;
 b=ZifI5NeaxToOKGBohgRPl3zjA3MeXx5+SbOeZ/JXlVlxr0VqHARHHGLYsfS8t7LZ2/oB0ClRwXrdeyyqTKS2BTDjW76T1ngBRdhACyE/1u27VKgFW/n2IRhBrAlWCyVHYjzk37Wl1udvXztqk0mJ9Gxxfohzb7knjsf9Lq6NLmyB4Qwuh/nszdu1qzD2sCUCy0bvt3hneRoih8TIh04IRN8H/0l3JmKVIDa5f81rkosBKGz6lS/v0IhsrEu/EX2O2YDAzLlE4d+C14RuvwlllXXBGJq1X/3Db0N4HMwmdte/7KF+HF7fyMjXpogB/atCB81ZkCM6tYJRw2K4CRmYfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jd8/MlqB+QnhmtODRMTPeeoRMCr4XUoO7cnvLhgsMpE=;
 b=OTIXkGfWYqQs/Hs328aafgWsNxjRsTHqK6ry2oP6HXlDAlA9dwkDjsx80J5RalotxbZTlFvWQvAeha1pGz38KlrVg82FgXM6eQv7u41fw8Ui7Wz4UXCVjNXbXOMLZW/YCLCiXIBDD1wN7OF+VJ/gVWQ/gq/MPT50va31Cl3ua+Q=
Received: from SA9PR13CA0004.namprd13.prod.outlook.com (2603:10b6:806:21::9)
 by IA3PR10MB8537.namprd10.prod.outlook.com (2603:10b6:208:583::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 16:19:01 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:21:cafe::1b) by SA9PR13CA0004.outlook.office365.com
 (2603:10b6:806:21::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.14 via Frontend Transport; Mon,
 4 May 2026 16:19:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 16:19:01 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 11:19:00 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 11:19:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 4 May 2026 11:19:00 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 644GJ0941084486;
	Mon, 4 May 2026 11:19:00 -0500
Date: Mon, 4 May 2026 11:19:00 -0500
From: Bryan Brattlof <bb@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: Re: [PATCH 2/2] arm64: dts: ti: Add k3-am62l3-beaglebadge
Message-ID: <20260504161900.sivd2s4roiqtnsc7@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20260501233148.4180391-1-jm@ti.com>
 <20260501233148.4180391-3-jm@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260501233148.4180391-3-jm@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|IA3PR10MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a34acc-e86f-4f75-af91-08dea9f8da32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zdTmkpLiH6vFMYi4+OkxTduCyOiiSmXyFh9yGEFUXDpX7g8Tv18E7MfwXl0/0KLJFc8ZlShkWwk/Yf03U2yCMFa+UW8yJ1AQqqinUV8J6TanvXSqAPQED+jzuzDs+YsPAIHJ76jC14/4iO/cjJQMMfEhNq0gZM1Keg0VMTSnPG+12cZciPV6EsvaYqcbXofURMP74XnOAn41w3iEoc+3WZoesf7XNmOxXZLd8hkprSiRwZQwrrVPndgeVvRCvB21ynPGgAOrUNnLyQRow6BqEoRB/PVc1IhuVEVmcC3BwJhZnUVSBF+DxOQ/mtswWxqV5hClRghISMyYEGDy24xOu8cxPJSgtQvLsICe1qKC4uJ+TiAP6M40CaaJApvvPLaaGrZbo+rMEeSoKMM25HCet5kInRMtbkPgR6+jHMimQleFx7TSwq4i5pFOE9b6bSrfBFmEqck20bUiqKHFwVclEvudqKvdwPdJ5puj5dq2i6yBusxoVkDfWkSj6EpwWyHTnaRavrlfFU40GLANtT/+h4HscJM8aQDYpVEeYrL3TK0Y2zYMcksIf2Vsix6vD04TM4Pyrjh6f/uTbF8z5Nz/J4jpfiyZCWsc8UWK2+wESqBEf04NbJ9PwvtlF8InGzHyP3Mi+h7Yj12KzX+wZUEV0hufrCuBczXFT/Y/0NzyOS4=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4iruFnY2LVce4Zj/xau+rqQLc3q00nPKTv4iumMOZamXQoBku+KhSUqXWZCwd9QS8sSG/3WLVwt8jIiQSUn2np6hJy4HAnK3urmT0roC4hGNsSs1JAmUOLkw3gcJ6I8B6ZmCj6A8iF4k3Pm9/V9xrudAlwWK572PtFlAKBZ+i+HOlTcfJ5UB2CM3zLHRu0CJSgjhoqsZX+yiumAIZxaPNvrLBVWO4Tn7/YB7P2NRsb3DaddJNdfb/X49+AgijbMmmYKW/a2syOqdEntufjxbGo8nrdA2KGRpoKkb4LMIffQEZFh5UJGK2vgxVu7ql2yVxFv1vaViYAV6zGO9Nhput2/gmgXkMGfji4PVSHx3yKcLeq6PcjfeDMtAaoqDSWuQepIUe+YuWX2jEXUeJYUzn2rYHXmFbGvl4YVhskhVxcivVRX6BsACvLJiJ+UBpH1l
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 16:19:01.0217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a34acc-e86f-4f75-af91-08dea9f8da32
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8537

On May  1, 2026 thus sayeth Judith Mendez:
> BeagleBoard.org BeagleBadge is a compact, affordable open source
> hardware single board computer based on the Texas Instruments AM62L3
> SoC designed for IoT and embedded applications with low power consumption.
> Expansion is provided over open standards based headers including
> QWIIC and GPIO interfaces.
> 
> https://beagleboard.org/
> https://github.com/beagleboard/BeagleBadge
> 
> Co-developed-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>  arch/arm64/boot/dts/ti/Makefile            |   1 +
>  arch/arm64/boot/dts/ti/k3-am62l3-badge.dts | 655 +++++++++++++++++++++

...

> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-badge.dts 
> b/arch/arm64/boot/dts/ti/k3-am62l3-badge.dts
> new file mode 100644
> index 000000000000..0125d3fec5e9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-badge.dts
> @@ -0,0 +1,655 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * https://www.beagleboard.org/boards/beaglebadge
> + *
> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include "k3-am62l3.dtsi"
> +#include "k3-pinctrl.h"
> +
> +/ {
> +	compatible = "beagle,am62l3-badge", "ti,am62l3";

I noticed the $subject calls it the k3-am62l3-beaglebadge do we want to 
name the DT that as well?

> +	model = "BeagleBoard.org BeagleBadge";
> +

...

> +&sdhci2 {
> +	vmmc-supply = <&wlan_en>;
> +	bus-width = <4>;
> +	non-removable;
> +	cap-power-off-card;
> +	keep-power-in-suspend;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc2_pins_default>;
> +	ti,driver-strength-ohm = <50>;
> +	ti,fails-without-test-cd;
> +	status = "okay";
> +
> +	wlcore: wlcore@2 {
> +		compatible = "ti,cc3300";

Sadly this only exists on our evil vendor tree :/

> +		reg = <2>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <52 IRQ_TYPE_EDGE_RISING>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlirq_pins_default>;
> +	};
> +};
> +

Scanning over the bootlog it looks like the VTM driver is active but 
we're missing the thermal-zones{} node which is causing it issues.

~Bryan
