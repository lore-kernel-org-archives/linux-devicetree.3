Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012002.outbound.protection.outlook.com [52.101.66.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8AC2FFF89;
	Mon, 10 Aug 2026 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786349751; cv=fail; b=bYYquQ5xW6XnGMdjlqnkVupEuK3cRARZBejZAB93h3LApnYvNQRgkM3JbmPFVSIAQi/Je3QOo0MPosOe1C20VZgdVSYC1XHYG+JkR3FJR/woA57PJN8tX2yHdAU4mLcnzwqZcJifdEABG2fOY0T+oO0/Pe9Fh2IKTfrK0gShock=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786349751; c=relaxed/simple;
	bh=c7zQGUsvaj3hCwLbENHlCywADue2AoQw1ANoYAD7Fsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JJfL5CbxEmMt0z8HirdypfLF9r2LqiHOSgXekB/AN/syv1+xVhzwxa3Cr4SU8ipkpyyAlXhwW3Ged7RnxrrZ6Jiq+T/E1bF+PFPn4vePFkbZ75SWeYd5G95nifVOcqCD6dnkNPepdgBGEUU0stNB1RLUPBovmuwXxfM5kOJZmvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=S9tAfsIg; arc=fail smtp.client-ip=52.101.66.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="S9tAfsIg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phZkWQEcsoIDCJr6qvCI2fMmDHmN/nKOxnGshJDuQ1R8Dric3g2ystFYh71YOEaRfAgVqoDzY0Tyi6XiSa3WjocgHypEQx425/taEZa5FqJez7JYM0MjZplARX6451bSPyQwWI+dvAYPvPir7rTYrZDc96vmlFHARLmw9eJABgVBBDYh+I89CqfbfwgdqmzXbyXvIUy/KgOG+umxDhmYZLd+w105nRHwWQQRAZpZdCt3G16WWuvv9OgKtjV0oorBemXZgpkYpfVcrlOiK+esv2bHgraKiBy0xL2jOGuipQPLRvuYWahhHxHQOJCYyTfWxba4jlYg3arBP9XckBuFBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nhsk2WWeHDNJ+XMiGdZb5TyQ06YBWOLC73dTU9p22M=;
 b=W9W8GjpvYEN2onTyfa00/cRhDCCAAqoQTnxeGuVgWHxIUCbgPOPQsXa52fU4obDIh3qgsGAiuM/5pLgBgXNk0r0YJl+5q7jxcTwkqjLwF9rUqDVTkPPR71N7bykg97zwoArXgH646+AlNQu24/83gIlU34KziTNxl4TnVpBizAsBPtjFTvt2WJ/FGFP6tZQm5oa72WyXO0+EnUl0VV1BP08Cia41Z1o+RV866mAcGtTMgC4r5Bel9BzB1RsukQEgYsq9DGvMYyUybbs1aZBKws8NNReTm4xLzfGk80rlGKDEF3nZwOW6279H+zStim2w2DNiFTZKPqcWbjSy35qQKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nhsk2WWeHDNJ+XMiGdZb5TyQ06YBWOLC73dTU9p22M=;
 b=S9tAfsIgh7pr/1lRQLVgu3RrKPAsL1l+afTYiVNgq+JJkMU7a07H/MqsIWRfmSIoijDe5phcD2VJwPpyy2WXG2UXloMctGiyYTxTDNRVh/YXcTFNZCE85EED9InjKbo+sEZLwh2eqHkFSoGCKzIo7VTDJto3IlQ81GKxmbXWHT1BcIr2Z0QlmQuTIBdfruaqD5mTcbHV4oa0WbUwN3pkYmtg7atVNMtAxyE9uhwRG99tsnC+zHk0sqqvDxaV8eGRGx0NHtbrTUQE5x0BDvBuQE0RkOR5hMaIJVSyAT3kk3BLCgnci9kA17OeeMYmF/8NFhM4WooKDs/Lw9tJJ9nuSQ==
Received: from AM8P251CA0015.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::20)
 by DU0PR10MB8021.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:407::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 08:15:44 +0000
