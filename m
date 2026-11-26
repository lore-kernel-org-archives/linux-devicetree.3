Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795710769;
	b=DuFmcnB74C51o0wGn4/ml4IVkliQlChTO3rnn2vFSVa+ho6rK6Qm42nnC9b25e3PtL1Y
	 xSdzEMzb4RX3S9G+39WaFCOuJhHxKfYaBGWUWGj7r7PkjH3YvQxiHxVofStZX/iax02e/
	 au8SJgKxdGyhxoNc0PJpXxrqZoCs1oh6CJzopPUfO0NbaRTFAtuFw5ykJ3rVneH19qWfh
	 okXWc5+PU+1U1oUW9VUjlXzw6scZUK37ubSJUcnmNveNyjsrZR5/kqb4uvsu4vXbsG5y5
	 +ETyK1xSYD5PaKij49EQSOrAjr0PwolL6/iNwKcImRICJUHVcU4D1Art0VZ4O8BKiYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710769;
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
	bh=BZ4NhnX6sDN2xQmw3EiYcPgjuD/nnofiZMDAwCz6Ags=;
	b=wfz6wC9uvlk5Jaqer80jib5VgeN58Qnzy6Gevvd31IinzPHHuISByjdFSycS3z8hIezs
	 18d0nocAPoMmb1HUwfRGufHyjFMpNtr8G0FRL2jh/1C13fqgjYRF8K140Sy+56QL0zG9H
	 ANcGoTHsR2L+xev6J3B9G0lIhKj5DyunRXPGLXJ8C4uFLcF1aXtU4xE2mwJ8Pn27y1404
	 UlhzCBNB9h/4s4p3szDq5x9ru/XY5be8GczVUwZynErPcQTtI6RBddzIOqR/lu9NUitQS
	 DZG6xXFTjvUiCgX9quwAaM18umLMF3bIl3k09xLaGR8d3cWw/cIKrln5AlxckBZc8Mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="JVCR/lyd";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.7
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013007.outbound.protection.outlook.com [52.101.72.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C5A606A327;
	Thu, 26 Nov 2026 16:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C5A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JVCR/lyd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/bf8cIkVrDk1wCApP0W3gnnNCe/k5kxrhccMmpxjzblt64NyKjlJzN0wrBMb63nfs2DbdShdBRHnQfccwvoezE3sJzSIf3XNPDnTtv2cbpCd846fSyMkLzAA21i7Ob+mijIyEZ+Ec+blt495cNVBql4RY2tbFHcCHOQjYjOStqDJRlVhj9HkTNjcNbfMCObw+zhYCsy/HJAujAxRdv8tMBIvINMHpXV+NWQA7DyvOwMfG5NWBrR+o9mjCKiw9xBdm6jS/q10jaRHMdTrhcwZgfAn7508XXqPmxpVMLvzOA82DLna1NOwl75yZ/0u8+sSFP4+dnHOMeaPbSn/fb/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZ4NhnX6sDN2xQmw3EiYcPgjuD/nnofiZMDAwCz6Ags=;
 b=lNoy5n4d/fEzrRNl3tXEjbRG5OfRj9IbvEUpyTRjE0detWTVmqbQMmm28OAIZnjPbS7ZMvhUgDWvWJC5wdWj24wc39DBGz1Iw2swHD6vORCPQBAmlIJSpoylnK7UzZJtM0Y893F+MHoWeurkQW68NdUrYBmvJxBFoniyheCCr5WLkYneuMnbxq5LSYL0My/Icj8k8W66Z76YUmSambjQ1ro53mby3aJ0ZtFNzV+LEVo6CZNO6YsIgto+goQhRK8iTrIL3slmuw//XfrVonP1gfL1BO4bJWxeQhIpB6k4JuyQTmikSjNyJCgCdMGm1Z9XoDpzBcihd5TFBQ7RcA6BBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZ4NhnX6sDN2xQmw3EiYcPgjuD/nnofiZMDAwCz6Ags=;
 b=JVCR/lydQNLiDfBsumznz+zHDR5SLF8MyWUbN7+NFtR+JhfqIkc/j+SjUpbHfRlNBQk5RUWdiI4/yljVvTRwke8gOr80x6CiqJol24nG3S5smEPJFXZym+xVvSTHT+7rDf3YLIFwG24yPhkYG8K57ycOta7eADjMlUjNmPnf6XKpPzGqohZj92a/ajVzWjCPlq85DWgZWFG75UVFdEHLYH3qiGDT5NcZF8xx1/5IJA48qY606hBT9XxGW4y7oCbIr2pOdRDRqoVpVSPYV+qH7QZHDQIMgwlXe/JASgbVIR7V3bnbiK6ZFySCMhh/WDr9fcvsjEMLi0hrLV32Yn9OZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by DBBPR04MB8009.eurprd04.prod.outlook.com
 (2603:10a6:10:1ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 16:32:45 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:32:45 +0000
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
Subject: [PATCH v2 1/8] dt-bindings: vendor-prefixes: add OpenHW Group
Date: Thu, 26 Nov 2026 17:46:25 +0100
Message-Id: <20261126164632.978624-2-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
References: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::9) To PA3PR04MB11203.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 0de58a6d-547c-4732-2285-08df4bdae6a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|19092799006|261022105027099003|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Q4qlv20g5W2mWIl7G54F+gi8c316bQBLvxge2UiFaY0PvxxqujR8bTQa+otCUao0zo5ZbyLKI7cyMt71AZ3NY82Av4LsNg0DW2WA4avly2OB8cM2pB85V/UN6gCFaBbYrR9rpgqmTfiQQ65HjYDFGnxbTVk9mimzYt8O3gp37v9YiB9tlCcvWFFmuYoM7X3Rwf1m440M+lTsvjjrtw/HOWO3apk/JtqAYSvst+qFhg1rmM7xLX0VSZdVha7mwBKNFrmBjIT6DNRp0S07yAuwAeeVghhnEVNZpT+9IYaGLK9dC3fF2XjMKYv08AUIWPQOkDhUu5FT3P1tpwvvIxLOVaNDuC+Ivk9q2Nh418pA3voHUAIqvVFb1skB6t2jiLaq0CSGS/add3wNaF3yhZQB/abbTxCqyvG3WMJQhFqkihPnNq/B4mhnEHRfdnJjqH+Mg8w78faPOgEUgPuLs9OhpGPab01NbjaCMU9KPItft7hUmlNEQlWwrA2b62fuAITgUQ187qZ70rFaOaSdgVWrVuXNqmlXxWBWrYE0T/AiYnl+snPC7hBiCm4giL2KKMUGyOJYv2pGOZ0kZ8I7yUhwmpxgmsCX27fvma1EbT5LRRw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(19092799006)(261022105027099003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?55iyj8WAEHu7uLMFmcKSIu+S9+o9u5nCkHcb/B66PsgNJbTMcvRZQeJDIIFU?=
 =?us-ascii?Q?7IzE2kkuXPYO40n/p+Iwh7ubap00u0aQ1VXpp6gnY5rMe8UONqhBQ4rLFDdZ?=
 =?us-ascii?Q?hcjSxfZ0MlhID8aIc+j29NSsn1vU8xc/rYDUtz65L4S/hRz+IrsfYK8TsRkL?=
 =?us-ascii?Q?1L4HMU8Gk4q01XOSmCQdR3jXGMCdfTQCiwPFNzUvpjQicnRXFkWlPs6fw0q9?=
 =?us-ascii?Q?y9L4vRB5ULeyMptnNtSLue1XB0CVR4wlgqYvwDEFrN9p5VX8CuS59Lajlex0?=
 =?us-ascii?Q?+JD2c4Unb6H6HhdBtk4pBMHyl3CuPbw5DaxbjcW0rwwywtO358EN73jXoMQJ?=
 =?us-ascii?Q?MGfZYdIYXiLcjdQPD/aHTzQ0o80omRQcCvhL4lRQSA2W168qZw1ETnqmi7x/?=
 =?us-ascii?Q?BKi5sun/ytzX4EnrxzUdXZR1dP/Siiwwmm2v3Lfp5JfZlq/5ApvcDNBzK57a?=
 =?us-ascii?Q?aooYUEjc8ppBkdymHAXR18HUtgdnlxehjS1QbDnlaftt+l3B1Wc8szt47w4y?=
 =?us-ascii?Q?6IA/az2X6RKE3JY0ZDMN17UU9+bP3LxvelOo2N1uk8cdyhUITwRla+9B36pU?=
 =?us-ascii?Q?yjQx2O+wjFa5V0JdH0LyIjPHp+XZlkV11ClFOkycvWuV5hyYfxE2IgYCvZQB?=
 =?us-ascii?Q?IUpo3k074F4FKm6I4zFwwAVw65pyoqcC1bbShO32ZUHSEZde6Oy4ENWF9mD2?=
 =?us-ascii?Q?BB9iC6Z7Sqhx2drW3i8E6tgU9RBWGgvoLA/bZmIF/XjvJCp1ysuRqh6J86q8?=
 =?us-ascii?Q?zhhpqEikbDMTe618OASX8BLK3VLew2GgyksilAL8vxWV/W0+P+tiDVn12IkX?=
 =?us-ascii?Q?uaINEZroQNZ12XA457+AL3SdyelialAe/MoBWQvQIGRWFCIdoBSjfVdw6LuI?=
 =?us-ascii?Q?4n73NS20q3l8WJB+EvUwjDxFdPvXq6jCu3UkStGBnoLy+WnjlRa+q8T2xmq6?=
 =?us-ascii?Q?gc8trtcZl6J0tWwm24SyfKSRi4j8PyomccKu94kYFU6zPPdxt+ZCy4rkVNbi?=
 =?us-ascii?Q?kvyfb2DG9RLY9NPfmbNgA20ReHnpCIETBMbS3TeRdlNN9iPaT6F1F2rvSv23?=
 =?us-ascii?Q?i4AQfM5cEut2IprnbYF0SmUmupRgWME9/KH46nbruUkNtRZVA95aiPCj80MU?=
 =?us-ascii?Q?+aoYWMMSsklogRXeR9PG1O7mWNlB5yf8/c/+OuCfhSdkFJYoMohmiQ/FO5dd?=
 =?us-ascii?Q?m07wPbKYP7rX5vrMZE6RjChY6SjAKDTSkWiJFPpSGXmoEB6qLYTdHfbUshWO?=
 =?us-ascii?Q?sipmYLnm5j/5Ogpvu5RWOAqqSVNE2UKUIuHnIpIUQ2EH1YXyILqHEue4Bhgv?=
 =?us-ascii?Q?hTM16KlJS3ly123dIUzeS1r0dpUa+NqOMSY3MBhsco5VHw0a6rta0oXAG++S?=
 =?us-ascii?Q?VLBA7iXxz9JTd+qpGsRbGhbyfoKIsvDKIk6BHjYRYd+c98hRQqPPFoQgbkjY?=
 =?us-ascii?Q?xbvVHIWQJuNOmC3+RhvWAsqVHOonkO7rglBVPNHlRqtVzXF2XZdaZjYuAA5h?=
 =?us-ascii?Q?UKCD+EwvFW9vULnjps5g3Lkl3Dm63eJhxn0DfXW09iypx+/9JyG7BStpY1RQ?=
 =?us-ascii?Q?OJnyklwDkaMIlFXCdp9BuBjEqSMBdGcaNvLp/MjTFjTJaYGQwB6jLIcWzhur?=
 =?us-ascii?Q?PrtIBZP0+vWuGhPBRsKOWj93JzlnLLSkjAoYYlnn6PCFIYIzGKrQJT+qvgUt?=
 =?us-ascii?Q?QW4rdQZObJAVdKMTURNofwN4A0X8bJZfhpXhRMKzR0qo9yENrWUnbzmavlgv?=
 =?us-ascii?Q?RF6dVUcF0vMb1+iGAq6dA9BHKtN4wT6jW+cda19tEaqX+VrXu9T1gu0ve/fz?=
X-MS-Exchange-AntiSpam-MessageData-1: o4PPNabJNshcMg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de58a6d-547c-4732-2285-08df4bdae6a8
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:32:45.6213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGXKLm604c6/EaWHhGlWA6JSSTMWJQuYdRMvu1/p0Km3NwXHURmmku3D8YVWxXuwt7q/E2QzCOM0PiKZ0nO8TQIap7TwFjO9WCohzU+2Yb1EulLq0N61nrZ5lQW/xHoJ/BDUdE/ivCghv7e5YYR37w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8009

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

The OpenHW Group (https://www.openhwgroup.org) maintains the CORE-V
family of open source RISC-V cores, including the CVA6 application
class core and the CVA6 APU FPGA platform built around it.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

Notes:
    Changes in v2:
    - Collected Acked-by from Conor Dooley

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba20029693..82440d498d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1263,6 +1263,8 @@ patternProperties:
     description: OpenCores.org
   "^openembed,.*":
     description: OpenEmbed
+  "^openhwgroup,.*":
+    description: OpenHW Group
   "^openpandora,.*":
     description: OpenPandora GmbH
   "^openrisc,.*":
-- 
2.43.0

