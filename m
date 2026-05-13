Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010029.outbound.protection.outlook.com [52.101.193.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ABB3CCFDB;
	Wed, 13 May 2026 23:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778715295; cv=fail; b=Dcf1wytQhwF3km6aZHaWFbla6Etj1ag63SmRngGHNrkB4o6zVm8ahcqg/PdjfbbURNg9j5MegpNKRfjR8tmGuSzqICuvf8uc/c2qeJLTS/qMLq7OiXgqv4Pdo6gwFbXQPQawgE28X8dibzt5P7Us7Fm0PEwByfna2T41Jg496dM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778715295; c=relaxed/simple;
	bh=i8fiIH7kTLgfZNntxkahUl5LPsUq+uaEpDi/biLtD+w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mRpUgz+uezB/txFIsrMKvCPFXfoygp3eDiO+nqw4CzwIgkQzmtL+dns9gZaBLeoSfwXUq15gTssdt8kP9LAzXw9u62LHHfI7YcPWigCtnxzW9AJXCp77vGQ8djCG2BZNx2cU/2ELrL733nWEcyk8jhVYfHwzrDqAWqcdl1XekYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=m/M+bYsB; arc=fail smtp.client-ip=52.101.193.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="m/M+bYsB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4PYoS6ddJuZ5/gWcI5HOwS9juyJ1lTWt9ZLzFD+HHcBzurjhWcH7wjCVUUsX2iPIOspKvoX8gMPf789HoxBxd9oQhomVy7pf/1p+CwOSsr4UTSRBUXnfg8zpIHIPWFmDsYEzOItgWBAjDCJXyHiyga/gOC2Zp+ErvQP4IrxAK55oD0kBcT2udjg/a5djjUCmmoUi2S5jgaM6SHxidKTAhpXSLMuSp8vBHGZJlhnF5AehA79ePtQ1klbQo8vpua54Ht1fBd3ofiX/Fe65kUy1ZDYXXkjv9JbsfSj/Eq6SoemcK9CwRe80JjDL+AJwprlHadB0OxoENm1fA+CPUpBoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xs27BI2E0WDGFV9qen9baKiSJRiYqCmVH45VA5V+4dM=;
 b=ODLaVMb0sVd+2UvxXKZRkrk/htjiORLeOws/VynAazaT2yxkM4e23xUKi0aNUIXfdC1XY6IQye5KH2ne4/+VFMNn7fuy0yZYyAtUR/BUbrOuvjhXSn/rDzbD8IZDQ6OhHcmGy6ICibiKYmXbjGLFxieYKJAEhHxTs/AmoQguYqIdOrUtdcXmq1bWWerMB5odd14OXvT6VYgZnOEQqJTS4s+d5oTlD+svIPZDypoWlbbiA722KArhh2n6iLEaJ3TwsDorPTboh2o86VmKjz6NQSOOfS/LLQYJegSI0qFZp3XuecZvTG+PxEmoiMaU8Qlpwgn7LYabc0dFq52lVvennQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xs27BI2E0WDGFV9qen9baKiSJRiYqCmVH45VA5V+4dM=;
 b=m/M+bYsBFrrR3USZYjn0Qq6TV3MnLjXOkVodrRvd6hHaRvlBFdqTiVrPFeUPrjQKUIHYxx7hAk7E72A9ACiQsUmGRO2nnsClKL5hpnaMzxsLRgAihnaier/SoiZGZpzvuMiH/5/ESMZbpqpvvr2L7QFjVyKF+395Z1psX+FA1m0=
Received: from CH0PR03CA0092.namprd03.prod.outlook.com (2603:10b6:610:cd::7)
 by SN7PR10MB7032.namprd10.prod.outlook.com (2603:10b6:806:345::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 23:34:50 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::fe) by CH0PR03CA0092.outlook.office365.com
 (2603:10b6:610:cd::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 23:34:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 23:34:48 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 18:34:47 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 18:34:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 13 May 2026 18:34:47 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64DNYlSO499089;
	Wed, 13 May 2026 18:34:47 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>
Subject: [PATCH v3 0/3] arm64: dts/bindings: Add support for BeagleBadge
Date: Wed, 13 May 2026 18:34:44 -0500
Message-ID: <20260513233447.2713737-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|SN7PR10MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: d3a1bf70-328c-463d-ed28-08deb14838f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	NzAI7dwuCO80CwsFWRfuPMk3TEVuEjt9SxThwsHZiovave1xdkBfb23yTL5SE9mmV1Enx+aVAj7K4+1IJ3ogLaw+BccbGhpBCVFjjxOgH8uCdmEADqvyyvvBBWHzgdDj1+tjkihPRMsWMgcU3nfLWJ1IP2Yh++QMIK0Yddf5oGGzMwiFFFWjIyXjcvSX78VecclUVTKSWoAR117Nseeflqqu333nDjC4SsLxH1wcYsJ22zKC9SidWEtwAGAiI1P9a/f6qGT3ZCW1u6WtUyU36RDuyn673bg+bMoiImrX0sqVqsAZocuklnBIVybpizMZ6+YfRR6pkQmFWG0VRUso0kw1biUEO/G0FDrnMSo+UO2h7HLCG3WmTYiYmvWObs1XlmojlJNqE5O67dFUFx+02twUGdAHGX/1VKL9Up5sxrV/GiE/9aMxavOG8I8lOYiE/fF7obQ6FCxzRASUotlW3E/6cOsIEJMkMe2WLQQ8oSK9yDDPct4BkT9f0E55+p3LYeFCXgA/oycxU2zCQagABrNUZIlCDBLyH/dcvtwIyFQdfrzTO5LkKOxsnDoxEj2dE+rV5S9gRqWMRJUXb/R1t9P3JlVLSD4hWNSSeSrD46W6eCb/i1W9uztOdDPtwyHL7YtvtM40Xu53oZ+6HIDQSkCzKDClO1IzqADws6YM2rluKeTf/Un+VKSrkQ9MAvyE
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u4jstgbx29Nc4TGXIysZToNiLOfELDoLrfRvliYSKuZO0rEylJanp7iWlkn3S7/MlEfck3mw6vVRUXCxei1K4oPWkNjr8u/EYZTRyzl0w/9SiVzVWh/hhHSyluJWObXdKQc1TqjFm0zlMdtxBg+xh4zys/xfbMtLNolcB1mBx3Th27TnqD7sp0N2W8iOaC4fnmCzCHXHTHLdLaSscz276ucCA9sa2DjzP2LJsJfq550c9EUqSlO5fZeQsRuRGkeIVDwYNa/VRpMq530pqCjPH7XFZ3kaMBva+7N7STKqSxcpWrIGAoX5Kx63X3PDuCRqKJK/ca/zUMgrrIXAceISVOlxzQewh/DzjnOrdvsore1bB97XiAVeevNg6lMiG474S37/Mg0XdX/PLD8k5DL6yW0aTJgXFkqiXgPMQG1xS8iEgINCCQcxB9pBY/sK/Unu
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 23:34:48.3590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a1bf70-328c-463d-ed28-08deb14838f5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7032

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

Changelog since v2:
DTS:
- PWM period: 255ns -> 10000000ns
- vdd_3v3 vin-supply: vsys_out -> vcc_3v3_main
- MCP23S18 reset muxmode: 4 -> 7
- Typo: FUEL_GUAGE_BATLOW -> FUEL_GAUGE_BATLOW
- sdhci2: Remove  #address-cells & #size-cells
Defconfig:
- Move config options as per make savedefconfig

V2
Link: https://lore.kernel.org/all/20260508230341.1891450-1-jm@ti.com/
V1
Link: https://lore.kernel.org/all/20260501233148.4180391-1-jm@ti.com/

Patch series depends on:
Link: https://lore.kernel.org/all/20260513231154.2703292-1-jm@ti.com/

[0] https://beagleboard.org/
[1] https://www.beagleboard.org/boards/beaglebadge
[2] https://github.com/beagleboard/BeagleBadge/blob/main/design/BeagleBadge_RevA_V0.7_SCH_251107.pdf

Judith Mendez (3):
  dt-bindings: arm: ti: Add am62l3-beaglebadge
  arm64: dts: ti: Add k3-am62l3-beaglebadge
  arm64: defconfig: Enable drivers for BeagleBadge

 .../devicetree/bindings/arm/ti/k3.yaml        |   1 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am62l3-beaglebadge.dts     | 700 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   5 +
 4 files changed, 707 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts

-- 
2.54.0

