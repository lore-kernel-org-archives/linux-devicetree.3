Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013051.outbound.protection.outlook.com [40.107.162.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964273FBB4E;
	Mon, 18 May 2026 14:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114078; cv=fail; b=qJFHXcXSTNeX2a3WVaQQp1aIlOqV80U0xWv5OvC59vT9vIQMFolcSMjjKQZ5tiFjWDxGL+8Jp6jKMW8KmfwqcEiGc84NUeFYW4kS2HCJM7iAEnAWCqjoqUz6wQST29sA7+shCINmkSJpvX/DFw++1rqUxdSd8vjcKdIn4TZMz3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114078; c=relaxed/simple;
	bh=GceStKt6TeR58/xVkDMUsXJbgfvPu+AicpZob8mkTXk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gyVpccG5A6vZ0eo/0mylFlnBHoEL+FzEY+oU63FcDJTS5N+E8XZcQHR04CRnThKgQJEimTzBW/fxJICnhBL5MPXDd+G1N/yNuT285hUA6lTk9kfI8zeZ6OweiaK6cCkhifgCvG2x0bZ8neLxna7eiSUaHkmQWUOXzTHcvA8gwhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BqHkaLzV; arc=fail smtp.client-ip=40.107.162.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BqHkaLzV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2stWidBOHN9dJKh+SFakEEQPm8NNNaNEDBTp8pHCAUESR3M7Clo3Ywm3/kXVJ5BilWvESBmioVHIzPDjRTU5a4orbwYlnZvIJZ8n7AL76XuXrbiENYSYFnkAQ9Q4hhlwDSgrTV+lSkBive+FRONMOhYRIoxfMo272fl9dIL26NUyn1Hh7JvMW5WLmgECIGX+aMsO3rKygrdxRhzKvbjbcVpL+O244Cmq0RpuU5/vE2DmOooVoGJSEBjEH5FoPBBkK8oNscH2ugtW6fW9DH7sqtZBtJ4tbVrwiWsHE9wcVam658y1oxCIZTzf3QN55uP5aEwRK6uM9qFBY1fab9rmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qr6bSNAV/RMt20+1zHcqefmFaKTfSTvGwgJSUgihYfQ=;
 b=eMTF5Z4fETCGyWTUramkhok6DIJHC/mN8ytFaIEJIXXMC5bvs/TAWOCS9wAUAXi+HeJm78ZVPcf7Gr0l4Cur7McC8I8WeFAMwm1HLmcDkZTEL/ZMJm57Hzm5ABowp1lMCkVugqnIjfTJNlvmRkCxyA7ptXx+2SitAa9nAFrJ53uJPsSBwLn0VixYxtt9DTEWBEXg3zJL/4V3BMN1AsyCqAfE3F9iQpSFfjd7TyAjxqjTb1/W6iAg2hYbYMszLP7pXlnMSiUpmX6C3WqR9jesxixNvNJ1xrbcpRjl7uT9+H+ZKXGsUioFKRTaYUs3rn+cZKxE7cZk+LrulhsXNcBd6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qr6bSNAV/RMt20+1zHcqefmFaKTfSTvGwgJSUgihYfQ=;
 b=BqHkaLzVE2HpDL3mqF9QtXggLLO+BBEiucOjeGWOkPCqWPDvyVpteADspNI/zCj3lJ9SpGpoa1B8y7hcc/8/RaxU4H4NWgvzfbWzH+Gv77ZrGt4D6AYtyxR5ulKLZTJ7oepenPG59A6PYW5AugwGqlzJhc5nLvK027xxLHqYxSvHDqEGo3sGI1JLk2lHLlAIcz6srSptAi3rChnfh+gYnHB95XzSF/m81siYTn6dgEmLdEv2GOI+U43rftoixtplfZf+7bkpSizCvn2J6htD2rldg+ULZgyPbF3bezxWKnbIjjrKVrgKaeOyNOiJAMLqRbKSOFInNQthV1IQoAEoGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com (2603:10a6:102:89::16)
 by GV4PR04MB11793.eurprd04.prod.outlook.com (2603:10a6:150:2dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 14:20:51 +0000
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d]) by PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d%5]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 14:20:51 +0000
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
Subject: [PATCH v4 linux-phy 3/3] phy: ti: add PHY driver for TI DS125DF111 Dual-Channel Retimer
Date: Mon, 18 May 2026 17:20:26 +0300
Message-Id: <20260518142026.3098496-4-ioana.ciornei@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: e908bdf6-3d43-4e07-6824-08deb4e8a9f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|11063799003|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GfXpajvl4f/5hQOyzuoVcZyd9QVxRI1DZZZrCtYiVtOUK71Rf/PlBMXhiurok/DWfxBLczXP1SQF9xWxTPIm9OGLt37lpVWjdUz/DEOulJA6UOLfzpoAxJUXFT79EBuHbDQEzKu8QSx34eTd+fnmZ9s0XWsglObY0Z2qHLbXKTIQ0xkS+zeJws17zK8TKxFljJfpm8wwOETt+h0k09bgKxV6wj+wFl3rJ5LShTpMkCaWja9Rn0UECOcLDO03OWnoDNSzSTYPc8VwTlAiGbQOxcQyh9kSSrGEbZQrjReaVGCB+kVfp1sPJhmXfJPq+bogQil6vPx72rkDJumbxTSihfA/5h87oF5tjg91rIn/rw5zJhT9e58bZQr6iBmS+Wut0z5B8yqNExdqKp8Xk9bMQtNdGPs4kfm5ai/XW7ceM+HoiBIsAB3tgOmoC/5PMdTg1j6va7KGRoSWFFx4uNX+N4R0nNuHO1qVhqXQWbjt6nrWDzo1L86IZrHXDyYcIjKjixWmGsaNMCLg6dr9Z7orRDUTBn9I5w+bWoSEmY2qcUm0HH3tG7CqMvRq9OIa1nU/82Ypw7OO7Xm0DynKgHBoFwgFgTY9pVsaMDp+CijMQPQjQ0xHu7xqkqdbACssrkGMW8d5Dr19kB+GKT8tC+xpommT+v4M88Sev/9lAFVL+g+pntz9JCfeuttjyeuxCcABwCTvlTSOKmMt5/fcGbGq6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7402.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(11063799003)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2grl8+XB1I7GE6/H41ptWRwQDKr8+xuNxg/7w11T2WMHyII9EJdgK2+3CYsg?=
 =?us-ascii?Q?DsMTG2ThtQ42PWmchkJIkWfy81ZKagr2d2JZHEcsIxpyWNh7Gzs6qAX4nE7z?=
 =?us-ascii?Q?TLsBTULiXlzGauCsN6X5Wv7A5lC98JZNDQNNfu/2f5+wCZDU2Mt6+Ixz88n1?=
 =?us-ascii?Q?QqdQjMs2nZcGF5zcsvj96GyUdiWSvRNNykyBE+ZHdYIF0qtG5LGzKZ/aYgQ2?=
 =?us-ascii?Q?Hm5trgpJKgLlPs6w0wUjfRgbJQEEfvwW0GmpOzIbx3a5XGMbfbI0zR7gY+dC?=
 =?us-ascii?Q?PMVf5p/Wch3UbkImY0pT/1PCVLARqjdJKuJpFfOp4fe392wBLNCE6EqhxbpN?=
 =?us-ascii?Q?uwsKOfa02Xo3PNw75htr4NRbIiO6I9IKAZYcGNrtf3KrKOTj6o+CgwuEimku?=
 =?us-ascii?Q?fajUxEaWKm2d7S+EVhM61CIrfE7ZTuvtmD0ECQcoE4oge10kHcjBeychVC2y?=
 =?us-ascii?Q?bXWtESwlrpSi0nuCiZVFi2KjMAVs4WYybDoK+JV7rsV085wELo+6Dtdh2pIi?=
 =?us-ascii?Q?m+CwOevX5NiLe5czHBV3ZH/35/Nk/CCWWcheikSw/8GLvN0Xsz848d5xYzRA?=
 =?us-ascii?Q?3ZLNViaxt6GQGibphPMjEZfCnFTmUxjxTIhdjviA5EOVqsD+FvSPuq85rdRV?=
 =?us-ascii?Q?HPUEtUoqk/iQf1fwy4EWmxhghAcVKnRxqi6WPRaQHKRIzqUzVtSMC/JoCNId?=
 =?us-ascii?Q?otzDDNXr17kv3koGYpzZo2mqYqssy9o26TrB3G0TsxuN5yzpuGmk1DEUIlQZ?=
 =?us-ascii?Q?n8d+1W3sHoCslCKAt/uZmZDdPVyMb1Q6/hwrb1THyHEdrKac63Z6OfQZ4D2p?=
 =?us-ascii?Q?w8rYf0rJhWdikiesdwd3vRYEpQFFCFt0kEhoczmdcffAzUvnHZ1ZICxvtpnS?=
 =?us-ascii?Q?0uOeTQ2GjZ1xm0Cn60hAMZTHTK1FB1Y21I9LO3i0sqw8BZQTz0zSWfTuEn9X?=
 =?us-ascii?Q?rhlEiBhK3wBN/Wl0MPiPFrVLA1w+nlgbsBZhd/P2K9gTxTAFctaVwD3FT7ng?=
 =?us-ascii?Q?29zpoCSvUYZCcWQJsxki6vu7+lzIr8pG1jVuDq3PHSfLZPADgV8ZrjaV0vdL?=
 =?us-ascii?Q?BghxLsN6W19Bym8vadvprngj6rYdMUocKFxUR8NYl8Lg5qBNLNxVhRkhQ3VM?=
 =?us-ascii?Q?yyLDKMYOsTJIdJG9WNd7WOqxgxD+MSNB0RtTgZynpzXQs8MgJlsI2+e7DbbS?=
 =?us-ascii?Q?PUsX6ANmW6WIl25ruNptZUB5f/Sn9PzSKN08S3t6dbPRgKZJRKLKuTxj42U7?=
 =?us-ascii?Q?A9TtS6jCnCbADHwWlaf+n3gZYs3QcsZFJJ76zdzObsWW6DbJcv0a/SLO0LTL?=
 =?us-ascii?Q?/VjeiTL1rEsssj0SpzWIp+97Z9Xnn0AkPMlM8b1tVnCgE+RwYVRqqXFw1lwV?=
 =?us-ascii?Q?y62x3h5AhKZZB0vrEmZvBq+IM/7Rhsm9bNV1BddrR6YY8dfEqreB4IkEK3Jm?=
 =?us-ascii?Q?PMFnzGb8xix4w/0KF7Og5M0KYnUns7iQNY5uApeOtYTpjpzWkneCi7+gKBTL?=
 =?us-ascii?Q?RVJWLUouvK2p+P5a8f59PN90xp9Zq9rxTfU5ERQu3iFeNjFYRvuWDi4yWF5K?=
 =?us-ascii?Q?Dlvmx0xHynJSEWdMIl8VDe9galLRSuXf11fR+6j+S8JcncpR9JM7O6b6kNHL?=
 =?us-ascii?Q?4Tckbyu1J4sFdW8Kyghub7uITfQ1J5+JLuUZ2B97luVvfBS0JoZci6ocihcz?=
 =?us-ascii?Q?Uv1EdcgEqkfgSjgB9JBrFTXE5kNZz5Dfx8xxX04Bou2bBPtzanJXwVPsxPMr?=
 =?us-ascii?Q?23krpAAsZQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e908bdf6-3d43-4e07-6824-08deb4e8a9f3
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7402.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 14:20:51.0916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5GS1j8ZZHXbW6SqmGM1IZkT66aSlk3ngL3SCbuw4h9139a+rEnCkL8v3k+/cB8YLgR7TcHJubUXNhm73M5CzCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11793

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
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
Changes in v4:
- Use lower case for hex values
- Insert the new entry in the Kconfig/Makefile so that we keep the
alphabetical order established in the previous patch

