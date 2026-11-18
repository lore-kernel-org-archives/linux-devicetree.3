Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.135
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794983150;
	b=rmj7UF3d5s1Ex8aPa/DH9X/ZyQO5gorEwad7fK8++4dMqyx9irou/IcWLa5kv/XI32dS
	 8ruOF8M8ExcPvZSHXs5e37hRW+aTq0qrT6AcNHixGow9oanc0zTGSJf1w0OXRMSoq69aN
	 BEAfmv59WnBJO69BA3qUt2DlxsCYny82AtZMqyGiLzqUKPcPrz/L8q6hyh+bKHeXEhWOj
	 MUCUUa1Ydo+G10kMunP9pxBloEpPmlLg5UtgpWpDrCtdjuGvbWtiVfyJ6fuVngGIcKozL
	 /D2cWTNYwIzmL9NKQ/ncAKITtqZxScba5hgdtAZqrbaBiGU+83nrDCFN7KnBipZau2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983150;
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
	bh=9wtQrezk2KYDF68FzeT+KDkUGm6fTTCXpep9k/L1oPA=;
	b=SdkTbllFFcfRYdAc2KOFrQLtEygputB8mm7TiYLNO1+tZzRVW/DrF/6CphRrVvzHNn0J
	 BUMcPb+Uszc1k553crAYHLI4kwJ16yGpvWSn4WyUYiKGbNjWSd375i7PBehyvRpRyn3Qs
	 Qmlp4gNPa4LzqD9q5bHaqIFLdD2TnbFROiDHOs/uwZXcSZ4kq1197UuXHTpMyoFqZ4s+C
	 06pmjW3VwiG5E0BwOsOVWf8NMP6oH7GIyjVyh/LEX+J+A44/58+jAnQRs5HFCjvcdMrNC
	 iUcaTjSLLBB5Eet6MWpqqJfzTEvMzg4+aituG5izUT97yPpa76AhScPUbrxPpQ/J13w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.135
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2135.outbound.protection.partner.outlook.cn [139.219.146.135])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0797C606A336;
	Wed, 18 Nov 2026 06:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0797C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGwhVE+8aDM8pWEYxVi3q0DJ3vXeavC3/T/AjtXfSQZyddPQ1ziMuHXn1zjGji9hsQuB3cuR7UzuoeZJh1tj4RUc0LWZdg9PUqYEIxF+2V8QtrrIyIxET4c0vI8zGN4r73oAAboovzpLtLmqWu8j5fbAgmzT5o87xteSZqc4ongqAVrkf6mezRfJmDplt4IhmccYIbQAnkV3g3ulV2BLvIWXUnGOFm3CSgN6EnuSGV6mZgN5CwbJQ1XQeULIkZamEEczQk50cJWp9UhGkNeCEPbml7izG56P+h4fJT7IWaBXg1CKTVnwKlsVLh/BQeKiXIbcWxLw0A8WJtgLSQJWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wtQrezk2KYDF68FzeT+KDkUGm6fTTCXpep9k/L1oPA=;
 b=RKRBYGxGkbAk+FfBioou3gpmoowWqGfjW8CHvnB1lO0fWO5KQ58IEDPO4/abaVeocEwkejWhgIV6fKDz3WOBtrx07KV4P1eCljHOUYVtrp28d8slCFNXh5AwvpuFjyjJcHUzcvXxAq3/ntbXRD1l+ZmBm4IE7lpWrdmLM4YuEnLVoGptya4bRmscLZQqtguhhlUafBKLj7aFfrXelgVavXsSoWDQ4t/YwEFeztqVYxZUV6P4sPG+NKPdRxcXS2mvM1ajXdx45m5adUsvMGkwnTI/SkAAYLiygtP+RIT6DAATX7n0/3VprWHJIFA3xWIv3P1fGMW0zKK03h9ZWz91fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:d::12) by BJSPR01MB0785.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 06:25:35 +0000
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
Subject: [PATCH vV 2/2] ipmi: add StarFive KCS BMC driver
Date: Wed, 18 Nov 2026 14:25:26 +0800
Message-ID: <20261118062526.1436893-3-mason.huo@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2f52daec-a6e0-4a8e-f4ea-08df453cc097
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|38350700014|56012099006|261021135927099003|261022105027099003|10067099003|261028144727099003|261026121527099003|261022075727099003|261021121427099003|261102123227099003|261026140227099003|261009223027099003|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ZMS33cqJ5WhmmC0EJr1J2YhOrGGft+ftVkHJ4rxVWEllMaKCHFNJrVGhbt/cgH/GP4+f8Dsy9/SIORZyRuzcCU7m87gi+xFSdKp8qcTmbykzUCPA8CbzYoSZtVaMmEv2HBzA/7UaIdUyNB6D/MkSIZBMNy2xvJZu37bJDQb0j7ua+SsAT1XLqEl5N/MYmiV3HwgMeV8PvWRL2+61hY+ur054uQE0I1jS63IfBJ7IWrnNtREGczMt+Q+Hyec9KS7pf0Dty/TZiqCdH50wmE0n4CjNYd5+1fBdyUiLMx87oEkzZebXNd7dl7ylzYb8QK+3dapvBhz24OgAZFVNhuwy+MvowesrrJQ9rVHiZ3zOgrJGHk9ItkvpxVr8y/47qh3VYTzkk5Vi+GskkkkhoEEk43udZIpZWlhrLOXZ735WagshoVc5IRpnQB8SuOV8CMqzePkNZddvgt1knnviSXQWBxHtCLCzInTGC/Hu8j/EkAOan865jlboY4fO3x1WpPgPM/bL49SR3fF0imiNGtAI3B5RfqrqcWgN1APtyV+GsEoUjeM3PBX8b1zTHrckMij1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(38350700014)(56012099006)(261021135927099003)(261022105027099003)(10067099003)(261028144727099003)(261026121527099003)(261022075727099003)(261021121427099003)(261102123227099003)(261026140227099003)(261009223027099003)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m2ffc1E17qPubv82v0ZYLMswJO9+3OoOE7q71GrV4TWXPA7j/05438hO6UWv?=
 =?us-ascii?Q?x6R65SFH0tHwTrmsWSugRqwdPWqRsoo9yGpyB82f2PccXhpxlICr/DYSSEgH?=
 =?us-ascii?Q?W9kKl/abRGW3JNS6fUY6d2tlqiLfRGqxgpyYKym1RBUoDhVqkSX/TCCP6EXj?=
 =?us-ascii?Q?92sOQrmrxp38E71+vjGwkn17cOE7N8eQg9OZriN8eeX+UC7BqCfKfxVwyw49?=
 =?us-ascii?Q?ANVlNVHvzWO5MaqYiWKEE0bgXShI7NOvfOvCBrvAp5nfph6cNWvnEwYdWiqO?=
 =?us-ascii?Q?wjFs/sRZYlOj/wrzsLevhVIYF7TVl0Z6fULawaKV6wh/AE4Dr8mUR8sS45sv?=
 =?us-ascii?Q?MTOZ3b0MyEJzbYDT4vy0tBLLhwrdSnsZeWoEUrx1LNlrpXsGdyGx9JKVyYjQ?=
 =?us-ascii?Q?HxHrec/1jT3bx0UypR5HVqekI0kar3jJBdFd9sThFURSsjNxsuWzihkO+QlP?=
 =?us-ascii?Q?TKss/yecWOkpCEryVsnJ16G0ped39EU+TZEjZX1CVNvFLk5J9mZYoQ8mP9th?=
 =?us-ascii?Q?pbFmmzpjuhTGs/lLWcTYyRxEYqvuqKt4r3tm0u7jMHbkIHJRKibQt9YUDG0v?=
 =?us-ascii?Q?fmxaq2wA9enfdzDEwRYMVQwimeRFTZCUG1MtnD2u1kpSNW1YMWZcctOsoKR7?=
 =?us-ascii?Q?vd2VeAIRlk9o3aCPZd8KQXuQTBnogG3Wz6MXSWhpGa4s10LMMEdRRb0GNQYJ?=
 =?us-ascii?Q?+X3qrpBHotQCcTALgeWSZsiZLgiK76fFp4Ecjup8wU0X1dkIaCBZz6baGqde?=
 =?us-ascii?Q?R3fqeyVy1T8r+mqZPTNypXEeyeHYqdvye/rK9eYVNWuXV492zAX5sdzKXNVU?=
 =?us-ascii?Q?VA7I2qLG6tgdsH/w4w2cniZ83jSqejAUhrgu5pX/Z3Y9tZSSWap338LKUwEB?=
 =?us-ascii?Q?tKEL5vU5vGpXASPPVZhu1+ZoNWkQ7YRn9gOqZMnhWxf05AIXLjG63036qFQM?=
 =?us-ascii?Q?s3KO9GmZKA+D9sD3zDyO4Qt8YNzSfWlSoTiiZOVkjONOiEU3So8XL1YuN9OF?=
 =?us-ascii?Q?d8B0m1eH7wj5KK3kwI49CB/Ah2btUvXWUXkaNyCNGv+NbW9KkHrBRiFzwjkV?=
 =?us-ascii?Q?zWKB6vDRFFc7tTjsxRatzyuiGpbrX/0d5HdA2ozBLgMl3wx+BO6UMYtz7Job?=
 =?us-ascii?Q?0Iv4kOl97iG4Yb6X8+39rNWx39pOVipk8e1G1m3nJ0aly1S4ZKkYYhvfzgZN?=
 =?us-ascii?Q?jDAOHgfRlCLnzYgOvdjODoDYFhGxSspTwK085kBDNHn7BJsSYmSOftmDFMgU?=
 =?us-ascii?Q?9BGrGB8vszI0kZuq4yJMjDDyGvqbXIPyCO011n1qdkOhKTpJmltXtqJPeQUA?=
 =?us-ascii?Q?V7o7MBMbBYM1xq/eBTgM+RUhFd+FW/UGt4o4eUAzDUH1wQQjeT/iB408UxD1?=
 =?us-ascii?Q?lNcqRP2tVbVg6c15Wc5Hffr5SR6Kid2NFRGxZze7g3TNnPqx6QIVKe56Gs+S?=
 =?us-ascii?Q?k6xB1wORqjCzINgANHNLTGSkuj0NYPUDFVoCPsc1pl9iE0Ks0F1YkGEcK60v?=
 =?us-ascii?Q?IHCKWunqBYKvNmiL7W7iOGKS5VjvZmkJCV+Fx2yvC6FcmyoKxHunf70bknnD?=
 =?us-ascii?Q?Z57BejgIfbBU1UopjMaJdX5Wnb4OTWiWOhba9WOzxx/sXQOqER/ZIVCq0obk?=
 =?us-ascii?Q?qVZs4eZ96xkb6Rio8frFum1gtbJDN/wF8FxRpLnf7ND9U9qVYTD/BQFglOuP?=
 =?us-ascii?Q?vkVieKKip8cE89mGBNy+LfrEc/O0XGKSbxBsk9WlEJP2+GXAqwbJoPnKoEDi?=
 =?us-ascii?Q?nKYNt7Jo9B8igZ6RyUh9s4lb1EMkLO4=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f52daec-a6e0-4a8e-f4ea-08df453cc097
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 06:25:34.2680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lTZK3HUtSeVgcH3fuy4gyjUrKrTIIB1c+B1Yrni0WEL0OCJI7+lpwDXGYzTVjkMSUudJan+yYOx0xeM9hqRVA6CZ2E++Z//3MKaF1wingE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0785

