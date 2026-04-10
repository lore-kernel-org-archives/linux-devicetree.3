Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2119.outbound.protection.partner.outlook.cn [139.219.146.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43F03A1D14;
	Fri, 10 Apr 2026 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811694; cv=fail; b=ldvMwsNNVYTovZgi/RsxQHiJs51RSbblBAo6/mYy6RW4nC63DOO1GFu+/xD0xeSZrO5vkLmVO4sGdp2/ypcBAwKyt84db78JIOtp3pUsQZBWSd/BCyGVVmQxubqBZWRm9YflpXIBnb2srk3n65JugG1FOj0P0kGx2T3s9Vjx++A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811694; c=relaxed/simple;
	bh=U7Nqfo/gJkLltbvRdqDWHD5aX/QkBbl/n5msFi1032g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AP/5uPWpK8BB4oU2pOvcrdK7ohXGq42VYKEQPnmQVKVGNGxxGZug7dci32Yy8TWbwDrqyj6WmhybhyUfgib2jU+wEEi9chHyOscq5uDA0dcWkDvgP4e7UVIi81AnbPjMF1RcoIU7yHu2VMfBs6V6fnVt4sTkRQQbHIV8Qruv9Uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNFtpsyzlYLWpFY3zNZkruxFPsmSaf+iOyQzFjiVdkO7Pa48EOMm8tX1je6Uwe9HQ5q+xH6ke32eMM6SRzSbdVmfBHIJbXFi6JN5eWqjeHShC+4FP6sWh+LBWnrIqpcVn44i3eoYXbTMn2B4+UU20S78m4ah4wPkr7+VTM/UPCT2n2/v13TXIsuVDaCYgHye2xQXRiPHz6735IX54YdBb9IU4fjGB07vwF0HSDToF2OmJSukpCb2TPN70RI/LTDgJ1mWyM1s1EnYTFOpWSeg43O8KjMjnCzQjxsu9ZIEUCVtdejXLNps+zmsxyVOubvDF5uCgpukIMlHBucFgVZ1ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtAxS0xUP8NB5BFDWdOHwyLEuxWVJlM+zSWD6Ou2CyY=;
 b=NSwAO3pcCFrYEkFhZnSxpkHIWROkn5UUUHhk3eUFCj54aBkwecS0vC4SK1iKi8utOSVKDOz08X8QnIwVgA+oDkUTp/riv8R2VnuKsYKHH78thvKH6loSfdmPV1WHKlc1ZIJR9TR8/RAW8DLFXwtYxlG7d+l4adNlk//nbu5qPhx/ExEUtIXTJD6f3OBJww9i0u8ge5zTIgViBfMFI+7SvqT42ypCAXFE7OmZjtDAWV+MV5901ujd/4dSdVl3HM203n/B+IrDLmeWWkHlhYxlqkFxGpUMeF0j0ZQy+yzC0EErxdniPmzMcs/JHZ7FxKd1KayiD7cfss/u5ST5QftZsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1218.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 09:01:15 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 10 Apr 2026 09:01:15 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 1/5] dt-bindings: interrupt-controller: Convert the word "jh8100" to "jhb100"
Date: Fri, 10 Apr 2026 02:01:02 -0700
Message-Id: <20260410090106.622781-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
References: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0017.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::6) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1218:EE_
X-MS-Office365-Filtering-Correlation-Id: 57f414db-5a46-4653-d279-08de96dfb8d1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|56012099003|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uWi/utukRCCXE9/62gqPT8PGu3MrCsmDu0DtVpDnsRhhrWzvBSFMUOlCKORG3gaWCwSaZDsKqIcUmXGsV/NBKZWtgMRqzT9Lgiif9h1oxLmQoQxG+LeLIZ2UfzhApQJ9YLWd/ag3xLjnArsbNFohWBB/8qVN0f8PRmbFHC3X9BEERjQn3Li7m8nP0tYBjv4XyX3BcFaygbcpMV1aUr8uKHuFGw7uoMMPOl3kg1dipDF47z6m2IFgD5+2bIyfROT9KkvdNBgkkGUgW7se+kpHpeL2Kt0jngYPimc8m7xBdatB/0gYHPRvpYPcFetor7uYBDSt7z9IYGXqrY4aPDGPGcom6NK1tOnNw0uo8512Ati4chVaDKCgbUJ54D/uqjSq2h3DcgEfESDWj1+Z2u2sYBgISnTx+aFTvQYx/uFWFWdCWNc/rv5Uq0TEvwWkWXU1/v6gH++5wmIZSE4WcXeBn9zbvljmF4iFto2z57JQg7/Vm/oKk7NgeoHWpoFeT8mx2SyJzWBJ+cyUCWri1fye2xAetpSWBOHrDmH5L02eO3ywWKLQ2WqxrPDL31zd/muj01x7wzaZZjEYfSWs1YD8+hVXsk4/pkJzdaWH6vMCaqQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(56012099003)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?80wuooCIfedW47Cr0a659uh4VzjtrTC88dpMoJ5sMQtrdx/ZAdzU6LJnCxPv?=
 =?us-ascii?Q?nnQbEDe8JgY97N0fuKjZJ12eKGUuf6nvRR3RanQneDS7CMvSM+kkpNgMlFCk?=
 =?us-ascii?Q?tAzh8rIj9t6q68GKjZ/hu4/9UOIpI2X7EvotNNuv4Thf5q58Jb0IvuZ0CEBD?=
 =?us-ascii?Q?zzEYjDPM/1AfWYh9O1n5eDJWF3yjG89piKkZx0Q+q1qY+306kJ0VqW2gR0vQ?=
 =?us-ascii?Q?ibZ4OLr7jLJK7ZIN21KHCYkzwhtR7fzvkCCbo+SfUYdyu0JFOH0p53mIyf/m?=
 =?us-ascii?Q?gpzF5nexzUmuW5vqCFCH/RkcSn5IQn0mxI2WIZQutig33i9hv2SjQHtLtBHD?=
 =?us-ascii?Q?LW+CxTJsDDgjj6PAl0uTSdw4FzGOd8Wj2VQtxM1HMFB2iwfHPq0JK70PVVaQ?=
 =?us-ascii?Q?dDt1fCC7IU4BDO2kPP2OnlXpCHNhcO4BCJaygV7nEDFIiZFerUzyem4DtC52?=
 =?us-ascii?Q?GT/lpES8ofepOoLshsRJrDBq3BoKihQAzLgQ4vgEMLvEuMRAD1//d5u/KiGy?=
 =?us-ascii?Q?WEi63a6XX2lnZtUMY2IWCDFCPmolZmSGDKQ41bE04hwl3nTPxZjk3e4Aobdy?=
 =?us-ascii?Q?2gkwzzrTxL14Zvu3ErxZTaVNXXoh93JYbNp7+uDknTTOG6IADFH5Pg6Dhx+C?=
 =?us-ascii?Q?31fvn2zpi8g6mwsIEibXWH+czvlMl7HmpA0m6DL5kMO7t1tPV1njxMd8U06k?=
 =?us-ascii?Q?XeUo3CF+syt9S+yRuA/WB1FR3jPGZkyrMmpmWyj0sEE+UPjisJFslicweMUr?=
 =?us-ascii?Q?sNMJeruogTlSLAQHzCRgEjrzVeFvMeJqFI149huM+Gsqdv+8GmIPcFCHEFnh?=
 =?us-ascii?Q?kkmm4DWi278dMhV6FQCrGX+R70OeY42Ce8LGBJND6Zv/WdSnt2a+08/wCNbe?=
 =?us-ascii?Q?OgcBRAx29lYUV18wMXkvxpboAB8CXW3tvjb73kgXhniGwN68K2Ns71CM23id?=
 =?us-ascii?Q?7YNytaGevWuiMXeB/1a+zooEX4x1REMgQs2DzcuJLLjrgLCEoNQD6qmwzATn?=
 =?us-ascii?Q?MkefVpL77edy40O3Ir61tRRbiAmJVOVZLz/ZIcWccDlWFlD4Ee2SoR1kyIKJ?=
 =?us-ascii?Q?X3vzK75lgvx0auyILXpiRiQIOnUQj9lI9DRcYwoG7Oajj7PCQpkDmTGp193g?=
 =?us-ascii?Q?2Kcdf0WWihNeYynA1i+eIqMdH6uS1XGeY/bHZ+JXRZ6iQHoIIy3xRZ9872KE?=
 =?us-ascii?Q?2vS0zPL2BatOhx8fMeeA0wYYHpVjJxZTBxAPP/doqfYKk4UEhf/80eMkfCIx?=
 =?us-ascii?Q?77umlNeLpNdkc/8pIOBFPcUE4EYlWNo2VrZiAsgFhkQ/TmnhrfUkgTMv33ar?=
 =?us-ascii?Q?kzRBeIhhFjTXYue7jQ34jprUpeswQywdvvGbtW8esMDdF67AYkPMyhsC70/7?=
 =?us-ascii?Q?eheBu2BFYw6C4XZb9fmjp/1QGf0wktBz4VU91DrwRiusSNSihrgDzYlPQXt2?=
 =?us-ascii?Q?71Ig/Qy2d/y+fTk3jv5LhQ8cL47zwUdtRpTCk3AzPYc+sKSEYP6LF+EYafJq?=
 =?us-ascii?Q?LaRUv/qRrRzI9yUajr5ze4U9hwLi8szgvx9rz/EeEMpeuyM957QhjVk9kOOS?=
 =?us-ascii?Q?MLjqE1tOJ+oVLK0RYwRaSsnlYjfvgZ3RB6Rxr2YMV4ZNcQgusR4tsD+spFzx?=
 =?us-ascii?Q?gRLjW/08YHxCTTbX0y2ASO79YMn1z1laUr0moP9jTWMwMOvAtD12A0DdHpov?=
 =?us-ascii?Q?GQFrkATkXuEy08azO8hf16W9GfxRcW8BOT4wr8Nl+5Tepi1Wznbi2sDQQadO?=
 =?us-ascii?Q?xcalk4xoFMhkw8/JNcn/e0cRBZVc/PE1KIlzwQh6pjh0d5LdtvrA?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f414db-5a46-4653-d279-08de96dfb8d1
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 09:01:15.6523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+h87bK39cgX5sJzRSwZgTf5/tqLxST39t4u1IVhkcoL1Cvd0Q80s5LSHJwK4P4bZ+Kqq7vaguGYxvxUW3c3PgNP/VzGsk/1dWd8BKJEi6QqH/6hgA08/IkCpKU7ipi6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1218

