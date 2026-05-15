Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCC247799D;
	Fri, 15 May 2026 11:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842922; cv=fail; b=nqIEZLHSXm+iZBLY4+cEqviYX7uSEd0EK11WMrkrBOnerMz6vMawM/PWb06Dxfk1lzz18bJA4svW6rDh+BLIXCP9NQmrEzcCl9SNTuvk7/vWW8WQulRgf215ylrVgHQ4h0PyvNNPTJXGVo8MDm7tGiY3XQRAwYAS11sXYGf/LWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842922; c=relaxed/simple;
	bh=R/9ka3j3izgtvQQS0XqzmJv2qazLEd+RRHxSRDJsbxo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=He+3YIRMvOWF6MLKN6xVYFX1llxyQLLeK4I8NWiq/slTN72QfH5ycfRWcdaqW7vcd5yQefCEEEgncYbOSia1UUbnh9hbwggKgoHN1iC1pnJdRXaDKGKYNj3QJ+NLSaPq3ms0m3HFcs5j2a90tUKPy2faNJy9TMY2SXT4TiC7qx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kg68sqpt; arc=fail smtp.client-ip=52.101.84.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kg68sqpt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gomJZtYa3j2s2Jy3D7FOkGZ0qDhLN5EXtb+Qpq8us7IYwYHzw+pMd/CBgR6AhPkOQOsJRuWAN7zkLXcdsXQ688Frn4F2ocBFHPbVUO/RBt2rG9EiahfK1aZDv78/E30LN+t9XUqNygwaK4TEH6GKeX1wXPBwTHvPQB8OTsB/2K5RsXZOGNcCD/tmaxw0oKRLIBCeL87NCJRDhjXihqRWIU3A6VS4apnLrjRtPAj8Rm/deeB3NJUDQ9fKS8+EgjYBzAe9uAp0wqRIEhIMvzC/xOXon7tz1oHnG09J01QmzwiooWVQDyupOuwxQ5uDNMzRAv4AqrEo3eynVp9hfr0Vcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zc/G0pBoV2pZj7E7Nig/xuF7rUPWV6bVfoca7irkJSQ=;
 b=dcX8yfArAH56t7wQpvQzmVXUgMxhmg5mNW19ibFwgNOLam4VgeKnE191r00t+qob8yYm+52/eYV0WKS5EfLIR3vwO10q7nJHTiHhxD1Y0UZrnHQxf1niGQCpy8Hypw8oLCZm2WaY5aP57RTyKLDOtGR/7DKkKU+Rrmh2JaChByoo5KYlYGztDs3iF2/X113gbXXkabMVnGzG32V5VGLsEfgLdOSVK18MWwqM4sUFCytC5qE4jWRbG/cm7XdgMFK5yT6EpOMfoolY8X4f7940SMra/+Czwdcg/Gi2SGnltszOHt05Tuv0jGugAuyfnRYeggJV0P8UyoV2BFEyZJDdDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zc/G0pBoV2pZj7E7Nig/xuF7rUPWV6bVfoca7irkJSQ=;
 b=kg68sqpt3g4fjwkWnH51yS6sRQZrXFCBSnDXGBM5p6jxp+gSoTpxm6+Yu2uq4Wg6Blfe9XkgtFYrh3bA2CTkTaToGaEYM6fTMG7w4zwlUk5P7E2nzPY9R4RT5s5PZtD3tcgnJJV11yZWb4hHZPqVEa25uNV/aXaHKXZa/AItt1aZJ4BVF90Xxjg9GAH4DfAQ8Nbm0tGnemD0TYliYTto7Ucy4bD25C4d9PUG/rW0ZJ0dMD9NcW4eAyuIxdsMzCfko1WFMWJvSSCxZacVSR/ELFyHHMdzh/zDnrw7vt6iep/W6qY70MquOZfvKAvlvB02IIvm1NY7UbkDcoYLsVUQRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com (2603:10a6:102:89::16)
 by PAWPR04MB9806.eurprd04.prod.outlook.com (2603:10a6:102:389::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 11:01:58 +0000
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d]) by PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 11:01:58 +0000
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
Subject: [PATCH v2 phy-next 2/2] phy: ti: add PHY driver for TI DS125DF111 Dual-Channel Retimer
Date: Fri, 15 May 2026 14:01:45 +0300
Message-Id: <20260515110145.1925579-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515110145.1925579-1-ioana.ciornei@nxp.com>
References: <20260515110145.1925579-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0211.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::7) To PR3PR04MB7402.eurprd04.prod.outlook.com
 (2603:10a6:102:89::16)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7402:EE_|PAWPR04MB9806:EE_