This driver exposes the Keyboard Controller Style (KCS) interface on
StarFive SoCs as a character device. Such SOCs are commonly used
as a BaseBoard Management Controller (BMC) on a server board, and KCS
interface is commonly used to perform the in-band IPMI communication
between the server and its BMC.

Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
---
 MAINTAINERS                          |   6 +
 drivers/char/ipmi/Kconfig            |  15 ++
 drivers/char/ipmi/Makefile           |   1 +
 drivers/char/ipmi/kcs_bmc_starfive.c | 311 +++++++++++++++++++++++++++
 4 files changed, 333 insertions(+)
 create mode 100644 drivers/char/ipmi/kcs_bmc_starfive.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ccbcdc0799b9..b238fc730c51 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26923,6 +26923,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/starfive,jhb1*.yaml
 F:	drivers/pinctrl/starfive/pinctrl-starfive-jhb1*
 
+STARFIVE KCS-BMC DRIVER
+M:	Mason Huo <mason.huo@starfivetech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/ipmi/starfive,kcs-bmc.yaml
+F:	drivers/char/ipmi/kcs_bmc_starfive.c
+
 STATIC BRANCH/CALL
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index 538a7d3c65bf..8b51e67d3ac4 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -149,6 +149,21 @@ config NPCM7XX_KCS_IPMI_BMC
 	  This support is also available as a module.  If so, the module
 	  will be called kcs_bmc_npcm7xx.
 
