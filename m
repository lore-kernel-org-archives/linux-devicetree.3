Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538865;
	b=VBDa8DbqCrqGpzA271KDwhX/lj4uLrb3W8l1GYrZ8K998d4/GFzjvFuFqTdNnqGGv2qX
	 pAeCE3pvciTOL6P2dpnCjJqZATlwgA2G6HVf+vGQDlw45IYkN2MpxO35RTEnUFBA1IelO
	 pfWtar56mF7hMDEV4fruDlZ1xT56OhkB09h711Q/TtXTRyupxSkBv+UmhINqqJXQrIM6G
	 znuNlecyLD1vjs1xqN781fwXA2KHkST8a+e0MpxwqPBk50KpHB7UK8IGvOy0Rmw1Wg1EG
	 /CFOEDmfUE2GSTp+WErueEZaXmWG8eXzyO4xisjqk9NaU4yR5JPBWeBCEQsa7UJeudQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538865;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=FYJm9x+OWSdMBIDridiKIbeBfBRYzDVI7qRaGyHUVus=;
	b=EcAw0WDB49g6IW9VGjL4cn9KqbUv5Fw6OZHiglY6ihrgbSd0+eWnMLlTUYGP7XqeGCg4
	 iOp5QBgC7vl+u5Vm5BvxY52nIhMFt+a0EYkWWt2HqCP6S6GGvYNJztEORJDZTsnwRMYcN
	 GWAAIOy5smd4/xLYn+x+gqcmEKrorXdXTFdLCfeFw3e/dtiKYNak8TJ1z+WGCuwfIyVBe
	 FMJW1+CKYYBwuAMMXOybJeYOYzm71cJfPPCRAhuJIqpy0Wr2qJUi6GhFNKSxg0FnK4q3w
	 sqHxpr/cJBqSicjZRNqpXkZI/1OuegEi44svt56894Z2Dgd8Ceui0Z4j/PwGWkkdU1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=GcKCNvvA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.66
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011066.outbound.protection.outlook.com [40.107.130.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3107606A68D;
	Tue, 24 Nov 2026 16:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3107606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=GcKCNvvA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DY2M/GZLM31d4Tf5Dt7NlrRotKRxVxAXt/5cULpMYYN4N9og6MAYNdQyh2/Q0Mo0fLlOmZHKWUtD0+iecZYoanjdcu+uEp24NuhRfOgXFcObuKlrwFrBGzJKZEmGXctXBGJvowKufuFLG/VFxfz3jrIPCQ7mZJL/c4/TCdfE6f7HKM1PmkTpOQHu1xsqfncI9d3MWtD7e9nkxqetefFznEmBfdDeNsx8SsA/XXpio0q7pbAH/vPJ5odWWNJ7n0zwZObjFVlXHf/JqCy/v+7597SNx0laLXnecu/g/HLcJmihbn0b7gHS2kG1FcJC0pwCJjPA2P8s5z7wzIshxwYI5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYJm9x+OWSdMBIDridiKIbeBfBRYzDVI7qRaGyHUVus=;
 b=NO0jMDRYjPVjuUwK99qznTXPx79qTrZVh924EJDwKA2DYKlWbEgRH/BOo3jEZV1AX03ebrO1Iz875rrRjsPti4uMeHNZbkCnMAYmXtYczBOzX9S4q/PhRSfjW1m0QvPseYRIXPhRYHRX4OE8iqrDwoU7RKvbx4KzQNKsjUBHnHQRT3y5grNG4MkwJVV8xBPxViM7syWp1Fq/y7VpPCfnEWmbkqQEf7EhqFv2/DkqtArIhkje0nV9pi55LQAWQb7fv6KHwWqFzz7vBlKxoI2GA5oGxs85AGXjs8BIqvCpouJF5/OnXKelZotwvAp/mncHdWV3f7Na0O+rz4CMx6PkuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYJm9x+OWSdMBIDridiKIbeBfBRYzDVI7qRaGyHUVus=;
 b=GcKCNvvAZEdQQfzBNj3ER5cMhIN5a3riMZAv/OhwIbPVC8wuWxV4dqi9oSvPTTPR/uLGLxXjzFXn19vBAsjdNR69MyRleBGmZ9Q6YsY5jxInNXZCMWrvktflp/u9V0iKj+4CwcHUAW7mHh0CCALSXpGhn3GLto4zQ80ocQ1AmrMas2O90/gw4accSOFQwu4KNseue/Js35Oe1y/i6vQXuXaViQ2T67WQq/FDpYhoSRJglM7uWBHL7djdJPB07Np8EQ8laUq2b9tyvj9yT83NdnoYsVxggJQaSNyHfQLlY+pwKIr/inZDLJ8VOJtLuGN6C1KfdtdsF6X052TBkNPxHA==
Received: from VI1PR04CA0048.eurprd04.prod.outlook.com (2603:10a6:802:2::19)
 by MI3PR10MB9897.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:290:77::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 16:47:41 +0000
Received: from ZR1PEPF0000E6B6.eurprd07.prod.outlook.com
 (2603:10a6:802:2:cafe::8d) by VI1PR04CA0048.outlook.office365.com
 (2603:10a6:802:2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 16:47:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E6B6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 16:47:40 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:48:45 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:47:40 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 24 Nov 2026 17:47:35 +0100
Subject: [PATCH v6 02/10] dt-bindings: arm: stm32: allow TAMP nvram child
 node for syscon
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261124-upstream_nvram_reworked-v6-2-ea0cfccc20b0@foss.st.com>
References: <20261124-upstream_nvram_reworked-v6-0-ea0cfccc20b0@foss.st.com>
In-Reply-To: <20261124-upstream_nvram_reworked-v6-0-ea0cfccc20b0@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>, Russell King <linux@armlinux.org.uk>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6B6:EE_|MI3PR10MB9897:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f2e6c58-47df-455e-83d8-08df4a4aa788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|7416014|23010399003|82310400026|261009223027099003|10067099003|11063799006|56012099006|261021123027099003|261026121527099003|261022105027099003|261021121427099003|261026140227099003|261102123227099003|261028144727099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	3LMQAuF8tyst4fMydSCsWvYFGPR5Cbja/7IRZWV2RnrJJyxsf9HfRWtT/ax9RUa4yKDDpysvUuv1hFoeIPkT2BUJz10XHIFe+K62wOFjZf0QMaBGqOSiRVRHo8pArxgkESGUbrXBYJ07KOaB9gNk2NoQ7MG25EHv1H17Fz7xbGlw/ZQwFCeVtjtriSfJF+YMUPs4ZoLhCqsomHeAXmREUeAAejao8zX2EZl2OEQLwqtursOc0P3cQe+rv5eDL3au8g/5yIBaYfPrl1JK7prli3M6BVH3iWJ5ZrazKGSoALytqoX4h0GpTYVAl7lERc7Df4rJXd0kbgj+i81lZFx0h9lRDHDzSI7CMoG9LEq9LRl+Io2xOCb0Pg+Og9+zq6YnfZP9rPjyrX+EcKW2AFGYyls4DJpagKhKyLdKYBE7T399IGlR4UKRL8kP8x6VklIrurHyVFXZrRdpflP07x8E0yfPpOyE3ziUC6wM7D97PPgK+eU8BGuCugyCtVRhkVHWJmGiENJzxgln7Eiqug+QFTzqCsQhOmkbx5ikdONo2IwkW8bQgXu1mVaJ4KvJ0ycAe6Rt4dNmfK+JxyLfam8WGwDKMt8KglhKcZ4ip323uFovoq9v3psGrTdijq22AGUA03Z9LdOrts/cnpyOyq3KSPNxiTsb9B35KwvLXUflCZEUGycRSemcflr7NZFswndNX4bFKWSby2dB3ke89HAInQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(7416014)(23010399003)(82310400026)(261009223027099003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261026121527099003)(261022105027099003)(261021121427099003)(261026140227099003)(261102123227099003)(261028144727099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cyGHtM+XHBGgZD8uGtqJVAN9HlKAFVW9t+Pv4Szs8zGR9mnC7Irp48ll3/Rw5W903bTScpae8LTpapdEeBE/OkiHbK9znmUzdTkaeN+egP58qZOlbgo7XGObvm0Ux5Ot5LTwpXN65li2nVJsyfP2Z2zH2G7EeHkF29mPzwVgOgepC3rYtuRV4YImH8Lc7PA99fm9J5u+hMjmxWuhDRxE4TVj45lDYVxi+pkCWg9Qt/cJYioo9wr4jswL1OFE4eI4Ea5Y/DDf+cE1D5P/oXs6NolZQeM8Jh1A0337Bkhcyt4d4lxcNvxxPQM1OIt/dKJFdIQUl6Htg/9BO1/00GDbyNvEaM8t24IyHGaB88iDRGklSTv5Y4xQzIfzB1EUhZVYOeOpC/eXv9iqN40f5ss+CExt59vwAyit5lPm2USkEDKKW0t/jJGSY1cGTd1ylkNb
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:47:40.8429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2e6c58-47df-455e-83d8-08df4a4aa788
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6B6.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR10MB9897

The STM32 TAMP node (compatible "st,stm32-tamp", "syscon", "simple-mfd")
exposes its backup registers through an nvram child node described by
nvmem/st,stm32-tamp-nvram.yaml. That requires the TAMP node to carry
"#address-cells", "#size-cells", "ranges" and an "nvram@..." child.

st,stm32-syscon.yaml uses "additionalProperties: false" and disallowed
these properties for the TAMP variant, so wiring the nvram provider into
the DTSI made "make dtbs_check" fail on every STM32MP TAMP node:

  tamp@46010000 (st,stm32-tamp): 'nvram@46010100', 'ranges' do not match
  any of the regexes: '^phy@2[48]00$', '^pinctrl-[0-9]+$'

Allow the addressing properties and the nvram child, gated on the
st,stm32-tamp compatible so the other syscon variants stay strict.
"#size-cells" may be 1 or 2: the STM32MP21 soc bus uses two size cells
while the other STM32MP SoCs use one.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 .../bindings/arm/stm32/st,stm32-syscon.yaml        | 43 ++++++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index a559f8b03b84..70266070c57b 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -43,13 +43,19 @@ properties:
     const: 1
 
   "#size-cells":
-    const: 1
+    enum: [1, 2]
+
+  ranges: true
 
 patternProperties:
   "^phy@2[48]00$":
     type: object
     $ref: /schemas/phy/st,stm32-usb2phy.yaml
 
+  "^nvram@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/nvmem/st,stm32-tamp-nvram.yaml
+
 required:
   - compatible
   - reg
@@ -76,6 +82,9 @@ allOf:
               - st,stm32mp23-syscfg
               - st,stm32mp25-syscfg
     then:
+      properties:
+        "#size-cells":
+          const: 1
       required:
         - "#address-cells"
         - "#clock-cells"
@@ -84,11 +93,39 @@ allOf:
         - phy@2800
     else:
       properties:
-        '#address-cells': false
         '#clock-cells': false
-        '#size-cells': false
         phy@2400: false
         phy@2800: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32-tamp
+    then:
+      properties:
+        "#size-cells":
+          enum: [1, 2]
+    else:
+      properties:
+        ranges: false
+      patternProperties:
+        "^nvram@[0-9a-f]+$": false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32-tamp
+              - st,stm32mp23-syscfg
+              - st,stm32mp25-syscfg
+    then:
+      required:
+        - "#address-cells"
+        - "#size-cells"
+    else:
+      properties:
+        '#address-cells': false
+        '#size-cells': false
 
 additionalProperties: false
 

-- 
2.43.0

