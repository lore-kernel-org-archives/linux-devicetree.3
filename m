Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795710764;
	b=Ssf1L5vUsebzCkB0/LpaUCVXEdP/LNErCVLLU4pJ13854madczP5FZuo8j3VF6RiWKYX
	 dMpHpUJmy/pIKim8XEKHNzUrwhjSiPukcW8uwR0LAOgqTCx19DrKElUnPm205f9Udx9mF
	 UjH9VvO/ftprq32pplaSYDzTMbqkDTSn1zdQ7+vZo2iU90QyHPhrxMKOoOtJP3e1raUBo
	 R6YELicuO5pYAr64mAtNE2SGnXgUmkCpqwV1Xw36C90jAkAHh+DVU0l3VM1ZXDCmruFej
	 QaS6eHwjLsduOUYgFDc9+42ewBOuQfxjnt8DKZbWZ1QwtBd7syRhz0fFeDDmzy8hkGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710764;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
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
	bh=7E8ox+MnrurBwzs8tZUuxPYvJWezOC8MFwErFqKk/yc=;
	b=w4jI5Dcj4K9VkHzN5Ej6savu82yWwCRL6+Y4bnGYAuVcbTRmEizOA1JG2ycomZWiofTt
	 ePmwjfXMNloH1RteDVBeWrJ2jTwOewf+8rLGsyvNg2CeMt7FOpYh0Bq3ygwMFnswE6RVj
	 x1sdenfpEfYJTbuW4DV4JC2I7V3yadwgETezoLdP9uU6JCqB/0jA7ug5gIAanwWK4KXeW
	 Yk557XOgX3X2M2zc7U/jZbCqkC4uAnbJSGOKHqATWRPouA8V8LPQeHDAeDRO3PfHVuIeL
	 qQhbQKsX6C8WYd8BpLJQ4BEkxEvvpu1sDchLb99WYvMYK8daSJZOth/eRSxidCqHHPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WBTwbi5L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.63
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013063.outbound.protection.outlook.com [40.107.159.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C408606A31E;
	Thu, 26 Nov 2026 16:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C408606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WBTwbi5L
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HN3xx2io+ANCTmmfvsHwxdIe6/QdsI01yVXBrJ9wlrdEAzV/p5JRtxfZYXATT5bju4Igav90KtFof+492S+5pvygtO8WCzNmf65O6Cjvt0wSzlWoZWfj3RcV957EByt3ct7oj/atAxYqJgOQEkZ43TPgLunYA5A1lBG2ZyRMPxtEdmL/IGsDa6RCp0RkSkmbwTIPXegrIHLOrvRUAJict/QXn/kmWq89hfKUady1pRFxy62TmiOdxZdg3S6mxIySV2Th+NXZ70/DEbDQNV6VaTQ6Sg7h6D0GWix0tWheBuXvTtFkWKpz7iAUYqMx6SBpIEd1NareNzz0yyquMZstMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7E8ox+MnrurBwzs8tZUuxPYvJWezOC8MFwErFqKk/yc=;
 b=pL8zNQ1TeSRSvW1hVBrfcfjVMke0oQE5Z6gz7gnBLjuLkCl7qH8Z93mdsDSJBwIdRFsDHPlfWdKyOGuKz6Vii6MKsvlQnN2gGhdtGQpeIhaGh6nxZBeX+it8fh/FB7LCJ8eRNhLXwSUxDbDGvBfBmqqILPiXdRhLbDxxbKlY3f2pG8+I675cubjAHkkqCW+yUJI+30up5QHDOQbM7NF7hED+zXPvafUoszCtKGChXMCRCQMrA2Vr8tToFC4uyI9kQ9yJfon6OpcYIWXoxqRMqWCZd+s1PDE1C1d7DL3Qcb04+PhnarSPyIMgbG/RSY+s94lVgKYhrFG9cTXgmS7bhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7E8ox+MnrurBwzs8tZUuxPYvJWezOC8MFwErFqKk/yc=;
 b=WBTwbi5LkSIUjpQfX1wtGoen46scemhPbFl/tSk4M22seKDjtXj1uOuHYxuSxnMNCIF93JOlFivjSdLO0qZz3PBTNXgWhK3Fsoy4HzHQHBItv68j49qjokvdwQgfX7IdhlKuj5jhn+E5mNxMKoZA3t8wMsagGAg033g2IKXTnU1CG8gpan8y0dtm2a0mvyUfBOAGLR1rvlHP+CvP2hMGf0ecWc2gnu6w8/4M9FIqV+8TQNQvrHbk0ZHXvSoguVIzYb0Ej/+Uc0Ckc90F/ni+Rm8Ky0hkSjxO1qr1OV+wuf8OnZgsa16gBFiXkkjdjyHormeCa3hTPnf7gQL2pJMOBg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by DBBPR04MB8009.eurprd04.prod.outlook.com
 (2603:10a6:10:1ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 16:32:39 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:32:39 +0000
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
	Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Subject: [PATCH v2 0/8] riscv: add OpenHW Group CVA6 APU on Digilent Genesys 2
Date: Thu, 26 Nov 2026 17:46:24 +0100
Message-Id: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:510:174::15) To PA3PR04MB11203.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 6002752a-853f-4beb-9823-08df4bdae2d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|19092799006|261022105027099003|261022075727099003|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	92C13IEyYfCZt++mjSmlkfUnYBpLylAHAp7rS7XXHgYm7EDcIGzwbeDOYng+++2hMvD6PfLpAcvPIyo2UuJDWnruacZZzL+MoMJmi2YRmvrjda+bIIzLGyOc3mv9pTpxZHusXvtzn3DwKSbtvuJfxFwcpqey5rMn/RWMwGhUthBjHbOMZT2/JPBWQIu4bX7nrQdpgIlLljqfW2EjLsNIC3Kvt+ywzUp/vl9T+uAPTh4Gkog4gq2ocko29G3ZeNXTN9un4JRR1zP2ROdW6bD3zDCx7nRr8Fk/c4gi2kIqX13JuczXpA8YUlhUuZ/LI0A4fHg4x+BvF3PzjULWDbpCA7pNSMF+P42+Gm3ut8P0/AaGVhJgKppFBAfdOhxVfW5FbLL9kODgPQR8ZBOVoxAGUK+gUujWi370hlBUBe6W69aQzsFgV6lfBZdBHwUlQWr/QTzCS0RZrGEhKLxhZosQNt3ei3ZjYyCWKJ5AuFlDMzDkKkglxlib2j9WdyN6I0G5BN3z8i4J6+OADYJ6Ma3dR4i0MYHg34FCdeFxvIB/g3ueGTAUCifFdeqsE3FQdZO/M+TloSv85MZ+8tf5zO2pGFljE1j7+WxCyUtvGcX1HazAnA9OmGIkQyTSKs3+fUST
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(19092799006)(261022105027099003)(261022075727099003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O1hENbe6Sp500eP87vVzmHKWdV/bZEz/GdNckTzuXg5nI09UsbYJP7xB8fdb?=
 =?us-ascii?Q?S45+Q9qafk2U9Wsi6iouv4tcRHgGw2HtOssDLqdtymwvDTRw2dK3vJAjeaZG?=
 =?us-ascii?Q?OV/dGALqYRrn7zbASk7I2QlNxX+PXHDYvGX+vfiC59/Szh5FDXRFeiYdNMzd?=
 =?us-ascii?Q?geSCkrwbxj4XH3ZVscB5Um+jZ/Bbe45URlrMjgzOJ0e3B60pHnoKqM07T8z8?=
 =?us-ascii?Q?R1vgLPGXTJl8nrTqy+8rBAQiJ+ohZCcatHH1Nsj/r8MbmGsl8NrH81KV4In0?=
 =?us-ascii?Q?82QvmHTJuwcJJKtobzJNBxrilLLSZkEHF6+xagdc1lzal/9gtZLujv25OL8W?=
 =?us-ascii?Q?7QHJx7KC8oBGw+1kWFvAq5PfG7Y/ymcjEgbKk2J6RySZWUiMvYn18ILaOuJW?=
 =?us-ascii?Q?z8shGRcLLTWlka1cg1OLVBnh3SpqYKMkTul3287AjKLl//vszxYvVK+t6fAT?=
 =?us-ascii?Q?u/D4m9vwbBG4GIhio9CqruKTZLknPO+HPq9cZ/6OeJIhYWWfZLdBOIl+yETE?=
 =?us-ascii?Q?ackrT3NJvMsblU44qZ3jp4OjQCdl+qSne5sUD0T3ahsMsIcrpZC4VquD7pE+?=
 =?us-ascii?Q?/nJnp9ITfIMJMgssabh70dajR/ujVHVnGgchhyjdBJQivkwGpf1urWFnDsSC?=
 =?us-ascii?Q?fVU8g8trKIleRJlN+zusvFr7anEfphn5zJuRjLljXw5b2A8gBpH6jmm4BOCl?=
 =?us-ascii?Q?/gu333nVU9SsQtxkEO5h9DrBJ3uc6iZqIRtgWvQJC2MY6MiPQH0Ju5PFBtdc?=
 =?us-ascii?Q?I0AF32D7omBVfB07I9UXAL1D0pcqYSEDPrH7fvSdMIs6B+/8i+cHMlOaKy+M?=
 =?us-ascii?Q?aRp55TP9UQ6bKmIUWua0u/f07j4s4BNnJtGDnlogyStj7nWKN7OqCX66i4dJ?=
 =?us-ascii?Q?cyNzmmMB2bNPT2XNZc/5fWyRKGIQ0ERTBH79ghHmXl5ITUT+wSZQo1Ssw0J2?=
 =?us-ascii?Q?2DCF2HEgN8vbXR5p1imRUGuyd7fMqA0b0PEneGdpAGCIbRt2VCE6CvXIHHzc?=
 =?us-ascii?Q?EnXllTdLap1YXML6nN/y2whYUYhbzdhOJvYbISsGknR2ZEkHBDtLofN20KTE?=
 =?us-ascii?Q?7LF/8JBqGR/ohLOEO3IX5MWlAHlHN1hoBpXxKFPzpYGW3hauPgo/dR2uaA7o?=
 =?us-ascii?Q?houanzLv3kRAO+Ho39nUC4Bf3z0q7UyGSJdZhR3ZNcPDw5YvkNXxuKU153UR?=
 =?us-ascii?Q?BhEYAB6A7fwGFsI2Mruw1RfIcwLjWR1U+zb7NcUr1QKY/32jj1v2K3HC+GJf?=
 =?us-ascii?Q?7rsne0AOZH2FdGg4OoxE0UApVtndcUiH7CRVS2ieVDjtpE6Qb+307r9AkLET?=
 =?us-ascii?Q?H0zl3JjvB1DOlLX/uKilYTq24AT1DUuOmWdfQg8SCLb7Bp+DJIRNaj57eAaW?=
 =?us-ascii?Q?pOuJ3e9uVAM5vlnOmq48w4MPHhCxVx+cbAJ/+7dzTmF7NedotHq/KqSebtJA?=
 =?us-ascii?Q?lQs7zeHyaLNbzaU+7WUUss/6/1bbaMb2jxnPdv289Eflxs07BWRbOVkCWK8/?=
 =?us-ascii?Q?sV1Gdnl1KtWLRjxa/QipA5cZtlRQIu599CC8apwq3Au7HESXX6mxbVgYSh1y?=
 =?us-ascii?Q?N1pOCf88FuJL2poj5UaGMaSqQ4swYr6TJLGUIGUfHtF8YmtCACjbTfNDuf3A?=
 =?us-ascii?Q?RRzVlSDE/T+TAldVziwTPZZfIOU2D2KOYvtxULN8wBbfqmV3LLwKBCSZ1E/t?=
 =?us-ascii?Q?5wmNzSzkgxOKEbgAf++oUVNlgxi1IxbnRq7Ig+NpQqUt0aRJlfKi9k7pshay?=
 =?us-ascii?Q?eA665Ja/ZORuQLTVgI9XD5c4jzmF68E/lWBP91pWdmViBjeMgPGwDx4Riis7?=
X-MS-Exchange-AntiSpam-MessageData-1: QCuu2UyEO2DYew==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6002752a-853f-4beb-9823-08df4bdae2d9
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:32:39.5345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xnj2r23MbabtTARuqaNTS9qK15Y4w5i6n2TvM6VotnR/wUElQkq37gkNZRAbsSUA/VyLhvNsQyN0eGVt+s8/N4NbfdmzvMgZVAI9uNwpR/E+Gx9n+NdPqZs8ZmKCg/KA9r7dKyCihpqDCT8NGrGC1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8009

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

This series adds support for the OpenHW Group CVA6 APU, the FPGA SoC
built around the CVA6 core (https://github.com/openhwgroup/cva6,
corev_apu/fpga, release v5.3.0), running on the Digilent Genesys 2.

Both configurations of the core built for this board are covered: the
64-bit cv64a6 (rv64imafdc plus B, Zcb, Zicond and Zkn, Sv39, 1 GiB) and
the 32-bit cv32a6 (rv32ima, Sv32, 128 MiB). The SoC description is
shared in a dtsi and the two board .dts files only carry the core
specific properties and the memory size.

The peripherals use existing bindings: 8250 UART, Xilinx SPI with an
mmc-spi-slot, Xilinx GPIO with gpio-leds, SiFive compatible CLINT and
PLIC. Patches 1 to 5 add the vendor prefix and the compatible strings
these bindings need, patch 6 the ARCH_OPENHWGROUP Kconfig option,
patch 7 the device trees and the MAINTAINERS entry, patch 8 enables the
platform in the defconfig.

The lowRISC Ethernet controller and the PULP timer of the platform have
no upstream bindings yet and are left out of the device trees.

The bindings and the device trees have been validated with
dt_binding_check and dtbs_check. The v1 device trees were booted with
the cv64a6 configuration on the Genesys 2 from U-Boot 2026.10; the v2
changes and the cv32a6 configuration are build tested.

Changes in v2:
- Collected Acked-by from Conor Dooley on patches 1 to 4
- Patch 5, 7: version the board compatibles after the CVA6 release the
  bitstream is built from (openhwgroup,cv{32,64}a6-genesys2-v5.3.0,
  openhwgroup,cva6-apu-v5.3.0)
- Patch 6: drop the list of supported platforms from the Kconfig help
- Patch 7: add a clocks property to the cpu node, replacing
  clock-frequency, and document that the 50 MHz clock is the output of
  an MMCM without a register interface
- Link to v1: https://lore.kernel.org/r/20261102141727.640769-1-marouene.boubakri@oss.nxp.com

Marouene Boubakri (8):
  dt-bindings: vendor-prefixes: add OpenHW Group
  dt-bindings: riscv: cpus: add OpenHW Group CVA6 compatibles
  dt-bindings: timer: sifive,clint: add OpenHW Group CVA6 APU
  dt-bindings: interrupt-controller: sifive,plic: add OpenHW Group CVA6
    APU
  dt-bindings: riscv: add OpenHW Group CVA6 APU boards
  riscv: add ARCH_OPENHWGROUP Kconfig option
  riscv: dts: openhwgroup: add CVA6 APU on Digilent Genesys 2
  riscv: defconfig: enable OpenHW Group CVA6 APU support

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   2 +
 .../bindings/riscv/openhwgroup.yaml           |  33 +++++
 .../bindings/timer/sifive,clint.yaml          |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 arch/riscv/Kconfig.socs                       |   5 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/openhwgroup/Makefile      |   2 +
 .../boot/dts/openhwgroup/cv32a6-genesys2.dts  |  30 ++++
 .../boot/dts/openhwgroup/cv64a6-genesys2.dts  |  32 +++++
 .../boot/dts/openhwgroup/cva6-genesys2.dtsi   | 134 ++++++++++++++++++
 arch/riscv/configs/defconfig                  |   3 +
 13 files changed, 253 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/openhwgroup.yaml
 create mode 100644 arch/riscv/boot/dts/openhwgroup/Makefile
 create mode 100644 arch/riscv/boot/dts/openhwgroup/cv32a6-genesys2.dts
 create mode 100644 arch/riscv/boot/dts/openhwgroup/cv64a6-genesys2.dts
 create mode 100644 arch/riscv/boot/dts/openhwgroup/cva6-genesys2.dtsi

-- 
2.43.0

