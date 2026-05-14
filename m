Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025AE3C1F46;
	Thu, 14 May 2026 11:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758879; cv=fail; b=EJpHJAn9X7q1nYiBLUI5UJNMnLJJWTDsjErBJE6gOc8AB/oM4/ZBWMO+mJvXB6/d7BPAGyX2vQaRjA7kEQQS02ZaGckcsWk2Tm3pPDrD7xsZkB7NmUcd5NmQmkznTLDulwPUfRPcFJRI7yMrdnTjmZcJQTFu/3UGXnnASX6HbKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758879; c=relaxed/simple;
	bh=xDb37ZMc2iXEtk+j2RYJkl2AyBw4PG+OCVQoFHGOeqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YHYosdIRP+0Fl/MSqKdbiJape39+SL9Uob4b+KDcAQ2x2u89BE/ezXLSDgqdU/FOz+VQwK07Cv7BoTIfOn1CW4P8F3sdXAvt4lnn+zoNrPmCMl/zBgHDenIXsaTJpQrRJ1ev27CC+T1/rtA2vuLw2BJwLiAR07s/ajZneEh2ZKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=YNqkv50t; arc=fail smtp.client-ip=52.101.201.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="YNqkv50t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VaY6wiQx48e+eYnmgFKIzaG43zJcAibAZJTgTJYHCsfRU5YXPJK1mheO13ubjn41krUDDTddH16qnNfe4Q9BFVnaoBoDEjHcrqXpotzzrSGp0dKzn65khE8+qu/yPXvrLhLEvinnytBYQ3csKCaVzwBAFa+a5bZczOAUcNQUjjfhFjiWqy1GRrt0RHPdUsCn79et4dB5/yXggb1L/QazTQ5nlHsfWnOknhlwvklJnx+Rcw83pn+Zf77z8YbUyQ0CvR3X3X4aqmyU5oUsj+tu+MIA6veD7Bpzx0yhzl+ip3xRPrSYlosJNSBasAv6VYGAhcs8CfCEIxzekhhrpmS65g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlJN2U6bEy+zIUyaOpotZd2t2OhneS6tT8WOTWBaxEA=;
 b=tYxR5AblRW4RdzUVtSlF5/h6LM1lAhmECvisT/IvTwz9p5VcLQQhZUNZpU6myVYDWSHrWzmXvdNq0Jl5DsAVyLg4SPayHEAwF8e2LylsYP5+fC00+KxriKNS9jNqxT0KYUGM9AzisUZks1LzZqoH3gcj89x658StXauqMaypJU2K7AbCRIhDq8ftI1TsCUybtkXgV5zFm7pv1RhrTxLj8APR5UgmzWtvJdduKL9Ph1XVNyb+R8WP6pK5b3SMTz0k8YZGQR47ZFkVpnWVzULeeI30Fe8KMynVRF5oDAQiBHoJ1p8DwJav/4fD3oVdeGyw1ykQdndxA/roGyq4DvUKwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlJN2U6bEy+zIUyaOpotZd2t2OhneS6tT8WOTWBaxEA=;
 b=YNqkv50tRfuXXcW5DKD8jRtn46VpaDhpTzkLX0Ffgb3P/oYzctmxiyDsq8SBepWgcWJaBwgq0P1Q8ReEONRK3nl5ZTmwAhCkZCU8lSOWJ7EY7i+0pBWQTx5KSUBBQGKwSXXdQoP2pzN0d4XNutsMgFn3sy3TuxZZCjZ2fi+6b/g7EnEx1QdSpedkiha3k6Ev0XRDfsKB4FhRZ3kwfUnTO1NHGNpKg+ihzrnmcRhJJB6akwqff5zXjeAcpLTElCgvPxD51JjSR/viEv0wY7eZry1HWUp6g9R4RcrxdASi11HQ3UIT5SamCqUOZYXtAnTifvY1IIPyR19vNNbjakXn7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SA2PR03MB5707.namprd03.prod.outlook.com (2603:10b6:806:11f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Thu, 14 May
 2026 11:41:14 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 11:41:14 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: socfpga: Add dma-coherent to XGMAC nodes
Date: Thu, 14 May 2026 04:41:11 -0700
Message-ID: <20260514114111.10574-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260514114111.10574-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260514114111.10574-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0156.namprd05.prod.outlook.com
 (2603:10b6:a03:339::11) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|SA2PR03MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: 63f18773-1639-425c-21be-08deb1adb3c3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|55112099003|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	t1zKHqEDMtw0a6X6ib38KHSkuzGrzgGv8rs/T67sX/T7uNj9fahdvHc5ruv24cuP2SHClWum7jFhBiqP8/tMod2RV7Yv7uzOyXVSlcxoe3urgR+rONgmg+GDRgI5/cH7qkykX0aXkbyNHrw6JLoD2FK+M8PWjRyhqywb7PW5QyoiZ6Q9fDuGiYZvtGFQ3Ge0OKMsaTWep3O/QCFcf0ng7wZkkAHf3EJcFf2Yok/YkCdR1Pc/R8QqCw51kaGk4X0yYGm/sYB1qLifuSk2JCveKT6hh5dTV0nuVnNTEXzXtATzoxiR4CNExkj/WEMaEk6n8KJnsRUK4p2FT9gG4A+hYsDTybdTAG7WvGrjDvVHfOEvDFnYUKx/ualTpm5Urgpz0qrQYECvHEXz26/OMwB7h55Qb59NI+BF4hvgMyJ0UQgKwzBWm7dgC0hYmu094oksfTpFp1UigcnD4GBqXtuKkugu7fSOUucDMX1hLQ+AsldUqx4RLQwq+6s9kGytgo36btbp+HL0ra8FFhoo9G7mYdOGU55JLa/z6rHKhnSLgP7Ll+0/54xHu6otRcg2B6EnY2/gq5NX6CawzGyLa77MBxXxtNlMgW8N7Wd7XwVcqzEdlYL4fm/Y76JD2weoeiHLbImaCqrAOaNfzQVpwiPRn5q4d3qRgsmI6vn6iTpfHe8IcgxLAtPUCG4kMl7Rz7GW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(55112099003)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2f+Md70iLJ+8t9alCrWFhWaDTOxuwqijVbQAuegB2jeHc13MCRAhGDoUKByY?=
 =?us-ascii?Q?PcQx2Ym0PtTdb5S+UwjQHrw3HVZ51AppKK5pv5hT2z6yo2LaERkCa0SZ4NUy?=
 =?us-ascii?Q?WqJPthj6En2qPW6DQ79mYy9HPoAh+7qgMy/x9tqUZFLnUr9knNO6ZSAi9Th1?=
 =?us-ascii?Q?2STyqpSXYRy6As/J7zi9scEFNrAE/qiwo9mjln/6hpNEnxLY+vump6z3zPyu?=
 =?us-ascii?Q?8U/e8/j1irBWDX+/kDEJvxPsMjlt/BPb8fp95EQ++WDFIPh66xmeMfAcgami?=
 =?us-ascii?Q?cotgHHfrrGRgO8BAzuJ/5kqcpCpy6kFcZIQQzUu6xdVOVEnM7x4XJUnmTFdK?=
 =?us-ascii?Q?hT7Z8BRUFRxpRuI85XuDLbAsaIHmDvDd1TjY6EFM7l70wp1mkvKElXgOELdw?=
 =?us-ascii?Q?lmdaRDx2FeeByiFH6JBoiO37YeEHJYeXz9jyhCyLItmb+tvBGXB7i3y2Y3y8?=
 =?us-ascii?Q?l8mHE5LVh/8z2w/6AMPLm5vUwhfI7B0VQ2Hp/EAJgSE67+xZhekD3iXLcJVc?=
 =?us-ascii?Q?T+wKOvfoWJ5W/gZiU4Dg1t6y4QDPkX2v2aorXGcfyD/7aNFqm7brWBZW+oMN?=
 =?us-ascii?Q?B/UvovH622cQMbhF9CpTrrXPMXMPfSrOxm9OSqCviYok4ySoFHNoVo+xccNO?=
 =?us-ascii?Q?iBF+flU8p58F5EIrY6K2HgLuNXMOinIUzTnqiCR07EnF2jtjsG7leXstSn49?=
 =?us-ascii?Q?Mut8omTIP/a7JQlGN1yXf+bpOB6tvZ+O82bC9awdAmrPQ1HgZdk3N6yFIqyb?=
 =?us-ascii?Q?4MXlk42ujKqtQmBSgezTHFtMGWkmApjIY0k9UVO56xMNPpDujHqOOCJ/aCbW?=
 =?us-ascii?Q?ddllfI/Xy1vUvMe80OsyCZ8B5Xio4FHGqZtT1BOpEB44AqLVdxZOofGrnSvK?=
 =?us-ascii?Q?3trmLjnMpypUY/ySZn9E3VCQ0s30PH17D4v+myuTcpd+bIHc0+HxPX6k/ur4?=
 =?us-ascii?Q?U1zoBYrElRfWKgrujcFYVcK/XuwPY4aD7FNDfszRYUchrllg7axmR27spW5m?=
 =?us-ascii?Q?43W96/36xAqUkMRQm4ET3F7p6xGIxY6OQy+gXz2QofM4fh2wFQnTljuYxRMt?=
 =?us-ascii?Q?dVpGHqjOXJNuxzKMHshIftb2qT+Vz94RJuWJYm+9YFcY8GpSKV7y4Axd+1hd?=
 =?us-ascii?Q?GPolr8FBA6YPsMM/zn1wIN7UAQ70d/jNK5dO23gI6d4934Qc3Z16IeKLOqDO?=
 =?us-ascii?Q?3y5XYBaQHwsb6vfnxFyrT2g60v4de0YTakj+pHZYjAI/llo5GWlvUGTcWtnx?=
 =?us-ascii?Q?gsj7DGy4kj908s5fOHRQoNaxXG8N6Zf1jcUFU6TkE4n2eHxPTMbcQVA0TJbZ?=
 =?us-ascii?Q?Age9/G76yL1Xj5It0fBgZH9jDYBGZELSFDLJOGMw5RsJ+xLyGn3XvkM2NnVu?=
 =?us-ascii?Q?1j2PyqDOMEdCCz62GizxoduZZX5Nibv8RwVo24fMNeHmLmVaifUE/XBD2gch?=
 =?us-ascii?Q?nCXbrtGiyBCMxaThZxLzrxL3mAWyw/nt81yqHjutfZWWNLfH8V7sVz3RCAkh?=
 =?us-ascii?Q?69+CmD56+geBBuol0zZLIgRb8w4xn58gP1o7OfEs+anferhEEh3yIS3SAc1v?=
 =?us-ascii?Q?MyfLWBwdgGOm1hU9MNVaN9Sez+ZCjtac8r9vcstk9qTSj/s6bNO4e/A74m0+?=
 =?us-ascii?Q?/Br9fJra8zCeYE95xTEMX4kKyNu0PMvML1N5l3FH9KmJqeCaF+c1wk+iQZ9c?=
 =?us-ascii?Q?dr1tcYLH0OEOi9eloaiwuS5f+/ooGqom9KIrP70ZahhvctpRpMXxLqlun3k4?=
 =?us-ascii?Q?fg5doUOxUtRprdg/FbcLKVzCJVP/6m3VvvpPbVxiMX2iRd8jnV5Bn20NDbwl?=
X-MS-Exchange-AntiSpam-MessageData-1: xSFXdPsLppxoNQ==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f18773-1639-425c-21be-08deb1adb3c3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:41:13.7627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89nzfR8tE/4KPSliGnFNKj0BGmcJSwh4ku9rOUahIPVwpQ0B/P4+m+GZn81nMJZNkf7ZM+Gby9LlB/6Ej13iiZLDVTwwWzKdSFXS8GQZ6fszHHwNi2kIMsbhK9jwHPsz8I1V+j/itFfpxQXuMwnTRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5707

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

The SMMU is enabled and transactions going through it are cache
coherent. Add the dma-coherent property to the XGMAC nodes to prevent
redundant cache flush/invalidate operations and potential stale data
issues.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts         | 1 +
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts         | 1 +
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts    | 1 +
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts | 1 +
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts    | 1 +
 5 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
index 25e17df0cbdb..2061d301126e 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
@@ -52,6 +52,7 @@ &gmac2 {
 	phy-mode = "rgmii-id";
 	phy-handle = <&emac2_phy0>;
 	max-frame-size = <9000>;
+	dma-coherent;
 
 	mdio0 {
 		compatible = "snps,dwmac-mdio";
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
index 66fc3c546b66..0af0b2e7d867 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -47,6 +47,7 @@ &gmac2 {
 	phy-mode = "rgmii-id";
 	phy-handle = <&emac2_phy0>;
 	max-frame-size = <9000>;
+	dma-coherent;
 
 	mdio0 {
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
index 86137380df04..9bff6b57f19d 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
@@ -46,6 +46,7 @@ &gmac2 {
 	phy-mode = "rgmii-id";
 	phy-handle = <&emac2_phy0>;
 	max-frame-size = <9000>;
+	dma-coherent;
 
 	mdio0 {
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
index e728cedb4cbd..6c61add0ef09 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
@@ -49,6 +49,7 @@ &gmac2 {
 	phy-mode = "rgmii-id";
 	phy-handle = <&emac2_phy0>;
 	max-frame-size = <9000>;
+	dma-coherent;
 
 	mdio0 {
 		compatible = "snps,dwmac-mdio";
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
index 33e6455ead0f..1a9d44e2bcb3 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
@@ -44,6 +44,7 @@ &gmac0 {
 	phy-mode = "rgmii-id";
 	phy-handle = <&emac0_phy0>;
 	max-frame-size = <9000>;
+	dma-coherent;
 
 	mdio0 {
 		#address-cells = <1>;
-- 
2.43.7

