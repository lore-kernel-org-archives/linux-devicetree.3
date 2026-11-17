Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.76
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794897960;
	b=dcuydXh62Faayl/fF27BCMv7dY/8LmdPBeapR+kOUmecihU8igBzqoJLzw16voGfkFGZ
	 NLJ9gpKG/VZbzUztXCVvT4FFf1WVGX0vLECVSzJxM8GyMVRt553rIza5YwzDtIpzHcaPx
	 WD43Hvno0rPJWvZalTnvflP+UdNsRpp4jxNz67ulCvtwjm6YffzYgJ7MKXTdNQCEzmjEQ
	 JjZdyuQ7dlTwNrpNWNGRoN/pH23rT73rKOLVyg1Mz4f6hch10d/tVajz6bXsNpdk6uWLa
	 fiHzX2VesIqxFbeZIkUYwsrOfEGN6/gDQDmz4yA2KfDyclMIi/l7DdU1gWpFZT6EB0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897960;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=25Ko08uJ2oaZ6RdGr4pw+6a6N3d7d4Pf7+rWmh7ePzw=;
	b=Tv1FY8aImayKvqYqlOlfN8YWqfydugCfEodlyNtbx3faUBdTF8ZF5pmg/zMTZ0Gsj73Z
	 tOGnEidw45w3+RvuoHagrJPrRbYxv0ziKKk+YDPlKOvEqaCz6wNhncd2aPq3bSPJ9lbcc
	 96X2xFOLfE55eLSq9+cbhJWGddIkxPKw/fj3l+zJdN0xBPAW8hY9TBgyB9XyxIkSsNDGW
	 cJafjY73xA6PGv20VWZ9uVyh8wNUfzNfFl/XrpZ6izlTD9FtrCGRoc81ly0eweZmhMRqI
	 Gk0hzMaoRkZCA1S9lYm/NZM80+vXxeIvkm1944yEOvxCQVlQZpze7wZyJuS/VVopodQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.76
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022076.outbound.protection.outlook.com [52.101.126.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F0E606A323
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48F0E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUa3u+Q/D6z6wgFonkKxcoerOkkdc5wh+TgvUq6KEErX5koUjF9MPXemrAYY418wBxeJ5kWG0EViHf/LPQrwfa+88Q8ljLUKzO3i/DxogDivFxB274dl1mx6cWSEARg0Yx62itvlVutMPFs67QbLyMRlWijsJUuagqHauHUAlq2l5KKykVWC0A09UP1495rLhF0hJOh3HuadSk2eswnw3XQieUdDFejpMCybcTlWBHmMKXDocYqfbMgmQKz/ttkuADoANOIFwgxOWIACx5kz+exTprqLEZW12HrlO7Ojl4YcHgwODqQyt2keTuYn5hetdRqhiINHEoqeKkcGQNJ+Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25Ko08uJ2oaZ6RdGr4pw+6a6N3d7d4Pf7+rWmh7ePzw=;
 b=UL72f8/P7a9tD19pguA/aElooVXCRfH9erY1as0OjwsA1UMDwAx16qSgCyEj+XSxVPYPVFFfyesP+opV9jy5pNpJDIJmol1LCfFdbmjTw53nIQKZMUnw50fiM3A1H9vcnQdhIltUXlmBdYo4v9u8HxoUfKKqF5mmYZYRePVylr0k79gee5pMpVUwGIvVq/xJcxSHTyfJWwsZRBs9tmXhPzlrMu+jGmXq4rn0mmqtY+XN9JZj5r4vEzlov6sJgn+jG5dVEdW9kMNeMBQonxksrPk8afzIh/kPP5Mwdl7J8mLO4YgHfacXQrTsmn6gxC3uEtgkhCIrpMR2QnYUisuZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0072.apcprd02.prod.outlook.com (2603:1096:300:5a::36)
 by KL1PR0601MB5677.apcprd06.prod.outlook.com (2603:1096:820:9d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Tue, 17 Nov
 2026 06:45:55 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:300:5a:cafe::83) by PS2PR02CA0072.outlook.office365.com
 (2603:1096:300:5a::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 06:45:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 17 Nov 2026 06:45:54 +0000
Received: from localhost.localdomain (unknown [172.16.66.33])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B99D4427EFC6;
	Tue, 17 Nov 2026 14:45:52 +0800 (CST)
From: Luo Liu <Luo.Liu@cixtech.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Luo.Liu@cixtech.com,
	wuyi.shen@cixtech.com,
	cix-kernel-upstream@cixtech.com
Subject: [PATCH v2 1/2] dt-bindings: display: add CIX Sky1 DisplayPort transmitter
Date: Tue, 17 Nov 2026 14:45:51 +0800
Message-Id: <20261117064552.85256-2-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261117064552.85256-1-Luo.Liu@cixtech.com>
References: <20261117064552.85256-1-Luo.Liu@cixtech.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|KL1PR0601MB5677:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d64cc436-7a7f-4168-4174-08df44766d92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|42112799006|23010399003|6133799003|261009223027099003|22082099003|18002099003|3023799007|261026121527099003|261026140227099003|261021135927099003|261028144727099003|261102123227099003|261022105027099003|261021121427099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	yWhdrX4I0B7ElS85WazSfxPL/v76BB/BcWb4uokkXF5heRECAsAlgWwD71twlzdJTqRWVP0cNsiveLAIDUbuLuds8fnBb9tpZf+l06Z7knhRK0DbZVFwTQiwLwzkIaURSdBfQ1KktWM0wMvOlT54eHr4rQrMuce0/I64zi57lyqed8RiKpc6x0T5zCWFpEAvCoNb3U+esthp6Ulla4FWcR0A7y5VR2x91haPuzU6/ZYDJL0THgv3EVx0IIj9c2YYAp5/cLxrpHaqEop2O2/YkMA0SrATW4EE/T+QXfu6sv5btSPLo/rxEIabKd9TK1tlnHoaj2H0gemOcCjXHybzpVQ48zmgulNGzSQGEdRNL+08coTqaiOAkqW6vhkfUkmgg0C5RQPhhqr84TjP56GhAw5Zu96+eENXtgF3yW8FDgEpvrGcYi465WiFT/7fa+d8QQHRYFTCqkGYy444XbxT2egun77M0pH80OxhFUuRo1JLlHNtwptshedGG4QjTzmJ+gOlSWpANnq1LRM1qnl6YmShIoPrMsHjhaMKgUdb+fGBPetK2Te6KbQPY3ZzdwnbOY9r9gTytbx0oN7heCGQ4CvUvfV7kLdiNe7mceQ/H0fIJ4oCEDEtP8yvp43Ak1UukgizDNL3CvQpkoXo67RyJA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(42112799006)(23010399003)(6133799003)(261009223027099003)(22082099003)(18002099003)(3023799007)(261026121527099003)(261026140227099003)(261021135927099003)(261028144727099003)(261102123227099003)(261022105027099003)(261021121427099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9mnB/br/LCu440e+zN4k3MDoLlM3ADyYI88EzK+w7Q3AC8fSmv7Y3OLoJaJL7ZHgE3IvCzQ0labFhp/lGOI/dANbhGealqNDzKkLFavXJ60nH0IVC7eWiqGsSyUDW2bdFgL5Zei7CM8AzPMOrce7igLrYNv2jrTPRaB81kVCIdmnGUqqaDCTO4okbRQ3NNqTFAS5c1++kX5O4X5ZHYsrIw7iRsVN5GZQBYNfPtNwfrB8BbFc/565uey8oo+eWPLF+4hEW2kVLo3k3BVA/B8529VxV/dpNIf52O5mQdnbovJQ4a+dSiwKx3MH2UMGqiITtK8+o3s1H2JBovVjj6ePKuKeaLanuINFW7efgfyDSKEbCChURc2Gac0m0e+hI3PEuvT2Js/agTpzMQ8EhSbFWlonf6MjeGJ4qWa9Pkw8SztTlin8TmyusyFjzIffDR1D
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 06:45:54.2782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d64cc436-7a7f-4168-4174-08df44766d92
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5677

Document the CIX Sky1 DisplayPort transmitter. Each instance sits
between one of the SoC display pipelines and a DisplayPort PHY, and
exposes the DP register block together with the RCSU block used for the
link setup.

The USB-C transmitters and the native DP/eDP transmitter use different
RCSU layouts, described by "cix,sky1-usbdp" and "cix,sky1-dp". The
controller is a DRM bridge. Its video input is linked through the OF
graph, and the DisplayPort PHY is referenced through the generic PHY
framework.

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
---
 .../bindings/display/cix,sky1-dp.yaml         | 99 +++++++++++++++++++
 MAINTAINERS                                   |  8 ++
 2 files changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/cix,sky1-dp.yaml

diff --git a/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml b/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
new file mode 100644
index 000000000000..ec6d02989b58
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/cix,sky1-dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX Sky1 Trilinear DisplayPort Transmitter
+
+maintainers:
+  - Luo Liu <Luo.Liu@cixtech.com>
+
+description:
+  Trilinear DisplayPort transmitter on CIX Sky1. The USB-C transmitters
+  and the native DP/eDP transmitter use different RCSU video-adapter
+  register offsets and bit layouts, so each has its own compatible.
+
+properties:
+  compatible:
+    oneOf:
+      - description: USB-C DisplayPort transmitter
+        const: cix,sky1-usbdp
+      - description: Native DP/eDP transmitter
+        const: cix,sky1-dp
+
+  reg:
+    items:
+      - description: DisplayPort transmitter registers.
+      - description: RCSU video adapter registers used for link setup.
+
+  reg-names:
+    items:
+      - const: dp
+      - const: rcsu
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: APB clock of the controller.
+      - description: Video clock of stream 0.
+      - description: Video clock of stream 1.
+
+  clock-names:
+    items:
+      - const: apb
+      - const: vid0
+      - const: vid1
+
+  resets:
+    maxItems: 1
+    description: DisplayPort controller reset.
+
+  phys:
+    maxItems: 1
+    description: DisplayPort PHY the controller transmits through.
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Video input from the Mali D71 display pipeline (Komeda) that drives
+      this controller. The link to the sink is through phys (USB-C combo PHY
+      or the native DP PHY), not a second OF graph port on the DPTX.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - phys
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dp0: dp@14064000 {
+        compatible = "cix,sky1-usbdp";
+        reg = <0x14064000 0x4000>,
+              <0x14050000 0x400>;
+        reg-names = "dp", "rcsu";
+        interrupts = <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&dpc0_apb>, <&dpc0_vid0>, <&dpc0_vid1>;
+        clock-names = "apb", "vid0", "vid1";
+        resets = <&dpc0_rst>;
+        phys = <&usbc0_dp_phy>;
+
+        port {
+            dp0_0_in: endpoint {
+                remote-endpoint = <&dpu0_pipe0_out>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..e3557e931c94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6522,6 +6522,14 @@ M:	Satish Kharat <satishkh@cisco.com>
 S:	Supported
 F:	drivers/infiniband/hw/usnic/
 
+CIX SKY1 DISPLAYPORT TRANSMITTER DRIVER
+M:	Luo Liu <Luo.Liu@cixtech.com>
+M:	Wuyi Shen <wuyi.shen@cixtech.com>
+R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
+
 CLANG CONTEXT ANALYSIS
 M:	Marco Elver <elver@google.com>
 R:	Bart Van Assche <bvanassche@acm.org>
