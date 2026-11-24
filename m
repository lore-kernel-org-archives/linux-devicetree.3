Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795521683;
	b=s4ST23D/ph3Dk/PzIC0Rruy3Y4QEPewplwaN9REEnV0Zyo3hRp5GUu8JPSkP2i4T2Q0Q
	 kmSI6so6b3nBEoii8sOATA10MXiOKkre+k6hapWJSui6z91SepumKyoHWF31L6vr+3yhV
	 cRo4ZY/ydlvbuKioON9/Xas+dKf+4wmiKXvh38o5tvsUHpKx5t5X9MmXBoCkEcZ8ARBgq
	 KzIxK+NZMsMOmPc3uoEb4GDBkNOrSDauR3p7DVU4yLyB3OUCwSubQXRsSeQyW52k4aPrZ
	 U1Y7Z4BGNXBiY7GjEZt2NGLGaWHS61fvrCLKzisnQtf8F6s5xDNOyTF19CXFkf7/3nQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521683;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=GiUNjA7gU4xapbpzzBGGiaVEAx1ua+yHVuMt5r623yY=;
	b=Mm0uw+Rz6xEhl4M5/eEk9VRBah10XLKN/oX6LOZQmiNSEhdGU1W8zZXH/54YGM0HBABO
	 31UjkrNoEvoqE0Wrtg265R0wveFMSa3Qo4L5NLqYIoI6ubXlX93SKrp1EfyNCEdnjUNj/
	 IIuy1zl8SuhMMD5A2tWPgWawFm1iY8AAIU5Z6yvulr/5NESngDSJQoisU/7mhUlC5WXn7
	 oMrOSKdda7ZtdX9IBZk0e1YCrPG1Yh9IpGjhmfbmMKXkIP3fLnmX1P3lcAT3O3RfqNtLY
	 ZUqLRhZCzf4TINdLNJ+kBOHdGpSV9rZAQk/UPiYpvKklUVb8VGTs0N9a21NzNmUMKKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.81
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023081.outbound.protection.outlook.com [40.107.44.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65151606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65151606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApgJuoEbQ/FvCBa9KlzHr5/hhh2w9UjML+l+GUxEXbKj/BivIEKXKqTCgjPsvuTVTTv3zk9YHCF/lqmBSw2UiYJ8CqNn2kpDYUDVSy1h3WOTvs42X8gVSIvyuTTADwJ4CST519q3UooDpOf53q3HvpqMMpru2TUyQHH0cbxgC61w7S0T7V55IGgj8BhEI7FLFjlZaaSebcSriz2EY64EW7CN8pJchgmIe4kNsYdUTaTlPfIPsMjgZVoBgHwAICulI1ozR4qRms/WzlZPYPJAqZc4IQZtOTRRUN3A/ea/ZPYXad4LFA0cj8XJqAENAQLoO3u0jX/HPi9Wiqom7hZyRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GiUNjA7gU4xapbpzzBGGiaVEAx1ua+yHVuMt5r623yY=;
 b=Z9qnQW587QN0HBpRlmjRPWwXXz8p1mYGQ5OYiI+To3jiYXlmN41GRqNJom4aFjgCASb4hO9ll/ywb84c+qVmZSLKSyA6qyHBKmoVR8LelXadC5KBYa4MMyi0oocZXv6NARbG7xAfuR1Dq2YBdmMCZTwUuND/EaYxjyHG0XaGrIqgCOngabiXoczGJIagHSiefBSrU3ilAShvcmyBtliQlNB1j8mryK93s0j9rSVtOph6NFdKxGMZ3PpCirnBuzJ7jEGkuQz8b5very5GFgox4nQtjPmhoQ500lk9W3U4okLhop5LdMcoRhDRscmeegCzhkKnnhL0uepCuANS6tf+ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=bootlin.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::11) by KL1PR06MB6886.apcprd06.prod.outlook.com
 (2603:1096:820:108::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 12:01:17 +0000
Received: from SG1PEPF000082E4.apcprd02.prod.outlook.com
 (2603:1096:4:193:cafe::70) by SI2PR01CA0052.outlook.office365.com
 (2603:1096:4:193::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 12:01:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E4.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 12:01:16 +0000
Received: from localhost.localdomain (unknown [172.16.66.33])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AAB58427EFD4;
	Tue, 24 Nov 2026 20:01:14 +0800 (CST)
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
Subject: [PATCH v3 0/5] drm/bridge: trilinear: add the Sky1 DisplayPort transmitter
Date: Tue, 24 Nov 2026 20:01:09 +0800
Message-Id: <20261124120114.3273161-1-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E4:EE_|KL1PR06MB6886:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9f15f279-059e-448b-91f1-08df4a22a4ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|42112799006|36860700016|10067099003|261026140227099003|56012099006|5023799004|261021123027099003|261026121527099003|261028144727099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|261009223327099003|261009221727099003|261009220027099003|18002099003|261009221227099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	DO+b1BHb30iQjt35/5IsCBwYJnYp90E6su4drlFK9PPA+S1LkM5YGLcGEtnmeinyjJQv/af2DVRKuSY6m0rKMEvWUiCowVhZ90OWc6h3XYSmp4w/rDzAqNxKcWALfxxLY0csEltaEMQPXgh/nPC1q1kRME7+zg4PQJYwQifSSQmizC7u430XURhOAXFjgeUa2wYQlotJpT8kRznfUnQaL07TMejruHQFbWhXhGuDxxvqxYZLokrzzdAKcCY2nVtZFMsKfOUi1CwMMQmydPgkAzulwEQBs+1M5DSJzkOn+xlxlxRSqfGLQ0RZw9sLJm3oj4wDLH2MUChmZokhJlBkvs7e/m9gkg3Nh/Vbli73iZrqz1C35XIZ8haXDR/wFa3au42em0ysw0vjVIAMUNKKIHUZ34u7xbEEjBB4ubIxU1ieI0BTMbQj3FXAd/5TboBvsq/EHoPKdUUGN0Sn8Ipz+dwH3P0/BgGtDEGnOXahrvz4ed8+2wnu0o7T+GECHgdK9oERt0TK5aowdB+t388TujTsdff1yX5Ip8omwXQhRdeyLz6f//WokGxAbZfVMMDtPN1MCPjmMv/gbPXe95EwylV81ddid2107tC/PUgVawVRN8JJGDvMl3LnV8yXpLNbi2w6fQGUHqtF2IqBc0M4tPh1z9JVw5FtIY77jjPmHeo9lcUkcfYUCKKvoDmQvKu4Re2xXpjyCWGxD5Oecr/8mA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(42112799006)(36860700016)(10067099003)(261026140227099003)(56012099006)(5023799004)(261021123027099003)(261026121527099003)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(261009223327099003)(261009221727099003)(261009220027099003)(18002099003)(261009221227099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tCMDe8apmAqfsp5tls6TyW6sYSKLoHUJnKLes4peEi8XzO4ZTRjxM2NgAnymiZNaFVHoZDX0ttcL8FbRSeR7Q2HIbWoBbZqIYt9MR5NvH2yt+tVC92HzjZK+PCUYB7ZqG3tL52wJU6dZ7bWjKzsC4xuHMXxLurxQQaUimJDSyyL3XEwndqmhZFw9IX4OIox/kAfRC76GZB4tAUhKq6A9FlEcc+UZoHyDwqW1z+6f0vtM+V2dnLl1t7SLsEgUINM7/Xlir4BGZqjsfmYHPvS1438zGRKbf8YihU50YB3UMb2JPCSrq/yEBfjtCFCMs9Vgq0Sc0O+fM9yDKxVKAkNA2/N0EWvj/qPC7YuxJsPc2NELjFc2aEStbpODhRJ66kCyBvwgTXYtJ+f+RvPLnAw95RyA33oXryrPY0aIulk1TuAqBprKiJOTCBcP/CsGEtG4
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 12:01:16.0231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f15f279-059e-448b-91f1-08df4a22a4ab
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6886

Add the Trilinear DisplayPort transmitter as a DRM bridge, with the CIX
Sky1 platform glue behind a platform data structure.

The hardware layer, the DRM bridge and the core state machine live in
drivers/gpu/drm/bridge/trilinear/, so other SoCs using the same
transmitter can share them; the platform registers its own dptx_plat_data
through include/drm/bridge/dptx.h. The transmitter drives up to four
lanes at HBR3 and has two SST sources. MST is not implemented and stays
disabled.

The USB-C transmitters and the native DP/eDP transmitter use different
RCSU video-adapter register offsets and bit layouts, so the binding has
one compatible for each. The Sky1 devicetree nodes are not included in
this posting.

Scope: DPTX hardware, bridge and bindings only. Komeda (the Sky1 display
controller that feeds these bridges) and the board DTS are separate
series. Nothing in this posting wires a full display stack.

Tested on a Radxa Orion O6 board; the USB-C DisplayPort output works
with the connector created by drm_bridge_connector_init().

Connector handling in this driver:

  The bridge is meant to be attached with DRM_BRIDGE_ATTACH_NO_CONNECTOR
  and drm_bridge_connector_init() creates the connector from the bridge
  operations. The driver implements the bridge side only and never
  registers a connector of its own.

Changes in v3:
- Move the driver out of drivers/gpu/drm/cix/dptx/ into the shared
  drivers/gpu/drm/bridge/trilinear/ bridge, leaving only the Sky1
  platform data under drivers/gpu/drm/cix/dptx/.
- Split the driver into the hardware layer, the DRM bridge, and the core
  state machine with the build glue.
- Switch to the connector-less bridge model: the bridge refuses an attach
  without DRM_BRIDGE_ATTACH_NO_CONNECTOR, and the connector is created by
  drm_bridge_connector_init() instead of by the driver from .attach().

Luo Liu (5):
  dt-bindings: display: add CIX Sky1 DisplayPort transmitter
  drm/bridge: trilinear: add the DPTX hardware layer
  drm/bridge: trilinear: add the DPTX DRM bridge
  drm/bridge: trilinear: add the DPTX core and build glue
  drm/cix: add the Sky1 DisplayPort platform glue

 .../bindings/display/cix,sky1-dp.yaml         |  102 ++
 MAINTAINERS                                   |   12 +
 drivers/gpu/drm/Kconfig                       |    1 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/bridge/Kconfig                |    2 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/trilinear/Kconfig      |    9 +
 drivers/gpu/drm/bridge/trilinear/Makefile     |    4 +
 drivers/gpu/drm/bridge/trilinear/dptx.h       |  106 ++
 drivers/gpu/drm/bridge/trilinear/dptx_core.c  | 1091 +++++++++++++
 drivers/gpu/drm/bridge/trilinear/dptx_drm.c   |  623 ++++++++
 drivers/gpu/drm/bridge/trilinear/dptx_drm.h   |   17 +
 drivers/gpu/drm/bridge/trilinear/dptx_hw.c    | 1396 +++++++++++++++++
 drivers/gpu/drm/bridge/trilinear/dptx_hw.h    |  109 ++
 drivers/gpu/drm/cix/Kconfig                   |    3 +
 drivers/gpu/drm/cix/Makefile                  |    3 +
 drivers/gpu/drm/cix/dptx/Kconfig              |   15 +
 drivers/gpu/drm/cix/dptx/Makefile             |    4 +
 drivers/gpu/drm/cix/dptx/cix_dptx.c           |  163 ++
 include/drm/bridge/dptx.h                     |   68 +
 20 files changed, 3730 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
 create mode 100644 drivers/gpu/drm/bridge/trilinear/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/trilinear/Makefile
 create mode 100644 drivers/gpu/drm/bridge/trilinear/dptx.h
 create mode 100644 drivers/gpu/drm/bridge/trilinear/dptx_core.c
 create mode 100644 drivers/gpu/drm/bridge/trilinear/dptx_drm.c
 create mode 100644 drivers/gpu/drm/bridge/trilinear/dptx_drm.h
 create mode 100644 drivers/gpu/drm/bridge/trilinear/dptx_hw.c
 create mode 100644 drivers/gpu/drm/bridge/trilinear/dptx_hw.h
 create mode 100644 drivers/gpu/drm/cix/Kconfig
 create mode 100644 drivers/gpu/drm/cix/Makefile
 create mode 100644 drivers/gpu/drm/cix/dptx/Kconfig
 create mode 100644 drivers/gpu/drm/cix/dptx/Makefile
 create mode 100644 drivers/gpu/drm/cix/dptx/cix_dptx.c
 create mode 100644 include/drm/bridge/dptx.h

-- 
2.25.1

