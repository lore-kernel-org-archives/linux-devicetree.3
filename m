Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011029.outbound.protection.outlook.com [40.107.208.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991EA188596;
	Fri, 27 Mar 2026 04:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774587224; cv=fail; b=ZqIS2ac4gPF7EqxIsomjEyuztkX5fnzeiukeJEleRM0JyDb71BG+ph2gBI+rWe9sTtWkBdwJ3Zn4MvtBXFf+LBGY1Q2hc9t3ED2PZbPR02zUpmImCPSYXePqMfQzfxqKaaHXchOKFzQorEtYyWfLMHeH27FGMoxpWo1IQWEUtIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774587224; c=relaxed/simple;
	bh=lf2fkuunvqT7JrX23GdHW1zpRRH7aquIEMOKYVKwwuA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BYjGitcpd4ShQXH5Q5S2x36VKEsmALBhBFteJzVg1tDX+O7lVhWrZmd7Is76ZHktA76ZUPua7SS94soVaJ6qF1Avn/yx0QCx/tDi5kw/RSDByVttQcBbVoPJmU8IutaPzRkpZYbnZDXIjQ0jQ5g7vjoBBTOK9Wls5UKQqR5a3Ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=IMTlxdlK; arc=fail smtp.client-ip=40.107.208.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IMTlxdlK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMId6XXqzoqZIW45wYVCbOudyzmv6g+Av587vqqbEzbAn95rL05pLaxLZ0nHFbcZ8CsSUqnA3nZ+RUNa1k5oAt5lHvknxF6ltbB0Js2kK2XG+y2l0G2XeTNTuXlgEIN6nsUpKC8ePIRKk8j99o/OTa85MFzmAC4uMxnAObof0GadVtoelqfZdGu2E/WD2C0HGTak7o+gLuVx6BHQkdSClk56qbsw+PSpGSbe/EHNvrra7MhQ1Vfidne4yft8EfUzyepb8yRYCggD5Uc6tk2YNXPNLK2ce1aM1rzCmHlu0P4DGys91Ce5hlvRYghM5SCx7bsy5o1CHy7fFvZiRUIOJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLqGJZZs/w/ieQyTYSc/aBOSZneOLl1y7BvypuKDwIo=;
 b=arSE6x5p5AdfstQv4hlrw3wYn6SU+pZ/hg+EZAZDjNOxL2ev5FG9ArQJWL7JAUvclT89reBHASkqyBoDFzN+OGpPrHbF1eVV646XjlplN+JwImUW/mGJAaa3MKRLDV3IQqtwxULiDpJ1BHkqTGVdSRLH58VTVXfrvHCKEA9JKZRp3P2/3cl8ZkeaXaf6qgqFIYPqf8dxXcIWwbPsUUL1VzoQgSo1L4ygr+qk3iOvFzXGyKtVxz9enLQ9d2azimlIgJc+9fEkz6TuSknIafpmEiVIVJzGDzNj+mNq1W77BRMPVoBPd6ng+elDZhOHCIVeO24HT4sJzLDrj87RF3BMVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.phytec.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLqGJZZs/w/ieQyTYSc/aBOSZneOLl1y7BvypuKDwIo=;
 b=IMTlxdlKMkDIWz8SUvw0rXWb8cxP+n0s6T4Rli0dYmDTBCBcyHT1R4wrWTpx7Yl6C0Gz4wP4fMV2uHn4unRB3WD/Im5pXJhJqwX96UFf+bs52z9fy+Z8yXcJiRBF3b28pCB/5IR3OEyvZYsgxtmPHzDViJ1ZPiOc1VkDxFLH9sE=
Received: from SJ2PR07CA0009.namprd07.prod.outlook.com (2603:10b6:a03:505::6)
 by LV3PR10MB8081.namprd10.prod.outlook.com (2603:10b6:408:286::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Fri, 27 Mar
 2026 04:53:40 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::e7) by SJ2PR07CA0009.outlook.office365.com
 (2603:10b6:a03:505::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.22 via Frontend Transport; Fri,
 27 Mar 2026 04:53:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 04:53:40 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 23:53:39 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 23:53:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 23:53:39 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62R4radx3362842;
	Thu, 26 Mar 2026 23:53:37 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Dominik Haller <d.haller@phytec.de>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>
Subject: Re: [PATCH v4 0/5] k3-am68-phyboard-izar dsi support
Date: Fri, 27 Mar 2026 10:23:33 +0530
Message-ID: <177458719547.543454.14429458104035828765.b4-ty@b4>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260320212349.420951-1-d.haller@phytec.de>
References: <20260320212349.420951-1-d.haller@phytec.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|LV3PR10MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: cd871130-1dc3-4778-a115-08de8bbcd08d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uM88Bk1W1Xs+hTcY+6l16VjvcxtsnI/MJHKHQsw++w75FVWaybZ26mMoKcTo1eu/d668SkE8C3jyqSmQiH8wkawVgRLXyobkgzYaL8wu08GNPCLxYdhvtd36bW9+28n0Tm4sox+dwB98ac1IomjxWnMfnouaOY8XVNWqXHCykmhk0KV0XxieS04BNTP7PC8liJUdNe8YIPe3NAp4MXWkItkjdYeI5a/2j8DcXY9obMCMKcCbrEiR4XJ0pKkMIaB/cp5wpLA7PFSC2dAGSC9TZiKQu+LgePGhlMCpE4HoQ5ylB7G63oUmYAnauEjZdLpmu3QkIQPAtO9dHPlyf1PSaKk6UydJ3iJ2wcirTZP+ylD7Z/hBECH+XIoPCemZfHlUlgYDwCTQEnu1KTEszGTKQ3jyhpJbisnR8yaBftdsWS+RSxXj73VnpB7g4gGEa24Glkncnf+406hLvY2JUwTF8X3VS7BLI0z6sLL7LBu/aGoP3uqF5V5Ecxq2xDWUl+vZA81NnlMK5qju8/I/fFYpb4hhj/uzgriA4vxaggbduOwm8P9Ov4V9byp0Luu+bQDurJzTZpBwB1AdHSB3o+oeLAsfz8EIa95u7tI6TzZkV782M0Se4kVI8WE+hRKoq5q+/2LZv6Kpq/+tKUGytiKRg5EM4LCxSrLCnnsheMmBG2MgdLmYf/K6k29jiRUAiM1nFKboS59i5oEF7udVMY9mrZR1IhOMEQ9zuEB+BUiex2h5+y/rMucFWY3+go3UT9fag4MUl7SVT8/vrijd2mfAgg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7+zrJ+gMm9OE2CzzR6PvOYsHQ5LXU51GL9FWfPz+LDP0ashHCHoePeJMuMxnhy7p4B8oHKc4JCSI6UUjwtJR38k5k2nbUTxMuZrFKostf2Cbg5AUsRrl8VFiUfjJnTNqeolmYCtGLqxO1wZGprp8obfcnAcakVHydUbCr6HwEu4TKUs54LRjvFCMcNopvlajA9Dp9SPkoztpgXKd9IXMBF3RTIMGRcg3QSUGelcGgWJnXvDvUrVsYBtZ2MDNZbsCYF9XuAJfcuP9cXoDtjsEulYGFNWvqlNjyA+uhCP4t0pA7mOTDvFVsfdGPMmYypN9ZNTklRkZYqjJvGusR+e3rllL1Gs9O900g3rnOBCZODMzCUJBnm5Z2sMCyJWm/upMmJAFd3ICLe4jQHuOsDF7Z7JD/ajK2eyz+Qo9DDulCMnosxuL8SN6D2/Q5UVEhbj+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 04:53:40.0906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd871130-1dc3-4778-a115-08de8bbcd08d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8081

Hi Dominik Haller,

On Fri, 20 Mar 2026 14:23:41 -0700, Dominik Haller wrote:
> This series adds support for the two dsi based display interfaces of the
> phyboard-izar with the phycore-am68x/tda4x som.
> 
> dsi0 gets converted to lvds on the som using a SN65DSI83 bridge in the
> default configuration. The phyboard-izar kit comes with a 10.1" lvds
> display with usb touch as addon.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/5] arm64: dts: ti: k3-am68-phyboard-izar: Assign dss clocks
      commit: ae41091c65453b900a9a96294ee7ff007dc671e4
[2/5] arm64: dts: ti: k3-am68-phycore-som: Add DSI->LVDS bridge
      commit: 2295927906ce448a25ec7fc6f5da731b364d6b90
[3/5] arm64: dts: ti: k3-am68-phyboard-izar: Add LVDS-Display
      commit: 1bdfd6abc1ec5d60474a2f0b96955480b33e0644
[4/5] arm64: dts: ti: k3-j721s2-main: Add DSI1
      commit: db0da07c37a2a79b19a07eef2f218dc830275e7d
[5/5] arm64: dts: ti: k3-am68-phyboard-izar: Add PEB-AV-15 overlay
      commit: 6e5df7cc5455dfcfac4764f00d121ee6a6796e2c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh

