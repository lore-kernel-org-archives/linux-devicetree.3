Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010011.outbound.protection.outlook.com [52.101.46.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ED12DAFDF;
	Mon,  4 May 2026 07:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777878696; cv=fail; b=Tc0ZFZiBwwNn9N88RCr0ZcG/0Ct0+cNDQMboCgE5vw4PvSYMxgKTJf15TOL5HGuUrGqJUOiKiG9XOsBAETh812HigHqxrsqIMqF3uvJno0jziFvJKcJrU5fjgu0PObAtYzFGi5eUr2L9x2x2pLP9j1qdzaXyS8MjbwACoG8eXxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777878696; c=relaxed/simple;
	bh=LNZb29Z11V23Z9GXmwR1TFgfWWEmYSvHcN1M85C9Xwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FvkcXYRDmUowIUSkl6p3Q4XfFlk/POS6UXQz0EvdmPOx+gevCMvtyjmtLqaVG5racysuFJz0uVRjMmQTaAyo+hoUVAbJYIwXaRGeeA02Kz/el76hfcoy6ewT5+TonOzwa9KagYdCO3FxIMQjaUVYzmsAIBt+qCrQ0HQcFyQke9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=otsYQKmk; arc=fail smtp.client-ip=52.101.46.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="otsYQKmk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6/LpZ1lFc7wdl8h7UCVdQYqhrJpXRmHPVkMSOrF3rcpU92e0uR/Zd7dPx8TgtDPEqYHn+bjWy6AvE7WEIV+12SbgsJoOiOkmQkFUQKKpHjSo+QB/sVSbX4CFsJm6yUqEyZenexqjMx/wxjMJFcoX/2Yxm0N8af88uquVBuU9ZcADTvu29E/JAu1QY9iidQx1NTbJGBDgzutaHdihpu7VrSX5IXe9NkjLfS+OSmBrACpcwvt1ZZ/HG4ENyHH9b8rglRwyuPEomz3F2Pph81vUbAhIhQt+q7ImFu/O7GNCYdhadSsw54jwGP72+ZMfI6IwwWrxgK8GRi5NnbS4TbCnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HO3+lUnL1oC37H5l+HQU+ytsNrdLba6PHtws+tGd3Xk=;
 b=NFEPrzOsGlhHte2sLew8YsPlxXlEZoxqsX7zeOrEpajKzJWp5jgrUQpkMmnzkBRT+HjWkW2OcYZGSKHzUXUvgPnEqJe1M0ALrcxR/I7b9kDID8BAPaQN6BhkwtLIWtHkCXuB3P+idWuGHvKNtHWJi7z9HHZw68q+Ps1AmR3mgqhsejeZIprrPQDo5kbl9K09n+5eHl/V816609Ouu/RjlAkoBWHVvVl0A0KY1q7StOseE7mU4iTgkmYC6WGC13KoccJ8RMaSxhQIXNlTunY7BqxQRRHHzikM41N+vEHxiCxpxEHsNTw6BPiT7lKZnVcusWXe653xyk2ugsSk3si87Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HO3+lUnL1oC37H5l+HQU+ytsNrdLba6PHtws+tGd3Xk=;
 b=otsYQKmkv4TixDRR2WMBtKu4+Q/l0Ymt6KeaRmum8ZRVWXoBwP6pzxe/ytsUO6OoonD7kmf5j3RXs/hl7ILcsqWlsjzKnqp9PJpIosl4zN28DYXi58KzgITifH3KVxziLGavZ9OzPvGNi86NZlGbWjbWeO4vtpJw/Thc2AtXpdEL/vaTTsFDVZc4ByC5JwfPGu/o6osoNOLJ1dw2wu4pzuf+KMgg4bLIryEFs1J9HrSfyCko4iY5aq/u2sGfOHQ0SWqSs7/+yUrf+yWr95qqr6+55Q3D57U3T6yhfM7RfLJ4B+u+Kqck9kQgNeZQqdFmz5PrcOtRtxhUkO5c5E0seA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SN7PR03MB7181.namprd03.prod.outlook.com (2603:10b6:806:2e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 07:11:33 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 07:11:33 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH 2/2] arm64: dts: agilex3: set alias for i3c controllers for agilex3
Date: Mon,  4 May 2026 15:07:17 +0800
Message-ID: <3a379df289c57d93bdb8d9f9f24c336e738470a9.1777878392.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1777878392.git.adrian.ho.yin.ng@altera.com>
References: <cover.1777878392.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::11) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SN7PR03MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 3335fadb-15af-4f14-a8a7-08dea9ac5f15
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	ay4DfOanzJD0QIwzNlT4QtOpRNLHBC/zyjevTTwoqKmI+DSpgA5Opch47W9f+gAr7TW3d6PH7PKenWMixRKO60QSY8zXCC1hG7j7q++7+4fW6sKc4G4VKe4W6YYJx6sKXKh4pl3YzntGz+KLyniNfk+yjIrbo8ds+mX5sS951bUi/mh5ALDSJvX6lD2SRdVRFHhTqp5Pqck7P6CVQRGQz8EoksUyJ0uEAzBBSDPfI2LLuir52/zZylJvCcrvXDIBAjHTYGwGoz9HY0tbk7SDW22p9XfgIKowHUEn0qzI+G+p6B63c6r9w5ETvltrqcr3VGf6Pb6ep1pKsDxwd5dQ+KKECJJs0+kGZX9ZOVKuv5+9f/EbZK0yozPGbDoWU3vsk5Vi1RLS53GQ/aE/z8OSFCm6+igDyDZtz07LFT+MRrIAUZ+d2f7Z2M8bQ38Dz1gTRgGzUi5fX6gBmkEtpu9ASAN2TuFBVGVW7TIBncoEl0ZZ3Mzv6aEtKQ2OdBTVS1HKVq4boMaOvd+I29itevF8AYHUGH0iw/uDZzPFdBzThBNft1FnnvboaxpW5vtjmbppFIju8RlO9nhqX6Np4Q/5UTqBl2am0ACYh6m6CM2y8ONe34ZtllBgltXMWHPRA2AK2E5sbNvl1Im16xSeLcmKyqWffB/zQ5VKC7PGGP5ufBe11wUKubykEijtt16CDcaD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ggrkf26LOigs+dwMHrKvYszE5E7tVff8hjGW2mVgrEuzOrrfbV4oFXrK/kNz?=
 =?us-ascii?Q?Jm0e3u90d7IF+CAnOTJ1HvatKljFBX34pZOBs7hh2PD60AB4fCXUmWpu4SMS?=
 =?us-ascii?Q?776GVnzVNrws+k7DbLJjZwrgj2xRaUc0F4z0XMICcLIRbddzYlXYf65dXZWz?=
 =?us-ascii?Q?3vfFb/yxek0rC1V/XG2LFn60yt2eQ6efO0ipOg5wXswpesU7MsPvN/l4W/i8?=
 =?us-ascii?Q?KvlLwSA+S3dU+13CQd0pM1dBZRC5QdVzjKrfCCz65Wjf5Mx4hEO+v5o8BUsM?=
 =?us-ascii?Q?KphLOqrmvW3LfcE+gdEx9joU7oSkoJCyonf5GZSK5b3JJEv8OaBzUMopITSB?=
 =?us-ascii?Q?//ar7hybuh+WZfqnKNGfrDj2tAWL1n+RD5eYKZA5RbyYplbvW1MqtQehaeal?=
 =?us-ascii?Q?Jg3vK+vTkot9vwr+2t4uGD3W5aFZ9pe8f5Pe2pm+MWTBz1PSmeS4vQ46CLf8?=
 =?us-ascii?Q?mMB/myNVRT3MF8S7kRl30pjE93cj3BwV1xjQAytXCM4kqqSckPZK/vVSY+lU?=
 =?us-ascii?Q?E73WcACiMHaikUNMyaJl1IwRUfVXuC6GOrIM4JrZCGnceyonWIoomPB/EmSV?=
 =?us-ascii?Q?z75GtGD1NDMPM/El8atgWDiscDNOaZFoc2nNRXqVS4kt1bWb6OpA2nVTwjbs?=
 =?us-ascii?Q?OXvh6cem8NTGMGNcnCDP9vn3nGvVt5VkeQQEALN8GA20UchwbgMSGZ1DKKdw?=
 =?us-ascii?Q?iTmmQ152/NX4CjD/cYxQxLEVFj50rf1zsveQfsNC5L24mjtx96eafHFsV8mF?=
 =?us-ascii?Q?vdkAYCxCBTppZ4145wrPuJvbDTpth3X5bR4DBAqymz723rlRE3g4X+c2itTY?=
 =?us-ascii?Q?kJOSo5LoSfr60kdQcxL9BhWVsocd1pks1Fp1V4A0QLAONe4z4B6hU01BMJfG?=
 =?us-ascii?Q?Fb83WnnlRP5w6NPiVsxAoqiqDIfqQrS8g8SmfSzb/hlh/22WfPq6eC4pW1Kj?=
 =?us-ascii?Q?Unk7Oqv5zboaVFI1JvcKW5E7DHB9iPGx7bu9cvJq8KKXM+FBIqlqZyige68T?=
 =?us-ascii?Q?hKdQJRiOrY0L8bNfGU81uexF6Zs/C2be58KsIPQCIMSHMkAKqZegmUgmkjUY?=
 =?us-ascii?Q?fpcq2O+tInPnAKifCtLqF+bTh3X/29AKCTdjfhodv9Nd6igD/Mprwz9fwHiK?=
 =?us-ascii?Q?nNfltgPVMRolcCTbqVy0u16iTHsb0Ns18t5GnXiXy+awfeSG6c135mUSk1Ys?=
 =?us-ascii?Q?A6RIpwsw80NrTTG2KXSlBVTqIQ6w6Rks76dIcMv7OzI1IV7mAn8YzYVDdT9p?=
 =?us-ascii?Q?UGk1fmyELuOIN/GFcZJmhvLxoTshRgRBe5llAVCwmHdYye/2cbefJe0QEHVS?=
 =?us-ascii?Q?VwxGYxJ2RLV6/dj/YOervQeo1MSnlCJzINKCIJIKxU2fescxZpTw884lc6BV?=
 =?us-ascii?Q?0GALHm/XF0pOLr2OeijTH8zqYa3sQCX8s2bYbB9IS2y/IlPEQRh8YUjd3QGL?=
 =?us-ascii?Q?j8Igw3DUGppfX0Fgv2PRVeobwaTpFAVLcgbEHvNIma++McggNNUG53XeIBUE?=
 =?us-ascii?Q?kbfYcCxoXITjsM0X3YyNy39zFkeK5wrEa3eepzGHwMTfqHzXbzswBYnb0ARc?=
 =?us-ascii?Q?TgYa9RGWAlkopUJRnga/VvtLaFDLFuCLISBFj5JAX5yZdsHaweVZ6PLeAjgE?=
 =?us-ascii?Q?FArTRUaN1PBAuWUpQxRvJulOobKNKEr9lykAU1LS+Wi5vKlrjMLo3+kDaHER?=
 =?us-ascii?Q?kXhbHOSuihLPA7pJkb2F4wUZhCa+9N7N5uH3m1dViQT6WyjkGiGB/j6AfLXm?=
 =?us-ascii?Q?yNCe5n42mjbR9whMIEugjjFgMypz3Y8=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3335fadb-15af-4f14-a8a7-08dea9ac5f15
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 07:11:33.2508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLLTsgV+AjkcOn6d8QyeHsG/2ko/2LEJPCAziSNV2Ak22UdJmCsBkt04xZhKo3lTJQhwXS5lgSt6bnQgGuUtbmmYl6sH3zb8JZ/2Gix+2zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7181

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Agilex3 SoCFPGA have 2 i3c controllers, a main master and a secondary
master. Setting the alias for both i3c controllers to prevent bus id
contention when both controllers are enabled which results in driver
probe failures.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
index 14b299f19f3a..25e17df0cbdb 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
@@ -12,6 +12,8 @@ / {
 	aliases {
 		serial0 = &uart0;
 		ethernet2 = &gmac2;
+		i3c0 = &i3c0;
+		i3c1 = &i3c1;
 	};
 
 	chosen {
-- 
2.49.GIT

