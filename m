Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010021.outbound.protection.outlook.com [52.101.84.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49597481A93;
	Wed,  3 Jun 2026 13:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492867; cv=fail; b=KoACwa7KAd3SmnEdPckgxAlFXwzDm1yP7eLNR+xYPgjNxlqVl0wGi2g2VvJyvCRwmhHt17kAixkEzkW1p1TMas96TdPyESWmOIi/b2tvSUBdqc4e2U+MTRLa3/i9LqMtUqD0fBY2Br/qyKWnxxE+QO05QAck9o6/6R/fLHzg/Zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492867; c=relaxed/simple;
	bh=DzkzEcNFrrvH8Sih0s7YW1mT4yKNmh4EYA+ID7cd9qg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ErukN2weBbG59xSLr38N4qXyck8bA7wBlBiYfqDCN3oXT2CVJYUh2hyuUTofXdUuMFm2hsS4uPtBm/5vG7dcHdn8HpVte9XIYKixLF5kZPD6E8IRoj12em64d7RLUAXjvn8k1LoxAfZY8naNuFR5UcDrkojMmTJS2/7XZ+j5E/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=f04+Ff/a; arc=fail smtp.client-ip=52.101.84.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="f04+Ff/a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+Yn3e7ZdmtH6OCxMXeucvccKBqq3KEAItb7aAjpyg2sw1yU7YfXDVKL5mzH/NWAOg57yOtntZQII+uqvjnarrpufz9ksTfVqfS2Vqc8nTR4YQjrXm/ZbCxai/9c+vUtfF3hVxQHcC21IrAYUXFjFyH0vENXqe72gRFB2mPC7ye8JdXsUqOWPvTosQtLJfkL1+EFCJ9aAFPeNYeAw0PrLZfkn+Y5LGaCXVanydzydtXb9o7u8Bi2cbOZgmBI2IvkSFSGsnE30l24JmIX3UBliOZ3eBjMlQu7x+XoQ5HbfwT2Lrbe7ZRihiv70Uc42wvKCQIHl8mpTMhe3DCoi8s3eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7VEupp0Qa5Og2HdoFohN98vPpmKOUnavRaiCPu7sh4=;
 b=Kk4NB6jOaQy+t8Xy5Y7JfZHCkj7WAHV1YY/BEKhHnNurQZv9rCYqDyQPJQRTfcRT21UrOsAhSdPwr5xLfN/wFPizvKb0Ftiz8HD4biiXilYOtzwSDI66zv1AOt5u2vdZUn6PnV/ogkewLw+NTJHJH311tbg+EK1K7R2qP81T9E7OGLQRZ1nmBx6BLsRGdAyexQQuaVkz7LoRvSKEQKwgzY/MJaK1Ror6jH4cJxkRU2l1SsEMb23SVZ6xoY49mqNadKvnNNVx40Asci9JJRwFyliyr62h8s1Fee4k5kua5G9FCJrB9mE35R0197sskiEO44Fl372QSIcuQbYZ06j/Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7VEupp0Qa5Og2HdoFohN98vPpmKOUnavRaiCPu7sh4=;
 b=f04+Ff/agUl46o7GkPBfUVC7HfyhAxKPd8it4XefRYA12f8I5ka1hZ5c0hFRSFmebPT+qPJ1Q0ppKpF918M0ktd5NmM+UuqcDh6MS+fQzOEkEz+8rLoqGfrjxhkP6Xq3b1PREpUzQTraojDvvaZ2RYrR4gJwOAd7ug4UsVZza9JEFTiub7zibh2DZjR5xhHtxqgIPwIOCyet8xfXZ7QeDTQfWpzgwLSWElZQZPVzcRPh/A2F/F8uvhNHuEr4FDWNHBaIgvPWOUiixItGGeUX6VlvlG49NMD/iUwiO9ZWkhpPypOunFMj/QxMvHYAA0Gkc3XeT5X0Jr3OKA+iM9ZW5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by PA1PR04MB10225.eurprd04.prod.outlook.com (2603:10a6:102:467::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 13:21:03 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 13:21:03 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 phy-next 14/16] dt-bindings: phy: lynx-10g: initial document
Date: Wed,  3 Jun 2026 16:20:59 +0300
Message-Id: <20260603132059.503527-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260603131914.503053-1-vladimir.oltean@nxp.com>
References: <20260603131914.503053-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0023.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::9) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|PA1PR04MB10225:EE_
X-MS-Office365-Filtering-Correlation-Id: 52ea86f5-af96-443a-573f-08dec172f622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|11063799006|56012099006|3023799007|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	pu9yulw306N3/ytROJHdInAiFLx683suGKYKRT/s5SrLIet3WSG6T0cW9pajRocGhTsW6aKr/26AGbjA6cDAJze7zL7Ohh0URNtUckV5go23HRd+cJV5TCBH2MJcV7p0n1mEZt0BkBixCe0ax+EqYZ0A1Q/M3cf/xSIhi4bcV3KfkPXXPRrNOWqPgBJ3sr6PNKwfyU5cA/VVusMOmHmnpzGyWAi7IMhe2RUEM/lcZ1Q1+Ehw5tWslfSqFltg2QJYVTJw3D4b49gyY29Gu62hvYqjUse+8it53Si9cmNwmSeAwbFqTdV3Om6DQcN4/Tmm/Ei5Koo7TsA177kZTyBA2v9pvlWzSKXgBB/gbm42jexauCghBQNqClcU33xkWMDJsHNLdp1CqmYqeJ4bhJUDeHqfARvji0wS4h9nWSYDfY2Gec+7oGqbNPEWgsI7rRaTH2/8N5GNmnJiVAfcOP9qYSMBcmls2lmHQ7nB5E/89iCeLA2Uf/oagA9Gda1+LhR6sJhstFSLRrhlN/m7y8CEFagyjkzuL7LzqfpVTPslhNb3xp+uvFT+UD8N5Ioi4y6hvSrpnlfAWwlhP8kkQFoNrM1BO0bjRvT9WIq73YMA2yqLIpcEAtO4if6JpQltbn2yeCcitDWPNr651oklqCcP2w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(11063799006)(56012099006)(3023799007)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nYQZPCqDLEgFD3bkhHBJinxWIQMOvTWg/SoNqetrbORnUQ8K1cTrJLOvVFUN?=
 =?us-ascii?Q?/vx1ASWd91pZSM6xDR6uKJwiUdWtJRMt3bi2zVOZ6KZeozVa4np4tcLsAjys?=
 =?us-ascii?Q?dGa5uRRr4qqnJLW+hVDTM+QAqGlf17/iWBcrcMU2KK4ojvZS1xqNjVcLhuFT?=
 =?us-ascii?Q?L9pJpLSATZyU69Y1suTrYsttuDsQe9uvK8Qn2Ex4pZgooc5CeYiNxe1qnxI+?=
 =?us-ascii?Q?Jd2Qr/jbicLYzKsiNG2J5xomsnTqR31nH+nODpSXwU5O//xVi2TtM8W0YrVl?=
 =?us-ascii?Q?uF/iGshxmu0uHnnpnEmxNo6XyNQsjtufJpqNApvjgj2JOWMncG9X5dO1Hcaq?=
 =?us-ascii?Q?6Llm1CnYXeTm9/hsahSw0bp14muyKlmJxgNAqDRaBj6aIMffqTw2AZ5kG5DA?=
 =?us-ascii?Q?TS7v3XUUKzqVBM2tambKfsxeVtlw+jc4c4WYuajqnt9egPaqBfnscIWm7lai?=
 =?us-ascii?Q?FnvmnsijFiQk1ohhkH3Gw4ldPRY/fwb2CnUmhTrVJ2Nj1a7fpPt8CU7gihmS?=
 =?us-ascii?Q?YfpNcWQ501s/b66eSuQeAnsj74VuKjMNgZzcrDABjAvg4XxeRY3DAWilvVYC?=
 =?us-ascii?Q?DmRd+dKyUO2uHrlduXPVoqy2IFYu4P95Lx4l/dA7JWL/LaRlB9J8ohg7Qw8i?=
 =?us-ascii?Q?F/Y6mVney4ax4ROM5TjI/MFqTr1PhO5GbNBcRtT93WrkNmNvwu9/HK5pHh7L?=
 =?us-ascii?Q?4oveNU7+r+XY+Reb9d5Groal7nQUtQvVkULwnBAP2nh5ndlCpDBl+NstA29m?=
 =?us-ascii?Q?VLsC9mfPxw3jYIhll9N6t1oJlTOuTuNRaLD5faXXVEd4Q2b8WvJGNJrvg5XK?=
 =?us-ascii?Q?eOACbFN84862QvniCOgxa2EFo7C2J57f1/0qDPpcBsjjnayRCyU5p6uGl3nP?=
 =?us-ascii?Q?vURq/kZfhBmvsctSEA4zEWaniu73FI7Gz9aECSxxKJexbA44raorHb4ZiNvk?=
 =?us-ascii?Q?qM9wfRifq+WbLu4mTOtm+GnQVPheik2UkyAXwJdL9sVRQ6LxPdkJfyQovdsg?=
 =?us-ascii?Q?DxwgGCDEPgNIfDhGV+JnL9exEXzfkchKX1S/8okqfijrAK2dOMP1mdqJRfLh?=
 =?us-ascii?Q?rroQHmzmFyvoLS+QWpgiCIYlj9+9Ilwl6YwPr83F4rEd7gGVLNJuWoqsitLe?=
 =?us-ascii?Q?HoFdcw55Cm/1GU1M0n86+nKKPpSuRP4WmtQxRj1WEVerfU3E1HxVRJM97vhz?=
 =?us-ascii?Q?QF1mTKSYEFDS3m/bFAO1w7IJJzy7yDW4dugsryIHtihAcy1m+jCDmtB+I+mR?=
 =?us-ascii?Q?yLL6AWtS007JAedlQorXASnJB/n4vbe5N4MUUskT1SIVdhK98MWipqABBSH1?=
 =?us-ascii?Q?PxJpPWMZASQ+TEuWw6jgSJ0VR1jHMALmZHr4u9uHaHPf7jPljADTZ9f+BOzq?=
 =?us-ascii?Q?Yhfbqz8PM4rZa5E6cGy0JOP5RX1xUjwSAtARGndIZ/wagpWrQGNjad1RoEkG?=
 =?us-ascii?Q?7a578RAOwvucYihvsOWlySCZU+j+lTOTdK8Uufpnx4WSAJPcx9TZbO/6XD4P?=
 =?us-ascii?Q?k90bKxJS731YTLoHlzOTVm7Fj5exU/ctabW7mYPGJdSExDEtJVg0TbOfyuUQ?=
 =?us-ascii?Q?Y+akonRAv6T7wqhOe2iaqgh0u+G2KtkIOCNbODN+zP77lqLTRcDA2p1QY/Vm?=
 =?us-ascii?Q?lNpi+YYp1AVBOSpcYzfGUmjtLQU52BG65NHLwyqeQygQvxzSU8Ld5+/V/18I?=
 =?us-ascii?Q?ckWDyf+cC6a/VM3O3RPrg9bD3Yjwj2lO4h/YT3ZX0trAdXvewWfntkE9xv77?=
 =?us-ascii?Q?+wzrUVyuzQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ea86f5-af96-443a-573f-08dec172f622
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 13:21:03.4655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ShgHesMIt/2cu1DkVHhgkvbeP3YrH3lcyvlrTk+D/lwqGs6rjUxsGXfLBIiKBkviDLnbE0KDvr9VxMqaaUI8xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10225

