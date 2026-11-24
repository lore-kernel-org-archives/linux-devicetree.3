Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795533827;
	b=hSRiVXqrYd6qhaAVfwdu/aF3se336l6iu4WK48TybXT5XPeMOpj93+vFNq3wh3K3MgKg
	 pXn2tnOxABW3LxSfCjmn+DfWGQtszDvbTc57zzC1dkIt6YZmAPLgpq6FITkK2CthF1mHI
	 lYymcJDICKv/mSJ+s1s0us5GvX5UAxUtucjXRzbWAP/vRPELRSMwAXzUPsCOyENCIlSuC
	 DpZSr/tGmBR1kHQb7ZFYJIKtamS2+xkQtUT9K0SScGmNL+VhCuIZckM85uz3LKpCqMH2h
	 Nc2C80nzLaqAdGSCM+x0uVk6l6ckAp42LaEGe46S2B9J1UcN275MJVf5qavlvdWGmPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533827;
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
	bh=NZZPnF6UroY8CDzW29Q5kOqp27It/X2c0Dn4tANBcnk=;
	b=QxnPvpnqxRfWrkt2uDXkEwX8zu3+YD324HxlWwFNqHbWouYLHOteozM9uurqIeooLHIX
	 RtRyWudP4EHN6o62ZKxqO/F5CPW0wyPYEs1XSVVW9uBoAVk63Oa3ceY/aepAaT79Vxabf
	 6nwqIcGOryPtlelv+alohKujFxLJnyP0hz5JMxECXKiVl/+SSDC5ZR0KW/xv1u3vybj/5
	 4Q/UdGp9kKwXmsC62x9+/JEWMqpF2BrR6ZqD0YOorpTIMuvjpn3KDv+CRQO0i4CJIbHV9
	 eyoe9gRLAImIE/f6TdTVDmhpkpoI7z87ulvFICVstwuIZXMvJw90VOZAA7ZLeyGRCOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=gaHwGMmN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.27
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B7C606A31E;
	Tue, 24 Nov 2026 15:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3B7C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=gaHwGMmN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ov31paHPYKgod70JMPD2Cec7OljC3/vbtV27UF5fzCBi1iGz8V9ibkzAlw5jxt1izEWrlg9CtMDRmir2/BOKgBEVzGGrs4VlIaprt5mHKWrYvMrdviKb8nVkYU1M23Vet5FEjL5G8Yc+hS+FOsTxjVrz8Jn/n1arER3QNHGM0K9Nvv299bDvnGJiUT2RR9kh81rsKdqCgE8NWAMyXPqO8d9AJ7Odk3vbWLjHCtMhNH7l7zJ+dcTvr3ycCSoRi2Vaa/tqlATQhxTWHrK8h6SS0SKCt6MmYwSaVnMiEiGy8vW39p0SC+DcdezWt1jYMwVnla+BvW8mFhHqTfmS6Ck8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZZPnF6UroY8CDzW29Q5kOqp27It/X2c0Dn4tANBcnk=;
 b=PZeJV648tbZB4xqm84+rEdVuec69jCUfQ+Ac5tHtw5VdKHkCzygSbj3Dr2LGBUS21avRNGeoaeV5BJVZdqCyn+MGaOp7aYUEXhqqg/HEwx2xBjNtwq9RbanxWRm1pemgjyEKShH3iWuLIUYTIm+gx0EOkJp7ynsaDBOeGnX3PARsyhO8VFyOM5l+SiGFdf+BpkjbLua3HwKSgY9rted8eZBCN56pRwvLllxN4p+ye2uT0dW8MWh3hCbUsgMm9PZYQNDxcU+J1JDPm7M77nZDfVVnZfZRgFyX7RDMZSGFFuXKFLBxGiQNzrfhPa/iqiaVT7xszcd0XEX8jGugKQF8rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZZPnF6UroY8CDzW29Q5kOqp27It/X2c0Dn4tANBcnk=;
 b=gaHwGMmN4Wl30NASLmq9qpk/reDreFOYn0GXCEe4gK9IrlPOFdmg2lve3bPMrAXVS1DJNCSJ4ryVvHgIkFx+CDLkmYkoXGPVqH0KB1FijHgdOqY0U9M7GK1cgsGBnaSfsPf2egEqdtpwJa93/vgMJAV2WG5iZcnc4jEa5l34QNelswrTdlmR3T9bPgUWBSk5Z0E2k3HfPpysh8SeIdSyZvVL8EU+90KO8wwwtaTZWRifIybMRCg2k226VrNnMINrO4E//mgUqpJtE+wfmEXVn+1m+DoEKVT2hsHMgNYxP0eOJpkMth0C97Q9crv6Ayw1HRr5Q+1JydIwqDaIXSUzGQ==
Received: from VIUP296CA0048.AUTP296.PROD.OUTLOOK.COM (2603:10a6:800:34b::13)
 by DU4PR10MB8576.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:55a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Tue, 24 Nov
 2026 15:23:43 +0000
