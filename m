Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013015.outbound.protection.outlook.com [52.101.72.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C6C373C10;
	Sat, 16 May 2026 06:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778911400; cv=fail; b=g+HFdcDs/xw5Ezt08cGUH55B7SGeUnJnsQUZf/gC6NP3yto2C+3MpLuTFJFFvX7ML2m7gLoRxpVwF2KlbWUfWyjHWJciBBhEuiBqNcIrOVsx1Qha8c8SPAFojNYb8gyUcAvKbaI8ODHGwy+knFBzxVvCzRTWkcMAoUPUr/RA1P0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778911400; c=relaxed/simple;
	bh=B/VEdy2/V8SjZiPg7tyo5QeSGfWirdQmHUN6K4ziYPc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IWooNsbOTT1JbpKDvYWWhnf7rOM+Bhy7NoKg9Ex1ZynBBiK3kzsG5Od+97vMW4JnfduTGfqM11ld1qMU+buLLeBTy9MoDR67+TcJSlKfOMY4P7hPYLUCuV+dXr7+LchD7LmN+FmVkgA4KErVS3hUSgbKj37oXeWILHNpet0HjaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a95XMvdc; arc=fail smtp.client-ip=52.101.72.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a95XMvdc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ym3DVrQ8P4GkhLh08PHbT/flOFRpf6AIhGpl6oA5WUJMMsVPcafotUZSGTUqRsiWfAPlAvUxF2AQ5m6rbvNTVfK1VQWSd7eXhLjEePaphawA8MuUQJ8thcTh4bSQk//d5yBfR3dmMVhB8epw3pAcyTwR0ShOpMAgkXf6WzQ3HessLFiMn2emiyyKXRab8VC3XszYAXWQG1uZIozqPJbZcHQieCCK9oGunHuG6PljQRGm+kY5W3lTh/w47GYIIrbkzQeaAnATEa1y6k5Ai6qsHVITK7kpoCyVBPUZqi6OXfxMARDXmWqYqRIJ9tKJBCImGjfFAcb2F3f091XIoD9Mpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sinCsvPBkeeX8B8AEmIVRX/DivGKorKUsREcMSITzoE=;
 b=y03VUU2WKpSxTPB1ZtssbArAbxxa5M4oBgljPxTjS9vT/A1zcb6yvp1RQYm1eNHmHRQfxLL6RBy2ZXQDjnacvXkuCwdprROnaalF/YktRa/jzBu+gnkaQzrgJlMc99I7/ALqx+dzZtOPtky5LfUPd4bk+gx4XesRzdqojMmqDJ3hCA7M0VpAqQ3WcUND5vWhJaE3lb9uZ1R9GUJrd8S97cGqckJtxFxYxQpnpDoR9BSgwb4wuEPhJFLfmSsLi0YLkY+7KF+2rTwEOXanX9rUD4IZo8p4GKt3TKt+HbXH1260TEjGZdf7hQXv/bbTZQmvAdUjC929nixZ5LnCAh83Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sinCsvPBkeeX8B8AEmIVRX/DivGKorKUsREcMSITzoE=;
 b=a95XMvdc2nyjWB5F19+jEIHGIACuEJnBN8bDvPXjdILUqDoTdjOdawRyc9oZd6vqSak+h6uqXx0I3CubgbHeyujmRzyTUSKqDfkf80kfdJv5zL67tD4XiLb5Yl5gPZhyAazI+1YA5rZOmPpdvwvzKhJq1ADG8eYrHQTv2hTzC+AG6PIyIxTCBmjib/qT+D0KJ+E7oUMQJ7UYqcNqjMavd1iCjuYSxrmHHF0YbT9E0yOZvau+BYHyrmpP9Z+JuoUCeKL57H+lkSZvn2HlC4GjmjWHnUMGMOEOQPBDINTSfWx+k7Go6FLWT1jJx36+NeO2HAdVELODFOFsSa2322bXvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com (2603:10a6:102:89::16)
 by DU4PR04MB12347.eurprd04.prod.outlook.com (2603:10a6:10:62e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Sat, 16 May
 2026 06:03:17 +0000
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d]) by PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d%5]) with mapi id 15.20.9913.009; Sat, 16 May 2026
 06:03:17 +0000
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
Subject: [PATCH v3 phy-next 2/2] phy: ti: add PHY driver for TI DS125DF111 Dual-Channel Retimer
Date: Sat, 16 May 2026 09:03:09 +0300
Message-Id: <20260516060309.2282592-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260516060309.2282592-1-ioana.ciornei@nxp.com>
References: <20260516060309.2282592-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0341.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::16) To PR3PR04MB7402.eurprd04.prod.outlook.com
 (2603:10a6:102:89::16)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7402:EE_|DU4PR04MB12347:EE_
