Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.135
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794966705;
	b=DacmFkclmlFWGhffPgCY+ZCXIfmswmHGiuPFjbCmNKZXupbYu/cAKTiY/YudkFAj+hdb
	 qhA1p/h2ZoA9iS7adZy8ueF/CeY/QfqkAVeTvj3vwuANsRIkxUUTRpZypRS4c7X/JVT0A
	 9R6ljWy9MaJ8gzxUeL5duvV7UU6bn0yddsrVO9TxYilmkd5fBqFKTjWdaJ+RYKggHNTmb
	 OfyTfxwWFKV8Jfb/nqlBbtuNhZ2+dJmvKyXS055Ok7MwTB5WfjYWfV4PFIVpajVQqaHdT
	 XzHzvaenP20WZEIbsq0pAjHuEx4+RzAwaEtlVURFmf1uCMOXOHnJv/TpRaBONtEMoiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966705;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
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
	bh=bDgjq6qt5mQy372YVXoX3SsrgTjbojm3RamylfK+X60=;
	b=BD+TpNCriE9OoUOWgAGRA1RQzMmfv9gtWNPYMyD23LW1NwEu8VfWquKU2KbRGtGlDYqW
	 TzZzsjX+VUDGnS/4oF+4BGWoMrhqdMF8XcZGFBpfm6rupbYD8r7kUC6idFpNSrkByNdfW
	 3Ksj8/+Jkr0gIYIgOUbHLJNW7o4xZWxnoM6hSx8UYtPkKzbFRuxgOwXsoOxzcxuqqJ5nn
	 UU3pVRKkzoiBCa16vSYyX0cT6CxIpjC/NdQMm5HxZNz7UwLi7h3jYtPvPomycPBmFVPtz
	 xFvIbBl5+fez3wXqQPuzw2EydKPDRMiixWxTYLFrePHsvMWIy/+hBaOVzeQmQbg1Qmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.135
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022135.outbound.protection.outlook.com [40.107.75.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4891F606A31C;
	Wed, 18 Nov 2026 01:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4891F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M15ip3u9LB8l2k8LgqmNalbzEhJKmdEQfZoqwUKlOobTFquLHYsKPGBe2YbfjLlocTpDsjnVWc306AQ9VW84r4JnrBurIYz5qQDDPYa3rh1pg15v1LYTyYCaB+th8r9n0DUu+chSTsvuWUGjN4alcfotI6iLdn38m8iOsTVentHDH1yazQAVnsejokpeK46uPO+xIjfMG3Z8iPJpBsr4btXlEyAgOG7MAwpAaNwlit9u5Z2ZtdkQGWyGWoeKEiLA918NyN34imqg7Pq9PqFP/wy0FN7j0OcRNx/nENVsv8UEfmq8fnKtrNdlwAUpMiwMIjM0f28AbV3tALwoVMlgqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDgjq6qt5mQy372YVXoX3SsrgTjbojm3RamylfK+X60=;
 b=QjuulCbh+NC0e5Q4QqmTZfdOGgYfAWqzsvK7OIhuhSRG4GGx/4QoUZfIbGysNdBeX2H8inp1zr9wL6t030uQALKzYV+vP0MMoraQiY6m/9o+tnSubLyJJ0OepFofk1HEmnUc2aRrcw1jHuVFdd4U1t3tJmXiC9ORNt+v8TRY5aZMNs0ihLnMK4g5nWnfpin1/+TV65XXXS5vo8N1yxNMfQjpR/oKVH3ke3XX7MyKifqwutap1qMDI7I2htvV9TsQI+x37kMR9/BrWw0ycEGV7RRmnpTXOWA49bNVich89nFZTQhwY9r+19AaVBzpFp8AnzxvnvFmTxEN4KryzmppQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR03CA0018.apcprd03.prod.outlook.com (2603:1096:300:5b::30)
 by SEZPR06MB842317.apcprd06.prod.outlook.com (2603:1096:101:23::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 01:51:42 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:300:5b:cafe::a5) by PS2PR03CA0018.outlook.office365.com
 (2603:1096:300:5b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.6 via Frontend Transport; Wed, 18
 Nov 2026 01:51:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 01:51:41 +0000
Received: from gary-System-Product-Name (unknown [172.16.66.27])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A00A2427EFD1;
	Wed, 18 Nov 2026 09:51:40 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: Gary Yang <gary.yang@cixtech.com>,
	Luo Liu <Luo.Liu@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 1/2] dt-bindings: phy: add CIX Sky1 USB/DP combo PHY
Date: Wed, 18 Nov 2026 09:51:39 +0800
Message-ID: <20261118015140.3559331-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261118015140.3559331-1-gary.yang@cixtech.com>
References: <20261118015140.3559331-1-gary.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB8A:EE_|SEZPR06MB842317:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8bdd317b-3690-4233-2741-08df45167e4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|1800799024|82310400026|10067099003|56012099006|261026140227099003|261026121527099003|261021121427099003|261028144727099003|261022105027099003|261022075727099003|261102123227099003|261009223027099003|20046099003|21026099003|18002099003|22082099003|5123799003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	xGbky2Nm3jZjFLtC63q4awjf0pOYf4sIdAof4ebxmwuBPWvdQlyUCKz9FvFNjNCVcr8svpLa1tZ0WQfYKJs+yiO00g4ZBlflSuW/OWv/+AH/odooB6v9coN1LxZPV32Ok1jW1CPySGFwkAQ9gC+2M3pyxOiPac29WFCQjzdz/ljl0MrKtyWO+F/pfpGNNRYEzlxNowRKWPSRr48FatksDvajZlnoLRGpE5z+oJ/BR/hBwtbyBMr8/vE8F9pfmbSaeQNMOK0SHO/sBCkbwfhKM/vBwqE8LWzN0wnHeYM3T4/OCL4++ycDBVbiqY9u0t/GCEgTjvj4ZGhpEo/qwIcKn7Y/XV50CYHUpiJSWtyfwB/1iqkxIgYf7GEGgDRiRaU+GgyRsPjDDYqHqsH/rU54fh2cadykOaNn4gyry+bQ0ZqoZU3OdxCN6oCE1nscgqcIrKdVMGen6XegeMwmIDjVyz2RjWgnOE7qoCWiCNuzLLtd3IIBF8zsByxmzKWcxdtC+X6diaVIHvF7qRj7TtSQx+dhkEz5dXOLaifB1uERNHJ30WLQt3rQSXe3KlDKtcNq/TWDs4xzB6ksyc+ltnvlfXQ6KILZB/Z8KazFDt2JhTefkLmi6MZgM8wHn1Ai7pMqEgdDPPyq+fR4Sd2OtJgtfQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(1800799024)(82310400026)(10067099003)(56012099006)(261026140227099003)(261026121527099003)(261021121427099003)(261028144727099003)(261022105027099003)(261022075727099003)(261102123227099003)(261009223027099003)(20046099003)(21026099003)(18002099003)(22082099003)(5123799003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nhUOq7SAjY+6Ek2/HauF9L+coqYb2CFaxarhBeM9uIy31cbseTq06hVCR8DP7yg+b18jxgeebFBXLaPwVn4RQqtjGnQIdEAUghJjd5G02DXllAwLx5Qta09LNIx3EgIQokXyKUs6lJVDJs7+vOBavmkRVfIrM4QrNorWMlMd9mh4ZdpnIQzhY2jD98yiD2sjGBsCgyQw3eFhE/fGl3rrTJiS4PDVXg7UMBfkbYpuD6IYLWjNGW7vJ2MizTGZx+M4+oxQ8b5nzFxO3vMS1t0t1GlQ4KjiILfw2X1kXX8fZflpi/kcPSWTdEJRJ+O8vf/lElRlHffF1Qbf+ykip1QlleAA14RVDKWaUQpi3OYku0fxW5/S0d4eEwnrfi3CMud3kFN56pNy6aEHbPJsRpgz34E8ziIu1xMFyaRhmNInuAv0LAWhyAP69z+wzF/WR77n
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 01:51:41.6300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdd317b-3690-4233-2741-08df45167e4d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB8A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB842317

Document the USB/DP combo PHY of the CIX Sky1 SoC. One PHY instance
provides one SuperSpeedPlus USB lane and up to four DisplayPort lanes of
a USB Type-C port; consumers select the part they need with a PHY type
cell, using PHY_TYPE_USB3 or PHY_TYPE_DP.

The PHY performs Type-C plug orientation switching and USB/DP lane
muxing in hardware and is therefore described with the properties of
the common USB switch binding. The plug orientation is switched through
the S5 system controller, identified by the "cix,usbphy-syscon" phandle
followed by the PHY instance index.

Reviewed-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 .../bindings/phy/cix,sky1-usbdp-phy.yaml      | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml b/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
new file mode 100644
index 000000000000..9bdd01e348b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/cix,sky1-usbdp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX Sky1 USB/DP Combo PHY
+
+maintainers:
+  - Gary Yang <gary.yang@cixtech.com>
+
+description:
+  The CIX Sky1 USB/DP combo PHY provides one SuperSpeedPlus USB lane and
+  up to four DisplayPort lanes for a USB Type-C port. Which of the two
+  functions is in use depends on the Type-C alt mode and on the plug
+  orientation.
+
+allOf:
+  - $ref: /schemas/usb/usb-switch.yaml#
+
+properties:
+  compatible:
+    const: cix,sky1-usbdp-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    description: |
+      Cell allows setting the type of the PHY. Possible values are:
+      - PHY_TYPE_USB3
+      - PHY_TYPE_DP
+    const: 1
+
+  clocks:
+    maxItems: 1
+    description: PHY APB clock.
+
+  resets:
+    items:
+      - description: PHY core reset
+      - description: PHY APB preset
+
+  reset-names:
+    items:
+      - const: core
+      - const: apb
+
+  orientation-switch:
+    description:
+      The PHY handles Type-C plug orientation switching.
+    type: boolean
+
+  mode-switch:
+    description:
+      The PHY handles multiplexing of the USB and DisplayPort lanes.
+    type: boolean
+
+  cix,usbphy-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the S5 system controller
+          - description: PHY instance index within the system controller
+    description:
+      Phandle to the system controller used for Type-C plug orientation
+      control, followed by the PHY instance index.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output endpoint of the PHY for USB, or for DisplayPort when
+          configured into 4-lane mode, which should point to the
+          SuperSpeed port of a USB Type-C connector.
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB controller.
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the DisplayPort controller.
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - resets
+  - reset-names
+  - cix,usbphy-syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cix,sky1.h>
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    usbc_phy0: phy@9030000 {
+        compatible = "cix,sky1-usbdp-phy";
+        reg = <0x09030000 0x40000>;
+        #phy-cells = <1>;
+        clocks = <&scmi_clk CLK_TREE_USB3C_DRD_PHY3_GATE>;
+        resets = <&s5_syscon SKY1_USB_DP_PHY0_RST_N>,
+                 <&s5_syscon SKY1_USB_DP_PHY0_PRST_N>;
+        reset-names = "core", "apb";
+        cix,usbphy-syscon = <&s5_syscon 0>;
+        orientation-switch;
+        mode-switch;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&usb_c_connector>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&usb3_controller>;
+                };
+            };
+
+            port@2 {
+                reg = <2>;
+
+                endpoint {
+                    remote-endpoint = <&dp_controller>;
+                };
+            };
+        };
+    };
