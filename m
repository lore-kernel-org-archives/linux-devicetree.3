Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012053.outbound.protection.outlook.com [40.107.200.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968183FA5D5;
	Thu,  4 Jun 2026 10:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780570227; cv=fail; b=RKzarqOZG2bqumVUbewUF0kU9jh7mbFhRRcw8mbJKa7CqUP2+O6wDhfcH007s25vAA8X4TH8pbrzghwvkL6nT2HYyLh4IuECx3YW3ZMMGVsO9w/QB3dsgVKRpFtwV4QJJyXndkpsTH+vxhdQPcZHAlI36I1uI1WxkJjVtAKRgOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780570227; c=relaxed/simple;
	bh=++DTPDscKJMusAnH+1DoxtSrd17XGgrB0QKZ97hpbio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tEYsC4rnQFDydxE5sJdEnTpPCtCFo03Izg5Qk1M/EcYtuXFMCXAYwLMBiJjV267Ydmk+H/otg2+Z8+GnNW278BizPz9gh4aSrXJOpRaYbEnUURqaHzaE/dVLLQuW3kNkjAMvRcvD5gyZj8IP2UHcPJtHOSUKgqmxM3IygKzGfXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=LmkVMYKD; arc=fail smtp.client-ip=40.107.200.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="LmkVMYKD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEiSNFBCHuD29Oif9S/2DK9N14fgBa3eoUD9isruMI+7kRDEyAhIID9nkmgGDIdv8MaYJDlghijnmtCArahmtYi7WKt9UXmQ/rU0ZVYNT6tCBb1Zk9qhxaXisWBMXMpD/QrDx7h54xS8Y/2HHtgK32E+4b3fGhZ7RUpAM2tnnX5KNr6xLdJ0tSsZBh7mVHiB/05UucXautWI0GbQ4ISnxjBSru1F9rM+eXIQlupbMVv9hdh7wqBGoULHn5K+/kUjCCb25icRhCR6nDfbsTVfhBSWSlfEcOL5LUVByhuZhZWPBAp7BhBZUtgwrtnVgmr03o2qu8Ob0nsSC0aEVrbP+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXZ4hOZaU/lKQ/Hi3q2Cigk2wdMAjAfiGlwAx/Km/eg=;
 b=Fng84BUiQzp2UOJLHC+jSvwGjaVuWyMW6ZHyiHf+5tF+9yMILtSMa86ehxG40NeoujnpYe1PZe7zheyG5X00g+hHTHcrg+gffBQsjtIQwJkfKONUba3No79v1LNlN55uc48UBET7E6wYwuRZSxTdIKAaSs2yclE95QmVi0+qwaNs/AKkr8Fy1jrQn6XT0IH39jZWTahclKxIetXt12pNgZzahb6gfhcRMOfOzVj31SNuUA84MPBHR5n8fWDDklh2hLqOzyqQIoDZkV7a6arOAss/Ot1RY2F2Z9Y6IL3gyfZDzw1Z8zWMTgnhnvNUc6wgfZTp8fFt6wSCpy+EP987iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXZ4hOZaU/lKQ/Hi3q2Cigk2wdMAjAfiGlwAx/Km/eg=;
 b=LmkVMYKD7JZL2HJIdDvL6K6XmfQxHu6aw1tAL/rb76WTx6heTolL7w0Iuhop/MqINKjCibw61kJP5tcAVYeb+V/YgSVmfGlm06bgo3dXoPHujxQVrb3AFeYA/D5+7k2OT/rS0mK0OY5Uq8eOVlfd/tuCgw6xTC29wk6VvufRCTu8IPXx4zdDcZW/4za/0pAYNWdFLwGEMvZlfRlGWKt+3q7AQOY2F78GCHg59GV2vgjhwyd0sV+60jiyrnBacttlCujO4DBdOOhGIEzRGyh3lTIRVBjAMEt3zKxp0sjWJm89Fky1kSLXcP10nJ0Hf4mpWAUeXeXtm9wDwFQAEUoRpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by PHXPR03MB989234.namprd03.prod.outlook.com (2603:10b6:510:3ca::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 10:50:23 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 10:50:23 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: dts: socfpga: agilex5: Enable the SMMU
Date: Thu,  4 Jun 2026 03:50:19 -0700
Message-ID: <20260604105020.24782-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260604105020.24782-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260604105020.24782-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::13) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|PHXPR03MB989234:EE_
X-MS-Office365-Filtering-Correlation-Id: ccec5af4-06c7-4dcb-eb2f-08dec22713f9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|55112099003|22082099003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	mj9LnhJ4WcAFaWnRR1Yv2rFwlNOGqLwZ19h+guNGgQEWNhsb3oKkTImzpZbZNjK/gSTeVa4KxTAgR7AE0mawzbOhnwUs6cdbhS1HoOmPrTJqLBAviMMDzlq+QHrQT40Zd+C6cIQxjfYfgdatzN3mWP30+DASe9DMH5K8HAUSiNwGzxneVHknZpo+NWhWe2fEaeDoz0Hm7KC1c0OaEta6X/vCasRxqd1QdDTgMe7nwoXWamaGVHJZJ+aMSTJ9owGdBvhrcP2sDfVTpx75yNzDX0IaL/DN0V7NEnQL6Y2So1RwgYCDDBz8f3Tlbd+/nFl2xybGp7OJ/reZwv+Ow1NqtVULnbf85z7GF8Wp2AOj2eqN46xCSOZE+dC7NLJ1kq6yyPSCSB25+n989MM503AWm2G2nUabd3x0Gm6to8+BIv7bstOQI2h2cBmm1r9KFncTyXV4IIZYngWdUV9W1r1UtP+z4UMkXFvmqa1KCbcirJFUyB2vc6bZEUwJke63AOl5f6j7+q5igKbfWp6Kb3EiA3ymE9/yY2Eg9S8r2m/TQsjN0r5uiZalozDcRWpb8xO/cPJjCe3O9YzmYZ016Z2MzMonKCvj9WepuAMNalE9Nk7yx8HdRiEIeOMTw67hGEsWQj/X4+c9mKadJhGS7JXt2J64P9TZOcQn/7JOKLzU7IJzBeZ9iLiZvOWBTLgeISfq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(55112099003)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JWrqaD7DZkYTxohSazQt2kKLfjwuAQjUHBTM5XmTVv59zS/tyjImqSxwFAqM?=
 =?us-ascii?Q?qrkaac77e90TlSdW6emPu2nYjfr9joz/VvalaLLKjuG4MG/NTwGJxQ2pEh+7?=
 =?us-ascii?Q?352u0Lcn22tuXOvKyOnyOK7H0ZclGdnJSB8diqDOw5WhMVS+BpWICuaDrNFQ?=
 =?us-ascii?Q?4uxcRI99rVnlpEVKn3C4m+vVHaulqShmOIlxLOz59n6cUr2eDNrbvNWPgMQH?=
 =?us-ascii?Q?t7lcIjwTfKcIXvK/0H/gnlJOo80lZjwLvLrS4pl2D2iFfp7P+S8KXg4xazMs?=
 =?us-ascii?Q?+VAscy92hqUh6LsChZFwvG9tbJ39Ynw0Q1UOnbt8oQysCXDNxp+AKS8tAbRb?=
 =?us-ascii?Q?A0nX10lI7bBFoo6N1eOIaMNrGjK1vCYEtMgfgJgJRxDKnbPXGEH7ubUcvmZf?=
 =?us-ascii?Q?VtN9WKPjdu/l2yf39kInscC4XtfXY7JZ5FT+QkUesckMtXo9TbvcqXIja4zt?=
 =?us-ascii?Q?BatMikH1uwC3EGxs2GAfGhnylO4zcnAOt5P8LVW64YrCp1PpSNXH0Zo0u/+A?=
 =?us-ascii?Q?uX7jfpq/ThcBqsBg0jvV61lA5Gh1Ye7j93XVWQnkP9YC8Y6/do5oTX3OMEKF?=
 =?us-ascii?Q?sv/klQcpPdK7m6Nx4R18fEEXTl+Q/5nhe74KfNrySOG/Nfg6aJUlCtPIDOXh?=
 =?us-ascii?Q?4c6ssGMUxfpi0NdPo160pG+vn7MCbLvQaZYjaxa0k69621JwjT4eebB3dP3l?=
 =?us-ascii?Q?06By+yhhaUt9n60JzB9lStZI8SzFrUQm6622gtPt+oh09ejjVqnw9IF4uTK4?=
 =?us-ascii?Q?2xtiXSi1x2YYYWbfAed03uRO6xg7gbbNfeJ703XalqlNbwfL2okPtH4aDlei?=
 =?us-ascii?Q?J1atFIYVPTPGjTgmobmKL+nDai/Fejw83RmxkzCYpbnAoUymEonYHg7B0qZf?=
 =?us-ascii?Q?t34VFwO9yTv5M9L1NBISzWIUx24zJiU1mEhmKxIH+t9gr7/9s9lgyPN4KyQ8?=
 =?us-ascii?Q?hFmotZCjz4uHDd2m2+jQLPXn3832+cD9IoxA/8pkFBSeJ35dsESRYPRFkZki?=
 =?us-ascii?Q?hjv5RQaJ/3DFPP6B/r0R1j3OyBCEBT58iAH0e+1iCEd6SlZ7RtLrJ4xZaulA?=
 =?us-ascii?Q?jCTkSHLf7hhM0qeNnVPPtK4d/R1W8SGDjPoe34tfmRT1/YvrGGUPSaV5+tMG?=
 =?us-ascii?Q?6m6RZrGVKcUWbVBgkqu8W4y8JlmXqRSbEk0mKvt4ko20cS5IWcJLbL+QanHm?=
 =?us-ascii?Q?x3nyzIRFJKzrx978kBr02gqEKVoYReyxsoonAur+f5VAipA0AVQskRxnsCh0?=
 =?us-ascii?Q?V6R8svvj3tulMwVa6bwpwJ3jKQ1VPRe0xmgHbulaiOSUhPtcPcy4mq16wSzX?=
 =?us-ascii?Q?pA+iZYvRAvdJwTNcrMWCAXSyHb6XwlOenv7Otspggm9E4J17aOFXTwToDZ7r?=
 =?us-ascii?Q?BW5AezZKXAYmYQo77UTuJ8co/dFcssyi4DULwnGnzKIKEsfMe87lsleDa0IU?=
 =?us-ascii?Q?73k5nhGKFG/+lsRGcUbiVe9Wnn4mdLkJEbs/IJB3rxel0fGDB9rcSs84kYQz?=
 =?us-ascii?Q?yqB6eMQ28C0JUF6wuXV7u+RTZtUH98jttYwjtNSX0VzMxXtNdj22S+dFqQAh?=
 =?us-ascii?Q?ZNpujYnp6vQ6Ljnn+tpuEexnn0b1hWF7w9Qu/zq+wVi1X/HZZrcyve3xaNyj?=
 =?us-ascii?Q?yjPHfTFG1OaIXlHCUwPyCkqpnXxE+1vE2Y8quONVsAxDa59l/nUXcfK3BGAH?=
 =?us-ascii?Q?EzClNDSXro4fOG+FKzOUZV/nj+vHCnYQVPlbs63jmu2CgYosaV3dfbzitVll?=
 =?us-ascii?Q?1Jd4uMeUolBk9oy2ZZBbURAuci1WHGsiejUQet38jwXSiziMPsAtpP8M/QfD?=
X-MS-Exchange-AntiSpam-MessageData-1: ipTCdrbY6YVS+g==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccec5af4-06c7-4dcb-eb2f-08dec22713f9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 10:50:23.2859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOBKj1U4x1r2mQOpR3R2WOOxeLs6d5xuzk2/YJb1xFwoJ7pTVsz75/MeburWSdKxF+LrEDDt/7dpqCuiqduAW6MCkQ+Ppu2aHCvysqWxroW46x6f40KlnENU/CZ1Dx0/Q9puqD7YPQjdURsshqJ3tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR03MB989234

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

The SMMU is disabled in socfpga_agilex5.dtsi. The SoC uses a different
memory-mapped base address for its peripherals, which requires the SMMU
to be active so that the Secure Device Manager (SDM) can correctly
access those regions through address translation.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
Changes in v3:
- Fix commit header to follow subsystem naming convention
- Remove commit body line that restated the subject
- Clarify which file had the SMMU disabled

Changes in v2:
- Move SMMU enable into the base DTSI file instead of individual DTS files
---
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

