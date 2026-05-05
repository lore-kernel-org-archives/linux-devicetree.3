Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013053.outbound.protection.outlook.com [40.93.196.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E4B39B48A;
	Tue,  5 May 2026 03:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777952082; cv=fail; b=nJva/inQEKt5SJC8PF8Zfm3N41PLTnxLzRd4HBAXO0aJ3R74W7I1kqtxbmfKxpeLEw3U5CWxubq/ahO4p0iOVLiMKdmfLEKXy176Csexwau0zCCVO4yb9Gm7CPWVUMboj6qVJC5HD7TnyTulW2wPXTtfmy7cQkGRcsJuLBCVzaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777952082; c=relaxed/simple;
	bh=jqYvPztCJCP4j4aLH3OpR2C4O5A2m3DxZlxPInNSKXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JKVuVR0tHI4FJ9b34QC20GeHQhvuDqFoB7OzuSnSFUhu7ggQC9T8EuzSNlg2PTDJ+kfrHks32DYIs9ut+zY6cr5oD1c6hVbIuY1k8YKv6hPGjysODz0+EoS1756cbPV3ayzguCgPANv3qT6s2dvweUG6QJWz0gY7DuNDeZPKz6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=bTomUkRP; arc=fail smtp.client-ip=40.93.196.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="bTomUkRP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6b6Htz86VJUCy4wZlXu/DUiVSOp6PLmZcfkshq/Ovxz3dpA0ry7kOmhcfjK+QysBw99fqyfQEqia82hZ7GJOsY4bsWG1jgAJq7qeEEmmNJuX/TtHlLGAKl0n/mLn5WLdN3m67w0bQHekcinUu/sW6tC2R5RKglba/s29WtGCY/NId7Gi0dhF9lyF8ZvthQLEJyzbfMZ0do5JWL3zsf/qdss3EVZNJO6wvRLcLAgcHZpvsU3HAxVpuIbTSYGfUEqDTG0Fz6DgkENiFqrgmQe6si8mRR+ybjTHGfCIPevKd4GdPTR8wZ1nVo1ovxJnqnpd4QYxXuXlwVNnW/Qvxx4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9z6TkD1/ULbM2U/afRUKqO2g3LRgnnbsdpdzL5eCeA=;
 b=I/YFixkIxaysgIRWbFc+UNk4Y1v/MSXbXpWYHFyxNegbtSbn6afUAPVhkLsS97Xb//NaQJ+Ti09IbisJ0E36/JMntG8XlC81a+E/ZcclQYjM5KrmkyRqj9AsuDi13eMDNipXy38L+1I/tZNGfaheclFdfqZqhLQNGs98N1+LGSm5jZBGs/6d47skHC4Hv+tPVvx0phpEJqYz76qSulmOEjlJQEw1v+YcgKvR3F58IXE713AwvX1kCVQ8FH/vGvFUcIkiDrx6RI1Ad534nsmThjvJVslXo0hczOuk5Lmif9Mwjm3sK8Su990BhTuYbcfLIhhzo8UsSqiKqQS29k8LXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9z6TkD1/ULbM2U/afRUKqO2g3LRgnnbsdpdzL5eCeA=;
 b=bTomUkRPoZ2GSeUm9laRYS2BNld04K+0Yhx0+pMCCjAIE8r6yxmIeqGWBUUlU74dzq1rSXB5U7WNyNIX/hI6ci3Myb0FvOwRMdxCyYRt7wfloK6sPGRF3FXeZzkmqhofAzDeEYu5Nog/USLTmhqg4sMzJGVX3f4M2oVeUtgc5AxaiO6orBBKDcPWMdOBwbN0fJeky82ltnLZfj4CFhGWNEE4ytSMkX4A3GXlDu0NcG1ll6R9400AnihJDn5eTIpJL2bCDgFvzilrFh8Pts3z07RWr2AuaMlzNa7oycowvFIcw9vKH/MVinx3NOT0tNf2Evypad+M+aQ1+bcBSgx4mA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SA3PR03MB7254.namprd03.prod.outlook.com (2603:10b6:806:2fe::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Tue, 5 May 2026 03:34:40 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 03:34:39 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v2 1/2] arm64: dts: intel: set alias for i3c controllers for agilex5 variants
Date: Tue,  5 May 2026 11:30:29 +0800
Message-ID: <3f6a9abfac3ed7bdc37e891f6740e5bb6db47c11.1777951738.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1777951738.git.adrian.ho.yin.ng@altera.com>
References: <cover.1777951738.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:254::27) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SA3PR03MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d0cba34-a433-4a7c-4aef-08deaa573d0b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	1p7SwERPSZlOpttpTIrxsR/mjrUiF+AAxFksAMLnSFE3PY6YuGCxLQIRDKPBJEA4BUFhrQHUTXmicCDf+mWP6c7ihRiGWJrf7wl1Kx4UNdWd5z2cMD8MvKNI3q6F9lwcCRNdZOozKDrNNLAPh52jFhlR2GTUot8MLn9zR1+pad5MzzKYA3u1WM0rqc94r0Tvltgu9fQkaBEVJzdgW5M4KM0mgBv3Lr6bxO9R4GbQTOKVP5IXF0Zfbuz9YhCGdaVjTNX8xcw/W+wLeRUaQp4lFKTui9a7lftiQUXNoBj2C/HyJNTHKNSBluCA39H/9lz0mfLv2dhMcXnxE8r1zGQmr0ImyTqIXGj9uKr9uFmjtDKqE5bGv7q2EbdrWmUsl2B42uJh1q78u7+/r/PbWpC5zrf3QtVTIsh59iaPoUDr4sSDo1cgmoKYbm851Ot8K9T7fxU05iszLcgxjeCzDGo5X1gkHSZuGwMLDESFGfAJzO9GZXEHAtf/D2kcs8cbMrPnhPo9GPiNg3BQMkHJum4MgF3kRnCvG+cr2hHqVVSiPnRE58KMkXKHxKiDaMLa3FP1IyQa08GVa5OpyFsvOmRZBYHB7BWODXEmUJxIwaSH6QEZyaiR5RuYwafS6XGqiu4+MfMuLZb+4zkeqNnY76fg4UafYdqbvEukLfHW4t9wnV0tjhNu83PeI6hp94XQ+2yC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QtN8mRxtOdp20vQAmws8J481VB6VzMW6Pjd7SBEbwYg/SpZlNGUtzz2umfvt?=
 =?us-ascii?Q?oSQoDTb3R4bbFv4p5v890YCglynOen1bTwUYhg65OPo5meiDTNAYWVuz6aOg?=
 =?us-ascii?Q?tJxLMrmfCXqzeWPz5RFABL/rAaHkWaaYVhuMEvEpeft0MmYR0cVzfOCG+Fmu?=
 =?us-ascii?Q?em/Fuyj7IHLD5d2xrGAHpG5JtZj5jQOvYXemfV418cY4sgogh9HFs27d9L5Q?=
 =?us-ascii?Q?ETWuH11zO04croZxgzQi0lNhIF3zipPF92QbeoxIHYqjLn1Y0/PN0IGdUB3c?=
 =?us-ascii?Q?cI8na2Tjrm0Wp9KsOUollWRjN0usjgMBl1n5lb5HQ9p3AUBhWsH6LFMIhIC8?=
 =?us-ascii?Q?BBfCfFxa0bgWUBcCqT2Y4aIbASEg6t+5ejBLDUHewVSWYUkaLELEar1J4O7A?=
 =?us-ascii?Q?ui7oE3QCWc2Ee1SxHVlNW2AHxgXJz5xfX0P/VaDP6Ttdj2w8elPQOIoYkiU3?=
 =?us-ascii?Q?u1+NtYw+uEIN+Wt5J1btQ2PYv63D0yefFHE0SETUtqPXXNtfnAcLYc7g4gX+?=
 =?us-ascii?Q?aAz/Pai08nLw2f+y6ntAwjdeUDV9kSkTA3Rxnjjd6EdWZ+q5TTo5jftAQHSa?=
 =?us-ascii?Q?GGEYdU/UbM2ASYAvWFGUBUMnBaFgFow5b+qm6p/+OljJsgD5vC39iVbKag0G?=
 =?us-ascii?Q?D14+XFy65w3HBv0W9vFOEzZZlzYuDQBH2YRtphi/21plK5KI1eUtCXcj/qbx?=
 =?us-ascii?Q?byiLCysnSXmino048VOZ589u7ZfEQ6HYE4qddhZ+tF4Md+9Ln7jxMSl5S/4J?=
 =?us-ascii?Q?GakzmdKoWmTp63bTt+rBh0QPvQnoUuYGAePe943lBgPZe1fh7ixUStEAgvcu?=
 =?us-ascii?Q?lQzeegLlNCn+xqUfXp8uJmY2YAY9VOxyfRMXumUM8LDQKj0tRAljlkhF3Bo0?=
 =?us-ascii?Q?KTu3hKglmt/bndNIrr/7rAuOQrin2KiMl2k973frizSeIVQ2o+6hq8dcp8Uw?=
 =?us-ascii?Q?9fn4Sefde+PIK5W6f9yfOsjim+w+MZn46khMTGwtBsGSuXHBxXmxuExcqunX?=
 =?us-ascii?Q?jnPnIhUeIDkaspWB2Dmy+kcWS7tqIeCTUs5CxHNKS+L59nmz1C8sdJ/puQYI?=
 =?us-ascii?Q?JO9qyIUFWGP/bU0w6s0o92y8uyEi8fzG2c5mPDDVXqJQFwKmHUE1LwanCaUn?=
 =?us-ascii?Q?QgWsg630cZ6WHzjBG0DDWFOazaKkPGP0Vu3FVHqLAXnX8mTuFungHhWOo7BE?=
 =?us-ascii?Q?l4S+keSg70Upsh+UaoEVIWfbjj1znUm0OwdKb/sTMnfCd60gBAV6jFbbnZQG?=
 =?us-ascii?Q?cuI0LQiwHt9czfFaObE8GqT/IgGo0gk6yyefJqMXZyzvqXZU4KmNPNMOjIkO?=
 =?us-ascii?Q?HX1/GB5jompQZRavvBOPIW1TRNyJfQpwznmZFTBKQeC6MLgOavQ7HfA5k5UX?=
 =?us-ascii?Q?/B9EggdvnDS1GvtWbYV2sdgU38DFSeUhJOtRMRLWI2gAihaSgsII1JK5pVYz?=
 =?us-ascii?Q?7pA9Ur4q2ZuktdUo/tBULqnLS/MynI/tRkYWi8erY7pqFlfEHJDu4Gdrt9ju?=
 =?us-ascii?Q?c0Ga559FWaWOyfl60P0OBhF01vbBii7Z6iaLr87Td2KkSS3Vb0g0Az9WZ+jL?=
 =?us-ascii?Q?SEiZPpjiwCMvUCbPNF31bA9PKPlUCPlFBvtsl2imrHVqd2kudoXZZfn84VcF?=
 =?us-ascii?Q?UfpBoCHmAVnG2pbv+CGZmY4gWrdn4DPQw0TBKzMc69MJkxTrCssuyzLFhCZl?=
 =?us-ascii?Q?LRxcepJHJGPST9DuCatcw9u37xv0r5Fhg9O7rSxbrKtxx9bCnRi17cN61DaT?=
 =?us-ascii?Q?y6/6F3j3WYrj+8s9Szs9js6nrX10/t8=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0cba34-a433-4a7c-4aef-08deaa573d0b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 03:34:39.8816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dwEByt9q/oSiyO4TPEi60AwhsvKZdpwu8fcVaSFCThV5+XaM8Gj80YLXQUR+LmlKXqnzIAx0XskNAMOYZKUlEQCv9SxEZm7qgIY48FdRpUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7254

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