Add a schema for the 10G Lynx SerDes. This is very similar to the modern
form of the 28G Lynx SerDes, which is very much the intention.

There is intentionally no generic fsl,lynx-10g compatible string due to
the hardware inability to report its capabilities, despite having a
common register map.

We allow both forms of #phy-cells = <1> in the top-level provider
and #phy-cells = <0> in the per-lane provider for more flexibility to
consumers, and because the kernel code is shared with the 28G Lynx which
already has that support for compatibility reasons.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>

v2->v3:
- move fsl,lynx-10g compatible comment to commit message from schema
  property description
- make big-endian required for LS1046A
v1->v2:
- move patch later in series, right before driver
- deliberately ignoring this Sashiko feedback:
  https://lore.kernel.org/linux-phy/20260529125017.ifqunh52gdzhthdg@skbuf/
---
 .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
new file mode 100644
index 000000000000..8cf6027a75b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/fsl,lynx-10g.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Lynx 10G SerDes PHY
+
+maintainers:
+  - Vladimir Oltean <vladimir.oltean@nxp.com>
+
+description:
+  The 10G Lynx is a multi-protocol SerDes block which handles networking, PCIe,
+  SATA and other high-speed interfaces. It is present on most QorIQ and
+  Layerscape SoCs. The register map is common, but the integration is
+  SoC-specific, with the differences consisting in register endianness, the
+  number of lanes, protocol converters available per lane and their location in
+  the PCCR registers. Some SoCs have multiple SerDes blocks and those differ in
+  their protocol capabilities per lane.
+
+properties:
+  compatible:
+    enum:
+      - fsl,ls1028a-serdes
+      - fsl,ls1046a-serdes1
+      - fsl,ls1046a-serdes2
+      - fsl,ls1088a-serdes1
+      - fsl,ls1088a-serdes2
+      - fsl,ls2088a-serdes1
+      - fsl,ls2088a-serdes2
+
+  reg:
+    maxItems: 1
+
+  big-endian: true
+
+  "#phy-cells":
+    const: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^phy@[0-7]$":
+    type: object
+    description: SerDes lane (single RX/TX differential pair)
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 7
+        description: Lane index as seen in register map
+
+      "#phy-cells":
+        const: 0
+
+    required:
+      - reg
+      - "#phy-cells"
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - "#address-cells"
+  - "#size-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,ls1028a-serdes
+              - fsl,ls1046a-serdes1
+              - fsl,ls1046a-serdes2
+              - fsl,ls1088a-serdes1
+              - fsl,ls1088a-serdes2
+    then:
+      patternProperties:
+        "^phy@[0-7]$":
+          properties:
+            reg:
+              minimum: 0
+              maximum: 3
+  - if:
+      properties:
+        compatible:
+          enum:
+            - fsl,ls1046a-serdes1
+            - fsl,ls1046a-serdes2
+    then:
+      required:
+        - big-endian
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      serdes@1ea0000 {
+        compatible = "fsl,ls1028a-serdes";
+        reg = <0x0 0x1ea0000 0x0 0xffff>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #phy-cells = <1>;
+
+        phy@0 {
+          reg = <0>;
+          #phy-cells = <0>;
+        };
+
+        phy@1 {
+          reg = <1>;
+          #phy-cells = <0>;
+        };
+
+        phy@2 {
+          reg = <2>;
+          #phy-cells = <0>;
+        };
+
+        phy@3 {
+          reg = <3>;
+          #phy-cells = <0>;
+        };
+      };
+    };
-- 
2.34.1

