Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012053.outbound.protection.outlook.com [40.107.200.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E453A383C;
	Thu,  4 Jun 2026 10:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780570229; cv=fail; b=PqrXTsvGriJ/Tfo55xHclPACQSKjklqC9RphL0FYK9bzWZ0h0p4kqyQRqT0oQq9n6ft2ombYy8tIbxrzG7ULwgjrNfd8UtATyaDefuKJdYIQgow8cfWIBT6fyCvkrlKC0oFFVGpASqKFSOcVpt2ZQ/I1759kxKKNcJimK6rGT+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780570229; c=relaxed/simple;
	bh=HaYC0bfh4OOBxv0lxHXKi4dHfNgdGDfnEYAv3HBdVH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CyF22Q2NAiez2h6XbMzvlsYsnyzucxsUDIwxf3kpE0CdJIXKmgHliEkEvnIYW9T42vBO6pCKTLAHFNE8+UXIXVtabQPDH7wtguuOfj5AYaRYNlFViEeRUubH+csD7xkqi7X0JvVukO9RcMThBL9gcy4Qdech7IE5AKv1cVpBCug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=EkXwF583; arc=fail smtp.client-ip=40.107.200.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="EkXwF583"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=do2vpCXEnH+T5f9JX4FmEaeso6zGK4jKgmscNpV9hDWdol07+2Uf6rdo5Zw9Zg/sDgmCjXlqu4XAt+7ZbUS59g8N2pH3yGaiObH0BThiaig906ekEALCz4NJSRiborJnxtqUDcbPKEkgfz7b6QR12Uft03kWgBwcuhHqIWqEekq5xi1iWU1sji+re4O5fSP9jeM76E/jsr5hWBzF+NKw/6+90kUObhtwtmU2XkHto4gqzFo5SV4d7KAzen8cufC45ptXdJ5Gye175J7oN7YTNxgDJp5q8JVx3FKIyjE+JwkgYicSetxDGPCDKoCUvFpIHw7LLGCkJJAhBjp9cuCGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+a8j7T8FEGHyXv7PMWkhDFXBvuRT4CwFAOuuEyHVVk=;
 b=fAKd92MawX3BRy7Hgn081P9O788bonPTKn/4ebJCXiRuVTbc/OEORX2fs3kQroo4b+2mfYpMQduqa30jcej2ZDWeKenNFucqUGRS+poxUE2CzbYTSw/XcT/J4rtTd7Fugrh7oSsfGtqFs52LTiCI3xUbYDCYQ3OWPRCBczJPP3SUdArspVXdakSVWhLIHNuIoOnSSfZOe9fL9xictH40mbmVZ+2KF+K8zDA/z/dq8ASWyDyIHIE5JQqAF2stdVl7fXjAWRX6fJx6vzgmjZgD2xXbxoU53U1NSjKPolD5UMneHIJ8Jg6aqusoAEVRlpgpuX6mYeCZEj7lNfOfYzkntw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+a8j7T8FEGHyXv7PMWkhDFXBvuRT4CwFAOuuEyHVVk=;
 b=EkXwF583MiAbe/HlNwnqnjj08CK85cWAK7ycttFy9fddSOnHMunVMs0kpJo+M/EK6Bg5WjTFgk11lG+w8UlXXCeiPeD9y/5igiJKVm8dCeJG8yzvTL/4BUMGvc82kYQJJh3vcvTBxuTv2iFmrjFew08JLlxGw2kwBjLbT+w47XsmF40H/18PYxCFS9OjYWxi2Xbdi9gaooMlh6xLPcu5KP2ge3UR6j5ZW4udxRRTu4WpJD9GBkKQkTkKps3dvAJ5QLqN99tDWH+qaQMhhBSmNOT5F6xolc3iDiH7POby5xDJD5aYFqau4nffDbkIgTPFkRtfJr+Gbk/Nv8Hm1LC9cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by PHXPR03MB989234.namprd03.prod.outlook.com (2603:10b6:510:3ca::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 10:50:24 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 10:50:24 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: socfpga: agilex5: Add dma-coherent to XGMAC nodes
Date: Thu,  4 Jun 2026 03:50:20 -0700
Message-ID: <20260604105020.24782-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 885ed918-0178-492b-38cd-08dec227149b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|55112099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	tMYBNn112aKIcC+wRM022QDWr4TCfMSld1WfgaXQgeqn7l9ghy8uksDFfgtyfDiyOg/57E5/1Vv6EYUiofDVbZV3rq5ES6H3Ti9W7oZzPP5OXHcPgj4iwrvleFfARlH7LImUI7BfMvShVb50BddfbagBNsFqoD7hGdgrNoQoEngrqILoXXIsHzIgpYVJVUIgs0BtnDH/h0YuGZSjUZf/E3OKFwJPrZkSfejeyXa30Lk+KLsnEaYx0zOum5HBBeuAuHOpRKK2FDRacWvm8Ot+Gp8/XwIEVcPEJjm++o9OMcwR+zUiPtv/PfLopwxuMiaXsauH3CF2mUq0dhq736QdPM9eg1biD7Ga8gTtKfwQvAaQdj21bZ2W8X9TBqmDIczU0P70eDqQR/OjQlXK6yHqgHKU/w9kB6+8NGHPV32fC1GXMUzt68nYOf2c9OSaz4nDKrJO/05Dg3Lwm9/pkCzggXuocR9xiozj5X1imj106pGQjTQMBvGqGgd00OVB7qhAdlD/7TWUhHW22f/AArePO7IVKR221zyzycSM5sWaG+YmarchJLS3Yz5AfjlVb+bcq/74q2PC/INYeYHWuO48geMS9bBFj+dK8v0Hz0eUsqPQN583winGOS9SjXK6PxBZdQf9ZaUz30VNHBs8zDuZwtJM9GZeFu2JmHY9lq0mnCfvll2lOLOwjn6bxafSdbRy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(55112099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DpF4pRc0d4H5mZSp31NdfIH9TbY9+/K/d7W0pMMLPurnh7p5l/As0cBhp/nM?=
 =?us-ascii?Q?wrpMB0OFqB/gCWUe2TrhWseKQkxFS+8bcnuHVUR2Nerb2djihq1Mz6k05e6U?=
 =?us-ascii?Q?QIsvXTHC+0y+9qH7lsYMPFjw/9ry/QVHAfs1OGj6aUBY8zt44T92u9o1EXpr?=
 =?us-ascii?Q?+GXhRKF++FEUsNVJff1ibtXv+qiyRAhLT07DikMh6G1TBMrj4IS6G07hdlLm?=
 =?us-ascii?Q?jbUr9JeLMZan/S8+sMQDBwAxEfZBCKWdvhTnzbHxzfhXKX/8M9rE7hnNtO0z?=
 =?us-ascii?Q?k6zP14uNwMJM9jZh2DSBZu8muNuQbrwnmMmtuLnLM0dOolAk/QkwwdUmRKLN?=
 =?us-ascii?Q?SKox3PXDN/jqFDWfjPvfgVFKlemJ5CaP5w6npVQe+6x7MzWNNJkst5y1a3p5?=
 =?us-ascii?Q?bMNNy2Qwh4hpcJ40tG/A47y84tuh7wALb57DCL3KJkwqgY2CX+9QiebZ2PFu?=
 =?us-ascii?Q?0bRy62K5a55nNR+mwXOAj2XWm5TOy0OFqunBMCeAKPK/todtKF8vZq1P1dIE?=
 =?us-ascii?Q?tiidIXJBJmee6zms3bQR+/mHNp1sHfGInjVUiN/C9+6UHzZh135nCWfA6jCQ?=
 =?us-ascii?Q?EBZDouYcZ43JcJSkDi8vqziHLV7yMmLFM8QG1NnYYonb+wi8BAfd65qYCvSp?=
 =?us-ascii?Q?XvPVSKJ1Tzn1OuyFTl4fvPJ/3Fm2B3EAf1oHcQ+/ao+FrtH2MMQKB88Uquq9?=
 =?us-ascii?Q?On1lCHUQPsr9apIhbgoxxZ/Wm34CZdcNfrObuh+5EHhzshxFdZuiCzSld69H?=
 =?us-ascii?Q?HJu0VJ8F9HNeH4PLWWsxOxBPm4lDRi+2dX6CN/9RK8UY6fnmJhRdrZhUx8G+?=
 =?us-ascii?Q?ewvLBsSs1zW+IxCPH9lcnOiValnvuwo3ntjlcdjqEPapT7/FNVcSThWlzGEW?=
 =?us-ascii?Q?A9BklqQjKCZaYzyv2Yucg0HbjvfPLbMNREWEnSj20W1PevobXd5B4MT/YSW+?=
 =?us-ascii?Q?IUrYRpRnrc2sNTi03X5s86TSUoeCBlq7KFtFE0DeTXA0AbbdB8HO74DxG7zb?=
 =?us-ascii?Q?Pul6xPEeT0ex0gmfnNGmzqwcOxLxw/Or4VmFN1PAr6Z8MOANP/Bu2JDWdIIq?=
 =?us-ascii?Q?hIHqnCy5b26j6RbIApLokYm6OZstB3okOdddrIHVaHVglodXRfHH05Mn5dfN?=
 =?us-ascii?Q?JkNQf9tYSTgUNvNGyRxAhnv+Nl5VCNOeG5+RyuzA6mALsOORcOy34863iTJl?=
 =?us-ascii?Q?saOiy7zY/nrkGAZSujenvQ1VvLDJbgRCKt2r5spnaosDvMg+ByyZyxz7Oqe7?=
 =?us-ascii?Q?Ws/SdMvulhYtaeT6tNf4JchTR+dqQIKi6JQMFkKU5WUSor/DvFj6Bqk1lahw?=
 =?us-ascii?Q?UVpL8Yd4H99u6ZHO8iKDAYiM4hxeoJVEHI1IJFhkh6n2/FGPdKZLyX0O9SqH?=
 =?us-ascii?Q?wr96z034yvjDdqcItC5nGgDLL67IIiIsAsuUs8NH/qRcn3LFlbTdSLHvoLXM?=
 =?us-ascii?Q?X5ROu92cfgVYXM3O68yockTMpBPNYtVfM4cqvkGv54Sa70w44QDzCHW6Q0Hs?=
 =?us-ascii?Q?hHRtZvVAqzlDl/MM4pYCgluimYnSrP9KtX6/VDTPRCL9c9l94/wcKxMMuCcc?=
 =?us-ascii?Q?UTnUReKcKmW0iHlMWYGRqJBhzydUhvojhM0ih26Dlnc0X0J3VC+B9MWp+Zz6?=
 =?us-ascii?Q?wkKSHy8/vYPRosL868LVblHV8lJlbGyVyLt+9eQMdpSsr1yYtfzA6Uy61h68?=
 =?us-ascii?Q?MClLFYF/16c2iNJwyf6EudGFm9uJaY+GoEKxr81G88/5R4Vp+eE1HLpGP7mO?=
 =?us-ascii?Q?FW7CBnFk7RZ+XCPOaXKumfd1IanvzPqy55xo3/1myBbJs4xMnf/NjLfqjtiz?=
X-MS-Exchange-AntiSpam-MessageData-1: 5nAtZvJlgnjLmw==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 885ed918-0178-492b-38cd-08dec227149b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 10:50:24.0688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dMqQA4sOS3w/XOEoy2kZrxLv6EfLe2I9Gyd9ShvqcIa+lsPtRYGys0uMq7E2yPCLE5cnejpHPoTLFW4NR7Wuq5PmZmSm6IZ8Mowq+pRUPvFDMRMt1GZWsrhHif6TIVPWkbnNK1qOkFQk19Q4nKHww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR03MB989234

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

The SMMU is enabled and transactions going through it are cache
coherent. Add the dma-coherent property to the XGMAC nodes to prevent
redundant cache flush/invalidate operations and potential stale data
issues.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
Changes in v3:
- Fix commit header to follow subsystem naming convention (add agilex5: prefix)

Changes in v2:
- Move dma-coherent property into the base DTSI file instead of individual DTS files
---
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

