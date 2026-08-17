Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010003.outbound.protection.outlook.com [40.93.198.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2BC3F329D
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 10:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963968; cv=fail; b=f6Sj1UYJDVcs5QrfYmxVxWKjeXfWTZkVU0wXbx7vaHH6cMJYGD67f5y0EMO518XF16m6v81ISq0eW5ZjiumzpfAq4aR+au7dQMSyJNRjH4LF32qXFrWZzDl6uD8Nqqaf6wDKioYq/eCfX3T70Ir0n++sndXM9M7v4oIuHH9bl0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963968; c=relaxed/simple;
	bh=rw0Hcs2qfd8/N3miM2sgwiaWAjtoFxpqmJh9aJXM5rk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QRTSVRz6RUbMTchnmmZmK3ORnAKP3I8gDxuqt8iqO0tK5EmzZIWvZ20gv0O/iopNb5XFde2SlK5dQoz2WhAUwLU5STOR8AUxBHH0YeGkHBHyRzkwOONLW1wIufkch+lan81MhmQ8b54OkbjeNUjBPWbIGBYr5xNFLPTnXrw4NuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nQWgM+pv; arc=fail smtp.client-ip=40.93.198.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nQWgM+pv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJts+pjcJPjt6LUOQzqkWWULc0nwI8RCJMp6QRYn2KRNzvLSyqg/l3nlSkER0zYuMjOJR9nZ6GxrgOEROCuO5Ts2k8vgkBLEb5GdYzFGc4uDsNTRDkg9boaCsXfQ4wcqTAqIah0BAs/xYQYX6C3mDfhlXU8h/9hmqGuNUSufDJmkHL6wcRZI3W+VJmDN7M2YBW5v46IWvdwxEXs5zGvsQB3HGVJtfd98F4vPZ1sVvssf3p7nXfy65HEAqqi8xPS1q0zKY1JqjOD4A8vaGp9hlSRTOBDmLOJHLt3IsWObs3BbanJA/l0hcC4SqN2/RESKzDfR1guzpfZTir58OjVROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4NvlWwFMycO+dm19RLc2ofDmisKiB93s1Pi8t2y7yQ=;
 b=GMDZpall3bXqwcX89C5r7VfCsitxOwEF8jNH+cmZYoz2EyJjtEZWCg6S7c+RsfCrIdm/JBBwk0vDCOq2Kg0SEKHmwi2jEQkIm+mPyzvuung4wHfV8P19pk+fQShIbK4igUFDmfNtdd1oHpfJTtCAxa6lSDq+Cuim31exmmPWDP/VfwKAM6tKlx3N99YsIi4XDMt+EksUlpAmq3FujNelcpa8dp3wy78Nu2NxEUlRVRr/6MXzdvQhTwP3m/i10doreJj5tAMUjovInYhlOj1U/ZmvhYhrhPydgCzj+q71g7RdhLO9YVSyDvWQabFDIkBcuTlcqfPc/5Kq18hjwFqlIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4NvlWwFMycO+dm19RLc2ofDmisKiB93s1Pi8t2y7yQ=;
 b=nQWgM+pvGqPSmK/nadTo4C1EYT6L5dfqTG4nR+ITkuTccJSs3ccIe0LTe7T0h8aZGxt86Gd7AmwjKPYvXH7QjqO/E1U6uVXoDLrmNRRKrzShf4AbYuD6EXqQAjx2RH8D2ZlCiftnYLBVTSlU9I2JXcvHa7Nx2uO0TH/WSgINuHA=
Received: from BL1PR13CA0291.namprd13.prod.outlook.com (2603:10b6:208:2bc::26)
 by BY5PR12MB4179.namprd12.prod.outlook.com (2603:10b6:a03:211::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 10:52:41 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:208:2bc:cafe::8) by BL1PR13CA0291.outlook.office365.com
 (2603:10b6:208:2bc::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Mon, 17
 Aug 2026 10:52:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Mon, 17 Aug 2026 10:52:40 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 05:52:40 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 05:52:38 -0500
Received: from xhdtunimkar40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 17 Aug 2026 05:52:36 -0500
From: Tushar Nimkar <tushar.nimkar@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>
CC: Michal Simek <michal.simek@amd.com>, Anirudha Sarangi
	<anirudha.sarangi@amd.com>, <git-dev@amd.com>, Tushar Nimkar
	<tushar.nimkar@amd.com>
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: Add Xilinx Versal NET SMMU CSR binding
Date: Mon, 17 Aug 2026 16:22:33 +0530
Message-ID: <20260817105233.1557748-1-tushar.nimkar@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|BY5PR12MB4179:EE_
X-MS-Office365-Filtering-Correlation-Id: 121aed2b-51aa-4850-64e2-08defc4da896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|3023799007|18002099003|11063799006|56012099006|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	YOUiM4Bzjn8Vo6sxBhbrmFO5EImwiaMBak1uuytG+RP2VV70VPlkhrpAwsSPpQ3Bl8bRsAA2LZdzzRWEgFeJ1RxoyFxgRwoTXa9+tCo0ufqggqrmrGwlYhbwVo9XaYAgunxkZHKQ7E4z/UmLfQDOnZLDAXUM5+inOZyKedG2HP0ItCRtTs3sZ6mOJxDwKgu5N0vP7z6zvngt8rk+Z+sKB0e+nDB8TRg0y+pNiaUUfOfAAODyAHa2YzA/cDm/zNsKYy7iXPNAqL8lOGAtLaGSIEAW9AJjHfKSAILVm0bKXv+f3brTnw7tFyv1Cnfr7eLZWeHlL7oZKRGIeYdWJG18k32fIX2HIfyGBMnfTPb1pf2D54nSI+h1XKQr8Bm+GCs8xYsuiHLq0aYGTTQN+d1OKiCJIjKyYnqWDmwlyf29F8R0FPuzP2ovTFjNiIQk8t7mpN5tC55NLOAdYGLt11AOWQYZ6oA13nmKpZH5MZqK8CQBW075uglxs6hQOE/U4hwqPZepAMjWoe3eM1C1G2BWoNmWDPp+GPLlYi0FGkKlwg1N6/7y6FkS0ESK5zUt86KBhFOjhQ8hi8lPPAp+uQUoLrmYNeQacZXWJuxYE2baMwe+rgRkIFTh8AKlxqENBRGBtwAx2AodgBC4bMLDn+EUIw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(3023799007)(18002099003)(11063799006)(56012099006)(10067099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kSFyBjGOjSp0zRHrLCacSI1GEEUu/WMoULfAKyMqe9GSy3dkBuGyCej1z5INmaM/V0rE9l+ObyOWIvam+7WhgDKEPhtaZ9Iq7843uOJANsDCFG7dsrTUZmhzvf6FVE2nBrsQgn7g7FIaoJa+LrOITtLxOYaCSrILALvkDzL+/x/AYxgiJYY2F8tKa/WX/sq4rKxrCQkJQPWf9HdvlOw3uGScHS6bQZKEE5PB5ec0dGat2BX+zRF3PtNWxwWT80vbd6VAoxjjSWf8mcNQg92bv2Wra1bm02Rx72+I91hCtO2FHhwMuvY3+yNOxRlRsAz4BWtoaPGXm+otMYSoPJ4xhZF8vikONladCDDdq9PY5MpIf5IJdFyse6JXdvgNab8DLs61y2Lq9Osq8W2W0wMRPfM8P8HQKmqJAwxKmvr9+uWDp2Rs2CiOxfpTwGlFc4M+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 10:52:40.3868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 121aed2b-51aa-4850-64e2-08defc4da896
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4179

From: Anirudha Sarangi <anirudha.sarangi@amd.com>

Add a device tree binding schema for the Xilinx Versal NET SMMU CSR
(Control and Status Register) interrupt controller.

The SMMU CSR block acts as a vendor-specific interrupt controller
in front of the ARM SMMUv3, providing registers to enable and clear
standard SMMU interrupts such as EVENTQ, CMDQ_SYNC, GERROR and PRIQ.
Interrupts must be acknowledged in this block before being forwarded
to the parent interrupt controller (e.g. GIC).

Signed-off-by: Anirudha Sarangi <anirudha.sarangi@amd.com>
Co-developed-by: Tushar Nimkar <tushar.nimkar@amd.com>
Signed-off-by: Tushar Nimkar <tushar.nimkar@amd.com>
---
 .../xlnx,versal-net-smmu-csr.yaml             | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-csr.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-csr.yaml b/Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-csr.yaml
new file mode 100644
index 000000000000..3387deabb5be
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-csr.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/xlnx,versal-net-smmu-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Versal NET SMMU CSR Interrupt Controller
+
+maintainers:
+  - Anirudha Sarangi <anirudha.sarangi@amd.com>
+  - Tushar Nimkar <tushar.nimkar@amd.com>
+
+description: |
+  The Versal NET platform includes a Xilinx-specific SMMU CSR (Control and
+  Status Register) block that acts as an intermediate interrupt controller
+  for ARM SMMUv3.
+
+  The block provides registers to enable, disable and clear the
+  standard SMMUv3 interrupt sources (EVENTQ, CMDQ_SYNC, GERROR and PRIQ)
+  before forwarding them to the parent interrupt controller,
+  typically a GIC.
+
+  The controller receives one parent interrupt and demultiplexes CSR
+  status bits into the following child interrupt identifiers
+    0 - EVENTQ
+    1 - CMDQ_SYNC
+    2 - GERROR (GLOBAL)
+    3 - PRIQ
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    const: xlnx,versal-net-smmu-csr
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+    description: |
+     Single cell containing the child interrupt identifier
+      0 - EVENTQ
+      1 - CMDQ_SYNC
+      2 - GERROR (GLOBAL)
+      3 - PRIQ
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    iommu@ec000000 {
+        compatible = "arm,smmu-v3";
+        reg = <0xec000000 0x40000>;
+        #iommu-cells = <1>;
+        dma-coherent;
+        interrupt-names = "eventq", "gerror", "priq";
+        interrupt-parent = <&smmu_irq_csr>;
+        interrupts = <0>, <2>, <3>;
+    };
+
+    smmu_irq_csr: interrupt-controller@eca10000 {
+        compatible = "xlnx,versal-net-smmu-csr";
+        reg = <0xeca10000 0x1000>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.34.1

