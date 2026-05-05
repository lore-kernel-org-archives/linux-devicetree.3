Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011039.outbound.protection.outlook.com [52.101.52.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252A647DD6E;
	Tue,  5 May 2026 14:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989772; cv=fail; b=ss1kwJIbvhlQHOmsHQqNZcayC3CRcU7Ces5yegD2VG6ikjg6r8fmPkmxHQnwJ8SSVFcip4qcmeV24j49WZu2XvGsj5eFhEyr+NIBrEdybyhI7KlSyBejArzyodMIe8JR5W1E1UyRUKPhxoiLuyCNj5ldIIZTMbURMmMtpKX13Og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989772; c=relaxed/simple;
	bh=0NXxT9QKINrhRDNgARM9T7+Kvk7oZLHESfAmZ2dQEVY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fxKmcok/isoJMgGy5h6a/xoTy07AkvZkT0fCDS3P4Rt9B5LVksiSndOmB36a+7UcMKU4oVv3aLcP4EfhYYNbwQjoBhUXAGrzLBcdy04JZQ+x1pzJZM176eygbeDYu48FQ1LxT9Tb4Ter4BGUn7boI+QMyuNLHx/8c3J+kxQF4xE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KT6hv41Z; arc=fail smtp.client-ip=52.101.52.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KT6hv41Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUWZlIPlPeVpHjOrr1DFLKCBEWSeRUBM7Gv8vRv1uAjZnl7MXSHAIpmOpOOaDiZuu4rzJ2jamTR4tj3Hyyn4F3HPUtpJmslmqg4YU5px7TwVyvXMo9tIuwOjftujoTYLQZR1cSESFJXa7QAIDX1DrX5X7dWgkuszcnY74mHdtof0wLFkv9W1EyzJHMuEsYdMled7g/ZzsI4xAV0dI5WH40nEE8irMm8Xgt8YRoiVRwQT0V78e1L+64pcT8bvEZCsPTdrz8o3n7dJgw5LxbduLR7IgjPZgiIi4jts1fVtl5ukMsJuqJMcKkKLG84TMmPW45pFOZzpRfW6xYHsCOe6bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Enzxw/hZqY0Vuc33ER51oy8NctosVpOqLbOYoifEcuU=;
 b=lr25+/BTUWR1QB5n7zxcBlKyCl5QNhRMGUtdOL14akueNauSCAA5RCPv8if+q/uqDwi+FMZLQG9pqIvefxu3LXIePs8J0MIDUQVUjiwWFIQrieihfs1xcp9QsN5rD68IVMmlaEGR9jT4sYu+PteXhJ/AeEswPNByn0oF5ImI97NrR23rFwjg19ByyLOQjuXpG/GZvQ/ww5485SRyQMnff5Me2gsfiob0QsdQN6oBGd9rrBMHF5+0vH30oEDtco/4lSWZaApvq+7SsELBfBYG7OnAn1dtVp6McMkge6YV20QV8R/aj2/oFnZx8EAyfn+Lv6oeVISYXRWFok/xnfOtWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Enzxw/hZqY0Vuc33ER51oy8NctosVpOqLbOYoifEcuU=;
 b=KT6hv41ZaBi/RInZvXgEez5Ou2ZNgr0qseoQ6VjeMcLvmzWzhN6/ALNpWS0W5qpl5t/GiJ4TTnpWyMml3ldwb9POlbLCwrVE2UO8Jg/SW/8dKe5n/j0/y4/nyhaKoesDhURBR1idK2D11zjQ8siLC4tc/8+71xSeG58k4Mv2YLA=
Received: from DS7P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::15) by
 LV8PR10MB7728.namprd10.prod.outlook.com (2603:10b6:408:1e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 14:02:37 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:8:223:cafe::fc) by DS7P220CA0023.outlook.office365.com
 (2603:10b6:8:223::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 14:02:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.1 via Frontend Transport; Tue, 5 May 2026 14:02:37 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 09:02:35 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 09:02:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 09:02:34 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645E2Y5T3394389;
	Tue, 5 May 2026 09:02:34 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "Richard Genoud (TI)"
	<richard.genoud@bootlin.com>
CC: Nishanth Menon <nm@ti.com>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>, Gregory CLEMENT
	<gregory.clement@bootlin.com>, Thomas Richard <thomas.richard@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>, Abhash Kumar <a-kumar2@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] J722s: s2r: use ti,j7200-padconf
