Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010043.outbound.protection.outlook.com [52.101.201.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7F73A960E;
	Fri, 15 May 2026 13:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852979; cv=fail; b=UsKYyzbupjnfUL9evyIckVmKf8MJByD5+L79mycGYHisn14PlT9I/GatcwxB/ZEM9Dofm2D3QB5Bp8yiG4MzOpf20Y1HPY+Z+kIz0oMJ/cyGMvj4rQTpPuu+8ObVJMOiynRTcrj/CgSa1UDoeE8PIjY9Y67IT/Y3I1ftw/DxQ4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852979; c=relaxed/simple;
	bh=0gpcV4tIQhGNHxG4dScWCB8VpAETWfnKkj9nRa86ebg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H7KkCGqp6PURqxFSewL3ceXrHnzQ/ZCUe7sPUTQ29FvaQAzEvF4py/Mxvzc5XWBOKaAkH4CdqFxPfATpJ7Qg37o9QFmiNMv+IbgEistzcj47GxsVdAqfpyAD7jN7p1BDKuXQIBowJk0vOsKDLU5LWPOHuFuy3Z9fXjJrU7uGKFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=muZNrvA3; arc=fail smtp.client-ip=52.101.201.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="muZNrvA3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lvh1O/vGQItM/nN0qyQfkLu3xkhLH84cJ5DCA2391bmQ17LxtRWoM47AV2mCYVGuoDnUhrkyJIjVoAWefVFCDAltZFZ61BeUhm478s5kwexgMAyYxxlkFCdHx+TzEgSxHsCQMBMDN+ou7Oh3sG3YC+aTR81mI3bbHi1TZqSb8LIMX8pk6gZAY6/QoxIgNic861XkDoFq8QOIoaIqeqrLx2UEyFwuBJ2xtIhHtxqkas7wc6hGQ/LNhBBYxdDrsSbLWZGoVnbgcK185oC5wILJOWkTdBY+3YrHE+hzb12ts6Rh4apDQzhoIjCS1I6D3THwks789stj7R0kKaT6FIDMrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQVeOWx7iw5YJp6VsO++lGZtHEAOIMcxlHFpSrd7isQ=;
 b=KAxFMW+8rmMYticEW4UsQSjJAl8ZhTztNzh0fb4xkzN+WAOXAA8TPokzA6jn1f5L/ELooxSCDCqTkTtE1qfbIMRD2PJOoJMTwbrWof+bk0QZolfPuAaLL6uD6vGnsDJf/2zIEtAE6BIstFuePJ91OWPxqV9/W1aYZgn84P4eUToE98ENea1WF8nPtKecZw5iBeCiI2vWKdOUlmevZ1QZiL5YEFgPUbM3XGC/zMl3SkrFT9XeH/t5AuR08QDkKy6DCh48yAiN90vPldbp+i4Cpg6s98BqTSgi09pA7HwRSA+KhA0Idhda+Vw0x9DpijByzllJob4QeQXnIyVoolJBUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQVeOWx7iw5YJp6VsO++lGZtHEAOIMcxlHFpSrd7isQ=;
 b=muZNrvA3w9DLB/Bl/R9gdDsmUonRhnYmokkcbRoq3eMoQQKIv7yyG0aca1zcxIP64D0y9lD+inGXxOfpzbCYkOMLtoQr9pLRnEq2XIbwFmeDhdAVP4wSNszHZW6AmA2BuX/h6upK9e+koiERJgkbygTnZz+KDfpW4KoMIqy3r3Q=
Received: from DS7PR05CA0094.namprd05.prod.outlook.com (2603:10b6:8:56::11) by
 MW5PR10MB5762.namprd10.prod.outlook.com (2603:10b6:303:19b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 13:49:34 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:8:56:cafe::4) by DS7PR05CA0094.outlook.office365.com
 (2603:10b6:8:56::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.21 via Frontend Transport; Fri, 15
 May 2026 13:49:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 13:49:32 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 08:49:25 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 08:49:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 15 May 2026 08:49:25 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64FDnPjo351833;
	Fri, 15 May 2026 08:49:25 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco@dolcini.it>,
	Vitor Soares <ivitro@gmail.com>
CC: Nishanth Menon <nm@ti.com>, Vitor Soares <vitor.soares@toradex.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Add DSI to HDMI adapter overlay
Date: Fri, 15 May 2026 08:49:19 -0500
Message-ID: <177885293435.150913.7857351307778264255.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260506143427.348806-2-ivitro@gmail.com>
References: <20260506143427.348806-2-ivitro@gmail.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|MW5PR10MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a4c672a-658f-497a-85b8-08deb288cb50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|3023799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	k4QlSEx+IGaYgg4brH/uCTXEaqlZYngG9IwHIs5JzUQi5NFlJlGTnCPrRDQiNQ6ldDFXhUOIRsIRl2ZhfZRBZHWplleh5w0ELGHA0hzDmSIsTaz9Q90w4oIViWMfHZD2pGmJ5oceJpfSmddRxvwZb2ixBCKutrBiLlYij6gfzerJy9xbx7Utp3EecRpo2wkaI4q329Haw8EkS4ZLdEZogBD6VMuPiUhGDMP7JmLhBvKr9onfiYmOGYPggF0sTtQ8W+BsesOOKR2HnagawGQaG45GS/3+N/b6BJzrhQCuccdTyUnYn9kCIHHrz1PgxVEUOliQtI2NGl6jRhopFrMjzJs+lwY1tXtctk7m59zWvCLwPUDoAQG/phJv1BZU4xkebUfzYQcIdQ0cnQwg4B4lGClu65BCJXFfNabpchvVk0dMyMYAKZmHKln2ZxTnPJv0HWaI095fN+p5ajJ8wpsS8mIjgrbpPITYxOUqBxh9WoelHWb890vGP+KRcfUsTndzZllWPGXeEZiNQRKFtMkm8KOtSgosaigGWaCqloGCc4uDq9CRbWGc2giSrFuFPgeTarrxpeofZmFCQpjItAEPtzvYTdsSk2zSiFkP7t4NjqTWpoBAFxaKLwD6HM7FNFB76YaaV4x0qXFpHc/9CEQS+ev2s7Ov3XNJ/3v3RF2XjsoCwEn01liW5GpoytdmgwNiEPcUcYM8aQ2m7yHPLpk14RTUEKAic4hFmRmQ/ccxvXs=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(3023799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4ksiVClnMbaWOS2yAxFVXBCZyeiynkCEIczGncwLNO3r+LHsjmbUuhXnDeI0cejLknqNUWdy3hme1r1tHItTEAUOHEOMPE58yRQiqJeFvMOFhz6mXoUwdz4uyRBNTZfVjKMPAjap6wWZz5Abh6A9H6dYsueledJAzB1NwdIjk8TzxORCcsmp0sDgh61CSdmS2M/t43aR3IMF31N9NV6sbjJSFY4+IGp4hp1/ehgpv+/3KyWY0O6w4Q9bPa4J226sAGczzP1t3yQHn490ROABJmv1gVXAq+JV5Q9w/osncHg5abKDiQcC+CKkGmUClSp7hZsMLWROlrgzGlHh7KG5ZTQuL8DosSbeubqtCeUitp5xzdRIAzuI904cANuffaoezdc7s+zraE3BbMmpz0F/EcXvbEXcpVJEfecODQiiEIfQgDLFoohOtXNRZcArhbBK
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 13:49:32.8469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4c672a-658f-497a-85b8-08deb288cb50
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5762

Hi Vitor Soares,

On Wed, 06 May 2026 15:34:26 +0100, Vitor Soares wrote:
> Add a device-tree overlay for the Toradex DSI to HDMI Adapter, an
> accessory that connects to the Verdin DSI_1 interface and provides a
> full-size HDMI Type-A output. The adapter is based on the Lontium
> LT8912B DSI-to-HDMI bridge.
> 
> The overlay is also combined with the Verdin AM62 carrier board device
> trees to provide ready-to-use DTBs for the Dahlia and Development Board
> carriers, in both WiFi and non-WiFi SoM variants.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62-verdin: Add DSI to HDMI adapter overlay
      commit: 48f1f6f480741f014f3774096236fff91cdcc297

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

