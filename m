Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2092.outbound.protection.partner.outlook.cn [139.219.17.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E21303CB0;
	Thu, 16 Apr 2026 09:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776332050; cv=fail; b=qXcg8I6UPWBLmrY1xGfSbO8NNrhT3ewCUU3XvDlIIVgIcnfH0YHA1hk8o0CBG7mNYUawWkEOohZqJWPU/BC8gjbZvcw0OGg5e8mC0d5ymjJ6ek7CSJsltj6MLcAUZ8H9/neqwoewCpVTsup0Ghcuo39PoaKO9C082XWr8eImeaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776332050; c=relaxed/simple;
	bh=6uCigOKy99cNMD8GHBtsEJZQyY8wjb6D5eq1n9VOPP4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JfeFY7yTnWHS/Goc4Bs5INzZ9BTvGoQKw6JN+ql3QdN5WXncWRTSEDIieCFBX4sR6Yytrniw9GrQ+gy5WUkc96sB9DSEQ863HjBRif7YADWbrX4RoXwGrrryCnv7qZGISzu0BG/VSzy8GVFiQxGFBIInsjU87htP/i+oXrpMlBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
Received: from NT0PR01MB1231.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:e::9) by ZQ2PR01MB1225.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.51; Thu, 16 Apr
 2026 09:01:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+Jl7O1Jzu4Qss1CF4c46SplCEeqiWuNyGpnmJ7pVO4b1zjurjSggEzZdkzEli0UX6W/f4oYmmN+0NM+MJkTE7FPEKndJJFYXGf4qJajbGPfA+vMz61s2/J5lVtCMwRUOaul0bqpgWsANbWERTkF0dcP/IsV6PG2BdXzEImr+8HvVEkX9WY9J/drzVePhF+ksAQnviE4wmTaNS7BeTANv7J+qGjWeFoPKsDnrnb6Sl1s4jk6t6wbU33Cq70wj3dHbreJfSe8imGcZad2cwPve/E+UpRprHYwLZ4OorwK+maYnp5LSVlw9H01Zg++aF9PGnEw9ZUPEQdGtV1k2FlYdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qsJJNAku/U9Ekc7ox6UuevdC7PPX8isEXjUA6lv7gw=;
 b=QZ4HQ0KuXZFd2JjIUyZ34ToFV3Ly4OyYaIrYMgfkP9E6w1tGbXUmQET3uFQm/hyp780kX1QVw3wZ7TX2moe/Pu/gFZJG6tBSV8M0Co1ZYTw098cv2xP5zd19oC2jlfT5pMsx2bkw+WrfAXkx30OOF7pRbWUmi/Op97Ayz5y4bI+R6ZVCSgaEf6SYHJxqmUrWLtBVBlPQCI/6mjDKIB7nDJBo5lrQT2o8boLlZiOkAOiSnmmQgx31qIHIhAXHTKREoZqgenBi1F17iPvXw3Zvl9K95XqOnDp4FcgklLXEueaCyUsKi/UglkD53BYofmy7Gh7mqZ+zXfALrKw0UPncww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) by NT0PR01MB1231.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.51; Thu, 16 Apr
 2026 06:48:24 +0000
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 ([fe80::1666:48e8:19e9:ad29]) by
 NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn ([fe80::1666:48e8:19e9:ad29%7])
 with mapi id 15.20.9769.048; Thu, 16 Apr 2026 06:48:24 +0000
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
Subject: [PATCH v2 1/5] dt-bindings: interrupt-controller: repurpose binding for unreleased jh8100 for jhb100
Date: Wed, 15 Apr 2026 23:47:47 -0700
Message-Id: <20260416064751.632138-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260416064751.632138-1-changhuang.liang@starfivetech.com>
References: <20260416064751.632138-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::8) To NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic:
	NT0PR01MB1216:EE_|NT0PR01MB1231:EE_|ZQ2PR01MB1225:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b805f2-5222-4a69-6d7f-08de9b84280c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 wfzBanX7nrTxsfX5thJJtQNxrfLPknVbBBcLgCFCoMGA2TdQd417sdypAG6S5CL1pVkrax/CO14/FTezhoHJ/AMCMhGr9D+08LNedjNW/z2VpdN4fnIzNHzqFi7jlL5mbwb2SmUu6Mkel1z88dbs3fr5xp6wGuAlj6YWDR0UF8tvVLZGYI7UIce4IUaWG1dQedaDUDDy2Byt5MdAvdld/TavKe228dEC5JnOZ0M9NUyQwUlFdE8sRMooX3FUiXe97aT2T5Ev3jwHSBoLblfKODuLbCCdwg+mdc6pNZBmRQKT0raO6/g1zpNcQmfMvNSx9BEDt8aKgSbxnXVyGjqkt+JLNGYhyuAqbQlg0FXfO+0H0kR9/osLAjTnpMpe/NJ9zz2SVPrWNPWLZW1xyOk1dleqU/mxPS2NFJbwrDloihNkd+IWCqfBt3S8wGYDpDNq/VeEBx4aG30QnhUaSZepuoBaV36lLDxH7uvFoMgmTUklorbr1LSlbMAN4Mj208vrFinRxZhnm6BulTakgG2rt4flMIOTWIiK+Apla6pVA0LZQOdZ9GY6d5K/Pnk4T4P1BQNX91sGGRpU/+lADQvXew==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?OA+DRyg/yjOE6dsE8StGyY7PKfH1ChvJ1sHQ/GV5PEHaEtltJ1DZpxA+fyA1?=
 =?us-ascii?Q?3NM6ZU7Nkt9TqD1sp66/rYno5KAuW8pIgueduSNdoAArN8QPx0wCzE2vo2Ux?=
 =?us-ascii?Q?Vlw70xAidsktB5C36oA3J7LPllWaw05uebFtf4DMPRiudBVp4F2ud+kQb4TE?=
 =?us-ascii?Q?PVTkKeaQnkueoJ4DrkOuJe0l2UyxN91URjYjXxBMr9FCtuOhtA8H4pJqEHLw?=
 =?us-ascii?Q?8cptZHqg3cp1GYEIvzlwtZl9cBEIF0PYcbissTHCHpDnM+e+upcP5dFSj930?=
 =?us-ascii?Q?MtOg5+8hcWaRz5lN63RiATvxlBk+dU74hKfNc3OjP58qwa8wNaNIEP/kZed+?=
 =?us-ascii?Q?yuClbqi9EfT9CcT9xi0A4Z31Z7oq6AHwwiP7SVPwpDWY7t9J6wmMR23nZugk?=
 =?us-ascii?Q?ysajP3oWWUaHp1dBDOIxFa31lyGIYe3YK8vSdqMDC1GmhE16WNOc5Cluf6ms?=
 =?us-ascii?Q?xf/17KSba7w0qr8ngAezmnsq2W6I3GG0jVCMx5JEzjaBWtsBVKNZRNLArUrC?=
 =?us-ascii?Q?wZNhG2wuDfBLN+nL5X4i+fuzupWgKIeM3HBwcul8N7zh6cNX7SQp6FjLPvxH?=
 =?us-ascii?Q?CXNXFu7Km+hQt84KZRhdVq4QJ00xwr8FA+HUTVNiL9pPeDSTahhDlNRmaFIV?=
 =?us-ascii?Q?BuR972jqoAcEdGhvWNmY8zPURdCWzyG+PesAgEQAFLnLFcm3fDHjLTqR/zPL?=
 =?us-ascii?Q?S5jw6ZaSFSvKj9dvgjS7aiwI/7sST5htq94P97rHl3kN1DrN34P3DZ/JKdfU?=
 =?us-ascii?Q?Zu1GxfbXSKxqlRxFbqVcUSctOCY4COrMdjh9ins7d9C5u9VHiPsKACY2xbvc?=
 =?us-ascii?Q?sGIIJpCScCSKyEK4Lz9L/JJKVNodyqRtgyb+p4JmTzA0RfHr2IEN46qPoep0?=
 =?us-ascii?Q?hqmX5W5KmsnN2L5KGqKeDMh+o53RkcHWaimJzWpSQ5XvnvN9i9t++DE73FV7?=
 =?us-ascii?Q?l3dWmL3/Xcg24NZBJ88zYzyvYGsYc6PXsVldBLctG1fx+QOfIKjuzip3HFy4?=
 =?us-ascii?Q?1uJpCscSdvCTxmvs5ODeIJWqSEmr2d4OW1gCooZuEKfA6ooGn4tUXV52k8ok?=
 =?us-ascii?Q?WH7HFpDmLCLZ84wwJmiCWytaalYTDG8G5T+lKAlZXgmqAKyPY2Szy88He/SB?=
 =?us-ascii?Q?sLEvdnhA7G8jQCipChTYuKcouUcuLgnd8OuqHFcBWJykJs7tTQEZfrjrdhg5?=
 =?us-ascii?Q?Y0jBHAQ2lr12oPbIr2VZKth4iO4e8+Uetf+nIo2bM7MHfvbmerafe1Y7jyZb?=
 =?us-ascii?Q?AyZyeh5v2oRT6yaNrSzigqba29xvxxh6NX3u+KLRzuKf4FjrLGzJFtbRncTD?=
 =?us-ascii?Q?yzU463WEBsvUXia1GFZCYEilv8lKvoHY5onaroaAwmE+3zK/yQ4iYoUx7fXu?=
 =?us-ascii?Q?TkqX3EfNX9g0Oq0Isq/rs2xW7nPabaDQs4XjO5PZ5ItdUr0yeXMC0pgquzvW?=
 =?us-ascii?Q?CRQBTtzlVONAALLaBRZffzR+qr5Q9q/Vq7MyoIQ1B/ld2bpqJMFsyoLD1+yo?=
 =?us-ascii?Q?sSeuLWc5iDpJTPFKVOnot2LiCjJYh30EZ/VqIC5bc3/G0oHLazZWFqruyxCL?=
 =?us-ascii?Q?sLEvovlqAODwzmTiJdFqmo+YQQfweMtf3p7xSsCQfU1a+ebe3kLkrCSWMmvE?=
 =?us-ascii?Q?iPOh9MmLQ1Mu3CODw7MejcMZ4LDoEt2rZlnTJlhxnrVleoqMo1MQ1LSSP/a1?=
 =?us-ascii?Q?kV634+mZvFY8WBHxMJ9YqR0MOeW/2WkITAqKz00TdbbOd+EOhJ3EmZwU+Mb9?=
 =?us-ascii?Q?N/NhepKgdVmSzetrvZqHvItIHIx63KbOkWswGvT/yaX3GQcubmag?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b805f2-5222-4a69-6d7f-08de9b84280c
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 06:48:24.5099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EEBVktthkGgc6zD+Gl6LvXk6tJafBo8E1apqFRZfm9JiqHpEOBZOvGVYxkGVLPGZPvDTnRtr+M7aCnDv/63ha7GpfwwPL0nGba0bH0XhQrYEIAsCAYPPeVENWI72bgVX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1231
X-OriginatorOrg: starfivetech.com

