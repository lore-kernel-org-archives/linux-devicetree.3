Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11020109.outbound.protection.outlook.com [52.101.56.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BFA1DDC35;
	Wed, 24 Jun 2026 10:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782296480; cv=fail; b=EL7x6g8YLaLoakXIunn9zTLt6Hjk6ymrH8RXAE64I1D5FJ4k+HTlXr9e5m27vvM6mjkZhtklXL9GhUw6Wf1HvLQfzMiVibJwWjaSp3WQBz6IeYIL1X/u6rxT5EcKiOleA2vpYk5QdjUr8qaMwdf1zZJGrgFuHkmFSP6e7yCwxB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782296480; c=relaxed/simple;
	bh=6Qu41YkTVw0Aea3tf3nySdVEJwX7EwpJFgqu3j4YmWQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I3lI7n9XqvQkOpsWCoAeZSjJP5KATdbQb9v3+9IsXxuRPpiEQNuwFsMHN1Lflxtrj11L5gS9ZvcCwdEe6jB1YoHEa3hqw3dGiSJ2De3j9HxEv/OISAoJuaC91iu4Anq4A3wsHm4bBZd3bUUG2yH59RYsODd33Pl8pyE6fUHCXVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=RHUiZ8Z5; arc=fail smtp.client-ip=52.101.56.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="RHUiZ8Z5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liztio+NlmqUTbfyAG5uzp1FdMdbchs3uS4RHRPzAmMo7wk8geL0BNmx2VrRWJfgTgWoHd1FAl3lJH22y1/v6RX4rh1ywxM+CD02kXnyZijAj/0RR+eE7JYbbO4ZbawLS4omqYXl0rSLd6CvY1eMe/flc6DvGpl0H1r5yvii41ugr1b4/jiFpOEcwQCN6E5njM3AXr276GJFVzQS56b72khbEj15spY493We+5CcvEhzZ8/ReI1qoyzVlvJJTSrT4cJ1x6DcESsDO0tX6GN5I080fcOLfavZ8iikCri6XUMFmMPCNerime1CwJFI6FHDSatzkj46Y+ijLNBpBiD6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v45FiVOtEGPP9tEtrl6BUl+25dQD1nGsu51hjwPV8wk=;
 b=Vrq2XW04H7d7F9b6rgpRDUY1SoaeIKYwwKIX8Rvyk+hjcyOi9qLgrsWVJN3Hjeu+hf0Oh5L6W5n4B/qpBG2anByjGkhmPSWtncr/QDEiD2f05XV3O8clC79wXYHUXWk0DOpTXp0ucx/gOibhSjYLeb6Orvqs/Jp66V5Ygh6ui3MM/eDLSkUgIrfAsnuGcWqW+BRMQS32HxuWlXPv+zpDT3KjruLhKU2WXdnQPmWuxVr2le1xZz/c8AMd0T4O+s/eCGp7fRnYatKfzkkYlIKlLvhu7p/Os+XJYlTIXoXoUBZ8MORlzs9LUMhEPHHoBcPWbQfwbW6wN+eRjxtQjW1IMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v45FiVOtEGPP9tEtrl6BUl+25dQD1nGsu51hjwPV8wk=;
 b=RHUiZ8Z516uC1bE9CIXWJpXXJ4FSMs0KJeBjiORYrKKQ/pGT2nvfT3u3sezWllgdUMxM/QbYHkjrsKevxtjA/NDLKedy3WSX+SjdwXpTKdsf3nfZpbR8ENv/RyLbtWXDjQoEJg3waSsK3KE8cAUwH6Jyq+/5phOqCWUx7T5KMB3hwYPrekDNBYGB8Ka7ruWw0vfi4kPDu26lOqKrTcKxdHPiNS5hjHx1XZ4bH/3wVgZq14xHXvkrNo0SBbNE7b2r6k+NftmDkwcHwGipZUXS6TvIV48hnJYzddywDLrgUZCq5HCTTO7t4SopH09KHee4obbtfGcpJRJitRdcu17LfA==
Received: from BLAP220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::10)
 by BY3PR18MB4594.namprd18.prod.outlook.com (2603:10b6:a03:3c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Wed, 24 Jun
 2026 10:21:14 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:32c:cafe::66) by BLAP220CA0005.outlook.office365.com
 (2603:10b6:208:32c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Wed,
 24 Jun 2026 10:21:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10
 via Frontend Transport; Wed, 24 Jun 2026 10:21:14 +0000
Received: from [127.0.0.1] (unknown [10.4.1.181])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 8F4784186B58;
	Wed, 24 Jun 2026 03:18:27 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Subject: [PATCH 0/2] arm64: Add Axiado AX3005 SoC and EVK support
Date: Wed, 24 Jun 2026 03:21:07 -0700
Message-Id: <20260624-upstream-axiado-ax3005-upstream-v1-0-c05bd0bc9124@axiado.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJSvO2oC/0WNOwqAMBAFryJbG1gjfq8iFqvZ6BZ+SFQC4t0NN
 lbDTPHeDZ6dsIc2ucHxJV62NUqWJjDOtE6sxEQHjbrEMqvUufvDMS2KgpDZInLE4s/DgE1VI2l
 rLMSV3bGV8D10/fO8HvJtxHEAAAA=
X-Change-ID: 20260617-upstream-axiado-ax3005-upstream-bb09780a2fdf
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Swark Yang <syang@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496; i=syang@axiado.com;
 h=from:subject:message-id; bh=6Qu41YkTVw0Aea3tf3nySdVEJwX7EwpJFgqu3j4YmWQ=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhizr9TP0pQOtt+i1a3XPTHTaYHxtn/HUx/dT10v7slQu4
 nBoDhfqKGVhEONgkBVTZPmq8y3/ZK72vc69K0th5rAygQxh4OIUgInYHWX4w1f+5cH9iYcP1zyT
 q/ooO5fhh/DHR6xfRE70BL7ccCizaSPD/+Lz/vwGd0Wj0pLvrfvW2rD29IaqjddWycScTFIUVZn
 hxg0A
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|BY3PR18MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: 61097491-e54c-4189-f279-08ded1da5208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|3023799007|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	vxHx+lHkUYa/5GU7ayT1eB+8TTKlH6MVdkwrXZnPF0PN202EwxEY5r8jgFCbaGOCs/Jo/26STtYmNt26dtiK4rIWnVPgtTFhlbXw9vnhVuYaliIokYAL9ldZjoGi+G4TD+vo/xEMk2iRayQjSo4z1uT/hJqZS0x4Q8wwJ3I3r3Ogvi4rm4jRkE5g+Erxf3i2IrD+WZs3g7t7zHomZ1j4RgNHDSrWwEOjqlg+npAnJaCDurjS8bFTErsOrNJOaExu0P+dVtuipf5OmVpzzNNSrYtz4uAXblg3R8RRozf/YV7s5PCxkOecp/h+o1JDwvdj73eySKnCoYGF1UtqFU13AYL1nBxVziThrXEwavuzm4xGRNU+btNCRf7uRSCppLmAq8/KseVNB7ayEHw/ENlRATxz+pYM1GQz/Z96Ad9WsUxfJGTOaMGtPCxr2yp+RYN3p3ySJGYOWEsloXhAZ+7qk1C0QneEt4PVBHZ6qrWAKtOS3JYY4nJdpLIm2ZS9dRah7DzrGOmESZuAHYokZ/hheUhb32Ax76iFEZIaddg8fj6MhwWZDMnw+P7jam0Nf28Zt2cmbGmoM92VWGrdiC7N+bb1eeHFu1To7UY826rX7PClJEewFxWC/vk5WeqqV9n9y+dMDWRpPScFjZRbvtdILXmfSxEK4h8FcLE7rsLuYEeOY9WTT2QaWaKmT4TdROHCv5nVk3LvDtwL0BSegE1ZNw==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(3023799007)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zkEQAo5UNrt1qmK+hNKo8ff4X+8WLP6UcFyIKIXBkVBi5vAYELAA8Ys/Hgcir313JUuAWq2A5NF32M0n77ItrP3K5EDQ6rCdirRlu0jUPlNvZzvt1OJCzuFYFnrwhhXVPeuHekWH/8qkFu7YqYhfGgLXo/HteaSwzip2FnULGdZopbxsWaDiy4Q3KGUNFbHC/Hn8SG5DaGueTKhlW9MiGb9jnUliOQ9LyaAhA6Ncwcn5C9U2rhk5cU5geLq3y6Jl2qJh6eK7hXhvL7VlqyboKJ19FheVNNkjaU4ik8UDR6NaWWNd6B144QXMaVY1KDfCmMb1vUKo4AfzLEGUEVdpoD5yLITQU5bPMzIdtE3Snqor3JUQYnzem8EwO4FD7gnovj8e35yPriKJ/0w/fUIWSo8AY3okfx5qWTnBpIxwF1VbIXd5f/VjNPPB+3wP5enF
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:21:14.0850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61097491-e54c-4189-f279-08ded1da5208
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR18MB4594

This series adds initial device tree support for the Axiado AX3005 SoC
and its evaluation board (EVK).

The AX3005 uses Cadence-derived UART/I2C/I3C/GPIO and Synopsys
DesignWare SPI IP blocks. These are already described by 
existing bindings, so the device tree reuses the "axiado,ax3000-*",
"cdns,*" and "snps,*" compatible strings; only a new SoC/board 
level compatible is added.

Patch 1 adds the AX3005 board/SoC compatible strings to the Axiado
platform binding.
Patch 2 adds the AX3005 SoC dtsi, the EVK board dts, and the Makefile
entry. The EVK enables the CPUs, timer, GPIO, UART, I2C, I3C, SPI and
USB controllers.

Validated with:
- make CHECK_DTBS=y axiado/ax3005-evk.dtb
- make dt_binding_check DT_SCHEMA_FILES=axiado.yaml
- boot-tested on the AX3005 EVK (to init CLI via ramfs)

Signed-off-by: Swark Yang <syang@axiado.com>
---
Swark Yang (2):
      dt-bindings: arm: axiado: add AX3005 EVK
      arm64: dts: axiado: Add initial support for AX3005 SoC and eval board

 Documentation/devicetree/bindings/arm/axiado.yaml |   6 +
 arch/arm64/boot/dts/axiado/Makefile               |   1 +
 arch/arm64/boot/dts/axiado/ax3005-evk.dts         | 327 +++++++++
 arch/arm64/boot/dts/axiado/ax3005.dtsi            | 843 ++++++++++++++++++++++
 4 files changed, 1177 insertions(+)
---
base-commit: 2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
change-id: 20260617-upstream-axiado-ax3005-upstream-bb09780a2fdf

Best regards,
-- 
Swark Yang <syang@axiado.com>

