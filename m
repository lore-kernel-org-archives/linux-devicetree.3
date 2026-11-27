Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.121
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795765608;
	b=J41e2kgw/iUW0e73gPZzcuFatbgXDYU0HJXKp2r5mNUwo2O4v60THA2mJ3NFgoEotAan
	 RTdG1VJBALvau2xo8ymBXY2i1kqxFh7JaDKTxHHjvFYXOnLmJ3Av+IFmsQJlsV4IWrzRW
	 LUrwhWSCSiAeXPRhCU2LPAiPhJcrdQs9/fUaM1jDtqKy/CIhUW73UGfTrk9LX4LYNalWF
	 8Xl2OuoBlZcomMsPqpMpbAhxEADM4kvXjvBW3AdbMgOOQHydZZN0Cr2gchVSLSmcW8j+6
	 gDUL7HAfz5wiHQi27hhbnwpxUqTP1WvL6L+FYGbG34e6PLi8ZYZcaMggMS68xabVHgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765608;
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
	bh=F0eYnhcnNiH9y34oT8hajV/l/SxCCqew6QC2Qaoh/s4=;
	b=nMMqH8Egnr4+0Og/RTVbCAuJCH45n60NZVpamZG6Cv7v+adJOii6hok/3gcA9i2LLZzn
	 6KcY/OfbrOZIgBKwDiNf/S4XCBf5itYIWuYSlO7MI+C2WfLjZp5S+A9D9W85ILp8Rr5hi
	 c7zydACDMG/LuMax4Nk+wyCfrJAApR8lVACaa0/57yilonuVdC9YEzqG9936QWJLoLmLK
	 U7ABkNi4/r0zolUZtHdd0y6nNWh7lk6NoJX6L8ec58o/oTC3VibITsLeNQ+2UsfnCAcpF
	 2UKcl+RQQGZB2M7TNKhXqhKxTEUgcGganM7oLmjRNq11P3Ky9iLY/UBXhUtJtheFolw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.121
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023121.outbound.protection.outlook.com [40.107.44.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60C3606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D60C3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBgv4HTCoYbD7lQ3e8CpXT0rYXpbsXaK3CmUD+ZrU8yDWYGfcJaadSm4AFJ1p8A+WQII2QKhHKAwBH0k73SU++i76JGTRE9n9wIXpA0snXfKBRxgz961vbd3jSEW713NomTue2C5jgijQSGFqYwEwsph1ivTlcVf+o1Y8G+eHEfp0ek2aKCRMtAhW/IeH07N2Lj8WPzyVQcq5suMNzHhH9e/n1G/Ht61eCXLJUWPKi/7DPWzv9deXNiQO8MH8H+FzNozJC6S5IBRQDn2X3HF00O1IlSWg7Ycn+pbzBrJg/hjYKLPeZPGy/rCdVstBGoiWqiuL3jrCDa8pct1uQh6Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0eYnhcnNiH9y34oT8hajV/l/SxCCqew6QC2Qaoh/s4=;
 b=pafkTzdReoriuAop/JdKj7jVH4IlkBhzpaihkqfhsPVlAxtn1CIdOEISCqYskMY0Eaz7gv+tpd0TXXQ+ogb+rKojCyASypU5Ml6SZ2si3PfDIlk3JV6GF+LKEXVF6ldt8hZpRnoBbubrllEhv4F4UXRmRY36P5uTUn9hFvHfniErln54ULTP6V4tonP8C++09ZpcntBKMVGKPhhwse3DJ8itzcOF+aU6wDUF/u0ibTTrGUyZNWqwvaRoUOhEUNbQpCT5GH1T21daJ3S2iww2rvCkfTcFRAgayQZR/cKL1KF8vmicNcRUG077V0aaSHjuujgYPMxfuWb/5W/LOImtVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=bootlin.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0004.apcprd02.prod.outlook.com (2603:1096:4:1f7::12)
 by SEZPR06MB5589.apcprd06.prod.outlook.com (2603:1096:101:c9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.688.5; Fri, 27 Nov
 2026 07:46:41 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:1f7:cafe::63) by SI1PR02CA0004.outlook.office365.com
 (2603:1096:4:1f7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.9 via Frontend Transport; Fri, 27
 Nov 2026 07:46:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 07:46:41 +0000
Received: from localhost.localdomain (unknown [172.16.66.33])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1FF9A427EFD7;
	Fri, 27 Nov 2026 15:46:40 +0800 (CST)
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
Subject: [PATCH v7 1/5] dt-bindings: display: add CIX Sky1 DisplayPort transmitter
Date: Fri, 27 Nov 2026 15:46:35 +0800
Message-Id: <20261127074639.277959-2-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261127074639.277959-1-Luo.Liu@cixtech.com>
References: <20261127074639.277959-1-Luo.Liu@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|SEZPR06MB5589:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 64c43152-315a-4310-ba30-08df4c5a9352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|42112799006|82310400026|7416014|376014|36860700016|23010399003|1800799024|261009223027099003|22082099003|18002099003|3023799007|10067099003|56012099006|261102123227099003|261026121527099003|261026140227099003|261028144727099003|261021135927099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	8Vm++DX9LIfEg8OfeFC3D0/gYZWXoZIdU4hQWTl+SMY0Dpx6AdPcYb+L2XDHNJq/11bX7LUn4pqB4NvXzwe8uyNOy+9L7Kcm34r+6nJgn4RJYYUFWjTx9OtPiyVWnzW3UuUwuLLavd3T1zt4nY72jJ/GLWyJza6PWf6CtXy0R2rbIyDinwuf38RyLrcnySF39vNBIEgjCAbOSvQL9TF/czDWxHP2jcahgqG10fLt7jU0d2q+NrRFqhqrcHMzkSLADEGFGh2FnIlYCij6pJszF+LIV0H61U49umWwL4pGk1XtzNgKCHmxb9U3yufETRwY/21rsLhaVo573D2E46QsBQzPppYZzI+D1BplfBKZDuC9XxbrktxKmfUaPeMHvUAPN3BLaTgGloxkODWjGCVjWiafwWrThL8WymJHLC7q639nxwBGsXNlNkoH4oylYlc9nhNaFtXTMXER7GkCTrPbb3l4+0Yi9yKOBBmFfhIMYske9CPTaFlVYnJHLsqz7RCE5DJXVW424T1u63BQN9TeADoB6gEvxVh7/7JspSJ2ggEAW/ZYJl4WQWI3+IvFGCxPFClW02Vk6IkBbQ4Nii88/sZFsXs0IaczZBCsiwPRz6KmYx8lhsJb5QY4RMxrwrTrf6qLSSK5jvwTS8pRJmjemw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(42112799006)(82310400026)(7416014)(376014)(36860700016)(23010399003)(1800799024)(261009223027099003)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021135927099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o+ZBU9FfRm8GH2gwriEJXGO1+2kdMApf/46oyB3bWo8ahRc+Ma81BFUcLqklkvhapNROCllCsJ9GaFFVpMv2IIrdkaind/5LD3QM71Ba4XEaCH9e65R5M1S5jJkMx+H3R9QDchsE+LUUqwLvPBUG6Y+KW3vI4oXDNx3K1/SJlzHPUcUqgIMLZfDsx96auO7XlTTm4JaXEj2NqD/wv05+LJtQs1NYkw+PgA/wtkmSasQso7C0tP5rf3cU/fUZp3ilC1B2bYtvmjEqKVtapWUp0fJwVyrxvyqRIoMb0e1ooUYOvgljWqWBQ4Wc3F50zxUE9hwgLoiGZ4rYaefB/eCsP70R4nUkk9We8S43LQ4GixFQsWVr49N0ysnLBdfvtqvXw2HJK6wpALSrPZKwUAz4JLF7NPB+KWYCihNEr67vIbcI9XnJPdKXK/tRg74tT6LU
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 07:46:41.0041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c43152-315a-4310-ba30-08df4c5a9352
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5589

Add a binding for the Trilinear DisplayPort transmitter integrated on
CIX Sky1. The USB-C and the native DP/eDP transmitters use different
RCSU video-adapter register offsets and bit layouts, so each has its own
compatible.

The binding describes the full video link: port@0 is the input from the
display pipeline, and port@1 is the output towards the display
connector, a bridge in front of it, or the USB-C combo PHY that carries
the DP lanes to the receptacle. The driver drives the link through phys
and gets its connector from drm_bridge_connector_init(), so it does not
parse the output port; the port documents the board wiring.

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
---
 .../bindings/display/cix,sky1-dp.yaml         | 133 ++++++++++++++++++
 MAINTAINERS                                   |   8 ++
 2 files changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/cix,sky1-dp.yaml

diff --git a/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml b/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
new file mode 100644
index 000000000000..d382e38637b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
@@ -0,0 +1,133 @@
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
+  video stream from the display pipeline through its input port and drives
+  the link through a generic PHY. Its output port describes where the DP
+  lanes go on the board: a display connector, a bridge, or the USB-C combo
+  PHY that carries them to the receptacle.
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
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Video input from the Mali D71 display pipeline (Komeda) that feeds
+          this controller.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output of the controller. It connects to the display connector, to
+          a bridge in front of one, or to the USB-C combo PHY that carries
+          the DP lanes to the receptacle.
+
+    required:
+      - port@0
+      - port@1
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
+  - ports
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
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&dpu0_pipe0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&dp0_connector_in>;
+                };
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
-- 
2.25.1

