Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02DF3B0AFB;
	Wed, 13 May 2026 18:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698281; cv=fail; b=pgYaLWuXfbAYS5A7n0rMplTQ6JuTyCq5o5qvwjblyXy9BseCwxApR40Hz9kMZMJvBjh4pVuYsGJMsZrxgGJO3gsEDz5PD7HsmXZ7DYmrOLHiHgEWO1kgbPYBXenqppMDW1L/rSs0fQcAxbJceNpLTv8LbS4FEccdgw+4Sk5VI18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698281; c=relaxed/simple;
	bh=wmf9+/ieeUdDgMPZ7Rb7ES+EpcRJFeHISY1De0eFIbE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rver7ABchaOc5B7hjcEHVDDFAbSdXYYXCmZTkl+I5TiUfRfBFDCtQq++oTaHBicVGfgH5lTmPmqOHKh7/AHTfKzB3MySHBhbOfeBhoIkcG+jfWB7tAj5oTzVD1iSFQ/P90KtD9edNbNrp3qxVdQE5OMNGsf31tZjgTDM0uyL1mE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mpauYZH0; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mpauYZH0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPQqvFPGLiFoW67a/lcq5J8jcyq9SuakhQ0ulj7PC5N5D4flMi5PW/AzmttW5/0UcjWu2qtTvG0cWIyygtjPReJKsxmF+h/Jxp8wm6SrPOFi2n0FRmnGtLZVkEu38PLFi9FJieIeBPnqCMlJXaMQrJ5SDbXUkUVwYPA4qSP0vfNMmfoSdBMOeTqQakwGnZlbY0sSm4ItsR/fAkK08lcVpxn6xL2nOXjX1SdkaDl8f7/QN69HJsAw2xXSUJiWHjh5yfSiQ1PxJ5RE6wGPMrpT1fCbpPswfchiH7Jhx6gxYpqviKHKkkqUZFG4Z6ulu1447fcUhFSBuX3r+z6Mk1YD4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JRb91ZP69l4AJJfotTOhzz+PpmCVSmUSIuwL+z9OTo=;
 b=bcEProU4xwcx1K8FPXKE8XWp49zg6086RLDdc6BqmVa8ZRNEzRms2lAU6RP9DnwwICrgFXjpS4PWgVAmyR9t6JueVVhPpoWdg5TPHh/0dyNVaHp08e0xyhEM5psMBEBeRKBgdPh6JRNXXA907IS3kHFBI0rrF1CJSTnOmeSaSTnBIjA25Z72C3g3Dp1bJseEAHixaUvAklNO/179GTSv05z3x8PW+sXxOn5sub/OQUWDfwTODxrDkOfPlWBIoIU28fGpFn6/UOSPdA+lmR4G+FL8rCCMboCJVVlcVUuG2IdC0ZvLwdFPbSYdsdIiN6/oy7JgCLPgjWeHWEFCsRxpOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JRb91ZP69l4AJJfotTOhzz+PpmCVSmUSIuwL+z9OTo=;
 b=mpauYZH0uIc1fwtm6cNhRoNe1qduO1aBKC/eqoR4nCcWdYht0KZ7LugJ11fcZ49M/buuhVwrpEP/UH/yUZ5MV8lISo5rdOlHUJgwmkaWHH5qAif+ragupVWRkZPeXFlpr7fkYr2vf4lqK1HcIhrB/c1UDJO6TL+QFK4E24WQpQs0nCiXXn7m94pZQ0fd351TtUnGxnQV3ECEqlU906dxM8qKkfpUraFv9LJLu716QdWUhNsH44/BJ0OAa4h/aeggOMGH3BX1vn6gJJ/gaAWlH9IqvixtcgqclqRh8aj+Yec+shuV7aJyYAsUWoLqbz5wAQ+tzbOQFzUI2MnLP3unNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com (2603:10a6:102:89::16)
 by PR3PR04MB7337.eurprd04.prod.outlook.com (2603:10a6:102:81::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Wed, 13 May
 2026 18:51:17 +0000
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d]) by PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 18:51:17 +0000
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
Subject: [PATCH phy-next 2/2] phy: ti: add PHY driver for TI DS125DF111 Dual-Channel Retimer
Date: Wed, 13 May 2026 21:51:03 +0300
Message-Id: <20260513185103.1371809-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513185103.1371809-1-ioana.ciornei@nxp.com>
References: <20260513185103.1371809-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P192CA0030.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::35) To PR3PR04MB7402.eurprd04.prod.outlook.com
 (2603:10a6:102:89::16)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7402:EE_|PR3PR04MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: b8dcae2b-5138-4a10-00cc-08deb1209d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|18002099003|11063799003|56012099003|3023799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KcmLunIEMF7Gn/vKGUemjSWKv+obmIML9Hi1pQq5LHon0b5mw1qqf4LbyPsR1D15Z5XffXiJp94AMqMaUv6RXH0oQr7IsVn3bAb+RtAV+sOzbl4MX6wv/li6V5GvRQIBF2yCeWRkoOtDDBJphVPClYUh6dovIYvxSHDmkgHOM9L9ncAUT9R56WNXllOLKTk3neGM7o7RQJcHLsCuG3VJyZYL9Tj/u7jX4YMY6LwBgB0yo0I7H9pHiJxd7BR72vi+udX6H1Bs6qe6LkJPE59wce1VDy4rZaANnZXN9ScF6MkYc66HYXVhb0qLL5186A4XRQE5KkZ6tmv1aRBxGFOfFlqA0YyoX1FevPDazM4m1VYvaZKf7oNC4F7gYqkA65cMIxoZXNLHfPdAr3hS8S8wFdSl4SkvWa+Tt2zZ0PpbWNNvnRwdwbhEhczUKZ7zIAsxlqCyciRfxZ6pIZuORLnNUBopHlAHnXpbCwBkKn82O96Y6SwTOl/+1EtP+G4F8sI9JEx4cVU6M0GCwArOJadZTgr7h0Dp+k7oBunQjzmaKHQDpv3mGPc304z8TPgU+aZ6YPxWaETIVVIqo7LGKkSvDfcgXdh58DUbQL3PybbHgulzXG+7ATMoMgaB+MX+pkyzIvwtRne45aBlSjg3YL1JPc/45beoEfIGfUE5goGi4T7E8BY0FE14yVgCKexn7AdE0qvSH+utdrXWFsYoQEkwYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7402.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(18002099003)(11063799003)(56012099003)(3023799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q4JXR5IzN/1BY008l7emFvTzzmymik7FmZUtW9/SJwUgnIRWgnXGkrpt7Exl?=
 =?us-ascii?Q?VwMquhrpt5rlM9qKo6Lx83WaleQxT51qaDVxEuM+jTCSkDmitazyA9qbHCYE?=
 =?us-ascii?Q?bjUKES0p1QX+5xB/jEqqme+CxeSSnA2DXNrj/wIJKupgGCg7Y/3sN/Yal7jW?=
 =?us-ascii?Q?DT95mUQwlqUIoTCIimHa4b5T77xxHjF3zVEZtZL4IKdOXdvcAtCOtFv/oaGn?=
 =?us-ascii?Q?HxPTOMDHunOGd33WmEqMHcPcdK7hgH3Af4kwhz3hOZEW/SE900tcmbxd+Wuz?=
 =?us-ascii?Q?w5VNXth/kmivWfYQza9IKFshAKODSlyTvdSGWodN27ewyRzgWNhujA+oB0wi?=
 =?us-ascii?Q?VALgZF4jiA6PY+uqnRjKaJ+POJkdO9PCQ9d8VFdjTc6O7HsJwR5CZEzGgz+E?=
 =?us-ascii?Q?ks4677K19P/Vr4nAjBrSbs7NXo4ow84v8GGgMztF2EcJ29CTKlq4nGB34/4B?=
 =?us-ascii?Q?rG2ZbyfWEYRYW8YOss2I5E+pwxyWEo9lrxIZVF+ckh59g6ZmAGn2QjpjhJ2c?=
 =?us-ascii?Q?4sLMKWc2Q8cVD2EQOwQSN9WIWeCpV4AwWLMxdCGSoNdP1fZyZezdXt8INqKI?=
 =?us-ascii?Q?2RoWRyjvflyO+aahooo3q42GPCGtaS3trg8+M7kMjK6EFrRxD/r50jJtO0I4?=
 =?us-ascii?Q?wdEn4vWX72ELMDT3RQsy00zqzE8pKg0zcve9RpFXe8n5/S5qGunsxbVVZ8cy?=
 =?us-ascii?Q?+/jXLcebWwrBwCCHKLmX6QXGGu5Igg3gPwpuhIa8QmAqCkNqT8hpkvpzSGXp?=
 =?us-ascii?Q?bQU5SNucLzPSHwM5ySsASaTmcYbWz4gjMT9U3KAwyOw4FB/TNJI/FUDV99vQ?=
 =?us-ascii?Q?zgON+F4a2F6QNFz7fZP2fjk6WsiNhwGcU98ZWimx0aDtmm/g2/l/2+qUDIUJ?=
 =?us-ascii?Q?3UE9VBcG6Ao5JN5Qy9o2QeNwNcguYsnVLM+oObuwjmiaEYQu1EJrjHz/iZIh?=
 =?us-ascii?Q?TzqqbW2cy+kWaWGreEMqXZZeazm1lKSD7X3sZgm8FFST8+9VlVkeywNtWieA?=
 =?us-ascii?Q?sJQRBHGjv35g1mYDneaVcQciOVuOxA1/YkJ8/n0D/ucPMJfY2mLqXbrO8sDe?=
 =?us-ascii?Q?CoTdhqMJ2hQrwHdxmUM91aBHuu/Sac/49vBTk5rE6FE2QWqxYtojnC7HcMjY?=
 =?us-ascii?Q?vis8MZy05MgLzNS8H63GqJhDljCuNSeLcvkEMCMlTIFVkvpWzkdVEdE28F/U?=
 =?us-ascii?Q?x7SQ3U+GrlV9EKxtahyLHaSJAmrVgw8kCOL9E9V25kMolcUoXOWF++oIxJGh?=
 =?us-ascii?Q?zIql+/w0+bB1igqlSuOm2nHvRutlLaBu96W3GTUrwoSPZ3mEsJShYaj4sWpc?=
 =?us-ascii?Q?Yc6e6o0a7Q8WixzrFO0VQ29a6Ut1T9UmpGt1FdAaXoRSUIHugre4uo6dsLK7?=
 =?us-ascii?Q?m4WTWPT5bfOcNWW5W00u0DRQ1hnGeMFN4Ojxq/Sjd/ylPKyJJmGxR8aTXBvG?=
 =?us-ascii?Q?yI9L1kC60bP+ajcqmSvcEpd46eOkbs/b0Osfe0EilCkGxpmPa6lALBycT0Vj?=
 =?us-ascii?Q?C0bNfJgQXlRDRSWT/ei4a15Pnmr7bcnFvdxywANlsj/Fa6GG3A74WmuoLf2p?=
 =?us-ascii?Q?955V30ICmJ0Tq6ymFt+z8QQJm7W5998cf3igCPI5ysFod6J96U8Zvq4MxI2x?=
 =?us-ascii?Q?rsmlzkmVA3oJsqsV/x8RDew3Y7flhIGp4OQObptHXpcBEoB/yQ21RuinLlmH?=
 =?us-ascii?Q?/iPJ6ekihc71y5b10QIsWrA3I3NlKCPqhBzJOJJ6htMOKWLlynSkcmti/bkW?=
 =?us-ascii?Q?mCn1WE4vfQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8dcae2b-5138-4a10-00cc-08deb1209d9d
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7402.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 18:51:17.5341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FyU5WXVMo46qsnMOq4MUTQgBvIF72z/qD+3IKGYMIbG7+VxcrdiMjHtZBcHqJ8nHgtETkhi1TvVsrkw/D/y5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7337

Add a generic PHY driver for the TI DS125DF111 Multi-Protocol
Dual-Channel Retimer. The driver currently supports only 10G and 1G link
speeds but it can easily extended to also cover other usecases.

Since the available datasheet (https://www.ti.com/lit/gpn/DS125DF111)
does not name the registers, the name for the macros were determined by
their usage pattern.

A PHY device is created for each of the two channels present on the
retimer. This allows for independent configuration of the two channels.
This capability is especially important on retimers which have more than
2 channels that can be, depending on the board design, connected in
multiple different ways to the SerDes lanes.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 drivers/phy/ti/Kconfig          |  10 ++
 drivers/phy/ti/Makefile         |   1 +
 drivers/phy/ti/phy-ds125df111.c | 245 ++++++++++++++++++++++++++++++++
 3 files changed, 256 insertions(+)
 create mode 100644 drivers/phy/ti/phy-ds125df111.c

diff --git a/drivers/phy/ti/Kconfig b/drivers/phy/ti/Kconfig
index b40f28019131..475e80fcd52d 100644
--- a/drivers/phy/ti/Kconfig
+++ b/drivers/phy/ti/Kconfig
@@ -111,3 +111,13 @@ config PHY_TI_GMII_SEL
 	help
 	  This driver supports configuring of the TI CPSW Port mode depending on
 	  the Ethernet PHY connected to the CPSW Port.
+
+config PHY_TI_DS125DF111
+	tristate "DS125DF111 2-Channel Retimer Driver"
+	depends on OF && I2C
+	select GENERIC_PHY
+	help
+	  Enable this to add support for configuration and runtime management
+	  of the TI DS125DF111 Multi-Protocol 2-Channel Retimer.
+	  The retimer is modeled as a Generic PHY and supports both 10G and 1G
+	  link speeds.
diff --git a/drivers/phy/ti/Makefile b/drivers/phy/ti/Makefile
index dcba2571c9bd..e68445ddd848 100644
--- a/drivers/phy/ti/Makefile
+++ b/drivers/phy/ti/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_TWL4030_USB)		+= phy-twl4030-usb.o
 obj-$(CONFIG_PHY_AM654_SERDES)		+= phy-am654-serdes.o
 obj-$(CONFIG_PHY_TI_GMII_SEL)		+= phy-gmii-sel.o
 obj-$(CONFIG_PHY_J721E_WIZ)		+= phy-j721e-wiz.o
+obj-$(CONFIG_PHY_TI_DS125DF111)		+= phy-ds125df111.o
diff --git a/drivers/phy/ti/phy-ds125df111.c b/drivers/phy/ti/phy-ds125df111.c
new file mode 100644
index 000000000000..8ac10c603bf7
--- /dev/null
+++ b/drivers/phy/ti/phy-ds125df111.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2026 NXP */
+
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
+
+#define DS125DF111_NUM_CH			2
+#define DS125DF111_NUM_VCO_GROUP_REG		5
+
+#define DS125DF111_CH_SELECT			0xff
+#define DS125DF111_CH_SELECT_TARGET_MASK	GENMASK(3, 0)
+#define DS125DF111_CH_SELECT_EN			BIT(2)
+
+#define DS125DF111_CH_CTRL			0x00
+#define DS125DF111_CH_CTRL_RESET		BIT(2) /* self clearing */
+
+#define DS125DF111_VCO_GROUP_BASE		0x60
+
+#define DS125DF111_RATIOS			0x2F
+#define DS125DF111_RATIOS_RATE_MASK		GENMASK(7, 6)
+#define DS125DF111_RATIOS_SUBRATE_MASK		GENMASK(5, 4)
+
+struct ds125df111_ch {
+	struct phy *phy;
+	struct ds125df111_priv *priv;
+	int idx;
+};
+
+struct ds125df111_priv {
+	struct ds125df111_ch ch[DS125DF111_NUM_CH];
+	struct i2c_client *client;
+	struct mutex mutex; /* protects access to shared registers */
+};
+
+enum ds125df111_mode {
+	FREQ_1G,
+	FREQ_10G,
+};
+
+static const struct ds125df111_config {
+	u8 vco_group[DS125DF111_NUM_VCO_GROUP_REG];
+	u8 rate;
+	u8 subrate;
+} ds125df111_cfg[] = {
+	[FREQ_1G] = {
+		/* VCO group #0 = 10GHz, VCO group #1 = 10GHz */
+		.vco_group = {0x00, 0xB2, 0x00, 0xB2, 0xCC},
+		/* By using the following combination of rate and subrate we
+		 * select divide ratios of 1, 2, 4, 8 on both groups
+		 */
+		.rate = 0x1,
+		.subrate = 0x2,
+	},
+
+	[FREQ_10G] = {
+		/* VCO group #0 = 10.3125GHz, VCO group #1 = 10.3125GHz */
+		.vco_group = {0x90, 0xB3, 0x90, 0xB3, 0xCD},
+		/* By using the following combination of rate and subrate we
+		 * select divide ratios of 1 on both groups
+		 */
+		.rate = 0x1,
+		.subrate = 0x3,
+	},
+};
+
+static int ds125df111_configure(struct phy *phy,
+				const struct ds125df111_config *cfg)
+{
+	struct ds125df111_ch *ch = phy_get_drvdata(phy);
+	struct ds125df111_priv *priv = ch->priv;
+	struct i2c_client *i2c = priv->client;
+	struct device *dev = &phy->dev;
+	u8 val;
+	int err, i;
+
+	mutex_lock(&priv->mutex);
+
+	/* Make sure that any subsequent read/write operation will be directed
+	 * only to the registers of the selected channel
+	 */
+	err = i2c_smbus_read_byte_data(i2c, DS125DF111_CH_SELECT);
+	if (err < 0) {
+		dev_err(dev, "Unable to select channel\n");
+		goto out;
+	}
+	val = (u8)err;
+	val &= ~DS125DF111_CH_SELECT_TARGET_MASK;
+	val |= DS125DF111_CH_SELECT_EN | ch->idx;
+	err = i2c_smbus_write_byte_data(i2c, DS125DF111_CH_SELECT, val);
+	if (err < 0) {
+		dev_err(dev, "Unable to select channel\n");
+		goto out;
+	}
+
+	/* Reset Channel Registers */
+	err = i2c_smbus_read_byte_data(i2c, DS125DF111_CH_CTRL);
+	if (err < 0) {
+		dev_err(dev, "Error resetting channel configuration\n");
+		goto out;
+	}
+	val = (u8)err;
+	val |= DS125DF111_CH_CTRL_RESET;
+	err = i2c_smbus_write_byte_data(i2c, DS125DF111_CH_CTRL, val);
+	if (err < 0) {
+		dev_err(dev, "Error resetting channel configuration\n");
+		goto out;
+	}
+
+	/* Program the VCO group frequencies */
+	for (i = 0; i < DS125DF111_NUM_VCO_GROUP_REG; i++) {
+		err = i2c_smbus_write_byte_data(i2c,
+						DS125DF111_VCO_GROUP_BASE + i,
+						cfg->vco_group[i]);
+		if (err < 0) {
+			dev_err(dev, "Error programming VCO group frequencies\n");
+			goto out;
+		}
+	}
+
+	/* Set the Divide Ratios for the VCO Groups*/
+	err = i2c_smbus_read_byte_data(i2c, DS125DF111_RATIOS);
+	if (err < 0) {
+		dev_err(dev, "Error programming the divide ratios\n");
+		goto out;
+	}
+	val = (u8)err;
+	val &= ~(DS125DF111_RATIOS_RATE_MASK | DS125DF111_RATIOS_SUBRATE_MASK);
+	val |= FIELD_PREP(DS125DF111_RATIOS_RATE_MASK, cfg->rate) |
+		FIELD_PREP(DS125DF111_RATIOS_SUBRATE_MASK, cfg->subrate);
+	err = i2c_smbus_write_byte_data(i2c, DS125DF111_RATIOS, val);
+	if (err < 0) {
+		dev_err(dev, "Error programming the divide ratios\n");
+		goto out;
+	}
+
+	mutex_unlock(&priv->mutex);
+
+	return 0;
+
+out:
+	mutex_unlock(&priv->mutex);
+
+	return err;
+}
+
+static int ds125df111_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	const struct ds125df111_config *cfg;
+
+	if (mode != PHY_MODE_ETHERNET)
+		return -EOPNOTSUPP;
+
+	switch (submode) {
+	case PHY_INTERFACE_MODE_10GBASER:
+		cfg = &ds125df111_cfg[FREQ_10G];
+		break;
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		cfg = &ds125df111_cfg[FREQ_1G];
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return ds125df111_configure(phy, cfg);
+}
+
+static const struct phy_ops ds125df111_ops = {
+	.set_mode	= ds125df111_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static struct phy *ds125df111_xlate(struct device *dev,
+				    const struct of_phandle_args *args)
+{
+	struct ds125df111_priv *priv = dev_get_drvdata(dev);
+	u32 idx = args->args[0];
+
+	if (idx >= DS125DF111_NUM_CH) {
+		dev_err(dev, "Maximum number of channels is %d\n",
+			DS125DF111_NUM_CH);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return priv->ch[idx].phy;
+}
+
+static int ds125df111_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct phy_provider *provider;
+	struct ds125df111_priv *priv;
+	int i, err;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	priv->client = client;
+	err = devm_mutex_init(dev, &priv->mutex);
+	if (err)
+		return err;
+
+	i2c_set_clientdata(client, priv);
+
+	for (i = 0; i < DS125DF111_NUM_CH; i++) {
+		struct ds125df111_ch *ch = &priv->ch[i];
+		struct phy *phy;
+
+		phy = devm_phy_create(dev, NULL, &ds125df111_ops);
+		if (IS_ERR(phy))
+			return PTR_ERR(phy);
+
+		ch->idx = i;
+		ch->priv = priv;
+		ch->phy = phy;
+
+		phy_set_drvdata(phy, ch);
+	}
+
+	provider = devm_of_phy_provider_register(dev, ds125df111_xlate);
+
+	return PTR_ERR_OR_ZERO(provider);
+}
+
+static const struct of_device_id ds125df111_dt_ids[] = {
+	{ .compatible = "ti,ds125df111", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ds125df111_dt_ids);
+
+static struct i2c_driver ds125df111_driver = {
+	.driver = {
+		.name = "ds125df111",
+		.of_match_table = ds125df111_dt_ids,
+	},
+	.probe = ds125df111_probe,
+};
+module_i2c_driver(ds125df111_driver);
+
+MODULE_AUTHOR("Ioana Ciornei <ioana.ciornei@nxp.com>");
+MODULE_DESCRIPTION("TI DS125DF111 Retimer driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

