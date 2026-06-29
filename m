Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A6A2D0615;
	Mon, 29 Jun 2026 06:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715406; cv=fail; b=HP/lK0ewnzUwr17nNqNT+MnTHPV+h+za2LVhWo2DbY6mJw46/xQ9j+wxFfWdaEz6Je2rgL22NQboiUjE/6DbjH25v0Vkg1V3Gj18b2R1vUCk1nt4Op79g+6XzhmZwJcfHyc9pvg9Stnhx4TFzhQRriqhbM7bSAEpdPgDaO3Vmjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715406; c=relaxed/simple;
	bh=YeszPbGQc1gS/lj1PUql9Cnfu+Yje6kITtbGDt8tiO0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zzj7/G4P16GqyzLDfsDJfsuDdsjP5CRPLDbHKnmtu2QmCx9s9Q1iPYBOtVHKbS1hd6rPq5n3AtXNPEekan4z+TkFgHuA59cNtxPt793kW3k8mw6TsR8RIvyIoUwMzymSnm2TLWJ663hW+icN5KlZgxIKEPBFcZkC7XYUfIQ1cKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=qllH1FhH; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LJuJ5jxo; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="qllH1FhH";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LJuJ5jxo"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65T2d1ei870623;
	Mon, 29 Jun 2026 01:42:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=YFz5TYrtcGd+jcAtYwEW7z9GN6LczhY1VN/xksTCJ
	Yw=; b=qllH1FhHCW/XU8qLnhXkPcRNPk+SBVMwJko7JjV49J8OGbgUQ0ER3LT+F
	XR5pKs16cDUZRRvP8nM0XHjTU3BXOkdk3jIHfjebMi48mdJDw8NXSdK9Uh3p/Y7c
	XNHQJeQBU5mlpSkE/yB8dK07UzrcN5lmaP+0wJqvHLVpAM1MNPhsxyazE2nek6d7
	JhEjEBBuMIGJI1nNLAY7NUbsiffRrZqzRaZ/sbVrrrmAd8qRczdbWtNCRH47VW8+
	+Mh561wNJHexADqwdebVRoYJtNgCXi1WkGRIto83WH/3kCFSh2Ge/pRqr/tSLugp
	4aT77Ffj3ax5flz/+AwUbCpLHHWJA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f2yhmwhfv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 01:42:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htJ0oO2WKpPQXGhWlIIYk4p+XDZzq/2C2OmWyMHRco7LciiySV0cDDFp2iZWbgjFzDcDuHHaC6v8RygvP6d3zb4MlrcQgQp+uzBG3M5sh5HYK1HSiBE35deJgmjK2UuZM08RxuFOxWCA1VVTZkKRazgq5OdX3AKrD/2bW04Vdov3fmUA0bXMDmv2BfvkCu1alal29YPypXTH/TwKwecew8S7rpkb1clUO1XmCb8MqNs2nj79PpPYSSjSRnGOz8+Xl45sFAhYJ1nQxQOD6nhGY4ZDrSL3qKm9Krx3izj767icmHHbir094xKSG+zTy2jhV+0neNPNcryQXIXKAFoccQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFz5TYrtcGd+jcAtYwEW7z9GN6LczhY1VN/xksTCJYw=;
 b=uaYOeMX6JBKltPzxnNz9FeTn3vo32yeCEvJwykO2uNmmceAal0wVNvVwohCHCQy7XujndTouYeWkQYzNvA5ZWEQx/ynrfjKq9VvEoykTsvKYe5kpBLeTxMImfipND0VGl7bMKroOxNTtFYiMNiGlvmrflMwoQ1Z48lyS/r7Iirfg8iOzhephuaAPFhw+CXq+a62N1cejnmXP6gNULj2vi6ehARwcAl96R+clJCY2mlJ8LpM8O/A8h66rjhz4CHiJkS+jlIXoXyH0tgmZG3ejDT4+XK7U1IGk9wx0+wXcdPuwRw9zZEwXI+2pQWYHT4+DCRhu1RGTj1qnNr/L0DhxeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFz5TYrtcGd+jcAtYwEW7z9GN6LczhY1VN/xksTCJYw=;
 b=LJuJ5jxoZQ5s2a8ictcYXZSi5S6bDPgA401r+2vgg33XrDdJMVZK/P1i2p5RQi90XCPHsiQbc0hWkfc97HspZQrdgTfIqjPhhodm4sI7MaU3xDyoRibaBhtG7YvwiOQicxrBMTHYjCZAEYGQQFP+uK51eOoOsNpguDVic5zoA3w=
