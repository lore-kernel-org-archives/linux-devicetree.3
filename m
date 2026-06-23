Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011052.outbound.protection.outlook.com [52.101.52.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1B2298CAF;
	Tue, 23 Jun 2026 11:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782213442; cv=fail; b=GexmRko2MhaDwf8xosy3kn3g2Og9aH5C2ApPFHe3OZorXFMNoLxqKdiwTugLegMn4B3zaHFwlAd30J2p/VM6GIWNDgxYvnHs3+PufR1iL93Dw/YD4+92KmfEq202cFF4xPpdox0kT6QFGXkZOt8vo+xFnwCOZaQeymQFoHesDd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782213442; c=relaxed/simple;
	bh=BeVRg9sKZJBmCUFHGJC9FaJj+Hc7Aat3OnBRiPDhN3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=h/XnroCc+A0rAvRPcYnfZmmnPY5uwul5NkcRMdKprMQzhn+EaibK4aZ2cxCTcvJQF2fGi50rNEYLJDcrFe4eoFoeAPa06r7jZQOGEZAP8MEDdrxGJrqcq9NWiEKZv4UJK4PgLJVr9vnZTtoiFvuqnX78jS5A9g0kYXxe/0mWciA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=JauMXRae; arc=fail smtp.client-ip=52.101.52.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="JauMXRae"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2artF+h412uMIv94D1R7TclaBjpNzmjkOnbeDlUVeELpQHliWNIs7d8/80hGYp2vmj8E1difIW8Ss2IuPqK8T/1MCMwVFuFz9gesycKWWg1Iv6Lo0er8OdjmYtsyLsS1k9iLGv0UKey6ODrZ3e8e5FowWndI4nWL5VZBKzsKYnAlaffCC+K1oUxfrvc7mngsE/pHJIblv1Yx3DPuD/80LQQRwjKjEulzYdPGlIYkwP33NaBYbhn6q/7PYezLpuCxs1tTcmlbvtfoEkDi8tKR+3w/V5i0L7p+A+Dvijf5W9va/TtIrEyrv4eRd9QncUKuBbiOHgCpPwJlosppg7OnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5xlUO9sZ6EDmBfcd1Pi3h4r34JOdt5devswXA7zm7M=;
 b=wOykDLTyVZT2av88NZ2N/dGkf/G5bGLFmKpkLHAGjFt636oTYx4L8WpsHtTmGbiZcL4qSaVUSx3ufLBQTTeq9nZN61ZBs9obnDbFSYsoLx/SPxgfGcmDn+oafXOxzfk5G5FwfBZ3zfETQd1qTjgOpLMavggm/3GRuB9dGrWN0/3Py63EkV7JTtSzbniAddZ7mw9XqKXUiy3utPG63GxIGAGhqt8TDF3sfTMF2L4LxqYpRK7L8qOa3rIEICl2PaGzFix8diEhHehDSfN0FLpot2cYU4g+m4Cv023hFdHLZ0HzGypNfSi/ZSTr2dI0jfh0b3kouXkzdDlU5EPT2NspEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5xlUO9sZ6EDmBfcd1Pi3h4r34JOdt5devswXA7zm7M=;
 b=JauMXRaee7JyTtkOs/90aHfbsRppgfvvDfH8E9DdxNYPTYKO6q5je9bWeIa8svuXQrG8BfkNNEw2j7WX6KRXLtYcohPevUW/JBa5/i4pX+ExX+qOXhbzYU141t2Eg/UX2ELdPwfWr1RcwYmiv8pMASHAlyYXu8FQuZycKiMZOYaSqhDqqqeQ35F2ZE4qtQHfGaQKGiJ8cvBcTNY5P9c4MWgEbPCLT/CXKhZZf1eWR7DZJGFaS7pM8ACscC97X8qwPC5JHdRrqm1OhiYNLr/8N7Y7x2lfNWtwitgbt+2/neBJyPOHzocpH4ebjyD1B4gB/7AFvDMeg2jfmWxe2y327w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by MN6PR03MB7670.namprd03.prod.outlook.com (2603:10b6:208:4f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Tue, 23 Jun
 2026 11:17:18 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 11:17:18 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: socfpga: agilex7-gen2: Add initial device tree support
Date: Tue, 23 Jun 2026 04:17:14 -0700
Message-ID: <20260623111716.16690-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::8) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|MN6PR03MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: 0053d0e7-15b4-4373-7525-08ded118fc74
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|55112099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	s7DnbJ7ZiQV1ql3aW+WxAVne1xD1mGD5ddxRtWqagcFIhcIWvUvsLJ1Vbg5jSD/6LiUsHWbi9M9U1wYLc5LwZ+ZnwCwDSCxDtCadfreJMNzdv1rx+W6CASnYbAq8WdSgBC1cy2DFCKlxy7dRjDdjrwHk0flNRwiT8hDgP3N5m5hu2UhAQlkWgMQ69kyGHF80qiTQS3XtOOJRRbC47YfQB5C7OCf2g6Sk9G6eUtgAdHsK91lBvku/cBRNai0QGSo3njPTALAotKOgjwytfTDZjaSJZnqzggY/ZvP7Uf1KGnjmeGG5fHVG0Az+IGLkW81JEtsERMV1ZgfXfh4DbMCXrxRwqhK0pMeoNZwHUOHiItISH4ll9PFZEDBQvsp01y2EPCq59yc2An3+VNk6bu2AWlg7e2Cert6yu07a2Q+S2x3YRJ2WHX8xk84s/OkIthLKLAtZOCqdLZhjoqu27UR9Db/MTafbflgDxJaWMwLwtWDkOCe4l9GZsbq0iULVkBcyJUacNdWb2C47OJDucvzBTncM3G5vozMAp8tUkpM6WL35pPTl8F+my3f1GVZKR96ZDrmAvCbelb6fifWdjH2tDxaPWaUgMKOA/TPFZcCCHvpMk3TIkz0NYDftO6b9nB3FZR81Qcg2gnqVlR7x8zBgJ8yURs/ti7oqPpTDSTMLriU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(55112099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7mjPEruJzkPflMbxzCOa6TWraH1L+Cv3fe3fBD0GTxHNuu47OdmHIaiNR3cV?=
 =?us-ascii?Q?EXNHPTvhAsinKkBZW1ueU6Ibl5VHXX0gjcj9NRKp99Bnws0VLme8UZsvkXVZ?=
 =?us-ascii?Q?tg29Eh4gkahh+x/bSa55PB0ZSfWpts6o92MH0fxHVQcBFZO4lf3LeJhqWJ/K?=
 =?us-ascii?Q?Rzq1X3VBNHqH9wjEuJf6qKxnldhWEhlu5BsgrAV6i19jEhk13v8xS15np3qM?=
 =?us-ascii?Q?y2S0B7Hc97Agvh2wOTLFBGxaQFGnf8KVUc0ON/Y2j6cEVvyDYhqPYAf/VqBP?=
 =?us-ascii?Q?LpmyP+k3d5ApPYC8q/zj3uf9JB6b4hpvl8H2QbCmZD/0fISX/wA0wiNhpoBW?=
 =?us-ascii?Q?PpqO2GN65upPPw8ygB4SivLY4NzGlXIDlG2CoKb0mStLfXfw0qhWgMVvpXnw?=
 =?us-ascii?Q?5f285AY46oEzhA9tws2jXo07xN2uxRWF+nzkoTFWZ61v17URczOyeYzbVlM2?=
 =?us-ascii?Q?LSyu1PuYbzBx2pyB2WyVY5/vS3UCyh5ta8WYP8KjwHVqh8QgltJq41tudCc9?=
 =?us-ascii?Q?YY7CN/1hz3KI5A5s7FB07y3SkFea+yZAHtEyioi+QFjzrROj+UHBB1XUyu2V?=
 =?us-ascii?Q?K2tqzBpCFxNpAj+HkEDyeyrblLRKit83jzUEH2ocIbLKHV6mz9l9x5YC4c/r?=
 =?us-ascii?Q?Z1kKWGsCgCAQpu/EWrLt6AXxAK8L16xRi4/YoPdo4tD84V2iVJX18XlbnTsj?=
 =?us-ascii?Q?6i4O3lnlbuEx+M2jeAiSfeP75qyOa1g3XwUaY3dCKESD5roX+E50FpbdF/zp?=
 =?us-ascii?Q?AuEKr2FEv9p5h6XN9mYLp41bdoFZs4pvp9nLnhcSnQAb4DUBaZTitExHpP0m?=
 =?us-ascii?Q?lY8va4uwDB8kVfaFi3FshFDOz96qD8hS7D59hsLBm5RQ+F3lT72X2HBMgIzo?=
 =?us-ascii?Q?BOLCdcyvpmFf80Jcmy5/p14rT9Qpo3cR7GHHEWzLV6zMA+pm6YHjd+lhNbBj?=
 =?us-ascii?Q?keI8Z37IgkWjJcV7J1cVIPOXgxzmdUcPyalLY2hlbkLmYfLgC0vOx0HVCTZg?=
 =?us-ascii?Q?O3o/J4ot6aFLknFvWvJx211pzMFycbuNDBF0LFlXdGmUr8JJwM6HAuLxP9Js?=
 =?us-ascii?Q?tF5hFsCbxZvjOhmH2wITGuhnc5Z/YIELQgTohRy3/oC+EQAd+QakiaDwja8D?=
 =?us-ascii?Q?DqGtwCUjklILHKebTjxxVBIDWyORc46YmXE3sziHa2mlE1mtHRn+Owzum7oe?=
 =?us-ascii?Q?hg2Wh+PDtLT7YaSwO/uQzG75adoC4xZFGgNRNYMceP+ou2JyoAqBJMbRVSeR?=
 =?us-ascii?Q?Lnx/7Y2W5M/Czy7IlDPm6wUf4z6gIYaNnkrk+fcFoeKjqKVhf1n2102m2YBu?=
 =?us-ascii?Q?WME24wHH6wOGMZjmBpx5+sp+QWRsMB9Qq0v6B0rHCkB5UuB7wKGNhSHLXqyo?=
 =?us-ascii?Q?rleC3GYo2h/Zm3t/IrqzcwtT8FOuoaaoLZ1WKtUDeGCPSlGDboT5E58bqYns?=
 =?us-ascii?Q?aw3YRY1l2V3Vfqyoj7WaWgHubn+J3zXMzBT+vHUDLj6wUBtEf5Rr2nibio/F?=
 =?us-ascii?Q?l+8AG6uzwxzco6zTZe/a6diltAjOOKRWKbi6fvxnQVzF8Ko00d2trl2NuNsW?=
 =?us-ascii?Q?Mj36SxxZehT4acbboWIXMA5JjlPhdmdhoLARt677+oiu6SHeJQ6K6PVX71lH?=
 =?us-ascii?Q?csfhE8XlU8DJaGRpFSTl1GVS0OXhH7koqpbEtMTIWcEBB0+doB3kR+4ijrAA?=
 =?us-ascii?Q?xmfZa3QVT+RrRgYW+b8JQ43WwO/jnP9fSxITxphgNVxZ/uIPsJiEL5wIgASa?=
 =?us-ascii?Q?bSiiTSz485TK+wtKTovBck7tHtkLcbAMXJC8i7S9S+3sB1KGyGmHBREALqlj?=
X-MS-Exchange-AntiSpam-MessageData-1: 0OqnXm2XbKgPFw==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0053d0e7-15b4-4373-7525-08ded118fc74
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 11:17:18.5117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Dwv3ntcd2D9fVe8dKMjg7Vb83JOtZMf5jUY1sjeaNHsqZfI1W2pzta+VHiw+l6Qb+A7V4l4rIRP9Ll3GO3RoiW9r9Gu8BHXlTmNGhb2Mxz2daxUk6V5VVBTjBpeRwHMy+QX3FGbUSnxI8VyuOmdfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7670

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

This series introduces initial device tree support for the Intel
SoCFPGA Agilex7 Gen2 platform.

The first patch registers the new SoC and board compatible strings in
the DT binding. The second patch adds the SoC DTSI and board DTS with
basic platform nodes.

Nazim Amirul (2):
  dt-bindings: arm: altera: Add Agilex7 Gen2 SoCFPGA compatible strings
  arm64: dts: socfpga: agilex7-gen2: Add initial device tree

 .../devicetree/bindings/arm/altera.yaml       |   6 +
 arch/arm64/boot/dts/intel/Makefile            |   1 +
 .../boot/dts/intel/socfpga_agilex7_gen2.dtsi  | 175 ++++++++++++++++++
 .../dts/intel/socfpga_agilex7_gen2_socdk.dts  |  15 ++
 4 files changed, 197 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex7_gen2.dtsi
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex7_gen2_socdk.dts

-- 
2.43.7

