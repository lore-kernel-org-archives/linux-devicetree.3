Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012003.outbound.protection.outlook.com [40.107.200.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D3A3A1A27;
	Mon, 22 Jun 2026 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136217; cv=fail; b=qZ/CYSBYfvqx1PggdM0NZf996Md9KxvwSBrlq5lrMTCwYm7Wq4wSawK2Os1JQorhQv5WVW49UTxPyu/k0NAROOV7RUvlvodBvCWsCTPQZ/XiicR3wO8KuOM3rXzaR8wYvAeh6DLr04h6hqdYuErDoKHL13aEkpozpYpsTlGjAXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136217; c=relaxed/simple;
	bh=keP/y+5tEalxTE4JoTyrhCMjWzVVSc9BJQQ8HWHmmfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EkYLMD7l2SBFxqCuIsHUBIqqS9YGZtcJR3hCu39/76rM1+ki3P9cGuH3mPDR6oIQS/qB4fO7Ft5kAdAeMlqoSyjNWFSSEOUGFwuFhQZrcoQCDnqnIXdSqTZaxzizeUqJSmOG8ZXEpYVsQfsS/hdPQnw0fNOlvB9Dt0H0GM/ngRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=KYU3/YSb; arc=fail smtp.client-ip=40.107.200.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="KYU3/YSb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TW2nxdTjnlgDHifqxUY3kqr5Zkfg9Pe7dpKECHj0i//gZbmF/HuITig8ieWt6k24xjlUnkZW2cLpq9j27/8TmETJ/vaiEH+IUZ/SWmWXCjckd/LaZR3SJwFos0Ql9naNkqNHnjrGHNZzWBlj/fxBBtCNcblNbDCU2ltqQ1QzcyCilO7oVBRyanBLH2w7cIsdB16G7lhpj8sbw0lK5GwgdVhE6b1CKSuUBgJNb9v7Sd+yPIbO6cNru4rwuiW5S+yXEWXx8bkqk0wlsEbim27c/s5SfRizheYZH4R9r6FAtjTCn+vyqP8ExY/IjUduP7qxutW6tajijNbFghqSSvGPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhYnf36RT4sPsLORX78YhJPbGltqYnC9EUG60NjTyBg=;
 b=lrzdXSJNJtgC2fgNaKE1d+5p04fpddH0iBBOLwp2XlkHt9I0G6Lb3TKjjMTcfhDcZE9dOBLnAtg+Z+eN3tkRoopnzWbkHsppBezeitu13Nc2EJZ1d5D8UNzG/s9thYoiIXWsdotf/QlmtcJsU0z0k43DnJaG8qSylqWNXMfrWClVZeW6NUvMEbu/1UqSPE4UAvEo8JVC0VEimcVFsqIZFsl2M62XjDSEpRKkzLR/RsULhQ5vSlXj3N72fdV5K8S54VFblD/FBlv5fkv4LsyWXhJvs2PMj68dnvKOdnpLuE2ys1kuSYuA5XD9gKWby0EUlCZyiVxYEtWOHJ9kffv+0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhYnf36RT4sPsLORX78YhJPbGltqYnC9EUG60NjTyBg=;
 b=KYU3/YSb//bSuHmqmmTGzjjA4V9cWCKO0oadoX0Lpyc2dodTTU9EA71k6Cmo6SoF6PGWuApJNevBfqCGDOjom2VCfvQc+StIjm8DBq9xb5usM9zE66eK2xIqjClf/AmQ97k4v5IOOsdnq1M5y/ktPEz9tKbTOdnqAftS8bQr4A1c0l/kbaw8MQ/0SFAsmBKSXl6zNzPaUT+9kGKCSdmO7HqFPqpjhcZeX41GXkeI3dGvgvDl3T8yF5D3RyLudh0OdhtDcfNNVqjLC0DuGU7wQPDJVKz+ORVD9oW2kibUeYRr+xkQMQYRQBxuvAePXDSuTRwhTbixdgLmkcmgzPx4gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CH8PR03MB8225.namprd03.prod.outlook.com (2603:10b6:610:2c3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 13:50:12 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 13:50:12 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH 1/2] arm64: dts: socfpga: agilex5: add FPGA manager and region nodes
Date: Mon, 22 Jun 2026 21:44:45 +0800
Message-ID: <c1210302cb5dd630dfb5d98b7e0920fb38837822.1782135785.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1782135785.git.adrian.ho.yin.ng@altera.com>
References: <cover.1782135785.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::12) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CH8PR03MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: f8eb9ab7-4b79-4072-ebf8-08ded0652e1e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|55112099003|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	G/0Dqbcj28hstLjgHHGTnGXB7bgPBsIsRPK9XMKYiASQsqwp+eLeQnEy3aemivt4FHRoT3i2VJvf+8SQCATVBQI27eeqDxUnEBiptIhPzF5ob1q/pk/7RLTp+aLKg8itDlfEZL71nteQ6/5WfxD6hIK+oiuSvoIV9rTMI9rmDY4DluIXLm4PvKBsyqtdPSq0P1XGG/6j5pF2YFVvbNKFLQ95O+W/ah9X75ykcUofZRLCQsGHf29f/dCQ4xDw547kKcRM5xrGm3jL2ZpwG8JapFITgsFVjZ64ISdWP4tkMA3/DMrfrKfmqGFir91cnt8FTUeYzr+UVgnPi/SoZph8vmqg3fQ8DP3M/rUQF2uUzRp9y3FBFx+6aYLKE2lNj+tO0VpZ/XzLQ9tBYNXtvqy4M//cDo3QSvqDN5roKoYTf/ILPp81JvfUkwytRHnf5UrT29u552dmNsk2EAdwcFmYPXr2QwH94b3jl8JsYUaigMDw7u8qlkLsNiEwPorIFZ+hwSLqxwwjRJ1in74n20Nk/o5Aufs0IA5MyfFTC048amLWhapRxdClEI5zo7/HAkTk9l2EpSN9idc6EdeBwK7B/PfQuFJiv4JMOeBcFBsAPDNMM+1v8clHoFaGhAH4Nm2eu8nP9NapEPJvuAEpWZjuC3qryCtAsNolsy7iWfx62n8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(55112099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7PXb2vjNHwV3Tt1aNLtBhZu5QgHBmMNVBOHoeZXnyPE85UGqclHbub5/ksYd?=
 =?us-ascii?Q?5Vrfwhddbyf6EMnM5HkPLbjev3ucoA6wLsSQE69XiXKH8DqL+vIGKEIEMTIq?=
 =?us-ascii?Q?DRUdgf8JS7U4N24nX4GOpaBgSh4OKKFRuqObmsBf0nrazYcbeO4vSIjW1rYG?=
 =?us-ascii?Q?rcT2CVNMFGaBCQsjCjRk9JnCpL/yybazU070Zjobzz/ZxwlkIEYapoLbqa2L?=
 =?us-ascii?Q?yzOHo71vQIDr87ZXe5cch5a4jkMvwKvkt/QPPQP1uoHQf6PKqFcjJPaUMJRT?=
 =?us-ascii?Q?XNHVFp+FUhKIcbrnhVdOYPXlEdjNFly+iovFiNE6odt9OxU2BPb93zC15SZz?=
 =?us-ascii?Q?WpJYWu1eQMgMXDMl6pELWIfzGx1OUOohl7mBi1HLk65+odfQB6doFS98QowH?=
 =?us-ascii?Q?jbm84bpnPbjrLAYf2nDm9gaLp2orS17j2vV4TLd+FTTj1fKkIJgB5NCkTS/f?=
 =?us-ascii?Q?ztdl0uISfDIzMRGd80aIPxwUp739dYdTUGwvOHnOU2p4YYt2fqA6770q3ZPC?=
 =?us-ascii?Q?uKrc9VdpN0AZRYrqW67qjht7yYZtoZL+loNooYpi9Q6A84RpUzQSTq7dvVTy?=
 =?us-ascii?Q?9ZUX43zIKkUom3UkBK+qz3RU5ffk+t7T6ZsDhimykAcFuU0WdP9ri3NmsNTB?=
 =?us-ascii?Q?V11jzQbLZwtvBvgygh0uTC5vXezI0+dVwONqZIYfWJ9rLTWBdeET0LXYUX9H?=
 =?us-ascii?Q?ZujWJuCLTa5WSPmYlScKbvy6d/tFiWbVHl7MYEsCanxBx4sweqVausU+wudm?=
 =?us-ascii?Q?05rF8nEFe4oKy5cLIfs4z/5HIGHFe8E61FEDlzg5x1rRAZLSyBOwzH5geACv?=
 =?us-ascii?Q?lzItlEaXZDQ1Ti2fG4y5v5m8tcE1Ppa7TLP+oLghhYaQPYzSq9oj59EqJB1S?=
 =?us-ascii?Q?aaj1TqLrcOhj9aWFOMifu7tTvt0thjCOdeLn67XyWC5rcHlhPrGyQouWI/9O?=
 =?us-ascii?Q?U1gV/yChiQAf+toY85B4xjtMQePt1Wy5l74vs8vYjsM4GzMbiBI9yxuQMFbX?=
 =?us-ascii?Q?YTdWB5vy8d3m47EVN/f9w/82K0zbx8PjxrF1ytcpPTxbvbPQh3UArph1Kp8x?=
 =?us-ascii?Q?wab24QFihK830o7E58uUwpw+CoiwuH9zhkecKBuTdWNuTEAsKy2vM3iNf9jV?=
 =?us-ascii?Q?iuCry1Jag38LQSxYpcWe/EBkBMn071UpH5cklqbJ9YM4hvkPSWqCTRGXiksR?=
 =?us-ascii?Q?EKtiwT50P8NtNd6Q0w06ZhryySPOh7vLsZ3bxtBYHIq5LIt3DQ8Gb2MrQXU7?=
 =?us-ascii?Q?moYm+NoGO7tjEXraSAdBZ4I9u11HjG5lfA7srbTwALbng1/rcLEypDFqNvQE?=
 =?us-ascii?Q?sX0R49LknmeffkSlcSG/iiPDQQn62E8sX8KYd79i1712wU9yzDiQGVBpcv17?=
 =?us-ascii?Q?b2vZwd2e9x13sEUblMGmKP02CwLrvPoMjpewtRS2FjiyznZT5OsmsCWw2Knc?=
 =?us-ascii?Q?4mdrNg6Spm4khXFGj7E4o+bFYKxXHswu3136c8ZMpa09CT5sQ03THsy0xycU?=
 =?us-ascii?Q?s5EXxryFKbePR59rCifQJN4L35KAj4HKh9UCI/HR617tpz913pQZp9XOFzLu?=
 =?us-ascii?Q?4K5jjCkVYLL2G/kj5xLiOY71ftiW6YO42a1a7FGsxARDsPRNlbS5JaL3LXLF?=
 =?us-ascii?Q?0pWZxZMjjFcqm1JlllQg7VxTg9ShClzSyJHysqUVDknTf2RrLPcboFdXDkWv?=
 =?us-ascii?Q?kQa1K3bdQ77PDoDQba/jvEyX9da3GTDPa9N7QCaKNxl+kbFQuc+176LyDKWA?=
 =?us-ascii?Q?uMC7o50KLNqLMtpI57dCPcdy+a94xZE=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8eb9ab7-4b79-4072-ebf8-08ded0652e1e
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:50:12.0369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egs+kYs5XVnXI90uKWTsJyhb/aOMtxYbIu/eBh3ZTFecTJ0N1GaozDier1CAq3XOE8oxY0CTZoHrs3Ys9cPSPur4HBHBHojPmhZSm5zlRfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8225

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

