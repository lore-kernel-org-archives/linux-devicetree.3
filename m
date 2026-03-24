Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010007.outbound.protection.outlook.com [52.101.46.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82F5344DA8;
	Tue, 24 Mar 2026 14:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360996; cv=fail; b=SDu7TBxWge13qFV8MuXt65P72qVNFh6xjEFZjRsyipTpGuGgXTAP2rC6mglmG7/9q4w7uxXTPKelkue7hlhnGZQRAhLL+Va5m5mCMHbk9PK1p7H9NoJja9Umnii31K7QkEwYMt53ULzGFBnY0tmfyg4WtVAJ5gB3DJhy34LcItc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360996; c=relaxed/simple;
	bh=YDjxB8aXDdbegAxmoQXejs4mpAcpMlzpapzW1lYDFP4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QosyBgxOY0RalSg+/MZZ7Ur930qsvwS3V+HyjSuAZ65HbT8ypNouv0gb08mWtFN1LdjnTR5eYIL95oLy15xen5bZ14ipvq1ni3H2d6JMzf6ls5sIPoJT+OEyLB3d3IJytmDnKrZlD9mZt/TUkgo08BAjwhP0EDY6I1w3L4Lssvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EE9Oj5cz; arc=fail smtp.client-ip=52.101.46.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EE9Oj5cz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQ/o3pCvoUxh6eCHAXBYeA5DFsBPNw9Vzr11nP5CWoZDBCIgXviaX5+IkUalrpih+Du89wmyrFpZmYioFhiJocrPn/zbzld7JzueC1vZYlM//gS4fjIRQa1i96/FRWYNdbC7uW/yLyZNhDDVW5sc7v+Ud7yazU59fA9YoyjoRYaGNjYRuB/Aq7yRSkPyMNR+0CEcHN8MiVQ9Ak+RNJ4G2mVEZsyp96epyTWNMx8/mqnN3XE4jmFleWmembVz8xNOsqTdKf0ZG/+Frn30T0BP1I6mOcvlI6gF7m7Hv/Dzim5NDBh6/pUYmw7TY/KWMV7QXSLPLBoVHbllF2L1M24itQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qp4F62IaPMuMShl/wj6oYqmOH3ELwW6K5k/+65E+pMM=;
 b=IjMPyvrRIh0HhyABHcsF6f8O/4iIu58diEHXQdOvvDcqJEXELZYePsdueD+thqoZnm2WhZzKTlbkLOoDxTlJYdtDtqmfZokn0LroaOWw7F/Bgw8rt81XODa9dsRSfgBpbZ9KLJyxzezDdb+3VdlY89b9FHSRIW05PKxzv/2D9INUsvaTc1DFV0W1Yrkt9Kx+Lkc3s39naky48IgTpYA8mIUepuz7b/7Q5jdmlTutcrLTuAwBIvqgvbWAWcj531TPKCy2lZ1yZWbLhOfk5nF6YhE/2ejWQFffMh54tNdwPvY2Wg2J6Aml3WkBL5Pek2JMYXPfAQ17gl9vsC71GZg0kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qp4F62IaPMuMShl/wj6oYqmOH3ELwW6K5k/+65E+pMM=;
 b=EE9Oj5cz87f2hNr4GEn8WKJAy5yKXbAuEbOAAWg3BHkvT6U0vXSomEWEeEAu/utCSuEyxAlUFC9mlWD3QXPCEZbeUvuij/vFgT6syDnrRDJ9h4PsA0jtnOzFXsFJfjY7+hiUaz9MEEuCJHHAlykoHZgLxM0PPq5aw6qRkKqwGzE=
Received: from PH3PEPF000040A6.namprd05.prod.outlook.com (2603:10b6:518:1::55)
 by BY5PR10MB4242.namprd10.prod.outlook.com (2603:10b6:a03:20d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 14:03:12 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2a01:111:f403:f90f::2) by PH3PEPF000040A6.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Tue,
 24 Mar 2026 14:03:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 14:03:10 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 09:02:47 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 09:02:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 09:02:47 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62OE2l2G2269372;
	Tue, 24 Mar 2026 09:02:47 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-am62a7-sk: Add bootph-all tag to vqmmc
Date: Tue, 24 Mar 2026 09:02:47 -0500
Message-ID: <20260324140247.1200631-1-jm@ti.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|BY5PR10MB4242:EE_
X-MS-Office365-Filtering-Correlation-Id: 55ddc0cc-0234-4fb2-892a-08de89ae1551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	r3+gAO5tN4uB9EeLF79teWWLv2nUlhQdnjFNOE5YCB05gTbfzCygUkW9/4YwXRl0SNee+NbT0jnVFF5cfeseKn+LUQ0F42UPmMKIPOn9y/SJ+CnnHqYZBl79xkP0b28XgA5x1+qLVf/AMcv5+x9jo44FauuLAj5YFtOrPEj2OFShQdwTmX3j3PSFeJG9iU2eDyE24w8ooNjhIzTglQZVO0voMYhhg4h2b/S8XCmSjUImbliop/U6q1CBWN4YATOMb0wPgYaCPdZtyjMPX3ANZq4Shrpxp0sRjtihOuy+UPRjCloXDgBC0l8UpOwU5hx+8wUdDQic1VQyIIabxQ0M8zPI1+J92z0FMv2uev/ZwILF+DOsVSwJ6m1pKnuvArV+Ai1b/nbUNyPP3+vZxOfT81hdjds21yM25eya7qR1Na3nyGHgKQXsVd63wW/wFCTwIa3O7+3F9sC49hnNX7GJPDw1KJQ1C9aH7YrkQAyUUnn0uNsr02zgpfTI2W3otJInPNTwtSd0DvC+CRBa4Uf5DEga3VVUtBedzMZ+JNNUwZCkXsHwgDlyXAN1aq5LBGTQ2/POcAyilizaex0BPtpE2WcS0PcGWwAylr1bVtHhV0MXqbS4DxXxJmo6ULAuSA6wYcP/By6bz5fx4B0/TGw4PaIrNOBaQMkpnIUr9un4sKm8ca3bZRy6AKlIEvJLfS38Pc1aiKFKv6gBOX+9wa2wN5TIlH7YDFMwStYkYYa0L3Z5AOKjDNinsI0MOnE8Q8hGaoBUxmqrrXwUT2CII3bDpg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rYzz2xtrHraUZWRf8kizwRDwvapbL1Exo+PtlkKgzr7z5WzHsko/suSTRHmVD+QfoEsxrsrcUzbVWR1C/WscjmJLSL8HwTabB4ztGOkzlwIXTL987HSqgXBbeOnk01xp7slqikvsaf360WKu13OxWbmWeRg7BrsK7+HK7IPOnihHDIgpL676CygDMdk/D+Tyjd9qmHVx9+6m5DX61iUgZEbDjoDBtMI06qDfKqK/F4xi4oYZ/0Nv3jiqAIT9zbzFEPaPlWbQ62MNuGF0LMFEInlMrZXuHA3ZPnHVw96kEVfS14Q0a0xS5dnAVhLTN6kGGJTW8JY/M4zfeqa9+8O1e0F0n5UKjkti+YasJ0tv8Pk5RKxcRN9bFxO9MxsW+P2nOAuW76T6HEvGkePrNbIacp6pFS9sxuILHMgdhI2dIP1BfgIrcteCFHLhrpF9F7iI
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:03:10.7497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ddc0cc-0234-4fb2-892a-08de89ae1551
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242

Add bootph-all property to vqmmc voltage regulator node and its
corresponding pinmux node to make it available during all boot
phases. This allows to run tuning early in SPL stages of boot.

Fixes: 8f023012eb4a ("arm64: dts: ti: k3-am62a: Enable UHS mode support for SD cards")
Cc: stable@vger.kernel.org
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index b1a6f10adf26..a085613cf123 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -154,6 +154,7 @@ vddshv_sdio: regulator-5 {
 		gpios = <&main_gpio0 31 GPIO_ACTIVE_HIGH>;
 		states = <1800000 0x0>,
 			 <3300000 0x1>;
+		bootph-all;
 	};
 
 	leds {
@@ -400,6 +401,7 @@ vddshv_sdio_pins_default: vddshv-sdio-default-pins {
 		pinctrl-single,pins = <
 			AM62AX_IOPAD(0x07c, PIN_OUTPUT, 7) /* (N22) GPMC0_CLK.GPIO0_31 */
 		>;
+		bootph-all;
 	};
 
 	main_ecap0_pins_default: main-ecap0-default-pins {
-- 
2.53.0