The StarFive JH8100 SoC was discontinued before production. The
newly taped-out JHB100 SoC uses the same interrupt controller IP.

Rename the binding file, compatible string, and MAINTAINERS entry
from "jh8100" to "jhb100". In JHB100 SoC, The clocks and resets are
not operated by users, but they exist in the hardware. Mark them as
optional.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 ...00-intc.yaml => starfive,jhb100-intc.yaml} | 20 ++++---------------
 MAINTAINERS                                   |  2 +-
 2 files changed, 5 insertions(+), 17 deletions(-)
 rename Documentation/devicetree/bindings/interrupt-controller/{starfive,jh8100-intc.yaml => starfive,jhb100-intc.yaml} (68%)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/starfive,jh8100-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/starfive,jhb100-intc.yaml
similarity index 68%
rename from Documentation/devicetree/bindings/interrupt-controller/starfive,jh8100-intc.yaml
rename to Documentation/devicetree/bindings/interrupt-controller/starfive,jhb100-intc.yaml
index ada5788602d6..d8a0a3862ae2 100644
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
 
@@ -16,19 +16,11 @@ maintainers:
 
 properties:
   compatible:
-    const: starfive,jh8100-intc
+    const: starfive,jhb100-intc
 
   reg:
     maxItems: 1
 
-  clocks:
-    description: APB clock for the interrupt controller
-    maxItems: 1
-
-  resets:
-    description: APB reset for the interrupt controller
-    maxItems: 1
-
   interrupts:
     maxItems: 1
 
@@ -40,8 +32,6 @@ properties:
 required:
   - compatible
   - reg
-  - clocks
-  - resets
   - interrupts
   - interrupt-controller
   - "#interrupt-cells"
@@ -51,10 +41,8 @@ additionalProperties: false
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

