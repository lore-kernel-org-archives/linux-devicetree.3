Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538904;
	b=CizwP0hW6+rKDl5B3zZcvUkDPNrJRZK8g5++v9lm9ZUqOX4oa8LOjsiMEPWoGsfPt/qS
	 Ai5osFmdCHlZvrIUrZhicf6O0ba3yBKvq52zFR4wNNiOK4EDl/EIwr0YSH0cawO1cwd2Q
	 AAO2SjFkct3W9VXTpqBF61FVs7kMqtu/DXJK91fqbHJbbv/Bm5EV88ppiEBcwzrFYUXFs
	 ouAOZ5k1zxXr4HlEBdmrQHLGFzgRdL4uJyzdAeXWtitiHXg2d8xqBtaaBK0+ZVAgUMT5i
	 WqvaF5+hW1kCHNT/+Yq2PbQ/jp0ZHRHN+BmtjyawR87KWrYEGYC5Z24xG7wnV9oyrXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538904;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=C5VXzf4Wa1lhX2ksPd9/hpcbYb6TN8p+z49lAEiFxys=;
	b=ZZgiI3/XH2CtxA+LJQfH+2JXxC+/lpSDvzt63OyY3cxU6qyIRrle7i+Me6E2Ns/n8A6q
	 /eL6ngr6WKNnXIMsEnEI6CDHQZ0aysPHsapHhaavIbgj80ultkmRSmjgAfZuW3WtvMXFJ
	 QQ6SvdZZ0T36lm+dtnjWYX2sEmVXyeOdE9pObhLrTz0b/7x/tGAeM2+txC5kcw3FZl818
	 ytqDxLt5oOwu+oZgRf8BRujgdBmX3WsDoj6L9t8GuY9yoYx/X8feGpSxRTAge7eSVAlzf
	 FvZy7AJ1ti3e7nCRdOQoqO0AW361nUZPZCqBVi1OB7BJM4A6YPmqc7ZdNtaYjmsMYQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=SDuX1jxa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.21
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012021.outbound.protection.outlook.com [52.101.66.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A14606A691;
	Tue, 24 Nov 2026 16:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78A14606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=SDuX1jxa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubsepBzDP2YIuhM4y8eucSmXI7KrW5K9ShLwQHyaO2VjAF3+p2rmKFYW7dLHgtDrA3kq3+8sI+4gLC5Lrtnr1BNBNFnaaHAw9gDHQVNebEuKHWSBCUcunPcmNbNAHuwf/BBrYZeou2byXUMbIY7weiTFDGSUhCMeZ8UnArPoh035+qhebIMjz7he7FRTRv7+tJR3WQGy6kbTIuWskT1pivinVu1bxzi+/7O9iWeJ+2OpxXWASySwzY5xJDLnnznohVh9p5EtIiB7ry6oP2iYten+q3575p94hekIp5hvj6luL9aqB/jHbNMUiBTcd6NcaxxBM5fpw0yWG9I5MB83Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5VXzf4Wa1lhX2ksPd9/hpcbYb6TN8p+z49lAEiFxys=;
 b=Qi6QHVapXfizyrSjYN1Bbu/aF69bQf2TKMWOHrdyneME+u/FSSWHyLlBxifVC+nwvMlQN9MVAU4EBE+zQVL0ZpPBpyadi7TQtSTVMHgiMAwTXYO6QeF6uyOXHaRsLO4adBoyCOoZM5Tjp/jl8Ancqul+jKkmaqm+/4mFotG+HuR7fAqi0YtxyU2lHQqqJBN0S5zw65WUlydMXwYkZQxIkUOeEmZmKx5NtRab1Z/BF9flpynRlmkjUxbYCNzvpGWb4EJ3dl30/eIZvLJVHXidiNLtidqwTefRldDjzaFDDpSKBgmxOTUE60BXM9Dq9n3uA3lXyBt1FZ6C0kF4kFoA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5VXzf4Wa1lhX2ksPd9/hpcbYb6TN8p+z49lAEiFxys=;
 b=SDuX1jxa2BxFU7YRWjCDIhvcr0UvMmg0F6iimhgsuQZWIFCdVhH3P/pGW1A+12JksR59EOlwwdhzR2KKaUl93HsrhetsyxhfkRctfoQCGRG0uygNWBvsJRRS7/e3SsdrdT81pDHzn27lxjQJQFa9+JRi8yTQzN2tOrrYexb2J/TojHdaUvK8yMpP+qAxJjXEsj/gN/9KBnZazKZvfo81NBCEEw3MS4s80u2mrnmscrO+qM2nTtYb5wJcpUopu8mIZARpK9dI4FPtfd2DOKmJbtGrKogLxNGFkFsNY3xN9lNZ81etLhpWkbn8pgD2cVfCfpag1eogL71ls1h40P28Zg==
Received: from DU2P250CA0020.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::25)
 by GV1PR10MB8369.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1c9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 16:48:18 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::26) by DU2P250CA0020.outlook.office365.com
 (2603:10a6:10:231::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 16:48:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 16:48:18 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:48:44 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:47:45 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 24 Nov 2026 17:47:42 +0100
Subject: [PATCH v6 09/10] ARM: multi_v7_defconfig: Enable NVMEM_STM32_TAMP
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261124-upstream_nvram_reworked-v6-9-ea0cfccc20b0@foss.st.com>
References: <20261124-upstream_nvram_reworked-v6-0-ea0cfccc20b0@foss.st.com>
In-Reply-To: <20261124-upstream_nvram_reworked-v6-0-ea0cfccc20b0@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>, Russell King <linux@armlinux.org.uk>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|GV1PR10MB8369:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a86d388-bf57-45db-ca52-08df4a4abe21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|23010399003|7416014|36860700016|22082099003|18002099003|261009223027099003|11063799006|56012099006|10067099003|261102123227099003|261022075727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	EXu+dJXvXd6jObsZa+eg5whq0Cm/84K7pHCHoeu5dZCSM5MPvVLRk9iU0VaiJViNlXwrd3zEJFnOTT2JTU8GnEqiWc8RMwmfdenaulY80dlkL1gEnW1v2LtO+T8FdaZJNEc8OQciOYr5TKqNvKGF5AAjCQKa7D4jAIjUHY0QO/19TWGrPYoiIPmgIHWZhskx7H0F4QYbODtGMjBCWg+uKO4HEJoZ2ehQNTnNTRcRX2ZyoPAKtBy7Dst8z/LQ8x9tE670TZYhjsYqs22RAdKoyK36FlyPW0LVXBukMdvsds51fE3kNHAhPS7vlbXrb3nJFTsnWrRu7O1tqXyIat4yL4nAf5VQaIjKsAarnLP/SxjcPSYoCHVFR9g5o9kjtAo8HtW4akq3UA9m5jLAgLXGud9Qs66MZY39/M8YiykpCCTETiGkc1yizy52HXMM98ujLD0WcygORbPur7Cws+yCPTzQNFUWfgWsYVJ4PbOSTApYHtUl5K+EEv5vjO7aLAXrzE0kuROsj5ohemyX1HS+03YRi8ry0Vxcs3vTbw8XFG9DyECkjjNc3QOHsL/vr+V/E7S7D5lKaeBhDBgNgZ+m+nQO+Jl94nXEP2ZRY3n6P7/yzH84OTuzTpy0p4Bx/sT63XCGIGpGjUP+GCUs3bircoRccuytxV9C5O5vfPf43xaiTBjiiHbPn2GNrau8IjiTLIeWmLaEk/XyZhywNWFF8Q==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(7416014)(36860700016)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261022075727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qgPmUok/VpgsziyVNbKFNH9ZbBDJJwH1WPno2RR2vdALXQlBnVZ58QOLcP5eVc3X/DBPPb/kQuqZI5e6tOcIt4K/G8mmszbAbzAkjXb+xm/aiiqkyn1ND2/TOtcrJplmnOBvC/+H3sudSib3W8uf6m8ya06b3+Oa0Ml8L5wIFpSyqz1nkxW3Jsu3qsYEAp65s4wIr0P2VyNCGx0zdu60iPUTuEOeIchFm8zTtOuNBjproV6XvzcpTSYFVoCKzyVDeClBu2Lb8Pju/cK+Zd33+/Kc3g9yOuNg9RJ8VAKbJ0bIbDRa8fj/NlxGE2OKruizu2boOZlJiCflj/Z88Aj1+CBp3TEGIE95CswFQpISS3jS6ypeFzWq54VjOhVxjwwxvcEpiMS0SNs46bnjv6wy5rJsVMgEYKwGTdkZ3RNdnW63fTiZ7urDHY7N5nc49hWE
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:48:18.6711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a86d388-bf57-45db-ca52-08df4a4abe21
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8369

Enable stm32-tamp-nvram driver as module in multi_v7_defconfig.
This driver is needed on STM32MP1 platforms to get access
to TAMP backup registers.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 069d5a49f01c..5dce10ccbfc0 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1260,6 +1260,7 @@ CONFIG_NVMEM_QCOM_QFPROM=y
 CONFIG_NVMEM_RMEM=m
 CONFIG_NVMEM_ROCKCHIP_EFUSE=m
 CONFIG_NVMEM_STM32_ROMEM=m
+CONFIG_NVMEM_STM32_TAMP=m
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_NVMEM_VF610_OCOTP=y
 CONFIG_FSI=m

-- 
2.43.0

