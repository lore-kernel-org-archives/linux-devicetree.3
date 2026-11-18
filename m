Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.135
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794983149;
	b=eDBlb7LUKdK+MtPZnWJEfCtsaZlSU6Sm5nXBkn0vnzfSfwUNhGHWdC3FNe2O3pV9YP7m
	 K6bS3Iu5qwb82RW+LwgR2orGE+mXZNlO9biYUUgL9m2P7yHcobayrZk95sAubS+eVYmkR
	 VJvWG+R5KiUKx9uL7zwVUfp5KKU0mhqNIV3cJ2SyBwO84ddgYQNjs85WNyDcp0o0SxXwx
	 CeopBbJZ8kArN2JLSzKDZ+sg889P+ViYOgvjPQjF21VLchY2pPbhQLKpfvCrXeCwhcRH8
	 l/u24Dngxmi7aWyey4rEYe8fP5eA54TT8rH70J8JaazJCEfZGA/wowkBmJihikpXkBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983149;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=VVL7Nqm/9PF2qZk/m17eIAcRR+GA6Z5temA8Zr16ey0=;
	b=HM7ORjHCXyTMZu9HfV/cuOBcbkbqIVYeKZPDTs1yfRrDMRloOgjcPW0sseAZGdQf2R3V
	 sDAFmOu1qGUhGD5iLTVSKj/0TNJI2PO65NGK1KKrRa+HxngiL7iywqBwDML6Xq2wWxq+O
	 5rD0XHl+eCfdOh4hWTiKRzCIKhMD5rpkO9eHQM2z6JpaU6s/NsW7/n9SxMKxjkIc/VJpz
	 SWWYX37r7a8MlkfaIn2uzpWZy/EpAPkY5rboCx9CeWFPu1JxI0VQYJOsbxYb4bJ9Sodyq
	 avH43eUIwGqxi4WIn18FzpyS46pfAx03TVaOOdbG/JdOUZaCDQ+OFOT7boejJv+5NnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.135
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2135.outbound.protection.partner.outlook.cn [139.219.146.135])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188BA606A325;
	Wed, 18 Nov 2026 06:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 188BA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A40rTR+vmBt49RhYx8Ic1jOcVPklvq2ItcNaMcqmgDT5jjEvqiXSodrvpHSL/793wWiGA5jnVqxQSW+l01ogjFLURX4waiTe/Gsoj0upQETaakT24ReM7HuroCTE68e9P4dNkPUIwxfInJ9d1SpgfyPME11/92lIDQRllwkbMgqLe0qawajGVJOJtw74tCKsFso/tDu009YVu+1GwNNJovSCZrXIkEhOytj65bU+c1uDh5FhTKnPiPSfM2CX+WjoOFHoz8cUmmMjArHNVFw/L6PqK+b0nmjfNWRon88h+Matj9ES0gth28FsKNDeYUwzx8PfgY+jWkqJIdI9X58wzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVL7Nqm/9PF2qZk/m17eIAcRR+GA6Z5temA8Zr16ey0=;
 b=MT9oF0XNpqYRxJJZiR5mnNCwKxiC6GeJ3aq6E1H/3cZNPoYnUG4GrXB1L2nMohl9vU8zDWUACDEPE6QyMcUO14WSLnD0BKTWHU6HPPsd6KSw2iymK/YRViqpI73e9yDyNojw8taf+Fhds8NgCreDSq47ZJP9SZXtKRE04/1Ke4kx4B2GX76LRPLrHPIwZ69Ttil8akoufDbq8I/k/QKo9oVBnpNlCaDZ5tgK0ofpZaacwP6OgxhfIMVEYUIRWokjnUH9DWPdtrFwu0+2Rdd9MEz9yirw7Qzn7fpt/IXNSFhnP8Wuv2vqfht7rdJl1N18UG9ciPGwBEV5d2V3INe8wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:d::12) by BJSPR01MB0785.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 06:25:34 +0000
Received: from BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn
 ([fe80::c362:8d6f:de71:524d]) by
 BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn ([fe80::c362:8d6f:de71:524d%7])
 with mapi id 15.21.0592.012; Wed, 18 Nov 2026 06:25:34 +0000
