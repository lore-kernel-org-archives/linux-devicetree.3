Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012003.outbound.protection.outlook.com [52.101.53.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EF13CDBAB;
	Wed, 13 May 2026 23:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778715298; cv=fail; b=F+3QKyNMuJj0tDAAsICmwleQUeQ1yILsrDN/b49qJkiK2A0w1QpyUzwZDfP0QXU+WcuMOmDNTutG7mxvLZuhODdIJi9MwKcxlKRh7C8VMzsrNDh5yrhbLPs94NdFhPBT6ycN3Lrkw9bLr87qJ3zCR9lJrjE3dDVCYt1OKbDyC+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778715298; c=relaxed/simple;
	bh=RzFtMFfHHremmqgwvZJtLs9/wEDfALXM438/Epx62Oc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uxJc1pSHzLBN1uDjUOH1TIE5jXWQQPpm8a3nDZbsoZZyhQtSptRGKxbzp8y8TPnLorelF8FEY4EyEdqvg1ilhNxmnJoL6bJZsMpZMlmUxYbNsleJIMA9xD3f74p8wjHQAxFga1CYOiiIHr8ltxbcRobZJbREk7PP67DfoWaIcwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UsXYg+om; arc=fail smtp.client-ip=52.101.53.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UsXYg+om"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAPsMVmBRaeoJx2xozZfo5hrZhbE450ROH3mhEXwPvWe9o23x7OLiVJ1SNcTdhCRG8fjnUhKIy/w2Epwd5shjEEZ1VFsx7zLXvM1BUV5PV+KFVUoDjVS6Wd9iRVFvoiqs64S7YpBztW8wTfS3hIAOaF/t8PmQuvmz94t6PaxIVBn7CVqgrOgPa/OByx+4w9/eCLMzlOBkELO1v1L53rscDOFLGk5JmQnzgo4f5Won+PRSQ37rri6yEUBu0igTfU00cgoIeNcVJyGfHuTExX6Rh8LT0zYkQU7IqRE73mUMStxjVIHezIgnyr45V3I8qhP/Wps75xlaWj1fObiQxcxww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIYzMd3/FU+p9LsoI3YtvX7YYOGhd11Gjr4AwPp6ujE=;
 b=qo91m2ypdjv2V3Uyr+uWoOsWfmHHx8STSp1JbpgojrOSbosITjX8VYZk1Q8J2tA8IUfMDG/XuevJbFo4GOSD+tIxvJ3WdU7HTseOJEx7xyspjRtXkVW/x45Ln5SBs66SEifEItr1XAl+QAdaWBeCEQhS7789dY5NfLFilQ+roYl6kNBR2QMtiZpTgH/zQguEEevs01e+zy7aeHku71SGlsibbjoIaboqD1btpRfMnFLEk5ZbdqGJY7vgOUoKzv4pMutdBSdaxfq4PLAYk9acXz7GY3imIl5cWOeeIssHbeFMtg9d+JKm1ovR+AOpN30HfjET/u/tuBSkKxQoeqnSDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIYzMd3/FU+p9LsoI3YtvX7YYOGhd11Gjr4AwPp6ujE=;
 b=UsXYg+omsVI8fM24b8ylpkrKz18TVykosmp8g6AhtOvaifbTnBTwhlpigBmFBopyZF09Vtxg91MQGSB0mIcCK7eFUoAab3qWETYziSwqhLde37uQD7LSqfk2kxqaq/8gMCU7fVks73Wv0Mr5aUQFNgZo17z8qv8ob+FA1MbKJ2c=
Received: from CH0PR03CA0100.namprd03.prod.outlook.com (2603:10b6:610:cd::15)
 by DM3PPF2FC05F2F4.namprd10.prod.outlook.com (2603:10b6:f:fc00::c16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 23:34:52 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::54) by CH0PR03CA0100.outlook.office365.com
 (2603:10b6:610:cd::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 23:34:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 23:34:51 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 18:34:48 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 18:34:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 13 May 2026 18:34:47 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64DNYlSP499089;
	Wed, 13 May 2026 18:34:47 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: ti: Add am62l3-beaglebadge
Date: Wed, 13 May 2026 18:34:45 -0500
Message-ID: <20260513233447.2713737-2-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513233447.2713737-1-jm@ti.com>
References: <20260513233447.2713737-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|DM3PPF2FC05F2F4:EE_
X-MS-Office365-Filtering-Correlation-Id: a95e6a3f-f98c-4865-ac8e-08deb1483aa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7AEJZFvMbjLkosXFw30AeUGrmh0LB8MnT0eF5U6+zR2RBRdTTDLxDqUta7k3FnbC0vDInz4QDL9GlxLdrHajW+Azu8pjsCqKxSdJkRMQbYuKHt4fbtpCBv+SzB1BXKgaTV2VUUrM4e6xcVat8f5vXabIe18MRAtLVWf3fOw8Wn5n3gQPdcqLRBmbE11Nxh4/0D92SloqPANIKH60HubDJDzFSy/QONYReBPaRT2SBigTAW4BCh+et20cBTZcXgPBs16gPkeAJQe1jEXdFDnrrLGVAEJYW9yStOfXNwslb6eYQLoNFKdzN4dpq2/ZNaPstr50/uh+umWzYYstkwauwN5cW62L5mDpxXBSK5iwJwi5ssnxnQ6FTC6UwZNYisI0xpcG7YC0NJ80ekMT5crPUdcsH9zpw3r2YMA5lltP0eGr/k6FFpyQJNLfo574Yc4AUuhG0O5Uh1zbEV0tI3Rb1xgd666BMjdgfKkCWo0mLnuxNCop27OVb0zywvLUwS2LRk7Pr4IlXUiRtcl2naXQNb/odVkl7yUGi3uoski+ufpV9ht1j9JX/0iQRTD9cKDmG3UYZ+YuZKX4Pn1DsWiWnTWU+KcWQ4HnN1mHYfnFG7F5cV4doIO1UZXNG8hkbr6k93coi2E8WIDnG+cDB09/1WhlM5LpQv9XNQnxkgfjwBA=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nCSEIOHXFTiezjf07pX8vVxWyeaW0suj6JnEaRnvQerfLtyUg3fUUxih9y2kgucZkmI5bWFkPi6RgBedq4BI9Fiwq9Il0h5S2MZjz0b5VJcQ/7nbOCJ7jmxPxaCyYF0L3S7Iw4EY8QD3YYuWNUj17WIPdW6sKZDWCzXA0yIxNfSMH2rUNn40lQVYPGv5JlUM4T6Ak50KQ4xDzrc2tiWn6w+kO98Exh40VC1zoRb766DIboHDgVrhAYHmYsa5AedHL5x2ciGGUISMXNwC78jPc1ruw4IIu8eooSt5KiSwbPU4ksz7fhN5t98c5u/UZBULkL2Fpx8AWHKewh5Tn3dJs2XOh2wmfk/Vm9K0LdTBnV2+OL+CDAUVafNL2YfbPyzpAHgxYDH0Bxr98pEDyv2QitgavRqG1egwU+0I1+QKTfiCSewNHebjKzWZJBCf6JKT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 23:34:51.1696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a95e6a3f-f98c-4865-ac8e-08deb1483aa2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2FC05F2F4

This board is based on ti,am62l3.

https://beagleboard.org
https://github.com/beagleboard/BeagleBadge
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changelog:
- no change
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 2a6a9441c23de..d9cd3fb712fdd 100644
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

