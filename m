Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012009.outbound.protection.outlook.com [40.107.200.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABFE3AA1B8;
	Wed, 12 Aug 2026 07:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786521441; cv=fail; b=Ti3UPhuWexTMqqkbyIGEiOLP/GRzjY0P1Ilhuc0D/BNEUA+8gLE1fF7eSFHEXd03e08+69aY14YT5Um109xzlLtuSiyDFbynOTl/XPJArqQ5lzMxIdpaBilyqX8cOw1/F09JwjiCcwPX0Ox+T+MFleuGFQ+eZXk7M2pQYBrCVEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786521441; c=relaxed/simple;
	bh=keP/y+5tEalxTE4JoTyrhCMjWzVVSc9BJQQ8HWHmmfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZUiyolmoO3SA7CH7NdRa5eLM4s1bRkuCL3ZN3b6jGGjo+wJ1KMNLivElMMZV0jpKOBpM2YB28PPKxW8G1zmMWG8ZPnskWkdd92P0bhF0OJp1bgYKkE3GKOGZIg/pWcKLVIdJcxo/IvsHO/95aOqWmI9KoPXkeJHuJaa4id/1EAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=iLP4uOqQ; arc=fail smtp.client-ip=40.107.200.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="iLP4uOqQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agk+OM1XHfZCRFwuhwJkkpXccN3JEEiHswwxnZa7cUjOT5WocZGzbBrx1Np226wAtlpDVg/QOVfrCzaQHYzbJl5DMTB12AmK5uhYQ54iqtZSF2ZU8zMl2u9K42ntewtBJOVi8T6NhMY9AJqrB+koAQfsbmkBKkpdVlYJMPlILJKa8s+E7TH3504kH8Y+364Ul5XkAgIaV5fwxYY3CRbx1lDlNULdIMyBHwWRw6wA1LMu10A/t4lANBAF/yAL3L9B4vq69Xh2ri3MHcT5J9YcPSPxyvJOk54VuoA5Ea2T63OGyysTfZOpDvPoieG+ereo3MzPzdUh1+hje/uBT5/YJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhYnf36RT4sPsLORX78YhJPbGltqYnC9EUG60NjTyBg=;
 b=M8y3MiWfOA6PQNNK1yUa3sg1gSpbZ3iVnCKUrksg6miCZzimAxgGFLxgxPPE4ytSeLnU5FIquojL9T3R+8yHYH0Ed1IG6Sh1wE83wP1IDUNgzjb8VaGnQzcz9rkv5MJv5AQCIA03l/lEvMUqTCWEXMOdQ8i4BoTxCW04NjiZuGVU6HxSDpBsuwaXoXd29uGaCRueNlUaLmQ8dn/xxr/nxzUq5YowWRvAp1BfDJO/uGRgqrssV98J83VcH6Ez96Ev9WzjB9XCEUV56ZKTiAnP8th28YunyYUj+rYdMEKoLa5tu4EvFxyUrj29T4HvE/k3VWxdnxukZ5OuM0IemRw75Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhYnf36RT4sPsLORX78YhJPbGltqYnC9EUG60NjTyBg=;
 b=iLP4uOqQLEM5+0mKel05Usjf3faucgd2D6j83bsJse/0zmEqKQ3HZ55gYIVEg1O4zm6oDHncBAOY5917tAlADXprVa3fa9OXtaBk1lWObaxH/84BOqzrP+p0+fXuZpyrDNqjYSMgYMW1sQ6gaG3Pn5cEfzj65DD0O9t9Ho/Z9VmopxTSEmv/yva8vBYI4lRKoenE2QQkY04yaTI4zHhFC+6w+3xXqr4eGDzVlYhZ0Q2kgDW0gwWGZJLQELtH9x7fKFhwIolbuUWqVZtMlZqNbFQ7cCvFGva3dpHO4DfR09m/+UdOuW/HP5/6AMrX7olgZAT8OvhoIjX5BXsplAU+Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DS7PR03MB5606.namprd03.prod.outlook.com (2603:10b6:5:2c2::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.25; Wed, 12 Aug 2026 07:57:16 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:57:16 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v2 RESEND v2 1/5] arm64: dts: socfpga: agilex5: add FPGA manager and region nodes
Date: Wed, 12 Aug 2026 15:50:27 +0800
Message-ID: <c1210302cb5dd630dfb5d98b7e0920fb38837822.1786520346.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1786520346.git.adrian.ho.yin.ng@altera.com>
References: <cover.1786520346.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DS7PR03MB5606:EE_
X-MS-Office365-Filtering-Correlation-Id: d48dc7a7-d9ed-43de-3c9a-08def8475386
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|55112099003|22082099003|18002099003|11063799006|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	tHWfvCKbDBvosRIViLR7lx8rR4jOFqgY7Ui4n//wg6UHo3d/jFK4Srcp+rfPvQ2F5DXqxiSQFgHmqm3V5Zjth8OGYpo7csXIYa7ZBQXhubBNQsjZsKktRTjNwy6vUGJdFDTjHxbbvdgrKvFmyeQj6W6/oP+iyuB+laBLecYbQI/iKfWjsagGKC6F3bK8+kRkn9x7PBZVNzb3631h+A0BOlBoKTkpGPeXjhLhTr+Qkty4l1IJNRUxV2SP8h+rylavlC80qnphizYagjy4Jp5FKTJ/00E1AqEO71YmtYDypGnXaGBdA/zWJyDyEEgAo9xHzCTefqWLtzrBu3RotJ5C5o68N9qpWmXoO2MOQhZoY98h5Ye2Nk5zWS50wC89RCP8vqBzPJ5aqJ0rZbyRnYwOphZuuMtWoTOl2rOQ3bsW8Lm6GE5/1iemTzdgqa8Hj3Vu1MeFksrEDXjvlFYMSGlwa8byT0mb/OUMDpmBFtxTyQwWmJWw1PJA+eIvQ6T9F7EFqCnvbr1y1oNX2QcIz1RCbWRQyHbavWPXhw1K32/jXgTdFulflsmabtHmUpvPohmKdSl3HPQUgyvgh73uicuoINujsxI41RY/8COFI6LOBy6RmYYliQw8I8NBaGUw5d/gCNHDG98/BTrzNS2U6j+1qS3CGfKpORCMwV/jwWNgXGQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(55112099003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4DWmtVjiGcasSOAY5iFvvRW9jr6yTGYeKTRb7ZN0V8Tu0ov2dado/+A8oWcI?=
 =?us-ascii?Q?ggTF2Z7TyJovLO8fE0nC2JbOYpwfJQDvS1nS9/PXMatcvUIl+CoB3D+E9lx+?=
 =?us-ascii?Q?QvgI//DFWL+CXn0Qy+AsEXaaA+QaWt75KCsTBBQ+B2waEYJNQ2fogQGmaR1Y?=
 =?us-ascii?Q?4nmpF3BP2W6/+TLemLFV2zhwflUH64NPIiNPBT6dsF1WqKnYzdYTMXL4Kayl?=
 =?us-ascii?Q?cs0eA5AsH6+Wh4P9h91LfPbqZbkwRnDbaUDSsBv+i+vXtjGdEezLPCjfgcsf?=
 =?us-ascii?Q?R8skJ0o06CGdERXuvns0I24s9pGnKCAlQFvZ3AT+yWhu4hZwAxTgTTg4GY/e?=
 =?us-ascii?Q?ycvqBuTY6IWNeOhq8RFBaM+9JFzHiElUiZAS0DB5x9mBKFCNDZ0aJ2nkABfO?=
 =?us-ascii?Q?1Pq4k6nprGdDb06zmWwO5LEPqvL88i9P99aiKd+JnKtaZyv7CePZTiSiSvEW?=
 =?us-ascii?Q?bOri3Zbgm2orjfWOXdwPwkdY38Fh6h94FTTQ4yybLYFiByDLe1YRONsd0d56?=
 =?us-ascii?Q?yO2wnIBW4oEjbLW2TN9EeT6Pcb1Xy9pPlKI1V1KgRVKEA+RCXhkIJb4hF9Zi?=
 =?us-ascii?Q?LwaU/m4rlPfNVmgQ35KUt6PuQGI/SJCKxk/1Y3CQ9W2QZhqBZiHAc7mNkXbs?=
 =?us-ascii?Q?qPBxE8Xvx9yGJOTzCM45L8gU2GonPabeIg3Xy7lOqWx7hDVav6Ax/gCmyRaY?=
 =?us-ascii?Q?bRhNxbDhT9/M61/uy+jxB3ZcwhHsmr8fx7ebUeuZmoHFDhiG3LAEPUE7mu4m?=
 =?us-ascii?Q?Eq2ueHju0ORNFji+pSNCJ9BCBbo6MpA8uwtxMoULaRLD+Hvvv2ktg4Ec6rRU?=
 =?us-ascii?Q?ZEsXItjz6dDfd5Qn7kUXs8gVXY5IYwybCDuahBIlb8068FSy9iXiUmO2CXB8?=
 =?us-ascii?Q?3rpOPPAMhT1YHHLmJzk1oiPuKC/5hknFlDHHkZAeqwTC3FxDMJFuuiNWzB51?=
 =?us-ascii?Q?/LYJ0FjYegl7XLjORrLoiy3IEASN5x+wiifvnnV3v7pzCBrQuqsx5Q/MkZ3+?=
 =?us-ascii?Q?eKTkGQNkfS0GdUA8avsgJMJXFd7wvDwd/ua4L/UH1rNeF9WZDZLkzDAiWdMv?=
 =?us-ascii?Q?LEO+/hh4t2kYdPKDkVpHAh3TcL24+U2vL9f/2vSbe4DNMgo3E2XXFoQ6Evn7?=
 =?us-ascii?Q?lplI4p+RxvlJUYO+9OZ4XBXSW8AwykelNr1NMnd0K/LQ+N3O3dawouDNVugs?=
 =?us-ascii?Q?4sbsUijdc9tvvk/uxfdeqqr9B5Svy0xcplatyuAbwJmJYK6wTZJliDrfbdRH?=
 =?us-ascii?Q?OWLddTxlVU9KdwgwXX5MICmcS0RUJeDj0dSVgzK7X0dqZr4fl5WoNgdbdRmT?=
 =?us-ascii?Q?1E6HR8+sgaZhbvFiwTKdG8+wZQ9gAe3P37KofwNsTD6Y88iQ0RRTTKIWXuoB?=
 =?us-ascii?Q?xrpMXpx4Keca34NWX0neWxHiMkdUwKnNkd2IDtPgDWcaU8kKNrzkEe31Zbwf?=
 =?us-ascii?Q?uoO27Th1JDu8+QcldbQOGiTcIEOUy5Yc+rtQ1Wn8u1r34KFFFoyUA5b5RfOu?=
 =?us-ascii?Q?Kj4SWBiUzLZ7holMOTht4fX8siTAOIOINdBSpQAYGmm5FGvGIKaUVpaHM3Fz?=
 =?us-ascii?Q?je1DGDfavZQkJSgqfV9RIPUVLBt4/OGqMP0+pAeLtYFfwVmcTFKPyOVjDTwq?=
 =?us-ascii?Q?1AyDRSn4YV5ySuj7pMqtrQF7ixZpIqhHvwWmsh2M6Faklxqa7BDfN4K7C33p?=
 =?us-ascii?Q?jwDnsKT86zBQkjNvd25KmyNpUaLwQw9bLPMpXozPNl8psUI2iHLxHF+qZMiL?=
 =?us-ascii?Q?6tJcO0qJRMtmtCCx0X2NouDLRYQjq3w=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d48dc7a7-d9ed-43de-3c9a-08def8475386
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:57:16.2044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNBwgjxMP1Iw4GV468A1TRvxZ5w4W9m8Yx90lyThCmy0YxIlZhdJE7BF2Xjm11vOjW7BHesgymeVYh2agGCyVo5UL99FuodNjJsUiTUSiuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5606

Add the fpga-mgr child node under the svc firmware node and a fpga-region
node to enable FPGA configuration and partial reconfiguration on Agilex5.

Also enable the SMMU by removing the disabled status from the smmu
node, which is required for the svc driver to allocate DMA buffers
within the SDM-accessible address range.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index 02e62d954e94..1cd9773a1500 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -85,9 +85,20 @@ svc {
 			method = "smc";
 			memory-region = <&service_reserved>;
 			iommus = <&smmu 10>;
+
+			fpga_mgr: fpga-mgr {
+				compatible = "intel,agilex-soc-fpga-mgr";
+			};
 		};
 	};
 
+	fpga-region {
+		compatible = "fpga-region";
+		#address-cells = <0x2>;
+		#size-cells = <0x2>;
+		fpga-mgr = <&fpga_mgr>;
+	};
+
 	psci {
 		compatible = "arm,psci-0.2";
 		method = "smc";
@@ -385,7 +396,6 @@ smmu: iommu@16000000 {
 			interrupt-names = "eventq", "gerror", "priq";
 			dma-coherent;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		spi0: spi@10da4000 {
-- 
2.49.GIT

