Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.111
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795759095;
	b=WneLczHlEl9CrI0l5Ck8Up5D4e+bAumgxwQzdaECtZuiHO834isBRNYPw5zy11xddcFe
	 /gmAowWe42tvoVa7IzWix49HWhO6W5o6UNggQxS/VueKTGNQ/7yzDtYUFLnufXty07luv
	 9CL5+vNIY/ewrAUvfeF8Y/wDnKj1TeIaIZY3CL0pVxKkX/hnrzT0eI1pjob4CKSYkWqJu
	 QIVxieIPKS2zdWCffI0Gn866hxlma+gRF6HOR4bJDG89bSYEXG9EpMoCETFcXwb6xaA1T
	 jibappb6L1LdzI/fCHjPeHXxeghBJQONYDnZlbQO3XjyPl97lRmfBIoJp+VHqqq6tyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759095;
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
	bh=I1JsXvxllIKTn4cgI3Kk2+/fii/beOVz9tnS46wt5dg=;
	b=dNHEvQwP8R7ivDw5wSxTKtzME0TgWKwmNNhOOqjBtWWwp/7kFG4wYo16NTj2T4UFNJ+C
	 BTb6g08M7kVnTqUX/UlBv91ylaUWHpbcQz2+IdcWuHR9Xd1P6GDIX+kBBCKrV3ql1g2DG
	 YpxlfFugq5UzWgX/DgmMNvi9UJ3xP/iFSbvNYyt6yTMyDbwgadiGP7Ugko2svEv7mUi52
	 +roYdVrcnjvF/P8x8LXLv/xZT9Fo6K02aZNU9Pvfxp0CXPO+IoAfOTCmDUGbwo4LNVd2y
	 ePdbhWMvVLKByXaIw81ebCwZVGXr1OAjSvLvtX7B00zd+NDyOchJR16WfkEkzRKidaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.111
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023111.outbound.protection.outlook.com [52.101.127.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7EA606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC7EA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ML2sJM9G6GMRkKVsYHysG6elLZtnS9fueh6FT82q8iwKsXIty/ZUwmT1vSKaK1avIQtTOYjB4evftemQdRoGV9JOhGJhMyPUWds8EYicRm5ztusnFPzJtXLKpNvU+cg/2gabZoApldJl4FY9Ydbdczstpj4S4zlKUg1eqfMmqdjr8dj1QoOrT26q9eeUxcUbOswEltRmpICROSKx/mUQmqpegxXCM9Iuw1HA76OcYQH7Z3Zbe2Jr6010ILNbeIgwVhLPIi3Egz0mo9NcpzSqyXX5DqL59jbyRDPBMLoBIpQY1WwVjSoFQ7Y0JGbRkv+TKhx/+kxHyORAJKBmXF15/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1JsXvxllIKTn4cgI3Kk2+/fii/beOVz9tnS46wt5dg=;
 b=FnKZGxAu1T7hotGHNZMfrdUNkbjEEbjB/YL2FqswYDSIZAodZ/Isi2ELR6EkibOnx0rbvcaP0fm8Ff5GvdZxeUcxsllLAJYq+veJBMQs1JdyXa/w9yxQjW8Cd76ZSbwdJ8Oz8PvcRF0BidGbkYea6S6fM+hRqYSUx/nPc7HaIIQQiqqJJzwGv80ntrONOKz0pe1eB+ZXTzAYkOwqHEaxbsxvo0AVubqI4xj6T5Kg7OiNCuDeFyoWhT6DRgLmWbnv+bhDZs4jSc2niIyrXr84VO9mIFBvaL6XkdiMSkvGAb6SGgY4WarO/WJNrT0o+dHv27tOtsoADHYa4H3QCJwkzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=bootlin.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4P301CA0047.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:36b::10)
 by TYSPR06MB6796.apcprd06.prod.outlook.com (2603:1096:400:47e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.688.4; Fri, 27 Nov
 2026 05:58:11 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:405:36b:cafe::3c) by TY4P301CA0047.outlook.office365.com
 (2603:1096:405:36b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.9 via Frontend Transport; Fri, 27
 Nov 2026 05:58:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 05:58:09 +0000
Received: from localhost.localdomain (unknown [172.16.66.33])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1378C427EFD6;
	Fri, 27 Nov 2026 13:58:08 +0800 (CST)
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
Subject: [PATCH v6 1/5] dt-bindings: display: add CIX Sky1 DisplayPort transmitter
Date: Fri, 27 Nov 2026 13:58:03 +0800
Message-Id: <20261127055807.109667-2-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261127055807.109667-1-Luo.Liu@cixtech.com>
References: <20261127055807.109667-1-Luo.Liu@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|TYSPR06MB6796:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 591f0740-677d-4f03-2930-08df4c4b69ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|82310400026|42112799006|376014|23010399003|1800799024|261009223027099003|261021135927099003|10067099003|56012099006|261102123227099003|261028144727099003|261021121427099003|261022105027099003|261026140227099003|261026121527099003|261009221227099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	gXVw/JV9CxXCe9HkI5C8jHv544pGlK8l6TmOoPhTpcnKyR7ClCA3FHm+Q/LrppuOETHW14MVUJ/nXbJwJVPHPwdVMutySgNsRTE81xaa+ZC0FGLfLQwTgUwwK8BvVWB6XFSY69NsqXV4x0cusIEoKCri/t8we9/iIWmgjN/tISlWCHS2QdFALdBBbOmmpP9n2TaxwgqFA+D6rtflfxuPO6KoRT+bg/MCdifq5yCfcjI/9ntlhUP/ueb24UyqE5oXxNamQDttBfxRs86t1sXCq7uT/ybn0tL9SnXw8DMkWDVMWWnlhGeWUfjC1nHIwb16maZhZQenKoZsnfx2VosQngUkK4fNcrl+OqgZUR9hI6oxwfL7tOjvaoXwbzVrnhFZCBy5ZV5zq5IArrOO64Nm8bTVgQdRnHaXItAaUHmSGEb3t6Q+uFG/M4xcQLEi9AWV1o4x6yRPwWmhejRAa9QfMezQ0Fj/voowP+ovB9ENEiOBMZYK/CVDf+dJmW9/alsb3kxD95hHXmADBPpIfyXaWrRJSNseJ1KC8UJS0Dhbb+vvt/LbVM5vdaHs3ktXGqWi3K6vKZcZ1xjxiLY/ZFW9bWMmOsSGCMj+BFoAFZmdXwvaGx9+2ITcVUeE9ko9AMsho80ttgl9cpYj1GiXBAKgFg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(82310400026)(42112799006)(376014)(23010399003)(1800799024)(261009223027099003)(261021135927099003)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026140227099003)(261026121527099003)(261009221227099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	K/UQlySSodVdq/ZBHt5B4nkqffLwwl6WJ2S1FFwRkcZTftjF7wXZ3OkC0yVQbfJamldw3kENNxwz2iHSNkw8O6sKmFd+eU98AgvRo+uXi49DZwi+zDtZ7SW+2oymxdw2K0yJJCM0xhG+0XcE8qajankmV7rel08bKuGxThfwxElOn1Mi/CoMjVb3Qmdqko74K8XgsdEBziaRYIvsksm/qNrGRWs4NCcnAv3xL8E5Div3hP8U549TsCa4m+Q0ZogvGOi//p4JZ9twn0X5MGNY96D8NM/+dXwGl35QsZGSHJQjDAYffYWb2wo+2Cj3Za/HRC+WvhylNjq8E2IYtT1xVuKjTuUTnSj5DqS8zRieK7LFzT0OMLKRUYBu7bA8f3vAHvlnEPhetU9SmRuIiR3U5ZTq6IO/vpn53eA3ITo4jna9Q7iRoSRKCHCz5n7Mktn0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 05:58:09.1011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 591f0740-677d-4f03-2930-08df4c4b69ff
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6796

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
 MAINTAINERS                                   |  12 ++
 2 files changed, 145 insertions(+)
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

