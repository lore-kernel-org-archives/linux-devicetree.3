Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795179537;
	b=3gUZThgBOY+rsWJpPfJ2S1+AyxFmJi56DMWvw9P4jQ+oIf82lK8ZHjmWlA/jKaeb5Xfr
	 jK+jBNUbDPoGibEd2sKb5qkVz409P/+5hYfjj2E5dgH3WScJb4S3wToEwWiBzE080pEt7
	 wsMhSq/Xd94shTz3mVndOzqHyWQypEfc+AEbzLk8sFHqX1TbLo3JJRgrQlr7SZTbm8SHj
	 e351YctgSf+qRxNLBRMxPkoEGOyV31vP2kFjaKunpon1HApNQdWhwgDvyE0F4SBwCr6NG
	 xqqoytWAay7SCrCaSSHw5C9o1wAA6Yu/IqhGXFbbqvNo0+y6S/AsLkDHuu71D/PW7nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179537;
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
	bh=sEo3B0b3YJ79VGmPGi4PMfronPfPnTjtUxrQu64BATY=;
	b=kaQg81eUP4+wgPPH5EjcvW/VJ6sWGf7A3BdFfeVQkkA6nQ+OJyApBZd0zh56CiIBKGDE
	 /yBdmvVEfhn+ZUq8rMU8QZtg+Y7iZW63XKAEmLoe69Xt0zM5FgIKNw5mIgIUAjNTx1qh4
	 sp2zbKM/ifmGXo97TI8+yucVB0xZoapQ0fGei01Dge1cVpFF0LCMuav93xIixbguFPhsM
	 1oVScNV8p2K2UKuhCXbHUFOGbRUu5zj4Xc0rtrWV4T+jkeldPPNh/HQDZnk8qvjwld0nL
	 54e+UydA26AAT4Zr2CeymuOYPc9zvXdLKFTK+Sl2CqaDlGKkn0fXToM7RF7dAjfivZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=d5bzjfrL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.16
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4AB606A325;
	Fri, 20 Nov 2026 12:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A4AB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=d5bzjfrL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BU/v27MLUOLtcbpHCrC2jfLgmwef1/fQnkTnJEWH3/OAs65GSZHzkYUNyGmSV+FfnE8JHjChRFubAj2vC6EPwlRweJtww60uBJWYG0hAMyaL8JZgWuLwFBr9lchKWSFgg3mfW5zzUZcwPHEZmysRBA2UnHlrofflu5HDyjbyYYcp60wVRP+1oZ0J5A9MSJD2fRl0y4MX5Uc3f1SBsNuO6bIywOL1s7AMrDW9m4qAE+cGdTG3rvRxFJ1/fUZfQbOtKUIkCaFeG1ycVmzgJkrNO27lpWfQnFuyXbrn4X53zMT4zY7ZrQnEBBPLpLcGcnHz4c2vaavD4avvUqZOml2qTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEo3B0b3YJ79VGmPGi4PMfronPfPnTjtUxrQu64BATY=;
 b=jSUyzN1ikvWluPAGT+vk5xUyoNQS67MQOQMDubzYaNWmgvIS2/8FLJmmxsd9dX6oo64nOJG2TGESH1I5vfgFZFK6eZOp7LBxTPPFSMIDLHx9ICfyCujD4g7L0ejWco7hLWpitdrbDzroRsVuBQPTAZqY8KSK9ofeJItBVwRQTB6S4bN+G4QGgT8BlsszN+Yn+fvWyHcPXec0qCAVwCajb7NCh53ex7WgCMYy4JT7PRsFIz+yGZqQJan75Dki8SK+FrIYqHPgMpmsFnf1WktIcfKCZqg4/ec2GmXRqJYCV4n58Q2Lsys5unQrH2GZjQxDKwd32arjVQXOOKxgpuipMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEo3B0b3YJ79VGmPGi4PMfronPfPnTjtUxrQu64BATY=;
 b=d5bzjfrLbxUeplFVLp5tYJVjkJFt8kFcVw2S8oFV7EH/TuN5wOXvEsaY7M0TSk8HZ1MFBlaowrTkdkN6d6tmcdm4JiuXDI/LJEinpJIZryyioq1TOtCf6CaLKnnjrGTijtdJvfN3R+F5mnKKmWeulhJuUFQf6nBm6xtGWTL3ZfW/0ekFx7/SE+Zg02KSeg+jS25D4kit96CaW9sJe4HIeiXOkcdOtyg33lIrRC8oFbXb97lkDNJG7shSJh5nYylSNPlcj+tOQEnwriEHgY+sOWnG3FBxuupCIeEhzcAwzFKzmNjr+226zx5andGX4aTWqBT0Qmwr5UkkxfzsYyhHvw==
