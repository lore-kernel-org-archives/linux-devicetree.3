Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012020.outbound.protection.outlook.com [40.93.195.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6905389DE0;
	Tue, 28 Apr 2026 09:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368391; cv=fail; b=NW3spNshcCoF76GCfng33zRSq84YcxdTuPJCcG33cdwICyKoOBDgMddjPfe1V2oJhkAsWD7MzsetEf3wb9y/fhGXV9x8pDFBj0R9SsfWFg+6Uw04aqvkcmueZZlaAM1kHljuSQkDJdDFDeq97XYDH9dgzwYZQfd51ILR6TyZ3F4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368391; c=relaxed/simple;
	bh=cvEeNPFPSMGzBEp5URYcZNv+uSatXmN0BVT9zjxIy+c=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=o4kF7Gs2z42WpFBiRM3i9J8OaEv7O7s/7GN29/LBWXzPfxbcdJFAg2MXt66m4SYevtRD1jVIodCV5o/ddKnB/x3A3VpL47TybtIP22rzmM0GPaAba2h+ViXxvTWG77KcFB93xMQ1uqm6xAvYTnvi45bkQv3UOlyqDfELmeyPcUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=g2RCsZdU; arc=fail smtp.client-ip=40.93.195.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="g2RCsZdU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJi4iYcnDNhHYmJu6RW4oGz1kZjartClZW85GSKAthbz/mXEy4o8Oc0aGEjoSIZ7s2vwYfj4LggtZ7rNFa2Wn/+qGP8LvaWdcYNROaDjGCUbFq6aheyL0v56sHH9rMitLZVpktI+Rrx7eR4wIpl1LMU7/b4dfwDllUHVvviCuJ3GuZeb/kK6uBe8N8q1ozSxGK4hrcDlImvG0fXFh56xWxqpNMhxtL2Ze9H1q4Vw+7Xm46lUjY1qx9kl6EeYwibl+QeEvAKM9oq7lmmhlm+NXYuqqs6H7w5Z3vtM/rMuAFW0TFjhp2L9Fx9pc8K40gHBBy6AJP1g0I6vwyCY68O6ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6EGtquTCLEoHOOBApx6L+ViwBmk1YKmdhAWdxjHUW4=;
 b=UGFans8rW/oatBFCsZv+m9ipE5ekYYrIxBNteSms/KiqsVUF4W0wP5TlIJCuAw3ql9BH4o/EyCwiNxCNfIOfmSLW/huz+8rHnNF5dxu9RcP4ZN5BzZ6J6XOOn53B8XGXiU8VbkKDWKqwBWLnne8VgkVDJwq5O8B7GFUO/Sb0BXFnmQ+U/Brrpk+s+Q4rcQbBS02XJI7vp05Gb1Y/bX9vOt6ImgN9RzIxNN6YNNkv7+MdbdmfqBNaZ6Qo2vZArUFOPkh3Ns5WSWy7c8uQHTODOOJm+Hg5nn4cuByI91agpnncfs1RhkkOkiTXEl5xmsbaWbVAwQiuRsRRrL/mMc17IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6EGtquTCLEoHOOBApx6L+ViwBmk1YKmdhAWdxjHUW4=;
 b=g2RCsZdUBVyCetaCPOiIoYIdBSNSpRyJrRBX2YJXJBAmfLvQP7Pu+dO+JgrtFrlezuUlJnvhk+yK7tekSdN0r0mcGxnJmfKmqbuc+lljBKEK9dUcTLjBLWFTtgJ8w/DlvD2Q6gQzzxmYrS+zBoUtoqAkdIm47MVFPI0tLNDowzOjifs31uoxUk1+Zn09B1U+1dSQsfCmR4AW4OOHJhB+ZPHOhVLsq4Enx9UkfWHXlP2d1iKrHzkngCNzMBVAqrK8ytZDsEIjmmZIIgVfNuPJlLn3JTNKsZ2vWxarEOu0DBnSEQMKTAb2eUEmXBqwWxiE82qskCO4ajFlCjDFhDjY3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6208.namprd03.prod.outlook.com (2603:10b6:5:39c::19)
 by LV8PR03MB7520.namprd03.prod.outlook.com (2603:10b6:408:181::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 09:26:20 +0000
Received: from DM4PR03MB6208.namprd03.prod.outlook.com
 ([fe80::2216:93ef:67b:9e04]) by DM4PR03MB6208.namprd03.prod.outlook.com
 ([fe80::2216:93ef:67b:9e04%6]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 09:26:20 +0000
From: Tanmay Kathpalia <tanmay.kathpalia@altera.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dinguyen@kernel.org,
	tanmay.kathpalia@altera.com
Subject: [PATCH] dt-bindings: reset: altr: add COMBOPHY_RESET for Agilex5
Date: Tue, 28 Apr 2026 02:26:15 -0700
Message-Id: <20260428092615.29681-1-tanmay.kathpalia@altera.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0208.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::33) To DM4PR03MB6208.namprd03.prod.outlook.com
 (2603:10b6:5:39c::19)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6208:EE_|LV8PR03MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b85dae7-ec82-4478-4180-08dea508352e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	ZPhtiHoouv/j+vb5KvDl7GLqNDjOpyvaQEyeSlvRtjGiS78hdcpBERHGAyAvBo+hm9YuyfOWmrJ1Rih07/WbU5LE6C4aTmXqj68V5Y+KCCmgSUup3ICWf3nBl95QfDkBgPhsYPbMXrSRnmgX6nyd5+lgoYYj8F7SOedCnvO/3hkWknxwb8+e1SCaB5O4Be1jdzvEnGpdX4YZpN8ODjC1+7aiMUUBjAAU65d8ZobhaPnghwK5PXmipK0OsClkt9EiWemlKUvLAXAYl+MOkwaDV1JksY4o1Y+7rUKOyV9OKSEfTnDbKPYlbJtwqEADc3tpBzAuhwDJnVDxm57GLaOw31JN44gBFeHUstsHsgLnTrM1DZF7jo/7EKFG+14QwJardUOU6QEIYeD6Ps67OCQcJw9c1pdVcMvu/6DO0ALPqBCdHfl7Mvy0vYNtlMb3vYDmsRNfGRc7s5gBCFi3c1x97rvtf43aBeGhBtMdz2Ke1RuKkKtRn7UU+R+i5KgwKD2KBAWXLgTq+LM3+VGGSqCTerI19beHo6vKfZnG3BTS/T+hUQZ4brmXD8Yo5Jkjy6pN+xlJSF6raYIIgNy8ULiYO41GG3aFVCRhsCdKECkZJTvv8F7tqBJ27WX8X/IY4mthNDt5sBC9LR+YOUfxlHQR+oujP8/WNu3fy1W9VrCJVdh5blMg6HAnHrBdtByhT2G0Mw6tzG+/HWl9C4SGChFq85fll6mvkkw9ifJia5U44ws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6208.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SVzZ1qBctp2pZNhRdCCgWBh24dTlGELGJTLqj6aQmG09Y1H/zoOClfkdOmVL?=
 =?us-ascii?Q?cecDXDI5g/ztDKS6rcSbIXSd0HQhT86d93RefCaNDAoSo3ik9DtSV0Rbqa0j?=
 =?us-ascii?Q?h4qLwqy+JteBJKRKOsOALoD0bdU3UxTxNdf/kOrfO1aEmDT6AfmEDkC4USDX?=
 =?us-ascii?Q?enUFXiiRaAtE5lmfR1Oo3oUu8YpxZCAO/I40bYQCM53o4BzKPRs5wp1tcTFP?=
 =?us-ascii?Q?I1fcSnjldtTlZ1PxmMoz/XJ3OewyTVjSI/2mLJS9n4yz/iunv6rvbtZYnOUc?=
 =?us-ascii?Q?5gtgMrP9P7Yjqy1d6TAIxwEGeQZW1LctMZtoy0Ryyg7bQ37zZ6IaA0ramWBE?=
 =?us-ascii?Q?eOE+zgS/duGwmJ6fe4OHHrdlud4/3DWplCWtVSdIjvXwIct8UmHtYGlDpdOI?=
 =?us-ascii?Q?YATdF+bQnyZzAnbx/8aY6T0+B2ZjSRrcperAnt7RjFTFDJN753yDD62aVF+u?=
 =?us-ascii?Q?HOe//P0AQEf7tG+QHg9DnPLDmEK2TN1ENBKpTJt1Sf94tbeb7+cFn9OzvIPf?=
 =?us-ascii?Q?fesA6h1bdztFfJKvTebaiU1Hvu6wQ2LuotmHjfGwkROV40z4k7QSG1eGQtYN?=
 =?us-ascii?Q?Ug2QD1GSz6KZPg+Sw2NsC2ricqItloopYyUZpJN3sLSREz/ZqMzvHrQ7gz7d?=
 =?us-ascii?Q?wGmaibf35SQj6d6VLW48aII61ObGj4fxZUoeAZmlWc2EFhbI8u5QJ/Itar4T?=
 =?us-ascii?Q?EHUDAvM7D4x9f7ErpRY9IP4a1yroNIybi+73GR+WN7nIdIBRXxilxWhorUoS?=
 =?us-ascii?Q?yzTfPNYs/mpFLEbsREgIvDSyMsW3Spw60HIHv9+TdCjlqwYByjhKHgJGAyGK?=
 =?us-ascii?Q?tZdqyRhjtmIeGGywPG9xglGacxvlsMrpuHpp0KQkmEbg2rzG2Ijxj0DmQPOp?=
 =?us-ascii?Q?+DuZ3/nmKMkMpmjA22BF2ZYzVvVPGjcYhGqJaBYlUtuLfR5Of+1e/nwMJj9z?=
 =?us-ascii?Q?lq/3yJ1o0dRCiJaNTHLIO7ombUIVfTh5pUdUD6jTCAa9+xXmnqMLHvs4ktuQ?=
 =?us-ascii?Q?MGmQlGIC5sdySxrwD04zx04AN8lz7PhKZagkXdHuZq+2H7DHKZNr7ZqrrCR7?=
 =?us-ascii?Q?dXJP/1z8PSzRZnR6rq1ae1F5u/2WOrPBMOp9S93khoRJij7IRfMx+VSfjdzm?=
 =?us-ascii?Q?rGG/giv9gjYffwvgIBwoMAOhEyKMcWmFViWlbHrPR/xH9In6B4vICZou2Zry?=
 =?us-ascii?Q?Xt/E7DjpaAkYuAxMaNNRLUqIMZnBxbHALfsDId0hJBSHmWFQo0jo42adhaYR?=
 =?us-ascii?Q?pKFOIOIRPfkhZ1xgQehbYv1+FJhlg3y40hUzewt72xgD3Uyb2Ur+dN3b67aW?=
 =?us-ascii?Q?vk38XJeTRIQmZ7ytmmBJgrcvVtvQ8ilTCSxX7sUGvnhM6W05zGWAUOA1Zc87?=
 =?us-ascii?Q?oI1e4C/fJuLwXa3rUGQk7uXucJDksouoMbCkPrrNn/fgE7sgZbt9UsM1BsVm?=
 =?us-ascii?Q?ANtB09hrgXuwvmeTA3RSrT/Uw2nLLMkJWJG1nEzGPJMhBPYh445Txa0zr8MV?=
 =?us-ascii?Q?4aJgV2DfacSfsIDlvv1XwZPxX5bgC0wZ56jkXXj0cwQUF6+N6Cruezd5jbqN?=
 =?us-ascii?Q?wvLkFr4dokTA4V0WJoGovD3v5UjfJHhTJhf2izKHfd1pNGeN5IV/GmyZI6un?=
 =?us-ascii?Q?YT0nbBExWbT4whtMDJk8SGGXtXwvUwMavSByW0oq549T0khnMeD/RtKf+7Em?=
 =?us-ascii?Q?JkVczKhg1gVeGMxwXQCtvylV4ZX9RtdkA2+oGHEsa21uy8jz2Qk44Y5QamIc?=
 =?us-ascii?Q?8mvpIdbb/RBBOp4uA9jW55aabq5V5kM=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b85dae7-ec82-4478-4180-08dea508352e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6208.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 09:26:20.5841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UAprqfpntaBd9w25xHdcKIM6YY5iw6irN9r16IBKciBbO10Q2xC4Wkw9FuDs/g0g6yQrvcaQnsFNHmE2Q0T7Ct3ZnGPJil3n4GeY4OPl/Oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7520

Add COMBOPHY_RESET definition at index 38 for the combo PHY reset
control on Altera Agilex5 SoCs. This reset is used by peripherals
such as the SD/eMMC controller that share the combo PHY.

Signed-off-by: Tanmay Kathpalia <tanmay.kathpalia@altera.com>
---
 include/dt-bindings/reset/altr,rst-mgr-s10.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/reset/altr,rst-mgr-s10.h b/include/dt-bindings/reset/altr,rst-mgr-s10.h
index 04c4d0c6fd34..c2505b9eb63e 100644
--- a/include/dt-bindings/reset/altr,rst-mgr-s10.h
+++ b/include/dt-bindings/reset/altr,rst-mgr-s10.h
@@ -22,7 +22,7 @@
 #define USB0_RESET		35
 #define USB1_RESET		36
 #define NAND_RESET		37
-/* 38 is empty */
+#define COMBOPHY_RESET		38
 #define SDMMC_RESET		39
 #define EMAC0_OCP_RESET		40
 #define EMAC1_OCP_RESET		41
-- 
2.43.7

