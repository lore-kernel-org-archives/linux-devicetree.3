Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010066.outbound.protection.outlook.com [52.101.201.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ECB493646;
	Mon, 24 Aug 2026 04:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787546928; cv=fail; b=VzWK32mNo2JlzwUbhmVa6Re/V6WjZmMfq2JrCzPTL+IcA9EyHUyRUtVMy3OsXQ/dITrRN6myO4V6vyB4EkyQ9wAPtJkXYII9gSTuqlO4+kJSeW6APihnpp3wLCOOjf0v8YETqITjDKtssUBhNY0pMAtx8trsOHnhm+LsJUhqjgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787546928; c=relaxed/simple;
	bh=dey4vt7MW7WYwoL5VU5YOZpAiqXgMuNAviR7hfEw9+c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EaPG8tZHiBIKuaLLEjx8QVhFM4XqXKguyqxxOr7c29k7SZCpk5KXLUQyJowo2fTW/usPbYk+l5FJTp9zvDQJu+mk/jXVkFN9UkqrO7V3+MzOyOOp5+HTigRzUxJD/O3S8tDRCb+zhS6+O6Pfk8qQmRSKOimFPo9JPDkxZteYkNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=n4ze5wJb; arc=fail smtp.client-ip=52.101.201.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="n4ze5wJb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuAM39YaLl4Sr0GJSSTy6zqP2hQEnvRXDuRSehCcI2sNKmFWnbxeGQyBDcep7Pil25PhslNIkkh0rXh771IQkm+wR4njux33bj5QLMqS6do26ZXy/F3NSmmRdzuMq5MdWCfW145p9lhAvryjGpiuAoZo9AgF8ZSbgHe+zSq/54xLKNXjqd5y/uFq6fWmMqM/x5fHCc1kXfGb36xfIMqyy9x5XV9kaezu5H+5UD1jUEysMljcZqS+teR8Z+cK0aAWNDaSamNAuDoTG5s2ISLKraYIe4/IudC1JLsH94fOT0l3a4NxNAJFS7PulAQ0MjHPf81QoJ4eENCFS/y/fBhtJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hz7/wsoglCCT4IyjyDDN0P5XDGkDqmp00irG5b1HSHE=;
 b=qiP/BVhiuvGcWCEr76nNbiJBqJGg0tU0vsserVJVbN1tYHIP0YM/JE9H6ATwCbgmYAyBw0twoyCkD0d3RXu6xVcbuEEQGCy1CUUypv7HOmae+Z97rUmAdzhn/coKtKMNXJJ7F0FuPxSr9QspIUSehT65sqg2FdIKRHMbOToYMp+reVP4kzOT3rDrMj3j3c7efVo+o5+cza9RVoUbog9TrCEePPMznCPpPdE87WCrHWAULXlOQOeOtrektPVg/lIHswQVfhwC6mO8GRoqfGKwo/LquajFCvg587VOAqabgTtL2vDSKBcFW+O8VhpL/r8dhqDjg/Tf75e+XU2mtoSKgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hz7/wsoglCCT4IyjyDDN0P5XDGkDqmp00irG5b1HSHE=;
 b=n4ze5wJb0CYYBVYwiLoXqtiVi3yMwnEfNDIhFHNFX9qwtNZZ8ZEHMCQw/P1AvDX5gSdwF9alqfr6MWJzU07RpLTfGqAIdaCI0T2Gl/Do5x7aURWO/oY0VFgTYI5twsZjFCFQUQyTUY1eDA2j6ym+RiIUvW+PdfZF48havxBkf78=
Received: from BN0PR04CA0146.namprd04.prod.outlook.com (2603:10b6:408:ed::31)
 by LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 04:48:43 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:ed:cafe::18) by BN0PR04CA0146.outlook.office365.com
 (2603:10b6:408:ed::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Mon,
 24 Aug 2026 04:48:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Mon, 24 Aug 2026 04:48:43 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 23 Aug
 2026 23:48:42 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Sun, 23 Aug 2026 23:48:39 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Shubham Patil
	<shubhamsanjay.patil@amd.com>
Subject: [PATCH v2 0/3] i3c: master: amd: Add IBI and hot-join support
Date: Mon, 24 Aug 2026 10:18:32 +0530
Message-ID: <20260824044835.2924141-1-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|LV5PR12MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: c763cb37-af97-414b-6bd7-08df019af970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|10067099003|5023799004|11063799006|56012099006|6133799003|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	c3/FYw/LWvOnSPZJ5PgtSbwZ8tlYdzTO0BrViw52n5YcnucQ5uZzWN/FmNaBfwZDgK73Ay4EiQ9Rsl0KUXOoWV0YZousqg219V6RHkHY90xCvpCRpZaN4c3pYz+673wQaNkm6GJ7U9bqBkYIREZ+rTCJkvl2YnrM+kmuDDjVorDBhFpns0rfJ9JoCM3mtoPgBcWVK6I4RIk/zWaePx1jTKcGHlFjV10R/uT8fUuLeGsjQPwVgbO58FaVUEKqWq/C1Qh472rq/jsSyhOqTYdSeqbIIVvEwqKOKA6L/3voZFfsbjavdC1ECt/Gst2X5VsktC2293oXa8/QRkE9HJbEQU/3A4qiybJRMw7X6BRdjw31eyM4Crkh7HcrQUlIN2fvt8WGWWxhisCx8zhSD3E44tS4asLXRLh/eaCtW3S/753zIBcyPVQCXiQagVejx3lmTIBDcBctLAwZZTa0gm3dgSTz3s1UTGBKkOYbCMbitKPZ9bwWPz+Jady5XSBRFeG64PyGziw2GkGYJVRa97iXstMYkb3WAvzwCE8Krq3hgczVV+A5ePrCUFIXXykVfB7TOUme0oXUGWCJikguoyVFEAfNfkZ/4218Feo3EMzx2CVOF6vq8H0I9PvP5tQ3MMzbBGp05Co4+mdtF4JSFbQJkE5FQOR/aHUkfgdLmreMWKebQejDqZ+/ep3MdcEkX8WA2tQNQJeUMjdu2sA1GA13Sg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(10067099003)(5023799004)(11063799006)(56012099006)(6133799003)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	13n9CsV7pn+Mv5kOGcPDsgZRUhig9jwX1hOyCvnz2wKf+10/5qTJvpooGHZwmPmSqKeNUUXi3CgpyWxr+6+2Myhz12UVo1WWOYuWu0wJiqstO28j/Px8Le5lZZcnYnduBwyhltmBUq0dbOkG+WeenlfKyhAqJjJE9t12EPrLdjDgVtYYX0gxB/M/rBgAbQtz+S4FSaHijO5z7VWcaIhx6R7FfypwLINacL+VIMpmLIiAvIZoiAYF9nYAQIw6hqbSK/O9132bqbr3/wLimH+/WZ4DhSqHZl+dC5Ebk2lhsnN1hKHJX03bPpmp/13e2w6R4DCuPFeDN1DdeSg9tL4ai0WrNUDWwEXNEai9BwSdNLbeXbgaS3tEdNBsPL22JYgSr6g/M/Lb6hdGj0yyZ7/vgKuFib8dSYS0omHU9OJCXcZmO0kvHK28GEjYufyBEQh5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 04:48:43.0971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c763cb37-af97-414b-6bd7-08df019af970
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9779

This series adds In-Band Interrupt (IBI) and Hot-Join support to the AMD
AXI I3C master controller driver.

An In-Band Interrupt (IBI) replaces the dedicated interrupt pin an I2C
slave would otherwise need. When the bus is idle, a target wanting
attention pulls SDA low to generate a START, then drives its own dynamic
address with RnW=1 during the arbitrated address header. The controller
either ACKs the request, accepting the interrupt and optionally reading a
Mandatory Data Byte and payload, or NACKs it. The interrupt therefore
travels in band on SDA/SCL, saving a wire per device.

Hot-Join (HJ) lets a target that was not present at boot join a running
bus, after being powered up later or physically attached. Having no
dynamic address yet, it arbitrates using the reserved Hot-Join address;
the controller ACKs that and runs dynamic address assignment to enumerate
it. The same hardware arbitrates and ACKs it as an IBI.

This series adds optional In-Band Interrupt (IBI) and Hot-Join support
to the Xilinx AXI I3C master driver. The controller is soft IP
synthesized into FPGA fabric, not fixed SoC hardware. IBI and Hot-Join
are Vivado synthesis-time options, so two bitstreams — or two instances
in the same design — can share the same IP version and compatible
string yet differ in which features are enabled. A single device may
contain multiple instances in mixed configurations. The compatible
string identifies the IP and its version, but not the capabilities of a
particular instance.

Patch 1 adds two boolean device tree properties,
xlnx,in-band-interrupt-capable and xlnx,hot-join-capable, to describe
what each instance implements. Hot-Join requests are ACKed by the IBI
machinery, so xlnx,hot-join-capable depends on
xlnx,in-band-interrupt-capable and the binding enforces that
dependency. The controller interrupt carries only IBI and Hot-Join
events, so it is required only for in-band-interrupt-capable designs.
The driver assembles its ops at probe time from these capability flags.

Patch 2 adds IBI support. The IBI ACK enable and its interrupt mask are
controller-wide rather than per-target, so they are armed on the first
target to enable IBIs and disarmed on the last to disable them, with
per-target control left on the bus via ENEC/DISEC. IBIs also share the
response and read FIFOs with normal transfers and are distinguished only
by the reserved TID 0x0F, so the controller stops ACKing IBIs for the
duration of a transfer and a target retries instead. One ACKed just
before that takes effect is found by TID while the transfer waits for its
own response, and is delivered through the normal IBI path.

Patch 3 adds Hot-Join. ENTDAA needs bus traffic and can sleep, so it
cannot run in the hard IRQ handler; the Hot-Join event is handed to the
i3c core with i3c_master_queue_hotjoin(), which runs the re-enumeration
from the core workqueue.

Changes in v2:
 - Patch 1: Renamed the properties to "xlnx,in-band-interrupt-capable"
   and "xlnx,hot-join-capable" and expanded their descriptions; expressed
   the interrupt requirement with dependencies: instead of an
   allOf/if-then clause.
 - Patch 2: Do not lose an IBI raced with a transfer - the IBI ACK is now
   held off for the duration of a transfer so the target retries, and one
   accepted just before that is delivered through the normal IBI path
   instead of being drained, which could also consume the transfer's read
   data. disable_ibi() returns early on DISEC failure instead of
   disarming and desyncing ibi.enabled_count from the core. Added
   synchronize_irq() before disable_ibi() returns and before free_ibi()
   frees the pool. Reworded commit message accordingly.
 - Patch 3: Use the core's i3c_master_queue_hotjoin() instead of a
   private work item, and only queue when the design is hot-join capable;
   the core owns the work and cancels it on unregister. Reworded commit
   message accordingly.

v1 : https://lore.kernel.org/all/20260814115155.3974988-1-shubhamsanjay.patil@amd.com/

Shubham Patil (3):
  dt-bindings: i3c: xlnx: Add IBI and hot-join capability properties
  i3c: master: amd: Add support for in-band interrupts
  i3c: master: amd: Add hot-join support

 .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        |  24 +
 drivers/i3c/master/amd-i3c-master.c           | 654 +++++++++++++++++-
 2 files changed, 658 insertions(+), 20 deletions(-)

-- 
2.34.1

