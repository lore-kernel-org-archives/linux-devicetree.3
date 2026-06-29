Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596EC3B0ACE;
	Mon, 29 Jun 2026 06:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716140; cv=fail; b=TnaQeAG7qeQGCytpsvZx0skbwsmO+chGDKbczhiBEWeBnfmFaceAxfKI7eWv51ngr8lEXljEtSusWxQ6k3FciGnOeFc3qifEJ0vLfpukzvX0TDTgzvvON1k+i3momEXL9P3SbWyN2JF/fyys0vQmFQck4g0UVuIHNsCM0mF07V8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716140; c=relaxed/simple;
	bh=YeszPbGQc1gS/lj1PUql9Cnfu+Yje6kITtbGDt8tiO0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YE0V4CLPwAhRw3Obb31/GAQpmfApQwqPAGxucz/vpp6RWJ5xNy6Ctb+bW/b6bWeUXWJZmGT8ubrwZ11vM4RTW6s6NsbwFi3N/ZYicmeh5BXz51U+jae9a56fVAtL9bijCxwLwOFsD2itIxfARXaKYyf3CgpJFBdvumyCb15botc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=DYIf1R3X; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XGQIOMT9; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="DYIf1R3X";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XGQIOMT9"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6lDqc1397312;
	Mon, 29 Jun 2026 01:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=YFz5TYrtcGd+jcAtYwEW7z9GN6LczhY1VN/xksTCJ
	Yw=; b=DYIf1R3XVBKhxBo89/Vtbt5XbINv2m/IXJQQm1VUZxn44e7pWtHyxHGwQ
	JlqSmqj7rVlCHeQX1nsuFOv3cFIQ8l/yBh11h/S+zdVRr8xdOvPZpl/I3Nl/i6dU
	IgFt2xXw/P138+ug1mrRQXTGqmGfgrkvwni/PUt22jjBZ2r6Rpyba0L0ounhY7Kr
	v59jlfXcw6R+k0C9CVEY1GHLck0GeeQvtqVP9sATf2aX7wATMypB/r7FSvKFMRLT
	SJ/U7RZiYJ9OcXjV0i94VVtzYAuBMJoK9f0HhClTgtpEOPy2D3gRqSSJGaVvhICv
	Mn9ba0+kbPI1uJ4VffLiKF1bJIS9g==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013069.outbound.protection.outlook.com [40.107.201.69])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f2wnpdr79-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 01:55:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0wE+H+Pm1DPdIsDy5LFUy3Jr2FPCv4h2D4WP4asTDye2siMu+tsYniCVw3kD4bwueYzvpjiCaqfuvG89aSpDSH9ElDpjcICPK7W3uEtco6Is8wWhT157WAy13fxypbACwqBrF4B1JpscRx+KzHQZY/wMqp2EaRMmhmq6RMFqejhVoAKJh7yjGUz5mb6wRaLnA78DRoML3agqrpeAePp5Ho0VVC3jSZ1rgGGOFyqw430l8FPihG0ywXKGEwgYuBotcn5QoYBttLw37x9Y2tzOWbYkYpenZ1jOVnt5mtWd0Xjp0qJ/HDvzxRh/yfiDjbdBAb1AJDOTA68GzjY9/yYYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFz5TYrtcGd+jcAtYwEW7z9GN6LczhY1VN/xksTCJYw=;
 b=c8Db9CG7yu1OCB8A4YU/KZ7wH2fmgJKCs1yW00OJZDWm1mK5h6k2FOvoSOnPJhw0a/7e/6jCjwUkXmzy+XFTFn4BvQX4ealk4Fz7JFUiuAEASpL/lxtHF4lx63TjtY+CrJqcUu8gOZQ2KRYEPbG/Gwjp2vcLEQ9kym6OXJJJcmx/Zocksl0UEOzyGmnOY1TJFJXQS97IsXHhnbtVb+dwanVQk8th+ZHD02JdRxhlCfPOdwqpif7tXLwq5N61ik62iooFFvTjB/izS2Rcu6CuCHAGSQiIf8nQZ7WPkC4gBiiRx4tHB8lq+EEnWA+JQWD0b6ZMxQVGsotRRFsiS5z10g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFz5TYrtcGd+jcAtYwEW7z9GN6LczhY1VN/xksTCJYw=;
 b=XGQIOMT97qpBJWnVZz+o4trg3yMZkHVZN2HCqgRoBU0lcOmxbUkFHw0KMv6GFQ6cK3DE+hE9pCZ+y2P2RTz6UU2syxBpVlhGTzDwkYeaOOn8jkPVHk/WgSXA+QU+/7rp8QBNaouR/bMburtSucj3WmzGKKM61WYfIQ/LCSGkBTc=
