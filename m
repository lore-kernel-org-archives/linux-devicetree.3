Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04168489888;
	Tue,  4 Aug 2026 05:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785820141; cv=fail; b=BFOYgCeo36IM4baOWxthDPY1gu1bE3d5AOG7fLw34Qy36u/fV21fMf/g22l1sa8ZrvsE5uPZUa+falXI8NarkIkuLWTW752juEw69GzxgTLEqnxj7+bottWFTIij/4jXBXzce2wprviSL1vX264AsD8NK1S/ibKExmVC+rzCEQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785820141; c=relaxed/simple;
	bh=+FPzTVJjsIHAr5pt/14ek8s2jydYRNFXNU0u2/qruAs=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=VSFhNDl5CRGUJXTaqeQuewtxpgJZER+hXvEZCfzRMUaK/0OydQmEEmw6p4gpHHSCGH2mbWB3nmEItUe0fqliujwOQuE0jbd3O3Kj8JvdgIEQM1GZxzZWcAPxIhNZql9hc9atnjLopl+YeajnAcHdphqamMH4NLY2D59YMbp8oE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=RowkNu1n; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ppAvXjvO; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="RowkNu1n";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ppAvXjvO"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67418WZd2306484;
	Tue, 4 Aug 2026 00:08:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=n3Kuw4H/T6QdtcuDVKvgVN1ipISMsdZFb84QRhaG3
	Hk=; b=RowkNu1nv5FpkSiUjudXhHZnSCdJFr0mKg0IykeJ6zXYBQCY+bw8hwP88
	SIeYsjYttwwela+XvzMalCINm8pCknZpHSdi13b9yq08imeoDZaNM/GEBL8FJmOn
	3el5+dqRr11TKPRsXqr1AAkos8G686pqgJdnSPzNhcu04F20n+7EvaL8G0Bo6YDi
	Z5B8ndBnZgc6AkKRLZ8D2NfoMjWWCeQt9yVTXJlQ4fCt0bqLfI5PTodiLYnAokQN
	otVxnVxq4lUdJlWq6oYOaXAE2Zj8LDYEYomr/Rj4d4je3AS/Gm/2Kve9wPz0gnuy
	vggXzvPSf/+lhHpyQYDED4iFCXiog==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012024.outbound.protection.outlook.com [52.101.53.24])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ftt70fdw1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 00:08:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WG7Gl52hmxhZZ0uN9+Clr0xoCbAvaH+HYC474mkUmnRPSv2xAkIi9qrz8NTKoV1VoEHan7N0J0HxCmnVPPvvtWVd0Xjnkv2RJDUCx4QOKBObhBZXkDpCI2mN1iIQo0zdXtIKY3Ndl12fdIbfyyWpmROkJGeS1iUCLLK0G22skUbvj/vpG1BUW6QGfcnK8phJDn1pkwNdlS24c8WqTslHp0wIXstyBUV5Zs4ycvcculvV2+oTJahLpBJfMfFAViihIv4dkk0NhJVuGfiZHHR6ba7L4UPqU6z43psoC8Xv8yYWstd7EAS/ogvbbOriBrvdMeXewHqJac25I9cezoS/4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3Kuw4H/T6QdtcuDVKvgVN1ipISMsdZFb84QRhaG3Hk=;
 b=OAG4oQ5JyUwRRp/gbczIpgfAOS8nhBcvrNAahxWyBpswFx4uLB9vmi2798tumjwYj4Y76/trMhcEFTPitCEq6V1YJSYhhCUL3jIHFE2yVXTk0F/HTGvy7+jLmqSUweH/rl6ahPMQLr00rGRd8Z0QNbXPhVsZZO9k7CwX6o8yo7LtFWKeBze4fFpmVBaZa+32BzYbLH16+e4UXDr0M62QLZLk4v8dMdh5DLLM0IM0aUpD5aw5fjuA6McE8nIhV8HoylKWtdFxAXc3MgmPm9GZutddBDZy/6nT5ajbxlrC2vF9gSaeQJau0Sch1tnbVJGvZlAJAJcl2C8UBVLiMOQeDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3Kuw4H/T6QdtcuDVKvgVN1ipISMsdZFb84QRhaG3Hk=;
 b=ppAvXjvOgxlW/gzUDAirAYlg688S9lgXs6T0TSgHhIYgAku0rAIMOiA2EMG2OkWjVCOu6fU2M4RPBPuVSEz97pyG5uPF9uc8z7qt+1LrVttS2JKSrudu84VFduwL/5HPsssUeuaSGDcKR1WwTiDyMNzqUExZMg+G0cjHixwPi00=
