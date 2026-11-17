Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.80
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794897962;
	b=jCfo4Tx6saQGinLlB/+sX8Q6HthIv9bmHB3UyxSP3FMvY/D7XhYtcHy+XuGi0xPn5/0q
	 fh6/WBsgglflKkyXo/vnuD5FuaGvQfbBFbn7mEm7axevI+qLh0dvl5NHTvaBX+IOdXZmw
	 2XgvsHPM0/FrfGQpX7M+oui9sOdOVh4IQl3D1Nz7Lb/b/ThgFtDEcRr9yBhRkOGsDNone
	 xvyPDXP5ekV+W1ZgNBKPMGqR0U9uZRp0Br96V81m7aybAPMjDN4PhFdlgUN/kGGZ7rTpq
	 BswxPZjwYpfMfQiFpQ0V5jAkXZEqPFJMQa9EVX4Ib4MyKGTdBGUPWRTwUJ93Df1PIsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897962;
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
	bh=aapHm2IXEjvOI7h0VWGqC90S60nYC6XZC9YhuoaBFP4=;
	b=dyWGGDM9TzqUE5X4wja/mfkNaw3ZDKIZ11QaSxWfxHGLhhOhPOACvrzroB1FDQw4nrLn
	 uMwRBd+/ZXuE80z8hO038DnFbPGwprf2uisRhgmBxMH7vumeE4LQ6VivXFCH7g73P2c7u
	 ssk6OVBH5na3pETHDG60nZXekAzbCtuSgIWcU9Khxz1u7xYRWBMJFM0xvuiuYj3WXQXb9
	 ZQaGNVYXFMAaJVQ6dgfyfUpAWIaP8z0zpbrdgIeHKFP9wQCnPI7knkEVGXKNw3wBNSG+O
	 rbj/AhRq6IrypKe2pxkiEvTOE0aLgWmaQFSAFFM/+LGHB3XzRYUkGXQvOUXOU08xgxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.80
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023080.outbound.protection.outlook.com [40.107.44.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4819E606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4819E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMaOHKD5Cu8G+V0zeHkLHawCo6tilk+fDWTMiLFVKY0oNMC3gZI1RUAzsjzLyDtFZnrHCDJY7fHV8diDWDL9H6rOKsBxZru2HlBBjylfOjU7/32+YAlLe/ADG4leAKy7Sd6Zzx51FbnsWu2m9AMtKHRKAtojwczrfRrIS1NWAXKOtU6glTTmxZwytxCBHw4VNkW5JTbCi4i2eNCoXG4IRnDCUJEvpeMq0QSgP01FYBH4Tfj2gBBOchQtlg53vBlMyej45WZhiLrUG68Rel5tk9xGRLiSdlKx4I6o8pTU+U9kmQsu9xxYmZ6l6hopw5qFd6OxICTl4BUsww763S47MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aapHm2IXEjvOI7h0VWGqC90S60nYC6XZC9YhuoaBFP4=;
 b=HwVir24JdHNlrOA/+rDY8zho84fagcQ53Rm4Q83JyMOt0DblT3fyVl26ucvKPF1lw+/seWML13rT/hN9S1+2B9KkrDdHtAX6POiMbzRr2idhnJm0pRRFpGwLJkCMcVTtc1Ga0eByN0c28Z/VFLBMl5APcGDRtCoNEhgAlv1WRlcDqRbXC2/K1RSsNBQayAs23lGe5H9fhrrCocMC01wy8dOPv6mXqoZHFBp/qwc7Xed7uB1f1fP2y7qjEkNp2aRsQJrdSoIm4q3LKLSt/30HVuyQvyRazzi4EsEBTsKp/EhmwlTtIjQrWRXnzN7OOA5231kGrvzAOmxLDlYHUl4RVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUZP153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::8) by
 JH0PR06MB7108.apcprd06.prod.outlook.com (2603:1096:990:9d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.7; Tue, 17 Nov 2026 06:45:55 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:301:c2:cafe::5) by PUZP153CA0014.outlook.office365.com
 (2603:1096:301:c2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.3 via Frontend Transport; Tue, 17
 Nov 2026 06:45:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 06:45:54 +0000
Received: from localhost.localdomain (unknown [172.16.66.33])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AA5B4427EFC5;
	Tue, 17 Nov 2026 14:45:52 +0800 (CST)
From: Luo Liu <Luo.Liu@cixtech.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Luo.Liu@cixtech.com,
	wuyi.shen@cixtech.com,
	cix-kernel-upstream@cixtech.com
Subject: [PATCH v2 0/2] drm/cix: add Sky1 DisplayPort transmitter
Date: Tue, 17 Nov 2026 14:45:50 +0800
Message-Id: <20261117064552.85256-1-Luo.Liu@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|JH0PR06MB7108:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b19c7bb4-3220-4fd3-4b57-08df44766d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|42112799006|1800799024|82310400026|36860700016|376014|23010399003|18002099003|261009223027099003|3023799007|5023799004|56012099006|10067099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022075727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	pRRJ3SgxLNT6g07mcqbY1nr9BpsVmo/5DEDeuvpT0yTUJaLaEX5ny07D8zLT8c2hXhNcPszAUMg+Liq3Amccg3rixMFjEDTPlvpi5pUXMDZYV2mVN8l96oPGc2dNQ+Zv4QFvt8OYv4BtonyC4GUrVQW53v/nwN6gJWtw9eAGkz1vKdrG8rT0NcefdIWIc6SfklVU4e5G7TEZz+AGx/egogGNjloUgulJoo2craWQOdHmDsnoExmPND26cSNu4o3mLudDXAw3pG+AujJnz9PJroPvDI7aUu01Gm9Sfi/9IBtUIiO1N8VlvH5MPQPDz4rT7PL7+/E34G6m4ztR5WcpCcr3m5mAkL0rKxDGskIMjpOUK8f9VoK4ClOs1JhPG0wmYmujE9oDfQcgeyU91XVuiMxHQf8Trtoga2O6rXmGGUpW9cRZ1vaXt83hkQFPsD50QY9+QGKYp+NINhn67CvJQ7QZdpmKoTxLla8QMhqwICS6GWddbx6dcgJt7SsxUwrkLsVfzChKq/0wXS6ZDLRjtIaB7zSHkuTFWDUuzQlG6P/T4VC9F6NPAkJyAHxPpMhbvwDAwk4alURinuWIXcAOygYIYxtSBboisCvUuLHBfkZQKZ3pJgk8X40QKzkeIDgd0ATXUJIc9eXnbck1YRa7olec/EsgnHra8VAiI0OBcJN769Z9Qh94Fq4b6gbygC01k2mQVziQxU3Sk9DWpgfVqQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(18002099003)(261009223027099003)(3023799007)(5023799004)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022075727099003)(261022105027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/pWyEJc+fnOF4095i3bLSOMUxxbJyk+1JlGqHPIFV6tbrxlEGw+yzYwhQ1W5hjBDb8kHcJFNcKvzMuGvPAizo3vg1oP3zQ4PYdQHfKSkc25ZroQUIEWpS3CzU8qQ5xWS5qFBhswGMBjDKw5kjmxAxGsJx+zxcxXpBY65okToYNhK0k28uaqYiBCleZiymASZf32lJ63c1lqgaJp+xw+o00u1lQh32a4VjjMqv3bSQRUgrftZMdVcNfQSiZ4KDvn12Hl2NCIhYUyoTd3D4+Wt9toeKLEsnZwgp2ginV1wNz1e0JJVOHGdwrdKT+0/RnQvj/FRjEAFCuodWMxP/Fhj/Zl2k23TUeWhG7LBVtB3aeTb6gDLH7qaGWx6i2XgrUwQjTlpambExji7aJTZIHxwPvA+stx1ctS9CYgsPkN1BgGeNcWULJGcz7t8EaUjj0j2
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 06:45:54.0409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b19c7bb4-3220-4fd3-4b57-08df44766d6e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7108

Add the CIX Sky1 DisplayPort transmitter as a DRM bridge. The USB-C
transmitters and the native DP/eDP transmitter use separate compatibles
because their RCSU video-adapter layouts differ. The Sky1 devicetree
nodes are not included in this posting.

Scope: DPTX hardware and bindings only. Komeda (the Sky1 display
controller that feeds these bridges) and the board DTS are separate
series. Nothing in this posting wires a full display stack.

Connector handling in this driver:

  The Komeda display pipeline (ARM Mali DPU on Sky1, posted separately)
  calls drm_bridge_attach() with attach flags 0 and does not register a
  connector for these DP outputs. This driver therefore registers a
  DisplayPort drm_connector from bridge .attach(). Detect, EDID read, mode
  enumeration and validation run through drm_connector_funcs and helper
  hooks on that connector.

v1 -> v2:
- Split the compatible into "cix,sky1-usbdp" and "cix,sky1-dp", and
  rename the binding to cix,sky1-dp.yaml.
- Drop cix,adapter-port, cix,stream-id and cix,dp-max-rate. Every
  transmitter uses stream 0, and the maximum link rate is HBR2.
- Require phys and port in the binding; example follows Sky1-Orion graph
  (DPU pipeline@0 to DPTX, USB-C dp-port PHY).
- Keep only the documented DPTX node in the binding example; reference
  the DPU and USB-C PHY through phandles instead of copying their nodes.
- Allow COMPILE_TEST.
- Serialize mode selection with link retraining, and roll back the PHY
  and the IRQ disable depth when enable or resume fails.
- Pair phy_init/phy_exit with host_init/deinit; use phy_power_on/off
  only from core_on/off.
- Stop active streams before host teardown on remove and shutdown.
- Match YCbCr 4:2:0 against the original CEA mode, and avoid a 64-bit
  division in the pixel-clock adjustment.
- Initialize train_done before the clock-recovery and channel-equalization
  loops.
- Serialize sessions with a plain mutex and AUX with a separate lock
  instead of a hand-written recursive lock; use ops->session_lock in DRM
  paths and _locked helpers for the internal steps. Document the
  session_lock -> aux_lock order.
- Roll back the bridge enable path with an explicit unprepare step when
  mode selection or stream enable fails.
- Poll the PHY ready status with readl_poll_timeout(), check only the
  AUX reply field that matches the request type, and drop the redundant
  DPCD power-up retry loop.
- Wait for AUX reply with readl_poll_timeout(); register devm teardown
  via devm_add_action_or_reset().
- Document INTERRUPT_CAUSE read-to-clear (Sky1 TRM).
- Use GENMASK()/FIELD_PREP() for adapter format fields; drop unused
  link-training parameters.

Luo Liu (2):
  dt-bindings: display: add CIX Sky1 DisplayPort transmitter
  drm/cix: add Sky1 DisplayPort transmitter driver

 .../bindings/display/cix,sky1-dp.yaml         |   99 +
 MAINTAINERS                                   |    9 +
 drivers/gpu/drm/Kconfig                       |    1 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/cix/Kconfig                   |    3 +
 drivers/gpu/drm/cix/Makefile                  |    3 +
 drivers/gpu/drm/cix/dptx/Kconfig              |   17 +
 drivers/gpu/drm/cix/dptx/Makefile             |    4 +
 drivers/gpu/drm/cix/dptx/cix_dptx.c           | 2434 +++++++++++++++++
 drivers/gpu/drm/cix/dptx/cix_dptx.h           |  408 +++
 drivers/gpu/drm/cix/dptx/cix_dptx_drm.c       |  771 ++++++
 drivers/gpu/drm/cix/dptx/cix_dptx_drm.h       |   16 +
 12 files changed, 3766 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
 create mode 100644 drivers/gpu/drm/cix/Kconfig
 create mode 100644 drivers/gpu/drm/cix/Makefile
 create mode 100644 drivers/gpu/drm/cix/dptx/Kconfig
 create mode 100644 drivers/gpu/drm/cix/dptx/Makefile
 create mode 100644 drivers/gpu/drm/cix/dptx/cix_dptx.c
 create mode 100644 drivers/gpu/drm/cix/dptx/cix_dptx.h
 create mode 100644 drivers/gpu/drm/cix/dptx/cix_dptx_drm.c
 create mode 100644 drivers/gpu/drm/cix/dptx/cix_dptx_drm.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