X-MS-Office365-Filtering-Correlation-Id: fca49f19-9c7d-4e57-ed6a-08deb310d2eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|18002099003|11063799003|3023799003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Z0efDHzvDtYObHTQoBiYJyj+0/4wG7T745z7i2VXzYe08GQ5ujGPcp29KK/HOqVp2w2xCt7Ik0E7YCvRspUhP7diK9IwG4e0DdVmcjcCf1o/JEOxO1tWRm3XIUJxnq6ayUIRmMrowBMhQF1lxaJMlDlyj0Z6GTA6wPYX+N3ooarV5d/KHvpKDnCj6S6q/HMF9E/y1xc6RqVwbJVh11a6rHlzrEdKLIe5VLf1iBNxzRr+i1/FpYUIkSY6zp0QI8sD7qGmWvncoECxVFJi2F3bQJ4Cm3+5N8Pq3mDNnO5UURmMRmao/raPwUjUAwzjGmf7EDl3Q+jGqJT6PDPqe5KT0PlZ3NVm0UR/tGWPD+yPv9P6xtMJD+8Cev3qQkfAnwOfs6cJg64hV4HlHqoQSe88AvW6BB05risOpDyTEMuGaCOQFzY4meALt+xXVOt/mxk2tO15IdaTxVrUNWtyV8eY7jaXXss50AN3WmwxmKgQ3qgyYHExn+d93G4U+z+F1UDUbJH2KH+SDCbeu9QXCuHK+FFMRHekov064OX/jbXc/wkwvftDYwXCdRWBdB9d15fUjA0/5aDfKpO7rlZP/v0pZfv7i8ySq4HXwguEDDTVRI8MMi6ebHBtm39G16ZAfEa1dmJMSdQDqF7hLdOdYzdLxk8FbnLRNlrM3Vfru4Njy1hCwtyKFyb49UQf7zPMwHFS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7402.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(18002099003)(11063799003)(3023799003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pYRFFvMN5N2fy9MUqobEh85ZTFztO3ofIiGDVBhNZQUhPtAPgj4assFADmLw?=
 =?us-ascii?Q?uUn9uUPEWK84uKlYioogV3Ud3IXwm2O52xD4Kpe7U+uW3NuZphcWtCBWfN//?=
 =?us-ascii?Q?lbS2AyrdgtYkmAydpLLyFvBL43tskAAONx/A3u1pLln2Kd23zGn/5YNxDR7E?=
 =?us-ascii?Q?igNmuYJlQX12ex8R9SBWkFEDBWpvaDpe2tNSQcY7edBK7eJmPVdB//tdXyvw?=
 =?us-ascii?Q?9fCtEf5navnnSDg0EfoXtpk5TU9VXvMoTbcs+AuvZZCqnsEffdQzY8JSINoL?=
 =?us-ascii?Q?hElfUXlOF6H6T/UidvQEwbPukmovOlNxvaM6CurmznLLp7ink4Lbsb+ziar5?=
 =?us-ascii?Q?A0oz3R7qmBYsIhSPv0JAdJTNLVDShMLs+orHOkCtPXjBzDOl0dxeNRbjbGY0?=
 =?us-ascii?Q?7PSwdVpvhSyTV0olYquXiY4tsfleiedez2tLBK87Pgkdq+lG3c5vvLQOGP17?=
 =?us-ascii?Q?8YXtyQJ2qKREPrX0L4APRXcgMq7Uzy1D90j8Jf58NYw3+L1ylRe0AHrTNeGv?=
 =?us-ascii?Q?OGEgpIxRx/H66zl02WFKbs507JNXZdmdhB7d05frTlaMjtntyt/gVThouXMn?=
 =?us-ascii?Q?ELrQlnDpJlDDuMWf5RIlPJ0jaThJd8ri3aROcwSI0vdX6Ex02PNik2DeWm0Q?=
 =?us-ascii?Q?vO+wmJxl98qWZs5z08bXefG6bC3fML9DWu+4/0IOHoIFg38PfuNr0g7hlbic?=
 =?us-ascii?Q?A1F9hF+xyJ+O2LRqWvd/S+biZ4NC4Ym8jWk1fD02SGH4IC/7tdG4G6wU5PHb?=
 =?us-ascii?Q?/A/hOdr5FMeypH68AYwM2Iw1yPzjwNJI82w2d6XaZHyJ56A2RvcIgR1jriTu?=
 =?us-ascii?Q?HaxTUH5dwPWOCMYWol+iOTMKbKpepEPvmDKToFz37KDqjyDWhyeJ1KtyGHzu?=
 =?us-ascii?Q?oL1Lux1ucd/xDXHMCKHeW9Iq0R9nmXH2MSzqKEUEwTdt9RuNufucg6d1JzvX?=
 =?us-ascii?Q?3M2baFPFyfisgqQoESnoh0zB4SkoSUpB5sjryE/VDSm4Idr/sBQxhDiS6O8S?=
 =?us-ascii?Q?clLn09n/tN24tGfaLjfH4SIwL1P9ibWstWIgFlczsVKQvp57TpkzotpC5tpU?=
 =?us-ascii?Q?KQErdH1J5AKkyzrpHmEIaaRAU23MsG9YoPnYRJ1P5N4HUfYNz4gmzhW6e7/s?=
 =?us-ascii?Q?o0r4P7MDjNxM0+R0Mv6qKo/jeL3OSqk76nehPKZw+Cb2NxLFj1nnM9Q7A6BJ?=
 =?us-ascii?Q?PmiLlX2iEnFG9cuvUyQe8VcJOW+NGkovkfaCPNMGksEN3TBjo+9zM3oszud7?=
 =?us-ascii?Q?Fp6jwaSmEvzLE7DMTEl5WjCgKyOQPQsaQRhC6ZZOUYu25H7Zhxa0mbOzSCnA?=
 =?us-ascii?Q?5DrCdiPbFzSjClBxozJ+q17FFuVzLnnHMAs4tdVIG7fpVy1nHb1EwkU1rwt/?=
 =?us-ascii?Q?dh80xPrsRqnsBSRaL7qw2d8dP141YFN79K84K1LzPUgSYRTiMK1kjzyDyKyb?=
 =?us-ascii?Q?Ev59v4L40QFke9neXo7tnADMGqwKBPm3GK8JLQdAvs5Q8k6oRqLO3PegdzXe?=
 =?us-ascii?Q?CthKmxansGj9+Pi2XdDdv46PRL0AAY6FWeMCsfzrbk7sFQBnwbIFKLfkBaAl?=
 =?us-ascii?Q?ofZje5sTA1gqbWOUS8JTyyLAZpgtvwdkJc9vOomvviwOIO4GEbbU8MJz0SWQ?=
 =?us-ascii?Q?nZ8tWPERtIRJrWw8twDa+Wq3OyA12hhecEYRL0zM7LtTrnyUWK1T7/GpH+cz?=
 =?us-ascii?Q?VzB/P3W5W8C3BxpGvKObziMjPzcqQSzp2jt36rLeVMBO4PbFEfD2FbKHqBr5?=
 =?us-ascii?Q?h4i5Mgeyfg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca49f19-9c7d-4e57-ed6a-08deb310d2eb
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7402.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2026 06:03:17.3501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTMcqLuMZlPj+j7tkLd8S8D713UIqY3PCLgLpuENxNzy8sdIu/7zl/UZTWFEEDFtiFwX2Swya5v8Yc/LOk+UJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12347

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
index 000000000000..8788f340e3b0
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
+#define DS125DF111_RATIOS			0x2F
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

