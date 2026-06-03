Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011058.outbound.protection.outlook.com [52.101.57.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC8D481248;
	Wed,  3 Jun 2026 19:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780514623; cv=fail; b=u2YEZciUd3a5caVc7eOuiGKO+rOCav4fN5YwoMpo5dySuJQND+te1YUwXL1yFVhzCTOUHQCry8TMGWnObpyjOhyByIBMcyp+zddoUH3GKyKF120rQxrM/cUeDagib+4HohUWHkRgTKIt/OF7XPUWMbrgr4H0QF5oU9dYjn3/9SY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780514623; c=relaxed/simple;
	bh=Jl+xiD41cZGkv9K1ml/wD6GsCdTkF7AJCogPysRc98I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lf5dh559VQ/E9dZdO5NOt+0tpTGvfoXdkESKw8LDzNNdijj68/dI97ftZ9k435z6EEjksurgTm9JXl2YjAlULqASn4awYsmdVCjSka8yBcx5LYmbQEtUmi2hydnC6+dxkeA4G344CMKPXxU0Mjhgj5lX6EuGHK40B28oSaETvPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pKjW4uVr; arc=fail smtp.client-ip=52.101.57.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pKjW4uVr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9Z9Xk0PSBrkcy0ho/QL+ZKxpQa3jmyoyi+8csGcM9ONfeX5eiKr/hW2HdzUSrAmESSnXFwnk8A+/rVzv6PRqe7AF31VPBL1WmzSQa/8RyUb+sj5AXghtp+Szf95RNSIYEU6H39LpR0uUTw85wrlkqguD4zrrT2NBj4sBe/iATD2vcQ3BWmY+cIbb7Aj0X+6OQpZ7wd5SEgI4RbChzFMWuzHD1xdIJb2CdYA4olOhLg7J/QrsAhg6RaHYfsvN3EsP4I68xultA5VZ+qYBmpKDTc++k9zQ4hsxrFW6uJmt3XXmjzmUAahqYTRaQIqEgWNWPzpwTMZ3UL3+fQUIgYpaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mA0RhPBApekQeKhZDmYSmI2y5UuqHThAUm2Ab/gek40=;
 b=Xk6cFvUoUDgFe30jIR9AuElRK7ptgFvhQ07rM1ogb4UbtChMW2U0ZJTptSig+F55QejoMce3wJUHW9OKUDcLF0agBc4bftHhEdpq9mbjGbGw6oJINGjGys3Fbh8V5CrtrBJuFMgdqYOC8Rmxu8wjiWKOtGcPeEVHjWuDv38lUEijm2lO52rQ6DC5udXicskQ1sLPmAzxomdSyM0SV5Xh3PMxiZ205WwuKvCLsFZFq6C0/2HgA1Dw9wouz3ycUhUXRSgiLJyQUnq5XLy+49T7L9zatQ3SL3YbNcqNW7qjjR8IlteYx7dgdvUc6BPQ8IEdhh3XFEMxcgHuPauL/cPobA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=microchip.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mA0RhPBApekQeKhZDmYSmI2y5UuqHThAUm2Ab/gek40=;
 b=pKjW4uVrActS4251v8bMYov7CyyHNkyazLGchPwiTRK9UO/REhEMDj2OdmuqikWj0KYcETG558ogS4ApCXYVeuwI9ctWcJAHMpHEJEtrTBEsGNHgH8eiLcFW+K1sjiXkoIerINIUa4IvP5M3nSvLIZcbG99djSyYx+b46yNtqJ8=
Received: from MW4PR03CA0266.namprd03.prod.outlook.com (2603:10b6:303:b4::31)
 by CY8PR10MB6562.namprd10.prod.outlook.com (2603:10b6:930:5a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:23:38 +0000
Received: from MWH0EPF000C6187.namprd02.prod.outlook.com
 (2603:10b6:303:b4:cafe::a4) by MW4PR03CA0266.outlook.office365.com
 (2603:10b6:303:b4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 19:23:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C6187.mail.protection.outlook.com (10.167.249.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 19:23:34 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 14:23:05 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 14:23:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 14:23:05 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653JN5Mp2372249;
	Wed, 3 Jun 2026 14:23:05 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>, Jason Kridner <jkridner@gmail.com>, Robert Nelson
	<robertcnelson@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 0/3] arm64: dts/bindings: Add support for BeagleBadge
Date: Wed, 3 Jun 2026 14:23:02 -0500
Message-ID: <20260603192305.1347908-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6187:EE_|CY8PR10MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 354ca2df-aaf4-4670-17fa-08dec1a59b20
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|3023799007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	jaV6BkWpdQ8KDNfCfZ5lYAgV0rpSRNwscHnBV96LQwOwfCC5fWmFu64+UMjZac4cfoOtIoFmfceGppGxW5w6iLacHI3EF9AyPXB0WYXiwhs0wgfevXBZO3XzPu1eMB4ECb10lpSY9nIhweauLpGBQpUKQIaE0wfoBY4tbJ1BHDkdu4zuxBJds/hK2j/VRZcg0bMikm6JHModYX6VbeXFPgRfCtgCPjEFJBtV7qOf1sA1x+6b/PhLzXxQUUTc5Jh/9ncGdj5S9dT0eJv8qAaa58LMG9JzJcIPhtpMhhg1CwT6W/5w1PIwd9GG20pIPxZ6Q5p72R5UxflNOo6Nu1IWleOuPK7A5hD4pvC4l84XAbnyUFPf2KioImDb2uDPAUMqNmGdYdwe6gJvTDYJwljBOati7wTNyex3P/OVJ15t38prPTQ9PFuIfrZEXHll2lAlWKxM33RCjf46iR7nqFJwi008shVOH6F7+JQJOYcSJ/7/QFT4o5ydH2FQN9OwnHqcha2+cLZRYZTlmDBcoWeRvbV060pptlP5Ru0OhCg9/YMQF3ZZF4euXIGgjt82ld0hPLUh8fqp5zZNDeK3SSAtWX7mdNqNXqr0XCN3Zk3Wu9PPwe4BoLMkkjjRk0MKCGge+rQRTSZ0CESLqJT7I7IHmbNT0pwHXtT5wjvS3rN/uywgh3r3qnf19NhJ5zAOj/FT
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bJiJensHrOYmRdQoq+zO+MaLlatRb+DKsUtHS29yzpyprRySvqlvoOWbaSmGIaos4f1om9k4kTWdH4XcHPDZOPqLaeTcHe8czn8d8IMpz6RMW7fP3IgvYnbEcg8F69DdLYmB9tdH6IpzQew+fa5uoADsyIQgqHVUqf+ucV32AXARDBHEINwAut0JzvhlQ/hA8e2ZLjWTrjTQkdnoGFGHRI4j4O9U78aqj9Zte1LxhvWODouankRnC79UzN0XViA+gwlrb9Lu/RNMdDFbWPJwzbmZZNghzIvIe2xFQrJTUPgs10gCjSREY31cdfbkQ+L8jLi65ELyVB0x1VGhKaNDy74URLkRT85vecO9WHsEz6ipHzCIxEtv5zD7RKlkmw26lEFj9INSE+ryuSI4BKFMavN6B1RvivkIv0coVMNi8SJzkkeKsGk4jjLJMgh74UR1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:23:34.8258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 354ca2df-aaf4-4670-17fa-08dec1a59b20
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6187.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6562

Hi,

BeagleBoard.org BeagleBadge[1] is a compact, affordable open source
hardware [2] single board computer based on the Texas Instruments AM62L3
SoC designed for IoT and embedded applications. Add base support for
the same.

SD boot:
Link: https://gist.github.com/jmenti/e9e95848336fda0e4b5acb37f2fe64a0

This patch series adds:
- Device tree bindings update for am62l3-badge
- Device tree source for BeagleBadge board
- Defconfig: drivers for BeagleBadge

Changelog since v5:
DTS
- Fixed aliases/chosen nodes
- Sort Makefile items alphabetically
- Use dual license: GPL-2.0-only or MIT

v5
Link: https://lore.kernel.org/all/20260526235417.1326187-1-jm@ti.com/
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
 .../boot/dts/ti/k3-am62l3-beaglebadge.dts     | 657 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   5 +
 4 files changed, 664 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts

-- 
2.54.0

