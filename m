Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013051.outbound.protection.outlook.com [40.107.162.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E563F58FF;
	Mon, 18 May 2026 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114074; cv=fail; b=gcvLaThZRccdM/Nj6N6pS3l92EEQdkzavDLUhUgV2am6GS1L1eqCGnBN7TPOgOhZVOhVlmUGPgaCnvxbFs5c3fo9pZlXUaXwkQ+3uc5kGHTY8Zmh/I4VRVhkXTaPX/V3SRTZ1wS3v99egM7U0Q7nSsW3R/m59TgjG/ay7+Do8j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114074; c=relaxed/simple;
	bh=NPOpUcqdVmftSrt4evHF7OBdBR4D4G17m1wSkq38YsQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l4tYsXc2kMfXHQHoHUZSF0jQx9nyrm9akXtQcfArREYiHkOMzZRZxnYE+ARBHP/BFrRi0cGJ68I2hLfwdDyVPU2plVOjOdNOGiT27OtpOOXZRlHI+Ongy4+2DRUxVripaoPQzWwxbg1OBv/7sfqMKxijwGjbX3zMiOn5+3xKBCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OTqzanOt; arc=fail smtp.client-ip=40.107.162.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OTqzanOt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aieestufdcl2ZUB8eMeqhmHV7HMhgyNdzz7GKR1Ark2/Wka+n0PvWO8pMvx4odvA3lwk5BIBDOk13+WkkxP4Y0tVcfhxc/jXss140MsUm2657nRDX6cSIFjKsbVG3ojmV70lf565LwMdKJ41IdfLyUpRAtsPgwQGoyevfG3BMp7XUqRPx6iru2hJMiYQi9Dn3yfRyCb1I+oWuF7aY6tI4PXuqNtaN7DzBw/BczjWdmQS920aBEy7wQlM2Jg3pXTfvYO+HDTxSbDF3T5FiVlcpB8RF5dkbMtaVvRrYUFTkO7ESs9QPBTp1pek07niWMYXu6RH+L61Xp3k9Arsxb1khA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAuJzBzuuqDSLklFQ6dEVc5lGCIBeNkMzONWTNDaitw=;
 b=C+QVKoVk/sf4OAwtlRoENk8Ine3rqoEZMk7UUAr6VgAxMlOK/M6z/DeRJuJyrI1YhebSI83KjRpEdq2o9xo9vheK/3yVy+ceQoStYWa+Kv+FkbSMadgNVQrLNCQIbumX+vC3FDgYOg4UFyp8Xvn3vBOqbyJ41iJaQKAAWxETRJb0C3jeaent8R5I1MFbqCN/lAUh7aQb6ETt89cDdN4ZXdFxrCMXwwgkOTSbxji8JCiII3E18NbS8RaYmqSySfbN5MbV0X1KDYW/8nCPflBHfPhYYtutVybLRoPZKqkyt71t72yzfz3p1pudqIR9qnsnvM9gBDhZY6luhCz4YDOa0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAuJzBzuuqDSLklFQ6dEVc5lGCIBeNkMzONWTNDaitw=;
 b=OTqzanOtt0cx4nxbYK0SgOLnDUttGAP8gfhjx0fzgyocEd8ajFU7kPmol5qjgm9RKtZYaeyT9/3XmVGdbN3FpkVpt3DPR/mNNQq0aKrDFt4Fy6sV6J0/5MtQlsTsLFXQmisK92+pmSc41MUfFOMYqv/N6Z3GlDJBwPU7R7XeX4a7PO/X/wNJ4DqFjuQsblzG7Ukc5HVSHtXb5L5Ap/mnRfBJ2h0TDsLBipO5uVLVI88fpAp4pzKII7vAF4C1CqFgSZmPBVdQK0sB6H8Io6FvbOmBgkJFq4K1WwexshsM8hHH29Gh+nYIXP7ZDnKQJB8rRor7W9vse7RfEDHylT2Lzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com (2603:10a6:102:89::16)
 by GV4PR04MB11793.eurprd04.prod.outlook.com (2603:10a6:150:2dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 14:20:48 +0000
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d]) by PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d%5]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 14:20:48 +0000
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
Subject: [PATCH v4 linux-phy 2/3] phy: ti: alphabetically sort Kconfig and Makefile
Date: Mon, 18 May 2026 17:20:25 +0300
Message-Id: <20260518142026.3098496-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518142026.3098496-1-ioana.ciornei@nxp.com>
References: <20260518142026.3098496-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0017.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::7) To PR3PR04MB7402.eurprd04.prod.outlook.com
 (2603:10a6:102:89::16)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7402:EE_|GV4PR04MB11793:EE_
