Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011064.outbound.protection.outlook.com [40.107.208.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B8241D12B;
	Thu, 13 Aug 2026 06:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786602922; cv=fail; b=h4t/JkUPDQXRPJOmqctR6mYdxFfYEuqm8V2OAOYkRdWxpyOoySArdEg4RuV4nXlZCPtGQRP5AbVdY+pZh+1ajmuUfg+NvItk9wjmcC/AkODp7yYnm6jOjy51XBBAwHGH3TeOf1ehEY3p9ILwQrQEWySi4IBWbz1v35tYAvM8v30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786602922; c=relaxed/simple;
	bh=os5qyf0e6waoTyHecC4RXG1RE1RvCX1bpWFPFbXXkJU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H7gqT2fhWF9iJyeVsXF6aAKMaGF5tuy6ViSgbSxfJF0SKRmHuwz2ccXxMOF0HCXaBCwtUhxcFUtPASAIN/UW53W3I9mQ8OyUPXGzKG4KyMnjJivaZFo16emAums+LUH3g/NH9oZ7HRyh04o1pRFMIFQwLpLeZRee+UAiri+Xsy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=uigyBvqg; arc=fail smtp.client-ip=40.107.208.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="uigyBvqg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njD/ba8n1YixM/f4VZeQWlyDtgubq0R4sLFyjnLw+q9UMrAxXoo4uBN7BOGPoWoaBkcYjgxywLr52Cx4bKdGhAnbM4QrD3DVdAp6/hfRGZdwu81QGCxecXy1pg+Pz8hrq+SCEv1QSHA2EN7KX4qUluoXQgh/5caHw9cn/XLrgaFxnCan+YarWWFGzs4//76/AAjb5D0p7KG0SUhKvXt+CvQoFlFxwqOi/OS81dBZNJ+xgzShGvs5v972oJpgiPA0wmQ4q5iY3dwvLUZ7WctCcocmG/VeTFaG3bOV4LGqT2YN+2l6/QcAL4vkDas32fc0ahH30m9EEwoZoUped9ucjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCbKdPhBXGDGjV3yslQrAiOx/4iV3cV3PQ7bhLZes0o=;
 b=fImovqC5/v2oJ7kTMiYL0Xdw1fykvxfQb5WZmjzw0hgiotS64KXppiuMGtLAk23phGEzMYJef+eBBYjtMdp/F23YPZq/oHbKX5EwHpic2H68AektW0rjbTmKW3GmymH9e/L9m2ArqNz+gLMjNJV7umqrKwvVXpt6bi6yDcjVwJ2X0/38IrEoa4PFYunBf0Ick8RZrnGaS757xbocUPPWVNn7qk18QuBrFv5sKhxIoB8G4Q69QNJzExKpnNkIWlcHPfbsNVhXM4jCN0FHuG3q+5JF1d8dg8J2li/534dPNN9o4h95Fo/SvCJ8fo8P2SS5fYuF+42/PzlsWmsh/4jOsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCbKdPhBXGDGjV3yslQrAiOx/4iV3cV3PQ7bhLZes0o=;
 b=uigyBvqgQRLzNnZJnk+RSodMFO/BrUFAqiteqGQ/1zzweIEi0XN4EbO+ZP42Fzhh+6E8GQS18tN4PURj4hJignzzcAqnTEBlG7QlXwYF9QtQ9puoFBpOp7x81xITLTvS4OeWGRoNHSUbHXy5HlhKwU7vHcVeV5Msa6w8DhRsL9evxw8zJlTsM2uZ4RbolH6kTnOx6TarAtSwM1TX4qg2uWnVsApPinhmRaYbWmHvPnPKC/bm2BZNYh05VMn/0xMLSwsKNPXmD6FM98g6OgkbISE3z7CaQiBQM2DfpYIjqRonKsde/JWne3i8ZqcIRybL1n/iXA1RtNIIBxglpLWm/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DS7PR03MB8266.namprd03.prod.outlook.com (2603:10b6:8:26b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 06:35:15 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 06:35:15 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mahesh Rao <mahesh.rao@altera.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 3/4] dts: agilex: Add support for SDM mailbox interrupt for Intel Agilex SoC FPGA.
Date: Wed, 12 Aug 2026 23:35:09 -0700
Message-ID: <49385ba18b21ac928dca761f0311486a148dd45e.1786600929.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1786600929.git.tze.yee.ng@altera.com>
References: <cover.1786600929.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::18) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|DS7PR03MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc0ef5d-e01d-4d1f-e004-08def9050852
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|10067099003|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	pvtKsQOOPapclqcX3RDd04tPV3+V61OSm1QztShbkHenM2YY4G2XkAJHgFvBvlwGlOw4yiSPDvHB3AFIdn5plEuReQTHRuPB7UJ37Zt+7u/SVPJ3W5Yv3eVP1KyY8j9tsAZnOVUnZWXt5nxRJP94Zt6XBOW+eCIHr23CrH4zw+qKJbJy7D8zZDSPakXcsMIgd5xFzVDCua2ApWarWk1Hx10NfX/WzslMxFa6KcvjZrTJ5LOte1JYJBQCVNTz7tcBNVGAPuY0f2XRTu6yCCzJA+5DBhvN2cUqBMyCz9V/TwbJtjVieaQktotmDkeXreQKCjzZG/GdITu2yVhw249HQq/5SkfU29HZUqNnEfYlZCzHyl3KKHt+Te4Jt8LP0LylYHQz0DMLezmaLrCBmyljwIvYFkEq5ITlTlBr3tLSZ7jAMFu2szuFyLdkB+cRD/2FlXlG/Y4RAbXY8zq68mIcL9FVl1UncwNe2VvMpjI0EvuWGzk0tuP9IJvJWhTHaI0MvkNYdQ31hiaNrdoazKo1prWdwfR13fqrPvClR4tMVf0qZI1vwANctjAbuSj1tsU1vAdk5yavw3xwaPzqYU2twkxXbN5NT+xeq5CpjCzJwtNFvJIqolJjnFgNCRXjynpVkhkLU8VV6nF6MP+8Q7bpQoOfdIJ+ndstG3+PJXhQG2Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kjTefRLbhZiTUCKHSjhQvFcHVGccfE37bo7YDT2XIodaB2XGxyciVG/FkuVv?=
 =?us-ascii?Q?vEHcgs3ASq1tDfpXEglsXs8u0bRxg9Xemt1bEN3FECScFYpLnn3reIKvLer5?=
 =?us-ascii?Q?Yi1rJ7MHadh8hHymgdp++tQ/EtFc42B9HdXWJONFqGe0BTdZ/6K1qbrq3GUo?=
 =?us-ascii?Q?lKZXTp0luLEekccke3cFJPuI6X95zlJoeDzf3eKGEL+c8oU+2RELEe+2QAR6?=
 =?us-ascii?Q?jO92X3io3B8QrvUpWNPjZzG8GMzo7LV5E/2EOhVRLdy4e+iWkH9zC39Jao96?=
 =?us-ascii?Q?PylIfBLBBWwZOnnv/afQidcLD0/3HLz9hHg0F736mlZswB06t3qS4k1sT8pF?=
 =?us-ascii?Q?seVdSouPC7MqCZ/7tTZR9Hs5W+x4xwIspSuz/q7czkXD0iRA5jDk2ZV7TVou?=
 =?us-ascii?Q?P/v7K/knqYusflP+OjG2V6ZdvFqwXA4cBAS++ub1pOUcjC96KBdyYam1rWok?=
 =?us-ascii?Q?RmOjAq93KKS+M+20VUx9iUdT0daLpvwwgcAuc4Abo2RfVfZbuv8bz3P0mht4?=
 =?us-ascii?Q?uPCQCzlv2ANS5CohPvSFyn+niC4N3oeKGK58nftncvkytnSC6RU/zbvB2vHE?=
 =?us-ascii?Q?Id9OXDISUc8ZCERpmtO2Ga/XL076hsHm8ymh/OTO/M86flu/yEf4cebpNcX0?=
 =?us-ascii?Q?gDTgmAvSHuP/0Xy2UvGoiI4+R3nSfusamPrnw+yr5SDdfRer8wAlgDwvnWAy?=
 =?us-ascii?Q?Ig5zADtMxiZ5bgNmQ4Lr+0O3qb/CW+tND9DicGEJShVfIs2AzZtzL7dpbo5W?=
 =?us-ascii?Q?fpkj+PxPBTHQ7emrvSgfYMQ7PMOiBEVBR7mjc19izFXWSs6vlTPZYrP4Y9TN?=
 =?us-ascii?Q?sLIQnYwpMWyQKQcthSbAS+N91z8aq+sNjs28B4yEYMzUhVR73IkllZ+gDZsp?=
 =?us-ascii?Q?wEGfEb7Hgn+6DogdkZYkEi6SfXiB1berALMOWwKNSy50uPCZzDk5ZsjKRqT1?=
 =?us-ascii?Q?Z69YUrvGADBxQEd8Y40uixxisf4LNXaGOt3dPauVFrlZRlYDWL1Wp540b3TN?=
 =?us-ascii?Q?Wn74Gj5z6Gaffe+kVk0/5Ax6ZwfWGxfiSUtvDbuauRmgdUi5Ss16s+ONDe6p?=
 =?us-ascii?Q?okAudsYniTm3KFYFAoOPf9yBatTZOu7CemuNvRuVRjZ1ew6+UIMF4CUccMee?=
 =?us-ascii?Q?10DE56w5m2fF3GGrY6t25BBGGZ08zf+TNresUkyBme+859yZW38TVu+jwRSQ?=
 =?us-ascii?Q?wvZBDVO0UvHna7TaHAGKz/GjycVdVyHQoDShJy1DzImGlKoKKBELwJjVyr4d?=
 =?us-ascii?Q?nDUhb8dFO7sCgOV5eOjYr0ap6Vv8gBqqZOFWl/y/2sMg3X1Y9QvzIjpOft0H?=
 =?us-ascii?Q?3wlTzg30PYUsYhq6F47qGpcrgZ3/UDsTRqvEi5NJxQAKatU28l0qQ5I4gvB+?=
 =?us-ascii?Q?JkhMDSffgAsBhl6jDiVP3mWCXEiXHn6tNmESK6siQ8l81msLEDkXhcTJt+zG?=
 =?us-ascii?Q?4mMrRaja3iWlQGwHPb5V68/hI60iuawjNY+TVBAmzSZ9SgWw2EGXHYVFCfXf?=
 =?us-ascii?Q?wy8Bcv8gjfcpe9dJBoHnzgKJWGvynxobLL99J83VQOfrpRTfCA6snoRz/qZO?=
 =?us-ascii?Q?cvE1brIpozp55auPJklyTMlr5Ytg3g6zqCben3sQMX5ZcQjuRwYOlGCY5RGh?=
 =?us-ascii?Q?PxS/qgAQcGnDd6NTBrh8n7taU6pystxfZiCA/+5SoLNpGMXlUeOupWk0T2jC?=
 =?us-ascii?Q?Rih2lvUCUpUfmB1u5Sw0zMUtf+sKptSxuNZ360mIfFtnoU5lCflOW14y3RwT?=
 =?us-ascii?Q?KYMdO0KEcw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc0ef5d-e01d-4d1f-e004-08def9050852
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 06:35:14.5163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YD3mM6C3V0G5pA+sWxunklKNdk5yGcRQzlez851hhKATnNYfp1EteO9zoT97uhuhXqF3WrdZ/MTpNyNfwkM/HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8266

From: Mahesh Rao <mahesh.rao@altera.com>

Add support for Secure Device Manager (SDM) mailbox doorbell interrupt on
Agilex SoC FPGA for supporting asynchronous transactions.

Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v3:
- Reflow commit message body to ~75 columns (fix Dinh's comment in v2
  review)
- No functional change
- Drop Reviewed-by: Matthew Gerlach (no longer at Altera)
- Add Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 0dfbafde8822..3168449dcd3d 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -65,6 +65,8 @@ svc {
 			compatible = "intel,agilex-svc";
 			method = "smc";
 			memory-region = <&service_reserved>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&intc>;
 
 			fpga_mgr: fpga-mgr {
 				compatible = "intel,agilex-soc-fpga-mgr";
-- 
2.43.7

