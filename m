Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011021.outbound.protection.outlook.com [40.107.208.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB7D3F7A9E;
	Fri, 15 May 2026 08:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832020; cv=fail; b=hSQ6o+EJ9TOGC6QKe61cpRulgrMeo2TmXgB1KSCVQ8ujWX6XwAdgBCH94D8ceBf9dJeRLZNTV5oGMpSCttlc31rs7zQO3b7k/7apP4dYeJuQOsZYtGwfhTr+mAko/+Lje5/YkchbdrtdDsnKdjpW0yHbV8rsV0GFuP5Od2oJiL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832020; c=relaxed/simple;
	bh=NVzL//nKtD+5WIDMZC0zPxJqP54/NLKoIKUuMEZjqK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VNsV34kraOtimtpFL4Sq8ZIKMWkVST51OjM8aNfS+nBjVXBgOIcvJAZdgieT/BMFzF+WLB85/e6JXj+JkcnB+9XHw1S5Evq6SrnF6zQULBlbRkwUbdLiV4MDxnvzv2QEANNhqKCXMcr+IljqlnoFaQanazxV6lNVavVPD53i2Mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=XCdJ9aG4; arc=fail smtp.client-ip=40.107.208.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="XCdJ9aG4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yITq6D8v6A/laLSTDp/ioluIiwTaCA/7BUuXmH1+76qCzM1I081JYIbHx1A44zWJ3IiKtCrzs10pN+BkC7Iqz0qcCt6u1i1Qd0IYNFVoSt25hMy11uG0U8+VN3jyYU72p/JC8kad9FWY9xV9gvnFtcVD6MU0PzMp3u19CyI51MiKfRxwGgPsfBWTbfcAnjYQWyp0I9J98j3EGV/S9QITLUrKy3/Alr8BdWunuuwAUwvx+mdcsVtBUOGxdOODmX+AoxP2G9r/CruvOJ5Yffn3XH7PsFLy87GPpr1CZ0tuZV/lHv+HiBXQ74EEZCh02a4fwH2J7x0yB9IB+WxXB506rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZvZ5NrJH+vCapzFSi/zw8SI4g+Ugp+gByiN1NFLG9Q=;
 b=OqBENKfX3SAYu//hRpz8mXv9s8dxvGgwr8rs9babwmxVxoucjiWynLmB7GZt9kJ0DuZ7spO7bH/CEWzxh/DrZHJwGRkbntCFv4QAzG7VuW4ZRsqG/7t0a6j0wPKC0Uwhqy7HyaGecZQJ6YnQRQvG6ayVlOGCK2mDzU6wuVoARgPbIU0NAVhkIq9v9ngaIeEBypzAWqDhr0ehppsoqzQthPswhtS9ZLQPUDY0vVDdpuKMhmxC48zaEJHxDL2Uo9Ome5EYZPXXotOGf2bku53PTJBqFYbdCLVB/JN8GUKPetf3fwWVL2zOdVcMpKelXyMgv+eA+DzRtfNhQ4WR3L6yuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZvZ5NrJH+vCapzFSi/zw8SI4g+Ugp+gByiN1NFLG9Q=;
 b=XCdJ9aG4G5Z2fus0bSKv39Y/5Cmt9rHuzmsEtH+8PLfZ7VdQ8U8yFxBRhoLtB4GIXw/g5VCQrqudbCbUHqOrV43gtea/68SFPsXqjFQwP0jBdYIVzX+bakDI1mmFC5G5bnFEx0scEvo8USqm6d3UgcNAU64JkdCLpShD1HT3MSXJCYTusbBJTzXRd/NlYDmVa3i8zN2VH2YcFQWGBbbV5XSmx0MUlcTLGK/kXAcNm0w78idOIW3Vjvl+SeQumwV01kMMN90rMxF4BnSGoczcWMk2s2G5YFDr+WtbtWKiyZhGyZAfVzFoxlEy23GDtxVuw3/GRqTDVnPQ3deChmc5SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by BLAPR03MB5634.namprd03.prod.outlook.com (2603:10b6:208:285::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 08:00:16 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 08:00:16 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: socfpga: Enable the SMMU for SoCFPGA device trees
Date: Fri, 15 May 2026 01:00:13 -0700
Message-ID: <20260515080014.6260-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260515080014.6260-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260515080014.6260-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: e805f107-6952-4ea4-cdb2-08deb257ffc1
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003|11063799003|55112099003;
X-Microsoft-Antispam-Message-Info:
	KlxX7nCWcDKbPegyztmiE0Ny6eZ/SaiDbEA7Odeo5AtbKiXm/3Sa3nCZMM616pOpshQlF3/nObpUgxdKLyrUCpkGWWkpVCQtMgwa1z86GZ6g+Q3Ra18WCMCDflx7dzCx8i4k56fL25RcQUhmwVsP4re3tAbMS+D/znpNyu+cLclhmWrz54D7RMqJ7l4LGa/OEn+QjQowfjmJl7rod5aFuFz84vqkR99S8SQK9wdAowcmM8+9BCtKWpv87eedg+K2Es6y4wTTLwicwlZdIOs66hwmO/vE2D2IQaVVRMuRqKZhAzW82pruVU37To2x+YNTqK9NCQkNI4Bn+X47r5yZlSEk5DUXJ/z8njhRmLGtX5fv+4Hf/9zWmdZFL1uz+ouNS58Z47CXOPBOy6ofkDvZ3IHKyVJk+Dtc0Njt5FnCVhAi4ArGMq+clbqd6kj5KGfJWje9qHi8fsjon62Ak+wQin/FNJNUYCAwJoqLYgMoOzanzCtw1cGVSrgNzGozMDLQ/sLtOmGxO17hJjwZRQgxaXBF70CJI/qE7J5AoY4H88G4rjmgXk/Bkt1+M2h90r7xXghaOZjnLHbteYqVCWKC+nZtLcvGM+2f290LiUwnk0KwWt+w/cAtHgcZuJrlHbCeUae6w+8Bhi2qgAsMGGvB6MX1rIhvJ94am5Eao9Q2NQvtJepPQqQwuRniICHJ5iL/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(11063799003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4q2exsiy7wJQPfvrRC/veEcabS852rrG94LMeU27166l+UmCGXuKT9qpk0KJ?=
 =?us-ascii?Q?LSZ7jfIB9z3N2P0vJ+eCL2tJG0eAKtgkFPR32exGconwvmfgj5LPPplCw0yC?=
 =?us-ascii?Q?ZHMfi3DEbafXFvxOyv8FxqkV/cAhcrp4f9lEzcWqhih6q6e7LpWoSndFp2YD?=
 =?us-ascii?Q?2F/RKTE0hs087dWsHXxBM0VQGqaa1Z4bXcKgowPLODVvRF/joIPcPRll3YWm?=
 =?us-ascii?Q?VhdJkX2FEBby0USd9sU/1LiZB7k398egjQt1e4bf2pASRF+r61Sa/+K0+ISe?=
 =?us-ascii?Q?uQPHHz9QJHeGRaicmZg585lc2rCDVPZKI50ZEDvbwlWVVcihNjPR75k/MXYJ?=
 =?us-ascii?Q?axIIlmVCeQqGnGCR8VjOEum4dFhvIFVvzxuLBqajndGSR2ZyNWV5JpXHf0Ua?=
 =?us-ascii?Q?Obeb4ZldZD7lLPsiOXqVYnK072LM5Z3JyO5akcA5twro9lFyoWqXG5BQ195Y?=
 =?us-ascii?Q?BAW30t6GAsWwirk966TnclVGlZUNwsoiftUXKDqLJ+RziFLdhoafCZFUSdkR?=
 =?us-ascii?Q?gnFcW/JD1af4wenS24OyXKAXH9vQOoiJvntloqecHeC4zwwJK47ZHd0gWyUt?=
 =?us-ascii?Q?MTDAA+leXPvw3tomT2XLKX/IOLazBoKzVfEG+FhK8FQovZ7TdA/NSO7CBmgl?=
 =?us-ascii?Q?QtXjzk/AIOTBuXZ6d/NI+XCJsTCJ25UTt3Nef/fjNww6P1vWOsNxzcZHQn0f?=
 =?us-ascii?Q?QrSbUY73TfVXDQ/WZOTgKBor89D57JRvdL1pPxvuXIXgXjJjU99ARF9Y5DoO?=
 =?us-ascii?Q?iNToqfUZBk6z1s8ZBNdqurlZocc384ZlQM+XrOwcc26dqCL4ta5X9OCyqKio?=
 =?us-ascii?Q?o0SNfra6iAeZi62mw9bTzvsHA1K9FH1dOfhFF07Dr/sYOu8lt5M1hg0CgOmZ?=
 =?us-ascii?Q?LZD7q8sxkYuTyw0IJREyEQeQnn4SHRUrJ/D974g+C8bgcmyMLNLce789MqBL?=
 =?us-ascii?Q?u0bXzmvE0G2GP7HuKyKTiaGEf0pflmle5H2ma6zmeYPstcCKFcBapxaWTF7O?=
 =?us-ascii?Q?+tw8ip/GfevaUXX2o02agoPNb0yIgVQyAXycbzDUJnuQyU8pfIH+g1sVbILc?=
 =?us-ascii?Q?im9KQ0e5xxHpx4byduU6JYQCKnKIit2WX3Gqa7hUVSBCsjIFb0ThgrtIl3JZ?=
 =?us-ascii?Q?Bz5KLlBfFhwImqz3aCa6pMWHef77qGkA0obLoVidX1ByHkswEGKZ27oR19vv?=
 =?us-ascii?Q?e+JjWgKucdS4fUuyZwZ1MVL8wEoWdUVSFSuZM0TPWKlcivLhlvXHSx8BCLzT?=
 =?us-ascii?Q?fGzxDhcehykQH8sI8msvoPx3KPkINXqC7FgbFdnNx5/9DIQ+IwH0yQqPRIRL?=
 =?us-ascii?Q?7AJw9IokGOmOHnyHrLgzx5NDdRyXHS0gO1lvzE8+hbh1tcrtHtq2GUwmqu8A?=
 =?us-ascii?Q?LjZ3+tn1c96u2LR5KSNZ3Y3S2WFDOtu8JghIFpwMHhfQGH4h5u2bPYHItWbR?=
 =?us-ascii?Q?wEFA7WDgSosva6Mzq+U0KiVZO6SGiWfZBYKmkf2YDVuQqBnPJIdR1S8Q+ri0?=
 =?us-ascii?Q?4z55ICvNaJQILw6Z6CKoioLsoIR/2IhgwoNZfbiDeH8Dfsy8lc1O5Sc89QUg?=
 =?us-ascii?Q?EVQPiNfWFK9NaADK12APi5X7k8Hym/7C88DNehwQgzKNoaBoFENefN8fgEfl?=
 =?us-ascii?Q?NZ6qwAUnOwtvIgPSSM4Zw652+uuYPP3zPDDlB1mzfWf1cEnxin1wAlVwW+Ki?=
 =?us-ascii?Q?A+AxzmJ8DEgUJ8c0dA/hsk16l/Y1Y/kFAsDgCQJ3+tS2px5F+Y5k/iW8ffej?=
 =?us-ascii?Q?RNHBmuxzTXuIQRCb7IPr0sJEpL1tF1gUx9vWWhFMcf1R+r6yCSHSENIDomlu?=
X-MS-Exchange-AntiSpam-MessageData-1: hgpCLpQN6MSCuw==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e805f107-6952-4ea4-cdb2-08deb257ffc1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 08:00:15.6903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: raM4wyJAtqLbhZmfftRo/MKNS015TDSb+FaS/RYtT2pyGuoVOu2iIORZGilFsedouSVUjCz7w9LjZHnsb0pBKfyi4uz4OJApQlxXYbar13ddxLo4++hVZWTVofBcA03P1Gkm/jcgj7pcjL82aneFCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5634

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Enable the SMMU on the SoCFPGA board device trees where it was
missing. The SoC uses a different memory-mapped base address for
its peripherals, which requires the System Memory Management Unit
(SMMU) to be active so that the Secure Device Manager (SDM) can
correctly access those regions through address translation.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
Changes in v2:
- Move SMMU enable into the base DTSI file instead of individual DTS files

 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index b06c6d5d60ee..64f3739a0c33 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -385,7 +385,7 @@ smmu: iommu@16000000 {
 			interrupt-names = "eventq", "gerror", "priq";
 			dma-coherent;
 			#iommu-cells = <1>;
-			status = "disabled";
+			status = "okay";
 		};
 
 		spi0: spi@10da4000 {
-- 
2.43.7