Received: from ZR1PEPF0000E6B6.eurprd07.prod.outlook.com
 (2603:10a6:800:34b:cafe::6e) by VIUP296CA0048.outlook.office365.com
 (2603:10a6:800:34b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 15:23:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E6B6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 15:23:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 16:24:47 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 16:23:42 +0100
Message-ID: <0f024c0d-ebce-48ca-837a-75df4855ccfd@foss.st.com>
Date: Tue, 24 Nov 2026 16:23:41 +0100
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
Subject: Re: [PATCH] ARM: dts: stm32: Fix STM32MP15xx DHCOM SoM PicoITX
 overlay application
To: Marek Vasut <marex@nabladev.com>, <linux-arm-kernel@lists.infradead.org>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	<devicetree@vger.kernel.org>, <kernel@dh-electronics.com>,
	<linux-kernel@vger.kernel.org>
References: <20261102052306.868349-1-marex@nabladev.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20261102052306.868349-1-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6B6:EE_|DU4PR10MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: cfd7ef16-8cfe-492d-0d82-08df4a3eecb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|22082099003|261009223027099003|18002099003|261102123227099003|56012099006|11063799006|10067099003|261026121527099003|261021123027099003|261021121427099003|261021135927099003;
X-Microsoft-Antispam-Message-Info:
	yUXCqsmxxQePi8coaMMra5A+kKg//i7ygNUslg35LwoeydTv+aIlMa4W6+UKmErhWhkLGFc4Yxr/LOedSnX7E7s/hsQFzdk3MjIbi7Q4g60SprWDIhWVSQxHE1otQjGYJgQs+wwVm8wFiIbMtrC97Ezun7Psuv3U/zcRMWPkcuCC1xHaJ95fJwGgFj1AYyQhVMZAOu7CD83v/ALj2pTjdDDtee6O+XRzeQB82DBHAnZmZm7Yxr/MxlWbld95iWDq/0Ij4+weglhEKwRVXbCY4rLV7L2BRyscM7jpQQbPE0M2AGqUuIFzKLkEog1cB6rFnzwFT+vsEVHNtEEoThrc3eMV1GMvSVBIVCbcukJM/ESB1TStK1dhGrRGqO53j37ejFAOvnUl75FNzYnmaW+r1w1+mkdDxpZojDJkar2gX9zk8Do2rXvohfkE7hLVQmy4j1Y4FHkoBU+g67z4L2d6v4+RQar1dfZspmHOQJTYb3xG6Xpt0U85qCZ4e5rUqwgY/pYEHIHpyNSKcORxmA7T6g58OkqV27WT4VIP+LEV3/CkusmT2EcKAX/yDFfFQc2Les3ZZOs0hlc5KWfKhy2FrKfVwGOlwTGzZ7rXboBrL9lvpRlH72i3hbpkr4BPFZ+T2I/u5n5zDNCjVS80wgVpzGV3EU68zui9qhYlatp+Qkrb4JKpdvUAM4oCfzHZP2SlQTD01f9Bd+hlA59ctuxBiQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(22082099003)(261009223027099003)(18002099003)(261102123227099003)(56012099006)(11063799006)(10067099003)(261026121527099003)(261021123027099003)(261021121427099003)(261021135927099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iLU/3Bfv1KoWfo6JdWrunaIFNWsHB1IyKq6eMwmLJrfiM6hGLj6GBrxnLXmm2B4OQCUxrR2ohgVonZffMDC0OW12w5d17iS3YhcRlZ9sSyZ/IZUTzJmtOXxrUu7uhIeZeOR063/UAEtmM6QoQOSg3sz17Z1O5ifqqQaRJhE1JOp6SIwvSHG5MmYHOWaY8aq62XZDO++aitJUt7wdVgM80V5aw6JcAUDuiaeNW5rHl6f515gNk5a1ScjuJlUAy2qM/yJRWGTrio0PSWf8uOyy5IvJZ75lilFuhKkfdz9NzDqCxPBcGgoq/ukMeQuxfYzjIetPbsBJqkVAoYhQ1g1PKdH1qDFzivhYySXmkzHavQEs55XB26aFmRPWfKgAFTB6Lrx1OqCf/CInF47t9z4p5ZKpRynSz5FqDeNRkTray93SZDElYEPcqPOG/wNP+d2i
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 15:23:42.8751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd7ef16-8cfe-492d-0d82-08df4a3eecb2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6B6.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8576

Hi Marek

On 11/2/26 06:22, Marek Vasut wrote:
> Generate the combined STM32MP15xx DHCOM SoM PicoITX and overlay from
> PicoITX instead of PDK2. Fix the Makefile to use the correct base DT.
> 
> Fixes: 77a5fde00b9a ("ARM: dts: stm32: Add DT overlays for DH STM32MP13xx/STM32MP15xx DHSOM")
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-kernel@vger.kernel.org
> ---
>   arch/arm/boot/dts/st/Makefile | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
> index 10c5d75f6169c..f699d37254e24 100644
> --- a/arch/arm/boot/dts/st/Makefile
> +++ b/arch/arm/boot/dts/st/Makefile
> @@ -94,11 +94,11 @@ stm32mp15xx-dhcom-picoitx-overlay-548-200-x2-mi0700s4t-6-dtbs := \
>   	stm32mp15xx-dhcom-picoitx-overlay-548-200-x2-mi0700s4t-6.dtbo \
>   
>   stm32mp15xx-dhcom-picoitx-overlay-553-100-x2-tst043015cmhx-dtbs := \
> -	stm32mp157c-dhcom-pdk2.dtb \
> +	stm32mp157c-dhcom-picoitx.dtb \
>   	stm32mp15xx-dhcom-picoitx-overlay-553-100-x2-tst043015cmhx.dtbo \
>   
>   stm32mp15xx-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh-dtbs := \
> -	stm32mp157c-dhcom-pdk2.dtb \
> +	stm32mp157c-dhcom-picoitx.dtb \
>   	stm32mp15xx-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtbo \
>   
>   dtb-$(CONFIG_ARCH_STM32) += \

Applied on stm32-fixes.

regards
Alex