Changes in v3:
- Use reverse Christmas tree ordering
- Print a symbolic description in case of error
- Some words do not need to be capitalized
- Remove duplicated exit code path
- Return -EINVAL in case of unsupported submode received in .set_mode()
- Add a .validate() callback
- Remove comma after sentinel entry
- Add a ds125df111_rmw() helper
- Use read_poll_timeout() to wait for channel reset to complete

Changes in v2:
- Explicitly include all the needed headers
- Change ds125df111_xlate() so that it returns an error if args_count is
not exactly 1
- Add a MAINTAINERS entry
---
 MAINTAINERS                     |   7 +
 drivers/phy/ti/Kconfig          |  10 ++
 drivers/phy/ti/Makefile         |   1 +
 drivers/phy/ti/phy-ds125df111.c | 294 ++++++++++++++++++++++++++++++++
 4 files changed, 312 insertions(+)
 create mode 100644 drivers/phy/ti/phy-ds125df111.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f877e5aaf2c7..58f410b666e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26781,6 +26781,13 @@ T:	git git://linuxtv.org/mhadli/v4l-dvb-davinci_devices.git
 F:	drivers/media/platform/ti/davinci/
 F:	include/media/davinci/
 
+TI DS125DF111 RETIMER PHY DRIVER
+M:	Ioana Ciornei <ioana.ciornei@nxp.com>
+L:	linux-phy@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/ti,ds125df111.yaml
+F:	drivers/phy/ti/phy-ds125df111.c
+
 TI ENHANCED CAPTURE (eCAP) DRIVER
 M:	Vignesh Raghavendra <vigneshr@ti.com>
 R:	Julien Panis <jpanis@baylibre.com>
