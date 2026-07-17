Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012071.outbound.protection.outlook.com [40.93.195.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487543F413D;
	Fri, 17 Jul 2026 10:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285941; cv=fail; b=Xx5k9oE/LVLl8hj4KWszM13N7kaEI4gihFuHNQVGfGXsqll6ePJtHGiBe8O43jKLmsc69FVLnt8tRpc0z4/v1bz1o6i4sXdxkFs7t5zm9OwpWlXWy+kwtVMupqY479DWeh5mruqF65asuhnLloIkgQPg21FkMIwkwrZ52RI8MaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285941; c=relaxed/simple;
	bh=DM0mxD+r34IYBbjYDGULu7aAZ4owVJe5LLVLpkOqsTs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qZA97UvkumL9jJ0GjVz3SsTkgNVqxW/ww6WC35E59w3NMNylAQxCWkQ2+sMiKDXRsQmehM65gyz4cGLn/PMEED/kObVcqC7S2szQubAQoaunMafvJZlP95TgJINBJjRZRz+MnizabIl2p3U6iol4A+Ck7FuKfggi7mIYqZwFono=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=q6IiKNtY; arc=fail smtp.client-ip=40.93.195.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="q6IiKNtY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YlPbexpH7rtwXyU1olCDa6HingK0hHd9EGht/VyzyGUyntWxOiYCs3IZwgTk4eOHGOxDMfK5C+22/aY4Qqlv/lflnoNSBiT9kx2rWkLKgr+T2C+T8AY026j5s3YHHI2q4Jdu3+ZdqvEwcdUoZDa2Ds4f+cRNNBeZjZT7xs/9tjS2sYv6wXWdX/K1YmXHQWe0mgsGmiZHnjzAfWQFrbt3mZxfruh9FAZz6wuq1qgj5NgEtvsWbtc92gEoGM2JY2hPGJ9pEWON7yrRe96Y7r430OCoQCpmqYnTnGmMVfmIkUgV8xw2CCF9JGLeN/+enTe8+PqaxIdn0DAunAblPsa3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRYeAw+7aBSpV6WT4hcuV5EiFzbWiq1oOReKg+Z+TGw=;
 b=M8tb51LeHz9f8QQDZq7nBG6M1NFHg9FzSgpFtrqpZt1YOVLxnWfRE17S69NJj9pw/frwjaMuprMmq6Zyqf1TSjlSJ92Mki86Ui4N8InksIJKebtwqgZHt5uKAxPXfokKL5+5ql5QnFnfBUNbaJPqiZAd5YD43ZQ6i2wBCwFlHPQyLKnQhBxBMNr3z4Am9/AbMyt1HKvn0sQh44YZ/Oz9C0LUS3ZRiR5+8NLLppWNvJkTAlT8XfcGfyqLuLEBXPYymnWpglwvMUfxtxmXBsH7T7JIMD4i4UjovBNuOVsMcBFcvJSmmF3NnUAL/XGldN1uqvDwBdd8es51MXcsHQ9cKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRYeAw+7aBSpV6WT4hcuV5EiFzbWiq1oOReKg+Z+TGw=;
 b=q6IiKNtYImMM3WKcevj5dgs4rDrAsmfs22Bsuxm4OcXUaVrneWzP9V5wj2ozMaQwY/dp5fnDm45KAfGcuvLcgFpDqcqV1zl1ji9X9hQusgzsDTFLKqi3c2NcT5k5GVboIDv9HUcRNIePvsEw+pEusssgwlhtnbLoxE6gEkRcXA0=
Received: from SJ0PR05CA0178.namprd05.prod.outlook.com (2603:10b6:a03:339::33)
 by SA0PR12MB7073.namprd12.prod.outlook.com (2603:10b6:806:2d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Fri, 17 Jul
 2026 10:58:41 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::7c) by SJ0PR05CA0178.outlook.office365.com
 (2603:10b6:a03:339::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5 via Frontend Transport; Fri, 17
 Jul 2026 10:58:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 10:58:40 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 17 Jul
 2026 05:58:40 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 17 Jul
 2026 05:58:39 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 17 Jul 2026 05:58:36 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <radhey.shyam.pandey@amd.com>,
	<michal.simek@amd.com>, Shubham Patil <shubhamsanjay.patil@amd.com>
Subject: [PATCH] dt-bindings: i3c: dw: Document missing optional core reset
Date: Fri, 17 Jul 2026 16:28:28 +0530
Message-ID: <20260717105829.567522-1-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|SA0PR12MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: 7faba198-f05f-404f-f6c3-08dee3f25c8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lYs4TV3IdWSAD/zBFciJlGGzceqqwDhRcBCCUbT0LQChLfwkJjquULfLfwQxI3H9X0ErR7eEQG5jKQIrtYsciy7ygHc7TslQvLS3YjczFFnrAm5WAfnsiEY1HNH/ir1IRiIRmQ82Yzd8eSUoQGY8Jf5opj3Rvj+RHbz0RhW325pMFwufNfbCY9zgYyvloiZUFCYaHus0Aj17WllvKtceISpTWxvHYXY3qAiqdVTDTbKWxCIEZAKJcK3ngW8ofUNWmx0Y6qCOW6FbvwKN584IvZqwoz/XAPpoQ6mixNynWQyGawaO1FdHWjILDVkCUI4zBQmkVJYoavZlMh4ECmT5AGCFEyMV/tZLhrQl2LMLHPf/ciecM1do9Ytuf+pP1sPrYUq8AszJ8/crPWk/VRzuDBM1zRVsIUVnDdSPkWWP9X/vZ5xFskeXUlhXAR/z9dFwOBtNkxWBuZZXYgcBV3CXhmbg/cwBtOjwaoqG2Hjwo4YfmAu3eBwYfIPrYF2zvBQEiqO8687nCT3vDrHdc07D9L8XtWBYyONTYdKU2f02SJ43ae2QVGYMWMiB7C/tOGytuMDGyopui/L+Xf0qXdOL6wNksPHz4UpB1aLbeAp9t5GQQnF13DAzHjfhh4+VAhMctiltYZULVoH0ZCd1zHH/NrA+WLXb+gOnLq2jAoqRwFVsert5MMp9N4IRsdU1w2MqOlqib1FveTG03rrwwr0Cww==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MkyMauL5QDx6ZoVGB9d/VSYkiLEFUmf+EDL3/HPRVpTrhiB5QEWKzfv8ksAjKWqfOre+zB1bPuPGmUs9+65/RA2CPECBEQE2qQICtve9/Fnz2EnXaA6dSMwVNSKkSiXk6PvQeNg3E5wpQ6wjRU3xNIZxXt+EDZd8rmUc0sCRdTnqci2O70QFqdpDTxxX7KoiYFDsyLNroM9mQhYy+KjCncVHBkogTGVM1vweUk/Zj0XUUp9+R3yaRROGO/Nox5qPavmXc6vqAK/l+OK9JJvjZLm5e6lC29v8T8cgYBUfqhTCWPRyiCA28mH99wL63joajzkpMYv7FPRHTC6xuoyk80SZ4es7o03QI6WNWy598/LTP6jdOtl4xmVKyng6RVb4AZVtxx/VyF3xQKHAJn2VlzW+PrVr/9VZ2uz+yUa/IHdZuktbusqTanxd4FhTk06j
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 10:58:40.6265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7faba198-f05f-404f-f6c3-08dee3f25c8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7073

The DesignWare I3C master IP supports a core reset input, but the
binding is missing the corresponding reset description.

Document the reset property and name in the binding. Keep the reset
optional because the reset line is integration-specific..

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
Note:
The DesignWare I3C driver support was added by
1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP").

The original Synopsys DesignWare I3C binding was added by
116e246a8bcd ("dt-binding: i3c: Document Synopsys DesignWare I3C"),
but it did not document the optional core reset.
---
 .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index e803457d3f55..822faf8d221b 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -38,6 +38,12 @@ properties:
   interrupts:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: core_rst
+
   power-domains:
     maxItems: 1
 

base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.49.1

