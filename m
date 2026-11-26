Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.110
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795672812;
	b=iSuTs3zffQEgCuvw62aVvm1j/nDGZiuYzqJLxDh2Uc6j0audHJuujV1GmPQPsncwiC1U
	 UADSf8/zSYUJybL39zYofRn/hZr1IwjoOKHQjjZlLQlaeGSNFzJq9n/fq09dicHFye+K+
	 oPDqU1bvN93mNjqJ05OIp+wZYEA+ilOl2/8ZiDlclAKLfipGulUrdCYQ8XVCbEDamGHmv
	 7CbaVeA4L8+XOVSa6ieh3vGrmA450fn8ZfLjmf3NSdBPgzmI5ulHc+KTyKBzvAgs4I99H
	 8LbxbOKAj07gwTnD8XcDwHLVrVYJq0hXAuJvqmTMx2g921FCNmUAvPjkWSYW/llSiHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672812;
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
	bh=16Xsm6XLZ1AZSc4+qMVRk3gVPb93nYWT6NQendcm81I=;
	b=jYp+7HejKzfYD/M4TfPk37NG5iwjCR2/Ks8Mcj93FtUtkcYGRHN6034h5RjJ8G1rKaeB
	 oCLoQZX4ieDQui7TuEA6SRMnBtp7UQ0oV5EvZA2k6T+nCChN7kixDaHhMvMBFLRQF6no+
	 ckE17gEyKK5RcK+Az4u0AxikdUgUyiy/axDS5f2ObYfGxpnRq1EDUaORWt1yxqXVELrRe
	 pi5aU14kpDEFhC/YAO1GDjip0gdTPK4H5H0DPjlbqy7JU6hw4akAVhamSAlEmkf7vh2TI
	 Z4seAAVmwm/YRr/4aON37u4JwXBYMqpMTkbbrB/LivhXHSMqbBDqHBZ6piCUGG12IYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.110
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022110.outbound.protection.outlook.com [52.101.126.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987F6606A329
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 987F6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAm082y09vdA3ACCfXHLnNILBpGbuiU8JePSAysuvmNug4UT+wCmmVy9lHGWbPWEOn6+YiJLAEGcp2Jcje2pmtgWznGF3bxsrNnziOat8qRHxtMkeCSmQoBxgokyGIZAtPWsAtbgGX36pjPKVj4SIuiYtiRTIEFH88Uq7SIScEEHaGrxWX75ARDZOBTdGS2xsgH9uqYpFK9i+1MxcUUXOa09FXdZWSQEi4PEteWE5VrnCWQTprdFWKf7JKzVunWDWujc5ZtvYBkDYk4UmbCAcxZnvYEQB3KiYXu6pbJaCzg+ITDjewtaGzVJgmhfkZ4mZNOxR/JOQtcRKMaGjSpifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16Xsm6XLZ1AZSc4+qMVRk3gVPb93nYWT6NQendcm81I=;
 b=ACOOT5hrUP7mXA89cSaOeaIW0wbzyOkqEyE/RxuLZzTwQLxma0sMx9xol22TpK6y5n2NrYKHleOlExZGu3xc9MY2TfdjG3VJOlAnv16USPZjaN4E5HYOsgpwRmRRmnqY/+l0M/RUZZ4CllzCS/4/i3Tt469yWHOuzG+joNpTbznr94u1gfDW+DvhQP7+XarOw78/LZ4TBpx6v+C2CppoGeURNB8lF7N1jMbDDThAvxppBIeV378a4lMXOOc3RY1aaLWRbZS94ByYyO0Zeg/03AZj1rWEHdSzrM6OvkgT/I316aNzYEbJkmtJo6dNV/qORO2KTdP6S5wfG3/CKkR3aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=bootlin.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::15) by SI6PR06MB7269.apcprd06.prod.outlook.com
 (2603:1096:4:245::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.688.4; Thu, 26 Nov
 2026 06:00:07 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:300:58:cafe::90) by PS2PR01CA0027.outlook.office365.com
 (2603:1096:300:58::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 06:00:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 06:00:05 +0000
Received: from localhost.localdomain (unknown [172.16.66.33])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E2ACD427EFC0;
	Thu, 26 Nov 2026 14:00:03 +0800 (CST)
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
Subject: [PATCH v5 0/5] drm/bridge: trilinear: add the Sky1 DisplayPort transmitter
Date: Thu, 26 Nov 2026 13:59:58 +0800
Message-Id: <20261126060003.3979478-1-Luo.Liu@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|SI6PR06MB7269:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ad1eca31-f5a1-4e5c-6431-08df4b828528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|23010399003|82310400026|42112799006|10067099003|5023799004|56012099006|261021121427099003|261009221227099003|261009223027099003|261102130727099003|261009223327099003|261009221727099003|261009220027099003|261102123227099003|261026121527099003|261022105027099003|261026140227099003|261028144727099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	dMlZLvIj+L5rL6KgUuR0SbytS1UrqP5Z3zKBYXF9DSf5ImIGQXTwtFUR5MbUxEo8ZGirT7JDeRVxbsf3/T/Vn4m5jzibbKax4raNIHGFF7xllf7ivyt16XGxJqyw5bw2JgK2FC85mPB3ko2uU3DMIa/Xuklw7/c92Qfo/uBnPEPBya+3gaIIDax+6X6q5bdtvmgkvLi+PlErx3n2JMO2Mm/qRQB1nQWt7JFQlygQjmKt3z/gQOTOm/+E/sjrdozjejn8aKlib0C0Ltbe8b1vSVgHuTYUTQfaOnJNzDk2cTuKIixl9VfZqINWHF7PdWjTF5hcRtGHClhKhsOBXmAA7a8B3+gAZ33r9UgeaeV2UsKJwfTJ1hnsOeXmqpoCuw5l/KR4krb80wZnPgJnIzATtuy70ko/8CZNX7Tgo8HpqbC4yqiddZ9OC+zMcem3h0BnJmNcoztuO+fmN3Ir7SN+oY4Lm3VVql4xeqylakQDRk76UAoDPjo8oos6AfWbkl7UWbrYzXt2/ybjfDu/Bc1yzjF/a8ccAJt9/8dB4O+zWJcwAlFMaq1utRtQnIIR0PAAiPJPqsLEjrl9WuREgzYAxTGR/37AU80TSc5gdEIlAjxuSqq6chiRCMSMoAFOgKP6jXS+oZydi9+RMGi3gZ2cQEFE+xjy89pWm32UoX9IM6j+K2aSg5ziWucW+XoZXHFIR9FfNYAS310F3PfLMW69AA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(23010399003)(82310400026)(42112799006)(10067099003)(5023799004)(56012099006)(261021121427099003)(261009221227099003)(261009223027099003)(261102130727099003)(261009223327099003)(261009221727099003)(261009220027099003)(261102123227099003)(261026121527099003)(261022105027099003)(261026140227099003)(261028144727099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i0CfDGb7iYZ1ermTpYTqmEKKmLNR46CxOwuMPtBITgjx6IeAM8jz/xMOAEmgN4OgiyAsdGV34hZ7h3ya6IyzOeGPW8AiBJRxlcbYmxdAsf9Ynvh7s82u8y4R3KQ3RTampPBCzkY6Zs3BN8N7hCdi5kry79q5TWqm/dKzvZG/SjzhJ27+1XZIsBGs3mVmS3lZ1gcfjOiacfJnm8jJma2L0Rtu0DVPwJAlpZaQBHVfBgeRcF4t6rWlQbfuCrUjST/qt5zJfMquZVBHdHvRjsIGdwAtwxg7o3Zi7QsvCnJCCcr59pvxpX2id6LbwRTca99Cn9jPt3tB7YUO5a+PrCC6qjaOyhaAgddb6g9cAA2C6FDBIZXhYFnfiU0/W/HaziB4qIs/VxxZHe0gRoFnChTDNLBL/An0y9tUagkMBYHFLdhyYKL2hcuxVR8QElSpqxhk
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 06:00:05.8000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad1eca31-f5a1-4e5c-6431-08df4b828528
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR06MB7269

Add the Trilinear DisplayPort transmitter as a DRM bridge, with the CIX
Sky1 platform glue behind a platform data structure.

The hardware layer, the DRM bridge and the core state machine live in
drivers/gpu/drm/bridge/trilinear/, so other SoCs using the same
transmitter can share them; the platform registers its own dptx_plat_data
through include/drm/bridge/trilinear_dp.h. The transmitter drives up to
four lanes at HBR3 and has two SST sources. MST is not implemented and
stays disabled.

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

Changes in v5:
- The bridge no longer outlives the platform device: the release action
  runs after devm_drm_bridge_add(), struct dp_hw is freed from the
  bridge .destroy callback, and a released flag makes detect and prepare
  fail with -ENODEV after unbind.
- The AUX channel is initialized in dptx_hw_init() before the host sets
  its power state, its name is allocated once with the bridge, and it is
  powered down together with the host.
- HPD reported by the platform is only accepted when the SoC reports it
  out of band, notifications generated by the driver are marked so they
  are not fed back into the state machine, and dp->status is updated in
  the same locked section as the connection state.
- dptx_pm_complete() replays the deferred hotplug, dptx_pm_prepare()
  clears the forced HPD state, and dptx_host_reset() disables the host
  again when the PHY fails to enter DP mode.
- dptx_bridge_mode_valid() no longer takes the 4:2:0 or 4:2:2 bpp
  fallback for sinks that report less than 8 bpc.
- The core owns the struct phy and drives it through the generic PHY
  API, the exported API carries the trilinear_dptx_ prefix, and the lock
  helpers are replaced by guard() and scoped_guard(). dptx.h and
  include/drm/bridge/trilinear_dp.h are added by the bridge patch, so no
  patch includes a header that appears later in the series.

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
 drivers/gpu/drm/bridge/trilinear/dptx.h       |  112 ++
 drivers/gpu/drm/bridge/trilinear/dptx_core.c  | 1080 +++++++++++++
 drivers/gpu/drm/bridge/trilinear/dptx_drm.c   |  713 +++++++++
 drivers/gpu/drm/bridge/trilinear/dptx_drm.h   |   17 +
 drivers/gpu/drm/bridge/trilinear/dptx_hw.c    | 1379 +++++++++++++++++
 drivers/gpu/drm/bridge/trilinear/dptx_hw.h    |  103 ++
 drivers/gpu/drm/cix/Kconfig                   |    3 +
 drivers/gpu/drm/cix/Makefile                  |    3 +
 drivers/gpu/drm/cix/dptx/Kconfig              |   15 +
 drivers/gpu/drm/cix/dptx/Makefile             |    4 +
 drivers/gpu/drm/cix/dptx/cix_dptx.c           |  173 +++
 include/drm/bridge/trilinear_dp.h             |   74 +
 20 files changed, 3808 insertions(+)
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
 create mode 100644 include/drm/bridge/trilinear_dp.h

-- 
2.25.1

