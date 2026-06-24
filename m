Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010014.outbound.protection.outlook.com [52.101.201.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E8E31D381;
	Wed, 24 Jun 2026 06:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282131; cv=fail; b=fVfxwGIQjZv668PCBxLlLRVL7SsCiOmKeSZPd1IYszU9I83ySOilhP4BHDvdlmqcENiQ7iVkhG3e6D29LjTiJULXHLD5Rzaqdw/BuP7boo/C5ESAj7CLKLY8NY9w1xKo0/8B6YKVHbrOPsDuz+IJVY04bJA9JbFEqtyTooX2jdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282131; c=relaxed/simple;
	bh=jQ3Yv56tfDvTB1wae18DcMCTgAjJ8TJZuFntXUjKvfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PfYB78ut15agSZXvJbZn1I6ThsJBZjIEmMmsVy6+X6PS3uNlILZAIQpYTfqk0YlbwWNGxich7NzQDBjPnN9LEzE5YXAT1mca2u0TPraG37b8C85/fPV1R9D4CarpPH5AteLmQLFGIMha41wkII7mSReqkQWYgkZTkLsRWwYWGd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=c7vklEiw; arc=fail smtp.client-ip=52.101.201.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="c7vklEiw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/Es6+CYyhCt9iQhFGYXm4n52m5NWSbFnzoakY3gPjiIRw15l4f6ifCL96lid4WOQoxreDZw3+DLfiS30dRq46Len0MvAtr/Czvtti8iq3dU+5Lv/ehGfDs6ctgfF/uYtDwLTsrNkNB9W37itwPmGxlsExfmhf1fowoZ8W03vdtRernWsj0Qs/MdcENw+OYHzP6evqRPZWXnM/9NIieEKI4cJQIr9wvfQo259AAOXX3mMCDOj8RXWBukIPvz8pulp4NNwk0Wh6COaYKnDqsouHraihjPm9BLAc4zLOWISUjSzuYrnnAgA//CyFbwnEZxX5FkKPjrZMglLyR+0AtE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kx33P4+gyAmCBqs9s2m58rmVu6WztP+QBDXS3qgUDDg=;
 b=G8bbltF+W6lVy7nhMBJZ1McF5V+Zwo0yRLfa6IHd2hTYlxt3zHmkmz6H8ZbvBowdYb9NJ5ZRiEor7r6/0rdTfykZVTYptdajqmJT4HkoPvJC2gvwqgn+nSpXnEMGW0tIfDOOcyy3ZdpNIb/IzkPHP2H/qZXkI+w3R76OKgOdt9kbajhCVYjqbyGVYd7rVG4aa3ZEJPYR8oukJpg3E07j3qR4FJK0QblhvC5A/KHJl0KO01Ycitr5DQztHGrRjTi790QwFngcTBJDTin38zGNgYWbVSqZDj+uWckWAYNBL5Iau7n4Ubgd3m3/khb8+aSWaNGDMRaI4u4lVjB1yEZ8Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kx33P4+gyAmCBqs9s2m58rmVu6WztP+QBDXS3qgUDDg=;
 b=c7vklEiwh30ejh9hjueNE+AbbZorjF1+kMYJhulK4NaOCmnxLCT2eXDySKt2FQ1y6gnfiJ8QjTlF2g0Wiamn38KU5v2DyN92v2YpPLZSF6pLubHRypiAskkeQ7IGDTDti1epjzQFsXb5Dg9LAFk0XQVK0RehHBv4qRR2VA456HKsG8SqqtpJmGXUPqDTx40TXUgs+BzRShCIJneGVQKLS/ZnsPQCJ+vMyhVspspE93BkXEVBGxEbvRjdTz7wvSqkb+y67i70WeXQwk8D3P7x9UZWoM6LqnoiLAXi3SFJTyUJ6eeaECT2G6OD9dH1xZFSHbiGkyFmavr5o+IJipv/NA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SA1PR03MB6593.namprd03.prod.outlook.com (2603:10b6:806:1c8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 06:22:05 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 06:22:05 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] arm64: dts: socfpga: agilex5: Add dma-coherent to XGMAC nodes
Date: Tue, 23 Jun 2026 23:22:03 -0700
Message-ID: <20260624062203.12221-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260624062203.12221-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260624062203.12221-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0115.namprd05.prod.outlook.com
 (2603:10b6:a03:334::30) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|SA1PR03MB6593:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d03abb-ce56-4b75-f497-08ded1b8e974
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|55112099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	0xbDJJnI9v99pULGFPCQOqiSGYaAaxBINji+XKuOWqixXbj0vwhxBouWsuRMGvTlM8JtxRWVDDTBLp/UibAyRSrOpk812/nbpWW/UJqy2wSD1ET1oILI6VEN7LUjxFauyWlWNqX2Aw0Esjx1Zqc8coUzSUt4WlYQP8+x3iKQkqTimD/mSiCAxZqpXVyWdPpC+C42qq7ftggNu16F8nwW9XrVbuqetiE37X3BwtLOew4CVaYOKEw7oyWu+oB66GVOBnGvRcJibOEw33Hn/sCLt1w4SXHCNwOUj323DzI2CLjKFkp7x0TaR7yS/lHyWeBu1yyVRlWUFWu0uUcK/E4zmKr1QP8CyavM8W2Wtc5+ABIxmjAnw9P2Ud4tUrTHhpsfYPeFHk5OYMjOdsov/QK8gZ5s9oiyqu1Pbv5WLko8jdv3CZ0UiM/uKC7D4/9JLnZeeMmBk0/RbzErIbDg21A4hy6x0p4DzeHpzF0VF/ENG/U/b990bre0VNqxtl9y2kywnzkpKao6Ndah+rUJvwiq5y4ZvCsrCIMCczYVRoYN4xxrz4bt5kMaXH5yzDyK+/SLGmyDyJ2EY4VzLLGyFa4O1wf9qnUkfCYMuD1KVVt0Xx6nh82uY8ZrCNDXSV2r946z6CiHnGmRyJ7dTe6n2iyn9Xt1Lg7QwIPu7xAAyKUmsts=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(55112099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qt3LKzgbKUXXjUcMI4LTVmt/Y1mhYGbyEg8+pb4WM7dWApd8zNPeXrNNRcvj?=
 =?us-ascii?Q?ShPVWimBhLHgE4sgla5g1Qkj1a/XojULo24O9M5XFqMbv4HtS+xcL+LKrXqx?=
 =?us-ascii?Q?4bPM0ZAqFsGGxbTPRZgv02hkZWwkwHV775CjOHCuonpgLvH/ykEK5mHHTY39?=
 =?us-ascii?Q?Qim4YV+pzN6kfKMdDkUvh5DZjmD/hIdCiwjUWAVp8OlU7eRg/HhB+OjaV/pH?=
 =?us-ascii?Q?0AIN3II/IHHgfl+1r9Wm2DW3dwZLN1+MNelOfyu2urVIxSLfE3TBIx7NJxGS?=
 =?us-ascii?Q?U7M5zEjRvvaRUJ1TK/H5zJgZpNa3JhJ31KHMA0Cj9ijYkemunMabUmZXpr77?=
 =?us-ascii?Q?3IeCI2bHV9owZji2ehR0IfRdiWD0/aNIBPgKM9fOLwT2htiR2SEf0QVQ1xig?=
 =?us-ascii?Q?PewA6eZCa0Jn0MyhN9PFztyrv2xxyUFQLxqDVZt5bDQUOpxzCmM/8kfmCqGs?=
 =?us-ascii?Q?XNXAxrzb4rogvwfKGDoP2acnEo4maGmgkfXTAgsu6XqASaCT4WDKWACPUteh?=
 =?us-ascii?Q?BhTMuIBOlNbPkZNy0VU5wd9tDCxiGn1YMh+LhrHS48oN/SVMgNajIrCswRgo?=
 =?us-ascii?Q?cAY/hSOtZCv0aX4VEGl7CpqNp79ozt/QMLLLotWEK3mP3AoGh0+IBGCH5zAY?=
 =?us-ascii?Q?jfBPDzQfLC6Us8U8DZEFtBW6a67zO2679X9vCVfVTjiAZuUr45Z9mwSm8qhK?=
 =?us-ascii?Q?YP2Ef711QlB3CXxEPS4CCRGXQb9j1QPihim4/xrOIE1G/caCkeXArIjXqnpx?=
 =?us-ascii?Q?/RInVJ6+YqNIyfBxD3H7rOsL13mmVsxtVkmuTay93uPOGk/ifh/JC4djUIBG?=
 =?us-ascii?Q?Kw5b44XAqCapyf4kvpRkCUPbR08ag0rM7W9M4/AWH3I/oRNPxzy4JRftJzvN?=
 =?us-ascii?Q?7a5q3T1cj5TQ/kzsV/iVMPCyGO2ZFckQSh0AJXZiTN/GgxBF0h8R93Q4NA8s?=
 =?us-ascii?Q?Rx/uMEipABRbjEdNOvpjMmr+ZJ4gFxEJySEJGUZDvY4Y7J57H6gwEbFXNqOR?=
 =?us-ascii?Q?Ksvc+1GYSQzmoi+MDVg6Yw9t3w9NtnjkjfmDcu4NHEUjaoaCn3NwZPT5pQtC?=
 =?us-ascii?Q?zuqMypeihg2k4vQ8EEFNVVELUBzLbD1YWWXemPwgftZbLARlJHTBnEg1nav/?=
 =?us-ascii?Q?77sQeSh3e/Lbw6DuGX8vQmyi3zSg182ljBB5ACIc/VCjUkXzpKwQG2U34uK9?=
 =?us-ascii?Q?BWdtHauQmzo3GGKkjS1VucjkU5ECSAKjuYWjoJcTugLXDIYKbooJ6CiGpw1O?=
 =?us-ascii?Q?F9vB7iTUV8hQ74Xct8HghpYMPNkxEJQreiuz1W4IUxyV1H60JMr2JvzVeB2g?=
 =?us-ascii?Q?xrUIKc9qoghS8Mh1TRJXER/gwPZfvZVIS8am467Lk/A/+ygUtYC9W3dXidRh?=
 =?us-ascii?Q?ZiT4bHVMlFHrjSJ7pSOx5IVLI3Rj/YQENMZcZMix5jQvKm+D8bdhT852id6k?=
 =?us-ascii?Q?jBMmZiEoGUfA/N7zTXORNNH30B276igzwAEGC0wUcUggnROWFqcyjksnC8d9?=
 =?us-ascii?Q?hOUVxO/0GvavbjSGY1V8CIPVIgm++JnxLZC8QSxq0pGOHtzjbTgISsYi/P6W?=
 =?us-ascii?Q?7ImfWmTAB/oHJX6fgmtWT+NQnfG40mVRnQTH26FoiMG/K7+V5xbTuVa+UpoQ?=
 =?us-ascii?Q?ESc9smFmcaI5pLJ5LjuYfT144ADpPajLIc9X+karN5SN/JB60v64a9bfnd3u?=
 =?us-ascii?Q?0v81h779aDF9vnFDHVkUlMjr1586uHjHT/IzpSNOe/keBQ3K9ZMtwSlh8tIz?=
 =?us-ascii?Q?WbKrf1xi3L+qb5wDCh6TjUBfgnixARZVyMKkD4WC9OflEGLohwml4FWp4hL/?=
X-MS-Exchange-AntiSpam-MessageData-1: wXs0KMese2FGBA==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d03abb-ce56-4b75-f497-08ded1b8e974
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 06:22:05.5399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LlDIkYbyweWIc6slckO/oK4KNxrWffzQqicPmo/7Ggpt93D1MB6Rp/MbIZn7Lj65U/y5V0DBpqQ0mfuah5GOZJ0tQRkbQsk2xJ8gosDXS7OZtyfRyz3i2d6XXlZxh4rRsVaXfl9asZyLnupnSPLMTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6593

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
index daa1f9e0d1f5..3822f06c2694 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -576,6 +576,7 @@ gmac0: ethernet@10810000 {
 			altr,sysmgr-syscon = <&sysmgr 0x44 0>;
 			snps,clk-csr = <0>;
 			iommus = <&smmu 1>;
+			dma-coherent;
 			status = "disabled";
 
 			stmmac_axi_emac0_setup: stmmac-axi-config {
@@ -689,6 +690,7 @@ gmac1: ethernet@10820000 {
 			altr,sysmgr-syscon = <&sysmgr 0x48 0>;
 			snps,clk-csr = <0>;
 			iommus = <&smmu 2>;
+			dma-coherent;
 			status = "disabled";
 
 			stmmac_axi_emac1_setup: stmmac-axi-config {
@@ -802,6 +804,7 @@ gmac2: ethernet@10830000 {
 			altr,sysmgr-syscon = <&sysmgr 0x4c 0>;
 			snps,clk-csr = <0>;
 			iommus = <&smmu 3>;
+			dma-coherent;
 			status = "disabled";
 
 			stmmac_axi_emac2_setup: stmmac-axi-config {
-- 
2.43.7

