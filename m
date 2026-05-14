Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0E73C1978;
	Thu, 14 May 2026 11:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758877; cv=fail; b=oIXdAh/pjmRbEpFXM4UoH0mtTCtFLxUFYUOCo8qUW1xOZfb3/HiaUuA900fJLeFc1tOoa851wJoCasFIxB5qRFxfr39UHtIW0Jd/eVQEC4Glonk2bVnoEOWdgiEg/BvWDrxPkFjxirwOLUMEZHU2rZNAbZxdWPr/Q1Dkvuxbdpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758877; c=relaxed/simple;
	bh=G2UenzshZckeORMZWsmJCvtCLB7rIXz6A55JC7apWoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kApyf01CYCNuVCTZCYLtl93aoSVLS0f7G1xK7BzFyi8igDtOo7w6k87bre6gT/iT24kX7Mzs78NrfYKkjSfLuaYCz0R6SzskfujkM5QPH8DCg1usPZL/rs7mWBzGmcDVGQ/ffdmNRFMRpw2aIs3Ia4bBjVil6+VZO2aUzZdI4hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=faCiEBtS; arc=fail smtp.client-ip=52.101.201.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="faCiEBtS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ez4X04uEAkXOovECEMp4nHNBD6zlLTVHGNh0mmygSkT/yqWqFpebLk4CCDiWJD1D7/xg++AqhIhNQocwqMiR2q0ZVS2xrDuKlL2Flf/UuD0IVr5OXreRrWIUKO32Ngpm5k1vC7B/gSufkqfZhhe0ACzNarvSVoerSlKsa9AjO12iO2TCuN2y2oFgUU2mKLyB650auILgpSE0BScSXfG8XFB4VmQoEHuFju9hEzs+9egKAtsQYol8nZy3nyjTJBzwME+m8Vr7eksPqXzrAUvbrgeWxiM6y3jnS09vVtPGjwXfKi3rn7c5nC/JFdz995tk5FOo+eCK7zis+epNMrQkhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBzW+PbyZQZzNgt5VRdKxHm62FIFIZtz28Hmi+3GIhc=;
 b=nsnYwJj92OHN9CEPpGAWvOP0PmA+qb/lLHpUi3/RjzJBPbFUud0fv9hFlW3Im/4NQrZp+8sP2SoPcbEjw7t9yaUy96YWgcRzct+19H94iWBOKecEl7LhmTnQTzQfaXA6eokJ8IFoPWWlsBb0m16TmYPvfoC0gARwIjEmxRNmi6Yl5e0ci/QS5dm/Qp5gQboN4i/zxLYz0PKPlBKdiGNUIdbM84+vmibGfAr2sE3sjg1aw9977/vMoHCUutpYh/HnbqkQsTqKK3HUyLLmqNCElAt9MlLbQP/0UNp4Zqa2wpi108pAFeW8t12LHUVzp7UhZI6cfSSGEMjJFYKCvajY1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBzW+PbyZQZzNgt5VRdKxHm62FIFIZtz28Hmi+3GIhc=;
 b=faCiEBtSNQCwZbwFCanl3YPYu/ug30IYz5A8cDL+vFBFsZGFrb7VBzOy9EWKeEOxsPzvYfeH8HF0PD4tXoyeE1Xp5Msd/Uv67Fj1Rdp0DXiQts0WB2+O+80zx1zsbrlKbbpKXUgZjzYSW0Bp2Dny0WePrtnzwwiAOSHMekcC1PE+bKrVmtLmpCvnHTDfz7XpY7xb9EL3nNBcl4kiSt+TCYwdJY7zDl8AN/h4pIC6Zn0m25uvIR6vuYRvghgofoIFmwYGFFFDhEIdbfP4XOrA8egeHAldg1EeCMZxlawNG8fBt61Du4uE9K0gVgemdgGbDAh99fmr9wm3jSXliTLSXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SA2PR03MB5707.namprd03.prod.outlook.com (2603:10b6:806:11f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Thu, 14 May
 2026 11:41:13 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 11:41:13 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: socfpga: Enable SMMU and add DMA coherency for XGMAC
Date: Thu, 14 May 2026 04:41:09 -0700
Message-ID: <20260514114111.10574-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0156.namprd05.prod.outlook.com
 (2603:10b6:a03:339::11) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|SA2PR03MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: 700aeb69-2e22-4d0f-b07d-08deb1adb35c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|55112099003|11063799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8grhfncRI4ovRATBARkrDim/FqIMc/2h1aiiV9F78FtjA74mQS0zjtnI4yoZQc8wmGAKM6i0xQURVQFQrDO5DDgP/vsVd2C1e+ZcBM01dwlR1VU2ks48yQzX8o0qwTa4S4Lm4yf1NtIJPGWjbd7mGyz87dHNAmfDPU/2o3+HBQHYw/3Ar214vLlCggSIkUnXlw06aNCTrq1NKoMM1iWyT5uRXKW7o8Zqr0IvPaUdJmdXDgRmDH2ZnU2/0urcUAiEKi8m8W/a4DH5vGN39Vb+DAGsh+A0hJKzgDaZTrs7vUr8LGQkpfohtFDu4F2w0QS061uf1RcnxtG9Xq3xhVG1ncwtZK4OBbio1zDxt102sacpTuMh6rhdaUL1P6APmzzX3/Zy2KDHEUlTMxX78wIkvLcuEueVBbvP7mVi+2yFKsSFKbt5gkera+/nN8qVT1/ZhTW3fU9iQHOiohr0dyZNxfMdFrxa0fGVzLykxflO95YpA5dfKh4WVpbguXFc+nAKMBfyiuMVZUGM56yQVkFqwzEh/298KPI6myU9wI0cAuGWRRp+xcTmgzX+EhW1rT1LdK6yAZNCmE9QGPL1LUQ4AHfasdXJANp22P+tvNyQ/82QdN6C7H4y4R1Tm2JlWtTvICp2WI9Qgqy247eXYoQztlcfVt5zEePx7Lmix/0tA6UIOqtTdHlVkpbn9CwCwpKm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(55112099003)(11063799003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6F2Ef4r7g4QoK9TOYsGPombvIchSxqyLUhwF+oidQt0JPSHqpofWNGgl0zLw?=
 =?us-ascii?Q?GW3dLlvgZRIvMwq3lbSsvbk/adqeNVNWjbJIkyviglByNQ4JNsfRwDigZNZZ?=
 =?us-ascii?Q?6uiPkklHIPTL9yyN+KG7bCPi9X5HJ/QTTX2iX8FG1npjkspjJnEaui2ttYXZ?=
 =?us-ascii?Q?I29F0CPh2MbCX1uxVG6y2duw+GGSqVo/DG1Km05QXE4HB3uAZsVBM2mzDmtH?=
 =?us-ascii?Q?qFXY1PYrFVmxuqudbPGBtkNT/V/wEF73g5Z3Fxk6/oRpB6JxcY6JSF05hNJj?=
 =?us-ascii?Q?QJl/XgrjJpOfa+hf2mq5TRFeErMlT7q3CdFgNiAjym00yCRDk9xjOKc+0rmX?=
 =?us-ascii?Q?5Ms5BgHxTe2zsTnjWowiT0xWnth3bNE/08ARJZeQGVdFbFMBNPQYPwqaf66r?=
 =?us-ascii?Q?S0QzRQuUrQWR+t6yQT+L2bC0ViUlcJAE1ulA36rJES9omwbcPXpeQY+NjY0m?=
 =?us-ascii?Q?MNNWcn9YvI1LYxWOFpDAsLxYH3r/bFszLjt09cBIFF0bJUiaMJqAEm5VA1Qo?=
 =?us-ascii?Q?9Pc7EQcI7Ed/aDcRCTZ4YHWTxnjz8dkT++v7DRYnieVS4IdVNhKSvUpkJJYL?=
 =?us-ascii?Q?dZARQtkxDDWJq1kgj1s4iZnU2jwodjn7kDMy01lEvYTLR1KbEblo1tvZ7dHq?=
 =?us-ascii?Q?98gKBxTcCKONCFL3E+/muQeyjYNEPf7zt7x1WWvKKPFO6aw6/QXwIyxJlKhb?=
 =?us-ascii?Q?Qev4TbwBl6JZ/quRvZEmF930fEprKsAZJDyV6Cs+H2dRTijSui5iLJH4YrT5?=
 =?us-ascii?Q?oPcR0TlqG6AeGrjVg6rZkFKZUzBif44Eqoo6tXljw9A4tzf/2oI6Y/fDBjaJ?=
 =?us-ascii?Q?yZ7RSNsI136FoqS0mx3+dkpRBdjOCzwAz8Q3TRnh2Fa0xNOJ5HDuEjhOsMyr?=
 =?us-ascii?Q?KVHnImXtygGN15wtlU/J7PIUHUOBvNuQU9lXevuyaY/3i3FSC7ynz2SemZzh?=
 =?us-ascii?Q?1G1tH6N3ypffJRfQ3PnrxU8Ow1rOm0SlyNlswuEOV1/1vE5jVfWK6tTMdt2l?=
 =?us-ascii?Q?6v9+R701OxavczydkThPm9ErDUuNTOT3PpQeEHH2zkQHMX3qrJBoQUINjvpR?=
 =?us-ascii?Q?N/FOTpSgBMZT1KgTqavtIVkhij1sgFxQqFGjy8OZoQzOdOF7EXv1vI5bainp?=
 =?us-ascii?Q?5oQ0KvsRQcJ8mJbQau4ej1S819O1vlMR0Z+TMw+KohNv1q3506Pb2T2U8qXy?=
 =?us-ascii?Q?hTKJEWb0lWTrBdB+vaa80v8DGSoimyetCMkOlgRwMQfJs1SyR7GJ2hYlpwX8?=
 =?us-ascii?Q?svhtzmylzM1kRfpcCrwWe1n+7OS/B1cFqMIvMSNB/rlTu5JKOj/vaS7fQnyt?=
 =?us-ascii?Q?xX53oDccagoTermQGppQtliWVpm/R1QjvtOfw1TrSyzuxqK47DQBCK/DjrdL?=
 =?us-ascii?Q?BPRbzvG4X1hWHABV0MQ7nlyggptVwwfb9dQb4ZnNcTAXiFCnTwqbh6ydWRNK?=
 =?us-ascii?Q?NERihI3VrUrq9wBjGjpCboJtv+b1bPrEYzWLYMFpfSYcOvlVhzunl2sI7eRF?=
 =?us-ascii?Q?eQ7QmM6lBwnQrsrVVrsFpcIOepN9QwWoRJs1lL4ZSnFdxfi98dJMBn+Aefq9?=
 =?us-ascii?Q?mkr1by7pZnbIJktAJy0iFG0crzcyJaycTv8Ipq524zmTew+qMPfAi5FS2jjO?=
 =?us-ascii?Q?lSPaNHx6t5Nne5x53ZlUxBFkw7Y37JJde4OreAj7GUpajdJ5wx0hleLL2z7/?=
 =?us-ascii?Q?NzBdk32A/eTWMGflB9Z1E+z2glgemJ5edOzkdfqqWyGNKySp72SrWxd/XPnB?=
 =?us-ascii?Q?BjM2jNb4infvi+NCeUM6m5YWju3e37v1NSjlaUnGkVkutP2KJWd9HRKtENyw?=
X-MS-Exchange-AntiSpam-MessageData-1: Iwy1XQYDxOmVmA==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 700aeb69-2e22-4d0f-b07d-08deb1adb35c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:41:13.1428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhMhTWZHaHn9HHscDgfxTWP7gdZBlWqEBVQ8XQDj8JZwyT+PSYw1ZzAIEg2NtY3/u5y+b59qwo4xzcBvHnF0htFESZ5Kz1v96YoNOuME5QtSCmdI4TkQT8dYdhEMEbjvv9UAXO97f17beV+2/V65RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5707

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

Nazim Amirul (2):
  arm64: dts: socfpga: Enable the SMMU for SoCFPGA device trees
  arm64: dts: socfpga: Add dma-coherent to XGMAC nodes

 arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts         | 1 +
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts         | 5 +++++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts    | 1 +
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts | 1 +
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts    | 5 +++++
 5 files changed, 13 insertions(+)

-- 
2.43.7

