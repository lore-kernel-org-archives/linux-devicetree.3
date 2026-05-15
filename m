Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011021.outbound.protection.outlook.com [40.107.208.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E553DEFE2;
	Fri, 15 May 2026 08:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832019; cv=fail; b=sdwhzfEI5F2sh2UEuIwLNRYdUGs3EXP1XKKOxGnCBbQR33FuS2nlbkIMklrT0w5kNoJW3OrLD1n94/SJlkRKoo67uqBbiUYsGETp/33ta4zaqgRT9vy67f/pz4pDwCIboj7Cz+16lZPRA8Hby6yN4v6MmXtsADUNdygTV+M7w30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832019; c=relaxed/simple;
	bh=8c6IyMtgEnDhuK+P20x6+52Sz0SMI6sgmOzcsUCkQE4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BzmvtH6dhoei7e660gcxcdGU2Btg3oz+1V3uQRPV77R/0mUlU1WpJiyJ58Atzxf2j3wVtLaoc/Et0rs4MHssm6KZPjh00N6h0C5WCO027YWzBdVdjj4mmkDWc9yYA4b3t/+vDtJsAg7EUkymoYhY3bihZfVr/NU3VjZip128WlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=aLsPs939; arc=fail smtp.client-ip=40.107.208.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="aLsPs939"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVaAeinvWiqfHaTR9j3cKRLjgZKLLzeWq7Uegd/RcPbpcHZJzHl2UMCgOl4EfhzEg09lHS6g/RiNhmA6wdngeKScBOlNZzPKgGi0QhSXVUTCWTtcdezPcFco1eAV8oTBUh5lW70Bbb01GzIFeL8EtU/HPq75A2EvylDVY9ha+7iqm0JiMvNzOeiACcyNa5xbke34jldKf9wiQV1GWi78vw3cXvgVMkLRqbN692B1mIe3nlDbSv5r2Nc5rE0djQc9ClVlcSh0M0V/0FeYUNd+1MqLqRck6+uB5KY5riDWgXR1Ya7L30quoMhD9BpWmE0FByF8xaybp7oWiKBq1Oqy8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKLGsAWD2j3tDk9rqEqW0Njb1fJlint3paXy7nqmJ3g=;
 b=wFEiN++B84Huv5qbo/s7rJ1pcvif6yPcdS8/0AmlHN2BtH5f6GJNjINH2jd7zDeiMhbkXy0LIk2VfhSpytWTWl5ADMdtXm5QQl+2TdvXHQWDP8RQJueJK6p38Ztl9tHSLIn33cHQZpGNCFWrShPT+aeeJldiI0aBVD59OIX/dFsnjuUB2ZqEdvd7xxQVTAvGyZ6KiBv4We8/FoiEIrkUK865oN38/pM6sP5ySONaRSSX0CdBGbUB+2OYI/dT8b5kRCkMvHciVt+zGZWhnNAA+sIKWcEVxGPl4FZSHRySzdrFe+HiY7X/THe/ZoRFrwbXspc70w+2fun4yWvqok+nLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKLGsAWD2j3tDk9rqEqW0Njb1fJlint3paXy7nqmJ3g=;
 b=aLsPs939Ag18Q3Exf2Rlb5S6uxHPf/pyTG3kUgU8Cb4kzDEQZ4kJVz+RyK28iSd6zXhvOyOMei71AYgyD4SZNPVjGwUIyE/7fnQT1qXEXIJlNjuaqAqXhltLcRPGtHjDbDD5FzRzOaYAz1jqJ/b98oI6P5zYhzYEIvt8wp5MntnVZ81kdvMEUe5NWWbEn0ulfGTQox1vqlF7ErRW8BUrI/g1novmbm8mkH/du8Dyq3IsF3/WXlq/BOCg0Zji+MGEIgJpL9N9XZ+gnTv/8vlKuzM+iTgFSWZ4SQPIlzuHrrdSNF+xplTG03NGoZT7V8stleXLSj3YdY3cQrzzM9ieYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by BLAPR03MB5634.namprd03.prod.outlook.com (2603:10b6:208:285::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 08:00:15 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 08:00:15 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: socfpga: Enable SMMU and add DMA coherency for XGMAC
Date: Fri, 15 May 2026 01:00:12 -0700
Message-ID: <20260515080014.6260-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0007.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::20) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|BLAPR03MB5634:EE_
X-MS-Office365-Filtering-Correlation-Id: 453c47ad-2104-4b47-ec4c-08deb257ff8f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|11063799003|55112099003;
X-Microsoft-Antispam-Message-Info:
	RpTUozT6YGRSHhWpa1TNa2Tu6gzlB9mr5z+Vi8YNl9NRw/uQI5f9HFHebsUJ5c0JpU+cGGhiqwNqW4h7AXB3nrrqrSStUA6MYWr76G4SlDhFW3OAoBPJb4l7BgN2Xo80ZnNP7QSePKRWW3ShZypwkT27vgoJb/z9R5411IFb48XCIsja2xV3xbOE/zdBQ4r+kcdBLgrX0bwg2gG72RmYeqQwWEe6jQiplJZR/99fepx+rwMchvrvNdP1rvnB5oCBS+wgalK826aMXK4zIVyPJs+KiPXsyfJ6XkYBOZzWIXSL7+h6HaxoUMyA2wuB/4gkdNi2o+LjqSMas+yOg57oOly2CyuWP57i0spkF+T4LBXVhetUYp5SlZSLaN3X2sg5I1GDehsHUXGes/qkZ+Ho4n2ErU+lQiTewhEMdnTgtt4+udUyt26Y91QgE77ITjt7zygBe/fcwtTD3ZxXaqe/wkY3Ll7VJuFzPELpBH4vIjO9OcAw6Aa4crt54NRthOUtvPOyZhOtZ4Ft7kKxsCJCP9YfTVwbANvgVxhZUu9T4KB8IZtkg+Is5rWCWjbPKfCpNdAMrIl1zxRSSUR6HWI6uK4lIJhEUx4Pxh9WtdQyKiz3b4f1scHMbRrmGGMnFk3vjS9qyY/5MQJq77VXv26jfbAqGDunOaSakQE/0oX36FgwxiD1o7ZtGJf+z9D4UhA6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(11063799003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7y0SwHJEDKtGKrR7QAfQOmrt3BcQRIy3PtRpVrDYeTGam5LJTWeL4y/r6Kfj?=
 =?us-ascii?Q?XmZWu79X7hDOjm3rf5XBGGzqbugUpYnF7ASFShLkDtCf1JqJTMVWAse2PmNZ?=
 =?us-ascii?Q?sAkrqsaGywCNpe8AOIBn5sS5biPNtgPibkKoa5dof0uFKjvDBvcnjsZ8ZcJR?=
 =?us-ascii?Q?JYm0BzuBlJzCCE27nZ4ATod7nLgL1WygqQ8PrdgBNFRH9v3AUJS+8KbeBSD9?=
 =?us-ascii?Q?d9BMce3UeuN/ihylNmB1kdAwhTDyvfN4rvOOp7YfzW56mkILR7svODcPs4Yo?=
 =?us-ascii?Q?mwZ3muv1L2JWc7PwviQF4uFWXJVgDrNsBpVBhCYsrXrmPEWom2Tb/7MzioSY?=
 =?us-ascii?Q?9TySy+LBI8F5Q4V7IeuO0X8TK5ngv3TOxQeLBkbT/zun5TKpfRV/ijRNfRTT?=
 =?us-ascii?Q?b/wH75hADJdSclmyeIXXSNO9ijljMktUP/3LvZ1FxioiJ5gsITx8Jm6lvj6P?=
 =?us-ascii?Q?/5SCyVskPYM1gloyTNeUbAlLUkIcLIUVqcahgk0aLAC8zdPZeZNih32zdZPZ?=
 =?us-ascii?Q?8t5+a0MJibjR3ihSZ+kjPp/QUU1W12DxLR6lEd6nndxGwrqyomCXIoGo6BNb?=
 =?us-ascii?Q?9yTcxOwClLsI7c8gHG+ppBSEJ5j3FfHugkDZJmJi+sWH8PPhMjXuIh8IOzcM?=
 =?us-ascii?Q?T6KeG8HgBUCc729I71VCyOdEuojk/ODgoFeENmYFRFQc/nPGMJEBws48kkXf?=
 =?us-ascii?Q?EfuE6TREw3GFu9IGPsJ7OCGnRHmiJx7ZRmTfSN7N1PJcV/gjL8oMsO9aiS1E?=
 =?us-ascii?Q?ikR4tI19ANOOctHMs80E3vk9YZtoPdGIvAjhVXiMW9MiBf+1Y8D+Z1uG2mz7?=
 =?us-ascii?Q?perdudOeHw7NTAkzC/SEw71uBGDT1muS3LXlM0lQaxbYOGKNCHGffax3+5Ua?=
 =?us-ascii?Q?mSs4s08YoDU8mRbBTbHJnXXepZyeWnNnKZxgbrO3iTVtZqW0f8brntix15bI?=
 =?us-ascii?Q?KJowHTBRjYwrIVahdx1rO5/tE6GsuPsshfSIjQumz2EFdpy+aCfb0BUiekFl?=
 =?us-ascii?Q?XCvIqSuzBwRlLnLZsqSoYzpUfHHTVOBiAk5fpboY2Tm+aCX/hu5VDUn+9a5L?=
 =?us-ascii?Q?KVCuNbyp1rJ87pDxRSWPQP2ajEU4LhXeMx6L+xanU/cFUMFb9DEdzLmk3P9b?=
 =?us-ascii?Q?QGOxpvHYNii11pd2A5mQtvBsiuK9WnX8ucEKyg8v9ZAZx4r+9xJsUiWEVgmT?=
 =?us-ascii?Q?yTPKzCEUjormmOyATHFpymBbh3zwaZFR/Yr2duZ584BM1mbAu/1VuxgYmfHk?=
 =?us-ascii?Q?89Nu9LYFFG5jWvdX+1QSfLr8cB8h6Ez3Ckt4beFbaz4L4yjVnQ9KdDX4BGqF?=
 =?us-ascii?Q?VIuRczEt3x8w9Ml53MCtTM4qVPAOWeB45HCVSneZzwx017d9sMi9YJEk/2/r?=
 =?us-ascii?Q?hOeI5CAf/0/TGVGAPa6cm5U6B2b9M3NFSBDZMkO+IyyLeyf/tdJUzi+QjLIf?=
 =?us-ascii?Q?DXrLtRP9qptaOFf4zP2BQRFv/jKhtuVuyhNUMC9HY48ZELO/86ZuDgiMeOba?=
 =?us-ascii?Q?eBFYUZOMo407DZiwiIAyHEejXZg7i6ZMoThPIfO7zpUcau2iWdvfiYivwLWD?=
 =?us-ascii?Q?sbngIGX9VIQes059NaJnxQHYGsBV+HuBxfmpy978uRR2fIwScwo3naLkqbLy?=
 =?us-ascii?Q?At4laeiqIKkkDSO0N5BiCm+g0uc4gUJYo+ei/cjYxV2blEaB/5pNmixE1Lkk?=
 =?us-ascii?Q?Wa37dWKZfJi43GTOqI66zB/GNeXHNKDHrwKgsWCvqs038Y2RSn4NqugUwkHj?=
 =?us-ascii?Q?2xkMTcVWaASWL8HiRaXk1fxCMPHAxWMkFg4MklKfaLFtp4/5GBCCUIZBD8c/?=
X-MS-Exchange-AntiSpam-MessageData-1: NBCKl4aF81jXlg==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 453c47ad-2104-4b47-ec4c-08deb257ff8f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 08:00:15.3900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2O7xclvYEtA5ukhTOsyRb2+5uYBi0gp9oMuCI++7trm1SrOy7/coWkneViRwfxEvJCBah8LLvM1sH1oh/CMHYAnQR2sy4tIppNlQGLtfGO8K5SdeUlfonHxwHKSyvKVqmTjZDa64AHPar5jqcpxfxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5634

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

This series enables the SMMU and adds DMA coherency support for the
XGMAC nodes across the affected board device trees.

Patch 1 enables the SMMU for the SoCFPGA board device trees where it
was missing. The SoC uses a different memory-mapped base address for
its peripherals, which requires the SMMU to be active so that the
Secure Device Manager (SDM) can correctly access those regions through
address translation.

Patch 2 adds the dma-coherent property to the XGMAC nodes. The SMMU
is enabled and transactions going through it are cache coherent.
Adding dma-coherent prevents redundant cache flush/invalidate
operations and potential stale data issues.

Changes in v2:
- Move SMMU enable into the base DTSI file instead of individual DTS files
- Move dma-coherent property into the base DTSI file instead of individual DTS files
- Improve commit messages and cover letter descriptions with more context on why the changes are needed

Nazim Amirul (2):
  arm64: dts: socfpga: Enable the SMMU for SoCFPGA device trees
  arm64: dts: socfpga: Add dma-coherent to XGMAC nodes

 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.43.7

