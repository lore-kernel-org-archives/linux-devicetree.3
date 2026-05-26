Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012009.outbound.protection.outlook.com [40.107.200.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FBC211A14;
	Tue, 26 May 2026 23:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779839672; cv=fail; b=m31gFF5CpncBkK4+SOachCF/uK7U4JECPq6mBQOtNCEYT4XtjLyC7WFV5KIx6nhqmirxB3FRGIwnB9HJZQ4VBb0Iskv0/ww3HLrDGNRrKruM3KnQYyM/TlYJeYcFTrIsfPftCoA9pM5gU++mKokIhA9MgofGJCtNYilBlsHTtd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779839672; c=relaxed/simple;
	bh=G2Vz33mJMgZ2wk85ybEUVyzdAOmEsiWudfWZWXCS5dw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IrKbVeUDFD3NTZdJuTLV07yFFZyOPTqximNS4maKA9yZmWLo9YRAJM89bWU+BVGPnrQ4IzPcKF8znHRNyQ6YyJLq0gk4echsMlkjRhXjEABKyfPs3mH2TaW8OHqOMMbPwGfbR8F2IO3g6IdiUP97j9OmuGbJCwSyhF9BmxBfkkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nfyJGPXf; arc=fail smtp.client-ip=40.107.200.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nfyJGPXf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ta9e0lDVjSVRgIY659ePf8WkiSuba2CU33CsaQvQB/mW9VSgrzdJqfi+sz88294CLmgeHAR+e78nI8lnVDhW3+0cdXzrOCsn7x/xcvQTrv5Ph4gtPo6vpxkzEcQcDMW0Bab1nMf4WAMVgoqDIK8aaMqcItiLSY5TAuGrZQMvYt5xvNemdGAvgeHxGKSFCP2uWUS1i/BafC/B8cGhT6BtWqwxZiQoPa5tzojQhyDmMuFGvat3ZlnP5l/fOEEfPDUq8upZF5zgXa/XB8+234TqQbJwFgSii0qcn0vv2SWhnKV98dBW44TydTKzPkTWaPs00vuZCxxcevhKq5tQbW0iMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59lR2RBgdZ5oSOW7voK9SEoumaNHjOedv7lXMOT7xdI=;
 b=vWviRVRHpSatKw0h/HA/cp93ql5Ta+V/7/80G1SvoIUVriNFGKEnbM9WOTyd1AuoVTwiJKLXOn3yZlk38sjNRLzXoPljqw6/6wkvYsICA/z5gAuA3YWdPFzY7A4BFc3vBCdVlFlBVbgt0nCkffhl/BXr84dWti4RgPCDLH3Wrs7vPZ37lLoKp9x+aJqF1aj37Rs5ANvkJTPmHFrWvDFnVFLSJnbdtWK/oO/OV5JhBJXN3el2wZ9ywTvHm//LqrSM8QEARVpRYbVaVx1+tzs4eUEXpvsAHEeEqiHhxAP/8Z0jUCob86IWEF6xrSxpJ44cRAy8VTTEYm8g7km4+PXYVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=microchip.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59lR2RBgdZ5oSOW7voK9SEoumaNHjOedv7lXMOT7xdI=;
 b=nfyJGPXf31aT7OP1Aa/AfujUk33sh3QGkorHsekFlIPS23mvgLBWpYCja8SxVJVG6LEUrpRTqsgp2ZM4egT+bCadR7/gFuCXHiyjlBH1P8V4dE3w5qdeL1GxMh+LhbffS1I7rFekYv41oZIJT2rOTjEHUP91DzDj8HZydmqdvMY=
Received: from CY5PR15CA0138.namprd15.prod.outlook.com (2603:10b6:930:68::20)
 by SJ5PPF7E749FEBA.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7ac) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 23:54:19 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:930:68:cafe::1b) by CY5PR15CA0138.outlook.office365.com
 (2603:10b6:930:68::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Tue, 26
 May 2026 23:54:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 23:54:18 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 18:54:17 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 18:54:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 26 May 2026 18:54:17 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64QNsHIP1896232;
	Tue, 26 May 2026 18:54:17 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>, Jason Kridner <jkridner@gmail.com>, Robert Nelson
	<robertcnelson@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 0/3] arm64: dts/bindings: Add support for BeagleBadge
