Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013041.outbound.protection.outlook.com [40.93.196.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF28C3F8702;
	Fri, 15 May 2026 15:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859355; cv=fail; b=krWVYsT7dUIkBGN0tF1rE0eedGtlS5NbPLF+FhWSh/J+kU/gNJSviO7VNi7IVjdakS1iRyaotsBR84O/A3OTfz4NBTFxwmI/mOKmlWJuiqmm7DXb9DkF6fX0czUxzHq7FGJDdEYlyHDFwRae+ntcs2jhrMSfvWimcW/ssEPL9zY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859355; c=relaxed/simple;
	bh=BbwWSp6WdSojAyKuAhSMnre/VYLiKBx7duGqLJoACLw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NWQ7uoc7dCzhke4I5hB5xV/e4kvYp3uSWB9j+71cxGfp8y6AqUb5RzOAc3Je0usXUORWLYvmoxdeELB7JjOqelo2ZUFBkAptjwGThTnJ+nWO6QQkM+dercrTK+wCutvhWG+8ks6828nufP2EiC2HtmmWPp+LLvEvil7Svj6I2Ok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PgKWQqlk; arc=fail smtp.client-ip=40.93.196.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PgKWQqlk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRDRbRmtXYu8Jl6n7G7mUy0V5Xh1dVC0r2s2tfOKgV19a5GK8OOreWxxpFDM6QsI4ayjm09ex27edfYwgDi58R7XO981C5YYmFXPOVTBqydds8/ZFs7iTlRIjeaQYee7FiTAk9QmZuAi91G22kq1sGfuBG3irdqRv8ZvM+LvyhWhwFCZ+mpD+KyOvwobp6dazy3m7xkpYqP6yw9Sw9/DDnw7z3UYACl3CmYsTjrKyrsIanNwqcomozAm7lbd1Qdhspri7tuqQWs4txm+ZEPkaAt1l6Rq0y4p8FkbP5NDmfXjWqmcIqkczaJPKILSZozvz8Cl+BTN4g05LTC14LWPJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwsXeuk5ZPmwcXhUrAo4N9y4SP0BCzwGWBgEY9snyJo=;
 b=G14wcm+y75cpbv6qrCePxaVXVvP3n8N4hDUna2hfvxtRHu33165KuC11FKFXGqPhZ0Oo1B7PkX0DLsg4LUuYoOKDfyo7DiL4UZSvCXfa9NXT/RH/P2Vm7B3R06aR579c4YS9qJ3KycrCkzstzGYulNsaN5xzSa6QHqVoZ1tN7HQbC8QFm5gcGmYTwWbuDMOLzK/TdPOC0pREWoyiqbwIfNJK8pvUCGNGzXBv6p2csXm5QgAXQSadctVfpGsPZ7Uc+IKVN5jh8oFnpP2pKRpFaFhuf/9tMZmnzUDpfrU8bEKRK3gV19BF8ynzIkLiok8fl8xOmAPd3hbVzkPmZ2UYBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwsXeuk5ZPmwcXhUrAo4N9y4SP0BCzwGWBgEY9snyJo=;
 b=PgKWQqlkuFWN1WZO3XlnY1rN6X6GlK7/CUnkJgGx9krUi5VTno3xMGstOyK4VQoSZf+o2a5dMGoSYydLVETXUKpU0bqhkTyyF0s6CIO+hQA4lp5gc4Bu5KiEhotpkaD5TpBr7GXJZpIsn3IGm6A9TAt5J33zkGNk2YgvMlmsfF4=
Received: from BN0PR02CA0037.namprd02.prod.outlook.com (2603:10b6:408:e5::12)
 by DM4PR10MB7390.namprd10.prod.outlook.com (2603:10b6:8:10e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 15:35:45 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::4c) by BN0PR02CA0037.outlook.office365.com
 (2603:10b6:408:e5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.20 via Frontend Transport; Fri, 15
 May 2026 15:35:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 15:35:42 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 10:35:41 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 10:35:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 15 May 2026 10:35:41 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64FFZfom4155355;
	Fri, 15 May 2026 10:35:41 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>, Jason Kridner <jkridner@gmail.com>, Robert Nelson
	<robertcnelson@gmail.com>
Subject: [PATCH v4 0/3] arm64: dts/bindings: Add support for BeagleBadge
Date: Fri, 15 May 2026 10:35:38 -0500
Message-ID: <20260515153541.294698-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|DM4PR10MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: 57971ac4-0282-410c-961a-08deb297a020
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	WnRBBVq1kmJX4JhzHlmWj80otT99kC579hGm70HNO/wNF0vs0pxdLVAVIhspIv4pxd30TSODIkR/CDt5XpX6g4RMnkyC2YQjz1E0Ob8nT1pfRQQwCC80m9hpVFzKRphFjh4bkitb7+Tb7KAykt5v9zNH/lRWNtMV8ytSHAieDFEIh+lWo7Uy6znFBYCrfZkpuQJUgEat8pH5sif+rN7STnJHd84x9qfVLL3CW3Uwdi59Rp8kAV8qwRiPq4hsFZ4B9mYwKaAxlgdFAFIeSnR6bOB/uv+1Z8g9EHDLe93V2CNZJISFi3vVSI8rbHZG30xukJHG2vLWt6UO8GmWyM4+udkFYN24D3+/RvebhQlI8tnJY/fanE3pvkuk8mjrSVsr76JEl1fPW5+4fc/mvf856KIy4iL7y65Zy2BE5LaaGQz/9REErkf+CPvhTUqfxkV9r2/HZDIRt0Iqx7GiR1wZQs5fe8kTSx1VPUmbPBx56eacxDd/812ZB4nORvFUOFyDNu+bEM36aMo4XA0QCWxXFNMbJNFaGwFkePUXYmwQkcKkGs7gTM0s7L9F5tp6+YdArg1aRvUlDfre5gniATmJP20dGddih5lzQFVqGmvfEc4JkpKs0mWslU8soUY/WvsIspExlxtEWB9KFyDVkn93TN3fnc9zamyb6mTFnZ5zjETx1iEB8LhYx+rTWtePPrRg
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TM9Tm4PZyRLzI6Q47VLzySOr5Itqa6qutMWv7u25WtXRqUTCJhyr67mYNg3A6Mj4RIdbWPONGZPKR0mRMbq1hOMS8GutFOFUxdbtCspH+Jj51qN7xxzfkknB1wkhIIgM0fNAoCpEFAIa5ZZPn1HVEyFrsjLiQ0+EH2kj13MTgqyUyueNpLD5GbKStBOaOkTO7wBzVx27OPjHFvEyjo5f80ktkkSUWHttHY/VlDYKDVfkGhy69XhbQou39skUhoJdbTCdNF0gfPew1nj0151J8om8x2pViX2wYxEp+47263IOT19tGRp4/UoU9bcOyYGsr7O+3KIxXJkn+aLlf/XlVgf4eiLwQOh2j/72JqUJLA+Fa+5s7ydDW5VAP03c8J0neEvraMJo3JgtlvcOGw4VCznAgQZ8lYnn+MgOu8G5511ApvLvvrfEqQZQbSXjReKl
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 15:35:42.8281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57971ac4-0282-410c-961a-08deb297a020
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7390

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

Changelog since v3:
- Fix newline in commit messages
- Drop vendor URLs
DTS:
- Add bootph flags in wakup i2c & PMIC nodes for completeness
- Drop unneeded header files

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
 .../boot/dts/ti/k3-am62l3-beaglebadge.dts     | 700 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   5 +
 4 files changed, 707 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts

-- 
2.54.0

