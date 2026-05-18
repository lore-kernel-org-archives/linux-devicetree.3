Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013051.outbound.protection.outlook.com [40.107.162.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24DA477E21;
	Mon, 18 May 2026 14:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114069; cv=fail; b=MZo0zwniC+V4sDOqsk0sWLV5mmVBlRgkLfXRY1x5MiCU89awS4kBb6scuiXq463yNbBEcTP8sCxbkyRpGp9mZVOTIwaX7JRpaUjTvl+PjWuuIFqLCUrzsJf/D33uF8qS1wLaobev1EuLPpbg24y0b5Izu1caX48qfuWixiKJl8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114069; c=relaxed/simple;
	bh=lQpytyySWEjS4KQfp1SFWsc7OpU0X/YKSkYEWq0i+rM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kNqQBwrmhZmO6O3jQW1kvpcJ1gQ4ydTwicAGDL33QzNLFlZPrpd6VXISZuqmY56F5DDv86QyzS4OdUhMNSVp2nmiXP7Wc6bG0fj0CE85WPvU4t4K5VHj5WERTEataXDs4q1dyp3yjzDhx00tYKu/gmZXb0mxikRoQqFjCYdllBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lshhfN5M; arc=fail smtp.client-ip=40.107.162.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lshhfN5M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCGjyzYgd3s0peIczWdDUSN9IGyAryAFrUXwN1uKOs6poE/5LTowuFM/pQtQrXkSZNQHrrIWAxpRSuJOwNUUOlqvfLZZxgDqmBFYbwh5kN7uX6jHjMnaOzqcuTaunGPoP29K14fLZ7h+Nm/a5S0XhkfehXPg+jo8kGuyw+jzPToDoTLHGgvXO4gwv94CRNkegYrjj6wz090ksr7cwpLVvhVhoczn/eCHPIdjRE2fmazucVEgBDGZHOPFeRNQMQx7d9ScCG/VpQTUpklpCkAMUF0jodpi5/DxQuDsuk3wDZz3Gv981LaUhEfgdZmheIb2m6B6mp8XQetNVG9UWzvb0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGo9F65WKJSQhwvVFP6+SbsMJraJP8BenfBA9ukTWRQ=;
 b=FnpT1MhLPmzD2oP7HLSKsa+dx3o7D5KANPZt50QOq8i7D/ZK+rgFgWWKGu8USKhChnKNmT7INrYgCEc4mYa2+BiJ+9FpeRYMrPmIEFqWNUhkBFPt3a91P8uUYfums8I1MP85M9Gg3NQT/FNkS62fa2mMceHqknejq1w9SkKxNvQqXxz5dsJlssQmBYJsIwTmPY0Hu78sGgafw5mlKckTKwWtfEEXS6xWqnDyDB/OSRPm3v1MLtcj+/yzCR0db0SwdJoKUkrozFVXb79sQKUMu4+rtFUnOkWhjFzm91FOxAtphK0eflo+IM8r8XHLIUHUTcOfg7rU0Kyy7xpVXw6Y2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGo9F65WKJSQhwvVFP6+SbsMJraJP8BenfBA9ukTWRQ=;
 b=lshhfN5MScaPqyxIpLBptYP4HauZxTcahrdylTJv14JVRWXHFOmjm9jVlr0xFBc+D9mFdcNc7OS/E4srdW7hi/outTs/h97jclLF5IEsi/OhFHvl+uLNJdkZKos1BFDM7dBNtmC2fZLx9R0Nk/I1wQjx2BfqnAHUBLj+tyYPRqCFauvSeVPb1M7Yxhhal/Mp33jUjHd1aVj3CySJADFmn3wvW/h73SVUeYLCBRDAYE6lRIU6RBVMSzTxXVhPWRoQ3D4C4dOjcmxdRa23D+i6pytzWK0bRbsfkPV6UqTYn6eAAdB/f+S4+wRf1KvUIgwe+drkBRBppSH6J5VkuWSUlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com (2603:10a6:102:89::16)
 by GV4PR04MB11793.eurprd04.prod.outlook.com (2603:10a6:150:2dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 14:20:47 +0000
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d]) by PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d%5]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 14:20:47 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	johan@kernel.org,
	linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 linux-phy 1/3] dt-bindings: phy: add PHY bindings for the TI DS125DF111 Retimer PHY
