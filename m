Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013023.outbound.protection.outlook.com [52.101.72.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAFA3FADFD;
	Thu, 28 May 2026 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779989054; cv=fail; b=bqlA6MFDdZKvCaLMRtBkrCOTZBV2nKaRH/MrNer8ZvxIEciUd3SKL8QHelF3SETWyEmiinQ8MYkIAO+AhluKjnPSq+CB6TxQoXBpH+QOpC4/BYxIVqPR3a8YlwDME6Q4pcrXGtWlwtSneC28KSvl3w9lZB92hHwTTS0p7O3hHSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779989054; c=relaxed/simple;
	bh=STMw9W7inLUObM+CrBg4gy5Nfc69hS7aueYPSXrd4Og=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kn2Pz9ae5CAIwF05JKyFppiwPZzVphaZ4QeQu50mZg/d75WRlGchWhbnVP95w0idnyWZwsG3cp3kdLkeGYeM7LQmrumFVv2xtuIofM3EaejL/X/x3SZKe14vhmn9KOBQufRVrtff/76MYussHd6BrUyPVEmdsF7oLR/OrLT91Ow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ibHES8TJ; arc=fail smtp.client-ip=52.101.72.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ibHES8TJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tImhgZGNnVRYDrZS1BLm1K9PEmDpXoNz7zZzDZyxVSnBu6zzNox300fpCD5Ygmq/eIc668tL7Xm/vQwXSEDHFp/V7MniGFYN0qKfeEux+zk7lso2iAtID2z9qAwL4I5EkO+zV76DM9omOJTF57Zfjx9MLW2mmSEDUnQYuT7D44kjcc7/u7UPsQ5GQJY2d2ipx/HbRHRKwu5wxB2chB2/xi6sDlMg6O/Iu8+afOmQEusZKwiEvWr/+pNzVOtU+237batesRxDNAP4t3WXxSPSe3aa/06Q34qV8c2fv1nr+Dj6Fwo/IFIc/ZUTJtd4PZOQ8E8HbQAxB/Svybtsbz7fDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNbDw6+PbBDsVo/M/YuzB2SUI8rXqHL/AYb9R3RzatY=;
 b=R/XXBPW4aBvQtPiMVOmYjJYCOx/mg+sCR570hJiGt/nLD/HnsBKyIDGRcWwPfaDm3dxugen+o7vHHpM5XkOX8SCR8nJWNQsHi8B0xF3CHy2/Cy+Nm4t8NogASbzSv12j1sEzvxygHKdJKAtPa1CxyA3qizxhbv48EKx25B8amJpnP57P+NTRqvlf87RlqzA8l3f/4GvlRu6dbiDZI4inZYAOPwZmUZg1B6XyaBvPD5HLrsaXcyDOYvpDLBsCIseKdBBUcj97Cesb/M0EXcugNq2Mmm8ZtdBCvsACeRD188K4r16HsI+BrLAF488jRvTyMmTnHgtVDm5MdlEWOWRzYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNbDw6+PbBDsVo/M/YuzB2SUI8rXqHL/AYb9R3RzatY=;
 b=ibHES8TJssm/rEcH1MyXQ0FVg9XJf9IeWgzRsQylYig+zi2N16gThbNrzvfoO4vDHx9wV0E1oASv1LDPR9CZZOD7U5z2gcgu2OAMP8Xo+yeZw6uc5ypJCzWqdKETzaCr/AZinbmUdz7H4gfEE7kJ629BCeSKZVkEuOK/90MiXukOo1z+BrnUlIKjUZUbj1v7Hld+wXksmPEK3LL/HWOxG88zxIEH81xCYIciglW4uhdwk3oUQfCS9XXajXvLQDtLm7sYrvH31VbnNO9CQJPKK7JsdBkaU14XTVP7IgSetl24h7sBfJYUOUzDWfclhIfwroiOT5n2M0rIGRjkm8uUbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by AM0PR04MB6993.eurprd04.prod.outlook.com (2603:10a6:208:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 17:24:09 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 17:24:09 +0000
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
Subject: [PATCH phy-next 01/13] dt-bindings: phy: lynx-10g: initial document
Date: Thu, 28 May 2026 20:23:52 +0300
Message-Id: <20260528172404.733196-2-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528172404.733196-1-vladimir.oltean@nxp.com>
References: <20260528172404.733196-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR0302CA0016.eurprd03.prod.outlook.com
 (2603:10a6:205:2::29) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|AM0PR04MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c798144-6ab3-4d7b-02f5-08debcddedab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|19092799006|6133799003|3023799007|22082099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	yVuSHResT8vHoH/h4PWgWWdg4WWTQog00RlqT09Q4c3XHvd4KzYNJUyMJCPBMIzlaQM0X2/PGajP2REv+2voW4QVGVffnVMCJd6kkCc5dhn+GSy/mJ/HAsno0PY7KBvP0hooBtSu6PBFRvWzfs7124Hk2J8vG0mVk2Ok5a5jtef+x9rM4SWNjrxXd9nZylCKtTGsL0XZiG2YDzhaHYa5X7jMDQ5kr4986TI+kjaNk94ZXD34jq1FBhx6fy8sO6dRusK7PyW1+M5A1SkvvxKh8RbDSiV0rA7dk9rkztVoxJdbi4+nTAs1WBiY45+bgEbFK9OYrHV9ZmCi0gb1KjlpNFh6RRM9icjOKRbdJksZAUv9wPgBdM9XI5PeK6Ns+eqggqz5MoLcmWMmD9JuJaWhulaQNLYRDkVDPQJEjt5k66tW6uNK7LPk54Z2lq5P6YFrBCIbGKggL3LIEok2sUcq+6d2x5hDa2yYKuiXcb9iLvz4TEHxZytp80WBq+vpDMW5UxWvNplhnfuFilazojr1150jecrtJ9YbxydLTrTUDNN17B+XuX7ISQKQD1SYnA7e50eljHt85tUtcad+7hEl2IviBt3eYWeyjTzd141PgOH4HIdHF7px4sXtth+fjoZvWt6Mr2ofKELRSKmZGpP0gg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(19092799006)(6133799003)(3023799007)(22082099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B/6YE9PbXI2qBP6ahIr5Z4Otsl7TFdmQY+KcdIkSeRFBAr+vX/DiZQTMZhch?=
 =?us-ascii?Q?wD+Um9WJpYX3hLVF+oj6rblbOEnjVoN/vSwfzRvBFD/SnduKOJGXX557dULm?=
 =?us-ascii?Q?LpPUWpcB2pzs0ak+9seA1qFyWnLIdbgZy7w2bO0sSSyvM1Czt10wBkSDTc60?=
 =?us-ascii?Q?UYZjsof8/P8UoiV66GLwQ7JAuxxbHlh6TpkHVOchl88oJv0wz3+GrHN5B9qX?=
 =?us-ascii?Q?Dz1byWEZlhCUDg4cJTcByKp5QafOjIt0N64FOTH/yXDfJUJbymKjKM7YRyi3?=
 =?us-ascii?Q?mXMJy2qDFNNZqzvvFso512N8W7pc+vbTYEgbnoMuqrYrQwQobKAaPG0jT5Vv?=
 =?us-ascii?Q?CCu68J+pNwi4119AjIyc9q09yaXhlL+OBN075/qf+nnPVi1LxNL9hzHHtx1W?=
 =?us-ascii?Q?xp561F9Oi+nhmQ7rR7QWF9D0wu/MlGCp0J+VUgwWNND15pCDMgPaVPs9o9wI?=
 =?us-ascii?Q?KUEGuwNFdt42y3FaOweyfIGs5ES89zQvTMVhLOtWeXohMLzg7ZnO99EL5GaR?=
 =?us-ascii?Q?w7Vms2Xas6pd3Ekql8RiVvcqJELDinh4GnritgdXWwitLgu8Z3mco7segvJM?=
 =?us-ascii?Q?o72EBx/Uls7N5jGXKsyfyIHdVOpOcUt71oriOe+lohTrzI35fB+O3HORF7ot?=
 =?us-ascii?Q?URPfX/b8zh8X40R2G5E2oGzCiTU4v1jDy7N7U8bbTEpIw6JpHR3o33CNaSDD?=
 =?us-ascii?Q?v3ePT5Gg44ZBpM91I59smhcLOPv017SbSa90zOPIeZSMDfHp3Nx4xVtECUxZ?=
 =?us-ascii?Q?TOcNWu0kJcG4QHygOSUytUAnNzceB8ezTkChVioaSv8VcQquPCymuAw2vthL?=
 =?us-ascii?Q?PCbzJUrP7rtnGxDjY9vVVF7B3eHnVdYr9FKtUSheJezEO5X/krVlI5d4oP2n?=
 =?us-ascii?Q?tRzjrgcFiB7ksL1hbt7QMt8IvFxUIdpML1figLch8KUE7nHHSpcL+u/uzmS/?=
 =?us-ascii?Q?Fd5SGRZIozYxLnJc1EE6zXAnK/6NOun6uN4skTCZmx4UhEBCGoEmRZ0AbG4R?=
 =?us-ascii?Q?2HRcgMXR1+4OXr4qD/cf/jaOlz/1Q0EWzuBbiHRfVUKdMY910azqIFccFpvY?=
 =?us-ascii?Q?7oSXg+6R6r+y4FbdlNArb3enypp2mlX6smx1XsnlX75hi8lpv4u/abXSP03D?=
 =?us-ascii?Q?hlfYX2U+gp9JCmODflfQQwZYGOKH9fEbJYCeES2UKUGm//ZDku75bOYR2x0b?=
 =?us-ascii?Q?eJavv1fq9Iw2V7IQZTdAcYMq+Ro8A46S/msfRh+GR8vl3foPo6Ccmfh9fAyE?=
 =?us-ascii?Q?nxuxAvd8NW+JLjoI7zT33OUTS3SiPKrC4kAYWqmkxxHnXvrEfudKtiSurV55?=
 =?us-ascii?Q?uiyhjwXUdjNSClcD8YDeliR11PSlnWjoEofw88TVFOb09DYXF/Ky5Z/73h52?=
 =?us-ascii?Q?NRtM2m6wmu+Vz1f0kI9I2rjVnq9nfpkT2KDrzQ3yj5cBo+Nc5o9uQGx6rHBG?=
 =?us-ascii?Q?jYrhCmIFQZxx3MkRlJeFHDD957ZBRrcJnPbN5lVV/nxhiGl6nnZOq1cCsWA/?=
 =?us-ascii?Q?vjYpmTfKcQf4AwOMKKgIKkudCsoI5DOiTsUOHOUHf5ng6e5TeLPD+8ZFvtfI?=
 =?us-ascii?Q?GAEH0AYt3gBiiJYtf7qKkfpealdxIqV5yQiZTdekTVUMoeedjyhjAh4FWiMG?=
 =?us-ascii?Q?pO1gc8lNxg2YxCyEyS8N+NK/hJditew1RhkiOEoNfAUD3dndykqxIGYZJDXv?=
 =?us-ascii?Q?MltyweA6TBB0BXACzHgRkZofPVpqg92W6CFKOlvHdQsS6KQvh4nDXafY24/2?=
 =?us-ascii?Q?AmtbgRZajuDPoCYnviOXtVLyg5aX9xm7hUtuY740Ivrl/YLjUIvS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c798144-6ab3-4d7b-02f5-08debcddedab
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 17:24:09.5740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJ26SDZm+7vsOe/QGULGWjG/hkaemfkgO0/d+1daPSBS1ZIwfit6O/zFXGn3Z79g/yrHqyWqzUARZwdkEpDr2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6993

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

