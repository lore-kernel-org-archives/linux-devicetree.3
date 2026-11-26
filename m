Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795710784;
	b=1IDvMwBs+B65V64ZfZoE46eVY+ZKbf+gDW7MoDJldMQMG1Bp/8sIeQqyAR9sAmLqBAo4
	 0dfCRX7sJqxSg78WNzGAlQv8vLVIaIkftTTbqLfsp2OXEJS5ssvTn+y0kIOIVcQQQDaH1
	 cW1sK2gxs08/ZqDxjYSVUqmmnWjSShXuLsTKP7mLB+017Cf+INMEAj4Ey3A7V6Yvydf2t
	 UYBVd7ntV/lag2Mm0tFqm69QzBpYFi3T6Oaeqcwu84uq5fQLHbbH3YjBj5kJzon6Vb2a4
	 LPjRAOMDrCPVQumQwOMBW9+wwSUePeKb+zyZDJeMrITVb/xKCht40xxAI9+P3QochFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710784;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Wud9CsczKlwsdxq3gvuJrgC/d6nrCE/UZKWx864Z72M=;
	b=KLM4YaGzbYw2ey+yB/mrDASxXKFhyIDa/JsrUD0fjagLbt8jhSQFIppV2i4UYplkwNg3
	 yPurN9ZKksGcNymrfsRwS5QtfLailC1KhyUlHEg4jxU7KdzG+aYMZKSUk/PIBZpp6KMCD
	 sZZGtRWm4wUdtmhLMdv1rmIAWOarLUEcQYsvpZCn2YlK27n5dXwnlRe+joaGJDeKfYdpz
	 Q6XAF+V4ohEHGtsBhmTWlgqiSduEoFaZmcffyM/pPyfczz4roqmUY5InS8gbshDJZQ1wN
	 IaW313UYFm51pl2ub6CQPMBEulfEde08iZ0Lc0bm8kzjI/1gCE+DWIUcD35sANA01lA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Lm36RHxJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.66
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010066.outbound.protection.outlook.com [52.101.84.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26FA606A333;
	Thu, 26 Nov 2026 16:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B26FA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Lm36RHxJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLWK22wsu3BHXM+TQu+SXM85ktBfBQ8gxzQgQjtcJ+MhLn+zai0KNi4R2rnHsgnfQ6lMtft+K+BVn+xfUAyHIwDqMAO1F+L6dn/3ubl4oC7BPN1ikOQTLc3l89jr1gpyQvlgQfwlShpmqF712RW4RQRnW1plm6QLJ/QWMThxdva82qB1yNvAXkYQdpnjvfYYYNLPclZqbJ8knvxFCcQNCHxbcGlQdFL5hqADEiuRqAbv83nDuyqS20nHuNammJ3m7LhdHH67FqAqb0uGmcsvXFfon+3yPhdJiVA93ecUBfX1r+H5jsBw5TGHCVgunbFIM3b6TlOWbrCNP4UcGnwr7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wud9CsczKlwsdxq3gvuJrgC/d6nrCE/UZKWx864Z72M=;
 b=fr3dkzSRd04O2BciCwb8neb0staHFr3rDJRdnjzNHpqM5iuv9gweBNRWRD7GPAaRwl8KNHYbm/bJm/7d+nFvRNvYkB8+jo2gNeOXhu+5W94ZFazcYuQdCJjvhM19fbcFUthwAG6gs//YCdqtYF6y3OlrlxuvzCRUjQ28Tb+ssaTcyqvOlzBCsS1kGxSuOuomreRgmtp2aCsPS+YzKyWTneaBchq3A1nzM9wUrXYce79vweHyMkXrLviKpAGz3oInV7NTuia29ylxQaKyNYoKvDq0zXiPbc6EEX7XXtLr/jf9qxNFjeDyJ4XfISarJqFPrMN6+Y4w24YBlzPPir4Dyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wud9CsczKlwsdxq3gvuJrgC/d6nrCE/UZKWx864Z72M=;
 b=Lm36RHxJz0Xb5YFlAOe98ninJWHDGgMGwsqPnsm0fqVjSz9jVpNge4lvmTQSv4Fyb1a9gwnii0Fqh4AxiMaMEjD7uCUC99WB1u48QZFueD175eEuFQs1oOmu57Y05QRKR0pKfJqeLE5tfOBY7PQ+0AFNlrq9Ay5UKz/+7xFRK6QyS3gNFNGnIG1Jj24ejHzY9ieLD0TYP/1/QJpMBUoqu7i34ka/hDab9Yynef5VtiHEPDaqum28Ot12IpMMbrHDcpOIUWhOBAsnaKbplyygBObpCRzKIGw+nfh7vFL3LEbQPNzjkBIhRQirf+OfhDbM+V+7GK4EGD7zJvaPDpkFRA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by DBBPR04MB8009.eurprd04.prod.outlook.com
 (2603:10a6:10:1ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 16:33:00 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:33:00 +0000
From: marouene.boubakri@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/8] dt-bindings: timer: sifive,clint: add OpenHW Group CVA6 APU
Date: Thu, 26 Nov 2026 17:46:27 +0100
Message-Id: <20261126164632.978624-4-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
References: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P222CA0010.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::8) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|DBBPR04MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: 279d0045-1c01-4da3-904f-08df4bdaefb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|19092799006|10067099003|56012099006|11063799006|261026121527099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	LPuJK3WbpV2KYUbR2bypmU9/1PtCl/cqmBCaMhivxQV68eIpGloYZLOWv+16xLvVYilW7OdN+Xq1QsOd33zYaC8RIyoBqriXd3tJUBlJBv3wmGPW0rzVUEOW+7/F1g2zqdk2qTh/2PcS2QXUwU5e3wGVvrBL1YU7tw/ms4Tdhnwn3wNvK6RAHVWaSiZdGKZ4kXVJ9F6Vbmuo4VXPXwyvXMb1i46oDyPPGqS32oALLhDb1BSrGujPEA2B+TU9HgqGwgJANM/AvvxqaViglt49BBE/JwlUnlwB2QQyN++zWEksHSCxxHeyctDQrTp1hEou5GEPs6Kt5S7MD3QEgpEg8siMG63nl21NAV11sxggk33Iz/qh+lbV01zb6YdIla7mXawe5JzZ8I+oW1fyvOhVoA5L1YpN5gCpex+12FYjewlpAjLrYIBNEEAW0VxcRFsTxOjQLhd/SnxlP1742a6HhLMDJ+r8Yh8ps6nloibHNKHdCu4XjkUSn5U4EqLrE3DPnAzHbN0bNG2EIiEmrx3VMlr2XB02zRmONhZ3pH3GNqJiRPbblcOZjpO1DXE3zvZB1HjRA5GD4jGwqn2uNF0Auqfny7MQqg4Tgg5N8CQ2/23i3QvbqR1vAtWzywrNx2HUDchtfYFPnclu9uAodKjAYLy/mFkf3HwDhqc2sM1tMkU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(19092799006)(10067099003)(56012099006)(11063799006)(261026121527099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sftS7DC8FDq8xsivINdLv+sc8yxVhCIHjY4tgO3f0ZASDA+xmnswD0T/mosF?=
 =?us-ascii?Q?8abmnWXnz5SFzlUVDGyv8mc6fxQcPNZu7jw0LBEbhzKPPp9PjEPuJPfWMdhW?=
 =?us-ascii?Q?ruhU445JfliZdZJYt3GeD32Hl4STb16Bz8fYBpQape+ryS3oimagGrywyvem?=
 =?us-ascii?Q?76zA7zikK/XSGPKgkoPQT+ZsPZcvB3EIDNkL3spDPDcECBMHhn8axAozEdQ1?=
 =?us-ascii?Q?9zfK87Y+GHin5c2zF60xtugj8JUZuBncgEdwhesqQtxZi8f2w7jO9+qJ+Z7H?=
 =?us-ascii?Q?K7BBkGNgHtAOpUUXeY1/L0uJ+r6IRM8+TYRwbT9fgY6c3PbPYmTdYxy/UO6M?=
 =?us-ascii?Q?1O2ZRMwZX82Iy3NRA0PvalcjzEL388v6a4LGIYu0KUToSjVXmVcGQszDMB+O?=
 =?us-ascii?Q?oymouy9IM/54SzzttAeZnL3dtsW/uDYoFT8WwFo9KY7rwrrPosE/1xFtJdma?=
 =?us-ascii?Q?Xwkcg9LdFdfpe4oFamO7YTYM0T7pEiWyx6wSbIUJir8NpA/0Qek+ssE9mQqX?=
 =?us-ascii?Q?XlpovGr1HUGQ0ct0UlDPxhYJTw3ZSapmboUDSP4wk+ZZjdZ5dpCIuiiWdtH8?=
 =?us-ascii?Q?5+beIy2rSO1Oab91Tk1nbcMwHVyAkzdzM23qxClkhUniELvgiS1iSYuKiEmg?=
 =?us-ascii?Q?F0nwczC/urB132QTA7oX+szeWC/5gVVShhSkjrDvcF28znHQj5UEKh7/k7JH?=
 =?us-ascii?Q?dDJecQQY9R+95F0sYpLy4IupiVJbS5AGD3DQJ3MCoTUNM3ymlMLHl1i5R4FX?=
 =?us-ascii?Q?X6r+1nKNt1ywqOuKhhrrKp19tcehRbzYYnb985GUIJG9JxuLevoXB5ksogtg?=
 =?us-ascii?Q?Y3L3V8q8avih9cTPnjLiZ2zbi/2IkSfgHSuJzvldZZz8rD2/nIZf+LiiDPZ2?=
 =?us-ascii?Q?MRP3zKsXjpc8weVLHPhqC2ahULtFJ77XZGKjAm8W1HdFd0mibshlbfZtCvC2?=
 =?us-ascii?Q?TqglZjEBM56V8elbk0kDisSKaUvfMDE2uVh/tQmH9VDrP5bTvM/x9D3XwQGp?=
 =?us-ascii?Q?x8JyT9VSZtr8GLgo3hCzAYPct5WOrT/8Z7Z+/Cd9UnMLeAfOneZbtiS/RzQL?=
 =?us-ascii?Q?qqNWljj0QBkQwr46XRkCpYHHpygJnUB/oYvNtlZZDbqJEI1mgayZ/UPxgXQ1?=
 =?us-ascii?Q?qw2s15d6Pcl5UakVhyhJzobv0zfvo4faD23FDKmpQBRwHFWKSB+Mah3VVS8D?=
 =?us-ascii?Q?2vRjBMt2GuuNYF7jU2VSP/C5idRkDxKgN3yJhWTi27l+2OoBptuxYA83mWMQ?=
 =?us-ascii?Q?G9qQdcva9tZEPiziX9q9XElUPTJodYdh7yGWjucIAa8yihimxWLW1CsIo77c?=
 =?us-ascii?Q?i8j4tkZ40b9Z+oKfzQM/AIEVDYrM4eqdXBo35Yo59is7nsaMqSMGvTWnLw3v?=
 =?us-ascii?Q?Jl+x+JLVMquewrVtHjMyb9ANXy8nq91A5FS9RNSKNoDCyStEi4vZEjntk7ui?=
 =?us-ascii?Q?ZpE0ZArVD5QLdMQaGir8H/7fIyJ/CzA5n7di/K1XxKTxPa+t3ELv/UrnYNrg?=
 =?us-ascii?Q?7yPcODqAzkCpC/CGcKDaBFltsAYv68lk9e5/ixNL8rsYNCasCDew7VIGSF2O?=
 =?us-ascii?Q?ePbMD7TBp0zA+Hu0Bo0CuqMyzAoDOlRROLcUsC7VD2WlFgnmdR/TxpI+6LK7?=
 =?us-ascii?Q?xCYfVx/209o3pfE6CPwmgCUDddpOIn+4R8afs+0ZVEcHkor+d7M3eq8pEwup?=
 =?us-ascii?Q?OYt9pU+bJz0oBf8Kd4uzbFNdcn+qCMFvF75J6rNK7NkzaTZvYjadTaTr92WY?=
 =?us-ascii?Q?ZSM7uUTXIyjaVz8EjSi0jVzpRuHfmxnNLNH6K6V31omhgSffugR+OpEO9gtk?=
X-MS-Exchange-AntiSpam-MessageData-1: qSpNTYYPc5m0uw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279d0045-1c01-4da3-904f-08df4bdaefb5
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:33:00.8690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OC4ZCmNiqd4xaVTu1LBosBgwkz0s46HbhTPk5YCsp1cwUOCXE3zm2/hClOV4SUBz/8nEcgFHNn8LNXNZFCiS5Ivc9wN3xW5Z97+3rqR1RZcTkl8p8dYsmYRXuq99HW5Cn8ZF87X4zjep7xypT4qDkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8009

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

The CVA6 APU FPGA platform integrates a CLINT compatible with the SiFive
CLINT v0. Add its compatible string.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

Notes:
    Changes in v2:
    - Collected Acked-by from Conor Dooley

 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3673836e14..467a1e26de 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -32,6 +32,7 @@ properties:
               - canaan,k210-clint       # Canaan Kendryte K210
               - eswin,eic7700-clint     # ESWIN EIC7700
               - microchip,pic64gx-clint # Microchip PIC64GX
+              - openhwgroup,cva6-clint  # OpenHW Group CVA6 APU
               - sifive,fu540-c000-clint # SiFive FU540
               - spacemit,k1-clint       # SpacemiT K1
               - spacemit,k3-clint       # SpacemiT K3
-- 
2.43.0

