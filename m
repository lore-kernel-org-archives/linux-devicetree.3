Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011053.outbound.protection.outlook.com [52.101.52.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D3776026;
	Thu,  7 May 2026 06:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778134680; cv=fail; b=FO+KHdwBX6eBdDOtXnHK65tYsaPFEfrur8+quSMyO63L/bGeUJet59mzpUYigyCpScJrOKAKTU6GrXrVCZv9ksKWBvHUrSmRKr+KV/w9gQZ22zBsoeArAn4Qku/3Fj3IqlmO6KvYO1lPjlwY2PAj7xsO+gEpUQNYiob+Z3zfbxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778134680; c=relaxed/simple;
	bh=7Cu6wZyzbkEpaAbXQQQ3ESbez4Mt0INsQdjMlkur+xY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BZM7s6vrfyr16W6WfDwJF3zrIV4ag1BCHSSCF6IGt27MgxnEi4DYTExOU1YlCP63a4iDu/+hgae4GOj139ri3Po6d6JMdHc3z5E73cQOuaejSfoyxJVfbyBxld58PKW2ib7LN44LfgcOZrJ1Di+orc3XzmA7GovzwH4U/B2C1ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=iThLVxYT; arc=fail smtp.client-ip=52.101.52.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="iThLVxYT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlF/gLl3TAzZX+MTu1e6ML1fKg+CjKQeWKLHylK1B8WsDsAK7VaDrQCjHxBy7Q4C2zFbsgTj0IzyVPiCfQfwGDKSUhHVD0we/7X69FpTrmA2DUiAAQ8tb7IjgDdguYeJhGHV24ESQeP1a5yXqvxL4J3Q20HxEbnQN0cjv26GIHz4nmHZDa4nk6qZ59h9j6M4fnUMs2c2IpTppW5XbYGJO4JuY00oXT6n4d1JBITgeMcvU6qpB9heh257OH0KY59xTFfXfpxUFOAwmAEmEh8sv1MJubgAClR6FvcWj/nsl7HsAUy0jDqtJe0znVCquW/COzP2JHdaRNw6fx6lMX/eXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSuc0pw7eVzCsrM3REo4C1tgukkax9HS6bAqbGNpP/U=;
 b=ZHHN/9mQET0sDShE5poKRwnIoDZxr0yQzT5rvXEVCdZgzqw049RssrgSbd9A9wtwYsFm61Qb2jDDmNeroIUCwyTW9JdWfaMzlCCr/6SCJAKPBu6EAt0j9vNa7oD3wHmL4zmfW2gtgOXQxIw81bXgeS2zLbmvAbLrO1RwFD3omkcOEah0MIlLO3zJiExIgnaUQKjN3ZYiiVGkgQrIPEky/+iFQVbiPRh4PvRKKxY8/L96d1zt3BuQR3tH8M+fzwm1wOxejcZbLsSTYLxQBKk2nfXDWt/ihZER3peorS7o7u1wFPv51RDqSf6N0J6jHiK3whEC33xPd/MAzXxmSw6+sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSuc0pw7eVzCsrM3REo4C1tgukkax9HS6bAqbGNpP/U=;
 b=iThLVxYTVNmBr72l/HA4z02LoIKDQ4C9v47SR9OH7FaQDHM9a9t2DZA//WXDvHl4Bx4JRnajl9vDyZF974SLeJvR0rqn0jL4skmbHF5uM24eTQBvioXEsSuNH9x/Bc8yn7MDhsy+f/S3+kzkQb2og0ajXGfNIDYUn5PqqLzs1z1S9ybMxvS6Nhx63guNoG0BitOV3PqfKPosC+FpKvMN4i2Zqnd0OWLYJ5tm04Rg3QccqvCyWgtgwvA4fQPGCKBBXv7fpX2IZcwLCTaDKxsx5o4QXX7ujADq2S3c3oE7XpnxkK8uIdrAXZfuFJ13f5O3eeX2kZ9jSx6FoSHoy/WX/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BN8PR03MB5076.namprd03.prod.outlook.com (2603:10b6:408:7a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.27; Thu, 7 May 2026 06:16:24 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.20.9870.023; Thu, 7 May 2026
 06:16:24 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH] arm64: dts: socfpga: agilex: remove unimplemented clock in smmu node
