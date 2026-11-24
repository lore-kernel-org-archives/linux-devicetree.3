Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538905;
	b=HV9ws9+WYoQPJmiXreTtuKBPcYIoTSu2r1zkW1UFVHhRoXCCV2Y96QQk7ee23bRPG/KI
	 QeyQH5k11LEQuKh4d/yd2pOLK05gmvCItrVMSLnnpaaf61c9oF304Q3hCwTiqMdvh5s1D
	 VcjnPoMrL2PTpc6nL/GGakoix15Zo5/tdMZ9U0zPZHBH4V60VPqdpTH4jhlMhSnD0VwiE
	 Tso0yXmg/ouqgJsgCBd/Vo+fgcLIdeLR4Cma9OwtHWQslUYVSo7N/iqhtozUEYjxmVSss
	 mxZNCru4Dl2jMRT4nsB9ACIFE/k87r4A0zuW5CbuGnP4GVumHFRGzaE4zy6ak1BUc6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538905;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ZoleSdlbXnOVeVfILP+/m90nXCpgRAwyuSmyptZWeqk=;
	b=ABUE8hpfuHI9iuXhrEenKsc8pZJ1J4S2GkB2iGhZ6E9YANour7v7dUdWDh21MlTSwSqN
	 PVs1H1i+pieQ/86CtRyJT/JhCdp04zHiUs54YBwP+tq/XlLW7EcCqeLIR2Ly3k2cFiC8R
	 XiH25maBYS4bSn2/xvR/Xu7zaWVQaqcyP7jfIlkXq76lLnWpRIDplxY+kKQEK7dhNUsD3
	 /WTNWS+k17dXStpW5Y0R87NRa5JCoUV5taRNWpOvCeY2+zwqUg3/oyoCYEJjtyX03Scux
	 zncMoiPq9YAYESKp698/KvPa10WWU4HE/+/eKhXvYd1R5agh1/qa41+GQL+Y48ZD0Mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=bnmr9Xqf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.33
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2036D606A32A;
	Tue, 24 Nov 2026 16:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2036D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=bnmr9Xqf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELlp6oz0WQajvvkdSV5plsg/qOvzRrHIktf/mZVau+yglG4Rc0sensRiYbb1jCKSggXp1fV+lWojyf4HLMTT8wDIuYwti4h9hg3f9rU6vTd4DNL0JioPGnDGgCXgF9pEA+XJ1eMaaUjiVt/BpwmTLVJhX6nw9d0uAIo3twm4I0M7ZAV5qYJoC4lyZyVjAQ5uzFS1yfNO0lKPyxo6sR94KDWMv1hRBsq7IKHQT4cSCHJioRB+pSD177jTTtcGHTwAAUiiVZTi2A6o85H77bbYu0054C7p7F04GwrRDOeDoH3sImz9l/6kTXbZntlVd8iEmxjcxzol2137lbRjOu9mmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoleSdlbXnOVeVfILP+/m90nXCpgRAwyuSmyptZWeqk=;
 b=b2VQMZDbqNfcvMxsvCO3XZSpxqyWqXtAfReF4XkwsuVYM3yeQ8TKVXrrtVQaaLSIZ79mztF7BroJlR+rP7lZu+GkTtzuLqUhRtMdbCxwcGfw3OKPy8feLU8ARN9siqH/Ev8OBqmSqAAnFyzf6Rx7YW3POflRxdQxzZ9KKfhI8p4mbH7hJAmODm+vgGe+Kt/rhQeFdjBq4IgY5C479OGpcCrmCGc+hAVTVhXMbF3n3pkIz4skvpoibvvrforyZKt1gbPxBVSJ9O04dJl8ieqGDAHJUYkWsJ+CZAX1aCV21D296x2rAn1TqNzdBCTzqtmE0JBMVgjvSGTkiGKupBuetw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoleSdlbXnOVeVfILP+/m90nXCpgRAwyuSmyptZWeqk=;
 b=bnmr9XqfUVdoj1rOzg5Gm/51Eg3voYOlKJqPbiAAlRQcDa12Ual1iZi2H/v13kdWAYeY14T2xF6fepa8HM6oATMvG7XPaKqCSfDZr9HiaCmSQLzdV2ZgudZeIeT745ifnYtOdPaELku/c1JO2ktOlwqdJ8tJxEpQz9lFLshzKlA100I1/PV0vme3xhPN+fV2frjFmiUIcKd0kXCEyonFtdqCP10SSeQzIJwZSWzG/w7nRcqhi1SQrJ6HEWzLkYhqy5G+rvUw9nV0Oz/QohGpyXHkk+RAiVRNznNeiFtPzczou4m6Z7uLOW8veJzh92QmnB0fKdb/dgujgc9cSQDwTA==
