Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010057.outbound.protection.outlook.com [52.101.61.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0563ED3D7;
	Tue, 19 May 2026 14:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200657; cv=fail; b=aHKloHCNJTEmdvegT1ueaPlkHL5JeOYmriWh9NupMD2OJEGme01pUISCJ+3V9yPn/tooRztJzGC+Ztt+u1tIRG1xpccfIitWLF00CHiGddb/yGmhxNWQTAhIoUqwBsoA/VlGtMi6VFnOeqElbhq2iKTvXziy9WhkUV/jOYN070Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200657; c=relaxed/simple;
	bh=XLEACAzv4gacGI38Odc0XfcRF+EUn3KHo8wnA2+Tt4c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SfaLOpsx9Rt7OLTJ0gA9PBtQT4pHB73VwpUIy5O5NivWeqdbDcNItne71nvahOEEKs1F/Dw6lFYURfvJpggdFNmbxQ/Z2tS6u1gz0FNeMxdHhszkMWx1Mlk1stbCXfsd7TWJiEtFjQtenLLD47Wja+PkEar+/FQEh1An5+sRVC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gNcVGvqX; arc=fail smtp.client-ip=52.101.61.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gNcVGvqX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/9ZQP6+WgsryVRcK4T2nejgTtOHpF27IfWoGYkRjGB+DMwJRoxNodSGX/GqP00JnU/qux8238ysi5FtnryZc0SaIdNwg1SCczBVn4LSy7wfwGvellRr30R89rLOlm6O/aWA3r+ZdNr3USAkKUtCtfD/0pfVjeeWzaHzboAGKa5jF53muc1DT9zEKGgdTdef9QhVA2GcgOT2OJEAwpnJ1ngHH+R+k8MwgxauThb1NPOHJKPmOfcTnEbA4q17mqJInxcWVX8r6sGuYGtwHrnpvNCH82syvgGiscUzwQ0RFpngfKBDsonNbz23e7w0UZ4zp0OSslt90eTj3CV1Xan1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdY2bbbRX0dHnUUVJHe45hJDpJ0fuJbislf0WvTlD3c=;
 b=tPlMDWC0SZckbEjvNCEMKiJRbUi5Zy/BfVcV5MLLSVlyFaGy+McThOGC8uMdo7GhikSqiDTVjcpS+WzOazOxq6+bwD1SM81yoeq9QZqEO/Ik97z/+oLEYJi84sKxHjR+9e2JFTWt+sPBKF8wp+tjzkLL9/WRuI5jZizhCqK3d2PsyLFGNfjj1JPbNwVhMZNtHI8XaEjxtVq83jFDxMB1qoOZ7Px2focFPtCViHidrVSEsK7EzI+o7rLm/SZ4vynozH1QbQ5F64lypZqBm3w/zNNK+pR4iLeIJiUUSssBIgJ/mos3wsvmcSuKmlBDYT5lmD79uIx1/v9Q8935E/L/Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdY2bbbRX0dHnUUVJHe45hJDpJ0fuJbislf0WvTlD3c=;
 b=gNcVGvqX8b8uHMnkB66/5dGRmYAUZrgILCT+dCU1DUxHPglyPG8C6ue8CmbV8x+5SgngWe6FzPXZQ7sFExKL6kcD2vxxse9ba3HnJuI3l4jvr7gFDoC4xysBhdjpgIsQZhAC4NUYlQZE9K2CusnM6TaaX+My9++A9YXAxGKjJmo=
Received: from CH3P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::22)
 by IA0PR10MB6697.namprd10.prod.outlook.com (2603:10b6:208:443::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 14:24:13 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::3e) by CH3P221CA0008.outlook.office365.com
 (2603:10b6:610:1e7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 14:24:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 14:24:11 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 19 May
 2026 09:23:46 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 19 May
 2026 09:23:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 19 May 2026 09:23:46 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64JENgoT4183406;
	Tue, 19 May 2026 09:23:43 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>, <m-shah@ti.com>
Subject: [PATCH v4 0/2] Enable audio support for J721S2 EVM
Date: Tue, 19 May 2026 19:53:39 +0530
Message-ID: <20260519142341.2531948-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|IA0PR10MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f1119fa-0f67-4df9-4099-08deb5b24be1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	se5kcEGdmiv8og3Wckf497cbsdrJsrij/iKJE9ZPyykQmX26ifL19LyWU+hAvW5eUuO8dK7bXsi8wHTIeJ1XOlzPo9E1lmtUu1eBjmBBvR+6WWK6/Vd7GgTqtWTaJ2M5x9iulAN031b+aa2xqr2tA2sz7Y+AU2iqTQLmUNfgEYp2JmkW5OlIglZZqZuNYMBxCBnOKSrVrrx/OarQ1wu4BsBp9mVPzAr5FWonuhswwCj6hIIR5OO5VOYFpVtVBzICODNhaVh6d4nk5stldplLju+buJh8EC/UZEawGnEylZzYhGX9V7opSlo4SM82vR5ehTIqRXduMcsnJ38pNxEyuqZQUWuVGYkVGZSQmfB7yxoUbp9u/lnXGOnxVlcRyvUIujCLW3NvGRQEDIuaXyqXcDifnORwp/x3c7/L1XolnI64MQsvOq/atpA/AUCKsNO3b4T07Fce8Dsem4llmmjm3Yp7+f0toAMyQEMDY0RjEffzkzqu/c9X8es53MpFP1cfh8MqRSkTQP9EoDa0/g3pV/reVR9Su/IHCbnxtfP4jucLwW5kzO54oytYt3FKu8t3b1ANAWNitXFMXAbSYHdshrUqHr0BfyCD6wEbhJNAWxsa+5r67Obp2HMHRh9THIH/bc5pTHYKqadkT59bA9/BaNEN678ukVpv73Fx292pfSVBGsgckxeYDf3uMElHGxq3
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	62wyp5RHuxphM2M+PI7HusoKUEyZEYWDqECVL1aQX5+7j0g/sCxnFBghLgWD80Wc+oABFX9EggZdoE/z+CwrHt7LH6TRufgVHkwxdLccR0QkIsXAoNhc5fxuAkQb/cbZFPsxKNQZWoLhM5ed6z9RaNASWchlbPIYl5u+e3lH+t1grWIR5nxlx+L4WnjgeYvdofUk3O7h3d9qUpoBGlTj5ujvDUoYiDp+DTrX9eTa6zHlChb8DwKTqqg/a2uuAD1fS2/4W6DcUfdXZ0fxQNnoN7sZxrz15kVFtELgjc8DvRLKntAE0QBedbhInHL4YJEmzP0dwWsr/Q5y25nfuLIBA71wKeXjzbBMcGr4VV2TbUHg65T5JTB6x3Y3pXRAG3itAog4VkXZDr1R119GCmtpGd1HCI7B8nMJ4THyLhlu2Nq/BXuNCOGqUO3EaLaG+9iu
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 14:24:11.3863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1119fa-0f67-4df9-4099-08deb5b24be1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6697

This patch series, adds support for analog audio on J721S2 EVM using
device tree overlays.

Earlier version of the patchset sent upstream[0] was rejected as
its dependency[1], which resolves the DTBS check errors introduced
by [0] also got rejected on the grounds of ABI breakage.

Another solution to fix the DTBS check errors introduced by [0] is
to modify the ti,j721e-system-controller.yaml binding to allow
audio-refclk as clock-controller child. This is done in the first
patch of this series.

Changes sinve v3:
Link to v3: https://lore.kernel.org/all/20260330094459.128648-1-m-shah@ti.com/
- Changed compatible from simple items to oneOf to support both AM62 (legacy)
  and J721S2 (primary SoC-specific) compatible strings.
- Pick up missing R/B given in V2 of the patch series by Hari and Rob.

Link to v2: https://lore.kernel.org/all/20260205130707.2033197-1-m-shah@ti.com/
Link to v1: https://lore.kernel.org/all/20260112104536.83309-1-m-shah@ti.com/

Bootlogs: https://gist.github.com/Jamm02/f586087dad227450abe8637e8a688c68

Jayesh Choudhary (1):
  arm64: dts: ti: Add audio overlay for k3-j721s2-evm

Moteen Shah (1):
  dt-bindings: ti: Update audio-refclk binding and j721e system
    controller

 .../bindings/clock/ti,am62-audio-refclk.yaml  |   8 +-
 .../soc/ti/ti,j721e-system-controller.yaml    |   6 +-
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-j721s2-evm-audio.dtso      | 161 ++++++++++++++++++
 4 files changed, 175 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso

-- 
2.34.1

