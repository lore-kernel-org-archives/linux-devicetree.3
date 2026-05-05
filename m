Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010068.outbound.protection.outlook.com [52.101.61.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D7F3C140E;
	Tue,  5 May 2026 05:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777958378; cv=fail; b=cP7fjTOWpxP7TBTMjFPzbMW3zRIZnKow9KlcW3oAwxRZjLqhshX/57sQDi+O6Ge1QIwLTpi/X14kiuySsQz8JBAjoOCEIU1nunpjQ+Wkt8BrxldGNdinZCSyTlWRQ9rHfoICy5+3wDigTXvfPh6kguwfsCutVSPgM9r94N6di6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777958378; c=relaxed/simple;
	bh=LNZb29Z11V23Z9GXmwR1TFgfWWEmYSvHcN1M85C9Xwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YSeQvESugVGQH9NYquaSmWeeWJNo+XyaInWceo44Fk7l7ujbiVVpszipe1MrXgL9IznhUV76Qr8tO8Ie1MES1wO9SouRz4WouJk20StTa0tNYQFJVf1ZZxwe+9dGH0rxSRGWw7MFsNBqNcPXhaQ8WxNtD5Vh+HY6q1Fn2Mo155w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Vo2eisfX; arc=fail smtp.client-ip=52.101.61.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Vo2eisfX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jp9XZ7ok4SjpJspSdxIwomaGF3zAbiQAim4aYzLMHHQy9e174MRNKeC3flmmjPxdZMH5DAJqapzYeE/uDYxuHgo9RuWJ2NHYjmScfAom7WHjwkYhNwn0l2TOEbJ3rrNuTsMt3r99zpY9GH3vfJCkSDfveeyJVyi0oKZyb+bH7wlhz0cIUdYK2S9byQExL9RNyNKKt/YOljnLSp/lMvBFF8ZvMNizJVcP4p9ICusdoJQ69/7qwM/AXOtJzW5Oi0zmK4Fj6yGPldfNyt/3dvUHWuEkdQDvvUaAxj7nNRyBDB2jDF0MGQM3xQjcm9O2IP+cI62F80OkhBzXEWv/xKR0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HO3+lUnL1oC37H5l+HQU+ytsNrdLba6PHtws+tGd3Xk=;
 b=xxe02UIiyKatKu0mo6XJStqanCmGy7YSc3yRno+7rsJGtsxH2YCbxCJtpR7B1r5D7gNqP7TZZRu0CT3hT0ZMXNnaiThA7AOes2cO8p9Dv7jtjQqG0DCVCWNy2cX5Qs72ZtwfaKRMcrHs0gfUoUh7pyOE0ap8T8Iz2prLG5EFwGGeIFu3hjM3rKgeJN13sI0UqwUEAi6C1yW9A4bVzwke+80SKBiBaWqsb0DJw/FDtHJNxLmeb8esEktuqHJ33PSvUryyYGqVtGxyay3StJiSFhQ8QCXnz1JLqYkLa1etiqh5r1yH8MLrda+xgdapEfsI4WJ9jTNdC21ax2XpgayeNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HO3+lUnL1oC37H5l+HQU+ytsNrdLba6PHtws+tGd3Xk=;
 b=Vo2eisfXfSjoC7F1+AxXe7YPbp7nJjauC1pX524M5YbalKnPfaqee4N/u9z5/PW18rteNrWW5MzP8fg2FfwdW8829lCRXcp1HxGRV0KFItqaz4dLPoF04vtIUHGMKsvKXtGi2m+WYJLNJ2RK5YnbN+WZrm7eTBFYn+wqS6uxQBO9/wPN1HTfHkDu/pBO/XqP5PKZAOk+XnYe4ND+kby973p21WlyFvcp7dA4V4yyWjFf2S6w0MzGeznVjhm3eqLEfxaFzk6T+ItMXQkvGfUUG8XlpanPLB44v/II4AROKrwAp8/xSYiA10gPzWqLwX5Nyjp47U86+omrDIeaS8ze7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 IA3PR03MB7620.namprd03.prod.outlook.com (2603:10b6:208:50d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 05:19:33 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 05:19:33 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 2/2] arm64: dts: socfpga: agilex3: set alias for i3c controller
Date: Tue,  5 May 2026 13:15:17 +0800
Message-ID: <073d9354c89ca6d4de46439ce52b6ef33802e853.1777957556.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1777957556.git.adrian.ho.yin.ng@altera.com>
References: <cover.1777957556.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::24) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|IA3PR03MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eb147c0-ec0f-4666-0ab0-08deaa65e437
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	Sb9anfBUB+BpZzoMWbs2o/NagEj7zqzcWSp07lsFkJI3cvtbpQ0fkfqFgCl1g7s0Hob3v7q8eBYi2lPB0AcpVszdhRvk+KrMmKiyxZnJenslMzSm2aE8e0OCHOUKKv23Pes93P7ZFJKO9vLi4nImSaDVlK0MxP5kT7JFzVbbETGt3UNi/SV18CWlJzPc9ppQ+LiJE+YHzfIPsULZOcP0ZeHxIA0Ombl45wG0yHCEz6Y72mn5UP2BhTC+qkDHCKv6OEFvHW26JD1rtpKZSHQi0/Rw8uGDB5zJfrLJDjfrvtVE5fPmjEt7DisC1uy0xhojLqF5HDQSivDLpEU/1ctDF7QWOtKeSwrf/1W0ikzQaAyXaddxb6vawibxI3DcTwkMFS0N58RVxOEbrIKHGwtwzpdgIWfxvpYkUuWqMJHaEcQ2Ps2aQ/Yot9kWAeolit/FMF7qN+Dc/oFLF/ms3HocB+AI0l69uwniPqHpX54yESYf3jPXsCN55xE60fK0cv1bZ47PgCHjCneLG1JX7jFwhUvIs4301LW3BoHogmYe1SdgmP9LcWYwp58o4O/M5S0n02UQQke652mrzxnomub8Ix2+2QwJNgLjzC8fKHxi3Ns8jWEJGbLbu+Q8Gs3frNVUSkCf9NbQRP/Pw2aQO/ACQKJduwFAeMoJ3GoP0cTCBoL4sEq4921X++ZM80QbaT9i
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4QQN+RC7sTl7IOtx/tYTK5u1M6yNsdbBFQGhf4ynCRjPmDYKDy3gWO+kpURz?=
 =?us-ascii?Q?3GgL/WF/caH3lFIH0wPxA2llxxWjk3nPVv7BAqamjuo+kK1PHqoga8SCvr++?=
 =?us-ascii?Q?yBOx2WPG5rKY1JAJoFrcDRRZ9aZ+mJ47cxhuYO6xBYZX7Fs/uaqjma5c6Qbu?=
 =?us-ascii?Q?9Gr/S6fow5rHrF8s14t6U4iYmrTYvCGrx5t2jV//JOrk7ULJWrnqm5iY4DMW?=
 =?us-ascii?Q?RGDIC8Vb4R/ZLPB2Xe1UqmuOwl259ZM8SPaJZFLCTV66YhaIxZhQtlOAWqST?=
 =?us-ascii?Q?LNTSK0TKifgA3pUZgJYX8D5cpaXBPq0yekGq1/GQXP8BtnNnYnLLkTC7ZWMs?=
 =?us-ascii?Q?ekpvr1PoSBHZfLz8+Nvk0L2DYw+nRiK0rxmFgahb+z9TRL3o8qysE5t4jYN+?=
 =?us-ascii?Q?FrWs1cybInaB0d+NtGFS1v2hKU3QzxqicduRS9Gurw8/Z0s1MOzR72vsTu7g?=
 =?us-ascii?Q?vmUGyMJHFdBgyw1rS3iQ5cUBOHtLM68mDqsEOeXy9dK+hVfu0Hm29B37HecC?=
 =?us-ascii?Q?amcw7WPquyAzuWHCttperXXtHF52hgRkayjlPk3KEe9UcmqLqDuwokQ2srUq?=
 =?us-ascii?Q?aVVxXJ1WPtfOtI6Bln6o4kUofxp87o/8emwMe5vHnduWMBRkGUAMa6d1pJc8?=
 =?us-ascii?Q?dQGat409LRx8Y821BlKNxLMEOrruKaCzeZ+fkZ5feqEJiHDcKJBDsGvEQ/gf?=
 =?us-ascii?Q?IM6fk6A9pl1WmoM9q/Y8eOUl4e+5IOyFjd8Geer8Uft4cJtO5E73aKVsgW/R?=
 =?us-ascii?Q?HykToItI/boVYAMDsLoeC9chEGG61u0M96uP4VAlbTI7PUCT33kxb528FuoZ?=
 =?us-ascii?Q?dlglkhrB8nxx3MEs0IvaPqPAAVMXklFncHlDZyk7z91qQXUzgslQncDcnr54?=
 =?us-ascii?Q?fYbJOHe3Lv86dgvmdxyIfvKoFh/X1KzBRo+hsH4jNjfkSoe2C5v/deGqc8th?=
 =?us-ascii?Q?2nLW9ICuwwAQ0hNJa63MNlo2+Li3dMtT5hn3iQN9zmxvGmZ+Fl8Rgvd9ng4Y?=
 =?us-ascii?Q?cTpBWznL2RKRjrGnfIau05xFSxfe1bojSM8TzScKWjPS+lD3X/j0y6qbTNqE?=
 =?us-ascii?Q?2OccSoIXx4GOX89E6DmYzwaY14CfNwuUC2QJYakuu4VHV1xUrCZVpjTnzjtW?=
 =?us-ascii?Q?LPivVGp8aeEYKAKm0u9Ju23f0qnlDJ38aFhqCZMHYmq4NCLqBVmZn3XaqYWH?=
 =?us-ascii?Q?1wXDFKQhrkMMiETl+89ZQnO2mKDhpI1M/1P2sW5kYU8IfFgUquPw+qKe0yvm?=
 =?us-ascii?Q?g/E0jSXZBtZCOS98WVwwS7Uoq4AjR7Br1X6uE0Y/DFkR4q5rjiehp9DB0Dur?=
 =?us-ascii?Q?BL+diZuJj2pMH1E8KWfyIBdmzsBXegWoA3SJtMCOUtrXiiDdxhHjnvC/rK7h?=
 =?us-ascii?Q?XjSlR0qJZOgVnLMBynzjZTNDHxGx+SjAF475qM58T2zLVYko+2ms/Ln04yLV?=
 =?us-ascii?Q?JG8XsHOrgfhBIoCi0cvaHo7ht75N1DIxZhyoGkGbh1GbMFbgAMRJBr4IQQgG?=
 =?us-ascii?Q?Ld1Stuo3+hNgNC/FNossxiIqZBDdg9/pIjU7fwQWogtz+lsmeh6BElNoeLMl?=
 =?us-ascii?Q?h0vNQmQLylKSuMQm1Su9cGBTR7Mu28TzonRL11mXoh5SrJRU3Pjm/+MDFXts?=
 =?us-ascii?Q?/ZmbtC7K24PuCdQgOe+8U+fiZPDF2a6evkaCd7HVlZ2/LsQUCDKxNAjEQBQe?=
 =?us-ascii?Q?DLLp/mTUunH5wgj8Un7u7+NL6JYubjbvSZFBVnqIxBaIBnhU5w4STZgm/OkT?=
 =?us-ascii?Q?QTmB9Jk2kv6VdyUg50Rzdq3HS2friYw=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb147c0-ec0f-4666-0ab0-08deaa65e437
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 05:19:33.3343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMRxYeWutlbupoRxzQvq9BhaQrPsxOw/0SsPqmapIVUH5c/V1zCEG740VIqVXmOBuHNFDcfMkMsl4HUmdjAX92pTWulPjcEDuX38RqbJtEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7620

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Agilex3 SoCFPGA have 2 i3c controllers, a main master and a secondary
master. Setting the alias for both i3c controllers to prevent bus id
contention when both controllers are enabled which results in driver
probe failures.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
index 14b299f19f3a..25e17df0cbdb 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
@@ -12,6 +12,8 @@ / {
 	aliases {
 		serial0 = &uart0;
 		ethernet2 = &gmac2;
+		i3c0 = &i3c0;
+		i3c1 = &i3c1;
 	};
 
 	chosen {
-- 
2.49.GIT