Date: Mon, 18 May 2026 17:20:24 +0300
Message-Id: <20260518142026.3098496-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518142026.3098496-1-ioana.ciornei@nxp.com>
References: <20260518142026.3098496-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0030.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::16) To PR3PR04MB7402.eurprd04.prod.outlook.com
 (2603:10a6:102:89::16)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7402:EE_|GV4PR04MB11793:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d7c8ff-1746-44e7-115b-08deb4e8a74d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|11063799003|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GoBpHOvfldx0EOCh6WBjSwvaLGrUgKKwt5BoxIADu3KzCv7wz0eaSOrs2dJy+2YhsKU2z2dBQfDLIfSl3lgx03AUK/9hMC8QM1jf8USz2aSuWkfhYNlDEViVJdB2PYp+3bh8Z8J3sMXOj6k8GgzZQ3UUuhRgaLnQpypJq45WjZQa+kZO53rdlzMgLP5cBmH/B4o1idZg6ExVQr9GrzIN4R2kTKAjNKO34mrvl69Sz31+EyxYCojSrrC7wcO8ITF610VnN1tVUWaMQFE3LZi9zR1ImwxESFqo6mIByaQX++JVSppTNOFHKpWX0ZqVn+oVXpsM9N2vLTpRlBF0bzcanvjxn82XKPx3RvPafyqAOfLtKpgG+MgcFTk4P6hmdeehGlIncIFWc6aSlhn3443atKgqFE96Sda9sJjGOEQ6cfuv1aqxhcXE0ApP0LIkB5jTIp2a4RmHBTp1Nfz/qe9WRzjqjKzMv6Q+mgJDybzTajZRsbIxUmk72psSgLQGA90IizDEeaqj3qxV9cvWjEmyBmW2Ket+QpRk69b3seGQaHfkCEBzWwq+0K9avePwelXpDMXMZ0fPlOFyguy6UHFyvQkdTtx7YkCGN+yeReWsqWzsBChCNBRl8zXUc5oPuo6WLcsXiuA+h0BllVKclBhhQA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7402.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(11063799003)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s409AEyXcwKi8CsfCgcGoYnSgW53MaIfEz+aNWQpQaVsWbCsxpYRn3TO+oy8?=
 =?us-ascii?Q?8H3VoZ9IQQuLIoPpaX7I3FWjrUiSm1C0dVKsA1KaYE6eDu6jCiI/apBgfEVK?=
 =?us-ascii?Q?SM7So77XJ8H5SogUIPy8WL2assPYyNL5gdBksl3WTm+p00a7YF9/OJ4Ruv80?=
 =?us-ascii?Q?Q27I+THByrC9xNH+kIaWjxWUQJYY3dtn6w5+87Uvi0qG2OK9RMkWklqstNDe?=
 =?us-ascii?Q?ypqxN2OEVLX5Ho+Koqzdgl1t5PG9nRZJI+dov8TJR9lqkkJTSYHf1n4zvxT1?=
 =?us-ascii?Q?MzAlW8NUD3xSxvHPMpoJUZOM8Oa1okGJ7vqJxWCeX2vAMQQUJ765zixKHVZ4?=
 =?us-ascii?Q?jHQkxS0rtfKpruVJLL9fhssoTmYiHuVOFRwQPu8q94ugYrvTzmUP/xILMk62?=
 =?us-ascii?Q?Nbrn37qivGqB3Vfnx3Xw47AfAyQbTo2u7/WobInAVMkcE194k5XmIvUFbDXD?=
 =?us-ascii?Q?zC4XYSpHZ2EbqK4uWBwteNfRYNKV8mE1d+u0QHepCOQY04xwR/GnZ9nDWmuS?=
 =?us-ascii?Q?h/SILErD8AR1A76fW3AmGGX8yYqXsL0OTKLODz3fUdG59OYvC58ZPBPBz0ci?=
 =?us-ascii?Q?ol+zT2ioBSKUMjOSkhbIfvk+2bjF+Vr4AO5UEWMSegpgjLkJew3gmAXhKR0D?=
 =?us-ascii?Q?6UPxIpsW3wezi/FmFb+FZBBVgVCufiiaSX+fetOy5cZ8hqYgdSE500In3Zwn?=
 =?us-ascii?Q?nFm+uw7WX59jHhjG1LWmIGkYxVfCTEQoTh+lXgcS8VTXu/igmfMthVnoEb75?=
 =?us-ascii?Q?Rhv3EYWTBvhuV5LUEAadxxBcIUSPNl0DdYyeTngeJX1e64ycUz0dCeSCM6KP?=
 =?us-ascii?Q?f8oTCiRvrTTxfwCB4uP82NJsruD/4ZRnaO6No242x8PwhTlZNBfR4qSe4NQ5?=
 =?us-ascii?Q?IYK2ZhHBNaKuZZXG4nzE0uhwNuvZ9G2DUrAUAfyqURn9kVWSIUx8FPgvvSEB?=
 =?us-ascii?Q?6c09E6B5XpPA5adZEsvGQ5SxETVNfKX/27nBQzOPzB3KvcA71oEU8KMhTuSC?=
 =?us-ascii?Q?Ju/fNnQGyNmGwfEC7zkXrVuthe+Sp4CYfl6FJ9Ct3hJRAJg3lYzpsrKUFQ3n?=
 =?us-ascii?Q?Z1824tlMBl0TMs9808Gz0j7LEgcIQxE+O4b6wDtGK4XvmVA4B8J341Jvlbyn?=
 =?us-ascii?Q?uAapU+mJjBbLBMstpHbIZluG3/QXuN8TKWePSmAsueZkj7Ew+aqCx7MAIk+2?=
 =?us-ascii?Q?i03R/O1Q4S3s/rBNj/yozhUzdlI4uBvTmlUhXxeINo6kn8z41K3PHKtP785g?=
 =?us-ascii?Q?3RV0C9EGUJheeXWC6iyWKNqp4yqTggRnRnNqQgDfO694H7rjS1Lw/5LCnuq4?=
 =?us-ascii?Q?Al5wWma1xq51PQbyVGgq4H9wy+Ol494XzBNXHzS+EQc0IbYC1DI2NntwL5Wh?=
 =?us-ascii?Q?GxNe/juHr6sg2yZ1Qy3yIK9UZCCRZ5qc3L+WiplizVR/5ymZYtDVlFbj/fsY?=
 =?us-ascii?Q?Bq8z5vqFwJ288DUHN1tNKoonYD6iI6PZHWseBMc4RwXjp5Xm8ZqWHJN6+0+r?=
 =?us-ascii?Q?4223zBIlKv06obNZQXk7vnh6mEsHCZ8pQBtkREEVRjd4nJS0DlBixDuKVmQV?=
 =?us-ascii?Q?PmpUv6cZBJIR82wWgEs5LEBPBbJuS/D82i1MLDPocUbcAIAo+I2E0Mw5Re1v?=
 =?us-ascii?Q?02aGQ+P6QyNuBv9kvJUNgoP8ljJEaGEJIU8i4R//b5FK6E7cQKJDxIrXh1MZ?=
 =?us-ascii?Q?MdnleU9ukAlI68zhRQPrezTRCDmG6nJq3hp7HFyNv3i+RnAYb664AhK+knBI?=
 =?us-ascii?Q?MHLSvYOKOQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d7c8ff-1746-44e7-115b-08deb4e8a74d
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7402.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 14:20:46.6343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KfImDPXxuUd9ymL5T85ABpMR7wxpBU8RoeVbfwCIdAz12vnHZe58Kae0EQDg8RL1AnrAsTRcCEqOAvDryHd4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11793

Add device tree binding for the TI DS125DF111 Retimer PHY.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- Remove the label from the example
- Rename the node from 'retimer' to 'phy'
---
 .../bindings/phy/ti,ds125df111.yaml           | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/ti,ds125df111.yaml

diff --git a/Documentation/devicetree/bindings/phy/ti,ds125df111.yaml b/Documentation/devicetree/bindings/phy/ti,ds125df111.yaml
new file mode 100644
index 000000000000..ca4605f1d664
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/ti,ds125df111.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/ti,ds125df111.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DS125DF111 Retimer PHY
+
+description:
+  This binding describes the TI DS125DF111 multi-protocol Retimer PHY.
+
+maintainers:
+  - Ioana Ciornei <ioana.ciornei@nxp.com>
+
+properties:
+  compatible:
+    const: ti,ds125df111
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 1
+    description: |
+      The phandle's argument in the PHY specifier selects one of the two
+      channels of the retimer
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      phy@18 {
+        compatible = "ti,ds125df111";
+        reg = <0x18>;
+        #phy-cells = <1>;
+      };
+    };
-- 
2.25.1