Received: from BN0PR04CA0076.namprd04.prod.outlook.com (2603:10b6:408:ea::21)
 by DM6PR10MB4155.namprd10.prod.outlook.com (2603:10b6:5:214::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 06:42:52 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:ea:cafe::87) by BN0PR04CA0076.outlook.office365.com
 (2603:10b6:408:ea::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 06:42:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 06:42:51 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 01:42:44 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 01:42:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 01:42:44 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65T6gd083437101;
	Mon, 29 Jun 2026 01:42:42 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <krzk@kernel.orgs>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <s-k6@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: memory: Add TI FSS_FSAS binding
Date: Mon, 29 Jun 2026 12:12:27 +0530
Message-ID: <20260629064228.860226-2-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629064228.860226-1-s-k6@ti.com>
References: <20260629064228.860226-1-s-k6@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|DM6PR10MB4155:EE_
X-MS-Office365-Filtering-Correlation-Id: afb493c8-3508-48a5-81ee-08ded5a9a451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|18002099003|13003099007|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	spCy5PJtXviI2rcOjL7SkJgnND8c8ahU1lIvtAaqXRqBCsxoHfa28iGQqgATqECx5xPIRp2PsaxZLKaQ2xQ9lQd2CH9/qzhSMwI8xuH5xIBy6lePleNLWXWOTpvBRaqr82DFcVlu3MRN2FL2MNSa3Ag3T91A3Gi8S0gXUEBo/BPMb+kmDsB21e28/uWUGpQzU9fS+krjo2BDJFoboAXBkqX0QR8KaJUSjOOYy977DY0v2uj0UzTq0IOMzAtvaRxEn2ajwGNF6BVZcX/nJmEwuUidnQpVbec9FQwfAzk+IkmhYTRx96mwT/NoacS6XKKkeKawcUTqGAR5R3WT7jt7mgMIu2DZpbQquRL1CSg5BHx2yLZr0IKtGwBfYEVq26UxYoxp2GIJI8KFURtTPyGdZPqbM5zE9xCthZwJfJjkasukasEiYRkMkzlghdOTN17r+9oMuu1VHR8Q9+m5zsXmTzxuKL5ziqX17k6Oa1BDr+7QzpH/K0jlrd94uCgors/VMlxsQ2rF5NFzlSdeTEjupdox+D43s/FW+PmZhpMo/+0C187iavT+9RYzVFtiUOrcvFdFI87coxgfz0KiwwpnLPvFSDrvlgxyxpxWA/3fF1L7bv4hJB6ZPSdvuK0HjsYVw2eSS44hrVdHnB8TXVEhBw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(18002099003)(13003099007)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1SEXUsSHzLxW8LwhEJiP9zRM7DD/sQChVre7n7k+eMzZ070GDEc+unX0iPg5OHYz3tU3YRpyYDVIvwwBvHc4q30J5aPkGBYA9vXtrIy8XrjmtcLNjEyhHO0UOduZn5D48LpmsIFQgqIT+xSN5qm7DwFPUqQqXbcWI8h3CkB+hy54JPW3gSLD2v8TAL4wezRth/DtDX+to4JVhBelZy+r+gBEKg4NyQs/cSMjtAr3VduxghUgn2EVL7b9tf5J0hsew9sL4nCjRUj7KB5sLnSFNtgpp4BdEMzxk1qhARyFPxcY8NGEZYVyzYZvG9RU23gxrQs1BbpPyPRj3epXZryS8tYHUkPxBY0Tkqyn1nAe5iy+aLInUWSSUqLE8tWHsF75PYQjXhCen00vSjcQdl6SEMwGWGXzkT63zG4S/uvHL3gUWYFjcXY0GNQ0ph5OZ9y8
X-Exchange-RoutingPolicyChecked:
	a1jIf8jn+TCQ37nTOMXf6Zsu8lZ+r0Q2+ewLnDnYcZhCStjjjrApEIVBNxhjbwBweHcEjwGzG2FlaUDTLhgBaoLqYv0OXN6BrhaIfeA2g2s63dOVLPJlFA06M/R04W29fDiFirLiLCrohRf1pDeZzMqvPbIWy5o7wrUSn9b5L8ldoYCUQLtTLZRSjOy3UJn8Y8iT6doeySgToORhDg4FYCLQ12KFrMFgeFe5Cgx9VyvHmEV2v1t4up90kJ9DaLheQY6bgDyzhlZvVDVlqmF3LHgkEaipxAon4lthviAMp5F19IROkv4P1t344mhT/YDSQWfKRnx36KWD8OyaY813zA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 06:42:51.4899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afb493c8-3508-48a5-81ee-08ded5a9a451
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4155
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfXwhRY2SSj66GR
 AjNS9hzi/mm5WPkWtPddAjBlRRa8WwrE625S3Vr5rheceb7bsEdUat4c0VWPEZdpel4+l8u+pSH
 kFwL2hXDluJ1+f3UdRx8hdZaO8+tx3Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfXyw/O60d9uxj7
 TA7mqSrtRYkmwSrAvpXFS1C30Hk98oJ6X6qYad5irdSeNK0K+DvzfeiqiqkJ7e8VBPTKapOZr6n
 Zg5PD3CD47hFoW5oDW0WQZuE45fJg52D952heeOmA+JkpOdx2uSZ6jJUp7GfXyscdHhWGQOagqx
 lz9E6snAlaIFtHZlNKCIfmdAzCYfWBaF+iL9Jagqp5iy4NWhZMZhOQDkKCb1ESKciUHrjcdNDBl
 S34t7Gjg7veu5s98LIaCqTQaCmliPth0+pxJGrWsyskmXJmp+a908Q82Yq43wOFeT+1FgXtM9ZV
 P0D0Ihp0p2JOKCoiG/32NTLBuR0qpYua6GOpsxNfu73iN3VEN/a5HHl0WBw0MJGXR+iOGyFDhPa
 q1BpB3KhdWi4hzMK6jOLwhmV7vZ9mp5VwaujEVZos/smqiOyIyfLx4OMBG+K0ozeQsOxIa5Z1ED
 osxirpBqMVN1wVUbavw==
X-Proofpoint-GUID: f2D6ulcLE0q0nzJ2rO_9touvljiJFhkJ
X-Proofpoint-ORIG-GUID: f2D6ulcLE0q0nzJ2rO_9touvljiJFhkJ
X-Authority-Analysis: v=2.4 cv=SK1ykuvH c=1 sm=1 tr=0 ts=6a4213f1 cx=c_pps
 a=5NePcLBJi4TpPzNSyn8y/w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=SiyT48bRFmsRPwTNcj4A:9
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290055

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