Date: Tue, 26 May 2026 18:54:14 -0500
Message-ID: <20260526235417.1326187-1-jm@ti.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|SJ5PPF7E749FEBA:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f9035e7-35a6-455e-7d2b-08debb8219ae
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700016|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	7dK4ICzKa6Fz3gHN3apN1Nb0pzCyWqfOlMsO0RKluPljS0QPGsf0gO8dfKc4t/H7Fi3mpx/NDjGHaSPtQdr+oRd5hCJh0PsPVOdeu+u1fE/gZQDoA9QMfpHDeye/J416s1roAapkzMcC51vd6GDRFU+cdEmlnTxGDiUzmOJiqmi9rAYS28Z5GRsQcj5wPL7IuU1zJQJIgDcIn9YuIn51iEm8wEoPvYyJO3pSC8Q3znTHr+4zRhE+3AN8F2tQ5OtcOYQ8GE0iuY10Q/Ow9HTBO442ZBtjI6ZwBAuKUYgy3s142ekJiyEF/WkgNEtwJc1kc3pURwv0+7G2NzTnMu2qCqLfwOvlQ2w/i5/JFg7RpFzueYEtDgpLmHdJK2tzQbuLsJJE4Y/RDuhIozpult5mTkWVI864o33SVKP3RnRKjOOgGqM+yBAk49lHA/hguz/wIs9G8H3e2gt4s8rflHPmTkohT1+RVU85mh+MkJbSF1Fndq+VE8ZL1QjmNTUooiFQ9b+S+MMr8hKM4k57VIJ8qmR5IdML6eEvxMEkqW6XrLwcAftXCiH6IVH/A8AoBbHsIwUAmmd0ctIpyi4uXyAtMVggoP+S9TbSDfQxfhZoQHr1c3i++Zw3EWpQZpL3IPm7Z67CwuvZUaiNBPXQ6OWNK7YSta4cXme+/4rC69Bx4EvJK1RZHYYD1H9Uo/fCi0DS
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016)(18002099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wj6ID+Xr2qJZIIn1gTlPLZN3Nb5G9Hp3aHf1h+LFhuWamMs8Ri+njXdIhXCM4oSs9fXXGmSZhbcmbS4LOvnrYM4P5fVs/rCL/zURHZXjzx1H5Zlv8CQxKCIid9//r74+szQWnu8NU6QO0fxPlaXBx+3eygdCotT7Kd4zU3yx1wo7+N5FKL7gnsSCUUaC+D6G6tpUGg3EwM+RrXgTDiOloknqkR5Wexv4DPdsHeE1UHruZFMK0kgZhZGCkP+EYCDI2zJr3OSDAXeYcMeh0EmfP8A6VJK2Ol8765aXEByUT63q9SCG2zQOfkm6M8xcrJtbKWOVh64MHsCYVZ4YtAfEnsjQmh6jtDLm/uwLYZBiS+yMQwv+fZrvMRjDFSiqEXjfckofwFjiK/ebEnfn6avOwFdB68a+9NPmLNWCa4aGgDBUgCC9/hpRbLpjPZQVsGmv
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 23:54:18.3331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9035e7-35a6-455e-7d2b-08debb8219ae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7E749FEBA

Hi,

BeagleBoard.org BeagleBadge[1] is a compact, affordable open source
hardware [2] single board computer based on the Texas Instruments AM62L3
SoC designed for IoT and embedded applications. Add base support for
the same.

SD boot:
Link: https://gist.github.com/jmenti/8818fa277597de927dd2b42ab1d2552f

This patch series adds:
- Device tree bindings update for am62l3-badge
- Device tree source for BeagleBadge board
- Defconfig: drivers for BeagleBadge

Changelog since v4:
- Canonical URL fixed
- Switch gpio -> gpios in voltage regulator nodes
- Regulator-always-on removed in sensor_3v3
- Add bootph-all on pinmux nodes
- Fix gpio-line-names formatting
- Nodes: sdhci2, wlan_en regulator, & pinmux removed
- USB aliases removed
- Pickup Conor's review tag

v4
Link: https://lore.kernel.org/all/20260515153541.294698-1-jm@ti.com/
v3
Link: https://lore.kernel.org/all/20260513233447.2713737-1-jm@ti.com/
V2
Link: https://lore.kernel.org/all/20260508230341.1891450-1-jm@ti.com/
V1
Link: https://lore.kernel.org/all/20260501233148.4180391-1-jm@ti.com/

Patch series depends on:
Link: https://lore.kernel.org/all/20260513231154.2703292-1-jm@ti.com/

[1] https://www.beagleboard.org/boards/beaglebadge
[2] https://github.com/beagleboard/BeagleBadge/blob/main/design/BeagleBadge_RevA_V0.7_SCH_251107.pdf

Judith Mendez (3):
  dt-bindings: arm: ti: Add am62l3-beaglebadge
  arm64: dts: ti: Add k3-am62l3-beaglebadge
  arm64: defconfig: Enable drivers for BeagleBadge

 .../devicetree/bindings/arm/ti/k3.yaml        |   1 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am62l3-beaglebadge.dts     | 658 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   5 +
 4 files changed, 665 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts

-- 
2.54.0

