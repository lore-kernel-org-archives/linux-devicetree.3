Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012047.outbound.protection.outlook.com [40.107.200.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBB637C907;
	Fri,  1 May 2026 23:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777678318; cv=fail; b=CanhmB1O9Dlx9uHhaU/llW5F60blI2pH4ajaNLEJD/6g4gCSPM7BQM4c03jqc/rKxrv6mz0nsuMH6e0vkB6Fi/ftqGXeCKqYwELS1Nqy8WlNWSHD2lUGNmMATH6UlZ/mce+MMLRB47hhURZ/7MpRctGA0CvBKUvZ7LBHSJAVnoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777678318; c=relaxed/simple;
	bh=VdRuzUREYr0Y49x3Jn7rT4a0xCvP3watgzEYlJtbzOA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=njfBv2jJyn/PoJ8NGhLljiXEFlJkrh7wjWno2R2gSuD1uyuSfZxnhU1uwJn4grtYHJJvvN5QR+y6PFrqa/v6bY/g4v2x3F1d3h46iN8a8467ZhrDzkngdGvNL7upIXnAFwZPoRdiDrdKYj/ks4ATsL3M4LJDdJZBAgiEN0+2oBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ouudGSY4; arc=fail smtp.client-ip=40.107.200.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ouudGSY4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJ562eYrPvL1ChSzZnAstyGPefC+pbsTAxoOHGwmxv533S9/SntkCStWYaaNBC0AB6m/WbIdY4cEtJiVLPNkA6WB7a2trn2GF+7iYp9bW9tvExbx3jugOqVCn/oUeuZCse98QPL+JDTPsgcHilcsnWUVz7lnqRKkOfALvFbCox9WY6sQk4phF1687nw/5NIvyVQqGhkWHLNOZKr7m6zvMJCPu+xnWlVlBAsOqEWKmDtaC26ZjMcNQ+C525ldWbx23enr8gClRhgZCv7chkqWGu0Vu3oRgyKqKv4oG2JtfP/W+FZYI22OKqtUgp5QrUnbAo8A+YLh0YEaJKREq1mDpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EsURogbOPKpg8drcyEWAVgfC0pd4ptQ5D4S5ByX0ig=;
 b=mXzDxnwsQOROpJD8oa/zLCpbVDeQhQpav2IYVnZ39ut3VYJ8RLyvFXDZZimksRgOmXekeyVcjgvihXzpquKvm2DTH1gYrpLTKSCGt62PHvJt61L3IXUAkGAONDHSiU7T/gH0zn74ViKLS/wttKyjrNz/xIgDxVZCrW3C+yMh5PAJ2U4SamugWEOOSdfqs1oarOOgqVMZkyyZA9aVwjUK7DzLYS0VGNIAELzrCjDFp7wzo+SLJ+V90pPSOStV4cJ5DnGXD5v6pqSahDQ5AQ3Tr1iHDywMmwRzKahxIGkaFdI8z1cMHYpPuGdf9/ZLBY3LaPBn3P/ze7si/O8HhEH5Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EsURogbOPKpg8drcyEWAVgfC0pd4ptQ5D4S5ByX0ig=;
 b=ouudGSY4WSEtjXwolhdBG5QAXkWArq2yp1xQFEPnXTpcjaADjV9TJ6nvvSx0g2XERYGOqmIH0qEx2omYZpXUdCX2lyo2xyBp1HE0U4z5BxL4c3TOhQOoilDL/D192PlK4PcOlxwFRkFSQL4rEZbw8Oqy95PGW72H1LIQAIKGtqQ=
Received: from CH2PR17CA0015.namprd17.prod.outlook.com (2603:10b6:610:53::25)
 by DM4PR10MB7508.namprd10.prod.outlook.com (2603:10b6:8:17d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Fri, 1 May
 2026 23:31:54 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::cb) by CH2PR17CA0015.outlook.office365.com
 (2603:10b6:610:53::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.23 via Frontend Transport; Fri,
 1 May 2026 23:31:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 1 May 2026 23:31:52 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 1 May
 2026 18:31:49 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 1 May
 2026 18:31:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 1 May 2026 18:31:48 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 641NVmOM4174732;
	Fri, 1 May 2026 18:31:48 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>
Subject: [PATCH 1/2] dt-bindings: arm: ti: Add am62l3-badge
Date: Fri, 1 May 2026 18:31:47 -0500
Message-ID: <20260501233148.4180391-2-jm@ti.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260501233148.4180391-1-jm@ti.com>
References: <20260501233148.4180391-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|DM4PR10MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b1f715-cd99-4f30-96b9-08dea7d9d2f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qe6gHCuVl9tMbXeF9C9fYy2O4cDC3M+e9nOC9ZOZw+zP/wiusXzqn3NY+qbglj+EXYh0BoQ9k/2fxoYsJo08TNEptswUVzD3QOET5tNoRCtqjVmB2+qNJkDWQdfOoz6NkzWmgU0+mJqoO1hfR1teV8/SUTKmOuv+iw726B4lOWKU8WfOHgxTqXcvrSprcsaiMScFueJrthKM04HzunzAIo8eEfMtuaAn+KrvRq9HoBtOdClkxbkUUmF82a/0UME67x9u2RrtaUuaOcWhfiU4/nMJ5zyss7Hg7FThL/jZdIqR/OFgJ58jBa7myarwmPuyr2bZ2XdJhncqNC4tB6oBxEEvMDfyOgBt0gTf8ohd6bK9cq8+G/bv3X0bs35580XVoK8+70WaAIPMRAYummklufb/qQJwc1HpKlYVTcsDYn/ocRTZbkFQohx0e4Uwcued2GF2vJbhAO26wNRdmwez3BjxxwRZFim8kS1r0SBe8RuHNBeYnhEDrnUZ+KUIiCUnHbh6cICmWL2G5ebQkFNy2NGL85eL52SGWPzm/v2668y6s3O/lLWZFM64ndbjzD0k03l6Q6H82sPIfeSIMJYzuB2IHNudCHBzI19qfUEEfX3N7Bt/pUAwqy6Uco1qScKOldUj11ArjmOxWFbnPrH9AKCWUt4sKaM120MaE1qKcdbxSKvlP7kBzTVJ+NmrahNz
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fbvjFoy9+HMSOmQdrYwUSnwHRyNG7mbayAZuJi4hif/DV6gI5g7aJ316XzJN+fptsMBmgpIzHt67lsholA/+fFitJCimGa9MfGXX5d+d/b6aXZNlCZNt3Y4wj7RRcBDIf68tO48onoln/a/SmEdNS5RHzfC1NseckZ3VrbsLSPQEB3gZaAuVTGc+VFVrqoAlboJWjbHNi0yPW6ReRBCglgEH5ppjd13XetnKZ23XtdcH0QzR+K9A+8AwVGSClWUMeg7uR2lIk82jVkN9ucHzYuuGONBHWMJGHENUbLNjswi9Jhc9AeWlKJTn+dPB5ZypdORjJotd3G2J4B22nPb2aMD4VAFNL14WojEcBzxyTmOppiMGUwsRmVwWLsnVOyA0BBB7zYAbpeLlCmFpS90Lc0dBfy1ryglcq9LlgrgWi55UKu6ywz0Z/D3ms8/jhRPJ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 23:31:52.1013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b1f715-cd99-4f30-96b9-08dea7d9d2f0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7508

This board is based on ti,am62l3

https://beagleboard.org/
https://github.com/beagleboard/BeagleBadge

Signed-off-by: Judith Mendez <jm@ti.com>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 2a6a9441c23d..7a1f7cc06c47 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -40,6 +40,7 @@ properties:
       - description: K3 AM62L3 SoC and Boards
         items:
           - enum:
+              - beagle,am62l3-badge
               - ti,am62l3-evm
           - const: ti,am62l3
 
-- 
2.53.0

