Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011063.outbound.protection.outlook.com [40.107.130.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C823B38B5;
	Mon,  8 Jun 2026 22:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780957083; cv=fail; b=aAj7HojWqHe38Ptf9BibmTwXm2cWdyuneTtK+SQanuhzjNUZQmNwyXTBT3S/sktGymJwRjsAoeCaimAyCBSj//fvoFkxHmnWPdpAhLST64nSSlEZFOGKREIvE9YcfurmlqyY5/YMNJ1AuB8RarW3b14/sDK2duUZiv4qT3mbvMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780957083; c=relaxed/simple;
	bh=sV7EC3NqddlPMTaisE8+zAziuZgbrR5x9QfVzSx/g+A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zl+xCkkfK8MXaUJvabg7U1lpDEOlhd66YORN7E4TwS7CsMox/Nsbc31eWM7RNCaDnX7OY/y0L79L6Pr1McEuLKAGTZ7a7TK5d26vK+h1Nt1u+ztYHwdelsrK677V4ePVIJxMKq2HPJntugiGdkHtwq9NUdwqaSxkzRa2dqLvWkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CodteWX8; arc=fail smtp.client-ip=40.107.130.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CodteWX8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEz1CGhHgj0aU7WjpNLd+/U+QCzHoUcDjLKkAuvTmCj4db8w+zhzuW/7iGFZPPeIgKCufMTZaOv2TcJau/JS/6bXgRIdBh1QDdLSEDgRnXisKhSBwrxaO9Sw76zEePtZ02X2OuizI5Oej2PehwYveWH3pfb060BHa2y+VucwJGeKv+6VQLCvbe5kxzEbjFT99NOxIF86soVY/cyUROiNZpeCkTQGk3k+MwGq7Bh//qqZBhpb+oZoYcy2/wzFlukEsepO8lR5d9ohZcQSqzw5OXyB1rAllUAuEZXzxry4Q71XeV6ghYF0jC0RUHgTA0OUdhlE7gRhxaWUdRMz3iH1Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQCy21gJ9k/G9oeS/2kytM8hDDQ9HhQL8MFAePHHBIs=;
 b=wJt+XOwULfFrGSrdLMS7y6mZaxIGxrtayPM9QrUkEXtRdfM697SQVWgfbpYy6EVnn+yrZGyrRJGNiru4/CBeDOGKUFKF3ZyUDH2mqUSchT1BS/J6QGmSNNBzpB3aJyWuGA09dNLGRWkrEPqUwq+O44F/E7zmBk9/mEbgf0UAHqs5Xm86xEhlrTRdtCBUjZHUrqKdfDIghhN3D3Q3vfHTBYy8HvHf/t1YiWaYDx3WHYWTJiIWRBN97sZ1SxVMPVvT4ZMp0uW94MYYPkaMHe/TaIkowBmV95A4KDOrzlZq8cV9QCHPaa4J2PTgfh+NTWotMD95/gjVK2P1vgq1IRwuKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQCy21gJ9k/G9oeS/2kytM8hDDQ9HhQL8MFAePHHBIs=;
 b=CodteWX8Gav/8Z9xRiqNYUmzLhmHVE8i8pxyH5NlXP82A1ffgGSDioEYIXsrT37nPBOJZ9sUEb5czGowmRg2VUKY3dCLJ+oVOGSF+rUXgIdf0MT9E520rVN4YszvTBs9uXzoMsaCvgTT3RTNFvav5wgL5u/YNB8ebOc0Zh4bD6kw3Z+MjImMXshPPrV8KSWYIyeJt5+P2lBLJit8sUUVVGgDKeIHGo2BlOwRzmE2ePXiR+hyMQcqJcBkxX+F+cP/FafgG1Me5VfSDDiP3VdE8sORHLI/mKw++hI7NIcOfhxWLnEyvNCvvWKbL8Y2b8XgsiDun5a5QOgoIeMj0BhkQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by MRWPR04MB12070.eurprd04.prod.outlook.com (2603:10a6:501:99::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 22:17:54 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 22:17:54 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v4 phy-next 14/16] dt-bindings: phy: lynx-10g: initial document
Date: Tue,  9 Jun 2026 01:17:08 +0300
Message-Id: <20260608221710.1572971-15-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608221710.1572971-1-vladimir.oltean@nxp.com>
References: <20260608221710.1572971-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR06CA0187.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::44) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|MRWPR04MB12070:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0acedb-e6be-420c-ca0c-08dec5abc970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|10070799003|366016|376014|6133799003|3023799007|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	VQXC3Jc8w71ZROxD+sKXJC5Vwl4BcXukKvJ5zbeod1Tijtb1A2blquV0DOd2Y24VxSrMreMIwuDEd+fVQulz07sqMNjHodHxOwIrypSnztLjSYAzgrDaKZMkK0JOsHpRUSEcvdqglEhhOIwgaKegPYUpR/6j/pcAJBTOMVeVcTd5qISjSwKm3IKjOcfyFWxuxTKPWp1BDr9+yyoD+Q2U0qxhfwOmz78lcaXvDgfjoSSHEh5G2oWhsQytg5GPwwpOQ97i5WTxmAaVsq0TxN5o/KPvVDBuwVJd+fX1jydrY+HMg/2HvuTLzkMRz7v0vN5SNeHdBIOnvF4YUtb4q9CFKyXY45OhYX8REDlTXL7DlN53VCTePpU91mFl6akOxoN+Ktj/w0W1pWKm80yVulBiceCheFukyETDYIxEA/KDCJ9yG+yJeul8f926YjC4D9JibgXuDZz9VYGSD+Z0dO2wUC8c05m2mvo2jjBEyaSbrlaWBLNKpKwr6qwRHSldyun2UiEzWfFro7C8XB3J85g0Uk60VeARNZrf3BYvlvhBOO1A8hZgOVYpLSyxBhhZTmsvadYZa4C8hJmQ5nf6Z70XENi0p2zTCEu8dqeKjA8Bl8a6ZllExb6Li388oWAymvl7tiF7Y0lTWWgBplLX/qPkyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(10070799003)(366016)(376014)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4xk9nV/jK+M8Jm33jXrsAdblhKjYijWnfCTYRA070W3htE91PTJf/8cZMjHD?=
 =?us-ascii?Q?ygUdzxp6Wx1kRn9Vv7i1Lkb5ucJaxtd4DosEh1+Kxpx6e2amCurkF2hoKWiS?=
 =?us-ascii?Q?68DHkTW8WSENGR191MAnrGM1FpAQs+w+lSu33u8KC/G9UyHLVgPHquaaDNU3?=
 =?us-ascii?Q?6Lco2Jg4OJJ6aSCI8sFE3zsVNrCmNhkdUhm7ZBwNl8W19i3TxBSaYAJV219t?=
 =?us-ascii?Q?g5UqXU8gNc+KrYVY032FjlRY3xy27ogmSJ8dLAqP8rb5gKNhlym8hDXprKOs?=
 =?us-ascii?Q?B14omNqR/KzW8Zz8vvzLZDq2fsfrhR+NeBX54PvUsw+rCfeyZhUgnl04IvQZ?=
 =?us-ascii?Q?rV3A+NNzqydpXAuENWkka5EflmaAGkJnvB5Qz9TzaVFCTL0zU/xiuIwXjB5w?=
 =?us-ascii?Q?6Vb/7F66bxSs6NCnFJMt3E67+8EH9YmaThUGVSrtbWeRPLprB9gT3G0Wc5iL?=
 =?us-ascii?Q?e/bqMro5JT9rAZSjN5zCLGeNhAugl2UsqMK0VpvFS/JbrpGleuTl7GYyU5hF?=
 =?us-ascii?Q?4AP0U6Cj25K1BlpgVOnoYLzipl+Nu+2bKvMX0q4DaLVWszNpCIlxdIG4lUYg?=
 =?us-ascii?Q?d/XL214YMxfep8r8NcVSz9qUQtUkWAAPpT5Ah/Y/H5+UnpiRvwUzwNaRtoFP?=
 =?us-ascii?Q?IMWpPyxurxBzDkLtQjoF4viYDwOkCcYJzaHledeWcpa6g2E793BCxjbNSe1Y?=
 =?us-ascii?Q?eq+L+rXFq8UAvlp7rGa7V0u5QrFMYvUzq4LqGAHXknrLCZSFNR/fsBqGv3se?=
 =?us-ascii?Q?/OkqqbjLo/Dayeu2+SePOKFmZwgaEhYVZWw38qOnMzBJpMTd+Z6t3vOXMWsp?=
 =?us-ascii?Q?j30eQeuhksJ6vAgb93Wm55F1tdjCsxAlrhCb6oiOezv/aNHhzdaPXsbeXEvs?=
 =?us-ascii?Q?WMdLrUl0OvwiL56pwwq/7k2xXEuK1KAQVJ6drHxr5jk/m9A/Cp9SViK8CFEO?=
 =?us-ascii?Q?7fNnclh+do3KpVHVONDpSCt1ustkL2+ej/j/CbMoYDEP3MWFTYFN+GUd1qjl?=
 =?us-ascii?Q?M3dkbYGDJatAgUDZA4EzC9RX0WD9kqw8tnpdmKqz1FioH/i2CF9YOEKoFbXK?=
 =?us-ascii?Q?pP3iBAO8Pllq9WO61Bxr/VQbZrG9UmgHX+sChQuMjcZG7Mm07g/g6c+EqES1?=
 =?us-ascii?Q?/6gfwTQ0rH4yJtUU4YnctmEIyE07JVJtKEaqKaBumrYgiHo5c6M97PuGVYVk?=
 =?us-ascii?Q?e5JL4AndnQdvl3TZrv4gz5LmMqALUqK8igvtDvlOTiJIcaqo/0bvOSqZ1PS/?=
 =?us-ascii?Q?Nuo1XS6d+NEU7VmNmwlsTS+A843ni4/bBPnCwQzP7udMH9huFpV9SKo5kUh/?=
 =?us-ascii?Q?3Sqy9Q3gn+uNVQ8uS8RJuSsQCfh360hQvpvmFR2ragBqoVRYECPkooIsjAdU?=
 =?us-ascii?Q?Y4OM9tITWlCSVSgG9HHKEPjqd+jjTMyzJWRUEKiaaZHqBQmxDt/ai7Bq1dAf?=
 =?us-ascii?Q?HVFwE3kYfIMTK3ZqFxxf85lc4Qk34R513cRlbrxBSZr09M54I4gh+k0qBfsB?=
 =?us-ascii?Q?1nZg5T1VQyfzQRTeSMJ8MeYgHRKrY+ShCNzqxxhpwTfIL8KhZWyO88dMMON5?=
 =?us-ascii?Q?IMtCoYtkXy0go1s5ls8723mUzVjKzovROVZ/JP0Jh1MNcBK63KynbZCal2+p?=
 =?us-ascii?Q?+Ay2AsLoAWy6lH6oLY7r29BFKVTKdGbWjZGqY0rqqhcw+H5tqj4eZ+gxmShj?=
 =?us-ascii?Q?JSjsPsplx3m2sbx6wDUahTx4eik0X0dBVL7ukuI8Ju5g41MKYiDhG+6mt2EB?=
 =?us-ascii?Q?jg5OhZZ4gaekIrYvUrlyQGKAOiODQ50g4V1fCbd0eQlxTjzxnq1B?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0acedb-e6be-420c-ca0c-08dec5abc970
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 22:17:54.4672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIR315ycmzSXDHX40wmgBNla9qBK/QS9MpL4OveBJmpRgdhwVkNXugQgdnbngg6kR0+lvCTFDj+jXtUDLnKQXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12070

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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Cc: devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>

v3->v4:
- avoid relying on dtschema fixup to turn "properties: compatible: enum:"
  into valid json-schema syntax ("properties: compatible: items: enum:"),
  instead use "properties: compatible: contains: enum:" (Rob)
- move "big-endian: true" under allOf constraint for LS1046A, same place
  as "required: big-endian"
- add Rob's review tag
v2->v3:
- move fsl,lynx-10g compatible comment to commit message from schema
  property description
- make big-endian required for LS1046A
v1->v2:
- move patch later in series, right before driver
- deliberately ignoring this Sashiko feedback:
  https://lore.kernel.org/linux-phy/20260529125017.ifqunh52gdzhthdg@skbuf/
---
 .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
new file mode 100644
index 000000000000..eaef58533825
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
@@ -0,0 +1,137 @@
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
+          contains:
+            enum:
+              - fsl,ls1046a-serdes1
+              - fsl,ls1046a-serdes2
+    then:
+      properties:
+        big-endian: true
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

