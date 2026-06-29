Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFA03CCFDB;
	Mon, 29 Jun 2026 07:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717787; cv=fail; b=o67qCXiyOq5CLGRdeNHXAfYwovtFGn08uINX4HcHL3dStSV1t69J0jORxWolRWaMUGR08Xoxvfq6zlz7SIZuNEVFH5gtSGIaETAd+Q2I2pag6OUOPYT20pLAYQzLgGNABxaI0l4+/2DcQCuiJOISlS9fe5PNjG8mfFKmOvlMcW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717787; c=relaxed/simple;
	bh=GHlJL3AD8QhL1Jzr+IfPUFrwIUDmszyKKzBpnW/snEA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MmWrHMgQpqQG10Jh4owtKXo8WVV545vsrULdG8z5GzjJTsKepiTdLS4ZodN+sl+m5cwNH6qr+2pTtVz82JoiK98UFCf/zkwksLAkH8yKpjcdPuPyNmk/xXM5bl3JYPhLpuy/0LGG2xp6eP4NEBiwxiphlRj7rat60x4HAQvv4GA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=CWOrjlOO; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mjGRo6qd; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="CWOrjlOO";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mjGRo6qd"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65T6kgfs1216967;
	Mon, 29 Jun 2026 02:22:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=jYaOa4R1+x0bs0z9atI4f6YKiWCU6f2nFB50b8LAe
	EQ=; b=CWOrjlOOkMMTe1BR8gufowsvsaefTAvwTF5I4KwKQgmcLLE0bfli+iq9J
	AYkFVZsNNaokrZgzFWsZgC/mOspkoXhw7Jrt9MVV8lEWtT45kxT/0l/dOrHyA/Wz
	FaBTUp4SCFrAZiTp57SiMQbEMpyjOlIVTtOeCaZqqalbb4htAUclixi4C3IcwQjL
	R/WouoludU46dC9SKhYfdd1Y4iifKJFSksaStVB1Bg5XCWgsq9vsuHTR1b3WmraX
	Y9qtmdwIDOAwlPSyrQtOfskq0nvT6ObGsr92sxKcb5dSdYjo2XExSY07g5hOrNRT
	Ax20/7Szf6/EVRCNVHFr/4rtmebgw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011058.outbound.protection.outlook.com [52.101.62.58])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f30fsdh50-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 02:22:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1S8qAvYh1+zWrJG5YyRo8CRkvclcG5nJ5lOZMUtR3+hi6vpoPu+GZP8CCy614Xi4YvvEI1sxOYWpRw7k5dHCc5FdcBgWNdajnuYsONDHBhkOXayXVp7PmxqMWly1vE8kr0Ox/EE3pKAdUL4XbAHqxlkUuLQgv3bywins0M189aTHpFBMF38USApIjyLG5Ps74q8kUAE53XcJnIjyOtnzi5fFqKVoqujzrK/2kQ6/QVeDLs/jd4pPa5ed3dnSJqtVz7hcKsWkgPTES3F2+Xloq3wT28meuyPZoLqS1bx7+WXnALiZVRBjox0oe3iH1gq2pWXddi+WiZun8OZNDJreA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYaOa4R1+x0bs0z9atI4f6YKiWCU6f2nFB50b8LAeEQ=;
 b=P2DwCGVixz5wB2NquHNRIY90YUOmfHMnFHXOX4g5sXXzueNpUGOfhEJBKPmXNcaCHdJOcUk+5XLzD1DWxtALkhQkmjvjyWqLPKT1kQ/4AKcaPzoJyfOiIhrsy7ntBkjKBtAtnycY09UOTdFteAeMsz1Rw8dv6O7RQcpPPrgGzCBDh/WX4LVaKRYmPq9MfsiBXFPXkREI5roKPfLKjCNMCxX0P70McRKldfqkP5lD3MIOcuktEOqwvujnjLEbEZcCMHzyXfKvGu8exMHwOX46EWWiMPDJIYGQD3QU6OCojZV4+xdmH1F/onj8kcxoDinxUIjsDZSHWudDhZ7SMmw7ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYaOa4R1+x0bs0z9atI4f6YKiWCU6f2nFB50b8LAeEQ=;
 b=mjGRo6qdmNJZT0/RG4k4tSyy0OUS6VfKmVRGEs0DtNhC0h9ntud/a635V8bi2JVtUXoJW2lr0Y/8B++hNucclqFeE+hDwdtupl6fEKPAT7P2IW8zFrtSKhBKdVmkuMQePlUFgLW1a+MUbunN+1WD31arMzaC4ppKRnmd/C3Y+ew=