X-MS-Office365-Filtering-Correlation-Id: a9037bc7-8605-4cc6-16f6-08deb271622f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|11063799003|3023799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kpew9vfE5ciPJcfLNbMdTkUozAdEIOm19vjn4HST6ndYsQ6XJEXyTJOnoriVQlcXYdmb4H1a8CwKuaEj8Ytx4Al0oIAVLT3wy/ROgU73znO2W1e4uVPRtH0KSid6Pw9cROce9yylG2uWxteQ6Glwp+aWtl6O6cEBIbsBILYYvtCpVnd8KeGWbOWfrz4qtRvsg6/M5MjQNmVWGCPzBXPwNSUglALME/1P2EwZUEt/2SbpA2PM6SYEMPN1lKCkN/ZsR7BphVs/eBp3hlI2I/CsXc3ao4dM1GTDLpMe5T6+MW1xRMxUhQ1SyGAtdGTdQnG+95EoeCyrkhMTGOupDChFCPoTpUCe5yL36ShzLSDMtMqoNvrz6j3YgYMNHB8d29qJ3d7jQjy56bW3O7j8D2WakHIuOKS2F69hZzujFC57+6I2N7PYAhBPdBMfqv0hXIXO3NSN+QEXTtBfVTStI92gpOvE4mTR/QEWEijpy3dAj5uFmPxZPCyizA3LjC6f5QUtW/HW2DJ7w7Zq6gEoPotvjYiHZ5aIF1GYgPd6qOYAkIqX4Vpu0MHzrknyrLdG0Ph7M9wr4xruQo6RUhD1P+ou2fn6Mz48vAMbaTJ03LdiE50TM1HCf2u3cKGVm13qTlXhjpFUqitcvt/GajYUqbOX3fQfGl3AnJR9JppNaIjVB0BbL+SHAgIFjedgMGk3sWr8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7402.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(11063799003)(3023799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6HnM1WZA8sRuf4xDmZWY2lgXHBv9JdOXyKIlZOjPD5SHMuHRqbNl1n3E9rrR?=
 =?us-ascii?Q?E3Xbqi28zbpxTNq0WB+asaK0Gjn59d7ySc20lh8Dg7jDpwGtT75WbXg/l0+l?=
 =?us-ascii?Q?Eyh6lHJwlpmnCyxe11hhuShR6Q8LQ7fcRhcljnIDAd3i+VzJQfT5uy+O/PhK?=
 =?us-ascii?Q?/N4lt+5YCEwSN3u2DioNojY+2AZ9eM1yXKue5MqFAXYLGcR3x5CTQdEniysQ?=
 =?us-ascii?Q?RIkw+k6wvsDG6f5WCzPCoruNLqxxkXkvl24WvJQMNAfQ7dGBNHkByL6zIXLn?=
 =?us-ascii?Q?ItMQPPyclzxGiWOW3GcwvUH7s8R2mzo16eK24ykcwwu70pt0+gVcjWrt4/XJ?=
 =?us-ascii?Q?uLMLmiJ5s7e3kSTm9n49LceeUaEcBN3MdtbJj2FBQkLCPNilnjsdK/Ja7IF8?=
 =?us-ascii?Q?ZAmqDznLg2NhezNYm9DoXAKcEe74ZmF1/38gO0+roA+cTFk0bEnG7cN7qqNp?=
 =?us-ascii?Q?CEnVry/nct2Bm4AEURufEQ/hEEVvGcnmmHPtAJ9msLDBdcU/hxpHmbIol0wA?=
 =?us-ascii?Q?Me2GvxTVQXpLDq1pXL2/v3J7PVbqA2lNwh/N6XzJGUaL3VvFaYC/Pac+f1vF?=
 =?us-ascii?Q?u3hoawWPgzVk3lbT7pM+knFfeH4johlYd0rKAiNPsrcHD83zCNh83pHJt/4z?=
 =?us-ascii?Q?us9qX0tmxsoJ9XREs45rgHUZXtJvjOU6cu0Xxp+83LzW9GgbTDwWVBho/Rx9?=
 =?us-ascii?Q?2v6E4Y2Hxe80iSo5t9ADroY9TJ5joFnPZUgPespcl/kyiUrAxybsG70qsb4a?=
 =?us-ascii?Q?5mGEVkqoZ9+OTdsKuxKIf0p7Q9nyrIF6nef4OydlTC1sYqX0/TwQbGNo7F+1?=
 =?us-ascii?Q?RLGiIIEC7TQniqmc6xMR9rE2LuVodYhY4GJoGDZCvfv9TPqQeoUmEcUmNah/?=
 =?us-ascii?Q?cFizlSeubuYInW69ywKLD8Qb0TcS0vLI3whqEiN7o7M5X4fuHmBx+uPgFji9?=
 =?us-ascii?Q?+joJcwg4onOWlzwBo5F94LOzOR3YodX/9R6Hf2CIVDJKvui4lvIpRkSpPUl1?=
 =?us-ascii?Q?TDpktMD9OS9udi3BhlGXOJ6Ejaakt++v+TicHZJB8fxHyVLE9yE8rBOs1vA7?=
 =?us-ascii?Q?LeRrLO5sPMYXa8d8WFCs2pAPyM2imtYWNkwR3GClRGYjjPY7+th5b3ajjyyg?=
 =?us-ascii?Q?dxwfh19Y+R1ngx2Q80k/rv7E3mzLJXC/vBW8P1kP+XNhKx1gLrqaw013pLSp?=
 =?us-ascii?Q?KqUi0luK6L8ZVAbwG9hu9BJXPyWqCwCcum7pUv5s+8HxnLlDqvoWxWdsyZ6C?=
 =?us-ascii?Q?/mhkyArDMy9uaTFGNjiAHxGRPRmc2SbPUbw/jwzSNU7LJKEwjMJnnBIAIUVM?=
 =?us-ascii?Q?af2OSKo4fmaXrs7l56254aQxRYgbFL4fhNcoVSJTv3CTbcZMfKGaCfuQWEfS?=
 =?us-ascii?Q?J54ZsAu0ZKCJQsmVFy/5wUe5NJMVkEgSGXYsDWaCjOsFv/ZCDpYEhz3eC9Qz?=
 =?us-ascii?Q?Nyx8L0u1ErZzXb+BKZ8yEf69hkT4IZLBXHzp1DQrU45f2ZDCg0O6DunfRLOz?=
 =?us-ascii?Q?jFa3qTRQbcNJrUxAmzoa0ua6tdd6NgmXprokRRyMIXwScQbJ/B3jjqeSAFHK?=
 =?us-ascii?Q?D5G39XaISSz1Q7TyafcrYj8sZMD2vCKM7Yq4VhlAWw148jx5iMyWxxc2+qvo?=
 =?us-ascii?Q?ePH4bWt7JTXL+IaUZ5vErB2ASPyRwwZn9iaMbd+MT4M8L4Cw8u82CzeEHm6p?=
 =?us-ascii?Q?2wIuxxi3R4Afls6Bhy42h2shp7olktsgh7j89kVhaJA+WbA0tFprMY8b7m11?=
 =?us-ascii?Q?t0zO96LuDA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9037bc7-8605-4cc6-16f6-08deb271622f
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7402.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 11:01:58.2286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: soLS30rTdCDeKEBqSFsIfkQ80PUVtI5p5ojmTzSk2vZgIUhXE0OmQNXSLcTYi2jPqNLHOWJlxdO0LgkcjmE1xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9806

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
Changes in v2:
- Explicitly include all the needed headers
- Change ds125df111_xlate() so that it returns an error if args_count is
not exactly 1
- Add a MAINTAINERS entry
---
 MAINTAINERS                     |   7 +
 drivers/phy/ti/Kconfig          |  10 ++
 drivers/phy/ti/Makefile         |   1 +
 drivers/phy/ti/phy-ds125df111.c | 252 ++++++++++++++++++++++++++++++++
 4 files changed, 270 insertions(+)
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
index 000000000000..084a94e655c2
--- /dev/null
+++ b/drivers/phy/ti/phy-ds125df111.c
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2026 NXP */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/i2c.h>
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

