Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012021.outbound.protection.outlook.com [52.101.66.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885413FE36E;
	Thu, 28 May 2026 17:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779989077; cv=fail; b=FyCNuCvY+x6G8lpq8USBcoZLHWehiqISca1bp1On8KlLpT46Aw4rnJMrQHx26SlKwanj4widbKglpwCCNNubbYlLNks3Ilp2UxXpjavDXPcNpLf7Xe87jbJDN18tIzCPtEVZxS35St3pfafWE6LO7BDSzCqLZX62EfMCopwhrog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779989077; c=relaxed/simple;
	bh=PCaMp0b8mb5faQ2fl239Nm4VJHnBUPvn+FGbfihg/vQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tYALyJvDT4lP0742M1/XGqxvwduVSGZLgU7ymx8BcPrdYzhGlmxN00V0uD8HDIxuqQleqUVTG4w7p7OnUaHsa0p7ZfSWGuvIK+XihOC7vYtzWiLVh9PY94DomvK4aH5DiokEDWPcepJEgNAi77ypzzUvfnMKxQBJq9m/UVE2Dpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=g787yOkJ; arc=fail smtp.client-ip=52.101.66.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="g787yOkJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cu/iG7p1qHTvLEvCvvZklfqXnzHBXrwBH28kVhiqYqqwyEODvGJd1MdXzPlW7xyPjyLE16gn9myLqM9NjpVfmiBFytWCUn10lxVrGGhMmCO75mQZp+1uVuG7p8ypWsy2HwggBb6e6NRMjs0XJS6uHVPBHqYZ8JFQtLaNpc2mTjp0o2RXyRuzoVZr3QPCMBC1mw5XKxXPGJrDwXylJ5fNakELY9N4qv84kN780J2m0Qm2MsEfFuyc3C9la2XV+sn/PmsqcGnelUUUK8FpP6U0BZL1KsHrU1ZQnxwsE/hJiKFoKvLpNDCgP//FRHmVFS5JI8MqYz2cOrMC2eTmYFtvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jU/mqC/cEAj34iqbMy7t9k/krPu7jogl98tdwBbJTg0=;
 b=uAQf5XFuHzAsTwBOtfJ8KeAd0ksI6EQd9m8ZwKyrNQgZ/E5upSXhex35Di0l2cjNUSeYGWTqt+M5DVZlro5U9yOxA/IXL9Pj8CAmACXSpq5KtdwEUX5X44Y66s/d4LjPLoqOlwKDFj/1Qhc4fidFY0VGg8MGge/P7H9uG4El/ROVgQ/7NTk/Fj7eyTgXP48WNbXGqIbDIABvfkXXYTtSLHtCqgyhkACf5Eb9lXzws/2ezMujumuGn3cY4pzl2Z3bMzqzv2emFiikW1XNnMbl5R0/PHXlwy9AiqZjkFbxhw6F6jLBvYlQB3HyZoHpzu7DGnfGOH1KqQ7TjqxwOJVigA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jU/mqC/cEAj34iqbMy7t9k/krPu7jogl98tdwBbJTg0=;
 b=g787yOkJPePW4o4iB9uK+Xd0E9z1VjyxZps1CXUCajgWds66laCYimwEondIQOEKIzwl4kO9Rs8RUgdJc6i8yMkxmeFoBgFq5vuwQg3Clb5bp/HLVdLi0X4cNmKrDqT72AwbiCuBvsOpbQmtee2e0xhStvA0X+OGFxHCubmwWDk5HYRXgcWzDOVNpmBKWeabVpNqONaxu3z4lqdOVYYV5MlLGbhgUFmuHcmVviD4AYInhTTqhaTQ7gvl5xTPqoLtvHO/ifelpM3AH2hYbZ/rQGW4yzG4gOsM2zgAjri9jqEiW1ySy94YIbyCUIrzZE0YBDgJHZqCeqmhdWSOAJbDDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by AM0PR04MB11931.eurprd04.prod.outlook.com (2603:10a6:20b:6fd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 17:24:28 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 17:24:28 +0000
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
Subject: [PATCH phy-next 12/13] phy: lynx-10g: new driver
Date: Thu, 28 May 2026 20:24:03 +0300
Message-Id: <20260528172404.733196-13-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528172404.733196-1-vladimir.oltean@nxp.com>
References: <20260528172404.733196-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0052.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::12) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|AM0PR04MB11931:EE_
X-MS-Office365-Filtering-Correlation-Id: 40935702-1d2d-4ce9-0aa5-08debcddf90f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|10070799003|22082099003|18002099003|3023799007|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	0IZE6Ae5bertWBvADlL/rAOpZGPiZ0ww0xoUeZrVqkJ6+ptRxc9paJ9OYo494qFrKjW4iT9F3lInmymJpr/U33EXuqPDlhp23jJ/ZC+YQKPcWEvVrNMpWuZmT3Draccd7jUxb5I5wYb8Kn3UKmum9O99z9qIYabtOmeRU4qx+vojBS5BvhqvislcjQLHxCuC3DtBPtpCVrcgMLWY3Qf7uXnTcrHUyX28058ik9SoMGK1VFp2muTzwcBLl2TU2QC9dbmC1ltbagkx1ps5CTxqEW/0/Lqk+5siSCw6pOFxd00nqw/IL68kpabiDNaN+U0R8uz2Po1zhdm0Gd7p1DP4Xx163GYL/qqICNvzG+AEzPigCtM9NetvgcoGOobzMS2b2iAsrUQ+TLl3KhaLO4W6KF8lyEca0QRehRVH87eEYqau4vtO6rGAPnTHNu8LG7jS5bjjZTQw+eaHS4MdhVHM2UtdW0MguReSSUZpZHB3wB+D7fZ/ORhAjOWurmDOA73ka8CcOBv0wiqJnapZ9NTuZDYOcfVpumKlaFn8/7HdSPvT0nMQJrfiuwXuwkGjdSXT9m/YzW0iVL6uEeBAGbZUpZJ+fJY1BO7Zh/ARWqXQlHXft2tTZLKG3q7+IiLr/rGGFbGcfaFLJsEuR5r42XtUYPT6SZL/b7vIMKG0Agn3fuNWekOwnftQTCGcW4F7BaeQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(10070799003)(22082099003)(18002099003)(3023799007)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f9NR5b2TmLSsRtPeBzY8tyeaVaEuYngM03jj15Fat2d/91SWGiwi1vAEru/D?=
 =?us-ascii?Q?qyCXYjEVJOFSDsYp01u5ew8v+mChMqOgjB3zVuBu6A3zwL2HaT5WoYgg0vBl?=
 =?us-ascii?Q?/sTO1iqqpphEmBSWQnbeSuv1evcPuP2SPrjchm56rqkQVu5LGOJXqKnKZQEv?=
 =?us-ascii?Q?poAPGe8C7l3WJe02c6mp7SMUx9V4O3kNPguR+tnRjXowyltyTZ84IZSK82IK?=
 =?us-ascii?Q?SYuwwAVZfZI6DB5OtUjxuQ4z2CRQxEnzHkkJ1h3x+LsXfOyZjTVUGyUmDewv?=
 =?us-ascii?Q?JxvFUqmedRymdI7HCx96Q4S9O+KA6Z3ewmbssRYMCKunsP9oWOJ/5PkaaFss?=
 =?us-ascii?Q?W2j+b++SMzNZ3/wN7TxYxHgupqXAH9H2Z0wP6TfFzTNqhK8ZK08aK1G467X4?=
 =?us-ascii?Q?SZUEyfVn8yfCLWfl9Nks/wmTSaK9Jy3VxV/dTpd20g7ucAinJB+3xyNTh0FP?=
 =?us-ascii?Q?FV9Ryk/8OcDL8nPzrVO08KKpFAgMdaHAB2FdqyU7Y8qmCZUq3u/NQYAERNeb?=
 =?us-ascii?Q?6BB3S1CnjYjq0Ahu4rcmF2nJmtKWoGAug4cdnnRTgBqI6imVsvwIhUxR9k+O?=
 =?us-ascii?Q?6cSA8bKkMnj0IyIuQBP2Wl2wUP15PWKdlZRW+YSNAg3GPZtPRPr5GUy4TLGl?=
 =?us-ascii?Q?/IgroKQUt9+7e4Cxu37pJ9p7EJ/18P1FBqjQKfrzRjnObAiOiC7YsgLHlkI/?=
 =?us-ascii?Q?bTqyHjOhw1QlHiHr4tAAceBLQ/n7wMfhSb6Nt3OaLaaZJ1Bqll6vRqEtFTqP?=
 =?us-ascii?Q?my0oXyi7kcxS5Zg/UHANaReNrS5I1pIh4eyMv7ULHvVr/QidCOpC0xu0OVS6?=
 =?us-ascii?Q?SR0XTGDXHZ/JtLcTO3zHi3VUDWBuJit9dYmSyhwI/1lQg5r93XySM9+c/aDp?=
 =?us-ascii?Q?LwnGcgaea7FNBctqMVjNoS326VQNklbcFFFGHUqsQF86c68xTEIsPHPh5Sp6?=
 =?us-ascii?Q?DQKHpJokj5MvoFUuZ8nWPEnscEhcNOqRhl19ENGKF5AuPbEMOF40nwd5Loro?=
 =?us-ascii?Q?1XWDWz/n2nrhpEu/pYW8l5I+YmM6Pu6sBLzuExiUG0Ja7pjuJJvIfNc64fG0?=
 =?us-ascii?Q?nhW4foNlTgzsq5oCbpw/8yaYJFbmh6veK0FBhQ2nlzAQgWNTQSjQ9dGrCgAR?=
 =?us-ascii?Q?cNZVfvNp4HrlSnpQeCjm8nFOs9r2m2vg5J+hSkdBrWQGvo6N9h4a+vf4h0II?=
 =?us-ascii?Q?khRn6CbdIOw7bSzKj1R2PGry2D+ZTd6ZtNv9dXLwV7Uvng7eV0oliRk2VrKv?=
 =?us-ascii?Q?pqEPtucjuXy2WhMQqdI/mpzPYMADxS/qZiVqcWgUg+00QF66LYbAbO853GwP?=
 =?us-ascii?Q?VcQ224Mfb9Rh8C2kaON0czouYPuFEwEXOZ9rtJ4qoP+ftnKC9egh5GMaeyAb?=
 =?us-ascii?Q?NhR3s1oKGvOck+1h+bOOcTARdYQ4Tw50FZBf8SPv5+CYsNHnS9Miv2aOdt1i?=
 =?us-ascii?Q?fCQYA9Lt8E7rdO7VD91FngVe0tIZatQwjQk8eSYzt3xcgar3Dc54ovMnctSH?=
 =?us-ascii?Q?AxawQolQzZArR17uyFT9+O90U3bY4GUsqG/tHjbNj8Ju8+3GMylMlj7Qgtex?=
 =?us-ascii?Q?fPwDyMqg43gYQg/jGdgWmG7zLho/wi+8SahlJFJ0TD7cX0jVEOqRhczPpiSm?=
 =?us-ascii?Q?eS14a9olB4dMljp39AiAvdxRVYQQMraAOxUFZCHEwQ3uH/sJXuMxXK39uk/8?=
 =?us-ascii?Q?Jpn/EF0C5OZkgpc+5PIQMpyPzs813hgedA0PjZi7DU3OEsiBW+7xrXP//Nue?=
 =?us-ascii?Q?ejEPaPdl798oXquZ7H9zqHqJ8J2VVe2V+wiErWeJsxdDubxfnUQ7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40935702-1d2d-4ce9-0aa5-08debcddf90f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 17:24:28.7499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0t0osa4yYMqnHK1XRrMJIiB/7N2TFIfj8ubDwvqqhwqkdTLwqVgjLlKcGy/ruhteIDOz9YV212Jei90fEpODw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11931

Introduce a driver for the networking lanes of the 10G Lynx SerDes
block, present on the majority of Layerscape and QorIQ (Freescale/NXP)
SoCs.

As with the 28G Lynx, the SerDes lanes come pre-initialized out of
reset and the consumers use them that way outside the Generic PHY
framework (for networking, the static configuration remains for the
entire SoC lifetime, whereas for SATA and PCIe, the hardware
reconfigures itself automatically for other link speeds).

The need for the Generic PHY framework comes specifically for networking
use cases where a static lane configuration is not sufficient. For
example a network MAC is connected to an SFP cage, where various SFP or
SFP+ modules can be connected. Each of them may require a different
SerDes protocol (SGMII, 1000Base-X, 10GBase-R), which phylink + sfp-bus
are responsible of figuring out. The phylink drivers are:
- enetc
- felix
- dpaa_eth (fman_memac)
- dpaa2-eth
- dpaa2-switch

and they all need to reconfigure the SerDes for the requested link mode,
using phy_set_mode_ext() (and phy_validate() to see if it is supported
in the first place).

Note that SerDes 2 on LS1088A is exclusively non-networking, so there is
currently no need for this driver. Therefore we skip matching on its
compatible string and do not probe on that device.

Co-developed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
---
 drivers/phy/freescale/Kconfig             |   10 +
 drivers/phy/freescale/Makefile            |    1 +
 drivers/phy/freescale/phy-fsl-lynx-10g.c  | 1319 +++++++++++++++++++++
 drivers/phy/freescale/phy-fsl-lynx-core.c |   12 +
 drivers/phy/freescale/phy-fsl-lynx-core.h |    4 +
 include/soc/fsl/phy-fsl-lynx.h            |   27 +
 6 files changed, 1373 insertions(+)
 create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g.c

diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index a87429f634ea..4368eb1668fb 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -57,6 +57,16 @@ config PHY_FSL_LYNX_CORE
 	  Enable this to add common support code for NXP Lynx 10G and Lynx 28G
 	  SerDes blocks.
 
+config PHY_FSL_LYNX_10G
+	tristate "Freescale Layerscape Lynx 10G SerDes PHY support"
+	depends on OF
+	depends on ARCH_LAYERSCAPE || COMPILE_TEST
+	select GENERIC_PHY
+	select PHY_FSL_LYNX_CORE
+	help
+	  Enable this to add support for the Lynx 10G SerDes PHY as found on
+	  NXP's Layerscape platform such as LS1088A or LS1028A.
+
 config PHY_FSL_LYNX_28G
 	tristate "Freescale Layerscape Lynx 28G SerDes PHY support"
 	depends on OF
diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makefile
index d7aa62cdeb39..5b0e180d6972 100644
--- a/drivers/phy/freescale/Makefile
+++ b/drivers/phy/freescale/Makefile
@@ -5,5 +5,6 @@ obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)	+= phy-fsl-imx8-mipi-dphy.o
 obj-$(CONFIG_PHY_FSL_IMX8M_PCIE)	+= phy-fsl-imx8m-pcie.o
 obj-$(CONFIG_PHY_FSL_IMX8QM_HSIO)	+= phy-fsl-imx8qm-hsio.o
 obj-$(CONFIG_PHY_FSL_LYNX_CORE)		+= phy-fsl-lynx-core.o
