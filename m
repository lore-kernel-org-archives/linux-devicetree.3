Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011028.outbound.protection.outlook.com [40.107.130.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B609E47DF9D;
	Wed, 10 Jun 2026 15:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781104829; cv=fail; b=o0/cIQvXst7e9n0cZ36CALK0A380aKxjM7UaUe0dqW+8Hs7XFtY4Pswx+Y0UxloJtyTcsZ0BB3Va0kabdF5QyLTVhwCWbMl8khQ4MeUCoMADigCKoh5gjbe0ae74osJFA/Pa7CPnPgV6i4vsaBGJFSGhybO3lhddi1iQ9yCahl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781104829; c=relaxed/simple;
	bh=sZmTCAmnQ/zHg6hCKwdP9tbMVEjbhtVDkDtZEweE+Do=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DR4ANq33FzT7HE804kKnAfzifP/cu5ogWQW8bY/hIeP5zItQVaZlT/Me/kByvraS2Vx6odKyGZibJ3y5DUljh2xWafMMyBiZnbc1pbZs7ImbhuTk14Q9NNZalApnSa/tA19ws4xT3GwFpixqqQbt0skedA0CFePFvv6dd26zmU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gU3SW5Bl; arc=fail smtp.client-ip=40.107.130.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gU3SW5Bl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOS7ilD0CHIDBP2BsoKQazD0SvWdVVC9bPJPA2Ef9cSJ6g4YGhVRJYlDovAPQIKmv4gryIbxIMxvEPHj5ijrQSHY9iWJqvydkUPQKghDMhW21mDXwdlkIMtCNol3/FoUhRngWThE3B1o6wby0sgZPdScMyITT+yGbdOw1aQSnP2OYFT5Eyg8vcoG/Kh/WCs1DCyvCyCRyu65KB1I3y6nqX/I44JA43WOE63UWKzihmOGvO9IDq/S3M6RZnXMbsCczKgn7EzALwM2q+xjx+uixxTESq8Cua/OPuk38vRJ+uUdZJCkmAbZMkhPROnpcHs+wKU3e+l7mt4Ok2Qowo9KNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUr+YH53VVf7bIPTigLCclLU8A08l10P+9waPqCas2E=;
 b=Zl6v4olfRqUmR4G3oss6l6YyrbBpxUvtT8NUh+I/yO4LanZXAguI/qIklZHfgoc53yTFGOiN2SN6HKzP+DINuT8/B+XGUg0k++G4DBkScr5N5lQt9T+l/WOzj02T4P1gfg8nqUhI3E7MaNpB5U7roEjggL4uyMqEGkZrXFYT+inliKBEfow/4W32n0IYZl1Rpcx26Jy7+vylGqCfmZ0O7aTeAQL2cxubIxYD8QCxfc/0MtbfaCDN2JwWtwEXRl+05hVYrZKSQMuCjpKUiqTDi4j3+fxJcxjLPjXG7sR5LWKVMBEOLg0rzt5YpU/1H9LtUTTLft/zRLz4nC9dO6w+eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUr+YH53VVf7bIPTigLCclLU8A08l10P+9waPqCas2E=;
 b=gU3SW5BlZjv0M7U6DgyEXBKnTLn9QBOaubqBSRlGNqm4I0ppWoTWO97LFYGmeot1kOFDm1LoOxiB1khdNzgeoGi1VrH5zNX7uYvtHxs3TvyHtB2GbaZNXc0K5hXJy6buNbXoVs765rzcXAoiPoVfRxvkiCErmDRqoWSK08aOKhIOzs1ndRkSiOGgKmfSNBxo9owq/sHtC4DVF7rXkhMn/YHCip3O5gTXp90POWi2fDZ8aK0J7F/h28PfMdsz4iruI71qPabWmoZLLBqDD1h2gMiRW/6Wy3n9cnwXcmyQbeFoE0N/Y1tsv4vGyszMy+ylffIy5lIcufh/2az5+XThDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 10 Jun
 2026 15:20:22 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 15:20:22 +0000
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
Subject: [PATCH v5 phy-next 14/16] dt-bindings: phy: lynx-10g: initial document
Date: Wed, 10 Jun 2026 18:19:50 +0300
Message-Id: <20260610151952.2141019-15-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610151952.2141019-1-vladimir.oltean@nxp.com>
References: <20260610151952.2141019-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR10CA0009.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::12) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|AM9PR04MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 37d3f71d-0a02-4d87-6d77-08dec703c9f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|23010399003|56012099006|3023799007|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Bi2jHpV93/4cwW36N0oXol7KB9Utk/9LJXUtEAhrLgGwPWiXo+aRxMe/1WHpL7KgFYTlwVzCUr9feEdf2fN4vxEHNtR2UNJVy/Mercsz+5lGO3cUtNLnH0zXnmt7Lmhe8V2fW/hB4J06Ccoc2OLa/fMtwBDyqBzMHeQvRSr1j41l8LyTUrjGQNVAQ75jsDA6tiThvt3wz/VLrJePrjrWhqVMizpzAphub9/qgVCMJp1NGMoPfEfIWHI2alNJttIc4Brawn6q95SoEpm4R+WL8hdqJksVlDLc2zJAnXiwBgPtDpwpS2V55MIGZxVKqTPDah0nTZIcKwQc+fG45z+AqKh8zlsuyKULDf7Ohvyyx+W7TZwNxwlyiUC7CTH5KvzsMEaHWmTWtrGMV6UVZGCGoxj2sXGii1/i8uLwdUCiHNenIGKiZPj70GN7Le/n3ZxWxh1taiAzgKUC7EMFDoWIiwdWIv+5REfbkpFljpCq0CMnqRdy5gJOzsI4B4BclamSDk2friVf+HNS25C1X+NGkI5eQLpjKNEoLdXXuQHNn7p59Ix6jOk2NOumVTAghORqdmtr6IUF0GRarf8VNXxkHCa0s+KrI4XsgNExshcQ1AdHG3dpOb38wb5hzGD6aqw7Pv0b86EeLLk+CXgtw4wokw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(23010399003)(56012099006)(3023799007)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?87KFESYn2yMFnW0hXVqTlVVuOHS8pQ3P3TZ6Zeff+uH4Glfl4OxnS6slvg2u?=
 =?us-ascii?Q?PzzhgHfm7snGpnZ7sT+PuLKOPFC6eyymy7SLVzc6HooiUOBOSenBxHfzgE+d?=
 =?us-ascii?Q?rZe4sHAt795r6QQ4Fzau4JRubOSV9/yKltRthDYkIqw5VX08JD9dhvRB6bt5?=
 =?us-ascii?Q?X/McBpHGUC2GK3xrxlYkvBB++tlKb8XagPuXiV+F6DTqpxqRNNdb0+lbCbJ9?=
 =?us-ascii?Q?TeqWXNooEmJjCVSlHGvz71CWx7EwjoBshbuE3XgvMal8fwTmcCd/ZhvRQXQy?=
 =?us-ascii?Q?NH205igMh1WFXCypQOHbt7Dn2wMwLpMckZFAv/htWz/Ihc8Sasvqyhhme2xE?=
 =?us-ascii?Q?t816zFw3upaaUYNt3CZBE7y1vH6S9QglJcPkGwzcYmUGwllcJv2QrPTKwcCY?=
 =?us-ascii?Q?EzqeEWvGXElZb1EPgt9d4FxVyVyOk5zX03ahqiejZprtK2DhOOB3U2f78dgy?=
 =?us-ascii?Q?r/OChzJRpmqj8rIwXtSpWApP6M7L1z8EBeKVY4kSYLmI//4Ora9JiKq1gRsG?=
 =?us-ascii?Q?DdbWpXTGHTxDIgjGVRr5IFkGqQXe8Sz54xjqCCXNS1xYPlA53Q/Xp5KkXDMf?=
 =?us-ascii?Q?ffXOaD0h/cxmpxOND8DsHrkTBeZ/2cTOLCR+RfrYuISE/Hkh8wVDdfpbHTg0?=
 =?us-ascii?Q?X+5tSb6rUDtWP4BylD4APytE6iQS1wa0kelYkLkCSPjiSgkzF5r2s9Zs8oDA?=
 =?us-ascii?Q?ZQ0oqVDM+ingUTxGW79xiE+mxq1cH4ueVt3PLFagll683/iUiJqnUo+LHNSm?=
 =?us-ascii?Q?7cq6Gzc+CSFBdO5ooANVOaVLi7q0ZJAlRUEjXXPpUAo0D0Ovq39Wm8DJUvXt?=
 =?us-ascii?Q?wpJx390UeAjsK/GMJnchVVLQckg0XNBJL90pidPrWeUApByRIWZPuwbqsrRn?=
 =?us-ascii?Q?aVvm8+s8hA1vrML/E2hgBw8OqEFiXftlIFng0W/b41I9UKvjb+Ah2MingkXi?=
 =?us-ascii?Q?igJ1uldBuFhdio/jcZvKHTpHp0yhh7zG+xOiOL6ce4G1ZlkCTB3Xk5G+09qV?=
 =?us-ascii?Q?RqRAnvPzNx/4PqexhGvOz4b+vgubRZuHUjTVC6ydVMP37tn5tzz2UsixPRZJ?=
 =?us-ascii?Q?AMH/D9ra8A5fY3ODXvv2ott4dfvDc9bmA4GhpTgWA4FJfyYDHmeyoH88NTqd?=
 =?us-ascii?Q?nlr+dVug4a2VCUQHLyB/AsjnRs7Tq9LQLfeHMFMXRbkn1Qm9eR+Maj4xt4G9?=
 =?us-ascii?Q?y9Mr+GxLsdHEeVO9I9CYxYwitGFJBkZr6LugH7IYGP3TmpT1xpDPW1h7fx3v?=
 =?us-ascii?Q?iMhmoonb1EIoZDs5r8UiAk2DxWl49hzzLIiU7fkyoYpeR8yYLRNQyO3n1h+G?=
 =?us-ascii?Q?pxJTcydgNv7Gq3HoH6qXmEiOPcYeU/eIsdw+mZn8ABTcFH8FID7EItL1pXz4?=
 =?us-ascii?Q?k1+96rkNbpNvnBemPdqsLBcIOqguY5p/f5uz78HMhpBPRdLKtLpMPvjyfsar?=
 =?us-ascii?Q?vPry1HV2W29j14IuKzt4yW3aEbU2fU8yqKOT72DJaeTruuaZ+R/53se9zYL3?=
 =?us-ascii?Q?1AHlVZNW+syp1O+UHWzJxFxTgpqiOYmj/FdcW1aaaRm9ICnJby2MQ16CKkdw?=
 =?us-ascii?Q?YWCekSCnFogXCPXYUKmOY4VdrGPnJGjDaSJd/0DHyUQvjf34Px8anQDoap2E?=
 =?us-ascii?Q?Ek6q8WBHD4ZwMXKDcCmTIX1P2/Z8Adxa53RaDoYG68hLoKCUjz2Qnuo+AUxm?=
 =?us-ascii?Q?hg4aqYlP178J3NQBjBZGmBZy5wkeYNYzHF9ymHiUHxKGXHmXX808qBChQnEN?=
 =?us-ascii?Q?xKD5ufSlLw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d3f71d-0a02-4d87-6d77-08dec703c9f9
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 15:20:22.2389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vao+VujS49Dl+b4RW4cUKRP8/I5TqC+WSEJTMLjryeUiJ0Uoa0sUkoBRqJLPo8CjCtZcRLYgZBIzffxfnyaENQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844

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

v4->v5:
- return "big-endian: true" as a global constraint, add "big-endian:
  false" in case the compatible is not LS1046A (Conor)
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
 .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
new file mode 100644
index 000000000000..2e7d0abfa71a
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
@@ -0,0 +1,139 @@
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
+    else:
+      properties:
+        big-endian: false
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