The StarFive JH8100 SoC was discontinued before production. The
newly taped-out JHB100 SoC uses the same interrupt controller IP.

Rename the binding file, compatible string, and MAINTAINERS entry
from "jh8100" to "jhb100". In JHB100 SoC, The clocks and resets are
not operated by users, but they exist in the hardware. Mark them as
optional.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 ...ve,jh8100-intc.yaml => starfive,jhb100-intc.yaml} | 12 ++++--------
 MAINTAINERS                                          |  2 +-
 2 files changed, 5 insertions(+), 9 deletions(-)
 rename Documentation/devicetree/bindings/interrupt-controller/{starfive,jh8100-intc.yaml => starfive,jhb100-intc.yaml} (81%)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/starfive,jh8100-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/starfive,jhb100-intc.yaml
similarity index 81%
rename from Documentation/devicetree/bindings/interrupt-controller/starfive,jh8100-intc.yaml
rename to Documentation/devicetree/bindings/interrupt-controller/starfive,jhb100-intc.yaml
index ada5788602d6..576b1d6c7973 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/starfive,jh8100-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/starfive,jhb100-intc.yaml
@@ -1,13 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/interrupt-controller/starfive,jh8100-intc.yaml#
+$id: http://devicetree.org/schemas/interrupt-controller/starfive,jhb100-intc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: StarFive External Interrupt Controller
 
 description:
