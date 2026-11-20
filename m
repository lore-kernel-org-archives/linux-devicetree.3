Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795180008;
	b=r/jkLfbr+uvDGfHF6OEW7pgD2pHCNZrpVc/Y6aO4wdTHGDfOuGVg3VDDp7TRFxL41uPF
	 5PkNKAAE22dboi4HE336WKHd0eGNXaS6OXCVu3nfJE4ed6kYkZwP/TfN/qLkRNTMU9wNT
	 W8oM+oyvV3N87WWITTqyOXF+qUXWopSuxfBvkHosmAEHNlVOGqICTHFq5dhqhs6dTu0hb
	 nl345uw7WOoC90NbtqU5ktPx6MJSOd5P9nondLZE1eTo0YOrge9OueaigZlWXL6efut2D
	 5mL76ZOE/jcL+Gl/RdQeAkvy1bDwVUs62/xV737KFqY3cTEnFm5y4zPOr8vCUzD5SBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180008;
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
	bh=E19SkSQNqMnbD6JXYFfN8Zy23J+ZHvJi/Mnbv1pU338=;
	b=lYfHxCM74y+fBi5osrIwAzJiSzRBCRugdRuIIO9yulVfyKRxhV8pDWEzBMC+jQwVN1m6
	 VecWnfOufvOewskIY3wNJ6Ja3EOmS3F1YGw1AgR7Rw4bmLAyyocr8hNCzDji7NzXLitKd
	 l96iDHqEHCeISh2h1AdVIS/orSLo9+6LkkB56fTkcHqGB29G+Cu6uHWWWG6vQPmp4BWni
	 nu/7fs2N0j9+PHs5xnu4MqG3iBbM7y4w2SgToUPlNJGz5TwGsfB63D2JKHAAxKw9rO3dk
	 FSK4e2LTaxM3oa+spFRfWYpWjtQ+Y1xS17k4dtlw121dirc5tJD09UjBexpwZmGikaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=JKusbFtU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.62
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010062.outbound.protection.outlook.com [52.101.69.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F29D606A325;
	Fri, 20 Nov 2026 13:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F29D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=JKusbFtU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ey7LXluZrbXyyWhEa4ngQNbCpVMVrxMU64Fs4K1N6XcIRCllKsRQ2blRolQ+j1Y9PSLbSi86pRyozvXfwfO7gkvIJBusdq/W1Bv5ss/zXOyNZmQNluCq8dM7ubBXiWgxG0n2LXoJqqsTbhRgiD1kq5tiREIwRHoxeLaeMlLI0Nn4xk4VYo8leBEdmGFeVDG0GolFJgkeLvo1Ldl4pPsAIpoXNdRb+Vu4UvLEuqQVwZgdPQMgv7pfWC60Z9Qcw1vyxBOiQYZEs8sw53VvCuW5DoNS/+BHS3FMtUI9E7lbA6f/B4wr58iIySFnZIUcIAmAubyu13ezsy5QUYnqRtQKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E19SkSQNqMnbD6JXYFfN8Zy23J+ZHvJi/Mnbv1pU338=;
 b=Co5U2YVJnP1jhhBLqDPMa2ScWyLGuzZ0ibMU2GKbv61u+L5Ek9Jl4nroWxNd0R1H7fRcD3xhXMiN4bOlsA/uA/v7wIH5z+Hjl7EuJz2sRqyu6kqrmJkWwJYU1l4n02aDRntvGkagy7p3OtbD2mgKAibhr2sMAY353LlYCUamgB+Pfb1Sg8DFrA4zhZujnPE5dBzC5ep51/Ac9tcffE6qZiYCa+QymlXiiZckm/T4JKYLoKOINGwPVseI7+Zb2dlqLgV/ac7ilnG1r4wfBCxT4Y2dNn1KuQcAdM9fJcRNl9Jw/cJM/PCabHPYdoKlFQTsjumxBFrb6CQuN2qLQN5/Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E19SkSQNqMnbD6JXYFfN8Zy23J+ZHvJi/Mnbv1pU338=;
 b=JKusbFtUKFUKYMiqCQCMbbhFnyIBIZdlExG8b0wsjKGCpAWqKP+z9DXaKf4ktMZbZlWtMj0gOWQWY5YRwDr68pCO4cd1U1g+hl02owWRuQjnnz5ZyJ30+WLrBn4PJSWq3d8+eui3rW/n2eiD5V/vpHi/57ItF40LkKVx3/ONf60Qi2oA3zPATo95fziPtsATB+BhkaIMvQ7hkxnTq9TJ9mdaqO2mo3rxQLon1vIHbvxl1NfIkpSFK3TN5GDA/IuAuIJhjrIhavVjgVrO0zcc7Rgw3XKTIvbUIC5VRbRZtVV/PPWFyUyvu+p9kaKb5cMRt8p0oexd/7HH/WlBVKV3DA==
Received: from PR1P264CA0020.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::7)
 by AS2PR10MB6446.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:559::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 13:06:45 +0000
