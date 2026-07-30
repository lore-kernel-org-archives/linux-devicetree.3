Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11021123.outbound.protection.outlook.com [52.101.57.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10398374A02;
	Thu, 30 Jul 2026 04:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785386254; cv=fail; b=RVldYG5DlFiJcWqZ+uCOGB5imwOwedpCF+HdCrYcbRmVGQtFnbq9mQoMLiDklcrp+kd9jhh+O3YUefZ2yjmcZcvXzwRK6nXTcLbe5+ggs9BKcBWW0Ybl2XbpyPLlIoMQob/LsydBWgsBu0jXCIMRwGLTN8DoWNnUh/z5DKJrt8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785386254; c=relaxed/simple;
	bh=wPUnRca4iFLA+Lk9r79xs8lTXSZgR3SJpHzpmMXjdRA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HIOFwVoqGjtOrvzILUpTf5o8otai2wMtOal863HAAgBAJ8uFZDqXr9SskJzSC9rhmlvnQWCeW65ryC5SKhqVIscVuCR0IupWVrfITd6MpRaVbKa/L5NS3wkY1EDcbRKMcoYgBQ5A/RG3qE+NDblEy8+NCe9JTXGQYIpUQTy5TOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=quG+zyqZ; arc=fail smtp.client-ip=52.101.57.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="quG+zyqZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlGH5ztgvTbWI0Iqmckco9pHksH+7gD/S10OR7mRuQ5vO7vOPbHsNaJr085VeNLjnHVE4WZDEv5wSlU8KeozCCnqPzU0jGEIIvnx2KcuFqw/fGR2txhB9Xl7r6R0Vz1n9veqexpYsApz//ZOhTGyOPkI9SXzMkeD8C1MhiMJHm5iGSw7sBoWiBu93L9bDkOEhuqTEZpzcNBLxPZ9VGtG+Ag2zTu/3ETp8q4cXqjx5PgUU1PcTAB2iNjuUUNEevoI09q7qNLx5KgGCwZyKqZ+zrX+ruH17p/r6MtUa17LC6YlfoiJs9KKX3LwqOE+cn90JunIVm14Hx/POa/UsIPZmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OilmoYrNn5IMM97t2STQ6a26pmPIVWTXTBRFlhnNNs=;
 b=zBNNpEw3zk2SKfx3XqTAUNGfz4xFzOVMy2xgoYDvnsNSJuzGrCMZcFPHu6/dmY3uFzoXP4ww/r+5Km6SNaY4IfSRwxrhSitd/ID9hNMmQcaafa3SCynI/WJakbo+Ij5zsfCiCkGyTMv/zRRKse22vJa3nrS8uYkbOwX1njJDmwpjvyjwL3mVJ4avcDTJOOiixCf31pkqUeSM3xp0E3JN83SiP/BNXYUA4yV1pU4VplfrWz1cnGY9hZLxRgCwT4kPFIJ4fSxnaAFeTmYaVeYjnF24fHOc+kuul75HnPIIz3vrUU4BL806FIhCHpZARnF0WUqOhCRR1SGG4mem8VCXyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OilmoYrNn5IMM97t2STQ6a26pmPIVWTXTBRFlhnNNs=;
 b=quG+zyqZ0SMLlmEarFEk3UfSUZQttduxRBZ8nKsWG1ZXIdgKdFwaMB3vPHjuU/jOBJGQXxxllCVAVLPJky1siIF/jTKA6ju9hpqX6BCbDOrqI95rUkRVrRqflJem0BVuKskCH/59MM8mxCBe9u0vYylwCQoAXjp8NZicf2Vc6BIzlGfA5mUn45T9i+86/TUCYXbrcG+4onTHsTmRic3svSDkLptZ+IWvpHqlEhwCH8qGVIh54HREn5KapOOAr8Xf7CaL4wemqw1HYksXGfGfPlXKWsec7OieCI0J19myJmP5ZS0nFrgU2VRfK9N4g0eBYsSEn+PsPO6Tjz4N3F3kJg==
Received: from BN0PR03CA0018.namprd03.prod.outlook.com (2603:10b6:408:e6::23)
 by BY1PR18MB5301.namprd18.prod.outlook.com (2603:10b6:a03:523::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 04:37:25 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:e6:cafe::2b) by BN0PR03CA0018.outlook.office365.com
 (2603:10b6:408:e6::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.14 via Frontend Transport; Thu,
 30 Jul 2026 04:37:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.1
 via Frontend Transport; Thu, 30 Jul 2026 04:37:23 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 0579C4186B51;
	Wed, 29 Jul 2026 21:37:23 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Subject: [PATCH 0/2] mailbox: add Axiado AX3005 mailbox driver
Date: Wed, 29 Jul 2026 21:36:49 -0700
Message-Id: <20260729-upstream-axiado-ax3005-mailbox-upstream-v1-0-8961b7350338@axiado.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOHUamoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyML3dKC4pKi1MRc3cSKzMSUfCBlbGBgqpubmJmTlF+BkLYwS0tNTDR
 PTUkzsVQCmlZQlJqWWQG2KTq2thYAniWCpHkAAAA=
X-Change-ID: 20260728-upstream-axiado-ax3005-mailbox-upstream-86feaa7edf49
To: Krishnakumar Kesavan <kkesavan@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Swark Yang <syang@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293; i=syang@axiado.com;
 h=from:subject:message-id; bh=wPUnRca4iFLA+Lk9r79xs8lTXSZgR3SJpHzpmMXjdRA=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhqysKx91Dp5j8pp4f6Hhl7OGGTeelcsuu/pZ7a7OdF353
 Y+fX6vZ0FHKwiDGwSArpsjyVedb/slc7Xude1eWwsxhZQIZwsDFKQATeXGDkWFL6Oa7ry/Mc+A9
 mZfZvd5C2vt45cni1yIeXFLFTlu57ksyMqw5l/ra9rk9++629bV9kStcJixe21QcHN6qVbyw8dE
 xMU4A
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|BY1PR18MB5301:EE_
X-MS-Office365-Filtering-Correlation-Id: b58ea3a9-3d88-4161-5e6c-08deedf44041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|6133799003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sEIguDTB3L8xd3k5M5MsSaetWavUqnG/QfrjA6brIz9euh+sirWqZvMyCbe6I4589EJMnVHV4DCRtR8hiBoZOFX/oZWUBtJlFNo6x6i9NtSvL10lB9lqfbLDBlF2z+A9bK0YR9iQWZVkI5KtYVq0BbUIDfwwBcnk0f1iGgLQRAGd+BHyFinETXaOMZCjWipS1Ra3fdfhSfC6jpT1VByKg7ZLn9cmJqdeAePT3AoRXXto8FqtlJnIl5NAj822s4wDluAJ35lr43f6v4tsEYc0DFEvtRQmzO/N2QWCwUgcMcy5kAcI+qmlaRxGoV0u4kFHKgGjDB4NNItA7ehi4DpSKca9o4DeYg0FY+yIBhtKQl8T41jUbO+/eTafcyJGSde4efFxYbJhpuuRQhRHMePFBVNlAIdbGtAXMt2xKBb4S2yg92HF+5UwUQIW87CM4haLaamCz9rA5twgjlALNEWZ5nc2ZJshlJN68mcd5zYZmSBMpsWZLL35f/lp+5s6GrgZ8Dcucj1LubNCEnyeolGiQK/rZg9jM5yjC+7shNwWCcD7h5Y8EZ8W5NqmgqvNv5lgZz/XxbEgFikYpm8WiVbtvO5ffGKVDH8cH+wXfxJ37A1tD2MJ/jQJV7zhIEo8bjAQnp/j7D1TbrIfFtcTdvg4lEXmzQ7oo01O0ho6+xQzVKKn4B7MtAq3ICIggFnrVVd5NIyuM3KF1YYdkVKRiaUbjA==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(6133799003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xUYQlhFqMlXC6GLGYDTaPj1jlEfYPmolifOoglpizzfJZEmG2NpR+3EYG/rRd59XgI6fXJhE73uuk5YQEz4YmVzzhaDM6Cr7Pg0fbzzzVvxUQk5sWElnqeGZZhL0a2J/dZlN2b8TaA8AtQzYSkI6dvZGQ6XRJ6uFgAvmarfatCVu9mkPUBZg4ScsnNvbrxeJ7QaAU0eNe+45yKf2e00BFFEzvIdudj20hNgQQ2eSlZNUXfS2iXAz+rOYr1d9seyKYZ4PmMromEB/uTAGCQpP2xJLkNqQCbopxKk4TW0VxBKGT4Cj78yeZJoplcqAWrlTuKeLlrT46FXHw0+Jmt0KaAEM0wFiLkBZJCvzbhr+FBP3V8V+bg8/TB5fnIiVBK3tUWgMchxN6VdSNix3QuwmZvFBjOnMcaJR0d2YqUmFZnRcM56na2dJ8XZMMhF/obE7
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 04:37:23.7271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b58ea3a9-3d88-4161-5e6c-08deedf44041
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR18MB5301

The Axiado AX3005 SoC integrates a mailbox controller that provides
inter-processor communication channels between the host CPU and the
on-chip co-processor.

The controller exposes 16 fixed-function channels split into two
groups: 8 TX channels and 8 RX channels. Each channel has a
hardware FIFO and a control/status register, while TX and RX
channels reside in separate MMIO register regions.

Only the RX channels expose interrupts to the host CPU.
TX completion is detected by polling the FIFO empty status, so
txdone_poll is used instead of txdone_irq. RX delivery uses a
threaded IRQ per channel because draining a mailbox message word by
word is not appropriate in hard IRQ context.

The ax3005.dtsi mailbox node will follow in a separate patch once
the AX3005 devicetree series currently under review has been merged.

This series consists of:
1. dt-bindings: mailbox: add Axiado AX3005 mailbox
2. mailbox: add Axiado AX3005 mailbox driver

The corresponding MAINTAINERS entry is added incrementally by the
two patches: the binding path in patch 1 and the driver path in
patch 2.

Testing:
Tested on AX3005 using an out-of-tree MCTP-over-mailbox transport
driver, not yet submitted upstream, as the mailbox client. The test
exercised channel 0 for TX and channel 8 for RX.

Verified end to end by issuing a PLDM Firmware Update command from
OpenBMC over MCTP and routing it through this mailbox driver to the
on-chip coprocessor. The firmware update completed successfully,
and the resulting image passed verification.

Signed-off-by: Swark Yang <syang@axiado.com>
---
Swark Yang (2):
      dt-bindings: mailbox: add Axiado AX3005 mailbox
      mailbox: add Axiado AX3005 mailbox driver

 .../bindings/mailbox/axiado,ax3005-mailbox.yaml    |  98 ++++++
 MAINTAINERS                                        |   8 +
 drivers/mailbox/Kconfig                            |  10 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/axiado-mailbox.c                   | 379 +++++++++++++++++++++
 5 files changed, 497 insertions(+)
---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260728-upstream-axiado-ax3005-mailbox-upstream-86feaa7edf49

Best regards,
-- 
Swark Yang <syang@axiado.com>