Received: from PAZP264CA0153.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f9::8)
 by DU4PR10MB424460.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:5d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 12:58:52 +0000
Received: from MI3PEPF0000848C.eurprd02.prod.outlook.com
 (2603:10a6:102:1f9:cafe::9d) by PAZP264CA0153.outlook.office365.com
 (2603:10a6:102:1f9::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 12:58:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF0000848C.mail.protection.outlook.com (10.167.240.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 12:58:52 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 20 Nov
 2026 13:59:54 +0100
Received: from [10.48.87.222] (10.48.87.222) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 20 Nov
 2026 13:58:51 +0100
Message-ID: <cf0e61c7-b603-4dd6-afdc-bf38884ee7dd@foss.st.com>
Date: Fri, 20 Nov 2026 13:58:50 +0100
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
Subject: Re: [PATCH v2] arm64: dts: st: add PSCI idle state to STM32MP23 CPU
 domains
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Alexandre Torgue" <alexandre.torgue@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261119184209.v2.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20261119184209.v2.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848C:EE_|DU4PR10MB424460:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba6dbec-58e2-4432-761f-08df4706070d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|22082099003|18002099003|13003099007|11063799006|56012099006|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261009223027099003|261021121427099003|261021123027099003|261022075727099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	M4+QzLUryuEbSXHBtmf//oGDnsbPmr3HQ06vRwn8p3NmRFqoe2f+JZGS0aYRjQ38p6pzVXrz9vHvUy7glwnxGJYygV/FOs/zkfEcaZAS4G0MZ1vpMuUvxo4UqIpPLJZDDBZq2+48wsjIiTN8ujKuJGpjck/SYYYIqCrfws72x3Wz6QjeMdm52aXozeA7yhAHHsE0O++SOpN+eisNv1OkX86dHJbdRzgIIUZwIh2sDPZuyfNfr7kC+3hP7SizITDeBsiFppoXbBXSGLdeqg1ex+oV8xbnEBEBq/R4GeQOWzonqZM8nHfPqBFXY1HjUq6hBNcIMSygBpL0zzsX+H+ZZoVtjxV/T8dXpS2DarhDNOUPvZ3f34iiMh6Mw939n5wS6Abjkhr++je2pF/On9gFpH/GtUjAM4FHIstsek36mi4/Htmgc3a1qTfSUU0Cgl+Ldqbj9GAOm3NiEANCJCtUVMz6MTYpZNBxOFGt3zD5NAP3QPOiesQHcl5T+Q0+BSpg4tDCoX6JYG0rHgW6md6JEhoG0wUlDG82btpauHwJq5eahXqFhz/BYqFpAnX7uTQOk2/XgFOyFv6AfRHUn5ccVDFcIfRDsP9Q/s2NYfeRq3v948GLnjhu0IbmJqCs/CRAjw0rEaC9+BNOUGdb4K4igg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(13003099007)(11063799006)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261009223027099003)(261021121427099003)(261021123027099003)(261022075727099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UUaT9N9HUMQIoIpPHzLBR5/MTCx5X1x47u3DJ8fNNxn5VRY+a34IbI8ANh+LOtVJkPbVXvYobQt7C2F7HkyGXWw2chB2lZAIbNRob6qvbGsenuHoIFimknMQMVKLrUIwtg50p3F0CpoB8uTrbRnBt6gT0bbanLxrzT5QAfTNS4CXQlhpYRbD6EqIzzxG5Cwt1+g5UjLUKXOI1Z1lESJ1szwLALrQdGNCQ24Oii6m8b//JtNIv6gnJaSER8YzSEgIG8PqpSnmJWzTcRW1Nw+P+3Vt8euGd+4ywg0NffsCGm4U/k5/9pHhPP7GVmwzFDbxvFJk/rrV39RO6gSoCpfAPgUcOq5khKjD0kmj+8hOA5cZbdjQMs2HVUqtE6vn2aMSQK4xkZxRfzLCvsAwkZYt1nc+2F3Rh2QdzgJj+UfHKbbbZyd46ekN91kRuZSHdt+H
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 12:58:52.3196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba6dbec-58e2-4432-761f-08df4706070d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000848C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB424460

On 11/19/26 18:42, Patrick Delaunay wrote:
> Define a PSCI CPU suspend state and reference it from both STM32MP23
> CPU power domains.
> 
> In OSI mode, PSCI power domains are initialized as off. The idle-state
> allows the CPU power-domain governor to manage them, avoiding probe
> stalls for devices that depend on the cluster power domain, including
> SDMMC1.
> 
> Fixes: e9b03ef21386 ("arm64: dts: st: introduce stm32mp23 SoCs family")
> Link: https://lore.kernel.org/all/20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid/
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

> ---
> Hi,
> 
> It is v2 of previous patch [1], with only update of commit message.
> 
> I add a link on previous patch [2] which changes the timer node with
> compatible arm,armv8-timer, see Sashiko issue [3] for details.
> 
> [1] [PATCH] arm64: dts: st: add PSCI idle state to STM32MP23 CPU domains
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20261104133023.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid/
> https://lore.kernel.org/all/20261104133023.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid/
> 
> [2] [PATCH] arm64: dts: st: mark STM32MP23 timer as stopping in suspend
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid/
> https://lore.kernel.org/all/20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid/
> 
> [3] [High] arm64: dts: st: stm32mp231 cpu-sleep local-timer-stop conflicts with always-on
> https://lore.kernel.org/all/sashiko-outbox-197300@kernel.org/
> 
> Patrick
> 
> 
> Changes in v2:
> - Add "Fixes", requested by Amelie Delaunay
> - Add "Link" to arm generic timer patch
> 
>   arch/arm64/boot/dts/st/stm32mp231.dtsi | 14 ++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp233.dtsi |  1 +
>   2 files changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> index fefbf6f4f153..27231e140fbb 100644
> --- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> @@ -24,6 +24,19 @@ cpu0: cpu@0 {
>   			power-domains = <&cpu0_pd>;
>   			power-domain-names = "psci";
>   		};
> +
> +		idle-states {
> +			entry-method = "psci";
> +
> +			cpu_sleep: cpu-sleep {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x00000002>;
> +				local-timer-stop;
> +				entry-latency-us = <150>;
> +				exit-latency-us = <200>;
> +				min-residency-us = <1000>;
> +			};
> +		};
>   	};
>   
>   	arm-pmu {
> @@ -123,6 +136,7 @@ psci {
>   
>   		cpu0_pd: power-domain-cpu0 {
>   			#power-domain-cells = <0>;
> +			domain-idle-states = <&cpu_sleep>;
>   			power-domains = <&cluster_pd>;
>   		};
>   
> diff --git a/arch/arm64/boot/dts/st/stm32mp233.dtsi b/arch/arm64/boot/dts/st/stm32mp233.dtsi
> index 78f4059fca5d..cebefd99906f 100644
> --- a/arch/arm64/boot/dts/st/stm32mp233.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp233.dtsi
> @@ -26,6 +26,7 @@ arm-pmu {
>   	psci {
>   		cpu1_pd: power-domain-cpu1 {
>   			#power-domain-cells = <0>;
> +			domain-idle-states = <&cpu_sleep>;
>   			power-domains = <&cluster_pd>;
>   		};
>   	};
> ---
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
> branch: master
> 

