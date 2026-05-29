Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011024.outbound.protection.outlook.com [52.101.70.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6A838735A;
	Fri, 29 May 2026 17:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780074947; cv=fail; b=CJ33Idvp2/lpc4EDGaspN7zH0V+6pvNW+S8T2ChiWjMU8YOFb5nXRb8gUlZxwQMV2roQU71sLwhJUUIeF3EC/r+sttsqF3xBJJ5kVdgcV2TBwDSVD2uQw5KQFjs6HM79pd6sm9sCFfBWMIW9MpENp0TPYT62TwaVe+uladXXAek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780074947; c=relaxed/simple;
	bh=uSjA31lqdmAU/qI/2mX3sOUKIMfhNOYq/1kIDjivn7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qeoH49WLOJ+fQjeOsuRDnGMvXsc9Zc8r9r+rJTzrR7cqx6gQnJ8r1VRltSzqB7TLDEk7QaOdbyX4DEE5Z127WP/VxcZB9zPtVFuzcfIU1qpA0ihoEXYHKX60GJnzo2FqILOVc1fVYLc4FSPrfBSvf38cqaa6WSGNR6mgyiMEzJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jgJ+uYo2; arc=fail smtp.client-ip=52.101.70.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jgJ+uYo2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvmzXP1982hOmo8aQQOeVstH9Q7WIWnFiA4+i9qoYC/qU27mze3nd1VaMKp1WgmrGt0SNJ+N3p2EVJM5/2cHa2X0s+RirHjaNrilKiIFVV0PAHG6tEpA5q9drFd08hXhb4yFCRooojBgd4NFvUpXT2wllF9wC6NBWozgtAKVyJRIexDMZY3YPY9wEzYjfXJbAPl9GsVXoqq04Lyn2PrwMMT98aGmfRZ32Je+sRvIsYApHzValI93to4d5HsZX2PudD89V6XDY8tDbzEHGhX2nR9bUMldhLvt9VmgY9NMRXJFZK9WpHhZqbnRacLpaLC8b0uyhsVCpA9r5bTV8mKj8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6VpMqM+F02JuMFQmso8hqwPFgd/odO+Z62dvLBBj8IY=;
 b=Fg2ZY4dkUkH09Kujwf3KVyDrOJJ/ynfrdg1ERD8MEI5xO1OKywn1BtE8IQal/TpFhubX8S4C78TZ8gIXYcgP8Bhy5AtJgwWo4bvJ9H2JCSoXJa4N1KQNn1q1gupet3eJnVkq/0L9B5xzseaEBdNNIu9u+qFZDHyRL04ptVM9py/o5fQYTDP8+l8CCSG+M5eEVY1fkzk8T8XFqYU94fhd29CUwd0S61zX0cLBUb0RP2sFCmfcUvLY0+h49bwW2WetUEIvpHmsNzwWyCC79qCrgZejHGAm11QSc3LpQkiUY9qe85EX5uYBKTZ/ruSBq6JE1zTIwFCldXAuqH3HIXACTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VpMqM+F02JuMFQmso8hqwPFgd/odO+Z62dvLBBj8IY=;
 b=jgJ+uYo2/2mneDTTjxys78613hcCZ9L+HA8h3cTUgKM886DkRZOhb8abyWAExRxbSq+B2CMbLKVUwKkIh0Qhxpa0uRgz1Kobd93XgbpLff1b+rNC498HinkqzJ7KOkGaWmW9kxxQCJoXyGEYy9ZWRu9mXrqVOoIonOZqkkNnE2uJwUpqrkEcACHB6VisQXnN9PSECOu74uZhKnIKWRnBB7XJRT+wKU7IAcWPnUIGkQopwfkTyLuFtI/Qy/8+cqzLaPfIQXgaYF9ygH02+eWi5Dhl0+ypMmpeGoit/EMK9NuWheKq+mO/yniZqS5/ELt4t7C4ahDVaByKZvdpEGEzaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by PAXPR04MB8960.eurprd04.prod.outlook.com (2603:10a6:102:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 29 May
 2026 17:15:35 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 17:15:35 +0000
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
Subject: [PATCH v2 phy-next 13/15] dt-bindings: phy: lynx-10g: initial document
Date: Fri, 29 May 2026 20:15:07 +0300
Message-Id: <20260529171509.1163787-14-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529171509.1163787-1-vladimir.oltean@nxp.com>
References: <20260529171509.1163787-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::36) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|PAXPR04MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: a10811ef-6216-429a-b1d3-08debda5e5b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|19092799006|22082099003|18002099003|11063799006|6133799003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	StgUytViZqoE9ZEBd9KnG4ENlqkzR3eFQGHtFh0ZCgdgea/1F8pbpLNLGdMWOOTbD/0gb5DZmKM5XmU70StWe+yxYjVUYCrmTty7bLyxvBWTeVkfGf7D6SaYTx8Vt2Yn95Bg1uYZDJJbH/UGT0drCpuj6mBDLgAQ1q0sXZaKTMa4qgIcHz3U4MQZI2xpPn96xFrWO7+CBLRqdLXj6gc50BEVWB3fxMGdlFm6GSWZHAlpkGfECXUObRVA4R4pDi/YlGaah0Bu6Ga1E0fL8FiqjymLM8AkGYdBYOIjw9v4Et17KwWTGDqDXDrO8EhIHusnbmbxTvo/rrDwZXXz2nVL4/47PluK25w/sjWnx0XzDFIPYpGl2DVgCFtkUhv6Gkbc1oqMw/77cRk9wZKgmZKa9uXBevXknyJ9pRjvdwJYqiIpIrNGvawuKQ/CK65nucrtDYKaUWtc0/1lBhn3xXlr7I0JWv8JL6SIK9O7xVjuGXQHsTHbnBjs83/dPblzIJosMtAeaIx/qzQFe6uUgNeMzAk6kdBhuBPw0Gy/NR1R+hHLVE/+9+Td/IgP0+WEuIsFgpUfk+l5zOXPNdU4y0nxTblL93D1+HO1VMyc1+i2Sb4i/FsKnjl5O12tMoy3tPO4yJ0dbcvxhVl49Umck5k6CQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(19092799006)(22082099003)(18002099003)(11063799006)(6133799003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gzJ/YdgDda1kuGfSsUZ8JV3IgY2K7DER8vGGP18POg8873e/eg3/rJnAobhi?=
 =?us-ascii?Q?zCqftErFazBMGCatWC/42EaRlnehOXgkEEHcs0yDJv+LkWZgaIoiepGar3ob?=
 =?us-ascii?Q?GF0tU/BisMFDEP0p7u03hjMHFF8s0dXswT2MmZzd3+ZU6MGeSu8XB8N2Jiou?=
 =?us-ascii?Q?rni7Vy29EgHEX8LvqNSqHJQSLqIyxRty6PYTp1Cq89cXoz/0ciiQwyFoqfZZ?=
 =?us-ascii?Q?vPvxOZ8qbcV1+rHqyu/wsg+kjDFKxIBo2+Igvy9T5TfAyYwQFv0gBB8xsJ9M?=
 =?us-ascii?Q?1vo8EqIInUdaPxdkCTSmyyv/bUfBdQzfZpu2Rvx/438WIIHb3SFPwdRRsdN6?=
 =?us-ascii?Q?HY9hA1/ERsOAEaEI9O5AuKfwuLIl51nliAZXjkBhYnDn7gun5aJxfKSg8nE5?=
 =?us-ascii?Q?/YgXvPaca/Ybo2ugyYNkRnoWuAFS2GDLLECANlh+Bd/bmDDCqEepym+SQ5np?=
 =?us-ascii?Q?PFdjzV6/otbUO5G8lL1U34d/cIBAW2/euGdMlM9K6q6nZM7I46QEH2K4pToL?=
 =?us-ascii?Q?9g4RgtnGs8my1eRi/Jjnlx4VW9hPaQh9SWeJ+Tx6NFsPLVr1wDPoR0Zfrc38?=
 =?us-ascii?Q?PR9FQ2FVVkEWCH6QYaqNjakoBs8yU8k2Ctb/1xSYjY52APKL7BLwvWAGLOaF?=
 =?us-ascii?Q?eMZ4n4koqqqBVtLL6pgb2vjfsoQ+J+L7gjF9ij2LAAEalM8jbHpPNkdEDe6c?=
 =?us-ascii?Q?UvEnA3sVI7sOjLdSMOyoS1e1ycVK7hWOfZOsIJ5bkIbDstcn/4BSR6Bt7mk0?=
 =?us-ascii?Q?wjOnPPN2zWF1CTaW9OvEN1+GNBTn7apOBuFEaACMeLr1NtG1ttQnfLgMGLRw?=
 =?us-ascii?Q?QWF6D5OJXPpUMYjFBseKG/7eSeOQaz+QPJQSBzeqEGtMdoFNNJU438Nn+nig?=
 =?us-ascii?Q?oxEOL5XMhgKmDsN8qhss39aQ4MsRvg5OX/dI+wkGywtk/tTatiXfMQEb8b7T?=
 =?us-ascii?Q?Yfmm8In6RcGA5ooUJ2T0bOrwtIZeM1xZzvuPnwV0mjoo1+9+YgrP0FAhCV6Y?=
 =?us-ascii?Q?uUIwnwHlL+RnM9n2mSmBJtqmQ3jZA5Atirk6inEX94CWtUEAPm+jnO4uN/Ab?=
 =?us-ascii?Q?8KJEcNbAbG/1LXkQfHX6r9VV7RGM3cWOf9GcO4pUx30WMPy6wqVhxKL+YSeZ?=
 =?us-ascii?Q?AAIQ+p89VjV/6AjtaMD+Xfp4XMJGQPBzNLPo8Ve7yTSBMfOrFGmk04oE0pdb?=
 =?us-ascii?Q?/cghZD4hK4XANhBXPbvLMCoDQarJV77b6CtTAYbdSLwBc3VY0q447y48ujND?=
 =?us-ascii?Q?AhvcsRJAVkLrlb7tsJ78dW2UtEVTNCcUyfGTV1hrDNEXqbfdNbP+D1vKhC5j?=
 =?us-ascii?Q?x6PorButwt3zPpVg82yxd70BaQM4AGSvRGGfbzcJRiodSZPImMOrYe7jaYEp?=
 =?us-ascii?Q?y6mVLlfaGVzycfxTaryr1dsJ224ExwT/XM14+W69timGFYJ31YUKR+MkH/Jk?=
 =?us-ascii?Q?y0jZXvIvJfv5A7KWQ+rPhBdNShMyTc6lnewGNXwIS77JsxxLRPb64FZi+x+/?=
 =?us-ascii?Q?vIQXFUH2+gOHTeCOH/6ME+nR01Bi/L9GlTfvYU900lJ01AH52iDDbLx9ESed?=
 =?us-ascii?Q?ovSuVdXNm45F/XGWSYxMybh0mupielkdBVlxLJPipivwp/qX/pEUHSYF2rO+?=
 =?us-ascii?Q?BOYCZZtj8pJCXan6CxDMuqZnVIMYE/viaV9cpFxKbdlyFYopIgSFgBkB4Fzs?=
 =?us-ascii?Q?dL/z6nhBFYarKNPziuj8LOiIL/EOgJpwLB9TU7UVhRgRqpIZrVKTXCgDGLAD?=
 =?us-ascii?Q?gycQBe5gRbwy/6gFDaF224jrQapctCzr+I8D72IUf/grhFwxifHj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a10811ef-6216-429a-b1d3-08debda5e5b9
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 17:15:35.5934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yr711KRC6xcyBZRj8rFpw7F0HVAyN4MMSpiOS59ngmLi602BBV2Dm3ordnSwN+wOmM6bIDojv/b+r23vWPRArA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8960

Add a schema for the 10G Lynx SerDes. This is very similar to the modern
form of the 28G Lynx SerDes, which is very much the intention.

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

v1->v2:
- move patch later in series, right before driver
- deliberately ignoring this Sashiko feedback:
  https://lore.kernel.org/linux-phy/20260529125017.ifqunh52gdzhthdg@skbuf/
---
 .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
new file mode 100644
index 000000000000..993f076bba4e
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
@@ -0,0 +1,131 @@
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
+    description:
+      There is intentionally no generic fsl,lynx-10g compatible string due to
+      the hardware inability to report its capabilities, despite having a
+      common register map.
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

