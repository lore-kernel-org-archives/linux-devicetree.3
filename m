Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010016.outbound.protection.outlook.com [52.101.61.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7673C0602;
	Tue,  5 May 2026 05:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777958374; cv=fail; b=mL++KjGzmXc92VneyuITJyjt+ooBV0GGpMlRAY23sfA3EeleNx8ffUbFL/bGtL+5IxngMyJWTtWc5I2DnXqmgV9GEgS9Dv+A2mAo1+swSyrAGsSkXVDkISyRAH9CnQYCBHMCk0zrf6RygsyYob0vH/SI3bMhoueX4j733xg2kGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777958374; c=relaxed/simple;
	bh=jqYvPztCJCP4j4aLH3OpR2C4O5A2m3DxZlxPInNSKXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cEnf4fhkWkfCKZNPVWo9Eec2gVKQ6ewthVZYX6ywdUxXDNTcegBHBkzUX4EuQM5t6nfAre5zhR+hUn0oaWbZiOdY9/WcV/C0w9EUFz9B3dkRCBiGkJacTp8Tsu/m3FNpdi2dMEtvmUbRQmGYXfFo0GoUf40ezuDIl7BQ65S6ic4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=cjSKMjYq; arc=fail smtp.client-ip=52.101.61.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="cjSKMjYq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKedl8G369ZaqCKfqQ7szmdNI/fbze/6zM2gk0DF+VxINIHlQxFZkBaOBLZQpSWaDIERJcPYX+/9YWxKp5gbaujfaiMOWSVwSLf+czgY9voUwG6cyqlVNfzNFdWyNEG1uKjHTHebyTdCh0rM+6KziAXwYWuBJ6kbaPKzxXYxNrcUaZnVeD05dM1lAfGX4RBZ7h6Xeq+pPxQma1gUFaUZqedstuYYVu8Y1r9TcJO25cKbLcv98oSCWjSGI/diEXMPEK76kY7IgHvBy0hd9q0lNetRKlT8oreomfONB0RfIOQe+DvsP9np/bxoWsgPUtQqz2/k8Z8LkwUrgNDu6/c8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9z6TkD1/ULbM2U/afRUKqO2g3LRgnnbsdpdzL5eCeA=;
 b=kZmUEGTRT3Z64PRRpdt1+rXnPVIdhO1nUH76HhuWbat1DDucCfrXpNmDdl8c5vXPQRWe/t5RCLy+ny8GfF2oNRWEMwF5KRHQbmoB38ER9aa+R4B3E7oT7FkogpORfjVWBaz+wsyASw8ZNsldCjQQUmDg2Jmsendb/PQR48eaDXRcQGyBpeWO/qVDtfz2S0zvQtL4RRUVs+0KUQ3ceNKqvbS2A3hN24CZHr/j5hKgkVscZxyZppPuUekaS59C+1DoMiJoq9AJ+AKR8WEhXypp72K6uZAVDKLMRzF+ro2GLm9oafhDJUtzvYRWrHvp/263twh/hgMLVS3XR2mTfoiuBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9z6TkD1/ULbM2U/afRUKqO2g3LRgnnbsdpdzL5eCeA=;
 b=cjSKMjYqx0+7MIR3NvvH9LwLV2wHX9NVf6gG7efepOL/1uLhdL451A8eHrDUR4L12sVOK/u8yWDM8A7LOEUDKDgwh1m0TwMXIn2fNBo54mOOVifOr4+b75LriGZmVjkEUDC/MfeQsqLzQvB4+EMwzoQd76Pti7imOeWjj++bCxTv22WLyvq0sYMH4dlUOdPBQqe0sR2pnF/U/x+9TNoCYG0Ze9SYdhvQPKq/gJCtb9l8//2Zp7wgn77iLj0f/19aT+t9RDXlpee/3H+7qZNimJRNB3RRIni0cuVhoDBFyh1AMJAOGet8RbEay3Cntg9lV5S3szWEIz9tnQFhWi3ekg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 IA3PR03MB7620.namprd03.prod.outlook.com (2603:10b6:208:50d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 05:19:30 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 05:19:30 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 1/2] arm64: dts: socfpga: agilex5: set alias for i3c controllers
Date: Tue,  5 May 2026 13:15:16 +0800
Message-ID: <de4111634b2cd1b750ecc6e0c9cc7e87b3cdbc59.1777957556.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1777957556.git.adrian.ho.yin.ng@altera.com>
References: <cover.1777957556.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::24) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|IA3PR03MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ab0ebfe-7270-476d-135a-08deaa65e279
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	Qb2qVngw+Hhe2X4wIWmxofoJY/6A08Iylw0izwhZu3gIivGh7BEOgU+VUh6vxJ68wMcDPf3u/xy2nrLj83RIakXqzTyFEKvbLS3pH8SXNqoxzHRHNsyVUggYm1yAmAe6Q8BR8mLGEapPWjh3k4kukCPPOV/YbceIGS7xalXJmTlGO2sUPpuUBze2ifH90D7fxuZfhytM080S3pXpwnXMiDm1WYVCDTvPQrf5rz81weOmpxTnqgSMJh8wpEBAdulQcUoStHEuxtBppXEnmFRkuNQhuTTl2OyT4Hey+x6zQsdNXaWj8zXpil5LGOCgTAum0B6IM2sJqJTr/NtewV9WccjOPyEtSbEJjOjDDrW7FfS4Mw8vA7r4022G/r2//WfahcV+edPuhUasT2QxLC1wvQGQXoLmWi0zfiiRyVdhlCFqTc5zLPL0MdqFSz1kh6VSARR96ZfEyuoERHqkHL0fjMLs4kpzQwhKdIgigM3p4DzI+OEYlLTyMBHN3CvUJEWNDPmaLqi2nv1HKuCXVnTSx2KJ6NoUVk9Q/uM01iI5Ud/49BXCFJOTLZ+X1QaWZCMBjsUhoeG8SNapvbKXTZ4TA10n6KDhq2lYKkSWHdCg1no8iHG4pd5ASxjJwOwKFYmonhT0UWytd6LnTGIhaeRXeaqk493TfE4dNs49suTVThweQxWsGZpAcb/7yTwX+3M8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x2KQQDg+pOs7+DFCKTQSCpqLCwRZPphXT/FQdGr5llt+zPHBE+gN0ZAqF1jV?=
 =?us-ascii?Q?XvKePzAJdj5HXiJgxECuWIJLQpIBO4mwob1e+EAub5MVmQ5QOdUXlGxTb5ba?=
 =?us-ascii?Q?w5UcXwuP0//dqFHR5jYP1NjS0W4AoxFbU+Ohk81zGf5TZbUKzqiVJKAa7FGM?=
 =?us-ascii?Q?/1QzJuGzsubC7cLCbbnGOT3U9zgjdGZXMuqCKTGn5YCMk5pDPb/Fna1Hmitl?=
 =?us-ascii?Q?nuxzoHhw2llFRFHzBVn/nofIJ9f1DZjkxO5eKH2i2LYXyY1ov2Z0wEgT019i?=
 =?us-ascii?Q?nxNFV6JQ0idiAaNBUvB4kSohpA+KEipe8vBnUjOKgk8/yadrSLQFqdyWDfRv?=
 =?us-ascii?Q?UZASBHf8xrqdIBIixaGtQnYFunnxriGafsJYGGWKTvB3kPv5Cdegedo3zxyy?=
 =?us-ascii?Q?cWpxXhOLLPE53UDf3ahO4OX25uSxDafiSMup/KXWC4Mwch6DIwQHkd9MfDbs?=
 =?us-ascii?Q?aTOAfs9BM+UrZ8yc79qOE+46hb96YolfRMCdKXIO7Wyr71mpQjpkztKbjHqB?=
 =?us-ascii?Q?FBLLEwtSTOrjFYrxdjGbwKo0BAB1+2zZQkDgTXO5gr89W2y84Rbf24cb2rU1?=
 =?us-ascii?Q?SgXBy1LTNf00hU1SdnWwztv3aAwBXTPcNOlIQbCUOdfinq46qGVMaDdnJk/B?=
 =?us-ascii?Q?hDOkf2y1n3A8QtQnYOVG2iiaeJjCdhr6WZL0iVSPyvN1pTQHXMKL8lEfSnWE?=
 =?us-ascii?Q?Baw2fkmKkntB4Y3h0Ob9PC3dWcrZgFXd6WXgRnWU3dQ4vQwux390QhGYoxe8?=
 =?us-ascii?Q?Bjtt7dz03pXQIYMP/2ZuOnUedLrH6hnF4OBbXwoZ2DyLkP9DxmfbcDkStEBQ?=
 =?us-ascii?Q?thTPocnEilVPwpbVtlP+rulXiziZZtkARszJE4LJ/5ulb1pQREYzSb2VH3yu?=
 =?us-ascii?Q?25aFB7IQ8GUtExu/4ynWDUjgIzD+sLNIR3Gz7A14Fw7SMk8P/19l03/+GJKe?=
 =?us-ascii?Q?to12c7+XM75I4HgYp2u8BUVSZ/E5KHvO75NeeLgb7hzNYAIsKnzxOgKCzGfS?=
 =?us-ascii?Q?le49cI9VOJzZ8UxSptjPQkZfSAZo8WG1VLt5phjZ6TObpoVkoZ/6s/9PqwS+?=
 =?us-ascii?Q?QnPKyoiMdeNEuobw68mirepMHOzOCCmk0wXvWUPijeB2Ud7TCsxgARIMHdD2?=
 =?us-ascii?Q?Uep7hoKqoSvyBfUP2uldPLjhasYPsPss0dyK1rLDF2Yfz3SNyWh/pIHKvkeC?=
 =?us-ascii?Q?l5xXQcG5C3p7gAdarwpHBQQ3FT1Ejv8QBQwakpanarv+oaoRkMmlpItOdI7G?=
 =?us-ascii?Q?CtGn6F12gMLq/RFZuy9R+P49WFCFP3xr0c1HucThoPrG7iaSW5IP8FfL944W?=
 =?us-ascii?Q?rewEij42yvClm+XxSivSC0wetr7dzUK9L1dSxkjr5VxN5MytJTCWhiwLhxtg?=
 =?us-ascii?Q?Wd5FXrj94UQlVn/P+6EuUNxzRdVJqWoMoQ7yUauMswThKHkv0KWzQAoKHgyx?=
 =?us-ascii?Q?EQXAWEEpEWPsqZ6fEMbV5xDGWgZXEqu5i2sRt/DD7zQuGOEk+tsEBl8CPisD?=
 =?us-ascii?Q?8Rl0M++eHzNsgHg0hmqvWzdsGOUqcPmk2n3W5rOwJTf1CF8MkluzpAHMiQry?=
 =?us-ascii?Q?tSUBA20xtEtr6QR4UXEr1nUhVCW1tJyAWZYW+Wa9kEXjJQ8MeOUYWe/NbSPk?=
 =?us-ascii?Q?DiSG7B4AzRF4jT+CP/cSgXRDPxlHQSDC50NaIl1aJc2pXjYFlH8CW9pSNzGB?=
 =?us-ascii?Q?UkZBqc3RVNlYUTl+2vV2uvYwwPD4xx63pE9pu5FrdY3vMNKY9QEleSzlyU8W?=
 =?us-ascii?Q?Pf7qrUk95O6qyP4SwE0OaCkIVzpw9gc=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab0ebfe-7270-476d-135a-08deaa65e279
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 05:19:30.3837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LRHbGQbdIdEU8Z47ApVPF/K/ASyx7uyscXmQY+s18EKwATh26/whXsNJzPRp+r7kUdQQsbmzephH2ffMuP6hx9wmh1rlFodTz2v6P2Omp3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7620

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Agilex5 SoCFPGA variants and derivities have 2 i3c controllers, a main
master and a secondary master. Setting the alias for both i3c controllers
to prevent bus id contention when both controllers are enabled which
results in driver probe failures.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts         | 2 ++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts    | 2 ++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts | 2 ++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts    | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
index 262bb3e8e5c7..dae0db9f8819 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -13,6 +13,8 @@ aliases {
 		ethernet0 = &gmac0;
 		ethernet1 = &gmac1;
 		ethernet2 = &gmac2;
+		i3c0 = &i3c0;
+		i3c1 = &i3c1;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
index f71e1280c778..86137380df04 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
@@ -11,6 +11,8 @@ / {
 	aliases {
 		serial0 = &uart0;
 		ethernet2 = &gmac2;
+		i3c0 = &i3c0;
+		i3c1 = &i3c1;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
index 1831402d8808..e728cedb4cbd 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
@@ -11,6 +11,8 @@ / {
 	aliases {
 		serial0 = &uart0;
 		ethernet2 = &gmac2;
+		i3c0 = &i3c0;
+		i3c1 = &i3c1;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
index ec4541d44c9b..21faa47681fa 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
@@ -11,6 +11,8 @@ / {
 	aliases {
 		serial0 = &uart0;
 		ethernet0 = &gmac0;
+		i3c0 = &i3c0;
+		i3c1 = &i3c1;
 	};
 
 	chosen {
-- 
2.49.GIT

