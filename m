Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.118
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795672813;
	b=uQCouW3W3cdWiN9+sxoa0kuWBf0Z4Ht1N0/rXk7ltzscVQCevzqQ6eYpDBYTqYyijnkH
	 Gs8fbbyvOosCwneYn8Rm4qjKKyik6ogZQQ5LeYVda4aMplneskLOfeoklYKt0sN7JSHsQ
	 b4kjnDLLGB/eG5WylOsy8wkhYAiuOt9rZmw2F6u61B1l8RWmF/sPx81nv483f5lHb4k7a
	 Y5xhaq/Z/A8YLHS5UP9ZmyhVvEfvFODFUgvKFFLymMbZ+JqqGK12z3lpoFjcZ8RgF/JyK
	 wF1ZfSLnD0nHJr/e0jvHLOAuIwZOjC5c0xnaNzZyxTY38b/8Hdj35JVj4kApfRHpOtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672813;
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
	bh=SjK2BmJWaTE7508fdhl1ob/wwZ03CQlC7bQo3SBimhY=;
	b=RglpQnsZw4Ankjhg0LcI923KhYVrV8P1nuZHitpMCEH1l2No6pr+Mu7ISj6zI+EeXR2M
	 fwoDHLOe4tAs/hpH7bJii8ZBMhdCVC6cYQPoGYSdbXGTyl88fefF+pAFisBnfj3X33Bn7
	 KCMsnZyUlbT5xEjpMLt2dofMUWRzfwg/qI2c0/EFe5r57G+p2sI0a7doTqQRZ87VXuewH
	 9Xrb0R9FiDUDwKZeSzdcpjA12zOPRKO/CnF3ICpWYbXdtsLHWr4XRcsEDvV1HhfILNA86
	 2VP3jK2kymTqzq9/wU6e26y4M+hEYXR8s5WatbXgAialzi1U8faXtpdbtqpT+fFZQfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.118
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023118.outbound.protection.outlook.com [40.107.44.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F78C606A330
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F78C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yC1fUmVo8CQPNTSaQproijxZ8VZakSNu09/QOVpHSjtLSKeSNGyjJAtdUnUiIxdlDT5Qszz+q8jOlbVzv+7yVE2iHxhsnc+wVAdgCkL7yTkQzjYWqLBjFI0uArNYqNeBXMK7Z23M7CIUIHpAXSWPRK9WuJvhFMjKXYljeTcWvG0E+X2Bya0iZWRDGEy6/uq0U3Z4eh3vMmVWQgaDM1FkZElHp3RZGp9k38EBgqwIZ8xkQpiVoAApEoqWKPOA8+fR6HaEFYV37moJm/xb/hcyYO3qXe7UMeq810Xc1WisbQ697j4fxISomMvAoYwR++YR7mTviWrO7QGWQgxfO0ewCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjK2BmJWaTE7508fdhl1ob/wwZ03CQlC7bQo3SBimhY=;
 b=EJNGACRHh0WvS0qw434/MqFmu9TMPHvV0Mgv2F9hffh2axhHtUXyDyzhubw9LssJ+cx2fb1xhUrpnMxwlrwfh1Qpn1B15f6hyxeFlSXnpkOqx0v1mP3jv4lvblMP6xtIgo4pieXW425oufM6GoJCWoOz1i0qkNZRIysSmMVLoXx3pGzPhZZN3q4knw+s4vAA9CtFV3ZCTej3mmYRFjc0kN0nZWvLwOEIFYmbBayggKSk7yWO1E/MpPqDj4zQdlDRGpCcuUzdMapCCLelZdaz6WiTeiB6ea8zb0uSkMkcUkRX5jiWBXWofJ+0Kh5DG25W55qX/Jotpa8OSMf4OzDm1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=bootlin.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0056.apcprd02.prod.outlook.com (2603:1096:4:1f5::7) by
 SEYPR06MB5040.apcprd06.prod.outlook.com (2603:1096:101:54::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.4; Thu, 26 Nov 2026 06:00:07 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:1f5:cafe::29) by SI1PR02CA0056.outlook.office365.com
 (2603:1096:4:1f5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 06:00:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 06:00:04 +0000
Received: from localhost.localdomain (unknown [172.16.66.33])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id EA277427EFD6;
	Thu, 26 Nov 2026 14:00:03 +0800 (CST)
From: Luo Liu <Luo.Liu@cixtech.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	luca.ceresoli@bootlin.com,
	wuyi.shen@cixtech.com,
	cix-kernel-upstream@cixtech.com
Subject: [PATCH v5 1/5] dt-bindings: display: add CIX Sky1 DisplayPort transmitter
Date: Thu, 26 Nov 2026 13:59:59 +0800
Message-Id: <20261126060003.3979478-2-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126060003.3979478-1-Luo.Liu@cixtech.com>
References: <20261126060003.3979478-1-Luo.Liu@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|SEYPR06MB5040:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 81ad06d0-b1e1-4a2a-de92-08df4b828453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|42112799006|82310400026|36860700016|376014|1800799024|7416014|23010399003|261009221227099003|261009223027099003|22082099003|18002099003|3023799007|10067099003|56012099006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021135927099003|261022105027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	3QRUTMRccsP45Gg/VfJPSzOq04lKlcD5OuR3Uta9qzGDD0eUsiD36E2MF2sRWjtad4e+b/RIXTTDgNFK7rm2kZDIPRtjlEk8IKiinan1AA69RQ+IrGAa3L+T7bC6Wst55nslPTcn7rL9aHX/a8IDbZXlRmwEZT+Jz3cGptCHSAwLJnLW/rZGkzROG20xcAGgC236jbCN8UUc7hy5Tb2rv1tF1f8mKN6R2pPxQ9A0v/9MEMbJl09aQ/DP95m0Nqtu2pfap9LPmFiJPsGw9OSecAW3f5KwcflTDDFzkC60WXl6NMgBZNhx30mdhea14b8Ni9bSmXjzUhBvl/H4LUZSg99COTVJ+aVx6XupKb4L53HrlXNVCQ99of7YOsJ2uuKhhR9P3gm1tVruBkzMDVctrccwt7iYXoyncfBjT9wGa2ohaDqCZViCxCEpQu7NrZEcQYijOSp+WQI6CdknbO2vhqM6PHf2iLeuZEFX8VWejDtCIC+UUThCJVMCMTgNAnUHRkPKYBcS+VCTBUYVhPCQNIWvadtBZ6ERP9TCnZGU5HFPkEjkYy3hY7NwKfUE+uJ6dnSn0fd19KRLE24g9H+ysnDTPLO1oh3u7wbOKjpp5/qxgVlIyeLMxIHno2414Jhrr748Hdx5XKntwMYybZ9wXw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(42112799006)(82310400026)(36860700016)(376014)(1800799024)(7416014)(23010399003)(261009221227099003)(261009223027099003)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021135927099003)(261022105027099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aTqRQP3qSIys6pAteAy/uGQ9UbW+kW6HzHitX2FEkd8TQ60KKQ1TYxpgKd8zRjRk5ARl5SqC5//xGxR79xJPEvdezjAKTJytNiRZj7kcE98q8oReWPcp2wg74BBSxcaVyJPqSwWL6QdfTPskOmttoThpU6lBMhnQBXpt5TVB1E1ZeNo0QB4WF497EmjGR9TNcVXU5Tps/GR9QGiJlqu0kO97FsVvh0X0CLyjW2i0b55ueD2wFWD8j8YNSpHMVDMFPfMye37xrLewdPcj0kaN3xD4FngHwKXtGavsfKp29IB4jC4TAY5vI7qTFg16l9sQrmGQ/jbPQ9JifkF6z/NVJT6x8ssCx71O97iKyZSDq1IC6TuEaEEajKcpRSyiovukBADUP8Hw2DMbDQjowll8VbfzNY3CsNR2XqrQ90/m0323TIPz6N7uEyo/em142H3m
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 06:00:04.5441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ad06d0-b1e1-4a2a-de92-08df4b828453
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5040

Add a binding for the Trilinear DisplayPort transmitter integrated on
CIX Sky1. The USB-C and the native DP/eDP transmitters use different
RCSU video-adapter register offsets and bit layouts, so each has its own
compatible.

The transmitter takes its video stream from the display pipeline through
a single graph port and drives the link through a generic PHY. The sink
side is not represented in the OF graph: the USB-C transmitters reach
the Type-C connector through a combo PHY, and the native one goes
through phys, with the connector created at runtime by
drm_bridge_connector_init(). An output port or aux-bus can be added
later as optional properties if a board ever describes its sink, or an
eDP panel, in the graph.

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
---
 .../bindings/display/cix,sky1-dp.yaml         | 102 ++++++++++++++++++
 MAINTAINERS                                   |  12 +++
 2 files changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/cix,sky1-dp.yaml

diff --git a/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml b/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
new file mode 100644
index 000000000000..2cb4dbb8d5fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
@@ -0,0 +1,102 @@
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
+description: |
+  Trilinear DisplayPort transmitter on CIX Sky1. The transmitter takes its
+  video stream from the display pipeline through a single graph port and
+  drives the link through a generic PHY.
+
+  The USB-C transmitters and the native DP/eDP transmitter use different
+  RCSU video-adapter register offsets and bit layouts, so each has its own
+  compatible: "cix,sky1-usbdp" for the USB-C transmitters and "cix,sky1-dp"
+  for the native DP/eDP one.
+
+properties:
+  compatible:
+    enum:
+      - cix,sky1-usbdp
+      - cix,sky1-dp
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
+  interrupts:
+    maxItems: 1
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
+  - clocks
+  - clock-names
+  - interrupts
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
+    dp@14064000 {
+        compatible = "cix,sky1-usbdp";
+        reg = <0x14064000 0x4000>,
+              <0x14050000 0x400>;
+        reg-names = "dp", "rcsu";
+        clocks = <&dpc0_apb>, <&dpc0_vid0>, <&dpc0_vid1>;
+        clock-names = "apb", "vid0", "vid1";
+        interrupts = <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&dpc0_rst>;
+        phys = <&usbc0_dp_phy>;
+
+        port {
+            endpoint {
+                remote-endpoint = <&dpu0_pipe0_out>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..468aa1ef6eb7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6522,6 +6522,18 @@ M:	Satish Kharat <satishkh@cisco.com>
 S:	Supported
 F:	drivers/infiniband/hw/usnic/
 
+CIX SKY1 DISPLAYPORT TRANSMITTER DRIVER
+M:	Luo Liu <Luo.Liu@cixtech.com>
+M:	Wuyi Shen <wuyi.shen@cixtech.com>
+R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
+L:	devicetree@vger.kernel.org
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
+F:	drivers/gpu/drm/bridge/trilinear/
+F:	drivers/gpu/drm/cix/dptx/
+F:	include/drm/bridge/trilinear_dp.h
+
 CLANG CONTEXT ANALYSIS
 M:	Marco Elver <elver@google.com>
 R:	Bart Van Assche <bvanassche@acm.org>
-- 
2.25.1

