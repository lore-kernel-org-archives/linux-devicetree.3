Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012019.outbound.protection.outlook.com [40.107.209.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EA62D838E;
	Mon,  4 May 2026 07:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777878694; cv=fail; b=Dye7HE2nbtb88X0o2ZJzVEdZgnW3HfkyxwWMbVcsNvdwqRMzb0wT05IntGPT7alrJPW0Y0l6HwNB3eP82mBMJ4EkemClkh+MOuJnCN8l/zzKL2piPVh61JtXSwJ69BplvMN7439+wO8e8cM44Dq/8vzMV4Dyzk/2ZswsE01pAOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777878694; c=relaxed/simple;
	bh=jqYvPztCJCP4j4aLH3OpR2C4O5A2m3DxZlxPInNSKXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n7O1wi4u1F232flPnYyVN9tRQd5A3pBtNVPhBPtEoci+FgWvpsshvEh3bMDt647hhmZI2Xe7C7AoleBbzX3D/tHICsqjayHhwj9I/kXr4i/qxENobfI8+qnleJEUsFLEBa3kAjcWQsltrcnRoZ60gWM8yh+LbATKLsfdqkaP57c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=i+7mIcjS; arc=fail smtp.client-ip=40.107.209.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="i+7mIcjS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUPxvGl6pdlCW7Bgruxrxy4fLqMF8OxzO/KEKKYedzfqDy2tOnDGr/qJJH67oSwbvizsw2pYHvneoCwvDFcjWa0xZNmS6P3vwq+ZVtTYYK6c+Zhvjpen5cUJ98lBCjHupTa3vQXuqgmqSAg9P8KGMsC/LpuDywMaZqE4vpqGttdV+eTkoHjH2aUaQtDfVN1WIwBVv9VSCKIlw1TziNPYKdysSk247YnLCBvcNeJMtuCB5N0eQe6PNIWkw8OzR4N5w7xr6KP4DieMGEYj2tFf/vmvPY+njYLYInoEUHKQOCoXVA+VJO2IThF5gYlx5xsZnqNWseos/JfJ+aN5VMPbwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9z6TkD1/ULbM2U/afRUKqO2g3LRgnnbsdpdzL5eCeA=;
 b=kq9J28Stw5KxJ+kasnONA2KEPOT6Alq85z9K7WKA3lWn8rvlFF020JYMA5CD9urC/VQ9YAX60vA1zBbXU/HrgFYnvA/Yj3tOJCA89DJz+YBpTR+5Cv6Wi4CWp1HyHpdTh0R1qTvbXKhZCdarMYMoODat+4Ydv6qm8cBkT7zVW+hQ3GXQElBI522LVqU9IQvfBq8G3iEvncYi45Qj2ZdniXJFw8w6LACeRnidTmoXQxhAHuFR3mBNseG2xE+nZsdTNpEjL4NuYjtjJ9FFkcCMHE9V5uf/RHgyMK5g9aBOlQC0Fhh8gkCTGf8V8zj6IRQYNGgkQKXU8bVOEozBT+ohZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9z6TkD1/ULbM2U/afRUKqO2g3LRgnnbsdpdzL5eCeA=;
 b=i+7mIcjSoKHzHRc/xfdNRPyt8wZ/lTVOgv9pJvlCW7yFBb3nQhr9seBiph4whNjKaiu60kU01w0LRFc3AFI2q4y8n8hQq8xUE4zM2s5xrSXhA0yJ1Wf5duaCLF+sJc5L5fkCeMzQjA6tp9doXb12EXeklyDpVmb/arBq2VRKXTXEmwNFKRwFg6HOhQfwZEqYS90/FWhp0tQhVzLIGgwPQsClUzqsgQ3z+RjPNiEshmnrv8lUfcmcBnl0cuL6vHw5NSAd+UoXQ7gEQamEjhIwIVbPwEvucYncdu6UO5Kf/ty2J9ws5GbbOwX8OCv//mtAyip0CFmKRpds7qVroRIg2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SN7PR03MB7181.namprd03.prod.outlook.com (2603:10b6:806:2e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 07:11:30 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 07:11:30 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH 1/2] arm64: dts: agilex5: set alias for i3c controllers for agilex5 variants
Date: Mon,  4 May 2026 15:07:16 +0800
Message-ID: <81865f7542a599f72c74e2d9858534716e05c959.1777878392.git.adrian.ho.yin.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9e7bf18d-65fb-415c-aebd-08dea9ac5d49
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	Ri7jY/Ysz8Xtql/IabbNOIxMTrGr1MERbxDj5ZZ9tHOCPGeckaz5oJL61DGqtWJErOtpEMPhEp4DoXMDe9yAEGOQhGnbLMMnhzQsnN3vAZLSd57A9jbvTNlRfRL8+QQC/YqMLxpxE9P/UOMYVe4x2iqd8epVJ8bjCR2KP11BhzWq5Jv7S5dHBgXRMVYQI5c8C7+NpW6Z+rskzPhXRZMKs4XAb0gRtKl60MsJIqdKU2joCAg8OjjDiG7WBnQjvuSu+j4QI2mZzCIeaqR/vUY++cCc50X6wS4lg6eD6spqVy5s8jfYFYJflNUuC6XbOaxQf8ea+2gJPq/HccSehThv69u6SwJwM8+D9+Lqbwp4ngtFBYCt9tCA6At/l0L6k/nbfFMcieYCMy+j8ulCjAHBxEFm1PNzq5pk5IzrPR1chRTQgLFPj68D9LnPhoNGl3xwP1psVSqqGxBu6jcQnEZ4VqDbVj4eqTkYLfqxbVlNIsJQMSd6OUzEM1xxKPJNSbTwGrzcsjahy7aJZUBiFVk8G/NkiSxNgYuVMYVW2Io6JLTscfakburpEyboHvv3LMD7Y2H+oOraZtxAGWNOdINwQ3MCSF97UpHtThFOervcESuIKwsxzyd8ROwra2m//GZkHEoBy3K62Qaqzo5fiiIrGo+Dhc/KsOyyBPJY0KKhP0geEuiWWA+P83uZan27wawQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wilNBNJ76shEvETVm7XduOO5nZYQVBRS3xiuk4gRoRnl+nZfMZR7lMFqHwpY?=
 =?us-ascii?Q?z+SQ4u3bAgg/MDSkB0INiZWrnxDIdTbU5+cC0yErygpLgXl56bOvldsdMzh2?=
 =?us-ascii?Q?mTjH8t397Q4OiAGXm3f7qpv+twEiL3dfZ+W9IhdqlYnftJiyinSF6HLxAVr3?=
 =?us-ascii?Q?EHLc0L5OAfMODkAwBrgTQAVp4bQqQljZYE3mmzRdVwCDs1tQSGnxwP1NbD/N?=
 =?us-ascii?Q?FtJcHSJY6BwMVYuefnSDtbrGfzu4ZF9knfIPOWPNoKOo7vpwoNb1QFM02nN8?=
 =?us-ascii?Q?mfAByOVcFKfjQX2gMQb7Pg+CnfJgo6+NOQNQHYHeTCh6ESRUheByRLtprMDc?=
 =?us-ascii?Q?IFoUin07fpoW8K7mCKuYdM/KFqHw3MdPA1Tq435V26F6crNc1Luf3qmVONqr?=
 =?us-ascii?Q?rXfUJ5mkUY4ytJ8Cw4fSQLWAloCHHQM/HFxGox8s4QfuGOYuDPtZ5gs0kIO9?=
 =?us-ascii?Q?CsUcomqG5YFkaWk8CD2ydaiuxe4rLsyD/lBsEnnmAcQV2SZA+ejEA0YNoJ7C?=
 =?us-ascii?Q?TASLRxff7cXG1o/yfZzsnOTAN7fanmzn4418z57ZEN32goQW57+VqoMptT6y?=
 =?us-ascii?Q?SgJWLUDgXpKPvQQjIZPxo2Ye9M28TfxbZiUrGopwyW7efH2xEpwCYqnjsi0Y?=
 =?us-ascii?Q?CS2CXvBKYtMVNl8KgfNHCWPUZy8TexX95yTiwQv+otV0j1yB9HvBbgXOrNRE?=
 =?us-ascii?Q?Zi5i94IVrznwyiupyZU3DSKZKiqJrjxc+Rb1rxhhJIO2PbTJunDHHkwfqgKZ?=
 =?us-ascii?Q?Cpo1zcIvcmelrh1SpUnljoMRJM2Vob8QyMWnjQPjgv7AALuV+vG+nASOQElI?=
 =?us-ascii?Q?o4uA2kiYqbJos7beVtn10L2if7X2oS/jI6LZI1IbN4ast05qDipocyHz2FRL?=
 =?us-ascii?Q?hzgJNvHiF4dIBTRAAc0t97s2ACP/KlLXxSpvLuloWZT3f+5kcHrQIJz264JZ?=
 =?us-ascii?Q?ihz5zVQh5y0afz5PyAkxN6jjD10Li5eHiCmFAoO6Fl5kKYkbQ6/37QE2LFOS?=
 =?us-ascii?Q?/hyrWWL4hnztirkdqRK1JrPMP0qxd81aqQbIVE/0709yY7N7IWvM5ggv9d3O?=
 =?us-ascii?Q?OvfGK63Naf71f5keoC3ARZTC2+F87r4rQ27Yp+zCNebBa6trYe1orsupVs46?=
 =?us-ascii?Q?NQPr2QbnadxKEO17Jlf1rJTAYRDm4bBBGBiRJf882J/kKfaJ4zDqtBcKFl7k?=
 =?us-ascii?Q?WTMv9zXsbTnVxDUHOoYZnHqAMHnDnHQA0SjwNG+jq/2SVVuhhAcK6m6/ZAvb?=
 =?us-ascii?Q?Et1NIRQA6ygXPtxflqNFojuiSi3kWOYDXTy80qkwWxh25PG4Hn74sgnHYKTD?=
 =?us-ascii?Q?aMuoLF+XW4mt4L4zgqTSpXCgPb5pmL6v8sPR81fhOoEohqb1jF3P2X1IM173?=
 =?us-ascii?Q?xl6mrRvN+uLhOg4aLuyY18SoEC+MKVBDQLu8CKR/a1BLotOvqiBFUSmf90JX?=
 =?us-ascii?Q?gyK4BB/wu4+4rqCoRlfHIlnRKuXcq7brqqEyIPELTYVLPRn7GITzpxH5k/Bo?=
 =?us-ascii?Q?eeyag72cbtQgyHfj1lqQ9WZ+Bk2nLw+YxiYd83mKI5TtXFe7HpTwfYDMSq9r?=
 =?us-ascii?Q?hKN4Aj/UqOL8gYs8YZVSZ7u0XZwJulGTjo/R7GU+dxYvkGgvtVIDaukCQSO+?=
 =?us-ascii?Q?Nd2fkxcMOMfjjgCI6XiDSiKqJ0yM52/fJKYYlLHVxsCoZWLk7NF4ts6klknx?=
 =?us-ascii?Q?lllAN3TJbcDmG+BPmMLrlq12vMnNgZRSZcuuI1zOm2KGwI8WCTThZfw67eoO?=
 =?us-ascii?Q?Ut+ahihwzGiQZyjZhSLrxM6LM3BsY90=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7bf18d-65fb-415c-aebd-08dea9ac5d49
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 07:11:30.0546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7Pfwm7grWOB6m4ROfe1W87XHIE3EYfcbx2Q6dBzJzx2Rs5fQQ28LS2XWx4JFaopZCbtQGnGiYNl9ht40YNLGjoeJx7wp9WYrsPidbeE0hU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7181

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