+obj-$(CONFIG_PHY_FSL_LYNX_10G)		+= phy-fsl-lynx-10g.o
 obj-$(CONFIG_PHY_FSL_LYNX_28G)		+= phy-fsl-lynx-28g.o
 obj-$(CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY)	+= phy-fsl-samsung-hdmi.o
diff --git a/drivers/phy/freescale/phy-fsl-lynx-10g.c b/drivers/phy/freescale/phy-fsl-lynx-10g.c
new file mode 100644
index 000000000000..28b082357468
--- /dev/null
+++ b/drivers/phy/freescale/phy-fsl-lynx-10g.c
@@ -0,0 +1,1319 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright 2021-2026 NXP */
+
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/workqueue.h>
+
+#include "phy-fsl-lynx-core.h"
+
+/* SoC IP wrapper for protocol converters */
+#define PCCR8				0x220
+#define PCCR8_SGMIIa_KX			BIT(3)
+#define PCCR8_SGMIIa_CFG		BIT(0)
+
+#define PCCR9				0x224
+#define PCCR9_QSGMIIa_CFG		BIT(0)
+#define PCCR9_QXGMIIa_CFG		BIT(0)
+
+#define PCCRB				0x22c
+#define PCCRB_XFIa_CFG			BIT(0)
+#define PCCRB_SXGMIIa_CFG		BIT(0)
+
+#define SGMII_CFG(id)			(28 - (id) * 4)
+#define QSGMII_CFG(id)			(28 - (id) * 4)
+#define SXGMII_CFG(id)			(28 - (id) * 4)
+#define QXGMII_CFG(id)			(12 - (id) * 4)
+#define XFI_CFG(id)			(28 - (id) * 4)
+
+#define CR(x)				((x) * 4)
+
+#define A				0
+#define B				1
+#define C				2
+#define D				3
+#define E				4
+#define F				5
+#define G				6
+#define H				7
+
+#define SGMIIaCR0(id)			(0x1800 + (id) * 0x10)
+#define QSGMIIaCR0(id)			(0x1880 + (id) * 0x10)
+#define XAUIaCR0(id)			(0x1900 + (id) * 0x10)
+#define XFIaCR0(id)			(0x1980 + (id) * 0x10)
+#define SXGMIIaCR0(id)			(0x1a80 + (id) * 0x10)
+#define QXGMIIaCR0(id)			(0x1b00 + (id) * 0x20)
+
+#define SGMIIaCR0_RST_SGM		BIT(31)
+#define SGMIIaCR0_RST_SGM_OFF		SGMIIaCR0_RST_SGM
+#define SGMIIaCR0_RST_SGM_ON		0
+#define SGMIIaCR0_PD_SGM		BIT(30)
+#define SGMIIaCR1_SGPCS_EN		BIT(11)
+#define SGMIIaCR1_SGPCS_DIS		0x0
+
+#define QSGMIIaCR0_RST_QSGM		BIT(31)
+#define QSGMIIaCR0_RST_QSGM_OFF		QSGMIIaCR0_RST_QSGM
+#define QSGMIIaCR0_RST_QSGM_ON		0
+#define QSGMIIaCR0_PD_QSGM		BIT(30)
+
+/* Per PLL registers */
+#define PLLnCR0(pll)			((pll) * 0x20 + 0x4)
+
+#define PLLnCR0_POFF			BIT(31)
+
+#define PLLnCR0_REFCLK_SEL		GENMASK(30, 28)
+#define PLLnCR0_REFCLK_SEL_100MHZ	0x0
+#define PLLnCR0_REFCLK_SEL_125MHZ	0x1
+#define PLLnCR0_REFCLK_SEL_156MHZ	0x2
+#define PLLnCR0_REFCLK_SEL_150MHZ	0x3
+#define PLLnCR0_REFCLK_SEL_161MHZ	0x4
+#define PLLnCR0_PLL_LCK			BIT(23)
+#define PLLnCR0_FRATE_SEL		GENMASK(19, 16)
+#define PLLnCR0_FRATE_5G		0x0
+#define PLLnCR0_FRATE_5_15625G		0x6
+#define PLLnCR0_FRATE_4G		0x7
+#define PLLnCR0_FRATE_3_125G		0x9
+#define PLLnCR0_FRATE_3G		0xa
+
+/* Per SerDes lane registers */
+
+/* Lane a Protocol Select status register */
+#define LNaPSSR0(lane)			(0x100 + (lane) * 0x20)
+#define LNaPSSR0_TYPE			GENMASK(30, 26)
+#define LNaPSSR0_IS_QUAD		GENMASK(25, 24)
+#define LNaPSSR0_MAC			GENMASK(19, 16)
+#define LNaPSSR0_PCS			GENMASK(10, 8)
+#define LNaPSSR0_LANE			GENMASK(2, 0)
+
+/* Lane a General Control Register */
+#define LNaGCR0(lane)			(0x800 + (lane) * 0x40 + 0x0)
+#define LNaGCR0_RPLL_PLLF		BIT(31)
+#define LNaGCR0_RPLL_PLLS		0x0
+#define LNaGCR0_RPLL_MSK		BIT(31)
+#define LNaGCR0_RRAT_SEL		GENMASK(29, 28)
+#define LNaGCR0_TRAT_SEL		GENMASK(25, 24)
+#define LNaGCR0_TPLL_PLLF		BIT(27)
+#define LNaGCR0_TPLL_PLLS		0x0
+#define LNaGCR0_TPLL_MSK		BIT(27)
+#define LNaGCR0_RRST_OFF		LNaGCR0_RRST
+#define LNaGCR0_TRST_OFF		LNaGCR0_TRST
+#define LNaGCR0_RRST_ON			0x0
+#define LNaGCR0_TRST_ON			0x0
+#define LNaGCR0_RRST			BIT(22)
+#define LNaGCR0_TRST			BIT(21)
+#define LNaGCR0_RX_PD			BIT(20)
+#define LNaGCR0_TX_PD			BIT(19)
+#define LNaGCR0_IF20BIT_EN		BIT(18)
+#define LNaGCR0_PROTS			GENMASK(11, 7)
+
+#define LNaGCR1(lane)			(0x800 + (lane) * 0x40 + 0x4)
+#define LNaGCR1_RDAT_INV		BIT(31)
+#define LNaGCR1_TDAT_INV		BIT(30)
+#define LNaGCR1_OPAD_CTL		BIT(26)
+#define LNaGCR1_REIDL_TH		GENMASK(22, 20)
+#define LNaGCR1_REIDL_EX_SEL		GENMASK(19, 18)
+#define LNaGCR1_REIDL_ET_SEL		GENMASK(17, 16)
+#define LNaGCR1_REIDL_EX_MSB		BIT(15)
+#define LNaGCR1_REIDL_ET_MSB		BIT(14)
+#define LNaGCR1_REQ_CTL_SNP		BIT(13)
+#define LNaGCR1_REQ_CDR_SNP		BIT(12)
+#define LNaGCR1_TRSTDIR			BIT(7)
+#define LNaGCR1_REQ_BIN_SNP		BIT(6)
+#define LNaGCR1_ISLEW_RCTL		GENMASK(5, 4)
+#define LNaGCR1_OSLEW_RCTL		GENMASK(1, 0)
+
+#define LNaRECR0(lane)			(0x800 + (lane) * 0x40 + 0x10)
+#define LNaRECR0_RXEQ_BST		BIT(28)
+#define LNaRECR0_GK2OVD			GENMASK(27, 24)
+#define LNaRECR0_GK3OVD			GENMASK(19, 16)
+#define LNaRECR0_GK2OVD_EN		BIT(15)
+#define LNaRECR0_GK3OVD_EN		BIT(14)
+#define LNaRECR0_OSETOVD_EN		BIT(13)
+#define LNaRECR0_BASE_WAND		GENMASK(11, 10)
+#define LNaRECR0_OSETOVD		GENMASK(6, 0)
+
+#define LNaTECR0(lane)			(0x800 + (lane) * 0x40 + 0x18)
+#define LNaTECR0_TEQ_TYPE		GENMASK(29, 28)
+#define LNaTECR0_SGN_PREQ		BIT(26)
+#define LNaTECR0_RATIO_PREQ		GENMASK(25, 22)
+#define LNaTECR0_SGN_POST1Q		BIT(21)
+#define LNaTECR0_RATIO_PST1Q		GENMASK(20, 16)
+#define LNaTECR0_ADPT_EQ		GENMASK(13, 8)
+#define LNaTECR0_AMP_RED		GENMASK(5, 0)
+
+#define LNaTTLCR0(lane)			(0x800 + (lane) * 0x40 + 0x20)
+#define LNaTTLCR1(lane)			(0x800 + (lane) * 0x40 + 0x24)
+#define LNaTTLCR2(lane)			(0x800 + (lane) * 0x40 + 0x28)
+
+#define LNaTCSR3(lane)			(0x800 + (lane) * 0x40 + 0x3C)
+#define LNaTCSR3_CDR_LCK		BIT(27)
+
+enum lynx_10g_rat_sel {
+	RAT_SEL_FULL = 0x0,
+	RAT_SEL_HALF = 0x1,
+	RAT_SEL_QUARTER = 0x2,
+	RAT_SEL_DOUBLE = 0x3,
+};
+
+enum lynx_10g_eq_type {
+	EQ_TYPE_NO_EQ = 0,
+	EQ_TYPE_2TAP = 1,
+	EQ_TYPE_3TAP = 2,
+};
+
+enum lynx_10g_proto_sel {
+	PROTO_SEL_PCIE = 0,
+	PROTO_SEL_SGMII_BASEX_KX_QSGMII = 1,
+	PROTO_SEL_SATA = 2,
+	PROTO_SEL_XAUI = 4,
+	PROTO_SEL_XFI_10GBASER_KR_SXGMII = 0xa,
+};
+
+struct lynx_10g_proto_conf {
+	int proto_sel;
+	int if20bit_en;
+	int reidl_th;
+	int reidl_et_msb;
+	int reidl_et_sel;
+	int reidl_ex_msb;
+	int reidl_ex_sel;
+	int islew_rctl;
+	int oslew_rctl;
+	int rxeq_bst;
+	int gk2ovd;
+	int gk3ovd;
+	int gk2ovd_en;
+	int gk3ovd_en;
+	int base_wand;
+	int teq_type;
+	int sgn_preq;
+	int ratio_preq;
+	int sgn_post1q;
+	int ratio_post1q;
+	int adpt_eq;
+	int amp_red;
+	int ttlcr0;
+};
+
+static const struct lynx_10g_proto_conf lynx_10g_proto_conf[LANE_MODE_MAX] = {
+	[LANE_MODE_1000BASEX_SGMII] = {
+		.proto_sel = PROTO_SEL_SGMII_BASEX_KX_QSGMII,
+		.reidl_th = 1,
+		.reidl_ex_sel = 3,
+		.reidl_et_msb = 1,
+		.islew_rctl = 1,
+		.oslew_rctl = 1,
+		.gk2ovd = 15,
+		.gk3ovd = 15,
+		.gk2ovd_en = 1,
+		.gk3ovd_en = 1,
+		.teq_type = EQ_TYPE_NO_EQ,
+		.adpt_eq = 48,
+		.amp_red = 6,
+		.ttlcr0 = 0x39000400,
+	},
+	[LANE_MODE_2500BASEX] = {
+		.proto_sel = PROTO_SEL_SGMII_BASEX_KX_QSGMII,
+		.islew_rctl = 2,
+		.oslew_rctl = 2,
+		.teq_type = EQ_TYPE_2TAP,
+		.sgn_post1q = 1,
+		.ratio_post1q = 6,
+		.adpt_eq = 48,
+		.ttlcr0 = 0x00000400,
+	},
+	[LANE_MODE_QSGMII] = {
+		.proto_sel = PROTO_SEL_SGMII_BASEX_KX_QSGMII,
+		.islew_rctl = 1,
+		.oslew_rctl = 1,
+		.teq_type = EQ_TYPE_2TAP,
+		.sgn_post1q = 1,
+		.ratio_post1q = 6,
+		.adpt_eq = 48,
+		.amp_red = 2,
+		.ttlcr0 = 0x00000400,
+	},
+	[LANE_MODE_10G_QXGMII] = {
+		.proto_sel = PROTO_SEL_XFI_10GBASER_KR_SXGMII,
+		.if20bit_en = 1,
+		.islew_rctl = 1,
+		.oslew_rctl = 1,
+		.base_wand = 1,
+		.teq_type = EQ_TYPE_NO_EQ,
+		.adpt_eq = 48,
+		.ttlcr0 = 0x00000400,
+	},
+	[LANE_MODE_USXGMII] = {
+		.proto_sel = PROTO_SEL_XFI_10GBASER_KR_SXGMII,
+		.if20bit_en = 1,
+		.islew_rctl = 1,
+		.oslew_rctl = 1,
+		.base_wand = 1,
+		.teq_type = EQ_TYPE_NO_EQ,
+		.sgn_post1q = 1,
+		.adpt_eq = 48,
+		.ttlcr0 = 0x00000400,
+	},
+	[LANE_MODE_10GBASER] = {
+		.proto_sel = PROTO_SEL_XFI_10GBASER_KR_SXGMII,
+		.if20bit_en = 1,
+		.islew_rctl = 2,
+		.oslew_rctl = 2,
+		.rxeq_bst = 1,
+		.base_wand = 1,
+		.teq_type = EQ_TYPE_2TAP,
+		.sgn_post1q = 1,
+		.ratio_post1q = 3,
+		.adpt_eq = 48,
+		.amp_red = 7,
+		.ttlcr0 = 0x00000400,
+	},
+};
+
+static void lynx_10g_cdr_lock_check(struct lynx_lane *lane)
+{
+	u32 tcsr3 = lynx_lane_read(lane, LNaTCSR3);
+
+	if (tcsr3 & LNaTCSR3_CDR_LCK)
+		return;
+
+	dev_dbg(&lane->phy->dev,
+		"Lane %c CDR unlocked, resetting receiver...\n",
+		'A' + lane->id);
+
+	lynx_lane_rmw(lane, LNaGCR0, LNaGCR0_RRST_ON, LNaGCR0_RRST);
+	usleep_range(1, 2);
+	lynx_lane_rmw(lane, LNaGCR0, LNaGCR0_RRST_OFF, LNaGCR0_RRST);
+
+	usleep_range(1, 2);
+}
+
+static void lynx_10g_pll_read_configuration(struct lynx_pll *pll)
+{
+	u32 val;
+
+	val = lynx_pll_read(pll, PLLnCR0);
+	pll->frate_sel = FIELD_GET(PLLnCR0_FRATE_SEL, val);
+	pll->refclk_sel = FIELD_GET(PLLnCR0_REFCLK_SEL, val);
+	pll->enabled = !(val & PLLnCR0_POFF);
+	pll->locked = !!(val & PLLnCR0_PLL_LCK);
+
+	if (!pll->enabled)
+		return;
+
+	switch (pll->frate_sel) {
+	case PLLnCR0_FRATE_5G:
+		/* 5GHz clock net */
+		__set_bit(LANE_MODE_1000BASEX_SGMII, pll->supported);
+		__set_bit(LANE_MODE_QSGMII, pll->supported);
+		break;
+	case PLLnCR0_FRATE_3_125G:
+		__set_bit(LANE_MODE_2500BASEX, pll->supported);
+		break;
+	case PLLnCR0_FRATE_5_15625G:
+		/* 10.3125GHz clock net */
+		__set_bit(LANE_MODE_10GBASER, pll->supported);
+		__set_bit(LANE_MODE_USXGMII, pll->supported);
+		__set_bit(LANE_MODE_10G_QXGMII, pll->supported);
+		break;
+	default:
+		break;
+	}
+}
+
+/* On LS1028A, SGMIIA_CFG, SGMIIB_CFG, and SGMIIC_CFG from PCCR8 have the
+ * ability to map either an ENETC PCS or a Felix switch PCS to the same lane.
+ * The PHY API lacks the capability to distinguish between one consumer and
+ * another, so we don't support changing the initial muxing done by the RCW.
+ * However, when disabling a PCS through PCCR8, we need to properly restore
+ * the original value to keep the same muxing, and for that we need to back
+ * it up (here).
+ */
+static void lynx_10g_backup_pccr_val(struct lynx_lane *lane)
+{
+	u32 val;
+	int err;
+
+	if (lane->mode == LANE_MODE_UNKNOWN)
+		return;
+
+	err = lynx_pccr_read(lane, lane->mode, &val);
+	if (err) {
+		dev_warn(&lane->phy->dev,
+			 "The driver doesn't know how to access the PCCR for lane mode %s\n",
+			 lynx_lane_mode_str(lane->mode));
+		lane->mode = LANE_MODE_UNKNOWN;
+		return;
+	}
+
+	lane->default_pccr[lane->mode] = val;
+
+	switch (lane->mode) {
+	case LANE_MODE_1000BASEX_SGMII:
+	case LANE_MODE_2500BASEX:
+		lane->default_pccr[LANE_MODE_1000BASEX_SGMII] = val & ~PCCR8_SGMIIa_KX;
+		lane->default_pccr[LANE_MODE_2500BASEX] = val & ~PCCR8_SGMIIa_KX;
+		break;
+	default:
+		break;
+	}
+}
+
+static bool lynx_10g_lane_is_3_125g(struct lynx_lane *lane)
+{
+	struct lynx_priv *priv = lane->priv;
+	struct lynx_pll *pll;
+	u32 gcr0;
+
+	gcr0 = lynx_lane_read(lane, LNaGCR0);
+
+	if (gcr0 & LNaGCR0_TPLL_PLLF)
+		pll = &priv->pll[0];
+	else
+		pll = &priv->pll[1];
+
+	if (pll->frate_sel != PLLnCR0_FRATE_3_125G)
+		return false;
+
+	if (FIELD_GET(LNaGCR0_TRAT_SEL, gcr0) != RAT_SEL_FULL ||
+	    FIELD_GET(LNaGCR0_RRAT_SEL, gcr0) != RAT_SEL_FULL)
+		return false;
+
+	return true;
+}
+
+static void lynx_10g_lane_read_configuration(struct lynx_lane *lane)
+{
+	u32 pssr0 = lynx_lane_read(lane, LNaPSSR0);
+	struct lynx_priv *priv = lane->priv;
+	int proto;
+
+	proto = FIELD_GET(LNaPSSR0_TYPE, pssr0);
+	switch (proto) {
+	case PROTO_SEL_SGMII_BASEX_KX_QSGMII:
+		if (lynx_10g_lane_is_3_125g(lane))
+			lane->mode = LANE_MODE_2500BASEX;
+		else if (FIELD_GET(LNaPSSR0_IS_QUAD, pssr0))
+			lane->mode = LANE_MODE_QSGMII;
+		else
+			lane->mode = LANE_MODE_1000BASEX_SGMII;
+		break;
+	case PROTO_SEL_XFI_10GBASER_KR_SXGMII:
+		if (FIELD_GET(LNaPSSR0_IS_QUAD, pssr0))
+			lane->mode = LANE_MODE_10G_QXGMII;
+		else if (priv->info->quirks & LYNX_QUIRK_HAS_HARDCODED_USXGMII)
+			lane->mode = LANE_MODE_USXGMII;
+		else
+			lane->mode = LANE_MODE_10GBASER;
+		break;
+	case PROTO_SEL_PCIE:
+	case PROTO_SEL_SATA:
+	case PROTO_SEL_XAUI:
+		break;
+	default:
+		dev_warn(&lane->phy->dev, "Unknown lane protocol 0x%x\n",
+			 proto);
+	}
+
+	lynx_10g_backup_pccr_val(lane);
+}
+
+static int ls1028a_get_pccr(enum lynx_lane_mode lane_mode, int lane,
+			    struct lynx_pccr *pccr)
+{
+	switch (lane_mode) {
+	case LANE_MODE_1000BASEX_SGMII:
+	case LANE_MODE_2500BASEX:
+		pccr->offset = PCCR8;
+		pccr->width = 4;
+		pccr->shift = SGMII_CFG(lane);
+		break;
+	case LANE_MODE_QSGMII:
+		if (lane != 1)
+			return -EINVAL;
+
+		pccr->offset = PCCR9;
+		pccr->width = 3;
+		pccr->shift = QSGMII_CFG(A);
+		break;
+	case LANE_MODE_10G_QXGMII:
+		if (lane != 1)
+			return -EINVAL;
+
+		pccr->offset = PCCR9;
+		pccr->width = 3;
+		pccr->shift = QXGMII_CFG(A);
+		break;
+	case LANE_MODE_USXGMII:
+		if (lane != 0)
+			return -EINVAL;
+
+		pccr->offset = PCCRB;
+		pccr->width = 3;
+		pccr->shift = SXGMII_CFG(A);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ls1028a_get_pcvt_offset(int lane, enum lynx_lane_mode mode)
+{
+	switch (mode) {
+	case LANE_MODE_1000BASEX_SGMII:
+	case LANE_MODE_2500BASEX:
+		return SGMIIaCR0(lane);
+	case LANE_MODE_QSGMII:
+		return lane == 1 ? QSGMIIaCR0(A) : -EINVAL;
+	case LANE_MODE_USXGMII:
+		return lane == 0 ? SXGMIIaCR0(A) : -EINVAL;
+	case LANE_MODE_10G_QXGMII:
+		return lane == 1 ? QXGMIIaCR0(A) : -EINVAL;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct lynx_info lynx_info_ls1028a = {
+	.get_pccr = ls1028a_get_pccr,
+	.get_pcvt_offset = ls1028a_get_pcvt_offset,
+	.pll_read_configuration = lynx_10g_pll_read_configuration,
+	.lane_read_configuration = lynx_10g_lane_read_configuration,
+	.cdr_lock_check = lynx_10g_cdr_lock_check,
+	.num_lanes = 4,
+	.index = 1,
+	.quirks = LYNX_QUIRK_HAS_HARDCODED_USXGMII,
+};
+
+static int ls1046a_serdes1_get_pccr(enum lynx_lane_mode lane_mode, int lane,
+				    struct lynx_pccr *pccr)
+{
+	switch (lane_mode) {
+	case LANE_MODE_1000BASEX_SGMII:
+	case LANE_MODE_2500BASEX:
+		pccr->offset = PCCR8;
+		pccr->width = 4;
+		pccr->shift = SGMII_CFG(lane);
+		break;
+	case LANE_MODE_QSGMII:
+		if (lane != 1)
+			return -EINVAL;
+
+		pccr->offset = PCCR9;
+		pccr->width = 3;
+		pccr->shift = QSGMII_CFG(B);
+		break;
+	case LANE_MODE_10GBASER:
+		switch (lane) {
+		case 2:
+			pccr->shift = XFI_CFG(A);
+			break;
+		case 3:
+			pccr->shift = XFI_CFG(B);
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		pccr->offset = PCCRB;
+		pccr->width = 3;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ls1046a_serdes1_get_pcvt_offset(int lane, enum lynx_lane_mode mode)
+{
+	switch (mode) {
+	case LANE_MODE_1000BASEX_SGMII:
+	case LANE_MODE_2500BASEX:
+		return SGMIIaCR0(lane);
+	case LANE_MODE_QSGMII:
+		if (lane != 1)
+			return -EINVAL;
+
+		return QSGMIIaCR0(B);
+	case LANE_MODE_10GBASER:
+		switch (lane) {
+		case 2:
+			return XFIaCR0(A);
+		case 3:
+			return XFIaCR0(B);
+		default:
+			return -EINVAL;
+		}
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct lynx_info lynx_info_ls1046a_serdes1 = {
+	.get_pccr = ls1046a_serdes1_get_pccr,
+	.get_pcvt_offset = ls1046a_serdes1_get_pcvt_offset,
+	.pll_read_configuration = lynx_10g_pll_read_configuration,
+	.lane_read_configuration = lynx_10g_lane_read_configuration,
+	.cdr_lock_check = lynx_10g_cdr_lock_check,
+	.num_lanes = 4,
+	.index = 1,
+};
+
+static int ls1046a_serdes2_get_pccr(enum lynx_lane_mode lane_mode, int lane,
+				    struct lynx_pccr *pccr)
+{
+	switch (lane_mode) {
+	case LANE_MODE_1000BASEX_SGMII:
+	case LANE_MODE_2500BASEX:
+		if (lane != 1)
+			return -EINVAL;
+
+		pccr->offset = PCCR8;
+		pccr->width = 4;
+		pccr->shift = SGMII_CFG(B);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ls1046a_serdes2_get_pcvt_offset(int lane, enum lynx_lane_mode mode)
+{
+	switch (mode) {
+	case LANE_MODE_1000BASEX_SGMII:
+	case LANE_MODE_2500BASEX:
+		if (lane != 1)
+			return -EINVAL;
+
+		return SGMIIaCR0(B);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct lynx_info lynx_info_ls1046a_serdes2 = {
+	.get_pccr = ls1046a_serdes2_get_pccr,
+	.get_pcvt_offset = ls1046a_serdes2_get_pcvt_offset,
+	.pll_read_configuration = lynx_10g_pll_read_configuration,
+	.lane_read_configuration = lynx_10g_lane_read_configuration,
+	.cdr_lock_check = lynx_10g_cdr_lock_check,
+	.num_lanes = 4,
+	.index = 2,
+};
+
+static int ls1088a_serdes1_get_pccr(enum lynx_lane_mode lane_mode, int lane,
+				    struct lynx_pccr *pccr)
+{
+	switch (lane_mode) {
+	case LANE_MODE_1000BASEX_SGMII:
+		pccr->offset = PCCR8;
+		pccr->width = 4;
+		pccr->shift = SGMII_CFG(lane);
+		break;
+	case LANE_MODE_QSGMII:
+		switch (lane) {
+		case 0:
+			pccr->shift = QSGMII_CFG(A);
+			break;
+		case 1:
+		case 3:
+			pccr->shift = QSGMII_CFG(B);
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		pccr->offset = PCCR9;
+		pccr->width = 3;
+		break;
+	case LANE_MODE_10GBASER:
+		switch (lane) {
+		case 2:
+			pccr->shift = XFI_CFG(A);
+			break;
+		case 3:
+			pccr->shift = XFI_CFG(B);
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		pccr->offset = PCCRB;
+		pccr->width = 3;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ls1088a_serdes1_get_pcvt_offset(int lane, enum lynx_lane_mode mode)
+{
+	switch (mode) {
+	case LANE_MODE_1000BASEX_SGMII:
+		return SGMIIaCR0(lane);
+	case LANE_MODE_QSGMII:
+		switch (lane) {
+		case 0:
+			return QSGMIIaCR0(A);
+		case 1:
+		case 3:
+			return QSGMIIaCR0(B);
+		default:
+			return -EINVAL;
+		}
+	case LANE_MODE_10GBASER:
+		switch (lane) {
+		case 2:
+			return XFIaCR0(A);
+		case 3:
+			return XFIaCR0(B);
+		default:
+			return -EINVAL;
+		}
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct lynx_info lynx_info_ls1088a_serdes1 = {
+	.get_pccr = ls1088a_serdes1_get_pccr,
+	.get_pcvt_offset = ls1088a_serdes1_get_pcvt_offset,
+	.pll_read_configuration = lynx_10g_pll_read_configuration,
+	.lane_read_configuration = lynx_10g_lane_read_configuration,
+	.cdr_lock_check = lynx_10g_cdr_lock_check,
+	.num_lanes = 4,
+	.index = 1,
+};
+
+static int ls2088a_serdes1_get_pccr(enum lynx_lane_mode lane_mode, int lane,
+				    struct lynx_pccr *pccr)
+{
+	switch (lane_mode) {
+	case LANE_MODE_1000BASEX_SGMII:
+	case LANE_MODE_2500BASEX:
+		pccr->offset = PCCR8;
+		pccr->width = 4;
+		pccr->shift = SGMII_CFG(lane);
+		break;
+	case LANE_MODE_QSGMII:
+		switch (lane) {
+		case 2:
+		case 6:
+			pccr->shift = QSGMII_CFG(A);
+			break;
+		case 7:
+			pccr->shift = QSGMII_CFG(B);
+			break;
+		case 0:
+		case 4:
+			pccr->shift = QSGMII_CFG(C);
+			break;
+		case 1:
+		case 5:
+			pccr->shift = QSGMII_CFG(D);
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		pccr->offset = PCCR9;
+		pccr->width = 3;
+		break;
+	case LANE_MODE_10GBASER:
+		pccr->offset = PCCRB;
+		pccr->width = 3;
+		pccr->shift = XFI_CFG(lane);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ls2088a_serdes1_get_pcvt_offset(int lane, enum lynx_lane_mode mode)
+{
+	switch (mode) {
+	case LANE_MODE_1000BASEX_SGMII:
+	case LANE_MODE_2500BASEX:
+		return SGMIIaCR0(lane);
+	case LANE_MODE_QSGMII:
+		switch (lane) {
+		case 2:
+		case 6:
+			return QSGMIIaCR0(A);
+		case 7:
+			return QSGMIIaCR0(B);
+		case 0:
+		case 4:
+			return QSGMIIaCR0(C);
+		case 1:
+		case 5:
+			return QSGMIIaCR0(D);
+		default:
+			return -EINVAL;
+		}
+	case LANE_MODE_10GBASER:
+		return XFIaCR0(lane);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct lynx_info lynx_info_ls2088a_serdes1 = {
+	.get_pccr = ls2088a_serdes1_get_pccr,
+	.get_pcvt_offset = ls2088a_serdes1_get_pcvt_offset,
+	.pll_read_configuration = lynx_10g_pll_read_configuration,
+	.lane_read_configuration = lynx_10g_lane_read_configuration,
+	.cdr_lock_check = lynx_10g_cdr_lock_check,
+	.num_lanes = 8,
+	.index = 1,
+};
+
+static int ls2088a_serdes2_get_pccr(enum lynx_lane_mode lane_mode, int lane,
+				    struct lynx_pccr *pccr)
+{
+	switch (lane_mode) {
+	case LANE_MODE_1000BASEX_SGMII:
+	case LANE_MODE_2500BASEX:
+		pccr->offset = PCCR8;
+		pccr->width = 4;
+		pccr->shift = SGMII_CFG(lane);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ls2088a_serdes2_get_pcvt_offset(int lane, enum lynx_lane_mode mode)
+{
+	switch (mode) {
+	case LANE_MODE_1000BASEX_SGMII:
+	case LANE_MODE_2500BASEX:
+		return SGMIIaCR0(lane);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct lynx_info lynx_info_ls2088a_serdes2 = {
+	.get_pccr = ls2088a_serdes2_get_pccr,
+	.get_pcvt_offset = ls2088a_serdes2_get_pcvt_offset,
+	.pll_read_configuration = lynx_10g_pll_read_configuration,
+	.lane_read_configuration = lynx_10g_lane_read_configuration,
+	.cdr_lock_check = lynx_10g_cdr_lock_check,
+	.num_lanes = 8,
+	.index = 2,
+};
+
+/* Halting puts the lane in a mode in which it can be reconfigured */
+static void lynx_10g_lane_halt(struct phy *phy)
+{
+	struct lynx_lane *lane = phy_get_drvdata(phy);
+
+	if (!lane->powered_up)
+		return;
+
+	/* Issue a reset request */
+	lynx_lane_rmw(lane, LNaGCR0,
+		      LNaGCR0_RRST_ON | LNaGCR0_TRST_ON,
+		      LNaGCR0_RRST | LNaGCR0_TRST);
+
+	/* The RM says to wait for at least 50ns */
+	usleep_range(1, 2);
+}
+
+static void lynx_10g_lane_reset(struct phy *phy)
+{
+	struct lynx_lane *lane = phy_get_drvdata(phy);
+
+	if (!lane->powered_up)
+		return;
+
+	/* Finalize the reset request */
+	lynx_lane_rmw(lane, LNaGCR0,
+		      LNaGCR0_RRST_OFF | LNaGCR0_TRST_OFF,
+		      LNaGCR0_RRST | LNaGCR0_TRST);
+
+	/* The RM says to wait for at least 50ns */
+	usleep_range(1, 2);
+}
+
+static int lynx_10g_power_off(struct phy *phy)
+{
+	struct lynx_lane *lane = phy_get_drvdata(phy);
+
+	if (!lane->powered_up)
+		return 0;
+
+	/* Issue a reset request with the power down bits set */
+	lynx_lane_rmw(lane, LNaGCR0,
+		      LNaGCR0_RRST_ON | LNaGCR0_TRST_ON |
+		      LNaGCR0_RX_PD | LNaGCR0_TX_PD,
+		      LNaGCR0_RRST | LNaGCR0_TRST |
+		      LNaGCR0_RX_PD | LNaGCR0_TX_PD);
+
+	/* The RM says to wait for at least 50ns */
+	usleep_range(1, 2);
+
+	lane->powered_up = false;
+
+	return 0;
+}
+
+static int lynx_10g_power_on(struct phy *phy)
+{
+	struct lynx_lane *lane = phy_get_drvdata(phy);
+
+	if (lane->powered_up)
+		return 0;
+
+	/* The RM says to wait for at least 120ns between per lane setting have
+	 * been changed and the lane is taken out of reset
+	 */
+	usleep_range(1, 2);
+
+	lynx_lane_rmw(lane, LNaGCR0, LNaGCR0_RRST_OFF | LNaGCR0_TRST_OFF,
+		      LNaGCR0_RRST | LNaGCR0_TRST |
+		      LNaGCR0_RX_PD | LNaGCR0_TX_PD);
+
+	lane->powered_up = true;
+
+	return 0;
+}
+
+static void lynx_10g_lane_set_nrate(struct lynx_lane *lane,
+				    struct lynx_pll *pll,
+				    enum lynx_lane_mode mode)
+{
+	switch (pll->frate_sel) {
+	case PLLnCR0_FRATE_5G:
+		switch (mode) {
+		case LANE_MODE_1000BASEX_SGMII:
+			lynx_lane_rmw(lane, LNaGCR0,
+				      FIELD_PREP(LNaGCR0_TRAT_SEL, RAT_SEL_QUARTER) |
+				      FIELD_PREP(LNaGCR0_RRAT_SEL, RAT_SEL_QUARTER),
+				      LNaGCR0_RRAT_SEL | LNaGCR0_TRAT_SEL);
+			break;
+		case LANE_MODE_QSGMII:
+			lynx_lane_rmw(lane, LNaGCR0,
+				      FIELD_PREP(LNaGCR0_TRAT_SEL, RAT_SEL_FULL) |
+				      FIELD_PREP(LNaGCR0_RRAT_SEL, RAT_SEL_FULL),
+				      LNaGCR0_RRAT_SEL | LNaGCR0_TRAT_SEL);
+			break;
+		default:
+			break;
+		}
+		break;
+	case PLLnCR0_FRATE_3_125G:
+		switch (mode) {
+		case LANE_MODE_2500BASEX:
+			lynx_lane_rmw(lane, LNaGCR0,
+				      FIELD_PREP(LNaGCR0_TRAT_SEL, RAT_SEL_FULL) |
+				      FIELD_PREP(LNaGCR0_RRAT_SEL, RAT_SEL_FULL),
+				      LNaGCR0_RRAT_SEL | LNaGCR0_TRAT_SEL);
+			break;
+		default:
+			break;
+		}
+		break;
+	case PLLnCR0_FRATE_5_15625G:
+		switch (mode) {
+		case LANE_MODE_10GBASER:
+		case LANE_MODE_USXGMII:
+		case LANE_MODE_10G_QXGMII:
+			lynx_lane_rmw(lane, LNaGCR0,
+				      FIELD_PREP(LNaGCR0_TRAT_SEL, RAT_SEL_DOUBLE) |
+				      FIELD_PREP(LNaGCR0_RRAT_SEL, RAT_SEL_DOUBLE),
+				      LNaGCR0_RRAT_SEL | LNaGCR0_TRAT_SEL);
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+}
+
+static void lynx_10g_lane_set_pll(struct lynx_lane *lane,
+				  struct lynx_pll *pll)
+{
+	if (pll->id == 0) {
+		lynx_lane_rmw(lane, LNaGCR0,
+			      LNaGCR0_RPLL_PLLF | LNaGCR0_TPLL_PLLF,
+			      LNaGCR0_RPLL_MSK | LNaGCR0_TPLL_MSK);
+	} else {
+		lynx_lane_rmw(lane, LNaGCR0,
+			      LNaGCR0_RPLL_PLLS | LNaGCR0_TPLL_PLLS,
+			      LNaGCR0_RPLL_MSK | LNaGCR0_TPLL_MSK);
+	}
+}
+
+static void lynx_10g_lane_remap_pll(struct lynx_lane *lane,
+				    enum lynx_lane_mode lane_mode)
+{
+	struct lynx_priv *priv = lane->priv;
+	struct lynx_pll *pll;
+
+	/* Switch to the PLL that works with this interface type */
+	pll = lynx_pll_get(priv, lane_mode);
+	if (unlikely(!pll))
+		return;
+
+	lynx_10g_lane_set_pll(lane, pll);
+
+	/* Choose the portion of clock net to be used on this lane */
+	lynx_10g_lane_set_nrate(lane, pll, lane_mode);
+}
+
+static void lynx_10g_lane_change_proto_conf(struct lynx_lane *lane,
+					    enum lynx_lane_mode mode)
+{
+	const struct lynx_10g_proto_conf *conf = &lynx_10g_proto_conf[mode];
+
+	lynx_lane_rmw(lane, LNaGCR0,
+		      FIELD_PREP(LNaGCR0_PROTS, conf->proto_sel) |
+		      FIELD_PREP(LNaGCR0_IF20BIT_EN, conf->if20bit_en),
+		      LNaGCR0_PROTS | LNaGCR0_IF20BIT_EN);
+	lynx_lane_rmw(lane, LNaGCR1,
+		      FIELD_PREP(LNaGCR1_REIDL_TH, conf->reidl_th) |
+		      FIELD_PREP(LNaGCR1_REIDL_ET_MSB, conf->reidl_et_msb) |
+		      FIELD_PREP(LNaGCR1_REIDL_ET_SEL, conf->reidl_et_sel) |
+		      FIELD_PREP(LNaGCR1_REIDL_EX_MSB, conf->reidl_ex_msb) |
+		      FIELD_PREP(LNaGCR1_REIDL_EX_SEL, conf->reidl_ex_sel) |
+		      FIELD_PREP(LNaGCR1_ISLEW_RCTL, conf->islew_rctl) |
+		      FIELD_PREP(LNaGCR1_OSLEW_RCTL, conf->oslew_rctl),
+		      LNaGCR1_REIDL_TH |
+		      LNaGCR1_REIDL_ET_MSB | LNaGCR1_REIDL_ET_SEL |
+		      LNaGCR1_REIDL_EX_MSB | LNaGCR1_REIDL_EX_SEL |
+		      LNaGCR1_ISLEW_RCTL | LNaGCR1_OSLEW_RCTL);
+	lynx_lane_rmw(lane, LNaRECR0,
+		      FIELD_PREP(LNaRECR0_RXEQ_BST, conf->rxeq_bst) |
+		      FIELD_PREP(LNaRECR0_GK2OVD, conf->gk2ovd) |
+		      FIELD_PREP(LNaRECR0_GK3OVD, conf->gk3ovd) |
+		      FIELD_PREP(LNaRECR0_GK2OVD_EN, conf->gk2ovd_en) |
+		      FIELD_PREP(LNaRECR0_GK3OVD_EN, conf->gk3ovd_en) |
+		      FIELD_PREP(LNaRECR0_BASE_WAND, conf->base_wand),
+		      LNaRECR0_RXEQ_BST | LNaRECR0_GK2OVD | LNaRECR0_GK3OVD |
+		      LNaRECR0_GK2OVD_EN | LNaRECR0_GK3OVD_EN |
+		      LNaRECR0_BASE_WAND);
+	lynx_lane_rmw(lane, LNaTECR0,
+		      FIELD_PREP(LNaTECR0_TEQ_TYPE, conf->teq_type) |
+		      FIELD_PREP(LNaTECR0_SGN_PREQ, conf->sgn_preq) |
+		      FIELD_PREP(LNaTECR0_RATIO_PREQ, conf->ratio_preq) |
+		      FIELD_PREP(LNaTECR0_SGN_POST1Q, conf->sgn_post1q) |
+		      FIELD_PREP(LNaTECR0_RATIO_PST1Q, conf->ratio_post1q) |
+		      FIELD_PREP(LNaTECR0_ADPT_EQ, conf->adpt_eq) |
+		      FIELD_PREP(LNaTECR0_AMP_RED, conf->amp_red),
+		      LNaTECR0_TEQ_TYPE | LNaTECR0_SGN_PREQ |
+		      LNaTECR0_RATIO_PREQ | LNaTECR0_SGN_POST1Q |
+		      LNaTECR0_RATIO_PST1Q | LNaTECR0_ADPT_EQ |
+		      LNaTECR0_AMP_RED);
+	lynx_lane_write(lane, LNaTTLCR0, conf->ttlcr0);
+}
+
+static int lynx_10g_lane_disable_pcvt(struct lynx_lane *lane,
+				      enum lynx_lane_mode mode)
+{
+	struct lynx_priv *priv = lane->priv;
+	int err;
+
+	spin_lock(&priv->pcc_lock);
+
+	err = lynx_pccr_write(lane, mode, 0);
+	if (err)
+		goto out;
+
+	switch (mode) {
+	case LANE_MODE_1000BASEX_SGMII:
+	case LANE_MODE_2500BASEX:
+		err = lynx_pcvt_rmw(lane, mode, CR(1), SGMIIaCR1_SGPCS_DIS,
+				    SGMIIaCR1_SGPCS_EN);
+		if (err)
+			goto out;
+
+		lynx_pcvt_rmw(lane, mode, CR(0),
+			      SGMIIaCR0_RST_SGM_ON | SGMIIaCR0_PD_SGM,
+			      SGMIIaCR0_RST_SGM | SGMIIaCR0_PD_SGM);
+		break;
+	case LANE_MODE_QSGMII:
+		err = lynx_pcvt_rmw(lane, mode, CR(0),
+				    QSGMIIaCR0_RST_QSGM_ON | QSGMIIaCR0_PD_QSGM,
+				    QSGMIIaCR0_RST_QSGM | QSGMIIaCR0_PD_QSGM);
+		if (err)
+			goto out;
+		break;
+	default:
+		err = 0;
+	}
+
+out:
+	spin_unlock(&priv->pcc_lock);
+
+	return err;
+}
+
+static int lynx_10g_lane_enable_pcvt(struct lynx_lane *lane,
+				     enum lynx_lane_mode mode)
+{
+	struct lynx_priv *priv = lane->priv;
+	u32 val;
+	int err;
+
+	spin_lock(&priv->pcc_lock);
+
+	switch (mode) {
+	case LANE_MODE_1000BASEX_SGMII:
+	case LANE_MODE_2500BASEX:
+		err = lynx_pcvt_rmw(lane, mode, CR(1), SGMIIaCR1_SGPCS_EN,
+				    SGMIIaCR1_SGPCS_EN);
+		if (err)
+			goto out;
+
+		lynx_pcvt_rmw(lane, mode, CR(0), SGMIIaCR0_RST_SGM_OFF,
+			      SGMIIaCR0_RST_SGM | SGMIIaCR0_PD_SGM);
+		break;
+	case LANE_MODE_QSGMII:
+		err = lynx_pcvt_rmw(lane, mode, CR(0), QSGMIIaCR0_RST_QSGM_OFF,
+				    QSGMIIaCR0_RST_QSGM | QSGMIIaCR0_PD_QSGM);
+		if (err)
+			goto out;
+		break;
+	default:
+		err = 0;
+	}
+
+	if (lane->default_pccr[mode]) {
+		err = lynx_pccr_write(lane, mode, lane->default_pccr[mode]);
+		goto out;
+	}
+
+	val = 0;
+
+	switch (mode) {
+	case LANE_MODE_1000BASEX_SGMII:
+	case LANE_MODE_2500BASEX:
+		val |= PCCR8_SGMIIa_CFG;
+		break;
+	case LANE_MODE_QSGMII:
+		val |= PCCR9_QSGMIIa_CFG;
+		break;
+	case LANE_MODE_10G_QXGMII:
+		val |= PCCR9_QXGMIIa_CFG;
+		break;
+	case LANE_MODE_10GBASER:
+		val |= PCCRB_XFIa_CFG;
+		break;
+	case LANE_MODE_USXGMII:
+		val |= PCCRB_SXGMIIa_CFG;
+		break;
+	default:
+		err = 0;
+		goto out;
+	}
+
+	err = lynx_pccr_write(lane, mode, val);
+out:
+	spin_unlock(&priv->pcc_lock);
+
+	return err;
+}
+
+static bool lynx_10g_lane_mode_needs_rcw_override(struct lynx_lane *lane,
+						  enum lynx_lane_mode new)
+{
+	enum lynx_lane_mode curr = lane->mode;
+
+	/* Major protocol changes, which involve changing the PCS connection to
+	 * the GMII MAC with the one to the XGMII MAC, require an RCW override
+	 * procedure to reconfigure an internal mux, as documented here:
+	 * https://lore.kernel.org/linux-phy/20230810102631.bvozjer3t67r67iy@skbuf/
+	 * This is SoC-specific, and not yet implemented in drivers/soc/fsl/guts.c.
+	 *
+	 * So the supported set of protocols depends on the initial lane mode.
+	 *
+	 * Minor protocol changes (SGMII <-> 1000Base-X <-> 2500Base-X or
+	 * 10GBase-R <-> USXGMII) are supported.
+	 */
+	if ((lynx_lane_mode_uses_gmii_mac(curr) &&
+	     lynx_lane_mode_uses_xgmii_mac(new)) ||
+	    (lynx_lane_mode_uses_xgmii_mac(curr) &&
+	     lynx_lane_mode_uses_gmii_mac(new)))
+		return true;
+
+	return false;
+}
+
+/* The quad protocols are fixed because the lane has multiple consumers, and
+ * one phy_set_mode_ext() affects the other consumers as well. We have no use
+ * case for dynamic protocol changing here, so disallow it.
+ */
+static enum lynx_lane_mode lynx_fixed_protocols[] = {
+	LANE_MODE_QSGMII,
+	LANE_MODE_10G_QXGMII,
+};
+
+static bool lynx_lane_restrict_fixed_mode_change(struct lynx_lane *lane,
+						 enum lynx_lane_mode new)
+{
+	enum lynx_lane_mode curr = lane->mode;
+
+	for (int i = 0; i < ARRAY_SIZE(lynx_fixed_protocols); i++)
+		if ((curr == lynx_fixed_protocols[i] ||
+		     new == lynx_fixed_protocols[i]) &&
+		     curr != new)
+			return true;
+
+	return false;
+}
+
+static int lynx_10g_validate(struct phy *phy, enum phy_mode mode, int submode,
+			     union phy_configure_opts *opts)
+{
+	struct lynx_lane *lane = phy_get_drvdata(phy);
+	enum lynx_lane_mode lane_mode;
+
+	if (mode != PHY_MODE_ETHERNET)
+		return -EINVAL;
+
+	lane_mode = phy_interface_to_lane_mode(submode);
+	if (!lynx_lane_supports_mode(lane, lane_mode))
+		return -EINVAL;
+
+	if (lynx_lane_restrict_fixed_mode_change(lane, lane_mode))
+		return -EINVAL;
+
+	if (lynx_10g_lane_mode_needs_rcw_override(lane, lane_mode))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int lynx_10g_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct lynx_lane *lane = phy_get_drvdata(phy);
+	bool powered_up = lane->powered_up;
+	enum lynx_lane_mode lane_mode;
+	int err;
+
+	err = lynx_10g_validate(phy, mode, submode, NULL);
+	if (err)
+		return err;
+
+	lane_mode = phy_interface_to_lane_mode(submode);
+	/* lynx_10g_validate() already made sure the lane_mode is supported */
+
+	if (lane_mode == lane->mode)
+		return 0;
+
+	/* If the lane is powered up, put the lane into the halt state while
+	 * the reconfiguration is being done.
+	 */
+	if (powered_up)
+		lynx_10g_lane_halt(phy);
+
+	err = lynx_10g_lane_disable_pcvt(lane, lane->mode);
+	if (err)
+		goto out;
+
+	lynx_10g_lane_change_proto_conf(lane, lane_mode);
+	lynx_10g_lane_remap_pll(lane, lane_mode);
+	WARN_ON(lynx_10g_lane_enable_pcvt(lane, lane_mode));
+
+	lane->mode = lane_mode;
+
+out:
+	if (powered_up)
+		lynx_10g_lane_reset(phy);
+
+	return err;
+}
+
+static int lynx_10g_init(struct phy *phy)
+{
+	struct lynx_lane *lane = phy_get_drvdata(phy);
+
+	/* Mark the fact that the lane was init */
+	lane->init = true;
+
+	/* SerDes lanes are powered on at boot time. Any lane that is
+	 * managed by this driver will get powered off when its consumer
+	 * calls phy_init().
+	 */
+	lane->powered_up = true;
+	lynx_10g_power_off(phy);
+
+	return 0;
+}
+
+static int lynx_10g_exit(struct phy *phy)
+{
+	struct lynx_lane *lane = phy_get_drvdata(phy);
+
+	/* The lane returns to the state where it isn't managed by the
+	 * consumer, so we must treat is as if it isn't initialized, and always
+	 * powered on.
+	 */
+	lane->init = false;
+	lane->powered_up = false;
+	lynx_10g_power_on(phy);
+
+	return 0;
+}
+
+static const struct phy_ops lynx_10g_ops = {
+	.init		= lynx_10g_init,
+	.exit		= lynx_10g_exit,
+	.power_on	= lynx_10g_power_on,
+	.power_off	= lynx_10g_power_off,
+	.set_mode	= lynx_10g_set_mode,
+	.validate	= lynx_10g_validate,
+	.owner		= THIS_MODULE,
+};
+
+static int lynx_10g_probe(struct platform_device *pdev)
+{
+	return lynx_probe(pdev, of_device_get_match_data(&pdev->dev),
+			  &lynx_10g_ops);
+}
+
+static const struct of_device_id lynx_10g_of_match_table[] = {
+	{ .compatible = "fsl,ls1028a-serdes", .data = &lynx_info_ls1028a },
+	{ .compatible = "fsl,ls1046a-serdes1", .data = &lynx_info_ls1046a_serdes1 },
+	{ .compatible = "fsl,ls1046a-serdes2", .data = &lynx_info_ls1046a_serdes2 },
+	{ .compatible = "fsl,ls1088a-serdes1", .data = &lynx_info_ls1088a_serdes1 },
+	{ .compatible = "fsl,ls2088a-serdes1", .data = &lynx_info_ls2088a_serdes1 },
+	{ .compatible = "fsl,ls2088a-serdes2", .data = &lynx_info_ls2088a_serdes2 },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lynx_10g_of_match_table);
+
+static struct platform_driver lynx_10g_driver = {
+	.probe	= lynx_10g_probe,
+	.remove	= lynx_remove,
+	.driver	= {
+		.name = "lynx-10g",
+		.of_match_table = lynx_10g_of_match_table,
+	},
+};
+module_platform_driver(lynx_10g_driver);
+
+MODULE_IMPORT_NS("PHY_FSL_LYNX");
+MODULE_AUTHOR("Ioana Ciornei <ioana.ciornei@nxp.com>");
+MODULE_AUTHOR("Vladimir Oltean <vladimir.oltean@nxp.com>");
+MODULE_DESCRIPTION("Lynx 10G SerDes PHY driver for Layerscape SoCs");
+MODULE_LICENSE("GPL");
diff --git a/drivers/phy/freescale/phy-fsl-lynx-core.c b/drivers/phy/freescale/phy-fsl-lynx-core.c
index ca523e59b167..05043d3fc736 100644
--- a/drivers/phy/freescale/phy-fsl-lynx-core.c
+++ b/drivers/phy/freescale/phy-fsl-lynx-core.c
@@ -11,6 +11,12 @@ const char *lynx_lane_mode_str(enum lynx_lane_mode lane_mode)
 	switch (lane_mode) {
 	case LANE_MODE_1000BASEX_SGMII:
 		return "1000Base-X/SGMII";
+	case LANE_MODE_2500BASEX:
+		return "2500Base-X";
+	case LANE_MODE_QSGMII:
+		return "QSGMII";
+	case LANE_MODE_10G_QXGMII:
+		return "10G-QXGMII";
 	case LANE_MODE_10GBASER:
 		return "10GBase-R";
 	case LANE_MODE_USXGMII:
@@ -29,6 +35,12 @@ enum lynx_lane_mode phy_interface_to_lane_mode(phy_interface_t intf)
 	case PHY_INTERFACE_MODE_SGMII:
 	case PHY_INTERFACE_MODE_1000BASEX:
 		return LANE_MODE_1000BASEX_SGMII;
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return LANE_MODE_2500BASEX;
+	case PHY_INTERFACE_MODE_QSGMII:
+		return LANE_MODE_QSGMII;
+	case PHY_INTERFACE_MODE_10G_QXGMII:
+		return LANE_MODE_10G_QXGMII;
 	case PHY_INTERFACE_MODE_10GBASER:
 		return LANE_MODE_10GBASER;
 	case PHY_INTERFACE_MODE_USXGMII:
diff --git a/drivers/phy/freescale/phy-fsl-lynx-core.h b/drivers/phy/freescale/phy-fsl-lynx-core.h
index 3d9508dfb2c1..137e015eab6b 100644
--- a/drivers/phy/freescale/phy-fsl-lynx-core.h
+++ b/drivers/phy/freescale/phy-fsl-lynx-core.h
@@ -9,6 +9,7 @@
 #include <soc/fsl/phy-fsl-lynx.h>
 
 #define LYNX_NUM_PLL				2
+#define LYNX_QUIRK_HAS_HARDCODED_USXGMII	BIT(0)
 
 struct lynx_priv;
 struct lynx_lane;
@@ -36,6 +37,7 @@ struct lynx_lane {
 	bool init;
 	unsigned int id;
 	enum lynx_lane_mode mode;
+	u32 default_pccr[LANE_MODE_MAX];
 };
 
 struct lynx_info {
@@ -48,6 +50,8 @@ struct lynx_info {
 	void (*cdr_lock_check)(struct lynx_lane *lane);
 	int first_lane;
 	int num_lanes;
+	int index;
+	unsigned long quirks;
 };
 
 struct lynx_priv {
diff --git a/include/soc/fsl/phy-fsl-lynx.h b/include/soc/fsl/phy-fsl-lynx.h
index 92e8272d5ae1..ff5a7d1835b5 100644
--- a/include/soc/fsl/phy-fsl-lynx.h
+++ b/include/soc/fsl/phy-fsl-lynx.h
@@ -7,10 +7,37 @@
 enum lynx_lane_mode {
 	LANE_MODE_UNKNOWN,
 	LANE_MODE_1000BASEX_SGMII,
+	LANE_MODE_2500BASEX,
+	LANE_MODE_QSGMII,
+	LANE_MODE_10G_QXGMII,
 	LANE_MODE_10GBASER,
 	LANE_MODE_USXGMII,
 	LANE_MODE_25GBASER,
 	LANE_MODE_MAX,
 };
 
+static inline bool lynx_lane_mode_uses_gmii_mac(enum lynx_lane_mode mode)
+{
+	switch (mode) {
+	case LANE_MODE_1000BASEX_SGMII:
+	case LANE_MODE_2500BASEX:
+	case LANE_MODE_QSGMII:
+	case LANE_MODE_10G_QXGMII:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static inline bool lynx_lane_mode_uses_xgmii_mac(enum lynx_lane_mode mode)
+{
+	switch (mode) {
+	case LANE_MODE_10GBASER:
+	case LANE_MODE_USXGMII:
+		return true;
+	default:
+		return false;
+	}
+}
+
 #endif /* __PHY_FSL_LYNX_H_ */
-- 
2.34.1

