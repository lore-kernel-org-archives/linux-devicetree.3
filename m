Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010007.outbound.protection.outlook.com [40.93.198.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951703BED78;
	Tue, 26 May 2026 18:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779819103; cv=fail; b=tRnj6LBOqit9K7rppR+B8pnvcGEDPjeuqBop3wxhB9GjDo0r2fqNfJq1xCqvAnf+hkyFgdoL/eSTLTlgvMroHq1IZvm8I45MqHu406dyr2EH7dUSFRWSlSiwtiwUg+W0Rdjv6md6ATBnR7/MwkDi5h4DUenl7OAOXG/LWkpwGjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779819103; c=relaxed/simple;
	bh=620kcfb9wdYDdUfjxJtSrsBXeckuuZntXPa/6oMAP1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=E7loygHIIRNH3AAVAKJV6/fZDPU9f2jHk8V4dHAOtTY/Z4HkHJ1AuCD1ODOrN/1axYeyHT6vm59Wv+8pjAp59LiKMOGHfNpVQA6L8fgGNQpuOxWyjezlvMh/f1KhFi4ZGSOUArRodBzROdocTTGBB8COT2veEafKvbAmMpcUAHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FNjeRbAu; arc=fail smtp.client-ip=40.93.198.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FNjeRbAu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPQIyk4JHAFH03GtD3OcjkZP7E6qlIxCGJpa5aqylIU9SJvzLE7dqFVWt9LDtEp2f/nxgzquvfb4Ed9h82k/YJsb1RxGfIdvAbUOu8M7oZT+pzWinH1Zl2HCE/zG3yh2+B1QDUfPZOXcl13967SxLXUuXh6cHaGARZMDlpNqCV6SQpiw9hJWEiDS+l+4YEbfpLZea5Gn50svanUQ1SqOHNegOdCLRupikgW5KnGwB5I8SL2dItdb45Mp8yNkGCCJv4tk+yLphdnvP2JySPnrhqgePzR2R7Fr9CuvZXpzunPrjamwsU22ELyHENOzKHEw/ULeQn+Nt5TioUBOeGMY5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpHjfUClxTOU+jhlYhm2QHp0fFzHm2uB9UfwwGXVR4E=;
 b=Si9LmGJz3JBWF1UHTbs30Fsood/1k5ssC2jci1VbycpxpXSJf5oi+1QUjW5ZfAMvLZe1QIQ+3FtS107kRHOHhoAoZ5xnqIM1BkaA26+fgnvFpwgokaENz1Nx5F9yKe4D9UoXNWIRJ+IjQLerPSxJXcFNw0x54pSC1F2cO1MQy+X6lIZcwsDBEF/L9WifMzPG5VuJCK23xcXA1ueQ+RCWreWDGBXH9bHbQYghaa3xVsDNwDEBd2jmcpBEw+3bZkqTvJ7kPb8Ag+pZnGOrTHmSNCyWuAN6I+CgzMP1CEVgLR7k8Cw6cItNzQBrke+kVdvTHAw1d87q6nhvxnfgCZ4pwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpHjfUClxTOU+jhlYhm2QHp0fFzHm2uB9UfwwGXVR4E=;
 b=FNjeRbAuOVamwWadRmH6iepp96E4rLgM7dD/O1WIeZTiDWZItrWCoxG1c8MgdJz2dvg1DnwaHQ/HnafpOEQKkjpARteKdW/mNV8rrxKcyxhZlCo7CmH0V+vkpPHIz+eOBl4Qu5y4h2diLy6825M0LRlZrMib22U39GRjGbNWTho=
Received: from BL1PR13CA0390.namprd13.prod.outlook.com (2603:10b6:208:2c0::35)
 by BY5PR10MB4130.namprd10.prod.outlook.com (2603:10b6:a03:201::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Tue, 26 May
 2026 18:11:38 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::21) by BL1PR13CA0390.outlook.office365.com
 (2603:10b6:208:2c0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Tue, 26
 May 2026 18:11:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 18:11:36 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 13:11:34 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 13:11:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 26 May 2026 13:11:33 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64QIBX7G1431730;
	Tue, 26 May 2026 13:11:33 -0500
Message-ID: <40571850-1292-462f-9bd3-527a810a6730@ti.com>
Date: Tue, 26 May 2026 13:11:33 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] arm64: dts/bindings: Add support for BeagleBadge
To: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>, Bryan Brattlof <bb@ti.com>, Jason Kridner <jkridner@gmail.com>,
	Robert Nelson <robertcnelson@gmail.com>
References: <20260515153541.294698-1-jm@ti.com>
 <20260518124932.plrgsumqgvbij65j@stash>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20260518124932.plrgsumqgvbij65j@stash>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|BY5PR10MB4130:EE_
X-MS-Office365-Filtering-Correlation-Id: e318cb3b-dc6f-4a90-11d8-08debb5239f3
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|18002099003|56012099006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	UvoSNFX/BeDjS+4C5yAZq0BNDtAs5T1fznBqvTA0MO6eKSrI8bG057vk5HlRo9MUuyr+1j4mjOYfS0kTATDVw9F9ePzoul8XkectQu0/lxjuT/lAYLOyVrSmbjKvUbwN+xeFPwP/5VVqNW9/6oyj1WmFdsn3PsmMKoOFka7tn4Wohj1nny+LrsyEFoVdamf+NhiJSY28HzU0ZqiFQAwrFrSn78FhA0Tm3oSaQJGxnqf7wbp1ITP6wo3HLuyscpuGtHlH4pw3dzrBKqpJwVvhrFuwuLBMz8uNDQKTZUVZ5YoOlhc0+IJqLdDjia/66rtSE8zkoqfTzPMpXhgpxDkpQ7XsfVGmAS13bLoRf/MVyEk+0XyQ4/vNRG9oXH4J+048GDxxuB5XLSYKO7yrbk0QkyaXACnnFOd3erG/d/n2CKI7py/2PQ6YaIP2d9g2Qub3pwAxzCeQnfvpvclvzaG/Q3a6/Fh2w+oCR/ddOfFCZNteorie++vFYDl8GxJsJk7uRr4979ROcOoTEFpsIFxwTxpFkzt6jFYFK9E3ilza60OBrqd4ZoxRXRnEMx7hdcwa9kstDkrx6vByAwpsAjZ+ityrUOAsX/BwI5vo3X3BeEFW+ZyN+ltpPXXdc/M0JDScaMDl4/DuJ7m7jjmYPazc/PZQHvrpxQYtCM3iUglyFPd90JQQSlmPN1vlInjUEFR3
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3+OzmOg6hOYpOT29nKNrVbJ7R7O7qip2dvA31pUjWpZ8N1tWCaZEkPS6eoAN0yI+Sdai8oojr/R6VhFgoVvt4lKCUT7k8YdMpdZ1GchWXNy0qly2egJq9Ko15hdpctIbgjfHWIcKhupYpGFpTHsTabZMg/allG6oJNBQZux5A6yzBvf8s5uHtfMaaHjMwCJCQGAeNNOYEkRmTECzSYAGoZ5up/1j2RjhBbHzUxlxVuMRVgGJlIxxlEfXHgfb+0eD0mrMctPT3Oc5ii8vfTYC8PnwzEcZn9eocK3vhjDBlnRA/2p4C+zQwq6MJQDZIfAbjOXS8q8RgsT/iig1DCLxPEdqjPclqSgJFi07dx/D9c2ZSAT1hC4D/CokSaRVLgS4MpEZI4H6vAYqf/6sb52yiwMKN4l8+ujIgt/+naVFQTub+feafJAHbkkFM2J1W954
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 18:11:36.5935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e318cb3b-dc6f-4a90-11d8-08debb5239f3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4130

Hi Nishanth,

On 5/18/26 7:49 AM, Nishanth Menon wrote:
> On 10:35-20260515, Judith Mendez wrote:
>> Hi,
>>
>> BeagleBoard.org BeagleBadge[1] is a compact, affordable open source
>> hardware [2] single board computer based on the Texas Instruments AM62L3
>> SoC designed for IoT and embedded applications. Add base support for
>> the same.
>>
>> SD boot:
>> Link: https://gist.github.com/jmenti/8818fa277597de927dd2b42ab1d2552f
> 
> in all patches,
> Is https://www.beagleboard.org/boards/beaglebadge a better canonical
> link?

I can switch links, it seems to be working now.

...