diff --git a/drivers/phy/ti/Kconfig b/drivers/phy/ti/Kconfig
index dbe65500f20c..b52c7eabe24c 100644
--- a/drivers/phy/ti/Kconfig
+++ b/drivers/phy/ti/Kconfig
@@ -73,6 +73,16 @@ config PHY_J721E_WIZ
 	  three clock selects (pll0, pll1, dig) and resets for each of the
 	  lanes.
 
+config PHY_TI_DS125DF111
+	tristate "TI DS125DF111 2-Channel Retimer Driver"
+	depends on OF && I2C
+	select GENERIC_PHY
+	help
+	  Enable this to add support for configuration and runtime management
+	  of the TI DS125DF111 Multi-Protocol 2-Channel Retimer.
+	  The retimer is modeled as a Generic PHY and supports both 10G and 1G
+	  link speeds.
+
 config PHY_TI_GMII_SEL
 	tristate
 	select GENERIC_PHY
diff --git a/drivers/phy/ti/Makefile b/drivers/phy/ti/Makefile
index 975fb8448ba5..a002ef8764a2 100644
--- a/drivers/phy/ti/Makefile
+++ b/drivers/phy/ti/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_PHY_AM654_SERDES)		+= phy-am654-serdes.o
 obj-$(CONFIG_PHY_DA8XX_USB)		+= phy-da8xx-usb.o
 obj-$(CONFIG_PHY_DM816X_USB)		+= phy-dm816x-usb.o
 obj-$(CONFIG_PHY_J721E_WIZ)		+= phy-j721e-wiz.o