X-MS-Office365-Filtering-Correlation-Id: df91766a-74e0-454d-ee4a-08deb4e8a89e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xM6a0ooLyeuY2sr/Gwa9INVZEHuhMbzItZ/AeaQcEjYv9TnBF73W8DYanFe+I6dztzOEFGQY6V5Uk+9/IOvadURemSR9aFvAm4RA9nD0170Z5UHz4lu1JdvSI6DAvdj54x9ylU5YFtgT40maLs83afqzT7OS4a3Ml+ghioHQtnHOojqqRSIqdNFjNRZxCuJvFx/9rSKJiKdlMcVka7YX6aSeOEWl3pW73v9R7Jx705bzA38Ig7XnTCaDmWAROjIjFzfqMO+frb2HXJpuMdsf0B8tC7Nwrvz75FTjL/sjVXvABakTghy2/1NgfTKQtn9MaZEuSkOZA6zfMp9FNvsX/JDbYvMLfZoHOWOzjIFJp/rxzDQChY5Io5xr1nrlprykfFPCPvuhCuQPUkJ+APnctvPlhsz5mUUjSI8LgZoXCijXT5U3gpKtDtdKmzDTGHAApzZXHUPCmdhXuIvCE+B66May/Erw+nLEuMn6WAf3syc4FrEEWs08jCSCJ2/gGn5yHUiwebeSo4ZRodUYcVvgLCJVFMdm/bivqV6gSCiX7kyX27Yi4FdJ12zkUBsmkwqC+blUTuCr/t1pTWFX22/ytub++s2D1L/kniqFbtPYadx5Jli58Jlasf2fNUmVsShZYrm7TBKIbPbIQ3+9veJSDW25tlP6J35WMdlbBO9CfmhOMEYqtIbH57cWnK7c/WWn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7402.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(11063799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CaZDr12Ro4JzO+2AF849AYhrcu4yKBQJSLHN285kPMQfWwBYu0zQk/xg/m5N?=
 =?us-ascii?Q?3fh985atiricGLB8Cy5MdWVQsZsCqWhEK/Ot47ETfx7lWykLXtNKE+KTetqI?=
 =?us-ascii?Q?xuITBRBwSE0vPLfn1El3QNBfK2fjA/oO6vPpfAN3HHBQ9Wj1JsTy8BR0OVnz?=
 =?us-ascii?Q?lQcDRzV6Q2taHoHj2m54eYPstZrN+qeDHh3LWq4guX6TR6MajZFIos2ngPcR?=
 =?us-ascii?Q?5gldHR60x1h4Yh2jjW9HFazIODN+eRgjmR9zPjGYM9z2qPTYD3ibvovoLCHT?=
 =?us-ascii?Q?sOzsjWQA4Rv7IKm4SFaQ7h7NyC/vRgIQr9zbqN/VRG1WMQdEU9CS9R4gSxM8?=
 =?us-ascii?Q?rzOTVoIif9RNcigOhJ+Rmlkq5noNHwnxUc/L0lBennn9PAyokierNnDxK9f0?=
 =?us-ascii?Q?KmZhgYtEX+DBc2DdQ5qLAGLzgUCNqWl02eM9oYYQL4jBNz6ikcIC4FtSpPuF?=
 =?us-ascii?Q?3KfPUAzCkkGsxl43JxpCW9tirbKijevtPX0NQiA8sIEWLvKT1aEOPY/0IJ6f?=
 =?us-ascii?Q?MyYNm6FXTGh04fXXupbrvfO/GNB0lwtDCd+IHBvWXIg8jWxazlPuQHchA8ZC?=
 =?us-ascii?Q?Qz2gWi/FATWWyDEMa3SI2ZQTFgd256np28iKgng3NISg0/YCOVVAWVg/C8ie?=
 =?us-ascii?Q?X1BAaL5VLR1w5Z0QnAWS1xTnqV5HthKfrKbF6bi32T7uLyBoFhkKpoTO6x9v?=
 =?us-ascii?Q?ECbt9gy9UN3U40S5SmYuCYbYcMnaWDmA1fHAir/y0QjkiNTv4D0J5uWjHULv?=
 =?us-ascii?Q?kuKEaKpwBcrZ8nxcv4XU+E+5y1gZ6HLbIBongDUA7LWXQ67aQ8x0gDe00NJp?=
 =?us-ascii?Q?0X5yBK+TNvTZNvnO/Mh09vtKMQSgZ/vbeeGlWO+V31ZO1dZctyMQvh3bfgkj?=
 =?us-ascii?Q?JCgKFwLv+xiTQUpC3kZG9GKqi5Es8OXCMS9L3U3xXcRDDf2LaEMHsA7phObc?=
 =?us-ascii?Q?IUdoiKjlypdG/enST9l569z+VvSWOqSWxQ7ELNwVRZ0+IL57ZwwD3LapfTLw?=
 =?us-ascii?Q?DJKhobRXjn1phQvfy6AAiZlnf82vVdUb5uH28xqUMoCQfJFiRlxm/trNFsOF?=
 =?us-ascii?Q?vy2lLDuei+CgAkEF8/mU20dSkTKimLyYzejFGKsGd+t+QrvKeTnc1Z5YQ6JU?=
 =?us-ascii?Q?4y/mm00g77uG8dR76m9912cnAHJf3jwCPFUOqtsdVxBOfH5d/mbtZFITpuRA?=
 =?us-ascii?Q?L0C4jMZ/vZNkBp/8CH2flVifuAThTfDXxKfyfngCC2NvKYqmoHLtUXcsvh4Z?=
 =?us-ascii?Q?jBI7n+bmzF0DpEo2w7fSwKdDhfOHLzawzEvAmSmcAaLWoVTeeHzrDBqNpoNx?=
 =?us-ascii?Q?1JYGvxqJb6qFNHAoiJP7bkzBcepmCcZ1LfcqokV+bRtP6wxedviicYX8vpWt?=
 =?us-ascii?Q?mkhzItnG27+SVhYMmLypnLNlzShZbv/SVivlQl6H26BmTORFVoNETT87jqFx?=
 =?us-ascii?Q?+j2mvWJiuNn3ozlQjYyoVJD+deFMVZ6K/tpAUQlfA2aZMLWYMZDRhr3vQV1Q?=
 =?us-ascii?Q?ghKfMe3qC6EFFQcRmiUvze8Qi7oRl5fmh9LYQuKJ6causR5TjuTcU18vWDho?=
 =?us-ascii?Q?YpBh1l/zNwMZR8a05KW9fL6By1prMdXKGD+EHzEqHkucYN/zg4vIPgRIIOS2?=
 =?us-ascii?Q?eDqV5b+IXc7MPhoT272DXhXpgLHKrIA56NcZZi+ls5yCwSlt8J6JvNgVME4M?=
 =?us-ascii?Q?bqPqQc6I3OUpI1KMSMGtiV3HSzOb0DDTLTf8IssKeDJiVRHylUqBuNapRBi1?=
 =?us-ascii?Q?tg0Qf3PGkQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df91766a-74e0-454d-ee4a-08deb4e8a89e
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7402.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 14:20:48.8550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4GEIHymWchKQEu/luRmiExk7W6HF2w/pP4yPdLrmhbM9y1JrwdhC9Cxt9t8qCvz/XQ/8gJmD3hhCmDEnSBNVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11793

Sort alphabetically the entries in the Kconfig and Makefile files.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v4:
- patch is new
---
 drivers/phy/ti/Kconfig  | 92 ++++++++++++++++++++---------------------
 drivers/phy/ti/Makefile | 12 +++---
 2 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/drivers/phy/ti/Kconfig b/drivers/phy/ti/Kconfig
index b40f28019131..dbe65500f20c 100644
--- a/drivers/phy/ti/Kconfig
+++ b/drivers/phy/ti/Kconfig
@@ -2,24 +2,29 @@
 #
 # Phy drivers for TI platforms
 #
-config PHY_DA8XX_USB
-	tristate "TI DA8xx USB PHY Driver"
-	depends on ARCH_DAVINCI_DA8XX || COMPILE_TEST
-	select GENERIC_PHY
-	select MFD_SYSCON
+config OMAP_CONTROL_PHY
+	tristate "OMAP CONTROL PHY Driver"
+	depends on ARCH_OMAP2PLUS || COMPILE_TEST
 	help
-	  Enable this to support the USB PHY on DA8xx SoCs.
-
-	  This driver controls both the USB 1.1 PHY and the USB 2.0 PHY.
+	  Enable this to add support for the PHY part present in the control
+	  module. This driver has API to power on the USB2 PHY and to write to
+	  the mailbox. The mailbox is present only in omap4 and the register to
+	  power on the USB2 PHY is present in OMAP4 and OMAP5. OMAP5 has an
+	  additional register to power on USB3 PHY/SATA PHY/PCIE PHY
+	  (PIPE3 PHY).
 
-config PHY_DM816X_USB
-	tristate "TI dm816x USB PHY driver"
-	depends on ARCH_OMAP2PLUS || COMPILE_TEST
+config OMAP_USB2
+	tristate "OMAP USB2 PHY Driver"
+	depends on ARCH_OMAP2PLUS || ARCH_K3 || COMPILE_TEST
 	depends on USB_SUPPORT
 	select GENERIC_PHY
 	select USB_PHY
+	select OMAP_CONTROL_PHY if ARCH_OMAP2PLUS || COMPILE_TEST
 	help
-	  Enable this for dm816x USB to work.
+	  Enable this to support the transceiver that is part of SOC. This
+	  driver takes care of all the PHY functionality apart from comparator.
+	  The USB OTG controller communicates with the comparator using this
+	  driver.
 
 config PHY_AM654_SERDES
 	tristate "TI AM654 SERDES support"
@@ -33,6 +38,25 @@ config PHY_AM654_SERDES
 	  This option enables support for TI AM654 SerDes PHY used for
 	  PCIe.
 
+config PHY_DA8XX_USB
+	tristate "TI DA8xx USB PHY Driver"
+	depends on ARCH_DAVINCI_DA8XX || COMPILE_TEST
+	select GENERIC_PHY
+	select MFD_SYSCON
+	help
+	  Enable this to support the USB PHY on DA8xx SoCs.
+
+	  This driver controls both the USB 1.1 PHY and the USB 2.0 PHY.
+
+config PHY_DM816X_USB
+	tristate "TI dm816x USB PHY driver"
+	depends on ARCH_OMAP2PLUS || COMPILE_TEST
+	depends on USB_SUPPORT
+	select GENERIC_PHY
+	select USB_PHY
+	help
+	  Enable this for dm816x USB to work.
+
 config PHY_J721E_WIZ
 	tristate "TI J721E WIZ (SERDES Wrapper) support"
 	depends on OF && (ARCH_K3 || COMPILE_TEST)
@@ -49,29 +73,20 @@ config PHY_J721E_WIZ
 	  three clock selects (pll0, pll1, dig) and resets for each of the
 	  lanes.
 
-config OMAP_CONTROL_PHY
-	tristate "OMAP CONTROL PHY Driver"
-	depends on ARCH_OMAP2PLUS || COMPILE_TEST
+config PHY_TI_GMII_SEL
+	tristate
+	select GENERIC_PHY
+	select REGMAP
 	help
-	  Enable this to add support for the PHY part present in the control
-	  module. This driver has API to power on the USB2 PHY and to write to
-	  the mailbox. The mailbox is present only in omap4 and the register to
-	  power on the USB2 PHY is present in OMAP4 and OMAP5. OMAP5 has an
-	  additional register to power on USB3 PHY/SATA PHY/PCIE PHY
-	  (PIPE3 PHY).
+	  This driver supports configuring of the TI CPSW Port mode depending on
+	  the Ethernet PHY connected to the CPSW Port.
 
-config OMAP_USB2
-	tristate "OMAP USB2 PHY Driver"
-	depends on ARCH_OMAP2PLUS || ARCH_K3 || COMPILE_TEST
-	depends on USB_SUPPORT
+config PHY_TUSB1210
+	tristate "TI TUSB1210 ULPI PHY module"
+	depends on USB_ULPI_BUS
 	select GENERIC_PHY
-	select USB_PHY
-	select OMAP_CONTROL_PHY if ARCH_OMAP2PLUS || COMPILE_TEST
 	help
-	  Enable this to support the transceiver that is part of SOC. This
-	  driver takes care of all the PHY functionality apart from comparator.
-	  The USB OTG controller communicates with the comparator using this
-	  driver.
+	  Support for TI TUSB1210 USB ULPI PHY.
 
 config TI_PIPE3
 	tristate "TI PIPE3 PHY Driver"
@@ -84,13 +99,6 @@ config TI_PIPE3
 	  This driver interacts with the "OMAP Control PHY Driver" to power
 	  on/off the PHY.
 
-config PHY_TUSB1210
-	tristate "TI TUSB1210 ULPI PHY module"
-	depends on USB_ULPI_BUS
-	select GENERIC_PHY
-	help
-	  Support for TI TUSB1210 USB ULPI PHY.
-
 config TWL4030_USB
 	tristate "TWL4030 USB Transceiver Driver"
 	depends on TWL4030_CORE && REGULATOR_TWL4030 && USB_MUSB_OMAP2PLUS
@@ -103,11 +111,3 @@ config TWL4030_USB
 	  family chips (including the TWL5030 and TPS659x0 devices).
 	  This transceiver supports high and full speed devices plus,
 	  in host mode, low speed.
-
-config PHY_TI_GMII_SEL
-	tristate
-	select GENERIC_PHY
-	select REGMAP
-	help
-	  This driver supports configuring of the TI CPSW Port mode depending on
-	  the Ethernet PHY connected to the CPSW Port.
diff --git a/drivers/phy/ti/Makefile b/drivers/phy/ti/Makefile
index dcba2571c9bd..975fb8448ba5 100644
--- a/drivers/phy/ti/Makefile
+++ b/drivers/phy/ti/Makefile
@@ -1,11 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_PHY_DA8XX_USB)		+= phy-da8xx-usb.o
-obj-$(CONFIG_PHY_DM816X_USB)		+= phy-dm816x-usb.o
 obj-$(CONFIG_OMAP_CONTROL_PHY)		+= phy-omap-control.o
 obj-$(CONFIG_OMAP_USB2)			+= phy-omap-usb2.o
-obj-$(CONFIG_TI_PIPE3)			+= phy-ti-pipe3.o
-obj-$(CONFIG_PHY_TUSB1210)		+= phy-tusb1210.o
-obj-$(CONFIG_TWL4030_USB)		+= phy-twl4030-usb.o
 obj-$(CONFIG_PHY_AM654_SERDES)		+= phy-am654-serdes.o
-obj-$(CONFIG_PHY_TI_GMII_SEL)		+= phy-gmii-sel.o
+obj-$(CONFIG_PHY_DA8XX_USB)		+= phy-da8xx-usb.o
+obj-$(CONFIG_PHY_DM816X_USB)		+= phy-dm816x-usb.o
 obj-$(CONFIG_PHY_J721E_WIZ)		+= phy-j721e-wiz.o
+obj-$(CONFIG_PHY_TI_GMII_SEL)		+= phy-gmii-sel.o
+obj-$(CONFIG_PHY_TUSB1210)		+= phy-tusb1210.o
+obj-$(CONFIG_TI_PIPE3)			+= phy-ti-pipe3.o
+obj-$(CONFIG_TWL4030_USB)		+= phy-twl4030-usb.o
-- 
2.25.1