+config STARFIVE_KCS_IPMI_BMC
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select IPMI_KCS_BMC
+	select MFD_SYSCON
+	tristate "StarFive KCS IPMI BMC driver"
+	help
+	  Provides a driver for the KCS (Keyboard Controller Style) IPMI
+	  interface found on StarFive SoCs.
+
+	  The driver implements the BMC side of the KCS controller, it
+	  provides the access of KCS IO space for BMC side.
+
+	  This support is also available as a module.  If so, the module
+	  will be called kcs_bmc_starfive.
+
 config IPMI_KCS_BMC_CDEV_IPMI
 	depends on IPMI_KCS_BMC
 	tristate "IPMI character device interface for BMC KCS devices"
diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
index 4ea450a82242..800d570dd4dc 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -27,5 +27,6 @@ obj-$(CONFIG_IPMI_KCS_BMC_CDEV_IPMI) += kcs_bmc_cdev_ipmi.o
 obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
 obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
 obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
+obj-$(CONFIG_STARFIVE_KCS_IPMI_BMC) += kcs_bmc_starfive.o
 obj-$(CONFIG_IPMB_DEVICE_INTERFACE) += ipmb_dev_int.o
 obj-$(CONFIG_SSIF_IPMI_BMC) += ssif_bmc.o
