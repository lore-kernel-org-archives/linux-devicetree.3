Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.127
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794216390;
	b=rgQKLxXDpPrlvrMaiQveR6Cpe7eWkk97ZZuM92CdZo6ewWsK0pgoTOI/6tm/f9pyXr2V
	 fjy0wulEyhkF0Acv/bE6mYcBlDSV0KGAGPOjho2huWwXrb7vOqhv3AuPPgNdPVFVUVe05
	 pOOOXJExxyVlBO9qrA8jf7huoSEA3ycnCy62tZfNNlldsOPEOc6F4vFR4LyQmKwnrAYyu
	 aZGM7xZE5rqlh3w+A8EP5xbgCD+B+QDgV3aShr93i4q0NsChmatY892ho0W03rfA5lm7y
	 81t0A7hiv2Z5Cn64+GHVW5E5Y/OvQWHqDqNXDB3jMTrA4BwIkDRQKQdp+aEiYshKT2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216390;
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
	bh=DmrOExhgeDcJmUo2FuYvYlpYC/SJWWPXKEAH7LdIv9Y=;
	b=ovbXKf1vdtAdP6gfRbgB0louX945+y4DXqIhRDkoRHmPXxFEqGguYuzkx6lH0GhlvIb0
	 Eo0NmmKCOmMFyq8BxMPwJ0uzFkTQH+aPYmGYzQRvruBSm6oPcImpO6hY0d5VI29NKAOkb
	 Vw8IJJtn5WlkBzRncCD4givBR1E07cXUZAzSemIPtDYxibDgb3r8Qe5/X3vxjT8UfzvtK
	 TBwO7x+SbYsxTmmydvHRXpCtknL8LtXqzOjV8w8a8vsP7lil61NSMXPXUbd6RBjDJnB+m
	 tCCn72vNoCXcrho+3VJ1Tcj5ESEUDJPO/BAgG7YIe7B+jVam8px0leXKtur0k5SKwng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.127
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023127.outbound.protection.outlook.com [40.107.44.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1DF606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 09:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F1DF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxUYdIuR+RmjrQ6G9eJ/wvUSuicVo5sWzGtCNhN5ZtuFKPdSLLp3f1HmYEi7fS4GZ0XLoe3AGinqOqnV+5upznBwei3meFceQ6XqAdOV8mrRJozh3fStJZqAmqY3CBbnNykXHEvhRdFWVGlywKQdD+7S6lYD2WUrs+C5pHfzZe128/y+4ZiBpn2x55pSYLwNl0JD00iWqD29i1wU3abSoGzeVU5s1lf5k95PtXZQgASjy7x2++kFD1OEFbWYamGTyVWkkLsT48XeDBx3+/UZR4FgFLibzGa5/87Vxe4xfaIeN9mBgJ2k9aIwX/ZmE+Bno6rxKcR/Cnk18LtxdUKN9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmrOExhgeDcJmUo2FuYvYlpYC/SJWWPXKEAH7LdIv9Y=;
 b=NUWmYR6Ux95/F+rfDJEQCF2vXuRzj/u5EJXA31izUPtTjMSil4ALbL9zUnRPgVjYZ6PzT55yAAAp69coYheTPzTC5zdmqQKeF/dO1qlFrsiwHQey7uK7P3biWhZU3BtHViVsTCi3tux0f04YJYxyqIpFNCBhPoeNrT7flbQzycG2IRQcLZNKz/sm/E2a5+emN9jawrHHmCgdGz15grkPBxuSpi1ZbiLM3YaosdAJuS913Q5DyO11QROErs35bpVxcJdtbQ3weg25pwSLRILbzLTHXuJnoU0NkP0JQqyp23mw4WlEGqxHEAjEMrE4E+25kWdT44qs+QAq/1faXRON6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0048.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::17) by
 JH0PR06MB7151.apcprd06.prod.outlook.com (2603:1096:990:8e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.6; Mon, 9 Nov 2026 09:26:25 +0000
Received: from SG1PEPF000082E1.apcprd02.prod.outlook.com
 (2603:1096:4:c6:cafe::2b) by SG2P153CA0048.outlook.office365.com
 (2603:1096:4:c6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Mon, 9
 Nov 2026 09:26:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E1.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 09:26:24 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E79094102E6A;
	Mon,  9 Nov 2026 17:26:23 +0800 (CST)
From: Luo Liu <Luo.Liu@cixtech.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Luo.Liu@cixtech.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wuyi.shen@cixtech.com,
	cix-kernel-upstream@cixtech.com,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com
Subject: [PATCH 1/2] dt-bindings: display: add CIX Sky1 DisplayPort transmitter
Date: Mon,  9 Nov 2026 17:26:22 +0800
Message-Id: <20261109092623.102291-2-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261109092623.102291-1-Luo.Liu@cixtech.com>
References: <20261109092623.102291-1-Luo.Liu@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E1:EE_|JH0PR06MB7151:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c98ce607-4540-442f-f5b1-08df3e438661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|42112799006|82310400026|36860700016|23010399003|1800799024|261009223027099003|261028144727099003|261102123227099003|261021135927099003|261021121427099003|261022105027099003|261026121527099003|261026140227099003|56012099006|3023799007|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	p7BnZiEuMtsqbdlayz4/ltwfw6aSp71VSQXxF5wWrIfZtAUZiBogPEsY67yB8FBfdReMLAmFCYSxFYK6Mmo4j9qyu2NXnroAJ/mGtu3DR0cKkoN9JzfWVFBB0+qHjB04mH/CvzHZrTRLhZlLBndkeSH+UeWUVPdSXhThj/jDX0/NlQoOlcKfiMcjmCcseWYJGt0UlXvwpg8fJCb4rC73Vdm8GUP+g0P5jBNS2mdme+8U0kfveA0peuIZPr/+q40+nxKYIlOjX6l8gnwwP8g0zhB+7in8bEadHLml2EMs1lyo62Y1H/qn0eAkhkLKEGHpCWgnNlI+/Y2gieJvE+s5CXgAxUgXtCAPK8iA2sZGipgNymkb9xfBuRIh4PASZfK/+KREEJFENuG0L0MvN8sht6xHSTAqGLkljasaAqDnAeybAW72qWGcAUGFTfF8DgTvlAfTN0LoZuWn5HnNuqa3j1ZR6Z8HtQIphGddc7Fwcz4E6aFIyfF6aOKeL+EmKIDNeI44FjhDh5l92Xmb6oAQOWUWa089eMMRLsy38gYbaSo2+ls0ndHDtYd9XtwIT8AlN2NKlO1lyFRoeCB0E2dpWCypW6HRZjd2SdF18mEkZgqeOOrIVdRrJ7mgZFy7qJxt6Oj6WLqGao2LIZWBkGdoSA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(42112799006)(82310400026)(36860700016)(23010399003)(1800799024)(261009223027099003)(261028144727099003)(261102123227099003)(261021135927099003)(261021121427099003)(261022105027099003)(261026121527099003)(261026140227099003)(56012099006)(3023799007)(6133799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hDYbyRVsm0kN9SQ7iETG1SIAkqNM9GknfMVs1gclUEBmipWt/JDW9ftJDg5I7DTAYiWXokPyEWgeFtoDGrQ/P0TlnqTotYeJcp7bvQDNRgwif88oRQYL36rYViuPiLa4OErPY9wNxtX+MF9p440KX+yyIcilMNtCgYLd/UlYNufYDWYi3V+JdxLGp2q6HOS4TZAAadJchwf6miPmg7ZahUnJsgPZbms41ttszkrleTaEjQTevyN/9I84kbx4t/l4WHdqn+4cmOVEQ0Vk8WyQiHqQcRZhJ6dlOny1zYpmxSOl/MMhbL/cep5u82t7EIKgyzA+YSP5lEk6n3YFshhSyHCjOeixILkOqcAS99RepxRv69j6O/CCL7f47x6h33bNhd/5VlgdTGW491i7q3N44Rh0cARfKco59Z9znzzbVe7zcr+4+DrjJYdvNJO9tumO
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 09:26:24.5769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c98ce607-4540-442f-f5b1-08df3e438661
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7151

Document the CIX Sky1 DisplayPort transmitter. Each instance sits
between one of the SoC display pipelines and a DisplayPort PHY, and
exposes the DP register block together with the RCSU block used for the
link setup.

The controller is described as a DRM bridge whose video input is linked
through the OF graph, and the DisplayPort PHY is referenced through the
generic PHY framework. The RCSU adapter port, the video stream and the
maximum link rate are described by "cix,adapter-port", "cix,stream-id"
and "cix,dp-max-rate".

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
---
 .../bindings/display/cix,sky1-dptx.yaml       | 108 ++++++++++++++++++
 MAINTAINERS                                   |   8 ++
 2 files changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/cix,sky1-dptx.yaml

diff --git a/Documentation/devicetree/bindings/display/cix,sky1-dptx.yaml b/Documentation/devicetree/bindings/display/cix,sky1-dptx.yaml
new file mode 100644
index 000000000000..9087b5edd9f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/cix,sky1-dptx.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/cix,sky1-dptx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX Sky1 Trilinear DisplayPort Transmitter
+
+maintainers:
+  - Luo Liu <Luo.Liu@cixtech.com>
+
+description:
+  DisplayPort transmitter controller based on the Trilinear DP IP on CIX Sky1.
+
+properties:
+  compatible:
+    const: cix,sky1-dptx
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
+      Video input from the display pipeline that drives this controller.
+
+  cix,adapter-port:
+    description:
+      RCSU video adapter port of this transmitter. Sky1 numbers its five
+      transmitters from 1 to 5. Port 3 is the native DP/eDP output.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 5
+
+  cix,dp-max-rate:
+    description:
+      Maximum link rate the board is wired for, in units of 10 kbit/s.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [162000, 270000, 540000, 810000]
+    default: 810000
+
+  cix,stream-id:
+    description:
+      Index of the video stream this controller uses. Sky1 has two streams,
+      numbered 0 and 1.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 1
+    default: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - cix,adapter-port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dp0: dp@14064000 {
+        compatible = "cix,sky1-dptx";
+        reg = <0x14064000 0x4000>,
+              <0x14050000 0x400>;
+        reg-names = "dp", "rcsu";
+        interrupts = <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk 0>, <&clk 1>, <&clk 2>;
+        clock-names = "apb", "vid0", "vid1";
+        resets = <&rst 0>;
+        cix,adapter-port = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..7d5283d83022 100644
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
+F:	Documentation/devicetree/bindings/display/cix,sky1-dptx.yaml
+
 CLANG CONTEXT ANALYSIS
 M:	Marco Elver <elver@google.com>
 R:	Bart Van Assche <bvanassche@acm.org>
-- 
2.25.1