Date: Thu,  7 May 2026 14:12:10 +0800
Message-ID: <20260507061210.933512-1-adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::35) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|BN8PR03MB5076:EE_
X-MS-Office365-Filtering-Correlation-Id: a5f210fc-c9be-4160-34ff-08deac002a1d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
 JGBTE1gP8aBRxJKz7v6TE2r1Su7gA+KB3kUWyyb1lA5CF/IqyUP1VTdqs/mRWQwUzbdf7Z/watmaFulqSdWP8IG/TaTyS31S2BLaFA8xeK4hkKGhQ8vjbBiKxIDqrJ/l3CsT9wTn/aHHQlmxMy59yHxSZ+PSQkYqeK6me+knFkDMmrnG8CW9eodhq5Q+vYGZSKwhVJaO2G/3hVtGgjf6CCEuq2EpbxiCS4w1s/Psgkr9eLTl8fryCfwQZX6U9XurpEKgtq1cWg0P8r5fZkgMFnl+aTpq8/65Xtz+g0+J9sobIiKClJtoyWL03F08LY8k1/Ea4lWjnw5iX9984rsU3Xn7s3EDhE+Yt54qoEEMUOonhbW2y92T03GfXwcSr3EcrfPJQDQJCvetwXNVqayacoJgLs/Rt3J0vfHjb9ZyI1mx4kfi5WdoJ+si/m/GVG8OcSR55YmGIz5BJqXnh6tfTIyGU4bRQkqVzGzaTvdy/m5VAQwQRLYyuz1LFmxb/0crJlkqeuF1ACYaX0GXARznpf9Kz0R2Exyccy6i3RotsKiF/V/BXXFXKdIzd1/+0LtWtmmGJtgzpKJ1kS2JhSryiPCEaEaGuWJt/GpkeqZR1V95DV1TQSsDnK5Lr8zA0aTvQaPd9N1vJwHFXSeFzSh55ZlGyXQMfuQ5eXh6n2SkPGqH9VnkndhN5trFgIjHkK9S
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?RX+coV59v9R1QGS0ufphjEBgoRmaTNv4XME8JqSCVVxmgB6RASLZPbQW0D+3?=
 =?us-ascii?Q?XkE6QaFRLrMB3/jX9GNi2bTa1Wr19RwNXZAeGJr+GdIVuROTSgJSQUuR0xfl?=
 =?us-ascii?Q?rHxqFW1ZmbE1M0fOnzSI7On4lrbf++YlFt9EWikLHpvs1aIp8hF7tW0Z7In4?=
 =?us-ascii?Q?JlsH5u5kuujQRq1//nTI+AZyxGlam0CNJGBBLrJS/av57yU8RcWhBUqw/NeG?=
 =?us-ascii?Q?SsQB1+eyW/uFxOx3tpk646zbav9a8zbkfkxk0kVEVkP5zW1/KcHp3iTcGvv2?=
 =?us-ascii?Q?3OYDhA1C91HTgHAK4//0tCmPkx/YDgEsIu6xGhfKzVZQDMQLiXTP/V2F26Pt?=
 =?us-ascii?Q?G/8ftSr4L8/OVEn1g7WFiP9sNMY87vbZCsrsTzm2BA1R7ZRYxp2eimwCcrlY?=
 =?us-ascii?Q?j0zYWDkQmJpU+8OnedVVV5lekkj/TF8gqWOYWbB2gStlaEd0WySpveim5b7k?=
 =?us-ascii?Q?cPwXhrEQ+OKqGxzbXkAQAOahIF9QeMOkY2nYyriP9GLogLbYq5xUw4GyXMIF?=
 =?us-ascii?Q?hE4hfYPpBmsNhAHfWa419DH+dqLjcs2qiFMDO7l6ef9YbwDinwSMBK4DxR+4?=
 =?us-ascii?Q?GmYEnJzFjF1ACWttkyRXfTUuqxVX9dMdU9JmUZa1SV8T5H4olauPY7jiQlRp?=
 =?us-ascii?Q?RVXyZbDG4S26Voz2n+Q1m++TRIXBBGEu/e41FELIjyzrUzo7S1zSFR87pKv2?=
 =?us-ascii?Q?OPUbTo0BQbo6aGcSYRd4mbXLNCRmWruC01oukVUqe7hoclhVZ/R7TzWVcCKe?=
 =?us-ascii?Q?qM9sbBSSgDkFhHBE5r10Y5pOkoBj8Z/SKXX0121TNOxIyDMvY/wH11agtn1d?=
 =?us-ascii?Q?/050DT+Ct8rCMmQ4s+5cvOqsocT0IS203c86fWvmFtOfQXnhcppvj9pnaZW5?=
 =?us-ascii?Q?jcmEbKtxfCFWSU8PKhrhaClcCK4T87UdfuFSsz9lJBeWVE0lEguNuEn/CdPU?=
 =?us-ascii?Q?WaRQTRE1aVJojBBjtyN3iPpWhehVzrveI/3SD20ZLY1IgmE45ohpkXoIw8YS?=
 =?us-ascii?Q?YYmtx8RRnV/mOXSYcKlt+rNvazZPqvaUHzWFDpj7/JnTokUQdPZ9oePNIEc9?=
 =?us-ascii?Q?3j840uDxqFwNXlvqCXrjTMW5A/4pgSyZqLUo6lEyX116ZcF1RSN0zO7QbnKV?=
 =?us-ascii?Q?e+jTJ8ARZdjkiAOp0KyomWmnqRWwO3nr0cdKWyqX8M62HHRLHb0AinJFWkeZ?=
 =?us-ascii?Q?8y9cborGQdtQTDDmrmMspjQr+9V5xDKYp6WZd97UBysOAUY0QwdD+ZAhPAUs?=
 =?us-ascii?Q?prrJdHhGuwROnN8oWQwMv/qBqY84B4Po4CF7D8tPRSundTEnmlp+9eM8AgqL?=
 =?us-ascii?Q?WBdPmUT5UuEF8U+KaRGtIRzwR5Xv+eohKIOUKKoxML2so4anMWUEwROyBUPY?=
 =?us-ascii?Q?RVlfL/iZq6B/I+ji0metv6p1sZLphEfC9S6ZQrIToiWcdIWymN8q5gYUwfH3?=
 =?us-ascii?Q?lBaKnv3/A1GvocEbjfzsUMTJ2FKHn6HKA/88fIl3qRggeR+PPJrouEZT05ZX?=
 =?us-ascii?Q?/fbwnr/78scbfN8v8H98mAxk7N9RGDcgbxbhGR/QYHUx/54AfWh6b9sNNZBf?=
 =?us-ascii?Q?WH3AlDBIYEsvNdtbT3xhe1lPoN5bXT8M2PNOxiZnOTM3Blr7oUy71kE/Ic0L?=
 =?us-ascii?Q?vKgFOdbAuOE5Gru7+BK+G5Hd4ZHdBSkzkOD0r41/ZKW6XVB3oDPvCWL6u0Yk?=
 =?us-ascii?Q?IfDpcfKAKEYVYKb38lPdQVcA+5uwEf09kO19bhrAeh/9Mm09oztH473aXL9/?=
 =?us-ascii?Q?VHSYxt/7WXWsneE1/UnmNNG2ruocxqk=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f210fc-c9be-4160-34ff-08deac002a1d
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 06:16:24.3028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAx+YnwN9SExHxbymFtJL8nit+qKFrkwYr+CRvY0Tc3Ps30gIF5Fp3zX3rtSjZFfoSBqQoid5LcHFGKxKEWH1S6VxK6hsPQZ4VHNFdEcvyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5076

Remove unimplemented AGILEX_L3_MAIN_FREE_CLK in smmu node to prevent probe
failure when smmu is enabled.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 0dfbafde8822..6bfee8263b3d 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -445,7 +445,6 @@ smmu: iommu@fa000000 {
 				<GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
 			stream-match-mask = <0x7ff0>;
 			clocks = <&clkmgr AGILEX_MPU_CCU_CLK>,
-				 <&clkmgr AGILEX_L3_MAIN_FREE_CLK>,
 				 <&clkmgr AGILEX_L4_MAIN_CLK>;
 			status = "disabled";
 		};
-- 
2.49.GIT

