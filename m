Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011021.outbound.protection.outlook.com [40.107.208.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269C53FADE4;
	Fri, 15 May 2026 08:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832022; cv=fail; b=sfkFCszDNLg1/1ObNaGVfbX4+bpX9AFxP38KhLZc9bLITPjmaXYcV5JOCsgsWUHpZ+5Hs16OSGFXO9Pk4IQ2fvWHi889Wg+FNFAOUvRj7VVs79mcquJ4FhvHOVz68m+0jqxK9/RVQW/uQp9l4otQeLrjzIzri/kKrcGLVTiKSmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832022; c=relaxed/simple;
	bh=wzZbfds6nMoMQ90TB+/aLYG6Uv0JbU+1hTU41ttF0v4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gx/WglukdM6EX/EhvTGhYd3lX91gU+zJSVBz2eVEICBzckBZF34YPsIavKPB7JcbGsvTwBno9XVrjiJLXgjLD1s4i08I5y8QmI5bQnhks7MjaG+q+Aic0bYSPEn7FE/bhDdI1UOK3nXYZvyS3MtQKzUy0BN03MxNYy8Ggg+KCN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=wLu5OmvP; arc=fail smtp.client-ip=40.107.208.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="wLu5OmvP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZue2+nMf5XwKBdETVkGyiP1ZBYp8GcByU6x9SQfuaeuGSQt4su4Sd6Ec7hIYBeIzBRv1Bt4XSlo4JX6Y8aX9dSO0Su07D8Od7iNbIr0R3+96KxSovA3aZwKolrpYkvc1n1oluawBH4hZGtCkT4D6pzXCd8ByExJsz+jHWRB+YOF7gEZS9THlLrRaPAj/36I4oNTmTZ0YKIjTjoI+BnI8c4Vv74y52vZOgkdRyupKTHImZv4AJVhfjQLCc1cxBaqOaA7CsV5kC+d3phqnYu8bUX13d41hTKF8ROIHTrtl/61eiX9daopm/lrExuD8IXmN+G9b4+T0rV9rhtMS7SXFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQQyunvl15BWAiKzmKjYUqtEKeG5cG1IfAYSk8uw5nI=;
 b=gh+riYjEUrXT9NkiGZN5sJVToXIUrWpRmpDdPA4BEPKKuFxUc3deyBpZaZJ7xk6rQM/EW7NZRdX6R/mVQrJ/KJaZuS0FxVW42iixKcBEJ97CeWtnUypH2yVenAbEy+D0HPajlAno4kp+HLUnSE8T8wrRoLcBSXLn+MufLhU3Wn/JrmrW4WhjJWtdvdQHbqvBU/ZvPV4RhPjFVT4eJdTC/ktY5W+FKjTmUnODXXpp9si6PzsKqMvQ2f82RClgg7SigpBwMj8JDnBNh40AXwd5Q0+yCCOsQW7Czz7hEB2/kZj1rmOhwb2vACIDsW5ncTVdiESvjtWRzoSgfB4wVo/fFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQQyunvl15BWAiKzmKjYUqtEKeG5cG1IfAYSk8uw5nI=;
 b=wLu5OmvPyZMuHEHzJjA2UkXq/IQvDdZT9DqsLpPOfqv4CoPcmW19BF8j2L06Qom9cmVPlSWUSocNGE7oXums5yt0W9XB3B4Q5l+5PuBkEltMfRKWc0bEoyceFHuUSn7Y/I2mUBYX2eNh6+7oAiEloV8r0trYWEMx7/LMV+nRAZHzvkjK+xKyY78grWYdg2GFFBNr3C2UdD4MMXX0YBfOmbyRHV6Xq2R+qItwu+gthvh94U47VqFahbQShgKxQJSjVi+QC8PreMWWqbCBLd4TfGAgRYYpTolecNJNZJc2Ak8gxaDtDuUWm6jBANPSUg2ArLejf8lvv5cU5mgmUtyH4Q==
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
Subject: [PATCH v2 2/2] arm64: dts: socfpga: Add dma-coherent to XGMAC nodes
Date: Fri, 15 May 2026 01:00:14 -0700
Message-ID: <20260515080014.6260-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 640e9621-a194-464c-c582-08deb257ffef
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003|11063799003|55112099003;
X-Microsoft-Antispam-Message-Info:
	YMVYMUIC2m+W9Sexaz74mJimDoaaYfs+LbBAJZ+MIAdQqwGg29jDqL2KVY2uUzFTI55N0EMM5277V5cS7Lo/mVL1IAnjf6EfO1kToh+ECMGRGlxX6gp0lN5A6HgZoqsQRsY0aWOuIhIAHBgCQiryprZ2bPJiZCo3iSSjG3VMnVwwQsldGNKlDHLmwLj3nnlxXO/sITpv2CwdxAMd148ZW6iDyVwy3AJ+xTY6S2H4hqit/9EbTnchwaTO0MzkqPrE6W/IbX54pkKEMfzIgKMz1x3h/xBx9uNGy9h4BTF27DCSAxpqq8dPBVY0yZdAeWZFgbUp8Y1KvdWaYlCEDX4t3c3HkhSYvfK4o8adj1xS0cprbYWs1hflBIJcvM23pg1KQsDxyCWESnazLWEQjV/cIpzFnaNJc/jFYD7jBJiEEvkogQOL3curmQqY/HsC0sZBuuYAmN0o28iEWekAPW9VMo4BUtstilnUhZx4UNjjmW2li1LEHHYiEeWslWK5SREUZZGvI12eEufSYYuAM5kEW3A0Fixl5dKrpl/MvZErDV7blp6jbaKNfomb/MC7UElaD79fv0qZV9bjlQqrNXIiLvzJWgDvsXlmMRl5jYhwxoamBX2rvcI1Htch768caoaTkeTLpK0vYI6UAaFOUeHTDZt7cXl9aABmH7fyIjmw5pKgyZ0324qaz75OPUwLwfyI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(11063799003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bISsEIJCf8exjNsVqH0blhrGiNQnYiDEo5fzHD+pjqanIveAmQcF+xQZ/sWs?=
 =?us-ascii?Q?36av06tw8x76PPI+TEtMqJvLzn4nap1XKsk81vZYceniJ1Ke2akCyic10Ftx?=
 =?us-ascii?Q?94It+ntiKRE+z2LJnA0uTgz6olcxJxozHjQguC5/8d11wmJIRMWrA2ynMKZS?=
 =?us-ascii?Q?ZpAok766+Se0ojVg+xw1oM32jUE7RdYXukSAkfgKUEebUAYvz6C6MLuCKHZb?=
 =?us-ascii?Q?S1Srs+rBkirRlZaciAcEJHMUlRWpEIkEmzQ/IDrxn5DAIf0Aqz1yQk4qScjJ?=
 =?us-ascii?Q?OVSMWxdO4WxOh/a6Z2dHV1oIMkbH4oyww/pp5w3WzDXYFnntrGN/In9OAf3F?=
 =?us-ascii?Q?XdLuWCpnr3J3XfJZy80t5IG2EiOHaOuK5hrPMND5TQka+M75VzJx1ChnVPX0?=
 =?us-ascii?Q?4Yev2iBj74h/GtworvdXX3B16vlIWyguzeLgaci2p7DaD+rMqegPecHtEByL?=
 =?us-ascii?Q?lK4E/88Sdgfuq33z9u5QCDd/qdANNqJJus5fuji17WcyS8HdlF2RkBN4Rm6W?=
 =?us-ascii?Q?FWSBpjOJ08n3wFSJUgKFOs9RtBlZx6p0yxwn0THU4dLpNNLrUNWrPfzWAHm3?=
 =?us-ascii?Q?eXaMFTpqDvM/aiqdc6FqwyxUXQ3FL3BTJwc3Q/a+njvN6cZX0G6sJQDHVl2s?=
 =?us-ascii?Q?ySL/9RpXGXp3t56p3yUYNOyERtJqWeRLvix0yZ9++BGgbfJbE39euNliAQWd?=
 =?us-ascii?Q?7xc43YHl6DPje2PSevrgkaDra2HFyB52qMkf0MlzoV+EWDXxQ29G2Rs3lG19?=
 =?us-ascii?Q?XvLGEqdm15WtYzN5vlOZbxED3qaOLa3haK1e/yos2CqBzpGppQUOhIeJg2Zc?=
 =?us-ascii?Q?ZS5WFo13+TSExq9ReQ7NykKwnUipoGmPOyqTfvautbEnltHXGfOFBIDE2Pyc?=
 =?us-ascii?Q?6tI0HCMpeOTLVIdN3v9c/q5oyqpthppUs9d/kXcRbX/32ozL+oJpmHV2PL2f?=
 =?us-ascii?Q?efLRTMVtQiJzEqjU3J2owzgXyZhm7Mjj6XBQJz3hz5jeYSDyOPgrhxQSuV5L?=
 =?us-ascii?Q?mTGImJg4+iK93CvQ1kRgGzu3hfdNq5uk2PKb9K4+IAppk+H91KM9PvSWNtJH?=
 =?us-ascii?Q?somWJOFF2r+q23FALXlHinv9qlrAIJKIa/daNJBjaDnt+0Ee+WU7mwIon/1Z?=
 =?us-ascii?Q?+AgPXPvDnLCkURjrQCK69pUCS3TiWv+MczH199ibZEX1FDhiS3BB3G+xrNTm?=
 =?us-ascii?Q?dKRJT/CimnuzkAPiC3ZKxoQMVCX8VD3P3d/WxdWJOU8bvSux6LjI9NVmhYuH?=
 =?us-ascii?Q?b+r79JNayuAJHf/x9jupQrRaQIVbMyUorDRoI4iZ4GagaB6tZt0c4TgZWHMb?=
 =?us-ascii?Q?KYkb4qYV03s6gxfd2AvPIAasOrX4U5A4u0hx58e3wGA8c7983D+SnzMxM3+R?=
 =?us-ascii?Q?pXf0ulPZ800ymRjvNXbJMq0Z7kX2kGor8DgKILaWNjj6IL2nermecY7Kou7m?=
 =?us-ascii?Q?bk05noSbElPuH0vwTPRglhhX5qpt/my3aLx2WR6DlW7aqHuumFkt9J2Z9Wsz?=
 =?us-ascii?Q?3NaR+wfHokc8k+lQ2WuK63hcdtlVtARCxzaqWPaUWEpOExM1HnrrKqldfLOG?=
 =?us-ascii?Q?ZaF9+1JoemqiAf0IXYMr6kaClYaOtPzJ1uI53yzG/KkGyxo81eStO1SOK+DJ?=
 =?us-ascii?Q?b4t4RG93Zh6VANEC+WWw3vE3H1Ag4vn5FayAbfqZmnNrdCTEYlb0wO3wajH+?=
 =?us-ascii?Q?Q2faSoLtXiqi9DoJE7QhPRGufTJog3s87cgjwQ0akiiPLVAlDkGye5SxwhTs?=
 =?us-ascii?Q?Ju7Q5p3d2ga0MHwXTUhF6IKoBpmA7d3+629I7VpqSmEMW0foS2N1CkTgQOaN?=
X-MS-Exchange-AntiSpam-MessageData-1: cLc373TNkUvtww==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 640e9621-a194-464c-c582-08deb257ffef
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 08:00:15.9777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XhVSJoGfwPiKoJw6Ol2HMjt3emxUpe3WsbIVe6OOVT/a/mUEGBt7Xzk/WVAakzD910bz7Myq2QbsrlSKYe7xqk4WSaWuJpDOzVElIkdxFqMUdAiGVOMgckBj3zvgliMivRUM1wnniKZMFzm3PjQVyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5634

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

The SMMU is enabled and transactions going through it are cache
coherent. Add the dma-coherent property to the XGMAC nodes to prevent
redundant cache flush/invalidate operations and potential stale data
issues.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
Changes in v2:
- Move dma-coherent property into the base DTSI file instead of individual DTS files

 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index 64f3739a0c33..bef386cb2fcc 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -577,6 +577,7 @@ gmac0: ethernet@10810000 {
 			altr,sysmgr-syscon = <&sysmgr 0x44 0>;
 			snps,clk-csr = <0>;
 			iommus = <&smmu 1>;
+			dma-coherent;
 			status = "disabled";
 
 			stmmac_axi_emac0_setup: stmmac-axi-config {
@@ -690,6 +691,7 @@ gmac1: ethernet@10820000 {
 			altr,sysmgr-syscon = <&sysmgr 0x48 0>;
 			snps,clk-csr = <0>;
 			iommus = <&smmu 2>;
+			dma-coherent;
 			status = "disabled";
 
 			stmmac_axi_emac1_setup: stmmac-axi-config {
@@ -803,6 +805,7 @@ gmac2: ethernet@10830000 {
 			altr,sysmgr-syscon = <&sysmgr 0x4c 0>;
 			snps,clk-csr = <0>;
 			iommus = <&smmu 3>;
+			dma-coherent;
 			status = "disabled";
 
 			stmmac_axi_emac2_setup: stmmac-axi-config {
-- 
2.43.7