+obj-$(CONFIG_PHY_TI_DS125DF111)		+= phy-ds125df111.o
 obj-$(CONFIG_PHY_TI_GMII_SEL)		+= phy-gmii-sel.o
 obj-$(CONFIG_PHY_TUSB1210)		+= phy-tusb1210.o
 obj-$(CONFIG_TI_PIPE3)			+= phy-ti-pipe3.o
diff --git a/drivers/phy/ti/phy-ds125df111.c b/drivers/phy/ti/phy-ds125df111.c
new file mode 100644
index 000000000000..84ff96d7d589
--- /dev/null
+++ b/drivers/phy/ti/phy-ds125df111.c
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2026 NXP */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/i2c.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
+#include <linux/slab.h>
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
+#define DS125DF111_CH_RST_SLEEP_US		10
+#define DS125DF111_CH_RST_TIMEOUT_US		10000
+
+#define DS125DF111_VCO_GROUP_BASE		0x60
+
+#define DS125DF111_RATIOS			0x2f
+#define DS125DF111_RATIOS_RATE_MASK		GENMASK(7, 6)
+#define DS125DF111_RATIOS_SUBRATE_MASK		GENMASK(5, 4)
+#define DS125DF111_RATIOS_MASK			GENMASK(7, 4)
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
+static int ds125df111_rmw(struct ds125df111_priv *priv, u8 reg, u8 clr, u8 set)
+{
+	struct i2c_client *i2c = priv->client;
+	int err;
+	u8 val;
+
+	err = i2c_smbus_read_byte_data(i2c, reg);
+	if (err < 0)
+		return err;
+
+	val = (u8)err;
+	val &= ~clr;
+	val |= set;
+
+	err = i2c_smbus_write_byte_data(i2c, reg, val);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static int ds125df111_configure(struct phy *phy,
+				const struct ds125df111_config *cfg)
+{
+	struct ds125df111_ch *ch = phy_get_drvdata(phy);
+	struct ds125df111_priv *priv = ch->priv;
+	struct i2c_client *i2c = priv->client;
+	struct device *dev = &phy->dev;
+	u8 ratios_val;
+	int err, i;
+	int val;
+
+	mutex_lock(&priv->mutex);
+
+	/* Make sure that any subsequent read/write operation will be directed
+	 * only to the registers of the selected channel
+	 */
+	err = ds125df111_rmw(priv, DS125DF111_CH_SELECT,
+			     DS125DF111_CH_SELECT_TARGET_MASK,
+			     DS125DF111_CH_SELECT_EN | ch->idx);
+	if (err < 0) {
+		dev_err(dev, "Unable to select channel: %pe\n", ERR_PTR(err));
+		goto out;
+	}
+
+	/* Reset channel registers and wait until the bit was cleared */
+	err = ds125df111_rmw(priv, DS125DF111_CH_CTRL, 0,
+			     DS125DF111_CH_CTRL_RESET);
+	if (err < 0) {
+		dev_err(dev, "Error resetting channel configuration: %pe\n",
+			ERR_PTR(err));
+		goto out;
+	}
+
+	err = read_poll_timeout(i2c_smbus_read_byte_data, val,
+				val < 0 || !(val & DS125DF111_CH_CTRL_RESET),
+				DS125DF111_CH_RST_SLEEP_US,
+				DS125DF111_CH_RST_TIMEOUT_US, false, i2c,
+				DS125DF111_CH_CTRL);
+	if (err) {
+		dev_err(dev, "Timed out waiting for channel reset: %pe\n",
+			ERR_PTR(err));
+		goto out;
+	}
+
+	if (val < 0) {
+		dev_err(dev, "Error reading reset status: %pe\n", ERR_PTR(val));
+		err = val;
+		goto out;
+	}
+
+	/* Program the VCO group frequencies */
+	for (i = 0; i < DS125DF111_NUM_VCO_GROUP_REG; i++) {
+		err = i2c_smbus_write_byte_data(i2c,
+						DS125DF111_VCO_GROUP_BASE + i,
+						cfg->vco_group[i]);
+		if (err < 0) {
+			dev_err(dev, "Error programming VCO group: %pe\n",
+				ERR_PTR(err));
+			goto out;
+		}
+	}
+
+	/* Set the divide ratios for the VCO groups */
+	ratios_val = FIELD_PREP(DS125DF111_RATIOS_RATE_MASK, cfg->rate) |
+		FIELD_PREP(DS125DF111_RATIOS_SUBRATE_MASK, cfg->subrate);
+	err = ds125df111_rmw(priv, DS125DF111_RATIOS, DS125DF111_RATIOS_MASK,
+			     ratios_val);
+	if (err < 0) {
+		dev_err(dev, "Error programming the divide ratios: %pe\n",
+			ERR_PTR(err));
+		goto out;
+	}
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
+		return -EINVAL;
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
+		return -EINVAL;
+	}
+
+	return ds125df111_configure(phy, cfg);
+}
+
+static int ds125df111_validate(struct phy *phy, enum phy_mode mode, int submode,
+			       union phy_configure_opts *opts __always_unused)
+{
+	if (mode != PHY_MODE_ETHERNET)
+		return -EINVAL;
+
+	switch (submode) {
+	case PHY_INTERFACE_MODE_10GBASER:
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct phy_ops ds125df111_ops = {
+	.validate	= ds125df111_validate,
+	.set_mode	= ds125df111_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static struct phy *ds125df111_xlate(struct device *dev,
+				    const struct of_phandle_args *args)
+{
+	struct ds125df111_priv *priv = dev_get_drvdata(dev);
+	u32 idx;
+
+	if (args->args_count != 1)
+		return ERR_PTR(-EINVAL);
+
+	idx = args->args[0];
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
+	{}
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