diff --git a/drivers/char/ipmi/kcs_bmc_starfive.c b/drivers/char/ipmi/kcs_bmc_starfive.c
new file mode 100644
index 000000000000..bff7bdd5ad1c
--- /dev/null
+++ b/drivers/char/ipmi/kcs_bmc_starfive.c
@@ -0,0 +1,311 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/bits.h>
+#include <linux/errno.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+
+#include "kcs_bmc_device.h"
+
+#define DEVICE_NAME		"starfive-kcs-bmc"
+
+/*
+ * Every SIO block of the SoC provides KCS_CHANNELS_PER_SIO KCS channels, each
+ * occupying a KCS_CHANNEL_STRIDE byte register window, starting at offset
+ * KCS_CHANNEL_BASE of the SIO register space.
+ */
+#define KCS_CHANNELS_PER_SIO	4
+#define KCS_CHANNEL_BASE	0x200
+#define KCS_CHANNEL_STRIDE	0x100
+#define KCS_SIO_MAX		2
+
+#define KCS_DO			0x0
+#define KCS_DI			0x4
+#define KCS_STS			0x8
+
+#define KCS_INT			0xc
+#define   KCS_INT_IBF_EN	BIT(0)
+#define   KCS_INT_IBF_STS	BIT(1)
+
+struct starfive_kcs_bmc {
+	struct kcs_bmc_device kcs_bmc;
+	struct regmap *map;
+	/* Protects ie_en and serialises every write to KCS_INT */
+	spinlock_t ie_lock;
+	/* Shadow of the KCS_INT enable bits, restored after eSPI bus reset */
+	u32 ie_en;
+};
+
+static inline struct starfive_kcs_bmc *
+to_starfive_kcs_bmc(struct kcs_bmc_device *kcs_bmc)
+{
+	return container_of(kcs_bmc, struct starfive_kcs_bmc, kcs_bmc);
+}
+
+static u8 starfive_kcs_inb(struct kcs_bmc_device *kcs_bmc, u32 reg)
+{
+	struct starfive_kcs_bmc *priv = to_starfive_kcs_bmc(kcs_bmc);
+	u32 val = 0;
+	int rc;
+
+	rc = regmap_read(priv->map, reg, &val);
+	WARN(rc != 0, "regmap_read() failed: %d\n", rc);
+
+	return rc == 0 ? (u8)val : 0;
+}
+
+static void starfive_kcs_outb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 data)
+{
+	struct starfive_kcs_bmc *priv = to_starfive_kcs_bmc(kcs_bmc);
+	int rc;
+
+	rc = regmap_write(priv->map, reg, data);
+	WARN(rc != 0, "regmap_write() failed: %d\n", rc);
+}
+
+static void starfive_kcs_updateb(struct kcs_bmc_device *kcs_bmc,
+				 u32 reg, u8 mask, u8 data)
+{
+	struct starfive_kcs_bmc *priv = to_starfive_kcs_bmc(kcs_bmc);
+	int rc;
+
+	rc = regmap_update_bits(priv->map, reg, mask, data);
+	WARN(rc != 0, "regmap_update_bits() failed: %d\n", rc);
+}
+
+/*
+ * Write the shadow of the enable bits to KCS_INT. KCS_INT_IBF_STS is a
+ * read-only mirror of the IBF flag in KCS_STS, which the hardware clears
+ * once KCS_DI has been read, so only the enable bits are ever written.
+ */
+static void starfive_kcs_write_ie(struct starfive_kcs_bmc *priv)
+{
+	int rc;
+
+	lockdep_assert_held(&priv->ie_lock);
+
+	rc = regmap_write(priv->map, KCS_INT, priv->ie_en);
+	WARN(rc != 0, "regmap_write() failed: %d\n", rc);
+}
+
+static void starfive_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc,
+					 u8 mask, u8 state)
+{
+	struct starfive_kcs_bmc *priv = to_starfive_kcs_bmc(kcs_bmc);
+	unsigned long flags;
+
+	/* The hardware has no OBE interrupt */
+	if (!(mask & KCS_BMC_EVENT_TYPE_IBF))
+		return;
+
+	spin_lock_irqsave(&priv->ie_lock, flags);
+	if (state & KCS_BMC_EVENT_TYPE_IBF)
+		priv->ie_en |= KCS_INT_IBF_EN;
+	else
+		priv->ie_en &= ~KCS_INT_IBF_EN;
+	starfive_kcs_write_ie(priv);
+	spin_unlock_irqrestore(&priv->ie_lock, flags);
+}
+
+static void starfive_kcs_hw_init(struct starfive_kcs_bmc *priv)
+{
+	unsigned long flags;
+
+	/* Restore the enables, e.g. after an eSPI bus reset */
+	spin_lock_irqsave(&priv->ie_lock, flags);
+	starfive_kcs_write_ie(priv);
+	spin_unlock_irqrestore(&priv->ie_lock, flags);
+}
+
+static irqreturn_t starfive_kcs_irq(int irq, void *arg)
+{
+	/* The interrupt deasserts once the client has read IDR */
+	return kcs_bmc_handle_event(arg);
+}
+
+/*
+ * "espi_rst" is a dedicated interrupt line which carries a single event: the
+ * host has de-asserted the eSPI bus reset of the SIO block this channel
+ * belongs to. The line is requested with IRQF_SHARED only because every
+ * function of that SIO block (KCS, BT, mailbox, ...) listens to the same
+ * event and has to reprogram its own registers when it fires. It is not
+ * shared with unrelated interrupt sources and there is no per-function
+ * status bit to test, so each occurrence is relevant to all handlers and is
+ * claimed unconditionally. Rewriting KCS_INT from the shadow is idempotent.
+ */
+static irqreturn_t starfive_espi_rst_deassert_irq(int irq, void *arg)
+{
+	struct kcs_bmc_device *kcs_bmc = arg;
+	struct starfive_kcs_bmc *priv = to_starfive_kcs_bmc(kcs_bmc);
+
+	starfive_kcs_hw_init(priv);
+
+	return IRQ_HANDLED;
+}
+
+static int starfive_kcs_config_irq(struct kcs_bmc_device *kcs_bmc,
+				   struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int rc, irq;
+
+	irq = platform_get_irq_byname(pdev, "kcs");
+	if (irq < 0)
+		return irq;
+
+	rc = devm_request_irq(dev, irq, starfive_kcs_irq, 0,
+			      dev_name(dev), kcs_bmc);
+	if (rc < 0)
+		return dev_err_probe(dev, rc,
+				     "Unable to request kcs IRQ %d\n", irq);
+
+	irq = platform_get_irq_byname(pdev, "espi_rst");
+	if (irq < 0)
+		return irq;
+
+	rc = devm_request_irq(dev, irq, starfive_espi_rst_deassert_irq,
+			      IRQF_SHARED | IRQF_TRIGGER_RISING,
+			      dev_name(dev), kcs_bmc);
+	if (rc < 0)
+		return dev_err_probe(dev, rc,
+				     "Unable to request espi reset IRQ %d\n", irq);
+
+	return 0;
+}
+
+static const struct kcs_bmc_device_ops starfive_kcs_ops = {
+	.irq_mask_update = starfive_kcs_irq_mask_update,
+	.io_inputb = starfive_kcs_inb,
+	.io_outputb = starfive_kcs_outb,
+	.io_updateb = starfive_kcs_updateb,
+};
+
+/*
+ * The channel number is not described in the devicetree, it follows from the
+ * position of the channel in the SIO block and from the id of that block.
+ */
+static int starfive_kcs_of_get_channel(struct device *dev, u32 *chan)
+{
+	struct device_node *np = dev->of_node;
+	u32 sio_id, idx;
+	u64 offset;
+	int rc;
+
+	struct device_node *sio __free(device_node) = of_get_parent(np);
+
+	/* Don't translate the address, the offset in the SIO block is wanted */
+	rc = of_property_read_reg(np, 0, &offset, NULL);
+	if (rc)
+		return rc;
+
+	if (offset < KCS_CHANNEL_BASE ||
+	    offset >= KCS_CHANNEL_BASE + KCS_CHANNELS_PER_SIO * KCS_CHANNEL_STRIDE ||
+	    offset % KCS_CHANNEL_STRIDE)
+		return -EINVAL;
+
+	idx = ((u32)offset - KCS_CHANNEL_BASE) / KCS_CHANNEL_STRIDE;
+
+	rc = of_property_read_u32(sio, "starfive,sio-id", &sio_id);
+	if (rc)
+		return rc;
+
+	if (sio_id >= KCS_SIO_MAX)
+		return -EINVAL;
+
+	*chan = sio_id * KCS_CHANNELS_PER_SIO + idx;
+
+	return 0;
+}
+
+static int starfive_kcs_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct starfive_kcs_bmc *priv;
+	struct kcs_bmc_device *kcs_bmc;
+	u32 chan;
+	int rc;
+
+	rc = starfive_kcs_of_get_channel(dev, &chan);
+	if (rc)
+		return dev_err_probe(dev, rc, "Unable to determine the channel\n");
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->ie_lock);
+
+	priv->map = device_node_to_regmap(dev->of_node);
+	if (IS_ERR(priv->map))
+		return dev_err_probe(dev, PTR_ERR(priv->map),
+				     "Couldn't get regmap\n");
+
+	kcs_bmc = &priv->kcs_bmc;
+	kcs_bmc->dev = dev;
+	kcs_bmc->channel = chan;
+	kcs_bmc->ioreg.idr = KCS_DI;
+	kcs_bmc->ioreg.odr = KCS_DO;
+	kcs_bmc->ioreg.str = KCS_STS;
+	kcs_bmc->ops = &starfive_kcs_ops;
+
+	platform_set_drvdata(pdev, priv);
+
+	starfive_kcs_hw_init(priv);
+	rc = starfive_kcs_config_irq(kcs_bmc, pdev);
+	if (rc)
+		return rc;
+
+	rc = kcs_bmc_add_device(kcs_bmc);
+	if (rc)
+		return dev_err_probe(dev, rc, "Failed to register channel %u\n",
+				     kcs_bmc->channel);
+
+	dev_dbg(dev, "Channel=%u idr=0x%x odr=0x%x str=0x%x\n", chan,
+		kcs_bmc->ioreg.idr, kcs_bmc->ioreg.odr, kcs_bmc->ioreg.str);
+
+	return 0;
+}
+
+static void starfive_kcs_remove(struct platform_device *pdev)
+{
+	struct starfive_kcs_bmc *priv = platform_get_drvdata(pdev);
+	struct kcs_bmc_device *kcs_bmc = &priv->kcs_bmc;
+
+	kcs_bmc_remove_device(kcs_bmc);
+
+	starfive_kcs_irq_mask_update(kcs_bmc,
+				     (KCS_BMC_EVENT_TYPE_IBF |
+				      KCS_BMC_EVENT_TYPE_OBE),
+				     0);
+}
+
+static const struct of_device_id starfive_kcs_bmc_match[] = {
+	{ .compatible = "starfive,jhb100-kcs-bmc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, starfive_kcs_bmc_match);
+
+static struct platform_driver starfive_kcs_bmc_driver = {
+	.driver = {
+		.name		= DEVICE_NAME,
+		.of_match_table	= starfive_kcs_bmc_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe	= starfive_kcs_probe,
+	.remove	= starfive_kcs_remove,
+};
+module_platform_driver(starfive_kcs_bmc_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Mason Huo <mason.huo@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive device interface to the KCS BMC device");
-- 
2.50.1