From: Mason Huo <mason.huo@starfivetech.com>
To: Corey Minyard <corey@minyard.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Mason Huo <mason.huo@starfivetech.com>
Subject: [PATCH vV 1/2] dt-bindings: ipmi: Convert starfive,kcs-bmc to DT schema
Date: Wed, 18 Nov 2026 14:25:25 +0800
Message-ID: <20261118062526.1436893-2-mason.huo@starfivetech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261118062526.1436893-1-mason.huo@starfivetech.com>
References: <20261118062526.1436893-1-mason.huo@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0023.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::11) To BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:d::12)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0577:EE_|BJSPR01MB0785:EE_
X-MS-Office365-Filtering-Correlation-Id: 2364d28b-7def-4113-3b65-08df453cc039
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|38350700014|56012099006|261021135927099003|261022105027099003|10067099003|261028144727099003|261026121527099003|261021121427099003|261102123227099003|261026140227099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Rg6O3EhajtfPf5ECKgTgey9tH+UNBRXBbqDbVSzGyDCkpQBBG3l8xR/rIXGidfFYW1YZa42UUxBsWRIypg/zHcgU3ceKDtDA4+I+n0GgfgDXwJqqgq+tGv46E8ff79+MyziVbPuxOLUbCTJys5f3GBoD728CdKQfhMakxaQE0YzeDKHaTEvyj9ohnwR2g4gyG4J30ZZilVnvYKTDmM+v0pdD2X/N4UtI+Y/dUN23wKGCY312FavZat0Zcg8HxfJ48lWWxDhkNKR3CZTnAT3zvzmFA/NzeMbXt+BoXcSTSuLDIQAi8ZbtqmEXys2uZo0fjt/I09VSpEqy5g9ojNgoSSw3MYc4daxY/y5KU7hTCCLb5tl7JHKjzP5DnB3AClgpM4PCUkpp3XmnvaJ4wxF1fSGkzgX4AkOLDGs0/VxIQEaNQu2bh6eOpx4UwU4STyz78He5BYNpSDmI6mSaDtgBy0ubVWeeyi2tYFx7pUSqBW6Gd4GZ+pefLpPNWUqDKq2MZI2YWrwZLtq+N7DgWYSuwTN4795JRosRNLWVA75Ayarp0qnudkOsE7o5n/4hs0qB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(38350700014)(56012099006)(261021135927099003)(261022105027099003)(10067099003)(261028144727099003)(261026121527099003)(261021121427099003)(261102123227099003)(261026140227099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8wym2vc14zmQw9b5BajLcnxmRuDqqPiw+fnABdhHkbMOWr1aPr1gajXQmvRR?=
 =?us-ascii?Q?0PAGc/SCLjRZbMCs6k+cS7l2+/vz9UEVUkf/n3+yFpTVG8tu4YVocHtZKX9P?=
 =?us-ascii?Q?HKQUTx9F3knk2hz00B1Ts8PUUz8Mj4AfL8vgXHr4qmEkrbziicnn3s5GYrPV?=
 =?us-ascii?Q?XFcLfap9vljDdHEw+t60pUhGiVgih5uJ1pfqu477ww+/2MACB29foYPbQQci?=
 =?us-ascii?Q?9ncivrSMuBJCfixV4oWJKiL50lOPxMnKPKtuNJTiKZi0t/0R+dXtx4yzqqFA?=
 =?us-ascii?Q?X2IHfZVf2UdM+wq7uAcOoXDMEnwdxcSE7s7LnqUwFQkToaWKTzctB8EDbvnu?=
 =?us-ascii?Q?U6xPTsGsDxRDm/vjugCTO3YWuRov8kP12XVkQ8VAQVr5fjPFJi6WbsYwcLVr?=
 =?us-ascii?Q?nKmOmmSkLBNk53SAjpgLnH1spcoBq0UTzJOn8Sx7TdZ45qaNuIKE6fsYoK6O?=
 =?us-ascii?Q?W99dICwrpGnUwp3pukMNJi7BSpn5duqXBm0YEgO61Ptpi7uOLKGv1i8JPeTv?=
 =?us-ascii?Q?Ud7pjszHwBGjw2e/p1VONwIUcyXzZjqmHggDUePjgAoMn2NWiAB1xc6SjdmD?=
 =?us-ascii?Q?1tomK3WlHlR8EB2pbYw+TBv93xWBulEOlJYt97ogvtrpA77PmTD+ksjVlJyz?=
 =?us-ascii?Q?vC1IwmkkHdVS1P24J3kQUEX3hzeo6UdxbYhAj24KC22J6z+3ruzEAWZsW7XQ?=
 =?us-ascii?Q?u9orB9HAYJg/Gs2VD3akCjomqvyWMru1CHC/Jct7H/af4YdShSVmhs9zyd2R?=
 =?us-ascii?Q?+1PtVOK0P9iEVxq1h+3oDoy5OZKcgBKZifbKTrtB3Anu7+UKGUTpUsV8IQZZ?=
 =?us-ascii?Q?QrZBs3c1uCA/kmjuNrAJ//IA7KF9QZSwTxWaGfN6IMwi+ZKnDvUQg/XlwKYC?=
 =?us-ascii?Q?aV8ude+cpVGb+MDSx0FXrXB5/XeaAtfPt/1MO3Wyv03EwMXiSP/GBtfEDcpZ?=
 =?us-ascii?Q?HMvP1C0ASwg2MuA1v3uPhAY0ODuSMrpY3f0Zb91u6C1sg7J09qojE52tN0Th?=
 =?us-ascii?Q?BnDCji09OevzeiJSKj2yHwJ8J4PJtBgoO/CtxEcDy+NkGkr4Zk0JVvux3ZaC?=
 =?us-ascii?Q?qxF8R94OvsJGr18d6+UGeztMvj08Oliytyz6Id9Ti9FvZs/lw5WjrenixivR?=
 =?us-ascii?Q?d+BbvQEZaEz/GTbIm1lMS27u2BoR70UkF4FQY2rqaCV0VvnK85pC4mGR8RRh?=
 =?us-ascii?Q?i4jkssMlPFd8p1EMzXJNpiZ7pF++lS4PE2ErRq0TcN8KYbZAri3VhgdCowMD?=
 =?us-ascii?Q?7lTGTYn1cDMAvoyGMOZHHlUacFLSFHD6si2YFY3AI3/cWmFSQCUQZeS+LecS?=
 =?us-ascii?Q?qiYFyaJEB9u9CNdH6FNntqAI/L5JPwN7CA3azhVZ9K6DYjOaQ1OZV2k0pSav?=
 =?us-ascii?Q?TZFYwoqVu4NMTDcTXNEP2V0W9fNgd9JssdLWodjnM+yzpIKC0ZAmMuLIif+n?=
 =?us-ascii?Q?5aWl6qqH8nieUe6K5HUA4ILnlnnkUgj1TSTJMtLD1GFpJTsKLv4E6DM89NLW?=
 =?us-ascii?Q?+gJyzIEfs3g5vqG1gXNPLTplHsE4gY4u9EJdlyOOaSHa22shkWkxwqwvQlo1?=
 =?us-ascii?Q?GEaGoEeRoWmv1Qd5zN0RR1JDJrePDPozSdvOd/NJKoYqWlHm/x6OSxyxDFUt?=
 =?us-ascii?Q?6FAgmhLRznNBxBBA0NcTooUqbmJks/XZoAohPrWAxe8NjEDf81fXcyKVkIdT?=
 =?us-ascii?Q?WTledDmW39LQnfoB8ZQ8BMopupjiSvIFUyewZhbjNlPa7YlpFhjhIYimyKIC?=
 =?us-ascii?Q?E+oHcqafUME6HZWS1Bs9wzudXs0mTck=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2364d28b-7def-4113-3b65-08df453cc039
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 06:25:33.6494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2GnWILAihLlW7HkeZmLlgeNhmfYFZDbj4xfWObAX7KB6BHfo6ZqbT0H91/BUVLUX0giRNAYEimubPpOPFONTQlcLs0aeP1swrR211Xkav8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0785

Convert the starfive,kcs-bmc binding to DT schema format.

Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
---
 .../bindings/ipmi/starfive,kcs-bmc.yaml       | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ipmi/starfive,kcs-bmc.yaml

diff --git a/Documentation/devicetree/bindings/ipmi/starfive,kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/starfive,kcs-bmc.yaml
new file mode 100644
index 000000000000..2cb91d321a32
--- /dev/null
+++ b/Documentation/devicetree/bindings/ipmi/starfive,kcs-bmc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ipmi/starfive,kcs-bmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive BMC KCS Devices
+
+maintainers:
+  - Mason Huo <mason.huo@starfivetech.com>
+
+description:
+  The StarFive BMC SoCs use Keyboard-Controller-Style (KCS) interfaces on
+  the eSPI bus for in-band IPMI communication with their host. The KCS
+  channels are part of a Super I/O (SIO) block and each channel occupies a
+  0x100 byte register window, starting at offset 0x200 of the SIO register
+  space. A channel is identified by its register offset and the
+  "starfive,sio-id" of the parent SIO node.
+
+properties:
+  compatible:
+    enum:
+      - starfive,jhb100-kcs-bmc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: KCS channel interrupt
+      - description: eSPI bus reset de-assertion interrupt
+
+  interrupt-names:
+    items:
+      - const: kcs
+      - const: espi_rst
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    kcs@200 {
+        compatible = "starfive,jhb100-kcs-bmc";
+        reg = <0x200 0x100>;
+        interrupts = <282>, <57>;
+        interrupt-names = "kcs", "espi_rst";
+    };
-- 
2.50.1

