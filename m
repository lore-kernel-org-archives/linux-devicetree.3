Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011021.outbound.protection.outlook.com [40.107.208.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7DE481ABB;
	Wed,  6 May 2026 14:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076578; cv=fail; b=IUP4P+yIPl6bxeRrMRWrPLQjzIEOqbXNQDvdv3xI3YdELi6WS9KU/rCgyPpMnwDKAoPpEdPUElTg+cBrTYMJeqkGz45VJutHDIbln1B4p9xlICSAT4KazBszuydtfsTyw9FWAGaoG6ORDK0ZrPxhvjxrJgIzxdASZo+F1rOvsSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076578; c=relaxed/simple;
	bh=auqWSk/l63EkRz2DkHo+OCq0skPFdSmU3fY+1Gen0kk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NK7CwTaWw8KromFNQ3ZNPqS/RcdsVLFxDMjD6pF1XLeuPgJULWo7guEC/xlybq28A5UPB/1KEDBDt4GUw5RURcHKd6eMpguKuFfZmY6xYp6Wf5DWcyTYyEls9OCkzoM9n3llj58N5dHb/tZ+M+6ueRlbUid6+0hZVfj8qMKsd44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XaSUmp5q; arc=fail smtp.client-ip=40.107.208.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XaSUmp5q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGrhVB9JTz7tIYmiETdIQ3SdICM9YFYsQ2htIejK3aQB3mYDOuhNUrg01XrA7iig5KuwnP65Qx9J9sYWHMxFsF8HZ0yCbmlL/pTpanJQLtTkgBO6D/Llk+xkpnq5DXvkTPOBaf3NsWTuZ6YRAuBGEN3yQo2hVMq2KvQmoqA6r439vWrJApFae4TJ/Ll10ArQMKNJ17G8EJIUIF2bLoAqIkg93LM8n6zYnK/TQfanItsq8q7hfinStexnRfbC05n1GOzgLKUGoo/QB3VwbLlx0ML+vJ/NITeQxtX/vTtStVbanGotRi1yQGI3NkrhLC1jCD4Q+QIH4D2LxjqOenz84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlQpoVAEFsUav4xSH4XUzFmC0bVB7sSX6ZyXsDgf1pI=;
 b=mF4zbIhj5qIlMtWi1x6fv7JOlxpUu5k4prU2Do+Z2haarBnRLasZI4kgYgbSfa86HxEHFyF0v4FDfeBs243U8L7Ww7ayVv6RrBwM5EvAp3yEjhO4x21Hbu5z92U3tbjR/NteehyjGWJ6896JoM0whyKQVfJoD2Wne6MfpiwPMDd63fRDXbJotQshwfOSDgsggKBbKFa5b+jwjh+GygGi1+bTFTytTjK/Qa1C06zVRQ/TgUXKKPGgPmXiLsxLLTNNPRqR5J9xjN1Ab/OqKMsulXZqz7d3y7ngB1XAKSz9mULoiR28kXBkRCBMf610Imp9RualLu7IEVQ2UCcT8k3WWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlQpoVAEFsUav4xSH4XUzFmC0bVB7sSX6ZyXsDgf1pI=;
 b=XaSUmp5q0jcaribYCGrGrfgVNF+djgp/EHUFX8dufertlgoqGVIuaZ3D9mEhJQvfUiYrJzLDVnlCc9RnOMHkfrZHVrWY+7RElsuVBDsOOYtnHW2/3JGM/c1T2r7avoGXcyi7rg8+T5Qko6nOe4eTLU2NQPUhF1aSzcZZwNKAyAA=
Received: from MN0PR05CA0030.namprd05.prod.outlook.com (2603:10b6:208:52c::27)
 by SJ0PR10MB4527.namprd10.prod.outlook.com (2603:10b6:a03:2d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 14:09:34 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:52c:cafe::31) by MN0PR05CA0030.outlook.office365.com
 (2603:10b6:208:52c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.6 via Frontend Transport; Wed, 6
 May 2026 14:09:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 14:09:33 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:09:33 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:09:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 6 May 2026 09:09:32 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646E8IWv1221395;
	Wed, 6 May 2026 09:09:26 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <josua@solid-run.com>,
	<w.egorov@phytec.de>, <matthias.schiffer@ew.tq-group.com>,
	<d.haller@phytec.de>, <francesco.dolcini@toradex.com>,
	<joao.goncalves@toradex.com>, <emanuele.ghidoli@toradex.com>,
	<ernest.vanhoecke@toradex.com>, <rogerq@kernel.org>, <eballetb@redhat.com>,
	<robertcnelson@gmail.com>, <afd@ti.com>, <u-kumar1@ti.com>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<luis.parga@ti.com>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2 10/13] arm64: dts: ti: k3-j721e-common-proc-board: fix USB clocking for compliance
Date: Wed, 6 May 2026 19:39:42 +0530
Message-ID: <20260506141040.1368918-11-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260506141040.1368918-1-s-vadapalli@ti.com>
References: <20260506141040.1368918-1-s-vadapalli@ti.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|SJ0PR10MB4527:EE_
X-MS-Office365-Filtering-Correlation-Id: e70d30bb-80d6-4830-4d57-08deab791945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700016|82310400026|18002099003|22082099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
	73Ay7BLe224OGGS468dkCBozzkKAdWZDUZdf4Q0o9HQMlXnPtZy5S8TxXVOrlWW2ftqoOedih27nPhrXHxSpyMpIhfScyofSAUVFgruJqlUEuyZ1BH8NFKBnBo3oNGEBoIUHyo3TPCczpOc4q45ZjY39XOhiydlYX5JW83sHUeYMd986OVsfuqV+//xbe9tI6WMkYgq/wLBFYVc+t63JEfgVSnCtmH+hpZzD2qzMhefzpbJPQvx8Znue5ENtLMov/Hqlor/Q2kQ8MybTxHnaLLw4sXC2/Isk7JHa/A1pxq9h97bFN6ZjKP7V1htJKhGi9U/ZikDyx9fRjG0yAS9VausoYv3Mom8aYX4+nmdrrQCaqmnkoqFmCCMGNPOYhEUsvNpHPOs6qOKfo6sNcXfDUCrnoZoV9ZEM+XbuEnI5ej9t6fz2hg+A3sBhjp/UKm4172EhSh1UU8tz0YAZO/JisZuuQObeY+tc/CgA683QalbiiiX2Tn9mKcu7BAEPx9GPcef3EhnDEvQN5XGjw73cioGfIuQnEzmV++PgYHr78LvE8K8yhKe9Wf5dNxuBgUy0L4wU/M7xSlPfA5FvYNDS8Ya+pQFAdZybvjYFrQHikp3IpApT/4ZP4ccimWkmcJIrT0lpJIUqG9drHC16vN4ofkz3V1GKr3aNfAVz/PhWsV8J6H9HP+QgvT5XahYTY1DZsCHy7RbdKKO2icSLfCGbCAyR0wPmBdpu03zIhiXLy38dOkjbxEw+rcGbQBsVvwuiKJkqz3cLUJNWUfHGMlBXeDKg/FGjI20VT8jiiLQkVhA=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(22082099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5fb86aMS6R3VxFE1+6a+6jNOD9I031zRf2IjIdpw+I2Qs4ggx06VyeSRbfQ+3y8TJb50HeDF2/hRUp//2EhnUGCxFkxfSMDmEgBZQIgH4yIe6RhF0hMz2wP61hgSzqo9NWnVqp5dEx72Ut8ETiI7keJIMVnV6R3dgLxYQt3oXEAuTe04VwBphXy11iyPmuoNwhnkMSdLk4z46CYDLUhgdc3s7dqiqfsBePip29gR01KQrAzvlNpDx2c5ZYSZXcFLo/1cgAEghQX1FbuBnNcbXksb3pFzDvNCdIwZ18Qt63nmtp91Hw3MeebEFGu/FqSk71zRQvNfsOhFEf00LfRUxM9f7puGH3xwh87RWGEe7szg7wAFzX3xzI32A6f2wtYpwrhn0m3/VNpvkZGw2wJNzKcPnnWZFLIedWOrVA/8pitlGUwbSy4M/J01UzE35Mud
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:09:33.5359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e70d30bb-80d6-4830-4d57-08deab791945
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4527

According to section "6.5.3 Normative Spread Spectrum Clocking (SSC)" of
the USB 3.2 Specification, SSC should be enabled by default. This protects
against EMI violations. Hence, enable internal SSC for USB SuperSpeed.

Fixes: 02c35dca2b48 ("arm64: dts: ti: k3-j721e: Enable Super-Speed support for USB0")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1:
https://lore.kernel.org/r/20260505110631.1144200-11-s-vadapalli@ti.com/
No changes since v1.

 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index 53e7fbcef52b..b25bce995b64 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -531,6 +531,11 @@ &serdes_ln_ctrl {
 &serdes_wiz3 {
 	typec-dir-gpios = <&main_gpio1 3 GPIO_ACTIVE_HIGH>;
 	typec-dir-debounce-ms = <700>;	/* TUSB321, tCCB_DEFAULT 133 ms */
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
 };
 
 &serdes3 {
@@ -539,6 +544,7 @@ serdes3_usb_link: phy@0 {
 		cdns,num-lanes = <2>;
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 		resets = <&serdes_wiz3 1>, <&serdes_wiz3 2>;
 		bootph-all;
 	};
-- 
2.51.1