Received: from BN9PR03CA0106.namprd03.prod.outlook.com (2603:10b6:408:fd::21)
 by IA3PR10MB8707.namprd10.prod.outlook.com (2603:10b6:208:571::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 05:08:51 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:fd:cafe::98) by BN9PR03CA0106.outlook.office365.com
 (2603:10b6:408:fd::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Tue, 4
 Aug 2026 05:08:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 05:08:50 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 00:08:27 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 00:08:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 00:08:27 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67458M7X3052091;
	Tue, 4 Aug 2026 00:08:23 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62a7-sk: Add bootph-all
 property for ethernet boot
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Chintan Vankar <c-vankar@ti.com>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>,
        <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20260716064449.2505650-1-c-vankar@ti.com>
References: <20260716064449.2505650-1-c-vankar@ti.com>
Date: Tue, 4 Aug 2026 10:38:17 +0530
Message-ID: <178582009758.4187098.13677911190468773934.b4-review@b4>
X-Mailer: b4 0.16-dev
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|IA3PR10MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 81518f42-3b2a-4dd1-4ead-08def1e67913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|56012099006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zoKvFkFPyw67dP1SeA5KrKdIGkV3axlAxKtZdgkQBncJei116wsio3yCe8UHio6i78KYrKTOZnOXtt52aVa4PVlmryBEeQQHuNOc0lXbeuHUSYSaPAcIQJCSdjYQSvZNfth6j09IIgTGPSfNzSS5NuKRTBLrPzy9oZZE+iNROct2IVx+TWT5ZMXqOXNF4aQkyFWRhdLFP0DP7pLPV+m477VOtn9FzzBu8X9az2sroz3H+p4p5c1weKH1rzJ8JIgSbsEVb+nRg925l+PAJXd3wJkLK0ro7Tt38fo5iojPdsE/xSvufWsWiQNYNiiXRoDCmL/7KsEkv0vehTb6qUieTk9am3JiOt/ljrITQr7Z6F60KarktLEaNuzovdED3waEUY4wAAsYBMcUyQkkBmc7RJQOOsgwVWXCvHKtGQh60I8vGAM3W56NxBedRX4Y/nWfQMcROJwHqCn4A/paNXAa8R2lMNGPidY5+b3lv4ee/XwrhS3Yal6YSZJOrHdlPIyGlbfti315jNe5TGvhTQSz0OKtC+ylUTgsvsv0PBLL+D8VbPgTnw8il2dCnLPaseV8gJjBRJp5j9g+EGEc679xh9SwG1EiMyLtZxOqVbj8Z9j97vP+rTGjKMIvOElGOG/4rEJnfk7PeuOyk038mpDfaxyuaA1h5niKki+Lcw0qz/HdhEw5aFbI1EM0SSObQQuTGIHW20Xj/rOsgmL/yshqYA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tss7tdI9gEtL16ezPWAfIazvAoh0D3Ef4slo7JCc8vdXWzAkQyH28HHnD6Y85mQfeVNb4PPxX9ySCUqNnxuT7kUcmFrgPEScmp9U7iTx5fOcWgKdznylT2GO/ZLxpWhXZLMb0UPHPbc4wlwDFgurdQhJLS4x4AYMp/3+rtv/sgV9MhteQOcA0DLu49yUoos+lmEYiLYQynpch9WNIfjesekRcwKEyPDsWMollLVu+e+gwjZnvM50s2SkgH/wfMcCTvj+Ch2wk7jUWQnLlwOWwL7YW/K6dBXMmUPt+yD4TOB5jB1tO3UDGZE4M7Wym38w1wFJl8oMXZsGUUg22B3khcBi70ycvkOHtJtYnmRKQASAL6iiAzPCu3ZvK9uSRwPnsOsQJYugTpgd9rrE7w+YR/jTsvP2EH9BPifs0xXtqc6rhA5BhZdeSD4gu8RAZtUT
X-Exchange-RoutingPolicyChecked:
	hhHBs3WdKQaVlQ5b23KxYjHRyJ5VYhDhHUHIiVRb4jWiy85kug0Ry7KK7Catrri2K8Okz//eWjXimG/Z+xWMdD4VkOoFCMsKFfhvDtVtcLPpr2Nnk6NYWQwD6L2+8SWi34bbFoHrNCDuJFSo9KIEcY/0ecxRzkSK+vrvOZ0Tnolottm4HQQGuDxzc/VDyPa4+K911b6vIB2kqqRiagKqYDaTbbD2d67QArmtGvHyEo1Os+O1mER02Gy3QKJAuRc9D/ogKhzn1ZxKv9sgXqMAnrUN4UJPr9QyHbbG9ARWhFl2A80VEOK20J9NHdSJeGN1Z3eQrWirjdD3vkwOFEz2yQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 05:08:50.8010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81518f42-3b2a-4dd1-4ead-08def1e67913
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8707
X-Proofpoint-ORIG-GUID: SZzystPs9AIg58lVbfiWc2wXcTbDP2xU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAzNyBTYWx0ZWRfXwLje3X+JqY4L
 Lzk9nHrTWmphEWVfqoekrHD4a6jhuEcH3NmCM/1CPkN7yxWPw828SlR9BsI/qeC+q7hFDXv1iKg
 QZQBwONMsnYxRAC51WnBOtzw7fZSJbSIQgZ65+gm5V8fmAzi7K9LCY7z4ml/FX/nwxxmXdqrhpd
 A4kMelnrXI/p3KPGJRX8LaB2WsR5aw2bUvSPiYqJSXQDfvYbFRGaCIbYCEJO/Qf43eI/aCTXRDv
 fQ726QQ4cOlXLLTO16ioAEv4CvsRAis/cImcSsitWVs5Zbjxb8LitPwM+M7KrEeJ79A58SP7tiq
 zUVou/IInpjyWN7ckPlG1ISsF8vlnb+920d5mvWPsrTr2TzFpokjxvoAJGY7+80S1Moi/K4bzCW
 qjUrvsXYgXzE/GXO8Tomkw5LuTKi3XxEyojbkjicsyjv+dnl80rueUZQrDIcjTkzQwdx0nwox+H
 dP7NfUwPYMRar+ZF75g==
X-Authority-Analysis: v=2.4 cv=MbdcfZ/f c=1 sm=1 tr=0 ts=6a7173e8 cx=c_pps
 a=62XUoh1M8q72LGroxeb6lQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=dRNkYeHfQ1OFdfBEjZ4A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAzNyBTYWx0ZWRfXzq/7d3jOfqwf
 hCHStsCOGzLITDL8z5KfGY1ADzGKco8OaS5dPZq0vIQaZRy484Jh40wPpyghRIQMqPPpqXRjGNG
 nLt62bJc3buK76Kn5T5WMJwem3tPYOo=
X-Proofpoint-GUID: SZzystPs9AIg58lVbfiWc2wXcTbDP2xU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040037

> Ethernet boot requires CPSW and PKTDMA nodes to be present starting
> from R5 SPL stage. Add "bootph-all" property in CPSW MAC's eFuse node
> "cpsw_mac_syscon" and "main_pktdma" to enable these nodes during SPL
> stage along with later boot stages so that CPSW port will get static
> MAC address and DMA transfers are functional during ethernet boot.
> 
> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index 821a9705bb7d..59cf49a14f61 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -230,6 +230,10 @@ AM62AX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C8) WKUP_UART0_RTSn */
>  	};
>  };
>  
> +&cpsw_mac_syscon {
> +	bootph-all;
> +};
> +
>  /* WKUP UART0 is used for DM firmware logs */
>  &wkup_uart0 {
>  	pinctrl-names = "default";
> @@ -241,6 +245,10 @@ &wkup_uart0 {
>  	status = "reserved";
>  };
>  
> +&main_pktdma {
> +	bootph-all;
> +};
> +

I ended up applying v1 as bootph-all for main_pktdma is already present
in the k3-am64-main.dtsi making the above redundant.

-- 
Vignesh