Received: from BL1PR13CA0374.namprd13.prod.outlook.com (2603:10b6:208:2c0::19)
 by SA1PR10MB6295.namprd10.prod.outlook.com (2603:10b6:806:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 06:55:26 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::82) by BL1PR13CA0374.outlook.office365.com
 (2603:10b6:208:2c0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 29
 Jun 2026 06:55:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 06:55:26 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 01:55:24 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 01:55:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 01:55:24 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65T6tJbV4031738;
	Mon, 29 Jun 2026 01:55:22 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>, <s-k6@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [RESEND PATCH 1/2] dt-bindings: memory: Add TI FSS_FSAS binding
Date: Mon, 29 Jun 2026 12:25:16 +0530
Message-ID: <20260629065517.868418-2-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629065517.868418-1-s-k6@ti.com>
References: <20260629065517.868418-1-s-k6@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|SA1PR10MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: a608e602-745c-4557-3b59-08ded5ab6609
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|22082099003|56012099006|18002099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	4dGXlIYUMNArBGl7dGl+CoPfbez4C7g3x2DVyu1mBrDFmzB8AOf+iDTaYsh3HwqB27cuIXgKd8rGgFT9l3tTawzR2xxs2PdJ57ERc1YUm5LdoCg9pIGbINzPD4C3A9ynEtD4CgWqhZApas7uZ/Gg8y76UHoooIN6V8vAhxtcSKP+cVqk2xXi5vbh01sQf9opvzSMzDRWaAqrBZBUHuvTFzvw0EGzjlevQ/yzsn2HjNKmYVLf5T9QQKpGkj71zeVcyvAq8WzwgoQkdIZFcwX1n9sWhhebI9VUlLbgh453u9iOFlCURsIESr36b+CIcHU46epfWe81xxPvwh/tZfZhCUm2QNuqACg2fwa560dpbMN6pNxQ3BR45CdD4rGeFyansaBCVzBI4WfALcfG9DpCxcKblUdIezDsZWGbz2N1og+GJkUIHAHHMKWsw3EplGSMHBy2fWcHIbPROv0/fCJI9MvnwP4Csgd2nlHqQcBOXs26QggJanJVZbo1cvDvVFuIwFfzprh2sqSD3vbvi2yDl3jDV7TyuuwclEkhSkoj0JTmxNUrWud+R4TjjiTilUWjHseKQdLPWINwGSQ94lEqy+Ty6bo2HlNtI2uIX5knW/qx+Ytr2qt3oWGJ7QevCvyBONiZeQPJLk84EEgu/9u80A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(22082099003)(56012099006)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OthaE3N+DKN71sujS5OukhcFiQBNXJILx5EAIcPJJ+8OkUkJ25caK7inueu45tGrI8IAUKeZXnpAL997k6ZefoB3aip6PbxgyJbhrQbuqSou0t2x3xUYqMPf/WNvTGm0FWg7R3JgNs72/6QSEU/gm4tqFn5IA35RclcRGL35zmxA9t+psBkPyEtAzB9lgy3qN/QbF9Fonu37czQoAOrQVnORdgCKejqtzrGQSmKjc2ljAf78jtrSN9TVwhk3GcviKmw1UTeomcvgRZc0Jq5fxnaCXbdO4yezBcvB+SQK4T8xu0U+G8IqhG2d6b48pfCfdon3sP+iarvE9ekEU5yLICuP6tpyDqGgpyKacMbDaprubs6T2AEnQHdO4+iaj9qnZ4dfwU56kIB6zayJ5jYtRlvsa/aaYM8Ixm3XNOzB2qRO0JBNkq8DFsPJBT4le74T
X-Exchange-RoutingPolicyChecked:
	nXLa9UBiAAe0Qzn6Beanvp5jGT6D/65UJmghnx+lzGAGaGFvoPVOr4pSi79Cyhpdn/t1r+dNHENympaTG7W+iqXoAccY/VxKj316uhXxYRU0RfZUDScR8jPfHUMfALn/I1Pynqkru25AsyBQ8uqEo7AFJZ0WjJkYlW/4hbLz1DImBNqTn/Rdp09gej2k7uM78jOxchI+1G/pWnQieFSUWkRH+5/MHE/efnIM9Sx0RPPYv5sI6gHjZqg8ROeEuzc5/wSVUw+xuv2OAmKeb05Z6f+LGSH1EtVod9gjpuxs+oxI36IBf5OTV20iIf5gtGQFJC0/1Gf8dm4lRbcWR+a9Dg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 06:55:26.0046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a608e602-745c-4557-3b59-08ded5ab6609
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6295
X-Authority-Analysis: v=2.4 cv=QdxWeMbv c=1 sm=1 tr=0 ts=6a4216e1 cx=c_pps
 a=x8MjW6KKBoBq+i/1BMmcjA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8
 a=SiyT48bRFmsRPwTNcj4A:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: ofNBcwN72x3-3WG_zJJCvGfFDCCB4mUv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NyBTYWx0ZWRfX5q7hN2PeFMO4
 K0cauwCOJf0RjowiuWim3RSu5uOD8Dq71FGk8E/m6N2HYG25CFZGKxADBbi4szBnN2iCmnumsjR
 ompU3mYvwgj9Pdg19SyVCBAm3iOP2opXT3OvO5f7avYmgqu6naaqAKNBwLpstEJvfxO/d1D27Sj
 ly0TKnSNr2ZSAmJu3n0WPaUQYZScVvSmUNWC83bDXiLd+yJzonktcHNdjX8LeIifJwzQ7sd7+Qr
 poJ4UMOjy6SyVpbYoII33/YVk8ANIOP+SRQ2OoFlWZE9IeiO7AUdcxXFz82yN72r6BBeqS5lopy
 fnrVB8vGaWGHUaYfNudDgzjX0ecR6+Z11QBGDwk+ANloOdytK43/wFkyTPxtKb7iVPkKzaLN3r9
 4BHnlkh1CC20kYXEVlAW7gGKmB2t/drz1W+bUd8R7JYuZ0FlwC7zVocRl/c6l3Q/LZH0y9mBqiq
 TtFGUb6kVJBwwqIPHzw==
X-Proofpoint-GUID: ofNBcwN72x3-3WG_zJJCvGfFDCCB4mUv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NyBTYWx0ZWRfX/L9diPvQuoED
 Vox4RyoYjCZ3W9WzdzqOR5AMb7tlrqOqnY8OsZXQGS0YYl+NBdd+4C8j3mYWpuIIPxqtI5pxW3X
 pVS7dhe/VD7h133Fdh+HhgDtEqQFhyo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290057

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
index 000000000000..81c71ebfb7e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,am62a-fsas.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/ti/ti,am62a-fsas.yaml#
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