-  StarFive SoC JH8100 contain a external interrupt controller. It can be used
+  StarFive SoC JHB100 contain a external interrupt controller. It can be used
   to handle high-level input interrupt signals. It also send the output
   interrupt signal to RISC-V PLIC.
 
@@ -16,7 +16,7 @@ maintainers:
 
 properties:
   compatible:
-    const: starfive,jh8100-intc
+    const: starfive,jhb100-intc
 
   reg:
     maxItems: 1
@@ -40,8 +40,6 @@ properties:
 required:
   - compatible
   - reg
-  - clocks
-  - resets
   - interrupts
   - interrupt-controller
   - "#interrupt-cells"
@@ -51,10 +49,8 @@ additionalProperties: false
 examples:
   - |
     interrupt-controller@12260000 {
-      compatible = "starfive,jh8100-intc";
+      compatible = "starfive,jhb100-intc";
       reg = <0x12260000 0x10000>;
-      clocks = <&syscrg_ne 76>;
-      resets = <&syscrg_ne 13>;
       interrupts = <45>;
       interrupt-controller;
       #interrupt-cells = <1>;
diff --git a/MAINTAINERS b/MAINTAINERS
index d238590a31f2..a2961727e3d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25312,7 +25312,7 @@ F:	drivers/phy/starfive/phy-jh7110-usb.c
 STARFIVE JH8100 EXTERNAL INTERRUPT CONTROLLER DRIVER
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 S:	Supported
-F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jh8100-intc.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jhb100-intc.yaml
 F:	drivers/irqchip/irq-starfive-jh8100-intc.c
 
 STATIC BRANCH/CALL
-- 
2.25.1

