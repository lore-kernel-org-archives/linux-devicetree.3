Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012022.outbound.protection.outlook.com [52.101.53.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED071E1024;
	Fri,  1 May 2026 23:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777678317; cv=fail; b=On/WuclST3ui8vMH3FL7F41eCW5svID9MC5SVaiqGqtDiJKwgkEoKSvy5ZBjmNMZpJFh0tAcdEUYtq+O2aQkcW/8B3ttgDb8jfOqj52iHLoE8zfV1T90W7wACoovpzTxZGw/3ox3FpWv+ldQKeoeLnzdJCRBn3gF7TsFbqOz05w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777678317; c=relaxed/simple;
	bh=iM20yalbQWhvFYc1ARp0V8vqHwMaAL2cVFDSEGzfKj4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hH2JE4Ab1RBAJzZdE3XbGkcK41Ak6/UDuS7jkIP7DR9yWcnhYftx097LKgHCh6OpX7HJ+FAdzYpg0TjVEJC28fsyEQXObYwqWOcPITbmf+E4H864W93VCxqwIm5VHsZ/ppFJnM+n6xiobkpBeMk4I8X3uImY1PmIgijKziOHvZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Blygc0+Z; arc=fail smtp.client-ip=52.101.53.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Blygc0+Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/FmyBnioi/67FcWH1m8Aqwz0IChBTAHhv6hvD1Tb3nQI3K/w+LsGHWpVvD+Cp/ISZgHE0ZmcL80IhkCtPD5GDNpOb1t84vQNIEZYF3P0LwDnWZ25dkrZKruDQVa9XNm+Pb4sSGQsxNBHMjSwZxPn3abjgyD3rEUK0nqXiKkRt0EYzxS4IyZyDzOe6IjJHpD+0tZGl7mfu0zMIxvOBpwZe+yb8roYpdkULeutb7TkKzADshz1Rd+G7HG40xxeCzeBicLOkR4E3U/sFjYwW9jqeioHl7Z+jLFQBTmVILVtqcM4YC7nw0u8WFMFOHoipRilNFpQYOCk8vWvpS7wD34dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCLqdNIR2MQf+R76fpx+mK++eMcrpirTDum8bpyNsvg=;
 b=nvGlMh9PbZhBLsa48l5QTqqj6YJwYjM9GjMIX+tSO82XMXyfDOAIY1zqSFOz5LQiEfaqXOk7HIgFzxLZkS4oyGvjXKUwFDuyJMQv3aoHbVlidzKov0DNIuGeG6Qg9EluG6w4A42UdqFGkojNWMBiis30FzwuLrdRYkuLnOvDu0Gq0BtJ8myVhYzZPXkkVDiR0fgaF2lcqo5buR7Fhfk4M62482OCL6991h23r61DWaJj1fbR2hhRqxIMEkyQr6OiL4W8+V6RjlCZBk5GE9NzBa0QVUe69xGsiJwjeIkH6aUhWCOCe923gv2wjlf6DehlGNdcueuJdzhGK4aE2Az7/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCLqdNIR2MQf+R76fpx+mK++eMcrpirTDum8bpyNsvg=;
 b=Blygc0+ZcO+o/BkpYpJoGS2xAKDS2Vx4onfdrl/QZlsX0mgkOQSjQhNPFgHLY1FwyOUg7Txgfg3q4lCJ5HBvZkdwB3fQyO4ADWArzHkba1aegS8l0uCJkZzNceyo1bk5cJNU/NVG/bbkG6HbthOSlpOuZMqtlouKFzBunji0lr8=
Received: from CH2PR17CA0013.namprd17.prod.outlook.com (2603:10b6:610:53::23)
 by PH7PR10MB6380.namprd10.prod.outlook.com (2603:10b6:510:1aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Fri, 1 May
 2026 23:31:51 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::4) by CH2PR17CA0013.outlook.office365.com
 (2603:10b6:610:53::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.21 via Frontend Transport; Fri,
 1 May 2026 23:31:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 1 May 2026 23:31:49 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 1 May
 2026 18:31:49 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 1 May
 2026 18:31:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 1 May 2026 18:31:48 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 641NVmOL4174732;
	Fri, 1 May 2026 18:31:48 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>
Subject: [PATCH 0/2] arm64: dts/bindings: Add support for BeagleBadge
Date: Fri, 1 May 2026 18:31:46 -0500
Message-ID: <20260501233148.4180391-1-jm@ti.com>
X-Mailer: git-send-email 2.53.0
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|PH7PR10MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: cae6e7d2-6ad9-415f-8deb-08dea7d9d1ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	FbeHjUCPLNjBPTeWqvTZVu6XGyHXzmItnF6cURBI8DyXGMd/HU0kM8b1sN0maj3pUy7K4TusipHVNkttEKSCuJL4fM3mTR7hDDu0RIg4BZ1cZ2Fls6aHInY7GuzI0Dx1dDD9PIZg18tdHGQ6b/S3WOLgnWAJyE5QaTvNbShRY4Adz6UgTB+exdJwOmUethC0EilWJrnHdfgFBajmEz0oB/SR+/MSe5dy6ViCwncuM+RwI/7EaT6FXrGBlHU7jVZxkXipHCIgb7XkEx9tb5nOaCas673E2u2pqG0d4mqonPeB+UKUkcL2xkDvHMLLcyEvWfd9INypyeIz1v/MPHzR8YOpMJDq1SJt5AER43qq7Ak1eKjw4Kz9T5e0tXZsgEMqmR2htxxAW76kzFFDkyHEamK2kaMtPjnmdoyq7Zu8advfAAkiXiIFsYnV1CjTaQjCoCG1j5ZFRvw52rgkxMiKIiGoG6iNQD1/lRM2AsP7mjKAVGGHCDiYTGPTD49iqIWtMJiqp7TCkl4wvVz0qAkS9TUWErEOM2VjzaW0u4Ah3sdpZv9c4GpQKsj77jPDc5Zxeq2n6oriy7rQNkAqI5r/Hr3ocjUPELNUGzkb0lPTU6DxOddUZtgfVZUyaKOQe9DbZZiKl83jfXwMCLCLYRXH9mhdn104I0NEc8wK6bye1Kd1b+RhsSacMp7ydEKdQ0y7
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uDs2uiJX+ZOSbkvnXX3uKHpVD4f+Jc5QqWxF6Nyup5+oH+1KMR4aNQ4++RR0LP5Z9r/kysgSzNU4aQem+gQcE4p08Njn5enyvE0hS3j1yfnYnguKcaE20pCdF2dlQo5kR7GSFvKAQEWTSikd8WM/SlibaBRnVPoFdcOVOCkgJ7e8n6ikjKXzAbwTcLKoAIPaf6q6Zj/8tpC3KChkoCl2BbDSxa2FxnlSk8clCgWLjnW4a9wT/C3MUVWL1vEWcgTWo7nzerzA/zXwszHe+C0smSxkfPS2Ak0ectZs86+fEsAJC9LNnfUuM3qwDlinvMMJoyox3wYkFWZ834y2jKJoTblLtqEOsZ9nror4eQsiIisVOgrDhJOupUioD+ih5xntK21JcddeF3uFABR1Owi3b9aeHtDmhYRM3gVZsAr2OhLUJnBoajkyNeg/gniXH6kT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 23:31:49.9593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cae6e7d2-6ad9-415f-8deb-08dea7d9d1ac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6380

Hi,

BeagleBoard.org BeagleBadge[1] is a compact, affordable open source
hardware [2] single board computer based on the Texas Instruments AM62L3
SoC designed for IoT and embedded applications. Add base support for
the same.

Bootlog: https://gist.github.com/jmenti/d85f17bf5264f1364866df91e60231eb

This patch series adds:
  - Device tree bindings update for am62l3-badge
  - Device tree source for BeagleBadge board

[0] https://beagleboard.org/
[1] https://www.beagleboard.org/boards/beaglebadge
[2] https://github.com/beagleboard/BeagleBadge/blob/main/design/BeagleBadge_RevA_V0.7_SCH_251107.pdf

Judith Mendez (2):
  dt-bindings: arm: ti: Add am62l3-badge
  arm64: dts: ti: Add k3-am62l3-beaglebadge

 .../devicetree/bindings/arm/ti/k3.yaml        |   1 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 arch/arm64/boot/dts/ti/k3-am62l3-badge.dts    | 655 ++++++++++++++++++
 3 files changed, 657 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-badge.dts

-- 
2.53.0

