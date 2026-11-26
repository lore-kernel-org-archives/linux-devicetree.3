Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.143
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795672812;
	b=RObnFdNSOx4zNAlkWyu6Iihl3bqXyaLPkZ/XM2HGixJOpRtkzDs2nusuLLxItqUEVWWe
	 biYGC4nMuo40Vt8SFZsKlIuxIC+rAN4i4kEzIOojG5Bc2wUFtGoM0pUmycckpZnYU5Av8
	 HOPzR5zv4hdFQrWtdp0db05dzNJ5pMnYOaaP2Yj9KL0y4ry/AxkU44zScGfy9q0Zs8SKt
	 mYclkIG1sfZeUxdHgFSxAJWX4o0LrlMcu/NChwXJ8DN1905gc+mG8ZFAW825yGKQc3PiB
	 xEYepgVMlw+BV5Co8RtVPSaONX3M7zcD+h2yxDD+dNaBX7SaNI8CiXaCuUFeb9qDJ5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672812;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=j4Gsf7/xFgMlTGHK9IyaY6nLlECZgTImTv29V8is7OA=;
	b=hnKKPuyKwZ8ZGcB/JKTzlEO1+3CNu8CAsiUmoytpnUn4XCtWypZOD9hf5MGuDeH/i0vj
	 Zfum4RvrvepqArzDkNPsQkzfwDs+xoRSZcLT5nJN8RZhIU1DV0shhVGWXRJS3d9NtTTTR
	 lcWVy0NTrGYNm0vFpb+/kfyGRInN+aq4Lwb1ZWgc8Se1BWAJ4QwRdMq3/lJbqjARulmBY
	 I7cvPKcQ74cV9AWi+rjMPvzfPnwEsDrSqcxvsBRzRItPYMSaeMmKvgFnL/hzBbbrHz1gQ
	 XnhDpx0knAyis6kXVttdr26RT5MS6/DAIRgHOoVujhnO3SuIdiurWCBA1ccqKqBZ3+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.143
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023143.outbound.protection.outlook.com [40.107.44.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05298606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05298606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwS7///MbmHfQ6FP8novF5Fvq14BJtqzRAW92dBKXxB+vky/BYRzliIqB+TO+srrJwK5xY9H1dmItijN4n/ydWNq8FzupgjaLFbTveztE0xCSRlrjJtpQG5oOknDpkG6SKHPBP9fp8g5hTeUD9BFiFgHmjEpf/hYCIV1xaGBPUsl0CNJl+8PGHzwUDNO+BJkJRK6768SGKhGpsh1i7xeK8hmXTenGutwvrv3gpISVP6QVvZZUT9MsCtGbK1HWKUSrbIXMP0C8f0/Uo+dYnzGEGh9ctpte/chwLNvXY2UCTr5I13jx47+WGqOjkfz3JK9zAdJHsHFGoSFmy0nfnE63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4Gsf7/xFgMlTGHK9IyaY6nLlECZgTImTv29V8is7OA=;
 b=LhIcZXTsKFtQFohL+/DlTbaw0bxsBZpz7/cTmYOmFgEVEk3z3rKUeaplfPx/9akMdyQ28YtcZu8di6fq0g4IW6+JhAvUOoJFOPm5S1dEe9uGjRYHKnYqkZXS5jSxWlGh7rTMULbqsXmmOLn3xAJqzhb22Q56/zdenUcWol9oCcsWPogvMbVhEV5oS3bz6L3fy1qfwFlUzEomFVqkrT9ZDIK/vlIAbkD7RufvyzPfj5GXnAGv/DuLn1i6XMHNByv4vq2DSTocnk4vMWLM99JeHf4aKIXO9Wy/ebaTn+Xcpmm3eNsx7aVzPhYggn3zFVtb/UQh0fVGfQoMYj/IaqFG6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=bootlin.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR02CA0025.apcprd02.prod.outlook.com (2603:1096:990:76::16)
 by OSNPR06MB9027.apcprd06.prod.outlook.com (2603:1096:604:480::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.688.4; Thu, 26 Nov
 2026 06:00:07 +0000
Received: from SG1PEPF000082E1.apcprd02.prod.outlook.com
 (2603:1096:990:76:cafe::4e) by JH0PR02CA0025.outlook.office365.com
 (2603:1096:990:76::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 06:00:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E1.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 06:00:05 +0000
Received: from localhost.localdomain (unknown [172.16.66.33])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1D32740920EB;
	Thu, 26 Nov 2026 14:00:04 +0800 (CST)
From: Luo Liu <Luo.Liu@cixtech.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	luca.ceresoli@bootlin.com,
	wuyi.shen@cixtech.com,
	cix-kernel-upstream@cixtech.com
Subject: [PATCH v5 5/5] drm/cix: add the Sky1 DisplayPort platform glue
Date: Thu, 26 Nov 2026 14:00:03 +0800
Message-Id: <20261126060003.3979478-6-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126060003.3979478-1-Luo.Liu@cixtech.com>
References: <20261126060003.3979478-1-Luo.Liu@cixtech.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E1:EE_|OSNPR06MB9027:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 602b2fbc-9cf4-4fc2-1a04-08df4b8284b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|23010399003|82310400026|42112799006|10067099003|56012099006|261021121427099003|261009221227099003|261009223027099003|261009223327099003|261009221727099003|261009220027099003|261102123227099003|261026121527099003|261022105027099003|261026140227099003|261022075727099003|261028144727099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	QACdlni0mzWv0+idzqfjPdXmqLd2mNgUPDuwondZLPrH66HMslxu0/IJctXhjmg/RlZiV7iSjHe010jfU2HiTZfgkuHJQKKE1sHr4az4nhVqSwjAcCYNo3mh12Y3e7MnpNIX3MmalnLHDvWktPBV/keFy7nJ5IGWxOmJD2yFZ3dD3qu6aITuqEBj11Wi42scfqSzaqFDDaAvJ5Qa7E7Ono5hMjkzmKSLapKwHPEU1x1Aa0XxOl9NPdD4iQ1pm/prLmwLaknmOEVXtxS+DX+Ye++l8sZNljoFU3qmNEdmWRH3hBQ32WsHkUMl96cLaawNtNxuAwlE4fT3u0hsLxWXK9/FpExQ5dU6RC6uaz1C005pYzSZOEpeDc2p25crV0yVNqNJ7Wt+vJzTvTp0LJFTsG157h+iSig4k3AqQR2LjRh9zsrn5q4bjBsQz+KGTgxGwx4p48YhGr6zcJMByR2O0pIy18hyqJxJ4AEx5xDCxiDlfZRAWx6YSEViWgCAXXi7oe8AQbMzA1LmDge/g7sGwPM1l131GyfkW/Q/9feESxwFdBNQQBHcveuwDLlgWq/mQW1HMdC75NXYeNR1d4yrJfaM51oVYuuRLq9hqYUk4Cq+6fkUWuAElJv53I7zEMUWMHY9cFthLEqJ3y4DxdjKd18YMd+pT0jAwFesQ9Dwv9ZsXduv1NpaW07PgUEHWDlyWDzATZcLw/axBPoi6cFBVg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(23010399003)(82310400026)(42112799006)(10067099003)(56012099006)(261021121427099003)(261009221227099003)(261009223027099003)(261009223327099003)(261009221727099003)(261009220027099003)(261102123227099003)(261026121527099003)(261022105027099003)(261026140227099003)(261022075727099003)(261028144727099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tJ0ZHkD0PWpAcQIPxOZ65XpI9hYc6z19Vqa/JufKOUFL/SjHcCprobxWuAlxFxVmiaIXFeyiz8ZcNE3pMyiR8BjhDaY+QaklkSf5M8H5hDZvPkTtOTJGTDhS0bJKDeJCqrmenwbyXWAyAmJ1XbYCO76vuI3ef04CgcAPAwnJJr/AJH79OrmYolxy1ykzdrD3/nYp7IvBSFMAZVE/FBKsRqLFdj7GvHdOmuJqd5hJdMNBAv+bxEJ6APo7OB7m/DJyhF+7hNQPPbNIG8QdCGVygnciVdxV0cOY3wCyrwDnaghl2EliV4qnFCrRk/1LzE2GYt+p17N9e9+7dbXhQm82e1YLG897GWB/o+7PGKA5QJXFWbnFOR29q6sn0ecjsf46bArqwLSs1v1cOotb9Sz1U/6RFjQpcLf8OPLdPh9gSCKQFYkBzffYsJJ56gHso3BS
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 06:00:05.0420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 602b2fbc-9cf4-4fc2-1a04-08df4b8284b7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB9027

Add the platform driver that maps the Sky1 RCSU video adapter registers
and programs the pixel format and pixel-per-clock mode for the
Trilinear DisplayPort transmitter.

The DP protocol, link training and the DRM bridge live in the shared
Trilinear bridge driver. This glue only fills in the SoC-specific parts
through dptx_plat_data, declared in include/drm/bridge/trilinear_dp.h.

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
---
 drivers/gpu/drm/Kconfig             |   1 +
 drivers/gpu/drm/Makefile            |   1 +
 drivers/gpu/drm/cix/Kconfig         |   3 +
 drivers/gpu/drm/cix/Makefile        |   3 +
 drivers/gpu/drm/cix/dptx/Kconfig    |  15 +++
 drivers/gpu/drm/cix/dptx/Makefile   |   4 +
 drivers/gpu/drm/cix/dptx/cix_dptx.c | 173 ++++++++++++++++++++++++++++
 7 files changed, 200 insertions(+)
 create mode 100644 drivers/gpu/drm/cix/Kconfig
 create mode 100644 drivers/gpu/drm/cix/Makefile
 create mode 100644 drivers/gpu/drm/cix/dptx/Kconfig
 create mode 100644 drivers/gpu/drm/cix/dptx/Makefile
 create mode 100644 drivers/gpu/drm/cix/dptx/cix_dptx.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 61111d50b1c6..a1808db8b9c8 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -311,6 +311,7 @@ source "drivers/gpu/drm/aspeed/Kconfig"
 source "drivers/gpu/drm/ast/Kconfig"
 source "drivers/gpu/drm/atmel-hlcdc/Kconfig"
 source "drivers/gpu/drm/bridge/Kconfig"
+source "drivers/gpu/drm/cix/Kconfig"
 source "drivers/gpu/drm/etnaviv/Kconfig"
 source "drivers/gpu/drm/exynos/Kconfig"
 source "drivers/gpu/drm/fsl-dcu/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2c6bc093a923..6ed7456bb993 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -169,6 +169,7 @@ obj-y			+= tests/
 obj-$(CONFIG_DRM_MIPI_DBI) += drm_mipi_dbi.o
 obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
 obj-y			+= arm/
+obj-y			+= cix/
 obj-y			+= clients/
 obj-y			+= display/
 obj-$(CONFIG_DRM_TTM)	+= ttm/
diff --git a/drivers/gpu/drm/cix/Kconfig b/drivers/gpu/drm/cix/Kconfig
new file mode 100644
index 000000000000..6cbaa5bf9fe9
--- /dev/null
+++ b/drivers/gpu/drm/cix/Kconfig
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+source "drivers/gpu/drm/cix/dptx/Kconfig"
diff --git a/drivers/gpu/drm/cix/Makefile b/drivers/gpu/drm/cix/Makefile
new file mode 100644
index 000000000000..2cc5cba67848
--- /dev/null
+++ b/drivers/gpu/drm/cix/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DRM_CIX_DP) += dptx/
diff --git a/drivers/gpu/drm/cix/dptx/Kconfig b/drivers/gpu/drm/cix/dptx/Kconfig
new file mode 100644
index 000000000000..f5d3afe5699f
--- /dev/null
+++ b/drivers/gpu/drm/cix/dptx/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config DRM_CIX_DP
+	tristate "Cix Sky1 DisplayPort platform glue"
+	depends on ARCH_CIX || COMPILE_TEST
+	depends on COMMON_CLK && DRM && OF
+	depends on GENERIC_PHY
+	select DRM_TRILINEAR_DPTX
+	help
+	  Platform glue for the Cix Sky1 DisplayPort output. It maps the
+	  SoC video adapter registers and binds the shared Trilinear DPTX
+	  bridge driver.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called cix-dptx.
diff --git a/drivers/gpu/drm/cix/dptx/Makefile b/drivers/gpu/drm/cix/dptx/Makefile
new file mode 100644
index 000000000000..64226bbd7c49
--- /dev/null
+++ b/drivers/gpu/drm/cix/dptx/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+cix-dptx-y := cix_dptx.o
+obj-$(CONFIG_DRM_CIX_DP) += cix-dptx.o
diff --git a/drivers/gpu/drm/cix/dptx/cix_dptx.c b/drivers/gpu/drm/cix/dptx/cix_dptx.c
new file mode 100644
index 000000000000..ca724ddc7e93
--- /dev/null
+++ b/drivers/gpu/drm/cix/dptx/cix_dptx.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * CIX Sky1 DisplayPort platform glue
+ *
+ * Copyright 2026 Cix Technology Group Co., Ltd.
+ */
+
+#include <linux/bits.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+
+#include <drm/bridge/trilinear_dp.h>
+
+#define CFG_ADAPTER_VIDEO0_OFFSET 0x300
+#define CFG_ADAPTER_VIDEO1_OFFSET 0x304
+#define CFG_ADAPTER_VIDEO_OFFSET_DP2 0x320
+
+struct cix_dp_adapter_fmt {
+	int offset;
+	u32 shift;
+};
+
+struct cix_dptx {
+	void __iomem *rcsu;
+};
+
+static const struct cix_dp_adapter_fmt usbc_adapter_fmt[] = {
+	{ CFG_ADAPTER_VIDEO0_OFFSET, 30 },
+	{ CFG_ADAPTER_VIDEO1_OFFSET, 19 },
+};
+
+static const struct cix_dp_adapter_fmt dp2_adapter_fmt[] = {
+	{ CFG_ADAPTER_VIDEO_OFFSET_DP2, 17 },
+	{ CFG_ADAPTER_VIDEO_OFFSET_DP2, 20 },
+};
+
+static void cix_dp_adapter_fmt_set(void __iomem *rcsu,
+				   const struct cix_dp_adapter_fmt *adapter,
+				   enum dp_pixelformat format, bool ppc2)
+{
+	u32 fmt_mask;
+	u32 ppc_bit;
+	u32 value;
+
+	/* The PPC control bit sits directly below the pixel format field. */
+	fmt_mask = GENMASK(adapter->shift + 1, adapter->shift);
+	ppc_bit = BIT(adapter->shift - 1);
+
+	value = readl(rcsu + adapter->offset);
+
+	value &= ~fmt_mask;
+	if (format == DP_PIXELFORMAT_YUV422)
+		value |= 2U << adapter->shift;
+	else if (format == DP_PIXELFORMAT_YUV420)
+		value |= 3U << adapter->shift;
+
+	if (ppc2)
+		value |= ppc_bit;
+	else
+		value &= ~ppc_bit;
+
+	writel(value, rcsu + adapter->offset);
+}
+
+static void cix_dp_usbc_adapter_config(void *data, unsigned int pipe_id,
+				       enum dp_pixelformat format, bool ppc2)
+{
+	struct cix_dptx *priv = data;
+
+	if (pipe_id >= ARRAY_SIZE(usbc_adapter_fmt))
+		return;
+
+	cix_dp_adapter_fmt_set(priv->rcsu, &usbc_adapter_fmt[pipe_id], format,
+			       ppc2);
+}
+
+static void cix_dp_native_adapter_config(void *data, unsigned int pipe_id,
+					 enum dp_pixelformat format, bool ppc2)
+{
+	struct cix_dptx *priv = data;
+
+	if (pipe_id >= ARRAY_SIZE(dp2_adapter_fmt))
+		return;
+
+	cix_dp_adapter_fmt_set(priv->rcsu, &dp2_adapter_fmt[pipe_id], format,
+			       ppc2);
+}
+
+static int cix_dptx_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct dptx_plat_data *soc_data;
+	struct cix_dptx *priv;
+	struct dptx_dev *dp;
+	void __iomem *rcsu;
+
+	soc_data = of_device_get_match_data(dev);
+	if (!soc_data)
+		return -ENODEV;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	rcsu = devm_platform_ioremap_resource_byname(pdev, "rcsu");
+	if (IS_ERR(rcsu))
+		return dev_err_probe(dev, PTR_ERR(rcsu),
+				     "failed to map rcsu registers\n");
+
+	priv->rcsu = rcsu;
+
+	dp = trilinear_dptx_probe(dev, soc_data, priv);
+	if (IS_ERR(dp))
+		return PTR_ERR(dp);
+
+	return 0;
+}
+
+static int cix_dptx_pm_suspend(struct device *dev)
+{
+	return trilinear_dptx_suspend(dev_get_drvdata(dev));
+}
+
+static int cix_dptx_pm_resume(struct device *dev)
+{
+	return trilinear_dptx_resume(dev_get_drvdata(dev));
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(cix_dptx_pm_ops, cix_dptx_pm_suspend,
+				cix_dptx_pm_resume);
+
+static void cix_dptx_shutdown(struct platform_device *pdev)
+{
+	trilinear_dptx_shutdown(platform_get_drvdata(pdev));
+}
+
+static const struct dptx_plat_data sky1_usbdp_data = {
+	.adapter_config = cix_dp_usbc_adapter_config,
+	.oob_hpd = true,
+	.max_bw_code = DP_LINK_BW_5_4,
+};
+
+static const struct dptx_plat_data sky1_dp_data = {
+	.adapter_config = cix_dp_native_adapter_config,
+	.max_bw_code = DP_LINK_BW_5_4,
+};
+
+static const struct of_device_id cix_dptx_dt_ids[] = {
+	{ .compatible = "cix,sky1-usbdp", .data = &sky1_usbdp_data },
+	{ .compatible = "cix,sky1-dp", .data = &sky1_dp_data },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, cix_dptx_dt_ids);
+
+static struct platform_driver cix_dp_driver = {
+	.probe = cix_dptx_probe,
+	.shutdown = cix_dptx_shutdown,
+	.driver = {
+		.name = "cix-dptx",
+		.of_match_table = cix_dptx_dt_ids,
+		.pm = pm_sleep_ptr(&cix_dptx_pm_ops),
+	},
+};
+
+module_platform_driver(cix_dp_driver);
+
+MODULE_AUTHOR("Luo Liu <Luo.Liu@cixtech.com>");
+MODULE_AUTHOR("Wuyi Shen <wuyi.shen@cixtech.com>");
+MODULE_DESCRIPTION("Cix Sky1 DisplayPort platform glue");
+MODULE_LICENSE("GPL");
-- 
2.25.1