Received: from AM1PEPF000252E1.eurprd07.prod.outlook.com
 (2603:10a6:20b:21b:cafe::75) by AM8P251CA0015.outlook.office365.com
 (2603:10a6:20b:21b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 08:15:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM1PEPF000252E1.mail.protection.outlook.com (10.167.16.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 08:15:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 10:21:12 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 10:15:42 +0200
Message-ID: <3db80a7a-e09d-40eb-b8ab-4110a5ac1f09@foss.st.com>
Date: Mon, 10 Aug 2026 10:15:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v7 15/16] arm64: dts: st: support Engicam
 MicroGEA-STM32MP257-RMM board
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-kernel@vger.kernel.org>
CC: <michael@amarulasolutions.com>, <francesco.utel@engicam.com>,
	<domenico.acri@engicam.com>, <linux-amarula@amarulasolutions.com>, "Conor
 Dooley" <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
 <20260715062201.3599458-16-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260715062201.3599458-16-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E1:EE_|DU0PR10MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: 489f9c04-d219-442e-f43c-08def6b7932d
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|23010399003|36860700016|18002099003|22082099003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
 gGXyRrkw/FtxxChBYEsi+NGM0SmwcT+8WoI9pjc23JK/UHm92rN+RYxZBUYZWN+SfEdReV8Gaa0h/CS1mSx5l0HaRLZEXGd4c/cLV1jz0XjIQufMmsF8PauYjMCZucvx6PBNZYpHj6bwW4Roq3ui+b6rr7vhw+c8bFx+xPJnmTYNJQc5EBnlNj6T4AfLv8RroYZSyrBOYvR4rTjdrtt0uxO8VtBxQvRrhPj8TkO8d3BgCKL6NiJipqvr8jwrE7e8zeQGW2RG/gjlspTadCtFBpTMuD5O14xYUncGdx28OryEEO6RBMMp6YG+BO9vUW+GyS2Lka7AhbvhcM1GNtTAfjDvLJw5f8Mi/j5lUYGfhIKczCygJZKUOgj5kmVLF31aG2gJ0otXn42q1CjkoX2kAeKXSyJDvCe6CihUFb0bAVskOWc0JtQW8U8JO1DQYkx2enRGi01g66yhlCI2OPTDVrTa9L/BpnY+eMUiXoolaO/euHAkQxgK3P6uxAeuD34Vpn2kM1qk08jZ1ndl7tzbeP3VUdlBWxpL0fRxE1FRRF+dlrYMLhnFc2xP9vLFonEfqJWGC9uZ7vmtgGX6U+ZNeFIYEcnLTizRh33Cd1A1Z+gJXt+DF9+F/tzA9FEqRR7s9seLFU/oKwTdD20oSf8ubJOTJNvCS9EZ+B8rZyTOJurnrkRCNTT577aw42fMgcRMa2VjHqljG0oaQFEN3S/muA==
X-Forefront-Antispam-Report:
 CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(23010399003)(36860700016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 MCkckUixWUA1puZphAZSjX5DUTVDqswJ84yN7elX0Jv97hHXjUvUph348ccv5zsctRAawrEgc3xZmj8IbLnTUK0RD4DaKFXxm3S7PA9KkmvhDjAwqUN//AFzrqlO3crXEWmGvdcXkjn/A/An5B1iLW/JyHf2L/taYDIZBN0u1Gc29fIaj314CKu3hwsm3epekJA+hbFrqI4NXLt+H8AhFLmhxZV1CrgMPyk+NdSTw5XZV2e3rPcd8noa6FXHfZFK7PYjvoY9QcbRE//5Z/Zi1KIEWzTPBAM5ylI5tmvTZmG/fhAE7qanWsv6BbiexQKdgczSfRRdeBKrNo+9fsCYosn0D9fwLlyANV4UMeVRJ6rtP1Rch3tiW2yv+6Z41PQs6JbENltu036FvmOudixGzi/cqolq2iAH+a/nMye7gLVZNafkPcewImdajRzTXVF2
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 08:15:44.0962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 489f9c04-d219-442e-f43c-08def6b7932d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB8021

Hi Dario

On 7/15/26 08:20, Dario Binacchi wrote:
> Support for Engicam MicroGEA-STM32MP257-RMM board with:
> 
>   - 8 GB eMMC Flash
>   - 2 GB LPDDR4 DRAM
>   - CAN
>   - LEDs
>   - LCD panel with touchscreen
>   - Micro SD card connector
>   - Audio codec
>   - Buzzer
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> (no changes since v5)
> 
> Changes in v5:
> - Fix touchscreen resolution to 480x854
> - Fix SPI1 CS0 polarity to GPIO_ACTIVE_LOW
> 
> Changes in v2:
> - Drop the clocks property from the sai1 node in stm32mp257-engicam-microgea-rmm.dts
>    to avoid overriding the peripheral bus clock reference defined in the base
>    SoC device tree. Suggested by Sashiko.
> - Reference the existing labeled nodes directly at the root level using
>    &sai1a and &sai1b in stm32mp257-engicam-microgea-rmm.dts instead of
>    redefining the entire node structure and redeclaring the labels. Suggested by Sashiko.
> - Drop the #clock-cells property from sai1a and remove the reference to sai1a from
>    the clocks array in sai1b, relying strictly on the st,sync property to handle
>    internal synchronization.
> 
>   arch/arm64/boot/dts/st/Makefile               |   1 +
>   .../st/stm32mp257-engicam-microgea-rmm.dts    | 319 ++++++++++++++++++

Series is ok, I just have a question regarding board name. Why you don't add the "d" soc information inside the board name as it is done for others STM32 boards ?