Received: from MI3PEPF0000848E.eurprd03.prod.outlook.com
 (2603:10a6:102:19f:cafe::a4) by PR1P264CA0020.outlook.office365.com
 (2603:10a6:102:19f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 13:06:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF0000848E.mail.protection.outlook.com (10.167.240.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 13:06:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 20 Nov
 2026 14:07:30 +0100
Received: from [10.48.87.222] (10.48.87.222) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 20 Nov
 2026 14:06:43 +0100
Message-ID: <46796ca1-5a03-446c-bfa2-173fac805dc9@foss.st.com>
Date: Fri, 20 Nov 2026 14:06:43 +0100
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
Subject: Re: [Linux-stm32] [PATCH v2] arm64: dts: st: add PSCI idle state to
 STM32MP25 CPU domains
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Alexandre Torgue" <alexandre.torgue@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261119185544.v2.1.Ia5e0774883d237f5825b7090962b454294922558@changeid>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20261119185544.v2.1.Ia5e0774883d237f5825b7090962b454294922558@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848E:EE_|AS2PR10MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: e730aa33-f230-4cda-aaa6-08df4707209f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|22082099003|18002099003|11063799006|261026121527099003|56012099006|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261009223027099003|261102123227099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	V73UNXaIqtJqNEtykHucqPiDZxf2lXlzafg3+wKvtkdcFzMZg6OjiWzrb45/dTRFPyjlvFWzmZmazv4mZF6fZdg8SZSUxoDNGzk9A7raLoOCaMjNvtvH0dMVvVqwFzx6odjEdedHg58uXaP/dcW0bFJHN22sKNlqhdd4Fgqy+VpU1Tr9u1MMBnYbGU+89IE5H3gC21Li0gkiYj9ErjaPEepqMITM96TcQI958gNq+TbAC37kUeVfUSJMLy3Sar9avOmuL3/3k3ma6y0HbphcieO/z/jjiporGogS45cLNmOogX77+yNwlaJ2XWm8LFqNzWGKSE1pouIQKAiyoKTcb6MQ/tYKbt3GKpgHgUD8BxKaXTZYG+S7PUQgfO+ABIdIcHBC767Z7AxVMOVpr8fdhC2rAW/Ko1+RxiGPxdofYCki37yUt5kZGjtN42gvsapjEgw85hkM9tV659F3KOb4qGy+uaibBQkEoJAxMJGRg6Lfe2hmo7OvHnolZevkbPborYy5NUlBuXPnmQ//ctohK8aFQrZqOLjcUasDxzriUwARfT+JQpyKZrWHo/rS39n5XdrPzMEpqDdsrXweCVkcNAjKJO/l2Tc5FE1s0qOm8pFY46oD3LoGqyCxun4AuMBul2vXFVRflyIGoicYSRu1Uke5dv/FpvEzbqs3FYguPx0=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(261026121527099003)(56012099006)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261009223027099003)(261102123227099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U+fEc6VI2gV+hMjxd3gvlKiJ3iwxxmwK9RdX+FB148j/B9jI4cNCyzVn5ngvIYNcsg9tKO+XQyugIRIe9yckQCgrHivM8UHuyGkcrae3hxRXSwGUzHyEkSYpCgWAllja/ej9tfNXhGvAWpVMvCAfHFnOPyux5IsW2JVinZ32Lqp4URWC4KW6zTZk8qcF6p63dFpTJM0GDagywBn0Me5iChgSc8KQFNVlBM2JssRcqse/CQDDLEQR/C2f0hN7Y+LC9KcOGH3NJvTlaKj6Rg2GD5zA5YJ0PiKWZgpV8EaV5dAuUtbKqPKiLr52hxmlqRbPY2tWFYadwGmCxtGRx/AY9dS44u4ebqpGR+wIsEygXEJb25KmimNZhC0MsTohus3Y26s3rPyABVfck5R2wpB9uRwVHGiQmLBQ5W6weRuCtCjLDmWNAG8o/a47oG9ebjah
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 13:06:44.7147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e730aa33-f230-4cda-aaa6-08df4707209f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000848E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6446

On 11/19/26 18:55, Patrick Delaunay wrote:
> Define a PSCI CPU suspend state and reference it from both STM32MP25
> CPU power domains.
> 
> In OSI mode, PSCI power domains are initialized as off. The idle-state
> allows the CPU power-domain governor to manage them, avoiding probe
> stalls for devices that depend on the cluster power domain, including
> SDMMC1.
> 
> Fixes: 9c8d852dabbd ("arm64: dts: st: add power domain on stm32mp25")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Tested on the stm32mp257f-ev1. The following logs
	root '/dev/disk/by-partuuid/e91c4e10-16e6-4c0e-bd0e-77becf4a3582' 
doesn't exist or does not contain a /dev.
	[   11.829563] platform 40130000.i2c: deferred probe pending: (reason 
unknown)
	[   11.830952] genpd_provider power-domain-cluster: sync_state() 
pending due to 40500000.ommanager
no longer appear.

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Tested-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

> ---
> Hi,
> 
> On kernel v7.4-rc1 and with TF-A BL31 compiled with the PSCI OSI support
> the boot of STM32MP25 boards failed because
> 1/ the domain are OFF by default since commit 6d3080bfe007 ("cpuidle:
>     psci: Initialize the PM domains in powered off state for OSI")
> 2/ the SDMMC1 uses the PSCI domain cluster since commit 4f454e51290d0
>     ("arm64: dts: st: add power-domains to sdmmc1 on stm32mp251").
> 
> In the trace we have:
> 
> [    0.000000] psci: probing for conduit method from DT.
> [    0.000000] psci: PSCIv1.1 detected in firmware.
> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> [    0.000000] psci: Trusted OS migration not required
> [    0.000000] psci: SMC Calling Convention v1.5
> [    0.000000] psci: OSI mode supported.
> [    0.000000] Zone ranges:
> .....
> [    0.242188] CPUidle PSCI: Initialized CPU PM domain topology using OSI mode
> .....
> [    1.604962] PM: genpd: Disabling unused power domains
> ...
> [   11.833535] platform 40130000.i2c: deferred probe pending: (reason unknown)
> [   11.834888] amba 48220000.mmc: deferred probe pending: (reason unknown)
> [   11.841607] genpd_provider power-domain-cluster: sync_state() pending due to 40500000.ommanager
> 
> When I remove the power-domain in SDMMC node, I can check the
> genpd state and all the PSCI are OFF:
> 
> # cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> domain                          status          children        performance
>     /device                         runtime status                  managed by
> ------------------------------------------------------------------------------
> power-domain-cpu1               off-0                           0
> power-domain-retention          off-0                           0
>                                                 power-domain-cluster
> power-domain-cluster            off-0                           0
>                                                 power-domain-cpu0, power-domain-cpu1
> power-domain-cpu0               off-0                           0
> 
> 
> I can confirm that without the PSCI power domain commit 6d3080bfe007
> ("cpuidle: psci: Initialize the PM domains in powered off state for
> OSI"), I come back to previous behavior:
> 
> cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> domain                          status          children        performance
>      /device                         runtime status                  managed by
> ------------------------------------------------------------------------------
> power-domain-cpu1               off-0                           0
> power-domain-retention          on                              0
>                                                  power-domain-cluster
> power-domain-cluster            on                              0
>                                                  power-domain-cpu0, power-domain-cpu1
>      40130000.i2c                    suspended                   0           SW
>      48030000.dcmipp                 suspended                   0           SW
> power-domain-cpu0               off-0
> 
> The proposed patch is the simplest solution to allow boot of STM32MP25
> with kernel v7.4-rc1 and before upstream of D1 power-domain and full
> PSCI OSI support.
> 
> V2 of patch [1]
> 
> [1] [PATCH] arm64: dts: st: add PSCI idle state to STM32MP25 CPU domains
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20261104102837.1.Ia5e0774883d237f5825b7090962b454294922558@changeid/
> https://lore.kernel.org/all/20261104102837.1.Ia5e0774883d237f5825b7090962b454294922558@changeid/
> 
> Regards
> 
> Patrick
> 
> Changes in v2:
> - Add "Fixes", requested by Amelie Delaunay
> 
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 14 ++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp253.dtsi |  1 +
>   2 files changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index dac3d2d23ff0..bf1542818be2 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -25,6 +25,19 @@ cpu0: cpu@0 {
>   			power-domains = <&CPU_PD0>;
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
> @@ -145,6 +158,7 @@ psci {
>   
>   		CPU_PD0: power-domain-cpu0 {
>   			#power-domain-cells = <0>;
> +			domain-idle-states = <&cpu_sleep>;
>   			power-domains = <&CLUSTER_PD>;
>   		};
>   
> diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
> index 7e82f01fdc10..19b3e55a4414 100644
> --- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
> @@ -26,6 +26,7 @@ arm-pmu {
>   	psci {
>   		CPU_PD1: power-domain-cpu1 {
>   			#power-domain-cells = <0>;
> +			domain-idle-states = <&cpu_sleep>;
>   			power-domains = <&CLUSTER_PD>;
>   		};
>   	};
> ---
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
> branch: master
> 

