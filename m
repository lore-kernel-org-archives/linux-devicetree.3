Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011019.outbound.protection.outlook.com [52.101.57.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A86239935D;
	Fri,  8 May 2026 23:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778281429; cv=fail; b=i2oeH38Qb37w3gMuNoH94nYP9WOMnfmti9hZ86sCrOWTD+bHKLo5CiGxB5DNmDD9ym62a+kS6wqH14S4vHYqI2QOpN3fZsZKQWJ6jRiTS36GvGt7OcWo7nyw2vyqFElmDoy9YyDsoEQvrTar0bdoffBsIVTsJrmBbP2XCRsPSts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778281429; c=relaxed/simple;
	bh=VQumawgN4pELrT4wWP1eCAyQ7dvxT8ffxejKePg4kh0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kq7kqlKmz9T0EMRZD5GEmH+NwSXTNsqHwaf6lPqgNCj3FdD1KYD5Bq3wDsJg5rB5Urzowq0VfCzJgNhP1YVbEUd7pBhN7fTFzakfey5YFNDNVAvlub2m0nMRzz7lp1Y28eYZ+flucOtZ+My1+kfGb0kXS0IovCziqF//Kh4HKos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fnHmsVUb; arc=fail smtp.client-ip=52.101.57.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fnHmsVUb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4lUTfM+NKc54g/cwKGlVlRxErCXxINMGKkQmxj5jDVmg8CBSv5a+02d6C23tM8gOtiIRk3zzW4aD6AaMEED9Kyd6u4H40IijlCgmrSu3IqPuckveneKuv0RFiwyAJgX8GS1Rhr57vjg9tJ7O0XlOLWQUh0dbc5aR8Ewbbyu76VjA6LcORNnqIE4G2FvL8XHemfwwv4iP6G0wyrsZhQQhaDzuzsVyuo/bmK90G67ZKLZLdRSJhkb22b4qCNY0hW6Zh4q8UG/vnDub/Occc/vl0xCMEEuugvfSVLTdj8NdaH4p407pxQOJWnsuBgMgAGIGfgCauD/wnaZpDOyvVxVtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmG/8FmSegbdpZhEkgsvfQDcIJGsf/dQJcdoX2Y7VJ0=;
 b=fzcoW+bblNgPd3jVJM3XYOTQ+o9NbfM9xalufiHXN0g7bTmPP67UGYyJ9gYf1VgLqx5dMyWMUygarQ+pJ709rDqMSKsteHACJb8w/qRLKUcwJQ1kscGYviVEIn2xDdWN2XnXU5xGS2ueYF5o2DWIc8dmt3nuRplH5LtahnKbUr4g63yQGw3t/9PalJ4RDZkZZQ6Fl/JOkt+S91LpepUf0czgWDakbgiIYEMrBruYDjr09wyz3vEJ5V/zRZrzII/JxH/QQbo4A9MSIaIWV7BkBuwBJBg3jjP+0pAOYa+1QVBESHNxHb4iEtNozfw69aR97auO/JvhyhU+GANL928ZKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmG/8FmSegbdpZhEkgsvfQDcIJGsf/dQJcdoX2Y7VJ0=;
 b=fnHmsVUbq9808sg6TO0EyWZiq+6iX78vkTa9QWn115+ZeNxcGrdQZ7c0Sve2ok64KYlymtDOkAvB+/BmEdwjv4o9h8/RpTYc7x8evGPbvEjb61sVD5qZqbOOeAfEfJ3aJkTasPJjOKbrX+TmlWZFuqOG+euuo1+D/7jR92Z/A6s=
Received: from BL1P223CA0033.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::8)
 by SJ0PR10MB4431.namprd10.prod.outlook.com (2603:10b6:a03:2dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 23:03:45 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:5b6:cafe::48) by BL1P223CA0033.outlook.office365.com
 (2603:10b6:208:5b6::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Fri,
 8 May 2026 23:03:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 23:03:43 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 18:03:42 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 18:03:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 18:03:42 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648N3fnn2869024;
	Fri, 8 May 2026 18:03:41 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: ti: Add am62l3-beaglebadge
Date: Fri, 8 May 2026 18:03:39 -0500
Message-ID: <20260508230341.1891450-2-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508230341.1891450-1-jm@ti.com>
References: <20260508230341.1891450-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|SJ0PR10MB4431:EE_
X-MS-Office365-Filtering-Correlation-Id: 752577f1-c345-4dd5-a4a2-08dead560d5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BY27PheaUX7/yT7rm5WdhMtoSKxKqTGKXIVhXkNgMlOddkEkrZt1XzLteHA3neEY7g+1pkAvlSzn+myKxgLLCg0zNyIAAzZ3hQetwVxz04itpcXLO/yrPa+GzYtmSg2wpEKDLR8g8BLPhgQEIHVIZCRE1pXu2GYKvVwJGaiHRNVBijUa0BCzIdK+AMJbfDxPINRN9y6HjQ46xTZKpYDezEsYXTCJQw8lSJ22HJUjMhwCLCbFiqpWien4FXqsuKwjAIk+nCGslK4AL3T9nSrV3rVvGhF3czpR4FJgLYi9X5XLDep3wcv6q/X8ZIJCNYfY6XbI+D2Z3zSzmTIjbpjgMKvnEdmbPOHpdrfpHYTePTEJ6dCmAbkVagdQxUML3X7//wMIHZq9PnQflXGiGp8d2R/wJ0dtykwIJJlNlPGtEP39RTamjIAJAmOVY8qjmtI6/nNdtixWdFqBIv2+FEILMrLdM7bDZotajIGd00EGYVyUjVDUPEIbB2NrduqwxK66OlGMeJ33aLfmFsrGF0RkgB8TIKnptkdTrl0XkFpZJvgOYg74w/nvxLOgzutZB2pOLt4dJaoL5fw+Zb2rhoK4tkgp3hmKbBhGcnF7Vi4hGGxHVddvWbh9uvWDRsmFszilh2WUHuiRsd7R6O63bb1DhnlAIEWbFv1VLSRsHFRH8VY=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TGbQMCsyP1UpTGt4iH8NVTWOIOD3gkL8Yx05p2kOO0as0CvzotPulkbmgChWTjJQDwtsXVSNdcDwYdIx457ubd+g/yd+RRBr8pWMNu22AaHskMKuTSPPp/1/BY18CMk9McyN4PUC3mgM1YCtOCkU1c6nBDvMqptxY0a0ul9XnBJOW3r0SBD/axC2ht6o6XdYAYxs/Imq/ifMZeb2i40VZ5bRmAttnksat3lQPoRgkDBiV+aPj2WikflQJ4XXsTH3hy7QgDQi4jiRdDys2DEhnVToKWHe0+0lnyOWvc7z5yF/LoHR7yophRRdr/LOwd8mFUnlO+rv4qVXPTmy/pRIS6YQc1GbNRDDq+phM7w/qiGar/2mIMmqcsCBBci428Gy0b7DCXxyP2ZrZ3Me2xut3JOTi0P0JbKCV5rOejaUnUN7C6QMucjlo7TnxIxPgslF
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 23:03:43.4973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 752577f1-c345-4dd5-a4a2-08dead560d5c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4431

This board is based on ti,am62l3.

https://beagleboard.org
https://github.com/beagleboard/BeagleBadge
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changelog:
- Update compatible to: beagle,am62l3-beaglebadge
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 2a6a9441c23d..d9cd3fb712fd 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -40,6 +40,7 @@ properties:
       - description: K3 AM62L3 SoC and Boards
         items:
           - enum:
+              - beagle,am62l3-beaglebadge
               - ti,am62l3-evm
           - const: ti,am62l3
 
-- 
2.54.0