Received: from CH5P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::21)
 by IA3PR10MB8419.namprd10.prod.outlook.com (2603:10b6:208:57f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:22:39 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::41) by CH5P221CA0011.outlook.office365.com
 (2603:10b6:610:1f2::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 07:22:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 07:22:38 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 02:22:22 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 02:22:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 02:22:22 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65T7MHWP3509277;
	Mon, 29 Jun 2026 02:22:20 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>, <s-k6@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: memory: Add TI FSS_FSAS binding
Date: Mon, 29 Jun 2026 12:50:54 +0530
Message-ID: <20260629072055.896322-2-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629072055.896322-1-s-k6@ti.com>
References: <20260629072055.896322-1-s-k6@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|IA3PR10MB8419:EE_
X-MS-Office365-Filtering-Correlation-Id: ae258199-e233-417a-826d-08ded5af331b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|3023799007|18002099003|22082099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	//Mp3xeXZLjOpfyUPZuNXR9vRN+lUVtz/OfiQx/zhB8Ee7mMtkeuzDqWXcB4RrcXJ5fY69ycXrvADkFp3NSZH1angeBZlktMhTFMMnjN4KzHvtyKOfnp+d8cg36FWbxiXcV7+urndVJgaF0Rm+Y2loLLPtHHhnGGZ0kgU4mxlzEezr+nKYVDVqm4ebYilzmQeW/ZHUUI/RD8HnpecfcL6YINCKsjMEMEQ3my2OTbbN8dmkRl+ms4Kkb6+6x/PL6gA12g3ar+zd4m2l7WLGJxdjBQhtEaZC7IKMb8hJdrjLes1Y3cLBcevRHX59zx+s+C55VfvkPeWbR/gwfNgB6odeClBYKkShfZDYRwCL0J09beYwLvBmnu7mkw0FUBq7PGYBkvlbzDUWgyDN3oG//JiQxi2qqR786kwgMcZza06goGGaKEeT8E2dzRt9P+lzIO6KTcDeVPq5ZDq35Xj6xpuVvsbvsmzAdS8+UFYLssrKhtnJKPGLFJ04AJhi3jHazpP64e2vQV89oN7wvGyTNfGqLar+h2Y7JMa2nfRFH/ZoBuDQ6iGbliDknOgudEpTLv04sk9LCRWulWZ+TutQ8xjp50HYty7tByzb8SJcRXWgs44gaieFBTae9oBQ5XJt6ShohjXoYXpjtIFsC54TL96w==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(3023799007)(18002099003)(22082099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ujb9KdCOwTODYAomr7JT2MK4MB/23uxc8WZyBqhPeS27zM4/Kz0VaCEH46TcYaqwVZE6SiU4muNyfITubzvJ20lI/W3mze4sh7es62NntofHFyuXloEAAP+C59gUzZYt7ygxSnkv7Qzl/fRJX+uAVDosxssAuOnfrSCPFjUhWDs/K828PpgGh5DmhuaNbxK8G3n175naeLYdbklLpMsLGS75dnEKAyLXIwYvZRzgu9Zqj6BsA6IGucsmyykElAQi5/lgp2mbW2Jdm8JoikwXLw7qTlN7vqRFZrWXB97HH8gqzLAju+KUZhy6qDx08ghdql7yneljPVRG0J3z398/yDlW6lbQw9QlW8xmj4ETslW5jsZgIXo2DMX72lQb/1CAGVGOvZT1wuYg5DjEahdcIyoOLKRCVPYu502zp/mOvPqdh/a1mLq0n8Z0vhGjNuHp
X-Exchange-RoutingPolicyChecked:
	OcP5s8Go8CI/gFgz7ngX3PxAMURZ/x/fz90K0aKVqQvoy4+Q/b0DSYot9KvEvvjLuOplFZv0M594yYagrcHcH2i74/FHi+MWGdnFD1dYOn4WiPRKi4/G0ZiZrqyiwqm9sDqm7vL5XUwEWBebUu7bqxtGpsOnByI9G7+QBWlzN2Z8bQI3ticJopGvh6UVJYkoBhW6XDaB7aclfBm0bZfxVwBCju8iydQ0VvHmhqNgvXBShQVkGrf+piHKDZEo+YfPUoiQNB7DNYetMfsWjPMCBcY7ioUB9xIjxWJCOwzOQLFhncs3GjMBhaZduZe7NlExxdWY4Ma7PE4UMyfeo3heZg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:22:38.5644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae258199-e233-417a-826d-08ded5af331b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8419
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2MCBTYWx0ZWRfX/3/birKpCbf7
 mJ/VABmwcfAJ84/yve4l0Hg5JDYiBym+oDQQJkdWaku9Lzryzz8UHB5QHNimzjstVQhUWV8j90Z
 7VnbYD0z+L+PJm/WRfruNeYnU11YPOd9dm+lISyuNpkJZNn7zSTSiXBoYMVAmaDpA/70kTUKozq
 iriJdInWaubM6gK6dFeRkGIZxvaGjytrQ+E2GgCgVQ2CUyzGAGXTcO9xg4X67fSgQOnBnh9HaLa
 hMFNW1UCNs/FaSawYySnfiAqYiIqgypM1xB2CvaXCXLZkSc2bVWLXMTjEAtwI7SIEc5L0lTFHny
 aP5uu0j0fgm/aO3OLQ0Einfyn0Ic5tKlHHyKu1IySld4r5kAVFqcYt+OzN6Qg4qT8pRkIVWZD9b
 84Z/3sTewII+VtOWtSNLxxG0KY39TYjyspAo3JOohaTzL10zf1Q2UawSlpjLQIm/0Y49c+uOXRO
 oz7F7GJZmHFKecM3m3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2MCBTYWx0ZWRfX6aMfgliYdPuJ
 /Se41q8XjI8MNV3QklNf7Nr4VX3EsP8J92Xkq5lL97LuQO4kxqChlAO0eyZGdx3W3NpjrCdhQ3p
 ayU9xYh86xlocs15rjWFNs3KqrBlXOA=
X-Proofpoint-GUID: Uor0hjTOCg7EVzsA4ZyEeL7BNxIOQJ6o
X-Authority-Analysis: v=2.4 cv=dcmwG3Xe c=1 sm=1 tr=0 ts=6a421d41 cx=c_pps
 a=RV/m/49WaDJDQ/P4gGxFUg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=SiyT48bRFmsRPwTNcj4A:9
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: Uor0hjTOCg7EVzsA4ZyEeL7BNxIOQJ6o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290060

Add DT binding for the TI Flash Subsystem Application Subsystem
(FSS_FSAS_GENREGS) wrapper present in TI K3 SoCs. This block controls
XIP read prefetch for the OSPI controller.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 .../memory-controllers/ti,am62a-fsas.yaml     | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,am62a-fsas.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,am62a-fsas.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,am62a-fsas.yaml
new file mode 100644
index 000000000000..5a5cac92082b
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,am62a-fsas.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/ti,am62a-fsas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 Flash SubSystem Application Subsystem (FSS_FSAS)
+
+maintainers:
+  - Santhosh Kumar K <s-k6@ti.com>
+
+description:
+  The FSS_FSAS_GENREGS block is a TI wrapper inside the Flash SubSystem (FSS).
+
+properties:
+  compatible:
+    const: ti,am62a-fsas
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        fsas@fc10000 {
+            compatible = "ti,am62a-fsas";
+            reg = <0x00 0x0fc10000 0x00 0x100>;
+        };
+    };
-- 
2.34.1

