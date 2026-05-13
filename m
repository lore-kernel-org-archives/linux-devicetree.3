Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011030.outbound.protection.outlook.com [52.101.57.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9428C36F919;
	Wed, 13 May 2026 08:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778659553; cv=fail; b=Hr6r5IK6r74gRoPRI1Ixg4UOO1p/SOgI6prjfSbk75ga3cyccKau+MTMZM0p9B/th2Fyskm70kf6u0CyoOpH26CpmtMqpuyU/nBnoB1c4Lo/qnRhid0RnE61lNF3oEzljeZqHANNMVxYTJk94CPYcwnHvetUDfhqcvrPvXwuq4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778659553; c=relaxed/simple;
	bh=I8i10/WyGnWcPRqWXSKqHO7OpnT48STqEbDfeEhn++Q=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QGgkf73/462MwbVOl3haky/062E05+ytiJ+60AZVqhF5QWkHBnj6Pnc3/h9QM9tCj1vtn3D953YJ4ZoGL8t96IaXh7VOMMIpLOCoVJJtjQuVFDcVgDe00r+zGWFe+sP++Rrg5beoVYhhQTo4IPriRRJbhxl+1gF1ZQ2TXoW40D4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=nupBb7dX; arc=fail smtp.client-ip=52.101.57.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="nupBb7dX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioVX58DIU7OU4Rts1i2P0itbZDnS61xOHp73nmzJax/Y7CsS975/bvUb8JjCbIIEjAXvOK2/jNDET5wwwTB1J4tpge5kYS2DDik55W6aiFP49Z+CdWJQSBLhEEk0gJTvupHtaFgJRRum1k1Xshg+cyzcb0vEj1JzJ57p/4IKtLvU0OyE7rx11dGonENuY+Z7NL2ttELM6WddXXXFqcl2Cblqlqm7IAWWIVhkSPZbxidm5gpz2rfQg0WPKqqZlm4x6vY/oBAvknrbwNjKRGqDhA/MqCl/2GONEFY48IYk/+2HvbLfHq1YmeBQMje44iMABPxyBfyG8oW9/TxjUrv2QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXskqdjmwJvE7WmMvgc3b8BWiAW3N/gi23WvM3qZnOI=;
 b=UaPtnnjf5Ic/ZeLe/hGGUP1Q6QIu0oI9slZDoTreH4lyZSuA5hA9Y5A1EYkfDGXDXut/SzmYYE4boDPx05V8+5Pcxr3nKEah9jKt1iuVRBtBL0mifhXCx6ka9R0ZBbwQKG+U3K5hKXr4YUyLy5osGLRRLJsbk/tmaXI/wEs4z7o9TvD/OcfZJ80fjsL8uQTgSupe9Jpr+0/0ArGCrKf/uq/54l4/8baqpGxR5RXfaGgGpj4m1zauQn7uIJqiMf1U4+h3hb99fAF2q/rZyPL62cepfPPmqsv1LSyWaaaxzQbffKGfqx7V94HfhShk1NwTAckkxgzUVAiAktKNrTgi8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXskqdjmwJvE7WmMvgc3b8BWiAW3N/gi23WvM3qZnOI=;
 b=nupBb7dXNtjinCVc6YVKpCaxcNrRFAI4AKthFf2vr7KcSb5mDUONie7Owkn+tNK46zPnvHo/pKDeX3D+228KoT4WupxV6EgUDZs8DIzkJ27IeoNUUZSMI5GGNnL4lt3iuVq9rIpSV3e9Dd//BQAabK+hAoW0PyKxm8+LBQtBp/Qs0Si/6Q1PE4NrscX7l/7B6m3uKgSQRfT/f20uE5VRxADTXmj2PvAL6iZLW4VVtCaHZle7KIlinwCe8QT8G4GDN9N0rbb2bsfcioYCnIKkczwgPCChr1i4bDkml9wCdCLuwyWB936Z0lNGZaYet8oeiwNBaEu/fJcUxWXEonNJLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by IA3PR03MB7595.namprd03.prod.outlook.com (2603:10b6:208:505::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 08:05:48 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%4]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 08:05:48 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: adrian.ho.yin.ng@altera.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com
Subject: [PATCH] arm64: dts: socfpga: use consistent QSPI boot partition label
Date: Wed, 13 May 2026 01:05:46 -0700
Message-ID: <eff34df0c67d39a26d20ec91eda8dd9e15f9f5cc.1778658884.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::35) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|IA3PR03MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: 762efc72-291c-4577-9a02-08deb0c670f4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|11063799003|18002099003|56012099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	SGEvFqp6PPSvmdV44pJsllvYeMkCriJaYXiZozuK6j+IclR4DkAegzn4/6JtUp2WxW2MdZXtv5OIJwtQWrwZKZ1ADacAiIV4PKMKRTuzYU406MY8fCkXIJtNU046tIKnAnNMK39Sv3xLucTs/i/7a3gtHU4z9JziAUBeG9vaOYg8FwEFdgjxB8/TTgQE0UtIwCv0QumNUAAGHqt/cjQI2s0hMzDg0Ol+Xu9k4MlGEFMs5mLXPm0c71uFs7qaq0+qYTF6bDT1BqlrVUBY1rd7QiEFBi90QOkNI0Km1EsbUL4KhOBfHZdiRdxbVvFlikMuRyl/82WnQsrhybAdRoSDysLlhLWud6LBj1z3gYwNz0xfiaAo/wW/wsf3XNFgiqgjmA2hkNJdOGQ/6rCuXH3/b53e5h+7TcWS3uF5wDoZQHFOJnh7s9yp3dQcOX0Li63iRAlLK0h1zjBRErpifErWNvhQsoCP3Axy/qXjV8MhvkTcGV+q1E9aYsf2oN5876CCde1gQlfSuCbw9ZZybdtCvT7NFB7S206Bv2PFwcdLh/hCkMf0z9ZTaNGP6dW3ZFfK0Cv92NxDqg+zhHVNx7Bgc9R/cuZ/4MellchSzwLAD7QOJvCh/LFQ3AZmMpNT6V3TdkT6yGKLdnmppz1HAdhxD3vJNUV+WpXIyng4Jv7mBZciRk93FPuKGViYkZUZQ7ju
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(11063799003)(18002099003)(56012099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tGc8YKRh78XcnTTqtDwp/9eDI/L030wVzWhSYLYVhIwe7tvZ9Pba1p+Hf0MH?=
 =?us-ascii?Q?FxEcEwOwDxxDPvf3VnS2LYFKL2WTq2n3SVZf660CMOHZxj6y4K56yZ2r+HMc?=
 =?us-ascii?Q?01+cG38scTF8BuaEHBiqCiuEUUa/JDju2uM65P8t9jhgNcjb6gRzkZ+diibz?=
 =?us-ascii?Q?o6ohv5Ah64v9JPNChdTS4v1qoae8VN0wMnDpGc/jsamwyyIccriMLvdJNFYA?=
 =?us-ascii?Q?8A76UAT47Nefyq0pbdsbJzjdeTSQLSF8zU9anCNuqvqVQHiMxcX7RLJYAQwE?=
 =?us-ascii?Q?XinO4FhvmREoSx80DWmze734hlkyCRdQB9FA/24qJYXOi72swzoclXCbyYFv?=
 =?us-ascii?Q?gxrsapEFqBNr7qGvuw/DTl+wjRXddg6muoUoPv0ytjuxUgnua1bNrZzHtZ2R?=
 =?us-ascii?Q?o6i9HZuHFT9CAXRRVcCFz7lAN+u2yk/OgEAl9Be82erJIR0aRsJiU9dKopCx?=
 =?us-ascii?Q?PzMGcZLKxEsl1+M1hRIY5w/+S6dwhNVxCTUlvAWHMaZ77eFQgtdY3OaY0QVu?=
 =?us-ascii?Q?0Fv63i+qXGXhx6zlxQY8Ww6nMQX2IbNy94+yy54PQ7CI711YtmEivDNQtkhq?=
 =?us-ascii?Q?mzzpO6f0mtEWz6AxV9x3xREQEjZImjlfL5s4uGrY4J2jO4M59waChqz4i++O?=
 =?us-ascii?Q?bmBRNxuHcP0xIjXotr+aQ1Lm8m9Bjxwzb3dNdTvwptfGpEtO4jXT75dCr6EJ?=
 =?us-ascii?Q?+g+jjavERaYf3zqM6x3z8nU9xarMNiJd6+qG2bgN9hzK81uw7hwIDG+W0CrH?=
 =?us-ascii?Q?PSmd+0/7BEhqeUgpZHj0GR+4hnW51LqDTx3wAqbTjgWXLKF+eYLSOWla1MAr?=
 =?us-ascii?Q?EtBVgY3h92ow73rCJYqrmfBbJq6HT3isf7NvL9qIn0I+bnfjzM42riIhlQl6?=
 =?us-ascii?Q?6NkxxEUwMVcJ2KN31XeItTUjmVwb/rzAVVcBk8MMPeK7gL9c36a3YvZwg6Pj?=
 =?us-ascii?Q?ZUDk2C3xxmAZU0V2udeOpfi5mw/O/n+xiDjW8jLbiPpXyYfMpjxMLDo6FOnV?=
 =?us-ascii?Q?EmVsF/aYptdk9PdZb7oFIXaGbUYNmD7MRUw6fHq9+Z0Z/ZqHbgwkQkqT0Q6C?=
 =?us-ascii?Q?f4b1GGjMM/249AofZwIm/MOpkcFi4i683I1soRj/bh2Zgrxz2h42w2siHZQq?=
 =?us-ascii?Q?j/Vp8TjXvr+k++fbpE7HgmhYKiSJRdPptbgcs+JaRwhEysHtZlwRWDvO+TFU?=
 =?us-ascii?Q?k6xQbS7/SkK3xkDNMUEVqO1IHWbjkZrR6EAu7fcw+LRXoN2cSZenO9EPdW3I?=
 =?us-ascii?Q?DsIuJ4mjdXnApjJV0XyfDA0nHz2NkrL+4kCSLOZ4Ydx4E8a1b0umFXsnkSgx?=
 =?us-ascii?Q?HhQzCDCoyK+KZWWXIWDvLlB3CZ19P2bnND/xUNrewC9QCvyKfRHMqysExtuN?=
 =?us-ascii?Q?mBaOVasPRGREOupjl6+pGJdbTsQQ9OyqdncZeJaD/JUvO5qHs+mA6PFU8PC4?=
 =?us-ascii?Q?lHoBYlMji0IiHzCUD1Llser0sos8ZLHVD9MsVou645bnwM7yjrxMpkvPLMwF?=
 =?us-ascii?Q?inFBmPf2F4kpnXSZCfE3KTUbwcyoNXrI2d5uo9aHF0L3I36uO1+ql+udX7wT?=
 =?us-ascii?Q?XavdHnoqGjt0ZCSmP/h1K60ACf1N6iBj6mQpdJxjeaN7upKfg1QCqnAUhYjp?=
 =?us-ascii?Q?Rl60E216Vp/IPBrPTSiLOcPsfqDut3D6oT/Y1drImH2WgeQuBxjjCjLLFGat?=
 =?us-ascii?Q?xXYjs2AC0sLkFSzU7eUUbgXPJ9ZfdHHrR7ss7ptjWMNuvGpE30eeE6SXyiEM?=
 =?us-ascii?Q?UYeFsLTLiw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 762efc72-291c-4577-9a02-08deb0c670f4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 08:05:47.9412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EkrMo2BNzucXW0fQ6XW7P0zmNGc5YTSg/k94r3/RabeRjYXnQ28J3OfqKrIO4hLWt/RFej3wqxgb1UuVMFC/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7595

From: Tze Yee Ng <tze.yee.ng@altera.com>

Several SoCFPGA board DTS files labeled the first QSPI MTD partition
(qspi_boot / partition@0 under fixed-partitions) as "u-boot" while
others already used "Boot and fpga data". Align the QSPI boot
partition label only so naming matches the combined boot + FPGA
image layout and stays consistent across Agilex, N5X, and Stratix 10
SoCDK variants.

No QSPI partition layout or reg properties are changed.

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts         | 2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts         | 2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts    | 2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
index 14b299f19f3a..f0a0964540a9 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
@@ -107,7 +107,7 @@ partitions {
 			#size-cells = <1>;
 
 			qspi_boot: partition@0 {
-				label = "u-boot";
+				label = "Boot and fpga data";
 				reg = <0x0 0x00c00000>;
 			};
 
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
index 262bb3e8e5c7..5ce825dd6afb 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -86,7 +86,7 @@ partitions {
 			#size-cells = <1>;
 
 			qspi_boot: partition@0 {
-				label = "u-boot";
+				label = "Boot and fpga data";
 				reg = <0x0 0x04200000>;
 			};
 
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
index f71e1280c778..63b4a3814131 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
@@ -101,7 +101,7 @@ partitions {
 			#size-cells = <1>;
 
 			qspi_boot: partition@0 {
-				label = "u-boot";
+				label = "Boot and fpga data";
 				reg = <0x0 0x00c00000>;
 			};
 
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
index 1831402d8808..23076fe8961f 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
@@ -84,7 +84,7 @@ partitions {
 			#size-cells = <1>;
 
 			qspi_boot: partition@0 {
-				label = "u-boot";
+				label = "Boot and fpga data";
 				reg = <0x0 0x04200000>;
 			};
 
-- 
2.43.7

