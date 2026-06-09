Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010063.outbound.protection.outlook.com [52.101.61.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E27623AB9D;
	Tue,  9 Jun 2026 13:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011009; cv=fail; b=e7HgiTN/YGAvGQfXDXLsDyWrVMoTW1j99y7lpDWWm+ii1JYBfHUgnQqdSoyNZ4Wzu5XkHWJOebBiH/UyU/ryl72GSy7Jh/3WN6pl3NHGbL8ysuEeIi+CMym4gZkOPHQ4kud6PMisBhygduLG6KHeeUzTBrUBCNumRaRI77kDP/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011009; c=relaxed/simple;
	bh=eMgPvEmodnNJ/fs+O/DdFyU9927nfu2JXMg/EFEqeA8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VRP8XxGhfMv52x+fTvSL+UbRkdT5ExayuRRQEE/TQKPvZn6lNgfPSLKjWYBr1aN9PXKJDciGw9regFLfOzJmLgYXzTGR4Dww6JVY94C/UfY9uC3pheA3LApKGmfKy7Hg/Js9+9NoTtxTJ74/eIB0Z6xMHZs3Fq5/UWP1RzD0z5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=HWmffMJu; arc=fail smtp.client-ip=52.101.61.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="HWmffMJu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOD+ssdj8kGlDe1Q28sv2asOjNSYwxblGjRwpOTutyuWNy970pAeTdIiBLpj4KXY/v2EyIJfEhQQwye3bFtC1vWKfgCnvOi0joIcEakvBaUH6Ync/mj2hC6jc9rISpQjmSJjR4Xmt2ttEkbgvhP1PPT1BVw3WG+GIbOiRwL+94hJCed1KwNtnmZhxgcccTw3zXFcMcb+gaUyYY6h4uK5tdgqr3WLR+oS0mTpD0dPwwRuKX7PZSMQpK4tynX/yj14cKq7TpWrWdnczP3uAjKolX7++vnwmlbY/X+F9yj4h5myR0D9NjchPQdfuPTXKJuUYJo8CKz8hbDQ/eu0Xf27cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZuZHc0RHDRVf0mcur7aNjrXUuFd2OPMk1epTYvgVMc=;
 b=Kz0AU1eY0TSwiuY0x6YDwiU0RygDtcs5QtglgdFf4Q1QNFQJBT0FiC9EgP2/YiWvfwhEUt/9FRB+RlcdbUhPKzeyRDjYzu3S/tUDfJxf0txzlNrkUjBcSpD8cWFpFEgqw9B7Sws54D07g00aNsRkTSCqmf4l8T/Dtr2xjv/4ktftWutJgtf71nf/sb6YzpnsUsGhJC2fhSg7MUxmjbpGkmvHRDUQ9TXOxa9Hxig1e91/T34MzFm4htZZw/72cIUZh6lw4EiB2I5kXIdrX1AgvweIkOgRTj1hhGHfGSSjMRX/ggqm6vyBCKooHRCN5vzECDfin5VjVaozCa/fkACoRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZuZHc0RHDRVf0mcur7aNjrXUuFd2OPMk1epTYvgVMc=;
 b=HWmffMJuimRYx/7th7n4UqfqPg8Nw9NxMlNZHBgCLDvP4pIyr4W2oROatWk57uTpEAWVSYPOPMAL1EiNi2un/D5LeSl6VqrUthD38RlrKnNwo2N2ObjIGWNfN3GK/jSCnMsndIGlHAWojUQkkYEAu1Eazec3X/WBDZWatq66F4f7LGkE8dt793Ya2dPTgh6p4KD75Fkm2WwyUZ28qVvJNxgz7B+Jcfq8uhxIXPuJ/3vUbjTGhdrpIb6vHXleIl5wPFqIFFFa9AzM5PBUg+ANuO7dDom8Nbegvf55BuNC/QnVT8KzaoUZWw0egZ2iZMYQM0NUJx71u+NAjbE01F/D7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SN7PR03MB7257.namprd03.prod.outlook.com (2603:10b6:806:2ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Tue, 9 Jun
 2026 13:16:43 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 13:16:43 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: socfpga: agilex5: Add per-channel interrupts to gmac0
Date: Tue,  9 Jun 2026 06:16:41 -0700
Message-ID: <20260609131641.28476-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0207.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::32) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|SN7PR03MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: f9326151-66e3-4e5d-3642-08dec629595e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|55112099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	+cRMr0f39FxBA3emFRSTAnwKFM1+fCqfqZYeFeeuN7+uubz26WMruJhPEULbrkQEx0i7TFQvJVIsJzoh/gexGhYV7B1TNiCvzk5Lb7f3hYNy5vURV4atJk3nc2hvGkthA2RrkjHCrlY5OH1Ip5Q0mOZXKT5vpMtJQCSG8wG8E+6rtI2hVXTWSVJHc6UEyg/KNBMZSemqc1Zh4xgaLiqGyQhlGytpsfaUCSYfgNQdJnwbZOpsnSBzVVT0sk0vqwEFctha5mKWNsUWWqxeGIhch0ZeNixpCYqt7zLUhigyXynJHBGeUAWX1Ysk9epqEkrOryvs+mFMk1J36UwChkIhWsCFYbxFvEKdQBnPZdMtcfCnwx8RfRHqa11BRt6dhxZsZVRU/IkkcXe3OZBhoTC8ei9eegJiba8lOnj3RgXsziWBX8e5HviOgDfp3WXgzufYtcqkWv9m84hXa0y7bw03EfL7biesFsEvOdVwMJ5+pI03gVXEk7HtLW6rsFCIKZTsLsC53rJuwvXlOMWbPd8N1AcQucxsfkvz/V8ixK3BYQ0JUgXbZ4zhZbu8Wp6WS5+LIa5e0t256YjS4PNSmvn3cAsabuc0x7RvN7JA9n2w+AaHjXcZk704RI2/phmb3xIx9mZ4fv00oQWcIkO6VQxRFGTiriqg4GfhUwS1mUpYRexxOScQHf+ZKtzcrtewCbQ8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(55112099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lxo652+4/xFY/G3+TamSWkHFef0ECHhLFH3X3QWbOPQXazoyGpoIlctjut3m?=
 =?us-ascii?Q?/sZ+M761Gv6HLr6SLCuT76bfqkih38KX1aaPLcXfmuaUiSAEO6PLfmLjpxUw?=
 =?us-ascii?Q?sGnLLwa+wan7OABd2cG3gp9TDCxlKLruZj3ZKcExvvJH91a35FbxRDMzjoP7?=
 =?us-ascii?Q?0Aer8zJ9vySCpJoZHEPgcVkTueWpaLqI9GFDKfrGWNHSVwSxVkq0VjwKLLiC?=
 =?us-ascii?Q?T7MOG5aobi5hk3Y9OLi4DxMd3UstL4AIccCTum6QNNkgzFdrslIk+ymQ2zK8?=
 =?us-ascii?Q?bWTr/g8pt7/uB/HdnGeVfpthOsknDJr7VNRWABl3hBn6Tkj5bOIZtUPLHADb?=
 =?us-ascii?Q?0YrZyxVYJD7gf+MxDhE79vWPwBZXzu5xjhPA2wo4eq/BDjPLTrzZcfnLLrF6?=
 =?us-ascii?Q?o1DqIPvxwrzpf/IZm5DKMNK4DtDCBIXTmXFZ8Sv5SWVb8a54PN7dqjW2zGA2?=
 =?us-ascii?Q?hQmEs9qblR45wyzIxEf+co5HCmu69akNxk1wSHTXm+2O4JCwyjEbJu40evRA?=
 =?us-ascii?Q?YgOoe9yY9IgXo0X/0gUX3cr0SuQ5SYn9AySorAn7w7R51yHMbRFktr2P86T9?=
 =?us-ascii?Q?fF7HZVHyqBkQ6Txz0muye/275RABHmqeJqGw3P6/d+Hg6CzGtehyx6UWT3K+?=
 =?us-ascii?Q?N1bjfw4QHuubu7uBwzoTsb0/PofnaOghXStY0nFQgF9HXbYx9ki4m7QLhpVH?=
 =?us-ascii?Q?pjYzEzuvQgi2RLUHFBD4C4dc3aoXZYE6PRUDNalMAIecmHFnutDj3Sb59+St?=
 =?us-ascii?Q?hWPoM2W265b6LGSJT/Ji+FjkUyt20C7yTMNMcD7yGlNTD6X7G9n2Ht63wTFO?=
 =?us-ascii?Q?kFk91G9jqtSVmcKWhNEXADjdWd/TNCEeFx2o+8smTvqpabjob2hAktjVCwdT?=
 =?us-ascii?Q?tWoQVmDc5Bxib74ri+z4MiXZ1/s57LPun/uBzPESS5fAAMUuPT2SiQT+YiQw?=
 =?us-ascii?Q?/Wu5HPfukhpG74yMKVBPScowZZCurieH3MvJs+hXwKZepLvNm4zFNE5qDyXV?=
 =?us-ascii?Q?wHgt7na9RknwU9lVpCT1wSIgcO0TxDXlw8wIvSmSqPrwKQ23pZ/MGKudBP88?=
 =?us-ascii?Q?Mnxg7A0rowFNZO/jIb4jbtHnzvpVJ15wj3045VWNCb1F5prQR2CzmBEMt7ic?=
 =?us-ascii?Q?EUuw80Ke2wT0QXRFENg9b+ZBZK+9cWQJwmsMUTsFEY0mIqw/ZMLG3IPp9hW/?=
 =?us-ascii?Q?6mFUDKRuVhExmV3hPjxCQK2V6VAp4VtA0N77r8ZkjkzcXzTp6f477E84pme9?=
 =?us-ascii?Q?0Uv55TqXCaQZkDnAYDivT9a7gnLRERTad3MCl1vz7ofJuW01ON8yHpYlYd7k?=
 =?us-ascii?Q?fF26TJrSN7Hgh9JJR3IEcdqmx3FS8T5cW0Kz+ks3/bz8jJW7y7sRRBoSZ33n?=
 =?us-ascii?Q?VR/onMRyp6RfgRAkFuVO3nena1kwsUahFTZ+yp/TV1JIKyYDHyR7xARZKAdt?=
 =?us-ascii?Q?39JnzuF7WKI4xLOsQrLYWi8pQtK4sijzoZPYrD+8eUxz3mfyvlJbC+HFD+rF?=
 =?us-ascii?Q?2+q+oIUaXZzl7awMWW6P2nCUsDiubuZaH3We6lBsYtaDzjJzlNXNbWU2hSeG?=
 =?us-ascii?Q?I+5RkeCuQFqpoaWElSI28O/VJE8SAToiDdwTxLgO2WEga8kCaTFZV/yXg491?=
 =?us-ascii?Q?DUUSnE//pCsH2r3dtEWI/IvdsITr+MSBhJGl2fgjE/TOTxjqN8SUFz9aVq5U?=
 =?us-ascii?Q?BrfW6FFYm+QmbZ/OiMsBoJEorcf3kevTjOb8TQmPGpXgsYp9yLw+9+Szbaxh?=
 =?us-ascii?Q?8UCffoOhFk3QwvCsaTBLEGtiY+0wWTbxrw2LZWe8wz378991T95+0LKRDzXp?=
X-MS-Exchange-AntiSpam-MessageData-1: JHVZM8FgJVTRLA==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9326151-66e3-4e5d-3642-08dec629595e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 13:16:43.0433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGO4ywyKuLgFkvc16pL6tTCdpwB8I9g+Yr4FvCeV6FRax8y7nC8mvZg/RJW2oPFKfT0wVCZ4USgn5+SVdybeECVANsx+5Gk9IL0TdQl4vQd6pZCm2bO5wXNzC/o4mdib3PDh/2ow1zVqrWJ+pdN+8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7257

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Extend the gmac0 interrupt list to support 8 TX and 8 RX per-channel
interrupts in addition to the combined macirq, enabling per-channel
interrupt handling for improved DMA performance.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi | 36 +++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index b06c6d5d60ee..c936f8db1bd0 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -557,8 +557,40 @@ gmac0: ethernet@10810000 {
 			compatible = "altr,socfpga-stmmac-agilex5",
 				     "snps,dwxgmac-2.10";
 			reg = <0x10810000 0x3500>;
-			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "macirq";
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq",
+					  "tx-queue-0",
+					  "tx-queue-1",
+					  "tx-queue-2",
+					  "tx-queue-3",
+					  "tx-queue-4",
+					  "tx-queue-5",
+					  "tx-queue-6",
+					  "tx-queue-7",
+					  "rx-queue-0",
+					  "rx-queue-1",
+					  "rx-queue-2",
+					  "rx-queue-3",
+					  "rx-queue-4",
+					  "rx-queue-5",
+					  "rx-queue-6",
+					  "rx-queue-7";
 			resets = <&rst EMAC0_RESET>, <&rst EMAC0_OCP_RESET>;
 			reset-names = "stmmaceth", "ahb";
 			clocks = <&clkmgr AGILEX5_EMAC0_CLK>,
-- 
2.43.7

