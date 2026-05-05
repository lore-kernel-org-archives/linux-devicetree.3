Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010006.outbound.protection.outlook.com [52.101.193.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634B2351C1F;
	Tue,  5 May 2026 12:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985992; cv=fail; b=B+1aPxITIoKCr0hwtsAyeKLFCzQJGkwN3lcGyY6ZE83oCL68AcApbgTQnBGtjNL3Sq6ro5pLoi5Cfwxx7vKFkxBg5RCH1G271Pc4R/hg6ZuzYXUVFo15IBnV9INtBCGX0ClZRldR1TH/0LQuEGp/yi36hGLxCQSRYx/cYf4zkfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985992; c=relaxed/simple;
	bh=vl6D+xrbvCL9NX4ZsI7x48nhSacIGXzKLAL2hroVKP4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvLYdtO0OwwAMw7URPts/Bzu70P+la1XeJN6FbTFkBZ2XsLf4UApJbcGXgfBEMYh0mtKk2wK5LGvRZ+8KIYb+gRGf3hPb4o0ESoPepA/GxB3sBh7C94d64Z+53itk5xQXydpIiwS853SFqcPpo5ZeFFRzkADiMA92H+8RB2xctY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uheJFMUn; arc=fail smtp.client-ip=52.101.193.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uheJFMUn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fu0/fJD3BMgpu8yl+K5CTbPzT6Xklw/jfwpCQWaqYRqYB7YTRfwdCPyPh4dgAkKQnd3mywkdLfBjOpNRIDVqLo4LDmxOdK63txSeIwm9RWjUgXyUs0C4CHufunCoeobaexoJZ3BbxVYhZ3+mmrm8TxHGX/WB6UHrQJoo7hHLc5t81flgq3zZpZrQfhIljOfBXkDLm6x7OIxSYTRjJSeh8Z7aNO3DqQOAxepwpigQgLk0FgMEWwvwvbXnT9xgHTcVKhq4LQVE7gQT13BK3ZJHJL0TpP7LnWUe/4kxHr1ja41ThuHDVsAcLS7cHwH0Kx2S7PV6tSO/n3eajijDRBwNdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hU5wAVIJyHs9K+yaHH8vyxDxbAaXVWjT22V/HMPaxdQ=;
 b=pvaAREYyp7TZk/fKJW4vqz+6s54qEgxBw/eC3+pH8GnL7L8IGB65pqx2RsE6Eu59HjsO7vnTusb+N4D4HIUMhSE/y4KMpvJ+5/pCOtZS9ghkja0mJI4bkmK4VItrZorXx3/waiuoPDOarPMBJ98S6ddC4cI/VifZ7KAC1T9eZlO8KA9sVfzMBFEJPQkA2I5TV+Esgy5d4lNcLUxeB1f4y9HR5ItSvcfKOX60Pjitlk6hc8/FNruPMQIoGu2/FLKIG8SFmkyFeaYEYS9cBYNmZz4MUk2xVGiTlLQeeFUswG6Vu1jZi42r1JxzUdncwGIVRX4Qo/5dYmQQLl+Og4/EUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hU5wAVIJyHs9K+yaHH8vyxDxbAaXVWjT22V/HMPaxdQ=;
 b=uheJFMUn4Q9uG4qAqeAK1ugFajOgI65lsO7E/baSLrbyDx/2YrIXMyCOzsYtVXt78x3cnVtp25Phm5OiPU/xSXc6heFc/XIdxo337iJb8EbNP2wNnBHNj1hRC+kbo9u37NL9X2znpieU+0/paRGXbyJT+NWFGCkPQn9vbdGBZuY=
Received: from SJ0PR13CA0178.namprd13.prod.outlook.com (2603:10b6:a03:2c7::33)
 by MW4PR10MB6372.namprd10.prod.outlook.com (2603:10b6:303:1e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 12:59:47 +0000
Received: from MW1PEPF0001615C.namprd21.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::36) by SJ0PR13CA0178.outlook.office365.com
 (2603:10b6:a03:2c7::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 12:59:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW1PEPF0001615C.mail.protection.outlook.com (10.167.249.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.1 via Frontend Transport; Tue, 5 May 2026 12:59:46 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 07:59:45 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 07:59:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 07:59:45 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645CxjlD3003518;
	Tue, 5 May 2026 07:59:45 -0500
Date: Tue, 5 May 2026 07:59:45 -0500
From: Nishanth Menon <nm@ti.com>
To: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Udit Kumar <u-kumar1@ti.com>, "Abhash
 Kumar" <a-kumar2@ti.com>, Beleswar Padhi <b-padhi@ti.com>, Thomas Richard
	<thomas.richard@bootlin.com>, Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: ti: k3-j7: Reserve memory for LPM
 meta data
Message-ID: <20260505125945.mxucy4cfpno2x66z@slacking>
References: <20260427160326.370415-1-richard.genoud@bootlin.com>
 <20260427160326.370415-2-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260427160326.370415-2-richard.genoud@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615C:EE_|MW4PR10MB6372:EE_
X-MS-Office365-Filtering-Correlation-Id: ed2ff93a-6b9e-4b9a-7d99-08deaaa62f32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZBk9qS873E7ZZbicRUQkkOmf70ZSbpaqFC4U2hjaAbEcl6fNfSmsaBkMriVnfyf4PMea66S+DHsFjLTop6ZMTcDBlcv4C97p7K+ytfWUkWcdW5Xr6krZFy1QyV1TbvfbG7UsRnwQvv+hfR6Q/yBVsEu81Lc+Im9o5Flha3xyEtecBw2WWPU3DLcEUmmlOiR8nbQkr0VXsX6+NAG9qOB+DW/sPOTe4HrMwYp348uB8COxB2DwmoEd4oCoQ0j411tsqx0r4DW1z+I9QTZkLzC1g25ZZxJ5cGdhPBtjKXCIpw917hT92S0vommTwYFydCKCXPryTgwrJl3NbwLi6Wp2HD8xz+3W+crPIG8/eR0VymuAzVqhnJtFU6gtOBf1zSzhHGc4FaFolor9n1UKQKG+qi77iFWUeaDsBXHrK7tt1FCS+JqslbzBliqC30nx4ST4JLSexLpk5gHpehkWOmsVUzemST52hI8k8sL1Blb/XvWrOj4dtZ2qQiiKkMMnN49H84zSja5wfNcsdPUIl0FxzrS1z0n29q7WEGG+SKRvv6m9LDeVXp0V258pumjINWAWfoKVIQm3OUg9P5PidXsSx3aOPS8CaR/uhDVx7CX/YIesygcGCLATIdgqGOeJcrGOtExibZJD+cXvxC8xi7UIDjcGqZtya/BfWQjIk622wOsFPhB79zJ943k85wSzlMwf
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rOLm5r9iEg9TdktgjxozXb+MkJtOpIr7xnqi2Savhu44HZUGkntNkikPMDa2oTGDb9E9Ail7Cr0Pt4ghXDnfPgkvfRaFEjh7rakBHUOj2AnDHy1Rre6EeomiAZR3JrF5ihb9GWrEw663SBTpoqS0+eOPiUyMaSvyZXyYlwBSA02cfR3B4Oo5Xo+A/Z+9hzV7AhzGktrzWuHEK0Zsr0pnvRTAfvf9j9bxg6bgPcbmFJypUvMUyhom2Y4RogEkbFZwNP1TMGkfhSIGMDjMlY9imCZyWlSZHoytwaSIhbQE+Hx6cTG3wbE7W4F4wDOafmjnBpOsvucBTlnUhMktIYd53aXpWFLRDo99N+wod4hde84sSdhTOg0KsTfzfueIzgDTqh8bFbXJb3MX4KAOWQnl30AiFQty7z/6qRhkULLXXNtUlBOABoIVMNTqsWIn0DVU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 12:59:46.4930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2ff93a-6b9e-4b9a-7d99-08deaaa62f32
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6372

On 18:03-20260427, Richard Genoud (TI) wrote:
> From: Prasanth Babu Mantena <p-mantena@ti.com>
> 
> For TI SOCs J7200, J784S4, J722S, J721s2 which support low power modes,
> a chunk of memory is reserved for LPM meta data, which is needed for
> saving ATF context and the certificate information of ATF and OPTEE and
> DM image. This LPM metadata area is firewalled to be accessed only by
> TIFS.
> 
> U-Boot/TIFS will use this area to save and restore:
> - ATF context
> - ATF certificate information
> - OPTEE certificate information
> - DM image

DM image is loaded from storage, correct?
> 
> https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr
> 
> U-Boot has to parse and retrieve this area from the device tree, thus
> @lpm-memory node are used instead of the generic @memory.
> 
> Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
> Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi  | 6 ++++++
>  arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi | 6 ++++++
>  arch/arm64/boot/dts/ti/k3-j722s-evm.dts      | 6 ++++++
>  arch/arm64/boot/dts/ti/k3-j742s2-evm.dts     | 9 +++++++++
>  arch/arm64/boot/dts/ti/k3-j784s4-evm.dts     | 9 ++++++---

Split this up into platform wise. I dont understand why you'd not modify
the ipc-firmware.dtsi and use the phandle similar to https://lore.kernel.org/all/20260318-topic-am62a-ioddr-dt-v6-19-v3-4-c41473cb23c3@baylibre.com/

Split the patches per ipc-firmware.dtsi as required.

>  5 files changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
> index 5a8c2e707fde..756928a2d411 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
> @@ -40,6 +40,12 @@ mcu_r5fss0_core0_memory_region: memory@a0100000 {
>  			reg = <0x00 0xa0100000 0x00 0xf00000>;
>  			no-map;
>  		};
> +
> +		lpm_memory_region: lpm-memory@a4800000 {

vignesh already flagged this in previous revision - just use phandle
reference in u-boot and make this memory@

> +			reg = <0x00 0xa4800000 0x00 0x00300000>;
> +			no-map;
> +			bootph-all;
> +		};
>  	};
>  
>  	mux0: mux-controller-0 {
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
> index 12a38dd1514b..ceab8f057640 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
> @@ -42,6 +42,12 @@ mcu_r5fss0_core0_memory_region: memory@a0100000 {
>  			reg = <0x00 0xa0100000 0x00 0xf00000>;
>  			no-map;
>  		};
> +
> +		lpm_memory_region: lpm-memory@a9c00000 {
> +			reg = <0x00 0xa9c00000 0x00 0x00300000>;
> +			no-map;
> +			bootph-all;
> +		};
>  	};
>  
>  	mux0: mux-controller-0 {
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> index e66330c71593..eebc5cc7d4cd 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> @@ -63,6 +63,12 @@ wkup_r5fss0_core0_memory_region: memory@a0100000 {
>  			reg = <0x00 0xa0100000 0x00 0xf00000>;
>  			no-map;
>  		};
> +
> +		lpm_memory_region: lpm-memory@a6c00000 {
> +			reg = <0x00 0xa6c00000 0x00 0x00300000>;
> +			no-map;
> +			bootph-all;
> +		};
>  	};
>  
>  	vmain_pd: regulator-0 {
> diff --git a/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts b/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts
> index fcb7f05d7faf..d0752c8a6b37 100644
> --- a/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts
> @@ -23,4 +23,13 @@ memory@80000000 {
>  		device_type = "memory";
>  		bootph-all;
>  	};
> +
> +};
> +
> +&reserved_memory {
> +	lpm_memory_region: lpm-memory@ab000000 {
> +		reg = <0x00 0xab000000 0x00 0x00300000>;
> +		no-map;
> +		bootph-all;
> +	};
>  };
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts b/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts
> index 6c7458c76f53..114594f37f0b 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts
> @@ -23,10 +23,13 @@ memory@80000000 {
>  		device_type = "memory";
>  		bootph-all;
>  	};
> +};
>  
> -	reserved_memory: reserved-memory {
> -		#address-cells = <2>;
> -		#size-cells = <2>;
> +&reserved_memory {
> +	lpm_memory_region: lpm-memory@ac000000 {
> +		reg = <0x00 0xac000000 0x00 0x00300000>;
> +		no-map;
> +		bootph-all;
>  	};
>  };
>  

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
