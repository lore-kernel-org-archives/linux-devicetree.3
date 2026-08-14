Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010006.outbound.protection.outlook.com [52.101.85.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06778468C04;
	Fri, 14 Aug 2026 11:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786708333; cv=fail; b=ZwiB3FTE9oeUD66FQ0bMCAjF65pCeGFAV02mTtwk7W3Ddk+OKpGZ3708QI3qTgciNotyLihdDcdzc6wjlimSh9Sxrp6eqXaXPLhCONGFW8lCB0i0crfrokCTcNyBXoWv2bOhWCCwa+B63YazIJPQOL5B/5tGvfkvN9mu9ZVhDUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786708333; c=relaxed/simple;
	bh=tLXSL5SudEjAvQJmZ177zgUe7nEDZwqJ3Q7st/Mn+t4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c/3SNj8CJ77CkHwL5p3BjArRyilK8tx8FK3yUZL6AT/itfwOAqrwINOQbDY7gcI2i7fwNLv7vCLLtP65QOCMe+nG4HWQbbapCMpcIs/mrlpYt7VEL+1YtNRqI9AG+URS9Zq7uxpjxEv00voPmAtewaPCocha+V44LnbHOOMzyYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zXMv5GTv; arc=fail smtp.client-ip=52.101.85.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zXMv5GTv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXl0g6LJ6XGhdlEVeRyXeCan+fsDMwckiNuEks6U34VduC/YiTmFbowxkyVbUpIWD/+mqGKO6nAISYaKf1U9uonZsub+2jLd9BXcmzocQYFRtSt7HpKtaldjhQ21lDcfCVCdTWPMSqE6nWjibWXtT/KD+L3DdersXRKebiDGK/C2Bu+i3vkE8KIghHposYESdERMeIBqyloPRla/AcKs05fkrRaZQpNbQ7QSUYySgnp11q17tq+870rWxml2F2vBYBFcf9nWov8bhkvEuQoOzSk67lSvMdh8OAMZOlKtMDrputBP/ieCadaFs+GkPbEQlqEzKRJBC7Dvs1Tqw0f+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WK7kLBqKUynSpBLB/LvlUhtM4fU9JNLCoJO7ixvmESo=;
 b=UUskpyw4qmStGf8jjjHowLcCs90QvaMWWkrRWBJgZQZkXkqMqHJtieiNI5FIBcGhccq85OrYu5FKBIBrFI+jpR6KgOy1gunmiOMG7Zan1JwIkR88gend59PzpiEQLFdy0hdI3MSiinQEDDRE9hl9SOa9gwrVQ6f21wM+eQ8eWA0rUjXvszMn5AzSqZ9BvTpb4aj5asmciPgyO6brsUj562W3dcigrvQMZYNLe8temreqtQbTMXpo3ial4V2gJVZBP9fO+UO4Q1VYoBdpuDgPvKWhEibntDGfWodkOmK2n34wAotjHAy3DrSECowlKT7AhETLjSoSSdNpJkxbEwAPCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WK7kLBqKUynSpBLB/LvlUhtM4fU9JNLCoJO7ixvmESo=;
 b=zXMv5GTv2S73CJx1iSlVCKiGoDuXSo1J8l8u7bDLC6fbOjoCCSjXoUPs6t5Nocvb/zosqsMr0jgCGZhNZXntYJvABRMk0tVdfpDHdJbvOkinz0TNFl7nPVY4fQYU9bCUQ14lBZPci8lI8prycUqayCELZjZwfeBBrHWl0x9zTR0=
Received: from CH0PR13CA0036.namprd13.prod.outlook.com (2603:10b6:610:b2::11)
 by CH3PR12MB8284.namprd12.prod.outlook.com (2603:10b6:610:12e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 11:52:06 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::4c) by CH0PR13CA0036.outlook.office365.com
 (2603:10b6:610:b2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.5 via Frontend Transport; Fri, 14
 Aug 2026 11:52:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 11:52:06 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 06:52:05 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 14 Aug 2026 06:52:03 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Shubham Patil <shubhamsanjay.patil@amd.com>
Subject: [PATCH 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join capability properties
Date: Fri, 14 Aug 2026 17:21:53 +0530
Message-ID: <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
References: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|CH3PR12MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: 47c5418d-4bed-4d5e-466c-08def9fa76be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|22082099003|18002099003|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	itC1TEZ45+CnP7dnCDGrmC9w1cZZP+psCqIjyiDO4pxlISStGu0FRpNem7NZxjDVANRCVQpNWI6LUWHgpu5ibwg0x//5eE8TKeeIVfAlgTKUKQZCe0Ttd3w77y1EMlx+hlVt5pk1Yv+z9wxOHF2pu6K6jcvYemNZsiSUFkdwF3cScotiyCI3UL52pHvHSjbk32DsnoO031QlTRu73vjssloR4Dqs+LyuOlg5q09CdkFs0AvHF4eVwR6Uzw+WRigsC/bMIuNsyKXiMucosCHxJhtHTahZUrrOiNmudHaw+Mwrj9yHnzcllXH91HvFeWbB+aS5AtC9Gyv3SKWZ7+ROZo/4hHW8Cvi+366kyFxGeS43mWAVFpUGs0xfFHnx+4tUdhcf5Y5KIGt7WsRa+M+xhy/2EMg9fvdtXRTgf9gR3no2kCGtmql8CkqH9y1/oMZHcUIGl1WxEZ1J2xMyMwT9fZ3pbCI55Uxc2KetjoIK4jbgCI1pFfhAlQ8OsY9Sw0Pzdaslfr4tn5XdKyIvSpEwFX8f5191Z5xO9DqkUt4FyZoC05fj1iZESnU1o9XIX0sXfwh1GusPeyU4r3Ur9DICVHvBrU1+qVIQz8q0QSROR2uZzUYbwXtiZalg73N8K3idAgPOJjjQOo44fr8fLWtHygJG1Y3HuaZ2zffOeVvplL1g5ZeevFS9JawMtEjVBxjVPh50extIzVq8T6f32Equig==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JjMFr+wkt3lnt1QgNAP746NAojvEL5WRG5j+F3WEtslyEYjZIsWNvTUb965o+VzEwKwG7cLot035sGgXEJQNJnqq67xus3pVeTWrMiUKgJfWHDWEACCuve9S1EA70yuYxwuLPBGNua86W05Wj2Ct6ZApJfwMqPlmsseRin1jAG91TMpdY7V3GWrwj5BgOHmtTxwjL1cTltLBOIjO9wROpqOzsDKXzkdWlCPp8gN8m2gcAR0hArfvBiVD+InKV/89cJK6hkJq6FI+5SBellWmUcp607L5eSlW4bJbX3IAxLW2AloksodtENfx2ALiqkt++PX4LR+s2s0ZwOgDunnfgSixn1wfAu8RcvrU+NbSF62fPAkSHSfhcnb7qcMU07q55+NufbdqsFbTfX6RDN2kastWpt0RhkmPj4PjPNaOoi/tHxInwCu/tGuMfjMk7R6P
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 11:52:06.1962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c5418d-4bed-4d5e-466c-08def9fa76be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8284

In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
IP. Describe them with two boolean properties.

A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
capable design is always IBI capable as well. Both events are reported
through the controller interrupt, which is therefore required whenever
the capability is present.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
 .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
index 2caa245a8656..07e3d0b4d767 100644
--- a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
+++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
@@ -32,13 +32,34 @@ properties:
   interrupts:
     maxItems: 1
 
+  xlnx,ibi-capable:
+    type: boolean
+    description:
+      The IP is synthesized with In-Band Interrupt support. IBIs are reported
+      through the controller interrupt.
+
+  xlnx,hj-capable:
+    type: boolean
+    description:
+      The IP is synthesized with Hot-Join support. A Hot-Join request is
+      acknowledged by the same machinery as an In-Band Interrupt.
+
 required:
   - compatible
   - reg
   - clocks
 
+dependencies:
+  xlnx,hj-capable: ["xlnx,ibi-capable"]
+
 allOf:
   - $ref: i3c.yaml#
+  - if:
+      required:
+        - xlnx,ibi-capable
+    then:
+      required:
+        - interrupts
 
 unevaluatedProperties: false
 
@@ -54,5 +75,7 @@ examples:
         interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
         #address-cells = <3>;
         #size-cells = <0>;
+        xlnx,ibi-capable;
+        xlnx,hj-capable;
     };
 ...
-- 
2.34.1