Date: Tue, 5 May 2026 09:02:32 -0500
Message-ID: <177798973239.338123.3632669917171342024.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260427142901.341861-1-richard.genoud@bootlin.com>
References: <20260427142901.341861-1-richard.genoud@bootlin.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|LV8PR10MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: ce0df134-d0a4-4f4b-c68a-08deaaaef6b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lUleDkwMcvQnj/UmO9gOlqTVEv+9GzVzC8v1emeqpeNQanCpDzL1QwzbGc0pgCHH/BDzhMcSr76miJM2VEfMvwIxvrH2Tm/vMoA6qBgvwxC4x3NqRI7VbMWbw3lwCpPVBsdrQ4OY7+so7+gNcgnW/RFyz4ISjRMfxl+uRPJTnwKBCoxO09Bb5dJIoJJvc3hE1CyXTPAq8c7NAoT6dLoetMR9YXgQ19az0tV/t6UyXLTtADuCLXyfdtAf4CD9bHlc00dw2mDDug4QBJeOQegNbwbLcLFi5uWCY3pS1w6UE9buW29s2d1Tq8jfsKEehloVgoC/hDQLLrwBM1SUcCVwFxiXKjwf+rYJ4vLXqfGBgGtD2thYsYl1Vkld6SkA9tIdw/aHOb8GX/rZrwZjXxzD2uyszx323GqLlea/mGht4NjoletfmzX23fljgrHVJuvAQ0mNTjAaUaEeTPKjxrwRjoBBCTFFHt+qgXyVokh16nuoi0dD51JGdAYP6Nf6LLB1oNUwlrip2T4r3Ke84lkBAdXcceSrU03aOELnUxxQmE2KbijrJcefZJ74/53GkreMw496GEWZrpz6EexA0l2Br8Ix8wvtS79aaOAbAeLva+3W5Q7XqBNOEt3bXa9qF223ih5AIRtZgnNDYP2DNCUiYASpPErB0mAm8JKveDXpRIz0ca3t3000uyUMMnUhdtpkPtKBLDdN8EiTRCbTN7tfYkYbAzSnLttwYJQhVPn3s94=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pFAjZ6p+qBaRINhIQXQGvhenWeejtRUeV+zryawvhGLz/JEVFPE6hjh3g8dWeyQgrXyCYrX5JBt96ORSxdOw9Jd+mO7JMRJMzl63X772060gkMN1NxWuZoaTUfKYBNrXnipagI2+CmCY81bGFaE9W/8llBF0qw/no0JNj4wgthtigNIRf4sm3PEE57FE+f2ZAy3gUqFH5TwL/VIW5rhYdILBlrDh9rHCnSmr41Sv6AEFmey1wXKLhXroBjLj49H+MDtQC2uTsDKVA0BkiQaGwubWdtKk6MyexNwjaxZwG1EM3xRDB8lSG6nSFbUQLYu5UFJ4E8NbEB8pxYFsfgefc9PS4hl50ZZ7OG3bM96IrAkErSIv+cMCiXDFkuX5+DHV0W2C3LwgflJ5qF4HMT4oRxuzLsysvLQqy6fDqjpSHG2lEE2vVPd4x3b4q5kLodY0
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 14:02:37.2149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce0df134-d0a4-4f4b-c68a-08deaaaef6b1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7728

Hi Richard Genoud (TI),

On Mon, 27 Apr 2026 16:28:58 +0200, Richard Genoud (TI) wrote:
> The pinctrl contexts for j722s should be saved and restored during
> suspend-to-ram, just like it is done for j7200 and j784s4 SoCs.
> 
> The first patch adds the ti,j7200-padconf compatible, and the next 2
> patches introduce k3-j722s-mcu.dtsi and k3-j722s-wakeup.dtsi, preventing
> using k3-j722s-main.dtsi for something else than main domain
> peripherals.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/3] arm64: dts: ti: k3-j722s: Use ti,j7200-padconf compatible
      commit: 92468e053476537250e750ecc9bc648b0b1aef09
[2/3] arm64: dts: ti: k3-j722s: Add mcu domain peripherals specific to J722S
      commit: e6856de612ca8941b7435c91a0f2e770d1a981e0
[3/3] arm64: dts: ti: k3-j722s: Add wakeup domain peripherals specific to J722S
      commit: 6c21336acd5b2adf33ec73f43f31bd389381da5f

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
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

