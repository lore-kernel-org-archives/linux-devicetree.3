Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012009.outbound.protection.outlook.com [40.107.200.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B73C35AC33;
	Wed, 12 Aug 2026 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786521440; cv=fail; b=HN70LXhgm+F3bKcZxXAT0bI2i7grcUq4H48ROhph0OrssdMxv4Hd8ntzw44SE4pLjsGrxpSwPgeC1EanysPzLH4lLBGzqpWFAeUmDXjCbBfVAj4UZS10TddpAVPMRmc1XBD7toBNh6dsdYkMArhIMHH1TvRubnMCy5ayPQ5CX6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786521440; c=relaxed/simple;
	bh=QTBM9oFoKN3/ewKaNI6sT1NxwMiqc/OCjBfCnzXG8x8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FfhRqP2MnubcUmgchJNmnjllTdsgxssDXjv+4k2Ql7DAgUvuNcaSSA7wUpgs/a6G67PHbKlmd1T8uxegzirMyMaXek1c/9zpT+iKkr+Ura2TZfcT7IT9sbC+OlAdSm4+HCELzkb94i6Ai5zl7SVYAWg0js6ZElm9Lof2RhSMa1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=AW9A95Vz; arc=fail smtp.client-ip=40.107.200.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="AW9A95Vz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fX/RW8DrC0jDLdY7lR/WwEa0bgfhAQAcghEiXyWZsYbCN/FTRip7RRMsLdKe7MBTwpq40Qo/BzYVfqzabODuVb/WN5VQ8znarT7ammaZuawbgr6P56a8Fwt0eX9ghFH/IJWYw7ohk8C1mSDB+W+dMPtP0alk3RSWSWPz3mnmzYyzOIqvPuqrQlj58PYOS6+KeOtGGd1fJ37sG/l4yeRftup9NuFXY498ma61NuGEQcHFmfWmeDAAcZmf8Ixn55Olu1bFtsI17bA3fZQ06oS75Te+QH+1Qr2scojVH5FuopI9lni4wUzKzi227YC3QE0Prk69J7P/KU07RG7jd13v2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMDTUXwBhQCWuGZhMyQtsfN85A8jJ8V9WTAN6Nip3/s=;
 b=kFb2bTwdR2cZrWfI6WTXGj4HQOMwl1+rndGJDduQCk7zRcvzGeVTEeu4n/QZqXmB5R8TxCzs4Zo+ayRFAmu1buMno2Y8FO6qs/a69Dq3cA/6ZvXQDlRlyqdBbXf41snEvdG+Ft8VLkE+/bNNzOpXinc7/fEgVFYhetLtWt16/2XDXV6JJhRqsFth79vzVyUwF+vQILrXtCKYbFEKqniLCZpGCQX6dqzpoiRGVAYhAoE3Q9a9Jy+VmuEFa+fGdue4bIR6m7Q5TWu17Ug+wJn28F034b6KUxPFvnbBZCboQWW87Nt0OFdctpz85WY63GP8VsrMR29AXuTStSos8QAqjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMDTUXwBhQCWuGZhMyQtsfN85A8jJ8V9WTAN6Nip3/s=;
 b=AW9A95Vz/owGKEnJGvoWXfX0Kz4Dk7OXN+DFA+OIT7N/sYV2RXzPd9joA4l63SY1PXQD6DUrzG8MVT0VcE1K4iYCdpIkpJO6ocmKpkZHD3rrZCEmxwwUkYU4VRodvXdrYIxQZU3XCLhg1OtBG8yFl4b8RVZ+oSfgvlXtgGgmNM9RWbDSyBt4osELeZZiCTAxGJC6MC3dI7Aw7YuaakH41RtdJIfk9CihIo89UKhCaNYeUAbKusVKzL5iRL3u6k8Z5D8TmHV5znpRVBPYG2A/SeStYGyORWlo1u02L+DIvOgECS3ko1+wckoGCm7R1y5J6vuqxNN0wuGsLjtSUmN2SA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DS7PR03MB5606.namprd03.prod.outlook.com (2603:10b6:5:2c2::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.25; Wed, 12 Aug 2026 07:57:13 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:57:13 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v2 RESEND v2 0/5] Add Agilex5 support in SVC driver and FPGA configuration and partial reconfiguration support for Agilex5
Date: Wed, 12 Aug 2026 15:50:26 +0800
Message-ID: <cover.1786520346.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DS7PR03MB5606:EE_
X-MS-Office365-Filtering-Correlation-Id: f40b5a10-2514-4d1a-3ddc-08def8475217
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|55112099003|18002099003|11063799006|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	c0VxAWBp76d/zuJje5B7sz+8UbER32E+g6VySP/NX+kn/l1ZjW/Bw/RLsl67Lv9GmoocRN1Ey53gram7QYZFPdxgeMtt9fBsWq3fVbbWaY2axryVkKOeyayS+aMZHFfc3EMwcyWu8VCrLMPi6+7fFVwL/ZtYTAZHVcF+SKmjhIAlsYA2IP6IfnpTOyeIJ9JXUQpHWl3pNsGroXfbeyczFQVzoPppgpvIhdM4cXamCT5GcTHOX3ONJgeGC4RvHv/r+24Pa/tC57CiFhRU9dEDciDIRi/KoUfCOXxmpUB/Eg+3MbuF+x+MJfSWdd4cSRVguvzU8PxuP98b26swyVOUBrYpJD6MENhTM6i1mspQHjK8zX6MX/bDqbhvKSLbQOSpmmZ+qrr+KZJ1u3Chjl/x3Wf4ei8ueqs8mAI1RFVnF38f6pAXvf2mgNanzV/zsfKCzzYkZNiV3gvzc6b+bUhXS0fukalajC4Xeu1cZCChNxgHXB3z4tl0KAuzSrCCnzrWHB/Bg3QGxauxwWA/pnyYeZ76j+nZx8A4PGg2R2GxfItw6+uoMG1o8ksnUP0YeKm1zdbDJ4mq8xQlvna4TEPKSqMWGim9nVp+FUoQo8qEn4JWmzei31gDxbl+rDLjWPdXYvmtFxi253oBmqYiVlaNHIlGVYdMI9q70QvuMgWu0go=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(55112099003)(18002099003)(11063799006)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bivK3btMpEKlTq6OyBIyJGVAm6st+SwVPRyzjSJ5WcRZCoOZ1Z5xm9WwfO7q?=
 =?us-ascii?Q?ZEYViSouiCQRMxVVniO7dQcKwl793lEhbCz5icaRJW+28i6+3uw5P44wAoxf?=
 =?us-ascii?Q?fzEezTWxoASL1dkf+5kWeBomuXAuAjQKxfa/hfhvoQefNUIo9GW4iMNzHWTw?=
 =?us-ascii?Q?N7qBma69w1cyRnUHX1gTumIVq6oph5kUQ7QS4wQZi3d5NKicdSm2/kBaBaHb?=
 =?us-ascii?Q?dwQplkwM4mbuSqVslpWR+0fVbVfesnOllbpYAZj7LTfI8eP/w0xdnXo4uGKC?=
 =?us-ascii?Q?llJeyYKvmTSZVqR8fX0ahm+PGxTyXzld0a+MfrENE53HXAZIZiBzeDluDADa?=
 =?us-ascii?Q?QycT+YhPe33mZopfG31x/U5zYawSVbRk6/QeliRnnUxVA8ylYP5Ga9CqzSOe?=
 =?us-ascii?Q?FhUEJlH3K7vxIbdjffkQrLXis63BGwwMteIduPsypbs4okyF6ExpcUNlRbx/?=
 =?us-ascii?Q?6zu+1OsAm+kAoGeToGxAtXtBiEaDfP3jLsAnvcrqpaaBBf21jzRoUsaFY7XQ?=
 =?us-ascii?Q?lZkVmhCeNNyTGAsD/WSud7zu16BHSkxwbkz/rAijPQEsxWpmi7PkhuhW7eFD?=
 =?us-ascii?Q?Uua4L0f6cD75rRMiqqeko6HSgDB7rwsNVRE4mxhe6krRyJMWv2rPn78IQY0B?=
 =?us-ascii?Q?j9QhXf1aCy7QDzAn6BIUtwPNpIwT0xk8hCPFflbodkUyv4JjuFztB9/oZuY2?=
 =?us-ascii?Q?hk5VCST5+Z2mCxKjBeL6PPnhV+X1vgLELzCySDegv5VYO98qnUhDyvz6iE98?=
 =?us-ascii?Q?oQzw0Bj+MSYm6XznNMEWSCMoRmP4BNx5J0/xdap4k0jywP0alaULksrq4GSY?=
 =?us-ascii?Q?Q8kdT1FsVLih+nc+5aFH8cbpUf/1nmFaDQIu6at25G5D+SptD8xwO/DxE2MR?=
 =?us-ascii?Q?7CETqf18kUHYyYVbw8JKSas/uurRF2Ac+VjQmKgQ0CrmfCnHX37iVZPVKP0L?=
 =?us-ascii?Q?RmcNdxA/HpNKI6K9eCyOCEAw1DC5LENcZbzFvq2r5nk6wHEWJqQPoKH6v7LL?=
 =?us-ascii?Q?G5BJk3m23D7J5Ux2K6a2ogTv6b7TyMlr2I59bJGT/URYbfPzyJpuLGfj6N1f?=
 =?us-ascii?Q?gkjEYr69tHYnfvR629UOISaizUGHD269LnApnbGUWUdoRtkzrnmA0WVTblZt?=
 =?us-ascii?Q?9umiM/2CllxUxAzMR4TfBoM5/QThEf8S+BM2tOWPkl+kQBtb71ipBDgCOcON?=
 =?us-ascii?Q?0HG10K8XrlC24iEVe+CLVGjuvwqv5CY9sGtOXuHb2VEVFEkJebXWG2bgkFAr?=
 =?us-ascii?Q?MZwn6hgTlm19ZEDIeYFofYyQy2F6dX2XUsJiJ1ugVojeDpaPmg3L+3yWuuDB?=
 =?us-ascii?Q?Oa0O6OdVu8NN5KXbu2bXMGyG6x7wZrSGZCTOV62OtsgYKOFD9Mjurr3c06J2?=
 =?us-ascii?Q?QxZ9D8Ra68YtNd/Kg53pUw6iZwwVgU9WGbNw+Po15tZPEqE0jzDTNb6t2hT5?=
 =?us-ascii?Q?N5HwU16Nl8LAn71Vqr17OZJ21IpwmqmZHAIZ8hiklDVyUf4j/rdfT6OHQNIH?=
 =?us-ascii?Q?a77hPNCP+XkKwumobuaPi2GaMJ+fu2heH8+UYnoiO7VEz5xBz6dnTKPPHbd/?=
 =?us-ascii?Q?LlX2lmkgefSK1wg0qtv/z7rrHiZxbHXI8NSqMkqemvGyLp1pZSRgbLvfjnwF?=
 =?us-ascii?Q?9lR68Yrk7xQY5GyeX9v0bkTIMBw4m6sOPX6mIKC04Hg+ZuuwHtWl9/22opdv?=
 =?us-ascii?Q?JXzbY6UdyO6tCiW9eQ5nJCabCGjsdXP2+S+mqPIrq78ZKVKXSQCcufp2aIW6?=
 =?us-ascii?Q?kV6yRxJK/Ctyd48pLEfcmUPQiiYErdQ=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f40b5a10-2514-4d1a-3ddc-08def8475217
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:57:13.8388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ni2YNtYYCEksyrBNsQUv9KLaNQ1dJBp/1glFtmURE7ckjbR32xxYZrsK1Zm7yKE3tWT3AXkfsoWHLzZj+kkCRwgQx0x7hWvRL2aRAKNSH20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5606

This series adds support for Agilex5 in the SVC driver and enables FPGA
configuration and partial reconfiguration on Altera Agilex5 SoC.

On Agilex5 the DDR base address starts at 0x8000_0000, which is
outside the addressable range of the SDM. The SMMU is used to remap
DDR-allocated buffers to an IOVA within the SDM-accessible 0-512MB
window. Agilex5 REV B introduced a hardware SDM address remapper,
but it must be bypassed so no additional offset is applied to the
IOVA, keeping the implementation consistent across all Agilex5
revisions.

Patch 1 adds the fpga-mgr child node and fpga-region to the Agilex5 DTSI,
and removes the disabled status from the smmu node to enable it, which is
always required on Agilex5 for the service layer to operate correctly.

Patch 2 adds the SMC call definition for the SDM address remapper
configuration in stratix10-smc.h. This is a standalone header change with
no driver dependency.

Patch 3 fixes a pre-existing list corruption bug in
stratix10_svc_free_memory() where an unmatched free called
list_del(&svc_data_mem), corrupting the list head. It also cleans up
related coding style in svc_pa_to_va(). This fix is split out first so it
can be reviewed and backported independently.

Patch 4 adds all data-structure fields, macros, includes, helper function,
and allocation/free paths required for the DMA coherent mode. This covers
both the foundational types (dma_addr, use_dma_mem, dma_addr_offset,
SVC_SDM_DMA_ADDR_BITS/OFFSET) and the functional DMA allocation/free code,
keeping the structural and functional changes together so each intermediate
commit is bisect-safe.

Patch 5 integrates all of the above into probe: enforces SMMU presence for
intel,agilex5-svc, issues the remapper-bypass SMC, selects the DMA path,
initialises the controller fields, registers a devm cleanup action for
leaked buffers, and guards the error path against a NULL genpool.

---
changelog:
v1 -> v2:
- split original patch into smaller patches for easier review and backporting.
- Fixed the Fixes: tag in patch 3 referencing 5a0793ac66ac
- Replaced of_device_is_compatible() with of_device_id.data + of_device_get_match_data()
- Various commit message improvements
---

Adrian Ng Ho Yin (5):
  arm64: dts: socfpga: agilex5: add FPGA manager and region nodes
  firmware: stratix10-svc: Add SMC call for SDM address remapper
    configuration
  firmware: stratix10-svc: fix list corruption in
    stratix10_svc_free_memory
  firmware: stratix10-svc: add DMA coherent memory allocation for
    SMMU-enabled platforms
  firmware: stratix10-svc: enable Agilex5 SMMU support in probe

 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi |  12 +-
 drivers/firmware/stratix10-svc.c              | 263 ++++++++++++++----
 include/linux/firmware/intel/stratix10-smc.h  |  23 ++
 3 files changed, 250 insertions(+), 48 deletions(-)

-- 
2.49.GIT