Received: from DU2P250CA0021.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::26)
 by PAXSPRMB0038.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2c2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 24 Nov
 2026 16:48:13 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::41) by DU2P250CA0021.outlook.office365.com
 (2603:10a6:10:231::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 16:48:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 16:48:12 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:48:43 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:47:41 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 24 Nov 2026 17:47:36 +0100
Subject: [PATCH v6 03/10] nvmem: stm32: add TAMP nvmem driver
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261124-upstream_nvram_reworked-v6-3-ea0cfccc20b0@foss.st.com>
References: <20261124-upstream_nvram_reworked-v6-0-ea0cfccc20b0@foss.st.com>
In-Reply-To: <20261124-upstream_nvram_reworked-v6-0-ea0cfccc20b0@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>, Russell King <linux@armlinux.org.uk>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>, Gatien Chevallier
	<gatien.chevallier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|PAXSPRMB0038:EE_
X-MS-Office365-Filtering-Correlation-Id: 329e591e-6589-4141-7c67-08df4a4aba93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|7416014|36860700016|1800799024|18002099003|6133799003|22082099003|261009223027099003|261026140227099003|261028144727099003|261022075727099003|261021135927099003|261026121527099003|10067099003|261022105027099003|261021121427099003|11063799006|56012099006|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	lMbr2gdVhGAp0hSL8wVT/4wRY/SjOjnA2UyKWqlHB4ZmQ+Wc6oyInv25DBs8BS6+aX6fy5fTwT5uDuN6YeJgDbAzBmsyMJo5YlVGX4fbo+B4B3+yQJA6XAuR4c7Xj4jpGZCs0JisIIvjtGdrSlX0/YGh2LdaWdhJ5xDS7fQLtGGurXPgiOSKSet52oO+EO14LLzgtjsh0lAVNydzmCQazru1sUBrz994ahuv8S9X19YsjM3KTlHC73ipyFJAKrOo39ZoUqQHo9xifNPP066Cls0mgdrSyO8CYiZmPjfog1GAwdevSwim+CJzBwNzsuliQbIdu5hv5/FbreocZAP4+b9iXRbpqyS1AcgqZwX2dXI2mSm3yl+Rz1pUwumj+rgb4EPD4mB/fq/ej9ZuRRvHiTSXvKnurCJv3FG4G9kiDDTxfutL+Q95XkQl2fh5LBluv+t9Zm/cYTbKYpmhexQedc8gBOYup0CYlOczoJag52IS8qYUVp0DSgexszbSFUaVMvmlgbBBpaUntGGrg7O+oSUwyOXrIv7qXxHOOrATt5yVz/dcJXomEl67G0iQVMVo/sV3NykNH03tsykdYkVpq3BAC1knU4F+QTidJNJY+/8nnWW8nVtpjJ9wn83On0js26DeEbOTy7Pjq7Jwy5JpHRkL2ZiB3Lybj8IAWxe9gTcEr/nJ8E6wrIVp4I+GdrAFtzj1G5n/L0rqjaxzvLwSRw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(7416014)(36860700016)(1800799024)(18002099003)(6133799003)(22082099003)(261009223027099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021135927099003)(261026121527099003)(10067099003)(261022105027099003)(261021121427099003)(11063799006)(56012099006)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l3geO8HKQfnTAsoYte8bhnPCb28PYgHPJtinvPEPZzMFbCfXNnf7HqnCakI2Ml+EDhte6H80DXMsY5YnRtYTI90gCKKjXc+kJvtioAq866AdikQKgR3w0syfOcjbnkIM/HANI7IVAZON7D2avg2IHW4ONUPmpAzOwhMwtjYEE2ipRnMnM1/X70MY25aLLWqpz9Yz+2MsiaCd6LKMRMe9a3CZH1WeHnCT65HT8wneUgl23EbxK8BLP7YSYoHcBtMW+7h1wjG2oeL7AdkHRCuEVk6fMLKyK3VnkTKY0CJyzn20IzZ8RvLyzydjwDWq61CJq1CFxcYA1iOvSyWK0vJRPm8Gs6RnoqkytphrowPO7jou/0trXKqBa7qBMnyFAxFj8UChm6f/CjQ4AAww4Yp8aa0axfaNbgCoptMdAJ8owWjujKwrAU3UKM7cndo3aah3
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:48:12.7033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 329e591e-6589-4141-7c67-08df4a4aba93
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXSPRMB0038

From: Simeon Marijon <simeon.marijon@foss.st.com>

TAMP backup registers will be exposed as nvmem cells.

Each registers ([0..127] for STM32MP2, [0..31] for STM32MP1) could be
exposed as nvmem cells under the nvram node in device tree.

Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 MAINTAINERS                      |   1 +
 drivers/nvmem/Kconfig            |  11 +
 drivers/nvmem/Makefile           |   2 +
 drivers/nvmem/stm32-tamp-nvram.c | 680 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 694 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 13f5c94b0bf8..eb7b9f746be6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26924,6 +26924,7 @@ M:	Patrice Chotard <patrice.chotard@foss.st.com>
 L:	linux-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
+F:	drivers/nvmem/stm32-tamp-nvram.c
 
 STM32 TIMER/LPTIMER DRIVERS
 M:	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d2f5bb236663..a0675f89015c 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -516,6 +516,17 @@ config NVMEM_STM32_ROMEM
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-stm32-romem.
 
+config NVMEM_STM32_TAMP
+	tristate "STMicroelectronics STM32 TAMP backup registers support"
+	depends on ARCH_STM32 || COMPILE_TEST
+	select MFD_SYSCON
+	help
+	  Say y here to enable access for STMicroelectronics STM32
+	  TAMP backup registers.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nvmem_stm32_tamp_nvram.
+
 config NVMEM_SUNPLUS_OCOTP
 	tristate "Sunplus SoC OTP support"
 	depends on SOC_SP7021 || COMPILE_TEST
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5e70bad9f0f9..73ec68e53556 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -88,6 +88,8 @@ nvmem_sprd_efuse-y			:= sprd-efuse.o
 obj-$(CONFIG_NVMEM_STM32_ROMEM)		+= nvmem_stm32_romem.o
 nvmem_stm32_romem-y 			:= stm32-romem.o
 nvmem_stm32_romem-$(CONFIG_NVMEM_STM32_BSEC_OPTEE_TA) += stm32-bsec-optee-ta.o
+obj-$(CONFIG_NVMEM_STM32_TAMP)		+= nvmem_stm32_tamp_nvram.o
+nvmem_stm32_tamp_nvram-y 		:= stm32-tamp-nvram.o
 obj-$(CONFIG_NVMEM_SUNPLUS_OCOTP)	+= nvmem_sunplus_ocotp.o
 nvmem_sunplus_ocotp-y			:= sunplus-ocotp.o
 obj-$(CONFIG_NVMEM_SUNXI_SID)		+= nvmem_sunxi_sid.o
diff --git a/drivers/nvmem/stm32-tamp-nvram.c b/drivers/nvmem/stm32-tamp-nvram.c
new file mode 100644
index 000000000000..81096a5d0282
--- /dev/null
+++ b/drivers/nvmem/stm32-tamp-nvram.c
@@ -0,0 +1,680 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * STM32 Tamp backup registers access driver
+ *
+ * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
+ * Author: Simeon Marijon <simeon.marijon@foss.st.com> for STMicroelectronics.
+ */
+
+#include <linux/align.h>
+#include <linux/bits.h>
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+
+#define RIF_CID1			0x1
+#define CURRENT_CID			RIF_CID1
+#define NB_ZONES_STM32MP1		3
+#define NB_ZONES_STM32MP2		7
+#define NB_REGS_STM32MP1		32
+#define NB_REGS_STM32MP2		128
+
+#define _TAMP_SECCFGR			0x20U
+#define _TAMP_BKPRIFR(x)		(0x70U + 0x4U * ((x) - 1))
+#define _TAMP_RXCIDCFGR(x)		(0x80U + 0x4U * ((x)))
+
+#define BKPREG_PROTECTION_ZONE_1	0
+#define BKPREG_PROTECTION_ZONE_2	1
+#define BKPREG_PROTECTION_ZONE_3	2
+
+#define BKPREG_PROTECTION_ZONE_1_RIF1	0
+#define BKPREG_PROTECTION_ZONE_1_RIF2	1
+#define BKPREG_PROTECTION_ZONE_2_RIF1	2
+#define BKPREG_PROTECTION_ZONE_2_RIF2	3
+#define BKPREG_PROTECTION_ZONE_3_RIF1	4
+#define BKPREG_PROTECTION_ZONE_3_RIF0	5
+#define BKPREG_PROTECTION_ZONE_3_RIF2	6
+#define NB_COMPARTMENT_STM32MP2		3
+
+enum stm32_tamp_bkpreg_access {
+	BKP_READ_WRITE,
+	BKP_READ,
+	BKP_NO
+};
+
+struct stm32_tamp_nvram_priv {
+	struct nvmem_config cfg;
+	const struct stm32_tamp_nvram_plat *data;
+	int *idx_bkpreg_zones_end;
+	struct device *dev;
+	struct regmap *config_regmap;
+	struct regmap *bkpregs_regmap;
+	unsigned int bkpregs_offset;
+	enum stm32_tamp_bkpreg_access *bkpreg_access;
+};
+
+struct stm32_tamp_nvram_plat {
+	const unsigned int nb_zones;
+	const unsigned int nb_regs;
+	const struct reg_field *config_reg_fields;
+};
+
+static const struct reg_field stm32mp1_tamp_nvram_zone_cfg_fields[NB_ZONES_STM32MP1 - 1] = {
+	[BKPREG_PROTECTION_ZONE_1] = REG_FIELD(_TAMP_SECCFGR, 0, 7),
+	[BKPREG_PROTECTION_ZONE_2] = REG_FIELD(_TAMP_SECCFGR, 16, 23),
+};
+
+static const struct reg_field stm32mp25_tamp_nvram_zone_cfg_fields[NB_ZONES_STM32MP2 - 1] = {
+	[BKPREG_PROTECTION_ZONE_1_RIF1] = REG_FIELD(_TAMP_BKPRIFR(1), 0,  7),
+	[BKPREG_PROTECTION_ZONE_1_RIF2] = REG_FIELD(_TAMP_SECCFGR,    0,  7),
+	[BKPREG_PROTECTION_ZONE_2_RIF1] = REG_FIELD(_TAMP_BKPRIFR(2), 0,  7),
+	[BKPREG_PROTECTION_ZONE_2_RIF2] = REG_FIELD(_TAMP_SECCFGR,   16, 23),
+	[BKPREG_PROTECTION_ZONE_3_RIF1] = REG_FIELD(_TAMP_BKPRIFR(3), 0,  7),
+	[BKPREG_PROTECTION_ZONE_3_RIF0] = REG_FIELD(_TAMP_BKPRIFR(3), 16, 23),
+};
+
+static const struct reg_field stm32mp25_tamp_nvram_rxcidcfg_cfen_fields[NB_COMPARTMENT_STM32MP2] = {
+	REG_FIELD(_TAMP_RXCIDCFGR(0), 0, 0),
+	REG_FIELD(_TAMP_RXCIDCFGR(1), 0, 0),
+	REG_FIELD(_TAMP_RXCIDCFGR(2), 0, 0),
+};
+
+static const struct reg_field stm32mp25_tamp_nvram_rxcidcfg_fields[NB_COMPARTMENT_STM32MP2] = {
+	REG_FIELD(_TAMP_RXCIDCFGR(0), 4, 6),
+	REG_FIELD(_TAMP_RXCIDCFGR(1), 4, 6),
+	REG_FIELD(_TAMP_RXCIDCFGR(2), 4, 6),
+};
+
+static enum stm32_tamp_bkpreg_access stm32mp1_tamp_bkpreg_access[NB_ZONES_STM32MP1] = {
+	[BKPREG_PROTECTION_ZONE_1] = BKP_NO,
+	[BKPREG_PROTECTION_ZONE_2] = BKP_READ,
+	[BKPREG_PROTECTION_ZONE_3] = BKP_READ_WRITE,
+};
+
+static int stm32_tamp_is_compartment_isolation_enabled_mp2x(struct stm32_tamp_nvram_priv *priv)
+{
+	int nb_compartment_enabled = 0;
+	struct device *dev = priv->dev;
+	u32 cfen;
+	struct regmap_field *cfen_field;
+
+	for (int i = 0; i < NB_COMPARTMENT_STM32MP2; i++) {
+		cfen_field = devm_regmap_field_alloc(dev,
+						     priv->config_regmap,
+						     stm32mp25_tamp_nvram_rxcidcfg_cfen_fields[i]);
+		if (IS_ERR(cfen_field)) {
+			dev_err(dev, "Can't allocate field for reading configuration\n");
+			return PTR_ERR(cfen_field);
+		}
+
+		if (regmap_field_read(cfen_field, &cfen)) {
+			dev_err(dev, "Can't read field for registers zones\n");
+			devm_regmap_field_free(dev, cfen_field);
+			return -EINVAL;
+		}
+
+		nb_compartment_enabled += cfen;
+		devm_regmap_field_free(dev, cfen_field);
+	}
+
+	if (!nb_compartment_enabled)
+		return 0;
+	else if (nb_compartment_enabled == NB_COMPARTMENT_STM32MP2)
+		return 1;
+	else
+		return -EINVAL;
+}
+
+static bool *stm32_tamp_get_compartment_owner_mp2x(struct stm32_tamp_nvram_priv *priv)
+{
+	struct device *dev = priv->dev;
+	struct regmap_field *cid_field;
+	u32 cid_per_zone;
+	int isolation_enabled;
+	bool *compartment_owner;
+
+	isolation_enabled = stm32_tamp_is_compartment_isolation_enabled_mp2x(priv);
+	if (isolation_enabled < 0)
+		return ERR_PTR(-EINVAL);
+
+	compartment_owner = kcalloc(NB_COMPARTMENT_STM32MP2,
+				    sizeof(*compartment_owner),
+				    GFP_KERNEL);
+
+	if (!compartment_owner)
+		return ERR_PTR(-ENOMEM);
+
+	for (int i = 0; i < NB_COMPARTMENT_STM32MP2; i++) {
+		if (isolation_enabled) {
+			cid_field = devm_regmap_field_alloc(dev,
+							    priv->config_regmap,
+							    stm32mp25_tamp_nvram_rxcidcfg_fields[i]
+							    );
+			if (IS_ERR(cid_field)) {
+				kfree(compartment_owner);
+				return ERR_PTR(-ENOMEM);
+			}
+
+			if (regmap_field_read(cid_field, &cid_per_zone)) {
+				dev_err(dev, "Can't read field for registers zones\n");
+				devm_regmap_field_free(dev, cid_field);
+				kfree(compartment_owner);
+				return ERR_PTR(-EINVAL);
+			}
+
+			if (cid_per_zone == CURRENT_CID)
+				compartment_owner[i] = true;
+			else
+				compartment_owner[i] = false;
+
+			devm_regmap_field_free(dev, cid_field);
+		} else {
+			compartment_owner[i] = true;
+		}
+	}
+
+	return compartment_owner;
+}
+
+static enum stm32_tamp_bkpreg_access *stm32_tamp_get_access_rights_mp2x(struct stm32_tamp_nvram_priv
+									*priv)
+{
+	struct device *dev = priv->dev;
+	unsigned int nb_zones = priv->data->nb_zones;
+	bool *compartment_owner;
+	enum stm32_tamp_bkpreg_access *bkpreg_access;
+
+	compartment_owner = stm32_tamp_get_compartment_owner_mp2x(priv);
+	if (IS_ERR(compartment_owner))
+		return ERR_PTR(-ENODEV);
+
+	bkpreg_access = devm_kcalloc(dev,
+				     NB_ZONES_STM32MP2,
+				     sizeof(*bkpreg_access),
+				     GFP_KERNEL);
+
+	if (!bkpreg_access) {
+		kfree(compartment_owner);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	for (int protection_zone_idx = 0; protection_zone_idx < nb_zones;
+	     protection_zone_idx++) {
+		switch (protection_zone_idx) {
+		case BKPREG_PROTECTION_ZONE_1_RIF1:
+			bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		case BKPREG_PROTECTION_ZONE_1_RIF2:
+			bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		case BKPREG_PROTECTION_ZONE_2_RIF1:
+			if (compartment_owner[1] || compartment_owner[2])
+				bkpreg_access[protection_zone_idx] = BKP_READ;
+			else
+				bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		case BKPREG_PROTECTION_ZONE_2_RIF2:
+			if (compartment_owner[1] || compartment_owner[2])
+				bkpreg_access[protection_zone_idx] = BKP_READ;
+			else
+				bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		case BKPREG_PROTECTION_ZONE_3_RIF1:
+			if (compartment_owner[1])
+				bkpreg_access[protection_zone_idx] = BKP_READ_WRITE;
+			else if (compartment_owner[0] || compartment_owner[2])
+				bkpreg_access[protection_zone_idx] = BKP_READ;
+			else
+				bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		case BKPREG_PROTECTION_ZONE_3_RIF0:
+			if (compartment_owner[0])
+				bkpreg_access[protection_zone_idx] = BKP_READ_WRITE;
+			else if (compartment_owner[1] || compartment_owner[2])
+				bkpreg_access[protection_zone_idx] = BKP_READ;
+			else
+				bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		case BKPREG_PROTECTION_ZONE_3_RIF2:
+			if (compartment_owner[2])
+				bkpreg_access[protection_zone_idx] = BKP_READ_WRITE;
+			else if (compartment_owner[0] || compartment_owner[1])
+				bkpreg_access[protection_zone_idx] = BKP_READ;
+			else
+				bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		default:
+			devm_kfree(dev, bkpreg_access);
+			kfree(compartment_owner);
+			return ERR_PTR(-ENODEV);
+		}
+	}
+
+	kfree(compartment_owner);
+
+	return bkpreg_access;
+}
+
+static int stm32_tamp_nvram_bkpreg_get_zone(struct stm32_tamp_nvram_priv *priv, int reg)
+{
+	int *idx_bkpreg_zones_end = priv->idx_bkpreg_zones_end;
+	int nb_zones = priv->data->nb_zones;
+	int protection_zone_idx;
+
+	if (reg < 0)
+		return -1; /* negative reg is the boundary of an empty zone */
+
+	for (protection_zone_idx = 0; protection_zone_idx < nb_zones; protection_zone_idx++) {
+		if (reg <= idx_bkpreg_zones_end[protection_zone_idx])
+			break;
+	}
+
+	if (protection_zone_idx >= nb_zones)
+		return -1; /* the reg is not a part of any zone */
+
+	return protection_zone_idx;
+}
+
+static bool stm32_tamp_nvram_rights(struct stm32_tamp_nvram_priv *priv, int reg, bool read_only)
+{
+	struct device *dev = priv->dev;
+	int protection_zone_idx = stm32_tamp_nvram_bkpreg_get_zone(priv, reg);
+
+	if (protection_zone_idx < 0)
+		return false;
+
+	switch (priv->bkpreg_access[protection_zone_idx]) {
+	case BKP_READ_WRITE:
+		return true;
+	case BKP_READ:
+		return read_only;
+	case BKP_NO:
+		return false;
+	default:
+		dev_err(dev, "Can't get access rights for the zone\n");
+		return false;
+	}
+
+	return false;
+}
+
+static const struct stm32_tamp_nvram_plat stm32mp1_tamp_nvram = {
+	.nb_zones = NB_ZONES_STM32MP1,
+	.nb_regs = NB_REGS_STM32MP1,
+	.config_reg_fields = stm32mp1_tamp_nvram_zone_cfg_fields,
+};
+
+static const struct stm32_tamp_nvram_plat stm32mp25_tamp_nvram = {
+	.nb_zones = NB_ZONES_STM32MP2,
+	.nb_regs = NB_REGS_STM32MP2,
+	.config_reg_fields = stm32mp25_tamp_nvram_zone_cfg_fields,
+};
+
+static int stm32_tamp_nvram_write_byte(struct stm32_tamp_nvram_priv *priv, u32 offset, u8 byte)
+{
+	int offset_aligned = ALIGN_DOWN(offset, sizeof(u32));
+	unsigned int shift = (offset - offset_aligned) * 8;
+	u32 reg_idx = offset_aligned / sizeof(u32);
+
+	if (!stm32_tamp_nvram_rights(priv, reg_idx, false))
+		return -EACCES;
+
+	return regmap_update_bits(priv->bkpregs_regmap, priv->bkpregs_offset + offset_aligned,
+				  0xFFUL << shift, (u32)byte << shift);
+}
+
+static int stm32_tamp_nvram_read_byte(struct stm32_tamp_nvram_priv *priv, u32 offset, u8 *byte)
+{
+	int offset_aligned = ALIGN_DOWN(offset, sizeof(u32));
+	int byte_in_word = offset - offset_aligned;
+	u32 read_value;
+	u32 reg_idx = offset_aligned / sizeof(u32);
+	int ret;
+
+	if (!stm32_tamp_nvram_rights(priv, reg_idx, true))
+		return -EACCES;
+
+	ret = regmap_read(priv->bkpregs_regmap, priv->bkpregs_offset + offset_aligned,
+			  &read_value);
+	if (ret)
+		return ret;
+
+	*byte = (read_value >> (byte_in_word * 8)) & 0xFF;
+
+	return 0;
+}
+
+static int stm32_tamp_nvram_read(void *context, unsigned int offset, void *buf, size_t bytes)
+{
+	struct stm32_tamp_nvram_priv *priv = context;
+	struct device *dev = priv->dev;
+	u32 temp_u32;
+	u32 reg_idx;
+	int i, ret;
+	size_t total = offset + bytes;
+	u8 byte;
+	u8 *buf_u8 = buf;
+
+	i = offset;
+	while (i < total)  {
+		reg_idx = i / sizeof(u32);
+		if (i + sizeof(u32) <= total && IS_ALIGNED(i, sizeof(u32))) {
+			if (!stm32_tamp_nvram_rights(priv, reg_idx, true)) {
+				dev_dbg(dev, "Backup register %u is not allowed to be read\n",
+					reg_idx);
+				temp_u32 = 0;
+			} else {
+				ret = regmap_read(priv->bkpregs_regmap,
+						  priv->bkpregs_offset + i, &temp_u32);
+				if (ret)
+					return ret;
+			}
+			put_unaligned_le32(temp_u32, buf_u8);
+			buf_u8 += sizeof(u32);
+			i += sizeof(u32);
+		} else {
+			ret = stm32_tamp_nvram_read_byte(priv, i, &byte);
+			if (ret == -EACCES) {
+				dev_dbg(dev, "Backup register %u is not allowed to be read\n",
+					reg_idx);
+				byte = 0;
+			} else if (ret) {
+				return ret;
+			}
+
+			*buf_u8 = byte;
+			i++;
+			buf_u8++;
+		}
+	}
+
+	return 0;
+}
+
+static int stm32_tamp_nvram_write(void *context, unsigned int offset, void *buf, size_t bytes)
+{
+	struct stm32_tamp_nvram_priv *priv = context;
+	struct device *dev = priv->dev;
+	u32 temp_u32;
+	u32 reg_idx;
+	int i, ret;
+	size_t total = offset + bytes;
+	u8 *buf_u8 = (u8 *)buf;
+
+	i = offset;
+	while (i < total)  {
+		reg_idx = i / sizeof(u32);
+		if (i + sizeof(u32) <= total && IS_ALIGNED(i, sizeof(u32))) {
+			if (stm32_tamp_nvram_rights(priv, reg_idx, false)) {
+				temp_u32 = get_unaligned_le32(buf_u8);
+				ret = regmap_write(priv->bkpregs_regmap,
+						   priv->bkpregs_offset + i, temp_u32);
+				if (ret)
+					return ret;
+			} else {
+				dev_dbg(dev, "Backup register %u is not allowed to be written\n",
+					reg_idx);
+			}
+			buf_u8 += sizeof(u32);
+			i += sizeof(u32);
+		} else {
+			ret = stm32_tamp_nvram_write_byte(priv, i, *buf_u8);
+			if (ret == -EACCES) {
+				dev_dbg(dev, "Backup register %u is not allowed to be written\n",
+					reg_idx);
+			} else if (ret) {
+				return ret;
+			}
+
+			i++;
+			buf_u8++;
+		}
+	}
+
+	return 0;
+}
+
+static int *stm32_tamp_nvram_get_backup_zones(struct stm32_tamp_nvram_priv *priv)
+{
+	struct device *dev = priv->dev;
+	struct regmap *tamp_regmap = priv->config_regmap;
+	u32 offset_field;
+	int nb_zones = priv->data->nb_zones;
+	int zone_idx;
+	int *idx_bkpreg_zones_end;
+
+	idx_bkpreg_zones_end = devm_kcalloc(dev,
+					    nb_zones,
+					    sizeof(*idx_bkpreg_zones_end),
+					    GFP_KERNEL);
+	if (!idx_bkpreg_zones_end) {
+		dev_err(dev, "Can't allocate registers zones\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/* Get the n-1 frontiers of zone within the tamp configuration registers */
+	for (zone_idx = 0; zone_idx < nb_zones - 1; zone_idx++) {
+		const struct reg_field reg_field = priv->data->config_reg_fields[zone_idx];
+		struct regmap_field *field;
+		int ret;
+
+		field = devm_regmap_field_alloc(dev, tamp_regmap, reg_field);
+		if (IS_ERR(field)) {
+			dev_err(dev, "Can't allocate registers zones\n");
+			devm_kfree(dev, idx_bkpreg_zones_end);
+			return ERR_CAST(field);
+		}
+
+		ret = regmap_field_read(field, &offset_field);
+		devm_regmap_field_free(dev, field);
+		if (ret) {
+			dev_err(dev, "Can't read field for registers zones\n");
+			devm_kfree(dev, idx_bkpreg_zones_end);
+			return ERR_PTR(ret);
+		}
+
+		idx_bkpreg_zones_end[zone_idx] = offset_field - 1;
+	}
+
+	/* The last zone end is defined by the number of registers in TAMP */
+	idx_bkpreg_zones_end[zone_idx] = priv->data->nb_regs - 1;
+
+	return idx_bkpreg_zones_end;
+}
+
+static const struct of_device_id stm32_tamp_nvram_of_match[] = {
+	{ .compatible = "st,stm32mp15-tamp-nvram",
+	  .data = &stm32mp1_tamp_nvram },
+	{ .compatible = "st,stm32mp25-tamp-nvram",
+	  .data = &stm32mp25_tamp_nvram },
+	{},
+};
+
+static int stm32_tamp_nvram_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct stm32_tamp_nvram_priv *priv;
+	struct resource *res, parent_res;
+	int *zones_end;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+	priv->data = of_device_get_match_data(dev);
+	if (!priv->data) {
+		dev_err(dev, "Can't get platform data of the node\n");
+		return -ENODEV;
+	}
+
+	priv->config_regmap = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(priv->config_regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->config_regmap),
+				     "Can't get TAMP syscon regmap\n");
+
+	priv->idx_bkpreg_zones_end = stm32_tamp_nvram_get_backup_zones(priv);
+	if (IS_ERR(priv->idx_bkpreg_zones_end))
+		return dev_err_probe(dev, PTR_ERR(priv->idx_bkpreg_zones_end),
+				     "Can't determine protection zone\n");
+
+	zones_end = priv->idx_bkpreg_zones_end;
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	if (!res) {
+		dev_err(dev, "Can't get resource\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * The backup registers belong to the parent TAMP syscon, which other
+	 * drivers (e.g. remoteproc) also access: go through the syscon regmap
+	 * so that all accesses are serialized by the same lock.
+	 */
+	if (of_address_to_resource(dev->parent->of_node, 0, &parent_res) ||
+	    !resource_contains(&parent_res, res))
+		return dev_err_probe(dev, -EINVAL,
+				     "Backup registers not within TAMP parent range\n");
+
+	priv->bkpregs_regmap = priv->config_regmap;
+	priv->bkpregs_offset = res->start - parent_res.start;
+
+	priv->cfg.name = "stm32-tamp-nvram";
+	priv->cfg.word_size = 1;
+	priv->cfg.stride = 1;
+	priv->cfg.dev = dev;
+	priv->cfg.priv = priv;
+	priv->cfg.owner = THIS_MODULE;
+	priv->cfg.type = NVMEM_TYPE_BATTERY_BACKED;
+	priv->cfg.size = resource_size(res);
+	priv->cfg.reg_read = stm32_tamp_nvram_read;
+	priv->cfg.reg_write = stm32_tamp_nvram_write;
+
+	if (priv->data->nb_zones == NB_ZONES_STM32MP2) {
+		priv->bkpreg_access = stm32_tamp_get_access_rights_mp2x(priv);
+
+		if (IS_ERR(priv->bkpreg_access))
+			return PTR_ERR(priv->bkpreg_access);
+
+		dev_dbg(dev, "\n"
+			"Zone 1-RIF1 %3d - %3d %c%c\n"
+			"Zone 1-RIF2 %3d - %3d %c%c\n"
+			"Zone 2-RIF1 %3d - %3d %c%c\n"
+			"Zone 2-RIF2 %3d - %3d %c%c\n"
+			"Zone 3-RIF1 %3d - %3d %c%c\n"
+			"Zone 3-RIF0 %3d - %3d %c%c\n"
+			"Zone 3-RIF2 %3d - %3d %c%c\n",
+			0,
+			zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
+						false) ? 'W' : '-',
+			zones_end[BKPREG_PROTECTION_ZONE_1_RIF1] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
+						false) ? 'W' : '-',
+			zones_end[BKPREG_PROTECTION_ZONE_1_RIF2] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_2_RIF1],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_2_RIF1],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_2_RIF1],
+						false) ? 'W' : '-',
+			zones_end[BKPREG_PROTECTION_ZONE_2_RIF1] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_2_RIF2],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_2_RIF2],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_2_RIF2],
+						false) ? 'W' : '-',
+			zones_end[BKPREG_PROTECTION_ZONE_2_RIF2] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_3_RIF1],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_3_RIF1],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_3_RIF1],
+						false) ? 'W' : '-',
+			zones_end[BKPREG_PROTECTION_ZONE_3_RIF1] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_3_RIF0],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_3_RIF0],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_3_RIF0],
+						false) ? 'W' : '-',
+			zones_end[BKPREG_PROTECTION_ZONE_3_RIF0] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
+						false) ? 'W' : '-'
+				);
+	} else if (priv->data->nb_zones == NB_ZONES_STM32MP1) {
+		priv->bkpreg_access = stm32mp1_tamp_bkpreg_access;
+
+		dev_dbg(dev, "\n"
+			"Zone 1 %3d - %3d %c%c\n"
+			"Zone 2 %3d - %3d %c%c\n"
+			"Zone 3 %3d - %3d %c%c\n",
+			0,
+			zones_end[BKPREG_PROTECTION_ZONE_1],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_1],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_1],
+						false) ? 'W' : '-',
+			zones_end[BKPREG_PROTECTION_ZONE_1] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_2],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_2],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_2],
+						false) ? 'W' : '-',
+			zones_end[BKPREG_PROTECTION_ZONE_2] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_3],
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_3],
+						true) ? 'R' : '-',
+			stm32_tamp_nvram_rights(priv,
+						zones_end[BKPREG_PROTECTION_ZONE_3],
+						false) ? 'W' : '-');
+	}
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &priv->cfg));
+}
+
+MODULE_DEVICE_TABLE(of, stm32_tamp_nvram_of_match);
+
+static struct platform_driver stm32_tamp_nvram_driver = {
+	.probe = stm32_tamp_nvram_probe,
+	.driver = {
+		.name = "stm32-tamp-nvram",
+		.of_match_table = stm32_tamp_nvram_of_match,
+	},
+};
+
+module_platform_driver(stm32_tamp_nvram_driver)
+MODULE_AUTHOR("Simeon Marijon <simeon.marijon@foss.st.com>");
+MODULE_DESCRIPTION("STMicroelectronics STM32 NVMEM TAMP Backup registers");
+MODULE_LICENSE("GPL");

-- 
2.43.0

